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

Module Name: Interpolator.vhd
Description: The interpolator uses a farrow filter.
   Farrow_filter() uses a Farrow filter to perform a fractional delay and downsample by 4.
   The filter is piece-wise parabolic with alpha = 0.5.

   In each group of 4 samples s_in[i] through s_in[i+3], the basepoint index is assumed to be
   s_in[i+1].  That is, the desired output sample lies between s_in[i+1] and s_in[i+2] (and
   it is mu away from the index i+1).  As a result, the input signal should be aligned so that
   there is an extra sample at the beginning before the sample that preceeds the desired output.

   The input sample rate is 4 samples/bit
   The output sample rate is 1 sample/bit


ARGUMENTS :


Dependencies:

----------------------------------------------------------------------------
                               DETAILS
----------------------------------------------------------------------------

----------------------------------------------------------------------------
                               HISTORY
----------------------------------------------------------------------------
1-2-17 Initial release FZ
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

ENTITY Interpolator IS
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
END Interpolator;

ARCHITECTURE rtl OF Interpolator IS



   -- CONSTANTS

   -- Signals
   SIGNAL   InArray1    : STC_Parm_Array(2 downto 0);
   SIGNAL   InArray2    : FLOAT_Array_16_18(3 downto 0);
   SIGNAL   v0,
            v1,
            v2,
            ThreeIn2,
            Sum         : FLOAT_16_18;
   SIGNAL   InterpDly   : std_logic_vector(2 downto 0);

BEGIN
   /* loop over blocks of 4 samples to perform the interpolation
   for(i = 0, j = 0; j < num_out_samples; i += 4, j++)
   {
      // compute the polynomial coefficients from the input samples
      v2 = 0.5f*(s_in[i+3] - s_in[i+2] - s_in[i+1] + s_in[i]);
      v1 = 0.5f*(-s_in[i+3] + 3*s_in[i+2] - s_in[i+1] - s_in[i]);
      v0 = s_in[i+1];

      // compute the output sample from those coefficients and the fractional delay
      s_out[j] = (mu*v2 + v1)*mu + v0;
   } */

   ClkProcess : process(clk)
   begin
      if (rising_edge(clk)) then
         if (reset) then
            InArray1    <= (others=>(others=>'0'));
            InArray2    <= (others=>(others=>'0'));
            v2          <= (others=>'0');
            v1          <= (others=>'0');
            v0          <= (others=>'0');
            Sum         <= (others=>'0');
            DataOut     <= (others=>'0');
            InterpDly   <= (others=>'0');
            ValidOut    <= '0';
         elsif (ce) then
            if (ValidIn) then
               InArray1 <= DataIn & InArray1(2 downto 1);  -- In(3) ie DataIn is the newest
               if (Interpolate) then
                  InArray2(3) <= resize(DataIn, InArray2(0));
                  InArray2(2) <= resize(InArray1(2), InArray2(0));
                  InArray2(1) <= resize(InArray1(1), InArray2(0));
                  InArray2(0) <= resize(InArray1(0), InArray2(0));
               end if;
            end if;
            InterpDly <= InterpDly(1 downto 0) & Interpolate;
            v2    <= resize(0.5 * (InArray2(3) - InArray2(2) - InArray2(1) + InArray2(0)), v2, fixed_saturate, fixed_truncate);
            v1    <= resize(0.5 * (ThreeIn2 - InArray2(3) - InArray2(1) - InArray2(0)), v1, fixed_saturate, fixed_truncate); -- 3 In(2)
            v0    <= resize(InArray2(1), v0, fixed_saturate, fixed_truncate);
            Sum   <= resize(SignedMu * v2 + v1, Sum, fixed_saturate, fixed_truncate);
            if (InterpDly(2)) then
               DataOut <= resize(Sum * SignedMu + v0, DataOut, fixed_saturate, fixed_truncate);
               ValidOut <= '1';
            else
               ValidOut <= '0';
            end if;
         end if;
      end if;
   end process ClkProcess;

   ThreeIn2 <= resize((InArray2(2) sla 1) + InArray2(2), ThreeIn2);  -- 2X + X = 3X

END rtl;
