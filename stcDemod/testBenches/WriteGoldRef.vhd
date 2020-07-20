-------------------------------------------------------------------------------
--                   PROPRIETARY NOTICE
-------------------------------------------------------------------------------
-- (c) Copyright 2016 Semco All rights reserved.
--
-- This file contains Semco proprietary information. It is the
-- property of Semco. and shall not be used, disclosed to others or
-- reproduced without the express written consent of Semco,
-- including, but without limitation, it is not to be used in the creation,
-- manufacture, development, or derivation of any designs, or configuration.
--
-------------------------------------------------------------------------------
--
-- Company:     Semco
--
-- Module Name: WriteGoldRef.vhd
--
-- Description: Read 1 to N values from a .txt file and output as slv to 1 to N outputs
-- in either boolean, integer or fixed formats. All data file values are real numbers
--
-------------------------------------------------------------------------------
--                                DETAILS
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
--                                HISTORY
-------------------------------------------------------------------------------
-- 10/3/16 Initial release FZ
-- -------------------------------------------------------------

LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
use IEEE.MATH_REAL.ALL;
library std;
use std.textio.all;
use work.fixed_generic_pkg_mod.all;
use IEEE.fixed_float_types.all;
use work.Semco_pkg.all;

ENTITY WriteGoldRef IS
   GENERIC (
      FILE_NAME         : string := "../simData/file.txt";
      NUM_VALUES        : natural := 1;         -- number of values per line
      DATA_TYPE         : GoldDataType := Bools; -- data type, std_logic 0/1, hex int/uint or double
      OUT_WIDTH         : natural := 32;        -- total width of each value
      OUT_BINPT         : integer := -31        -- number of fraction bits if any. If none, set to 0. Watch the sign
   );
   PORT(
      clk,
      ce,
      Done              : IN  std_logic;
      InputData         : IN vector_of_slvs(0 to NUM_VALUES-1)(OUT_WIDTH-1 downto 0)
   );
END WriteGoldRef;

ARCHITECTURE rtl of WriteGoldRef IS

BEGIN

   reg_process :  process(clk)
      file     FilePntr : text open write_mode is FILE_NAME;
      variable LineVar  : line;
      variable Real_v   : real;
      variable UFixed_v : ufixed(OUT_WIDTH + OUT_BINPT - 1 downto OUT_BINPT);
      variable SFixed_v : sfixed(OUT_WIDTH + OUT_BINPT - 1 downto OUT_BINPT);
      variable Bool_v   : ufixed(0 downto 0);
   begin
      if (rising_edge(clk)) then
         if (ce) then
            for i in 0 to NUM_VALUES-1 loop  -- pull the NUM_VALUES per line
               case (DATA_TYPE) is
                  when UFix =>
                      --extract the uint value from the read line and store it in the output.
                     UFixed_v := to_ufixed(InputData(i), UFixed_v);
                     Real_v   := to_real(UFixed_v);
                     write(LineVar, real'image(Real_v), right, 15);
                  when SFix =>
                     SFixed_v := to_sfixed(InputData(i), SFixed_v);
                     Real_v   := to_real(SFixed_v);
                     write(LineVar, real'image(Real_v), right, 15);
                  when Bools =>
                   --extract the bit from the read line and store it in the output.
                     Bool_v := to_ufixed(InputData(i), Bool_v);
                     write(LineVar, Bool_v);
               end case;
            end loop;
            writeline(FilePntr, LineVar);
         elsif (Done) then
            file_close(FilePntr); --close the file after writing.
         end if;
      end if;
   end process reg_process;

END rtl;
