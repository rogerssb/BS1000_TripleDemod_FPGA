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
      SimMode     : boolean := true;
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
      spiClk,
      pll0_OUT1,
      pll1_OUT1,
      FPGA_ID0,
      FPGA_ID1,
      BS_PllOut         : IN std_logic;
      spiDataOut        : inout std_logic;
      --      spiFlashCK, --Output through the STARTUPE2 primitive
      spiFlashCSn,
      spiFlashMOSI      : out std_logic;
      spiFlashMISO      : in  std_logic;
      -- Bitsync ADC
      bsAdc             : in  std_logic_vector(13 downto 0);
      bsAdc_overflow    : in  std_logic;
      bsAdc_powerDown   : out std_logic;
      -- Input Impedance and Topology controls
      bsHighImpedance,
      bsSingleEnded     : out std_logic;
      -- Gain and Offset DAC interfaces
      bsDacSELn,
      bsDacSCLK,
      bsDacMOSI         : out std_logic;
      -- interFpga data
      PrevData_p,
      PrevData_n,
      NextData_p,
      NextData_n        : OUT std_logic_vector(PORTS-1 downto 0);
      NextClk_p,
      NextClk_n,
      PrevClk_p,
      PrevClk_n         : OUT std_logic;
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

   component ad7476Interface is
      port (
         clk,
         reset,
         spiDin      : in  std_logic;
         spiClk,
         spiCSn,
         adcDataEn   : out std_logic;
         adcData     : out slv12
      );
    end component ad7476Interface;

   component semcoDemodTop  is   -- forced to R6100 mode with SPI Gateway and sidecar Bit Sync
      port (
          spiClk,
          spiCSn,
          spiDataIn        : in  std_logic;
          spiDataOut       : inout std_logic;
          -- ADC Inputs
          adc0             : in  std_logic_vector(13 downto 0);
          adc0_overflow    : in  std_logic;
          adc01_powerDown  : out std_logic;
          adc0Clk          : in  std_logic;
          -- DAC configuration interface
          dac_rst,
          dac_sclk,
          dac_sdio,
          dac0_nCs,
          dac1_nCs         : out std_logic;
          -- DAC datapath interface
          dac0_clk,
          dac1_clk         : out std_logic;
          dac0_d,
          dac1_d           : out std_logic_vector(13 downto 0);
          -- Clock and data outputs
          ch0ClkOut,
          ch0DataOut,
          ch1ClkOut,
          ch1DataOut,
          ch2ClkOut,
          ch2DataOut,
          ch3ClkOut,
          ch3DataOut       : out std_logic;
          -- PLL Interface Signals
          pll0_OUT1,
          pll1_OUT1        : in  std_logic;
          pll0_REF,
          pll1_REF         : out std_logic;

          -- AM ADC Interface
          amAdcDataIn      : in  std_logic;
          amAdcClk,
          amAdcCSn         : out std_logic;

          -- AM DAC Interface
          amDacDataOut,
          amDacClk,
          amDacCSn         : out std_logic;

          -- Video Switch Select Lines
          video0InSelect,
          video0OutSelect,
          video1InSelect,
          video1OutSelect  : out std_logic_vector(1 downto 0);
          --output              spiFlashCK, --Output through the STARTUPE2 primitive
          spiFlashCSn,
          spiFlashMOSI     : out std_logic;
          spiFlashMISO     : in  std_logic;
          -- Lock indicators
          lockLed0n,
          lockLed1n        : out std_logic;
          -- Bitsync ADC
          bsAdc            : in  std_logic_vector(13 downto 0);
          bsAdc_overflow   : in  std_logic;
          bsAdc_powerDown  : out std_logic;
          -- Input Impedance and Topology controls
          bsHighImpedance,
          bsSingleEnded    : out std_logic;
          -- Gain and Offset DAC interfaces
          bsDacSELn,
          bsDacSCLK,
          bsDacMOSI        : out std_logic;
          -- SDI Output
          sdiOut,
          DQMOut           : out std_logic
      );
   end component semcoDemodTop;

   constant CHANNEL_1         : std_logic_vector(1 downto 0) := "00";
   constant CHANNEL_2         : std_logic_vector(1 downto 0) := "01";
   constant COMBINER          : std_logic_vector(1 downto 0) := "10";

  -- Signals
   SIGNAL   Clk,
            Reset,
            amDataEn       : std_logic := '1';
   signal   SysRst         : std_logic_vector(3 downto 0) := (others=>'1');
   signal   ID             : std_logic_vector(1 downto 0);
   signal   TxData         : UINT8_ARRAY(PORTS - 1 downto 0);
   signal   TxData1,
            TxData2        : SLV8_ARRAY(PORTS - 1 downto 0);
   signal   amDataIn       : SLV12;

   attribute IOSTANDARD    : string;
   attribute IOSTANDARD of spiCSn, spiDataIn, spiDataOut, spiClk,
            pll0_OUT1, pll1_OUT1, video0InSelect, video1InSelect, video1OutSelect, video0OutSelect, VidSel,
            ch0ClkOut, ch0DataOut, ch1ClkOut, ch1DataOut, ch2ClkOut, ch2DataOut, ch3ClkOut, ch3DataOut,
            amAdcDataIn, amAdcClk, amAdcCSn,
            Sw50_Ohm, pll0_REF, pll1_REF,
            DQMOut, sdiOut, lockLed0n, lockLed1n, FPGA_ID0, FPGA_ID1,
            amDacCSn, amDacClk, amDacDataOut : signal is "LVCMOS33";

   attribute IOSTANDARD of adc0_overflow, adc0Clk, adc0,
            MonOvf, MonClk, MonData,
            BS_Ovf, BS_Clk, BS_Data,
            spiFlashCSn, spiFlashMOSI, spiFlashMISO,
            bsAdc, bsAdc_overflow, bsAdc_powerDown, bsHighImpedance,
            bsSingleEnded, bsDacSELn, bsDacSCLK, bsDacMOSI,
            ADC_Sync, ADC_SDIO, ADC_SClk, ADC_CS_n, ADC_OE_n, adc01_powerDown,
            BS_ADC_LowZ, BS_ADC_PwrDn, BS_ADC_SE, BS_ADC_SClk, BS_ADC_CS_n, BS_ADC_SDIO,
            BS_DAC_Sel_n, BS_DAC_SClk, BS_DAC_MOSI,
            BS_PllOut, BS_RefPll,
            BS_I2C_SCl, BS_I2C_SDa,
            dac0_clk, dac1_clk, dac_rst, dac0_nCs, dac1_nCs,
            dac_sclk, dac_sdio, dac0_d, dac1_d : signal is "LVCMOS18";

BEGIN

   SysRstProcess : process(Clk)
   begin
      if (rising_edge(Clk)) then
         SysRst <= SysRst(SysRst'left-1 downto 0) & '0';
         Reset <= SysRst(SysRst'left);
      end if;
   end process SysRstProcess;

   amAdc : ad7476Interface
      port map(
        clk          => Clk,
        reset        => Reset,
        spiDin       => amAdcDataIn,
        spiClk       => amAdcClk,
        spiCSn       => amAdcCSn,
        adcData      => amDataIn,
        adcDataEn    => amDataEn
    );

SimOrReal: if (not SimMode) generate

   Clk <= MonClk;

   IF_Clk_process : process(Clk)
   begin
      if (rising_edge(Clk)) then
         if (Reset) then
            TxData(0) <= x"11";
            TxData(1) <= x"22";
            TxData(2) <= x"33";
            TxData(3) <= x"44";
            TxData(4) <= x"55";
         else
            if (TxData(0) < 255) then
               TxData(0) <= TxData(0) + 1;
               for ch in 1 to PORTS-1 loop
                  TxData(ch) <= TxData(ch-1) + x"11";
               end loop;
            else
               TxData(0) <= x"11";
               TxData(1) <= x"22";
               TxData(2) <= x"33";
               TxData(3) <= x"44";
               TxData(4) <= x"55";
            end if;
         end if;
      end if;
   end process IF_Clk_process;

   TxDataCast : process(all)
   begin
      for ch in 0 to PORTS-1 loop
         TxData1(ch) <= std_logic_vector(TxData(ch)) when (ID = CHANNEL_1) else (others=>'0');
         TxData2(ch) <= std_logic_vector(TxData(ch)) when (ID = CHANNEL_2) else (others=>'0');
      end loop;
   end process;

else generate

   process begin
      wait for 5.35 ns;
      Clk <= not Clk;
   end process;

   IF_Clk_process : process(Clk)
   begin
      if (rising_edge(Clk)) then
         if (TxData(4) < 255) then
            TxData(4) <= TxData(4) + x"11";
         else
            TxData(4) <= x"55";
         end if;
         if (ID = CHANNEL_1) then
            TxData1(0) <= adc0(7 downto 0);
            TxData1(1) <= "00" & not adc0(13) & adc0(12 downto 8);
            TxData1(2) <= amDataIn(7 downto 0);
            TxData1(3) <= amDataEn & "000" & amDataIn(11 downto 8);
            TxData1(4) <= std_logic_vector(TxData(4));
            TxData2(0) <= x"00";
            TxData2(1) <= x"00";
            TxData2(2) <= x"00";
            TxData2(3) <= x"00";
            TxData2(4) <= x"00";
         else

         end if;
      end if;
   end process IF_Clk_process;

end generate;

   ID <= FPGA_ID1 & FPGA_ID0;

   Ch1SerDes : DemodSerDesOut
      Generic Map(
         PORTS    => PORTS
      )
      Port MAP(
         Clk93M      => Clk,
         Reset       => Reset,
         Active      => (ID ?= CHANNEL_1),
         TxData      => TxData1,
         DataOut_p   => PrevData_p,
         DataOut_n   => PrevData_n,
         RefClkOut_p => PrevClk_p,
         RefClkOut_n => PrevClk_n
      );

  Ch2SerDes : DemodSerDesOut
      Generic Map(
         PORTS    => PORTS
      )
      Port MAP(
         Clk93M      => Clk,
         Reset       => Reset,
         Active      => (ID ?= CHANNEL_2),
         TxData      => TxData2,
         DataOut_p   => NextData_p,
         DataOut_n   => NextData_n,
         RefClkOut_p => NextClk_p,
         RefClkOut_n => NextClk_n
      );

   Demod : semcoDemodTop  -- forced to R6100 mode with SPI Gateway and sidecar Bit Sync
      port map (
          spiClk              => spiClk,
          spiCSn              => spiCSn,
          spiDataIn           => spiDataIn,
          spiDataOut          => spiDataOut,
          adc0                => adc0,
          adc0_overflow       => adc0_overflow,
          adc01_powerDown     => adc01_powerDown,
          adc0Clk             => adc0Clk,
          dac_rst             => dac_rst,
          dac_sclk            => dac_sclk,
          dac_sdio            => dac_sdio,
          dac0_nCs            => dac0_nCs,
          dac1_nCs            => dac1_nCs,
          dac0_clk            => dac0_clk,
          dac1_clk            => dac1_clk,
          dac0_d              => dac0_d,
          dac1_d              => dac1_d,
          ch0ClkOut           => ch0ClkOut,
          ch0DataOut          => ch0DataOut,
          ch1ClkOut           => ch1ClkOut,
          ch1DataOut          => ch1DataOut,
          ch2ClkOut           => ch2ClkOut,
          ch2DataOut          => ch2DataOut,
          ch3ClkOut           => ch3ClkOut,
          ch3DataOut          => ch3DataOut,
          pll0_OUT1           => pll0_OUT1,
          pll1_OUT1           => pll1_OUT1,
          pll0_REF            => pll0_REF,
          pll1_REF            => pll1_REF,
          amAdcDataIn         => amAdcDataIn,
          amAdcClk            => amAdcClk,
          amAdcCSn            => amAdcCSn,
          amDacDataOut        => amDacDataOut,
          amDacClk            => amDacClk,
          amDacCSn            => amDacCSn,
          video0InSelect      => video0InSelect,
          video0OutSelect     => video0OutSelect,
          video1InSelect      => video1InSelect,
          video1OutSelect     => video1OutSelect,
          spiFlashCSn         => spiFlashCSn,
          spiFlashMOSI        => spiFlashMOSI,
          spiFlashMISO        => spiFlashMISO,
          lockLed0n           => lockLed0n,
          lockLed1n           => lockLed1n,
          bsAdc               => bsAdc,
          bsAdc_overflow      => bsAdc_overflow,
          bsAdc_powerDown     => bsAdc_powerDown,
          bsHighImpedance     => bsHighImpedance,
          bsSingleEnded       => bsSingleEnded,
          bsDacSELn           => bsDacSELn,
          bsDacSCLK           => bsDacSCLK,
          bsDacMOSI           => bsDacMOSI,
          sdiOut              => sdiOut,
          DQMOut              => DQMOut
      );

END rtl;
