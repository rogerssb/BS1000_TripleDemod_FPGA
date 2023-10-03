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
-- Module Name: Brik2_tb.vhd
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
use ieee.std_logic_textio.all;
use ieee.numeric_std.all;
use ieee.math_real.all;
library std;
use std.env;
use work.Semco_pkg.all;
use work.fixed_pkg.all;
entity Brik2_tb is
end Brik2_tb;

architecture rtl of Brik2_tb is

  -- Define Components

   COMPONENT Brik2
      PORT(
         clk186,
         clk93,
         reset,
         reset2x,
         ce,
         StartHPP,
         StartIn,
         ValidIn,
         Mag0GtMag1     : IN  std_logic;
         InR,
         InI            : IN  SLV18;
         H0MagIn,
         H1MagIn        : IN  std_logic_vector(12 downto 0);
         PilotLocked,
         EstimatesDone  : OUT std_logic;
         H0EstR,
         H0EstI,
         H1EstR,
         H1EstI         : OUT STC_PARM;
         m_ndx0,
         m_ndx1         : OUT integer range -5 to 3;
         Mu0,
         Mu1            : OUT FLOAT_1_18;
         PhaseDiff      : OUT sfixed(0 downto -11);
         DeltaTauEst    : OUT sfixed(0 downto -5)
      );
   END COMPONENT Brik2;

   COMPONENT TrellisDetector is
      PORT (
         clk,
         clkEn,
         reset,
         sampleEn,
         startFrame              : std_logic;
         h0EstReal,
         h0EstImag,
         h1EstReal,
         h1EstImag,
         in0Real,
         in0Imag,
         in1Real,
         in1Imag              : IN  SLV18;
         deltaTauEst          : IN  std_logic_vector(5 downto 0);
         finalMetricOutputEn,
         outputEn             : OUT std_logic;
         finalMetric          : OUT SLV18;
         outputBits           : OUT std_logic_vector(3 downto 0)
      );
   END COMPONENT TrellisDetector;

   COMPONENT ReadGoldRef IS
      GENERIC (
         FILE_NAME         : string := "../simData";
         NUM_VALUES        : natural := 1;         -- number of values per line
         DATA_TYPE         : GoldDataType := Bools; -- data type, std_logic 0/1, hex int/uint or double
         OUT_WIDTH         : natural := 32;        -- total width of each value
         OUT_BINPT         : integer :=  31        -- number of fraction bits if any. If none, set to 0
     );
      PORT(
         clk               : IN  std_logic;
         reset             : IN  std_logic;
         ce                : IN  std_logic;
         OutputData        : OUT vector_of_slvs(0 to NUM_VALUES-1)(OUT_WIDTH-1 downto 0);
         Done              : OUT std_logic
      );
   END COMPONENT ReadGoldRef;

   COMPONENT gng
      GENERIC (
          INIT_Z1    : signed(63 downto 0) := 64x"45D000FFFFF005FF"; -- 05,030,521,883,283,424,767;
          INIT_Z2    : signed(63 downto 0) := 64x"FFFCBFFFD8000680"; -- 18,445,829,279,364,155,008;
          INIT_Z3    : signed(63 downto 0) := 64x"FFDA350000FE95FF"  -- 18,436,106,298,727,503,359
      );
      PORT (
          clk,                      -- system clock
          rstn,                     -- system synchronous reset, active low
          ce         : IN  STD_LOGIC;  -- clock enable
          valid_out  : OUT STD_LOGIC;  -- output data valid
          data_out   : OUT SLV16     -- output data, s<16,11>
      );
   END COMPONENT gng;

   COMPONENT vm_cordic_fast IS
      GENERIC (
         n  : positive := 14
      );
      PORT (
         clk,
         ena      : IN  std_logic;
         x,
         y        : IN  std_logic_vector(n-1 downto 0);
         m        : OUT std_logic_vector(n downto 2);
         p        : OUT std_logic_vector(n-2 downto 1);
         enOut    : OUT std_logic
      );
   END COMPONENT vm_cordic_fast;

-------------------------------------------------------------------------------
--                       CONSTANT DEFINITIONS
-------------------------------------------------------------------------------

   constant DELAY             : natural  := 0;
   constant ZEROS_OF          : natural_array(0 to 15) := (4,3,3,2,3,2,2,1,3,2,2,1,2,1,1,0);
   constant ExpectedBer       : natural_array(0 to 15) :=(
      1693, 1635, 1638, 1644, 186, 125, 75, 43, 20, 5, 3, 1, 0, 0, 0, 0);
      -- 35200
   signal   reset, resetAll, reset93,
            clk,
            clk2x,
            ce                : std_logic := '1';
   SIGNAL   StartIn,
            ValidIn,
            StartHPP,
            Mag0GTMag1,
            EstimatesDone,
            Pass,
            PilotLocked,
            TrellisEn,
            TrellisSkip,
            NotFirstFrame,
            finalMetricOutputEn,
            TrellisOutEnRaw,
            TrellisStart,
            TrellisOutEn      : std_logic := '0';
   SIGNAL   H0Mag,
            H1Mag             : std_logic_vector(12 downto 0);
   SIGNAL   Dones             : UINT8 := (others=>'1');
   SIGNAL   StartRead,
            ValidRead         : vector_of_slvs(0 to 0)(0 downto 0) := (others=>(others=>'0'));
   SIGNAL   VarsReal,
            VarsImag          : vector_of_slvs(0 to 0)(17 downto 0) := (others=>(others=>'0'));
   SIGNAL   RealRot,
            ImagRot,
            RealRead,
            ImagRead,
            FinalMetric       : STC_PARM;
   SIGNAL   TrellisBitsRaw,
            TrellisBits       : SLV4;
   SIGNAL   H0EstR,
            H0EstI,
            H1EstR,
            H1EstI            : STC_PARM;
   SIGNAL   DeltaTauEst       : sfixed(0 downto -5);
   SIGNAL   PacketCount,
            FrameCount,
            SampleCount,
            TrellisCount,
            ErrorCount,
            ErrorTotal,
            BitCount          : natural := 0;
   SIGNAL   BER,
            Cosine,
            Sine              : real := 0.0;
   SIGNAL   Phase             : real := 13.5;
   signal   Noise1,
            Noise2            : SLV16;
   signal   SNR,
            NoiseGain         : real := 20.0;
   signal   Noise1_s,
            Noise2_s          : sfixed(3 downto -12) := (others=>'0');
   signal   Noise1Gained,
            Noise2Gained,
            NoiseGain_s       : sfixed(2 downto -17) := (others=>'0');

BEGIN

   process begin
      wait for 500 ps;
      clk2x <= not clk2x;
      if (clk2x) then
         clk <= not clk;
      end if;
   end process;

   reset_process : process begin
      wait for 4 ns;
      resetAll <= '0';
   end process reset_process;

   reset <= PilotLocked or resetAll;

   ReadReal : ReadGoldRef
   GENERIC MAP(
      FILE_NAME         => "..\simData\AllOnesDataR_+0_100_50%.txt",
      NUM_VALUES        => 1,
      DATA_TYPE         => SFix,
      OUT_WIDTH         => 18,
      OUT_BINPT         => 17
   )
   PORT MAP(
      clk               => clk2x,
      reset             => reset,
      ce                => '1',
      OutputData        => VarsReal,
      Done              => Dones(7)
   );

   ReadImag : ReadGoldRef
   GENERIC MAP(
      FILE_NAME         => "..\simData\AllOnesDataI_+0_100_50%.txt",
      NUM_VALUES        => 1,
      DATA_TYPE         => SFix,
      OUT_WIDTH         => 18,
      OUT_BINPT         => 17
   )
   PORT MAP(
      clk               => clk2x,
      reset             => reset,
      ce                => '1',
      OutputData        => VarsImag,
      Done              => Dones(6)
   );

   ReadValid : ReadGoldRef
   GENERIC MAP(
      FILE_NAME         => "..\simData\AllOnesDataV_+0_100_50%.txt",
      NUM_VALUES        => 1,
      DATA_TYPE         => Bools,
      OUT_WIDTH         => 1,
      OUT_BINPT         => 0
   )
   PORT MAP(
      clk               => clk2x,
      reset             => reset,
      ce                => '1',
      OutputData        => ValidRead,
      Done              => Dones(5)
   );

   ReadStart : ReadGoldRef
   GENERIC MAP(
      FILE_NAME         => "..\simData\AllOnesDataS_+0_100_50%.txt",
      NUM_VALUES        => 1,
      DATA_TYPE         => Bools,
      OUT_WIDTH         => 1,
      OUT_BINPT         => 0
   )
   PORT MAP(
      clk               => clk2x,
      reset             => reset,
      ce                => '1',
      OutputData        => StartRead,
      Done              => Dones(4)
   );

   NoiseGen1 : gng
      GENERIC MAP (
         INIT_Z1 => 64x"45D000FFFFF005FF",     -- 05,030,521,883,283,424,767
         INIT_Z2 => 64x"FFFCBFFFD8000680",     -- 18,445,829,279,364,155,008
         INIT_Z3 => 64x"FFDA350000FE95FF"      -- 18,436,106,298,727,503,359
      )
      PORT MAP (
         clk        => clk,
         rstn       => not Reset,
         ce         => '1',
         valid_out  => open,
         data_out   => Noise1
   );

   NoiseGen2 : gng
      GENERIC MAP (
         INIT_Z1 => 64x"C9B0_01FF_FFE0_09FF",   -- 14,533,118,196,545,751,551
         INIT_Z2 => 64x"FFF9_7FFF_B000_0D00",   -- 18,444,914,485,018,758,400
         INIT_Z3 => 64x"FFB5_6A00_00FF_2BFF"    -- 18,425,749,998,705,519,615
      )
      PORT MAP (
         clk        => clk,
         rstn       => not Reset,
         ce         => '1',
         valid_out  => open,
         data_out   => Noise2
   );

   RealRead <= resize((to_sfixed(VarsReal(0), 0, -17) + Noise1Gained)/3, RealRead);
   ImagRead <= resize((to_sfixed(VarsImag(0), 0, -17) + Noise2Gained)/3, RealRead);
   Cosine   <= cos(MATH_PI / 180.0 * Phase);
   Sine     <= sin(MATH_PI / 180.0 * Phase);
   StartProcess : process(clk2x)
   begin
      if (rising_edge(clk2x)) then
         if (reset) then
            StartIn  <= '0';
            ValidIn  <= '0';
         elsif (ce) then
            if (StartIn) then
               SNR   <= SNR - 0.25;
--               Phase <= Phase + 2.5;
            end if;

            NoiseGain <= (10.0 ** (-SNR/20.0));
            NoiseGain_s    <= to_sfixed(NoiseGain, NoiseGain_s);
            Noise1_s       <= to_sfixed(Noise1, Noise1_s);
            Noise2_s       <= to_sfixed(Noise2, Noise1_s);
            Noise1Gained   <= resize(Noise1_s * NoiseGain_s, Noise1Gained);
            Noise2Gained   <= resize(Noise2_s * NoiseGain_s, Noise2Gained);
            RealRot        <= resize(RealRead * Cosine - ImagRead * Sine, RealRot);
            ImagRot        <= resize(ImagRead * Cosine + RealRead * Sine, RealRot);
            StartIn        <= StartRead(0)(0);
            ValidIn        <= ValidRead(0)(0);
            if (ValidIn) then
               SampleCount <= SampleCount + 1;
            else
               SampleCount <= 0;
            end if;
            if (ValidRead(0)(0) and not ValidIn) then
               PacketCount <= PacketCount + 1;
            elsif (StartIn) then
               PacketCount <= 0;
            end if;
         end if;

         reset93 <= reset;

      end if;
   end process StartProcess;

   Brik2_u : Brik2
   PORT MAP(
      clk186         => clk2x,
      clk93          => clk,
      reset          => reset or reset93,
      reset2x        => reset,
      ce             => ce,
      StartHPP       => StartHPP,
      StartIn        => StartIn,
      ValidIn        => ValidIn,
      Mag0GtMag1     => Mag0GtMag1,
      InR            => to_slv(RealRot),
      InI            => to_slv(ImagRot),
      PilotLocked    => PilotLocked,
      EstimatesDone  => EstimatesDone,
      H0MagIn        => H0Mag,
      H1MagIn        => H1Mag,
      H0EstR         => H0EstR,
      H0EstI         => H0EstI,
      H1EstR         => H1EstR,
      H1EstI         => H1EstI,
      DeltaTauEst    => DeltaTauEst,
      m_ndx0         => open,
      m_ndx1         => open,
      Mu0            => open,
      Mu1            => open,
      PhaseDiff      => open
   );

   cordic0 : vm_cordic_fast
      GENERIC MAP (
         n => 14
      )
      PORT MAP (
         clk   => clk,
         ena   => EstimatesDone,
         x     => to_slv(H0EstR(0 downto -13)),
         y     => to_slv(H0EstI(0 downto -13)),
         m     => H0Mag,          -- m[n:2]
         p     => open,
         enOut => StartHPP
      );

   cordic1 : vm_cordic_fast
      GENERIC MAP (
         n => 14
      )
      PORT MAP (
         clk   => clk,
         ena   => EstimatesDone,
         x     => to_slv(H1EstR(0 downto -13)),
         y     => to_slv(H1EstI(0 downto -13)),
         m     => H1Mag,          -- m[n:2]
         p     => open,
         enOut => open
      );

/*
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
            TrellisOutEn   <= '0';
            TrellisSkip    <= '0';
            TrellisBits    <= x"0";
            TrellisCount   <= 0;
            ErrorCount     <= 0;
         elsif (CE) then
            if (TrellisStart) then  -- ignore the first trellis output
               TrellisSkip <= '1';
               if (NotFirstFrame) then
                  ErrorTotal <= ErrorTotal + ErrorCount;
                  BitCount   <= BitCount + 3200;
                  FrameCount <= FrameCount + 1;
               end if;
               if (FrameCount = 4) then
                  FreqIn <= Float_Zero_128K; -- Let freq estimate build
               end if;
               TrellisCount <= 0;
               ErrorCount   <=  0;
               NotFirstFrame <= '1';
            end if;
            TrellisOutEn <= '1' when (TrellisOutEnRaw = '1') and (TrellisSkip = '0') and (TrellisCount < 800) else '0';
            if (TrellisOutEnRaw) then
               TrellisSkip <= '0';
            end if;
            if (TrellisOutEn) then
               TrellisCount <= TrellisCount + 1;
               ErrorCount <= ErrorCount + ZEROS_OF(to_integer(unsigned(TrellisBits)));
            end if;
            if (BitCount > 0) then
               BER <= real(ErrorTotal) / real(BitCount);
            end if;
            TrellisBits  <= TrellisBitsRaw;
         end if;
      end if;
   end process TrellisProcess;
*/
end rtl;
