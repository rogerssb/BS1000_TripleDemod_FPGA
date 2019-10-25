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
use work.Semco_pkg.ALL;

ENTITY Brik2 IS
   PORT(
      clk,
      reset,
      DiffEn,
      ce             : IN  std_logic;
      StartIn,
      ValidIn        : IN  std_logic;
      InR,
      InI            : IN  SLV18;
      StartDF,
      ValidDF,
      PilotLocked,
      EstimatesDone  : OUT std_logic;
      H0EstR,
      H0EstI,
      H1EstR,
      H1EstI,
      DF_R,
      DF_I           : OUT STC_PARM;
      m_ndx0,
      m_ndx1         : OUT integer range -5 to 3;
      PhaseDiff,
      Mu0,
      Mu1            : OUT FLOAT_1_18;
      DeltaTauEst    : OUT sfixed(0 downto -5);
      PhaseOutA,
      PhaseOutB      : OUT SLV18
   );
END Brik2;


ARCHITECTURE rtl OF Brik2 IS

   COMPONENT TimingEstimate IS
      PORT(
         clk,
         ce,
         reset,
         StartIn        : IN  std_logic;
         Xr,
         Xi             : IN  FLOAT_1_18;
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

   Component CmplxMult IS
      GENERIC (
         IN_LEFT     : integer := 8;
         IN_RIGHT    : integer := -9;
         OUT_LEFT    : integer := 15;
         OUT_BINPT   : integer := -2
      );
      PORT(
         clk,
         reset,
         ce,
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
   END Component CmplxMult;

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
   CONSTANT MIN_M_NDX         : positive := 5;
   CONSTANT MAX_M_NDX         : positive := 3;
   CONSTANT PILOT_OFFSET      : natural  := 0;
   CONSTANT READ_START        : natural  := 6;
   CONSTANT READ_STOP         : natural  := 512 - READ_START;

   CONSTANT TimeViaDF         : boolean := false;

   -- Signals
   SIGNAL   TimeR,
            TimeI             : FLOAT_1_18;
   SIGNAL   TimeRslv,
            TimeIslv,
            PilotCaptureR0_slv,
            PilotCaptureI0_slv,
            PilotCaptureR1_slv,
            PilotCaptureI1_slv,
            PilotCaptureR_slv,
            PilotCaptureI_slv,
            H0Rslv,
            H0Islv,
            H1Rslv,
            H1Islv            : SLV18;
   SIGNAL   TimeCount,
            FreqCount         : integer range 0 to PILOT_SIZE + PILOT_OFFSET;
   SIGNAL   WrAddr,
            TimeRead,
            TimeRdAddr,
            ChanRdAddr        : integer range 0 to TIME_DEPTH - 1;
   SIGNAL   ChanEstDone,
            TimeEstDone,
            TimeActive,
            StartTime,
            H0GtH1,
            FirstPass,
            ValidTimeChan,
            ValidDetFilt      : std_logic;
   SIGNAL   DF_DataOut        : std_logic_vector(47 downto 0);
   SIGNAL   StartDF_Out       : std_logic_vector(StartDF_Delay-1 downto 0);
   SIGNAL   InR_sf,
            InI_sf,
            TimeChanR,
            TimeChanI,
            H0Mag,
            H1Mag,
            H0MagOver64,
            H1MagOver64,
            H0MagNorm,
            H1MagNorm,
            Tau0EstTE,
            Tau1EstTE,
            H0EstR_CE,
            H0EstI_CE,
            H1EstR_CE,
            H1EstI_CE,
            Tau0Est,
            Tau1Est           : STC_Parm;
   SIGNAL   Tau0EstNdxTE,
            Tau1EstNdxTE      : integer range 0 to SEARCH_LENGTH;
   SIGNAL   Tau0Int,
            Tau1Int           : integer range -MIN_M_NDX to MAX_M_NDX := 0;
   SIGNAL   TrellisDelay      : SLV8;
   SIGNAL   Tau0EstX4,
            Tau1EstX4,
            Tau0EstA,
            Tau1EstA          : sfixed(3 downto -17);
   SIGNAL   m_ndx             : integer range -5 to 3;

   SIGNAL   ReadCount,
            ReadCountR,
            ReadCount0,
            ReadCount1,
            InvRdCount        : signed(9 downto 0);
   SIGNAL   ReadCount_u,
            ReadCount0_u,
            ReadCount1_u,
            ReadCountR_u,
            InvRdCount_u,
            PilotCount        : unsigned(8 downto 0);
   SIGNAL   CmplxValid,
            Normalize,
            NormDone,
            CalcPhase,
            CordicStart,
            ValidCordic,
            PilotPacket       : std_logic;
   SIGNAL   ReadR0,
            ReadI0,
            ReadR1,
            ReadI1,
            ReadR0Dly,
            ReadI0Dly,
            ReadR1Dly,
            ReadI1Dly,
            ReadR,
            ReadI,
            H0H1R,
            H0H1I,
            H0RNormd,
            H0INormd,
            H1RNormd,
            H1INormd,
            H0R,
            H0I,
            H1R,
            H1I               : FLOAT_1_18;
   SIGNAL   SyncError,
            CmplxH0r,
            CmplxH0i,
            CmplxH1r,
            CmplxH1i          : sfixed(1 downto -16);
   SIGNAL   SyncSum           : sfixed(10 downto -16);
   SIGNAL   H0AccR,
            H0AccI,
            H1AccR,
            H1AccI            : sfixed(7 downto -16);
   SIGNAL   H0SumRA,
            H0SumIA,
            H1SumRA,
            H1SumIA,
            H0SumRB,
            H0SumIB,
            H1SumRB,
            H1SumIB           : sfixed(7 downto -10);
   SIGNAL   CordicR0,
            CordicI0,
            CordicR1,
            CordicI1          : sfixed(7 downto -6);
   SIGNAL   Mag0,
            Mag1              : std_logic_vector(12 downto 0);
   SIGNAL   Phase0,
            Phase1            : std_logic_vector(11 downto 0);
   SIGNAL   Phase0A,
            Phase0B,
            Phase1A,
            Phase1B           : sfixed(0 downto -Phase0'length+1);
   SIGNAL   CmplxCount        : integer range 0 to 511;
   SIGNAL   CalcPhaseDly      : SLV4;

-- TODO remove test points
   signal   SyncSumIla        : std_logic_vector(10 downto 0);
   signal   ReadR_Ila,
            ReadI_Ila,
            PhaseDiff_ILA     : SLV18;
   signal   DF_R_Ila,
            DF_I_Ila,
            TauEst0Ila,
            TauEst1Ila,
            H0EstR_Ila,
            H0EstI_Ila,
            H1EstR_Ila,
            H1EstI_Ila        : SLV18;  -- remove fractions for ILA, doesn't like negatives
   SIGNAL   ValidDF_ILA       : std_logic;

   attribute mark_debug : string;
   attribute mark_debug of /*DF_R_Ila, DF_I_Ila, ValidDF_ILA,*/ TimeEstDone, ChanEstDone,
                  TauEst0Ila, TauEst1Ila, /*StartTime, SyncSumIla, ReadR_Ila, ReadI_Ila,*/
                  H0EstR_Ila, H0EstI_Ila, H1EstR_Ila, H1EstI_Ila : signal is "true";

BEGIN

   IlaProcess : process(clk)
   begin
      if (rising_edge(clk)) then
         DF_R_Ila       <= to_slv(DF_R);
         DF_I_Ila       <= to_slv(DF_I);
         TauEst0Ila     <= to_slv(Tau0Est);
         TauEst1Ila     <= to_slv(Tau1Est);
         H0EstR_Ila     <= to_slv(H0EstR);
         H0EstI_Ila     <= to_slv(H0EstI);
         H1EstR_Ila     <= to_slv(H1EstR);
         H1EstI_Ila     <= to_slv(H1EstI);
         ValidDF_ILA    <= ValidDF;
         SyncSumIla     <= to_slv(SyncSum(10 downto 0));
         ReadR_Ila      <= to_slv(ReadR0);
         ReadI_Ila      <= to_slv(ReadI0);
         PhaseDiff_ILA  <= to_slv(PhaseDiff);

      end if;
   end process IlaProcess;
-- end of test points TODO

   PhaseOutA <= to_slv(resize(Phase0A, 0, -17));
   PhaseOutB <= to_slv(resize(Phase0B, 0, -17));

   DetectFilt : DetectionFilter
      PORT MAP (
         aclk                 => clk,
         aclken               => ce,
         aresetn              => not reset,
         s_axis_data_tvalid   => ValidIn,
         s_axis_data_tdata    => 6x"00" & to_slv(InI) & 6x"00"& to_slv(InR),
         s_axis_data_tready   => open,
         m_axis_data_tvalid   => ValidDetFilt,
         m_axis_data_tdata    => DF_DataOut
      );

   DF_Process : process(clk)
   begin
      if (rising_edge(clk)) then
         if (reset) then
            StartDF_Out <= (others=>'0');
            DF_R        <= (others=>'0');
            DF_I        <= (others=>'0');
            ValidDF     <= '0';
         elsif (ce) then
            DF_R        <= to_sfixed(DF_DataOut(17 downto 0), DF_R);
            DF_I        <= to_sfixed(DF_DataOut(24+17 downto 24), DF_I);
            ValidDF     <= ValidDetFilt;
         end if;
      end if;
   end process DF_Process;

   InR_sf <= to_sfixed(InR, InR_sf);
   InI_sf <= to_sfixed(InI, InI_sf);

   StartDF       <= StartIn;
   ValidTimeChan <= ValidDF    when (TimeViaDF) else ValidIn;
   TimeChanR     <= DF_R       when (TimeViaDF) else InR_sf;
   TimeChanI     <= DF_I       when (TimeViaDF) else InI_sf;

   TimeProcess : process(clk)  -- Time and channel want last half of pilot
   begin
      if (rising_edge(clk)) then
         if (Reset) then
            if (StartIn) then
               TimeCount <= 0;
               TimeActive <= '1';
            else
               TimeCount <= PILOT_SIZE + PILOT_OFFSET;
               TimeActive <= '0';
            end if;
            StartTime  <= '0';
            WrAddr      <= 0;
         elsif (ce) then
            if (StartIn and not TimeActive) then   -- could occur when ValidDF is skipping samples
               TimeCount   <= 0;    -- TimeCount starts after DF is primed
               WrAddr      <= 0;
               TimeActive  <= '1';
            elsif (TimeEstDone) then  -- just needs cleared before next packet
               TimeActive <= '0';
            end if;
            if (ValidTimeChan) then
               if (TimeCount < PILOT_SIZE + PILOT_OFFSET) then
                  TimeCount <= TimeCount + 1;
               end if;
               if (TimeCount >= PILOT_SIZE/2 + PILOT_OFFSET - 2) and (WrAddr < TIME_DEPTH - 1) then
                  WrAddr <= WrAddr + 1;
               end if;
            end if;
            StartTime <= '1' when (TimeCount = PILOT_SIZE + PILOT_OFFSET - 3) else '0';  -- wait till input buffer is full
         end if;
      end if;
   end process TimeProcess;
                                 -- start early for negative Ndx offsets
   FirstPass   <= ValidTimeChan when (TimeCount >= TIME_DEPTH + PILOT_OFFSET - 2) and (TimeCount < PILOT_SIZE + PILOT_OFFSET - 2) else '0';
   TimeRead    <= TimeRdAddr when TimeActive else ChanRdAddr;
   TimeR       <= resize(to_sfixed(TimeRslv, PARM_ZERO), TimeR);
   TimeI       <= resize(to_sfixed(TimeIslv, PARM_ZERO), TimeR);

   RepeatR_u : RAM_2Reads_1Write
      GENERIC MAP(
         FILENAME    => "",
         DATA_WIDTH  => TimeChanR'length,
         BINPT       => TimeChanR'right,
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
         WrData      => to_slv(TimeChanR),
         RdOutA      => TimeRslv,
         RdOutB      => open
      );

   RepeatI_u : RAM_2Reads_1Write
      GENERIC MAP(
         FILENAME    => "",
         DATA_WIDTH  => TimeChanI'length,
         BINPT       => TimeChanI'right,
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
         WrData      => to_slv(TimeChanI),
         RdOutA      => TimeIslv,
         RdOutB      => open
      );

   TE_u : TimingEstimate
      PORT MAP(
         clk         => clk,
         ce          => ce,
         reset       => Reset,
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

   EstimatesProc : process(clk)
   begin
      if (rising_edge(clk)) then
         if (reset) then
            EstimatesDone   <= '0';
            TrellisDelay   <= (others=>'0');
            m_ndx0         <= 0;
            m_ndx1         <= 0;
            Tau0Int        <= 0;
            Tau1Int        <= 0;
            H0EstR         <= (others=>'0');
            H0EstI         <= (others=>'0');
            H1EstR         <= (others=>'0');
            H1EstI         <= (others=>'0');
            Tau0Est        <= (others=>'0');
            Tau0EstA       <= (others=>'0');
            Tau0EstX4      <= (others=>'0');
            Mu0            <= (others=>'0');
            Tau1Est        <= (others=>'0');
            Tau1EstA       <= (others=>'0');
            Tau1EstX4      <= (others=>'0');
            Mu1            <= (others=>'0');
            H0Mag          <= (others=>'0');
            H1Mag          <= (others=>'0');
            DeltaTauEst    <= (others=>'0');
         elsif (ce) then
            TrellisDelay <= TrellisDelay(TrellisDelay'left-1 downto 0) & ChanEstDone;
            EstimatesDone <= TrellisDelay(TrellisDelay'left);
            if (ChanEstDone) then   -- All estimates are done, allow time to calculate values.
               H0EstR      <= H0EstR_CE;
               H0EstI      <= H0EstI_CE;
               H1EstR      <= H1EstR_CE;
               H1EstI      <= H1EstI_CE;
               H0Mag       <= resize(H0EstR_CE * H0EstR_CE + H0EstI_CE * H0EstI_CE, H0Mag);
               H1Mag       <= resize(H1EstR_CE * H1EstR_CE + H1EstI_CE * H1EstI_CE, H1Mag);
               Tau0Est     <= Tau0EstTE;
               Tau1Est     <= Tau1EstTE;
            end if;

            H0GtH1 <= '1' when (H0Mag > H1Mag) else '0';

            Tau0EstA    <= resize(Tau0Est, Tau0EstA);
            Tau0EstX4   <= resize(4 * Tau0EstA, Tau0EstX4);
            Tau0Int     <= RoundTo0(Tau0EstX4);

            Tau1EstA    <= resize(Tau1Est, Tau1EstA);
            Tau1EstX4   <= resize(4 * Tau1EstA, Tau1EstX4);
            Tau1Int     <= RoundTo0(Tau1EstX4);

            if (H0MagOver64 > H1Mag) then -- if H0 is > 64 * H1, then ignore H1
               Mu0         <= resize(Tau0EstX4 - m_ndx0, Mu0, fixed_wrap, fixed_truncate);
               Mu1         <= (others=>'0');
               DeltaTauEst <= (others=>'0');
               m_ndx0      <= Tau0Int when (Tau0EstA >= 0) else Tau0Int - 1;
               m_ndx1      <= 0;
            elsif (H1MagOver64 > H0Mag) then
               Mu0         <= (others=>'0');
               Mu1         <= resize(Tau1EstX4 - m_ndx1, Mu1, fixed_wrap, fixed_truncate);
               DeltaTauEst <= (others=>'0');
               m_ndx0      <= 0;
               m_ndx1      <= Tau1Int when (Tau1EstA >= 0) else Tau1Int - 1;
            else
               Mu0         <= resize(Tau0EstX4 - m_ndx0, Mu0, fixed_wrap, fixed_truncate);
               Mu1         <= resize(Tau1EstX4 - m_ndx1, Mu1, fixed_wrap, fixed_truncate);
               DeltaTauEst <= resize(Tau1EstA - Tau0EstA, DeltaTauEst);
               m_ndx0      <= Tau0Int when (Tau0EstA >= 0) else Tau0Int - 1;
               m_ndx1      <= Tau1Int when (Tau1EstA >= 0) else Tau1Int - 1;
            end if;
         end if;
      end if;
   end process EstimatesProc;

   H0MagOver64 <= H0Mag sra 6;
   H1MagOver64 <= H1Mag sra 6;

   -- estimates are valid, use realigned pilot to check phase shift between first half and second
   -- half of the the pilot for a wideband frequency offset.
   DoublePhaseProc : process(Clk)
   begin
      if (rising_edge(Clk)) then
         if (Reset) then
            SyncSum        <= (others=>'0');
            SyncError      <= (others=>'0');
            ReadCount      <= to_signed(511, ReadCount'length);
            PilotCount     <= (others=>'0');
            PhaseDiff      <= (others=>'0');
            H0SumIA        <= (others=>'0');
            H1SumRA        <= (others=>'0');
            H1SumIA        <= (others=>'0');
            H0AccR         <= (others=>'0');
            H0AccI         <= (others=>'0');
            H1AccR         <= (others=>'0');
            H1AccI         <= (others=>'0');
            H0SumRB        <= (others=>'0');
            H0SumIB        <= (others=>'0');
            H1SumRB        <= (others=>'0');
            H1SumIB        <= (others=>'0');
            H0MagNorm      <= (others=>'0');
            H1MagNorm      <= (others=>'0');
            Phase0A        <= (others=>'0');
            Phase0B        <= (others=>'0');
            Phase1A        <= (others=>'0');
            Phase1B        <= (others=>'0');
            CmplxCount     <= 0;
            CordicStart    <= '0';
            PilotPacket    <= '0';
            PilotLocked    <= '0';
            CalcPhase      <= '0';
            Normalize      <= '0';
            NormDone       <= '0';
            CalcPhaseDly   <= x"0";
         elsif (ce) then
            if (EstimatesDone) then
               CmplxCount  <= 0;
               H0AccR      <= (others=>'0');    -- setup for first half
               H0AccI      <= (others=>'0');
               H1AccR      <= (others=>'0');
               H1AccI      <= (others=>'0');
               H0MagNorm   <= H0Mag;
               H1MagNorm   <= H1Mag;
               Normalize      <= '1';
            elsif (Normalize) then        -- normalize mags till max is in 0.25 to 0.5 range
               if (H0MagNorm < 0.25) and (H1MagNorm < 0.25) then
                  H0MagNorm <= resize(H0MagNorm + H0MagNorm, H0MagNorm);
                  H1MagNorm <= resize(H1MagNorm + H1MagNorm, H1MagNorm);
               elsif (H0MagNorm >= 0.5) or (H1MagNorm >= 0.5) then
                  H0MagNorm <= resize(H0MagNorm sra 1, H0MagNorm);   -- divide by 2
                  H1MagNorm <= resize(H1MagNorm sra 1, H1MagNorm);
               else
                  Normalize <= '0';
                  NormDone  <= '1';
               end if;
            elsif (CmplxValid) then
               if (CmplxCount = 256) then                -- store first half, start second
                  CordicStart <= '1';
                  CmplxCount <= CmplxCount + 1;
                  H0SumRA <= resize(H0AccR, H0SumRA);
                  H0SumIA <= resize(H0AccI, H0SumIA);
                  H1SumRA <= resize(H1AccR, H1SumRA);
                  H1SumIA <= resize(H1AccI, H1SumIA);
                  H0AccR <= resize(CmplxH0r, H0AccR);
                  H0AccI <= resize(CmplxH0i, H0AccR);
                  H1AccR <= resize(CmplxH1r, H0AccR);
                  H1AccI <= resize(CmplxH1i, H0AccR);
               elsif (CmplxCount = 511) then
                  H0SumRB <= resize(H0AccR + CmplxH0r, H0SumRB);  -- store second half
                  H0SumIB <= resize(H0AccI + CmplxH0i, H0SumIB);
                  H1SumRB <= resize(H1AccR + CmplxH1r, H1SumRB);
                  H1SumIB <= resize(H1AccI + CmplxH1i, H1SumIB);
                  CordicStart <= '1';
                  CmplxCount <= 0;
               else
                  CmplxCount <= CmplxCount + 1;          -- accumulate over pilot
                  CordicStart <= '0';
                  H0AccR <= resize(H0AccR + CmplxH0r, H0AccR);
                  H0AccI <= resize(H0AccI + CmplxH0i, H0AccR);
                  H1AccR <= resize(H1AccR + CmplxH1r, H0AccR);
                  H1AccI <= resize(H1AccI + CmplxH1i, H0AccR);
               end if;
            else
               NormDone  <= '0';       -- NormDone gets cleared just after Normalize goes low since CmplxValid takes a while
               CordicStart <= '0';
            end if;

            if (ValidCordic) then
               if (CmplxCount > 0) then
                  Phase0A <= to_sfixed(Phase0, Phase0A);
                  Phase1A <= to_sfixed(Phase1, Phase1A);
               else     -- process is done and count is reset to 0
                  Phase0B <= to_sfixed(Phase0, Phase0B);
                  Phase1B <= to_sfixed(Phase1, Phase1B);
                  if (Mag0 > Mag1) then
                     if (DiffEn) then                    -- Phase0B - Phase0A
                        PhaseDiff <= resize(to_sfixed(Phase0, Phase0A) - Phase0A, PhaseDiff);
                     else
                        PhaseDiff <= resize(Phase0A, PhaseDiff);
                     end if;
                  else
                     if (DiffEn) then
                        PhaseDiff <= resize(to_sfixed(Phase1, Phase1A) - Phase1A, PhaseDiff);
                     else
                        PhaseDiff <= resize(Phase1A, PhaseDiff);
                     end if;
                  end if;
               end if;
            else     -- if  phases rollover 180°...
               if (PhaseDiff >= 0.5) then
                  PhaseDiff <= resize(PhaseDiff - 1.0, PhaseDiff);
               elsif (PhaseDiff <= -0.5) then
                  PhaseDiff <= resize(PhaseDiff + 1.0, PhaseDiff);
               end if;
            end if;

            -- capture the pilot packet
            if (StartIn) then
               PilotPacket <= '1';
               PilotCount  <= (others=>'0');
            elsif (PilotCount = 511) then
               PilotPacket <= '0';
            end if;
            if (PilotPacket and ValidIn) then
               PilotCount <= PilotCount + 1;
            end if;

            -- now that estimates are done, start phase and sync routines
            if (NormDone) then
               SyncSum <= (others=>'0');
               ReadCount <= (others=>'0');
               CalcPhase <= '1';
            elsif (ReadCount >= READ_START) and (ReadCount <= READ_STOP) then   -- skip the edges
               SyncError   <= resize(Abs(ReadR - ReadI), SyncError);
               SyncSum     <= resize(SyncSum + SyncError, SyncSum);
               ReadCount   <= ReadCount + 1;
               if (ReadCount = 506) then
                  PilotLocked <= '1' when SyncSum < 100 else '0';
               end if;
            elsif (ReadCount < 511) then
               ReadCount <= ReadCount + 1;
            elsif (ReadCount = 511) then  -- turn of Calcs and idle here
               CalcPhase   <= '0';
            end if;

            CalcPhaseDly <= CalcPhaseDly(2 downto 0) & CalcPhase;
         end if;
      end if;
   end process DoublePhaseProc;

   m_ndx        <= m_ndx0 when H0GtH1 else m_ndx1;
   ReadCount0   <= ReadCount + m_ndx0;
   ReadCount1   <= ReadCount + m_ndx1;
   ReadCountR   <= ReadCount + m_ndx;
   ReadCount_u  <= unsigned(ReadCount(8 downto 0));
   ReadCount0_u <= unsigned(ReadCount0(8 downto 0));
   ReadCount1_u <= unsigned(ReadCount1(8 downto 0));
   ReadCountR_u <= unsigned(ReadCountR(8 downto 0));

   PilotCapture_r_u : RAM_2Reads_1Write
      GENERIC MAP(
         FILENAME    => "",
         DATA_WIDTH  => 18,
         ADDR_WIDTH  => 9,
         LATENCY     => 2
      )
      PORT MAP(
         clk         => clk,
         ce          => ce,
         reset       => reset,
         WrEn        => PilotPacket and ValidIn,
         WrAddr      => to_integer(PilotCount),
         RdAddrA     => to_integer(ReadCount0_u),
         RdAddrB     => to_integer(ReadCount1_u),
         WrData      => InR,
         RdOutA      => PilotCaptureR0_slv,
         RdOutB      => PilotCaptureR1_slv
      );

   PilotCapture_i_u : RAM_2Reads_1Write
      GENERIC MAP(
         FILENAME    => "",
         DATA_WIDTH  => 18,
         ADDR_WIDTH  => 9,
         LATENCY     => 2
      )
      PORT MAP(
         clk         => clk,
         ce          => ce,
         reset       => reset,
         WrEn        => PilotPacket and ValidIn,
         WrAddr      => to_integer(PilotCount),
         RdAddrA     => to_integer(ReadCount0_u),
         RdAddrB     => to_integer(ReadCount1_u),
         WrData      => InI,
         RdOutA      => PilotCaptureI0_slv,
         RdOutB      => PilotCaptureI1_slv
      );

   PilotCapture_ReadR_u : RAM_2Reads_1Write
      GENERIC MAP(
         FILENAME    => "",
         DATA_WIDTH  => 18,
         ADDR_WIDTH  => 9,
         LATENCY     => 1
      )
      PORT MAP(
         clk         => clk,
         ce          => ce,
         reset       => reset,
         WrEn        => PilotPacket and ValidIn,
         WrAddr      => to_integer(PilotCount),
         RdAddrA     => 0,
         RdAddrB     => to_integer(ReadCountR_u),
         WrData      => InR,
         RdOutA      => open,
         RdOutB      => PilotCaptureR_slv
      );

   PilotCapture_ReadI_u : RAM_2Reads_1Write
      GENERIC MAP(
         FILENAME    => "",
         DATA_WIDTH  => 18,
         ADDR_WIDTH  => 9,
         LATENCY     => 1
      )
      PORT MAP(
         clk         => clk,
         ce          => ce,
         reset       => reset,
         WrEn        => PilotPacket and ValidIn,
         WrAddr      => to_integer(PilotCount),
         RdAddrA     => 0,
         RdAddrB     => to_integer(InvRdCount_u),
         WrData      => InI,
         RdOutA      => open,
         RdOutB      => PilotCaptureI_slv
      );

   InvRdCount  <= READ_STOP - ReadCountR + (2 * m_ndx);
   InvRdCount_u <= unsigned(InvRdCount(8 downto 0));
   ReadR       <= to_sfixed(PilotCaptureR_slv,  ReadR);
   ReadI       <= to_sfixed(PilotCaptureI_slv,  ReadI);

   H0H1Process : process(clk)
   begin
      if (rising_edge(clk)) then
         H0RNormd    <= resize(H0R * H0MagNorm, H0RNormd);
         H0INormd    <= resize(H0I * H0MagNorm, H0INormd);
         H1RNormd    <= resize(H1R * H1MagNorm, H0RNormd);
         H1INormd    <= resize(H1I * H1MagNorm, H0INormd);
         H0H1R       <= resize(H0RNormd + H1RNormd, H0H1R);
         H0H1I       <= not(resize(H0INormd + H1INormd, H0H1I));  -- use conjugate
         ReadR0      <= to_sfixed(PilotCaptureR0_slv, ReadR0);
         ReadI0      <= to_sfixed(PilotCaptureI0_slv, ReadI0);
         ReadR1      <= to_sfixed(PilotCaptureR1_slv, ReadR1);
         ReadI1      <= to_sfixed(PilotCaptureI1_slv, ReadI1);
         ReadR0Dly   <= ReadR0;
         ReadI0Dly   <= ReadI0;
         ReadR1Dly   <= ReadR1;
         ReadI1Dly   <= ReadI1;
      end if;
   end process H0H1Process;

   CmplxMultH0 : CmplxMult
      GENERIC MAP (
         IN_LEFT     => ReadR0Dly'left,
         IN_RIGHT    => ReadR0Dly'right,
         OUT_LEFT    => CmplxH0r'left,
         OUT_BINPT   => CmplxH0r'right
      )
      PORT MAP (
         clk         => clk,
         reset       => reset,
         ce          => ce,
         ValidIn     => CalcPhaseDly(3),
         StartIn     => '0',
         ReadyIn     => '1',
         ReInA       => ReadR0Dly,
         ImInA       => ReadI0Dly,
         ReInB       => H0H1R,
         ImInB       => H0H1I,
         ReOut       => CmplxH0r,
         ImOut       => CmplxH0i,
         ValidOut    => CmplxValid,
         StartOut    => open
   );

   CmplxMultH1 : CmplxMult
      GENERIC MAP (
         IN_LEFT     => ReadR1Dly'left,
         IN_RIGHT    => ReadR1Dly'right,
         OUT_LEFT    => CmplxH1r'left,
         OUT_BINPT   => CmplxH1r'right
      )
      PORT MAP (
         clk         => clk,
         reset       => reset,
         ce          => ce,
         ValidIn     => CalcPhaseDly(3),
         StartIn     => '0',
         ReadyIn     => '1',
         ReInA       => ReadR1Dly,
         ImInA       => ReadI1Dly,
         ReInB       => H0H1R,
         ImInB       => H0H1I,
         ReOut       => CmplxH1r,
         ImOut       => CmplxH1i,
         ValidOut    => open,
         StartOut    => open
   );

   H0r_u : RAM_2Reads_1Write
      GENERIC MAP(
         FILENAME    => "..\sourceData\p0_r_pt17.slv",
         DATA_WIDTH  => H0r'length,
         BINPT       => H0r'right,
         ADDR_WIDTH  => 9,
         FILE_IS_SLV => true,
         LATENCY     => 2,
         RAM_TYPE    => "block"
      )
      PORT MAP(
         clk         => Clk,
         ce          => ce,
         reset       => reset,
         WrEn        => '0',
         WrAddr      => 0,
         RdAddrA     => to_integer(ReadCount_u),
         RdAddrB     => 0,
         WrData      => (others=>'0'),
         RdOutA      => H0Rslv,
         RdOutB      => open
      );

   H0i_u : RAM_2Reads_1Write
      GENERIC MAP(
         FILENAME    => "..\sourceData\p0_i_pt17.slv",
         DATA_WIDTH  => H0r'length,
         BINPT       => H0r'right,
         ADDR_WIDTH  => 9,
         FILE_IS_SLV => true,
         LATENCY     => 2,
         RAM_TYPE    => "block"
      )
      PORT MAP(
         clk         => Clk,
         ce          => ce,
         reset       => reset,
         WrEn        => '0',
         WrAddr      => 0,
         RdAddrA     => to_integer(ReadCount_u),
         RdAddrB     => 0,
         WrData      => (others=>'0'),
         RdOutA      => H0Islv,
         RdOutB      => open
      );

   H1r_u : RAM_2Reads_1Write
      GENERIC MAP(
         FILENAME    => "..\sourceData\p1_r_pt17.slv",
         DATA_WIDTH  => H0r'length,
         BINPT       => H0r'right,
         ADDR_WIDTH  => 9,
         FILE_IS_SLV => true,
         LATENCY     => 2,
         RAM_TYPE    => "block"
      )
      PORT MAP(
         clk         => Clk,
         ce          => ce,
         reset       => reset,
         WrEn        => '0',
         WrAddr      => 0,
         RdAddrA     => to_integer(ReadCount_u),
         RdAddrB     => 0,
         WrData      => (others=>'0'),
         RdOutA      => H1Rslv,
         RdOutB      => open
      );

   H1i_u : RAM_2Reads_1Write
      GENERIC MAP(
         FILENAME    => "..\sourceData\p1_i_pt17.slv",
         DATA_WIDTH  => H0r'length,
         BINPT       => H0r'right,
         ADDR_WIDTH  => 9,
         FILE_IS_SLV => true,
         LATENCY     => 2,
         RAM_TYPE    => "block"
      )
      PORT MAP(
         clk         => Clk,
         ce          => ce,
         reset       => reset,
         WrEn        => '0',
         WrAddr      => 0,
         RdAddrA     => to_integer(ReadCount_u),
         RdAddrB     => 0,
         WrData      => (others=>'0'),
         RdOutA      => H1Islv,
         RdOutB      => open
      );

   H0R      <= to_sfixed(H0Rslv, H0R);
   H0I      <= to_sfixed(H0Islv, H0I);
   H1R      <= to_sfixed(H1Rslv, H1R);
   H1I      <= to_sfixed(H1Islv, H1I);
   CordicR0 <= resize(H0SumRA, CordicR0) when (CmplxCount > 0) else resize(H0SumRB, CordicR0);
   CordicI0 <= resize(H0SumIA, CordicR0) when (CmplxCount > 0) else resize(H0SumIB, CordicR0);
   CordicR1 <= resize(H1SumRA, CordicR0) when (CmplxCount > 0) else resize(H1SumRB, CordicR0);
   CordicI1 <= resize(H1SumIA, CordicR0) when (CmplxCount > 0) else resize(H1SumIB, CordicR0);

   cordic0 : vm_cordic_fast
      GENERIC MAP (
         n => 14
      )
      PORT MAP (
         clk   => Clk,
         ena   => CordicStart,
         x     => to_slv(CordicR0),
         y     => to_slv(CordicI0),
         m     => Mag0,          -- m[n:2]
         p     => Phase0,
         enOut => ValidCordic
      );

   cordic1 : vm_cordic_fast
      GENERIC MAP (
         n => 14
      )
      PORT MAP (
         clk   => Clk,
         ena   => CordicStart,
         x     => to_slv(CordicR1),
         y     => to_slv(CordicI1),
         m     => Mag1,          -- m[n:2]
         p     => Phase1,
         enOut => open
      );

END rtl;
