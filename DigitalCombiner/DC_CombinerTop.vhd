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

Module Name: DC_CombinerTop.vhd
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
use work.fixed_pkg.ALL;
use work.Semco_pkg.all;
Library UNISIM;
use UNISIM.vcomponents.all;

ENTITY DC_CombinerTop IS
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
      PrevDataIO_p,
      PrevDataIO_n,
      NextDataIO_p,
      NextDataIO_n      : IN std_logic_vector(PORTS-1 downto 0);
      NextClkIO_p,
      NextClkIO_n,
      PrevClkIO_p,
      PrevClkIO_n       : IN std_logic;
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
END DC_CombinerTop;

ARCHITECTURE rtl OF DC_CombinerTop IS

   component CombinerSerDesIn is
      Generic (
         PORTS    : natural := 5
      );
      Port (
         Clk93M,
         Reset,
         ClkIn1_p,
         ClkIn1_n,
         ClkIn2_p,
         ClkIn2_n       : in  std_logic;
         DataIn1_p,
         DataIn1_n,
         DataIn2_p,
         DataIn2_n      : in  STD_LOGIC_VECTOR(PORTS-2 downto 0);
         DataOut1,
         DataOut2       : out SLV8_ARRAY(PORTS-2 downto 0)
      );
   end component CombinerSerDesIn;

   COMPONENT vio_0
      PORT (
         clk : IN STD_LOGIC;
         probe_out0 : OUT STD_LOGIC_VECTOR(13 DOWNTO 0);
         probe_out1 : OUT STD_LOGIC_VECTOR(13 DOWNTO 0);
         probe_out2 : OUT STD_LOGIC_VECTOR(5 DOWNTO 0);
         probe_out3 : OUT STD_LOGIC_VECTOR(5 DOWNTO 0);
         probe_out4 : OUT STD_LOGIC_VECTOR(5 DOWNTO 0);
         probe_out5 : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
         probe_out6 : OUT STD_LOGIC_VECTOR(8 DOWNTO 0);
         probe_out7 : OUT STD_LOGIC_VECTOR(23 DOWNTO 0);
         probe_out8 : OUT STD_LOGIC_VECTOR(13 DOWNTO 0)
      );
   END COMPONENT;

   constant CHANNEL_1         : std_logic_vector(1 downto 0) := "00";
   constant CHANNEL_2         : std_logic_vector(1 downto 0) := "01";
   constant COMBINER          : std_logic_vector(1 downto 0) := "10";

  -- Signals
   SIGNAL   probe_out0,
            probe_out1,
            probe_out8,
            probe_out8Reg,
            NcoSine,
            NcoCos         : STD_LOGIC_VECTOR(13 DOWNTO 0);
   SIGNAL   probe_out2,
            probe_out3,
            probe_out4,
            probe_out2Reg,
            probe_out3Reg,
            probe_out4Reg  : STD_LOGIC_VECTOR(5 DOWNTO 0);
   SIGNAL   probe_out6,
            probe_out6Reg,
            ResetDly       : STD_LOGIC_VECTOR(8 DOWNTO 0) := (others=>'1');
   SIGNAL   probe_out7,
            NcoFreq        : STD_LOGIC_VECTOR(23 DOWNTO 0);
   signal   probe_out5,
            ID             : std_logic_vector(1 downto 0);
   signal   TxData         : UINT8_ARRAY(PORTS - 1 downto 0);
   signal   TxData1,
            TxData2        : SLV8_ARRAY(PORTS - 1 downto 0);
   signal   Ch1Data,
            Ch2Data        : SLV8_Array(PORTS-1 downto 0);

   attribute IOSTANDARD    : string;
   attribute IOSTANDARD of spiCSn, spiDataIn, spiDataOut, spiClk,
            pll0_OUT1, pll1_OUT1, video0InSelect, video1InSelect, video1OutSelect, video0OutSelect, VidSel,
            ch0ClkOut, ch0DataOut, ch1ClkOut, ch1DataOut, ch2ClkOut, ch2DataOut, ch3ClkOut, ch3DataOut,
            amAdcDataIn, amAdcClk, amAdcCSn,
            Sw50_Ohm, pll0_REF, pll1_REF,
            DQM, sdiOut, lockLed0n, lockLed1n, FPGA_ID0, FPGA_ID1,
            amDacCSn, amDacClk, amDacDataOut : signal is "LVCMOS33";

   attribute IOSTANDARD of adc0_overflow, adc0Clk, adc0,
            MonOvf, MonClk, MonData,
            BS_Ovf, BS_Clk, BS_Data,
            ADC_Sync, ADC_SDIO, ADC_SClk, ADC_CS_n, ADC_OE_n, adc01_powerDown,
            BS_ADC_LowZ, BS_ADC_PwrDn, BS_ADC_SE, BS_ADC_SClk, BS_ADC_CS_n, BS_ADC_SDIO,
            BS_DAC_Sel_n, BS_DAC_SClk, BS_DAC_MOSI,
            BS_PllOut, BS_RefPll,
            BS_I2C_SCl, BS_I2C_SDa,
            dac0_clk, dac1_clk, dac_rst, dac0_nCs, dac1_nCs,
            dac_sclk, dac_sdio, dac0_d, dac1_d : signal is "LVCMOS18";

   attribute MARK_DEBUG : string;
   attribute MARK_DEBUG of
            Ch1Data, Ch2Data,
            dac0_d, dac1_d : signal is "TRUE";

BEGIN

   dac_rst  <= '0';
   dac0_nCs <= '0';
   dac1_nCs <= '0';
   dac_sclk <= '0';
   dac_sdio <= '0';

   ID       <= FPGA_ID1 & FPGA_ID0;
   dac0_clk  <= MonClk;
   dac1_clk  <= MonClk;

   ResetProc : process(MonClk)
   begin
      if (rising_edge(MonClk)) then
         ResetDly <= ResetDly(ResetDly'left-1 downto 0) & not FPGA_ID1;
      end if;
   end process;

   SerDes_u : CombinerSerDesIn
      Generic Map
      (
         PORTS    => PORTS+1
      )
      Port Map
      (
            Clk93M            => MonClk,
            Reset             => ResetDly(ResetDly'left),
            ClkIn1_p          => PrevClkIO_p,
            ClkIn1_n          => PrevClkIO_n,
            DataIn1_p         => PrevDataIO_p,
            DataIn1_n         => PrevDataIO_n,
            DataOut1          => Ch1Data,
            ClkIn2_p          => NextClkIO_p,
            ClkIn2_n          => NextClkIO_n,
            DataIn2_p         => NextDataIO_p,
            DataIn2_n         => NextDataIO_n,
            DataOut2          => Ch2Data
   );

   CombinerVio : vio_0
       PORT MAP (
         clk => MonClk,
         probe_out0 => probe_out0,
         probe_out1 => probe_out1,
         probe_out2 => probe_out2,
         probe_out3 => probe_out3,
         probe_out4 => probe_out4,
         probe_out5 => probe_out5,
         probe_out6 => probe_out6,
         probe_out7 => probe_out7,
         probe_out8 => probe_out8
       );

   dac0_d <= Ch1Data(to_integer(unsigned(probe_out0))) & 6x"0";
   dac1_d <= Ch2Data(to_integer(unsigned(probe_out0))) & 6x"0";

END rtl;
