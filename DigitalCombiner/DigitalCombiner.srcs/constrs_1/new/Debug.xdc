




connect_debug_port u_ila_0/probe2 [get_nets [list {DataRate_reg__1[0]} {DataRate_reg__1[1]} {DataRate_reg__1[3]}]]
connect_debug_port u_ila_0/probe61 [get_nets [list {RealIandD_reg_n_0_[2]}]]
connect_debug_port u_ila_0/probe62 [get_nets [list {RealIandD_reg[-_n_0_1]}]]
connect_debug_port u_ila_0/probe63 [get_nets [list {RealIandD_reg[-_n_0_2]}]]
connect_debug_port u_ila_0/probe64 [get_nets [list {RealIandD_reg[-_n_0_3]}]]
connect_debug_port u_ila_0/probe65 [get_nets [list {RealIandD_reg[-_n_0_4]}]]
connect_debug_port u_ila_0/probe66 [get_nets [list {RealIandD_reg[-_n_0_5]}]]
connect_debug_port u_ila_0/probe67 [get_nets [list {RealIandD_reg[-_n_0_6]}]]
connect_debug_port u_ila_0/probe68 [get_nets [list {RealIandD_reg[-_n_0_7]}]]
connect_debug_port u_ila_0/probe69 [get_nets [list {RealIandD_reg[-_n_0_8]}]]
connect_debug_port u_ila_0/probe70 [get_nets [list {RealIandD_reg[-_n_0_9]}]]
connect_debug_port u_ila_0/probe71 [get_nets [list {RealIandD_reg[-_n_0_10]}]]
connect_debug_port u_ila_0/probe72 [get_nets [list {RealIandD_reg[-_n_0_11]}]]
connect_debug_port u_ila_0/probe73 [get_nets [list {RealIandD_reg[-_n_0_12]}]]
connect_debug_port u_ila_0/probe74 [get_nets [list {RealIandD_reg[-_n_0_13]}]]
connect_debug_port u_ila_0/probe75 [get_nets [list {RealIandD_reg[-_n_0_14]}]]
connect_debug_port u_ila_0/probe76 [get_nets [list {RealIandD_reg[-_n_0_15]}]]
connect_debug_port u_ila_0/probe77 [get_nets [list {RealIandD_reg[-_n_0_16]}]]
connect_debug_port u_ila_0/probe78 [get_nets [list {RealIandD_reg[-_n_0_17]}]]
connect_debug_port u_ila_0/probe79 [get_nets [list {RealIandD_reg_n_0_[0]}]]
connect_debug_port u_ila_0/probe80 [get_nets [list {RealIandD_reg_n_0_[1]}]]


connect_debug_port u_ila_0/probe44 [get_nets [list {RealDelay_reg[9]_srl10_n_0}]]


connect_debug_port u_ila_0/probe15 [get_nets [list {Imag1RmsSlv[0]} {Imag1RmsSlv[1]} {Imag1RmsSlv[2]} {Imag1RmsSlv[3]} {Imag1RmsSlv[4]} {Imag1RmsSlv[5]} {Imag1RmsSlv[6]} {Imag1RmsSlv[7]} {Imag1RmsSlv[8]} {Imag1RmsSlv[9]} {Imag1RmsSlv[10]} {Imag1RmsSlv[11]} {Imag1RmsSlv[12]} {Imag1RmsSlv[13]} {Imag1RmsSlv[14]} {Imag1RmsSlv[15]} {Imag1RmsSlv[16]} {Imag1RmsSlv[17]}]]
connect_debug_port u_ila_0/probe26 [get_nets [list {Noise2Gained[-16]} {Noise2Gained[-15]} {Noise2Gained[-14]} {Noise2Gained[-13]} {Noise2Gained[-12]} {Noise2Gained[-11]} {Noise2Gained[-10]} {Noise2Gained[-9]} {Noise2Gained[-8]} {Noise2Gained[-7]} {Noise2Gained[-6]} {Noise2Gained[-5]} {Noise2Gained[-4]} {Noise2Gained[-3]} {Noise2Gained[-2]} {Noise2Gained[-1]} {Noise2Gained[0]} {Noise2Gained[1]} {Noise2Gained[2]} {Noise2Gained[3]}]]


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
connect_debug_port u_ila_0/clk [get_nets [list MonClk_IBUF_BUFG]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe0]
set_property port_width 18 [get_debug_ports u_ila_0/probe0]
connect_debug_port u_ila_0/probe0 [get_nets [list {Real2NoisySlv[0]} {Real2NoisySlv[1]} {Real2NoisySlv[2]} {Real2NoisySlv[3]} {Real2NoisySlv[4]} {Real2NoisySlv[5]} {Real2NoisySlv[6]} {Real2NoisySlv[7]} {Real2NoisySlv[8]} {Real2NoisySlv[9]} {Real2NoisySlv[10]} {Real2NoisySlv[11]} {Real2NoisySlv[12]} {Real2NoisySlv[13]} {Real2NoisySlv[14]} {Real2NoisySlv[15]} {Real2NoisySlv[16]} {Real2NoisySlv[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe1]
set_property port_width 18 [get_debug_ports u_ila_0/probe1]
connect_debug_port u_ila_0/probe1 [get_nets [list {Filtered1Imag[-17]} {Filtered1Imag[-16]} {Filtered1Imag[-15]} {Filtered1Imag[-14]} {Filtered1Imag[-13]} {Filtered1Imag[-12]} {Filtered1Imag[-11]} {Filtered1Imag[-10]} {Filtered1Imag[-9]} {Filtered1Imag[-8]} {Filtered1Imag[-7]} {Filtered1Imag[-6]} {Filtered1Imag[-5]} {Filtered1Imag[-4]} {Filtered1Imag[-3]} {Filtered1Imag[-2]} {Filtered1Imag[-1]} {Filtered1Imag[0]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe2]
set_property port_width 18 [get_debug_ports u_ila_0/probe2]
connect_debug_port u_ila_0/probe2 [get_nets [list {Imag2NoisySlv[0]} {Imag2NoisySlv[1]} {Imag2NoisySlv[2]} {Imag2NoisySlv[3]} {Imag2NoisySlv[4]} {Imag2NoisySlv[5]} {Imag2NoisySlv[6]} {Imag2NoisySlv[7]} {Imag2NoisySlv[8]} {Imag2NoisySlv[9]} {Imag2NoisySlv[10]} {Imag2NoisySlv[11]} {Imag2NoisySlv[12]} {Imag2NoisySlv[13]} {Imag2NoisySlv[14]} {Imag2NoisySlv[15]} {Imag2NoisySlv[16]} {Imag2NoisySlv[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe3]
set_property port_width 18 [get_debug_ports u_ila_0/probe3]
connect_debug_port u_ila_0/probe3 [get_nets [list {Real1RmsSlv[0]} {Real1RmsSlv[1]} {Real1RmsSlv[2]} {Real1RmsSlv[3]} {Real1RmsSlv[4]} {Real1RmsSlv[5]} {Real1RmsSlv[6]} {Real1RmsSlv[7]} {Real1RmsSlv[8]} {Real1RmsSlv[9]} {Real1RmsSlv[10]} {Real1RmsSlv[11]} {Real1RmsSlv[12]} {Real1RmsSlv[13]} {Real1RmsSlv[14]} {Real1RmsSlv[15]} {Real1RmsSlv[16]} {Real1RmsSlv[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe4]
set_property port_width 32 [get_debug_ports u_ila_0/probe4]
connect_debug_port u_ila_0/probe4 [get_nets [list {ErrorCount[0]} {ErrorCount[1]} {ErrorCount[2]} {ErrorCount[3]} {ErrorCount[4]} {ErrorCount[5]} {ErrorCount[6]} {ErrorCount[7]} {ErrorCount[8]} {ErrorCount[9]} {ErrorCount[10]} {ErrorCount[11]} {ErrorCount[12]} {ErrorCount[13]} {ErrorCount[14]} {ErrorCount[15]} {ErrorCount[16]} {ErrorCount[17]} {ErrorCount[18]} {ErrorCount[19]} {ErrorCount[20]} {ErrorCount[21]} {ErrorCount[22]} {ErrorCount[23]} {ErrorCount[24]} {ErrorCount[25]} {ErrorCount[26]} {ErrorCount[27]} {ErrorCount[28]} {ErrorCount[29]} {ErrorCount[30]} {ErrorCount[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe5]
set_property port_width 18 [get_debug_ports u_ila_0/probe5]
connect_debug_port u_ila_0/probe5 [get_nets [list {NcodImagSlv[0]} {NcodImagSlv[1]} {NcodImagSlv[2]} {NcodImagSlv[3]} {NcodImagSlv[4]} {NcodImagSlv[5]} {NcodImagSlv[6]} {NcodImagSlv[7]} {NcodImagSlv[8]} {NcodImagSlv[9]} {NcodImagSlv[10]} {NcodImagSlv[11]} {NcodImagSlv[12]} {NcodImagSlv[13]} {NcodImagSlv[14]} {NcodImagSlv[15]} {NcodImagSlv[16]} {NcodImagSlv[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe6]
set_property port_width 18 [get_debug_ports u_ila_0/probe6]
connect_debug_port u_ila_0/probe6 [get_nets [list {GainOutMax[0]} {GainOutMax[1]} {GainOutMax[2]} {GainOutMax[3]} {GainOutMax[4]} {GainOutMax[5]} {GainOutMax[6]} {GainOutMax[7]} {GainOutMax[8]} {GainOutMax[9]} {GainOutMax[10]} {GainOutMax[11]} {GainOutMax[12]} {GainOutMax[13]} {GainOutMax[14]} {GainOutMax[15]} {GainOutMax[16]} {GainOutMax[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe7]
set_property port_width 18 [get_debug_ports u_ila_0/probe7]
connect_debug_port u_ila_0/probe7 [get_nets [list {Filtered2Real[-17]} {Filtered2Real[-16]} {Filtered2Real[-15]} {Filtered2Real[-14]} {Filtered2Real[-13]} {Filtered2Real[-12]} {Filtered2Real[-11]} {Filtered2Real[-10]} {Filtered2Real[-9]} {Filtered2Real[-8]} {Filtered2Real[-7]} {Filtered2Real[-6]} {Filtered2Real[-5]} {Filtered2Real[-4]} {Filtered2Real[-3]} {Filtered2Real[-2]} {Filtered2Real[-1]} {Filtered2Real[0]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe8]
set_property port_width 18 [get_debug_ports u_ila_0/probe8]
connect_debug_port u_ila_0/probe8 [get_nets [list {RealCmb[0]} {RealCmb[1]} {RealCmb[2]} {RealCmb[3]} {RealCmb[4]} {RealCmb[5]} {RealCmb[6]} {RealCmb[7]} {RealCmb[8]} {RealCmb[9]} {RealCmb[10]} {RealCmb[11]} {RealCmb[12]} {RealCmb[13]} {RealCmb[14]} {RealCmb[15]} {RealCmb[16]} {RealCmb[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe9]
set_property port_width 32 [get_debug_ports u_ila_0/probe9]
connect_debug_port u_ila_0/probe9 [get_nets [list {BitErrors[0]} {BitErrors[1]} {BitErrors[2]} {BitErrors[3]} {BitErrors[4]} {BitErrors[5]} {BitErrors[6]} {BitErrors[7]} {BitErrors[8]} {BitErrors[9]} {BitErrors[10]} {BitErrors[11]} {BitErrors[12]} {BitErrors[13]} {BitErrors[14]} {BitErrors[15]} {BitErrors[16]} {BitErrors[17]} {BitErrors[18]} {BitErrors[19]} {BitErrors[20]} {BitErrors[21]} {BitErrors[22]} {BitErrors[23]} {BitErrors[24]} {BitErrors[25]} {BitErrors[26]} {BitErrors[27]} {BitErrors[28]} {BitErrors[29]} {BitErrors[30]} {BitErrors[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe10]
set_property port_width 22 [get_debug_ports u_ila_0/probe10]
connect_debug_port u_ila_0/probe10 [get_nets [list {nco_control_out[0]} {nco_control_out[1]} {nco_control_out[2]} {nco_control_out[3]} {nco_control_out[4]} {nco_control_out[5]} {nco_control_out[6]} {nco_control_out[7]} {nco_control_out[8]} {nco_control_out[9]} {nco_control_out[10]} {nco_control_out[11]} {nco_control_out[12]} {nco_control_out[13]} {nco_control_out[14]} {nco_control_out[15]} {nco_control_out[16]} {nco_control_out[17]} {nco_control_out[18]} {nco_control_out[19]} {nco_control_out[20]} {nco_control_out[21]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe11]
set_property port_width 18 [get_debug_ports u_ila_0/probe11]
connect_debug_port u_ila_0/probe11 [get_nets [list {Filtered2Imag[-17]} {Filtered2Imag[-16]} {Filtered2Imag[-15]} {Filtered2Imag[-14]} {Filtered2Imag[-13]} {Filtered2Imag[-12]} {Filtered2Imag[-11]} {Filtered2Imag[-10]} {Filtered2Imag[-9]} {Filtered2Imag[-8]} {Filtered2Imag[-7]} {Filtered2Imag[-6]} {Filtered2Imag[-5]} {Filtered2Imag[-4]} {Filtered2Imag[-3]} {Filtered2Imag[-2]} {Filtered2Imag[-1]} {Filtered2Imag[0]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe12]
set_property port_width 18 [get_debug_ports u_ila_0/probe12]
connect_debug_port u_ila_0/probe12 [get_nets [list {ImagCmb[0]} {ImagCmb[1]} {ImagCmb[2]} {ImagCmb[3]} {ImagCmb[4]} {ImagCmb[5]} {ImagCmb[6]} {ImagCmb[7]} {ImagCmb[8]} {ImagCmb[9]} {ImagCmb[10]} {ImagCmb[11]} {ImagCmb[12]} {ImagCmb[13]} {ImagCmb[14]} {ImagCmb[15]} {ImagCmb[16]} {ImagCmb[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe13]
set_property port_width 11 [get_debug_ports u_ila_0/probe13]
connect_debug_port u_ila_0/probe13 [get_nets [list {abs_agc_diff[0]} {abs_agc_diff[1]} {abs_agc_diff[2]} {abs_agc_diff[3]} {abs_agc_diff[4]} {abs_agc_diff[5]} {abs_agc_diff[6]} {abs_agc_diff[7]} {abs_agc_diff[8]} {abs_agc_diff[9]} {abs_agc_diff[10]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe14]
set_property port_width 18 [get_debug_ports u_ila_0/probe14]
connect_debug_port u_ila_0/probe14 [get_nets [list {MaxRealout[0]} {MaxRealout[1]} {MaxRealout[2]} {MaxRealout[3]} {MaxRealout[4]} {MaxRealout[5]} {MaxRealout[6]} {MaxRealout[7]} {MaxRealout[8]} {MaxRealout[9]} {MaxRealout[10]} {MaxRealout[11]} {MaxRealout[12]} {MaxRealout[13]} {MaxRealout[14]} {MaxRealout[15]} {MaxRealout[16]} {MaxRealout[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe15]
set_property port_width 18 [get_debug_ports u_ila_0/probe15]
connect_debug_port u_ila_0/probe15 [get_nets [list {DataRealSlv[0]} {DataRealSlv[1]} {DataRealSlv[2]} {DataRealSlv[3]} {DataRealSlv[4]} {DataRealSlv[5]} {DataRealSlv[6]} {DataRealSlv[7]} {DataRealSlv[8]} {DataRealSlv[9]} {DataRealSlv[10]} {DataRealSlv[11]} {DataRealSlv[12]} {DataRealSlv[13]} {DataRealSlv[14]} {DataRealSlv[15]} {DataRealSlv[16]} {DataRealSlv[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe16]
set_property port_width 32 [get_debug_ports u_ila_0/probe16]
connect_debug_port u_ila_0/probe16 [get_nets [list {BitCount[0]} {BitCount[1]} {BitCount[2]} {BitCount[3]} {BitCount[4]} {BitCount[5]} {BitCount[6]} {BitCount[7]} {BitCount[8]} {BitCount[9]} {BitCount[10]} {BitCount[11]} {BitCount[12]} {BitCount[13]} {BitCount[14]} {BitCount[15]} {BitCount[16]} {BitCount[17]} {BitCount[18]} {BitCount[19]} {BitCount[20]} {BitCount[21]} {BitCount[22]} {BitCount[23]} {BitCount[24]} {BitCount[25]} {BitCount[26]} {BitCount[27]} {BitCount[28]} {BitCount[29]} {BitCount[30]} {BitCount[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe17]
set_property port_width 18 [get_debug_ports u_ila_0/probe17]
connect_debug_port u_ila_0/probe17 [get_nets [list {phase_detect[0]} {phase_detect[1]} {phase_detect[2]} {phase_detect[3]} {phase_detect[4]} {phase_detect[5]} {phase_detect[6]} {phase_detect[7]} {phase_detect[8]} {phase_detect[9]} {phase_detect[10]} {phase_detect[11]} {phase_detect[12]} {phase_detect[13]} {phase_detect[14]} {phase_detect[15]} {phase_detect[16]} {phase_detect[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe18]
set_property port_width 18 [get_debug_ports u_ila_0/probe18]
connect_debug_port u_ila_0/probe18 [get_nets [list {DataImagSlv[0]} {DataImagSlv[1]} {DataImagSlv[2]} {DataImagSlv[3]} {DataImagSlv[4]} {DataImagSlv[5]} {DataImagSlv[6]} {DataImagSlv[7]} {DataImagSlv[8]} {DataImagSlv[9]} {DataImagSlv[10]} {DataImagSlv[11]} {DataImagSlv[12]} {DataImagSlv[13]} {DataImagSlv[14]} {DataImagSlv[15]} {DataImagSlv[16]} {DataImagSlv[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe19]
set_property port_width 13 [get_debug_ports u_ila_0/probe19]
connect_debug_port u_ila_0/probe19 [get_nets [list {RealLock[0]} {RealLock[1]} {RealLock[2]} {RealLock[3]} {RealLock[4]} {RealLock[5]} {RealLock[6]} {RealLock[7]} {RealLock[8]} {RealLock[9]} {RealLock[10]} {RealLock[11]} {RealLock[12]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe20]
set_property port_width 11 [get_debug_ports u_ila_0/probe20]
connect_debug_port u_ila_0/probe20 [get_nets [list {RealDelay[0]} {RealDelay[1]} {RealDelay[2]} {RealDelay[3]} {RealDelay[4]} {RealDelay[5]} {RealDelay[6]} {RealDelay[7]} {RealDelay[8]} {RealDelay[9]} {RealDelay[10]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe21]
set_property port_width 18 [get_debug_ports u_ila_0/probe21]
connect_debug_port u_ila_0/probe21 [get_nets [list {MinRealout[0]} {MinRealout[1]} {MinRealout[2]} {MinRealout[3]} {MinRealout[4]} {MinRealout[5]} {MinRealout[6]} {MinRealout[7]} {MinRealout[8]} {MinRealout[9]} {MinRealout[10]} {MinRealout[11]} {MinRealout[12]} {MinRealout[13]} {MinRealout[14]} {MinRealout[15]} {MinRealout[16]} {MinRealout[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe22]
set_property port_width 18 [get_debug_ports u_ila_0/probe22]
connect_debug_port u_ila_0/probe22 [get_nets [list {Real1NoisySlv[0]} {Real1NoisySlv[1]} {Real1NoisySlv[2]} {Real1NoisySlv[3]} {Real1NoisySlv[4]} {Real1NoisySlv[5]} {Real1NoisySlv[6]} {Real1NoisySlv[7]} {Real1NoisySlv[8]} {Real1NoisySlv[9]} {Real1NoisySlv[10]} {Real1NoisySlv[11]} {Real1NoisySlv[12]} {Real1NoisySlv[13]} {Real1NoisySlv[14]} {Real1NoisySlv[15]} {Real1NoisySlv[16]} {Real1NoisySlv[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe23]
set_property port_width 1 [get_debug_ports u_ila_0/probe23]
connect_debug_port u_ila_0/probe23 [get_nets [list {DataRate_reg__0[2]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe24]
set_property port_width 18 [get_debug_ports u_ila_0/probe24]
connect_debug_port u_ila_0/probe24 [get_nets [list {MaxImagout[0]} {MaxImagout[1]} {MaxImagout[2]} {MaxImagout[3]} {MaxImagout[4]} {MaxImagout[5]} {MaxImagout[6]} {MaxImagout[7]} {MaxImagout[8]} {MaxImagout[9]} {MaxImagout[10]} {MaxImagout[11]} {MaxImagout[12]} {MaxImagout[13]} {MaxImagout[14]} {MaxImagout[15]} {MaxImagout[16]} {MaxImagout[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe25]
set_property port_width 18 [get_debug_ports u_ila_0/probe25]
connect_debug_port u_ila_0/probe25 [get_nets [list {GainOutMin[0]} {GainOutMin[1]} {GainOutMin[2]} {GainOutMin[3]} {GainOutMin[4]} {GainOutMin[5]} {GainOutMin[6]} {GainOutMin[7]} {GainOutMin[8]} {GainOutMin[9]} {GainOutMin[10]} {GainOutMin[11]} {GainOutMin[12]} {GainOutMin[13]} {GainOutMin[14]} {GainOutMin[15]} {GainOutMin[16]} {GainOutMin[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe26]
set_property port_width 18 [get_debug_ports u_ila_0/probe26]
connect_debug_port u_ila_0/probe26 [get_nets [list {NcodRealSlv[0]} {NcodRealSlv[1]} {NcodRealSlv[2]} {NcodRealSlv[3]} {NcodRealSlv[4]} {NcodRealSlv[5]} {NcodRealSlv[6]} {NcodRealSlv[7]} {NcodRealSlv[8]} {NcodRealSlv[9]} {NcodRealSlv[10]} {NcodRealSlv[11]} {NcodRealSlv[12]} {NcodRealSlv[13]} {NcodRealSlv[14]} {NcodRealSlv[15]} {NcodRealSlv[16]} {NcodRealSlv[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe27]
set_property port_width 16 [get_debug_ports u_ila_0/probe27]
connect_debug_port u_ila_0/probe27 [get_nets [list {IlaCounter[0]} {IlaCounter[1]} {IlaCounter[2]} {IlaCounter[3]} {IlaCounter[4]} {IlaCounter[5]} {IlaCounter[6]} {IlaCounter[7]} {IlaCounter[8]} {IlaCounter[9]} {IlaCounter[10]} {IlaCounter[11]} {IlaCounter[12]} {IlaCounter[13]} {IlaCounter[14]} {IlaCounter[15]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe28]
set_property port_width 18 [get_debug_ports u_ila_0/probe28]
connect_debug_port u_ila_0/probe28 [get_nets [list {Noise2RmsSlv[0]} {Noise2RmsSlv[1]} {Noise2RmsSlv[2]} {Noise2RmsSlv[3]} {Noise2RmsSlv[4]} {Noise2RmsSlv[5]} {Noise2RmsSlv[6]} {Noise2RmsSlv[7]} {Noise2RmsSlv[8]} {Noise2RmsSlv[9]} {Noise2RmsSlv[10]} {Noise2RmsSlv[11]} {Noise2RmsSlv[12]} {Noise2RmsSlv[13]} {Noise2RmsSlv[14]} {Noise2RmsSlv[15]} {Noise2RmsSlv[16]} {Noise2RmsSlv[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe29]
set_property port_width 18 [get_debug_ports u_ila_0/probe29]
connect_debug_port u_ila_0/probe29 [get_nets [list {MinImagout[0]} {MinImagout[1]} {MinImagout[2]} {MinImagout[3]} {MinImagout[4]} {MinImagout[5]} {MinImagout[6]} {MinImagout[7]} {MinImagout[8]} {MinImagout[9]} {MinImagout[10]} {MinImagout[11]} {MinImagout[12]} {MinImagout[13]} {MinImagout[14]} {MinImagout[15]} {MinImagout[16]} {MinImagout[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe30]
set_property port_width 18 [get_debug_ports u_ila_0/probe30]
connect_debug_port u_ila_0/probe30 [get_nets [list {Imag1NoisySlv[0]} {Imag1NoisySlv[1]} {Imag1NoisySlv[2]} {Imag1NoisySlv[3]} {Imag1NoisySlv[4]} {Imag1NoisySlv[5]} {Imag1NoisySlv[6]} {Imag1NoisySlv[7]} {Imag1NoisySlv[8]} {Imag1NoisySlv[9]} {Imag1NoisySlv[10]} {Imag1NoisySlv[11]} {Imag1NoisySlv[12]} {Imag1NoisySlv[13]} {Imag1NoisySlv[14]} {Imag1NoisySlv[15]} {Imag1NoisySlv[16]} {Imag1NoisySlv[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe31]
set_property port_width 32 [get_debug_ports u_ila_0/probe31]
connect_debug_port u_ila_0/probe31 [get_nets [list {lag_out[0]} {lag_out[1]} {lag_out[2]} {lag_out[3]} {lag_out[4]} {lag_out[5]} {lag_out[6]} {lag_out[7]} {lag_out[8]} {lag_out[9]} {lag_out[10]} {lag_out[11]} {lag_out[12]} {lag_out[13]} {lag_out[14]} {lag_out[15]} {lag_out[16]} {lag_out[17]} {lag_out[18]} {lag_out[19]} {lag_out[20]} {lag_out[21]} {lag_out[22]} {lag_out[23]} {lag_out[24]} {lag_out[25]} {lag_out[26]} {lag_out[27]} {lag_out[28]} {lag_out[29]} {lag_out[30]} {lag_out[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe32]
set_property port_width 18 [get_debug_ports u_ila_0/probe32]
connect_debug_port u_ila_0/probe32 [get_nets [list {Filtered1Real[-17]} {Filtered1Real[-16]} {Filtered1Real[-15]} {Filtered1Real[-14]} {Filtered1Real[-13]} {Filtered1Real[-12]} {Filtered1Real[-11]} {Filtered1Real[-10]} {Filtered1Real[-9]} {Filtered1Real[-8]} {Filtered1Real[-7]} {Filtered1Real[-6]} {Filtered1Real[-5]} {Filtered1Real[-4]} {Filtered1Real[-3]} {Filtered1Real[-2]} {Filtered1Real[-1]} {Filtered1Real[0]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe33]
set_property port_width 13 [get_debug_ports u_ila_0/probe33]
connect_debug_port u_ila_0/probe33 [get_nets [list {ImagLock[0]} {ImagLock[1]} {ImagLock[2]} {ImagLock[3]} {ImagLock[4]} {ImagLock[5]} {ImagLock[6]} {ImagLock[7]} {ImagLock[8]} {ImagLock[9]} {ImagLock[10]} {ImagLock[11]} {ImagLock[12]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe34]
set_property port_width 24 [get_debug_ports u_ila_0/probe34]
connect_debug_port u_ila_0/probe34 [get_nets [list {LFSR15/data[0]} {LFSR15/data[1]} {LFSR15/data[2]} {LFSR15/data[3]} {LFSR15/data[4]} {LFSR15/data[5]} {LFSR15/data[6]} {LFSR15/data[7]} {LFSR15/data[8]} {LFSR15/data[9]} {LFSR15/data[10]} {LFSR15/data[11]} {LFSR15/data[12]} {LFSR15/data[13]} {LFSR15/data[14]} {LFSR15/data[15]} {LFSR15/data[16]} {LFSR15/data[17]} {LFSR15/data[18]} {LFSR15/data[19]} {LFSR15/data[20]} {LFSR15/data[21]} {LFSR15/data[22]} {LFSR15/data[23]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe35]
set_property port_width 1 [get_debug_ports u_ila_0/probe35]
connect_debug_port u_ila_0/probe35 [get_nets [list agc1_gt_agc2]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe36]
set_property port_width 1 [get_debug_ports u_ila_0/probe36]
connect_debug_port u_ila_0/probe36 [get_nets [list LFSR15/enable]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe37]
set_property port_width 1 [get_debug_ports u_ila_0/probe37]
connect_debug_port u_ila_0/probe37 [get_nets [list ImagXord]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe38]
set_property port_width 1 [get_debug_ports u_ila_0/probe38]
connect_debug_port u_ila_0/probe38 [get_nets [list Locked]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe39]
set_property port_width 1 [get_debug_ports u_ila_0/probe39]
connect_debug_port u_ila_0/probe39 [get_nets [list PrnEn]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe40]
set_property port_width 1 [get_debug_ports u_ila_0/probe40]
connect_debug_port u_ila_0/probe40 [get_nets [list RealXord]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe41]
set_property port_width 1 [get_debug_ports u_ila_0/probe41]
connect_debug_port u_ila_0/probe41 [get_nets [list RecoveredData]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe42]
set_property port_width 1 [get_debug_ports u_ila_0/probe42]
connect_debug_port u_ila_0/probe42 [get_nets [list LFSR15/serial]]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets MonClk_IBUF_BUFG]
