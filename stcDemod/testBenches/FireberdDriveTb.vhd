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
      MsbFirst,
      ValidIn        : IN  std_logic;
      RecoveredData  : IN  SLV4;
      ClocksPerBit   : IN  sfixed(0 downto -15);
      DataOut,
      ClkOut         : OUT std_logic
      );
   END COMPONENT FireberdDrive;

-------------------------------------------------------------------------------
--                       CONSTANT DEFINITIONS
-------------------------------------------------------------------------------

   signal   reset                : std_logic := '1';
   signal   clk, clk10           : std_logic := '1';
   signal   ce                   : std_logic := '1';

   SIGNAL   ValidIn,
            TrellisOutEn,
            PrnError0,
            PrnError1,
            PrnError2,
            PrnError3,
            DataOut,
            ClkOut,
            ClkDelay          : std_logic := '0';
   SIGNAL   RecoveredData     : unsigned(3 downto 0) := x"5";
   SIGNAL   Count             : natural range 0 to 3;
   SIGNAL   Shifter,
            PrnShift          : SLV18;
   SIGNAL   TrellisBits       : SLV4;

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
      wait for 20 ns;
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

         if (reset) then
            Shifter <= 18x"3FFFF";
         else
            Shifter <= Shifter(16 downto 0) & xor(Shifter(14 downto 13));
            if (Count = 3) then
               TrellisBits <= Shifter(3 downto 0);
               TrellisOutEn <= '1';
            else
               TrellisOutEn <= '0';
            end if;
         end if;

         if (TrellisOutEn) then
            PrnShift <= PrnShift(13 downto 0) & TrellisBits;
            PrnError0 <= PrnShift(14) xor PrnShift(13) xor TrellisBits(3);
            PrnError1 <= PrnShift(13) xor PrnShift(12) xor TrellisBits(2);
            PrnError2 <= PrnShift(12) xor PrnShift(11) xor TrellisBits(1);
            PrnError3 <= PrnShift(11) xor PrnShift(10) xor TrellisBits(0);
         end if;

      end if;
   end process;

   Check_u : FireberdDrive
   PORT MAP(
      clk            => clk,
      reset          => reset,
      ce             => ce,
      MsbFirst       => '0',
      ValidIn        => ValidIn,
      RecoveredData  => std_logic_vector(RecoveredData),
      ClocksPerBit   => to_sfixed(0.25, 0, -15),
      DataOut        => DataOut,
      ClkOut         => ClkOut
   );

end rtl;
