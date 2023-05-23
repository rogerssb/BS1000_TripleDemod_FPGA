-- Generated from Simulink block CORDIC PE1
library IEEE;
use IEEE.std_logic_1164.all;
library work;
use work.conv_pkg.all;
entity complexphasedetectorswap_cordic_pe1_x1 is
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
end complexphasedetectorswap_cordic_pe1_x1;
architecture structural of complexphasedetectorswap_cordic_pe1_x1 is 
  signal addsub2_s_net : std_logic_vector( 21-1 downto 0 );
  signal constant_op_net : std_logic_vector( 21-1 downto 0 );
  signal constant1_op_net : std_logic_vector( 21-1 downto 0 );
  signal addsub1_s_net : std_logic_vector( 21-1 downto 0 );
  signal addsub_s_net : std_logic_vector( 21-1 downto 0 );
  signal mux_y_net : std_logic_vector( 21-1 downto 0 );
  signal clk_net : std_logic;
  signal shift1_op_net : std_logic_vector( 21-1 downto 0 );
  signal constant_op_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal shift_op_net : std_logic_vector( 21-1 downto 0 );
  signal slice_y_net : std_logic_vector( 1-1 downto 0 );
  signal ce_net : std_logic;
  signal inverter_op_net : std_logic_vector( 1-1 downto 0 );
begin
  x_x0 <= addsub_s_net;
  y_x0 <= addsub1_s_net;
  z_x0 <= addsub2_s_net;
  constant_op_net <= x;
  constant1_op_net <= y;
  mux_y_net <= z;
  clk_net <= clk_1;
  ce_net <= ce_1;
  addsub : entity work.sysgen_addsub_f5a65f010a 
  port map (
    clr => '0',
    a => constant_op_net,
    b => shift1_op_net,
    mode => inverter_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub_s_net
  );
  addsub1 : entity work.sysgen_addsub_f5a65f010a 
  port map (
    clr => '0',
    a => constant1_op_net,
    b => shift_op_net,
    mode => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub1_s_net
  );
  addsub2 : entity work.sysgen_addsub_f5a65f010a 
  port map (
    clr => '0',
    a => mux_y_net,
    b => constant_op_net_x0,
    mode => inverter_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub2_s_net
  );
  constant_x0 : entity work.sysgen_constant_95d05a214e 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net_x0
  );
  inverter : entity work.sysgen_inverter_962a38e1c8 
  port map (
    clr => '0',
    ip => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    op => inverter_op_net
  );
  shift : entity work.sysgen_shift_52faab0184 
  port map (
    clk => '1',
    ce => '1',
    clr => '0',
    ip => constant_op_net,
    op => shift_op_net
  );
  shift1 : entity work.sysgen_shift_52faab0184 
  port map (
    clk => '1',
    ce => '1',
    clr => '0',
    ip => constant1_op_net,
    op => shift1_op_net
  );
  slice : entity work.complexphasedetectorswap_xlslice 
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
-- Generated from Simulink block CORDIC PE10
library IEEE;
use IEEE.std_logic_1164.all;
library work;
use work.conv_pkg.all;
entity complexphasedetectorswap_cordic_pe10 is
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
end complexphasedetectorswap_cordic_pe10;
architecture structural of complexphasedetectorswap_cordic_pe10 is 
  signal addsub_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal addsub1_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal constant_op_net : std_logic_vector( 21-1 downto 0 );
  signal addsub2_s_net : std_logic_vector( 21-1 downto 0 );
  signal addsub1_s_net : std_logic_vector( 21-1 downto 0 );
  signal shift_op_net : std_logic_vector( 21-1 downto 0 );
  signal addsub2_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal ce_net : std_logic;
  signal addsub_s_net : std_logic_vector( 21-1 downto 0 );
  signal inverter_op_net : std_logic_vector( 1-1 downto 0 );
  signal shift1_op_net : std_logic_vector( 21-1 downto 0 );
  signal slice_y_net : std_logic_vector( 1-1 downto 0 );
  signal clk_net : std_logic;
begin
  x_x0 <= addsub_s_net_x0;
  y_x0 <= addsub1_s_net_x0;
  z_x0 <= addsub2_s_net_x0;
  addsub_s_net <= x;
  addsub1_s_net <= y;
  addsub2_s_net <= z;
  clk_net <= clk_1;
  ce_net <= ce_1;
  addsub : entity work.sysgen_addsub_f5a65f010a 
  port map (
    clr => '0',
    a => addsub_s_net,
    b => shift1_op_net,
    mode => inverter_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub_s_net_x0
  );
  addsub1 : entity work.sysgen_addsub_f5a65f010a 
  port map (
    clr => '0',
    a => addsub1_s_net,
    b => shift_op_net,
    mode => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub1_s_net_x0
  );
  addsub2 : entity work.sysgen_addsub_f5a65f010a 
  port map (
    clr => '0',
    a => addsub2_s_net,
    b => constant_op_net,
    mode => inverter_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub2_s_net_x0
  );
  constant_x0 : entity work.sysgen_constant_c2c702ee2d 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  inverter : entity work.sysgen_inverter_962a38e1c8 
  port map (
    clr => '0',
    ip => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    op => inverter_op_net
  );
  shift : entity work.sysgen_shift_d3d79dc856 
  port map (
    clr => '0',
    ip => addsub_s_net,
    clk => clk_net,
    ce => ce_net,
    op => shift_op_net
  );
  shift1 : entity work.sysgen_shift_d3d79dc856 
  port map (
    clr => '0',
    ip => addsub1_s_net,
    clk => clk_net,
    ce => ce_net,
    op => shift1_op_net
  );
  slice : entity work.complexphasedetectorswap_xlslice 
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
-- Generated from Simulink block CORDIC PE11
library IEEE;
use IEEE.std_logic_1164.all;
library work;
use work.conv_pkg.all;
entity complexphasedetectorswap_cordic_pe11 is
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
end complexphasedetectorswap_cordic_pe11;
architecture structural of complexphasedetectorswap_cordic_pe11 is 
  signal addsub_s_net : std_logic_vector( 21-1 downto 0 );
  signal shift1_op_net : std_logic_vector( 21-1 downto 0 );
  signal addsub2_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal addsub1_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal addsub1_s_net : std_logic_vector( 21-1 downto 0 );
  signal ce_net : std_logic;
  signal inverter_op_net : std_logic_vector( 1-1 downto 0 );
  signal slice_y_net : std_logic_vector( 1-1 downto 0 );
  signal addsub2_s_net : std_logic_vector( 21-1 downto 0 );
  signal constant_op_net : std_logic_vector( 21-1 downto 0 );
  signal clk_net : std_logic;
  signal shift_op_net : std_logic_vector( 21-1 downto 0 );
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
  addsub : entity work.sysgen_addsub_f5a65f010a 
  port map (
    clr => '0',
    a => addsub_s_net_x0,
    b => shift1_op_net,
    mode => inverter_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub_s_net
  );
  addsub1 : entity work.sysgen_addsub_f5a65f010a 
  port map (
    clr => '0',
    a => addsub1_s_net_x0,
    b => shift_op_net,
    mode => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub1_s_net
  );
  addsub2 : entity work.sysgen_addsub_f5a65f010a 
  port map (
    clr => '0',
    a => addsub2_s_net_x0,
    b => constant_op_net,
    mode => inverter_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub2_s_net
  );
  constant_x0 : entity work.sysgen_constant_3c854d5995 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  inverter : entity work.sysgen_inverter_962a38e1c8 
  port map (
    clr => '0',
    ip => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    op => inverter_op_net
  );
  shift : entity work.sysgen_shift_e72705e197 
  port map (
    clr => '0',
    ip => addsub_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift_op_net
  );
  shift1 : entity work.sysgen_shift_e72705e197 
  port map (
    clr => '0',
    ip => addsub1_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift1_op_net
  );
  slice : entity work.complexphasedetectorswap_xlslice 
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
-- Generated from Simulink block CORDIC PE12
library IEEE;
use IEEE.std_logic_1164.all;
library work;
use work.conv_pkg.all;
entity complexphasedetectorswap_cordic_pe12 is
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
end complexphasedetectorswap_cordic_pe12;
architecture structural of complexphasedetectorswap_cordic_pe12 is 
  signal addsub_s_net : std_logic_vector( 21-1 downto 0 );
  signal shift_op_net : std_logic_vector( 21-1 downto 0 );
  signal slice_y_net : std_logic_vector( 1-1 downto 0 );
  signal addsub1_s_net : std_logic_vector( 21-1 downto 0 );
  signal constant_op_net : std_logic_vector( 21-1 downto 0 );
  signal shift1_op_net : std_logic_vector( 21-1 downto 0 );
  signal addsub_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal addsub2_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal addsub2_s_net : std_logic_vector( 21-1 downto 0 );
  signal ce_net : std_logic;
  signal addsub1_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal clk_net : std_logic;
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
  addsub : entity work.sysgen_addsub_f5a65f010a 
  port map (
    clr => '0',
    a => addsub_s_net_x0,
    b => shift1_op_net,
    mode => inverter_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub_s_net
  );
  addsub1 : entity work.sysgen_addsub_f5a65f010a 
  port map (
    clr => '0',
    a => addsub1_s_net_x0,
    b => shift_op_net,
    mode => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub1_s_net
  );
  addsub2 : entity work.sysgen_addsub_f5a65f010a 
  port map (
    clr => '0',
    a => addsub2_s_net_x0,
    b => constant_op_net,
    mode => inverter_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub2_s_net
  );
  constant_x0 : entity work.sysgen_constant_b3a23cd7f8 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  inverter : entity work.sysgen_inverter_962a38e1c8 
  port map (
    clr => '0',
    ip => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    op => inverter_op_net
  );
  shift : entity work.sysgen_shift_f6320478c4 
  port map (
    clr => '0',
    ip => addsub_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift_op_net
  );
  shift1 : entity work.sysgen_shift_f6320478c4 
  port map (
    clr => '0',
    ip => addsub1_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift1_op_net
  );
  slice : entity work.complexphasedetectorswap_xlslice 
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
-- Generated from Simulink block CORDIC PE13
library IEEE;
use IEEE.std_logic_1164.all;
library work;
use work.conv_pkg.all;
entity complexphasedetectorswap_cordic_pe13 is
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
end complexphasedetectorswap_cordic_pe13;
architecture structural of complexphasedetectorswap_cordic_pe13 is 
  signal addsub_s_net : std_logic_vector( 21-1 downto 0 );
  signal clk_net : std_logic;
  signal addsub1_s_net : std_logic_vector( 21-1 downto 0 );
  signal addsub_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal addsub2_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal addsub1_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal ce_net : std_logic;
  signal addsub2_s_net : std_logic_vector( 21-1 downto 0 );
  signal slice_y_net : std_logic_vector( 1-1 downto 0 );
  signal inverter_op_net : std_logic_vector( 1-1 downto 0 );
  signal shift_op_net : std_logic_vector( 21-1 downto 0 );
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
  addsub : entity work.sysgen_addsub_f5a65f010a 
  port map (
    clr => '0',
    a => addsub_s_net_x0,
    b => shift1_op_net,
    mode => inverter_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub_s_net
  );
  addsub1 : entity work.sysgen_addsub_f5a65f010a 
  port map (
    clr => '0',
    a => addsub1_s_net_x0,
    b => shift_op_net,
    mode => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub1_s_net
  );
  addsub2 : entity work.sysgen_addsub_f5a65f010a 
  port map (
    clr => '0',
    a => addsub2_s_net_x0,
    b => constant_op_net,
    mode => inverter_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub2_s_net
  );
  constant_x0 : entity work.sysgen_constant_f7a04a812a 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  inverter : entity work.sysgen_inverter_962a38e1c8 
  port map (
    clr => '0',
    ip => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    op => inverter_op_net
  );
  shift : entity work.sysgen_shift_d530c922d4 
  port map (
    clr => '0',
    ip => addsub_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift_op_net
  );
  shift1 : entity work.sysgen_shift_d530c922d4 
  port map (
    clr => '0',
    ip => addsub1_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift1_op_net
  );
  slice : entity work.complexphasedetectorswap_xlslice 
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
-- Generated from Simulink block CORDIC PE14
library IEEE;
use IEEE.std_logic_1164.all;
library work;
use work.conv_pkg.all;
entity complexphasedetectorswap_cordic_pe14 is
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
end complexphasedetectorswap_cordic_pe14;
architecture structural of complexphasedetectorswap_cordic_pe14 is 
  signal addsub_s_net : std_logic_vector( 21-1 downto 0 );
  signal addsub1_s_net : std_logic_vector( 21-1 downto 0 );
  signal addsub_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal addsub1_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal addsub2_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal addsub2_s_net : std_logic_vector( 21-1 downto 0 );
  signal ce_net : std_logic;
  signal clk_net : std_logic;
  signal constant_op_net : std_logic_vector( 21-1 downto 0 );
  signal shift1_op_net : std_logic_vector( 21-1 downto 0 );
  signal slice_y_net : std_logic_vector( 1-1 downto 0 );
  signal inverter_op_net : std_logic_vector( 1-1 downto 0 );
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
  addsub : entity work.sysgen_addsub_f5a65f010a 
  port map (
    clr => '0',
    a => addsub_s_net_x0,
    b => shift1_op_net,
    mode => inverter_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub_s_net
  );
  addsub1 : entity work.sysgen_addsub_f5a65f010a 
  port map (
    clr => '0',
    a => addsub1_s_net_x0,
    b => shift_op_net,
    mode => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub1_s_net
  );
  addsub2 : entity work.sysgen_addsub_f5a65f010a 
  port map (
    clr => '0',
    a => addsub2_s_net_x0,
    b => constant_op_net,
    mode => inverter_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub2_s_net
  );
  constant_x0 : entity work.sysgen_constant_91f2f3a7f5 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  inverter : entity work.sysgen_inverter_962a38e1c8 
  port map (
    clr => '0',
    ip => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    op => inverter_op_net
  );
  shift : entity work.sysgen_shift_294e1fd787 
  port map (
    clr => '0',
    ip => addsub_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift_op_net
  );
  shift1 : entity work.sysgen_shift_294e1fd787 
  port map (
    clr => '0',
    ip => addsub1_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift1_op_net
  );
  slice : entity work.complexphasedetectorswap_xlslice 
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
-- Generated from Simulink block CORDIC PE15
library IEEE;
use IEEE.std_logic_1164.all;
library work;
use work.conv_pkg.all;
entity complexphasedetectorswap_cordic_pe15 is
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
end complexphasedetectorswap_cordic_pe15;
architecture structural of complexphasedetectorswap_cordic_pe15 is 
  signal shift_op_net : std_logic_vector( 21-1 downto 0 );
  signal slice_y_net : std_logic_vector( 1-1 downto 0 );
  signal shift1_op_net : std_logic_vector( 21-1 downto 0 );
  signal constant_op_net : std_logic_vector( 21-1 downto 0 );
  signal inverter_op_net : std_logic_vector( 1-1 downto 0 );
  signal addsub_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal clk_net : std_logic;
  signal addsub_s_net : std_logic_vector( 21-1 downto 0 );
  signal ce_net : std_logic;
  signal addsub1_s_net : std_logic_vector( 21-1 downto 0 );
  signal addsub1_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal addsub2_s_net_x0 : std_logic_vector( 21-1 downto 0 );
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
  addsub : entity work.sysgen_addsub_f5a65f010a 
  port map (
    clr => '0',
    a => addsub_s_net_x0,
    b => shift1_op_net,
    mode => inverter_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub_s_net
  );
  addsub1 : entity work.sysgen_addsub_f5a65f010a 
  port map (
    clr => '0',
    a => addsub1_s_net_x0,
    b => shift_op_net,
    mode => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub1_s_net
  );
  addsub2 : entity work.sysgen_addsub_f5a65f010a 
  port map (
    clr => '0',
    a => addsub2_s_net_x0,
    b => constant_op_net,
    mode => inverter_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub2_s_net
  );
  constant_x0 : entity work.sysgen_constant_90c8681005 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  inverter : entity work.sysgen_inverter_962a38e1c8 
  port map (
    clr => '0',
    ip => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    op => inverter_op_net
  );
  shift : entity work.sysgen_shift_2576158b81 
  port map (
    clr => '0',
    ip => addsub_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift_op_net
  );
  shift1 : entity work.sysgen_shift_2576158b81 
  port map (
    clr => '0',
    ip => addsub1_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift1_op_net
  );
  slice : entity work.complexphasedetectorswap_xlslice 
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
-- Generated from Simulink block CORDIC PE16
library IEEE;
use IEEE.std_logic_1164.all;
library work;
use work.conv_pkg.all;
entity complexphasedetectorswap_cordic_pe16 is
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
end complexphasedetectorswap_cordic_pe16;
architecture structural of complexphasedetectorswap_cordic_pe16 is 
  signal addsub2_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal addsub_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal addsub1_s_net : std_logic_vector( 21-1 downto 0 );
  signal ce_net : std_logic;
  signal shift1_op_net : std_logic_vector( 21-1 downto 0 );
  signal clk_net : std_logic;
  signal inverter_op_net : std_logic_vector( 1-1 downto 0 );
  signal shift_op_net : std_logic_vector( 21-1 downto 0 );
  signal slice_y_net : std_logic_vector( 1-1 downto 0 );
  signal addsub2_s_net : std_logic_vector( 21-1 downto 0 );
  signal addsub_s_net : std_logic_vector( 21-1 downto 0 );
  signal addsub1_s_net_x0 : std_logic_vector( 21-1 downto 0 );
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
  addsub : entity work.sysgen_addsub_f5a65f010a 
  port map (
    clr => '0',
    a => addsub_s_net_x0,
    b => shift1_op_net,
    mode => inverter_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub_s_net
  );
  addsub1 : entity work.sysgen_addsub_f5a65f010a 
  port map (
    clr => '0',
    a => addsub1_s_net_x0,
    b => shift_op_net,
    mode => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub1_s_net
  );
  addsub2 : entity work.sysgen_addsub_f5a65f010a 
  port map (
    clr => '0',
    a => addsub2_s_net_x0,
    b => constant_op_net,
    mode => inverter_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub2_s_net
  );
  constant_x0 : entity work.sysgen_constant_0bc3b7abba 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  inverter : entity work.sysgen_inverter_962a38e1c8 
  port map (
    clr => '0',
    ip => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    op => inverter_op_net
  );
  shift : entity work.sysgen_shift_d8b2048fe7 
  port map (
    clr => '0',
    ip => addsub_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift_op_net
  );
  shift1 : entity work.sysgen_shift_d8b2048fe7 
  port map (
    clr => '0',
    ip => addsub1_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift1_op_net
  );
  slice : entity work.complexphasedetectorswap_xlslice 
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
-- Generated from Simulink block CORDIC PE17
library IEEE;
use IEEE.std_logic_1164.all;
library work;
use work.conv_pkg.all;
entity complexphasedetectorswap_cordic_pe17 is
  port (
    x : in std_logic_vector( 21-1 downto 0 );
    y : in std_logic_vector( 21-1 downto 0 );
    z : in std_logic_vector( 21-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    x_x0 : out std_logic_vector( 21-1 downto 0 );
    y_x0 : out std_logic_vector( 21-1 downto 0 )
  );
end complexphasedetectorswap_cordic_pe17;
architecture structural of complexphasedetectorswap_cordic_pe17 is 
  signal addsub_s_net : std_logic_vector( 21-1 downto 0 );
  signal addsub1_s_net : std_logic_vector( 21-1 downto 0 );
  signal addsub_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal addsub2_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal addsub1_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal inverter_op_net : std_logic_vector( 1-1 downto 0 );
  signal shift_op_net : std_logic_vector( 21-1 downto 0 );
  signal slice_y_net : std_logic_vector( 1-1 downto 0 );
  signal shift1_op_net : std_logic_vector( 21-1 downto 0 );
begin
  x_x0 <= addsub_s_net;
  y_x0 <= addsub1_s_net;
  addsub_s_net_x0 <= x;
  addsub1_s_net_x0 <= y;
  addsub2_s_net_x0 <= z;
  clk_net <= clk_1;
  ce_net <= ce_1;
  addsub : entity work.sysgen_addsub_f5a65f010a 
  port map (
    clr => '0',
    a => addsub_s_net_x0,
    b => shift1_op_net,
    mode => inverter_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub_s_net
  );
  addsub1 : entity work.sysgen_addsub_f5a65f010a 
  port map (
    clr => '0',
    a => addsub1_s_net_x0,
    b => shift_op_net,
    mode => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub1_s_net
  );
  inverter : entity work.sysgen_inverter_962a38e1c8 
  port map (
    clr => '0',
    ip => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    op => inverter_op_net
  );
  shift : entity work.sysgen_shift_66e2ae0031 
  port map (
    clr => '0',
    ip => addsub_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift_op_net
  );
  shift1 : entity work.sysgen_shift_66e2ae0031 
  port map (
    clr => '0',
    ip => addsub1_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift1_op_net
  );
  slice : entity work.complexphasedetectorswap_xlslice 
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
-- Generated from Simulink block CORDIC PE2
library IEEE;
use IEEE.std_logic_1164.all;
library work;
use work.conv_pkg.all;
entity complexphasedetectorswap_cordic_pe2_x0 is
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
end complexphasedetectorswap_cordic_pe2_x0;
architecture structural of complexphasedetectorswap_cordic_pe2_x0 is 
  signal constant_op_net : std_logic_vector( 21-1 downto 0 );
  signal addsub_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal addsub2_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal shift1_op_net : std_logic_vector( 21-1 downto 0 );
  signal slice_y_net : std_logic_vector( 1-1 downto 0 );
  signal clk_net : std_logic;
  signal addsub2_s_net : std_logic_vector( 21-1 downto 0 );
  signal addsub1_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal ce_net : std_logic;
  signal inverter_op_net : std_logic_vector( 1-1 downto 0 );
  signal shift_op_net : std_logic_vector( 21-1 downto 0 );
  signal addsub_s_net : std_logic_vector( 21-1 downto 0 );
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
  addsub : entity work.sysgen_addsub_f5a65f010a 
  port map (
    clr => '0',
    a => addsub_s_net_x0,
    b => shift1_op_net,
    mode => inverter_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub_s_net
  );
  addsub1 : entity work.sysgen_addsub_f5a65f010a 
  port map (
    clr => '0',
    a => addsub1_s_net_x0,
    b => shift_op_net,
    mode => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub1_s_net
  );
  addsub2 : entity work.sysgen_addsub_f5a65f010a 
  port map (
    clr => '0',
    a => addsub2_s_net_x0,
    b => constant_op_net,
    mode => inverter_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub2_s_net
  );
  constant_x0 : entity work.sysgen_constant_dd916d685b 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  inverter : entity work.sysgen_inverter_962a38e1c8 
  port map (
    clr => '0',
    ip => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    op => inverter_op_net
  );
  shift : entity work.sysgen_shift_74cef34337 
  port map (
    clr => '0',
    ip => addsub_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift_op_net
  );
  shift1 : entity work.sysgen_shift_74cef34337 
  port map (
    clr => '0',
    ip => addsub1_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift1_op_net
  );
  slice : entity work.complexphasedetectorswap_xlslice 
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
-- Generated from Simulink block CORDIC PE3
library IEEE;
use IEEE.std_logic_1164.all;
library work;
use work.conv_pkg.all;
entity complexphasedetectorswap_cordic_pe3_x0 is
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
end complexphasedetectorswap_cordic_pe3_x0;
architecture structural of complexphasedetectorswap_cordic_pe3_x0 is 
  signal addsub1_s_net : std_logic_vector( 21-1 downto 0 );
  signal addsub_s_net : std_logic_vector( 21-1 downto 0 );
  signal shift1_op_net : std_logic_vector( 21-1 downto 0 );
  signal clk_net : std_logic;
  signal addsub2_s_net : std_logic_vector( 21-1 downto 0 );
  signal addsub_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal shift_op_net : std_logic_vector( 21-1 downto 0 );
  signal inverter_op_net : std_logic_vector( 1-1 downto 0 );
  signal addsub1_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal ce_net : std_logic;
  signal slice_y_net : std_logic_vector( 1-1 downto 0 );
  signal constant_op_net : std_logic_vector( 21-1 downto 0 );
  signal addsub2_s_net_x0 : std_logic_vector( 21-1 downto 0 );
begin
  x_x0 <= addsub_s_net;
  y_x0 <= addsub1_s_net;
  z_x0 <= addsub2_s_net;
  addsub_s_net_x0 <= x;
  addsub1_s_net_x0 <= y;
  addsub2_s_net_x0 <= z;
  clk_net <= clk_1;
  ce_net <= ce_1;
  addsub : entity work.sysgen_addsub_f5a65f010a 
  port map (
    clr => '0',
    a => addsub_s_net_x0,
    b => shift1_op_net,
    mode => inverter_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub_s_net
  );
  addsub1 : entity work.sysgen_addsub_f5a65f010a 
  port map (
    clr => '0',
    a => addsub1_s_net_x0,
    b => shift_op_net,
    mode => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub1_s_net
  );
  addsub2 : entity work.sysgen_addsub_f5a65f010a 
  port map (
    clr => '0',
    a => addsub2_s_net_x0,
    b => constant_op_net,
    mode => inverter_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub2_s_net
  );
  constant_x0 : entity work.sysgen_constant_01578f1ab8 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  inverter : entity work.sysgen_inverter_962a38e1c8 
  port map (
    clr => '0',
    ip => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    op => inverter_op_net
  );
  shift : entity work.sysgen_shift_19e82f2d27 
  port map (
    clr => '0',
    ip => addsub_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift_op_net
  );
  shift1 : entity work.sysgen_shift_19e82f2d27 
  port map (
    clr => '0',
    ip => addsub1_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift1_op_net
  );
  slice : entity work.complexphasedetectorswap_xlslice 
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
-- Generated from Simulink block CORDIC PE4
library IEEE;
use IEEE.std_logic_1164.all;
library work;
use work.conv_pkg.all;
entity complexphasedetectorswap_cordic_pe4_x0 is
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
end complexphasedetectorswap_cordic_pe4_x0;
architecture structural of complexphasedetectorswap_cordic_pe4_x0 is 
  signal addsub2_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal clk_net : std_logic;
  signal addsub1_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal addsub2_s_net : std_logic_vector( 21-1 downto 0 );
  signal addsub_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal inverter_op_net : std_logic_vector( 1-1 downto 0 );
  signal shift_op_net : std_logic_vector( 21-1 downto 0 );
  signal slice_y_net : std_logic_vector( 1-1 downto 0 );
  signal ce_net : std_logic;
  signal constant_op_net : std_logic_vector( 21-1 downto 0 );
  signal shift1_op_net : std_logic_vector( 21-1 downto 0 );
  signal addsub_s_net : std_logic_vector( 21-1 downto 0 );
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
  addsub : entity work.sysgen_addsub_f5a65f010a 
  port map (
    clr => '0',
    a => addsub_s_net_x0,
    b => shift1_op_net,
    mode => inverter_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub_s_net
  );
  addsub1 : entity work.sysgen_addsub_f5a65f010a 
  port map (
    clr => '0',
    a => addsub1_s_net_x0,
    b => shift_op_net,
    mode => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub1_s_net
  );
  addsub2 : entity work.sysgen_addsub_f5a65f010a 
  port map (
    clr => '0',
    a => addsub2_s_net_x0,
    b => constant_op_net,
    mode => inverter_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub2_s_net
  );
  constant_x0 : entity work.sysgen_constant_dd9ca53c6d 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  inverter : entity work.sysgen_inverter_962a38e1c8 
  port map (
    clr => '0',
    ip => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    op => inverter_op_net
  );
  shift : entity work.sysgen_shift_4cc720ff32 
  port map (
    clr => '0',
    ip => addsub_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift_op_net
  );
  shift1 : entity work.sysgen_shift_4cc720ff32 
  port map (
    clr => '0',
    ip => addsub1_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift1_op_net
  );
  slice : entity work.complexphasedetectorswap_xlslice 
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
-- Generated from Simulink block CORDIC PE5
library IEEE;
use IEEE.std_logic_1164.all;
library work;
use work.conv_pkg.all;
entity complexphasedetectorswap_cordic_pe5_x0 is
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
end complexphasedetectorswap_cordic_pe5_x0;
architecture structural of complexphasedetectorswap_cordic_pe5_x0 is 
  signal addsub_s_net : std_logic_vector( 21-1 downto 0 );
  signal addsub2_s_net : std_logic_vector( 21-1 downto 0 );
  signal addsub1_s_net : std_logic_vector( 21-1 downto 0 );
  signal addsub_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal addsub2_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal addsub1_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal clk_net : std_logic;
  signal shift1_op_net : std_logic_vector( 21-1 downto 0 );
  signal slice_y_net : std_logic_vector( 1-1 downto 0 );
  signal inverter_op_net : std_logic_vector( 1-1 downto 0 );
  signal shift_op_net : std_logic_vector( 21-1 downto 0 );
  signal ce_net : std_logic;
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
  addsub : entity work.sysgen_addsub_f5a65f010a 
  port map (
    clr => '0',
    a => addsub_s_net_x0,
    b => shift1_op_net,
    mode => inverter_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub_s_net
  );
  addsub1 : entity work.sysgen_addsub_f5a65f010a 
  port map (
    clr => '0',
    a => addsub1_s_net_x0,
    b => shift_op_net,
    mode => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub1_s_net
  );
  addsub2 : entity work.sysgen_addsub_f5a65f010a 
  port map (
    clr => '0',
    a => addsub2_s_net_x0,
    b => constant_op_net,
    mode => inverter_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub2_s_net
  );
  constant_x0 : entity work.sysgen_constant_d35c73d5e3 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  inverter : entity work.sysgen_inverter_962a38e1c8 
  port map (
    clr => '0',
    ip => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    op => inverter_op_net
  );
  shift : entity work.sysgen_shift_b17afba2f9 
  port map (
    clr => '0',
    ip => addsub_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift_op_net
  );
  shift1 : entity work.sysgen_shift_b17afba2f9 
  port map (
    clr => '0',
    ip => addsub1_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift1_op_net
  );
  slice : entity work.complexphasedetectorswap_xlslice 
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
-- Generated from Simulink block CORDIC PE6
library IEEE;
use IEEE.std_logic_1164.all;
library work;
use work.conv_pkg.all;
entity complexphasedetectorswap_cordic_pe6_x0 is
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
end complexphasedetectorswap_cordic_pe6_x0;
architecture structural of complexphasedetectorswap_cordic_pe6_x0 is 
  signal addsub1_s_net : std_logic_vector( 21-1 downto 0 );
  signal addsub2_s_net : std_logic_vector( 21-1 downto 0 );
  signal addsub_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal addsub1_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal addsub_s_net : std_logic_vector( 21-1 downto 0 );
  signal addsub2_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal clk_net : std_logic;
  signal shift1_op_net : std_logic_vector( 21-1 downto 0 );
  signal slice_y_net : std_logic_vector( 1-1 downto 0 );
  signal constant_op_net : std_logic_vector( 21-1 downto 0 );
  signal inverter_op_net : std_logic_vector( 1-1 downto 0 );
  signal ce_net : std_logic;
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
  addsub : entity work.sysgen_addsub_f5a65f010a 
  port map (
    clr => '0',
    a => addsub_s_net_x0,
    b => shift1_op_net,
    mode => inverter_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub_s_net
  );
  addsub1 : entity work.sysgen_addsub_f5a65f010a 
  port map (
    clr => '0',
    a => addsub1_s_net_x0,
    b => shift_op_net,
    mode => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub1_s_net
  );
  addsub2 : entity work.sysgen_addsub_f5a65f010a 
  port map (
    clr => '0',
    a => addsub2_s_net_x0,
    b => constant_op_net,
    mode => inverter_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub2_s_net
  );
  constant_x0 : entity work.sysgen_constant_8d75c3299d 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  inverter : entity work.sysgen_inverter_962a38e1c8 
  port map (
    clr => '0',
    ip => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    op => inverter_op_net
  );
  shift : entity work.sysgen_shift_59571b7f11 
  port map (
    clr => '0',
    ip => addsub_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift_op_net
  );
  shift1 : entity work.sysgen_shift_59571b7f11 
  port map (
    clr => '0',
    ip => addsub1_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift1_op_net
  );
  slice : entity work.complexphasedetectorswap_xlslice 
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
-- Generated from Simulink block CORDIC PE7
library IEEE;
use IEEE.std_logic_1164.all;
library work;
use work.conv_pkg.all;
entity complexphasedetectorswap_cordic_pe7_x0 is
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
end complexphasedetectorswap_cordic_pe7_x0;
architecture structural of complexphasedetectorswap_cordic_pe7_x0 is 
  signal addsub1_s_net : std_logic_vector( 21-1 downto 0 );
  signal addsub_s_net : std_logic_vector( 21-1 downto 0 );
  signal addsub2_s_net : std_logic_vector( 21-1 downto 0 );
  signal addsub_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal clk_net : std_logic;
  signal inverter_op_net : std_logic_vector( 1-1 downto 0 );
  signal addsub2_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal ce_net : std_logic;
  signal slice_y_net : std_logic_vector( 1-1 downto 0 );
  signal addsub1_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal constant_op_net : std_logic_vector( 21-1 downto 0 );
  signal shift1_op_net : std_logic_vector( 21-1 downto 0 );
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
  addsub : entity work.sysgen_addsub_f5a65f010a 
  port map (
    clr => '0',
    a => addsub_s_net_x0,
    b => shift1_op_net,
    mode => inverter_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub_s_net
  );
  addsub1 : entity work.sysgen_addsub_f5a65f010a 
  port map (
    clr => '0',
    a => addsub1_s_net_x0,
    b => shift_op_net,
    mode => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub1_s_net
  );
  addsub2 : entity work.sysgen_addsub_f5a65f010a 
  port map (
    clr => '0',
    a => addsub2_s_net_x0,
    b => constant_op_net,
    mode => inverter_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub2_s_net
  );
  constant_x0 : entity work.sysgen_constant_32a9bd055f 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  inverter : entity work.sysgen_inverter_962a38e1c8 
  port map (
    clr => '0',
    ip => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    op => inverter_op_net
  );
  shift : entity work.sysgen_shift_e2b9b699d2 
  port map (
    clr => '0',
    ip => addsub_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift_op_net
  );
  shift1 : entity work.sysgen_shift_e2b9b699d2 
  port map (
    clr => '0',
    ip => addsub1_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift1_op_net
  );
  slice : entity work.complexphasedetectorswap_xlslice 
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
-- Generated from Simulink block CORDIC PE8
library IEEE;
use IEEE.std_logic_1164.all;
library work;
use work.conv_pkg.all;
entity complexphasedetectorswap_cordic_pe8_x0 is
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
end complexphasedetectorswap_cordic_pe8_x0;
architecture structural of complexphasedetectorswap_cordic_pe8_x0 is 
  signal addsub1_s_net : std_logic_vector( 21-1 downto 0 );
  signal addsub2_s_net : std_logic_vector( 21-1 downto 0 );
  signal addsub_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal addsub_s_net : std_logic_vector( 21-1 downto 0 );
  signal shift_op_net : std_logic_vector( 21-1 downto 0 );
  signal shift1_op_net : std_logic_vector( 21-1 downto 0 );
  signal inverter_op_net : std_logic_vector( 1-1 downto 0 );
  signal slice_y_net : std_logic_vector( 1-1 downto 0 );
  signal ce_net : std_logic;
  signal addsub2_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal constant_op_net : std_logic_vector( 21-1 downto 0 );
  signal addsub1_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal clk_net : std_logic;
begin
  x_x0 <= addsub_s_net;
  y_x0 <= addsub1_s_net;
  z_x0 <= addsub2_s_net;
  addsub_s_net_x0 <= x;
  addsub1_s_net_x0 <= y;
  addsub2_s_net_x0 <= z;
  clk_net <= clk_1;
  ce_net <= ce_1;
  addsub : entity work.sysgen_addsub_f5a65f010a 
  port map (
    clr => '0',
    a => addsub_s_net_x0,
    b => shift1_op_net,
    mode => inverter_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub_s_net
  );
  addsub1 : entity work.sysgen_addsub_f5a65f010a 
  port map (
    clr => '0',
    a => addsub1_s_net_x0,
    b => shift_op_net,
    mode => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub1_s_net
  );
  addsub2 : entity work.sysgen_addsub_f5a65f010a 
  port map (
    clr => '0',
    a => addsub2_s_net_x0,
    b => constant_op_net,
    mode => inverter_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub2_s_net
  );
  constant_x0 : entity work.sysgen_constant_a3751ba8cd 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  inverter : entity work.sysgen_inverter_962a38e1c8 
  port map (
    clr => '0',
    ip => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    op => inverter_op_net
  );
  shift : entity work.sysgen_shift_a64cabac3d 
  port map (
    clr => '0',
    ip => addsub_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift_op_net
  );
  shift1 : entity work.sysgen_shift_a64cabac3d 
  port map (
    clr => '0',
    ip => addsub1_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift1_op_net
  );
  slice : entity work.complexphasedetectorswap_xlslice 
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
-- Generated from Simulink block CORDIC PE9
library IEEE;
use IEEE.std_logic_1164.all;
library work;
use work.conv_pkg.all;
entity complexphasedetectorswap_cordic_pe9 is
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
end complexphasedetectorswap_cordic_pe9;
architecture structural of complexphasedetectorswap_cordic_pe9 is 
  signal addsub2_s_net : std_logic_vector( 21-1 downto 0 );
  signal addsub_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal addsub1_s_net : std_logic_vector( 21-1 downto 0 );
  signal addsub_s_net : std_logic_vector( 21-1 downto 0 );
  signal constant_op_net : std_logic_vector( 21-1 downto 0 );
  signal ce_net : std_logic;
  signal shift_op_net : std_logic_vector( 21-1 downto 0 );
  signal shift1_op_net : std_logic_vector( 21-1 downto 0 );
  signal clk_net : std_logic;
  signal inverter_op_net : std_logic_vector( 1-1 downto 0 );
  signal slice_y_net : std_logic_vector( 1-1 downto 0 );
  signal addsub2_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal addsub1_s_net_x0 : std_logic_vector( 21-1 downto 0 );
begin
  x_x0 <= addsub_s_net;
  y_x0 <= addsub1_s_net;
  z_x0 <= addsub2_s_net;
  addsub_s_net_x0 <= x;
  addsub1_s_net_x0 <= y;
  addsub2_s_net_x0 <= z;
  clk_net <= clk_1;
  ce_net <= ce_1;
  addsub : entity work.sysgen_addsub_f5a65f010a 
  port map (
    clr => '0',
    a => addsub_s_net_x0,
    b => shift1_op_net,
    mode => inverter_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub_s_net
  );
  addsub1 : entity work.sysgen_addsub_f5a65f010a 
  port map (
    clr => '0',
    a => addsub1_s_net_x0,
    b => shift_op_net,
    mode => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub1_s_net
  );
  addsub2 : entity work.sysgen_addsub_f5a65f010a 
  port map (
    clr => '0',
    a => addsub2_s_net_x0,
    b => constant_op_net,
    mode => inverter_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub2_s_net
  );
  constant_x0 : entity work.sysgen_constant_a79438f85a 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  inverter : entity work.sysgen_inverter_962a38e1c8 
  port map (
    clr => '0',
    ip => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    op => inverter_op_net
  );
  shift : entity work.sysgen_shift_335bc9bc1e 
  port map (
    clr => '0',
    ip => addsub_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift_op_net
  );
  shift1 : entity work.sysgen_shift_335bc9bc1e 
  port map (
    clr => '0',
    ip => addsub1_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift1_op_net
  );
  slice : entity work.complexphasedetectorswap_xlslice 
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
-- Generated from Simulink block CORDIC Fine Angle PE
library IEEE;
use IEEE.std_logic_1164.all;
library work;
use work.conv_pkg.all;
entity complexphasedetectorswap_cordic_fine_angle_pe_x0 is
  port (
    x_x0 : in std_logic_vector( 21-1 downto 0 );
    y : in std_logic_vector( 21-1 downto 0 );
    z : in std_logic_vector( 21-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    x : out std_logic_vector( 21-1 downto 0 );
    y_x0 : out std_logic_vector( 21-1 downto 0 )
  );
end complexphasedetectorswap_cordic_fine_angle_pe_x0;
architecture structural of complexphasedetectorswap_cordic_fine_angle_pe_x0 is 
  signal addsub_s_net_x3 : std_logic_vector( 21-1 downto 0 );
  signal constant1_op_net : std_logic_vector( 21-1 downto 0 );
  signal addsub1_s_net_x3 : std_logic_vector( 21-1 downto 0 );
  signal constant_op_net : std_logic_vector( 21-1 downto 0 );
  signal addsub2_s_net_x15 : std_logic_vector( 21-1 downto 0 );
  signal addsub2_s_net_x13 : std_logic_vector( 21-1 downto 0 );
  signal addsub2_s_net_x11 : std_logic_vector( 21-1 downto 0 );
  signal addsub_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal addsub1_s_net_x12 : std_logic_vector( 21-1 downto 0 );
  signal addsub2_s_net : std_logic_vector( 21-1 downto 0 );
  signal addsub2_s_net_x14 : std_logic_vector( 21-1 downto 0 );
  signal addsub_s_net_x10 : std_logic_vector( 21-1 downto 0 );
  signal addsub1_s_net_x9 : std_logic_vector( 21-1 downto 0 );
  signal addsub1_s_net_x4 : std_logic_vector( 21-1 downto 0 );
  signal addsub1_s_net : std_logic_vector( 21-1 downto 0 );
  signal addsub_s_net : std_logic_vector( 21-1 downto 0 );
  signal addsub_s_net_x14 : std_logic_vector( 21-1 downto 0 );
  signal clk_net : std_logic;
  signal addsub2_s_net_x1 : std_logic_vector( 21-1 downto 0 );
  signal addsub2_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal addsub_s_net_x4 : std_logic_vector( 21-1 downto 0 );
  signal addsub1_s_net_x6 : std_logic_vector( 21-1 downto 0 );
  signal addsub2_s_net_x7 : std_logic_vector( 21-1 downto 0 );
  signal addsub_s_net_x6 : std_logic_vector( 21-1 downto 0 );
  signal addsub2_s_net_x6 : std_logic_vector( 21-1 downto 0 );
  signal addsub_s_net_x5 : std_logic_vector( 21-1 downto 0 );
  signal mux_y_net : std_logic_vector( 21-1 downto 0 );
  signal addsub_s_net_x1 : std_logic_vector( 21-1 downto 0 );
  signal addsub_s_net_x15 : std_logic_vector( 21-1 downto 0 );
  signal addsub_s_net_x9 : std_logic_vector( 21-1 downto 0 );
  signal ce_net : std_logic;
  signal addsub2_s_net_x4 : std_logic_vector( 21-1 downto 0 );
  signal addsub1_s_net_x11 : std_logic_vector( 21-1 downto 0 );
  signal addsub1_s_net_x13 : std_logic_vector( 21-1 downto 0 );
  signal addsub2_s_net_x8 : std_logic_vector( 21-1 downto 0 );
  signal addsub_s_net_x11 : std_logic_vector( 21-1 downto 0 );
  signal addsub2_s_net_x9 : std_logic_vector( 21-1 downto 0 );
  signal addsub1_s_net_x5 : std_logic_vector( 21-1 downto 0 );
  signal addsub1_s_net_x2 : std_logic_vector( 21-1 downto 0 );
  signal addsub2_s_net_x2 : std_logic_vector( 21-1 downto 0 );
  signal addsub1_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal addsub_s_net_x12 : std_logic_vector( 21-1 downto 0 );
  signal addsub1_s_net_x1 : std_logic_vector( 21-1 downto 0 );
  signal addsub2_s_net_x12 : std_logic_vector( 21-1 downto 0 );
  signal addsub1_s_net_x15 : std_logic_vector( 21-1 downto 0 );
  signal addsub_s_net_x8 : std_logic_vector( 21-1 downto 0 );
  signal addsub2_s_net_x10 : std_logic_vector( 21-1 downto 0 );
  signal addsub1_s_net_x7 : std_logic_vector( 21-1 downto 0 );
  signal addsub_s_net_x7 : std_logic_vector( 21-1 downto 0 );
  signal addsub1_s_net_x8 : std_logic_vector( 21-1 downto 0 );
  signal addsub_s_net_x2 : std_logic_vector( 21-1 downto 0 );
  signal addsub_s_net_x13 : std_logic_vector( 21-1 downto 0 );
  signal addsub1_s_net_x14 : std_logic_vector( 21-1 downto 0 );
  signal addsub1_s_net_x10 : std_logic_vector( 21-1 downto 0 );
  signal addsub2_s_net_x5 : std_logic_vector( 21-1 downto 0 );
begin
  x <= addsub_s_net_x3;
  y_x0 <= addsub1_s_net_x3;
  constant_op_net <= x_x0;
  constant1_op_net <= y;
  mux_y_net <= z;
  clk_net <= clk_1;
  ce_net <= ce_1;
  cordic_pe1 : entity work.complexphasedetectorswap_cordic_pe1_x1 
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
  cordic_pe10 : entity work.complexphasedetectorswap_cordic_pe10 
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
  cordic_pe11 : entity work.complexphasedetectorswap_cordic_pe11 
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
  cordic_pe12 : entity work.complexphasedetectorswap_cordic_pe12 
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
  cordic_pe13 : entity work.complexphasedetectorswap_cordic_pe13 
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
  cordic_pe14 : entity work.complexphasedetectorswap_cordic_pe14 
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
  cordic_pe15 : entity work.complexphasedetectorswap_cordic_pe15 
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
  cordic_pe16 : entity work.complexphasedetectorswap_cordic_pe16 
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
  cordic_pe17 : entity work.complexphasedetectorswap_cordic_pe17 
  port map (
    x => addsub_s_net_x4,
    y => addsub1_s_net_x12,
    z => addsub2_s_net_x4,
    clk_1 => clk_net,
    ce_1 => ce_net,
    x_x0 => addsub_s_net_x3,
    y_x0 => addsub1_s_net_x3
  );
  cordic_pe2 : entity work.complexphasedetectorswap_cordic_pe2_x0 
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
  cordic_pe3 : entity work.complexphasedetectorswap_cordic_pe3_x0 
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
  cordic_pe4 : entity work.complexphasedetectorswap_cordic_pe4_x0 
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
  cordic_pe5 : entity work.complexphasedetectorswap_cordic_pe5_x0 
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
  cordic_pe6 : entity work.complexphasedetectorswap_cordic_pe6_x0 
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
  cordic_pe7 : entity work.complexphasedetectorswap_cordic_pe7_x0 
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
  cordic_pe8 : entity work.complexphasedetectorswap_cordic_pe8_x0 
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
  cordic_pe9 : entity work.complexphasedetectorswap_cordic_pe9 
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
-- Generated from Simulink block Quadrant Correct
library IEEE;
use IEEE.std_logic_1164.all;
library work;
use work.conv_pkg.all;
entity complexphasedetectorswap_quadrant_correct is
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
end complexphasedetectorswap_quadrant_correct;
architecture structural of complexphasedetectorswap_quadrant_correct is 
  signal mux1_y_net : std_logic_vector( 21-1 downto 0 );
  signal addsub_s_net : std_logic_vector( 21-1 downto 0 );
  signal mux_y_net : std_logic_vector( 21-1 downto 0 );
  signal addsub1_s_net : std_logic_vector( 21-1 downto 0 );
  signal delay4_q_net : std_logic_vector( 1-1 downto 0 );
  signal delay1_q_net : std_logic_vector( 1-1 downto 0 );
  signal clk_net : std_logic;
  signal negate2_op_net : std_logic_vector( 21-1 downto 0 );
  signal mux2_y_net : std_logic_vector( 21-1 downto 0 );
  signal negate1_op_net : std_logic_vector( 21-1 downto 0 );
  signal mux3_y_net : std_logic_vector( 21-1 downto 0 );
  signal ce_net : std_logic;
begin
  cosine <= mux_y_net;
  sine <= mux1_y_net;
  addsub_s_net <= cos;
  addsub1_s_net <= sin;
  delay4_q_net <= angle_map;
  delay1_q_net <= sgn_z;
  clk_net <= clk_1;
  ce_net <= ce_1;
  mux : entity work.sysgen_mux_22fb22e069 
  port map (
    clr => '0',
    sel => delay4_q_net,
    d0 => addsub_s_net,
    d1 => mux3_y_net,
    clk => clk_net,
    ce => ce_net,
    y => mux_y_net
  );
  mux1 : entity work.sysgen_mux_22fb22e069 
  port map (
    clr => '0',
    sel => delay4_q_net,
    d0 => addsub1_s_net,
    d1 => mux2_y_net,
    clk => clk_net,
    ce => ce_net,
    y => mux1_y_net
  );
  mux2 : entity work.sysgen_mux_914113a591 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    sel => delay1_q_net,
    d0 => addsub_s_net,
    d1 => negate1_op_net,
    y => mux2_y_net
  );
  mux3 : entity work.sysgen_mux_914113a591 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    sel => delay1_q_net,
    d0 => negate2_op_net,
    d1 => addsub1_s_net,
    y => mux3_y_net
  );
  negate1 : entity work.sysgen_negate_83d9c4199c 
  port map (
    clr => '0',
    ip => addsub_s_net,
    clk => clk_net,
    ce => ce_net,
    op => negate1_op_net
  );
  negate2 : entity work.sysgen_negate_83d9c4199c 
  port map (
    clr => '0',
    ip => addsub1_s_net,
    clk => clk_net,
    ce => ce_net,
    op => negate2_op_net
  );
end structural;
-- Generated from Simulink block Quadrant Map
library IEEE;
use IEEE.std_logic_1164.all;
library work;
use work.conv_pkg.all;
entity complexphasedetectorswap_quadrant_map_x0 is
  port (
    z : in std_logic_vector( 21-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    z_x0 : out std_logic_vector( 21-1 downto 0 );
    angle_map : out std_logic_vector( 1-1 downto 0 );
    sgn_z_x0 : out std_logic_vector( 1-1 downto 0 )
  );
end complexphasedetectorswap_quadrant_map_x0;
architecture structural of complexphasedetectorswap_quadrant_map_x0 is 
  signal logical_y_net : std_logic_vector( 1-1 downto 0 );
  signal mult_p_net : std_logic_vector( 21-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal sgn_z_y_net : std_logic_vector( 1-1 downto 0 );
  signal mux_y_net : std_logic_vector( 21-1 downto 0 );
  signal delay1_q_net : std_logic_vector( 21-1 downto 0 );
  signal relational1_op_net : std_logic_vector( 1-1 downto 0 );
  signal relational_op_net : std_logic_vector( 1-1 downto 0 );
  signal inverter_op_net : std_logic_vector( 1-1 downto 0 );
  signal constant1_op_net : std_logic_vector( 21-1 downto 0 );
  signal constant2_op_net : std_logic_vector( 21-1 downto 0 );
  signal addsub_s_net : std_logic_vector( 21-1 downto 0 );
begin
  z_x0 <= mux_y_net;
  angle_map <= logical_y_net;
  sgn_z_x0 <= sgn_z_y_net;
  mult_p_net <= z;
  clk_net <= clk_1;
  ce_net <= ce_1;
  addsub : entity work.sysgen_addsub_f5a65f010a 
  port map (
    clr => '0',
    a => mult_p_net,
    b => constant1_op_net,
    mode => inverter_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub_s_net
  );
  constant1 : entity work.sysgen_constant_59d2bc57d8 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant1_op_net
  );
  constant2 : entity work.sysgen_constant_7a5a5cef02 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant2_op_net
  );
  delay1 : entity work.complexphasedetectorswap_xldelay 
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
  inverter : entity work.sysgen_inverter_962a38e1c8 
  port map (
    clr => '0',
    ip => sgn_z_y_net,
    clk => clk_net,
    ce => ce_net,
    op => inverter_op_net
  );
  logical : entity work.sysgen_logical_3ecd2b5ea1 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    d0 => relational_op_net,
    d1 => relational1_op_net,
    y => logical_y_net
  );
  mux : entity work.sysgen_mux_22fb22e069 
  port map (
    clr => '0',
    sel => logical_y_net,
    d0 => delay1_q_net,
    d1 => addsub_s_net,
    clk => clk_net,
    ce => ce_net,
    y => mux_y_net
  );
  relational : entity work.sysgen_relational_c7c11f7f79 
  port map (
    clr => '0',
    a => mult_p_net,
    b => constant1_op_net,
    clk => clk_net,
    ce => ce_net,
    op => relational_op_net
  );
  relational1 : entity work.sysgen_relational_0495233e37 
  port map (
    clr => '0',
    a => mult_p_net,
    b => constant2_op_net,
    clk => clk_net,
    ce => ce_net,
    op => relational1_op_net
  );
  sgn_z : entity work.complexphasedetectorswap_xlslice 
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
-- Generated from Simulink block CORDIC SINCOS
library IEEE;
use IEEE.std_logic_1164.all;
library work;
use work.conv_pkg.all;
entity complexphasedetectorswap_cordic_sincos is
  port (
    z : in std_logic_vector( 21-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    cos : out std_logic_vector( 18-1 downto 0 );
    sin : out std_logic_vector( 18-1 downto 0 )
  );
end complexphasedetectorswap_cordic_sincos;
architecture structural of complexphasedetectorswap_cordic_sincos is 
  signal convert_dout_net : std_logic_vector( 18-1 downto 0 );
  signal convert1_dout_net : std_logic_vector( 18-1 downto 0 );
  signal mult_p_net : std_logic_vector( 21-1 downto 0 );
  signal constant_op_net : std_logic_vector( 21-1 downto 0 );
  signal mux1_y_net : std_logic_vector( 21-1 downto 0 );
  signal delay4_q_net : std_logic_vector( 1-1 downto 0 );
  signal mux_y_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal delay1_q_net : std_logic_vector( 1-1 downto 0 );
  signal addsub_s_net : std_logic_vector( 21-1 downto 0 );
  signal clk_net : std_logic;
  signal sgn_z_y_net : std_logic_vector( 1-1 downto 0 );
  signal logical_y_net : std_logic_vector( 1-1 downto 0 );
  signal ce_net : std_logic;
  signal constant1_op_net : std_logic_vector( 21-1 downto 0 );
  signal addsub1_s_net : std_logic_vector( 21-1 downto 0 );
  signal mux_y_net : std_logic_vector( 21-1 downto 0 );
begin
  cos <= convert_dout_net;
  sin <= convert1_dout_net;
  mult_p_net <= z;
  clk_net <= clk_1;
  ce_net <= ce_1;
  cordic_fine_angle_pe : entity work.complexphasedetectorswap_cordic_fine_angle_pe_x0 
  port map (
    x_x0 => constant_op_net,
    y => constant1_op_net,
    z => mux_y_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    x => addsub_s_net,
    y_x0 => addsub1_s_net
  );
  quadrant_correct_x0 : entity work.complexphasedetectorswap_quadrant_correct 
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
  quadrant_map : entity work.complexphasedetectorswap_quadrant_map_x0 
  port map (
    z => mult_p_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    z_x0 => mux_y_net,
    angle_map => logical_y_net,
    sgn_z_x0 => sgn_z_y_net
  );
  constant_x0 : entity work.sysgen_constant_7f0cff09da 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  constant1 : entity work.sysgen_constant_d8a454c0c9 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant1_op_net
  );
  convert : entity work.complexphasedetectorswap_xlconvert 
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
  convert1 : entity work.complexphasedetectorswap_xlconvert 
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
  delay1 : entity work.complexphasedetectorswap_xldelay 
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
  delay4 : entity work.complexphasedetectorswap_xldelay 
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
-- Generated from Simulink block Negater1
library IEEE;
use IEEE.std_logic_1164.all;
library work;
use work.conv_pkg.all;
entity complexphasedetectorswap_negater1 is
  port (
    neg : in std_logic_vector( 1-1 downto 0 );
    in_x0 : in std_logic_vector( 18-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    out_x0 : out std_logic_vector( 18-1 downto 0 )
  );
end complexphasedetectorswap_negater1;
architecture structural of complexphasedetectorswap_negater1 is 
  signal mux11_y_net : std_logic_vector( 18-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal convert1_dout_net : std_logic_vector( 18-1 downto 0 );
  signal inverter4_op_net : std_logic_vector( 1-1 downto 0 );
  signal negate1_op_net : std_logic_vector( 18-1 downto 0 );
begin
  out_x0 <= mux11_y_net;
  inverter4_op_net <= neg;
  convert1_dout_net <= in_x0;
  clk_net <= clk_1;
  ce_net <= ce_1;
  mux11 : entity work.sysgen_mux_a5970e32a5 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    sel => inverter4_op_net,
    d0 => convert1_dout_net,
    d1 => negate1_op_net,
    y => mux11_y_net
  );
  negate1 : entity work.sysgen_negate_63685e0f69 
  port map (
    clr => '0',
    ip => convert1_dout_net,
    clk => clk_net,
    ce => ce_net,
    op => negate1_op_net
  );
end structural;
-- Generated from Simulink block Bipolar NCO
library IEEE;
use IEEE.std_logic_1164.all;
library work;
use work.conv_pkg.all;
entity complexphasedetectorswap_bipolar_nco is
  port (
    rst : in std_logic_vector( 1-1 downto 0 );
    inc : in std_logic_vector( 22-1 downto 0 );
    conj : in std_logic_vector( 1-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    sin : out std_logic_vector( 18-1 downto 0 );
    cos : out std_logic_vector( 18-1 downto 0 );
    phase : out std_logic_vector( 21-1 downto 0 )
  );
end complexphasedetectorswap_bipolar_nco;
architecture structural of complexphasedetectorswap_bipolar_nco is 
  signal ce_net : std_logic;
  signal mult_p_net : std_logic_vector( 21-1 downto 0 );
  signal mux11_y_net : std_logic_vector( 18-1 downto 0 );
  signal clk_net : std_logic;
  signal convert1_dout_net : std_logic_vector( 18-1 downto 0 );
  signal reinterpret1_output_port_net : std_logic_vector( 18-1 downto 0 );
  signal negate1_op_net : std_logic_vector( 22-1 downto 0 );
  signal convert_dout_net : std_logic_vector( 18-1 downto 0 );
  signal slice_y_net : std_logic_vector( 18-1 downto 0 );
  signal inverter4_op_net : std_logic_vector( 1-1 downto 0 );
  signal accumulator_q_net : std_logic_vector( 22-1 downto 0 );
  signal reset_net : std_logic_vector( 1-1 downto 0 );
  signal constant_op_net : std_logic_vector( 18-1 downto 0 );
begin
  sin <= mux11_y_net;
  cos <= convert_dout_net;
  phase <= mult_p_net;
  reset_net <= rst;
  negate1_op_net <= inc;
  inverter4_op_net <= conj;
  clk_net <= clk_1;
  ce_net <= ce_1;
  cordic_sincos : entity work.complexphasedetectorswap_cordic_sincos 
  port map (
    z => mult_p_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    cos => convert_dout_net,
    sin => convert1_dout_net
  );
  negater1 : entity work.complexphasedetectorswap_negater1 
  port map (
    neg => inverter4_op_net,
    in_x0 => convert1_dout_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    out_x0 => mux11_y_net
  );
  accumulator : entity work.sysgen_accum_85e7a3e2ab 
  port map (
    clr => '0',
    b => negate1_op_net,
    rst => reset_net,
    clk => clk_net,
    ce => ce_net,
    q => accumulator_q_net
  );
  constant_x0 : entity work.sysgen_constant_100c0ff552 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  mult : entity work.complexphasedetectorswap_xlmult 
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
    core_name0 => "complexphasedetectorswap_mult_gen_v12_0_i4",
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
  reinterpret1 : entity work.sysgen_reinterpret_fbeafca946 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => slice_y_net,
    output_port => reinterpret1_output_port_net
  );
  slice : entity work.complexphasedetectorswap_xlslice 
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
-- Generated from Simulink block CORDIC PE1
library IEEE;
use IEEE.std_logic_1164.all;
library work;
use work.conv_pkg.all;
entity complexphasedetectorswap_cordic_pe1_x0 is
  port (
    x : in std_logic_vector( 18-1 downto 0 );
    y : in std_logic_vector( 18-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    x_x0 : out std_logic_vector( 18-1 downto 0 );
    y_x0 : out std_logic_vector( 18-1 downto 0 )
  );
end complexphasedetectorswap_cordic_pe1_x0;
architecture structural of complexphasedetectorswap_cordic_pe1_x0 is 
  signal addsub_s_net : std_logic_vector( 18-1 downto 0 );
  signal addsub1_s_net : std_logic_vector( 18-1 downto 0 );
  signal mux_y_net : std_logic_vector( 18-1 downto 0 );
  signal inverter_op_net : std_logic_vector( 1-1 downto 0 );
  signal shift_op_net : std_logic_vector( 18-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal shift1_op_net : std_logic_vector( 18-1 downto 0 );
  signal slice_y_net : std_logic_vector( 1-1 downto 0 );
  signal delay3_q_net : std_logic_vector( 18-1 downto 0 );
begin
  x_x0 <= addsub_s_net;
  y_x0 <= addsub1_s_net;
  mux_y_net <= x;
  delay3_q_net <= y;
  clk_net <= clk_1;
  ce_net <= ce_1;
  addsub : entity work.sysgen_addsub_57882dc1c0 
  port map (
    clr => '0',
    a => mux_y_net,
    b => shift1_op_net,
    mode => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub_s_net
  );
  addsub1 : entity work.sysgen_addsub_57882dc1c0 
  port map (
    clr => '0',
    a => delay3_q_net,
    b => shift_op_net,
    mode => inverter_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub1_s_net
  );
  inverter : entity work.sysgen_inverter_962a38e1c8 
  port map (
    clr => '0',
    ip => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    op => inverter_op_net
  );
  shift : entity work.sysgen_shift_92b2ba157c 
  port map (
    clr => '0',
    ip => mux_y_net,
    clk => clk_net,
    ce => ce_net,
    op => shift_op_net
  );
  shift1 : entity work.sysgen_shift_92b2ba157c 
  port map (
    clr => '0',
    ip => delay3_q_net,
    clk => clk_net,
    ce => ce_net,
    op => shift1_op_net
  );
  slice : entity work.complexphasedetectorswap_xlslice 
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
-- Generated from Simulink block CORDIC PE2
library IEEE;
use IEEE.std_logic_1164.all;
library work;
use work.conv_pkg.all;
entity complexphasedetectorswap_cordic_pe2 is
  port (
    x : in std_logic_vector( 18-1 downto 0 );
    y : in std_logic_vector( 18-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    x_x0 : out std_logic_vector( 18-1 downto 0 );
    y_x0 : out std_logic_vector( 18-1 downto 0 )
  );
end complexphasedetectorswap_cordic_pe2;
architecture structural of complexphasedetectorswap_cordic_pe2 is 
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal addsub1_s_net_x0 : std_logic_vector( 18-1 downto 0 );
  signal addsub_s_net : std_logic_vector( 18-1 downto 0 );
  signal addsub1_s_net : std_logic_vector( 18-1 downto 0 );
  signal addsub_s_net_x0 : std_logic_vector( 18-1 downto 0 );
  signal slice_y_net : std_logic_vector( 1-1 downto 0 );
  signal inverter_op_net : std_logic_vector( 1-1 downto 0 );
  signal shift1_op_net : std_logic_vector( 18-1 downto 0 );
  signal shift_op_net : std_logic_vector( 18-1 downto 0 );
begin
  x_x0 <= addsub_s_net;
  y_x0 <= addsub1_s_net;
  addsub_s_net_x0 <= x;
  addsub1_s_net_x0 <= y;
  clk_net <= clk_1;
  ce_net <= ce_1;
  addsub : entity work.sysgen_addsub_57882dc1c0 
  port map (
    clr => '0',
    a => addsub_s_net_x0,
    b => shift1_op_net,
    mode => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub_s_net
  );
  addsub1 : entity work.sysgen_addsub_57882dc1c0 
  port map (
    clr => '0',
    a => addsub1_s_net_x0,
    b => shift_op_net,
    mode => inverter_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub1_s_net
  );
  inverter : entity work.sysgen_inverter_962a38e1c8 
  port map (
    clr => '0',
    ip => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    op => inverter_op_net
  );
  shift : entity work.sysgen_shift_dfc01601e0 
  port map (
    clr => '0',
    ip => addsub_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift_op_net
  );
  shift1 : entity work.sysgen_shift_dfc01601e0 
  port map (
    clr => '0',
    ip => addsub1_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift1_op_net
  );
  slice : entity work.complexphasedetectorswap_xlslice 
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
-- Generated from Simulink block CORDIC PE3
library IEEE;
use IEEE.std_logic_1164.all;
library work;
use work.conv_pkg.all;
entity complexphasedetectorswap_cordic_pe3 is
  port (
    x : in std_logic_vector( 18-1 downto 0 );
    y : in std_logic_vector( 18-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    x_x0 : out std_logic_vector( 18-1 downto 0 );
    y_x0 : out std_logic_vector( 18-1 downto 0 )
  );
end complexphasedetectorswap_cordic_pe3;
architecture structural of complexphasedetectorswap_cordic_pe3 is 
  signal addsub1_s_net_x0 : std_logic_vector( 18-1 downto 0 );
  signal ce_net : std_logic;
  signal addsub_s_net : std_logic_vector( 18-1 downto 0 );
  signal addsub_s_net_x0 : std_logic_vector( 18-1 downto 0 );
  signal addsub1_s_net : std_logic_vector( 18-1 downto 0 );
  signal clk_net : std_logic;
  signal shift1_op_net : std_logic_vector( 18-1 downto 0 );
  signal shift_op_net : std_logic_vector( 18-1 downto 0 );
  signal inverter_op_net : std_logic_vector( 1-1 downto 0 );
  signal slice_y_net : std_logic_vector( 1-1 downto 0 );
begin
  x_x0 <= addsub_s_net;
  y_x0 <= addsub1_s_net;
  addsub_s_net_x0 <= x;
  addsub1_s_net_x0 <= y;
  clk_net <= clk_1;
  ce_net <= ce_1;
  addsub : entity work.sysgen_addsub_57882dc1c0 
  port map (
    clr => '0',
    a => addsub_s_net_x0,
    b => shift1_op_net,
    mode => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub_s_net
  );
  addsub1 : entity work.sysgen_addsub_57882dc1c0 
  port map (
    clr => '0',
    a => addsub1_s_net_x0,
    b => shift_op_net,
    mode => inverter_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub1_s_net
  );
  inverter : entity work.sysgen_inverter_962a38e1c8 
  port map (
    clr => '0',
    ip => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    op => inverter_op_net
  );
  shift : entity work.sysgen_shift_bff9cd0b1c 
  port map (
    clr => '0',
    ip => addsub_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift_op_net
  );
  shift1 : entity work.sysgen_shift_bff9cd0b1c 
  port map (
    clr => '0',
    ip => addsub1_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift1_op_net
  );
  slice : entity work.complexphasedetectorswap_xlslice 
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
-- Generated from Simulink block CORDIC PE4
library IEEE;
use IEEE.std_logic_1164.all;
library work;
use work.conv_pkg.all;
entity complexphasedetectorswap_cordic_pe4 is
  port (
    x : in std_logic_vector( 18-1 downto 0 );
    y : in std_logic_vector( 18-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    x_x0 : out std_logic_vector( 18-1 downto 0 );
    y_x0 : out std_logic_vector( 18-1 downto 0 )
  );
end complexphasedetectorswap_cordic_pe4;
architecture structural of complexphasedetectorswap_cordic_pe4 is 
  signal addsub1_s_net : std_logic_vector( 18-1 downto 0 );
  signal addsub1_s_net_x0 : std_logic_vector( 18-1 downto 0 );
  signal addsub_s_net_x0 : std_logic_vector( 18-1 downto 0 );
  signal clk_net : std_logic;
  signal addsub_s_net : std_logic_vector( 18-1 downto 0 );
  signal shift1_op_net : std_logic_vector( 18-1 downto 0 );
  signal shift_op_net : std_logic_vector( 18-1 downto 0 );
  signal inverter_op_net : std_logic_vector( 1-1 downto 0 );
  signal ce_net : std_logic;
  signal slice_y_net : std_logic_vector( 1-1 downto 0 );
begin
  x_x0 <= addsub_s_net;
  y_x0 <= addsub1_s_net;
  addsub_s_net_x0 <= x;
  addsub1_s_net_x0 <= y;
  clk_net <= clk_1;
  ce_net <= ce_1;
  addsub : entity work.sysgen_addsub_57882dc1c0 
  port map (
    clr => '0',
    a => addsub_s_net_x0,
    b => shift1_op_net,
    mode => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub_s_net
  );
  addsub1 : entity work.sysgen_addsub_57882dc1c0 
  port map (
    clr => '0',
    a => addsub1_s_net_x0,
    b => shift_op_net,
    mode => inverter_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub1_s_net
  );
  inverter : entity work.sysgen_inverter_962a38e1c8 
  port map (
    clr => '0',
    ip => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    op => inverter_op_net
  );
  shift : entity work.sysgen_shift_4b1e6388ab 
  port map (
    clr => '0',
    ip => addsub_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift_op_net
  );
  shift1 : entity work.sysgen_shift_4b1e6388ab 
  port map (
    clr => '0',
    ip => addsub1_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift1_op_net
  );
  slice : entity work.complexphasedetectorswap_xlslice 
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
-- Generated from Simulink block CORDIC PE5
library IEEE;
use IEEE.std_logic_1164.all;
library work;
use work.conv_pkg.all;
entity complexphasedetectorswap_cordic_pe5 is
  port (
    x : in std_logic_vector( 18-1 downto 0 );
    y : in std_logic_vector( 18-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    x_x0 : out std_logic_vector( 18-1 downto 0 );
    y_x0 : out std_logic_vector( 18-1 downto 0 )
  );
end complexphasedetectorswap_cordic_pe5;
architecture structural of complexphasedetectorswap_cordic_pe5 is 
  signal addsub_s_net_x0 : std_logic_vector( 18-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal addsub1_s_net_x0 : std_logic_vector( 18-1 downto 0 );
  signal addsub1_s_net : std_logic_vector( 18-1 downto 0 );
  signal addsub_s_net : std_logic_vector( 18-1 downto 0 );
  signal shift_op_net : std_logic_vector( 18-1 downto 0 );
  signal slice_y_net : std_logic_vector( 1-1 downto 0 );
  signal shift1_op_net : std_logic_vector( 18-1 downto 0 );
  signal inverter_op_net : std_logic_vector( 1-1 downto 0 );
begin
  x_x0 <= addsub_s_net;
  y_x0 <= addsub1_s_net;
  addsub_s_net_x0 <= x;
  addsub1_s_net_x0 <= y;
  clk_net <= clk_1;
  ce_net <= ce_1;
  addsub : entity work.sysgen_addsub_57882dc1c0 
  port map (
    clr => '0',
    a => addsub_s_net_x0,
    b => shift1_op_net,
    mode => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub_s_net
  );
  addsub1 : entity work.sysgen_addsub_57882dc1c0 
  port map (
    clr => '0',
    a => addsub1_s_net_x0,
    b => shift_op_net,
    mode => inverter_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub1_s_net
  );
  inverter : entity work.sysgen_inverter_962a38e1c8 
  port map (
    clr => '0',
    ip => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    op => inverter_op_net
  );
  shift : entity work.sysgen_shift_66ae2a38bb 
  port map (
    clr => '0',
    ip => addsub_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift_op_net
  );
  shift1 : entity work.sysgen_shift_66ae2a38bb 
  port map (
    clr => '0',
    ip => addsub1_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift1_op_net
  );
  slice : entity work.complexphasedetectorswap_xlslice 
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
-- Generated from Simulink block CORDIC PE6
library IEEE;
use IEEE.std_logic_1164.all;
library work;
use work.conv_pkg.all;
entity complexphasedetectorswap_cordic_pe6 is
  port (
    x : in std_logic_vector( 18-1 downto 0 );
    y : in std_logic_vector( 18-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    x_x0 : out std_logic_vector( 18-1 downto 0 );
    y_x0 : out std_logic_vector( 18-1 downto 0 )
  );
end complexphasedetectorswap_cordic_pe6;
architecture structural of complexphasedetectorswap_cordic_pe6 is 
  signal shift_op_net : std_logic_vector( 18-1 downto 0 );
  signal inverter_op_net : std_logic_vector( 1-1 downto 0 );
  signal slice_y_net : std_logic_vector( 1-1 downto 0 );
  signal shift1_op_net : std_logic_vector( 18-1 downto 0 );
  signal addsub1_s_net : std_logic_vector( 18-1 downto 0 );
  signal addsub_s_net_x0 : std_logic_vector( 18-1 downto 0 );
  signal addsub_s_net : std_logic_vector( 18-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal addsub1_s_net_x0 : std_logic_vector( 18-1 downto 0 );
begin
  x_x0 <= addsub_s_net;
  y_x0 <= addsub1_s_net;
  addsub_s_net_x0 <= x;
  addsub1_s_net_x0 <= y;
  clk_net <= clk_1;
  ce_net <= ce_1;
  addsub : entity work.sysgen_addsub_57882dc1c0 
  port map (
    clr => '0',
    a => addsub_s_net_x0,
    b => shift1_op_net,
    mode => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub_s_net
  );
  addsub1 : entity work.sysgen_addsub_57882dc1c0 
  port map (
    clr => '0',
    a => addsub1_s_net_x0,
    b => shift_op_net,
    mode => inverter_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub1_s_net
  );
  inverter : entity work.sysgen_inverter_962a38e1c8 
  port map (
    clr => '0',
    ip => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    op => inverter_op_net
  );
  shift : entity work.sysgen_shift_3211458261 
  port map (
    clr => '0',
    ip => addsub_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift_op_net
  );
  shift1 : entity work.sysgen_shift_3211458261 
  port map (
    clr => '0',
    ip => addsub1_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift1_op_net
  );
  slice : entity work.complexphasedetectorswap_xlslice 
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
-- Generated from Simulink block CORDIC PE7
library IEEE;
use IEEE.std_logic_1164.all;
library work;
use work.conv_pkg.all;
entity complexphasedetectorswap_cordic_pe7 is
  port (
    x : in std_logic_vector( 18-1 downto 0 );
    y : in std_logic_vector( 18-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    x_x0 : out std_logic_vector( 18-1 downto 0 );
    y_x0 : out std_logic_vector( 18-1 downto 0 )
  );
end complexphasedetectorswap_cordic_pe7;
architecture structural of complexphasedetectorswap_cordic_pe7 is 
  signal addsub_s_net : std_logic_vector( 18-1 downto 0 );
  signal addsub1_s_net : std_logic_vector( 18-1 downto 0 );
  signal addsub_s_net_x0 : std_logic_vector( 18-1 downto 0 );
  signal ce_net : std_logic;
  signal slice_y_net : std_logic_vector( 1-1 downto 0 );
  signal inverter_op_net : std_logic_vector( 1-1 downto 0 );
  signal shift_op_net : std_logic_vector( 18-1 downto 0 );
  signal addsub1_s_net_x0 : std_logic_vector( 18-1 downto 0 );
  signal shift1_op_net : std_logic_vector( 18-1 downto 0 );
  signal clk_net : std_logic;
begin
  x_x0 <= addsub_s_net;
  y_x0 <= addsub1_s_net;
  addsub_s_net_x0 <= x;
  addsub1_s_net_x0 <= y;
  clk_net <= clk_1;
  ce_net <= ce_1;
  addsub : entity work.sysgen_addsub_57882dc1c0 
  port map (
    clr => '0',
    a => addsub_s_net_x0,
    b => shift1_op_net,
    mode => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub_s_net
  );
  addsub1 : entity work.sysgen_addsub_57882dc1c0 
  port map (
    clr => '0',
    a => addsub1_s_net_x0,
    b => shift_op_net,
    mode => inverter_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub1_s_net
  );
  inverter : entity work.sysgen_inverter_962a38e1c8 
  port map (
    clr => '0',
    ip => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    op => inverter_op_net
  );
  shift : entity work.sysgen_shift_4aa3417b2c 
  port map (
    clr => '0',
    ip => addsub_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift_op_net
  );
  shift1 : entity work.sysgen_shift_4aa3417b2c 
  port map (
    clr => '0',
    ip => addsub1_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift1_op_net
  );
  slice : entity work.complexphasedetectorswap_xlslice 
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
-- Generated from Simulink block CORDIC PE8
library IEEE;
use IEEE.std_logic_1164.all;
library work;
use work.conv_pkg.all;
entity complexphasedetectorswap_cordic_pe8 is
  port (
    x : in std_logic_vector( 18-1 downto 0 );
    y : in std_logic_vector( 18-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    x_x0 : out std_logic_vector( 18-1 downto 0 )
  );
end complexphasedetectorswap_cordic_pe8;
architecture structural of complexphasedetectorswap_cordic_pe8 is 
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal shift1_op_net : std_logic_vector( 18-1 downto 0 );
  signal slice_y_net : std_logic_vector( 1-1 downto 0 );
  signal addsub1_s_net_x0 : std_logic_vector( 18-1 downto 0 );
  signal addsub_s_net : std_logic_vector( 18-1 downto 0 );
  signal addsub_s_net_x0 : std_logic_vector( 18-1 downto 0 );
begin
  x_x0 <= addsub_s_net;
  addsub_s_net_x0 <= x;
  addsub1_s_net_x0 <= y;
  clk_net <= clk_1;
  ce_net <= ce_1;
  addsub : entity work.sysgen_addsub_57882dc1c0 
  port map (
    clr => '0',
    a => addsub_s_net_x0,
    b => shift1_op_net,
    mode => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub_s_net
  );
  shift1 : entity work.sysgen_shift_895ddd41dd 
  port map (
    clr => '0',
    ip => addsub1_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift1_op_net
  );
  slice : entity work.complexphasedetectorswap_xlslice 
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
-- Generated from Simulink block CORDIC Fine Angle PE
library IEEE;
use IEEE.std_logic_1164.all;
library work;
use work.conv_pkg.all;
entity complexphasedetectorswap_cordic_fine_angle_pe_x3 is
  port (
    x_x0 : in std_logic_vector( 18-1 downto 0 );
    y : in std_logic_vector( 18-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    x : out std_logic_vector( 18-1 downto 0 )
  );
end complexphasedetectorswap_cordic_fine_angle_pe_x3;
architecture structural of complexphasedetectorswap_cordic_fine_angle_pe_x3 is 
  signal addsub1_s_net_x3 : std_logic_vector( 18-1 downto 0 );
  signal addsub_s_net_x3 : std_logic_vector( 18-1 downto 0 );
  signal addsub1_s_net_x2 : std_logic_vector( 18-1 downto 0 );
  signal addsub_s_net_x2 : std_logic_vector( 18-1 downto 0 );
  signal addsub1_s_net_x1 : std_logic_vector( 18-1 downto 0 );
  signal addsub_s_net_x1 : std_logic_vector( 18-1 downto 0 );
  signal addsub1_s_net_x0 : std_logic_vector( 18-1 downto 0 );
  signal addsub_s_net_x0 : std_logic_vector( 18-1 downto 0 );
  signal addsub1_s_net_x5 : std_logic_vector( 18-1 downto 0 );
  signal addsub_s_net_x5 : std_logic_vector( 18-1 downto 0 );
  signal addsub1_s_net_x4 : std_logic_vector( 18-1 downto 0 );
  signal addsub_s_net_x6 : std_logic_vector( 18-1 downto 0 );
  signal addsub1_s_net_x6 : std_logic_vector( 18-1 downto 0 );
  signal addsub_s_net : std_logic_vector( 18-1 downto 0 );
  signal clk_net : std_logic;
  signal delay3_q_net : std_logic_vector( 18-1 downto 0 );
  signal ce_net : std_logic;
  signal addsub_s_net_x4 : std_logic_vector( 18-1 downto 0 );
  signal mux_y_net : std_logic_vector( 18-1 downto 0 );
begin
  x <= addsub_s_net;
  mux_y_net <= x_x0;
  delay3_q_net <= y;
  clk_net <= clk_1;
  ce_net <= ce_1;
  cordic_pe1 : entity work.complexphasedetectorswap_cordic_pe1_x0 
  port map (
    x => mux_y_net,
    y => delay3_q_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    x_x0 => addsub_s_net_x4,
    y_x0 => addsub1_s_net_x3
  );
  cordic_pe2 : entity work.complexphasedetectorswap_cordic_pe2 
  port map (
    x => addsub_s_net_x4,
    y => addsub1_s_net_x3,
    clk_1 => clk_net,
    ce_1 => ce_net,
    x_x0 => addsub_s_net_x3,
    y_x0 => addsub1_s_net_x2
  );
  cordic_pe3 : entity work.complexphasedetectorswap_cordic_pe3 
  port map (
    x => addsub_s_net_x3,
    y => addsub1_s_net_x2,
    clk_1 => clk_net,
    ce_1 => ce_net,
    x_x0 => addsub_s_net_x2,
    y_x0 => addsub1_s_net_x1
  );
  cordic_pe4 : entity work.complexphasedetectorswap_cordic_pe4 
  port map (
    x => addsub_s_net_x2,
    y => addsub1_s_net_x1,
    clk_1 => clk_net,
    ce_1 => ce_net,
    x_x0 => addsub_s_net_x1,
    y_x0 => addsub1_s_net_x0
  );
  cordic_pe5 : entity work.complexphasedetectorswap_cordic_pe5 
  port map (
    x => addsub_s_net_x1,
    y => addsub1_s_net_x0,
    clk_1 => clk_net,
    ce_1 => ce_net,
    x_x0 => addsub_s_net_x0,
    y_x0 => addsub1_s_net_x5
  );
  cordic_pe6 : entity work.complexphasedetectorswap_cordic_pe6 
  port map (
    x => addsub_s_net_x0,
    y => addsub1_s_net_x5,
    clk_1 => clk_net,
    ce_1 => ce_net,
    x_x0 => addsub_s_net_x5,
    y_x0 => addsub1_s_net_x4
  );
  cordic_pe7 : entity work.complexphasedetectorswap_cordic_pe7 
  port map (
    x => addsub_s_net_x5,
    y => addsub1_s_net_x4,
    clk_1 => clk_net,
    ce_1 => ce_net,
    x_x0 => addsub_s_net_x6,
    y_x0 => addsub1_s_net_x6
  );
  cordic_pe8 : entity work.complexphasedetectorswap_cordic_pe8 
  port map (
    x => addsub_s_net_x6,
    y => addsub1_s_net_x6,
    clk_1 => clk_net,
    ce_1 => ce_net,
    x_x0 => addsub_s_net
  );
end structural;
-- Generated from Simulink block Quadrant Map
library IEEE;
use IEEE.std_logic_1164.all;
library work;
use work.conv_pkg.all;
entity complexphasedetectorswap_quadrant_map is
  port (
    x : in std_logic_vector( 18-1 downto 0 );
    y : in std_logic_vector( 18-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    x_x0 : out std_logic_vector( 18-1 downto 0 );
    y_x0 : out std_logic_vector( 18-1 downto 0 );
    sign_x : out std_logic_vector( 1-1 downto 0 )
  );
end complexphasedetectorswap_quadrant_map;
architecture structural of complexphasedetectorswap_quadrant_map is 
  signal delay3_q_net : std_logic_vector( 18-1 downto 0 );
  signal sgn_x_y_net : std_logic_vector( 1-1 downto 0 );
  signal addreals_s_net : std_logic_vector( 18-1 downto 0 );
  signal delay4_q_net : std_logic_vector( 18-1 downto 0 );
  signal addimags_s_net : std_logic_vector( 18-1 downto 0 );
  signal clk_net : std_logic;
  signal mux_y_net : std_logic_vector( 18-1 downto 0 );
  signal negate1_op_net : std_logic_vector( 18-1 downto 0 );
  signal ce_net : std_logic;
begin
  x_x0 <= mux_y_net;
  y_x0 <= delay3_q_net;
  sign_x <= sgn_x_y_net;
  addreals_s_net <= x;
  addimags_s_net <= y;
  clk_net <= clk_1;
  ce_net <= ce_1;
  delay3 : entity work.complexphasedetectorswap_xldelay 
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
  delay4 : entity work.complexphasedetectorswap_xldelay 
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
  mux : entity work.sysgen_mux_9d1f708c49 
  port map (
    clr => '0',
    sel => sgn_x_y_net,
    d0 => delay4_q_net,
    d1 => negate1_op_net,
    clk => clk_net,
    ce => ce_net,
    y => mux_y_net
  );
  negate1 : entity work.sysgen_negate_72e80c2b27 
  port map (
    clr => '0',
    ip => delay4_q_net,
    clk => clk_net,
    ce => ce_net,
    op => negate1_op_net
  );
  sgn_x : entity work.complexphasedetectorswap_xlslice 
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
-- Generated from Simulink block CORDIC ATAN
library IEEE;
use IEEE.std_logic_1164.all;
library work;
use work.conv_pkg.all;
entity complexphasedetectorswap_cordic_atan_x1 is
  port (
    x : in std_logic_vector( 18-1 downto 0 );
    y : in std_logic_vector( 18-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    x_x0 : out std_logic_vector( 18-1 downto 0 )
  );
end complexphasedetectorswap_cordic_atan_x1;
architecture structural of complexphasedetectorswap_cordic_atan_x1 is 
  signal cordic_pipe_balance2_q_net : std_logic_vector( 18-1 downto 0 );
  signal addimags_s_net : std_logic_vector( 18-1 downto 0 );
  signal mux_y_net : std_logic_vector( 18-1 downto 0 );
  signal delay3_q_net : std_logic_vector( 18-1 downto 0 );
  signal sgn_x_y_net : std_logic_vector( 1-1 downto 0 );
  signal addsub_s_net : std_logic_vector( 18-1 downto 0 );
  signal clk_net : std_logic;
  signal addreals_s_net : std_logic_vector( 18-1 downto 0 );
  signal ce_net : std_logic;
begin
  x_x0 <= cordic_pipe_balance2_q_net;
  addreals_s_net <= x;
  addimags_s_net <= y;
  clk_net <= clk_1;
  ce_net <= ce_1;
  cordic_fine_angle_pe : entity work.complexphasedetectorswap_cordic_fine_angle_pe_x3 
  port map (
    x_x0 => mux_y_net,
    y => delay3_q_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    x => addsub_s_net
  );
  quadrant_map : entity work.complexphasedetectorswap_quadrant_map 
  port map (
    x => addreals_s_net,
    y => addimags_s_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    x_x0 => mux_y_net,
    y_x0 => delay3_q_net,
    sign_x => sgn_x_y_net
  );
  cordic_pipe_balance2 : entity work.complexphasedetectorswap_xldelay 
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
-- Generated from Simulink block ChanSwapper
library IEEE;
use IEEE.std_logic_1164.all;
library work;
use work.conv_pkg.all;
entity complexphasedetectorswap_chanswapper is
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
end complexphasedetectorswap_chanswapper;
architecture structural of complexphasedetectorswap_chanswapper is 
  signal inverter3_op_net : std_logic_vector( 1-1 downto 0 );
  signal ch1imag_net : std_logic_vector( 18-1 downto 0 );
  signal mux3_y_net : std_logic_vector( 18-1 downto 0 );
  signal ch0imag_net : std_logic_vector( 18-1 downto 0 );
  signal reinterpret_output_port_net : std_logic_vector( 18-1 downto 0 );
  signal mux2_y_net : std_logic_vector( 18-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal delay_q_net : std_logic_vector( 1-1 downto 0 );
  signal mux1_y_net : std_logic_vector( 18-1 downto 0 );
  signal ch0real_net : std_logic_vector( 18-1 downto 0 );
  signal ch1real_net : std_logic_vector( 18-1 downto 0 );
  signal toppart_y_net : std_logic_vector( 17-1 downto 0 );
  signal mux_y_net : std_logic_vector( 18-1 downto 0 );
  signal concat_y_net : std_logic_vector( 18-1 downto 0 );
begin
  maxreal <= reinterpret_output_port_net;
  maximag <= mux2_y_net;
  minreal <= mux1_y_net;
  minimag <= mux3_y_net;
  ch1seldly <= delay_q_net;
  ch0real_net <= ch1real;
  ch0imag_net <= ch1imag;
  ch1real_net <= ch2real;
  ch1imag_net <= ch2imag;
  inverter3_op_net <= ch1sel;
  clk_net <= clk_1;
  ce_net <= ce_1;
  concat : entity work.sysgen_concat_57b608cd59 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    in0 => toppart_y_net,
    in1 => delay_q_net,
    y => concat_y_net
  );
  toppart : entity work.complexphasedetectorswap_xlslice 
  generic map (
    new_lsb => 1,
    new_msb => 17,
    x_width => 18,
    y_width => 17
  )
  port map (
    x => mux_y_net,
    y => toppart_y_net
  );
  reinterpret : entity work.sysgen_reinterpret_fbeafca946 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => concat_y_net,
    output_port => reinterpret_output_port_net
  );
  mux : entity work.sysgen_mux_2443262130 
  port map (
    clr => '0',
    sel => inverter3_op_net,
    d0 => ch1real_net,
    d1 => ch0real_net,
    clk => clk_net,
    ce => ce_net,
    y => mux_y_net
  );
  mux1 : entity work.sysgen_mux_2443262130 
  port map (
    clr => '0',
    sel => inverter3_op_net,
    d0 => ch0real_net,
    d1 => ch1real_net,
    clk => clk_net,
    ce => ce_net,
    y => mux1_y_net
  );
  mux2 : entity work.sysgen_mux_2443262130 
  port map (
    clr => '0',
    sel => inverter3_op_net,
    d0 => ch1imag_net,
    d1 => ch0imag_net,
    clk => clk_net,
    ce => ce_net,
    y => mux2_y_net
  );
  mux3 : entity work.sysgen_mux_2443262130 
  port map (
    clr => '0',
    sel => inverter3_op_net,
    d0 => ch0imag_net,
    d1 => ch1imag_net,
    clk => clk_net,
    ce => ce_net,
    y => mux3_y_net
  );
  delay : entity work.complexphasedetectorswap_xldelay 
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
end structural;
-- Generated from Simulink block CORDIC PE1
library IEEE;
use IEEE.std_logic_1164.all;
library work;
use work.conv_pkg.all;
entity complexphasedetectorswap_cordic_pe1_x2 is
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
end complexphasedetectorswap_cordic_pe1_x2;
architecture structural of complexphasedetectorswap_cordic_pe1_x2 is 
  signal addsub1_s_net : std_logic_vector( 18-1 downto 0 );
  signal delay3_q_net : std_logic_vector( 18-1 downto 0 );
  signal addsub2_s_net : std_logic_vector( 18-1 downto 0 );
  signal clk_net : std_logic;
  signal constant_op_net : std_logic_vector( 18-1 downto 0 );
  signal ce_net : std_logic;
  signal addsub_s_net : std_logic_vector( 18-1 downto 0 );
  signal mux_y_net : std_logic_vector( 18-1 downto 0 );
  signal slice_y_net : std_logic_vector( 1-1 downto 0 );
  signal shift1_op_net : std_logic_vector( 18-1 downto 0 );
  signal constant_op_net_x0 : std_logic_vector( 18-1 downto 0 );
  signal inverter_op_net : std_logic_vector( 1-1 downto 0 );
  signal shift_op_net : std_logic_vector( 18-1 downto 0 );
begin
  x_x0 <= addsub_s_net;
  y_x0 <= addsub1_s_net;
  z_x0 <= addsub2_s_net;
  mux_y_net <= x;
  delay3_q_net <= y;
  constant_op_net <= z;
  clk_net <= clk_1;
  ce_net <= ce_1;
  addsub : entity work.sysgen_addsub_f39f3afbc8 
  port map (
    clr => '0',
    a => mux_y_net,
    b => shift1_op_net,
    mode => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub_s_net
  );
  addsub1 : entity work.sysgen_addsub_f39f3afbc8 
  port map (
    clr => '0',
    a => delay3_q_net,
    b => shift_op_net,
    mode => inverter_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub1_s_net
  );
  addsub2 : entity work.sysgen_addsub_f39f3afbc8 
  port map (
    clr => '0',
    a => constant_op_net,
    b => constant_op_net_x0,
    mode => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub2_s_net
  );
  constant_x0 : entity work.sysgen_constant_ac8091a70a 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net_x0
  );
  inverter : entity work.sysgen_inverter_962a38e1c8 
  port map (
    clr => '0',
    ip => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    op => inverter_op_net
  );
  shift : entity work.sysgen_shift_92b2ba157c 
  port map (
    clr => '0',
    ip => mux_y_net,
    clk => clk_net,
    ce => ce_net,
    op => shift_op_net
  );
  shift1 : entity work.sysgen_shift_92b2ba157c 
  port map (
    clr => '0',
    ip => delay3_q_net,
    clk => clk_net,
    ce => ce_net,
    op => shift1_op_net
  );
  slice : entity work.complexphasedetectorswap_xlslice 
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
-- Generated from Simulink block CORDIC PE10
library IEEE;
use IEEE.std_logic_1164.all;
library work;
use work.conv_pkg.all;
entity complexphasedetectorswap_cordic_pe10_x0 is
  port (
    x : in std_logic_vector( 18-1 downto 0 );
    y : in std_logic_vector( 18-1 downto 0 );
    z : in std_logic_vector( 18-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    x_x0 : out std_logic_vector( 18-1 downto 0 );
    z_x0 : out std_logic_vector( 18-1 downto 0 )
  );
end complexphasedetectorswap_cordic_pe10_x0;
architecture structural of complexphasedetectorswap_cordic_pe10_x0 is 
  signal ce_net : std_logic;
  signal addsub_s_net_x0 : std_logic_vector( 18-1 downto 0 );
  signal addsub1_s_net : std_logic_vector( 18-1 downto 0 );
  signal addsub2_s_net_x0 : std_logic_vector( 18-1 downto 0 );
  signal addsub_s_net : std_logic_vector( 18-1 downto 0 );
  signal clk_net : std_logic;
  signal addsub2_s_net : std_logic_vector( 18-1 downto 0 );
  signal slice_y_net : std_logic_vector( 1-1 downto 0 );
  signal shift1_op_net : std_logic_vector( 18-1 downto 0 );
  signal constant_op_net : std_logic_vector( 18-1 downto 0 );
begin
  x_x0 <= addsub_s_net_x0;
  z_x0 <= addsub2_s_net_x0;
  addsub_s_net <= x;
  addsub1_s_net <= y;
  addsub2_s_net <= z;
  clk_net <= clk_1;
  ce_net <= ce_1;
  addsub : entity work.sysgen_addsub_f39f3afbc8 
  port map (
    clr => '0',
    a => addsub_s_net,
    b => shift1_op_net,
    mode => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub_s_net_x0
  );
  addsub2 : entity work.sysgen_addsub_f39f3afbc8 
  port map (
    clr => '0',
    a => addsub2_s_net,
    b => constant_op_net,
    mode => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub2_s_net_x0
  );
  constant_x0 : entity work.sysgen_constant_922ccc3cba 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  shift1 : entity work.sysgen_shift_9984eb108b 
  port map (
    clr => '0',
    ip => addsub1_s_net,
    clk => clk_net,
    ce => ce_net,
    op => shift1_op_net
  );
  slice : entity work.complexphasedetectorswap_xlslice 
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
-- Generated from Simulink block CORDIC PE2
library IEEE;
use IEEE.std_logic_1164.all;
library work;
use work.conv_pkg.all;
entity complexphasedetectorswap_cordic_pe2_x1 is
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
end complexphasedetectorswap_cordic_pe2_x1;
architecture structural of complexphasedetectorswap_cordic_pe2_x1 is 
  signal addsub2_s_net_x0 : std_logic_vector( 18-1 downto 0 );
  signal clk_net : std_logic;
  signal slice_y_net : std_logic_vector( 1-1 downto 0 );
  signal shift1_op_net : std_logic_vector( 18-1 downto 0 );
  signal addsub1_s_net : std_logic_vector( 18-1 downto 0 );
  signal shift_op_net : std_logic_vector( 18-1 downto 0 );
  signal inverter_op_net : std_logic_vector( 1-1 downto 0 );
  signal addsub2_s_net : std_logic_vector( 18-1 downto 0 );
  signal ce_net : std_logic;
  signal addsub1_s_net_x0 : std_logic_vector( 18-1 downto 0 );
  signal addsub_s_net : std_logic_vector( 18-1 downto 0 );
  signal addsub_s_net_x0 : std_logic_vector( 18-1 downto 0 );
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
  addsub : entity work.sysgen_addsub_f39f3afbc8 
  port map (
    clr => '0',
    a => addsub_s_net_x0,
    b => shift1_op_net,
    mode => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub_s_net
  );
  addsub1 : entity work.sysgen_addsub_f39f3afbc8 
  port map (
    clr => '0',
    a => addsub1_s_net_x0,
    b => shift_op_net,
    mode => inverter_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub1_s_net
  );
  addsub2 : entity work.sysgen_addsub_f39f3afbc8 
  port map (
    clr => '0',
    a => addsub2_s_net_x0,
    b => constant_op_net,
    mode => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub2_s_net
  );
  constant_x0 : entity work.sysgen_constant_c2da223b56 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  inverter : entity work.sysgen_inverter_962a38e1c8 
  port map (
    clr => '0',
    ip => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    op => inverter_op_net
  );
  shift : entity work.sysgen_shift_a7e16e1076 
  port map (
    clr => '0',
    ip => addsub_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift_op_net
  );
  shift1 : entity work.sysgen_shift_a7e16e1076 
  port map (
    clr => '0',
    ip => addsub1_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift1_op_net
  );
  slice : entity work.complexphasedetectorswap_xlslice 
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
-- Generated from Simulink block CORDIC PE3
library IEEE;
use IEEE.std_logic_1164.all;
library work;
use work.conv_pkg.all;
entity complexphasedetectorswap_cordic_pe3_x1 is
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
end complexphasedetectorswap_cordic_pe3_x1;
architecture structural of complexphasedetectorswap_cordic_pe3_x1 is 
  signal addsub1_s_net_x0 : std_logic_vector( 18-1 downto 0 );
  signal ce_net : std_logic;
  signal shift1_op_net : std_logic_vector( 18-1 downto 0 );
  signal addsub1_s_net : std_logic_vector( 18-1 downto 0 );
  signal slice_y_net : std_logic_vector( 1-1 downto 0 );
  signal shift_op_net : std_logic_vector( 18-1 downto 0 );
  signal clk_net : std_logic;
  signal addsub_s_net : std_logic_vector( 18-1 downto 0 );
  signal addsub2_s_net_x0 : std_logic_vector( 18-1 downto 0 );
  signal inverter_op_net : std_logic_vector( 1-1 downto 0 );
  signal addsub_s_net_x0 : std_logic_vector( 18-1 downto 0 );
  signal addsub2_s_net : std_logic_vector( 18-1 downto 0 );
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
  addsub : entity work.sysgen_addsub_f39f3afbc8 
  port map (
    clr => '0',
    a => addsub_s_net_x0,
    b => shift1_op_net,
    mode => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub_s_net
  );
  addsub1 : entity work.sysgen_addsub_f39f3afbc8 
  port map (
    clr => '0',
    a => addsub1_s_net_x0,
    b => shift_op_net,
    mode => inverter_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub1_s_net
  );
  addsub2 : entity work.sysgen_addsub_f39f3afbc8 
  port map (
    clr => '0',
    a => addsub2_s_net_x0,
    b => constant_op_net,
    mode => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub2_s_net
  );
  constant_x0 : entity work.sysgen_constant_f11abb1882 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  inverter : entity work.sysgen_inverter_962a38e1c8 
  port map (
    clr => '0',
    ip => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    op => inverter_op_net
  );
  shift : entity work.sysgen_shift_d5070b7066 
  port map (
    clr => '0',
    ip => addsub_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift_op_net
  );
  shift1 : entity work.sysgen_shift_d5070b7066 
  port map (
    clr => '0',
    ip => addsub1_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift1_op_net
  );
  slice : entity work.complexphasedetectorswap_xlslice 
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
-- Generated from Simulink block CORDIC PE4
library IEEE;
use IEEE.std_logic_1164.all;
library work;
use work.conv_pkg.all;
entity complexphasedetectorswap_cordic_pe4_x1 is
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
end complexphasedetectorswap_cordic_pe4_x1;
architecture structural of complexphasedetectorswap_cordic_pe4_x1 is 
  signal inverter_op_net : std_logic_vector( 1-1 downto 0 );
  signal clk_net : std_logic;
  signal shift1_op_net : std_logic_vector( 18-1 downto 0 );
  signal addsub_s_net : std_logic_vector( 18-1 downto 0 );
  signal slice_y_net : std_logic_vector( 1-1 downto 0 );
  signal shift_op_net : std_logic_vector( 18-1 downto 0 );
  signal addsub2_s_net_x0 : std_logic_vector( 18-1 downto 0 );
  signal addsub2_s_net : std_logic_vector( 18-1 downto 0 );
  signal ce_net : std_logic;
  signal addsub_s_net_x0 : std_logic_vector( 18-1 downto 0 );
  signal addsub1_s_net : std_logic_vector( 18-1 downto 0 );
  signal addsub1_s_net_x0 : std_logic_vector( 18-1 downto 0 );
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
  addsub : entity work.sysgen_addsub_f39f3afbc8 
  port map (
    clr => '0',
    a => addsub_s_net_x0,
    b => shift1_op_net,
    mode => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub_s_net
  );
  addsub1 : entity work.sysgen_addsub_f39f3afbc8 
  port map (
    clr => '0',
    a => addsub1_s_net_x0,
    b => shift_op_net,
    mode => inverter_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub1_s_net
  );
  addsub2 : entity work.sysgen_addsub_f39f3afbc8 
  port map (
    clr => '0',
    a => addsub2_s_net_x0,
    b => constant_op_net,
    mode => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub2_s_net
  );
  constant_x0 : entity work.sysgen_constant_843ef6a003 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  inverter : entity work.sysgen_inverter_962a38e1c8 
  port map (
    clr => '0',
    ip => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    op => inverter_op_net
  );
  shift : entity work.sysgen_shift_fb7007cdba 
  port map (
    clr => '0',
    ip => addsub_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift_op_net
  );
  shift1 : entity work.sysgen_shift_fb7007cdba 
  port map (
    clr => '0',
    ip => addsub1_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift1_op_net
  );
  slice : entity work.complexphasedetectorswap_xlslice 
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
-- Generated from Simulink block CORDIC PE5
library IEEE;
use IEEE.std_logic_1164.all;
library work;
use work.conv_pkg.all;
entity complexphasedetectorswap_cordic_pe5_x1 is
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
end complexphasedetectorswap_cordic_pe5_x1;
architecture structural of complexphasedetectorswap_cordic_pe5_x1 is 
  signal addsub2_s_net : std_logic_vector( 18-1 downto 0 );
  signal addsub_s_net_x0 : std_logic_vector( 18-1 downto 0 );
  signal addsub_s_net : std_logic_vector( 18-1 downto 0 );
  signal clk_net : std_logic;
  signal addsub2_s_net_x0 : std_logic_vector( 18-1 downto 0 );
  signal ce_net : std_logic;
  signal inverter_op_net : std_logic_vector( 1-1 downto 0 );
  signal slice_y_net : std_logic_vector( 1-1 downto 0 );
  signal addsub1_s_net : std_logic_vector( 18-1 downto 0 );
  signal addsub1_s_net_x0 : std_logic_vector( 18-1 downto 0 );
  signal shift1_op_net : std_logic_vector( 18-1 downto 0 );
  signal shift_op_net : std_logic_vector( 18-1 downto 0 );
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
  addsub : entity work.sysgen_addsub_f39f3afbc8 
  port map (
    clr => '0',
    a => addsub_s_net_x0,
    b => shift1_op_net,
    mode => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub_s_net
  );
  addsub1 : entity work.sysgen_addsub_f39f3afbc8 
  port map (
    clr => '0',
    a => addsub1_s_net_x0,
    b => shift_op_net,
    mode => inverter_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub1_s_net
  );
  addsub2 : entity work.sysgen_addsub_f39f3afbc8 
  port map (
    clr => '0',
    a => addsub2_s_net_x0,
    b => constant_op_net,
    mode => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub2_s_net
  );
  constant_x0 : entity work.sysgen_constant_b7c0834892 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  inverter : entity work.sysgen_inverter_962a38e1c8 
  port map (
    clr => '0',
    ip => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    op => inverter_op_net
  );
  shift : entity work.sysgen_shift_4f351bbb32 
  port map (
    clr => '0',
    ip => addsub_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift_op_net
  );
  shift1 : entity work.sysgen_shift_4f351bbb32 
  port map (
    clr => '0',
    ip => addsub1_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift1_op_net
  );
  slice : entity work.complexphasedetectorswap_xlslice 
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
-- Generated from Simulink block CORDIC PE6
library IEEE;
use IEEE.std_logic_1164.all;
library work;
use work.conv_pkg.all;
entity complexphasedetectorswap_cordic_pe6_x1 is
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
end complexphasedetectorswap_cordic_pe6_x1;
architecture structural of complexphasedetectorswap_cordic_pe6_x1 is 
  signal addsub_s_net : std_logic_vector( 18-1 downto 0 );
  signal shift1_op_net : std_logic_vector( 18-1 downto 0 );
  signal addsub_s_net_x0 : std_logic_vector( 18-1 downto 0 );
  signal shift_op_net : std_logic_vector( 18-1 downto 0 );
  signal inverter_op_net : std_logic_vector( 1-1 downto 0 );
  signal slice_y_net : std_logic_vector( 1-1 downto 0 );
  signal addsub1_s_net_x0 : std_logic_vector( 18-1 downto 0 );
  signal addsub2_s_net_x0 : std_logic_vector( 18-1 downto 0 );
  signal addsub2_s_net : std_logic_vector( 18-1 downto 0 );
  signal ce_net : std_logic;
  signal addsub1_s_net : std_logic_vector( 18-1 downto 0 );
  signal clk_net : std_logic;
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
  addsub : entity work.sysgen_addsub_f39f3afbc8 
  port map (
    clr => '0',
    a => addsub_s_net_x0,
    b => shift1_op_net,
    mode => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub_s_net
  );
  addsub1 : entity work.sysgen_addsub_f39f3afbc8 
  port map (
    clr => '0',
    a => addsub1_s_net_x0,
    b => shift_op_net,
    mode => inverter_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub1_s_net
  );
  addsub2 : entity work.sysgen_addsub_f39f3afbc8 
  port map (
    clr => '0',
    a => addsub2_s_net_x0,
    b => constant_op_net,
    mode => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub2_s_net
  );
  constant_x0 : entity work.sysgen_constant_6e5746b33f 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  inverter : entity work.sysgen_inverter_962a38e1c8 
  port map (
    clr => '0',
    ip => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    op => inverter_op_net
  );
  shift : entity work.sysgen_shift_b9e228f9d1 
  port map (
    clr => '0',
    ip => addsub_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift_op_net
  );
  shift1 : entity work.sysgen_shift_b9e228f9d1 
  port map (
    clr => '0',
    ip => addsub1_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift1_op_net
  );
  slice : entity work.complexphasedetectorswap_xlslice 
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
-- Generated from Simulink block CORDIC PE7
library IEEE;
use IEEE.std_logic_1164.all;
library work;
use work.conv_pkg.all;
entity complexphasedetectorswap_cordic_pe7_x1 is
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
end complexphasedetectorswap_cordic_pe7_x1;
architecture structural of complexphasedetectorswap_cordic_pe7_x1 is 
  signal shift_op_net : std_logic_vector( 18-1 downto 0 );
  signal addsub1_s_net : std_logic_vector( 18-1 downto 0 );
  signal ce_net : std_logic;
  signal slice_y_net : std_logic_vector( 1-1 downto 0 );
  signal addsub1_s_net_x0 : std_logic_vector( 18-1 downto 0 );
  signal shift1_op_net : std_logic_vector( 18-1 downto 0 );
  signal addsub_s_net_x0 : std_logic_vector( 18-1 downto 0 );
  signal addsub_s_net : std_logic_vector( 18-1 downto 0 );
  signal inverter_op_net : std_logic_vector( 1-1 downto 0 );
  signal addsub2_s_net : std_logic_vector( 18-1 downto 0 );
  signal addsub2_s_net_x0 : std_logic_vector( 18-1 downto 0 );
  signal clk_net : std_logic;
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
  addsub : entity work.sysgen_addsub_f39f3afbc8 
  port map (
    clr => '0',
    a => addsub_s_net_x0,
    b => shift1_op_net,
    mode => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub_s_net
  );
  addsub1 : entity work.sysgen_addsub_f39f3afbc8 
  port map (
    clr => '0',
    a => addsub1_s_net_x0,
    b => shift_op_net,
    mode => inverter_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub1_s_net
  );
  addsub2 : entity work.sysgen_addsub_f39f3afbc8 
  port map (
    clr => '0',
    a => addsub2_s_net_x0,
    b => constant_op_net,
    mode => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub2_s_net
  );
  constant_x0 : entity work.sysgen_constant_00547b9a45 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  inverter : entity work.sysgen_inverter_962a38e1c8 
  port map (
    clr => '0',
    ip => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    op => inverter_op_net
  );
  shift : entity work.sysgen_shift_fa1063212e 
  port map (
    clr => '0',
    ip => addsub_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift_op_net
  );
  shift1 : entity work.sysgen_shift_fa1063212e 
  port map (
    clr => '0',
    ip => addsub1_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift1_op_net
  );
  slice : entity work.complexphasedetectorswap_xlslice 
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
-- Generated from Simulink block CORDIC PE8
library IEEE;
use IEEE.std_logic_1164.all;
library work;
use work.conv_pkg.all;
entity complexphasedetectorswap_cordic_pe8_x1 is
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
end complexphasedetectorswap_cordic_pe8_x1;
architecture structural of complexphasedetectorswap_cordic_pe8_x1 is 
  signal addsub1_s_net : std_logic_vector( 18-1 downto 0 );
  signal addsub_s_net : std_logic_vector( 18-1 downto 0 );
  signal ce_net : std_logic;
  signal addsub2_s_net_x0 : std_logic_vector( 18-1 downto 0 );
  signal shift1_op_net : std_logic_vector( 18-1 downto 0 );
  signal addsub2_s_net : std_logic_vector( 18-1 downto 0 );
  signal addsub1_s_net_x0 : std_logic_vector( 18-1 downto 0 );
  signal shift_op_net : std_logic_vector( 18-1 downto 0 );
  signal slice_y_net : std_logic_vector( 1-1 downto 0 );
  signal inverter_op_net : std_logic_vector( 1-1 downto 0 );
  signal addsub_s_net_x0 : std_logic_vector( 18-1 downto 0 );
  signal clk_net : std_logic;
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
  addsub : entity work.sysgen_addsub_f39f3afbc8 
  port map (
    clr => '0',
    a => addsub_s_net_x0,
    b => shift1_op_net,
    mode => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub_s_net
  );
  addsub1 : entity work.sysgen_addsub_f39f3afbc8 
  port map (
    clr => '0',
    a => addsub1_s_net_x0,
    b => shift_op_net,
    mode => inverter_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub1_s_net
  );
  addsub2 : entity work.sysgen_addsub_f39f3afbc8 
  port map (
    clr => '0',
    a => addsub2_s_net_x0,
    b => constant_op_net,
    mode => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub2_s_net
  );
  constant_x0 : entity work.sysgen_constant_3f022203c4 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  inverter : entity work.sysgen_inverter_962a38e1c8 
  port map (
    clr => '0',
    ip => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    op => inverter_op_net
  );
  shift : entity work.sysgen_shift_d629be46c3 
  port map (
    clr => '0',
    ip => addsub_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift_op_net
  );
  shift1 : entity work.sysgen_shift_d629be46c3 
  port map (
    clr => '0',
    ip => addsub1_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift1_op_net
  );
  slice : entity work.complexphasedetectorswap_xlslice 
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
-- Generated from Simulink block CORDIC PE9
library IEEE;
use IEEE.std_logic_1164.all;
library work;
use work.conv_pkg.all;
entity complexphasedetectorswap_cordic_pe9_x0 is
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
end complexphasedetectorswap_cordic_pe9_x0;
architecture structural of complexphasedetectorswap_cordic_pe9_x0 is 
  signal addsub2_s_net : std_logic_vector( 18-1 downto 0 );
  signal slice_y_net : std_logic_vector( 1-1 downto 0 );
  signal addsub_s_net : std_logic_vector( 18-1 downto 0 );
  signal addsub1_s_net_x0 : std_logic_vector( 18-1 downto 0 );
  signal ce_net : std_logic;
  signal shift1_op_net : std_logic_vector( 18-1 downto 0 );
  signal constant_op_net : std_logic_vector( 18-1 downto 0 );
  signal clk_net : std_logic;
  signal addsub2_s_net_x0 : std_logic_vector( 18-1 downto 0 );
  signal shift_op_net : std_logic_vector( 18-1 downto 0 );
  signal inverter_op_net : std_logic_vector( 1-1 downto 0 );
  signal addsub1_s_net : std_logic_vector( 18-1 downto 0 );
  signal addsub_s_net_x0 : std_logic_vector( 18-1 downto 0 );
begin
  x_x0 <= addsub_s_net;
  y_x0 <= addsub1_s_net;
  z_x0 <= addsub2_s_net;
  addsub_s_net_x0 <= x;
  addsub1_s_net_x0 <= y;
  addsub2_s_net_x0 <= z;
  clk_net <= clk_1;
  ce_net <= ce_1;
  addsub : entity work.sysgen_addsub_f39f3afbc8 
  port map (
    clr => '0',
    a => addsub_s_net_x0,
    b => shift1_op_net,
    mode => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub_s_net
  );
  addsub1 : entity work.sysgen_addsub_f39f3afbc8 
  port map (
    clr => '0',
    a => addsub1_s_net_x0,
    b => shift_op_net,
    mode => inverter_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub1_s_net
  );
  addsub2 : entity work.sysgen_addsub_f39f3afbc8 
  port map (
    clr => '0',
    a => addsub2_s_net_x0,
    b => constant_op_net,
    mode => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub2_s_net
  );
  constant_x0 : entity work.sysgen_constant_ffe8a1da3c 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  inverter : entity work.sysgen_inverter_962a38e1c8 
  port map (
    clr => '0',
    ip => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    op => inverter_op_net
  );
  shift : entity work.sysgen_shift_6ea6ac33cb 
  port map (
    clr => '0',
    ip => addsub_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift_op_net
  );
  shift1 : entity work.sysgen_shift_6ea6ac33cb 
  port map (
    clr => '0',
    ip => addsub1_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift1_op_net
  );
  slice : entity work.complexphasedetectorswap_xlslice 
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
-- Generated from Simulink block CORDIC Fine Angle PE
library IEEE;
use IEEE.std_logic_1164.all;
library work;
use work.conv_pkg.all;
entity complexphasedetectorswap_cordic_fine_angle_pe_x1 is
  port (
    x_x0 : in std_logic_vector( 18-1 downto 0 );
    y : in std_logic_vector( 18-1 downto 0 );
    z : in std_logic_vector( 18-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    x : out std_logic_vector( 18-1 downto 0 );
    z_x0 : out std_logic_vector( 18-1 downto 0 )
  );
end complexphasedetectorswap_cordic_fine_angle_pe_x1;
architecture structural of complexphasedetectorswap_cordic_fine_angle_pe_x1 is 
  signal addsub2_s_net_x2 : std_logic_vector( 18-1 downto 0 );
  signal addsub_s_net_x7 : std_logic_vector( 18-1 downto 0 );
  signal addsub1_s_net : std_logic_vector( 18-1 downto 0 );
  signal addsub2_s_net_x8 : std_logic_vector( 18-1 downto 0 );
  signal delay3_q_net : std_logic_vector( 18-1 downto 0 );
  signal addsub2_s_net_x7 : std_logic_vector( 18-1 downto 0 );
  signal addsub_s_net_x8 : std_logic_vector( 18-1 downto 0 );
  signal addsub1_s_net_x2 : std_logic_vector( 18-1 downto 0 );
  signal addsub2_s_net_x4 : std_logic_vector( 18-1 downto 0 );
  signal mux_y_net : std_logic_vector( 18-1 downto 0 );
  signal addsub1_s_net_x1 : std_logic_vector( 18-1 downto 0 );
  signal addsub1_s_net_x5 : std_logic_vector( 18-1 downto 0 );
  signal clk_net : std_logic;
  signal addsub_s_net_x3 : std_logic_vector( 18-1 downto 0 );
  signal addsub1_s_net_x6 : std_logic_vector( 18-1 downto 0 );
  signal addsub2_s_net : std_logic_vector( 18-1 downto 0 );
  signal addsub_s_net_x2 : std_logic_vector( 18-1 downto 0 );
  signal addsub2_s_net_x3 : std_logic_vector( 18-1 downto 0 );
  signal addsub_s_net_x1 : std_logic_vector( 18-1 downto 0 );
  signal addsub2_s_net_x5 : std_logic_vector( 18-1 downto 0 );
  signal addsub_s_net_x4 : std_logic_vector( 18-1 downto 0 );
  signal addsub_s_net_x5 : std_logic_vector( 18-1 downto 0 );
  signal addsub2_s_net_x6 : std_logic_vector( 18-1 downto 0 );
  signal addsub_s_net_x6 : std_logic_vector( 18-1 downto 0 );
  signal addsub1_s_net_x8 : std_logic_vector( 18-1 downto 0 );
  signal addsub1_s_net_x3 : std_logic_vector( 18-1 downto 0 );
  signal addsub1_s_net_x0 : std_logic_vector( 18-1 downto 0 );
  signal addsub2_s_net_x0 : std_logic_vector( 18-1 downto 0 );
  signal constant_op_net : std_logic_vector( 18-1 downto 0 );
  signal ce_net : std_logic;
  signal addsub_s_net : std_logic_vector( 18-1 downto 0 );
  signal addsub_s_net_x0 : std_logic_vector( 18-1 downto 0 );
  signal addsub2_s_net_x1 : std_logic_vector( 18-1 downto 0 );
  signal addsub1_s_net_x7 : std_logic_vector( 18-1 downto 0 );
begin
  x <= addsub_s_net_x3;
  z_x0 <= addsub2_s_net_x4;
  mux_y_net <= x_x0;
  delay3_q_net <= y;
  constant_op_net <= z;
  clk_net <= clk_1;
  ce_net <= ce_1;
  cordic_pe1 : entity work.complexphasedetectorswap_cordic_pe1_x2 
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
  cordic_pe10 : entity work.complexphasedetectorswap_cordic_pe10_x0 
  port map (
    x => addsub_s_net,
    y => addsub1_s_net,
    z => addsub2_s_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    x_x0 => addsub_s_net_x3,
    z_x0 => addsub2_s_net_x4
  );
  cordic_pe2 : entity work.complexphasedetectorswap_cordic_pe2_x1 
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
  cordic_pe3 : entity work.complexphasedetectorswap_cordic_pe3_x1 
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
  cordic_pe4 : entity work.complexphasedetectorswap_cordic_pe4_x1 
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
  cordic_pe5 : entity work.complexphasedetectorswap_cordic_pe5_x1 
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
  cordic_pe6 : entity work.complexphasedetectorswap_cordic_pe6_x1 
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
  cordic_pe7 : entity work.complexphasedetectorswap_cordic_pe7_x1 
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
  cordic_pe8 : entity work.complexphasedetectorswap_cordic_pe8_x1 
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
  cordic_pe9 : entity work.complexphasedetectorswap_cordic_pe9_x0 
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
-- Generated from Simulink block Quadrant Correct
library IEEE;
use IEEE.std_logic_1164.all;
library work;
use work.conv_pkg.all;
entity complexphasedetectorswap_quadrant_correct_x0 is
  port (
    z_in : in std_logic_vector( 18-1 downto 0 );
    pi_addsub : in std_logic_vector( 1-1 downto 0 );
    z_mux_sel : in std_logic_vector( 1-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    z : out std_logic_vector( 18-1 downto 0 )
  );
end complexphasedetectorswap_quadrant_correct_x0;
architecture structural of complexphasedetectorswap_quadrant_correct_x0 is 
  signal addsub_s_net : std_logic_vector( 18-1 downto 0 );
  signal pi_op_net : std_logic_vector( 18-1 downto 0 );
  signal mux1_y_net : std_logic_vector( 18-1 downto 0 );
  signal clk_net : std_logic;
  signal pi_op_net_x0 : std_logic_vector( 18-1 downto 0 );
  signal cordic_pipe_balance1_q_net : std_logic_vector( 1-1 downto 0 );
  signal cordic_pipe_balance_q_net : std_logic_vector( 1-1 downto 0 );
  signal addsub2_s_net : std_logic_vector( 18-1 downto 0 );
  signal mux_y_net : std_logic_vector( 18-1 downto 0 );
  signal ce_net : std_logic;
  signal convert_dout_net : std_logic_vector( 1-1 downto 0 );
begin
  z <= mux_y_net;
  addsub2_s_net <= z_in;
  cordic_pipe_balance_q_net <= pi_addsub;
  cordic_pipe_balance1_q_net <= z_mux_sel;
  clk_net <= clk_1;
  ce_net <= ce_1;
  pi : entity work.sysgen_constant_2c29706180 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => pi_op_net_x0
  );
  pi_x0 : entity work.sysgen_constant_7c546c6b7a 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => pi_op_net
  );
  addsub : entity work.sysgen_addsub_1b85e67d21 
  port map (
    clr => '0',
    a => mux1_y_net,
    b => addsub2_s_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub_s_net
  );
  convert : entity work.complexphasedetectorswap_xlconvert 
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
  mux : entity work.sysgen_mux_9d1f708c49 
  port map (
    clr => '0',
    sel => cordic_pipe_balance1_q_net,
    d0 => addsub2_s_net,
    d1 => addsub_s_net,
    clk => clk_net,
    ce => ce_net,
    y => mux_y_net
  );
  mux1 : entity work.sysgen_mux_a5970e32a5 
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
-- Generated from Simulink block Quadrant Map
library IEEE;
use IEEE.std_logic_1164.all;
library work;
use work.conv_pkg.all;
entity complexphasedetectorswap_quadrant_map_x1 is
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
end complexphasedetectorswap_quadrant_map_x1;
architecture structural of complexphasedetectorswap_quadrant_map_x1 is 
  signal phase_detect_m_axis_dout_tdata_real_net : std_logic_vector( 18-1 downto 0 );
  signal mux_y_net : std_logic_vector( 18-1 downto 0 );
  signal delay3_q_net : std_logic_vector( 18-1 downto 0 );
  signal phase_detect_m_axis_dout_tdata_imag_net : std_logic_vector( 18-1 downto 0 );
  signal sgn_x_y_net : std_logic_vector( 1-1 downto 0 );
  signal sgn_y_y_net : std_logic_vector( 1-1 downto 0 );
  signal negate1_op_net : std_logic_vector( 18-1 downto 0 );
  signal ce_net : std_logic;
  signal delay4_q_net : std_logic_vector( 18-1 downto 0 );
  signal clk_net : std_logic;
begin
  x_x0 <= mux_y_net;
  y_x0 <= delay3_q_net;
  sign_y <= sgn_y_y_net;
  sign_x <= sgn_x_y_net;
  phase_detect_m_axis_dout_tdata_real_net <= x;
  phase_detect_m_axis_dout_tdata_imag_net <= y;
  clk_net <= clk_1;
  ce_net <= ce_1;
  delay3 : entity work.complexphasedetectorswap_xldelay 
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
  delay4 : entity work.complexphasedetectorswap_xldelay 
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
  mux : entity work.sysgen_mux_9d1f708c49 
  port map (
    clr => '0',
    sel => sgn_x_y_net,
    d0 => delay4_q_net,
    d1 => negate1_op_net,
    clk => clk_net,
    ce => ce_net,
    y => mux_y_net
  );
  negate1 : entity work.sysgen_negate_59bd001cc4 
  port map (
    clr => '0',
    ip => delay4_q_net,
    clk => clk_net,
    ce => ce_net,
    op => negate1_op_net
  );
  sgn_x : entity work.complexphasedetectorswap_xlslice 
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
  sgn_y : entity work.complexphasedetectorswap_xlslice 
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
-- Generated from Simulink block CORDIC ATAN
library IEEE;
use IEEE.std_logic_1164.all;
library work;
use work.conv_pkg.all;
entity complexphasedetectorswap_cordic_atan_x0 is
  port (
    x : in std_logic_vector( 18-1 downto 0 );
    y : in std_logic_vector( 18-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    x_x0 : out std_logic_vector( 18-1 downto 0 );
    z : out std_logic_vector( 18-1 downto 0 )
  );
end complexphasedetectorswap_cordic_atan_x0;
architecture structural of complexphasedetectorswap_cordic_atan_x0 is 
  signal mux_y_net : std_logic_vector( 18-1 downto 0 );
  signal constant_op_net : std_logic_vector( 18-1 downto 0 );
  signal cordic_pipe_balance_q_net : std_logic_vector( 1-1 downto 0 );
  signal sgn_y_y_net : std_logic_vector( 1-1 downto 0 );
  signal sgn_x_y_net : std_logic_vector( 1-1 downto 0 );
  signal addsub2_s_net : std_logic_vector( 18-1 downto 0 );
  signal phase_detect_m_axis_dout_tdata_real_net : std_logic_vector( 18-1 downto 0 );
  signal addsub_s_net : std_logic_vector( 18-1 downto 0 );
  signal clk_net : std_logic;
  signal mux_y_net_x0 : std_logic_vector( 18-1 downto 0 );
  signal cordic_pipe_balance2_q_net : std_logic_vector( 18-1 downto 0 );
  signal delay3_q_net : std_logic_vector( 18-1 downto 0 );
  signal phase_detect_m_axis_dout_tdata_imag_net : std_logic_vector( 18-1 downto 0 );
  signal cordic_pipe_balance1_q_net : std_logic_vector( 1-1 downto 0 );
  signal ce_net : std_logic;
begin
  x_x0 <= cordic_pipe_balance2_q_net;
  z <= mux_y_net_x0;
  phase_detect_m_axis_dout_tdata_real_net <= x;
  phase_detect_m_axis_dout_tdata_imag_net <= y;
  clk_net <= clk_1;
  ce_net <= ce_1;
  cordic_fine_angle_pe : entity work.complexphasedetectorswap_cordic_fine_angle_pe_x1 
  port map (
    x_x0 => mux_y_net,
    y => delay3_q_net,
    z => constant_op_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    x => addsub_s_net,
    z_x0 => addsub2_s_net
  );
  quadrant_correct_x0 : entity work.complexphasedetectorswap_quadrant_correct_x0 
  port map (
    z_in => addsub2_s_net,
    pi_addsub => cordic_pipe_balance_q_net,
    z_mux_sel => cordic_pipe_balance1_q_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    z => mux_y_net_x0
  );
  quadrant_map : entity work.complexphasedetectorswap_quadrant_map_x1 
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
  cordic_pipe_balance : entity work.complexphasedetectorswap_xldelay 
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
  cordic_pipe_balance1 : entity work.complexphasedetectorswap_xldelay 
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
  cordic_pipe_balance2 : entity work.complexphasedetectorswap_xldelay 
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
  constant_x0 : entity work.sysgen_constant_edb671a297 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
end structural;
-- Generated from Simulink block Cordic ATan
library IEEE;
use IEEE.std_logic_1164.all;
library work;
use work.conv_pkg.all;
entity complexphasedetectorswap_cordic_atan is
  port (
    imag : in std_logic_vector( 18-1 downto 0 );
    real : in std_logic_vector( 18-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    phase : out std_logic_vector( 18-1 downto 0 )
  );
end complexphasedetectorswap_cordic_atan;
architecture structural of complexphasedetectorswap_cordic_atan is 
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal phase_detect_m_axis_dout_tdata_real_net : std_logic_vector( 18-1 downto 0 );
  signal phase_detect_m_axis_dout_tdata_imag_net : std_logic_vector( 18-1 downto 0 );
  signal constant_op_net : std_logic_vector( 18-1 downto 0 );
  signal mux_y_net : std_logic_vector( 18-1 downto 0 );
  signal mux_y_net_x0 : std_logic_vector( 18-1 downto 0 );
  signal cordic_pipe_balance2_q_net : std_logic_vector( 18-1 downto 0 );
  signal relational1_op_net : std_logic_vector( 1-1 downto 0 );
begin
  phase <= mux_y_net;
  phase_detect_m_axis_dout_tdata_imag_net <= imag;
  phase_detect_m_axis_dout_tdata_real_net <= real;
  clk_net <= clk_1;
  ce_net <= ce_1;
  cordic_atan : entity work.complexphasedetectorswap_cordic_atan_x0 
  port map (
    x => phase_detect_m_axis_dout_tdata_real_net,
    y => phase_detect_m_axis_dout_tdata_imag_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    x_x0 => cordic_pipe_balance2_q_net,
    z => mux_y_net_x0
  );
  constant_x0 : entity work.sysgen_constant_edb671a297 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  mux : entity work.sysgen_mux_2443262130 
  port map (
    clr => '0',
    sel => relational1_op_net,
    d0 => constant_op_net,
    d1 => mux_y_net_x0,
    clk => clk_net,
    ce => ce_net,
    y => mux_y_net
  );
  relational1 : entity work.sysgen_relational_26d5e655e7 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    a => cordic_pipe_balance2_q_net,
    b => constant_op_net,
    op => relational1_op_net
  );
end structural;
-- Generated from Simulink block LimitedAccum
library IEEE;
use IEEE.std_logic_1164.all;
library work;
use work.conv_pkg.all;
entity complexphasedetectorswap_limitedaccum is
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
end complexphasedetectorswap_limitedaccum;
architecture structural of complexphasedetectorswap_limitedaccum is 
  signal sweeplmt_net : std_logic_vector( 15-1 downto 0 );
  signal swprate_net : std_logic_vector( 18-1 downto 0 );
  signal lag_coef_net : std_logic_vector( 18-1 downto 0 );
  signal addsub2_s_net : std_logic_vector( 32-1 downto 0 );
  signal mux11_y_net : std_logic_vector( 18-1 downto 0 );
  signal reset_net : std_logic_vector( 1-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal logical2_y_net_x0 : std_logic_vector( 1-1 downto 0 );
  signal relational1_op_net : std_logic_vector( 1-1 downto 0 );
  signal constant_op_net : std_logic_vector( 8-1 downto 0 );
  signal inverter_op_net : std_logic_vector( 1-1 downto 0 );
  signal logical1_y_net : std_logic_vector( 1-1 downto 0 );
  signal logical2_y_net : std_logic_vector( 1-1 downto 0 );
  signal mux1_y_net : std_logic_vector( 33-1 downto 0 );
  signal mult3_p_net : std_logic_vector( 22-1 downto 0 );
  signal delay_q_net : std_logic_vector( 1-1 downto 0 );
  signal mux3_y_net : std_logic_vector( 19-1 downto 0 );
  signal constant1_op_net : std_logic_vector( 14-1 downto 0 );
  signal assert_dout_net : std_logic_vector( 1-1 downto 0 );
  signal logical_y_net : std_logic;
  signal addsub_s_net : std_logic_vector( 26-1 downto 0 );
  signal negate1_op_net : std_logic_vector( 19-1 downto 0 );
  signal relational_op_net : std_logic_vector( 1-1 downto 0 );
  signal mux_y_net : std_logic_vector( 33-1 downto 0 );
  signal mux6_y_net : std_logic_vector( 15-1 downto 0 );
  signal mux2_y_net : std_logic_vector( 18-1 downto 0 );
  signal negate_op_net : std_logic_vector( 16-1 downto 0 );
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
  addsub : entity work.complexphasedetectorswap_xladdsub 
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
    core_name0 => "complexphasedetectorswap_c_addsub_v12_0_i5",
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
  addsub2 : entity work.complexphasedetectorswap_xladdsub 
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
    core_name0 => "complexphasedetectorswap_c_addsub_v12_0_i6",
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
  constant_x0 : entity work.sysgen_constant_6095c4fae2 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  constant1 : entity work.sysgen_constant_19553934b7 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant1_op_net
  );
  delay : entity work.complexphasedetectorswap_xldelay 
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
  inverter : entity work.sysgen_inverter_962a38e1c8 
  port map (
    clr => '0',
    ip => assert_dout_net,
    clk => clk_net,
    ce => ce_net,
    op => inverter_op_net
  );
  logical : entity work.sysgen_logical_3ecd2b5ea1 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    d0 => logical1_y_net,
    d1 => logical2_y_net,
    y(0) => logical_y_net
  );
  logical1 : entity work.sysgen_logical_d414a0f2aa 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    d0 => inverter_op_net,
    d1 => relational1_op_net,
    y => logical1_y_net
  );
  logical2 : entity work.sysgen_logical_d414a0f2aa 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    d0 => relational_op_net,
    d1 => assert_dout_net,
    y => logical2_y_net
  );
  mult3 : entity work.complexphasedetectorswap_xlmult 
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
    core_name0 => "complexphasedetectorswap_mult_gen_v12_0_i5",
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
  mux : entity work.sysgen_mux_8ff2cd3e38 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    sel => relational_op_net,
    d0 => addsub2_s_net,
    d1 => negate_op_net,
    y => mux_y_net
  );
  mux1 : entity work.sysgen_mux_a36f8de39c 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    sel => relational1_op_net,
    d0 => mux_y_net,
    d1 => mux6_y_net,
    y => mux1_y_net
  );
  mux2 : entity work.sysgen_mux_65c99741ed 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    sel => logical2_y_net_x0,
    d0 => swprate_net,
    d1 => constant_op_net,
    y => mux2_y_net
  );
  mux3 : entity work.sysgen_mux_538691ca36 
  port map (
    clr => '0',
    sel => assert_dout_net,
    d0 => mux2_y_net,
    d1 => negate1_op_net,
    clk => clk_net,
    ce => ce_net,
    y => mux3_y_net
  );
  mux6 : entity work.sysgen_mux_be8a7b11ca 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    sel => reset_net,
    d0 => sweeplmt_net,
    d1 => constant1_op_net,
    y => mux6_y_net
  );
  negate : entity work.sysgen_negate_930f1381af 
  port map (
    clr => '0',
    ip => mux6_y_net,
    clk => clk_net,
    ce => ce_net,
    op => negate_op_net
  );
  negate1 : entity work.sysgen_negate_16ffcb114f 
  port map (
    clr => '0',
    ip => mux2_y_net,
    clk => clk_net,
    ce => ce_net,
    op => negate1_op_net
  );
  relational : entity work.sysgen_relational_cee47aa18a 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    a => addsub2_s_net,
    b => negate_op_net,
    op => relational_op_net
  );
  relational1 : entity work.sysgen_relational_4dbdc9e9d7 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    a => addsub2_s_net,
    b => mux6_y_net,
    op => relational1_op_net
  );
end structural;
-- Generated from Simulink block LockImag
library IEEE;
use IEEE.std_logic_1164.all;
library work;
use work.conv_pkg.all;
entity complexphasedetectorswap_lockimag is
  port (
    in_x0 : in std_logic_vector( 8-1 downto 0 );
    sub : in std_logic_vector( 1-1 downto 0 );
    rst_n : in std_logic_vector( 1-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    out_x0 : out std_logic_vector( 13-1 downto 0 )
  );
end complexphasedetectorswap_lockimag;
architecture structural of complexphasedetectorswap_lockimag is 
  signal mux7_y_net : std_logic_vector( 8-1 downto 0 );
  signal mux_y_net : std_logic_vector( 13-1 downto 0 );
  signal inverter1_op_net : std_logic_vector( 1-1 downto 0 );
  signal ce_net : std_logic;
  signal logical1_y_net : std_logic_vector( 1-1 downto 0 );
  signal clk_net : std_logic;
  signal lockreal_s_net : std_logic_vector( 13-1 downto 0 );
  signal constant_op_net : std_logic_vector( 13-1 downto 0 );
begin
  out_x0 <= lockreal_s_net;
  mux7_y_net <= in_x0;
  logical1_y_net <= sub;
  inverter1_op_net <= rst_n;
  clk_net <= clk_1;
  ce_net <= ce_1;
  constant_x0 : entity work.sysgen_constant_66478e1a27 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  lockreal : entity work.complexphasedetectorswap_xladdsubmode 
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
    core_name0 => "complexphasedetectorswap_c_addsub_v12_0_i7",
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
  mux : entity work.sysgen_mux_f3d63111ad 
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
-- Generated from Simulink block LockReal
library IEEE;
use IEEE.std_logic_1164.all;
library work;
use work.conv_pkg.all;
entity complexphasedetectorswap_lockreal is
  port (
    in_x0 : in std_logic_vector( 8-1 downto 0 );
    sub : in std_logic_vector( 1-1 downto 0 );
    rst_n : in std_logic_vector( 1-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    out_x0 : out std_logic_vector( 13-1 downto 0 )
  );
end complexphasedetectorswap_lockreal;
architecture structural of complexphasedetectorswap_lockreal is 
  signal lockreal_s_net : std_logic_vector( 13-1 downto 0 );
  signal mux8_y_net : std_logic_vector( 8-1 downto 0 );
  signal clk_net : std_logic;
  signal constant_op_net : std_logic_vector( 13-1 downto 0 );
  signal inverter1_op_net : std_logic_vector( 1-1 downto 0 );
  signal ce_net : std_logic;
  signal logical_y_net : std_logic_vector( 1-1 downto 0 );
  signal mux_y_net : std_logic_vector( 13-1 downto 0 );
begin
  out_x0 <= lockreal_s_net;
  mux8_y_net <= in_x0;
  logical_y_net <= sub;
  inverter1_op_net <= rst_n;
  clk_net <= clk_1;
  ce_net <= ce_1;
  constant_x0 : entity work.sysgen_constant_66478e1a27 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  lockreal : entity work.complexphasedetectorswap_xladdsubmode 
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
    core_name0 => "complexphasedetectorswap_c_addsub_v12_0_i7",
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
  mux : entity work.sysgen_mux_f3d63111ad 
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
-- Generated from Simulink block Negater2
library IEEE;
use IEEE.std_logic_1164.all;
library work;
use work.conv_pkg.all;
entity complexphasedetectorswap_negater2 is
  port (
    neg : in std_logic_vector( 1-1 downto 0 );
    in_x0 : in std_logic_vector( 18-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    out_x0 : out std_logic_vector( 18-1 downto 0 )
  );
end complexphasedetectorswap_negater2;
architecture structural of complexphasedetectorswap_negater2 is 
  signal negate1_op_net : std_logic_vector( 18-1 downto 0 );
  signal mux_y_net : std_logic_vector( 18-1 downto 0 );
  signal ce_net : std_logic;
  signal mux11_y_net : std_logic_vector( 18-1 downto 0 );
  signal clk_net : std_logic;
  signal delay12_q_net : std_logic_vector( 1-1 downto 0 );
begin
  out_x0 <= mux11_y_net;
  delay12_q_net <= neg;
  mux_y_net <= in_x0;
  clk_net <= clk_1;
  ce_net <= ce_1;
  mux11 : entity work.sysgen_mux_2443262130 
  port map (
    clr => '0',
    sel => delay12_q_net,
    d0 => mux_y_net,
    d1 => negate1_op_net,
    clk => clk_net,
    ce => ce_net,
    y => mux11_y_net
  );
  negate1 : entity work.sysgen_negate_75ae4895e9 
  port map (
    clr => '0',
    ip => mux_y_net,
    clk => clk_net,
    ce => ce_net,
    op => negate1_op_net
  );
end structural;
-- Generated from Simulink block CORDIC PE1
library IEEE;
use IEEE.std_logic_1164.all;
library work;
use work.conv_pkg.all;
entity complexphasedetectorswap_cordic_pe1 is
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
end complexphasedetectorswap_cordic_pe1;
architecture structural of complexphasedetectorswap_cordic_pe1 is 
  signal inverter_op_net : std_logic_vector( 1-1 downto 0 );
  signal shift_op_net : std_logic_vector( 21-1 downto 0 );
  signal clk_net : std_logic;
  signal shift1_op_net : std_logic_vector( 21-1 downto 0 );
  signal slice_y_net : std_logic_vector( 1-1 downto 0 );
  signal ce_net : std_logic;
  signal constant_op_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal addsub_s_net : std_logic_vector( 21-1 downto 0 );
  signal addsub1_s_net : std_logic_vector( 21-1 downto 0 );
  signal addsub2_s_net : std_logic_vector( 21-1 downto 0 );
  signal constant_op_net : std_logic_vector( 21-1 downto 0 );
  signal constant1_op_net : std_logic_vector( 21-1 downto 0 );
  signal mux_y_net : std_logic_vector( 21-1 downto 0 );
begin
  x_x0 <= addsub_s_net;
  y_x0 <= addsub1_s_net;
  z_x0 <= addsub2_s_net;
  constant_op_net <= x;
  constant1_op_net <= y;
  mux_y_net <= z;
  clk_net <= clk_1;
  ce_net <= ce_1;
  addsub : entity work.sysgen_addsub_f5a65f010a 
  port map (
    clr => '0',
    a => constant_op_net,
    b => shift1_op_net,
    mode => inverter_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub_s_net
  );
  addsub1 : entity work.sysgen_addsub_f5a65f010a 
  port map (
    clr => '0',
    a => constant1_op_net,
    b => shift_op_net,
    mode => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub1_s_net
  );
  addsub2 : entity work.sysgen_addsub_f5a65f010a 
  port map (
    clr => '0',
    a => mux_y_net,
    b => constant_op_net_x0,
    mode => inverter_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub2_s_net
  );
  constant_x0 : entity work.sysgen_constant_95d05a214e 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net_x0
  );
  inverter : entity work.sysgen_inverter_962a38e1c8 
  port map (
    clr => '0',
    ip => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    op => inverter_op_net
  );
  shift : entity work.sysgen_shift_52faab0184 
  port map (
    clk => '1',
    ce => '1',
    clr => '0',
    ip => constant_op_net,
    op => shift_op_net
  );
  shift1 : entity work.sysgen_shift_52faab0184 
  port map (
    clk => '1',
    ce => '1',
    clr => '0',
    ip => constant1_op_net,
    op => shift1_op_net
  );
  slice : entity work.complexphasedetectorswap_xlslice 
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
-- Generated from Simulink block CORDIC PE10
library IEEE;
use IEEE.std_logic_1164.all;
library work;
use work.conv_pkg.all;
entity complexphasedetectorswap_cordic_pe10_x1 is
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
end complexphasedetectorswap_cordic_pe10_x1;
architecture structural of complexphasedetectorswap_cordic_pe10_x1 is 
  signal clk_net : std_logic;
  signal shift_op_net : std_logic_vector( 21-1 downto 0 );
  signal constant_op_net : std_logic_vector( 21-1 downto 0 );
  signal inverter_op_net : std_logic_vector( 1-1 downto 0 );
  signal slice_y_net : std_logic_vector( 1-1 downto 0 );
  signal ce_net : std_logic;
  signal shift1_op_net : std_logic_vector( 21-1 downto 0 );
  signal addsub_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal addsub1_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal addsub2_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal addsub_s_net : std_logic_vector( 21-1 downto 0 );
  signal addsub1_s_net : std_logic_vector( 21-1 downto 0 );
  signal addsub2_s_net : std_logic_vector( 21-1 downto 0 );
begin
  x_x0 <= addsub_s_net_x0;
  y_x0 <= addsub1_s_net_x0;
  z_x0 <= addsub2_s_net_x0;
  addsub_s_net <= x;
  addsub1_s_net <= y;
  addsub2_s_net <= z;
  clk_net <= clk_1;
  ce_net <= ce_1;
  addsub : entity work.sysgen_addsub_f5a65f010a 
  port map (
    clr => '0',
    a => addsub_s_net,
    b => shift1_op_net,
    mode => inverter_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub_s_net_x0
  );
  addsub1 : entity work.sysgen_addsub_f5a65f010a 
  port map (
    clr => '0',
    a => addsub1_s_net,
    b => shift_op_net,
    mode => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub1_s_net_x0
  );
  addsub2 : entity work.sysgen_addsub_f5a65f010a 
  port map (
    clr => '0',
    a => addsub2_s_net,
    b => constant_op_net,
    mode => inverter_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub2_s_net_x0
  );
  constant_x0 : entity work.sysgen_constant_c2c702ee2d 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  inverter : entity work.sysgen_inverter_962a38e1c8 
  port map (
    clr => '0',
    ip => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    op => inverter_op_net
  );
  shift : entity work.sysgen_shift_d3d79dc856 
  port map (
    clr => '0',
    ip => addsub_s_net,
    clk => clk_net,
    ce => ce_net,
    op => shift_op_net
  );
  shift1 : entity work.sysgen_shift_d3d79dc856 
  port map (
    clr => '0',
    ip => addsub1_s_net,
    clk => clk_net,
    ce => ce_net,
    op => shift1_op_net
  );
  slice : entity work.complexphasedetectorswap_xlslice 
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
-- Generated from Simulink block CORDIC PE11
library IEEE;
use IEEE.std_logic_1164.all;
library work;
use work.conv_pkg.all;
entity complexphasedetectorswap_cordic_pe11_x0 is
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
end complexphasedetectorswap_cordic_pe11_x0;
architecture structural of complexphasedetectorswap_cordic_pe11_x0 is 
  signal addsub_s_net : std_logic_vector( 21-1 downto 0 );
  signal addsub2_s_net : std_logic_vector( 21-1 downto 0 );
  signal addsub_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal addsub1_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal addsub1_s_net : std_logic_vector( 21-1 downto 0 );
  signal addsub2_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal shift1_op_net : std_logic_vector( 21-1 downto 0 );
  signal clk_net : std_logic;
  signal inverter_op_net : std_logic_vector( 1-1 downto 0 );
  signal shift_op_net : std_logic_vector( 21-1 downto 0 );
  signal constant_op_net : std_logic_vector( 21-1 downto 0 );
  signal slice_y_net : std_logic_vector( 1-1 downto 0 );
  signal ce_net : std_logic;
begin
  x_x0 <= addsub_s_net;
  y_x0 <= addsub1_s_net;
  z_x0 <= addsub2_s_net;
  addsub_s_net_x0 <= x;
  addsub1_s_net_x0 <= y;
  addsub2_s_net_x0 <= z;
  clk_net <= clk_1;
  ce_net <= ce_1;
  addsub : entity work.sysgen_addsub_f5a65f010a 
  port map (
    clr => '0',
    a => addsub_s_net_x0,
    b => shift1_op_net,
    mode => inverter_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub_s_net
  );
  addsub1 : entity work.sysgen_addsub_f5a65f010a 
  port map (
    clr => '0',
    a => addsub1_s_net_x0,
    b => shift_op_net,
    mode => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub1_s_net
  );
  addsub2 : entity work.sysgen_addsub_f5a65f010a 
  port map (
    clr => '0',
    a => addsub2_s_net_x0,
    b => constant_op_net,
    mode => inverter_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub2_s_net
  );
  constant_x0 : entity work.sysgen_constant_3c854d5995 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  inverter : entity work.sysgen_inverter_962a38e1c8 
  port map (
    clr => '0',
    ip => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    op => inverter_op_net
  );
  shift : entity work.sysgen_shift_e72705e197 
  port map (
    clr => '0',
    ip => addsub_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift_op_net
  );
  shift1 : entity work.sysgen_shift_e72705e197 
  port map (
    clr => '0',
    ip => addsub1_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift1_op_net
  );
  slice : entity work.complexphasedetectorswap_xlslice 
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
-- Generated from Simulink block CORDIC PE12
library IEEE;
use IEEE.std_logic_1164.all;
library work;
use work.conv_pkg.all;
entity complexphasedetectorswap_cordic_pe12_x0 is
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
end complexphasedetectorswap_cordic_pe12_x0;
architecture structural of complexphasedetectorswap_cordic_pe12_x0 is 
  signal addsub_s_net : std_logic_vector( 21-1 downto 0 );
  signal addsub1_s_net : std_logic_vector( 21-1 downto 0 );
  signal addsub2_s_net : std_logic_vector( 21-1 downto 0 );
  signal addsub1_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal addsub2_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal addsub_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal constant_op_net : std_logic_vector( 21-1 downto 0 );
  signal ce_net : std_logic;
  signal shift1_op_net : std_logic_vector( 21-1 downto 0 );
  signal shift_op_net : std_logic_vector( 21-1 downto 0 );
  signal inverter_op_net : std_logic_vector( 1-1 downto 0 );
  signal clk_net : std_logic;
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
  addsub : entity work.sysgen_addsub_f5a65f010a 
  port map (
    clr => '0',
    a => addsub_s_net_x0,
    b => shift1_op_net,
    mode => inverter_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub_s_net
  );
  addsub1 : entity work.sysgen_addsub_f5a65f010a 
  port map (
    clr => '0',
    a => addsub1_s_net_x0,
    b => shift_op_net,
    mode => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub1_s_net
  );
  addsub2 : entity work.sysgen_addsub_f5a65f010a 
  port map (
    clr => '0',
    a => addsub2_s_net_x0,
    b => constant_op_net,
    mode => inverter_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub2_s_net
  );
  constant_x0 : entity work.sysgen_constant_b3a23cd7f8 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  inverter : entity work.sysgen_inverter_962a38e1c8 
  port map (
    clr => '0',
    ip => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    op => inverter_op_net
  );
  shift : entity work.sysgen_shift_f6320478c4 
  port map (
    clr => '0',
    ip => addsub_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift_op_net
  );
  shift1 : entity work.sysgen_shift_f6320478c4 
  port map (
    clr => '0',
    ip => addsub1_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift1_op_net
  );
  slice : entity work.complexphasedetectorswap_xlslice 
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
-- Generated from Simulink block CORDIC PE13
library IEEE;
use IEEE.std_logic_1164.all;
library work;
use work.conv_pkg.all;
entity complexphasedetectorswap_cordic_pe13_x0 is
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
end complexphasedetectorswap_cordic_pe13_x0;
architecture structural of complexphasedetectorswap_cordic_pe13_x0 is 
  signal addsub1_s_net : std_logic_vector( 21-1 downto 0 );
  signal addsub2_s_net : std_logic_vector( 21-1 downto 0 );
  signal addsub_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal addsub_s_net : std_logic_vector( 21-1 downto 0 );
  signal addsub1_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal addsub2_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal clk_net : std_logic;
  signal shift_op_net : std_logic_vector( 21-1 downto 0 );
  signal ce_net : std_logic;
  signal slice_y_net : std_logic_vector( 1-1 downto 0 );
  signal constant_op_net : std_logic_vector( 21-1 downto 0 );
  signal shift1_op_net : std_logic_vector( 21-1 downto 0 );
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
  addsub : entity work.sysgen_addsub_f5a65f010a 
  port map (
    clr => '0',
    a => addsub_s_net_x0,
    b => shift1_op_net,
    mode => inverter_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub_s_net
  );
  addsub1 : entity work.sysgen_addsub_f5a65f010a 
  port map (
    clr => '0',
    a => addsub1_s_net_x0,
    b => shift_op_net,
    mode => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub1_s_net
  );
  addsub2 : entity work.sysgen_addsub_f5a65f010a 
  port map (
    clr => '0',
    a => addsub2_s_net_x0,
    b => constant_op_net,
    mode => inverter_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub2_s_net
  );
  constant_x0 : entity work.sysgen_constant_f7a04a812a 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  inverter : entity work.sysgen_inverter_962a38e1c8 
  port map (
    clr => '0',
    ip => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    op => inverter_op_net
  );
  shift : entity work.sysgen_shift_d530c922d4 
  port map (
    clr => '0',
    ip => addsub_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift_op_net
  );
  shift1 : entity work.sysgen_shift_d530c922d4 
  port map (
    clr => '0',
    ip => addsub1_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift1_op_net
  );
  slice : entity work.complexphasedetectorswap_xlslice 
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
-- Generated from Simulink block CORDIC PE14
library IEEE;
use IEEE.std_logic_1164.all;
library work;
use work.conv_pkg.all;
entity complexphasedetectorswap_cordic_pe14_x0 is
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
end complexphasedetectorswap_cordic_pe14_x0;
architecture structural of complexphasedetectorswap_cordic_pe14_x0 is 
  signal addsub1_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal addsub2_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal addsub1_s_net : std_logic_vector( 21-1 downto 0 );
  signal addsub_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal addsub_s_net : std_logic_vector( 21-1 downto 0 );
  signal addsub2_s_net : std_logic_vector( 21-1 downto 0 );
  signal shift1_op_net : std_logic_vector( 21-1 downto 0 );
  signal shift_op_net : std_logic_vector( 21-1 downto 0 );
  signal constant_op_net : std_logic_vector( 21-1 downto 0 );
  signal inverter_op_net : std_logic_vector( 1-1 downto 0 );
  signal slice_y_net : std_logic_vector( 1-1 downto 0 );
  signal ce_net : std_logic;
  signal clk_net : std_logic;
begin
  x_x0 <= addsub_s_net;
  y_x0 <= addsub1_s_net;
  z_x0 <= addsub2_s_net;
  addsub_s_net_x0 <= x;
  addsub1_s_net_x0 <= y;
  addsub2_s_net_x0 <= z;
  clk_net <= clk_1;
  ce_net <= ce_1;
  addsub : entity work.sysgen_addsub_f5a65f010a 
  port map (
    clr => '0',
    a => addsub_s_net_x0,
    b => shift1_op_net,
    mode => inverter_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub_s_net
  );
  addsub1 : entity work.sysgen_addsub_f5a65f010a 
  port map (
    clr => '0',
    a => addsub1_s_net_x0,
    b => shift_op_net,
    mode => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub1_s_net
  );
  addsub2 : entity work.sysgen_addsub_f5a65f010a 
  port map (
    clr => '0',
    a => addsub2_s_net_x0,
    b => constant_op_net,
    mode => inverter_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub2_s_net
  );
  constant_x0 : entity work.sysgen_constant_91f2f3a7f5 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  inverter : entity work.sysgen_inverter_962a38e1c8 
  port map (
    clr => '0',
    ip => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    op => inverter_op_net
  );
  shift : entity work.sysgen_shift_294e1fd787 
  port map (
    clr => '0',
    ip => addsub_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift_op_net
  );
  shift1 : entity work.sysgen_shift_294e1fd787 
  port map (
    clr => '0',
    ip => addsub1_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift1_op_net
  );
  slice : entity work.complexphasedetectorswap_xlslice 
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
-- Generated from Simulink block CORDIC PE15
library IEEE;
use IEEE.std_logic_1164.all;
library work;
use work.conv_pkg.all;
entity complexphasedetectorswap_cordic_pe15_x0 is
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
end complexphasedetectorswap_cordic_pe15_x0;
architecture structural of complexphasedetectorswap_cordic_pe15_x0 is 
  signal addsub1_s_net : std_logic_vector( 21-1 downto 0 );
  signal addsub1_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal addsub2_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal addsub_s_net : std_logic_vector( 21-1 downto 0 );
  signal addsub2_s_net : std_logic_vector( 21-1 downto 0 );
  signal addsub_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal inverter_op_net : std_logic_vector( 1-1 downto 0 );
  signal slice_y_net : std_logic_vector( 1-1 downto 0 );
  signal constant_op_net : std_logic_vector( 21-1 downto 0 );
  signal ce_net : std_logic;
  signal shift1_op_net : std_logic_vector( 21-1 downto 0 );
  signal clk_net : std_logic;
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
  addsub : entity work.sysgen_addsub_f5a65f010a 
  port map (
    clr => '0',
    a => addsub_s_net_x0,
    b => shift1_op_net,
    mode => inverter_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub_s_net
  );
  addsub1 : entity work.sysgen_addsub_f5a65f010a 
  port map (
    clr => '0',
    a => addsub1_s_net_x0,
    b => shift_op_net,
    mode => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub1_s_net
  );
  addsub2 : entity work.sysgen_addsub_f5a65f010a 
  port map (
    clr => '0',
    a => addsub2_s_net_x0,
    b => constant_op_net,
    mode => inverter_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub2_s_net
  );
  constant_x0 : entity work.sysgen_constant_90c8681005 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  inverter : entity work.sysgen_inverter_962a38e1c8 
  port map (
    clr => '0',
    ip => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    op => inverter_op_net
  );
  shift : entity work.sysgen_shift_2576158b81 
  port map (
    clr => '0',
    ip => addsub_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift_op_net
  );
  shift1 : entity work.sysgen_shift_2576158b81 
  port map (
    clr => '0',
    ip => addsub1_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift1_op_net
  );
  slice : entity work.complexphasedetectorswap_xlslice 
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
-- Generated from Simulink block CORDIC PE16
library IEEE;
use IEEE.std_logic_1164.all;
library work;
use work.conv_pkg.all;
entity complexphasedetectorswap_cordic_pe16_x0 is
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
end complexphasedetectorswap_cordic_pe16_x0;
architecture structural of complexphasedetectorswap_cordic_pe16_x0 is 
  signal addsub_s_net : std_logic_vector( 21-1 downto 0 );
  signal addsub2_s_net : std_logic_vector( 21-1 downto 0 );
  signal addsub_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal addsub1_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal addsub2_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal addsub1_s_net : std_logic_vector( 21-1 downto 0 );
  signal ce_net : std_logic;
  signal shift_op_net : std_logic_vector( 21-1 downto 0 );
  signal inverter_op_net : std_logic_vector( 1-1 downto 0 );
  signal clk_net : std_logic;
  signal shift1_op_net : std_logic_vector( 21-1 downto 0 );
  signal slice_y_net : std_logic_vector( 1-1 downto 0 );
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
  addsub : entity work.sysgen_addsub_f5a65f010a 
  port map (
    clr => '0',
    a => addsub_s_net_x0,
    b => shift1_op_net,
    mode => inverter_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub_s_net
  );
  addsub1 : entity work.sysgen_addsub_f5a65f010a 
  port map (
    clr => '0',
    a => addsub1_s_net_x0,
    b => shift_op_net,
    mode => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub1_s_net
  );
  addsub2 : entity work.sysgen_addsub_f5a65f010a 
  port map (
    clr => '0',
    a => addsub2_s_net_x0,
    b => constant_op_net,
    mode => inverter_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub2_s_net
  );
  constant_x0 : entity work.sysgen_constant_0bc3b7abba 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  inverter : entity work.sysgen_inverter_962a38e1c8 
  port map (
    clr => '0',
    ip => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    op => inverter_op_net
  );
  shift : entity work.sysgen_shift_d8b2048fe7 
  port map (
    clr => '0',
    ip => addsub_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift_op_net
  );
  shift1 : entity work.sysgen_shift_d8b2048fe7 
  port map (
    clr => '0',
    ip => addsub1_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift1_op_net
  );
  slice : entity work.complexphasedetectorswap_xlslice 
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
-- Generated from Simulink block CORDIC PE17
library IEEE;
use IEEE.std_logic_1164.all;
library work;
use work.conv_pkg.all;
entity complexphasedetectorswap_cordic_pe17_x0 is
  port (
    x : in std_logic_vector( 21-1 downto 0 );
    y : in std_logic_vector( 21-1 downto 0 );
    z : in std_logic_vector( 21-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    x_x0 : out std_logic_vector( 21-1 downto 0 );
    y_x0 : out std_logic_vector( 21-1 downto 0 )
  );
end complexphasedetectorswap_cordic_pe17_x0;
architecture structural of complexphasedetectorswap_cordic_pe17_x0 is 
  signal addsub2_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal clk_net : std_logic;
  signal addsub1_s_net : std_logic_vector( 21-1 downto 0 );
  signal addsub_s_net : std_logic_vector( 21-1 downto 0 );
  signal addsub_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal addsub1_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal slice_y_net : std_logic_vector( 1-1 downto 0 );
  signal shift_op_net : std_logic_vector( 21-1 downto 0 );
  signal ce_net : std_logic;
  signal inverter_op_net : std_logic_vector( 1-1 downto 0 );
  signal shift1_op_net : std_logic_vector( 21-1 downto 0 );
begin
  x_x0 <= addsub_s_net;
  y_x0 <= addsub1_s_net;
  addsub_s_net_x0 <= x;
  addsub1_s_net_x0 <= y;
  addsub2_s_net_x0 <= z;
  clk_net <= clk_1;
  ce_net <= ce_1;
  addsub : entity work.sysgen_addsub_f5a65f010a 
  port map (
    clr => '0',
    a => addsub_s_net_x0,
    b => shift1_op_net,
    mode => inverter_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub_s_net
  );
  addsub1 : entity work.sysgen_addsub_f5a65f010a 
  port map (
    clr => '0',
    a => addsub1_s_net_x0,
    b => shift_op_net,
    mode => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub1_s_net
  );
  inverter : entity work.sysgen_inverter_962a38e1c8 
  port map (
    clr => '0',
    ip => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    op => inverter_op_net
  );
  shift : entity work.sysgen_shift_66e2ae0031 
  port map (
    clr => '0',
    ip => addsub_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift_op_net
  );
  shift1 : entity work.sysgen_shift_66e2ae0031 
  port map (
    clr => '0',
    ip => addsub1_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift1_op_net
  );
  slice : entity work.complexphasedetectorswap_xlslice 
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
-- Generated from Simulink block CORDIC PE2
library IEEE;
use IEEE.std_logic_1164.all;
library work;
use work.conv_pkg.all;
entity complexphasedetectorswap_cordic_pe2_x2 is
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
end complexphasedetectorswap_cordic_pe2_x2;
architecture structural of complexphasedetectorswap_cordic_pe2_x2 is 
  signal addsub_s_net : std_logic_vector( 21-1 downto 0 );
  signal addsub1_s_net : std_logic_vector( 21-1 downto 0 );
  signal addsub1_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal addsub2_s_net : std_logic_vector( 21-1 downto 0 );
  signal clk_net : std_logic;
  signal addsub_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal shift1_op_net : std_logic_vector( 21-1 downto 0 );
  signal inverter_op_net : std_logic_vector( 1-1 downto 0 );
  signal addsub2_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal ce_net : std_logic;
  signal shift_op_net : std_logic_vector( 21-1 downto 0 );
  signal slice_y_net : std_logic_vector( 1-1 downto 0 );
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
  addsub : entity work.sysgen_addsub_f5a65f010a 
  port map (
    clr => '0',
    a => addsub_s_net_x0,
    b => shift1_op_net,
    mode => inverter_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub_s_net
  );
  addsub1 : entity work.sysgen_addsub_f5a65f010a 
  port map (
    clr => '0',
    a => addsub1_s_net_x0,
    b => shift_op_net,
    mode => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub1_s_net
  );
  addsub2 : entity work.sysgen_addsub_f5a65f010a 
  port map (
    clr => '0',
    a => addsub2_s_net_x0,
    b => constant_op_net,
    mode => inverter_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub2_s_net
  );
  constant_x0 : entity work.sysgen_constant_dd916d685b 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  inverter : entity work.sysgen_inverter_962a38e1c8 
  port map (
    clr => '0',
    ip => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    op => inverter_op_net
  );
  shift : entity work.sysgen_shift_74cef34337 
  port map (
    clr => '0',
    ip => addsub_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift_op_net
  );
  shift1 : entity work.sysgen_shift_74cef34337 
  port map (
    clr => '0',
    ip => addsub1_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift1_op_net
  );
  slice : entity work.complexphasedetectorswap_xlslice 
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
-- Generated from Simulink block CORDIC PE3
library IEEE;
use IEEE.std_logic_1164.all;
library work;
use work.conv_pkg.all;
entity complexphasedetectorswap_cordic_pe3_x2 is
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
end complexphasedetectorswap_cordic_pe3_x2;
architecture structural of complexphasedetectorswap_cordic_pe3_x2 is 
  signal addsub_s_net : std_logic_vector( 21-1 downto 0 );
  signal addsub1_s_net : std_logic_vector( 21-1 downto 0 );
  signal addsub2_s_net : std_logic_vector( 21-1 downto 0 );
  signal addsub_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal shift1_op_net : std_logic_vector( 21-1 downto 0 );
  signal inverter_op_net : std_logic_vector( 1-1 downto 0 );
  signal addsub1_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal addsub2_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal slice_y_net : std_logic_vector( 1-1 downto 0 );
  signal constant_op_net : std_logic_vector( 21-1 downto 0 );
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
  addsub : entity work.sysgen_addsub_f5a65f010a 
  port map (
    clr => '0',
    a => addsub_s_net_x0,
    b => shift1_op_net,
    mode => inverter_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub_s_net
  );
  addsub1 : entity work.sysgen_addsub_f5a65f010a 
  port map (
    clr => '0',
    a => addsub1_s_net_x0,
    b => shift_op_net,
    mode => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub1_s_net
  );
  addsub2 : entity work.sysgen_addsub_f5a65f010a 
  port map (
    clr => '0',
    a => addsub2_s_net_x0,
    b => constant_op_net,
    mode => inverter_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub2_s_net
  );
  constant_x0 : entity work.sysgen_constant_01578f1ab8 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  inverter : entity work.sysgen_inverter_962a38e1c8 
  port map (
    clr => '0',
    ip => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    op => inverter_op_net
  );
  shift : entity work.sysgen_shift_19e82f2d27 
  port map (
    clr => '0',
    ip => addsub_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift_op_net
  );
  shift1 : entity work.sysgen_shift_19e82f2d27 
  port map (
    clr => '0',
    ip => addsub1_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift1_op_net
  );
  slice : entity work.complexphasedetectorswap_xlslice 
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
-- Generated from Simulink block CORDIC PE4
library IEEE;
use IEEE.std_logic_1164.all;
library work;
use work.conv_pkg.all;
entity complexphasedetectorswap_cordic_pe4_x2 is
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
end complexphasedetectorswap_cordic_pe4_x2;
architecture structural of complexphasedetectorswap_cordic_pe4_x2 is 
  signal addsub_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal ce_net : std_logic;
  signal addsub2_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal addsub_s_net : std_logic_vector( 21-1 downto 0 );
  signal shift1_op_net : std_logic_vector( 21-1 downto 0 );
  signal addsub1_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal inverter_op_net : std_logic_vector( 1-1 downto 0 );
  signal addsub1_s_net : std_logic_vector( 21-1 downto 0 );
  signal addsub2_s_net : std_logic_vector( 21-1 downto 0 );
  signal clk_net : std_logic;
  signal shift_op_net : std_logic_vector( 21-1 downto 0 );
  signal slice_y_net : std_logic_vector( 1-1 downto 0 );
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
  addsub : entity work.sysgen_addsub_f5a65f010a 
  port map (
    clr => '0',
    a => addsub_s_net_x0,
    b => shift1_op_net,
    mode => inverter_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub_s_net
  );
  addsub1 : entity work.sysgen_addsub_f5a65f010a 
  port map (
    clr => '0',
    a => addsub1_s_net_x0,
    b => shift_op_net,
    mode => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub1_s_net
  );
  addsub2 : entity work.sysgen_addsub_f5a65f010a 
  port map (
    clr => '0',
    a => addsub2_s_net_x0,
    b => constant_op_net,
    mode => inverter_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub2_s_net
  );
  constant_x0 : entity work.sysgen_constant_dd9ca53c6d 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  inverter : entity work.sysgen_inverter_962a38e1c8 
  port map (
    clr => '0',
    ip => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    op => inverter_op_net
  );
  shift : entity work.sysgen_shift_4cc720ff32 
  port map (
    clr => '0',
    ip => addsub_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift_op_net
  );
  shift1 : entity work.sysgen_shift_4cc720ff32 
  port map (
    clr => '0',
    ip => addsub1_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift1_op_net
  );
  slice : entity work.complexphasedetectorswap_xlslice 
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
-- Generated from Simulink block CORDIC PE5
library IEEE;
use IEEE.std_logic_1164.all;
library work;
use work.conv_pkg.all;
entity complexphasedetectorswap_cordic_pe5_x2 is
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
end complexphasedetectorswap_cordic_pe5_x2;
architecture structural of complexphasedetectorswap_cordic_pe5_x2 is 
  signal addsub1_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal inverter_op_net : std_logic_vector( 1-1 downto 0 );
  signal addsub_s_net : std_logic_vector( 21-1 downto 0 );
  signal slice_y_net : std_logic_vector( 1-1 downto 0 );
  signal addsub_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal addsub2_s_net : std_logic_vector( 21-1 downto 0 );
  signal ce_net : std_logic;
  signal addsub1_s_net : std_logic_vector( 21-1 downto 0 );
  signal shift_op_net : std_logic_vector( 21-1 downto 0 );
  signal addsub2_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal clk_net : std_logic;
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
  addsub : entity work.sysgen_addsub_f5a65f010a 
  port map (
    clr => '0',
    a => addsub_s_net_x0,
    b => shift1_op_net,
    mode => inverter_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub_s_net
  );
  addsub1 : entity work.sysgen_addsub_f5a65f010a 
  port map (
    clr => '0',
    a => addsub1_s_net_x0,
    b => shift_op_net,
    mode => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub1_s_net
  );
  addsub2 : entity work.sysgen_addsub_f5a65f010a 
  port map (
    clr => '0',
    a => addsub2_s_net_x0,
    b => constant_op_net,
    mode => inverter_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub2_s_net
  );
  constant_x0 : entity work.sysgen_constant_d35c73d5e3 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  inverter : entity work.sysgen_inverter_962a38e1c8 
  port map (
    clr => '0',
    ip => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    op => inverter_op_net
  );
  shift : entity work.sysgen_shift_b17afba2f9 
  port map (
    clr => '0',
    ip => addsub_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift_op_net
  );
  shift1 : entity work.sysgen_shift_b17afba2f9 
  port map (
    clr => '0',
    ip => addsub1_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift1_op_net
  );
  slice : entity work.complexphasedetectorswap_xlslice 
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
-- Generated from Simulink block CORDIC PE6
library IEEE;
use IEEE.std_logic_1164.all;
library work;
use work.conv_pkg.all;
entity complexphasedetectorswap_cordic_pe6_x2 is
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
end complexphasedetectorswap_cordic_pe6_x2;
architecture structural of complexphasedetectorswap_cordic_pe6_x2 is 
  signal addsub1_s_net : std_logic_vector( 21-1 downto 0 );
  signal addsub1_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal clk_net : std_logic;
  signal shift1_op_net : std_logic_vector( 21-1 downto 0 );
  signal inverter_op_net : std_logic_vector( 1-1 downto 0 );
  signal shift_op_net : std_logic_vector( 21-1 downto 0 );
  signal addsub_s_net : std_logic_vector( 21-1 downto 0 );
  signal addsub2_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal addsub2_s_net : std_logic_vector( 21-1 downto 0 );
  signal slice_y_net : std_logic_vector( 1-1 downto 0 );
  signal addsub_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal ce_net : std_logic;
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
  addsub : entity work.sysgen_addsub_f5a65f010a 
  port map (
    clr => '0',
    a => addsub_s_net_x0,
    b => shift1_op_net,
    mode => inverter_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub_s_net
  );
  addsub1 : entity work.sysgen_addsub_f5a65f010a 
  port map (
    clr => '0',
    a => addsub1_s_net_x0,
    b => shift_op_net,
    mode => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub1_s_net
  );
  addsub2 : entity work.sysgen_addsub_f5a65f010a 
  port map (
    clr => '0',
    a => addsub2_s_net_x0,
    b => constant_op_net,
    mode => inverter_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub2_s_net
  );
  constant_x0 : entity work.sysgen_constant_8d75c3299d 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  inverter : entity work.sysgen_inverter_962a38e1c8 
  port map (
    clr => '0',
    ip => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    op => inverter_op_net
  );
  shift : entity work.sysgen_shift_59571b7f11 
  port map (
    clr => '0',
    ip => addsub_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift_op_net
  );
  shift1 : entity work.sysgen_shift_59571b7f11 
  port map (
    clr => '0',
    ip => addsub1_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift1_op_net
  );
  slice : entity work.complexphasedetectorswap_xlslice 
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
-- Generated from Simulink block CORDIC PE7
library IEEE;
use IEEE.std_logic_1164.all;
library work;
use work.conv_pkg.all;
entity complexphasedetectorswap_cordic_pe7_x2 is
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
end complexphasedetectorswap_cordic_pe7_x2;
architecture structural of complexphasedetectorswap_cordic_pe7_x2 is 
  signal addsub_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal slice_y_net : std_logic_vector( 1-1 downto 0 );
  signal addsub2_s_net : std_logic_vector( 21-1 downto 0 );
  signal shift_op_net : std_logic_vector( 21-1 downto 0 );
  signal addsub1_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal addsub1_s_net : std_logic_vector( 21-1 downto 0 );
  signal ce_net : std_logic;
  signal shift1_op_net : std_logic_vector( 21-1 downto 0 );
  signal addsub2_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal inverter_op_net : std_logic_vector( 1-1 downto 0 );
  signal addsub_s_net : std_logic_vector( 21-1 downto 0 );
  signal clk_net : std_logic;
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
  addsub : entity work.sysgen_addsub_f5a65f010a 
  port map (
    clr => '0',
    a => addsub_s_net_x0,
    b => shift1_op_net,
    mode => inverter_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub_s_net
  );
  addsub1 : entity work.sysgen_addsub_f5a65f010a 
  port map (
    clr => '0',
    a => addsub1_s_net_x0,
    b => shift_op_net,
    mode => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub1_s_net
  );
  addsub2 : entity work.sysgen_addsub_f5a65f010a 
  port map (
    clr => '0',
    a => addsub2_s_net_x0,
    b => constant_op_net,
    mode => inverter_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub2_s_net
  );
  constant_x0 : entity work.sysgen_constant_32a9bd055f 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  inverter : entity work.sysgen_inverter_962a38e1c8 
  port map (
    clr => '0',
    ip => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    op => inverter_op_net
  );
  shift : entity work.sysgen_shift_e2b9b699d2 
  port map (
    clr => '0',
    ip => addsub_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift_op_net
  );
  shift1 : entity work.sysgen_shift_e2b9b699d2 
  port map (
    clr => '0',
    ip => addsub1_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift1_op_net
  );
  slice : entity work.complexphasedetectorswap_xlslice 
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
-- Generated from Simulink block CORDIC PE8
library IEEE;
use IEEE.std_logic_1164.all;
library work;
use work.conv_pkg.all;
entity complexphasedetectorswap_cordic_pe8_x2 is
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
end complexphasedetectorswap_cordic_pe8_x2;
architecture structural of complexphasedetectorswap_cordic_pe8_x2 is 
  signal ce_net : std_logic;
  signal addsub_s_net : std_logic_vector( 21-1 downto 0 );
  signal inverter_op_net : std_logic_vector( 1-1 downto 0 );
  signal shift_op_net : std_logic_vector( 21-1 downto 0 );
  signal slice_y_net : std_logic_vector( 1-1 downto 0 );
  signal addsub2_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal addsub2_s_net : std_logic_vector( 21-1 downto 0 );
  signal addsub1_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal clk_net : std_logic;
  signal shift1_op_net : std_logic_vector( 21-1 downto 0 );
  signal addsub_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal addsub1_s_net : std_logic_vector( 21-1 downto 0 );
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
  addsub : entity work.sysgen_addsub_f5a65f010a 
  port map (
    clr => '0',
    a => addsub_s_net_x0,
    b => shift1_op_net,
    mode => inverter_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub_s_net
  );
  addsub1 : entity work.sysgen_addsub_f5a65f010a 
  port map (
    clr => '0',
    a => addsub1_s_net_x0,
    b => shift_op_net,
    mode => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub1_s_net
  );
  addsub2 : entity work.sysgen_addsub_f5a65f010a 
  port map (
    clr => '0',
    a => addsub2_s_net_x0,
    b => constant_op_net,
    mode => inverter_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub2_s_net
  );
  constant_x0 : entity work.sysgen_constant_a3751ba8cd 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  inverter : entity work.sysgen_inverter_962a38e1c8 
  port map (
    clr => '0',
    ip => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    op => inverter_op_net
  );
  shift : entity work.sysgen_shift_a64cabac3d 
  port map (
    clr => '0',
    ip => addsub_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift_op_net
  );
  shift1 : entity work.sysgen_shift_a64cabac3d 
  port map (
    clr => '0',
    ip => addsub1_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift1_op_net
  );
  slice : entity work.complexphasedetectorswap_xlslice 
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
-- Generated from Simulink block CORDIC PE9
library IEEE;
use IEEE.std_logic_1164.all;
library work;
use work.conv_pkg.all;
entity complexphasedetectorswap_cordic_pe9_x1 is
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
end complexphasedetectorswap_cordic_pe9_x1;
architecture structural of complexphasedetectorswap_cordic_pe9_x1 is 
  signal ce_net : std_logic;
  signal slice_y_net : std_logic_vector( 1-1 downto 0 );
  signal addsub1_s_net : std_logic_vector( 21-1 downto 0 );
  signal shift_op_net : std_logic_vector( 21-1 downto 0 );
  signal clk_net : std_logic;
  signal addsub2_s_net : std_logic_vector( 21-1 downto 0 );
  signal addsub1_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal shift1_op_net : std_logic_vector( 21-1 downto 0 );
  signal addsub_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal addsub_s_net : std_logic_vector( 21-1 downto 0 );
  signal addsub2_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal inverter_op_net : std_logic_vector( 1-1 downto 0 );
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
  addsub : entity work.sysgen_addsub_f5a65f010a 
  port map (
    clr => '0',
    a => addsub_s_net_x0,
    b => shift1_op_net,
    mode => inverter_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub_s_net
  );
  addsub1 : entity work.sysgen_addsub_f5a65f010a 
  port map (
    clr => '0',
    a => addsub1_s_net_x0,
    b => shift_op_net,
    mode => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub1_s_net
  );
  addsub2 : entity work.sysgen_addsub_f5a65f010a 
  port map (
    clr => '0',
    a => addsub2_s_net_x0,
    b => constant_op_net,
    mode => inverter_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub2_s_net
  );
  constant_x0 : entity work.sysgen_constant_a79438f85a 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  inverter : entity work.sysgen_inverter_962a38e1c8 
  port map (
    clr => '0',
    ip => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    op => inverter_op_net
  );
  shift : entity work.sysgen_shift_335bc9bc1e 
  port map (
    clr => '0',
    ip => addsub_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift_op_net
  );
  shift1 : entity work.sysgen_shift_335bc9bc1e 
  port map (
    clr => '0',
    ip => addsub1_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift1_op_net
  );
  slice : entity work.complexphasedetectorswap_xlslice 
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
-- Generated from Simulink block CORDIC Fine Angle PE
library IEEE;
use IEEE.std_logic_1164.all;
library work;
use work.conv_pkg.all;
entity complexphasedetectorswap_cordic_fine_angle_pe is
  port (
    x_x0 : in std_logic_vector( 21-1 downto 0 );
    y : in std_logic_vector( 21-1 downto 0 );
    z : in std_logic_vector( 21-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    x : out std_logic_vector( 21-1 downto 0 );
    y_x0 : out std_logic_vector( 21-1 downto 0 )
  );
end complexphasedetectorswap_cordic_fine_angle_pe;
architecture structural of complexphasedetectorswap_cordic_fine_angle_pe is 
  signal mux_y_net : std_logic_vector( 21-1 downto 0 );
  signal addsub2_s_net_x11 : std_logic_vector( 21-1 downto 0 );
  signal addsub1_s_net_x11 : std_logic_vector( 21-1 downto 0 );
  signal addsub2_s_net_x9 : std_logic_vector( 21-1 downto 0 );
  signal addsub_s_net_x3 : std_logic_vector( 21-1 downto 0 );
  signal ce_net : std_logic;
  signal addsub_s_net_x8 : std_logic_vector( 21-1 downto 0 );
  signal addsub1_s_net_x7 : std_logic_vector( 21-1 downto 0 );
  signal addsub2_s_net_x8 : std_logic_vector( 21-1 downto 0 );
  signal addsub2_s_net_x7 : std_logic_vector( 21-1 downto 0 );
  signal addsub_s_net_x6 : std_logic_vector( 21-1 downto 0 );
  signal constant1_op_net : std_logic_vector( 21-1 downto 0 );
  signal clk_net : std_logic;
  signal addsub_s_net_x10 : std_logic_vector( 21-1 downto 0 );
  signal addsub1_s_net_x10 : std_logic_vector( 21-1 downto 0 );
  signal addsub_s_net_x15 : std_logic_vector( 21-1 downto 0 );
  signal addsub1_s_net_x9 : std_logic_vector( 21-1 downto 0 );
  signal addsub_s_net_x9 : std_logic_vector( 21-1 downto 0 );
  signal addsub_s_net_x7 : std_logic_vector( 21-1 downto 0 );
  signal addsub1_s_net_x6 : std_logic_vector( 21-1 downto 0 );
  signal addsub1_s_net_x5 : std_logic_vector( 21-1 downto 0 );
  signal addsub2_s_net_x6 : std_logic_vector( 21-1 downto 0 );
  signal addsub2_s_net_x10 : std_logic_vector( 21-1 downto 0 );
  signal constant_op_net : std_logic_vector( 21-1 downto 0 );
  signal addsub1_s_net_x3 : std_logic_vector( 21-1 downto 0 );
  signal addsub_s_net_x11 : std_logic_vector( 21-1 downto 0 );
  signal addsub2_s_net_x12 : std_logic_vector( 21-1 downto 0 );
  signal addsub1_s_net_x8 : std_logic_vector( 21-1 downto 0 );
  signal addsub2_s_net_x14 : std_logic_vector( 21-1 downto 0 );
  signal addsub_s_net_x4 : std_logic_vector( 21-1 downto 0 );
  signal addsub_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal addsub1_s_net_x12 : std_logic_vector( 21-1 downto 0 );
  signal addsub1_s_net_x15 : std_logic_vector( 21-1 downto 0 );
  signal addsub2_s_net_x13 : std_logic_vector( 21-1 downto 0 );
  signal addsub_s_net : std_logic_vector( 21-1 downto 0 );
  signal addsub2_s_net_x15 : std_logic_vector( 21-1 downto 0 );
  signal addsub1_s_net_x2 : std_logic_vector( 21-1 downto 0 );
  signal addsub2_s_net_x2 : std_logic_vector( 21-1 downto 0 );
  signal addsub_s_net_x14 : std_logic_vector( 21-1 downto 0 );
  signal addsub2_s_net : std_logic_vector( 21-1 downto 0 );
  signal addsub_s_net_x13 : std_logic_vector( 21-1 downto 0 );
  signal addsub2_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal addsub1_s_net_x14 : std_logic_vector( 21-1 downto 0 );
  signal addsub1_s_net_x13 : std_logic_vector( 21-1 downto 0 );
  signal addsub_s_net_x5 : std_logic_vector( 21-1 downto 0 );
  signal addsub1_s_net_x1 : std_logic_vector( 21-1 downto 0 );
  signal addsub1_s_net : std_logic_vector( 21-1 downto 0 );
  signal addsub1_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal addsub2_s_net_x5 : std_logic_vector( 21-1 downto 0 );
  signal addsub_s_net_x12 : std_logic_vector( 21-1 downto 0 );
  signal addsub1_s_net_x4 : std_logic_vector( 21-1 downto 0 );
  signal addsub_s_net_x2 : std_logic_vector( 21-1 downto 0 );
  signal addsub2_s_net_x4 : std_logic_vector( 21-1 downto 0 );
  signal addsub2_s_net_x1 : std_logic_vector( 21-1 downto 0 );
  signal addsub_s_net_x1 : std_logic_vector( 21-1 downto 0 );
begin
  x <= addsub_s_net_x3;
  y_x0 <= addsub1_s_net_x3;
  constant_op_net <= x_x0;
  constant1_op_net <= y;
  mux_y_net <= z;
  clk_net <= clk_1;
  ce_net <= ce_1;
  cordic_pe1 : entity work.complexphasedetectorswap_cordic_pe1 
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
  cordic_pe10 : entity work.complexphasedetectorswap_cordic_pe10_x1 
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
  cordic_pe11 : entity work.complexphasedetectorswap_cordic_pe11_x0 
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
  cordic_pe12 : entity work.complexphasedetectorswap_cordic_pe12_x0 
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
  cordic_pe13 : entity work.complexphasedetectorswap_cordic_pe13_x0 
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
  cordic_pe14 : entity work.complexphasedetectorswap_cordic_pe14_x0 
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
  cordic_pe15 : entity work.complexphasedetectorswap_cordic_pe15_x0 
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
  cordic_pe16 : entity work.complexphasedetectorswap_cordic_pe16_x0 
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
  cordic_pe17 : entity work.complexphasedetectorswap_cordic_pe17_x0 
  port map (
    x => addsub_s_net_x4,
    y => addsub1_s_net_x12,
    z => addsub2_s_net_x4,
    clk_1 => clk_net,
    ce_1 => ce_net,
    x_x0 => addsub_s_net_x3,
    y_x0 => addsub1_s_net_x3
  );
  cordic_pe2 : entity work.complexphasedetectorswap_cordic_pe2_x2 
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
  cordic_pe3 : entity work.complexphasedetectorswap_cordic_pe3_x2 
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
  cordic_pe4 : entity work.complexphasedetectorswap_cordic_pe4_x2 
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
  cordic_pe5 : entity work.complexphasedetectorswap_cordic_pe5_x2 
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
  cordic_pe6 : entity work.complexphasedetectorswap_cordic_pe6_x2 
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
  cordic_pe7 : entity work.complexphasedetectorswap_cordic_pe7_x2 
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
  cordic_pe8 : entity work.complexphasedetectorswap_cordic_pe8_x2 
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
  cordic_pe9 : entity work.complexphasedetectorswap_cordic_pe9_x1 
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
-- Generated from Simulink block Quadrant Correct
library IEEE;
use IEEE.std_logic_1164.all;
library work;
use work.conv_pkg.all;
entity complexphasedetectorswap_quadrant_correct_x1 is
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
end complexphasedetectorswap_quadrant_correct_x1;
architecture structural of complexphasedetectorswap_quadrant_correct_x1 is 
  signal addsub1_s_net : std_logic_vector( 21-1 downto 0 );
  signal mux1_y_net : std_logic_vector( 21-1 downto 0 );
  signal clk_net : std_logic;
  signal mux3_y_net : std_logic_vector( 21-1 downto 0 );
  signal mux2_y_net : std_logic_vector( 21-1 downto 0 );
  signal ce_net : std_logic;
  signal delay1_q_net : std_logic_vector( 1-1 downto 0 );
  signal mux_y_net : std_logic_vector( 21-1 downto 0 );
  signal addsub_s_net : std_logic_vector( 21-1 downto 0 );
  signal delay4_q_net : std_logic_vector( 1-1 downto 0 );
  signal negate1_op_net : std_logic_vector( 21-1 downto 0 );
  signal negate2_op_net : std_logic_vector( 21-1 downto 0 );
begin
  cosine <= mux_y_net;
  sine <= mux1_y_net;
  addsub_s_net <= cos;
  addsub1_s_net <= sin;
  delay4_q_net <= angle_map;
  delay1_q_net <= sgn_z;
  clk_net <= clk_1;
  ce_net <= ce_1;
  mux : entity work.sysgen_mux_22fb22e069 
  port map (
    clr => '0',
    sel => delay4_q_net,
    d0 => addsub_s_net,
    d1 => mux3_y_net,
    clk => clk_net,
    ce => ce_net,
    y => mux_y_net
  );
  mux1 : entity work.sysgen_mux_22fb22e069 
  port map (
    clr => '0',
    sel => delay4_q_net,
    d0 => addsub1_s_net,
    d1 => mux2_y_net,
    clk => clk_net,
    ce => ce_net,
    y => mux1_y_net
  );
  mux2 : entity work.sysgen_mux_914113a591 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    sel => delay1_q_net,
    d0 => addsub_s_net,
    d1 => negate1_op_net,
    y => mux2_y_net
  );
  mux3 : entity work.sysgen_mux_914113a591 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    sel => delay1_q_net,
    d0 => negate2_op_net,
    d1 => addsub1_s_net,
    y => mux3_y_net
  );
  negate1 : entity work.sysgen_negate_83d9c4199c 
  port map (
    clr => '0',
    ip => addsub_s_net,
    clk => clk_net,
    ce => ce_net,
    op => negate1_op_net
  );
  negate2 : entity work.sysgen_negate_83d9c4199c 
  port map (
    clr => '0',
    ip => addsub1_s_net,
    clk => clk_net,
    ce => ce_net,
    op => negate2_op_net
  );
end structural;
-- Generated from Simulink block Quadrant Map
library IEEE;
use IEEE.std_logic_1164.all;
library work;
use work.conv_pkg.all;
entity complexphasedetectorswap_quadrant_map_x2 is
  port (
    z : in std_logic_vector( 21-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    z_x0 : out std_logic_vector( 21-1 downto 0 );
    angle_map : out std_logic_vector( 1-1 downto 0 );
    sgn_z_x0 : out std_logic_vector( 1-1 downto 0 )
  );
end complexphasedetectorswap_quadrant_map_x2;
architecture structural of complexphasedetectorswap_quadrant_map_x2 is 
  signal mux_y_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal ce_net : std_logic;
  signal logical_y_net : std_logic_vector( 1-1 downto 0 );
  signal mux_y_net : std_logic_vector( 21-1 downto 0 );
  signal constant1_op_net : std_logic_vector( 21-1 downto 0 );
  signal inverter_op_net : std_logic_vector( 1-1 downto 0 );
  signal sgn_z_y_net : std_logic_vector( 1-1 downto 0 );
  signal clk_net : std_logic;
  signal constant2_op_net : std_logic_vector( 21-1 downto 0 );
  signal addsub_s_net : std_logic_vector( 21-1 downto 0 );
  signal delay1_q_net : std_logic_vector( 21-1 downto 0 );
  signal relational1_op_net : std_logic_vector( 1-1 downto 0 );
  signal relational_op_net : std_logic_vector( 1-1 downto 0 );
begin
  z_x0 <= mux_y_net_x0;
  angle_map <= logical_y_net;
  sgn_z_x0 <= sgn_z_y_net;
  mux_y_net <= z;
  clk_net <= clk_1;
  ce_net <= ce_1;
  addsub : entity work.sysgen_addsub_f5a65f010a 
  port map (
    clr => '0',
    a => mux_y_net,
    b => constant1_op_net,
    mode => inverter_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub_s_net
  );
  constant1 : entity work.sysgen_constant_59d2bc57d8 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant1_op_net
  );
  constant2 : entity work.sysgen_constant_7a5a5cef02 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant2_op_net
  );
  delay1 : entity work.complexphasedetectorswap_xldelay 
  generic map (
    latency => 1,
    reg_retiming => 0,
    reset => 0,
    width => 21
  )
  port map (
    en => '1',
    rst => '1',
    d => mux_y_net,
    clk => clk_net,
    ce => ce_net,
    q => delay1_q_net
  );
  inverter : entity work.sysgen_inverter_962a38e1c8 
  port map (
    clr => '0',
    ip => sgn_z_y_net,
    clk => clk_net,
    ce => ce_net,
    op => inverter_op_net
  );
  logical : entity work.sysgen_logical_3ecd2b5ea1 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    d0 => relational_op_net,
    d1 => relational1_op_net,
    y => logical_y_net
  );
  mux : entity work.sysgen_mux_22fb22e069 
  port map (
    clr => '0',
    sel => logical_y_net,
    d0 => delay1_q_net,
    d1 => addsub_s_net,
    clk => clk_net,
    ce => ce_net,
    y => mux_y_net_x0
  );
  relational : entity work.sysgen_relational_c7c11f7f79 
  port map (
    clr => '0',
    a => mux_y_net,
    b => constant1_op_net,
    clk => clk_net,
    ce => ce_net,
    op => relational_op_net
  );
  relational1 : entity work.sysgen_relational_0495233e37 
  port map (
    clr => '0',
    a => mux_y_net,
    b => constant2_op_net,
    clk => clk_net,
    ce => ce_net,
    op => relational1_op_net
  );
  sgn_z : entity work.complexphasedetectorswap_xlslice 
  generic map (
    new_lsb => 20,
    new_msb => 20,
    x_width => 21,
    y_width => 1
  )
  port map (
    x => mux_y_net,
    y => sgn_z_y_net
  );
end structural;
-- Generated from Simulink block CORDIC SINCOS
library IEEE;
use IEEE.std_logic_1164.all;
library work;
use work.conv_pkg.all;
entity complexphasedetectorswap_cordic_sincos_x0 is
  port (
    z : in std_logic_vector( 21-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    cos : out std_logic_vector( 18-1 downto 0 );
    sin : out std_logic_vector( 18-1 downto 0 )
  );
end complexphasedetectorswap_cordic_sincos_x0;
architecture structural of complexphasedetectorswap_cordic_sincos_x0 is 
  signal convert_dout_net : std_logic_vector( 18-1 downto 0 );
  signal addsub1_s_net : std_logic_vector( 21-1 downto 0 );
  signal constant1_op_net : std_logic_vector( 21-1 downto 0 );
  signal mux_y_net_x1 : std_logic_vector( 21-1 downto 0 );
  signal mux1_y_net : std_logic_vector( 21-1 downto 0 );
  signal mux_y_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal delay1_q_net : std_logic_vector( 1-1 downto 0 );
  signal mux_y_net : std_logic_vector( 21-1 downto 0 );
  signal constant_op_net : std_logic_vector( 21-1 downto 0 );
  signal delay4_q_net : std_logic_vector( 1-1 downto 0 );
  signal clk_net : std_logic;
  signal convert1_dout_net : std_logic_vector( 18-1 downto 0 );
  signal ce_net : std_logic;
  signal addsub_s_net : std_logic_vector( 21-1 downto 0 );
  signal logical_y_net : std_logic_vector( 1-1 downto 0 );
  signal sgn_z_y_net : std_logic_vector( 1-1 downto 0 );
begin
  cos <= convert_dout_net;
  sin <= convert1_dout_net;
  mux_y_net <= z;
  clk_net <= clk_1;
  ce_net <= ce_1;
  cordic_fine_angle_pe : entity work.complexphasedetectorswap_cordic_fine_angle_pe 
  port map (
    x_x0 => constant_op_net,
    y => constant1_op_net,
    z => mux_y_net_x0,
    clk_1 => clk_net,
    ce_1 => ce_net,
    x => addsub_s_net,
    y_x0 => addsub1_s_net
  );
  quadrant_correct_x0 : entity work.complexphasedetectorswap_quadrant_correct_x1 
  port map (
    cos => addsub_s_net,
    sin => addsub1_s_net,
    angle_map => delay4_q_net,
    sgn_z => delay1_q_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    cosine => mux_y_net_x1,
    sine => mux1_y_net
  );
  quadrant_map : entity work.complexphasedetectorswap_quadrant_map_x2 
  port map (
    z => mux_y_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    z_x0 => mux_y_net_x0,
    angle_map => logical_y_net,
    sgn_z_x0 => sgn_z_y_net
  );
  constant_x0 : entity work.sysgen_constant_7f0cff09da 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  constant1 : entity work.sysgen_constant_d8a454c0c9 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant1_op_net
  );
  convert : entity work.complexphasedetectorswap_xlconvert 
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
    din => mux_y_net_x1,
    clk => clk_net,
    ce => ce_net,
    dout => convert_dout_net
  );
  convert1 : entity work.complexphasedetectorswap_xlconvert 
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
  delay1 : entity work.complexphasedetectorswap_xldelay 
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
  delay4 : entity work.complexphasedetectorswap_xldelay 
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
-- Generated from Simulink block CORDIC PE1
library IEEE;
use IEEE.std_logic_1164.all;
library work;
use work.conv_pkg.all;
entity complexphasedetectorswap_cordic_pe1_x3 is
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
end complexphasedetectorswap_cordic_pe1_x3;
architecture structural of complexphasedetectorswap_cordic_pe1_x3 is 
  signal constant_op_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal constant1_op_net : std_logic_vector( 21-1 downto 0 );
  signal ce_net : std_logic;
  signal addsub2_s_net : std_logic_vector( 21-1 downto 0 );
  signal inverter_op_net : std_logic_vector( 1-1 downto 0 );
  signal addsub_s_net : std_logic_vector( 21-1 downto 0 );
  signal shift1_op_net : std_logic_vector( 21-1 downto 0 );
  signal shift_op_net : std_logic_vector( 21-1 downto 0 );
  signal slice_y_net : std_logic_vector( 1-1 downto 0 );
  signal addsub1_s_net : std_logic_vector( 21-1 downto 0 );
  signal clk_net : std_logic;
  signal mux_y_net : std_logic_vector( 21-1 downto 0 );
  signal constant_op_net : std_logic_vector( 21-1 downto 0 );
begin
  x_x0 <= addsub_s_net;
  y_x0 <= addsub1_s_net;
  z_x0 <= addsub2_s_net;
  constant_op_net <= x;
  constant1_op_net <= y;
  mux_y_net <= z;
  clk_net <= clk_1;
  ce_net <= ce_1;
  addsub : entity work.sysgen_addsub_f5a65f010a 
  port map (
    clr => '0',
    a => constant_op_net,
    b => shift1_op_net,
    mode => inverter_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub_s_net
  );
  addsub1 : entity work.sysgen_addsub_f5a65f010a 
  port map (
    clr => '0',
    a => constant1_op_net,
    b => shift_op_net,
    mode => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub1_s_net
  );
  addsub2 : entity work.sysgen_addsub_f5a65f010a 
  port map (
    clr => '0',
    a => mux_y_net,
    b => constant_op_net_x0,
    mode => inverter_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub2_s_net
  );
  constant_x0 : entity work.sysgen_constant_95d05a214e 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net_x0
  );
  inverter : entity work.sysgen_inverter_962a38e1c8 
  port map (
    clr => '0',
    ip => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    op => inverter_op_net
  );
  shift : entity work.sysgen_shift_52faab0184 
  port map (
    clk => '1',
    ce => '1',
    clr => '0',
    ip => constant_op_net,
    op => shift_op_net
  );
  shift1 : entity work.sysgen_shift_52faab0184 
  port map (
    clk => '1',
    ce => '1',
    clr => '0',
    ip => constant1_op_net,
    op => shift1_op_net
  );
  slice : entity work.complexphasedetectorswap_xlslice 
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
-- Generated from Simulink block CORDIC PE10
library IEEE;
use IEEE.std_logic_1164.all;
library work;
use work.conv_pkg.all;
entity complexphasedetectorswap_cordic_pe10_x2 is
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
end complexphasedetectorswap_cordic_pe10_x2;
architecture structural of complexphasedetectorswap_cordic_pe10_x2 is 
  signal inverter_op_net : std_logic_vector( 1-1 downto 0 );
  signal addsub2_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal addsub2_s_net : std_logic_vector( 21-1 downto 0 );
  signal addsub1_s_net : std_logic_vector( 21-1 downto 0 );
  signal ce_net : std_logic;
  signal addsub_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal addsub1_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal shift_op_net : std_logic_vector( 21-1 downto 0 );
  signal slice_y_net : std_logic_vector( 1-1 downto 0 );
  signal shift1_op_net : std_logic_vector( 21-1 downto 0 );
  signal clk_net : std_logic;
  signal addsub_s_net : std_logic_vector( 21-1 downto 0 );
  signal constant_op_net : std_logic_vector( 21-1 downto 0 );
begin
  x_x0 <= addsub_s_net_x0;
  y_x0 <= addsub1_s_net_x0;
  z_x0 <= addsub2_s_net_x0;
  addsub_s_net <= x;
  addsub1_s_net <= y;
  addsub2_s_net <= z;
  clk_net <= clk_1;
  ce_net <= ce_1;
  addsub : entity work.sysgen_addsub_f5a65f010a 
  port map (
    clr => '0',
    a => addsub_s_net,
    b => shift1_op_net,
    mode => inverter_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub_s_net_x0
  );
  addsub1 : entity work.sysgen_addsub_f5a65f010a 
  port map (
    clr => '0',
    a => addsub1_s_net,
    b => shift_op_net,
    mode => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub1_s_net_x0
  );
  addsub2 : entity work.sysgen_addsub_f5a65f010a 
  port map (
    clr => '0',
    a => addsub2_s_net,
    b => constant_op_net,
    mode => inverter_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub2_s_net_x0
  );
  constant_x0 : entity work.sysgen_constant_c2c702ee2d 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  inverter : entity work.sysgen_inverter_962a38e1c8 
  port map (
    clr => '0',
    ip => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    op => inverter_op_net
  );
  shift : entity work.sysgen_shift_d3d79dc856 
  port map (
    clr => '0',
    ip => addsub_s_net,
    clk => clk_net,
    ce => ce_net,
    op => shift_op_net
  );
  shift1 : entity work.sysgen_shift_d3d79dc856 
  port map (
    clr => '0',
    ip => addsub1_s_net,
    clk => clk_net,
    ce => ce_net,
    op => shift1_op_net
  );
  slice : entity work.complexphasedetectorswap_xlslice 
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
-- Generated from Simulink block CORDIC PE11
library IEEE;
use IEEE.std_logic_1164.all;
library work;
use work.conv_pkg.all;
entity complexphasedetectorswap_cordic_pe11_x1 is
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
end complexphasedetectorswap_cordic_pe11_x1;
architecture structural of complexphasedetectorswap_cordic_pe11_x1 is 
  signal addsub1_s_net : std_logic_vector( 21-1 downto 0 );
  signal clk_net : std_logic;
  signal shift1_op_net : std_logic_vector( 21-1 downto 0 );
  signal ce_net : std_logic;
  signal addsub2_s_net : std_logic_vector( 21-1 downto 0 );
  signal shift_op_net : std_logic_vector( 21-1 downto 0 );
  signal slice_y_net : std_logic_vector( 1-1 downto 0 );
  signal addsub_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal addsub1_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal addsub2_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal inverter_op_net : std_logic_vector( 1-1 downto 0 );
  signal addsub_s_net : std_logic_vector( 21-1 downto 0 );
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
  addsub : entity work.sysgen_addsub_f5a65f010a 
  port map (
    clr => '0',
    a => addsub_s_net_x0,
    b => shift1_op_net,
    mode => inverter_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub_s_net
  );
  addsub1 : entity work.sysgen_addsub_f5a65f010a 
  port map (
    clr => '0',
    a => addsub1_s_net_x0,
    b => shift_op_net,
    mode => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub1_s_net
  );
  addsub2 : entity work.sysgen_addsub_f5a65f010a 
  port map (
    clr => '0',
    a => addsub2_s_net_x0,
    b => constant_op_net,
    mode => inverter_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub2_s_net
  );
  constant_x0 : entity work.sysgen_constant_3c854d5995 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  inverter : entity work.sysgen_inverter_962a38e1c8 
  port map (
    clr => '0',
    ip => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    op => inverter_op_net
  );
  shift : entity work.sysgen_shift_e72705e197 
  port map (
    clr => '0',
    ip => addsub_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift_op_net
  );
  shift1 : entity work.sysgen_shift_e72705e197 
  port map (
    clr => '0',
    ip => addsub1_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift1_op_net
  );
  slice : entity work.complexphasedetectorswap_xlslice 
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
-- Generated from Simulink block CORDIC PE12
library IEEE;
use IEEE.std_logic_1164.all;
library work;
use work.conv_pkg.all;
entity complexphasedetectorswap_cordic_pe12_x1 is
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
end complexphasedetectorswap_cordic_pe12_x1;
architecture structural of complexphasedetectorswap_cordic_pe12_x1 is 
  signal addsub2_s_net : std_logic_vector( 21-1 downto 0 );
  signal inverter_op_net : std_logic_vector( 1-1 downto 0 );
  signal ce_net : std_logic;
  signal shift1_op_net : std_logic_vector( 21-1 downto 0 );
  signal shift_op_net : std_logic_vector( 21-1 downto 0 );
  signal slice_y_net : std_logic_vector( 1-1 downto 0 );
  signal addsub1_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal addsub_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal addsub2_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal clk_net : std_logic;
  signal addsub_s_net : std_logic_vector( 21-1 downto 0 );
  signal addsub1_s_net : std_logic_vector( 21-1 downto 0 );
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
  addsub : entity work.sysgen_addsub_f5a65f010a 
  port map (
    clr => '0',
    a => addsub_s_net_x0,
    b => shift1_op_net,
    mode => inverter_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub_s_net
  );
  addsub1 : entity work.sysgen_addsub_f5a65f010a 
  port map (
    clr => '0',
    a => addsub1_s_net_x0,
    b => shift_op_net,
    mode => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub1_s_net
  );
  addsub2 : entity work.sysgen_addsub_f5a65f010a 
  port map (
    clr => '0',
    a => addsub2_s_net_x0,
    b => constant_op_net,
    mode => inverter_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub2_s_net
  );
  constant_x0 : entity work.sysgen_constant_b3a23cd7f8 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  inverter : entity work.sysgen_inverter_962a38e1c8 
  port map (
    clr => '0',
    ip => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    op => inverter_op_net
  );
  shift : entity work.sysgen_shift_f6320478c4 
  port map (
    clr => '0',
    ip => addsub_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift_op_net
  );
  shift1 : entity work.sysgen_shift_f6320478c4 
  port map (
    clr => '0',
    ip => addsub1_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift1_op_net
  );
  slice : entity work.complexphasedetectorswap_xlslice 
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
-- Generated from Simulink block CORDIC PE13
library IEEE;
use IEEE.std_logic_1164.all;
library work;
use work.conv_pkg.all;
entity complexphasedetectorswap_cordic_pe13_x1 is
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
end complexphasedetectorswap_cordic_pe13_x1;
architecture structural of complexphasedetectorswap_cordic_pe13_x1 is 
  signal addsub1_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal addsub2_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal shift1_op_net : std_logic_vector( 21-1 downto 0 );
  signal addsub_s_net : std_logic_vector( 21-1 downto 0 );
  signal addsub1_s_net : std_logic_vector( 21-1 downto 0 );
  signal inverter_op_net : std_logic_vector( 1-1 downto 0 );
  signal addsub2_s_net : std_logic_vector( 21-1 downto 0 );
  signal clk_net : std_logic;
  signal addsub_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal ce_net : std_logic;
  signal slice_y_net : std_logic_vector( 1-1 downto 0 );
  signal shift_op_net : std_logic_vector( 21-1 downto 0 );
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
  addsub : entity work.sysgen_addsub_f5a65f010a 
  port map (
    clr => '0',
    a => addsub_s_net_x0,
    b => shift1_op_net,
    mode => inverter_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub_s_net
  );
  addsub1 : entity work.sysgen_addsub_f5a65f010a 
  port map (
    clr => '0',
    a => addsub1_s_net_x0,
    b => shift_op_net,
    mode => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub1_s_net
  );
  addsub2 : entity work.sysgen_addsub_f5a65f010a 
  port map (
    clr => '0',
    a => addsub2_s_net_x0,
    b => constant_op_net,
    mode => inverter_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub2_s_net
  );
  constant_x0 : entity work.sysgen_constant_f7a04a812a 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  inverter : entity work.sysgen_inverter_962a38e1c8 
  port map (
    clr => '0',
    ip => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    op => inverter_op_net
  );
  shift : entity work.sysgen_shift_d530c922d4 
  port map (
    clr => '0',
    ip => addsub_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift_op_net
  );
  shift1 : entity work.sysgen_shift_d530c922d4 
  port map (
    clr => '0',
    ip => addsub1_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift1_op_net
  );
  slice : entity work.complexphasedetectorswap_xlslice 
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
-- Generated from Simulink block CORDIC PE14
library IEEE;
use IEEE.std_logic_1164.all;
library work;
use work.conv_pkg.all;
entity complexphasedetectorswap_cordic_pe14_x1 is
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
end complexphasedetectorswap_cordic_pe14_x1;
architecture structural of complexphasedetectorswap_cordic_pe14_x1 is 
  signal addsub_s_net : std_logic_vector( 21-1 downto 0 );
  signal addsub2_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal ce_net : std_logic;
  signal addsub1_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal addsub1_s_net : std_logic_vector( 21-1 downto 0 );
  signal clk_net : std_logic;
  signal addsub_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal inverter_op_net : std_logic_vector( 1-1 downto 0 );
  signal shift_op_net : std_logic_vector( 21-1 downto 0 );
  signal addsub2_s_net : std_logic_vector( 21-1 downto 0 );
  signal slice_y_net : std_logic_vector( 1-1 downto 0 );
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
  addsub : entity work.sysgen_addsub_f5a65f010a 
  port map (
    clr => '0',
    a => addsub_s_net_x0,
    b => shift1_op_net,
    mode => inverter_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub_s_net
  );
  addsub1 : entity work.sysgen_addsub_f5a65f010a 
  port map (
    clr => '0',
    a => addsub1_s_net_x0,
    b => shift_op_net,
    mode => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub1_s_net
  );
  addsub2 : entity work.sysgen_addsub_f5a65f010a 
  port map (
    clr => '0',
    a => addsub2_s_net_x0,
    b => constant_op_net,
    mode => inverter_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub2_s_net
  );
  constant_x0 : entity work.sysgen_constant_91f2f3a7f5 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  inverter : entity work.sysgen_inverter_962a38e1c8 
  port map (
    clr => '0',
    ip => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    op => inverter_op_net
  );
  shift : entity work.sysgen_shift_294e1fd787 
  port map (
    clr => '0',
    ip => addsub_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift_op_net
  );
  shift1 : entity work.sysgen_shift_294e1fd787 
  port map (
    clr => '0',
    ip => addsub1_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift1_op_net
  );
  slice : entity work.complexphasedetectorswap_xlslice 
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
-- Generated from Simulink block CORDIC PE15
library IEEE;
use IEEE.std_logic_1164.all;
library work;
use work.conv_pkg.all;
entity complexphasedetectorswap_cordic_pe15_x1 is
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
end complexphasedetectorswap_cordic_pe15_x1;
architecture structural of complexphasedetectorswap_cordic_pe15_x1 is 
  signal shift_op_net : std_logic_vector( 21-1 downto 0 );
  signal slice_y_net : std_logic_vector( 1-1 downto 0 );
  signal clk_net : std_logic;
  signal addsub2_s_net : std_logic_vector( 21-1 downto 0 );
  signal addsub_s_net : std_logic_vector( 21-1 downto 0 );
  signal addsub_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal inverter_op_net : std_logic_vector( 1-1 downto 0 );
  signal addsub1_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal ce_net : std_logic;
  signal addsub2_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal addsub1_s_net : std_logic_vector( 21-1 downto 0 );
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
  addsub : entity work.sysgen_addsub_f5a65f010a 
  port map (
    clr => '0',
    a => addsub_s_net_x0,
    b => shift1_op_net,
    mode => inverter_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub_s_net
  );
  addsub1 : entity work.sysgen_addsub_f5a65f010a 
  port map (
    clr => '0',
    a => addsub1_s_net_x0,
    b => shift_op_net,
    mode => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub1_s_net
  );
  addsub2 : entity work.sysgen_addsub_f5a65f010a 
  port map (
    clr => '0',
    a => addsub2_s_net_x0,
    b => constant_op_net,
    mode => inverter_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub2_s_net
  );
  constant_x0 : entity work.sysgen_constant_90c8681005 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  inverter : entity work.sysgen_inverter_962a38e1c8 
  port map (
    clr => '0',
    ip => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    op => inverter_op_net
  );
  shift : entity work.sysgen_shift_2576158b81 
  port map (
    clr => '0',
    ip => addsub_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift_op_net
  );
  shift1 : entity work.sysgen_shift_2576158b81 
  port map (
    clr => '0',
    ip => addsub1_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift1_op_net
  );
  slice : entity work.complexphasedetectorswap_xlslice 
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
-- Generated from Simulink block CORDIC PE16
library IEEE;
use IEEE.std_logic_1164.all;
library work;
use work.conv_pkg.all;
entity complexphasedetectorswap_cordic_pe16_x1 is
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
end complexphasedetectorswap_cordic_pe16_x1;
architecture structural of complexphasedetectorswap_cordic_pe16_x1 is 
  signal ce_net : std_logic;
  signal addsub2_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal shift1_op_net : std_logic_vector( 21-1 downto 0 );
  signal inverter_op_net : std_logic_vector( 1-1 downto 0 );
  signal addsub_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal shift_op_net : std_logic_vector( 21-1 downto 0 );
  signal addsub2_s_net : std_logic_vector( 21-1 downto 0 );
  signal slice_y_net : std_logic_vector( 1-1 downto 0 );
  signal addsub_s_net : std_logic_vector( 21-1 downto 0 );
  signal clk_net : std_logic;
  signal addsub1_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal addsub1_s_net : std_logic_vector( 21-1 downto 0 );
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
  addsub : entity work.sysgen_addsub_f5a65f010a 
  port map (
    clr => '0',
    a => addsub_s_net_x0,
    b => shift1_op_net,
    mode => inverter_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub_s_net
  );
  addsub1 : entity work.sysgen_addsub_f5a65f010a 
  port map (
    clr => '0',
    a => addsub1_s_net_x0,
    b => shift_op_net,
    mode => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub1_s_net
  );
  addsub2 : entity work.sysgen_addsub_f5a65f010a 
  port map (
    clr => '0',
    a => addsub2_s_net_x0,
    b => constant_op_net,
    mode => inverter_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub2_s_net
  );
  constant_x0 : entity work.sysgen_constant_0bc3b7abba 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  inverter : entity work.sysgen_inverter_962a38e1c8 
  port map (
    clr => '0',
    ip => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    op => inverter_op_net
  );
  shift : entity work.sysgen_shift_d8b2048fe7 
  port map (
    clr => '0',
    ip => addsub_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift_op_net
  );
  shift1 : entity work.sysgen_shift_d8b2048fe7 
  port map (
    clr => '0',
    ip => addsub1_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift1_op_net
  );
  slice : entity work.complexphasedetectorswap_xlslice 
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
-- Generated from Simulink block CORDIC PE17
library IEEE;
use IEEE.std_logic_1164.all;
library work;
use work.conv_pkg.all;
entity complexphasedetectorswap_cordic_pe17_x1 is
  port (
    x : in std_logic_vector( 21-1 downto 0 );
    y : in std_logic_vector( 21-1 downto 0 );
    z : in std_logic_vector( 21-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    x_x0 : out std_logic_vector( 21-1 downto 0 );
    y_x0 : out std_logic_vector( 21-1 downto 0 )
  );
end complexphasedetectorswap_cordic_pe17_x1;
architecture structural of complexphasedetectorswap_cordic_pe17_x1 is 
  signal addsub1_s_net : std_logic_vector( 21-1 downto 0 );
  signal ce_net : std_logic;
  signal addsub2_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal clk_net : std_logic;
  signal shift1_op_net : std_logic_vector( 21-1 downto 0 );
  signal inverter_op_net : std_logic_vector( 1-1 downto 0 );
  signal addsub1_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal shift_op_net : std_logic_vector( 21-1 downto 0 );
  signal slice_y_net : std_logic_vector( 1-1 downto 0 );
  signal addsub_s_net : std_logic_vector( 21-1 downto 0 );
  signal addsub_s_net_x0 : std_logic_vector( 21-1 downto 0 );
begin
  x_x0 <= addsub_s_net;
  y_x0 <= addsub1_s_net;
  addsub_s_net_x0 <= x;
  addsub1_s_net_x0 <= y;
  addsub2_s_net_x0 <= z;
  clk_net <= clk_1;
  ce_net <= ce_1;
  addsub : entity work.sysgen_addsub_f5a65f010a 
  port map (
    clr => '0',
    a => addsub_s_net_x0,
    b => shift1_op_net,
    mode => inverter_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub_s_net
  );
  addsub1 : entity work.sysgen_addsub_f5a65f010a 
  port map (
    clr => '0',
    a => addsub1_s_net_x0,
    b => shift_op_net,
    mode => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub1_s_net
  );
  inverter : entity work.sysgen_inverter_962a38e1c8 
  port map (
    clr => '0',
    ip => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    op => inverter_op_net
  );
  shift : entity work.sysgen_shift_66e2ae0031 
  port map (
    clr => '0',
    ip => addsub_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift_op_net
  );
  shift1 : entity work.sysgen_shift_66e2ae0031 
  port map (
    clr => '0',
    ip => addsub1_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift1_op_net
  );
  slice : entity work.complexphasedetectorswap_xlslice 
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
-- Generated from Simulink block CORDIC PE2
library IEEE;
use IEEE.std_logic_1164.all;
library work;
use work.conv_pkg.all;
entity complexphasedetectorswap_cordic_pe2_x3 is
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
end complexphasedetectorswap_cordic_pe2_x3;
architecture structural of complexphasedetectorswap_cordic_pe2_x3 is 
  signal addsub1_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal ce_net : std_logic;
  signal addsub1_s_net : std_logic_vector( 21-1 downto 0 );
  signal shift1_op_net : std_logic_vector( 21-1 downto 0 );
  signal inverter_op_net : std_logic_vector( 1-1 downto 0 );
  signal addsub_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal clk_net : std_logic;
  signal addsub2_s_net : std_logic_vector( 21-1 downto 0 );
  signal shift_op_net : std_logic_vector( 21-1 downto 0 );
  signal constant_op_net : std_logic_vector( 21-1 downto 0 );
  signal slice_y_net : std_logic_vector( 1-1 downto 0 );
  signal addsub_s_net : std_logic_vector( 21-1 downto 0 );
  signal addsub2_s_net_x0 : std_logic_vector( 21-1 downto 0 );
begin
  x_x0 <= addsub_s_net;
  y_x0 <= addsub1_s_net;
  z_x0 <= addsub2_s_net;
  addsub_s_net_x0 <= x;
  addsub1_s_net_x0 <= y;
  addsub2_s_net_x0 <= z;
  clk_net <= clk_1;
  ce_net <= ce_1;
  addsub : entity work.sysgen_addsub_f5a65f010a 
  port map (
    clr => '0',
    a => addsub_s_net_x0,
    b => shift1_op_net,
    mode => inverter_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub_s_net
  );
  addsub1 : entity work.sysgen_addsub_f5a65f010a 
  port map (
    clr => '0',
    a => addsub1_s_net_x0,
    b => shift_op_net,
    mode => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub1_s_net
  );
  addsub2 : entity work.sysgen_addsub_f5a65f010a 
  port map (
    clr => '0',
    a => addsub2_s_net_x0,
    b => constant_op_net,
    mode => inverter_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub2_s_net
  );
  constant_x0 : entity work.sysgen_constant_dd916d685b 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  inverter : entity work.sysgen_inverter_962a38e1c8 
  port map (
    clr => '0',
    ip => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    op => inverter_op_net
  );
  shift : entity work.sysgen_shift_74cef34337 
  port map (
    clr => '0',
    ip => addsub_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift_op_net
  );
  shift1 : entity work.sysgen_shift_74cef34337 
  port map (
    clr => '0',
    ip => addsub1_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift1_op_net
  );
  slice : entity work.complexphasedetectorswap_xlslice 
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
-- Generated from Simulink block CORDIC PE3
library IEEE;
use IEEE.std_logic_1164.all;
library work;
use work.conv_pkg.all;
entity complexphasedetectorswap_cordic_pe3_x3 is
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
end complexphasedetectorswap_cordic_pe3_x3;
architecture structural of complexphasedetectorswap_cordic_pe3_x3 is 
  signal shift1_op_net : std_logic_vector( 21-1 downto 0 );
  signal shift_op_net : std_logic_vector( 21-1 downto 0 );
  signal slice_y_net : std_logic_vector( 1-1 downto 0 );
  signal addsub_s_net : std_logic_vector( 21-1 downto 0 );
  signal inverter_op_net : std_logic_vector( 1-1 downto 0 );
  signal addsub2_s_net : std_logic_vector( 21-1 downto 0 );
  signal constant_op_net : std_logic_vector( 21-1 downto 0 );
  signal ce_net : std_logic;
  signal addsub1_s_net : std_logic_vector( 21-1 downto 0 );
  signal addsub_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal addsub1_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal addsub2_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal clk_net : std_logic;
begin
  x_x0 <= addsub_s_net;
  y_x0 <= addsub1_s_net;
  z_x0 <= addsub2_s_net;
  addsub_s_net_x0 <= x;
  addsub1_s_net_x0 <= y;
  addsub2_s_net_x0 <= z;
  clk_net <= clk_1;
  ce_net <= ce_1;
  addsub : entity work.sysgen_addsub_f5a65f010a 
  port map (
    clr => '0',
    a => addsub_s_net_x0,
    b => shift1_op_net,
    mode => inverter_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub_s_net
  );
  addsub1 : entity work.sysgen_addsub_f5a65f010a 
  port map (
    clr => '0',
    a => addsub1_s_net_x0,
    b => shift_op_net,
    mode => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub1_s_net
  );
  addsub2 : entity work.sysgen_addsub_f5a65f010a 
  port map (
    clr => '0',
    a => addsub2_s_net_x0,
    b => constant_op_net,
    mode => inverter_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub2_s_net
  );
  constant_x0 : entity work.sysgen_constant_01578f1ab8 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  inverter : entity work.sysgen_inverter_962a38e1c8 
  port map (
    clr => '0',
    ip => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    op => inverter_op_net
  );
  shift : entity work.sysgen_shift_19e82f2d27 
  port map (
    clr => '0',
    ip => addsub_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift_op_net
  );
  shift1 : entity work.sysgen_shift_19e82f2d27 
  port map (
    clr => '0',
    ip => addsub1_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift1_op_net
  );
  slice : entity work.complexphasedetectorswap_xlslice 
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
-- Generated from Simulink block CORDIC PE4
library IEEE;
use IEEE.std_logic_1164.all;
library work;
use work.conv_pkg.all;
entity complexphasedetectorswap_cordic_pe4_x3 is
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
end complexphasedetectorswap_cordic_pe4_x3;
architecture structural of complexphasedetectorswap_cordic_pe4_x3 is 
  signal addsub_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal shift1_op_net : std_logic_vector( 21-1 downto 0 );
  signal inverter_op_net : std_logic_vector( 1-1 downto 0 );
  signal slice_y_net : std_logic_vector( 1-1 downto 0 );
  signal addsub1_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal addsub2_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal addsub_s_net : std_logic_vector( 21-1 downto 0 );
  signal constant_op_net : std_logic_vector( 21-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal addsub1_s_net : std_logic_vector( 21-1 downto 0 );
  signal addsub2_s_net : std_logic_vector( 21-1 downto 0 );
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
  addsub : entity work.sysgen_addsub_f5a65f010a 
  port map (
    clr => '0',
    a => addsub_s_net_x0,
    b => shift1_op_net,
    mode => inverter_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub_s_net
  );
  addsub1 : entity work.sysgen_addsub_f5a65f010a 
  port map (
    clr => '0',
    a => addsub1_s_net_x0,
    b => shift_op_net,
    mode => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub1_s_net
  );
  addsub2 : entity work.sysgen_addsub_f5a65f010a 
  port map (
    clr => '0',
    a => addsub2_s_net_x0,
    b => constant_op_net,
    mode => inverter_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub2_s_net
  );
  constant_x0 : entity work.sysgen_constant_dd9ca53c6d 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  inverter : entity work.sysgen_inverter_962a38e1c8 
  port map (
    clr => '0',
    ip => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    op => inverter_op_net
  );
  shift : entity work.sysgen_shift_4cc720ff32 
  port map (
    clr => '0',
    ip => addsub_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift_op_net
  );
  shift1 : entity work.sysgen_shift_4cc720ff32 
  port map (
    clr => '0',
    ip => addsub1_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift1_op_net
  );
  slice : entity work.complexphasedetectorswap_xlslice 
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
-- Generated from Simulink block CORDIC PE5
library IEEE;
use IEEE.std_logic_1164.all;
library work;
use work.conv_pkg.all;
entity complexphasedetectorswap_cordic_pe5_x3 is
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
end complexphasedetectorswap_cordic_pe5_x3;
architecture structural of complexphasedetectorswap_cordic_pe5_x3 is 
  signal ce_net : std_logic;
  signal addsub_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal addsub1_s_net : std_logic_vector( 21-1 downto 0 );
  signal slice_y_net : std_logic_vector( 1-1 downto 0 );
  signal addsub1_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal addsub_s_net : std_logic_vector( 21-1 downto 0 );
  signal inverter_op_net : std_logic_vector( 1-1 downto 0 );
  signal shift_op_net : std_logic_vector( 21-1 downto 0 );
  signal constant_op_net : std_logic_vector( 21-1 downto 0 );
  signal addsub2_s_net : std_logic_vector( 21-1 downto 0 );
  signal shift1_op_net : std_logic_vector( 21-1 downto 0 );
  signal clk_net : std_logic;
  signal addsub2_s_net_x0 : std_logic_vector( 21-1 downto 0 );
begin
  x_x0 <= addsub_s_net;
  y_x0 <= addsub1_s_net;
  z_x0 <= addsub2_s_net;
  addsub_s_net_x0 <= x;
  addsub1_s_net_x0 <= y;
  addsub2_s_net_x0 <= z;
  clk_net <= clk_1;
  ce_net <= ce_1;
  addsub : entity work.sysgen_addsub_f5a65f010a 
  port map (
    clr => '0',
    a => addsub_s_net_x0,
    b => shift1_op_net,
    mode => inverter_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub_s_net
  );
  addsub1 : entity work.sysgen_addsub_f5a65f010a 
  port map (
    clr => '0',
    a => addsub1_s_net_x0,
    b => shift_op_net,
    mode => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub1_s_net
  );
  addsub2 : entity work.sysgen_addsub_f5a65f010a 
  port map (
    clr => '0',
    a => addsub2_s_net_x0,
    b => constant_op_net,
    mode => inverter_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub2_s_net
  );
  constant_x0 : entity work.sysgen_constant_d35c73d5e3 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  inverter : entity work.sysgen_inverter_962a38e1c8 
  port map (
    clr => '0',
    ip => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    op => inverter_op_net
  );
  shift : entity work.sysgen_shift_b17afba2f9 
  port map (
    clr => '0',
    ip => addsub_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift_op_net
  );
  shift1 : entity work.sysgen_shift_b17afba2f9 
  port map (
    clr => '0',
    ip => addsub1_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift1_op_net
  );
  slice : entity work.complexphasedetectorswap_xlslice 
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
-- Generated from Simulink block CORDIC PE6
library IEEE;
use IEEE.std_logic_1164.all;
library work;
use work.conv_pkg.all;
entity complexphasedetectorswap_cordic_pe6_x3 is
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
end complexphasedetectorswap_cordic_pe6_x3;
architecture structural of complexphasedetectorswap_cordic_pe6_x3 is 
  signal addsub2_s_net : std_logic_vector( 21-1 downto 0 );
  signal addsub1_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal addsub2_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal addsub1_s_net : std_logic_vector( 21-1 downto 0 );
  signal ce_net : std_logic;
  signal addsub_s_net : std_logic_vector( 21-1 downto 0 );
  signal shift_op_net : std_logic_vector( 21-1 downto 0 );
  signal shift1_op_net : std_logic_vector( 21-1 downto 0 );
  signal clk_net : std_logic;
  signal constant_op_net : std_logic_vector( 21-1 downto 0 );
  signal addsub_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal inverter_op_net : std_logic_vector( 1-1 downto 0 );
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
  addsub : entity work.sysgen_addsub_f5a65f010a 
  port map (
    clr => '0',
    a => addsub_s_net_x0,
    b => shift1_op_net,
    mode => inverter_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub_s_net
  );
  addsub1 : entity work.sysgen_addsub_f5a65f010a 
  port map (
    clr => '0',
    a => addsub1_s_net_x0,
    b => shift_op_net,
    mode => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub1_s_net
  );
  addsub2 : entity work.sysgen_addsub_f5a65f010a 
  port map (
    clr => '0',
    a => addsub2_s_net_x0,
    b => constant_op_net,
    mode => inverter_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub2_s_net
  );
  constant_x0 : entity work.sysgen_constant_8d75c3299d 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  inverter : entity work.sysgen_inverter_962a38e1c8 
  port map (
    clr => '0',
    ip => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    op => inverter_op_net
  );
  shift : entity work.sysgen_shift_59571b7f11 
  port map (
    clr => '0',
    ip => addsub_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift_op_net
  );
  shift1 : entity work.sysgen_shift_59571b7f11 
  port map (
    clr => '0',
    ip => addsub1_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift1_op_net
  );
  slice : entity work.complexphasedetectorswap_xlslice 
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
-- Generated from Simulink block CORDIC PE7
library IEEE;
use IEEE.std_logic_1164.all;
library work;
use work.conv_pkg.all;
entity complexphasedetectorswap_cordic_pe7_x3 is
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
end complexphasedetectorswap_cordic_pe7_x3;
architecture structural of complexphasedetectorswap_cordic_pe7_x3 is 
  signal shift1_op_net : std_logic_vector( 21-1 downto 0 );
  signal inverter_op_net : std_logic_vector( 1-1 downto 0 );
  signal slice_y_net : std_logic_vector( 1-1 downto 0 );
  signal addsub1_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal constant_op_net : std_logic_vector( 21-1 downto 0 );
  signal ce_net : std_logic;
  signal addsub2_s_net : std_logic_vector( 21-1 downto 0 );
  signal addsub1_s_net : std_logic_vector( 21-1 downto 0 );
  signal addsub2_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal clk_net : std_logic;
  signal addsub_s_net : std_logic_vector( 21-1 downto 0 );
  signal addsub_s_net_x0 : std_logic_vector( 21-1 downto 0 );
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
  addsub : entity work.sysgen_addsub_f5a65f010a 
  port map (
    clr => '0',
    a => addsub_s_net_x0,
    b => shift1_op_net,
    mode => inverter_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub_s_net
  );
  addsub1 : entity work.sysgen_addsub_f5a65f010a 
  port map (
    clr => '0',
    a => addsub1_s_net_x0,
    b => shift_op_net,
    mode => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub1_s_net
  );
  addsub2 : entity work.sysgen_addsub_f5a65f010a 
  port map (
    clr => '0',
    a => addsub2_s_net_x0,
    b => constant_op_net,
    mode => inverter_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub2_s_net
  );
  constant_x0 : entity work.sysgen_constant_32a9bd055f 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  inverter : entity work.sysgen_inverter_962a38e1c8 
  port map (
    clr => '0',
    ip => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    op => inverter_op_net
  );
  shift : entity work.sysgen_shift_e2b9b699d2 
  port map (
    clr => '0',
    ip => addsub_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift_op_net
  );
  shift1 : entity work.sysgen_shift_e2b9b699d2 
  port map (
    clr => '0',
    ip => addsub1_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift1_op_net
  );
  slice : entity work.complexphasedetectorswap_xlslice 
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
-- Generated from Simulink block CORDIC PE8
library IEEE;
use IEEE.std_logic_1164.all;
library work;
use work.conv_pkg.all;
entity complexphasedetectorswap_cordic_pe8_x3 is
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
end complexphasedetectorswap_cordic_pe8_x3;
architecture structural of complexphasedetectorswap_cordic_pe8_x3 is 
  signal addsub1_s_net : std_logic_vector( 21-1 downto 0 );
  signal addsub1_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal clk_net : std_logic;
  signal shift_op_net : std_logic_vector( 21-1 downto 0 );
  signal inverter_op_net : std_logic_vector( 1-1 downto 0 );
  signal addsub_s_net : std_logic_vector( 21-1 downto 0 );
  signal constant_op_net : std_logic_vector( 21-1 downto 0 );
  signal addsub2_s_net : std_logic_vector( 21-1 downto 0 );
  signal addsub_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal ce_net : std_logic;
  signal addsub2_s_net_x0 : std_logic_vector( 21-1 downto 0 );
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
  addsub : entity work.sysgen_addsub_f5a65f010a 
  port map (
    clr => '0',
    a => addsub_s_net_x0,
    b => shift1_op_net,
    mode => inverter_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub_s_net
  );
  addsub1 : entity work.sysgen_addsub_f5a65f010a 
  port map (
    clr => '0',
    a => addsub1_s_net_x0,
    b => shift_op_net,
    mode => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub1_s_net
  );
  addsub2 : entity work.sysgen_addsub_f5a65f010a 
  port map (
    clr => '0',
    a => addsub2_s_net_x0,
    b => constant_op_net,
    mode => inverter_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub2_s_net
  );
  constant_x0 : entity work.sysgen_constant_a3751ba8cd 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  inverter : entity work.sysgen_inverter_962a38e1c8 
  port map (
    clr => '0',
    ip => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    op => inverter_op_net
  );
  shift : entity work.sysgen_shift_a64cabac3d 
  port map (
    clr => '0',
    ip => addsub_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift_op_net
  );
  shift1 : entity work.sysgen_shift_a64cabac3d 
  port map (
    clr => '0',
    ip => addsub1_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift1_op_net
  );
  slice : entity work.complexphasedetectorswap_xlslice 
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
-- Generated from Simulink block CORDIC PE9
library IEEE;
use IEEE.std_logic_1164.all;
library work;
use work.conv_pkg.all;
entity complexphasedetectorswap_cordic_pe9_x2 is
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
end complexphasedetectorswap_cordic_pe9_x2;
architecture structural of complexphasedetectorswap_cordic_pe9_x2 is 
  signal clk_net : std_logic;
  signal inverter_op_net : std_logic_vector( 1-1 downto 0 );
  signal slice_y_net : std_logic_vector( 1-1 downto 0 );
  signal addsub_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal shift_op_net : std_logic_vector( 21-1 downto 0 );
  signal constant_op_net : std_logic_vector( 21-1 downto 0 );
  signal addsub1_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal addsub1_s_net : std_logic_vector( 21-1 downto 0 );
  signal addsub2_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal addsub_s_net : std_logic_vector( 21-1 downto 0 );
  signal addsub2_s_net : std_logic_vector( 21-1 downto 0 );
  signal ce_net : std_logic;
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
  addsub : entity work.sysgen_addsub_f5a65f010a 
  port map (
    clr => '0',
    a => addsub_s_net_x0,
    b => shift1_op_net,
    mode => inverter_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub_s_net
  );
  addsub1 : entity work.sysgen_addsub_f5a65f010a 
  port map (
    clr => '0',
    a => addsub1_s_net_x0,
    b => shift_op_net,
    mode => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub1_s_net
  );
  addsub2 : entity work.sysgen_addsub_f5a65f010a 
  port map (
    clr => '0',
    a => addsub2_s_net_x0,
    b => constant_op_net,
    mode => inverter_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub2_s_net
  );
  constant_x0 : entity work.sysgen_constant_a79438f85a 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  inverter : entity work.sysgen_inverter_962a38e1c8 
  port map (
    clr => '0',
    ip => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    op => inverter_op_net
  );
  shift : entity work.sysgen_shift_335bc9bc1e 
  port map (
    clr => '0',
    ip => addsub_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift_op_net
  );
  shift1 : entity work.sysgen_shift_335bc9bc1e 
  port map (
    clr => '0',
    ip => addsub1_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift1_op_net
  );
  slice : entity work.complexphasedetectorswap_xlslice 
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
-- Generated from Simulink block CORDIC Fine Angle PE
library IEEE;
use IEEE.std_logic_1164.all;
library work;
use work.conv_pkg.all;
entity complexphasedetectorswap_cordic_fine_angle_pe_x2 is
  port (
    x_x0 : in std_logic_vector( 21-1 downto 0 );
    y : in std_logic_vector( 21-1 downto 0 );
    z : in std_logic_vector( 21-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    x : out std_logic_vector( 21-1 downto 0 );
    y_x0 : out std_logic_vector( 21-1 downto 0 )
  );
end complexphasedetectorswap_cordic_fine_angle_pe_x2;
architecture structural of complexphasedetectorswap_cordic_fine_angle_pe_x2 is 
  signal addsub1_s_net_x6 : std_logic_vector( 21-1 downto 0 );
  signal addsub_s_net_x11 : std_logic_vector( 21-1 downto 0 );
  signal addsub1_s_net_x5 : std_logic_vector( 21-1 downto 0 );
  signal addsub1_s_net_x3 : std_logic_vector( 21-1 downto 0 );
  signal addsub2_s_net_x8 : std_logic_vector( 21-1 downto 0 );
  signal addsub_s_net_x7 : std_logic_vector( 21-1 downto 0 );
  signal addsub2_s_net_x6 : std_logic_vector( 21-1 downto 0 );
  signal addsub_s_net_x5 : std_logic_vector( 21-1 downto 0 );
  signal clk_net : std_logic;
  signal addsub1_s_net_x4 : std_logic_vector( 21-1 downto 0 );
  signal addsub2_s_net_x5 : std_logic_vector( 21-1 downto 0 );
  signal constant1_op_net : std_logic_vector( 21-1 downto 0 );
  signal addsub1_s_net_x9 : std_logic_vector( 21-1 downto 0 );
  signal addsub_s_net_x4 : std_logic_vector( 21-1 downto 0 );
  signal addsub1_s_net_x12 : std_logic_vector( 21-1 downto 0 );
  signal addsub2_s_net_x4 : std_logic_vector( 21-1 downto 0 );
  signal addsub_s_net_x2 : std_logic_vector( 21-1 downto 0 );
  signal addsub1_s_net_x2 : std_logic_vector( 21-1 downto 0 );
  signal addsub2_s_net_x2 : std_logic_vector( 21-1 downto 0 );
  signal addsub_s_net_x1 : std_logic_vector( 21-1 downto 0 );
  signal addsub_s_net_x6 : std_logic_vector( 21-1 downto 0 );
  signal addsub1_s_net_x1 : std_logic_vector( 21-1 downto 0 );
  signal addsub2_s_net_x1 : std_logic_vector( 21-1 downto 0 );
  signal addsub_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal mux_y_net : std_logic_vector( 21-1 downto 0 );
  signal addsub1_s_net_x11 : std_logic_vector( 21-1 downto 0 );
  signal addsub1_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal addsub_s_net_x3 : std_logic_vector( 21-1 downto 0 );
  signal addsub1_s_net_x10 : std_logic_vector( 21-1 downto 0 );
  signal addsub2_s_net_x11 : std_logic_vector( 21-1 downto 0 );
  signal addsub2_s_net_x12 : std_logic_vector( 21-1 downto 0 );
  signal addsub2_s_net_x9 : std_logic_vector( 21-1 downto 0 );
  signal addsub_s_net_x10 : std_logic_vector( 21-1 downto 0 );
  signal addsub1_s_net_x7 : std_logic_vector( 21-1 downto 0 );
  signal addsub2_s_net_x7 : std_logic_vector( 21-1 downto 0 );
  signal addsub_s_net_x8 : std_logic_vector( 21-1 downto 0 );
  signal addsub_s_net_x15 : std_logic_vector( 21-1 downto 0 );
  signal ce_net : std_logic;
  signal addsub2_s_net_x10 : std_logic_vector( 21-1 downto 0 );
  signal addsub_s_net_x9 : std_logic_vector( 21-1 downto 0 );
  signal constant_op_net : std_logic_vector( 21-1 downto 0 );
  signal addsub1_s_net_x8 : std_logic_vector( 21-1 downto 0 );
  signal addsub_s_net_x13 : std_logic_vector( 21-1 downto 0 );
  signal addsub1_s_net_x13 : std_logic_vector( 21-1 downto 0 );
  signal addsub_s_net_x14 : std_logic_vector( 21-1 downto 0 );
  signal addsub2_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal addsub_s_net_x12 : std_logic_vector( 21-1 downto 0 );
  signal addsub2_s_net_x14 : std_logic_vector( 21-1 downto 0 );
  signal addsub1_s_net : std_logic_vector( 21-1 downto 0 );
  signal addsub2_s_net_x13 : std_logic_vector( 21-1 downto 0 );
  signal addsub_s_net : std_logic_vector( 21-1 downto 0 );
  signal addsub2_s_net : std_logic_vector( 21-1 downto 0 );
  signal addsub2_s_net_x15 : std_logic_vector( 21-1 downto 0 );
  signal addsub1_s_net_x15 : std_logic_vector( 21-1 downto 0 );
  signal addsub1_s_net_x14 : std_logic_vector( 21-1 downto 0 );
begin
  x <= addsub_s_net_x3;
  y_x0 <= addsub1_s_net_x3;
  constant_op_net <= x_x0;
  constant1_op_net <= y;
  mux_y_net <= z;
  clk_net <= clk_1;
  ce_net <= ce_1;
  cordic_pe1 : entity work.complexphasedetectorswap_cordic_pe1_x3 
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
  cordic_pe10 : entity work.complexphasedetectorswap_cordic_pe10_x2 
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
  cordic_pe11 : entity work.complexphasedetectorswap_cordic_pe11_x1 
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
  cordic_pe12 : entity work.complexphasedetectorswap_cordic_pe12_x1 
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
  cordic_pe13 : entity work.complexphasedetectorswap_cordic_pe13_x1 
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
  cordic_pe14 : entity work.complexphasedetectorswap_cordic_pe14_x1 
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
  cordic_pe15 : entity work.complexphasedetectorswap_cordic_pe15_x1 
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
  cordic_pe16 : entity work.complexphasedetectorswap_cordic_pe16_x1 
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
  cordic_pe17 : entity work.complexphasedetectorswap_cordic_pe17_x1 
  port map (
    x => addsub_s_net_x4,
    y => addsub1_s_net_x12,
    z => addsub2_s_net_x4,
    clk_1 => clk_net,
    ce_1 => ce_net,
    x_x0 => addsub_s_net_x3,
    y_x0 => addsub1_s_net_x3
  );
  cordic_pe2 : entity work.complexphasedetectorswap_cordic_pe2_x3 
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
  cordic_pe3 : entity work.complexphasedetectorswap_cordic_pe3_x3 
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
  cordic_pe4 : entity work.complexphasedetectorswap_cordic_pe4_x3 
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
  cordic_pe5 : entity work.complexphasedetectorswap_cordic_pe5_x3 
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
  cordic_pe6 : entity work.complexphasedetectorswap_cordic_pe6_x3 
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
  cordic_pe7 : entity work.complexphasedetectorswap_cordic_pe7_x3 
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
  cordic_pe8 : entity work.complexphasedetectorswap_cordic_pe8_x3 
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
  cordic_pe9 : entity work.complexphasedetectorswap_cordic_pe9_x2 
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
-- Generated from Simulink block Quadrant Correct
library IEEE;
use IEEE.std_logic_1164.all;
library work;
use work.conv_pkg.all;
entity complexphasedetectorswap_quadrant_correct_x2 is
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
end complexphasedetectorswap_quadrant_correct_x2;
architecture structural of complexphasedetectorswap_quadrant_correct_x2 is 
  signal negate1_op_net : std_logic_vector( 21-1 downto 0 );
  signal mux1_y_net : std_logic_vector( 21-1 downto 0 );
  signal negate2_op_net : std_logic_vector( 21-1 downto 0 );
  signal clk_net : std_logic;
  signal mux3_y_net : std_logic_vector( 21-1 downto 0 );
  signal mux2_y_net : std_logic_vector( 21-1 downto 0 );
  signal delay1_q_net : std_logic_vector( 1-1 downto 0 );
  signal mux_y_net : std_logic_vector( 21-1 downto 0 );
  signal ce_net : std_logic;
  signal delay4_q_net : std_logic_vector( 1-1 downto 0 );
  signal addsub_s_net : std_logic_vector( 21-1 downto 0 );
  signal addsub1_s_net : std_logic_vector( 21-1 downto 0 );
begin
  cosine <= mux_y_net;
  sine <= mux1_y_net;
  addsub_s_net <= cos;
  addsub1_s_net <= sin;
  delay4_q_net <= angle_map;
  delay1_q_net <= sgn_z;
  clk_net <= clk_1;
  ce_net <= ce_1;
  mux : entity work.sysgen_mux_22fb22e069 
  port map (
    clr => '0',
    sel => delay4_q_net,
    d0 => addsub_s_net,
    d1 => mux3_y_net,
    clk => clk_net,
    ce => ce_net,
    y => mux_y_net
  );
  mux1 : entity work.sysgen_mux_22fb22e069 
  port map (
    clr => '0',
    sel => delay4_q_net,
    d0 => addsub1_s_net,
    d1 => mux2_y_net,
    clk => clk_net,
    ce => ce_net,
    y => mux1_y_net
  );
  mux2 : entity work.sysgen_mux_914113a591 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    sel => delay1_q_net,
    d0 => addsub_s_net,
    d1 => negate1_op_net,
    y => mux2_y_net
  );
  mux3 : entity work.sysgen_mux_914113a591 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    sel => delay1_q_net,
    d0 => negate2_op_net,
    d1 => addsub1_s_net,
    y => mux3_y_net
  );
  negate1 : entity work.sysgen_negate_83d9c4199c 
  port map (
    clr => '0',
    ip => addsub_s_net,
    clk => clk_net,
    ce => ce_net,
    op => negate1_op_net
  );
  negate2 : entity work.sysgen_negate_83d9c4199c 
  port map (
    clr => '0',
    ip => addsub1_s_net,
    clk => clk_net,
    ce => ce_net,
    op => negate2_op_net
  );
end structural;
-- Generated from Simulink block Quadrant Map
library IEEE;
use IEEE.std_logic_1164.all;
library work;
use work.conv_pkg.all;
entity complexphasedetectorswap_quadrant_map_x3 is
  port (
    z : in std_logic_vector( 21-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    z_x0 : out std_logic_vector( 21-1 downto 0 );
    angle_map : out std_logic_vector( 1-1 downto 0 );
    sgn_z_x0 : out std_logic_vector( 1-1 downto 0 )
  );
end complexphasedetectorswap_quadrant_map_x3;
architecture structural of complexphasedetectorswap_quadrant_map_x3 is 
  signal constant1_op_net : std_logic_vector( 21-1 downto 0 );
  signal relational1_op_net : std_logic_vector( 1-1 downto 0 );
  signal ce_net : std_logic;
  signal mux1_y_net : std_logic_vector( 21-1 downto 0 );
  signal sgn_z_y_net : std_logic_vector( 1-1 downto 0 );
  signal delay1_q_net : std_logic_vector( 21-1 downto 0 );
  signal inverter_op_net : std_logic_vector( 1-1 downto 0 );
  signal constant2_op_net : std_logic_vector( 21-1 downto 0 );
  signal clk_net : std_logic;
  signal mux_y_net : std_logic_vector( 21-1 downto 0 );
  signal addsub_s_net : std_logic_vector( 21-1 downto 0 );
  signal logical_y_net : std_logic_vector( 1-1 downto 0 );
  signal relational_op_net : std_logic_vector( 1-1 downto 0 );
begin
  z_x0 <= mux_y_net;
  angle_map <= logical_y_net;
  sgn_z_x0 <= sgn_z_y_net;
  mux1_y_net <= z;
  clk_net <= clk_1;
  ce_net <= ce_1;
  addsub : entity work.sysgen_addsub_f5a65f010a 
  port map (
    clr => '0',
    a => mux1_y_net,
    b => constant1_op_net,
    mode => inverter_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub_s_net
  );
  constant1 : entity work.sysgen_constant_59d2bc57d8 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant1_op_net
  );
  constant2 : entity work.sysgen_constant_7a5a5cef02 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant2_op_net
  );
  delay1 : entity work.complexphasedetectorswap_xldelay 
  generic map (
    latency => 1,
    reg_retiming => 0,
    reset => 0,
    width => 21
  )
  port map (
    en => '1',
    rst => '1',
    d => mux1_y_net,
    clk => clk_net,
    ce => ce_net,
    q => delay1_q_net
  );
  inverter : entity work.sysgen_inverter_962a38e1c8 
  port map (
    clr => '0',
    ip => sgn_z_y_net,
    clk => clk_net,
    ce => ce_net,
    op => inverter_op_net
  );
  logical : entity work.sysgen_logical_3ecd2b5ea1 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    d0 => relational_op_net,
    d1 => relational1_op_net,
    y => logical_y_net
  );
  mux : entity work.sysgen_mux_22fb22e069 
  port map (
    clr => '0',
    sel => logical_y_net,
    d0 => delay1_q_net,
    d1 => addsub_s_net,
    clk => clk_net,
    ce => ce_net,
    y => mux_y_net
  );
  relational : entity work.sysgen_relational_c7c11f7f79 
  port map (
    clr => '0',
    a => mux1_y_net,
    b => constant1_op_net,
    clk => clk_net,
    ce => ce_net,
    op => relational_op_net
  );
  relational1 : entity work.sysgen_relational_0495233e37 
  port map (
    clr => '0',
    a => mux1_y_net,
    b => constant2_op_net,
    clk => clk_net,
    ce => ce_net,
    op => relational1_op_net
  );
  sgn_z : entity work.complexphasedetectorswap_xlslice 
  generic map (
    new_lsb => 20,
    new_msb => 20,
    x_width => 21,
    y_width => 1
  )
  port map (
    x => mux1_y_net,
    y => sgn_z_y_net
  );
end structural;
-- Generated from Simulink block CORDIC SINCOS1
library IEEE;
use IEEE.std_logic_1164.all;
library work;
use work.conv_pkg.all;
entity complexphasedetectorswap_cordic_sincos1 is
  port (
    z : in std_logic_vector( 21-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    cos : out std_logic_vector( 18-1 downto 0 );
    sin : out std_logic_vector( 18-1 downto 0 )
  );
end complexphasedetectorswap_cordic_sincos1;
architecture structural of complexphasedetectorswap_cordic_sincos1 is 
  signal mux1_y_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal addsub1_s_net : std_logic_vector( 21-1 downto 0 );
  signal mux1_y_net : std_logic_vector( 21-1 downto 0 );
  signal delay4_q_net : std_logic_vector( 1-1 downto 0 );
  signal convert_dout_net : std_logic_vector( 18-1 downto 0 );
  signal convert1_dout_net : std_logic_vector( 18-1 downto 0 );
  signal addsub_s_net : std_logic_vector( 21-1 downto 0 );
  signal mux_y_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal delay1_q_net : std_logic_vector( 1-1 downto 0 );
  signal logical_y_net : std_logic_vector( 1-1 downto 0 );
  signal constant_op_net : std_logic_vector( 21-1 downto 0 );
  signal mux_y_net : std_logic_vector( 21-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal sgn_z_y_net : std_logic_vector( 1-1 downto 0 );
  signal constant1_op_net : std_logic_vector( 21-1 downto 0 );
begin
  cos <= convert_dout_net;
  sin <= convert1_dout_net;
  mux1_y_net <= z;
  clk_net <= clk_1;
  ce_net <= ce_1;
  cordic_fine_angle_pe : entity work.complexphasedetectorswap_cordic_fine_angle_pe_x2 
  port map (
    x_x0 => constant_op_net,
    y => constant1_op_net,
    z => mux_y_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    x => addsub_s_net,
    y_x0 => addsub1_s_net
  );
  quadrant_correct_x0 : entity work.complexphasedetectorswap_quadrant_correct_x2 
  port map (
    cos => addsub_s_net,
    sin => addsub1_s_net,
    angle_map => delay4_q_net,
    sgn_z => delay1_q_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    cosine => mux_y_net_x0,
    sine => mux1_y_net_x0
  );
  quadrant_map : entity work.complexphasedetectorswap_quadrant_map_x3 
  port map (
    z => mux1_y_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    z_x0 => mux_y_net,
    angle_map => logical_y_net,
    sgn_z_x0 => sgn_z_y_net
  );
  constant_x0 : entity work.sysgen_constant_7f0cff09da 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  constant1 : entity work.sysgen_constant_d8a454c0c9 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant1_op_net
  );
  convert : entity work.complexphasedetectorswap_xlconvert 
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
  convert1 : entity work.complexphasedetectorswap_xlconvert 
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
    din => mux1_y_net_x0,
    clk => clk_net,
    ce => ce_net,
    dout => convert1_dout_net
  );
  delay1 : entity work.complexphasedetectorswap_xldelay 
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
  delay4 : entity work.complexphasedetectorswap_xldelay 
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
-- Generated from Simulink block PhaseSlide
library IEEE;
use IEEE.std_logic_1164.all;
library work;
use work.conv_pkg.all;
entity complexphasedetectorswap_phaseslide is
  port (
    chsel : in std_logic_vector( 1-1 downto 0 );
    realmaster : in std_logic_vector( 18-1 downto 0 );
    imagmaster : in std_logic_vector( 18-1 downto 0 );
    phasein : in std_logic_vector( 21-1 downto 0 );
    imagslave : in std_logic_vector( 18-1 downto 0 );
    realslave : in std_logic_vector( 18-1 downto 0 );
    reset_n : in std_logic_vector( 1-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    realmasterout : out std_logic_vector( 18-1 downto 0 );
    imagmasterout : out std_logic_vector( 18-1 downto 0 );
    realslaveout : out std_logic_vector( 18-1 downto 0 );
    imagslaveout : out std_logic_vector( 18-1 downto 0 )
  );
end complexphasedetectorswap_phaseslide;
architecture structural of complexphasedetectorswap_phaseslide is 
  signal ce_net : std_logic;
  signal convert1_dout_net_x1 : std_logic_vector( 18-1 downto 0 );
  signal convert_dout_net_x2 : std_logic_vector( 18-1 downto 0 );
  signal convert_dout_net_x0 : std_logic_vector( 18-1 downto 0 );
  signal convert1_dout_net_x0 : std_logic_vector( 18-1 downto 0 );
  signal convert3_dout_net : std_logic_vector( 18-1 downto 0 );
  signal delay1_q_net : std_logic_vector( 18-1 downto 0 );
  signal mult_p_net : std_logic_vector( 21-1 downto 0 );
  signal mux1_y_net : std_logic_vector( 21-1 downto 0 );
  signal constant2_op_net : std_logic_vector( 16-1 downto 0 );
  signal clk_net : std_logic;
  signal mux_y_net : std_logic_vector( 21-1 downto 0 );
  signal convert_dout_net_x1 : std_logic_vector( 18-1 downto 0 );
  signal delay2_q_net : std_logic_vector( 18-1 downto 0 );
  signal convert1_dout_net_x2 : std_logic_vector( 18-1 downto 0 );
  signal convert1_dout_net : std_logic_vector( 18-1 downto 0 );
  signal convert_dout_net : std_logic_vector( 18-1 downto 0 );
  signal convert2_dout_net : std_logic_vector( 18-1 downto 0 );
  signal delay12_q_net : std_logic_vector( 1-1 downto 0 );
  signal inverter1_op_net : std_logic_vector( 1-1 downto 0 );
  signal int_offset_mixer_m_axis_dout_tvalid_net : std_logic;
  signal falledgedetect1_q_net : std_logic_vector( 18-1 downto 0 );
  signal constant1_op_net : std_logic_vector( 1-1 downto 0 );
  signal constant_op_net : std_logic_vector( 1-1 downto 0 );
  signal int_offset_mixer_m_axis_dout_tdata_imag_net : std_logic_vector( 20-1 downto 0 );
  signal constant3_op_net : std_logic_vector( 16-1 downto 0 );
  signal int_offset_mixer_m_axis_dout_tdata_real_net : std_logic_vector( 20-1 downto 0 );
  signal int_offset_mixer1_m_axis_dout_tdata_real_net : std_logic_vector( 20-1 downto 0 );
  signal falledgedetect2_q_net : std_logic_vector( 18-1 downto 0 );
  signal int_offset_mixer1_m_axis_dout_tdata_imag_net : std_logic_vector( 20-1 downto 0 );
  signal falledgedetect3_q_net : std_logic_vector( 18-1 downto 0 );
  signal falledgedetect4_q_net : std_logic_vector( 18-1 downto 0 );
  signal int_offset_mixer1_m_axis_dout_tvalid_net : std_logic;
begin
  realmasterout <= convert1_dout_net;
  imagmasterout <= convert_dout_net;
  realslaveout <= convert3_dout_net;
  imagslaveout <= convert2_dout_net;
  delay12_q_net <= chsel;
  delay1_q_net <= realmaster;
  delay2_q_net <= imagmaster;
  mult_p_net <= phasein;
  convert_dout_net_x2 <= imagslave;
  convert1_dout_net_x2 <= realslave;
  inverter1_op_net <= reset_n;
  clk_net <= clk_1;
  ce_net <= ce_1;
  cordic_sincos : entity work.complexphasedetectorswap_cordic_sincos_x0 
  port map (
    z => mux_y_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    cos => convert_dout_net_x1,
    sin => convert1_dout_net_x1
  );
  cordic_sincos1 : entity work.complexphasedetectorswap_cordic_sincos1 
  port map (
    z => mux1_y_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    cos => convert_dout_net_x0,
    sin => convert1_dout_net_x0
  );
  mux : entity work.sysgen_mux_ff5114eb44 
  port map (
    clr => '0',
    sel => delay12_q_net,
    d0 => mult_p_net,
    d1 => constant2_op_net,
    clk => clk_net,
    ce => ce_net,
    y => mux_y_net
  );
  constant2 : entity work.sysgen_constant_a4b3d3a393 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant2_op_net
  );
  constant3 : entity work.sysgen_constant_a4b3d3a393 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant3_op_net
  );
  mux1 : entity work.sysgen_mux_ff5114eb44 
  port map (
    clr => '0',
    sel => delay12_q_net,
    d0 => mult_p_net,
    d1 => constant3_op_net,
    clk => clk_net,
    ce => ce_net,
    y => mux1_y_net
  );
  constant_x0 : entity work.sysgen_constant_723bfc864e 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  convert : entity work.complexphasedetectorswap_xlconvert 
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
  convert1 : entity work.complexphasedetectorswap_xlconvert 
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
  int_offset_mixer : entity work.xlcomplex_multiplier_e194be61fffc64068211894be87f206b 
  port map (
    s_axis_a_tvalid => constant_op_net(0),
    s_axis_a_tdata_imag => falledgedetect1_q_net,
    s_axis_a_tdata_real => falledgedetect2_q_net,
    s_axis_b_tvalid => constant_op_net(0),
    s_axis_b_tdata_imag => convert1_dout_net_x1,
    s_axis_b_tdata_real => convert_dout_net_x1,
    rst => inverter1_op_net(0),
    clk => clk_net,
    ce => ce_net,
    m_axis_dout_tvalid => int_offset_mixer_m_axis_dout_tvalid_net,
    m_axis_dout_tdata_imag => int_offset_mixer_m_axis_dout_tdata_imag_net,
    m_axis_dout_tdata_real => int_offset_mixer_m_axis_dout_tdata_real_net
  );
  constant1 : entity work.sysgen_constant_723bfc864e 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant1_op_net
  );
  convert2 : entity work.complexphasedetectorswap_xlconvert 
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
    din => int_offset_mixer1_m_axis_dout_tdata_imag_net,
    clk => clk_net,
    ce => ce_net,
    dout => convert2_dout_net
  );
  convert3 : entity work.complexphasedetectorswap_xlconvert 
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
    din => int_offset_mixer1_m_axis_dout_tdata_real_net,
    clk => clk_net,
    ce => ce_net,
    dout => convert3_dout_net
  );
  int_offset_mixer1 : entity work.xlcomplex_multiplier_e194be61fffc64068211894be87f206b 
  port map (
    s_axis_a_tvalid => constant1_op_net(0),
    s_axis_a_tdata_imag => falledgedetect3_q_net,
    s_axis_a_tdata_real => falledgedetect4_q_net,
    s_axis_b_tvalid => constant1_op_net(0),
    s_axis_b_tdata_imag => convert1_dout_net_x0,
    s_axis_b_tdata_real => convert_dout_net_x0,
    rst => inverter1_op_net(0),
    clk => clk_net,
    ce => ce_net,
    m_axis_dout_tvalid => int_offset_mixer1_m_axis_dout_tvalid_net,
    m_axis_dout_tdata_imag => int_offset_mixer1_m_axis_dout_tdata_imag_net,
    m_axis_dout_tdata_real => int_offset_mixer1_m_axis_dout_tdata_real_net
  );
  falledgedetect1 : entity work.complexphasedetectorswap_xldelay 
  generic map (
    latency => 42,
    reg_retiming => 0,
    reset => 0,
    width => 18
  )
  port map (
    en => '1',
    rst => '1',
    d => delay2_q_net,
    clk => clk_net,
    ce => ce_net,
    q => falledgedetect1_q_net
  );
  falledgedetect2 : entity work.complexphasedetectorswap_xldelay 
  generic map (
    latency => 42,
    reg_retiming => 0,
    reset => 0,
    width => 18
  )
  port map (
    en => '1',
    rst => '1',
    d => delay1_q_net,
    clk => clk_net,
    ce => ce_net,
    q => falledgedetect2_q_net
  );
  falledgedetect3 : entity work.complexphasedetectorswap_xldelay 
  generic map (
    latency => 42,
    reg_retiming => 0,
    reset => 0,
    width => 18
  )
  port map (
    en => '1',
    rst => '1',
    d => convert_dout_net_x2,
    clk => clk_net,
    ce => ce_net,
    q => falledgedetect3_q_net
  );
  falledgedetect4 : entity work.complexphasedetectorswap_xldelay 
  generic map (
    latency => 42,
    reg_retiming => 0,
    reset => 0,
    width => 18
  )
  port map (
    en => '1',
    rst => '1',
    d => convert1_dout_net_x2,
    clk => clk_net,
    ce => ce_net,
    q => falledgedetect4_q_net
  );
end structural;
-- Generated from Simulink block ComplexPhaseDetectorSwap_struct
library IEEE;
use IEEE.std_logic_1164.all;
library work;
use work.conv_pkg.all;
entity complexphasedetectorswap_struct is
  port (
    enmasterswitching : in std_logic_vector( 1-1 downto 0 );
    ch0agc : in std_logic_vector( 13-1 downto 0 );
    ch0gtch1 : in std_logic_vector( 1-1 downto 0 );
    ch0imag : in std_logic_vector( 18-1 downto 0 );
    ch0real : in std_logic_vector( 18-1 downto 0 );
    ch1agc : in std_logic_vector( 13-1 downto 0 );
    ch1imag : in std_logic_vector( 18-1 downto 0 );
    ch1real : in std_logic_vector( 18-1 downto 0 );
    lag_coef : in std_logic_vector( 18-1 downto 0 );
    lead_coef : in std_logic_vector( 18-1 downto 0 );
    lockhysterisis : in std_logic_vector( 13-1 downto 0 );
    lockthreshold : in std_logic_vector( 13-1 downto 0 );
    overridech : in std_logic_vector( 1-1 downto 0 );
    reset : in std_logic_vector( 1-1 downto 0 );
    sweeplmt : in std_logic_vector( 15-1 downto 0 );
    swprate : in std_logic_vector( 18-1 downto 0 );
    db_range : in std_logic_vector( 16-1 downto 0 );
    db_ratio : in std_logic_vector( 16-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    agc0_gt_agc1 : out std_logic_vector( 1-1 downto 0 );
    gainoutmax : out std_logic_vector( 18-1 downto 0 );
    power : out std_logic_vector( 18-1 downto 0 );
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
    reallock : out std_logic_vector( 13-1 downto 0 );
    realout : out std_logic_vector( 18-1 downto 0 );
    realxord : out std_logic_vector( 1-1 downto 0 )
  );
end complexphasedetectorswap_struct;
architecture structural of complexphasedetectorswap_struct is 
  signal rom_data_net : std_logic_vector( 18-1 downto 0 );
  signal mux20_y_net : std_logic_vector( 14-1 downto 0 );
  signal mux12_y_net : std_logic_vector( 18-1 downto 0 );
  signal ch0gtch1_net : std_logic_vector( 1-1 downto 0 );
  signal enmasterswitching_net : std_logic_vector( 1-1 downto 0 );
  signal inverter6_op_net : std_logic_vector( 1-1 downto 0 );
  signal ch0agc_net : std_logic_vector( 13-1 downto 0 );
  signal ch0imag_net : std_logic_vector( 18-1 downto 0 );
  signal ch1real_net : std_logic_vector( 18-1 downto 0 );
  signal cordic_pipe_balance2_q_net : std_logic_vector( 18-1 downto 0 );
  signal ch1agc_net : std_logic_vector( 13-1 downto 0 );
  signal mux19_y_net : std_logic_vector( 18-1 downto 0 );
  signal ch0real_net : std_logic_vector( 18-1 downto 0 );
  signal ch1imag_net : std_logic_vector( 18-1 downto 0 );
  signal mux11_y_net_x0 : std_logic_vector( 18-1 downto 0 );
  signal mux1_y_net : std_logic_vector( 18-1 downto 0 );
  signal phase_detect_m_axis_dout_tdata_imag_net : std_logic_vector( 18-1 downto 0 );
  signal lockreal_s_net_x0 : std_logic_vector( 13-1 downto 0 );
  signal convert2_dout_net : std_logic_vector( 18-1 downto 0 );
  signal mult_p_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal swprate_net : std_logic_vector( 18-1 downto 0 );
  signal mux11_y_net : std_logic_vector( 18-1 downto 0 );
  signal db_ratio_net : std_logic_vector( 16-1 downto 0 );
  signal lag_coef_net : std_logic_vector( 18-1 downto 0 );
  signal addreals_s_net : std_logic_vector( 18-1 downto 0 );
  signal lead_coef_net : std_logic_vector( 18-1 downto 0 );
  signal lockreal_s_net : std_logic_vector( 13-1 downto 0 );
  signal addimags_s_net : std_logic_vector( 18-1 downto 0 );
  signal logical2_y_net : std_logic_vector( 1-1 downto 0 );
  signal sweeplmt_net : std_logic_vector( 15-1 downto 0 );
  signal clk_net : std_logic;
  signal inverter4_op_net : std_logic_vector( 1-1 downto 0 );
  signal reinterpret_output_port_net : std_logic_vector( 18-1 downto 0 );
  signal mux2_y_net : std_logic_vector( 18-1 downto 0 );
  signal convert1_dout_net : std_logic_vector( 18-1 downto 0 );
  signal convert_dout_net : std_logic_vector( 18-1 downto 0 );
  signal addsub2_s_net : std_logic_vector( 32-1 downto 0 );
  signal ce_net : std_logic;
  signal mux3_y_net : std_logic_vector( 18-1 downto 0 );
  signal delay_q_net : std_logic_vector( 1-1 downto 0 );
  signal inverter3_op_net : std_logic_vector( 1-1 downto 0 );
  signal mux_y_net_x0 : std_logic_vector( 18-1 downto 0 );
  signal convert_dout_net_x1 : std_logic_vector( 18-1 downto 0 );
  signal logical1_y_net : std_logic_vector( 1-1 downto 0 );
  signal overridech_net : std_logic_vector( 1-1 downto 0 );
  signal lockthreshold_net : std_logic_vector( 13-1 downto 0 );
  signal lockhysterisis_net : std_logic_vector( 13-1 downto 0 );
  signal convert3_dout_net : std_logic_vector( 18-1 downto 0 );
  signal negate1_op_net : std_logic_vector( 22-1 downto 0 );
  signal logical_y_net : std_logic_vector( 1-1 downto 0 );
  signal reset_net : std_logic_vector( 1-1 downto 0 );
  signal db_range_net : std_logic_vector( 16-1 downto 0 );
  signal neverzero_y_net : std_logic_vector( 18-1 downto 0 );
  signal mux8_y_net : std_logic_vector( 8-1 downto 0 );
  signal oneminusslave_s_net : std_logic_vector( 18-1 downto 0 );
  signal convert_dout_net_x0 : std_logic_vector( 18-1 downto 0 );
  signal convert1_dout_net_x0 : std_logic_vector( 18-1 downto 0 );
  signal phase_detect_m_axis_dout_tdata_real_net : std_logic_vector( 18-1 downto 0 );
  signal delay1_q_net : std_logic_vector( 18-1 downto 0 );
  signal mux7_y_net : std_logic_vector( 8-1 downto 0 );
  signal addsub_s_net : std_logic_vector( 22-1 downto 0 );
  signal delay12_q_net : std_logic_vector( 1-1 downto 0 );
  signal delay13_q_net : std_logic_vector( 18-1 downto 0 );
  signal delay2_q_net : std_logic_vector( 18-1 downto 0 );
  signal logical5_y_net : std_logic_vector( 1-1 downto 0 );
  signal logical3_y_net : std_logic_vector( 1-1 downto 0 );
  signal inverter5_op_net : std_logic_vector( 1-1 downto 0 );
  signal inverter1_op_net : std_logic_vector( 1-1 downto 0 );
  signal addsub1_s_net : std_logic_vector( 18-1 downto 0 );
  signal mult3_p_net : std_logic_vector( 18-1 downto 0 );
  signal mult2_p_net : std_logic_vector( 18-1 downto 0 );
  signal mult4_p_net : std_logic_vector( 18-1 downto 0 );
  signal mult_p_net : std_logic_vector( 22-1 downto 0 );
  signal db_offset_op_net : std_logic_vector( 18-1 downto 0 );
  signal conju_gate_op_net : std_logic_vector( 18-1 downto 0 );
  signal mult5_p_net : std_logic_vector( 18-1 downto 0 );
  signal allones_y_net : std_logic_vector( 1-1 downto 0 );
  signal mult6_p_net : std_logic_vector( 18-1 downto 0 );
  signal allzeros_y_net : std_logic_vector( 1-1 downto 0 );
  signal constant3_op_net : std_logic_vector( 18-1 downto 0 );
  signal constant9_op_net : std_logic_vector( 8-1 downto 0 );
  signal int_offset_mixer_m_axis_dout_tdata_imag_net : std_logic_vector( 20-1 downto 0 );
  signal constant6_op_net : std_logic_vector( 8-1 downto 0 );
  signal constant5_op_net : std_logic_vector( 8-1 downto 0 );
  signal delay8_q_net : std_logic_vector( 1-1 downto 0 );
  signal signdiff_y_net : std_logic_vector( 1-1 downto 0 );
  signal logical4_y_net : std_logic_vector( 1-1 downto 0 );
  signal diffdb_s_net : std_logic_vector( 14-1 downto 0 );
  signal int_offset_mixer_m_axis_dout_tdata_real_net : std_logic_vector( 20-1 downto 0 );
  signal constant4_op_net : std_logic_vector( 8-1 downto 0 );
  signal imag1msb_y_net : std_logic_vector( 1-1 downto 0 );
  signal one_op_net : std_logic;
  signal real2msb_y_net : std_logic_vector( 1-1 downto 0 );
  signal high1_op_net : std_logic_vector( 14-1 downto 0 );
  signal high_op_net : std_logic_vector( 14-1 downto 0 );
  signal inverter2_op_net : std_logic_vector( 1-1 downto 0 );
  signal imag2msb_y_net : std_logic_vector( 1-1 downto 0 );
  signal int_offset_mixer_m_axis_dout_tvalid_net : std_logic;
  signal lockreal1_s_net : std_logic_vector( 13-1 downto 0 );
  signal real1msb_y_net : std_logic_vector( 1-1 downto 0 );
  signal relational_op_net : std_logic_vector( 1-1 downto 0 );
  signal relational1_op_net : std_logic_vector( 1-1 downto 0 );
  signal mult1_p_net : std_logic_vector( 18-1 downto 0 );
  signal mux18_y_net : std_logic_vector( 14-1 downto 0 );
  signal slice_y_net : std_logic_vector( 14-1 downto 0 );
  signal phase_detect_m_axis_dout_tvalid_net : std_logic;
  signal delay11_q_net : std_logic_vector( 1-1 downto 0 );
  signal delay10_q_net : std_logic_vector( 1-1 downto 0 );
begin
  enmasterswitching_net <= enmasterswitching;
  agc0_gt_agc1 <= inverter6_op_net;
  ch0agc_net <= ch0agc;
  ch0gtch1_net <= ch0gtch1;
  ch0imag_net <= ch0imag;
  ch0real_net <= ch0real;
  ch1agc_net <= ch1agc;
  ch1imag_net <= ch1imag;
  ch1real_net <= ch1real;
  gainoutmax <= mux19_y_net;
  power <= cordic_pipe_balance2_q_net;
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
  maximagout <= convert_dout_net;
  maxrealout <= convert1_dout_net;
  minimagout <= convert2_dout_net;
  minrealout <= convert3_dout_net;
  nco_control_out <= negate1_op_net;
  overridech_net <= overridech;
  phase_detect <= mux11_y_net;
  reallock <= lockreal_s_net;
  realout <= addreals_s_net;
  realxord <= logical_y_net;
  reset_net <= reset;
  sweeplmt_net <= sweeplmt;
  swprate_net <= swprate;
  db_range_net <= db_range;
  db_ratio_net <= db_ratio;
  clk_net <= clk_1;
  ce_net <= ce_1;
  bipolar_nco : entity work.complexphasedetectorswap_bipolar_nco 
  port map (
    rst => reset_net,
    inc => negate1_op_net,
    conj => inverter4_op_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    sin => mux11_y_net_x0,
    cos => convert_dout_net_x1,
    phase => mult_p_net_x0
  );
  cordic_atan_x0 : entity work.complexphasedetectorswap_cordic_atan_x1 
  port map (
    x => addreals_s_net,
    y => addimags_s_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    x_x0 => cordic_pipe_balance2_q_net
  );
  chanswapper : entity work.complexphasedetectorswap_chanswapper 
  port map (
    ch1real => ch0real_net,
    ch1imag => ch0imag_net,
    ch2real => ch1real_net,
    ch2imag => ch1imag_net,
    ch1sel => inverter3_op_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    maxreal => reinterpret_output_port_net,
    maximag => mux2_y_net,
    minreal => mux1_y_net,
    minimag => mux3_y_net,
    ch1seldly => delay_q_net
  );
  cordic_atan : entity work.complexphasedetectorswap_cordic_atan 
  port map (
    imag => phase_detect_m_axis_dout_tdata_imag_net,
    real => phase_detect_m_axis_dout_tdata_real_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    phase => mux_y_net_x0
  );
  limitedaccum : entity work.complexphasedetectorswap_limitedaccum 
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
  lockimag : entity work.complexphasedetectorswap_lockimag 
  port map (
    in_x0 => mux7_y_net,
    sub => logical1_y_net,
    rst_n => inverter1_op_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    out_x0 => lockreal_s_net_x0
  );
  lockreal : entity work.complexphasedetectorswap_lockreal 
  port map (
    in_x0 => mux8_y_net,
    sub => logical_y_net,
    rst_n => inverter1_op_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    out_x0 => lockreal_s_net
  );
  negater2 : entity work.complexphasedetectorswap_negater2 
  port map (
    neg => delay12_q_net,
    in_x0 => mux_y_net_x0,
    clk_1 => clk_net,
    ce_1 => ce_net,
    out_x0 => mux11_y_net
  );
  phaseslide : entity work.complexphasedetectorswap_phaseslide 
  port map (
    chsel => delay12_q_net,
    realmaster => delay1_q_net,
    imagmaster => delay2_q_net,
    phasein => mult_p_net_x0,
    imagslave => convert_dout_net_x0,
    realslave => convert1_dout_net_x0,
    reset_n => inverter1_op_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    realmasterout => convert1_dout_net,
    imagmasterout => convert_dout_net,
    realslaveout => convert3_dout_net,
    imagslaveout => convert2_dout_net
  );
  inverter6 : entity work.sysgen_inverter_962a38e1c8 
  port map (
    clr => '0',
    ip => inverter5_op_net,
    clk => clk_net,
    ce => ce_net,
    op => inverter6_op_net
  );
  negate1 : entity work.sysgen_negate_351d58ac96 
  port map (
    clr => '0',
    ip => addsub_s_net,
    clk => clk_net,
    ce => ce_net,
    op => negate1_op_net
  );
  logical3 : entity work.sysgen_logical_d414a0f2aa 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    d0 => logical5_y_net,
    d1 => enmasterswitching_net,
    y => logical3_y_net
  );
  inverter4 : entity work.sysgen_inverter_962a38e1c8 
  port map (
    clr => '0',
    ip => delay_q_net,
    clk => clk_net,
    ce => ce_net,
    op => inverter4_op_net
  );
  mux12 : entity work.sysgen_mux_a5970e32a5 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    sel => inverter5_op_net,
    d0 => neverzero_y_net,
    d1 => oneminusslave_s_net,
    y => mux12_y_net
  );
  inverter5 : entity work.sysgen_inverter_8e86c7c8db 
  port map (
    clr => '0',
    ip => inverter3_op_net,
    clk => clk_net,
    ce => ce_net,
    op => inverter5_op_net
  );
  neverzero : entity work.sysgen_mux_a4c8dc7fef 
  port map (
    clr => '0',
    sel => logical5_y_net,
    d0 => addsub1_s_net,
    d1 => delay13_q_net,
    clk => clk_net,
    ce => ce_net,
    y => neverzero_y_net
  );
  mux19 : entity work.sysgen_mux_a5970e32a5 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    sel => inverter5_op_net,
    d0 => oneminusslave_s_net,
    d1 => neverzero_y_net,
    y => mux19_y_net
  );
  delay13 : entity work.complexphasedetectorswap_xldelay 
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
  addimags : entity work.complexphasedetectorswap_xladdsub 
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
    core_name0 => "complexphasedetectorswap_c_addsub_v12_0_i0",
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
  addreals : entity work.complexphasedetectorswap_xladdsub 
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
    core_name0 => "complexphasedetectorswap_c_addsub_v12_0_i0",
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
  addsub : entity work.complexphasedetectorswap_xladdsub 
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
    core_name0 => "complexphasedetectorswap_c_addsub_v12_0_i1",
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
  addsub1 : entity work.complexphasedetectorswap_xladdsub 
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
    core_name0 => "complexphasedetectorswap_c_addsub_v12_0_i0",
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
    a => mult6_p_net,
    b => db_offset_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub1_s_net
  );
  allones : entity work.sysgen_logical_8a57b6695b 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    d0 => addsub1_s_net,
    y => allones_y_net
  );
  allzeros : entity work.sysgen_logical_f9a3898eff 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    d0 => addsub1_s_net,
    y => allzeros_y_net
  );
  conju_gate : entity work.sysgen_negate_63685e0f69 
  port map (
    clr => '0',
    ip => convert_dout_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => conju_gate_op_net
  );
  constant3 : entity work.sysgen_constant_a4eda49ecc 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant3_op_net
  );
  constant4 : entity work.sysgen_constant_f58d4e8466 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant4_op_net
  );
  constant5 : entity work.sysgen_constant_0c49e03fe7 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant5_op_net
  );
  constant6 : entity work.sysgen_constant_f58d4e8466 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant6_op_net
  );
  constant9 : entity work.sysgen_constant_0c49e03fe7 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant9_op_net
  );
  convert : entity work.complexphasedetectorswap_xlconvert 
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
    dout => convert_dout_net_x0
  );
  convert1 : entity work.complexphasedetectorswap_xlconvert 
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
    dout => convert1_dout_net_x0
  );
  delay1 : entity work.complexphasedetectorswap_xldelay 
  generic map (
    latency => 4,
    reg_retiming => 0,
    reset => 0,
    width => 18
  )
  port map (
    en => '1',
    rst => '1',
    d => reinterpret_output_port_net,
    clk => clk_net,
    ce => ce_net,
    q => delay1_q_net
  );
  delay2 : entity work.complexphasedetectorswap_xldelay 
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
  delay8 : entity work.sysgen_delay_f82da96c76 
  port map (
    clr => '0',
    d => signdiff_y_net,
    rst => reset_net,
    en => logical4_y_net,
    clk => clk_net,
    ce => ce_net,
    q => delay8_q_net
  );
  diffdb : entity work.complexphasedetectorswap_xladdsub 
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
    core_name0 => "complexphasedetectorswap_c_addsub_v12_0_i2",
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
    a => ch0agc_net,
    b => ch1agc_net,
    clk => clk_net,
    ce => ce_net,
    s => diffdb_s_net
  );
  high : entity work.sysgen_constant_b110575db1 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => high_op_net
  );
  high1 : entity work.sysgen_constant_e49f817774 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => high1_op_net
  );
  imag1msb : entity work.complexphasedetectorswap_xlslice 
  generic map (
    new_lsb => 17,
    new_msb => 17,
    x_width => 18,
    y_width => 1
  )
  port map (
    x => convert_dout_net,
    y => imag1msb_y_net
  );
  imag2msb : entity work.complexphasedetectorswap_xlslice 
  generic map (
    new_lsb => 17,
    new_msb => 17,
    x_width => 18,
    y_width => 1
  )
  port map (
    x => convert2_dout_net,
    y => imag2msb_y_net
  );
  int_offset_mixer : entity work.xlcomplex_multiplier_e194be61fffc64068211894be87f206b 
  port map (
    s_axis_a_tvalid => one_op_net,
    s_axis_a_tdata_imag => mux3_y_net,
    s_axis_a_tdata_real => mux1_y_net,
    s_axis_b_tvalid => one_op_net,
    s_axis_b_tdata_imag => mux11_y_net_x0,
    s_axis_b_tdata_real => convert_dout_net_x1,
    rst => inverter1_op_net(0),
    clk => clk_net,
    ce => ce_net,
    m_axis_dout_tvalid => int_offset_mixer_m_axis_dout_tvalid_net,
    m_axis_dout_tdata_imag => int_offset_mixer_m_axis_dout_tdata_imag_net,
    m_axis_dout_tdata_real => int_offset_mixer_m_axis_dout_tdata_real_net
  );
  inverter1 : entity work.sysgen_inverter_962a38e1c8 
  port map (
    clr => '0',
    ip => reset_net,
    clk => clk_net,
    ce => ce_net,
    op => inverter1_op_net
  );
  inverter2 : entity work.sysgen_inverter_962a38e1c8 
  port map (
    clr => '0',
    ip => logical2_y_net,
    clk => clk_net,
    ce => ce_net,
    op => inverter2_op_net
  );
  inverter3 : entity work.sysgen_inverter_962a38e1c8 
  port map (
    clr => '0',
    ip => delay8_q_net,
    clk => clk_net,
    ce => ce_net,
    op => inverter3_op_net
  );
  lockreal1 : entity work.complexphasedetectorswap_xladdsubmode 
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
    core_name0 => "complexphasedetectorswap_c_addsub_v12_0_i3",
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
  logical : entity work.sysgen_logical_c70ddca08c 
  port map (
    clr => '0',
    d0 => real1msb_y_net,
    d1 => real2msb_y_net,
    clk => clk_net,
    ce => ce_net,
    y => logical_y_net
  );
  logical1 : entity work.sysgen_logical_c70ddca08c 
  port map (
    clr => '0',
    d0 => imag1msb_y_net,
    d1 => imag2msb_y_net,
    clk => clk_net,
    ce => ce_net,
    y => logical1_y_net
  );
  logical2 : entity work.sysgen_logical_8c2838cdae 
  port map (
    clr => '0',
    d0 => relational_op_net,
    d1 => relational1_op_net,
    clk => clk_net,
    ce => ce_net,
    y => logical2_y_net
  );
  logical4 : entity work.sysgen_logical_3ecd2b5ea1 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    d0 => inverter2_op_net,
    d1 => logical3_y_net,
    y => logical4_y_net
  );
  logical5 : entity work.sysgen_logical_3ecd2b5ea1 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    d0 => allones_y_net,
    d1 => allzeros_y_net,
    y => logical5_y_net
  );
  mult : entity work.complexphasedetectorswap_xlmult 
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
    core_name0 => "complexphasedetectorswap_mult_gen_v12_0_i0",
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
  mult1 : entity work.complexphasedetectorswap_xlmult 
  generic map (
    a_arith => xlUnsigned,
    a_bin_pt => 6,
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
    core_name0 => "complexphasedetectorswap_mult_gen_v12_0_i1",
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
    a => db_ratio_net,
    b => mux18_y_net,
    clk => clk_net,
    ce => ce_net,
    core_clk => clk_net,
    core_ce => ce_net,
    p => mult1_p_net
  );
  mult2 : entity work.complexphasedetectorswap_xlmult 
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
    core_name0 => "complexphasedetectorswap_mult_gen_v12_0_i2",
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
    b => mux19_y_net,
    clk => clk_net,
    ce => ce_net,
    core_clk => clk_net,
    core_ce => ce_net,
    p => mult2_p_net
  );
  mult3 : entity work.complexphasedetectorswap_xlmult 
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
    core_name0 => "complexphasedetectorswap_mult_gen_v12_0_i2",
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
    b => mux19_y_net,
    clk => clk_net,
    ce => ce_net,
    core_clk => clk_net,
    core_ce => ce_net,
    p => mult3_p_net
  );
  mult4 : entity work.complexphasedetectorswap_xlmult 
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
    core_name0 => "complexphasedetectorswap_mult_gen_v12_0_i2",
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
    a => convert3_dout_net,
    b => mux12_y_net,
    clk => clk_net,
    ce => ce_net,
    core_clk => clk_net,
    core_ce => ce_net,
    p => mult4_p_net
  );
  mult5 : entity work.complexphasedetectorswap_xlmult 
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
    core_name0 => "complexphasedetectorswap_mult_gen_v12_0_i2",
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
    a => convert2_dout_net,
    b => mux12_y_net,
    clk => clk_net,
    ce => ce_net,
    core_clk => clk_net,
    core_ce => ce_net,
    p => mult5_p_net
  );
  mult6 : entity work.complexphasedetectorswap_xlmult 
  generic map (
    a_arith => xlUnsigned,
    a_bin_pt => 10,
    a_width => 16,
    b_arith => xlSigned,
    b_bin_pt => 17,
    b_width => 18,
    c_a_type => 1,
    c_a_width => 16,
    c_b_type => 0,
    c_b_width => 18,
    c_baat => 16,
    c_output_width => 34,
    c_type => 0,
    core_name0 => "complexphasedetectorswap_mult_gen_v12_0_i3",
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
    b => rom_data_net,
    clk => clk_net,
    ce => ce_net,
    core_clk => clk_net,
    core_ce => ce_net,
    p => mult6_p_net
  );
  mux18 : entity work.sysgen_mux_69e68934b8 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    sel => overridech_net,
    d0 => diffdb_s_net,
    d1 => mux20_y_net,
    y => mux18_y_net
  );
  mux20 : entity work.sysgen_mux_69e68934b8 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    sel => ch0gtch1_net,
    d0 => high_op_net,
    d1 => high1_op_net,
    y => mux20_y_net
  );
  mux7 : entity work.sysgen_mux_4be3d95491 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    sel => logical1_y_net,
    d0 => constant4_op_net,
    d1 => constant5_op_net,
    y => mux7_y_net
  );
  mux8 : entity work.sysgen_mux_4be3d95491 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    sel => logical_y_net,
    d0 => constant6_op_net,
    d1 => constant9_op_net,
    y => mux8_y_net
  );
  one : entity work.sysgen_constant_723bfc864e 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op(0) => one_op_net
  );
  oneminusslave : entity work.complexphasedetectorswap_xladdsub 
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
    core_name0 => "complexphasedetectorswap_c_addsub_v12_0_i4",
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
  phase_detect_x0 : entity work.xlcomplex_multiplier_de7c00e16dd5027ed2442fd580865040 
  port map (
    s_axis_a_tvalid => int_offset_mixer_m_axis_dout_tvalid_net,
    s_axis_a_tdata_imag => delay2_q_net,
    s_axis_a_tdata_real => delay1_q_net,
    s_axis_b_tvalid => int_offset_mixer_m_axis_dout_tvalid_net,
    s_axis_b_tdata_imag => conju_gate_op_net,
    s_axis_b_tdata_real => convert1_dout_net_x0,
    rst => inverter1_op_net(0),
    clk => clk_net,
    ce => ce_net,
    m_axis_dout_tvalid => phase_detect_m_axis_dout_tvalid_net,
    m_axis_dout_tdata_imag => phase_detect_m_axis_dout_tdata_imag_net,
    m_axis_dout_tdata_real => phase_detect_m_axis_dout_tdata_real_net
  );
  rom : entity work.complexphasedetectorswap_xlsprom 
  generic map (
    c_address_width => 14,
    c_width => 18,
    core_name0 => "complexphasedetectorswap_blk_mem_gen_v8_3_i0",
    latency => 1
  )
  port map (
    en => "1",
    rst => "0",
    addr => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    data => rom_data_net
  );
  real1msb : entity work.complexphasedetectorswap_xlslice 
  generic map (
    new_lsb => 17,
    new_msb => 17,
    x_width => 18,
    y_width => 1
  )
  port map (
    x => convert1_dout_net,
    y => real1msb_y_net
  );
  real2msb : entity work.complexphasedetectorswap_xlslice 
  generic map (
    new_lsb => 17,
    new_msb => 17,
    x_width => 18,
    y_width => 1
  )
  port map (
    x => convert3_dout_net,
    y => real2msb_y_net
  );
  relational : entity work.sysgen_relational_69184445bc 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    a => lockreal_s_net,
    b => lockreal1_s_net,
    op => relational_op_net
  );
  relational1 : entity work.sysgen_relational_69184445bc 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    a => lockreal_s_net_x0,
    b => lockreal1_s_net,
    op => relational1_op_net
  );
  signdiff : entity work.complexphasedetectorswap_xlslice 
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
  slice : entity work.complexphasedetectorswap_xlslice 
  generic map (
    new_lsb => 4,
    new_msb => 17,
    x_width => 18,
    y_width => 14
  )
  port map (
    x => mult1_p_net,
    y => slice_y_net
  );
  db_offset : entity work.sysgen_constant_78cc327d19 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => db_offset_op_net
  );
  delay10 : entity work.complexphasedetectorswap_xldelay 
  generic map (
    latency => 3,
    reg_retiming => 0,
    reset => 0,
    width => 1
  )
  port map (
    en => '1',
    rst => '1',
    d => delay11_q_net,
    clk => clk_net,
    ce => ce_net,
    q => delay10_q_net
  );
  delay11 : entity work.complexphasedetectorswap_xldelay 
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
  delay12 : entity work.complexphasedetectorswap_xldelay 
  generic map (
    latency => 17,
    reg_retiming => 0,
    reset => 0,
    width => 1
  )
  port map (
    en => '1',
    rst => '1',
    d => delay10_q_net,
    clk => clk_net,
    ce => ce_net,
    q => delay12_q_net
  );
end structural;
-- Generated from Simulink block 
library IEEE;
use IEEE.std_logic_1164.all;
library work;
use work.conv_pkg.all;
entity complexphasedetectorswap_default_clock_driver is
  port (
    complexphasedetectorswap_sysclk : in std_logic;
    complexphasedetectorswap_sysce : in std_logic;
    complexphasedetectorswap_sysclr : in std_logic;
    complexphasedetectorswap_clk1 : out std_logic;
    complexphasedetectorswap_ce1 : out std_logic
  );
end complexphasedetectorswap_default_clock_driver;
architecture structural of complexphasedetectorswap_default_clock_driver is 
begin
  clockdriver : entity work.xlclockdriver 
  generic map (
    period => 1,
    log_2_period => 1
  )
  port map (
    sysclk => complexphasedetectorswap_sysclk,
    sysce => complexphasedetectorswap_sysce,
    sysclr => complexphasedetectorswap_sysclr,
    clk => complexphasedetectorswap_clk1,
    ce => complexphasedetectorswap_ce1
  );
end structural;
-- Generated from Simulink block 
library IEEE;
use IEEE.std_logic_1164.all;
library work;
use work.conv_pkg.all;
entity complexphasedetectorswap is
  port (
    enmasterswitching : in std_logic;
    ch0agc : in std_logic_vector( 13-1 downto 0 );
    ch0gtch1 : in std_logic;
    ch0imag : in std_logic_vector( 18-1 downto 0 );
    ch0real : in std_logic_vector( 18-1 downto 0 );
    ch1agc : in std_logic_vector( 13-1 downto 0 );
    ch1imag : in std_logic_vector( 18-1 downto 0 );
    ch1real : in std_logic_vector( 18-1 downto 0 );
    lag_coef : in std_logic_vector( 18-1 downto 0 );
    lead_coef : in std_logic_vector( 18-1 downto 0 );
    lockhysterisis : in std_logic_vector( 13-1 downto 0 );
    lockthreshold : in std_logic_vector( 13-1 downto 0 );
    overridech : in std_logic;
    reset : in std_logic;
    sweeplmt : in std_logic_vector( 15-1 downto 0 );
    swprate : in std_logic_vector( 18-1 downto 0 );
    db_range : in std_logic_vector( 16-1 downto 0 );
    db_ratio : in std_logic_vector( 16-1 downto 0 );
    clk : in std_logic;
    agc0_gt_agc1 : out std_logic;
    gainoutmax : out std_logic_vector( 18-1 downto 0 );
    power : out std_logic_vector( 18-1 downto 0 );
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
    reallock : out std_logic_vector( 13-1 downto 0 );
    realout : out std_logic_vector( 18-1 downto 0 );
    realxord : out std_logic
  );
end complexphasedetectorswap;
architecture structural of complexphasedetectorswap is 
  attribute core_generation_info : string;
  attribute core_generation_info of structural : architecture is "complexphasedetectorswap,sysgen_core_2016_4,{,compilation=IP Catalog,block_icon_display=Default,family=kintex7,part=xc7k325t,speed=-2,package=fbg676,synthesis_language=vhdl,hdl_library=work,synthesis_strategy=Vivado Synthesis Defaults,implementation_strategy=Vivado Implementation Defaults,testbench=0,interface_doc=1,ce_clr=0,clock_period=21.4286,system_simulink_period=2.14286e-008,waveform_viewer=0,axilite_interface=0,ip_catalog_plugin=0,hwcosim_burst_mode=0,simulation_time=0.05,accum=1,addsub=223,assert=1,cmpy_v6_0=4,concat=1,constant=106,convert=14,delay=32,inv=79,logical=14,mult=9,mux=44,negate=14,reinterpret=2,relational=11,shift=138,slice=86,sprom=1,}";
  signal clk_1_net : std_logic;
  signal ce_1_net : std_logic;
begin
  complexphasedetectorswap_default_clock_driver : entity work.complexphasedetectorswap_default_clock_driver 
  port map (
    complexphasedetectorswap_sysclk => clk,
    complexphasedetectorswap_sysce => '1',
    complexphasedetectorswap_sysclr => '0',
    complexphasedetectorswap_clk1 => clk_1_net,
    complexphasedetectorswap_ce1 => ce_1_net
  );
  complexphasedetectorswap_struct : entity work.complexphasedetectorswap_struct 
  port map (
    enmasterswitching(0) => enmasterswitching,
    ch0agc => ch0agc,
    ch0gtch1(0) => ch0gtch1,
    ch0imag => ch0imag,
    ch0real => ch0real,
    ch1agc => ch1agc,
    ch1imag => ch1imag,
    ch1real => ch1real,
    lag_coef => lag_coef,
    lead_coef => lead_coef,
    lockhysterisis => lockhysterisis,
    lockthreshold => lockthreshold,
    overridech(0) => overridech,
    reset(0) => reset,
    sweeplmt => sweeplmt,
    swprate => swprate,
    db_range => db_range,
    db_ratio => db_ratio,
    clk_1 => clk_1_net,
    ce_1 => ce_1_net,
    agc0_gt_agc1(0) => agc0_gt_agc1,
    gainoutmax => gainoutmax,
    power => power,
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
    reallock => reallock,
    realout => realout,
    realxord(0) => realxord
  );
end structural;
