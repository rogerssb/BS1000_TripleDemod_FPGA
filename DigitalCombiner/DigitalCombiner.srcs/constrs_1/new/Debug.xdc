
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
connect_debug_port u_ila_0/clk [get_nets [list SystemClock_u/inst/clkOver2]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe0]
set_property port_width 18 [get_debug_ports u_ila_0/probe0]
connect_debug_port u_ila_0/probe0 [get_nets [list {DigitalCombiner_u/IF_Align_u/AgcDiffSlv[0]} {DigitalCombiner_u/IF_Align_u/AgcDiffSlv[1]} {DigitalCombiner_u/IF_Align_u/AgcDiffSlv[2]} {DigitalCombiner_u/IF_Align_u/AgcDiffSlv[3]} {DigitalCombiner_u/IF_Align_u/AgcDiffSlv[4]} {DigitalCombiner_u/IF_Align_u/AgcDiffSlv[5]} {DigitalCombiner_u/IF_Align_u/AgcDiffSlv[6]} {DigitalCombiner_u/IF_Align_u/AgcDiffSlv[7]} {DigitalCombiner_u/IF_Align_u/AgcDiffSlv[8]} {DigitalCombiner_u/IF_Align_u/AgcDiffSlv[9]} {DigitalCombiner_u/IF_Align_u/AgcDiffSlv[10]} {DigitalCombiner_u/IF_Align_u/AgcDiffSlv[11]} {DigitalCombiner_u/IF_Align_u/AgcDiffSlv[12]} {DigitalCombiner_u/IF_Align_u/AgcDiffSlv[13]} {DigitalCombiner_u/IF_Align_u/AgcDiffSlv[14]} {DigitalCombiner_u/IF_Align_u/AgcDiffSlv[15]} {DigitalCombiner_u/IF_Align_u/AgcDiffSlv[16]} {DigitalCombiner_u/IF_Align_u/AgcDiffSlv[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe1]
set_property port_width 18 [get_debug_ports u_ila_0/probe1]
connect_debug_port u_ila_0/probe1 [get_nets [list {DigitalCombiner_u/IF_Align_u/AgcVoltage1Slv[0]} {DigitalCombiner_u/IF_Align_u/AgcVoltage1Slv[1]} {DigitalCombiner_u/IF_Align_u/AgcVoltage1Slv[2]} {DigitalCombiner_u/IF_Align_u/AgcVoltage1Slv[3]} {DigitalCombiner_u/IF_Align_u/AgcVoltage1Slv[4]} {DigitalCombiner_u/IF_Align_u/AgcVoltage1Slv[5]} {DigitalCombiner_u/IF_Align_u/AgcVoltage1Slv[6]} {DigitalCombiner_u/IF_Align_u/AgcVoltage1Slv[7]} {DigitalCombiner_u/IF_Align_u/AgcVoltage1Slv[8]} {DigitalCombiner_u/IF_Align_u/AgcVoltage1Slv[9]} {DigitalCombiner_u/IF_Align_u/AgcVoltage1Slv[10]} {DigitalCombiner_u/IF_Align_u/AgcVoltage1Slv[11]} {DigitalCombiner_u/IF_Align_u/AgcVoltage1Slv[12]} {DigitalCombiner_u/IF_Align_u/AgcVoltage1Slv[13]} {DigitalCombiner_u/IF_Align_u/AgcVoltage1Slv[14]} {DigitalCombiner_u/IF_Align_u/AgcVoltage1Slv[15]} {DigitalCombiner_u/IF_Align_u/AgcVoltage1Slv[16]} {DigitalCombiner_u/IF_Align_u/AgcVoltage1Slv[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe2]
set_property port_width 18 [get_debug_ports u_ila_0/probe2]
connect_debug_port u_ila_0/probe2 [get_nets [list {DigitalCombiner_u/IF_Align_u/AgcVoltage2Slv[0]} {DigitalCombiner_u/IF_Align_u/AgcVoltage2Slv[1]} {DigitalCombiner_u/IF_Align_u/AgcVoltage2Slv[2]} {DigitalCombiner_u/IF_Align_u/AgcVoltage2Slv[3]} {DigitalCombiner_u/IF_Align_u/AgcVoltage2Slv[4]} {DigitalCombiner_u/IF_Align_u/AgcVoltage2Slv[5]} {DigitalCombiner_u/IF_Align_u/AgcVoltage2Slv[6]} {DigitalCombiner_u/IF_Align_u/AgcVoltage2Slv[7]} {DigitalCombiner_u/IF_Align_u/AgcVoltage2Slv[8]} {DigitalCombiner_u/IF_Align_u/AgcVoltage2Slv[9]} {DigitalCombiner_u/IF_Align_u/AgcVoltage2Slv[10]} {DigitalCombiner_u/IF_Align_u/AgcVoltage2Slv[11]} {DigitalCombiner_u/IF_Align_u/AgcVoltage2Slv[12]} {DigitalCombiner_u/IF_Align_u/AgcVoltage2Slv[13]} {DigitalCombiner_u/IF_Align_u/AgcVoltage2Slv[14]} {DigitalCombiner_u/IF_Align_u/AgcVoltage2Slv[15]} {DigitalCombiner_u/IF_Align_u/AgcVoltage2Slv[16]} {DigitalCombiner_u/IF_Align_u/AgcVoltage2Slv[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe3]
set_property port_width 18 [get_debug_ports u_ila_0/probe3]
connect_debug_port u_ila_0/probe3 [get_nets [list {DigitalCombiner_u/IF_Align_u/IF_Diff[0]} {DigitalCombiner_u/IF_Align_u/IF_Diff[1]} {DigitalCombiner_u/IF_Align_u/IF_Diff[2]} {DigitalCombiner_u/IF_Align_u/IF_Diff[3]} {DigitalCombiner_u/IF_Align_u/IF_Diff[4]} {DigitalCombiner_u/IF_Align_u/IF_Diff[5]} {DigitalCombiner_u/IF_Align_u/IF_Diff[6]} {DigitalCombiner_u/IF_Align_u/IF_Diff[7]} {DigitalCombiner_u/IF_Align_u/IF_Diff[8]} {DigitalCombiner_u/IF_Align_u/IF_Diff[9]} {DigitalCombiner_u/IF_Align_u/IF_Diff[10]} {DigitalCombiner_u/IF_Align_u/IF_Diff[11]} {DigitalCombiner_u/IF_Align_u/IF_Diff[12]} {DigitalCombiner_u/IF_Align_u/IF_Diff[13]} {DigitalCombiner_u/IF_Align_u/IF_Diff[14]} {DigitalCombiner_u/IF_Align_u/IF_Diff[15]} {DigitalCombiner_u/IF_Align_u/IF_Diff[16]} {DigitalCombiner_u/IF_Align_u/IF_Diff[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe4]
set_property port_width 8 [get_debug_ports u_ila_0/probe4]
connect_debug_port u_ila_0/probe4 [get_nets [list {DigitalCombiner_u/IF_Align_u/IndexAbs[0]} {DigitalCombiner_u/IF_Align_u/IndexAbs[1]} {DigitalCombiner_u/IF_Align_u/IndexAbs[2]} {DigitalCombiner_u/IF_Align_u/IndexAbs[3]} {DigitalCombiner_u/IF_Align_u/IndexAbs[4]} {DigitalCombiner_u/IF_Align_u/IndexAbs[5]} {DigitalCombiner_u/IF_Align_u/IndexAbs[6]} {DigitalCombiner_u/IF_Align_u/IndexAbs[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe5]
set_property port_width 16 [get_debug_ports u_ila_0/probe5]
connect_debug_port u_ila_0/probe5 [get_nets [list {DigitalCombiner_u/IF_Align_u/IndexAcc[-7]} {DigitalCombiner_u/IF_Align_u/IndexAcc[-6]} {DigitalCombiner_u/IF_Align_u/IndexAcc[-5]} {DigitalCombiner_u/IF_Align_u/IndexAcc[-4]} {DigitalCombiner_u/IF_Align_u/IndexAcc[-3]} {DigitalCombiner_u/IF_Align_u/IndexAcc[-2]} {DigitalCombiner_u/IF_Align_u/IndexAcc[-1]} {DigitalCombiner_u/IF_Align_u/IndexAcc[0]} {DigitalCombiner_u/IF_Align_u/IndexAcc[1]} {DigitalCombiner_u/IF_Align_u/IndexAcc[2]} {DigitalCombiner_u/IF_Align_u/IndexAcc[3]} {DigitalCombiner_u/IF_Align_u/IndexAcc[4]} {DigitalCombiner_u/IF_Align_u/IndexAcc[5]} {DigitalCombiner_u/IF_Align_u/IndexAcc[6]} {DigitalCombiner_u/IF_Align_u/IndexAcc[7]} {DigitalCombiner_u/IF_Align_u/IndexAcc[8]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe6]
set_property port_width 8 [get_debug_ports u_ila_0/probe6]
connect_debug_port u_ila_0/probe6 [get_nets [list {DigitalCombiner_u/IF_Align_u/IndexOut[0]} {DigitalCombiner_u/IF_Align_u/IndexOut[1]} {DigitalCombiner_u/IF_Align_u/IndexOut[2]} {DigitalCombiner_u/IF_Align_u/IndexOut[3]} {DigitalCombiner_u/IF_Align_u/IndexOut[4]} {DigitalCombiner_u/IF_Align_u/IndexOut[5]} {DigitalCombiner_u/IF_Align_u/IndexOut[6]} {DigitalCombiner_u/IF_Align_u/IndexOut[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe7]
set_property port_width 2 [get_debug_ports u_ila_0/probe7]
connect_debug_port u_ila_0/probe7 [get_nets [list {DigitalCombiner_u/IF_Align_u/SkipFirst2[0]} {DigitalCombiner_u/IF_Align_u/SkipFirst2[1]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe8]
set_property port_width 18 [get_debug_ports u_ila_0/probe8]
connect_debug_port u_ila_0/probe8 [get_nets [list {DigitalCombiner_u/Real1Out[0]} {DigitalCombiner_u/Real1Out[1]} {DigitalCombiner_u/Real1Out[2]} {DigitalCombiner_u/Real1Out[3]} {DigitalCombiner_u/Real1Out[4]} {DigitalCombiner_u/Real1Out[5]} {DigitalCombiner_u/Real1Out[6]} {DigitalCombiner_u/Real1Out[7]} {DigitalCombiner_u/Real1Out[8]} {DigitalCombiner_u/Real1Out[9]} {DigitalCombiner_u/Real1Out[10]} {DigitalCombiner_u/Real1Out[11]} {DigitalCombiner_u/Real1Out[12]} {DigitalCombiner_u/Real1Out[13]} {DigitalCombiner_u/Real1Out[14]} {DigitalCombiner_u/Real1Out[15]} {DigitalCombiner_u/Real1Out[16]} {DigitalCombiner_u/Real1Out[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe9]
set_property port_width 18 [get_debug_ports u_ila_0/probe9]
connect_debug_port u_ila_0/probe9 [get_nets [list {DigitalCombiner_u/Real2Out[0]} {DigitalCombiner_u/Real2Out[1]} {DigitalCombiner_u/Real2Out[2]} {DigitalCombiner_u/Real2Out[3]} {DigitalCombiner_u/Real2Out[4]} {DigitalCombiner_u/Real2Out[5]} {DigitalCombiner_u/Real2Out[6]} {DigitalCombiner_u/Real2Out[7]} {DigitalCombiner_u/Real2Out[8]} {DigitalCombiner_u/Real2Out[9]} {DigitalCombiner_u/Real2Out[10]} {DigitalCombiner_u/Real2Out[11]} {DigitalCombiner_u/Real2Out[12]} {DigitalCombiner_u/Real2Out[13]} {DigitalCombiner_u/Real2Out[14]} {DigitalCombiner_u/Real2Out[15]} {DigitalCombiner_u/Real2Out[16]} {DigitalCombiner_u/Real2Out[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe10]
set_property port_width 32 [get_debug_ports u_ila_0/probe10]
connect_debug_port u_ila_0/probe10 [get_nets [list {BitCount[0]} {BitCount[1]} {BitCount[2]} {BitCount[3]} {BitCount[4]} {BitCount[5]} {BitCount[6]} {BitCount[7]} {BitCount[8]} {BitCount[9]} {BitCount[10]} {BitCount[11]} {BitCount[12]} {BitCount[13]} {BitCount[14]} {BitCount[15]} {BitCount[16]} {BitCount[17]} {BitCount[18]} {BitCount[19]} {BitCount[20]} {BitCount[21]} {BitCount[22]} {BitCount[23]} {BitCount[24]} {BitCount[25]} {BitCount[26]} {BitCount[27]} {BitCount[28]} {BitCount[29]} {BitCount[30]} {BitCount[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe11]
set_property port_width 16 [get_debug_ports u_ila_0/probe11]
connect_debug_port u_ila_0/probe11 [get_nets [list {BitCounter[0]} {BitCounter[1]} {BitCounter[2]} {BitCounter[3]} {BitCounter[4]} {BitCounter[5]} {BitCounter[6]} {BitCounter[7]} {BitCounter[8]} {BitCounter[9]} {BitCounter[10]} {BitCounter[11]} {BitCounter[12]} {BitCounter[13]} {BitCounter[14]} {BitCounter[15]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe12]
set_property port_width 32 [get_debug_ports u_ila_0/probe12]
connect_debug_port u_ila_0/probe12 [get_nets [list {BitErrors[0]} {BitErrors[1]} {BitErrors[2]} {BitErrors[3]} {BitErrors[4]} {BitErrors[5]} {BitErrors[6]} {BitErrors[7]} {BitErrors[8]} {BitErrors[9]} {BitErrors[10]} {BitErrors[11]} {BitErrors[12]} {BitErrors[13]} {BitErrors[14]} {BitErrors[15]} {BitErrors[16]} {BitErrors[17]} {BitErrors[18]} {BitErrors[19]} {BitErrors[20]} {BitErrors[21]} {BitErrors[22]} {BitErrors[23]} {BitErrors[24]} {BitErrors[25]} {BitErrors[26]} {BitErrors[27]} {BitErrors[28]} {BitErrors[29]} {BitErrors[30]} {BitErrors[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe13]
set_property port_width 18 [get_debug_ports u_ila_0/probe13]
connect_debug_port u_ila_0/probe13 [get_nets [list {DataISlv[0]} {DataISlv[1]} {DataISlv[2]} {DataISlv[3]} {DataISlv[4]} {DataISlv[5]} {DataISlv[6]} {DataISlv[7]} {DataISlv[8]} {DataISlv[9]} {DataISlv[10]} {DataISlv[11]} {DataISlv[12]} {DataISlv[13]} {DataISlv[14]} {DataISlv[15]} {DataISlv[16]} {DataISlv[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe14]
set_property port_width 18 [get_debug_ports u_ila_0/probe14]
connect_debug_port u_ila_0/probe14 [get_nets [list {DataQSlv[0]} {DataQSlv[1]} {DataQSlv[2]} {DataQSlv[3]} {DataQSlv[4]} {DataQSlv[5]} {DataQSlv[6]} {DataQSlv[7]} {DataQSlv[8]} {DataQSlv[9]} {DataQSlv[10]} {DataQSlv[11]} {DataQSlv[12]} {DataQSlv[13]} {DataQSlv[14]} {DataQSlv[15]} {DataQSlv[16]} {DataQSlv[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe15]
set_property port_width 32 [get_debug_ports u_ila_0/probe15]
connect_debug_port u_ila_0/probe15 [get_nets [list {ErrorCount[0]} {ErrorCount[1]} {ErrorCount[2]} {ErrorCount[3]} {ErrorCount[4]} {ErrorCount[5]} {ErrorCount[6]} {ErrorCount[7]} {ErrorCount[8]} {ErrorCount[9]} {ErrorCount[10]} {ErrorCount[11]} {ErrorCount[12]} {ErrorCount[13]} {ErrorCount[14]} {ErrorCount[15]} {ErrorCount[16]} {ErrorCount[17]} {ErrorCount[18]} {ErrorCount[19]} {ErrorCount[20]} {ErrorCount[21]} {ErrorCount[22]} {ErrorCount[23]} {ErrorCount[24]} {ErrorCount[25]} {ErrorCount[26]} {ErrorCount[27]} {ErrorCount[28]} {ErrorCount[29]} {ErrorCount[30]} {ErrorCount[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe16]
set_property port_width 18 [get_debug_ports u_ila_0/probe16]
connect_debug_port u_ila_0/probe16 [get_nets [list {GainOutMax[0]} {GainOutMax[1]} {GainOutMax[2]} {GainOutMax[3]} {GainOutMax[4]} {GainOutMax[5]} {GainOutMax[6]} {GainOutMax[7]} {GainOutMax[8]} {GainOutMax[9]} {GainOutMax[10]} {GainOutMax[11]} {GainOutMax[12]} {GainOutMax[13]} {GainOutMax[14]} {GainOutMax[15]} {GainOutMax[16]} {GainOutMax[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe17]
set_property port_width 18 [get_debug_ports u_ila_0/probe17]
connect_debug_port u_ila_0/probe17 [get_nets [list {GainOutMin[0]} {GainOutMin[1]} {GainOutMin[2]} {GainOutMin[3]} {GainOutMin[4]} {GainOutMin[5]} {GainOutMin[6]} {GainOutMin[7]} {GainOutMin[8]} {GainOutMin[9]} {GainOutMin[10]} {GainOutMin[11]} {GainOutMin[12]} {GainOutMin[13]} {GainOutMin[14]} {GainOutMin[15]} {GainOutMin[16]} {GainOutMin[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe18]
set_property port_width 18 [get_debug_ports u_ila_0/probe18]
connect_debug_port u_ila_0/probe18 [get_nets [list {I1NoisySlv[0]} {I1NoisySlv[1]} {I1NoisySlv[2]} {I1NoisySlv[3]} {I1NoisySlv[4]} {I1NoisySlv[5]} {I1NoisySlv[6]} {I1NoisySlv[7]} {I1NoisySlv[8]} {I1NoisySlv[9]} {I1NoisySlv[10]} {I1NoisySlv[11]} {I1NoisySlv[12]} {I1NoisySlv[13]} {I1NoisySlv[14]} {I1NoisySlv[15]} {I1NoisySlv[16]} {I1NoisySlv[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe19]
set_property port_width 18 [get_debug_ports u_ila_0/probe19]
connect_debug_port u_ila_0/probe19 [get_nets [list {I1RmsSlv[0]} {I1RmsSlv[1]} {I1RmsSlv[2]} {I1RmsSlv[3]} {I1RmsSlv[4]} {I1RmsSlv[5]} {I1RmsSlv[6]} {I1RmsSlv[7]} {I1RmsSlv[8]} {I1RmsSlv[9]} {I1RmsSlv[10]} {I1RmsSlv[11]} {I1RmsSlv[12]} {I1RmsSlv[13]} {I1RmsSlv[14]} {I1RmsSlv[15]} {I1RmsSlv[16]} {I1RmsSlv[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe20]
set_property port_width 18 [get_debug_ports u_ila_0/probe20]
connect_debug_port u_ila_0/probe20 [get_nets [list {I2NoisySlv[0]} {I2NoisySlv[1]} {I2NoisySlv[2]} {I2NoisySlv[3]} {I2NoisySlv[4]} {I2NoisySlv[5]} {I2NoisySlv[6]} {I2NoisySlv[7]} {I2NoisySlv[8]} {I2NoisySlv[9]} {I2NoisySlv[10]} {I2NoisySlv[11]} {I2NoisySlv[12]} {I2NoisySlv[13]} {I2NoisySlv[14]} {I2NoisySlv[15]} {I2NoisySlv[16]} {I2NoisySlv[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe21]
set_property port_width 18 [get_debug_ports u_ila_0/probe21]
connect_debug_port u_ila_0/probe21 [get_nets [list {ICmb[0]} {ICmb[1]} {ICmb[2]} {ICmb[3]} {ICmb[4]} {ICmb[5]} {ICmb[6]} {ICmb[7]} {ICmb[8]} {ICmb[9]} {ICmb[10]} {ICmb[11]} {ICmb[12]} {ICmb[13]} {ICmb[14]} {ICmb[15]} {ICmb[16]} {ICmb[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe22]
set_property port_width 13 [get_debug_ports u_ila_0/probe22]
connect_debug_port u_ila_0/probe22 [get_nets [list {ILock[0]} {ILock[1]} {ILock[2]} {ILock[3]} {ILock[4]} {ILock[5]} {ILock[6]} {ILock[7]} {ILock[8]} {ILock[9]} {ILock[10]} {ILock[11]} {ILock[12]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe23]
set_property port_width 18 [get_debug_ports u_ila_0/probe23]
connect_debug_port u_ila_0/probe23 [get_nets [list {MaxIout[0]} {MaxIout[1]} {MaxIout[2]} {MaxIout[3]} {MaxIout[4]} {MaxIout[5]} {MaxIout[6]} {MaxIout[7]} {MaxIout[8]} {MaxIout[9]} {MaxIout[10]} {MaxIout[11]} {MaxIout[12]} {MaxIout[13]} {MaxIout[14]} {MaxIout[15]} {MaxIout[16]} {MaxIout[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe24]
set_property port_width 18 [get_debug_ports u_ila_0/probe24]
connect_debug_port u_ila_0/probe24 [get_nets [list {MaxQout[0]} {MaxQout[1]} {MaxQout[2]} {MaxQout[3]} {MaxQout[4]} {MaxQout[5]} {MaxQout[6]} {MaxQout[7]} {MaxQout[8]} {MaxQout[9]} {MaxQout[10]} {MaxQout[11]} {MaxQout[12]} {MaxQout[13]} {MaxQout[14]} {MaxQout[15]} {MaxQout[16]} {MaxQout[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe25]
set_property port_width 18 [get_debug_ports u_ila_0/probe25]
connect_debug_port u_ila_0/probe25 [get_nets [list {MinIout[0]} {MinIout[1]} {MinIout[2]} {MinIout[3]} {MinIout[4]} {MinIout[5]} {MinIout[6]} {MinIout[7]} {MinIout[8]} {MinIout[9]} {MinIout[10]} {MinIout[11]} {MinIout[12]} {MinIout[13]} {MinIout[14]} {MinIout[15]} {MinIout[16]} {MinIout[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe26]
set_property port_width 18 [get_debug_ports u_ila_0/probe26]
connect_debug_port u_ila_0/probe26 [get_nets [list {MinQout[0]} {MinQout[1]} {MinQout[2]} {MinQout[3]} {MinQout[4]} {MinQout[5]} {MinQout[6]} {MinQout[7]} {MinQout[8]} {MinQout[9]} {MinQout[10]} {MinQout[11]} {MinQout[12]} {MinQout[13]} {MinQout[14]} {MinQout[15]} {MinQout[16]} {MinQout[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe27]
set_property port_width 18 [get_debug_ports u_ila_0/probe27]
connect_debug_port u_ila_0/probe27 [get_nets [list {NcodISlv[0]} {NcodISlv[1]} {NcodISlv[2]} {NcodISlv[3]} {NcodISlv[4]} {NcodISlv[5]} {NcodISlv[6]} {NcodISlv[7]} {NcodISlv[8]} {NcodISlv[9]} {NcodISlv[10]} {NcodISlv[11]} {NcodISlv[12]} {NcodISlv[13]} {NcodISlv[14]} {NcodISlv[15]} {NcodISlv[16]} {NcodISlv[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe28]
set_property port_width 18 [get_debug_ports u_ila_0/probe28]
connect_debug_port u_ila_0/probe28 [get_nets [list {NcodQSlv[0]} {NcodQSlv[1]} {NcodQSlv[2]} {NcodQSlv[3]} {NcodQSlv[4]} {NcodQSlv[5]} {NcodQSlv[6]} {NcodQSlv[7]} {NcodQSlv[8]} {NcodQSlv[9]} {NcodQSlv[10]} {NcodQSlv[11]} {NcodQSlv[12]} {NcodQSlv[13]} {NcodQSlv[14]} {NcodQSlv[15]} {NcodQSlv[16]} {NcodQSlv[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe29]
set_property port_width 18 [get_debug_ports u_ila_0/probe29]
connect_debug_port u_ila_0/probe29 [get_nets [list {Noise2RmsSlv[0]} {Noise2RmsSlv[1]} {Noise2RmsSlv[2]} {Noise2RmsSlv[3]} {Noise2RmsSlv[4]} {Noise2RmsSlv[5]} {Noise2RmsSlv[6]} {Noise2RmsSlv[7]} {Noise2RmsSlv[8]} {Noise2RmsSlv[9]} {Noise2RmsSlv[10]} {Noise2RmsSlv[11]} {Noise2RmsSlv[12]} {Noise2RmsSlv[13]} {Noise2RmsSlv[14]} {Noise2RmsSlv[15]} {Noise2RmsSlv[16]} {Noise2RmsSlv[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe30]
set_property port_width 24 [get_debug_ports u_ila_0/probe30]
connect_debug_port u_ila_0/probe30 [get_nets [list {PrnDelay[0]} {PrnDelay[1]} {PrnDelay[2]} {PrnDelay[3]} {PrnDelay[4]} {PrnDelay[5]} {PrnDelay[6]} {PrnDelay[7]} {PrnDelay[8]} {PrnDelay[9]} {PrnDelay[10]} {PrnDelay[11]} {PrnDelay[12]} {PrnDelay[13]} {PrnDelay[14]} {PrnDelay[15]} {PrnDelay[16]} {PrnDelay[17]} {PrnDelay[18]} {PrnDelay[19]} {PrnDelay[20]} {PrnDelay[21]} {PrnDelay[22]} {PrnDelay[23]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe31]
set_property port_width 18 [get_debug_ports u_ila_0/probe31]
connect_debug_port u_ila_0/probe31 [get_nets [list {Q1NoisySlv[0]} {Q1NoisySlv[1]} {Q1NoisySlv[2]} {Q1NoisySlv[3]} {Q1NoisySlv[4]} {Q1NoisySlv[5]} {Q1NoisySlv[6]} {Q1NoisySlv[7]} {Q1NoisySlv[8]} {Q1NoisySlv[9]} {Q1NoisySlv[10]} {Q1NoisySlv[11]} {Q1NoisySlv[12]} {Q1NoisySlv[13]} {Q1NoisySlv[14]} {Q1NoisySlv[15]} {Q1NoisySlv[16]} {Q1NoisySlv[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe32]
set_property port_width 18 [get_debug_ports u_ila_0/probe32]
connect_debug_port u_ila_0/probe32 [get_nets [list {Q2NoisySlv[0]} {Q2NoisySlv[1]} {Q2NoisySlv[2]} {Q2NoisySlv[3]} {Q2NoisySlv[4]} {Q2NoisySlv[5]} {Q2NoisySlv[6]} {Q2NoisySlv[7]} {Q2NoisySlv[8]} {Q2NoisySlv[9]} {Q2NoisySlv[10]} {Q2NoisySlv[11]} {Q2NoisySlv[12]} {Q2NoisySlv[13]} {Q2NoisySlv[14]} {Q2NoisySlv[15]} {Q2NoisySlv[16]} {Q2NoisySlv[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe33]
set_property port_width 18 [get_debug_ports u_ila_0/probe33]
connect_debug_port u_ila_0/probe33 [get_nets [list {QCmb[0]} {QCmb[1]} {QCmb[2]} {QCmb[3]} {QCmb[4]} {QCmb[5]} {QCmb[6]} {QCmb[7]} {QCmb[8]} {QCmb[9]} {QCmb[10]} {QCmb[11]} {QCmb[12]} {QCmb[13]} {QCmb[14]} {QCmb[15]} {QCmb[16]} {QCmb[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe34]
set_property port_width 13 [get_debug_ports u_ila_0/probe34]
connect_debug_port u_ila_0/probe34 [get_nets [list {QLock[0]} {QLock[1]} {QLock[2]} {QLock[3]} {QLock[4]} {QLock[5]} {QLock[6]} {QLock[7]} {QLock[8]} {QLock[9]} {QLock[10]} {QLock[11]} {QLock[12]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe35]
set_property port_width 32 [get_debug_ports u_ila_0/probe35]
connect_debug_port u_ila_0/probe35 [get_nets [list {lag_out[0]} {lag_out[1]} {lag_out[2]} {lag_out[3]} {lag_out[4]} {lag_out[5]} {lag_out[6]} {lag_out[7]} {lag_out[8]} {lag_out[9]} {lag_out[10]} {lag_out[11]} {lag_out[12]} {lag_out[13]} {lag_out[14]} {lag_out[15]} {lag_out[16]} {lag_out[17]} {lag_out[18]} {lag_out[19]} {lag_out[20]} {lag_out[21]} {lag_out[22]} {lag_out[23]} {lag_out[24]} {lag_out[25]} {lag_out[26]} {lag_out[27]} {lag_out[28]} {lag_out[29]} {lag_out[30]} {lag_out[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe36]
set_property port_width 22 [get_debug_ports u_ila_0/probe36]
connect_debug_port u_ila_0/probe36 [get_nets [list {nco_control_out[0]} {nco_control_out[1]} {nco_control_out[2]} {nco_control_out[3]} {nco_control_out[4]} {nco_control_out[5]} {nco_control_out[6]} {nco_control_out[7]} {nco_control_out[8]} {nco_control_out[9]} {nco_control_out[10]} {nco_control_out[11]} {nco_control_out[12]} {nco_control_out[13]} {nco_control_out[14]} {nco_control_out[15]} {nco_control_out[16]} {nco_control_out[17]} {nco_control_out[18]} {nco_control_out[19]} {nco_control_out[20]} {nco_control_out[21]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe37]
set_property port_width 18 [get_debug_ports u_ila_0/probe37]
connect_debug_port u_ila_0/probe37 [get_nets [list {phase_detect[0]} {phase_detect[1]} {phase_detect[2]} {phase_detect[3]} {phase_detect[4]} {phase_detect[5]} {phase_detect[6]} {phase_detect[7]} {phase_detect[8]} {phase_detect[9]} {phase_detect[10]} {phase_detect[11]} {phase_detect[12]} {phase_detect[13]} {phase_detect[14]} {phase_detect[15]} {phase_detect[16]} {phase_detect[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe38]
set_property port_width 1 [get_debug_ports u_ila_0/probe38]
connect_debug_port u_ila_0/probe38 [get_nets [list DigitalCombiner_u/IF_Align_u/AbeforeB__0]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe39]
set_property port_width 1 [get_debug_ports u_ila_0/probe39]
connect_debug_port u_ila_0/probe39 [get_nets [list agc1_gt_agc2]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe40]
set_property port_width 1 [get_debug_ports u_ila_0/probe40]
connect_debug_port u_ila_0/probe40 [get_nets [list IXord]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe41]
set_property port_width 1 [get_debug_ports u_ila_0/probe41]
connect_debug_port u_ila_0/probe41 [get_nets [list PhsDetLocked]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe42]
set_property port_width 1 [get_debug_ports u_ila_0/probe42]
connect_debug_port u_ila_0/probe42 [get_nets [list PrnEn]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe43]
set_property port_width 1 [get_debug_ports u_ila_0/probe43]
connect_debug_port u_ila_0/probe43 [get_nets [list QXord]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe44]
set_property port_width 1 [get_debug_ports u_ila_0/probe44]
connect_debug_port u_ila_0/probe44 [get_nets [list RecoveredData]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe45]
set_property port_width 1 [get_debug_ports u_ila_0/probe45]
connect_debug_port u_ila_0/probe45 [get_nets [list DigitalCombiner_u/IF_Align_u/Restart]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe46]
set_property port_width 1 [get_debug_ports u_ila_0/probe46]
connect_debug_port u_ila_0/probe46 [get_nets [list DigitalCombiner_u/IF_Align_u/ValidOut__0]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe47]
set_property port_width 1 [get_debug_ports u_ila_0/probe47]
connect_debug_port u_ila_0/probe47 [get_nets [list DigitalCombiner_u/IF_Align_u/ValidOverAdd]]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets clkOver2]
