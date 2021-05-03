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
-- Module Name: DigitalCombiner_tb.vhd
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
use ieee.numeric_std.all;
use work.fixed_pkg.all;
use work.semco_pkg.all;

entity DigitalCombiner_tb is
end DigitalCombiner_tb;

architecture rtl of DigitalCombiner_tb is

  -- Define Components
   component semcoDemodTopDemod IS
      PORT(
         adc0_overflow,
         adc0Clk,
         amAdcDataIn,
         spiCSn,
         spiDataIn,
         spiClk,
         spiFlashMISO,
         pll0_OUT1,
         pll1_OUT1,
         FPGA_ID0,
         FPGA_ID1          : IN std_logic;
         PrevData_p,
         PrevData_n,
         NextData_p,
         NextData_n      : OUT std_logic_vector(4 downto 0);
         NextClk_p,
         NextClk_n,
         PrevClk_p,
         PrevClk_n       : OUT std_logic;
         adc0            : IN  std_logic_vector(13 downto 0);
         video0InSelect,
         video1InSelect,
         video1OutSelect,
         video0OutSelect   : OUT std_logic_vector(1 downto 0);
         dac0_d,
         dac1_d            : OUT std_logic_vector(13 downto 0);
         adc01_powerDown,
         amAdcClk,
         amAdcCSn,
         lockLed0n,
         lockLed1n,
         Sw50Ohm,
         spiFlashCSn,
         spiFlashMOSI,
         pll0_REF,
         pll1_REF,
         ch0ClkOut,
         ch0DataOut,
         ch1ClkOut,
         ch1DataOut,
         ch2ClkOut,
         ch2DataOut,
         ch3ClkOut,
         ch3DataOut,
         DQMOut,
         sdiOut,
         amDacCSn,
         amDacClk,
         amDacDataOut,
         dac0_clk,
         dac1_clk,
         dac_rst,
         dac0_nCs,
         dac1_nCs,
         dac_sclk,
         dac_sdio          : OUT std_logic;
         spiDataOut        : INOUT std_logic
      );
   END component semcoDemodTopDemod;

   component semcoDemodTopComb IS
      PORT(
         adc0_overflow,
         adc0Clk,
         amAdcDataIn,
         spiCSn,
         spiDataIn,
         spiClk,
         spiFlashMISO,
         pll0_OUT1,
         pll1_OUT1,
         FPGA_ID0,
         FPGA_ID1          : IN std_logic;
         PrevData_p,
         PrevData_n,
         NextData_p,
         NextData_n        : IN  std_logic_vector(4 downto 0);
         NextClk_p,
         NextClk_n,
         PrevClk_p,
         PrevClk_n         : IN  std_logic;
         adc0              : IN  std_logic_vector(13 downto 0);
         SideCar           : INOUT std_logic_vector(40 downto 1);
         video0InSelect,
         video1InSelect,
         video1OutSelect,
         video0OutSelect   : OUT std_logic_vector(1 downto 0);
         dac0_d,
         dac1_d            : OUT std_logic_vector(13 downto 0);
         adc01_powerDown,
         amAdcClk,
         amAdcCSn,
         lockLed0n,
         lockLed1n,
         Sw50Ohm,
         spiFlashCSn,
         spiFlashMOSI,
         pll0_REF,
         pll1_REF,
         ch0ClkOut,
         ch0DataOut,
         ch1ClkOut,
         ch1DataOut,
         ch2ClkOut,
         ch2DataOut,
         ch3ClkOut,
         ch3DataOut,
         DQMOut,
         sdiOut,
         amDacCSn,
         amDacClk,
         amDacDataOut,
         dac0_clk,
         dac1_clk,
         dac_rst,
         dac0_nCs,
         dac1_nCs,
         dac_sclk,
         dac_sdio          : OUT std_logic;
         spiDataOut        : INOUT std_logic
      );
   END component semcoDemodTopComb;


   TYPE vector_of_slvs     IS ARRAY (NATURAL RANGE <>) OF std_logic_vector;
   constant PORTS       : integer := 5;
   constant CH1DELAY    : time := 00 ps;
   constant CH2DELAY    : time := 00 ps;

   signal   clk,
            reset,
            XX             : std_logic := '1';
   signal   resetShift     : uint8 := x"ff";
   signal   adc0           : sfixed(13 downto 0) := (others=>'0');
   signal   PrevData_p,
            PrevData_n,
            NextData_p,
            NextData_n,
            PcbDelayIn1_p,
            PcbDelayIn1_n,
            PcbDelayIn2_p,
            PcbDelayIn2_n,
            CmbDataIn1_p,
            CmbDataIn1_n,
            CmbDataIn2_p,
            CmbDataIn2_n      : std_logic_vector(PORTS-1 downto 0);
   signal   CmbClkIn1_p,
            CmbClkIn1_n,
            CmbClkIn2_p,
            CmbClkIn2_n,
            PrevClk_p,
            PrevClk_n,
            NextClk_p,
            NextClk_n       : std_logic;

begin

   process begin
      wait for 5.35 ns;
      clk <= not clk;
   end process;

   process begin
      wait for 0.17 ns;
      XX <= '0';
      wait for 0.90 ns;
      XX <= '0';
   end process;

   ResetProc : process (clk) begin
      if (rising_edge(clk)) then
         resetShift <= resetShift(6 downto 0) & '0';
         reset <= resetShift(7);
         if (not reset) then
            adc0 <= resize(adc0 + 1, adc0);

         end if;
      end if;
   end process;

   Ch1K7 : semcoDemodTopDemod
      PORT MAP(
         adc0_overflow		   => '0',
         adc0Clk              => clk,
         amAdcDataIn          => '0',
         spiCSn               => reset,
         spiDataIn            => '0',
         spiClk               => '0',
         spiFlashMiso         => '0',
         pll0_OUT1            => '0',
         pll1_OUT1            => '0',
         FPGA_ID0             => '0',
         FPGA_ID1             => '0',
         adc0                 => to_slv(adc0),
         video0InSelect       => open,
         video1InSelect       => open,
         video1OutSelect      => open,
         video0OutSelect      => open,
         dac0_d               => open,
         dac1_d               => open,
         adc01_powerDown      => open,
         amAdcClk             => open,
         amAdcCSn             => open,
         spiDataOut           => open,
         lockLed0n            => open,
         lockLed1n            => open,
         Sw50Ohm              => open,
         pll0_REF             => open,
         pll1_REF             => open,
         ch0ClkOut            => open,
         ch0DataOut           => open,
         ch1ClkOut            => open,
         ch1DataOut           => open,
         ch2ClkOut            => open,
         ch2DataOut           => open,
         ch3ClkOut            => open,
         ch3DataOut           => open,
         DQMOut               => open,
         sdiOut               => open,
         amDacCSn             => open,
         amDacClk             => open,
         amDacDataOut         => open,
         dac0_clk             => open,
         dac1_clk             => open,
         dac_rst              => open,
         dac0_nCs             => open,
         dac1_nCs             => open,
         dac_sclk             => open,
         dac_sdio             => open,
         PrevData_p           => PrevData_p,
         PrevData_n           => PrevData_n,
         PrevClk_p            => PrevClk_p,
         PrevClk_n            => PrevClk_n,
         NextData_p           => open,
         NextData_n           => open,
         NextClk_p            => open,
         NextClk_n            => open
   );

   Ch2K7 : semcoDemodTopDemod
      PORT MAP(
         adc0_overflow		   => '0',
         adc0Clk              => clk,
         amAdcDataIn          => '0',
         spiCSn               => reset,
         spiDataIn            => '0',
         spiClk               => '0',
         spiFlashMiso         => '0',
         pll0_OUT1            => '0',
         pll1_OUT1            => '0',
         FPGA_ID0             => '1',
         FPGA_ID1             => '0',
         adc0                 => (others=>'0'),
         video0InSelect       => open,
         video1InSelect       => open,
         video1OutSelect      => open,
         video0OutSelect      => open,
         dac0_d               => open,
         dac1_d               => open,
         adc01_powerDown      => open,
         amAdcClk             => open,
         amAdcCSn             => open,
         spiDataOut           => open,
         lockLed0n            => open,
         lockLed1n            => open,
         Sw50Ohm              => open,
         pll0_REF             => open,
         pll1_REF             => open,
         ch0ClkOut            => open,
         ch0DataOut           => open,
         ch1ClkOut            => open,
         ch1DataOut           => open,
         ch2ClkOut            => open,
         ch2DataOut           => open,
         ch3ClkOut            => open,
         ch3DataOut           => open,
         DQMOut               => open,
         sdiOut               => open,
         amDacCSn             => open,
         amDacClk             => open,
         amDacDataOut         => open,
         dac0_clk             => open,
         dac1_clk             => open,
         dac_rst              => open,
         dac0_nCs             => open,
         dac1_nCs             => open,
         dac_sclk             => open,
         dac_sdio             => open,
         PrevData_p           => open,
         PrevData_n           => open,
         PrevClk_p            => open,
         PrevClk_n            => open,
         NextData_p           => NextData_p,
         NextData_n           => NextData_n,
         NextClk_p            => NextClk_p,
         NextClk_n            => NextClk_n
   );

   CmbK7 : semcoDemodTopComb
      PORT MAP(
         adc0_overflow		   => '0',
         adc0Clk              => clk,
         amAdcDataIn          => '0',
         spiCSn               => reset,
         spiDataIn            => '0',
         spiClk               => '0',
         spiFlashMiso         => '0',
         pll0_OUT1            => '0',
         pll1_OUT1            => '0',
         FPGA_ID0             => '0',
         FPGA_ID1             => '1',
         adc0                 => to_slv(adc0),
         SideCar              => open,
         video0InSelect       => open,
         video1InSelect       => open,
         video1OutSelect      => open,
         video0OutSelect      => open,
         dac0_d               => open,
         dac1_d               => open,
         adc01_powerDown      => open,
         amAdcClk             => open,
         amAdcCSn             => open,
         spiDataOut           => open,
         lockLed0n            => open,
         lockLed1n            => open,
         Sw50Ohm              => open,
         pll0_REF             => open,
         pll1_REF             => open,
         ch0ClkOut            => open,
         ch0DataOut           => open,
         ch1ClkOut            => open,
         ch1DataOut           => open,
         ch2ClkOut            => open,
         ch2DataOut           => open,
         ch3ClkOut            => open,
         ch3DataOut           => open,
         DQMOut               => open,
         sdiOut               => open,
         amDacCSn             => open,
         amDacClk             => open,
         amDacDataOut         => open,
         dac0_clk             => open,
         dac1_clk             => open,
         dac_rst              => open,
         dac0_nCs             => open,
         dac1_nCs             => open,
         dac_sclk             => open,
         dac_sdio             => open,
         PrevData_p           => CmbDataIn1_p,
         PrevData_n           => CmbDataIn1_n,
         PrevClk_p            => CmbClkIn1_p,
         PrevClk_n            => CmbClkIn1_n,
         NextData_p           => CmbDataIn2_p,
         NextData_n           => CmbDataIn2_n,
         NextClk_p            => CmbClkIn2_p,
         NextClk_n            => CmbClkIn2_n
   );

PcbDelayIn1_p <= (others=>'X') when (XX = 'X') else PrevData_p;
PcbDelayIn1_n <= (others=>'X') when (XX = 'X') else PrevData_n;
PcbDelayIn2_p <= (others=>'X') when (XX = 'X') else NextData_p;
PcbDelayIn2_n <= (others=>'X') when (XX = 'X') else NextData_n;

CmbDataIn1_p(0) <= PcbDelayIn1_p(0) after CH1DELAY;
CmbDataIn1_n(0) <= PcbDelayIn1_n(0) after CH1DELAY;
CmbDataIn1_p(1) <= PcbDelayIn1_p(1) after CH1DELAY;
CmbDataIn1_n(1) <= PcbDelayIn1_n(1) after CH1DELAY;
CmbDataIn1_p(2) <= PcbDelayIn1_p(2) after CH1DELAY;
CmbDataIn1_n(2) <= PcbDelayIn1_n(2) after CH1DELAY;
CmbDataIn1_p(3) <= PcbDelayIn1_p(3) after CH1DELAY;
CmbDataIn1_n(3) <= PcbDelayIn1_n(3) after CH1DELAY;
CmbDataIn1_p(4) <= PcbDelayIn1_p(4) after CH1DELAY;
CmbDataIn1_n(4) <= PcbDelayIn1_n(4) after CH1DELAY;
CmbClkIn1_p     <= PrevClk_p        after CH1DELAY;
CmbClkIn1_n     <= PrevClk_n        after CH1DELAY;

CmbDataIn2_p(0) <= PcbDelayIn2_p(0) after CH2DELAY;
CmbDataIn2_n(0) <= PcbDelayIn2_n(0) after CH2DELAY;
CmbDataIn2_p(1) <= PcbDelayIn2_p(1) after CH2DELAY;
CmbDataIn2_n(1) <= PcbDelayIn2_n(1) after CH2DELAY;
CmbDataIn2_p(2) <= PcbDelayIn2_p(2) after CH2DELAY;
CmbDataIn2_n(2) <= PcbDelayIn2_n(2) after CH2DELAY;
CmbDataIn2_p(3) <= PcbDelayIn2_p(3) after CH2DELAY;
CmbDataIn2_n(3) <= PcbDelayIn2_n(3) after CH2DELAY;
CmbDataIn2_p(4) <= PcbDelayIn2_p(4) after CH2DELAY;
CmbDataIn2_n(4) <= PcbDelayIn2_n(4) after CH2DELAY;
CmbClkIn2_p     <= NextClk_p        after CH2DELAY;
CmbClkIn2_n     <= NextClk_n        after CH2DELAY;


end rtl;
