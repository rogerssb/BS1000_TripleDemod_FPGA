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

Module Name: PilotSync.vhd
Description: Waits for PilotPulseIn, then latches IndexIn. IndexIn derives an
offset of the data stream relative to the pilot position. Subtracting the IndexIn
from 4*512+512 gives the length of delay line needed between Resampler output and
Brik1 output due to process latency. The second 512 value allows the data packet following the StartOut
to contain the full 512 samples needed for FreqEst. The last 256 samples feed the
timing and channel estimates.
To reduce false Pilots, the PilotPulse is gated at between 13300 to 13324 of the
typical 13312 samples between frames.

To determine proper alignment with no Freq/Phase perturbations, the recovered
Real and Imag are captured and compared. The two pilot components are mirror
images of each other, so by reading back the Imag part backward we can sum the
difference between the two readings for an indication of proper lock. Also when
properly aligned, the Taus should go to zero.

ARGUMENTS :


Dependencies:

----------------------------------------------------------------------------
                               DETAILS
----------------------------------------------------------------------------
 the C code Taus are almost zero with an H phase that is constant over the run, not per variables

----------------------------------------------------------------------------
                               HISTORY
----------------------------------------------------------------------------
12-16-16 Initial release FZ
-------------------------------------------------------------
*/

LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
use work.fixed_pkg.all;
use work.Semco_pkg.ALL;

ENTITY PilotSync IS
   PORT(
      clk,
      reset,
      ce,
      DiffEn,
      PilotPulseIn,
      ValidIn        : IN STD_LOGIC;
      CorrPntr       : IN ufixed(15 DOWNTO 0);
      RealIn,
      ImagIn         : IN  Float_1_18;
      Offset         : IN  SLV4;
      PhaseOutA,
      PhaseOutB      : OUT SLV18;
      PhaseDiff,
      RealOut,
      ImagOut        : OUT Float_1_18;
      PhaseDiffEn,
      StartOut,
      ValidOut,
      PilotLocked    : OUT STD_LOGIC
   );
END PilotSync;

ARCHITECTURE rtl OF PilotSync IS

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
         FILENAME    : string    := "";      -- Filename is absolute for Vivado and Modelsim to find
         DATA_WIDTH  : positive  := 32;
         BINPT       : integer   := -20;      -- only needed for ROMs
         ADDR_WIDTH  : positive  := 9;
         FILE_IS_SLV : boolean   := false;    -- nonSLV files are not synthesizable
         LATENCY     : positive  := 1;
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

   CONSTANT ADDR_BITS      : integer := CorrPntr'length;
   type     ModeType is (Idle, SET_START, CLR_START, READ_LOOP);

  -- Signals
   SIGNAL   PacketMode           : ModeType;
   SIGNAL   RamDepth,
            WrAddr,
            RdAddr,
            CorrCntrCapture      : ufixed(CorrPntr'range);
   SIGNAL   WaitCount            : natural range 0 to 15;
   SIGNAL   PacketCount          : natural range 0 to 26;
   SIGNAL   FrmSmplCount         : natural range 0 to 16383;
   SIGNAL   WrAddr_i,
            RdAddr_i             : natural range 0 to 2**ADDR_BITS-1;
   SIGNAL   ReadCount,
            InvRdCount,
            PilotCount           :unsigned(8 downto 0);
   SIGNAL   RealOutSlv,
            ImagOutSlv,
            PilotCaptureR_slv,
            PilotCaptureI_slv,
            H0Rslv,
            H0Islv,
            H1Rslv,
            H1Islv               : SLV18;
   SIGNAL   CmplxValid,
            ValidOutDly,
            CordicStart,
            ValidCordic,
            Captured,
            PilotValid,
            PilotPacket          : std_logic;
   SIGNAL   ReadR,
            ReadI,
            H0R,
            H0I,
            H1R,
            H1I,
            ImagOutDly,
            RealOutDly,
            CmplxH0r,
            CmplxH0i,
            CmplxH1r,
            CmplxH1i             : FLOAT_1_18;
   SIGNAL   SyncError            : sfixed(1 downto -16);
   SIGNAL   SyncSum              : sfixed(10 downto -16);
   SIGNAL   H0AccR,
            H0AccI,
            H1AccR,
            H1AccI               : sfixed(5 downto -17);
   SIGNAL   H0SumRA,
            H0SumIA,
            H1SumRA,
            H1SumIA,
            H0SumRB,
            H0SumIB,
            H1SumRB,
            H1SumIB,
            CordicR0,
            CordicI0,
            CordicR1,
            CordicI1             : sfixed(5 downto -12);
   SIGNAL   Mag0,
            Mag1                 : std_logic_vector(12 downto 0);
   SIGNAL   Phase0,
            Phase1               : std_logic_vector(11 downto 0);
   SIGNAL   Phase0A,
            Phase0B,
            Phase1A,
            Phase1B              : sfixed(0 downto -Phase0'length+1);
   SIGNAL   CmplxCount,
            PckSmplCount         : integer range 0 to 511;

   signal   SyncSumIla           : sfixed(10 downto 0);
   signal   ReadR_Ila, ReadI_Ila : sfixed(17 downto 0);
   signal   Offset_u             : ufixed(3 downto 0);

   attribute mark_debug : string;
   attribute mark_debug of FrmSmplCount, StartOut, SyncSumIla, ReadR_Ila, ReadI_Ila, CorrCntrCapture,
               Phase0A, Phase0B, PhaseDiff : signal is "true";

BEGIN

   IlaProcess : process(clk)
   begin
      if (rising_edge(clk)) then
         SyncSumIla   <= SyncSum(10 downto 0);
         ReadR_Ila    <= ReadR;
         ReadI_Ila    <= ReadI;
         Offset_u     <= ufixed(Offset);
      end if;
   end process IlaProcess;

   PilotValid  <= PilotPulseIn; -- TODO '1' when (PilotPulseIn = '1') and (FrmSmplCount > 13300) else '0'; -- pulse should be at 13312

   PhaseOutA <= to_slv(resize(Phase0A, 0, -17));
   PhaseOutB <= to_slv(resize(Phase0B, 0, -17));

   ClkProcess: process (clk)
   begin
      if (rising_edge(clk)) then
         if (reset) then
            WrAddr         <= (others=>'0');
            RdAddr         <= (others=>'0');
            SyncSum        <= (others=>'0');
            SyncError      <= (others=>'0');
            CorrCntrCapture <= (others=>'0');
            ReadCount      <= (others=>'0');
            PilotCount     <= (others=>'0');
            PhaseDiff      <= (others=>'0');
            PhaseDiffEn    <= '0';
            FrmSmplCount    <= 0;
            PckSmplCount   <= 0;
            PacketCount    <= 0;
            Captured       <= '0';
            StartOut       <= '0';
            ValidOut       <= '0';
            PilotPacket    <= '0';
            PilotLocked    <= '0';
         elsif (ce) then
            /*
               wait for PilotPulseIn and capture CorrPntr. set active flag.
               wait for WrAddr > CorrPntr + 512 for first packet
               Set StartOut, Set RdAddr to CorrPntrCapture
               Wait two clock
               Set ValidOut,
               Inc RdAddr
               Do 512 samples,
               Clr ValidOut, Inc PacketCntr
               Wait or WrAddr > RdAddr + 512 for next packer
               if (PacketCntr < 26) goto Wait Two Clocks
               else
               Clr PacketCntr
               Goto Wait for PilotPulseIn.
            */
            RamDepth <= resize(WrAddr - RdAddr, RamDepth);
            case (PacketMode) is
            when IDLE =>
               if (Captured = '1') and (RamDepth > 512) then
                  PacketMode  <= SET_START;
                  PacketCount <= 0;
                  WaitCount   <= 10;      -- keep start pulse away from valid data before or after
               end if;
            when SET_START =>
               if (WaitCount > 0) then
                  WaitCount <= WaitCount - 1;
               else
                  StartOut    <= '1';
                  WaitCount   <= 10;
                  Captured    <= '0';
                  RdAddr      <= CorrCntrCapture;
                  PacketMode  <= CLR_START;
               end if;
            when CLR_START =>
               StartOut <= '0';
               if (WaitCount > 0) then
                  WaitCount <= WaitCount - 1;
               else
                  ValidOut    <= '1';
                  RdAddr      <= resize(RdAddr + 1, RdAddr);
                  PckSmplCount <= 0;
                  PacketMode  <= READ_LOOP;
               end if;
            when READ_LOOP =>
               if (PckSmplCount < 511) then
                  PckSmplCount <= PckSmplCount + 1;
                  RdAddr      <= resize(RdAddr + 1, RdAddr);
               else
                  ValidOut <= '0';
                  if (PacketCount < 26) then
                     if (ValidOut) then
                        PacketCount <= PacketCount + 1;
                     end if;
                     if (RamDepth > 512) then
                        WaitCount  <= 2;
                        PacketMode <= CLR_START;
                     end if;
                  else
                     PacketMode <= IDLE;  -- wait for next packet start. could already exist
                  end if;
               end if;
            when others =>
               PacketMode <= IDLE;
            end case;

            if (PilotValid) then -- validated pilot with distance between frames
               CorrCntrCapture <= resize(CorrPntr - 512 + Offset_u - 8, CorrCntrCapture);
               Captured <= '1';
            end if;

            if (ValidIn) then    -- capture the Packet data feeding the Pilot Detector
               WrAddr <= resize(WrAddr + 1, WrAddr);
            end if;

            if (PilotValid) then    -- if we don't get a PilotValid for a frame, the RdAddr will lose
               FrmSmplCount <= 0;
            elsif (FrmSmplCount > 13336) then    -- maintain sync over missed pilots, should have gone off 12 samples ago
               FrmSmplCount <= 24;
               Captured <= '1';
            elsif (ValidIn) then
               FrmSmplCount <= FrmSmplCount + 1;
            end if;


            if (StartOut) then
               PilotPacket <= '1';
               PilotCount  <= (others=>'0');
            elsif (PilotCount = 511) then
               PilotPacket <= '0';
               ReadCount <= to_unsigned(6, ReadCount'length);
               SyncSum <= (others=>'0');
            end if;
            if (PilotPacket) then
               if (ValidOut) then
                  PilotCount <= PilotCount + 1;
                end if;
            end if;
            if (ReadCount >= 6) and (ReadCount < 507) then   -- skip the edges
               SyncError   <= resize(Abs(ReadR - ReadI), SyncError);
               SyncSum     <= resize(SyncSum + SyncError, SyncSum);
               ReadCount   <= ReadCount + 1;
               if (ReadCount = 506) then
                  PilotLocked <= '1' when SyncSum < 100 else '0';
               end if;
            end if;

            ImagOutDly  <= ImagOut;
            RealOutDly  <= RealOut;
            ValidOutDly <= ValidOut;
            if (StartOut) then
               CmplxCount  <= 0;
               H0AccR      <= (others=>'0');    -- setup for first half
               H0AccI      <= (others=>'0');
               H1AccR      <= (others=>'0');
               H1AccI      <= (others=>'0');
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
               else
                  CmplxCount <= CmplxCount + 1;          -- accumulate over pilot
                  CordicStart <= '0';
                  H0AccR <= resize(H0AccR + CmplxH0r, H0AccR);
                  H0AccI <= resize(H0AccI + CmplxH0i, H0AccR);
                  H1AccR <= resize(H1AccR + CmplxH1r, H0AccR);
                  H1AccI <= resize(H1AccI + CmplxH1i, H0AccR);
               end if;
            elsif (CmplxCount = 511) then
               H0SumRB <= resize(H0AccR + CmplxH0r, H0SumRB);  -- store second half
               H0SumIB <= resize(H0AccI + CmplxH0i, H0SumIB);
               H1SumRB <= resize(H1AccR + CmplxH1r, H1SumRB);
               H1SumIB <= resize(H1AccI + CmplxH1i, H1SumIB);
               CordicStart <= '1';
               CmplxCount <= 0;
            else
               CordicStart <= '0';
            end if;

            if (ValidCordic) then
               if (CmplxCount > 0) then
                  Phase0A <= to_sfixed(Phase0, Phase0A);
                  Phase1A <= to_sfixed(Phase1, Phase0A);
               else     -- process is done and count is reset to 0
                  Phase0B <= to_sfixed(Phase0, Phase0A);
                  Phase1B <= to_sfixed(Phase1, Phase0A);
                  if (DiffEn) then
                     if (Mag0 > Mag1) then
                        PhaseDiff <= resize(to_sfixed(Phase0, Phase0A) - Phase0A, PhaseDiff);
                     else
                        PhaseDiff <= resize(to_sfixed(Phase1, Phase0A) - Phase1A, PhaseDiff);
                     end if;
                  else
                     PhaseDiff <= resize(Phase0A, PhaseDiff);
                  end if;
                  PhaseDiffEn <= '1';
               end if;
            else
               PhaseDiffEn <= '0';
            end if;

         end if;
      end if;
   end process ClkProcess;

   WrAddr_i <= to_integer(WrAddr);
   RdAddr_i <= to_integer(RdAddr);

   PilotSync_r_u : RAM_2Reads_1Write
      GENERIC MAP(
         FILENAME    => "",
         DATA_WIDTH  => 18,
         ADDR_WIDTH  => ADDR_BITS,
         LATENCY     => 1
      )
      PORT MAP(
         clk         => clk,
         ce          => ce,
         reset       => reset,
         WrEn        => ValidIn,
         WrAddr      => WrAddr_i,
         RdAddrA     => 0,
         RdAddrB     => RdAddr_i,
         WrData      => to_slv(RealIn),
         RdOutA      => open,
         RdOutB      => RealOutSlv
      );

   PilotSync_i_u : RAM_2Reads_1Write
      GENERIC MAP(
         FILENAME    => "",
         DATA_WIDTH  => 18,
         ADDR_WIDTH  => ADDR_BITS,
         LATENCY     => 1
      )
      PORT MAP(
         clk         => clk,
         ce          => ce,
         reset       => reset,
         WrEn        => ValidIn,
         WrAddr      => WrAddr_i,
         RdAddrA     => 0,
         RdAddrB     => RdAddr_i,
         WrData      => to_slv(ImagIn),
         RdOutA      => open,
         RdOutB      => ImagOutSlv
      );

   RealOut <= to_sfixed(RealOutSlv, RealOut);
   ImagOut <= to_sfixed(ImagOutSlv, ImagOut);

   PilotCapture_r_u : RAM_2Reads_1Write
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
         WrEn        => PilotPacket,
         WrAddr      => to_integer(PilotCount),
         RdAddrA     => 0,
         RdAddrB     => to_integer(ReadCount),
         WrData      => RealOutSlv,
         RdOutA      => open,
         RdOutB      => PilotCaptureR_slv
      );

   PilotCapture_i_u : RAM_2Reads_1Write
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
         WrEn        => PilotPacket,
         WrAddr      => to_integer(PilotCount),
         RdAddrA     => 0,
         RdAddrB     => to_integer(InvRdCount),
         WrData      => ImagOutSlv,
         RdOutA      => open,
         RdOutB      => PilotCaptureI_slv
      );

   InvRdCount  <= 507 - ReadCount;
   ReadR       <= to_sfixed(PilotCaptureR_slv, ReadR);
   ReadI       <= to_sfixed(PilotCaptureI_slv, ReadI);

   CmplxMultH0 : CmplxMult
      GENERIC MAP (
         IN_LEFT     => RealOut'left,
         IN_RIGHT    => RealOut'right,
         OUT_LEFT    => RealOut'left,
         OUT_BINPT   => RealOut'right
      )
      PORT MAP (
         clk         => clk,
         reset       => reset,
         ce          => ce,
         ValidIn     => PilotPacket and ValidOutDly,
         StartIn     => '0',
         ReadyIn     => '1',
         ReInA       => RealOutDly,
         ImInA       => ImagOutDly,
         ReInB       => H0R,
         ImInB       => H0I,
         ReOut       => CmplxH0r,
         ImOut       => CmplxH0i,
         ValidOut    => CmplxValid,
         StartOut    => open
   );

   CmplxMultH1 : CmplxMult
      GENERIC MAP (
         IN_LEFT     => RealOut'left,
         IN_RIGHT    => RealOut'right,
         OUT_LEFT    => RealOut'left,
         OUT_BINPT   => RealOut'right
      )
      PORT MAP (
         clk         => clk,
         reset       => reset,
         ce          => ce,
         ValidIn     => PilotPacket and ValidOutDly,
         StartIn     => '0',
         ReadyIn     => '1',
         ReInA       => RealOutDly,
         ImInA       => ImagOutDly,
         ReInB       => H1R,
         ImInB       => H1I,
         ReOut       => CmplxH1r,
         ImOut       => CmplxH1i,
         ValidOut    => open,
         StartOut    => open
   );

   H0r_u : RAM_2Reads_1Write
      GENERIC MAP(
         FILENAME    => "C:\Semco\Vivado\Demods\stcDemod\sourceData\p0_r_pt17.slv",
         DATA_WIDTH  => H0r'length,
         BINPT       => H0r'right,
         ADDR_WIDTH  => 9,
         FILE_IS_SLV => true,
         LATENCY     => 1,
         RAM_TYPE    => "block"
      )
      PORT MAP(
         clk         => Clk,
         ce          => ce,
         reset       => reset,
         WrEn        => '0',
         WrAddr      => 0,
         RdAddrA     => to_integer(PilotCount),
         RdAddrB     => 0,
         WrData      => (others=>'0'),
         RdOutA      => H0Rslv,
         RdOutB      => open
      );

   H0i_u : RAM_2Reads_1Write
      GENERIC MAP(
         FILENAME    => "C:\Semco\Vivado\Demods\stcDemod\sourceData\p0_i_pt17.slv",
         DATA_WIDTH  => H0r'length,
         BINPT       => H0r'right,
         ADDR_WIDTH  => 9,
         FILE_IS_SLV => true,
         LATENCY     => 1,
         RAM_TYPE    => "block"
      )
      PORT MAP(
         clk         => Clk,
         ce          => ce,
         reset       => reset,
         WrEn        => '0',
         WrAddr      => 0,
         RdAddrA     => to_integer(PilotCount),
         RdAddrB     => 0,
         WrData      => (others=>'0'),
         RdOutA      => H0Islv,
         RdOutB      => open
      );

   H1r_u : RAM_2Reads_1Write
      GENERIC MAP(
         FILENAME    => "C:\Semco\Vivado\Demods\stcDemod\sourceData\p1_r_pt17.slv",
         DATA_WIDTH  => H0r'length,
         BINPT       => H0r'right,
         ADDR_WIDTH  => 9,
         FILE_IS_SLV => true,
         LATENCY     => 1,
         RAM_TYPE    => "block"
      )
      PORT MAP(
         clk         => Clk,
         ce          => ce,
         reset       => reset,
         WrEn        => '0',
         WrAddr      => 0,
         RdAddrA     => to_integer(PilotCount),
         RdAddrB     => 0,
         WrData      => (others=>'0'),
         RdOutA      => H1Rslv,
         RdOutB      => open
      );

   H1i_u : RAM_2Reads_1Write
      GENERIC MAP(
         FILENAME    => "C:\Semco\Vivado\Demods\stcDemod\sourceData\p1_i_pt17.slv",
         DATA_WIDTH  => H0r'length,
         BINPT       => H0r'right,
         ADDR_WIDTH  => 9,
         FILE_IS_SLV => true,
         LATENCY     => 1,
         RAM_TYPE    => "block"
      )
      PORT MAP(
         clk         => Clk,
         ce          => ce,
         reset       => reset,
         WrEn        => '0',
         WrAddr      => 0,
         RdAddrA     => to_integer(PilotCount),
         RdAddrB     => 0,
         WrData      => (others=>'0'),
         RdOutA      => H1Islv,
         RdOutB      => open
      );

   H0R      <= to_sfixed(H0Rslv, H0R);
   H0I      <= to_sfixed(H0Islv, H0I);
   H1R      <= to_sfixed(H1Rslv, H1R);
   H1I      <= to_sfixed(H1Islv, H1I);
   CordicR0 <= H0SumRA when (CmplxCount > 0) else H0SumRB;
   CordicI0 <= H0SumIA when (CmplxCount > 0) else H0SumIB;
   CordicR1 <= H1SumRA when (CmplxCount > 0) else H1SumRB;
   CordicI1 <= H1SumIA when (CmplxCount > 0) else H1SumIB;

   cordic0 : vm_cordic_fast
      GENERIC MAP (
         n => 14
      )
      PORT MAP (
         clk   => Clk,
         ena   => CordicStart,
         x     => to_slv(CordicR0(5 downto -8)),
         y     => to_slv(CordicI0(5 downto -8)),
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
         x     => to_slv(CordicR1(5 downto -8)),
         y     => to_slv(CordicI1(5 downto -8)),
         m     => Mag1,          -- m[n:2]
         p     => Phase1,
         enOut => open
      );

END rtl;

