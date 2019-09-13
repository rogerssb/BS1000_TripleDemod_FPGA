


create_debug_core u_ila_0 ila
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_0]
set_property ALL_PROBE_SAME_MU_CNT 4 [get_debug_cores u_ila_0]
set_property C_ADV_TRIGGER true [get_debug_cores u_ila_0]
set_property C_DATA_DEPTH 2048 [get_debug_cores u_ila_0]
set_property C_EN_STRG_QUAL true [get_debug_cores u_ila_0]
set_property C_INPUT_PIPE_STAGES 2 [get_debug_cores u_ila_0]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_0]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_0]
set_property port_width 1 [get_debug_ports u_ila_0/clk]
connect_debug_port u_ila_0/clk [get_nets [list systemClock/inst/clk186]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe0]
set_property port_width 18 [get_debug_ports u_ila_0/probe0]
connect_debug_port u_ila_0/probe0 [get_nets [list {stcDemod/PD_u/AbsCntr1_Ila[0]} {stcDemod/PD_u/AbsCntr1_Ila[1]} {stcDemod/PD_u/AbsCntr1_Ila[2]} {stcDemod/PD_u/AbsCntr1_Ila[3]} {stcDemod/PD_u/AbsCntr1_Ila[4]} {stcDemod/PD_u/AbsCntr1_Ila[5]} {stcDemod/PD_u/AbsCntr1_Ila[6]} {stcDemod/PD_u/AbsCntr1_Ila[7]} {stcDemod/PD_u/AbsCntr1_Ila[8]} {stcDemod/PD_u/AbsCntr1_Ila[9]} {stcDemod/PD_u/AbsCntr1_Ila[10]} {stcDemod/PD_u/AbsCntr1_Ila[11]} {stcDemod/PD_u/AbsCntr1_Ila[12]} {stcDemod/PD_u/AbsCntr1_Ila[13]} {stcDemod/PD_u/AbsCntr1_Ila[14]} {stcDemod/PD_u/AbsCntr1_Ila[15]} {stcDemod/PD_u/AbsCntr1_Ila[16]} {stcDemod/PD_u/AbsCntr1_Ila[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe1]
set_property port_width 18 [get_debug_ports u_ila_0/probe1]
connect_debug_port u_ila_0/probe1 [get_nets [list {stcDemod/PD_u/AbsCntr0_Ila[0]} {stcDemod/PD_u/AbsCntr0_Ila[1]} {stcDemod/PD_u/AbsCntr0_Ila[2]} {stcDemod/PD_u/AbsCntr0_Ila[3]} {stcDemod/PD_u/AbsCntr0_Ila[4]} {stcDemod/PD_u/AbsCntr0_Ila[5]} {stcDemod/PD_u/AbsCntr0_Ila[6]} {stcDemod/PD_u/AbsCntr0_Ila[7]} {stcDemod/PD_u/AbsCntr0_Ila[8]} {stcDemod/PD_u/AbsCntr0_Ila[9]} {stcDemod/PD_u/AbsCntr0_Ila[10]} {stcDemod/PD_u/AbsCntr0_Ila[11]} {stcDemod/PD_u/AbsCntr0_Ila[12]} {stcDemod/PD_u/AbsCntr0_Ila[13]} {stcDemod/PD_u/AbsCntr0_Ila[14]} {stcDemod/PD_u/AbsCntr0_Ila[15]} {stcDemod/PD_u/AbsCntr0_Ila[16]} {stcDemod/PD_u/AbsCntr0_Ila[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe2]
set_property port_width 18 [get_debug_ports u_ila_0/probe2]
connect_debug_port u_ila_0/probe2 [get_nets [list {stcDemod/PD_u/PhsPeak1[0]} {stcDemod/PD_u/PhsPeak1[1]} {stcDemod/PD_u/PhsPeak1[2]} {stcDemod/PD_u/PhsPeak1[3]} {stcDemod/PD_u/PhsPeak1[4]} {stcDemod/PD_u/PhsPeak1[5]} {stcDemod/PD_u/PhsPeak1[6]} {stcDemod/PD_u/PhsPeak1[7]} {stcDemod/PD_u/PhsPeak1[8]} {stcDemod/PD_u/PhsPeak1[9]} {stcDemod/PD_u/PhsPeak1[10]} {stcDemod/PD_u/PhsPeak1[11]} {stcDemod/PD_u/PhsPeak1[12]} {stcDemod/PD_u/PhsPeak1[13]} {stcDemod/PD_u/PhsPeak1[14]} {stcDemod/PD_u/PhsPeak1[15]} {stcDemod/PD_u/PhsPeak1[16]} {stcDemod/PD_u/PhsPeak1[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe3]
set_property port_width 18 [get_debug_ports u_ila_0/probe3]
connect_debug_port u_ila_0/probe3 [get_nets [list {stcDemod/PD_u/PhsPeak0[0]} {stcDemod/PD_u/PhsPeak0[1]} {stcDemod/PD_u/PhsPeak0[2]} {stcDemod/PD_u/PhsPeak0[3]} {stcDemod/PD_u/PhsPeak0[4]} {stcDemod/PD_u/PhsPeak0[5]} {stcDemod/PD_u/PhsPeak0[6]} {stcDemod/PD_u/PhsPeak0[7]} {stcDemod/PD_u/PhsPeak0[8]} {stcDemod/PD_u/PhsPeak0[9]} {stcDemod/PD_u/PhsPeak0[10]} {stcDemod/PD_u/PhsPeak0[11]} {stcDemod/PD_u/PhsPeak0[12]} {stcDemod/PD_u/PhsPeak0[13]} {stcDemod/PD_u/PhsPeak0[14]} {stcDemod/PD_u/PhsPeak0[15]} {stcDemod/PD_u/PhsPeak0[16]} {stcDemod/PD_u/PhsPeak0[17]}]]
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
set_property port_width 13 [get_debug_ports u_ila_0/probe7]
connect_debug_port u_ila_0/probe7 [get_nets [list {stcDemod/H1Mag[0]} {stcDemod/H1Mag[1]} {stcDemod/H1Mag[2]} {stcDemod/H1Mag[3]} {stcDemod/H1Mag[4]} {stcDemod/H1Mag[5]} {stcDemod/H1Mag[6]} {stcDemod/H1Mag[7]} {stcDemod/H1Mag[8]} {stcDemod/H1Mag[9]} {stcDemod/H1Mag[10]} {stcDemod/H1Mag[11]} {stcDemod/H1Mag[12]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe8]
set_property port_width 13 [get_debug_ports u_ila_0/probe8]
connect_debug_port u_ila_0/probe8 [get_nets [list {stcDemod/H0Mag[0]} {stcDemod/H0Mag[1]} {stcDemod/H0Mag[2]} {stcDemod/H0Mag[3]} {stcDemod/H0Mag[4]} {stcDemod/H0Mag[5]} {stcDemod/H0Mag[6]} {stcDemod/H0Mag[7]} {stcDemod/H0Mag[8]} {stcDemod/H0Mag[9]} {stcDemod/H0Mag[10]} {stcDemod/H0Mag[11]} {stcDemod/H0Mag[12]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe9]
set_property port_width 9 [get_debug_ports u_ila_0/probe9]
connect_debug_port u_ila_0/probe9 [get_nets [list {stcDemod/CorrPntr8to0[0]} {stcDemod/CorrPntr8to0[1]} {stcDemod/CorrPntr8to0[2]} {stcDemod/CorrPntr8to0[3]} {stcDemod/CorrPntr8to0[4]} {stcDemod/CorrPntr8to0[5]} {stcDemod/CorrPntr8to0[6]} {stcDemod/CorrPntr8to0[7]} {stcDemod/CorrPntr8to0[8]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe10]
set_property port_width 18 [get_debug_ports u_ila_0/probe10]
connect_debug_port u_ila_0/probe10 [get_nets [list {stcDemod/Ch1MuSlv[0]} {stcDemod/Ch1MuSlv[1]} {stcDemod/Ch1MuSlv[2]} {stcDemod/Ch1MuSlv[3]} {stcDemod/Ch1MuSlv[4]} {stcDemod/Ch1MuSlv[5]} {stcDemod/Ch1MuSlv[6]} {stcDemod/Ch1MuSlv[7]} {stcDemod/Ch1MuSlv[8]} {stcDemod/Ch1MuSlv[9]} {stcDemod/Ch1MuSlv[10]} {stcDemod/Ch1MuSlv[11]} {stcDemod/Ch1MuSlv[12]} {stcDemod/Ch1MuSlv[13]} {stcDemod/Ch1MuSlv[14]} {stcDemod/Ch1MuSlv[15]} {stcDemod/Ch1MuSlv[16]} {stcDemod/Ch1MuSlv[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe11]
set_property port_width 12 [get_debug_ports u_ila_0/probe11]
connect_debug_port u_ila_0/probe11 [get_nets [list {stcDemod/BitErrors[0]} {stcDemod/BitErrors[1]} {stcDemod/BitErrors[2]} {stcDemod/BitErrors[3]} {stcDemod/BitErrors[4]} {stcDemod/BitErrors[5]} {stcDemod/BitErrors[6]} {stcDemod/BitErrors[7]} {stcDemod/BitErrors[8]} {stcDemod/BitErrors[9]} {stcDemod/BitErrors[10]} {stcDemod/BitErrors[11]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe12]
set_property port_width 18 [get_debug_ports u_ila_0/probe12]
connect_debug_port u_ila_0/probe12 [get_nets [list {stcDemod/Ch0MuSlv[0]} {stcDemod/Ch0MuSlv[1]} {stcDemod/Ch0MuSlv[2]} {stcDemod/Ch0MuSlv[3]} {stcDemod/Ch0MuSlv[4]} {stcDemod/Ch0MuSlv[5]} {stcDemod/Ch0MuSlv[6]} {stcDemod/Ch0MuSlv[7]} {stcDemod/Ch0MuSlv[8]} {stcDemod/Ch0MuSlv[9]} {stcDemod/Ch0MuSlv[10]} {stcDemod/Ch0MuSlv[11]} {stcDemod/Ch0MuSlv[12]} {stcDemod/Ch0MuSlv[13]} {stcDemod/Ch0MuSlv[14]} {stcDemod/Ch0MuSlv[15]} {stcDemod/Ch0MuSlv[16]} {stcDemod/Ch0MuSlv[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe13]
set_property port_width 12 [get_debug_ports u_ila_0/probe13]
connect_debug_port u_ila_0/probe13 [get_nets [list {stcDemod/Bert[0]} {stcDemod/Bert[1]} {stcDemod/Bert[2]} {stcDemod/Bert[3]} {stcDemod/Bert[4]} {stcDemod/Bert[5]} {stcDemod/Bert[6]} {stcDemod/Bert[7]} {stcDemod/Bert[8]} {stcDemod/Bert[9]} {stcDemod/Bert[10]} {stcDemod/Bert[11]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe14]
set_property port_width 8 [get_debug_ports u_ila_0/probe14]
connect_debug_port u_ila_0/probe14 [get_nets [list {stcDemod/Ber[0]} {stcDemod/Ber[1]} {stcDemod/Ber[2]} {stcDemod/Ber[3]} {stcDemod/Ber[4]} {stcDemod/Ber[5]} {stcDemod/Ber[6]} {stcDemod/Ber[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe15]
set_property port_width 18 [get_debug_ports u_ila_0/probe15]
connect_debug_port u_ila_0/probe15 [get_nets [list {stcDemod/Brik2_u/TauEst1Ila[0]} {stcDemod/Brik2_u/TauEst1Ila[1]} {stcDemod/Brik2_u/TauEst1Ila[2]} {stcDemod/Brik2_u/TauEst1Ila[3]} {stcDemod/Brik2_u/TauEst1Ila[4]} {stcDemod/Brik2_u/TauEst1Ila[5]} {stcDemod/Brik2_u/TauEst1Ila[6]} {stcDemod/Brik2_u/TauEst1Ila[7]} {stcDemod/Brik2_u/TauEst1Ila[8]} {stcDemod/Brik2_u/TauEst1Ila[9]} {stcDemod/Brik2_u/TauEst1Ila[10]} {stcDemod/Brik2_u/TauEst1Ila[11]} {stcDemod/Brik2_u/TauEst1Ila[12]} {stcDemod/Brik2_u/TauEst1Ila[13]} {stcDemod/Brik2_u/TauEst1Ila[14]} {stcDemod/Brik2_u/TauEst1Ila[15]} {stcDemod/Brik2_u/TauEst1Ila[16]} {stcDemod/Brik2_u/TauEst1Ila[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe16]
set_property port_width 18 [get_debug_ports u_ila_0/probe16]
connect_debug_port u_ila_0/probe16 [get_nets [list {stcDemod/Brik2_u/TauEst0Ila[0]} {stcDemod/Brik2_u/TauEst0Ila[1]} {stcDemod/Brik2_u/TauEst0Ila[2]} {stcDemod/Brik2_u/TauEst0Ila[3]} {stcDemod/Brik2_u/TauEst0Ila[4]} {stcDemod/Brik2_u/TauEst0Ila[5]} {stcDemod/Brik2_u/TauEst0Ila[6]} {stcDemod/Brik2_u/TauEst0Ila[7]} {stcDemod/Brik2_u/TauEst0Ila[8]} {stcDemod/Brik2_u/TauEst0Ila[9]} {stcDemod/Brik2_u/TauEst0Ila[10]} {stcDemod/Brik2_u/TauEst0Ila[11]} {stcDemod/Brik2_u/TauEst0Ila[12]} {stcDemod/Brik2_u/TauEst0Ila[13]} {stcDemod/Brik2_u/TauEst0Ila[14]} {stcDemod/Brik2_u/TauEst0Ila[15]} {stcDemod/Brik2_u/TauEst0Ila[16]} {stcDemod/Brik2_u/TauEst0Ila[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe17]
set_property port_width 18 [get_debug_ports u_ila_0/probe17]
connect_debug_port u_ila_0/probe17 [get_nets [list {stcDemod/Brik2_u/H0EstR_Ila[0]} {stcDemod/Brik2_u/H0EstR_Ila[1]} {stcDemod/Brik2_u/H0EstR_Ila[2]} {stcDemod/Brik2_u/H0EstR_Ila[3]} {stcDemod/Brik2_u/H0EstR_Ila[4]} {stcDemod/Brik2_u/H0EstR_Ila[5]} {stcDemod/Brik2_u/H0EstR_Ila[6]} {stcDemod/Brik2_u/H0EstR_Ila[7]} {stcDemod/Brik2_u/H0EstR_Ila[8]} {stcDemod/Brik2_u/H0EstR_Ila[9]} {stcDemod/Brik2_u/H0EstR_Ila[10]} {stcDemod/Brik2_u/H0EstR_Ila[11]} {stcDemod/Brik2_u/H0EstR_Ila[12]} {stcDemod/Brik2_u/H0EstR_Ila[13]} {stcDemod/Brik2_u/H0EstR_Ila[14]} {stcDemod/Brik2_u/H0EstR_Ila[15]} {stcDemod/Brik2_u/H0EstR_Ila[16]} {stcDemod/Brik2_u/H0EstR_Ila[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe18]
set_property port_width 18 [get_debug_ports u_ila_0/probe18]
connect_debug_port u_ila_0/probe18 [get_nets [list {stcDemod/Brik2_u/H1EstR_Ila[0]} {stcDemod/Brik2_u/H1EstR_Ila[1]} {stcDemod/Brik2_u/H1EstR_Ila[2]} {stcDemod/Brik2_u/H1EstR_Ila[3]} {stcDemod/Brik2_u/H1EstR_Ila[4]} {stcDemod/Brik2_u/H1EstR_Ila[5]} {stcDemod/Brik2_u/H1EstR_Ila[6]} {stcDemod/Brik2_u/H1EstR_Ila[7]} {stcDemod/Brik2_u/H1EstR_Ila[8]} {stcDemod/Brik2_u/H1EstR_Ila[9]} {stcDemod/Brik2_u/H1EstR_Ila[10]} {stcDemod/Brik2_u/H1EstR_Ila[11]} {stcDemod/Brik2_u/H1EstR_Ila[12]} {stcDemod/Brik2_u/H1EstR_Ila[13]} {stcDemod/Brik2_u/H1EstR_Ila[14]} {stcDemod/Brik2_u/H1EstR_Ila[15]} {stcDemod/Brik2_u/H1EstR_Ila[16]} {stcDemod/Brik2_u/H1EstR_Ila[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe19]
set_property port_width 18 [get_debug_ports u_ila_0/probe19]
connect_debug_port u_ila_0/probe19 [get_nets [list {stcDemod/Brik2_u/H1EstI_Ila[0]} {stcDemod/Brik2_u/H1EstI_Ila[1]} {stcDemod/Brik2_u/H1EstI_Ila[2]} {stcDemod/Brik2_u/H1EstI_Ila[3]} {stcDemod/Brik2_u/H1EstI_Ila[4]} {stcDemod/Brik2_u/H1EstI_Ila[5]} {stcDemod/Brik2_u/H1EstI_Ila[6]} {stcDemod/Brik2_u/H1EstI_Ila[7]} {stcDemod/Brik2_u/H1EstI_Ila[8]} {stcDemod/Brik2_u/H1EstI_Ila[9]} {stcDemod/Brik2_u/H1EstI_Ila[10]} {stcDemod/Brik2_u/H1EstI_Ila[11]} {stcDemod/Brik2_u/H1EstI_Ila[12]} {stcDemod/Brik2_u/H1EstI_Ila[13]} {stcDemod/Brik2_u/H1EstI_Ila[14]} {stcDemod/Brik2_u/H1EstI_Ila[15]} {stcDemod/Brik2_u/H1EstI_Ila[16]} {stcDemod/Brik2_u/H1EstI_Ila[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe20]
set_property port_width 18 [get_debug_ports u_ila_0/probe20]
connect_debug_port u_ila_0/probe20 [get_nets [list {stcDemod/Brik2_u/H0EstI_Ila[0]} {stcDemod/Brik2_u/H0EstI_Ila[1]} {stcDemod/Brik2_u/H0EstI_Ila[2]} {stcDemod/Brik2_u/H0EstI_Ila[3]} {stcDemod/Brik2_u/H0EstI_Ila[4]} {stcDemod/Brik2_u/H0EstI_Ila[5]} {stcDemod/Brik2_u/H0EstI_Ila[6]} {stcDemod/Brik2_u/H0EstI_Ila[7]} {stcDemod/Brik2_u/H0EstI_Ila[8]} {stcDemod/Brik2_u/H0EstI_Ila[9]} {stcDemod/Brik2_u/H0EstI_Ila[10]} {stcDemod/Brik2_u/H0EstI_Ila[11]} {stcDemod/Brik2_u/H0EstI_Ila[12]} {stcDemod/Brik2_u/H0EstI_Ila[13]} {stcDemod/Brik2_u/H0EstI_Ila[14]} {stcDemod/Brik2_u/H0EstI_Ila[15]} {stcDemod/Brik2_u/H0EstI_Ila[16]} {stcDemod/Brik2_u/H0EstI_Ila[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe21]
set_property port_width 1 [get_debug_ports u_ila_0/probe21]
connect_debug_port u_ila_0/probe21 [get_nets [list stcDemod/Brik2_u/ChanEstDone]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe22]
set_property port_width 1 [get_debug_ports u_ila_0/probe22]
connect_debug_port u_ila_0/probe22 [get_nets [list stcDemod/ClkOutEn]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe23]
set_property port_width 1 [get_debug_ports u_ila_0/probe23]
connect_debug_port u_ila_0/probe23 [get_nets [list stcDemod/DataOut]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe24]
set_property port_width 1 [get_debug_ports u_ila_0/probe24]
connect_debug_port u_ila_0/probe24 [get_nets [list stcDemod/EstimatesDone]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe25]
set_property port_width 1 [get_debug_ports u_ila_0/probe25]
connect_debug_port u_ila_0/probe25 [get_nets [list stcDemod/PS_u/StartOut]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe26]
set_property port_width 1 [get_debug_ports u_ila_0/probe26]
connect_debug_port u_ila_0/probe26 [get_nets [list stcDemod/Brik2_u/StartTime]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe27]
set_property port_width 1 [get_debug_ports u_ila_0/probe27]
connect_debug_port u_ila_0/probe27 [get_nets [list stcDemod/Brik2_u/TimeEstDone]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe28]
set_property port_width 1 [get_debug_ports u_ila_0/probe28]
connect_debug_port u_ila_0/probe28 [get_nets [list stcDemod/TrellisFull]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe29]
set_property port_width 1 [get_debug_ports u_ila_0/probe29]
connect_debug_port u_ila_0/probe29 [get_nets [list stcDemod/TrellisOutEn]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe30]
set_property port_width 1 [get_debug_ports u_ila_0/probe30]
connect_debug_port u_ila_0/probe30 [get_nets [list stcDemod/ValidData2047]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe31]
set_property port_width 1 [get_debug_ports u_ila_0/probe31]
connect_debug_port u_ila_0/probe31 [get_nets [list stcDemod/ValidIla]]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets clk2x]
