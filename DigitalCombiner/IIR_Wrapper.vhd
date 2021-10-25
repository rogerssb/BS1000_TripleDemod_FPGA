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

Module Name: IIR_Wrapper.vhd
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

ENTITY IIR_Wrapper IS
   PORT(
      clk            : IN STD_LOGIC;
      gateway_in     : IN STD_LOGIC_VECTOR(23 DOWNTO 0);
      gateway_out1   : OUT STD_LOGIC_VECTOR(41 DOWNTO 0)
   );
END IIR_Wrapper;


ARCHITECTURE rtl OF IIR_Wrapper IS

COMPONENT iir_filter_0
  PORT (
    gateway_in : IN STD_LOGIC_VECTOR(23 DOWNTO 0);
    clk : IN STD_LOGIC;
    gateway_out1 : OUT STD_LOGIC_VECTOR(41 DOWNTO 0)
  );
END COMPONENT;

BEGIN

   IIR : iir_filter_0
      PORT MAP (
         clk           => clk,
         gateway_in    => gateway_in,
         gateway_out1  => gateway_out1
   );

END rtl;

