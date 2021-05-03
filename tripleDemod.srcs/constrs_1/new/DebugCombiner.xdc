

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
connect_debug_port u_ila_0/clk [get_nets [list systemClock/inst/clk2x]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe0]
set_property port_width 8 [get_debug_ports u_ila_0/probe0]
connect_debug_port u_ila_0/probe0 [get_nets [list {syncIFs/IndexOut[0]} {syncIFs/IndexOut[1]} {syncIFs/IndexOut[2]} {syncIFs/IndexOut[3]} {syncIFs/IndexOut[4]} {syncIFs/IndexOut[5]} {syncIFs/IndexOut[6]} {syncIFs/IndexOut[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe1]
set_property port_width 18 [get_debug_ports u_ila_0/probe1]
connect_debug_port u_ila_0/probe1 [get_nets [list {syncIFs/IF_Diff[0]} {syncIFs/IF_Diff[1]} {syncIFs/IF_Diff[2]} {syncIFs/IF_Diff[3]} {syncIFs/IF_Diff[4]} {syncIFs/IF_Diff[5]} {syncIFs/IF_Diff[6]} {syncIFs/IF_Diff[7]} {syncIFs/IF_Diff[8]} {syncIFs/IF_Diff[9]} {syncIFs/IF_Diff[10]} {syncIFs/IF_Diff[11]} {syncIFs/IF_Diff[12]} {syncIFs/IF_Diff[13]} {syncIFs/IF_Diff[14]} {syncIFs/IF_Diff[15]} {syncIFs/IF_Diff[16]} {syncIFs/IF_Diff[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe2]
set_property port_width 16 [get_debug_ports u_ila_0/probe2]
connect_debug_port u_ila_0/probe2 [get_nets [list {syncIFs/IndexAcc[-7]} {syncIFs/IndexAcc[-6]} {syncIFs/IndexAcc[-5]} {syncIFs/IndexAcc[-4]} {syncIFs/IndexAcc[-3]} {syncIFs/IndexAcc[-2]} {syncIFs/IndexAcc[-1]} {syncIFs/IndexAcc[0]} {syncIFs/IndexAcc[1]} {syncIFs/IndexAcc[2]} {syncIFs/IndexAcc[3]} {syncIFs/IndexAcc[4]} {syncIFs/IndexAcc[5]} {syncIFs/IndexAcc[6]} {syncIFs/IndexAcc[7]} {syncIFs/IndexAcc[8]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe3]
set_property port_width 2 [get_debug_ports u_ila_0/probe3]
connect_debug_port u_ila_0/probe3 [get_nets [list {syncIFs/SkipFirst2[0]} {syncIFs/SkipFirst2[1]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe4]
set_property port_width 8 [get_debug_ports u_ila_0/probe4]
connect_debug_port u_ila_0/probe4 [get_nets [list {syncIFs/IndexAbs[0]} {syncIFs/IndexAbs[1]} {syncIFs/IndexAbs[2]} {syncIFs/IndexAbs[3]} {syncIFs/IndexAbs[4]} {syncIFs/IndexAbs[5]} {syncIFs/IndexAbs[6]} {syncIFs/IndexAbs[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe5]
set_property port_width 1 [get_debug_ports u_ila_0/probe5]
connect_debug_port u_ila_0/probe5 [get_nets [list AbeforeB]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe6]
set_property port_width 1 [get_debug_ports u_ila_0/probe6]
connect_debug_port u_ila_0/probe6 [get_nets [list syncIFs/AbeforeB__0]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe7]
set_property port_width 1 [get_debug_ports u_ila_0/probe7]
connect_debug_port u_ila_0/probe7 [get_nets [list syncIFs/Restart]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe8]
set_property port_width 1 [get_debug_ports u_ila_0/probe8]
connect_debug_port u_ila_0/probe8 [get_nets [list syncIFs/ValidOut__0]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe9]
set_property port_width 1 [get_debug_ports u_ila_0/probe9]
connect_debug_port u_ila_0/probe9 [get_nets [list syncIFs/ValidOverAdd]]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets dac1_clk_OBUF]
