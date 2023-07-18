
connect_debug_port u_ila_0/probe3 [get_nets [list {stcDemod/Trellis_u/tdCount_reg[0]} {stcDemod/Trellis_u/tdCount_reg[1]} {stcDemod/Trellis_u/tdCount_reg[2]} {stcDemod/Trellis_u/tdCount_reg[3]} {stcDemod/Trellis_u/tdCount_reg[4]} {stcDemod/Trellis_u/tdCount_reg[5]} {stcDemod/Trellis_u/tdCount_reg[6]} {stcDemod/Trellis_u/tdCount_reg[7]} {stcDemod/Trellis_u/tdCount_reg[8]} {stcDemod/Trellis_u/tdCount_reg[9]} {stcDemod/Trellis_u/tdCount_reg[10]} {stcDemod/Trellis_u/tdCount_reg[11]} {stcDemod/Trellis_u/tdCount_reg[12]} {stcDemod/Trellis_u/tdCount_reg[13]} {stcDemod/Trellis_u/tdCount_reg[14]} {stcDemod/Trellis_u/tdCount_reg[15]} {stcDemod/Trellis_u/tdCount_reg[16]} {stcDemod/Trellis_u/tdCount_reg[17]}]]
connect_debug_port u_ila_0/probe10 [get_nets [list stcDemod/ClkOutEnNew]]
connect_debug_port u_ila_0/probe19 [get_nets [list stcDemod/Trellis_u/fa/myStartOfTrellis]]
connect_debug_port u_ila_0/probe20 [get_nets [list stcDemod/Trellis_u/myStartOfTrellis]]
connect_debug_port u_ila_0/probe23 [get_nets [list stcDemod/TrellisOutEn]]

connect_debug_port u_ila_0/probe1 [get_nets [list {stcDemod/Trellis_u/fa/wrAddr_0[0]} {stcDemod/Trellis_u/fa/wrAddr_0[1]} {stcDemod/Trellis_u/fa/wrAddr_0[2]} {stcDemod/Trellis_u/fa/wrAddr_0[3]} {stcDemod/Trellis_u/fa/wrAddr_0[4]} {stcDemod/Trellis_u/fa/wrAddr_0[5]} {stcDemod/Trellis_u/fa/wrAddr_0[6]} {stcDemod/Trellis_u/fa/wrAddr_0[7]} {stcDemod/Trellis_u/fa/wrAddr_0[8]} {stcDemod/Trellis_u/fa/wrAddr_0[9]} {stcDemod/Trellis_u/fa/wrAddr_0[10]} {stcDemod/Trellis_u/fa/wrAddr_0[11]} {stcDemod/Trellis_u/fa/wrAddr_0[12]} {stcDemod/Trellis_u/fa/wrAddr_0[13]} {stcDemod/Trellis_u/fa/wrAddr_0[14]}]]

create_debug_core u_ila_0 ila
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_0]
set_property ALL_PROBE_SAME_MU_CNT 4 [get_debug_cores u_ila_0]
set_property C_ADV_TRIGGER true [get_debug_cores u_ila_0]
set_property C_DATA_DEPTH 32768 [get_debug_cores u_ila_0]
set_property C_EN_STRG_QUAL true [get_debug_cores u_ila_0]
set_property C_INPUT_PIPE_STAGES 2 [get_debug_cores u_ila_0]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_0]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_0]
set_property port_width 1 [get_debug_ports u_ila_0/clk]
connect_debug_port u_ila_0/clk [get_nets [list systemClock/inst/clk186]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe0]
set_property port_width 15 [get_debug_ports u_ila_0/probe0]
connect_debug_port u_ila_0/probe0 [get_nets [list {stcDemod/Trellis_u/fa/rdAddr[0]} {stcDemod/Trellis_u/fa/rdAddr[1]} {stcDemod/Trellis_u/fa/rdAddr[2]} {stcDemod/Trellis_u/fa/rdAddr[3]} {stcDemod/Trellis_u/fa/rdAddr[4]} {stcDemod/Trellis_u/fa/rdAddr[5]} {stcDemod/Trellis_u/fa/rdAddr[6]} {stcDemod/Trellis_u/fa/rdAddr[7]} {stcDemod/Trellis_u/fa/rdAddr[8]} {stcDemod/Trellis_u/fa/rdAddr[9]} {stcDemod/Trellis_u/fa/rdAddr[10]} {stcDemod/Trellis_u/fa/rdAddr[11]} {stcDemod/Trellis_u/fa/rdAddr[12]} {stcDemod/Trellis_u/fa/rdAddr[13]} {stcDemod/Trellis_u/fa/rdAddr[14]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe1]
set_property port_width 15 [get_debug_ports u_ila_0/probe1]
connect_debug_port u_ila_0/probe1 [get_nets [list {stcDemod/Trellis_u/fa/depth[0]} {stcDemod/Trellis_u/fa/depth[1]} {stcDemod/Trellis_u/fa/depth[2]} {stcDemod/Trellis_u/fa/depth[3]} {stcDemod/Trellis_u/fa/depth[4]} {stcDemod/Trellis_u/fa/depth[5]} {stcDemod/Trellis_u/fa/depth[6]} {stcDemod/Trellis_u/fa/depth[7]} {stcDemod/Trellis_u/fa/depth[8]} {stcDemod/Trellis_u/fa/depth[9]} {stcDemod/Trellis_u/fa/depth[10]} {stcDemod/Trellis_u/fa/depth[11]} {stcDemod/Trellis_u/fa/depth[12]} {stcDemod/Trellis_u/fa/depth[13]} {stcDemod/Trellis_u/fa/depth[14]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe2]
set_property port_width 15 [get_debug_ports u_ila_0/probe2]
connect_debug_port u_ila_0/probe2 [get_nets [list {stcDemod/Trellis_u/fa/wrAddr[0]} {stcDemod/Trellis_u/fa/wrAddr[1]} {stcDemod/Trellis_u/fa/wrAddr[2]} {stcDemod/Trellis_u/fa/wrAddr[3]} {stcDemod/Trellis_u/fa/wrAddr[4]} {stcDemod/Trellis_u/fa/wrAddr[5]} {stcDemod/Trellis_u/fa/wrAddr[6]} {stcDemod/Trellis_u/fa/wrAddr[7]} {stcDemod/Trellis_u/fa/wrAddr[8]} {stcDemod/Trellis_u/fa/wrAddr[9]} {stcDemod/Trellis_u/fa/wrAddr[10]} {stcDemod/Trellis_u/fa/wrAddr[11]} {stcDemod/Trellis_u/fa/wrAddr[12]} {stcDemod/Trellis_u/fa/wrAddr[13]} {stcDemod/Trellis_u/fa/wrAddr[14]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe3]
set_property port_width 18 [get_debug_ports u_ila_0/probe3]
connect_debug_port u_ila_0/probe3 [get_nets [list {stcDemod/Trellis_u/faCount_reg[0]} {stcDemod/Trellis_u/faCount_reg[1]} {stcDemod/Trellis_u/faCount_reg[2]} {stcDemod/Trellis_u/faCount_reg[3]} {stcDemod/Trellis_u/faCount_reg[4]} {stcDemod/Trellis_u/faCount_reg[5]} {stcDemod/Trellis_u/faCount_reg[6]} {stcDemod/Trellis_u/faCount_reg[7]} {stcDemod/Trellis_u/faCount_reg[8]} {stcDemod/Trellis_u/faCount_reg[9]} {stcDemod/Trellis_u/faCount_reg[10]} {stcDemod/Trellis_u/faCount_reg[11]} {stcDemod/Trellis_u/faCount_reg[12]} {stcDemod/Trellis_u/faCount_reg[13]} {stcDemod/Trellis_u/faCount_reg[14]} {stcDemod/Trellis_u/faCount_reg[15]} {stcDemod/Trellis_u/faCount_reg[16]} {stcDemod/Trellis_u/faCount_reg[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe4]
set_property port_width 18 [get_debug_ports u_ila_0/probe4]
connect_debug_port u_ila_0/probe4 [get_nets [list {stcDemod/Trellis_u/dfCount[0]} {stcDemod/Trellis_u/dfCount[1]} {stcDemod/Trellis_u/dfCount[2]} {stcDemod/Trellis_u/dfCount[3]} {stcDemod/Trellis_u/dfCount[4]} {stcDemod/Trellis_u/dfCount[5]} {stcDemod/Trellis_u/dfCount[6]} {stcDemod/Trellis_u/dfCount[7]} {stcDemod/Trellis_u/dfCount[8]} {stcDemod/Trellis_u/dfCount[9]} {stcDemod/Trellis_u/dfCount[10]} {stcDemod/Trellis_u/dfCount[11]} {stcDemod/Trellis_u/dfCount[12]} {stcDemod/Trellis_u/dfCount[13]} {stcDemod/Trellis_u/dfCount[14]} {stcDemod/Trellis_u/dfCount[15]} {stcDemod/Trellis_u/dfCount[16]} {stcDemod/Trellis_u/dfCount[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe5]
set_property port_width 1 [get_debug_ports u_ila_0/probe5]
connect_debug_port u_ila_0/probe5 [get_nets [list stcDemod/Brik2_u/ChanEstDone]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe6]
set_property port_width 1 [get_debug_ports u_ila_0/probe6]
connect_debug_port u_ila_0/probe6 [get_nets [list stcDemod/ClkOutEn]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe7]
set_property port_width 1 [get_debug_ports u_ila_0/probe7]
connect_debug_port u_ila_0/probe7 [get_nets [list cAndD0/ClkOutEn]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe8]
set_property port_width 1 [get_debug_ports u_ila_0/probe8]
connect_debug_port u_ila_0/probe8 [get_nets [list stcDemod/ClkOutEnDly]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe9]
set_property port_width 1 [get_debug_ports u_ila_0/probe9]
connect_debug_port u_ila_0/probe9 [get_nets [list stcDemod/EstimatesDone]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe10]
set_property port_width 1 [get_debug_ports u_ila_0/probe10]
connect_debug_port u_ila_0/probe10 [get_nets [list stcDemod/Trellis_u/fa/estimatesDoneDly]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe11]
set_property port_width 1 [get_debug_ports u_ila_0/probe11]
connect_debug_port u_ila_0/probe11 [get_nets [list stcDemod/Trellis_u/fa/faClkEn]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe12]
set_property port_width 1 [get_debug_ports u_ila_0/probe12]
connect_debug_port u_ila_0/probe12 [get_nets [list stcDemod/Trellis_u/fa/fifoRdEn_i_1_n_1]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe13]
set_property port_width 1 [get_debug_ports u_ila_0/probe13]
connect_debug_port u_ila_0/probe13 [get_nets [list stcDemod/Trellis_u/fa/fifoWrEn]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe14]
set_property port_width 1 [get_debug_ports u_ila_0/probe14]
connect_debug_port u_ila_0/probe14 [get_nets [list stcDemod/Trellis_u/fa/frameStart]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe15]
set_property port_width 1 [get_debug_ports u_ila_0/probe15]
connect_debug_port u_ila_0/probe15 [get_nets [list stcDemod/Trellis_u/fa/interpolate]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe16]
set_property port_width 1 [get_debug_ports u_ila_0/probe16]
connect_debug_port u_ila_0/probe16 [get_nets [list stcDemod/Trellis_u/fa/lastSample_reg_n_1]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe17]
set_property port_width 1 [get_debug_ports u_ila_0/probe17]
connect_debug_port u_ila_0/probe17 [get_nets [list stcDemod/StartIla]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe18]
set_property port_width 1 [get_debug_ports u_ila_0/probe18]
connect_debug_port u_ila_0/probe18 [get_nets [list stcDemod/Brik2_u/TimeEstDone]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe19]
set_property port_width 1 [get_debug_ports u_ila_0/probe19]
connect_debug_port u_ila_0/probe19 [get_nets [list stcDemod/ValidIla]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe20]
set_property port_width 1 [get_debug_ports u_ila_0/probe20]
connect_debug_port u_ila_0/probe20 [get_nets [list stcDemod/ValidPN15]]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets dac1_clk_OBUF]
