-- Generated from Simulink block DqmToEbNo_struct
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity dqmtoebno_struct is
  port (
    dqm_in : in std_logic_vector( 17-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    gateway_out : out std_logic_vector( 32-1 downto 0 )
  );
end dqmtoebno_struct;
architecture structural of dqmtoebno_struct is 
  signal addsub3_s_net : std_logic_vector( 32-1 downto 0 );
  signal addsub5_s_net : std_logic_vector( 32-1 downto 0 );
  signal delay5_q_net : std_logic_vector( 32-1 downto 0 );
  signal delay8_q_net : std_logic_vector( 32-1 downto 0 );
  signal xto5th_p_net : std_logic_vector( 32-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal delay6_q_net : std_logic_vector( 32-1 downto 0 );
  signal delay7_q_net : std_logic_vector( 32-1 downto 0 );
  signal dqm_in_net : std_logic_vector( 17-1 downto 0 );
  signal constant6_op_net : std_logic_vector( 32-1 downto 0 );
  signal addsub2_s_net : std_logic_vector( 32-1 downto 0 );
  signal addsub1_s_net : std_logic_vector( 32-1 downto 0 );
  signal addsub_s_net : std_logic_vector( 32-1 downto 0 );
  signal delay_q_net : std_logic_vector( 32-1 downto 0 );
  signal cmult3_p_net : std_logic_vector( 32-1 downto 0 );
  signal cmult4_p_net : std_logic_vector( 32-1 downto 0 );
  signal addsub4_s_net : std_logic_vector( 32-1 downto 0 );
  signal convert_dout_net : std_logic_vector( 32-1 downto 0 );
  signal cmult2_p_net : std_logic_vector( 32-1 downto 0 );
  signal cmult5_p_net : std_logic_vector( 32-1 downto 0 );
  signal cmult_p_net : std_logic_vector( 32-1 downto 0 );
  signal delay10_q_net : std_logic_vector( 32-1 downto 0 );
  signal cmult1_p_net : std_logic_vector( 32-1 downto 0 );
  signal xto4th_p_net : std_logic_vector( 32-1 downto 0 );
  signal mult8_p_net : std_logic_vector( 32-1 downto 0 );
  signal delay2_q_net : std_logic_vector( 32-1 downto 0 );
  signal x_sq_p_net : std_logic_vector( 32-1 downto 0 );
  signal delay9_q_net : std_logic_vector( 32-1 downto 0 );
  signal x_cube_p_net : std_logic_vector( 32-1 downto 0 );
  signal delay3_q_net : std_logic_vector( 32-1 downto 0 );
  signal delay4_q_net : std_logic_vector( 32-1 downto 0 );
  signal delay1_q_net : std_logic_vector( 32-1 downto 0 );
  signal xto6th_p_net : std_logic_vector( 32-1 downto 0 );
  signal delay12_q_net : std_logic_vector( 32-1 downto 0 );
  signal mult6_p_net : std_logic_vector( 32-1 downto 0 );
  signal mult1_p_net : std_logic_vector( 32-1 downto 0 );
  signal mult4_p_net : std_logic_vector( 32-1 downto 0 );
  signal mult3_p_net : std_logic_vector( 32-1 downto 0 );
  signal mult5_p_net : std_logic_vector( 32-1 downto 0 );
  signal mult2_p_net : std_logic_vector( 32-1 downto 0 );
  signal xto4th1_p_net : std_logic_vector( 32-1 downto 0 );
  signal mult7_p_net : std_logic_vector( 32-1 downto 0 );
  signal xto4th3_p_net : std_logic_vector( 32-1 downto 0 );
begin
  dqm_in_net <= dqm_in;
  gateway_out <= addsub5_s_net;
  clk_net <= clk_1;
  ce_net <= ce_1;
  addsub : entity xil_defaultlib.dqmtoebno_xlfpaddsub 
  generic map (
    a_arith => xlFloat,
    a_bin_pt => 24,
    a_tdata_width => 32,
    a_width => 32,
    b_arith => xlFloat,
    b_bin_pt => 24,
    b_width => 32,
    c_latency => 1,
    core_name0 => "dqmtoebno_floating_point_v7_1_i0",
    extra_registers => 0,
    latency => 1,
    overflow => 1,
    quantization => 1,
    s_arith => xlFloat,
    s_bin_pt => 24,
    s_tdata_width => 32,
    s_width => 32
  )
  port map (
    clr => '0',
    en => "1",
    a => constant6_op_net,
    b => delay8_q_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub_s_net
  );
  addsub1 : entity xil_defaultlib.dqmtoebno_xlfpaddsub 
  generic map (
    a_arith => xlFloat,
    a_bin_pt => 24,
    a_tdata_width => 32,
    a_width => 32,
    b_arith => xlFloat,
    b_bin_pt => 24,
    b_width => 32,
    c_latency => 1,
    core_name0 => "dqmtoebno_floating_point_v7_1_i0",
    extra_registers => 0,
    latency => 1,
    overflow => 1,
    quantization => 1,
    s_arith => xlFloat,
    s_bin_pt => 24,
    s_tdata_width => 32,
    s_width => 32
  )
  port map (
    clr => '0',
    en => "1",
    a => delay7_q_net,
    b => delay6_q_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub1_s_net
  );
  addsub2 : entity xil_defaultlib.dqmtoebno_xlfpaddsub 
  generic map (
    a_arith => xlFloat,
    a_bin_pt => 24,
    a_tdata_width => 32,
    a_width => 32,
    b_arith => xlFloat,
    b_bin_pt => 24,
    b_width => 32,
    c_latency => 1,
    core_name0 => "dqmtoebno_floating_point_v7_1_i0",
    extra_registers => 0,
    latency => 1,
    overflow => 1,
    quantization => 1,
    s_arith => xlFloat,
    s_bin_pt => 24,
    s_tdata_width => 32,
    s_width => 32
  )
  port map (
    clr => '0',
    en => "1",
    a => addsub_s_net,
    b => addsub1_s_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub2_s_net
  );
  addsub3 : entity xil_defaultlib.dqmtoebno_xlfpaddsub 
  generic map (
    a_arith => xlFloat,
    a_bin_pt => 24,
    a_tdata_width => 32,
    a_width => 32,
    b_arith => xlFloat,
    b_bin_pt => 24,
    b_width => 32,
    c_latency => 1,
    core_name0 => "dqmtoebno_floating_point_v7_1_i0",
    extra_registers => 0,
    latency => 1,
    overflow => 1,
    quantization => 1,
    s_arith => xlFloat,
    s_bin_pt => 24,
    s_tdata_width => 32,
    s_width => 32
  )
  port map (
    clr => '0',
    en => "1",
    a => delay5_q_net,
    b => xto5th_p_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub3_s_net
  );
  addsub4 : entity xil_defaultlib.dqmtoebno_xlfpaddsub 
  generic map (
    a_arith => xlFloat,
    a_bin_pt => 24,
    a_tdata_width => 32,
    a_width => 32,
    b_arith => xlFloat,
    b_bin_pt => 24,
    b_width => 32,
    c_latency => 1,
    core_name0 => "dqmtoebno_floating_point_v7_1_i0",
    extra_registers => 0,
    latency => 1,
    overflow => 1,
    quantization => 1,
    s_arith => xlFloat,
    s_bin_pt => 24,
    s_tdata_width => 32,
    s_width => 32
  )
  port map (
    clr => '0',
    en => "1",
    a => addsub3_s_net,
    b => delay10_q_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub4_s_net
  );
  addsub5 : entity xil_defaultlib.dqmtoebno_xlfpaddsub 
  generic map (
    a_arith => xlFloat,
    a_bin_pt => 24,
    a_tdata_width => 32,
    a_width => 32,
    b_arith => xlFloat,
    b_bin_pt => 24,
    b_width => 32,
    c_latency => 1,
    core_name0 => "dqmtoebno_floating_point_v7_1_i0",
    extra_registers => 0,
    latency => 1,
    overflow => 1,
    quantization => 1,
    s_arith => xlFloat,
    s_bin_pt => 24,
    s_tdata_width => 32,
    s_width => 32
  )
  port map (
    clr => '0',
    en => "1",
    a => addsub2_s_net,
    b => addsub4_s_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub5_s_net
  );
  cmult : entity xil_defaultlib.dqmtoebno_xlfpcmult 
  generic map (
    a_arith => xlFloat,
    a_bin_pt => 24,
    a_tdata_width => 32,
    a_width => 32,
    c_latency => 1,
    const_value => b"00110101101010100100111110011111",
    core_name0 => "dqmtoebno_floating_point_v7_1_i1",
    extra_registers => 0,
    latency => 1,
    overflow => 1,
    p_arith => xlFloat,
    p_bin_pt => 24,
    p_tdata_width => 32,
    p_width => 32,
    quantization => 1
  )
  port map (
    clr => '0',
    en => "1",
    a => convert_dout_net,
    clk => clk_net,
    ce => ce_net,
    p => cmult_p_net
  );
  cmult1 : entity xil_defaultlib.dqmtoebno_xlfpcmult 
  generic map (
    a_arith => xlFloat,
    a_bin_pt => 24,
    a_tdata_width => 32,
    a_width => 32,
    c_latency => 1,
    const_value => b"00111001010100101000110101110111",
    core_name0 => "dqmtoebno_floating_point_v7_1_i1",
    extra_registers => 0,
    latency => 1,
    overflow => 1,
    p_arith => xlFloat,
    p_bin_pt => 24,
    p_tdata_width => 32,
    p_width => 32,
    quantization => 1
  )
  port map (
    clr => '0',
    en => "1",
    a => convert_dout_net,
    clk => clk_net,
    ce => ce_net,
    p => cmult1_p_net
  );
  cmult2 : entity xil_defaultlib.dqmtoebno_xlfpcmult 
  generic map (
    a_arith => xlFloat,
    a_bin_pt => 24,
    a_tdata_width => 32,
    a_width => 32,
    c_latency => 1,
    const_value => b"10111001000010100000110011101100",
    core_name0 => "dqmtoebno_floating_point_v7_1_i1",
    extra_registers => 0,
    latency => 1,
    overflow => 1,
    p_arith => xlFloat,
    p_bin_pt => 24,
    p_tdata_width => 32,
    p_width => 32,
    quantization => 1
  )
  port map (
    clr => '0',
    en => "1",
    a => convert_dout_net,
    clk => clk_net,
    ce => ce_net,
    p => cmult2_p_net
  );
  cmult3 : entity xil_defaultlib.dqmtoebno_xlfpcmult 
  generic map (
    a_arith => xlFloat,
    a_bin_pt => 24,
    a_tdata_width => 32,
    a_width => 32,
    c_latency => 1,
    const_value => b"00111000110000111001001100111001",
    core_name0 => "dqmtoebno_floating_point_v7_1_i1",
    extra_registers => 0,
    latency => 1,
    overflow => 1,
    p_arith => xlFloat,
    p_bin_pt => 24,
    p_tdata_width => 32,
    p_width => 32,
    quantization => 1
  )
  port map (
    clr => '0',
    en => "1",
    a => convert_dout_net,
    clk => clk_net,
    ce => ce_net,
    p => cmult3_p_net
  );
  cmult4 : entity xil_defaultlib.dqmtoebno_xlfpcmult 
  generic map (
    a_arith => xlFloat,
    a_bin_pt => 24,
    a_tdata_width => 32,
    a_width => 32,
    c_latency => 1,
    const_value => b"10111000100010010111100011101111",
    core_name0 => "dqmtoebno_floating_point_v7_1_i1",
    extra_registers => 0,
    latency => 1,
    overflow => 1,
    p_arith => xlFloat,
    p_bin_pt => 24,
    p_tdata_width => 32,
    p_width => 32,
    quantization => 1
  )
  port map (
    clr => '0',
    en => "1",
    a => convert_dout_net,
    clk => clk_net,
    ce => ce_net,
    p => cmult4_p_net
  );
  cmult5 : entity xil_defaultlib.dqmtoebno_xlfpcmult 
  generic map (
    a_arith => xlFloat,
    a_bin_pt => 24,
    a_tdata_width => 32,
    a_width => 32,
    c_latency => 1,
    const_value => b"00111000001111000010111011111100",
    core_name0 => "dqmtoebno_floating_point_v7_1_i1",
    extra_registers => 0,
    latency => 1,
    overflow => 1,
    p_arith => xlFloat,
    p_bin_pt => 24,
    p_tdata_width => 32,
    p_width => 32,
    quantization => 1
  )
  port map (
    clr => '0',
    en => "1",
    a => convert_dout_net,
    clk => clk_net,
    ce => ce_net,
    p => cmult5_p_net
  );
  constant6 : entity xil_defaultlib.sysgen_constant_e810ce5415 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant6_op_net
  );
  delay : entity xil_defaultlib.dqmtoebno_xldelay 
  generic map (
    latency => 3,
    reg_retiming => 0,
    reset => 0,
    width => 32
  )
  port map (
    en => '1',
    rst => '1',
    d => mult8_p_net,
    clk => clk_net,
    ce => ce_net,
    q => delay_q_net
  );
  delay1 : entity xil_defaultlib.dqmtoebno_xldelay 
  generic map (
    latency => 3,
    reg_retiming => 0,
    reset => 0,
    width => 32
  )
  port map (
    en => '1',
    rst => '1',
    d => delay9_q_net,
    clk => clk_net,
    ce => ce_net,
    q => delay1_q_net
  );
  delay10 : entity xil_defaultlib.dqmtoebno_xldelay 
  generic map (
    latency => 1,
    reg_retiming => 0,
    reset => 0,
    width => 32
  )
  port map (
    en => '1',
    rst => '1',
    d => xto6th_p_net,
    clk => clk_net,
    ce => ce_net,
    q => delay10_q_net
  );
  delay12 : entity xil_defaultlib.dqmtoebno_xldelay 
  generic map (
    latency => 3,
    reg_retiming => 0,
    reset => 0,
    width => 32
  )
  port map (
    en => '1',
    rst => '1',
    d => cmult2_p_net,
    clk => clk_net,
    ce => ce_net,
    q => delay12_q_net
  );
  delay2 : entity xil_defaultlib.dqmtoebno_xldelay 
  generic map (
    latency => 3,
    reg_retiming => 0,
    reset => 0,
    width => 32
  )
  port map (
    en => '1',
    rst => '1',
    d => x_sq_p_net,
    clk => clk_net,
    ce => ce_net,
    q => delay2_q_net
  );
  delay3 : entity xil_defaultlib.dqmtoebno_xldelay 
  generic map (
    latency => 3,
    reg_retiming => 0,
    reset => 0,
    width => 32
  )
  port map (
    en => '1',
    rst => '1',
    d => delay4_q_net,
    clk => clk_net,
    ce => ce_net,
    q => delay3_q_net
  );
  delay4 : entity xil_defaultlib.dqmtoebno_xldelay 
  generic map (
    latency => 3,
    reg_retiming => 0,
    reset => 0,
    width => 32
  )
  port map (
    en => '1',
    rst => '1',
    d => cmult_p_net,
    clk => clk_net,
    ce => ce_net,
    q => delay4_q_net
  );
  delay5 : entity xil_defaultlib.dqmtoebno_xldelay 
  generic map (
    latency => 3,
    reg_retiming => 0,
    reset => 0,
    width => 32
  )
  port map (
    en => '1',
    rst => '1',
    d => xto4th_p_net,
    clk => clk_net,
    ce => ce_net,
    q => delay5_q_net
  );
  delay6 : entity xil_defaultlib.dqmtoebno_xldelay 
  generic map (
    latency => 3,
    reg_retiming => 0,
    reset => 0,
    width => 32
  )
  port map (
    en => '1',
    rst => '1',
    d => x_cube_p_net,
    clk => clk_net,
    ce => ce_net,
    q => delay6_q_net
  );
  delay7 : entity xil_defaultlib.dqmtoebno_xldelay 
  generic map (
    latency => 3,
    reg_retiming => 0,
    reset => 0,
    width => 32
  )
  port map (
    en => '1',
    rst => '1',
    d => delay2_q_net,
    clk => clk_net,
    ce => ce_net,
    q => delay7_q_net
  );
  delay8 : entity xil_defaultlib.dqmtoebno_xldelay 
  generic map (
    latency => 3,
    reg_retiming => 0,
    reset => 0,
    width => 32
  )
  port map (
    en => '1',
    rst => '1',
    d => delay3_q_net,
    clk => clk_net,
    ce => ce_net,
    q => delay8_q_net
  );
  delay9 : entity xil_defaultlib.dqmtoebno_xldelay 
  generic map (
    latency => 3,
    reg_retiming => 0,
    reset => 0,
    width => 32
  )
  port map (
    en => '1',
    rst => '1',
    d => cmult4_p_net,
    clk => clk_net,
    ce => ce_net,
    q => delay9_q_net
  );
  mult1 : entity xil_defaultlib.dqmtoebno_xlfpmult 
  generic map (
    a_arith => xlFloat,
    a_bin_pt => 24,
    a_tdata_width => 32,
    a_width => 32,
    b_arith => xlFloat,
    b_bin_pt => 24,
    b_width => 32,
    c_latency => 3,
    core_name0 => "dqmtoebno_floating_point_v7_1_i2",
    extra_registers => 0,
    latency => 3,
    overflow => 1,
    p_arith => xlFloat,
    p_bin_pt => 24,
    p_tdata_width => 32,
    p_width => 32,
    quantization => 1
  )
  port map (
    clr => '0',
    en => "1",
    a => cmult4_p_net,
    b => cmult4_p_net,
    clk => clk_net,
    ce => ce_net,
    p => mult1_p_net
  );
  mult2 : entity xil_defaultlib.dqmtoebno_xlfpmult 
  generic map (
    a_arith => xlFloat,
    a_bin_pt => 24,
    a_tdata_width => 32,
    a_width => 32,
    b_arith => xlFloat,
    b_bin_pt => 24,
    b_width => 32,
    c_latency => 3,
    core_name0 => "dqmtoebno_floating_point_v7_1_i2",
    extra_registers => 0,
    latency => 3,
    overflow => 1,
    p_arith => xlFloat,
    p_bin_pt => 24,
    p_tdata_width => 32,
    p_width => 32,
    quantization => 1
  )
  port map (
    clr => '0',
    en => "1",
    a => cmult2_p_net,
    b => cmult2_p_net,
    clk => clk_net,
    ce => ce_net,
    p => mult2_p_net
  );
  mult3 : entity xil_defaultlib.dqmtoebno_xlfpmult 
  generic map (
    a_arith => xlFloat,
    a_bin_pt => 24,
    a_tdata_width => 32,
    a_width => 32,
    b_arith => xlFloat,
    b_bin_pt => 24,
    b_width => 32,
    c_latency => 3,
    core_name0 => "dqmtoebno_floating_point_v7_1_i2",
    extra_registers => 0,
    latency => 3,
    overflow => 1,
    p_arith => xlFloat,
    p_bin_pt => 24,
    p_tdata_width => 32,
    p_width => 32,
    quantization => 1
  )
  port map (
    clr => '0',
    en => "1",
    a => cmult4_p_net,
    b => cmult4_p_net,
    clk => clk_net,
    ce => ce_net,
    p => mult3_p_net
  );
  mult4 : entity xil_defaultlib.dqmtoebno_xlfpmult 
  generic map (
    a_arith => xlFloat,
    a_bin_pt => 24,
    a_tdata_width => 32,
    a_width => 32,
    b_arith => xlFloat,
    b_bin_pt => 24,
    b_width => 32,
    c_latency => 3,
    core_name0 => "dqmtoebno_floating_point_v7_1_i2",
    extra_registers => 0,
    latency => 3,
    overflow => 1,
    p_arith => xlFloat,
    p_bin_pt => 24,
    p_tdata_width => 32,
    p_width => 32,
    quantization => 1
  )
  port map (
    clr => '0',
    en => "1",
    a => cmult3_p_net,
    b => cmult3_p_net,
    clk => clk_net,
    ce => ce_net,
    p => mult4_p_net
  );
  mult5 : entity xil_defaultlib.dqmtoebno_xlfpmult 
  generic map (
    a_arith => xlFloat,
    a_bin_pt => 24,
    a_tdata_width => 32,
    a_width => 32,
    b_arith => xlFloat,
    b_bin_pt => 24,
    b_width => 32,
    c_latency => 3,
    core_name0 => "dqmtoebno_floating_point_v7_1_i2",
    extra_registers => 0,
    latency => 3,
    overflow => 1,
    p_arith => xlFloat,
    p_bin_pt => 24,
    p_tdata_width => 32,
    p_width => 32,
    quantization => 1
  )
  port map (
    clr => '0',
    en => "1",
    a => cmult5_p_net,
    b => cmult5_p_net,
    clk => clk_net,
    ce => ce_net,
    p => mult5_p_net
  );
  mult6 : entity xil_defaultlib.dqmtoebno_xlfpmult 
  generic map (
    a_arith => xlFloat,
    a_bin_pt => 24,
    a_tdata_width => 32,
    a_width => 32,
    b_arith => xlFloat,
    b_bin_pt => 24,
    b_width => 32,
    c_latency => 3,
    core_name0 => "dqmtoebno_floating_point_v7_1_i2",
    extra_registers => 0,
    latency => 3,
    overflow => 1,
    p_arith => xlFloat,
    p_bin_pt => 24,
    p_tdata_width => 32,
    p_width => 32,
    quantization => 1
  )
  port map (
    clr => '0',
    en => "1",
    a => cmult3_p_net,
    b => cmult3_p_net,
    clk => clk_net,
    ce => ce_net,
    p => mult6_p_net
  );
  mult7 : entity xil_defaultlib.dqmtoebno_xlfpmult 
  generic map (
    a_arith => xlFloat,
    a_bin_pt => 24,
    a_tdata_width => 32,
    a_width => 32,
    b_arith => xlFloat,
    b_bin_pt => 24,
    b_width => 32,
    c_latency => 3,
    core_name0 => "dqmtoebno_floating_point_v7_1_i2",
    extra_registers => 0,
    latency => 3,
    overflow => 1,
    p_arith => xlFloat,
    p_bin_pt => 24,
    p_tdata_width => 32,
    p_width => 32,
    quantization => 1
  )
  port map (
    clr => '0',
    en => "1",
    a => cmult5_p_net,
    b => cmult5_p_net,
    clk => clk_net,
    ce => ce_net,
    p => mult7_p_net
  );
  mult8 : entity xil_defaultlib.dqmtoebno_xlfpmult 
  generic map (
    a_arith => xlFloat,
    a_bin_pt => 24,
    a_tdata_width => 32,
    a_width => 32,
    b_arith => xlFloat,
    b_bin_pt => 24,
    b_width => 32,
    c_latency => 3,
    core_name0 => "dqmtoebno_floating_point_v7_1_i2",
    extra_registers => 0,
    latency => 3,
    overflow => 1,
    p_arith => xlFloat,
    p_bin_pt => 24,
    p_tdata_width => 32,
    p_width => 32,
    quantization => 1
  )
  port map (
    clr => '0',
    en => "1",
    a => cmult5_p_net,
    b => cmult5_p_net,
    clk => clk_net,
    ce => ce_net,
    p => mult8_p_net
  );
  x_cube : entity xil_defaultlib.dqmtoebno_xlfpmult 
  generic map (
    a_arith => xlFloat,
    a_bin_pt => 24,
    a_tdata_width => 32,
    a_width => 32,
    b_arith => xlFloat,
    b_bin_pt => 24,
    b_width => 32,
    c_latency => 3,
    core_name0 => "dqmtoebno_floating_point_v7_1_i2",
    extra_registers => 0,
    latency => 3,
    overflow => 1,
    p_arith => xlFloat,
    p_bin_pt => 24,
    p_tdata_width => 32,
    p_width => 32,
    quantization => 1
  )
  port map (
    clr => '0',
    en => "1",
    a => mult2_p_net,
    b => delay12_q_net,
    clk => clk_net,
    ce => ce_net,
    p => x_cube_p_net
  );
  x_sq : entity xil_defaultlib.dqmtoebno_xlfpmult 
  generic map (
    a_arith => xlFloat,
    a_bin_pt => 24,
    a_tdata_width => 32,
    a_width => 32,
    b_arith => xlFloat,
    b_bin_pt => 24,
    b_width => 32,
    c_latency => 3,
    core_name0 => "dqmtoebno_floating_point_v7_1_i2",
    extra_registers => 0,
    latency => 3,
    overflow => 1,
    p_arith => xlFloat,
    p_bin_pt => 24,
    p_tdata_width => 32,
    p_width => 32,
    quantization => 1
  )
  port map (
    clr => '0',
    en => "1",
    a => cmult1_p_net,
    b => cmult1_p_net,
    clk => clk_net,
    ce => ce_net,
    p => x_sq_p_net
  );
  xto4th : entity xil_defaultlib.dqmtoebno_xlfpmult 
  generic map (
    a_arith => xlFloat,
    a_bin_pt => 24,
    a_tdata_width => 32,
    a_width => 32,
    b_arith => xlFloat,
    b_bin_pt => 24,
    b_width => 32,
    c_latency => 3,
    core_name0 => "dqmtoebno_floating_point_v7_1_i2",
    extra_registers => 0,
    latency => 3,
    overflow => 1,
    p_arith => xlFloat,
    p_bin_pt => 24,
    p_tdata_width => 32,
    p_width => 32,
    quantization => 1
  )
  port map (
    clr => '0',
    en => "1",
    a => mult4_p_net,
    b => mult6_p_net,
    clk => clk_net,
    ce => ce_net,
    p => xto4th_p_net
  );
  xto4th1 : entity xil_defaultlib.dqmtoebno_xlfpmult 
  generic map (
    a_arith => xlFloat,
    a_bin_pt => 24,
    a_tdata_width => 32,
    a_width => 32,
    b_arith => xlFloat,
    b_bin_pt => 24,
    b_width => 32,
    c_latency => 3,
    core_name0 => "dqmtoebno_floating_point_v7_1_i2",
    extra_registers => 0,
    latency => 3,
    overflow => 1,
    p_arith => xlFloat,
    p_bin_pt => 24,
    p_tdata_width => 32,
    p_width => 32,
    quantization => 1
  )
  port map (
    clr => '0',
    en => "1",
    a => mult1_p_net,
    b => mult3_p_net,
    clk => clk_net,
    ce => ce_net,
    p => xto4th1_p_net
  );
  xto4th3 : entity xil_defaultlib.dqmtoebno_xlfpmult 
  generic map (
    a_arith => xlFloat,
    a_bin_pt => 24,
    a_tdata_width => 32,
    a_width => 32,
    b_arith => xlFloat,
    b_bin_pt => 24,
    b_width => 32,
    c_latency => 3,
    core_name0 => "dqmtoebno_floating_point_v7_1_i2",
    extra_registers => 0,
    latency => 3,
    overflow => 1,
    p_arith => xlFloat,
    p_bin_pt => 24,
    p_tdata_width => 32,
    p_width => 32,
    quantization => 1
  )
  port map (
    clr => '0',
    en => "1",
    a => mult5_p_net,
    b => mult7_p_net,
    clk => clk_net,
    ce => ce_net,
    p => xto4th3_p_net
  );
  xto5th : entity xil_defaultlib.dqmtoebno_xlfpmult 
  generic map (
    a_arith => xlFloat,
    a_bin_pt => 24,
    a_tdata_width => 32,
    a_width => 32,
    b_arith => xlFloat,
    b_bin_pt => 24,
    b_width => 32,
    c_latency => 3,
    core_name0 => "dqmtoebno_floating_point_v7_1_i2",
    extra_registers => 0,
    latency => 3,
    overflow => 1,
    p_arith => xlFloat,
    p_bin_pt => 24,
    p_tdata_width => 32,
    p_width => 32,
    quantization => 1
  )
  port map (
    clr => '0',
    en => "1",
    a => xto4th1_p_net,
    b => delay1_q_net,
    clk => clk_net,
    ce => ce_net,
    p => xto5th_p_net
  );
  xto6th : entity xil_defaultlib.dqmtoebno_xlfpmult 
  generic map (
    a_arith => xlFloat,
    a_bin_pt => 24,
    a_tdata_width => 32,
    a_width => 32,
    b_arith => xlFloat,
    b_bin_pt => 24,
    b_width => 32,
    c_latency => 3,
    core_name0 => "dqmtoebno_floating_point_v7_1_i2",
    extra_registers => 0,
    latency => 3,
    overflow => 1,
    p_arith => xlFloat,
    p_bin_pt => 24,
    p_tdata_width => 32,
    p_width => 32,
    quantization => 1
  )
  port map (
    clr => '0',
    en => "1",
    a => xto4th3_p_net,
    b => delay_q_net,
    clk => clk_net,
    ce => ce_net,
    p => xto6th_p_net
  );
  convert : entity xil_defaultlib.dqmtoebno_xlfpconvert 
  generic map (
    c_latency => 1,
    core_name0 => "dqmtoebno_floating_point_v7_1_i3",
    din_arith => xlSigned,
    din_bin_pt => 0,
    din_tdata_width => 24,
    din_width => 17,
    dout_arith => xlFloat,
    dout_bin_pt => 24,
    dout_tdata_width => 32,
    dout_width => 32,
    extra_registers => 0,
    latency => 1,
    overflow => 1,
    quantization => 1
  )
  port map (
    clr => '0',
    en => "1",
    din => dqm_in_net,
    clk => clk_net,
    ce => ce_net,
    dout => convert_dout_net
  );
end structural;
-- Generated from Simulink block 
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity dqmtoebno_default_clock_driver is
  port (
    dqmtoebno_sysclk : in std_logic;
    dqmtoebno_sysce : in std_logic;
    dqmtoebno_sysclr : in std_logic;
    dqmtoebno_clk1 : out std_logic;
    dqmtoebno_ce1 : out std_logic
  );
end dqmtoebno_default_clock_driver;
architecture structural of dqmtoebno_default_clock_driver is 
begin
  clockdriver : entity xil_defaultlib.xlclockdriver 
  generic map (
    period => 1,
    log_2_period => 1
  )
  port map (
    sysclk => dqmtoebno_sysclk,
    sysce => dqmtoebno_sysce,
    sysclr => dqmtoebno_sysclr,
    clk => dqmtoebno_clk1,
    ce => dqmtoebno_ce1
  );
end structural;
-- Generated from Simulink block 
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity dqmtoebno is
  port (
    dqm_in : in std_logic_vector( 17-1 downto 0 );
    clk : in std_logic;
    gateway_out : out std_logic_vector( 32-1 downto 0 )
  );
end dqmtoebno;
architecture structural of dqmtoebno is 
  attribute core_generation_info : string;
  attribute core_generation_info of structural : architecture is "dqmtoebno,sysgen_core_2017_2,{,compilation=IP Catalog,block_icon_display=Default,family=kintex7,part=xc7k325t,speed=-3,package=fbg676,synthesis_language=vhdl,hdl_library=xil_defaultlib,synthesis_strategy=Vivado Synthesis Defaults,implementation_strategy=Vivado Implementation Defaults,testbench=0,interface_doc=0,ce_clr=0,clock_period=10,system_simulink_period=1,waveform_viewer=0,axilite_interface=0,ip_catalog_plugin=0,hwcosim_burst_mode=0,simulation_time=1000,addsub=6,cmult=6,constant=1,convert=1,delay=12,mult=15,}";
  signal clk_1_net : std_logic;
  signal ce_1_net : std_logic;
begin
  dqmtoebno_default_clock_driver : entity xil_defaultlib.dqmtoebno_default_clock_driver 
  port map (
    dqmtoebno_sysclk => clk,
    dqmtoebno_sysce => '1',
    dqmtoebno_sysclr => '0',
    dqmtoebno_clk1 => clk_1_net,
    dqmtoebno_ce1 => ce_1_net
  );
  dqmtoebno_struct : entity xil_defaultlib.dqmtoebno_struct 
  port map (
    dqm_in => dqm_in,
    clk_1 => clk_1_net,
    ce_1 => ce_1_net,
    gateway_out => gateway_out
  );
end structural;
