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
      clk93,
      reset,
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
      PhaseOutA,
      PhaseOutB      : OUT SLV12
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

   COMPONENT HalfPilotPhase IS
   PORT(
      clk,
      reset,
      StartHPP,
      ce,
      StartIn,
      ValidIn,
      Mag0GtMag1     : IN  std_logic;
      InR,
      InI            : IN  SLV18;
      m_ndx0,
      m_ndx1         : IN  integer range -5 to 3;
      H0Mag,
      H1Mag          : IN  std_logic_vector(12 downto 0);
      H0EstR,
      H0EstI,
      H1EstR,
      H1EstI         : IN  STC_PARM;
      PhaseDiff      : OUT sfixed(0 downto -11);
      PhaseOutA,
      PhaseOutB      : OUT SLV12;
      PilotLocked    : OUT std_logic
   );
   END COMPONENT HalfPilotPhase;

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
   CONSTANT MIN_M_NDX         : positive := 5;
   CONSTANT MAX_M_NDX         : positive := 3;

   -- Signals
   SIGNAL   TimeR,
            TimeI             : FLOAT_1_18;
   SIGNAL   TimeRslv,
            TimeIslv          : SLV18;
   SIGNAL   TimeCount         : integer range 0 to PILOT_SIZE;
   SIGNAL   WrAddr,
            TimeRead,
            TimeRdAddr,
            ChanRdAddr        : integer range 0 to TIME_DEPTH - 1;
   SIGNAL   ChanEstDone,
            ChanEstDoneDly,
            TimeEstDone,
            TimeActive,
            StartTime,
            FirstPass         : std_logic;
   SIGNAL   InR_sf,
            InI_sf,
            H0MagCE,
            H1MagCE,
            H0MagOver32,
            H1MagOver32,
            Tau0EstTE,
            Tau1EstTE,
            H0EstR_CE,
            H0EstI_CE,
            H1EstR_CE,
            H1EstI_CE,
            H0EstR_Sqr,
            H0EstI_Sqr,
            H1EstR_Sqr,
            H1EstI_Sqr,
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


-- TODO remove test points
   signal   TauEst0Ila,
            TauEst1Ila,
            H0EstR_Ila,
            H0EstI_Ila,
            H1EstR_Ila,
            H1EstI_Ila        : SLV18;  -- remove fractions for ILA, doesn't like negatives

   attribute KEEP : string;
   attribute KEEP of TimeActive : signal is "true";

   attribute mark_debug : string;
   attribute mark_debug of TimeEstDone, ChanEstDone, TauEst0Ila, TauEst1Ila,
                  H0EstR_Ila, H0EstI_Ila, H1EstR_Ila, H1EstI_Ila : signal is "true";

BEGIN

   IlaProcess : process(clk)
   begin
      if (rising_edge(clk)) then
         TauEst0Ila     <= to_slv(Tau0Est);
         TauEst1Ila     <= to_slv(Tau1Est);
         H0EstR_Ila     <= to_slv(H0EstR);
         H0EstI_Ila     <= to_slv(H0EstI);
         H1EstR_Ila     <= to_slv(H1EstR);
         H1EstI_Ila     <= to_slv(H1EstI);
      end if;
   end process IlaProcess;
-- end of test points TODO

   InR_sf <= to_sfixed(InR, InR_sf);
   InI_sf <= to_sfixed(InI, InI_sf);

   TimeProcess : process(clk)  -- Time and channel want last half of pilot
   begin
      if (rising_edge(clk)) then
         if (Reset) then
            if (StartIn) then
               TimeCount <= 0;
               TimeActive <= '1';
            else
               TimeCount <= PILOT_SIZE;
               TimeActive <= '0';
            end if;
            StartTime  <= '0';
            WrAddr      <= 0;
         elsif (ce) then
            if (StartIn and not TimeActive) then   -- could occur when ValidIn is skipping samples
               TimeCount   <= 0;
               WrAddr      <= 0;
               TimeActive  <= '1';
            elsif (TimeEstDone) then  -- just needs cleared before next packet
               TimeActive <= '0';
            end if;
            if (ValidIn) then
               if (TimeCount < PILOT_SIZE) then
                  TimeCount <= TimeCount + 1;
               end if;
               if (TimeCount >= PILOT_SIZE/2 - 2) and (WrAddr < TIME_DEPTH - 1) then
                  WrAddr <= WrAddr + 1;
               end if;
            end if;     -- make StartTime two clocks wide for Clk93 driving TE
            StartTime <= '1' when (TimeCount = PILOT_SIZE - 3) or (TimeCount = PILOT_SIZE - 2) else '0';  -- wait till input buffer is full
         end if;
      end if;
   end process TimeProcess;
                                 -- start early for negative Ndx offsets
   FirstPass   <= ValidIn when (TimeCount >= TIME_DEPTH - 2) and (TimeCount < PILOT_SIZE - 2) else '0';
   TimeRead    <= TimeRdAddr when TimeActive else ChanRdAddr;
   TimeR       <= resize(to_sfixed(TimeRslv, PARM_ZERO), TimeR);
   TimeI       <= resize(to_sfixed(TimeIslv, PARM_ZERO), TimeR);

   RepeatR_u : RAM_2Reads_1Write
      GENERIC MAP(
         FILENAME    => "",
         DATA_WIDTH  => InR_sf'length,
         BINPT       => InR_sf'right,
         ADDR_WIDTH  => 8,
         FILE_IS_SLV => false,
         LATENCY     => 2,
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
         WrData      => InR,
         RdOutA      => TimeRslv,
         RdOutB      => open
      );

   RepeatI_u : RAM_2Reads_1Write
      GENERIC MAP(
         FILENAME    => "",
         DATA_WIDTH  => InI_sf'length,
         BINPT       => InI_sf'right,
         ADDR_WIDTH  => 8,
         LATENCY     => 2,
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
         WrData      => InI,
         RdOutA      => TimeIslv,
         RdOutB      => open
      );

   -- run estimates at slow clock to ease timing
   TE_u : TimingEstimate
      PORT MAP(
         clk         => clk93,
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
         clk            => clk93,
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

   EstimatesProc : process(clk93)
      variable  Delta  : sfixed(4 downto -17);
   begin
      if (rising_edge(clk93)) then
         if (reset) then
            EstimatesDone  <= '0';
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
            H0MagCE        <= (others=>'0');
            H1MagCE        <= (others=>'0');
            DeltaTauEst    <= (others=>'0');
         elsif (ce) then
            TrellisDelay   <= TrellisDelay(TrellisDelay'left-1 downto 0) & ChanEstDoneDly;
            EstimatesDone  <= TrellisDelay(TrellisDelay'left);
            ChanEstDoneDly <= ChanEstDone;
            H0EstR_Sqr     <= resize(H0EstR_CE * H0EstR_CE, H0EstR_Sqr);
            H0EstI_Sqr     <= resize(H0EstI_CE * H0EstI_CE, H0EstI_Sqr);
            H1EstR_Sqr     <= resize(H1EstR_CE * H1EstR_CE, H1EstR_Sqr);
            H1EstI_Sqr     <= resize(H1EstI_CE * H1EstI_CE, H1EstI_Sqr);

            if (ChanEstDoneDly) then   -- All estimates are done, allow time to calculate values.
               H0EstR      <= H0EstR_CE;
               H0EstI      <= H0EstI_CE;
               H1EstR      <= H1EstR_CE;
               H1EstI      <= H1EstI_CE;
               H0MagCE     <= resize(H0EstR_Sqr + H0EstI_Sqr, H0MagCE);
               H1MagCE     <= resize(H1EstR_Sqr + H1EstI_Sqr, H1MagCE);
               Tau0Est     <= Tau0EstTE;
               Tau1Est     <= Tau1EstTE;
            end if;

            Tau0EstA    <= resize(Tau0Est, Tau0EstA);
            Tau0EstX4   <= resize(4 * Tau0EstA, Tau0EstX4);
            Tau0Int     <= RoundTo0(Tau0EstX4);

            Tau1EstA    <= resize(Tau1Est, Tau1EstA);
            Tau1EstX4   <= resize(4 * Tau1EstA, Tau1EstX4);
            Tau1Int     <= RoundTo0(Tau1EstX4);

            if (H0MagOver32 > H1MagCE) then -- if H0 is > 32 * H1, then ignore H1
               Mu0         <= resize(Tau0EstX4 - m_ndx0, Mu0, fixed_wrap, fixed_truncate);
               Mu1         <= (others=>'0');
               DeltaTauEst <= (others=>'0');
               m_ndx0      <= Tau0Int when (Tau0EstA >= 0) else Tau0Int - 1;
               m_ndx1      <= 0;
            elsif (H1MagOver32 > H0MagCE) then
               Mu0         <= (others=>'0');
               Mu1         <= resize(Tau1EstX4 - m_ndx1, Mu1, fixed_wrap, fixed_truncate);
               DeltaTauEst <= (others=>'0');
               m_ndx0      <= 0;
               m_ndx1      <= Tau1Int when (Tau1EstA >= 0) else Tau1Int - 1;
            else
               Mu0         <= resize(Tau0EstX4 - m_ndx0, Mu0, fixed_wrap, fixed_truncate);
               Mu1         <= resize(Tau1EstX4 - m_ndx1, Mu1, fixed_wrap, fixed_truncate);
               Delta       := resize(Tau1EstA - Tau0EstA, Delta);
               if (Delta >= 1.0) then
                  DeltaTauEst <= (DeltaTauEst'left => '0', others=>'1');   -- almost +1.0
               elsif (Delta <= -1.0) then
                  DeltaTauEst <= to_sfixed(-1.0, DeltaTauEst);
               else
                  DeltaTauEst <= resize(Tau1EstA - Tau0EstA, DeltaTauEst);
               end if;
               m_ndx0      <= Tau0Int when (Tau0EstA >= 0) else Tau0Int - 1;
               m_ndx1      <= Tau1Int when (Tau1EstA >= 0) else Tau1Int - 1;
            end if;
         end if;
      end if;
   end process EstimatesProc;

   H0MagOver32 <= H0MagCE sra 5;
   H1MagOver32 <= H1MagCE sra 5;

   HPP : HalfPilotPhase
      PORT MAP(
         clk            => clk,
         reset          => reset,
         StartHPP       => StartHPP,
         ce             => ce,
         StartIn        => StartIn,
         ValidIn        => ValidIn,
         Mag0GtMag1     => Mag0GtMag1,
         InR            => InR,
         InI            => InI,
         H0Mag          => H0MagIn,
         H1Mag          => H1MagIn,
         H0EstR         => H0EstR,
         H0EstI         => H0EstI,
         H1EstR         => H1EstR,
         H1EstI         => H1EstI,
         m_ndx0         => m_ndx0,
         m_ndx1         => m_ndx1,
         PhaseDiff      => PhaseDiff,
         PhaseOutA      => PhaseOutA,
         PhaseOutB      => PhaseOutB,
         PilotLocked    => PilotLocked
   );

END rtl;
