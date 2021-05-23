

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
connect_debug_port u_ila_0/clk [get_nets [list systemClock/inst/clk1x]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe0]
set_property port_width 18 [get_debug_ports u_ila_0/probe0]
connect_debug_port u_ila_0/probe0 [get_nets [list {DigitalCombiner_u/IF_Align_u/AgcVoltage1Slv[0]} {DigitalCombiner_u/IF_Align_u/AgcVoltage1Slv[1]} {DigitalCombiner_u/IF_Align_u/AgcVoltage1Slv[2]} {DigitalCombiner_u/IF_Align_u/AgcVoltage1Slv[3]} {DigitalCombiner_u/IF_Align_u/AgcVoltage1Slv[4]} {DigitalCombiner_u/IF_Align_u/AgcVoltage1Slv[5]} {DigitalCombiner_u/IF_Align_u/AgcVoltage1Slv[6]} {DigitalCombiner_u/IF_Align_u/AgcVoltage1Slv[7]} {DigitalCombiner_u/IF_Align_u/AgcVoltage1Slv[8]} {DigitalCombiner_u/IF_Align_u/AgcVoltage1Slv[9]} {DigitalCombiner_u/IF_Align_u/AgcVoltage1Slv[10]} {DigitalCombiner_u/IF_Align_u/AgcVoltage1Slv[11]} {DigitalCombiner_u/IF_Align_u/AgcVoltage1Slv[12]} {DigitalCombiner_u/IF_Align_u/AgcVoltage1Slv[13]} {DigitalCombiner_u/IF_Align_u/AgcVoltage1Slv[14]} {DigitalCombiner_u/IF_Align_u/AgcVoltage1Slv[15]} {DigitalCombiner_u/IF_Align_u/AgcVoltage1Slv[16]} {DigitalCombiner_u/IF_Align_u/AgcVoltage1Slv[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe1]
set_property port_width 18 [get_debug_ports u_ila_0/probe1]
connect_debug_port u_ila_0/probe1 [get_nets [list {DigitalCombiner_u/IF_Align_u/AgcVoltage2Slv[0]} {DigitalCombiner_u/IF_Align_u/AgcVoltage2Slv[1]} {DigitalCombiner_u/IF_Align_u/AgcVoltage2Slv[2]} {DigitalCombiner_u/IF_Align_u/AgcVoltage2Slv[3]} {DigitalCombiner_u/IF_Align_u/AgcVoltage2Slv[4]} {DigitalCombiner_u/IF_Align_u/AgcVoltage2Slv[5]} {DigitalCombiner_u/IF_Align_u/AgcVoltage2Slv[6]} {DigitalCombiner_u/IF_Align_u/AgcVoltage2Slv[7]} {DigitalCombiner_u/IF_Align_u/AgcVoltage2Slv[8]} {DigitalCombiner_u/IF_Align_u/AgcVoltage2Slv[9]} {DigitalCombiner_u/IF_Align_u/AgcVoltage2Slv[10]} {DigitalCombiner_u/IF_Align_u/AgcVoltage2Slv[11]} {DigitalCombiner_u/IF_Align_u/AgcVoltage2Slv[12]} {DigitalCombiner_u/IF_Align_u/AgcVoltage2Slv[13]} {DigitalCombiner_u/IF_Align_u/AgcVoltage2Slv[14]} {DigitalCombiner_u/IF_Align_u/AgcVoltage2Slv[15]} {DigitalCombiner_u/IF_Align_u/AgcVoltage2Slv[16]} {DigitalCombiner_u/IF_Align_u/AgcVoltage2Slv[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe2]
set_property port_width 18 [get_debug_ports u_ila_0/probe2]
connect_debug_port u_ila_0/probe2 [get_nets [list {DigitalCombiner_u/IF_Align_u/IF_Diff[0]} {DigitalCombiner_u/IF_Align_u/IF_Diff[1]} {DigitalCombiner_u/IF_Align_u/IF_Diff[2]} {DigitalCombiner_u/IF_Align_u/IF_Diff[3]} {DigitalCombiner_u/IF_Align_u/IF_Diff[4]} {DigitalCombiner_u/IF_Align_u/IF_Diff[5]} {DigitalCombiner_u/IF_Align_u/IF_Diff[6]} {DigitalCombiner_u/IF_Align_u/IF_Diff[7]} {DigitalCombiner_u/IF_Align_u/IF_Diff[8]} {DigitalCombiner_u/IF_Align_u/IF_Diff[9]} {DigitalCombiner_u/IF_Align_u/IF_Diff[10]} {DigitalCombiner_u/IF_Align_u/IF_Diff[11]} {DigitalCombiner_u/IF_Align_u/IF_Diff[12]} {DigitalCombiner_u/IF_Align_u/IF_Diff[13]} {DigitalCombiner_u/IF_Align_u/IF_Diff[14]} {DigitalCombiner_u/IF_Align_u/IF_Diff[15]} {DigitalCombiner_u/IF_Align_u/IF_Diff[16]} {DigitalCombiner_u/IF_Align_u/IF_Diff[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe3]
set_property port_width 8 [get_debug_ports u_ila_0/probe3]
connect_debug_port u_ila_0/probe3 [get_nets [list {DigitalCombiner_u/IF_Align_u/IndexAbs[0]} {DigitalCombiner_u/IF_Align_u/IndexAbs[1]} {DigitalCombiner_u/IF_Align_u/IndexAbs[2]} {DigitalCombiner_u/IF_Align_u/IndexAbs[3]} {DigitalCombiner_u/IF_Align_u/IndexAbs[4]} {DigitalCombiner_u/IF_Align_u/IndexAbs[5]} {DigitalCombiner_u/IF_Align_u/IndexAbs[6]} {DigitalCombiner_u/IF_Align_u/IndexAbs[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe4]
set_property port_width 16 [get_debug_ports u_ila_0/probe4]
connect_debug_port u_ila_0/probe4 [get_nets [list {DigitalCombiner_u/IF_Align_u/IndexAcc[-7]} {DigitalCombiner_u/IF_Align_u/IndexAcc[-6]} {DigitalCombiner_u/IF_Align_u/IndexAcc[-5]} {DigitalCombiner_u/IF_Align_u/IndexAcc[-4]} {DigitalCombiner_u/IF_Align_u/IndexAcc[-3]} {DigitalCombiner_u/IF_Align_u/IndexAcc[-2]} {DigitalCombiner_u/IF_Align_u/IndexAcc[-1]} {DigitalCombiner_u/IF_Align_u/IndexAcc[0]} {DigitalCombiner_u/IF_Align_u/IndexAcc[1]} {DigitalCombiner_u/IF_Align_u/IndexAcc[2]} {DigitalCombiner_u/IF_Align_u/IndexAcc[3]} {DigitalCombiner_u/IF_Align_u/IndexAcc[4]} {DigitalCombiner_u/IF_Align_u/IndexAcc[5]} {DigitalCombiner_u/IF_Align_u/IndexAcc[6]} {DigitalCombiner_u/IF_Align_u/IndexAcc[7]} {DigitalCombiner_u/IF_Align_u/IndexAcc[8]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe5]
set_property port_width 8 [get_debug_ports u_ila_0/probe5]
connect_debug_port u_ila_0/probe5 [get_nets [list {DigitalCombiner_u/IF_Align_u/IndexOut[0]} {DigitalCombiner_u/IF_Align_u/IndexOut[1]} {DigitalCombiner_u/IF_Align_u/IndexOut[2]} {DigitalCombiner_u/IF_Align_u/IndexOut[3]} {DigitalCombiner_u/IF_Align_u/IndexOut[4]} {DigitalCombiner_u/IF_Align_u/IndexOut[5]} {DigitalCombiner_u/IF_Align_u/IndexOut[6]} {DigitalCombiner_u/IF_Align_u/IndexOut[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe6]
set_property port_width 2 [get_debug_ports u_ila_0/probe6]
connect_debug_port u_ila_0/probe6 [get_nets [list {DigitalCombiner_u/IF_Align_u/SkipFirst2[0]} {DigitalCombiner_u/IF_Align_u/SkipFirst2[1]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe7]
set_property port_width 18 [get_debug_ports u_ila_0/probe7]
connect_debug_port u_ila_0/probe7 [get_nets [list {DigitalCombiner_u/Real1Out[0]} {DigitalCombiner_u/Real1Out[1]} {DigitalCombiner_u/Real1Out[2]} {DigitalCombiner_u/Real1Out[3]} {DigitalCombiner_u/Real1Out[4]} {DigitalCombiner_u/Real1Out[5]} {DigitalCombiner_u/Real1Out[6]} {DigitalCombiner_u/Real1Out[7]} {DigitalCombiner_u/Real1Out[8]} {DigitalCombiner_u/Real1Out[9]} {DigitalCombiner_u/Real1Out[10]} {DigitalCombiner_u/Real1Out[11]} {DigitalCombiner_u/Real1Out[12]} {DigitalCombiner_u/Real1Out[13]} {DigitalCombiner_u/Real1Out[14]} {DigitalCombiner_u/Real1Out[15]} {DigitalCombiner_u/Real1Out[16]} {DigitalCombiner_u/Real1Out[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe8]
set_property port_width 18 [get_debug_ports u_ila_0/probe8]
connect_debug_port u_ila_0/probe8 [get_nets [list {DigitalCombiner_u/Real2Out[0]} {DigitalCombiner_u/Real2Out[1]} {DigitalCombiner_u/Real2Out[2]} {DigitalCombiner_u/Real2Out[3]} {DigitalCombiner_u/Real2Out[4]} {DigitalCombiner_u/Real2Out[5]} {DigitalCombiner_u/Real2Out[6]} {DigitalCombiner_u/Real2Out[7]} {DigitalCombiner_u/Real2Out[8]} {DigitalCombiner_u/Real2Out[9]} {DigitalCombiner_u/Real2Out[10]} {DigitalCombiner_u/Real2Out[11]} {DigitalCombiner_u/Real2Out[12]} {DigitalCombiner_u/Real2Out[13]} {DigitalCombiner_u/Real2Out[14]} {DigitalCombiner_u/Real2Out[15]} {DigitalCombiner_u/Real2Out[16]} {DigitalCombiner_u/Real2Out[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe9]
set_property port_width 13 [get_debug_ports u_ila_0/probe9]
connect_debug_port u_ila_0/probe9 [get_nets [list {DigitalCombiner_u/addr[0]} {DigitalCombiner_u/addr[1]} {DigitalCombiner_u/addr[2]} {DigitalCombiner_u/addr[3]} {DigitalCombiner_u/addr[4]} {DigitalCombiner_u/addr[5]} {DigitalCombiner_u/addr[6]} {DigitalCombiner_u/addr[7]} {DigitalCombiner_u/addr[8]} {DigitalCombiner_u/addr[9]} {DigitalCombiner_u/addr[10]} {DigitalCombiner_u/addr[11]} {DigitalCombiner_u/addr[12]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe10]
set_property port_width 3 [get_debug_ports u_ila_0/probe10]
connect_debug_port u_ila_0/probe10 [get_nets [list {DigitalCombiner_u/attack[0]} {DigitalCombiner_u/attack[1]} {DigitalCombiner_u/attack[2]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe11]
set_property port_width 32 [get_debug_ports u_ila_0/probe11]
connect_debug_port u_ila_0/probe11 [get_nets [list {DigitalCombiner_u/dataIn[0]} {DigitalCombiner_u/dataIn[1]} {DigitalCombiner_u/dataIn[2]} {DigitalCombiner_u/dataIn[3]} {DigitalCombiner_u/dataIn[4]} {DigitalCombiner_u/dataIn[5]} {DigitalCombiner_u/dataIn[6]} {DigitalCombiner_u/dataIn[7]} {DigitalCombiner_u/dataIn[8]} {DigitalCombiner_u/dataIn[9]} {DigitalCombiner_u/dataIn[10]} {DigitalCombiner_u/dataIn[11]} {DigitalCombiner_u/dataIn[12]} {DigitalCombiner_u/dataIn[13]} {DigitalCombiner_u/dataIn[14]} {DigitalCombiner_u/dataIn[15]} {DigitalCombiner_u/dataIn[16]} {DigitalCombiner_u/dataIn[17]} {DigitalCombiner_u/dataIn[18]} {DigitalCombiner_u/dataIn[19]} {DigitalCombiner_u/dataIn[20]} {DigitalCombiner_u/dataIn[21]} {DigitalCombiner_u/dataIn[22]} {DigitalCombiner_u/dataIn[23]} {DigitalCombiner_u/dataIn[24]} {DigitalCombiner_u/dataIn[25]} {DigitalCombiner_u/dataIn[26]} {DigitalCombiner_u/dataIn[27]} {DigitalCombiner_u/dataIn[28]} {DigitalCombiner_u/dataIn[29]} {DigitalCombiner_u/dataIn[30]} {DigitalCombiner_u/dataIn[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe12]
set_property port_width 32 [get_debug_ports u_ila_0/probe12]
connect_debug_port u_ila_0/probe12 [get_nets [list {DigitalCombiner_u/dataOut[0]} {DigitalCombiner_u/dataOut[1]} {DigitalCombiner_u/dataOut[2]} {DigitalCombiner_u/dataOut[3]} {DigitalCombiner_u/dataOut[4]} {DigitalCombiner_u/dataOut[5]} {DigitalCombiner_u/dataOut[6]} {DigitalCombiner_u/dataOut[7]} {DigitalCombiner_u/dataOut[8]} {DigitalCombiner_u/dataOut[9]} {DigitalCombiner_u/dataOut[10]} {DigitalCombiner_u/dataOut[11]} {DigitalCombiner_u/dataOut[12]} {DigitalCombiner_u/dataOut[13]} {DigitalCombiner_u/dataOut[14]} {DigitalCombiner_u/dataOut[15]} {DigitalCombiner_u/dataOut[16]} {DigitalCombiner_u/dataOut[17]} {DigitalCombiner_u/dataOut[18]} {DigitalCombiner_u/dataOut[19]} {DigitalCombiner_u/dataOut[20]} {DigitalCombiner_u/dataOut[21]} {DigitalCombiner_u/dataOut[22]} {DigitalCombiner_u/dataOut[23]} {DigitalCombiner_u/dataOut[24]} {DigitalCombiner_u/dataOut[25]} {DigitalCombiner_u/dataOut[26]} {DigitalCombiner_u/dataOut[27]} {DigitalCombiner_u/dataOut[28]} {DigitalCombiner_u/dataOut[29]} {DigitalCombiner_u/dataOut[30]} {DigitalCombiner_u/dataOut[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe13]
set_property port_width 3 [get_debug_ports u_ila_0/probe13]
connect_debug_port u_ila_0/probe13 [get_nets [list {DigitalCombiner_u/decay[0]} {DigitalCombiner_u/decay[1]} {DigitalCombiner_u/decay[2]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe14]
set_property port_width 18 [get_debug_ports u_ila_0/probe14]
connect_debug_port u_ila_0/probe14 [get_nets [list {DigitalCombiner_u/lagCoef[0]} {DigitalCombiner_u/lagCoef[1]} {DigitalCombiner_u/lagCoef[2]} {DigitalCombiner_u/lagCoef[3]} {DigitalCombiner_u/lagCoef[4]} {DigitalCombiner_u/lagCoef[5]} {DigitalCombiner_u/lagCoef[6]} {DigitalCombiner_u/lagCoef[7]} {DigitalCombiner_u/lagCoef[8]} {DigitalCombiner_u/lagCoef[9]} {DigitalCombiner_u/lagCoef[10]} {DigitalCombiner_u/lagCoef[11]} {DigitalCombiner_u/lagCoef[12]} {DigitalCombiner_u/lagCoef[13]} {DigitalCombiner_u/lagCoef[14]} {DigitalCombiner_u/lagCoef[15]} {DigitalCombiner_u/lagCoef[16]} {DigitalCombiner_u/lagCoef[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe15]
set_property port_width 18 [get_debug_ports u_ila_0/probe15]
connect_debug_port u_ila_0/probe15 [get_nets [list {DigitalCombiner_u/leadCoef[0]} {DigitalCombiner_u/leadCoef[1]} {DigitalCombiner_u/leadCoef[2]} {DigitalCombiner_u/leadCoef[3]} {DigitalCombiner_u/leadCoef[4]} {DigitalCombiner_u/leadCoef[5]} {DigitalCombiner_u/leadCoef[6]} {DigitalCombiner_u/leadCoef[7]} {DigitalCombiner_u/leadCoef[8]} {DigitalCombiner_u/leadCoef[9]} {DigitalCombiner_u/leadCoef[10]} {DigitalCombiner_u/leadCoef[11]} {DigitalCombiner_u/leadCoef[12]} {DigitalCombiner_u/leadCoef[13]} {DigitalCombiner_u/leadCoef[14]} {DigitalCombiner_u/leadCoef[15]} {DigitalCombiner_u/leadCoef[16]} {DigitalCombiner_u/leadCoef[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe16]
set_property port_width 18 [get_debug_ports u_ila_0/probe16]
connect_debug_port u_ila_0/probe16 [get_nets [list {DigitalCombiner_u/refLevel[0]} {DigitalCombiner_u/refLevel[1]} {DigitalCombiner_u/refLevel[2]} {DigitalCombiner_u/refLevel[3]} {DigitalCombiner_u/refLevel[4]} {DigitalCombiner_u/refLevel[5]} {DigitalCombiner_u/refLevel[6]} {DigitalCombiner_u/refLevel[7]} {DigitalCombiner_u/refLevel[8]} {DigitalCombiner_u/refLevel[9]} {DigitalCombiner_u/refLevel[10]} {DigitalCombiner_u/refLevel[11]} {DigitalCombiner_u/refLevel[12]} {DigitalCombiner_u/refLevel[13]} {DigitalCombiner_u/refLevel[14]} {DigitalCombiner_u/refLevel[15]} {DigitalCombiner_u/refLevel[16]} {DigitalCombiner_u/refLevel[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe17]
set_property port_width 18 [get_debug_ports u_ila_0/probe17]
connect_debug_port u_ila_0/probe17 [get_nets [list {DigitalCombiner_u/sweepRate[0]} {DigitalCombiner_u/sweepRate[1]} {DigitalCombiner_u/sweepRate[2]} {DigitalCombiner_u/sweepRate[3]} {DigitalCombiner_u/sweepRate[4]} {DigitalCombiner_u/sweepRate[5]} {DigitalCombiner_u/sweepRate[6]} {DigitalCombiner_u/sweepRate[7]} {DigitalCombiner_u/sweepRate[8]} {DigitalCombiner_u/sweepRate[9]} {DigitalCombiner_u/sweepRate[10]} {DigitalCombiner_u/sweepRate[11]} {DigitalCombiner_u/sweepRate[12]} {DigitalCombiner_u/sweepRate[13]} {DigitalCombiner_u/sweepRate[14]} {DigitalCombiner_u/sweepRate[15]} {DigitalCombiner_u/sweepRate[16]} {DigitalCombiner_u/sweepRate[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe18]
set_property port_width 18 [get_debug_ports u_ila_0/probe18]
connect_debug_port u_ila_0/probe18 [get_nets [list {DigitalCombiner_u/CmplxPhsDet/realout[0]} {DigitalCombiner_u/CmplxPhsDet/realout[1]} {DigitalCombiner_u/CmplxPhsDet/realout[2]} {DigitalCombiner_u/CmplxPhsDet/realout[3]} {DigitalCombiner_u/CmplxPhsDet/realout[4]} {DigitalCombiner_u/CmplxPhsDet/realout[5]} {DigitalCombiner_u/CmplxPhsDet/realout[6]} {DigitalCombiner_u/CmplxPhsDet/realout[7]} {DigitalCombiner_u/CmplxPhsDet/realout[8]} {DigitalCombiner_u/CmplxPhsDet/realout[9]} {DigitalCombiner_u/CmplxPhsDet/realout[10]} {DigitalCombiner_u/CmplxPhsDet/realout[11]} {DigitalCombiner_u/CmplxPhsDet/realout[12]} {DigitalCombiner_u/CmplxPhsDet/realout[13]} {DigitalCombiner_u/CmplxPhsDet/realout[14]} {DigitalCombiner_u/CmplxPhsDet/realout[15]} {DigitalCombiner_u/CmplxPhsDet/realout[16]} {DigitalCombiner_u/CmplxPhsDet/realout[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe19]
set_property port_width 13 [get_debug_ports u_ila_0/probe19]
connect_debug_port u_ila_0/probe19 [get_nets [list {DigitalCombiner_u/CmplxPhsDet/reallock[0]} {DigitalCombiner_u/CmplxPhsDet/reallock[1]} {DigitalCombiner_u/CmplxPhsDet/reallock[2]} {DigitalCombiner_u/CmplxPhsDet/reallock[3]} {DigitalCombiner_u/CmplxPhsDet/reallock[4]} {DigitalCombiner_u/CmplxPhsDet/reallock[5]} {DigitalCombiner_u/CmplxPhsDet/reallock[6]} {DigitalCombiner_u/CmplxPhsDet/reallock[7]} {DigitalCombiner_u/CmplxPhsDet/reallock[8]} {DigitalCombiner_u/CmplxPhsDet/reallock[9]} {DigitalCombiner_u/CmplxPhsDet/reallock[10]} {DigitalCombiner_u/CmplxPhsDet/reallock[11]} {DigitalCombiner_u/CmplxPhsDet/reallock[12]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe20]
set_property port_width 14 [get_debug_ports u_ila_0/probe20]
connect_debug_port u_ila_0/probe20 [get_nets [list {DigitalCombiner_u/CmplxPhsDet/sweeplmt[0]} {DigitalCombiner_u/CmplxPhsDet/sweeplmt[1]} {DigitalCombiner_u/CmplxPhsDet/sweeplmt[2]} {DigitalCombiner_u/CmplxPhsDet/sweeplmt[3]} {DigitalCombiner_u/CmplxPhsDet/sweeplmt[4]} {DigitalCombiner_u/CmplxPhsDet/sweeplmt[5]} {DigitalCombiner_u/CmplxPhsDet/sweeplmt[6]} {DigitalCombiner_u/CmplxPhsDet/sweeplmt[7]} {DigitalCombiner_u/CmplxPhsDet/sweeplmt[8]} {DigitalCombiner_u/CmplxPhsDet/sweeplmt[9]} {DigitalCombiner_u/CmplxPhsDet/sweeplmt[10]} {DigitalCombiner_u/CmplxPhsDet/sweeplmt[11]} {DigitalCombiner_u/CmplxPhsDet/sweeplmt[12]} {DigitalCombiner_u/CmplxPhsDet/sweeplmt[13]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe21]
set_property port_width 18 [get_debug_ports u_ila_0/probe21]
connect_debug_port u_ila_0/probe21 [get_nets [list {DigitalCombiner_u/CmplxPhsDet/imagout[0]} {DigitalCombiner_u/CmplxPhsDet/imagout[1]} {DigitalCombiner_u/CmplxPhsDet/imagout[2]} {DigitalCombiner_u/CmplxPhsDet/imagout[3]} {DigitalCombiner_u/CmplxPhsDet/imagout[4]} {DigitalCombiner_u/CmplxPhsDet/imagout[5]} {DigitalCombiner_u/CmplxPhsDet/imagout[6]} {DigitalCombiner_u/CmplxPhsDet/imagout[7]} {DigitalCombiner_u/CmplxPhsDet/imagout[8]} {DigitalCombiner_u/CmplxPhsDet/imagout[9]} {DigitalCombiner_u/CmplxPhsDet/imagout[10]} {DigitalCombiner_u/CmplxPhsDet/imagout[11]} {DigitalCombiner_u/CmplxPhsDet/imagout[12]} {DigitalCombiner_u/CmplxPhsDet/imagout[13]} {DigitalCombiner_u/CmplxPhsDet/imagout[14]} {DigitalCombiner_u/CmplxPhsDet/imagout[15]} {DigitalCombiner_u/CmplxPhsDet/imagout[16]} {DigitalCombiner_u/CmplxPhsDet/imagout[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe22]
set_property port_width 13 [get_debug_ports u_ila_0/probe22]
connect_debug_port u_ila_0/probe22 [get_nets [list {DigitalCombiner_u/CmplxPhsDet/imaglock[0]} {DigitalCombiner_u/CmplxPhsDet/imaglock[1]} {DigitalCombiner_u/CmplxPhsDet/imaglock[2]} {DigitalCombiner_u/CmplxPhsDet/imaglock[3]} {DigitalCombiner_u/CmplxPhsDet/imaglock[4]} {DigitalCombiner_u/CmplxPhsDet/imaglock[5]} {DigitalCombiner_u/CmplxPhsDet/imaglock[6]} {DigitalCombiner_u/CmplxPhsDet/imaglock[7]} {DigitalCombiner_u/CmplxPhsDet/imaglock[8]} {DigitalCombiner_u/CmplxPhsDet/imaglock[9]} {DigitalCombiner_u/CmplxPhsDet/imaglock[10]} {DigitalCombiner_u/CmplxPhsDet/imaglock[11]} {DigitalCombiner_u/CmplxPhsDet/imaglock[12]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe23]
set_property port_width 18 [get_debug_ports u_ila_0/probe23]
connect_debug_port u_ila_0/probe23 [get_nets [list {DigitalCombiner_u/CmplxPhsDet/fastagc_diff[0]} {DigitalCombiner_u/CmplxPhsDet/fastagc_diff[1]} {DigitalCombiner_u/CmplxPhsDet/fastagc_diff[2]} {DigitalCombiner_u/CmplxPhsDet/fastagc_diff[3]} {DigitalCombiner_u/CmplxPhsDet/fastagc_diff[4]} {DigitalCombiner_u/CmplxPhsDet/fastagc_diff[5]} {DigitalCombiner_u/CmplxPhsDet/fastagc_diff[6]} {DigitalCombiner_u/CmplxPhsDet/fastagc_diff[7]} {DigitalCombiner_u/CmplxPhsDet/fastagc_diff[8]} {DigitalCombiner_u/CmplxPhsDet/fastagc_diff[9]} {DigitalCombiner_u/CmplxPhsDet/fastagc_diff[10]} {DigitalCombiner_u/CmplxPhsDet/fastagc_diff[11]} {DigitalCombiner_u/CmplxPhsDet/fastagc_diff[12]} {DigitalCombiner_u/CmplxPhsDet/fastagc_diff[13]} {DigitalCombiner_u/CmplxPhsDet/fastagc_diff[14]} {DigitalCombiner_u/CmplxPhsDet/fastagc_diff[15]} {DigitalCombiner_u/CmplxPhsDet/fastagc_diff[16]} {DigitalCombiner_u/CmplxPhsDet/fastagc_diff[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe24]
set_property port_width 1 [get_debug_ports u_ila_0/probe24]
connect_debug_port u_ila_0/probe24 [get_nets [list DigitalCombiner_u/IF_Align_u/AbeforeB__0]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe25]
set_property port_width 1 [get_debug_ports u_ila_0/probe25]
connect_debug_port u_ila_0/probe25 [get_nets [list DigitalCombiner_u/cs]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe26]
set_property port_width 1 [get_debug_ports u_ila_0/probe26]
connect_debug_port u_ila_0/probe26 [get_nets [list DigitalCombiner_u/ifBS_n]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe27]
set_property port_width 1 [get_debug_ports u_ila_0/probe27]
connect_debug_port u_ila_0/probe27 [get_nets [list DigitalCombiner_u/IF_Align_u/Restart]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe28]
set_property port_width 1 [get_debug_ports u_ila_0/probe28]
connect_debug_port u_ila_0/probe28 [get_nets [list DigitalCombiner_u/IF_Align_u/ValidOut__0]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe29]
set_property port_width 1 [get_debug_ports u_ila_0/probe29]
connect_debug_port u_ila_0/probe29 [get_nets [list DigitalCombiner_u/IF_Align_u/ValidOverAdd]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe30]
set_property port_width 1 [get_debug_ports u_ila_0/probe30]
connect_debug_port u_ila_0/probe30 [get_nets [list DigitalCombiner_u/wr0]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe31]
set_property port_width 1 [get_debug_ports u_ila_0/probe31]
connect_debug_port u_ila_0/probe31 [get_nets [list DigitalCombiner_u/wr1]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe32]
set_property port_width 1 [get_debug_ports u_ila_0/probe32]
connect_debug_port u_ila_0/probe32 [get_nets [list DigitalCombiner_u/wr2]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe33]
set_property port_width 1 [get_debug_ports u_ila_0/probe33]
connect_debug_port u_ila_0/probe33 [get_nets [list DigitalCombiner_u/wr3]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe34]
set_property port_width 1 [get_debug_ports u_ila_0/probe34]
connect_debug_port u_ila_0/probe34 [get_nets [list demod/aresetn]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe35]
set_property port_width 1 [get_debug_ports u_ila_0/probe35]
connect_debug_port u_ila_0/probe35 [get_nets [list DigitalCombiner_u/IF_Align_u/aresetn]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe36]
set_property port_width 1 [get_debug_ports u_ila_0/probe36]
connect_debug_port u_ila_0/probe36 [get_nets [list reset]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe37]
set_property port_width 1 [get_debug_ports u_ila_0/probe37]
connect_debug_port u_ila_0/probe37 [get_nets [list SerDes_u/reset]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe38]
set_property port_width 1 [get_debug_ports u_ila_0/probe38]
connect_debug_port u_ila_0/probe38 [get_nets [list DigitalCombiner_u/IF_Align_u/reset8_out]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe39]
set_property port_width 1 [get_debug_ports u_ila_0/probe39]
connect_debug_port u_ila_0/probe39 [get_nets [list reset00_out]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe40]
set_property port_width 1 [get_debug_ports u_ila_0/probe40]
connect_debug_port u_ila_0/probe40 [get_nets [list topRegs/reset_i_1_n_0]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe41]
set_property port_width 1 [get_debug_ports u_ila_0/probe41]
connect_debug_port u_ila_0/probe41 [get_nets [list demod/reset_reg_rep]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe42]
set_property port_width 1 [get_debug_ports u_ila_0/probe42]
connect_debug_port u_ila_0/probe42 [get_nets [list demod/reset_reg_rep_0]]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets dac1_clk_OBUF]
