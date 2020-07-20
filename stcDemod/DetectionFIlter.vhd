-------------------------------------------------------------------------------
--                   PROPRIETARY NOTICE
-------------------------------------------------------------------------------
-- (c) Copyright 2016 Semco. All rights reserved.
--
-- This file contains Semco. proprietary information. It is the
-- property of Semco. and shall not be used, disclosed to others or
-- reproduced without the express written consent of Semco,
-- including, but without limitation, it is not to be used in the creation,
-- manufacture, development, or derivation of any designs, or configuration.
--
-------------------------------------------------------------------------------
--
-- Company:     Semco
--
-- Module Name: detection_filter.vhd
-- Description: Detection_filter performs the filtering operation on the received signal
--		with the detection filter.  The detection filter is the second PAM pulse of
--		the CPM approximation of FQPSK-JR.
--
--		The last DF_LEN-1 samples from each call are saved and used to generate the
--		first DF_LEN-1 output samples of the next call.
--
--		The sample rate is 4 samples/bit
--
--	Inputs
--
--		in_r			- input signal
--		in_i
--		out_r			- output signal (must be able to hold num_out_samps floats)
--		out_i
--		num_out_samps		- number of samples to be output
--
-- Dependencies: None
--
-------------------------------------------------------------------------------
--                                DETAILS
-------------------------------------------------------------------------------
--
-- ce is the clock enable
-------------------------------------------------------------------------------
--                                HISTORY
-------------------------------------------------------------------------------
-- 8/24/16 Initial release FZ
-- -------------------------------------------------------------


LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
use work.fixed_pkg.all;
USE IEEE.math_real.all;

entity detection_filter is
   generic (
      IN_WIDTH    : natural   := 18;
      IN_BINPT    : natural   := 17;
      OUT_WIDTH   : natural   := 18;
      OUT_BINPT   : natural   := 17
   );
   port (
      clk,
      ce,
      reset,
      ValidIn  : in  std_logic;
      InR,
      InI      : in  std_logic_vector(IN_WIDTH -1 downto 0);
      ValidOut : out std_logic;
      OutR,
      OutI     : out std_logic_vector(OUT_WIDTH -1 downto 0)
   );
   end detection_filter;

architecture rtl of detection_filter is

   type  SFIXED_ARRAY is array (natural range <>) of sfixed(0 downto -17);

   constant DF_LEN      : natural := 8;
   constant COEFF_TYPE  : sfixed(0 downto -17) := (others=>'0');
   constant DetFilter   : SFIXED_ARRAY(DF_LEN-1 downto 0) := (		-- this filter has unit DC gain
                              to_sfixed(0.00965657, COEFF_TYPE), to_sfixed(0.06389303, COEFF_TYPE),
                              to_sfixed(0.16877815, COEFF_TYPE), to_sfixed(0.25767225, COEFF_TYPE),
                              to_sfixed(0.25767225, COEFF_TYPE), to_sfixed(0.16877815, COEFF_TYPE),
                              to_sfixed(0.06389303, COEFF_TYPE), to_sfixed(0.00965657, COEFF_TYPE) );


   signal   InRfix,
            InIfix         : sfixed(IN_WIDTH-IN_BINPT-1 downto -IN_BINPT);
    signal  DelayR,
            DelayI         : SFIXED_ARRAY(DF_LEN-1 downto 0) := (others=>(others=>'0'));
    signal  OutRfix,
            OutIfix        : sfixed(OUT_WIDTH-OUT_BINPT-1 downto -OUT_BINPT);
   signal   ValidDelay     : std_logic_vector(4 downto 0);

begin

   InRfix <= to_sfixed(InR, InRfix);
   InIfix <= to_sfixed(InI, InIfix);

   DF_process: process (clk)
      variable Rfix_v,
               Ifix_v   : sfixed(IN_WIDTH-IN_BINPT-1 downto -IN_BINPT);
   begin
      if (rising_edge(clk)) then
         if (reset = '1') then               -- BRAMs prefer synchronous reset
            OutRfix     <= (others=>'0');
            OutIfix     <= (others=>'0');
            ValidDelay  <= (others=>'0');
         elsif ce = '1' then
            if (ValidIn) then
               DelayR <= DelayR(DF_LEN-2 downto 0) & InRfix;
               DelayI <= DelayI(DF_LEN-2 downto 0) & InIfix;
               ValidDelay <= ValidDelay(3 downto 0) & ValidIn;
               Rfix_v := (others=>'0');
               Ifix_v := (others=>'0');
               for i in 0 to DF_LEN-1 loop
                  Rfix_v := resize(Rfix_v + DelayR(i)*DetFilter(i), Rfix_v);
                  Ifix_v := resize(Ifix_v + DelayI(i)*DetFilter(i), Ifix_v);
               end loop;
               OutRfix <= Rfix_v;
               OutIfix <= Ifix_v;
            end if;
         end if;
      end if;
   end process DF_process;

   OutR <= to_slv(OutRfix);
   OutI <= to_slv(OutIfix);
   ValidOut <= ValidDelay(4);

end rtl;
