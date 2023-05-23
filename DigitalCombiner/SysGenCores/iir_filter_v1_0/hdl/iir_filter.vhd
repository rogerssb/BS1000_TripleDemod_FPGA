-- Generated from Simulink block IIR_Filter_struct
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity iir_filter_struct is
  port (
    gateway_in : in std_logic_vector( 24-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    gateway_out1 : out std_logic_vector( 42-1 downto 0 )
  );
end iir_filter_struct;
architecture structural of iir_filter_struct is 
  signal cmult2_p_net : std_logic_vector( 52-1 downto 0 );
  signal addsub10_s_net : std_logic_vector( 42-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal gateway_in_net : std_logic_vector( 24-1 downto 0 );
  signal a4_p_net : std_logic_vector( 41-1 downto 0 );
  signal a3_p_net : std_logic_vector( 41-1 downto 0 );
  signal a2_p_net : std_logic_vector( 41-1 downto 0 );
  signal delay3_q_net : std_logic_vector( 41-1 downto 0 );
  signal delay2_q_net : std_logic_vector( 41-1 downto 0 );
  signal delay1_q_net : std_logic_vector( 41-1 downto 0 );
  signal a1_p_net : std_logic_vector( 41-1 downto 0 );
  signal delay_q_net : std_logic_vector( 41-1 downto 0 );
  signal a21_p_net : std_logic_vector( 41-1 downto 0 );
  signal a5_p_net : std_logic_vector( 41-1 downto 0 );
  signal scale2_op_net : std_logic_vector( 52-1 downto 0 );
  signal a8_p_net : std_logic_vector( 41-1 downto 0 );
  signal addsub1_s_net : std_logic_vector( 41-1 downto 0 );
  signal addsub2_s_net : std_logic_vector( 43-1 downto 0 );
  signal delay4_q_net : std_logic_vector( 41-1 downto 0 );
  signal addsub8_s_net : std_logic_vector( 41-1 downto 0 );
  signal addsub3_s_net : std_logic_vector( 44-1 downto 0 );
  signal addsub_s_net : std_logic_vector( 41-1 downto 0 );
  signal addsub4_s_net : std_logic_vector( 41-1 downto 0 );
  signal scale1_op_net : std_logic_vector( 52-1 downto 0 );
  signal addsub7_s_net : std_logic_vector( 44-1 downto 0 );
  signal cmult_p_net : std_logic_vector( 52-1 downto 0 );
  signal addsub5_s_net : std_logic_vector( 41-1 downto 0 );
  signal scale3_op_net : std_logic_vector( 52-1 downto 0 );
  signal addsub6_s_net : std_logic_vector( 43-1 downto 0 );
  signal cmult1_p_net : std_logic_vector( 52-1 downto 0 );
begin
  gateway_in_net <= gateway_in;
  gateway_out1 <= addsub10_s_net;
  clk_net <= clk_1;
  ce_net <= ce_1;
  a1 : entity xil_defaultlib.iir_filter_xlcmult 
  generic map (
    a_arith => xlSigned,
    a_bin_pt => 37,
    a_width => 41,
    b_bin_pt => 23,
    c_a_type => 0,
    c_a_width => 41,
    c_b_type => 1,
    c_b_width => 24,
    c_output_width => 65,
    core_name0 => "iir_filter_mult_gen_v12_0_i0",
    extra_registers => 0,
    multsign => 2,
    overflow => 3,
    p_arith => xlSigned,
    p_bin_pt => 37,
    p_width => 41,
    quantization => 1,
    zero_const => 0
  )
  port map (
    clr => '0',
    core_clr => '1',
    en => "1",
    rst => "0",
    a => delay1_q_net,
    clk => clk_net,
    ce => ce_net,
    core_clk => clk_net,
    core_ce => ce_net,
    p => a1_p_net
  );
  a2 : entity xil_defaultlib.iir_filter_xlcmult 
  generic map (
    a_arith => xlSigned,
    a_bin_pt => 37,
    a_width => 41,
    b_bin_pt => 16,
    c_a_type => 0,
    c_a_width => 41,
    c_b_type => 1,
    c_b_width => 18,
    c_output_width => 59,
    core_name0 => "iir_filter_mult_gen_v12_0_i1",
    extra_registers => 0,
    multsign => 2,
    overflow => 3,
    p_arith => xlSigned,
    p_bin_pt => 36,
    p_width => 41,
    quantization => 1,
    zero_const => 0
  )
  port map (
    clr => '0',
    core_clr => '1',
    en => "1",
    rst => "0",
    a => delay_q_net,
    clk => clk_net,
    ce => ce_net,
    core_clk => clk_net,
    core_ce => ce_net,
    p => a2_p_net
  );
  a21 : entity xil_defaultlib.iir_filter_xlcmult 
  generic map (
    a_arith => xlSigned,
    a_bin_pt => 37,
    a_width => 41,
    b_bin_pt => 22,
    c_a_type => 0,
    c_a_width => 41,
    c_b_type => 0,
    c_b_width => 24,
    c_output_width => 65,
    core_name0 => "iir_filter_mult_gen_v12_0_i2",
    extra_registers => 0,
    multsign => 2,
    overflow => 3,
    p_arith => xlSigned,
    p_bin_pt => 36,
    p_width => 41,
    quantization => 1,
    zero_const => 0
  )
  port map (
    clr => '0',
    core_clr => '1',
    en => "1",
    rst => "0",
    a => delay_q_net,
    clk => clk_net,
    ce => ce_net,
    core_clk => clk_net,
    core_ce => ce_net,
    p => a21_p_net
  );
  a3 : entity xil_defaultlib.iir_filter_xlcmult 
  generic map (
    a_arith => xlSigned,
    a_bin_pt => 37,
    a_width => 41,
    b_bin_pt => 23,
    c_a_type => 0,
    c_a_width => 41,
    c_b_type => 1,
    c_b_width => 24,
    c_output_width => 65,
    core_name0 => "iir_filter_mult_gen_v12_0_i3",
    extra_registers => 0,
    multsign => 2,
    overflow => 3,
    p_arith => xlSigned,
    p_bin_pt => 37,
    p_width => 41,
    quantization => 1,
    zero_const => 0
  )
  port map (
    clr => '0',
    core_clr => '1',
    en => "1",
    rst => "0",
    a => delay3_q_net,
    clk => clk_net,
    ce => ce_net,
    core_clk => clk_net,
    core_ce => ce_net,
    p => a3_p_net
  );
  a4 : entity xil_defaultlib.iir_filter_xlcmult 
  generic map (
    a_arith => xlSigned,
    a_bin_pt => 37,
    a_width => 41,
    b_bin_pt => 16,
    c_a_type => 0,
    c_a_width => 41,
    c_b_type => 1,
    c_b_width => 18,
    c_output_width => 59,
    core_name0 => "iir_filter_mult_gen_v12_0_i1",
    extra_registers => 0,
    multsign => 2,
    overflow => 3,
    p_arith => xlSigned,
    p_bin_pt => 36,
    p_width => 41,
    quantization => 1,
    zero_const => 0
  )
  port map (
    clr => '0',
    core_clr => '1',
    en => "1",
    rst => "0",
    a => delay2_q_net,
    clk => clk_net,
    ce => ce_net,
    core_clk => clk_net,
    core_ce => ce_net,
    p => a4_p_net
  );
  a5 : entity xil_defaultlib.iir_filter_xlcmult 
  generic map (
    a_arith => xlSigned,
    a_bin_pt => 37,
    a_width => 41,
    b_bin_pt => 22,
    c_a_type => 0,
    c_a_width => 41,
    c_b_type => 0,
    c_b_width => 24,
    c_output_width => 65,
    core_name0 => "iir_filter_mult_gen_v12_0_i4",
    extra_registers => 0,
    multsign => 2,
    overflow => 3,
    p_arith => xlSigned,
    p_bin_pt => 36,
    p_width => 41,
    quantization => 1,
    zero_const => 0
  )
  port map (
    clr => '0',
    core_clr => '1',
    en => "1",
    rst => "0",
    a => delay2_q_net,
    clk => clk_net,
    ce => ce_net,
    core_clk => clk_net,
    core_ce => ce_net,
    p => a5_p_net
  );
  a8 : entity xil_defaultlib.iir_filter_xlcmult 
  generic map (
    a_arith => xlSigned,
    a_bin_pt => 36,
    a_width => 41,
    b_bin_pt => 22,
    c_a_type => 0,
    c_a_width => 41,
    c_b_type => 0,
    c_b_width => 24,
    c_output_width => 65,
    core_name0 => "iir_filter_mult_gen_v12_0_i5",
    extra_registers => 0,
    multsign => 2,
    overflow => 3,
    p_arith => xlSigned,
    p_bin_pt => 36,
    p_width => 41,
    quantization => 1,
    zero_const => 0
  )
  port map (
    clr => '0',
    core_clr => '1',
    en => "1",
    rst => "0",
    a => delay4_q_net,
    clk => clk_net,
    ce => ce_net,
    core_clk => clk_net,
    core_ce => ce_net,
    p => a8_p_net
  );
  addsub : entity xil_defaultlib.iir_filter_xladdsub 
  generic map (
    a_arith => xlSigned,
    a_bin_pt => 50,
    a_width => 52,
    b_arith => xlSigned,
    b_bin_pt => 36,
    b_width => 41,
    c_has_c_out => 0,
    c_latency => 0,
    c_output_width => 56,
    core_name0 => "iir_filter_c_addsub_v12_0_i0",
    extra_registers => 0,
    full_s_arith => 2,
    full_s_width => 56,
    latency => 0,
    overflow => 3,
    quantization => 1,
    s_arith => xlSigned,
    s_bin_pt => 36,
    s_width => 41
  )
  port map (
    clr => '0',
    en => "1",
    a => scale2_op_net,
    b => a21_p_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub_s_net
  );
  addsub1 : entity xil_defaultlib.iir_filter_xladdsub 
  generic map (
    a_arith => xlSigned,
    a_bin_pt => 36,
    a_width => 41,
    b_arith => xlSigned,
    b_bin_pt => 37,
    b_width => 41,
    c_has_c_out => 0,
    c_latency => 0,
    c_output_width => 43,
    core_name0 => "iir_filter_c_addsub_v12_0_i1",
    extra_registers => 0,
    full_s_arith => 2,
    full_s_width => 43,
    latency => 0,
    overflow => 3,
    quantization => 1,
    s_arith => xlSigned,
    s_bin_pt => 37,
    s_width => 41
  )
  port map (
    clr => '0',
    en => "1",
    a => addsub_s_net,
    b => a1_p_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub1_s_net
  );
  addsub10 : entity xil_defaultlib.iir_filter_xladdsub 
  generic map (
    a_arith => xlSigned,
    a_bin_pt => 36,
    a_width => 41,
    b_arith => xlSigned,
    b_bin_pt => 36,
    b_width => 41,
    c_has_c_out => 0,
    c_latency => 0,
    c_output_width => 42,
    core_name0 => "iir_filter_c_addsub_v12_0_i2",
    extra_registers => 0,
    full_s_arith => 2,
    full_s_width => 42,
    latency => 0,
    overflow => 1,
    quantization => 1,
    s_arith => xlSigned,
    s_bin_pt => 36,
    s_width => 42
  )
  port map (
    clr => '0',
    en => "1",
    a => addsub8_s_net,
    b => delay4_q_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub10_s_net
  );
  addsub2 : entity xil_defaultlib.iir_filter_xladdsub 
  generic map (
    a_arith => xlSigned,
    a_bin_pt => 37,
    a_width => 41,
    b_arith => xlSigned,
    b_bin_pt => 36,
    b_width => 41,
    c_has_c_out => 0,
    c_latency => 0,
    c_output_width => 43,
    core_name0 => "iir_filter_c_addsub_v12_0_i3",
    extra_registers => 0,
    full_s_arith => 2,
    full_s_width => 43,
    latency => 0,
    overflow => 1,
    quantization => 1,
    s_arith => xlSigned,
    s_bin_pt => 37,
    s_width => 43
  )
  port map (
    clr => '0',
    en => "1",
    a => addsub1_s_net,
    b => a2_p_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub2_s_net
  );
  addsub3 : entity xil_defaultlib.iir_filter_xladdsub 
  generic map (
    a_arith => xlSigned,
    a_bin_pt => 37,
    a_width => 43,
    b_arith => xlSigned,
    b_bin_pt => 37,
    b_width => 41,
    c_has_c_out => 0,
    c_latency => 1,
    c_output_width => 44,
    core_name0 => "iir_filter_c_addsub_v12_0_i4",
    extra_registers => 0,
    full_s_arith => 2,
    full_s_width => 44,
    latency => 1,
    overflow => 1,
    quantization => 1,
    s_arith => xlSigned,
    s_bin_pt => 37,
    s_width => 44
  )
  port map (
    clr => '0',
    en => "1",
    a => addsub2_s_net,
    b => delay1_q_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub3_s_net
  );
  addsub4 : entity xil_defaultlib.iir_filter_xladdsub 
  generic map (
    a_arith => xlSigned,
    a_bin_pt => 50,
    a_width => 52,
    b_arith => xlSigned,
    b_bin_pt => 36,
    b_width => 41,
    c_has_c_out => 0,
    c_latency => 0,
    c_output_width => 56,
    core_name0 => "iir_filter_c_addsub_v12_0_i0",
    extra_registers => 0,
    full_s_arith => 2,
    full_s_width => 56,
    latency => 0,
    overflow => 3,
    quantization => 1,
    s_arith => xlSigned,
    s_bin_pt => 36,
    s_width => 41
  )
  port map (
    clr => '0',
    en => "1",
    a => scale1_op_net,
    b => a5_p_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub4_s_net
  );
  addsub5 : entity xil_defaultlib.iir_filter_xladdsub 
  generic map (
    a_arith => xlSigned,
    a_bin_pt => 36,
    a_width => 41,
    b_arith => xlSigned,
    b_bin_pt => 37,
    b_width => 41,
    c_has_c_out => 0,
    c_latency => 0,
    c_output_width => 43,
    core_name0 => "iir_filter_c_addsub_v12_0_i1",
    extra_registers => 0,
    full_s_arith => 2,
    full_s_width => 43,
    latency => 0,
    overflow => 3,
    quantization => 1,
    s_arith => xlSigned,
    s_bin_pt => 37,
    s_width => 41
  )
  port map (
    clr => '0',
    en => "1",
    a => addsub4_s_net,
    b => a3_p_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub5_s_net
  );
  addsub6 : entity xil_defaultlib.iir_filter_xladdsub 
  generic map (
    a_arith => xlSigned,
    a_bin_pt => 37,
    a_width => 41,
    b_arith => xlSigned,
    b_bin_pt => 36,
    b_width => 41,
    c_has_c_out => 0,
    c_latency => 0,
    c_output_width => 43,
    core_name0 => "iir_filter_c_addsub_v12_0_i3",
    extra_registers => 0,
    full_s_arith => 2,
    full_s_width => 43,
    latency => 0,
    overflow => 1,
    quantization => 1,
    s_arith => xlSigned,
    s_bin_pt => 37,
    s_width => 43
  )
  port map (
    clr => '0',
    en => "1",
    a => addsub5_s_net,
    b => a4_p_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub6_s_net
  );
  addsub7 : entity xil_defaultlib.iir_filter_xladdsub 
  generic map (
    a_arith => xlSigned,
    a_bin_pt => 37,
    a_width => 43,
    b_arith => xlSigned,
    b_bin_pt => 37,
    b_width => 41,
    c_has_c_out => 0,
    c_latency => 1,
    c_output_width => 44,
    core_name0 => "iir_filter_c_addsub_v12_0_i4",
    extra_registers => 0,
    full_s_arith => 2,
    full_s_width => 44,
    latency => 1,
    overflow => 1,
    quantization => 1,
    s_arith => xlSigned,
    s_bin_pt => 37,
    s_width => 44
  )
  port map (
    clr => '0',
    en => "1",
    a => addsub6_s_net,
    b => delay3_q_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub7_s_net
  );
  addsub8 : entity xil_defaultlib.iir_filter_xladdsub 
  generic map (
    a_arith => xlSigned,
    a_bin_pt => 41,
    a_width => 52,
    b_arith => xlSigned,
    b_bin_pt => 36,
    b_width => 41,
    c_has_c_out => 0,
    c_latency => 0,
    c_output_width => 53,
    core_name0 => "iir_filter_c_addsub_v12_0_i5",
    extra_registers => 0,
    full_s_arith => 2,
    full_s_width => 53,
    latency => 0,
    overflow => 3,
    quantization => 1,
    s_arith => xlSigned,
    s_bin_pt => 36,
    s_width => 41
  )
  port map (
    clr => '0',
    en => "1",
    a => scale3_op_net,
    b => a8_p_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub8_s_net
  );
  cmult : entity xil_defaultlib.iir_filter_xlcmult 
  generic map (
    a_arith => xlSigned,
    a_bin_pt => 23,
    a_width => 24,
    b_bin_pt => 23,
    c_a_type => 0,
    c_a_width => 24,
    c_b_type => 1,
    c_b_width => 24,
    c_output_width => 48,
    core_name0 => "iir_filter_mult_gen_v12_0_i6",
    extra_registers => 0,
    multsign => 2,
    overflow => 3,
    p_arith => xlSigned,
    p_bin_pt => 32,
    p_width => 52,
    quantization => 1,
    zero_const => 0
  )
  port map (
    clr => '0',
    core_clr => '1',
    en => "1",
    rst => "0",
    a => gateway_in_net,
    clk => clk_net,
    ce => ce_net,
    core_clk => clk_net,
    core_ce => ce_net,
    p => cmult_p_net
  );
  cmult1 : entity xil_defaultlib.iir_filter_xlcmult 
  generic map (
    a_arith => xlSigned,
    a_bin_pt => 37,
    a_width => 44,
    b_bin_pt => 23,
    c_a_type => 0,
    c_a_width => 44,
    c_b_type => 1,
    c_b_width => 24,
    c_output_width => 68,
    core_name0 => "iir_filter_mult_gen_v12_0_i7",
    extra_registers => 0,
    multsign => 2,
    overflow => 3,
    p_arith => xlSigned,
    p_bin_pt => 32,
    p_width => 52,
    quantization => 1,
    zero_const => 0
  )
  port map (
    clr => '0',
    core_clr => '1',
    en => "1",
    rst => "0",
    a => addsub3_s_net,
    clk => clk_net,
    ce => ce_net,
    core_clk => clk_net,
    core_ce => ce_net,
    p => cmult1_p_net
  );
  cmult2 : entity xil_defaultlib.iir_filter_xlcmult 
  generic map (
    a_arith => xlSigned,
    a_bin_pt => 37,
    a_width => 44,
    b_bin_pt => 23,
    c_a_type => 0,
    c_a_width => 44,
    c_b_type => 1,
    c_b_width => 24,
    c_output_width => 68,
    core_name0 => "iir_filter_mult_gen_v12_0_i8",
    extra_registers => 0,
    multsign => 2,
    overflow => 3,
    p_arith => xlSigned,
    p_bin_pt => 32,
    p_width => 52,
    quantization => 1,
    zero_const => 0
  )
  port map (
    clr => '0',
    core_clr => '1',
    en => "1",
    rst => "0",
    a => addsub7_s_net,
    clk => clk_net,
    ce => ce_net,
    core_clk => clk_net,
    core_ce => ce_net,
    p => cmult2_p_net
  );
  delay : entity xil_defaultlib.iir_filter_xldelay 
  generic map (
    latency => 1,
    reg_retiming => 0,
    reset => 0,
    width => 41
  )
  port map (
    en => '1',
    rst => '1',
    d => addsub1_s_net,
    clk => clk_net,
    ce => ce_net,
    q => delay_q_net
  );
  delay1 : entity xil_defaultlib.iir_filter_xldelay 
  generic map (
    latency => 1,
    reg_retiming => 0,
    reset => 0,
    width => 41
  )
  port map (
    en => '1',
    rst => '1',
    d => delay_q_net,
    clk => clk_net,
    ce => ce_net,
    q => delay1_q_net
  );
  delay2 : entity xil_defaultlib.iir_filter_xldelay 
  generic map (
    latency => 1,
    reg_retiming => 0,
    reset => 0,
    width => 41
  )
  port map (
    en => '1',
    rst => '1',
    d => addsub5_s_net,
    clk => clk_net,
    ce => ce_net,
    q => delay2_q_net
  );
  delay3 : entity xil_defaultlib.iir_filter_xldelay 
  generic map (
    latency => 1,
    reg_retiming => 0,
    reset => 0,
    width => 41
  )
  port map (
    en => '1',
    rst => '1',
    d => delay2_q_net,
    clk => clk_net,
    ce => ce_net,
    q => delay3_q_net
  );
  delay4 : entity xil_defaultlib.iir_filter_xldelay 
  generic map (
    latency => 1,
    reg_retiming => 0,
    reset => 0,
    width => 41
  )
  port map (
    en => '1',
    rst => '1',
    d => addsub8_s_net,
    clk => clk_net,
    ce => ce_net,
    q => delay4_q_net
  );
  scale1 : entity xil_defaultlib.sysgen_scale_1502e22728 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    ip => cmult1_p_net,
    op => scale1_op_net
  );
  scale2 : entity xil_defaultlib.sysgen_scale_1502e22728 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    ip => cmult_p_net,
    op => scale2_op_net
  );
  scale3 : entity xil_defaultlib.sysgen_scale_1502e22728 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    ip => cmult2_p_net,
    op => scale3_op_net
  );
end structural;
-- Generated from Simulink block 
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity iir_filter_default_clock_driver is
  port (
    iir_filter_sysclk : in std_logic;
    iir_filter_sysce : in std_logic;
    iir_filter_sysclr : in std_logic;
    iir_filter_clk1 : out std_logic;
    iir_filter_ce1 : out std_logic
  );
end iir_filter_default_clock_driver;
architecture structural of iir_filter_default_clock_driver is 
begin
  clockdriver : entity xil_defaultlib.xlclockdriver 
  generic map (
    period => 1,
    log_2_period => 1
  )
  port map (
    sysclk => iir_filter_sysclk,
    sysce => iir_filter_sysce,
    sysclr => iir_filter_sysclr,
    clk => iir_filter_clk1,
    ce => iir_filter_ce1
  );
end structural;
-- Generated from Simulink block 
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity iir_filter is
  port (
    gateway_in : in std_logic_vector( 24-1 downto 0 );
    clk : in std_logic;
    gateway_out1 : out std_logic_vector( 42-1 downto 0 )
  );
end iir_filter;
architecture structural of iir_filter is 
  attribute core_generation_info : string;
  attribute core_generation_info of structural : architecture is "iir_filter,sysgen_core_2017_2,{,compilation=IP Catalog,block_icon_display=Default,family=kintex7,part=xc7k325t,speed=-3,package=fbg676,synthesis_language=vhdl,hdl_library=xil_defaultlib,synthesis_strategy=Vivado Synthesis Defaults,implementation_strategy=Vivado Implementation Defaults,testbench=0,interface_doc=0,ce_clr=0,clock_period=21.4286,system_simulink_period=2.14286e-08,waveform_viewer=0,axilite_interface=0,ip_catalog_plugin=0,hwcosim_burst_mode=0,simulation_time=0.1,addsub=10,cmult=10,delay=5,scale=3,}";
  signal clk_1_net : std_logic;
  signal ce_1_net : std_logic;
begin
  iir_filter_default_clock_driver : entity xil_defaultlib.iir_filter_default_clock_driver 
  port map (
    iir_filter_sysclk => clk,
    iir_filter_sysce => '1',
    iir_filter_sysclr => '0',
    iir_filter_clk1 => clk_1_net,
    iir_filter_ce1 => ce_1_net
  );
  iir_filter_struct : entity xil_defaultlib.iir_filter_struct 
  port map (
    gateway_in => gateway_in,
    clk_1 => clk_1_net,
    ce_1 => ce_1_net,
    gateway_out1 => gateway_out1
  );
end structural;
