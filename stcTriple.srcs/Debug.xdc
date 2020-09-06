




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
set_property port_width 18 [get_debug_ports u_ila_0/probe0]
connect_debug_port u_ila_0/probe0 [get_nets [list {stcDemod/PD_u/Peak3_Ila[0]} {stcDemod/PD_u/Peak3_Ila[1]} {stcDemod/PD_u/Peak3_Ila[2]} {stcDemod/PD_u/Peak3_Ila[3]} {stcDemod/PD_u/Peak3_Ila[4]} {stcDemod/PD_u/Peak3_Ila[5]} {stcDemod/PD_u/Peak3_Ila[6]} {stcDemod/PD_u/Peak3_Ila[7]} {stcDemod/PD_u/Peak3_Ila[8]} {stcDemod/PD_u/Peak3_Ila[9]} {stcDemod/PD_u/Peak3_Ila[10]} {stcDemod/PD_u/Peak3_Ila[11]} {stcDemod/PD_u/Peak3_Ila[12]} {stcDemod/PD_u/Peak3_Ila[13]} {stcDemod/PD_u/Peak3_Ila[14]} {stcDemod/PD_u/Peak3_Ila[15]} {stcDemod/PD_u/Peak3_Ila[16]} {stcDemod/PD_u/Peak3_Ila[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe1]
set_property port_width 15 [get_debug_ports u_ila_0/probe1]
connect_debug_port u_ila_0/probe1 [get_nets [list {stcDemod/Trellis_u/fa/depth[0]} {stcDemod/Trellis_u/fa/depth[1]} {stcDemod/Trellis_u/fa/depth[2]} {stcDemod/Trellis_u/fa/depth[3]} {stcDemod/Trellis_u/fa/depth[4]} {stcDemod/Trellis_u/fa/depth[5]} {stcDemod/Trellis_u/fa/depth[6]} {stcDemod/Trellis_u/fa/depth[7]} {stcDemod/Trellis_u/fa/depth[8]} {stcDemod/Trellis_u/fa/depth[9]} {stcDemod/Trellis_u/fa/depth[10]} {stcDemod/Trellis_u/fa/depth[11]} {stcDemod/Trellis_u/fa/depth[12]} {stcDemod/Trellis_u/fa/depth[13]} {stcDemod/Trellis_u/fa/depth[14]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe2]
set_property port_width 15 [get_debug_ports u_ila_0/probe2]
connect_debug_port u_ila_0/probe2 [get_nets [list {stcDemod/Trellis_u/fa/rdAddr[0]} {stcDemod/Trellis_u/fa/rdAddr[1]} {stcDemod/Trellis_u/fa/rdAddr[2]} {stcDemod/Trellis_u/fa/rdAddr[3]} {stcDemod/Trellis_u/fa/rdAddr[4]} {stcDemod/Trellis_u/fa/rdAddr[5]} {stcDemod/Trellis_u/fa/rdAddr[6]} {stcDemod/Trellis_u/fa/rdAddr[7]} {stcDemod/Trellis_u/fa/rdAddr[8]} {stcDemod/Trellis_u/fa/rdAddr[9]} {stcDemod/Trellis_u/fa/rdAddr[10]} {stcDemod/Trellis_u/fa/rdAddr[11]} {stcDemod/Trellis_u/fa/rdAddr[12]} {stcDemod/Trellis_u/fa/rdAddr[13]} {stcDemod/Trellis_u/fa/rdAddr[14]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe3]
set_property port_width 15 [get_debug_ports u_ila_0/probe3]
connect_debug_port u_ila_0/probe3 [get_nets [list {stcDemod/Trellis_u/fa/sampleCount_reg[0]} {stcDemod/Trellis_u/fa/sampleCount_reg[1]} {stcDemod/Trellis_u/fa/sampleCount_reg[2]} {stcDemod/Trellis_u/fa/sampleCount_reg[3]} {stcDemod/Trellis_u/fa/sampleCount_reg[4]} {stcDemod/Trellis_u/fa/sampleCount_reg[5]} {stcDemod/Trellis_u/fa/sampleCount_reg[6]} {stcDemod/Trellis_u/fa/sampleCount_reg[7]} {stcDemod/Trellis_u/fa/sampleCount_reg[8]} {stcDemod/Trellis_u/fa/sampleCount_reg[9]} {stcDemod/Trellis_u/fa/sampleCount_reg[10]} {stcDemod/Trellis_u/fa/sampleCount_reg[11]} {stcDemod/Trellis_u/fa/sampleCount_reg[12]} {stcDemod/Trellis_u/fa/sampleCount_reg[13]} {stcDemod/Trellis_u/fa/sampleCount_reg[14]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe4]
set_property port_width 15 [get_debug_ports u_ila_0/probe4]
connect_debug_port u_ila_0/probe4 [get_nets [list {stcDemod/Trellis_u/fa/wrAddr[0]} {stcDemod/Trellis_u/fa/wrAddr[1]} {stcDemod/Trellis_u/fa/wrAddr[2]} {stcDemod/Trellis_u/fa/wrAddr[3]} {stcDemod/Trellis_u/fa/wrAddr[4]} {stcDemod/Trellis_u/fa/wrAddr[5]} {stcDemod/Trellis_u/fa/wrAddr[6]} {stcDemod/Trellis_u/fa/wrAddr[7]} {stcDemod/Trellis_u/fa/wrAddr[8]} {stcDemod/Trellis_u/fa/wrAddr[9]} {stcDemod/Trellis_u/fa/wrAddr[10]} {stcDemod/Trellis_u/fa/wrAddr[11]} {stcDemod/Trellis_u/fa/wrAddr[12]} {stcDemod/Trellis_u/fa/wrAddr[13]} {stcDemod/Trellis_u/fa/wrAddr[14]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe5]
set_property port_width 1 [get_debug_ports u_ila_0/probe5]
connect_debug_port u_ila_0/probe5 [get_nets [list {stcDemod/FD/Accum_reg[0]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe6]
set_property port_width 15 [get_debug_ports u_ila_0/probe6]
connect_debug_port u_ila_0/probe6 [get_nets [list {stcDemod/FD/Accum_reg__0[-15]} {stcDemod/FD/Accum_reg__0[-14]} {stcDemod/FD/Accum_reg__0[-13]} {stcDemod/FD/Accum_reg__0[-12]} {stcDemod/FD/Accum_reg__0[-11]} {stcDemod/FD/Accum_reg__0[-10]} {stcDemod/FD/Accum_reg__0[-9]} {stcDemod/FD/Accum_reg__0[-8]} {stcDemod/FD/Accum_reg__0[-7]} {stcDemod/FD/Accum_reg__0[-6]} {stcDemod/FD/Accum_reg__0[-5]} {stcDemod/FD/Accum_reg__0[-4]} {stcDemod/FD/Accum_reg__0[-3]} {stcDemod/FD/Accum_reg__0[-2]} {stcDemod/FD/Accum_reg__0[-1]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe7]
set_property port_width 16 [get_debug_ports u_ila_0/probe7]
connect_debug_port u_ila_0/probe7 [get_nets [list {stcDemod/FD/ClocksPerBit[-15]} {stcDemod/FD/ClocksPerBit[-14]} {stcDemod/FD/ClocksPerBit[-13]} {stcDemod/FD/ClocksPerBit[-12]} {stcDemod/FD/ClocksPerBit[-11]} {stcDemod/FD/ClocksPerBit[-10]} {stcDemod/FD/ClocksPerBit[-9]} {stcDemod/FD/ClocksPerBit[-8]} {stcDemod/FD/ClocksPerBit[-7]} {stcDemod/FD/ClocksPerBit[-6]} {stcDemod/FD/ClocksPerBit[-5]} {stcDemod/FD/ClocksPerBit[-4]} {stcDemod/FD/ClocksPerBit[-3]} {stcDemod/FD/ClocksPerBit[-2]} {stcDemod/FD/ClocksPerBit[-1]} {stcDemod/FD/ClocksPerBit[0]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe8]
set_property port_width 14 [get_debug_ports u_ila_0/probe8]
connect_debug_port u_ila_0/probe8 [get_nets [list {stcDemod/FD/FifoDepth[0]} {stcDemod/FD/FifoDepth[1]} {stcDemod/FD/FifoDepth[2]} {stcDemod/FD/FifoDepth[3]} {stcDemod/FD/FifoDepth[4]} {stcDemod/FD/FifoDepth[5]} {stcDemod/FD/FifoDepth[6]} {stcDemod/FD/FifoDepth[7]} {stcDemod/FD/FifoDepth[8]} {stcDemod/FD/FifoDepth[9]} {stcDemod/FD/FifoDepth[10]} {stcDemod/FD/FifoDepth[11]} {stcDemod/FD/FifoDepth[12]} {stcDemod/FD/FifoDepth[13]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe9]
set_property port_width 18 [get_debug_ports u_ila_0/probe9]
connect_debug_port u_ila_0/probe9 [get_nets [list {stcDemod/PD_u/AbsCntr0_Ila[0]} {stcDemod/PD_u/AbsCntr0_Ila[1]} {stcDemod/PD_u/AbsCntr0_Ila[2]} {stcDemod/PD_u/AbsCntr0_Ila[3]} {stcDemod/PD_u/AbsCntr0_Ila[4]} {stcDemod/PD_u/AbsCntr0_Ila[5]} {stcDemod/PD_u/AbsCntr0_Ila[6]} {stcDemod/PD_u/AbsCntr0_Ila[7]} {stcDemod/PD_u/AbsCntr0_Ila[8]} {stcDemod/PD_u/AbsCntr0_Ila[9]} {stcDemod/PD_u/AbsCntr0_Ila[10]} {stcDemod/PD_u/AbsCntr0_Ila[11]} {stcDemod/PD_u/AbsCntr0_Ila[12]} {stcDemod/PD_u/AbsCntr0_Ila[13]} {stcDemod/PD_u/AbsCntr0_Ila[14]} {stcDemod/PD_u/AbsCntr0_Ila[15]} {stcDemod/PD_u/AbsCntr0_Ila[16]} {stcDemod/PD_u/AbsCntr0_Ila[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe10]
set_property port_width 18 [get_debug_ports u_ila_0/probe10]
connect_debug_port u_ila_0/probe10 [get_nets [list {stcDemod/PD_u/AbsCntr1_Ila[0]} {stcDemod/PD_u/AbsCntr1_Ila[1]} {stcDemod/PD_u/AbsCntr1_Ila[2]} {stcDemod/PD_u/AbsCntr1_Ila[3]} {stcDemod/PD_u/AbsCntr1_Ila[4]} {stcDemod/PD_u/AbsCntr1_Ila[5]} {stcDemod/PD_u/AbsCntr1_Ila[6]} {stcDemod/PD_u/AbsCntr1_Ila[7]} {stcDemod/PD_u/AbsCntr1_Ila[8]} {stcDemod/PD_u/AbsCntr1_Ila[9]} {stcDemod/PD_u/AbsCntr1_Ila[10]} {stcDemod/PD_u/AbsCntr1_Ila[11]} {stcDemod/PD_u/AbsCntr1_Ila[12]} {stcDemod/PD_u/AbsCntr1_Ila[13]} {stcDemod/PD_u/AbsCntr1_Ila[14]} {stcDemod/PD_u/AbsCntr1_Ila[15]} {stcDemod/PD_u/AbsCntr1_Ila[16]} {stcDemod/PD_u/AbsCntr1_Ila[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe11]
set_property port_width 18 [get_debug_ports u_ila_0/probe11]
connect_debug_port u_ila_0/probe11 [get_nets [list {stcDemod/PD_u/Peak1_Ila[0]} {stcDemod/PD_u/Peak1_Ila[1]} {stcDemod/PD_u/Peak1_Ila[2]} {stcDemod/PD_u/Peak1_Ila[3]} {stcDemod/PD_u/Peak1_Ila[4]} {stcDemod/PD_u/Peak1_Ila[5]} {stcDemod/PD_u/Peak1_Ila[6]} {stcDemod/PD_u/Peak1_Ila[7]} {stcDemod/PD_u/Peak1_Ila[8]} {stcDemod/PD_u/Peak1_Ila[9]} {stcDemod/PD_u/Peak1_Ila[10]} {stcDemod/PD_u/Peak1_Ila[11]} {stcDemod/PD_u/Peak1_Ila[12]} {stcDemod/PD_u/Peak1_Ila[13]} {stcDemod/PD_u/Peak1_Ila[14]} {stcDemod/PD_u/Peak1_Ila[15]} {stcDemod/PD_u/Peak1_Ila[16]} {stcDemod/PD_u/Peak1_Ila[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe12]
set_property port_width 10 [get_debug_ports u_ila_0/probe12]
connect_debug_port u_ila_0/probe12 [get_nets [list {stcDemod/DataAddr[0]} {stcDemod/DataAddr[1]} {stcDemod/DataAddr[2]} {stcDemod/DataAddr[3]} {stcDemod/DataAddr[4]} {stcDemod/DataAddr[5]} {stcDemod/DataAddr[6]} {stcDemod/DataAddr[7]} {stcDemod/DataAddr[8]} {stcDemod/DataAddr[9]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe13]
set_property port_width 13 [get_debug_ports u_ila_0/probe13]
connect_debug_port u_ila_0/probe13 [get_nets [list {stcDemod/H0Mag[0]} {stcDemod/H0Mag[1]} {stcDemod/H0Mag[2]} {stcDemod/H0Mag[3]} {stcDemod/H0Mag[4]} {stcDemod/H0Mag[5]} {stcDemod/H0Mag[6]} {stcDemod/H0Mag[7]} {stcDemod/H0Mag[8]} {stcDemod/H0Mag[9]} {stcDemod/H0Mag[10]} {stcDemod/H0Mag[11]} {stcDemod/H0Mag[12]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe14]
set_property port_width 13 [get_debug_ports u_ila_0/probe14]
connect_debug_port u_ila_0/probe14 [get_nets [list {stcDemod/H1Mag[0]} {stcDemod/H1Mag[1]} {stcDemod/H1Mag[2]} {stcDemod/H1Mag[3]} {stcDemod/H1Mag[4]} {stcDemod/H1Mag[5]} {stcDemod/H1Mag[6]} {stcDemod/H1Mag[7]} {stcDemod/H1Mag[8]} {stcDemod/H1Mag[9]} {stcDemod/H1Mag[10]} {stcDemod/H1Mag[11]} {stcDemod/H1Mag[12]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe15]
set_property port_width 18 [get_debug_ports u_ila_0/probe15]
connect_debug_port u_ila_0/probe15 [get_nets [list {stcDemod/InIBrik2Ila[0]} {stcDemod/InIBrik2Ila[1]} {stcDemod/InIBrik2Ila[2]} {stcDemod/InIBrik2Ila[3]} {stcDemod/InIBrik2Ila[4]} {stcDemod/InIBrik2Ila[5]} {stcDemod/InIBrik2Ila[6]} {stcDemod/InIBrik2Ila[7]} {stcDemod/InIBrik2Ila[8]} {stcDemod/InIBrik2Ila[9]} {stcDemod/InIBrik2Ila[10]} {stcDemod/InIBrik2Ila[11]} {stcDemod/InIBrik2Ila[12]} {stcDemod/InIBrik2Ila[13]} {stcDemod/InIBrik2Ila[14]} {stcDemod/InIBrik2Ila[15]} {stcDemod/InIBrik2Ila[16]} {stcDemod/InIBrik2Ila[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe16]
set_property port_width 18 [get_debug_ports u_ila_0/probe16]
connect_debug_port u_ila_0/probe16 [get_nets [list {stcDemod/InRBrik2Ila[0]} {stcDemod/InRBrik2Ila[1]} {stcDemod/InRBrik2Ila[2]} {stcDemod/InRBrik2Ila[3]} {stcDemod/InRBrik2Ila[4]} {stcDemod/InRBrik2Ila[5]} {stcDemod/InRBrik2Ila[6]} {stcDemod/InRBrik2Ila[7]} {stcDemod/InRBrik2Ila[8]} {stcDemod/InRBrik2Ila[9]} {stcDemod/InRBrik2Ila[10]} {stcDemod/InRBrik2Ila[11]} {stcDemod/InRBrik2Ila[12]} {stcDemod/InRBrik2Ila[13]} {stcDemod/InRBrik2Ila[14]} {stcDemod/InRBrik2Ila[15]} {stcDemod/InRBrik2Ila[16]} {stcDemod/InRBrik2Ila[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe17]
set_property port_width 18 [get_debug_ports u_ila_0/probe17]
connect_debug_port u_ila_0/probe17 [get_nets [list {stcDemod/MagISlv[0]} {stcDemod/MagISlv[1]} {stcDemod/MagISlv[2]} {stcDemod/MagISlv[3]} {stcDemod/MagISlv[4]} {stcDemod/MagISlv[5]} {stcDemod/MagISlv[6]} {stcDemod/MagISlv[7]} {stcDemod/MagISlv[8]} {stcDemod/MagISlv[9]} {stcDemod/MagISlv[10]} {stcDemod/MagISlv[11]} {stcDemod/MagISlv[12]} {stcDemod/MagISlv[13]} {stcDemod/MagISlv[14]} {stcDemod/MagISlv[15]} {stcDemod/MagISlv[16]} {stcDemod/MagISlv[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe18]
set_property port_width 18 [get_debug_ports u_ila_0/probe18]
connect_debug_port u_ila_0/probe18 [get_nets [list {stcDemod/MagRSlv[0]} {stcDemod/MagRSlv[1]} {stcDemod/MagRSlv[2]} {stcDemod/MagRSlv[3]} {stcDemod/MagRSlv[4]} {stcDemod/MagRSlv[5]} {stcDemod/MagRSlv[6]} {stcDemod/MagRSlv[7]} {stcDemod/MagRSlv[8]} {stcDemod/MagRSlv[9]} {stcDemod/MagRSlv[10]} {stcDemod/MagRSlv[11]} {stcDemod/MagRSlv[12]} {stcDemod/MagRSlv[13]} {stcDemod/MagRSlv[14]} {stcDemod/MagRSlv[15]} {stcDemod/MagRSlv[16]} {stcDemod/MagRSlv[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe19]
set_property port_width 18 [get_debug_ports u_ila_0/probe19]
connect_debug_port u_ila_0/probe19 [get_nets [list {stcDemod/PhaseDiffNB[0]} {stcDemod/PhaseDiffNB[1]} {stcDemod/PhaseDiffNB[2]} {stcDemod/PhaseDiffNB[3]} {stcDemod/PhaseDiffNB[4]} {stcDemod/PhaseDiffNB[5]} {stcDemod/PhaseDiffNB[6]} {stcDemod/PhaseDiffNB[7]} {stcDemod/PhaseDiffNB[8]} {stcDemod/PhaseDiffNB[9]} {stcDemod/PhaseDiffNB[10]} {stcDemod/PhaseDiffNB[11]} {stcDemod/PhaseDiffNB[12]} {stcDemod/PhaseDiffNB[13]} {stcDemod/PhaseDiffNB[14]} {stcDemod/PhaseDiffNB[15]} {stcDemod/PhaseDiffNB[16]} {stcDemod/PhaseDiffNB[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe20]
set_property port_width 18 [get_debug_ports u_ila_0/probe20]
connect_debug_port u_ila_0/probe20 [get_nets [list {stcDemod/PhaseDiffWB[0]} {stcDemod/PhaseDiffWB[1]} {stcDemod/PhaseDiffWB[2]} {stcDemod/PhaseDiffWB[3]} {stcDemod/PhaseDiffWB[4]} {stcDemod/PhaseDiffWB[5]} {stcDemod/PhaseDiffWB[6]} {stcDemod/PhaseDiffWB[7]} {stcDemod/PhaseDiffWB[8]} {stcDemod/PhaseDiffWB[9]} {stcDemod/PhaseDiffWB[10]} {stcDemod/PhaseDiffWB[11]} {stcDemod/PhaseDiffWB[12]} {stcDemod/PhaseDiffWB[13]} {stcDemod/PhaseDiffWB[14]} {stcDemod/PhaseDiffWB[15]} {stcDemod/PhaseDiffWB[16]} {stcDemod/PhaseDiffWB[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe21]
set_property port_width 12 [get_debug_ports u_ila_0/probe21]
connect_debug_port u_ila_0/probe21 [get_nets [list {stcDemod/PhaseDiffs[0]} {stcDemod/PhaseDiffs[1]} {stcDemod/PhaseDiffs[2]} {stcDemod/PhaseDiffs[3]} {stcDemod/PhaseDiffs[4]} {stcDemod/PhaseDiffs[5]} {stcDemod/PhaseDiffs[6]} {stcDemod/PhaseDiffs[7]} {stcDemod/PhaseDiffs[8]} {stcDemod/PhaseDiffs[9]} {stcDemod/PhaseDiffs[10]} {stcDemod/PhaseDiffs[11]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe22]
set_property port_width 9 [get_debug_ports u_ila_0/probe22]
connect_debug_port u_ila_0/probe22 [get_nets [list {stcDemod/PilotOffset[0]} {stcDemod/PilotOffset[1]} {stcDemod/PilotOffset[2]} {stcDemod/PilotOffset[3]} {stcDemod/PilotOffset[4]} {stcDemod/PilotOffset[5]} {stcDemod/PilotOffset[6]} {stcDemod/PilotOffset[7]} {stcDemod/PilotOffset[8]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe23]
set_property port_width 4 [get_debug_ports u_ila_0/probe23]
connect_debug_port u_ila_0/probe23 [get_nets [list {stcDemod/TrellisBits[0]} {stcDemod/TrellisBits[1]} {stcDemod/TrellisBits[2]} {stcDemod/TrellisBits[3]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe24]
set_property port_width 6 [get_debug_ports u_ila_0/probe24]
connect_debug_port u_ila_0/probe24 [get_nets [list {stcDemod/deltaTauEstSlv[0]} {stcDemod/deltaTauEstSlv[1]} {stcDemod/deltaTauEstSlv[2]} {stcDemod/deltaTauEstSlv[3]} {stcDemod/deltaTauEstSlv[4]} {stcDemod/deltaTauEstSlv[5]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe25]
set_property port_width 4 [get_debug_ports u_ila_0/probe25]
connect_debug_port u_ila_0/probe25 [get_nets [list {stcDemod/m_ndx0Slv[0]} {stcDemod/m_ndx0Slv[1]} {stcDemod/m_ndx0Slv[2]} {stcDemod/m_ndx0Slv[3]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe26]
set_property port_width 4 [get_debug_ports u_ila_0/probe26]
connect_debug_port u_ila_0/probe26 [get_nets [list {stcDemod/m_ndx1Slv[0]} {stcDemod/m_ndx1Slv[1]} {stcDemod/m_ndx1Slv[2]} {stcDemod/m_ndx1Slv[3]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe27]
set_property port_width 5 [get_debug_ports u_ila_0/probe27]
connect_debug_port u_ila_0/probe27 [get_nets [list {stcDdc/ddc/gainI/integrator_reg[31]_0[0]} {stcDdc/ddc/gainI/integrator_reg[31]_0[1]} {stcDdc/ddc/gainI/integrator_reg[31]_0[2]} {stcDdc/ddc/gainI/integrator_reg[31]_0[3]} {stcDdc/ddc/gainI/integrator_reg[31]_0[4]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe28]
set_property port_width 32 [get_debug_ports u_ila_0/probe28]
connect_debug_port u_ila_0/probe28 [get_nets [list {stcDdc/sampleFreq[0]} {stcDdc/sampleFreq[1]} {stcDdc/sampleFreq[2]} {stcDdc/sampleFreq[3]} {stcDdc/sampleFreq[4]} {stcDdc/sampleFreq[5]} {stcDdc/sampleFreq[6]} {stcDdc/sampleFreq[7]} {stcDdc/sampleFreq[8]} {stcDdc/sampleFreq[9]} {stcDdc/sampleFreq[10]} {stcDdc/sampleFreq[11]} {stcDdc/sampleFreq[12]} {stcDdc/sampleFreq[13]} {stcDdc/sampleFreq[14]} {stcDdc/sampleFreq[15]} {stcDdc/sampleFreq[16]} {stcDdc/sampleFreq[17]} {stcDdc/sampleFreq[18]} {stcDdc/sampleFreq[19]} {stcDdc/sampleFreq[20]} {stcDdc/sampleFreq[21]} {stcDdc/sampleFreq[22]} {stcDdc/sampleFreq[23]} {stcDdc/sampleFreq[24]} {stcDdc/sampleFreq[25]} {stcDdc/sampleFreq[26]} {stcDdc/sampleFreq[27]} {stcDdc/sampleFreq[28]} {stcDdc/sampleFreq[29]} {stcDdc/sampleFreq[30]} {stcDdc/sampleFreq[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe29]
set_property port_width 1 [get_debug_ports u_ila_0/probe29]
connect_debug_port u_ila_0/probe29 [get_nets [list stcDemod/ClkOutEn]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe30]
set_property port_width 1 [get_debug_ports u_ila_0/probe30]
connect_debug_port u_ila_0/probe30 [get_nets [list stcDemod/DataOut]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe31]
set_property port_width 1 [get_debug_ports u_ila_0/probe31]
connect_debug_port u_ila_0/probe31 [get_nets [list stcDemod/FD/empty]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe32]
set_property port_width 1 [get_debug_ports u_ila_0/probe32]
connect_debug_port u_ila_0/probe32 [get_nets [list stcDemod/EstimatesDone]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe33]
set_property port_width 1 [get_debug_ports u_ila_0/probe33]
connect_debug_port u_ila_0/probe33 [get_nets [list stcDemod/Mag0GtMag1]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe34]
set_property port_width 1 [get_debug_ports u_ila_0/probe34]
connect_debug_port u_ila_0/probe34 [get_nets [list stcDemod/PilotFoundCE]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe35]
set_property port_width 1 [get_debug_ports u_ila_0/probe35]
connect_debug_port u_ila_0/probe35 [get_nets [list stcDemod/PilotFoundPD]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe36]
set_property port_width 1 [get_debug_ports u_ila_0/probe36]
connect_debug_port u_ila_0/probe36 [get_nets [list stcDemod/PrnErrors]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe37]
set_property port_width 1 [get_debug_ports u_ila_0/probe37]
connect_debug_port u_ila_0/probe37 [get_nets [list stcDemod/StartIla]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe38]
set_property port_width 1 [get_debug_ports u_ila_0/probe38]
connect_debug_port u_ila_0/probe38 [get_nets [list stcDemod/TrellisOutEn]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe39]
set_property port_width 1 [get_debug_ports u_ila_0/probe39]
connect_debug_port u_ila_0/probe39 [get_nets [list stcDemod/ValidData2047]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe40]
set_property port_width 1 [get_debug_ports u_ila_0/probe40]
connect_debug_port u_ila_0/probe40 [get_nets [list stcDemod/ValidIla]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe41]
set_property port_width 1 [get_debug_ports u_ila_0/probe41]
connect_debug_port u_ila_0/probe41 [get_nets [list stcDemod/Trellis_u/fa/lastSample_reg_n_1]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe42]
set_property port_width 1 [get_debug_ports u_ila_0/probe42]
connect_debug_port u_ila_0/probe42 [get_nets [list stcDemod/Trellis_u/fa/lastSamplesAvailable_reg_n_1]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe43]
set_property port_width 1 [get_debug_ports u_ila_0/probe43]
connect_debug_port u_ila_0/probe43 [get_nets [list stcDemod/Trellis_u/fa/fifoWrEn]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe44]
set_property port_width 1 [get_debug_ports u_ila_0/probe44]
connect_debug_port u_ila_0/probe44 [get_nets [list stcDemod/Trellis_u/fa/frameStart]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe45]
set_property port_width 1 [get_debug_ports u_ila_0/probe45]
connect_debug_port u_ila_0/probe45 [get_nets [list stcDemod/Trellis_u/fa/interpolate]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe46]
set_property port_width 1 [get_debug_ports u_ila_0/probe46]
connect_debug_port u_ila_0/probe46 [get_nets [list stcDemod/Trellis_u/fa/myStartOfTrellis]]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets clk2x]
