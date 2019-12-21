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
         BitRate_r         : IN  real;
         DataOut_o,
         ClkOut_o,
         BS_LED,
         DemodLED : OUT std_logic
      );
   end COMPONENT Brik1_Hw_tb;


  -- Signals
  signal Clk,
         RdAddrEq,
         RdAddrDly         : std_logic := '0';
  signal BitRate,
         Power0In,
         Power1In,
         NoiseIn           : sfixed(0 downto -17);
  signal FrameCnt          : natural := 0;
  signal BitRate_r         : real := 20.0; --9.33;

BEGIN

   process begin
      wait for 5 nS;
      if (FrameCnt < 30) then
         Clk <= not Clk;
      end if;
   end process;


   PowerProc : process(Clk)
   begin
      if (rising_edge(Clk)) then
         RdAddrEq <= '1' when (<< signal Brik1.RdAddr_i : natural range 0 to FRAME_LENGTH_4 >> = 13100) else '0';
         RdAddrDly <= RdAddrEq;
         if (<< signal Brik1.Reset  : std_logic >>) then
            Power0In <= to_sfixed(0.240, Power0In);
            Power1In <= to_sfixed(0.240, Power1In);
            NoiseIn  <= to_sfixed(0.0, NoiseIn);
            BitRate  <= to_sfixed(BitRate_r*4.0*1.04/93.3, BitRate);    -- 41.6 is 10Mb times 4 plus 4% overhead for pilot
         elsif (RdAddrEq and not RdAddrDly) then
 /*          case (FrameCnt) is
            when 0 =>
               Power0In <= to_sfixed(0.000, Power0In);
               Power1In <= to_sfixed(0.240, Power1In);
            when 1 =>
               Power0In <= to_sfixed(0.240, Power0In);
               Power1In <= to_sfixed(0.000, Power1In);
            when others =>
               Power1In <= resize(Power1In + 0.02, Power1In);
            end case;
*/            FrameCnt <= FrameCnt + 1;
         end if;
      end if;
   end process;


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
      BitRate_r => BitRate_r,
      BS_LED   => open,
      DemodLED => open
   );


END rtl;

