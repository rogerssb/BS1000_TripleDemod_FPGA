-- Generated from Simulink block Brik1/FrontEnd/Aliasing_DDC/fir_lpf
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity frontend_fir_lpf is
  port (
    data_in : in std_logic_vector( 18-1 downto 0 );
    en : in std_logic_vector( 1-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    data_out : out std_logic_vector( 18-1 downto 0 )
  );
end frontend_fir_lpf;
architecture structural of frontend_fir_lpf is 
  signal constant12_op_net : std_logic_vector( 18-1 downto 0 );
  signal constant13_op_net : std_logic_vector( 18-1 downto 0 );
  signal add3_s_net : std_logic_vector( 37-1 downto 0 );
  signal delay2_q_net : std_logic_vector( 36-1 downto 0 );
  signal constant1_op_net : std_logic_vector( 18-1 downto 0 );
  signal constant14_op_net : std_logic_vector( 18-1 downto 0 );
  signal mult0_p_net : std_logic_vector( 36-1 downto 0 );
  signal constant_op_net : std_logic_vector( 18-1 downto 0 );
  signal constant15_op_net : std_logic_vector( 18-1 downto 0 );
  signal mult1_p_net : std_logic_vector( 36-1 downto 0 );
  signal constant3_op_net : std_logic_vector( 18-1 downto 0 );
  signal constant2_op_net : std_logic_vector( 18-1 downto 0 );
  signal add5_s_net : std_logic_vector( 18-1 downto 0 );
  signal ce_net : std_logic;
  signal mux2_y_net : std_logic_vector( 18-1 downto 0 );
  signal add4_s_net : std_logic_vector( 38-1 downto 0 );
  signal add2_s_net : std_logic_vector( 19-1 downto 0 );
  signal accumulator_q_net : std_logic_vector( 42-1 downto 0 );
  signal mux1_y_net : std_logic_vector( 18-1 downto 0 );
  signal mux5_y_net : std_logic_vector( 18-1 downto 0 );
  signal delay3_q_net : std_logic_vector( 1-1 downto 0 );
  signal add0_s_net : std_logic_vector( 19-1 downto 0 );
  signal clk_net : std_logic;
  signal prei : std_logic_vector( 18-1 downto 0 );
  signal add1_s_net : std_logic_vector( 19-1 downto 0 );
  signal main_valid : std_logic_vector( 1-1 downto 0 );
  signal mux3_y_net : std_logic_vector( 18-1 downto 0 );
  signal mux0_y_net : std_logic_vector( 18-1 downto 0 );
  signal mux4_y_net : std_logic_vector( 18-1 downto 0 );
  signal value12_q_net : std_logic_vector( 18-1 downto 0 );
  signal value13_q_net : std_logic_vector( 18-1 downto 0 );
  signal value14_q_net : std_logic_vector( 18-1 downto 0 );
  signal value7_q_net : std_logic_vector( 18-1 downto 0 );
  signal value6_q_net : std_logic_vector( 18-1 downto 0 );
  signal value15_q_net : std_logic_vector( 18-1 downto 0 );
  signal value1_q_net : std_logic_vector( 18-1 downto 0 );
  signal value3_q_net : std_logic_vector( 18-1 downto 0 );
  signal value9_q_net : std_logic_vector( 18-1 downto 0 );
  signal value11_q_net : std_logic_vector( 18-1 downto 0 );
  signal value10_q_net : std_logic_vector( 18-1 downto 0 );
  signal mux7_y_net : std_logic_vector( 18-1 downto 0 );
  signal value2_q_net : std_logic_vector( 18-1 downto 0 );
  signal value4_q_net : std_logic_vector( 18-1 downto 0 );
  signal value8_q_net : std_logic_vector( 18-1 downto 0 );
  signal value0_q_net : std_logic_vector( 18-1 downto 0 );
  signal value5_q_net : std_logic_vector( 18-1 downto 0 );
  signal value16_q_net : std_logic_vector( 18-1 downto 0 );
  signal value21_q_net : std_logic_vector( 18-1 downto 0 );
  signal value17_q_net : std_logic_vector( 18-1 downto 0 );
  signal value19_q_net : std_logic_vector( 18-1 downto 0 );
  signal value18_q_net : std_logic_vector( 18-1 downto 0 );
  signal value23_q_net : std_logic_vector( 18-1 downto 0 );
  signal value20_q_net : std_logic_vector( 18-1 downto 0 );
  signal value22_q_net : std_logic_vector( 18-1 downto 0 );
  signal inverter_op_net : std_logic_vector( 2-1 downto 0 );
  signal delay1_q_net : std_logic_vector( 1-1 downto 0 );
  signal constant6_op_net : std_logic_vector( 18-1 downto 0 );
  signal constant4_op_net : std_logic_vector( 18-1 downto 0 );
  signal constant5_op_net : std_logic_vector( 18-1 downto 0 );
  signal counter_op_net : std_logic_vector( 2-1 downto 0 );
  signal constant7_op_net : std_logic_vector( 18-1 downto 0 );
  signal delay0_q_net : std_logic_vector( 18-1 downto 0 );
  signal mult2_p_net : std_logic_vector( 36-1 downto 0 );
  signal mux6_y_net : std_logic_vector( 18-1 downto 0 );
  signal mux8_y_net : std_logic_vector( 18-1 downto 0 );
begin
  data_out <= add5_s_net;
  prei <= data_in;
  main_valid <= en;
  clk_net <= clk_1;
  ce_net <= ce_1;
  accumulator : entity xil_defaultlib.sysgen_accum_9e3ded01b0 
  port map (
    clr => '0',
    b => add4_s_net,
    rst => delay3_q_net,
    clk => clk_net,
    ce => ce_net,
    q => accumulator_q_net
  );
  add0 : entity xil_defaultlib.frontend_xladdsub 
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
    core_name0 => "frontend_c_addsub_v12_0_i0",
    extra_registers => 0,
    full_s_arith => 2,
    full_s_width => 19,
    latency => 1,
    overflow => 1,
    quantization => 1,
    s_arith => xlSigned,
    s_bin_pt => 17,
    s_width => 19
  )
  port map (
    clr => '0',
    en => "1",
    a => mux0_y_net,
    b => mux5_y_net,
    clk => clk_net,
    ce => ce_net,
    s => add0_s_net
  );
  add1 : entity xil_defaultlib.frontend_xladdsub 
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
    core_name0 => "frontend_c_addsub_v12_0_i0",
    extra_registers => 0,
    full_s_arith => 2,
    full_s_width => 19,
    latency => 1,
    overflow => 1,
    quantization => 1,
    s_arith => xlSigned,
    s_bin_pt => 17,
    s_width => 19
  )
  port map (
    clr => '0',
    en => "1",
    a => mux2_y_net,
    b => mux3_y_net,
    clk => clk_net,
    ce => ce_net,
    s => add1_s_net
  );
  add2 : entity xil_defaultlib.frontend_xladdsub 
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
    core_name0 => "frontend_c_addsub_v12_0_i0",
    extra_registers => 0,
    full_s_arith => 2,
    full_s_width => 19,
    latency => 1,
    overflow => 1,
    quantization => 1,
    s_arith => xlSigned,
    s_bin_pt => 17,
    s_width => 19
  )
  port map (
    clr => '0',
    en => "1",
    a => mux1_y_net,
    b => mux4_y_net,
    clk => clk_net,
    ce => ce_net,
    s => add2_s_net
  );
  add3 : entity xil_defaultlib.frontend_xladdsub 
  generic map (
    a_arith => xlSigned,
    a_bin_pt => 34,
    a_width => 36,
    b_arith => xlSigned,
    b_bin_pt => 34,
    b_width => 36,
    c_has_c_out => 0,
    c_latency => 1,
    c_output_width => 37,
    core_name0 => "frontend_c_addsub_v12_0_i1",
    extra_registers => 0,
    full_s_arith => 2,
    full_s_width => 37,
    latency => 1,
    overflow => 1,
    quantization => 1,
    s_arith => xlSigned,
    s_bin_pt => 34,
    s_width => 37
  )
  port map (
    clr => '0',
    en => "1",
    a => mult0_p_net,
    b => mult1_p_net,
    clk => clk_net,
    ce => ce_net,
    s => add3_s_net
  );
  add4 : entity xil_defaultlib.frontend_xladdsub 
  generic map (
    a_arith => xlSigned,
    a_bin_pt => 34,
    a_width => 37,
    b_arith => xlSigned,
    b_bin_pt => 34,
    b_width => 36,
    c_has_c_out => 0,
    c_latency => 1,
    c_output_width => 38,
    core_name0 => "frontend_c_addsub_v12_0_i2",
    extra_registers => 0,
    full_s_arith => 2,
    full_s_width => 38,
    latency => 1,
    overflow => 1,
    quantization => 1,
    s_arith => xlSigned,
    s_bin_pt => 34,
    s_width => 38
  )
  port map (
    clr => '0',
    en => "1",
    a => add3_s_net,
    b => delay2_q_net,
    clk => clk_net,
    ce => ce_net,
    s => add4_s_net
  );
  add5 : entity xil_defaultlib.frontend_xladdsub 
  generic map (
    a_arith => xlSigned,
    a_bin_pt => 34,
    a_width => 38,
    b_arith => xlSigned,
    b_bin_pt => 34,
    b_width => 42,
    c_has_c_out => 0,
    c_latency => 1,
    c_output_width => 43,
    core_name0 => "frontend_c_addsub_v12_0_i3",
    en_arith => xlUnsigned,
    en_bin_pt => 0,
    en_width => 1,
    extra_registers => 0,
    full_s_arith => 2,
    full_s_width => 43,
    latency => 1,
    overflow => 2,
    quantization => 1,
    s_arith => xlSigned,
    s_bin_pt => 17,
    s_width => 18
  )
  port map (
    clr => '0',
    a => add4_s_net,
    b => accumulator_q_net,
    en => delay3_q_net,
    clk => clk_net,
    ce => ce_net,
    s => add5_s_net
  );
  constant_x0 : entity xil_defaultlib.sysgen_constant_6a04308a9b 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  constant1 : entity xil_defaultlib.sysgen_constant_2eadb880f5 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant1_op_net
  );
  constant12 : entity xil_defaultlib.sysgen_constant_c26b5d60ed 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant12_op_net
  );
  constant13 : entity xil_defaultlib.sysgen_constant_10929a1ffa 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant13_op_net
  );
  constant14 : entity xil_defaultlib.sysgen_constant_07cc095b94 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant14_op_net
  );
  constant15 : entity xil_defaultlib.sysgen_constant_9ec440c311 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant15_op_net
  );
  constant2 : entity xil_defaultlib.sysgen_constant_5ec307621b 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant2_op_net
  );
  constant3 : entity xil_defaultlib.sysgen_constant_980fd0b8bd 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant3_op_net
  );
  constant4 : entity xil_defaultlib.sysgen_constant_6736b7f63f 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant4_op_net
  );
  constant5 : entity xil_defaultlib.sysgen_constant_4d36332c7d 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant5_op_net
  );
  constant6 : entity xil_defaultlib.sysgen_constant_0450854bc5 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant6_op_net
  );
  constant7 : entity xil_defaultlib.sysgen_constant_0fc6acb41c 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant7_op_net
  );
  counter : entity xil_defaultlib.frontend_xlcounter_free 
  generic map (
    core_name0 => "frontend_c_counter_binary_v12_0_i0",
    op_arith => xlUnsigned,
    op_width => 2
  )
  port map (
    en => "1",
    clr => '0',
    rst => delay1_q_net,
    clk => clk_net,
    ce => ce_net,
    op => counter_op_net
  );
  delay0 : entity xil_defaultlib.frontend_xldelay 
  generic map (
    latency => 1,
    reg_retiming => 0,
    reset => 0,
    width => 18
  )
  port map (
    en => '1',
    rst => '1',
    d => prei,
    clk => clk_net,
    ce => ce_net,
    q => delay0_q_net
  );
  delay1 : entity xil_defaultlib.frontend_xldelay 
  generic map (
    latency => 1,
    reg_retiming => 0,
    reset => 0,
    width => 1
  )
  port map (
    en => '1',
    rst => '1',
    d => main_valid,
    clk => clk_net,
    ce => ce_net,
    q => delay1_q_net
  );
  delay2 : entity xil_defaultlib.frontend_xldelay 
  generic map (
    latency => 1,
    reg_retiming => 0,
    reset => 0,
    width => 36
  )
  port map (
    en => '1',
    rst => '1',
    d => mult2_p_net,
    clk => clk_net,
    ce => ce_net,
    q => delay2_q_net
  );
  delay3 : entity xil_defaultlib.frontend_xldelay 
  generic map (
    latency => 4,
    reg_retiming => 0,
    reset => 0,
    width => 1
  )
  port map (
    en => '1',
    rst => '1',
    d => delay1_q_net,
    clk => clk_net,
    ce => ce_net,
    q => delay3_q_net
  );
  inverter : entity xil_defaultlib.sysgen_inverter_7bf756273a 
  port map (
    clr => '0',
    ip => counter_op_net,
    clk => clk_net,
    ce => ce_net,
    op => inverter_op_net
  );
  mult0 : entity xil_defaultlib.frontend_xlmult 
  generic map (
    a_arith => xlSigned,
    a_bin_pt => 17,
    a_width => 18,
    b_arith => xlSigned,
    b_bin_pt => 17,
    b_width => 19,
    c_a_type => 0,
    c_a_width => 18,
    c_b_type => 0,
    c_b_width => 19,
    c_baat => 18,
    c_output_width => 37,
    c_type => 0,
    core_name0 => "frontend_mult_gen_v12_0_i0",
    extra_registers => 0,
    multsign => 2,
    overflow => 1,
    p_arith => xlSigned,
    p_bin_pt => 34,
    p_width => 36,
    quantization => 1
  )
  port map (
    clr => '0',
    core_clr => '1',
    en => "1",
    rst => "0",
    a => mux6_y_net,
    b => add0_s_net,
    clk => clk_net,
    ce => ce_net,
    core_clk => clk_net,
    core_ce => ce_net,
    p => mult0_p_net
  );
  mult1 : entity xil_defaultlib.frontend_xlmult 
  generic map (
    a_arith => xlSigned,
    a_bin_pt => 17,
    a_width => 18,
    b_arith => xlSigned,
    b_bin_pt => 17,
    b_width => 19,
    c_a_type => 0,
    c_a_width => 18,
    c_b_type => 0,
    c_b_width => 19,
    c_baat => 18,
    c_output_width => 37,
    c_type => 0,
    core_name0 => "frontend_mult_gen_v12_0_i0",
    extra_registers => 0,
    multsign => 2,
    overflow => 1,
    p_arith => xlSigned,
    p_bin_pt => 34,
    p_width => 36,
    quantization => 1
  )
  port map (
    clr => '0',
    core_clr => '1',
    en => "1",
    rst => "0",
    a => mux8_y_net,
    b => add1_s_net,
    clk => clk_net,
    ce => ce_net,
    core_clk => clk_net,
    core_ce => ce_net,
    p => mult1_p_net
  );
  mult2 : entity xil_defaultlib.frontend_xlmult 
  generic map (
    a_arith => xlSigned,
    a_bin_pt => 17,
    a_width => 18,
    b_arith => xlSigned,
    b_bin_pt => 17,
    b_width => 19,
    c_a_type => 0,
    c_a_width => 18,
    c_b_type => 0,
    c_b_width => 19,
    c_baat => 18,
    c_output_width => 37,
    c_type => 0,
    core_name0 => "frontend_mult_gen_v12_0_i0",
    extra_registers => 0,
    multsign => 2,
    overflow => 1,
    p_arith => xlSigned,
    p_bin_pt => 34,
    p_width => 36,
    quantization => 1
  )
  port map (
    clr => '0',
    core_clr => '1',
    en => "1",
    rst => "0",
    a => mux7_y_net,
    b => add2_s_net,
    clk => clk_net,
    ce => ce_net,
    core_clk => clk_net,
    core_ce => ce_net,
    p => mult2_p_net
  );
  mux0 : entity xil_defaultlib.sysgen_mux_0d3a94691d 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    sel => counter_op_net,
    d0 => value0_q_net,
    d1 => value1_q_net,
    d2 => value2_q_net,
    d3 => value3_q_net,
    y => mux0_y_net
  );
  mux1 : entity xil_defaultlib.sysgen_mux_0d3a94691d 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    sel => counter_op_net,
    d0 => value4_q_net,
    d1 => value5_q_net,
    d2 => value6_q_net,
    d3 => value7_q_net,
    y => mux1_y_net
  );
  mux2 : entity xil_defaultlib.sysgen_mux_0d3a94691d 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    sel => counter_op_net,
    d0 => value8_q_net,
    d1 => value9_q_net,
    d2 => value10_q_net,
    d3 => value11_q_net,
    y => mux2_y_net
  );
  mux3 : entity xil_defaultlib.sysgen_mux_0d3a94691d 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    sel => inverter_op_net,
    d0 => value12_q_net,
    d1 => value13_q_net,
    d2 => value14_q_net,
    d3 => value15_q_net,
    y => mux3_y_net
  );
  mux4 : entity xil_defaultlib.sysgen_mux_0d3a94691d 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    sel => inverter_op_net,
    d0 => value16_q_net,
    d1 => value17_q_net,
    d2 => value18_q_net,
    d3 => value19_q_net,
    y => mux4_y_net
  );
  mux5 : entity xil_defaultlib.sysgen_mux_0d3a94691d 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    sel => inverter_op_net,
    d0 => value20_q_net,
    d1 => value21_q_net,
    d2 => value22_q_net,
    d3 => value23_q_net,
    y => mux5_y_net
  );
  mux6 : entity xil_defaultlib.sysgen_mux_045330a157 
  port map (
    clr => '0',
    sel => counter_op_net,
    d0 => constant_op_net,
    d1 => constant1_op_net,
    d2 => constant2_op_net,
    d3 => constant3_op_net,
    clk => clk_net,
    ce => ce_net,
    y => mux6_y_net
  );
  mux7 : entity xil_defaultlib.sysgen_mux_045330a157 
  port map (
    clr => '0',
    sel => counter_op_net,
    d0 => constant4_op_net,
    d1 => constant5_op_net,
    d2 => constant6_op_net,
    d3 => constant7_op_net,
    clk => clk_net,
    ce => ce_net,
    y => mux7_y_net
  );
  mux8 : entity xil_defaultlib.sysgen_mux_045330a157 
  port map (
    clr => '0',
    sel => counter_op_net,
    d0 => constant12_op_net,
    d1 => constant13_op_net,
    d2 => constant14_op_net,
    d3 => constant15_op_net,
    clk => clk_net,
    ce => ce_net,
    y => mux8_y_net
  );
  value0 : entity xil_defaultlib.frontend_xlregister 
  generic map (
    d_width => 18,
    init_value => b"000000000000000000"
  )
  port map (
    rst => "0",
    d => delay0_q_net,
    en => delay1_q_net,
    clk => clk_net,
    ce => ce_net,
    q => value0_q_net
  );
  value1 : entity xil_defaultlib.frontend_xlregister 
  generic map (
    d_width => 18,
    init_value => b"000000000000000000"
  )
  port map (
    rst => "0",
    d => value0_q_net,
    en => delay1_q_net,
    clk => clk_net,
    ce => ce_net,
    q => value1_q_net
  );
  value10 : entity xil_defaultlib.frontend_xlregister 
  generic map (
    d_width => 18,
    init_value => b"000000000000000000"
  )
  port map (
    rst => "0",
    d => value9_q_net,
    en => delay1_q_net,
    clk => clk_net,
    ce => ce_net,
    q => value10_q_net
  );
  value11 : entity xil_defaultlib.frontend_xlregister 
  generic map (
    d_width => 18,
    init_value => b"000000000000000000"
  )
  port map (
    rst => "0",
    d => value10_q_net,
    en => delay1_q_net,
    clk => clk_net,
    ce => ce_net,
    q => value11_q_net
  );
  value12 : entity xil_defaultlib.frontend_xlregister 
  generic map (
    d_width => 18,
    init_value => b"000000000000000000"
  )
  port map (
    rst => "0",
    d => value11_q_net,
    en => delay1_q_net,
    clk => clk_net,
    ce => ce_net,
    q => value12_q_net
  );
  value13 : entity xil_defaultlib.frontend_xlregister 
  generic map (
    d_width => 18,
    init_value => b"000000000000000000"
  )
  port map (
    rst => "0",
    d => value12_q_net,
    en => delay1_q_net,
    clk => clk_net,
    ce => ce_net,
    q => value13_q_net
  );
  value14 : entity xil_defaultlib.frontend_xlregister 
  generic map (
    d_width => 18,
    init_value => b"000000000000000000"
  )
  port map (
    rst => "0",
    d => value13_q_net,
    en => delay1_q_net,
    clk => clk_net,
    ce => ce_net,
    q => value14_q_net
  );
  value15 : entity xil_defaultlib.frontend_xlregister 
  generic map (
    d_width => 18,
    init_value => b"000000000000000000"
  )
  port map (
    rst => "0",
    d => value14_q_net,
    en => delay1_q_net,
    clk => clk_net,
    ce => ce_net,
    q => value15_q_net
  );
  value16 : entity xil_defaultlib.frontend_xlregister 
  generic map (
    d_width => 18,
    init_value => b"000000000000000000"
  )
  port map (
    rst => "0",
    d => value15_q_net,
    en => delay1_q_net,
    clk => clk_net,
    ce => ce_net,
    q => value16_q_net
  );
  value17 : entity xil_defaultlib.frontend_xlregister 
  generic map (
    d_width => 18,
    init_value => b"000000000000000000"
  )
  port map (
    rst => "0",
    d => value16_q_net,
    en => delay1_q_net,
    clk => clk_net,
    ce => ce_net,
    q => value17_q_net
  );
  value18 : entity xil_defaultlib.frontend_xlregister 
  generic map (
    d_width => 18,
    init_value => b"000000000000000000"
  )
  port map (
    rst => "0",
    d => value17_q_net,
    en => delay1_q_net,
    clk => clk_net,
    ce => ce_net,
    q => value18_q_net
  );
  value19 : entity xil_defaultlib.frontend_xlregister 
  generic map (
    d_width => 18,
    init_value => b"000000000000000000"
  )
  port map (
    rst => "0",
    d => value18_q_net,
    en => delay1_q_net,
    clk => clk_net,
    ce => ce_net,
    q => value19_q_net
  );
  value2 : entity xil_defaultlib.frontend_xlregister 
  generic map (
    d_width => 18,
    init_value => b"000000000000000000"
  )
  port map (
    rst => "0",
    d => value1_q_net,
    en => delay1_q_net,
    clk => clk_net,
    ce => ce_net,
    q => value2_q_net
  );
  value20 : entity xil_defaultlib.frontend_xlregister 
  generic map (
    d_width => 18,
    init_value => b"000000000000000000"
  )
  port map (
    rst => "0",
    d => value19_q_net,
    en => delay1_q_net,
    clk => clk_net,
    ce => ce_net,
    q => value20_q_net
  );
  value21 : entity xil_defaultlib.frontend_xlregister 
  generic map (
    d_width => 18,
    init_value => b"000000000000000000"
  )
  port map (
    rst => "0",
    d => value20_q_net,
    en => delay1_q_net,
    clk => clk_net,
    ce => ce_net,
    q => value21_q_net
  );
  value22 : entity xil_defaultlib.frontend_xlregister 
  generic map (
    d_width => 18,
    init_value => b"000000000000000000"
  )
  port map (
    rst => "0",
    d => value21_q_net,
    en => delay1_q_net,
    clk => clk_net,
    ce => ce_net,
    q => value22_q_net
  );
  value23 : entity xil_defaultlib.frontend_xlregister 
  generic map (
    d_width => 18,
    init_value => b"000000000000000000"
  )
  port map (
    rst => "0",
    d => value22_q_net,
    en => delay1_q_net,
    clk => clk_net,
    ce => ce_net,
    q => value23_q_net
  );
  value3 : entity xil_defaultlib.frontend_xlregister 
  generic map (
    d_width => 18,
    init_value => b"000000000000000000"
  )
  port map (
    rst => "0",
    d => value2_q_net,
    en => delay1_q_net,
    clk => clk_net,
    ce => ce_net,
    q => value3_q_net
  );
  value4 : entity xil_defaultlib.frontend_xlregister 
  generic map (
    d_width => 18,
    init_value => b"000000000000000000"
  )
  port map (
    rst => "0",
    d => value3_q_net,
    en => delay1_q_net,
    clk => clk_net,
    ce => ce_net,
    q => value4_q_net
  );
  value5 : entity xil_defaultlib.frontend_xlregister 
  generic map (
    d_width => 18,
    init_value => b"000000000000000000"
  )
  port map (
    rst => "0",
    d => value4_q_net,
    en => delay1_q_net,
    clk => clk_net,
    ce => ce_net,
    q => value5_q_net
  );
  value6 : entity xil_defaultlib.frontend_xlregister 
  generic map (
    d_width => 18,
    init_value => b"000000000000000000"
  )
  port map (
    rst => "0",
    d => value5_q_net,
    en => delay1_q_net,
    clk => clk_net,
    ce => ce_net,
    q => value6_q_net
  );
  value7 : entity xil_defaultlib.frontend_xlregister 
  generic map (
    d_width => 18,
    init_value => b"000000000000000000"
  )
  port map (
    rst => "0",
    d => value6_q_net,
    en => delay1_q_net,
    clk => clk_net,
    ce => ce_net,
    q => value7_q_net
  );
  value8 : entity xil_defaultlib.frontend_xlregister 
  generic map (
    d_width => 18,
    init_value => b"000000000000000000"
  )
  port map (
    rst => "0",
    d => value7_q_net,
    en => delay1_q_net,
    clk => clk_net,
    ce => ce_net,
    q => value8_q_net
  );
  value9 : entity xil_defaultlib.frontend_xlregister 
  generic map (
    d_width => 18,
    init_value => b"000000000000000000"
  )
  port map (
    rst => "0",
    d => value8_q_net,
    en => delay1_q_net,
    clk => clk_net,
    ce => ce_net,
    q => value9_q_net
  );
end structural;
-- Generated from Simulink block Brik1/FrontEnd/Aliasing_DDC
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity frontend_aliasing_ddc is
  port (
    valid_in : in std_logic_vector( 1-1 downto 0 );
    signal_in : in std_logic_vector( 18-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    valid_out : out std_logic_vector( 1-1 downto 0 );
    out_r : out std_logic_vector( 18-1 downto 0 );
    out_i : out std_logic_vector( 18-1 downto 0 )
  );
end frontend_aliasing_ddc;
architecture structural of frontend_aliasing_ddc is 
  signal delay0_q_net : std_logic_vector( 18-1 downto 0 );
  signal prei : std_logic_vector( 18-1 downto 0 );
  signal postr : std_logic_vector( 18-1 downto 0 );
  signal ce_net : std_logic;
  signal delay4_q_net : std_logic_vector( 18-1 downto 0 );
  signal delay3_q_net : std_logic_vector( 18-1 downto 0 );
  signal a2d_data_net : std_logic_vector( 18-1 downto 0 );
  signal clk_net : std_logic;
  signal counter_op_net : std_logic_vector( 2-1 downto 0 );
  signal delay1_q_net : std_logic_vector( 1-1 downto 0 );
  signal add5_s_net : std_logic_vector( 18-1 downto 0 );
  signal main_valid : std_logic_vector( 1-1 downto 0 );
  signal validin_net : std_logic_vector( 1-1 downto 0 );
  signal inverter_op_net : std_logic_vector( 1-1 downto 0 );
  signal imag_y_net : std_logic_vector( 18-1 downto 0 );
  signal prer : std_logic_vector( 18-1 downto 0 );
  signal lsb_y_net : std_logic_vector( 1-1 downto 0 );
  signal inverter1_op_net : std_logic_vector( 1-1 downto 0 );
  signal msb_y_net : std_logic_vector( 1-1 downto 0 );
  signal negate_op_net : std_logic_vector( 18-1 downto 0 );
begin
  valid_out <= main_valid;
  out_r <= delay3_q_net;
  out_i <= delay4_q_net;
  validin_net <= valid_in;
  a2d_data_net <= signal_in;
  clk_net <= clk_1;
  ce_net <= ce_1;
  fir_lpf : entity xil_defaultlib.frontend_fir_lpf 
  port map (
    data_in => prei,
    en => main_valid,
    clk_1 => clk_net,
    ce_1 => ce_net,
    data_out => add5_s_net
  );
  counter : entity xil_defaultlib.frontend_xlcounter_free 
  generic map (
    core_name0 => "frontend_c_counter_binary_v12_0_i0",
    op_arith => xlUnsigned,
    op_width => 2
  )
  port map (
    rst => "0",
    clr => '0',
    en => delay1_q_net,
    clk => clk_net,
    ce => ce_net,
    op => counter_op_net
  );
  delay0 : entity xil_defaultlib.frontend_xldelay 
  generic map (
    latency => 1,
    reg_retiming => 0,
    reset => 0,
    width => 18
  )
  port map (
    en => '1',
    rst => '1',
    d => a2d_data_net,
    clk => clk_net,
    ce => ce_net,
    q => delay0_q_net
  );
  delay1 : entity xil_defaultlib.frontend_xldelay 
  generic map (
    latency => 1,
    reg_retiming => 0,
    reset => 0,
    width => 1
  )
  port map (
    en => '1',
    rst => '1',
    d => validin_net,
    clk => clk_net,
    ce => ce_net,
    q => delay1_q_net
  );
  delay3 : entity xil_defaultlib.frontend_xldelay 
  generic map (
    latency => 1,
    reg_retiming => 0,
    reset => 0,
    width => 18
  )
  port map (
    rst => '1',
    d => postr,
    en => main_valid(0),
    clk => clk_net,
    ce => ce_net,
    q => delay3_q_net
  );
  delay4 : entity xil_defaultlib.frontend_xldelay 
  generic map (
    latency => 1,
    reg_retiming => 0,
    reset => 0,
    width => 18
  )
  port map (
    rst => '1',
    d => add5_s_net,
    en => main_valid(0),
    clk => clk_net,
    ce => ce_net,
    q => delay4_q_net
  );
  inverter : entity xil_defaultlib.sysgen_inverter_40ff4b71ed 
  port map (
    clr => '0',
    ip => delay1_q_net,
    clk => clk_net,
    ce => ce_net,
    op => inverter_op_net
  );
  inverter1 : entity xil_defaultlib.sysgen_inverter_40ff4b71ed 
  port map (
    clr => '0',
    ip => lsb_y_net,
    clk => clk_net,
    ce => ce_net,
    op => inverter1_op_net
  );
  lsb : entity xil_defaultlib.frontend_xlslice 
  generic map (
    new_lsb => 0,
    new_msb => 0,
    x_width => 2,
    y_width => 1
  )
  port map (
    x => counter_op_net,
    y => lsb_y_net
  );
  logical : entity xil_defaultlib.sysgen_logical_2314974f5f 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    d0 => inverter_op_net,
    d1 => inverter1_op_net,
    y => main_valid
  );
  msb : entity xil_defaultlib.frontend_xlslice 
  generic map (
    new_lsb => 1,
    new_msb => 1,
    x_width => 2,
    y_width => 1
  )
  port map (
    x => counter_op_net,
    y => msb_y_net
  );
  negate : entity xil_defaultlib.sysgen_negate_b61a5d0dad 
  port map (
    clr => '0',
    ip => delay0_q_net,
    clk => clk_net,
    ce => ce_net,
    op => negate_op_net
  );
  data_imag : entity xil_defaultlib.frontend_xlregister 
  generic map (
    d_width => 18,
    init_value => b"000000000000000000"
  )
  port map (
    rst => "0",
    d => imag_y_net,
    en => delay1_q_net,
    clk => clk_net,
    ce => ce_net,
    q => prei
  );
  data_real : entity xil_defaultlib.frontend_xlregister 
  generic map (
    d_width => 18,
    init_value => b"000000000000000000"
  )
  port map (
    rst => "0",
    d => prei,
    en => delay1_q_net,
    clk => clk_net,
    ce => ce_net,
    q => prer
  );
  imag : entity xil_defaultlib.sysgen_mux_a71ba3471e 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    sel => msb_y_net,
    d0 => delay0_q_net,
    d1 => negate_op_net,
    y => imag_y_net
  );
  pass_thru : entity xil_defaultlib.frontend_xldelay 
  generic map (
    latency => 14,
    reg_retiming => 0,
    reset => 0,
    width => 18
  )
  port map (
    rst => '1',
    d => prer,
    en => main_valid(0),
    clk => clk_net,
    ce => ce_net,
    q => postr
  );
end structural;
-- Generated from Simulink block Brik1/FrontEnd/Decim156_175/Address Calculator
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity frontend_address_calculator is
  port (
    calc_next_addr : in std_logic_vector( 1-1 downto 0 );
    data_en : in std_logic_vector( 1-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    skip_data : out std_logic_vector( 1-1 downto 0 );
    addr : out std_logic_vector( 8-1 downto 0 )
  );
end frontend_address_calculator;
architecture structural of frontend_address_calculator is 
  signal mcode1_calc_next_addr_net : std_logic_vector( 1-1 downto 0 );
  signal delay0_q_net : std_logic_vector( 1-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal addr_counter_q_net : std_logic_vector( 8-1 downto 0 );
  signal rollover_q_net : std_logic_vector( 1-1 downto 0 );
  signal down_up_down_1_op_net : std_logic_vector( 8-1 downto 0 );
  signal add4_s_net : std_logic_vector( 9-1 downto 0 );
  signal up_down_op_net : std_logic_vector( 8-1 downto 0 );
  signal inverter_op_net : std_logic_vector( 1-1 downto 0 );
  signal mux6_y_net : std_logic_vector( 8-1 downto 0 );
  signal logical1_y_net : std_logic_vector( 1-1 downto 0 );
  signal compare0_op_net : std_logic_vector( 1-1 downto 0 );
  signal down_up_down_op_net : std_logic_vector( 8-1 downto 0 );
  signal and1_y_net : std_logic_vector( 1-1 downto 0 );
  signal sub0_s_net : std_logic_vector( 9-1 downto 0 );
begin
  skip_data <= rollover_q_net;
  addr <= addr_counter_q_net;
  mcode1_calc_next_addr_net <= calc_next_addr;
  delay0_q_net <= data_en;
  clk_net <= clk_1;
  ce_net <= ce_1;
  add4 : entity xil_defaultlib.frontend_xladdsub 
  generic map (
    a_arith => xlUnsigned,
    a_bin_pt => 0,
    a_width => 8,
    b_arith => xlUnsigned,
    b_bin_pt => 0,
    b_width => 8,
    c_has_c_out => 0,
    c_latency => 0,
    c_output_width => 9,
    core_name0 => "frontend_c_addsub_v12_0_i5",
    extra_registers => 0,
    full_s_arith => 1,
    full_s_width => 9,
    latency => 0,
    overflow => 1,
    quantization => 1,
    s_arith => xlUnsigned,
    s_bin_pt => 0,
    s_width => 9
  )
  port map (
    clr => '0',
    en => "1",
    a => addr_counter_q_net,
    b => up_down_op_net,
    clk => clk_net,
    ce => ce_net,
    s => add4_s_net
  );
  and1 : entity xil_defaultlib.sysgen_logical_760b500db8 
  port map (
    clr => '0',
    d0 => rollover_q_net,
    d1 => delay0_q_net,
    clk => clk_net,
    ce => ce_net,
    y => and1_y_net
  );
  compare0 : entity xil_defaultlib.sysgen_relational_2b3f0d7f8d 
  port map (
    clr => '0',
    a => addr_counter_q_net,
    b => down_up_down_op_net,
    clk => clk_net,
    ce => ce_net,
    op => compare0_op_net
  );
  inverter : entity xil_defaultlib.sysgen_inverter_40ff4b71ed 
  port map (
    clr => '0',
    ip => and1_y_net,
    clk => clk_net,
    ce => ce_net,
    op => inverter_op_net
  );
  logical1 : entity xil_defaultlib.sysgen_logical_2314974f5f 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    d0 => inverter_op_net,
    d1 => mcode1_calc_next_addr_net,
    y => logical1_y_net
  );
  mux6 : entity xil_defaultlib.sysgen_mux_d7301985e7 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    sel => compare0_op_net,
    d0 => add4_s_net,
    d1 => sub0_s_net,
    y => mux6_y_net
  );
  sub0 : entity xil_defaultlib.frontend_xladdsub 
  generic map (
    a_arith => xlUnsigned,
    a_bin_pt => 0,
    a_width => 8,
    b_arith => xlUnsigned,
    b_bin_pt => 0,
    b_width => 8,
    c_has_c_out => 0,
    c_latency => 0,
    c_output_width => 9,
    core_name0 => "frontend_c_addsub_v12_0_i6",
    extra_registers => 0,
    full_s_arith => 2,
    full_s_width => 9,
    latency => 0,
    overflow => 1,
    quantization => 1,
    s_arith => xlSigned,
    s_bin_pt => 0,
    s_width => 9
  )
  port map (
    clr => '0',
    en => "1",
    a => addr_counter_q_net,
    b => down_up_down_1_op_net,
    clk => clk_net,
    ce => ce_net,
    s => sub0_s_net
  );
  addr_counter : entity xil_defaultlib.frontend_xlregister 
  generic map (
    d_width => 8,
    init_value => b"00000000"
  )
  port map (
    rst => "0",
    d => mux6_y_net,
    en => logical1_y_net,
    clk => clk_net,
    ce => ce_net,
    q => addr_counter_q_net
  );
  down_up_down : entity xil_defaultlib.sysgen_constant_c59d37e3e9 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => down_up_down_op_net
  );
  down_up_down_1 : entity xil_defaultlib.sysgen_constant_c59d37e3e9 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => down_up_down_1_op_net
  );
  rollover : entity xil_defaultlib.frontend_xlregister 
  generic map (
    d_width => 1,
    init_value => b"0"
  )
  port map (
    d => compare0_op_net,
    rst => and1_y_net,
    en => delay0_q_net,
    clk => clk_net,
    ce => ce_net,
    q => rollover_q_net
  );
  up_down : entity xil_defaultlib.sysgen_constant_5a7d775362 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => up_down_op_net
  );
end structural;
-- Generated from Simulink block Brik1/FrontEnd/Decim156_175
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity frontend_decim156_175 is
  port (
    valid_in : in std_logic_vector( 1-1 downto 0 );
    signal_r : in std_logic_vector( 18-1 downto 0 );
    signal_i : in std_logic_vector( 18-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    valid_out : out std_logic_vector( 1-1 downto 0 );
    signal_out_r : out std_logic_vector( 18-1 downto 0 );
    signal_out_i : out std_logic_vector( 18-1 downto 0 )
  );
end frontend_decim156_175;
architecture structural of frontend_decim156_175 is 
  signal delay8_q_net : std_logic_vector( 18-1 downto 0 );
  signal mult2_p_net : std_logic_vector( 36-1 downto 0 );
  signal main_valid : std_logic_vector( 1-1 downto 0 );
  signal accum1_q_net : std_logic_vector( 40-1 downto 0 );
  signal ce_net : std_logic;
  signal rollover_q_net : std_logic_vector( 1-1 downto 0 );
  signal delay3_q_net : std_logic_vector( 18-1 downto 0 );
  signal accum0_q_net : std_logic_vector( 40-1 downto 0 );
  signal mult1_p_net : std_logic_vector( 36-1 downto 0 );
  signal add0_s_net : std_logic_vector( 37-1 downto 0 );
  signal mcode1_calc_next_addr_net : std_logic_vector( 1-1 downto 0 );
  signal delay5_q_net : std_logic_vector( 1-1 downto 0 );
  signal delay7_q_net : std_logic_vector( 18-1 downto 0 );
  signal delay4_q_net : std_logic_vector( 18-1 downto 0 );
  signal mult0_p_net : std_logic_vector( 36-1 downto 0 );
  signal clk_net : std_logic;
  signal addr_counter_q_net : std_logic_vector( 8-1 downto 0 );
  signal delay6_q_net : std_logic_vector( 1-1 downto 0 );
  signal delay0_q_net : std_logic_vector( 1-1 downto 0 );
  signal add1_s_net : std_logic_vector( 37-1 downto 0 );
  signal delay1_q_net : std_logic_vector( 18-1 downto 0 );
  signal mult3_p_net : std_logic_vector( 36-1 downto 0 );
  signal delay3_q_net_x0 : std_logic_vector( 2-1 downto 0 );
  signal add2_s_net : std_logic_vector( 18-1 downto 0 );
  signal and0_y_net : std_logic_vector( 1-1 downto 0 );
  signal mcode1_mux_sel_net : std_logic_vector( 2-1 downto 0 );
  signal constant_op_net : std_logic_vector( 1-1 downto 0 );
  signal inverter_op_net : std_logic_vector( 1-1 downto 0 );
  signal delay2_q_net : std_logic_vector( 18-1 downto 0 );
  signal add3_s_net : std_logic_vector( 18-1 downto 0 );
  signal constant1_op_net : std_logic_vector( 18-1 downto 0 );
  signal delay4_q_net_x0 : std_logic_vector( 1-1 downto 0 );
  signal mux4_y_net : std_logic_vector( 18-1 downto 0 );
  signal mux0_y_net : std_logic_vector( 18-1 downto 0 );
  signal value2_q_net : std_logic_vector( 18-1 downto 0 );
  signal value4_q_net : std_logic_vector( 18-1 downto 0 );
  signal mux2_y_net : std_logic_vector( 18-1 downto 0 );
  signal value8_q_net : std_logic_vector( 18-1 downto 0 );
  signal value0_q_net : std_logic_vector( 18-1 downto 0 );
  signal mux1_y_net : std_logic_vector( 18-1 downto 0 );
  signal value6_q_net : std_logic_vector( 18-1 downto 0 );
  signal value7_q_net : std_logic_vector( 18-1 downto 0 );
  signal value1_q_net : std_logic_vector( 18-1 downto 0 );
  signal value5_q_net : std_logic_vector( 18-1 downto 0 );
  signal mux3_y_net : std_logic_vector( 18-1 downto 0 );
  signal value3_q_net : std_logic_vector( 18-1 downto 0 );
  signal mux5_y_net : std_logic_vector( 18-1 downto 0 );
  signal coeff1_q_net : std_logic_vector( 18-1 downto 0 );
  signal coeff6_q_net : std_logic_vector( 18-1 downto 0 );
  signal value10_q_net : std_logic_vector( 18-1 downto 0 );
  signal value9_q_net : std_logic_vector( 18-1 downto 0 );
  signal single_port_ram_data_out_net : std_logic_vector( 18-1 downto 0 );
  signal value15_q_net : std_logic_vector( 18-1 downto 0 );
  signal value12_q_net : std_logic_vector( 18-1 downto 0 );
  signal value14_q_net : std_logic_vector( 18-1 downto 0 );
  signal coeff0_q_net : std_logic_vector( 18-1 downto 0 );
  signal coeff4_q_net : std_logic_vector( 18-1 downto 0 );
  signal coeff5_q_net : std_logic_vector( 18-1 downto 0 );
  signal coeff7_q_net : std_logic_vector( 18-1 downto 0 );
  signal value11_q_net : std_logic_vector( 18-1 downto 0 );
  signal value13_q_net : std_logic_vector( 18-1 downto 0 );
  signal coeff3_q_net : std_logic_vector( 18-1 downto 0 );
  signal coeff2_q_net : std_logic_vector( 18-1 downto 0 );
  signal single_port_ram1_data_out_net : std_logic_vector( 18-1 downto 0 );
  signal single_port_ram3_data_out_net : std_logic_vector( 18-1 downto 0 );
  signal single_port_ram2_data_out_net : std_logic_vector( 18-1 downto 0 );
  signal single_port_ram7_data_out_net : std_logic_vector( 18-1 downto 0 );
  signal single_port_ram4_data_out_net : std_logic_vector( 18-1 downto 0 );
  signal single_port_ram6_data_out_net : std_logic_vector( 18-1 downto 0 );
  signal single_port_ram5_data_out_net : std_logic_vector( 18-1 downto 0 );
begin
  valid_out <= delay6_q_net;
  signal_out_r <= delay8_q_net;
  signal_out_i <= delay7_q_net;
  main_valid <= valid_in;
  delay3_q_net <= signal_r;
  delay4_q_net <= signal_i;
  clk_net <= clk_1;
  ce_net <= ce_1;
  address_calculator : entity xil_defaultlib.frontend_address_calculator 
  port map (
    calc_next_addr => mcode1_calc_next_addr_net,
    data_en => delay0_q_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    skip_data => rollover_q_net,
    addr => addr_counter_q_net
  );
  accum0 : entity xil_defaultlib.sysgen_accum_03b534234b 
  port map (
    clr => '0',
    b => add0_s_net,
    rst => delay5_q_net,
    clk => clk_net,
    ce => ce_net,
    q => accum0_q_net
  );
  accum1 : entity xil_defaultlib.sysgen_accum_03b534234b 
  port map (
    clr => '0',
    b => add1_s_net,
    rst => delay5_q_net,
    clk => clk_net,
    ce => ce_net,
    q => accum1_q_net
  );
  add0 : entity xil_defaultlib.frontend_xladdsub 
  generic map (
    a_arith => xlSigned,
    a_bin_pt => 33,
    a_width => 36,
    b_arith => xlSigned,
    b_bin_pt => 33,
    b_width => 36,
    c_has_c_out => 0,
    c_latency => 1,
    c_output_width => 37,
    core_name0 => "frontend_c_addsub_v12_0_i1",
    extra_registers => 0,
    full_s_arith => 2,
    full_s_width => 37,
    latency => 1,
    overflow => 1,
    quantization => 1,
    s_arith => xlSigned,
    s_bin_pt => 33,
    s_width => 37
  )
  port map (
    clr => '0',
    en => "1",
    a => mult0_p_net,
    b => mult1_p_net,
    clk => clk_net,
    ce => ce_net,
    s => add0_s_net
  );
  add1 : entity xil_defaultlib.frontend_xladdsub 
  generic map (
    a_arith => xlSigned,
    a_bin_pt => 33,
    a_width => 36,
    b_arith => xlSigned,
    b_bin_pt => 33,
    b_width => 36,
    c_has_c_out => 0,
    c_latency => 1,
    c_output_width => 37,
    core_name0 => "frontend_c_addsub_v12_0_i1",
    extra_registers => 0,
    full_s_arith => 2,
    full_s_width => 37,
    latency => 1,
    overflow => 1,
    quantization => 1,
    s_arith => xlSigned,
    s_bin_pt => 33,
    s_width => 37
  )
  port map (
    clr => '0',
    en => "1",
    a => mult2_p_net,
    b => mult3_p_net,
    clk => clk_net,
    ce => ce_net,
    s => add1_s_net
  );
  add2 : entity xil_defaultlib.frontend_xladdsub 
  generic map (
    a_arith => xlSigned,
    a_bin_pt => 33,
    a_width => 37,
    b_arith => xlSigned,
    b_bin_pt => 33,
    b_width => 40,
    c_has_c_out => 0,
    c_latency => 1,
    c_output_width => 41,
    core_name0 => "frontend_c_addsub_v12_0_i4",
    extra_registers => 0,
    full_s_arith => 2,
    full_s_width => 41,
    latency => 1,
    overflow => 2,
    quantization => 1,
    s_arith => xlSigned,
    s_bin_pt => 17,
    s_width => 18
  )
  port map (
    clr => '0',
    en => "1",
    a => add0_s_net,
    b => accum0_q_net,
    clk => clk_net,
    ce => ce_net,
    s => add2_s_net
  );
  add3 : entity xil_defaultlib.frontend_xladdsub 
  generic map (
    a_arith => xlSigned,
    a_bin_pt => 33,
    a_width => 37,
    b_arith => xlSigned,
    b_bin_pt => 33,
    b_width => 40,
    c_has_c_out => 0,
    c_latency => 1,
    c_output_width => 41,
    core_name0 => "frontend_c_addsub_v12_0_i4",
    extra_registers => 0,
    full_s_arith => 2,
    full_s_width => 41,
    latency => 1,
    overflow => 2,
    quantization => 1,
    s_arith => xlSigned,
    s_bin_pt => 17,
    s_width => 18
  )
  port map (
    clr => '0',
    en => "1",
    a => add1_s_net,
    b => accum1_q_net,
    clk => clk_net,
    ce => ce_net,
    s => add3_s_net
  );
  and0 : entity xil_defaultlib.sysgen_logical_760b500db8 
  port map (
    clr => '0',
    d0 => delay0_q_net,
    d1 => inverter_op_net,
    clk => clk_net,
    ce => ce_net,
    y => and0_y_net
  );
  constant_x0 : entity xil_defaultlib.sysgen_constant_4452d24d6e 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  constant1 : entity xil_defaultlib.sysgen_constant_a22ab3e6fb 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant1_op_net
  );
  delay0 : entity xil_defaultlib.frontend_xldelay 
  generic map (
    latency => 1,
    reg_retiming => 0,
    reset => 0,
    width => 1
  )
  port map (
    en => '1',
    rst => '1',
    d => main_valid,
    clk => clk_net,
    ce => ce_net,
    q => delay0_q_net
  );
  delay1 : entity xil_defaultlib.frontend_xldelay 
  generic map (
    latency => 1,
    reg_retiming => 0,
    reset => 0,
    width => 18
  )
  port map (
    en => '1',
    rst => '1',
    d => delay4_q_net,
    clk => clk_net,
    ce => ce_net,
    q => delay1_q_net
  );
  delay2 : entity xil_defaultlib.frontend_xldelay 
  generic map (
    latency => 1,
    reg_retiming => 0,
    reset => 0,
    width => 18
  )
  port map (
    en => '1',
    rst => '1',
    d => delay3_q_net,
    clk => clk_net,
    ce => ce_net,
    q => delay2_q_net
  );
  delay3 : entity xil_defaultlib.frontend_xldelay 
  generic map (
    latency => 1,
    reg_retiming => 0,
    reset => 0,
    width => 2
  )
  port map (
    en => '1',
    rst => '1',
    d => mcode1_mux_sel_net,
    clk => clk_net,
    ce => ce_net,
    q => delay3_q_net_x0
  );
  delay4 : entity xil_defaultlib.frontend_xldelay 
  generic map (
    latency => 8,
    reg_retiming => 0,
    reset => 0,
    width => 1
  )
  port map (
    en => '1',
    rst => '1',
    d => and0_y_net,
    clk => clk_net,
    ce => ce_net,
    q => delay4_q_net_x0
  );
  delay5 : entity xil_defaultlib.frontend_xldelay 
  generic map (
    latency => 4,
    reg_retiming => 0,
    reset => 0,
    width => 1
  )
  port map (
    en => '1',
    rst => '1',
    d => delay0_q_net,
    clk => clk_net,
    ce => ce_net,
    q => delay5_q_net
  );
  delay6 : entity xil_defaultlib.frontend_xldelay 
  generic map (
    latency => 1,
    reg_retiming => 0,
    reset => 0,
    width => 1
  )
  port map (
    en => '1',
    rst => '1',
    d => delay4_q_net_x0,
    clk => clk_net,
    ce => ce_net,
    q => delay6_q_net
  );
  delay7 : entity xil_defaultlib.frontend_xldelay 
  generic map (
    latency => 1,
    reg_retiming => 0,
    reset => 0,
    width => 18
  )
  port map (
    rst => '1',
    d => add3_s_net,
    en => delay4_q_net_x0(0),
    clk => clk_net,
    ce => ce_net,
    q => delay7_q_net
  );
  delay8 : entity xil_defaultlib.frontend_xldelay 
  generic map (
    latency => 1,
    reg_retiming => 0,
    reset => 0,
    width => 18
  )
  port map (
    rst => '1',
    d => add2_s_net,
    en => delay4_q_net_x0(0),
    clk => clk_net,
    ce => ce_net,
    q => delay8_q_net
  );
  inverter : entity xil_defaultlib.sysgen_inverter_40ff4b71ed 
  port map (
    clr => '0',
    ip => rollover_q_net,
    clk => clk_net,
    ce => ce_net,
    op => inverter_op_net
  );
  mcode1 : entity xil_defaultlib.sysgen_mcode_block_2138969d62 
  port map (
    clr => '0',
    valid_in => delay0_q_net,
    skip_data => rollover_q_net,
    clk => clk_net,
    ce => ce_net,
    calc_next_addr => mcode1_calc_next_addr_net,
    mux_sel => mcode1_mux_sel_net
  );
  mult0 : entity xil_defaultlib.frontend_xlmult 
  generic map (
    a_arith => xlSigned,
    a_bin_pt => 16,
    a_width => 18,
    b_arith => xlSigned,
    b_bin_pt => 17,
    b_width => 18,
    c_a_type => 0,
    c_a_width => 18,
    c_b_type => 0,
    c_b_width => 18,
    c_baat => 18,
    c_output_width => 36,
    c_type => 0,
    core_name0 => "frontend_mult_gen_v12_0_i1",
    extra_registers => 0,
    multsign => 2,
    overflow => 1,
    p_arith => xlSigned,
    p_bin_pt => 33,
    p_width => 36,
    quantization => 1
  )
  port map (
    clr => '0',
    core_clr => '1',
    en => "1",
    rst => "0",
    a => mux4_y_net,
    b => mux0_y_net,
    clk => clk_net,
    ce => ce_net,
    core_clk => clk_net,
    core_ce => ce_net,
    p => mult0_p_net
  );
  mult1 : entity xil_defaultlib.frontend_xlmult 
  generic map (
    a_arith => xlSigned,
    a_bin_pt => 16,
    a_width => 18,
    b_arith => xlSigned,
    b_bin_pt => 17,
    b_width => 18,
    c_a_type => 0,
    c_a_width => 18,
    c_b_type => 0,
    c_b_width => 18,
    c_baat => 18,
    c_output_width => 36,
    c_type => 0,
    core_name0 => "frontend_mult_gen_v12_0_i1",
    extra_registers => 0,
    multsign => 2,
    overflow => 1,
    p_arith => xlSigned,
    p_bin_pt => 33,
    p_width => 36,
    quantization => 1
  )
  port map (
    clr => '0',
    core_clr => '1',
    en => "1",
    rst => "0",
    a => mux5_y_net,
    b => mux1_y_net,
    clk => clk_net,
    ce => ce_net,
    core_clk => clk_net,
    core_ce => ce_net,
    p => mult1_p_net
  );
  mult2 : entity xil_defaultlib.frontend_xlmult 
  generic map (
    a_arith => xlSigned,
    a_bin_pt => 16,
    a_width => 18,
    b_arith => xlSigned,
    b_bin_pt => 17,
    b_width => 18,
    c_a_type => 0,
    c_a_width => 18,
    c_b_type => 0,
    c_b_width => 18,
    c_baat => 18,
    c_output_width => 36,
    c_type => 0,
    core_name0 => "frontend_mult_gen_v12_0_i1",
    extra_registers => 0,
    multsign => 2,
    overflow => 1,
    p_arith => xlSigned,
    p_bin_pt => 33,
    p_width => 36,
    quantization => 1
  )
  port map (
    clr => '0',
    core_clr => '1',
    en => "1",
    rst => "0",
    a => mux4_y_net,
    b => mux2_y_net,
    clk => clk_net,
    ce => ce_net,
    core_clk => clk_net,
    core_ce => ce_net,
    p => mult2_p_net
  );
  mult3 : entity xil_defaultlib.frontend_xlmult 
  generic map (
    a_arith => xlSigned,
    a_bin_pt => 16,
    a_width => 18,
    b_arith => xlSigned,
    b_bin_pt => 17,
    b_width => 18,
    c_a_type => 0,
    c_a_width => 18,
    c_b_type => 0,
    c_b_width => 18,
    c_baat => 18,
    c_output_width => 36,
    c_type => 0,
    core_name0 => "frontend_mult_gen_v12_0_i1",
    extra_registers => 0,
    multsign => 2,
    overflow => 1,
    p_arith => xlSigned,
    p_bin_pt => 33,
    p_width => 36,
    quantization => 1
  )
  port map (
    clr => '0',
    core_clr => '1',
    en => "1",
    rst => "0",
    a => mux5_y_net,
    b => mux3_y_net,
    clk => clk_net,
    ce => ce_net,
    core_clk => clk_net,
    core_ce => ce_net,
    p => mult3_p_net
  );
  mux0 : entity xil_defaultlib.sysgen_mux_045330a157 
  port map (
    clr => '0',
    sel => delay3_q_net_x0,
    d0 => value0_q_net,
    d1 => value1_q_net,
    d2 => value2_q_net,
    d3 => value3_q_net,
    clk => clk_net,
    ce => ce_net,
    y => mux0_y_net
  );
  mux1 : entity xil_defaultlib.sysgen_mux_045330a157 
  port map (
    clr => '0',
    sel => delay3_q_net_x0,
    d0 => value4_q_net,
    d1 => value5_q_net,
    d2 => value6_q_net,
    d3 => value7_q_net,
    clk => clk_net,
    ce => ce_net,
    y => mux1_y_net
  );
  mux2 : entity xil_defaultlib.sysgen_mux_045330a157 
  port map (
    clr => '0',
    sel => delay3_q_net_x0,
    d0 => value8_q_net,
    d1 => value9_q_net,
    d2 => value10_q_net,
    d3 => value11_q_net,
    clk => clk_net,
    ce => ce_net,
    y => mux2_y_net
  );
  mux3 : entity xil_defaultlib.sysgen_mux_045330a157 
  port map (
    clr => '0',
    sel => delay3_q_net_x0,
    d0 => value12_q_net,
    d1 => value13_q_net,
    d2 => value14_q_net,
    d3 => value15_q_net,
    clk => clk_net,
    ce => ce_net,
    y => mux3_y_net
  );
  mux4 : entity xil_defaultlib.sysgen_mux_045330a157 
  port map (
    clr => '0',
    sel => delay3_q_net_x0,
    d0 => coeff0_q_net,
    d1 => coeff1_q_net,
    d2 => coeff2_q_net,
    d3 => coeff3_q_net,
    clk => clk_net,
    ce => ce_net,
    y => mux4_y_net
  );
  mux5 : entity xil_defaultlib.sysgen_mux_045330a157 
  port map (
    clr => '0',
    sel => delay3_q_net_x0,
    d0 => coeff4_q_net,
    d1 => coeff5_q_net,
    d2 => coeff6_q_net,
    d3 => coeff7_q_net,
    clk => clk_net,
    ce => ce_net,
    y => mux5_y_net
  );
  single_port_ram : entity xil_defaultlib.frontend_xlspram 
  generic map (
    c_address_width => 8,
    c_width => 18,
    core_name0 => "frontend_blk_mem_gen_v8_3_i0",
    latency => 1
  )
  port map (
    en => "1",
    rst => "0",
    addr => addr_counter_q_net,
    data_in => constant1_op_net,
    we => constant_op_net,
    clk => clk_net,
    ce => ce_net,
    data_out => single_port_ram_data_out_net
  );
  single_port_ram1 : entity xil_defaultlib.frontend_xlspram 
  generic map (
    c_address_width => 8,
    c_width => 18,
    core_name0 => "frontend_blk_mem_gen_v8_3_i1",
    latency => 1
  )
  port map (
    en => "1",
    rst => "0",
    addr => addr_counter_q_net,
    data_in => constant1_op_net,
    we => constant_op_net,
    clk => clk_net,
    ce => ce_net,
    data_out => single_port_ram1_data_out_net
  );
  single_port_ram2 : entity xil_defaultlib.frontend_xlspram 
  generic map (
    c_address_width => 8,
    c_width => 18,
    core_name0 => "frontend_blk_mem_gen_v8_3_i2",
    latency => 1
  )
  port map (
    en => "1",
    rst => "0",
    addr => addr_counter_q_net,
    data_in => constant1_op_net,
    we => constant_op_net,
    clk => clk_net,
    ce => ce_net,
    data_out => single_port_ram2_data_out_net
  );
  single_port_ram3 : entity xil_defaultlib.frontend_xlspram 
  generic map (
    c_address_width => 8,
    c_width => 18,
    core_name0 => "frontend_blk_mem_gen_v8_3_i3",
    latency => 1
  )
  port map (
    en => "1",
    rst => "0",
    addr => addr_counter_q_net,
    data_in => constant1_op_net,
    we => constant_op_net,
    clk => clk_net,
    ce => ce_net,
    data_out => single_port_ram3_data_out_net
  );
  single_port_ram4 : entity xil_defaultlib.frontend_xlspram 
  generic map (
    c_address_width => 8,
    c_width => 18,
    core_name0 => "frontend_blk_mem_gen_v8_3_i4",
    latency => 1
  )
  port map (
    en => "1",
    rst => "0",
    addr => addr_counter_q_net,
    data_in => constant1_op_net,
    we => constant_op_net,
    clk => clk_net,
    ce => ce_net,
    data_out => single_port_ram4_data_out_net
  );
  single_port_ram5 : entity xil_defaultlib.frontend_xlspram 
  generic map (
    c_address_width => 8,
    c_width => 18,
    core_name0 => "frontend_blk_mem_gen_v8_3_i5",
    latency => 1
  )
  port map (
    en => "1",
    rst => "0",
    addr => addr_counter_q_net,
    data_in => constant1_op_net,
    we => constant_op_net,
    clk => clk_net,
    ce => ce_net,
    data_out => single_port_ram5_data_out_net
  );
  single_port_ram6 : entity xil_defaultlib.frontend_xlspram 
  generic map (
    c_address_width => 8,
    c_width => 18,
    core_name0 => "frontend_blk_mem_gen_v8_3_i6",
    latency => 1
  )
  port map (
    en => "1",
    rst => "0",
    addr => addr_counter_q_net,
    data_in => constant1_op_net,
    we => constant_op_net,
    clk => clk_net,
    ce => ce_net,
    data_out => single_port_ram6_data_out_net
  );
  single_port_ram7 : entity xil_defaultlib.frontend_xlspram 
  generic map (
    c_address_width => 8,
    c_width => 18,
    core_name0 => "frontend_blk_mem_gen_v8_3_i7",
    latency => 1
  )
  port map (
    en => "1",
    rst => "0",
    addr => addr_counter_q_net,
    data_in => constant1_op_net,
    we => constant_op_net,
    clk => clk_net,
    ce => ce_net,
    data_out => single_port_ram7_data_out_net
  );
  coeff0 : entity xil_defaultlib.frontend_xlregister 
  generic map (
    d_width => 18,
    init_value => b"000000000000000000"
  )
  port map (
    en => "1",
    rst => "0",
    d => single_port_ram_data_out_net,
    clk => clk_net,
    ce => ce_net,
    q => coeff0_q_net
  );
  coeff1 : entity xil_defaultlib.frontend_xlregister 
  generic map (
    d_width => 18,
    init_value => b"000000000000000000"
  )
  port map (
    en => "1",
    rst => "0",
    d => single_port_ram1_data_out_net,
    clk => clk_net,
    ce => ce_net,
    q => coeff1_q_net
  );
  coeff2 : entity xil_defaultlib.frontend_xlregister 
  generic map (
    d_width => 18,
    init_value => b"000000000000000000"
  )
  port map (
    en => "1",
    rst => "0",
    d => single_port_ram2_data_out_net,
    clk => clk_net,
    ce => ce_net,
    q => coeff2_q_net
  );
  coeff3 : entity xil_defaultlib.frontend_xlregister 
  generic map (
    d_width => 18,
    init_value => b"000000000000000000"
  )
  port map (
    en => "1",
    rst => "0",
    d => single_port_ram3_data_out_net,
    clk => clk_net,
    ce => ce_net,
    q => coeff3_q_net
  );
  coeff4 : entity xil_defaultlib.frontend_xlregister 
  generic map (
    d_width => 18,
    init_value => b"000000000000000000"
  )
  port map (
    en => "1",
    rst => "0",
    d => single_port_ram4_data_out_net,
    clk => clk_net,
    ce => ce_net,
    q => coeff4_q_net
  );
  coeff5 : entity xil_defaultlib.frontend_xlregister 
  generic map (
    d_width => 18,
    init_value => b"000000000000000000"
  )
  port map (
    en => "1",
    rst => "0",
    d => single_port_ram5_data_out_net,
    clk => clk_net,
    ce => ce_net,
    q => coeff5_q_net
  );
  coeff6 : entity xil_defaultlib.frontend_xlregister 
  generic map (
    d_width => 18,
    init_value => b"000000000000000000"
  )
  port map (
    en => "1",
    rst => "0",
    d => single_port_ram6_data_out_net,
    clk => clk_net,
    ce => ce_net,
    q => coeff6_q_net
  );
  coeff7 : entity xil_defaultlib.frontend_xlregister 
  generic map (
    d_width => 18,
    init_value => b"000000000000000000"
  )
  port map (
    en => "1",
    rst => "0",
    d => single_port_ram7_data_out_net,
    clk => clk_net,
    ce => ce_net,
    q => coeff7_q_net
  );
  value0 : entity xil_defaultlib.frontend_xlregister 
  generic map (
    d_width => 18,
    init_value => b"000000000000000000"
  )
  port map (
    rst => "0",
    d => delay2_q_net,
    en => delay0_q_net,
    clk => clk_net,
    ce => ce_net,
    q => value0_q_net
  );
  value1 : entity xil_defaultlib.frontend_xlregister 
  generic map (
    d_width => 18,
    init_value => b"000000000000000000"
  )
  port map (
    rst => "0",
    d => value0_q_net,
    en => delay0_q_net,
    clk => clk_net,
    ce => ce_net,
    q => value1_q_net
  );
  value10 : entity xil_defaultlib.frontend_xlregister 
  generic map (
    d_width => 18,
    init_value => b"000000000000000000"
  )
  port map (
    rst => "0",
    d => value9_q_net,
    en => delay0_q_net,
    clk => clk_net,
    ce => ce_net,
    q => value10_q_net
  );
  value11 : entity xil_defaultlib.frontend_xlregister 
  generic map (
    d_width => 18,
    init_value => b"000000000000000000"
  )
  port map (
    rst => "0",
    d => value10_q_net,
    en => delay0_q_net,
    clk => clk_net,
    ce => ce_net,
    q => value11_q_net
  );
  value12 : entity xil_defaultlib.frontend_xlregister 
  generic map (
    d_width => 18,
    init_value => b"000000000000000000"
  )
  port map (
    rst => "0",
    d => value11_q_net,
    en => delay0_q_net,
    clk => clk_net,
    ce => ce_net,
    q => value12_q_net
  );
  value13 : entity xil_defaultlib.frontend_xlregister 
  generic map (
    d_width => 18,
    init_value => b"000000000000000000"
  )
  port map (
    rst => "0",
    d => value12_q_net,
    en => delay0_q_net,
    clk => clk_net,
    ce => ce_net,
    q => value13_q_net
  );
  value14 : entity xil_defaultlib.frontend_xlregister 
  generic map (
    d_width => 18,
    init_value => b"000000000000000000"
  )
  port map (
    rst => "0",
    d => value13_q_net,
    en => delay0_q_net,
    clk => clk_net,
    ce => ce_net,
    q => value14_q_net
  );
  value15 : entity xil_defaultlib.frontend_xlregister 
  generic map (
    d_width => 18,
    init_value => b"000000000000000000"
  )
  port map (
    rst => "0",
    d => value14_q_net,
    en => delay0_q_net,
    clk => clk_net,
    ce => ce_net,
    q => value15_q_net
  );
  value2 : entity xil_defaultlib.frontend_xlregister 
  generic map (
    d_width => 18,
    init_value => b"000000000000000000"
  )
  port map (
    rst => "0",
    d => value1_q_net,
    en => delay0_q_net,
    clk => clk_net,
    ce => ce_net,
    q => value2_q_net
  );
  value3 : entity xil_defaultlib.frontend_xlregister 
  generic map (
    d_width => 18,
    init_value => b"000000000000000000"
  )
  port map (
    rst => "0",
    d => value2_q_net,
    en => delay0_q_net,
    clk => clk_net,
    ce => ce_net,
    q => value3_q_net
  );
  value4 : entity xil_defaultlib.frontend_xlregister 
  generic map (
    d_width => 18,
    init_value => b"000000000000000000"
  )
  port map (
    rst => "0",
    d => value3_q_net,
    en => delay0_q_net,
    clk => clk_net,
    ce => ce_net,
    q => value4_q_net
  );
  value5 : entity xil_defaultlib.frontend_xlregister 
  generic map (
    d_width => 18,
    init_value => b"000000000000000000"
  )
  port map (
    rst => "0",
    d => value4_q_net,
    en => delay0_q_net,
    clk => clk_net,
    ce => ce_net,
    q => value5_q_net
  );
  value6 : entity xil_defaultlib.frontend_xlregister 
  generic map (
    d_width => 18,
    init_value => b"000000000000000000"
  )
  port map (
    rst => "0",
    d => value5_q_net,
    en => delay0_q_net,
    clk => clk_net,
    ce => ce_net,
    q => value6_q_net
  );
  value7 : entity xil_defaultlib.frontend_xlregister 
  generic map (
    d_width => 18,
    init_value => b"000000000000000000"
  )
  port map (
    rst => "0",
    d => value6_q_net,
    en => delay0_q_net,
    clk => clk_net,
    ce => ce_net,
    q => value7_q_net
  );
  value8 : entity xil_defaultlib.frontend_xlregister 
  generic map (
    d_width => 18,
    init_value => b"000000000000000000"
  )
  port map (
    rst => "0",
    d => delay1_q_net,
    en => delay0_q_net,
    clk => clk_net,
    ce => ce_net,
    q => value8_q_net
  );
  value9 : entity xil_defaultlib.frontend_xlregister 
  generic map (
    d_width => 18,
    init_value => b"000000000000000000"
  )
  port map (
    rst => "0",
    d => value8_q_net,
    en => delay0_q_net,
    clk => clk_net,
    ce => ce_net,
    q => value9_q_net
  );
end structural;
-- Generated from Simulink block Brik1/FrontEnd_struct
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity frontend_struct is
  port (
    a2d_data : in std_logic_vector( 18-1 downto 0 );
    validin : in std_logic_vector( 1-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    fe_imag : out std_logic_vector( 18-1 downto 0 );
    fe_real : out std_logic_vector( 18-1 downto 0 );
    fe_valid : out std_logic_vector( 1-1 downto 0 )
  );
end frontend_struct;
architecture structural of frontend_struct is 
  signal a2d_data_net : std_logic_vector( 18-1 downto 0 );
  signal delay6_q_net : std_logic_vector( 1-1 downto 0 );
  signal main_valid : std_logic_vector( 1-1 downto 0 );
  signal delay8_q_net : std_logic_vector( 18-1 downto 0 );
  signal validin_net : std_logic_vector( 1-1 downto 0 );
  signal ce_net : std_logic;
  signal delay3_q_net : std_logic_vector( 18-1 downto 0 );
  signal clk_net : std_logic;
  signal delay7_q_net : std_logic_vector( 18-1 downto 0 );
  signal delay4_q_net : std_logic_vector( 18-1 downto 0 );
begin
  a2d_data_net <= a2d_data;
  fe_imag <= delay7_q_net;
  fe_real <= delay8_q_net;
  fe_valid <= delay6_q_net;
  validin_net <= validin;
  clk_net <= clk_1;
  ce_net <= ce_1;
  aliasing_ddc : entity xil_defaultlib.frontend_aliasing_ddc 
  port map (
    valid_in => validin_net,
    signal_in => a2d_data_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    valid_out => main_valid,
    out_r => delay3_q_net,
    out_i => delay4_q_net
  );
  decim156_175 : entity xil_defaultlib.frontend_decim156_175 
  port map (
    valid_in => main_valid,
    signal_r => delay3_q_net,
    signal_i => delay4_q_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    valid_out => delay6_q_net,
    signal_out_r => delay8_q_net,
    signal_out_i => delay7_q_net
  );
end structural;
-- Generated from Simulink block 
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity frontend_default_clock_driver is
  port (
    brik1_sysclk : in std_logic;
    brik1_sysce : in std_logic;
    brik1_sysclr : in std_logic;
    brik1_clk1 : out std_logic;
    brik1_ce1 : out std_logic
  );
end frontend_default_clock_driver;
architecture structural of frontend_default_clock_driver is 
begin
  clockdriver : entity xil_defaultlib.xlclockdriver 
  generic map (
    period => 1,
    log_2_period => 1
  )
  port map (
    sysclk => brik1_sysclk,
    sysce => brik1_sysce,
    sysclr => brik1_sysclr,
    clk => brik1_clk1,
    ce => brik1_ce1
  );
end structural;
-- Generated from Simulink block 
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity frontend is
  port (
    a2d_data : in std_logic_vector( 18-1 downto 0 );
    validin : in std_logic_vector( 1-1 downto 0 );
    clk : in std_logic;
    fe_imag : out std_logic_vector( 18-1 downto 0 );
    fe_real : out std_logic_vector( 18-1 downto 0 );
    fe_valid : out std_logic_vector( 1-1 downto 0 )
  );
end frontend;
architecture structural of frontend is 
  attribute core_generation_info : string;
  attribute core_generation_info of structural : architecture is "frontend,sysgen_core_2016_3,{,compilation=IP Catalog,block_icon_display=Default,family=kintexu,part=xcku040,speed=-2-e,package=ffva1156,synthesis_language=vhdl,hdl_library=xil_defaultlib,synthesis_strategy=Vivado Synthesis Defaults,implementation_strategy=Vivado Implementation Defaults,testbench=0,interface_doc=1,ce_clr=0,clock_period=5.35716,system_simulink_period=1,waveform_viewer=0,axilite_interface=0,ip_catalog_plugin=0,hwcosim_burst_mode=0,simulation_time=627200,accum=3,addsub=12,constant=17,counter=2,delay=18,inv=5,logical=4,mcode=1,mult=7,mux=17,negate=1,register=52,relational=1,slice=2,spram=8,}";
  signal ce_1_net : std_logic;
  signal clk_1_net : std_logic;
begin
  frontend_default_clock_driver : entity xil_defaultlib.frontend_default_clock_driver 
  port map (
    brik1_sysclk => clk,
    brik1_sysce => '1',
    brik1_sysclr => '0',
    brik1_clk1 => clk_1_net,
    brik1_ce1 => ce_1_net
  );
  frontend_struct : entity xil_defaultlib.frontend_struct 
  port map (
    a2d_data => a2d_data,
    validin => validin,
    clk_1 => clk_1_net,
    ce_1 => ce_1_net,
    fe_imag => fe_imag,
    fe_real => fe_real,
    fe_valid => fe_valid
  );
end structural;
