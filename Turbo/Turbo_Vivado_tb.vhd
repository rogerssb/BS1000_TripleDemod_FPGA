-------------------------------------------------------------------------------
--                   PROPRIETARY NOTICE
-------------------------------------------------------------------------------
-- (c) Copyright 2014 Semco All rights reserved.
--
-- This file contains Semco proprietary information. It is the
-- property of Semco and shall not be used, disclosed to others or
-- reproduced without the express written consent of Semco,
-- including, but without limitation, it is not to be used in the creation,
-- manufacture, development, or derivation of any designs, or configuration.
--
-------------------------------------------------------------------------------
--
-- Company:     Semco
--
-- Module Name: Turbo_tb.vhd
-- Description:
--
-- Dependencies: Top level module
--
-------------------------------------------------------------------------------
--                                DETAILS
-------------------------------------------------------------------------------
--
-------------------------------------------------------------------------------
--                                HISTORY
-------------------------------------------------------------------------------
-- 4/17/15 Initial release FZ
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
Library UNISIM;
use UNISIM.vcomponents.all;
use work.fixed_pkg.all;
use work.semco_pkg.all;

entity TurboVivado_tb is
      GENERIC
      (
         Rate        : integer := 2;   -- 2, 3, 4 or 6
         Frame       : integer := 4;   -- 1, 2, 4 or 5
         ClkRate     : natural := 240 / Rate;
         ClkPerBit   : std_logic_vector(15 downto 0) := x"00F6";
         GainIn      : sfixed(3 downto -8) := to_sfixed(0.0, 3, -8);
         FILE_LOC    : string := "./";   -- RAM_2Reads is in Vivado common
         Iterations  : std_logic_vector(3 downto 0) := x"A";
         ControlSel  : boolean := false
      );
      Port (
         Clk93,
         ClkPll      : IN Std_logic;

         Pll3Ref,
         SClk,
         MOSI,
         CS,
         PD_n,
         Pll2Ref,
         BitClk,
         BitOut      : OUT std_logic
      );
end TurboVivado_tb;

architecture rtl of TurboVivado_tb is

  -- Define Components

   Component TurboDecoder IS
      GENERIC(
         FILE_LOC    : string := "TurboCodes/";
         DATA_WIDTH  : positive := 8
      );
      PORT(
         Clk93,                             -- 93.3MHz Clock. I divide this by three for internal processing
         Clk31,
         Reset,
         ch0En,
         ch1En          : IN  std_logic;  -- Valid data is active.
         Ch0Data,
         Ch1Data        : IN  std_logic_vector(DATA_WIDTH-1 downto 0);  -- soft decision bit sync output
         Iterations     : IN  std_logic_vector(3 downto 0);  -- usually 10, upto 15
         BitSyncMode    : IN  std_logic_vector(1 downto 0);  -- 00 single, 01 individual, 10 QPSK, 11 OQPSK
         Rate,                                               -- (2, 3, 4 or 6) skip 5
         Frame          : IN  std_logic_vector(2 downto 0);  -- 1784*(1,2,4 or 5) skip 3
         ClkPerBit      : IN  std_logic_vector(15 downto 0); -- Data spreading count. Slightly less than 93.3/BR out
--         AsmFrameParm   : IN  std_logic_vector(31 downto 0); -- ASM Frame Sync Parameters FlyWheel(4:0), Verifies(4:0), OOL_BET(4:0), IL_BET(4:0), BitSlips(1:0)
         IterationCntr  : OUT std_logic_vector(3 downto 0);  -- test point, Current Iteration
         DataOut        : OUT std_logic_vector(SfixSova'length-1 downto 0); -- test point, soft data output
         Magnitude      : OUT std_logic_vector(SfixSova'length downto 0); -- test point, signal magnitude
         uHat,                                               -- test point, Bit Out per iteration. used to see progress
         SyncOut,                                            -- test point, one cycle end of iteration
         ValidOut,                                           -- test point, uHat valid
         BitOut,                                             -- actual data output
         BitClk,                                             -- spread 50% duty cycle gated clock output
         BitOutEn      : OUT std_logic                       -- bit en spread over ClkPerBit time
      );
      END Component TurboDecoder;

   COMPONENT TurboEncode IS
      GENERIC
      (
         FILE_LOC    : string := "../"
      );
      PORT(
         Clk,                 -- must be at least 6x the DataValid rate
         reset          : IN  std_logic;
         Rate,
         Frame          : IN natural range 0 to 6;
         ClkRate        : IN natural range 0 to 255;
         SyncOut,
         ValidOut,
         DataOut        : OUT std_logic
      );
   END COMPONENT TurboEncode;

   component TurboDF_Rom IS
      PORT(
         Clk,
         Reset,
         CountEn        : IN  std_logic;
         ReNoise        : OUT SLV12
      );
   END COMPONENT TurboDF_Rom;

   COMPONENT TurboVio
      PORT (
         clk : IN STD_LOGIC;
         probe_out0 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
         probe_out1 : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
         probe_out2 : OUT STD_LOGIC_VECTOR(11 DOWNTO 0);
         probe_out3 : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
         probe_out4 : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
         probe_out5 : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
         probe_out6 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
         probe_out7 : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
         probe_out8 : OUT STD_LOGIC_VECTOR(21 DOWNTO 0)
      );
   END COMPONENT;

   constant DF_WIDTH       : integer := SfixTurboIn'length;
   constant SIGNAL_AMP     : real := 0.25;
   constant FRAME_SIZE     : int_array(0 to 5) := (0, 1*1784, 2*1784, 3*1784, 4*1784, 5*1784);
   constant OOL_BET        : vector_of_slvs(0 to 6)(4 downto 0) := (5x"00", 5x"00", 5x"10", 5x"14", 5x"18", 5x"00", 5x"1c");
   constant IL_BET         : vector_of_slvs(0 to 6)(4 downto 0) := (5x"00", 5x"00", 5x"10", 5x"14", 5x"18", 5x"00", 5x"1c");

   constant SpiChgPmp      : std_logic_vector(131 downto 0) := (128=>'1', 93 downto 91=>'1',90=>'1', others=>'0');
   constant SpiMisc        : std_logic_vector(131 downto 0) := (111=>'1',     112=>'1', others=>'0');
   constant SpiDiv1        : std_logic_vector(131 downto 0) := (109 downto 95    =>'0', others=>'0');
   constant SpiDiv3        : std_logic_vector(131 downto 0) := (121 downto 118   =>'1', others=>'0');
   constant SpiVcoDiv      : std_logic_vector(131 downto 0) := (18=>'1', 15=>'1', 13=>'1', others=>'0');  -- Div by 45
   constant SpiInDiv       : std_logic_vector(131 downto 0) := (5=>'1', 3=>'1', 1=>'1', others=>'0');  -- Div by 7

   signal   SpiDiv2,
            SpiShift       : std_logic_vector(131 downto 0) := (others=>'0'); -- Div by 2 to 34 step 2
   signal   SpiCount       : unsigned(7 downto 0);
   signal   CS_shift       : std_logic_vector(1 downto 0);

   signal   DataOut        : std_logic_vector(SfixSova'length-1 downto 0);
   signal   Gain           : sfixed(3 downto -8);
   signal   IterationsOut,
            IterationCntr  : std_logic_vector(3 downto 0);
   signal   Magnitude      : std_logic_vector(SfixSova'length downto 0);
   signal   RateOut        : integer range 0 to 6;
   signal   RateVio,
            FrameVio       : std_logic_vector(2 downto 0);
   signal   Clk31          : std_logic_vector(2 downto 0) := "001";
   signal   ItersVio       : std_logic_vector(3 downto 0);
   signal   ClkPerBitVio,
            ClkPerBitOut   : std_logic_vector(15 downto 0);
   signal   FrameOut       : integer range 0 to 5;
   signal   ClkRateVio     : std_logic_vector(7 downto 0);
   signal   ClkRateOut     : integer range 0 to 255;
   signal   reset          : std_logic_vector(5 downto 0) := (others=>'1');
   signal   Div2VioReg     : std_logic_vector(4 downto 0) := 5x"00";
   signal   Div2Vio        : std_logic_vector(4 downto 0) := 5x"05";
   signal   GainVio,
            GainDbg        : std_logic_vector(11 downto 0);
   signal   AsmVio,
            AsmOut         : std_logic_vector(21 downto 0);
   signal   SyncEnc,
            ValidIn,
            SyncOut,
            SyncAsm,
            InvertOdd,
            InvertEven,
            resetBufg,
            uHat,
            DataIn,
            BitOutEn,
            BitOutErr,
            ValidOut       : std_logic := '0';
   signal   ResetVio       : std_logic_vector(0 downto 0);
   signal   BerCntr,
            BerCount       : integer := 0;
   signal   PRN_Shift,
            PRN_BitOut     : std_logic_vector(14 downto 0);
   signal   DataSlv        : SLV2;
   signal   Noise          : sfixed(0 downto -11);
   signal   Sum,
            NoiseGain,
            Data           : SfixTurboIn;
   signal   NoiseSlv       : SLV12;

   signal   BerCntrDbg, BerCountDbg : unsigned(9 downto 0);

   attribute mark_debug : string;
   attribute mark_debug of BerCntrDbg, BerCountDbg : signal is "true";
   attribute mark_debug of SyncOut, BitClk, BitOut, BitOutErr : signal is "true";

begin

   BerCntrDbg  <= to_unsigned(BerCntr, 10);
   BerCountDbg <= to_unsigned(BerCount, 10);

/*
   The test bench is run on the BS1000 bit sync card but only uses the 93MHz ref,
   a PLL chip and the FPGA. The 93MHz clock runs some overhead operations while
   the Turbo code and sources run from the PLL clock. To verify different clock
   rate, the PLL is used to multiply the 93M reference by 3*15/7 to generate 600MHz.
   The PLL output divider is then used to set the Turbo ClkPll rate. The PLL is
   programmed with a SPI port of 132 bits. Most bits are hard coded except the
   Output 1 divider. The SpiDiv2 is controlled by a 12 bit VIO output. Changing
   the SpiDiv2 value reboots the SPI port
*/
   SpiDiv2(117 downto 113) <= Div2Vio;
   MOSI                    <= SPiShift(SpiShift'left);
   CS                      <= CS_shift(1);
   Pll3Ref                 <= Clk93;
   PD_n                    <= '1';
   Pll2Ref                 <= ClkPll;    -- use pin U23-1 as a test point of Pll3

   SpiProcess : process(Clk93)
   begin
      if (falling_edge(Clk93)) then
         if (Div2Vio /= Div2VioReg) then
            Div2VioReg <= Div2Vio;
            SpiCount <= to_unsigned(132, SpiCount);
            CS_shift <= "00";
            SClk     <= '0';
            SpiShift <= SpiChgPmp or SpiMisc or SpiDiv1 or SpiDiv2 or SpiDiv3 or SpiVcoDiv or SpiInDiv;
         elsif (SpiCount > 0) then
            SClk <= not SClk;
            if (SClk) then
               SpiCount <= SpiCount - 1;
               SpiShift <= SpiShift(130 downto 0) & '0';
               if (SpiCount = 1) then
                  CS_shift <= "11";
               end if;
            end if;
         else
            CS_shift <= CS_shift(0) & '0';
         end if;
      end if;
  end process SpiProcess;

   RateOut        <= Rate       when ControlSel else to_integer(unsigned(RateVio));
   FrameOut       <= Frame      when ControlSel else to_integer(unsigned(FrameVio));
   ClkRateOut     <= ClkRate    when ControlSel else to_integer(unsigned(ClkRateVio));
   ClkPerBitOut   <= ClkPerBit  when ControlSel else ClkPerBitVio;

   Encoder : TurboEncode
      GENERIC MAP (
         FILE_LOC    => FILE_LOC
      )
      PORT MAP (
         Clk      => ClkPll,
         reset    => resetBufg,
         Rate     => RateOut,
         Frame    => FrameOut,
         ClkRate  => ClkRateOut,
         SyncOut  => SyncEnc,
         ValidOut => ValidIn,
         DataOut  => DataIn
   );

    Vio : TurboVio
      PORT MAP (
         clk => ClkPll,
         probe_out0 => ItersVio,
         probe_out1 => ResetVio,
         probe_out2 => GainVio,
         probe_out3 => RateVio,
         probe_out4 => FrameVio,
         probe_out5 => Div2Vio,
         probe_out6 => ClkRateVio,
         probe_out7 => ClkPerBitVio,
         probe_out8 => open
   );

   clk_process : process(ClkPll)
   begin
      if (rising_edge(ClkPll)) then
         reset    <= reset(4 downto 0) & ResetVio(0);

         Clk31 <= Clk31(1 downto 0) & Clk31(2);

         GainDbg <= GainVio;
         NoiseGain <= resize(Noise * Gain, NoiseGain);

         if (SyncOut or resetBufg) then
            BerCntr <= 0;
            BerCount <= BerCntr;
         elsif (ValidOut) then
            PRN_Shift <= PRN_Shift(13 downto 0) & uHat;
            if (PRN_Shift(14) xor PRN_Shift(13) xor uHat) then
               BerCntr <= BerCntr + 1;
            end if;
         end if;

         if (resetBufg) then
            PRN_BitOut <= (others=>'0');
         elsif(BitOutEn) then
            PRN_BitOut <= PRN_BitOut(13 downto 0) & BitOut;
            BitOutErr  <= PRN_BitOut(14) xor PRN_BitOut(13) xor BitOut;
         end if;

      end if;
   end process;

   ResetBufg_u : bufg
      PORT MAP (
         I => reset(5),
         O => resetBufg
   );

   DF_Rom : TurboDF_Rom
      PORT MAP(
         Clk      => ClkPll,
         Reset    => resetBufg,
         CountEn  => ValidIn,
         ReNoise  => NoiseSlv
      );

 --     Need to max input levels and check for overflow in math.

   Noise          <= to_sfixed(NoiseSlv, Noise);
   Data           <= to_sfixed(SIGNAL_AMP, Data)  when DataIn      else to_sfixed(-SIGNAL_AMP, Data);
   Sum            <= resize(Data + NoiseGain, Sum, fixed_saturate, fixed_truncate);
   IterationsOut  <= Iterations when ControlSel else ItersVio;
   Gain           <= GainIn     when ControlSel else to_sfixed(GainDbg, Gain);

   TurboDecTop : TurboDecoder
      GENERIC MAP(
         FILE_LOC       => FILE_LOC,
         DATA_WIDTH     => DF_WIDTH
         )
      PORT MAP(
         Clk93          => ClkPll,
         Clk31          => Clk31(2),
         reset          => resetBufg,
         ch0En          => ValidIn,
         ch1En          => '0',
         Ch0Data        => to_slv(Sum),
         Ch1Data        => to_slv(Data),
         BitSyncMode    => "00",
         Rate           => std_logic_vector(to_unsigned(RateOut,3)),
         Frame          => std_logic_vector(to_unsigned(FrameOut,3)),
         ClkPerBit      => ClkPerBitOut,
--         AsmFrameParm   => 10x"0" & AsmOut,
         Iterations     => IterationsOut,
         IterationCntr  => IterationCntr,
         DataOut        => DataOut,
         Magnitude      => Magnitude,
         ValidOut       => ValidOut,
         uHat           => uHat,
         SyncOut        => SyncOut,
         BitOut         => BitOut,
         BitClk         => BitClk,
         BitOutEn       => BitOutEn
      );

end rtl;
