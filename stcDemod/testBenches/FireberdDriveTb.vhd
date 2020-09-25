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

LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
use work.fixed_pkg.all;
use work.Semco_pkg.ALL;

entity FireberdDriveTb is
end FireberdDriveTb;

architecture rtl of FireberdDriveTb is

  -- Define Components

   COMPONENT FireberdDrive IS
      PORT(
      clk,
      reset,
      ce,
      EstimatesDone,
      MsbFirst,
      ValidIn        : IN  std_logic;
      RecoveredData  : IN  SLV4;
      ClocksPerBit   : IN  SLV16;
      DataOut,
      ClkOut         : OUT std_logic
      );
   END COMPONENT FireberdDrive;

-------------------------------------------------------------------------------
--                       CONSTANT DEFINITIONS
-------------------------------------------------------------------------------

   signal   reset                : std_logic := '1';
   signal   clk                  : std_logic := '1';
   signal   ce                   : std_logic := '1';

   SIGNAL   ValidIn,
            DataOut,
            EstimatesDone,
            ClkOut,
            ClkDelay          : std_logic := '0';
   SIGNAL   RecoveredData     : unsigned(3 downto 0) := x"5";
   SIGNAL   Count             : unsigned(3 downto 0) := (others=>'0');
   SIGNAL   Nibbles           : integer range 0 to 1600 := 0;

begin

   process begin
      wait for 500 ps;
      clk <= not clk;
   end process;

   reset_process : process begin
      wait for 20 ns;
      reset <= '0';
   end process reset_process;

   process(clk)
   begin
      if (rising_edge(clk)) then
         Count <= Count + 1;
         if (Count = 1) then
            if (Nibbles < 1600) then
               if (Nibbles < 800) then
                  ValidIn <= '1';
                  RecoveredData <= RecoveredData + 1;
               end if;
               Nibbles <= Nibbles + 1;
            else
               EstimatesDone  <= '1';
               ValidIn        <= '0';
               Nibbles        <= 0;
            end if;
         else
            ValidIn        <= '0';
            EstimatesDone  <= '0';
         end if;
      end if;
   end process;

   Check_u : FireberdDrive
   PORT MAP(
      clk            => clk,
      reset          => reset,
      ce             => ce,
      MsbFirst       => '0',
      EstimatesDone  => EstimatesDone,
      ValidIn        => ValidIn,
      RecoveredData  => std_logic_vector(RecoveredData),
      ClocksPerBit   => to_slv(to_sfixed(0.251, 0, -15)),
      DataOut        => DataOut,
      ClkOut         => ClkOut
   );

end rtl;
