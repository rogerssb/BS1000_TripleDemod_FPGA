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

Module Name: ModuleName.vhd
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
use work.fixed_pkg.all;
USE work.Semco_pkg.ALL;

ENTITY DualAgc IS
      GENERIC(
         DATA_WIDTH  : positive := 18;
         FFT_LENGTH  : positive := 1024
      );
   PORT(
      MonClk         : IN  std_logic;
      RealIn,
      ImagIn         : IN  float_1_18;
      RealGained,
      ImagGained     : OUT float_1_18
   );
END DualAgc;


ARCHITECTURE rtl OF DualAgc IS

  -- Signals
   signal   RealSq,
            ImagSq,
            SumSq          : sfixed(1 downto -34) := (others=>'0');
   signal   GainInt        : sfixed(4 downto -13) := (others=>'0');


BEGIN

  Delay_process: process (MonClk)
   begin
      if (rising_edge(MonClk)) then
         RealGained <= resize(RealIn * GainInt, RealGained);
         ImagGained <= resize(ImagIn * GainInt, ImagGained);
         RealSq     <= resize(RealGained * RealGained, RealSq);
         ImagSq     <= resize(ImagGained * ImagGained, ImagSq);
         SumSq      <= resize(0.25 - (RealSq + ImagSq), SumSq);
         GainInt    <= resize(GainInt + (SumSq sra 2), GainInt) when not SumSq(1) else resize(GainInt + SumSq, GainInt);
      end if;
   end process Delay_process;

END rtl;

