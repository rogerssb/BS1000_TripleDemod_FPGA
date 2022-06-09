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

Module Name: RS_Interleave.vhd
Description: On reset and validIn pack data into a Cols x Rows array in 0 to Cols-1
   then 0 to Rows-1 order to be read out in 0 to Rows-1 by 0 to Cols-1 order
   when Pack is high to interleave the data. If Pack is low, then deinterleave
   by writing in Rows then Cols order.
   To allow reading while writing there will be two arrays to ping-pong.
   The maximum interleave Rows is set at 16

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

ENTITY RS_Interleave IS
      GENERIC(
         DATA_WIDTH     : positive := 8;
         MAX_COL_BITS   : positive := 8;
         MAX_ROW_BITS   : positive := 4
      );
   PORT(
      Clk,
      Reset,
      CE,
      ValidIn,       -- dataIn is valid
      SyncIn,        -- start of frame
      Pack           : IN  std_logic;     -- pack or unpack
      ColsSlv        : IN  std_logic_vector (MAX_COL_BITS - 1 downto 0);
      RowsSlv        : IN  std_logic_vector (MAX_ROW_BITS - 1 downto 0);
      DataIn         : IN  std_logic_vector(DATA_WIDTH-1 downto 0);
      SyncOut,
      LastOut,
      ValidOut       : OUT std_logic;     -- buffer is full and can be read
      DataOut        : OUT std_logic_vector(DATA_WIDTH-1 downto 0)
   );
END RS_Interleave;


ARCHITECTURE rtl OF RS_Interleave IS

   COMPONENT RAM_2Reads_1Write IS
      GENERIC(
         FILENAME    : string    := "";      -- Filename is absolute for Vivado and Modelsim to find
         DATA_WIDTH  : positive  := 32;
         BINPT       : integer   := -20;      -- only used to scale file readings. Watch the sign
         ADDR_WIDTH  : natural   := 9;
         FILE_IS_SLV : boolean   := false;    -- nonSLV files are not synthesizable, SLVs are 32 bit hex
         LATENCY     : positive  := 1;
         RAM_TYPE    : string    := "block"  -- or "distributed"
      );
      PORT(
         Clk,
         CE,
         Reset,
         WrEn           : IN  std_logic;
         WrAddr,
         RdAddrA,
         RdAddrB        : IN  natural range 0 to 2**ADDR_WIDTH-1;
         WrData         : In  std_logic_vector(DATA_WIDTH-1 DOWNTO 0);
         RdOutA,
         RdOutB         : OUT std_logic_vector(DATA_WIDTH-1 DOWNTO 0)
      );
   END COMPONENT RAM_2Reads_1Write;

   constant ADDR_WIDTH           : natural := MAX_COL_BITS + MAX_ROW_BITS;

   SIGNAL   ColsCntrRd,
            ColsCntrWr           : natural range 0 to 2**MAX_COL_BITS-1;
   signal   RowsCntrRd,
            RowsCntrWr           : natural range 0 to 2**MAX_ROW_BITS-1;
   signal   Ping,
            PingDly,
            ValidIn0,
            ValidIn1,
            WaitForSync          : std_logic;
   signal   Cols,
            ColsPrev             : unsigned(ColsSlv'range);
   signal   Rows,
            RowsPrev             : unsigned(RowsSlv'range);
   signal   DataOut0,
            DataOut1             : std_logic_vector(DATA_WIDTH-1 DOWNTO 0);
   signal   WrAddr,
            RdAddr               : natural range 0 to 2**ADDR_WIDTH - 1;

BEGIN

   Cols <= unsigned(ColsSlv);
   Rows <= unsigned(RowsSlv);

  RS_InterleaveProcess: process (Clk)
   begin
      if (rising_edge(Clk)) then
         PingDly     <= Ping;
         ValidOut    <= ValidIn;
         ColsPrev    <= Cols;
         RowsPrev    <= Rows;
         if ( (Reset = '1') or (Cols /= ColsPrev) or (Rows /= RowsPrev) ) then
            ColsCntrRd  <= 0;
            ColsCntrWr  <= 0;
            RowsCntrRd  <= 0;
            RowsCntrWr  <= 0;
            WaitForSync <= '1';
            LastOut     <= '1';
            Ping        <= '0';
            SyncOut     <= '1';  -- kickstart the RS Decoder
         else
            if (SyncIn) then
               WaitForSync <= '0';        -- should never get a Sync and Valid in same clock
               if (Pack) then
                  if (RowsCntrWr = Rows - 1) then  -- if Packing, sync is from RS encoder per codeblock
                     RowsCntrRd  <= 0;             -- ignore SyncIn until interleave depth reached
                     ColsCntrRd  <= 0;
                     SyncOut     <= '1';
                  end if;
                  ColsCntrWr <= 0;                 -- recenter interleaving with encoder, don't care what Row
               else
                  ColsCntrRd <= 0;        -- so all counters should roll back to zero before SyncIn.
                  RowsCntrRd <= 0;
                  ColsCntrWr <= 0;
                  RowsCntrWr <= 0;
               end if;
            else
               -- Write Routinescc
               if (CE and ValidIn and not WaitForSync) then      -- use ValidIn to enable the outputs since they're both the same rate
                                                                 -- buffer actions. read one while writing the other
                  if (Pack) then                         -- Count Cols by Rows
                     if (ColsCntrWr < Cols-1) then
                        ColsCntrWr <= ColsCntrWr + 1;
                     else
                        ColsCntrWr <= 0;
                        if (RowsCntrWr < Rows - 1) then
                           RowsCntrWr <= RowsCntrWr + 1;
                        else
                           RowsCntrWr <= 0;              -- buffer is full, ping and sync write counters
                           Ping <= not Ping;
                        end if;
                     end if;

                  else                                   -- unpack Write Routine, Count Rows by Cols
                     if (RowsCntrWr < Rows - 1) then
                        RowsCntrWr <= RowsCntrWr + 1;
                     else
                        RowsCntrWr <= 0;
                        if (ColsCntrWr < Cols-1) then
                           ColsCntrWr <= ColsCntrWr + 1;
                        else
                           ColsCntrWr <= 0;              -- buffer is full, ping and sync all counters
                           RowsCntrWr <= 0;
                           Ping <= not Ping;
                        end if;
                     end if;
                  end if;
               end if;

                  -- read routines
               if (Pack) then
                  if (SyncOut) then
                     SyncOut <= '0';
                  end if;

                  if (ValidIn) then
                     if (RowsCntrRd < Rows - 1) then
                        RowsCntrRd  <= RowsCntrRd + 1;
                     else
                        RowsCntrRd <= 0;
                        if (ColsCntrRd < Cols-1) then
                           ColsCntrRd  <= ColsCntrRd + 1;
                        else
                           ColsCntrRd <= 0;
                           LastOut <= '1';
                        end if;
                     end if;
                  else
                     LastOut <= '0';
                  end if;

               elsif (ValidIn) then     -- unpack read routine
                  if (ColsCntrRd < Cols - 1) then
                     ColsCntrRd  <= ColsCntrRd + 1;
                  else
                     LastOut    <= '1';
                     ColsCntrRd <= 0;
                     if (RowsCntrRd < Rows-1) then
                        RowsCntrRd  <= RowsCntrRd + 1;
                     else
                        RowsCntrRd  <= 0;
                     end if;
                  end if;
               else
                  SyncOut <= LastOut;
                  LastOut <= '0';
               end if;
            end if;
         end if;
      end if;
   end process RS_InterleaveProcess;


   DataOut <= DataOut1 when (PingDly) else DataOut0;
   WrAddr <= (RowsCntrWr * 256) + ColsCntrWr;
   RdAddr <= (RowsCntrRd * 256) + ColsCntrRd;
   ValidIn0 <= ValidIn and not WaitForSync and Ping;
   ValidIn1 <= ValidIn and not WaitForSync and not Ping;

   Buffer0 : RAM_2Reads_1Write
      GENERIC MAP (
         DATA_WIDTH  => DATA_WIDTH,
         ADDR_WIDTH  => ADDR_WIDTH
      )
      PORT MAP (
         Clk         => Clk,
         CE          => CE,
         Reset       => Reset,
         WrEn        => ValidIn0,
         WrAddr      => WrAddr,
         RdAddrA     => RdAddr,
         RdAddrB     => 0,
         WrData      => DataIn,
         RdOutA      => DataOut0,
         RdOutB      => open
      );

   Buffer1 : RAM_2Reads_1Write
      GENERIC MAP (
         DATA_WIDTH  => DATA_WIDTH,
         ADDR_WIDTH  => ADDR_WIDTH
      )
      PORT MAP (
         Clk         => Clk,
         CE          => CE,
         Reset       => Reset,
         WrEn        => ValidIn1,
         WrAddr      => WrAddr,
         RdAddrA     => RdAddr,
         RdAddrB     => 0,
         WrData      => DataIn,
         RdOutA      => DataOut1,
         RdOutB      => open
      );

END rtl;

