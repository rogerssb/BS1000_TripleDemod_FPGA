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
-- Module Name: ComputeMetric_tb.vhd
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
-- 4/17/15 Initial release FZ
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_textio.all;
use ieee.numeric_std.all;
use ieee.math_real.all;
library std;
use std.textio.all;
use work.Semco_pkg.all;
use work.fixed_generic_pkg_mod.all;

entity ComputeMetric_tb is
end ComputeMetric_tb;

architecture rtl of ComputeMetric_tb is

  -- Define Components

   COMPONENT ComputeMetric is
      port (
         clk,
         ce,
         reset,
         StartIn        : IN  std_logic;
         IndexX,
         IndexY         : IN  integer range 0 to SEARCH_LENGTH;
         Xr,
         Xi             : IN  FLOAT_1_LP;
         Result         : OUT FLOAT_256_HP;
         Done           : OUT Std_logic
      );
   end COMPONENT ComputeMetric;

   COMPONENT ReadGoldRef IS
      GENERIC (
         FILE_NAME         : string := "../test_data/file.txt";
         NUM_VALUES        : natural := 1;         -- number of values per line
         DATA_TYPE         : GoldDataType := Bools; -- data type, std_logic 0/1, hex int/uint or double
         OUT_WIDTH         : natural := 32;        -- total width of each value
         OUT_BINPT         : integer := -31        -- number of fraction bits if any. If none, set to 0
      );
      PORT(
         clk               : IN  std_logic;
         reset             : IN  std_logic;
         ce                : IN  std_logic;
         OutputData        : OUT vector_of_slvs(0 to NUM_VALUES-1)(OUT_WIDTH-1 downto 0);
         Done              : OUT std_logic
      );
   END COMPONENT ReadGoldRef;

-------------------------------------------------------------------------------
--                       CONSTANT DEFINITIONS
-------------------------------------------------------------------------------

   signal   reset                : std_logic := '1';
   signal   clk                  : std_logic := '1';
   signal   ce                   : std_logic := '1';

   SIGNAL   StartIn,
            Done              : std_logic := '0';
   SIGNAL   Xr,
            Xi                : FLOAT_1_LP;
   SIGNAL   Result            : FLOAT_256_HP;
   SIGNAL   xx, yy            : integer range 0 to SEARCH_LENGTH;
   SIGNAL   Dones             : UINT8 := (others=>'1');
   SIGNAL   VarsReadR,
            VarsReadI         : vector_of_slvs(0 to 0)(FLOAT_1_LP'length-1 downto 0);
  signal    Count,
            ErrorCount        : natural := 0;

begin

   process begin
      wait for 500 ps;
      if (Dones = 255) then
         if ( (abs(226.324 - Result) > 0.001) ) then
            report "Simulation Failed" severity failure;
         else
            report "Simulation Passed" severity note;
         end if;
         wait;
      else
         clk <= not clk;
      end if;
   end process;

   reset_process : process begin
      wait for 2 ns;
      reset <= '0';
   end process reset_process;

   reg_process : process (clk)
   begin
      if (rising_edge(clk)) then
         if (reset) then
            Count <= 0;
         else
            if (Count < 14999) then
               Count <= Count + 1;
            else
               Count <= 0;
            end if;
         end if;
      end if;
   end process reg_process;

   RealData : ReadGoldRef
   GENERIC MAP(
      FILE_NAME         => "test_data\TimeEstGoldXr.txt",
      NUM_VALUES        => 1,
      DATA_TYPE         => SFix,
      OUT_WIDTH         => FLOAT_1_LP'length,
      OUT_BINPT         => FLOAT_1_LP'right
   )
   PORT MAP(
      clk               => clk,
      reset             => reset,
      ce                => '1',
      OutputData        => VarsReadR,
      Done              => Dones(7)
   );

   ImagData : ReadGoldRef
   GENERIC MAP(
      FILE_NAME         => "test_data\TimeEstGoldXi.txt",
      NUM_VALUES        => 1,
      DATA_TYPE         => SFix,
      OUT_WIDTH         => FLOAT_1_LP'length,
      OUT_BINPT         => FLOAT_1_LP'right
   )
   PORT MAP(
      clk               => clk,
      reset             => reset,
      ce                => '1',
      OutputData        => VarsReadI,
      Done              => Dones(6)
   );

   StartIn     <=  '1' when (Count = 0) else '0';
   Xr <= to_sfixed(VarsReadR(0), Xr);
   Xi <= to_sfixed(VarsReadI(0), Xi);
   xx <= 32;
   yy <= 32;

   CM_u : ComputeMetric
      port map(
         clk         => clk,
         ce          => ce,
         reset       => reset,
         StartIn     => StartIn,
         Xr          => Xr,
         Xi          => Xi,
         IndexX      => xx,
         IndexY      => yy,
         Result      => Result,
         Done        => Dones(4)
      );

end rtl;
