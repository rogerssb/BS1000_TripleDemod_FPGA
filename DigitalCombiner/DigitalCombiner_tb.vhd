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

entity DigitalCombiner_tb is
end DigitalCombiner_tb;

architecture rtl of DigitalCombiner_tb is

  -- Define Components
   component DC_DemodTop IS
   GENERIC (
      PORTS       : natural := 5
      );
      PORT(
         adc0_overflow,
         adc0Clk,
         MonOvf,
         MonClk,
         BS_Ovf,
         BS_Clk,
         amAdcDataIn,
         spiCSn,
         spiDataOut,
         spiClk,
         pll0_OUT1,
         pll1_OUT1,
         FPGA_ID0,
         FPGA_ID1,
         BS_PllOut         : IN std_logic;
         PrevData_p,
         PrevData_n,
         NextData_p,
         NextData_n      : OUT std_logic_vector(PORTS-1 downto 0);
         NextClk_p,
         NextClk_n,
         PrevClk_p,
         PrevClk_n       : OUT std_logic;
         adc0,
         MonData,
         BS_Data           : IN  std_logic_vector(13 downto 0);
         video0InSelect,
         video1InSelect,
         video1OutSelect,
         video0OutSelect   : OUT std_logic_vector(1 downto 0);
         VidSel            : OUT std_logic_vector(2 downto 0);
         dac0_d,
         dac1_d            : OUT std_logic_vector(13 downto 0);
         ADC_Sync,
         ADC_SDIO,
         ADC_SClk,
         ADC_CS_n,
         ADC_OE_n,
         adc01_powerDown,
         BS_ADC_LowZ,
         BS_ADC_PwrDn,
         BS_ADC_SE,
         BS_ADC_SClk,
         BS_ADC_CS_n,
         BS_ADC_SDIO,
         BS_RefPll,
         BS_DAC_Sel_n,
         BS_DAC_SClk,
         BS_DAC_MOSI,
         amAdcClk,
         amAdcCSn,
         spiDataIn,
         lockLed0n,
         lockLed1n,
         Sw50_Ohm,
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
         DQM,
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
         BS_I2C_SCl,
         BS_I2C_SDa        : INOUT std_logic
      );
   END component DC_DemodTop;

   component DC_CombinerTop IS
      GENERIC (
         PORTS       : natural := 5
      );
      PORT(
         adc0_overflow,
         adc0Clk,
         MonOvf,
         MonClk,
         BS_Ovf,
         BS_Clk,
         amAdcDataIn,
         spiCSn,
         spiDataOut,
         spiClk,
         pll0_OUT1,
         pll1_OUT1,
         FPGA_ID0,
         FPGA_ID1,
         BS_PllOut         : IN std_logic;
         PrevData_p,
         PrevData_n,
         NextData_p,
         NextData_n      : IN std_logic_vector(PORTS-1 downto 0);
         NextClk_p,
         NextClk_n,
         PrevClk_p,
         PrevClk_n       : IN std_logic;
         adc0,
         MonData,
         BS_Data           : IN  std_logic_vector(13 downto 0);

         video0InSelect,
         video1InSelect,
         video1OutSelect,
         video0OutSelect   : OUT std_logic_vector(1 downto 0);
         VidSel            : OUT std_logic_vector(2 downto 0);
         dac0_d,
         dac1_d            : OUT std_logic_vector(13 downto 0);
         BS_I2C_SCl,
         BS_I2C_SDa        : INOUT std_logic;

         ADC_Sync,
         ADC_SDIO,
         ADC_SClk,
         ADC_CS_n,
         ADC_OE_n,
         adc01_powerDown,
         BS_ADC_LowZ,
         BS_ADC_PwrDn,
         BS_ADC_SE,
         BS_ADC_SClk,
         BS_ADC_CS_n,
         BS_ADC_SDIO,
         BS_RefPll,
         BS_DAC_Sel_n,
         BS_DAC_SClk,
         BS_DAC_MOSI,
         amAdcClk,
         amAdcCSn,
         spiDataIn,
         lockLed0n,
         lockLed1n,
         Sw50_Ohm,
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
         DQM,
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
         dac_sdio        : OUT std_logic
      );
   END component DC_CombinerTop;

   component LogToLin IS
      GENERIC(
         LEFT_IN   : natural := 6;
         RIGHT_IN  : natural := 4;
         LEFT_OUT  : natural := 6;
         RIGHT_OUT : natural := 4;
         LOG_RATIO : real    := 20.0
      );
      PORT(
         clk            : IN  std_logic;
         reset          : IN  std_logic;
         ce             : IN  std_logic;
         LogIn          : IN  sfixed(LEFT_IN downto -RIGHT_IN);
         LinearOut      : OUT ufixed(LEFT_OUT downto -RIGHT_OUT)
      );
   END component LogToLin;

   TYPE vector_of_slvs     IS ARRAY (NATURAL RANGE <>) OF std_logic_vector;
   constant PORTS       : integer := 5;
   constant CH1DELAY    : time := 800 ps;
   constant CH2DELAY    : time := 500 ps;

   signal   clk,
            reset,
            XX             : std_logic := '1';
   signal   Dac0,
            Dac1           : std_logic_vector(13 downto 0);
   signal   ChPrevData_p,
            ChPrevData_n,
            ChNextData_p,
            ChNextData_n,
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
   signal   IF_Data           : vector_of_slvs(3 downto 0)(13 downto 0) := (14x"1000", 14x"1000", 14x"3000", 14x"3000");
   signal   LogIn             : sfixed(4 downto -5);
   signal   LinearOut         : ufixed(3 downto -8);

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
/*
   process (clk)
   begin
      if (rising_edge(clk)) then
         IF_Data <= IF_Data(2 downto 0) & IF_Data(3);
         if (reset) then
            reset <= '0';
            LogIn <= to_sfixed(-10.0, LogIn);
         else
            LogIn <= resize(LogIn + 1.0/32.0, LogIn);
         end if;
      end if;
   end process;

   LogLin : LogToLin
      GENERIC MAP (
         LEFT_IN   => LogIn'left,
         RIGHT_IN  => -LogIn'right,
         LEFT_OUT  => LinearOut'left,
         RIGHT_OUT => -LinearOut'right,
         LOG_RATIO => 10.0
      )
   PORT MAP(
      clk         => clk,
      reset       => reset,
      ce          => '1',
      LogIn       => LogIn,
      LinearOut   => LinearOut
   );
*/

   Ch1K7 : DC_DemodTop
      GENERIC MAP (
         PORTS       => PORTS
      )
      PORT MAP(
         adc0_overflow		   => '0',
         adc0Clk              => '0',
         MonOvf               => '0',
         MonClk               => clk,
         BS_Ovf               => '0',
         BS_Clk               => '0',
         amAdcDataIn          => '0',
         spiCSn               => '0',
         spiDataOut           => '0',
         spiClk               => '0',
         pll0_OUT1            => '0',
         pll1_OUT1            => '0',
         FPGA_ID0             => '0',
         FPGA_ID1             => '0',
         BS_PllOut		      => '0',
         adc0                 => (others=>'0'),
         MonData              => (others=>'0'),
         BS_Data              => (others=>'0'),
         video0InSelect       => open,
         video1InSelect       => open,
         video1OutSelect      => open,
         video0OutSelect      => open,
         VidSel               => open,
         dac0_d               => open,
         dac1_d               => open,
         ADC_Sync             => open,
         ADC_SDIO             => open,
         ADC_SClk             => open,
         ADC_CS_n             => open,
         ADC_OE_n             => open,
         adc01_powerDown      => open,
         BS_ADC_LowZ          => open,
         BS_ADC_PwrDn         => open,
         BS_ADC_SE            => open,
         BS_ADC_SClk          => open,
         BS_ADC_CS_n          => open,
         BS_ADC_SDIO          => open,
         BS_RefPll            => open,
         BS_DAC_Sel_n         => open,
         BS_DAC_SClk          => open,
         BS_DAC_MOSI          => open,
         amAdcClk             => open,
         amAdcCSn             => open,
         spiDataIn            => open,
         lockLed0n            => open,
         lockLed1n            => open,
         Sw50_Ohm             => open,
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
         DQM                  => open,
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
         PrevData_p         => ChPrevData_p,
         PrevData_n         => ChPrevData_n,
         PrevClk_p          => PrevClk_p,
         PrevClk_n          => PrevClk_n,
         NextData_p         => open,
         NextData_n         => open,
         NextClk_p          => open,
         NextClk_n          => open
   );

   Ch2K7 : DC_DemodTop
      GENERIC MAP (
         PORTS       => PORTS
      )
      PORT MAP(
         adc0_overflow		   => '0',
         adc0Clk              => '0',
         MonOvf               => '0',
         MonClk               => clk,
         BS_Ovf               => '0',
         BS_Clk               => '0',
         amAdcDataIn          => '0',
         spiCSn               => '0',
         spiDataOut           => '0',
         spiClk               => '0',
         pll0_OUT1            => '0',
         pll1_OUT1            => '0',
         FPGA_ID0             => '1',
         FPGA_ID1             => '0',
         BS_PllOut		      => '0',
         adc0                 => (others=>'0'),
         MonData              => (others=>'0'),
         BS_Data              => (others=>'0'),
         video0InSelect       => open,
         video1InSelect       => open,
         video1OutSelect      => open,
         video0OutSelect      => open,
         VidSel               => open,
         dac0_d               => open,
         dac1_d               => open,
         ADC_Sync             => open,
         ADC_SDIO             => open,
         ADC_SClk             => open,
         ADC_CS_n             => open,
         ADC_OE_n             => open,
         adc01_powerDown      => open,
         BS_ADC_LowZ          => open,
         BS_ADC_PwrDn         => open,
         BS_ADC_SE            => open,
         BS_ADC_SClk          => open,
         BS_ADC_CS_n          => open,
         BS_ADC_SDIO          => open,
         BS_RefPll            => open,
         BS_DAC_Sel_n         => open,
         BS_DAC_SClk          => open,
         BS_DAC_MOSI          => open,
         amAdcClk             => open,
         amAdcCSn             => open,
         spiDataIn            => open,
         lockLed0n            => open,
         lockLed1n            => open,
         Sw50_Ohm             => open,
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
         DQM                  => open,
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
         PrevData_p         => open,
         PrevData_n         => open,
         PrevClk_p          => open,
         PrevClk_n          => open,
         NextData_p         => ChNextData_p,
         NextData_n         => ChNextData_n,
         NextClk_p          => NextClk_p,
         NextClk_n          => NextClk_n
   );

   CmbK7 : DC_CombinerTop
      GENERIC MAP (
         PORTS       => PORTS
      )
      PORT MAP(
         adc0_overflow		   => '0',
         adc0Clk              => '0',
         MonOvf               => '0',
         MonClk               => clk,
         BS_Ovf               => '0',
         BS_Clk               => '0',
         amAdcDataIn          => '0',
         spiCSn               => '0',
         spiDataOut           => '0',
         spiClk               => '0',
         pll0_OUT1            => '0',
         pll1_OUT1            => '0',
         FPGA_ID0             => '0',
         FPGA_ID1             => '1',
         BS_PllOut		      => '0',
         adc0                 => (others=>'0'),
         MonData              => (others=>'0'),
         BS_Data              => (others=>'0'),
         video0InSelect       => open,
         video1InSelect       => open,
         video1OutSelect      => open,
         video0OutSelect      => open,
         VidSel               => open,
         dac0_d               => open,
         dac1_d               => open,
         ADC_Sync             => open,
         ADC_SDIO             => open,
         ADC_SClk             => open,
         ADC_CS_n             => open,
         ADC_OE_n             => open,
         adc01_powerDown      => open,
         BS_ADC_LowZ          => open,
         BS_ADC_PwrDn         => open,
         BS_ADC_SE            => open,
         BS_ADC_SClk          => open,
         BS_ADC_CS_n          => open,
         BS_ADC_SDIO          => open,
         BS_RefPll            => open,
         BS_DAC_Sel_n         => open,
         BS_DAC_SClk          => open,
         BS_DAC_MOSI          => open,
         amAdcClk             => open,
         amAdcCSn             => open,
         spiDataIn            => open,
         lockLed0n            => open,
         lockLed1n            => open,
         Sw50_Ohm             => open,
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
         DQM                  => open,
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
         PrevData_p         => CmbDataIn1_p,
         PrevData_n         => CmbDataIn1_n,
         PrevClk_p          => CmbClkIn1_p,
         PrevClk_n          => CmbClkIn1_n,
         NextData_p         => CmbDataIn2_p,
         NextData_n         => CmbDataIn2_n,
         NextClk_p          => CmbClkIn2_p,
         NextClk_n          => CmbClkIn2_n
   );

PcbDelayIn1_p <= (others=>'X') when (XX = 'X') else ChPrevData_p;
PcbDelayIn1_n <= (others=>'X') when (XX = 'X') else ChPrevData_n;
PcbDelayIn2_p <= (others=>'X') when (XX = 'X') else ChNextData_p;
PcbDelayIn2_n <= (others=>'X') when (XX = 'X') else ChNextData_n;

CmbDataIn1_p <= (PcbDelayIn1_p) after CH1DELAY;
CmbDataIn1_n <= (PcbDelayIn1_n) after CH1DELAY;
CmbClkIn1_p  <= (PrevClk_p)   after CH1DELAY;
CmbClkIn1_n  <= (PrevClk_n)   after CH1DELAY;

CmbDataIn2_p <= (PcbDelayIn2_p) after CH2DELAY;
CmbDataIn2_n <= (PcbDelayIn2_n) after CH2DELAY;
CmbClkIn2_p  <= (NextClk_p)   after CH2DELAY;
CmbClkIn2_n  <= (NextClk_n)   after CH2DELAY;


end rtl;
