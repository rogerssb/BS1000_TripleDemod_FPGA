
/******************************************************************************
                            Fast AGC for Combiner input Channels
******************************************************************************/


LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
use work.fixed_pkg.all;
USE work.Semco_pkg.ALL;

entity combinerFastAgc is
   PORT (
      clk, ce,
      reset,
      cs,
      busClk,
      wr0,wr1,wr2,wr3             : IN  std_logic;
      addr                        : IN  std_logic_vector(12 downto 0);
      din                         : IN  SLV32;
      dout                        : OUT SLV32;
      i_in0, q_in0,i_in1, q_in1   : IN  SLV18;
      agcIn0, agcIn1              : IN  std_logic_vector(11 downto 0);
      i_out0,q_out0,i_out1,q_out1 : OUT SLV18;
      agcOut0, agcOut1            : OUT std_logic_vector(11 downto 0)
    );
END combinerFastAgc;


architecture rtl of combinerFastAgc is


   COMPONENT combVarGain
      port (
         clk,
         clkEn          : IN  std_logic;
         exponent       : IN  std_logic_vector(4 downto 0);
         mantissa       : IN  SLV16;
         din            : IN  std_logic_vector(47 downto 0);
         dout           : OUT SLV18
      );
   END COMPONENT;

   COMPONENT combChannelAgc
      port (
         clk,
         reset, clkEn,
         cs, busClk,
         wr0,wr1,wr2,wr3   : IN  std_logic;
         addr              : IN  std_logic_vector(12 downto 0);
         din               : IN  SLV32;
         dout              : OUT SLV32;
         iIn0, qIn0,
         iIn1, qIn1        : IN  SLV18;
         nbagcgain0,
         nbagcgain1        : OUT std_logic_vector(20 downto 0);
         squelchLvl        : OUT std_logic_vector(12 downto 0);
         squelchRatio      : OUT SLV16
      );
   END COMPONENT;

   signal   iAgcIn0,qAgcIn0,
            iAgcIn1,qAgcIn1         : std_logic_vector(47 downto 0);
   signal   nbagcgain0,
            nbagcgain1              : std_logic_vector(20 downto 0);
   signal   nbagcgain0_u,
            nbagcgain1_u            : ufixed(12 downto 0);
   signal   squelchLvl,
            sum0, sum1              : sfixed(12 downto 0);
   signal   diff, diff0, diff1      : sfixed(12 downto 0);
   signal   squelchLvlSlv           : std_logic_vector(12 downto 0);
   signal   squelchRatioSlv         : SLV16;
   signal   squelchRatio,
            ratio0, ratio1          : sfixed(0 downto -15);

   begin

   input_process : process(clk)
   begin
      if (rising_edge(clk)) then
         iAgcIn0 <= i_in0 & 30x"0";
         qAgcIn0 <= q_in0 & 30x"0";
         iAgcIn1 <= i_in1 & 30x"0";
         qAgcIn1 <= q_in1 & 30x"0";
      end if;
   end process;

   gainI0 : combVarGain
      PORT MAP (
        clk          => clk,
        clkEn        => ce,
        exponent     => nbagcgain0(20 downto 16),
        mantissa     => nbagcgain0(15 downto 0),
        din          => iAgcIn0,
        dout         => i_out0
   );

   gainQ0 : combVarGain
      PORT MAP (
        clk          => clk,
        clkEn        => ce,
        exponent     => nbagcgain0(20 downto 16),
        mantissa     => nbagcgain0(15 downto 0),
        din          => qAgcIn0,
        dout         => q_out0
   );


   gainI1 : combVarGain
      PORT MAP (
        clk          => clk,
        clkEn        => ce,
        exponent     => nbagcgain1(20 downto 16),
        mantissa     => nbagcgain1(15 downto 0),
        din          => iAgcIn1,
        dout         => i_out1
   );

   gainQ1 : combVarGain
      PORT MAP (
        clk          => clk,
        clkEn        => ce,
        exponent     => nbagcgain1(20 downto 16),
        mantissa     => nbagcgain1(15 downto 0),
        din          => qAgcIn1,
        dout         => q_out1
   );

   combChannelAGC_u : combChannelAGC
      PORT MAP (
         clk               => clk,
         clkEn             => ce,
         reset             => reset,
         cs                => cs,
         wr0               => wr0,
         wr1               => wr1,
         wr2               => wr2,
         wr3               => wr3,
         busClk            => busClk,
         addr              => addr,
         din               => din,
         dout              => dout,
         iIn0              => i_out0,
         qIn0              => q_out0,
         nbagcgain0        => nbagcgain0,
         iIn1              => i_out1,
         qIn1              => q_out1,
         nbagcgain1        => nbagcgain1,
         squelchLvl        => squelchLvlSlv,
         squelchRatio      => squelchRatioSlv
   );
   squelchRatio <= to_sfixed(squelchRatioSlv, squelchRatio);
   squelchLvl   <= to_sfixed(squelchLvlSlv, squelchLvl);

   /*  This routine is compensating for fades in either channel. The desired
        result is to show the lower signal level in the faded channel such that
        the combier will favor the unfaded channel.
        To do this, we run a fast AGC on the two channels at a higher slew rate
        than the RF section supports. We then subtract the difference in gain from
        the faded channel, leaving the stronger channel alone.
    */

   outProcess : process(clk)
      variable sum0_v,
               sum1_v,
               agc0_v,
               agc1_v        : sfixed(12 downto 0);
      variable agcDiff0_v,
               agcDiff1_v    : sfixed(12 downto 0);
   begin
      if (rising_edge(clk)) then
         nbagcgain0_u <= to_ufixed(nbagcgain0(20 downto 8), 12, 0);
         nbagcgain1_u <= to_ufixed(nbagcgain1(20 downto 8), 12, 0);
         diff         <= resize(sfixed(nbagcgain0_u - nbagcgain1_u), diff);

         agc0_v := to_sfixed('0' & agcIn0, agc0_v);
         if (agc0_v < squelchLvl) then
            agcDiff0_v := resize(squelchLvl - agc0_v, agcDiff0_v);
            ratio0 <= resize(sfixed(agcDiff0_v) * squelchRatio, ratio0);
            diff0  <= resize(diff * ratio0, diff0);
         else
            diff0 <= diff;
         end if;

            diff1 <= diff;

         -- if the difference is positive, gain on channel 0 is dominate
         sum0_v := resize(agc0_v - diff0, sum0_v);
         if (sum0_v(12)) then
            if (sum0_v(11)) then
               sum0_v := (others=>'0');
            else
               sum0_v := (others=>'1');
            end if;
         end if;

          -- if the difference is negative, gain on channel 1 is dominate
         agc1_v := to_sfixed('0' & agcIn1, agc1_v);
         sum1_v := resize(agc1_v + diff1, sum1_v);
         if (sum1_v(12)) then
            if (sum1_v(11)) then
               sum1_v := (others=>'0');
            else
               sum1_v := (others=>'1');
            end if;
         end if;
         agcOut0 <= agcIn0 when (    diff0(12)) else to_slv(sum0_v(11 downto 0));
         agcOut1 <= agcIn1 when (not diff1(12)) else to_slv(sum1_v(11 downto 0));
         sum0 <= sum0_v;   -- just for test points
         sum1 <= sum1_v;

      end if;
    end process;

end rtl;
