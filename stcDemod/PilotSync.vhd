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

                               CLEANUP
 Determine Offset input value and set to constant
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
      PilotPulseIn,
      PilotFound,
      ValidIn        : IN STD_LOGIC;
      CorrPntr       : IN ufixed(15 DOWNTO 0);
      RealIn,
      ImagIn         : IN  Float_1_18;
      Offset         : IN  SLV4;       -- TODO, remove
      StartNextFrame : OUT ufixed(15 DOWNTO 0);
      RealOut,
      ImagOut        : OUT Float_1_18;
      StartOut,
      ValidOut       : OUT STD_LOGIC
   );
END PilotSync;

ARCHITECTURE rtl OF PilotSync IS


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
   CONSTANT MISSED_PILOT   : natural := 12;

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
   SIGNAL   RealOutSlv,
            ImagOutSlv           : SLV18;
   SIGNAL   PckSmplCount         : integer range 0 to 511;
   SIGNAL   Captured,
            PilotValid,
            Missed               : std_logic;
   signal   Offset_u             : ufixed(3 downto 0);

   attribute mark_debug : string;
   attribute mark_debug of FrmSmplCount, StartOut, PilotValid, PilotPulseIn,
              Missed, RdAddr : signal is "true";

BEGIN

   IlaProcess : process(clk)
   begin
      if (rising_edge(clk)) then
         Offset_u       <= ufixed(Offset);
      end if;
   end process IlaProcess;

   PilotValid  <= '1' when (PilotPulseIn = '1') and ((PilotFound = '0') or (FrmSmplCount > 12750) or (Missed = '1')) else '0'; -- pulse should be at 13312

   ClkProcess: process (clk)
   begin
      if (rising_edge(clk)) then
         if (reset) then
            WrAddr         <= (others=>'0');
            RdAddr         <= (others=>'0');
            StartNextFrame <= (others=>'0');
            CorrCntrCapture <= (others=>'0');
            FrmSmplCount    <= 0;
            PckSmplCount   <= 0;
            PacketCount    <= 0;
            Missed         <= '0';
            Captured       <= '0';
            StartOut       <= '0';
            ValidOut       <= '0';
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
               if ((Missed = '1') or (Captured = '1')) and (RamDepth > 512) then
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
                  Missed      <= '0';
                  if (Captured) then
                     RdAddr   <= CorrCntrCapture;
                  end if;
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
               StartNextFrame  <= resize(CorrPntr - 512 - 8 + FRAME_LENGTH_4, StartNextFrame); -- offset added in STC
               Captured        <= '1';
               FrmSmplCount <= 0;
            -- if we don't get a PilotValid for a frame, the RdAddr should continue but need a new Start sequence
            elsif (FrmSmplCount >= FRAME_LENGTH_4 + MISSED_PILOT + 512) then    -- maintain sync over missed pilots, should have gone off 12 samples and one packet ago
               FrmSmplCount <= FrmSmplCount - FRAME_LENGTH_4 + 1;
               Missed <= '1';
            elsif (ValidIn) then
               FrmSmplCount <= FrmSmplCount + 1;
            end if;

            if (ValidIn) then    -- capture the Packet data feeding the Pilot Detector
               WrAddr <= resize(WrAddr + 1, WrAddr);
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

END rtl;

