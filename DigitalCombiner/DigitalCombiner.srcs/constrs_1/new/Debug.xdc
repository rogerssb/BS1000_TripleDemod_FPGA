

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
connect_debug_port u_ila_0/probe0 [get_nets [list {AlignIFs/IF_Diff[0]} {AlignIFs/IF_Diff[1]} {AlignIFs/IF_Diff[2]} {AlignIFs/IF_Diff[3]} {AlignIFs/IF_Diff[4]} {AlignIFs/IF_Diff[5]} {AlignIFs/IF_Diff[6]} {AlignIFs/IF_Diff[7]} {AlignIFs/IF_Diff[8]} {AlignIFs/IF_Diff[9]} {AlignIFs/IF_Diff[10]} {AlignIFs/IF_Diff[11]} {AlignIFs/IF_Diff[12]} {AlignIFs/IF_Diff[13]} {AlignIFs/IF_Diff[14]} {AlignIFs/IF_Diff[15]} {AlignIFs/IF_Diff[16]} {AlignIFs/IF_Diff[17]}]]
create_debug_core u_ila_1 ila
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_1]
set_property ALL_PROBE_SAME_MU_CNT 4 [get_debug_cores u_ila_1]
set_property C_ADV_TRIGGER true [get_debug_cores u_ila_1]
set_property C_DATA_DEPTH 8192 [get_debug_cores u_ila_1]
set_property C_EN_STRG_QUAL true [get_debug_cores u_ila_1]
set_property C_INPUT_PIPE_STAGES 2 [get_debug_cores u_ila_1]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_1]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_1]
set_property port_width 1 [get_debug_ports u_ila_1/clk]
connect_debug_port u_ila_1/clk [get_nets [list SystemClock_u/inst/clk2x]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe0]
set_property port_width 8 [get_debug_ports u_ila_1/probe0]
connect_debug_port u_ila_1/probe0 [get_nets [list {AlignIFs/IndexAbs[0]} {AlignIFs/IndexAbs[1]} {AlignIFs/IndexAbs[2]} {AlignIFs/IndexAbs[3]} {AlignIFs/IndexAbs[4]} {AlignIFs/IndexAbs[5]} {AlignIFs/IndexAbs[6]} {AlignIFs/IndexAbs[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe1]
set_property port_width 32 [get_debug_ports u_ila_0/probe1]
connect_debug_port u_ila_0/probe1 [get_nets [list {BitErrors[0]} {BitErrors[1]} {BitErrors[2]} {BitErrors[3]} {BitErrors[4]} {BitErrors[5]} {BitErrors[6]} {BitErrors[7]} {BitErrors[8]} {BitErrors[9]} {BitErrors[10]} {BitErrors[11]} {BitErrors[12]} {BitErrors[13]} {BitErrors[14]} {BitErrors[15]} {BitErrors[16]} {BitErrors[17]} {BitErrors[18]} {BitErrors[19]} {BitErrors[20]} {BitErrors[21]} {BitErrors[22]} {BitErrors[23]} {BitErrors[24]} {BitErrors[25]} {BitErrors[26]} {BitErrors[27]} {BitErrors[28]} {BitErrors[29]} {BitErrors[30]} {BitErrors[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe2]
set_property port_width 32 [get_debug_ports u_ila_0/probe2]
connect_debug_port u_ila_0/probe2 [get_nets [list {lag_out[0]} {lag_out[1]} {lag_out[2]} {lag_out[3]} {lag_out[4]} {lag_out[5]} {lag_out[6]} {lag_out[7]} {lag_out[8]} {lag_out[9]} {lag_out[10]} {lag_out[11]} {lag_out[12]} {lag_out[13]} {lag_out[14]} {lag_out[15]} {lag_out[16]} {lag_out[17]} {lag_out[18]} {lag_out[19]} {lag_out[20]} {lag_out[21]} {lag_out[22]} {lag_out[23]} {lag_out[24]} {lag_out[25]} {lag_out[26]} {lag_out[27]} {lag_out[28]} {lag_out[29]} {lag_out[30]} {lag_out[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe3]
set_property port_width 22 [get_debug_ports u_ila_0/probe3]
connect_debug_port u_ila_0/probe3 [get_nets [list {nco_control_out[0]} {nco_control_out[1]} {nco_control_out[2]} {nco_control_out[3]} {nco_control_out[4]} {nco_control_out[5]} {nco_control_out[6]} {nco_control_out[7]} {nco_control_out[8]} {nco_control_out[9]} {nco_control_out[10]} {nco_control_out[11]} {nco_control_out[12]} {nco_control_out[13]} {nco_control_out[14]} {nco_control_out[15]} {nco_control_out[16]} {nco_control_out[17]} {nco_control_out[18]} {nco_control_out[19]} {nco_control_out[20]} {nco_control_out[21]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe4]
set_property port_width 18 [get_debug_ports u_ila_0/probe4]
connect_debug_port u_ila_0/probe4 [get_nets [list {phase_detect[0]} {phase_detect[1]} {phase_detect[2]} {phase_detect[3]} {phase_detect[4]} {phase_detect[5]} {phase_detect[6]} {phase_detect[7]} {phase_detect[8]} {phase_detect[9]} {phase_detect[10]} {phase_detect[11]} {phase_detect[12]} {phase_detect[13]} {phase_detect[14]} {phase_detect[15]} {phase_detect[16]} {phase_detect[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe5]
set_property port_width 32 [get_debug_ports u_ila_0/probe5]
connect_debug_port u_ila_0/probe5 [get_nets [list {BitCount[0]} {BitCount[1]} {BitCount[2]} {BitCount[3]} {BitCount[4]} {BitCount[5]} {BitCount[6]} {BitCount[7]} {BitCount[8]} {BitCount[9]} {BitCount[10]} {BitCount[11]} {BitCount[12]} {BitCount[13]} {BitCount[14]} {BitCount[15]} {BitCount[16]} {BitCount[17]} {BitCount[18]} {BitCount[19]} {BitCount[20]} {BitCount[21]} {BitCount[22]} {BitCount[23]} {BitCount[24]} {BitCount[25]} {BitCount[26]} {BitCount[27]} {BitCount[28]} {BitCount[29]} {BitCount[30]} {BitCount[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe6]
set_property port_width 18 [get_debug_ports u_ila_0/probe6]
connect_debug_port u_ila_0/probe6 [get_nets [list {Real2Out[0]} {Real2Out[1]} {Real2Out[2]} {Real2Out[3]} {Real2Out[4]} {Real2Out[5]} {Real2Out[6]} {Real2Out[7]} {Real2Out[8]} {Real2Out[9]} {Real2Out[10]} {Real2Out[11]} {Real2Out[12]} {Real2Out[13]} {Real2Out[14]} {Real2Out[15]} {Real2Out[16]} {Real2Out[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe7]
set_property port_width 18 [get_debug_ports u_ila_0/probe7]
connect_debug_port u_ila_0/probe7 [get_nets [list {Real1Out[0]} {Real1Out[1]} {Real1Out[2]} {Real1Out[3]} {Real1Out[4]} {Real1Out[5]} {Real1Out[6]} {Real1Out[7]} {Real1Out[8]} {Real1Out[9]} {Real1Out[10]} {Real1Out[11]} {Real1Out[12]} {Real1Out[13]} {Real1Out[14]} {Real1Out[15]} {Real1Out[16]} {Real1Out[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe8]
set_property port_width 13 [get_debug_ports u_ila_0/probe8]
connect_debug_port u_ila_0/probe8 [get_nets [list {QLock[0]} {QLock[1]} {QLock[2]} {QLock[3]} {QLock[4]} {QLock[5]} {QLock[6]} {QLock[7]} {QLock[8]} {QLock[9]} {QLock[10]} {QLock[11]} {QLock[12]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe9]
set_property port_width 18 [get_debug_ports u_ila_0/probe9]
connect_debug_port u_ila_0/probe9 [get_nets [list {MinQout[0]} {MinQout[1]} {MinQout[2]} {MinQout[3]} {MinQout[4]} {MinQout[5]} {MinQout[6]} {MinQout[7]} {MinQout[8]} {MinQout[9]} {MinQout[10]} {MinQout[11]} {MinQout[12]} {MinQout[13]} {MinQout[14]} {MinQout[15]} {MinQout[16]} {MinQout[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe10]
set_property port_width 18 [get_debug_ports u_ila_0/probe10]
connect_debug_port u_ila_0/probe10 [get_nets [list {MinIout[0]} {MinIout[1]} {MinIout[2]} {MinIout[3]} {MinIout[4]} {MinIout[5]} {MinIout[6]} {MinIout[7]} {MinIout[8]} {MinIout[9]} {MinIout[10]} {MinIout[11]} {MinIout[12]} {MinIout[13]} {MinIout[14]} {MinIout[15]} {MinIout[16]} {MinIout[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe11]
set_property port_width 18 [get_debug_ports u_ila_0/probe11]
connect_debug_port u_ila_0/probe11 [get_nets [list {QCmb[0]} {QCmb[1]} {QCmb[2]} {QCmb[3]} {QCmb[4]} {QCmb[5]} {QCmb[6]} {QCmb[7]} {QCmb[8]} {QCmb[9]} {QCmb[10]} {QCmb[11]} {QCmb[12]} {QCmb[13]} {QCmb[14]} {QCmb[15]} {QCmb[16]} {QCmb[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe12]
set_property port_width 18 [get_debug_ports u_ila_0/probe12]
connect_debug_port u_ila_0/probe12 [get_nets [list {MaxQout[0]} {MaxQout[1]} {MaxQout[2]} {MaxQout[3]} {MaxQout[4]} {MaxQout[5]} {MaxQout[6]} {MaxQout[7]} {MaxQout[8]} {MaxQout[9]} {MaxQout[10]} {MaxQout[11]} {MaxQout[12]} {MaxQout[13]} {MaxQout[14]} {MaxQout[15]} {MaxQout[16]} {MaxQout[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe13]
set_property port_width 18 [get_debug_ports u_ila_0/probe13]
connect_debug_port u_ila_0/probe13 [get_nets [list {MaxIout[0]} {MaxIout[1]} {MaxIout[2]} {MaxIout[3]} {MaxIout[4]} {MaxIout[5]} {MaxIout[6]} {MaxIout[7]} {MaxIout[8]} {MaxIout[9]} {MaxIout[10]} {MaxIout[11]} {MaxIout[12]} {MaxIout[13]} {MaxIout[14]} {MaxIout[15]} {MaxIout[16]} {MaxIout[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe14]
set_property port_width 13 [get_debug_ports u_ila_0/probe14]
connect_debug_port u_ila_0/probe14 [get_nets [list {ILock[0]} {ILock[1]} {ILock[2]} {ILock[3]} {ILock[4]} {ILock[5]} {ILock[6]} {ILock[7]} {ILock[8]} {ILock[9]} {ILock[10]} {ILock[11]} {ILock[12]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe15]
set_property port_width 24 [get_debug_ports u_ila_0/probe15]
connect_debug_port u_ila_0/probe15 [get_nets [list {IDelay[0]} {IDelay[1]} {IDelay[2]} {IDelay[3]} {IDelay[4]} {IDelay[5]} {IDelay[6]} {IDelay[7]} {IDelay[8]} {IDelay[9]} {IDelay[10]} {IDelay[11]} {IDelay[12]} {IDelay[13]} {IDelay[14]} {IDelay[15]} {IDelay[16]} {IDelay[17]} {IDelay[18]} {IDelay[19]} {IDelay[20]} {IDelay[21]} {IDelay[22]} {IDelay[23]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe16]
set_property port_width 18 [get_debug_ports u_ila_0/probe16]
connect_debug_port u_ila_0/probe16 [get_nets [list {ICmb[0]} {ICmb[1]} {ICmb[2]} {ICmb[3]} {ICmb[4]} {ICmb[5]} {ICmb[6]} {ICmb[7]} {ICmb[8]} {ICmb[9]} {ICmb[10]} {ICmb[11]} {ICmb[12]} {ICmb[13]} {ICmb[14]} {ICmb[15]} {ICmb[16]} {ICmb[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe17]
set_property port_width 18 [get_debug_ports u_ila_0/probe17]
connect_debug_port u_ila_0/probe17 [get_nets [list {GainOutMax[0]} {GainOutMax[1]} {GainOutMax[2]} {GainOutMax[3]} {GainOutMax[4]} {GainOutMax[5]} {GainOutMax[6]} {GainOutMax[7]} {GainOutMax[8]} {GainOutMax[9]} {GainOutMax[10]} {GainOutMax[11]} {GainOutMax[12]} {GainOutMax[13]} {GainOutMax[14]} {GainOutMax[15]} {GainOutMax[16]} {GainOutMax[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe18]
set_property port_width 18 [get_debug_ports u_ila_0/probe18]
connect_debug_port u_ila_0/probe18 [get_nets [list {GainOutMin[0]} {GainOutMin[1]} {GainOutMin[2]} {GainOutMin[3]} {GainOutMin[4]} {GainOutMin[5]} {GainOutMin[6]} {GainOutMin[7]} {GainOutMin[8]} {GainOutMin[9]} {GainOutMin[10]} {GainOutMin[11]} {GainOutMin[12]} {GainOutMin[13]} {GainOutMin[14]} {GainOutMin[15]} {GainOutMin[16]} {GainOutMin[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe19]
set_property port_width 32 [get_debug_ports u_ila_0/probe19]
connect_debug_port u_ila_0/probe19 [get_nets [list {ErrorCount[0]} {ErrorCount[1]} {ErrorCount[2]} {ErrorCount[3]} {ErrorCount[4]} {ErrorCount[5]} {ErrorCount[6]} {ErrorCount[7]} {ErrorCount[8]} {ErrorCount[9]} {ErrorCount[10]} {ErrorCount[11]} {ErrorCount[12]} {ErrorCount[13]} {ErrorCount[14]} {ErrorCount[15]} {ErrorCount[16]} {ErrorCount[17]} {ErrorCount[18]} {ErrorCount[19]} {ErrorCount[20]} {ErrorCount[21]} {ErrorCount[22]} {ErrorCount[23]} {ErrorCount[24]} {ErrorCount[25]} {ErrorCount[26]} {ErrorCount[27]} {ErrorCount[28]} {ErrorCount[29]} {ErrorCount[30]} {ErrorCount[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe20]
set_property port_width 1 [get_debug_ports u_ila_0/probe20]
connect_debug_port u_ila_0/probe20 [get_nets [list agc1_gt_agc2]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe21]
set_property port_width 1 [get_debug_ports u_ila_0/probe21]
connect_debug_port u_ila_0/probe21 [get_nets [list IXord]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe22]
set_property port_width 1 [get_debug_ports u_ila_0/probe22]
connect_debug_port u_ila_0/probe22 [get_nets [list PhsDetLocked]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe23]
set_property port_width 1 [get_debug_ports u_ila_0/probe23]
connect_debug_port u_ila_0/probe23 [get_nets [list PrnEn]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe24]
set_property port_width 1 [get_debug_ports u_ila_0/probe24]
connect_debug_port u_ila_0/probe24 [get_nets [list QXord]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe25]
set_property port_width 1 [get_debug_ports u_ila_0/probe25]
connect_debug_port u_ila_0/probe25 [get_nets [list RecoveredData]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe1]
set_property port_width 16 [get_debug_ports u_ila_1/probe1]
connect_debug_port u_ila_1/probe1 [get_nets [list {AlignIFs/IndexAcc[-7]} {AlignIFs/IndexAcc[-6]} {AlignIFs/IndexAcc[-5]} {AlignIFs/IndexAcc[-4]} {AlignIFs/IndexAcc[-3]} {AlignIFs/IndexAcc[-2]} {AlignIFs/IndexAcc[-1]} {AlignIFs/IndexAcc[0]} {AlignIFs/IndexAcc[1]} {AlignIFs/IndexAcc[2]} {AlignIFs/IndexAcc[3]} {AlignIFs/IndexAcc[4]} {AlignIFs/IndexAcc[5]} {AlignIFs/IndexAcc[6]} {AlignIFs/IndexAcc[7]} {AlignIFs/IndexAcc[8]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe2]
set_property port_width 8 [get_debug_ports u_ila_1/probe2]
connect_debug_port u_ila_1/probe2 [get_nets [list {AlignIFs/IndexOut[0]} {AlignIFs/IndexOut[1]} {AlignIFs/IndexOut[2]} {AlignIFs/IndexOut[3]} {AlignIFs/IndexOut[4]} {AlignIFs/IndexOut[5]} {AlignIFs/IndexOut[6]} {AlignIFs/IndexOut[7]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe3]
set_property port_width 2 [get_debug_ports u_ila_1/probe3]
connect_debug_port u_ila_1/probe3 [get_nets [list {AlignIFs/SkipFirst2[0]} {AlignIFs/SkipFirst2[1]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe4]
set_property port_width 16 [get_debug_ports u_ila_1/probe4]
connect_debug_port u_ila_1/probe4 [get_nets [list {BitCounter[0]} {BitCounter[1]} {BitCounter[2]} {BitCounter[3]} {BitCounter[4]} {BitCounter[5]} {BitCounter[6]} {BitCounter[7]} {BitCounter[8]} {BitCounter[9]} {BitCounter[10]} {BitCounter[11]} {BitCounter[12]} {BitCounter[13]} {BitCounter[14]} {BitCounter[15]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe5]
set_property port_width 18 [get_debug_ports u_ila_1/probe5]
connect_debug_port u_ila_1/probe5 [get_nets [list {Q1NoisySlv[0]} {Q1NoisySlv[1]} {Q1NoisySlv[2]} {Q1NoisySlv[3]} {Q1NoisySlv[4]} {Q1NoisySlv[5]} {Q1NoisySlv[6]} {Q1NoisySlv[7]} {Q1NoisySlv[8]} {Q1NoisySlv[9]} {Q1NoisySlv[10]} {Q1NoisySlv[11]} {Q1NoisySlv[12]} {Q1NoisySlv[13]} {Q1NoisySlv[14]} {Q1NoisySlv[15]} {Q1NoisySlv[16]} {Q1NoisySlv[17]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe6]
set_property port_width 18 [get_debug_ports u_ila_1/probe6]
connect_debug_port u_ila_1/probe6 [get_nets [list {NcodISlv[0]} {NcodISlv[1]} {NcodISlv[2]} {NcodISlv[3]} {NcodISlv[4]} {NcodISlv[5]} {NcodISlv[6]} {NcodISlv[7]} {NcodISlv[8]} {NcodISlv[9]} {NcodISlv[10]} {NcodISlv[11]} {NcodISlv[12]} {NcodISlv[13]} {NcodISlv[14]} {NcodISlv[15]} {NcodISlv[16]} {NcodISlv[17]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe7]
set_property port_width 18 [get_debug_ports u_ila_1/probe7]
connect_debug_port u_ila_1/probe7 [get_nets [list {NcodQSlv[0]} {NcodQSlv[1]} {NcodQSlv[2]} {NcodQSlv[3]} {NcodQSlv[4]} {NcodQSlv[5]} {NcodQSlv[6]} {NcodQSlv[7]} {NcodQSlv[8]} {NcodQSlv[9]} {NcodQSlv[10]} {NcodQSlv[11]} {NcodQSlv[12]} {NcodQSlv[13]} {NcodQSlv[14]} {NcodQSlv[15]} {NcodQSlv[16]} {NcodQSlv[17]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe8]
set_property port_width 18 [get_debug_ports u_ila_1/probe8]
connect_debug_port u_ila_1/probe8 [get_nets [list {Noise2RmsSlv[0]} {Noise2RmsSlv[1]} {Noise2RmsSlv[2]} {Noise2RmsSlv[3]} {Noise2RmsSlv[4]} {Noise2RmsSlv[5]} {Noise2RmsSlv[6]} {Noise2RmsSlv[7]} {Noise2RmsSlv[8]} {Noise2RmsSlv[9]} {Noise2RmsSlv[10]} {Noise2RmsSlv[11]} {Noise2RmsSlv[12]} {Noise2RmsSlv[13]} {Noise2RmsSlv[14]} {Noise2RmsSlv[15]} {Noise2RmsSlv[16]} {Noise2RmsSlv[17]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe9]
set_property port_width 18 [get_debug_ports u_ila_1/probe9]
connect_debug_port u_ila_1/probe9 [get_nets [list {Q2NoisySlv[0]} {Q2NoisySlv[1]} {Q2NoisySlv[2]} {Q2NoisySlv[3]} {Q2NoisySlv[4]} {Q2NoisySlv[5]} {Q2NoisySlv[6]} {Q2NoisySlv[7]} {Q2NoisySlv[8]} {Q2NoisySlv[9]} {Q2NoisySlv[10]} {Q2NoisySlv[11]} {Q2NoisySlv[12]} {Q2NoisySlv[13]} {Q2NoisySlv[14]} {Q2NoisySlv[15]} {Q2NoisySlv[16]} {Q2NoisySlv[17]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe10]
set_property port_width 18 [get_debug_ports u_ila_1/probe10]
connect_debug_port u_ila_1/probe10 [get_nets [list {I1RmsSlv[0]} {I1RmsSlv[1]} {I1RmsSlv[2]} {I1RmsSlv[3]} {I1RmsSlv[4]} {I1RmsSlv[5]} {I1RmsSlv[6]} {I1RmsSlv[7]} {I1RmsSlv[8]} {I1RmsSlv[9]} {I1RmsSlv[10]} {I1RmsSlv[11]} {I1RmsSlv[12]} {I1RmsSlv[13]} {I1RmsSlv[14]} {I1RmsSlv[15]} {I1RmsSlv[16]} {I1RmsSlv[17]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe11]
set_property port_width 18 [get_debug_ports u_ila_1/probe11]
connect_debug_port u_ila_1/probe11 [get_nets [list {I2NoisySlv[0]} {I2NoisySlv[1]} {I2NoisySlv[2]} {I2NoisySlv[3]} {I2NoisySlv[4]} {I2NoisySlv[5]} {I2NoisySlv[6]} {I2NoisySlv[7]} {I2NoisySlv[8]} {I2NoisySlv[9]} {I2NoisySlv[10]} {I2NoisySlv[11]} {I2NoisySlv[12]} {I2NoisySlv[13]} {I2NoisySlv[14]} {I2NoisySlv[15]} {I2NoisySlv[16]} {I2NoisySlv[17]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe12]
set_property port_width 18 [get_debug_ports u_ila_1/probe12]
connect_debug_port u_ila_1/probe12 [get_nets [list {I1NoisySlv[0]} {I1NoisySlv[1]} {I1NoisySlv[2]} {I1NoisySlv[3]} {I1NoisySlv[4]} {I1NoisySlv[5]} {I1NoisySlv[6]} {I1NoisySlv[7]} {I1NoisySlv[8]} {I1NoisySlv[9]} {I1NoisySlv[10]} {I1NoisySlv[11]} {I1NoisySlv[12]} {I1NoisySlv[13]} {I1NoisySlv[14]} {I1NoisySlv[15]} {I1NoisySlv[16]} {I1NoisySlv[17]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe13]
set_property port_width 18 [get_debug_ports u_ila_1/probe13]
connect_debug_port u_ila_1/probe13 [get_nets [list {DataQSlv[0]} {DataQSlv[1]} {DataQSlv[2]} {DataQSlv[3]} {DataQSlv[4]} {DataQSlv[5]} {DataQSlv[6]} {DataQSlv[7]} {DataQSlv[8]} {DataQSlv[9]} {DataQSlv[10]} {DataQSlv[11]} {DataQSlv[12]} {DataQSlv[13]} {DataQSlv[14]} {DataQSlv[15]} {DataQSlv[16]} {DataQSlv[17]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe14]
set_property port_width 18 [get_debug_ports u_ila_1/probe14]
connect_debug_port u_ila_1/probe14 [get_nets [list {DataISlv[0]} {DataISlv[1]} {DataISlv[2]} {DataISlv[3]} {DataISlv[4]} {DataISlv[5]} {DataISlv[6]} {DataISlv[7]} {DataISlv[8]} {DataISlv[9]} {DataISlv[10]} {DataISlv[11]} {DataISlv[12]} {DataISlv[13]} {DataISlv[14]} {DataISlv[15]} {DataISlv[16]} {DataISlv[17]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe15]
set_property port_width 1 [get_debug_ports u_ila_1/probe15]
connect_debug_port u_ila_1/probe15 [get_nets [list AlignIFs/AbeforeB__0]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe16]
set_property port_width 1 [get_debug_ports u_ila_1/probe16]
connect_debug_port u_ila_1/probe16 [get_nets [list AlignIFs/Restart]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe17]
set_property port_width 1 [get_debug_ports u_ila_1/probe17]
connect_debug_port u_ila_1/probe17 [get_nets [list AlignIFs/ValidOut__0]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe18]
set_property port_width 1 [get_debug_ports u_ila_1/probe18]
connect_debug_port u_ila_1/probe18 [get_nets [list AlignIFs/ValidOverAdd]]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets clkOver2]
