-------------------------------------------------------------------------------
--                   PROPRIETARY NOTICE
-------------------------------------------------------------------------------
-- (c) Copyright 2014 Semco, Inc. All rights reserved.
--
-- This file contains Semco proprietary information. It is the
-- property of Semco and shall not be used, disclosed to others or
-- reproduced without the express written consent of Semco,
-- including, but without limitation, it is not to be used in the creation,
-- manufacture, development, or derivation of any designs, or configuration.
--
-------------------------------------------------------------------------------
--
-- Company:     Semco
--
-- Module Name: SumOfElements.vhd
--
-- Description: Add the 36 input values together.
--
-- Dependencies: None
--
-------------------------------------------------------------------------------
--                                DETAILS
-------------------------------------------------------------------------------
-- The addition is done two inputs are a time in a pyramid fashion. The incoming
-- 36 values are added in even/odd pairs to produce 18 sums. These sum are then
-- added in even/odd pairs producing 9 sums. Additions are continued till a single
-- result.
-- Note, all processing is done in signed mode. If the input is unsigned, then
-- an extra '0' is added to the front to make it positive signed.

-- Latency = ceil(log2(NUM_VECTORS)) + 1
-- Output is signed typically with Latency additional integer part bits
-------------------------------------------------------------------------------
--                                HISTORY
-------------------------------------------------------------------------------
-- 9/2/16 Initial release FZ
-- -------------------------------------------------------------
-- -------------------------------------------------------------

LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE IEEE.math_real.ALL;
use work.Semco_pkg.all;
use work.fixed_pkg.all;

ENTITY SumOfElements IS
   GENERIC (
      IN_WIDTH       : natural := 50;     -- input total bit width 50.20
      IN_BINPT       : natural := 20;     -- number of fraction bits if any. If none, set to 0
      IS_SIGNED      : natural := 1;      -- 1 = signed, 0 = unsigned
      OUT_WIDTH      : natural := 56;     -- output total bit width
      OUT_BINPT      : natural := 20      -- output binray point, ie number of fraction bits
   );
   PORT(
      clk            : IN  std_logic;
      reset          : IN  std_logic;
      ce             : IN  std_logic;
      Xin            : IN  vector_of_slvs(0 TO NUM_VECTORS-1)(IN_WIDTH-1 downto 0);
      Xout           : OUT std_logic_vector(OUT_WIDTH-1 DOWNTO 0)
   );
END SumOfElements;


ARCHITECTURE rtl OF SumOfElements IS

-- Note, BINPTs are negative numbers already except for IN_BINPT, DECs are the 'left of integer part, ie DEC=2 yields 2 downto BinPt

   CONSTANT LOG2_CEIL         : natural := log2(NUM_VECTORS);
   CONSTANT CEILING           : natural := 2**LOG2_CEIL - 1;      -- Ceiling is smallest power of 2 >= NUM_VECTORS - 1
   CONSTANT FIRST_HALF        : natural := 2**(LOG2_CEIL-1) - 1;  -- FIRST_HALF is the first column of Adders. Each takes two inputs from XIN or 0
   CONSTANT SECOND_HALF       : natural := FIRST_HALF - 1;        -- SECOND_HALF is the pyramid of Adders that follow. Note, number of Adders is NUM_VECTORS - 1

   type  ufixed_In_Array  is array (NATURAL RANGE <>) OF ufixed(IN_WIDTH-IN_BINPT-1 DOWNTO -IN_BINPT);
   type  sfixed_In_Array  is array (NATURAL RANGE <>) OF sfixed(IN_WIDTH-IN_BINPT-1 DOWNTO -IN_BINPT);
   type  ufixed_Add_Array is array (NATURAL RANGE <>) OF ufixed(IN_WIDTH-IN_BINPT-1 + LOG2_CEIL DOWNTO -IN_BINPT);
   type  sfixed_Add_Array is array (NATURAL RANGE <>) OF sfixed(IN_WIDTH-IN_BINPT-1 + LOG2_CEIL DOWNTO -IN_BINPT);

   -- Signals
   SIGNAL   InReg_u     : ufixed_In_Array(CEILING DOWNTO 0) := (others => (others => '0'));
   SIGNAL   InReg_s     : sfixed_In_Array(CEILING+1 DOWNTO 0) := (others => (others => '0'));
   SIGNAL   Adder_u     : ufixed_Add_Array(CEILING downto 0);
   SIGNAL   Adder_s     : sfixed_Add_Array(CEILING downto 0);
   SIGNAL   Result_u    : ufixed(OUT_WIDTH-OUT_BINPT-1 downto -OUT_BINPT);
   SIGNAL   Result_s    : sfixed(OUT_WIDTH-OUT_BINPT-1 downto -OUT_BINPT);

BEGIN

   UnsignedAdd : if (is_signed = 0) generate
      reg_process : PROCESS (clk, reset)
      BEGIN
         IF (rising_edge(clk)) THEN
            IF reset = '1' THEN
               Adder_u  <= (others => (others => '0'));
            elsif (ce = '1') then
               for i in 0 to NUM_VECTORS-1 loop
                  InReg_u(i) <= to_ufixed(Xin(i), InReg_u(i));    -- Set TempIn_u(i) = Xin(i). If NUM_VECTORS is not a power of 2, Zero the rest
               end loop;
               for i in 0 to FIRST_HALF loop                -- setup first column of Adders to accept InReg.
                  Adder_u(i) <= resize(InReg_u(2*i) + InReg_u(2*i+1), Adder_u(i), fixed_saturate, fixed_truncate);
               end loop;
               for i in 0 to SECOND_HALF loop               -- Then build pyramid of Adders
                  Adder_u(FIRST_HALF + 1 + i) <= resize(Adder_u(i*2) + Adder_u(i*2+1), Adder_u(i), fixed_saturate, fixed_truncate);
               end loop;
            end if;
         END IF;
      END PROCESS reg_process;

   Result_u <= resize(Adder_u(FIRST_HALF + SECOND_HALF + 1), Result_u, fixed_saturate, fixed_truncate);
   Xout <= to_slv(Result_u);

   end generate UnsignedAdd;


   SignedAdd : if (is_signed = 1) generate
      reg_process : PROCESS (clk, reset)
      BEGIN
         IF (rising_edge(clk)) THEN
            IF reset = '1' THEN
               Adder_s  <= (others => (others => '0'));
            elsif (ce = '1') then
               for i in 0 to NUM_VECTORS-1 loop
                  InReg_s(i) <= to_sfixed(Xin(i), InReg_s(i));    -- Set TempIn_u(i) = Xin(i). If NUM_VECTORS is not a power of 2, Zero the rest
               end loop;
               for i in 0 to FIRST_HALF loop                -- setup first column of Adders to accept InReg.
                  Adder_s(i) <= resize(InReg_s(2*i) + InReg_s(2*i+1), Adder_s(i), fixed_saturate, fixed_truncate);
               end loop;
               for i in 0 to SECOND_HALF loop               -- Then build pyramid of Adders
                  Adder_s(FIRST_HALF + 1 + i) <= resize(Adder_s(i*2) + Adder_s(i*2+1), Adder_s(i), fixed_saturate, fixed_truncate);
               end loop;
            end if;
         END IF;
      END PROCESS reg_process;

   Result_s <= resize(Adder_s(FIRST_HALF + SECOND_HALF + 1), Result_s, fixed_saturate, fixed_truncate);
   Xout <= to_slv(Result_s);

   end generate SignedAdd;


END rtl;
