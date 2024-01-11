-- Generated from Simulink block ComplexPhaseDetector/Bipolar NCO/CORDIC SINCOS/CORDIC Fine Angle PE/CORDIC PE1
library IEEE;
use IEEE.std_logic_1164.all;
library work;
use work.conv_pkg.all;
entity complexphasedetector_cordic_pe1 is
  port (
    x : in std_logic_vector( 21-1 downto 0 );
    y : in std_logic_vector( 21-1 downto 0 );
    z : in std_logic_vector( 21-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    x_x0 : out std_logic_vector( 21-1 downto 0 );
    y_x0 : out std_logic_vector( 21-1 downto 0 );
    z_x0 : out std_logic_vector( 21-1 downto 0 )
  );
end complexphasedetector_cordic_pe1;
architecture structural of complexphasedetector_cordic_pe1 is 
  signal constant1_op_net : std_logic_vector( 21-1 downto 0 );
  signal constant_op_net : std_logic_vector( 21-1 downto 0 );
  signal addsub1_s_net : std_logic_vector( 21-1 downto 0 );
  signal inverter_op_net : std_logic_vector( 1-1 downto 0 );
  signal mux_y_net : std_logic_vector( 21-1 downto 0 );
  signal addsub_s_net : std_logic_vector( 21-1 downto 0 );
  signal clk_net : std_logic;
  signal shift1_op_net : std_logic_vector( 21-1 downto 0 );
  signal shift_op_net : std_logic_vector( 21-1 downto 0 );
  signal slice_y_net : std_logic_vector( 1-1 downto 0 );
  signal addsub2_s_net : std_logic_vector( 21-1 downto 0 );
  signal constant_op_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal ce_net : std_logic;
begin
  x_x0 <= addsub_s_net;
  y_x0 <= addsub1_s_net;
  z_x0 <= addsub2_s_net;
  constant_op_net <= x;
  constant1_op_net <= y;
  mux_y_net <= z;
  clk_net <= clk_1;
  ce_net <= ce_1;
  addsub : entity work.sysgen_addsub_0378e36815 
  port map (
    clr => '0',
    a => constant_op_net,
    b => shift1_op_net,
    mode => inverter_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub_s_net
  );
  addsub1 : entity work.sysgen_addsub_0378e36815 
  port map (
    clr => '0',
    a => constant1_op_net,
    b => shift_op_net,
    mode => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub1_s_net
  );
  addsub2 : entity work.sysgen_addsub_0378e36815 
  port map (
    clr => '0',
    a => mux_y_net,
    b => constant_op_net_x0,
    mode => inverter_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub2_s_net
  );
  constant_x0 : entity work.sysgen_constant_9cd8b13253 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net_x0
  );
  inverter : entity work.sysgen_inverter_3e6e50377b 
  port map (
    clr => '0',
    ip => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    op => inverter_op_net
  );
  shift : entity work.sysgen_shift_39f6b48670 
  port map (
    clk => '1',
    ce => '1',
    clr => '0',
    ip => constant_op_net,
    op => shift_op_net
  );
  shift1 : entity work.sysgen_shift_39f6b48670 
  port map (
    clk => '1',
    ce => '1',
    clr => '0',
    ip => constant1_op_net,
    op => shift1_op_net
  );
  slice : entity work.complexphasedetector_xlslice 
  generic map (
    new_lsb => 20,
    new_msb => 20,
    x_width => 21,
    y_width => 1
  )
  port map (
    x => mux_y_net,
    y => slice_y_net
  );
end structural;
-- Generated from Simulink block ComplexPhaseDetector/Bipolar NCO/CORDIC SINCOS/CORDIC Fine Angle PE/CORDIC PE10
library IEEE;
use IEEE.std_logic_1164.all;
library work;
use work.conv_pkg.all;
entity complexphasedetector_cordic_pe10 is
  port (
    x : in std_logic_vector( 21-1 downto 0 );
    y : in std_logic_vector( 21-1 downto 0 );
    z : in std_logic_vector( 21-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    x_x0 : out std_logic_vector( 21-1 downto 0 );
    y_x0 : out std_logic_vector( 21-1 downto 0 );
    z_x0 : out std_logic_vector( 21-1 downto 0 )
  );
end complexphasedetector_cordic_pe10;
architecture structural of complexphasedetector_cordic_pe10 is 
  signal inverter_op_net : std_logic_vector( 1-1 downto 0 );
  signal shift_op_net : std_logic_vector( 21-1 downto 0 );
  signal constant_op_net : std_logic_vector( 21-1 downto 0 );
  signal shift1_op_net : std_logic_vector( 21-1 downto 0 );
  signal slice_y_net : std_logic_vector( 1-1 downto 0 );
  signal addsub2_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal addsub_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal ce_net : std_logic;
  signal addsub_s_net : std_logic_vector( 21-1 downto 0 );
  signal addsub2_s_net : std_logic_vector( 21-1 downto 0 );
  signal clk_net : std_logic;
  signal addsub1_s_net : std_logic_vector( 21-1 downto 0 );
  signal addsub1_s_net_x0 : std_logic_vector( 21-1 downto 0 );
begin
  x_x0 <= addsub_s_net_x0;
  y_x0 <= addsub1_s_net_x0;
  z_x0 <= addsub2_s_net_x0;
  addsub_s_net <= x;
  addsub1_s_net <= y;
  addsub2_s_net <= z;
  clk_net <= clk_1;
  ce_net <= ce_1;
  addsub : entity work.sysgen_addsub_0378e36815 
  port map (
    clr => '0',
    a => addsub_s_net,
    b => shift1_op_net,
    mode => inverter_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub_s_net_x0
  );
  addsub1 : entity work.sysgen_addsub_0378e36815 
  port map (
    clr => '0',
    a => addsub1_s_net,
    b => shift_op_net,
    mode => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub1_s_net_x0
  );
  addsub2 : entity work.sysgen_addsub_0378e36815 
  port map (
    clr => '0',
    a => addsub2_s_net,
    b => constant_op_net,
    mode => inverter_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub2_s_net_x0
  );
  constant_x0 : entity work.sysgen_constant_e1de5103af 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  inverter : entity work.sysgen_inverter_3e6e50377b 
  port map (
    clr => '0',
    ip => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    op => inverter_op_net
  );
  shift : entity work.sysgen_shift_d32d61f1c4 
  port map (
    clr => '0',
    ip => addsub_s_net,
    clk => clk_net,
    ce => ce_net,
    op => shift_op_net
  );
  shift1 : entity work.sysgen_shift_d32d61f1c4 
  port map (
    clr => '0',
    ip => addsub1_s_net,
    clk => clk_net,
    ce => ce_net,
    op => shift1_op_net
  );
  slice : entity work.complexphasedetector_xlslice 
  generic map (
    new_lsb => 20,
    new_msb => 20,
    x_width => 21,
    y_width => 1
  )
  port map (
    x => addsub2_s_net,
    y => slice_y_net
  );
end structural;
-- Generated from Simulink block ComplexPhaseDetector/Bipolar NCO/CORDIC SINCOS/CORDIC Fine Angle PE/CORDIC PE11
library IEEE;
use IEEE.std_logic_1164.all;
library work;
use work.conv_pkg.all;
entity complexphasedetector_cordic_pe11 is
  port (
    x : in std_logic_vector( 21-1 downto 0 );
    y : in std_logic_vector( 21-1 downto 0 );
    z : in std_logic_vector( 21-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    x_x0 : out std_logic_vector( 21-1 downto 0 );
    y_x0 : out std_logic_vector( 21-1 downto 0 );
    z_x0 : out std_logic_vector( 21-1 downto 0 )
  );
end complexphasedetector_cordic_pe11;
architecture structural of complexphasedetector_cordic_pe11 is 
  signal addsub2_s_net : std_logic_vector( 21-1 downto 0 );
  signal addsub2_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal addsub1_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal addsub1_s_net : std_logic_vector( 21-1 downto 0 );
  signal addsub_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal addsub_s_net : std_logic_vector( 21-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal constant_op_net : std_logic_vector( 21-1 downto 0 );
  signal inverter_op_net : std_logic_vector( 1-1 downto 0 );
  signal shift_op_net : std_logic_vector( 21-1 downto 0 );
  signal shift1_op_net : std_logic_vector( 21-1 downto 0 );
  signal slice_y_net : std_logic_vector( 1-1 downto 0 );
begin
  x_x0 <= addsub_s_net;
  y_x0 <= addsub1_s_net;
  z_x0 <= addsub2_s_net;
  addsub_s_net_x0 <= x;
  addsub1_s_net_x0 <= y;
  addsub2_s_net_x0 <= z;
  clk_net <= clk_1;
  ce_net <= ce_1;
  addsub : entity work.sysgen_addsub_0378e36815 
  port map (
    clr => '0',
    a => addsub_s_net_x0,
    b => shift1_op_net,
    mode => inverter_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub_s_net
  );
  addsub1 : entity work.sysgen_addsub_0378e36815 
  port map (
    clr => '0',
    a => addsub1_s_net_x0,
    b => shift_op_net,
    mode => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub1_s_net
  );
  addsub2 : entity work.sysgen_addsub_0378e36815 
  port map (
    clr => '0',
    a => addsub2_s_net_x0,
    b => constant_op_net,
    mode => inverter_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub2_s_net
  );
  constant_x0 : entity work.sysgen_constant_9382ca11e9 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  inverter : entity work.sysgen_inverter_3e6e50377b 
  port map (
    clr => '0',
    ip => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    op => inverter_op_net
  );
  shift : entity work.sysgen_shift_a4c0ba6bf7 
  port map (
    clr => '0',
    ip => addsub_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift_op_net
  );
  shift1 : entity work.sysgen_shift_a4c0ba6bf7 
  port map (
    clr => '0',
    ip => addsub1_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift1_op_net
  );
  slice : entity work.complexphasedetector_xlslice 
  generic map (
    new_lsb => 20,
    new_msb => 20,
    x_width => 21,
    y_width => 1
  )
  port map (
    x => addsub2_s_net_x0,
    y => slice_y_net
  );
end structural;
-- Generated from Simulink block ComplexPhaseDetector/Bipolar NCO/CORDIC SINCOS/CORDIC Fine Angle PE/CORDIC PE12
library IEEE;
use IEEE.std_logic_1164.all;
library work;
use work.conv_pkg.all;
entity complexphasedetector_cordic_pe12 is
  port (
    x : in std_logic_vector( 21-1 downto 0 );
    y : in std_logic_vector( 21-1 downto 0 );
    z : in std_logic_vector( 21-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    x_x0 : out std_logic_vector( 21-1 downto 0 );
    y_x0 : out std_logic_vector( 21-1 downto 0 );
    z_x0 : out std_logic_vector( 21-1 downto 0 )
  );
end complexphasedetector_cordic_pe12;
architecture structural of complexphasedetector_cordic_pe12 is 
  signal addsub_s_net : std_logic_vector( 21-1 downto 0 );
  signal addsub2_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal ce_net : std_logic;
  signal addsub1_s_net : std_logic_vector( 21-1 downto 0 );
  signal addsub_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal clk_net : std_logic;
  signal addsub2_s_net : std_logic_vector( 21-1 downto 0 );
  signal addsub1_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal shift_op_net : std_logic_vector( 21-1 downto 0 );
  signal shift1_op_net : std_logic_vector( 21-1 downto 0 );
  signal inverter_op_net : std_logic_vector( 1-1 downto 0 );
  signal constant_op_net : std_logic_vector( 21-1 downto 0 );
  signal slice_y_net : std_logic_vector( 1-1 downto 0 );
begin
  x_x0 <= addsub_s_net;
  y_x0 <= addsub1_s_net;
  z_x0 <= addsub2_s_net;
  addsub_s_net_x0 <= x;
  addsub1_s_net_x0 <= y;
  addsub2_s_net_x0 <= z;
  clk_net <= clk_1;
  ce_net <= ce_1;
  addsub : entity work.sysgen_addsub_0378e36815 
  port map (
    clr => '0',
    a => addsub_s_net_x0,
    b => shift1_op_net,
    mode => inverter_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub_s_net
  );
  addsub1 : entity work.sysgen_addsub_0378e36815 
  port map (
    clr => '0',
    a => addsub1_s_net_x0,
    b => shift_op_net,
    mode => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub1_s_net
  );
  addsub2 : entity work.sysgen_addsub_0378e36815 
  port map (
    clr => '0',
    a => addsub2_s_net_x0,
    b => constant_op_net,
    mode => inverter_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub2_s_net
  );
  constant_x0 : entity work.sysgen_constant_406d8b9ad6 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  inverter : entity work.sysgen_inverter_3e6e50377b 
  port map (
    clr => '0',
    ip => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    op => inverter_op_net
  );
  shift : entity work.sysgen_shift_0c59b452dc 
  port map (
    clr => '0',
    ip => addsub_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift_op_net
  );
  shift1 : entity work.sysgen_shift_0c59b452dc 
  port map (
    clr => '0',
    ip => addsub1_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift1_op_net
  );
  slice : entity work.complexphasedetector_xlslice 
  generic map (
    new_lsb => 20,
    new_msb => 20,
    x_width => 21,
    y_width => 1
  )
  port map (
    x => addsub2_s_net_x0,
    y => slice_y_net
  );
end structural;
-- Generated from Simulink block ComplexPhaseDetector/Bipolar NCO/CORDIC SINCOS/CORDIC Fine Angle PE/CORDIC PE13
library IEEE;
use IEEE.std_logic_1164.all;
library work;
use work.conv_pkg.all;
entity complexphasedetector_cordic_pe13 is
  port (
    x : in std_logic_vector( 21-1 downto 0 );
    y : in std_logic_vector( 21-1 downto 0 );
    z : in std_logic_vector( 21-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    x_x0 : out std_logic_vector( 21-1 downto 0 );
    y_x0 : out std_logic_vector( 21-1 downto 0 );
    z_x0 : out std_logic_vector( 21-1 downto 0 )
  );
end complexphasedetector_cordic_pe13;
architecture structural of complexphasedetector_cordic_pe13 is 
  signal addsub2_s_net : std_logic_vector( 21-1 downto 0 );
  signal addsub_s_net : std_logic_vector( 21-1 downto 0 );
  signal addsub1_s_net : std_logic_vector( 21-1 downto 0 );
  signal addsub1_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal addsub2_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal addsub_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal shift_op_net : std_logic_vector( 21-1 downto 0 );
  signal slice_y_net : std_logic_vector( 1-1 downto 0 );
  signal inverter_op_net : std_logic_vector( 1-1 downto 0 );
  signal constant_op_net : std_logic_vector( 21-1 downto 0 );
  signal shift1_op_net : std_logic_vector( 21-1 downto 0 );
begin
  x_x0 <= addsub_s_net;
  y_x0 <= addsub1_s_net;
  z_x0 <= addsub2_s_net;
  addsub_s_net_x0 <= x;
  addsub1_s_net_x0 <= y;
  addsub2_s_net_x0 <= z;
  clk_net <= clk_1;
  ce_net <= ce_1;
  addsub : entity work.sysgen_addsub_0378e36815 
  port map (
    clr => '0',
    a => addsub_s_net_x0,
    b => shift1_op_net,
    mode => inverter_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub_s_net
  );
  addsub1 : entity work.sysgen_addsub_0378e36815 
  port map (
    clr => '0',
    a => addsub1_s_net_x0,
    b => shift_op_net,
    mode => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub1_s_net
  );
  addsub2 : entity work.sysgen_addsub_0378e36815 
  port map (
    clr => '0',
    a => addsub2_s_net_x0,
    b => constant_op_net,
    mode => inverter_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub2_s_net
  );
  constant_x0 : entity work.sysgen_constant_5dac58feae 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  inverter : entity work.sysgen_inverter_3e6e50377b 
  port map (
    clr => '0',
    ip => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    op => inverter_op_net
  );
  shift : entity work.sysgen_shift_f8381d2d97 
  port map (
    clr => '0',
    ip => addsub_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift_op_net
  );
  shift1 : entity work.sysgen_shift_f8381d2d97 
  port map (
    clr => '0',
    ip => addsub1_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift1_op_net
  );
  slice : entity work.complexphasedetector_xlslice 
  generic map (
    new_lsb => 20,
    new_msb => 20,
    x_width => 21,
    y_width => 1
  )
  port map (
    x => addsub2_s_net_x0,
    y => slice_y_net
  );
end structural;
-- Generated from Simulink block ComplexPhaseDetector/Bipolar NCO/CORDIC SINCOS/CORDIC Fine Angle PE/CORDIC PE14
library IEEE;
use IEEE.std_logic_1164.all;
library work;
use work.conv_pkg.all;
entity complexphasedetector_cordic_pe14 is
  port (
    x : in std_logic_vector( 21-1 downto 0 );
    y : in std_logic_vector( 21-1 downto 0 );
    z : in std_logic_vector( 21-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    x_x0 : out std_logic_vector( 21-1 downto 0 );
    y_x0 : out std_logic_vector( 21-1 downto 0 );
    z_x0 : out std_logic_vector( 21-1 downto 0 )
  );
end complexphasedetector_cordic_pe14;
architecture structural of complexphasedetector_cordic_pe14 is 
  signal addsub1_s_net : std_logic_vector( 21-1 downto 0 );
  signal ce_net : std_logic;
  signal addsub1_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal inverter_op_net : std_logic_vector( 1-1 downto 0 );
  signal addsub_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal addsub_s_net : std_logic_vector( 21-1 downto 0 );
  signal addsub2_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal slice_y_net : std_logic_vector( 1-1 downto 0 );
  signal clk_net : std_logic;
  signal shift_op_net : std_logic_vector( 21-1 downto 0 );
  signal addsub2_s_net : std_logic_vector( 21-1 downto 0 );
  signal shift1_op_net : std_logic_vector( 21-1 downto 0 );
  signal constant_op_net : std_logic_vector( 21-1 downto 0 );
begin
  x_x0 <= addsub_s_net;
  y_x0 <= addsub1_s_net;
  z_x0 <= addsub2_s_net;
  addsub_s_net_x0 <= x;
  addsub1_s_net_x0 <= y;
  addsub2_s_net_x0 <= z;
  clk_net <= clk_1;
  ce_net <= ce_1;
  addsub : entity work.sysgen_addsub_0378e36815 
  port map (
    clr => '0',
    a => addsub_s_net_x0,
    b => shift1_op_net,
    mode => inverter_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub_s_net
  );
  addsub1 : entity work.sysgen_addsub_0378e36815 
  port map (
    clr => '0',
    a => addsub1_s_net_x0,
    b => shift_op_net,
    mode => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub1_s_net
  );
  addsub2 : entity work.sysgen_addsub_0378e36815 
  port map (
    clr => '0',
    a => addsub2_s_net_x0,
    b => constant_op_net,
    mode => inverter_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub2_s_net
  );
  constant_x0 : entity work.sysgen_constant_ca899ca488 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  inverter : entity work.sysgen_inverter_3e6e50377b 
  port map (
    clr => '0',
    ip => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    op => inverter_op_net
  );
  shift : entity work.sysgen_shift_cd9d454ce1 
  port map (
    clr => '0',
    ip => addsub_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift_op_net
  );
  shift1 : entity work.sysgen_shift_cd9d454ce1 
  port map (
    clr => '0',
    ip => addsub1_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift1_op_net
  );
  slice : entity work.complexphasedetector_xlslice 
  generic map (
    new_lsb => 20,
    new_msb => 20,
    x_width => 21,
    y_width => 1
  )
  port map (
    x => addsub2_s_net_x0,
    y => slice_y_net
  );
end structural;
-- Generated from Simulink block ComplexPhaseDetector/Bipolar NCO/CORDIC SINCOS/CORDIC Fine Angle PE/CORDIC PE15
library IEEE;
use IEEE.std_logic_1164.all;
library work;
use work.conv_pkg.all;
entity complexphasedetector_cordic_pe15 is
  port (
    x : in std_logic_vector( 21-1 downto 0 );
    y : in std_logic_vector( 21-1 downto 0 );
    z : in std_logic_vector( 21-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    x_x0 : out std_logic_vector( 21-1 downto 0 );
    y_x0 : out std_logic_vector( 21-1 downto 0 );
    z_x0 : out std_logic_vector( 21-1 downto 0 )
  );
end complexphasedetector_cordic_pe15;
architecture structural of complexphasedetector_cordic_pe15 is 
  signal constant_op_net : std_logic_vector( 21-1 downto 0 );
  signal ce_net : std_logic;
  signal addsub_s_net : std_logic_vector( 21-1 downto 0 );
  signal addsub1_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal addsub_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal slice_y_net : std_logic_vector( 1-1 downto 0 );
  signal addsub2_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal shift_op_net : std_logic_vector( 21-1 downto 0 );
  signal inverter_op_net : std_logic_vector( 1-1 downto 0 );
  signal clk_net : std_logic;
  signal shift1_op_net : std_logic_vector( 21-1 downto 0 );
  signal addsub1_s_net : std_logic_vector( 21-1 downto 0 );
  signal addsub2_s_net : std_logic_vector( 21-1 downto 0 );
begin
  x_x0 <= addsub_s_net;
  y_x0 <= addsub1_s_net;
  z_x0 <= addsub2_s_net;
  addsub_s_net_x0 <= x;
  addsub1_s_net_x0 <= y;
  addsub2_s_net_x0 <= z;
  clk_net <= clk_1;
  ce_net <= ce_1;
  addsub : entity work.sysgen_addsub_0378e36815 
  port map (
    clr => '0',
    a => addsub_s_net_x0,
    b => shift1_op_net,
    mode => inverter_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub_s_net
  );
  addsub1 : entity work.sysgen_addsub_0378e36815 
  port map (
    clr => '0',
    a => addsub1_s_net_x0,
    b => shift_op_net,
    mode => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub1_s_net
  );
  addsub2 : entity work.sysgen_addsub_0378e36815 
  port map (
    clr => '0',
    a => addsub2_s_net_x0,
    b => constant_op_net,
    mode => inverter_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub2_s_net
  );
  constant_x0 : entity work.sysgen_constant_7603c43373 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  inverter : entity work.sysgen_inverter_3e6e50377b 
  port map (
    clr => '0',
    ip => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    op => inverter_op_net
  );
  shift : entity work.sysgen_shift_45bceaa2b5 
  port map (
    clr => '0',
    ip => addsub_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift_op_net
  );
  shift1 : entity work.sysgen_shift_45bceaa2b5 
  port map (
    clr => '0',
    ip => addsub1_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift1_op_net
  );
  slice : entity work.complexphasedetector_xlslice 
  generic map (
    new_lsb => 20,
    new_msb => 20,
    x_width => 21,
    y_width => 1
  )
  port map (
    x => addsub2_s_net_x0,
    y => slice_y_net
  );
end structural;
-- Generated from Simulink block ComplexPhaseDetector/Bipolar NCO/CORDIC SINCOS/CORDIC Fine Angle PE/CORDIC PE16
library IEEE;
use IEEE.std_logic_1164.all;
library work;
use work.conv_pkg.all;
entity complexphasedetector_cordic_pe16 is
  port (
    x : in std_logic_vector( 21-1 downto 0 );
    y : in std_logic_vector( 21-1 downto 0 );
    z : in std_logic_vector( 21-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    x_x0 : out std_logic_vector( 21-1 downto 0 );
    y_x0 : out std_logic_vector( 21-1 downto 0 );
    z_x0 : out std_logic_vector( 21-1 downto 0 )
  );
end complexphasedetector_cordic_pe16;
architecture structural of complexphasedetector_cordic_pe16 is 
  signal addsub_s_net : std_logic_vector( 21-1 downto 0 );
  signal ce_net : std_logic;
  signal shift_op_net : std_logic_vector( 21-1 downto 0 );
  signal slice_y_net : std_logic_vector( 1-1 downto 0 );
  signal addsub2_s_net : std_logic_vector( 21-1 downto 0 );
  signal inverter_op_net : std_logic_vector( 1-1 downto 0 );
  signal addsub_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal constant_op_net : std_logic_vector( 21-1 downto 0 );
  signal shift1_op_net : std_logic_vector( 21-1 downto 0 );
  signal addsub1_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal addsub2_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal clk_net : std_logic;
  signal addsub1_s_net : std_logic_vector( 21-1 downto 0 );
begin
  x_x0 <= addsub_s_net;
  y_x0 <= addsub1_s_net;
  z_x0 <= addsub2_s_net;
  addsub_s_net_x0 <= x;
  addsub1_s_net_x0 <= y;
  addsub2_s_net_x0 <= z;
  clk_net <= clk_1;
  ce_net <= ce_1;
  addsub : entity work.sysgen_addsub_0378e36815 
  port map (
    clr => '0',
    a => addsub_s_net_x0,
    b => shift1_op_net,
    mode => inverter_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub_s_net
  );
  addsub1 : entity work.sysgen_addsub_0378e36815 
  port map (
    clr => '0',
    a => addsub1_s_net_x0,
    b => shift_op_net,
    mode => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub1_s_net
  );
  addsub2 : entity work.sysgen_addsub_0378e36815 
  port map (
    clr => '0',
    a => addsub2_s_net_x0,
    b => constant_op_net,
    mode => inverter_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub2_s_net
  );
  constant_x0 : entity work.sysgen_constant_8b6e3db9df 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  inverter : entity work.sysgen_inverter_3e6e50377b 
  port map (
    clr => '0',
    ip => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    op => inverter_op_net
  );
  shift : entity work.sysgen_shift_e1d9c89163 
  port map (
    clr => '0',
    ip => addsub_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift_op_net
  );
  shift1 : entity work.sysgen_shift_e1d9c89163 
  port map (
    clr => '0',
    ip => addsub1_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift1_op_net
  );
  slice : entity work.complexphasedetector_xlslice 
  generic map (
    new_lsb => 20,
    new_msb => 20,
    x_width => 21,
    y_width => 1
  )
  port map (
    x => addsub2_s_net_x0,
    y => slice_y_net
  );
end structural;
-- Generated from Simulink block ComplexPhaseDetector/Bipolar NCO/CORDIC SINCOS/CORDIC Fine Angle PE/CORDIC PE17
library IEEE;
use IEEE.std_logic_1164.all;
library work;
use work.conv_pkg.all;
entity complexphasedetector_cordic_pe17 is
  port (
    x : in std_logic_vector( 21-1 downto 0 );
    y : in std_logic_vector( 21-1 downto 0 );
    z : in std_logic_vector( 21-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    x_x0 : out std_logic_vector( 21-1 downto 0 );
    y_x0 : out std_logic_vector( 21-1 downto 0 )
  );
end complexphasedetector_cordic_pe17;
architecture structural of complexphasedetector_cordic_pe17 is 
  signal clk_net : std_logic;
  signal inverter_op_net : std_logic_vector( 1-1 downto 0 );
  signal addsub_s_net : std_logic_vector( 21-1 downto 0 );
  signal shift1_op_net : std_logic_vector( 21-1 downto 0 );
  signal addsub2_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal addsub1_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal ce_net : std_logic;
  signal addsub_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal shift_op_net : std_logic_vector( 21-1 downto 0 );
  signal addsub1_s_net : std_logic_vector( 21-1 downto 0 );
  signal slice_y_net : std_logic_vector( 1-1 downto 0 );
begin
  x_x0 <= addsub_s_net;
  y_x0 <= addsub1_s_net;
  addsub_s_net_x0 <= x;
  addsub1_s_net_x0 <= y;
  addsub2_s_net_x0 <= z;
  clk_net <= clk_1;
  ce_net <= ce_1;
  addsub : entity work.sysgen_addsub_0378e36815 
  port map (
    clr => '0',
    a => addsub_s_net_x0,
    b => shift1_op_net,
    mode => inverter_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub_s_net
  );
  addsub1 : entity work.sysgen_addsub_0378e36815 
  port map (
    clr => '0',
    a => addsub1_s_net_x0,
    b => shift_op_net,
    mode => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub1_s_net
  );
  inverter : entity work.sysgen_inverter_3e6e50377b 
  port map (
    clr => '0',
    ip => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    op => inverter_op_net
  );
  shift : entity work.sysgen_shift_b330e7239b 
  port map (
    clr => '0',
    ip => addsub_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift_op_net
  );
  shift1 : entity work.sysgen_shift_b330e7239b 
  port map (
    clr => '0',
    ip => addsub1_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift1_op_net
  );
  slice : entity work.complexphasedetector_xlslice 
  generic map (
    new_lsb => 20,
    new_msb => 20,
    x_width => 21,
    y_width => 1
  )
  port map (
    x => addsub2_s_net_x0,
    y => slice_y_net
  );
end structural;
-- Generated from Simulink block ComplexPhaseDetector/Bipolar NCO/CORDIC SINCOS/CORDIC Fine Angle PE/CORDIC PE2
library IEEE;
use IEEE.std_logic_1164.all;
library work;
use work.conv_pkg.all;
entity complexphasedetector_cordic_pe2 is
  port (
    x : in std_logic_vector( 21-1 downto 0 );
    y : in std_logic_vector( 21-1 downto 0 );
    z : in std_logic_vector( 21-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    x_x0 : out std_logic_vector( 21-1 downto 0 );
    y_x0 : out std_logic_vector( 21-1 downto 0 );
    z_x0 : out std_logic_vector( 21-1 downto 0 )
  );
end complexphasedetector_cordic_pe2;
architecture structural of complexphasedetector_cordic_pe2 is 
  signal addsub_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal addsub1_s_net : std_logic_vector( 21-1 downto 0 );
  signal addsub2_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal ce_net : std_logic;
  signal clk_net : std_logic;
  signal slice_y_net : std_logic_vector( 1-1 downto 0 );
  signal constant_op_net : std_logic_vector( 21-1 downto 0 );
  signal addsub_s_net : std_logic_vector( 21-1 downto 0 );
  signal inverter_op_net : std_logic_vector( 1-1 downto 0 );
  signal shift1_op_net : std_logic_vector( 21-1 downto 0 );
  signal addsub2_s_net : std_logic_vector( 21-1 downto 0 );
  signal addsub1_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal shift_op_net : std_logic_vector( 21-1 downto 0 );
begin
  x_x0 <= addsub_s_net;
  y_x0 <= addsub1_s_net;
  z_x0 <= addsub2_s_net;
  addsub_s_net_x0 <= x;
  addsub1_s_net_x0 <= y;
  addsub2_s_net_x0 <= z;
  clk_net <= clk_1;
  ce_net <= ce_1;
  addsub : entity work.sysgen_addsub_0378e36815 
  port map (
    clr => '0',
    a => addsub_s_net_x0,
    b => shift1_op_net,
    mode => inverter_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub_s_net
  );
  addsub1 : entity work.sysgen_addsub_0378e36815 
  port map (
    clr => '0',
    a => addsub1_s_net_x0,
    b => shift_op_net,
    mode => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub1_s_net
  );
  addsub2 : entity work.sysgen_addsub_0378e36815 
  port map (
    clr => '0',
    a => addsub2_s_net_x0,
    b => constant_op_net,
    mode => inverter_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub2_s_net
  );
  constant_x0 : entity work.sysgen_constant_164a028f76 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  inverter : entity work.sysgen_inverter_3e6e50377b 
  port map (
    clr => '0',
    ip => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    op => inverter_op_net
  );
  shift : entity work.sysgen_shift_bd462af9f0 
  port map (
    clr => '0',
    ip => addsub_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift_op_net
  );
  shift1 : entity work.sysgen_shift_bd462af9f0 
  port map (
    clr => '0',
    ip => addsub1_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift1_op_net
  );
  slice : entity work.complexphasedetector_xlslice 
  generic map (
    new_lsb => 20,
    new_msb => 20,
    x_width => 21,
    y_width => 1
  )
  port map (
    x => addsub2_s_net_x0,
    y => slice_y_net
  );
end structural;
-- Generated from Simulink block ComplexPhaseDetector/Bipolar NCO/CORDIC SINCOS/CORDIC Fine Angle PE/CORDIC PE3
library IEEE;
use IEEE.std_logic_1164.all;
library work;
use work.conv_pkg.all;
entity complexphasedetector_cordic_pe3 is
  port (
    x : in std_logic_vector( 21-1 downto 0 );
    y : in std_logic_vector( 21-1 downto 0 );
    z : in std_logic_vector( 21-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    x_x0 : out std_logic_vector( 21-1 downto 0 );
    y_x0 : out std_logic_vector( 21-1 downto 0 );
    z_x0 : out std_logic_vector( 21-1 downto 0 )
  );
end complexphasedetector_cordic_pe3;
architecture structural of complexphasedetector_cordic_pe3 is 
  signal shift_op_net : std_logic_vector( 21-1 downto 0 );
  signal addsub1_s_net : std_logic_vector( 21-1 downto 0 );
  signal addsub_s_net : std_logic_vector( 21-1 downto 0 );
  signal addsub_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal shift1_op_net : std_logic_vector( 21-1 downto 0 );
  signal ce_net : std_logic;
  signal slice_y_net : std_logic_vector( 1-1 downto 0 );
  signal addsub2_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal clk_net : std_logic;
  signal inverter_op_net : std_logic_vector( 1-1 downto 0 );
  signal addsub1_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal constant_op_net : std_logic_vector( 21-1 downto 0 );
  signal addsub2_s_net : std_logic_vector( 21-1 downto 0 );
begin
  x_x0 <= addsub_s_net;
  y_x0 <= addsub1_s_net;
  z_x0 <= addsub2_s_net;
  addsub_s_net_x0 <= x;
  addsub1_s_net_x0 <= y;
  addsub2_s_net_x0 <= z;
  clk_net <= clk_1;
  ce_net <= ce_1;
  addsub : entity work.sysgen_addsub_0378e36815 
  port map (
    clr => '0',
    a => addsub_s_net_x0,
    b => shift1_op_net,
    mode => inverter_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub_s_net
  );
  addsub1 : entity work.sysgen_addsub_0378e36815 
  port map (
    clr => '0',
    a => addsub1_s_net_x0,
    b => shift_op_net,
    mode => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub1_s_net
  );
  addsub2 : entity work.sysgen_addsub_0378e36815 
  port map (
    clr => '0',
    a => addsub2_s_net_x0,
    b => constant_op_net,
    mode => inverter_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub2_s_net
  );
  constant_x0 : entity work.sysgen_constant_f61498e270 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  inverter : entity work.sysgen_inverter_3e6e50377b 
  port map (
    clr => '0',
    ip => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    op => inverter_op_net
  );
  shift : entity work.sysgen_shift_f9793e535c 
  port map (
    clr => '0',
    ip => addsub_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift_op_net
  );
  shift1 : entity work.sysgen_shift_f9793e535c 
  port map (
    clr => '0',
    ip => addsub1_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift1_op_net
  );
  slice : entity work.complexphasedetector_xlslice 
  generic map (
    new_lsb => 20,
    new_msb => 20,
    x_width => 21,
    y_width => 1
  )
  port map (
    x => addsub2_s_net_x0,
    y => slice_y_net
  );
end structural;
-- Generated from Simulink block ComplexPhaseDetector/Bipolar NCO/CORDIC SINCOS/CORDIC Fine Angle PE/CORDIC PE4
library IEEE;
use IEEE.std_logic_1164.all;
library work;
use work.conv_pkg.all;
entity complexphasedetector_cordic_pe4 is
  port (
    x : in std_logic_vector( 21-1 downto 0 );
    y : in std_logic_vector( 21-1 downto 0 );
    z : in std_logic_vector( 21-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    x_x0 : out std_logic_vector( 21-1 downto 0 );
    y_x0 : out std_logic_vector( 21-1 downto 0 );
    z_x0 : out std_logic_vector( 21-1 downto 0 )
  );
end complexphasedetector_cordic_pe4;
architecture structural of complexphasedetector_cordic_pe4 is 
  signal addsub1_s_net : std_logic_vector( 21-1 downto 0 );
  signal addsub1_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal addsub_s_net : std_logic_vector( 21-1 downto 0 );
  signal constant_op_net : std_logic_vector( 21-1 downto 0 );
  signal slice_y_net : std_logic_vector( 1-1 downto 0 );
  signal shift1_op_net : std_logic_vector( 21-1 downto 0 );
  signal ce_net : std_logic;
  signal shift_op_net : std_logic_vector( 21-1 downto 0 );
  signal addsub2_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal addsub2_s_net : std_logic_vector( 21-1 downto 0 );
  signal clk_net : std_logic;
  signal inverter_op_net : std_logic_vector( 1-1 downto 0 );
  signal addsub_s_net_x0 : std_logic_vector( 21-1 downto 0 );
begin
  x_x0 <= addsub_s_net;
  y_x0 <= addsub1_s_net;
  z_x0 <= addsub2_s_net;
  addsub_s_net_x0 <= x;
  addsub1_s_net_x0 <= y;
  addsub2_s_net_x0 <= z;
  clk_net <= clk_1;
  ce_net <= ce_1;
  addsub : entity work.sysgen_addsub_0378e36815 
  port map (
    clr => '0',
    a => addsub_s_net_x0,
    b => shift1_op_net,
    mode => inverter_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub_s_net
  );
  addsub1 : entity work.sysgen_addsub_0378e36815 
  port map (
    clr => '0',
    a => addsub1_s_net_x0,
    b => shift_op_net,
    mode => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub1_s_net
  );
  addsub2 : entity work.sysgen_addsub_0378e36815 
  port map (
    clr => '0',
    a => addsub2_s_net_x0,
    b => constant_op_net,
    mode => inverter_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub2_s_net
  );
  constant_x0 : entity work.sysgen_constant_3d5154bc3c 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  inverter : entity work.sysgen_inverter_3e6e50377b 
  port map (
    clr => '0',
    ip => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    op => inverter_op_net
  );
  shift : entity work.sysgen_shift_f458af67ef 
  port map (
    clr => '0',
    ip => addsub_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift_op_net
  );
  shift1 : entity work.sysgen_shift_f458af67ef 
  port map (
    clr => '0',
    ip => addsub1_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift1_op_net
  );
  slice : entity work.complexphasedetector_xlslice 
  generic map (
    new_lsb => 20,
    new_msb => 20,
    x_width => 21,
    y_width => 1
  )
  port map (
    x => addsub2_s_net_x0,
    y => slice_y_net
  );
end structural;
-- Generated from Simulink block ComplexPhaseDetector/Bipolar NCO/CORDIC SINCOS/CORDIC Fine Angle PE/CORDIC PE5
library IEEE;
use IEEE.std_logic_1164.all;
library work;
use work.conv_pkg.all;
entity complexphasedetector_cordic_pe5 is
  port (
    x : in std_logic_vector( 21-1 downto 0 );
    y : in std_logic_vector( 21-1 downto 0 );
    z : in std_logic_vector( 21-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    x_x0 : out std_logic_vector( 21-1 downto 0 );
    y_x0 : out std_logic_vector( 21-1 downto 0 );
    z_x0 : out std_logic_vector( 21-1 downto 0 )
  );
end complexphasedetector_cordic_pe5;
architecture structural of complexphasedetector_cordic_pe5 is 
  signal addsub_s_net : std_logic_vector( 21-1 downto 0 );
  signal addsub_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal inverter_op_net : std_logic_vector( 1-1 downto 0 );
  signal addsub2_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal addsub2_s_net : std_logic_vector( 21-1 downto 0 );
  signal shift1_op_net : std_logic_vector( 21-1 downto 0 );
  signal ce_net : std_logic;
  signal clk_net : std_logic;
  signal addsub1_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal shift_op_net : std_logic_vector( 21-1 downto 0 );
  signal constant_op_net : std_logic_vector( 21-1 downto 0 );
  signal addsub1_s_net : std_logic_vector( 21-1 downto 0 );
  signal slice_y_net : std_logic_vector( 1-1 downto 0 );
begin
  x_x0 <= addsub_s_net;
  y_x0 <= addsub1_s_net;
  z_x0 <= addsub2_s_net;
  addsub_s_net_x0 <= x;
  addsub1_s_net_x0 <= y;
  addsub2_s_net_x0 <= z;
  clk_net <= clk_1;
  ce_net <= ce_1;
  addsub : entity work.sysgen_addsub_0378e36815 
  port map (
    clr => '0',
    a => addsub_s_net_x0,
    b => shift1_op_net,
    mode => inverter_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub_s_net
  );
  addsub1 : entity work.sysgen_addsub_0378e36815 
  port map (
    clr => '0',
    a => addsub1_s_net_x0,
    b => shift_op_net,
    mode => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub1_s_net
  );
  addsub2 : entity work.sysgen_addsub_0378e36815 
  port map (
    clr => '0',
    a => addsub2_s_net_x0,
    b => constant_op_net,
    mode => inverter_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub2_s_net
  );
  constant_x0 : entity work.sysgen_constant_d200d7f47c 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  inverter : entity work.sysgen_inverter_3e6e50377b 
  port map (
    clr => '0',
    ip => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    op => inverter_op_net
  );
  shift : entity work.sysgen_shift_e2fcc2322e 
  port map (
    clr => '0',
    ip => addsub_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift_op_net
  );
  shift1 : entity work.sysgen_shift_e2fcc2322e 
  port map (
    clr => '0',
    ip => addsub1_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift1_op_net
  );
  slice : entity work.complexphasedetector_xlslice 
  generic map (
    new_lsb => 20,
    new_msb => 20,
    x_width => 21,
    y_width => 1
  )
  port map (
    x => addsub2_s_net_x0,
    y => slice_y_net
  );
end structural;
-- Generated from Simulink block ComplexPhaseDetector/Bipolar NCO/CORDIC SINCOS/CORDIC Fine Angle PE/CORDIC PE6
library IEEE;
use IEEE.std_logic_1164.all;
library work;
use work.conv_pkg.all;
entity complexphasedetector_cordic_pe6 is
  port (
    x : in std_logic_vector( 21-1 downto 0 );
    y : in std_logic_vector( 21-1 downto 0 );
    z : in std_logic_vector( 21-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    x_x0 : out std_logic_vector( 21-1 downto 0 );
    y_x0 : out std_logic_vector( 21-1 downto 0 );
    z_x0 : out std_logic_vector( 21-1 downto 0 )
  );
end complexphasedetector_cordic_pe6;
architecture structural of complexphasedetector_cordic_pe6 is 
  signal shift_op_net : std_logic_vector( 21-1 downto 0 );
  signal addsub2_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal shift1_op_net : std_logic_vector( 21-1 downto 0 );
  signal addsub_s_net : std_logic_vector( 21-1 downto 0 );
  signal ce_net : std_logic;
  signal addsub_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal slice_y_net : std_logic_vector( 1-1 downto 0 );
  signal inverter_op_net : std_logic_vector( 1-1 downto 0 );
  signal constant_op_net : std_logic_vector( 21-1 downto 0 );
  signal clk_net : std_logic;
  signal addsub1_s_net : std_logic_vector( 21-1 downto 0 );
  signal addsub1_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal addsub2_s_net : std_logic_vector( 21-1 downto 0 );
begin
  x_x0 <= addsub_s_net;
  y_x0 <= addsub1_s_net;
  z_x0 <= addsub2_s_net;
  addsub_s_net_x0 <= x;
  addsub1_s_net_x0 <= y;
  addsub2_s_net_x0 <= z;
  clk_net <= clk_1;
  ce_net <= ce_1;
  addsub : entity work.sysgen_addsub_0378e36815 
  port map (
    clr => '0',
    a => addsub_s_net_x0,
    b => shift1_op_net,
    mode => inverter_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub_s_net
  );
  addsub1 : entity work.sysgen_addsub_0378e36815 
  port map (
    clr => '0',
    a => addsub1_s_net_x0,
    b => shift_op_net,
    mode => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub1_s_net
  );
  addsub2 : entity work.sysgen_addsub_0378e36815 
  port map (
    clr => '0',
    a => addsub2_s_net_x0,
    b => constant_op_net,
    mode => inverter_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub2_s_net
  );
  constant_x0 : entity work.sysgen_constant_b61e024542 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  inverter : entity work.sysgen_inverter_3e6e50377b 
  port map (
    clr => '0',
    ip => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    op => inverter_op_net
  );
  shift : entity work.sysgen_shift_39a928baea 
  port map (
    clr => '0',
    ip => addsub_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift_op_net
  );
  shift1 : entity work.sysgen_shift_39a928baea 
  port map (
    clr => '0',
    ip => addsub1_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift1_op_net
  );
  slice : entity work.complexphasedetector_xlslice 
  generic map (
    new_lsb => 20,
    new_msb => 20,
    x_width => 21,
    y_width => 1
  )
  port map (
    x => addsub2_s_net_x0,
    y => slice_y_net
  );
end structural;
-- Generated from Simulink block ComplexPhaseDetector/Bipolar NCO/CORDIC SINCOS/CORDIC Fine Angle PE/CORDIC PE7
library IEEE;
use IEEE.std_logic_1164.all;
library work;
use work.conv_pkg.all;
entity complexphasedetector_cordic_pe7 is
  port (
    x : in std_logic_vector( 21-1 downto 0 );
    y : in std_logic_vector( 21-1 downto 0 );
    z : in std_logic_vector( 21-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    x_x0 : out std_logic_vector( 21-1 downto 0 );
    y_x0 : out std_logic_vector( 21-1 downto 0 );
    z_x0 : out std_logic_vector( 21-1 downto 0 )
  );
end complexphasedetector_cordic_pe7;
architecture structural of complexphasedetector_cordic_pe7 is 
  signal clk_net : std_logic;
  signal shift_op_net : std_logic_vector( 21-1 downto 0 );
  signal shift1_op_net : std_logic_vector( 21-1 downto 0 );
  signal addsub1_s_net : std_logic_vector( 21-1 downto 0 );
  signal addsub1_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal addsub2_s_net : std_logic_vector( 21-1 downto 0 );
  signal addsub_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal addsub2_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal ce_net : std_logic;
  signal inverter_op_net : std_logic_vector( 1-1 downto 0 );
  signal slice_y_net : std_logic_vector( 1-1 downto 0 );
  signal constant_op_net : std_logic_vector( 21-1 downto 0 );
  signal addsub_s_net : std_logic_vector( 21-1 downto 0 );
begin
  x_x0 <= addsub_s_net;
  y_x0 <= addsub1_s_net;
  z_x0 <= addsub2_s_net;
  addsub_s_net_x0 <= x;
  addsub1_s_net_x0 <= y;
  addsub2_s_net_x0 <= z;
  clk_net <= clk_1;
  ce_net <= ce_1;
  addsub : entity work.sysgen_addsub_0378e36815 
  port map (
    clr => '0',
    a => addsub_s_net_x0,
    b => shift1_op_net,
    mode => inverter_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub_s_net
  );
  addsub1 : entity work.sysgen_addsub_0378e36815 
  port map (
    clr => '0',
    a => addsub1_s_net_x0,
    b => shift_op_net,
    mode => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub1_s_net
  );
  addsub2 : entity work.sysgen_addsub_0378e36815 
  port map (
    clr => '0',
    a => addsub2_s_net_x0,
    b => constant_op_net,
    mode => inverter_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub2_s_net
  );
  constant_x0 : entity work.sysgen_constant_0387fd902b 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  inverter : entity work.sysgen_inverter_3e6e50377b 
  port map (
    clr => '0',
    ip => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    op => inverter_op_net
  );
  shift : entity work.sysgen_shift_042b774d86 
  port map (
    clr => '0',
    ip => addsub_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift_op_net
  );
  shift1 : entity work.sysgen_shift_042b774d86 
  port map (
    clr => '0',
    ip => addsub1_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift1_op_net
  );
  slice : entity work.complexphasedetector_xlslice 
  generic map (
    new_lsb => 20,
    new_msb => 20,
    x_width => 21,
    y_width => 1
  )
  port map (
    x => addsub2_s_net_x0,
    y => slice_y_net
  );
end structural;
-- Generated from Simulink block ComplexPhaseDetector/Bipolar NCO/CORDIC SINCOS/CORDIC Fine Angle PE/CORDIC PE8
library IEEE;
use IEEE.std_logic_1164.all;
library work;
use work.conv_pkg.all;
entity complexphasedetector_cordic_pe8 is
  port (
    x : in std_logic_vector( 21-1 downto 0 );
    y : in std_logic_vector( 21-1 downto 0 );
    z : in std_logic_vector( 21-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    x_x0 : out std_logic_vector( 21-1 downto 0 );
    y_x0 : out std_logic_vector( 21-1 downto 0 );
    z_x0 : out std_logic_vector( 21-1 downto 0 )
  );
end complexphasedetector_cordic_pe8;
architecture structural of complexphasedetector_cordic_pe8 is 
  signal ce_net : std_logic;
  signal shift_op_net : std_logic_vector( 21-1 downto 0 );
  signal addsub1_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal addsub2_s_net : std_logic_vector( 21-1 downto 0 );
  signal addsub_s_net : std_logic_vector( 21-1 downto 0 );
  signal addsub2_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal constant_op_net : std_logic_vector( 21-1 downto 0 );
  signal addsub1_s_net : std_logic_vector( 21-1 downto 0 );
  signal inverter_op_net : std_logic_vector( 1-1 downto 0 );
  signal slice_y_net : std_logic_vector( 1-1 downto 0 );
  signal clk_net : std_logic;
  signal shift1_op_net : std_logic_vector( 21-1 downto 0 );
  signal addsub_s_net_x0 : std_logic_vector( 21-1 downto 0 );
begin
  x_x0 <= addsub_s_net;
  y_x0 <= addsub1_s_net;
  z_x0 <= addsub2_s_net;
  addsub_s_net_x0 <= x;
  addsub1_s_net_x0 <= y;
  addsub2_s_net_x0 <= z;
  clk_net <= clk_1;
  ce_net <= ce_1;
  addsub : entity work.sysgen_addsub_0378e36815 
  port map (
    clr => '0',
    a => addsub_s_net_x0,
    b => shift1_op_net,
    mode => inverter_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub_s_net
  );
  addsub1 : entity work.sysgen_addsub_0378e36815 
  port map (
    clr => '0',
    a => addsub1_s_net_x0,
    b => shift_op_net,
    mode => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub1_s_net
  );
  addsub2 : entity work.sysgen_addsub_0378e36815 
  port map (
    clr => '0',
    a => addsub2_s_net_x0,
    b => constant_op_net,
    mode => inverter_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub2_s_net
  );
  constant_x0 : entity work.sysgen_constant_6eacac8d20 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  inverter : entity work.sysgen_inverter_3e6e50377b 
  port map (
    clr => '0',
    ip => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    op => inverter_op_net
  );
  shift : entity work.sysgen_shift_c197c070dd 
  port map (
    clr => '0',
    ip => addsub_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift_op_net
  );
  shift1 : entity work.sysgen_shift_c197c070dd 
  port map (
    clr => '0',
    ip => addsub1_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift1_op_net
  );
  slice : entity work.complexphasedetector_xlslice 
  generic map (
    new_lsb => 20,
    new_msb => 20,
    x_width => 21,
    y_width => 1
  )
  port map (
    x => addsub2_s_net_x0,
    y => slice_y_net
  );
end structural;
-- Generated from Simulink block ComplexPhaseDetector/Bipolar NCO/CORDIC SINCOS/CORDIC Fine Angle PE/CORDIC PE9
library IEEE;
use IEEE.std_logic_1164.all;
library work;
use work.conv_pkg.all;
entity complexphasedetector_cordic_pe9 is
  port (
    x : in std_logic_vector( 21-1 downto 0 );
    y : in std_logic_vector( 21-1 downto 0 );
    z : in std_logic_vector( 21-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    x_x0 : out std_logic_vector( 21-1 downto 0 );
    y_x0 : out std_logic_vector( 21-1 downto 0 );
    z_x0 : out std_logic_vector( 21-1 downto 0 )
  );
end complexphasedetector_cordic_pe9;
architecture structural of complexphasedetector_cordic_pe9 is 
  signal slice_y_net : std_logic_vector( 1-1 downto 0 );
  signal constant_op_net : std_logic_vector( 21-1 downto 0 );
  signal addsub_s_net : std_logic_vector( 21-1 downto 0 );
  signal addsub2_s_net : std_logic_vector( 21-1 downto 0 );
  signal addsub2_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal clk_net : std_logic;
  signal addsub1_s_net : std_logic_vector( 21-1 downto 0 );
  signal shift1_op_net : std_logic_vector( 21-1 downto 0 );
  signal ce_net : std_logic;
  signal shift_op_net : std_logic_vector( 21-1 downto 0 );
  signal inverter_op_net : std_logic_vector( 1-1 downto 0 );
  signal addsub1_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal addsub_s_net_x0 : std_logic_vector( 21-1 downto 0 );
begin
  x_x0 <= addsub_s_net;
  y_x0 <= addsub1_s_net;
  z_x0 <= addsub2_s_net;
  addsub_s_net_x0 <= x;
  addsub1_s_net_x0 <= y;
  addsub2_s_net_x0 <= z;
  clk_net <= clk_1;
  ce_net <= ce_1;
  addsub : entity work.sysgen_addsub_0378e36815 
  port map (
    clr => '0',
    a => addsub_s_net_x0,
    b => shift1_op_net,
    mode => inverter_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub_s_net
  );
  addsub1 : entity work.sysgen_addsub_0378e36815 
  port map (
    clr => '0',
    a => addsub1_s_net_x0,
    b => shift_op_net,
    mode => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub1_s_net
  );
  addsub2 : entity work.sysgen_addsub_0378e36815 
  port map (
    clr => '0',
    a => addsub2_s_net_x0,
    b => constant_op_net,
    mode => inverter_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub2_s_net
  );
  constant_x0 : entity work.sysgen_constant_552d7ad469 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  inverter : entity work.sysgen_inverter_3e6e50377b 
  port map (
    clr => '0',
    ip => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    op => inverter_op_net
  );
  shift : entity work.sysgen_shift_e0a81bd79e 
  port map (
    clr => '0',
    ip => addsub_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift_op_net
  );
  shift1 : entity work.sysgen_shift_e0a81bd79e 
  port map (
    clr => '0',
    ip => addsub1_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift1_op_net
  );
  slice : entity work.complexphasedetector_xlslice 
  generic map (
    new_lsb => 20,
    new_msb => 20,
    x_width => 21,
    y_width => 1
  )
  port map (
    x => addsub2_s_net_x0,
    y => slice_y_net
  );
end structural;
-- Generated from Simulink block ComplexPhaseDetector/Bipolar NCO/CORDIC SINCOS/CORDIC Fine Angle PE
library IEEE;
use IEEE.std_logic_1164.all;
library work;
use work.conv_pkg.all;
entity complexphasedetector_cordic_fine_angle_pe is
  port (
    x_x0 : in std_logic_vector( 21-1 downto 0 );
    y : in std_logic_vector( 21-1 downto 0 );
    z : in std_logic_vector( 21-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    x : out std_logic_vector( 21-1 downto 0 );
    y_x0 : out std_logic_vector( 21-1 downto 0 )
  );
end complexphasedetector_cordic_fine_angle_pe;
architecture structural of complexphasedetector_cordic_fine_angle_pe is 
  signal addsub1_s_net : std_logic_vector( 21-1 downto 0 );
  signal addsub1_s_net_x11 : std_logic_vector( 21-1 downto 0 );
  signal addsub_s_net_x7 : std_logic_vector( 21-1 downto 0 );
  signal addsub_s_net_x5 : std_logic_vector( 21-1 downto 0 );
  signal addsub1_s_net_x2 : std_logic_vector( 21-1 downto 0 );
  signal addsub_s_net_x10 : std_logic_vector( 21-1 downto 0 );
  signal addsub_s_net_x9 : std_logic_vector( 21-1 downto 0 );
  signal addsub1_s_net_x12 : std_logic_vector( 21-1 downto 0 );
  signal addsub1_s_net_x7 : std_logic_vector( 21-1 downto 0 );
  signal addsub2_s_net_x5 : std_logic_vector( 21-1 downto 0 );
  signal addsub1_s_net_x3 : std_logic_vector( 21-1 downto 0 );
  signal addsub1_s_net_x10 : std_logic_vector( 21-1 downto 0 );
  signal addsub1_s_net_x9 : std_logic_vector( 21-1 downto 0 );
  signal addsub_s_net_x11 : std_logic_vector( 21-1 downto 0 );
  signal addsub2_s_net_x12 : std_logic_vector( 21-1 downto 0 );
  signal addsub2_s_net_x10 : std_logic_vector( 21-1 downto 0 );
  signal addsub2_s_net_x9 : std_logic_vector( 21-1 downto 0 );
  signal mux_y_net : std_logic_vector( 21-1 downto 0 );
  signal addsub_s_net_x8 : std_logic_vector( 21-1 downto 0 );
  signal clk_net : std_logic;
  signal addsub1_s_net_x5 : std_logic_vector( 21-1 downto 0 );
  signal addsub2_s_net_x4 : std_logic_vector( 21-1 downto 0 );
  signal addsub_s_net_x1 : std_logic_vector( 21-1 downto 0 );
  signal addsub2_s_net_x1 : std_logic_vector( 21-1 downto 0 );
  signal addsub1_s_net_x6 : std_logic_vector( 21-1 downto 0 );
  signal addsub_s_net_x3 : std_logic_vector( 21-1 downto 0 );
  signal addsub2_s_net_x8 : std_logic_vector( 21-1 downto 0 );
  signal addsub2_s_net_x11 : std_logic_vector( 21-1 downto 0 );
  signal addsub_s_net_x15 : std_logic_vector( 21-1 downto 0 );
  signal addsub2_s_net_x7 : std_logic_vector( 21-1 downto 0 );
  signal addsub2_s_net_x6 : std_logic_vector( 21-1 downto 0 );
  signal addsub1_s_net_x8 : std_logic_vector( 21-1 downto 0 );
  signal addsub_s_net_x4 : std_logic_vector( 21-1 downto 0 );
  signal constant_op_net : std_logic_vector( 21-1 downto 0 );
  signal addsub2_s_net_x2 : std_logic_vector( 21-1 downto 0 );
  signal addsub_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal addsub1_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal addsub2_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal addsub_s_net : std_logic_vector( 21-1 downto 0 );
  signal constant1_op_net : std_logic_vector( 21-1 downto 0 );
  signal addsub_s_net_x2 : std_logic_vector( 21-1 downto 0 );
  signal ce_net : std_logic;
  signal addsub_s_net_x6 : std_logic_vector( 21-1 downto 0 );
  signal addsub1_s_net_x4 : std_logic_vector( 21-1 downto 0 );
  signal addsub1_s_net_x1 : std_logic_vector( 21-1 downto 0 );
  signal addsub2_s_net : std_logic_vector( 21-1 downto 0 );
  signal addsub1_s_net_x13 : std_logic_vector( 21-1 downto 0 );
  signal addsub2_s_net_x13 : std_logic_vector( 21-1 downto 0 );
  signal addsub2_s_net_x14 : std_logic_vector( 21-1 downto 0 );
  signal addsub_s_net_x12 : std_logic_vector( 21-1 downto 0 );
  signal addsub1_s_net_x14 : std_logic_vector( 21-1 downto 0 );
  signal addsub_s_net_x13 : std_logic_vector( 21-1 downto 0 );
  signal addsub1_s_net_x15 : std_logic_vector( 21-1 downto 0 );
  signal addsub_s_net_x14 : std_logic_vector( 21-1 downto 0 );
  signal addsub2_s_net_x15 : std_logic_vector( 21-1 downto 0 );
begin
  x <= addsub_s_net_x3;
  y_x0 <= addsub1_s_net_x3;
  constant_op_net <= x_x0;
  constant1_op_net <= y;
  mux_y_net <= z;
  clk_net <= clk_1;
  ce_net <= ce_1;
  cordic_pe1 : entity work.complexphasedetector_cordic_pe1 
  port map (
    x => constant_op_net,
    y => constant1_op_net,
    z => mux_y_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    x_x0 => addsub_s_net_x10,
    y_x0 => addsub1_s_net_x10,
    z_x0 => addsub2_s_net_x11
  );
  cordic_pe10 : entity work.complexphasedetector_cordic_pe10 
  port map (
    x => addsub_s_net_x11,
    y => addsub1_s_net_x11,
    z => addsub2_s_net_x12,
    clk_1 => clk_net,
    ce_1 => ce_net,
    x_x0 => addsub_s_net_x15,
    y_x0 => addsub1_s_net_x9,
    z_x0 => addsub2_s_net_x10
  );
  cordic_pe11 : entity work.complexphasedetector_cordic_pe11 
  port map (
    x => addsub_s_net_x15,
    y => addsub1_s_net_x9,
    z => addsub2_s_net_x10,
    clk_1 => clk_net,
    ce_1 => ce_net,
    x_x0 => addsub_s_net_x9,
    y_x0 => addsub1_s_net_x8,
    z_x0 => addsub2_s_net_x9
  );
  cordic_pe12 : entity work.complexphasedetector_cordic_pe12 
  port map (
    x => addsub_s_net_x9,
    y => addsub1_s_net_x8,
    z => addsub2_s_net_x9,
    clk_1 => clk_net,
    ce_1 => ce_net,
    x_x0 => addsub_s_net_x8,
    y_x0 => addsub1_s_net_x7,
    z_x0 => addsub2_s_net_x8
  );
  cordic_pe13 : entity work.complexphasedetector_cordic_pe13 
  port map (
    x => addsub_s_net_x8,
    y => addsub1_s_net_x7,
    z => addsub2_s_net_x8,
    clk_1 => clk_net,
    ce_1 => ce_net,
    x_x0 => addsub_s_net_x7,
    y_x0 => addsub1_s_net_x6,
    z_x0 => addsub2_s_net_x7
  );
  cordic_pe14 : entity work.complexphasedetector_cordic_pe14 
  port map (
    x => addsub_s_net_x7,
    y => addsub1_s_net_x6,
    z => addsub2_s_net_x7,
    clk_1 => clk_net,
    ce_1 => ce_net,
    x_x0 => addsub_s_net_x6,
    y_x0 => addsub1_s_net_x5,
    z_x0 => addsub2_s_net_x6
  );
  cordic_pe15 : entity work.complexphasedetector_cordic_pe15 
  port map (
    x => addsub_s_net_x6,
    y => addsub1_s_net_x5,
    z => addsub2_s_net_x6,
    clk_1 => clk_net,
    ce_1 => ce_net,
    x_x0 => addsub_s_net_x5,
    y_x0 => addsub1_s_net_x4,
    z_x0 => addsub2_s_net_x5
  );
  cordic_pe16 : entity work.complexphasedetector_cordic_pe16 
  port map (
    x => addsub_s_net_x5,
    y => addsub1_s_net_x4,
    z => addsub2_s_net_x5,
    clk_1 => clk_net,
    ce_1 => ce_net,
    x_x0 => addsub_s_net_x4,
    y_x0 => addsub1_s_net_x12,
    z_x0 => addsub2_s_net_x4
  );
  cordic_pe17 : entity work.complexphasedetector_cordic_pe17 
  port map (
    x => addsub_s_net_x4,
    y => addsub1_s_net_x12,
    z => addsub2_s_net_x4,
    clk_1 => clk_net,
    ce_1 => ce_net,
    x_x0 => addsub_s_net_x3,
    y_x0 => addsub1_s_net_x3
  );
  cordic_pe2 : entity work.complexphasedetector_cordic_pe2 
  port map (
    x => addsub_s_net_x10,
    y => addsub1_s_net_x10,
    z => addsub2_s_net_x11,
    clk_1 => clk_net,
    ce_1 => ce_net,
    x_x0 => addsub_s_net_x2,
    y_x0 => addsub1_s_net_x2,
    z_x0 => addsub2_s_net_x2
  );
  cordic_pe3 : entity work.complexphasedetector_cordic_pe3 
  port map (
    x => addsub_s_net_x2,
    y => addsub1_s_net_x2,
    z => addsub2_s_net_x2,
    clk_1 => clk_net,
    ce_1 => ce_net,
    x_x0 => addsub_s_net_x1,
    y_x0 => addsub1_s_net_x1,
    z_x0 => addsub2_s_net_x1
  );
  cordic_pe4 : entity work.complexphasedetector_cordic_pe4 
  port map (
    x => addsub_s_net_x1,
    y => addsub1_s_net_x1,
    z => addsub2_s_net_x1,
    clk_1 => clk_net,
    ce_1 => ce_net,
    x_x0 => addsub_s_net_x0,
    y_x0 => addsub1_s_net_x0,
    z_x0 => addsub2_s_net_x0
  );
  cordic_pe5 : entity work.complexphasedetector_cordic_pe5 
  port map (
    x => addsub_s_net_x0,
    y => addsub1_s_net_x0,
    z => addsub2_s_net_x0,
    clk_1 => clk_net,
    ce_1 => ce_net,
    x_x0 => addsub_s_net,
    y_x0 => addsub1_s_net,
    z_x0 => addsub2_s_net
  );
  cordic_pe6 : entity work.complexphasedetector_cordic_pe6 
  port map (
    x => addsub_s_net,
    y => addsub1_s_net,
    z => addsub2_s_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    x_x0 => addsub_s_net_x14,
    y_x0 => addsub1_s_net_x15,
    z_x0 => addsub2_s_net_x15
  );
  cordic_pe7 : entity work.complexphasedetector_cordic_pe7 
  port map (
    x => addsub_s_net_x14,
    y => addsub1_s_net_x15,
    z => addsub2_s_net_x15,
    clk_1 => clk_net,
    ce_1 => ce_net,
    x_x0 => addsub_s_net_x13,
    y_x0 => addsub1_s_net_x14,
    z_x0 => addsub2_s_net_x14
  );
  cordic_pe8 : entity work.complexphasedetector_cordic_pe8 
  port map (
    x => addsub_s_net_x13,
    y => addsub1_s_net_x14,
    z => addsub2_s_net_x14,
    clk_1 => clk_net,
    ce_1 => ce_net,
    x_x0 => addsub_s_net_x12,
    y_x0 => addsub1_s_net_x13,
    z_x0 => addsub2_s_net_x13
  );
  cordic_pe9 : entity work.complexphasedetector_cordic_pe9 
  port map (
    x => addsub_s_net_x12,
    y => addsub1_s_net_x13,
    z => addsub2_s_net_x13,
    clk_1 => clk_net,
    ce_1 => ce_net,
    x_x0 => addsub_s_net_x11,
    y_x0 => addsub1_s_net_x11,
    z_x0 => addsub2_s_net_x12
  );
end structural;
-- Generated from Simulink block ComplexPhaseDetector/Bipolar NCO/CORDIC SINCOS/Quadrant Correct
library IEEE;
use IEEE.std_logic_1164.all;
library work;
use work.conv_pkg.all;
entity complexphasedetector_quadrant_correct is
  port (
    cos : in std_logic_vector( 21-1 downto 0 );
    sin : in std_logic_vector( 21-1 downto 0 );
    angle_map : in std_logic_vector( 1-1 downto 0 );
    sgn_z : in std_logic_vector( 1-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    cosine : out std_logic_vector( 21-1 downto 0 );
    sine : out std_logic_vector( 21-1 downto 0 )
  );
end complexphasedetector_quadrant_correct;
architecture structural of complexphasedetector_quadrant_correct is 
  signal negate2_op_net : std_logic_vector( 21-1 downto 0 );
  signal mux_y_net : std_logic_vector( 21-1 downto 0 );
  signal mux2_y_net : std_logic_vector( 21-1 downto 0 );
  signal addsub1_s_net : std_logic_vector( 21-1 downto 0 );
  signal negate1_op_net : std_logic_vector( 21-1 downto 0 );
  signal delay4_q_net : std_logic_vector( 1-1 downto 0 );
  signal delay1_q_net : std_logic_vector( 1-1 downto 0 );
  signal ce_net : std_logic;
  signal addsub_s_net : std_logic_vector( 21-1 downto 0 );
  signal mux3_y_net : std_logic_vector( 21-1 downto 0 );
  signal mux1_y_net : std_logic_vector( 21-1 downto 0 );
  signal clk_net : std_logic;
begin
  cosine <= mux_y_net;
  sine <= mux1_y_net;
  addsub_s_net <= cos;
  addsub1_s_net <= sin;
  delay4_q_net <= angle_map;
  delay1_q_net <= sgn_z;
  clk_net <= clk_1;
  ce_net <= ce_1;
  mux : entity work.sysgen_mux_42cfb5c50e 
  port map (
    clr => '0',
    sel => delay4_q_net,
    d0 => addsub_s_net,
    d1 => mux3_y_net,
    clk => clk_net,
    ce => ce_net,
    y => mux_y_net
  );
  mux1 : entity work.sysgen_mux_42cfb5c50e 
  port map (
    clr => '0',
    sel => delay4_q_net,
    d0 => addsub1_s_net,
    d1 => mux2_y_net,
    clk => clk_net,
    ce => ce_net,
    y => mux1_y_net
  );
  mux2 : entity work.sysgen_mux_d2f180e836 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    sel => delay1_q_net,
    d0 => addsub_s_net,
    d1 => negate1_op_net,
    y => mux2_y_net
  );
  mux3 : entity work.sysgen_mux_d2f180e836 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    sel => delay1_q_net,
    d0 => negate2_op_net,
    d1 => addsub1_s_net,
    y => mux3_y_net
  );
  negate1 : entity work.sysgen_negate_d16663c75d 
  port map (
    clr => '0',
    ip => addsub_s_net,
    clk => clk_net,
    ce => ce_net,
    op => negate1_op_net
  );
  negate2 : entity work.sysgen_negate_d16663c75d 
  port map (
    clr => '0',
    ip => addsub1_s_net,
    clk => clk_net,
    ce => ce_net,
    op => negate2_op_net
  );
end structural;
-- Generated from Simulink block ComplexPhaseDetector/Bipolar NCO/CORDIC SINCOS/Quadrant Map
library IEEE;
use IEEE.std_logic_1164.all;
library work;
use work.conv_pkg.all;
entity complexphasedetector_quadrant_map is
  port (
    z : in std_logic_vector( 21-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    z_x0 : out std_logic_vector( 21-1 downto 0 );
    angle_map : out std_logic_vector( 1-1 downto 0 );
    sgn_z_x0 : out std_logic_vector( 1-1 downto 0 )
  );
end complexphasedetector_quadrant_map;
architecture structural of complexphasedetector_quadrant_map is 
  signal constant2_op_net : std_logic_vector( 21-1 downto 0 );
  signal ce_net : std_logic;
  signal delay1_q_net : std_logic_vector( 21-1 downto 0 );
  signal mux_y_net : std_logic_vector( 21-1 downto 0 );
  signal addsub_s_net : std_logic_vector( 21-1 downto 0 );
  signal clk_net : std_logic;
  signal sgn_z_y_net : std_logic_vector( 1-1 downto 0 );
  signal relational_op_net : std_logic_vector( 1-1 downto 0 );
  signal inverter_op_net : std_logic_vector( 1-1 downto 0 );
  signal constant1_op_net : std_logic_vector( 21-1 downto 0 );
  signal mult_p_net : std_logic_vector( 21-1 downto 0 );
  signal relational1_op_net : std_logic_vector( 1-1 downto 0 );
  signal logical_y_net : std_logic_vector( 1-1 downto 0 );
begin
  z_x0 <= mux_y_net;
  angle_map <= logical_y_net;
  sgn_z_x0 <= sgn_z_y_net;
  mult_p_net <= z;
  clk_net <= clk_1;
  ce_net <= ce_1;
  addsub : entity work.sysgen_addsub_0378e36815 
  port map (
    clr => '0',
    a => mult_p_net,
    b => constant1_op_net,
    mode => inverter_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub_s_net
  );
  constant1 : entity work.sysgen_constant_2ae9178cd3 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant1_op_net
  );
  constant2 : entity work.sysgen_constant_7a9565940c 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant2_op_net
  );
  delay1 : entity work.complexphasedetector_xldelay 
  generic map (
    latency => 1,
    reg_retiming => 0,
    reset => 0,
    width => 21
  )
  port map (
    en => '1',
    rst => '1',
    d => mult_p_net,
    clk => clk_net,
    ce => ce_net,
    q => delay1_q_net
  );
  inverter : entity work.sysgen_inverter_3e6e50377b 
  port map (
    clr => '0',
    ip => sgn_z_y_net,
    clk => clk_net,
    ce => ce_net,
    op => inverter_op_net
  );
  logical : entity work.sysgen_logical_9c16704737 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    d0 => relational_op_net,
    d1 => relational1_op_net,
    y => logical_y_net
  );
  mux : entity work.sysgen_mux_42cfb5c50e 
  port map (
    clr => '0',
    sel => logical_y_net,
    d0 => delay1_q_net,
    d1 => addsub_s_net,
    clk => clk_net,
    ce => ce_net,
    y => mux_y_net
  );
  relational : entity work.sysgen_relational_f5a4e16b9c 
  port map (
    clr => '0',
    a => mult_p_net,
    b => constant1_op_net,
    clk => clk_net,
    ce => ce_net,
    op => relational_op_net
  );
  relational1 : entity work.sysgen_relational_fff28d165f 
  port map (
    clr => '0',
    a => mult_p_net,
    b => constant2_op_net,
    clk => clk_net,
    ce => ce_net,
    op => relational1_op_net
  );
  sgn_z : entity work.complexphasedetector_xlslice 
  generic map (
    new_lsb => 20,
    new_msb => 20,
    x_width => 21,
    y_width => 1
  )
  port map (
    x => mult_p_net,
    y => sgn_z_y_net
  );
end structural;
-- Generated from Simulink block ComplexPhaseDetector/Bipolar NCO/CORDIC SINCOS
library IEEE;
use IEEE.std_logic_1164.all;
library work;
use work.conv_pkg.all;
entity complexphasedetector_cordic_sincos is
  port (
    z : in std_logic_vector( 21-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    cos : out std_logic_vector( 18-1 downto 0 );
    sin : out std_logic_vector( 18-1 downto 0 )
  );
end complexphasedetector_cordic_sincos;
architecture structural of complexphasedetector_cordic_sincos is 
  signal mux_y_net : std_logic_vector( 21-1 downto 0 );
  signal delay4_q_net : std_logic_vector( 1-1 downto 0 );
  signal clk_net : std_logic;
  signal sgn_z_y_net : std_logic_vector( 1-1 downto 0 );
  signal mux_y_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal mux1_y_net : std_logic_vector( 21-1 downto 0 );
  signal convert1_dout_net : std_logic_vector( 18-1 downto 0 );
  signal logical_y_net : std_logic_vector( 1-1 downto 0 );
  signal delay1_q_net : std_logic_vector( 1-1 downto 0 );
  signal addsub_s_net : std_logic_vector( 21-1 downto 0 );
  signal constant1_op_net : std_logic_vector( 21-1 downto 0 );
  signal convert_dout_net : std_logic_vector( 18-1 downto 0 );
  signal mult_p_net : std_logic_vector( 21-1 downto 0 );
  signal ce_net : std_logic;
  signal addsub1_s_net : std_logic_vector( 21-1 downto 0 );
  signal constant_op_net : std_logic_vector( 21-1 downto 0 );
begin
  cos <= convert_dout_net;
  sin <= convert1_dout_net;
  mult_p_net <= z;
  clk_net <= clk_1;
  ce_net <= ce_1;
  cordic_fine_angle_pe : entity work.complexphasedetector_cordic_fine_angle_pe 
  port map (
    x_x0 => constant_op_net,
    y => constant1_op_net,
    z => mux_y_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    x => addsub_s_net,
    y_x0 => addsub1_s_net
  );
  quadrant_correct_x0 : entity work.complexphasedetector_quadrant_correct 
  port map (
    cos => addsub_s_net,
    sin => addsub1_s_net,
    angle_map => delay4_q_net,
    sgn_z => delay1_q_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    cosine => mux_y_net_x0,
    sine => mux1_y_net
  );
  quadrant_map : entity work.complexphasedetector_quadrant_map 
  port map (
    z => mult_p_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    z_x0 => mux_y_net,
    angle_map => logical_y_net,
    sgn_z_x0 => sgn_z_y_net
  );
  constant_x0 : entity work.sysgen_constant_cc1eba938a 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  constant1 : entity work.sysgen_constant_c4012fe466 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant1_op_net
  );
  convert : entity work.complexphasedetector_xlconvert 
  generic map (
    bool_conversion => 0,
    din_arith => 2,
    din_bin_pt => 17,
    din_width => 21,
    dout_arith => 2,
    dout_bin_pt => 17,
    dout_width => 18,
    latency => 1,
    overflow => xlSaturate,
    quantization => xlTruncate
  )
  port map (
    clr => '0',
    en => "1",
    din => mux_y_net_x0,
    clk => clk_net,
    ce => ce_net,
    dout => convert_dout_net
  );
  convert1 : entity work.complexphasedetector_xlconvert 
  generic map (
    bool_conversion => 0,
    din_arith => 2,
    din_bin_pt => 17,
    din_width => 21,
    dout_arith => 2,
    dout_bin_pt => 17,
    dout_width => 18,
    latency => 1,
    overflow => xlSaturate,
    quantization => xlTruncate
  )
  port map (
    clr => '0',
    en => "1",
    din => mux1_y_net,
    clk => clk_net,
    ce => ce_net,
    dout => convert1_dout_net
  );
  delay1 : entity work.complexphasedetector_xldelay 
  generic map (
    latency => 19,
    reg_retiming => 0,
    reset => 0,
    width => 1
  )
  port map (
    en => '1',
    rst => '1',
    d => sgn_z_y_net,
    clk => clk_net,
    ce => ce_net,
    q => delay1_q_net
  );
  delay4 : entity work.complexphasedetector_xldelay 
  generic map (
    latency => 18,
    reg_retiming => 0,
    reset => 0,
    width => 1
  )
  port map (
    en => '1',
    rst => '1',
    d => logical_y_net,
    clk => clk_net,
    ce => ce_net,
    q => delay4_q_net
  );
end structural;
-- Generated from Simulink block ComplexPhaseDetector/Bipolar NCO/Negater1
library IEEE;
use IEEE.std_logic_1164.all;
library work;
use work.conv_pkg.all;
entity complexphasedetector_negater1 is
  port (
    neg : in std_logic_vector( 1-1 downto 0 );
    in_x0 : in std_logic_vector( 18-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    out_x0 : out std_logic_vector( 18-1 downto 0 )
  );
end complexphasedetector_negater1;
architecture structural of complexphasedetector_negater1 is 
  signal ce_net : std_logic;
  signal convert1_dout_net : std_logic_vector( 18-1 downto 0 );
  signal clk_net : std_logic;
  signal inverter4_op_net : std_logic_vector( 1-1 downto 0 );
  signal mux11_y_net : std_logic_vector( 18-1 downto 0 );
  signal negate1_op_net : std_logic_vector( 18-1 downto 0 );
begin
  out_x0 <= mux11_y_net;
  inverter4_op_net <= neg;
  convert1_dout_net <= in_x0;
  clk_net <= clk_1;
  ce_net <= ce_1;
  mux11 : entity work.sysgen_mux_5aae7736b5 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    sel => inverter4_op_net,
    d0 => convert1_dout_net,
    d1 => negate1_op_net,
    y => mux11_y_net
  );
  negate1 : entity work.sysgen_negate_bbc2a275af 
  port map (
    clr => '0',
    ip => convert1_dout_net,
    clk => clk_net,
    ce => ce_net,
    op => negate1_op_net
  );
end structural;
-- Generated from Simulink block ComplexPhaseDetector/Bipolar NCO
library IEEE;
use IEEE.std_logic_1164.all;
library work;
use work.conv_pkg.all;
entity complexphasedetector_bipolar_nco is
  port (
    rst : in std_logic_vector( 1-1 downto 0 );
    inc : in std_logic_vector( 22-1 downto 0 );
    conj : in std_logic_vector( 1-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    sin : out std_logic_vector( 18-1 downto 0 );
    cos : out std_logic_vector( 18-1 downto 0 )
  );
end complexphasedetector_bipolar_nco;
architecture structural of complexphasedetector_bipolar_nco is 
  signal convert_dout_net : std_logic_vector( 18-1 downto 0 );
  signal inverter4_op_net : std_logic_vector( 1-1 downto 0 );
  signal mult_p_net : std_logic_vector( 21-1 downto 0 );
  signal mux11_y_net : std_logic_vector( 18-1 downto 0 );
  signal ce_net : std_logic;
  signal reset_net : std_logic_vector( 1-1 downto 0 );
  signal clk_net : std_logic;
  signal convert1_dout_net : std_logic_vector( 18-1 downto 0 );
  signal accumulator_q_net : std_logic_vector( 22-1 downto 0 );
  signal constant_op_net : std_logic_vector( 18-1 downto 0 );
  signal negate1_op_net : std_logic_vector( 22-1 downto 0 );
  signal slice_y_net : std_logic_vector( 18-1 downto 0 );
  signal reinterpret1_output_port_net : std_logic_vector( 18-1 downto 0 );
begin
  sin <= mux11_y_net;
  cos <= convert_dout_net;
  reset_net <= rst;
  negate1_op_net <= inc;
  inverter4_op_net <= conj;
  clk_net <= clk_1;
  ce_net <= ce_1;
  cordic_sincos : entity work.complexphasedetector_cordic_sincos 
  port map (
    z => mult_p_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    cos => convert_dout_net,
    sin => convert1_dout_net
  );
  negater1 : entity work.complexphasedetector_negater1 
  port map (
    neg => inverter4_op_net,
    in_x0 => convert1_dout_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    out_x0 => mux11_y_net
  );
  accumulator : entity work.sysgen_accum_2f6ef0156d 
  port map (
    clr => '0',
    b => negate1_op_net,
    rst => reset_net,
    clk => clk_net,
    ce => ce_net,
    q => accumulator_q_net
  );
  constant_x0 : entity work.sysgen_constant_ec072ad58b 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  mult : entity work.complexphasedetector_xlmult 
  generic map (
    a_arith => xlSigned,
    a_bin_pt => 17,
    a_width => 18,
    b_arith => xlSigned,
    b_bin_pt => 14,
    b_width => 18,
    c_a_type => 0,
    c_a_width => 18,
    c_b_type => 0,
    c_b_width => 18,
    c_baat => 18,
    c_output_width => 36,
    c_type => 0,
    core_name0 => "complexphasedetector_mult_gen_v12_0_i3",
    extra_registers => 1,
    multsign => 2,
    overflow => 2,
    p_arith => xlSigned,
    p_bin_pt => 17,
    p_width => 21,
    quantization => 1
  )
  port map (
    clr => '0',
    core_clr => '1',
    en => "1",
    rst => "0",
    a => reinterpret1_output_port_net,
    b => constant_op_net,
    clk => clk_net,
    ce => ce_net,
    core_clk => clk_net,
    core_ce => ce_net,
    p => mult_p_net
  );
  reinterpret1 : entity work.sysgen_reinterpret_d292af600c 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => slice_y_net,
    output_port => reinterpret1_output_port_net
  );
  slice : entity work.complexphasedetector_xlslice 
  generic map (
    new_lsb => 4,
    new_msb => 21,
    x_width => 22,
    y_width => 18
  )
  port map (
    x => accumulator_q_net,
    y => slice_y_net
  );
end structural;
-- Generated from Simulink block ComplexPhaseDetector/CORDIC ATAN/CORDIC Fine Angle PE/CORDIC PE1
library IEEE;
use IEEE.std_logic_1164.all;
library work;
use work.conv_pkg.all;
entity complexphasedetector_cordic_pe1_x0 is
  port (
    x : in std_logic_vector( 18-1 downto 0 );
    y : in std_logic_vector( 18-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    x_x0 : out std_logic_vector( 18-1 downto 0 );
    y_x0 : out std_logic_vector( 18-1 downto 0 )
  );
end complexphasedetector_cordic_pe1_x0;
architecture structural of complexphasedetector_cordic_pe1_x0 is 
  signal mux_y_net : std_logic_vector( 18-1 downto 0 );
  signal ce_net : std_logic;
  signal clk_net : std_logic;
  signal addsub_s_net : std_logic_vector( 18-1 downto 0 );
  signal delay3_q_net : std_logic_vector( 18-1 downto 0 );
  signal shift1_op_net : std_logic_vector( 18-1 downto 0 );
  signal slice_y_net : std_logic_vector( 1-1 downto 0 );
  signal shift_op_net : std_logic_vector( 18-1 downto 0 );
  signal inverter_op_net : std_logic_vector( 1-1 downto 0 );
  signal addsub1_s_net : std_logic_vector( 18-1 downto 0 );
begin
  x_x0 <= addsub_s_net;
  y_x0 <= addsub1_s_net;
  mux_y_net <= x;
  delay3_q_net <= y;
  clk_net <= clk_1;
  ce_net <= ce_1;
  addsub : entity work.sysgen_addsub_9fd9abb21c 
  port map (
    clr => '0',
    a => mux_y_net,
    b => shift1_op_net,
    mode => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub_s_net
  );
  addsub1 : entity work.sysgen_addsub_9fd9abb21c 
  port map (
    clr => '0',
    a => delay3_q_net,
    b => shift_op_net,
    mode => inverter_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub1_s_net
  );
  inverter : entity work.sysgen_inverter_3e6e50377b 
  port map (
    clr => '0',
    ip => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    op => inverter_op_net
  );
  shift : entity work.sysgen_shift_cd4c86d9cc 
  port map (
    clr => '0',
    ip => mux_y_net,
    clk => clk_net,
    ce => ce_net,
    op => shift_op_net
  );
  shift1 : entity work.sysgen_shift_cd4c86d9cc 
  port map (
    clr => '0',
    ip => delay3_q_net,
    clk => clk_net,
    ce => ce_net,
    op => shift1_op_net
  );
  slice : entity work.complexphasedetector_xlslice 
  generic map (
    new_lsb => 17,
    new_msb => 17,
    x_width => 18,
    y_width => 1
  )
  port map (
    x => delay3_q_net,
    y => slice_y_net
  );
end structural;
-- Generated from Simulink block ComplexPhaseDetector/CORDIC ATAN/CORDIC Fine Angle PE/CORDIC PE2
library IEEE;
use IEEE.std_logic_1164.all;
library work;
use work.conv_pkg.all;
entity complexphasedetector_cordic_pe2_x0 is
  port (
    x : in std_logic_vector( 18-1 downto 0 );
    y : in std_logic_vector( 18-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    x_x0 : out std_logic_vector( 18-1 downto 0 );
    y_x0 : out std_logic_vector( 18-1 downto 0 )
  );
end complexphasedetector_cordic_pe2_x0;
architecture structural of complexphasedetector_cordic_pe2_x0 is 
  signal clk_net : std_logic;
  signal addsub_s_net_x0 : std_logic_vector( 18-1 downto 0 );
  signal addsub_s_net : std_logic_vector( 18-1 downto 0 );
  signal shift1_op_net : std_logic_vector( 18-1 downto 0 );
  signal shift_op_net : std_logic_vector( 18-1 downto 0 );
  signal inverter_op_net : std_logic_vector( 1-1 downto 0 );
  signal addsub1_s_net_x0 : std_logic_vector( 18-1 downto 0 );
  signal ce_net : std_logic;
  signal addsub1_s_net : std_logic_vector( 18-1 downto 0 );
  signal slice_y_net : std_logic_vector( 1-1 downto 0 );
begin
  x_x0 <= addsub_s_net;
  y_x0 <= addsub1_s_net;
  addsub_s_net_x0 <= x;
  addsub1_s_net_x0 <= y;
  clk_net <= clk_1;
  ce_net <= ce_1;
  addsub : entity work.sysgen_addsub_9fd9abb21c 
  port map (
    clr => '0',
    a => addsub_s_net_x0,
    b => shift1_op_net,
    mode => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub_s_net
  );
  addsub1 : entity work.sysgen_addsub_9fd9abb21c 
  port map (
    clr => '0',
    a => addsub1_s_net_x0,
    b => shift_op_net,
    mode => inverter_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub1_s_net
  );
  inverter : entity work.sysgen_inverter_3e6e50377b 
  port map (
    clr => '0',
    ip => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    op => inverter_op_net
  );
  shift : entity work.sysgen_shift_471f174abe 
  port map (
    clr => '0',
    ip => addsub_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift_op_net
  );
  shift1 : entity work.sysgen_shift_471f174abe 
  port map (
    clr => '0',
    ip => addsub1_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift1_op_net
  );
  slice : entity work.complexphasedetector_xlslice 
  generic map (
    new_lsb => 17,
    new_msb => 17,
    x_width => 18,
    y_width => 1
  )
  port map (
    x => addsub1_s_net_x0,
    y => slice_y_net
  );
end structural;
-- Generated from Simulink block ComplexPhaseDetector/CORDIC ATAN/CORDIC Fine Angle PE/CORDIC PE3
library IEEE;
use IEEE.std_logic_1164.all;
library work;
use work.conv_pkg.all;
entity complexphasedetector_cordic_pe3_x0 is
  port (
    x : in std_logic_vector( 18-1 downto 0 );
    y : in std_logic_vector( 18-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    x_x0 : out std_logic_vector( 18-1 downto 0 );
    y_x0 : out std_logic_vector( 18-1 downto 0 )
  );
end complexphasedetector_cordic_pe3_x0;
architecture structural of complexphasedetector_cordic_pe3_x0 is 
  signal addsub1_s_net_x0 : std_logic_vector( 18-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal addsub_s_net : std_logic_vector( 18-1 downto 0 );
  signal addsub_s_net_x0 : std_logic_vector( 18-1 downto 0 );
  signal addsub1_s_net : std_logic_vector( 18-1 downto 0 );
  signal shift1_op_net : std_logic_vector( 18-1 downto 0 );
  signal inverter_op_net : std_logic_vector( 1-1 downto 0 );
  signal shift_op_net : std_logic_vector( 18-1 downto 0 );
  signal slice_y_net : std_logic_vector( 1-1 downto 0 );
begin
  x_x0 <= addsub_s_net;
  y_x0 <= addsub1_s_net;
  addsub_s_net_x0 <= x;
  addsub1_s_net_x0 <= y;
  clk_net <= clk_1;
  ce_net <= ce_1;
  addsub : entity work.sysgen_addsub_9fd9abb21c 
  port map (
    clr => '0',
    a => addsub_s_net_x0,
    b => shift1_op_net,
    mode => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub_s_net
  );
  addsub1 : entity work.sysgen_addsub_9fd9abb21c 
  port map (
    clr => '0',
    a => addsub1_s_net_x0,
    b => shift_op_net,
    mode => inverter_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub1_s_net
  );
  inverter : entity work.sysgen_inverter_3e6e50377b 
  port map (
    clr => '0',
    ip => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    op => inverter_op_net
  );
  shift : entity work.sysgen_shift_56ce648379 
  port map (
    clr => '0',
    ip => addsub_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift_op_net
  );
  shift1 : entity work.sysgen_shift_56ce648379 
  port map (
    clr => '0',
    ip => addsub1_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift1_op_net
  );
  slice : entity work.complexphasedetector_xlslice 
  generic map (
    new_lsb => 17,
    new_msb => 17,
    x_width => 18,
    y_width => 1
  )
  port map (
    x => addsub1_s_net_x0,
    y => slice_y_net
  );
end structural;
-- Generated from Simulink block ComplexPhaseDetector/CORDIC ATAN/CORDIC Fine Angle PE/CORDIC PE4
library IEEE;
use IEEE.std_logic_1164.all;
library work;
use work.conv_pkg.all;
entity complexphasedetector_cordic_pe4_x0 is
  port (
    x : in std_logic_vector( 18-1 downto 0 );
    y : in std_logic_vector( 18-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    x_x0 : out std_logic_vector( 18-1 downto 0 );
    y_x0 : out std_logic_vector( 18-1 downto 0 )
  );
end complexphasedetector_cordic_pe4_x0;
architecture structural of complexphasedetector_cordic_pe4_x0 is 
  signal clk_net : std_logic;
  signal addsub_s_net : std_logic_vector( 18-1 downto 0 );
  signal addsub1_s_net : std_logic_vector( 18-1 downto 0 );
  signal ce_net : std_logic;
  signal addsub_s_net_x0 : std_logic_vector( 18-1 downto 0 );
  signal shift1_op_net : std_logic_vector( 18-1 downto 0 );
  signal addsub1_s_net_x0 : std_logic_vector( 18-1 downto 0 );
  signal slice_y_net : std_logic_vector( 1-1 downto 0 );
  signal shift_op_net : std_logic_vector( 18-1 downto 0 );
  signal inverter_op_net : std_logic_vector( 1-1 downto 0 );
begin
  x_x0 <= addsub_s_net;
  y_x0 <= addsub1_s_net;
  addsub_s_net_x0 <= x;
  addsub1_s_net_x0 <= y;
  clk_net <= clk_1;
  ce_net <= ce_1;
  addsub : entity work.sysgen_addsub_9fd9abb21c 
  port map (
    clr => '0',
    a => addsub_s_net_x0,
    b => shift1_op_net,
    mode => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub_s_net
  );
  addsub1 : entity work.sysgen_addsub_9fd9abb21c 
  port map (
    clr => '0',
    a => addsub1_s_net_x0,
    b => shift_op_net,
    mode => inverter_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub1_s_net
  );
  inverter : entity work.sysgen_inverter_3e6e50377b 
  port map (
    clr => '0',
    ip => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    op => inverter_op_net
  );
  shift : entity work.sysgen_shift_6fcf072ee0 
  port map (
    clr => '0',
    ip => addsub_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift_op_net
  );
  shift1 : entity work.sysgen_shift_6fcf072ee0 
  port map (
    clr => '0',
    ip => addsub1_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift1_op_net
  );
  slice : entity work.complexphasedetector_xlslice 
  generic map (
    new_lsb => 17,
    new_msb => 17,
    x_width => 18,
    y_width => 1
  )
  port map (
    x => addsub1_s_net_x0,
    y => slice_y_net
  );
end structural;
-- Generated from Simulink block ComplexPhaseDetector/CORDIC ATAN/CORDIC Fine Angle PE/CORDIC PE5
library IEEE;
use IEEE.std_logic_1164.all;
library work;
use work.conv_pkg.all;
entity complexphasedetector_cordic_pe5_x0 is
  port (
    x : in std_logic_vector( 18-1 downto 0 );
    y : in std_logic_vector( 18-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    x_x0 : out std_logic_vector( 18-1 downto 0 );
    y_x0 : out std_logic_vector( 18-1 downto 0 )
  );
end complexphasedetector_cordic_pe5_x0;
architecture structural of complexphasedetector_cordic_pe5_x0 is 
  signal addsub1_s_net_x0 : std_logic_vector( 18-1 downto 0 );
  signal ce_net : std_logic;
  signal shift1_op_net : std_logic_vector( 18-1 downto 0 );
  signal shift_op_net : std_logic_vector( 18-1 downto 0 );
  signal addsub1_s_net : std_logic_vector( 18-1 downto 0 );
  signal addsub_s_net_x0 : std_logic_vector( 18-1 downto 0 );
  signal clk_net : std_logic;
  signal inverter_op_net : std_logic_vector( 1-1 downto 0 );
  signal slice_y_net : std_logic_vector( 1-1 downto 0 );
  signal addsub_s_net : std_logic_vector( 18-1 downto 0 );
begin
  x_x0 <= addsub_s_net;
  y_x0 <= addsub1_s_net;
  addsub_s_net_x0 <= x;
  addsub1_s_net_x0 <= y;
  clk_net <= clk_1;
  ce_net <= ce_1;
  addsub : entity work.sysgen_addsub_9fd9abb21c 
  port map (
    clr => '0',
    a => addsub_s_net_x0,
    b => shift1_op_net,
    mode => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub_s_net
  );
  addsub1 : entity work.sysgen_addsub_9fd9abb21c 
  port map (
    clr => '0',
    a => addsub1_s_net_x0,
    b => shift_op_net,
    mode => inverter_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub1_s_net
  );
  inverter : entity work.sysgen_inverter_3e6e50377b 
  port map (
    clr => '0',
    ip => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    op => inverter_op_net
  );
  shift : entity work.sysgen_shift_91fca512e7 
  port map (
    clr => '0',
    ip => addsub_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift_op_net
  );
  shift1 : entity work.sysgen_shift_91fca512e7 
  port map (
    clr => '0',
    ip => addsub1_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift1_op_net
  );
  slice : entity work.complexphasedetector_xlslice 
  generic map (
    new_lsb => 17,
    new_msb => 17,
    x_width => 18,
    y_width => 1
  )
  port map (
    x => addsub1_s_net_x0,
    y => slice_y_net
  );
end structural;
-- Generated from Simulink block ComplexPhaseDetector/CORDIC ATAN/CORDIC Fine Angle PE/CORDIC PE6
library IEEE;
use IEEE.std_logic_1164.all;
library work;
use work.conv_pkg.all;
entity complexphasedetector_cordic_pe6_x0 is
  port (
    x : in std_logic_vector( 18-1 downto 0 );
    y : in std_logic_vector( 18-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    x_x0 : out std_logic_vector( 18-1 downto 0 );
    y_x0 : out std_logic_vector( 18-1 downto 0 )
  );
end complexphasedetector_cordic_pe6_x0;
architecture structural of complexphasedetector_cordic_pe6_x0 is 
  signal clk_net : std_logic;
  signal inverter_op_net : std_logic_vector( 1-1 downto 0 );
  signal addsub_s_net : std_logic_vector( 18-1 downto 0 );
  signal ce_net : std_logic;
  signal addsub_s_net_x0 : std_logic_vector( 18-1 downto 0 );
  signal shift1_op_net : std_logic_vector( 18-1 downto 0 );
  signal addsub1_s_net_x0 : std_logic_vector( 18-1 downto 0 );
  signal slice_y_net : std_logic_vector( 1-1 downto 0 );
  signal shift_op_net : std_logic_vector( 18-1 downto 0 );
  signal addsub1_s_net : std_logic_vector( 18-1 downto 0 );
begin
  x_x0 <= addsub_s_net;
  y_x0 <= addsub1_s_net;
  addsub_s_net_x0 <= x;
  addsub1_s_net_x0 <= y;
  clk_net <= clk_1;
  ce_net <= ce_1;
  addsub : entity work.sysgen_addsub_9fd9abb21c 
  port map (
    clr => '0',
    a => addsub_s_net_x0,
    b => shift1_op_net,
    mode => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub_s_net
  );
  addsub1 : entity work.sysgen_addsub_9fd9abb21c 
  port map (
    clr => '0',
    a => addsub1_s_net_x0,
    b => shift_op_net,
    mode => inverter_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub1_s_net
  );
  inverter : entity work.sysgen_inverter_3e6e50377b 
  port map (
    clr => '0',
    ip => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    op => inverter_op_net
  );
  shift : entity work.sysgen_shift_e6b15487b9 
  port map (
    clr => '0',
    ip => addsub_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift_op_net
  );
  shift1 : entity work.sysgen_shift_e6b15487b9 
  port map (
    clr => '0',
    ip => addsub1_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift1_op_net
  );
  slice : entity work.complexphasedetector_xlslice 
  generic map (
    new_lsb => 17,
    new_msb => 17,
    x_width => 18,
    y_width => 1
  )
  port map (
    x => addsub1_s_net_x0,
    y => slice_y_net
  );
end structural;
-- Generated from Simulink block ComplexPhaseDetector/CORDIC ATAN/CORDIC Fine Angle PE/CORDIC PE7
library IEEE;
use IEEE.std_logic_1164.all;
library work;
use work.conv_pkg.all;
entity complexphasedetector_cordic_pe7_x0 is
  port (
    x : in std_logic_vector( 18-1 downto 0 );
    y : in std_logic_vector( 18-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    x_x0 : out std_logic_vector( 18-1 downto 0 );
    y_x0 : out std_logic_vector( 18-1 downto 0 )
  );
end complexphasedetector_cordic_pe7_x0;
architecture structural of complexphasedetector_cordic_pe7_x0 is 
  signal addsub1_s_net : std_logic_vector( 18-1 downto 0 );
  signal addsub_s_net : std_logic_vector( 18-1 downto 0 );
  signal addsub_s_net_x0 : std_logic_vector( 18-1 downto 0 );
  signal addsub1_s_net_x0 : std_logic_vector( 18-1 downto 0 );
  signal ce_net : std_logic;
  signal clk_net : std_logic;
  signal shift_op_net : std_logic_vector( 18-1 downto 0 );
  signal inverter_op_net : std_logic_vector( 1-1 downto 0 );
  signal shift1_op_net : std_logic_vector( 18-1 downto 0 );
  signal slice_y_net : std_logic_vector( 1-1 downto 0 );
begin
  x_x0 <= addsub_s_net;
  y_x0 <= addsub1_s_net;
  addsub_s_net_x0 <= x;
  addsub1_s_net_x0 <= y;
  clk_net <= clk_1;
  ce_net <= ce_1;
  addsub : entity work.sysgen_addsub_9fd9abb21c 
  port map (
    clr => '0',
    a => addsub_s_net_x0,
    b => shift1_op_net,
    mode => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub_s_net
  );
  addsub1 : entity work.sysgen_addsub_9fd9abb21c 
  port map (
    clr => '0',
    a => addsub1_s_net_x0,
    b => shift_op_net,
    mode => inverter_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub1_s_net
  );
  inverter : entity work.sysgen_inverter_3e6e50377b 
  port map (
    clr => '0',
    ip => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    op => inverter_op_net
  );
  shift : entity work.sysgen_shift_fbdf58547d 
  port map (
    clr => '0',
    ip => addsub_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift_op_net
  );
  shift1 : entity work.sysgen_shift_fbdf58547d 
  port map (
    clr => '0',
    ip => addsub1_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift1_op_net
  );
  slice : entity work.complexphasedetector_xlslice 
  generic map (
    new_lsb => 17,
    new_msb => 17,
    x_width => 18,
    y_width => 1
  )
  port map (
    x => addsub1_s_net_x0,
    y => slice_y_net
  );
end structural;
-- Generated from Simulink block ComplexPhaseDetector/CORDIC ATAN/CORDIC Fine Angle PE/CORDIC PE8
library IEEE;
use IEEE.std_logic_1164.all;
library work;
use work.conv_pkg.all;
entity complexphasedetector_cordic_pe8_x0 is
  port (
    x : in std_logic_vector( 18-1 downto 0 );
    y : in std_logic_vector( 18-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    x_x0 : out std_logic_vector( 18-1 downto 0 )
  );
end complexphasedetector_cordic_pe8_x0;
architecture structural of complexphasedetector_cordic_pe8_x0 is 
  signal slice_y_net : std_logic_vector( 1-1 downto 0 );
  signal addsub1_s_net_x0 : std_logic_vector( 18-1 downto 0 );
  signal addsub_s_net : std_logic_vector( 18-1 downto 0 );
  signal clk_net : std_logic;
  signal addsub_s_net_x0 : std_logic_vector( 18-1 downto 0 );
  signal ce_net : std_logic;
  signal shift1_op_net : std_logic_vector( 18-1 downto 0 );
begin
  x_x0 <= addsub_s_net;
  addsub_s_net_x0 <= x;
  addsub1_s_net_x0 <= y;
  clk_net <= clk_1;
  ce_net <= ce_1;
  addsub : entity work.sysgen_addsub_9fd9abb21c 
  port map (
    clr => '0',
    a => addsub_s_net_x0,
    b => shift1_op_net,
    mode => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub_s_net
  );
  shift1 : entity work.sysgen_shift_ebd466b3c3 
  port map (
    clr => '0',
    ip => addsub1_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift1_op_net
  );
  slice : entity work.complexphasedetector_xlslice 
  generic map (
    new_lsb => 17,
    new_msb => 17,
    x_width => 18,
    y_width => 1
  )
  port map (
    x => addsub1_s_net_x0,
    y => slice_y_net
  );
end structural;
-- Generated from Simulink block ComplexPhaseDetector/CORDIC ATAN/CORDIC Fine Angle PE
library IEEE;
use IEEE.std_logic_1164.all;
library work;
use work.conv_pkg.all;
entity complexphasedetector_cordic_fine_angle_pe_x0 is
  port (
    x_x0 : in std_logic_vector( 18-1 downto 0 );
    y : in std_logic_vector( 18-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    x : out std_logic_vector( 18-1 downto 0 )
  );
end complexphasedetector_cordic_fine_angle_pe_x0;
architecture structural of complexphasedetector_cordic_fine_angle_pe_x0 is 
  signal addsub1_s_net_x2 : std_logic_vector( 18-1 downto 0 );
  signal addsub_s_net : std_logic_vector( 18-1 downto 0 );
  signal mux_y_net : std_logic_vector( 18-1 downto 0 );
  signal addsub1_s_net_x5 : std_logic_vector( 18-1 downto 0 );
  signal addsub_s_net_x0 : std_logic_vector( 18-1 downto 0 );
  signal addsub_s_net_x4 : std_logic_vector( 18-1 downto 0 );
  signal addsub1_s_net_x0 : std_logic_vector( 18-1 downto 0 );
  signal clk_net : std_logic;
  signal addsub1_s_net_x6 : std_logic_vector( 18-1 downto 0 );
  signal addsub_s_net_x2 : std_logic_vector( 18-1 downto 0 );
  signal addsub1_s_net_x1 : std_logic_vector( 18-1 downto 0 );
  signal delay3_q_net : std_logic_vector( 18-1 downto 0 );
  signal addsub1_s_net_x3 : std_logic_vector( 18-1 downto 0 );
  signal addsub_s_net_x1 : std_logic_vector( 18-1 downto 0 );
  signal addsub_s_net_x5 : std_logic_vector( 18-1 downto 0 );
  signal addsub_s_net_x3 : std_logic_vector( 18-1 downto 0 );
  signal ce_net : std_logic;
  signal addsub1_s_net_x4 : std_logic_vector( 18-1 downto 0 );
  signal addsub_s_net_x6 : std_logic_vector( 18-1 downto 0 );
begin
  x <= addsub_s_net;
  mux_y_net <= x_x0;
  delay3_q_net <= y;
  clk_net <= clk_1;
  ce_net <= ce_1;
  cordic_pe1 : entity work.complexphasedetector_cordic_pe1_x0 
  port map (
    x => mux_y_net,
    y => delay3_q_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    x_x0 => addsub_s_net_x4,
    y_x0 => addsub1_s_net_x3
  );
  cordic_pe2 : entity work.complexphasedetector_cordic_pe2_x0 
  port map (
    x => addsub_s_net_x4,
    y => addsub1_s_net_x3,
    clk_1 => clk_net,
    ce_1 => ce_net,
    x_x0 => addsub_s_net_x3,
    y_x0 => addsub1_s_net_x2
  );
  cordic_pe3 : entity work.complexphasedetector_cordic_pe3_x0 
  port map (
    x => addsub_s_net_x3,
    y => addsub1_s_net_x2,
    clk_1 => clk_net,
    ce_1 => ce_net,
    x_x0 => addsub_s_net_x2,
    y_x0 => addsub1_s_net_x1
  );
  cordic_pe4 : entity work.complexphasedetector_cordic_pe4_x0 
  port map (
    x => addsub_s_net_x2,
    y => addsub1_s_net_x1,
    clk_1 => clk_net,
    ce_1 => ce_net,
    x_x0 => addsub_s_net_x1,
    y_x0 => addsub1_s_net_x0
  );
  cordic_pe5 : entity work.complexphasedetector_cordic_pe5_x0 
  port map (
    x => addsub_s_net_x1,
    y => addsub1_s_net_x0,
    clk_1 => clk_net,
    ce_1 => ce_net,
    x_x0 => addsub_s_net_x0,
    y_x0 => addsub1_s_net_x5
  );
  cordic_pe6 : entity work.complexphasedetector_cordic_pe6_x0 
  port map (
    x => addsub_s_net_x0,
    y => addsub1_s_net_x5,
    clk_1 => clk_net,
    ce_1 => ce_net,
    x_x0 => addsub_s_net_x5,
    y_x0 => addsub1_s_net_x4
  );
  cordic_pe7 : entity work.complexphasedetector_cordic_pe7_x0 
  port map (
    x => addsub_s_net_x5,
    y => addsub1_s_net_x4,
    clk_1 => clk_net,
    ce_1 => ce_net,
    x_x0 => addsub_s_net_x6,
    y_x0 => addsub1_s_net_x6
  );
  cordic_pe8 : entity work.complexphasedetector_cordic_pe8_x0 
  port map (
    x => addsub_s_net_x6,
    y => addsub1_s_net_x6,
    clk_1 => clk_net,
    ce_1 => ce_net,
    x_x0 => addsub_s_net
  );
end structural;
-- Generated from Simulink block ComplexPhaseDetector/CORDIC ATAN/Quadrant Map
library IEEE;
use IEEE.std_logic_1164.all;
library work;
use work.conv_pkg.all;
entity complexphasedetector_quadrant_map_x0 is
  port (
    x : in std_logic_vector( 18-1 downto 0 );
    y : in std_logic_vector( 18-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    x_x0 : out std_logic_vector( 18-1 downto 0 );
    y_x0 : out std_logic_vector( 18-1 downto 0 );
    sign_x : out std_logic_vector( 1-1 downto 0 )
  );
end complexphasedetector_quadrant_map_x0;
architecture structural of complexphasedetector_quadrant_map_x0 is 
  signal sgn_x_y_net : std_logic_vector( 1-1 downto 0 );
  signal delay3_q_net : std_logic_vector( 18-1 downto 0 );
  signal addimags_s_net : std_logic_vector( 18-1 downto 0 );
  signal mux_y_net : std_logic_vector( 18-1 downto 0 );
  signal ce_net : std_logic;
  signal delay4_q_net : std_logic_vector( 18-1 downto 0 );
  signal addreals_s_net : std_logic_vector( 18-1 downto 0 );
  signal clk_net : std_logic;
  signal negate1_op_net : std_logic_vector( 18-1 downto 0 );
begin
  x_x0 <= mux_y_net;
  y_x0 <= delay3_q_net;
  sign_x <= sgn_x_y_net;
  addreals_s_net <= x;
  addimags_s_net <= y;
  clk_net <= clk_1;
  ce_net <= ce_1;
  delay3 : entity work.complexphasedetector_xldelay 
  generic map (
    latency => 2,
    reg_retiming => 0,
    reset => 0,
    width => 18
  )
  port map (
    en => '1',
    rst => '1',
    d => addimags_s_net,
    clk => clk_net,
    ce => ce_net,
    q => delay3_q_net
  );
  delay4 : entity work.complexphasedetector_xldelay 
  generic map (
    latency => 1,
    reg_retiming => 0,
    reset => 0,
    width => 18
  )
  port map (
    en => '1',
    rst => '1',
    d => addreals_s_net,
    clk => clk_net,
    ce => ce_net,
    q => delay4_q_net
  );
  mux : entity work.sysgen_mux_93e16dbfde 
  port map (
    clr => '0',
    sel => sgn_x_y_net,
    d0 => delay4_q_net,
    d1 => negate1_op_net,
    clk => clk_net,
    ce => ce_net,
    y => mux_y_net
  );
  negate1 : entity work.sysgen_negate_2003a196d0 
  port map (
    clr => '0',
    ip => delay4_q_net,
    clk => clk_net,
    ce => ce_net,
    op => negate1_op_net
  );
  sgn_x : entity work.complexphasedetector_xlslice 
  generic map (
    new_lsb => 17,
    new_msb => 17,
    x_width => 18,
    y_width => 1
  )
  port map (
    x => delay4_q_net,
    y => sgn_x_y_net
  );
end structural;
-- Generated from Simulink block ComplexPhaseDetector/CORDIC ATAN
library IEEE;
use IEEE.std_logic_1164.all;
library work;
use work.conv_pkg.all;
entity complexphasedetector_cordic_atan is
  port (
    x : in std_logic_vector( 18-1 downto 0 );
    y : in std_logic_vector( 18-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    x_x0 : out std_logic_vector( 18-1 downto 0 )
  );
end complexphasedetector_cordic_atan;
architecture structural of complexphasedetector_cordic_atan is 
  signal addreals_s_net : std_logic_vector( 18-1 downto 0 );
  signal addimags_s_net : std_logic_vector( 18-1 downto 0 );
  signal ce_net : std_logic;
  signal addsub_s_net : std_logic_vector( 18-1 downto 0 );
  signal sgn_x_y_net : std_logic_vector( 1-1 downto 0 );
  signal clk_net : std_logic;
  signal mux_y_net : std_logic_vector( 18-1 downto 0 );
  signal cordic_pipe_balance2_q_net : std_logic_vector( 18-1 downto 0 );
  signal delay3_q_net : std_logic_vector( 18-1 downto 0 );
begin
  x_x0 <= cordic_pipe_balance2_q_net;
  addreals_s_net <= x;
  addimags_s_net <= y;
  clk_net <= clk_1;
  ce_net <= ce_1;
  cordic_fine_angle_pe : entity work.complexphasedetector_cordic_fine_angle_pe_x0 
  port map (
    x_x0 => mux_y_net,
    y => delay3_q_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    x => addsub_s_net
  );
  quadrant_map : entity work.complexphasedetector_quadrant_map_x0 
  port map (
    x => addreals_s_net,
    y => addimags_s_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    x_x0 => mux_y_net,
    y_x0 => delay3_q_net,
    sign_x => sgn_x_y_net
  );
  cordic_pipe_balance2 : entity work.complexphasedetector_xldelay 
  generic map (
    latency => 1,
    reg_retiming => 0,
    reset => 0,
    width => 18
  )
  port map (
    en => '1',
    rst => '1',
    d => addsub_s_net,
    clk => clk_net,
    ce => ce_net,
    q => cordic_pipe_balance2_q_net
  );
end structural;
-- Generated from Simulink block ComplexPhaseDetector/ChanSwapper
library IEEE;
use IEEE.std_logic_1164.all;
library work;
use work.conv_pkg.all;
entity complexphasedetector_chanswapper is
  port (
    ch1real : in std_logic_vector( 18-1 downto 0 );
    ch1imag : in std_logic_vector( 18-1 downto 0 );
    ch2real : in std_logic_vector( 18-1 downto 0 );
    ch2imag : in std_logic_vector( 18-1 downto 0 );
    ch1sel : in std_logic_vector( 1-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    maxreal : out std_logic_vector( 18-1 downto 0 );
    maximag : out std_logic_vector( 18-1 downto 0 );
    minreal : out std_logic_vector( 18-1 downto 0 );
    minimag : out std_logic_vector( 18-1 downto 0 );
    ch1seldly : out std_logic_vector( 1-1 downto 0 )
  );
end complexphasedetector_chanswapper;
architecture structural of complexphasedetector_chanswapper is 
  signal mux_y_net : std_logic_vector( 18-1 downto 0 );
  signal mux3_y_net : std_logic_vector( 18-1 downto 0 );
  signal mux1_y_net : std_logic_vector( 18-1 downto 0 );
  signal ch1real_net : std_logic_vector( 18-1 downto 0 );
  signal ch2real_net : std_logic_vector( 18-1 downto 0 );
  signal ch2imag_net : std_logic_vector( 18-1 downto 0 );
  signal clk_net : std_logic;
  signal ch1imag_net : std_logic_vector( 18-1 downto 0 );
  signal inverter3_op_net : std_logic_vector( 1-1 downto 0 );
  signal mux2_y_net : std_logic_vector( 18-1 downto 0 );
  signal ce_net : std_logic;
  signal delay_q_net : std_logic_vector( 1-1 downto 0 );
begin
  maxreal <= mux_y_net;
  maximag <= mux2_y_net;
  minreal <= mux1_y_net;
  minimag <= mux3_y_net;
  ch1seldly <= delay_q_net;
  ch1real_net <= ch1real;
  ch1imag_net <= ch1imag;
  ch2real_net <= ch2real;
  ch2imag_net <= ch2imag;
  inverter3_op_net <= ch1sel;
  clk_net <= clk_1;
  ce_net <= ce_1;
  delay : entity work.complexphasedetector_xldelay 
  generic map (
    latency => 1,
    reg_retiming => 0,
    reset => 0,
    width => 1
  )
  port map (
    en => '1',
    rst => '1',
    d => inverter3_op_net,
    clk => clk_net,
    ce => ce_net,
    q => delay_q_net
  );
  mux : entity work.sysgen_mux_b291a9fbb0 
  port map (
    clr => '0',
    sel => inverter3_op_net,
    d0 => ch2real_net,
    d1 => ch1real_net,
    clk => clk_net,
    ce => ce_net,
    y => mux_y_net
  );
  mux1 : entity work.sysgen_mux_b291a9fbb0 
  port map (
    clr => '0',
    sel => inverter3_op_net,
    d0 => ch1real_net,
    d1 => ch2real_net,
    clk => clk_net,
    ce => ce_net,
    y => mux1_y_net
  );
  mux2 : entity work.sysgen_mux_b291a9fbb0 
  port map (
    clr => '0',
    sel => inverter3_op_net,
    d0 => ch2imag_net,
    d1 => ch1imag_net,
    clk => clk_net,
    ce => ce_net,
    y => mux2_y_net
  );
  mux3 : entity work.sysgen_mux_b291a9fbb0 
  port map (
    clr => '0',
    sel => inverter3_op_net,
    d0 => ch1imag_net,
    d1 => ch2imag_net,
    clk => clk_net,
    ce => ce_net,
    y => mux3_y_net
  );
end structural;
-- Generated from Simulink block ComplexPhaseDetector/Cordic ATan/CORDIC ATAN/CORDIC Fine Angle PE/CORDIC PE1
library IEEE;
use IEEE.std_logic_1164.all;
library work;
use work.conv_pkg.all;
entity complexphasedetector_cordic_pe1_x1 is
  port (
    x : in std_logic_vector( 18-1 downto 0 );
    y : in std_logic_vector( 18-1 downto 0 );
    z : in std_logic_vector( 18-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    x_x0 : out std_logic_vector( 18-1 downto 0 );
    y_x0 : out std_logic_vector( 18-1 downto 0 );
    z_x0 : out std_logic_vector( 18-1 downto 0 )
  );
end complexphasedetector_cordic_pe1_x1;
architecture structural of complexphasedetector_cordic_pe1_x1 is 
  signal addsub_s_net : std_logic_vector( 18-1 downto 0 );
  signal ce_net : std_logic;
  signal constant_op_net : std_logic_vector( 18-1 downto 0 );
  signal addsub2_s_net : std_logic_vector( 18-1 downto 0 );
  signal slice_y_net : std_logic_vector( 1-1 downto 0 );
  signal shift_op_net : std_logic_vector( 18-1 downto 0 );
  signal inverter_op_net : std_logic_vector( 1-1 downto 0 );
  signal clk_net : std_logic;
  signal delay3_q_net : std_logic_vector( 18-1 downto 0 );
  signal mux_y_net : std_logic_vector( 18-1 downto 0 );
  signal shift1_op_net : std_logic_vector( 18-1 downto 0 );
  signal addsub1_s_net : std_logic_vector( 18-1 downto 0 );
  signal constant_op_net_x0 : std_logic_vector( 18-1 downto 0 );
begin
  x_x0 <= addsub_s_net;
  y_x0 <= addsub1_s_net;
  z_x0 <= addsub2_s_net;
  mux_y_net <= x;
  delay3_q_net <= y;
  constant_op_net <= z;
  clk_net <= clk_1;
  ce_net <= ce_1;
  addsub : entity work.sysgen_addsub_e0e49a700f 
  port map (
    clr => '0',
    a => mux_y_net,
    b => shift1_op_net,
    mode => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub_s_net
  );
  addsub1 : entity work.sysgen_addsub_e0e49a700f 
  port map (
    clr => '0',
    a => delay3_q_net,
    b => shift_op_net,
    mode => inverter_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub1_s_net
  );
  addsub2 : entity work.sysgen_addsub_e0e49a700f 
  port map (
    clr => '0',
    a => constant_op_net,
    b => constant_op_net_x0,
    mode => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub2_s_net
  );
  constant_x0 : entity work.sysgen_constant_bf1b99a575 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net_x0
  );
  inverter : entity work.sysgen_inverter_3e6e50377b 
  port map (
    clr => '0',
    ip => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    op => inverter_op_net
  );
  shift : entity work.sysgen_shift_cd4c86d9cc 
  port map (
    clr => '0',
    ip => mux_y_net,
    clk => clk_net,
    ce => ce_net,
    op => shift_op_net
  );
  shift1 : entity work.sysgen_shift_cd4c86d9cc 
  port map (
    clr => '0',
    ip => delay3_q_net,
    clk => clk_net,
    ce => ce_net,
    op => shift1_op_net
  );
  slice : entity work.complexphasedetector_xlslice 
  generic map (
    new_lsb => 17,
    new_msb => 17,
    x_width => 18,
    y_width => 1
  )
  port map (
    x => delay3_q_net,
    y => slice_y_net
  );
end structural;
-- Generated from Simulink block ComplexPhaseDetector/Cordic ATan/CORDIC ATAN/CORDIC Fine Angle PE/CORDIC PE10
library IEEE;
use IEEE.std_logic_1164.all;
library work;
use work.conv_pkg.all;
entity complexphasedetector_cordic_pe10_x0 is
  port (
    x : in std_logic_vector( 18-1 downto 0 );
    y : in std_logic_vector( 18-1 downto 0 );
    z : in std_logic_vector( 18-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    x_x0 : out std_logic_vector( 18-1 downto 0 );
    z_x0 : out std_logic_vector( 18-1 downto 0 )
  );
end complexphasedetector_cordic_pe10_x0;
architecture structural of complexphasedetector_cordic_pe10_x0 is 
  signal addsub2_s_net : std_logic_vector( 18-1 downto 0 );
  signal addsub_s_net : std_logic_vector( 18-1 downto 0 );
  signal slice_y_net : std_logic_vector( 1-1 downto 0 );
  signal addsub_s_net_x0 : std_logic_vector( 18-1 downto 0 );
  signal addsub1_s_net : std_logic_vector( 18-1 downto 0 );
  signal ce_net : std_logic;
  signal shift1_op_net : std_logic_vector( 18-1 downto 0 );
  signal constant_op_net : std_logic_vector( 18-1 downto 0 );
  signal addsub2_s_net_x0 : std_logic_vector( 18-1 downto 0 );
  signal clk_net : std_logic;
begin
  x_x0 <= addsub_s_net_x0;
  z_x0 <= addsub2_s_net_x0;
  addsub_s_net <= x;
  addsub1_s_net <= y;
  addsub2_s_net <= z;
  clk_net <= clk_1;
  ce_net <= ce_1;
  addsub : entity work.sysgen_addsub_e0e49a700f 
  port map (
    clr => '0',
    a => addsub_s_net,
    b => shift1_op_net,
    mode => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub_s_net_x0
  );
  addsub2 : entity work.sysgen_addsub_e0e49a700f 
  port map (
    clr => '0',
    a => addsub2_s_net,
    b => constant_op_net,
    mode => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub2_s_net_x0
  );
  constant_x0 : entity work.sysgen_constant_b283f7bab5 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  shift1 : entity work.sysgen_shift_8d20a4d2ea 
  port map (
    clr => '0',
    ip => addsub1_s_net,
    clk => clk_net,
    ce => ce_net,
    op => shift1_op_net
  );
  slice : entity work.complexphasedetector_xlslice 
  generic map (
    new_lsb => 17,
    new_msb => 17,
    x_width => 18,
    y_width => 1
  )
  port map (
    x => addsub1_s_net,
    y => slice_y_net
  );
end structural;
-- Generated from Simulink block ComplexPhaseDetector/Cordic ATan/CORDIC ATAN/CORDIC Fine Angle PE/CORDIC PE2
library IEEE;
use IEEE.std_logic_1164.all;
library work;
use work.conv_pkg.all;
entity complexphasedetector_cordic_pe2_x1 is
  port (
    x : in std_logic_vector( 18-1 downto 0 );
    y : in std_logic_vector( 18-1 downto 0 );
    z : in std_logic_vector( 18-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    x_x0 : out std_logic_vector( 18-1 downto 0 );
    y_x0 : out std_logic_vector( 18-1 downto 0 );
    z_x0 : out std_logic_vector( 18-1 downto 0 )
  );
end complexphasedetector_cordic_pe2_x1;
architecture structural of complexphasedetector_cordic_pe2_x1 is 
  signal addsub1_s_net_x0 : std_logic_vector( 18-1 downto 0 );
  signal addsub2_s_net : std_logic_vector( 18-1 downto 0 );
  signal addsub_s_net_x0 : std_logic_vector( 18-1 downto 0 );
  signal clk_net : std_logic;
  signal constant_op_net : std_logic_vector( 18-1 downto 0 );
  signal ce_net : std_logic;
  signal addsub2_s_net_x0 : std_logic_vector( 18-1 downto 0 );
  signal addsub_s_net : std_logic_vector( 18-1 downto 0 );
  signal inverter_op_net : std_logic_vector( 1-1 downto 0 );
  signal shift1_op_net : std_logic_vector( 18-1 downto 0 );
  signal shift_op_net : std_logic_vector( 18-1 downto 0 );
  signal addsub1_s_net : std_logic_vector( 18-1 downto 0 );
  signal slice_y_net : std_logic_vector( 1-1 downto 0 );
begin
  x_x0 <= addsub_s_net;
  y_x0 <= addsub1_s_net;
  z_x0 <= addsub2_s_net;
  addsub_s_net_x0 <= x;
  addsub1_s_net_x0 <= y;
  addsub2_s_net_x0 <= z;
  clk_net <= clk_1;
  ce_net <= ce_1;
  addsub : entity work.sysgen_addsub_e0e49a700f 
  port map (
    clr => '0',
    a => addsub_s_net_x0,
    b => shift1_op_net,
    mode => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub_s_net
  );
  addsub1 : entity work.sysgen_addsub_e0e49a700f 
  port map (
    clr => '0',
    a => addsub1_s_net_x0,
    b => shift_op_net,
    mode => inverter_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub1_s_net
  );
  addsub2 : entity work.sysgen_addsub_e0e49a700f 
  port map (
    clr => '0',
    a => addsub2_s_net_x0,
    b => constant_op_net,
    mode => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub2_s_net
  );
  constant_x0 : entity work.sysgen_constant_bc9385d819 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  inverter : entity work.sysgen_inverter_3e6e50377b 
  port map (
    clr => '0',
    ip => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    op => inverter_op_net
  );
  shift : entity work.sysgen_shift_e803cc2f92 
  port map (
    clr => '0',
    ip => addsub_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift_op_net
  );
  shift1 : entity work.sysgen_shift_e803cc2f92 
  port map (
    clr => '0',
    ip => addsub1_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift1_op_net
  );
  slice : entity work.complexphasedetector_xlslice 
  generic map (
    new_lsb => 17,
    new_msb => 17,
    x_width => 18,
    y_width => 1
  )
  port map (
    x => addsub1_s_net_x0,
    y => slice_y_net
  );
end structural;
-- Generated from Simulink block ComplexPhaseDetector/Cordic ATan/CORDIC ATAN/CORDIC Fine Angle PE/CORDIC PE3
library IEEE;
use IEEE.std_logic_1164.all;
library work;
use work.conv_pkg.all;
entity complexphasedetector_cordic_pe3_x1 is
  port (
    x : in std_logic_vector( 18-1 downto 0 );
    y : in std_logic_vector( 18-1 downto 0 );
    z : in std_logic_vector( 18-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    x_x0 : out std_logic_vector( 18-1 downto 0 );
    y_x0 : out std_logic_vector( 18-1 downto 0 );
    z_x0 : out std_logic_vector( 18-1 downto 0 )
  );
end complexphasedetector_cordic_pe3_x1;
architecture structural of complexphasedetector_cordic_pe3_x1 is 
  signal addsub2_s_net_x0 : std_logic_vector( 18-1 downto 0 );
  signal addsub_s_net : std_logic_vector( 18-1 downto 0 );
  signal constant_op_net : std_logic_vector( 18-1 downto 0 );
  signal slice_y_net : std_logic_vector( 1-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal addsub_s_net_x0 : std_logic_vector( 18-1 downto 0 );
  signal shift1_op_net : std_logic_vector( 18-1 downto 0 );
  signal addsub1_s_net_x0 : std_logic_vector( 18-1 downto 0 );
  signal shift_op_net : std_logic_vector( 18-1 downto 0 );
  signal inverter_op_net : std_logic_vector( 1-1 downto 0 );
  signal addsub2_s_net : std_logic_vector( 18-1 downto 0 );
  signal addsub1_s_net : std_logic_vector( 18-1 downto 0 );
begin
  x_x0 <= addsub_s_net;
  y_x0 <= addsub1_s_net;
  z_x0 <= addsub2_s_net;
  addsub_s_net_x0 <= x;
  addsub1_s_net_x0 <= y;
  addsub2_s_net_x0 <= z;
  clk_net <= clk_1;
  ce_net <= ce_1;
  addsub : entity work.sysgen_addsub_e0e49a700f 
  port map (
    clr => '0',
    a => addsub_s_net_x0,
    b => shift1_op_net,
    mode => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub_s_net
  );
  addsub1 : entity work.sysgen_addsub_e0e49a700f 
  port map (
    clr => '0',
    a => addsub1_s_net_x0,
    b => shift_op_net,
    mode => inverter_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub1_s_net
  );
  addsub2 : entity work.sysgen_addsub_e0e49a700f 
  port map (
    clr => '0',
    a => addsub2_s_net_x0,
    b => constant_op_net,
    mode => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub2_s_net
  );
  constant_x0 : entity work.sysgen_constant_5ac35f4cff 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  inverter : entity work.sysgen_inverter_3e6e50377b 
  port map (
    clr => '0',
    ip => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    op => inverter_op_net
  );
  shift : entity work.sysgen_shift_538b93b233 
  port map (
    clr => '0',
    ip => addsub_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift_op_net
  );
  shift1 : entity work.sysgen_shift_538b93b233 
  port map (
    clr => '0',
    ip => addsub1_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift1_op_net
  );
  slice : entity work.complexphasedetector_xlslice 
  generic map (
    new_lsb => 17,
    new_msb => 17,
    x_width => 18,
    y_width => 1
  )
  port map (
    x => addsub1_s_net_x0,
    y => slice_y_net
  );
end structural;
-- Generated from Simulink block ComplexPhaseDetector/Cordic ATan/CORDIC ATAN/CORDIC Fine Angle PE/CORDIC PE4
library IEEE;
use IEEE.std_logic_1164.all;
library work;
use work.conv_pkg.all;
entity complexphasedetector_cordic_pe4_x1 is
  port (
    x : in std_logic_vector( 18-1 downto 0 );
    y : in std_logic_vector( 18-1 downto 0 );
    z : in std_logic_vector( 18-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    x_x0 : out std_logic_vector( 18-1 downto 0 );
    y_x0 : out std_logic_vector( 18-1 downto 0 );
    z_x0 : out std_logic_vector( 18-1 downto 0 )
  );
end complexphasedetector_cordic_pe4_x1;
architecture structural of complexphasedetector_cordic_pe4_x1 is 
  signal addsub_s_net : std_logic_vector( 18-1 downto 0 );
  signal shift_op_net : std_logic_vector( 18-1 downto 0 );
  signal constant_op_net : std_logic_vector( 18-1 downto 0 );
  signal addsub1_s_net_x0 : std_logic_vector( 18-1 downto 0 );
  signal clk_net : std_logic;
  signal addsub1_s_net : std_logic_vector( 18-1 downto 0 );
  signal addsub_s_net_x0 : std_logic_vector( 18-1 downto 0 );
  signal slice_y_net : std_logic_vector( 1-1 downto 0 );
  signal addsub2_s_net : std_logic_vector( 18-1 downto 0 );
  signal addsub2_s_net_x0 : std_logic_vector( 18-1 downto 0 );
  signal shift1_op_net : std_logic_vector( 18-1 downto 0 );
  signal ce_net : std_logic;
  signal inverter_op_net : std_logic_vector( 1-1 downto 0 );
begin
  x_x0 <= addsub_s_net;
  y_x0 <= addsub1_s_net;
  z_x0 <= addsub2_s_net;
  addsub_s_net_x0 <= x;
  addsub1_s_net_x0 <= y;
  addsub2_s_net_x0 <= z;
  clk_net <= clk_1;
  ce_net <= ce_1;
  addsub : entity work.sysgen_addsub_e0e49a700f 
  port map (
    clr => '0',
    a => addsub_s_net_x0,
    b => shift1_op_net,
    mode => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub_s_net
  );
  addsub1 : entity work.sysgen_addsub_e0e49a700f 
  port map (
    clr => '0',
    a => addsub1_s_net_x0,
    b => shift_op_net,
    mode => inverter_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub1_s_net
  );
  addsub2 : entity work.sysgen_addsub_e0e49a700f 
  port map (
    clr => '0',
    a => addsub2_s_net_x0,
    b => constant_op_net,
    mode => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub2_s_net
  );
  constant_x0 : entity work.sysgen_constant_02c153d8bb 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  inverter : entity work.sysgen_inverter_3e6e50377b 
  port map (
    clr => '0',
    ip => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    op => inverter_op_net
  );
  shift : entity work.sysgen_shift_8298260812 
  port map (
    clr => '0',
    ip => addsub_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift_op_net
  );
  shift1 : entity work.sysgen_shift_8298260812 
  port map (
    clr => '0',
    ip => addsub1_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift1_op_net
  );
  slice : entity work.complexphasedetector_xlslice 
  generic map (
    new_lsb => 17,
    new_msb => 17,
    x_width => 18,
    y_width => 1
  )
  port map (
    x => addsub1_s_net_x0,
    y => slice_y_net
  );
end structural;
-- Generated from Simulink block ComplexPhaseDetector/Cordic ATan/CORDIC ATAN/CORDIC Fine Angle PE/CORDIC PE5
library IEEE;
use IEEE.std_logic_1164.all;
library work;
use work.conv_pkg.all;
entity complexphasedetector_cordic_pe5_x1 is
  port (
    x : in std_logic_vector( 18-1 downto 0 );
    y : in std_logic_vector( 18-1 downto 0 );
    z : in std_logic_vector( 18-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    x_x0 : out std_logic_vector( 18-1 downto 0 );
    y_x0 : out std_logic_vector( 18-1 downto 0 );
    z_x0 : out std_logic_vector( 18-1 downto 0 )
  );
end complexphasedetector_cordic_pe5_x1;
architecture structural of complexphasedetector_cordic_pe5_x1 is 
  signal clk_net : std_logic;
  signal shift1_op_net : std_logic_vector( 18-1 downto 0 );
  signal constant_op_net : std_logic_vector( 18-1 downto 0 );
  signal addsub_s_net_x0 : std_logic_vector( 18-1 downto 0 );
  signal ce_net : std_logic;
  signal shift_op_net : std_logic_vector( 18-1 downto 0 );
  signal addsub1_s_net : std_logic_vector( 18-1 downto 0 );
  signal addsub1_s_net_x0 : std_logic_vector( 18-1 downto 0 );
  signal addsub_s_net : std_logic_vector( 18-1 downto 0 );
  signal addsub2_s_net : std_logic_vector( 18-1 downto 0 );
  signal slice_y_net : std_logic_vector( 1-1 downto 0 );
  signal addsub2_s_net_x0 : std_logic_vector( 18-1 downto 0 );
  signal inverter_op_net : std_logic_vector( 1-1 downto 0 );
begin
  x_x0 <= addsub_s_net;
  y_x0 <= addsub1_s_net;
  z_x0 <= addsub2_s_net;
  addsub_s_net_x0 <= x;
  addsub1_s_net_x0 <= y;
  addsub2_s_net_x0 <= z;
  clk_net <= clk_1;
  ce_net <= ce_1;
  addsub : entity work.sysgen_addsub_e0e49a700f 
  port map (
    clr => '0',
    a => addsub_s_net_x0,
    b => shift1_op_net,
    mode => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub_s_net
  );
  addsub1 : entity work.sysgen_addsub_e0e49a700f 
  port map (
    clr => '0',
    a => addsub1_s_net_x0,
    b => shift_op_net,
    mode => inverter_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub1_s_net
  );
  addsub2 : entity work.sysgen_addsub_e0e49a700f 
  port map (
    clr => '0',
    a => addsub2_s_net_x0,
    b => constant_op_net,
    mode => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub2_s_net
  );
  constant_x0 : entity work.sysgen_constant_5ba3959318 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  inverter : entity work.sysgen_inverter_3e6e50377b 
  port map (
    clr => '0',
    ip => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    op => inverter_op_net
  );
  shift : entity work.sysgen_shift_c855372fd0 
  port map (
    clr => '0',
    ip => addsub_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift_op_net
  );
  shift1 : entity work.sysgen_shift_c855372fd0 
  port map (
    clr => '0',
    ip => addsub1_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift1_op_net
  );
  slice : entity work.complexphasedetector_xlslice 
  generic map (
    new_lsb => 17,
    new_msb => 17,
    x_width => 18,
    y_width => 1
  )
  port map (
    x => addsub1_s_net_x0,
    y => slice_y_net
  );
end structural;
-- Generated from Simulink block ComplexPhaseDetector/Cordic ATan/CORDIC ATAN/CORDIC Fine Angle PE/CORDIC PE6
library IEEE;
use IEEE.std_logic_1164.all;
library work;
use work.conv_pkg.all;
entity complexphasedetector_cordic_pe6_x1 is
  port (
    x : in std_logic_vector( 18-1 downto 0 );
    y : in std_logic_vector( 18-1 downto 0 );
    z : in std_logic_vector( 18-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    x_x0 : out std_logic_vector( 18-1 downto 0 );
    y_x0 : out std_logic_vector( 18-1 downto 0 );
    z_x0 : out std_logic_vector( 18-1 downto 0 )
  );
end complexphasedetector_cordic_pe6_x1;
architecture structural of complexphasedetector_cordic_pe6_x1 is 
  signal addsub_s_net_x0 : std_logic_vector( 18-1 downto 0 );
  signal clk_net : std_logic;
  signal addsub2_s_net : std_logic_vector( 18-1 downto 0 );
  signal addsub1_s_net : std_logic_vector( 18-1 downto 0 );
  signal addsub2_s_net_x0 : std_logic_vector( 18-1 downto 0 );
  signal shift1_op_net : std_logic_vector( 18-1 downto 0 );
  signal ce_net : std_logic;
  signal inverter_op_net : std_logic_vector( 1-1 downto 0 );
  signal addsub1_s_net_x0 : std_logic_vector( 18-1 downto 0 );
  signal addsub_s_net : std_logic_vector( 18-1 downto 0 );
  signal shift_op_net : std_logic_vector( 18-1 downto 0 );
  signal slice_y_net : std_logic_vector( 1-1 downto 0 );
  signal constant_op_net : std_logic_vector( 18-1 downto 0 );
begin
  x_x0 <= addsub_s_net;
  y_x0 <= addsub1_s_net;
  z_x0 <= addsub2_s_net;
  addsub_s_net_x0 <= x;
  addsub1_s_net_x0 <= y;
  addsub2_s_net_x0 <= z;
  clk_net <= clk_1;
  ce_net <= ce_1;
  addsub : entity work.sysgen_addsub_e0e49a700f 
  port map (
    clr => '0',
    a => addsub_s_net_x0,
    b => shift1_op_net,
    mode => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub_s_net
  );
  addsub1 : entity work.sysgen_addsub_e0e49a700f 
  port map (
    clr => '0',
    a => addsub1_s_net_x0,
    b => shift_op_net,
    mode => inverter_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub1_s_net
  );
  addsub2 : entity work.sysgen_addsub_e0e49a700f 
  port map (
    clr => '0',
    a => addsub2_s_net_x0,
    b => constant_op_net,
    mode => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub2_s_net
  );
  constant_x0 : entity work.sysgen_constant_c0b49d0e4c 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  inverter : entity work.sysgen_inverter_3e6e50377b 
  port map (
    clr => '0',
    ip => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    op => inverter_op_net
  );
  shift : entity work.sysgen_shift_67933acb1e 
  port map (
    clr => '0',
    ip => addsub_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift_op_net
  );
  shift1 : entity work.sysgen_shift_67933acb1e 
  port map (
    clr => '0',
    ip => addsub1_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift1_op_net
  );
  slice : entity work.complexphasedetector_xlslice 
  generic map (
    new_lsb => 17,
    new_msb => 17,
    x_width => 18,
    y_width => 1
  )
  port map (
    x => addsub1_s_net_x0,
    y => slice_y_net
  );
end structural;
-- Generated from Simulink block ComplexPhaseDetector/Cordic ATan/CORDIC ATAN/CORDIC Fine Angle PE/CORDIC PE7
library IEEE;
use IEEE.std_logic_1164.all;
library work;
use work.conv_pkg.all;
entity complexphasedetector_cordic_pe7_x1 is
  port (
    x : in std_logic_vector( 18-1 downto 0 );
    y : in std_logic_vector( 18-1 downto 0 );
    z : in std_logic_vector( 18-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    x_x0 : out std_logic_vector( 18-1 downto 0 );
    y_x0 : out std_logic_vector( 18-1 downto 0 );
    z_x0 : out std_logic_vector( 18-1 downto 0 )
  );
end complexphasedetector_cordic_pe7_x1;
architecture structural of complexphasedetector_cordic_pe7_x1 is 
  signal addsub1_s_net_x0 : std_logic_vector( 18-1 downto 0 );
  signal clk_net : std_logic;
  signal shift1_op_net : std_logic_vector( 18-1 downto 0 );
  signal slice_y_net : std_logic_vector( 1-1 downto 0 );
  signal addsub_s_net_x0 : std_logic_vector( 18-1 downto 0 );
  signal addsub1_s_net : std_logic_vector( 18-1 downto 0 );
  signal ce_net : std_logic;
  signal addsub2_s_net : std_logic_vector( 18-1 downto 0 );
  signal shift_op_net : std_logic_vector( 18-1 downto 0 );
  signal inverter_op_net : std_logic_vector( 1-1 downto 0 );
  signal constant_op_net : std_logic_vector( 18-1 downto 0 );
  signal addsub2_s_net_x0 : std_logic_vector( 18-1 downto 0 );
  signal addsub_s_net : std_logic_vector( 18-1 downto 0 );
begin
  x_x0 <= addsub_s_net;
  y_x0 <= addsub1_s_net;
  z_x0 <= addsub2_s_net;
  addsub_s_net_x0 <= x;
  addsub1_s_net_x0 <= y;
  addsub2_s_net_x0 <= z;
  clk_net <= clk_1;
  ce_net <= ce_1;
  addsub : entity work.sysgen_addsub_e0e49a700f 
  port map (
    clr => '0',
    a => addsub_s_net_x0,
    b => shift1_op_net,
    mode => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub_s_net
  );
  addsub1 : entity work.sysgen_addsub_e0e49a700f 
  port map (
    clr => '0',
    a => addsub1_s_net_x0,
    b => shift_op_net,
    mode => inverter_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub1_s_net
  );
  addsub2 : entity work.sysgen_addsub_e0e49a700f 
  port map (
    clr => '0',
    a => addsub2_s_net_x0,
    b => constant_op_net,
    mode => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub2_s_net
  );
  constant_x0 : entity work.sysgen_constant_2a71bf8fff 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  inverter : entity work.sysgen_inverter_3e6e50377b 
  port map (
    clr => '0',
    ip => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    op => inverter_op_net
  );
  shift : entity work.sysgen_shift_3a3d920a16 
  port map (
    clr => '0',
    ip => addsub_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift_op_net
  );
  shift1 : entity work.sysgen_shift_3a3d920a16 
  port map (
    clr => '0',
    ip => addsub1_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift1_op_net
  );
  slice : entity work.complexphasedetector_xlslice 
  generic map (
    new_lsb => 17,
    new_msb => 17,
    x_width => 18,
    y_width => 1
  )
  port map (
    x => addsub1_s_net_x0,
    y => slice_y_net
  );
end structural;
-- Generated from Simulink block ComplexPhaseDetector/Cordic ATan/CORDIC ATAN/CORDIC Fine Angle PE/CORDIC PE8
library IEEE;
use IEEE.std_logic_1164.all;
library work;
use work.conv_pkg.all;
entity complexphasedetector_cordic_pe8_x1 is
  port (
    x : in std_logic_vector( 18-1 downto 0 );
    y : in std_logic_vector( 18-1 downto 0 );
    z : in std_logic_vector( 18-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    x_x0 : out std_logic_vector( 18-1 downto 0 );
    y_x0 : out std_logic_vector( 18-1 downto 0 );
    z_x0 : out std_logic_vector( 18-1 downto 0 )
  );
end complexphasedetector_cordic_pe8_x1;
architecture structural of complexphasedetector_cordic_pe8_x1 is 
  signal shift_op_net : std_logic_vector( 18-1 downto 0 );
  signal addsub1_s_net : std_logic_vector( 18-1 downto 0 );
  signal addsub1_s_net_x0 : std_logic_vector( 18-1 downto 0 );
  signal addsub2_s_net_x0 : std_logic_vector( 18-1 downto 0 );
  signal ce_net : std_logic;
  signal slice_y_net : std_logic_vector( 1-1 downto 0 );
  signal addsub2_s_net : std_logic_vector( 18-1 downto 0 );
  signal constant_op_net : std_logic_vector( 18-1 downto 0 );
  signal inverter_op_net : std_logic_vector( 1-1 downto 0 );
  signal shift1_op_net : std_logic_vector( 18-1 downto 0 );
  signal addsub_s_net_x0 : std_logic_vector( 18-1 downto 0 );
  signal clk_net : std_logic;
  signal addsub_s_net : std_logic_vector( 18-1 downto 0 );
begin
  x_x0 <= addsub_s_net;
  y_x0 <= addsub1_s_net;
  z_x0 <= addsub2_s_net;
  addsub_s_net_x0 <= x;
  addsub1_s_net_x0 <= y;
  addsub2_s_net_x0 <= z;
  clk_net <= clk_1;
  ce_net <= ce_1;
  addsub : entity work.sysgen_addsub_e0e49a700f 
  port map (
    clr => '0',
    a => addsub_s_net_x0,
    b => shift1_op_net,
    mode => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub_s_net
  );
  addsub1 : entity work.sysgen_addsub_e0e49a700f 
  port map (
    clr => '0',
    a => addsub1_s_net_x0,
    b => shift_op_net,
    mode => inverter_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub1_s_net
  );
  addsub2 : entity work.sysgen_addsub_e0e49a700f 
  port map (
    clr => '0',
    a => addsub2_s_net_x0,
    b => constant_op_net,
    mode => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub2_s_net
  );
  constant_x0 : entity work.sysgen_constant_9374f371ea 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  inverter : entity work.sysgen_inverter_3e6e50377b 
  port map (
    clr => '0',
    ip => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    op => inverter_op_net
  );
  shift : entity work.sysgen_shift_7f2ddc6658 
  port map (
    clr => '0',
    ip => addsub_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift_op_net
  );
  shift1 : entity work.sysgen_shift_7f2ddc6658 
  port map (
    clr => '0',
    ip => addsub1_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift1_op_net
  );
  slice : entity work.complexphasedetector_xlslice 
  generic map (
    new_lsb => 17,
    new_msb => 17,
    x_width => 18,
    y_width => 1
  )
  port map (
    x => addsub1_s_net_x0,
    y => slice_y_net
  );
end structural;
-- Generated from Simulink block ComplexPhaseDetector/Cordic ATan/CORDIC ATAN/CORDIC Fine Angle PE/CORDIC PE9
library IEEE;
use IEEE.std_logic_1164.all;
library work;
use work.conv_pkg.all;
entity complexphasedetector_cordic_pe9_x0 is
  port (
    x : in std_logic_vector( 18-1 downto 0 );
    y : in std_logic_vector( 18-1 downto 0 );
    z : in std_logic_vector( 18-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    x_x0 : out std_logic_vector( 18-1 downto 0 );
    y_x0 : out std_logic_vector( 18-1 downto 0 );
    z_x0 : out std_logic_vector( 18-1 downto 0 )
  );
end complexphasedetector_cordic_pe9_x0;
architecture structural of complexphasedetector_cordic_pe9_x0 is 
  signal clk_net : std_logic;
  signal inverter_op_net : std_logic_vector( 1-1 downto 0 );
  signal ce_net : std_logic;
  signal addsub_s_net : std_logic_vector( 18-1 downto 0 );
  signal addsub_s_net_x0 : std_logic_vector( 18-1 downto 0 );
  signal addsub1_s_net_x0 : std_logic_vector( 18-1 downto 0 );
  signal slice_y_net : std_logic_vector( 1-1 downto 0 );
  signal addsub1_s_net : std_logic_vector( 18-1 downto 0 );
  signal shift1_op_net : std_logic_vector( 18-1 downto 0 );
  signal constant_op_net : std_logic_vector( 18-1 downto 0 );
  signal addsub2_s_net_x0 : std_logic_vector( 18-1 downto 0 );
  signal addsub2_s_net : std_logic_vector( 18-1 downto 0 );
  signal shift_op_net : std_logic_vector( 18-1 downto 0 );
begin
  x_x0 <= addsub_s_net;
  y_x0 <= addsub1_s_net;
  z_x0 <= addsub2_s_net;
  addsub_s_net_x0 <= x;
  addsub1_s_net_x0 <= y;
  addsub2_s_net_x0 <= z;
  clk_net <= clk_1;
  ce_net <= ce_1;
  addsub : entity work.sysgen_addsub_e0e49a700f 
  port map (
    clr => '0',
    a => addsub_s_net_x0,
    b => shift1_op_net,
    mode => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub_s_net
  );
  addsub1 : entity work.sysgen_addsub_e0e49a700f 
  port map (
    clr => '0',
    a => addsub1_s_net_x0,
    b => shift_op_net,
    mode => inverter_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub1_s_net
  );
  addsub2 : entity work.sysgen_addsub_e0e49a700f 
  port map (
    clr => '0',
    a => addsub2_s_net_x0,
    b => constant_op_net,
    mode => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub2_s_net
  );
  constant_x0 : entity work.sysgen_constant_123555adf9 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  inverter : entity work.sysgen_inverter_3e6e50377b 
  port map (
    clr => '0',
    ip => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    op => inverter_op_net
  );
  shift : entity work.sysgen_shift_41eefc3285 
  port map (
    clr => '0',
    ip => addsub_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift_op_net
  );
  shift1 : entity work.sysgen_shift_41eefc3285 
  port map (
    clr => '0',
    ip => addsub1_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift1_op_net
  );
  slice : entity work.complexphasedetector_xlslice 
  generic map (
    new_lsb => 17,
    new_msb => 17,
    x_width => 18,
    y_width => 1
  )
  port map (
    x => addsub1_s_net_x0,
    y => slice_y_net
  );
end structural;
-- Generated from Simulink block ComplexPhaseDetector/Cordic ATan/CORDIC ATAN/CORDIC Fine Angle PE
library IEEE;
use IEEE.std_logic_1164.all;
library work;
use work.conv_pkg.all;
entity complexphasedetector_cordic_fine_angle_pe_x1 is
  port (
    x_x0 : in std_logic_vector( 18-1 downto 0 );
    y : in std_logic_vector( 18-1 downto 0 );
    z : in std_logic_vector( 18-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    x : out std_logic_vector( 18-1 downto 0 );
    z_x0 : out std_logic_vector( 18-1 downto 0 )
  );
end complexphasedetector_cordic_fine_angle_pe_x1;
architecture structural of complexphasedetector_cordic_fine_angle_pe_x1 is 
  signal addsub1_s_net_x8 : std_logic_vector( 18-1 downto 0 );
  signal addsub_s_net_x2 : std_logic_vector( 18-1 downto 0 );
  signal addsub1_s_net_x5 : std_logic_vector( 18-1 downto 0 );
  signal addsub1_s_net_x1 : std_logic_vector( 18-1 downto 0 );
  signal addsub2_s_net : std_logic_vector( 18-1 downto 0 );
  signal addsub_s_net_x0 : std_logic_vector( 18-1 downto 0 );
  signal addsub_s_net_x4 : std_logic_vector( 18-1 downto 0 );
  signal delay3_q_net : std_logic_vector( 18-1 downto 0 );
  signal addsub2_s_net_x5 : std_logic_vector( 18-1 downto 0 );
  signal addsub_s_net : std_logic_vector( 18-1 downto 0 );
  signal addsub2_s_net_x7 : std_logic_vector( 18-1 downto 0 );
  signal addsub_s_net_x8 : std_logic_vector( 18-1 downto 0 );
  signal addsub1_s_net_x0 : std_logic_vector( 18-1 downto 0 );
  signal addsub2_s_net_x1 : std_logic_vector( 18-1 downto 0 );
  signal addsub2_s_net_x0 : std_logic_vector( 18-1 downto 0 );
  signal addsub2_s_net_x8 : std_logic_vector( 18-1 downto 0 );
  signal addsub2_s_net_x6 : std_logic_vector( 18-1 downto 0 );
  signal addsub1_s_net_x2 : std_logic_vector( 18-1 downto 0 );
  signal addsub1_s_net_x3 : std_logic_vector( 18-1 downto 0 );
  signal addsub2_s_net_x3 : std_logic_vector( 18-1 downto 0 );
  signal addsub_s_net_x5 : std_logic_vector( 18-1 downto 0 );
  signal addsub_s_net_x6 : std_logic_vector( 18-1 downto 0 );
  signal mux_y_net : std_logic_vector( 18-1 downto 0 );
  signal constant_op_net : std_logic_vector( 18-1 downto 0 );
  signal addsub1_s_net_x7 : std_logic_vector( 18-1 downto 0 );
  signal addsub1_s_net_x6 : std_logic_vector( 18-1 downto 0 );
  signal clk_net : std_logic;
  signal addsub1_s_net : std_logic_vector( 18-1 downto 0 );
  signal ce_net : std_logic;
  signal addsub_s_net_x1 : std_logic_vector( 18-1 downto 0 );
  signal addsub2_s_net_x4 : std_logic_vector( 18-1 downto 0 );
  signal addsub2_s_net_x2 : std_logic_vector( 18-1 downto 0 );
  signal addsub_s_net_x3 : std_logic_vector( 18-1 downto 0 );
  signal addsub_s_net_x7 : std_logic_vector( 18-1 downto 0 );
begin
  x <= addsub_s_net_x3;
  z_x0 <= addsub2_s_net_x4;
  mux_y_net <= x_x0;
  delay3_q_net <= y;
  constant_op_net <= z;
  clk_net <= clk_1;
  ce_net <= ce_1;
  cordic_pe1 : entity work.complexphasedetector_cordic_pe1_x1 
  port map (
    x => mux_y_net,
    y => delay3_q_net,
    z => constant_op_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    x_x0 => addsub_s_net_x4,
    y_x0 => addsub1_s_net_x6,
    z_x0 => addsub2_s_net_x8
  );
  cordic_pe10 : entity work.complexphasedetector_cordic_pe10_x0 
  port map (
    x => addsub_s_net,
    y => addsub1_s_net,
    z => addsub2_s_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    x_x0 => addsub_s_net_x3,
    z_x0 => addsub2_s_net_x4
  );
  cordic_pe2 : entity work.complexphasedetector_cordic_pe2_x1 
  port map (
    x => addsub_s_net_x4,
    y => addsub1_s_net_x6,
    z => addsub2_s_net_x8,
    clk_1 => clk_net,
    ce_1 => ce_net,
    x_x0 => addsub_s_net_x2,
    y_x0 => addsub1_s_net_x3,
    z_x0 => addsub2_s_net_x3
  );
  cordic_pe3 : entity work.complexphasedetector_cordic_pe3_x1 
  port map (
    x => addsub_s_net_x2,
    y => addsub1_s_net_x3,
    z => addsub2_s_net_x3,
    clk_1 => clk_net,
    ce_1 => ce_net,
    x_x0 => addsub_s_net_x1,
    y_x0 => addsub1_s_net_x2,
    z_x0 => addsub2_s_net_x2
  );
  cordic_pe4 : entity work.complexphasedetector_cordic_pe4_x1 
  port map (
    x => addsub_s_net_x1,
    y => addsub1_s_net_x2,
    z => addsub2_s_net_x2,
    clk_1 => clk_net,
    ce_1 => ce_net,
    x_x0 => addsub_s_net_x0,
    y_x0 => addsub1_s_net_x1,
    z_x0 => addsub2_s_net_x1
  );
  cordic_pe5 : entity work.complexphasedetector_cordic_pe5_x1 
  port map (
    x => addsub_s_net_x0,
    y => addsub1_s_net_x1,
    z => addsub2_s_net_x1,
    clk_1 => clk_net,
    ce_1 => ce_net,
    x_x0 => addsub_s_net_x6,
    y_x0 => addsub1_s_net_x5,
    z_x0 => addsub2_s_net_x5
  );
  cordic_pe6 : entity work.complexphasedetector_cordic_pe6_x1 
  port map (
    x => addsub_s_net_x6,
    y => addsub1_s_net_x5,
    z => addsub2_s_net_x5,
    clk_1 => clk_net,
    ce_1 => ce_net,
    x_x0 => addsub_s_net_x5,
    y_x0 => addsub1_s_net_x7,
    z_x0 => addsub2_s_net_x6
  );
  cordic_pe7 : entity work.complexphasedetector_cordic_pe7_x1 
  port map (
    x => addsub_s_net_x5,
    y => addsub1_s_net_x7,
    z => addsub2_s_net_x6,
    clk_1 => clk_net,
    ce_1 => ce_net,
    x_x0 => addsub_s_net_x7,
    y_x0 => addsub1_s_net_x8,
    z_x0 => addsub2_s_net_x7
  );
  cordic_pe8 : entity work.complexphasedetector_cordic_pe8_x1 
  port map (
    x => addsub_s_net_x7,
    y => addsub1_s_net_x8,
    z => addsub2_s_net_x7,
    clk_1 => clk_net,
    ce_1 => ce_net,
    x_x0 => addsub_s_net_x8,
    y_x0 => addsub1_s_net_x0,
    z_x0 => addsub2_s_net_x0
  );
  cordic_pe9 : entity work.complexphasedetector_cordic_pe9_x0 
  port map (
    x => addsub_s_net_x8,
    y => addsub1_s_net_x0,
    z => addsub2_s_net_x0,
    clk_1 => clk_net,
    ce_1 => ce_net,
    x_x0 => addsub_s_net,
    y_x0 => addsub1_s_net,
    z_x0 => addsub2_s_net
  );
end structural;
-- Generated from Simulink block ComplexPhaseDetector/Cordic ATan/CORDIC ATAN/Quadrant Correct
library IEEE;
use IEEE.std_logic_1164.all;
library work;
use work.conv_pkg.all;
entity complexphasedetector_quadrant_correct_x0 is
  port (
    z_in : in std_logic_vector( 18-1 downto 0 );
    pi_addsub : in std_logic_vector( 1-1 downto 0 );
    z_mux_sel : in std_logic_vector( 1-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    z : out std_logic_vector( 18-1 downto 0 )
  );
end complexphasedetector_quadrant_correct_x0;
architecture structural of complexphasedetector_quadrant_correct_x0 is 
  signal mux_y_net : std_logic_vector( 18-1 downto 0 );
  signal addsub2_s_net : std_logic_vector( 18-1 downto 0 );
  signal cordic_pipe_balance_q_net : std_logic_vector( 1-1 downto 0 );
  signal pi_op_net_x0 : std_logic_vector( 18-1 downto 0 );
  signal convert_dout_net : std_logic_vector( 1-1 downto 0 );
  signal ce_net : std_logic;
  signal addsub_s_net : std_logic_vector( 18-1 downto 0 );
  signal mux1_y_net : std_logic_vector( 18-1 downto 0 );
  signal pi_op_net : std_logic_vector( 18-1 downto 0 );
  signal clk_net : std_logic;
  signal cordic_pipe_balance1_q_net : std_logic_vector( 1-1 downto 0 );
begin
  z <= mux_y_net;
  addsub2_s_net <= z_in;
  cordic_pipe_balance_q_net <= pi_addsub;
  cordic_pipe_balance1_q_net <= z_mux_sel;
  clk_net <= clk_1;
  ce_net <= ce_1;
  pi : entity work.sysgen_constant_bb43cb25a1 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => pi_op_net_x0
  );
  pi_x0 : entity work.sysgen_constant_a5fd482952 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => pi_op_net
  );
  addsub : entity work.sysgen_addsub_5fc93c972f 
  port map (
    clr => '0',
    a => mux1_y_net,
    b => addsub2_s_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub_s_net
  );
  convert : entity work.complexphasedetector_xlconvert 
  generic map (
    bool_conversion => 1,
    din_arith => 1,
    din_bin_pt => 0,
    din_width => 1,
    dout_arith => 1,
    dout_bin_pt => 0,
    dout_width => 1,
    latency => 0,
    overflow => xlWrap,
    quantization => xlTruncate
  )
  port map (
    clr => '0',
    en => "1",
    din => cordic_pipe_balance_q_net,
    clk => clk_net,
    ce => ce_net,
    dout => convert_dout_net
  );
  mux : entity work.sysgen_mux_93e16dbfde 
  port map (
    clr => '0',
    sel => cordic_pipe_balance1_q_net,
    d0 => addsub2_s_net,
    d1 => addsub_s_net,
    clk => clk_net,
    ce => ce_net,
    y => mux_y_net
  );
  mux1 : entity work.sysgen_mux_5aae7736b5 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    sel => convert_dout_net,
    d0 => pi_op_net_x0,
    d1 => pi_op_net,
    y => mux1_y_net
  );
end structural;
-- Generated from Simulink block ComplexPhaseDetector/Cordic ATan/CORDIC ATAN/Quadrant Map
library IEEE;
use IEEE.std_logic_1164.all;
library work;
use work.conv_pkg.all;
entity complexphasedetector_quadrant_map_x1 is
  port (
    x : in std_logic_vector( 18-1 downto 0 );
    y : in std_logic_vector( 18-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    x_x0 : out std_logic_vector( 18-1 downto 0 );
    y_x0 : out std_logic_vector( 18-1 downto 0 );
    sign_y : out std_logic_vector( 1-1 downto 0 );
    sign_x : out std_logic_vector( 1-1 downto 0 )
  );
end complexphasedetector_quadrant_map_x1;
architecture structural of complexphasedetector_quadrant_map_x1 is 
  signal sgn_x_y_net : std_logic_vector( 1-1 downto 0 );
  signal phase_detect_m_axis_dout_tdata_imag_net : std_logic_vector( 18-1 downto 0 );
  signal delay3_q_net : std_logic_vector( 18-1 downto 0 );
  signal phase_detect_m_axis_dout_tdata_real_net : std_logic_vector( 18-1 downto 0 );
  signal ce_net : std_logic;
  signal sgn_y_y_net : std_logic_vector( 1-1 downto 0 );
  signal mux_y_net : std_logic_vector( 18-1 downto 0 );
  signal clk_net : std_logic;
  signal negate1_op_net : std_logic_vector( 18-1 downto 0 );
  signal delay4_q_net : std_logic_vector( 18-1 downto 0 );
begin
  x_x0 <= mux_y_net;
  y_x0 <= delay3_q_net;
  sign_y <= sgn_y_y_net;
  sign_x <= sgn_x_y_net;
  phase_detect_m_axis_dout_tdata_real_net <= x;
  phase_detect_m_axis_dout_tdata_imag_net <= y;
  clk_net <= clk_1;
  ce_net <= ce_1;
  delay3 : entity work.complexphasedetector_xldelay 
  generic map (
    latency => 2,
    reg_retiming => 0,
    reset => 0,
    width => 18
  )
  port map (
    en => '1',
    rst => '1',
    d => phase_detect_m_axis_dout_tdata_imag_net,
    clk => clk_net,
    ce => ce_net,
    q => delay3_q_net
  );
  delay4 : entity work.complexphasedetector_xldelay 
  generic map (
    latency => 1,
    reg_retiming => 0,
    reset => 0,
    width => 18
  )
  port map (
    en => '1',
    rst => '1',
    d => phase_detect_m_axis_dout_tdata_real_net,
    clk => clk_net,
    ce => ce_net,
    q => delay4_q_net
  );
  mux : entity work.sysgen_mux_93e16dbfde 
  port map (
    clr => '0',
    sel => sgn_x_y_net,
    d0 => delay4_q_net,
    d1 => negate1_op_net,
    clk => clk_net,
    ce => ce_net,
    y => mux_y_net
  );
  negate1 : entity work.sysgen_negate_54849aaf55 
  port map (
    clr => '0',
    ip => delay4_q_net,
    clk => clk_net,
    ce => ce_net,
    op => negate1_op_net
  );
  sgn_x : entity work.complexphasedetector_xlslice 
  generic map (
    new_lsb => 17,
    new_msb => 17,
    x_width => 18,
    y_width => 1
  )
  port map (
    x => delay4_q_net,
    y => sgn_x_y_net
  );
  sgn_y : entity work.complexphasedetector_xlslice 
  generic map (
    new_lsb => 17,
    new_msb => 17,
    x_width => 18,
    y_width => 1
  )
  port map (
    x => delay3_q_net,
    y => sgn_y_y_net
  );
end structural;
-- Generated from Simulink block ComplexPhaseDetector/Cordic ATan/CORDIC ATAN
library IEEE;
use IEEE.std_logic_1164.all;
library work;
use work.conv_pkg.all;
entity complexphasedetector_cordic_atan_x1 is
  port (
    x : in std_logic_vector( 18-1 downto 0 );
    y : in std_logic_vector( 18-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    x_x0 : out std_logic_vector( 18-1 downto 0 );
    z : out std_logic_vector( 18-1 downto 0 )
  );
end complexphasedetector_cordic_atan_x1;
architecture structural of complexphasedetector_cordic_atan_x1 is 
  signal sgn_x_y_net : std_logic_vector( 1-1 downto 0 );
  signal ce_net : std_logic;
  signal cordic_pipe_balance2_q_net : std_logic_vector( 18-1 downto 0 );
  signal clk_net : std_logic;
  signal mux_y_net : std_logic_vector( 18-1 downto 0 );
  signal cordic_pipe_balance1_q_net : std_logic_vector( 1-1 downto 0 );
  signal phase_detect_m_axis_dout_tdata_real_net : std_logic_vector( 18-1 downto 0 );
  signal constant_op_net : std_logic_vector( 18-1 downto 0 );
  signal cordic_pipe_balance_q_net : std_logic_vector( 1-1 downto 0 );
  signal mux_y_net_x0 : std_logic_vector( 18-1 downto 0 );
  signal phase_detect_m_axis_dout_tdata_imag_net : std_logic_vector( 18-1 downto 0 );
  signal addsub_s_net : std_logic_vector( 18-1 downto 0 );
  signal addsub2_s_net : std_logic_vector( 18-1 downto 0 );
  signal delay3_q_net : std_logic_vector( 18-1 downto 0 );
  signal sgn_y_y_net : std_logic_vector( 1-1 downto 0 );
begin
  x_x0 <= cordic_pipe_balance2_q_net;
  z <= mux_y_net_x0;
  phase_detect_m_axis_dout_tdata_real_net <= x;
  phase_detect_m_axis_dout_tdata_imag_net <= y;
  clk_net <= clk_1;
  ce_net <= ce_1;
  cordic_fine_angle_pe : entity work.complexphasedetector_cordic_fine_angle_pe_x1 
  port map (
    x_x0 => mux_y_net,
    y => delay3_q_net,
    z => constant_op_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    x => addsub_s_net,
    z_x0 => addsub2_s_net
  );
  quadrant_correct_x0 : entity work.complexphasedetector_quadrant_correct_x0 
  port map (
    z_in => addsub2_s_net,
    pi_addsub => cordic_pipe_balance_q_net,
    z_mux_sel => cordic_pipe_balance1_q_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    z => mux_y_net_x0
  );
  quadrant_map : entity work.complexphasedetector_quadrant_map_x1 
  port map (
    x => phase_detect_m_axis_dout_tdata_real_net,
    y => phase_detect_m_axis_dout_tdata_imag_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    x_x0 => mux_y_net,
    y_x0 => delay3_q_net,
    sign_y => sgn_y_y_net,
    sign_x => sgn_x_y_net
  );
  cordic_pipe_balance : entity work.complexphasedetector_xldelay 
  generic map (
    latency => 10,
    reg_retiming => 0,
    reset => 0,
    width => 1
  )
  port map (
    en => '1',
    rst => '1',
    d => sgn_y_y_net,
    clk => clk_net,
    ce => ce_net,
    q => cordic_pipe_balance_q_net
  );
  cordic_pipe_balance1 : entity work.complexphasedetector_xldelay 
  generic map (
    latency => 11,
    reg_retiming => 0,
    reset => 0,
    width => 1
  )
  port map (
    en => '1',
    rst => '1',
    d => sgn_x_y_net,
    clk => clk_net,
    ce => ce_net,
    q => cordic_pipe_balance1_q_net
  );
  cordic_pipe_balance2 : entity work.complexphasedetector_xldelay 
  generic map (
    latency => 1,
    reg_retiming => 0,
    reset => 0,
    width => 18
  )
  port map (
    en => '1',
    rst => '1',
    d => addsub_s_net,
    clk => clk_net,
    ce => ce_net,
    q => cordic_pipe_balance2_q_net
  );
  constant_x0 : entity work.sysgen_constant_c2e7e60950 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
end structural;
-- Generated from Simulink block ComplexPhaseDetector/Cordic ATan
library IEEE;
use IEEE.std_logic_1164.all;
library work;
use work.conv_pkg.all;
entity complexphasedetector_cordic_atan_x0 is
  port (
    imag : in std_logic_vector( 18-1 downto 0 );
    real : in std_logic_vector( 18-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    phase : out std_logic_vector( 18-1 downto 0 )
  );
end complexphasedetector_cordic_atan_x0;
architecture structural of complexphasedetector_cordic_atan_x0 is 
  signal ce_net : std_logic;
  signal phase_detect_m_axis_dout_tdata_imag_net : std_logic_vector( 18-1 downto 0 );
  signal relational1_op_net : std_logic_vector( 1-1 downto 0 );
  signal constant_op_net : std_logic_vector( 18-1 downto 0 );
  signal mux_y_net : std_logic_vector( 18-1 downto 0 );
  signal cordic_pipe_balance2_q_net : std_logic_vector( 18-1 downto 0 );
  signal phase_detect_m_axis_dout_tdata_real_net : std_logic_vector( 18-1 downto 0 );
  signal clk_net : std_logic;
  signal mux_y_net_x0 : std_logic_vector( 18-1 downto 0 );
begin
  phase <= mux_y_net;
  phase_detect_m_axis_dout_tdata_imag_net <= imag;
  phase_detect_m_axis_dout_tdata_real_net <= real;
  clk_net <= clk_1;
  ce_net <= ce_1;
  cordic_atan : entity work.complexphasedetector_cordic_atan_x1 
  port map (
    x => phase_detect_m_axis_dout_tdata_real_net,
    y => phase_detect_m_axis_dout_tdata_imag_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    x_x0 => cordic_pipe_balance2_q_net,
    z => mux_y_net_x0
  );
  constant_x0 : entity work.sysgen_constant_c2e7e60950 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  mux : entity work.sysgen_mux_b291a9fbb0 
  port map (
    clr => '0',
    sel => relational1_op_net,
    d0 => constant_op_net,
    d1 => mux_y_net_x0,
    clk => clk_net,
    ce => ce_net,
    y => mux_y_net
  );
  relational1 : entity work.sysgen_relational_a049f94791 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    a => cordic_pipe_balance2_q_net,
    b => constant_op_net,
    op => relational1_op_net
  );
end structural;
-- Generated from Simulink block ComplexPhaseDetector/LimitedAccum
library IEEE;
use IEEE.std_logic_1164.all;
library work;
use work.conv_pkg.all;
entity complexphasedetector_limitedaccum is
  port (
    limit : in std_logic_vector( 15-1 downto 0 );
    phaseerr : in std_logic_vector( 18-1 downto 0 );
    locked : in std_logic_vector( 1-1 downto 0 );
    swprate : in std_logic_vector( 18-1 downto 0 );
    lagcoef : in std_logic_vector( 18-1 downto 0 );
    rst : in std_logic_vector( 1-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    out_x0 : out std_logic_vector( 32-1 downto 0 )
  );
end complexphasedetector_limitedaccum;
architecture structural of complexphasedetector_limitedaccum is 
  signal logical2_y_net : std_logic_vector( 1-1 downto 0 );
  signal clk_net : std_logic;
  signal inverter_op_net : std_logic_vector( 1-1 downto 0 );
  signal delay_q_net : std_logic_vector( 1-1 downto 0 );
  signal addsub_s_net : std_logic_vector( 26-1 downto 0 );
  signal ce_net : std_logic;
  signal assert_dout_net : std_logic_vector( 1-1 downto 0 );
  signal mult3_p_net : std_logic_vector( 22-1 downto 0 );
  signal constant1_op_net : std_logic_vector( 14-1 downto 0 );
  signal logical_y_net : std_logic;
  signal constant_op_net : std_logic_vector( 8-1 downto 0 );
  signal mux3_y_net : std_logic_vector( 19-1 downto 0 );
  signal mux1_y_net : std_logic_vector( 33-1 downto 0 );
  signal reset_net : std_logic_vector( 1-1 downto 0 );
  signal logical1_y_net : std_logic_vector( 1-1 downto 0 );
  signal sweeplmt_net : std_logic_vector( 15-1 downto 0 );
  signal logical2_y_net_x0 : std_logic_vector( 1-1 downto 0 );
  signal mux11_y_net : std_logic_vector( 18-1 downto 0 );
  signal lag_coef_net : std_logic_vector( 18-1 downto 0 );
  signal addsub2_s_net : std_logic_vector( 32-1 downto 0 );
  signal swprate_net : std_logic_vector( 18-1 downto 0 );
  signal relational1_op_net : std_logic_vector( 1-1 downto 0 );
  signal mux_y_net : std_logic_vector( 33-1 downto 0 );
  signal negate_op_net : std_logic_vector( 16-1 downto 0 );
  signal relational_op_net : std_logic_vector( 1-1 downto 0 );
  signal negate1_op_net : std_logic_vector( 19-1 downto 0 );
  signal mux2_y_net : std_logic_vector( 18-1 downto 0 );
  signal mux6_y_net : std_logic_vector( 15-1 downto 0 );
begin
  out_x0 <= addsub2_s_net;
  sweeplmt_net <= limit;
  mux11_y_net <= phaseerr;
  logical2_y_net_x0 <= locked;
  swprate_net <= swprate;
  lag_coef_net <= lagcoef;
  reset_net <= rst;
  clk_net <= clk_1;
  ce_net <= ce_1;
  addsub : entity work.complexphasedetector_xladdsub 
  generic map (
    a_arith => xlSigned,
    a_bin_pt => 15,
    a_width => 18,
    b_arith => xlSigned,
    b_bin_pt => 9,
    b_width => 19,
    c_has_c_out => 0,
    c_latency => 1,
    c_output_width => 26,
    core_name0 => "complexphasedetector_c_addsub_v12_0_i6",
    extra_registers => 0,
    full_s_arith => 2,
    full_s_width => 26,
    latency => 1,
    overflow => 1,
    quantization => 1,
    s_arith => xlSigned,
    s_bin_pt => 15,
    s_width => 26
  )
  port map (
    clr => '0',
    en => "1",
    a => mux11_y_net,
    b => mux3_y_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub_s_net
  );
  addsub2 : entity work.complexphasedetector_xladdsub 
  generic map (
    a_arith => xlSigned,
    a_bin_pt => 17,
    a_width => 33,
    b_arith => xlSigned,
    b_bin_pt => 17,
    b_width => 22,
    c_has_c_out => 0,
    c_latency => 1,
    c_output_width => 34,
    core_name0 => "complexphasedetector_c_addsub_v12_0_i7",
    extra_registers => 0,
    full_s_arith => 2,
    full_s_width => 34,
    latency => 1,
    overflow => 1,
    quantization => 2,
    s_arith => xlSigned,
    s_bin_pt => 17,
    s_width => 32
  )
  port map (
    clr => '0',
    en => "1",
    a => mux1_y_net,
    b => mult3_p_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub2_s_net
  );
  assert_x0 : entity work.xlpassthrough 
  generic map (
    din_width => 1,
    dout_width => 1
  )
  port map (
    din => delay_q_net,
    dout => assert_dout_net
  );
  constant_x0 : entity work.sysgen_constant_ac049fca54 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  constant1 : entity work.sysgen_constant_7c5705efd8 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant1_op_net
  );
  delay : entity work.complexphasedetector_xldelay 
  generic map (
    latency => 1,
    reg_retiming => 0,
    reset => 0,
    width => 1
  )
  port map (
    rst => '1',
    d => inverter_op_net,
    en => logical_y_net,
    clk => clk_net,
    ce => ce_net,
    q => delay_q_net
  );
  inverter : entity work.sysgen_inverter_3e6e50377b 
  port map (
    clr => '0',
    ip => assert_dout_net,
    clk => clk_net,
    ce => ce_net,
    op => inverter_op_net
  );
  logical : entity work.sysgen_logical_9c16704737 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    d0 => logical1_y_net,
    d1 => logical2_y_net,
    y(0) => logical_y_net
  );
  logical1 : entity work.sysgen_logical_e465ea70e1 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    d0 => inverter_op_net,
    d1 => relational1_op_net,
    y => logical1_y_net
  );
  logical2 : entity work.sysgen_logical_e465ea70e1 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    d0 => relational_op_net,
    d1 => assert_dout_net,
    y => logical2_y_net
  );
  mult3 : entity work.complexphasedetector_xlmult 
  generic map (
    a_arith => xlUnsigned,
    a_bin_pt => 17,
    a_width => 18,
    b_arith => xlSigned,
    b_bin_pt => 15,
    b_width => 26,
    c_a_type => 1,
    c_a_width => 18,
    c_b_type => 0,
    c_b_width => 26,
    c_baat => 18,
    c_output_width => 44,
    c_type => 0,
    core_name0 => "complexphasedetector_mult_gen_v12_0_i4",
    extra_registers => 1,
    multsign => 2,
    overflow => 1,
    p_arith => xlSigned,
    p_bin_pt => 17,
    p_width => 22,
    quantization => 2
  )
  port map (
    clr => '0',
    core_clr => '1',
    en => "1",
    rst => "0",
    a => lag_coef_net,
    b => addsub_s_net,
    clk => clk_net,
    ce => ce_net,
    core_clk => clk_net,
    core_ce => ce_net,
    p => mult3_p_net
  );
  mux : entity work.sysgen_mux_b311bd946f 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    sel => relational_op_net,
    d0 => addsub2_s_net,
    d1 => negate_op_net,
    y => mux_y_net
  );
  mux1 : entity work.sysgen_mux_900615f60e 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    sel => relational1_op_net,
    d0 => mux_y_net,
    d1 => mux6_y_net,
    y => mux1_y_net
  );
  mux2 : entity work.sysgen_mux_962f1dd50a 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    sel => logical2_y_net_x0,
    d0 => swprate_net,
    d1 => constant_op_net,
    y => mux2_y_net
  );
  mux3 : entity work.sysgen_mux_37643be6bd 
  port map (
    clr => '0',
    sel => assert_dout_net,
    d0 => mux2_y_net,
    d1 => negate1_op_net,
    clk => clk_net,
    ce => ce_net,
    y => mux3_y_net
  );
  mux6 : entity work.sysgen_mux_a9a29fcbb7 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    sel => reset_net,
    d0 => sweeplmt_net,
    d1 => constant1_op_net,
    y => mux6_y_net
  );
  negate : entity work.sysgen_negate_88c644c5e3 
  port map (
    clr => '0',
    ip => mux6_y_net,
    clk => clk_net,
    ce => ce_net,
    op => negate_op_net
  );
  negate1 : entity work.sysgen_negate_7d96770be4 
  port map (
    clr => '0',
    ip => mux2_y_net,
    clk => clk_net,
    ce => ce_net,
    op => negate1_op_net
  );
  relational : entity work.sysgen_relational_05625b6d4c 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    a => addsub2_s_net,
    b => negate_op_net,
    op => relational_op_net
  );
  relational1 : entity work.sysgen_relational_509d685fea 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    a => addsub2_s_net,
    b => mux6_y_net,
    op => relational1_op_net
  );
end structural;
-- Generated from Simulink block ComplexPhaseDetector/LockImag
library IEEE;
use IEEE.std_logic_1164.all;
library work;
use work.conv_pkg.all;
entity complexphasedetector_lockimag is
  port (
    in_x0 : in std_logic_vector( 8-1 downto 0 );
    sub : in std_logic_vector( 1-1 downto 0 );
    rst_n : in std_logic_vector( 1-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    out_x0 : out std_logic_vector( 13-1 downto 0 )
  );
end complexphasedetector_lockimag;
architecture structural of complexphasedetector_lockimag is 
  signal lockreal_s_net : std_logic_vector( 13-1 downto 0 );
  signal ce_net : std_logic;
  signal constant_op_net : std_logic_vector( 13-1 downto 0 );
  signal inverter1_op_net : std_logic_vector( 1-1 downto 0 );
  signal logical1_y_net : std_logic_vector( 1-1 downto 0 );
  signal clk_net : std_logic;
  signal mux7_y_net : std_logic_vector( 8-1 downto 0 );
  signal mux_y_net : std_logic_vector( 13-1 downto 0 );
begin
  out_x0 <= lockreal_s_net;
  mux7_y_net <= in_x0;
  logical1_y_net <= sub;
  inverter1_op_net <= rst_n;
  clk_net <= clk_1;
  ce_net <= ce_1;
  constant_x0 : entity work.sysgen_constant_16987a7d68 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  lockreal : entity work.complexphasedetector_xladdsubmode 
  generic map (
    a_arith => xlUnsigned,
    a_bin_pt => 0,
    a_width => 13,
    b_arith => xlUnsigned,
    b_bin_pt => 0,
    b_width => 8,
    c_has_c_out => 0,
    c_latency => 1,
    c_output_width => 15,
    core_name0 => "complexphasedetector_c_addsub_v12_0_i8",
    extra_registers => 0,
    full_s_arith => 2,
    full_s_width => 15,
    latency => 1,
    mode_arith => xlUnsigned,
    mode_bin_pt => 0,
    mode_width => 1,
    overflow => 2,
    quantization => 1,
    s_arith => xlUnsigned,
    s_bin_pt => 0,
    s_width => 13
  )
  port map (
    clr => '0',
    en => "1",
    a => mux_y_net,
    b => mux7_y_net,
    mode => logical1_y_net,
    clk => clk_net,
    ce => ce_net,
    s => lockreal_s_net
  );
  mux : entity work.sysgen_mux_fa91817ce5 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    sel => inverter1_op_net,
    d0 => constant_op_net,
    d1 => lockreal_s_net,
    y => mux_y_net
  );
end structural;
-- Generated from Simulink block ComplexPhaseDetector/LockReal
library IEEE;
use IEEE.std_logic_1164.all;
library work;
use work.conv_pkg.all;
entity complexphasedetector_lockreal is
  port (
    in_x0 : in std_logic_vector( 8-1 downto 0 );
    sub : in std_logic_vector( 1-1 downto 0 );
    rst_n : in std_logic_vector( 1-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    out_x0 : out std_logic_vector( 13-1 downto 0 )
  );
end complexphasedetector_lockreal;
architecture structural of complexphasedetector_lockreal is 
  signal lockreal_s_net : std_logic_vector( 13-1 downto 0 );
  signal mux8_y_net : std_logic_vector( 8-1 downto 0 );
  signal logical_y_net : std_logic_vector( 1-1 downto 0 );
  signal inverter1_op_net : std_logic_vector( 1-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal mux_y_net : std_logic_vector( 13-1 downto 0 );
  signal constant_op_net : std_logic_vector( 13-1 downto 0 );
begin
  out_x0 <= lockreal_s_net;
  mux8_y_net <= in_x0;
  logical_y_net <= sub;
  inverter1_op_net <= rst_n;
  clk_net <= clk_1;
  ce_net <= ce_1;
  constant_x0 : entity work.sysgen_constant_16987a7d68 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  lockreal : entity work.complexphasedetector_xladdsubmode 
  generic map (
    a_arith => xlUnsigned,
    a_bin_pt => 0,
    a_width => 13,
    b_arith => xlUnsigned,
    b_bin_pt => 0,
    b_width => 8,
    c_has_c_out => 0,
    c_latency => 1,
    c_output_width => 15,
    core_name0 => "complexphasedetector_c_addsub_v12_0_i8",
    extra_registers => 0,
    full_s_arith => 2,
    full_s_width => 15,
    latency => 1,
    mode_arith => xlUnsigned,
    mode_bin_pt => 0,
    mode_width => 1,
    overflow => 2,
    quantization => 1,
    s_arith => xlUnsigned,
    s_bin_pt => 0,
    s_width => 13
  )
  port map (
    clr => '0',
    en => "1",
    a => mux_y_net,
    b => mux8_y_net,
    mode => logical_y_net,
    clk => clk_net,
    ce => ce_net,
    s => lockreal_s_net
  );
  mux : entity work.sysgen_mux_fa91817ce5 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    sel => inverter1_op_net,
    d0 => constant_op_net,
    d1 => lockreal_s_net,
    y => mux_y_net
  );
end structural;
-- Generated from Simulink block ComplexPhaseDetector/Negater2
library IEEE;
use IEEE.std_logic_1164.all;
library work;
use work.conv_pkg.all;
entity complexphasedetector_negater2 is
  port (
    neg : in std_logic_vector( 1-1 downto 0 );
    in_x0 : in std_logic_vector( 18-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    out_x0 : out std_logic_vector( 18-1 downto 0 )
  );
end complexphasedetector_negater2;
architecture structural of complexphasedetector_negater2 is 
  signal negate1_op_net : std_logic_vector( 18-1 downto 0 );
  signal mux11_y_net : std_logic_vector( 18-1 downto 0 );
  signal clk_net : std_logic;
  signal delay11_q_net : std_logic_vector( 1-1 downto 0 );
  signal ce_net : std_logic;
  signal mux_y_net : std_logic_vector( 18-1 downto 0 );
begin
  out_x0 <= mux11_y_net;
  delay11_q_net <= neg;
  mux_y_net <= in_x0;
  clk_net <= clk_1;
  ce_net <= ce_1;
  mux11 : entity work.sysgen_mux_b291a9fbb0 
  port map (
    clr => '0',
    sel => delay11_q_net,
    d0 => mux_y_net,
    d1 => negate1_op_net,
    clk => clk_net,
    ce => ce_net,
    y => mux11_y_net
  );
  negate1 : entity work.sysgen_negate_9fe2bd87fe 
  port map (
    clr => '0',
    ip => mux_y_net,
    clk => clk_net,
    ce => ce_net,
    op => negate1_op_net
  );
end structural;
-- Generated from Simulink block ComplexPhaseDetector_struct
library IEEE;
use IEEE.std_logic_1164.all;
library work;
use work.conv_pkg.all;
entity complexphasedetector_struct is
  port (
    ch1agc : in std_logic_vector( 13-1 downto 0 );
    ch1imag : in std_logic_vector( 18-1 downto 0 );
    ch1real : in std_logic_vector( 18-1 downto 0 );
    ch2agc : in std_logic_vector( 13-1 downto 0 );
    ch2imag : in std_logic_vector( 18-1 downto 0 );
    ch2real : in std_logic_vector( 18-1 downto 0 );
    enmasterswitching : in std_logic_vector( 1-1 downto 0 );
    forcech1 : in std_logic_vector( 1-1 downto 0 );
    lag_coef : in std_logic_vector( 18-1 downto 0 );
    lead_coef : in std_logic_vector( 18-1 downto 0 );
    lockhysterisis : in std_logic_vector( 13-1 downto 0 );
    lockthreshold : in std_logic_vector( 13-1 downto 0 );
    overridech : in std_logic_vector( 1-1 downto 0 );
    reset : in std_logic_vector( 1-1 downto 0 );
    sweeplmt : in std_logic_vector( 15-1 downto 0 );
    swprate : in std_logic_vector( 18-1 downto 0 );
    db_range : in std_logic_vector( 16-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    ch1ismaster : out std_logic_vector( 1-1 downto 0 );
    gainoutmax : out std_logic_vector( 18-1 downto 0 );
    gainoutmin : out std_logic_vector( 18-1 downto 0 );
    imaglock : out std_logic_vector( 13-1 downto 0 );
    imagout : out std_logic_vector( 18-1 downto 0 );
    imagxord : out std_logic_vector( 1-1 downto 0 );
    lag_out : out std_logic_vector( 32-1 downto 0 );
    locked : out std_logic_vector( 1-1 downto 0 );
    maximagout : out std_logic_vector( 18-1 downto 0 );
    maxrealout : out std_logic_vector( 18-1 downto 0 );
    minimagout : out std_logic_vector( 18-1 downto 0 );
    minrealout : out std_logic_vector( 18-1 downto 0 );
    nco_control_out : out std_logic_vector( 22-1 downto 0 );
    phase_detect : out std_logic_vector( 18-1 downto 0 );
    power : out std_logic_vector( 18-1 downto 0 );
    reallock : out std_logic_vector( 13-1 downto 0 );
    realout : out std_logic_vector( 18-1 downto 0 );
    realxord : out std_logic_vector( 1-1 downto 0 )
  );
end complexphasedetector_struct;
architecture structural of complexphasedetector_struct is 
  signal mux20_y_net : std_logic_vector( 14-1 downto 0 );
  signal oneminusslave_s_net : std_logic_vector( 18-1 downto 0 );
  signal neverzero_y_net : std_logic_vector( 18-1 downto 0 );
  signal ch1agc_net : std_logic_vector( 13-1 downto 0 );
  signal ch1imag_net : std_logic_vector( 18-1 downto 0 );
  signal ch2imag_net : std_logic_vector( 18-1 downto 0 );
  signal ch2agc_net : std_logic_vector( 13-1 downto 0 );
  signal ch2real_net : std_logic_vector( 18-1 downto 0 );
  signal enmasterswitching_net : std_logic_vector( 1-1 downto 0 );
  signal forcech1_net : std_logic_vector( 1-1 downto 0 );
  signal ch1real_net : std_logic_vector( 18-1 downto 0 );
  signal inverter3_op_net : std_logic_vector( 1-1 downto 0 );
  signal mux19_y_net : std_logic_vector( 18-1 downto 0 );
  signal mux11_y_net : std_logic_vector( 18-1 downto 0 );
  signal mux12_y_net : std_logic_vector( 18-1 downto 0 );
  signal convert1_dout_net : std_logic_vector( 18-1 downto 0 );
  signal overridech_net : std_logic_vector( 1-1 downto 0 );
  signal logical1_y_net : std_logic_vector( 1-1 downto 0 );
  signal sweeplmt_net : std_logic_vector( 15-1 downto 0 );
  signal lockhysterisis_net : std_logic_vector( 13-1 downto 0 );
  signal logical2_y_net : std_logic_vector( 1-1 downto 0 );
  signal cordic_pipe_balance2_q_net : std_logic_vector( 18-1 downto 0 );
  signal logical_y_net : std_logic_vector( 1-1 downto 0 );
  signal lockreal_s_net : std_logic_vector( 13-1 downto 0 );
  signal inverter4_op_net : std_logic_vector( 1-1 downto 0 );
  signal mux_y_net : std_logic_vector( 18-1 downto 0 );
  signal mux11_y_net_x0 : std_logic_vector( 18-1 downto 0 );
  signal ce_net : std_logic;
  signal mux2_y_net : std_logic_vector( 18-1 downto 0 );
  signal reset_net : std_logic_vector( 1-1 downto 0 );
  signal db_range_net : std_logic_vector( 16-1 downto 0 );
  signal lockreal_s_net_x0 : std_logic_vector( 13-1 downto 0 );
  signal delay1_q_net : std_logic_vector( 18-1 downto 0 );
  signal convert_dout_net : std_logic_vector( 18-1 downto 0 );
  signal addimags_s_net : std_logic_vector( 18-1 downto 0 );
  signal convert_dout_net_x0 : std_logic_vector( 18-1 downto 0 );
  signal lead_coef_net : std_logic_vector( 18-1 downto 0 );
  signal swprate_net : std_logic_vector( 18-1 downto 0 );
  signal mux1_y_net : std_logic_vector( 18-1 downto 0 );
  signal mux3_y_net : std_logic_vector( 18-1 downto 0 );
  signal delay_q_net : std_logic_vector( 1-1 downto 0 );
  signal addsub2_s_net : std_logic_vector( 32-1 downto 0 );
  signal negate1_op_net : std_logic_vector( 22-1 downto 0 );
  signal clk_net : std_logic;
  signal lockthreshold_net : std_logic_vector( 13-1 downto 0 );
  signal delay2_q_net : std_logic_vector( 18-1 downto 0 );
  signal lag_coef_net : std_logic_vector( 18-1 downto 0 );
  signal addreals_s_net : std_logic_vector( 18-1 downto 0 );
  signal mult_p_net : std_logic_vector( 22-1 downto 0 );
  signal mux_y_net_x1 : std_logic_vector( 18-1 downto 0 );
  signal mux7_y_net : std_logic_vector( 8-1 downto 0 );
  signal phase_detect_m_axis_dout_tdata_imag_net : std_logic_vector( 18-1 downto 0 );
  signal allones_y_net : std_logic_vector( 1-1 downto 0 );
  signal addsub1_s_net : std_logic_vector( 18-1 downto 0 );
  signal db_offset_op_net : std_logic_vector( 18-1 downto 0 );
  signal mult5_p_net : std_logic_vector( 18-1 downto 0 );
  signal phase_detect_m_axis_dout_tdata_real_net : std_logic_vector( 18-1 downto 0 );
  signal addsub_s_net : std_logic_vector( 22-1 downto 0 );
  signal conju_gate_op_net : std_logic_vector( 18-1 downto 0 );
  signal allzeros_y_net : std_logic_vector( 1-1 downto 0 );
  signal mult3_p_net : std_logic_vector( 18-1 downto 0 );
  signal mult1_p_net : std_logic_vector( 18-1 downto 0 );
  signal mux8_y_net : std_logic_vector( 8-1 downto 0 );
  signal mult2_p_net : std_logic_vector( 18-1 downto 0 );
  signal inverter1_op_net : std_logic_vector( 1-1 downto 0 );
  signal delay11_q_net : std_logic_vector( 1-1 downto 0 );
  signal mult4_p_net : std_logic_vector( 18-1 downto 0 );
  signal constant4_op_net : std_logic_vector( 8-1 downto 0 );
  signal constant9_op_net : std_logic_vector( 8-1 downto 0 );
  signal int_offset_mixer_m_axis_dout_tdata_real_net : std_logic_vector( 20-1 downto 0 );
  signal constant6_op_net : std_logic_vector( 8-1 downto 0 );
  signal int_offset_mixer_m_axis_dout_tdata_imag_net : std_logic_vector( 20-1 downto 0 );
  signal delay13_q_net : std_logic_vector( 18-1 downto 0 );
  signal constant5_op_net : std_logic_vector( 8-1 downto 0 );
  signal constant3_op_net : std_logic_vector( 18-1 downto 0 );
  signal high2_op_net : std_logic_vector( 13-1 downto 0 );
  signal diffdb_s_net : std_logic_vector( 14-1 downto 0 );
  signal mux3db_y_net : std_logic_vector( 13-1 downto 0 );
  signal high3_op_net : std_logic_vector( 13-1 downto 0 );
  signal hysteresis_s_net : std_logic_vector( 13-1 downto 0 );
  signal imag2msb_y_net : std_logic_vector( 1-1 downto 0 );
  signal high1_op_net : std_logic_vector( 14-1 downto 0 );
  signal imag1msb_y_net : std_logic_vector( 1-1 downto 0 );
  signal logical4_y_net : std_logic_vector( 1-1 downto 0 );
  signal int_offset_mixer_m_axis_dout_tvalid_net : std_logic;
  signal high_op_net : std_logic_vector( 14-1 downto 0 );
  signal delay8_q_net : std_logic_vector( 1-1 downto 0 );
  signal signdiff_y_net : std_logic_vector( 1-1 downto 0 );
  signal real1msb_y_net : std_logic_vector( 1-1 downto 0 );
  signal real2msb_y_net : std_logic_vector( 1-1 downto 0 );
  signal relational_op_net : std_logic_vector( 1-1 downto 0 );
  signal relational1_op_net : std_logic_vector( 1-1 downto 0 );
  signal logical3_y_net : std_logic_vector( 1-1 downto 0 );
  signal logical5_y_net : std_logic_vector( 1-1 downto 0 );
  signal lockreal1_s_net : std_logic_vector( 13-1 downto 0 );
  signal one_op_net : std_logic;
  signal inverter2_op_net : std_logic_vector( 1-1 downto 0 );
  signal mux18_y_net : std_logic_vector( 14-1 downto 0 );
  signal phase_detect_m_axis_dout_tvalid_net : std_logic;
begin
  ch1agc_net <= ch1agc;
  ch1imag_net <= ch1imag;
  ch1real_net <= ch1real;
  ch1ismaster <= inverter3_op_net;
  ch2agc_net <= ch2agc;
  ch2imag_net <= ch2imag;
  ch2real_net <= ch2real;
  enmasterswitching_net <= enmasterswitching;
  forcech1_net <= forcech1;
  gainoutmax <= mux19_y_net;
  gainoutmin <= mux12_y_net;
  imaglock <= lockreal_s_net_x0;
  imagout <= addimags_s_net;
  imagxord <= logical1_y_net;
  lag_coef_net <= lag_coef;
  lag_out <= addsub2_s_net;
  lead_coef_net <= lead_coef;
  lockhysterisis_net <= lockhysterisis;
  lockthreshold_net <= lockthreshold;
  locked <= logical2_y_net;
  maximagout <= delay2_q_net;
  maxrealout <= delay1_q_net;
  minimagout <= convert_dout_net;
  minrealout <= convert1_dout_net;
  nco_control_out <= negate1_op_net;
  overridech_net <= overridech;
  phase_detect <= mux11_y_net;
  power <= cordic_pipe_balance2_q_net;
  reallock <= lockreal_s_net;
  realout <= addreals_s_net;
  realxord <= logical_y_net;
  reset_net <= reset;
  sweeplmt_net <= sweeplmt;
  swprate_net <= swprate;
  db_range_net <= db_range;
  clk_net <= clk_1;
  ce_net <= ce_1;
  bipolar_nco : entity work.complexphasedetector_bipolar_nco 
  port map (
    rst => reset_net,
    inc => negate1_op_net,
    conj => inverter4_op_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    sin => mux11_y_net_x0,
    cos => convert_dout_net_x0
  );
  cordic_atan_x0 : entity work.complexphasedetector_cordic_atan 
  port map (
    x => addreals_s_net,
    y => addimags_s_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    x_x0 => cordic_pipe_balance2_q_net
  );
  chanswapper : entity work.complexphasedetector_chanswapper 
  port map (
    ch1real => ch1real_net,
    ch1imag => ch1imag_net,
    ch2real => ch2real_net,
    ch2imag => ch2imag_net,
    ch1sel => inverter3_op_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    maxreal => mux_y_net,
    maximag => mux2_y_net,
    minreal => mux1_y_net,
    minimag => mux3_y_net,
    ch1seldly => delay_q_net
  );
  cordic_atan : entity work.complexphasedetector_cordic_atan_x0 
  port map (
    imag => phase_detect_m_axis_dout_tdata_imag_net,
    real => phase_detect_m_axis_dout_tdata_real_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    phase => mux_y_net_x1
  );
  limitedaccum : entity work.complexphasedetector_limitedaccum 
  port map (
    limit => sweeplmt_net,
    phaseerr => mux11_y_net,
    locked => logical2_y_net,
    swprate => swprate_net,
    lagcoef => lag_coef_net,
    rst => reset_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    out_x0 => addsub2_s_net
  );
  lockimag : entity work.complexphasedetector_lockimag 
  port map (
    in_x0 => mux7_y_net,
    sub => logical1_y_net,
    rst_n => inverter1_op_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    out_x0 => lockreal_s_net_x0
  );
  lockreal : entity work.complexphasedetector_lockreal 
  port map (
    in_x0 => mux8_y_net,
    sub => logical_y_net,
    rst_n => inverter1_op_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    out_x0 => lockreal_s_net
  );
  negater2 : entity work.complexphasedetector_negater2 
  port map (
    neg => delay11_q_net,
    in_x0 => mux_y_net_x1,
    clk_1 => clk_net,
    ce_1 => ce_net,
    out_x0 => mux11_y_net
  );
  addimags : entity work.complexphasedetector_xladdsub 
  generic map (
    a_arith => xlSigned,
    a_bin_pt => 17,
    a_width => 18,
    b_arith => xlSigned,
    b_bin_pt => 17,
    b_width => 18,
    c_has_c_out => 0,
    c_latency => 1,
    c_output_width => 19,
    core_name0 => "complexphasedetector_c_addsub_v12_0_i0",
    extra_registers => 0,
    full_s_arith => 2,
    full_s_width => 19,
    latency => 1,
    overflow => 2,
    quantization => 2,
    s_arith => xlSigned,
    s_bin_pt => 17,
    s_width => 18
  )
  port map (
    clr => '0',
    en => "1",
    a => mult3_p_net,
    b => mult5_p_net,
    clk => clk_net,
    ce => ce_net,
    s => addimags_s_net
  );
  addreals : entity work.complexphasedetector_xladdsub 
  generic map (
    a_arith => xlSigned,
    a_bin_pt => 17,
    a_width => 18,
    b_arith => xlSigned,
    b_bin_pt => 17,
    b_width => 18,
    c_has_c_out => 0,
    c_latency => 1,
    c_output_width => 19,
    core_name0 => "complexphasedetector_c_addsub_v12_0_i0",
    extra_registers => 0,
    full_s_arith => 2,
    full_s_width => 19,
    latency => 1,
    overflow => 2,
    quantization => 2,
    s_arith => xlSigned,
    s_bin_pt => 17,
    s_width => 18
  )
  port map (
    clr => '0',
    en => "1",
    a => mult2_p_net,
    b => mult4_p_net,
    clk => clk_net,
    ce => ce_net,
    s => addreals_s_net
  );
  addsub : entity work.complexphasedetector_xladdsub 
  generic map (
    a_arith => xlSigned,
    a_bin_pt => 17,
    a_width => 32,
    b_arith => xlSigned,
    b_bin_pt => 9,
    b_width => 22,
    c_has_c_out => 0,
    c_latency => 1,
    c_output_width => 33,
    core_name0 => "complexphasedetector_c_addsub_v12_0_i1",
    extra_registers => 0,
    full_s_arith => 2,
    full_s_width => 33,
    latency => 1,
    overflow => 1,
    quantization => 1,
    s_arith => xlSigned,
    s_bin_pt => 0,
    s_width => 22
  )
  port map (
    clr => '0',
    en => "1",
    a => addsub2_s_net,
    b => mult_p_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub_s_net
  );
  addsub1 : entity work.complexphasedetector_xladdsub 
  generic map (
    a_arith => xlSigned,
    a_bin_pt => 17,
    a_width => 18,
    b_arith => xlSigned,
    b_bin_pt => 17,
    b_width => 18,
    c_has_c_out => 0,
    c_latency => 1,
    c_output_width => 19,
    core_name0 => "complexphasedetector_c_addsub_v12_0_i0",
    extra_registers => 0,
    full_s_arith => 2,
    full_s_width => 19,
    latency => 1,
    overflow => 2,
    quantization => 1,
    s_arith => xlUnsigned,
    s_bin_pt => 18,
    s_width => 18
  )
  port map (
    clr => '0',
    en => "1",
    a => mult1_p_net,
    b => db_offset_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub1_s_net
  );
  allones : entity work.sysgen_logical_ac03eb3ab0 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    d0 => addsub1_s_net,
    y => allones_y_net
  );
  allzeros : entity work.sysgen_logical_7196424726 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    d0 => addsub1_s_net,
    y => allzeros_y_net
  );
  conju_gate : entity work.sysgen_negate_bbc2a275af 
  port map (
    clr => '0',
    ip => convert_dout_net,
    clk => clk_net,
    ce => ce_net,
    op => conju_gate_op_net
  );
  constant3 : entity work.sysgen_constant_3ab2b05066 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant3_op_net
  );
  constant4 : entity work.sysgen_constant_52e7aa51fb 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant4_op_net
  );
  constant5 : entity work.sysgen_constant_ef76dbd771 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant5_op_net
  );
  constant6 : entity work.sysgen_constant_52e7aa51fb 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant6_op_net
  );
  constant9 : entity work.sysgen_constant_ef76dbd771 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant9_op_net
  );
  convert : entity work.complexphasedetector_xlconvert 
  generic map (
    bool_conversion => 0,
    din_arith => 2,
    din_bin_pt => 17,
    din_width => 20,
    dout_arith => 2,
    dout_bin_pt => 17,
    dout_width => 18,
    latency => 1,
    overflow => xlSaturate,
    quantization => xlTruncate
  )
  port map (
    clr => '0',
    en => "1",
    din => int_offset_mixer_m_axis_dout_tdata_imag_net,
    clk => clk_net,
    ce => ce_net,
    dout => convert_dout_net
  );
  convert1 : entity work.complexphasedetector_xlconvert 
  generic map (
    bool_conversion => 0,
    din_arith => 2,
    din_bin_pt => 17,
    din_width => 20,
    dout_arith => 2,
    dout_bin_pt => 17,
    dout_width => 18,
    latency => 1,
    overflow => xlSaturate,
    quantization => xlTruncate
  )
  port map (
    clr => '0',
    en => "1",
    din => int_offset_mixer_m_axis_dout_tdata_real_net,
    clk => clk_net,
    ce => ce_net,
    dout => convert1_dout_net
  );
  delay1 : entity work.complexphasedetector_xldelay 
  generic map (
    latency => 4,
    reg_retiming => 0,
    reset => 0,
    width => 18
  )
  port map (
    en => '1',
    rst => '1',
    d => mux_y_net,
    clk => clk_net,
    ce => ce_net,
    q => delay1_q_net
  );
  delay11 : entity work.complexphasedetector_xldelay 
  generic map (
    latency => 4,
    reg_retiming => 0,
    reset => 0,
    width => 1
  )
  port map (
    en => '1',
    rst => '1',
    d => delay_q_net,
    clk => clk_net,
    ce => ce_net,
    q => delay11_q_net
  );
  delay13 : entity work.complexphasedetector_xldelay 
  generic map (
    latency => 1,
    reg_retiming => 0,
    reset => 0,
    width => 18
  )
  port map (
    en => '1',
    rst => '1',
    d => addsub1_s_net,
    clk => clk_net,
    ce => ce_net,
    q => delay13_q_net
  );
  delay2 : entity work.complexphasedetector_xldelay 
  generic map (
    latency => 4,
    reg_retiming => 0,
    reset => 0,
    width => 18
  )
  port map (
    en => '1',
    rst => '1',
    d => mux2_y_net,
    clk => clk_net,
    ce => ce_net,
    q => delay2_q_net
  );
  delay8 : entity work.sysgen_delay_e67f6f5a6d 
  port map (
    clr => '0',
    d => signdiff_y_net,
    rst => reset_net,
    en => logical4_y_net,
    clk => clk_net,
    ce => ce_net,
    q => delay8_q_net
  );
  diffdb : entity work.complexphasedetector_xladdsub 
  generic map (
    a_arith => xlUnsigned,
    a_bin_pt => 12,
    a_width => 13,
    b_arith => xlUnsigned,
    b_bin_pt => 12,
    b_width => 13,
    c_has_c_out => 0,
    c_latency => 1,
    c_output_width => 14,
    core_name0 => "complexphasedetector_c_addsub_v12_0_i2",
    extra_registers => 0,
    full_s_arith => 2,
    full_s_width => 14,
    latency => 1,
    overflow => 2,
    quantization => 1,
    s_arith => xlSigned,
    s_bin_pt => 12,
    s_width => 14
  )
  port map (
    clr => '0',
    en => "1",
    a => ch1agc_net,
    b => hysteresis_s_net,
    clk => clk_net,
    ce => ce_net,
    s => diffdb_s_net
  );
  high : entity work.sysgen_constant_bc1f3ee464 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => high_op_net
  );
  high1 : entity work.sysgen_constant_986dafc010 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => high1_op_net
  );
  high2 : entity work.sysgen_constant_2ecdeb5b2b 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => high2_op_net
  );
  high3 : entity work.sysgen_constant_16987a7d68 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => high3_op_net
  );
  hysteresis : entity work.complexphasedetector_xladdsub 
  generic map (
    a_arith => xlUnsigned,
    a_bin_pt => 12,
    a_width => 13,
    b_arith => xlUnsigned,
    b_bin_pt => 12,
    b_width => 13,
    c_has_c_out => 0,
    c_latency => 0,
    c_output_width => 14,
    core_name0 => "complexphasedetector_c_addsub_v12_0_i3",
    extra_registers => 0,
    full_s_arith => 1,
    full_s_width => 14,
    latency => 0,
    overflow => 1,
    quantization => 1,
    s_arith => xlUnsigned,
    s_bin_pt => 12,
    s_width => 13
  )
  port map (
    clr => '0',
    en => "1",
    a => ch2agc_net,
    b => mux3db_y_net,
    clk => clk_net,
    ce => ce_net,
    s => hysteresis_s_net
  );
  imag1msb : entity work.complexphasedetector_xlslice 
  generic map (
    new_lsb => 17,
    new_msb => 17,
    x_width => 18,
    y_width => 1
  )
  port map (
    x => delay2_q_net,
    y => imag1msb_y_net
  );
  imag2msb : entity work.complexphasedetector_xlslice 
  generic map (
    new_lsb => 17,
    new_msb => 17,
    x_width => 18,
    y_width => 1
  )
  port map (
    x => convert_dout_net,
    y => imag2msb_y_net
  );
  int_offset_mixer : entity work.xlcomplex_multiplier_458514280d5fa9985b41331a92c63bc0 
  port map (
    s_axis_a_tvalid => one_op_net,
    s_axis_a_tdata_imag => mux3_y_net,
    s_axis_a_tdata_real => mux1_y_net,
    s_axis_b_tvalid => one_op_net,
    s_axis_b_tdata_imag => mux11_y_net_x0,
    s_axis_b_tdata_real => convert_dout_net_x0,
    rst => inverter1_op_net(0),
    clk => clk_net,
    ce => ce_net,
    m_axis_dout_tvalid => int_offset_mixer_m_axis_dout_tvalid_net,
    m_axis_dout_tdata_imag => int_offset_mixer_m_axis_dout_tdata_imag_net,
    m_axis_dout_tdata_real => int_offset_mixer_m_axis_dout_tdata_real_net
  );
  inverter1 : entity work.sysgen_inverter_3e6e50377b 
  port map (
    clr => '0',
    ip => reset_net,
    clk => clk_net,
    ce => ce_net,
    op => inverter1_op_net
  );
  inverter2 : entity work.sysgen_inverter_3e6e50377b 
  port map (
    clr => '0',
    ip => logical2_y_net,
    clk => clk_net,
    ce => ce_net,
    op => inverter2_op_net
  );
  inverter3 : entity work.sysgen_inverter_3e6e50377b 
  port map (
    clr => '0',
    ip => delay8_q_net,
    clk => clk_net,
    ce => ce_net,
    op => inverter3_op_net
  );
  inverter4 : entity work.sysgen_inverter_3e6e50377b 
  port map (
    clr => '0',
    ip => delay_q_net,
    clk => clk_net,
    ce => ce_net,
    op => inverter4_op_net
  );
  lockreal1 : entity work.complexphasedetector_xladdsubmode 
  generic map (
    a_arith => xlUnsigned,
    a_bin_pt => 0,
    a_width => 13,
    b_arith => xlUnsigned,
    b_bin_pt => 0,
    b_width => 13,
    c_has_c_out => 0,
    c_latency => 0,
    c_output_width => 15,
    core_name0 => "complexphasedetector_c_addsub_v12_0_i4",
    extra_registers => 0,
    full_s_arith => 2,
    full_s_width => 15,
    latency => 0,
    mode_arith => xlUnsigned,
    mode_bin_pt => 0,
    mode_width => 1,
    overflow => 1,
    quantization => 1,
    s_arith => xlUnsigned,
    s_bin_pt => 0,
    s_width => 13
  )
  port map (
    clr => '0',
    en => "1",
    a => lockthreshold_net,
    b => lockhysterisis_net,
    mode => logical2_y_net,
    clk => clk_net,
    ce => ce_net,
    s => lockreal1_s_net
  );
  logical : entity work.sysgen_logical_bf479f8f2a 
  port map (
    clr => '0',
    d0 => real1msb_y_net,
    d1 => real2msb_y_net,
    clk => clk_net,
    ce => ce_net,
    y => logical_y_net
  );
  logical1 : entity work.sysgen_logical_bf479f8f2a 
  port map (
    clr => '0',
    d0 => imag1msb_y_net,
    d1 => imag2msb_y_net,
    clk => clk_net,
    ce => ce_net,
    y => logical1_y_net
  );
  logical2 : entity work.sysgen_logical_7f1bdec730 
  port map (
    clr => '0',
    d0 => relational_op_net,
    d1 => relational1_op_net,
    clk => clk_net,
    ce => ce_net,
    y => logical2_y_net
  );
  logical3 : entity work.sysgen_logical_e465ea70e1 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    d0 => logical5_y_net,
    d1 => enmasterswitching_net,
    y => logical3_y_net
  );
  logical4 : entity work.sysgen_logical_9c16704737 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    d0 => inverter2_op_net,
    d1 => logical3_y_net,
    y => logical4_y_net
  );
  logical5 : entity work.sysgen_logical_9c16704737 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    d0 => allones_y_net,
    d1 => allzeros_y_net,
    y => logical5_y_net
  );
  mult : entity work.complexphasedetector_xlmult 
  generic map (
    a_arith => xlSigned,
    a_bin_pt => 15,
    a_width => 18,
    b_arith => xlUnsigned,
    b_bin_pt => 9,
    b_width => 18,
    c_a_type => 0,
    c_a_width => 18,
    c_b_type => 1,
    c_b_width => 18,
    c_baat => 18,
    c_output_width => 36,
    c_type => 0,
    core_name0 => "complexphasedetector_mult_gen_v12_0_i0",
    extra_registers => 1,
    multsign => 2,
    overflow => 1,
    p_arith => xlSigned,
    p_bin_pt => 9,
    p_width => 22,
    quantization => 2
  )
  port map (
    clr => '0',
    core_clr => '1',
    en => "1",
    rst => "0",
    a => mux11_y_net,
    b => lead_coef_net,
    clk => clk_net,
    ce => ce_net,
    core_clk => clk_net,
    core_ce => ce_net,
    p => mult_p_net
  );
  mult1 : entity work.complexphasedetector_xlmult 
  generic map (
    a_arith => xlUnsigned,
    a_bin_pt => 10,
    a_width => 16,
    b_arith => xlSigned,
    b_bin_pt => 12,
    b_width => 14,
    c_a_type => 1,
    c_a_width => 16,
    c_b_type => 0,
    c_b_width => 14,
    c_baat => 16,
    c_output_width => 30,
    c_type => 0,
    core_name0 => "complexphasedetector_mult_gen_v12_0_i1",
    extra_registers => 1,
    multsign => 2,
    overflow => 2,
    p_arith => xlSigned,
    p_bin_pt => 17,
    p_width => 18,
    quantization => 1
  )
  port map (
    clr => '0',
    core_clr => '1',
    en => "1",
    rst => "0",
    a => db_range_net,
    b => mux18_y_net,
    clk => clk_net,
    ce => ce_net,
    core_clk => clk_net,
    core_ce => ce_net,
    p => mult1_p_net
  );
  mult2 : entity work.complexphasedetector_xlmult 
  generic map (
    a_arith => xlSigned,
    a_bin_pt => 17,
    a_width => 18,
    b_arith => xlUnsigned,
    b_bin_pt => 18,
    b_width => 18,
    c_a_type => 0,
    c_a_width => 18,
    c_b_type => 1,
    c_b_width => 18,
    c_baat => 18,
    c_output_width => 36,
    c_type => 0,
    core_name0 => "complexphasedetector_mult_gen_v12_0_i2",
    extra_registers => 1,
    multsign => 2,
    overflow => 3,
    p_arith => xlSigned,
    p_bin_pt => 17,
    p_width => 18,
    quantization => 2
  )
  port map (
    clr => '0',
    core_clr => '1',
    en => "1",
    rst => "0",
    a => delay1_q_net,
    b => mux19_y_net,
    clk => clk_net,
    ce => ce_net,
    core_clk => clk_net,
    core_ce => ce_net,
    p => mult2_p_net
  );
  mult3 : entity work.complexphasedetector_xlmult 
  generic map (
    a_arith => xlSigned,
    a_bin_pt => 17,
    a_width => 18,
    b_arith => xlUnsigned,
    b_bin_pt => 18,
    b_width => 18,
    c_a_type => 0,
    c_a_width => 18,
    c_b_type => 1,
    c_b_width => 18,
    c_baat => 18,
    c_output_width => 36,
    c_type => 0,
    core_name0 => "complexphasedetector_mult_gen_v12_0_i2",
    extra_registers => 1,
    multsign => 2,
    overflow => 3,
    p_arith => xlSigned,
    p_bin_pt => 17,
    p_width => 18,
    quantization => 2
  )
  port map (
    clr => '0',
    core_clr => '1',
    en => "1",
    rst => "0",
    a => delay2_q_net,
    b => mux19_y_net,
    clk => clk_net,
    ce => ce_net,
    core_clk => clk_net,
    core_ce => ce_net,
    p => mult3_p_net
  );
  mult4 : entity work.complexphasedetector_xlmult 
  generic map (
    a_arith => xlSigned,
    a_bin_pt => 17,
    a_width => 18,
    b_arith => xlUnsigned,
    b_bin_pt => 18,
    b_width => 18,
    c_a_type => 0,
    c_a_width => 18,
    c_b_type => 1,
    c_b_width => 18,
    c_baat => 18,
    c_output_width => 36,
    c_type => 0,
    core_name0 => "complexphasedetector_mult_gen_v12_0_i2",
    extra_registers => 1,
    multsign => 2,
    overflow => 3,
    p_arith => xlSigned,
    p_bin_pt => 17,
    p_width => 18,
    quantization => 2
  )
  port map (
    clr => '0',
    core_clr => '1',
    en => "1",
    rst => "0",
    a => convert1_dout_net,
    b => mux12_y_net,
    clk => clk_net,
    ce => ce_net,
    core_clk => clk_net,
    core_ce => ce_net,
    p => mult4_p_net
  );
  mult5 : entity work.complexphasedetector_xlmult 
  generic map (
    a_arith => xlSigned,
    a_bin_pt => 17,
    a_width => 18,
    b_arith => xlUnsigned,
    b_bin_pt => 18,
    b_width => 18,
    c_a_type => 0,
    c_a_width => 18,
    c_b_type => 1,
    c_b_width => 18,
    c_baat => 18,
    c_output_width => 36,
    c_type => 0,
    core_name0 => "complexphasedetector_mult_gen_v12_0_i2",
    extra_registers => 1,
    multsign => 2,
    overflow => 3,
    p_arith => xlSigned,
    p_bin_pt => 17,
    p_width => 18,
    quantization => 2
  )
  port map (
    clr => '0',
    core_clr => '1',
    en => "1",
    rst => "0",
    a => convert_dout_net,
    b => mux12_y_net,
    clk => clk_net,
    ce => ce_net,
    core_clk => clk_net,
    core_ce => ce_net,
    p => mult5_p_net
  );
  mux12 : entity work.sysgen_mux_5aae7736b5 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    sel => inverter3_op_net,
    d0 => neverzero_y_net,
    d1 => oneminusslave_s_net,
    y => mux12_y_net
  );
  mux18 : entity work.sysgen_mux_27d1a31150 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    sel => overridech_net,
    d0 => diffdb_s_net,
    d1 => mux20_y_net,
    y => mux18_y_net
  );
  mux19 : entity work.sysgen_mux_5aae7736b5 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    sel => inverter3_op_net,
    d0 => oneminusslave_s_net,
    d1 => neverzero_y_net,
    y => mux19_y_net
  );
  mux20 : entity work.sysgen_mux_27d1a31150 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    sel => forcech1_net,
    d0 => high_op_net,
    d1 => high1_op_net,
    y => mux20_y_net
  );
  mux3db : entity work.sysgen_mux_fa91817ce5 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    sel => inverter3_op_net,
    d0 => high2_op_net,
    d1 => high3_op_net,
    y => mux3db_y_net
  );
  mux7 : entity work.sysgen_mux_a7183c054b 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    sel => logical1_y_net,
    d0 => constant4_op_net,
    d1 => constant5_op_net,
    y => mux7_y_net
  );
  mux8 : entity work.sysgen_mux_a7183c054b 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    sel => logical_y_net,
    d0 => constant6_op_net,
    d1 => constant9_op_net,
    y => mux8_y_net
  );
  negate1 : entity work.sysgen_negate_d4654b91e6 
  port map (
    clr => '0',
    ip => addsub_s_net,
    clk => clk_net,
    ce => ce_net,
    op => negate1_op_net
  );
  neverzero : entity work.sysgen_mux_2b331cc834 
  port map (
    clr => '0',
    sel => logical5_y_net,
    d0 => addsub1_s_net,
    d1 => delay13_q_net,
    clk => clk_net,
    ce => ce_net,
    y => neverzero_y_net
  );
  one : entity work.sysgen_constant_5d5481aa29 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op(0) => one_op_net
  );
  oneminusslave : entity work.complexphasedetector_xladdsub 
  generic map (
    a_arith => xlUnsigned,
    a_bin_pt => 18,
    a_width => 18,
    b_arith => xlUnsigned,
    b_bin_pt => 18,
    b_width => 18,
    c_has_c_out => 0,
    c_latency => 0,
    c_output_width => 19,
    core_name0 => "complexphasedetector_c_addsub_v12_0_i5",
    extra_registers => 0,
    full_s_arith => 2,
    full_s_width => 19,
    latency => 0,
    overflow => 1,
    quantization => 1,
    s_arith => xlUnsigned,
    s_bin_pt => 18,
    s_width => 18
  )
  port map (
    clr => '0',
    en => "1",
    a => constant3_op_net,
    b => neverzero_y_net,
    clk => clk_net,
    ce => ce_net,
    s => oneminusslave_s_net
  );
  phase_detect_x0 : entity work.xlcomplex_multiplier_d1a037fb642eca126850bf3024a4629f 
  port map (
    s_axis_a_tvalid => int_offset_mixer_m_axis_dout_tvalid_net,
    s_axis_a_tdata_imag => delay2_q_net,
    s_axis_a_tdata_real => delay1_q_net,
    s_axis_b_tvalid => int_offset_mixer_m_axis_dout_tvalid_net,
    s_axis_b_tdata_imag => conju_gate_op_net,
    s_axis_b_tdata_real => convert1_dout_net,
    rst => inverter1_op_net(0),
    clk => clk_net,
    ce => ce_net,
    m_axis_dout_tvalid => phase_detect_m_axis_dout_tvalid_net,
    m_axis_dout_tdata_imag => phase_detect_m_axis_dout_tdata_imag_net,
    m_axis_dout_tdata_real => phase_detect_m_axis_dout_tdata_real_net
  );
  real1msb : entity work.complexphasedetector_xlslice 
  generic map (
    new_lsb => 17,
    new_msb => 17,
    x_width => 18,
    y_width => 1
  )
  port map (
    x => delay1_q_net,
    y => real1msb_y_net
  );
  real2msb : entity work.complexphasedetector_xlslice 
  generic map (
    new_lsb => 17,
    new_msb => 17,
    x_width => 18,
    y_width => 1
  )
  port map (
    x => convert1_dout_net,
    y => real2msb_y_net
  );
  relational : entity work.sysgen_relational_8716b57448 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    a => lockreal_s_net,
    b => lockreal1_s_net,
    op => relational_op_net
  );
  relational1 : entity work.sysgen_relational_8716b57448 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    a => lockreal_s_net_x0,
    b => lockreal1_s_net,
    op => relational1_op_net
  );
  signdiff : entity work.complexphasedetector_xlslice 
  generic map (
    new_lsb => 17,
    new_msb => 17,
    x_width => 18,
    y_width => 1
  )
  port map (
    x => mult1_p_net,
    y => signdiff_y_net
  );
  db_offset : entity work.sysgen_constant_6054839358 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => db_offset_op_net
  );
end structural;
-- Generated from Simulink block 
library IEEE;
use IEEE.std_logic_1164.all;
library work;
use work.conv_pkg.all;
entity complexphasedetector_default_clock_driver is
  port (
    complexphasedetector_sysclk : in std_logic;
    complexphasedetector_sysce : in std_logic;
    complexphasedetector_sysclr : in std_logic;
    complexphasedetector_clk1 : out std_logic;
    complexphasedetector_ce1 : out std_logic
  );
end complexphasedetector_default_clock_driver;
architecture structural of complexphasedetector_default_clock_driver is 
begin
  clockdriver : entity work.xlclockdriver 
  generic map (
    period => 1,
    log_2_period => 1
  )
  port map (
    sysclk => complexphasedetector_sysclk,
    sysce => complexphasedetector_sysce,
    sysclr => complexphasedetector_sysclr,
    clk => complexphasedetector_clk1,
    ce => complexphasedetector_ce1
  );
end structural;
-- Generated from Simulink block 
library IEEE;
use IEEE.std_logic_1164.all;
library work;
use work.conv_pkg.all;
entity complexphasedetector is
  port (
    ch1agc : in std_logic_vector( 13-1 downto 0 );
    ch1imag : in std_logic_vector( 18-1 downto 0 );
    ch1real : in std_logic_vector( 18-1 downto 0 );
    ch2agc : in std_logic_vector( 13-1 downto 0 );
    ch2imag : in std_logic_vector( 18-1 downto 0 );
    ch2real : in std_logic_vector( 18-1 downto 0 );
    enmasterswitching : in std_logic;
    forcech1 : in std_logic;
    lag_coef : in std_logic_vector( 18-1 downto 0 );
    lead_coef : in std_logic_vector( 18-1 downto 0 );
    lockhysterisis : in std_logic_vector( 13-1 downto 0 );
    lockthreshold : in std_logic_vector( 13-1 downto 0 );
    overridech : in std_logic;
    reset : in std_logic;
    sweeplmt : in std_logic_vector( 15-1 downto 0 );
    swprate : in std_logic_vector( 18-1 downto 0 );
    db_range : in std_logic_vector( 16-1 downto 0 );
    clk : in std_logic;
    ch1ismaster : out std_logic;
    gainoutmax : out std_logic_vector( 18-1 downto 0 );
    gainoutmin : out std_logic_vector( 18-1 downto 0 );
    imaglock : out std_logic_vector( 13-1 downto 0 );
    imagout : out std_logic_vector( 18-1 downto 0 );
    imagxord : out std_logic;
    lag_out : out std_logic_vector( 32-1 downto 0 );
    locked : out std_logic;
    maximagout : out std_logic_vector( 18-1 downto 0 );
    maxrealout : out std_logic_vector( 18-1 downto 0 );
    minimagout : out std_logic_vector( 18-1 downto 0 );
    minrealout : out std_logic_vector( 18-1 downto 0 );
    nco_control_out : out std_logic_vector( 22-1 downto 0 );
    phase_detect : out std_logic_vector( 18-1 downto 0 );
    power : out std_logic_vector( 18-1 downto 0 );
    reallock : out std_logic_vector( 13-1 downto 0 );
    realout : out std_logic_vector( 18-1 downto 0 );
    realxord : out std_logic
  );
end complexphasedetector;
architecture structural of complexphasedetector is 
  attribute core_generation_info : string;
  attribute core_generation_info of structural : architecture is "complexphasedetector,sysgen_core_2016_4,{,compilation=IP Catalog,block_icon_display=Default,family=kintex7,part=xc7k325t,speed=-2,package=fbg676,synthesis_language=vhdl,hdl_library=work,synthesis_strategy=Vivado Synthesis Defaults,implementation_strategy=Vivado Implementation Defaults,testbench=0,interface_doc=1,ce_clr=0,clock_period=21.4286,system_simulink_period=2.14286e-008,waveform_viewer=0,axilite_interface=0,ip_catalog_plugin=0,hwcosim_burst_mode=0,simulation_time=0.05,accum=1,addsub=120,assert=1,cmpy_v6_0=2,constant=62,convert=6,delay=20,inv=41,logical=12,mult=8,mux=33,negate=10,reinterpret=1,relational=7,shift=70,slice=46,}";
  signal ce_1_net : std_logic;
  signal clk_1_net : std_logic;
begin
  complexphasedetector_default_clock_driver : entity work.complexphasedetector_default_clock_driver 
  port map (
    complexphasedetector_sysclk => clk,
    complexphasedetector_sysce => '1',
    complexphasedetector_sysclr => '0',
    complexphasedetector_clk1 => clk_1_net,
    complexphasedetector_ce1 => ce_1_net
  );
  complexphasedetector_struct : entity work.complexphasedetector_struct 
  port map (
    ch1agc => ch1agc,
    ch1imag => ch1imag,
    ch1real => ch1real,
    ch2agc => ch2agc,
    ch2imag => ch2imag,
    ch2real => ch2real,
    enmasterswitching(0) => enmasterswitching,
    forcech1(0) => forcech1,
    lag_coef => lag_coef,
    lead_coef => lead_coef,
    lockhysterisis => lockhysterisis,
    lockthreshold => lockthreshold,
    overridech(0) => overridech,
    reset(0) => reset,
    sweeplmt => sweeplmt,
    swprate => swprate,
    db_range => db_range,
    clk_1 => clk_1_net,
    ce_1 => ce_1_net,
    ch1ismaster(0) => ch1ismaster,
    gainoutmax => gainoutmax,
    gainoutmin => gainoutmin,
    imaglock => imaglock,
    imagout => imagout,
    imagxord(0) => imagxord,
    lag_out => lag_out,
    locked(0) => locked,
    maximagout => maximagout,
    maxrealout => maxrealout,
    minimagout => minimagout,
    minrealout => minrealout,
    nco_control_out => nco_control_out,
    phase_detect => phase_detect,
    power => power,
    reallock => reallock,
    realout => realout,
    realxord(0) => realxord
  );
end structural;
