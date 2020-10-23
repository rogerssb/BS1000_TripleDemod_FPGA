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
   component K7_DaughterCardTest IS
   GENERIC (
      PORTS       : natural := 5;
      DEMOD_COMB  : string := "DEMOD"
   );
    PORT(
      IF_Ovf,
      IF_Clk,
      MonOvf,
      MonClk,
      BS_Ovf,
      BS_Clk,
      AM_ADC_Data,
      SPI_CS_n,
      SPI_MOSI,
      SPI_SClk,
      PllOut0,
      PllOut1,
      FPGA_ID0,
      FPGA_ID1,
      BS_PllOut         : IN std_logic;
      PrevDataIO_p,
      PrevDataIO_n,
      NextDataIO_p,
      NextDataIO_n      : INOUT std_logic_vector(PORTS-1 downto 0);
      NextClkIO_p,
      NextClkIO_n,
      PrevClkIO_p,
      PrevClkIO_n       : INOUT std_logic;
      IF_Data,
      MonData,
      BS_Data           : IN  std_logic_vector(13 downto 0);

      SwVid0,
      SwVid1,
      SwFilt0,
      SwFilt1,
      Lock              : OUT std_logic_vector(1 downto 0);
      TtlOut            : OUT std_logic_vector(3 downto 0);
      VidSel            : OUT std_logic_vector(2 downto 0);
      Dac0,
      Dac1              : OUT std_logic_vector(13 downto 0);

      ADC_Sync,
      ADC_SDIO,
      ADC_SClk,
      ADC_CS_n,
      ADC_OE_n,
      ADC_PwrDn,
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
      AM_ADC_Clk,
      AM_ADC_CS_n,
      SPI_MISO,
      Sw50_Ohm,
      RefPll0,
      RefPll1,
      EncDataTtl,
      EncClkTtl,
      BsDataTtl,
      BsClkTtl,
      DQM,
      SDI,
      AM_DAC_CS_n,
      AM_DAC_Clk,
      AM_DAC_Data,
      DacClk0,
      DacClk1,
      DacRst,
      Dac0SpiCS_n,
      Dac1SpiCS_n,
      DacSpiClk,
      DacSpiSDIO        : OUT std_logic;
      BS_I2C_SCl,
      BS_I2C_SDa        : INOUT std_logic
   );
   END component K7_DaughterCardTest;

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
   constant CH2DELAY    : time := 300 ps;

   signal   clk,
            reset,
            XX             : std_logic := '1';
   signal   Dac0,
            Dac1           : std_logic_vector(13 downto 0);
   signal   Ch1PrevDataIO_p,
            Ch1PrevDataIO_n,
            Ch1NextDataIO_p,
            Ch1NextDataIO_n,
            Ch2NextDataIO_p,
            Ch2NextDataIO_n,
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
            PrevClkIO_p,
            PrevClkIO_n,
            NextClkIO_p,
            NextClkIO_n       : std_logic;
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
/*
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

   Ch1K7 : K7_DaughterCardTest
      GENERIC MAP (
         PORTS       => PORTS,
         DEMOD_COMB  => "DEMOD"
      )
      PORT MAP(
         IF_Ovf               => '0',
         IF_Clk               => clk,
         MonOvf               => '0',
         MonClk               => clk,
         BS_Ovf               => '0',
         BS_Clk               => clk,
         AM_ADC_Data          => '0',
         SPI_CS_n             => '0',
         SPI_MOSI             => '0',
         SPI_SClk             => '0',
         PllOut0              => '0',
         PllOut1              => '0',
         FPGA_ID0             => '0',
         FPGA_ID1             => '0',
         BS_PllOut            => '0',
         IF_Data              => IF_Data(3),
         MonData              => Dac0,
         BS_Data              => Dac0,
         SwVid0               => open,
         SwVid1               => open,
         SwFilt0              => open,
         SwFilt1              => open,
         Lock                 => open,
         TtlOut               => open,
         VidSel               => open,
         Dac0                 => Dac0,
         Dac1                 => open,
         ADC_Sync             => open,
         ADC_SDIO             => open,
         ADC_SClk             => open,
         ADC_CS_n             => open,
         ADC_OE_n             => open,
         ADC_PwrDn            => open,
         BS_ADC_LowZ          => open,
         BS_ADC_PwrDn         => open,
         BS_ADC_SE            => open,
         BS_ADC_SClk          => open,
         BS_ADC_CS_n          => open,
         BS_ADC_SDIO          => open,
         BS_RefPll            => open,
         BS_I2C_SCl           => open,
         BS_I2C_SDa           => open,
         BS_DAC_Sel_n         => open,
         BS_DAC_SClk          => open,
         BS_DAC_MOSI          => open,
         AM_ADC_Clk           => open,
         AM_ADC_CS_n          => open,
         SPI_MISO             => open,
         Sw50_Ohm             => open,
         RefPll0              => open,
         RefPll1              => open,
         EncDataTtl           => open,
         EncClkTtl            => open,
         BsDataTtl            => open,
         BsClkTtl             => open,
         DQM                  => open,
         SDI                  => open,
         AM_DAC_CS_n          => open,
         AM_DAC_Clk           => open,
         AM_DAC_Data          => open,
         PrevDataIO_p         => Ch1PrevDataIO_p,
         PrevDataIO_n         => Ch1PrevDataIO_n,
         PrevClkIO_p          => PrevClkIO_p,
         PrevClkIO_n          => PrevClkIO_n,
         NextDataIO_p         => Ch1NextDataIO_p,
         NextDataIO_n         => Ch1NextDataIO_n,
         NextClkIO_p          => open,
         NextClkIO_n          => open,
         DacClk0              => open,
         DacClk1              => open,
         DacRst               => open,
         Dac0SpiCS_n          => open,
         Dac1SpiCS_n          => open,
         DacSpiClk            => open,
         DacSpiSDIO           => open
   );

   Ch2K7 : K7_DaughterCardTest
      GENERIC MAP (
         PORTS       => PORTS,
         DEMOD_COMB  => "DEMOD"
      )
      PORT MAP(
         IF_Ovf               => '0',
         IF_Clk               => clk,
         MonOvf               => '0',
         MonClk               => clk,
         BS_Ovf               => '0',
         BS_Clk               => clk,
         AM_ADC_Data          => '0',
         SPI_CS_n             => '0',
         SPI_MOSI             => '0',
         SPI_SClk             => '0',
         PllOut0              => '0',
         PllOut1              => '0',
         FPGA_ID0             => '1',
         FPGA_ID1             => '0',
         BS_PllOut            => '0',
         IF_Data              => Dac0,
         MonData              => Dac0,
         BS_Data              => Dac0,
         SwVid0               => open,
         SwVid1               => open,
         SwFilt0              => open,
         SwFilt1              => open,
         Lock                 => open,
         TtlOut               => open,
         VidSel               => open,
         Dac0                 => open,
         Dac1                 => open,
         ADC_Sync             => open,
         ADC_SDIO             => open,
         ADC_SClk             => open,
         ADC_CS_n             => open,
         ADC_OE_n             => open,
         ADC_PwrDn            => open,
         BS_ADC_LowZ          => open,
         BS_ADC_PwrDn         => open,
         BS_ADC_SE            => open,
         BS_ADC_SClk          => open,
         BS_ADC_CS_n          => open,
         BS_ADC_SDIO          => open,
         BS_RefPll            => open,
         BS_I2C_SCl           => open,
         BS_I2C_SDa           => open,
         BS_DAC_Sel_n         => open,
         BS_DAC_SClk          => open,
         BS_DAC_MOSI          => open,
         AM_ADC_Clk           => open,
         AM_ADC_CS_n          => open,
         SPI_MISO             => open,
         Sw50_Ohm             => open,
         RefPll0              => open,
         RefPll1              => open,
         EncDataTtl           => open,
         EncClkTtl            => open,
         BsDataTtl            => open,
         BsClkTtl             => open,
         DQM                  => open,
         SDI                  => open,
         AM_DAC_CS_n          => open,
         AM_DAC_Clk           => open,
         AM_DAC_Data          => open,
         PrevDataIO_p         => Ch1NextDataIO_p,
         PrevDataIO_n         => Ch1NextDataIO_n,
         PrevClkIO_p          => open,
         PrevClkIO_n          => open,
         NextDataIO_p         => Ch2NextDataIO_p,
         NextDataIO_n         => Ch2NextDataIO_n,
         NextClkIO_p          => NextClkIO_p,
         NextClkIO_n          => NextClkIO_n,
         DacClk0              => open,
         DacClk1              => open,
         DacRst               => open,
         Dac0SpiCS_n          => open,
         Dac1SpiCS_n          => open,
         DacSpiClk            => open,
         DacSpiSDIO           => open
   );

   CmbK7 : K7_DaughterCardTest
      GENERIC MAP (
         PORTS       => PORTS,
         DEMOD_COMB  => "COMB"
      )
      PORT MAP(
         IF_Ovf               => '0',
         IF_Clk               => clk,
         MonOvf               => '0',
         MonClk               => clk,
         BS_Ovf               => '0',
         BS_Clk               => clk,
         AM_ADC_Data          => '0',
         SPI_CS_n             => '0',
         SPI_MOSI             => '0',
         SPI_SClk             => '0',
         PllOut0              => '0',
         PllOut1              => '0',
         FPGA_ID0             => '0',
         FPGA_ID1             => '1',
         BS_PllOut            => '0',
         IF_Data              => Dac0,
         MonData              => Dac0,
         BS_Data              => Dac0,
         SwVid0               => open,
         SwVid1               => open,
         SwFilt0              => open,
         SwFilt1              => open,
         Lock                 => open,
         TtlOut               => open,
         VidSel               => open,
         Dac0                 => open,
         Dac1                 => open,
         ADC_Sync             => open,
         ADC_SDIO             => open,
         ADC_SClk             => open,
         ADC_CS_n             => open,
         ADC_OE_n             => open,
         ADC_PwrDn            => open,
         BS_ADC_LowZ          => open,
         BS_ADC_PwrDn         => open,
         BS_ADC_SE            => open,
         BS_ADC_SClk          => open,
         BS_ADC_CS_n          => open,
         BS_ADC_SDIO          => open,
         BS_RefPll            => open,
         BS_I2C_SCl           => open,
         BS_I2C_SDa           => open,
         BS_DAC_Sel_n         => open,
         BS_DAC_SClk          => open,
         BS_DAC_MOSI          => open,
         AM_ADC_Clk           => open,
         AM_ADC_CS_n          => open,
         SPI_MISO             => open,
         Sw50_Ohm             => open,
         RefPll0              => open,
         RefPll1              => open,
         EncDataTtl           => open,
         EncClkTtl            => open,
         BsDataTtl            => open,
         BsClkTtl             => open,
         DQM                  => open,
         SDI                  => open,
         AM_DAC_CS_n          => open,
         AM_DAC_Clk           => open,
         AM_DAC_Data          => open,
         PrevDataIO_p         => CmbDataIn1_p,
         PrevDataIO_n         => CmbDataIn1_n,
         PrevClkIO_p          => CmbClkIn1_p,
         PrevClkIO_n          => CmbClkIn1_n,
         NextDataIO_p         => CmbDataIn2_p,
         NextDataIO_n         => CmbDataIn2_n,
         NextClkIO_p          => CmbClkIn2_p,
         NextClkIO_n          => CmbClkIn2_n,
         DacClk0              => open,
         DacClk1              => open,
         DacRst               => open,
         Dac0SpiCS_n          => open,
         Dac1SpiCS_n          => open,
         DacSpiClk            => open,
         DacSpiSDIO           => open
   );

PcbDelayIn1_p <= (others=>'X') when (XX = 'X') else Ch1PrevDataIO_p;
PcbDelayIn1_n <= (others=>'X') when (XX = 'X') else Ch1PrevDataIO_n;
PcbDelayIn2_p <= (others=>'X') when (XX = 'X') else Ch2NextDataIO_p;
PcbDelayIn2_n <= (others=>'X') when (XX = 'X') else Ch2NextDataIO_n;

CmbDataIn1_p <= transport (PcbDelayIn1_p) after CH1DELAY;
CmbDataIn1_n <= transport (PcbDelayIn1_n) after CH1DELAY;
CmbClkIn1_p  <= transport (PrevClkIO_p)   after CH1DELAY;
CmbClkIn1_n  <= transport (PrevClkIO_n)   after CH1DELAY;

CmbDataIn2_p <= transport (PcbDelayIn2_p) after CH2DELAY;
CmbDataIn2_n <= transport (PcbDelayIn2_n) after CH2DELAY;
CmbClkIn2_p  <= transport (NextClkIO_p)   after CH2DELAY;
CmbClkIn2_n  <= transport (NextClkIO_n)   after CH2DELAY;


end rtl;
