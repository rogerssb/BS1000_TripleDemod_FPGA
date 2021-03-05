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

      amAdcDataIn,
      spiCSn,
      spiDataOut,
      spiClk,
      pll0_OUT1,
      pll1_OUT1,
      FPGA_ID0,
      FPGA_ID1          : IN std_logic;
      PrevData_p,
      PrevData_n,
      NextData_p,
      NextData_n        : IN std_logic_vector(PORTS-1 downto 0);
      NextClk_p,
      NextClk_n,
      PrevClk_p,
      PrevClk_n         : IN std_logic;
      adc0,
      MonData           : IN std_logic_vector(13 downto 0);

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
      SideCar           : INOUT std_logic_vector(1 to 40)

   );
END DC_CombinerTop;

ARCHITECTURE rtl OF DC_CombinerTop IS

ARCHITECTURE rtl OF CmplPhsDetTb IS

   COMPONENT complexphasedetector_0
      PORT (
         clk : IN STD_LOGIC;
         ch1agc : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
         ch1imag : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
         ch1real : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
         ch2agc : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
         ch2imag : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
         ch2real : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
         lag_coef : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
         lead_coef : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
         swprate : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
         sweeplmt : IN STD_LOGIC_VECTOR(13 DOWNTO 0);
         agc1_gt_agc2 : OUT STD_LOGIC;
         abs_agc_diff : OUT STD_LOGIC_VECTOR(10 DOWNTO 0);
         maximagout : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
         maxrealout : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
         minimagout : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
         minrealout : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
         realxord : OUT STD_LOGIC;
         imagxord : OUT STD_LOGIC;
         imaglock : OUT STD_LOGIC_VECTOR(12 DOWNTO 0);
         imagout : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
         gainoutmax : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
         gainoutmin : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
         lag_out : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
         locked_n : OUT STD_LOGIC;
         nco_control_out : OUT STD_LOGIC_VECTOR(21 DOWNTO 0);
         phase_detect : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
         reallock : OUT STD_LOGIC_VECTOR(12 DOWNTO 0);
         realout : OUT STD_LOGIC_VECTOR(17 DOWNTO 0)
      );
   END COMPONENT complexphasedetector_0;

   COMPONENT AD9957
      PORT(
         clk,
         reset,
         DdsMiso        : IN  std_logic;
         DdsMosi,
         DdsCS_n,
         DdsClk,
         IO_Reset,
         DdsReset,
         DdsUpdate      : OUT std_logic
      );
   END COMPONENT AD9957;

   COMPONENT DiffDelay IS
      GENERIC(
         DATA_WIDTH  : positive := 18;
         LENGTH_BITS : positive := 10
      );
      PORT(
         clk,
         reset,
         AbeforeB       : IN  std_logic;
         DataInA,
         DataInB        : IN  std_logic_vector(DATA_WIDTH-1 downto 0);
         Diff           : IN  unsigned(LENGTH_BITS-1 downto 0);
         DataOutA,
         DataOutB       : OUT std_logic_vector(DATA_WIDTH-1 downto 0)
      );
   END COMPONENT DiffDelay;

   component PdClkMmcm
      port (
         reset,
         clk_in1           : in     std_logic;
         locked,
         clk_out1,
         clk_out2          : out    std_logic
      );
   end component;

   COMPONENT vio_0
      PORT (
         clk : IN STD_LOGIC;
         probe_out0 : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
         probe_out1 : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
         probe_out2 : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
         probe_out3 : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
         probe_out4 : OUT STD_LOGIC_VECTOR(11 DOWNTO 0);
         probe_out5 : OUT STD_LOGIC_VECTOR(11 DOWNTO 0);
         probe_out6 : OUT STD_LOGIC_VECTOR(13 DOWNTO 0);
         probe_out7 : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
         probe_out8 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
         probe_out9 : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
      );
   END COMPONENT;

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


   constant CHANNEL_1         : std_logic_vector(1 downto 0) := "00";
   constant CHANNEL_2         : std_logic_vector(1 downto 0) := "01";
   constant COMBINER          : std_logic_vector(1 downto 0) := "10";

  -- Signals
   SIGNAL   ResetDly       : STD_LOGIC_VECTOR(8 DOWNTO 0) := (others=>'1');
   signal   ID             : std_logic_vector(1 downto 0);
   signal   Ch1Data,
            Ch2Data        : SLV8_Array(PORTS-1 downto 0);
   signal LockPll, ClkStoppedXn, Clk1x, ClkNx : std_logic;


   attribute IOSTANDARD    : string;
   attribute IOSTANDARD of spiCSn, spiDataIn, spiDataOut, spiClk,
            pll0_OUT1, pll1_OUT1, video0InSelect, video1InSelect, video1OutSelect, video0OutSelect, VidSel,
            ch0ClkOut, ch0DataOut, ch1ClkOut, ch1DataOut, ch2ClkOut, ch2DataOut, ch3ClkOut, ch3DataOut,
            amAdcDataIn, amAdcClk, amAdcCSn,
            Sw50_Ohm, pll0_REF, pll1_REF,
            DQM, sdiOut, lockLed0n, lockLed1n, FPGA_ID0, FPGA_ID1,
            amDacCSn, amDacClk, amDacDataOut : signal is "LVCMOS33";

   attribute IOSTANDARD of adc0Clk, adc0,
            MonOvf, MonClk, MonData,
            ADC_Sync, ADC_SDIO, ADC_SClk, ADC_CS_n, ADC_OE_n, adc01_powerDown,
            SideCar,
            dac0_clk, dac1_clk, dac_rst, dac0_nCs, dac1_nCs,
            dac_sclk, dac_sdio, dac0_d, dac1_d : signal is "LVCMOS18";

   -- debug signals
   signal   MaxImagout,
            MaxRealout,
            MinImagout,
            MinRealout,
            GainOutMax,
            GainOutMin     : SLV18;
   signal   RealXord,
            ImagXord       : STD_LOGIC;
   signal   DataRealSlv,
            DataImagSlv,
            NcodRealSlv,
            NcodImagSlv,
            Real1RmsSlv,
            Imag1RmsSlv,
            Real1NoisySlv,
            Imag1NoisySlv,
            Real2NoisySlv,
            Imag2NoisySlv  : SLV18;
   signal   IlaCounter     : uint16 := x"0000";

   signal   DataInA,
            DataInB,
            DataOutA,
            DataOutB       : SLV18;
   signal   Diff           : signed(10 downto 0);

   attribute MARK_DEBUG : string;
   attribute MARK_DEBUG of RealCmb, ImagCmb, RealLock, ImagLock, Locked,
      DataRealSlv, DataImagSlv, NcodRealSlv, NcodImagSlv, Real1NoisySlv,
      Imag1NoisySlv, Real2NoisySlv, Imag2NoisySlv, PrnEn,
      Ch1Agc, Ch2Agc,  LagCoef, LeadCoef, NoiseGain1, NoiseGain2, Real1RmsSlv,
      Imag1RmsSlv, Filtered1Real, Filtered1Imag, Filtered2Real, Filtered2Imag,
      agc1_gt_agc2, abs_agc_diff, nco_control_out, phase_detect, lag_out,
      MaxImagout, MaxRealout, MinImagout, MinRealout, RealXord, ImagXord,
      GainOutMax, GainOutMin, IlaCounter : signal is "TRUE";

BEGIN

   Clk            <= MonClk;

   SideCar(2)   <= IF_BS_n;
   SideCar(4)   <= DdsData(17)   when (IF_BS_n) else 'Z';
   SideCar(6)   <= DdsData(16)   when (IF_BS_n) else 'Z';
   SideCar(8)   <= DdsData(15)   when (IF_BS_n) else 'Z';
   SideCar(10)  <= DdsData(14)   when (IF_BS_n) else 'Z';
   SideCar(12)  <= DdsData(13)   when (IF_BS_n) else 'Z';
   SideCar(14)  <= DdsData(12)   when (IF_BS_n) else 'Z';
   SideCar(16)  <= DdsData(11)   when (IF_BS_n) else 'Z';
   SideCar(18)  <= DdsData(10)   when (IF_BS_n) else 'Z';
   SideCar(20)  <= DdsData(9)    when (IF_BS_n) else 'Z';
   SideCar(22)  <= DdsData(8)    when (IF_BS_n) else 'Z';
   SideCar(24)  <= DdsData(7)    when (IF_BS_n) else 'Z';
   SideCar(26)  <= DdsData(6)    when (IF_BS_n) else 'Z';
   SideCar(28)  <= DdsData(5)    when (IF_BS_n) else 'Z';
   SideCar(30)  <= DdsData(4)    when (IF_BS_n) else 'Z';
   SideCar(34)  <= DdsData(3)    when (IF_BS_n) else BS_ADC_SDIO;
   SideCar(36)  <= DdsData(2)    when (IF_BS_n) else BS_ADC_SClk;
   SideCar(38)  <= DdsData(1)    when (IF_BS_n) else BS_ADC_CS_n;
   SideCar(40)  <= DdsData(0)    when (IF_BS_n) else BS_ADC_LowZ;

   SideCar(11)  <= DdsIO_Reset   when (IF_BS_n) else BS_ADC_PwrDn;
   SideCar(15)  <= DdsTxEn       when (IF_BS_n) else BS_RefPll;
   SideCar(19)  <= DdsIO_Update  when (IF_BS_n) else BS_I2C_SCl;
   SideCar(21)  <= DdsReset      when (IF_BS_n) else BS_I2C_SDa;
   SideCar(23)  <= DdsCS_n       when (IF_BS_n) else BS_DAC_Sel_n;
   SideCar(25)  <= DdsSClk       when (IF_BS_n) else BS_DAC_SClk;
   SideCar(27)  <= DdsMosi       when (IF_BS_n) else BS_DAC_MOSI;
   SideCar(29)  <= DdsMiso       when (IF_BS_n) else BS_ADC_SE;

   BS_D(13)     <= SideCar(4)  when (not IF_BS_n) else '0';
   BS_D(12)     <= SideCar(6)  when (not IF_BS_n) else '0';
   BS_D(11)     <= SideCar(8)  when (not IF_BS_n) else '0';
   BS_D(10)     <= SideCar(10) when (not IF_BS_n) else '0';
   BS_D(9)      <= SideCar(12) when (not IF_BS_n) else '0';
   BS_D(8)      <= SideCar(14) when (not IF_BS_n) else '0';
   BS_D(7)      <= SideCar(16) when (not IF_BS_n) else '0';
   BS_D(6)      <= SideCar(18) when (not IF_BS_n) else '0';
   BS_D(5)      <= SideCar(20) when (not IF_BS_n) else '0';
   BS_D(4)      <= SideCar(22) when (not IF_BS_n) else '0';
   BS_D(3)      <= SideCar(24) when (not IF_BS_n) else '0';
   BS_D(2)      <= SideCar(26) when (not IF_BS_n) else '0';
   BS_D(1)      <= SideCar(28) when (not IF_BS_n) else '0';
   BS_D(0)      <= SideCar(30) when (not IF_BS_n) else '0';
   SideCarClk   <= SideCar(32);
   BS_PllOut    <= SideCar(17) when (not IF_BS_n) else '0';
   DdsSyncClk   <= SideCar(17) when (not IF_BS_n) else '0';
   IF_BS_n      <= IlaCounter(8);

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
         ResetDly <= ResetDly(ResetDly'left-1 downto 0) & '0';
         Reset    <= ResetDly(ResetDly'left);
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
            Reset             => Reset,
            ClkIn1_p          => PrevClk_p,
            ClkIn1_n          => PrevClk_n,
            DataIn1_p         => PrevData_p,
            DataIn1_n         => PrevData_n,
            DataOut1          => Ch1Data,
            ClkIn2_p          => NextClk_p,
            ClkIn2_n          => NextClk_n,
            DataIn2_p         => NextData_p,
            DataIn2_n         => NextData_n,
            DataOut2          => Ch2Data
   );

   VIO : vio_0
      PORT MAP (
         clk         => Clk,
         probe_out0  => LagCoef,
         probe_out1  => LeadCoef,
         probe_out2  => NoiseGain1,
         probe_out3  => NoiseGain2,    -- 13312 is 0dB s/n
         probe_out4  => Ch1Agc,
         probe_out5  => Ch2Agc,
         probe_out6  => SweepLimit,
         probe_out7  => SweepRate,
         probe_out8  => PhaseInc,
         probe_out9  => Vio9
   );

   CmplxPhsDet : complexphasedetector_0
   PORT MAP (
      clk            => Clk,
      ch1agc         => Ch1Agc,
      ch2agc         => Ch2Agc,
      ch1real        => Ch1Real,
      ch1imag        => Ch1Imag,
      ch2real        => Ch2Real,
      ch2imag        => Ch2Imag,
      lag_coef       => LagCoef,
      lead_coef      => LeadCoef,
      sweeplmt       => SweepLimit,
      swprate        => SweepRate,
      realout        => RealCmb,
      imagout        => ImagCmb,
      reallock       => RealLock,
      imaglock       => ImagLock,
      locked_n       => Locked,
      agc1_gt_agc2   => agc1_gt_agc2,
      lag_out        => lag_out,
      nco_control_out=> nco_control_out,
      phase_detect   => phase_detect,
      abs_agc_diff   => abs_agc_diff,
      maximagout     => MaxImagout,
      maxrealout     => MaxRealout,
      minimagout     => MinImagout,
      minrealout     => MinRealout,
      realxord       => RealXord,
      imagxord       => ImagXord,
      gainoutmax     => GainOutMax,
      gainoutmin     => GainOutMin
   );

   dac0_d      <= RealCmb(17 downto 4);
   dac1_d      <= ImagCmb(17 downto 4);
   lockLed0n   <= not RealLock(12);
   lockLed1n   <= not ImagLock(12);
   ch3DataOut  <= RealCmb(17) when (not Vio9(15)) else ImagCmb(17);
   ch3ClkOut   <= PrnEnDly(to_integer(unsigned(Vio9(3 downto 0))));

   DdsProc: process (DdsPdClkBufG)
   begin
      if (rising_edge(DdsPdClkBufG)) then
         RealCmbFF      <= RealCmb;
         ImagCmbFF      <= ImagCmb;
         ImagCmbFFDly   <= ImagCmbFF;
      end if;
   end process DdsProc;

   DDS2x : process (DdsPdClk2xBufg)
   begin
      if (rising_edge(DdsPdClk2xBufg)) then
         if (DdsPdClkBufg) then
            DdsData <= ImagCmbFFDly;
         else
            DdsData <= RealCmbff;
         end if;
      end if;
   end process;

   -- The upconverter mixes RR and II then adds, II is -1 so needs inverted

   DdsClkBufg : PdClkMmcm
      port map (
         clk_in1  => SideCarClk,
         reset    => Reset,
         locked   => open,
         clk_out1 => DdsPdClkBufG,
         clk_out2 => DdsPdClk2xBufg
   );

   AD9957_u : AD9957
      PORT MAP(
      clk         => Clk,
      reset       => Reset,---SweepLimit(0),
      DdsMiso     => DdsMiso,
      DdsMosi     => DdsMosi,
      DdsCS_n     => DdsCS_n,
      DdsClk      => DdsSClk,
      IO_Reset    => DdsIO_Reset,
      DdsReset    => DdsReset,
      DdsUpdate   => DdsIO_Update
   );

   Delay_u : DiffDelay
      GENERIC MAP (
         DATA_WIDTH  => 18,
         LENGTH_BITS => 10
      )
      PORT MAP (
         clk         => Clk,
         reset       => Reset,
         AbeforeB    => SweepLimit(1),
         DataInA     => DataInA,
         DataInB     => DataInB,
         Diff        => unsigned(SweepRate(9 downto 0)),
         DataOutA    => DataOutA,
         DataOutB    => DataOutB
      );

   DiffDly: process (Clk)
   begin
      DataInA <= "00" & std_logic_vector(IlaCounter);
      DataInB <= "11" & std_logic_vector(IlaCounter);
      Diff    <= signed('0' & DataOutA(9 downto 0)) - signed('0' & DataOutB(9 downto 0));
   end process DiffDly;

END rtl;
