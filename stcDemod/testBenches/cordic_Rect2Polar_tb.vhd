-------------------------------------------------------------------------------
--                   PROPRIETARY NOTICE
-------------------------------------------------------------------------------
-- (c) Copyright 2014 RYFT System, Inc. All rights reserved.
--
-- This file contains RYFT Systems Inc. proprietary information. It is the
-- property of RYFT Systems Inc. and shall not be used, disclosed to others or
-- reproduced without the express written consent of RYFT Systems Inc.,
-- including, but without limitation, it is not to be used in the creation,
-- manufacture, development, or derivation of any designs, or configuration.
--
-------------------------------------------------------------------------------
--
-- Company:     RYFT Systems, Inc.
--
-- Module Name: cordic_Rect2PolarHog_tb.vhd
-- Description: Test bed for the various HOG modules.
--
-- Dependencies: Top level module
--
-------------------------------------------------------------------------------
--                                DETAILS
-------------------------------------------------------------------------------
-- Adjust the three generics in the entity block as desired. Frac_width is the
-- number of bits right of the decimal place, 16 = 1.16 format. I've used down
-- to 4 for very coarse phase steps. Iterations is typically equal to or slightly
-- greater than the fraction width. Out_Range_Pi generic sets the output to ±Pi for the
-- phase output, otherwise, ±4.0 if you want a phase that can wrap around. Keep
-- in mind, the phase_o is set for 3.xx or ±4 to allow for the Pi output.
-------------------------------------------------------------------------------
--                                HISTORY
-------------------------------------------------------------------------------
-- 4/17/15 Initial release FZ
-------------------------------------------------------------------------------

LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE IEEE.math_real.all;
use ieee.std_logic_textio.all;
use std.textio.all;
use work.Semco_pkg.all;
use work.fixed_generic_pkg_mod.all;

entity cordic_Rect2PolarHog_tb is
   GENERIC (
      IN_WIDTH       : natural := 16;     -- input total bit width 25.10
      IN_BINPT       : natural := 7;      -- number of fraction bits if any
      ITERATIONS     : natural := 16      -- number of cordic loops.
   );

end cordic_Rect2PolarHog_tb;

architecture tb_arch of cordic_Rect2PolarHog_tb is

  -- Define Components

component cordic_Rect2PolarHog is
   generic(
      IN_WIDTH    : positive := 16;
      IN_BINPT    : positive := 7;
      ITERATIONS  : positive := 16
   );
   port(
      clk         : in  std_logic;
      reset       : in  std_logic;
      ce          : in  std_logic;
      X_In        : in  std_logic_vector(IN_WIDTH-1 downto 0);
      Y_In        : in  std_logic_vector(IN_WIDTH-1 downto 0);
      Mag_o       : out std_logic_vector(IN_WIDTH-1 downto 0);
      Theta_o     : out std_logic_vector(8 downto 0)
   );
end component cordic_Rect2PolarHog;

-------------------------------------------------------------------------------
--                       CONSTANT DEFINITIONS
-------------------------------------------------------------------------------
constant CLOCK_PERIOD   : Time := 20 ns;
constant MAGN           : real := 250.0;

type real_array is array (natural range <>) of real;

signal reset            : std_logic := '1';
signal ce               : std_logic := '1';
signal clk              : std_logic := '0';
signal xin, yin         : sfixed(IN_WIDTH-IN_BINPT-1 downto -IN_BINPT);
signal xin_slv,
       yin_slv,
       Mag_slv          : std_logic_vector(IN_WIDTH-1 downto 0);
signal Theta_slv        : std_logic_vector(8 DOWNTO 0);
signal Mag              : ufixed(IN_WIDTH-IN_BINPT-1 downto -IN_BINPT);
signal Theta            : ufixed(8 downto 0);   -- 0 to 360
signal runSimulation    : boolean := true;
signal count            : real := 0.0;

begin

   process begin
      if runSimulation then
         wait for CLOCK_PERIOD / 2;
         clk <= not clk;
      else
         wait;
      end if;
   end process;

   xin <= to_sfixed(MAGN * cos(count * MATH_PI / 180.0), xin);
   yin <= to_sfixed(MAGN * sin(count * MATH_PI / 180.0), yin);
   xin_slv <= to_slv(xin);
   yin_slv <= to_slv(yin);
   Theta <= to_ufixed(Theta_slv, Theta);
   Mag <= to_ufixed(Mag_slv, Mag);


   stimulus : process
      -- Local Control Procedures
      procedure doReset is begin
         reset <= '1';
         wait for 51 ns;
         reset <= '0';
      end doReset;

      procedure doStop is begin
         runSimulation <= false;
         wait;
      end doStop;

   begin
      doReset;
      count <= 0.0;
      while (count < 4003.0) loop
         wait until rising_edge(clk);
         count <= count + 0.1;
      end loop;
      wait for 500 ns;
      doStop;
   end process stimulus;

   dut : cordic_Rect2PolarHog
   generic map (
      IN_WIDTH    => IN_WIDTH,
      IN_BINPT    => IN_BINPT,
      ITERATIONS  => ITERATIONS
   )
   port map (
      clk         => clk,
      reset       => reset,
      ce          => ce,
      X_In        => xin_slv,
      Y_In        => yin_slv,
      Mag_o       => Mag_slv,
      Theta_o     => Theta_slv
   );

end tb_arch;
-------------
-- CVS Info:
-------------
-- $Source: $
-- $Revision: $
-- $Date: $
-- $Author: $
-- $Log: $
