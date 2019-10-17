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
      CommandIO         : INOUT std_logic_vector(3 downto 0); -- 3:2 to Ch2, 1:0 to Ch1
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
         PORTS    : natural := 5
      );
      Port (
         Clk,
         Reset             : in  std_logic;
         DataIn_p,
         DataIn_n          : in  STD_LOGIC_VECTOR(PORTS-1 downto 0);
         Command           : out std_logic_vector(1 downto 0);
         DataOut           : out SLV8_ARRAY(PORTS-1 downto 0)
      );
   end component CombinerSerDesIn;

   component DemodSerDesOut is
      Generic (
         PORTS    : natural := 5
      );
      Port (
         Clk,
         Reset,
         Active            : in std_logic;
         TxData            : in SLV8_ARRAY(PORTS-1 downto 0);
         Command           : in std_logic_vector(1 downto 0);
         DataOut_p,
         DataOut_n         : out STD_LOGIC_VECTOR(PORTS-1 downto 0)
      );
   end component DemodSerDesOut;

   component I2C_FS714x
      PORT(
         clk,
         reset,
         sda_i,
         scl_i          : IN  std_logic;
         sda_t,
         sda_o,
         scl_t,
         scl_o          : OUT std_logic
      );
   END component I2C_FS714x;

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

   COMPONENT NCO_IQ
      PORT (
         aclk : IN STD_LOGIC;
         s_axis_config_tvalid : IN STD_LOGIC;
         s_axis_config_tdata : IN STD_LOGIC_VECTOR(23 DOWNTO 0);
         m_axis_data_tvalid : OUT STD_LOGIC;
         m_axis_data_tdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
      );
   END COMPONENT;

   COMPONENT spiBusInterface
      PORT (
         Clk, GlitchReset,
         spiCS, spiSClk,
         spiDataIn   : in  std_logic;
         spiDataOut,
         spiDataOE,
         spiError,
         wr0,
         wr1,
         wr2,
         wr3,
         cs          : out std_logic;
         addr        : out STD_LOGIC_VECTOR(12 DOWNTO 0);
         dataIn      : out STD_LOGIC_VECTOR(31 DOWNTO 0);
         dataOut     : in  STD_LOGIC_VECTOR(31 downto 0)
      );
   END component;

   COMPONENT blk_mem_gen_0
      PORT (
         clka     : IN STD_LOGIC;
         ena      : IN STD_LOGIC;
         wea      : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
         addra    : IN STD_LOGIC_VECTOR(12 DOWNTO 0);
         dina     : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
         douta    : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
      );
   END COMPONENT;

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
   SIGNAL   RamWr,
            CommandIn,
            CommandOut     : std_logic_vector(3 downto 0);
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
   signal   Reset          : std_logic := '1';
   signal   SysRst         : std_logic_vector(3 downto 0) := (others=>'1');
   signal   ID             : std_logic_vector(1 downto 0);
   signal   TxData,
            TxData1,
            TxData2        : SLV8_ARRAY(PORTS - 1 downto 0);
   signal   LedBlink       : integer := 0;
   signal   DivBy2toN      : unsigned (4 downto 0);
   signal   Ch1Data,
            Ch2Data        : SLV8_Array(PORTS-1 downto 0);

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
            BS_PllOut, BS_RefPll, FPGA_ID1, CommandIO,
            BS_I2C_SCl, BS_I2C_SDa,
            DacClk0, DacClk1, DacRst, Dac0SpiCS_n, Dac1SpiCS_n,
            DacSpiClk, DacSpiSDIO, Dac0, Dac1 : signal is "LVCMOS18";

   attribute MARK_DEBUG : string;
   attribute MARK_DEBUG of /*IF_DataReg, NcoCos, Freq, RamCS, RamWr, RamAddr,
            SpiErrored, SpiErrorRst,
            SPI_CS_n, SPI_MOSI, SPI_MISO, Spi_SClk,
            BS_DAC_Sel_n, BS_DAC_SClk, BS_DAC_MOSI,
            SwVid0, SwVid1, SwFilt0, SwFilt1, VidSel,
            ID, CommandIO, BS_PllHold,
            PllHold0, PllHold1,*/
            Ch1Data, Ch2Data,
            Dac0, Dac1 : signal is "TRUE";

BEGIN

   SysRstProcess : process(MonClk)
   begin
      if (rising_edge(MonClk)) then
         SysRst <= SysRst(2 downto 0) & probe_out4(5); --'0';
      end if;
   end process SysRstProcess;
/*
   Monitor_u : Monitor
      Generic Map (
         Width    => 18
      )
      Port Map (
         MonData  => MonDataReg,
         Attack   => probe_out0,
         Decay    => probe_out1,
         MonClk   => MonClk,
         MonSel   => VidSel,
         MonPos   => MonPos,
         MonNeg   => MonNeg,
         MonAddr  => VidSel
   );

   NcoSine <= NcoOut(29 downto 16);
   NcoCos  <= NcoOut(13 downto 0);
*/
   IF_Clk_process : process(MonClk)
   begin
      if (rising_edge(MonClk)) then
         DivBy2toN <= DivBy2toN + 1;
         IF_DataReg <= IF_Data;
         Toggle_u <= Toggle_u + 1;
/*
         if (Counter(2 downto 0) = "000") then  -- div 93MHz by 8
            if (Freq < unsigned(probe_out7)) then
               Freq <= Freq + 1;
            else
               Freq <= (others=>'0');
               Filter <= Filter + 1;
            end if;

            if (Freq(7 downto 0) = "000000") then
               AM_DacShift <= "000" & NcoCos(13 downto 2) & '0';
               if (Freq(8)) then
                  BS_DacShift <= "10" & probe_out1(9 downto 0) & "0000";
               else
                  BS_DacShift <= "00" & probe_out0(9 downto 0) & "0000";
               end if;
               AM_Adc      <= AM_AdcShift(11 downto 0);
            elsif (Freq(2 downto 0) = "111") then
               AM_AdcShift <= Am_AdcShift(10 downto 0) & AM_ADC_Data;
               AM_DacShift <= AM_DacShift(14 downto 0) & '0';
               BS_DacShift <= BS_DacShift(14 downto 0) & '0';
            end if;
         end if;

         if (Toggle_u = 0) then
            CountRst    <= '1';
            PllHold0    <= STD_LOGIC_VECTOR(PllCount0);
            PllHold1    <= STD_LOGIC_VECTOR(PllCount1);
            BS_PllHold  <= STD_LOGIC_VECTOR(BS_PllCount);
         else
            CountRst    <= '0';
         end if;

         if (Counter = 809) then      -- 115200 rate
            Counter    <= (others=>'0');
            DQM_Shifter <= DQM_Shifter(14 downto 0) & DQM_Shifter(15);   -- shift out MSB
            SDI_Shifter <= SDI_Shifter(14 downto 0) & SDI_Shifter(15);   -- shift out MSB
         else
            Counter <= Counter + 1;
         end if;
*/
      end if;
   end process IF_Clk_process;
/*
   MonClk_process: process (MonClk)
   begin
      if (rising_edge(MonClk)) then
         MonDataReg  <= MonData;
      end if;
   end process MonClk_process;
*/
   Dac0_Process : process(DacClk0)
   begin
      if (rising_edge(DacClk0)) then
         GainSF <= to_sfixed(probe_out8Reg, GainSF);
         CosSF <= resize(to_sfixed(NcoCos, CosSF) * GainSF, CosSF);
         if (SelVio = "00") then
            Dac0 <= IF_DataReg;
         elsif (SelVio = "01") then
            Dac0 <= MonDataReg;
         elsif (SelVio = "10") then
            Dac0 <= to_slv(CosSF);
 --        else
 --           Dac0 <= Re;
         end if;
      end if;
   end process Dac0_Process;
/*
   Dac1_Process : process(DacClk1)
   begin
      if (rising_edge(DacClk1)) then
          SinSF <= resize(to_sfixed(NcoSine, SinSF) * GainSF, CosSF);
        if (SelVio = "00") then
            Dac1 <= BS_DataReg;
        elsif (SelVio = "10") then
            Dac1 <= to_slv(SinSF);
--         else
--            Dac1 <= Im;
         end if;
      end if;
   end process Dac1_Process;

   BS_Clk_process : process(BS_Clk)
   begin
      if (rising_edge(BS_Clk)) then
         BS_DataReg <= BS_Data;
      end if;
   end process BS_Clk_process;


    --******************************************************************************
    --                             SPI Config Interface
    --******************************************************************************

   SpiErrorRst <= probe_out4Reg(5);

   LockProcess : process(MonClk)
   begin
      if (rising_edge(MonClk)) then
         if (SpiErrorRst) then
            SpiErrored <= '0';
         elsif (SpiError) then
            SpiErrored <= '1';
            LedBlink <= 93000000;
         elsif (LedBlink > 0) then
            LedBlink <= LedBlink - 1;
         end if;
      end if;
   end process LockProcess;

   SpiProcess : spiBusInterface
      port map (
        Clk          => MonClk,
        GlitchReset  => SpiErrorRst,
        spiCS        => not SPI_CS_n,
        spiSClk      => Spi_SClk,
        spiDataIn    => SPI_MOSI,
        spiDataOut   => SpiOut,
        spiDataOE    => SpiDataOE,
        spiError     => SpiError,
        cs           => RamCS,
        wr0          => RamWr(0),
        wr1          => RamWr(1),
        wr2          => RamWr(2),
        wr3          => RamWr(3),
        addr         => RamAddr,
        dataIn       => SpiDataOut,
        dataOut      => SpiDataIn
   );

   SPI_MISO <= SpiOut when SpiDataOE else 'Z';

   blockMem : blk_mem_gen_0
      PORT MAP (
         clka    => MonClk,
         ena     => RamCS,
         wea     => RamWr,
         addra   => RamAddr,
         dina    => SpiDataOut,
         douta   => SpiDataIn
   );

   Pll_0_Process : process(PllOut0, CountRst)
   begin
      if (CountRst) then
         PllCount0 <= (others=>'0');
      elsif (rising_edge(PllOut0)) then
         PllCount0 <= PllCount0 + 1;
      end if;
   end process Pll_0_Process;

   Pll_1_Process : process(PllOut1, CountRst)
   begin
      if (CountRst) then
         PllCount1 <= (others=>'0');
      elsif (rising_edge(PllOut1)) then
         PllCount1 <= PllCount1 + 1;
      end if;
   end process Pll_1_Process;

   BS_Pll_Process : process(BS_PllOut, CountRst)
   begin
      if (CountRst) then
         BS_PllCount <= (others=>'0');
      elsif (rising_edge(BS_PllOut)) then
         BS_PllCount <= BS_PllCount + 1;
      end if;
   end process BS_Pll_Process;

   NcoFreq <= STD_LOGIC_VECTOR(Freq) when (probe_out6Reg(8) = '0') else probe_out7;
   NCO : NCO_IQ
     PORT MAP (
       aclk                   => MonClk,
       s_axis_config_tvalid   => '1',
       s_axis_config_tdata    => NcoFreq,
       m_axis_data_tvalid     => open,
       m_axis_data_tdata      => NcoOut
     );
*/
   vio_u : vio_0
     PORT MAP (
       clk        => MonClk,
       probe_out0 => probe_out0,
       probe_out1 => probe_out1,
       probe_out2 => probe_out2,
       probe_out3 => probe_out3,
       probe_out4 => probe_out4,
       probe_out5 => SelVio,
       probe_out6 => probe_out6,
       probe_out7 => probe_out7,
       probe_out8 => probe_out8
     );
/*
   VioProcess : process(MonClk)
   begin
      if (rising_edge(MonClk)) then
         probe_out2Reg <= probe_out2;
         probe_out3Reg <= probe_out3;
         probe_out4Reg <= probe_out4;
         probe_out6Reg <= probe_out6;
         probe_out8Reg <= probe_out8;
      end if;
   end process VioProcess;
*/
   Toggle <= std_logic_vector(Toggle_u);
/*
   TtlOut      <= Toggle(12 downto 9);
   BsDataTtl   <= Toggle(2);
   BsClkTtl    <= Toggle(3);
   EncDataTtl  <= Toggle(4);
   EncClkTtl   <= Toggle(5);
   DQM         <= DQM_Shifter(15);
   SDI         <= SDI_Shifter(15);

   BS_DAC_Sel_n   <= Freq(7);
   BS_DAC_SClk    <= Freq(2) and not BS_DAC_Sel_n;
   BS_DAC_MOSI    <= BS_DacShift(15);
*/
   AM_DAC_CS_n    <= Freq(7);
   AM_DAC_Clk     <= Freq(2);
   AM_DAC_Data    <= AM_DacShift(15);
   AM_ADC_CS_n    <= Freq(7);
   AM_ADC_Clk     <= Freq(2);
/*
   ADC_Sync       <= '0';  -- Not used
   ADC_SDIO       <= '1';  -- Duty Cycle Stabilizer Enabled
   ADC_SClk       <= '1';  -- 2's Com
   ADC_CS_n       <= '1';  -- Force Pin Mode
   ADC_OE_n       <= '0';  -- Outputs Enabled
   ADC_PwrDn      <= '0';  -- Power On the chip

   BS_ADC_LowZ    <= probe_out3Reg(0);-- when (probe_out2Reg(5)) else Toggle(2); -- 0
   BS_ADC_PwrDn   <= probe_out3Reg(1);-- when (probe_out2Reg(5)) else Toggle(3); -- 0
   BS_ADC_SE      <= probe_out3Reg(2);-- when (probe_out2Reg(5)) else Toggle(4); -- 0
   BS_ADC_SClk    <= probe_out3Reg(3);-- when (probe_out2Reg(5)) else Toggle(5); -- 1
   BS_ADC_CS_n    <= probe_out3Reg(4);-- when (probe_out2Reg(5)) else Toggle(6); -- 1
   BS_ADC_SDIO    <= probe_out3Reg(5);-- when (probe_out2Reg(5)) else Toggle(7); -- 1

   DacRst         <= probe_out4Reg(0);-- when (probe_out2Reg(5)) else Toggle(2); -- 1
   Dac0SpiCS_n    <= probe_out4Reg(1);-- when (probe_out2Reg(5)) else Toggle(3); -- 0
   Dac1SpiCS_n    <= probe_out4Reg(2);-- when (probe_out2Reg(5)) else Toggle(4); -- 0
   DacSpiClk      <= probe_out4Reg(3);-- when (probe_out2Reg(5)) else Toggle(5); -- 0
   DacSpiSDIO     <= probe_out4Reg(4);-- when (probe_out2Reg(5)) else Toggle(6); -- 1

   SwVid0         <= std_logic_vector(Filter) when (probe_out6Reg(8) = '0') else probe_out6Reg(1 downto 0);
   SwVid1         <= std_logic_vector(Filter) when (probe_out6Reg(8) = '0') else probe_out6Reg(3 downto 2);
   SwFilt0        <= Filter(0) & Filter(1)    when (probe_out6Reg(8) = '0') else probe_out6Reg(5 downto 4);
   SwFilt1        <= Filter(0) & Filter(1)    when (probe_out6Reg(8) = '0') else probe_out6Reg(7 downto 6);
   Sw50_Ohm       <= probe_out6Reg(8);

   DacClk0     <= MonClk;--PllOut0;
   DacClk1     <= MonClk;--PllOut1;
   RefPll0     <= DivBy2toN(DivBy2toN'left-1);
   RefPll1     <= DivBy2toN(DivBy2toN'left);
   BS_RefPll   <= DivBy2toN(DivBy2toN'left);
*/
   ID          <= FPGA_ID1 & FPGA_ID0;
   Lock        <= CommandIn(1 downto 0) when (ID = CHANNEL_1) else CommandIn(3 downto 2);
   CommandIn   <= CommandIO;
   CommandIO   <= CommandOut when (ID = COMBINER) else "ZZZZ";

   SerDes : if (DEMOD_COMB = "COMB") generate
      Ch1SerDes_u : CombinerSerDesIn
         Generic Map
         (
            PORTS    => PORTS
         )
         Port Map
         (
               Clk               => MonClk,
               Reset             => SysRst(SysRst'left),
               DataIn_p          => NextDataIO_p,
               DataIn_n          => NextDataIO_n,
               DataOut           => Ch1Data,
               Command           => CommandOut(1 downto 0)
      );
      Ch2SerDes_u : CombinerSerDesIn
         Generic Map
         (
            PORTS    => PORTS
         )
         Port Map
         (
               Clk               => MonClk,
               Reset             => SysRst(SysRst'left),
               DataIn_p          => PrevDataIO_p,
               DataIn_n          => PrevDataIO_n,
               DataOut           => Ch2Data,
               Command           => CommandOut(3 downto 2)
      );
   else generate
      TxData(0) <= Toggle(5 downto 0) & "00"; --Dac0
      TxData(1) <= Toggle(7 downto 0);--Dac0(13 downto 6); TODO
      TxData(2) <= Toggle(3 downto 0) & "0000"; --  AM_Adc
      TxData(3) <= Toggle(11 downto 4);        --   AM_Adc
      TxData(4) <= Toggle(8 downto 1); --DQM_Reg;
      TxData1 <= TxData when (ID = CHANNEL_1) else (others=>(others=>'0'));
      TxData2 <= TxData when (ID = CHANNEL_2) else (others=>(others=>'0'));
      Ch1SerDes : DemodSerDesOut
         Generic Map(
            PORTS    => PORTS
         )
         Port MAP(
            Clk         => MonClk,
            Reset       => SysRst(SysRst'left),
            Active      => (ID ?= CHANNEL_1),
            TxData      => TxData1,
            Command     => CommandIn(1 downto 0),
            DataOut_p   => PrevDataIO_p,
            DataOut_n   => PrevDataIO_n
         );
     Ch2SerDes : DemodSerDesOut
         Generic Map(
            PORTS    => PORTS
         )
         Port MAP(
            Clk         => MonClk,
            Reset       => SysRst(SysRst'left),
            Active      => (ID ?= CHANNEL_2),
            TxData      => TxData2,
            Command     => CommandIn(3 downto 2),
            DataOut_p   => NextDataIO_p,
            DataOut_n   => NextDataIO_n
         );
   end generate;
/*
   I2C_U : I2C_FS714x
      PORT MAP(
         clk      => MonClk,
         reset    => Reset,
         sda_i    => BS_I2C_SDa,
         scl_i    => BS_I2C_SCl,
         sda_t    => sda_t,
         sda_o    => sda_o,
         scl_t    => scl_t,
         scl_o    => scl_o
      );

   BS_I2C_SCl <= scl_o when not scl_t else 'Z';
   BS_I2C_SDa <= sda_o when not sda_t else 'Z';
*/
END rtl;
