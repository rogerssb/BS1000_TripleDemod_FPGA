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

Module Name: DemodSerDesTop.vhd
Description: The IF signal is delayed up to 127 clocks then down converted to baseband
and decimated by 2 to the ClkOver2 rate. This is then filtered to match the noise bandwidth,
frequency shifted, noise is added and the sum AM modulated. This composite is the
up converted to 70MHz and drives the SerDes output to the Combiner.

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
use work.fixed_pkg.all;
USE work.Semco_pkg.ALL;

ENTITY DemodSerDesTop IS
   GENERIC (
      PORTS       : natural := 5
   );
   PORT (
         adc0Clk,
         adc0_overflow,
         MonOvf,
         MonClk,

         spiFlashMISO,
         amAdcDataIn,
         spiCSn,
         spiClk,
         spiDataIn,
         pll0_OUT1,
         pll1_OUT1,
         FPGA_ID0,
         FPGA_ID1          : IN std_logic;
         spiDataOut        : INOUT std_logic;
         adc0,
         MonData           : IN std_logic_vector(13 downto 0);
         video0InSelect,
         video1InSelect,
         video1OutSelect,
         video0OutSelect   : OUT std_logic_vector(1 downto 0);
--         VidSel            : OUT std_logic_vector(2 downto 0);
         dac0_d,
         dac1_d            : OUT std_logic_vector(13 downto 0);

--         ADC_Sync,
--         ADC_SDIO,
--         ADC_SClk,
--         ADC_CS_n,
--         ADC_OE_n,
         adc01_powerDown,
         amAdcClk,
         amAdcCSn,
         lockLed0n,
         lockLed1n,
--         Sw50_Ohm,
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
         spiFlashCSn,
--         spiFlashCK,
         spiFlashMOSI,
         DQMOut,
         Sw50Ohm,
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
         PrevData_p,
         PrevData_n,
         NextData_p,
         NextData_n        : OUT std_logic_vector(PORTS-1 downto 0);
         NextClk_p,
         NextClk_n,
         PrevClk_p,
         PrevClk_n         : OUT std_logic;
         SideCar           : INOUT std_logic_vector(1 to 40)

      );
   END DemodSerDesTop;


ARCHITECTURE rtl OF DemodSerDesTop IS

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

   COMPONENT VariableDelayLine
      GENERIC (
         DATA_WIDTH  : natural := 16;
         ADDR_WIDTH  : natural := 12;  -- longest delay is 4096
         RAM_TYPE    : string  := "block"  -- or "distributed"
      );
      PORT(
         clk,
         reset,
         ce             : IN  std_logic;
         Delay          : IN  UINT16;
         Input          : IN  std_logic_vector(DATA_WIDTH-1 downto 0);
         Output         : OUT std_logic_vector(DATA_WIDTH-1 downto 0)
      );
   END COMPONENT VariableDelayLine;

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
         aresetn  : IN STD_LOGIC;
         s_axis_config_tvalid : IN STD_LOGIC;
         s_axis_config_tdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
         m_axis_data_tvalid : OUT STD_LOGIC;
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

   COMPONENT DC_DemodTop
      PORT(
         Clk,
         Reset,
         FPGA_ID0,
         FPGA_ID1,
         amDataEn,
         iDemodBit,
         qDemodBit         : IN  std_logic;
         amDataIn          : IN  SLV12;
         adc0              : IN  std_logic_vector(13 downto 0);
         -- interFpga data
         PrevData_p,
         PrevData_n,
         NextData_p,
         NextData_n        : OUT std_logic_vector(4 downto 0);
         NextClk_p,
         NextClk_n,
         PrevClk_p,
         PrevClk_n         : OUT std_logic
      );
   END COMPONENT;

   component DUC
      port (
         clk,
         ce       : in  std_logic;
         realIn,
         imagIn   : in  std_logic_vector(17 downto 0);
         ifOut    : out std_logic_vector(17 downto 0)
      );
   END component DUC;

   -- this is the testbench version of semcoDemodTop
   component semcoDemodTop
      port (
         spiClk,
         spiCSn,
         spiDataIn,
         adc0_overflow,
         adc0Clk,
         pll0_OUT1,
         pll1_OUT1,
         amAdcDataIn,
         spiFlashMISO,
         FPGA_ID0,
         FPGA_ID1          : in  std_logic;
         adc0              : in  std_logic_vector(13 downto 0);
         spiDataOut        : inout std_logic;
         clk,
         clk2x,
         clkOver2,
         clkLocked,
         adc01_powerDown,
         dac_rst,
         dac_sclk,
         dac_sdio,
         dac0_nCs,
         dac1_nCs,
         dac0_clk,
         dac1_clk,
         amAdcClk,
         amAdcCSn,
         amDacDataOut,
         amDacClk,
         amDacCSn,
         NextClk_p,
         NextClk_n,
         PrevClk_p,
         PrevClk_n,
         spiFlashCSn,
         spiFlashMOSI,
         lockLed0n,
         lockLed1n,
         ch0ClkOut,ch0DataOut,
         ch1ClkOut,ch1DataOut,
         ch2ClkOut,ch2DataOut,
         ch3ClkOut,ch3DataOut,
         pll0_REF,
         pll1_REF,
         Sw50Ohm,
         sdiOut,
         DQMOut               : out std_logic;
         video0InSelect,
         video0OutSelect,
         video1InSelect,
         video1OutSelect      : out std_logic_vector(1 downto 0);
         PrevData_p,
         PrevData_n,
         NextData_p,
         NextData_n           : out std_logic_vector(4 downto 0);
         dac0_d,
         dac1_d               : out std_logic_vector(13 downto 0);
         SideCar              : inout std_logic_vector(1 to 40);
         MDB_180_1,
         MDB_182_3,
         MDB_184_5,
         MDB_188_9            : out SLV32;
         MDB_186,
         MDB_187              : out SLV16
      );
   end component semcoDemodTop;

   COMPONENT vm_cordic_fast IS
      GENERIC (
         n  : positive := 14
      );
      PORT (
         clk,
         ena      : IN  std_logic;
         x,
         y        : IN  std_logic_vector(n-1 downto 0);
         m        : OUT std_logic_vector(n downto 2);
         p        : OUT std_logic_vector(n-2 downto 1);
         enOut    : OUT std_logic
      );
   END COMPONENT vm_cordic_fast;

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

   -- Constants
   constant Plus1             : Float_1_18 := to_sfixed( 0.707 / 4.0, 0, -17);
   constant Neg1              : Float_1_18 := to_sfixed(-0.707 / 4.0, 0, -17);
   constant Zero              : Float_1_18 := to_sfixed(0.0, 0, -17);
   type     Modulation        is (BPSK, QPSK, OQPSK, SOQPSK);


   -- Signals
   signal   Mode              : Modulation := BPSK;
   signal   NoiseEn,
            clkLocked,
            FPGA_ID0reg,
            FPGA_ID1reg,
            PrnDataI,
            PrnDataQ,
            PrnEn,
            Clk,
            Clk2x,
            ClkOver2,
            Reset             : std_logic := '0';
   signal   ChAgc             : SLV12;
   signal   DataI,
            DataQ,
            DlyData,
            NoisyIF,
            NoiseGain,
            adc0In,
            AM_Amp            : SLV18;
   signal   Noise1,
            Noise2,
            Noise             : SLV16;
   signal   NcodI,
            NcodQ,
            DataIsim,
            DataQsim,
            INoisyPipe,
            QNoisyPipe,
            INoisy,
            QNoisy            : FLOAT_1_18 := (others=>'0');
   signal   NoisyAdc,
            adcRms,
            NoiseRms,
            FilteredI,
            FilteredQ,
            AM_Mod,
            NoiseGained       : sfixed(1 downto -16) := (others=>'0');
   signal   DataRate          : integer range 0 to 127 := 0;
   signal   FirDataIn,
            FirDataOut        : std_logic_vector(47 downto 0);
   signal   NcoData,
            AM_Sines          : std_logic_vector(47 downto 0);
   signal   PhaseInc,
            AM_Freq,
            MDB_180_1,
            MDB_182_3,
            MDB_184_5,
            MDB_188_9      : SLV32;
   signal   ResetShft      : SLV18 := 18x"3FFFF";
   signal   Delay          : SLV8;
   signal   Delay16,
            MDB_186,
            MDB_187        : SLV16;
   signal   Delay16u       : UINT16;
   signal   adc0Reg,
            IF_Mux         : std_logic_vector(13 downto 0);

   attribute IOSTANDARD    : string;
   attribute IOSTANDARD of spiCSn, spiDataIn, spiDataOut, spiClk,
            pll0_OUT1, pll1_OUT1, video0InSelect, video1InSelect, video1OutSelect, video0OutSelect,-- VidSel,
            ch0ClkOut, ch0DataOut, ch1ClkOut, ch1DataOut, ch2ClkOut, ch2DataOut, ch3ClkOut, ch3DataOut,
            amAdcDataIn, amAdcClk, amAdcCSn, --spiFlashCSn, spiFlashCK, spiFlashMOSI, spiFlashMISO,
            pll0_REF, pll1_REF, --Sw50_Ohm,
            DQMOut, sdiOut, lockLed0n, lockLed1n, FPGA_ID0, FPGA_ID1,
            amDacCSn, amDacClk, amDacDataOut : signal is "LVCMOS33";

   attribute IOSTANDARD of adc0Clk, adc0,
            MonOvf, MonClk, MonData,
            --ADC_Sync, ADC_SDIO, ADC_SClk, ADC_CS_n, ADC_OE_n,
            SideCar,
            dac0_clk, dac1_clk, dac_rst, dac0_nCs, dac1_nCs,
            dac_sclk, dac_sdio, dac0_d, dac1_d : signal is "LVCMOS18";

   attribute MARK_DEBUG : string;
   attribute MARK_DEBUG of DataI, DataQ, Delay, NoiseRms, adcRms, DataRate,
      MDB_180_1, MDB_182_3, MDB_184_5, MDB_188_9, MDB_186, MDB_187 : signal is "TRUE";

constant in_simulation : boolean := false
--pragma synthesis_off
                                    or true
--pragma synthesis_on
;
constant in_synthesis : boolean := not in_simulation;

BEGIN

ClkGen : if (in_simulation) generate
   process begin
      wait for 2.50 ns;
      Clk2x <= not Clk2x;
      if (Clk2x) then
         Clk <= not Clk;
         if (Clk) then
            ClkOver2 <= not ClkOver2;
         end if;
      end if;
   end process;

   MDB_180_1(17 downto 0) <= 18x"0"; --3333";        -- NoiseGain
   MDB_182_3              <= 32x"000E_0B1E";    -- PhaseInc
   MDB_184_5              <= 32x"0000_0000";    -- AM_Freq
   MDB_186(11 downto 0)   <= 12x"000" ;         -- ChAgc
   MDB_187                <= 16x"0100";         -- Options & Delay
   MDB_188_9(17 downto 0) <= 18x"0_0000";       -- AM_Amp

   clkLocked      <= '1';
   FPGA_ID0reg <= '0';
   FPGA_ID1reg <= '0';

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
         DataRate   <= DataRate + 1 when (DataRate < 9) else 0;
         if (DataRate = 0) then
            PrnEn   <= '1';
            case (Mode) is
               when BPSK =>
                  DataIsim <= Plus1 when (PrnDataI) else Neg1;
                  DataQsim <= Zero;
               when QPSK =>
                  DataIsim <= Plus1 when (PrnDataI) else Neg1;
                  DataQsim <= Plus1 when (PrnDataQ) else Neg1;
               when OQPSK =>
                  DataIsim <= Plus1 when (PrnDataI) else Neg1;
               when others =>
                  DataIsim <= Zero;
                  DataQsim <= Zero;
            end case;
         elsif ((DataRate = 5) and (Mode = OQPSK)) then
            DataQsim <= Plus1 when (PrnDataQ) else Neg1;   -- Delay Q a half bit
            -- PrnEn should have gone low on DataRate = 1
         else
            PrnEn <= '0';
         end if;
      end if;
   end process;

   GenIF : DUC
      port map (
         clk      => clk,
         ce       => '1',
         realIn   => to_slv(DataIsim),
         imagIn   => to_slv(DataQsim),
         ifOut    => adc0In
      );

else generate

   FPGA_ID0reg <= FPGA_ID0;
   FPGA_ID1reg <= FPGA_ID1;


--*****************************************************************************
--                           Reclock ADC Inputs
--*****************************************************************************
   reclockProcess: process(clk)
   begin
      if (rising_edge(clk)) then
         adc0Reg <= adc0;
         adc0In  <= not adc0Reg(13) & adc0Reg(12 downto 0) & 4x"0";
         DataRate <= DataRate + 1;
      end if;
   end process;

end generate;

   NoiseGain   <= MDB_180_1(17 downto 0);    -- lag_coef
   PhaseInc    <= MDB_182_3;                 -- lead_coef
   AM_Freq     <= MDB_184_5;                 -- swprate
   ChAgc       <= MDB_186(11 downto 0);      -- sweeplmt
   Delay       <= MDB_187(7 downto 0);       -- Options
   AM_Amp      <= MDB_188_9(17 downto 0);    -- refLevel

   NoiseGen1 : gng
      GENERIC MAP (
         INIT_Z1 => 64x"45D0_00FF_FFF0_05FF",     -- 05,030,521,883,283,424,767
         INIT_Z2 => 64x"FFFC_BFFF_D800_0680",     -- 18,445,829,279,364,155,008
         INIT_Z3 => 64x"FFDA_3500_00FE_95FF"      -- 18,436,106,298,727,503,359
      )
      PORT MAP (
          clk        => Clk,
          rstn       => not Reset,
          ce         => NoiseEn,
          valid_out  => open,
          data_out   => Noise1
      );

  NoiseGen2 : gng
      GENERIC MAP (
         INIT_Z1 => 64x"C9B0_01FF_FFE0_09FF",   -- 14,533,118,196,545,751,551
         INIT_Z2 => 64x"FFF9_7FFF_B000_0D00",   -- 18,444,914,485,018,758,400
         INIT_Z3 => 64x"FFB5_6A00_00FF_2BFF"    -- 18,425,749,998,705,519,615
      )
      PORT MAP (
         clk        => Clk,
         rstn       => not Reset,
         ce         => NoiseEn,
         valid_out  => open,
         data_out   => Noise2
      );

   Noise <= Noise1 when (FPGA_ID0reg) else Noise2;
   NoisyAdc <= resize(to_sfixed(adc0In, 0, -17) + NoiseGained, NoisyAdc);
   Delay16  <= 8x"00" & Delay;
   Delay16u <= unsigned(Delay16);
   Delay_u : VariableDelayLine
      GENERIC MAP (
         DATA_WIDTH  => 18,
         ADDR_WIDTH  => 7
      )
      PORT MAP (
         clk         => Clk,
         ce          => '1',
         reset       => Reset,
         Input       => to_slv(NoisyAdc),
         Delay       => Delay16u,
         Output      => DlyData
      );

   ddc : dualQuadDdc    -- Down convert incoming IF to baseband, ignore other channel
      port map (
         clk      => clk,
         reset    => reset,
         ifIn1    => DlyData,
         ifIn2    => (others=>'0'),
         syncOut  => open,
         iOut1    => DataI,
         qOut1    => DataQ,
         iOut2    => open,
         qOut2    => open
      );


   -- generate the AM modulation frequencies
   AM_NCO : OffsetNCO
      PORT MAP (
         aclk                 => ClkOver2,
         aresetn              => '1',
         s_axis_config_tvalid => '1',
         s_axis_config_tdata  => AM_Freq,
         m_axis_data_tvalid   => open,
         m_axis_data_tdata    => AM_Sines
      );

   NCO : OffsetNCO
      PORT MAP (
         aclk                 => ClkOver2,
         aresetn              => '1',
         s_axis_config_tvalid => '1',
         s_axis_config_tdata  => PhaseInc,
         m_axis_data_tvalid   => open,
         m_axis_data_tdata    => NcoData
      );

   FirDataIn <= 6x"0" & DataI & 6x"0" & DataQ;

   Lowpass : Lowpass66
      PORT MAP (
         aclk                 => Clk2x,      -- run at 4x clock rate to reduce DSPs
         aresetn              => not Reset,
         s_axis_data_tvalid   => '1',
         s_axis_data_tdata    => FirDataIn,
         s_axis_data_tready   => open,
         m_axis_data_tvalid   => open,
         m_axis_data_tdata    => FirDataOut
   );

   -- allow filter to settle to avoid unknowns in loop filters
   FilteredI        <= to_sfixed(FirDataOut(41 downto 24), FilteredI);
   FilteredQ        <= to_sfixed(FirDataOut(17 downto 00), FilteredI);

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
         ReInA       => FilteredI,
         ImInA       => FilteredQ,
         ReInB       => to_sfixed(NcoData(17 downto 0), NcodI),
         ImInB       => to_sfixed(NcoData(24+17 downto 24), NcodI),
         ReOut       => NcodI,
         ImOut       => NcodQ,
         ValidOut    => open,
         StartOut    => open
   );

   Delay_process: process (ClkOver2)
   begin
      if (rising_edge(ClkOver2)) then
         if (clkLocked) then
            ResetShft      <= ResetShft(16 downto 0) & '0';
            Reset          <= ResetShft(ResetShft'left);

            NoiseEn        <= '1';
            NoiseGained    <= resize(to_sfixed(Noise, 4, -11) * to_sfixed(NoiseGain, INoisy), NoiseGained);

            AM_Mod      <= resize(1.0 + (to_sfixed(AM_Amp, 1, -16) * to_sfixed(AM_Sines(17 downto 0), 0, -17)), AM_Mod);
            INoisyPipe  <= resize(AM_Mod * NcodI, INoisy, fixed_wrap, fixed_truncate);
            QNoisyPipe  <= resize(AM_Mod * NcodQ, INoisy, fixed_wrap, fixed_truncate);
            INoisy      <= INoisyPipe;
            QNoisy      <= QNoisyPipe;
         end if;
      end if;
   end process Delay_process;

   Rms_process: process (Clk)       -- adc0In runs at Clk rate
   begin
      if (rising_edge(Clk)) then
         if (not Reset) then
            adcRms        <= resize(adcRms - (adcRms sra 11) + (abs(to_sfixed(adc0In, 0, -17)) sra 10), adcRms);
            NoiseRms      <= resize(NoiseRms - (NoiseRms sra 10) + (abs(NoiseGained) sra 10), NoiseRms);
         end if;
      end if;
   end process Rms_process;

   GenIF : DUC
      port map (
         clk      => clk,
         ce       => '1',
         realIn   => to_slv(INoisy),
         imagIn   => to_slv(QNoisy),
         ifOut    => NoisyIF
      );

   IF_Mux <= (NoisyIF(17 downto 4) xor 14x"2000") when (MDB_187(8)) else adc0Reg;

DataGen : if (in_simulation) generate

   combinerOut : DC_DemodTop
      port map (
         Clk            => clk,
         Reset          => reset,
         FPGA_ID0       => FPGA_ID0reg,
         FPGA_ID1       => FPGA_ID1reg,
         iDemodBit      => '0',
         qDemodBit      => '0',
         amDataEn       => '0',
         amDataIn       => ChAgc,
         adc0           => IF_Mux,
         PrevData_p     => PrevData_p,
         PrevData_n     => PrevData_n,
         NextData_p     => NextData_p,
         NextData_n     => NextData_n,
         NextClk_p      => NextClk_p,
         NextClk_n      => NextClk_n,
         PrevClk_p      => PrevClk_p,
         PrevClk_n      => PrevClk_n
   );

else generate

   demodTop : semcoDemodTop
      port map (
         adc0Clk           => adc0Clk,
         clk               => Clk,
         clk2x             => Clk2x,
         clkOver2          => ClkOver2,
         clkLocked         => clkLocked,
         spiClk            => spiClk,
         spiCSn            => spiCSn,
         spiDataIn         => spiDataIn,
         adc0_overflow     => adc0_overflow,
         pll0_OUT1         => pll0_OUT1,
         pll1_OUT1         => pll1_OUT1,
         amAdcDataIn       => amAdcDataIn,
         spiFlashMISO      => spiFlashMISO,
         FPGA_ID0          => FPGA_ID0,
         FPGA_ID1          => FPGA_ID1,
         adc0              => IF_Mux,
         spiDataOut        => spiDataOut,
         adc01_powerDown   => adc01_powerDown,
         dac_rst           => dac_rst,
         dac_sclk          => dac_sclk,
         dac_sdio          => dac_sdio,
         dac0_nCs          => dac0_nCs,
         dac1_nCs          => dac1_nCs,
         dac0_clk          => dac0_clk,
         dac1_clk          => dac1_clk,
         amAdcClk          => amAdcClk,
         amAdcCSn          => amAdcCSn,
         amDacDataOut      => amDacDataOut,
         amDacClk          => amDacClk,
         amDacCSn          => amDacCSn,
         NextClk_p         => NextClk_p,
         NextClk_n         => NextClk_n,
         PrevClk_p         => PrevClk_p,
         PrevClk_n         => PrevClk_n,
         spiFlashCSn       => spiFlashCSn,
         spiFlashMOSI      => spiFlashMOSI,
         lockLed0n         => lockLed0n,
         lockLed1n         => lockLed1n,
         Sw50Ohm           => Sw50Ohm,
         sdiOut            => sdiOut,
         DQMOut            => DQMOut,
         ch0ClkOut         => ch0ClkOut,
         ch0DataOut        => ch0DataOut,
         ch1ClkOut         => ch1ClkOut,
         ch1DataOut        => ch1DataOut,
         ch2ClkOut         => ch2ClkOut,
         ch2DataOut        => ch2DataOut,
         ch3ClkOut         => ch3ClkOut,
         ch3DataOut        => ch3DataOut,
         pll0_REF          => pll0_REF,
         pll1_REF          => pll1_REF,
         video0InSelect    => video0InSelect,
         video0OutSelect   => video0OutSelect,
         video1InSelect    => video1InSelect,
         video1OutSelect   => video1OutSelect,
         PrevData_p        => PrevData_p,
         PrevData_n        => PrevData_n,
         NextData_p        => NextData_p,
         NextData_n        => NextData_n,
         dac0_d            => dac0_d,
         dac1_d            => dac1_d,
         SideCar           => SideCar,
         MDB_180_1         => MDB_180_1,
         MDB_182_3         => MDB_182_3,
         MDB_184_5         => MDB_184_5,
         MDB_188_9         => MDB_188_9,
         MDB_186           => MDB_186,
         MDB_187           => MDB_187
      );

end generate;

END rtl;

