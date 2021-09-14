
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
connect_debug_port u_ila_0/clk [get_nets [list DataGen.demodTop/systemClock/inst/clk1x]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe0]
set_property port_width 18 [get_debug_ports u_ila_0/probe0]
connect_debug_port u_ila_0/probe0 [get_nets [list {AGCs/GainIntSlv[0]} {AGCs/GainIntSlv[1]} {AGCs/GainIntSlv[2]} {AGCs/GainIntSlv[3]} {AGCs/GainIntSlv[4]} {AGCs/GainIntSlv[5]} {AGCs/GainIntSlv[6]} {AGCs/GainIntSlv[7]} {AGCs/GainIntSlv[8]} {AGCs/GainIntSlv[9]} {AGCs/GainIntSlv[10]} {AGCs/GainIntSlv[11]} {AGCs/GainIntSlv[12]} {AGCs/GainIntSlv[13]} {AGCs/GainIntSlv[14]} {AGCs/GainIntSlv[15]} {AGCs/GainIntSlv[16]} {AGCs/GainIntSlv[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe1]
set_property port_width 14 [get_debug_ports u_ila_0/probe1]
connect_debug_port u_ila_0/probe1 [get_nets [list {AGCs/RealGained[-13]} {AGCs/RealGained[-12]} {AGCs/RealGained[-11]} {AGCs/RealGained[-10]} {AGCs/RealGained[-9]} {AGCs/RealGained[-8]} {AGCs/RealGained[-7]} {AGCs/RealGained[-6]} {AGCs/RealGained[-5]} {AGCs/RealGained[-4]} {AGCs/RealGained[-3]} {AGCs/RealGained[-2]} {AGCs/RealGained[-1]} {AGCs/RealGained[0]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe2]
set_property port_width 14 [get_debug_ports u_ila_0/probe2]
connect_debug_port u_ila_0/probe2 [get_nets [list {AGCs/ImagGained[-13]} {AGCs/ImagGained[-12]} {AGCs/ImagGained[-11]} {AGCs/ImagGained[-10]} {AGCs/ImagGained[-9]} {AGCs/ImagGained[-8]} {AGCs/ImagGained[-7]} {AGCs/ImagGained[-6]} {AGCs/ImagGained[-5]} {AGCs/ImagGained[-4]} {AGCs/ImagGained[-3]} {AGCs/ImagGained[-2]} {AGCs/ImagGained[-1]} {AGCs/ImagGained[0]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe3]
set_property port_width 8 [get_debug_ports u_ila_0/probe3]
connect_debug_port u_ila_0/probe3 [get_nets [list {GenIF/DucCount[0]} {GenIF/DucCount[1]} {GenIF/DucCount[2]} {GenIF/DucCount[3]} {GenIF/DucCount[4]} {GenIF/DucCount[5]} {GenIF/DucCount[6]} {GenIF/DucCount[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe4]
set_property port_width 12 [get_debug_ports u_ila_0/probe4]
connect_debug_port u_ila_0/probe4 [get_nets [list {DataGen.demodTop/amDataIn[0]} {DataGen.demodTop/amDataIn[1]} {DataGen.demodTop/amDataIn[2]} {DataGen.demodTop/amDataIn[3]} {DataGen.demodTop/amDataIn[4]} {DataGen.demodTop/amDataIn[5]} {DataGen.demodTop/amDataIn[6]} {DataGen.demodTop/amDataIn[7]} {DataGen.demodTop/amDataIn[8]} {DataGen.demodTop/amDataIn[9]} {DataGen.demodTop/amDataIn[10]} {DataGen.demodTop/amDataIn[11]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe5]
set_property port_width 18 [get_debug_ports u_ila_0/probe5]
connect_debug_port u_ila_0/probe5 [get_nets [list {DataI[0]} {DataI[1]} {DataI[2]} {DataI[3]} {DataI[4]} {DataI[5]} {DataI[6]} {DataI[7]} {DataI[8]} {DataI[9]} {DataI[10]} {DataI[11]} {DataI[12]} {DataI[13]} {DataI[14]} {DataI[15]} {DataI[16]} {DataI[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe6]
set_property port_width 18 [get_debug_ports u_ila_0/probe6]
connect_debug_port u_ila_0/probe6 [get_nets [list {DataQ[0]} {DataQ[1]} {DataQ[2]} {DataQ[3]} {DataQ[4]} {DataQ[5]} {DataQ[6]} {DataQ[7]} {DataQ[8]} {DataQ[9]} {DataQ[10]} {DataQ[11]} {DataQ[12]} {DataQ[13]} {DataQ[14]} {DataQ[15]} {DataQ[16]} {DataQ[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe7]
set_property port_width 7 [get_debug_ports u_ila_0/probe7]
connect_debug_port u_ila_0/probe7 [get_nets [list {DataRate[0]} {DataRate[1]} {DataRate[2]} {DataRate[3]} {DataRate[4]} {DataRate[5]} {DataRate[6]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe8]
set_property port_width 8 [get_debug_ports u_ila_0/probe8]
connect_debug_port u_ila_0/probe8 [get_nets [list {Delay[0]} {Delay[1]} {Delay[2]} {Delay[3]} {Delay[4]} {Delay[5]} {Delay[6]} {Delay[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe9]
set_property port_width 14 [get_debug_ports u_ila_0/probe9]
connect_debug_port u_ila_0/probe9 [get_nets [list {IF_Mux[0]} {IF_Mux[1]} {IF_Mux[2]} {IF_Mux[3]} {IF_Mux[4]} {IF_Mux[5]} {IF_Mux[6]} {IF_Mux[7]} {IF_Mux[8]} {IF_Mux[9]} {IF_Mux[10]} {IF_Mux[11]} {IF_Mux[12]} {IF_Mux[13]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe10]
set_property port_width 32 [get_debug_ports u_ila_0/probe10]
connect_debug_port u_ila_0/probe10 [get_nets [list {MDB_180_1[0]} {MDB_180_1[1]} {MDB_180_1[2]} {MDB_180_1[3]} {MDB_180_1[4]} {MDB_180_1[5]} {MDB_180_1[6]} {MDB_180_1[7]} {MDB_180_1[8]} {MDB_180_1[9]} {MDB_180_1[10]} {MDB_180_1[11]} {MDB_180_1[12]} {MDB_180_1[13]} {MDB_180_1[14]} {MDB_180_1[15]} {MDB_180_1[16]} {MDB_180_1[17]} {MDB_180_1[18]} {MDB_180_1[19]} {MDB_180_1[20]} {MDB_180_1[21]} {MDB_180_1[22]} {MDB_180_1[23]} {MDB_180_1[24]} {MDB_180_1[25]} {MDB_180_1[26]} {MDB_180_1[27]} {MDB_180_1[28]} {MDB_180_1[29]} {MDB_180_1[30]} {MDB_180_1[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe11]
set_property port_width 32 [get_debug_ports u_ila_0/probe11]
connect_debug_port u_ila_0/probe11 [get_nets [list {MDB_182_3[0]} {MDB_182_3[1]} {MDB_182_3[2]} {MDB_182_3[3]} {MDB_182_3[4]} {MDB_182_3[5]} {MDB_182_3[6]} {MDB_182_3[7]} {MDB_182_3[8]} {MDB_182_3[9]} {MDB_182_3[10]} {MDB_182_3[11]} {MDB_182_3[12]} {MDB_182_3[13]} {MDB_182_3[14]} {MDB_182_3[15]} {MDB_182_3[16]} {MDB_182_3[17]} {MDB_182_3[18]} {MDB_182_3[19]} {MDB_182_3[20]} {MDB_182_3[21]} {MDB_182_3[22]} {MDB_182_3[23]} {MDB_182_3[24]} {MDB_182_3[25]} {MDB_182_3[26]} {MDB_182_3[27]} {MDB_182_3[28]} {MDB_182_3[29]} {MDB_182_3[30]} {MDB_182_3[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe12]
set_property port_width 32 [get_debug_ports u_ila_0/probe12]
connect_debug_port u_ila_0/probe12 [get_nets [list {MDB_184_5[0]} {MDB_184_5[1]} {MDB_184_5[2]} {MDB_184_5[3]} {MDB_184_5[4]} {MDB_184_5[5]} {MDB_184_5[6]} {MDB_184_5[7]} {MDB_184_5[8]} {MDB_184_5[9]} {MDB_184_5[10]} {MDB_184_5[11]} {MDB_184_5[12]} {MDB_184_5[13]} {MDB_184_5[14]} {MDB_184_5[15]} {MDB_184_5[16]} {MDB_184_5[17]} {MDB_184_5[18]} {MDB_184_5[19]} {MDB_184_5[20]} {MDB_184_5[21]} {MDB_184_5[22]} {MDB_184_5[23]} {MDB_184_5[24]} {MDB_184_5[25]} {MDB_184_5[26]} {MDB_184_5[27]} {MDB_184_5[28]} {MDB_184_5[29]} {MDB_184_5[30]} {MDB_184_5[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe13]
set_property port_width 16 [get_debug_ports u_ila_0/probe13]
connect_debug_port u_ila_0/probe13 [get_nets [list {MDB_186[0]} {MDB_186[1]} {MDB_186[2]} {MDB_186[3]} {MDB_186[4]} {MDB_186[5]} {MDB_186[6]} {MDB_186[7]} {MDB_186[8]} {MDB_186[9]} {MDB_186[10]} {MDB_186[11]} {MDB_186[12]} {MDB_186[13]} {MDB_186[14]} {MDB_186[15]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe14]
set_property port_width 16 [get_debug_ports u_ila_0/probe14]
connect_debug_port u_ila_0/probe14 [get_nets [list {MDB_187[0]} {MDB_187[1]} {MDB_187[2]} {MDB_187[3]} {MDB_187[4]} {MDB_187[5]} {MDB_187[6]} {MDB_187[7]} {MDB_187[8]} {MDB_187[9]} {MDB_187[10]} {MDB_187[11]} {MDB_187[12]} {MDB_187[13]} {MDB_187[14]} {MDB_187[15]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe15]
set_property port_width 32 [get_debug_ports u_ila_0/probe15]
connect_debug_port u_ila_0/probe15 [get_nets [list {MDB_188_9[0]} {MDB_188_9[1]} {MDB_188_9[2]} {MDB_188_9[3]} {MDB_188_9[4]} {MDB_188_9[5]} {MDB_188_9[6]} {MDB_188_9[7]} {MDB_188_9[8]} {MDB_188_9[9]} {MDB_188_9[10]} {MDB_188_9[11]} {MDB_188_9[12]} {MDB_188_9[13]} {MDB_188_9[14]} {MDB_188_9[15]} {MDB_188_9[16]} {MDB_188_9[17]} {MDB_188_9[18]} {MDB_188_9[19]} {MDB_188_9[20]} {MDB_188_9[21]} {MDB_188_9[22]} {MDB_188_9[23]} {MDB_188_9[24]} {MDB_188_9[25]} {MDB_188_9[26]} {MDB_188_9[27]} {MDB_188_9[28]} {MDB_188_9[29]} {MDB_188_9[30]} {MDB_188_9[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe16]
set_property port_width 18 [get_debug_ports u_ila_0/probe16]
connect_debug_port u_ila_0/probe16 [get_nets [list {NoiseRmsSlv[0]} {NoiseRmsSlv[1]} {NoiseRmsSlv[2]} {NoiseRmsSlv[3]} {NoiseRmsSlv[4]} {NoiseRmsSlv[5]} {NoiseRmsSlv[6]} {NoiseRmsSlv[7]} {NoiseRmsSlv[8]} {NoiseRmsSlv[9]} {NoiseRmsSlv[10]} {NoiseRmsSlv[11]} {NoiseRmsSlv[12]} {NoiseRmsSlv[13]} {NoiseRmsSlv[14]} {NoiseRmsSlv[15]} {NoiseRmsSlv[16]} {NoiseRmsSlv[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe17]
set_property port_width 18 [get_debug_ports u_ila_0/probe17]
connect_debug_port u_ila_0/probe17 [get_nets [list {adcRmsSlv[0]} {adcRmsSlv[1]} {adcRmsSlv[2]} {adcRmsSlv[3]} {adcRmsSlv[4]} {adcRmsSlv[5]} {adcRmsSlv[6]} {adcRmsSlv[7]} {adcRmsSlv[8]} {adcRmsSlv[9]} {adcRmsSlv[10]} {adcRmsSlv[11]} {adcRmsSlv[12]} {adcRmsSlv[13]} {adcRmsSlv[14]} {adcRmsSlv[15]} {adcRmsSlv[16]} {adcRmsSlv[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe18]
set_property port_width 1 [get_debug_ports u_ila_0/probe18]
connect_debug_port u_ila_0/probe18 [get_nets [list DataGen.demodTop/amDataEn]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe19]
set_property port_width 1 [get_debug_ports u_ila_0/probe19]
connect_debug_port u_ila_0/probe19 [get_nets [list ch3ClkOut_OBUF]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe20]
set_property port_width 1 [get_debug_ports u_ila_0/probe20]
connect_debug_port u_ila_0/probe20 [get_nets [list ch3DataOut_OBUF]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe21]
set_property port_width 1 [get_debug_ports u_ila_0/probe21]
connect_debug_port u_ila_0/probe21 [get_nets [list {NoisyI_reg[-_n_0_1]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe22]
set_property port_width 1 [get_debug_ports u_ila_0/probe22]
connect_debug_port u_ila_0/probe22 [get_nets [list {NoisyI_reg[-_n_0_2]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe23]
set_property port_width 1 [get_debug_ports u_ila_0/probe23]
connect_debug_port u_ila_0/probe23 [get_nets [list {NoisyI_reg[-_n_0_3]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe24]
set_property port_width 1 [get_debug_ports u_ila_0/probe24]
connect_debug_port u_ila_0/probe24 [get_nets [list {NoisyI_reg[-_n_0_4]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe25]
set_property port_width 1 [get_debug_ports u_ila_0/probe25]
connect_debug_port u_ila_0/probe25 [get_nets [list {NoisyI_reg[-_n_0_5]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe26]
set_property port_width 1 [get_debug_ports u_ila_0/probe26]
connect_debug_port u_ila_0/probe26 [get_nets [list {NoisyI_reg[-_n_0_6]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe27]
set_property port_width 1 [get_debug_ports u_ila_0/probe27]
connect_debug_port u_ila_0/probe27 [get_nets [list {NoisyI_reg[-_n_0_7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe28]
set_property port_width 1 [get_debug_ports u_ila_0/probe28]
connect_debug_port u_ila_0/probe28 [get_nets [list {NoisyI_reg[-_n_0_8]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe29]
set_property port_width 1 [get_debug_ports u_ila_0/probe29]
connect_debug_port u_ila_0/probe29 [get_nets [list {NoisyI_reg[-_n_0_9]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe30]
set_property port_width 1 [get_debug_ports u_ila_0/probe30]
connect_debug_port u_ila_0/probe30 [get_nets [list {NoisyI_reg[-_n_0_10]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe31]
set_property port_width 1 [get_debug_ports u_ila_0/probe31]
connect_debug_port u_ila_0/probe31 [get_nets [list {NoisyI_reg[-_n_0_11]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe32]
set_property port_width 1 [get_debug_ports u_ila_0/probe32]
connect_debug_port u_ila_0/probe32 [get_nets [list {NoisyI_reg[-_n_0_12]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe33]
set_property port_width 1 [get_debug_ports u_ila_0/probe33]
connect_debug_port u_ila_0/probe33 [get_nets [list {NoisyI_reg[-_n_0_13]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe34]
set_property port_width 1 [get_debug_ports u_ila_0/probe34]
connect_debug_port u_ila_0/probe34 [get_nets [list {NoisyI_reg_n_0_[0]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe35]
set_property port_width 1 [get_debug_ports u_ila_0/probe35]
connect_debug_port u_ila_0/probe35 [get_nets [list {NoisyQ_reg[-_n_0_1]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe36]
set_property port_width 1 [get_debug_ports u_ila_0/probe36]
connect_debug_port u_ila_0/probe36 [get_nets [list {NoisyQ_reg[-_n_0_2]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe37]
set_property port_width 1 [get_debug_ports u_ila_0/probe37]
connect_debug_port u_ila_0/probe37 [get_nets [list {NoisyQ_reg[-_n_0_3]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe38]
set_property port_width 1 [get_debug_ports u_ila_0/probe38]
connect_debug_port u_ila_0/probe38 [get_nets [list {NoisyQ_reg[-_n_0_4]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe39]
set_property port_width 1 [get_debug_ports u_ila_0/probe39]
connect_debug_port u_ila_0/probe39 [get_nets [list {NoisyQ_reg[-_n_0_5]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe40]
set_property port_width 1 [get_debug_ports u_ila_0/probe40]
connect_debug_port u_ila_0/probe40 [get_nets [list {NoisyQ_reg[-_n_0_6]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe41]
set_property port_width 1 [get_debug_ports u_ila_0/probe41]
connect_debug_port u_ila_0/probe41 [get_nets [list {NoisyQ_reg[-_n_0_7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe42]
set_property port_width 1 [get_debug_ports u_ila_0/probe42]
connect_debug_port u_ila_0/probe42 [get_nets [list {NoisyQ_reg[-_n_0_8]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe43]
set_property port_width 1 [get_debug_ports u_ila_0/probe43]
connect_debug_port u_ila_0/probe43 [get_nets [list {NoisyQ_reg[-_n_0_9]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe44]
set_property port_width 1 [get_debug_ports u_ila_0/probe44]
connect_debug_port u_ila_0/probe44 [get_nets [list {NoisyQ_reg[-_n_0_10]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe45]
set_property port_width 1 [get_debug_ports u_ila_0/probe45]
connect_debug_port u_ila_0/probe45 [get_nets [list {NoisyQ_reg[-_n_0_11]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe46]
set_property port_width 1 [get_debug_ports u_ila_0/probe46]
connect_debug_port u_ila_0/probe46 [get_nets [list {NoisyQ_reg[-_n_0_12]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe47]
set_property port_width 1 [get_debug_ports u_ila_0/probe47]
connect_debug_port u_ila_0/probe47 [get_nets [list {NoisyQ_reg[-_n_0_13]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe48]
set_property port_width 1 [get_debug_ports u_ila_0/probe48]
connect_debug_port u_ila_0/probe48 [get_nets [list {NoisyQ_reg_n_0_[0]}]]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets clk]
