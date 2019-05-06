-------------------------------------------------------------------------------
--                   PROPRIETARY NOTICE
-------------------------------------------------------------------------------
-- (c) Copyright 2014 Semco All rights reserved.
--
-- This file contains Semco proprietary information. It is the
-- property of Semco and shall not be used, disclosed to others or
-- reproduced without the express written consent of Semco,
-- including, but without limitation, it is not to be used in the creation,
-- manufacture, development, or derivation of any designs, or configuration.
--
-------------------------------------------------------------------------------
--
-- Company:     Semco
--
-- Module Name: FE_FFT_tb.vhd
-- Description:
--
-- Dependencies: Top level module
--
-------------------------------------------------------------------------------
--                                DETAILS
-------------------------------------------------------------------------------
--
-------------------------------------------------------------------------------
--                                HISTORY
-------------------------------------------------------------------------------
-- 9/17/16 Initial release FZ
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_textio.all;
use ieee.numeric_std.all;
use ieee.math_real.all;
use work.Semco_pkg.all;
use work.fixed_pkg.all;

entity Cmplx_tb is
end Cmplx_tb;

architecture rtl of Cmplx_tb is

  -- Define Components

   COMPONENT CmplxMult IS
      PORT(
         clk            : IN  std_logic;
         reset          : IN  std_logic;
         ce             : IN  std_logic;
         ReInA,
         ImInA,
         ReInB,
         ImInB          : IN  FLOAT_1_18;
         ValidIn,
         StartIn        : IN  std_logic;
         ReOut,
         ImOut          : OUT FLOAT_1_18;
         ValidOut,
         StartOut       : OUT std_logic
      );
   END COMPONENT CmplxMult;

   COMPONENT CmplxAbs IS
      PORT(
         clk            : IN  std_logic;
         reset          : IN  std_logic;
         ce             : IN  std_logic;
         ReIn,
         ImIn           : IN  FLOAT_1_18;
         ValidIn,
         StartIn        : IN  std_logic;
         AbsOut         : OUT FLOAT_1_18;
         ValidOut,
         StartOut       : OUT std_logic
      );
   END COMPONENT CmplxAbs;

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

-------------------------------------------------------------------------------
--                       CONSTANT DEFINITIONS
-------------------------------------------------------------------------------


   signal   reset                : std_logic := '1';
   signal   clk                  : std_logic := '1';
   signal   ce                   : std_logic := '1';

   SIGNAL   Start,
            StartMult,
            StartAbs,
            ValidIn,
            ValidCos,
            ValidMult,
            ValidAbs          : std_logic := '0';
  SIGNAL    Ar,
            Ai,
            Br,
            Bi,
            Cr,
            Ci,
            MagOut,
            PhaseAcc          : float_1_18 := float_zero_1_18;
   SIGNAL   Count             : UINT16 := (others=>'0');
   SIGNAL   tdata1,
            tdata2            : std_logic_vector(47 downto 0) := (others => '0');

begin

   process begin
      wait for 500 ps;
      clk <= not clk;
   end process;

   reset_process : process begin
      wait for 2 ns;
      reset <= '0';
   end process reset_process;

   process(clk)
   begin
      if (rising_edge(clk)) then
         Count <= Count + 1;
         Start <= '1' when Count = 10 else '0';
         ValidIn <= (Count mod 10) ?= 0;
         if (ValidIn) then
            PhaseAcc <= resize(PhaseAcc + 0.001, PhaseAcc);
         end if;
      end if;
   end process;

   SinCos1 : SinCosLut
     PORT MAP(
       aclk                   => clk,
       aclken                 => ce,
       aresetn                => not reset,
       s_axis_phase_tvalid    => ValidIn,
       s_axis_phase_tdata     => to_slv(PhaseAcc(-1 downto -16)),
       m_axis_data_tvalid     => ValidCos,
       m_axis_data_tdata      => tdata1
     );

   SinCos2 : SinCosLut
     PORT MAP(
       aclk                   => clk,
       aclken                 => ce,
       aresetn                => not reset,
       s_axis_phase_tvalid    => ValidIn,
       s_axis_phase_tdata     => to_slv(PhaseAcc(0 downto -15)),
       m_axis_data_tvalid     => open,
       m_axis_data_tdata      => tdata2
     );

   Ar <= to_sfixed(tdata1(17 downto 0) , Ar);
   Ai <= to_sfixed(tdata1(41 downto 24), Ai);
   Br <= to_sfixed(tdata2(17 downto 0) , Br);
   Bi <= to_sfixed(tdata2(41 downto 24), Bi);

   Mult : CmplxMult
      PORT MAP(
         clk         => clk,
         reset       => reset,
         ce          => ce,
         ReInA       => Ar,
         ImInA       => Ai,
         ReInB       => Br,
         ImInB       => Bi,
         ValidIn     => ValidCos,
         StartIn     => Start,
         ReOut       => Cr,
         ImOut       => Ci,
         ValidOut    => ValidMult,
         StartOut    => StartMult
      );

   Absolute : CmplxAbs
      PORT MAP(
         clk         => clk,
         reset       => reset,
         ce          => ce,
         ReIn        => Cr,
         ImIn        => Ci,
         ValidIn     => ValidMult,
         StartIn     => StartMult,
         AbsOut      => MagOut,
         ValidOut    => ValidAbs,
         StartOut    => StartAbs
      );

end rtl;
