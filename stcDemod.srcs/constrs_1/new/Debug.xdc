
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
connect_debug_port u_ila_0/probe0 [get_nets [list {stcDemod/PD_u/AbsCntr0_Ila[0]} {stcDemod/PD_u/AbsCntr0_Ila[1]} {stcDemod/PD_u/AbsCntr0_Ila[2]} {stcDemod/PD_u/AbsCntr0_Ila[3]} {stcDemod/PD_u/AbsCntr0_Ila[4]} {stcDemod/PD_u/AbsCntr0_Ila[5]} {stcDemod/PD_u/AbsCntr0_Ila[6]} {stcDemod/PD_u/AbsCntr0_Ila[7]} {stcDemod/PD_u/AbsCntr0_Ila[8]} {stcDemod/PD_u/AbsCntr0_Ila[9]} {stcDemod/PD_u/AbsCntr0_Ila[10]} {stcDemod/PD_u/AbsCntr0_Ila[11]} {stcDemod/PD_u/AbsCntr0_Ila[12]} {stcDemod/PD_u/AbsCntr0_Ila[13]} {stcDemod/PD_u/AbsCntr0_Ila[14]} {stcDemod/PD_u/AbsCntr0_Ila[15]} {stcDemod/PD_u/AbsCntr0_Ila[16]} {stcDemod/PD_u/AbsCntr0_Ila[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe1]
set_property port_width 10 [get_debug_ports u_ila_0/probe1]
connect_debug_port u_ila_0/probe1 [get_nets [list {stcDemod/PD_u/PrevIndex[0]} {stcDemod/PD_u/PrevIndex[1]} {stcDemod/PD_u/PrevIndex[2]} {stcDemod/PD_u/PrevIndex[3]} {stcDemod/PD_u/PrevIndex[4]} {stcDemod/PD_u/PrevIndex[5]} {stcDemod/PD_u/PrevIndex[6]} {stcDemod/PD_u/PrevIndex[7]} {stcDemod/PD_u/PrevIndex[8]} {stcDemod/PD_u/PrevIndex[9]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe2]
set_property port_width 18 [get_debug_ports u_ila_0/probe2]
connect_debug_port u_ila_0/probe2 [get_nets [list {stcDemod/PD_u/PilotMag_Ila[0]} {stcDemod/PD_u/PilotMag_Ila[1]} {stcDemod/PD_u/PilotMag_Ila[2]} {stcDemod/PD_u/PilotMag_Ila[3]} {stcDemod/PD_u/PilotMag_Ila[4]} {stcDemod/PD_u/PilotMag_Ila[5]} {stcDemod/PD_u/PilotMag_Ila[6]} {stcDemod/PD_u/PilotMag_Ila[7]} {stcDemod/PD_u/PilotMag_Ila[8]} {stcDemod/PD_u/PilotMag_Ila[9]} {stcDemod/PD_u/PilotMag_Ila[10]} {stcDemod/PD_u/PilotMag_Ila[11]} {stcDemod/PD_u/PilotMag_Ila[12]} {stcDemod/PD_u/PilotMag_Ila[13]} {stcDemod/PD_u/PilotMag_Ila[14]} {stcDemod/PD_u/PilotMag_Ila[15]} {stcDemod/PD_u/PilotMag_Ila[16]} {stcDemod/PD_u/PilotMag_Ila[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe3]
set_property port_width 18 [get_debug_ports u_ila_0/probe3]
connect_debug_port u_ila_0/probe3 [get_nets [list {stcDemod/PD_u/Peak1_Ila[0]} {stcDemod/PD_u/Peak1_Ila[1]} {stcDemod/PD_u/Peak1_Ila[2]} {stcDemod/PD_u/Peak1_Ila[3]} {stcDemod/PD_u/Peak1_Ila[4]} {stcDemod/PD_u/Peak1_Ila[5]} {stcDemod/PD_u/Peak1_Ila[6]} {stcDemod/PD_u/Peak1_Ila[7]} {stcDemod/PD_u/Peak1_Ila[8]} {stcDemod/PD_u/Peak1_Ila[9]} {stcDemod/PD_u/Peak1_Ila[10]} {stcDemod/PD_u/Peak1_Ila[11]} {stcDemod/PD_u/Peak1_Ila[12]} {stcDemod/PD_u/Peak1_Ila[13]} {stcDemod/PD_u/Peak1_Ila[14]} {stcDemod/PD_u/Peak1_Ila[15]} {stcDemod/PD_u/Peak1_Ila[16]} {stcDemod/PD_u/Peak1_Ila[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe4]
set_property port_width 18 [get_debug_ports u_ila_0/probe4]
connect_debug_port u_ila_0/probe4 [get_nets [list {stcDemod/PD_u/AbsCntr1_Ila[0]} {stcDemod/PD_u/AbsCntr1_Ila[1]} {stcDemod/PD_u/AbsCntr1_Ila[2]} {stcDemod/PD_u/AbsCntr1_Ila[3]} {stcDemod/PD_u/AbsCntr1_Ila[4]} {stcDemod/PD_u/AbsCntr1_Ila[5]} {stcDemod/PD_u/AbsCntr1_Ila[6]} {stcDemod/PD_u/AbsCntr1_Ila[7]} {stcDemod/PD_u/AbsCntr1_Ila[8]} {stcDemod/PD_u/AbsCntr1_Ila[9]} {stcDemod/PD_u/AbsCntr1_Ila[10]} {stcDemod/PD_u/AbsCntr1_Ila[11]} {stcDemod/PD_u/AbsCntr1_Ila[12]} {stcDemod/PD_u/AbsCntr1_Ila[13]} {stcDemod/PD_u/AbsCntr1_Ila[14]} {stcDemod/PD_u/AbsCntr1_Ila[15]} {stcDemod/PD_u/AbsCntr1_Ila[16]} {stcDemod/PD_u/AbsCntr1_Ila[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe5]
set_property port_width 18 [get_debug_ports u_ila_0/probe5]
connect_debug_port u_ila_0/probe5 [get_nets [list {stcDemod/PD_u/MagPeak0[0]} {stcDemod/PD_u/MagPeak0[1]} {stcDemod/PD_u/MagPeak0[2]} {stcDemod/PD_u/MagPeak0[3]} {stcDemod/PD_u/MagPeak0[4]} {stcDemod/PD_u/MagPeak0[5]} {stcDemod/PD_u/MagPeak0[6]} {stcDemod/PD_u/MagPeak0[7]} {stcDemod/PD_u/MagPeak0[8]} {stcDemod/PD_u/MagPeak0[9]} {stcDemod/PD_u/MagPeak0[10]} {stcDemod/PD_u/MagPeak0[11]} {stcDemod/PD_u/MagPeak0[12]} {stcDemod/PD_u/MagPeak0[13]} {stcDemod/PD_u/MagPeak0[14]} {stcDemod/PD_u/MagPeak0[15]} {stcDemod/PD_u/MagPeak0[16]} {stcDemod/PD_u/MagPeak0[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe6]
set_property port_width 18 [get_debug_ports u_ila_0/probe6]
connect_debug_port u_ila_0/probe6 [get_nets [list {stcDemod/PD_u/MagPeak1[0]} {stcDemod/PD_u/MagPeak1[1]} {stcDemod/PD_u/MagPeak1[2]} {stcDemod/PD_u/MagPeak1[3]} {stcDemod/PD_u/MagPeak1[4]} {stcDemod/PD_u/MagPeak1[5]} {stcDemod/PD_u/MagPeak1[6]} {stcDemod/PD_u/MagPeak1[7]} {stcDemod/PD_u/MagPeak1[8]} {stcDemod/PD_u/MagPeak1[9]} {stcDemod/PD_u/MagPeak1[10]} {stcDemod/PD_u/MagPeak1[11]} {stcDemod/PD_u/MagPeak1[12]} {stcDemod/PD_u/MagPeak1[13]} {stcDemod/PD_u/MagPeak1[14]} {stcDemod/PD_u/MagPeak1[15]} {stcDemod/PD_u/MagPeak1[16]} {stcDemod/PD_u/MagPeak1[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe7]
set_property port_width 10 [get_debug_ports u_ila_0/probe7]
connect_debug_port u_ila_0/probe7 [get_nets [list {stcDemod/PD_u/MaxIndex[0]} {stcDemod/PD_u/MaxIndex[1]} {stcDemod/PD_u/MaxIndex[2]} {stcDemod/PD_u/MaxIndex[3]} {stcDemod/PD_u/MaxIndex[4]} {stcDemod/PD_u/MaxIndex[5]} {stcDemod/PD_u/MaxIndex[6]} {stcDemod/PD_u/MaxIndex[7]} {stcDemod/PD_u/MaxIndex[8]} {stcDemod/PD_u/MaxIndex[9]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe8]
set_property port_width 10 [get_debug_ports u_ila_0/probe8]
connect_debug_port u_ila_0/probe8 [get_nets [list {stcDemod/PD_u/PendIndex[0]} {stcDemod/PD_u/PendIndex[1]} {stcDemod/PD_u/PendIndex[2]} {stcDemod/PD_u/PendIndex[3]} {stcDemod/PD_u/PendIndex[4]} {stcDemod/PD_u/PendIndex[5]} {stcDemod/PD_u/PendIndex[6]} {stcDemod/PD_u/PendIndex[7]} {stcDemod/PD_u/PendIndex[8]} {stcDemod/PD_u/PendIndex[9]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe9]
set_property port_width 18 [get_debug_ports u_ila_0/probe9]
connect_debug_port u_ila_0/probe9 [get_nets [list {stcDemod/PD_u/Peak2_Ila[0]} {stcDemod/PD_u/Peak2_Ila[1]} {stcDemod/PD_u/Peak2_Ila[2]} {stcDemod/PD_u/Peak2_Ila[3]} {stcDemod/PD_u/Peak2_Ila[4]} {stcDemod/PD_u/Peak2_Ila[5]} {stcDemod/PD_u/Peak2_Ila[6]} {stcDemod/PD_u/Peak2_Ila[7]} {stcDemod/PD_u/Peak2_Ila[8]} {stcDemod/PD_u/Peak2_Ila[9]} {stcDemod/PD_u/Peak2_Ila[10]} {stcDemod/PD_u/Peak2_Ila[11]} {stcDemod/PD_u/Peak2_Ila[12]} {stcDemod/PD_u/Peak2_Ila[13]} {stcDemod/PD_u/Peak2_Ila[14]} {stcDemod/PD_u/Peak2_Ila[15]} {stcDemod/PD_u/Peak2_Ila[16]} {stcDemod/PD_u/Peak2_Ila[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe10]
set_property port_width 18 [get_debug_ports u_ila_0/probe10]
connect_debug_port u_ila_0/probe10 [get_nets [list {stcDemod/PD_u/PhsPeak0[0]} {stcDemod/PD_u/PhsPeak0[1]} {stcDemod/PD_u/PhsPeak0[2]} {stcDemod/PD_u/PhsPeak0[3]} {stcDemod/PD_u/PhsPeak0[4]} {stcDemod/PD_u/PhsPeak0[5]} {stcDemod/PD_u/PhsPeak0[6]} {stcDemod/PD_u/PhsPeak0[7]} {stcDemod/PD_u/PhsPeak0[8]} {stcDemod/PD_u/PhsPeak0[9]} {stcDemod/PD_u/PhsPeak0[10]} {stcDemod/PD_u/PhsPeak0[11]} {stcDemod/PD_u/PhsPeak0[12]} {stcDemod/PD_u/PhsPeak0[13]} {stcDemod/PD_u/PhsPeak0[14]} {stcDemod/PD_u/PhsPeak0[15]} {stcDemod/PD_u/PhsPeak0[16]} {stcDemod/PD_u/PhsPeak0[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe11]
set_property port_width 18 [get_debug_ports u_ila_0/probe11]
connect_debug_port u_ila_0/probe11 [get_nets [list {stcDemod/PD_u/PhsPeak1[0]} {stcDemod/PD_u/PhsPeak1[1]} {stcDemod/PD_u/PhsPeak1[2]} {stcDemod/PD_u/PhsPeak1[3]} {stcDemod/PD_u/PhsPeak1[4]} {stcDemod/PD_u/PhsPeak1[5]} {stcDemod/PD_u/PhsPeak1[6]} {stcDemod/PD_u/PhsPeak1[7]} {stcDemod/PD_u/PhsPeak1[8]} {stcDemod/PD_u/PhsPeak1[9]} {stcDemod/PD_u/PhsPeak1[10]} {stcDemod/PD_u/PhsPeak1[11]} {stcDemod/PD_u/PhsPeak1[12]} {stcDemod/PD_u/PhsPeak1[13]} {stcDemod/PD_u/PhsPeak1[14]} {stcDemod/PD_u/PhsPeak1[15]} {stcDemod/PD_u/PhsPeak1[16]} {stcDemod/PD_u/PhsPeak1[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe12]
set_property port_width 12 [get_debug_ports u_ila_0/probe12]
connect_debug_port u_ila_0/probe12 [get_nets [list {stcDemod/Ber[0]} {stcDemod/Ber[1]} {stcDemod/Ber[2]} {stcDemod/Ber[3]} {stcDemod/Ber[4]} {stcDemod/Ber[5]} {stcDemod/Ber[6]} {stcDemod/Ber[7]} {stcDemod/Ber[8]} {stcDemod/Ber[9]} {stcDemod/Ber[10]} {stcDemod/Ber[11]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe13]
set_property port_width 12 [get_debug_ports u_ila_0/probe13]
connect_debug_port u_ila_0/probe13 [get_nets [list {stcDemod/Bert[0]} {stcDemod/Bert[1]} {stcDemod/Bert[2]} {stcDemod/Bert[3]} {stcDemod/Bert[4]} {stcDemod/Bert[5]} {stcDemod/Bert[6]} {stcDemod/Bert[7]} {stcDemod/Bert[8]} {stcDemod/Bert[9]} {stcDemod/Bert[10]} {stcDemod/Bert[11]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe14]
set_property port_width 18 [get_debug_ports u_ila_0/probe14]
connect_debug_port u_ila_0/probe14 [get_nets [list {stcDemod/Ch0MuSlv[0]} {stcDemod/Ch0MuSlv[1]} {stcDemod/Ch0MuSlv[2]} {stcDemod/Ch0MuSlv[3]} {stcDemod/Ch0MuSlv[4]} {stcDemod/Ch0MuSlv[5]} {stcDemod/Ch0MuSlv[6]} {stcDemod/Ch0MuSlv[7]} {stcDemod/Ch0MuSlv[8]} {stcDemod/Ch0MuSlv[9]} {stcDemod/Ch0MuSlv[10]} {stcDemod/Ch0MuSlv[11]} {stcDemod/Ch0MuSlv[12]} {stcDemod/Ch0MuSlv[13]} {stcDemod/Ch0MuSlv[14]} {stcDemod/Ch0MuSlv[15]} {stcDemod/Ch0MuSlv[16]} {stcDemod/Ch0MuSlv[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe15]
set_property port_width 18 [get_debug_ports u_ila_0/probe15]
connect_debug_port u_ila_0/probe15 [get_nets [list {stcDemod/Ch1MuSlv[0]} {stcDemod/Ch1MuSlv[1]} {stcDemod/Ch1MuSlv[2]} {stcDemod/Ch1MuSlv[3]} {stcDemod/Ch1MuSlv[4]} {stcDemod/Ch1MuSlv[5]} {stcDemod/Ch1MuSlv[6]} {stcDemod/Ch1MuSlv[7]} {stcDemod/Ch1MuSlv[8]} {stcDemod/Ch1MuSlv[9]} {stcDemod/Ch1MuSlv[10]} {stcDemod/Ch1MuSlv[11]} {stcDemod/Ch1MuSlv[12]} {stcDemod/Ch1MuSlv[13]} {stcDemod/Ch1MuSlv[14]} {stcDemod/Ch1MuSlv[15]} {stcDemod/Ch1MuSlv[16]} {stcDemod/Ch1MuSlv[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe16]
set_property port_width 9 [get_debug_ports u_ila_0/probe16]
connect_debug_port u_ila_0/probe16 [get_nets [list {stcDemod/CorrPntr8to0[0]} {stcDemod/CorrPntr8to0[1]} {stcDemod/CorrPntr8to0[2]} {stcDemod/CorrPntr8to0[3]} {stcDemod/CorrPntr8to0[4]} {stcDemod/CorrPntr8to0[5]} {stcDemod/CorrPntr8to0[6]} {stcDemod/CorrPntr8to0[7]} {stcDemod/CorrPntr8to0[8]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe17]
set_property port_width 13 [get_debug_ports u_ila_0/probe17]
connect_debug_port u_ila_0/probe17 [get_nets [list {stcDemod/H0Mag[0]} {stcDemod/H0Mag[1]} {stcDemod/H0Mag[2]} {stcDemod/H0Mag[3]} {stcDemod/H0Mag[4]} {stcDemod/H0Mag[5]} {stcDemod/H0Mag[6]} {stcDemod/H0Mag[7]} {stcDemod/H0Mag[8]} {stcDemod/H0Mag[9]} {stcDemod/H0Mag[10]} {stcDemod/H0Mag[11]} {stcDemod/H0Mag[12]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe18]
set_property port_width 12 [get_debug_ports u_ila_0/probe18]
connect_debug_port u_ila_0/probe18 [get_nets [list {stcDemod/H0Phase[0]} {stcDemod/H0Phase[1]} {stcDemod/H0Phase[2]} {stcDemod/H0Phase[3]} {stcDemod/H0Phase[4]} {stcDemod/H0Phase[5]} {stcDemod/H0Phase[6]} {stcDemod/H0Phase[7]} {stcDemod/H0Phase[8]} {stcDemod/H0Phase[9]} {stcDemod/H0Phase[10]} {stcDemod/H0Phase[11]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe19]
set_property port_width 13 [get_debug_ports u_ila_0/probe19]
connect_debug_port u_ila_0/probe19 [get_nets [list {stcDemod/H1Mag[0]} {stcDemod/H1Mag[1]} {stcDemod/H1Mag[2]} {stcDemod/H1Mag[3]} {stcDemod/H1Mag[4]} {stcDemod/H1Mag[5]} {stcDemod/H1Mag[6]} {stcDemod/H1Mag[7]} {stcDemod/H1Mag[8]} {stcDemod/H1Mag[9]} {stcDemod/H1Mag[10]} {stcDemod/H1Mag[11]} {stcDemod/H1Mag[12]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe20]
set_property port_width 12 [get_debug_ports u_ila_0/probe20]
connect_debug_port u_ila_0/probe20 [get_nets [list {stcDemod/H1Phase[0]} {stcDemod/H1Phase[1]} {stcDemod/H1Phase[2]} {stcDemod/H1Phase[3]} {stcDemod/H1Phase[4]} {stcDemod/H1Phase[5]} {stcDemod/H1Phase[6]} {stcDemod/H1Phase[7]} {stcDemod/H1Phase[8]} {stcDemod/H1Phase[9]} {stcDemod/H1Phase[10]} {stcDemod/H1Phase[11]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe21]
set_property port_width 6 [get_debug_ports u_ila_0/probe21]
connect_debug_port u_ila_0/probe21 [get_nets [list {stcDemod/deltaTauEstSlv[0]} {stcDemod/deltaTauEstSlv[1]} {stcDemod/deltaTauEstSlv[2]} {stcDemod/deltaTauEstSlv[3]} {stcDemod/deltaTauEstSlv[4]} {stcDemod/deltaTauEstSlv[5]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe22]
set_property port_width 4 [get_debug_ports u_ila_0/probe22]
connect_debug_port u_ila_0/probe22 [get_nets [list {stcDemod/m_ndx0Slv[0]} {stcDemod/m_ndx0Slv[1]} {stcDemod/m_ndx0Slv[2]} {stcDemod/m_ndx0Slv[3]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe23]
set_property port_width 4 [get_debug_ports u_ila_0/probe23]
connect_debug_port u_ila_0/probe23 [get_nets [list {stcDemod/m_ndx1Slv[0]} {stcDemod/m_ndx1Slv[1]} {stcDemod/m_ndx1Slv[2]} {stcDemod/m_ndx1Slv[3]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe24]
set_property port_width 1 [get_debug_ports u_ila_0/probe24]
connect_debug_port u_ila_0/probe24 [get_nets [list {stcDemod/PD_u/AbsPeak0_reg[-_n_0_1]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe25]
set_property port_width 1 [get_debug_ports u_ila_0/probe25]
connect_debug_port u_ila_0/probe25 [get_nets [list {stcDemod/PD_u/AbsPeak0_reg[-_n_0_2]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe26]
set_property port_width 1 [get_debug_ports u_ila_0/probe26]
connect_debug_port u_ila_0/probe26 [get_nets [list {stcDemod/PD_u/AbsPeak0_reg[-_n_0_3]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe27]
set_property port_width 1 [get_debug_ports u_ila_0/probe27]
connect_debug_port u_ila_0/probe27 [get_nets [list {stcDemod/PD_u/AbsPeak0_reg[-_n_0_4]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe28]
set_property port_width 1 [get_debug_ports u_ila_0/probe28]
connect_debug_port u_ila_0/probe28 [get_nets [list {stcDemod/PD_u/AbsPeak0_reg[-_n_0_5]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe29]
set_property port_width 1 [get_debug_ports u_ila_0/probe29]
connect_debug_port u_ila_0/probe29 [get_nets [list {stcDemod/PD_u/AbsPeak0_reg[-_n_0_6]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe30]
set_property port_width 1 [get_debug_ports u_ila_0/probe30]
connect_debug_port u_ila_0/probe30 [get_nets [list {stcDemod/PD_u/AbsPeak0_reg[-_n_0_7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe31]
set_property port_width 1 [get_debug_ports u_ila_0/probe31]
connect_debug_port u_ila_0/probe31 [get_nets [list {stcDemod/PD_u/AbsPeak0_reg[-_n_0_8]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe32]
set_property port_width 1 [get_debug_ports u_ila_0/probe32]
connect_debug_port u_ila_0/probe32 [get_nets [list {stcDemod/PD_u/AbsPeak0_reg[-_n_0_9]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe33]
set_property port_width 1 [get_debug_ports u_ila_0/probe33]
connect_debug_port u_ila_0/probe33 [get_nets [list {stcDemod/PD_u/AbsPeak0_reg[-_n_0_10]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe34]
set_property port_width 1 [get_debug_ports u_ila_0/probe34]
connect_debug_port u_ila_0/probe34 [get_nets [list {stcDemod/PD_u/AbsPeak0_reg[-_n_0_11]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe35]
set_property port_width 1 [get_debug_ports u_ila_0/probe35]
connect_debug_port u_ila_0/probe35 [get_nets [list {stcDemod/PD_u/AbsPeak0_reg_n_0_[0]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe36]
set_property port_width 1 [get_debug_ports u_ila_0/probe36]
connect_debug_port u_ila_0/probe36 [get_nets [list {stcDemod/PD_u/AbsPeak0_reg_n_0_[1]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe37]
set_property port_width 1 [get_debug_ports u_ila_0/probe37]
connect_debug_port u_ila_0/probe37 [get_nets [list {stcDemod/PD_u/AbsPeak0_reg_n_0_[2]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe38]
set_property port_width 1 [get_debug_ports u_ila_0/probe38]
connect_debug_port u_ila_0/probe38 [get_nets [list {stcDemod/PD_u/AbsPeak0_reg_n_0_[3]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe39]
set_property port_width 1 [get_debug_ports u_ila_0/probe39]
connect_debug_port u_ila_0/probe39 [get_nets [list {stcDemod/PD_u/AbsPeak0_reg_n_0_[4]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe40]
set_property port_width 1 [get_debug_ports u_ila_0/probe40]
connect_debug_port u_ila_0/probe40 [get_nets [list {stcDemod/PD_u/AbsPeak0_reg_n_0_[5]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe41]
set_property port_width 1 [get_debug_ports u_ila_0/probe41]
connect_debug_port u_ila_0/probe41 [get_nets [list {stcDemod/PD_u/AbsPeak0_reg_n_0_[6]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe42]
set_property port_width 1 [get_debug_ports u_ila_0/probe42]
connect_debug_port u_ila_0/probe42 [get_nets [list stcDemod/ClkOutEn]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe43]
set_property port_width 1 [get_debug_ports u_ila_0/probe43]
connect_debug_port u_ila_0/probe43 [get_nets [list stcDemod/DataOut]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe44]
set_property port_width 1 [get_debug_ports u_ila_0/probe44]
connect_debug_port u_ila_0/probe44 [get_nets [list stcDemod/PD_u/H1Cntr_x_Fft/OverFlow]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe45]
set_property port_width 1 [get_debug_ports u_ila_0/probe45]
connect_debug_port u_ila_0/probe45 [get_nets [list stcDemod/PD_u/H0Cntr_x_Fft/OverFlow]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe46]
set_property port_width 1 [get_debug_ports u_ila_0/probe46]
connect_debug_port u_ila_0/probe46 [get_nets [list stcDemod/PhaseDiffEn]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe47]
set_property port_width 1 [get_debug_ports u_ila_0/probe47]
connect_debug_port u_ila_0/probe47 [get_nets [list stcDemod/PD_u/PilotFound]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe48]
set_property port_width 1 [get_debug_ports u_ila_0/probe48]
connect_debug_port u_ila_0/probe48 [get_nets [list stcDemod/PS_u/PilotPulseIn]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe49]
set_property port_width 1 [get_debug_ports u_ila_0/probe49]
connect_debug_port u_ila_0/probe49 [get_nets [list stcDemod/PS_u/PilotValid]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe50]
set_property port_width 1 [get_debug_ports u_ila_0/probe50]
connect_debug_port u_ila_0/probe50 [get_nets [list stcDemod/PS_u/StartOut]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe51]
set_property port_width 1 [get_debug_ports u_ila_0/probe51]
connect_debug_port u_ila_0/probe51 [get_nets [list stcDemod/ValidData2047]]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets clk2x]
