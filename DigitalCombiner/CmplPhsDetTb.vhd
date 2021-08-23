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

Module Name: CmplPhsDetTb.vhd
Description:

ARGUMENTS :
   VioBits bit definitions
      31    IF_BS_n
      30    Enable AM 2
      29    Enable AM 1
      28    Enable Slight Offset on NCO1
      26:24 Attack   the higher, the slower
      22:20 Decay    Decay should be lower than attack to avoid overdriving the system should signal pop up
      17    Recovered Data Delay Select
      16    I/Q recovered data mux
      15:12 IandD Alignment
      11:8  Recovered Data Delay
      7     Enable Offset Frequency
      4     Ch1ThenCh2
      1:0   Modulation Mode

      Data recovery timing is affected by Delay, IandD alignment and Recovered Delay.
      If Delay is not zero or OQPSK, then the two bit stream will be out of alignment
      and the IandD sums will be out of phase and not necessarily optimal

   Delay of x20 and VioBits = 07706601 gives no bit errors and optimal sampling

   Note, the BitError/ErrorCount section only works if the complex phase detector is
   locked on CH1 (agc1_gt_agc2 is high) and VioBits(28) is low which forces the ch1
   phase offset to zero

Dependencies:

----------------------------------------------------------------------------
                               DETAILS
----------------------------------------------------------------------------
Test results:
   0 S/N = 13312 noise gain yields
   100-0 6e-3
   75-25 2e-3
   50-50 5e-4  Equal to 10100 noise on one channel or -2.4dB gain
   25-75 1e-3
   0-100 6e-3

----------------------------------------------------------------------------
                               HISTORY
----------------------------------------------------------------------------
9-6-16 Initial release FZ
-------------------------------------------------------------
*/

LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
use IEEE.math_real.all;
Library UNISIM;
use UNISIM.vcomponents.all;
use work.fixed_pkg.all;
USE work.Semco_pkg.ALL;

ENTITY CmplPhsDetTb IS
   GENERIC (
      PORTS       : natural := 5
   );
   PORT (
         adc0Clk,
         adc0_overflow,
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
--         VidSel            : OUT std_logic_vector(2 downto 0);
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
   END CmplPhsDetTb;


ARCHITECTURE rtl OF CmplPhsDetTb IS


   component systemClock
      port
         (
         clk_in1           : in     std_logic;
         -- Clock out ports
         clk1x,
         clk2x,
         clkOver2,
         locked            : out    std_logic
         );
   end component systemClock;

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
         clk         : IN STD_LOGIC;
         probe_out0  : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
         probe_out1  : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
         probe_out2  : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
         probe_out3  : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
         probe_out4  : OUT STD_LOGIC_VECTOR(11 DOWNTO 0);
         probe_out5  : OUT STD_LOGIC_VECTOR(11 DOWNTO 0);
         probe_out6  : OUT STD_LOGIC_VECTOR(13 DOWNTO 0);
         probe_out7  : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
         probe_out8  : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
         probe_out9  : OUT STD_LOGIC_VECTOR( 7 DOWNTO 0);
         probe_out10 : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
         probe_out11 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
         probe_out12 : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
         probe_out13 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
         probe_out14 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
      );
   END COMPONENT;

   COMPONENT bert_lfsr
      PORT (
         clock         : in  std_logic;
         reset         : in  std_logic;
         enable        : in  std_logic;
         reload        : in  std_logic;
         poly          : in  std_logic_vector(23 downto 0);
         poly_length   : in  std_logic_vector(4  downto 0);
         load_data     : in  std_logic_vector(23 downto 0);
         data          : out std_logic_vector(23 downto 0);
         serial        : out std_logic
      );
   END COMPONENT BERT_LFSR;

   COMPONENT CmplxMult
      GENERIC (
         IN_WIDTH  : integer := 8;
         IN_BINPT  : integer := 7;
         OUT_WIDTH : integer := 8;
         OUT_BINPT : integer := 3
      );
      PORT(
         clk,
         reset,
         ce,
         ValidIn,
         StartIn,
         ReadyIn        : IN  std_logic;
         ReInA,
         ImInA,
         ReInB,
         ImInB          : IN  sfixed(IN_WIDTH-IN_BINPT-1 downto -IN_BINPT);
         ReOut,
         ImOut          : OUT sfixed(OUT_WIDTH-OUT_BINPT-1 downto -OUT_BINPT);
         ValidOut,
         StartOut       : OUT std_logic
      );
   END COMPONENT CmplxMult;


   COMPONENT OffsetNCO IS
      PORT (
         aclk : IN STD_LOGIC;
         aresetn : IN STD_LOGIC;
         s_axis_config_tvalid : IN STD_LOGIC;
         s_axis_config_tready : OUT STD_LOGIC;
         s_axis_config_tdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
         m_axis_data_tvalid : OUT STD_LOGIC;
         m_axis_data_tready : IN STD_LOGIC;
         m_axis_data_tdata : OUT STD_LOGIC_VECTOR(47 DOWNTO 0)
      );
   END COMPONENT;

   COMPONENT Lowpass66
      PORT (
         aclk : IN STD_LOGIC;
         aresetn  : IN STD_LOGIC;
         s_axis_data_tvalid   : IN STD_LOGIC;
         s_axis_data_tdata    : IN STD_LOGIC_VECTOR(47 DOWNTO 0);
         s_axis_data_tready,
         m_axis_data_tvalid   : OUT STD_LOGIC;
         m_axis_data_tdata    : OUT STD_LOGIC_VECTOR(47 DOWNTO 0)
      );
   END COMPONENT;

   COMPONENT gng
      GENERIC (
          INIT_Z1    : signed(63 downto 0) := 64x"45D000FFFFF005FF"; -- 05,030,521,883,283,424,767;
          INIT_Z2    : signed(63 downto 0) := 64x"FFFCBFFFD8000680"; -- 18,445,829,279,364,155,008;
          INIT_Z3    : signed(63 downto 0) := 64x"FFDA350000FE95FF"  -- 18,436,106,298,727,503,359
      );
      PORT (
          clk,                      -- system clock
          rstn,                     -- system synchronous reset, active low
          ce         : IN  STD_LOGIC;  -- clock enable
          valid_out  : OUT STD_LOGIC;  -- output data valid
          data_out   : OUT SLV16     -- output data, s<16,11>
      );
   END COMPONENT gng;

   COMPONENT DigitalCombiner
      PORT(
      clk,
      clk2x,
      clk4x,
      reset,
      ce,
      cs,
      wr0, wr1, wr2, wr3,
      busClk            : IN  std_logic;
      re1In,
      im1In,
      re2In,
      im2In             : IN  float_1_18;
      ch1agc,
      ch2agc            : IN  SLV12;
      addr              : IN  std_logic_vector(12 downto 0);
      dataIn            : IN  SLV32;
      dataOut           : OUT SLV32;
      maximagout,
      maxrealout,
      minimagout,
      minrealout,
      imagout,
      realout,
      ifOut,
      gainoutmax,
      gainoutmin,
      phase_detect      : OUT SLV18;
      agc1_gt_agc2,
      realxord,
      imagxord,
      combinerEn,
      locked,
      ifBS_n            : OUT STD_LOGIC;
      imaglock,
      reallock          : OUT STD_LOGIC_VECTOR(12 DOWNTO 0);
      lag_out           : OUT SLV32;
      nco_control_out   : OUT STD_LOGIC_VECTOR(21 DOWNTO 0)
      );
   END COMPONENT DigitalCombiner;

   COMPONENT dualQuadDdc
      PORT(
         clk,
         reset             : IN  std_logic;
         ifIn1,
         ifIn2             : IN  SLV18;
         iOut1,
         qOut1,
         iOut2,
         qOut2             : OUT SLV18;
         syncOut           : OUT std_logic
      );
   END COMPONENT dualQuadDdc;

   -- Constants
   constant Plus1             : Float_1_18 := to_sfixed( 0.707 / 4.0, 0, -17);
   constant Neg1              : Float_1_18 := to_sfixed(-0.707 / 4.0, 0, -17);
   constant Zero              : Float_1_18 := to_sfixed(0.0, 0, -17);
   constant One               : Float_1_18 := to_sfixed(1.0, 0, -17);
   constant I                 : natural := 1;
   constant Q                 : natural := 0;
   constant NCO_DLY           : natural := 4;
   constant FILT_OUTS         : sfixed(1 downto -16) := (others=>'0');
   CONSTANT PHASE_10K         : sfixed(31 downto 0) := to_sfixed(10000.0 / (280.0e6 / 6.0) * 65536.0 * 65536.0, 31, 0);

   type     Modulation        is (BPSK, QPSK, OQPSK, SOQPSK);
   type     mcuFsm            is (IDLE, SETUP, WRITE, FINISH);

   -- Signals
   signal   mcuMode           : mcuFsm := IDLE;
   signal   Mode              : Modulation;
   signal   agc1_gt_agc2      : STD_LOGIC;
   signal   nco_control_out   : STD_LOGIC_VECTOR(21 DOWNTO 0);
   signal   lag_out           : SLV32;
   signal   SweepLimit        : STD_LOGIC_VECTOR(13 DOWNTO 0);
   signal   phase_detect,
            SweepRate,
            ifOut             : SLV18;
   signal   Locked,
            PrnDataI,
            PrnDataQ,
            PrnDelayIn,
            PrnEn,
            NoiseEn,
            Noise1Vld,
            Noise2Vld,
            FirDataValid,
            NotFirstTime,
            PhsDetLocked,
            wrLsb, wrMsb, cs, TwoWords,
            Clk,
            Clk2x,
            Clk1x,
            clkOver2,
            Reset             : std_logic := '0';
   signal   Ch1Agc,
            Ch2Agc            : std_logic_vector(11 downto 0);
   signal   LagCoef,
            LeadCoef,
            NoiseGain1,
            NoiseGain2,
            AM_Amp1,
            AM_Amp2,
            ICmbFF,
            QCmbFF,
            QCmbFFDly,
            ICmb,
            QCmb              : SLV18;
   signal   ILock,
            QLock             : std_logic_vector(12 downto 0);
   signal   Noise1,
            Noise2,
            Noise1Out,
            Noise2Out         : SLV16;
   signal   IIandD,
            QIandD            : sfixed(2 downto -17);
   signal   DataI,
            DataQ,
            DelayI,
            DelayQ,
            MultIn1I,
            MultIn1Q,
            MultIn2I,
            MultIn2Q,
            NcodI,
            NcodQ,
            OffTunedI,
            OffTunedQ,
            Noise2Rms,
            I1Rms,
            Filtered1NoiseDly,
            Filtered2NoiseDly,
            I1Noisy,
            Q1Noisy,
            I2Noisy,
            Q2Noisy        : FLOAT_1_18 := (others=>'0');
   signal   FilteredI,
            FilteredQ,
            AM_Mod1,
            AM_Mod2,
            Noise1Gained,
            Noise2Gained   : sfixed(1 downto -16) := (others=>'0');
   signal   Filtered1Noise,
            Filtered2Noise : sfixed(2 downto -15);
   signal   DataRate       : integer range 0 to 127;
   signal   FirDataIn1,
            FirDataOut1,
            FirDataIn2,
            FirDataOut2    : std_logic_vector(47 downto 0);
   signal   NcoData,
            AM_Sines1,
            AM_Sines2,
            OffTunedSines  : std_logic_vector(47 downto 0);
   signal   PhaseInc,
            AM_Freq1,
            AM_Freq2,
            VioBits,
            DC_DataIn,
            DC_DataOut,
            DC_DataCapt    : SLV32;
   signal   ResetShft      : SLV18 := 18x"3FFFF";
   -- SideCar Signals
   signal   IF_BS_n,
            DdsPdClk,
            DdsSyncClk,
            DdsMiso,
            DdsCS_n,
            DdsSClk,
            DdsMosi,
            DdsIO_Reset,
            DdsTxEn,
            DdsIO_Update,
            DdsReset          : std_logic;
   signal   DdsData           : SLV18;
   signal   BS_D              : std_logic_vector(13 downto 0);
   signal   addr              : unsigned(12 downto 0) := 13x"0000";
   signal   BS_ADC_SDIO,
            BS_ADC_SClk,
            BS_ADC_CS_n,
            BS_ADC_LowZ,
            BS_ADC_PwrDn,
            BS_RefPll,
            BS_I2C_SCl,
            BS_I2C_SDa,
            BS_DAC_Sel_n,
            BS_DAC_SClk,
            BS_DAC_MOSI,
            BS_ADC_SE,
            BS_PllOut,
            DdsPdClkBufG,
            DdsPdClk2xBufg,
            SideCarClk,
            Ch1ThenCh2        : std_logic;

   attribute IOSTANDARD    : string;
   attribute IOSTANDARD of spiCSn, spiDataIn, spiDataOut, spiClk,
            pll0_OUT1, pll1_OUT1, video0InSelect, video1InSelect, video1OutSelect, video0OutSelect,-- VidSel,
            ch0ClkOut, ch0DataOut, ch1ClkOut, ch1DataOut, ch2ClkOut, ch2DataOut, ch3ClkOut, ch3DataOut,
            amAdcDataIn, amAdcClk, amAdcCSn, AM_Mod1, AM_Mod2, AM_Sines1, AM_Sines2,
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
   signal   MaxQout,
            MaxIout,
            MinQout,
            MinIout,
            GainOutMax,
            GainOutMin     : SLV18;
   signal   IXord,
            QXord,
            RecoveredData  : STD_LOGIC;
   signal   DataISlv,
            DataQSlv,
            NcodISlv,
            NcodQSlv,
            Noise2RmsSlv,
            I1RmsSlv,
            I1NoisySlv,
            Q1NoisySlv,
            I2NoisySlv,
            Q2NoisySlv     : SLV18;
   signal   BitCounter     : uint16 := x"0000";
   signal   BitCount,
            ErrorCount,
            BitErrors      : uint32 := 32x"0";
   signal   PrnDelay       : std_logic_vector(23 downto 0);
   signal   DataInA,
            DataInB,
            DataOutA,
            DataOutB       : SLV18;
   signal   DataDlyI,
            DataDlyQ       : FLOAT_ARRAY_1_18(127 downto 0) := (others=>(others=>'0'));
   signal   Delay          : SLV8;
   signal   IndexOut       : uint8 := x"00";
   signal   SampleCount    : integer := 1;
   signal   FreqOffset     : sfixed(5 downto 0) := 6x"0";
   signal   PhaseIncSF     : sfixed(31 downto 0);
   signal   SNR,
            NoiseGain      : real := 20.0;
   signal   NoiseGain_u    : ufixed(0 downto -17);

   attribute MARK_DEBUG : string;
   attribute MARK_DEBUG of ICmb, QCmb, ILock, QLock, PhsDetLocked, IndexOut,
      DataISlv, DataQSlv, NcodISlv, NcodQSlv, I1NoisySlv,
      Q1NoisySlv, I2NoisySlv, Q2NoisySlv, PrnEn, BitErrors, BitCount, ErrorCount, RecoveredData, PrnDelay,
      Noise2RmsSlv, I1RmsSlv,
      agc1_gt_agc2, nco_control_out, phase_detect, lag_out,
      MaxQout, MaxIout, MinQout, MinIout, IXord, QXord,
      GainOutMax, GainOutMin, BitCounter : signal is "TRUE";

constant in_simulation : boolean := false
--pragma synthesis_off
                                    or true
--pragma synthesis_on
;
constant in_synthesis : boolean := not in_simulation;

BEGIN

ClkGen : if (in_simulation) generate
   process begin
      wait for 5.00 ns;
      Clk <= not Clk;
   end process;

   LagCoef     <= 18x"00C80";
   LeadCoef    <= 18x"0A000";
   Ch1Agc      <= 12x"000";
   Ch2Agc      <= 12x"000";
   SweepLimit  <= 14x"16A8";
   SweepRate   <= 18x"00064";
   Delay       <=  8x"20";
   AM_Amp1     <= 18x"0_0000";
   AM_Freq1    <= 32x"0000_0000";
   AM_Amp2     <= 18x"0_0000";
   AM_Freq2    <= 32x"0000_0000";
   VioBits     <= 32x"0770_6680";

   MainProcess : process(ClkOver2)
   begin
      if (rising_edge(ClkOver2)) then
         if (Reset) then
            FreqOffset  <= to_sfixed(-2, FreqOffset);
            SNR         <= 20.0;
            NoiseGain   <= 0.0;
            PhaseIncSF  <= PHASE_10K;
            SampleCount <= 1;
         else
            PhaseIncSF <= resize(FreqOffset * PHASE_10K, PhaseIncSF);  -- -130Khz
            if (SampleCount < 256*50-1) then
               SampleCount <= SampleCount + 1;
            else
               SampleCount <= 0;
               if (FreqOffset = 2) then
                  FreqOffset  <= to_sfixed(-2, FreqOffset);
                  SNR         <= SNR - 3.0;
                  NoiseGain <= (10.0 ** (-SNR/20.0));
               else
                  FreqOffset <= resize(FreqOffset + 1, FreqOffset);
               end if;
            end if;
         end if;
      end if;
   end process;

   NoiseGain_u <= to_ufixed(NoiseGain, NoiseGain_u);
   NoiseGain1  <= to_slv(NoiseGain_u);
   NoiseGain2  <= to_slv(NoiseGain_u);
   PhaseInc <= to_slv(PhaseIncSF);

else generate
   Clk            <= MonClk;

   VIOs : vio_0
      PORT MAP (
         clk         => ClkOver2,
         probe_out0  => LagCoef,
         probe_out1  => LeadCoef,
         probe_out2  => NoiseGain1,
         probe_out3  => NoiseGain2,    -- x10000 is 0dB s/n
         probe_out4  => Ch1Agc,
         probe_out5  => Ch2Agc,
         probe_out6  => SweepLimit,
         probe_out7  => SweepRate,
         probe_out8  => PhaseInc,
         probe_out9  => Delay,
         probe_out10 => AM_Amp1,
         probe_out11 => AM_Freq1,
         probe_out12 => AM_Amp2,
         probe_out13 => AM_Freq2,
         probe_out14 => VioBits
   );

end generate;

   SideCar(2)     <= IF_BS_n;
   SideCar(4)     <= DdsData(17)   when (IF_BS_n) else 'Z';
   SideCar(6)     <= DdsData(16)   when (IF_BS_n) else 'Z';
   SideCar(8)     <= DdsData(15)   when (IF_BS_n) else 'Z';
   SideCar(10)    <= DdsData(14)   when (IF_BS_n) else 'Z';
   SideCar(12)    <= DdsData(13)   when (IF_BS_n) else 'Z';
   SideCar(14)    <= DdsData(12)   when (IF_BS_n) else 'Z';
   SideCar(16)    <= DdsData(11)   when (IF_BS_n) else 'Z';
   SideCar(18)    <= DdsData(10)   when (IF_BS_n) else 'Z';
   SideCar(20)    <= DdsData(9)    when (IF_BS_n) else 'Z';
   SideCar(22)    <= DdsData(8)    when (IF_BS_n) else 'Z';
   SideCar(24)    <= DdsData(7)    when (IF_BS_n) else 'Z';
   SideCar(26)    <= DdsData(6)    when (IF_BS_n) else 'Z';
   SideCar(28)    <= DdsData(5)    when (IF_BS_n) else 'Z';
   SideCar(30)    <= DdsData(4)    when (IF_BS_n) else 'Z';
   SideCar(34)    <= DdsData(3)    when (IF_BS_n) else BS_ADC_SDIO;
   SideCar(36)    <= DdsData(2)    when (IF_BS_n) else BS_ADC_SClk;
   SideCar(38)    <= DdsData(1)    when (IF_BS_n) else BS_ADC_CS_n;
   SideCar(40)    <= DdsData(0)    when (IF_BS_n) else BS_ADC_LowZ;

   SideCar(11)    <= DdsIO_Reset   when (IF_BS_n) else BS_ADC_PwrDn;
   SideCar(15)    <= DdsTxEn       when (IF_BS_n) else BS_RefPll;
   SideCar(19)    <= DdsIO_Update  when (IF_BS_n) else BS_I2C_SCl;
   SideCar(21)    <= DdsReset      when (IF_BS_n) else BS_I2C_SDa;
   SideCar(23)    <= DdsCS_n       when (IF_BS_n) else BS_DAC_Sel_n;
   SideCar(25)    <= DdsSClk       when (IF_BS_n) else BS_DAC_SClk;
   SideCar(27)    <= DdsMosi       when (IF_BS_n) else BS_DAC_MOSI;
   SideCar(29)    <= DdsMiso       when (IF_BS_n) else BS_ADC_SE;

   BS_D(13)       <= SideCar(4)  when (not IF_BS_n) else '0';
   BS_D(12)       <= SideCar(6)  when (not IF_BS_n) else '0';
   BS_D(11)       <= SideCar(8)  when (not IF_BS_n) else '0';
   BS_D(10)       <= SideCar(10) when (not IF_BS_n) else '0';
   BS_D(9)        <= SideCar(12) when (not IF_BS_n) else '0';
   BS_D(8)        <= SideCar(14) when (not IF_BS_n) else '0';
   BS_D(7)        <= SideCar(16) when (not IF_BS_n) else '0';
   BS_D(6)        <= SideCar(18) when (not IF_BS_n) else '0';
   BS_D(5)        <= SideCar(20) when (not IF_BS_n) else '0';
   BS_D(4)        <= SideCar(22) when (not IF_BS_n) else '0';
   BS_D(3)        <= SideCar(24) when (not IF_BS_n) else '0';
   BS_D(2)        <= SideCar(26) when (not IF_BS_n) else '0';
   BS_D(1)        <= SideCar(28) when (not IF_BS_n) else '0';
   BS_D(0)        <= SideCar(30) when (not IF_BS_n) else '0';
   SideCarClk     <= SideCar(32);
   BS_PllOut      <= SideCar(17) when (not IF_BS_n) else '0';
   DdsSyncClk     <= SideCar(17) when (not IF_BS_n) else '0';
   IF_BS_n        <= not VioBits(31);

   Reset          <= ResetShft(17);

   DataISlv       <= to_slv(DataI);
   DataQSlv       <= to_slv(DataQ);
   NcodISlv       <= to_slv(NcodI);
   NcodQSlv       <= to_slv(NcodQ);
   Noise2RmsSlv   <= to_slv(Noise2Rms);
   I1RmsSlv       <= to_slv(I1Rms);

   I1NoisySlv     <= to_slv(I1Noisy);
   Q1NoisySlv     <= to_slv(Q1Noisy);
   I2NoisySlv     <= to_slv(I2Noisy);
   Q2NoisySlv     <= to_slv(Q2Noisy);
   Mode           <= modulation'val(to_integer(unsigned(VioBits(1 downto 0))));

   SystemClock_u : systemClock
      port map (
         clk_in1  => Clk,
         clk1x    => Clk1x,
         clk2x    => Clk2x,
         clkOver2 => ClkOver2,
         locked   => Locked
      );

   LFSR11 : BERT_LFSR
      PORT MAP(
         clock       => ClkOver2,
         reset       => Reset,
         reload      => '0',
         enable      => PrnEn,
         poly        => 24x"0500",
         poly_length => 5x"0B",
         load_data   => 24x"9009",
         data        => open,
         serial      => PrnDataI
   );

   LFSR15 : BERT_LFSR
      PORT MAP(
         clock       => ClkOver2,
         reset       => Reset,
         reload      => '0',
         enable      => PrnEn,
         poly        => 24x"6000",
         poly_length => 5x"0F",
         load_data   => 24x"9009",
         data        => open,
         serial      => PrnDataQ
   );

   Delay_process: process (ClkOver2)
   begin
      if (rising_edge(ClkOver2)) then
         if (Locked) then
            ResetShft  <= ResetShft(16 downto 0) & not Locked;
            DataRate   <= DataRate + 1 when (DataRate < 9) else 0;
            if (BitCounter > 256) then
               NotFirstTime <= '1';
            end if;
            if (DataRate = 0) then
               BitCounter <= 16x"0" when (BitCounter = 1280) else BitCounter + 1;
               PrnEn   <= '1';
               case (Mode) is
                  when BPSK =>
                     DataI <= Plus1 when (PrnDataI) else Neg1;
                     DataQ <= Zero;
                  when QPSK =>
                     DataI <= Plus1 when (PrnDataI) else Neg1;
                     DataQ <= Plus1 when (PrnDataQ) else Neg1;
                  when OQPSK =>
                     DataI <= Plus1 when (PrnDataI) else Neg1;
                  when others =>
                     DataI <= Zero;
                     DataQ <= Zero;
               end case;
            elsif ((DataRate = 5) and (Mode = OQPSK)) then
               DataQ <= Plus1 when (PrnDataQ) else Neg1;   -- Delay Q a half bit
               -- PrnEn should have gone low on DataRate = 1
            else
               PrnEn <= '0';
            end if;

            DataDlyI <= DataDlyI(126 downto 0) & FilteredI;
            DataDlyQ <= DataDlyQ(126 downto 0) & FilteredQ;

            -- generate noise at twice the data rate to get a nice wide noise bandwidth
            NoiseEn      <= '1' when ((DataRate = 0) or (DataRate = 5)) else '0';

            I1Noisy      <= resize(AM_Mod1 * (Filtered1Noise    + OffTunedI), I1Noisy);
            Q1Noisy      <= resize(AM_Mod1 * (Filtered1NoiseDly + OffTunedQ), I1Noisy);
            Filtered1NoiseDly <= Filtered1Noise;

            I2Noisy      <= resize(AM_Mod2 * (Filtered2Noise    + NcodI), I2Noisy);
            Q2Noisy      <= resize(AM_Mod2 * (Filtered2NoiseDly + NcodQ), I2Noisy);
            Filtered2NoiseDly <= Filtered2Noise;

            Noise1Gained    <= resize(to_sfixed(Noise1, 3, -12) * to_sfixed(NoiseGain1, DataI), Noise1Gained);
            Noise2Gained    <= resize(to_sfixed(Noise2, 3, -12) * to_sfixed(NoiseGain2, DataI), Noise2Gained);

            Noise2Rms <= resize(Noise2Rms - (Noise2Rms sra 10) + (abs(Filtered2Noise) sra 10), I1Rms);
            I1Rms  <= resize(I1Rms  - (I1Rms  sra 10) + (abs(FilteredI)  sra 10), I1Rms);
         end if;
      end if;
   end process Delay_process;

   Ch1ThenCh2 <= VioBits(4);

  NoiseGen1 : gng
   GENERIC MAP (
      INIT_Z1 => 64x"45D000FFFFF005FF",     -- 05,030,521,883,283,424,767
      INIT_Z2 => 64x"FFFCBFFFD8000680",     -- 18,445,829,279,364,155,008
      INIT_Z3 => 64x"FFDA350000FE95FF"      -- 18,436,106,298,727,503,359
   )
   PORT MAP (
    clk        => ClkOver2,
    rstn       => not Reset,
    ce         => NoiseEn,
    valid_out  => Noise1Vld,
    data_out   => Noise1
);

  NoiseGen2 : gng
   GENERIC MAP (
      INIT_Z1 => 64x"C9B0_01FF_FFE0_09FF",   -- 14,533,118,196,545,751,551
      INIT_Z2 => 64x"FFF9_7FFF_B000_0D00",   -- 18,444,914,485,018,758,400
      INIT_Z3 => 64x"FFB5_6A00_00FF_2BFF"    -- 18,425,749,998,705,519,615
   )
   PORT MAP (
    clk        => ClkOver2,
    rstn       => not Reset,
    ce         => NoiseEn,
    valid_out  => Noise2Vld,
    data_out   => Noise2
);

   FirDataIn1 <= 6x"0" & to_slv(Noise1Gained) & 6x"0" & to_slv(Noise2Gained);
   FirDataIn2 <= 6x"0" & to_slv(DataI) & 6x"0" & to_slv(DataQ);

   Lowpass1 : Lowpass66
      PORT MAP (
         aclk                 => Clk2x,
         aresetn              => not Reset,
         s_axis_data_tvalid   => '1',
         s_axis_data_tdata    => FirDataIn1,
         s_axis_data_tready   => open,
         m_axis_data_tvalid   => FirDataValid,
         m_axis_data_tdata    => FirDataOut1
   );

   Lowpass2 : Lowpass66
      PORT MAP (
         aclk                 => Clk2x,
         aresetn              => not Reset,
         s_axis_data_tvalid   => '1',
         s_axis_data_tdata    => FirDataIn2,
         s_axis_data_tready   => open,
         m_axis_data_tvalid   => open,
         m_axis_data_tdata    => FirDataOut2
   );

   -- allow filter to settle to avoid unknowns in loop filters
   Filtered1Noise  <= to_sfixed(FirDataOut1(41 downto 24),   Filtered1Noise);
   Filtered2Noise  <= to_sfixed(FirDataOut1(17 downto 00),   Filtered1Noise);
   FilteredI  <= to_sfixed(FirDataOut2(41 downto 24),   FILT_OUTS);
   FilteredQ  <= to_sfixed(FirDataOut2(17 downto 00),   FILT_OUTS);

   -- generate the AM modulation frequencies
   AM_NCO1 : OffsetNCO
      PORT MAP (
         aclk                 => ClkOver2,
         aresetn              => VioBits(29),
         s_axis_config_tvalid => '1',
         s_axis_config_tdata  => AM_Freq1,
         m_axis_data_tready   => '1',
         s_axis_config_tready => open,
         m_axis_data_tvalid   => open,
         m_axis_data_tdata    => AM_Sines1
      );


   AM_NCO2 : OffsetNCO
      PORT MAP (
         aclk                 => ClkOver2,
         aresetn              => VioBits(30),
         s_axis_config_tvalid => '1',
         s_axis_config_tdata  => AM_Freq2,
         m_axis_data_tready   => '1',
         s_axis_config_tready => open,
         m_axis_data_tvalid   => open,
         m_axis_data_tdata    => AM_Sines2
      );

   AM_Process : process(ClkOver2)
   begin
      if (rising_edge(ClkOver2)) then
         AM_Mod1 <= resize(One + (to_sfixed(AM_Amp1, 1, -16) * to_sfixed(AM_Sines1(17 downto 0), 0, -17)), AM_Mod1);
         AM_Mod2 <= resize(One + (to_sfixed(AM_Amp2, 1, -16) * to_sfixed(AM_Sines2(17 downto 0), 0, -17)), AM_Mod2);
      end if;
   end process AM_Process;

   -- the off tune NCO pulls channel 1 slightly off center frequency since there's no carrier loop yet
   OffTuneNCO : OffsetNCO
      PORT MAP (
         aclk                 => ClkOver2,
         aresetn              => VioBits(28) or Reset,    -- must be low for ber testing, Reset pulse initializes the outputs
         s_axis_config_tvalid => '1',
         s_axis_config_tdata  => 32x"1000",
         m_axis_data_tready   => '1',
         s_axis_config_tready => open,
         m_axis_data_tvalid   => open,
         m_axis_data_tdata    => OffTunedSines
      );

   DelayI   <= DataDlyI(to_integer(signed(Delay)));
   DelayQ   <= DataDlyQ(to_integer(signed(Delay)));
   MultIn1I <= DataDlyI(0) when (Ch1ThenCh2) else DelayI;
   MultIn1Q <= DataDlyQ(0) when (Ch1ThenCh2) else DelayQ;

   OffTuneMult : CmplxMult
      GENERIC MAP(
         IN_WIDTH  => 18,
         IN_BINPT  => 17,
         OUT_WIDTH => 18,
         OUT_BINPT => 17
      )
      PORT MAP(
         clk         => ClkOver2,
         reset       => Reset,
         ce          => '1',
         ValidIn     => '1',
         StartIn     => '0',
         ReadyIn     => '1',
         ReInA       => MultIn1I,
         ImInA       => MultIn1Q,
         ReInB       => to_sfixed(OffTunedSines(17 downto 0), DataI),
         ImInB       => to_sfixed(OffTunedSines(24+17 downto 24), DataI),
         ReOut       => OffTunedI,
         ImOut       => OffTunedQ,
         ValidOut    => open,
         StartOut    => open
   );

   NCO : OffsetNCO
      PORT MAP (
         aclk                 => ClkOver2,
         aresetn              => VioBits(7) and not Reset,
         s_axis_config_tvalid => '1',
         s_axis_config_tdata  => PhaseInc,
         m_axis_data_tready   => '1',
         s_axis_config_tready => open,
         m_axis_data_tvalid   => open,
         m_axis_data_tdata    => NcoData
      );

   MultIn2I <= DataDlyI(0) when (not Ch1ThenCh2) else DelayI;
   MultIn2Q <= DataDlyQ(0) when (not Ch1ThenCh2) else DelayQ;

   ComplexMult : CmplxMult
      GENERIC MAP(
         IN_WIDTH  => 18,
         IN_BINPT  => 17,
         OUT_WIDTH => 18,
         OUT_BINPT => 17
      )
      PORT MAP(
         clk         => ClkOver2,
         reset       => Reset,
         ce          => '1',
         ValidIn     => '1',
         StartIn     => '0',
         ReadyIn     => '1',
         ReInA       => MultIn2I,
         ImInA       => MultIn2Q,
         ReInB       => to_sfixed(NcoData(17 downto 0), DataI),
         ImInB       => to_sfixed(NcoData(24+17 downto 24), DataI),
         ReOut       => NcodI,
         ImOut       => NcodQ,
         ValidOut    => open,
         StartOut    => open
   );

   -- COMB_LAG_COEF           13'bx_xxxx_xxxx_00xx
   -- COMB_LEAD_COEF          13'bx_xxxx_xxxx_01xx
   -- COMB_SWEEP_RATE         13'bx_xxxx_xxxx_10xx
   -- COMB_SWEEP_LIMIT        13'bx_xxxx_xxxx_110x
   -- COMB_OPTIONS            13'bx_xxxx_xxxx_111x
   -- COMB_REF_LEVEL          13'bx_xxxx_xxx1_00xx
   mcuProcess : process (ClkOver2)
   begin
      if (rising_edge(ClkOver2)) then
         case (mcuMode) is
            when IDLE =>
               wrLsb    <= '0';
               wrMsb    <= '0';
               cs       <= '0';
               mcuMode  <= SETUP;
            when SETUP =>
               case (addr) is
                  when 13x"00" =>
                     DC_DataIn <= 14x"000" & LagCoef;
                     TwoWords  <= '1';
                  when 13x"04" =>
                     DC_DataIn <= 14x"000" & LeadCoef;
                     TwoWords  <= '1';
                  when 13x"08" =>
                     DC_DataIn <= 14x"000" & SweepRate;
                     TwoWords  <= '1';
                  when 13x"0C" =>
                     DC_DataIn <= 18x"000" & SweepLimit;
                     TwoWords  <= '0';
                  when 13x"0E" =>
                     DC_DataIn <= 7x"08" & IF_BS_n & '0' & VioBits(22 downto 20) & '0' & VioBits(26 downto 24) & 16x"0000";
                     TwoWords  <= '0';
                  when others =>
                     DC_DataIn <= 14x"0000" & to_slv(to_sfixed(0.01, 0, -17));
                     TwoWords  <= '1';
               end case;
               mcuMode <= WRITE;
            when WRITE =>
               if (TwoWords) then
                  wrLsb <= '1';
                  wrMsb <= '1';
               else
                  wrLsb <= not Addr(1);
                  wrMsb <= Addr(1);
               end if;
               cs       <= '1';
               mcuMode  <= FINISH;
            when others =>
               DC_DataCapt <= DC_DataOut;
               if (addr = 13x"10") then
                  addr <= 13x"00";
               elsif (TwoWords) then
                  addr <= addr + 4;
               else
                  addr <= addr + 2;
               end if;
               wrLsb    <= '0';
               wrMsb    <= '0';
               cs       <= '0';
               mcuMode  <= IDLE;
         end case;
      end if;
   end process mcuProcess;

   DigitalCombiner_u : DigitalCombiner
      PORT MAP (
         clk            => ClkOver2,
         clk2x          => Clk,
         clk4x          => Clk2x,
         reset          => Reset,
         ce             => '1',
         cs             => cs,
         wr0            => wrLsb,
         wr1            => wrLsb,
         wr2            => wrMsb,
         wr3            => wrMsb,
         busClk         => ClkOver2,
         addr           => std_logic_vector(addr),
         dataIn         => DC_DataIn,
         dataOut        => DC_DataOut,
         re1In          => I1Noisy,
         im1In          => Q1Noisy,
         re2In          => I2Noisy,
         im2In          => Q2Noisy,
         ch1agc         => Ch1Agc,
         ch2agc         => Ch2Agc,
         realout        => ICmb,
         imagout        => QCmb,
         ifOut          => ifOut,
         combinerEn     => open,
         reallock       => ILock,
         imaglock       => QLock,
         locked         => PhsDetLocked,
         agc1_gt_agc2   => agc1_gt_agc2,
         lag_out        => lag_out,
         nco_control_out=> nco_control_out,
         phase_detect   => phase_detect,
         maximagout     => MaxQout,
         maxrealout     => MaxIout,
         minimagout     => MinQout,
         minrealout     => MinIout,
         realxord       => IXord,
         imagxord       => QXord,
         gainoutmax     => GainOutMax,
         gainoutmin     => GainOutMin,
         ifBS_n         => open
   );
   PrnDelayIn <= PrnDataI when (not VioBits(17)) else PrnDataQ;

   OutProc: process (ClkOver2)
   begin
      if (rising_edge(ClkOver2)) then
         if (DataRate = (to_integer(unsigned(VioBits(15 downto 12))))) then
            IIandD <= resize(to_sfixed(ICmb, DataI), IIandD);
            QIandD <= resize(to_sfixed(QCmb, DataI), IIandD);
            RecoveredData <= not IIandD(2) when (not VioBits(16)) else not QIandD(2);
            PrnDelay <= PrnDelay(PrnDelay'left-1 downto 0) & PrnDelayIn;
         else
            IIandD <= resize(IIandD + to_sfixed(ICmb, DataI), IIandD);
            QIandD <= resize(QIandD + to_sfixed(QCmb, DataI), IIandD);
         end if;
         if (BitCount =  10e6 - 1) then
            BitCount <= 32x"0";
            BitErrors <= ErrorCount;
            ErrorCount <= 32x"0";
         elsif (DataRate = 0) then
            BitCount  <= BitCount + 1;
            if (PrnDelay(to_integer(unsigned(VioBits(11 downto 8))) + 8) /= RecoveredData) then
               ErrorCount <= ErrorCount + 1;
            end if;
         end if;
      end if;
   end process OutProc;

   dac0_d      <= ICmb(17 downto 4);
   dac1_d      <= QCmb(17 downto 4);
   lockLed0n   <= not ILock(12);
   lockLed1n   <= not QLock(12);
   ch1DataOut  <= RecoveredData;
   ch1ClkOut   <= '1' when (DataRate > 4) else '0';

   DdsProc: process (DdsPdClkBufG)
   begin
      if (rising_edge(DdsPdClkBufG)) then
         ICmbFF      <= ICmb;
         QCmbFF      <= QCmb;
         QCmbFFDly   <= QCmbFF;
      end if;
   end process DdsProc;

   DDS2x : process (DdsPdClk2xBufg)
   begin
      if (rising_edge(DdsPdClk2xBufg)) then
         if (DdsPdClkBufg) then
            DdsData <= QCmbFFDly;
         else
            DdsData <= ICmbff;
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

   ddc : dualQuadDdc    -- Down convert incoming IF to baseband, ignore other channel
      port map (
         clk      => clk,
         reset    => reset,
         ifIn1    => ifOut,
         ifIn2    => ifOut,
         syncOut  => open,
         iOut1    => open,
         qOut1    => open,
         iOut2    => open,
         qOut2    => open
      );

END rtl;

