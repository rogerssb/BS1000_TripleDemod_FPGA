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
      ce             : IN  std_logic;
      StartIn,
      ValidIn        : IN  std_logic;
      InR,
      InI            : IN  SLV18;
      EstimatesDone  : OUT std_logic;
      H0EstR,
      H0EstI,
      H1EstR,
      H1EstI         : OUT STC_PARM;
      m_ndx0,
      m_ndx1         : OUT integer range -5 to 3;
      Mu0,
      Mu1            : OUT FLOAT_1_18;
      DeltaTauEst    : OUT sfixed(0 downto -5)
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
   CONSTANT PILOT_OFFSET      : positive := 3;

   CONSTANT TimeViaDF         : boolean := false;

   -- Signals
   SIGNAL   TimeR,
            TimeI             : FLOAT_1_18;
   SIGNAL   TimeRslv,
            TimeIslv          : SLV18;
   SIGNAL   TimeCount,
            FreqCount         : integer range 0 to PILOT_SIZE + PILOT_OFFSET;
   SIGNAL   WrAddr,
            TimeRead,
            TimeRdAddr,
            ChanRdAddr        : integer range 0 to TIME_DEPTH - 1;
   SIGNAL   FreqEstDone,
            ChanEstDone,
            TimeEstDone,
            TimeActive,
            ResetTiming,
            StartTime,
            StartDF,
            FirstPass,
            StartTimeChan,
            ValidTimeChan,
            ValidDF,
            ValidDFreg,
            TrellisStarter,
            TrellisPreStart   : std_logic;
   SIGNAL   DF_DataOut        : std_logic_vector(47 downto 0);
   SIGNAL   AllDone           : std_logic_vector(2 downto 0);
   SIGNAL   StartDF_Out       : std_logic_vector(StartDF_Delay-1 downto 0);
   SIGNAL   InR_sf,
            InI_sf,
            DF_R,
            DF_I,
            TimeChanR,
            TimeChanI,
            H0Mag,
            H1Mag,
            Tau0EstTE,
            Tau1EstTE,
            H0EstR_CE,
            H0EstI_CE,
            H1EstR_CE,
            H1EstI_CE,
            Tau0Est,
            Tau1Est           : STC_Parm;
   SIGNAL   ValidDly          : std_logic_vector(1 downto 0);
   SIGNAL   Tau0EstNdxTE,
            Tau1EstNdxTE      : integer range 0 to SEARCH_LENGTH;
   SIGNAL   Tau0Int,
            Tau1Int           : integer range -MIN_M_NDX to MAX_M_NDX := 0;
   SIGNAL   TrellisDelay      : SLV4;
   SIGNAL   Tau0EstX4,
            Tau1EstX4,
            Tau0EstA,
            Tau1EstA          : sfixed(3 downto -17);

-- TODO remove test points
   signal   DF_R_Ila,
            DF_I_Ila,
            TauEst0Ila,
            TauEst1Ila        : SLV18;  -- remove fractions for ILA, doesn't like negatives
   SIGNAL   ValidDF_ILA       : std_logic;

   attribute mark_debug : string;
   attribute mark_debug of DF_R_Ila, DF_I_Ila, ValidDF_ILA, TimeEstDone, ChanEstDone,
                           TauEst0Ila, TauEst1Ila, StartTime : signal is "true";

BEGIN

   IlaProcess : process(clk)
   begin
      if (rising_edge(clk)) then
         DF_R_Ila       <= to_slv(DF_R);
         DF_I_Ila       <= to_slv(DF_I);
         TauEst0Ila     <= to_slv(Tau0Est);
         TauEst1Ila     <= to_slv(Tau1Est);
         ValidDF_ILA    <= ValidDFreg;
      end if;
   end process IlaProcess;
-- end of test points TODO

   FreqProcess : process(Clk)
   begin
      if (rising_edge(Clk)) then
         FreqEstDone <= '1';   --
      end if;
   end process;

   DetectFilt : DetectionFilter
      PORT MAP (
         aclk                 => clk,
         aclken               => ce,
         aresetn              => not reset,
         s_axis_data_tvalid   => ValidIn,
         s_axis_data_tdata    => 6x"00" & to_slv(InI) & 6x"00"& to_slv(InR),
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
            DF_R        <= to_sfixed(DF_DataOut(17 downto 0), DF_R);
            DF_I        <= to_sfixed(DF_DataOut(24+17 downto 24), DF_I);
            ValidDFreg  <= ValidDF;
            if (StartIn) then
               StartDF_Out <= (0 => '1', others=>'0');
            elsif (ValidDFreg) then
               StartDF_Out <= StartDF_Out(StartDF_Delay-2 downto 0) & '0';
            end if;
         end if;
      end if;
   end process DF_Process;

   StartDF <= StartDF_Out(StartDF_Delay-1);
   InR_sf <= to_sfixed(InR, InR_sf);
   InI_sf <= to_sfixed(InI, InI_sf);

   StartTimeChan <= StartDF when (TimeViaDF) else StartIn;
   ValidTimeChan <= ValidDFreg when (TimeViaDF) else ValidIn or StartIn;
   TimeChanR     <= DF_R when (TimeViaDF) else InR_sf;
   TimeChanI     <= DF_I when (TimeViaDF) else InI_sf;
   ResetTiming   <= reset or (StartTimeChan and TimeActive);   -- if PD bell curve is on edge of packet, actual peak could be on second packet, restart

   TimeProcess : process(clk)  -- Time and channel want last half of pilot
   begin
      if (rising_edge(clk)) then
         if (ResetTiming) then
            if (StartTimeChan) then
               TimeCount <= 0;
               TimeActive <= '1';
            else
               TimeCount <= PILOT_SIZE + PILOT_OFFSET;
               TimeActive <= '0';
            end if;
            StartTime  <= '0';
            WrAddr      <= 0;
         elsif (ce) then
            if (StartTimeChan and ValidTimeChan and not TimeActive) then   -- could occur when ValidDF is skipping samples
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
         reset       => ResetTiming,   -- if Pilot restarted
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

   TrellisPreStart <= TrellisDelay(2);

   EstimatesProc : process(clk)
   begin
      if (rising_edge(clk)) then
         if (reset) then
            TrellisStarter <= '0';
            EstimatesDone   <= '0';
            AllDone        <= "000";
            TrellisDelay   <= x"0";
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
            TrellisStarter <= AllDone ?= "111";
            if (StartIn) or and(AllDone) then
               AllDone(0) <= '0';
            elsif (FreqEstDone) then
               AllDone(0) <= '1';
            end if;
            if (StartIn) or and(AllDone) then
               AllDone(1) <= '0';
            elsif (TimeEstDone) then
               AllDone(1) <= '1';
            end if;
            if (StartIn) or and(AllDone) then
               AllDone(2) <= '0';
            elsif (ChanEstDone) then
               AllDone(2) <= '1';
            end if;
            TrellisDelay <= TrellisDelay(TrellisDelay'left-1 downto 0) & TrellisStarter;
            EstimatesDone <= TrellisDelay(3);
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

            Tau0EstA    <= resize(Tau0Est, Tau0EstA) when (H0Mag > 0.05) else (others=>'0');
            Tau0EstX4   <= resize(4 * Tau0EstA, Tau0EstX4);
            Tau0Int     <= RoundTo0(Tau0EstX4);
            m_ndx0      <= Tau0Int when (Tau0EstA >= 0) else Tau0Int - 1;
            Mu0         <= resize(Tau0EstX4 - m_ndx0, Mu0, fixed_wrap, fixed_truncate);

            Tau1EstA    <= resize(Tau1Est, Tau1EstA) when (H1Mag > 0.05) else (others=>'0');
            Tau1EstX4   <= resize(4 * Tau1EstA, Tau1EstX4);
            Tau1Int     <= RoundTo0(Tau1EstX4);
            m_ndx1      <= Tau1Int when (Tau1EstA >= 0) else Tau1Int - 1;
            Mu1         <= resize(Tau1EstX4 - m_ndx1, Mu1, fixed_wrap, fixed_truncate);

            DeltaTauEst <= resize(Tau1Est - Tau0Est, DeltaTauEst);
         end if;
      end if;
   end process EstimatesProc;

END rtl;

