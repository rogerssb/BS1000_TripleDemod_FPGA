
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
      addr                        : IN  std_logic_vector(5 downto 0);
      din                         : IN  SLV32;
      dout                        : OUT SLV32;
      i_in0, q_in0,i_in1, q_in1   : IN  SLV18;
      agcIn0, agcIn1              : IN  std_logic_vector(11 downto 0);
      i_out0,q_out0,i_out1,q_out1 : OUT SLV18;
      agcOut0, agcOut1            : OUT std_logic_vector(12 downto 0)
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
         addr              : IN  std_logic_vector(5 downto 0);
         din               : IN  SLV32;
         dout              : OUT SLV32;
         iIn0, qIn0,
         iIn1, qIn1        : IN  SLV18;
         agc_d_outputs     : OUT std_logic;
         nbagcgain0,
         nbagcgain1        : OUT std_logic_vector(20 downto 0);
         frontEndRatio0,
         frontEndRatio1    : OUT SLV16
      );
   END COMPONENT;

   signal   iAgcIn0,qAgcIn0,
            iAgcIn1,qAgcIn1         : std_logic_vector(47 downto 0);
   signal   nbagcgain0,
            nbagcgain1              : std_logic_vector(20 downto 0);
   signal   frontEndRatio0,
            frontEndRatio1          : SLV16;
   signal   frontEndRatio0_s,
            frontEndRatio1_s        : sfixed(1 downto -15);
   signal   iInt0,qInt0,
            iInt1,qInt1             : SLV18;
   signal   agc_d_outputs           : std_logic;

   begin

   frontEndRatio0_s <= to_sfixed('0' & frontEndRatio0, frontEndRatio0_s);
   frontEndRatio1_s <= to_sfixed('0' & frontEndRatio1, frontEndRatio1_s);

   input_process : process(clk)
      variable      i_in0_v,
                    q_in0_v,
                    i_in1_v,
                    q_in1_v,
                    iGained0_v,
                    qGained0_v,
                    iGained1_v,
                    qGained1_v    : sfixed(0 downto -17);
   begin
      if (rising_edge(clk)) then
         -- the A/D inputs have some loss across the motherboard. This normalizes them
         i_in0_v     := to_sfixed(i_in0, i_in0_v);
         q_in0_v     := to_sfixed(q_in0, q_in0_v);
         i_in1_v     := to_sfixed(i_in1, i_in1_v);
         q_in1_v     := to_sfixed(q_in1, q_in1_v);
         iGained0_v  := resize(frontEndRatio0_s * i_in0_v, iGained0_v);
         qGained0_v  := resize(frontEndRatio0_s * q_in0_v, qGained0_v);
         iGained1_v  := resize(frontEndRatio1_s * i_in1_v, iGained1_v);
         qGained1_v  := resize(frontEndRatio1_s * q_in1_v, qGained1_v);
         iAgcIn0 <= to_slv(iGained0_v) & 30x"0";
         qAgcIn0 <= to_slv(qGained0_v) & 30x"0";
         iAgcIn1 <= to_slv(iGained1_v) & 30x"0";
         qAgcIn1 <= to_slv(qGained1_v) & 30x"0";

         if (agc_d_outputs) then
            i_out0   <= iInt0;
            q_out0   <= qInt0;
            i_out1   <= iInt1;
            q_out1   <= qInt1;
         else
            i_out0   <= i_in0;
            q_out0   <= q_in0;
            i_out1   <= i_in1;
            q_out1   <= q_in1;
         end if;
      end if;
   end process;

   gainI0 : combVarGain
      PORT MAP (
        clk          => clk,
        clkEn        => ce,
        exponent     => nbagcgain0(20 downto 16),
        mantissa     => nbagcgain0(15 downto 0),
        din          => iAgcIn0,
        dout         => iInt0
   );

   gainQ0 : combVarGain
      PORT MAP (
        clk          => clk,
        clkEn        => ce,
        exponent     => nbagcgain0(20 downto 16),
        mantissa     => nbagcgain0(15 downto 0),
        din          => qAgcIn0,
        dout         => qInt0
   );


   gainI1 : combVarGain
      PORT MAP (
        clk          => clk,
        clkEn        => ce,
        exponent     => nbagcgain1(20 downto 16),
        mantissa     => nbagcgain1(15 downto 0),
        din          => iAgcIn1,
        dout         => iInt1
   );

   gainQ1 : combVarGain
      PORT MAP (
        clk          => clk,
        clkEn        => ce,
        exponent     => nbagcgain1(20 downto 16),
        mantissa     => nbagcgain1(15 downto 0),
        din          => qAgcIn1,
        dout         => qInt1
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
         iIn0              => iInt0,
         qIn0              => qInt0,
         nbagcgain0        => nbagcgain0,
         iIn1              => iInt1,
         qIn1              => qInt1,
         nbagcgain1        => nbagcgain1,
         agc_d_outputs     => agc_d_outputs,
         frontEndRatio0    => frontEndRatio0,
         frontEndRatio1    => frontEndRatio1
   );

   /*  This routine is compensating for fades in either channel. The desired
        result is to show the lower signal level in the faded channel such that
        the combier will favor the unfaded channel.
        To do this, we run a fast AGC on the two channels at a higher slew rate
        than the RF section supports. We then add the gains to the RF's AGCs.
    */

   outProcess : process(clk)
      variable nbAgc0_v,
               nbAgc1_v,
               agc0_v,
               agc1_v,
               sum0_v,
               sum1_v      : ufixed(12 downto 0);
   begin
      if (rising_edge(clk)) then
         agc0_v := to_ufixed('0' & agcIn0, agc0_v);
         nbAgc0_v := to_ufixed(nbagcgain0(20 downto 8), nbAgc0_v);
         sum0_v := resize(agc0_v + nbAgc0_v, sum0_v);
         agc1_v := to_ufixed('0' & agcIn1, agc1_v);
         nbAgc1_v := to_ufixed(nbagcgain1(20 downto 8), nbAgc1_v);
         sum1_v := resize(agc1_v + nbAgc1_v, sum1_v);

         agcOut0 <= to_slv(sum0_v);
         agcOut1 <= to_slv(sum1_v);

      end if;
    end process;

end rtl;
