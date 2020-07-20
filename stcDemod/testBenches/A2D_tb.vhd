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
-- Module Name: A2D_tb.vhd
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
-- 9/17/16 Initial release FZ
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_textio.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

entity A2D_tb is
end A2D_tb;

architecture rtl of A2D_tb is

  -- Define Components
   COMPONENT STC_A2D IS
      PORT(
   --      adc_clko_p,
   --      adc_clk_n,
         adc_dco_p,
         adc_dco_n,
         reset_in,
         South             : IN  std_logic;
         GPIO_DipSw        : IN  std_logic_vector(3 downto 0);
         adc_data_in_p,
         adc_data_in_n     : IN  std_logic_vector(7 downto 0); -- ddr input from 16 bit A/D
         Pass,
         Fail,
         Blink,
         SpiCs_n,
         SpiClk            : OUT std_logic;
         SpiIO             : INOUT std_logic
      );
   END COMPONENT STC_A2D;
-------------------------------------------------------------------------------
--                       CONSTANT DEFINITIONS
-------------------------------------------------------------------------------

   signal   reset_in          : std_logic := '1';
   signal   adc_dco_p         : std_logic := '1';
   signal   ce                : std_logic := '1';
   SIGNAL   South,
            Pass,
            Fail,
            Blink             : std_logic;
   SIGNAL   GPIO_DipSw        : std_logic_vector(3 downto 0);
   SIGNAL   AdcOut            : std_logic_vector(15 downto 0);
   SIGNAL   adc_data_in_p,
            adc_data_in_n     : std_logic_vector(7 downto 0);
   SIGNAL   Count100          : std_logic_vector(9 downto 0);
   SIGNAL   Count             : unsigned(9 downto 0) := (others=>'0');
   SIGNAL   Data              : unsigned(15 downto 0) := x"aa55";
   SIGNAL   SpiShift,
            SpiReg            : std_logic_vector(23 downto 0);
   SIGNAL   SpiClk,
            SpiCs_n,
            SpiIO,
            adc_dco_n          : std_logic;

begin

   process begin
      wait for 4.8 ns;
      adc_dco_p <= '1';
      wait for 0.2 ns;     -- bus skew is ±200pS
      adc_data_in_p <= Data(15) & Data(13) & Data(11) & Data(9) & Data(7) & Data(5) & Data(3) & Data(1);
      wait for 4.8 ns;
      adc_data_in_p <= Data(14) & Data(12) & Data(10) & Data(8) & Data(6) & Data(4) & Data(2) & Data(0);
      wait for 0.2 ns;
      adc_dco_p <= '0';
   end process;

   adc_dco_n <= not adc_dco_p;

   reset_process : process begin
      wait for 20 ns;
      reset_in <= '0';
   end process reset_process;

   process(adc_dco_p)
   begin
      if (rising_edge(adc_dco_p)) then
         Count <= Count + 1;
         Data  <= Data + x"1111";
      end if;
   end process;

   adc_data_in_n  <= not adc_data_in_p;
   Count100       <= std_logic_vector(Count / 100);
   GPIO_DipSw     <= Count100(3 downto 0);
   South          <= '1' when (Count mod 100 = 99) else '0';

   SpiProcess : process(SpiClk)
   begin
      if (reset_in = '1') then
         SpiShift <= x"000000";
      elsif (rising_edge(SpiClk)) then
         if (SpiCs_n = '0') then
            SpiShift <= SpiShift(22 downto 0) & SpiIO;
         end if;
      end if;
   end process SpiProcess;

   SpiLatch : process(SpiCs_n)
   begin
      if (reset_in = '1') then
         SpiReg <= x"000000";
       elsif(rising_edge(SpiCs_n)) then
         SpiReg <= SpiShift;
      end if;
   end process SpiLatch;

   dut : STC_A2D
      PORT MAP(
         adc_dco_p      => adc_dco_p,
         adc_dco_n      => adc_dco_n,
         reset_in       => reset_in,
         South          => South,
         GPIO_DipSw     => GPIO_DipSw,
         adc_data_in_p  => adc_data_in_p,
         adc_data_in_n  => adc_data_in_n,
         Pass           => Pass,
         Fail           => Fail,
         Blink          => Blink,
         SpiCs_n        => SpiCs_n,
         SpiClk         => SpiClk,
         SpiIO          => SpiIO
      );

end rtl;
