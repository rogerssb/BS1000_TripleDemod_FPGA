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

Module Name: WhiteNoise.vhd
Description:

   An Linear Feedback Shift Register (LFSR) is used to generate a psuedo-
random sequence that repeats at 2^Len - 1 clocks, where Len is the length
of the LFSR.
   If you take the LFSR as a parallel word they're also a random waveform
of 2^Len - 1 pattern length. The parallel words will consists of every value
from 1 to 2^Len-1 except zero.
   If you look at the spectrum of the pattern it has spikes spaced at
Fs/(2^Len) * n, where n = 1 to 2^Len. This makes a noise source that's
somewhat bell shaped. To flatten it out, add more LFSRs are varying lengths
which pushes the lowest frequency toward DC due to the larger length LFSR.
Adding 8 LFSR's with lengths from 10 to 17 bits gives a fairly smooth noise
source that tracks the data rate of the signal being purtabated.
   Having multiple LFSR also increases the repeat distance since they
effectively multiply their lengths.
   The poly is calculated by taking the typical maximal length tap values
for each LFSR and converting them into a binary string. Note tap tables
or equations are one based such that 4:1 is the least significant nibble, so
to using this graphic :
   24 23 22 21  20 19 18 17   16 15 14 13  12 11 10 9   8 7 6 5  4 3 2 1
set the taps values to '1' then pack the bits into a 24 bit hex number.
For instance, LFSR12 has taps of 12, 6, 4 and 1. So the binary string
would be 0000 0000 0000 1000 0010 1001 or 0x829

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
use work.fixed_pkg.all;
USE work.Semco_pkg.ALL;

ENTITY WhiteNoise IS
   PORT(
      clk,
      reset,
      ce             : IN  std_logic;
      Seed           : IN  SLV24;
      Noise          : OUT sfixed(3 downto -16)
   );
END WhiteNoise;

ARCHITECTURE rtl OF WhiteNoise IS

   COMPONENT bert_lfsr
      PORT (
         clock         : in  std_logic;
         reset         : in  std_logic;
         enable        : in  std_logic;
         reload        : in  std_logic;
         poly          : in  std_logic_vector(23 downto 0);
         poly_length   : in  std_logic_vector(4  downto 0);
         load_data     : in  std_logic_vector(23 downto 0);
         data          : out std_logic_vector(23 downto 0);
         serial        : out std_logic
      );
   END COMPONENT BERT_LFSR;

   CONSTANT SRRC        : sfixed(0 downto -15) := to_sfixed(0.35 / 0.57, 0, -15);
  -- Signals
   SIGNAL   PRN10,
            PRN11,
            PRN12,
            PRN13,
            PRN14,
            PRN15,
            PRN16,
            PRN17       : std_logic_vector(23 downto 0);
   SIGNAL   SFix10      : sfixed(0 downto -9);
   SIGNAL   SFix11      : sfixed(0 downto -10);
   SIGNAL   SFix12      : sfixed(0 downto -11);
   SIGNAL   SFix13      : sfixed(0 downto -12);
   SIGNAL   SFix14      : sfixed(0 downto -13);
   SIGNAL   SFix15      : sfixed(0 downto -14);
   SIGNAL   SFix16      : sfixed(0 downto -15);
   SIGNAL   SFix17      : sfixed(0 downto -16);
   SIGNAL   SumPrnA,
            SumPrnB,
            SumPrnC,
            SumPrnD,
            SumPrnAB,
            SumPrnCD,
            SumPrn     : sfixed(3 downto -16);
  SIGNAL    NoisePipe  : sfixed(4 downto -31);

BEGIN

  SFix10 <= to_sfixed(PRN10( 9 downto 0), SFix10);
  SFix11 <= to_sfixed(PRN11(10 downto 0), SFix11);
  SFix12 <= to_sfixed(PRN12(11 downto 0), SFix12);
  SFix13 <= to_sfixed(PRN13(12 downto 0), SFix13);
  SFix14 <= to_sfixed(PRN14(13 downto 0), SFix14);
  SFix15 <= to_sfixed(PRN15(14 downto 0), SFix15);
  SFix16 <= to_sfixed(PRN16(15 downto 0), SFix16);
  SFix17 <= to_sfixed(PRN17(16 downto 0), SFix17);

  Noise_process: process (clk)
   begin
      if (rising_edge(clk)) then
         if (reset) then
            Noise       <= (others=>'0');
         else
            SumPrnA     <= resize(SFix10 + SFix11, SumPrnA, fixed_wrap, fixed_truncate);
            SumPrnB     <= resize(SFix12 + SFix13, SumPrnB, fixed_wrap, fixed_truncate);
            SumPrnC     <= resize(SFix14 + SFix15, SumPrnC, fixed_wrap, fixed_truncate);
            SumPrnD     <= resize(SFix16 + SFix17, SumPrnD, fixed_wrap, fixed_truncate);
            SumPrnAB    <= resize(SumPrnA + SumPrnB, SumPrnAB, fixed_wrap, fixed_truncate);
            SumPrnCD    <= resize(SumPrnC + SumPrnD, SumPrnCD, fixed_wrap, fixed_truncate);
            SumPrn      <= resize(SumPrnAB + SumPrnCD, SumPrn, fixed_wrap, fixed_truncate);
            NoisePipe   <= SumPrn * SRRC; -- Normalize noise amplitude to SRRCd PRN stream of ±1
            Noise       <= resize(NoisePipe, Noise);
         end if;
      end if;
   end process Noise_process;

   LFSR10 : bert_lfsr
      PORT MAP(
         clock       => clk,
         reset       => reset,
         reload      => '0',
         enable      => ce,
         poly        => 24x"240",
         poly_length => 5x"0A",
         load_data   => Seed,
         data        => PRN10,
         serial      => open
   );

   LFSR11 : bert_lfsr
      PORT MAP(
         clock       => clk,
         reset       => reset,
         reload      => '0',
         enable      => ce,
         poly        => 24x"500",
         poly_length => 5x"0B",
         load_data   => Seed,
         data        => PRN11,
         serial      => open
   );

   LFSR12 : bert_lfsr
      PORT MAP(
         clock       => clk,
         reset       => reset,
         reload      => '0',
         enable      => ce,
         poly        => 24x"829",
         poly_length => 5x"0C",
         load_data   => Seed,
         data        => PRN12,
         serial      => open
   );

   LFSR13 : bert_lfsr
      PORT MAP(
         clock       => clk,
         reset       => reset,
         reload      => '0',
         enable      => ce,
         poly        => 24x"100D",
         poly_length => 5x"0D",
         load_data   => Seed,
         data        => PRN13,
         serial      => open
   );

   LFSR14 : bert_lfsr
      PORT MAP(
         clock       => clk,
         reset       => reset,
         reload      => '0',
         enable      => ce,
         poly        => 24x"2015",
         poly_length => 5x"0E",
         load_data   => Seed,
         data        => PRN14,
         serial      => open
   );

   LFSR15 : bert_lfsr
      PORT MAP(
         clock       => clk,
         reset       => reset,
         reload      => '0',
         enable      => ce,
         poly        => 24x"6000",
         poly_length => 5x"0f",
         load_data   => Seed,
         data        => PRN15,
         serial      => open
   );

   LFSR16 : bert_lfsr
      PORT MAP(
         clock       => clk,
         reset       => reset,
         reload      => '0',
         enable      => ce,
         poly        => 24x"d008",
         poly_length => 5x"10",
         load_data   => Seed,
         data        => PRN16,
         serial      => open
   );

   LFSR17 : bert_lfsr
      PORT MAP(
         clock       => clk,
         reset       => reset,
         reload      => '0',
         enable      => ce,
         poly        => 24x"12000",
         poly_length => 5x"11",
         load_data   => Seed,
         data        => PRN17,
         serial      => open
   );

END rtl;

