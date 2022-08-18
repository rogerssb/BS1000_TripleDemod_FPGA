

create_debug_core u_ila_0 ila
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_0]
set_property ALL_PROBE_SAME_MU_CNT 4 [get_debug_cores u_ila_0]
set_property C_ADV_TRIGGER true [get_debug_cores u_ila_0]
set_property C_DATA_DEPTH 4096 [get_debug_cores u_ila_0]
set_property C_EN_STRG_QUAL true [get_debug_cores u_ila_0]
set_property C_INPUT_PIPE_STAGES 1 [get_debug_cores u_ila_0]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_0]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_0]
set_property port_width 1 [get_debug_ports u_ila_0/clk]
connect_debug_port u_ila_0/clk [get_nets [list systemClock/inst/clk_out1]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe0]
set_property port_width 18 [get_debug_ports u_ila_0/probe0]
connect_debug_port u_ila_0/probe0 [get_nets [list {Combiner/Real1Out[0]} {Combiner/Real1Out[1]} {Combiner/Real1Out[2]} {Combiner/Real1Out[3]} {Combiner/Real1Out[4]} {Combiner/Real1Out[5]} {Combiner/Real1Out[6]} {Combiner/Real1Out[7]} {Combiner/Real1Out[8]} {Combiner/Real1Out[9]} {Combiner/Real1Out[10]} {Combiner/Real1Out[11]} {Combiner/Real1Out[12]} {Combiner/Real1Out[13]} {Combiner/Real1Out[14]} {Combiner/Real1Out[15]} {Combiner/Real1Out[16]} {Combiner/Real1Out[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe1]
set_property port_width 8 [get_debug_ports u_ila_0/probe1]
connect_debug_port u_ila_0/probe1 [get_nets [list {Combiner/DataOut23[0]} {Combiner/DataOut23[1]} {Combiner/DataOut23[2]} {Combiner/DataOut23[3]} {Combiner/DataOut23[4]} {Combiner/DataOut23[5]} {Combiner/DataOut23[6]} {Combiner/DataOut23[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe2]
set_property port_width 18 [get_debug_ports u_ila_0/probe2]
connect_debug_port u_ila_0/probe2 [get_nets [list {Combiner/Real2Out[0]} {Combiner/Real2Out[1]} {Combiner/Real2Out[2]} {Combiner/Real2Out[3]} {Combiner/Real2Out[4]} {Combiner/Real2Out[5]} {Combiner/Real2Out[6]} {Combiner/Real2Out[7]} {Combiner/Real2Out[8]} {Combiner/Real2Out[9]} {Combiner/Real2Out[10]} {Combiner/Real2Out[11]} {Combiner/Real2Out[12]} {Combiner/Real2Out[13]} {Combiner/Real2Out[14]} {Combiner/Real2Out[15]} {Combiner/Real2Out[16]} {Combiner/Real2Out[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe3]
set_property port_width 8 [get_debug_ports u_ila_0/probe3]
connect_debug_port u_ila_0/probe3 [get_nets [list {Combiner/DataOut13[0]} {Combiner/DataOut13[1]} {Combiner/DataOut13[2]} {Combiner/DataOut13[3]} {Combiner/DataOut13[4]} {Combiner/DataOut13[5]} {Combiner/DataOut13[6]} {Combiner/DataOut13[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe4]
set_property port_width 18 [get_debug_ports u_ila_0/probe4]
connect_debug_port u_ila_0/probe4 [get_nets [list {Combiner/imagout[0]} {Combiner/imagout[1]} {Combiner/imagout[2]} {Combiner/imagout[3]} {Combiner/imagout[4]} {Combiner/imagout[5]} {Combiner/imagout[6]} {Combiner/imagout[7]} {Combiner/imagout[8]} {Combiner/imagout[9]} {Combiner/imagout[10]} {Combiner/imagout[11]} {Combiner/imagout[12]} {Combiner/imagout[13]} {Combiner/imagout[14]} {Combiner/imagout[15]} {Combiner/imagout[16]} {Combiner/imagout[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe5]
set_property port_width 18 [get_debug_ports u_ila_0/probe5]
connect_debug_port u_ila_0/probe5 [get_nets [list {Combiner/Ch2Adc17[0]} {Combiner/Ch2Adc17[1]} {Combiner/Ch2Adc17[2]} {Combiner/Ch2Adc17[3]} {Combiner/Ch2Adc17[4]} {Combiner/Ch2Adc17[5]} {Combiner/Ch2Adc17[6]} {Combiner/Ch2Adc17[7]} {Combiner/Ch2Adc17[8]} {Combiner/Ch2Adc17[9]} {Combiner/Ch2Adc17[10]} {Combiner/Ch2Adc17[11]} {Combiner/Ch2Adc17[12]} {Combiner/Ch2Adc17[13]} {Combiner/Ch2Adc17[14]} {Combiner/Ch2Adc17[15]} {Combiner/Ch2Adc17[16]} {Combiner/Ch2Adc17[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe6]
set_property port_width 18 [get_debug_ports u_ila_0/probe6]
connect_debug_port u_ila_0/probe6 [get_nets [list {Combiner/Ch1Adc17[0]} {Combiner/Ch1Adc17[1]} {Combiner/Ch1Adc17[2]} {Combiner/Ch1Adc17[3]} {Combiner/Ch1Adc17[4]} {Combiner/Ch1Adc17[5]} {Combiner/Ch1Adc17[6]} {Combiner/Ch1Adc17[7]} {Combiner/Ch1Adc17[8]} {Combiner/Ch1Adc17[9]} {Combiner/Ch1Adc17[10]} {Combiner/Ch1Adc17[11]} {Combiner/Ch1Adc17[12]} {Combiner/Ch1Adc17[13]} {Combiner/Ch1Adc17[14]} {Combiner/Ch1Adc17[15]} {Combiner/Ch1Adc17[16]} {Combiner/Ch1Adc17[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe7]
set_property port_width 8 [get_debug_ports u_ila_0/probe7]
connect_debug_port u_ila_0/probe7 [get_nets [list {Combiner/DataOut10[0]} {Combiner/DataOut10[1]} {Combiner/DataOut10[2]} {Combiner/DataOut10[3]} {Combiner/DataOut10[4]} {Combiner/DataOut10[5]} {Combiner/DataOut10[6]} {Combiner/DataOut10[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe8]
set_property port_width 18 [get_debug_ports u_ila_0/probe8]
connect_debug_port u_ila_0/probe8 [get_nets [list {Combiner/Imag2Out[0]} {Combiner/Imag2Out[1]} {Combiner/Imag2Out[2]} {Combiner/Imag2Out[3]} {Combiner/Imag2Out[4]} {Combiner/Imag2Out[5]} {Combiner/Imag2Out[6]} {Combiner/Imag2Out[7]} {Combiner/Imag2Out[8]} {Combiner/Imag2Out[9]} {Combiner/Imag2Out[10]} {Combiner/Imag2Out[11]} {Combiner/Imag2Out[12]} {Combiner/Imag2Out[13]} {Combiner/Imag2Out[14]} {Combiner/Imag2Out[15]} {Combiner/Imag2Out[16]} {Combiner/Imag2Out[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe9]
set_property port_width 8 [get_debug_ports u_ila_0/probe9]
connect_debug_port u_ila_0/probe9 [get_nets [list {Combiner/DataOut24[0]} {Combiner/DataOut24[1]} {Combiner/DataOut24[2]} {Combiner/DataOut24[3]} {Combiner/DataOut24[4]} {Combiner/DataOut24[5]} {Combiner/DataOut24[6]} {Combiner/DataOut24[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe10]
set_property port_width 8 [get_debug_ports u_ila_0/probe10]
connect_debug_port u_ila_0/probe10 [get_nets [list {Combiner/DataOut12[0]} {Combiner/DataOut12[1]} {Combiner/DataOut12[2]} {Combiner/DataOut12[3]} {Combiner/DataOut12[4]} {Combiner/DataOut12[5]} {Combiner/DataOut12[6]} {Combiner/DataOut12[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe11]
set_property port_width 12 [get_debug_ports u_ila_0/probe11]
connect_debug_port u_ila_0/probe11 [get_nets [list {Combiner/Ch1Agc[0]} {Combiner/Ch1Agc[1]} {Combiner/Ch1Agc[2]} {Combiner/Ch1Agc[3]} {Combiner/Ch1Agc[4]} {Combiner/Ch1Agc[5]} {Combiner/Ch1Agc[6]} {Combiner/Ch1Agc[7]} {Combiner/Ch1Agc[8]} {Combiner/Ch1Agc[9]} {Combiner/Ch1Agc[10]} {Combiner/Ch1Agc[11]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe12]
set_property port_width 12 [get_debug_ports u_ila_0/probe12]
connect_debug_port u_ila_0/probe12 [get_nets [list {Combiner/Ch2Agc[0]} {Combiner/Ch2Agc[1]} {Combiner/Ch2Agc[2]} {Combiner/Ch2Agc[3]} {Combiner/Ch2Agc[4]} {Combiner/Ch2Agc[5]} {Combiner/Ch2Agc[6]} {Combiner/Ch2Agc[7]} {Combiner/Ch2Agc[8]} {Combiner/Ch2Agc[9]} {Combiner/Ch2Agc[10]} {Combiner/Ch2Agc[11]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe13]
set_property port_width 8 [get_debug_ports u_ila_0/probe13]
connect_debug_port u_ila_0/probe13 [get_nets [list {Combiner/DataOut20[0]} {Combiner/DataOut20[1]} {Combiner/DataOut20[2]} {Combiner/DataOut20[3]} {Combiner/DataOut20[4]} {Combiner/DataOut20[5]} {Combiner/DataOut20[6]} {Combiner/DataOut20[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe14]
set_property port_width 18 [get_debug_ports u_ila_0/probe14]
connect_debug_port u_ila_0/probe14 [get_nets [list {Combiner/realout[0]} {Combiner/realout[1]} {Combiner/realout[2]} {Combiner/realout[3]} {Combiner/realout[4]} {Combiner/realout[5]} {Combiner/realout[6]} {Combiner/realout[7]} {Combiner/realout[8]} {Combiner/realout[9]} {Combiner/realout[10]} {Combiner/realout[11]} {Combiner/realout[12]} {Combiner/realout[13]} {Combiner/realout[14]} {Combiner/realout[15]} {Combiner/realout[16]} {Combiner/realout[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe15]
set_property port_width 8 [get_debug_ports u_ila_0/probe15]
connect_debug_port u_ila_0/probe15 [get_nets [list {Combiner/DataOut14[0]} {Combiner/DataOut14[1]} {Combiner/DataOut14[2]} {Combiner/DataOut14[3]} {Combiner/DataOut14[4]} {Combiner/DataOut14[5]} {Combiner/DataOut14[6]} {Combiner/DataOut14[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe16]
set_property port_width 8 [get_debug_ports u_ila_0/probe16]
connect_debug_port u_ila_0/probe16 [get_nets [list {Combiner/Index[0]} {Combiner/Index[1]} {Combiner/Index[2]} {Combiner/Index[3]} {Combiner/Index[4]} {Combiner/Index[5]} {Combiner/Index[6]} {Combiner/Index[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe17]
set_property port_width 18 [get_debug_ports u_ila_0/probe17]
connect_debug_port u_ila_0/probe17 [get_nets [list {Combiner/Ch2Imag[0]} {Combiner/Ch2Imag[1]} {Combiner/Ch2Imag[2]} {Combiner/Ch2Imag[3]} {Combiner/Ch2Imag[4]} {Combiner/Ch2Imag[5]} {Combiner/Ch2Imag[6]} {Combiner/Ch2Imag[7]} {Combiner/Ch2Imag[8]} {Combiner/Ch2Imag[9]} {Combiner/Ch2Imag[10]} {Combiner/Ch2Imag[11]} {Combiner/Ch2Imag[12]} {Combiner/Ch2Imag[13]} {Combiner/Ch2Imag[14]} {Combiner/Ch2Imag[15]} {Combiner/Ch2Imag[16]} {Combiner/Ch2Imag[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe18]
set_property port_width 18 [get_debug_ports u_ila_0/probe18]
connect_debug_port u_ila_0/probe18 [get_nets [list {Combiner/Ch1Imag[0]} {Combiner/Ch1Imag[1]} {Combiner/Ch1Imag[2]} {Combiner/Ch1Imag[3]} {Combiner/Ch1Imag[4]} {Combiner/Ch1Imag[5]} {Combiner/Ch1Imag[6]} {Combiner/Ch1Imag[7]} {Combiner/Ch1Imag[8]} {Combiner/Ch1Imag[9]} {Combiner/Ch1Imag[10]} {Combiner/Ch1Imag[11]} {Combiner/Ch1Imag[12]} {Combiner/Ch1Imag[13]} {Combiner/Ch1Imag[14]} {Combiner/Ch1Imag[15]} {Combiner/Ch1Imag[16]} {Combiner/Ch1Imag[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe19]
set_property port_width 8 [get_debug_ports u_ila_0/probe19]
connect_debug_port u_ila_0/probe19 [get_nets [list {Combiner/DataOut22[0]} {Combiner/DataOut22[1]} {Combiner/DataOut22[2]} {Combiner/DataOut22[3]} {Combiner/DataOut22[4]} {Combiner/DataOut22[5]} {Combiner/DataOut22[6]} {Combiner/DataOut22[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe20]
set_property port_width 18 [get_debug_ports u_ila_0/probe20]
connect_debug_port u_ila_0/probe20 [get_nets [list {Combiner/Ch2Real[0]} {Combiner/Ch2Real[1]} {Combiner/Ch2Real[2]} {Combiner/Ch2Real[3]} {Combiner/Ch2Real[4]} {Combiner/Ch2Real[5]} {Combiner/Ch2Real[6]} {Combiner/Ch2Real[7]} {Combiner/Ch2Real[8]} {Combiner/Ch2Real[9]} {Combiner/Ch2Real[10]} {Combiner/Ch2Real[11]} {Combiner/Ch2Real[12]} {Combiner/Ch2Real[13]} {Combiner/Ch2Real[14]} {Combiner/Ch2Real[15]} {Combiner/Ch2Real[16]} {Combiner/Ch2Real[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe21]
set_property port_width 8 [get_debug_ports u_ila_0/probe21]
connect_debug_port u_ila_0/probe21 [get_nets [list {Combiner/DataOut21[0]} {Combiner/DataOut21[1]} {Combiner/DataOut21[2]} {Combiner/DataOut21[3]} {Combiner/DataOut21[4]} {Combiner/DataOut21[5]} {Combiner/DataOut21[6]} {Combiner/DataOut21[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe22]
set_property port_width 8 [get_debug_ports u_ila_0/probe22]
connect_debug_port u_ila_0/probe22 [get_nets [list {Combiner/DataOut11[0]} {Combiner/DataOut11[1]} {Combiner/DataOut11[2]} {Combiner/DataOut11[3]} {Combiner/DataOut11[4]} {Combiner/DataOut11[5]} {Combiner/DataOut11[6]} {Combiner/DataOut11[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe23]
set_property port_width 18 [get_debug_ports u_ila_0/probe23]
connect_debug_port u_ila_0/probe23 [get_nets [list {Combiner/Imag1Out[0]} {Combiner/Imag1Out[1]} {Combiner/Imag1Out[2]} {Combiner/Imag1Out[3]} {Combiner/Imag1Out[4]} {Combiner/Imag1Out[5]} {Combiner/Imag1Out[6]} {Combiner/Imag1Out[7]} {Combiner/Imag1Out[8]} {Combiner/Imag1Out[9]} {Combiner/Imag1Out[10]} {Combiner/Imag1Out[11]} {Combiner/Imag1Out[12]} {Combiner/Imag1Out[13]} {Combiner/Imag1Out[14]} {Combiner/Imag1Out[15]} {Combiner/Imag1Out[16]} {Combiner/Imag1Out[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe24]
set_property port_width 18 [get_debug_ports u_ila_0/probe24]
connect_debug_port u_ila_0/probe24 [get_nets [list {Combiner/Ch1Real[0]} {Combiner/Ch1Real[1]} {Combiner/Ch1Real[2]} {Combiner/Ch1Real[3]} {Combiner/Ch1Real[4]} {Combiner/Ch1Real[5]} {Combiner/Ch1Real[6]} {Combiner/Ch1Real[7]} {Combiner/Ch1Real[8]} {Combiner/Ch1Real[9]} {Combiner/Ch1Real[10]} {Combiner/Ch1Real[11]} {Combiner/Ch1Real[12]} {Combiner/Ch1Real[13]} {Combiner/Ch1Real[14]} {Combiner/Ch1Real[15]} {Combiner/Ch1Real[16]} {Combiner/Ch1Real[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe25]
set_property port_width 8 [get_debug_ports u_ila_0/probe25]
connect_debug_port u_ila_0/probe25 [get_nets [list {Combiner/IF_Align_u/IndexAbs[0]} {Combiner/IF_Align_u/IndexAbs[1]} {Combiner/IF_Align_u/IndexAbs[2]} {Combiner/IF_Align_u/IndexAbs[3]} {Combiner/IF_Align_u/IndexAbs[4]} {Combiner/IF_Align_u/IndexAbs[5]} {Combiner/IF_Align_u/IndexAbs[6]} {Combiner/IF_Align_u/IndexAbs[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe26]
set_property port_width 2 [get_debug_ports u_ila_0/probe26]
connect_debug_port u_ila_0/probe26 [get_nets [list {Combiner/IF_Align_u/SkipFirst2[0]} {Combiner/IF_Align_u/SkipFirst2[1]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe27]
set_property port_width 8 [get_debug_ports u_ila_0/probe27]
connect_debug_port u_ila_0/probe27 [get_nets [list {Combiner/IF_Align_u/Index[0]} {Combiner/IF_Align_u/Index[1]} {Combiner/IF_Align_u/Index[2]} {Combiner/IF_Align_u/Index[3]} {Combiner/IF_Align_u/Index[4]} {Combiner/IF_Align_u/Index[5]} {Combiner/IF_Align_u/Index[6]} {Combiner/IF_Align_u/Index[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe28]
set_property port_width 18 [get_debug_ports u_ila_0/probe28]
connect_debug_port u_ila_0/probe28 [get_nets [list {Combiner/IF_Align_u/IF_Diff[0]} {Combiner/IF_Align_u/IF_Diff[1]} {Combiner/IF_Align_u/IF_Diff[2]} {Combiner/IF_Align_u/IF_Diff[3]} {Combiner/IF_Align_u/IF_Diff[4]} {Combiner/IF_Align_u/IF_Diff[5]} {Combiner/IF_Align_u/IF_Diff[6]} {Combiner/IF_Align_u/IF_Diff[7]} {Combiner/IF_Align_u/IF_Diff[8]} {Combiner/IF_Align_u/IF_Diff[9]} {Combiner/IF_Align_u/IF_Diff[10]} {Combiner/IF_Align_u/IF_Diff[11]} {Combiner/IF_Align_u/IF_Diff[12]} {Combiner/IF_Align_u/IF_Diff[13]} {Combiner/IF_Align_u/IF_Diff[14]} {Combiner/IF_Align_u/IF_Diff[15]} {Combiner/IF_Align_u/IF_Diff[16]} {Combiner/IF_Align_u/IF_Diff[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe29]
set_property port_width 1 [get_debug_ports u_ila_0/probe29]
connect_debug_port u_ila_0/probe29 [get_nets [list Combiner/IF_Align_u/Restart]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe30]
set_property port_width 1 [get_debug_ports u_ila_0/probe30]
connect_debug_port u_ila_0/probe30 [get_nets [list Combiner/IF_Align_u/ValidOut__0]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe31]
set_property port_width 1 [get_debug_ports u_ila_0/probe31]
connect_debug_port u_ila_0/probe31 [get_nets [list Combiner/IF_Align_u/ValidOverAdd]]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets clk]
