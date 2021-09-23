-- Generated from Simulink block ComplexPhaseDetector/AM_Detectors/Ch1Power
library IEEE;
use IEEE.std_logic_1164.all;
library work;
use work.conv_pkg.all;
entity complexphasedetector_ch1power is
  port (
    real : in std_logic_vector( 18-1 downto 0 );
    imag : in std_logic_vector( 18-1 downto 0 );
    reset : in std_logic_vector( 1-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    power : out std_logic_vector( 18-1 downto 0 )
  );
end complexphasedetector_ch1power;
architecture structural of complexphasedetector_ch1power is 
  signal ce_net : std_logic;
  signal reinterpret_output_port_net : std_logic_vector( 18-1 downto 0 );
  signal ch1imag_net : std_logic_vector( 18-1 downto 0 );
  signal am_disable_net : std_logic_vector( 1-1 downto 0 );
  signal ch1real_net : std_logic_vector( 18-1 downto 0 );
  signal clk_net : std_logic;
  signal absolute1_op_net : std_logic_vector( 19-1 downto 0 );
  signal addsub_s_net : std_logic_vector( 20-1 downto 0 );
  signal accumulator_q_net : std_logic_vector( 19-1 downto 0 );
  signal slice_y_net : std_logic_vector( 18-1 downto 0 );
  signal absolute_op_net : std_logic_vector( 19-1 downto 0 );
  signal shift1_op_net : std_logic_vector( 20-1 downto 0 );
  signal shift2_op_net : std_logic_vector( 19-1 downto 0 );
  signal addsub1_s_net : std_logic_vector( 22-1 downto 0 );
begin
  power <= reinterpret_output_port_net;
  ch1real_net <= real;
  ch1imag_net <= imag;
  am_disable_net <= reset;
  clk_net <= clk_1;
  ce_net <= ce_1;
  absolute : entity work.sysgen_abs_04e025f4ee 
  port map (
    clr => '0',
    a => ch1real_net,
    clk => clk_net,
    ce => ce_net,
    op => absolute_op_net
  );
  absolute1 : entity work.sysgen_abs_04e025f4ee 
  port map (
    clr => '0',
    a => ch1imag_net,
    clk => clk_net,
    ce => ce_net,
    op => absolute1_op_net
  );
  accumulator : entity work.sysgen_accum_23abaf2c69 
  port map (
    clr => '0',
    b => addsub1_s_net,
    rst => am_disable_net,
    clk => clk_net,
    ce => ce_net,
    q => accumulator_q_net
  );
  addsub : entity work.complexphasedetector_xladdsub 
  generic map (
    a_arith => xlUnsigned,
    a_bin_pt => 17,
    a_width => 19,
    b_arith => xlUnsigned,
    b_bin_pt => 17,
    b_width => 19,
    c_has_c_out => 0,
    c_latency => 1,
    c_output_width => 20,
    core_name0 => "complexphasedetector_c_addsub_v12_0_i6",
    extra_registers => 0,
    full_s_arith => 1,
    full_s_width => 20,
    latency => 1,
    overflow => 1,
    quantization => 1,
    s_arith => xlUnsigned,
    s_bin_pt => 17,
    s_width => 20
  )
  port map (
    clr => '0',
    en => "1",
    a => absolute_op_net,
    b => absolute1_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub_s_net
  );
  addsub1 : entity work.complexphasedetector_xladdsub 
  generic map (
    a_arith => xlUnsigned,
    a_bin_pt => 17,
    a_width => 20,
    b_arith => xlSigned,
    b_bin_pt => 17,
    b_width => 19,
    c_has_c_out => 0,
    c_latency => 1,
    c_output_width => 22,
    core_name0 => "complexphasedetector_c_addsub_v12_0_i7",
    extra_registers => 0,
    full_s_arith => 2,
    full_s_width => 22,
    latency => 1,
    overflow => 3,
    quantization => 1,
    s_arith => xlSigned,
    s_bin_pt => 17,
    s_width => 22
  )
  port map (
    clr => '0',
    en => "1",
    a => shift1_op_net,
    b => shift2_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub1_s_net
  );
  reinterpret : entity work.sysgen_reinterpret_afd23217a5 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => slice_y_net,
    output_port => reinterpret_output_port_net
  );
  shift1 : entity work.sysgen_shift_4ba23e692a 
  port map (
    clr => '0',
    ip => addsub_s_net,
    clk => clk_net,
    ce => ce_net,
    op => shift1_op_net
  );
  shift2 : entity work.sysgen_shift_c059b38bf8 
  port map (
    clr => '0',
    ip => accumulator_q_net,
    clk => clk_net,
    ce => ce_net,
    op => shift2_op_net
  );
  slice : entity work.complexphasedetector_xlslice 
  generic map (
    new_lsb => 0,
    new_msb => 17,
    x_width => 19,
    y_width => 18
  )
  port map (
    x => accumulator_q_net,
    y => slice_y_net
  );
end structural;
-- Generated from Simulink block ComplexPhaseDetector/AM_Detectors/Ch2Power
library IEEE;
use IEEE.std_logic_1164.all;
library work;
use work.conv_pkg.all;
entity complexphasedetector_ch2power is
  port (
    real : in std_logic_vector( 18-1 downto 0 );
    imag : in std_logic_vector( 18-1 downto 0 );
    reset : in std_logic_vector( 1-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    power : out std_logic_vector( 18-1 downto 0 )
  );
end complexphasedetector_ch2power;
architecture structural of complexphasedetector_ch2power is 
  signal clk_net : std_logic;
  signal reinterpret_output_port_net : std_logic_vector( 18-1 downto 0 );
  signal ch2real_net : std_logic_vector( 18-1 downto 0 );
  signal ch2imag_net : std_logic_vector( 18-1 downto 0 );
  signal am_disable_net : std_logic_vector( 1-1 downto 0 );
  signal absolute_op_net : std_logic_vector( 19-1 downto 0 );
  signal addsub1_s_net : std_logic_vector( 22-1 downto 0 );
  signal addsub_s_net : std_logic_vector( 20-1 downto 0 );
  signal accumulator_q_net : std_logic_vector( 19-1 downto 0 );
  signal shift2_op_net : std_logic_vector( 19-1 downto 0 );
  signal ce_net : std_logic;
  signal slice_y_net : std_logic_vector( 18-1 downto 0 );
  signal absolute1_op_net : std_logic_vector( 19-1 downto 0 );
  signal shift1_op_net : std_logic_vector( 20-1 downto 0 );
begin
  power <= reinterpret_output_port_net;
  ch2real_net <= real;
  ch2imag_net <= imag;
  am_disable_net <= reset;
  clk_net <= clk_1;
  ce_net <= ce_1;
  absolute : entity work.sysgen_abs_04e025f4ee 
  port map (
    clr => '0',
    a => ch2real_net,
    clk => clk_net,
    ce => ce_net,
    op => absolute_op_net
  );
  absolute1 : entity work.sysgen_abs_04e025f4ee 
  port map (
    clr => '0',
    a => ch2imag_net,
    clk => clk_net,
    ce => ce_net,
    op => absolute1_op_net
  );
  accumulator : entity work.sysgen_accum_23abaf2c69 
  port map (
    clr => '0',
    b => addsub1_s_net,
    rst => am_disable_net,
    clk => clk_net,
    ce => ce_net,
    q => accumulator_q_net
  );
  addsub : entity work.complexphasedetector_xladdsub 
  generic map (
    a_arith => xlUnsigned,
    a_bin_pt => 17,
    a_width => 19,
    b_arith => xlUnsigned,
    b_bin_pt => 17,
    b_width => 19,
    c_has_c_out => 0,
    c_latency => 1,
    c_output_width => 20,
    core_name0 => "complexphasedetector_c_addsub_v12_0_i6",
    extra_registers => 0,
    full_s_arith => 1,
    full_s_width => 20,
    latency => 1,
    overflow => 1,
    quantization => 1,
    s_arith => xlUnsigned,
    s_bin_pt => 17,
    s_width => 20
  )
  port map (
    clr => '0',
    en => "1",
    a => absolute_op_net,
    b => absolute1_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub_s_net
  );
  addsub1 : entity work.complexphasedetector_xladdsub 
  generic map (
    a_arith => xlUnsigned,
    a_bin_pt => 17,
    a_width => 20,
    b_arith => xlSigned,
    b_bin_pt => 17,
    b_width => 19,
    c_has_c_out => 0,
    c_latency => 1,
    c_output_width => 22,
    core_name0 => "complexphasedetector_c_addsub_v12_0_i7",
    extra_registers => 0,
    full_s_arith => 2,
    full_s_width => 22,
    latency => 1,
    overflow => 3,
    quantization => 1,
    s_arith => xlSigned,
    s_bin_pt => 17,
    s_width => 22
  )
  port map (
    clr => '0',
    en => "1",
    a => shift1_op_net,
    b => shift2_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub1_s_net
  );
  reinterpret : entity work.sysgen_reinterpret_afd23217a5 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => slice_y_net,
    output_port => reinterpret_output_port_net
  );
  shift1 : entity work.sysgen_shift_4ba23e692a 
  port map (
    clr => '0',
    ip => addsub_s_net,
    clk => clk_net,
    ce => ce_net,
    op => shift1_op_net
  );
  shift2 : entity work.sysgen_shift_c059b38bf8 
  port map (
    clr => '0',
    ip => accumulator_q_net,
    clk => clk_net,
    ce => ce_net,
    op => shift2_op_net
  );
  slice : entity work.complexphasedetector_xlslice 
  generic map (
    new_lsb => 0,
    new_msb => 17,
    x_width => 19,
    y_width => 18
  )
  port map (
    x => accumulator_q_net,
    y => slice_y_net
  );
end structural;
-- Generated from Simulink block ComplexPhaseDetector/AM_Detectors/Normalize/Normalize1
library IEEE;
use IEEE.std_logic_1164.all;
library work;
use work.conv_pkg.all;
entity complexphasedetector_normalize1 is
  port (
    in1 : in std_logic_vector( 18-1 downto 0 );
    in2 : in std_logic_vector( 18-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    out1 : out std_logic_vector( 18-1 downto 0 );
    out2 : out std_logic_vector( 18-1 downto 0 )
  );
end complexphasedetector_normalize1;
architecture structural of complexphasedetector_normalize1 is 
  signal mux4_y_net : std_logic_vector( 18-1 downto 0 );
  signal mux5_y_net : std_logic_vector( 18-1 downto 0 );
  signal mux4_y_net_x0 : std_logic_vector( 18-1 downto 0 );
  signal ce_net : std_logic;
  signal slice1_y_net : std_logic_vector( 1-1 downto 0 );
  signal logical_y_net : std_logic_vector( 1-1 downto 0 );
  signal slice_y_net : std_logic_vector( 1-1 downto 0 );
  signal clk_net : std_logic;
  signal shift_op_net : std_logic_vector( 18-1 downto 0 );
  signal shift1_op_net : std_logic_vector( 18-1 downto 0 );
  signal mux5_y_net_x0 : std_logic_vector( 18-1 downto 0 );
begin
  out1 <= mux4_y_net;
  out2 <= mux5_y_net;
  mux4_y_net_x0 <= in1;
  mux5_y_net_x0 <= in2;
  clk_net <= clk_1;
  ce_net <= ce_1;
  logical : entity work.sysgen_logical_6dfbed4b78 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    d0 => slice_y_net,
    d1 => slice1_y_net,
    y => logical_y_net
  );
  mux4 : entity work.sysgen_mux_5aae7736b5 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    sel => logical_y_net,
    d0 => shift_op_net,
    d1 => mux4_y_net_x0,
    y => mux4_y_net
  );
  mux5 : entity work.sysgen_mux_5aae7736b5 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    sel => logical_y_net,
    d0 => shift1_op_net,
    d1 => mux5_y_net_x0,
    y => mux5_y_net
  );
  shift : entity work.sysgen_shift_66a1e88fd3 
  port map (
    clr => '0',
    ip => mux4_y_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift_op_net
  );
  shift1 : entity work.sysgen_shift_66a1e88fd3 
  port map (
    clr => '0',
    ip => mux5_y_net_x0,
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
    x => mux4_y_net_x0,
    y => slice_y_net
  );
  slice1 : entity work.complexphasedetector_xlslice 
  generic map (
    new_lsb => 17,
    new_msb => 17,
    x_width => 18,
    y_width => 1
  )
  port map (
    x => mux5_y_net_x0,
    y => slice1_y_net
  );
end structural;
-- Generated from Simulink block ComplexPhaseDetector/AM_Detectors/Normalize/Normalize2
library IEEE;
use IEEE.std_logic_1164.all;
library work;
use work.conv_pkg.all;
entity complexphasedetector_normalize2 is
  port (
    in1 : in std_logic_vector( 18-1 downto 0 );
    in2 : in std_logic_vector( 18-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    out1 : out std_logic_vector( 18-1 downto 0 );
    out2 : out std_logic_vector( 18-1 downto 0 )
  );
end complexphasedetector_normalize2;
architecture structural of complexphasedetector_normalize2 is 
  signal ce_net : std_logic;
  signal mux5_y_net : std_logic_vector( 18-1 downto 0 );
  signal clk_net : std_logic;
  signal mux4_y_net : std_logic_vector( 18-1 downto 0 );
  signal mux4_y_net_x0 : std_logic_vector( 18-1 downto 0 );
  signal mux5_y_net_x0 : std_logic_vector( 18-1 downto 0 );
  signal slice1_y_net : std_logic_vector( 1-1 downto 0 );
  signal slice_y_net : std_logic_vector( 1-1 downto 0 );
  signal logical_y_net : std_logic_vector( 1-1 downto 0 );
  signal shift1_op_net : std_logic_vector( 18-1 downto 0 );
  signal shift_op_net : std_logic_vector( 18-1 downto 0 );
begin
  out1 <= mux4_y_net;
  out2 <= mux5_y_net;
  mux4_y_net_x0 <= in1;
  mux5_y_net_x0 <= in2;
  clk_net <= clk_1;
  ce_net <= ce_1;
  logical : entity work.sysgen_logical_6dfbed4b78 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    d0 => slice_y_net,
    d1 => slice1_y_net,
    y => logical_y_net
  );
  mux4 : entity work.sysgen_mux_5aae7736b5 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    sel => logical_y_net,
    d0 => shift_op_net,
    d1 => mux4_y_net_x0,
    y => mux4_y_net
  );
  mux5 : entity work.sysgen_mux_5aae7736b5 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    sel => logical_y_net,
    d0 => shift1_op_net,
    d1 => mux5_y_net_x0,
    y => mux5_y_net
  );
  shift : entity work.sysgen_shift_66a1e88fd3 
  port map (
    clr => '0',
    ip => mux4_y_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift_op_net
  );
  shift1 : entity work.sysgen_shift_66a1e88fd3 
  port map (
    clr => '0',
    ip => mux5_y_net_x0,
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
    x => mux4_y_net_x0,
    y => slice_y_net
  );
  slice1 : entity work.complexphasedetector_xlslice 
  generic map (
    new_lsb => 17,
    new_msb => 17,
    x_width => 18,
    y_width => 1
  )
  port map (
    x => mux5_y_net_x0,
    y => slice1_y_net
  );
end structural;
-- Generated from Simulink block ComplexPhaseDetector/AM_Detectors/Normalize
library IEEE;
use IEEE.std_logic_1164.all;
library work;
use work.conv_pkg.all;
entity complexphasedetector_normalize is
  port (
    power1 : in std_logic_vector( 18-1 downto 0 );
    power2 : in std_logic_vector( 18-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    out1 : out std_logic_vector( 7-1 downto 0 );
    out2 : out std_logic_vector( 7-1 downto 0 )
  );
end complexphasedetector_normalize;
architecture structural of complexphasedetector_normalize is 
  signal mux4_y_net : std_logic_vector( 18-1 downto 0 );
  signal mux5_y_net : std_logic_vector( 18-1 downto 0 );
  signal slice_y_net : std_logic_vector( 7-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal slice1_y_net : std_logic_vector( 7-1 downto 0 );
  signal mux4_y_net_x1 : std_logic_vector( 18-1 downto 0 );
  signal mux4_y_net_x0 : std_logic_vector( 18-1 downto 0 );
  signal mux5_y_net_x0 : std_logic_vector( 18-1 downto 0 );
  signal mux5_y_net_x1 : std_logic_vector( 18-1 downto 0 );
begin
  out1 <= slice_y_net;
  out2 <= slice1_y_net;
  mux4_y_net_x1 <= power1;
  mux5_y_net_x1 <= power2;
  clk_net <= clk_1;
  ce_net <= ce_1;
  normalize1 : entity work.complexphasedetector_normalize1 
  port map (
    in1 => mux4_y_net_x1,
    in2 => mux5_y_net_x1,
    clk_1 => clk_net,
    ce_1 => ce_net,
    out1 => mux4_y_net_x0,
    out2 => mux5_y_net_x0
  );
  normalize2 : entity work.complexphasedetector_normalize2 
  port map (
    in1 => mux4_y_net_x0,
    in2 => mux5_y_net_x0,
    clk_1 => clk_net,
    ce_1 => ce_net,
    out1 => mux4_y_net,
    out2 => mux5_y_net
  );
  slice : entity work.complexphasedetector_xlslice 
  generic map (
    new_lsb => 11,
    new_msb => 17,
    x_width => 18,
    y_width => 7
  )
  port map (
    x => mux4_y_net,
    y => slice_y_net
  );
  slice1 : entity work.complexphasedetector_xlslice 
  generic map (
    new_lsb => 11,
    new_msb => 17,
    x_width => 18,
    y_width => 7
  )
  port map (
    x => mux5_y_net,
    y => slice1_y_net
  );
end structural;
-- Generated from Simulink block ComplexPhaseDetector/AM_Detectors
library IEEE;
use IEEE.std_logic_1164.all;
library work;
use work.conv_pkg.all;
entity complexphasedetector_am_detectors is
  port (
    ch1real : in std_logic_vector( 18-1 downto 0 );
    ch1imag : in std_logic_vector( 18-1 downto 0 );
    ch2real : in std_logic_vector( 18-1 downto 0 );
    ch2imag : in std_logic_vector( 18-1 downto 0 );
    squelch : in std_logic_vector( 18-1 downto 0 );
    am_disable : in std_logic_vector( 1-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    amerrch1 : out std_logic_vector( 18-1 downto 0 );
    amerrch2 : out std_logic_vector( 18-1 downto 0 )
  );
end complexphasedetector_am_detectors;
architecture structural of complexphasedetector_am_detectors is 
  signal mux6_y_net : std_logic_vector( 18-1 downto 0 );
  signal mux7_y_net : std_logic_vector( 18-1 downto 0 );
  signal ch1real_net : std_logic_vector( 18-1 downto 0 );
  signal slice_y_net : std_logic_vector( 7-1 downto 0 );
  signal mux5_y_net : std_logic_vector( 18-1 downto 0 );
  signal reinterpret_output_port_net_x0 : std_logic_vector( 18-1 downto 0 );
  signal negate_op_net : std_logic_vector( 18-1 downto 0 );
  signal ch1imag_net : std_logic_vector( 18-1 downto 0 );
  signal mult_p_net : std_logic_vector( 18-1 downto 0 );
  signal concat_y_net : std_logic_vector( 14-1 downto 0 );
  signal mutiplyby2_op_net : std_logic_vector( 18-1 downto 0 );
  signal rom_data_net : std_logic_vector( 8-1 downto 0 );
  signal ch2imag_net : std_logic_vector( 18-1 downto 0 );
  signal ch2real_net : std_logic_vector( 18-1 downto 0 );
  signal ch1gteqch2_op_net : std_logic_vector( 1-1 downto 0 );
  signal ce_net : std_logic;
  signal clk_net : std_logic;
  signal mux4_y_net : std_logic_vector( 18-1 downto 0 );
  signal gainslave : std_logic_vector( 18-1 downto 0 );
  signal am_disable_net : std_logic_vector( 1-1 downto 0 );
  signal slice1_y_net : std_logic_vector( 7-1 downto 0 );
  signal reinterpret_output_port_net : std_logic_vector( 18-1 downto 0 );
begin
  amerrch1 <= mux6_y_net;
  amerrch2 <= mux7_y_net;
  ch1real_net <= ch1real;
  ch1imag_net <= ch1imag;
  ch2real_net <= ch2real;
  ch2imag_net <= ch2imag;
  gainslave <= squelch;
  am_disable_net <= am_disable;
  clk_net <= clk_1;
  ce_net <= ce_1;
  ch1power : entity work.complexphasedetector_ch1power 
  port map (
    real => ch1real_net,
    imag => ch1imag_net,
    reset => am_disable_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    power => reinterpret_output_port_net_x0
  );
  ch2power : entity work.complexphasedetector_ch2power 
  port map (
    real => ch2real_net,
    imag => ch2imag_net,
    reset => am_disable_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    power => reinterpret_output_port_net
  );
  normalize : entity work.complexphasedetector_normalize 
  port map (
    power1 => mux4_y_net,
    power2 => mux5_y_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    out1 => slice_y_net,
    out2 => slice1_y_net
  );
  negate : entity work.sysgen_negate_2003a196d0 
  port map (
    clr => '0',
    ip => mult_p_net,
    clk => clk_net,
    ce => ce_net,
    op => negate_op_net
  );
  concat : entity work.sysgen_concat_acb43edeb3 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    in0 => slice_y_net,
    in1 => slice1_y_net,
    y => concat_y_net
  );
  ch1gteqch2 : entity work.sysgen_relational_5ecae8200b 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    a => reinterpret_output_port_net_x0,
    b => reinterpret_output_port_net,
    op => ch1gteqch2_op_net
  );
  mult : entity work.complexphasedetector_xlmult 
  generic map (
    a_arith => xlUnsigned,
    a_bin_pt => 17,
    a_width => 18,
    b_arith => xlUnsigned,
    b_bin_pt => 8,
    b_width => 8,
    c_a_type => 1,
    c_a_width => 18,
    c_b_type => 1,
    c_b_width => 8,
    c_baat => 18,
    c_output_width => 26,
    c_type => 1,
    core_name0 => "complexphasedetector_mult_gen_v12_0_i3",
    extra_registers => 0,
    multsign => 1,
    overflow => 1,
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
    a => mutiplyby2_op_net,
    b => rom_data_net,
    clk => clk_net,
    ce => ce_net,
    core_clk => clk_net,
    core_ce => ce_net,
    p => mult_p_net
  );
  mutiplyby2 : entity work.sysgen_shift_201e61236c 
  port map (
    clr => '0',
    ip => gainslave,
    clk => clk_net,
    ce => ce_net,
    op => mutiplyby2_op_net
  );
  mux4 : entity work.sysgen_mux_5aae7736b5 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    sel => ch1gteqch2_op_net,
    d0 => reinterpret_output_port_net,
    d1 => reinterpret_output_port_net_x0,
    y => mux4_y_net
  );
  mux5 : entity work.sysgen_mux_5aae7736b5 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    sel => ch1gteqch2_op_net,
    d0 => reinterpret_output_port_net_x0,
    d1 => reinterpret_output_port_net,
    y => mux5_y_net
  );
  mux6 : entity work.sysgen_mux_5aae7736b5 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    sel => ch1gteqch2_op_net,
    d0 => negate_op_net,
    d1 => mult_p_net,
    y => mux6_y_net
  );
  mux7 : entity work.sysgen_mux_5aae7736b5 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    sel => ch1gteqch2_op_net,
    d0 => mult_p_net,
    d1 => negate_op_net,
    y => mux7_y_net
  );
  rom : entity work.complexphasedetector_xlsprom 
  generic map (
    c_address_width => 14,
    c_width => 8,
    core_name0 => "complexphasedetector_blk_mem_gen_v8_3_i1",
    latency => 1
  )
  port map (
    en => "1",
    rst => "0",
    addr => concat_y_net,
    clk => clk_net,
    ce => ce_net,
    data => rom_data_net
  );
end structural;
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
  signal addsub1_s_net : std_logic_vector( 21-1 downto 0 );
  signal addsub2_s_net : std_logic_vector( 21-1 downto 0 );
  signal inverter_op_net : std_logic_vector( 1-1 downto 0 );
  signal clk_net : std_logic;
  signal shift1_op_net : std_logic_vector( 21-1 downto 0 );
  signal mux_y_net : std_logic_vector( 21-1 downto 0 );
  signal constant1_op_net : std_logic_vector( 21-1 downto 0 );
  signal constant_op_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal ce_net : std_logic;
  signal addsub_s_net : std_logic_vector( 21-1 downto 0 );
  signal shift_op_net : std_logic_vector( 21-1 downto 0 );
  signal slice_y_net : std_logic_vector( 1-1 downto 0 );
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
  signal constant_op_net : std_logic_vector( 21-1 downto 0 );
  signal addsub_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal addsub2_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal ce_net : std_logic;
  signal shift1_op_net : std_logic_vector( 21-1 downto 0 );
  signal shift_op_net : std_logic_vector( 21-1 downto 0 );
  signal inverter_op_net : std_logic_vector( 1-1 downto 0 );
  signal addsub1_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal addsub1_s_net : std_logic_vector( 21-1 downto 0 );
  signal slice_y_net : std_logic_vector( 1-1 downto 0 );
  signal addsub2_s_net : std_logic_vector( 21-1 downto 0 );
  signal clk_net : std_logic;
  signal addsub_s_net : std_logic_vector( 21-1 downto 0 );
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
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal inverter_op_net : std_logic_vector( 1-1 downto 0 );
  signal addsub2_s_net : std_logic_vector( 21-1 downto 0 );
  signal addsub_s_net : std_logic_vector( 21-1 downto 0 );
  signal constant_op_net : std_logic_vector( 21-1 downto 0 );
  signal slice_y_net : std_logic_vector( 1-1 downto 0 );
  signal shift1_op_net : std_logic_vector( 21-1 downto 0 );
  signal shift_op_net : std_logic_vector( 21-1 downto 0 );
  signal addsub_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal addsub1_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal addsub1_s_net : std_logic_vector( 21-1 downto 0 );
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
  signal addsub2_s_net : std_logic_vector( 21-1 downto 0 );
  signal addsub_s_net : std_logic_vector( 21-1 downto 0 );
  signal ce_net : std_logic;
  signal addsub_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal addsub1_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal addsub2_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal slice_y_net : std_logic_vector( 1-1 downto 0 );
  signal clk_net : std_logic;
  signal shift_op_net : std_logic_vector( 21-1 downto 0 );
  signal shift1_op_net : std_logic_vector( 21-1 downto 0 );
  signal inverter_op_net : std_logic_vector( 1-1 downto 0 );
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
  signal addsub_s_net : std_logic_vector( 21-1 downto 0 );
  signal slice_y_net : std_logic_vector( 1-1 downto 0 );
  signal inverter_op_net : std_logic_vector( 1-1 downto 0 );
  signal clk_net : std_logic;
  signal addsub1_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal addsub2_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal addsub2_s_net : std_logic_vector( 21-1 downto 0 );
  signal shift1_op_net : std_logic_vector( 21-1 downto 0 );
  signal shift_op_net : std_logic_vector( 21-1 downto 0 );
  signal constant_op_net : std_logic_vector( 21-1 downto 0 );
  signal addsub_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal ce_net : std_logic;
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
  signal addsub1_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal addsub1_s_net : std_logic_vector( 21-1 downto 0 );
  signal slice_y_net : std_logic_vector( 1-1 downto 0 );
  signal addsub_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal constant_op_net : std_logic_vector( 21-1 downto 0 );
  signal addsub_s_net : std_logic_vector( 21-1 downto 0 );
  signal ce_net : std_logic;
  signal shift_op_net : std_logic_vector( 21-1 downto 0 );
  signal addsub2_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal shift1_op_net : std_logic_vector( 21-1 downto 0 );
  signal inverter_op_net : std_logic_vector( 1-1 downto 0 );
  signal clk_net : std_logic;
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
  signal addsub1_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal inverter_op_net : std_logic_vector( 1-1 downto 0 );
  signal addsub2_s_net : std_logic_vector( 21-1 downto 0 );
  signal addsub_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal addsub2_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal addsub1_s_net : std_logic_vector( 21-1 downto 0 );
  signal clk_net : std_logic;
  signal shift1_op_net : std_logic_vector( 21-1 downto 0 );
  signal constant_op_net : std_logic_vector( 21-1 downto 0 );
  signal ce_net : std_logic;
  signal addsub_s_net : std_logic_vector( 21-1 downto 0 );
  signal shift_op_net : std_logic_vector( 21-1 downto 0 );
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
  signal addsub2_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal shift_op_net : std_logic_vector( 21-1 downto 0 );
  signal addsub1_s_net : std_logic_vector( 21-1 downto 0 );
  signal inverter_op_net : std_logic_vector( 1-1 downto 0 );
  signal addsub_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal clk_net : std_logic;
  signal addsub2_s_net : std_logic_vector( 21-1 downto 0 );
  signal slice_y_net : std_logic_vector( 1-1 downto 0 );
  signal constant_op_net : std_logic_vector( 21-1 downto 0 );
  signal shift1_op_net : std_logic_vector( 21-1 downto 0 );
  signal addsub_s_net : std_logic_vector( 21-1 downto 0 );
  signal ce_net : std_logic;
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
  signal shift_op_net : std_logic_vector( 21-1 downto 0 );
  signal addsub_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal clk_net : std_logic;
  signal inverter_op_net : std_logic_vector( 1-1 downto 0 );
  signal shift1_op_net : std_logic_vector( 21-1 downto 0 );
  signal slice_y_net : std_logic_vector( 1-1 downto 0 );
  signal addsub2_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal addsub1_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal ce_net : std_logic;
  signal addsub_s_net : std_logic_vector( 21-1 downto 0 );
  signal addsub1_s_net : std_logic_vector( 21-1 downto 0 );
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
  signal addsub_s_net : std_logic_vector( 21-1 downto 0 );
  signal addsub2_s_net : std_logic_vector( 21-1 downto 0 );
  signal shift_op_net : std_logic_vector( 21-1 downto 0 );
  signal clk_net : std_logic;
  signal addsub1_s_net : std_logic_vector( 21-1 downto 0 );
  signal shift1_op_net : std_logic_vector( 21-1 downto 0 );
  signal addsub_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal ce_net : std_logic;
  signal addsub2_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal inverter_op_net : std_logic_vector( 1-1 downto 0 );
  signal slice_y_net : std_logic_vector( 1-1 downto 0 );
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
  signal addsub_s_net : std_logic_vector( 21-1 downto 0 );
  signal addsub2_s_net : std_logic_vector( 21-1 downto 0 );
  signal ce_net : std_logic;
  signal addsub1_s_net : std_logic_vector( 21-1 downto 0 );
  signal addsub2_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal shift1_op_net : std_logic_vector( 21-1 downto 0 );
  signal clk_net : std_logic;
  signal constant_op_net : std_logic_vector( 21-1 downto 0 );
  signal shift_op_net : std_logic_vector( 21-1 downto 0 );
  signal inverter_op_net : std_logic_vector( 1-1 downto 0 );
  signal slice_y_net : std_logic_vector( 1-1 downto 0 );
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
  signal addsub_s_net : std_logic_vector( 21-1 downto 0 );
  signal addsub1_s_net : std_logic_vector( 21-1 downto 0 );
  signal inverter_op_net : std_logic_vector( 1-1 downto 0 );
  signal shift_op_net : std_logic_vector( 21-1 downto 0 );
  signal shift1_op_net : std_logic_vector( 21-1 downto 0 );
  signal addsub2_s_net : std_logic_vector( 21-1 downto 0 );
  signal addsub_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal clk_net : std_logic;
  signal addsub1_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal constant_op_net : std_logic_vector( 21-1 downto 0 );
  signal addsub2_s_net_x0 : std_logic_vector( 21-1 downto 0 );
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
  signal constant_op_net : std_logic_vector( 21-1 downto 0 );
  signal ce_net : std_logic;
  signal shift1_op_net : std_logic_vector( 21-1 downto 0 );
  signal addsub2_s_net : std_logic_vector( 21-1 downto 0 );
  signal addsub2_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal slice_y_net : std_logic_vector( 1-1 downto 0 );
  signal addsub1_s_net : std_logic_vector( 21-1 downto 0 );
  signal addsub_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal inverter_op_net : std_logic_vector( 1-1 downto 0 );
  signal addsub1_s_net_x0 : std_logic_vector( 21-1 downto 0 );
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
  signal addsub_s_net : std_logic_vector( 21-1 downto 0 );
  signal ce_net : std_logic;
  signal addsub2_s_net : std_logic_vector( 21-1 downto 0 );
  signal addsub1_s_net : std_logic_vector( 21-1 downto 0 );
  signal inverter_op_net : std_logic_vector( 1-1 downto 0 );
  signal slice_y_net : std_logic_vector( 1-1 downto 0 );
  signal addsub1_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal shift1_op_net : std_logic_vector( 21-1 downto 0 );
  signal shift_op_net : std_logic_vector( 21-1 downto 0 );
  signal addsub_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal constant_op_net : std_logic_vector( 21-1 downto 0 );
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
  signal addsub_s_net : std_logic_vector( 21-1 downto 0 );
  signal addsub1_s_net : std_logic_vector( 21-1 downto 0 );
  signal inverter_op_net : std_logic_vector( 1-1 downto 0 );
  signal clk_net : std_logic;
  signal constant_op_net : std_logic_vector( 21-1 downto 0 );
  signal addsub_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal addsub1_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal addsub2_s_net : std_logic_vector( 21-1 downto 0 );
  signal shift1_op_net : std_logic_vector( 21-1 downto 0 );
  signal shift_op_net : std_logic_vector( 21-1 downto 0 );
  signal slice_y_net : std_logic_vector( 1-1 downto 0 );
  signal ce_net : std_logic;
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
  signal addsub_s_net : std_logic_vector( 21-1 downto 0 );
  signal addsub1_s_net : std_logic_vector( 21-1 downto 0 );
  signal clk_net : std_logic;
  signal inverter_op_net : std_logic_vector( 1-1 downto 0 );
  signal addsub2_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal ce_net : std_logic;
  signal addsub1_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal shift_op_net : std_logic_vector( 21-1 downto 0 );
  signal addsub_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal constant_op_net : std_logic_vector( 21-1 downto 0 );
  signal slice_y_net : std_logic_vector( 1-1 downto 0 );
  signal addsub2_s_net : std_logic_vector( 21-1 downto 0 );
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
  signal addsub_s_net : std_logic_vector( 21-1 downto 0 );
  signal shift_op_net : std_logic_vector( 21-1 downto 0 );
  signal addsub2_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal slice_y_net : std_logic_vector( 1-1 downto 0 );
  signal addsub_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal shift1_op_net : std_logic_vector( 21-1 downto 0 );
  signal clk_net : std_logic;
  signal inverter_op_net : std_logic_vector( 1-1 downto 0 );
  signal addsub1_s_net : std_logic_vector( 21-1 downto 0 );
  signal constant_op_net : std_logic_vector( 21-1 downto 0 );
  signal addsub2_s_net : std_logic_vector( 21-1 downto 0 );
  signal ce_net : std_logic;
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
  signal addsub_s_net_x3 : std_logic_vector( 21-1 downto 0 );
  signal addsub2_s_net : std_logic_vector( 21-1 downto 0 );
  signal addsub_s_net : std_logic_vector( 21-1 downto 0 );
  signal addsub1_s_net_x3 : std_logic_vector( 21-1 downto 0 );
  signal addsub_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal addsub1_s_net_x1 : std_logic_vector( 21-1 downto 0 );
  signal addsub1_s_net : std_logic_vector( 21-1 downto 0 );
  signal addsub1_s_net_x9 : std_logic_vector( 21-1 downto 0 );
  signal addsub_s_net_x4 : std_logic_vector( 21-1 downto 0 );
  signal addsub2_s_net_x6 : std_logic_vector( 21-1 downto 0 );
  signal addsub2_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal addsub2_s_net_x10 : std_logic_vector( 21-1 downto 0 );
  signal addsub1_s_net_x14 : std_logic_vector( 21-1 downto 0 );
  signal addsub1_s_net_x10 : std_logic_vector( 21-1 downto 0 );
  signal clk_net : std_logic;
  signal addsub_s_net_x7 : std_logic_vector( 21-1 downto 0 );
  signal addsub2_s_net_x7 : std_logic_vector( 21-1 downto 0 );
  signal addsub1_s_net_x2 : std_logic_vector( 21-1 downto 0 );
  signal addsub_s_net_x10 : std_logic_vector( 21-1 downto 0 );
  signal addsub2_s_net_x11 : std_logic_vector( 21-1 downto 0 );
  signal addsub1_s_net_x7 : std_logic_vector( 21-1 downto 0 );
  signal addsub_s_net_x15 : std_logic_vector( 21-1 downto 0 );
  signal addsub_s_net_x11 : std_logic_vector( 21-1 downto 0 );
  signal addsub_s_net_x6 : std_logic_vector( 21-1 downto 0 );
  signal addsub1_s_net_x5 : std_logic_vector( 21-1 downto 0 );
  signal addsub1_s_net_x12 : std_logic_vector( 21-1 downto 0 );
  signal addsub2_s_net_x5 : std_logic_vector( 21-1 downto 0 );
  signal mux_y_net : std_logic_vector( 21-1 downto 0 );
  signal addsub1_s_net_x8 : std_logic_vector( 21-1 downto 0 );
  signal addsub1_s_net_x15 : std_logic_vector( 21-1 downto 0 );
  signal addsub2_s_net_x15 : std_logic_vector( 21-1 downto 0 );
  signal addsub_s_net_x13 : std_logic_vector( 21-1 downto 0 );
  signal addsub_s_net_x14 : std_logic_vector( 21-1 downto 0 );
  signal addsub1_s_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal addsub2_s_net_x2 : std_logic_vector( 21-1 downto 0 );
  signal addsub_s_net_x12 : std_logic_vector( 21-1 downto 0 );
  signal addsub1_s_net_x13 : std_logic_vector( 21-1 downto 0 );
  signal constant_op_net : std_logic_vector( 21-1 downto 0 );
  signal addsub2_s_net_x8 : std_logic_vector( 21-1 downto 0 );
  signal addsub2_s_net_x9 : std_logic_vector( 21-1 downto 0 );
  signal addsub1_s_net_x4 : std_logic_vector( 21-1 downto 0 );
  signal addsub_s_net_x9 : std_logic_vector( 21-1 downto 0 );
  signal addsub_s_net_x2 : std_logic_vector( 21-1 downto 0 );
  signal addsub2_s_net_x1 : std_logic_vector( 21-1 downto 0 );
  signal addsub2_s_net_x14 : std_logic_vector( 21-1 downto 0 );
  signal addsub1_s_net_x11 : std_logic_vector( 21-1 downto 0 );
  signal addsub2_s_net_x13 : std_logic_vector( 21-1 downto 0 );
  signal constant1_op_net : std_logic_vector( 21-1 downto 0 );
  signal addsub2_s_net_x12 : std_logic_vector( 21-1 downto 0 );
  signal ce_net : std_logic;
  signal addsub1_s_net_x6 : std_logic_vector( 21-1 downto 0 );
  signal addsub2_s_net_x4 : std_logic_vector( 21-1 downto 0 );
  signal addsub_s_net_x8 : std_logic_vector( 21-1 downto 0 );
  signal addsub_s_net_x5 : std_logic_vector( 21-1 downto 0 );
  signal addsub_s_net_x1 : std_logic_vector( 21-1 downto 0 );
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
  signal mux_y_net : std_logic_vector( 21-1 downto 0 );
  signal ce_net : std_logic;
  signal addsub_s_net : std_logic_vector( 21-1 downto 0 );
  signal mux1_y_net : std_logic_vector( 21-1 downto 0 );
  signal negate1_op_net : std_logic_vector( 21-1 downto 0 );
  signal negate2_op_net : std_logic_vector( 21-1 downto 0 );
  signal delay4_q_net : std_logic_vector( 1-1 downto 0 );
  signal delay1_q_net : std_logic_vector( 1-1 downto 0 );
  signal mux3_y_net : std_logic_vector( 21-1 downto 0 );
  signal addsub1_s_net : std_logic_vector( 21-1 downto 0 );
  signal mux2_y_net : std_logic_vector( 21-1 downto 0 );
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
  signal logical_y_net : std_logic_vector( 1-1 downto 0 );
  signal sgn_z_y_net : std_logic_vector( 1-1 downto 0 );
  signal mux_y_net : std_logic_vector( 21-1 downto 0 );
  signal mult_p_net : std_logic_vector( 21-1 downto 0 );
  signal ce_net : std_logic;
  signal constant1_op_net : std_logic_vector( 21-1 downto 0 );
  signal delay1_q_net : std_logic_vector( 21-1 downto 0 );
  signal relational1_op_net : std_logic_vector( 1-1 downto 0 );
  signal clk_net : std_logic;
  signal constant2_op_net : std_logic_vector( 21-1 downto 0 );
  signal addsub_s_net : std_logic_vector( 21-1 downto 0 );
  signal inverter_op_net : std_logic_vector( 1-1 downto 0 );
  signal relational_op_net : std_logic_vector( 1-1 downto 0 );
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
  signal constant1_op_net : std_logic_vector( 21-1 downto 0 );
  signal addsub1_s_net : std_logic_vector( 21-1 downto 0 );
  signal convert_dout_net : std_logic_vector( 18-1 downto 0 );
  signal ce_net : std_logic;
  signal addsub_s_net : std_logic_vector( 21-1 downto 0 );
  signal delay4_q_net : std_logic_vector( 1-1 downto 0 );
  signal constant_op_net : std_logic_vector( 21-1 downto 0 );
  signal mult_p_net : std_logic_vector( 21-1 downto 0 );
  signal mux1_y_net : std_logic_vector( 21-1 downto 0 );
  signal clk_net : std_logic;
  signal mux_y_net_x0 : std_logic_vector( 21-1 downto 0 );
  signal delay1_q_net : std_logic_vector( 1-1 downto 0 );
  signal logical_y_net : std_logic_vector( 1-1 downto 0 );
  signal convert1_dout_net : std_logic_vector( 18-1 downto 0 );
  signal sgn_z_y_net : std_logic_vector( 1-1 downto 0 );
  signal mux_y_net : std_logic_vector( 21-1 downto 0 );
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
  quadrant_correct : entity work.complexphasedetector_quadrant_correct 
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
-- Generated from Simulink block ComplexPhaseDetector/Bipolar NCO
library IEEE;
use IEEE.std_logic_1164.all;
library work;
use work.conv_pkg.all;
entity complexphasedetector_bipolar_nco is
  port (
    rst : in std_logic_vector( 1-1 downto 0 );
    inc : in std_logic_vector( 22-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    sin : out std_logic_vector( 18-1 downto 0 );
    cos : out std_logic_vector( 18-1 downto 0 )
  );
end complexphasedetector_bipolar_nco;
architecture structural of complexphasedetector_bipolar_nco is 
  signal convert1_dout_net : std_logic_vector( 18-1 downto 0 );
  signal reset_net : std_logic_vector( 1-1 downto 0 );
  signal convert_dout_net : std_logic_vector( 18-1 downto 0 );
  signal clk_net : std_logic;
  signal slice_y_net : std_logic_vector( 18-1 downto 0 );
  signal negate1_op_net : std_logic_vector( 22-1 downto 0 );
  signal ce_net : std_logic;
  signal accumulator_q_net : std_logic_vector( 22-1 downto 0 );
  signal reinterpret1_output_port_net : std_logic_vector( 18-1 downto 0 );
  signal constant_op_net : std_logic_vector( 18-1 downto 0 );
  signal mult_p_net : std_logic_vector( 21-1 downto 0 );
begin
  sin <= convert1_dout_net;
  cos <= convert_dout_net;
  reset_net <= rst;
  negate1_op_net <= inc;
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
    core_name0 => "complexphasedetector_mult_gen_v12_0_i4",
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
-- Generated from Simulink block ComplexPhaseDetector/Cordic ATan/CORDIC ATAN/CORDIC Fine Angle PE/CORDIC PE1
library IEEE;
use IEEE.std_logic_1164.all;
library work;
use work.conv_pkg.all;
entity complexphasedetector_cordic_pe1_x0 is
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
end complexphasedetector_cordic_pe1_x0;
architecture structural of complexphasedetector_cordic_pe1_x0 is 
  signal clk_net : std_logic;
  signal addsub2_s_net : std_logic_vector( 18-1 downto 0 );
  signal mux_y_net : std_logic_vector( 18-1 downto 0 );
  signal shift1_op_net : std_logic_vector( 18-1 downto 0 );
  signal ce_net : std_logic;
  signal slice_y_net : std_logic_vector( 1-1 downto 0 );
  signal addsub_s_net : std_logic_vector( 18-1 downto 0 );
  signal addsub1_s_net : std_logic_vector( 18-1 downto 0 );
  signal delay3_q_net : std_logic_vector( 18-1 downto 0 );
  signal constant_op_net : std_logic_vector( 18-1 downto 0 );
  signal shift_op_net : std_logic_vector( 18-1 downto 0 );
  signal constant_op_net_x0 : std_logic_vector( 18-1 downto 0 );
  signal inverter_op_net : std_logic_vector( 1-1 downto 0 );
begin
  x_x0 <= addsub_s_net;
  y_x0 <= addsub1_s_net;
  z_x0 <= addsub2_s_net;
  mux_y_net <= x;
  delay3_q_net <= y;
  constant_op_net <= z;
  clk_net <= clk_1;
  ce_net <= ce_1;
  addsub : entity work.sysgen_addsub_6b0de76065 
  port map (
    clr => '0',
    a => mux_y_net,
    b => shift1_op_net,
    mode => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub_s_net
  );
  addsub1 : entity work.sysgen_addsub_d0a1deee4b 
  port map (
    clr => '0',
    a => delay3_q_net,
    b => shift_op_net,
    mode => inverter_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub1_s_net
  );
  addsub2 : entity work.sysgen_addsub_6b0de76065 
  port map (
    clr => '0',
    a => constant_op_net,
    b => constant_op_net_x0,
    mode => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub2_s_net
  );
  constant_x0 : entity work.sysgen_constant_55c439f6ee 
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
  shift1 : entity work.sysgen_shift_f74bde9927 
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
  signal slice_y_net : std_logic_vector( 1-1 downto 0 );
  signal addsub1_s_net : std_logic_vector( 18-1 downto 0 );
  signal addsub_s_net_x0 : std_logic_vector( 18-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal addsub_s_net : std_logic_vector( 18-1 downto 0 );
  signal addsub2_s_net_x0 : std_logic_vector( 18-1 downto 0 );
  signal addsub2_s_net : std_logic_vector( 18-1 downto 0 );
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
  addsub : entity work.sysgen_addsub_6b0de76065 
  port map (
    clr => '0',
    a => addsub_s_net,
    b => shift1_op_net,
    mode => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub_s_net_x0
  );
  addsub2 : entity work.sysgen_addsub_6b0de76065 
  port map (
    clr => '0',
    a => addsub2_s_net,
    b => constant_op_net,
    mode => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub2_s_net_x0
  );
  constant_x0 : entity work.sysgen_constant_4e13f232b6 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  shift1 : entity work.sysgen_shift_21575a0458 
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
entity complexphasedetector_cordic_pe2_x0 is
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
end complexphasedetector_cordic_pe2_x0;
architecture structural of complexphasedetector_cordic_pe2_x0 is 
  signal addsub_s_net_x0 : std_logic_vector( 18-1 downto 0 );
  signal shift_op_net : std_logic_vector( 18-1 downto 0 );
  signal constant_op_net : std_logic_vector( 18-1 downto 0 );
  signal addsub2_s_net : std_logic_vector( 18-1 downto 0 );
  signal slice_y_net : std_logic_vector( 1-1 downto 0 );
  signal ce_net : std_logic;
  signal addsub1_s_net_x0 : std_logic_vector( 18-1 downto 0 );
  signal clk_net : std_logic;
  signal shift1_op_net : std_logic_vector( 18-1 downto 0 );
  signal inverter_op_net : std_logic_vector( 1-1 downto 0 );
  signal addsub2_s_net_x0 : std_logic_vector( 18-1 downto 0 );
  signal addsub1_s_net : std_logic_vector( 18-1 downto 0 );
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
  addsub : entity work.sysgen_addsub_6b0de76065 
  port map (
    clr => '0',
    a => addsub_s_net_x0,
    b => shift1_op_net,
    mode => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub_s_net
  );
  addsub1 : entity work.sysgen_addsub_6b0de76065 
  port map (
    clr => '0',
    a => addsub1_s_net_x0,
    b => shift_op_net,
    mode => inverter_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub1_s_net
  );
  addsub2 : entity work.sysgen_addsub_6b0de76065 
  port map (
    clr => '0',
    a => addsub2_s_net_x0,
    b => constant_op_net,
    mode => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub2_s_net
  );
  constant_x0 : entity work.sysgen_constant_339a1da7f3 
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
  shift : entity work.sysgen_shift_fa3b07063e 
  port map (
    clr => '0',
    ip => addsub_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift_op_net
  );
  shift1 : entity work.sysgen_shift_fa3b07063e 
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
entity complexphasedetector_cordic_pe3_x0 is
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
end complexphasedetector_cordic_pe3_x0;
architecture structural of complexphasedetector_cordic_pe3_x0 is 
  signal ce_net : std_logic;
  signal addsub2_s_net_x0 : std_logic_vector( 18-1 downto 0 );
  signal addsub_s_net : std_logic_vector( 18-1 downto 0 );
  signal shift_op_net : std_logic_vector( 18-1 downto 0 );
  signal addsub_s_net_x0 : std_logic_vector( 18-1 downto 0 );
  signal clk_net : std_logic;
  signal slice_y_net : std_logic_vector( 1-1 downto 0 );
  signal constant_op_net : std_logic_vector( 18-1 downto 0 );
  signal addsub2_s_net : std_logic_vector( 18-1 downto 0 );
  signal addsub1_s_net : std_logic_vector( 18-1 downto 0 );
  signal shift1_op_net : std_logic_vector( 18-1 downto 0 );
  signal inverter_op_net : std_logic_vector( 1-1 downto 0 );
  signal addsub1_s_net_x0 : std_logic_vector( 18-1 downto 0 );
begin
  x_x0 <= addsub_s_net;
  y_x0 <= addsub1_s_net;
  z_x0 <= addsub2_s_net;
  addsub_s_net_x0 <= x;
  addsub1_s_net_x0 <= y;
  addsub2_s_net_x0 <= z;
  clk_net <= clk_1;
  ce_net <= ce_1;
  addsub : entity work.sysgen_addsub_6b0de76065 
  port map (
    clr => '0',
    a => addsub_s_net_x0,
    b => shift1_op_net,
    mode => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub_s_net
  );
  addsub1 : entity work.sysgen_addsub_6b0de76065 
  port map (
    clr => '0',
    a => addsub1_s_net_x0,
    b => shift_op_net,
    mode => inverter_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub1_s_net
  );
  addsub2 : entity work.sysgen_addsub_6b0de76065 
  port map (
    clr => '0',
    a => addsub2_s_net_x0,
    b => constant_op_net,
    mode => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub2_s_net
  );
  constant_x0 : entity work.sysgen_constant_1f3bcdf2cb 
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
  shift : entity work.sysgen_shift_541c7db570 
  port map (
    clr => '0',
    ip => addsub_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift_op_net
  );
  shift1 : entity work.sysgen_shift_541c7db570 
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
entity complexphasedetector_cordic_pe4_x0 is
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
end complexphasedetector_cordic_pe4_x0;
architecture structural of complexphasedetector_cordic_pe4_x0 is 
  signal shift_op_net : std_logic_vector( 18-1 downto 0 );
  signal addsub1_s_net_x0 : std_logic_vector( 18-1 downto 0 );
  signal addsub_s_net : std_logic_vector( 18-1 downto 0 );
  signal constant_op_net : std_logic_vector( 18-1 downto 0 );
  signal ce_net : std_logic;
  signal addsub1_s_net : std_logic_vector( 18-1 downto 0 );
  signal addsub2_s_net_x0 : std_logic_vector( 18-1 downto 0 );
  signal shift1_op_net : std_logic_vector( 18-1 downto 0 );
  signal slice_y_net : std_logic_vector( 1-1 downto 0 );
  signal inverter_op_net : std_logic_vector( 1-1 downto 0 );
  signal addsub2_s_net : std_logic_vector( 18-1 downto 0 );
  signal clk_net : std_logic;
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
  addsub : entity work.sysgen_addsub_6b0de76065 
  port map (
    clr => '0',
    a => addsub_s_net_x0,
    b => shift1_op_net,
    mode => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub_s_net
  );
  addsub1 : entity work.sysgen_addsub_6b0de76065 
  port map (
    clr => '0',
    a => addsub1_s_net_x0,
    b => shift_op_net,
    mode => inverter_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub1_s_net
  );
  addsub2 : entity work.sysgen_addsub_6b0de76065 
  port map (
    clr => '0',
    a => addsub2_s_net_x0,
    b => constant_op_net,
    mode => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub2_s_net
  );
  constant_x0 : entity work.sysgen_constant_5c7c98fcc2 
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
  shift : entity work.sysgen_shift_52c770764d 
  port map (
    clr => '0',
    ip => addsub_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift_op_net
  );
  shift1 : entity work.sysgen_shift_52c770764d 
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
entity complexphasedetector_cordic_pe5_x0 is
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
end complexphasedetector_cordic_pe5_x0;
architecture structural of complexphasedetector_cordic_pe5_x0 is 
  signal addsub1_s_net_x0 : std_logic_vector( 18-1 downto 0 );
  signal shift_op_net : std_logic_vector( 18-1 downto 0 );
  signal constant_op_net : std_logic_vector( 18-1 downto 0 );
  signal shift1_op_net : std_logic_vector( 18-1 downto 0 );
  signal addsub2_s_net : std_logic_vector( 18-1 downto 0 );
  signal addsub2_s_net_x0 : std_logic_vector( 18-1 downto 0 );
  signal inverter_op_net : std_logic_vector( 1-1 downto 0 );
  signal clk_net : std_logic;
  signal addsub1_s_net : std_logic_vector( 18-1 downto 0 );
  signal addsub_s_net_x0 : std_logic_vector( 18-1 downto 0 );
  signal ce_net : std_logic;
  signal addsub_s_net : std_logic_vector( 18-1 downto 0 );
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
  addsub : entity work.sysgen_addsub_6b0de76065 
  port map (
    clr => '0',
    a => addsub_s_net_x0,
    b => shift1_op_net,
    mode => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub_s_net
  );
  addsub1 : entity work.sysgen_addsub_6b0de76065 
  port map (
    clr => '0',
    a => addsub1_s_net_x0,
    b => shift_op_net,
    mode => inverter_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub1_s_net
  );
  addsub2 : entity work.sysgen_addsub_6b0de76065 
  port map (
    clr => '0',
    a => addsub2_s_net_x0,
    b => constant_op_net,
    mode => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub2_s_net
  );
  constant_x0 : entity work.sysgen_constant_b283f7bab5 
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
  shift : entity work.sysgen_shift_170e7f72e7 
  port map (
    clr => '0',
    ip => addsub_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift_op_net
  );
  shift1 : entity work.sysgen_shift_170e7f72e7 
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
entity complexphasedetector_cordic_pe6_x0 is
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
end complexphasedetector_cordic_pe6_x0;
architecture structural of complexphasedetector_cordic_pe6_x0 is 
  signal addsub_s_net_x0 : std_logic_vector( 18-1 downto 0 );
  signal addsub_s_net : std_logic_vector( 18-1 downto 0 );
  signal addsub2_s_net : std_logic_vector( 18-1 downto 0 );
  signal shift1_op_net : std_logic_vector( 18-1 downto 0 );
  signal slice_y_net : std_logic_vector( 1-1 downto 0 );
  signal ce_net : std_logic;
  signal addsub2_s_net_x0 : std_logic_vector( 18-1 downto 0 );
  signal addsub1_s_net_x0 : std_logic_vector( 18-1 downto 0 );
  signal shift_op_net : std_logic_vector( 18-1 downto 0 );
  signal inverter_op_net : std_logic_vector( 1-1 downto 0 );
  signal constant_op_net : std_logic_vector( 18-1 downto 0 );
  signal clk_net : std_logic;
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
  addsub : entity work.sysgen_addsub_6b0de76065 
  port map (
    clr => '0',
    a => addsub_s_net_x0,
    b => shift1_op_net,
    mode => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub_s_net
  );
  addsub1 : entity work.sysgen_addsub_6b0de76065 
  port map (
    clr => '0',
    a => addsub1_s_net_x0,
    b => shift_op_net,
    mode => inverter_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub1_s_net
  );
  addsub2 : entity work.sysgen_addsub_6b0de76065 
  port map (
    clr => '0',
    a => addsub2_s_net_x0,
    b => constant_op_net,
    mode => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub2_s_net
  );
  constant_x0 : entity work.sysgen_constant_0eb162e4b0 
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
  shift : entity work.sysgen_shift_f74bde9927 
  port map (
    clr => '0',
    ip => addsub_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift_op_net
  );
  shift1 : entity work.sysgen_shift_f74bde9927 
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
entity complexphasedetector_cordic_pe7_x0 is
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
end complexphasedetector_cordic_pe7_x0;
architecture structural of complexphasedetector_cordic_pe7_x0 is 
  signal ce_net : std_logic;
  signal shift_op_net : std_logic_vector( 18-1 downto 0 );
  signal addsub1_s_net : std_logic_vector( 18-1 downto 0 );
  signal clk_net : std_logic;
  signal addsub_s_net : std_logic_vector( 18-1 downto 0 );
  signal addsub_s_net_x0 : std_logic_vector( 18-1 downto 0 );
  signal addsub2_s_net : std_logic_vector( 18-1 downto 0 );
  signal addsub2_s_net_x0 : std_logic_vector( 18-1 downto 0 );
  signal slice_y_net : std_logic_vector( 1-1 downto 0 );
  signal addsub1_s_net_x0 : std_logic_vector( 18-1 downto 0 );
  signal shift1_op_net : std_logic_vector( 18-1 downto 0 );
  signal constant_op_net : std_logic_vector( 18-1 downto 0 );
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
  addsub : entity work.sysgen_addsub_6b0de76065 
  port map (
    clr => '0',
    a => addsub_s_net_x0,
    b => shift1_op_net,
    mode => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub_s_net
  );
  addsub1 : entity work.sysgen_addsub_6b0de76065 
  port map (
    clr => '0',
    a => addsub1_s_net_x0,
    b => shift_op_net,
    mode => inverter_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub1_s_net
  );
  addsub2 : entity work.sysgen_addsub_6b0de76065 
  port map (
    clr => '0',
    a => addsub2_s_net_x0,
    b => constant_op_net,
    mode => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub2_s_net
  );
  constant_x0 : entity work.sysgen_constant_d51663d32e 
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
  shift : entity work.sysgen_shift_9f07ad2f2d 
  port map (
    clr => '0',
    ip => addsub_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift_op_net
  );
  shift1 : entity work.sysgen_shift_9f07ad2f2d 
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
entity complexphasedetector_cordic_pe8_x0 is
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
end complexphasedetector_cordic_pe8_x0;
architecture structural of complexphasedetector_cordic_pe8_x0 is 
  signal constant_op_net : std_logic_vector( 18-1 downto 0 );
  signal slice_y_net : std_logic_vector( 1-1 downto 0 );
  signal ce_net : std_logic;
  signal addsub2_s_net_x0 : std_logic_vector( 18-1 downto 0 );
  signal addsub_s_net : std_logic_vector( 18-1 downto 0 );
  signal addsub1_s_net_x0 : std_logic_vector( 18-1 downto 0 );
  signal addsub_s_net_x0 : std_logic_vector( 18-1 downto 0 );
  signal addsub1_s_net : std_logic_vector( 18-1 downto 0 );
  signal shift_op_net : std_logic_vector( 18-1 downto 0 );
  signal clk_net : std_logic;
  signal shift1_op_net : std_logic_vector( 18-1 downto 0 );
  signal inverter_op_net : std_logic_vector( 1-1 downto 0 );
  signal addsub2_s_net : std_logic_vector( 18-1 downto 0 );
begin
  x_x0 <= addsub_s_net;
  y_x0 <= addsub1_s_net;
  z_x0 <= addsub2_s_net;
  addsub_s_net_x0 <= x;
  addsub1_s_net_x0 <= y;
  addsub2_s_net_x0 <= z;
  clk_net <= clk_1;
  ce_net <= ce_1;
  addsub : entity work.sysgen_addsub_6b0de76065 
  port map (
    clr => '0',
    a => addsub_s_net_x0,
    b => shift1_op_net,
    mode => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub_s_net
  );
  addsub1 : entity work.sysgen_addsub_6b0de76065 
  port map (
    clr => '0',
    a => addsub1_s_net_x0,
    b => shift_op_net,
    mode => inverter_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub1_s_net
  );
  addsub2 : entity work.sysgen_addsub_6b0de76065 
  port map (
    clr => '0',
    a => addsub2_s_net_x0,
    b => constant_op_net,
    mode => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub2_s_net
  );
  constant_x0 : entity work.sysgen_constant_5093c8b4d9 
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
  shift : entity work.sysgen_shift_3aaf7a0d17 
  port map (
    clr => '0',
    ip => addsub_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift_op_net
  );
  shift1 : entity work.sysgen_shift_3aaf7a0d17 
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
  signal addsub1_s_net : std_logic_vector( 18-1 downto 0 );
  signal inverter_op_net : std_logic_vector( 1-1 downto 0 );
  signal clk_net : std_logic;
  signal addsub2_s_net_x0 : std_logic_vector( 18-1 downto 0 );
  signal addsub2_s_net : std_logic_vector( 18-1 downto 0 );
  signal slice_y_net : std_logic_vector( 1-1 downto 0 );
  signal shift_op_net : std_logic_vector( 18-1 downto 0 );
  signal ce_net : std_logic;
  signal addsub_s_net : std_logic_vector( 18-1 downto 0 );
  signal addsub1_s_net_x0 : std_logic_vector( 18-1 downto 0 );
  signal constant_op_net : std_logic_vector( 18-1 downto 0 );
  signal addsub_s_net_x0 : std_logic_vector( 18-1 downto 0 );
  signal shift1_op_net : std_logic_vector( 18-1 downto 0 );
begin
  x_x0 <= addsub_s_net;
  y_x0 <= addsub1_s_net;
  z_x0 <= addsub2_s_net;
  addsub_s_net_x0 <= x;
  addsub1_s_net_x0 <= y;
  addsub2_s_net_x0 <= z;
  clk_net <= clk_1;
  ce_net <= ce_1;
  addsub : entity work.sysgen_addsub_6b0de76065 
  port map (
    clr => '0',
    a => addsub_s_net_x0,
    b => shift1_op_net,
    mode => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub_s_net
  );
  addsub1 : entity work.sysgen_addsub_6b0de76065 
  port map (
    clr => '0',
    a => addsub1_s_net_x0,
    b => shift_op_net,
    mode => inverter_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub1_s_net
  );
  addsub2 : entity work.sysgen_addsub_6b0de76065 
  port map (
    clr => '0',
    a => addsub2_s_net_x0,
    b => constant_op_net,
    mode => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub2_s_net
  );
  constant_x0 : entity work.sysgen_constant_93c83297a7 
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
  shift : entity work.sysgen_shift_89ac572f90 
  port map (
    clr => '0',
    ip => addsub_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => shift_op_net
  );
  shift1 : entity work.sysgen_shift_89ac572f90 
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
entity complexphasedetector_cordic_fine_angle_pe_x0 is
  port (
    x_x0 : in std_logic_vector( 18-1 downto 0 );
    y : in std_logic_vector( 18-1 downto 0 );
    z : in std_logic_vector( 18-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    x : out std_logic_vector( 18-1 downto 0 );
    z_x0 : out std_logic_vector( 18-1 downto 0 )
  );
end complexphasedetector_cordic_fine_angle_pe_x0;
architecture structural of complexphasedetector_cordic_fine_angle_pe_x0 is 
  signal addsub2_s_net : std_logic_vector( 18-1 downto 0 );
  signal addsub2_s_net_x5 : std_logic_vector( 18-1 downto 0 );
  signal addsub_s_net_x4 : std_logic_vector( 18-1 downto 0 );
  signal addsub_s_net_x2 : std_logic_vector( 18-1 downto 0 );
  signal addsub_s_net_x5 : std_logic_vector( 18-1 downto 0 );
  signal addsub2_s_net_x4 : std_logic_vector( 18-1 downto 0 );
  signal addsub_s_net : std_logic_vector( 18-1 downto 0 );
  signal addsub_s_net_x0 : std_logic_vector( 18-1 downto 0 );
  signal addsub1_s_net_x7 : std_logic_vector( 18-1 downto 0 );
  signal addsub1_s_net_x8 : std_logic_vector( 18-1 downto 0 );
  signal clk_net : std_logic;
  signal addsub_s_net_x1 : std_logic_vector( 18-1 downto 0 );
  signal addsub1_s_net_x1 : std_logic_vector( 18-1 downto 0 );
  signal addsub1_s_net_x0 : std_logic_vector( 18-1 downto 0 );
  signal ce_net : std_logic;
  signal addsub2_s_net_x8 : std_logic_vector( 18-1 downto 0 );
  signal delay3_q_net : std_logic_vector( 18-1 downto 0 );
  signal mux_y_net : std_logic_vector( 18-1 downto 0 );
  signal addsub_s_net_x6 : std_logic_vector( 18-1 downto 0 );
  signal addsub1_s_net_x3 : std_logic_vector( 18-1 downto 0 );
  signal addsub_s_net_x7 : std_logic_vector( 18-1 downto 0 );
  signal addsub2_s_net_x6 : std_logic_vector( 18-1 downto 0 );
  signal addsub2_s_net_x0 : std_logic_vector( 18-1 downto 0 );
  signal addsub1_s_net_x2 : std_logic_vector( 18-1 downto 0 );
  signal addsub1_s_net_x5 : std_logic_vector( 18-1 downto 0 );
  signal addsub_s_net_x8 : std_logic_vector( 18-1 downto 0 );
  signal addsub1_s_net_x6 : std_logic_vector( 18-1 downto 0 );
  signal addsub2_s_net_x7 : std_logic_vector( 18-1 downto 0 );
  signal constant_op_net : std_logic_vector( 18-1 downto 0 );
  signal addsub1_s_net : std_logic_vector( 18-1 downto 0 );
  signal addsub2_s_net_x3 : std_logic_vector( 18-1 downto 0 );
  signal addsub_s_net_x3 : std_logic_vector( 18-1 downto 0 );
  signal addsub2_s_net_x2 : std_logic_vector( 18-1 downto 0 );
  signal addsub2_s_net_x1 : std_logic_vector( 18-1 downto 0 );
begin
  x <= addsub_s_net_x3;
  z_x0 <= addsub2_s_net_x4;
  mux_y_net <= x_x0;
  delay3_q_net <= y;
  constant_op_net <= z;
  clk_net <= clk_1;
  ce_net <= ce_1;
  cordic_pe1 : entity work.complexphasedetector_cordic_pe1_x0 
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
  cordic_pe2 : entity work.complexphasedetector_cordic_pe2_x0 
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
  cordic_pe3 : entity work.complexphasedetector_cordic_pe3_x0 
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
  cordic_pe4 : entity work.complexphasedetector_cordic_pe4_x0 
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
  cordic_pe5 : entity work.complexphasedetector_cordic_pe5_x0 
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
  cordic_pe6 : entity work.complexphasedetector_cordic_pe6_x0 
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
  cordic_pe7 : entity work.complexphasedetector_cordic_pe7_x0 
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
  cordic_pe8 : entity work.complexphasedetector_cordic_pe8_x0 
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
  signal pi_op_net_x0 : std_logic_vector( 18-1 downto 0 );
  signal addsub_s_net : std_logic_vector( 18-1 downto 0 );
  signal clk_net : std_logic;
  signal convert_dout_net : std_logic_vector( 1-1 downto 0 );
  signal mux1_y_net : std_logic_vector( 18-1 downto 0 );
  signal cordic_pipe_balance1_q_net : std_logic_vector( 1-1 downto 0 );
  signal cordic_pipe_balance_q_net : std_logic_vector( 1-1 downto 0 );
  signal ce_net : std_logic;
  signal pi_op_net : std_logic_vector( 18-1 downto 0 );
begin
  z <= mux_y_net;
  addsub2_s_net <= z_in;
  cordic_pipe_balance_q_net <= pi_addsub;
  cordic_pipe_balance1_q_net <= z_mux_sel;
  clk_net <= clk_1;
  ce_net <= ce_1;
  pi : entity work.sysgen_constant_cdab71ec1f 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => pi_op_net_x0
  );
  pi_x0 : entity work.sysgen_constant_e1bb61198c 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => pi_op_net
  );
  addsub : entity work.sysgen_addsub_2d5577beca 
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
entity complexphasedetector_quadrant_map_x0 is
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
end complexphasedetector_quadrant_map_x0;
architecture structural of complexphasedetector_quadrant_map_x0 is 
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal mux_y_net : std_logic_vector( 18-1 downto 0 );
  signal delay3_q_net : std_logic_vector( 18-1 downto 0 );
  signal sgn_y_y_net : std_logic_vector( 1-1 downto 0 );
  signal sgn_x_y_net : std_logic_vector( 1-1 downto 0 );
  signal phase_detect_m_axis_dout_tdata_real_net : std_logic_vector( 18-1 downto 0 );
  signal phase_detect_m_axis_dout_tdata_imag_net : std_logic_vector( 18-1 downto 0 );
  signal delay4_q_net : std_logic_vector( 18-1 downto 0 );
  signal negate1_op_net : std_logic_vector( 18-1 downto 0 );
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
  mux : entity work.sysgen_mux_91aeff11d4 
  port map (
    clr => '0',
    sel => sgn_x_y_net,
    d0 => delay4_q_net,
    d1 => negate1_op_net,
    clk => clk_net,
    ce => ce_net,
    y => mux_y_net
  );
  negate1 : entity work.sysgen_negate_b18accf66a 
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
entity complexphasedetector_cordic_atan_x0 is
  port (
    x : in std_logic_vector( 18-1 downto 0 );
    y : in std_logic_vector( 18-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    x_x0 : out std_logic_vector( 18-1 downto 0 );
    z : out std_logic_vector( 18-1 downto 0 )
  );
end complexphasedetector_cordic_atan_x0;
architecture structural of complexphasedetector_cordic_atan_x0 is 
  signal cordic_pipe_balance1_q_net : std_logic_vector( 1-1 downto 0 );
  signal phase_detect_m_axis_dout_tdata_imag_net : std_logic_vector( 18-1 downto 0 );
  signal mux_y_net : std_logic_vector( 18-1 downto 0 );
  signal clk_net : std_logic;
  signal addsub2_s_net : std_logic_vector( 18-1 downto 0 );
  signal delay3_q_net : std_logic_vector( 18-1 downto 0 );
  signal sgn_x_y_net : std_logic_vector( 1-1 downto 0 );
  signal mux_y_net_x0 : std_logic_vector( 18-1 downto 0 );
  signal phase_detect_m_axis_dout_tdata_real_net : std_logic_vector( 18-1 downto 0 );
  signal ce_net : std_logic;
  signal addsub_s_net : std_logic_vector( 18-1 downto 0 );
  signal constant_op_net : std_logic_vector( 18-1 downto 0 );
  signal cordic_pipe_balance2_q_net : std_logic_vector( 18-1 downto 0 );
  signal cordic_pipe_balance_q_net : std_logic_vector( 1-1 downto 0 );
  signal sgn_y_y_net : std_logic_vector( 1-1 downto 0 );
begin
  x_x0 <= cordic_pipe_balance2_q_net;
  z <= mux_y_net_x0;
  phase_detect_m_axis_dout_tdata_real_net <= x;
  phase_detect_m_axis_dout_tdata_imag_net <= y;
  clk_net <= clk_1;
  ce_net <= ce_1;
  cordic_fine_angle_pe : entity work.complexphasedetector_cordic_fine_angle_pe_x0 
  port map (
    x_x0 => mux_y_net,
    y => delay3_q_net,
    z => constant_op_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    x => addsub_s_net,
    z_x0 => addsub2_s_net
  );
  quadrant_correct : entity work.complexphasedetector_quadrant_correct_x0 
  port map (
    z_in => addsub2_s_net,
    pi_addsub => cordic_pipe_balance_q_net,
    z_mux_sel => cordic_pipe_balance1_q_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    z => mux_y_net_x0
  );
  quadrant_map : entity work.complexphasedetector_quadrant_map_x0 
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
entity complexphasedetector_cordic_atan is
  port (
    imag : in std_logic_vector( 18-1 downto 0 );
    real : in std_logic_vector( 18-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    phase : out std_logic_vector( 18-1 downto 0 )
  );
end complexphasedetector_cordic_atan;
architecture structural of complexphasedetector_cordic_atan is 
  signal mux_y_net_x0 : std_logic_vector( 18-1 downto 0 );
  signal mux_y_net : std_logic_vector( 18-1 downto 0 );
  signal clk_net : std_logic;
  signal cordic_pipe_balance2_q_net : std_logic_vector( 18-1 downto 0 );
  signal phase_detect_m_axis_dout_tdata_imag_net : std_logic_vector( 18-1 downto 0 );
  signal relational1_op_net : std_logic_vector( 1-1 downto 0 );
  signal constant_op_net : std_logic_vector( 18-1 downto 0 );
  signal ce_net : std_logic;
  signal phase_detect_m_axis_dout_tdata_real_net : std_logic_vector( 18-1 downto 0 );
begin
  phase <= mux_y_net;
  phase_detect_m_axis_dout_tdata_imag_net <= imag;
  phase_detect_m_axis_dout_tdata_real_net <= real;
  clk_net <= clk_1;
  ce_net <= ce_1;
  cordic_atan : entity work.complexphasedetector_cordic_atan_x0 
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
  signal addsub2_s_net : std_logic_vector( 32-1 downto 0 );
  signal sweeplmt_net : std_logic_vector( 15-1 downto 0 );
  signal negate2_op_net : std_logic_vector( 18-1 downto 0 );
  signal logical2_y_net_x0 : std_logic_vector( 1-1 downto 0 );
  signal reset_net : std_logic_vector( 1-1 downto 0 );
  signal swprate_net : std_logic_vector( 18-1 downto 0 );
  signal lag_coef_net : std_logic_vector( 18-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal addsub_s_net : std_logic_vector( 21-1 downto 0 );
  signal mux3_y_net : std_logic_vector( 19-1 downto 0 );
  signal relational_op_net : std_logic_vector( 1-1 downto 0 );
  signal constant1_op_net : std_logic_vector( 14-1 downto 0 );
  signal logical_y_net : std_logic;
  signal mult3_p_net : std_logic_vector( 22-1 downto 0 );
  signal assert_dout_net : std_logic_vector( 1-1 downto 0 );
  signal inverter_op_net : std_logic_vector( 1-1 downto 0 );
  signal logical1_y_net : std_logic_vector( 1-1 downto 0 );
  signal constant_op_net : std_logic_vector( 8-1 downto 0 );
  signal delay_q_net : std_logic_vector( 1-1 downto 0 );
  signal logical2_y_net : std_logic_vector( 1-1 downto 0 );
  signal relational1_op_net : std_logic_vector( 1-1 downto 0 );
  signal mux1_y_net : std_logic_vector( 33-1 downto 0 );
  signal mux2_y_net : std_logic_vector( 18-1 downto 0 );
  signal negate_op_net : std_logic_vector( 16-1 downto 0 );
  signal mux_y_net : std_logic_vector( 33-1 downto 0 );
  signal negate1_op_net : std_logic_vector( 19-1 downto 0 );
  signal mux6_y_net : std_logic_vector( 15-1 downto 0 );
begin
  out_x0 <= addsub2_s_net;
  sweeplmt_net <= limit;
  negate2_op_net <= phaseerr;
  logical2_y_net_x0 <= locked;
  swprate_net <= swprate;
  lag_coef_net <= lagcoef;
  reset_net <= rst;
  clk_net <= clk_1;
  ce_net <= ce_1;
  addsub : entity work.complexphasedetector_xladdsub 
  generic map (
    a_arith => xlSigned,
    a_bin_pt => 10,
    a_width => 18,
    b_arith => xlSigned,
    b_bin_pt => 9,
    b_width => 19,
    c_has_c_out => 0,
    c_latency => 1,
    c_output_width => 21,
    core_name0 => "complexphasedetector_c_addsub_v12_0_i8",
    extra_registers => 0,
    full_s_arith => 2,
    full_s_width => 21,
    latency => 1,
    overflow => 1,
    quantization => 1,
    s_arith => xlSigned,
    s_bin_pt => 10,
    s_width => 21
  )
  port map (
    clr => '0',
    en => "1",
    a => negate2_op_net,
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
    core_name0 => "complexphasedetector_c_addsub_v12_0_i9",
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
    b_bin_pt => 10,
    b_width => 21,
    c_a_type => 1,
    c_a_width => 18,
    c_b_type => 0,
    c_b_width => 21,
    c_baat => 18,
    c_output_width => 39,
    c_type => 0,
    core_name0 => "complexphasedetector_mult_gen_v12_0_i5",
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
-- Generated from Simulink block ComplexPhaseDetector_struct
library IEEE;
use IEEE.std_logic_1164.all;
library work;
use work.conv_pkg.all;
entity complexphasedetector_struct is
  port (
    ch1agc : in std_logic_vector( 12-1 downto 0 );
    ch1imag : in std_logic_vector( 18-1 downto 0 );
    ch1real : in std_logic_vector( 18-1 downto 0 );
    ch2agc : in std_logic_vector( 12-1 downto 0 );
    ch2imag : in std_logic_vector( 18-1 downto 0 );
    ch2real : in std_logic_vector( 18-1 downto 0 );
    lag_coef : in std_logic_vector( 18-1 downto 0 );
    lead_coef : in std_logic_vector( 18-1 downto 0 );
    reset : in std_logic_vector( 1-1 downto 0 );
    sweeplmt : in std_logic_vector( 15-1 downto 0 );
    swprate : in std_logic_vector( 18-1 downto 0 );
    am_disable : in std_logic_vector( 1-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    gainoutch1 : out std_logic_vector( 18-1 downto 0 );
    gainoutch2 : out std_logic_vector( 18-1 downto 0 );
    imaglock : out std_logic_vector( 13-1 downto 0 );
    imagout : out std_logic_vector( 18-1 downto 0 );
    imagxord : out std_logic_vector( 1-1 downto 0 );
    lag_out : out std_logic_vector( 32-1 downto 0 );
    locked : out std_logic_vector( 1-1 downto 0 );
    ch1imagout : out std_logic_vector( 18-1 downto 0 );
    ch1realout : out std_logic_vector( 18-1 downto 0 );
    ch2imagout : out std_logic_vector( 18-1 downto 0 );
    ch2realout : out std_logic_vector( 18-1 downto 0 );
    nco_control_out : out std_logic_vector( 22-1 downto 0 );
    phase_detect : out std_logic_vector( 18-1 downto 0 );
    reallock : out std_logic_vector( 13-1 downto 0 );
    realout : out std_logic_vector( 18-1 downto 0 );
    realxord : out std_logic_vector( 1-1 downto 0 )
  );
end complexphasedetector_struct;
architecture structural of complexphasedetector_struct is 
  signal lockimag_s_net : std_logic_vector( 13-1 downto 0 );
  signal ch1imag_net : std_logic_vector( 18-1 downto 0 );
  signal convert1_dout_net_x0 : std_logic_vector( 18-1 downto 0 );
  signal delay1_q_net : std_logic_vector( 18-1 downto 0 );
  signal delay2_q_net : std_logic_vector( 18-1 downto 0 );
  signal lead_coef_net : std_logic_vector( 18-1 downto 0 );
  signal ch1real_net : std_logic_vector( 18-1 downto 0 );
  signal ch1agc_net : std_logic_vector( 12-1 downto 0 );
  signal ch2agc_net : std_logic_vector( 12-1 downto 0 );
  signal ch2real_net : std_logic_vector( 18-1 downto 0 );
  signal gain_ch2_s_net : std_logic_vector( 18-1 downto 0 );
  signal convert_dout_net_x0 : std_logic_vector( 18-1 downto 0 );
  signal negate2_op_net : std_logic_vector( 18-1 downto 0 );
  signal logical1_y_net : std_logic_vector( 1-1 downto 0 );
  signal lag_coef_net : std_logic_vector( 18-1 downto 0 );
  signal negate1_op_net : std_logic_vector( 22-1 downto 0 );
  signal addimags_s_net : std_logic_vector( 18-1 downto 0 );
  signal gain_ch1_s_net : std_logic_vector( 18-1 downto 0 );
  signal lockreal_s_net : std_logic_vector( 13-1 downto 0 );
  signal addreals_s_net : std_logic_vector( 18-1 downto 0 );
  signal logical_y_net : std_logic_vector( 1-1 downto 0 );
  signal logical2_y_net : std_logic_vector( 1-1 downto 0 );
  signal ch2imag_net : std_logic_vector( 18-1 downto 0 );
  signal sweeplmt_net : std_logic_vector( 15-1 downto 0 );
  signal swprate_net : std_logic_vector( 18-1 downto 0 );
  signal reset_net : std_logic_vector( 1-1 downto 0 );
  signal addsub2_s_net : std_logic_vector( 32-1 downto 0 );
  signal constant1_op_net : std_logic_vector( 1-1 downto 0 );
  signal mult_p_net : std_logic_vector( 22-1 downto 0 );
  signal ce_net : std_logic;
  signal mult3_p_net : std_logic_vector( 18-1 downto 0 );
  signal mux6_y_net : std_logic_vector( 18-1 downto 0 );
  signal phase_detect_m_axis_dout_tdata_imag_net : std_logic_vector( 18-1 downto 0 );
  signal mult4_p_net : std_logic_vector( 18-1 downto 0 );
  signal phase_detect_m_axis_dout_tdata_real_net : std_logic_vector( 18-1 downto 0 );
  signal mult2_p_net : std_logic_vector( 18-1 downto 0 );
  signal am_disable_net : std_logic_vector( 1-1 downto 0 );
  signal conju_gate_op_net : std_logic_vector( 18-1 downto 0 );
  signal mux_y_net : std_logic_vector( 18-1 downto 0 );
  signal mux7_y_net_x0 : std_logic_vector( 18-1 downto 0 );
  signal convert_dout_net : std_logic_vector( 18-1 downto 0 );
  signal addsub_s_net : std_logic_vector( 22-1 downto 0 );
  signal convert1_dout_net : std_logic_vector( 18-1 downto 0 );
  signal gainslave : std_logic_vector( 18-1 downto 0 );
  signal mult5_p_net : std_logic_vector( 18-1 downto 0 );
  signal clk_net : std_logic;
  signal constant5_op_net : std_logic_vector( 8-1 downto 0 );
  signal constant6_op_net : std_logic_vector( 8-1 downto 0 );
  signal diffdb_s_net : std_logic_vector( 12-1 downto 0 );
  signal int_offset_mixer_m_axis_dout_tdata_real_net : std_logic_vector( 20-1 downto 0 );
  signal constant9_op_net : std_logic_vector( 8-1 downto 0 );
  signal constant10_op_net : std_logic_vector( 18-1 downto 0 );
  signal constant4_op_net : std_logic_vector( 8-1 downto 0 );
  signal int_offset_mixer_m_axis_dout_tdata_imag_net : std_logic_vector( 20-1 downto 0 );
  signal oneminusslave_s_net : std_logic_vector( 18-1 downto 0 );
  signal int_offset_mixer_m_axis_dout_tvalid_net : std_logic;
  signal mux8_y_net : std_logic_vector( 8-1 downto 0 );
  signal slice2_y_net : std_logic_vector( 1-1 downto 0 );
  signal slice3_y_net : std_logic_vector( 1-1 downto 0 );
  signal mux7_y_net : std_logic_vector( 8-1 downto 0 );
  signal slice1_y_net : std_logic_vector( 1-1 downto 0 );
  signal inverter1_op_net : std_logic;
  signal slice4_y_net : std_logic_vector( 1-1 downto 0 );
  signal slice6_y_net : std_logic_vector( 1-1 downto 0 );
  signal slice7_y_net : std_logic_vector( 1-1 downto 0 );
  signal slice_y_net : std_logic_vector( 14-1 downto 0 );
  signal saturatemultx4_p_net : std_logic_vector( 18-1 downto 0 );
  signal phase_detect_m_axis_dout_tvalid_net : std_logic;
begin
  ch1agc_net <= ch1agc;
  ch1imag_net <= ch1imag;
  ch1real_net <= ch1real;
  ch2agc_net <= ch2agc;
  ch2imag_net <= ch2imag;
  ch2real_net <= ch2real;
  gainoutch1 <= gain_ch1_s_net;
  gainoutch2 <= gain_ch2_s_net;
  imaglock <= lockimag_s_net;
  imagout <= addimags_s_net;
  imagxord <= logical1_y_net;
  lag_coef_net <= lag_coef;
  lag_out <= addsub2_s_net;
  lead_coef_net <= lead_coef;
  locked <= logical2_y_net;
  ch1imagout <= delay2_q_net;
  ch1realout <= delay1_q_net;
  ch2imagout <= convert_dout_net_x0;
  ch2realout <= convert1_dout_net_x0;
  nco_control_out <= negate1_op_net;
  phase_detect <= negate2_op_net;
  reallock <= lockreal_s_net;
  realout <= addreals_s_net;
  realxord <= logical_y_net;
  reset_net <= reset;
  sweeplmt_net <= sweeplmt;
  swprate_net <= swprate;
  am_disable_net <= am_disable;
  clk_net <= clk_1;
  ce_net <= ce_1;
  am_detectors : entity work.complexphasedetector_am_detectors 
  port map (
    ch1real => ch1real_net,
    ch1imag => ch1imag_net,
    ch2real => ch2real_net,
    ch2imag => ch2imag_net,
    squelch => gainslave,
    am_disable => am_disable_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    amerrch1 => mux6_y_net,
    amerrch2 => mux7_y_net_x0
  );
  bipolar_nco : entity work.complexphasedetector_bipolar_nco 
  port map (
    rst => reset_net,
    inc => negate1_op_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    sin => convert1_dout_net,
    cos => convert_dout_net
  );
  cordic_atan : entity work.complexphasedetector_cordic_atan 
  port map (
    imag => phase_detect_m_axis_dout_tdata_imag_net,
    real => phase_detect_m_axis_dout_tdata_real_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    phase => mux_y_net
  );
  limitedaccum : entity work.complexphasedetector_limitedaccum 
  port map (
    limit => sweeplmt_net,
    phaseerr => negate2_op_net,
    locked => logical2_y_net,
    swprate => swprate_net,
    lagcoef => lag_coef_net,
    rst => reset_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    out_x0 => addsub2_s_net
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
  negate1 : entity work.sysgen_negate_eaf184f552 
  port map (
    clr => '0',
    ip => addsub_s_net,
    clk => clk_net,
    ce => ce_net,
    op => negate1_op_net
  );
  negate2 : entity work.sysgen_negate_a4b87081af 
  port map (
    clr => '0',
    ip => mux_y_net,
    clk => clk_net,
    ce => ce_net,
    op => negate2_op_net
  );
  conju_gate : entity work.sysgen_negate_bbc2a275af 
  port map (
    clr => '0',
    ip => convert_dout_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => conju_gate_op_net
  );
  constant1 : entity work.sysgen_constant_5d5481aa29 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant1_op_net
  );
  constant10 : entity work.sysgen_constant_3ab2b05066 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant10_op_net
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
    dout => convert_dout_net_x0
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
    dout => convert1_dout_net_x0
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
    d => ch1real_net,
    clk => clk_net,
    ce => ce_net,
    q => delay1_q_net
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
    d => ch1imag_net,
    clk => clk_net,
    ce => ce_net,
    q => delay2_q_net
  );
  diffdb : entity work.complexphasedetector_xladdsub 
  generic map (
    a_arith => xlSigned,
    a_bin_pt => 11,
    a_width => 12,
    b_arith => xlSigned,
    b_bin_pt => 11,
    b_width => 12,
    c_has_c_out => 0,
    c_latency => 1,
    c_output_width => 13,
    core_name0 => "complexphasedetector_c_addsub_v12_0_i2",
    extra_registers => 0,
    full_s_arith => 2,
    full_s_width => 13,
    latency => 1,
    overflow => 2,
    quantization => 1,
    s_arith => xlSigned,
    s_bin_pt => 11,
    s_width => 12
  )
  port map (
    clr => '0',
    en => "1",
    a => ch1agc_net,
    b => ch2agc_net,
    clk => clk_net,
    ce => ce_net,
    s => diffdb_s_net
  );
  gain_ch1 : entity work.complexphasedetector_xladdsub 
  generic map (
    a_arith => xlUnsigned,
    a_bin_pt => 18,
    a_width => 18,
    b_arith => xlSigned,
    b_bin_pt => 17,
    b_width => 18,
    c_has_c_out => 0,
    c_latency => 0,
    c_output_width => 20,
    core_name0 => "complexphasedetector_c_addsub_v12_0_i3",
    extra_registers => 0,
    full_s_arith => 2,
    full_s_width => 20,
    latency => 0,
    overflow => 2,
    quantization => 1,
    s_arith => xlUnsigned,
    s_bin_pt => 18,
    s_width => 18
  )
  port map (
    clr => '0',
    en => "1",
    a => oneminusslave_s_net,
    b => mux6_y_net,
    clk => clk_net,
    ce => ce_net,
    s => gain_ch1_s_net
  );
  gain_ch2 : entity work.complexphasedetector_xladdsub 
  generic map (
    a_arith => xlUnsigned,
    a_bin_pt => 18,
    a_width => 18,
    b_arith => xlSigned,
    b_bin_pt => 17,
    b_width => 18,
    c_has_c_out => 0,
    c_latency => 0,
    c_output_width => 20,
    core_name0 => "complexphasedetector_c_addsub_v12_0_i3",
    extra_registers => 0,
    full_s_arith => 2,
    full_s_width => 20,
    latency => 0,
    overflow => 2,
    quantization => 1,
    s_arith => xlUnsigned,
    s_bin_pt => 18,
    s_width => 18
  )
  port map (
    clr => '0',
    en => "1",
    a => gainslave,
    b => mux7_y_net_x0,
    clk => clk_net,
    ce => ce_net,
    s => gain_ch2_s_net
  );
  int_offset_mixer : entity work.xlcomplex_multiplier_458514280d5fa9985b41331a92c63bc0 
  port map (
    s_axis_a_tvalid => constant1_op_net(0),
    s_axis_a_tdata_imag => ch2imag_net,
    s_axis_a_tdata_real => ch2real_net,
    s_axis_b_tvalid => constant1_op_net(0),
    s_axis_b_tdata_imag => convert1_dout_net,
    s_axis_b_tdata_real => convert_dout_net,
    rst => inverter1_op_net,
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
    op(0) => inverter1_op_net
  );
  lockimag : entity work.complexphasedetector_xladdsubmode 
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
    core_name0 => "complexphasedetector_c_addsub_v12_0_i4",
    en_arith => xlUnsigned,
    en_bin_pt => 0,
    en_width => 1,
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
    a => lockimag_s_net,
    b => mux7_y_net,
    mode => logical1_y_net,
    en(0) => inverter1_op_net,
    clk => clk_net,
    ce => ce_net,
    s => lockimag_s_net
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
    core_name0 => "complexphasedetector_c_addsub_v12_0_i4",
    en_arith => xlUnsigned,
    en_bin_pt => 0,
    en_width => 1,
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
    a => lockreal_s_net,
    b => mux8_y_net,
    mode => logical_y_net,
    en(0) => inverter1_op_net,
    clk => clk_net,
    ce => ce_net,
    s => lockreal_s_net
  );
  logical : entity work.sysgen_logical_bf479f8f2a 
  port map (
    clr => '0',
    d0 => slice1_y_net,
    d1 => slice2_y_net,
    clk => clk_net,
    ce => ce_net,
    y => logical_y_net
  );
  logical1 : entity work.sysgen_logical_bf479f8f2a 
  port map (
    clr => '0',
    d0 => slice3_y_net,
    d1 => slice4_y_net,
    clk => clk_net,
    ce => ce_net,
    y => logical1_y_net
  );
  logical2 : entity work.sysgen_logical_7f1bdec730 
  port map (
    clr => '0',
    d0 => slice6_y_net,
    d1 => slice7_y_net,
    clk => clk_net,
    ce => ce_net,
    y => logical2_y_net
  );
  mult : entity work.complexphasedetector_xlmult 
  generic map (
    a_arith => xlSigned,
    a_bin_pt => 10,
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
    a => negate2_op_net,
    b => lead_coef_net,
    clk => clk_net,
    ce => ce_net,
    core_clk => clk_net,
    core_ce => ce_net,
    p => mult_p_net
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
    core_name0 => "complexphasedetector_mult_gen_v12_0_i1",
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
    b => gain_ch1_s_net,
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
    core_name0 => "complexphasedetector_mult_gen_v12_0_i1",
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
    b => gain_ch1_s_net,
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
    core_name0 => "complexphasedetector_mult_gen_v12_0_i1",
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
    a => convert1_dout_net_x0,
    b => gain_ch2_s_net,
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
    core_name0 => "complexphasedetector_mult_gen_v12_0_i1",
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
    a => convert_dout_net_x0,
    b => gain_ch2_s_net,
    clk => clk_net,
    ce => ce_net,
    core_clk => clk_net,
    core_ce => ce_net,
    p => mult5_p_net
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
    a => constant10_op_net,
    b => gainslave,
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
    s_axis_b_tdata_real => convert1_dout_net_x0,
    rst => inverter1_op_net,
    clk => clk_net,
    ce => ce_net,
    m_axis_dout_tvalid => phase_detect_m_axis_dout_tvalid_net,
    m_axis_dout_tdata_imag => phase_detect_m_axis_dout_tdata_imag_net,
    m_axis_dout_tdata_real => phase_detect_m_axis_dout_tdata_real_net
  );
  rom : entity work.complexphasedetector_xlsprom 
  generic map (
    c_address_width => 14,
    c_width => 18,
    core_name0 => "complexphasedetector_blk_mem_gen_v8_3_i0",
    latency => 1
  )
  port map (
    en => "1",
    rst => "0",
    addr => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    data => gainslave
  );
  saturatemultx4 : entity work.complexphasedetector_xlcmult 
  generic map (
    a_arith => xlSigned,
    a_bin_pt => 11,
    a_width => 12,
    b_bin_pt => 0,
    c_a_type => 0,
    c_a_width => 12,
    c_b_type => 1,
    c_b_width => 4,
    c_output_width => 16,
    core_name0 => "complexphasedetector_mult_gen_v12_0_i2",
    extra_registers => 0,
    multsign => 2,
    overflow => 2,
    p_arith => xlSigned,
    p_bin_pt => 17,
    p_width => 18,
    quantization => 1,
    zero_const => 0
  )
  port map (
    clr => '0',
    core_clr => '1',
    en => "1",
    rst => "0",
    a => diffdb_s_net,
    clk => clk_net,
    ce => ce_net,
    core_clk => clk_net,
    core_ce => ce_net,
    p => saturatemultx4_p_net
  );
  slice : entity work.complexphasedetector_xlslice 
  generic map (
    new_lsb => 4,
    new_msb => 17,
    x_width => 18,
    y_width => 14
  )
  port map (
    x => saturatemultx4_p_net,
    y => slice_y_net
  );
  slice1 : entity work.complexphasedetector_xlslice 
  generic map (
    new_lsb => 17,
    new_msb => 17,
    x_width => 18,
    y_width => 1
  )
  port map (
    x => delay1_q_net,
    y => slice1_y_net
  );
  slice2 : entity work.complexphasedetector_xlslice 
  generic map (
    new_lsb => 17,
    new_msb => 17,
    x_width => 18,
    y_width => 1
  )
  port map (
    x => convert1_dout_net_x0,
    y => slice2_y_net
  );
  slice3 : entity work.complexphasedetector_xlslice 
  generic map (
    new_lsb => 17,
    new_msb => 17,
    x_width => 18,
    y_width => 1
  )
  port map (
    x => delay2_q_net,
    y => slice3_y_net
  );
  slice4 : entity work.complexphasedetector_xlslice 
  generic map (
    new_lsb => 17,
    new_msb => 17,
    x_width => 18,
    y_width => 1
  )
  port map (
    x => convert_dout_net_x0,
    y => slice4_y_net
  );
  slice6 : entity work.complexphasedetector_xlslice 
  generic map (
    new_lsb => 12,
    new_msb => 12,
    x_width => 13,
    y_width => 1
  )
  port map (
    x => lockreal_s_net,
    y => slice6_y_net
  );
  slice7 : entity work.complexphasedetector_xlslice 
  generic map (
    new_lsb => 12,
    new_msb => 12,
    x_width => 13,
    y_width => 1
  )
  port map (
    x => lockimag_s_net,
    y => slice7_y_net
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
    ch1agc : in std_logic_vector( 12-1 downto 0 );
    ch1imag : in std_logic_vector( 18-1 downto 0 );
    ch1real : in std_logic_vector( 18-1 downto 0 );
    ch2agc : in std_logic_vector( 12-1 downto 0 );
    ch2imag : in std_logic_vector( 18-1 downto 0 );
    ch2real : in std_logic_vector( 18-1 downto 0 );
    lag_coef : in std_logic_vector( 18-1 downto 0 );
    lead_coef : in std_logic_vector( 18-1 downto 0 );
    reset : in std_logic;
    sweeplmt : in std_logic_vector( 15-1 downto 0 );
    swprate : in std_logic_vector( 18-1 downto 0 );
    am_disable : in std_logic;
    clk : in std_logic;
    gainoutch1 : out std_logic_vector( 18-1 downto 0 );
    gainoutch2 : out std_logic_vector( 18-1 downto 0 );
    imaglock : out std_logic_vector( 13-1 downto 0 );
    imagout : out std_logic_vector( 18-1 downto 0 );
    imagxord : out std_logic;
    lag_out : out std_logic_vector( 32-1 downto 0 );
    locked : out std_logic;
    ch1imagout : out std_logic_vector( 18-1 downto 0 );
    ch1realout : out std_logic_vector( 18-1 downto 0 );
    ch2imagout : out std_logic_vector( 18-1 downto 0 );
    ch2realout : out std_logic_vector( 18-1 downto 0 );
    nco_control_out : out std_logic_vector( 22-1 downto 0 );
    phase_detect : out std_logic_vector( 18-1 downto 0 );
    reallock : out std_logic_vector( 13-1 downto 0 );
    realout : out std_logic_vector( 18-1 downto 0 );
    realxord : out std_logic
  );
end complexphasedetector;
architecture structural of complexphasedetector is 
  attribute core_generation_info : string;
  attribute core_generation_info of structural : architecture is "complexphasedetector,sysgen_core_2017_2,{,compilation=IP Catalog,block_icon_display=Default,family=kintex7,part=xc7k325t,speed=-2,package=fbg676,synthesis_language=vhdl,hdl_library=work,synthesis_strategy=Vivado Synthesis Defaults,implementation_strategy=Vivado Implementation Defaults,testbench=0,interface_doc=1,ce_clr=0,clock_period=21.4286,system_simulink_period=2.14286e-08,waveform_viewer=0,axilite_interface=0,ip_catalog_plugin=0,hwcosim_burst_mode=0,simulation_time=0.1,abs=4,accum=3,addsub=98,assert=1,cmpy_v6_0=2,cmult=1,concat=1,constant=44,convert=5,delay=11,inv=30,logical=9,mult=8,mux=24,negate=9,reinterpret=3,relational=6,shift=63,slice=46,sprom=2,}";
  signal clk_1_net : std_logic;
  signal ce_1_net : std_logic;
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
    lag_coef => lag_coef,
    lead_coef => lead_coef,
    reset(0) => reset,
    sweeplmt => sweeplmt,
    swprate => swprate,
    am_disable(0) => am_disable,
    clk_1 => clk_1_net,
    ce_1 => ce_1_net,
    gainoutch1 => gainoutch1,
    gainoutch2 => gainoutch2,
    imaglock => imaglock,
    imagout => imagout,
    imagxord(0) => imagxord,
    lag_out => lag_out,
    locked(0) => locked,
    ch1imagout => ch1imagout,
    ch1realout => ch1realout,
    ch2imagout => ch2imagout,
    ch2realout => ch2realout,
    nco_control_out => nco_control_out,
    phase_detect => phase_detect,
    reallock => reallock,
    realout => realout,
    realxord(0) => realxord
  );
end structural;
