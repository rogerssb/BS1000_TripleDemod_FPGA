
create_debug_core u_ila_0 ila
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_0]
set_property ALL_PROBE_SAME_MU_CNT 1 [get_debug_cores u_ila_0]
set_property C_ADV_TRIGGER false [get_debug_cores u_ila_0]
set_property C_DATA_DEPTH 1024 [get_debug_cores u_ila_0]
set_property C_EN_STRG_QUAL false [get_debug_cores u_ila_0]
set_property C_INPUT_PIPE_STAGES 1 [get_debug_cores u_ila_0]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_0]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_0]
set_property port_width 1 [get_debug_ports u_ila_0/clk]
connect_debug_port u_ila_0/clk [get_nets [list MonClk_IBUF_BUFG]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe0]
set_property port_width 8 [get_debug_ports u_ila_0/probe0]
connect_debug_port u_ila_0/probe0 [get_nets [list {Ch2SerDes/TxData[1][0]} {Ch2SerDes/TxData[1][1]} {Ch2SerDes/TxData[1][2]} {Ch2SerDes/TxData[1][3]} {Ch2SerDes/TxData[1][4]} {Ch2SerDes/TxData[1][5]} {Ch2SerDes/TxData[1][6]} {Ch2SerDes/TxData[1][7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe1]
set_property port_width 8 [get_debug_ports u_ila_0/probe1]
connect_debug_port u_ila_0/probe1 [get_nets [list {Ch1SerDes/TxData[1][0]} {Ch1SerDes/TxData[1][1]} {Ch1SerDes/TxData[1][2]} {Ch1SerDes/TxData[1][3]} {Ch1SerDes/TxData[1][4]} {Ch1SerDes/TxData[1][5]} {Ch1SerDes/TxData[1][6]} {Ch1SerDes/TxData[1][7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe2]
set_property port_width 8 [get_debug_ports u_ila_0/probe2]
connect_debug_port u_ila_0/probe2 [get_nets [list {Ch1SerDes/TxData[2][0]} {Ch1SerDes/TxData[2][1]} {Ch1SerDes/TxData[2][2]} {Ch1SerDes/TxData[2][3]} {Ch1SerDes/TxData[2][4]} {Ch1SerDes/TxData[2][5]} {Ch1SerDes/TxData[2][6]} {Ch1SerDes/TxData[2][7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe3]
set_property port_width 8 [get_debug_ports u_ila_0/probe3]
connect_debug_port u_ila_0/probe3 [get_nets [list {Ch2SerDes/TxData[2][0]} {Ch2SerDes/TxData[2][1]} {Ch2SerDes/TxData[2][2]} {Ch2SerDes/TxData[2][3]} {Ch2SerDes/TxData[2][4]} {Ch2SerDes/TxData[2][5]} {Ch2SerDes/TxData[2][6]} {Ch2SerDes/TxData[2][7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe4]
set_property port_width 8 [get_debug_ports u_ila_0/probe4]
connect_debug_port u_ila_0/probe4 [get_nets [list {Ch2SerDes/TxData[3][0]} {Ch2SerDes/TxData[3][1]} {Ch2SerDes/TxData[3][2]} {Ch2SerDes/TxData[3][3]} {Ch2SerDes/TxData[3][4]} {Ch2SerDes/TxData[3][5]} {Ch2SerDes/TxData[3][6]} {Ch2SerDes/TxData[3][7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe5]
set_property port_width 8 [get_debug_ports u_ila_0/probe5]
connect_debug_port u_ila_0/probe5 [get_nets [list {Ch2SerDes/TxData[0][0]} {Ch2SerDes/TxData[0][1]} {Ch2SerDes/TxData[0][2]} {Ch2SerDes/TxData[0][3]} {Ch2SerDes/TxData[0][4]} {Ch2SerDes/TxData[0][5]} {Ch2SerDes/TxData[0][6]} {Ch2SerDes/TxData[0][7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe6]
set_property port_width 8 [get_debug_ports u_ila_0/probe6]
connect_debug_port u_ila_0/probe6 [get_nets [list {Ch1SerDes/TxData[3][0]} {Ch1SerDes/TxData[3][1]} {Ch1SerDes/TxData[3][2]} {Ch1SerDes/TxData[3][3]} {Ch1SerDes/TxData[3][4]} {Ch1SerDes/TxData[3][5]} {Ch1SerDes/TxData[3][6]} {Ch1SerDes/TxData[3][7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe7]
set_property port_width 8 [get_debug_ports u_ila_0/probe7]
connect_debug_port u_ila_0/probe7 [get_nets [list {Ch1SerDes/TxData[0][0]} {Ch1SerDes/TxData[0][1]} {Ch1SerDes/TxData[0][2]} {Ch1SerDes/TxData[0][3]} {Ch1SerDes/TxData[0][4]} {Ch1SerDes/TxData[0][5]} {Ch1SerDes/TxData[0][6]} {Ch1SerDes/TxData[0][7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe8]
set_property port_width 8 [get_debug_ports u_ila_0/probe8]
connect_debug_port u_ila_0/probe8 [get_nets [list {Ch1SerDes/TxData[4][0]} {Ch1SerDes/TxData[4][1]} {Ch1SerDes/TxData[4][2]} {Ch1SerDes/TxData[4][3]} {Ch1SerDes/TxData[4][4]} {Ch1SerDes/TxData[4][5]} {Ch1SerDes/TxData[4][6]} {Ch1SerDes/TxData[4][7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe9]
set_property port_width 6 [get_debug_ports u_ila_0/probe9]
connect_debug_port u_ila_0/probe9 [get_nets [list {Ch1SerDes/SyncRst[0]} {Ch1SerDes/SyncRst[1]} {Ch1SerDes/SyncRst[2]} {Ch1SerDes/SyncRst[3]} {Ch1SerDes/SyncRst[4]} {Ch1SerDes/SyncRst[5]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe10]
set_property port_width 8 [get_debug_ports u_ila_0/probe10]
connect_debug_port u_ila_0/probe10 [get_nets [list {Ch2SerDes/TxData[4][0]} {Ch2SerDes/TxData[4][1]} {Ch2SerDes/TxData[4][2]} {Ch2SerDes/TxData[4][3]} {Ch2SerDes/TxData[4][4]} {Ch2SerDes/TxData[4][5]} {Ch2SerDes/TxData[4][6]} {Ch2SerDes/TxData[4][7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe11]
set_property port_width 6 [get_debug_ports u_ila_0/probe11]
connect_debug_port u_ila_0/probe11 [get_nets [list {Ch2SerDes/SyncRst[0]} {Ch2SerDes/SyncRst[1]} {Ch2SerDes/SyncRst[2]} {Ch2SerDes/SyncRst[3]} {Ch2SerDes/SyncRst[4]} {Ch2SerDes/SyncRst[5]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe12]
set_property port_width 1 [get_debug_ports u_ila_0/probe12]
connect_debug_port u_ila_0/probe12 [get_nets [list Ch1SerDes/LockPll]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe13]
set_property port_width 1 [get_debug_ports u_ila_0/probe13]
connect_debug_port u_ila_0/probe13 [get_nets [list Ch2SerDes/LockPll]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe14]
set_property port_width 1 [get_debug_ports u_ila_0/probe14]
connect_debug_port u_ila_0/probe14 [get_nets [list Ch1SerDes/Reset]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe15]
set_property port_width 1 [get_debug_ports u_ila_0/probe15]
connect_debug_port u_ila_0/probe15 [get_nets [list Ch2SerDes/Reset]]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets MonClk_IBUF_BUFG]
