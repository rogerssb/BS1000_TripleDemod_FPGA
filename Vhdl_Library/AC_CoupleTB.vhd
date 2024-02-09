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

Module Name: AC_CoupleTB.vhd
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
USE IEEE.math_real.ALL;
use work.fixed_pkg.all;
USE work.Semco_pkg.ALL;

ENTITY AC_CoupleTB IS
   END AC_CoupleTB;


ARCHITECTURE rtl OF AC_CoupleTB IS

   COMPONENT OffsetNCO IS
      PORT (
         aclk : IN STD_LOGIC;
         aresetn : IN STD_LOGIC;
         s_axis_config_tvalid : IN STD_LOGIC;
         s_axis_config_tready : OUT STD_LOGIC;
         s_axis_config_tdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
         m_axis_data_tvalid : OUT STD_LOGIC;
         m_axis_data_tready : IN STD_LOGIC;
         m_axis_data_tdata : OUT STD_LOGIC_VECTOR(47 DOWNTO 0)
      );
   END COMPONENT;

   COMPONENT AC_Couple IS
      GENERIC(
         OFFSET      : natural   := 0;
         DATA_WIDTH  : positive  := 18
      );
      PORT(
         clk            : IN  std_logic;
         reset          : IN  std_logic;
         ce             : IN  std_logic;
         timeConstant   : IN  SLV4;
         input          : IN  std_logic_vector(DATA_WIDTH-1 downto 0);
         output         : OUT std_logic_vector(DATA_WIDTH-1 downto 0)
      );
   END COMPONENT AC_Couple;

   signal   Clk,
            Reset             : std_logic := '0';
   signal   PhaseInc          : std_logic_vector(31 downto 0);
   signal   NcoData           : std_logic_vector(47 downto 0);
   signal   Ratio             : real;

BEGIN

   process begin
      wait for 10 ns;   -- run ac couple at 46MHz rate
         Clk <= not Clk;
   end process;

   Ratio    <= 2.0**32 * 10.0 / 46.6e6;
   PhaseInc <= std_logic_vector(to_unsigned(integer(Ratio),32));

   NCO : OffsetNCO
      PORT MAP (
         aclk                 => Clk,
         aresetn              => '1',
         s_axis_config_tvalid => '1',
         s_axis_config_tdata  => PhaseInc,
         m_axis_data_tready   => '1',
         s_axis_config_tready => open,
         m_axis_data_tvalid   => open,
         m_axis_data_tdata    => NcoData
      );

   ACcouple : AC_Couple
      GENERIC MAP (
         OFFSET   => 4
      )
      PORT map (
      clk            => Clk,
      reset          => Reset,
      ce             => '1',
      timeConstant   => x"f",
      input          => NcoData(18 downto 1),
      output         => open
   );


END rtl;

