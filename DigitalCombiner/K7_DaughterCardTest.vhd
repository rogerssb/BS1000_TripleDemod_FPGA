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

Module Name: K7_DaughterCardTest.vhd
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

ENTITY K7_DaughterCardTest IS
   GENERIC (
      PORTS       : natural := 5;
      DEMOD_COMB  : string := "COMB"
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
END K7_DaughterCardTest;

ARCHITECTURE rtl OF K7_DaughterCardTest IS

   component Monitor is
      Generic (
         Width    : natural := 18
      );
      Port (
         MonData,
         Attack,
         Decay    : in STD_LOGIC_VECTOR (13 downto 0);
         MonClk   : in STD_LOGIC;
         MonSel   : out STD_LOGIC_VECTOR (2 downto 0);
         MonPos   : out STD_LOGIC_VECTOR (Width-1 downto 0);
         MonNeg   : out STD_LOGIC_VECTOR (Width-1 downto 0);
         MonAddr  : in STD_LOGIC_VECTOR (2 downto 0));
   end component Monitor;

   component CombinerSerDesIn is
      Generic (
         CHANNEL  : natural := 1;
         PORTS    : natural := 5
      );
      Port (
         Clk93M,
         ClkIn_p,
         ClkIn_n,
         Reset             : in  std_logic;
         DataIn_p,
         DataIn_n          : in  STD_LOGIC_VECTOR(PORTS-2 downto 0);
         DataOut           : out SLV8_ARRAY(PORTS-2 downto 0)
      );
   end component CombinerSerDesIn;

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
   signal   DQM_Shifter    : STD_LOGIC_VECTOR(15 downto 0) := "1111110010101101";   -- 3As, RS232 is lsb first but I'm shifting MSB first so data is backward
   signal   SDI_Shifter    : STD_LOGIC_VECTOR(15 downto 0) := "1111110101010101";   -- 55s
   signal   DQM_Reg        : std_logic_vector(7 downto 0) := x"54";
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
   SIGNAL   SpiDataIn,
            SpiDataOut,
            NcoOut         : STD_LOGIC_VECTOR(31 downto 0);
   SIGNAL   MonPos,
            MonNeg         : STD_LOGIC_VECTOR(17 DOWNTO 0);
   SIGNAL   BS_DacShift,
            AM_DacShift,
            PllHold0,
            PllHold1,
            BS_PllHold     : STD_LOGIC_VECTOR(15 DOWNTO 0);
   SIGNAL   IF_DataReg,
            MonDataReg,
            BS_DataReg     : STD_LOGIC_VECTOR(13 DOWNTO 0);
   signal   RamAddr        : std_logic_vector(12 downto 0);
   SIGNAL   AM_Adc,
            AM_AdcShift    : STD_LOGIC_VECTOR(11 DOWNTO 0);
   SIGNAL   Freq           : unsigned(23 DOWNTO 0) := (others=>'0');
   SIGNAL   Filter         : unsigned(1 DOWNTO 0) := (others=>'0');
   SIGNAL   SelVio         : STD_LOGIC_VECTOR(1 downto 0);
   signal   PllCount0,
            PllCount1,
            BS_PllCount    : unsigned(15 downto 0) := (others=>'0');
   signal   Toggle_u       : unsigned(12 downto 0) := (others=>'0');
   signal   Toggle         : std_logic_vector (12 downto 0);
   signal   Counter        : unsigned(9 downto 0) := (others=>'0');
   signal   CosSF,
            SinSF,
            GainSF         : sfixed(0 downto -13);
   SIGNAL   RamWr         : std_logic_vector(3 downto 0);
   SIGNAL   RamCS,
            CountRst,
            SpiDataOE,
            SpiOut,
            SpiError,
            SpiErrored,
            SpiErrorRst,
            sda_t,
            sda_o,
            scl_t,
            scl_o,
            FreqOvfw       : std_logic := '0';
   signal   SysRst         : std_logic_vector(3 downto 0) := (others=>'1');
   signal   ID             : std_logic_vector(1 downto 0);
   signal   TxData         : UINT8_ARRAY(PORTS - 1 downto 0);
   signal   TxData1,
            TxData2        : SLV8_ARRAY(PORTS - 1 downto 0);
   signal   LedBlink       : integer := 0;
   signal   DivBy2toN      : unsigned (4 downto 0);
   signal   Ch1Data,
            Ch2Data        : SLV8_Array(PORTS-1 downto 0);
   signal   DivBy4         : unsigned(1 downto 0) := "00";

   attribute IOSTANDARD    : string;
   attribute IOSTANDARD of SPI_CS_n, SPI_MOSI, SPI_MISO, SPI_SClk,
            PllOut0, PllOut1, SwVid0, SwVid1, SwFilt0, SwFilt1, TtlOut, VidSel,
            AM_ADC_Data, AM_ADC_Clk, AM_ADC_CS_n,
            Sw50_Ohm, RefPll0, RefPll1,
            EncDataTtl, EncClkTtl, BsDataTtl, BsClkTtl,
            DQM, SDI, Lock, FPGA_ID0,
            AM_DAC_CS_n, AM_DAC_Clk, AM_DAC_Data : signal is "LVCMOS33";

   attribute IOSTANDARD of IF_Ovf, IF_Clk, IF_Data,
            MonOvf, MonClk, MonData,
            BS_Ovf, BS_Clk, BS_Data,
            ADC_Sync, ADC_SDIO, ADC_SClk, ADC_CS_n, ADC_OE_n, ADC_PwrDn,
            BS_ADC_LowZ, BS_ADC_PwrDn, BS_ADC_SE, BS_ADC_SClk, BS_ADC_CS_n, BS_ADC_SDIO,
            BS_DAC_Sel_n, BS_DAC_SClk, BS_DAC_MOSI,
            BS_PllOut, BS_RefPll, FPGA_ID1,
            BS_I2C_SCl, BS_I2C_SDa,
            DacClk0, DacClk1, DacRst, Dac0SpiCS_n, Dac1SpiCS_n,
            DacSpiClk, DacSpiSDIO, Dac0, Dac1 : signal is "LVCMOS18";

   attribute MARK_DEBUG : string;
   attribute MARK_DEBUG of
            Ch1Data, Ch2Data,
            Dac0, Dac1 : signal is "TRUE";

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

   ID          <= FPGA_ID1 & FPGA_ID0;

   SerDes : if (DEMOD_COMB = "COMB") generate
      Ch1SerDes_u : CombinerSerDesIn
         Generic Map
         (
            CHANNEL  => 1,
            PORTS    => PORTS+1
         )
         Port Map
         (
               Clk93M            => MonClk,
               ClkIn_p           => PrevClkIO_p,
               ClkIn_n           => PrevClkIO_n,
               Reset             => SysRst(SysRst'left),
               DataIn_p          => PrevDataIO_p,
               DataIn_n          => PrevDataIO_n,
               DataOut           => Ch1Data
      );
      Ch2SerDes_u : CombinerSerDesIn
         Generic Map
         (
            CHANNEL  => 2,
            PORTS    => PORTS+1
         )
         Port Map
         (
               Clk93M            => MonClk,
               ClkIn_p           => NextClkIO_p,
               ClkIn_n           => NextClkIO_n,
               Reset             => SysRst(SysRst'left),
               DataIn_p          => NextDataIO_p,
               DataIn_n          => NextDataIO_n,
               DataOut           => Ch2Data
      );
   else generate

      TxDataCast : process(TxData)
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
   end generate;

END rtl;
