
create_debug_core u_ila_0 ila
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_0]
set_property ALL_PROBE_SAME_MU_CNT 4 [get_debug_cores u_ila_0]
set_property C_ADV_TRIGGER true [get_debug_cores u_ila_0]
set_property C_DATA_DEPTH 8192 [get_debug_cores u_ila_0]
set_property C_EN_STRG_QUAL true [get_debug_cores u_ila_0]
set_property C_INPUT_PIPE_STAGES 2 [get_debug_cores u_ila_0]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_0]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_0]
set_property port_width 1 [get_debug_ports u_ila_0/clk]
connect_debug_port u_ila_0/clk [get_nets [list DataGen.demodTop/systemClock/inst/clkOver2]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe0]
set_property port_width 14 [get_debug_ports u_ila_0/probe0]
connect_debug_port u_ila_0/probe0 [get_nets [list {GenIF/INoisy_reg[0][0]} {GenIF/INoisy_reg[0][1]} {GenIF/INoisy_reg[0][2]} {GenIF/INoisy_reg[0][3]} {GenIF/INoisy_reg[0][4]} {GenIF/INoisy_reg[0][5]} {GenIF/INoisy_reg[0][6]} {GenIF/INoisy_reg[0][7]} {GenIF/INoisy_reg[0][8]} {GenIF/INoisy_reg[0][9]} {GenIF/INoisy_reg[0][10]} {GenIF/INoisy_reg[0][11]} {GenIF/INoisy_reg[0][12]} {GenIF/INoisy_reg[0][13]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe1]
set_property port_width 32 [get_debug_ports u_ila_0/probe1]
connect_debug_port u_ila_0/probe1 [get_nets [list {DataGen.demodTop/bert/bert_counters/continuous_test_errors_reg[0]} {DataGen.demodTop/bert/bert_counters/continuous_test_errors_reg[1]} {DataGen.demodTop/bert/bert_counters/continuous_test_errors_reg[2]} {DataGen.demodTop/bert/bert_counters/continuous_test_errors_reg[3]} {DataGen.demodTop/bert/bert_counters/continuous_test_errors_reg[4]} {DataGen.demodTop/bert/bert_counters/continuous_test_errors_reg[5]} {DataGen.demodTop/bert/bert_counters/continuous_test_errors_reg[6]} {DataGen.demodTop/bert/bert_counters/continuous_test_errors_reg[7]} {DataGen.demodTop/bert/bert_counters/continuous_test_errors_reg[8]} {DataGen.demodTop/bert/bert_counters/continuous_test_errors_reg[9]} {DataGen.demodTop/bert/bert_counters/continuous_test_errors_reg[10]} {DataGen.demodTop/bert/bert_counters/continuous_test_errors_reg[11]} {DataGen.demodTop/bert/bert_counters/continuous_test_errors_reg[12]} {DataGen.demodTop/bert/bert_counters/continuous_test_errors_reg[13]} {DataGen.demodTop/bert/bert_counters/continuous_test_errors_reg[14]} {DataGen.demodTop/bert/bert_counters/continuous_test_errors_reg[15]} {DataGen.demodTop/bert/bert_counters/continuous_test_errors_reg[16]} {DataGen.demodTop/bert/bert_counters/continuous_test_errors_reg[17]} {DataGen.demodTop/bert/bert_counters/continuous_test_errors_reg[18]} {DataGen.demodTop/bert/bert_counters/continuous_test_errors_reg[19]} {DataGen.demodTop/bert/bert_counters/continuous_test_errors_reg[20]} {DataGen.demodTop/bert/bert_counters/continuous_test_errors_reg[21]} {DataGen.demodTop/bert/bert_counters/continuous_test_errors_reg[22]} {DataGen.demodTop/bert/bert_counters/continuous_test_errors_reg[23]} {DataGen.demodTop/bert/bert_counters/continuous_test_errors_reg[24]} {DataGen.demodTop/bert/bert_counters/continuous_test_errors_reg[25]} {DataGen.demodTop/bert/bert_counters/continuous_test_errors_reg[26]} {DataGen.demodTop/bert/bert_counters/continuous_test_errors_reg[27]} {DataGen.demodTop/bert/bert_counters/continuous_test_errors_reg[28]} {DataGen.demodTop/bert/bert_counters/continuous_test_errors_reg[29]} {DataGen.demodTop/bert/bert_counters/continuous_test_errors_reg[30]} {DataGen.demodTop/bert/bert_counters/continuous_test_errors_reg[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe2]
set_property port_width 18 [get_debug_ports u_ila_0/probe2]
connect_debug_port u_ila_0/probe2 [get_nets [list {DataI[0]} {DataI[1]} {DataI[2]} {DataI[3]} {DataI[4]} {DataI[5]} {DataI[6]} {DataI[7]} {DataI[8]} {DataI[9]} {DataI[10]} {DataI[11]} {DataI[12]} {DataI[13]} {DataI[14]} {DataI[15]} {DataI[16]} {DataI[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe3]
set_property port_width 18 [get_debug_ports u_ila_0/probe3]
connect_debug_port u_ila_0/probe3 [get_nets [list {DataQ[0]} {DataQ[1]} {DataQ[2]} {DataQ[3]} {DataQ[4]} {DataQ[5]} {DataQ[6]} {DataQ[7]} {DataQ[8]} {DataQ[9]} {DataQ[10]} {DataQ[11]} {DataQ[12]} {DataQ[13]} {DataQ[14]} {DataQ[15]} {DataQ[16]} {DataQ[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe4]
set_property port_width 8 [get_debug_ports u_ila_0/probe4]
connect_debug_port u_ila_0/probe4 [get_nets [list {Delay[0]} {Delay[1]} {Delay[2]} {Delay[3]} {Delay[4]} {Delay[5]} {Delay[6]} {Delay[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe5]
set_property port_width 32 [get_debug_ports u_ila_0/probe5]
connect_debug_port u_ila_0/probe5 [get_nets [list {MDB_180_1[0]} {MDB_180_1[1]} {MDB_180_1[2]} {MDB_180_1[3]} {MDB_180_1[4]} {MDB_180_1[5]} {MDB_180_1[6]} {MDB_180_1[7]} {MDB_180_1[8]} {MDB_180_1[9]} {MDB_180_1[10]} {MDB_180_1[11]} {MDB_180_1[12]} {MDB_180_1[13]} {MDB_180_1[14]} {MDB_180_1[15]} {MDB_180_1[16]} {MDB_180_1[17]} {MDB_180_1[18]} {MDB_180_1[19]} {MDB_180_1[20]} {MDB_180_1[21]} {MDB_180_1[22]} {MDB_180_1[23]} {MDB_180_1[24]} {MDB_180_1[25]} {MDB_180_1[26]} {MDB_180_1[27]} {MDB_180_1[28]} {MDB_180_1[29]} {MDB_180_1[30]} {MDB_180_1[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe6]
set_property port_width 32 [get_debug_ports u_ila_0/probe6]
connect_debug_port u_ila_0/probe6 [get_nets [list {MDB_182_3[0]} {MDB_182_3[1]} {MDB_182_3[2]} {MDB_182_3[3]} {MDB_182_3[4]} {MDB_182_3[5]} {MDB_182_3[6]} {MDB_182_3[7]} {MDB_182_3[8]} {MDB_182_3[9]} {MDB_182_3[10]} {MDB_182_3[11]} {MDB_182_3[12]} {MDB_182_3[13]} {MDB_182_3[14]} {MDB_182_3[15]} {MDB_182_3[16]} {MDB_182_3[17]} {MDB_182_3[18]} {MDB_182_3[19]} {MDB_182_3[20]} {MDB_182_3[21]} {MDB_182_3[22]} {MDB_182_3[23]} {MDB_182_3[24]} {MDB_182_3[25]} {MDB_182_3[26]} {MDB_182_3[27]} {MDB_182_3[28]} {MDB_182_3[29]} {MDB_182_3[30]} {MDB_182_3[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe7]
set_property port_width 32 [get_debug_ports u_ila_0/probe7]
connect_debug_port u_ila_0/probe7 [get_nets [list {MDB_184_5[0]} {MDB_184_5[1]} {MDB_184_5[2]} {MDB_184_5[3]} {MDB_184_5[4]} {MDB_184_5[5]} {MDB_184_5[6]} {MDB_184_5[7]} {MDB_184_5[8]} {MDB_184_5[9]} {MDB_184_5[10]} {MDB_184_5[11]} {MDB_184_5[12]} {MDB_184_5[13]} {MDB_184_5[14]} {MDB_184_5[15]} {MDB_184_5[16]} {MDB_184_5[17]} {MDB_184_5[18]} {MDB_184_5[19]} {MDB_184_5[20]} {MDB_184_5[21]} {MDB_184_5[22]} {MDB_184_5[23]} {MDB_184_5[24]} {MDB_184_5[25]} {MDB_184_5[26]} {MDB_184_5[27]} {MDB_184_5[28]} {MDB_184_5[29]} {MDB_184_5[30]} {MDB_184_5[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe8]
set_property port_width 16 [get_debug_ports u_ila_0/probe8]
connect_debug_port u_ila_0/probe8 [get_nets [list {MDB_186[0]} {MDB_186[1]} {MDB_186[2]} {MDB_186[3]} {MDB_186[4]} {MDB_186[5]} {MDB_186[6]} {MDB_186[7]} {MDB_186[8]} {MDB_186[9]} {MDB_186[10]} {MDB_186[11]} {MDB_186[12]} {MDB_186[13]} {MDB_186[14]} {MDB_186[15]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe9]
set_property port_width 16 [get_debug_ports u_ila_0/probe9]
connect_debug_port u_ila_0/probe9 [get_nets [list {MDB_187[0]} {MDB_187[1]} {MDB_187[2]} {MDB_187[3]} {MDB_187[4]} {MDB_187[5]} {MDB_187[6]} {MDB_187[7]} {MDB_187[8]} {MDB_187[9]} {MDB_187[10]} {MDB_187[11]} {MDB_187[12]} {MDB_187[13]} {MDB_187[14]} {MDB_187[15]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe10]
set_property port_width 32 [get_debug_ports u_ila_0/probe10]
connect_debug_port u_ila_0/probe10 [get_nets [list {MDB_188_9[0]} {MDB_188_9[1]} {MDB_188_9[2]} {MDB_188_9[3]} {MDB_188_9[4]} {MDB_188_9[5]} {MDB_188_9[6]} {MDB_188_9[7]} {MDB_188_9[8]} {MDB_188_9[9]} {MDB_188_9[10]} {MDB_188_9[11]} {MDB_188_9[12]} {MDB_188_9[13]} {MDB_188_9[14]} {MDB_188_9[15]} {MDB_188_9[16]} {MDB_188_9[17]} {MDB_188_9[18]} {MDB_188_9[19]} {MDB_188_9[20]} {MDB_188_9[21]} {MDB_188_9[22]} {MDB_188_9[23]} {MDB_188_9[24]} {MDB_188_9[25]} {MDB_188_9[26]} {MDB_188_9[27]} {MDB_188_9[28]} {MDB_188_9[29]} {MDB_188_9[30]} {MDB_188_9[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe11]
set_property port_width 18 [get_debug_ports u_ila_0/probe11]
connect_debug_port u_ila_0/probe11 [get_nets [list {NoiseRms[-16]} {NoiseRms[-15]} {NoiseRms[-14]} {NoiseRms[-13]} {NoiseRms[-12]} {NoiseRms[-11]} {NoiseRms[-10]} {NoiseRms[-9]} {NoiseRms[-8]} {NoiseRms[-7]} {NoiseRms[-6]} {NoiseRms[-5]} {NoiseRms[-4]} {NoiseRms[-3]} {NoiseRms[-2]} {NoiseRms[-1]} {NoiseRms[0]} {NoiseRms[1]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe12]
set_property port_width 14 [get_debug_ports u_ila_0/probe12]
connect_debug_port u_ila_0/probe12 [get_nets [list {QNoisy[-13]} {QNoisy[-12]} {QNoisy[-11]} {QNoisy[-10]} {QNoisy[-9]} {QNoisy[-8]} {QNoisy[-7]} {QNoisy[-6]} {QNoisy[-5]} {QNoisy[-4]} {QNoisy[-3]} {QNoisy[-2]} {QNoisy[-1]} {QNoisy[0]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe13]
set_property port_width 18 [get_debug_ports u_ila_0/probe13]
connect_debug_port u_ila_0/probe13 [get_nets [list {adcRms[-16]} {adcRms[-15]} {adcRms[-14]} {adcRms[-13]} {adcRms[-12]} {adcRms[-11]} {adcRms[-10]} {adcRms[-9]} {adcRms[-8]} {adcRms[-7]} {adcRms[-6]} {adcRms[-5]} {adcRms[-4]} {adcRms[-3]} {adcRms[-2]} {adcRms[-1]} {adcRms[0]} {adcRms[1]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe14]
set_property port_width 1 [get_debug_ports u_ila_0/probe14]
connect_debug_port u_ila_0/probe14 [get_nets [list ch3ClkOut_OBUF]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe15]
set_property port_width 1 [get_debug_ports u_ila_0/probe15]
connect_debug_port u_ila_0/probe15 [get_nets [list ch3DataOut_OBUF]]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets clkOver2]
