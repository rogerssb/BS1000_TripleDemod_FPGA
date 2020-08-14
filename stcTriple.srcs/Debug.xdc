
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
connect_debug_port u_ila_0/clk [get_nets [list systemClock/inst/clk93]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe0]
set_property port_width 14 [get_debug_ports u_ila_0/probe0]
connect_debug_port u_ila_0/probe0 [get_nets [list {stcDdc/iSymDataReg[4]} {stcDdc/iSymDataReg[5]} {stcDdc/iSymDataReg[6]} {stcDdc/iSymDataReg[7]} {stcDdc/iSymDataReg[8]} {stcDdc/iSymDataReg[9]} {stcDdc/iSymDataReg[10]} {stcDdc/iSymDataReg[11]} {stcDdc/iSymDataReg[12]} {stcDdc/iSymDataReg[13]} {stcDdc/iSymDataReg[14]} {stcDdc/iSymDataReg[15]} {stcDdc/iSymDataReg[16]} {stcDdc/iSymDataReg[17]}]]
create_debug_core u_ila_1 ila
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_1]
set_property ALL_PROBE_SAME_MU_CNT 4 [get_debug_cores u_ila_1]
set_property C_ADV_TRIGGER true [get_debug_cores u_ila_1]
set_property C_DATA_DEPTH 4096 [get_debug_cores u_ila_1]
set_property C_EN_STRG_QUAL true [get_debug_cores u_ila_1]
set_property C_INPUT_PIPE_STAGES 2 [get_debug_cores u_ila_1]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_1]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_1]
set_property port_width 1 [get_debug_ports u_ila_1/clk]
connect_debug_port u_ila_1/clk [get_nets [list systemClock/inst/clk186]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe0]
set_property port_width 15 [get_debug_ports u_ila_1/probe0]
connect_debug_port u_ila_1/probe0 [get_nets [list {stcDemod/Trellis_u/fa/wrAddr[0]} {stcDemod/Trellis_u/fa/wrAddr[1]} {stcDemod/Trellis_u/fa/wrAddr[2]} {stcDemod/Trellis_u/fa/wrAddr[3]} {stcDemod/Trellis_u/fa/wrAddr[4]} {stcDemod/Trellis_u/fa/wrAddr[5]} {stcDemod/Trellis_u/fa/wrAddr[6]} {stcDemod/Trellis_u/fa/wrAddr[7]} {stcDemod/Trellis_u/fa/wrAddr[8]} {stcDemod/Trellis_u/fa/wrAddr[9]} {stcDemod/Trellis_u/fa/wrAddr[10]} {stcDemod/Trellis_u/fa/wrAddr[11]} {stcDemod/Trellis_u/fa/wrAddr[12]} {stcDemod/Trellis_u/fa/wrAddr[13]} {stcDemod/Trellis_u/fa/wrAddr[14]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe1]
set_property port_width 18 [get_debug_ports u_ila_0/probe1]
connect_debug_port u_ila_0/probe1 [get_nets [list {stcDdc/iDdc[0]} {stcDdc/iDdc[1]} {stcDdc/iDdc[2]} {stcDdc/iDdc[3]} {stcDdc/iDdc[4]} {stcDdc/iDdc[5]} {stcDdc/iDdc[6]} {stcDdc/iDdc[7]} {stcDdc/iDdc[8]} {stcDdc/iDdc[9]} {stcDdc/iDdc[10]} {stcDdc/iDdc[11]} {stcDdc/iDdc[12]} {stcDdc/iDdc[13]} {stcDdc/iDdc[14]} {stcDdc/iDdc[15]} {stcDdc/iDdc[16]} {stcDdc/iDdc[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe2]
set_property port_width 14 [get_debug_ports u_ila_0/probe2]
connect_debug_port u_ila_0/probe2 [get_nets [list {stcDdc/iResampInReg[4]} {stcDdc/iResampInReg[5]} {stcDdc/iResampInReg[6]} {stcDdc/iResampInReg[7]} {stcDdc/iResampInReg[8]} {stcDdc/iResampInReg[9]} {stcDdc/iResampInReg[10]} {stcDdc/iResampInReg[11]} {stcDdc/iResampInReg[12]} {stcDdc/iResampInReg[13]} {stcDdc/iResampInReg[14]} {stcDdc/iResampInReg[15]} {stcDdc/iResampInReg[16]} {stcDdc/iResampInReg[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe3]
set_property port_width 18 [get_debug_ports u_ila_0/probe3]
connect_debug_port u_ila_0/probe3 [get_nets [list {iStc[0]} {iStc[1]} {iStc[2]} {iStc[3]} {iStc[4]} {iStc[5]} {iStc[6]} {iStc[7]} {iStc[8]} {iStc[9]} {iStc[10]} {iStc[11]} {iStc[12]} {iStc[13]} {iStc[14]} {iStc[15]} {iStc[16]} {iStc[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe4]
set_property port_width 18 [get_debug_ports u_ila_0/probe4]
connect_debug_port u_ila_0/probe4 [get_nets [list {iDdc[0]} {iDdc[1]} {iDdc[2]} {iDdc[3]} {iDdc[4]} {iDdc[5]} {iDdc[6]} {iDdc[7]} {iDdc[8]} {iDdc[9]} {iDdc[10]} {iDdc[11]} {iDdc[12]} {iDdc[13]} {iDdc[14]} {iDdc[15]} {iDdc[16]} {iDdc[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe5]
set_property port_width 18 [get_debug_ports u_ila_0/probe5]
connect_debug_port u_ila_0/probe5 [get_nets [list {stcDemod/PD_u/Peak3_Ila[0]} {stcDemod/PD_u/Peak3_Ila[1]} {stcDemod/PD_u/Peak3_Ila[2]} {stcDemod/PD_u/Peak3_Ila[3]} {stcDemod/PD_u/Peak3_Ila[4]} {stcDemod/PD_u/Peak3_Ila[5]} {stcDemod/PD_u/Peak3_Ila[6]} {stcDemod/PD_u/Peak3_Ila[7]} {stcDemod/PD_u/Peak3_Ila[8]} {stcDemod/PD_u/Peak3_Ila[9]} {stcDemod/PD_u/Peak3_Ila[10]} {stcDemod/PD_u/Peak3_Ila[11]} {stcDemod/PD_u/Peak3_Ila[12]} {stcDemod/PD_u/Peak3_Ila[13]} {stcDemod/PD_u/Peak3_Ila[14]} {stcDemod/PD_u/Peak3_Ila[15]} {stcDemod/PD_u/Peak3_Ila[16]} {stcDemod/PD_u/Peak3_Ila[17]}]]
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
set_property port_width 12 [get_debug_ports u_ila_0/probe8]
connect_debug_port u_ila_0/probe8 [get_nets [list {stcDemod/H0PhaseNeg[0]} {stcDemod/H0PhaseNeg[1]} {stcDemod/H0PhaseNeg[2]} {stcDemod/H0PhaseNeg[3]} {stcDemod/H0PhaseNeg[4]} {stcDemod/H0PhaseNeg[5]} {stcDemod/H0PhaseNeg[6]} {stcDemod/H0PhaseNeg[7]} {stcDemod/H0PhaseNeg[8]} {stcDemod/H0PhaseNeg[9]} {stcDemod/H0PhaseNeg[10]} {stcDemod/H0PhaseNeg[11]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe9]
set_property port_width 13 [get_debug_ports u_ila_0/probe9]
connect_debug_port u_ila_0/probe9 [get_nets [list {stcDemod/H1Mag[0]} {stcDemod/H1Mag[1]} {stcDemod/H1Mag[2]} {stcDemod/H1Mag[3]} {stcDemod/H1Mag[4]} {stcDemod/H1Mag[5]} {stcDemod/H1Mag[6]} {stcDemod/H1Mag[7]} {stcDemod/H1Mag[8]} {stcDemod/H1Mag[9]} {stcDemod/H1Mag[10]} {stcDemod/H1Mag[11]} {stcDemod/H1Mag[12]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe10]
set_property port_width 12 [get_debug_ports u_ila_0/probe10]
connect_debug_port u_ila_0/probe10 [get_nets [list {stcDemod/H0PhasePos[0]} {stcDemod/H0PhasePos[1]} {stcDemod/H0PhasePos[2]} {stcDemod/H0PhasePos[3]} {stcDemod/H0PhasePos[4]} {stcDemod/H0PhasePos[5]} {stcDemod/H0PhasePos[6]} {stcDemod/H0PhasePos[7]} {stcDemod/H0PhasePos[8]} {stcDemod/H0PhasePos[9]} {stcDemod/H0PhasePos[10]} {stcDemod/H0PhasePos[11]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe11]
set_property port_width 12 [get_debug_ports u_ila_0/probe11]
connect_debug_port u_ila_0/probe11 [get_nets [list {stcDemod/H1Phase[0]} {stcDemod/H1Phase[1]} {stcDemod/H1Phase[2]} {stcDemod/H1Phase[3]} {stcDemod/H1Phase[4]} {stcDemod/H1Phase[5]} {stcDemod/H1Phase[6]} {stcDemod/H1Phase[7]} {stcDemod/H1Phase[8]} {stcDemod/H1Phase[9]} {stcDemod/H1Phase[10]} {stcDemod/H1Phase[11]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe12]
set_property port_width 12 [get_debug_ports u_ila_0/probe12]
connect_debug_port u_ila_0/probe12 [get_nets [list {stcDemod/H0Phase[0]} {stcDemod/H0Phase[1]} {stcDemod/H0Phase[2]} {stcDemod/H0Phase[3]} {stcDemod/H0Phase[4]} {stcDemod/H0Phase[5]} {stcDemod/H0Phase[6]} {stcDemod/H0Phase[7]} {stcDemod/H0Phase[8]} {stcDemod/H0Phase[9]} {stcDemod/H0Phase[10]} {stcDemod/H0Phase[11]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe13]
set_property port_width 13 [get_debug_ports u_ila_0/probe13]
connect_debug_port u_ila_0/probe13 [get_nets [list {stcDemod/H0Mag[0]} {stcDemod/H0Mag[1]} {stcDemod/H0Mag[2]} {stcDemod/H0Mag[3]} {stcDemod/H0Mag[4]} {stcDemod/H0Mag[5]} {stcDemod/H0Mag[6]} {stcDemod/H0Mag[7]} {stcDemod/H0Mag[8]} {stcDemod/H0Mag[9]} {stcDemod/H0Mag[10]} {stcDemod/H0Mag[11]} {stcDemod/H0Mag[12]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe14]
set_property port_width 9 [get_debug_ports u_ila_0/probe14]
connect_debug_port u_ila_0/probe14 [get_nets [list {stcDemod/PilotOffset_s[0]} {stcDemod/PilotOffset_s[1]} {stcDemod/PilotOffset_s[2]} {stcDemod/PilotOffset_s[3]} {stcDemod/PilotOffset_s[4]} {stcDemod/PilotOffset_s[5]} {stcDemod/PilotOffset_s[6]} {stcDemod/PilotOffset_s[7]} {stcDemod/PilotOffset_s[8]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe15]
set_property port_width 18 [get_debug_ports u_ila_0/probe15]
connect_debug_port u_ila_0/probe15 [get_nets [list {stcDemod/MagI[-17]} {stcDemod/MagI[-16]} {stcDemod/MagI[-15]} {stcDemod/MagI[-14]} {stcDemod/MagI[-13]} {stcDemod/MagI[-12]} {stcDemod/MagI[-11]} {stcDemod/MagI[-10]} {stcDemod/MagI[-9]} {stcDemod/MagI[-8]} {stcDemod/MagI[-7]} {stcDemod/MagI[-6]} {stcDemod/MagI[-5]} {stcDemod/MagI[-4]} {stcDemod/MagI[-3]} {stcDemod/MagI[-2]} {stcDemod/MagI[-1]} {stcDemod/MagI[0]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe16]
set_property port_width 18 [get_debug_ports u_ila_0/probe16]
connect_debug_port u_ila_0/probe16 [get_nets [list {stcDemod/MagR[-17]} {stcDemod/MagR[-16]} {stcDemod/MagR[-15]} {stcDemod/MagR[-14]} {stcDemod/MagR[-13]} {stcDemod/MagR[-12]} {stcDemod/MagR[-11]} {stcDemod/MagR[-10]} {stcDemod/MagR[-9]} {stcDemod/MagR[-8]} {stcDemod/MagR[-7]} {stcDemod/MagR[-6]} {stcDemod/MagR[-5]} {stcDemod/MagR[-4]} {stcDemod/MagR[-3]} {stcDemod/MagR[-2]} {stcDemod/MagR[-1]} {stcDemod/MagR[0]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe17]
set_property port_width 18 [get_debug_ports u_ila_0/probe17]
connect_debug_port u_ila_0/probe17 [get_nets [list {stcDemod/Brik2_u/TauEst1Ila[0]} {stcDemod/Brik2_u/TauEst1Ila[1]} {stcDemod/Brik2_u/TauEst1Ila[2]} {stcDemod/Brik2_u/TauEst1Ila[3]} {stcDemod/Brik2_u/TauEst1Ila[4]} {stcDemod/Brik2_u/TauEst1Ila[5]} {stcDemod/Brik2_u/TauEst1Ila[6]} {stcDemod/Brik2_u/TauEst1Ila[7]} {stcDemod/Brik2_u/TauEst1Ila[8]} {stcDemod/Brik2_u/TauEst1Ila[9]} {stcDemod/Brik2_u/TauEst1Ila[10]} {stcDemod/Brik2_u/TauEst1Ila[11]} {stcDemod/Brik2_u/TauEst1Ila[12]} {stcDemod/Brik2_u/TauEst1Ila[13]} {stcDemod/Brik2_u/TauEst1Ila[14]} {stcDemod/Brik2_u/TauEst1Ila[15]} {stcDemod/Brik2_u/TauEst1Ila[16]} {stcDemod/Brik2_u/TauEst1Ila[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe18]
set_property port_width 18 [get_debug_ports u_ila_0/probe18]
connect_debug_port u_ila_0/probe18 [get_nets [list {stcDemod/Brik2_u/TauEst0Ila[0]} {stcDemod/Brik2_u/TauEst0Ila[1]} {stcDemod/Brik2_u/TauEst0Ila[2]} {stcDemod/Brik2_u/TauEst0Ila[3]} {stcDemod/Brik2_u/TauEst0Ila[4]} {stcDemod/Brik2_u/TauEst0Ila[5]} {stcDemod/Brik2_u/TauEst0Ila[6]} {stcDemod/Brik2_u/TauEst0Ila[7]} {stcDemod/Brik2_u/TauEst0Ila[8]} {stcDemod/Brik2_u/TauEst0Ila[9]} {stcDemod/Brik2_u/TauEst0Ila[10]} {stcDemod/Brik2_u/TauEst0Ila[11]} {stcDemod/Brik2_u/TauEst0Ila[12]} {stcDemod/Brik2_u/TauEst0Ila[13]} {stcDemod/Brik2_u/TauEst0Ila[14]} {stcDemod/Brik2_u/TauEst0Ila[15]} {stcDemod/Brik2_u/TauEst0Ila[16]} {stcDemod/Brik2_u/TauEst0Ila[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe19]
set_property port_width 18 [get_debug_ports u_ila_0/probe19]
connect_debug_port u_ila_0/probe19 [get_nets [list {stcDemod/Brik2_u/H1EstR_Ila[0]} {stcDemod/Brik2_u/H1EstR_Ila[1]} {stcDemod/Brik2_u/H1EstR_Ila[2]} {stcDemod/Brik2_u/H1EstR_Ila[3]} {stcDemod/Brik2_u/H1EstR_Ila[4]} {stcDemod/Brik2_u/H1EstR_Ila[5]} {stcDemod/Brik2_u/H1EstR_Ila[6]} {stcDemod/Brik2_u/H1EstR_Ila[7]} {stcDemod/Brik2_u/H1EstR_Ila[8]} {stcDemod/Brik2_u/H1EstR_Ila[9]} {stcDemod/Brik2_u/H1EstR_Ila[10]} {stcDemod/Brik2_u/H1EstR_Ila[11]} {stcDemod/Brik2_u/H1EstR_Ila[12]} {stcDemod/Brik2_u/H1EstR_Ila[13]} {stcDemod/Brik2_u/H1EstR_Ila[14]} {stcDemod/Brik2_u/H1EstR_Ila[15]} {stcDemod/Brik2_u/H1EstR_Ila[16]} {stcDemod/Brik2_u/H1EstR_Ila[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe20]
set_property port_width 18 [get_debug_ports u_ila_0/probe20]
connect_debug_port u_ila_0/probe20 [get_nets [list {stcDemod/Brik2_u/H1EstI_Ila[0]} {stcDemod/Brik2_u/H1EstI_Ila[1]} {stcDemod/Brik2_u/H1EstI_Ila[2]} {stcDemod/Brik2_u/H1EstI_Ila[3]} {stcDemod/Brik2_u/H1EstI_Ila[4]} {stcDemod/Brik2_u/H1EstI_Ila[5]} {stcDemod/Brik2_u/H1EstI_Ila[6]} {stcDemod/Brik2_u/H1EstI_Ila[7]} {stcDemod/Brik2_u/H1EstI_Ila[8]} {stcDemod/Brik2_u/H1EstI_Ila[9]} {stcDemod/Brik2_u/H1EstI_Ila[10]} {stcDemod/Brik2_u/H1EstI_Ila[11]} {stcDemod/Brik2_u/H1EstI_Ila[12]} {stcDemod/Brik2_u/H1EstI_Ila[13]} {stcDemod/Brik2_u/H1EstI_Ila[14]} {stcDemod/Brik2_u/H1EstI_Ila[15]} {stcDemod/Brik2_u/H1EstI_Ila[16]} {stcDemod/Brik2_u/H1EstI_Ila[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe21]
set_property port_width 18 [get_debug_ports u_ila_0/probe21]
connect_debug_port u_ila_0/probe21 [get_nets [list {stcDemod/Brik2_u/H0EstR_Ila[0]} {stcDemod/Brik2_u/H0EstR_Ila[1]} {stcDemod/Brik2_u/H0EstR_Ila[2]} {stcDemod/Brik2_u/H0EstR_Ila[3]} {stcDemod/Brik2_u/H0EstR_Ila[4]} {stcDemod/Brik2_u/H0EstR_Ila[5]} {stcDemod/Brik2_u/H0EstR_Ila[6]} {stcDemod/Brik2_u/H0EstR_Ila[7]} {stcDemod/Brik2_u/H0EstR_Ila[8]} {stcDemod/Brik2_u/H0EstR_Ila[9]} {stcDemod/Brik2_u/H0EstR_Ila[10]} {stcDemod/Brik2_u/H0EstR_Ila[11]} {stcDemod/Brik2_u/H0EstR_Ila[12]} {stcDemod/Brik2_u/H0EstR_Ila[13]} {stcDemod/Brik2_u/H0EstR_Ila[14]} {stcDemod/Brik2_u/H0EstR_Ila[15]} {stcDemod/Brik2_u/H0EstR_Ila[16]} {stcDemod/Brik2_u/H0EstR_Ila[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe22]
set_property port_width 18 [get_debug_ports u_ila_0/probe22]
connect_debug_port u_ila_0/probe22 [get_nets [list {stcDemod/Brik2_u/H0EstI_Ila[0]} {stcDemod/Brik2_u/H0EstI_Ila[1]} {stcDemod/Brik2_u/H0EstI_Ila[2]} {stcDemod/Brik2_u/H0EstI_Ila[3]} {stcDemod/Brik2_u/H0EstI_Ila[4]} {stcDemod/Brik2_u/H0EstI_Ila[5]} {stcDemod/Brik2_u/H0EstI_Ila[6]} {stcDemod/Brik2_u/H0EstI_Ila[7]} {stcDemod/Brik2_u/H0EstI_Ila[8]} {stcDemod/Brik2_u/H0EstI_Ila[9]} {stcDemod/Brik2_u/H0EstI_Ila[10]} {stcDemod/Brik2_u/H0EstI_Ila[11]} {stcDemod/Brik2_u/H0EstI_Ila[12]} {stcDemod/Brik2_u/H0EstI_Ila[13]} {stcDemod/Brik2_u/H0EstI_Ila[14]} {stcDemod/Brik2_u/H0EstI_Ila[15]} {stcDemod/Brik2_u/H0EstI_Ila[16]} {stcDemod/Brik2_u/H0EstI_Ila[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe23]
set_property port_width 13 [get_debug_ports u_ila_0/probe23]
connect_debug_port u_ila_0/probe23 [get_nets [list {stcDemod/Brik2_u/HPP/Mag[0]} {stcDemod/Brik2_u/HPP/Mag[1]} {stcDemod/Brik2_u/HPP/Mag[2]} {stcDemod/Brik2_u/HPP/Mag[3]} {stcDemod/Brik2_u/HPP/Mag[4]} {stcDemod/Brik2_u/HPP/Mag[5]} {stcDemod/Brik2_u/HPP/Mag[6]} {stcDemod/Brik2_u/HPP/Mag[7]} {stcDemod/Brik2_u/HPP/Mag[8]} {stcDemod/Brik2_u/HPP/Mag[9]} {stcDemod/Brik2_u/HPP/Mag[10]} {stcDemod/Brik2_u/HPP/Mag[11]} {stcDemod/Brik2_u/HPP/Mag[12]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe24]
set_property port_width 18 [get_debug_ports u_ila_0/probe24]
connect_debug_port u_ila_0/probe24 [get_nets [list {stcDdc/ddc/iMix[0]} {stcDdc/ddc/iMix[1]} {stcDdc/ddc/iMix[2]} {stcDdc/ddc/iMix[3]} {stcDdc/ddc/iMix[4]} {stcDdc/ddc/iMix[5]} {stcDdc/ddc/iMix[6]} {stcDdc/ddc/iMix[7]} {stcDdc/ddc/iMix[8]} {stcDdc/ddc/iMix[9]} {stcDdc/ddc/iMix[10]} {stcDdc/ddc/iMix[11]} {stcDdc/ddc/iMix[12]} {stcDdc/ddc/iMix[13]} {stcDdc/ddc/iMix[14]} {stcDdc/ddc/iMix[15]} {stcDdc/ddc/iMix[16]} {stcDdc/ddc/iMix[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe25]
set_property port_width 18 [get_debug_ports u_ila_0/probe25]
connect_debug_port u_ila_0/probe25 [get_nets [list {stcDdc/ddc/iHbIn[0]} {stcDdc/ddc/iHbIn[1]} {stcDdc/ddc/iHbIn[2]} {stcDdc/ddc/iHbIn[3]} {stcDdc/ddc/iHbIn[4]} {stcDdc/ddc/iHbIn[5]} {stcDdc/ddc/iHbIn[6]} {stcDdc/ddc/iHbIn[7]} {stcDdc/ddc/iHbIn[8]} {stcDdc/ddc/iHbIn[9]} {stcDdc/ddc/iHbIn[10]} {stcDdc/ddc/iHbIn[11]} {stcDdc/ddc/iHbIn[12]} {stcDdc/ddc/iHbIn[13]} {stcDdc/ddc/iHbIn[14]} {stcDdc/ddc/iHbIn[15]} {stcDdc/ddc/iHbIn[16]} {stcDdc/ddc/iHbIn[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe26]
set_property port_width 18 [get_debug_ports u_ila_0/probe26]
connect_debug_port u_ila_0/probe26 [get_nets [list {stcDdc/ddc/iHb[0]} {stcDdc/ddc/iHb[1]} {stcDdc/ddc/iHb[2]} {stcDdc/ddc/iHb[3]} {stcDdc/ddc/iHb[4]} {stcDdc/ddc/iHb[5]} {stcDdc/ddc/iHb[6]} {stcDdc/ddc/iHb[7]} {stcDdc/ddc/iHb[8]} {stcDdc/ddc/iHb[9]} {stcDdc/ddc/iHb[10]} {stcDdc/ddc/iHb[11]} {stcDdc/ddc/iHb[12]} {stcDdc/ddc/iHb[13]} {stcDdc/ddc/iHb[14]} {stcDdc/ddc/iHb[15]} {stcDdc/ddc/iHb[16]} {stcDdc/ddc/iHb[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe27]
set_property port_width 18 [get_debug_ports u_ila_0/probe27]
connect_debug_port u_ila_0/probe27 [get_nets [list {stcDdc/ddc/iFirIn[0]} {stcDdc/ddc/iFirIn[1]} {stcDdc/ddc/iFirIn[2]} {stcDdc/ddc/iFirIn[3]} {stcDdc/ddc/iFirIn[4]} {stcDdc/ddc/iFirIn[5]} {stcDdc/ddc/iFirIn[6]} {stcDdc/ddc/iFirIn[7]} {stcDdc/ddc/iFirIn[8]} {stcDdc/ddc/iFirIn[9]} {stcDdc/ddc/iFirIn[10]} {stcDdc/ddc/iFirIn[11]} {stcDdc/ddc/iFirIn[12]} {stcDdc/ddc/iFirIn[13]} {stcDdc/ddc/iFirIn[14]} {stcDdc/ddc/iFirIn[15]} {stcDdc/ddc/iFirIn[16]} {stcDdc/ddc/iFirIn[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe28]
set_property port_width 18 [get_debug_ports u_ila_0/probe28]
connect_debug_port u_ila_0/probe28 [get_nets [list {stcDdc/ddc/iFir[0]} {stcDdc/ddc/iFir[1]} {stcDdc/ddc/iFir[2]} {stcDdc/ddc/iFir[3]} {stcDdc/ddc/iFir[4]} {stcDdc/ddc/iFir[5]} {stcDdc/ddc/iFir[6]} {stcDdc/ddc/iFir[7]} {stcDdc/ddc/iFir[8]} {stcDdc/ddc/iFir[9]} {stcDdc/ddc/iFir[10]} {stcDdc/ddc/iFir[11]} {stcDdc/ddc/iFir[12]} {stcDdc/ddc/iFir[13]} {stcDdc/ddc/iFir[14]} {stcDdc/ddc/iFir[15]} {stcDdc/ddc/iFir[16]} {stcDdc/ddc/iFir[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe29]
set_property port_width 18 [get_debug_ports u_ila_0/probe29]
connect_debug_port u_ila_0/probe29 [get_nets [list {stcDdc/ddc/iCicIn[0]} {stcDdc/ddc/iCicIn[1]} {stcDdc/ddc/iCicIn[2]} {stcDdc/ddc/iCicIn[3]} {stcDdc/ddc/iCicIn[4]} {stcDdc/ddc/iCicIn[5]} {stcDdc/ddc/iCicIn[6]} {stcDdc/ddc/iCicIn[7]} {stcDdc/ddc/iCicIn[8]} {stcDdc/ddc/iCicIn[9]} {stcDdc/ddc/iCicIn[10]} {stcDdc/ddc/iCicIn[11]} {stcDdc/ddc/iCicIn[12]} {stcDdc/ddc/iCicIn[13]} {stcDdc/ddc/iCicIn[14]} {stcDdc/ddc/iCicIn[15]} {stcDdc/ddc/iCicIn[16]} {stcDdc/ddc/iCicIn[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe30]
set_property port_width 48 [get_debug_ports u_ila_0/probe30]
connect_debug_port u_ila_0/probe30 [get_nets [list {stcDdc/ddc/iCic[0]} {stcDdc/ddc/iCic[1]} {stcDdc/ddc/iCic[2]} {stcDdc/ddc/iCic[3]} {stcDdc/ddc/iCic[4]} {stcDdc/ddc/iCic[5]} {stcDdc/ddc/iCic[6]} {stcDdc/ddc/iCic[7]} {stcDdc/ddc/iCic[8]} {stcDdc/ddc/iCic[9]} {stcDdc/ddc/iCic[10]} {stcDdc/ddc/iCic[11]} {stcDdc/ddc/iCic[12]} {stcDdc/ddc/iCic[13]} {stcDdc/ddc/iCic[14]} {stcDdc/ddc/iCic[15]} {stcDdc/ddc/iCic[16]} {stcDdc/ddc/iCic[17]} {stcDdc/ddc/iCic[18]} {stcDdc/ddc/iCic[19]} {stcDdc/ddc/iCic[20]} {stcDdc/ddc/iCic[21]} {stcDdc/ddc/iCic[22]} {stcDdc/ddc/iCic[23]} {stcDdc/ddc/iCic[24]} {stcDdc/ddc/iCic[25]} {stcDdc/ddc/iCic[26]} {stcDdc/ddc/iCic[27]} {stcDdc/ddc/iCic[28]} {stcDdc/ddc/iCic[29]} {stcDdc/ddc/iCic[30]} {stcDdc/ddc/iCic[31]} {stcDdc/ddc/iCic[32]} {stcDdc/ddc/iCic[33]} {stcDdc/ddc/iCic[34]} {stcDdc/ddc/iCic[35]} {stcDdc/ddc/iCic[36]} {stcDdc/ddc/iCic[37]} {stcDdc/ddc/iCic[38]} {stcDdc/ddc/iCic[39]} {stcDdc/ddc/iCic[40]} {stcDdc/ddc/iCic[41]} {stcDdc/ddc/iCic[42]} {stcDdc/ddc/iCic[43]} {stcDdc/ddc/iCic[44]} {stcDdc/ddc/iCic[45]} {stcDdc/ddc/iCic[46]} {stcDdc/ddc/iCic[47]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe31]
set_property port_width 38 [get_debug_ports u_ila_0/probe31]
connect_debug_port u_ila_0/probe31 [get_nets [list {stcDdc/ddc/iAgcIn[0]} {stcDdc/ddc/iAgcIn[1]} {stcDdc/ddc/iAgcIn[2]} {stcDdc/ddc/iAgcIn[3]} {stcDdc/ddc/iAgcIn[4]} {stcDdc/ddc/iAgcIn[5]} {stcDdc/ddc/iAgcIn[6]} {stcDdc/ddc/iAgcIn[7]} {stcDdc/ddc/iAgcIn[8]} {stcDdc/ddc/iAgcIn[9]} {stcDdc/ddc/iAgcIn[10]} {stcDdc/ddc/iAgcIn[11]} {stcDdc/ddc/iAgcIn[12]} {stcDdc/ddc/iAgcIn[13]} {stcDdc/ddc/iAgcIn[14]} {stcDdc/ddc/iAgcIn[15]} {stcDdc/ddc/iAgcIn[16]} {stcDdc/ddc/iAgcIn[17]} {stcDdc/ddc/iAgcIn[18]} {stcDdc/ddc/iAgcIn[21]} {stcDdc/ddc/iAgcIn[22]} {stcDdc/ddc/iAgcIn[23]} {stcDdc/ddc/iAgcIn[26]} {stcDdc/ddc/iAgcIn[27]} {stcDdc/ddc/iAgcIn[28]} {stcDdc/ddc/iAgcIn[29]} {stcDdc/ddc/iAgcIn[30]} {stcDdc/ddc/iAgcIn[31]} {stcDdc/ddc/iAgcIn[32]} {stcDdc/ddc/iAgcIn[33]} {stcDdc/ddc/iAgcIn[36]} {stcDdc/ddc/iAgcIn[37]} {stcDdc/ddc/iAgcIn[38]} {stcDdc/ddc/iAgcIn[39]} {stcDdc/ddc/iAgcIn[40]} {stcDdc/ddc/iAgcIn[41]} {stcDdc/ddc/iAgcIn[42]} {stcDdc/ddc/iAgcIn[43]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe32]
set_property port_width 18 [get_debug_ports u_ila_0/probe32]
connect_debug_port u_ila_0/probe32 [get_nets [list {stcDdc/ddc/iAgc[0]} {stcDdc/ddc/iAgc[1]} {stcDdc/ddc/iAgc[2]} {stcDdc/ddc/iAgc[3]} {stcDdc/ddc/iAgc[4]} {stcDdc/ddc/iAgc[5]} {stcDdc/ddc/iAgc[6]} {stcDdc/ddc/iAgc[7]} {stcDdc/ddc/iAgc[8]} {stcDdc/ddc/iAgc[9]} {stcDdc/ddc/iAgc[10]} {stcDdc/ddc/iAgc[11]} {stcDdc/ddc/iAgc[12]} {stcDdc/ddc/iAgc[13]} {stcDdc/ddc/iAgc[14]} {stcDdc/ddc/iAgc[15]} {stcDdc/ddc/iAgc[16]} {stcDdc/ddc/iAgc[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe33]
set_property port_width 10 [get_debug_ports u_ila_0/probe33]
connect_debug_port u_ila_0/probe33 [get_nets [list {stcDdc/channelAGC/chAgcLoopFilter/qAgcIn[0]} {stcDdc/channelAGC/chAgcLoopFilter/qAgcIn[1]} {stcDdc/channelAGC/chAgcLoopFilter/qAgcIn[2]} {stcDdc/channelAGC/chAgcLoopFilter/qAgcIn[3]} {stcDdc/channelAGC/chAgcLoopFilter/qAgcIn[4]} {stcDdc/channelAGC/chAgcLoopFilter/qAgcIn[5]} {stcDdc/channelAGC/chAgcLoopFilter/qAgcIn[6]} {stcDdc/channelAGC/chAgcLoopFilter/qAgcIn[7]} {stcDdc/channelAGC/chAgcLoopFilter/qAgcIn[8]} {stcDdc/channelAGC/chAgcLoopFilter/qAgcIn[9]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe34]
set_property port_width 31 [get_debug_ports u_ila_0/probe34]
connect_debug_port u_ila_0/probe34 [get_nets [list {stcDdc/channelAGC/chAgcLoopFilter/leadError[0]} {stcDdc/channelAGC/chAgcLoopFilter/leadError[1]} {stcDdc/channelAGC/chAgcLoopFilter/leadError[2]} {stcDdc/channelAGC/chAgcLoopFilter/leadError[3]} {stcDdc/channelAGC/chAgcLoopFilter/leadError[4]} {stcDdc/channelAGC/chAgcLoopFilter/leadError[5]} {stcDdc/channelAGC/chAgcLoopFilter/leadError[6]} {stcDdc/channelAGC/chAgcLoopFilter/leadError[7]} {stcDdc/channelAGC/chAgcLoopFilter/leadError[8]} {stcDdc/channelAGC/chAgcLoopFilter/leadError[9]} {stcDdc/channelAGC/chAgcLoopFilter/leadError[10]} {stcDdc/channelAGC/chAgcLoopFilter/leadError[11]} {stcDdc/channelAGC/chAgcLoopFilter/leadError[12]} {stcDdc/channelAGC/chAgcLoopFilter/leadError[13]} {stcDdc/channelAGC/chAgcLoopFilter/leadError[14]} {stcDdc/channelAGC/chAgcLoopFilter/leadError[15]} {stcDdc/channelAGC/chAgcLoopFilter/leadError[16]} {stcDdc/channelAGC/chAgcLoopFilter/leadError[17]} {stcDdc/channelAGC/chAgcLoopFilter/leadError[18]} {stcDdc/channelAGC/chAgcLoopFilter/leadError[19]} {stcDdc/channelAGC/chAgcLoopFilter/leadError[20]} {stcDdc/channelAGC/chAgcLoopFilter/leadError[21]} {stcDdc/channelAGC/chAgcLoopFilter/leadError[22]} {stcDdc/channelAGC/chAgcLoopFilter/leadError[23]} {stcDdc/channelAGC/chAgcLoopFilter/leadError[24]} {stcDdc/channelAGC/chAgcLoopFilter/leadError[25]} {stcDdc/channelAGC/chAgcLoopFilter/leadError[26]} {stcDdc/channelAGC/chAgcLoopFilter/leadError[27]} {stcDdc/channelAGC/chAgcLoopFilter/leadError[28]} {stcDdc/channelAGC/chAgcLoopFilter/leadError[29]} {stcDdc/channelAGC/chAgcLoopFilter/leadError[30]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe35]
set_property port_width 19 [get_debug_ports u_ila_0/probe35]
connect_debug_port u_ila_0/probe35 [get_nets [list {stcDdc/channelAGC/chAgcLoopFilter/integrator_reg[31]_1[0]} {stcDdc/channelAGC/chAgcLoopFilter/integrator_reg[31]_1[1]} {stcDdc/channelAGC/chAgcLoopFilter/integrator_reg[31]_1[2]} {stcDdc/channelAGC/chAgcLoopFilter/integrator_reg[31]_1[3]} {stcDdc/channelAGC/chAgcLoopFilter/integrator_reg[31]_1[4]} {stcDdc/channelAGC/chAgcLoopFilter/integrator_reg[31]_1[5]} {stcDdc/channelAGC/chAgcLoopFilter/integrator_reg[31]_1[6]} {stcDdc/channelAGC/chAgcLoopFilter/integrator_reg[31]_1[7]} {stcDdc/channelAGC/chAgcLoopFilter/integrator_reg[31]_1[8]} {stcDdc/channelAGC/chAgcLoopFilter/integrator_reg[31]_1[9]} {stcDdc/channelAGC/chAgcLoopFilter/integrator_reg[31]_1[10]} {stcDdc/channelAGC/chAgcLoopFilter/integrator_reg[31]_1[11]} {stcDdc/channelAGC/chAgcLoopFilter/integrator_reg[31]_1[12]} {stcDdc/channelAGC/chAgcLoopFilter/integrator_reg[31]_1[13]} {stcDdc/channelAGC/chAgcLoopFilter/integrator_reg[31]_1[14]} {stcDdc/channelAGC/chAgcLoopFilter/integrator_reg[31]_1[15]} {stcDdc/channelAGC/chAgcLoopFilter/integrator_reg[31]_1[16]} {stcDdc/channelAGC/chAgcLoopFilter/integrator_reg[31]_1[17]} {stcDdc/channelAGC/chAgcLoopFilter/integrator_reg[31]_1[18]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe36]
set_property port_width 22 [get_debug_ports u_ila_0/probe36]
connect_debug_port u_ila_0/probe36 [get_nets [list {stcDdc/channelAGC/chAgcLoopFilter/integrator_reg[31]_0[0]} {stcDdc/channelAGC/chAgcLoopFilter/integrator_reg[31]_0[1]} {stcDdc/channelAGC/chAgcLoopFilter/integrator_reg[31]_0[2]} {stcDdc/channelAGC/chAgcLoopFilter/integrator_reg[31]_0[3]} {stcDdc/channelAGC/chAgcLoopFilter/integrator_reg[31]_0[4]} {stcDdc/channelAGC/chAgcLoopFilter/integrator_reg[31]_0[5]} {stcDdc/channelAGC/chAgcLoopFilter/integrator_reg[31]_0[6]} {stcDdc/channelAGC/chAgcLoopFilter/integrator_reg[31]_0[7]} {stcDdc/channelAGC/chAgcLoopFilter/integrator_reg[31]_0[8]} {stcDdc/channelAGC/chAgcLoopFilter/integrator_reg[31]_0[9]} {stcDdc/channelAGC/chAgcLoopFilter/integrator_reg[31]_0[10]} {stcDdc/channelAGC/chAgcLoopFilter/integrator_reg[31]_0[11]} {stcDdc/channelAGC/chAgcLoopFilter/integrator_reg[31]_0[12]} {stcDdc/channelAGC/chAgcLoopFilter/integrator_reg[31]_0[13]} {stcDdc/channelAGC/chAgcLoopFilter/integrator_reg[31]_0[14]} {stcDdc/channelAGC/chAgcLoopFilter/integrator_reg[31]_0[15]} {stcDdc/channelAGC/chAgcLoopFilter/integrator_reg[31]_0[16]} {stcDdc/channelAGC/chAgcLoopFilter/integrator_reg[31]_0[17]} {stcDdc/channelAGC/chAgcLoopFilter/integrator_reg[31]_0[18]} {stcDdc/channelAGC/chAgcLoopFilter/integrator_reg[31]_0[19]} {stcDdc/channelAGC/chAgcLoopFilter/integrator_reg[31]_0[20]} {stcDdc/channelAGC/chAgcLoopFilter/integrator_reg[31]_0[21]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe37]
set_property port_width 7 [get_debug_ports u_ila_0/probe37]
connect_debug_port u_ila_0/probe37 [get_nets [list {stcDdc/channelAGC/chAgcLoopFilter/error__22[1]} {stcDdc/channelAGC/chAgcLoopFilter/error__22[2]} {stcDdc/channelAGC/chAgcLoopFilter/error__22[3]} {stcDdc/channelAGC/chAgcLoopFilter/error__22[4]} {stcDdc/channelAGC/chAgcLoopFilter/error__22[5]} {stcDdc/channelAGC/chAgcLoopFilter/error__22[6]} {stcDdc/channelAGC/chAgcLoopFilter/error__22[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe38]
set_property port_width 8 [get_debug_ports u_ila_0/probe38]
connect_debug_port u_ila_0/probe38 [get_nets [list {stcDdc/channelAGC/log2Mag[0]} {stcDdc/channelAGC/log2Mag[1]} {stcDdc/channelAGC/log2Mag[2]} {stcDdc/channelAGC/log2Mag[3]} {stcDdc/channelAGC/log2Mag[4]} {stcDdc/channelAGC/log2Mag[5]} {stcDdc/channelAGC/log2Mag[6]} {stcDdc/channelAGC/log2Mag[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe39]
set_property port_width 19 [get_debug_ports u_ila_0/probe39]
connect_debug_port u_ila_0/probe39 [get_nets [list {stcDdc/channelAGC/integrator_reg[31][0]} {stcDdc/channelAGC/integrator_reg[31][1]} {stcDdc/channelAGC/integrator_reg[31][2]} {stcDdc/channelAGC/integrator_reg[31][3]} {stcDdc/channelAGC/integrator_reg[31][4]} {stcDdc/channelAGC/integrator_reg[31][5]} {stcDdc/channelAGC/integrator_reg[31][6]} {stcDdc/channelAGC/integrator_reg[31][7]} {stcDdc/channelAGC/integrator_reg[31][8]} {stcDdc/channelAGC/integrator_reg[31][9]} {stcDdc/channelAGC/integrator_reg[31][10]} {stcDdc/channelAGC/integrator_reg[31][11]} {stcDdc/channelAGC/integrator_reg[31][12]} {stcDdc/channelAGC/integrator_reg[31][13]} {stcDdc/channelAGC/integrator_reg[31][14]} {stcDdc/channelAGC/integrator_reg[31][15]} {stcDdc/channelAGC/integrator_reg[31][16]} {stcDdc/channelAGC/integrator_reg[31][17]} {stcDdc/channelAGC/integrator_reg[31][18]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe40]
set_property port_width 8 [get_debug_ports u_ila_0/probe40]
connect_debug_port u_ila_0/probe40 [get_nets [list {stcDdc/channelAGC/agcSetpoint[0]} {stcDdc/channelAGC/agcSetpoint[1]} {stcDdc/channelAGC/agcSetpoint[2]} {stcDdc/channelAGC/agcSetpoint[3]} {stcDdc/channelAGC/agcSetpoint[4]} {stcDdc/channelAGC/agcSetpoint[5]} {stcDdc/channelAGC/agcSetpoint[6]} {stcDdc/channelAGC/agcSetpoint[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe41]
set_property port_width 1 [get_debug_ports u_ila_0/probe41]
connect_debug_port u_ila_0/probe41 [get_nets [list stcDemod/ClkOutEn]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe42]
set_property port_width 1 [get_debug_ports u_ila_0/probe42]
connect_debug_port u_ila_0/probe42 [get_nets [list stcDemod/EstimatesDone]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe43]
set_property port_width 1 [get_debug_ports u_ila_0/probe43]
connect_debug_port u_ila_0/probe43 [get_nets [list pilot/lagGain/freqAcquired_reg]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe44]
set_property port_width 1 [get_debug_ports u_ila_0/probe44]
connect_debug_port u_ila_0/probe44 [get_nets [list stcDemod/PilotFoundCE]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe45]
set_property port_width 1 [get_debug_ports u_ila_0/probe45]
connect_debug_port u_ila_0/probe45 [get_nets [list stcDemod/PilotFoundPD]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe1]
set_property port_width 15 [get_debug_ports u_ila_1/probe1]
connect_debug_port u_ila_1/probe1 [get_nets [list {stcDemod/Trellis_u/fa/rdAddr[0]} {stcDemod/Trellis_u/fa/rdAddr[1]} {stcDemod/Trellis_u/fa/rdAddr[2]} {stcDemod/Trellis_u/fa/rdAddr[3]} {stcDemod/Trellis_u/fa/rdAddr[4]} {stcDemod/Trellis_u/fa/rdAddr[5]} {stcDemod/Trellis_u/fa/rdAddr[6]} {stcDemod/Trellis_u/fa/rdAddr[7]} {stcDemod/Trellis_u/fa/rdAddr[8]} {stcDemod/Trellis_u/fa/rdAddr[9]} {stcDemod/Trellis_u/fa/rdAddr[10]} {stcDemod/Trellis_u/fa/rdAddr[11]} {stcDemod/Trellis_u/fa/rdAddr[12]} {stcDemod/Trellis_u/fa/rdAddr[13]} {stcDemod/Trellis_u/fa/rdAddr[14]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe2]
set_property port_width 15 [get_debug_ports u_ila_1/probe2]
connect_debug_port u_ila_1/probe2 [get_nets [list {stcDemod/Trellis_u/fa/depth[0]} {stcDemod/Trellis_u/fa/depth[1]} {stcDemod/Trellis_u/fa/depth[2]} {stcDemod/Trellis_u/fa/depth[3]} {stcDemod/Trellis_u/fa/depth[4]} {stcDemod/Trellis_u/fa/depth[5]} {stcDemod/Trellis_u/fa/depth[6]} {stcDemod/Trellis_u/fa/depth[7]} {stcDemod/Trellis_u/fa/depth[8]} {stcDemod/Trellis_u/fa/depth[9]} {stcDemod/Trellis_u/fa/depth[10]} {stcDemod/Trellis_u/fa/depth[11]} {stcDemod/Trellis_u/fa/depth[12]} {stcDemod/Trellis_u/fa/depth[13]} {stcDemod/Trellis_u/fa/depth[14]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe3]
set_property port_width 18 [get_debug_ports u_ila_1/probe3]
connect_debug_port u_ila_1/probe3 [get_nets [list {stcDemod/PD_u/AbsCntr1_Ila[0]} {stcDemod/PD_u/AbsCntr1_Ila[1]} {stcDemod/PD_u/AbsCntr1_Ila[2]} {stcDemod/PD_u/AbsCntr1_Ila[3]} {stcDemod/PD_u/AbsCntr1_Ila[4]} {stcDemod/PD_u/AbsCntr1_Ila[5]} {stcDemod/PD_u/AbsCntr1_Ila[6]} {stcDemod/PD_u/AbsCntr1_Ila[7]} {stcDemod/PD_u/AbsCntr1_Ila[8]} {stcDemod/PD_u/AbsCntr1_Ila[9]} {stcDemod/PD_u/AbsCntr1_Ila[10]} {stcDemod/PD_u/AbsCntr1_Ila[11]} {stcDemod/PD_u/AbsCntr1_Ila[12]} {stcDemod/PD_u/AbsCntr1_Ila[13]} {stcDemod/PD_u/AbsCntr1_Ila[14]} {stcDemod/PD_u/AbsCntr1_Ila[15]} {stcDemod/PD_u/AbsCntr1_Ila[16]} {stcDemod/PD_u/AbsCntr1_Ila[17]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe4]
set_property port_width 18 [get_debug_ports u_ila_1/probe4]
connect_debug_port u_ila_1/probe4 [get_nets [list {stcDemod/PD_u/AbsCntr0_Ila[0]} {stcDemod/PD_u/AbsCntr0_Ila[1]} {stcDemod/PD_u/AbsCntr0_Ila[2]} {stcDemod/PD_u/AbsCntr0_Ila[3]} {stcDemod/PD_u/AbsCntr0_Ila[4]} {stcDemod/PD_u/AbsCntr0_Ila[5]} {stcDemod/PD_u/AbsCntr0_Ila[6]} {stcDemod/PD_u/AbsCntr0_Ila[7]} {stcDemod/PD_u/AbsCntr0_Ila[8]} {stcDemod/PD_u/AbsCntr0_Ila[9]} {stcDemod/PD_u/AbsCntr0_Ila[10]} {stcDemod/PD_u/AbsCntr0_Ila[11]} {stcDemod/PD_u/AbsCntr0_Ila[12]} {stcDemod/PD_u/AbsCntr0_Ila[13]} {stcDemod/PD_u/AbsCntr0_Ila[14]} {stcDemod/PD_u/AbsCntr0_Ila[15]} {stcDemod/PD_u/AbsCntr0_Ila[16]} {stcDemod/PD_u/AbsCntr0_Ila[17]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe5]
set_property port_width 10 [get_debug_ports u_ila_1/probe5]
connect_debug_port u_ila_1/probe5 [get_nets [list {stcDemod/DataAddr[0]} {stcDemod/DataAddr[1]} {stcDemod/DataAddr[2]} {stcDemod/DataAddr[3]} {stcDemod/DataAddr[4]} {stcDemod/DataAddr[5]} {stcDemod/DataAddr[6]} {stcDemod/DataAddr[7]} {stcDemod/DataAddr[8]} {stcDemod/DataAddr[9]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe6]
set_property port_width 4 [get_debug_ports u_ila_1/probe6]
connect_debug_port u_ila_1/probe6 [get_nets [list {stcDemod/m_ndx0Slv[0]} {stcDemod/m_ndx0Slv[1]} {stcDemod/m_ndx0Slv[2]} {stcDemod/m_ndx0Slv[3]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe7]
set_property port_width 6 [get_debug_ports u_ila_1/probe7]
connect_debug_port u_ila_1/probe7 [get_nets [list {stcDemod/deltaTauEstSlv[0]} {stcDemod/deltaTauEstSlv[1]} {stcDemod/deltaTauEstSlv[2]} {stcDemod/deltaTauEstSlv[3]} {stcDemod/deltaTauEstSlv[4]} {stcDemod/deltaTauEstSlv[5]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe8]
set_property port_width 4 [get_debug_ports u_ila_1/probe8]
connect_debug_port u_ila_1/probe8 [get_nets [list {stcDemod/m_ndx1Slv[0]} {stcDemod/m_ndx1Slv[1]} {stcDemod/m_ndx1Slv[2]} {stcDemod/m_ndx1Slv[3]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe9]
set_property port_width 9 [get_debug_ports u_ila_1/probe9]
connect_debug_port u_ila_1/probe9 [get_nets [list {stcDemod/PilotOffset[0]} {stcDemod/PilotOffset[1]} {stcDemod/PilotOffset[2]} {stcDemod/PilotOffset[3]} {stcDemod/PilotOffset[4]} {stcDemod/PilotOffset[5]} {stcDemod/PilotOffset[6]} {stcDemod/PilotOffset[7]} {stcDemod/PilotOffset[8]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe10]
set_property port_width 9 [get_debug_ports u_ila_1/probe10]
connect_debug_port u_ila_1/probe10 [get_nets [list {stcDemod/CorrPntr8to0[0]} {stcDemod/CorrPntr8to0[1]} {stcDemod/CorrPntr8to0[2]} {stcDemod/CorrPntr8to0[3]} {stcDemod/CorrPntr8to0[4]} {stcDemod/CorrPntr8to0[5]} {stcDemod/CorrPntr8to0[6]} {stcDemod/CorrPntr8to0[7]} {stcDemod/CorrPntr8to0[8]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe11]
set_property port_width 18 [get_debug_ports u_ila_1/probe11]
connect_debug_port u_ila_1/probe11 [get_nets [list {stcDemod/InRBrik2Ila[0]} {stcDemod/InRBrik2Ila[1]} {stcDemod/InRBrik2Ila[2]} {stcDemod/InRBrik2Ila[3]} {stcDemod/InRBrik2Ila[4]} {stcDemod/InRBrik2Ila[5]} {stcDemod/InRBrik2Ila[6]} {stcDemod/InRBrik2Ila[7]} {stcDemod/InRBrik2Ila[8]} {stcDemod/InRBrik2Ila[9]} {stcDemod/InRBrik2Ila[10]} {stcDemod/InRBrik2Ila[11]} {stcDemod/InRBrik2Ila[12]} {stcDemod/InRBrik2Ila[13]} {stcDemod/InRBrik2Ila[14]} {stcDemod/InRBrik2Ila[15]} {stcDemod/InRBrik2Ila[16]} {stcDemod/InRBrik2Ila[17]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe12]
set_property port_width 18 [get_debug_ports u_ila_1/probe12]
connect_debug_port u_ila_1/probe12 [get_nets [list {stcDemod/InIBrik2Ila[0]} {stcDemod/InIBrik2Ila[1]} {stcDemod/InIBrik2Ila[2]} {stcDemod/InIBrik2Ila[3]} {stcDemod/InIBrik2Ila[4]} {stcDemod/InIBrik2Ila[5]} {stcDemod/InIBrik2Ila[6]} {stcDemod/InIBrik2Ila[7]} {stcDemod/InIBrik2Ila[8]} {stcDemod/InIBrik2Ila[9]} {stcDemod/InIBrik2Ila[10]} {stcDemod/InIBrik2Ila[11]} {stcDemod/InIBrik2Ila[12]} {stcDemod/InIBrik2Ila[13]} {stcDemod/InIBrik2Ila[14]} {stcDemod/InIBrik2Ila[15]} {stcDemod/InIBrik2Ila[16]} {stcDemod/InIBrik2Ila[17]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe13]
set_property port_width 14 [get_debug_ports u_ila_1/probe13]
connect_debug_port u_ila_1/probe13 [get_nets [list {stcDemod/FD/FifoDepth[0]} {stcDemod/FD/FifoDepth[1]} {stcDemod/FD/FifoDepth[2]} {stcDemod/FD/FifoDepth[3]} {stcDemod/FD/FifoDepth[4]} {stcDemod/FD/FifoDepth[5]} {stcDemod/FD/FifoDepth[6]} {stcDemod/FD/FifoDepth[7]} {stcDemod/FD/FifoDepth[8]} {stcDemod/FD/FifoDepth[9]} {stcDemod/FD/FifoDepth[10]} {stcDemod/FD/FifoDepth[11]} {stcDemod/FD/FifoDepth[12]} {stcDemod/FD/FifoDepth[13]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe14]
set_property port_width 1 [get_debug_ports u_ila_1/probe14]
connect_debug_port u_ila_1/probe14 [get_nets [list stcDemod/Brik2_u/ChanEstDone]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe15]
set_property port_width 1 [get_debug_ports u_ila_1/probe15]
connect_debug_port u_ila_1/probe15 [get_nets [list stcDemod/DataOut]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe16]
set_property port_width 1 [get_debug_ports u_ila_1/probe16]
connect_debug_port u_ila_1/probe16 [get_nets [list stcDemod/Mag0GtMag1]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe17]
set_property port_width 1 [get_debug_ports u_ila_1/probe17]
connect_debug_port u_ila_1/probe17 [get_nets [list stcDemod/PrnErrors]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe18]
set_property port_width 1 [get_debug_ports u_ila_1/probe18]
connect_debug_port u_ila_1/probe18 [get_nets [list stcDemod/StartIla]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe19]
set_property port_width 1 [get_debug_ports u_ila_1/probe19]
connect_debug_port u_ila_1/probe19 [get_nets [list stcDemod/Brik2_u/TimeEstDone]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe20]
set_property port_width 1 [get_debug_ports u_ila_1/probe20]
connect_debug_port u_ila_1/probe20 [get_nets [list stcDemod/ValidData2047]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe21]
set_property port_width 1 [get_debug_ports u_ila_1/probe21]
connect_debug_port u_ila_1/probe21 [get_nets [list stcDemod/ValidIla]]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets clk2x]
