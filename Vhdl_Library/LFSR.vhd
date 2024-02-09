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

Module Name: LFSR.vhd
Description:

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
USE work.Semco_pkg.ALL;

ENTITY LFSR IS
      GENERIC(
         SHIFT_LEN   : positive := 18;
         NUM_TAPS    : positive := 3
      );
   PORT(
      clk            : IN  std_logic;
      reset          : IN  std_logic;
      ce             : IN  std_logic;
      Taps           : IN  INT_ARRAY(0 to NUM_TAPS-1);
      Parallel       : OUT std_logic_vector(SHIFT_LEN downto 1);
      PRN_Out        : OUT std_logic
   );
END LFSR;


ARCHITECTURE rtl OF LFSR IS

  -- Signals
   SIGNAL   Shifter           : std_logic_vector(SHIFT_LEN downto 1) := (others=>'1');

BEGIN

  Shift_process: process (clk)
      variable XORd     : std_logic;
   begin
      if (rising_edge(clk)) then
         if (reset) then
            Shifter <= (others=>'1');
         elsif ce = '1' then
               XORd := '0';
            for i in 0 to NUM_TAPS-1 loop
               XORd := XORd xor Shifter(Taps(i));
            end loop;
            XORd := XORd xor (nor(Shifter));   -- make sure shifter isn't all zeroes
            Shifter <= Shifter(SHIFT_LEN - 1 downto 1) & XORd;
         end if;
      end if;
   end process Shift_process;

   PRN_Out <= Shifter(1);
   Parallel <= Shifter;

END rtl;

