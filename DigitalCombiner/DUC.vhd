-- -------------------------------------------------------------------------------
--                   PROPRIETARY NOTICE
-- ----------------------------------------------------------------------------
-- (c) Copyright 2014 Semco Inc. All rights reserved.
--
-- This file contains Semco Inc. proprietary information. It is the
-- property of Semco Inc. and shall not be used, disclosed to others or
-- reproduced without the express written consent of Semco Inc.,
-- including, but without limitation, it is not to be used in the creation,
-- manufacture, development, or derivation of any designs, or configuration.
--
-- ----------------------------------------------------------------------------
--
-- Company:     Semco Inc.
--
-- Module Name: DUC.vhd
-- Description:   Quadrature Basebase IF Upconverter to 3/4 of clk rate
--
-- ARGUMENTS :
--
--
-- Dependencies:
--
-- ----------------------------------------------------------------------------
--                                DETAILS
-- ----------------------------------------------------------------------------
--
-- ----------------------------------------------------------------------------
--                                HISTORY
-- ----------------------------------------------------------------------------
-- 9-6-16 Initial release FZ
-- -------------------------------------------------------------


LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY DUC is
      port (
         clk,
         ce       : in  std_logic;
         realIn,
         imagIn   : in  std_logic_vector(17 downto 0);
         ifOut    : out std_logic_vector(17 downto 0)
      );
END DUC;


ARCHITECTURE rtl OF DUC IS

  -- Signals
   SIGNAL   DucCount    : unsigned(7 downto 0) := 8x"00";

   attribute MARK_DEBUG : string;
   attribute MARK_DEBUG of DucCount : signal is "TRUE";

BEGIN

   DUC_Process: process(Clk)
   begin
      if (rising_edge(Clk)) then
         if (ce = '1') then
            DucCount <= DucCount + 1;
            if (DucCount(1 downto 0) = 0) then
               ifOut <= realIn;
            elsif (DucCount(1 downto 0) = 1) then
               ifOut <= imagIn;
            elsif (DucCount(1 downto 0) = 2) then
               ifOut <= not realIn;
            else
               ifOut <= not imagIn;
            end if;
         end if;
      end if;
   end process;

END rtl;

