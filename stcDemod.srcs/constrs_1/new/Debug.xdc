

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
connect_debug_port u_ila_0/clk [get_nets [list systemClock/inst/clk93]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe0]
set_property port_width 4 [get_debug_ports u_ila_0/probe0]
connect_debug_port u_ila_0/probe0 [get_nets [list {stcDemod/TrellisBits[0]} {stcDemod/TrellisBits[1]} {stcDemod/TrellisBits[2]} {stcDemod/TrellisBits[3]}]]
create_debug_core u_ila_1 ila
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_1]
set_property ALL_PROBE_SAME_MU_CNT 4 [get_debug_cores u_ila_1]
set_property C_ADV_TRIGGER true [get_debug_cores u_ila_1]
set_property C_DATA_DEPTH 2048 [get_debug_cores u_ila_1]
set_property C_EN_STRG_QUAL true [get_debug_cores u_ila_1]
set_property C_INPUT_PIPE_STAGES 2 [get_debug_cores u_ila_1]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_1]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_1]
set_property port_width 1 [get_debug_ports u_ila_1/clk]
connect_debug_port u_ila_1/clk [get_nets [list systemClock/inst/clk186]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe0]
set_property port_width 18 [get_debug_ports u_ila_1/probe0]
connect_debug_port u_ila_1/probe0 [get_nets [list {stcDemod/PhaseDiff2xGainSlv[0]} {stcDemod/PhaseDiff2xGainSlv[1]} {stcDemod/PhaseDiff2xGainSlv[2]} {stcDemod/PhaseDiff2xGainSlv[3]} {stcDemod/PhaseDiff2xGainSlv[4]} {stcDemod/PhaseDiff2xGainSlv[5]} {stcDemod/PhaseDiff2xGainSlv[6]} {stcDemod/PhaseDiff2xGainSlv[7]} {stcDemod/PhaseDiff2xGainSlv[8]} {stcDemod/PhaseDiff2xGainSlv[9]} {stcDemod/PhaseDiff2xGainSlv[10]} {stcDemod/PhaseDiff2xGainSlv[11]} {stcDemod/PhaseDiff2xGainSlv[12]} {stcDemod/PhaseDiff2xGainSlv[13]} {stcDemod/PhaseDiff2xGainSlv[14]} {stcDemod/PhaseDiff2xGainSlv[15]} {stcDemod/PhaseDiff2xGainSlv[16]} {stcDemod/PhaseDiff2xGainSlv[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe1]
set_property port_width 16 [get_debug_ports u_ila_0/probe1]
connect_debug_port u_ila_0/probe1 [get_nets [list {stcDemod/PD_u/CorrPntr[0]} {stcDemod/PD_u/CorrPntr[1]} {stcDemod/PD_u/CorrPntr[2]} {stcDemod/PD_u/CorrPntr[3]} {stcDemod/PD_u/CorrPntr[4]} {stcDemod/PD_u/CorrPntr[5]} {stcDemod/PD_u/CorrPntr[6]} {stcDemod/PD_u/CorrPntr[7]} {stcDemod/PD_u/CorrPntr[8]} {stcDemod/PD_u/CorrPntr[9]} {stcDemod/PD_u/CorrPntr[10]} {stcDemod/PD_u/CorrPntr[11]} {stcDemod/PD_u/CorrPntr[12]} {stcDemod/PD_u/CorrPntr[13]} {stcDemod/PD_u/CorrPntr[14]} {stcDemod/PD_u/CorrPntr[15]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe2]
set_property port_width 18 [get_debug_ports u_ila_0/probe2]
connect_debug_port u_ila_0/probe2 [get_nets [list {stcDemod/PD_u/Peak1_Ila[0]} {stcDemod/PD_u/Peak1_Ila[1]} {stcDemod/PD_u/Peak1_Ila[2]} {stcDemod/PD_u/Peak1_Ila[3]} {stcDemod/PD_u/Peak1_Ila[4]} {stcDemod/PD_u/Peak1_Ila[5]} {stcDemod/PD_u/Peak1_Ila[6]} {stcDemod/PD_u/Peak1_Ila[7]} {stcDemod/PD_u/Peak1_Ila[8]} {stcDemod/PD_u/Peak1_Ila[9]} {stcDemod/PD_u/Peak1_Ila[10]} {stcDemod/PD_u/Peak1_Ila[11]} {stcDemod/PD_u/Peak1_Ila[12]} {stcDemod/PD_u/Peak1_Ila[13]} {stcDemod/PD_u/Peak1_Ila[14]} {stcDemod/PD_u/Peak1_Ila[15]} {stcDemod/PD_u/Peak1_Ila[16]} {stcDemod/PD_u/Peak1_Ila[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe3]
set_property port_width 18 [get_debug_ports u_ila_0/probe3]
connect_debug_port u_ila_0/probe3 [get_nets [list {stcDemod/PD_u/PilotMag_Ila[0]} {stcDemod/PD_u/PilotMag_Ila[1]} {stcDemod/PD_u/PilotMag_Ila[2]} {stcDemod/PD_u/PilotMag_Ila[3]} {stcDemod/PD_u/PilotMag_Ila[4]} {stcDemod/PD_u/PilotMag_Ila[5]} {stcDemod/PD_u/PilotMag_Ila[6]} {stcDemod/PD_u/PilotMag_Ila[7]} {stcDemod/PD_u/PilotMag_Ila[8]} {stcDemod/PD_u/PilotMag_Ila[9]} {stcDemod/PD_u/PilotMag_Ila[10]} {stcDemod/PD_u/PilotMag_Ila[11]} {stcDemod/PD_u/PilotMag_Ila[12]} {stcDemod/PD_u/PilotMag_Ila[13]} {stcDemod/PD_u/PilotMag_Ila[14]} {stcDemod/PD_u/PilotMag_Ila[15]} {stcDemod/PD_u/PilotMag_Ila[16]} {stcDemod/PD_u/PilotMag_Ila[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe4]
set_property port_width 18 [get_debug_ports u_ila_0/probe4]
connect_debug_port u_ila_0/probe4 [get_nets [list {stcDemod/PD_u/Peak2_Ila[0]} {stcDemod/PD_u/Peak2_Ila[1]} {stcDemod/PD_u/Peak2_Ila[2]} {stcDemod/PD_u/Peak2_Ila[3]} {stcDemod/PD_u/Peak2_Ila[4]} {stcDemod/PD_u/Peak2_Ila[5]} {stcDemod/PD_u/Peak2_Ila[6]} {stcDemod/PD_u/Peak2_Ila[7]} {stcDemod/PD_u/Peak2_Ila[8]} {stcDemod/PD_u/Peak2_Ila[9]} {stcDemod/PD_u/Peak2_Ila[10]} {stcDemod/PD_u/Peak2_Ila[11]} {stcDemod/PD_u/Peak2_Ila[12]} {stcDemod/PD_u/Peak2_Ila[13]} {stcDemod/PD_u/Peak2_Ila[14]} {stcDemod/PD_u/Peak2_Ila[15]} {stcDemod/PD_u/Peak2_Ila[16]} {stcDemod/PD_u/Peak2_Ila[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe5]
set_property port_width 14 [get_debug_ports u_ila_0/probe5]
connect_debug_port u_ila_0/probe5 [get_nets [list {stcDemod/PS_u/FrmSmplCount[0]} {stcDemod/PS_u/FrmSmplCount[1]} {stcDemod/PS_u/FrmSmplCount[2]} {stcDemod/PS_u/FrmSmplCount[3]} {stcDemod/PS_u/FrmSmplCount[4]} {stcDemod/PS_u/FrmSmplCount[5]} {stcDemod/PS_u/FrmSmplCount[6]} {stcDemod/PS_u/FrmSmplCount[7]} {stcDemod/PS_u/FrmSmplCount[8]} {stcDemod/PS_u/FrmSmplCount[9]} {stcDemod/PS_u/FrmSmplCount[10]} {stcDemod/PS_u/FrmSmplCount[11]} {stcDemod/PS_u/FrmSmplCount[12]} {stcDemod/PS_u/FrmSmplCount[13]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe6]
set_property port_width 18 [get_debug_ports u_ila_0/probe6]
connect_debug_port u_ila_0/probe6 [get_nets [list {stcDemod/PS_u/PhaseDiff[-17]} {stcDemod/PS_u/PhaseDiff[-16]} {stcDemod/PS_u/PhaseDiff[-15]} {stcDemod/PS_u/PhaseDiff[-14]} {stcDemod/PS_u/PhaseDiff[-13]} {stcDemod/PS_u/PhaseDiff[-12]} {stcDemod/PS_u/PhaseDiff[-11]} {stcDemod/PS_u/PhaseDiff[-10]} {stcDemod/PS_u/PhaseDiff[-9]} {stcDemod/PS_u/PhaseDiff[-8]} {stcDemod/PS_u/PhaseDiff[-7]} {stcDemod/PS_u/PhaseDiff[-6]} {stcDemod/PS_u/PhaseDiff[-5]} {stcDemod/PS_u/PhaseDiff[-4]} {stcDemod/PS_u/PhaseDiff[-3]} {stcDemod/PS_u/PhaseDiff[-2]} {stcDemod/PS_u/PhaseDiff[-1]} {stcDemod/PS_u/PhaseDiff[0]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe7]
set_property port_width 1 [get_debug_ports u_ila_0/probe7]
connect_debug_port u_ila_0/probe7 [get_nets [list stcDemod/DataOut]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe8]
set_property port_width 1 [get_debug_ports u_ila_0/probe8]
connect_debug_port u_ila_0/probe8 [get_nets [list stcDemod/lastSampleReset]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe9]
set_property port_width 1 [get_debug_ports u_ila_0/probe9]
connect_debug_port u_ila_0/probe9 [get_nets [list stcDemod/PhaseDiffEn]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe10]
set_property port_width 1 [get_debug_ports u_ila_0/probe10]
connect_debug_port u_ila_0/probe10 [get_nets [list stcDemod/PD_u/PilotFound]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe11]
set_property port_width 1 [get_debug_ports u_ila_0/probe11]
connect_debug_port u_ila_0/probe11 [get_nets [list stcDemod/PS_u/StartOut]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe12]
set_property port_width 1 [get_debug_ports u_ila_0/probe12]
connect_debug_port u_ila_0/probe12 [get_nets [list stcDemod/TrellisFull]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe1]
set_property port_width 18 [get_debug_ports u_ila_1/probe1]
connect_debug_port u_ila_1/probe1 [get_nets [list {stcDemod/PhaseDiffSlv[0]} {stcDemod/PhaseDiffSlv[1]} {stcDemod/PhaseDiffSlv[2]} {stcDemod/PhaseDiffSlv[3]} {stcDemod/PhaseDiffSlv[4]} {stcDemod/PhaseDiffSlv[5]} {stcDemod/PhaseDiffSlv[6]} {stcDemod/PhaseDiffSlv[7]} {stcDemod/PhaseDiffSlv[8]} {stcDemod/PhaseDiffSlv[9]} {stcDemod/PhaseDiffSlv[10]} {stcDemod/PhaseDiffSlv[11]} {stcDemod/PhaseDiffSlv[12]} {stcDemod/PhaseDiffSlv[13]} {stcDemod/PhaseDiffSlv[14]} {stcDemod/PhaseDiffSlv[15]} {stcDemod/PhaseDiffSlv[16]} {stcDemod/PhaseDiffSlv[17]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe2]
set_property port_width 18 [get_debug_ports u_ila_1/probe2]
connect_debug_port u_ila_1/probe2 [get_nets [list {stcDemod/InRBrik2Ila[0]} {stcDemod/InRBrik2Ila[1]} {stcDemod/InRBrik2Ila[2]} {stcDemod/InRBrik2Ila[3]} {stcDemod/InRBrik2Ila[4]} {stcDemod/InRBrik2Ila[5]} {stcDemod/InRBrik2Ila[6]} {stcDemod/InRBrik2Ila[7]} {stcDemod/InRBrik2Ila[8]} {stcDemod/InRBrik2Ila[9]} {stcDemod/InRBrik2Ila[10]} {stcDemod/InRBrik2Ila[11]} {stcDemod/InRBrik2Ila[12]} {stcDemod/InRBrik2Ila[13]} {stcDemod/InRBrik2Ila[14]} {stcDemod/InRBrik2Ila[15]} {stcDemod/InRBrik2Ila[16]} {stcDemod/InRBrik2Ila[17]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe3]
set_property port_width 8 [get_debug_ports u_ila_1/probe3]
connect_debug_port u_ila_1/probe3 [get_nets [list {stcDemod/Ber[0]} {stcDemod/Ber[1]} {stcDemod/Ber[2]} {stcDemod/Ber[3]} {stcDemod/Ber[4]} {stcDemod/Ber[5]} {stcDemod/Ber[6]} {stcDemod/Ber[7]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe4]
set_property port_width 4 [get_debug_ports u_ila_1/probe4]
connect_debug_port u_ila_1/probe4 [get_nets [list {stcDemod/m_ndx0Slv[0]} {stcDemod/m_ndx0Slv[1]} {stcDemod/m_ndx0Slv[2]} {stcDemod/m_ndx0Slv[3]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe5]
set_property port_width 18 [get_debug_ports u_ila_1/probe5]
connect_debug_port u_ila_1/probe5 [get_nets [list {stcDemod/PhaseDiff1xGainSlv[0]} {stcDemod/PhaseDiff1xGainSlv[1]} {stcDemod/PhaseDiff1xGainSlv[2]} {stcDemod/PhaseDiff1xGainSlv[3]} {stcDemod/PhaseDiff1xGainSlv[4]} {stcDemod/PhaseDiff1xGainSlv[5]} {stcDemod/PhaseDiff1xGainSlv[6]} {stcDemod/PhaseDiff1xGainSlv[7]} {stcDemod/PhaseDiff1xGainSlv[8]} {stcDemod/PhaseDiff1xGainSlv[9]} {stcDemod/PhaseDiff1xGainSlv[10]} {stcDemod/PhaseDiff1xGainSlv[11]} {stcDemod/PhaseDiff1xGainSlv[12]} {stcDemod/PhaseDiff1xGainSlv[13]} {stcDemod/PhaseDiff1xGainSlv[14]} {stcDemod/PhaseDiff1xGainSlv[15]} {stcDemod/PhaseDiff1xGainSlv[16]} {stcDemod/PhaseDiff1xGainSlv[17]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe6]
set_property port_width 4 [get_debug_ports u_ila_1/probe6]
connect_debug_port u_ila_1/probe6 [get_nets [list {stcDemod/m_ndx1Slv[0]} {stcDemod/m_ndx1Slv[1]} {stcDemod/m_ndx1Slv[2]} {stcDemod/m_ndx1Slv[3]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe7]
set_property port_width 18 [get_debug_ports u_ila_1/probe7]
connect_debug_port u_ila_1/probe7 [get_nets [list {stcDemod/InIBrik2Ila[0]} {stcDemod/InIBrik2Ila[1]} {stcDemod/InIBrik2Ila[2]} {stcDemod/InIBrik2Ila[3]} {stcDemod/InIBrik2Ila[4]} {stcDemod/InIBrik2Ila[5]} {stcDemod/InIBrik2Ila[6]} {stcDemod/InIBrik2Ila[7]} {stcDemod/InIBrik2Ila[8]} {stcDemod/InIBrik2Ila[9]} {stcDemod/InIBrik2Ila[10]} {stcDemod/InIBrik2Ila[11]} {stcDemod/InIBrik2Ila[12]} {stcDemod/InIBrik2Ila[13]} {stcDemod/InIBrik2Ila[14]} {stcDemod/InIBrik2Ila[15]} {stcDemod/InIBrik2Ila[16]} {stcDemod/InIBrik2Ila[17]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe8]
set_property port_width 12 [get_debug_ports u_ila_1/probe8]
connect_debug_port u_ila_1/probe8 [get_nets [list {stcDemod/Trellis_u/sampleOut_reg[0]} {stcDemod/Trellis_u/sampleOut_reg[1]} {stcDemod/Trellis_u/sampleOut_reg[2]} {stcDemod/Trellis_u/sampleOut_reg[3]} {stcDemod/Trellis_u/sampleOut_reg[4]} {stcDemod/Trellis_u/sampleOut_reg[5]} {stcDemod/Trellis_u/sampleOut_reg[6]} {stcDemod/Trellis_u/sampleOut_reg[7]} {stcDemod/Trellis_u/sampleOut_reg[8]} {stcDemod/Trellis_u/sampleOut_reg[9]} {stcDemod/Trellis_u/sampleOut_reg[10]} {stcDemod/Trellis_u/sampleOut_reg[11]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe9]
set_property port_width 18 [get_debug_ports u_ila_1/probe9]
connect_debug_port u_ila_1/probe9 [get_nets [list {stcDemod/Brik2_u/H1EstI_Ila[0]} {stcDemod/Brik2_u/H1EstI_Ila[1]} {stcDemod/Brik2_u/H1EstI_Ila[2]} {stcDemod/Brik2_u/H1EstI_Ila[3]} {stcDemod/Brik2_u/H1EstI_Ila[4]} {stcDemod/Brik2_u/H1EstI_Ila[5]} {stcDemod/Brik2_u/H1EstI_Ila[6]} {stcDemod/Brik2_u/H1EstI_Ila[7]} {stcDemod/Brik2_u/H1EstI_Ila[8]} {stcDemod/Brik2_u/H1EstI_Ila[9]} {stcDemod/Brik2_u/H1EstI_Ila[10]} {stcDemod/Brik2_u/H1EstI_Ila[11]} {stcDemod/Brik2_u/H1EstI_Ila[12]} {stcDemod/Brik2_u/H1EstI_Ila[13]} {stcDemod/Brik2_u/H1EstI_Ila[14]} {stcDemod/Brik2_u/H1EstI_Ila[15]} {stcDemod/Brik2_u/H1EstI_Ila[16]} {stcDemod/Brik2_u/H1EstI_Ila[17]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe10]
set_property port_width 18 [get_debug_ports u_ila_1/probe10]
connect_debug_port u_ila_1/probe10 [get_nets [list {stcDemod/Brik2_u/H1EstR_Ila[0]} {stcDemod/Brik2_u/H1EstR_Ila[1]} {stcDemod/Brik2_u/H1EstR_Ila[2]} {stcDemod/Brik2_u/H1EstR_Ila[3]} {stcDemod/Brik2_u/H1EstR_Ila[4]} {stcDemod/Brik2_u/H1EstR_Ila[5]} {stcDemod/Brik2_u/H1EstR_Ila[6]} {stcDemod/Brik2_u/H1EstR_Ila[7]} {stcDemod/Brik2_u/H1EstR_Ila[8]} {stcDemod/Brik2_u/H1EstR_Ila[9]} {stcDemod/Brik2_u/H1EstR_Ila[10]} {stcDemod/Brik2_u/H1EstR_Ila[11]} {stcDemod/Brik2_u/H1EstR_Ila[12]} {stcDemod/Brik2_u/H1EstR_Ila[13]} {stcDemod/Brik2_u/H1EstR_Ila[14]} {stcDemod/Brik2_u/H1EstR_Ila[15]} {stcDemod/Brik2_u/H1EstR_Ila[16]} {stcDemod/Brik2_u/H1EstR_Ila[17]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe11]
set_property port_width 18 [get_debug_ports u_ila_1/probe11]
connect_debug_port u_ila_1/probe11 [get_nets [list {stcDemod/Brik2_u/H0EstR_Ila[0]} {stcDemod/Brik2_u/H0EstR_Ila[1]} {stcDemod/Brik2_u/H0EstR_Ila[2]} {stcDemod/Brik2_u/H0EstR_Ila[3]} {stcDemod/Brik2_u/H0EstR_Ila[4]} {stcDemod/Brik2_u/H0EstR_Ila[5]} {stcDemod/Brik2_u/H0EstR_Ila[6]} {stcDemod/Brik2_u/H0EstR_Ila[7]} {stcDemod/Brik2_u/H0EstR_Ila[8]} {stcDemod/Brik2_u/H0EstR_Ila[9]} {stcDemod/Brik2_u/H0EstR_Ila[10]} {stcDemod/Brik2_u/H0EstR_Ila[11]} {stcDemod/Brik2_u/H0EstR_Ila[12]} {stcDemod/Brik2_u/H0EstR_Ila[13]} {stcDemod/Brik2_u/H0EstR_Ila[14]} {stcDemod/Brik2_u/H0EstR_Ila[15]} {stcDemod/Brik2_u/H0EstR_Ila[16]} {stcDemod/Brik2_u/H0EstR_Ila[17]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe12]
set_property port_width 18 [get_debug_ports u_ila_1/probe12]
connect_debug_port u_ila_1/probe12 [get_nets [list {stcDemod/Brik2_u/TauEst0Ila[0]} {stcDemod/Brik2_u/TauEst0Ila[1]} {stcDemod/Brik2_u/TauEst0Ila[2]} {stcDemod/Brik2_u/TauEst0Ila[3]} {stcDemod/Brik2_u/TauEst0Ila[4]} {stcDemod/Brik2_u/TauEst0Ila[5]} {stcDemod/Brik2_u/TauEst0Ila[6]} {stcDemod/Brik2_u/TauEst0Ila[7]} {stcDemod/Brik2_u/TauEst0Ila[8]} {stcDemod/Brik2_u/TauEst0Ila[9]} {stcDemod/Brik2_u/TauEst0Ila[10]} {stcDemod/Brik2_u/TauEst0Ila[11]} {stcDemod/Brik2_u/TauEst0Ila[12]} {stcDemod/Brik2_u/TauEst0Ila[13]} {stcDemod/Brik2_u/TauEst0Ila[14]} {stcDemod/Brik2_u/TauEst0Ila[15]} {stcDemod/Brik2_u/TauEst0Ila[16]} {stcDemod/Brik2_u/TauEst0Ila[17]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe13]
set_property port_width 18 [get_debug_ports u_ila_1/probe13]
connect_debug_port u_ila_1/probe13 [get_nets [list {stcDemod/Brik2_u/DF_I_Ila[0]} {stcDemod/Brik2_u/DF_I_Ila[1]} {stcDemod/Brik2_u/DF_I_Ila[2]} {stcDemod/Brik2_u/DF_I_Ila[3]} {stcDemod/Brik2_u/DF_I_Ila[4]} {stcDemod/Brik2_u/DF_I_Ila[5]} {stcDemod/Brik2_u/DF_I_Ila[6]} {stcDemod/Brik2_u/DF_I_Ila[7]} {stcDemod/Brik2_u/DF_I_Ila[8]} {stcDemod/Brik2_u/DF_I_Ila[9]} {stcDemod/Brik2_u/DF_I_Ila[10]} {stcDemod/Brik2_u/DF_I_Ila[11]} {stcDemod/Brik2_u/DF_I_Ila[12]} {stcDemod/Brik2_u/DF_I_Ila[13]} {stcDemod/Brik2_u/DF_I_Ila[14]} {stcDemod/Brik2_u/DF_I_Ila[15]} {stcDemod/Brik2_u/DF_I_Ila[16]} {stcDemod/Brik2_u/DF_I_Ila[17]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe14]
set_property port_width 18 [get_debug_ports u_ila_1/probe14]
connect_debug_port u_ila_1/probe14 [get_nets [list {stcDemod/Brik2_u/H0EstI_Ila[0]} {stcDemod/Brik2_u/H0EstI_Ila[1]} {stcDemod/Brik2_u/H0EstI_Ila[2]} {stcDemod/Brik2_u/H0EstI_Ila[3]} {stcDemod/Brik2_u/H0EstI_Ila[4]} {stcDemod/Brik2_u/H0EstI_Ila[5]} {stcDemod/Brik2_u/H0EstI_Ila[6]} {stcDemod/Brik2_u/H0EstI_Ila[7]} {stcDemod/Brik2_u/H0EstI_Ila[8]} {stcDemod/Brik2_u/H0EstI_Ila[9]} {stcDemod/Brik2_u/H0EstI_Ila[10]} {stcDemod/Brik2_u/H0EstI_Ila[11]} {stcDemod/Brik2_u/H0EstI_Ila[12]} {stcDemod/Brik2_u/H0EstI_Ila[13]} {stcDemod/Brik2_u/H0EstI_Ila[14]} {stcDemod/Brik2_u/H0EstI_Ila[15]} {stcDemod/Brik2_u/H0EstI_Ila[16]} {stcDemod/Brik2_u/H0EstI_Ila[17]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe15]
set_property port_width 14 [get_debug_ports u_ila_1/probe15]
connect_debug_port u_ila_1/probe15 [get_nets [list {stcDemod/FD/WrCount[0]} {stcDemod/FD/WrCount[1]} {stcDemod/FD/WrCount[2]} {stcDemod/FD/WrCount[3]} {stcDemod/FD/WrCount[4]} {stcDemod/FD/WrCount[5]} {stcDemod/FD/WrCount[6]} {stcDemod/FD/WrCount[7]} {stcDemod/FD/WrCount[8]} {stcDemod/FD/WrCount[9]} {stcDemod/FD/WrCount[10]} {stcDemod/FD/WrCount[11]} {stcDemod/FD/WrCount[12]} {stcDemod/FD/WrCount[13]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe16]
set_property port_width 18 [get_debug_ports u_ila_1/probe16]
connect_debug_port u_ila_1/probe16 [get_nets [list {stcDemod/Brik2_u/DF_R_Ila[0]} {stcDemod/Brik2_u/DF_R_Ila[1]} {stcDemod/Brik2_u/DF_R_Ila[2]} {stcDemod/Brik2_u/DF_R_Ila[3]} {stcDemod/Brik2_u/DF_R_Ila[4]} {stcDemod/Brik2_u/DF_R_Ila[5]} {stcDemod/Brik2_u/DF_R_Ila[6]} {stcDemod/Brik2_u/DF_R_Ila[7]} {stcDemod/Brik2_u/DF_R_Ila[8]} {stcDemod/Brik2_u/DF_R_Ila[9]} {stcDemod/Brik2_u/DF_R_Ila[10]} {stcDemod/Brik2_u/DF_R_Ila[11]} {stcDemod/Brik2_u/DF_R_Ila[12]} {stcDemod/Brik2_u/DF_R_Ila[13]} {stcDemod/Brik2_u/DF_R_Ila[14]} {stcDemod/Brik2_u/DF_R_Ila[15]} {stcDemod/Brik2_u/DF_R_Ila[16]} {stcDemod/Brik2_u/DF_R_Ila[17]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe17]
set_property port_width 18 [get_debug_ports u_ila_1/probe17]
connect_debug_port u_ila_1/probe17 [get_nets [list {stcDemod/Brik2_u/TauEst1Ila[0]} {stcDemod/Brik2_u/TauEst1Ila[1]} {stcDemod/Brik2_u/TauEst1Ila[2]} {stcDemod/Brik2_u/TauEst1Ila[3]} {stcDemod/Brik2_u/TauEst1Ila[4]} {stcDemod/Brik2_u/TauEst1Ila[5]} {stcDemod/Brik2_u/TauEst1Ila[6]} {stcDemod/Brik2_u/TauEst1Ila[7]} {stcDemod/Brik2_u/TauEst1Ila[8]} {stcDemod/Brik2_u/TauEst1Ila[9]} {stcDemod/Brik2_u/TauEst1Ila[10]} {stcDemod/Brik2_u/TauEst1Ila[11]} {stcDemod/Brik2_u/TauEst1Ila[12]} {stcDemod/Brik2_u/TauEst1Ila[13]} {stcDemod/Brik2_u/TauEst1Ila[14]} {stcDemod/Brik2_u/TauEst1Ila[15]} {stcDemod/Brik2_u/TauEst1Ila[16]} {stcDemod/Brik2_u/TauEst1Ila[17]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe18]
set_property port_width 13 [get_debug_ports u_ila_1/probe18]
connect_debug_port u_ila_1/probe18 [get_nets [list {stcDemod/PD_u/Magnitude0[5]} {stcDemod/PD_u/Magnitude0[6]} {stcDemod/PD_u/Magnitude0[7]} {stcDemod/PD_u/Magnitude0[8]} {stcDemod/PD_u/Magnitude0[9]} {stcDemod/PD_u/Magnitude0[10]} {stcDemod/PD_u/Magnitude0[11]} {stcDemod/PD_u/Magnitude0[12]} {stcDemod/PD_u/Magnitude0[13]} {stcDemod/PD_u/Magnitude0[14]} {stcDemod/PD_u/Magnitude0[15]} {stcDemod/PD_u/Magnitude0[16]} {stcDemod/PD_u/Magnitude0[17]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe19]
set_property port_width 12 [get_debug_ports u_ila_1/probe19]
connect_debug_port u_ila_1/probe19 [get_nets [list {stcDemod/PD_u/PhaseOut0[6]} {stcDemod/PD_u/PhaseOut0[7]} {stcDemod/PD_u/PhaseOut0[8]} {stcDemod/PD_u/PhaseOut0[9]} {stcDemod/PD_u/PhaseOut0[10]} {stcDemod/PD_u/PhaseOut0[11]} {stcDemod/PD_u/PhaseOut0[12]} {stcDemod/PD_u/PhaseOut0[13]} {stcDemod/PD_u/PhaseOut0[14]} {stcDemod/PD_u/PhaseOut0[15]} {stcDemod/PD_u/PhaseOut0[16]} {stcDemod/PD_u/PhaseOut0[17]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe20]
set_property port_width 18 [get_debug_ports u_ila_1/probe20]
connect_debug_port u_ila_1/probe20 [get_nets [list {stcDemod/PD_u/MagPeakInt0[0]} {stcDemod/PD_u/MagPeakInt0[1]} {stcDemod/PD_u/MagPeakInt0[2]} {stcDemod/PD_u/MagPeakInt0[3]} {stcDemod/PD_u/MagPeakInt0[4]} {stcDemod/PD_u/MagPeakInt0[5]} {stcDemod/PD_u/MagPeakInt0[6]} {stcDemod/PD_u/MagPeakInt0[7]} {stcDemod/PD_u/MagPeakInt0[8]} {stcDemod/PD_u/MagPeakInt0[9]} {stcDemod/PD_u/MagPeakInt0[10]} {stcDemod/PD_u/MagPeakInt0[11]} {stcDemod/PD_u/MagPeakInt0[12]} {stcDemod/PD_u/MagPeakInt0[13]} {stcDemod/PD_u/MagPeakInt0[14]} {stcDemod/PD_u/MagPeakInt0[15]} {stcDemod/PD_u/MagPeakInt0[16]} {stcDemod/PD_u/MagPeakInt0[17]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe21]
set_property port_width 18 [get_debug_ports u_ila_1/probe21]
connect_debug_port u_ila_1/probe21 [get_nets [list {stcDemod/PD_u/MagPeakInt1[0]} {stcDemod/PD_u/MagPeakInt1[1]} {stcDemod/PD_u/MagPeakInt1[2]} {stcDemod/PD_u/MagPeakInt1[3]} {stcDemod/PD_u/MagPeakInt1[4]} {stcDemod/PD_u/MagPeakInt1[5]} {stcDemod/PD_u/MagPeakInt1[6]} {stcDemod/PD_u/MagPeakInt1[7]} {stcDemod/PD_u/MagPeakInt1[8]} {stcDemod/PD_u/MagPeakInt1[9]} {stcDemod/PD_u/MagPeakInt1[10]} {stcDemod/PD_u/MagPeakInt1[11]} {stcDemod/PD_u/MagPeakInt1[12]} {stcDemod/PD_u/MagPeakInt1[13]} {stcDemod/PD_u/MagPeakInt1[14]} {stcDemod/PD_u/MagPeakInt1[15]} {stcDemod/PD_u/MagPeakInt1[16]} {stcDemod/PD_u/MagPeakInt1[17]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe22]
set_property port_width 18 [get_debug_ports u_ila_1/probe22]
connect_debug_port u_ila_1/probe22 [get_nets [list {stcDemod/PD_u/CurrentMag0[-11]} {stcDemod/PD_u/CurrentMag0[-10]} {stcDemod/PD_u/CurrentMag0[-9]} {stcDemod/PD_u/CurrentMag0[-8]} {stcDemod/PD_u/CurrentMag0[-7]} {stcDemod/PD_u/CurrentMag0[-6]} {stcDemod/PD_u/CurrentMag0[-5]} {stcDemod/PD_u/CurrentMag0[-4]} {stcDemod/PD_u/CurrentMag0[-3]} {stcDemod/PD_u/CurrentMag0[-2]} {stcDemod/PD_u/CurrentMag0[-1]} {stcDemod/PD_u/CurrentMag0[0]} {stcDemod/PD_u/CurrentMag0[1]} {stcDemod/PD_u/CurrentMag0[2]} {stcDemod/PD_u/CurrentMag0[3]} {stcDemod/PD_u/CurrentMag0[4]} {stcDemod/PD_u/CurrentMag0[5]} {stcDemod/PD_u/CurrentMag0[6]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe23]
set_property port_width 18 [get_debug_ports u_ila_1/probe23]
connect_debug_port u_ila_1/probe23 [get_nets [list {stcDemod/PD_u/MagPeak0[0]} {stcDemod/PD_u/MagPeak0[1]} {stcDemod/PD_u/MagPeak0[2]} {stcDemod/PD_u/MagPeak0[3]} {stcDemod/PD_u/MagPeak0[4]} {stcDemod/PD_u/MagPeak0[5]} {stcDemod/PD_u/MagPeak0[6]} {stcDemod/PD_u/MagPeak0[7]} {stcDemod/PD_u/MagPeak0[8]} {stcDemod/PD_u/MagPeak0[9]} {stcDemod/PD_u/MagPeak0[10]} {stcDemod/PD_u/MagPeak0[11]} {stcDemod/PD_u/MagPeak0[12]} {stcDemod/PD_u/MagPeak0[13]} {stcDemod/PD_u/MagPeak0[14]} {stcDemod/PD_u/MagPeak0[15]} {stcDemod/PD_u/MagPeak0[16]} {stcDemod/PD_u/MagPeak0[17]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe24]
set_property port_width 18 [get_debug_ports u_ila_1/probe24]
connect_debug_port u_ila_1/probe24 [get_nets [list {stcDemod/PD_u/AbsCntr1_Ila[0]} {stcDemod/PD_u/AbsCntr1_Ila[1]} {stcDemod/PD_u/AbsCntr1_Ila[2]} {stcDemod/PD_u/AbsCntr1_Ila[3]} {stcDemod/PD_u/AbsCntr1_Ila[4]} {stcDemod/PD_u/AbsCntr1_Ila[5]} {stcDemod/PD_u/AbsCntr1_Ila[6]} {stcDemod/PD_u/AbsCntr1_Ila[7]} {stcDemod/PD_u/AbsCntr1_Ila[8]} {stcDemod/PD_u/AbsCntr1_Ila[9]} {stcDemod/PD_u/AbsCntr1_Ila[10]} {stcDemod/PD_u/AbsCntr1_Ila[11]} {stcDemod/PD_u/AbsCntr1_Ila[12]} {stcDemod/PD_u/AbsCntr1_Ila[13]} {stcDemod/PD_u/AbsCntr1_Ila[14]} {stcDemod/PD_u/AbsCntr1_Ila[15]} {stcDemod/PD_u/AbsCntr1_Ila[16]} {stcDemod/PD_u/AbsCntr1_Ila[17]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe25]
set_property port_width 18 [get_debug_ports u_ila_1/probe25]
connect_debug_port u_ila_1/probe25 [get_nets [list {stcDemod/PD_u/PhsPeakInt1[0]} {stcDemod/PD_u/PhsPeakInt1[1]} {stcDemod/PD_u/PhsPeakInt1[2]} {stcDemod/PD_u/PhsPeakInt1[3]} {stcDemod/PD_u/PhsPeakInt1[4]} {stcDemod/PD_u/PhsPeakInt1[5]} {stcDemod/PD_u/PhsPeakInt1[6]} {stcDemod/PD_u/PhsPeakInt1[7]} {stcDemod/PD_u/PhsPeakInt1[8]} {stcDemod/PD_u/PhsPeakInt1[9]} {stcDemod/PD_u/PhsPeakInt1[10]} {stcDemod/PD_u/PhsPeakInt1[11]} {stcDemod/PD_u/PhsPeakInt1[12]} {stcDemod/PD_u/PhsPeakInt1[13]} {stcDemod/PD_u/PhsPeakInt1[14]} {stcDemod/PD_u/PhsPeakInt1[15]} {stcDemod/PD_u/PhsPeakInt1[16]} {stcDemod/PD_u/PhsPeakInt1[17]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe26]
set_property port_width 18 [get_debug_ports u_ila_1/probe26]
connect_debug_port u_ila_1/probe26 [get_nets [list {stcDemod/PD_u/CurrentMag1[-11]} {stcDemod/PD_u/CurrentMag1[-10]} {stcDemod/PD_u/CurrentMag1[-9]} {stcDemod/PD_u/CurrentMag1[-8]} {stcDemod/PD_u/CurrentMag1[-7]} {stcDemod/PD_u/CurrentMag1[-6]} {stcDemod/PD_u/CurrentMag1[-5]} {stcDemod/PD_u/CurrentMag1[-4]} {stcDemod/PD_u/CurrentMag1[-3]} {stcDemod/PD_u/CurrentMag1[-2]} {stcDemod/PD_u/CurrentMag1[-1]} {stcDemod/PD_u/CurrentMag1[0]} {stcDemod/PD_u/CurrentMag1[1]} {stcDemod/PD_u/CurrentMag1[2]} {stcDemod/PD_u/CurrentMag1[3]} {stcDemod/PD_u/CurrentMag1[4]} {stcDemod/PD_u/CurrentMag1[5]} {stcDemod/PD_u/CurrentMag1[6]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe27]
set_property port_width 18 [get_debug_ports u_ila_1/probe27]
connect_debug_port u_ila_1/probe27 [get_nets [list {stcDemod/PD_u/AbsCntr0_Ila[0]} {stcDemod/PD_u/AbsCntr0_Ila[1]} {stcDemod/PD_u/AbsCntr0_Ila[2]} {stcDemod/PD_u/AbsCntr0_Ila[3]} {stcDemod/PD_u/AbsCntr0_Ila[4]} {stcDemod/PD_u/AbsCntr0_Ila[5]} {stcDemod/PD_u/AbsCntr0_Ila[6]} {stcDemod/PD_u/AbsCntr0_Ila[7]} {stcDemod/PD_u/AbsCntr0_Ila[8]} {stcDemod/PD_u/AbsCntr0_Ila[9]} {stcDemod/PD_u/AbsCntr0_Ila[10]} {stcDemod/PD_u/AbsCntr0_Ila[11]} {stcDemod/PD_u/AbsCntr0_Ila[12]} {stcDemod/PD_u/AbsCntr0_Ila[13]} {stcDemod/PD_u/AbsCntr0_Ila[14]} {stcDemod/PD_u/AbsCntr0_Ila[15]} {stcDemod/PD_u/AbsCntr0_Ila[16]} {stcDemod/PD_u/AbsCntr0_Ila[17]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe28]
set_property port_width 18 [get_debug_ports u_ila_1/probe28]
connect_debug_port u_ila_1/probe28 [get_nets [list {stcDemod/PD_u/PhsPeak0[0]} {stcDemod/PD_u/PhsPeak0[1]} {stcDemod/PD_u/PhsPeak0[2]} {stcDemod/PD_u/PhsPeak0[3]} {stcDemod/PD_u/PhsPeak0[4]} {stcDemod/PD_u/PhsPeak0[5]} {stcDemod/PD_u/PhsPeak0[6]} {stcDemod/PD_u/PhsPeak0[7]} {stcDemod/PD_u/PhsPeak0[8]} {stcDemod/PD_u/PhsPeak0[9]} {stcDemod/PD_u/PhsPeak0[10]} {stcDemod/PD_u/PhsPeak0[11]} {stcDemod/PD_u/PhsPeak0[12]} {stcDemod/PD_u/PhsPeak0[13]} {stcDemod/PD_u/PhsPeak0[14]} {stcDemod/PD_u/PhsPeak0[15]} {stcDemod/PD_u/PhsPeak0[16]} {stcDemod/PD_u/PhsPeak0[17]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe29]
set_property port_width 18 [get_debug_ports u_ila_1/probe29]
connect_debug_port u_ila_1/probe29 [get_nets [list {stcDemod/PD_u/MagPeak1[0]} {stcDemod/PD_u/MagPeak1[1]} {stcDemod/PD_u/MagPeak1[2]} {stcDemod/PD_u/MagPeak1[3]} {stcDemod/PD_u/MagPeak1[4]} {stcDemod/PD_u/MagPeak1[5]} {stcDemod/PD_u/MagPeak1[6]} {stcDemod/PD_u/MagPeak1[7]} {stcDemod/PD_u/MagPeak1[8]} {stcDemod/PD_u/MagPeak1[9]} {stcDemod/PD_u/MagPeak1[10]} {stcDemod/PD_u/MagPeak1[11]} {stcDemod/PD_u/MagPeak1[12]} {stcDemod/PD_u/MagPeak1[13]} {stcDemod/PD_u/MagPeak1[14]} {stcDemod/PD_u/MagPeak1[15]} {stcDemod/PD_u/MagPeak1[16]} {stcDemod/PD_u/MagPeak1[17]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe30]
set_property port_width 18 [get_debug_ports u_ila_1/probe30]
connect_debug_port u_ila_1/probe30 [get_nets [list {stcDemod/PD_u/PhsPeakInt0[0]} {stcDemod/PD_u/PhsPeakInt0[1]} {stcDemod/PD_u/PhsPeakInt0[2]} {stcDemod/PD_u/PhsPeakInt0[3]} {stcDemod/PD_u/PhsPeakInt0[4]} {stcDemod/PD_u/PhsPeakInt0[5]} {stcDemod/PD_u/PhsPeakInt0[6]} {stcDemod/PD_u/PhsPeakInt0[7]} {stcDemod/PD_u/PhsPeakInt0[8]} {stcDemod/PD_u/PhsPeakInt0[9]} {stcDemod/PD_u/PhsPeakInt0[10]} {stcDemod/PD_u/PhsPeakInt0[11]} {stcDemod/PD_u/PhsPeakInt0[12]} {stcDemod/PD_u/PhsPeakInt0[13]} {stcDemod/PD_u/PhsPeakInt0[14]} {stcDemod/PD_u/PhsPeakInt0[15]} {stcDemod/PD_u/PhsPeakInt0[16]} {stcDemod/PD_u/PhsPeakInt0[17]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe31]
set_property port_width 18 [get_debug_ports u_ila_1/probe31]
connect_debug_port u_ila_1/probe31 [get_nets [list {stcDemod/PD_u/PhsPeak1[0]} {stcDemod/PD_u/PhsPeak1[1]} {stcDemod/PD_u/PhsPeak1[2]} {stcDemod/PD_u/PhsPeak1[3]} {stcDemod/PD_u/PhsPeak1[4]} {stcDemod/PD_u/PhsPeak1[5]} {stcDemod/PD_u/PhsPeak1[6]} {stcDemod/PD_u/PhsPeak1[7]} {stcDemod/PD_u/PhsPeak1[8]} {stcDemod/PD_u/PhsPeak1[9]} {stcDemod/PD_u/PhsPeak1[10]} {stcDemod/PD_u/PhsPeak1[11]} {stcDemod/PD_u/PhsPeak1[12]} {stcDemod/PD_u/PhsPeak1[13]} {stcDemod/PD_u/PhsPeak1[14]} {stcDemod/PD_u/PhsPeak1[15]} {stcDemod/PD_u/PhsPeak1[16]} {stcDemod/PD_u/PhsPeak1[17]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe32]
set_property port_width 13 [get_debug_ports u_ila_1/probe32]
connect_debug_port u_ila_1/probe32 [get_nets [list {stcDemod/PD_u/Magnitude1[5]} {stcDemod/PD_u/Magnitude1[6]} {stcDemod/PD_u/Magnitude1[7]} {stcDemod/PD_u/Magnitude1[8]} {stcDemod/PD_u/Magnitude1[9]} {stcDemod/PD_u/Magnitude1[10]} {stcDemod/PD_u/Magnitude1[11]} {stcDemod/PD_u/Magnitude1[12]} {stcDemod/PD_u/Magnitude1[13]} {stcDemod/PD_u/Magnitude1[14]} {stcDemod/PD_u/Magnitude1[15]} {stcDemod/PD_u/Magnitude1[16]} {stcDemod/PD_u/Magnitude1[17]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe33]
set_property port_width 18 [get_debug_ports u_ila_1/probe33]
connect_debug_port u_ila_1/probe33 [get_nets [list {stcDemod/PS_u/ReadR_Ila[0]} {stcDemod/PS_u/ReadR_Ila[1]} {stcDemod/PS_u/ReadR_Ila[2]} {stcDemod/PS_u/ReadR_Ila[3]} {stcDemod/PS_u/ReadR_Ila[4]} {stcDemod/PS_u/ReadR_Ila[5]} {stcDemod/PS_u/ReadR_Ila[6]} {stcDemod/PS_u/ReadR_Ila[7]} {stcDemod/PS_u/ReadR_Ila[8]} {stcDemod/PS_u/ReadR_Ila[9]} {stcDemod/PS_u/ReadR_Ila[10]} {stcDemod/PS_u/ReadR_Ila[11]} {stcDemod/PS_u/ReadR_Ila[12]} {stcDemod/PS_u/ReadR_Ila[13]} {stcDemod/PS_u/ReadR_Ila[14]} {stcDemod/PS_u/ReadR_Ila[15]} {stcDemod/PS_u/ReadR_Ila[16]} {stcDemod/PS_u/ReadR_Ila[17]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe34]
set_property port_width 11 [get_debug_ports u_ila_1/probe34]
connect_debug_port u_ila_1/probe34 [get_nets [list {stcDemod/PS_u/SyncSumIla[0]} {stcDemod/PS_u/SyncSumIla[1]} {stcDemod/PS_u/SyncSumIla[2]} {stcDemod/PS_u/SyncSumIla[3]} {stcDemod/PS_u/SyncSumIla[4]} {stcDemod/PS_u/SyncSumIla[5]} {stcDemod/PS_u/SyncSumIla[6]} {stcDemod/PS_u/SyncSumIla[7]} {stcDemod/PS_u/SyncSumIla[8]} {stcDemod/PS_u/SyncSumIla[9]} {stcDemod/PS_u/SyncSumIla[10]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe35]
set_property port_width 16 [get_debug_ports u_ila_1/probe35]
connect_debug_port u_ila_1/probe35 [get_nets [list {stcDemod/PS_u/CorrCntrCapture[0]} {stcDemod/PS_u/CorrCntrCapture[1]} {stcDemod/PS_u/CorrCntrCapture[2]} {stcDemod/PS_u/CorrCntrCapture[3]} {stcDemod/PS_u/CorrCntrCapture[4]} {stcDemod/PS_u/CorrCntrCapture[5]} {stcDemod/PS_u/CorrCntrCapture[6]} {stcDemod/PS_u/CorrCntrCapture[7]} {stcDemod/PS_u/CorrCntrCapture[8]} {stcDemod/PS_u/CorrCntrCapture[9]} {stcDemod/PS_u/CorrCntrCapture[10]} {stcDemod/PS_u/CorrCntrCapture[11]} {stcDemod/PS_u/CorrCntrCapture[12]} {stcDemod/PS_u/CorrCntrCapture[13]} {stcDemod/PS_u/CorrCntrCapture[14]} {stcDemod/PS_u/CorrCntrCapture[15]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe36]
set_property port_width 12 [get_debug_ports u_ila_1/probe36]
connect_debug_port u_ila_1/probe36 [get_nets [list {stcDemod/PS_u/Phase0B[-11]} {stcDemod/PS_u/Phase0B[-10]} {stcDemod/PS_u/Phase0B[-9]} {stcDemod/PS_u/Phase0B[-8]} {stcDemod/PS_u/Phase0B[-7]} {stcDemod/PS_u/Phase0B[-6]} {stcDemod/PS_u/Phase0B[-5]} {stcDemod/PS_u/Phase0B[-4]} {stcDemod/PS_u/Phase0B[-3]} {stcDemod/PS_u/Phase0B[-2]} {stcDemod/PS_u/Phase0B[-1]} {stcDemod/PS_u/Phase0B[0]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe37]
set_property port_width 18 [get_debug_ports u_ila_1/probe37]
connect_debug_port u_ila_1/probe37 [get_nets [list {stcDemod/PS_u/ReadI_Ila[0]} {stcDemod/PS_u/ReadI_Ila[1]} {stcDemod/PS_u/ReadI_Ila[2]} {stcDemod/PS_u/ReadI_Ila[3]} {stcDemod/PS_u/ReadI_Ila[4]} {stcDemod/PS_u/ReadI_Ila[5]} {stcDemod/PS_u/ReadI_Ila[6]} {stcDemod/PS_u/ReadI_Ila[7]} {stcDemod/PS_u/ReadI_Ila[8]} {stcDemod/PS_u/ReadI_Ila[9]} {stcDemod/PS_u/ReadI_Ila[10]} {stcDemod/PS_u/ReadI_Ila[11]} {stcDemod/PS_u/ReadI_Ila[12]} {stcDemod/PS_u/ReadI_Ila[13]} {stcDemod/PS_u/ReadI_Ila[14]} {stcDemod/PS_u/ReadI_Ila[15]} {stcDemod/PS_u/ReadI_Ila[16]} {stcDemod/PS_u/ReadI_Ila[17]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe38]
set_property port_width 12 [get_debug_ports u_ila_1/probe38]
connect_debug_port u_ila_1/probe38 [get_nets [list {stcDemod/PS_u/Phase0A[-11]} {stcDemod/PS_u/Phase0A[-10]} {stcDemod/PS_u/Phase0A[-9]} {stcDemod/PS_u/Phase0A[-8]} {stcDemod/PS_u/Phase0A[-7]} {stcDemod/PS_u/Phase0A[-6]} {stcDemod/PS_u/Phase0A[-5]} {stcDemod/PS_u/Phase0A[-4]} {stcDemod/PS_u/Phase0A[-3]} {stcDemod/PS_u/Phase0A[-2]} {stcDemod/PS_u/Phase0A[-1]} {stcDemod/PS_u/Phase0A[0]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe39]
set_property port_width 1 [get_debug_ports u_ila_1/probe39]
connect_debug_port u_ila_1/probe39 [get_nets [list stcDemod/Brik2_u/ChanEstDone]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe40]
set_property port_width 1 [get_debug_ports u_ila_1/probe40]
connect_debug_port u_ila_1/probe40 [get_nets [list stcDemod/ClkOutEn]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe41]
set_property port_width 1 [get_debug_ports u_ila_1/probe41]
connect_debug_port u_ila_1/probe41 [get_nets [list stcDemod/EstimatesDone]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe42]
set_property port_width 1 [get_debug_ports u_ila_1/probe42]
connect_debug_port u_ila_1/probe42 [get_nets [list stcDemod/PS_u/CmplxMultH1/OverFlow]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe43]
set_property port_width 1 [get_debug_ports u_ila_1/probe43]
connect_debug_port u_ila_1/probe43 [get_nets [list stcDemod/PD_u/H0Cntr_x_Fft/OverFlow]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe44]
set_property port_width 1 [get_debug_ports u_ila_1/probe44]
connect_debug_port u_ila_1/probe44 [get_nets [list stcDemod/PS_u/CmplxMultH0/OverFlow]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe45]
set_property port_width 1 [get_debug_ports u_ila_1/probe45]
connect_debug_port u_ila_1/probe45 [get_nets [list stcDemod/PD_u/H1Cntr_x_Fft/OverFlow]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe46]
set_property port_width 1 [get_debug_ports u_ila_1/probe46]
connect_debug_port u_ila_1/probe46 [get_nets [list stcDemod/StartIla]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe47]
set_property port_width 1 [get_debug_ports u_ila_1/probe47]
connect_debug_port u_ila_1/probe47 [get_nets [list stcDemod/Brik2_u/StartTime]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe48]
set_property port_width 1 [get_debug_ports u_ila_1/probe48]
connect_debug_port u_ila_1/probe48 [get_nets [list stcDemod/Brik2_u/TimeEstDone]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe49]
set_property port_width 1 [get_debug_ports u_ila_1/probe49]
connect_debug_port u_ila_1/probe49 [get_nets [list stcDemod/TrellisOutEn]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe50]
set_property port_width 1 [get_debug_ports u_ila_1/probe50]
connect_debug_port u_ila_1/probe50 [get_nets [list stcDemod/ValidData2047]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe51]
set_property port_width 1 [get_debug_ports u_ila_1/probe51]
connect_debug_port u_ila_1/probe51 [get_nets [list stcDemod/Brik2_u/ValidDF_ILA]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe52]
set_property port_width 1 [get_debug_ports u_ila_1/probe52]
connect_debug_port u_ila_1/probe52 [get_nets [list stcDemod/ValidIla]]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets clk2x]
