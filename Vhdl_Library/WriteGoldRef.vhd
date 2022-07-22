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

Module Name: WriteGoldRef.vhd

Description: Write sfixed value to text file.

----------------------------------------------------------------------------
                               DETAILS
----------------------------------------------------------------------------
----------------------------------------------------------------------------
                               HISTORY
----------------------------------------------------------------------------
3/3/18 Initial release FZ
-------------------------------------------------------------
*/
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
use IEEE.MATH_REAL.ALL;
library std;
use std.textio.all;
use work.fixed_pkg.all;
use work.semco_pkg.all;

ENTITY WriteGoldRef IS
   GENERIC (
      FILE_NAME         : string := "../test_data/file.txt";
      IN_WIDTH          : natural := 32;        -- total width of each value
      IN_BINPT          : natural := 31         -- number of fraction bits if any. If none, set to 0
   );
   PORT(
      clk,
      ce,
      reset,
      eof               : IN  std_logic;
      SlvSfixed         : IN  std_logic_vector(IN_WIDTH-1 downto 0)
   );
END WriteGoldRef;

ARCHITECTURE rtl OF WriteGoldRef IS

      file     FilePntr : text open write_mode is FILE_NAME;

BEGIN

   reg_process :  process(clk)
      variable LineVar  : line;
      variable Real_v   : real;
      variable SFixed_v : sfixed(IN_WIDTH - IN_BINPT - 1 downto -IN_BINPT);
   begin
      if (rising_edge(clk)) then
         if (reset) then
               file_open(FilePntr, FILE_NAME, write_mode);
         elsif (ce = '1') then
            if (not eof) then
               SFixed_v := to_sfixed(SlvSfixed, SFixed_v);
               Real_v   := to_real(SFixed_v);
               write(LineVar, real'image(Real_v));
               writeline(FilePntr, LineVar);     --writes the current line.
            else
               file_close(FilePntr); --close the file after writing.
            end if;
         end if;
      end if;
   end process reg_process;

END rtl;
