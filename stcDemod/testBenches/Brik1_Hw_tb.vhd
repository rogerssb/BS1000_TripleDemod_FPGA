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
use work.Semco_pkg.all;
use work.fixed_pkg.all;

entity Brik1_Hw_tb is
   GENERIC (SIM_MODE : boolean := false);
   PORT (
      Clk93    : IN  std_logic;
      Power0In,
      Power1In : IN  sfixed(0 downto -17);
      BS_LED,
      DemodLED : OUT std_logic
   );
end Brik1_Hw_tb;

architecture rtl of Brik1_Hw_tb is

  -- Define Components

   COMPONENT Brik1 is
      GENERIC (SIM_MODE : boolean := false
      );
      PORT (
         clk,
         clk2x,
         reset,
         reset2x,
         ce,
         ValidIn        : IN  std_logic;
         Variables      : IN  RecordType;   -- for pilotSync and PilotDetect
         ResampleR,
         ResampleI      : IN  Float_1_18;
         RealOut,
         ImagOut        : OUT Float_1_18;
         ValidOut,
         PilotFound,
         PilotLocked,
         StartOut       : OUT std_logic
      );
   end COMPONENT Brik1;

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
         probe_out11    : OUT std_logic_vector(17 downto 0)
      );
   END COMPONENT Vio_0;

   component clk_wiz_0
      port (
         clk93,
         reset        : in     std_logic;
         clkX1,
         clkX2,
         locked       : out    std_logic
      );
   end component;
-------------------------------------------------------------------------------
--                       CONSTANT DEFINITIONS
-------------------------------------------------------------------------------

   signal   reset,
            clk,
            clk2x,
            Locked,
            PhaseValid           : std_logic;
   SIGNAL   StartOut,
            DataValid_o          : std_logic;
   SIGNAL   DataValid            : SLV8;
   SIGNAL   RdAddr_i,
            RdAddr0_i,
            RdAddr1_i            : natural range 0 to 13311;
   SIGNAL   RdAddr0_v,
            RdAddr1_v            : integer range 0-2048-128 to 13311+2047+127 := 0;
   SIGNAL   RealRead,
            ImagRead             : vector_of_slvs(0 to 2)(17 downto 0);
   signal   Variables            : RecordType;
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
            ImagOut              : sfixed(0 downto -17);
   SIGNAL   Phase0R,
            Phase0I,
            Phase1R,
            Phase1I               : sfixed(0 downto -15);
   SIGNAL   PhaseData0,
            SinCosData0,
            PhaseData1,
            SinCosData1          : std_logic_vector(31 downto 0);
   SIGNAL   Offset,
            PilotSyncOffset      : std_logic_vector(11 downto 0); -- := 1535;
   SIGNAL   Frequency0,
            Frequency1,
            Power0,
            Power1,
            Power0Slv,
            Power1Slv,
            NoiseGainSlv,
            Phase0,
            Phase1,
            NoiseGain            : std_logic_vector(17 downto 0);
   SIGNAL   DeltaT_slv,
            MiscBits,
            Errors               : SLV8;
   SIGNAL   LedCount             : UINT32;

   attribute mark_debug : string;
   attribute mark_debug of RdAddr_i, RdAddr0_i, RdAddr1_i,
            Phase0R, Phase0I, Phase1R, Phase1I,
            ResampleR_s, ResampleI_s            : signal is "true";

begin

   Clocks : clk_wiz_0
      port map (
         clk93    => Clk93,
         reset    => '0',
         clkX1    => clk,
         clkX2    => clk2x,
         locked   => Locked
      );

   Vio_u : Vio_0
      PORT MAP (
         clk        => clk2x,
         probe_in0  => Errors,
         probe_out0 => Frequency0,
         probe_out1 => Frequency1,
         probe_out2 => Phase0,
         probe_out3 => Phase1,
         probe_out4 => DeltaT_slv,
         probe_out5 => Power0,
         probe_out6 => Power1,
         probe_out7 => NoiseGain,
         probe_out8 => PilotSyncOffset,
         probe_out9 => Offset,
         probe_out10 => MiscBits,
         probe_out11 => open
      );

   ErrorProc : process (clk2x)
   begin
      if (rising_edge(clk2x)) then
         reset <= (not locked) or MiscBits(7);
         if (reset) then
            Errors <= x"00";
            LedCount <= x"00000000";
         else
            if (LedCount < 186666666) then
               LedCount <= LedCount + 1;
            else
               LedCount <= x"00000000";
            end if;
            DemodLED <= '1' when (LedCount < 93333333) else '0';
            if (<< signal Brik1u.PD_u.OverflowIFft : std_logic >> ) then
               Errors(0) <= '1';
            end if;
            if (<< signal Brik1u.PD_u.OverflowFft  : std_logic >>) then
               Errors(1) <= '1';
            end if;
            if (<< signal Brik1u.PD_u.Cntr0Abs.Overflow  : std_logic >>) then
               Errors(2) <= '1';
            end if;
            if (<< signal Brik1u.PD_u.Cntr1Abs.Overflow  : std_logic >>) then
               Errors(3) <= '1';
            end if;
            if (<< signal Brik1u.PD_u.H0Cntr_x_Fft.Overflow  : std_logic >>) then
               Errors(4) <= '1';
            end if;
            if (<< signal Brik1u.PD_u.H1Cntr_x_Fft.Overflow  : std_logic >>) then
               Errors(5) <= '1';
            end if;
         end if;
         BS_LED <= or(Errors);
      end if;
   end process;

   reg_process : process (clk)
      variable Offset_v    : integer range -2048 to 2047;
      variable DeltaT_v    : integer range -128 to 127;
      variable Power0_v,
               Power1_v,
               NoiseGain_v,
               Noise_v     : sfixed(0 downto -17);
   begin
      if (rising_edge(clk)) then
         if (reset) then
            DataValid <= x"01";
            RdAddr_i <= 12800;
         else
            DataValid <= DataValid(DataValid'left-1 downto 0) & DataValid(DataValid'left);
            if (DataValid(0)) then
               if (RdAddr_i < 13311) then
                  RdAddr_i <= RdAddr_i + 1;
               else
                  RdAddr_i <= 0;
               end if;
            end if;
         end if;
         DeltaT_v  := to_integer(signed(DeltaT_slv));    -- add ±4 then check for overflow
         Offset_v  := to_integer(signed(Offset));
         RdAddr0_v <= RdAddr_i + Offset_v;
         if (RdAddr0_v > 13311) then
            RdAddr0_i <= RdAddr0_v - 13312;
         elsif (RdAddr0_v < 0) then
            RdAddr0_i <= RdAddr0_v + 13312;
         else
            RdAddr0_i <= RdAddr0_v;
         end if;

         RdAddr1_v <= RdAddr_i + Offset_v + DeltaT_v;
         if (RdAddr1_v > 13311) then
            RdAddr1_i <= RdAddr1_v - 13312;
         elsif (RdAddr1_v < 0) then
            RdAddr1_i <= RdAddr1_v + 13312;
         else
            RdAddr1_i <= RdAddr1_v;
         end if;

         Power0Slv    <= Power0;
         Power1Slv    <= Power1;
         NoiseGainSlv <= NoiseGain;
         NoiseGain_v := to_sfixed(NoiseGainSlv, NoiseGain_v);
         Noise_v     := resize(to_sfixed(RealRead(2), Noise_v) * NoiseGain_v, Noise_v);
         if (SIM_MODE) then
            Power0_v := Power0In;
            Power1_v := Power1In;
         else
            Power0_v := to_sfixed(Power0Slv, Power0_v);
            Power1_v := to_sfixed(Power1Slv, Power1_v);
         end if;

         ResampleR_s <= resize((Chan0r * Power0_v) + (Chan1r * Power1_v) + Noise_v, ResampleR_s, fixed_saturate, fixed_truncate);
         ResampleI_s <= resize((Chan0i * Power0_v) + (Chan1i * Power1_v) + Noise_v, ResampleI_s, fixed_saturate, fixed_truncate);
      end if;
   end process reg_process;

   ReadRealC0 : RAM_2Reads_1Write
      GENERIC MAP(
         FILENAME    => "C:\Semco\STCinfo\RealTimeC\SpaceTimeCodeInC\SpaceTimeCodeInC/resampled_r_+0_50_100%.slv",
         DATA_WIDTH  => 18,
         BINPT       => -17,
         FILE_IS_SLV => true,
         ADDR_WIDTH  => 14,
         MAX_ADDR    => 13311,
         LATENCY     => 1
      )
      PORT MAP(
         clk         => clk,
         ce          => '1',
         reset       => reset,
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
         FILENAME    => "C:\Semco\STCinfo\RealTimeC\SpaceTimeCodeInC\SpaceTimeCodeInC/resampled_i_+0_50_100%.slv",
         DATA_WIDTH  => 18,
         BINPT       => -17,
         FILE_IS_SLV => true,
         ADDR_WIDTH  => 14,
         MAX_ADDR    => 13311,
         LATENCY     => 1
      )
      PORT MAP(
         clk         => clk,
         ce          => '1',
         reset       => reset,
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
         FILENAME    => "C:\Semco\STCinfo\RealTimeC\SpaceTimeCodeInC\SpaceTimeCodeInC/resampled_r_+0_50_0%.slv",
         DATA_WIDTH  => 18,
         BINPT       => -17,
         FILE_IS_SLV => true,
         ADDR_WIDTH  => 14,
         MAX_ADDR    => 13311,
         LATENCY     => 1
      )
      PORT MAP(
         clk         => clk,
         ce          => '1',
         reset       => reset,
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
         FILENAME    => "C:\Semco\STCinfo\RealTimeC\SpaceTimeCodeInC\SpaceTimeCodeInC/resampled_i_+0_50_0%.slv",
         DATA_WIDTH  => 18,
         BINPT       => -17,
         FILE_IS_SLV => true,
         ADDR_WIDTH  => 14,
         MAX_ADDR    => 13311,
         LATENCY     => 1
      )
      PORT MAP(
         clk         => clk,
         ce          => '1',
         reset       => reset,
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
         FILENAME    => "C:\Semco\STCinfo\RealTimeC\SpaceTimeCodeInC\SpaceTimeCodeInC/Noise.slv",
         DATA_WIDTH  => 18,
         BINPT       => -17,
         FILE_IS_SLV => true,
         ADDR_WIDTH  => 14,
         MAX_ADDR    => 13311,
         LATENCY     => 1
      )
      PORT MAP(
         clk         => clk,
         ce          => '1',
         reset       => reset,
         WrEn        => '0',
         WrAddr      => 0,
         RdAddrA     => 0,
         RdAddrB     => RdAddr0_i,
         WrData      => (others=>'0'),
         RdOutA      => open,
         RdOutB      => RealRead(2)
      );

   Variables.MiscBits(CONJUGATE) <= '0';
   Variables.PilotSyncOffset <= to_ufixed(PilotSyncOffset, 11, 0);

   DDS0 : dds_sin_cos
      PORT MAP (
         aclk                 => clk,
         aresetn              => not reset,
         s_axis_config_tvalid => DataValid(0),
         s_axis_config_tdata  => (63 downto 18+32=> Phase0(Phase0'left)) & Phase0 & (31 downto 18=> Frequency0(Frequency0'left)) & Frequency0, -- sign extend phase and freq values
         m_axis_data_tvalid   => open,
         m_axis_data_tdata    => SinCosData0,
         m_axis_phase_tvalid  => open,
         m_axis_phase_tdata   => PhaseData0
   );

   Phase0R <= to_sfixed(SinCosData0(15 downto 0), Phase0R);
   Phase0I <= to_sfixed(SinCosData0(31 downto 16), Phase0I);

   DDS1 : dds_sin_cos
      PORT MAP (
         aclk                 => clk,
         aresetn              => not reset,
         s_axis_config_tvalid => DataValid(0),
         s_axis_config_tdata  => (63 downto 18+32=> Phase1(Phase1'left)) & Phase1 & (31 downto 18=> Frequency1(Frequency1'left)) & Frequency1,
         m_axis_data_tvalid   => open,
         m_axis_data_tdata    => SinCosData1,
         m_axis_phase_tvalid  => open,
         m_axis_phase_tdata   => PhaseData1
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
         clk         => clk,
         reset       => reset,
         ce          => '1',
         ValidIn     => DataValid(0),
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
         clk         => clk,
         reset       => reset,
         ce          => '1',
         ValidIn     => DataValid(0),
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

   Brik1u : Brik1
      generic map (
         SIM_MODE    => SIM_MODE
      )
      port map(
         clk            => clk,
         clk2x          => clk2x,
         ce             => '1',
         reset          => reset,
         reset2x        => reset,
         Variables      => Variables,
         ResampleR      => ResampleR_s,
         ResampleI      => ResampleI_s,
         validin        => PhaseValid,
         PilotFound     => open,
         PilotLocked    => open,
         RealOut        => RealOut,
         ImagOut        => ImagOut,
         ValidOut       => DataValid_o,
         startout       => StartOut
   );

end rtl;
