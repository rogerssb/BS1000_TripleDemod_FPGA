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

Module Name: Brik2.vhd
Description:

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
use IEEE.fixed_float_types.all;
library std;
use std.textio.all;
use work.fixed_generic_pkg_mod.all;
USE IEEE.math_real.all;
USE work.Semco_pkg.ALL;

ENTITY stcDemod IS
   PORT(
      clk           : IN  std_logic;
      reset         : IN  std_logic;

      -- Processor status/configuration bus
      cs            : IN  std_logic;
      we            : IN  std_logic;
      addr          : IN  std_logic_vector(12 downto 0);
      din           : IN  std_logic_vector(31 downto 0);
      dout          : OUT std_logic_vector(31 downto 0);

      -- IF Samples from the ADC
      ifSamples     : IN  std_logic_vector(17 downto 0);

      -- DAC outputs
      dac0,
      dac1,
      dac2          : OUT sfixed(0 downto -17);

      __ Clock and data output
      dataOut       : OUT std_logic;
      dataOutEn     : OUT std_logic
   );
END stcDemod;


ARCHITECTURE rtl OF stcDemod IS

BEGIN

    ----------------------------------- DDC -----------------------------------
    COMPONENT frontend IS
        PORT (
            pilotfound  : IN    std_logic_vector( 0 downto 0 );
            a2d_data    : IN    std_logic_vector( 17 downto 0 );
            validin     : IN    std_logic_vector( 0 downto 0 );
            clk         : IN    std_logic;
            imagout     : OUT   std_logic_vector( 17 downto 0 );
            realout     : OUT   std_logic_vector( 17 downto 0 );
            startout    : OUT   std_logic_vector( 0 downto 0 );
            validout    : OUT   std_logic_vector( 0 downto 0 );
            pilotreal   : OUT   std_logic_vector( 17 downto 0 );
            pilotimag   : OUT   std_logic_vector( 17 downto 0 );
            fe_valid    : OUT   std_logic_vector( 0 downto 0 )
        );
    END COMPONENT frontend;

    SIGNAL  ddcReal,
            ddcImag     : std_logic_vector(17 downto 0);
    SIGNAL  pilotReal,
            pilotImag   : std_logic_vector(17 downto 0);
    SIGNAL  ddcStart,
            ddcValid,
            pilotValid  : std_logic;
    ddc : frontend
        PORT MAP (
            pilotfound  =>  pilotFound;
            a2d_data    =>  ifSamples;
            validin     =>  '1';
            clk         =>  clk;
            startout    =>  ddcStart;
            validout    =>  ddcValid;
            realout     =>  ddcReal;
            imagout     =>  ddcImag;
            fe_valid    =>  pilotValid;
            pilotreal   =>  pilotReal;
            pilotimag   =>  pilotImag;
        );

    ---------------------------- Pilot Detector -------------------------------
    COMPONENT pilotdetect IS
        PORT (
            clk             : IN    std_logic;
            conj_imag       : IN    std_logic_vector( 0 downto 0 );
            validpilot      : IN    std_logic_vector( 0 downto 0 );
            imagdata        : IN    std_logic_vector( 17 downto 0 );
            realdata        : IN    std_logic_vector( 17 downto 0 );
            max_val         : OUT   std_logic_vector( 17 downto 0 );
            new_pilot       : OUT   std_logic_vector( 0 downto 0 );
            pilot_found     : OUT   std_logic_vector( 0 downto 0 );
            pilot_index     : OUT   std_logic_vector( 8 downto 0 );
            pilot_indexes   : OUT   std_logic_vector( 8 downto 0 )
        );
    END COMPONENT pilotdetect;


    pilotDetector : pilotdetect 
        PORT MAP (
            clk             =>  clk;
            conj_imag       =>  '0';
            validpilot      =>  pilotValid;
            realdata        =>  pilotReal;
            imagdata        =>  pilotImag;
            max_val         =>
            new_pilot       =>
            pilot_found     =>
            pilot_index     =>
            pilot_indexes   =>
        );


    -------------------------- Brik 1 -----------------------------------------
    COMPONENT Brik1 IS
        GENERIC(
            DATA_WIDTH  : positive := 18;
            WORDS       : positive := 512
        );
        PORT(
            clk                 : IN    std_logic;
            reset               : IN    std_logic;
            ce                  : IN    std_logic;
            gain_we             : IN    std_logic;
            digital_gain        : IN    sfixed(1 downto -14);
            en_ad               : IN    std_logic;
            ValidIn             : IN    std_logic;
            conj_imag           : IN    std_logic;
            A2D_Data            : IN    sfixed(0 downto -17);
            signal_out_valid    : OUT   std_logic;
            signal_out_start    : OUT   std_logic;
            signal_out_r,
            signal_out_i        : OUT   sfixed(0 downto -17)
        );
    END COMPONENT Brik1;

    SIGNAL  brik1OutEn,
            brik1Start          :   std_logic;
    SIGNAL  brik1Real,
            brik1Imag,          :   sfixed(1 downto -16);
    brik1 : Brik1
        GENERIC_MAP (
            DATA_WIDTH          => 18;
            WORDS               => 512
        )
        PORT MAP (
            clk                 => clk;
            reset               => reset;
            ce                  => clkEn;
            gain_we             => '1';
            digital_gain        => adcGain;
            en_ad               => '1';
            ValidIn             => '1';
            conj_imag           => '0';
            A2D_Data            => ifSamples;
            signal_out_valid    => brik1OutEn;
            signal_out_start    => brik1Start;
            signal_out_r        => brik1Real;
            signal_out_i        => brik1Imag;
        );

    -------------------------- Brik 2 -----------------------------------------

   COMPONENT Brik2 IS
        GENERIC(
            DATA_WIDTH  : positive := 18;
            FFT_LENGTH  : positive := 4096;
            NDX         : positive := 32
        );
        PORT(
            clk            : IN  std_logic;
            reset          : IN  std_logic;
            ce             : IN  std_logic;
            InR,
            InI            : IN  std_logic_vector(17 downto 0);
            StartIn,
            ValidIn        : IN  std_logic;
            OutR,
            OutI,
            Tau0Est,
            Tau1Est,
            H0EstR,
            H0EstI,
            H1EstR,
            H1EstI          : OUT sfixed(1 downto -16);
            ValidOut,
            StartOut        : OUT std_logic
        );
    END COMPONENT Brik2;

    SIGNAL  brik2OutEn,
            brik2Start          :   std_logic;
    SIGNAL  brik2Real,
            brik2Imag,          
            tau0Est,
            tau1Est,
            h0EstReal,
            h0EstImag,
            h1EstReal,
            h1EstIMag           :   sfixed(1 downto -16);
   brik2 : Brik2 
        GENERIC MAP(
            DATA_WIDTH          => 18;
            FFT_LENGTH          => 4096;
            NDX                 => 32
        )
        PORT MAP (
            clk             => clk;
            reset           => reset;
            ce              => clkEn;
            InR             => brik1Real;
            InI             => brik1Imag;
            StartIn         => brik1Start;
            ValidIn         => brik1Valid;
            OutR            => brik2Real;
            OutI            => brik2Imag;
            Tau0Est         => tau0Est;
            Tau1Est         => tau1Est;
            H0EstR          => h0EstReal;
            H0EstI          => h0EstIMag;
            H1EstR          => h1EstReal;
            H1EstI          => h1EstIMag;
            ValidOut        => brik2OutEn;
            StartOut        => brik2Start
        );


    -------------------------- Interpolators ----------------------------------

    COMPONENT interpolator IS
        PORT(
            clk,
            clkEn,
            reset,
            interpolate     : IN    std_logic;
            mu              : IN    ufixed(-1 downto -18);
            inputEn         : IN    std_logic;
            din             : IN    sfixed(2 downto -15);
            outputEn        : OUT   std_logic;
            dout            : OUT   sfixed(2 downto -15);
        );
    END COMPONENT interpolator;
    SIGNAL  sampleEn        : std_logic;
    SIGNAL  sample0Real     : sfixed(2 downto -15);
    interp0Real : interpolator
        PORT MAP (
            clk             => clk;
            clkEn           => '1';
            reset           => reset;
            interpolate     => interpolateSamples;
            mu              : IN    ufixed(-1 downto -18);
            inputEn         => clkEn;
            din             => brik1Real;
            outputEn        => sampleEn;
            dout            => sample0Real;
        );
    SIGNAL  sample0Imag     : sfixed(2 downto -15);
    interp0Imag : interpolator
        PORT MAP (
            clk             => clk;
            clkEn           => '1';
            reset           => reset;
            interpolate     => interpolateSamples;
            mu              : IN    ufixed(-1 downto -18);
            inputEn         => clkEn;
            din             => brik1Imag;
            dout            => sample0Imag;
        );
    SIGNAL  sample1Real     : sfixed(2 downto -15);
    interp1Real : interpolator
        PORT MAP (
            clk             => clk;
            clkEn           => '1';
            reset           => reset;
            interpolate     => interpolateSamples;
            mu              : IN    ufixed(-1 downto -18);
            inputEn         => clkEn;
            din             => brik1Real;
            dout            => sample1Real;
        );
    SIGNAL  sample1Imag     : sfixed(2 downto -15);
    interp1Imag : interpolator
        PORT MAP (
            clk             => clk;
            clkEn           => '1';
            reset           => reset;
            interpolate     => interpolateSamples;
            mu              : IN    ufixed(-1 downto -18);
            inputEn         => clkEn;
            din             => brik1Imag;
            dout            => sample1Imag;
        );

    -------------------------- Trellis Detector -------------------------------

    COMPONENT trellisDetector IS
        PORT(
            clk,
            clkEn,
            reset,
            sampleEn,
            startFrame      : IN    std_logic;
            in0Real,
            in0Imag,
            in1Real,
            in1Imag         : IN    sfixed(1 downto -16);
            deltaTauEst     : IN    sfixed(0 downto -4);
            h0EstReal,
            h0EstImag,
            h1EstReal,
            h1EstImag       : IN    sfixed(1 downto -16);
            outputEn        : OUT   std_logic;
            outputBits      : OUT   std_logic_vector(3 to 0)
        );
    END COMPONENT trellisDetector;
    SIGNAL  dataBits        : std_logic_vector(3 to 0);
    trellis : trellisDetector
        PORT MAP(
            clk             => clk;
            clkEn           => '1';
            reset           => reset;
            sampleEn        => sampleEn;
            startFrame      => loadEstimates;
            in0Real         => sample0Real;
            in0Imag         => sample0Imag;
            in1Real         => sample1Real;
            in1Imag         => sample1Imag;
            deltaTauEst     => deltaTauEst;
            h0EstReal       => h0EstReal;
            h0EstImag       => h0EstImag;
            h1EstReal       => h1EstReal;
            h1EstImag       => h1EstImag;
            outputEn        => dataBitsEn;
            outputBits      => dataBits;
        );






END rtl;






-- CONSTANTS
   CONSTANT sqrt2over2           : real := sqrt(2.0)/2.0;

   impure function InitRamFromFile (RamFileName : in string) return SINV_Lut_Array is
      file     FilePntr	   : text;
      variable ramfileline : line;
      variable FuncRam	   : SINV_LUT_Array;
      variable RealValue   : real;
      variable Good_v      : boolean;
   begin
      file_open(FilePntr, RamFileName, read_mode);
      for i in 0 to 64 loop
         for j in 0 to 64 loop
            for k in 0 to 3 loop
               if (not endfile(FilePntr)) then
                  readline (FilePntr, ramfileline);
                  read(ramfileline, RealValue, Good_v);
                  FuncRam(i,j,k) := to_sfixed(RealValue, FLOAT_ZERO_1);
                  assert Good_v report "Failed to convert real of: " & ramfileline.all severity FAILURE;
               else
                  report "End of file reached" severity FAILURE;
               end if;
            end loop;
         end loop;
       end loop;
       return FuncRam;
   end function;

   impure function InitSigFromFile (RamFileName : in string) return SIG_Array is
      file     FilePntr	   : text;
      variable ramfileline : line;
      variable FuncRam	   : SIG_ARRAY;
      variable RealValue   : real;
      variable Good_v      : boolean;
   begin
      file_open(FilePntr, RamFileName, read_mode);
      for i in FuncRam'range loop
         if (not endfile(FilePntr)) then
            readline (FilePntr, ramfileline);
            read(ramfileline, RealValue, Good_v);
            FuncRam(i) := to_sfixed(RealValue, FLOAT_ZERO_1);
            assert Good_v report "Failed to convert real of: " & ramfileline.all severity FAILURE;
         else
            report "End of file reached" severity FAILURE;
         end if;
       end loop;
       return FuncRam;
   end function;

   -- Signals
   SIGNAL   AcqTrack          : AcqTrack_t;
   SIGNAL   FreqInR,
            FreqInI           : FLOAT_1;
   SIGNAL   FreqInRslv,
            FreqInIslv        : std_logic_vector(17 downto 0);
   SIGNAL   PilotCount        : integer range 0 to PILOT_LENGTH_4+1;
   SIGNAL   Freq              : FLOAT_4K;
   SIGNAL   PhaseAcc,
            PhaseInc          : sfixed(0 downto -31);
   SIGNAL   FreqEstDone,
            ChanEstDone,
            TimeEstDone,
            StartInt,
            ValidInt,
            ValidSinCos,
            ValidFifoIn,
            ValidDFin,
            ValidDFout        : std_logic;
   SIGNAL   SinCosData,
            DF_DataOut        : std_logic_vector(47 downto 0);
   SIGNAL   Cos_sf,
            Sin_sf,
            MixR,
            MixI,
            DF_R,
            DF_I              : sfixed(0 downto -17);
   SIGNAL   SInvLutR          : SINV_LUT_Array := InitRamFromFile("C:\Semco\STCinfo\RealTimeC\SpaceTimeCodeInC\SpaceTimeCodeInC/sinv_lut_r.txt");
   SIGNAL   SInvLutI          : SINV_LUT_Array := InitRamFromFile("C:\Semco\STCinfo\RealTimeC\SpaceTimeCodeInC\SpaceTimeCodeInC/sinv_lut_i.txt");
   SIGNAL   Sig0R             : SIG_ARRAY := InitSigFromFile("C:\Semco\STCinfo\RealTimeC\SpaceTimeCodeInC\SpaceTimeCodeInC/s0_lut_r.txt");
   SIGNAL   Sig0I             : SIG_ARRAY := InitSigFromFile("C:\Semco\STCinfo\RealTimeC\SpaceTimeCodeInC\SpaceTimeCodeInC/s0_lut_i.txt");
   SIGNAL   Sig1R             : SIG_ARRAY := InitSigFromFile("C:\Semco\STCinfo\RealTimeC\SpaceTimeCodeInC\SpaceTimeCodeInC/s1_lut_r.txt");
   SIGNAL   Sig1I             : SIG_ARRAY := InitSigFromFile("C:\Semco\STCinfo\RealTimeC\SpaceTimeCodeInC\SpaceTimeCodeInC/s1_lut_i.txt");
   SIGNAL   TauEst0Index,
            TauEst1Index      : integer range 0 to EST_TEMPLATE_LENGTH;


BEGIN

/*
   FreqSamp <= Register(0);
   FN                <= 2**18/R; -- bit of input resolution
   PhaseInc_r           : sfixed(0 downto -31);
   FreqResolution_r  <= FreqSamp / (R*FN);
   FreqAmbiguity_r   <= FreqSamp/13312;
   Delta_f_Ind_r     <= FreqAmbiguity_r/(FreqSamp/(R*FN));
   PhaseJump0        <=
   PhaseJump123      <=

*/
   FifoProcess : process(clk)
   begin
      if (rising_edge(clk)) then
         if (reset) then
            PilotCount <= 512;
         elsif (ce) then
            if (ValidIn) then
               if (StartIn) then
                  PilotCount <= 0;
               elsif (PilotCount <= PILOT_LENGTH_4) then
                  PilotCount <= PilotCount + 1;
               end if;
            end if;
         end if;
      end if;
   end process FifoProcess;

   ValidFifoIn <= '1' when (ValidIn = '1') and (PilotCount < PILOT_LENGTH_4) else '0';

   InputFifo : BurstDumpFifo
      GENERIC MAP(
         DATA_WIDTH  => 18,
         WORDS       => PILOT_LENGTH_4
      )
      PORT MAP(
         clk         => clk,
         reset       => StartIn or reset, -- only hold first 512 samples. Should be done before next frame
         ce          => ce,
         ReIn        => InR,
         ImIn        => InI,
         Push        => ValidFifoIn,
         ReOut       => FreqInRslv,
         ImOut       => FreqInIslv,
         Start       => StartInt,
         ValidOut    => ValidInt,
         LastOut     => open
      );

   tau0Est   <= to_sfixed(0.0, tau0Est);
   tau1Est   <= to_sfixed(0.0, tau1Est);
   h0EstR    <= to_sfixed(sqrt2over2, h0EstR);
   h0EstI    <= to_sfixed(0.0, h0EstI);
   h1EstR    <= to_sfixed(sqrt2over2, h1EstR);
   h1EstI    <= to_sfixed(0.0, h1EstI);
   FreqInR   <= resize(to_sfixed(FreqInRslv, 1, -16) sra 1, FreqInR);   -- input is ±2. Shift to ±1
   FreqInI   <= resize(to_sfixed(FreqInIslv, 1, -16) sra 1, FreqInI);

   Freq_u : FrequencyEstimator
      GENERIC map(
         DATA_WIDTH  => 25,
         FFT_LENGTH  => 4096,
         NDX         => 32
      )
   PORT map(
      clk            => clk,
      reset          => reset,
      ce             => ce,
      Rr             => FreqInR,
      Ri             => FreqInI,
      Tau0Est        => Tau0Est,
      Tau1Est        => Tau1Est,
      H0EstR         => H0EstR,
      H0EstI         => H0EstI,
      H1EstR         => H1EstR,
      H1EstI         => H1EstI,
      StartIn        => StartInt,
      ValidIn        => ValidInt,
      Freq           => Freq,
      AcqTrack       => AcqTrack,
      Done           => FreqEstDone
   );

   CE_u : ChannelEstimate
   PORT MAP(
      clk            => clk,
      ce             => ce,
      reset          => reset,
      StartIn        => StartIn,
      Xr             => FreqInR,
      Xi             => FreqInI,
      Sig0R          => Sig0R,
      Sig0I          => Sig0I,
      Sig1R          => Sig1R,
      Sig1I          => Sig1I,
      SInvLutR       => SInvLutR,
      SInvLutI       => SInvLutI,
      TauEst0Index   => TauEst0Index,
      TauEst1Index   => TauEst1Index,
      H0EstR         => H0EstR,
      H0EstI         => H0EstI,
      H1EstR         => H1EstR,
      H1EstI         => H1EstI,
      Done           => ChanEstDone
   );

      TE_u : TimingEstimate
      PORT MAP(
         clk         => clk,
         ce          => ce,
         reset       => reset,
         StartIn     => StartIn,
         Xr          => FreqInR,
         Xi          => FreqInI,
         Sig0R       => Sig0R,
         Sig0I       => Sig0I,
         Sig1R       => Sig1R,
         Sig1I       => Sig1I,
         SInvLutR    => SInvLutR,
         SInvLutI    => SInvLutI,
         Tau0Est     => Tau0Est,
         Tau1Est     => Tau1Est,
         Tau0Ndx     => TauEst0Index,
         Tau1Ndx     => TauEst1Index,
         Done        => TimeEstDone
      );

   SinCos_u : SinCosLut
     PORT MAP(
       aclk                   => clk,
       aclken                 => ce,
       aresetn                => not reset,
       s_axis_phase_tvalid    => ValidIn,
       s_axis_phase_tdata     => to_slv(PhaseAcc(0 downto -15)),
       m_axis_data_tvalid     => ValidSinCos,
       m_axis_data_tdata      => SinCosData
     );

      Cos_sf <= to_sfixed(SinCosData(17 downto 0) , Cos_sf);
      Sin_sf <= to_sfixed(SinCosData(41 downto 24), Sin_sf);

   MixProcess : process(clk)
   begin
      if (rising_edge(clk)) then
         if (reset) then
            MixR        <= (others=>'0');
            MixI        <= (others=>'0');
            PhaseAcc    <= (others=>'0');
            PhaseInc    <= (others=>'0');
         elsif (ce) then
            MixR  <= resize(Cos_sf*FreqInR - Sin_sf*FreqInI, MixR);
            MixI  <= resize(Cos_sf*FreqInI + Sin_sf*FreqInR, MixI);
            PhaseInc <= resize(MATH_2_PI * Freq * 1.0 / FreqSamp, PhaseInc);
            if (ValidIn) then
               PhaseAcc <= resize(PhaseAcc - PhaseInc, PhaseAcc);
            end if;
         end if;
      end if;
   end process MixProcess;

   DetectFilt : DetectionFilter
      PORT MAP (
         aclk                 => clk,
         aclken               => ce,
         aresetn              => not reset,
         s_axis_data_tvalid   => ValidIn,
         s_axis_data_tdata    => 6x"00" & to_slv(MixI) & 6x"00"& to_slv(MixR),
         s_axis_data_tready   => open,
         m_axis_data_tvalid   => ValidDFout,
         m_axis_data_tdata    => DF_DataOut
      );

DF_R <= to_sfixed(DF_DataOut(17 downto 0), DF_R);
DF_I <= to_sfixed(DF_DataOut(24+17 downto 24), DF_I);
--   OutFifo : FIFO18x2

   OutProcess : process(clk)
   begin
      if (rising_edge(clk)) then
         if (reset) then
            OutR        <= (others=>'0');
            OutI        <= (others=>'0');
            ValidOut    <= '0';
            StartOut    <= '0';
         elsif (ce) then
            if (PilotCount = PILOT_LENGTH_4) then
               StartOut <= '1';
            else
               StartOut <= '0';
            end if;
            if (PilotCount >= PILOT_LENGTH_4) then
               ValidOut <= ValidSinCos;
            else
               ValidOut <= '0';
            end if;
         end if;
      end if;
   end process OutProcess;

END rtl;

