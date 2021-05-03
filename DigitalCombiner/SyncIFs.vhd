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
compare largest equal counts and smallest not equal counts for polarity. If a
only gets to 5 while the largest is 120, then they not equal more than equal, so
the 5 wins. I also need to cross count the two channel 1 and channel 2 inputs.
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
      IndexOut       : OUT uint8
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
   constant I : natural := 1;
   constant Q : natural := 0;
   constant ALL_ONES    : std_logic_vector(127 downto 0) := (others=>'1');
   constant ALL_ZEROS   : std_logic_vector(127 downto 0) := (others=>'0');

   -- Signals

   signal   Mode           : mode_t := LOAD;
   signal   ChannelAI,
            ChannelBI,
            ChannelAQ,
            ChannelBQ,
            ChAHoldI,
            ChBHoldI,
            ChAHoldQ,
            ChBHoldQ       : std_logic_vector(127 downto 0);
   signal   CountChAII,
            CountChBII,
            CountChAIQ,
            CountChBIQ,
            CountChAQI,
            CountChBQI,
            CountChAQQ,
            CountChBQQ,
            MaxCountA,
            MaxIndexA,
            MaxCountB,
            MaxIndexB,
            PrevIndex,
            Index          : natural range 0 to 128;
   signal   PolarityII,
            PolarityIQ,
            PolarityQI,
            PolarityQQ     : int8;
   signal   MaxFound       : std_logic;

   attribute MARK_DEBUG : string;
   attribute MARK_DEBUG of ChannelAI, ChannelBI, ChannelAQ, ChannelBQ,
      ChAHoldI, ChBHoldI, ChAHoldQ, ChBHoldQ, CountChAII, CountChBII, CountChAIQ, CountChBIQ,
      CountChAQI, CountChBQI, CountChAQQ, CountChBQQ, MaxCountA, MaxIndexA, MaxCountB, MaxIndexB,
      Index, PolarityII, PolarityIQ, PolarityQI, PolarityQQ : signal is "TRUE";

BEGIN

   SearchProcess : process(Clk)
      variable MaxCountChA_v,
               MinCountChA_v,
               MaxCountChB_v,
               MinCountChB_v,
               MaxCountChAI_v,
               MaxCountChAQ_v,
               MinCountChAI_v,
               MinCountChAQ_v,
               MaxCountChBI_v,
               MaxCountChBQ_v,
               MinCountChBI_v,
               MinCountChBQ_v,
               CountChAII_v,
               CountChBII_v,
               CountChAIQ_v,
               CountChBIQ_v,
               CountChAQI_v,
               CountChBQI_v,
               CountChAQQ_v,
               CountChBQQ_v      : natural range 0 to 128;
   begin
      if (rising_edge(Clk)) then
         if (Reset) then
            Mode        <= LOAD;
            Index       <= 0;
            PolarityII  <= x"00";
            PolarityIQ  <= x"00";
            PolarityQI  <= x"00";
            PolarityQQ  <= x"00";
            MaxIndexA   <= 0;
            MaxIndexB   <= 0;
            MaxCountA   <= 0;
            MaxCountB   <= 0;
            IndexOut    <= 8x"0";
            MaxFound    <= '0';
            ChannelAI   <= (others=>'0');
            ChannelBI   <= (others=>'0');
            ChannelAQ   <= (others=>'0');
            ChannelBQ   <= (others=>'0');
            ChAHoldI    <= (others=>'0');
            ChBHoldI    <= (others=>'0');
            ChAHoldQ    <= (others=>'0');
            ChBHoldQ    <= (others=>'0');
         else
            if (ChAData(I) = ChBData(I)) then
               if (PolarityII < 127) then
                  PolarityII <= PolarityII + 1;
               end if;
            elsif (PolarityII > -128) then
               PolarityII <= PolarityII - 1;
            end if;
            if (ChAData(I) = ChBData(Q)) then
               if (PolarityIQ < 127) then
                  PolarityIQ <= PolarityIQ + 1;
               end if;
            elsif (PolarityIQ > -128) then
               PolarityIQ <= PolarityIQ - 1;
            end if;
            if (ChAData(Q) = ChBData(I)) then
               if (PolarityQI < 127) then
                  PolarityQI <= PolarityQI + 1;
               end if;
            elsif (PolarityQI > -128) then
               PolarityQI <= PolarityQI - 1;
            end if;
            if (ChAData(Q) = ChBData(Q)) then
               if (PolarityQQ < 127) then
                  PolarityQQ <= PolarityQQ + 1;
               end if;
            elsif (PolarityQQ > -128) then
               PolarityQQ <= PolarityQQ - 1;
            end if;
            PrevIndex <= Index;
            ChannelAI <= ChannelAI(126 downto 0) & ChAData(I);   -- continuously copy the last 128 bits of each channel
            ChannelBI <= ChannelBI(126 downto 0) & ChBData(I);
            ChannelAQ <= ChannelAQ(126 downto 0) & ChAData(Q);
            ChannelBQ <= ChannelBQ(126 downto 0) & ChBData(Q);
            if (Mode = LOAD) then
               Mode        <= SEARCHING;
               Index       <= 0;
               MaxIndexA   <= 0;
               MaxIndexB   <= 0;
               MaxCountA   <= 0;
               MaxCountB   <= 0;
               CountChAII  <= 0;
               CountChBII  <= 0;
               CountChAIQ  <= 0;
               CountChBIQ  <= 0;
               CountChAQI  <= 0;
               CountChBQI  <= 0;
               CountChAQQ  <= 0;
               CountChBQQ  <= 0;
               ChAHoldI    <= ChannelAI(126 downto 0) & ChAData(I);   -- store the last 128 bits to start a new correlation
               ChBHoldI    <= ChannelBI(126 downto 0) & ChBData(I);
               ChAHoldQ    <= ChannelAQ(126 downto 0) & ChAData(Q);
               ChBHoldQ    <= ChannelBQ(126 downto 0) & ChBData(Q);
            elsif (Mode = SEARCHING) then
               CountChAII_v := 0;
               CountChBII_v := 0;
               CountChAIQ_v := 0;
               CountChBIQ_v := 0;
               CountChAQI_v := 0;
               CountChBQI_v := 0;
               CountChAQQ_v := 0;
               CountChBQQ_v := 0;
               for i in 0 to 127 loop
                  if (ChAHoldI(i) = (ChannelBI(i) xor PolarityII(7))) then
                     CountChAII_v := CountChAII_v + 1;
                  end if;
                  if (ChBHoldI(i) = (ChannelAI(i) xor PolarityII(7))) then
                     CountChBII_v := CountChBII_v + 1;
                  end if;

                  if (ChAHoldI(i) = (ChannelBQ(i) xor PolarityIQ(7))) then
                     CountChAIQ_v := CountChAIQ_v + 1;
                  end if;
                  if (ChBHoldI(i) = (ChannelAQ(i) xor PolarityQI(7))) then
                     CountChBIQ_v := CountChBIQ_v + 1;
                  end if;

                  if (ChAHoldQ(i) = (ChannelBI(i) xor PolarityQI(7))) then
                     CountChAQI_v := CountChAQI_v + 1;
                  end if;
                  if (ChBHoldQ(i) = (ChannelAI(i) xor PolarityIQ(7))) then
                     CountChBQI_v := CountChBQI_v + 1;
                  end if;

                  if (ChAHoldQ(i) = (ChannelBQ(i) xor PolarityQQ(7))) then
                     CountChAQQ_v := CountChAQQ_v + 1;
                  end if;
                  if (ChBHoldQ(i) = (ChannelAQ(i) xor PolarityQQ(7))) then
                     CountChBQQ_v := CountChBQQ_v + 1;
                  end if;
               end loop;
               CountChAII <= CountChAII_v;
               CountChBII <= CountChBII_v;
               CountChAIQ <= CountChAIQ_v;
               CountChBIQ <= CountChBIQ_v;
               CountChAQI <= CountChAQI_v;
               CountChBQI <= CountChBQI_v;
               CountChAQQ <= CountChAQQ_v;
               CountChBQQ <= CountChBQQ_v;
               if (Index < 127) then
                  if (not MaxFound) then
                     MaxCountChAI_v := CountChAIQ when (CountChAIQ > CountChAII) else CountChAII;
                     MaxCountChAQ_v := CountChAQI when (CountChAQI > CountChAQQ) else CountChAQQ;
                     MaxCountChA_v  := MaxCountChAI_v when (MaxCountChAI_v > MaxCountChAQ_v) else MaxCountChAQ_v;

                     if (MaxCountChA_v > MaxCountA) then
                        MaxCountA <= MaxCountChA_v;
                        MaxIndexA <= PrevIndex;
                     end if;

                     MaxCountChBI_v := CountChBIQ when (CountChBIQ > CountChBII) else CountChBII;
                     MaxCountChBQ_v := CountChBQI when (CountChBQI > CountChBQQ) else CountChBQQ;
                     MaxCountChB_v  := MaxCountChBI_v when (MaxCountChBI_v > MaxCountChBQ_v) else MaxCountChBQ_v;

                     if (MaxCountChB_v > MaxCountB) then
                        MaxCountB <= MaxCountChB_v;
                        MaxIndexB <= PrevIndex;
                     end if;
                  end if;
                  if ((MaxCountA = 128) or (MaxCountB = 128)) then
                     MaxFound <= '1';
                  end if;

                  Index <= Index + 1;
               else
                  if (MaxCountA > MaxCountB) then
                     if (not((ChAHoldI = ALL_ONES) or (ChAHoldI = ALL_ZEROS))) then
                        IndexOut    <= to_unsigned(MaxIndexA, IndexOut'length);
                        ChAThenChB  <= '1';
                     end if;
                  else
                     if (not((ChBHoldI = ALL_ONES) or (ChBHoldI = ALL_ZEROS))) then
                        IndexOut <= to_unsigned(MaxIndexB, IndexOut'length);
                        ChAThenChB  <= '0';
                     end if;
                  end if;
                  Mode  <= LOAD;
                  Index <= 0;
                  MaxFound <= '0';
               end if;
            end if;
         end if;
      end if;
   end process SearchProcess;

END rtl;

