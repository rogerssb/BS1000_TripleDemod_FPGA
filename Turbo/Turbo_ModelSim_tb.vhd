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
-- Module Name: TurboModelSim_tb.vhd
-- Description: ModelSim wrapper for the Vivado test bench. Strictly supplies a
-- clock and control generics.
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
use ieee.numeric_std.all;
use ieee.math_real.all;
use work.fixed_pkg.all;

entity TurboModelSim_tb is
   GENERIC
   (
      Rate        : integer := 6;   -- 2, 3, 4 or 6
      Frame       : integer := 1;   -- 1, 2, 4 or 5
      ClkRate     : natural := 120 / Rate * 2;
      ClkPerBit   : std_logic_vector(15 downto 0) := std_logic_vector(to_unsigned(ClkRate * 2, 16));
      GainIn      : sfixed(3 downto -8) := to_sfixed(0.0, 3, -8); -- 0.9 @ 0.25 SigAmp rate 2 is marginal
      FILE_LOC    : string := "../";
      Iterations  : std_logic_vector(3 downto 0) := x"A"
   );
end TurboModelSim_tb;

architecture rtl of TurboModelSim_tb is

  -- Define Components
   COMPONENT TurboVivado_tb is
      GENERIC
      (
         Rate        : integer := 4;
         Frame       : integer := 1;
         ClkRate     : natural range 0 to 255;
         ClkPerBit   : std_logic_vector(15 downto 0);
         GainIn      : sfixed(3 downto -8);
         FILE_LOC    : string := "../";
         Iterations  : std_logic_vector(3 downto 0);
         ControlSel  : boolean := false
      );
      Port (
         Clk93,
         ClkPll,
         TurboClk,
         TurboData   : IN Std_logic;
         SClk,
         MOSI,
         CS,
         PD_n,
         BitClk,
         BitOut     : OUT std_logic
      );
   end component TurboVivado_tb;

   signal   Clk,
            clk2        : std_logic := '1';
   signal   SClk,
            MOSI,
            CS,
            PD_n        : std_logic;
   signal   SpiShift,
            ICS307      : std_logic_vector(131 downto 0) := (others=>'0');
   signal   SyncOut2,
            ValidOut2   : std_logic;
   signal   InputI,
            InputQ      : std_logic_vector(19 downto 0);

begin

   process begin
      wait for 5359 ps;
      Clk <= not Clk;
   end process;

   Clk2Process : process
   begin
      wait for 6 ns;
      clk2 <= not clk2;
   end process Clk2Process;

   SpiProcess : process(SClk)
   begin
      if(rising_edge(SClk)) then
         SpiShift <= SpiShift(130 downto 0) & MOSI;
      end if;
   end process;

   SpiLatch : process (CS)
   begin
      if (rising_edge(CS)) then
         ICS307 <= SpiShift;
      end if;
   end process;


   Vivado_tb : TurboVivado_tb
      GENERIC MAP
   (
      Rate        => Rate,
      Frame       => Frame,
      ClkRate     => ClkRate,
      ClkPerBit   => ClkPerBit,
      GainIn      => GainIn,
      FILE_LOC    => FILE_LOC,
      Iterations  => Iterations,
      ControlSel  => true
   )
   Port MAP(
      Clk93       => Clk,
      ClkPll      => clk2,
      TurboClk    => '0',
      TurboData   => '0',
      SClk        => SClk,
      MOSI        => MOSI,
      CS          => CS,
      PD_n        => PD_n,
      BitClk      => open,
      BitOut      => open
   );

end rtl;

