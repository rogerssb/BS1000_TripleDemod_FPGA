-------------------------------------------------------------------------------
--                   PROPRIETARY NOTICE
-------------------------------------------------------------------------------
-- (c) Copyright 2014 Semco All rights reserved.
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
-- Module Name: Interp_tb.vhd
-- Description:
--
-- Dependencies: Top level module
--
-------------------------------------------------------------------------------
--                                DETAILS
-------------------------------------------------------------------------------
--
-------------------------------------------------------------------------------
--                                HISTORY
-------------------------------------------------------------------------------
-- 9/17/16 Initial release FZ
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_textio.all;
use ieee.numeric_std.all;
use ieee.math_real.all;
use work.Semco_pkg.all;
use work.fixed_pkg.all;

entity Interp_tb is
end Interp_tb;

architecture rtl of Interp_tb is

  -- Define Components

   COMPONENT Interpolator IS
      PORT(
         clk,
         reset,
         ce,
         Interpolate,
         ValidIn        : IN  std_logic;
         DataIn         : IN  STC_PARM;
         SignedMu       : IN  FLOAT_1_18;
         DataOut        : OUT STC_PARM;
         ValidOut       : OUT std_logic
      );
   END COMPONENT Interpolator;

-------------------------------------------------------------------------------
--                       CONSTANT DEFINITIONS
-------------------------------------------------------------------------------

   signal   reset             : std_logic := '1';
   signal   clk               : std_logic := '1';
   signal   ce                : std_logic := '1';
   signal   Count             : unsigned(4 downto 0) := 5x"0";
   SIGNAL   ValidIn,
            Interpolate,
            ValidOut          : std_logic := '0';
   SIGNAL   DataIn,
            DataOut           : STC_PARM;
   SIGNAL   SignedMu          : FLOAT_1_18;
   SIGNAL   ReadData          : INT_ARRAY(0 to 78) := (
      42015, 15441, -10175, -29867, -43168, -51171, -55064, -55978, -55466, -55906, -59145, -65072, -72349, -79192, -83753, -85303, -84863, -84214, -84564, -85601, -84985, -77628, -57831, -25390, 12428, 45839, 68921, 81006, 83437, 77702, 66636, 54665, 46674, 46055, 53141, 64933, 77280, 87185, 92922, 94168, 92389, 90010, 88941, 88909, 87365, 81688, 71269, 58821, 49567, 47746, 53988, 65347, 77420, 87017, 92775, 94799, 94539, 93687, 93298, 93086, 90540, 81982, 63439, 33019, -5054, -41172, -66593, -78820, -81740, -80145, -74773, -63453, -44946, -21321, 2470, 21621, 33582, 37128, 31034);
   signal   Pntr           : natural range 0 to 78 := 0;

begin

   process begin
      wait for 500 ps;
      clk <= not clk;
   end process;

   reset_process : process begin
      wait for 2 ns;
      reset <= '0';
   end process reset_process;

   process(clk)
   begin
      if (rising_edge(clk)) then
         if (Count < 31) then
            Count <= Count + 1;
         else
            Count <= 5x"0";
         end if;
         Interpolate <= '1' when (Count(1 downto 0) = b"10") and (Count >= 15) else '0';
         ValidIn     <= '1' when Count > 15 else '0';
         if (ValidIn) then
            Pntr <= Pntr + 1;
         end if;
      end if;
   end process;

   DataIn <= to_sfixed(ReadData(Pntr), 17, 0);
   SignedMu <= to_sfixed(0.625, SignedMu);

   Interp_u : Interpolator
   PORT map (
      clk            => clk,
      reset          => reset,
      ce             => ce,
      Interpolate    => Interpolate,
      ValidIn        => ValidIn,
      DataIn         => DataIn,
      SignedMu       => SignedMu,
      DataOut        => DataOut,
      ValidOut       => ValidOut
   );

end rtl;
