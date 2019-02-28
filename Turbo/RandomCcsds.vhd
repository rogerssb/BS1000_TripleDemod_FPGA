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
-- Module Name: RandomCcsds.vhd
-- Description: Figure 6 of 208B Deep Space Networking Telemetry Data Decoding
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

ENTITY RandomCcsds IS
   PORT(
      Clk            : IN  std_logic;
      reset          : IN  std_logic;
      ce             : IN  std_logic;
      RandomBit      : OUT std_logic
   );
END RandomCcsds;


ARCHITECTURE rtl OF RandomCcsds IS

  -- Signals
   SIGNAL   Shifter  : std_logic_vector(7 downto 0);

BEGIN


  Shift_process: process (Clk)
  begin
      if (rising_edge(Clk)) then
         if (reset = '1') then
            Shifter  <= (others=>'1');
         elsif ce = '1' then
               Shifter <= (Shifter(7) xor Shifter(5) xor Shifter(3) xor Shifter(0)) & Shifter(7 downto 1);
         end if;
      end if;
   end process Shift_process;

   RandomBit <= Shifter(0);

END rtl;

