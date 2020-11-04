
connect_debug_port u_ila_0/probe2 [get_nets [list {SerDes_u/Count1[0]} {SerDes_u/Count1[1]} {SerDes_u/Count1[2]} {SerDes_u/Count1[3]} {SerDes_u/Count1[4]} {SerDes_u/Count1[5]} {SerDes_u/Count1[6]} {SerDes_u/Count1[7]}]]
connect_debug_port u_ila_0/probe3 [get_nets [list {SerDes_u/Count2[0]} {SerDes_u/Count2[1]} {SerDes_u/Count2[2]} {SerDes_u/Count2[3]} {SerDes_u/Count2[4]} {SerDes_u/Count2[5]} {SerDes_u/Count2[6]} {SerDes_u/Count2[7]}]]

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
connect_debug_port u_ila_0/clk [get_nets [list SerDes_u/PllXn_u/inst/clk_1x]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe0]
set_property port_width 8 [get_debug_ports u_ila_0/probe0]
connect_debug_port u_ila_0/probe0 [get_nets [list {SerDes_u/Demux2[5][0]} {SerDes_u/Demux2[5][1]} {SerDes_u/Demux2[5][2]} {SerDes_u/Demux2[5][3]} {SerDes_u/Demux2[5][4]} {SerDes_u/Demux2[5][5]} {SerDes_u/Demux2[5][6]} {SerDes_u/Demux2[5][7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe1]
set_property port_width 8 [get_debug_ports u_ila_0/probe1]
connect_debug_port u_ila_0/probe1 [get_nets [list {SerDes_u/Demux1[2][0]} {SerDes_u/Demux1[2][1]} {SerDes_u/Demux1[2][2]} {SerDes_u/Demux1[2][3]} {SerDes_u/Demux1[2][4]} {SerDes_u/Demux1[2][5]} {SerDes_u/Demux1[2][6]} {SerDes_u/Demux1[2][7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe2]
set_property port_width 6 [get_debug_ports u_ila_0/probe2]
connect_debug_port u_ila_0/probe2 [get_nets [list {SerDes_u/ChBitSlip1[0]} {SerDes_u/ChBitSlip1[1]} {SerDes_u/ChBitSlip1[2]} {SerDes_u/ChBitSlip1[3]} {SerDes_u/ChBitSlip1[4]} {SerDes_u/ChBitSlip1[5]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe3]
set_property port_width 6 [get_debug_ports u_ila_0/probe3]
connect_debug_port u_ila_0/probe3 [get_nets [list {SerDes_u/ChBitSlip2[0]} {SerDes_u/ChBitSlip2[1]} {SerDes_u/ChBitSlip2[2]} {SerDes_u/ChBitSlip2[3]} {SerDes_u/ChBitSlip2[4]} {SerDes_u/ChBitSlip2[5]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe4]
set_property port_width 8 [get_debug_ports u_ila_0/probe4]
connect_debug_port u_ila_0/probe4 [get_nets [list {SerDes_u/Count[0]} {SerDes_u/Count[1]} {SerDes_u/Count[2]} {SerDes_u/Count[3]} {SerDes_u/Count[4]} {SerDes_u/Count[5]} {SerDes_u/Count[6]} {SerDes_u/Count[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe5]
set_property port_width 8 [get_debug_ports u_ila_0/probe5]
connect_debug_port u_ila_0/probe5 [get_nets [list {SerDes_u/Demux1[3][0]} {SerDes_u/Demux1[3][1]} {SerDes_u/Demux1[3][2]} {SerDes_u/Demux1[3][3]} {SerDes_u/Demux1[3][4]} {SerDes_u/Demux1[3][5]} {SerDes_u/Demux1[3][6]} {SerDes_u/Demux1[3][7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe6]
set_property port_width 8 [get_debug_ports u_ila_0/probe6]
connect_debug_port u_ila_0/probe6 [get_nets [list {SerDes_u/Demux1[1][0]} {SerDes_u/Demux1[1][1]} {SerDes_u/Demux1[1][2]} {SerDes_u/Demux1[1][3]} {SerDes_u/Demux1[1][4]} {SerDes_u/Demux1[1][5]} {SerDes_u/Demux1[1][6]} {SerDes_u/Demux1[1][7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe7]
set_property port_width 8 [get_debug_ports u_ila_0/probe7]
connect_debug_port u_ila_0/probe7 [get_nets [list {SerDes_u/Demux2[1][0]} {SerDes_u/Demux2[1][1]} {SerDes_u/Demux2[1][2]} {SerDes_u/Demux2[1][3]} {SerDes_u/Demux2[1][4]} {SerDes_u/Demux2[1][5]} {SerDes_u/Demux2[1][6]} {SerDes_u/Demux2[1][7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe8]
set_property port_width 8 [get_debug_ports u_ila_0/probe8]
connect_debug_port u_ila_0/probe8 [get_nets [list {SerDes_u/Demux1[0][0]} {SerDes_u/Demux1[0][1]} {SerDes_u/Demux1[0][2]} {SerDes_u/Demux1[0][3]} {SerDes_u/Demux1[0][4]} {SerDes_u/Demux1[0][5]} {SerDes_u/Demux1[0][6]} {SerDes_u/Demux1[0][7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe9]
set_property port_width 8 [get_debug_ports u_ila_0/probe9]
connect_debug_port u_ila_0/probe9 [get_nets [list {SerDes_u/Demux1[4][0]} {SerDes_u/Demux1[4][1]} {SerDes_u/Demux1[4][2]} {SerDes_u/Demux1[4][3]} {SerDes_u/Demux1[4][4]} {SerDes_u/Demux1[4][5]} {SerDes_u/Demux1[4][6]} {SerDes_u/Demux1[4][7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe10]
set_property port_width 30 [get_debug_ports u_ila_0/probe10]
connect_debug_port u_ila_0/probe10 [get_nets [list {SerDes_u/tapOut1[0]} {SerDes_u/tapOut1[1]} {SerDes_u/tapOut1[2]} {SerDes_u/tapOut1[3]} {SerDes_u/tapOut1[4]} {SerDes_u/tapOut1[5]} {SerDes_u/tapOut1[6]} {SerDes_u/tapOut1[7]} {SerDes_u/tapOut1[8]} {SerDes_u/tapOut1[9]} {SerDes_u/tapOut1[10]} {SerDes_u/tapOut1[11]} {SerDes_u/tapOut1[12]} {SerDes_u/tapOut1[13]} {SerDes_u/tapOut1[14]} {SerDes_u/tapOut1[15]} {SerDes_u/tapOut1[16]} {SerDes_u/tapOut1[17]} {SerDes_u/tapOut1[18]} {SerDes_u/tapOut1[19]} {SerDes_u/tapOut1[20]} {SerDes_u/tapOut1[21]} {SerDes_u/tapOut1[22]} {SerDes_u/tapOut1[23]} {SerDes_u/tapOut1[24]} {SerDes_u/tapOut1[25]} {SerDes_u/tapOut1[26]} {SerDes_u/tapOut1[27]} {SerDes_u/tapOut1[28]} {SerDes_u/tapOut1[29]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe11]
set_property port_width 8 [get_debug_ports u_ila_0/probe11]
connect_debug_port u_ila_0/probe11 [get_nets [list {SerDes_u/Demux2[4][0]} {SerDes_u/Demux2[4][1]} {SerDes_u/Demux2[4][2]} {SerDes_u/Demux2[4][3]} {SerDes_u/Demux2[4][4]} {SerDes_u/Demux2[4][5]} {SerDes_u/Demux2[4][6]} {SerDes_u/Demux2[4][7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe12]
set_property port_width 8 [get_debug_ports u_ila_0/probe12]
connect_debug_port u_ila_0/probe12 [get_nets [list {SerDes_u/Demux2[2][0]} {SerDes_u/Demux2[2][1]} {SerDes_u/Demux2[2][2]} {SerDes_u/Demux2[2][3]} {SerDes_u/Demux2[2][4]} {SerDes_u/Demux2[2][5]} {SerDes_u/Demux2[2][6]} {SerDes_u/Demux2[2][7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe13]
set_property port_width 8 [get_debug_ports u_ila_0/probe13]
connect_debug_port u_ila_0/probe13 [get_nets [list {SerDes_u/Demux2[0][0]} {SerDes_u/Demux2[0][1]} {SerDes_u/Demux2[0][2]} {SerDes_u/Demux2[0][3]} {SerDes_u/Demux2[0][4]} {SerDes_u/Demux2[0][5]} {SerDes_u/Demux2[0][6]} {SerDes_u/Demux2[0][7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe14]
set_property port_width 8 [get_debug_ports u_ila_0/probe14]
connect_debug_port u_ila_0/probe14 [get_nets [list {SerDes_u/Demux2[3][0]} {SerDes_u/Demux2[3][1]} {SerDes_u/Demux2[3][2]} {SerDes_u/Demux2[3][3]} {SerDes_u/Demux2[3][4]} {SerDes_u/Demux2[3][5]} {SerDes_u/Demux2[3][6]} {SerDes_u/Demux2[3][7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe15]
set_property port_width 8 [get_debug_ports u_ila_0/probe15]
connect_debug_port u_ila_0/probe15 [get_nets [list {SerDes_u/Demux1[5][0]} {SerDes_u/Demux1[5][1]} {SerDes_u/Demux1[5][2]} {SerDes_u/Demux1[5][3]} {SerDes_u/Demux1[5][4]} {SerDes_u/Demux1[5][5]} {SerDes_u/Demux1[5][6]} {SerDes_u/Demux1[5][7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe16]
set_property port_width 30 [get_debug_ports u_ila_0/probe16]
connect_debug_port u_ila_0/probe16 [get_nets [list {SerDes_u/tapOut2[0]} {SerDes_u/tapOut2[1]} {SerDes_u/tapOut2[2]} {SerDes_u/tapOut2[3]} {SerDes_u/tapOut2[4]} {SerDes_u/tapOut2[5]} {SerDes_u/tapOut2[6]} {SerDes_u/tapOut2[7]} {SerDes_u/tapOut2[8]} {SerDes_u/tapOut2[9]} {SerDes_u/tapOut2[10]} {SerDes_u/tapOut2[11]} {SerDes_u/tapOut2[12]} {SerDes_u/tapOut2[13]} {SerDes_u/tapOut2[14]} {SerDes_u/tapOut2[15]} {SerDes_u/tapOut2[16]} {SerDes_u/tapOut2[17]} {SerDes_u/tapOut2[18]} {SerDes_u/tapOut2[19]} {SerDes_u/tapOut2[20]} {SerDes_u/tapOut2[21]} {SerDes_u/tapOut2[22]} {SerDes_u/tapOut2[23]} {SerDes_u/tapOut2[24]} {SerDes_u/tapOut2[25]} {SerDes_u/tapOut2[26]} {SerDes_u/tapOut2[27]} {SerDes_u/tapOut2[28]} {SerDes_u/tapOut2[29]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe17]
set_property port_width 1 [get_debug_ports u_ila_0/probe17]
connect_debug_port u_ila_0/probe17 [get_nets [list SerDes_u/ClkStopped200]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe18]
set_property port_width 1 [get_debug_ports u_ila_0/probe18]
connect_debug_port u_ila_0/probe18 [get_nets [list SerDes_u/ClkStoppedXn]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe19]
set_property port_width 1 [get_debug_ports u_ila_0/probe19]
connect_debug_port u_ila_0/probe19 [get_nets [list SerDes_u/DelayLocked1]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe20]
set_property port_width 1 [get_debug_ports u_ila_0/probe20]
connect_debug_port u_ila_0/probe20 [get_nets [list SerDes_u/DelayLocked2]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe21]
set_property port_width 1 [get_debug_ports u_ila_0/probe21]
connect_debug_port u_ila_0/probe21 [get_nets [list SerDes_u/Lock200]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe22]
set_property port_width 1 [get_debug_ports u_ila_0/probe22]
connect_debug_port u_ila_0/probe22 [get_nets [list SerDes_u/LockedXn]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe23]
set_property port_width 1 [get_debug_ports u_ila_0/probe23]
connect_debug_port u_ila_0/probe23 [get_nets [list SerDes_u/ResetPll]]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets u_ila_0_clk_1x]
