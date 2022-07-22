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
use work.fixed_pkg.all;
use work.semco_pkg.all;

ENTITY CompareGoldRef IS
   GENERIC (
      FILE_NAME         : string := "../test_data/file.txt";
      NUM_VALUES        : natural := 1;            -- number of values per line
      DATA_TYPE         : GoldDataType := Bools;   -- data type, bools, UFix or SFix
      IN_WIDTH          : natural := 32;           -- total width of each value
      IN_BINPT          : natural := 31;           -- number of fraction bits if any. If none, set to 0
      DELAY             : natural := 1;            -- number of clocks to wait before reading file. Accounts for pipelining
      IgnoreCount       : integer := 0;            -- number of clocks to ignore data errors. Allows for reset issues that don't matter
      Tolerance         : real := 0.0              -- amounts of slop to allow
   );
   PORT(
      clk               : IN  std_logic;
      reset             : IN  std_logic;
      ce                : IN  std_logic;
      InputData         : IN  vector_of_slvs(0 to NUM_VALUES-1)(IN_WIDTH-1 downto 0);
      ErrorOut          : OUT UINT32slv;
      BoolErr           : OUT std_logic_vector(NUM_VALUES-1 downto 0); -- used for bipolar sign compares for signed data
      Done              : OUT std_logic
   );
END CompareGoldRef;

ARCHITECTURE rtl OF CompareGoldRef IS

   -- Signals
   SIGNAL   RefValue    : vector_of_sfixed(0 to NUM_VALUES-1)(IN_WIDTH - IN_BINPT downto -IN_BINPT); -- used for visibility in wave output
   SIGNAL   Errors      : vector_of_sfixed(0 to NUM_VALUES-1)(32 - IN_BINPT - 1 downto -IN_BINPT);
   SIGNAL   DelayCount,
            BoolErrors  : unsigned(15 downto 0);
   SIGNAL   TotalError,
            MaxError    : sfixed(32 - IN_BINPT - 1 downto -IN_BINPT);

BEGIN

   ErrorOut    <= to_slv(TotalError);

   reg_process :  process(clk)
      file     FilePntr : text;
      variable LineVar  : line;
      variable Data     : std_logic_vector(31 downto 0);
      variable Real_v   : real;
      variable Error_v,
               UFixRef_v,
               UFixInp_v : sfixed(IN_WIDTH - IN_BINPT downto -IN_BINPT);    -- actually UFixRef_v is sfixed with a spare sign bit for subtraction
      variable SFixRef_v,
               SFixInp_v : sfixed(IN_WIDTH - IN_BINPT - 1 downto -IN_BINPT);
      variable AbsErrors : vector_of_sfixed(NUM_VALUES-1 downto 0)(32 - IN_BINPT - 1 downto -IN_BINPT);
      variable Bool_v   : std_logic;
      variable Good_v   : boolean;
   begin
      if (rising_edge(clk)) then
         if (reset = '1') then
            file_close(FilePntr); -- close just in case of rewinding
            --Open the file in read mode.
            file_open(FilePntr,FILE_NAME,read_mode);
            DelayCount  <= x"0000";
            BoolErrors  <= x"0000";
            BoolErr     <= (others=>'0');
            Errors      <= (others=>(others=>'0'));
            Done        <= '0';
            TotalError  <= (others=>'0');
            MaxError    <= (others=>'0');
         elsif (ce = '1') then
            if (DelayCount < Delay) then
               DelayCount <= DelayCount + 1;    -- WARNING, the inputs are not verified during DelayCount
            elsif not ENDFILE(FilePntr) then
               readline(FilePntr, LineVar);     --read the current line.
               Error_v := to_sfixed(0.0, Error_v);
               for i in 0 to NUM_VALUES-1 loop  -- pull the NUM_VALUES per line
                  case (DATA_TYPE) is
                     when UFix =>
                         --extract the uint value from the read line and store it in the variable.
                        if (IN_BINPT = 0) then     -- uint
                           hread(LineVar, Data, Good_v);
                           UFixRef_v   := to_sfixed('0' & Data(IN_WIDTH-1 downto 0), UFixRef_v);
                           UFixInp_v   := to_sfixed('0' & InputData(i), UFixInp_v);
                           RefValue(i) <= UFixRef_v;
                           Errors(i)   <= resize(UFixInp_v - UFixRef_v, Errors(i));   -- Negative errors come out positive for ufixed
                        else                       -- double
                           read(LineVar, Real_v, Good_v);
                           UFixRef_v   := to_sfixed(Real_v, UFixRef_v);
                           UFixInp_v   := to_sfixed('0' & InputData(i), UFixInp_v);
                           RefValue(i) <= UFixRef_v;
                           Errors(i)   <= resize(UFixInp_v - UFixRef_v, Errors(i));
                        end if;
                        BoolErr(i) <= '0';   -- invalid for unipolar data
                     when SFix =>
                         --extract the int value from the read line and store it in the variable.
                        if (IN_BINPT = 0) then     -- int
                           hread(LineVar, Data, Good_v);
                           SFixRef_v   := to_sfixed(Data(IN_WIDTH-1 downto 0), SFixRef_v);
                           SFixInp_v   := to_sfixed(InputData(i), SFixInp_v);
                           RefValue(i) <= resize(SFixRef_v, RefValue(i));
                           Errors(i)   <= resize(SFixInp_v - SFixRef_v, Errors(i));
                        else                       -- double
                           read(LineVar, Real_v, Good_v);
                           SFixRef_v   := to_sfixed(Real_v, SFixRef_v);
                           SFixInp_v   := to_sfixed(InputData(i), SFixInp_v);
                           RefValue(i) <= resize(SFixRef_v, RefValue(i));
                           Errors(i)   <= resize(SFixInp_v - SFixRef_v, Errors(i));
                        end if;
                        BoolErr(i) <= SFixRef_v(IN_WIDTH-IN_BINPT-1) xor SFixInp_v(IN_WIDTH-IN_BINPT-1);
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
                           Errors(i) <= to_sfixed(0.0, Errors(i));
                        else
                           Errors(i) <= to_sfixed(1.0, Errors(i));
                        end if;
                        BoolErr(i) <= Bool_v xor InputData(i)(0);
                  end case;
                  AbsErrors(i) := resize(abs(Errors(i)), AbsErrors(i));
                  if (DelayCount < Delay + IgnoreCount) then
                     DelayCount <= DelayCount + 1;    -- WARNING, the inputs are not verified during DelayCount
                  elsif (AbsErrors(i) > Tolerance) then
                     Error_v := resize(Error_v + AbsErrors(i), Error_v);
                  end if;
                  if (AbsErrors(i) > MaxError) then
                     MaxError <= AbsErrors(i);
                  end if;
                  if (BoolErr(i)) then
                     BoolErrors <= BoolErrors+1;
                  end if;
               end loop;
               TotalError <= resize(TotalError + Error_v,  TotalError);
            else
               file_close(FilePntr); --close the file after reading.
               Done <= '1';
            end if;
         end if;
      end if;
   end process reg_process;

END rtl;
