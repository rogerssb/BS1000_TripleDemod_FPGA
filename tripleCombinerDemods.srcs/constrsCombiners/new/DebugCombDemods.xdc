



set_property MARK_DEBUG true [get_nets {viterbi/berCount[11]}]
set_property MARK_DEBUG true [get_nets {viterbi/berCount[5]}]
set_property MARK_DEBUG true [get_nets {viterbi/berCount[13]}]
set_property MARK_DEBUG true [get_nets {RS_Dec/ASM_Data[4]}]
set_property MARK_DEBUG true [get_nets {viterbi/ch0BerCount[0]}]
set_property MARK_DEBUG true [get_nets {viterbi/ch0BerCount[1]}]
set_property MARK_DEBUG true [get_nets {viterbi/ch0BerCount[5]}]
set_property MARK_DEBUG true [get_nets {RS_Dec/ASM_Data[0]}]
set_property MARK_DEBUG true [get_nets {RS_Dec/ASM_Data[3]}]
set_property MARK_DEBUG true [get_nets {RS_Dec/ASM_Data[5]}]
set_property MARK_DEBUG true [get_nets {viterbi/ch0BerCount[14]}]
set_property MARK_DEBUG true [get_nets {viterbi/ch0BerCount[7]}]
set_property MARK_DEBUG true [get_nets {viterbi/ch0BerCount[10]}]
set_property MARK_DEBUG true [get_nets {RS_Dec/ASM_Data[7]}]
set_property MARK_DEBUG true [get_nets {RS_Dec/ASM_Data[1]}]
set_property MARK_DEBUG true [get_nets {viterbi/ch0BerCount[2]}]
set_property MARK_DEBUG true [get_nets {RS_Dec/ASM_Data[2]}]
set_property MARK_DEBUG true [get_nets {RS_Dec/ASM_Data[6]}]
set_property MARK_DEBUG true [get_nets {viterbi/berCount[10]}]
set_property MARK_DEBUG true [get_nets {viterbi/berCount[7]}]
set_property MARK_DEBUG true [get_nets {viterbi/berCount[14]}]
set_property MARK_DEBUG true [get_nets {viterbi/berCount[2]}]
set_property MARK_DEBUG true [get_nets {viterbi/ch0BerCount[13]}]
set_property MARK_DEBUG true [get_nets {viterbi/ch0BerCount[4]}]
set_property MARK_DEBUG true [get_nets {viterbi/berCount[3]}]
set_property MARK_DEBUG true [get_nets {viterbi/berCount[0]}]
set_property MARK_DEBUG true [get_nets {viterbi/berCount[12]}]
set_property MARK_DEBUG true [get_nets {viterbi/berCount[15]}]
set_property MARK_DEBUG true [get_nets {viterbi/berCount[1]}]
set_property MARK_DEBUG true [get_nets {viterbi/berCount[4]}]
set_property MARK_DEBUG true [get_nets {viterbi/berCount[6]}]
set_property MARK_DEBUG true [get_nets {viterbi/berCount[8]}]
set_property MARK_DEBUG true [get_nets {viterbi/berCount[9]}]
set_property MARK_DEBUG true [get_nets {viterbi/ch0BerCount[11]}]
set_property MARK_DEBUG true [get_nets {viterbi/ch0BerCount[12]}]
set_property MARK_DEBUG true [get_nets {viterbi/ch0BerCount[15]}]
set_property MARK_DEBUG true [get_nets {viterbi/ch0BerCount[3]}]
set_property MARK_DEBUG true [get_nets {viterbi/ch0BerCount[6]}]
set_property MARK_DEBUG true [get_nets {viterbi/ch0BerCount[8]}]
set_property MARK_DEBUG true [get_nets {viterbi/ch0BerCount[9]}]
set_property MARK_DEBUG false [get_nets {Combiner/Index[4]}]
set_property MARK_DEBUG false [get_nets {Combiner/Index[3]}]
set_property MARK_DEBUG false [get_nets {Combiner/Index[2]}]
set_property MARK_DEBUG false [get_nets {Combiner/Index[5]}]
set_property MARK_DEBUG false [get_nets {Combiner/Index[0]}]
set_property MARK_DEBUG false [get_nets {Combiner/Index[1]}]
set_property MARK_DEBUG false [get_nets {Combiner/Index[6]}]
set_property MARK_DEBUG false [get_nets {Combiner/Index[7]}]

connect_debug_port u_ila_0/probe42 [get_nets [list Combiner/reset3_out]]

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
connect_debug_port u_ila_0/clk [get_nets [list systemClock/inst/clk1x]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe0]
set_property port_width 18 [get_debug_ports u_ila_0/probe0]
connect_debug_port u_ila_0/probe0 [get_nets [list {Combiner/Ch1Real[0]} {Combiner/Ch1Real[1]} {Combiner/Ch1Real[2]} {Combiner/Ch1Real[3]} {Combiner/Ch1Real[4]} {Combiner/Ch1Real[5]} {Combiner/Ch1Real[6]} {Combiner/Ch1Real[7]} {Combiner/Ch1Real[8]} {Combiner/Ch1Real[9]} {Combiner/Ch1Real[10]} {Combiner/Ch1Real[11]} {Combiner/Ch1Real[12]} {Combiner/Ch1Real[13]} {Combiner/Ch1Real[14]} {Combiner/Ch1Real[15]} {Combiner/Ch1Real[16]} {Combiner/Ch1Real[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe1]
set_property port_width 18 [get_debug_ports u_ila_0/probe1]
connect_debug_port u_ila_0/probe1 [get_nets [list {Combiner/Ch1Adc17[0]} {Combiner/Ch1Adc17[1]} {Combiner/Ch1Adc17[2]} {Combiner/Ch1Adc17[3]} {Combiner/Ch1Adc17[4]} {Combiner/Ch1Adc17[5]} {Combiner/Ch1Adc17[6]} {Combiner/Ch1Adc17[7]} {Combiner/Ch1Adc17[8]} {Combiner/Ch1Adc17[9]} {Combiner/Ch1Adc17[10]} {Combiner/Ch1Adc17[11]} {Combiner/Ch1Adc17[12]} {Combiner/Ch1Adc17[13]} {Combiner/Ch1Adc17[14]} {Combiner/Ch1Adc17[15]} {Combiner/Ch1Adc17[16]} {Combiner/Ch1Adc17[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe2]
set_property port_width 13 [get_debug_ports u_ila_0/probe2]
connect_debug_port u_ila_0/probe2 [get_nets [list {Combiner/imaglock[0]} {Combiner/imaglock[1]} {Combiner/imaglock[2]} {Combiner/imaglock[3]} {Combiner/imaglock[4]} {Combiner/imaglock[5]} {Combiner/imaglock[6]} {Combiner/imaglock[7]} {Combiner/imaglock[8]} {Combiner/imaglock[9]} {Combiner/imaglock[10]} {Combiner/imaglock[11]} {Combiner/imaglock[12]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe3]
set_property port_width 13 [get_debug_ports u_ila_0/probe3]
connect_debug_port u_ila_0/probe3 [get_nets [list {Combiner/reallock[0]} {Combiner/reallock[1]} {Combiner/reallock[2]} {Combiner/reallock[3]} {Combiner/reallock[4]} {Combiner/reallock[5]} {Combiner/reallock[6]} {Combiner/reallock[7]} {Combiner/reallock[8]} {Combiner/reallock[9]} {Combiner/reallock[10]} {Combiner/reallock[11]} {Combiner/reallock[12]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe4]
set_property port_width 18 [get_debug_ports u_ila_0/probe4]
connect_debug_port u_ila_0/probe4 [get_nets [list {Combiner/realout[0]} {Combiner/realout[1]} {Combiner/realout[2]} {Combiner/realout[3]} {Combiner/realout[4]} {Combiner/realout[5]} {Combiner/realout[6]} {Combiner/realout[7]} {Combiner/realout[8]} {Combiner/realout[9]} {Combiner/realout[10]} {Combiner/realout[11]} {Combiner/realout[12]} {Combiner/realout[13]} {Combiner/realout[14]} {Combiner/realout[15]} {Combiner/realout[16]} {Combiner/realout[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe5]
set_property port_width 18 [get_debug_ports u_ila_0/probe5]
connect_debug_port u_ila_0/probe5 [get_nets [list {Combiner/imagout[0]} {Combiner/imagout[1]} {Combiner/imagout[2]} {Combiner/imagout[3]} {Combiner/imagout[4]} {Combiner/imagout[5]} {Combiner/imagout[6]} {Combiner/imagout[7]} {Combiner/imagout[8]} {Combiner/imagout[9]} {Combiner/imagout[10]} {Combiner/imagout[11]} {Combiner/imagout[12]} {Combiner/imagout[13]} {Combiner/imagout[14]} {Combiner/imagout[15]} {Combiner/imagout[16]} {Combiner/imagout[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe6]
set_property port_width 10 [get_debug_ports u_ila_0/probe6]
connect_debug_port u_ila_0/probe6 [get_nets [list {Combiner/gainoutmin[8]} {Combiner/gainoutmin[9]} {Combiner/gainoutmin[10]} {Combiner/gainoutmin[11]} {Combiner/gainoutmin[12]} {Combiner/gainoutmin[13]} {Combiner/gainoutmin[14]} {Combiner/gainoutmin[15]} {Combiner/gainoutmin[16]} {Combiner/gainoutmin[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe7]
set_property port_width 36 [get_debug_ports u_ila_0/probe7]
connect_debug_port u_ila_0/probe7 [get_nets [list {Combiner/fifoOut[0]} {Combiner/fifoOut[1]} {Combiner/fifoOut[2]} {Combiner/fifoOut[3]} {Combiner/fifoOut[4]} {Combiner/fifoOut[5]} {Combiner/fifoOut[6]} {Combiner/fifoOut[7]} {Combiner/fifoOut[8]} {Combiner/fifoOut[9]} {Combiner/fifoOut[10]} {Combiner/fifoOut[11]} {Combiner/fifoOut[12]} {Combiner/fifoOut[13]} {Combiner/fifoOut[14]} {Combiner/fifoOut[15]} {Combiner/fifoOut[16]} {Combiner/fifoOut[17]} {Combiner/fifoOut[18]} {Combiner/fifoOut[19]} {Combiner/fifoOut[20]} {Combiner/fifoOut[21]} {Combiner/fifoOut[22]} {Combiner/fifoOut[23]} {Combiner/fifoOut[24]} {Combiner/fifoOut[25]} {Combiner/fifoOut[26]} {Combiner/fifoOut[27]} {Combiner/fifoOut[28]} {Combiner/fifoOut[29]} {Combiner/fifoOut[30]} {Combiner/fifoOut[31]} {Combiner/fifoOut[32]} {Combiner/fifoOut[33]} {Combiner/fifoOut[34]} {Combiner/fifoOut[35]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe8]
set_property port_width 36 [get_debug_ports u_ila_0/probe8]
connect_debug_port u_ila_0/probe8 [get_nets [list {Combiner/din[0]} {Combiner/din[1]} {Combiner/din[2]} {Combiner/din[3]} {Combiner/din[4]} {Combiner/din[5]} {Combiner/din[6]} {Combiner/din[7]} {Combiner/din[8]} {Combiner/din[9]} {Combiner/din[10]} {Combiner/din[11]} {Combiner/din[12]} {Combiner/din[13]} {Combiner/din[14]} {Combiner/din[15]} {Combiner/din[16]} {Combiner/din[17]} {Combiner/din[18]} {Combiner/din[19]} {Combiner/din[20]} {Combiner/din[21]} {Combiner/din[22]} {Combiner/din[23]} {Combiner/din[24]} {Combiner/din[25]} {Combiner/din[26]} {Combiner/din[27]} {Combiner/din[28]} {Combiner/din[29]} {Combiner/din[30]} {Combiner/din[31]} {Combiner/din[32]} {Combiner/din[33]} {Combiner/din[34]} {Combiner/din[35]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe9]
set_property port_width 18 [get_debug_ports u_ila_0/probe9]
connect_debug_port u_ila_0/probe9 [get_nets [list {Combiner/Real2Out[0]} {Combiner/Real2Out[1]} {Combiner/Real2Out[2]} {Combiner/Real2Out[3]} {Combiner/Real2Out[4]} {Combiner/Real2Out[5]} {Combiner/Real2Out[6]} {Combiner/Real2Out[7]} {Combiner/Real2Out[8]} {Combiner/Real2Out[9]} {Combiner/Real2Out[10]} {Combiner/Real2Out[11]} {Combiner/Real2Out[12]} {Combiner/Real2Out[13]} {Combiner/Real2Out[14]} {Combiner/Real2Out[15]} {Combiner/Real2Out[16]} {Combiner/Real2Out[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe10]
set_property port_width 16 [get_debug_ports u_ila_0/probe10]
connect_debug_port u_ila_0/probe10 [get_nets [list {Combiner/db_range[0]} {Combiner/db_range[1]} {Combiner/db_range[2]} {Combiner/db_range[3]} {Combiner/db_range[4]} {Combiner/db_range[5]} {Combiner/db_range[6]} {Combiner/db_range[7]} {Combiner/db_range[8]} {Combiner/db_range[9]} {Combiner/db_range[10]} {Combiner/db_range[11]} {Combiner/db_range[12]} {Combiner/db_range[13]} {Combiner/db_range[14]} {Combiner/db_range[15]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe11]
set_property port_width 18 [get_debug_ports u_ila_0/probe11]
connect_debug_port u_ila_0/probe11 [get_nets [list {Combiner/Real1Out[0]} {Combiner/Real1Out[1]} {Combiner/Real1Out[2]} {Combiner/Real1Out[3]} {Combiner/Real1Out[4]} {Combiner/Real1Out[5]} {Combiner/Real1Out[6]} {Combiner/Real1Out[7]} {Combiner/Real1Out[8]} {Combiner/Real1Out[9]} {Combiner/Real1Out[10]} {Combiner/Real1Out[11]} {Combiner/Real1Out[12]} {Combiner/Real1Out[13]} {Combiner/Real1Out[14]} {Combiner/Real1Out[15]} {Combiner/Real1Out[16]} {Combiner/Real1Out[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe12]
set_property port_width 32 [get_debug_ports u_ila_0/probe12]
connect_debug_port u_ila_0/probe12 [get_nets [list {Combiner/SubSample[0]} {Combiner/SubSample[1]} {Combiner/SubSample[2]} {Combiner/SubSample[3]} {Combiner/SubSample[4]} {Combiner/SubSample[5]} {Combiner/SubSample[6]} {Combiner/SubSample[7]} {Combiner/SubSample[8]} {Combiner/SubSample[9]} {Combiner/SubSample[10]} {Combiner/SubSample[11]} {Combiner/SubSample[12]} {Combiner/SubSample[13]} {Combiner/SubSample[14]} {Combiner/SubSample[15]} {Combiner/SubSample[16]} {Combiner/SubSample[17]} {Combiner/SubSample[18]} {Combiner/SubSample[19]} {Combiner/SubSample[20]} {Combiner/SubSample[21]} {Combiner/SubSample[22]} {Combiner/SubSample[23]} {Combiner/SubSample[24]} {Combiner/SubSample[25]} {Combiner/SubSample[26]} {Combiner/SubSample[27]} {Combiner/SubSample[28]} {Combiner/SubSample[29]} {Combiner/SubSample[30]} {Combiner/SubSample[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe13]
set_property port_width 8 [get_debug_ports u_ila_0/probe13]
connect_debug_port u_ila_0/probe13 [get_nets [list {Combiner/Index[0]} {Combiner/Index[1]} {Combiner/Index[2]} {Combiner/Index[3]} {Combiner/Index[4]} {Combiner/Index[5]} {Combiner/Index[6]} {Combiner/Index[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe14]
set_property port_width 18 [get_debug_ports u_ila_0/probe14]
connect_debug_port u_ila_0/probe14 [get_nets [list {Combiner/Imag2Out[0]} {Combiner/Imag2Out[1]} {Combiner/Imag2Out[2]} {Combiner/Imag2Out[3]} {Combiner/Imag2Out[4]} {Combiner/Imag2Out[5]} {Combiner/Imag2Out[6]} {Combiner/Imag2Out[7]} {Combiner/Imag2Out[8]} {Combiner/Imag2Out[9]} {Combiner/Imag2Out[10]} {Combiner/Imag2Out[11]} {Combiner/Imag2Out[12]} {Combiner/Imag2Out[13]} {Combiner/Imag2Out[14]} {Combiner/Imag2Out[15]} {Combiner/Imag2Out[16]} {Combiner/Imag2Out[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe15]
set_property port_width 18 [get_debug_ports u_ila_0/probe15]
connect_debug_port u_ila_0/probe15 [get_nets [list {Combiner/Imag1Out[0]} {Combiner/Imag1Out[1]} {Combiner/Imag1Out[2]} {Combiner/Imag1Out[3]} {Combiner/Imag1Out[4]} {Combiner/Imag1Out[5]} {Combiner/Imag1Out[6]} {Combiner/Imag1Out[7]} {Combiner/Imag1Out[8]} {Combiner/Imag1Out[9]} {Combiner/Imag1Out[10]} {Combiner/Imag1Out[11]} {Combiner/Imag1Out[12]} {Combiner/Imag1Out[13]} {Combiner/Imag1Out[14]} {Combiner/Imag1Out[15]} {Combiner/Imag1Out[16]} {Combiner/Imag1Out[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe16]
set_property port_width 18 [get_debug_ports u_ila_0/probe16]
connect_debug_port u_ila_0/probe16 [get_nets [list {Combiner/Ch2Real[0]} {Combiner/Ch2Real[1]} {Combiner/Ch2Real[2]} {Combiner/Ch2Real[3]} {Combiner/Ch2Real[4]} {Combiner/Ch2Real[5]} {Combiner/Ch2Real[6]} {Combiner/Ch2Real[7]} {Combiner/Ch2Real[8]} {Combiner/Ch2Real[9]} {Combiner/Ch2Real[10]} {Combiner/Ch2Real[11]} {Combiner/Ch2Real[12]} {Combiner/Ch2Real[13]} {Combiner/Ch2Real[14]} {Combiner/Ch2Real[15]} {Combiner/Ch2Real[16]} {Combiner/Ch2Real[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe17]
set_property port_width 18 [get_debug_ports u_ila_0/probe17]
connect_debug_port u_ila_0/probe17 [get_nets [list {Combiner/Ch2Imag[0]} {Combiner/Ch2Imag[1]} {Combiner/Ch2Imag[2]} {Combiner/Ch2Imag[3]} {Combiner/Ch2Imag[4]} {Combiner/Ch2Imag[5]} {Combiner/Ch2Imag[6]} {Combiner/Ch2Imag[7]} {Combiner/Ch2Imag[8]} {Combiner/Ch2Imag[9]} {Combiner/Ch2Imag[10]} {Combiner/Ch2Imag[11]} {Combiner/Ch2Imag[12]} {Combiner/Ch2Imag[13]} {Combiner/Ch2Imag[14]} {Combiner/Ch2Imag[15]} {Combiner/Ch2Imag[16]} {Combiner/Ch2Imag[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe18]
set_property port_width 18 [get_debug_ports u_ila_0/probe18]
connect_debug_port u_ila_0/probe18 [get_nets [list {Combiner/Ch2Adc17[0]} {Combiner/Ch2Adc17[1]} {Combiner/Ch2Adc17[2]} {Combiner/Ch2Adc17[3]} {Combiner/Ch2Adc17[4]} {Combiner/Ch2Adc17[5]} {Combiner/Ch2Adc17[6]} {Combiner/Ch2Adc17[7]} {Combiner/Ch2Adc17[8]} {Combiner/Ch2Adc17[9]} {Combiner/Ch2Adc17[10]} {Combiner/Ch2Adc17[11]} {Combiner/Ch2Adc17[12]} {Combiner/Ch2Adc17[13]} {Combiner/Ch2Adc17[14]} {Combiner/Ch2Adc17[15]} {Combiner/Ch2Adc17[16]} {Combiner/Ch2Adc17[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe19]
set_property port_width 12 [get_debug_ports u_ila_0/probe19]
connect_debug_port u_ila_0/probe19 [get_nets [list {Combiner/Ch1Agc[0]} {Combiner/Ch1Agc[1]} {Combiner/Ch1Agc[2]} {Combiner/Ch1Agc[3]} {Combiner/Ch1Agc[4]} {Combiner/Ch1Agc[5]} {Combiner/Ch1Agc[6]} {Combiner/Ch1Agc[7]} {Combiner/Ch1Agc[8]} {Combiner/Ch1Agc[9]} {Combiner/Ch1Agc[10]} {Combiner/Ch1Agc[11]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe20]
set_property port_width 12 [get_debug_ports u_ila_0/probe20]
connect_debug_port u_ila_0/probe20 [get_nets [list {Combiner/Ch2Agc[0]} {Combiner/Ch2Agc[1]} {Combiner/Ch2Agc[2]} {Combiner/Ch2Agc[3]} {Combiner/Ch2Agc[4]} {Combiner/Ch2Agc[5]} {Combiner/Ch2Agc[6]} {Combiner/Ch2Agc[7]} {Combiner/Ch2Agc[8]} {Combiner/Ch2Agc[9]} {Combiner/Ch2Agc[10]} {Combiner/Ch2Agc[11]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe21]
set_property port_width 18 [get_debug_ports u_ila_0/probe21]
connect_debug_port u_ila_0/probe21 [get_nets [list {Combiner/Ch1Imag[0]} {Combiner/Ch1Imag[1]} {Combiner/Ch1Imag[2]} {Combiner/Ch1Imag[3]} {Combiner/Ch1Imag[4]} {Combiner/Ch1Imag[5]} {Combiner/Ch1Imag[6]} {Combiner/Ch1Imag[7]} {Combiner/Ch1Imag[8]} {Combiner/Ch1Imag[9]} {Combiner/Ch1Imag[10]} {Combiner/Ch1Imag[11]} {Combiner/Ch1Imag[12]} {Combiner/Ch1Imag[13]} {Combiner/Ch1Imag[14]} {Combiner/Ch1Imag[15]} {Combiner/Ch1Imag[16]} {Combiner/Ch1Imag[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe22]
set_property port_width 13 [get_debug_ports u_ila_0/probe22]
connect_debug_port u_ila_0/probe22 [get_nets [list {Combiner/CmplxPhsDet/U0/complexphasedetector_struct/mux18_y_net[0]} {Combiner/CmplxPhsDet/U0/complexphasedetector_struct/mux18_y_net[1]} {Combiner/CmplxPhsDet/U0/complexphasedetector_struct/mux18_y_net[2]} {Combiner/CmplxPhsDet/U0/complexphasedetector_struct/mux18_y_net[3]} {Combiner/CmplxPhsDet/U0/complexphasedetector_struct/mux18_y_net[4]} {Combiner/CmplxPhsDet/U0/complexphasedetector_struct/mux18_y_net[5]} {Combiner/CmplxPhsDet/U0/complexphasedetector_struct/mux18_y_net[6]} {Combiner/CmplxPhsDet/U0/complexphasedetector_struct/mux18_y_net[7]} {Combiner/CmplxPhsDet/U0/complexphasedetector_struct/mux18_y_net[8]} {Combiner/CmplxPhsDet/U0/complexphasedetector_struct/mux18_y_net[9]} {Combiner/CmplxPhsDet/U0/complexphasedetector_struct/mux18_y_net[11]} {Combiner/CmplxPhsDet/U0/complexphasedetector_struct/mux18_y_net[12]} {Combiner/CmplxPhsDet/U0/complexphasedetector_struct/mux18_y_net[13]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe23]
set_property port_width 18 [get_debug_ports u_ila_0/probe23]
connect_debug_port u_ila_0/probe23 [get_nets [list {Combiner/CmplxPhsDet/U0/complexphasedetector_struct/gainoutmax[0]} {Combiner/CmplxPhsDet/U0/complexphasedetector_struct/gainoutmax[1]} {Combiner/CmplxPhsDet/U0/complexphasedetector_struct/gainoutmax[2]} {Combiner/CmplxPhsDet/U0/complexphasedetector_struct/gainoutmax[3]} {Combiner/CmplxPhsDet/U0/complexphasedetector_struct/gainoutmax[4]} {Combiner/CmplxPhsDet/U0/complexphasedetector_struct/gainoutmax[5]} {Combiner/CmplxPhsDet/U0/complexphasedetector_struct/gainoutmax[6]} {Combiner/CmplxPhsDet/U0/complexphasedetector_struct/gainoutmax[7]} {Combiner/CmplxPhsDet/U0/complexphasedetector_struct/gainoutmax[8]} {Combiner/CmplxPhsDet/U0/complexphasedetector_struct/gainoutmax[9]} {Combiner/CmplxPhsDet/U0/complexphasedetector_struct/gainoutmax[10]} {Combiner/CmplxPhsDet/U0/complexphasedetector_struct/gainoutmax[11]} {Combiner/CmplxPhsDet/U0/complexphasedetector_struct/gainoutmax[12]} {Combiner/CmplxPhsDet/U0/complexphasedetector_struct/gainoutmax[13]} {Combiner/CmplxPhsDet/U0/complexphasedetector_struct/gainoutmax[14]} {Combiner/CmplxPhsDet/U0/complexphasedetector_struct/gainoutmax[15]} {Combiner/CmplxPhsDet/U0/complexphasedetector_struct/gainoutmax[16]} {Combiner/CmplxPhsDet/U0/complexphasedetector_struct/gainoutmax[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe24]
set_property port_width 13 [get_debug_ports u_ila_0/probe24]
connect_debug_port u_ila_0/probe24 [get_nets [list {Combiner/CmplxPhsDet/U0/ch1agc[0]} {Combiner/CmplxPhsDet/U0/ch1agc[1]} {Combiner/CmplxPhsDet/U0/ch1agc[2]} {Combiner/CmplxPhsDet/U0/ch1agc[3]} {Combiner/CmplxPhsDet/U0/ch1agc[4]} {Combiner/CmplxPhsDet/U0/ch1agc[5]} {Combiner/CmplxPhsDet/U0/ch1agc[6]} {Combiner/CmplxPhsDet/U0/ch1agc[7]} {Combiner/CmplxPhsDet/U0/ch1agc[8]} {Combiner/CmplxPhsDet/U0/ch1agc[9]} {Combiner/CmplxPhsDet/U0/ch1agc[10]} {Combiner/CmplxPhsDet/U0/ch1agc[11]} {Combiner/CmplxPhsDet/U0/ch1agc[12]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe25]
set_property port_width 13 [get_debug_ports u_ila_0/probe25]
connect_debug_port u_ila_0/probe25 [get_nets [list {Combiner/CmplxPhsDet/U0/ch2agc[0]} {Combiner/CmplxPhsDet/U0/ch2agc[1]} {Combiner/CmplxPhsDet/U0/ch2agc[2]} {Combiner/CmplxPhsDet/U0/ch2agc[3]} {Combiner/CmplxPhsDet/U0/ch2agc[4]} {Combiner/CmplxPhsDet/U0/ch2agc[5]} {Combiner/CmplxPhsDet/U0/ch2agc[6]} {Combiner/CmplxPhsDet/U0/ch2agc[7]} {Combiner/CmplxPhsDet/U0/ch2agc[8]} {Combiner/CmplxPhsDet/U0/ch2agc[9]} {Combiner/CmplxPhsDet/U0/ch2agc[10]} {Combiner/CmplxPhsDet/U0/ch2agc[11]} {Combiner/CmplxPhsDet/U0/ch2agc[12]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe26]
set_property port_width 18 [get_debug_ports u_ila_0/probe26]
connect_debug_port u_ila_0/probe26 [get_nets [list {Combiner/CmplxPhsDet/U0/complexphasedetector_struct/oneminusslave_s_net[0]} {Combiner/CmplxPhsDet/U0/complexphasedetector_struct/oneminusslave_s_net[1]} {Combiner/CmplxPhsDet/U0/complexphasedetector_struct/oneminusslave_s_net[2]} {Combiner/CmplxPhsDet/U0/complexphasedetector_struct/oneminusslave_s_net[3]} {Combiner/CmplxPhsDet/U0/complexphasedetector_struct/oneminusslave_s_net[4]} {Combiner/CmplxPhsDet/U0/complexphasedetector_struct/oneminusslave_s_net[5]} {Combiner/CmplxPhsDet/U0/complexphasedetector_struct/oneminusslave_s_net[6]} {Combiner/CmplxPhsDet/U0/complexphasedetector_struct/oneminusslave_s_net[7]} {Combiner/CmplxPhsDet/U0/complexphasedetector_struct/oneminusslave_s_net[8]} {Combiner/CmplxPhsDet/U0/complexphasedetector_struct/oneminusslave_s_net[9]} {Combiner/CmplxPhsDet/U0/complexphasedetector_struct/oneminusslave_s_net[10]} {Combiner/CmplxPhsDet/U0/complexphasedetector_struct/oneminusslave_s_net[11]} {Combiner/CmplxPhsDet/U0/complexphasedetector_struct/oneminusslave_s_net[12]} {Combiner/CmplxPhsDet/U0/complexphasedetector_struct/oneminusslave_s_net[13]} {Combiner/CmplxPhsDet/U0/complexphasedetector_struct/oneminusslave_s_net[14]} {Combiner/CmplxPhsDet/U0/complexphasedetector_struct/oneminusslave_s_net[15]} {Combiner/CmplxPhsDet/U0/complexphasedetector_struct/oneminusslave_s_net[16]} {Combiner/CmplxPhsDet/U0/complexphasedetector_struct/oneminusslave_s_net[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe27]
set_property port_width 18 [get_debug_ports u_ila_0/probe27]
connect_debug_port u_ila_0/probe27 [get_nets [list {Combiner/CmplxPhsDet/U0/complexphasedetector_struct/neverzero_y_net[0]} {Combiner/CmplxPhsDet/U0/complexphasedetector_struct/neverzero_y_net[1]} {Combiner/CmplxPhsDet/U0/complexphasedetector_struct/neverzero_y_net[2]} {Combiner/CmplxPhsDet/U0/complexphasedetector_struct/neverzero_y_net[3]} {Combiner/CmplxPhsDet/U0/complexphasedetector_struct/neverzero_y_net[4]} {Combiner/CmplxPhsDet/U0/complexphasedetector_struct/neverzero_y_net[5]} {Combiner/CmplxPhsDet/U0/complexphasedetector_struct/neverzero_y_net[6]} {Combiner/CmplxPhsDet/U0/complexphasedetector_struct/neverzero_y_net[7]} {Combiner/CmplxPhsDet/U0/complexphasedetector_struct/neverzero_y_net[8]} {Combiner/CmplxPhsDet/U0/complexphasedetector_struct/neverzero_y_net[9]} {Combiner/CmplxPhsDet/U0/complexphasedetector_struct/neverzero_y_net[10]} {Combiner/CmplxPhsDet/U0/complexphasedetector_struct/neverzero_y_net[11]} {Combiner/CmplxPhsDet/U0/complexphasedetector_struct/neverzero_y_net[12]} {Combiner/CmplxPhsDet/U0/complexphasedetector_struct/neverzero_y_net[13]} {Combiner/CmplxPhsDet/U0/complexphasedetector_struct/neverzero_y_net[14]} {Combiner/CmplxPhsDet/U0/complexphasedetector_struct/neverzero_y_net[15]} {Combiner/CmplxPhsDet/U0/complexphasedetector_struct/neverzero_y_net[16]} {Combiner/CmplxPhsDet/U0/complexphasedetector_struct/neverzero_y_net[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe28]
set_property port_width 13 [get_debug_ports u_ila_0/probe28]
connect_debug_port u_ila_0/probe28 [get_nets [list {Combiner/CmplxPhsDet/U0/complexphasedetector_struct/hysteresis_s_net[0]} {Combiner/CmplxPhsDet/U0/complexphasedetector_struct/hysteresis_s_net[1]} {Combiner/CmplxPhsDet/U0/complexphasedetector_struct/hysteresis_s_net[2]} {Combiner/CmplxPhsDet/U0/complexphasedetector_struct/hysteresis_s_net[3]} {Combiner/CmplxPhsDet/U0/complexphasedetector_struct/hysteresis_s_net[4]} {Combiner/CmplxPhsDet/U0/complexphasedetector_struct/hysteresis_s_net[5]} {Combiner/CmplxPhsDet/U0/complexphasedetector_struct/hysteresis_s_net[6]} {Combiner/CmplxPhsDet/U0/complexphasedetector_struct/hysteresis_s_net[7]} {Combiner/CmplxPhsDet/U0/complexphasedetector_struct/hysteresis_s_net[8]} {Combiner/CmplxPhsDet/U0/complexphasedetector_struct/hysteresis_s_net[9]} {Combiner/CmplxPhsDet/U0/complexphasedetector_struct/hysteresis_s_net[10]} {Combiner/CmplxPhsDet/U0/complexphasedetector_struct/hysteresis_s_net[11]} {Combiner/CmplxPhsDet/U0/complexphasedetector_struct/hysteresis_s_net[12]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe29]
set_property port_width 18 [get_debug_ports u_ila_0/probe29]
connect_debug_port u_ila_0/probe29 [get_nets [list {Combiner/CmplxPhsDet/U0/complexphasedetector_struct/gainoutmin[0]} {Combiner/CmplxPhsDet/U0/complexphasedetector_struct/gainoutmin[1]} {Combiner/CmplxPhsDet/U0/complexphasedetector_struct/gainoutmin[2]} {Combiner/CmplxPhsDet/U0/complexphasedetector_struct/gainoutmin[3]} {Combiner/CmplxPhsDet/U0/complexphasedetector_struct/gainoutmin[4]} {Combiner/CmplxPhsDet/U0/complexphasedetector_struct/gainoutmin[5]} {Combiner/CmplxPhsDet/U0/complexphasedetector_struct/gainoutmin[6]} {Combiner/CmplxPhsDet/U0/complexphasedetector_struct/gainoutmin[7]} {Combiner/CmplxPhsDet/U0/complexphasedetector_struct/gainoutmin[8]} {Combiner/CmplxPhsDet/U0/complexphasedetector_struct/gainoutmin[9]} {Combiner/CmplxPhsDet/U0/complexphasedetector_struct/gainoutmin[10]} {Combiner/CmplxPhsDet/U0/complexphasedetector_struct/gainoutmin[11]} {Combiner/CmplxPhsDet/U0/complexphasedetector_struct/gainoutmin[12]} {Combiner/CmplxPhsDet/U0/complexphasedetector_struct/gainoutmin[13]} {Combiner/CmplxPhsDet/U0/complexphasedetector_struct/gainoutmin[14]} {Combiner/CmplxPhsDet/U0/complexphasedetector_struct/gainoutmin[15]} {Combiner/CmplxPhsDet/U0/complexphasedetector_struct/gainoutmin[16]} {Combiner/CmplxPhsDet/U0/complexphasedetector_struct/gainoutmin[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe30]
set_property port_width 18 [get_debug_ports u_ila_0/probe30]
connect_debug_port u_ila_0/probe30 [get_nets [list {Combiner/CmplxPhsDet/U0/complexphasedetector_struct/mult1_p_net[0]} {Combiner/CmplxPhsDet/U0/complexphasedetector_struct/mult1_p_net[1]} {Combiner/CmplxPhsDet/U0/complexphasedetector_struct/mult1_p_net[2]} {Combiner/CmplxPhsDet/U0/complexphasedetector_struct/mult1_p_net[3]} {Combiner/CmplxPhsDet/U0/complexphasedetector_struct/mult1_p_net[4]} {Combiner/CmplxPhsDet/U0/complexphasedetector_struct/mult1_p_net[5]} {Combiner/CmplxPhsDet/U0/complexphasedetector_struct/mult1_p_net[6]} {Combiner/CmplxPhsDet/U0/complexphasedetector_struct/mult1_p_net[7]} {Combiner/CmplxPhsDet/U0/complexphasedetector_struct/mult1_p_net[8]} {Combiner/CmplxPhsDet/U0/complexphasedetector_struct/mult1_p_net[9]} {Combiner/CmplxPhsDet/U0/complexphasedetector_struct/mult1_p_net[10]} {Combiner/CmplxPhsDet/U0/complexphasedetector_struct/mult1_p_net[11]} {Combiner/CmplxPhsDet/U0/complexphasedetector_struct/mult1_p_net[12]} {Combiner/CmplxPhsDet/U0/complexphasedetector_struct/mult1_p_net[13]} {Combiner/CmplxPhsDet/U0/complexphasedetector_struct/mult1_p_net[14]} {Combiner/CmplxPhsDet/U0/complexphasedetector_struct/mult1_p_net[15]} {Combiner/CmplxPhsDet/U0/complexphasedetector_struct/mult1_p_net[16]} {Combiner/CmplxPhsDet/U0/complexphasedetector_struct/mult1_p_net[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe31]
set_property port_width 13 [get_debug_ports u_ila_0/probe31]
connect_debug_port u_ila_0/probe31 [get_nets [list {Combiner/CmplxPhsDet/U0/complexphasedetector_struct/core_s[0]} {Combiner/CmplxPhsDet/U0/complexphasedetector_struct/core_s[1]} {Combiner/CmplxPhsDet/U0/complexphasedetector_struct/core_s[2]} {Combiner/CmplxPhsDet/U0/complexphasedetector_struct/core_s[3]} {Combiner/CmplxPhsDet/U0/complexphasedetector_struct/core_s[4]} {Combiner/CmplxPhsDet/U0/complexphasedetector_struct/core_s[5]} {Combiner/CmplxPhsDet/U0/complexphasedetector_struct/core_s[6]} {Combiner/CmplxPhsDet/U0/complexphasedetector_struct/core_s[7]} {Combiner/CmplxPhsDet/U0/complexphasedetector_struct/core_s[8]} {Combiner/CmplxPhsDet/U0/complexphasedetector_struct/core_s[9]} {Combiner/CmplxPhsDet/U0/complexphasedetector_struct/core_s[11]} {Combiner/CmplxPhsDet/U0/complexphasedetector_struct/core_s[12]} {Combiner/CmplxPhsDet/U0/complexphasedetector_struct/core_s[13]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe32]
set_property port_width 8 [get_debug_ports u_ila_0/probe32]
connect_debug_port u_ila_0/probe32 [get_nets [list {Combiner/IF_Align_u/Index[0]} {Combiner/IF_Align_u/Index[1]} {Combiner/IF_Align_u/Index[2]} {Combiner/IF_Align_u/Index[3]} {Combiner/IF_Align_u/Index[4]} {Combiner/IF_Align_u/Index[5]} {Combiner/IF_Align_u/Index[6]} {Combiner/IF_Align_u/Index[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe33]
set_property port_width 18 [get_debug_ports u_ila_0/probe33]
connect_debug_port u_ila_0/probe33 [get_nets [list {Combiner/CmplxPhsDet/gainoutmax[0]} {Combiner/CmplxPhsDet/gainoutmax[1]} {Combiner/CmplxPhsDet/gainoutmax[2]} {Combiner/CmplxPhsDet/gainoutmax[3]} {Combiner/CmplxPhsDet/gainoutmax[4]} {Combiner/CmplxPhsDet/gainoutmax[5]} {Combiner/CmplxPhsDet/gainoutmax[6]} {Combiner/CmplxPhsDet/gainoutmax[7]} {Combiner/CmplxPhsDet/gainoutmax[8]} {Combiner/CmplxPhsDet/gainoutmax[9]} {Combiner/CmplxPhsDet/gainoutmax[10]} {Combiner/CmplxPhsDet/gainoutmax[11]} {Combiner/CmplxPhsDet/gainoutmax[12]} {Combiner/CmplxPhsDet/gainoutmax[13]} {Combiner/CmplxPhsDet/gainoutmax[14]} {Combiner/CmplxPhsDet/gainoutmax[15]} {Combiner/CmplxPhsDet/gainoutmax[16]} {Combiner/CmplxPhsDet/gainoutmax[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe34]
set_property port_width 1 [get_debug_ports u_ila_0/probe34]
connect_debug_port u_ila_0/probe34 [get_nets [list Combiner/Ch1isMaster]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe35]
set_property port_width 1 [get_debug_ports u_ila_0/probe35]
connect_debug_port u_ila_0/probe35 [get_nets [list clk46r6]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe36]
set_property port_width 1 [get_debug_ports u_ila_0/probe36]
connect_debug_port u_ila_0/probe36 [get_nets [list Combiner/CmplxPhsDet/U0/enmasterswitching]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe37]
set_property port_width 1 [get_debug_ports u_ila_0/probe37]
connect_debug_port u_ila_0/probe37 [get_nets [list Combiner/fifoProgFull]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe38]
set_property port_width 1 [get_debug_ports u_ila_0/probe38]
connect_debug_port u_ila_0/probe38 [get_nets [list Combiner/CmplxPhsDet/U0/forcech1]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe39]
set_property port_width 1 [get_debug_ports u_ila_0/probe39]
connect_debug_port u_ila_0/probe39 [get_nets [list Combiner/locked]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe40]
set_property port_width 1 [get_debug_ports u_ila_0/probe40]
connect_debug_port u_ila_0/probe40 [get_nets [list Combiner/CmplxPhsDet/U0/complexphasedetector_struct/op_mem_0_8_24]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe41]
set_property port_width 1 [get_debug_ports u_ila_0/probe41]
connect_debug_port u_ila_0/probe41 [get_nets [list Combiner/CmplxPhsDet/U0/overridech]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe42]
set_property port_width 1 [get_debug_ports u_ila_0/probe42]
connect_debug_port u_ila_0/probe42 [get_nets [list Combiner/PdClk]]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets dac1_clk_OBUF]
