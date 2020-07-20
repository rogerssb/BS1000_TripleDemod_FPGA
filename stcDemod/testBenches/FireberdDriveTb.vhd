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
-- Module Name: FireberdDriveTb.vhd
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
use work.Semco_pkg.all;

entity FireberdDriveTb is
end FireberdDriveTb;

architecture rtl of FireberdDriveTb is

  -- Define Components

   COMPONENT FireberdDrive IS
      PORT(
         clk,
         reset,
         ce,
         Clk10MIn,
         ValidIn        : IN  std_logic;
         RecoveredData  : IN  SLV4;
         DataOut,
         ClkOut,
         OverFlow,
         UnderFlow      : OUT std_logic
      );
   END COMPONENT FireberdDrive;
-------------------------------------------------------------------------------
--                       CONSTANT DEFINITIONS
-------------------------------------------------------------------------------

   signal   reset                : std_logic := '1';
   signal   clk, clk10           : std_logic := '1';
   signal   ce                   : std_logic := '1';

   SIGNAL   ValidIn,
            OverFlow,
            UnderFlow,
            DataOut,
            ClkOut,
            ClkDelay          : std_logic := '0';
   SIGNAL   RecoveredData     : unsigned(3 downto 0) := x"5";
   SIGNAL   Count             : natural range 0 to 3;

begin

   process begin
      wait for 500 ps;
      clk <= not clk;
   end process;

   process begin
      wait for 5 ns;
      clk10 <= not clk10;
   end process;

   reset_process : process begin
      wait for 2 ns;
      reset <= '0';
   end process reset_process;

   process(clk)
   begin
      if (rising_edge(clk)) then
         if (Count = 3) then
            Count <= 0;
            RecoveredData <= RecoveredData + x"1";
            ValidIn <= '1';
         else
            Count <= Count + 1;
            ValidIn <= '0';
         end if;
      end if;
   end process;

   Check_u : FireberdDrive
   PORT MAP(
      clk            => clk,
      reset          => reset,
      ce             => ce,
      ValidIn        => ValidIn,
      Clk10MIn       => clk10,
      RecoveredData  => std_logic_vector(RecoveredData),
      DataOut        => DataOut,
      ClkOut         => ClkOut,
      OverFlow       => OverFlow,
      UnderFlow      => UnderFlow
   );

end rtl;
