
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
connect_debug_port u_ila_0/clk [get_nets [list systemClock/inst/clk2x]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe0]
set_property port_width 16 [get_debug_ports u_ila_0/probe0]
connect_debug_port u_ila_0/probe0 [get_nets [list {iDemodEye[2]} {iDemodEye[3]} {iDemodEye[4]} {iDemodEye[5]} {iDemodEye[6]} {iDemodEye[7]} {iDemodEye[8]} {iDemodEye[9]} {iDemodEye[10]} {iDemodEye[11]} {iDemodEye[12]} {iDemodEye[13]} {iDemodEye[14]} {iDemodEye[15]} {iDemodEye[16]} {iDemodEye[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe1]
set_property port_width 18 [get_debug_ports u_ila_0/probe1]
connect_debug_port u_ila_0/probe1 [get_nets [list {DigitalCombiner_u/CmplxPhsDet/U0/complexphasedetector_struct/bipolar_nco/cordic_sincos/convert1/s_axis_b_tdata[0]} {DigitalCombiner_u/CmplxPhsDet/U0/complexphasedetector_struct/bipolar_nco/cordic_sincos/convert1/s_axis_b_tdata[1]} {DigitalCombiner_u/CmplxPhsDet/U0/complexphasedetector_struct/bipolar_nco/cordic_sincos/convert1/s_axis_b_tdata[2]} {DigitalCombiner_u/CmplxPhsDet/U0/complexphasedetector_struct/bipolar_nco/cordic_sincos/convert1/s_axis_b_tdata[3]} {DigitalCombiner_u/CmplxPhsDet/U0/complexphasedetector_struct/bipolar_nco/cordic_sincos/convert1/s_axis_b_tdata[4]} {DigitalCombiner_u/CmplxPhsDet/U0/complexphasedetector_struct/bipolar_nco/cordic_sincos/convert1/s_axis_b_tdata[5]} {DigitalCombiner_u/CmplxPhsDet/U0/complexphasedetector_struct/bipolar_nco/cordic_sincos/convert1/s_axis_b_tdata[6]} {DigitalCombiner_u/CmplxPhsDet/U0/complexphasedetector_struct/bipolar_nco/cordic_sincos/convert1/s_axis_b_tdata[7]} {DigitalCombiner_u/CmplxPhsDet/U0/complexphasedetector_struct/bipolar_nco/cordic_sincos/convert1/s_axis_b_tdata[8]} {DigitalCombiner_u/CmplxPhsDet/U0/complexphasedetector_struct/bipolar_nco/cordic_sincos/convert1/s_axis_b_tdata[9]} {DigitalCombiner_u/CmplxPhsDet/U0/complexphasedetector_struct/bipolar_nco/cordic_sincos/convert1/s_axis_b_tdata[10]} {DigitalCombiner_u/CmplxPhsDet/U0/complexphasedetector_struct/bipolar_nco/cordic_sincos/convert1/s_axis_b_tdata[11]} {DigitalCombiner_u/CmplxPhsDet/U0/complexphasedetector_struct/bipolar_nco/cordic_sincos/convert1/s_axis_b_tdata[12]} {DigitalCombiner_u/CmplxPhsDet/U0/complexphasedetector_struct/bipolar_nco/cordic_sincos/convert1/s_axis_b_tdata[13]} {DigitalCombiner_u/CmplxPhsDet/U0/complexphasedetector_struct/bipolar_nco/cordic_sincos/convert1/s_axis_b_tdata[14]} {DigitalCombiner_u/CmplxPhsDet/U0/complexphasedetector_struct/bipolar_nco/cordic_sincos/convert1/s_axis_b_tdata[15]} {DigitalCombiner_u/CmplxPhsDet/U0/complexphasedetector_struct/bipolar_nco/cordic_sincos/convert1/s_axis_b_tdata[16]} {DigitalCombiner_u/CmplxPhsDet/U0/complexphasedetector_struct/bipolar_nco/cordic_sincos/convert1/s_axis_b_tdata[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe2]
set_property port_width 18 [get_debug_ports u_ila_0/probe2]
connect_debug_port u_ila_0/probe2 [get_nets [list {DigitalCombiner_u/CmplxPhsDet/U0/complexphasedetector_struct/bipolar_nco/cordic_sincos/convert/s_axis_b_tdata[0]} {DigitalCombiner_u/CmplxPhsDet/U0/complexphasedetector_struct/bipolar_nco/cordic_sincos/convert/s_axis_b_tdata[1]} {DigitalCombiner_u/CmplxPhsDet/U0/complexphasedetector_struct/bipolar_nco/cordic_sincos/convert/s_axis_b_tdata[2]} {DigitalCombiner_u/CmplxPhsDet/U0/complexphasedetector_struct/bipolar_nco/cordic_sincos/convert/s_axis_b_tdata[3]} {DigitalCombiner_u/CmplxPhsDet/U0/complexphasedetector_struct/bipolar_nco/cordic_sincos/convert/s_axis_b_tdata[4]} {DigitalCombiner_u/CmplxPhsDet/U0/complexphasedetector_struct/bipolar_nco/cordic_sincos/convert/s_axis_b_tdata[5]} {DigitalCombiner_u/CmplxPhsDet/U0/complexphasedetector_struct/bipolar_nco/cordic_sincos/convert/s_axis_b_tdata[6]} {DigitalCombiner_u/CmplxPhsDet/U0/complexphasedetector_struct/bipolar_nco/cordic_sincos/convert/s_axis_b_tdata[7]} {DigitalCombiner_u/CmplxPhsDet/U0/complexphasedetector_struct/bipolar_nco/cordic_sincos/convert/s_axis_b_tdata[8]} {DigitalCombiner_u/CmplxPhsDet/U0/complexphasedetector_struct/bipolar_nco/cordic_sincos/convert/s_axis_b_tdata[9]} {DigitalCombiner_u/CmplxPhsDet/U0/complexphasedetector_struct/bipolar_nco/cordic_sincos/convert/s_axis_b_tdata[10]} {DigitalCombiner_u/CmplxPhsDet/U0/complexphasedetector_struct/bipolar_nco/cordic_sincos/convert/s_axis_b_tdata[11]} {DigitalCombiner_u/CmplxPhsDet/U0/complexphasedetector_struct/bipolar_nco/cordic_sincos/convert/s_axis_b_tdata[12]} {DigitalCombiner_u/CmplxPhsDet/U0/complexphasedetector_struct/bipolar_nco/cordic_sincos/convert/s_axis_b_tdata[13]} {DigitalCombiner_u/CmplxPhsDet/U0/complexphasedetector_struct/bipolar_nco/cordic_sincos/convert/s_axis_b_tdata[14]} {DigitalCombiner_u/CmplxPhsDet/U0/complexphasedetector_struct/bipolar_nco/cordic_sincos/convert/s_axis_b_tdata[15]} {DigitalCombiner_u/CmplxPhsDet/U0/complexphasedetector_struct/bipolar_nco/cordic_sincos/convert/s_axis_b_tdata[16]} {DigitalCombiner_u/CmplxPhsDet/U0/complexphasedetector_struct/bipolar_nco/cordic_sincos/convert/s_axis_b_tdata[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe3]
set_property port_width 20 [get_debug_ports u_ila_0/probe3]
connect_debug_port u_ila_0/probe3 [get_nets [list {DigitalCombiner_u/IF_Align_u/AbsOut[-15]} {DigitalCombiner_u/IF_Align_u/AbsOut[-14]} {DigitalCombiner_u/IF_Align_u/AbsOut[-13]} {DigitalCombiner_u/IF_Align_u/AbsOut[-12]} {DigitalCombiner_u/IF_Align_u/AbsOut[-11]} {DigitalCombiner_u/IF_Align_u/AbsOut[-10]} {DigitalCombiner_u/IF_Align_u/AbsOut[-9]} {DigitalCombiner_u/IF_Align_u/AbsOut[-8]} {DigitalCombiner_u/IF_Align_u/AbsOut[-7]} {DigitalCombiner_u/IF_Align_u/AbsOut[-6]} {DigitalCombiner_u/IF_Align_u/AbsOut[-5]} {DigitalCombiner_u/IF_Align_u/AbsOut[-4]} {DigitalCombiner_u/IF_Align_u/AbsOut[-3]} {DigitalCombiner_u/IF_Align_u/AbsOut[-2]} {DigitalCombiner_u/IF_Align_u/AbsOut[-1]} {DigitalCombiner_u/IF_Align_u/AbsOut[0]} {DigitalCombiner_u/IF_Align_u/AbsOut[1]} {DigitalCombiner_u/IF_Align_u/AbsOut[2]} {DigitalCombiner_u/IF_Align_u/AbsOut[3]} {DigitalCombiner_u/IF_Align_u/AbsOut[4]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe4]
set_property port_width 18 [get_debug_ports u_ila_0/probe4]
connect_debug_port u_ila_0/probe4 [get_nets [list {DigitalCombiner_u/IF_Align_u/IF_Diff[0]} {DigitalCombiner_u/IF_Align_u/IF_Diff[1]} {DigitalCombiner_u/IF_Align_u/IF_Diff[2]} {DigitalCombiner_u/IF_Align_u/IF_Diff[3]} {DigitalCombiner_u/IF_Align_u/IF_Diff[4]} {DigitalCombiner_u/IF_Align_u/IF_Diff[5]} {DigitalCombiner_u/IF_Align_u/IF_Diff[6]} {DigitalCombiner_u/IF_Align_u/IF_Diff[7]} {DigitalCombiner_u/IF_Align_u/IF_Diff[8]} {DigitalCombiner_u/IF_Align_u/IF_Diff[9]} {DigitalCombiner_u/IF_Align_u/IF_Diff[10]} {DigitalCombiner_u/IF_Align_u/IF_Diff[11]} {DigitalCombiner_u/IF_Align_u/IF_Diff[12]} {DigitalCombiner_u/IF_Align_u/IF_Diff[13]} {DigitalCombiner_u/IF_Align_u/IF_Diff[14]} {DigitalCombiner_u/IF_Align_u/IF_Diff[15]} {DigitalCombiner_u/IF_Align_u/IF_Diff[16]} {DigitalCombiner_u/IF_Align_u/IF_Diff[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe5]
set_property port_width 8 [get_debug_ports u_ila_0/probe5]
connect_debug_port u_ila_0/probe5 [get_nets [list {DigitalCombiner_u/IF_Align_u/Index[0]} {DigitalCombiner_u/IF_Align_u/Index[1]} {DigitalCombiner_u/IF_Align_u/Index[2]} {DigitalCombiner_u/IF_Align_u/Index[3]} {DigitalCombiner_u/IF_Align_u/Index[4]} {DigitalCombiner_u/IF_Align_u/Index[5]} {DigitalCombiner_u/IF_Align_u/Index[6]} {DigitalCombiner_u/IF_Align_u/Index[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe6]
set_property port_width 8 [get_debug_ports u_ila_0/probe6]
connect_debug_port u_ila_0/probe6 [get_nets [list {DigitalCombiner_u/IF_Align_u/IndexAbs[0]} {DigitalCombiner_u/IF_Align_u/IndexAbs[1]} {DigitalCombiner_u/IF_Align_u/IndexAbs[2]} {DigitalCombiner_u/IF_Align_u/IndexAbs[3]} {DigitalCombiner_u/IF_Align_u/IndexAbs[4]} {DigitalCombiner_u/IF_Align_u/IndexAbs[5]} {DigitalCombiner_u/IF_Align_u/IndexAbs[6]} {DigitalCombiner_u/IF_Align_u/IndexAbs[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe7]
set_property port_width 15 [get_debug_ports u_ila_0/probe7]
connect_debug_port u_ila_0/probe7 [get_nets [list {DigitalCombiner_u/IF_Align_u/IndexAcc__0[-7]} {DigitalCombiner_u/IF_Align_u/IndexAcc__0[-6]} {DigitalCombiner_u/IF_Align_u/IndexAcc__0[-5]} {DigitalCombiner_u/IF_Align_u/IndexAcc__0[-4]} {DigitalCombiner_u/IF_Align_u/IndexAcc__0[-3]} {DigitalCombiner_u/IF_Align_u/IndexAcc__0[-2]} {DigitalCombiner_u/IF_Align_u/IndexAcc__0[-1]} {DigitalCombiner_u/IF_Align_u/IndexAcc__0[0]} {DigitalCombiner_u/IF_Align_u/IndexAcc__0[1]} {DigitalCombiner_u/IF_Align_u/IndexAcc__0[2]} {DigitalCombiner_u/IF_Align_u/IndexAcc__0[3]} {DigitalCombiner_u/IF_Align_u/IndexAcc__0[4]} {DigitalCombiner_u/IF_Align_u/IndexAcc__0[5]} {DigitalCombiner_u/IF_Align_u/IndexAcc__0[6]} {DigitalCombiner_u/IF_Align_u/IndexAcc__0[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe8]
set_property port_width 2 [get_debug_ports u_ila_0/probe8]
connect_debug_port u_ila_0/probe8 [get_nets [list {DigitalCombiner_u/IF_Align_u/SkipFirst2[0]} {DigitalCombiner_u/IF_Align_u/SkipFirst2[1]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe9]
set_property port_width 18 [get_debug_ports u_ila_0/probe9]
connect_debug_port u_ila_0/probe9 [get_nets [list {DigitalCombiner_u/Imag1Out[0]} {DigitalCombiner_u/Imag1Out[1]} {DigitalCombiner_u/Imag1Out[2]} {DigitalCombiner_u/Imag1Out[3]} {DigitalCombiner_u/Imag1Out[4]} {DigitalCombiner_u/Imag1Out[5]} {DigitalCombiner_u/Imag1Out[6]} {DigitalCombiner_u/Imag1Out[7]} {DigitalCombiner_u/Imag1Out[8]} {DigitalCombiner_u/Imag1Out[9]} {DigitalCombiner_u/Imag1Out[10]} {DigitalCombiner_u/Imag1Out[11]} {DigitalCombiner_u/Imag1Out[12]} {DigitalCombiner_u/Imag1Out[13]} {DigitalCombiner_u/Imag1Out[14]} {DigitalCombiner_u/Imag1Out[15]} {DigitalCombiner_u/Imag1Out[16]} {DigitalCombiner_u/Imag1Out[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe10]
set_property port_width 18 [get_debug_ports u_ila_0/probe10]
connect_debug_port u_ila_0/probe10 [get_nets [list {DigitalCombiner_u/Imag2Out[0]} {DigitalCombiner_u/Imag2Out[1]} {DigitalCombiner_u/Imag2Out[2]} {DigitalCombiner_u/Imag2Out[3]} {DigitalCombiner_u/Imag2Out[4]} {DigitalCombiner_u/Imag2Out[5]} {DigitalCombiner_u/Imag2Out[6]} {DigitalCombiner_u/Imag2Out[7]} {DigitalCombiner_u/Imag2Out[8]} {DigitalCombiner_u/Imag2Out[9]} {DigitalCombiner_u/Imag2Out[10]} {DigitalCombiner_u/Imag2Out[11]} {DigitalCombiner_u/Imag2Out[12]} {DigitalCombiner_u/Imag2Out[13]} {DigitalCombiner_u/Imag2Out[14]} {DigitalCombiner_u/Imag2Out[15]} {DigitalCombiner_u/Imag2Out[16]} {DigitalCombiner_u/Imag2Out[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe11]
set_property port_width 18 [get_debug_ports u_ila_0/probe11]
connect_debug_port u_ila_0/probe11 [get_nets [list {DigitalCombiner_u/Real1Out[0]} {DigitalCombiner_u/Real1Out[1]} {DigitalCombiner_u/Real1Out[2]} {DigitalCombiner_u/Real1Out[3]} {DigitalCombiner_u/Real1Out[4]} {DigitalCombiner_u/Real1Out[5]} {DigitalCombiner_u/Real1Out[6]} {DigitalCombiner_u/Real1Out[7]} {DigitalCombiner_u/Real1Out[8]} {DigitalCombiner_u/Real1Out[9]} {DigitalCombiner_u/Real1Out[10]} {DigitalCombiner_u/Real1Out[11]} {DigitalCombiner_u/Real1Out[12]} {DigitalCombiner_u/Real1Out[13]} {DigitalCombiner_u/Real1Out[14]} {DigitalCombiner_u/Real1Out[15]} {DigitalCombiner_u/Real1Out[16]} {DigitalCombiner_u/Real1Out[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe12]
set_property port_width 18 [get_debug_ports u_ila_0/probe12]
connect_debug_port u_ila_0/probe12 [get_nets [list {DigitalCombiner_u/Real2Out[0]} {DigitalCombiner_u/Real2Out[1]} {DigitalCombiner_u/Real2Out[2]} {DigitalCombiner_u/Real2Out[3]} {DigitalCombiner_u/Real2Out[4]} {DigitalCombiner_u/Real2Out[5]} {DigitalCombiner_u/Real2Out[6]} {DigitalCombiner_u/Real2Out[7]} {DigitalCombiner_u/Real2Out[8]} {DigitalCombiner_u/Real2Out[9]} {DigitalCombiner_u/Real2Out[10]} {DigitalCombiner_u/Real2Out[11]} {DigitalCombiner_u/Real2Out[12]} {DigitalCombiner_u/Real2Out[13]} {DigitalCombiner_u/Real2Out[14]} {DigitalCombiner_u/Real2Out[15]} {DigitalCombiner_u/Real2Out[16]} {DigitalCombiner_u/Real2Out[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe13]
set_property port_width 18 [get_debug_ports u_ila_0/probe13]
connect_debug_port u_ila_0/probe13 [get_nets [list {DigitalCombiner_u/CmplxPhsDet/realout[0]} {DigitalCombiner_u/CmplxPhsDet/realout[1]} {DigitalCombiner_u/CmplxPhsDet/realout[2]} {DigitalCombiner_u/CmplxPhsDet/realout[3]} {DigitalCombiner_u/CmplxPhsDet/realout[4]} {DigitalCombiner_u/CmplxPhsDet/realout[5]} {DigitalCombiner_u/CmplxPhsDet/realout[6]} {DigitalCombiner_u/CmplxPhsDet/realout[7]} {DigitalCombiner_u/CmplxPhsDet/realout[8]} {DigitalCombiner_u/CmplxPhsDet/realout[9]} {DigitalCombiner_u/CmplxPhsDet/realout[10]} {DigitalCombiner_u/CmplxPhsDet/realout[11]} {DigitalCombiner_u/CmplxPhsDet/realout[12]} {DigitalCombiner_u/CmplxPhsDet/realout[13]} {DigitalCombiner_u/CmplxPhsDet/realout[14]} {DigitalCombiner_u/CmplxPhsDet/realout[15]} {DigitalCombiner_u/CmplxPhsDet/realout[16]} {DigitalCombiner_u/CmplxPhsDet/realout[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe14]
set_property port_width 13 [get_debug_ports u_ila_0/probe14]
connect_debug_port u_ila_0/probe14 [get_nets [list {DigitalCombiner_u/CmplxPhsDet/reallock[0]} {DigitalCombiner_u/CmplxPhsDet/reallock[1]} {DigitalCombiner_u/CmplxPhsDet/reallock[2]} {DigitalCombiner_u/CmplxPhsDet/reallock[3]} {DigitalCombiner_u/CmplxPhsDet/reallock[4]} {DigitalCombiner_u/CmplxPhsDet/reallock[5]} {DigitalCombiner_u/CmplxPhsDet/reallock[6]} {DigitalCombiner_u/CmplxPhsDet/reallock[7]} {DigitalCombiner_u/CmplxPhsDet/reallock[8]} {DigitalCombiner_u/CmplxPhsDet/reallock[9]} {DigitalCombiner_u/CmplxPhsDet/reallock[10]} {DigitalCombiner_u/CmplxPhsDet/reallock[11]} {DigitalCombiner_u/CmplxPhsDet/reallock[12]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe15]
set_property port_width 18 [get_debug_ports u_ila_0/probe15]
connect_debug_port u_ila_0/probe15 [get_nets [list {DigitalCombiner_u/CmplxPhsDet/imagout[0]} {DigitalCombiner_u/CmplxPhsDet/imagout[1]} {DigitalCombiner_u/CmplxPhsDet/imagout[2]} {DigitalCombiner_u/CmplxPhsDet/imagout[3]} {DigitalCombiner_u/CmplxPhsDet/imagout[4]} {DigitalCombiner_u/CmplxPhsDet/imagout[5]} {DigitalCombiner_u/CmplxPhsDet/imagout[6]} {DigitalCombiner_u/CmplxPhsDet/imagout[7]} {DigitalCombiner_u/CmplxPhsDet/imagout[8]} {DigitalCombiner_u/CmplxPhsDet/imagout[9]} {DigitalCombiner_u/CmplxPhsDet/imagout[10]} {DigitalCombiner_u/CmplxPhsDet/imagout[11]} {DigitalCombiner_u/CmplxPhsDet/imagout[12]} {DigitalCombiner_u/CmplxPhsDet/imagout[13]} {DigitalCombiner_u/CmplxPhsDet/imagout[14]} {DigitalCombiner_u/CmplxPhsDet/imagout[15]} {DigitalCombiner_u/CmplxPhsDet/imagout[16]} {DigitalCombiner_u/CmplxPhsDet/imagout[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe16]
set_property port_width 13 [get_debug_ports u_ila_0/probe16]
connect_debug_port u_ila_0/probe16 [get_nets [list {DigitalCombiner_u/CmplxPhsDet/imaglock[0]} {DigitalCombiner_u/CmplxPhsDet/imaglock[1]} {DigitalCombiner_u/CmplxPhsDet/imaglock[2]} {DigitalCombiner_u/CmplxPhsDet/imaglock[3]} {DigitalCombiner_u/CmplxPhsDet/imaglock[4]} {DigitalCombiner_u/CmplxPhsDet/imaglock[5]} {DigitalCombiner_u/CmplxPhsDet/imaglock[6]} {DigitalCombiner_u/CmplxPhsDet/imaglock[7]} {DigitalCombiner_u/CmplxPhsDet/imaglock[8]} {DigitalCombiner_u/CmplxPhsDet/imaglock[9]} {DigitalCombiner_u/CmplxPhsDet/imaglock[10]} {DigitalCombiner_u/CmplxPhsDet/imaglock[11]} {DigitalCombiner_u/CmplxPhsDet/imaglock[12]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe17]
set_property port_width 8 [get_debug_ports u_ila_0/probe17]
connect_debug_port u_ila_0/probe17 [get_nets [list {DigitalCombiner_u/GenIF/DucCount[0]} {DigitalCombiner_u/GenIF/DucCount[1]} {DigitalCombiner_u/GenIF/DucCount[2]} {DigitalCombiner_u/GenIF/DucCount[3]} {DigitalCombiner_u/GenIF/DucCount[4]} {DigitalCombiner_u/GenIF/DucCount[5]} {DigitalCombiner_u/GenIF/DucCount[6]} {DigitalCombiner_u/GenIF/DucCount[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe18]
set_property port_width 1 [get_debug_ports u_ila_0/probe18]
connect_debug_port u_ila_0/probe18 [get_nets [list DigitalCombiner_u/IF_Align_u/Restart]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe19]
set_property port_width 1 [get_debug_ports u_ila_0/probe19]
connect_debug_port u_ila_0/probe19 [get_nets [list DigitalCombiner_u/IF_Align_u/ValidOut__0]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe20]
set_property port_width 1 [get_debug_ports u_ila_0/probe20]
connect_debug_port u_ila_0/probe20 [get_nets [list DigitalCombiner_u/IF_Align_u/ValidOverAdd]]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets clk2x]
