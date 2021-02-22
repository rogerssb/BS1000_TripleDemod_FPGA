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
Library UNISIM;
use UNISIM.vcomponents.all;
--Library UNIMACRO;
--use UNIMACRO.vcomponents.all;
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
   END CmplPhsDetTb;


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
         clk        : IN STD_LOGIC;
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

   COMPONENT OffsetNCO
      PORT (
         aclk : IN STD_LOGIC;
         s_axis_config_tvalid : IN STD_LOGIC;
         s_axis_config_tdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
         m_axis_data_tvalid : OUT STD_LOGIC;
         m_axis_data_tdata : OUT STD_LOGIC_VECTOR(47 DOWNTO 0)
      );
   END COMPONENT;

   COMPONENT Lowpass66
      PORT (
         aclk : IN STD_LOGIC;
         s_axis_data_tvalid   : IN STD_LOGIC;
         s_axis_data_tdata    : IN STD_LOGIC_VECTOR(95 DOWNTO 0);
         s_axis_data_tready,
         m_axis_data_tvalid   : OUT STD_LOGIC;
         m_axis_data_tdata    : OUT STD_LOGIC_VECTOR(95 DOWNTO 0)
      );
   END COMPONENT;

   COMPONENT WhiteNoise
      PORT(
         clk,
         reset,
         ce             : IN  std_logic;
         Noise          : OUT sfixed(3 downto -16)
      );
   END COMPONENT WhiteNoise;

   -- Constants
   constant Plus1             : Float_1_18 := to_sfixed(0.707 / 4.0, 0, -17);
   constant Neg1              : Float_1_18 := to_sfixed(-0.707 / 4.0, 0, -17);
   constant Zero              : Float_1_18 := to_sfixed(0.0, 0, -17);
   constant NCO_DLY           : natural := 4;
   type     Modulation        is (BPSK, QPSK, OQPSK, SOQPSK);
   -- Signals
   signal   Mode              : Modulation;
   signal   agc1_gt_agc2      : STD_LOGIC;
   signal   abs_agc_diff      : STD_LOGIC_VECTOR(10 DOWNTO 0);
   signal   nco_control_out   : STD_LOGIC_VECTOR(21 DOWNTO 0);
   signal   phase_detect      : STD_LOGIC_VECTOR(17 DOWNTO 0);
   signal   lag_out           : STD_LOGIC_VECTOR(31 DOWNTO 0);
   signal   SweepLimit        : STD_LOGIC_VECTOR(13 DOWNTO 0);
   signal   SweepRate         : STD_LOGIC_VECTOR(17 DOWNTO 0);
   signal   Vio9,
            PrnEnDly          : STD_LOGIC_VECTOR(15 DOWNTO 0);
   signal   Locked,
            PrnData,
            PrnEn,
            NoiseEn,
            BitFlip,
            FirDataValid,
            Clk,
            Reset             : std_logic := '0';
   signal   Ch1Agc,
            Ch2Agc            : std_logic_vector(11 downto 0);
   signal   LagCoef,
            LeadCoef,
            NoiseGain1,
            NoiseGain2,
            Filtered1Real,
            Filtered1Imag,
            Filtered2Real,
            Filtered2Imag,
            RealCmbFF,
            ImagCmbFF,
            ImagCmbFFDly,
            RealCmb,
            ImagCmb           : SLV18;
   signal   RealLock,
            ImagLock          : std_logic_vector(12 downto 0);
   signal   Noise,
            Noise1Gained,
            Noise1GainedDly,
            Noise2Gained,
            Noise2GainedDly   : sfixed(3 downto -16);
   signal   DataReal,
            DataImag,
            NcodReal,
            NcodImag,
            OffTunedReal,
            OffTunedImag,
            Real1Rms,
            Imag1Rms,
            Real1Noisy,
            Imag1Noisy,
            Real2Noisy,
            Imag2Noisy     : FLOAT_1_18;
   signal   DataRate       : integer range 0 to 9;
   signal   FirDataIn,
            FirDataOut     : std_logic_vector(95 downto 0);
   signal   NcoData,
            OffTunedSines  : std_logic_vector(47 downto 0);
   signal   PhaseInc       : SLV32;
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
            SideCarClk        : std_logic;

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

constant in_simulation : boolean := false
--pragma synthesis_off
                                    or true
--pragma synthesis_on
;
constant in_synthesis : boolean := not in_simulation;

BEGIN

ClkGen : if (in_simulation) generate
   process begin
      wait for 5.35 ns;
      Clk <= not Clk;
   end process;
else generate
   Clk            <= MonClk;
end generate;

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


   Reset          <= ResetShft(17);

   DataRealSlv    <= to_slv(DataReal);
   DataImagSlv    <= to_slv(DataImag);
   NcodRealSlv    <= to_slv(NcodReal);
   NcodImagSlv    <= to_slv(NcodImag);
   Real1RmsSlv    <= to_slv(Real1Rms);
   Imag1RmsSlv    <= to_slv(Imag1Rms);

   Real1NoisySlv  <= to_slv(Real1Noisy);
   Imag1NoisySlv  <= to_slv(Imag1Noisy);
   Real2NoisySlv  <= to_slv(Real2Noisy);
   Imag2NoisySlv  <= to_slv(Imag2Noisy);
   Mode           <= modulation'val(to_integer(unsigned(Vio9(5 downto 4))));

   Delay_process: process (Clk)
   begin
      if (rising_edge(Clk)) then
         ResetShft  <= ResetShft(16 downto 0) & '0';
         IlaCounter <= IlaCounter + 1;
         DataRate   <= DataRate + 1 when (DataRate < 9) else 0;
         if (DataRate = 0) then
            PrnEn   <= '1';
            BitFlip <= not BitFlip;
            case (Mode) is
               when BPSK =>
                  DataReal <= Plus1 when (PrnData) else Neg1;
                  DataImag <= Zero;
               when QPSK =>
                  DataReal <= Plus1 when (PrnData) else Neg1;
                  DataImag <= DataReal;   -- Q data is I delayed one bit
               when OQPSK =>
                  DataReal <= Plus1 when (PrnData) else Neg1;
               when others =>
                  DataReal <= Zero;
                  DataImag <= Zero;
            end case;
         elsif ((DataRate = 5) and (Mode = OQPSK)) then
            DataImag <= DataReal;   -- Delay Q a half bit
            -- PrnEn should have gone low on DataRate = 1
         else
            PrnEn <= '0';
         end if;
         PrnEnDly <= PrnEnDly(14 downto 0) & to_unsigned(DataRate, 4)(2);
         -- generate noise at twice the data rate to get a nice wide noise bandwidth
         NoiseEn         <= '1' when ((DataRate = 0) or (DataRate = 5)) else '0';
         Real1Noisy      <= resize(Noise1Gained    + OffTunedReal, Real1Noisy);
         Imag1Noisy      <= resize(Noise1GainedDly + OffTunedImag, Real1Noisy);
         -- note the ch2 data adds the same noise source at a different gain and offset by NoisyDly above
         Real2Noisy      <= resize(Noise2Gained    + NcodReal, Real1Noisy);
         Imag2Noisy      <= resize(Noise2GainedDly + NcodImag, Real1Noisy);

         Noise1Gained    <= resize(Noise * to_sfixed(NoiseGain1, DataReal), Noise1Gained);
         Noise1GainedDly <= Noise1Gained;
         Noise2Gained    <= resize(Noise * to_sfixed(NoiseGain2, DataReal), Noise2Gained);
         Noise2GainedDly <= Noise2Gained;

         Real1Rms <= resize(Real1Rms - (Real1Rms sra 10) + (abs(Noise2Gained) sra 10), Real1Noisy);
         Imag1Rms <= resize(Imag1Rms - (Imag1Rms sra 10) + (abs(to_sfixed(Filtered1Real,Real2Noisy)) sra 10), Real1Noisy);


      end if;
   end process Delay_process;

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

   LFSR15 : BERT_LFSR
      PORT MAP(
         clock       => Clk,
         reset       => Reset,
         reload      => '0',
         enable      => PrnEn,
         poly        => 24x"6000",
         poly_length => 5x"0F",
         load_data   => 24x"9009",
         data        => open,
         serial      => PrnData
   );

   NoiseGen : WhiteNoise
      PORT MAP(
         clk         => Clk,
         reset       => Reset,
         ce          => NoiseEn,
         Noise       => Noise
      );

   -- the off tune NCO pulls channel 1 slightly off center frequency since there's no carrier loop yet
   OffTuneNCO : OffsetNCO
      PORT MAP (
         aclk                 => Clk,
         s_axis_config_tvalid => '1',
         s_axis_config_tdata  => 32x"000",
         m_axis_data_tvalid   => open,
         m_axis_data_tdata    => OffTunedSines
      );

   OffTuneMult : CmplxMult
      GENERIC MAP(
         IN_WIDTH  => 18,
         IN_BINPT  => 17,
         OUT_WIDTH => 18,
         OUT_BINPT => 17
      )
      PORT MAP(
         clk         => Clk,
         reset       => '0',
         ce          => '1',
         ValidIn     => '1',
         StartIn     => '0',
         ReadyIn     => '1',
         ReInA       => DataReal,
         ImInA       => DataImag,
         ReInB       => to_sfixed(OffTunedSines(17 downto 0), DataReal),
         ImInB       => to_sfixed(OffTunedSines(24+17 downto 24), DataReal),
         ReOut       => OffTunedReal,
         ImOut       => OffTunedImag,
         ValidOut    => open,
         StartOut    => open
   );

   NCO : OffsetNCO
      PORT MAP (
         aclk                 => Clk,
         s_axis_config_tvalid => '1',
         s_axis_config_tdata  => PhaseInc,
         m_axis_data_tvalid   => open,
         m_axis_data_tdata    => NcoData
      );

   ComplexMult : CmplxMult
      GENERIC MAP(
         IN_WIDTH  => 18,
         IN_BINPT  => 17,
         OUT_WIDTH => 18,
         OUT_BINPT => 17
      )
      PORT MAP(
         clk         => Clk,
         reset       => '0',
         ce          => '1',
         ValidIn     => '1',
         StartIn     => '0',
         ReadyIn     => '1',
         ReInA       => DataReal,
         ImInA       => DataImag,
         ReInB       => to_sfixed(NcoData(17 downto 0), DataReal),
         ImInB       => to_sfixed(NcoData(24+17 downto 24), DataReal),
         ReOut       => NcodReal,
         ImOut       => NcodImag,
         ValidOut    => open,
         StartOut    => open
   );

   FirDataIn <= 6x"0" & to_slv(Real2Noisy) & 6x"0" & to_slv(Imag2Noisy) & 6x"0" & to_slv(Real1Noisy) & 6x"0" & to_slv(Imag1Noisy);

   Lowpass : Lowpass66
      PORT MAP (
         aclk                 => Clk,
         s_axis_data_tvalid   => '1',
         s_axis_data_tdata    => FirDataIn,
         s_axis_data_tready   => open,
         m_axis_data_tvalid   => FirDataValid,
         m_axis_data_tdata    => FirDataOut
   );

   Filtered1Real <= FirDataOut(41 downto 24);
   Filtered1Imag <= FirDataOut(17 downto 00);
   Filtered2Real <= FirDataOut(89 downto 72);
   Filtered2Imag <= FirDataOut(65 downto 48);


   CmplxPhsDet : complexphasedetector_0
   PORT MAP (
      clk            => Clk,
      ch1agc         => Ch1Agc,
      ch2agc         => Ch2Agc,
      ch1real        => Filtered1Real,
      ch1imag        => Filtered1Imag,
      ch2real        => Filtered2Real,
      ch2imag        => Filtered2Imag,
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
   lockLed0n   <= RealLock(12);
   lockLed1n   <= ImagLock(12);
   ch3DataOut  <= RealCmb(17) when (Vio9(15)) else ImagCmb(17);
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
