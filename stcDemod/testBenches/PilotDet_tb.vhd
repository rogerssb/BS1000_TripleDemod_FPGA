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
-- Module Name: PilotDet_tb.vhd
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
use ieee.std_logic_textio.all;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
use IEEE.math_real.all;
use std.env.stop;
use work.fixed_pkg.all;
use work.Semco_pkg.ALL;

/*
entity glbl is
end glbl;
*/

library ieee;
use ieee.std_logic_textio.all;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
use IEEE.math_real.all;
use std.env.stop;
use work.fixed_pkg.all;
use work.Semco_pkg.ALL;

entity PilotDet_tb is
   generic (
      IN_WIDTH    : natural   := 18;
      IN_BINPT    : natural   := 17;
      OUT_WIDTH   : natural   := 18;
      OUT_BINPT   : natural   := 17
   );
end PilotDet_tb;

architecture rtl of PilotDet_tb is

  -- Define Components

/*
component glbl is
end component glbl;
*/

COMPONENT PilotDetectSliding is
   GENERIC
      (SIM_MODE : boolean := false
   );
   PORT(
         clk,
         clk2x,
         reset,
         reset2x,
         ce,
         SpectrumInv,
         Mag0GtMag1,
         ValidIn        : IN  std_logic;
         ReIn,
         ImIn           : IN  FLOAT_1_18;
         SearchRange    : IN  SLV4;
         CorrPntr,                                 -- Packet buffer pointer
         RawAddr        : OUT ufixed(15 downto 0);
         ReOut,
         ImOut          : OUT FLOAT_1_18;          -- Packetized output
         Magnitude0,
         Magnitude1,
         PhaseOut0,
         PhaseOut1,                                -- Streaming Mag/Phs of iFFT
         MagPeak0,
         PhsPeak0,
         MagPeak1,
         PhsPeak1       : OUT SLV18;               -- Peak Mag/Phs of iFFT
         PilotFound,
         ValidOut,                                 -- ReOut/ImOut valid
         StartOut       : OUT std_logic
      );
   end COMPONENT PilotDetectSliding;

   COMPONENT PilotSync
      PORT (
         clk,
         reset,
         ce,
         PilotPulseIn,
         PilotFound,
         ValidIn        : IN STD_LOGIC;
         CorrPntr       : IN ufixed(15 DOWNTO 0);
         Offset         : IN  SLV4;
         RealIn,
         ImagIn         : IN  Float_1_18;
         PilotOffset    : OUT SFixed(8 downto 0);
         StartNextFrame : OUT ufixed(15 DOWNTO 0);
         RealOut,
         ImagOut        : OUT Float_1_18;
         StartOut,
         ValidOut    : OUT STD_LOGIC
      );
   END COMPONENT;

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
         DeltaTauEst    : OUT sfixed(0 downto -5);
         log10MseEnable : OUT std_logic;
         log10MSE       : OUT sfixed(3 downto -7)
      );
   END COMPONENT Brik2;

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

   COMPONENT ReadGoldRef IS
      GENERIC (
         FILE_NAME         : string := "../test_data/file.txt";
         NUM_VALUES        : natural := 1;         -- number of values per line
         DATA_TYPE         : GoldDataType := Bools; -- data type, std_logic 0/1, hex int/uint or double
         OUT_WIDTH         : natural := 32;        -- total width of each value
         OUT_BINPT         : natural := 31         -- number of fraction bits if any. If none, set to 0
      );
      PORT(
         clk               : IN  std_logic;
         reset             : IN  std_logic;
         ce                : IN  std_logic;
         OutputData        : OUT vector_of_slvs(0 to NUM_VALUES-1)(OUT_WIDTH-1 downto 0);
         Done              : OUT std_logic
      );
   END COMPONENT ReadGoldRef;

-------------------------------------------------------------------------------
--                       CONSTANT DEFINITIONS
-------------------------------------------------------------------------------

   constant DELAY                : positive  := 4;
   constant InitialSnr           : real := 100.0;

   TYPE vector_of_real IS ARRAY (NATURAL RANGE <>) OF real;

   signal   Reset,
            NoiseReset,
            ResetMag             : std_logic := '1';
   signal   clk, clk2x           : std_logic := '1';

   SIGNAL   DataValid,
            StartOutPS,
            ValidOutPS,
            PilotFound,
            PilotFoundPD,
            PilotFoundCE,
            PhaseDiffEnPS,
            CordicValid,
            Mag0GtMag1,
            AgcMode,
            EstimatesDone,
            StartInBrik2Dly,
            ValidInBrik2Dly,
            PilotValidOut,
            PilotPulse          : std_logic := '0';
   SIGNAL   RealOutPS,
            ImagOutPS,
            InRBrik2Dly,
            InIBrik2Dly,
            MagR,
            MagI,
            Noise2Rms,
            H0EstR,
            H0EstI,
            H1EstR,
            H1EstI,
            ReIn,
            ImIn                : STC_PARM;
   SIGNAL   H0Mag,
            H1Mag             : std_logic_vector(12 downto 0);
   SIGNAL   PilotOffset_s     : SFixed(8 downto 0);
   SIGNAL   RawAddr,
            StartNextFrame,
            CorrPntr          : ufixed(15 downto 0);
   SIGNAL   Done,
            BitRate,
            BitMax            : UINT8 := (others=>'0');
   SIGNAL   Errors            : vector_of_slvs(0 to 1)(31 downto 0);
   SIGNAL   ErrorCount        : UINT16 := (others=>'0');
   SIGNAL   VarsReal,
            VarsImag          : vector_of_slvs(0 to 0)(17 downto 0);
   signal   Count,
            FrameCount,
            Frames            : integer := 0;
   signal   Noise1,
            Noise2            : SLV16;
   signal   SNR,
            NoiseGain         : real := InitialSnr;
   signal   signalReal        : real;
   signal   signalImag        : real;
   signal   signalMagSquaredSum : real := 0.0;
   signal   noise1Real        : real;
   signal   noise2Real        : real;
   signal   noiseMagSquaredSum : real := 0.0;
   signal   noiseMagCount     : real := 0.0;
   signal   snr0              : real;
   signal   snr1              : real;
   signal   snrAvg            : real := 0.0;
   signal   snrAvgdB          : real;
   signal   Increment         : real := 1.0;
 --  signal   NoiseTotalArray,
 --           SumTotalArray     : vector_of_real(9 downto 0) := (others=>0.0);
   signal   Noise1Gained,
            Noise2Gained      : sfixed(2 downto -15) := (others=>'0');
   SIGNAL   PilotRealOut,
            PilotImagOut      : Float_1_18;
   SIGNAL   MagRSlv,
            MagISlv           : SLV18;
   SIGNAL   H0Phase,
            H1Phase           : SLV12;
   SIGNAL   PilotOffset       : STD_LOGIC_VECTOR(8 downto 0);
begin

   process begin
      wait for 500 ps;
      if (SNR < 0.0) then
         if ( (ErrorCount > 0) ) then
            report "Simulation Failed" severity failure;
         else
            report "Simulation Passed" severity failure;
         end if;
         stop;
      else
         clk2x <= not clk2x;
         if (clk2x) then
            clk <= not clk;
         end if;
      end if;
   end process;

   process begin
      wait for 3 ns;
         BitMax <= x"04";
         NoiseReset <= '0';
   end process;

   process begin
      wait for 10 ns;
         ResetMag <= '0';
   end process;

   NoiseGen1 : gng
      GENERIC MAP (
         INIT_Z1 => 64x"45D000FFFFF005FF",     -- 05,030,521,883,283,424,767
         INIT_Z2 => 64x"FFFCBFFFD8000680",     -- 18,445,829,279,364,155,008
         INIT_Z3 => 64x"FFDA350000FE95FF"      -- 18,436,106,298,727,503,359
      )
      PORT MAP (
         clk        => clk,
         rstn       => not NoiseReset,
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
         rstn       => not NoiseReset,
         ce         => '1',
         valid_out  => open,
         data_out   => Noise2
   );

   reg_process : process (clk)
 --     variable Average_u   : real;
   begin
      if (rising_edge(clk)) then
         if (BitRate < BitMax) then
            BitRate <= BitRate + 1;
            DataValid <= '0';
         else
            BitRate <= x"00";
            DataValid <= '1';
         end if;

	 /*
         if ( unsigned(Errors(0)) > 0 or unsigned(Errors(1)) > 0 ) then
            ErrorCount <= ErrorCount + 1;
         end if;
	 */

        signalReal <= to_real(to_sfixed(VarsReal(0),0,-17));
        signalImag <= to_real(to_sfixed(VarsImag(0),0,-17));
        noise1Real <= to_real(to_sfixed(Noise1,2,-13)) * NoiseGain;
        noise2Real <= to_real(to_sfixed(Noise2,2,-13)) * NoiseGain;
        --noise1Real <= to_real(Noise1Gained);
        --noise2Real <= to_real(Noise2Gained);
        if (DataValid) then
            signalMagSquaredSum <= signalMagSquaredSum
                                 + (signalReal * signalReal)
                                 + (signalImag * signalImag);
            noiseMagSquaredSum <= noiseMagSquaredSum 
                                + (noise1Real * noise1Real) 
                                + (noise2Real * noise2Real);
            noiseMagCount <= noiseMagCount + 1.0;
        end if;

      AgcMode <= '1';

         --if (Count = 1527) then
         if (Count = 4095) then
         --if (Count = (4095 - 256)) then
            if (SNR < -0.0) then
               if (AgcMode) then
                  SNR <= InitialSnr;
               else
                  AgcMode <= '1';
                  SNR     <= InitialSnr;
               end if;
            elsif (Frames < 9) then
               Frames <= Frames + 1;
            else
               Frames <= 0;
               SNR    <= SNR - Increment;
            end if;
            FrameCount <= FrameCount + 1;
            Count       <= 0;
            reset       <= '1';
         elsif (DataValid) then
            Count <= Count + 1;
            reset <= '0';
         end if;

         NoiseGain <= (10.0 ** (-SNR/20.0));
         Noise1Gained    <= resize(to_sfixed(Noise1, 2, -13) * NoiseGain, Noise1Gained);
         Noise2Gained    <= resize(to_sfixed(Noise2, 2, -13) * NoiseGain, Noise2Gained);
         if (AgcMode) then
            --ReIn <= resize((to_sfixed(VarsReal(0), 0, -17) + Noise1Gained) / (1.0 + NoiseGain) / 2, ReIn);
            --ImIn <= resize((to_sfixed(VarsImag(0), 0, -17) + Noise2Gained) / (1.0 + NoiseGain) / 2, ReIn);
            ReIn <= resize(to_sfixed(
                                --((signalReal + noise1Real)/(1.0 + NoiseGain)/2.0),
                                (signalReal + noise1Real),
                                0,
                                -17),
                           ReIn);
            ImIn <= resize(to_sfixed(
                                --((signalImag + noise2Real)/(1.0 + NoiseGain)/2.0),
                                (signalImag + noise2Real),
                                0,
                                -17), 
                           ReIn);
         else
            ReIn <= resize(to_sfixed(VarsReal(0), 0, -17) + to_sfixed(noise1Real,2,-15) / 2, ReIn);
            ImIn <= resize(to_sfixed(VarsImag(0), 0, -17) + to_sfixed(noise2Real,2,-15) / 2, ReIn);
         end if;
      end if;
   end process reg_process;

   ReadReal : ReadGoldRef
   GENERIC MAP(
      --FILE_NAME         => "../stcDemod/simData/resampled_r.txt",
      FILE_NAME         => "c:/modem/vivado2017/stcDemod/simData/resampled_r.txt",
      --FILE_NAME         => "c:/modem/stcDemod/cLanguageSim/resamplerR.txt",
      NUM_VALUES        => 1,
      DATA_TYPE         => SFix,
      OUT_WIDTH         => 18,
      OUT_BINPT         => 17
   )
   PORT MAP(
      clk               => clk,
      reset             => reset,
      ce                => DataValid,
      OutputData        => VarsReal,
      Done              => Done(7)
   );

   ReadImag : ReadGoldRef
   GENERIC MAP(
      --FILE_NAME         => "../stcDemod/simData/resampled_i.txt",
      FILE_NAME         => "c:/modem/vivado2017/stcDemod/simData/resampled_i.txt",
      --FILE_NAME         => "c:/modem/stcDemod/cLanguageSim/resamplerI.txt",
      NUM_VALUES        => 1,
      DATA_TYPE         => SFix,
      OUT_WIDTH         => 18,
      OUT_BINPT         => 17
   )
   PORT MAP(
      clk               => clk,
      reset             => reset,
      ce                => DataValid,
      OutputData        => VarsImag,
      Done              => Done(6)
   );

   PD_u : PilotDetectSliding
      GENERIC MAP
         (SIM_MODE => TRUE
      )
      PORT MAP(
         clk            => clk,
         clk2x          => clk2x,
         reset          => reset,
         reset2x        => reset,
         ce             => '1',
         SpectrumInv    => '0',
         Mag0GtMag1     => '1',
         ValidIn        => DataValid,
         ReIn           => ReIn,
         ImIn           => ImIn,
         SearchRange    => x"2",
         PilotFound     => PilotFoundPD,
         CorrPntr       => CorrPntr,
         RawAddr        => RawAddr,
         Magnitude0     => open,
         Magnitude1     => open,
         PhaseOut0      => open,
         PhaseOut1      => open,
         MagPeak0       => open,
         PhsPeak0       => open,
         MagPeak1       => open,
         PhsPeak1       => open,
         ReOut          => PilotRealOut,
         ImOut          => PilotImagOut,
         ValidOut       => PilotValidOut,
         StartOut       => PilotPulse
      );

   PilotFound     <= '1' when (PilotFoundPD = '1') and (PilotFoundCE = '1') and (unsigned(MagRSlv) < 25000) else '0';

   PS_u : pilotsync
      PORT MAP (
         clk            => clk2x,
         ce             => '1',
         reset          => Reset,
         PilotPulseIn   => PilotPulse,
         ValidIn        => PilotValidOut,
         PilotFound     => PilotFound,
         CorrPntr       => CorrPntr,
         PilotOffset    => PilotOffset_s,
         StartNextFrame => StartNextFrame,
         Offset         => x"A",
         RealIn         => PilotRealOut,
         ImagIn         => PilotImagOut,
         RealOut        => RealOutPS,     -- 186Mhz
         ImagOut        => ImagOutPS,
         StartOut       => StartOutPS,
         ValidOut       => ValidOutPS
   );

   PilotOffset <= to_slv(PilotOffset_s);

   InterBrikClk : process(clk2x) is
   begin
      if(rising_edge(clk2x)) then
         if (Reset) then
            StartInBrik2Dly <= '0';
            ValidInBrik2Dly <= '0';
            InRBrik2Dly     <= (others=>'0');
            InIBrik2Dly     <= (others=>'0');
         else
            StartInBrik2Dly <= StartOutPS;
            ValidInBrik2Dly <= ValidOutPS;
            InRBrik2Dly     <= RealOutPS;
            InIBrik2Dly     <= ImagOutPS;

         end if;
      end if;
   end process InterBrikClk;

   Brik2_u : Brik2
      PORT MAP(
         clk93          => Clk,
         clk186         => clk2x,
         Reset          => Reset,
         Reset2x        => Reset,
         CE             => '1',
         StartIn        => StartInBrik2Dly,
         ValidIn        => ValidInBrik2Dly,
         InR            => to_slv(InRBrik2Dly),
         InI            => to_slv(InIBrik2Dly),
         Mag0GtMag1     => Mag0GtMag1,
         H0MagIn        => H0Mag,
         H1MagIn        => H1Mag,
         PhaseDiff      => open,
         StartHPP       => CordicValid,
         H0EstR         => H0EstR,
         H0EstI         => H0EstI,
         H1EstR         => H1EstR,
         H1EstI         => H1EstI,
         DeltaTauEst    => open,
         m_ndx0         => open,
         m_ndx1         => open,
         Mu0            => open,
         Mu1            => open,
         EstimatesDone  => EstimatesDone,
         PilotLocked    => open,
         log10MseEnable => open,
         log10MSE       => open
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
         p     => H0Phase,
         enOut => CordicValid
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
         p     => H1Phase,
         enOut => open
      );

   AGCprocess : process(clk)   -- if AGC overdrives front end, the pilot gets lost and goes to zero, causing more AGC
   begin                         -- To compensate, check for PilotFound, else feedback raw sample RMS signal
      if (rising_edge(clk)) then
         if (ResetMag) then
            MagR      <= 18x"0";
            MagI      <= 18x"0";
            Noise2Rms <= 18x"0";
         elsif (DataValid) then
            MagR      <= resize(MagR - (MagR sra 10) + (abs(ReIn) sra 10), MagR);
            MagI      <= resize(MagI - (MagI sra 10) + (abs(ImIn) sra 10), MagR);
            Noise2Rms <= resize(Noise2Rms - (Noise2Rms sra 10) + (abs(Noise1Gained) sra 10), Noise2Rms);
         end if;

         MagRSlv <= to_slv(MagR);
         MagISlv <= to_slv(MagI);

      end if;
   end process;

--   myGlbl : glbl ;

end rtl;
