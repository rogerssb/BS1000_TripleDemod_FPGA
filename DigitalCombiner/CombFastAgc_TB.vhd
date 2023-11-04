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

Module Name: DemodPreDist.vhd
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
use work.fixed_pkg.all;
USE work.Semco_pkg.ALL;
use std.env.all;

ENTITY CombFastAgc_TB IS
   END CombFastAgc_TB;

ARCHITECTURE rtl OF CombFastAgc_TB IS

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

   COMPONENT combinerfastagc
      PORT (
         clk, ce,
         reset,
         cs,
         busClk,
         wr0,wr1,wr2,wr3    : IN  std_logic;
         addr               : IN  std_logic_vector(5 downto 0);
         din                : IN  SLV32;
         dout               : OUT SLV32;
         agcIn0, agcIn1     : IN  std_logic_vector(11 downto 0);
         i_in0,q_in0        : IN  SLV18;
         i_in1,q_in1        : IN  SLV18;
         i_out0,q_out0      : OUT SLV18;
         i_out1,q_out1      : OUT SLV18;
         agcOut0, agcOut1   : OUT std_logic_vector(12 downto 0)
      );
   END COMPONENT combinerfastagc;

   COMPONENT complexphasedetector_0
      PORT (
         clk,
         reset,
         overridech,
         ch0gtch1          : IN STD_LOGIC;
         ch0agc, ch1agc    : IN  STD_LOGIC_VECTOR(12 DOWNTO 0);
         ch0imag,
         ch0real,
         ch1imag,
         ch1real,
         lag_coef,
         lead_coef,
         swprate           : IN  SLV18;
         lockhysterisis,
         lockthreshold     : IN STD_LOGIC_VECTOR(12 DOWNTO 0);
         db_ratio,
         db_range          : IN  STD_LOGIC_VECTOR(15 DOWNTO 0);
         sweeplmt          : IN  STD_LOGIC_VECTOR(14 DOWNTO 0);
         maximagout,
         maxrealout,
         minimagout,
         minrealout,
         imagout,
         realout,
         gainoutmax,
         gainoutmin,
         phase_detect      : OUT SLV18;
         agc0_gt_agc1,
         realxord,
         imagxord,
         locked            : OUT STD_LOGIC;
         imaglock,
         reallock          : OUT STD_LOGIC_VECTOR(12 DOWNTO 0);
         lag_out           : OUT SLV32;
         nco_control_out   : OUT STD_LOGIC_VECTOR(21 DOWNTO 0)
      );
   END COMPONENT complexphasedetector_0;

   constant Plus1             : Float_1_18 := to_sfixed( 0.707 / 4.0, 0, -17);
   constant Neg1              : Float_1_18 := to_sfixed(-0.707 / 4.0, 0, -17);
   constant Zero              : Float_1_18 := to_sfixed(0.0, 0, -17);
   constant One               : Float_1_18 := to_sfixed(1.0, 0, -17);
   constant KHz               : real := 1000.0;
   constant MHz               : real := 1000000.0;
   constant CALF_CONTROL      : unsigned(5 downto 0) := 6x"20";
   constant CALF_ULIMIT       : unsigned(5 downto 0) := 6x"24";
   constant CALF_LLIMIT       : unsigned(5 downto 0) := 6x"28";
   constant CALF_RATIOS       : unsigned(5 downto 0) := 6x"2C";
   constant CALF_INTEGRATOR   : unsigned(5 downto 0) := 6x"30";
   constant PULSE_DELAY       : natural := 511;

   constant SINE_FADE         : std_logic := '1';

   -- Signals
   type     Modulation        is (BPSK, QPSK, OQPSK, SOQPSK);
   type     mcuFsm            is (IDLE, SETUP, WRITE, FINISH);

   -- Signals
   signal   mcuMode           : mcuFsm := IDLE;
   signal   Mode              : Modulation := QPSK;

   signal   clk2x,
            clk,
            clkOver2,
            cs,
            wrLsb,
            wrMsb,
            Reset,
            PrnDataI,
            PrnDataQ,
            PrnEn,
            OneCycle,
            SineSign,
            TwoWords          : std_logic := '1';
   signal   addr              : unsigned(5 downto 0) := (others=>'0');
   signal   Noise0,
            Noise1,
            NoisePipe0,
            NoisePipe1        : SLV16;
   signal   ch0Gain, ch1Gain   : std_logic_vector(12 downto 0);
   signal   Real1Out,
            Imag1Out,
            Real2Out,
            Imag2Out,
            i_in0,
            q_in0,
            i_in1,
            q_in1             : SLV18;
   signal   DataI,
            DataQ,
            AM_Mod0,
            AM_Mod1,
            AM_Amp,
            FiltI,
            FiltQ,
            IAM_dPipe,
            QAM_dPipe,
            IAM_d,
            QAM_d,
            NoisyI,
            NoisyQ            : FLOAT_1_18 := to_sfixed(0.075, 0, -17);
   signal   NoiseGain0,
            NoiseGain1,
            NoiseGained0,
            NoiseGained1      : sfixed(1 downto -16) := (others=>'0');
   signal   LpfIn,
            LpfOut            : std_logic_vector(47 downto 0);
   signal   AM_Sines          : std_logic_vector(47 downto 0);
   signal   ResetShft         : SLV18 := (others=>'1');
   signal   DC_DataIn,
            DC_DataOut,
            DC_DataCapt       : SLV32;
   signal   DataRate          : integer range 0 to 127;
   signal   AM_FreqReal,
            RfAgc0,
            RfAgc1            : real;
   signal   Timer             : integer := 0;
   signal   Gains             : SLV16 := 16x"1B1B";    --gains above 1B start to oscillate
   signal   AM_Freq           : real := 35000.0;             -- on sine fades, higher gains seem okay
   signal   DelayI, DelayQ    : SLV18_ARRAY(PULSE_DELAY-1 downto 0) := (others=>(others=>'0'));
   signal   agcIn0            : SLV12 := 12x"150";
   signal   agcIn1            : SLV12 := 12x"150";
   signal   Agc0              : real := -80.0;
   signal   Agc1              : real := -80.0;
   signal   Agc0Out,
            Agc1Out           : real;

   alias locked is << signal .combfastagc_tb.CmplxPhsDet.U0.complexphasedetector_struct.logical2.locked : std_logic >>;


BEGIN

   process begin
      wait for 5.35 ns;
      clk2x <= not clk2x;
      if (clk2x) then
         clk <= not clk;
         if (clk) then
            clkOver2 <= not clkOver2;
         end if;
      end if;
   end process;

   mcuProcess : process (clkOver2)
   begin
      if (rising_edge(clkOver2)) then
         if (Reset) then
            case (mcuMode) is
               when IDLE =>
                  wrLsb    <= '0';
                  wrMsb    <= '0';
                  cs       <= '0';
                  mcuMode  <= SETUP;
               when SETUP =>
                  case (addr) is
                     when CALF_CONTROL =>
                        DC_DataIn <= Gains & 16x"e000";
                        TwoWords  <= '1';
                     when CALF_ULIMIT =>
                        DC_DataIn <= 32x"4FFFFFFF";
                        TwoWords  <= '1';
                     when CALF_LLIMIT =>
                        DC_DataIn <= 32x"00000000";
                        TwoWords  <= '1';
                     when others =>    -- CALF_RATIOS
                        DC_DataIn <= 32x"80047ff8";
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
                  if (addr = CALF_RATIOS) then
                     addr <= CALF_CONTROL;
                     Reset <= '0';
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
      end if;
   end process mcuProcess;


   LFSR11 : BERT_LFSR
      PORT MAP(
         clock       => clkOver2,
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
         clock       => clkOver2,
         reset       => Reset,
         reload      => '0',
         enable      => PrnEn,
         poly        => 24x"6000",
         poly_length => 5x"0F",
         load_data   => 24x"9009",
         data        => open,
         serial      => PrnDataQ
   );

   Delay_process: process (clkOver2)
   begin
      if (rising_edge(clkOver2)) then
         PrnEn <= '0';
         if (Timer = 2000) then
            OneCycle <= '1';
            if (Agc0Out > 0.0) then
              stop(0);
            end if;
            Timer <= 0;
         elsif (Timer = 600) then
            AM_Amp <= resize(AM_Amp + 0.025, AM_Amp);
  --             AM_Freq <= AM_Freq + 5.0*KHz;
  --             Agc0 <= Agc0 + 1.0;
  --             Agc1 <= Agc1 - 1.0;
               Timer <= Timer + 1;
         else
            SineSign <= AM_Sines(24+17);
            if (SineSign and not AM_Sines(24+17)) then
               OneCycle <= '0';
            end if;
            if (not OneCycle) then
               Timer <= Timer + 1;
            end if;
         end if;

         DelayI <= DelayI(PULSE_DELAY-2 downto 0) & to_slv(resize(FiltI/**0.75*/, FiltI));
         DelayQ <= DelayQ(PULSE_DELAY-2 downto 0) & to_slv(resize(FiltQ/**0.75*/, FiltI));

         DataRate <= DataRate + 1 when (DataRate < 90) else 0;
         if (DataRate = 0) then
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

      end if;
   end process Delay_process;

   NoiseGain0   <= to_sfixed(0.0, NoiseGain0);
   NoiseGain1   <= to_sfixed(0.0, NoiseGain1);
   AM_FreqReal <= (2.0**16)*(2.0**16)*(AM_Freq)/(46.6*MHz);

   NoiseGen1 : gng
      GENERIC MAP (
         INIT_Z1 => 64x"45D0_00FF_FFF0_05FF",     -- 05,030,521,883,283,424,767
         INIT_Z2 => 64x"FFFC_BFFF_D800_0680",     -- 18,445,829,279,364,155,008
         INIT_Z3 => 64x"FFDA_3500_00FE_95FF"      -- 18,436,106,298,727,503,359
      )
      PORT MAP (
          clk        => clk,
          rstn       => not Reset,
          ce         => '1',
          valid_out  => open,
          data_out   => Noise0
      );

  NoiseGen2 : gng
      GENERIC MAP (
         INIT_Z1 => 64x"C9B0_01FF_FFE0_09FF",   -- 14,533,118,196,545,751,551
         INIT_Z2 => 64x"FFF9_7FFF_B000_0D00",   -- 18,444,914,485,018,758,400
         INIT_Z3 => 64x"FFB5_6A00_00FF_2BFF"    -- 18,425,749,998,705,519,615
      )
      PORT MAP (
         clk        => clk,
         rstn       => not Reset,
         ce         => '1',
         valid_out  => open,
         data_out   => Noise1
      );

   -- generate the AM modulation frequencies
   AM_NCO : OffsetNCO
      PORT MAP (
         aclk                 => clkOver2,
         aresetn              => not reset,
         s_axis_config_tvalid => '1',
         s_axis_config_tdata  => to_slv(to_sfixed(AM_FreqReal, 31, 0)),
         m_axis_data_tready   => OneCycle or SINE_FADE,
         s_axis_config_tready => open,
         m_axis_data_tvalid   => open,
         m_axis_data_tdata    => AM_Sines
      );

   DataGen_process: process (clkOver2)
   begin
      if (rising_edge(clkOver2)) then
         if (Reset) then
            NoisePipe0     <= (others=>'0');
            NoisePipe1     <= (others=>'0');
            NoiseGained0   <= (others=>'0');
            NoiseGained1   <= (others=>'0');
            AM_Mod0        <= (others=>'0');
            AM_Mod1        <= (others=>'0');
            IAM_dPipe      <= (others=>'0');
            QAM_dPipe      <= (others=>'0');
            IAM_d          <= (others=>'0');
            QAM_d          <= (others=>'0');
            NoisyI         <= (others=>'0');
            NoisyQ         <= (others=>'0');
         else
            NoisePipe0     <= Noise0;
            NoisePipe1     <= Noise1;
            NoiseGained0   <= resize(to_sfixed(NoisePipe0, 4, -11) * NoiseGain0, NoiseGained0);
            NoiseGained1   <= resize(to_sfixed(NoisePipe1, 4, -11) * NoiseGain1, NoiseGained1);

            AM_Mod0        <= resize(0.25 - AM_Amp + (AM_Amp * to_sfixed(AM_Sines(17 downto 0), 0, -17)), AM_Mod0, FIXED_SATURATE, FIXED_TRUNCATE);
            AM_Mod1        <= resize(0.25 - AM_Amp - (AM_Amp * to_sfixed(AM_Sines(17 downto 0), 0, -17)), AM_Mod1, FIXED_SATURATE, FIXED_TRUNCATE);
            IAM_dPipe      <= resize(AM_Mod0/* * DataI*/, IAM_d, fixed_saturate, fixed_truncate);
            QAM_dPipe      <= resize(AM_Mod1/* * DataQ*/, IAM_d, fixed_saturate, fixed_truncate);
            IAM_d          <= IAM_dPipe;
            QAM_d          <= QAM_dPipe;
            NoisyI         <= resize(IAM_d + NoiseGained0, NoisyI);
            NoisyQ         <= resize(QAM_d + NoiseGained1, NoisyQ);
         end if;
      end if;
   end process DataGen_process;

   LpfIn <= 6x"0" & to_slv(NoisyI) & 6x"0" & to_slv(NoisyQ);

   LowpassNoise : Lowpass66
      PORT MAP (
         aclk                 => clk2x,      -- run at 4x clock rate to reduce DSPs
         aresetn              => not Reset,
         s_axis_data_tvalid   => '1',
         s_axis_data_tdata    => LpfIn,
         s_axis_data_tready   => open,
         m_axis_data_tvalid   => open,
         m_axis_data_tdata    => LpfOut
   );

   FiltI <= to_sfixed(LpfOut(41 downto 24), FiltI);
   FiltQ <= to_sfixed(LpfOut(17 downto 00), FiltQ);


Modulations : if (SINE_FADE) generate
         i_in0 <= to_slv(FiltI);
         q_in0 <= to_slv(FiltI);
         i_in1 <= to_slv(FiltQ);
         q_in1 <= to_slv(FiltQ);
elsif (not SINE_FADE) generate
         i_in0 <= to_slv(FiltI);
         q_in0 <= to_slv(FiltI);
         i_in1 <= DelayI(PULSE_DELAY-1);
         q_in1 <= DelayQ(PULSE_DELAY-1);
end generate;
   agcIn0 <= std_logic_vector(to_unsigned(integer(((Agc0/20.0 + 5.5) / 4.4) * 4096.0),12));
   agcIn1 <= std_logic_vector(to_unsigned(integer(((Agc1/20.0 + 5.5) / 4.4) * 4096.0),12));
   combinerFastAgc_u : combinerfastagc
      PORT MAP (
         clk         => clkOver2,
         ce          => '1',
         reset       => Reset,
         cs          => cs,
         busClk      => clkOver2,
         wr0         => wrLsb,
         wr1         => wrLsb,
         wr2         => wrMsb,
         wr3         => wrMsb,
         addr        => std_logic_vector(Addr),
         din         => DC_DataIn,
         dout        => DC_DataOut,
         agcIn0      => agcIn0,
         agcIn1      => agcIn1,

         i_in0       =>  i_in0,
         q_in0       =>  q_in0,
         i_in1       =>  i_in1,
         q_in1       =>  q_in1,

         i_out0      => Real1Out,
         q_out0      => Imag1Out,
         agcOut0     => ch0Gain,
         i_out1      => Real2Out,
         q_out1      => Imag2Out,
         agcOut1     => ch1Gain
      );

   Agc0Out <= (((real(to_integer(unsigned(ch0Gain)))/ 4096.0)*4.4)-5.5)*20.0;
   Agc1Out <= (((real(to_integer(unsigned(ch1Gain)))/ 4096.0)*4.4)-5.5)*20.0;


   CmplxPhsDet : complexphasedetector_0
      PORT MAP (
         clk            => clkOver2,
         reset          => reset,
         ch0gtch1       => '0',
         overridech     => '0',
         lockthreshold  => 13x"0",
         lockhysterisis => 13x"0",
         db_range       => 16x"3AAA",
         db_ratio       => 16x"1800",
         ch0agc         => ch0Gain,
         ch1agc         => ch1Gain,
         ch0real        => Real1Out,
         ch0imag        => Imag1Out,
         ch1real        => Real2Out,
         ch1imag        => Imag2Out,
         lag_coef       => 18x"0",
         lead_coef      => 18x"0",
         sweeplmt       => 15x"0",
         swprate        => 18x"0",
         realout        => open,
         imagout        => open,
         reallock       => open,
         imaglock       => open,
         locked         => open,
         agc0_gt_agc1   => open,
         lag_out        => open,
         nco_control_out=> open,
         phase_detect   => open,
         maximagout     => open,
         maxrealout     => open,
         minimagout     => open,
         minrealout     => open,
         realxord       => open,
         imagxord       => open,
         gainoutmax     => open,
         gainoutmin     => open
      );

   lock_process : process (clkOver2)
   begin
      if (rising_edge(clkOver2)) then
         locked <= force '1';
      end if;
   end process;


END rtl;

