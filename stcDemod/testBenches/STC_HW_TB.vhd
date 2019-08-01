/*-------------------------------------------------------------------------------
                  PROPRIETARY NOTICE
----------------------------------------------------------------------------
(c) Copyright 2014 Semco Inc. All rights reserved.

This file contains Semco Inc. proprietary information. It is the
property of Semco Inc. and shall not be used, disclosed to others or
reproduced without the express written consent of Semco Inc.,
including, but without limitation, it is not to be used in the creation,
manufacture, development, or derivation of any designs, or configuration.

----------------------------------------------------------------------------

Company:     Semco Inc.

Module Name: STC_HW_TB.vhd
Description:

ARGUMENTS :


Dependencies:

----------------------------------------------------------------------------
                               DETAILS
----------------------------------------------------------------------------

----------------------------------------------------------------------------
                               HISTORY
----------------------------------------------------------------------------
9-6-16 Initial release FZ
-------------------------------------------------------------
*/

LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
library std;
use std.textio.all;
use work.fixed_pkg.all;
USE IEEE.math_real.all;
use work.Semco_pkg.ALL;

ENTITY STC_HW_TB IS
END STC_HW_TB;


ARCHITECTURE rtl OF STC_HW_TB IS

   COMPONENT Brik1_Hw_tb is
      GENERIC (SIM_MODE : boolean := false);
      PORT (
         Clk93In           : IN  std_logic;
         BitRateIn,
         Power0In,
         Power1In,
         NoiseIn           : IN  sfixed(0 downto -17);
         PilotSyncOffset   : IN  SLV12;
         DataOut_o,
         ClkOut_o,
         BS_LED,
         DemodLED : OUT std_logic
      );
   end COMPONENT Brik1_Hw_tb;


  -- Signals
  signal Clk               : std_logic := '0';
  signal BitRate,
         Power0In,
         Power1In,
         NoiseIn           : sfixed(0 downto -17);
   signal PilotSyncOffset  : SLV12 := x"800";    -- 600 for 4.6mB, 800 for 10mB, A00 for 20mB
   signal   ShiftIn, ShiftOut : std_logic_vector(10 downto 0) := 11x"7ff";

BEGIN

   process begin
      wait for 5 nS;
      Clk <= not Clk;
   end process;

   Power0In <= to_sfixed(0.40, Power0In);
   Power1In <= to_sfixed(0.00, Power1In);
   NoiseIn  <= to_sfixed(0.0, NoiseIn);
   BitRate  <= to_sfixed(19.33*4*1.04/93.3, BitRate);    -- 41.6 is 10Mb times 4 plus 4% overhead for pilot

   Brik1 : Brik1_Hw_tb
   GENERIC MAP(
      SIM_MODE => true
   )
   PORT MAP(
      Clk93In  => Clk,
      Power0In => Power0In,
      Power1In => Power1In,
      NoiseIn  => NoiseIn,
      BitRateIn => BitRate,
      PilotSyncOffset => PilotSyncOffset,
      BS_LED   => open,
      DemodLED => open
   );

END rtl;

