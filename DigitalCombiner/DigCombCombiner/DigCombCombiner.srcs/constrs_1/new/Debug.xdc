

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
connect_debug_port u_ila_0/clk [get_nets [list SerDes_u/PllXn_u/inst/clk_Nx]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe0]
set_property port_width 6 [get_debug_ports u_ila_0/probe0]
connect_debug_port u_ila_0/probe0 [get_nets [list {SerDes_u/data_in_from_pins[0]} {SerDes_u/data_in_from_pins[1]} {SerDes_u/data_in_from_pins[2]} {SerDes_u/data_in_from_pins[3]} {SerDes_u/data_in_from_pins[4]} {SerDes_u/data_in_from_pins[5]}]]
create_debug_core u_ila_1 ila
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_1]
set_property ALL_PROBE_SAME_MU_CNT 4 [get_debug_cores u_ila_1]
set_property C_ADV_TRIGGER true [get_debug_cores u_ila_1]
set_property C_DATA_DEPTH 8192 [get_debug_cores u_ila_1]
set_property C_EN_STRG_QUAL true [get_debug_cores u_ila_1]
set_property C_INPUT_PIPE_STAGES 2 [get_debug_cores u_ila_1]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_1]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_1]
set_property port_width 1 [get_debug_ports u_ila_1/clk]
connect_debug_port u_ila_1/clk [get_nets [list SerDes_u/PllXn_u/inst/clk_1x]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe0]
set_property port_width 8 [get_debug_ports u_ila_1/probe0]
connect_debug_port u_ila_1/probe0 [get_nets [list {SerDes_u/DataOut2[2][0]} {SerDes_u/DataOut2[2][1]} {SerDes_u/DataOut2[2][2]} {SerDes_u/DataOut2[2][3]} {SerDes_u/DataOut2[2][4]} {SerDes_u/DataOut2[2][5]} {SerDes_u/DataOut2[2][6]} {SerDes_u/DataOut2[2][7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe1]
set_property port_width 1 [get_debug_ports u_ila_0/probe1]
connect_debug_port u_ila_0/probe1 [get_nets [list {SerDes_u/ChBitSlip2_reg_n_0_[5]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe2]
set_property port_width 1 [get_debug_ports u_ila_0/probe2]
connect_debug_port u_ila_0/probe2 [get_nets [list SerDes_u/ClkStoppedXn]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe3]
set_property port_width 1 [get_debug_ports u_ila_0/probe3]
connect_debug_port u_ila_0/probe3 [get_nets [list SerDes_u/input_clk_stopped]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe4]
set_property port_width 1 [get_debug_ports u_ila_0/probe4]
connect_debug_port u_ila_0/probe4 [get_nets [list SerDes_u/locked]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe5]
set_property port_width 1 [get_debug_ports u_ila_0/probe5]
connect_debug_port u_ila_0/probe5 [get_nets [list SerDes_u/LockedXn]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe6]
set_property port_width 1 [get_debug_ports u_ila_0/probe6]
connect_debug_port u_ila_0/probe6 [get_nets [list SerDes_u/Clk93M]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe7]
set_property port_width 1 [get_debug_ports u_ila_0/probe7]
connect_debug_port u_ila_0/probe7 [get_nets [list SerDes_u/Clk200M]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe1]
set_property port_width 8 [get_debug_ports u_ila_1/probe1]
connect_debug_port u_ila_1/probe1 [get_nets [list {SerDes_u/DataOut2[4][0]} {SerDes_u/DataOut2[4][1]} {SerDes_u/DataOut2[4][2]} {SerDes_u/DataOut2[4][3]} {SerDes_u/DataOut2[4][4]} {SerDes_u/DataOut2[4][5]} {SerDes_u/DataOut2[4][6]} {SerDes_u/DataOut2[4][7]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe2]
set_property port_width 8 [get_debug_ports u_ila_1/probe2]
connect_debug_port u_ila_1/probe2 [get_nets [list {SerDes_u/Demux2_reg[5]__0[0]} {SerDes_u/Demux2_reg[5]__0[1]} {SerDes_u/Demux2_reg[5]__0[2]} {SerDes_u/Demux2_reg[5]__0[3]} {SerDes_u/Demux2_reg[5]__0[4]} {SerDes_u/Demux2_reg[5]__0[5]} {SerDes_u/Demux2_reg[5]__0[6]} {SerDes_u/Demux2_reg[5]__0[7]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe3]
set_property port_width 8 [get_debug_ports u_ila_1/probe3]
connect_debug_port u_ila_1/probe3 [get_nets [list {SerDes_u/DataOut2[3][0]} {SerDes_u/DataOut2[3][1]} {SerDes_u/DataOut2[3][2]} {SerDes_u/DataOut2[3][3]} {SerDes_u/DataOut2[3][4]} {SerDes_u/DataOut2[3][5]} {SerDes_u/DataOut2[3][6]} {SerDes_u/DataOut2[3][7]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe4]
set_property port_width 8 [get_debug_ports u_ila_1/probe4]
connect_debug_port u_ila_1/probe4 [get_nets [list {SerDes_u/Count2_reg__0[0]} {SerDes_u/Count2_reg__0[1]} {SerDes_u/Count2_reg__0[2]} {SerDes_u/Count2_reg__0[3]} {SerDes_u/Count2_reg__0[4]} {SerDes_u/Count2_reg__0[5]} {SerDes_u/Count2_reg__0[6]} {SerDes_u/Count2_reg__0[7]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe5]
set_property port_width 1 [get_debug_ports u_ila_1/probe5]
connect_debug_port u_ila_1/probe5 [get_nets [list {SerDes_u/bitslip[5]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe6]
set_property port_width 8 [get_debug_ports u_ila_1/probe6]
connect_debug_port u_ila_1/probe6 [get_nets [list {SerDes_u/Count1_reg__0[0]} {SerDes_u/Count1_reg__0[1]} {SerDes_u/Count1_reg__0[2]} {SerDes_u/Count1_reg__0[3]} {SerDes_u/Count1_reg__0[4]} {SerDes_u/Count1_reg__0[5]} {SerDes_u/Count1_reg__0[6]} {SerDes_u/Count1_reg__0[7]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe7]
set_property port_width 8 [get_debug_ports u_ila_1/probe7]
connect_debug_port u_ila_1/probe7 [get_nets [list {SerDes_u/DataOut2[0][0]} {SerDes_u/DataOut2[0][1]} {SerDes_u/DataOut2[0][2]} {SerDes_u/DataOut2[0][3]} {SerDes_u/DataOut2[0][4]} {SerDes_u/DataOut2[0][5]} {SerDes_u/DataOut2[0][6]} {SerDes_u/DataOut2[0][7]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe8]
set_property port_width 8 [get_debug_ports u_ila_1/probe8]
connect_debug_port u_ila_1/probe8 [get_nets [list {SerDes_u/DataOut1[3][0]} {SerDes_u/DataOut1[3][1]} {SerDes_u/DataOut1[3][2]} {SerDes_u/DataOut1[3][3]} {SerDes_u/DataOut1[3][4]} {SerDes_u/DataOut1[3][5]} {SerDes_u/DataOut1[3][6]} {SerDes_u/DataOut1[3][7]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe9]
set_property port_width 8 [get_debug_ports u_ila_1/probe9]
connect_debug_port u_ila_1/probe9 [get_nets [list {SerDes_u/DataOut1[0][0]} {SerDes_u/DataOut1[0][1]} {SerDes_u/DataOut1[0][2]} {SerDes_u/DataOut1[0][3]} {SerDes_u/DataOut1[0][4]} {SerDes_u/DataOut1[0][5]} {SerDes_u/DataOut1[0][6]} {SerDes_u/DataOut1[0][7]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe10]
set_property port_width 8 [get_debug_ports u_ila_1/probe10]
connect_debug_port u_ila_1/probe10 [get_nets [list {SerDes_u/DataOut1[4][0]} {SerDes_u/DataOut1[4][1]} {SerDes_u/DataOut1[4][2]} {SerDes_u/DataOut1[4][3]} {SerDes_u/DataOut1[4][4]} {SerDes_u/DataOut1[4][5]} {SerDes_u/DataOut1[4][6]} {SerDes_u/DataOut1[4][7]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe11]
set_property port_width 8 [get_debug_ports u_ila_1/probe11]
connect_debug_port u_ila_1/probe11 [get_nets [list {SerDes_u/DataOut1[2][0]} {SerDes_u/DataOut1[2][1]} {SerDes_u/DataOut1[2][2]} {SerDes_u/DataOut1[2][3]} {SerDes_u/DataOut1[2][4]} {SerDes_u/DataOut1[2][5]} {SerDes_u/DataOut1[2][6]} {SerDes_u/DataOut1[2][7]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe12]
set_property port_width 8 [get_debug_ports u_ila_1/probe12]
connect_debug_port u_ila_1/probe12 [get_nets [list {SerDes_u/DataOut2[1][0]} {SerDes_u/DataOut2[1][1]} {SerDes_u/DataOut2[1][2]} {SerDes_u/DataOut2[1][3]} {SerDes_u/DataOut2[1][4]} {SerDes_u/DataOut2[1][5]} {SerDes_u/DataOut2[1][6]} {SerDes_u/DataOut2[1][7]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe13]
set_property port_width 8 [get_debug_ports u_ila_1/probe13]
connect_debug_port u_ila_1/probe13 [get_nets [list {SerDes_u/DataOut1[1][0]} {SerDes_u/DataOut1[1][1]} {SerDes_u/DataOut1[1][2]} {SerDes_u/DataOut1[1][3]} {SerDes_u/DataOut1[1][4]} {SerDes_u/DataOut1[1][5]} {SerDes_u/DataOut1[1][6]} {SerDes_u/DataOut1[1][7]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe14]
set_property port_width 8 [get_debug_ports u_ila_1/probe14]
connect_debug_port u_ila_1/probe14 [get_nets [list {SerDes_u/Demux1_reg[5]__0[0]} {SerDes_u/Demux1_reg[5]__0[1]} {SerDes_u/Demux1_reg[5]__0[2]} {SerDes_u/Demux1_reg[5]__0[3]} {SerDes_u/Demux1_reg[5]__0[4]} {SerDes_u/Demux1_reg[5]__0[5]} {SerDes_u/Demux1_reg[5]__0[6]} {SerDes_u/Demux1_reg[5]__0[7]}]]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets dac1_clk_OBUF_BUFG]
