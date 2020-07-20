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

Module Name: Resample_tb.vhd
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
library std;
use std.textio.all;
use work.fixed_pkg.all;
USE IEEE.math_real.all;
USE work.Semco_pkg.ALL;

ENTITY ReSample_tb IS
END ReSample_tb;

ARCHITECTURE rtl OF ReSample_tb IS

   COMPONENT Dec_156_175 is
      generic (
         IN_WIDTH    : natural   := 18;
         IN_BINPT    : integer   := -17;
         OUT_WIDTH   : natural   := 18;
         OUT_BINPT   : integer   := -17
      );
      port (
         clk,
         ce,
         reset,
         ValidIn  : in  std_logic :='1';
         ReIn,
         ImIn     : in  std_logic_vector(IN_WIDTH - 1 downto 0);
         ReOut,
         ImOut    : out std_logic_vector(OUT_WIDTH - 1 downto 0);
         ValidOut : out std_logic
      );
   end COMPONENT Dec_156_175;

   COMPONENT resampler is
      PORT (
         clk,
         reset,
         clkEn,
         resetPhase           : in   std_logic;
         resampleRate         : in   SLV32;      --   unsigned[31:0]  32 bit fraction ResampleRate/ClkRate
         resamplerFreqOffset  : in   SLV32;      --   signed  [31:0]
         offsetEn             : in   std_logic;
         ResampIn             : in   SLV18;      --   signed  [17:0]
         ResampOut            : out  SLV18;      --   signed  [17:0]
         clkEnOut             : out  std_logic;
         sampleOffset         : out  std_logic_vector(4 downto 0) -- [4:0]   test point
      );
   END COMPONENT resampler;

   COMPONENT SinCosLut
     PORT (
       aclk,
       aclken,
       aresetn,
       s_axis_phase_tvalid : IN STD_LOGIC;
       s_axis_phase_tdata  : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
       m_axis_data_tvalid  : OUT STD_LOGIC;
       m_axis_data_tdata   : OUT STD_LOGIC_VECTOR(47 DOWNTO 0)
     );
   END COMPONENT SinCosLut;

   -- CONSTANTS

   -- Signals
   SIGNAL   clk,
            ce,
            reset,
            SinValid,
            ReSampVld,
            BadValid,
            ValidKTS_I,
            ValidKTS_Q        : std_logic := '1';
   SIGNAL   SinReal,
            SinImag,
            ResampleReal,
            ResampleImag,
            ResampleKTS_I,
            ResampleKTS_Q     : std_logic_vector(17 downto 0);
   SIGNAL   PhaseAcc,
            PhaseInc          : sfixed(0 downto -31) := (others=>'0');
   SIGNAL   SinCosData        : std_logic_vector(47 downto 0);
   SIGNAL   ValidIn           : SLV4 := "0001";

BEGIN

   process begin
      wait for 500 ps;
      clk <= not clk;
   end process;

   reset_process : process begin
      wait for 4 ns;
      reset <= '0';
   end process reset_process;

   ClkProcess : process(clk)
   begin
      if (rising_edge(clk)) then
         PhaseInc <= to_sfixed(0.001, PhaseInc);
         ValidIn <=  ValidIn(2 downto 0) & ValidIn(3);
         if (ValidIn(3)) then
            PhaseAcc <= resize(PhaseAcc + PhaseInc, PhaseAcc);
         end if;
      end if;
   end process ClkProcess;

   SinCos_u : SinCosLut
     PORT MAP(
       aclk                   => clk,
       aclken                 => ce,
       aresetn                => not reset,
       s_axis_phase_tvalid    => ValidIn(3),
       s_axis_phase_tdata     => to_slv(PhaseAcc(0 downto -15)),
       m_axis_data_tvalid     => SinValid,
       m_axis_data_tdata      => SinCosData
     );

   SinReal <= SinCosData(17 downto 0);
   SinImag <= SinCosData(41 downto 24);

   Resample : Dec_156_175
      generic map (
         IN_WIDTH    => 18,
         IN_BINPT    => 17,
         OUT_WIDTH   => 18,
         OUT_BINPT   => 17
      )
      port map(
         clk         => clk,
         ce          => ce,
         reset       => reset,
         ValidIn     => SinValid,
         ReIn        => SinReal,
         ImIn        => SinImag,
         ReOut       => ReSampleReal,
         ImOut       => ReSampleImag,
         ValidOut    => ReSampVld
   );

   resample_KTSi : resampler
      PORT MAP (
         clk                 => clk,
         reset               => reset,
         clkEn               => SinValid and ce,
         resetPhase          => '0',  -- 41.6/46.666...
         resampleRate        => to_slv(to_ufixed(FREQ_SAMP / A2D_SAMPLE_RATE, 0, -31)),
         resamplerFreqOffset => (others=>'0'),
         offsetEn            => '1',
         ResampIn            => SinReal,
         ResampOut           => ResampleKTS_I,
         clkEnOut            => ValidKTS_I,
         sampleOffset        => open
   );

   resample_KTSq : resampler
      PORT MAP (
         clk                 => clk,
         reset               => reset,
         clkEn               => SinValid and ce,
         resetPhase          => '0',  -- 41.6/46.666
         resampleRate        => to_slv(to_ufixed(FREQ_SAMP / A2D_SAMPLE_RATE, 0, -31)),
         resamplerFreqOffset => (others=>'0'),
         offsetEn            => '1',
         ResampIn            => SinImag,
         ResampOut           => ResampleKTS_Q,
         clkEnOut            => ValidKTS_Q,
         sampleOffset        => open
   );

   BadValid <= ValidKTS_I xor ValidKTS_Q;

END rtl;
