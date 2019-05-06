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
-- Module Name: ReadGoldRef.vhd
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

ENTITY ReadGoldRef IS
   GENERIC (
      FILE_NAME         : string := "../test_data/file.txt";
      NUM_VALUES        : natural := 1;         -- number of values per line
      DATA_TYPE         : GoldDataType := Bools; -- data type, std_logic 0/1, hex int/uint or double
      OUT_WIDTH         : natural := 32;        -- total width of each value
      OUT_BINPT         : integer := -31;       -- number of fraction bits if any. If none, set to 0
      DELAY             : natural := 0          -- number of clocks to wait before reading file. Accounts for pipelining
   );
   PORT(
      clk               : IN  std_logic;
      reset             : IN  std_logic;
      ce                : IN  std_logic;
      OutputData        : OUT vector_of_slvs(0 to NUM_VALUES-1)(OUT_WIDTH-1 downto 0);
      Done              : OUT std_logic
   );
END ReadGoldRef;

ARCHITECTURE rtl OF ReadGoldRef IS

--   SIGNAL   DelayCount  : integer;

BEGIN

   reg_process :  process(clk, reset)
      file     FilePntr : text;
      variable LineVar  : line;
      variable Data     : std_logic_vector(31 downto 0);
      variable Real_v   : real;
      variable Int_v    : integer;
      variable UFixed_v : ufixed(OUT_WIDTH + OUT_BINPT - 1 downto OUT_BINPT);
      variable SFixed_v : sfixed(OUT_WIDTH + OUT_BINPT - 1 downto OUT_BINPT);
      variable Bool_v   : std_logic;
      variable Good_v   : boolean;
      variable DelayCount_v : integer;
   begin
      if (rising_edge(clk)) then
         if (reset = '1') then
            --Open the file in read mode.
            file_open(FilePntr, FILE_NAME, read_mode);
            OutputData <= (others=>(others=>'0'));
            DelayCount_v  := 0;
            Done <= '0';
         elsif (ce and not Done) then
            while (DelayCount_v < DELAY) loop
               DelayCount_v := DelayCount_v + 1;    -- skip over DELAY lines
               readline(FilePntr, LineVar);
            end loop;
            if not ENDFILE(FilePntr) then
               readline(FilePntr, LineVar);     --read the current line.
               for i in 0 to NUM_VALUES-1 loop  -- pull the NUM_VALUES per line
                  case (DATA_TYPE) is
                     when UFix =>
                         --extract the uint value from the read line and store it in the output.
                        if (OUT_BINPT = 0) then     -- uint
                           hread(LineVar, Data, Good_v);
                           UFixed_v       := to_ufixed(Data(OUT_WIDTH-1 downto 0), UFixed_v);
                           OutputData(i)  <= to_slv(UFixed_v);
                        else                       -- double
                           read(LineVar, Real_v, Good_v);
                           UFixed_v       := to_ufixed(Real_v, UFixed_v);
                           OutputData(i)  <= to_slv(UFixed_v);
                        end if;
                     when SFix =>
                         --extract the int value from the read line and store it in the output.
                        if (OUT_BINPT = 0) then     -- uint
                           hread(LineVar, Data, Good_v);
                           SFixed_v       := to_Sfixed(Data(OUT_WIDTH-1 downto 0), SFixed_v);
                           OutputData(i)  <= to_slv(SFixed_v);
                        else                       -- double
                           read(LineVar, Real_v, Good_v);
                           SFixed_v    := to_sfixed(Real_v, SFixed_v);
                           OutputData(i) <= to_slv(to_sfixed(Real_v, SFixed_v, fixed_saturate, fixed_round));
                        end if;
                     when Bools =>
                      --extract the bit from the read line and store it in the output.
                        read(LineVar, Int_v, Good_v);
                        Bool_v := '1' when (Int_v > 0) else '0';
                        OutputData(i)(0) <= Bool_v;
                  end case;
               end loop;
            else
               file_close(FilePntr); --close the file after reading.
               Done <= '1';
            end if;
         end if;
      end if;
   end process reg_process;

END rtl;
