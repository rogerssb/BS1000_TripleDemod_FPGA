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

Module Name: HalfPilotPhase.vhd
Description:   Do a correlation with a composite H0&H1 template and the incoming
   RF stream. The composite takes the magnitude of the H0 and H1 from the estimators
   to weight a H0Template * H0Mag + H1Template * H1Mag. This better matches what the
   RF stream looks like and give a better correlation than just the two templates.
      To do the half pilot phase part, the complex multiply outputs are added
   together of the first half of the pilot and then again with the second half.
   The complex results are then converted to mag and phase. The phase difference
   is then calculated as the final output.
      Note, that two correlations are actually being computed based on the m_ndx
   signals for H0 and H1. These are used to offset the template relative to the
   carrier and generate Phase0 and Phase1. Other than this distinction, the two
   correlations are identical.

ARGUMENTS :


Dependencies:

----------------------------------------------------------------------------
                               DETAILS
----------------------------------------------------------------------------
if Phase is 0 and Freq is 0 with one carrier, the PhaseDiff is 0
Setting a phase offset on one carrier gives .00097
Changing the power ratios gives a max phase of 0.0035
Adding random phases and huge offsets especially at even power levels

1kHz gives phase diff of .025

----- MATLAB Results--------
H0H1 = H0 + H1
H0H1I = H0 - H1

at 500Hz, Diff yields
   H0H1  H0H1I = -178
   H0H1  H0H1  = 1.27
   H0    H0H1  = -5.41
   H0    H0H1I = 6.76
   H1    H0H1  = 7.97
   H1    H0H1I = -5.72
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

ENTITY HalfPilotPhase IS
   PORT(
      clk,
      reset,
      DiffMag,
      PhaseMag,
      EstimatesDone,
      ce             : IN  std_logic;
      StartIn,
      ValidIn        : IN  std_logic;
      InR,
      InI            : IN  SLV18;
      m_ndx0,
      m_ndx1         : IN  integer range -5 to 3;
      H0Mag,
      H1Mag          : IN  sfixed(0 downto -17);
      PhaseDiff,
      PhaseOut       : OUT FLOAT_1_18;
      PhaseOutA,
      PhaseOutB      : OUT SLV18;
      PilotLocked    : OUT std_logic
   );
END HalfPilotPhase;


ARCHITECTURE rtl OF HalfPilotPhase IS

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

   CONSTANT READ_START        : natural  := 6;
   CONSTANT READ_STOP         : natural  := 512 - READ_START;

   -- Signals
   SIGNAL   PilotCaptureR0_slv,
            PilotCaptureI0_slv,
            PilotCaptureR1_slv,
            PilotCaptureI1_slv,
            PilotCaptureR_slv,
            PilotCaptureI_slv,
            H0Rslv,
            H0Islv,
            H1Rslv,
            H1Islv            : SLV18;
   SIGNAL   WrAddr            : integer range 0 to TIME_DEPTH - 1;
   SIGNAL   H0GtH1           : std_logic;
   SIGNAL   H0MagNorm,
            H1MagNorm         : STC_Parm;
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
            NoMagWt,
            CalcPhase,
            CordicStart,
            ValidCordic,
            PilotPacket       : std_logic;
   SIGNAL   ReadR0,
            ReadI0,
            ReadR1,
            ReadI1,
            ReadR0Dly0,
            ReadI0Dly0,
            ReadR1Dly0,
            ReadI1Dly0,
            ReadR0Dly1,
            ReadI0Dly1,
            ReadR1Dly1,
            ReadI1Dly1,
            ReadR,
            ReadI,
            H0H1R,
            H0H1I,
            H0RNormd,
            H0INormd,
            H1RNormd,
            H1INormd,
            p0R,
            p0I,
            p1R,
            p1I,
            H0R_Dly0,
            H0I_Dly0,
            H1R_Dly0,
            H1I_Dly0,
            H0R_Dly1,
            H0I_Dly1,
            H1R_Dly1,
            H1I_Dly1,
            H0R,
            H0I,
            H1R,
            H1I              : FLOAT_1_18;
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

   attribute mark_debug : string;
   attribute mark_debug of Phase0A, Phase0B, Phase1A, Phase1B : signal is "true";

BEGIN


   -- estimates are valid, use realigned pilot to check phase shift between first half and second
   -- half of the the pilot for a wideband frequency offset.

   PhaseOutA <= to_slv(resize(Phase0A, 0, -17));
   PhaseOutB <= to_slv(resize(Phase0B, 0, -17));

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
               NoMagWt      <= '1';
               H0AccR      <= (others=>'0');    -- setup for first half
               H0AccI      <= (others=>'0');
               H1AccR      <= (others=>'0');
               H1AccI      <= (others=>'0');
               H0MagNorm   <= H0Mag;
               H1MagNorm   <= H1Mag;
               Normalize      <= '1';
            elsif (Normalize) then        -- normalize mags till max is in 0.25 to 0.5 range
               if (H0MagNorm < 0.25) and (H1MagNorm < 0.25) then
                  H0MagNorm <= resize(H0MagNorm + H0MagNorm, H0MagNorm);   -- multiply by 2
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
                  NoMagWt      <= '0';
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
               if (CmplxCount > 30) then
                  Phase0A <= to_sfixed(Phase0, Phase0A);
                  Phase1A <= to_sfixed(Phase1, Phase1A);
               else     -- process is done and count is reset to 0
                  Phase0B <= to_sfixed(Phase0, Phase0B);
                  Phase1B <= to_sfixed(Phase1, Phase1B);
               end if;
            end if;

            if (ValidCordic) then
               if (CmplxCount < 30) then
                  if (Mag0 > Mag1) then
                     if ((DiffMag = '0') and (ReadCount < 30)) or ((DiffMag = '1') and (ReadCount = 511)) then -- Phase0B - Phase0A
                        PhaseDiff <= resize(to_sfixed(Phase0, Phase0A) - Phase0A, PhaseDiff);
                     end if;
                     if ((PhaseMag = '0') and (ReadCount < 30)) or ((PhaseMag = '1') and (ReadCount = 511)) then
                        PhaseOut <= resize(Phase0A, PhaseDiff);
                     end if;
                  else
                     if ((DiffMag = '0') and (ReadCount < 30)) or ((DiffMag = '1') and (ReadCount = 511)) then
                        PhaseDiff <= resize(to_sfixed(Phase1, Phase1A) - Phase1A, PhaseDiff);
                     end if;
                     if ((PhaseMag = '0') and (ReadCount < 30)) or ((PhaseMag = '1') and (ReadCount = 511)) then
                        PhaseOut <= resize(Phase1A, PhaseDiff);
                     end if;
                  end if;
               end if;
            else     -- if  phases rollover 180�...
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
            elsif (PilotPacket and ValidIn) then
               PilotCount <= PilotCount + 1;
            end if;

            -- now that estimates are done, start phase and sync routines
            if (NormDone) then
               SyncSum   <= (others=>'0');
               ReadCount <= (others=>'0');
               CalcPhase <= '1';
            elsif (ReadCount >= READ_START) and (ReadCount <= READ_STOP) and (NoMagWt = '1') then   -- skip the edges
               SyncError   <= resize(Abs(ReadR - ReadI), SyncError);
               SyncSum     <= resize(SyncSum + SyncError, SyncSum);
               ReadCount   <= ReadCount + 1;
               if (ReadCount = 506) then
                  PilotLocked <= '1' when SyncSum < 100 else '0';
               end if;
            elsif (ReadCount < 511) then
               ReadCount <= ReadCount + 1;
            elsif (ReadCount = 511) then  -- turn off Calcs and idle here
               CalcPhase <= NoMagWt;
               if (NoMagWt) then
                  ReadCount <= (others=>'0');   -- do next round with Mag weighted p0/1
               end if;
            end if;

            CalcPhaseDly <= CalcPhaseDly(2 downto 0) & CalcPhase;
         end if;
      end if;
   end process DoublePhaseProc;

   H0GtH1 <= '1' when (H0Mag > H1Mag) else '0';
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
         H0R_Dly0    <= H0R;
         H0I_Dly0    <= not(H0I);
         H1R_Dly0    <= H1R;
         H1I_Dly0    <= not(H1I);
         H0R_Dly1    <= H0R_Dly0;
         H0I_Dly1    <= H0I_Dly0;
         H1R_Dly1    <= H1R_Dly0;
         H1I_Dly1    <= H1I_Dly0;
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
         ReadR0Dly0  <= ReadR0;
         ReadI0Dly0  <= ReadI0;
         ReadR1Dly0  <= ReadR1;
         ReadI1Dly0  <= ReadI1;
         ReadR0Dly1  <= ReadR0Dly0;
         ReadI0Dly1  <= ReadI0Dly0;
         ReadR1Dly1  <= ReadR1Dly0;
         ReadI1Dly1  <= ReadI1Dly0;
      end if;
   end process H0H1Process;

   CmplxMultH0 : CmplxMult
      GENERIC MAP (
         IN_LEFT     => ReadR0Dly0'left,
         IN_RIGHT    => ReadR0Dly0'right,
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
         ReInA       => ReadR0Dly1,
         ImInA       => ReadI0Dly1,
         ReInB       => p0R,
         ImInB       => p0I,
         ReOut       => CmplxH0r,
         ImOut       => CmplxH0i,
         ValidOut    => CmplxValid,
         StartOut    => open
   );

   p0R <= H0R_Dly1 when NoMagWt else H0H1R;
   p0I <= H0I_Dly1 when NoMagWt else H0H1I;
   p1R <= H1R_Dly1 when NoMagWt else H0H1R;
   p1I <= H1I_Dly1 when NoMagWt else H0H1I;

   CmplxMultH1 : CmplxMult
      GENERIC MAP (
         IN_LEFT     => ReadR1Dly0'left,
         IN_RIGHT    => ReadR1Dly0'right,
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
         ReInA       => ReadR1Dly1,
         ImInA       => ReadI1Dly1,
         ReInB       => p1R,
         ImInB       => p1I,
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

end rtl;