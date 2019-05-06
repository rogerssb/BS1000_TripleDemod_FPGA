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
   The data from Brik1s pilot sync block is the source of data for Brik2. The
data is already packed into 512 sample bursts framed by the valid signal high
for the entire 512 clocks. Brik1 sets the Start input high for one clock some
time before the burst containing the pilot string. FreqCount is cleared to start counting
the 512 samples the Frequency Estimate uses for processing. I use to grab another
50 samples to preload the DF filter for Time and Channel Estimates but they're
only active on the last half of the 512 burst, so not necessary anymore.
   Since FreqEst consumes most of a frame, waiting for Tau and H would limit the
highest bit rates so the previous frames estimates are used.
   The FreqEst output is used to drive a NCO and complex mixer that provides the
derotated data to the Tau and H estimater as well as the Interpolate/Trellis. The
Freq value is used to calculate a phase increment which is than accumulated as
and NCO and feeds the Sin/Cos look up table. The Sin and Cos are then fed to the
mixer. The output of the mixer first feed the Detection Filter which is a dual
channel lowpass FIR filter to minimize out of band noise.
   The StartCount also triggers a timer to start the TimeEst function which
searches various values of Tau0/1 for a minimum error. These Taus are then
fed to the ChannelEst function which calculates the H0/H1 parameters. Channel
Estimates only require a single pass through its algorithm, so its quick. Each of
these functions have a Start and Done signal that are chained together to
trigger the next function. The Time and Chan functions iterate over the Pilot
data stored in RAMs with their address outputs muxed in during their active
periods.
   Interpolate and Trellis require the Tau and H parameters to be latched
followed by a start pulse and 128 clocks for Trellis preprocessing. The I/Q
signals are then sent starting with the last 16 samples of the pilot. An
Interpolate pulse is generated every 4 clocks corresponding to one baud time
since the data is 4 samples per bit at this point.
----------------------------------------------------------------------------
                               HISTORY
----------------------------------------------------------------------------
9-6-16 Initial release FZ
-------------------------------------------------------------
*/

LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
library std;
use std.textio.all;
use work.fixed_pkg.all;
USE IEEE.math_real.all;
USE work.Semco_pkg.ALL;

ENTITY Brik2 IS
   PORT(
      clk,
      reset,
      ce             : IN  std_logic;
      Variables      : IN  RecordType;
      StartIn,
      ValidIn        : IN  std_logic;
      InR,
      InI            : IN  std_logic_vector(17 downto 0);
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
END Brik2;


ARCHITECTURE rtl OF Brik2 IS

   COMPONENT BurstDumpFifo IS
         GENERIC(
            DATA_WIDTH  : positive := 18;
            WORDS       : positive := 512
         );
      PORT(
         clk            : IN  std_logic;
         reset          : IN  std_logic;
         ce             : IN  std_logic;
         ReIn,
         ImIn           : IN  std_logic_vector(DATA_WIDTH-1 downto 0);
         Push           : IN  std_logic;
         ReOut,
         ImOut          : OUT std_logic_vector(DATA_WIDTH-1 downto 0);
         Start,
         ValidOut,
         LastOut        : OUT std_logic
      );
   END COMPONENT BurstDumpFifo;

   COMPONENT FrequencyEstimator IS
      GENERIC(
         FFT_LENGTH  : positive := 4096;
         NDX         : positive := 32
      );
   PORT(
      clk,
      reset,
      ce             : IN  std_logic;
      Variables      : IN  RecordType;
      StartIn,
      ValidIn        : IN  std_logic;
      Rr,
      Ri             : IN FLOAT_1_LP;
      Tau0Est,
      Tau1Est,
      H0EstR,
      H0EstI,
      H1EstR,
      H1EstI         : IN  STC_Parm;
      Freq           : OUT FLOAT_128K;
      AcqTrack       : OUT AcqTrack_t;
      Done           : OUT std_logic
      );
   END COMPONENT FrequencyEstimator;

   COMPONENT FrequencyEstimatorDFT IS
         GENERIC(
            NDX         : positive := 32
         );
      PORT(
         clk,
         reset,
         ce             : IN  std_logic;
         Variables      : IN  RecordType;
         StartIn,
         ValidIn        : IN  std_logic;
         Rr,
         Ri             : IN  FLOAT_1_LP;
         Tau0Est,
         Tau1Est,
         H0EstR,
         H0EstI,
         H1EstR,
         H1EstI         : IN  STC_Parm;
         Freq           : OUT FLOAT_128K;
         AcqTrack       : OUT AcqTrack_t;
         Done           : OUT std_logic
      );
   END COMPONENT FrequencyEstimatorDFT;

   COMPONENT TimingEstimate IS
      PORT(
         clk,
         ce,
         reset,
         StartIn        : IN  std_logic;
         Xr,
         Xi             : IN  FLOAT_1_LP;
         Tau0Est,
         Tau1Est        : OUT STC_Parm;
         Tau0Ndx,
         Tau1Ndx        : OUT natural range 0 to SEARCH_LENGTH;
         RdAddr         : OUT natural range 0 to TIME_DEPTH-1;
         Done           : OUT std_logic
      );
   END COMPONENT TimingEstimate;

   COMPONENT ChannelEstimate is
      port (
         clk,
         ce,
         reset,
         StartIn        : IN  std_logic;
         TauEst0Index,
         TauEst1Index   : IN  integer range 0 to SEARCH_LENGTH;
         Xr,
         Xi             : IN  FLOAT_1_18;
         H0EstR,
         H0EstI,
         H1EstR,
         H1EstI         : OUT STC_Parm;
         RdAddr         : OUT natural range 0 to TIME_DEPTH-1;
         Done           : OUT Std_logic
      );
   end COMPONENT ChannelEstimate;

   COMPONENT DetectionFilter
      PORT (
         aclk                 : IN STD_LOGIC;
         aclken               : IN STD_LOGIC;
         aresetn              : IN STD_LOGIC;
         s_axis_data_tvalid   : IN STD_LOGIC;
         s_axis_data_tdata    : IN STD_LOGIC_VECTOR(47 DOWNTO 0);
         s_axis_data_tready   : OUT STD_LOGIC;
         m_axis_data_tvalid   : OUT STD_LOGIC;
         m_axis_data_tdata    : OUT STD_LOGIC_VECTOR(47 DOWNTO 0)
      );
   END COMPONENT;

   COMPONENT Interpolator IS
      PORT(
         clk,
         reset,
         ce,
         Interpolate,
         ValidIn        : IN  std_logic;
         DataIn         : IN  STC_PARM;
         SignedMu       : IN  FLOAT_1_18;
         DataOut        : OUT STC_PARM;
         ValidOut       : OUT std_logic
      );
   END COMPONENT Interpolator;

   COMPONENT SinCosLut
     PORT (
       aclk,
       aclken,
       aresetn,
       s_axis_phase_tvalid : IN STD_LOGIC;
       s_axis_phase_tdata  : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
       m_axis_data_tvalid  : OUT STD_LOGIC;
       m_axis_data_tdata   : OUT STD_LOGIC_VECTOR(47 DOWNTO 0)
     );
   END COMPONENT SinCosLut;

   COMPONENT RAM_2Reads_1Write IS
      GENERIC(
         FILENAME    : string    := "";
         DATA_WIDTH  : positive  := 32;
         BINPT       : integer   := -20;
         ADDR_WIDTH  : positive  := 9;
         FILE_IS_SLV : boolean   := false;
         LATENCY     : positive  := 1;
         RAM_TYPE    : string    := "block"
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

   function RoundTo0(sfix_in : sfixed(3 downto -17)) return integer is
      variable int_v    : sfixed(3 downto 0);
      variable result   : integer;
   begin
      int_v    := sfix_in(3 downto 0);
      if (sfix_in >= 0) then
         result   := to_integer(int_v);
      elsif (sfix_in = int_v) then
         result   := to_integer(int_v);
      else
         result   := to_integer(int_v) + 1;
      end if;
      return result;
   end function RoundTo0;

-- CONSTANTS
   CONSTANT StartDF_Delay     : positive := 3;  -- data is delayed 10 clocks but takes 13 to build
   CONSTANT TSAMPLE4          : sfixed(-25 downto -42) := to_sfixed(TSAMPLE_4, -25, -42);
   CONSTANT PAYLOAD_SIZE      : positive := 3200 * 4;
   CONSTANT PRE_LOAD          : positive := 4 * 4;       -- extra samples in front of trellis data to prime
   CONSTANT FLUSH             : positive := 4 * 4;       -- extra samples at end of trellis data to flush
   CONSTANT MIN_M_NDX         : positive := 5;
   SIGNAL   MIN_M_INDX        : natural := 5; --TODO
   CONSTANT MAX_M_NDX         : positive := 3;
   CONSTANT PILOT_OFFSET      : positive := 3;
   CONSTANT TRELLIS_WAIT      : positive := 24;
   -- Signals
   SIGNAL   AcqTrack          : AcqTrack_t;
   SIGNAL   FreqR,
            FreqI             : FLOAT_1_LP;
   SIGNAL   TimeR,
            TimeI             : FLOAT_1_LP;
   SIGNAL   FreqRslv,
            FreqIslv,
            TimeRslv,
            TimeIslv,
            H0EstRslv,
            H0EstIslv,
            H1EstRslv,
            H1EstIslv,
            InterpRamR0,
            InterpRamI0,
            InterpRamR1,
            InterpRamI1       : std_logic_vector(17 downto 0);
   SIGNAL   TimeCount,
            FreqCount         : integer range 0 to PILOT_SIZE + PILOT_OFFSET;
   SIGNAL   SinCosWait        : integer range 0 to 6;
   SIGNAL   WrAddr,
            TimeRead,
            TimeRdAddr,
            ChanRdAddr        : integer range 0 to TIME_DEPTH - 1;
   SIGNAL   FreqDFT,
            Freq              : FLOAT_128K;
   SIGNAL   PhaseAcc,
            PhaseInc          : sfixed(0 downto -31);
   SIGNAL   FreqEstDone,
            ChanEstDone,
            TimeEstDone,
            TimeActive,
            StartFreq,
            StartTime,
            StartMix,
            StartDF,
            FirstPassDF,
            FirstPassMix,
            FirstPass,
            ValidFreq,
            ValidMixer,
            ValidSinCos,
            FreqFifoIn,
            FreqReset,
            ValidDF,
            ValidDFreg,
            Interpolate,
            InterpEn,
            TrellisStarter,
            StartSelect,
            TrellisPreStart,
            WriteInterp,
            ReadInterp        : std_logic;
   SIGNAL   SinCosData,
            DF_DataOut        : std_logic_vector(47 downto 0);
   SIGNAL   StartDF_Out       : std_logic_vector(StartDF_Delay-1 downto 0);
   SIGNAL   CosInR,
            CosInI,
            SinInR,
            SinInI,
            Cos_sf,
            Sin_sf            : FLOAT_1_18;
   SIGNAL   InR_sf,
            InI_sf,
            MixR,
            MixI,
            DF_R,
            DF_I,
            TimeRamR,
            TimeRamI,
            H0Mag,
            H1Mag,
            Tau0EstTE,
            Tau1EstTE,
            H0EstR_CE,
            H0EstI_CE,
            H1EstR_CE,
            H1EstI_CE,
            Tau0Est,
            Tau1Est,
            H0EstR_sf,
            H0EstI_sf,
            H1EstR_sf,
            H1EstI_sf         : STC_Parm;
   SIGNAL   ValidDly          : std_logic_vector(1 downto 0);
   SIGNAL   Tau0EstNdxTE,
            Tau1EstNdxTE      : integer range 0 to SEARCH_LENGTH;
   SIGNAL   RdInterpAddr      : integer range 0 to PAYLOAD_SIZE + PRE_LOAD + FLUSH;
   SIGNAL   WrInterpAddr,
            RdInterpRam0,
            RdInterpRam1      : integer range 0 to PAYLOAD_SIZE + PRE_LOAD + FLUSH + MIN_M_NDX + MAX_M_NDX;
   SIGNAL   ValidCount        : integer range 0 to PILOT_LENGTH_4 - PRE_LOAD + 2;
   SIGNAL   InterpWait        : integer range 0 to 1284;
   SIGNAL   InterpCount       : integer range 0 to 16;
   SIGNAL   WaitTime          : integer range 0 to TRELLIS_WAIT;
   SIGNAL   Mu0, Mu1          : FLOAT_1_18;
   SIGNAL   Tau0Int,
            Tau1Int,
            m_ndx0,
            m_ndx1            : integer range -MIN_M_NDX to MAX_M_NDX := 0;
   SIGNAL   TrellisDelay      : SLV4;
   SIGNAL   Tau0EstX4,
            Tau1EstX4,
            Tau0EstA,
            Tau1EstA          : sfixed(3 downto -17);

   signal   Freq_Ila          : sfixed(24 downto 0);
   signal   H0Mag_Ila,
            H1Mag_Ila,
            Tau0Est_Ila,
            Tau1Est_Ila,
            H0EstR_Ila,
            H0EstI_Ila,
            H1EstR_Ila,
            H1EstI_Ila,
            InterpO_R0_Ila,
            InterpO_I0_Ila,
            InterpO_R1_Ila,
            InterpO_I1_Ila,
            DF_R_Ila,
            DF_I_Ila,
            Mu0_Ila,
            Mu1_Ila           : sfixed(17 downto 0);  -- remove fractions for ILA, doesn't like negatives
   SIGNAL   ValidDF_ILA       : std_logic;

   attribute mark_debug : string;
   attribute mark_debug of H0Mag_Ila   : signal is "true";
   attribute mark_debug of H1Mag_Ila   : signal is "true";
   attribute mark_debug of Tau0Est_Ila : signal is "true";
   attribute mark_debug of Tau1Est_Ila : signal is "true";
   attribute mark_debug of H0EstR_Ila  : signal is "true";
   attribute mark_debug of H0EstI_Ila  : signal is "true";
   attribute mark_debug of H1EstR_Ila  : signal is "true";
   attribute mark_debug of H1EstI_Ila  : signal is "true";
   attribute mark_debug of Freq_Ila    : signal is "true";
   attribute mark_debug of DF_R_Ila    : signal is "true";
   attribute mark_debug of DF_I_Ila    : signal is "true";
   attribute mark_debug of ValidDF_ILA : signal is "true";
   attribute mark_debug of InterpRamR0 : signal is "true";
   attribute mark_debug of InterpRamI0 : signal is "true";
   attribute mark_debug of InterpRamR1 : signal is "true";
   attribute mark_debug of InterpRamI1 : signal is "true";
   attribute mark_debug of InterpO_R0_Ila  : signal is "true";
   attribute mark_debug of InterpO_I0_Ila  : signal is "true";
   attribute mark_debug of InterpO_R1_Ila  : signal is "true";
   attribute mark_debug of InterpO_I1_Ila  : signal is "true";
   attribute mark_debug of Interpolate : signal is "true";
   attribute mark_debug of Mu0_Ila     : signal is "true";
   attribute mark_debug of Mu1_Ila     : signal is "true";

BEGIN

   IlaProcess : process(clk)
   begin
      if (rising_edge(clk)) then
         H0Mag_Ila      <= H0Mag;
         H1Mag_Ila      <= H1Mag;
         Tau0Est_Ila    <= Tau0Est;
         Tau1Est_Ila    <= Tau1Est;
         H0EstR_Ila     <= H0EstR;
         H0EstI_Ila     <= H0EstI;
         H1EstR_Ila     <= H1EstR;
         H1EstI_Ila     <= H1EstI;
         InterpO_R0_Ila <= InterpO_R0;
         InterpO_I0_Ila <= InterpO_I0;
         InterpO_R1_Ila <= InterpO_R1;
         InterpO_I1_Ila <= InterpO_I1;
         Freq_Ila       <= Freq;
         DF_R_Ila       <= DF_R;
         DF_I_Ila       <= DF_I;
         Mu0_Ila        <= Mu0;
         Mu1_Ila        <= Mu1;
         ValidDF_ILA    <= ValidDFreg;
      end if;
   end process IlaProcess;

   -- At FreqCount x100-101 the R and I sync pulses are mirrored to each other
   FreqFifoProcess : process(clk)
   begin
      if (rising_edge(clk)) then
         if (reset) then
            FreqCount <= PILOT_SIZE;
         elsif (ce) then
            if (StartIn) then
               FreqCount <= 0;
            elsif (ValidIn = '1') and (FreqCount < PILOT_SIZE) then
               FreqCount <= FreqCount + 1; -- FreqCount starts with first valid sample after start
            end if;
         end if;
      end if;
   end process FreqFifoProcess;

   FreqFifoIn <= '1' when (ValidIn = '1') and (FreqCount < PILOT_SIZE) else '0';
   FreqReset  <= StartIn or reset;

   FreqFifo : BurstDumpFifo
      GENERIC MAP(
         DATA_WIDTH  => 18,
         WORDS       => PILOT_SIZE
      )
      PORT MAP(
         clk         => clk,
         reset       => FreqReset, -- only hold first PILOT_LENGTH_4 samples. Should be done before next frame
         ce          => ce,
         ReIn        => InR,
         ImIn        => InI,
         Push        => FreqFifoIn,
         ReOut       => FreqRslv,
         ImOut       => FreqIslv,
         Start       => StartFreq,
         ValidOut    => ValidFreq,
         LastOut     => open
      );

   FreqR   <= resize(to_sfixed(FreqRslv, PARM_ZERO), FreqR);   -- input is ±1
   FreqI   <= resize(to_sfixed(FreqIslv, PARM_ZERO), FreqI);

   Freq <= (others=>'0'); -- TODO remove line

   FreqDFT_u : FrequencyEstimatorDFT
      GENERIC map(
         NDX         => 32
      )
      PORT map(
         clk            => clk,
         reset          => reset,
         ce             => ce,
         Variables      => Variables,
         Rr             => FreqR,
         Ri             => FreqI,
         StartIn        => StartFreq,
         ValidIn        => ValidFreq,
         Tau0Est        => Tau0Est,
         Tau1Est        => Tau1Est,
         H0EstR         => H0EstR_sf,
         H0EstI         => H0EstI_sf,
         H1EstR         => H1EstR_sf,
         H1EstI         => H1EstI_sf,
         Freq           => open, -- TODO Freq,
         AcqTrack       => AcqTrack,
         Done           => FreqEstDone
      );

   -- Time and Channel processing
   SinCos_u : SinCosLut
     PORT MAP(
       aclk                   => clk,
       aclken                 => ce,
       aresetn                => not reset,
       s_axis_phase_tvalid    => ValidDly(0),
       s_axis_phase_tdata     => to_slv(PhaseAcc(0 downto -15)),
       m_axis_data_tvalid     => ValidSinCos,
       m_axis_data_tdata      => SinCosData
     );

   MixProcess : process(clk)
   begin
      if (rising_edge(clk)) then
         if (reset) then
            MixR        <= (others=>'0');
            MixI        <= (others=>'0');
            PhaseAcc    <= (others=>'0');
            PhaseInc    <= (others=>'0');
            CosInR      <= (others=>'0');
            CosInI      <= (others=>'0');
            SinInR      <= (others=>'0');
            SinInI      <= (others=>'0');
            Cos_sf      <= (others=>'0');
            Sin_sf      <= (others=>'0');
            InR_sf      <= (others=>'0');
            InI_sf      <= (others=>'0');
            ValidMixer  <= '0';
            StartMix <= '0';
            SinCosWait  <= 0;
         elsif (ce) then
            Cos_sf <= to_sfixed(SinCosData(17 downto 0) , Cos_sf);
            Sin_sf <= to_sfixed(SinCosData(41 downto 24), Sin_sf);
            InR_sf <= to_sfixed(InR, InR_sf);
            InI_sf <= to_sfixed(InI, InI_sf);
            ValidDly <= ValidDly(0) & ValidIn;
            if (SinCosWait < 6) then   -- let SinCosLut charge fully. Gets an X on reset
               SinCosWait <= SinCosWait + 1;
            else
               ValidMixer <= ValidDly(1); -- ValidDly starts 2 clocks before first mixer output
               if (StartIn) then
                  StartMix <= '1';  -- Start is between burst of valids, but data is delayed to constrain to one packet
                  PhaseInc <= resize(-2.0 * Freq * TSAMPLE4, PhaseInc); --Not enough time to process within last frame
               elsif (ValidDly(0)) then-- Phase input is ±1 not ±PI
                  StartMix <= '0';
                  CosInR <= resize(Cos_sf * InR_sf, CosInR);
                  CosInI <= resize(Cos_sf * InI_sf, CosInI);
                  SinInR <= resize(Sin_sf * InR_sf, SinInR);
                  SinInI <= resize(Sin_sf * InI_sf, SinInI);
                  MixR  <= resize(CosInR - SinInI, MixR, fixed_saturate, fixed_truncate);
                  MixI  <= resize(CosInI + SinInR, MixI, fixed_saturate, fixed_truncate);
                  PhaseAcc <= resize(PhaseAcc + PhaseInc, PhaseAcc);
               end if;
            end if;
         end if;
      end if;
   end process MixProcess;

   DetectFilt : DetectionFilter
      PORT MAP (
         aclk                 => clk,
         aclken               => ce,
         aresetn              => not reset,
         s_axis_data_tvalid   => ValidMixer,
         s_axis_data_tdata    => 6x"00" & to_slv(MixI) & 6x"00"& to_slv(MixR),
         s_axis_data_tready   => open,
         m_axis_data_tvalid   => ValidDF,
         m_axis_data_tdata    => DF_DataOut
      );


   DF_Process : process(clk)
   begin
      if (rising_edge(clk)) then
         if (reset) then
            StartDF_Out <= (others=>'0');
            DF_R        <= (others=>'0');
            DF_I        <= (others=>'0');
            ValidDFreg <= '0';
         elsif (ce) then
            DF_R <= to_sfixed(DF_DataOut(17 downto 0), DF_R);
            DF_I <= to_sfixed(DF_DataOut(24+17 downto 24), DF_I);
            ValidDFreg <= ValidDF;
            if (StartMix) then
               StartDF_Out <= (0 => '1', others=>'0');
            elsif (ValidDFreg) then
               StartDF_Out <= StartDF_Out(StartDF_Delay-2 downto 0) & '0';
            end if;
         end if;
      end if;
   end process DF_Process;

   StartDF <= StartDF_Out(StartDF_Delay-1);

   TimeProcess : process(clk)  -- Time and channel want last half of pilot
   begin
      if (rising_edge(clk)) then
         if (reset) then
            TimeCount <= PILOT_SIZE + PILOT_OFFSET;
            TimeActive <= '0';
            StartTime  <= '0';
            WrAddr      <= 0;
         elsif (ce) then
            if (StartDF and ValidDFreg and not TimeActive) then   -- could occur when ValidDF is skipping samples
               TimeCount   <= 0;    -- TimeCount starts after DF is primed
               WrAddr      <= 0;
               TimeActive  <= '1';
             elsif (TimeEstDone) then  -- just needs cleared before next packet
               TimeActive <= '0';
            end if;
            if (ValidDFreg) then
               if (TimeCount < PILOT_SIZE + PILOT_OFFSET) then
                  TimeCount <= TimeCount + 1;
               end if;
               if (TimeCount >= PILOT_SIZE/2 + PILOT_OFFSET - 2) and (WrAddr < TIME_DEPTH - 1) then
                  WrAddr <= WrAddr + 1;
               end if;
            end if;                             -- TODO, PILOT_OFFSET - 3 = 0, yields (TimeCount = PILOT_SIZE)?
            StartTime <= '1' when (TimeCount = PILOT_SIZE + PILOT_OFFSET - 3) else '0';  -- wait till input buffer is full
         end if;
      end if;
   end process TimeProcess;
                                 -- start early for negative Ndx offsets
   FirstPassDF <= ValidDFreg when (TimeCount >= TIME_DEPTH + PILOT_OFFSET - 2) and (TimeCount < PILOT_SIZE + PILOT_OFFSET - 2) else '0';
   TimeRead    <= TimeRdAddr when TimeActive else ChanRdAddr;
   TimeR       <= resize(to_sfixed(TimeRslv, PARM_ZERO), TimeR);
   TimeI       <= resize(to_sfixed(TimeIslv, PARM_ZERO), TimeR);
TODO, need to select DF or Mix start signals
   TimeRamR <= MixR when (Variable.MiscBits(TIME_SEL)) else DF_R;
   TimeRamI <= MixI when (Variable.MiscBits(TIME_SEL)) else DF_I;
   FirstPass <= FirstPassMix when (Variable.MiscBits(TIME_SEL)) else FirstPassDF;

   RepeatR_u : RAM_2Reads_1Write
      GENERIC MAP(
         FILENAME    => "",
         DATA_WIDTH  => DF_R'length,
         BINPT       => DF_R'right,
         ADDR_WIDTH  => 8,
         FILE_IS_SLV => false,
         LATENCY     => 1,
         RAM_TYPE    => "block"
      )
      PORT MAP(
         clk         => clk,
         ce          => ce,
         reset       => reset,
         WrEn        => FirstPass,
         WrAddr      => WrAddr,
         RdAddrA     => TimeRead,
         RdAddrB     => 0,
         WrData      => to_slv(TimeRamR),
         RdOutA      => TimeRslv,
         RdOutB      => open
      );

   RepeatI_u : RAM_2Reads_1Write
      GENERIC MAP(
         FILENAME    => "",
         DATA_WIDTH  => DF_I'length,
         BINPT       => DF_I'right,
         ADDR_WIDTH  => 8,
         LATENCY     => 1,
         FILE_IS_SLV => false,
         RAM_TYPE    => "block"
      )
      PORT MAP(
         clk         => clk,
         ce          => ce,
         reset       => reset,
         WrEn        => FirstPass,
         WrAddr      => WrAddr,
         RdAddrA     => TimeRead,
         RdAddrB     => 0,
         WrData      => to_slv(TimeRamI),
         RdOutA      => TimeIslv,
         RdOutB      => open
      );
/* TODO
   TE_u : TimingEstimate
      PORT MAP(
         clk         => clk,
         ce          => ce,
         reset       => reset,
         StartIn     => StartTime,
         Xr          => TimeR,
         Xi          => TimeI,
         Tau0Est     => Tau0EstTE,
         Tau1Est     => Tau1EstTE,
         Tau0Ndx     => Tau0EstNdxTE,
         Tau1Ndx     => Tau1EstNdxTE,
         RdAddr      => TimeRdAddr,
         Done        => TimeEstDone
   );

   -- TimeEst determines Tau Indexes first
   CE_u : ChannelEstimate
      PORT MAP(
         clk            => clk,
         ce             => ce,
         reset          => reset,
         StartIn        => TimeEstDone,
         Xr             => resize(TimeR, FLOAT_ZERO_1_18),
         Xi             => resize(TimeI, FLOAT_ZERO_1_18),
         TauEst0Index   => Tau0EstNdxTE,
         TauEst1Index   => Tau1EstNdxTE,
         H0EstR         => H0EstR_CE,
         H0EstI         => H0EstI_CE,
         H1EstR         => H1EstR_CE,
         H1EstI         => H1EstI_CE,
         RdAddr         => ChanRdAddr,
         Done           => ChanEstDone
   );
TODO */
   TrellisPreStart <= TrellisDelay(2);

   EstimatesProcess : process(clk) -- Latch all the estimates when trellis starts
   begin
      if (rising_edge(clk)) then
         if (reset) then
            H0EstR_sf      <= to_sfixed(0.707, H0EstR_sf);
            H0EstI_sf      <= (others=>'0');
            H1EstR_sf      <= to_sfixed(0.707, H1EstR_sf);
            H1EstI_sf      <= (others=>'0');
         elsif (ce and TrellisPreStart) then
            H0EstR_sf      <= H0EstR_CE;
            H0EstI_sf      <= H0EstI_CE;
            H1EstR_sf      <= H1EstR_CE;
            H1EstI_sf      <= H1EstI_CE;
         end if;
      end if;
   end process EstimatesProcess;

   -- Skip over all but the last 20 pilot samples then start filling the Interpolate/Trellis buffers
   -- The buffer continues to fill while the estimates are compiled. The system only uses the first 16
   -- but to allow for n_ndx offsets, I need -5 to +3 extra samples.


   FeedInterp : process(clk)
   begin
      if (rising_edge(clk)) then
         if (reset) then
            WriteInterp    <= '0';
            ValidCount     <= 0;
            WrInterpAddr   <= 0;
         elsif (ce) then
            if (StartDF = '1') then -- DF is valid for new frame
               ValidCount <= 1;
            elsif (ValidCount > 0) then
               if (ValidDFreg) then
                  ValidCount <= ValidCount + 1; -- count past the pilot minus preload
               end if;
            end if;
            if (ValidCount = PILOT_LENGTH_4 - PRE_LOAD - MIN_M_NDX + 5) then -- start MIN_M_NDX samples before normal for m_ndx offset
               ValidCount <= 0;
               WriteInterp <= '1';
               WrInterpAddr <= 0;
            elsif (WrInterpAddr = PAYLOAD_SIZE + PRE_LOAD + FLUSH + MIN_M_NDX) then  -- grab spares for index offsets
               WriteInterp <= '0';
            elsif (WriteInterp and ValidDFreg) then
               WrInterpAddr <= WrInterpAddr + 1;
            end if;
         end if;
      end if;
   end process FeedInterp;

   -- When FreqEst is done, the
   -- interpolators get data with InterpEn set when available and Interpolate on the fourth sample.
   -- The system then waits for TrellisEn to go high signifying the interpolation is complete.
   StartSelect <= '0';  -- bit rate is below threshold -- TODO ChanEstDone;
   TrellisStarter <= ChanEstDone when StartSelect = '1' else FreqEstDone;

   InterpRead : process(clk)
   begin
      if (rising_edge(clk)) then
         if (reset) then
            TrellisStart   <= '0';
            ReadInterp     <= '0';
            InterpEn       <= '0';
            Interpolate    <= '0';
            TrellisDelay   <= x"0";
            InterpWait     <= 0;
            InterpCount    <= 0;
            RdInterpAddr   <= 0;
            m_ndx0         <= 0;
            m_ndx1         <= 0;
            Tau0Int        <= 0;
            Tau1Int        <= 0;
            WaitTime       <= TRELLIS_WAIT;
            H0EstR         <= (others=>'0');
            H0EstI         <= (others=>'0');
            H1EstR         <= (others=>'0');
            H1EstI         <= (others=>'0');
            Tau0Est        <= (others=>'0');
            Tau0EstA       <= (others=>'0');
            Tau0EstX4      <= (others=>'0');
            Mu0            <= (others=>'0');
            Tau1EstA       <= (others=>'0');
            Tau1EstX4      <= (others=>'0');
            Mu1            <= (others=>'0');
            H0Mag          <= (others=>'0');
            H1Mag          <= (others=>'0');
            DeltaTauEst    <= (others=>'0');
         elsif (ce) then
            TrellisDelay <= TrellisDelay(2 downto 0) & TrellisStarter;
            TrellisStart <= TrellisDelay(3);
            if (TrellisStart) then   -- All estimates are done, allow time to calculate values.
               InterpWait <= 128;
            elsif (InterpWait = 1) then
               ReadInterp <= '1';  -- if first delay, start reading payload
               InterpWait <= InterpWait - 1;
            elsif (InterpWait > 0) then
               InterpWait <= InterpWait - 1;
            end if;
            -- make sure 16 are available before starting the next quad out. The packets split them otherwise
            if ((ReadInterp = '1') and (RdInterpAddr + 16 <= WrInterpAddr) and (InterpWait = 0)) or (InterpEn = '1') then
               if (InterpCount mod 4 = 3)  then
                  Interpolate <= '1';  -- go high every 4 outputs
               else
                  Interpolate <= '0';
               end if;
               if (InterpCount = 16) then
                  if (RdInterpAddr < PAYLOAD_SIZE + PRE_LOAD + FLUSH) then
                     InterpWait  <= WaitTime;   -- do sixteen then wait 16 clocks
                  else                          -- terminate frame
                     ReadInterp     <= '0';
                     InterpEn       <= '0';
                     Interpolate    <= '0';
                     InterpWait     <= 0;
                     InterpCount    <= 0;
                     RdInterpAddr   <= 0;
                  end if;
                  InterpEn    <= '0';
                  InterpCount <= 0;
               else
                  InterpCount  <= InterpCount + 1;
                  RdInterpAddr   <= RdInterpAddr + 1;
                  InterpEn       <= '1';
               end if;
            else
               InterpEn    <= '0';
               Interpolate <= '0';
            end if;

            H0EstR      <= H0EstR_sf;
            H0EstI      <= H0EstI_sf;
            H1EstR      <= H1EstR_sf;
            H1EstI      <= H1EstI_sf;

            Tau0Est     <= Tau0EstTE when (H0Mag > 0.05) else FLOAT_ZERO_1_18;
            Tau0EstA    <= resize(Tau0Est, Tau0EstA);
            Tau0EstX4   <= resize(4 * Tau0EstA, Tau0EstX4);
            Tau0Int     <= RoundTo0(Tau0EstX4);
            m_ndx0      <= Tau0Int when (Tau0EstA >= 0) else Tau0Int - 1;
            Mu0         <= resize(Tau0EstX4 - m_ndx0, Mu0, fixed_wrap, fixed_truncate);

            Tau1Est     <= Tau1EstTE when (H1Mag > 0.05) else FLOAT_ZERO_1_18;
            Tau1EstA     <= resize(Tau1Est, Tau1EstA);
            Tau1EstX4   <= resize(4 * Tau1EstA, Tau1EstX4);
            Tau1Int     <= RoundTo0(Tau1EstX4);
            m_ndx1      <= Tau1Int when (Tau1EstA >= 0) else Tau1Int - 1;
            Mu1         <= resize(Tau1EstX4 - m_ndx1, Mu1, fixed_wrap, fixed_truncate);

            H0Mag    <= resize(H0EstR_sf * H0EstR_sf + H0EstI_sf * H0EstI_sf, H0Mag);
            H1Mag    <= resize(H1EstR_sf * H1EstR_sf + H1EstI_sf * H1EstI_sf, H1Mag);
            DeltaTauEst <= resize(Tau1Est - Tau0Est, DeltaTauEst);
         end if;
      end if;
   end process InterpRead;

   MIN_M_INDX <= to_integer(unsigned(Variables.MiscBits(3 downto 1)));
   RdInterpRam0   <= RdInterpAddr + MIN_M_INDX + m_ndx0;  -- m_ndx is -4 to 3, so add 4 to insure addr is positive
   RdInterpRam1   <= RdInterpAddr + MIN_M_INDX + m_ndx1;

   InterpRamR0_u : RAM_2Reads_1Write
      GENERIC MAP(
         FILENAME    => "",
         DATA_WIDTH  => DF_R'length,
         ADDR_WIDTH  => 14,
         LATENCY     => 1,
         RAM_TYPE    => "block"
      )
      PORT MAP(
         clk         => clk,
         ce          => ce,
         reset       => reset,
         WrEn        => WriteInterp and ValidDFreg,
         WrAddr      => WrInterpAddr,
         RdAddrA     => RdInterpRam0,
         RdAddrB     => RdInterpRam1,
         WrData      => to_slv(DF_R),
         RdOutA      => InterpRamR0,
         RdOutB      => InterpRamR1
      );

   InterpRamI0_u : RAM_2Reads_1Write
      GENERIC MAP(
         FILENAME    => "",
         DATA_WIDTH  => DF_I'length,
         ADDR_WIDTH  => 14,
         LATENCY     => 1,
         RAM_TYPE    => "block"
      )
      PORT MAP(
         clk         => clk,
         ce          => ce,
         reset       => reset,
         WrEn        => WriteInterp and ValidDFreg,
         WrAddr      => WrInterpAddr,
         RdAddrA     => RdInterpRam0,
         RdAddrB     => RdInterpRam1,
         WrData      => to_slv(DF_I),
         RdOutA      => InterpRamI0,
         RdOutB      => InterpRamI1
      );

   InterpR0 : interpolator
      PORT MAP (
         clk         => clk,
         ce          => ce,
         reset       => reset,
         Interpolate => Interpolate,
         SignedMu    => Mu0,
         ValidIn     => InterpEn,
         DataIn      => to_sfixed(InterpRamR0, PARM_ZERO),
         ValidOut    => TrellisEn,
         DataOut     => InterpO_R0
   );

   InterpI0 : interpolator
      PORT MAP (
         clk         => clk,
         ce          => ce,
         reset       => reset,
         Interpolate => Interpolate,
         SignedMu    => Mu0,
         ValidIn     => InterpEn,
         DataIn      => to_sfixed(InterpRamI0, PARM_ZERO),
         ValidOut    => open,
         DataOut     => InterpO_I0
   );

   InterpR1 : interpolator
      PORT MAP (
         clk         => clk,
         ce          => ce,
         reset       => reset,
         Interpolate => Interpolate,
         SignedMu    => Mu1,
         ValidIn     => InterpEn,
         DataIn      => to_sfixed(InterpRamR1, PARM_ZERO),
         ValidOut    => open,
         DataOut     => InterpO_R1
   );

   InterpI1 : interpolator
      PORT MAP (
         clk         => clk,
         ce          => ce,
         reset       => reset,
         Interpolate => Interpolate,
         SignedMu    => Mu1,
         ValidIn     => InterpEn,
         DataIn      => to_sfixed(InterpRamI1, PARM_ZERO),
         ValidOut    => open,
         DataOut     => InterpO_I1
   );

END rtl;

/* PilotsOnly first/last sample pairs
Real           Imag
-0.7890159488  0.4552120268

0.6717097163   -0.6691625118
-0.0753587708  -0.9073327184

0.3192583919   0.8916925192
0.8537407517   0.3161446154

-0.9440104961  -0.0886550546
-0.6477586031  0.6401135325

0.4802553952   -0.8174725175
-0.3031401336  -0.8584200144



0.7161882520   0.6201308966


Zero the Taus gives 125KHz Freq, Index 596, Value 11.88, FreqForce to 1KHz
Enable Freq feedback has no effect
Tau and H's simulate and synthesize correctly on known pattern (TimeEstGoldXr/i, with RepeatR/I\WrEn = 0)

ReEnable all estimate inputs.
   Sim
   Freq = 999, Index=2053.3 Value=310.
   For PilotsOnly+1000_5% H0Mag=0.038, H1Mag=0.564
   Synth
   Freq = -11k, -8.2k

*/
