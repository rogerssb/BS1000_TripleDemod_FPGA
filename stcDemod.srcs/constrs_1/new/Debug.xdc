
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
set_property port_width 12 [get_debug_ports u_ila_0/probe0]
connect_debug_port u_ila_0/probe0 [get_nets [list {stcDemod/PS_u/Phase0B[-11]} {stcDemod/PS_u/Phase0B[-10]} {stcDemod/PS_u/Phase0B[-9]} {stcDemod/PS_u/Phase0B[-8]} {stcDemod/PS_u/Phase0B[-7]} {stcDemod/PS_u/Phase0B[-6]} {stcDemod/PS_u/Phase0B[-5]} {stcDemod/PS_u/Phase0B[-4]} {stcDemod/PS_u/Phase0B[-3]} {stcDemod/PS_u/Phase0B[-2]} {stcDemod/PS_u/Phase0B[-1]} {stcDemod/PS_u/Phase0B[0]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe1]
set_property port_width 12 [get_debug_ports u_ila_0/probe1]
connect_debug_port u_ila_0/probe1 [get_nets [list {stcDemod/PS_u/Phase0A[-11]} {stcDemod/PS_u/Phase0A[-10]} {stcDemod/PS_u/Phase0A[-9]} {stcDemod/PS_u/Phase0A[-8]} {stcDemod/PS_u/Phase0A[-7]} {stcDemod/PS_u/Phase0A[-6]} {stcDemod/PS_u/Phase0A[-5]} {stcDemod/PS_u/Phase0A[-4]} {stcDemod/PS_u/Phase0A[-3]} {stcDemod/PS_u/Phase0A[-2]} {stcDemod/PS_u/Phase0A[-1]} {stcDemod/PS_u/Phase0A[0]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe2]
set_property port_width 12 [get_debug_ports u_ila_0/probe2]
connect_debug_port u_ila_0/probe2 [get_nets [list {stcDemod/PS_u/Phase1[0]} {stcDemod/PS_u/Phase1[1]} {stcDemod/PS_u/Phase1[2]} {stcDemod/PS_u/Phase1[3]} {stcDemod/PS_u/Phase1[4]} {stcDemod/PS_u/Phase1[5]} {stcDemod/PS_u/Phase1[6]} {stcDemod/PS_u/Phase1[7]} {stcDemod/PS_u/Phase1[8]} {stcDemod/PS_u/Phase1[9]} {stcDemod/PS_u/Phase1[10]} {stcDemod/PS_u/Phase1[11]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe3]
set_property port_width 18 [get_debug_ports u_ila_0/probe3]
connect_debug_port u_ila_0/probe3 [get_nets [list {stcDemod/PS_u/ReadI_Ila[0]} {stcDemod/PS_u/ReadI_Ila[1]} {stcDemod/PS_u/ReadI_Ila[2]} {stcDemod/PS_u/ReadI_Ila[3]} {stcDemod/PS_u/ReadI_Ila[4]} {stcDemod/PS_u/ReadI_Ila[5]} {stcDemod/PS_u/ReadI_Ila[6]} {stcDemod/PS_u/ReadI_Ila[7]} {stcDemod/PS_u/ReadI_Ila[8]} {stcDemod/PS_u/ReadI_Ila[9]} {stcDemod/PS_u/ReadI_Ila[10]} {stcDemod/PS_u/ReadI_Ila[11]} {stcDemod/PS_u/ReadI_Ila[12]} {stcDemod/PS_u/ReadI_Ila[13]} {stcDemod/PS_u/ReadI_Ila[14]} {stcDemod/PS_u/ReadI_Ila[15]} {stcDemod/PS_u/ReadI_Ila[16]} {stcDemod/PS_u/ReadI_Ila[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe4]
set_property port_width 14 [get_debug_ports u_ila_0/probe4]
connect_debug_port u_ila_0/probe4 [get_nets [list {stcDemod/PS_u/FrmSmplCount[0]} {stcDemod/PS_u/FrmSmplCount[1]} {stcDemod/PS_u/FrmSmplCount[2]} {stcDemod/PS_u/FrmSmplCount[3]} {stcDemod/PS_u/FrmSmplCount[4]} {stcDemod/PS_u/FrmSmplCount[5]} {stcDemod/PS_u/FrmSmplCount[6]} {stcDemod/PS_u/FrmSmplCount[7]} {stcDemod/PS_u/FrmSmplCount[8]} {stcDemod/PS_u/FrmSmplCount[9]} {stcDemod/PS_u/FrmSmplCount[10]} {stcDemod/PS_u/FrmSmplCount[11]} {stcDemod/PS_u/FrmSmplCount[12]} {stcDemod/PS_u/FrmSmplCount[13]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe5]
set_property port_width 18 [get_debug_ports u_ila_0/probe5]
connect_debug_port u_ila_0/probe5 [get_nets [list {stcDemod/PS_u/ReadR_Ila[0]} {stcDemod/PS_u/ReadR_Ila[1]} {stcDemod/PS_u/ReadR_Ila[2]} {stcDemod/PS_u/ReadR_Ila[3]} {stcDemod/PS_u/ReadR_Ila[4]} {stcDemod/PS_u/ReadR_Ila[5]} {stcDemod/PS_u/ReadR_Ila[6]} {stcDemod/PS_u/ReadR_Ila[7]} {stcDemod/PS_u/ReadR_Ila[8]} {stcDemod/PS_u/ReadR_Ila[9]} {stcDemod/PS_u/ReadR_Ila[10]} {stcDemod/PS_u/ReadR_Ila[11]} {stcDemod/PS_u/ReadR_Ila[12]} {stcDemod/PS_u/ReadR_Ila[13]} {stcDemod/PS_u/ReadR_Ila[14]} {stcDemod/PS_u/ReadR_Ila[15]} {stcDemod/PS_u/ReadR_Ila[16]} {stcDemod/PS_u/ReadR_Ila[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe6]
set_property port_width 18 [get_debug_ports u_ila_0/probe6]
connect_debug_port u_ila_0/probe6 [get_nets [list {stcDemod/PS_u/PhaseDiff[-17]} {stcDemod/PS_u/PhaseDiff[-16]} {stcDemod/PS_u/PhaseDiff[-15]} {stcDemod/PS_u/PhaseDiff[-14]} {stcDemod/PS_u/PhaseDiff[-13]} {stcDemod/PS_u/PhaseDiff[-12]} {stcDemod/PS_u/PhaseDiff[-11]} {stcDemod/PS_u/PhaseDiff[-10]} {stcDemod/PS_u/PhaseDiff[-9]} {stcDemod/PS_u/PhaseDiff[-8]} {stcDemod/PS_u/PhaseDiff[-7]} {stcDemod/PS_u/PhaseDiff[-6]} {stcDemod/PS_u/PhaseDiff[-5]} {stcDemod/PS_u/PhaseDiff[-4]} {stcDemod/PS_u/PhaseDiff[-3]} {stcDemod/PS_u/PhaseDiff[-2]} {stcDemod/PS_u/PhaseDiff[-1]} {stcDemod/PS_u/PhaseDiff[0]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe7]
set_property port_width 16 [get_debug_ports u_ila_0/probe7]
connect_debug_port u_ila_0/probe7 [get_nets [list {stcDemod/PS_u/CorrCntrCapture[0]} {stcDemod/PS_u/CorrCntrCapture[1]} {stcDemod/PS_u/CorrCntrCapture[2]} {stcDemod/PS_u/CorrCntrCapture[3]} {stcDemod/PS_u/CorrCntrCapture[4]} {stcDemod/PS_u/CorrCntrCapture[5]} {stcDemod/PS_u/CorrCntrCapture[6]} {stcDemod/PS_u/CorrCntrCapture[7]} {stcDemod/PS_u/CorrCntrCapture[8]} {stcDemod/PS_u/CorrCntrCapture[9]} {stcDemod/PS_u/CorrCntrCapture[10]} {stcDemod/PS_u/CorrCntrCapture[11]} {stcDemod/PS_u/CorrCntrCapture[12]} {stcDemod/PS_u/CorrCntrCapture[13]} {stcDemod/PS_u/CorrCntrCapture[14]} {stcDemod/PS_u/CorrCntrCapture[15]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe8]
set_property port_width 11 [get_debug_ports u_ila_0/probe8]
connect_debug_port u_ila_0/probe8 [get_nets [list {stcDemod/PS_u/SyncSumIla[0]} {stcDemod/PS_u/SyncSumIla[1]} {stcDemod/PS_u/SyncSumIla[2]} {stcDemod/PS_u/SyncSumIla[3]} {stcDemod/PS_u/SyncSumIla[4]} {stcDemod/PS_u/SyncSumIla[5]} {stcDemod/PS_u/SyncSumIla[6]} {stcDemod/PS_u/SyncSumIla[7]} {stcDemod/PS_u/SyncSumIla[8]} {stcDemod/PS_u/SyncSumIla[9]} {stcDemod/PS_u/SyncSumIla[10]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe9]
set_property port_width 18 [get_debug_ports u_ila_0/probe9]
connect_debug_port u_ila_0/probe9 [get_nets [list {stcDemod/ShortBuild.Brik2_u/H0EstR_Ila[0]} {stcDemod/ShortBuild.Brik2_u/H0EstR_Ila[1]} {stcDemod/ShortBuild.Brik2_u/H0EstR_Ila[2]} {stcDemod/ShortBuild.Brik2_u/H0EstR_Ila[3]} {stcDemod/ShortBuild.Brik2_u/H0EstR_Ila[4]} {stcDemod/ShortBuild.Brik2_u/H0EstR_Ila[5]} {stcDemod/ShortBuild.Brik2_u/H0EstR_Ila[6]} {stcDemod/ShortBuild.Brik2_u/H0EstR_Ila[7]} {stcDemod/ShortBuild.Brik2_u/H0EstR_Ila[8]} {stcDemod/ShortBuild.Brik2_u/H0EstR_Ila[9]} {stcDemod/ShortBuild.Brik2_u/H0EstR_Ila[10]} {stcDemod/ShortBuild.Brik2_u/H0EstR_Ila[11]} {stcDemod/ShortBuild.Brik2_u/H0EstR_Ila[12]} {stcDemod/ShortBuild.Brik2_u/H0EstR_Ila[13]} {stcDemod/ShortBuild.Brik2_u/H0EstR_Ila[14]} {stcDemod/ShortBuild.Brik2_u/H0EstR_Ila[15]} {stcDemod/ShortBuild.Brik2_u/H0EstR_Ila[16]} {stcDemod/ShortBuild.Brik2_u/H0EstR_Ila[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe10]
set_property port_width 18 [get_debug_ports u_ila_0/probe10]
connect_debug_port u_ila_0/probe10 [get_nets [list {stcDemod/ShortBuild.Brik2_u/TauEst1Ila[0]} {stcDemod/ShortBuild.Brik2_u/TauEst1Ila[1]} {stcDemod/ShortBuild.Brik2_u/TauEst1Ila[2]} {stcDemod/ShortBuild.Brik2_u/TauEst1Ila[3]} {stcDemod/ShortBuild.Brik2_u/TauEst1Ila[4]} {stcDemod/ShortBuild.Brik2_u/TauEst1Ila[5]} {stcDemod/ShortBuild.Brik2_u/TauEst1Ila[6]} {stcDemod/ShortBuild.Brik2_u/TauEst1Ila[7]} {stcDemod/ShortBuild.Brik2_u/TauEst1Ila[8]} {stcDemod/ShortBuild.Brik2_u/TauEst1Ila[9]} {stcDemod/ShortBuild.Brik2_u/TauEst1Ila[10]} {stcDemod/ShortBuild.Brik2_u/TauEst1Ila[11]} {stcDemod/ShortBuild.Brik2_u/TauEst1Ila[12]} {stcDemod/ShortBuild.Brik2_u/TauEst1Ila[13]} {stcDemod/ShortBuild.Brik2_u/TauEst1Ila[14]} {stcDemod/ShortBuild.Brik2_u/TauEst1Ila[15]} {stcDemod/ShortBuild.Brik2_u/TauEst1Ila[16]} {stcDemod/ShortBuild.Brik2_u/TauEst1Ila[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe11]
set_property port_width 18 [get_debug_ports u_ila_0/probe11]
connect_debug_port u_ila_0/probe11 [get_nets [list {stcDemod/ShortBuild.Brik2_u/DF_I_Ila[0]} {stcDemod/ShortBuild.Brik2_u/DF_I_Ila[1]} {stcDemod/ShortBuild.Brik2_u/DF_I_Ila[2]} {stcDemod/ShortBuild.Brik2_u/DF_I_Ila[3]} {stcDemod/ShortBuild.Brik2_u/DF_I_Ila[4]} {stcDemod/ShortBuild.Brik2_u/DF_I_Ila[5]} {stcDemod/ShortBuild.Brik2_u/DF_I_Ila[6]} {stcDemod/ShortBuild.Brik2_u/DF_I_Ila[7]} {stcDemod/ShortBuild.Brik2_u/DF_I_Ila[8]} {stcDemod/ShortBuild.Brik2_u/DF_I_Ila[9]} {stcDemod/ShortBuild.Brik2_u/DF_I_Ila[10]} {stcDemod/ShortBuild.Brik2_u/DF_I_Ila[11]} {stcDemod/ShortBuild.Brik2_u/DF_I_Ila[12]} {stcDemod/ShortBuild.Brik2_u/DF_I_Ila[13]} {stcDemod/ShortBuild.Brik2_u/DF_I_Ila[14]} {stcDemod/ShortBuild.Brik2_u/DF_I_Ila[15]} {stcDemod/ShortBuild.Brik2_u/DF_I_Ila[16]} {stcDemod/ShortBuild.Brik2_u/DF_I_Ila[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe12]
set_property port_width 18 [get_debug_ports u_ila_0/probe12]
connect_debug_port u_ila_0/probe12 [get_nets [list {stcDemod/ShortBuild.Brik2_u/H1EstI_Ila[0]} {stcDemod/ShortBuild.Brik2_u/H1EstI_Ila[1]} {stcDemod/ShortBuild.Brik2_u/H1EstI_Ila[2]} {stcDemod/ShortBuild.Brik2_u/H1EstI_Ila[3]} {stcDemod/ShortBuild.Brik2_u/H1EstI_Ila[4]} {stcDemod/ShortBuild.Brik2_u/H1EstI_Ila[5]} {stcDemod/ShortBuild.Brik2_u/H1EstI_Ila[6]} {stcDemod/ShortBuild.Brik2_u/H1EstI_Ila[7]} {stcDemod/ShortBuild.Brik2_u/H1EstI_Ila[8]} {stcDemod/ShortBuild.Brik2_u/H1EstI_Ila[9]} {stcDemod/ShortBuild.Brik2_u/H1EstI_Ila[10]} {stcDemod/ShortBuild.Brik2_u/H1EstI_Ila[11]} {stcDemod/ShortBuild.Brik2_u/H1EstI_Ila[12]} {stcDemod/ShortBuild.Brik2_u/H1EstI_Ila[13]} {stcDemod/ShortBuild.Brik2_u/H1EstI_Ila[14]} {stcDemod/ShortBuild.Brik2_u/H1EstI_Ila[15]} {stcDemod/ShortBuild.Brik2_u/H1EstI_Ila[16]} {stcDemod/ShortBuild.Brik2_u/H1EstI_Ila[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe13]
set_property port_width 18 [get_debug_ports u_ila_0/probe13]
connect_debug_port u_ila_0/probe13 [get_nets [list {stcDemod/ShortBuild.Brik2_u/DF_R_Ila[0]} {stcDemod/ShortBuild.Brik2_u/DF_R_Ila[1]} {stcDemod/ShortBuild.Brik2_u/DF_R_Ila[2]} {stcDemod/ShortBuild.Brik2_u/DF_R_Ila[3]} {stcDemod/ShortBuild.Brik2_u/DF_R_Ila[4]} {stcDemod/ShortBuild.Brik2_u/DF_R_Ila[5]} {stcDemod/ShortBuild.Brik2_u/DF_R_Ila[6]} {stcDemod/ShortBuild.Brik2_u/DF_R_Ila[7]} {stcDemod/ShortBuild.Brik2_u/DF_R_Ila[8]} {stcDemod/ShortBuild.Brik2_u/DF_R_Ila[9]} {stcDemod/ShortBuild.Brik2_u/DF_R_Ila[10]} {stcDemod/ShortBuild.Brik2_u/DF_R_Ila[11]} {stcDemod/ShortBuild.Brik2_u/DF_R_Ila[12]} {stcDemod/ShortBuild.Brik2_u/DF_R_Ila[13]} {stcDemod/ShortBuild.Brik2_u/DF_R_Ila[14]} {stcDemod/ShortBuild.Brik2_u/DF_R_Ila[15]} {stcDemod/ShortBuild.Brik2_u/DF_R_Ila[16]} {stcDemod/ShortBuild.Brik2_u/DF_R_Ila[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe14]
set_property port_width 18 [get_debug_ports u_ila_0/probe14]
connect_debug_port u_ila_0/probe14 [get_nets [list {stcDemod/ShortBuild.Brik2_u/H1EstR_Ila[0]} {stcDemod/ShortBuild.Brik2_u/H1EstR_Ila[1]} {stcDemod/ShortBuild.Brik2_u/H1EstR_Ila[2]} {stcDemod/ShortBuild.Brik2_u/H1EstR_Ila[3]} {stcDemod/ShortBuild.Brik2_u/H1EstR_Ila[4]} {stcDemod/ShortBuild.Brik2_u/H1EstR_Ila[5]} {stcDemod/ShortBuild.Brik2_u/H1EstR_Ila[6]} {stcDemod/ShortBuild.Brik2_u/H1EstR_Ila[7]} {stcDemod/ShortBuild.Brik2_u/H1EstR_Ila[8]} {stcDemod/ShortBuild.Brik2_u/H1EstR_Ila[9]} {stcDemod/ShortBuild.Brik2_u/H1EstR_Ila[10]} {stcDemod/ShortBuild.Brik2_u/H1EstR_Ila[11]} {stcDemod/ShortBuild.Brik2_u/H1EstR_Ila[12]} {stcDemod/ShortBuild.Brik2_u/H1EstR_Ila[13]} {stcDemod/ShortBuild.Brik2_u/H1EstR_Ila[14]} {stcDemod/ShortBuild.Brik2_u/H1EstR_Ila[15]} {stcDemod/ShortBuild.Brik2_u/H1EstR_Ila[16]} {stcDemod/ShortBuild.Brik2_u/H1EstR_Ila[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe15]
set_property port_width 18 [get_debug_ports u_ila_0/probe15]
connect_debug_port u_ila_0/probe15 [get_nets [list {stcDemod/ShortBuild.Brik2_u/H0EstI_Ila[0]} {stcDemod/ShortBuild.Brik2_u/H0EstI_Ila[1]} {stcDemod/ShortBuild.Brik2_u/H0EstI_Ila[2]} {stcDemod/ShortBuild.Brik2_u/H0EstI_Ila[3]} {stcDemod/ShortBuild.Brik2_u/H0EstI_Ila[4]} {stcDemod/ShortBuild.Brik2_u/H0EstI_Ila[5]} {stcDemod/ShortBuild.Brik2_u/H0EstI_Ila[6]} {stcDemod/ShortBuild.Brik2_u/H0EstI_Ila[7]} {stcDemod/ShortBuild.Brik2_u/H0EstI_Ila[8]} {stcDemod/ShortBuild.Brik2_u/H0EstI_Ila[9]} {stcDemod/ShortBuild.Brik2_u/H0EstI_Ila[10]} {stcDemod/ShortBuild.Brik2_u/H0EstI_Ila[11]} {stcDemod/ShortBuild.Brik2_u/H0EstI_Ila[12]} {stcDemod/ShortBuild.Brik2_u/H0EstI_Ila[13]} {stcDemod/ShortBuild.Brik2_u/H0EstI_Ila[14]} {stcDemod/ShortBuild.Brik2_u/H0EstI_Ila[15]} {stcDemod/ShortBuild.Brik2_u/H0EstI_Ila[16]} {stcDemod/ShortBuild.Brik2_u/H0EstI_Ila[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe16]
set_property port_width 18 [get_debug_ports u_ila_0/probe16]
connect_debug_port u_ila_0/probe16 [get_nets [list {stcDemod/ShortBuild.Brik2_u/TauEst0Ila[0]} {stcDemod/ShortBuild.Brik2_u/TauEst0Ila[1]} {stcDemod/ShortBuild.Brik2_u/TauEst0Ila[2]} {stcDemod/ShortBuild.Brik2_u/TauEst0Ila[3]} {stcDemod/ShortBuild.Brik2_u/TauEst0Ila[4]} {stcDemod/ShortBuild.Brik2_u/TauEst0Ila[5]} {stcDemod/ShortBuild.Brik2_u/TauEst0Ila[6]} {stcDemod/ShortBuild.Brik2_u/TauEst0Ila[7]} {stcDemod/ShortBuild.Brik2_u/TauEst0Ila[8]} {stcDemod/ShortBuild.Brik2_u/TauEst0Ila[9]} {stcDemod/ShortBuild.Brik2_u/TauEst0Ila[10]} {stcDemod/ShortBuild.Brik2_u/TauEst0Ila[11]} {stcDemod/ShortBuild.Brik2_u/TauEst0Ila[12]} {stcDemod/ShortBuild.Brik2_u/TauEst0Ila[13]} {stcDemod/ShortBuild.Brik2_u/TauEst0Ila[14]} {stcDemod/ShortBuild.Brik2_u/TauEst0Ila[15]} {stcDemod/ShortBuild.Brik2_u/TauEst0Ila[16]} {stcDemod/ShortBuild.Brik2_u/TauEst0Ila[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe17]
set_property port_width 14 [get_debug_ports u_ila_0/probe17]
connect_debug_port u_ila_0/probe17 [get_nets [list {stcDemod/ShortBuild.FD/WrCount[0]} {stcDemod/ShortBuild.FD/WrCount[1]} {stcDemod/ShortBuild.FD/WrCount[2]} {stcDemod/ShortBuild.FD/WrCount[3]} {stcDemod/ShortBuild.FD/WrCount[4]} {stcDemod/ShortBuild.FD/WrCount[5]} {stcDemod/ShortBuild.FD/WrCount[6]} {stcDemod/ShortBuild.FD/WrCount[7]} {stcDemod/ShortBuild.FD/WrCount[8]} {stcDemod/ShortBuild.FD/WrCount[9]} {stcDemod/ShortBuild.FD/WrCount[10]} {stcDemod/ShortBuild.FD/WrCount[11]} {stcDemod/ShortBuild.FD/WrCount[12]} {stcDemod/ShortBuild.FD/WrCount[13]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe18]
set_property port_width 18 [get_debug_ports u_ila_0/probe18]
connect_debug_port u_ila_0/probe18 [get_nets [list {stcDemod/InIBrik2Ila[0]} {stcDemod/InIBrik2Ila[1]} {stcDemod/InIBrik2Ila[2]} {stcDemod/InIBrik2Ila[3]} {stcDemod/InIBrik2Ila[4]} {stcDemod/InIBrik2Ila[5]} {stcDemod/InIBrik2Ila[6]} {stcDemod/InIBrik2Ila[7]} {stcDemod/InIBrik2Ila[8]} {stcDemod/InIBrik2Ila[9]} {stcDemod/InIBrik2Ila[10]} {stcDemod/InIBrik2Ila[11]} {stcDemod/InIBrik2Ila[12]} {stcDemod/InIBrik2Ila[13]} {stcDemod/InIBrik2Ila[14]} {stcDemod/InIBrik2Ila[15]} {stcDemod/InIBrik2Ila[16]} {stcDemod/InIBrik2Ila[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe19]
set_property port_width 8 [get_debug_ports u_ila_0/probe19]
connect_debug_port u_ila_0/probe19 [get_nets [list {stcDemod/Ber[0]} {stcDemod/Ber[1]} {stcDemod/Ber[2]} {stcDemod/Ber[3]} {stcDemod/Ber[4]} {stcDemod/Ber[5]} {stcDemod/Ber[6]} {stcDemod/Ber[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe20]
set_property port_width 4 [get_debug_ports u_ila_0/probe20]
connect_debug_port u_ila_0/probe20 [get_nets [list {stcDemod/m_ndx0Slv[0]} {stcDemod/m_ndx0Slv[1]} {stcDemod/m_ndx0Slv[2]} {stcDemod/m_ndx0Slv[3]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe21]
set_property port_width 18 [get_debug_ports u_ila_0/probe21]
connect_debug_port u_ila_0/probe21 [get_nets [list {stcDemod/PhaseDiff2xGainSlv[0]} {stcDemod/PhaseDiff2xGainSlv[1]} {stcDemod/PhaseDiff2xGainSlv[2]} {stcDemod/PhaseDiff2xGainSlv[3]} {stcDemod/PhaseDiff2xGainSlv[4]} {stcDemod/PhaseDiff2xGainSlv[5]} {stcDemod/PhaseDiff2xGainSlv[6]} {stcDemod/PhaseDiff2xGainSlv[7]} {stcDemod/PhaseDiff2xGainSlv[8]} {stcDemod/PhaseDiff2xGainSlv[9]} {stcDemod/PhaseDiff2xGainSlv[10]} {stcDemod/PhaseDiff2xGainSlv[11]} {stcDemod/PhaseDiff2xGainSlv[12]} {stcDemod/PhaseDiff2xGainSlv[13]} {stcDemod/PhaseDiff2xGainSlv[14]} {stcDemod/PhaseDiff2xGainSlv[15]} {stcDemod/PhaseDiff2xGainSlv[16]} {stcDemod/PhaseDiff2xGainSlv[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe22]
set_property port_width 18 [get_debug_ports u_ila_0/probe22]
connect_debug_port u_ila_0/probe22 [get_nets [list {stcDemod/PhaseDiff1xGainSlv[0]} {stcDemod/PhaseDiff1xGainSlv[1]} {stcDemod/PhaseDiff1xGainSlv[2]} {stcDemod/PhaseDiff1xGainSlv[3]} {stcDemod/PhaseDiff1xGainSlv[4]} {stcDemod/PhaseDiff1xGainSlv[5]} {stcDemod/PhaseDiff1xGainSlv[6]} {stcDemod/PhaseDiff1xGainSlv[7]} {stcDemod/PhaseDiff1xGainSlv[8]} {stcDemod/PhaseDiff1xGainSlv[9]} {stcDemod/PhaseDiff1xGainSlv[10]} {stcDemod/PhaseDiff1xGainSlv[11]} {stcDemod/PhaseDiff1xGainSlv[12]} {stcDemod/PhaseDiff1xGainSlv[13]} {stcDemod/PhaseDiff1xGainSlv[14]} {stcDemod/PhaseDiff1xGainSlv[15]} {stcDemod/PhaseDiff1xGainSlv[16]} {stcDemod/PhaseDiff1xGainSlv[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe23]
set_property port_width 18 [get_debug_ports u_ila_0/probe23]
connect_debug_port u_ila_0/probe23 [get_nets [list {stcDemod/PhaseDiffSlv[0]} {stcDemod/PhaseDiffSlv[1]} {stcDemod/PhaseDiffSlv[2]} {stcDemod/PhaseDiffSlv[3]} {stcDemod/PhaseDiffSlv[4]} {stcDemod/PhaseDiffSlv[5]} {stcDemod/PhaseDiffSlv[6]} {stcDemod/PhaseDiffSlv[7]} {stcDemod/PhaseDiffSlv[8]} {stcDemod/PhaseDiffSlv[9]} {stcDemod/PhaseDiffSlv[10]} {stcDemod/PhaseDiffSlv[11]} {stcDemod/PhaseDiffSlv[12]} {stcDemod/PhaseDiffSlv[13]} {stcDemod/PhaseDiffSlv[14]} {stcDemod/PhaseDiffSlv[15]} {stcDemod/PhaseDiffSlv[16]} {stcDemod/PhaseDiffSlv[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe24]
set_property port_width 18 [get_debug_ports u_ila_0/probe24]
connect_debug_port u_ila_0/probe24 [get_nets [list {stcDemod/Magnitude1[0]} {stcDemod/Magnitude1[1]} {stcDemod/Magnitude1[2]} {stcDemod/Magnitude1[3]} {stcDemod/Magnitude1[4]} {stcDemod/Magnitude1[5]} {stcDemod/Magnitude1[6]} {stcDemod/Magnitude1[7]} {stcDemod/Magnitude1[8]} {stcDemod/Magnitude1[9]} {stcDemod/Magnitude1[10]} {stcDemod/Magnitude1[11]} {stcDemod/Magnitude1[12]} {stcDemod/Magnitude1[13]} {stcDemod/Magnitude1[14]} {stcDemod/Magnitude1[15]} {stcDemod/Magnitude1[16]} {stcDemod/Magnitude1[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe25]
set_property port_width 18 [get_debug_ports u_ila_0/probe25]
connect_debug_port u_ila_0/probe25 [get_nets [list {stcDemod/Magnitude0[0]} {stcDemod/Magnitude0[1]} {stcDemod/Magnitude0[2]} {stcDemod/Magnitude0[3]} {stcDemod/Magnitude0[4]} {stcDemod/Magnitude0[5]} {stcDemod/Magnitude0[6]} {stcDemod/Magnitude0[7]} {stcDemod/Magnitude0[8]} {stcDemod/Magnitude0[9]} {stcDemod/Magnitude0[10]} {stcDemod/Magnitude0[11]} {stcDemod/Magnitude0[12]} {stcDemod/Magnitude0[13]} {stcDemod/Magnitude0[14]} {stcDemod/Magnitude0[15]} {stcDemod/Magnitude0[16]} {stcDemod/Magnitude0[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe26]
set_property port_width 4 [get_debug_ports u_ila_0/probe26]
connect_debug_port u_ila_0/probe26 [get_nets [list {stcDemod/m_ndx1Slv[0]} {stcDemod/m_ndx1Slv[1]} {stcDemod/m_ndx1Slv[2]} {stcDemod/m_ndx1Slv[3]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe27]
set_property port_width 18 [get_debug_ports u_ila_0/probe27]
connect_debug_port u_ila_0/probe27 [get_nets [list {stcDemod/InRBrik2Ila[0]} {stcDemod/InRBrik2Ila[1]} {stcDemod/InRBrik2Ila[2]} {stcDemod/InRBrik2Ila[3]} {stcDemod/InRBrik2Ila[4]} {stcDemod/InRBrik2Ila[5]} {stcDemod/InRBrik2Ila[6]} {stcDemod/InRBrik2Ila[7]} {stcDemod/InRBrik2Ila[8]} {stcDemod/InRBrik2Ila[9]} {stcDemod/InRBrik2Ila[10]} {stcDemod/InRBrik2Ila[11]} {stcDemod/InRBrik2Ila[12]} {stcDemod/InRBrik2Ila[13]} {stcDemod/InRBrik2Ila[14]} {stcDemod/InRBrik2Ila[15]} {stcDemod/InRBrik2Ila[16]} {stcDemod/InRBrik2Ila[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe28]
set_property port_width 18 [get_debug_ports u_ila_0/probe28]
connect_debug_port u_ila_0/probe28 [get_nets [list {stcDemod/ResampleR[0]} {stcDemod/ResampleR[1]} {stcDemod/ResampleR[2]} {stcDemod/ResampleR[3]} {stcDemod/ResampleR[4]} {stcDemod/ResampleR[5]} {stcDemod/ResampleR[6]} {stcDemod/ResampleR[7]} {stcDemod/ResampleR[8]} {stcDemod/ResampleR[9]} {stcDemod/ResampleR[10]} {stcDemod/ResampleR[11]} {stcDemod/ResampleR[12]} {stcDemod/ResampleR[13]} {stcDemod/ResampleR[14]} {stcDemod/ResampleR[15]} {stcDemod/ResampleR[16]} {stcDemod/ResampleR[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe29]
set_property port_width 18 [get_debug_ports u_ila_0/probe29]
connect_debug_port u_ila_0/probe29 [get_nets [list {stcDemod/ResampleI[0]} {stcDemod/ResampleI[1]} {stcDemod/ResampleI[2]} {stcDemod/ResampleI[3]} {stcDemod/ResampleI[4]} {stcDemod/ResampleI[5]} {stcDemod/ResampleI[6]} {stcDemod/ResampleI[7]} {stcDemod/ResampleI[8]} {stcDemod/ResampleI[9]} {stcDemod/ResampleI[10]} {stcDemod/ResampleI[11]} {stcDemod/ResampleI[12]} {stcDemod/ResampleI[13]} {stcDemod/ResampleI[14]} {stcDemod/ResampleI[15]} {stcDemod/ResampleI[16]} {stcDemod/ResampleI[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe30]
set_property port_width 4 [get_debug_ports u_ila_0/probe30]
connect_debug_port u_ila_0/probe30 [get_nets [list {stcDemod/TrellisBits[0]} {stcDemod/TrellisBits[1]} {stcDemod/TrellisBits[2]} {stcDemod/TrellisBits[3]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe31]
set_property port_width 18 [get_debug_ports u_ila_0/probe31]
connect_debug_port u_ila_0/probe31 [get_nets [list {stcDemod/PD_u/PhsPeak[0]} {stcDemod/PD_u/PhsPeak[1]} {stcDemod/PD_u/PhsPeak[2]} {stcDemod/PD_u/PhsPeak[3]} {stcDemod/PD_u/PhsPeak[4]} {stcDemod/PD_u/PhsPeak[5]} {stcDemod/PD_u/PhsPeak[6]} {stcDemod/PD_u/PhsPeak[7]} {stcDemod/PD_u/PhsPeak[8]} {stcDemod/PD_u/PhsPeak[9]} {stcDemod/PD_u/PhsPeak[10]} {stcDemod/PD_u/PhsPeak[11]} {stcDemod/PD_u/PhsPeak[12]} {stcDemod/PD_u/PhsPeak[13]} {stcDemod/PD_u/PhsPeak[14]} {stcDemod/PD_u/PhsPeak[15]} {stcDemod/PD_u/PhsPeak[16]} {stcDemod/PD_u/PhsPeak[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe32]
set_property port_width 18 [get_debug_ports u_ila_0/probe32]
connect_debug_port u_ila_0/probe32 [get_nets [list {stcDemod/PD_u/PhsPeakInt[0]} {stcDemod/PD_u/PhsPeakInt[1]} {stcDemod/PD_u/PhsPeakInt[2]} {stcDemod/PD_u/PhsPeakInt[3]} {stcDemod/PD_u/PhsPeakInt[4]} {stcDemod/PD_u/PhsPeakInt[5]} {stcDemod/PD_u/PhsPeakInt[6]} {stcDemod/PD_u/PhsPeakInt[7]} {stcDemod/PD_u/PhsPeakInt[8]} {stcDemod/PD_u/PhsPeakInt[9]} {stcDemod/PD_u/PhsPeakInt[10]} {stcDemod/PD_u/PhsPeakInt[11]} {stcDemod/PD_u/PhsPeakInt[12]} {stcDemod/PD_u/PhsPeakInt[13]} {stcDemod/PD_u/PhsPeakInt[14]} {stcDemod/PD_u/PhsPeakInt[15]} {stcDemod/PD_u/PhsPeakInt[16]} {stcDemod/PD_u/PhsPeakInt[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe33]
set_property port_width 18 [get_debug_ports u_ila_0/probe33]
connect_debug_port u_ila_0/probe33 [get_nets [list {stcDemod/PD_u/Peak1_Ila[0]} {stcDemod/PD_u/Peak1_Ila[1]} {stcDemod/PD_u/Peak1_Ila[2]} {stcDemod/PD_u/Peak1_Ila[3]} {stcDemod/PD_u/Peak1_Ila[4]} {stcDemod/PD_u/Peak1_Ila[5]} {stcDemod/PD_u/Peak1_Ila[6]} {stcDemod/PD_u/Peak1_Ila[7]} {stcDemod/PD_u/Peak1_Ila[8]} {stcDemod/PD_u/Peak1_Ila[9]} {stcDemod/PD_u/Peak1_Ila[10]} {stcDemod/PD_u/Peak1_Ila[11]} {stcDemod/PD_u/Peak1_Ila[12]} {stcDemod/PD_u/Peak1_Ila[13]} {stcDemod/PD_u/Peak1_Ila[14]} {stcDemod/PD_u/Peak1_Ila[15]} {stcDemod/PD_u/Peak1_Ila[16]} {stcDemod/PD_u/Peak1_Ila[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe34]
set_property port_width 18 [get_debug_ports u_ila_0/probe34]
connect_debug_port u_ila_0/probe34 [get_nets [list {stcDemod/PD_u/Peak2_Ila[0]} {stcDemod/PD_u/Peak2_Ila[1]} {stcDemod/PD_u/Peak2_Ila[2]} {stcDemod/PD_u/Peak2_Ila[3]} {stcDemod/PD_u/Peak2_Ila[4]} {stcDemod/PD_u/Peak2_Ila[5]} {stcDemod/PD_u/Peak2_Ila[6]} {stcDemod/PD_u/Peak2_Ila[7]} {stcDemod/PD_u/Peak2_Ila[8]} {stcDemod/PD_u/Peak2_Ila[9]} {stcDemod/PD_u/Peak2_Ila[10]} {stcDemod/PD_u/Peak2_Ila[11]} {stcDemod/PD_u/Peak2_Ila[12]} {stcDemod/PD_u/Peak2_Ila[13]} {stcDemod/PD_u/Peak2_Ila[14]} {stcDemod/PD_u/Peak2_Ila[15]} {stcDemod/PD_u/Peak2_Ila[16]} {stcDemod/PD_u/Peak2_Ila[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe35]
set_property port_width 18 [get_debug_ports u_ila_0/probe35]
connect_debug_port u_ila_0/probe35 [get_nets [list {stcDemod/PD_u/PhaseOut0[0]} {stcDemod/PD_u/PhaseOut0[1]} {stcDemod/PD_u/PhaseOut0[2]} {stcDemod/PD_u/PhaseOut0[3]} {stcDemod/PD_u/PhaseOut0[4]} {stcDemod/PD_u/PhaseOut0[5]} {stcDemod/PD_u/PhaseOut0[6]} {stcDemod/PD_u/PhaseOut0[7]} {stcDemod/PD_u/PhaseOut0[8]} {stcDemod/PD_u/PhaseOut0[9]} {stcDemod/PD_u/PhaseOut0[10]} {stcDemod/PD_u/PhaseOut0[11]} {stcDemod/PD_u/PhaseOut0[12]} {stcDemod/PD_u/PhaseOut0[13]} {stcDemod/PD_u/PhaseOut0[14]} {stcDemod/PD_u/PhaseOut0[15]} {stcDemod/PD_u/PhaseOut0[16]} {stcDemod/PD_u/PhaseOut0[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe36]
set_property port_width 18 [get_debug_ports u_ila_0/probe36]
connect_debug_port u_ila_0/probe36 [get_nets [list {stcDemod/PD_u/PhaseOut1[0]} {stcDemod/PD_u/PhaseOut1[1]} {stcDemod/PD_u/PhaseOut1[2]} {stcDemod/PD_u/PhaseOut1[3]} {stcDemod/PD_u/PhaseOut1[4]} {stcDemod/PD_u/PhaseOut1[5]} {stcDemod/PD_u/PhaseOut1[6]} {stcDemod/PD_u/PhaseOut1[7]} {stcDemod/PD_u/PhaseOut1[8]} {stcDemod/PD_u/PhaseOut1[9]} {stcDemod/PD_u/PhaseOut1[10]} {stcDemod/PD_u/PhaseOut1[11]} {stcDemod/PD_u/PhaseOut1[12]} {stcDemod/PD_u/PhaseOut1[13]} {stcDemod/PD_u/PhaseOut1[14]} {stcDemod/PD_u/PhaseOut1[15]} {stcDemod/PD_u/PhaseOut1[16]} {stcDemod/PD_u/PhaseOut1[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe37]
set_property port_width 18 [get_debug_ports u_ila_0/probe37]
connect_debug_port u_ila_0/probe37 [get_nets [list {stcDemod/PD_u/Threshold_Ila[0]} {stcDemod/PD_u/Threshold_Ila[1]} {stcDemod/PD_u/Threshold_Ila[2]} {stcDemod/PD_u/Threshold_Ila[3]} {stcDemod/PD_u/Threshold_Ila[4]} {stcDemod/PD_u/Threshold_Ila[5]} {stcDemod/PD_u/Threshold_Ila[6]} {stcDemod/PD_u/Threshold_Ila[7]} {stcDemod/PD_u/Threshold_Ila[8]} {stcDemod/PD_u/Threshold_Ila[9]} {stcDemod/PD_u/Threshold_Ila[10]} {stcDemod/PD_u/Threshold_Ila[11]} {stcDemod/PD_u/Threshold_Ila[12]} {stcDemod/PD_u/Threshold_Ila[13]} {stcDemod/PD_u/Threshold_Ila[14]} {stcDemod/PD_u/Threshold_Ila[15]} {stcDemod/PD_u/Threshold_Ila[16]} {stcDemod/PD_u/Threshold_Ila[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe38]
set_property port_width 18 [get_debug_ports u_ila_0/probe38]
connect_debug_port u_ila_0/probe38 [get_nets [list {stcDemod/PD_u/PilotMag_Ila[0]} {stcDemod/PD_u/PilotMag_Ila[1]} {stcDemod/PD_u/PilotMag_Ila[2]} {stcDemod/PD_u/PilotMag_Ila[3]} {stcDemod/PD_u/PilotMag_Ila[4]} {stcDemod/PD_u/PilotMag_Ila[5]} {stcDemod/PD_u/PilotMag_Ila[6]} {stcDemod/PD_u/PilotMag_Ila[7]} {stcDemod/PD_u/PilotMag_Ila[8]} {stcDemod/PD_u/PilotMag_Ila[9]} {stcDemod/PD_u/PilotMag_Ila[10]} {stcDemod/PD_u/PilotMag_Ila[11]} {stcDemod/PD_u/PilotMag_Ila[12]} {stcDemod/PD_u/PilotMag_Ila[13]} {stcDemod/PD_u/PilotMag_Ila[14]} {stcDemod/PD_u/PilotMag_Ila[15]} {stcDemod/PD_u/PilotMag_Ila[16]} {stcDemod/PD_u/PilotMag_Ila[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe39]
set_property port_width 18 [get_debug_ports u_ila_0/probe39]
connect_debug_port u_ila_0/probe39 [get_nets [list {stcDemod/PD_u/MagPeak[0]} {stcDemod/PD_u/MagPeak[1]} {stcDemod/PD_u/MagPeak[2]} {stcDemod/PD_u/MagPeak[3]} {stcDemod/PD_u/MagPeak[4]} {stcDemod/PD_u/MagPeak[5]} {stcDemod/PD_u/MagPeak[6]} {stcDemod/PD_u/MagPeak[7]} {stcDemod/PD_u/MagPeak[8]} {stcDemod/PD_u/MagPeak[9]} {stcDemod/PD_u/MagPeak[10]} {stcDemod/PD_u/MagPeak[11]} {stcDemod/PD_u/MagPeak[12]} {stcDemod/PD_u/MagPeak[13]} {stcDemod/PD_u/MagPeak[14]} {stcDemod/PD_u/MagPeak[15]} {stcDemod/PD_u/MagPeak[16]} {stcDemod/PD_u/MagPeak[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe40]
set_property port_width 18 [get_debug_ports u_ila_0/probe40]
connect_debug_port u_ila_0/probe40 [get_nets [list {stcDemod/PD_u/MagPeakInt[0]} {stcDemod/PD_u/MagPeakInt[1]} {stcDemod/PD_u/MagPeakInt[2]} {stcDemod/PD_u/MagPeakInt[3]} {stcDemod/PD_u/MagPeakInt[4]} {stcDemod/PD_u/MagPeakInt[5]} {stcDemod/PD_u/MagPeakInt[6]} {stcDemod/PD_u/MagPeakInt[7]} {stcDemod/PD_u/MagPeakInt[8]} {stcDemod/PD_u/MagPeakInt[9]} {stcDemod/PD_u/MagPeakInt[10]} {stcDemod/PD_u/MagPeakInt[11]} {stcDemod/PD_u/MagPeakInt[12]} {stcDemod/PD_u/MagPeakInt[13]} {stcDemod/PD_u/MagPeakInt[14]} {stcDemod/PD_u/MagPeakInt[15]} {stcDemod/PD_u/MagPeakInt[16]} {stcDemod/PD_u/MagPeakInt[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe41]
set_property port_width 18 [get_debug_ports u_ila_0/probe41]
connect_debug_port u_ila_0/probe41 [get_nets [list {stcDemod/PD_u/AbsCntr0_Ila[0]} {stcDemod/PD_u/AbsCntr0_Ila[1]} {stcDemod/PD_u/AbsCntr0_Ila[2]} {stcDemod/PD_u/AbsCntr0_Ila[3]} {stcDemod/PD_u/AbsCntr0_Ila[4]} {stcDemod/PD_u/AbsCntr0_Ila[5]} {stcDemod/PD_u/AbsCntr0_Ila[6]} {stcDemod/PD_u/AbsCntr0_Ila[7]} {stcDemod/PD_u/AbsCntr0_Ila[8]} {stcDemod/PD_u/AbsCntr0_Ila[9]} {stcDemod/PD_u/AbsCntr0_Ila[10]} {stcDemod/PD_u/AbsCntr0_Ila[11]} {stcDemod/PD_u/AbsCntr0_Ila[12]} {stcDemod/PD_u/AbsCntr0_Ila[13]} {stcDemod/PD_u/AbsCntr0_Ila[14]} {stcDemod/PD_u/AbsCntr0_Ila[15]} {stcDemod/PD_u/AbsCntr0_Ila[16]} {stcDemod/PD_u/AbsCntr0_Ila[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe42]
set_property port_width 16 [get_debug_ports u_ila_0/probe42]
connect_debug_port u_ila_0/probe42 [get_nets [list {stcDemod/PD_u/CorrPntr[0]} {stcDemod/PD_u/CorrPntr[1]} {stcDemod/PD_u/CorrPntr[2]} {stcDemod/PD_u/CorrPntr[3]} {stcDemod/PD_u/CorrPntr[4]} {stcDemod/PD_u/CorrPntr[5]} {stcDemod/PD_u/CorrPntr[6]} {stcDemod/PD_u/CorrPntr[7]} {stcDemod/PD_u/CorrPntr[8]} {stcDemod/PD_u/CorrPntr[9]} {stcDemod/PD_u/CorrPntr[10]} {stcDemod/PD_u/CorrPntr[11]} {stcDemod/PD_u/CorrPntr[12]} {stcDemod/PD_u/CorrPntr[13]} {stcDemod/PD_u/CorrPntr[14]} {stcDemod/PD_u/CorrPntr[15]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe43]
set_property port_width 18 [get_debug_ports u_ila_0/probe43]
connect_debug_port u_ila_0/probe43 [get_nets [list {stcDemod/PD_u/AbsCntr1_Ila[0]} {stcDemod/PD_u/AbsCntr1_Ila[1]} {stcDemod/PD_u/AbsCntr1_Ila[2]} {stcDemod/PD_u/AbsCntr1_Ila[3]} {stcDemod/PD_u/AbsCntr1_Ila[4]} {stcDemod/PD_u/AbsCntr1_Ila[5]} {stcDemod/PD_u/AbsCntr1_Ila[6]} {stcDemod/PD_u/AbsCntr1_Ila[7]} {stcDemod/PD_u/AbsCntr1_Ila[8]} {stcDemod/PD_u/AbsCntr1_Ila[9]} {stcDemod/PD_u/AbsCntr1_Ila[10]} {stcDemod/PD_u/AbsCntr1_Ila[11]} {stcDemod/PD_u/AbsCntr1_Ila[12]} {stcDemod/PD_u/AbsCntr1_Ila[13]} {stcDemod/PD_u/AbsCntr1_Ila[14]} {stcDemod/PD_u/AbsCntr1_Ila[15]} {stcDemod/PD_u/AbsCntr1_Ila[16]} {stcDemod/PD_u/AbsCntr1_Ila[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe44]
set_property port_width 1 [get_debug_ports u_ila_0/probe44]
connect_debug_port u_ila_0/probe44 [get_nets [list ch1DataOut_OBUF]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe45]
set_property port_width 1 [get_debug_ports u_ila_0/probe45]
connect_debug_port u_ila_0/probe45 [get_nets [list stcDemod/ShortBuild.Brik2_u/ChanEstDone]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe46]
set_property port_width 1 [get_debug_ports u_ila_0/probe46]
connect_debug_port u_ila_0/probe46 [get_nets [list stcDemod/ClkOutEn]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe47]
set_property port_width 1 [get_debug_ports u_ila_0/probe47]
connect_debug_port u_ila_0/probe47 [get_nets [list stcDemod/EstimatesDone]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe48]
set_property port_width 1 [get_debug_ports u_ila_0/probe48]
connect_debug_port u_ila_0/probe48 [get_nets [list stcDemod/lastSampleReset]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe49]
set_property port_width 1 [get_debug_ports u_ila_0/probe49]
connect_debug_port u_ila_0/probe49 [get_nets [list stcDemod/PD_u/H0Cntr_x_Fft/OverFlow]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe50]
set_property port_width 1 [get_debug_ports u_ila_0/probe50]
connect_debug_port u_ila_0/probe50 [get_nets [list stcDemod/PD_u/H1Cntr_x_Fft/OverFlow]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe51]
set_property port_width 1 [get_debug_ports u_ila_0/probe51]
connect_debug_port u_ila_0/probe51 [get_nets [list stcDemod/PS_u/CmplxMultH0/OverFlow]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe52]
set_property port_width 1 [get_debug_ports u_ila_0/probe52]
connect_debug_port u_ila_0/probe52 [get_nets [list stcDemod/PS_u/CmplxMultH1/OverFlow]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe53]
set_property port_width 1 [get_debug_ports u_ila_0/probe53]
connect_debug_port u_ila_0/probe53 [get_nets [list stcDemod/PD_u/OverflowFft]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe54]
set_property port_width 1 [get_debug_ports u_ila_0/probe54]
connect_debug_port u_ila_0/probe54 [get_nets [list stcDemod/PD_u/OverflowIFft]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe55]
set_property port_width 1 [get_debug_ports u_ila_0/probe55]
connect_debug_port u_ila_0/probe55 [get_nets [list stcDemod/PhaseDiffEn]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe56]
set_property port_width 1 [get_debug_ports u_ila_0/probe56]
connect_debug_port u_ila_0/probe56 [get_nets [list stcDemod/PD_u/PilotFound]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe57]
set_property port_width 1 [get_debug_ports u_ila_0/probe57]
connect_debug_port u_ila_0/probe57 [get_nets [list stcDemod/StartIla]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe58]
set_property port_width 1 [get_debug_ports u_ila_0/probe58]
connect_debug_port u_ila_0/probe58 [get_nets [list stcDemod/PS_u/StartOut]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe59]
set_property port_width 1 [get_debug_ports u_ila_0/probe59]
connect_debug_port u_ila_0/probe59 [get_nets [list stcDemod/ShortBuild.Brik2_u/StartTime]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe60]
set_property port_width 1 [get_debug_ports u_ila_0/probe60]
connect_debug_port u_ila_0/probe60 [get_nets [list stcDemod/ShortBuild.Brik2_u/TimeEstDone]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe61]
set_property port_width 1 [get_debug_ports u_ila_0/probe61]
connect_debug_port u_ila_0/probe61 [get_nets [list stcDemod/TrellisFull]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe62]
set_property port_width 1 [get_debug_ports u_ila_0/probe62]
connect_debug_port u_ila_0/probe62 [get_nets [list stcDemod/TrellisOutEn]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe63]
set_property port_width 1 [get_debug_ports u_ila_0/probe63]
connect_debug_port u_ila_0/probe63 [get_nets [list stcDemod/ValidData2047]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe64]
set_property port_width 1 [get_debug_ports u_ila_0/probe64]
connect_debug_port u_ila_0/probe64 [get_nets [list stcDemod/ShortBuild.Brik2_u/ValidDF_ILA]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe65]
set_property port_width 1 [get_debug_ports u_ila_0/probe65]
connect_debug_port u_ila_0/probe65 [get_nets [list stcDemod/ValidIla]]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets dac2_clk_OBUF]
