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

ENTITY DemodPreDist IS
   PORT (
         Clk,
         ClkOver2,
         Clk2x,
         Reset,
         NcoReset_n,
         FPGA_ID0,
         FPGA_ID1          : IN  std_logic;
         adc0In            : IN  SLV18;
         AM_Amp,
         NoiseGain         : IN  SLV18;
         PhaseInc,
         AM_Freq           : IN  SLV32;
         ChAgc             : IN  SLV12;
         Delay             : IN  SLV8;
         RealOut,
         ImagOut,
         ifOut             : OUT SLV18
    );
   END DemodPreDist;

ARCHITECTURE rtl OF DemodPreDist IS

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

   COMPONENT DualAgc IS
      PORT(
         Clk,
         Reset          : IN  std_logic;
         Attack,
         Decay          : IN  std_logic_vector(2 downto 0);
         RealIn,
         ImagIn,
         RefLevel       : IN  float_1_18;
         RealGained,
         ImagGained,
         AgcVoltage     : OUT float_1_18
      );
   END COMPONENT DualAgc;

   component DUC
         port (
            clk,
            ce       : in  std_logic;
            realIn,
            imagIn   : in  std_logic_vector(17 downto 0);
            ifOut    : out std_logic_vector(17 downto 0)
         );
   END component DUC;

   -- Signals
   signal   SimReset          : std_logic := '1';
   signal   DucEn             : SLV4 := "0001";
   signal   DataI,
            DataQ,
            DlyData           : SLV18;
   signal   Noise1,
            Noise2,
            Noise3,
            Noise4,
            NoiseI,
            NoiseQ,
            NoisePipeI,
            NoisePipeQ        : SLV16;
   signal   NcodI,
            NcodQ,
            IAM_dPipe,
            QAM_dPipe,
            IAM_d,
            QAM_d,
            FiltI,
            FiltQ,
            NoisyI,
            NoisyQ,
            RealOut_f,
            ImagOut_f         : FLOAT_1_18 := (others=>'0');
   signal   AM_Mod,
            NoiseGainedI,
            NoiseGainedQ      : sfixed(1 downto -16) := (others=>'0');
   signal   LpfIn,
            LpfOut       : std_logic_vector(47 downto 0);
   signal   NcoData,
            AM_Sines          : std_logic_vector(47 downto 0);
   signal   Delay16           : SLV16;
   signal   Delay16u          : UINT16;

BEGIN

   process begin
      wait for 2600 nS;
      SimReset <= '0';
   end process;

   NoiseGen1 : gng
      GENERIC MAP (
         INIT_Z1 => 64x"45D0_00FF_FFF0_05FF",     -- 05,030,521,883,283,424,767
         INIT_Z2 => 64x"FFFC_BFFF_D800_0680",     -- 18,445,829,279,364,155,008
         INIT_Z3 => 64x"FFDA_3500_00FE_95FF"      -- 18,436,106,298,727,503,359
      )
      PORT MAP (
          clk        => Clk,
          rstn       => not Reset,
          ce         => '1',
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
         ce         => '1',
         valid_out  => open,
         data_out   => Noise2
      );

  NoiseGen3: gng
      GENERIC MAP (
         INIT_Z1 => 64x"0F80_02FF_FFD0_0FFF",   --  1,116,896,006,119,624,703
         INIT_Z2 => 64x"FBFB_3FFF_8818_0981",   -- 18,157,176,689,406,773,633
         INIT_Z3 => 64x"FF6C_180D_913E_C1FF"    -- 18,415,112,223,706,825,215
      )
      PORT MAP (
         clk        => Clk,
         rstn       => not Reset,
         ce         => '1',
         valid_out  => open,
         data_out   => Noise3
      );

  NoiseGen4: gng
      GENERIC MAP (
         INIT_Z1 => 64x"936003FFFFC013FF",     -- 10,619,492,319,381,951,487
         INIT_Z2 => 64x"FBF2FFFF60181A01",     -- 18,154,854,520,177,826,305
         INIT_Z3 => 64x"FF6AD40001FE57FE"      -- 18,404,755,923,701,487,614
      )
      PORT MAP (
         clk        => Clk,
         rstn       => not Reset,
         ce         => '1',
         valid_out  => open,
         data_out   => Noise4
      );


   -- allow filter to settle to avoid unknowns in loop filters
   NoiseI <= Noise1 when (FPGA_ID0) else Noise3;
   NoiseQ <= Noise2 when (FPGA_ID0) else Noise4;

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
         Input       => adc0In,
         Delay       => Delay16u,
         Output      => DlyData
      );

   ddc : dualQuadDdc    -- Down convert incoming IF to baseband, output is decimated
      port map (
         clk      => clk,
         reset    => reset,
         ifIn1    => DlyData,
         ifIn2    => 18x"0",
         syncOut  => open,
         iOut1    => DataI,
         qOut1    => DataQ,
         iOut2    => open,
         qOut2    => open
      );
   ------------------------ DDC outputs are at ClkOver2 rate ------------------------

   -- generate the AM modulation frequencies
   AM_NCO : OffsetNCO
      PORT MAP (
         aclk                 => ClkOver2,
         aresetn              => NcoReset_n,
         s_axis_config_tvalid => '1',
         s_axis_config_tdata  => AM_Freq,
         m_axis_data_tready   => '1',
         s_axis_config_tready => open,
         m_axis_data_tvalid   => open,
         m_axis_data_tdata    => AM_Sines
      );

   NCO : OffsetNCO
      PORT MAP (
         aclk                 => ClkOver2,
         aresetn              => NcoReset_n,
         s_axis_config_tvalid => '1',
         s_axis_config_tdata  => PhaseInc,
         m_axis_data_tready   => '1',
         s_axis_config_tready => open,
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
         clk         => ClkOver2,
         reset       => Reset,
         ce          => '1',
         ValidIn     => '1',
         StartIn     => '0',
         ReadyIn     => '1',
         ReInA       => to_sfixed(DataI, NcodI),
         ImInA       => to_sfixed(DataQ, NcodI),
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
         if (Reset) then
            NoisePipeI     <= (others=>'0');
            NoisePipeQ     <= (others=>'0');
            NoiseGainedI   <= (others=>'0');
            NoiseGainedQ   <= (others=>'0');
            AM_Mod         <= (others=>'0');
            IAM_dPipe      <= (others=>'0');
            QAM_dPipe      <= (others=>'0');
            IAM_d          <= (others=>'0');
            QAM_d          <= (others=>'0');
            NoisyI         <= (others=>'0');
            NoisyQ         <= (others=>'0');
         else
            NoisePipeI     <= NoiseI;
            NoisePipeQ     <= NoiseQ;
            NoiseGainedI   <= resize(to_sfixed(NoisePipeI, 4, -11) * to_sfixed(NoiseGain, NoiseGainedI), NoiseGainedI);
            NoiseGainedQ   <= resize(to_sfixed(NoisePipeQ, 4, -11) * to_sfixed(NoiseGain, NoiseGainedQ), NoiseGainedQ);

            AM_Mod         <= resize(1.0 + (to_sfixed(AM_Amp, 1, -16) * to_sfixed(AM_Sines(24+17 downto 24), 0, -17)), AM_Mod);
            IAM_dPipe      <= resize(AM_Mod * NcodI, IAM_d, fixed_wrap, fixed_truncate);
            QAM_dPipe      <= resize(AM_Mod * NcodQ, IAM_d, fixed_wrap, fixed_truncate);
            IAM_d          <= IAM_dPipe;
            QAM_d          <= QAM_dPipe;
            NoisyI         <= resize(IAM_d + NoiseGainedI, NoisyI);
            NoisyQ         <= resize(QAM_d + NoiseGainedQ, NoisyQ);
         end if;
      end if;
   end process Delay_process;

   LpfIn <= 6x"0" & to_slv(NoisyI) & 6x"0" & to_slv(NoisyQ);

   LowpassNoise : Lowpass66
      PORT MAP (
         aclk                 => Clk2x,      -- run at 4x clock rate to reduce DSPs
         aresetn              => NcoReset_n,
         s_axis_data_tvalid   => '1',
         s_axis_data_tdata    => LpfIn,
         s_axis_data_tready   => open,
         m_axis_data_tvalid   => open,
         m_axis_data_tdata    => LpfOut
   );

   FiltI <= to_sfixed(LpfOut(41 downto 24), FiltI);
   FiltQ <= to_sfixed(LpfOut(17 downto 00), FiltQ);

   AGCs : DualAgc
      PORT MAP (
         Clk         => ClkOver2,
         Reset       => Reset or SimReset,
         Attack      => 3x"7",
         Decay       => 3x"6",
         RealIn      => FiltI,
         ImagIn      => FiltQ,
         RefLevel    => 18x"01000",
         RealGained  => RealOut_f,
         ImagGained  => ImagOut_f,
         AgcVoltage  => open
   );

   Realign : process (ClkOver2) begin
      if (rising_edge(ClkOver2)) then
         RealOut <= to_slv(RealOut_f);
         ImagOut <= to_slv(ImagOut_f);
      end if;
   end process;

   PickPhase : process (Clk) begin
      if (rising_edge(Clk)) then
          DucEn <= DucEn(2 downto 0) & '1';
      end if;
   end process;

   GenIF : DUC
      port map (
         clk      => clk,
         ce       => DucEn(3),
         realIn   => RealOut,
         imagIn   => ImagOut,
         ifOut    => ifOut
      );

END rtl;

