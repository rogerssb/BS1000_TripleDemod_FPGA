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
      PilotPulseIn,
      ValidIn        : IN STD_LOGIC;
      Variables      : IN  RecordType;   -- for resampler and PilotDetect
      IndexIn        : IN ufixed(10 DOWNTO 0);
      RealIn,
      ImagIn         : IN  Float_1_18;
      RealOut,
      ImagOut        : OUT Float_1_18;
      StartOut,
      ValidOut,
      PilotLocked    : OUT STD_LOGIC
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

   CONSTANT ADDR_BITS      : integer := 13;

   -- Signals
   SIGNAL   WrAddr,
            RdAddr,
            IndexOut             : ufixed(ADDR_BITS-1 downto 0);
   SIGNAL   WrAddr_i,
            PacketCount_i,
            WaitCount_i,
            RdAddr_i             : integer range 0 to 2**ADDR_BITS-1;
   SIGNAL   SampleCount          : natural range 0 to 16383;
   SIGNAL   ReadCount,
            InvRdCount,
            PilotCount           : unsigned (8 downto 0);
   SIGNAL   RealOutSlv,
            ImagOutSlv,
            PilotCaptureR_slv,
            PilotCaptureI_slv    : SLV18;
   SIGNAL   StartNext,
            Clock256,
            PilotValid,
            PilotPacket          : std_logic;
   SIGNAL   ReadR,
            ReadI                : FLOAT_1_18;
   SIGNAL   SyncError            : sfixed(1 downto -16);
   SIGNAL   SyncSum              : sfixed(10 downto -16);

   signal   SyncSumIla           : sfixed(10 downto 0);
   signal   ReadR_Ila, ReadI_Ila : sfixed(17 downto 0);

   attribute mark_debug : string;
   attribute mark_debug of SampleCount, StartOut, SyncSumIla, ReadR_Ila, ReadI_Ila, IndexOut : signal is "true";

BEGIN

   IlaProcess : process(clk)
   begin
      if (rising_edge(clk)) then
         SyncSumIla   <= SyncSum(10 downto 0);
         ReadR_Ila    <= ReadR;
         ReadI_Ila    <= ReadI;
      end if;
   end process IlaProcess;

   Clock256    <= '1' when (PacketCount_i = 256) else '0';
   PilotValid  <= PilotPulseIn; -- TODO '1' when (PilotPulseIn = '1') and (SampleCount > 13300) else '0'; -- pulse should be at 13312

   ClkProcess: process (clk)
   begin
      if (rising_edge(clk)) then
         if (reset) then
            WrAddr         <= (others=>'0');
            RdAddr         <= (others=>'0');
            SyncSum        <= (others=>'0');
            SyncError      <= (others=>'0');
            ReadCount      <= (others=>'0');
            PilotCount     <= (others=>'0');
            IndexOut       <= to_ufixed(0, IndexOut);    -- was 290
            WaitCount_i    <= 0;
            SampleCount    <= 0;
            PacketCount_i  <= 512;
            StartNext      <= '0';
            PilotPacket    <= '0';
            PilotLocked    <= '0';
         elsif ce = '1' then
            ValidOut <= ValidIn;

            if (PilotValid) then -- validated pilot with distance between frames
               IndexOut <= resize(IndexIn, IndexOut);
            --   RdAddr   <= resize(WrAddr - PacketCount_i, RdAddr);   -- if synchronized, should be going to same value either way
            elsif (ValidIn) then
               RdAddr <= resize(RdAddr + 1, RdAddr);
            else
               RdAddr <= WrAddr; -- Start at beginning of this packet
            end if;

            if (ValidIn) then
               WrAddr <= resize(WrAddr + 1, WrAddr);
            end if;

            if (PilotValid) then
               SampleCount <= 0;
            elsif (SampleCount > 13324) then    -- maintain sync over missed pilots, should have gone off 12 samples ago
               SampleCount <= 12;
            elsif (ValidIn) then
               SampleCount <= SampleCount + 1;
            end if;

            if (PilotValid = '1') or (SampleCount = 13324) then   -- request a start pulse between packets
               StartNext <= '1';                                  -- even if this frame didn't find a pilot
            elsif (WaitCount_i = 32) and (StartNext = '1') then   -- setting StartNext timing is not critical
               StartNext <= '0';
               StartOut  <= '1';
            else
               StartOut <= '0';
            end if;

            if (ValidIn) then
               if (PacketCount_i = 1) then
                  PacketCount_i <= 512;
               else
                  PacketCount_i  <= PacketCount_i - 1;
               end if;
            end if;

            if (WaitCount_i > 0) then
               WaitCount_i <= WaitCount_i - 1;
            elsif (PacketCount_i = 1) then
               WaitCount_i <= 61;   -- minimum dead time at 40Mbps
            end if;

         if (StartOut) then
            PilotPacket <= '1';
            PilotCount <= (others=>'0');
         elsif (PilotCount = 511) then
            PilotPacket <= '0';
            ReadCount <= to_unsigned(509, ReadCount);
            SyncSum <= (others=>'0');
         end if;
         if (PilotPacket) then
            if (ValidOut) then
               PilotCount <= PilotCount + 1;
             end if;
         elsif (ReadCount > 0) then
            SyncError   <= resize(Abs(ReadR - ReadI), SyncError);
            SyncSum     <= resize(SyncSum + SyncError, SyncSum);
            ReadCount   <= ReadCount - 1;
            if (ReadCount = 1) then
               PilotLocked <= '1' when SyncSum < 10 else '0';
            end if;
         end if;

         end if;
      end if;
   end process ClkProcess;

   WrAddr_i <= to_integer(WrAddr);
   RdAddr_i <= to_integer(resize(RdAddr - Variables.PilotSyncOffset + IndexOut, RdAddr));

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
         WrEn        => ValidOut,
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
         WrEn        => ValidOut,
         WrAddr      => to_integer(PilotCount),
         RdAddrA     => 0,
         RdAddrB     => to_integer(InvRdCount),
         WrData      => ImagOutSlv,
         RdOutA      => open,
         RdOutB      => PilotCaptureI_slv
      );

   InvRdCount  <= 510 - ReadCount;
   ReadR       <= to_sfixed(PilotCaptureR_slv, ReadR);
   ReadI       <= to_sfixed(PilotCaptureI_slv, ReadI);

END rtl;

