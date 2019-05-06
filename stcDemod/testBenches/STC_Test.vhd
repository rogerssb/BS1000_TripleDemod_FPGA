/*-------------------------------------------------------------------------------
                  PROPRIETARY NOTICE
----------------------------------------------------------------------------
(c) Copyright 2014 Semco Inc. All rights reserved.

This file contains Semco Inc. proprietary information. It is the
property of Semco Inc. and shall not be used, disclosed to others or
reproduced without the express written consent of Semco Inc.,
including, but without limitation, it is not to be used in the creation,
manufacture, development, or derivation of any designs, or configuration.

----------------------------------------------------------------------------

Company:     Semco Inc.

Module Name: STC_Test.vhd
Description:
   A/D clock is system clock. May want to increase to 186 on Agilent to test
timing.
   Eights sets of pilot packets were captured stripping off the bothersome
data section to improve run time. The pilot is read from onboard rams and fed
to Brik2.

ARGUMENTS :


Dependencies:

----------------------------------------------------------------------------
                               DETAILS
----------------------------------------------------------------------------

----------------------------------------------------------------------------
                               HISTORY
----------------------------------------------------------------------------
9-6-16 Initial release FZ
-------------------------------------------------------------
*/

LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE IEEE.math_real.all;
library std;
use std.textio.all;
Library UNISIM;
use UNISIM.vcomponents.all;
use work.fixed_pkg.all;
USE work.Semco_pkg.ALL;

ENTITY STC_Test IS
   GENERIC (
      PILOT_ONLY : boolean := true
   );
   PORT(
      adc_dco_p,
      adc_dco_n,
      OverRange_p,
      OverRange_n       : IN  std_logic;
      adc_data_in_p,
      adc_data_in_n     : IN  std_logic_vector(7 downto 0); -- ddr input from 16 bit A/D
      ClkOut,                 -- FireBerd Clock Output
      DataOut,                -- FireBerd Data Output
      OverRange,              -- A/D input over range
      PilotFound,             -- Pilot Found LED
      Blink             : OUT std_logic   -- I'm alive Blinking LED
   );
END STC_Test;


ARCHITECTURE rtl OF STC_Test IS

   COMPONENT Brik2
      PORT(
         Clk,
         Reset,
         CE             : IN  std_logic;
         Variables      : IN  RecordType;
         StartIn,
         ValidIn        : IN  std_logic;
         FreqIn         : IN  Float_128k; -- TODO remove line
         InR,
         InI            : IN  SLV18;
         TrellisEn,
         TrellisStart   : OUT std_logic;
         H0EstR,
         H0EstI,
         H1EstR,
         H1EstI,
         InterpO_R0,
         InterpO_I0,
         InterpO_R1,
         InterpO_I1     : OUT STC_PARM;
         DeltaTauEst    : OUT sfixed(0 downto -5)
      );
   END COMPONENT Brik2;

   COMPONENT vio_0
      PORT (
         clk : IN STD_LOGIC;
         probe_out0 : OUT SLV18;
         probe_out1 : OUT SLV18;
         probe_out2 : OUT SLV18;
         probe_out3 : OUT SLV18;
         probe_out4 : OUT SLV18;
         probe_out5 : OUT SLV18;
         probe_out6 : OUT STD_LOGIC_VECTOR(11 DOWNTO 0);
         probe_out7 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
         probe_out8 : OUT SLV18
      );
   END COMPONENT vio_0;

   COMPONENT RAM_2Reads_1Write IS
      GENERIC(
         FILENAME    : string    := "";      -- Filename is absolute for Vivado and Modelsim to find
         DATA_WIDTH  : positive  := 32;
         BINPT       : integer   := -20;      -- only used to scale file readings
         ADDR_WIDTH  : natural   := 9;
         FILE_IS_SLV : boolean   := true;    -- nonSLV files are not synthesizable
         LATENCY     : positive  := 1;
         RAM_TYPE    : string    := "block"  -- or "distributed"
      );
      PORT(
         clk,
         ce,
         reset,
         WrEn           : IN  std_logic;
         WrAddr,
         RdAddrA,
         RdAddrB        : IN  natural range 0 to 2**ADDR_WIDTH-1;
         WrData         : In  std_logic_vector(DATA_WIDTH-1 DOWNTO 0);
         RdOutA,
         RdOutB         : OUT std_logic_vector(DATA_WIDTH-1 DOWNTO 0)
      );
   END COMPONENT RAM_2Reads_1Write;

   COMPONENT ReadGoldRef IS
      GENERIC (
         FILE_NAME         : string := "../test_data/file.txt";
         NUM_VALUES        : natural := 1;         -- number of values per line
         DATA_TYPE         : GoldDataType := Bools; -- data type, std_logic 0/1, hex int/uint or double
         OUT_WIDTH         : natural := 32;        -- total width of each value
         OUT_BINPT         : integer := -31;        -- number of fraction bits if any. If none, set to 0
         DELAY             : natural := 0
      );
      PORT(
         clk               : IN  std_logic;
         reset             : IN  std_logic;
         ce                : IN  std_logic;
         OutputData        : OUT vector_of_slvs(0 to NUM_VALUES-1)(OUT_WIDTH-1 downto 0);
         Done              : OUT std_logic
      );
   END COMPONENT ReadGoldRef;

   CONSTANT DELAY       : natural := 1200;

   SIGNAL   ce,
            clk,
            reset,
            TrellisSkip,
            TrellisOutEn,
            TrellisOutEnRaw,
            TrellisEn,
            TrellisStart,
            StartIn,
            ValidIn,
            FirstStart        : std_logic;
   SIGNAL   VarsValid,
            VarsStart         : vector_of_slvs(0 downto 0)(0 downto 0);
   SIGNAL   InR,
            InI               : SLV18;
   SIGNAL   LedFlash          : unsigned(27 downto 0);
   SIGNAL   Variables         : RecordType := c_RecordType;
   SIGNAL   StartRead,
            ResetBrik2,
            ValidRead         : std_logic;
   SIGNAL   VarsReal,
            VarsImag          : vector_of_slvs(0 downto 0)(17 downto 0);
   SIGNAL   PacketCount,
            SampleCount,
            TrellisCount,
            PromAddr          : natural range 0 to 16283;
   SIGNAL   ResetSR,
            Dones             : uint8slv := x"FF";
   SIGNAL   H0EstR,
            H0EstI,
            H1EstR,
            H1EstI,
            InterpO_R0,
            InterpO_I0,
            InterpO_R1,
            InterpO_I1        : STC_PARM;
   SIGNAL   DeltaTauEst       : sfixed(0 downto -5);

   attribute mark_debug : string;
   attribute mark_debug of PromAddr          : signal is "true";
   attribute mark_debug of SampleCount       : signal is "true";
   attribute mark_debug of PacketCount       : signal is "true";

BEGIN


   IBUFDS_inst : IBUFDS
   generic map (
      DQS_BIAS => "FALSE"  -- (FALSE, TRUE)
   )
   port map (
      I  => adc_dco_p,  -- 1-bit input: Diff_p buffer input (connect directly to top-level port)
      IB => adc_dco_n,  -- 1-bit input: Diff_n buffer input (connect directly to top-level port)
      O  => clk         -- 1-bit output: Buffer output
   );

   -- clock process for test.  reset <= Probe7(7);  -- not Locked; -- TODO?? '0'; routes better without reset
   process(clk)
   begin
      if (rising_edge(clk)) then
         ResetSR <= ResetSR(6 downto 0) & '0';
         reset <= ResetSR(7);
      end if;
   end process;

   ce <= '1';     -- no need to strobe ce at this point.
   Blink <= LedFlash(LedFlash'left);

   InterBrikProcess : process(clk) is
   begin
      if(rising_edge(clk)) then
         if (reset) then
            StartIn     <= '0';
            ValidIn     <= '0';
            InR         <= (others=>'0');
            InI         <= (others=>'0');
            LedFlash    <= (others=>'0');
            FirstStart  <= '1';
         else
            FirstStart  <= '0';
            StartIn     <= StartRead;
            ValidIn     <= ValidRead;
            InR         <= VarsReal(0);
            InI         <= VarsImag(0);
            LedFlash    <= LedFlash + 1;
         end if;
      end if;
   end process InterBrikProcess;

 SourceData : if (PILOT_ONLY) generate

   ReadReal_u : RAM_2Reads_1Write
      GENERIC MAP(
         FILENAME    => "C:\Users\frank.ziegler\Documents\GitHub\stcDemod/simData/PilotsOnly+1000_5%_R.slv",
         FILE_IS_SLV => true,
         DATA_WIDTH  => 18,
         BINPT       => -17,
         ADDR_WIDTH  => 12,
         LATENCY     => 1,
         RAM_TYPE    => "distributed"
      )
      PORT MAP(
         clk         => clk,
         ce          => ce,
         reset       => reset,
         WrEn        => '0',
         WrAddr      => 0,
         RdAddrA     => PromAddr,
         RdAddrB     => 0,
         WrData      => (others=>'0'),
         RdOutA      => VarsReal(0),
         RdOutB      => open
      );

   ReadImag_u : RAM_2Reads_1Write
      GENERIC MAP(
         FILENAME    => "C:\Users\frank.ziegler\Documents\GitHub\stcDemod/simData/PilotsOnly+1000_5%_I.slv",
         FILE_IS_SLV => true,
         DATA_WIDTH  => 18,
         BINPT       => -17,
         ADDR_WIDTH  => 12,
         LATENCY     => 1,
         RAM_TYPE    => "distributed"
      )
      PORT MAP(
         clk         => clk,
         ce          => ce,
         reset       => reset,
         WrEn        => '0',
         WrAddr      => 0,
         RdAddrA     => PromAddr,
         RdAddrB     => 0,
         WrData      => (others=>'0'),
         RdOutA      => VarsImag(0),
         RdOutB      => open
      );

   StartProcess : process(clk)
   begin
      if (rising_edge(clk)) then
         if (reset) then
            PacketCount <= 0;
            SampleCount <= 12600;
            PromAddr    <= 0;
            StartRead   <= '0';
            ValidRead   <= '0';
         elsif (ce) then
            if (SampleCount < 512) and (PromAddr < 4095) then
               PromAddr <= PromAddr + 1;
            elsif (PromAddr = 4095) then  -- last frame, restart
               PacketCount <= 0;
               PromAddr    <= 0;
            end if;
            if (SampleCount < 12700) then -- wait long enough to process Freq Est
               SampleCount <= SampleCount + 1;
            else
               SampleCount <= 0;
               PacketCount <= PacketCount + 1;
            end if;
            StartRead <= '1' when (SampleCount = 12650) else '0';
            ValidRead <= '1' when (SampleCount < 520) else '0';   -- Time needs three more samples to fill buffer, emulates non-pilot packets of overflow
         end if;
      end if;
   end process StartProcess;

   ResetBrik2 <= reset; -- '1' when (SampleCount >= 12625) and (SampleCount < 12630) and (PacketCount = 0) else reset;

else generate

   RealData : ReadGoldRef
   GENERIC MAP(
      FILE_NAME         => "../CsamplesR_+1000_100_5%.txt",
      NUM_VALUES        => 1,
      DATA_TYPE         => SFix,
      OUT_WIDTH         => FLOAT_1_18'length,
      OUT_BINPT         => FLOAT_1_18'right,
      DELAY             => Delay
   )
   PORT MAP(
      clk               => clk,
      reset             => reset,
      ce                => ValidIn or FirstStart,
      OutputData        => VarsReal,
      Done              => Dones(7)
   );

   ImagData : ReadGoldRef
   GENERIC MAP(
      FILE_NAME         => "../simData/CsamplesI_+1000_100_5%.txt",
      NUM_VALUES        => 1,
      DATA_TYPE         => SFix,
      OUT_WIDTH         => FLOAT_1_18'length,
      OUT_BINPT         => FLOAT_1_18'right,
      DELAY             => Delay
   )
   PORT MAP(
      clk               => clk,
      reset             => reset,
      ce                => ValidIn or FirstStart,
      OutputData        => VarsImag,
      Done              => Dones(6)
   );

   ReadValid : ReadGoldRef
   GENERIC MAP(
      FILE_NAME         => "..\simData\ValidInBrik2.txt",
      NUM_VALUES        => 1,
      DATA_TYPE         => Bools,
      OUT_WIDTH         => 1,
      OUT_BINPT         => 0,
      DELAY             => Delay
   )
   PORT MAP(
      clk               => clk,
      reset             => reset,
      ce                => '1',
      OutputData        => VarsValid,
      Done              => Dones(5)
   );

   ValidRead <= VarsValid(0)(0);

   ReadStart : ReadGoldRef
   GENERIC MAP(
      FILE_NAME         => "..\simData\StartInBrik2.txt",
      NUM_VALUES        => 1,
      DATA_TYPE         => Bools,
      OUT_WIDTH         => 1,
      OUT_BINPT         => 0,
      DELAY             => Delay
   )
   PORT MAP(
      clk               => clk,
      reset             => reset,
      ce                => '1',
      OutputData        => VarsStart,
      Done              => Dones(4)
   );

   StartRead <= VarsStart(0)(0);

end generate SourceData;


   Brik2_u : Brik2
      PORT MAP(
         Clk            => Clk,
         Reset          => ResetBrik2,
         CE             => CE,
         Variables      => Variables,
         StartIn        => StartIn,
         ValidIn        => ValidIn,
         FreqIn         => Float_zero_128K, --TODO, remove line
         InR            => InR,
         InI            => InI,
         TrellisEn      => TrellisEn,
         TrellisStart   => TrellisStart,
         H0EstR         => H0EstR,
         H0EstI         => H0EstI,
         H1EstR         => H1EstR,
         H1EstI         => H1EstI,
         InterpO_R0     => InterpO_R0,
         InterpO_I0     => InterpO_I0,
         InterpO_R1     => InterpO_R1,
         InterpO_I1     => InterpO_I1,
         DeltaTauEst    => DeltaTauEst
      );
/* TODO
   Trellis_u : TrellisDetector
      PORT MAP (
         Clk                  => Clk,
         clkEn                => CE,
         Reset                => Reset,
         sampleEn             => TrellisEn,
         startFrame           => trellisStart,
         h0EstReal            => to_slv(H0EstR),
         h0EstImag            => to_slv(H0EstI),
         h1EstReal            => to_slv(H1EstR),
         h1EstImag            => to_slv(H1EstI),
         in0Real              => to_slv(InterpO_R0),
         in0Imag              => to_slv(InterpO_I0),
         in1Real              => to_slv(InterpO_R1),
         in1Imag              => to_slv(InterpO_I1),
         deltaTauEst          => to_slv(DeltaTauEst),
         finalMetricOutputEn  => FinalMetricOutputEn,
         outputEn             => TrellisOutEnRaw,
         finalMetric          => FinalMetric,
         outputBits           => TrellisBitsRaw
      );

   TrellisProcess : process(Clk)
   begin
      if (rising_edge(Clk)) then
         if (Reset) then
            TrellisSkip  <= '0';
            TrellisOutEn <= '0';
            TrellisBits  <= x"0";
            TrellisCount <= 0;
         elsif (CE) then
            if (TrellisStart) then  -- ignore the first trellis output
               TrellisSkip <= '1';
               TrellisCount <= 0;
            elsif (TrellisSkip and TrellisOutEnRaw) then
               TrellisSkip <= '0';
            end if;
            if (TrellisOutEn = '1') and (TrellisCount < 3300) then
               TrellisCount <= TrellisCount + 1;
            end if;
            TrellisOutEn <= TrellisOutEnRaw and not TrellisSkip;
            TrellisBits  <= TrellisBitsRaw;
         end if;
      end if;
   end process TrellisProcess;
TODO */
   ClkOut     <= InR(3);
   DataOut    <= InR(4);
   PilotFound <= '1';
   OverRange <= '0';

END rtl;
