
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
connect_debug_port u_ila_0/clk [get_nets [list systemClock/inst/clk186]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe0]
set_property port_width 14 [get_debug_ports u_ila_0/probe0]
connect_debug_port u_ila_0/probe0 [get_nets [list {stcDemod/FD/FifoDepth[0]} {stcDemod/FD/FifoDepth[1]} {stcDemod/FD/FifoDepth[2]} {stcDemod/FD/FifoDepth[3]} {stcDemod/FD/FifoDepth[4]} {stcDemod/FD/FifoDepth[5]} {stcDemod/FD/FifoDepth[6]} {stcDemod/FD/FifoDepth[7]} {stcDemod/FD/FifoDepth[8]} {stcDemod/FD/FifoDepth[9]} {stcDemod/FD/FifoDepth[10]} {stcDemod/FD/FifoDepth[11]} {stcDemod/FD/FifoDepth[12]} {stcDemod/FD/FifoDepth[13]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe1]
set_property port_width 13 [get_debug_ports u_ila_0/probe1]
connect_debug_port u_ila_0/probe1 [get_nets [list {stcDemod/H1Mag[0]} {stcDemod/H1Mag[1]} {stcDemod/H1Mag[2]} {stcDemod/H1Mag[3]} {stcDemod/H1Mag[4]} {stcDemod/H1Mag[5]} {stcDemod/H1Mag[6]} {stcDemod/H1Mag[7]} {stcDemod/H1Mag[8]} {stcDemod/H1Mag[9]} {stcDemod/H1Mag[10]} {stcDemod/H1Mag[11]} {stcDemod/H1Mag[12]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe2]
set_property port_width 10 [get_debug_ports u_ila_0/probe2]
connect_debug_port u_ila_0/probe2 [get_nets [list {stcDemod/DataAddr[0]} {stcDemod/DataAddr[1]} {stcDemod/DataAddr[2]} {stcDemod/DataAddr[3]} {stcDemod/DataAddr[4]} {stcDemod/DataAddr[5]} {stcDemod/DataAddr[6]} {stcDemod/DataAddr[7]} {stcDemod/DataAddr[8]} {stcDemod/DataAddr[9]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe3]
set_property port_width 13 [get_debug_ports u_ila_0/probe3]
connect_debug_port u_ila_0/probe3 [get_nets [list {stcDemod/H0Mag[0]} {stcDemod/H0Mag[1]} {stcDemod/H0Mag[2]} {stcDemod/H0Mag[3]} {stcDemod/H0Mag[4]} {stcDemod/H0Mag[5]} {stcDemod/H0Mag[6]} {stcDemod/H0Mag[7]} {stcDemod/H0Mag[8]} {stcDemod/H0Mag[9]} {stcDemod/H0Mag[10]} {stcDemod/H0Mag[11]} {stcDemod/H0Mag[12]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe4]
set_property port_width 9 [get_debug_ports u_ila_0/probe4]
connect_debug_port u_ila_0/probe4 [get_nets [list {stcDemod/PilotOffset[0]} {stcDemod/PilotOffset[1]} {stcDemod/PilotOffset[2]} {stcDemod/PilotOffset[3]} {stcDemod/PilotOffset[4]} {stcDemod/PilotOffset[5]} {stcDemod/PilotOffset[6]} {stcDemod/PilotOffset[7]} {stcDemod/PilotOffset[8]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe5]
set_property port_width 18 [get_debug_ports u_ila_0/probe5]
connect_debug_port u_ila_0/probe5 [get_nets [list {stcDemod/MagRSlv[0]} {stcDemod/MagRSlv[1]} {stcDemod/MagRSlv[2]} {stcDemod/MagRSlv[3]} {stcDemod/MagRSlv[4]} {stcDemod/MagRSlv[5]} {stcDemod/MagRSlv[6]} {stcDemod/MagRSlv[7]} {stcDemod/MagRSlv[8]} {stcDemod/MagRSlv[9]} {stcDemod/MagRSlv[10]} {stcDemod/MagRSlv[11]} {stcDemod/MagRSlv[12]} {stcDemod/MagRSlv[13]} {stcDemod/MagRSlv[14]} {stcDemod/MagRSlv[15]} {stcDemod/MagRSlv[16]} {stcDemod/MagRSlv[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe6]
set_property port_width 18 [get_debug_ports u_ila_0/probe6]
connect_debug_port u_ila_0/probe6 [get_nets [list {stcDemod/InRBrik2Ila[0]} {stcDemod/InRBrik2Ila[1]} {stcDemod/InRBrik2Ila[2]} {stcDemod/InRBrik2Ila[3]} {stcDemod/InRBrik2Ila[4]} {stcDemod/InRBrik2Ila[5]} {stcDemod/InRBrik2Ila[6]} {stcDemod/InRBrik2Ila[7]} {stcDemod/InRBrik2Ila[8]} {stcDemod/InRBrik2Ila[9]} {stcDemod/InRBrik2Ila[10]} {stcDemod/InRBrik2Ila[11]} {stcDemod/InRBrik2Ila[12]} {stcDemod/InRBrik2Ila[13]} {stcDemod/InRBrik2Ila[14]} {stcDemod/InRBrik2Ila[15]} {stcDemod/InRBrik2Ila[16]} {stcDemod/InRBrik2Ila[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe7]
set_property port_width 18 [get_debug_ports u_ila_0/probe7]
connect_debug_port u_ila_0/probe7 [get_nets [list {stcDemod/MagISlv[0]} {stcDemod/MagISlv[1]} {stcDemod/MagISlv[2]} {stcDemod/MagISlv[3]} {stcDemod/MagISlv[4]} {stcDemod/MagISlv[5]} {stcDemod/MagISlv[6]} {stcDemod/MagISlv[7]} {stcDemod/MagISlv[8]} {stcDemod/MagISlv[9]} {stcDemod/MagISlv[10]} {stcDemod/MagISlv[11]} {stcDemod/MagISlv[12]} {stcDemod/MagISlv[13]} {stcDemod/MagISlv[14]} {stcDemod/MagISlv[15]} {stcDemod/MagISlv[16]} {stcDemod/MagISlv[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe8]
set_property port_width 18 [get_debug_ports u_ila_0/probe8]
connect_debug_port u_ila_0/probe8 [get_nets [list {stcDemod/InIBrik2Ila[0]} {stcDemod/InIBrik2Ila[1]} {stcDemod/InIBrik2Ila[2]} {stcDemod/InIBrik2Ila[3]} {stcDemod/InIBrik2Ila[4]} {stcDemod/InIBrik2Ila[5]} {stcDemod/InIBrik2Ila[6]} {stcDemod/InIBrik2Ila[7]} {stcDemod/InIBrik2Ila[8]} {stcDemod/InIBrik2Ila[9]} {stcDemod/InIBrik2Ila[10]} {stcDemod/InIBrik2Ila[11]} {stcDemod/InIBrik2Ila[12]} {stcDemod/InIBrik2Ila[13]} {stcDemod/InIBrik2Ila[14]} {stcDemod/InIBrik2Ila[15]} {stcDemod/InIBrik2Ila[16]} {stcDemod/InIBrik2Ila[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe9]
set_property port_width 12 [get_debug_ports u_ila_0/probe9]
connect_debug_port u_ila_0/probe9 [get_nets [list {stcDemod/PhaseDiffs[0]} {stcDemod/PhaseDiffs[1]} {stcDemod/PhaseDiffs[2]} {stcDemod/PhaseDiffs[3]} {stcDemod/PhaseDiffs[4]} {stcDemod/PhaseDiffs[5]} {stcDemod/PhaseDiffs[6]} {stcDemod/PhaseDiffs[7]} {stcDemod/PhaseDiffs[8]} {stcDemod/PhaseDiffs[9]} {stcDemod/PhaseDiffs[10]} {stcDemod/PhaseDiffs[11]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe10]
set_property port_width 4 [get_debug_ports u_ila_0/probe10]
connect_debug_port u_ila_0/probe10 [get_nets [list {stcDemod/TrellisBits[0]} {stcDemod/TrellisBits[1]} {stcDemod/TrellisBits[2]} {stcDemod/TrellisBits[3]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe11]
set_property port_width 6 [get_debug_ports u_ila_0/probe11]
connect_debug_port u_ila_0/probe11 [get_nets [list {stcDemod/deltaTauEstSlv[0]} {stcDemod/deltaTauEstSlv[1]} {stcDemod/deltaTauEstSlv[2]} {stcDemod/deltaTauEstSlv[3]} {stcDemod/deltaTauEstSlv[4]} {stcDemod/deltaTauEstSlv[5]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe12]
set_property port_width 4 [get_debug_ports u_ila_0/probe12]
connect_debug_port u_ila_0/probe12 [get_nets [list {stcDemod/m_ndx0Slv[0]} {stcDemod/m_ndx0Slv[1]} {stcDemod/m_ndx0Slv[2]} {stcDemod/m_ndx0Slv[3]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe13]
set_property port_width 4 [get_debug_ports u_ila_0/probe13]
connect_debug_port u_ila_0/probe13 [get_nets [list {stcDemod/m_ndx1Slv[0]} {stcDemod/m_ndx1Slv[1]} {stcDemod/m_ndx1Slv[2]} {stcDemod/m_ndx1Slv[3]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe14]
set_property port_width 18 [get_debug_ports u_ila_0/probe14]
connect_debug_port u_ila_0/probe14 [get_nets [list {stcDemod/PD_u/Peak3_Ila[0]} {stcDemod/PD_u/Peak3_Ila[1]} {stcDemod/PD_u/Peak3_Ila[2]} {stcDemod/PD_u/Peak3_Ila[3]} {stcDemod/PD_u/Peak3_Ila[4]} {stcDemod/PD_u/Peak3_Ila[5]} {stcDemod/PD_u/Peak3_Ila[6]} {stcDemod/PD_u/Peak3_Ila[7]} {stcDemod/PD_u/Peak3_Ila[8]} {stcDemod/PD_u/Peak3_Ila[9]} {stcDemod/PD_u/Peak3_Ila[10]} {stcDemod/PD_u/Peak3_Ila[11]} {stcDemod/PD_u/Peak3_Ila[12]} {stcDemod/PD_u/Peak3_Ila[13]} {stcDemod/PD_u/Peak3_Ila[14]} {stcDemod/PD_u/Peak3_Ila[15]} {stcDemod/PD_u/Peak3_Ila[16]} {stcDemod/PD_u/Peak3_Ila[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe15]
set_property port_width 18 [get_debug_ports u_ila_0/probe15]
connect_debug_port u_ila_0/probe15 [get_nets [list {stcDemod/PD_u/Peak1_Ila[0]} {stcDemod/PD_u/Peak1_Ila[1]} {stcDemod/PD_u/Peak1_Ila[2]} {stcDemod/PD_u/Peak1_Ila[3]} {stcDemod/PD_u/Peak1_Ila[4]} {stcDemod/PD_u/Peak1_Ila[5]} {stcDemod/PD_u/Peak1_Ila[6]} {stcDemod/PD_u/Peak1_Ila[7]} {stcDemod/PD_u/Peak1_Ila[8]} {stcDemod/PD_u/Peak1_Ila[9]} {stcDemod/PD_u/Peak1_Ila[10]} {stcDemod/PD_u/Peak1_Ila[11]} {stcDemod/PD_u/Peak1_Ila[12]} {stcDemod/PD_u/Peak1_Ila[13]} {stcDemod/PD_u/Peak1_Ila[14]} {stcDemod/PD_u/Peak1_Ila[15]} {stcDemod/PD_u/Peak1_Ila[16]} {stcDemod/PD_u/Peak1_Ila[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe16]
set_property port_width 18 [get_debug_ports u_ila_0/probe16]
connect_debug_port u_ila_0/probe16 [get_nets [list {stcDemod/PD_u/AbsCntr1_Ila[0]} {stcDemod/PD_u/AbsCntr1_Ila[1]} {stcDemod/PD_u/AbsCntr1_Ila[2]} {stcDemod/PD_u/AbsCntr1_Ila[3]} {stcDemod/PD_u/AbsCntr1_Ila[4]} {stcDemod/PD_u/AbsCntr1_Ila[5]} {stcDemod/PD_u/AbsCntr1_Ila[6]} {stcDemod/PD_u/AbsCntr1_Ila[7]} {stcDemod/PD_u/AbsCntr1_Ila[8]} {stcDemod/PD_u/AbsCntr1_Ila[9]} {stcDemod/PD_u/AbsCntr1_Ila[10]} {stcDemod/PD_u/AbsCntr1_Ila[11]} {stcDemod/PD_u/AbsCntr1_Ila[12]} {stcDemod/PD_u/AbsCntr1_Ila[13]} {stcDemod/PD_u/AbsCntr1_Ila[14]} {stcDemod/PD_u/AbsCntr1_Ila[15]} {stcDemod/PD_u/AbsCntr1_Ila[16]} {stcDemod/PD_u/AbsCntr1_Ila[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe17]
set_property port_width 18 [get_debug_ports u_ila_0/probe17]
connect_debug_port u_ila_0/probe17 [get_nets [list {stcDemod/PD_u/AbsCntr0_Ila[0]} {stcDemod/PD_u/AbsCntr0_Ila[1]} {stcDemod/PD_u/AbsCntr0_Ila[2]} {stcDemod/PD_u/AbsCntr0_Ila[3]} {stcDemod/PD_u/AbsCntr0_Ila[4]} {stcDemod/PD_u/AbsCntr0_Ila[5]} {stcDemod/PD_u/AbsCntr0_Ila[6]} {stcDemod/PD_u/AbsCntr0_Ila[7]} {stcDemod/PD_u/AbsCntr0_Ila[8]} {stcDemod/PD_u/AbsCntr0_Ila[9]} {stcDemod/PD_u/AbsCntr0_Ila[10]} {stcDemod/PD_u/AbsCntr0_Ila[11]} {stcDemod/PD_u/AbsCntr0_Ila[12]} {stcDemod/PD_u/AbsCntr0_Ila[13]} {stcDemod/PD_u/AbsCntr0_Ila[14]} {stcDemod/PD_u/AbsCntr0_Ila[15]} {stcDemod/PD_u/AbsCntr0_Ila[16]} {stcDemod/PD_u/AbsCntr0_Ila[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe18]
set_property port_width 22 [get_debug_ports u_ila_0/probe18]
connect_debug_port u_ila_0/probe18 [get_nets [list {stcDdc/channelAGC/chAgcLoopFilter/leadError[9]} {stcDdc/channelAGC/chAgcLoopFilter/leadError[10]} {stcDdc/channelAGC/chAgcLoopFilter/leadError[11]} {stcDdc/channelAGC/chAgcLoopFilter/leadError[12]} {stcDdc/channelAGC/chAgcLoopFilter/leadError[13]} {stcDdc/channelAGC/chAgcLoopFilter/leadError[14]} {stcDdc/channelAGC/chAgcLoopFilter/leadError[15]} {stcDdc/channelAGC/chAgcLoopFilter/leadError[16]} {stcDdc/channelAGC/chAgcLoopFilter/leadError[17]} {stcDdc/channelAGC/chAgcLoopFilter/leadError[18]} {stcDdc/channelAGC/chAgcLoopFilter/leadError[19]} {stcDdc/channelAGC/chAgcLoopFilter/leadError[20]} {stcDdc/channelAGC/chAgcLoopFilter/leadError[21]} {stcDdc/channelAGC/chAgcLoopFilter/leadError[22]} {stcDdc/channelAGC/chAgcLoopFilter/leadError[23]} {stcDdc/channelAGC/chAgcLoopFilter/leadError[24]} {stcDdc/channelAGC/chAgcLoopFilter/leadError[25]} {stcDdc/channelAGC/chAgcLoopFilter/leadError[26]} {stcDdc/channelAGC/chAgcLoopFilter/leadError[27]} {stcDdc/channelAGC/chAgcLoopFilter/leadError[28]} {stcDdc/channelAGC/chAgcLoopFilter/leadError[29]} {stcDdc/channelAGC/chAgcLoopFilter/leadError[30]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe19]
set_property port_width 32 [get_debug_ports u_ila_0/probe19]
connect_debug_port u_ila_0/probe19 [get_nets [list {pilotFreq[0]} {pilotFreq[1]} {pilotFreq[2]} {pilotFreq[3]} {pilotFreq[4]} {pilotFreq[5]} {pilotFreq[6]} {pilotFreq[7]} {pilotFreq[8]} {pilotFreq[9]} {pilotFreq[10]} {pilotFreq[11]} {pilotFreq[12]} {pilotFreq[13]} {pilotFreq[14]} {pilotFreq[15]} {pilotFreq[16]} {pilotFreq[17]} {pilotFreq[18]} {pilotFreq[19]} {pilotFreq[20]} {pilotFreq[21]} {pilotFreq[22]} {pilotFreq[23]} {pilotFreq[24]} {pilotFreq[25]} {pilotFreq[26]} {pilotFreq[27]} {pilotFreq[28]} {pilotFreq[29]} {pilotFreq[30]} {pilotFreq[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe20]
set_property port_width 13 [get_debug_ports u_ila_0/probe20]
connect_debug_port u_ila_0/probe20 [get_nets [list {stcDdc/magReg[4]} {stcDdc/magReg[5]} {stcDdc/magReg[6]} {stcDdc/magReg[7]} {stcDdc/magReg[8]} {stcDdc/magReg[9]} {stcDdc/magReg[10]} {stcDdc/magReg[11]} {stcDdc/magReg[12]} {stcDdc/magReg[13]} {stcDdc/magReg[14]} {stcDdc/magReg[15]} {stcDdc/magReg[16]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe21]
set_property port_width 9 [get_debug_ports u_ila_0/probe21]
connect_debug_port u_ila_0/probe21 [get_nets [list {stcDdc/PilotOffset[0]} {stcDdc/PilotOffset[1]} {stcDdc/PilotOffset[2]} {stcDdc/PilotOffset[3]} {stcDdc/PilotOffset[4]} {stcDdc/PilotOffset[5]} {stcDdc/PilotOffset[6]} {stcDdc/PilotOffset[7]} {stcDdc/PilotOffset[8]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe22]
set_property port_width 8 [get_debug_ports u_ila_0/probe22]
connect_debug_port u_ila_0/probe22 [get_nets [list {stcDdc/channelAGC/log2Mag[0]} {stcDdc/channelAGC/log2Mag[1]} {stcDdc/channelAGC/log2Mag[2]} {stcDdc/channelAGC/log2Mag[3]} {stcDdc/channelAGC/log2Mag[4]} {stcDdc/channelAGC/log2Mag[5]} {stcDdc/channelAGC/log2Mag[6]} {stcDdc/channelAGC/log2Mag[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe23]
set_property port_width 24 [get_debug_ports u_ila_0/probe23]
connect_debug_port u_ila_0/probe23 [get_nets [list {stcDdc/channelAGC/dataBits_reg[16][0]} {stcDdc/channelAGC/dataBits_reg[16][1]} {stcDdc/channelAGC/dataBits_reg[16][2]} {stcDdc/channelAGC/dataBits_reg[16][3]} {stcDdc/channelAGC/dataBits_reg[16][4]} {stcDdc/channelAGC/dataBits_reg[16][5]} {stcDdc/channelAGC/dataBits_reg[16][6]} {stcDdc/channelAGC/dataBits_reg[16][7]} {stcDdc/channelAGC/dataBits_reg[16][8]} {stcDdc/channelAGC/dataBits_reg[16][9]} {stcDdc/channelAGC/dataBits_reg[16][10]} {stcDdc/channelAGC/dataBits_reg[16][11]} {stcDdc/channelAGC/dataBits_reg[16][12]} {stcDdc/channelAGC/dataBits_reg[16][13]} {stcDdc/channelAGC/dataBits_reg[16][14]} {stcDdc/channelAGC/dataBits_reg[16][15]} {stcDdc/channelAGC/dataBits_reg[16][16]} {stcDdc/channelAGC/dataBits_reg[16][17]} {stcDdc/channelAGC/dataBits_reg[16][18]} {stcDdc/channelAGC/dataBits_reg[16][19]} {stcDdc/channelAGC/dataBits_reg[16][20]} {stcDdc/channelAGC/dataBits_reg[16][21]} {stcDdc/channelAGC/dataBits_reg[16][22]} {stcDdc/channelAGC/dataBits_reg[16][23]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe24]
set_property port_width 2 [get_debug_ports u_ila_0/probe24]
connect_debug_port u_ila_0/probe24 [get_nets [list {stcDdc/channelAGC/clkEnDly[4]} {stcDdc/channelAGC/clkEnDly[6]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe25]
set_property port_width 1 [get_debug_ports u_ila_0/probe25]
connect_debug_port u_ila_0/probe25 [get_nets [list stcDemod/Brik2_u/ChanEstDone]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe26]
set_property port_width 1 [get_debug_ports u_ila_0/probe26]
connect_debug_port u_ila_0/probe26 [get_nets [list stcDemod/ClkOutEn]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe27]
set_property port_width 1 [get_debug_ports u_ila_0/probe27]
connect_debug_port u_ila_0/probe27 [get_nets [list stcDemod/DataOut]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe28]
set_property port_width 1 [get_debug_ports u_ila_0/probe28]
connect_debug_port u_ila_0/probe28 [get_nets [list stcDemod/EstimatesDone]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe29]
set_property port_width 1 [get_debug_ports u_ila_0/probe29]
connect_debug_port u_ila_0/probe29 [get_nets [list stcDemod/Mag0GtMag1]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe30]
set_property port_width 1 [get_debug_ports u_ila_0/probe30]
connect_debug_port u_ila_0/probe30 [get_nets [list stcDemod/PilotFound]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe31]
set_property port_width 1 [get_debug_ports u_ila_0/probe31]
connect_debug_port u_ila_0/probe31 [get_nets [list stcDemod/PilotFoundCE]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe32]
set_property port_width 1 [get_debug_ports u_ila_0/probe32]
connect_debug_port u_ila_0/probe32 [get_nets [list stcDemod/PilotFoundPD]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe33]
set_property port_width 1 [get_debug_ports u_ila_0/probe33]
connect_debug_port u_ila_0/probe33 [get_nets [list pilotFreqAcquired]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe34]
set_property port_width 1 [get_debug_ports u_ila_0/probe34]
connect_debug_port u_ila_0/probe34 [get_nets [list stcDemod/PrnErrors]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe35]
set_property port_width 1 [get_debug_ports u_ila_0/probe35]
connect_debug_port u_ila_0/probe35 [get_nets [list stcDemod/StartIla]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe36]
set_property port_width 1 [get_debug_ports u_ila_0/probe36]
connect_debug_port u_ila_0/probe36 [get_nets [list stcDemod/TrellisOutEn]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe37]
set_property port_width 1 [get_debug_ports u_ila_0/probe37]
connect_debug_port u_ila_0/probe37 [get_nets [list stcDemod/ValidData2047]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe38]
set_property port_width 1 [get_debug_ports u_ila_0/probe38]
connect_debug_port u_ila_0/probe38 [get_nets [list stcDemod/ValidIla]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe39]
set_property port_width 1 [get_debug_ports u_ila_0/probe39]
connect_debug_port u_ila_0/probe39 [get_nets [list stcDdc/channelAGC/mpyMax_n_14]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe40]
set_property port_width 1 [get_debug_ports u_ila_0/probe40]
connect_debug_port u_ila_0/probe40 [get_nets [list stcDdc/channelAGC/mpyMax_n_15]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe41]
set_property port_width 1 [get_debug_ports u_ila_0/probe41]
connect_debug_port u_ila_0/probe41 [get_nets [list stcDdc/channelAGC/mpyMax_n_16]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe42]
set_property port_width 1 [get_debug_ports u_ila_0/probe42]
connect_debug_port u_ila_0/probe42 [get_nets [list stcDdc/channelAGC/mpyMax_n_17]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe43]
set_property port_width 1 [get_debug_ports u_ila_0/probe43]
connect_debug_port u_ila_0/probe43 [get_nets [list stcDdc/channelAGC/mpyMax_n_18]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe44]
set_property port_width 1 [get_debug_ports u_ila_0/probe44]
connect_debug_port u_ila_0/probe44 [get_nets [list stcDdc/channelAGC/mpyMax_n_19]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe45]
set_property port_width 1 [get_debug_ports u_ila_0/probe45]
connect_debug_port u_ila_0/probe45 [get_nets [list stcDdc/channelAGC/mpyMax_n_20]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe46]
set_property port_width 1 [get_debug_ports u_ila_0/probe46]
connect_debug_port u_ila_0/probe46 [get_nets [list stcDdc/channelAGC/mpyMax_n_21]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe47]
set_property port_width 1 [get_debug_ports u_ila_0/probe47]
connect_debug_port u_ila_0/probe47 [get_nets [list stcDdc/channelAGC/mpyMax_n_22]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe48]
set_property port_width 1 [get_debug_ports u_ila_0/probe48]
connect_debug_port u_ila_0/probe48 [get_nets [list stcDdc/channelAGC/mpyMax_n_23]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe49]
set_property port_width 1 [get_debug_ports u_ila_0/probe49]
connect_debug_port u_ila_0/probe49 [get_nets [list stcDdc/channelAGC/mpyMax_n_24]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe50]
set_property port_width 1 [get_debug_ports u_ila_0/probe50]
connect_debug_port u_ila_0/probe50 [get_nets [list stcDdc/channelAGC/mpyMax_n_25]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe51]
set_property port_width 1 [get_debug_ports u_ila_0/probe51]
connect_debug_port u_ila_0/probe51 [get_nets [list stcDdc/channelAGC/mpyMax_n_26]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe52]
set_property port_width 1 [get_debug_ports u_ila_0/probe52]
connect_debug_port u_ila_0/probe52 [get_nets [list stcDdc/channelAGC/mpyMax_n_27]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe53]
set_property port_width 1 [get_debug_ports u_ila_0/probe53]
connect_debug_port u_ila_0/probe53 [get_nets [list stcDdc/channelAGC/mpyMax_n_28]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe54]
set_property port_width 1 [get_debug_ports u_ila_0/probe54]
connect_debug_port u_ila_0/probe54 [get_nets [list stcDdc/channelAGC/mpyMax_n_29]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe55]
set_property port_width 1 [get_debug_ports u_ila_0/probe55]
connect_debug_port u_ila_0/probe55 [get_nets [list stcDdc/channelAGC/PhaseDiffEn]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe56]
set_property port_width 1 [get_debug_ports u_ila_0/probe56]
connect_debug_port u_ila_0/probe56 [get_nets [list {stcDdc/channelAGC/chAgcLoopFilter/leadError_reg_n_1_[0]}]]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets clk2x]
