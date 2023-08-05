


create_debug_core u_ila_0 ila
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_0]
set_property ALL_PROBE_SAME_MU_CNT 2 [get_debug_cores u_ila_0]
set_property C_ADV_TRIGGER false [get_debug_cores u_ila_0]
set_property C_DATA_DEPTH 1024 [get_debug_cores u_ila_0]
set_property C_EN_STRG_QUAL true [get_debug_cores u_ila_0]
set_property C_INPUT_PIPE_STAGES 1 [get_debug_cores u_ila_0]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_0]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_0]
set_property port_width 1 [get_debug_ports u_ila_0/clk]
connect_debug_port u_ila_0/clk [get_nets [list systemClock/inst/clk186]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe0]
set_property port_width 18 [get_debug_ports u_ila_0/probe0]
connect_debug_port u_ila_0/probe0 [get_nets [list {stcDemod/PD_u/AbsCntr0_Ila[0]} {stcDemod/PD_u/AbsCntr0_Ila[1]} {stcDemod/PD_u/AbsCntr0_Ila[2]} {stcDemod/PD_u/AbsCntr0_Ila[3]} {stcDemod/PD_u/AbsCntr0_Ila[4]} {stcDemod/PD_u/AbsCntr0_Ila[5]} {stcDemod/PD_u/AbsCntr0_Ila[6]} {stcDemod/PD_u/AbsCntr0_Ila[7]} {stcDemod/PD_u/AbsCntr0_Ila[8]} {stcDemod/PD_u/AbsCntr0_Ila[9]} {stcDemod/PD_u/AbsCntr0_Ila[10]} {stcDemod/PD_u/AbsCntr0_Ila[11]} {stcDemod/PD_u/AbsCntr0_Ila[12]} {stcDemod/PD_u/AbsCntr0_Ila[13]} {stcDemod/PD_u/AbsCntr0_Ila[14]} {stcDemod/PD_u/AbsCntr0_Ila[15]} {stcDemod/PD_u/AbsCntr0_Ila[16]} {stcDemod/PD_u/AbsCntr0_Ila[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe1]
set_property port_width 4 [get_debug_ports u_ila_0/probe1]
connect_debug_port u_ila_0/probe1 [get_nets [list {stcDemod/Counter[0]} {stcDemod/Counter[1]} {stcDemod/Counter[2]} {stcDemod/Counter[3]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe2]
set_property port_width 14 [get_debug_ports u_ila_0/probe2]
connect_debug_port u_ila_0/probe2 [get_nets [list {stcDemod/FD_pll/FifoDepth[0]} {stcDemod/FD_pll/FifoDepth[1]} {stcDemod/FD_pll/FifoDepth[2]} {stcDemod/FD_pll/FifoDepth[3]} {stcDemod/FD_pll/FifoDepth[4]} {stcDemod/FD_pll/FifoDepth[5]} {stcDemod/FD_pll/FifoDepth[6]} {stcDemod/FD_pll/FifoDepth[7]} {stcDemod/FD_pll/FifoDepth[8]} {stcDemod/FD_pll/FifoDepth[9]} {stcDemod/FD_pll/FifoDepth[10]} {stcDemod/FD_pll/FifoDepth[11]} {stcDemod/FD_pll/FifoDepth[12]} {stcDemod/FD_pll/FifoDepth[13]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe3]
set_property port_width 32 [get_debug_ports u_ila_0/probe3]
connect_debug_port u_ila_0/probe3 [get_nets [list {stcDemod/FD_LF/Sum[-16]} {stcDemod/FD_LF/Sum[-15]} {stcDemod/FD_LF/Sum[-14]} {stcDemod/FD_LF/Sum[-13]} {stcDemod/FD_LF/Sum[-12]} {stcDemod/FD_LF/Sum[-11]} {stcDemod/FD_LF/Sum[-10]} {stcDemod/FD_LF/Sum[-9]} {stcDemod/FD_LF/Sum[-8]} {stcDemod/FD_LF/Sum[-7]} {stcDemod/FD_LF/Sum[-6]} {stcDemod/FD_LF/Sum[-5]} {stcDemod/FD_LF/Sum[-4]} {stcDemod/FD_LF/Sum[-3]} {stcDemod/FD_LF/Sum[-2]} {stcDemod/FD_LF/Sum[-1]} {stcDemod/FD_LF/Sum[0]} {stcDemod/FD_LF/Sum[1]} {stcDemod/FD_LF/Sum[2]} {stcDemod/FD_LF/Sum[3]} {stcDemod/FD_LF/Sum[4]} {stcDemod/FD_LF/Sum[5]} {stcDemod/FD_LF/Sum[6]} {stcDemod/FD_LF/Sum[7]} {stcDemod/FD_LF/Sum[8]} {stcDemod/FD_LF/Sum[9]} {stcDemod/FD_LF/Sum[10]} {stcDemod/FD_LF/Sum[11]} {stcDemod/FD_LF/Sum[12]} {stcDemod/FD_LF/Sum[13]} {stcDemod/FD_LF/Sum[14]} {stcDemod/FD_LF/Sum[15]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe4]
set_property port_width 16 [get_debug_ports u_ila_0/probe4]
connect_debug_port u_ila_0/probe4 [get_nets [list {stcDemod/FD_LF/Accum[0]} {stcDemod/FD_LF/Accum[1]} {stcDemod/FD_LF/Accum[2]} {stcDemod/FD_LF/Accum[3]} {stcDemod/FD_LF/Accum[4]} {stcDemod/FD_LF/Accum[5]} {stcDemod/FD_LF/Accum[6]} {stcDemod/FD_LF/Accum[7]} {stcDemod/FD_LF/Accum[8]} {stcDemod/FD_LF/Accum[9]} {stcDemod/FD_LF/Accum[10]} {stcDemod/FD_LF/Accum[11]} {stcDemod/FD_LF/Accum[12]} {stcDemod/FD_LF/Accum[13]} {stcDemod/FD_LF/Accum[14]} {stcDemod/FD_LF/Accum[15]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe5]
set_property port_width 32 [get_debug_ports u_ila_0/probe5]
connect_debug_port u_ila_0/probe5 [get_nets [list {stcDemod/FD_LF/LF/loopFreq[0]} {stcDemod/FD_LF/LF/loopFreq[1]} {stcDemod/FD_LF/LF/loopFreq[2]} {stcDemod/FD_LF/LF/loopFreq[3]} {stcDemod/FD_LF/LF/loopFreq[4]} {stcDemod/FD_LF/LF/loopFreq[5]} {stcDemod/FD_LF/LF/loopFreq[6]} {stcDemod/FD_LF/LF/loopFreq[7]} {stcDemod/FD_LF/LF/loopFreq[8]} {stcDemod/FD_LF/LF/loopFreq[9]} {stcDemod/FD_LF/LF/loopFreq[10]} {stcDemod/FD_LF/LF/loopFreq[11]} {stcDemod/FD_LF/LF/loopFreq[12]} {stcDemod/FD_LF/LF/loopFreq[13]} {stcDemod/FD_LF/LF/loopFreq[14]} {stcDemod/FD_LF/LF/loopFreq[15]} {stcDemod/FD_LF/LF/loopFreq[16]} {stcDemod/FD_LF/LF/loopFreq[17]} {stcDemod/FD_LF/LF/loopFreq[18]} {stcDemod/FD_LF/LF/loopFreq[19]} {stcDemod/FD_LF/LF/loopFreq[20]} {stcDemod/FD_LF/LF/loopFreq[21]} {stcDemod/FD_LF/LF/loopFreq[22]} {stcDemod/FD_LF/LF/loopFreq[23]} {stcDemod/FD_LF/LF/loopFreq[24]} {stcDemod/FD_LF/LF/loopFreq[25]} {stcDemod/FD_LF/LF/loopFreq[26]} {stcDemod/FD_LF/LF/loopFreq[27]} {stcDemod/FD_LF/LF/loopFreq[28]} {stcDemod/FD_LF/LF/loopFreq[29]} {stcDemod/FD_LF/LF/loopFreq[30]} {stcDemod/FD_LF/LF/loopFreq[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe6]
set_property port_width 12 [get_debug_ports u_ila_0/probe6]
connect_debug_port u_ila_0/probe6 [get_nets [list {stcDemod/FD_LF/FifoOffset[0]} {stcDemod/FD_LF/FifoOffset[1]} {stcDemod/FD_LF/FifoOffset[2]} {stcDemod/FD_LF/FifoOffset[3]} {stcDemod/FD_LF/FifoOffset[4]} {stcDemod/FD_LF/FifoOffset[5]} {stcDemod/FD_LF/FifoOffset[6]} {stcDemod/FD_LF/FifoOffset[7]} {stcDemod/FD_LF/FifoOffset[8]} {stcDemod/FD_LF/FifoOffset[9]} {stcDemod/FD_LF/FifoOffset[10]} {stcDemod/FD_LF/FifoOffset[11]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe7]
set_property port_width 1 [get_debug_ports u_ila_0/probe7]
connect_debug_port u_ila_0/probe7 [get_nets [list stcDemod/ClkOutEn]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe8]
set_property port_width 1 [get_debug_ports u_ila_0/probe8]
connect_debug_port u_ila_0/probe8 [get_nets [list stcDemod/DataOut]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe9]
set_property port_width 1 [get_debug_ports u_ila_0/probe9]
connect_debug_port u_ila_0/probe9 [get_nets [list stcDemod/EstimatesDone]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe10]
set_property port_width 1 [get_debug_ports u_ila_0/probe10]
connect_debug_port u_ila_0/probe10 [get_nets [list stcDemod/PrnErrors]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe11]
set_property port_width 1 [get_debug_ports u_ila_0/probe11]
connect_debug_port u_ila_0/probe11 [get_nets [list stcDemod/StartIla]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe12]
set_property port_width 1 [get_debug_ports u_ila_0/probe12]
connect_debug_port u_ila_0/probe12 [get_nets [list stcDemod/ValidPN15]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe13]
set_property port_width 1 [get_debug_ports u_ila_0/probe13]
connect_debug_port u_ila_0/probe13 [get_nets [list stcDemod/FD_pll/full]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe14]
set_property port_width 1 [get_debug_ports u_ila_0/probe14]
connect_debug_port u_ila_0/probe14 [get_nets [list stcDemod/FD_pll/empty]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe15]
set_property port_width 1 [get_debug_ports u_ila_0/probe15]
connect_debug_port u_ila_0/probe15 [get_nets [list {stcDemod/FD_pll/EffectiveRate_reg_n_1_[0]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe16]
set_property port_width 1 [get_debug_ports u_ila_0/probe16]
connect_debug_port u_ila_0/probe16 [get_nets [list {stcDemod/FD_pll/EffectiveRate_reg_n_1_[1]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe17]
set_property port_width 1 [get_debug_ports u_ila_0/probe17]
connect_debug_port u_ila_0/probe17 [get_nets [list {stcDemod/FD_pll/EffectiveRate_reg_n_1_[2]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe18]
set_property port_width 1 [get_debug_ports u_ila_0/probe18]
connect_debug_port u_ila_0/probe18 [get_nets [list {stcDemod/FD_pll/EffectiveRate_reg_n_1_[3]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe19]
set_property port_width 1 [get_debug_ports u_ila_0/probe19]
connect_debug_port u_ila_0/probe19 [get_nets [list {stcDemod/FD_pll/EffectiveRate_reg_n_1_[4]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe20]
set_property port_width 1 [get_debug_ports u_ila_0/probe20]
connect_debug_port u_ila_0/probe20 [get_nets [list {stcDemod/FD_pll/EffectiveRate_reg_n_1_[5]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe21]
set_property port_width 1 [get_debug_ports u_ila_0/probe21]
connect_debug_port u_ila_0/probe21 [get_nets [list {stcDemod/FD_pll/EffectiveRate_reg_n_1_[6]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe22]
set_property port_width 1 [get_debug_ports u_ila_0/probe22]
connect_debug_port u_ila_0/probe22 [get_nets [list {stcDemod/FD_pll/EffectiveRate_reg_n_1_[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe23]
set_property port_width 1 [get_debug_ports u_ila_0/probe23]
connect_debug_port u_ila_0/probe23 [get_nets [list {stcDemod/FD_pll/EffectiveRate_reg_n_1_[8]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe24]
set_property port_width 1 [get_debug_ports u_ila_0/probe24]
connect_debug_port u_ila_0/probe24 [get_nets [list {stcDemod/FD_pll/EffectiveRate_reg_n_1_[9]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe25]
set_property port_width 1 [get_debug_ports u_ila_0/probe25]
connect_debug_port u_ila_0/probe25 [get_nets [list {stcDemod/FD_pll/EffectiveRate_reg_n_1_[10]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe26]
set_property port_width 1 [get_debug_ports u_ila_0/probe26]
connect_debug_port u_ila_0/probe26 [get_nets [list {stcDemod/FD_pll/EffectiveRate_reg_n_1_[11]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe27]
set_property port_width 1 [get_debug_ports u_ila_0/probe27]
connect_debug_port u_ila_0/probe27 [get_nets [list {stcDemod/FD_pll/EffectiveRate_reg_n_1_[12]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe28]
set_property port_width 1 [get_debug_ports u_ila_0/probe28]
connect_debug_port u_ila_0/probe28 [get_nets [list stcDemod/FD_pll/AccumMsb]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe29]
set_property port_width 1 [get_debug_ports u_ila_0/probe29]
connect_debug_port u_ila_0/probe29 [get_nets [list stcDemod/FD_LF/empty]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe30]
set_property port_width 1 [get_debug_ports u_ila_0/probe30]
connect_debug_port u_ila_0/probe30 [get_nets [list stcDemod/FD_LF/full]]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets dac1_clk_OBUF]
