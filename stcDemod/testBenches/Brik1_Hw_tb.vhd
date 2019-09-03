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
-- Module Name: Brik1_tb.vhd
-- Description: This is a hardware test bench to allow for testing at speed on
-- dozens of variations a day instead of 1 every three hours.
-- The data pattern is fixed for each frame which makes the whole frame repeatable.
-- The H0 and H1 streams are read from memory with a bipolar address offset between
-- them which allows for the Tau differential at a sample level. I don't have partial
-- bit shifting. I can also offset the data into the frame so the pilot detect has to
-- search the entire frame, not just the first samples like the C code does.
-- Also the offset frequency for both can be adjusted in .7Hz steps up to 150KHz.
-- Each channel has it's own DDS, but I'd typically run the same step size but can
-- vary the phase offset per channel. Should change PilotIndex.
-- The H0/H1 ratio is also adjustable.
-- There's also an adjustable noise source. One noise source is used on both channels
-- since the LNA would be receiving both channels anyway.
-- The sum of the H0, H1 and noise gains must be less than 1 to prevent overflow.
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
use ieee.std_logic_textio.all;
use ieee.numeric_std.all;
use ieee.math_real.all;
Library UNISIM;
use UNISIM.vcomponents.all;
use work.Semco_pkg.all;
use work.fixed_pkg.all;

entity Brik1_Hw_tb is
   GENERIC (SIM_MODE : boolean := false);
   PORT (
      Clk93In           : IN  std_logic;
      BitRateIn,
      Power0In,
      Power1In,
      NoiseIn           : IN  sfixed(0 downto -17);
      DataOut_o,
      ClkOut_o,
      BS_LED,
      DemodLED          : OUT std_logic
   );
end Brik1_Hw_tb;

architecture rtl of Brik1_Hw_tb is

  -- Define Components

   COMPONENT STC IS
      GENERIC (SIM_MODE : boolean := false
      );
      PORT(
      ResampleR,
      ResampleI         : IN  SLV18;
      ClocksPerBit      : IN  SLV16;
      DacSelect0,
      DacSelect1,
      DacSelect2        : IN  SLV4;
      Clk93,
      Clk186,
      SpectrumInv,
      ValidIn           : IN  std_logic;
      DataOut,                            -- Trellis Data Output
      ClkOutEn,                           -- Trellis Clock Output
      PilotFound,                         -- Pilot Found LED
      PilotLocked,
      TrellisFull,
      Dac0ClkEn,
      Dac1ClkEn,
      Dac2ClkEn         : OUT std_logic;
      Dac0Data,
      Dac1Data,
      Dac2Data          : OUT SLV18
      );
   END COMPONENT STC;

   COMPONENT CmplxMult IS
      GENERIC (
         IN_LEFT     : integer := 8;
         IN_RIGHT    : integer := -9;
         OUT_LEFT    : integer := 14;
         OUT_BINPT   : integer := -3
      );
      PORT (
         clk,
         reset,
         ce             : IN  std_logic;
         ValidIn,
         StartIn,
         ReadyIn        : IN  std_logic;
         ReInA,
         ImInA,
         ReInB,
         ImInB          : IN  sfixed(IN_LEFT downto IN_RIGHT);
         ReOut,
         ImOut          : OUT sfixed(OUT_LEFT downto OUT_BINPT);
         ValidOut,
         StartOut       : OUT std_logic
      );
   END COMPONENT CmplxMult;

   COMPONENT ReadGoldRef IS
      GENERIC (
         FILE_NAME         : string := "../test_data/file.txt";
         NUM_VALUES        : natural := 1;         -- number of values per line
         DATA_TYPE         : GoldDataType := Bools; -- data type, std_logic 0/1, hex int/uint or double
         OUT_WIDTH         : natural := 32;        -- total width of each value
         OUT_BINPT         : integer := -31        -- number of fraction bits if any. If none, set to 0
      );
      PORT(
         clk               : IN  std_logic;
         reset             : IN  std_logic;
         ce                : IN  std_logic;
         OutputData        : OUT vector_of_slvs(0 to NUM_VALUES-1)(OUT_WIDTH-1 downto 0);
         Done              : OUT std_logic
      );
   END COMPONENT ReadGoldRef;

   COMPONENT RAM_2Reads_1Write IS
      GENERIC(
         FILENAME    : string    := "";      -- Filename is absolute for Vivado and Modelsim to find
         DATA_WIDTH  : positive  := 32;
         BINPT       : integer   := -20;      -- only needed for ROMs
         ADDR_WIDTH  : positive  := 9;
         FILE_IS_SLV : boolean   := false;    -- nonSLV files are not synthesizable
         LATENCY     : positive  := 1;
         MAX_ADDR    : natural   := 0;
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

   COMPONENT dds_sin_cos
      PORT (
         aclk                 : IN STD_LOGIC;
         aresetn              : IN STD_LOGIC;
         s_axis_config_tvalid : IN STD_LOGIC;
         s_axis_config_tdata  : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
         m_axis_data_tvalid   : OUT STD_LOGIC;
         m_axis_data_tdata    : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
         m_axis_phase_tvalid  : OUT STD_LOGIC;
         m_axis_phase_tdata   : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
      );
   END COMPONENT;

   COMPONENT Vio_0 is
      PORT (
         clk            : IN  std_logic;
         probe_in0      : IN  std_logic_vector(7 downto 0);
         probe_out0     : OUT std_logic_vector(17 downto 0);
         probe_out1     : OUT std_logic_vector(17 downto 0);
         probe_out2     : OUT std_logic_vector(17 downto 0);
         probe_out3     : OUT std_logic_vector(17 downto 0);
         probe_out4     : OUT std_logic_vector(7 downto 0);
         probe_out5     : OUT std_logic_vector(17 downto 0);
         probe_out6     : OUT std_logic_vector(17 downto 0);
         probe_out7     : OUT std_logic_vector(17 downto 0);
         probe_out8     : OUT std_logic_vector(11 downto 0);
         probe_out9     : OUT std_logic_vector(11 downto 0);
         probe_out10    : OUT std_logic_vector(7 downto 0);
         probe_out11    : OUT std_logic_vector(17 downto 0);
         probe_out12    : OUT std_logic_vector(15 downto 0)
      );
   END COMPONENT Vio_0;

   component clk_wiz_0
      port (
         clk93,
         reset        : in     std_logic;
         ClkX1,
         ClkXn,
         locked       : out    std_logic
      );
   end component;
-------------------------------------------------------------------------------
--                       CONSTANT DEFINITIONS
-------------------------------------------------------------------------------

   signal   Reset,
            ResetBufg,
            Clk93,
            ClkXn,
            lastSampleReset,
            Locked,
            TrellisFull,
            PhaseValid           : std_logic;
   SIGNAL   DataValid            : SLV8 := x"00";
   SIGNAL   RdAddr_i,
            RdAddr0_i,
            RdAddr1_i            : natural range 0 to FRAME_LENGTH_4;
   SIGNAL   RdAddr0_v,
            RdAddr1_v            : integer range 0-2048-128 to 13311+2047+127 := 0;
   SIGNAL   RealRead,
            ImagRead             : vector_of_slvs(0 to 2)(17 downto 0);
   SIGNAL   H0r,
            H0i,
            H1r,
            H1i,
            Chan0r,
            Chan0i,
            Chan1r,
            Chan1i,
            ResampleR_s,
            ResampleI_s,
            RealOut,
            ImagOut,
            BitRateAcc           : sfixed(0 downto -17);
   SIGNAL   Phase0R,
            Phase0I,
            Phase1R,
            Phase1I              : sfixed(0 downto -15);
   SIGNAL   SinCosData0,
            SinCosData1          : std_logic_vector(31 downto 0);
   SIGNAL   Offset_vio           : SLV12;
   SIGNAL   BitRate_vio,
            Frequency_vio,
            notFrequency_vio,
            FrameClocks_vio,
            Power0_vio,
            Power1_vio,
            Phase0_vio,
            Phase1_vio,
            BitRate_slv,
            Power0_slv,
            Power1_slv,
            NoiseGain_slv,
            NoiseGain_vio        : SLV18;
   SIGNAL   DeltaT_vio,
            MiscBits,
            Errors               : SLV8;
   SIGNAL   LedCount             : UINT32;
   SIGNAL   ClocksPerBit         : SLV16;

   attribute mark_debug : string;
   attribute mark_debug of RdAddr_i, RealOut, ImagOut, ClkOut_o, DataOut_o : signal is "true";

begin

   Clocks : clk_wiz_0
      port map (
         clk93    => Clk93In,
         reset    => '0',
         ClkX1    => Clk93,
         ClkXn    => ClkXn,
         locked   => Locked
      );

   Vio_u : Vio_0
      PORT MAP (
         clk        => ClkXn,
         probe_in0  => Errors,
         probe_out0 => open, --Frequency_vio,           -- 00280 (222Hz) start getting errors at end of frame
         probe_out1 => FrameClocks_vio,         -- usually 13312-1=13311. smaller makes packets slide
         probe_out2 => open, --Phase0_vio,              -- has no effect unless both channels active
         probe_out3 => open, --Phase1_vio,
         probe_out4 => DeltaT_vio,
         probe_out5 => Power0_vio,              -- H0 power 128k is max
         probe_out6 => Power1_vio,              -- H1 power. sum of both must be < 128k
         probe_out7 => NoiseGain_vio,
         probe_out8 => open,
         probe_out9 => Offset_vio,
         probe_out10 => MiscBits,
         probe_out11 => BitRate_vio,            -- 0e449 is 41.6Mb
         probe_out12 => ClocksPerBit            -- c50 for 9.33/1.04, db7 at 10Mb 41.6
      );
Phase0_vio <= 18x"10000";
Phase1_vio <= 18x"30000";
Frequency_vio <= 18x"080";

   ErrorProc : process (ClkXn)
   begin
      if (rising_edge(ClkXn)) then
         Reset <= (not locked) or MiscBits(7);
         if (Reset) then
            Errors <= x"00";
            LedCount <= x"00000000";
         else
            if (LedCount < 186666666) then
               LedCount <= LedCount + 1;
            else
               LedCount <= x"00000000";
            end if;
            DemodLED <= TrellisFull; --'1' when (LedCount < 93333333) else '0';
            if (<< signal UUTu.PD_u.OverflowIFft : std_logic >> ) then
               Errors(0) <= '1';
            else
               Errors(0) <= '0';
            end if;
            if (<< signal UUTu.PD_u.OverflowFft  : std_logic >>) then
               Errors(1) <= '1';
            else
               Errors(1) <= '0';
            end if;
            if (<< signal UUTu.PD_u.Cntr0Abs.Overflow  : std_logic >>) then
               Errors(2) <= '1';
            else
               Errors(2) <= '0';
            end if;
            if (<< signal UUTu.PD_u.Cntr1Abs.Overflow  : std_logic >>) then
               Errors(3) <= '1';
            else
               Errors(3) <= '0';
            end if;
            if (<< signal UUTu.PD_u.H0Cntr_x_Fft.Overflow  : std_logic >>) then
               Errors(4) <= '1';
            else
               Errors(4) <= '0';
            end if;
            if (<< signal UUTu.PD_u.H1Cntr_x_Fft.Overflow  : std_logic >>) then
               Errors(5) <= '1';
            else
               Errors(5) <= '0';
            end if;
         end if;
         BS_LED <= nor(Errors);
      end if;
   end process;

   reg_process : process (Clk93)
      variable Offset_v    : integer range -2048 to 2047;
      variable DeltaT_v    : integer range -128 to 127;
      variable Power0_v,
               Power1_v,
               NoiseGain_v,
               BitRate_v   : sfixed(0 downto -17);
      variable Noise_v     : sfixed(3 downto -14);
   begin
      if (rising_edge(Clk93)) then
         if (Reset) then
            DataValid <= x"00";
            BitRateAcc  <= to_sfixed(0, BitRateAcc);
            RdAddr_i    <= 12800;
         else
            BitRate_slv   <= BitRate_vio;
            Power0_slv    <= Power0_vio;
            Power1_slv    <= Power1_vio;
            NoiseGain_slv <= NoiseGain_vio;
            if (SIM_MODE) then
               BitRate_v := resize(BitRateAcc + BitRateIn, BitRateAcc);
            else
               BitRate_v := resize(BitRateAcc + to_sfixed(BitRate_slv, BitRate_v), BitRateAcc);
            end if;
            BitRateAcc <= BitRate_v;
            DataValid <= DataValid(DataValid'left-1 downto 0) & (BitRate_v(0) xor BitRateAcc(0));
            if (DataValid(0)) then
               if (RdAddr_i < 13311) then -- TODO unsigned(FrameClocks_vio)) then
                  RdAddr_i <= RdAddr_i + 1;
               else
                  RdAddr_i <= 0;
               end if;
            end if;
         end if;
         DeltaT_v  := to_integer(signed(DeltaT_vio));    -- add �4 then check for overflow
         Offset_v  := 290+28; --to_integer(signed(Offset_vio));   -- 290 = 511, 287 is 3
         RdAddr0_v <= RdAddr_i + Offset_v;
         if (RdAddr0_v > 13311) then
            RdAddr0_i <= RdAddr0_v - FRAME_LENGTH_4;
         elsif (RdAddr0_v < 0) then
            RdAddr0_i <= RdAddr0_v + FRAME_LENGTH_4;
         else
            RdAddr0_i <= RdAddr0_v;
         end if;

         RdAddr1_v <= RdAddr_i + Offset_v + DeltaT_v;
         if (RdAddr1_v > 13311) then
            RdAddr1_i <= RdAddr1_v - FRAME_LENGTH_4;
         elsif (RdAddr1_v < 0) then
            RdAddr1_i <= RdAddr1_v + FRAME_LENGTH_4;
         else
            RdAddr1_i <= RdAddr1_v;
         end if;

         if (SIM_MODE) then
            NoiseGain_v := NoiseIn;
         else
            NoiseGain_v := to_sfixed(NoiseGain_slv, NoiseGain_v);
         end if;
         Noise_v     := resize(to_sfixed(RealRead(2), Noise_v) * NoiseGain_v, Noise_v);
         if (SIM_MODE) then
            Power0_v := Power0In;
            Power1_v := Power1In;
         else
            Power0_v := to_sfixed(Power0_slv, Power0_v);
            Power1_v := to_sfixed(Power1_slv, Power1_v);
         end if;

         ResampleR_s <= resize((Chan0r * Power0_v) + (Chan1r * Power1_v) + Noise_v, ResampleR_s, fixed_saturate, fixed_truncate);
         if (MiscBits(1)) then   -- invert I data for spectral inversion
            ResampleI_s <= resize((-Chan0i * Power0_v) + (-Chan1i * Power1_v) - Noise_v, ResampleI_s, fixed_saturate, fixed_truncate);
         else
            ResampleI_s <= resize((Chan0i * Power0_v) + (Chan1i * Power1_v) + Noise_v, ResampleI_s, fixed_saturate, fixed_truncate);
         end if;

      end if;
   end process reg_process;

   ReadRealC0 : RAM_2Reads_1Write
      GENERIC MAP(
         FILENAME    => "C:\Semco\STCinfo\RealTimeC\SpaceTimeCodeInC\SpaceTimeCodeInC\resampledIseed_r_+0_50_100%.slv",
         DATA_WIDTH  => 18,
         BINPT       => -17,
         FILE_IS_SLV => true,
         ADDR_WIDTH  => 14,
         MAX_ADDR    => 13311,
         LATENCY     => 1
      )
      PORT MAP(
         clk         => Clk93,
         ce          => '1',
         reset       => Reset,
         WrEn        => '0',
         WrAddr      => 0,
         RdAddrA     => 0,
         RdAddrB     => RdAddr0_i,
         WrData      => (others=>'0'),
         RdOutA      => open,
         RdOutB      => RealRead(0)
      );

   ReadImagC0 : RAM_2Reads_1Write
      GENERIC MAP(
         FILENAME    => "C:\Semco\STCinfo\RealTimeC\SpaceTimeCodeInC\SpaceTimeCodeInC\resampledIseed_i_+0_50_100%.slv",
         DATA_WIDTH  => 18,
         BINPT       => -17,
         FILE_IS_SLV => true,
         ADDR_WIDTH  => 14,
         MAX_ADDR    => 13311,
         LATENCY     => 1
      )
      PORT MAP(
         clk         => Clk93,
         ce          => '1',
         reset       => Reset,
         WrEn        => '0',
         WrAddr      => 0,
         RdAddrA     => 0,
         RdAddrB     => RdAddr0_i,
         WrData      => (others=>'0'),
         RdOutA      => open,
         RdOutB      => ImagRead(0)
      );

   ReadRealC1 : RAM_2Reads_1Write
      GENERIC MAP(
         FILENAME    => "C:\Semco\STCinfo\RealTimeC\SpaceTimeCodeInC\SpaceTimeCodeInC\resampledIseed_r_+0_50_0%.slv",
         DATA_WIDTH  => 18,
         BINPT       => -17,
         FILE_IS_SLV => true,
         ADDR_WIDTH  => 14,
         MAX_ADDR    => 13311,
         LATENCY     => 1
      )
      PORT MAP(
         clk         => Clk93,
         ce          => '1',
         reset       => Reset,
         WrEn        => '0',
         WrAddr      => 0,
         RdAddrA     => 0,
         RdAddrB     => RdAddr1_i,
         WrData      => (others=>'0'),
         RdOutA      => open,
         RdOutB      => RealRead(1)
      );

   ReadImagC1 : RAM_2Reads_1Write
      GENERIC MAP(
         FILENAME    => "C:\Semco\STCinfo\RealTimeC\SpaceTimeCodeInC\SpaceTimeCodeInC\resampledIseed_i_+0_50_0%.slv",
         DATA_WIDTH  => 18,
         BINPT       => -17,
         FILE_IS_SLV => true,
         ADDR_WIDTH  => 14,
         MAX_ADDR    => 13311,
         LATENCY     => 1
      )
      PORT MAP(
         clk         => Clk93,
         ce          => '1',
         reset       => Reset,
         WrEn        => '0',
         WrAddr      => 0,
         RdAddrA     => 0,
         RdAddrB     => RdAddr1_i,
         WrData      => (others=>'0'),
         RdOutA      => open,
         RdOutB      => ImagRead(1)
      );

   ReadNoise : RAM_2Reads_1Write
      GENERIC MAP(
         FILENAME    => "C:\Semco\STCinfo\RealTimeC\SpaceTimeCodeInC\SpaceTimeCodeInC\Noise.slv",
         DATA_WIDTH  => 18,
         BINPT       => -17,
         FILE_IS_SLV => true,
         ADDR_WIDTH  => 14,
         MAX_ADDR    => 13311,
         LATENCY     => 1
      )
      PORT MAP(
         clk         => Clk93,
         ce          => '1',
         reset       => Reset,
         WrEn        => '0',
         WrAddr      => 0,
         RdAddrA     => 0,
         RdAddrB     => RdAddr0_i,
         WrData      => (others=>'0'),
         RdOutA      => open,
         RdOutB      => RealRead(2)
      );

   DDS0 : dds_sin_cos      -- DDS is 28 bit phase increment. only bottom 18 are tunable for 100KHz range
      PORT MAP (
         aclk                 => Clk93,
         aresetn              => not Reset,
         s_axis_config_tvalid => DataValid(0),  -- Freq/Phase offset may be delayed relative to simulation
         s_axis_config_tdata  => (63 downto 18+32=> Phase0_vio(Phase0_vio'left)) & Phase0_vio & (31 downto 18=> Frequency_vio(Frequency_vio'left)) & Frequency_vio, -- sign extend phase and freq values
         m_axis_data_tvalid   => open,
         m_axis_data_tdata    => SinCosData0,
         m_axis_phase_tvalid  => open,
         m_axis_phase_tdata   => open
   );

   Phase0R <= to_sfixed(SinCosData0(15 downto 0), Phase0R);
   Phase0I <= to_sfixed(SinCosData0(31 downto 16), Phase0I);
   notFrequency_vio <= not Frequency_vio;

   DDS1 : dds_sin_cos
      PORT MAP (
         aclk                 => Clk93,
         aresetn              => not Reset,
         s_axis_config_tvalid => DataValid(0),
         s_axis_config_tdata  => (63 downto 18+32=> Phase1_vio(Phase1_vio'left)) & Phase1_vio & (31 downto 18=> notFrequency_vio(notFrequency_vio'left)) & notFrequency_vio,
         m_axis_data_tvalid   => open,
         m_axis_data_tdata    => SinCosData1,
         m_axis_phase_tvalid  => open,
         m_axis_phase_tdata   => open
   );

   Phase1R <= to_sfixed(SinCosData1(15 downto 0), Phase1R);
   Phase1I <= to_sfixed(SinCosData1(31 downto 16), Phase1I);

   H0r            <= to_sfixed(RealRead(0), ResampleR_s);
   H0i            <= to_sfixed(ImagRead(0), ResampleI_s);
   H1r            <= to_sfixed(RealRead(1), ResampleR_s);
   H1i            <= to_sfixed(ImagRead(1), ResampleI_s);

   H0Phase : CmplxMult
      GENERIC MAP (
         IN_LEFT     => H0r'left,
         IN_RIGHT    => H0r'right,
         OUT_LEFT    => Chan0r'left,
         OUT_BINPT   => Chan0r'right
      )
      PORT MAP (
         clk         => Clk93,
         reset       => Reset,
         ce          => '1',
         ValidIn     => DataValid(2),
         StartIn     => '0',
         ReadyIn     => '1',
         ReInA       => H0r,
         ImInA       => H0i,
         ReInB       => Phase0R & "00",
         ImInB       => Phase0I & "00",
         ReOut       => Chan0r,
         ImOut       => Chan0i,
         ValidOut    => PhaseValid,
         StartOut    => open
   );

   H1Phase : CmplxMult
      GENERIC MAP (
         IN_LEFT     => H1r'left,
         IN_RIGHT    => H1r'right,
         OUT_LEFT    => Chan1r'left,
         OUT_BINPT   => Chan1r'right
      )
      PORT MAP(
         clk         => Clk93,
         reset       => Reset,
         ce          => '1',
         ValidIn     => DataValid(2),
         StartIn     => '0',
         ReadyIn     => '1',
         ReInA       => H1r,
         ImInA       => H1i,
         ReInB       => Phase1R & "00",
         ImInB       => Phase1I & "00",
         ReOut       => Chan1r,
         ImOut       => Chan1i,
         ValidOut    => open,
         StartOut    => open
   );

   ResetBuf  : BUFG
      port map (
         I => Reset,
         O => ResetBufg
   );


   UUTu : STC
      generic map (
         SIM_MODE    => SIM_MODE
      )
      PORT MAP(
         ResampleR      => to_slv(ResampleR_s),
         ResampleI      => to_slv(ResampleI_s),
         ClocksPerBit   => to_slv(to_sfixed(9.34/93.3, 0, -15)),
         DacSelect0     => x"0",
         DacSelect1     => x"0",
         DacSelect2     => x"0",
         Clk93          => Clk93,
         Clk186         => ClkXn,
         ValidIn        => PhaseValid,
         SpectrumInv    => MiscBits(0),
         DataOut        => DataOut_o,
         ClkOutEn       => ClkOut_o,
         PilotFound     => open,
         PilotLocked    => open,
         Dac0ClkEn      => open,
         Dac1ClkEn      => open,
         Dac2ClkEn      => open,
         Dac0Data       => open,
         Dac1Data       => open,
         Dac2Data       => open
      );

end rtl;
