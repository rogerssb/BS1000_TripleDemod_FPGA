

set_property MARK_DEBUG true [get_nets stcDemod/StartOfFrame]


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
set_property port_width 9 [get_debug_ports u_ila_0/probe0]
connect_debug_port u_ila_0/probe0 [get_nets [list {stcDemod/CorrPntr8to0[0]} {stcDemod/CorrPntr8to0[1]} {stcDemod/CorrPntr8to0[2]} {stcDemod/CorrPntr8to0[3]} {stcDemod/CorrPntr8to0[4]} {stcDemod/CorrPntr8to0[5]} {stcDemod/CorrPntr8to0[6]} {stcDemod/CorrPntr8to0[7]} {stcDemod/CorrPntr8to0[8]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe1]
set_property port_width 10 [get_debug_ports u_ila_0/probe1]
connect_debug_port u_ila_0/probe1 [get_nets [list {stcDemod/DataAddr[0]} {stcDemod/DataAddr[1]} {stcDemod/DataAddr[2]} {stcDemod/DataAddr[3]} {stcDemod/DataAddr[4]} {stcDemod/DataAddr[5]} {stcDemod/DataAddr[6]} {stcDemod/DataAddr[7]} {stcDemod/DataAddr[8]} {stcDemod/DataAddr[9]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe2]
set_property port_width 13 [get_debug_ports u_ila_0/probe2]
connect_debug_port u_ila_0/probe2 [get_nets [list {stcDemod/H0Mag[0]} {stcDemod/H0Mag[1]} {stcDemod/H0Mag[2]} {stcDemod/H0Mag[3]} {stcDemod/H0Mag[4]} {stcDemod/H0Mag[5]} {stcDemod/H0Mag[6]} {stcDemod/H0Mag[7]} {stcDemod/H0Mag[8]} {stcDemod/H0Mag[9]} {stcDemod/H0Mag[10]} {stcDemod/H0Mag[11]} {stcDemod/H0Mag[12]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe3]
set_property port_width 13 [get_debug_ports u_ila_0/probe3]
connect_debug_port u_ila_0/probe3 [get_nets [list {stcDemod/H1Mag[0]} {stcDemod/H1Mag[1]} {stcDemod/H1Mag[2]} {stcDemod/H1Mag[3]} {stcDemod/H1Mag[4]} {stcDemod/H1Mag[5]} {stcDemod/H1Mag[6]} {stcDemod/H1Mag[7]} {stcDemod/H1Mag[8]} {stcDemod/H1Mag[9]} {stcDemod/H1Mag[10]} {stcDemod/H1Mag[11]} {stcDemod/H1Mag[12]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe4]
set_property port_width 18 [get_debug_ports u_ila_0/probe4]
connect_debug_port u_ila_0/probe4 [get_nets [list {stcDemod/InIBrik2Ila[0]} {stcDemod/InIBrik2Ila[1]} {stcDemod/InIBrik2Ila[2]} {stcDemod/InIBrik2Ila[3]} {stcDemod/InIBrik2Ila[4]} {stcDemod/InIBrik2Ila[5]} {stcDemod/InIBrik2Ila[6]} {stcDemod/InIBrik2Ila[7]} {stcDemod/InIBrik2Ila[8]} {stcDemod/InIBrik2Ila[9]} {stcDemod/InIBrik2Ila[10]} {stcDemod/InIBrik2Ila[11]} {stcDemod/InIBrik2Ila[12]} {stcDemod/InIBrik2Ila[13]} {stcDemod/InIBrik2Ila[14]} {stcDemod/InIBrik2Ila[15]} {stcDemod/InIBrik2Ila[16]} {stcDemod/InIBrik2Ila[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe5]
set_property port_width 18 [get_debug_ports u_ila_0/probe5]
connect_debug_port u_ila_0/probe5 [get_nets [list {stcDemod/InRBrik2Ila[0]} {stcDemod/InRBrik2Ila[1]} {stcDemod/InRBrik2Ila[2]} {stcDemod/InRBrik2Ila[3]} {stcDemod/InRBrik2Ila[4]} {stcDemod/InRBrik2Ila[5]} {stcDemod/InRBrik2Ila[6]} {stcDemod/InRBrik2Ila[7]} {stcDemod/InRBrik2Ila[8]} {stcDemod/InRBrik2Ila[9]} {stcDemod/InRBrik2Ila[10]} {stcDemod/InRBrik2Ila[11]} {stcDemod/InRBrik2Ila[12]} {stcDemod/InRBrik2Ila[13]} {stcDemod/InRBrik2Ila[14]} {stcDemod/InRBrik2Ila[15]} {stcDemod/InRBrik2Ila[16]} {stcDemod/InRBrik2Ila[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe6]
set_property port_width 18 [get_debug_ports u_ila_0/probe6]
connect_debug_port u_ila_0/probe6 [get_nets [list {stcDemod/PhaseDiffNB[0]} {stcDemod/PhaseDiffNB[1]} {stcDemod/PhaseDiffNB[2]} {stcDemod/PhaseDiffNB[3]} {stcDemod/PhaseDiffNB[4]} {stcDemod/PhaseDiffNB[5]} {stcDemod/PhaseDiffNB[6]} {stcDemod/PhaseDiffNB[7]} {stcDemod/PhaseDiffNB[8]} {stcDemod/PhaseDiffNB[9]} {stcDemod/PhaseDiffNB[10]} {stcDemod/PhaseDiffNB[11]} {stcDemod/PhaseDiffNB[12]} {stcDemod/PhaseDiffNB[13]} {stcDemod/PhaseDiffNB[14]} {stcDemod/PhaseDiffNB[15]} {stcDemod/PhaseDiffNB[16]} {stcDemod/PhaseDiffNB[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe7]
set_property port_width 18 [get_debug_ports u_ila_0/probe7]
connect_debug_port u_ila_0/probe7 [get_nets [list {stcDemod/PhaseDiffWB[0]} {stcDemod/PhaseDiffWB[1]} {stcDemod/PhaseDiffWB[2]} {stcDemod/PhaseDiffWB[3]} {stcDemod/PhaseDiffWB[4]} {stcDemod/PhaseDiffWB[5]} {stcDemod/PhaseDiffWB[6]} {stcDemod/PhaseDiffWB[7]} {stcDemod/PhaseDiffWB[8]} {stcDemod/PhaseDiffWB[9]} {stcDemod/PhaseDiffWB[10]} {stcDemod/PhaseDiffWB[11]} {stcDemod/PhaseDiffWB[12]} {stcDemod/PhaseDiffWB[13]} {stcDemod/PhaseDiffWB[14]} {stcDemod/PhaseDiffWB[15]} {stcDemod/PhaseDiffWB[16]} {stcDemod/PhaseDiffWB[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe8]
set_property port_width 12 [get_debug_ports u_ila_0/probe8]
connect_debug_port u_ila_0/probe8 [get_nets [list {stcDemod/PhaseDiffs[0]} {stcDemod/PhaseDiffs[1]} {stcDemod/PhaseDiffs[2]} {stcDemod/PhaseDiffs[3]} {stcDemod/PhaseDiffs[4]} {stcDemod/PhaseDiffs[5]} {stcDemod/PhaseDiffs[6]} {stcDemod/PhaseDiffs[7]} {stcDemod/PhaseDiffs[8]} {stcDemod/PhaseDiffs[9]} {stcDemod/PhaseDiffs[10]} {stcDemod/PhaseDiffs[11]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe9]
set_property port_width 9 [get_debug_ports u_ila_0/probe9]
connect_debug_port u_ila_0/probe9 [get_nets [list {stcDemod/PilotOffset[0]} {stcDemod/PilotOffset[1]} {stcDemod/PilotOffset[2]} {stcDemod/PilotOffset[3]} {stcDemod/PilotOffset[4]} {stcDemod/PilotOffset[5]} {stcDemod/PilotOffset[6]} {stcDemod/PilotOffset[7]} {stcDemod/PilotOffset[8]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe10]
set_property port_width 9 [get_debug_ports u_ila_0/probe10]
connect_debug_port u_ila_0/probe10 [get_nets [list {stcDemod/PilotOffset_s[0]} {stcDemod/PilotOffset_s[1]} {stcDemod/PilotOffset_s[2]} {stcDemod/PilotOffset_s[3]} {stcDemod/PilotOffset_s[4]} {stcDemod/PilotOffset_s[5]} {stcDemod/PilotOffset_s[6]} {stcDemod/PilotOffset_s[7]} {stcDemod/PilotOffset_s[8]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe11]
set_property port_width 6 [get_debug_ports u_ila_0/probe11]
connect_debug_port u_ila_0/probe11 [get_nets [list {stcDemod/deltaTauEstSlv[0]} {stcDemod/deltaTauEstSlv[1]} {stcDemod/deltaTauEstSlv[2]} {stcDemod/deltaTauEstSlv[3]} {stcDemod/deltaTauEstSlv[4]} {stcDemod/deltaTauEstSlv[5]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe12]
set_property port_width 12 [get_debug_ports u_ila_0/probe12]
connect_debug_port u_ila_0/probe12 [get_nets [list {stcDemod/freq[0]} {stcDemod/freq[1]} {stcDemod/freq[2]} {stcDemod/freq[3]} {stcDemod/freq[4]} {stcDemod/freq[5]} {stcDemod/freq[6]} {stcDemod/freq[7]} {stcDemod/freq[8]} {stcDemod/freq[9]} {stcDemod/freq[10]} {stcDemod/freq[11]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe13]
set_property port_width 4 [get_debug_ports u_ila_0/probe13]
connect_debug_port u_ila_0/probe13 [get_nets [list {stcDemod/m_ndx0Slv[0]} {stcDemod/m_ndx0Slv[1]} {stcDemod/m_ndx0Slv[2]} {stcDemod/m_ndx0Slv[3]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe14]
set_property port_width 4 [get_debug_ports u_ila_0/probe14]
connect_debug_port u_ila_0/probe14 [get_nets [list {stcDemod/m_ndx1Slv[0]} {stcDemod/m_ndx1Slv[1]} {stcDemod/m_ndx1Slv[2]} {stcDemod/m_ndx1Slv[3]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe15]
set_property port_width 13 [get_debug_ports u_ila_0/probe15]
connect_debug_port u_ila_0/probe15 [get_nets [list {stcDemod/mag[0]} {stcDemod/mag[1]} {stcDemod/mag[2]} {stcDemod/mag[3]} {stcDemod/mag[4]} {stcDemod/mag[5]} {stcDemod/mag[6]} {stcDemod/mag[7]} {stcDemod/mag[8]} {stcDemod/mag[9]} {stcDemod/mag[10]} {stcDemod/mag[11]} {stcDemod/mag[12]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe16]
set_property port_width 12 [get_debug_ports u_ila_0/probe16]
connect_debug_port u_ila_0/probe16 [get_nets [list {stcDemod/phase[0]} {stcDemod/phase[1]} {stcDemod/phase[2]} {stcDemod/phase[3]} {stcDemod/phase[4]} {stcDemod/phase[5]} {stcDemod/phase[6]} {stcDemod/phase[7]} {stcDemod/phase[8]} {stcDemod/phase[9]} {stcDemod/phase[10]} {stcDemod/phase[11]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe17]
set_property port_width 18 [get_debug_ports u_ila_0/probe17]
connect_debug_port u_ila_0/probe17 [get_nets [list {stcDemod/PD_u/AbsCntr0_Ila[0]} {stcDemod/PD_u/AbsCntr0_Ila[1]} {stcDemod/PD_u/AbsCntr0_Ila[2]} {stcDemod/PD_u/AbsCntr0_Ila[3]} {stcDemod/PD_u/AbsCntr0_Ila[4]} {stcDemod/PD_u/AbsCntr0_Ila[5]} {stcDemod/PD_u/AbsCntr0_Ila[6]} {stcDemod/PD_u/AbsCntr0_Ila[7]} {stcDemod/PD_u/AbsCntr0_Ila[8]} {stcDemod/PD_u/AbsCntr0_Ila[9]} {stcDemod/PD_u/AbsCntr0_Ila[10]} {stcDemod/PD_u/AbsCntr0_Ila[11]} {stcDemod/PD_u/AbsCntr0_Ila[12]} {stcDemod/PD_u/AbsCntr0_Ila[13]} {stcDemod/PD_u/AbsCntr0_Ila[14]} {stcDemod/PD_u/AbsCntr0_Ila[15]} {stcDemod/PD_u/AbsCntr0_Ila[16]} {stcDemod/PD_u/AbsCntr0_Ila[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe18]
set_property port_width 18 [get_debug_ports u_ila_0/probe18]
connect_debug_port u_ila_0/probe18 [get_nets [list {stcDemod/PD_u/AbsCntr1_Ila[0]} {stcDemod/PD_u/AbsCntr1_Ila[1]} {stcDemod/PD_u/AbsCntr1_Ila[2]} {stcDemod/PD_u/AbsCntr1_Ila[3]} {stcDemod/PD_u/AbsCntr1_Ila[4]} {stcDemod/PD_u/AbsCntr1_Ila[5]} {stcDemod/PD_u/AbsCntr1_Ila[6]} {stcDemod/PD_u/AbsCntr1_Ila[7]} {stcDemod/PD_u/AbsCntr1_Ila[8]} {stcDemod/PD_u/AbsCntr1_Ila[9]} {stcDemod/PD_u/AbsCntr1_Ila[10]} {stcDemod/PD_u/AbsCntr1_Ila[11]} {stcDemod/PD_u/AbsCntr1_Ila[12]} {stcDemod/PD_u/AbsCntr1_Ila[13]} {stcDemod/PD_u/AbsCntr1_Ila[14]} {stcDemod/PD_u/AbsCntr1_Ila[15]} {stcDemod/PD_u/AbsCntr1_Ila[16]} {stcDemod/PD_u/AbsCntr1_Ila[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe19]
set_property port_width 10 [get_debug_ports u_ila_0/probe19]
connect_debug_port u_ila_0/probe19 [get_nets [list {stcDemod/PD_u/AbsIndex[0]} {stcDemod/PD_u/AbsIndex[1]} {stcDemod/PD_u/AbsIndex[2]} {stcDemod/PD_u/AbsIndex[3]} {stcDemod/PD_u/AbsIndex[4]} {stcDemod/PD_u/AbsIndex[5]} {stcDemod/PD_u/AbsIndex[6]} {stcDemod/PD_u/AbsIndex[7]} {stcDemod/PD_u/AbsIndex[8]} {stcDemod/PD_u/AbsIndex[9]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe20]
set_property port_width 18 [get_debug_ports u_ila_0/probe20]
connect_debug_port u_ila_0/probe20 [get_nets [list {stcDemod/PD_u/Peak1_Ila[0]} {stcDemod/PD_u/Peak1_Ila[1]} {stcDemod/PD_u/Peak1_Ila[2]} {stcDemod/PD_u/Peak1_Ila[3]} {stcDemod/PD_u/Peak1_Ila[4]} {stcDemod/PD_u/Peak1_Ila[5]} {stcDemod/PD_u/Peak1_Ila[6]} {stcDemod/PD_u/Peak1_Ila[7]} {stcDemod/PD_u/Peak1_Ila[8]} {stcDemod/PD_u/Peak1_Ila[9]} {stcDemod/PD_u/Peak1_Ila[10]} {stcDemod/PD_u/Peak1_Ila[11]} {stcDemod/PD_u/Peak1_Ila[12]} {stcDemod/PD_u/Peak1_Ila[13]} {stcDemod/PD_u/Peak1_Ila[14]} {stcDemod/PD_u/Peak1_Ila[15]} {stcDemod/PD_u/Peak1_Ila[16]} {stcDemod/PD_u/Peak1_Ila[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe21]
set_property port_width 18 [get_debug_ports u_ila_0/probe21]
connect_debug_port u_ila_0/probe21 [get_nets [list {stcDemod/PD_u/Peak2_Ila[0]} {stcDemod/PD_u/Peak2_Ila[1]} {stcDemod/PD_u/Peak2_Ila[2]} {stcDemod/PD_u/Peak2_Ila[3]} {stcDemod/PD_u/Peak2_Ila[4]} {stcDemod/PD_u/Peak2_Ila[5]} {stcDemod/PD_u/Peak2_Ila[6]} {stcDemod/PD_u/Peak2_Ila[7]} {stcDemod/PD_u/Peak2_Ila[8]} {stcDemod/PD_u/Peak2_Ila[9]} {stcDemod/PD_u/Peak2_Ila[10]} {stcDemod/PD_u/Peak2_Ila[11]} {stcDemod/PD_u/Peak2_Ila[12]} {stcDemod/PD_u/Peak2_Ila[13]} {stcDemod/PD_u/Peak2_Ila[14]} {stcDemod/PD_u/Peak2_Ila[15]} {stcDemod/PD_u/Peak2_Ila[16]} {stcDemod/PD_u/Peak2_Ila[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe22]
set_property port_width 2 [get_debug_ports u_ila_0/probe22]
connect_debug_port u_ila_0/probe22 [get_nets [list {stcDemod/PS_u/MissedCnt[0]} {stcDemod/PS_u/MissedCnt[1]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe23]
set_property port_width 16 [get_debug_ports u_ila_0/probe23]
connect_debug_port u_ila_0/probe23 [get_nets [list {stcDemod/PS_u/RdAddr[0]} {stcDemod/PS_u/RdAddr[1]} {stcDemod/PS_u/RdAddr[2]} {stcDemod/PS_u/RdAddr[3]} {stcDemod/PS_u/RdAddr[4]} {stcDemod/PS_u/RdAddr[5]} {stcDemod/PS_u/RdAddr[6]} {stcDemod/PS_u/RdAddr[7]} {stcDemod/PS_u/RdAddr[8]} {stcDemod/PS_u/RdAddr[9]} {stcDemod/PS_u/RdAddr[10]} {stcDemod/PS_u/RdAddr[11]} {stcDemod/PS_u/RdAddr[12]} {stcDemod/PS_u/RdAddr[13]} {stcDemod/PS_u/RdAddr[14]} {stcDemod/PS_u/RdAddr[15]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe24]
set_property port_width 16 [get_debug_ports u_ila_0/probe24]
connect_debug_port u_ila_0/probe24 [get_nets [list {stcDemod/PS_u/WrAddr[0]} {stcDemod/PS_u/WrAddr[1]} {stcDemod/PS_u/WrAddr[2]} {stcDemod/PS_u/WrAddr[3]} {stcDemod/PS_u/WrAddr[4]} {stcDemod/PS_u/WrAddr[5]} {stcDemod/PS_u/WrAddr[6]} {stcDemod/PS_u/WrAddr[7]} {stcDemod/PS_u/WrAddr[8]} {stcDemod/PS_u/WrAddr[9]} {stcDemod/PS_u/WrAddr[10]} {stcDemod/PS_u/WrAddr[11]} {stcDemod/PS_u/WrAddr[12]} {stcDemod/PS_u/WrAddr[13]} {stcDemod/PS_u/WrAddr[14]} {stcDemod/PS_u/WrAddr[15]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe25]
set_property port_width 32 [get_debug_ports u_ila_0/probe25]
connect_debug_port u_ila_0/probe25 [get_nets [list {stcDdc/sampleFreq[0]} {stcDdc/sampleFreq[1]} {stcDdc/sampleFreq[2]} {stcDdc/sampleFreq[3]} {stcDdc/sampleFreq[4]} {stcDdc/sampleFreq[5]} {stcDdc/sampleFreq[6]} {stcDdc/sampleFreq[7]} {stcDdc/sampleFreq[8]} {stcDdc/sampleFreq[9]} {stcDdc/sampleFreq[10]} {stcDdc/sampleFreq[11]} {stcDdc/sampleFreq[12]} {stcDdc/sampleFreq[13]} {stcDdc/sampleFreq[14]} {stcDdc/sampleFreq[15]} {stcDdc/sampleFreq[16]} {stcDdc/sampleFreq[17]} {stcDdc/sampleFreq[18]} {stcDdc/sampleFreq[19]} {stcDdc/sampleFreq[20]} {stcDdc/sampleFreq[21]} {stcDdc/sampleFreq[22]} {stcDdc/sampleFreq[23]} {stcDdc/sampleFreq[24]} {stcDdc/sampleFreq[25]} {stcDdc/sampleFreq[26]} {stcDdc/sampleFreq[27]} {stcDdc/sampleFreq[28]} {stcDdc/sampleFreq[29]} {stcDdc/sampleFreq[30]} {stcDdc/sampleFreq[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe26]
set_property port_width 32 [get_debug_ports u_ila_0/probe26]
connect_debug_port u_ila_0/probe26 [get_nets [list {stcDdc/carrierLeadFreq[0]} {stcDdc/carrierLeadFreq[1]} {stcDdc/carrierLeadFreq[2]} {stcDdc/carrierLeadFreq[3]} {stcDdc/carrierLeadFreq[4]} {stcDdc/carrierLeadFreq[5]} {stcDdc/carrierLeadFreq[6]} {stcDdc/carrierLeadFreq[7]} {stcDdc/carrierLeadFreq[8]} {stcDdc/carrierLeadFreq[9]} {stcDdc/carrierLeadFreq[10]} {stcDdc/carrierLeadFreq[11]} {stcDdc/carrierLeadFreq[12]} {stcDdc/carrierLeadFreq[13]} {stcDdc/carrierLeadFreq[14]} {stcDdc/carrierLeadFreq[15]} {stcDdc/carrierLeadFreq[16]} {stcDdc/carrierLeadFreq[17]} {stcDdc/carrierLeadFreq[18]} {stcDdc/carrierLeadFreq[19]} {stcDdc/carrierLeadFreq[20]} {stcDdc/carrierLeadFreq[21]} {stcDdc/carrierLeadFreq[22]} {stcDdc/carrierLeadFreq[23]} {stcDdc/carrierLeadFreq[24]} {stcDdc/carrierLeadFreq[25]} {stcDdc/carrierLeadFreq[26]} {stcDdc/carrierLeadFreq[27]} {stcDdc/carrierLeadFreq[28]} {stcDdc/carrierLeadFreq[29]} {stcDdc/carrierLeadFreq[30]} {stcDdc/carrierLeadFreq[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe27]
set_property port_width 32 [get_debug_ports u_ila_0/probe27]
connect_debug_port u_ila_0/probe27 [get_nets [list {stcDdc/carrierFreqOffset[0]} {stcDdc/carrierFreqOffset[1]} {stcDdc/carrierFreqOffset[2]} {stcDdc/carrierFreqOffset[3]} {stcDdc/carrierFreqOffset[4]} {stcDdc/carrierFreqOffset[5]} {stcDdc/carrierFreqOffset[6]} {stcDdc/carrierFreqOffset[7]} {stcDdc/carrierFreqOffset[8]} {stcDdc/carrierFreqOffset[9]} {stcDdc/carrierFreqOffset[10]} {stcDdc/carrierFreqOffset[11]} {stcDdc/carrierFreqOffset[12]} {stcDdc/carrierFreqOffset[13]} {stcDdc/carrierFreqOffset[14]} {stcDdc/carrierFreqOffset[15]} {stcDdc/carrierFreqOffset[16]} {stcDdc/carrierFreqOffset[17]} {stcDdc/carrierFreqOffset[18]} {stcDdc/carrierFreqOffset[19]} {stcDdc/carrierFreqOffset[20]} {stcDdc/carrierFreqOffset[21]} {stcDdc/carrierFreqOffset[22]} {stcDdc/carrierFreqOffset[23]} {stcDdc/carrierFreqOffset[24]} {stcDdc/carrierFreqOffset[25]} {stcDdc/carrierFreqOffset[26]} {stcDdc/carrierFreqOffset[27]} {stcDdc/carrierFreqOffset[28]} {stcDdc/carrierFreqOffset[29]} {stcDdc/carrierFreqOffset[30]} {stcDdc/carrierFreqOffset[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe28]
set_property port_width 32 [get_debug_ports u_ila_0/probe28]
connect_debug_port u_ila_0/probe28 [get_nets [list {stcDdc/ddc/ddcFreq[0]} {stcDdc/ddc/ddcFreq[1]} {stcDdc/ddc/ddcFreq[2]} {stcDdc/ddc/ddcFreq[3]} {stcDdc/ddc/ddcFreq[4]} {stcDdc/ddc/ddcFreq[5]} {stcDdc/ddc/ddcFreq[6]} {stcDdc/ddc/ddcFreq[7]} {stcDdc/ddc/ddcFreq[8]} {stcDdc/ddc/ddcFreq[9]} {stcDdc/ddc/ddcFreq[10]} {stcDdc/ddc/ddcFreq[11]} {stcDdc/ddc/ddcFreq[12]} {stcDdc/ddc/ddcFreq[13]} {stcDdc/ddc/ddcFreq[14]} {stcDdc/ddc/ddcFreq[15]} {stcDdc/ddc/ddcFreq[16]} {stcDdc/ddc/ddcFreq[17]} {stcDdc/ddc/ddcFreq[18]} {stcDdc/ddc/ddcFreq[19]} {stcDdc/ddc/ddcFreq[20]} {stcDdc/ddc/ddcFreq[21]} {stcDdc/ddc/ddcFreq[22]} {stcDdc/ddc/ddcFreq[23]} {stcDdc/ddc/ddcFreq[24]} {stcDdc/ddc/ddcFreq[25]} {stcDdc/ddc/ddcFreq[26]} {stcDdc/ddc/ddcFreq[27]} {stcDdc/ddc/ddcFreq[28]} {stcDdc/ddc/ddcFreq[29]} {stcDdc/ddc/ddcFreq[30]} {stcDdc/ddc/ddcFreq[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe29]
set_property port_width 32 [get_debug_ports u_ila_0/probe29]
connect_debug_port u_ila_0/probe29 [get_nets [list {stcDdc/ddc/newOffset[0]} {stcDdc/ddc/newOffset[1]} {stcDdc/ddc/newOffset[2]} {stcDdc/ddc/newOffset[3]} {stcDdc/ddc/newOffset[4]} {stcDdc/ddc/newOffset[5]} {stcDdc/ddc/newOffset[6]} {stcDdc/ddc/newOffset[7]} {stcDdc/ddc/newOffset[8]} {stcDdc/ddc/newOffset[9]} {stcDdc/ddc/newOffset[10]} {stcDdc/ddc/newOffset[11]} {stcDdc/ddc/newOffset[12]} {stcDdc/ddc/newOffset[13]} {stcDdc/ddc/newOffset[14]} {stcDdc/ddc/newOffset[15]} {stcDdc/ddc/newOffset[16]} {stcDdc/ddc/newOffset[17]} {stcDdc/ddc/newOffset[18]} {stcDdc/ddc/newOffset[19]} {stcDdc/ddc/newOffset[20]} {stcDdc/ddc/newOffset[21]} {stcDdc/ddc/newOffset[22]} {stcDdc/ddc/newOffset[23]} {stcDdc/ddc/newOffset[24]} {stcDdc/ddc/newOffset[25]} {stcDdc/ddc/newOffset[26]} {stcDdc/ddc/newOffset[27]} {stcDdc/ddc/newOffset[28]} {stcDdc/ddc/newOffset[29]} {stcDdc/ddc/newOffset[30]} {stcDdc/ddc/newOffset[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe30]
set_property port_width 32 [get_debug_ports u_ila_0/probe30]
connect_debug_port u_ila_0/probe30 [get_nets [list {stcDdc/ddc/newLead[0]} {stcDdc/ddc/newLead[1]} {stcDdc/ddc/newLead[2]} {stcDdc/ddc/newLead[3]} {stcDdc/ddc/newLead[4]} {stcDdc/ddc/newLead[5]} {stcDdc/ddc/newLead[6]} {stcDdc/ddc/newLead[7]} {stcDdc/ddc/newLead[8]} {stcDdc/ddc/newLead[9]} {stcDdc/ddc/newLead[10]} {stcDdc/ddc/newLead[11]} {stcDdc/ddc/newLead[12]} {stcDdc/ddc/newLead[13]} {stcDdc/ddc/newLead[14]} {stcDdc/ddc/newLead[15]} {stcDdc/ddc/newLead[16]} {stcDdc/ddc/newLead[17]} {stcDdc/ddc/newLead[18]} {stcDdc/ddc/newLead[19]} {stcDdc/ddc/newLead[20]} {stcDdc/ddc/newLead[21]} {stcDdc/ddc/newLead[22]} {stcDdc/ddc/newLead[23]} {stcDdc/ddc/newLead[24]} {stcDdc/ddc/newLead[25]} {stcDdc/ddc/newLead[26]} {stcDdc/ddc/newLead[27]} {stcDdc/ddc/newLead[28]} {stcDdc/ddc/newLead[29]} {stcDdc/ddc/newLead[30]} {stcDdc/ddc/newLead[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe31]
set_property port_width 16 [get_debug_ports u_ila_0/probe31]
connect_debug_port u_ila_0/probe31 [get_nets [list {nbAgcGain[0]} {nbAgcGain[1]} {nbAgcGain[2]} {nbAgcGain[3]} {nbAgcGain[4]} {nbAgcGain[10]} {nbAgcGain[11]} {nbAgcGain[12]} {nbAgcGain[13]} {nbAgcGain[14]} {nbAgcGain[15]} {nbAgcGain[16]} {nbAgcGain[17]} {nbAgcGain[18]} {nbAgcGain[19]} {nbAgcGain[20]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe32]
set_property port_width 1 [get_debug_ports u_ila_0/probe32]
connect_debug_port u_ila_0/probe32 [get_nets [list stcDemod/Brik2_u/ChanEstDone]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe33]
set_property port_width 1 [get_debug_ports u_ila_0/probe33]
connect_debug_port u_ila_0/probe33 [get_nets [list stcDemod/ClkOutEn]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe34]
set_property port_width 1 [get_debug_ports u_ila_0/probe34]
connect_debug_port u_ila_0/probe34 [get_nets [list stcDemod/DataOut]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe35]
set_property port_width 1 [get_debug_ports u_ila_0/probe35]
connect_debug_port u_ila_0/probe35 [get_nets [list stcDemod/EstimatesDone]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe36]
set_property port_width 1 [get_debug_ports u_ila_0/probe36]
connect_debug_port u_ila_0/probe36 [get_nets [list stcDemod/Mag0GtMag1]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe37]
set_property port_width 1 [get_debug_ports u_ila_0/probe37]
connect_debug_port u_ila_0/probe37 [get_nets [list stcDemod/PS_u/Missed]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe38]
set_property port_width 1 [get_debug_ports u_ila_0/probe38]
connect_debug_port u_ila_0/probe38 [get_nets [list stcDemod/PD_u/PilotFound]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe39]
set_property port_width 1 [get_debug_ports u_ila_0/probe39]
connect_debug_port u_ila_0/probe39 [get_nets [list stcDemod/PilotFoundCE]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe40]
set_property port_width 1 [get_debug_ports u_ila_0/probe40]
connect_debug_port u_ila_0/probe40 [get_nets [list stcDemod/PilotFoundPD]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe41]
set_property port_width 1 [get_debug_ports u_ila_0/probe41]
connect_debug_port u_ila_0/probe41 [get_nets [list stcDemod/PS_u/PilotPulseIn]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe42]
set_property port_width 1 [get_debug_ports u_ila_0/probe42]
connect_debug_port u_ila_0/probe42 [get_nets [list stcDemod/PS_u/PilotValid]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe43]
set_property port_width 1 [get_debug_ports u_ila_0/probe43]
connect_debug_port u_ila_0/probe43 [get_nets [list stcDemod/PrnErrors]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe44]
set_property port_width 1 [get_debug_ports u_ila_0/probe44]
connect_debug_port u_ila_0/probe44 [get_nets [list stcDemod/StartIla]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe45]
set_property port_width 1 [get_debug_ports u_ila_0/probe45]
connect_debug_port u_ila_0/probe45 [get_nets [list stcDemod/StartOfFrame]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe46]
set_property port_width 1 [get_debug_ports u_ila_0/probe46]
connect_debug_port u_ila_0/probe46 [get_nets [list stcDemod/PS_u/StartOut]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe47]
set_property port_width 1 [get_debug_ports u_ila_0/probe47]
connect_debug_port u_ila_0/probe47 [get_nets [list stcDemod/ValidData2047]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe48]
set_property port_width 1 [get_debug_ports u_ila_0/probe48]
connect_debug_port u_ila_0/probe48 [get_nets [list stcDemod/ValidIla]]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets clk2x]
