




create_debug_core u_ila_0 ila
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_0]
set_property ALL_PROBE_SAME_MU_CNT 4 [get_debug_cores u_ila_0]
set_property C_ADV_TRIGGER true [get_debug_cores u_ila_0]
set_property C_DATA_DEPTH 4096 [get_debug_cores u_ila_0]
set_property C_EN_STRG_QUAL true [get_debug_cores u_ila_0]
set_property C_INPUT_PIPE_STAGES 2 [get_debug_cores u_ila_0]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_0]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_0]
set_property port_width 1 [get_debug_ports u_ila_0/clk]
connect_debug_port u_ila_0/clk [get_nets [list systemClock/inst/clk186]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe0]
set_property port_width 18 [get_debug_ports u_ila_0/probe0]
connect_debug_port u_ila_0/probe0 [get_nets [list {stcDemod/Brik2_u/H0EstR_Ila[0]} {stcDemod/Brik2_u/H0EstR_Ila[1]} {stcDemod/Brik2_u/H0EstR_Ila[2]} {stcDemod/Brik2_u/H0EstR_Ila[3]} {stcDemod/Brik2_u/H0EstR_Ila[4]} {stcDemod/Brik2_u/H0EstR_Ila[5]} {stcDemod/Brik2_u/H0EstR_Ila[6]} {stcDemod/Brik2_u/H0EstR_Ila[7]} {stcDemod/Brik2_u/H0EstR_Ila[8]} {stcDemod/Brik2_u/H0EstR_Ila[9]} {stcDemod/Brik2_u/H0EstR_Ila[10]} {stcDemod/Brik2_u/H0EstR_Ila[11]} {stcDemod/Brik2_u/H0EstR_Ila[12]} {stcDemod/Brik2_u/H0EstR_Ila[13]} {stcDemod/Brik2_u/H0EstR_Ila[14]} {stcDemod/Brik2_u/H0EstR_Ila[15]} {stcDemod/Brik2_u/H0EstR_Ila[16]} {stcDemod/Brik2_u/H0EstR_Ila[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe1]
set_property port_width 18 [get_debug_ports u_ila_0/probe1]
connect_debug_port u_ila_0/probe1 [get_nets [list {stcDemod/Brik2_u/H0EstI_Ila[0]} {stcDemod/Brik2_u/H0EstI_Ila[1]} {stcDemod/Brik2_u/H0EstI_Ila[2]} {stcDemod/Brik2_u/H0EstI_Ila[3]} {stcDemod/Brik2_u/H0EstI_Ila[4]} {stcDemod/Brik2_u/H0EstI_Ila[5]} {stcDemod/Brik2_u/H0EstI_Ila[6]} {stcDemod/Brik2_u/H0EstI_Ila[7]} {stcDemod/Brik2_u/H0EstI_Ila[8]} {stcDemod/Brik2_u/H0EstI_Ila[9]} {stcDemod/Brik2_u/H0EstI_Ila[10]} {stcDemod/Brik2_u/H0EstI_Ila[11]} {stcDemod/Brik2_u/H0EstI_Ila[12]} {stcDemod/Brik2_u/H0EstI_Ila[13]} {stcDemod/Brik2_u/H0EstI_Ila[14]} {stcDemod/Brik2_u/H0EstI_Ila[15]} {stcDemod/Brik2_u/H0EstI_Ila[16]} {stcDemod/Brik2_u/H0EstI_Ila[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe2]
set_property port_width 18 [get_debug_ports u_ila_0/probe2]
connect_debug_port u_ila_0/probe2 [get_nets [list {stcDemod/Brik2_u/H1EstI_Ila[0]} {stcDemod/Brik2_u/H1EstI_Ila[1]} {stcDemod/Brik2_u/H1EstI_Ila[2]} {stcDemod/Brik2_u/H1EstI_Ila[3]} {stcDemod/Brik2_u/H1EstI_Ila[4]} {stcDemod/Brik2_u/H1EstI_Ila[5]} {stcDemod/Brik2_u/H1EstI_Ila[6]} {stcDemod/Brik2_u/H1EstI_Ila[7]} {stcDemod/Brik2_u/H1EstI_Ila[8]} {stcDemod/Brik2_u/H1EstI_Ila[9]} {stcDemod/Brik2_u/H1EstI_Ila[10]} {stcDemod/Brik2_u/H1EstI_Ila[11]} {stcDemod/Brik2_u/H1EstI_Ila[12]} {stcDemod/Brik2_u/H1EstI_Ila[13]} {stcDemod/Brik2_u/H1EstI_Ila[14]} {stcDemod/Brik2_u/H1EstI_Ila[15]} {stcDemod/Brik2_u/H1EstI_Ila[16]} {stcDemod/Brik2_u/H1EstI_Ila[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe3]
set_property port_width 18 [get_debug_ports u_ila_0/probe3]
connect_debug_port u_ila_0/probe3 [get_nets [list {stcDemod/Brik2_u/H1EstR_Ila[0]} {stcDemod/Brik2_u/H1EstR_Ila[1]} {stcDemod/Brik2_u/H1EstR_Ila[2]} {stcDemod/Brik2_u/H1EstR_Ila[3]} {stcDemod/Brik2_u/H1EstR_Ila[4]} {stcDemod/Brik2_u/H1EstR_Ila[5]} {stcDemod/Brik2_u/H1EstR_Ila[6]} {stcDemod/Brik2_u/H1EstR_Ila[7]} {stcDemod/Brik2_u/H1EstR_Ila[8]} {stcDemod/Brik2_u/H1EstR_Ila[9]} {stcDemod/Brik2_u/H1EstR_Ila[10]} {stcDemod/Brik2_u/H1EstR_Ila[11]} {stcDemod/Brik2_u/H1EstR_Ila[12]} {stcDemod/Brik2_u/H1EstR_Ila[13]} {stcDemod/Brik2_u/H1EstR_Ila[14]} {stcDemod/Brik2_u/H1EstR_Ila[15]} {stcDemod/Brik2_u/H1EstR_Ila[16]} {stcDemod/Brik2_u/H1EstR_Ila[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe4]
set_property port_width 18 [get_debug_ports u_ila_0/probe4]
connect_debug_port u_ila_0/probe4 [get_nets [list {stcDemod/Brik2_u/TauEst1Ila[0]} {stcDemod/Brik2_u/TauEst1Ila[1]} {stcDemod/Brik2_u/TauEst1Ila[2]} {stcDemod/Brik2_u/TauEst1Ila[3]} {stcDemod/Brik2_u/TauEst1Ila[4]} {stcDemod/Brik2_u/TauEst1Ila[5]} {stcDemod/Brik2_u/TauEst1Ila[6]} {stcDemod/Brik2_u/TauEst1Ila[7]} {stcDemod/Brik2_u/TauEst1Ila[8]} {stcDemod/Brik2_u/TauEst1Ila[9]} {stcDemod/Brik2_u/TauEst1Ila[10]} {stcDemod/Brik2_u/TauEst1Ila[11]} {stcDemod/Brik2_u/TauEst1Ila[12]} {stcDemod/Brik2_u/TauEst1Ila[13]} {stcDemod/Brik2_u/TauEst1Ila[14]} {stcDemod/Brik2_u/TauEst1Ila[15]} {stcDemod/Brik2_u/TauEst1Ila[16]} {stcDemod/Brik2_u/TauEst1Ila[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe5]
set_property port_width 18 [get_debug_ports u_ila_0/probe5]
connect_debug_port u_ila_0/probe5 [get_nets [list {stcDemod/Brik2_u/TauEst0Ila[0]} {stcDemod/Brik2_u/TauEst0Ila[1]} {stcDemod/Brik2_u/TauEst0Ila[2]} {stcDemod/Brik2_u/TauEst0Ila[3]} {stcDemod/Brik2_u/TauEst0Ila[4]} {stcDemod/Brik2_u/TauEst0Ila[5]} {stcDemod/Brik2_u/TauEst0Ila[6]} {stcDemod/Brik2_u/TauEst0Ila[7]} {stcDemod/Brik2_u/TauEst0Ila[8]} {stcDemod/Brik2_u/TauEst0Ila[9]} {stcDemod/Brik2_u/TauEst0Ila[10]} {stcDemod/Brik2_u/TauEst0Ila[11]} {stcDemod/Brik2_u/TauEst0Ila[12]} {stcDemod/Brik2_u/TauEst0Ila[13]} {stcDemod/Brik2_u/TauEst0Ila[14]} {stcDemod/Brik2_u/TauEst0Ila[15]} {stcDemod/Brik2_u/TauEst0Ila[16]} {stcDemod/Brik2_u/TauEst0Ila[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe6]
set_property port_width 18 [get_debug_ports u_ila_0/probe6]
connect_debug_port u_ila_0/probe6 [get_nets [list {stcDemod/PD_u/Peak2_Ila[0]} {stcDemod/PD_u/Peak2_Ila[1]} {stcDemod/PD_u/Peak2_Ila[2]} {stcDemod/PD_u/Peak2_Ila[3]} {stcDemod/PD_u/Peak2_Ila[4]} {stcDemod/PD_u/Peak2_Ila[5]} {stcDemod/PD_u/Peak2_Ila[6]} {stcDemod/PD_u/Peak2_Ila[7]} {stcDemod/PD_u/Peak2_Ila[8]} {stcDemod/PD_u/Peak2_Ila[9]} {stcDemod/PD_u/Peak2_Ila[10]} {stcDemod/PD_u/Peak2_Ila[11]} {stcDemod/PD_u/Peak2_Ila[12]} {stcDemod/PD_u/Peak2_Ila[13]} {stcDemod/PD_u/Peak2_Ila[14]} {stcDemod/PD_u/Peak2_Ila[15]} {stcDemod/PD_u/Peak2_Ila[16]} {stcDemod/PD_u/Peak2_Ila[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe7]
set_property port_width 18 [get_debug_ports u_ila_0/probe7]
connect_debug_port u_ila_0/probe7 [get_nets [list {stcDemod/PD_u/Peak1_Ila[0]} {stcDemod/PD_u/Peak1_Ila[1]} {stcDemod/PD_u/Peak1_Ila[2]} {stcDemod/PD_u/Peak1_Ila[3]} {stcDemod/PD_u/Peak1_Ila[4]} {stcDemod/PD_u/Peak1_Ila[5]} {stcDemod/PD_u/Peak1_Ila[6]} {stcDemod/PD_u/Peak1_Ila[7]} {stcDemod/PD_u/Peak1_Ila[8]} {stcDemod/PD_u/Peak1_Ila[9]} {stcDemod/PD_u/Peak1_Ila[10]} {stcDemod/PD_u/Peak1_Ila[11]} {stcDemod/PD_u/Peak1_Ila[12]} {stcDemod/PD_u/Peak1_Ila[13]} {stcDemod/PD_u/Peak1_Ila[14]} {stcDemod/PD_u/Peak1_Ila[15]} {stcDemod/PD_u/Peak1_Ila[16]} {stcDemod/PD_u/Peak1_Ila[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe8]
set_property port_width 10 [get_debug_ports u_ila_0/probe8]
connect_debug_port u_ila_0/probe8 [get_nets [list {stcDemod/PD_u/AbsIndex[0]} {stcDemod/PD_u/AbsIndex[1]} {stcDemod/PD_u/AbsIndex[2]} {stcDemod/PD_u/AbsIndex[3]} {stcDemod/PD_u/AbsIndex[4]} {stcDemod/PD_u/AbsIndex[5]} {stcDemod/PD_u/AbsIndex[6]} {stcDemod/PD_u/AbsIndex[7]} {stcDemod/PD_u/AbsIndex[8]} {stcDemod/PD_u/AbsIndex[9]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe9]
set_property port_width 18 [get_debug_ports u_ila_0/probe9]
connect_debug_port u_ila_0/probe9 [get_nets [list {stcDemod/PD_u/AbsCntr1_Ila[0]} {stcDemod/PD_u/AbsCntr1_Ila[1]} {stcDemod/PD_u/AbsCntr1_Ila[2]} {stcDemod/PD_u/AbsCntr1_Ila[3]} {stcDemod/PD_u/AbsCntr1_Ila[4]} {stcDemod/PD_u/AbsCntr1_Ila[5]} {stcDemod/PD_u/AbsCntr1_Ila[6]} {stcDemod/PD_u/AbsCntr1_Ila[7]} {stcDemod/PD_u/AbsCntr1_Ila[8]} {stcDemod/PD_u/AbsCntr1_Ila[9]} {stcDemod/PD_u/AbsCntr1_Ila[10]} {stcDemod/PD_u/AbsCntr1_Ila[11]} {stcDemod/PD_u/AbsCntr1_Ila[12]} {stcDemod/PD_u/AbsCntr1_Ila[13]} {stcDemod/PD_u/AbsCntr1_Ila[14]} {stcDemod/PD_u/AbsCntr1_Ila[15]} {stcDemod/PD_u/AbsCntr1_Ila[16]} {stcDemod/PD_u/AbsCntr1_Ila[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe10]
set_property port_width 18 [get_debug_ports u_ila_0/probe10]
connect_debug_port u_ila_0/probe10 [get_nets [list {stcDemod/PD_u/AbsCntr0_Ila[0]} {stcDemod/PD_u/AbsCntr0_Ila[1]} {stcDemod/PD_u/AbsCntr0_Ila[2]} {stcDemod/PD_u/AbsCntr0_Ila[3]} {stcDemod/PD_u/AbsCntr0_Ila[4]} {stcDemod/PD_u/AbsCntr0_Ila[5]} {stcDemod/PD_u/AbsCntr0_Ila[6]} {stcDemod/PD_u/AbsCntr0_Ila[7]} {stcDemod/PD_u/AbsCntr0_Ila[8]} {stcDemod/PD_u/AbsCntr0_Ila[9]} {stcDemod/PD_u/AbsCntr0_Ila[10]} {stcDemod/PD_u/AbsCntr0_Ila[11]} {stcDemod/PD_u/AbsCntr0_Ila[12]} {stcDemod/PD_u/AbsCntr0_Ila[13]} {stcDemod/PD_u/AbsCntr0_Ila[14]} {stcDemod/PD_u/AbsCntr0_Ila[15]} {stcDemod/PD_u/AbsCntr0_Ila[16]} {stcDemod/PD_u/AbsCntr0_Ila[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe11]
set_property port_width 15 [get_debug_ports u_ila_0/probe11]
connect_debug_port u_ila_0/probe11 [get_nets [list {stcDemod/Trellis_u/fa/wrAddr[0]} {stcDemod/Trellis_u/fa/wrAddr[1]} {stcDemod/Trellis_u/fa/wrAddr[2]} {stcDemod/Trellis_u/fa/wrAddr[3]} {stcDemod/Trellis_u/fa/wrAddr[4]} {stcDemod/Trellis_u/fa/wrAddr[5]} {stcDemod/Trellis_u/fa/wrAddr[6]} {stcDemod/Trellis_u/fa/wrAddr[7]} {stcDemod/Trellis_u/fa/wrAddr[8]} {stcDemod/Trellis_u/fa/wrAddr[9]} {stcDemod/Trellis_u/fa/wrAddr[10]} {stcDemod/Trellis_u/fa/wrAddr[11]} {stcDemod/Trellis_u/fa/wrAddr[12]} {stcDemod/Trellis_u/fa/wrAddr[13]} {stcDemod/Trellis_u/fa/wrAddr[14]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe12]
set_property port_width 15 [get_debug_ports u_ila_0/probe12]
connect_debug_port u_ila_0/probe12 [get_nets [list {stcDemod/Trellis_u/fa/sampleCount_reg[0]} {stcDemod/Trellis_u/fa/sampleCount_reg[1]} {stcDemod/Trellis_u/fa/sampleCount_reg[2]} {stcDemod/Trellis_u/fa/sampleCount_reg[3]} {stcDemod/Trellis_u/fa/sampleCount_reg[4]} {stcDemod/Trellis_u/fa/sampleCount_reg[5]} {stcDemod/Trellis_u/fa/sampleCount_reg[6]} {stcDemod/Trellis_u/fa/sampleCount_reg[7]} {stcDemod/Trellis_u/fa/sampleCount_reg[8]} {stcDemod/Trellis_u/fa/sampleCount_reg[9]} {stcDemod/Trellis_u/fa/sampleCount_reg[10]} {stcDemod/Trellis_u/fa/sampleCount_reg[11]} {stcDemod/Trellis_u/fa/sampleCount_reg[12]} {stcDemod/Trellis_u/fa/sampleCount_reg[13]} {stcDemod/Trellis_u/fa/sampleCount_reg[14]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe13]
set_property port_width 15 [get_debug_ports u_ila_0/probe13]
connect_debug_port u_ila_0/probe13 [get_nets [list {stcDemod/Trellis_u/fa/rdAddr[0]} {stcDemod/Trellis_u/fa/rdAddr[1]} {stcDemod/Trellis_u/fa/rdAddr[2]} {stcDemod/Trellis_u/fa/rdAddr[3]} {stcDemod/Trellis_u/fa/rdAddr[4]} {stcDemod/Trellis_u/fa/rdAddr[5]} {stcDemod/Trellis_u/fa/rdAddr[6]} {stcDemod/Trellis_u/fa/rdAddr[7]} {stcDemod/Trellis_u/fa/rdAddr[8]} {stcDemod/Trellis_u/fa/rdAddr[9]} {stcDemod/Trellis_u/fa/rdAddr[10]} {stcDemod/Trellis_u/fa/rdAddr[11]} {stcDemod/Trellis_u/fa/rdAddr[12]} {stcDemod/Trellis_u/fa/rdAddr[13]} {stcDemod/Trellis_u/fa/rdAddr[14]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe14]
set_property port_width 15 [get_debug_ports u_ila_0/probe14]
connect_debug_port u_ila_0/probe14 [get_nets [list {stcDemod/Trellis_u/fa/depth[0]} {stcDemod/Trellis_u/fa/depth[1]} {stcDemod/Trellis_u/fa/depth[2]} {stcDemod/Trellis_u/fa/depth[3]} {stcDemod/Trellis_u/fa/depth[4]} {stcDemod/Trellis_u/fa/depth[5]} {stcDemod/Trellis_u/fa/depth[6]} {stcDemod/Trellis_u/fa/depth[7]} {stcDemod/Trellis_u/fa/depth[8]} {stcDemod/Trellis_u/fa/depth[9]} {stcDemod/Trellis_u/fa/depth[10]} {stcDemod/Trellis_u/fa/depth[11]} {stcDemod/Trellis_u/fa/depth[12]} {stcDemod/Trellis_u/fa/depth[13]} {stcDemod/Trellis_u/fa/depth[14]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe15]
set_property port_width 24 [get_debug_ports u_ila_0/probe15]
connect_debug_port u_ila_0/probe15 [get_nets [list {stcDemod/pn_derand2/data_buffer[0]} {stcDemod/pn_derand2/data_buffer[1]} {stcDemod/pn_derand2/data_buffer[2]} {stcDemod/pn_derand2/data_buffer[3]} {stcDemod/pn_derand2/data_buffer[4]} {stcDemod/pn_derand2/data_buffer[5]} {stcDemod/pn_derand2/data_buffer[6]} {stcDemod/pn_derand2/data_buffer[7]} {stcDemod/pn_derand2/data_buffer[8]} {stcDemod/pn_derand2/data_buffer[9]} {stcDemod/pn_derand2/data_buffer[10]} {stcDemod/pn_derand2/data_buffer[11]} {stcDemod/pn_derand2/data_buffer[12]} {stcDemod/pn_derand2/data_buffer[13]} {stcDemod/pn_derand2/data_buffer[14]} {stcDemod/pn_derand2/data_buffer[15]} {stcDemod/pn_derand2/data_buffer[16]} {stcDemod/pn_derand2/data_buffer[17]} {stcDemod/pn_derand2/data_buffer[18]} {stcDemod/pn_derand2/data_buffer[19]} {stcDemod/pn_derand2/data_buffer[20]} {stcDemod/pn_derand2/data_buffer[21]} {stcDemod/pn_derand2/data_buffer[22]} {stcDemod/pn_derand2/data_buffer[23]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe16]
set_property port_width 16 [get_debug_ports u_ila_0/probe16]
connect_debug_port u_ila_0/probe16 [get_nets [list {stcDemod/PS_u/WrAddr[0]} {stcDemod/PS_u/WrAddr[1]} {stcDemod/PS_u/WrAddr[2]} {stcDemod/PS_u/WrAddr[3]} {stcDemod/PS_u/WrAddr[4]} {stcDemod/PS_u/WrAddr[5]} {stcDemod/PS_u/WrAddr[6]} {stcDemod/PS_u/WrAddr[7]} {stcDemod/PS_u/WrAddr[8]} {stcDemod/PS_u/WrAddr[9]} {stcDemod/PS_u/WrAddr[10]} {stcDemod/PS_u/WrAddr[11]} {stcDemod/PS_u/WrAddr[12]} {stcDemod/PS_u/WrAddr[13]} {stcDemod/PS_u/WrAddr[14]} {stcDemod/PS_u/WrAddr[15]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe17]
set_property port_width 16 [get_debug_ports u_ila_0/probe17]
connect_debug_port u_ila_0/probe17 [get_nets [list {stcDemod/PS_u/RdAddr[0]} {stcDemod/PS_u/RdAddr[1]} {stcDemod/PS_u/RdAddr[2]} {stcDemod/PS_u/RdAddr[3]} {stcDemod/PS_u/RdAddr[4]} {stcDemod/PS_u/RdAddr[5]} {stcDemod/PS_u/RdAddr[6]} {stcDemod/PS_u/RdAddr[7]} {stcDemod/PS_u/RdAddr[8]} {stcDemod/PS_u/RdAddr[9]} {stcDemod/PS_u/RdAddr[10]} {stcDemod/PS_u/RdAddr[11]} {stcDemod/PS_u/RdAddr[12]} {stcDemod/PS_u/RdAddr[13]} {stcDemod/PS_u/RdAddr[14]} {stcDemod/PS_u/RdAddr[15]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe18]
set_property port_width 14 [get_debug_ports u_ila_0/probe18]
connect_debug_port u_ila_0/probe18 [get_nets [list {stcDemod/PS_u/FrmSmplCount[0]} {stcDemod/PS_u/FrmSmplCount[1]} {stcDemod/PS_u/FrmSmplCount[2]} {stcDemod/PS_u/FrmSmplCount[3]} {stcDemod/PS_u/FrmSmplCount[4]} {stcDemod/PS_u/FrmSmplCount[5]} {stcDemod/PS_u/FrmSmplCount[6]} {stcDemod/PS_u/FrmSmplCount[7]} {stcDemod/PS_u/FrmSmplCount[8]} {stcDemod/PS_u/FrmSmplCount[9]} {stcDemod/PS_u/FrmSmplCount[10]} {stcDemod/PS_u/FrmSmplCount[11]} {stcDemod/PS_u/FrmSmplCount[12]} {stcDemod/PS_u/FrmSmplCount[13]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe19]
set_property port_width 12 [get_debug_ports u_ila_0/probe19]
connect_debug_port u_ila_0/probe19 [get_nets [list {stcDemod/r[0]} {stcDemod/r[1]} {stcDemod/r[2]} {stcDemod/r[3]} {stcDemod/r[4]} {stcDemod/r[5]} {stcDemod/r[6]} {stcDemod/r[7]} {stcDemod/r[8]} {stcDemod/r[9]} {stcDemod/r[10]} {stcDemod/r[11]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe20]
set_property port_width 4 [get_debug_ports u_ila_0/probe20]
connect_debug_port u_ila_0/probe20 [get_nets [list {stcDemod/m_ndx1Slv[0]} {stcDemod/m_ndx1Slv[1]} {stcDemod/m_ndx1Slv[2]} {stcDemod/m_ndx1Slv[3]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe21]
set_property port_width 4 [get_debug_ports u_ila_0/probe21]
connect_debug_port u_ila_0/probe21 [get_nets [list {stcDemod/m_ndx0Slv[0]} {stcDemod/m_ndx0Slv[1]} {stcDemod/m_ndx0Slv[2]} {stcDemod/m_ndx0Slv[3]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe22]
set_property port_width 6 [get_debug_ports u_ila_0/probe22]
connect_debug_port u_ila_0/probe22 [get_nets [list {stcDemod/deltaTauEstSlv[0]} {stcDemod/deltaTauEstSlv[1]} {stcDemod/deltaTauEstSlv[2]} {stcDemod/deltaTauEstSlv[3]} {stcDemod/deltaTauEstSlv[4]} {stcDemod/deltaTauEstSlv[5]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe23]
set_property port_width 4 [get_debug_ports u_ila_0/probe23]
connect_debug_port u_ila_0/probe23 [get_nets [list {stcDemod/TrellisBits[0]} {stcDemod/TrellisBits[1]} {stcDemod/TrellisBits[2]} {stcDemod/TrellisBits[3]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe24]
set_property port_width 18 [get_debug_ports u_ila_0/probe24]
connect_debug_port u_ila_0/probe24 [get_nets [list {stcDemod/InRBrik2Ila[0]} {stcDemod/InRBrik2Ila[1]} {stcDemod/InRBrik2Ila[2]} {stcDemod/InRBrik2Ila[3]} {stcDemod/InRBrik2Ila[4]} {stcDemod/InRBrik2Ila[5]} {stcDemod/InRBrik2Ila[6]} {stcDemod/InRBrik2Ila[7]} {stcDemod/InRBrik2Ila[8]} {stcDemod/InRBrik2Ila[9]} {stcDemod/InRBrik2Ila[10]} {stcDemod/InRBrik2Ila[11]} {stcDemod/InRBrik2Ila[12]} {stcDemod/InRBrik2Ila[13]} {stcDemod/InRBrik2Ila[14]} {stcDemod/InRBrik2Ila[15]} {stcDemod/InRBrik2Ila[16]} {stcDemod/InRBrik2Ila[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe25]
set_property port_width 12 [get_debug_ports u_ila_0/probe25]
connect_debug_port u_ila_0/probe25 [get_nets [list {stcDemod/InPhase[0]} {stcDemod/InPhase[1]} {stcDemod/InPhase[2]} {stcDemod/InPhase[3]} {stcDemod/InPhase[4]} {stcDemod/InPhase[5]} {stcDemod/InPhase[6]} {stcDemod/InPhase[7]} {stcDemod/InPhase[8]} {stcDemod/InPhase[9]} {stcDemod/InPhase[10]} {stcDemod/InPhase[11]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe26]
set_property port_width 13 [get_debug_ports u_ila_0/probe26]
connect_debug_port u_ila_0/probe26 [get_nets [list {stcDemod/InMag[0]} {stcDemod/InMag[1]} {stcDemod/InMag[2]} {stcDemod/InMag[3]} {stcDemod/InMag[4]} {stcDemod/InMag[5]} {stcDemod/InMag[6]} {stcDemod/InMag[7]} {stcDemod/InMag[8]} {stcDemod/InMag[9]} {stcDemod/InMag[10]} {stcDemod/InMag[11]} {stcDemod/InMag[12]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe27]
set_property port_width 18 [get_debug_ports u_ila_0/probe27]
connect_debug_port u_ila_0/probe27 [get_nets [list {stcDemod/InIBrik2Ila[0]} {stcDemod/InIBrik2Ila[1]} {stcDemod/InIBrik2Ila[2]} {stcDemod/InIBrik2Ila[3]} {stcDemod/InIBrik2Ila[4]} {stcDemod/InIBrik2Ila[5]} {stcDemod/InIBrik2Ila[6]} {stcDemod/InIBrik2Ila[7]} {stcDemod/InIBrik2Ila[8]} {stcDemod/InIBrik2Ila[9]} {stcDemod/InIBrik2Ila[10]} {stcDemod/InIBrik2Ila[11]} {stcDemod/InIBrik2Ila[12]} {stcDemod/InIBrik2Ila[13]} {stcDemod/InIBrik2Ila[14]} {stcDemod/InIBrik2Ila[15]} {stcDemod/InIBrik2Ila[16]} {stcDemod/InIBrik2Ila[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe28]
set_property port_width 12 [get_debug_ports u_ila_0/probe28]
connect_debug_port u_ila_0/probe28 [get_nets [list {stcDemod/H1Phase[0]} {stcDemod/H1Phase[1]} {stcDemod/H1Phase[2]} {stcDemod/H1Phase[3]} {stcDemod/H1Phase[4]} {stcDemod/H1Phase[5]} {stcDemod/H1Phase[6]} {stcDemod/H1Phase[7]} {stcDemod/H1Phase[8]} {stcDemod/H1Phase[9]} {stcDemod/H1Phase[10]} {stcDemod/H1Phase[11]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe29]
set_property port_width 13 [get_debug_ports u_ila_0/probe29]
connect_debug_port u_ila_0/probe29 [get_nets [list {stcDemod/H1Mag[0]} {stcDemod/H1Mag[1]} {stcDemod/H1Mag[2]} {stcDemod/H1Mag[3]} {stcDemod/H1Mag[4]} {stcDemod/H1Mag[5]} {stcDemod/H1Mag[6]} {stcDemod/H1Mag[7]} {stcDemod/H1Mag[8]} {stcDemod/H1Mag[9]} {stcDemod/H1Mag[10]} {stcDemod/H1Mag[11]} {stcDemod/H1Mag[12]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe30]
set_property port_width 13 [get_debug_ports u_ila_0/probe30]
connect_debug_port u_ila_0/probe30 [get_nets [list {stcDemod/H0Mag[0]} {stcDemod/H0Mag[1]} {stcDemod/H0Mag[2]} {stcDemod/H0Mag[3]} {stcDemod/H0Mag[4]} {stcDemod/H0Mag[5]} {stcDemod/H0Mag[6]} {stcDemod/H0Mag[7]} {stcDemod/H0Mag[8]} {stcDemod/H0Mag[9]} {stcDemod/H0Mag[10]} {stcDemod/H0Mag[11]} {stcDemod/H0Mag[12]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe31]
set_property port_width 12 [get_debug_ports u_ila_0/probe31]
connect_debug_port u_ila_0/probe31 [get_nets [list {stcDemod/H0Phase[0]} {stcDemod/H0Phase[1]} {stcDemod/H0Phase[2]} {stcDemod/H0Phase[3]} {stcDemod/H0Phase[4]} {stcDemod/H0Phase[5]} {stcDemod/H0Phase[6]} {stcDemod/H0Phase[7]} {stcDemod/H0Phase[8]} {stcDemod/H0Phase[9]} {stcDemod/H0Phase[10]} {stcDemod/H0Phase[11]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe32]
set_property port_width 10 [get_debug_ports u_ila_0/probe32]
connect_debug_port u_ila_0/probe32 [get_nets [list {stcDemod/DataAddr[0]} {stcDemod/DataAddr[1]} {stcDemod/DataAddr[2]} {stcDemod/DataAddr[3]} {stcDemod/DataAddr[4]} {stcDemod/DataAddr[5]} {stcDemod/DataAddr[6]} {stcDemod/DataAddr[7]} {stcDemod/DataAddr[8]} {stcDemod/DataAddr[9]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe33]
set_property port_width 9 [get_debug_ports u_ila_0/probe33]
connect_debug_port u_ila_0/probe33 [get_nets [list {stcDemod/CorrPntr8to0[0]} {stcDemod/CorrPntr8to0[1]} {stcDemod/CorrPntr8to0[2]} {stcDemod/CorrPntr8to0[3]} {stcDemod/CorrPntr8to0[4]} {stcDemod/CorrPntr8to0[5]} {stcDemod/CorrPntr8to0[6]} {stcDemod/CorrPntr8to0[7]} {stcDemod/CorrPntr8to0[8]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe34]
set_property port_width 12 [get_debug_ports u_ila_0/probe34]
connect_debug_port u_ila_0/probe34 [get_nets [list {stcDemod/Ber[0]} {stcDemod/Ber[1]} {stcDemod/Ber[2]} {stcDemod/Ber[3]} {stcDemod/Ber[4]} {stcDemod/Ber[5]} {stcDemod/Ber[6]} {stcDemod/Ber[7]} {stcDemod/Ber[8]} {stcDemod/Ber[9]} {stcDemod/Ber[10]} {stcDemod/Ber[11]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe35]
set_property port_width 1 [get_debug_ports u_ila_0/probe35]
connect_debug_port u_ila_0/probe35 [get_nets [list stcDemod/Brik2_u/ChanEstDone]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe36]
set_property port_width 1 [get_debug_ports u_ila_0/probe36]
connect_debug_port u_ila_0/probe36 [get_nets [list stcDemod/ClkOutEn]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe37]
set_property port_width 1 [get_debug_ports u_ila_0/probe37]
connect_debug_port u_ila_0/probe37 [get_nets [list stcDemod/ClkOutEn2]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe38]
set_property port_width 1 [get_debug_ports u_ila_0/probe38]
connect_debug_port u_ila_0/probe38 [get_nets [list stcDemod/pn_derand2/code_bit]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe39]
set_property port_width 1 [get_debug_ports u_ila_0/probe39]
connect_debug_port u_ila_0/probe39 [get_nets [list stcDemod/pn_derand2/data_bit]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe40]
set_property port_width 1 [get_debug_ports u_ila_0/probe40]
connect_debug_port u_ila_0/probe40 [get_nets [list stcDemod/DataOut]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe41]
set_property port_width 1 [get_debug_ports u_ila_0/probe41]
connect_debug_port u_ila_0/probe41 [get_nets [list stcDemod/DataOut2]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe42]
set_property port_width 1 [get_debug_ports u_ila_0/probe42]
connect_debug_port u_ila_0/probe42 [get_nets [list stcDemod/pn_derand2/enable]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe43]
set_property port_width 1 [get_debug_ports u_ila_0/probe43]
connect_debug_port u_ila_0/probe43 [get_nets [list stcDemod/EstimatesDone]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe44]
set_property port_width 1 [get_debug_ports u_ila_0/probe44]
connect_debug_port u_ila_0/probe44 [get_nets [list stcDemod/pn_derand2/lfsr_enable]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe45]
set_property port_width 1 [get_debug_ports u_ila_0/probe45]
connect_debug_port u_ila_0/probe45 [get_nets [list stcDemod/Mag0GtMag1]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe46]
set_property port_width 1 [get_debug_ports u_ila_0/probe46]
connect_debug_port u_ila_0/probe46 [get_nets [list stcDemod/PS_u/Missed]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe47]
set_property port_width 1 [get_debug_ports u_ila_0/probe47]
connect_debug_port u_ila_0/probe47 [get_nets [list stcDemod/PD_u/PilotFound]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe48]
set_property port_width 1 [get_debug_ports u_ila_0/probe48]
connect_debug_port u_ila_0/probe48 [get_nets [list stcDemod/PilotFoundCE]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe49]
set_property port_width 1 [get_debug_ports u_ila_0/probe49]
connect_debug_port u_ila_0/probe49 [get_nets [list stcDemod/PilotFoundPD]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe50]
set_property port_width 1 [get_debug_ports u_ila_0/probe50]
connect_debug_port u_ila_0/probe50 [get_nets [list stcDemod/PS_u/PilotPulseIn]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe51]
set_property port_width 1 [get_debug_ports u_ila_0/probe51]
connect_debug_port u_ila_0/probe51 [get_nets [list stcDemod/PS_u/PilotValid]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe52]
set_property port_width 1 [get_debug_ports u_ila_0/probe52]
connect_debug_port u_ila_0/probe52 [get_nets [list stcDemod/pn_derand2/reload]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe53]
set_property port_width 1 [get_debug_ports u_ila_0/probe53]
connect_debug_port u_ila_0/probe53 [get_nets [list stcDemod/pn_derand2/reset]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe54]
set_property port_width 1 [get_debug_ports u_ila_0/probe54]
connect_debug_port u_ila_0/probe54 [get_nets [list stcDemod/StartIla]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe55]
set_property port_width 1 [get_debug_ports u_ila_0/probe55]
connect_debug_port u_ila_0/probe55 [get_nets [list stcDemod/PS_u/StartOut]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe56]
set_property port_width 1 [get_debug_ports u_ila_0/probe56]
connect_debug_port u_ila_0/probe56 [get_nets [list stcDemod/Brik2_u/TimeEstDone]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe57]
set_property port_width 1 [get_debug_ports u_ila_0/probe57]
connect_debug_port u_ila_0/probe57 [get_nets [list stcDemod/ValidData2047]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe58]
set_property port_width 1 [get_debug_ports u_ila_0/probe58]
connect_debug_port u_ila_0/probe58 [get_nets [list stcDemod/ValidDataTrellis]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe59]
set_property port_width 1 [get_debug_ports u_ila_0/probe59]
connect_debug_port u_ila_0/probe59 [get_nets [list stcDemod/ValidIla]]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets clk2x]
