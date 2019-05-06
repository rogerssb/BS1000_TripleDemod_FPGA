-- Generated from Simulink block PilotSync_struct
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity pilotsync_struct is
  port (
    imagsyncin : in std_logic_vector( 18-1 downto 0 );
    pilotindexin : in std_logic_vector( 11-1 downto 0 );
    pilotpulsein : in std_logic_vector( 1-1 downto 0 );
    realsyncin : in std_logic_vector( 18-1 downto 0 );
    validsyncin : in std_logic_vector( 1-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    imagout : out std_logic_vector( 18-1 downto 0 );
    offset : out std_logic_vector( 11-1 downto 0 );
    realout : out std_logic_vector( 18-1 downto 0 );
    startout : out std_logic_vector( 1-1 downto 0 );
    validout : out std_logic_vector( 1-1 downto 0 );
    pilot_index : out std_logic_vector( 11-1 downto 0 )
  );
end pilotsync_struct;
architecture structural of pilotsync_struct is 
  signal delay1_q_net : std_logic_vector( 1-1 downto 0 );
  signal realsyncin_net : std_logic_vector( 18-1 downto 0 );
  signal delay7_q_net : std_logic_vector( 11-1 downto 0 );
  signal pilotindexin_net : std_logic_vector( 11-1 downto 0 );
  signal imagsyncin_net : std_logic_vector( 18-1 downto 0 );
  signal pilotpulsein_net : std_logic_vector( 1-1 downto 0 );
  signal dual_port_ram2_doutb_net : std_logic_vector( 18-1 downto 0 );
  signal addsub1_s_net : std_logic_vector( 11-1 downto 0 );
  signal dual_port_ram1_doutb_net : std_logic_vector( 18-1 downto 0 );
  signal validsyncin_net : std_logic_vector( 1-1 downto 0 );
  signal delay2_q_net : std_logic_vector( 1-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal addsub_s_net : std_logic_vector( 11-1 downto 0 );
  signal counter1_op_net : std_logic_vector( 11-1 downto 0 );
  signal constant3_op_net : std_logic_vector( 11-1 downto 0 );
  signal constant5_op_net : std_logic_vector( 1-1 downto 0 );
  signal constant6_op_net : std_logic_vector( 1-1 downto 0 );
  signal dual_port_ram2_douta_net : std_logic_vector( 18-1 downto 0 );
  signal dual_port_ram1_douta_net : std_logic_vector( 18-1 downto 0 );
begin
  imagout <= dual_port_ram2_doutb_net;
  imagsyncin_net <= imagsyncin;
  offset <= addsub1_s_net;
  pilotindexin_net <= pilotindexin;
  pilotpulsein_net <= pilotpulsein;
  realout <= dual_port_ram1_doutb_net;
  realsyncin_net <= realsyncin;
  startout <= delay2_q_net;
  validout <= delay1_q_net;
  validsyncin_net <= validsyncin;
  pilot_index <= delay7_q_net;
  clk_net <= clk_1;
  ce_net <= ce_1;
  addsub : entity xil_defaultlib.pilotsync_xladdsub 
  generic map (
    a_arith => xlUnsigned,
    a_bin_pt => 0,
    a_width => 11,
    b_arith => xlUnsigned,
    b_bin_pt => 0,
    b_width => 11,
    c_has_c_out => 0,
    c_latency => 0,
    c_output_width => 12,
    core_name0 => "pilotsync_c_addsub_v12_0_i0",
    extra_registers => 0,
    full_s_arith => 2,
    full_s_width => 12,
    latency => 0,
    overflow => 1,
    quantization => 1,
    s_arith => xlUnsigned,
    s_bin_pt => 0,
    s_width => 11
  )
  port map (
    clr => '0',
    en => "1",
    a => counter1_op_net,
    b => addsub1_s_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub_s_net
  );
  addsub1 : entity xil_defaultlib.pilotsync_xladdsub 
  generic map (
    a_arith => xlUnsigned,
    a_bin_pt => 0,
    a_width => 11,
    b_arith => xlSigned,
    b_bin_pt => 0,
    b_width => 11,
    c_has_c_out => 0,
    c_latency => 0,
    c_output_width => 13,
    core_name0 => "pilotsync_c_addsub_v12_0_i1",
    extra_registers => 0,
    full_s_arith => 2,
    full_s_width => 13,
    latency => 0,
    overflow => 1,
    quantization => 1,
    s_arith => xlUnsigned,
    s_bin_pt => 0,
    s_width => 11
  )
  port map (
    clr => '0',
    en => "1",
    a => constant3_op_net,
    b => delay7_q_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub1_s_net
  );
  constant3 : entity xil_defaultlib.sysgen_constant_65333bd5fa 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant3_op_net
  );
  constant5 : entity xil_defaultlib.sysgen_constant_7ac2718fce 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant5_op_net
  );
  constant6 : entity xil_defaultlib.sysgen_constant_3e1eb317a7 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant6_op_net
  );
  counter1 : entity xil_defaultlib.pilotsync_xlcounter_limit 
  generic map (
    cnt_15_0 => 2047,
    cnt_31_16 => 0,
    cnt_47_32 => 0,
    cnt_63_48 => 0,
    core_name0 => "pilotsync_c_counter_binary_v12_0_i0",
    count_limited => 0,
    op_arith => xlUnsigned,
    op_width => 11
  )
  port map (
    rst => "0",
    clr => '0',
    en => validsyncin_net,
    clk => clk_net,
    ce => ce_net,
    op => counter1_op_net
  );
  delay1 : entity xil_defaultlib.pilotsync_xldelay 
  generic map (
    latency => 1,
    reg_retiming => 0,
    reset => 0,
    width => 1
  )
  port map (
    en => '1',
    rst => '1',
    d => validsyncin_net,
    clk => clk_net,
    ce => ce_net,
    q => delay1_q_net
  );
  delay2 : entity xil_defaultlib.pilotsync_xldelay 
  generic map (
    latency => 1,
    reg_retiming => 0,
    reset => 0,
    width => 1
  )
  port map (
    en => '1',
    rst => '1',
    d => pilotpulsein_net,
    clk => clk_net,
    ce => ce_net,
    q => delay2_q_net
  );
  delay7 : entity xil_defaultlib.pilotsync_xldelay 
  generic map (
    latency => 1,
    reg_retiming => 0,
    reset => 0,
    width => 11
  )
  port map (
    rst => '1',
    d => pilotindexin_net,
    en => pilotpulsein_net(0),
    clk => clk_net,
    ce => ce_net,
    q => delay7_q_net
  );
  dual_port_ram1 : entity xil_defaultlib.pilotsync_xldpram 
  generic map (
    c_address_width_a => 11,
    c_address_width_b => 11,
    c_width_a => 18,
    c_width_b => 18,
    core_name0 => "pilotsync_blk_mem_gen_v8_3_i0",
    latency => 1
  )
  port map (
    enb => "1",
    rsta => "0",
    rstb => "0",
    addra => counter1_op_net,
    dina => realsyncin_net,
    wea => validsyncin_net,
    addrb => addsub_s_net,
    dinb => realsyncin_net,
    web => constant5_op_net,
    ena => constant6_op_net,
    a_clk => clk_net,
    a_ce => ce_net,
    b_clk => clk_net,
    b_ce => ce_net,
    douta => dual_port_ram1_douta_net,
    doutb => dual_port_ram1_doutb_net
  );
  dual_port_ram2 : entity xil_defaultlib.pilotsync_xldpram 
  generic map (
    c_address_width_a => 11,
    c_address_width_b => 11,
    c_width_a => 18,
    c_width_b => 18,
    core_name0 => "pilotsync_blk_mem_gen_v8_3_i0",
    latency => 1
  )
  port map (
    enb => "1",
    rsta => "0",
    rstb => "0",
    addra => counter1_op_net,
    dina => imagsyncin_net,
    wea => validsyncin_net,
    addrb => addsub_s_net,
    dinb => imagsyncin_net,
    web => constant5_op_net,
    ena => constant6_op_net,
    a_clk => clk_net,
    a_ce => ce_net,
    b_clk => clk_net,
    b_ce => ce_net,
    douta => dual_port_ram2_douta_net,
    doutb => dual_port_ram2_doutb_net
  );
end structural;
-- Generated from Simulink block 
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity pilotsync_default_clock_driver is
  port (
    brik1_sysclk : in std_logic;
    brik1_sysce : in std_logic;
    brik1_sysclr : in std_logic;
    brik1_clk1 : out std_logic;
    brik1_ce1 : out std_logic
  );
end pilotsync_default_clock_driver;
architecture structural of pilotsync_default_clock_driver is 
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
entity pilotsync is
  port (
    imagsyncin : in std_logic_vector( 18-1 downto 0 );
    pilotindexin : in std_logic_vector( 11-1 downto 0 );
    pilotpulsein : in std_logic_vector( 1-1 downto 0 );
    realsyncin : in std_logic_vector( 18-1 downto 0 );
    validsyncin : in std_logic_vector( 1-1 downto 0 );
    clk : in std_logic;
    imagout : out std_logic_vector( 18-1 downto 0 );
    offset : out std_logic_vector( 11-1 downto 0 );
    realout : out std_logic_vector( 18-1 downto 0 );
    startout : out std_logic_vector( 1-1 downto 0 );
    validout : out std_logic_vector( 1-1 downto 0 );
    pilot_index : out std_logic_vector( 11-1 downto 0 )
  );
end pilotsync;
architecture structural of pilotsync is 
  attribute core_generation_info : string;
  attribute core_generation_info of structural : architecture is "pilotsync,sysgen_core_2016_2,{,compilation=IP Catalog,block_icon_display=Default,family=kintex7,part=xc7k160t,speed=-2,package=ffg676,synthesis_language=vhdl,hdl_library=xil_defaultlib,synthesis_strategy=Vivado Synthesis Defaults,implementation_strategy=Vivado Implementation Defaults,testbench=0,interface_doc=1,ce_clr=0,clock_period=5.35906,system_simulink_period=1,waveform_viewer=0,axilite_interface=0,ip_catalog_plugin=0,hwcosim_burst_mode=0,simulation_time=190000,addsub=2,constant=3,counter=1,delay=3,dpram=2,}";
  signal ce_1_net : std_logic;
  signal clk_1_net : std_logic;
begin
  pilotsync_default_clock_driver : entity xil_defaultlib.pilotsync_default_clock_driver 
  port map (
    brik1_sysclk => clk,
    brik1_sysce => '1',
    brik1_sysclr => '0',
    brik1_clk1 => clk_1_net,
    brik1_ce1 => ce_1_net
  );
  pilotsync_struct : entity xil_defaultlib.pilotsync_struct 
  port map (
    imagsyncin => imagsyncin,
    pilotindexin => pilotindexin,
    pilotpulsein => pilotpulsein,
    realsyncin => realsyncin,
    validsyncin => validsyncin,
    clk_1 => clk_1_net,
    ce_1 => ce_1_net,
    imagout => imagout,
    offset => offset,
    realout => realout,
    startout => startout,
    validout => validout,
    pilot_index => pilot_index
  );
end structural;
