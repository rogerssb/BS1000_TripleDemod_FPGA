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

Module Name: DC_DemodTop.vhd
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

ENTITY DC_DemodTop IS
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
      NextDataIO_n      : OUT std_logic_vector(PORTS-1 downto 0);
      NextClkIO_p,
      NextClkIO_n,
      PrevClkIO_p,
      PrevClkIO_n       : OUT std_logic;
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
END DC_DemodTop;

ARCHITECTURE rtl OF DC_DemodTop IS


   component DemodSerDesOut is
      Generic (
         PORTS    : natural := 5
      );
      Port (
         Clk93M,
         Reset,
         Active            : in std_logic;
         TxData            : in SLV8_ARRAY(PORTS-1 downto 0);
         DataOut_p,
         DataOut_n         : out STD_LOGIC_VECTOR(PORTS-1 downto 0);
         RefClkOut_p,
         RefClkOut_n       : out std_logic
      );
  end component DemodSerDesOut;

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
            probe_out6Reg  : STD_LOGIC_VECTOR(8 DOWNTO 0);
   SIGNAL   probe_out7,
            NcoFreq        : STD_LOGIC_VECTOR(23 DOWNTO 0);
   SIGNAL   NcoOut         : STD_LOGIC_VECTOR(31 downto 0);
   SIGNAL   Freq           : unsigned(23 DOWNTO 0) := (others=>'0');
   signal   CosSF,
            SinSF,
            GainSF         : sfixed(0 downto -13);
   signal   SysRst         : std_logic_vector(3 downto 0) := (others=>'1');
   signal   ID             : std_logic_vector(1 downto 0);
   signal   TxData         : UINT8_ARRAY(PORTS - 1 downto 0);
   signal   TxData1,
            TxData2        : SLV8_ARRAY(PORTS - 1 downto 0);
   signal   DivBy4         : unsigned(1 downto 0) := "00";

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

BEGIN

   SysRstProcess : process(MonClk)
   begin
      if (rising_edge(MonClk)) then
         SysRst <= SysRst(2 downto 0) & '0';
      end if;
   end process SysRstProcess;

   IF_Clk_process : process(MonClk)
   begin
      if (rising_edge(MonClk)) then
         if (SysRst(SysRst'left)) then
            TxData(0) <= x"11";
            TxData(1) <= x"22";
            TxData(2) <= x"33";
            TxData(3) <= x"44";
            TxData(4) <= x"55";
         else
            DivBy4 <= DivBy4 + 1;
            if (DivBy4 = 3) then
               for ch in 0 to PORTS-1 loop
                  TxData(ch) <= TxData(ch) + 1;
               end loop;
            end if;
         end if;
      end if;
   end process IF_Clk_process;

   ID <= FPGA_ID1 & FPGA_ID0;

   TxDataCast : process(all)
   begin
      for ch in 0 to PORTS-1 loop
         TxData1(ch) <= std_logic_vector(TxData(ch)) when (ID = CHANNEL_1) else (others=>'0');
         TxData2(ch) <= std_logic_vector(TxData(ch)) when (ID = CHANNEL_2) else (others=>'0');
      end loop;
   end process;

   Ch1SerDes : DemodSerDesOut
      Generic Map(
         PORTS    => PORTS
      )
      Port MAP(
         Clk93M      => MonClk,
         Reset       => SysRst(SysRst'left),
         Active      => (ID ?= CHANNEL_1),
         TxData      => TxData1,
         DataOut_p   => PrevDataIO_p,
         DataOut_n   => PrevDataIO_n,
         RefClkOut_p => PrevClkIO_p,
         RefClkOut_n => PrevClkIO_n
      );
  Ch2SerDes : DemodSerDesOut
      Generic Map(
         PORTS    => PORTS
      )
      Port MAP(
         Clk93M      => MonClk,
         Reset       => SysRst(SysRst'left),
         Active      => (ID ?= CHANNEL_2),
         TxData      => TxData2,
         DataOut_p   => NextDataIO_p,
         DataOut_n   => NextDataIO_n,
         RefClkOut_p => NextClkIO_p,
         RefClkOut_n => NextClkIO_n
      );

END rtl;
