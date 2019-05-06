-------------------------------------------------------------------------------
--                   PROPRIETARY NOTICE
-------------------------------------------------------------------------------
-- (c) Copyright 2014 RYFT System, Inc. All rights reserved.
--
-- This file contains RYFT Systems Inc. proprietary information. It is the
-- property of RYFT Systems Inc. and shall not be used, disclosed to others or
-- reproduced without the express written consent of RYFT Systems Inc.,
-- including, but without limitation, it is not to be used in the creation,
-- manufacture, development, or derivation of any designs, or configuration.
--
-------------------------------------------------------------------------------
--
-- Company:     RYFT Systems, Inc.
--
-- Module Name: CompareGoldRef.vhd
--
-- Description: Read 1 to N values from a text file and compare to 1 to N inputs
-- in either boolean, integer or real formats.
--
-------------------------------------------------------------------------------
--                                DETAILS
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
--                                HISTORY
-------------------------------------------------------------------------------
-- 3/3/16 Initial release FZ
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

ENTITY CompareGoldRef IS
   GENERIC (
      FILE_NAME         : string := "../test_data/file.dat";
      NUM_VALUES        : natural := 1;            -- number of values per line
      DATA_TYPE         : GoldDataType := Bools;   -- data type, std_logic 0/1, hex int/uint or double
      IN_WIDTH          : natural := 32;           -- total width of each value
      IN_BINPT          : natural := 31;           -- number of fraction bits if any. If none, set to 0
      DELAY             : natural := 1;            -- number of clocks to wait before reading file. Accounts for pipelining
      IGNORE_COUNT      : natural := 1;            -- number of clocks to ignore data errors. Allows for reset issues that don't matter
      TOLERANCE         : real    := 0.0           -- amount of slop to allow, 0 to n for bits, 0 to n.m for fixed
   );
   PORT(
      clk               : IN  std_logic;
      reset             : IN  std_logic;
      ce                : IN  std_logic;
      InputData         : IN  vector_of_slvs(0 to NUM_VALUES-1)(IN_WIDTH-1 downto 0);
      ErrorOut          : OUT real;
      Done              : OUT std_logic := '0'
   );
END CompareGoldRef;

ARCHITECTURE rtl OF CompareGoldRef IS

   type     RealArray   IS ARRAY (NATURAL RANGE <>) OF real;
   -- Signals
   SIGNAL   RefValue    : vector_of_sfixed(NUM_VALUES-1 downto 0)(IN_WIDTH - IN_BINPT downto -IN_BINPT);
   SIGNAL   InDelay     : vector_of_slvs(0 to NUM_VALUES-1)(IN_WIDTH-1 downto 0); --used for visibility in wave output
   SIGNAL   Errors      : RealArray(NUM_VALUES-1 downto 0);
   SIGNAL   DelayCount  : natural;
   SIGNAL   TotalError : Real;

BEGIN

   ErrorOut    <= TotalError;

   reg_process :  process(clk, reset)
      file     FilePntr : text;
      variable LineVar  : line;
      variable Data     : std_logic_vector(31 downto 0);
      variable Error_v,
               Real_v   : real;
      variable UFixRef_v,
               UFixInp_v : sfixed(IN_WIDTH - IN_BINPT downto -IN_BINPT);    -- actually UFixRef_v is sfixed with a spare sign bit for subtraction
      variable SFixRef_v,
               SFixInp_v : sfixed(IN_WIDTH - IN_BINPT - 1 downto -IN_BINPT);
      variable Bool_v   : std_logic;
      variable Good_v   : boolean;
   begin
      if (rising_edge(clk)) then
         if (reset = '1') then
            --Open the file in read mode.
            file_open(FilePntr,FILE_NAME,read_mode);
            DelayCount  <= 0;
            Errors      <= (others=>0.0);
            Done        <= '0';
            TotalError  <= 0.0;
         elsif (ce = '1') then
            InDelay <= InputData;
            if (DelayCount < DELAY+1) then
               DelayCount <= DelayCount + 1;    -- WARNING, the inputs are not verified during DelayCount
            elsif not ENDFILE(FilePntr) then
               readline(FilePntr, LineVar);     --read the current line.
               Error_v := 0.0;
               for i in 0 to NUM_VALUES-1 loop  -- pull the NUM_VALUES per line
                  case (DATA_TYPE) is
                     when UFix =>
                         --extract the uint value from the read line and store it in the variable.
                        if (IN_BINPT = 0) then     -- uint
                           hread(LineVar, Data, Good_v);
                           UFixRef_v   := to_sfixed('0' & Data(IN_WIDTH-1 downto 0), UFixRef_v);
                           UFixInp_v   := to_sfixed('0' & InputData(i), UFixInp_v);
                           RefValue(i) <= UFixRef_v;
                           Errors(i)   <= to_real(UFixInp_v - UFixRef_v);   -- Negative errors come out positive for ufixed
                        else                       -- double
                           read(LineVar, Real_v, Good_v);
                           UFixRef_v   := to_sfixed(Real_v, UFixRef_v);
                           UFixInp_v   := to_sfixed('0' & InputData(i), UFixInp_v);
                           RefValue(i) <= UFixRef_v;
                           Errors(i)   <= to_real(UFixInp_v - UFixRef_v);
                        end if;
                     when SFix =>
                         --extract the int value from the read line and store it in the variable.
                        if (IN_BINPT = 0) then     -- int
                           hread(LineVar, Data, Good_v);
                           SFixRef_v   := to_sfixed(Data(IN_WIDTH-1 downto 0), SFixRef_v);
                           SFixInp_v   := to_sfixed(InputData(i), SFixInp_v);
                           RefValue(i) <= resize(SFixRef_v, RefValue(i));
                           Errors(i)   <= to_real(SFixInp_v - SFixRef_v);
                        else                       -- double
                           read(LineVar, Real_v, Good_v);
                           SFixRef_v   := to_sfixed(Real_v, SFixRef_v);
                           SFixInp_v   := to_sfixed(InputData(i), SFixInp_v);
                           RefValue(i) <= resize(SFixRef_v, RefValue(i));
                           Errors(i)   <= to_real(SFixInp_v - SFixRef_v);
                        end if;
                     when Bools =>
                      --extract the bit from the read line and store it in the variable.
                        hread(LineVar, Data, Good_v);
                        Bool_v := Data(0);
                        if (Bool_v = '1') then
                           RefValue(i) <= to_sfixed(1.0, RefValue(i));
                        else
                           RefValue(i) <= to_sfixed(0.0, RefValue(i));
                        end if;
                        if (InputData(i)(0) = Bool_v) then
                           Errors(i) <= 0.0;
                        else
                           Errors(i) <= 1.0;
                        end if;
                  end case;
                  if (DelayCount < Delay + IGNORE_COUNT) then
                     DelayCount <= DelayCount + 1;    -- WARNING, the inputs are not verified during DelayCount
                  elsif (abs(Errors(i)) > TOLERANCE) then
                     Error_v := Error_v + abs(Errors(i));
                  end if;
               end loop;
               TotalError <= TotalError + Error_v;
            else
               file_close(FilePntr); --close the file after reading.
               Done <= '1';
            end if;
         end if;
      end if;
   end process reg_process;

END rtl;
