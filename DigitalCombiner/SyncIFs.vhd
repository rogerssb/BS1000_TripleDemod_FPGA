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

Module Name: SyncIFs.vhd
Description: Synchronize IFs
   The purpose of this module is to find the time offset in samples between
the Channel A IF and the Channel B IF. To do so, I'm using the recovered data
from the two demods and looking for a correlation peak over the last 128 bits.
This will give an effective range of 128/93.3MHz = 1371nS.
   Using the recovered data from the ChannelA and ChannelB demods, the data
is ported over to the Combiner along with the IF data. The last 128 bits of
each channel is stored in an array and compared with the incoming 128 bits
of each others data while counting matching bits to correlate the two channels
as they progress. The point being that if the data on CHA is ahead of the
data on ChB, then the delayed ChA data should eventually correlate with ChB
and vice versa.

Since the BPSK or QPSK data is ambiguous in polarity and order, I need to
compare both equal counts and not equal counts for polarity as well as
I1 vs I2, I1 vs Q2, Q1 vs I2 and Q1 vs Q2 for the order, then pick the largest.

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
USE work.Semco_pkg.ALL;

ENTITY SyncIFs IS
   PORT (
      Clk,
      Reset          : IN  std_logic;
      ChAData,
      ChBData        : IN  std_logic_vector(1 downto 0);
      ChAThenChB     : OUT std_logic;
      IndexOut       : OUT unsigned(6 downto 0)
   );
END SyncIFs;
/*
126   0     = -126
1     0     = -1
0     0     = 0
0     1     = 1
0     126   = 126
*/

ARCHITECTURE rtl OF SyncIFs IS

   type     mode_t         is (LOAD, SEARCHING, DONE);

   -- Signals

   signal   Mode           : mode_t := LOAD;
   signal   ChannelA,
            ChannelB,
            ChAHold,
            ChBHold        : std_logic_vector(127 downto 0);
   signal   CountChA,
            CountChB,
            MaxCountA,
            MaxIndexA,
            MaxCountB,
            MaxIndexB,
            Index          : natural range 0 to 128;
   signal   ChangeA,
            ChangeB        : std_logic;

BEGIN

   SearchProcess : process(Clk)
      variable CountChA_v,
               CountChB_v        : natural range 0 to 128;
   begin
      if (rising_edge(Clk)) then
         if (Reset) then
            Mode        <= LOAD;
            Index       <= 0;
            MaxIndexA   <= 0;
            MaxIndexB   <= 0;
            MaxCountA   <= 0;
            MaxCountB   <= 0;
            IndexOut    <= 7x'0';
            ChannelA    <= (others=>'0');
            ChannelB    <= (others=>'0');
            ChAHold     <= (others=>'0');
            ChBHold     <= (others=>'0');
         else
            ChannelA <= ChannelA(126 downto 0) & ChAData;   -- continuously copy the last 128 bits of each channel
            ChannelB <= ChannelB(126 downto 0) & ChBData;
            if (Mode = LOAD) then
               Mode        <= SEARCHING;
               Index       <= 0;
               MaxIndexA   <= 0;
               MaxIndexB   <= 0;
               MaxCountA   <= 0;
               MaxCountB   <= 0;
               ChangeA     <= '0';
               ChangeB     <= '0';
               ChAHold     <= ChannelA(126 downto 0) & ChAData;   -- store the last 128 bits to start a new correlation
               ChBHold     <= ChannelB(126 downto 0) & ChBData;
            elsif (Mode = SEARCHING) then
               if (ChannelA(0) /= ChAData) then
                  ChangeA     <= '1';
               end if;
               if (ChannelB(0) /= ChBData) then
                  ChangeB     <= '1';
               end if;
               CountChA_v  := 0;
               CountChB_v  := 0;
               for i in 0 to 127 loop
                  if (ChAHold(i) = ChannelB(i)) then
                     CountChA_v := CountChA_v + 1;
                  end if;
                  if (ChBHold(i) = ChannelA(i)) then
                     CountChB_v := CountChB_v + 1;
                  end if;
               end loop;
               CountChA <= CountChA_v;
               CountChB <= CountChB_v;
               if (Index < 127) then
                  if (CountChA_v > MaxCountA) then
                     MaxCountA <= CountChA_v;
                     MaxIndexA <= Index;
                  end if;
                  if (CountChB_v > MaxCountB) then
                     MaxCountB <= CountChB_v;
                     MaxIndexB <= Index;
                  end if;
                  Index <= Index + 1;
               elsif (ChangeA and ChangeB) then
                  if (MaxCountA > MaxCountB) then
                     IndexOut    <= to_unsigned(MaxIndexA, IndexOut'length);
                     ChAThenChB  <= '1';
                  else
                     IndexOut <= to_unsigned(MaxIndexB, IndexOut'length);
                     ChAThenChB  <= '0';
                  end if;
                  Mode  <= LOAD;
                  Index <= 0;
               end if;
            end if;
         end if;
      end if;
   end process SearchProcess;

END rtl;

