

create_debug_core u_ila_0 ila
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_0]
set_property ALL_PROBE_SAME_MU_CNT 2 [get_debug_cores u_ila_0]
set_property C_ADV_TRIGGER false [get_debug_cores u_ila_0]
set_property C_DATA_DEPTH 1024 [get_debug_cores u_ila_0]
set_property C_EN_STRG_QUAL true [get_debug_cores u_ila_0]
set_property C_INPUT_PIPE_STAGES 3 [get_debug_cores u_ila_0]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_0]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_0]
set_property port_width 1 [get_debug_ports u_ila_0/clk]
connect_debug_port u_ila_0/clk [get_nets [list dac2_clk_OBUF]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe0]
set_property port_width 12 [get_debug_ports u_ila_0/probe0]
connect_debug_port u_ila_0/probe0 [get_nets [list {turbo/turbod/EuI_Slv[0]} {turbo/turbod/EuI_Slv[1]} {turbo/turbod/EuI_Slv[2]} {turbo/turbod/EuI_Slv[3]} {turbo/turbod/EuI_Slv[4]} {turbo/turbod/EuI_Slv[5]} {turbo/turbod/EuI_Slv[6]} {turbo/turbod/EuI_Slv[7]} {turbo/turbod/EuI_Slv[8]} {turbo/turbod/EuI_Slv[9]} {turbo/turbod/EuI_Slv[10]} {turbo/turbod/EuI_Slv[11]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe1]
set_property port_width 12 [get_debug_ports u_ila_0/probe1]
connect_debug_port u_ila_0/probe1 [get_nets [list {turbo/turbod/EuO[0]} {turbo/turbod/EuO[1]} {turbo/turbod/EuO[2]} {turbo/turbod/EuO[3]} {turbo/turbod/EuO[4]} {turbo/turbod/EuO[5]} {turbo/turbod/EuO[6]} {turbo/turbod/EuO[7]} {turbo/turbod/EuO[8]} {turbo/turbod/EuO[9]} {turbo/turbod/EuO[10]} {turbo/turbod/EuO[11]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe2]
set_property port_width 5 [get_debug_ports u_ila_0/probe2]
connect_debug_port u_ila_0/probe2 [get_nets [list {turbo/turbod/Ch0Data[1]} {turbo/turbod/Ch0Data[2]} {turbo/turbod/Ch0Data[3]} {turbo/turbod/Ch0Data[4]} {turbo/turbod/Ch0Data[5]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe3]
set_property port_width 12 [get_debug_ports u_ila_0/probe3]
connect_debug_port u_ila_0/probe3 [get_nets [list {turbo/turbod/PCI01[11]} {turbo/turbod/PCI01[10]} {turbo/turbod/PCI01[9]} {turbo/turbod/PCI01[8]} {turbo/turbod/PCI01[7]} {turbo/turbod/PCI01[6]} {turbo/turbod/PCI01[5]} {turbo/turbod/PCI01[4]} {turbo/turbod/PCI01[3]} {turbo/turbod/PCI01[2]} {turbo/turbod/PCI01[1]} {turbo/turbod/PCI01[0]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe4]
set_property port_width 1 [get_debug_ports u_ila_0/probe4]
connect_debug_port u_ila_0/probe4 [get_nets [list turbo/turbod/BitOut]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe5]
set_property port_width 1 [get_debug_ports u_ila_0/probe5]
connect_debug_port u_ila_0/probe5 [get_nets [list turbo/turbod/BitOutEn]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe6]
set_property port_width 1 [get_debug_ports u_ila_0/probe6]
connect_debug_port u_ila_0/probe6 [get_nets [list turbo/turbod/ch0En]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe7]
set_property port_width 1 [get_debug_ports u_ila_0/probe7]
connect_debug_port u_ila_0/probe7 [get_nets [list turbo/turbod/SovaActiveA]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe8]
set_property port_width 1 [get_debug_ports u_ila_0/probe8]
connect_debug_port u_ila_0/probe8 [get_nets [list turbo/turbod/SovaActiveB]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe9]
set_property port_width 1 [get_debug_ports u_ila_0/probe9]
connect_debug_port u_ila_0/probe9 [get_nets [list turbo/turbod/SovaReady]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe10]
set_property port_width 1 [get_debug_ports u_ila_0/probe10]
connect_debug_port u_ila_0/probe10 [get_nets [list turbo/turbod/SovaValidOut]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe11]
set_property port_width 1 [get_debug_ports u_ila_0/probe11]
connect_debug_port u_ila_0/probe11 [get_nets [list turbo/turbod/uHatB]]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets dac2_clk_OBUF]
