






create_debug_core u_ila_0 ila
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_0]
set_property ALL_PROBE_SAME_MU_CNT 4 [get_debug_cores u_ila_0]
set_property C_ADV_TRIGGER true [get_debug_cores u_ila_0]
set_property C_DATA_DEPTH 1024 [get_debug_cores u_ila_0]
set_property C_EN_STRG_QUAL true [get_debug_cores u_ila_0]
set_property C_INPUT_PIPE_STAGES 2 [get_debug_cores u_ila_0]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_0]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_0]
set_property port_width 1 [get_debug_ports u_ila_0/clk]
connect_debug_port u_ila_0/clk [get_nets [list systemClock/inst/clk186]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe0]
set_property port_width 17 [get_debug_ports u_ila_0/probe0]
connect_debug_port u_ila_0/probe0 [get_nets [list {stcDemod/Trellis_u/ch0i/dout[0]} {stcDemod/Trellis_u/ch0i/dout[1]} {stcDemod/Trellis_u/ch0i/dout[2]} {stcDemod/Trellis_u/ch0i/dout[3]} {stcDemod/Trellis_u/ch0i/dout[4]} {stcDemod/Trellis_u/ch0i/dout[5]} {stcDemod/Trellis_u/ch0i/dout[6]} {stcDemod/Trellis_u/ch0i/dout[7]} {stcDemod/Trellis_u/ch0i/dout[8]} {stcDemod/Trellis_u/ch0i/dout[9]} {stcDemod/Trellis_u/ch0i/dout[10]} {stcDemod/Trellis_u/ch0i/dout[11]} {stcDemod/Trellis_u/ch0i/dout[12]} {stcDemod/Trellis_u/ch0i/dout[13]} {stcDemod/Trellis_u/ch0i/dout[14]} {stcDemod/Trellis_u/ch0i/dout[15]} {stcDemod/Trellis_u/ch0i/dout[16]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe1]
set_property port_width 17 [get_debug_ports u_ila_0/probe1]
connect_debug_port u_ila_0/probe1 [get_nets [list {stcDemod/Trellis_u/ch0r/dout[0]} {stcDemod/Trellis_u/ch0r/dout[1]} {stcDemod/Trellis_u/ch0r/dout[2]} {stcDemod/Trellis_u/ch0r/dout[3]} {stcDemod/Trellis_u/ch0r/dout[4]} {stcDemod/Trellis_u/ch0r/dout[5]} {stcDemod/Trellis_u/ch0r/dout[6]} {stcDemod/Trellis_u/ch0r/dout[7]} {stcDemod/Trellis_u/ch0r/dout[8]} {stcDemod/Trellis_u/ch0r/dout[9]} {stcDemod/Trellis_u/ch0r/dout[10]} {stcDemod/Trellis_u/ch0r/dout[11]} {stcDemod/Trellis_u/ch0r/dout[12]} {stcDemod/Trellis_u/ch0r/dout[13]} {stcDemod/Trellis_u/ch0r/dout[14]} {stcDemod/Trellis_u/ch0r/dout[15]} {stcDemod/Trellis_u/ch0r/dout[16]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe2]
set_property port_width 17 [get_debug_ports u_ila_0/probe2]
connect_debug_port u_ila_0/probe2 [get_nets [list {stcDemod/Trellis_u/ch1r/dout[0]} {stcDemod/Trellis_u/ch1r/dout[1]} {stcDemod/Trellis_u/ch1r/dout[2]} {stcDemod/Trellis_u/ch1r/dout[3]} {stcDemod/Trellis_u/ch1r/dout[4]} {stcDemod/Trellis_u/ch1r/dout[5]} {stcDemod/Trellis_u/ch1r/dout[6]} {stcDemod/Trellis_u/ch1r/dout[7]} {stcDemod/Trellis_u/ch1r/dout[8]} {stcDemod/Trellis_u/ch1r/dout[9]} {stcDemod/Trellis_u/ch1r/dout[10]} {stcDemod/Trellis_u/ch1r/dout[11]} {stcDemod/Trellis_u/ch1r/dout[12]} {stcDemod/Trellis_u/ch1r/dout[13]} {stcDemod/Trellis_u/ch1r/dout[14]} {stcDemod/Trellis_u/ch1r/dout[15]} {stcDemod/Trellis_u/ch1r/dout[16]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe3]
set_property port_width 17 [get_debug_ports u_ila_0/probe3]
connect_debug_port u_ila_0/probe3 [get_nets [list {stcDemod/Trellis_u/ch1i/dout[0]} {stcDemod/Trellis_u/ch1i/dout[1]} {stcDemod/Trellis_u/ch1i/dout[2]} {stcDemod/Trellis_u/ch1i/dout[3]} {stcDemod/Trellis_u/ch1i/dout[4]} {stcDemod/Trellis_u/ch1i/dout[5]} {stcDemod/Trellis_u/ch1i/dout[6]} {stcDemod/Trellis_u/ch1i/dout[7]} {stcDemod/Trellis_u/ch1i/dout[8]} {stcDemod/Trellis_u/ch1i/dout[9]} {stcDemod/Trellis_u/ch1i/dout[10]} {stcDemod/Trellis_u/ch1i/dout[11]} {stcDemod/Trellis_u/ch1i/dout[12]} {stcDemod/Trellis_u/ch1i/dout[13]} {stcDemod/Trellis_u/ch1i/dout[14]} {stcDemod/Trellis_u/ch1i/dout[15]} {stcDemod/Trellis_u/ch1i/dout[16]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe4]
set_property port_width 4 [get_debug_ports u_ila_0/probe4]
connect_debug_port u_ila_0/probe4 [get_nets [list {stcDemod/m_ndx0Slv[0]} {stcDemod/m_ndx0Slv[1]} {stcDemod/m_ndx0Slv[2]} {stcDemod/m_ndx0Slv[3]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe5]
set_property port_width 4 [get_debug_ports u_ila_0/probe5]
connect_debug_port u_ila_0/probe5 [get_nets [list {stcDemod/m_ndx1Slv[0]} {stcDemod/m_ndx1Slv[1]} {stcDemod/m_ndx1Slv[2]} {stcDemod/m_ndx1Slv[3]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe6]
set_property port_width 6 [get_debug_ports u_ila_0/probe6]
connect_debug_port u_ila_0/probe6 [get_nets [list {stcDemod/deltaTauEstSlv[0]} {stcDemod/deltaTauEstSlv[1]} {stcDemod/deltaTauEstSlv[2]} {stcDemod/deltaTauEstSlv[3]} {stcDemod/deltaTauEstSlv[4]} {stcDemod/deltaTauEstSlv[5]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe7]
set_property port_width 1 [get_debug_ports u_ila_0/probe7]
connect_debug_port u_ila_0/probe7 [get_nets [list stcDemod/ClkOutEn]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe8]
set_property port_width 1 [get_debug_ports u_ila_0/probe8]
connect_debug_port u_ila_0/probe8 [get_nets [list stcDemod/DataOut]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe9]
set_property port_width 1 [get_debug_ports u_ila_0/probe9]
connect_debug_port u_ila_0/probe9 [get_nets [list stcDemod/PS_u/Missed]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe10]
set_property port_width 1 [get_debug_ports u_ila_0/probe10]
connect_debug_port u_ila_0/probe10 [get_nets [list stcDemod/PD_u/PilotFound]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe11]
set_property port_width 1 [get_debug_ports u_ila_0/probe11]
connect_debug_port u_ila_0/probe11 [get_nets [list stcDemod/PilotFoundCE]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe12]
set_property port_width 1 [get_debug_ports u_ila_0/probe12]
connect_debug_port u_ila_0/probe12 [get_nets [list stcDemod/PilotFoundPD]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe13]
set_property port_width 1 [get_debug_ports u_ila_0/probe13]
connect_debug_port u_ila_0/probe13 [get_nets [list stcDemod/ValidData2047]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe14]
set_property port_width 1 [get_debug_ports u_ila_0/probe14]
connect_debug_port u_ila_0/probe14 [get_nets [list stcDemod/ValidIla]]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets clk2x]
