
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
connect_debug_port u_ila_0/clk [get_nets [list O_BUFG]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe0]
set_property port_width 8 [get_debug_ports u_ila_0/probe0]
connect_debug_port u_ila_0/probe0 [get_nets [list {Uart/RxBuffer[1]_9[0]} {Uart/RxBuffer[1]_9[1]} {Uart/RxBuffer[1]_9[2]} {Uart/RxBuffer[1]_9[3]} {Uart/RxBuffer[1]_9[4]} {Uart/RxBuffer[1]_9[5]} {Uart/RxBuffer[1]_9[6]} {Uart/RxBuffer[1]_9[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe1]
set_property port_width 8 [get_debug_ports u_ila_0/probe1]
connect_debug_port u_ila_0/probe1 [get_nets [list {Uart/RxBuffer[18]_21[0]} {Uart/RxBuffer[18]_21[1]} {Uart/RxBuffer[18]_21[2]} {Uart/RxBuffer[18]_21[3]} {Uart/RxBuffer[18]_21[4]} {Uart/RxBuffer[18]_21[5]} {Uart/RxBuffer[18]_21[6]} {Uart/RxBuffer[18]_21[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe2]
set_property port_width 8 [get_debug_ports u_ila_0/probe2]
connect_debug_port u_ila_0/probe2 [get_nets [list {Uart/RxBuffer[23]_26[0]} {Uart/RxBuffer[23]_26[1]} {Uart/RxBuffer[23]_26[2]} {Uart/RxBuffer[23]_26[3]} {Uart/RxBuffer[23]_26[4]} {Uart/RxBuffer[23]_26[5]} {Uart/RxBuffer[23]_26[6]} {Uart/RxBuffer[23]_26[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe3]
set_property port_width 32 [get_debug_ports u_ila_0/probe3]
connect_debug_port u_ila_0/probe3 [get_nets [list {Uart/MyInt[0]} {Uart/MyInt[1]} {Uart/MyInt[2]} {Uart/MyInt[3]} {Uart/MyInt[4]} {Uart/MyInt[5]} {Uart/MyInt[6]} {Uart/MyInt[7]} {Uart/MyInt[8]} {Uart/MyInt[9]} {Uart/MyInt[10]} {Uart/MyInt[11]} {Uart/MyInt[12]} {Uart/MyInt[13]} {Uart/MyInt[14]} {Uart/MyInt[15]} {Uart/MyInt[16]} {Uart/MyInt[17]} {Uart/MyInt[18]} {Uart/MyInt[19]} {Uart/MyInt[20]} {Uart/MyInt[21]} {Uart/MyInt[22]} {Uart/MyInt[23]} {Uart/MyInt[24]} {Uart/MyInt[25]} {Uart/MyInt[26]} {Uart/MyInt[27]} {Uart/MyInt[28]} {Uart/MyInt[29]} {Uart/MyInt[30]} {Uart/MyInt[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe4]
set_property port_width 8 [get_debug_ports u_ila_0/probe4]
connect_debug_port u_ila_0/probe4 [get_nets [list {Uart/RxBuffer[25]_28[0]} {Uart/RxBuffer[25]_28[1]} {Uart/RxBuffer[25]_28[2]} {Uart/RxBuffer[25]_28[3]} {Uart/RxBuffer[25]_28[4]} {Uart/RxBuffer[25]_28[5]} {Uart/RxBuffer[25]_28[6]} {Uart/RxBuffer[25]_28[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe5]
set_property port_width 8 [get_debug_ports u_ila_0/probe5]
connect_debug_port u_ila_0/probe5 [get_nets [list {Uart/RxBuffer[27]_30[0]} {Uart/RxBuffer[27]_30[1]} {Uart/RxBuffer[27]_30[2]} {Uart/RxBuffer[27]_30[3]} {Uart/RxBuffer[27]_30[4]} {Uart/RxBuffer[27]_30[5]} {Uart/RxBuffer[27]_30[6]} {Uart/RxBuffer[27]_30[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe6]
set_property port_width 2 [get_debug_ports u_ila_0/probe6]
connect_debug_port u_ila_0/probe6 [get_nets [list {Uart/Mode[0]} {Uart/Mode[1]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe7]
set_property port_width 8 [get_debug_ports u_ila_0/probe7]
connect_debug_port u_ila_0/probe7 [get_nets [list {Uart/RxBuffer[11]_14[0]} {Uart/RxBuffer[11]_14[1]} {Uart/RxBuffer[11]_14[2]} {Uart/RxBuffer[11]_14[3]} {Uart/RxBuffer[11]_14[4]} {Uart/RxBuffer[11]_14[5]} {Uart/RxBuffer[11]_14[6]} {Uart/RxBuffer[11]_14[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe8]
set_property port_width 8 [get_debug_ports u_ila_0/probe8]
connect_debug_port u_ila_0/probe8 [get_nets [list {Uart/RxBuffer[13]_16[0]} {Uart/RxBuffer[13]_16[1]} {Uart/RxBuffer[13]_16[2]} {Uart/RxBuffer[13]_16[3]} {Uart/RxBuffer[13]_16[4]} {Uart/RxBuffer[13]_16[5]} {Uart/RxBuffer[13]_16[6]} {Uart/RxBuffer[13]_16[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe9]
set_property port_width 8 [get_debug_ports u_ila_0/probe9]
connect_debug_port u_ila_0/probe9 [get_nets [list {Uart/RxBuffer[14]_17[0]} {Uart/RxBuffer[14]_17[1]} {Uart/RxBuffer[14]_17[2]} {Uart/RxBuffer[14]_17[3]} {Uart/RxBuffer[14]_17[4]} {Uart/RxBuffer[14]_17[5]} {Uart/RxBuffer[14]_17[6]} {Uart/RxBuffer[14]_17[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe10]
set_property port_width 8 [get_debug_ports u_ila_0/probe10]
connect_debug_port u_ila_0/probe10 [get_nets [list {Uart/RxBuffer[20]_23[0]} {Uart/RxBuffer[20]_23[1]} {Uart/RxBuffer[20]_23[2]} {Uart/RxBuffer[20]_23[3]} {Uart/RxBuffer[20]_23[4]} {Uart/RxBuffer[20]_23[5]} {Uart/RxBuffer[20]_23[6]} {Uart/RxBuffer[20]_23[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe11]
set_property port_width 8 [get_debug_ports u_ila_0/probe11]
connect_debug_port u_ila_0/probe11 [get_nets [list {Uart/RxBuffer[22]_25[0]} {Uart/RxBuffer[22]_25[1]} {Uart/RxBuffer[22]_25[2]} {Uart/RxBuffer[22]_25[3]} {Uart/RxBuffer[22]_25[4]} {Uart/RxBuffer[22]_25[5]} {Uart/RxBuffer[22]_25[6]} {Uart/RxBuffer[22]_25[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe12]
set_property port_width 8 [get_debug_ports u_ila_0/probe12]
connect_debug_port u_ila_0/probe12 [get_nets [list {Uart/RxBuffer[24]_27[0]} {Uart/RxBuffer[24]_27[1]} {Uart/RxBuffer[24]_27[2]} {Uart/RxBuffer[24]_27[3]} {Uart/RxBuffer[24]_27[4]} {Uart/RxBuffer[24]_27[5]} {Uart/RxBuffer[24]_27[6]} {Uart/RxBuffer[24]_27[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe13]
set_property port_width 8 [get_debug_ports u_ila_0/probe13]
connect_debug_port u_ila_0/probe13 [get_nets [list {Uart/RxBuffer[17]_20[0]} {Uart/RxBuffer[17]_20[1]} {Uart/RxBuffer[17]_20[2]} {Uart/RxBuffer[17]_20[3]} {Uart/RxBuffer[17]_20[4]} {Uart/RxBuffer[17]_20[5]} {Uart/RxBuffer[17]_20[6]} {Uart/RxBuffer[17]_20[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe14]
set_property port_width 8 [get_debug_ports u_ila_0/probe14]
connect_debug_port u_ila_0/probe14 [get_nets [list {Uart/RxBuffer[26]_29[0]} {Uart/RxBuffer[26]_29[1]} {Uart/RxBuffer[26]_29[2]} {Uart/RxBuffer[26]_29[3]} {Uart/RxBuffer[26]_29[4]} {Uart/RxBuffer[26]_29[5]} {Uart/RxBuffer[26]_29[6]} {Uart/RxBuffer[26]_29[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe15]
set_property port_width 8 [get_debug_ports u_ila_0/probe15]
connect_debug_port u_ila_0/probe15 [get_nets [list {Uart/RxBuffer[12]_15[0]} {Uart/RxBuffer[12]_15[1]} {Uart/RxBuffer[12]_15[2]} {Uart/RxBuffer[12]_15[3]} {Uart/RxBuffer[12]_15[4]} {Uart/RxBuffer[12]_15[5]} {Uart/RxBuffer[12]_15[6]} {Uart/RxBuffer[12]_15[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe16]
set_property port_width 8 [get_debug_ports u_ila_0/probe16]
connect_debug_port u_ila_0/probe16 [get_nets [list {Uart/RxBuffer[21]_24[0]} {Uart/RxBuffer[21]_24[1]} {Uart/RxBuffer[21]_24[2]} {Uart/RxBuffer[21]_24[3]} {Uart/RxBuffer[21]_24[4]} {Uart/RxBuffer[21]_24[5]} {Uart/RxBuffer[21]_24[6]} {Uart/RxBuffer[21]_24[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe17]
set_property port_width 8 [get_debug_ports u_ila_0/probe17]
connect_debug_port u_ila_0/probe17 [get_nets [list {Uart/RxBuffer[28]_31[0]} {Uart/RxBuffer[28]_31[1]} {Uart/RxBuffer[28]_31[2]} {Uart/RxBuffer[28]_31[3]} {Uart/RxBuffer[28]_31[4]} {Uart/RxBuffer[28]_31[5]} {Uart/RxBuffer[28]_31[6]} {Uart/RxBuffer[28]_31[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe18]
set_property port_width 8 [get_debug_ports u_ila_0/probe18]
connect_debug_port u_ila_0/probe18 [get_nets [list {Uart/RxBuffer[29]_32[0]} {Uart/RxBuffer[29]_32[1]} {Uart/RxBuffer[29]_32[2]} {Uart/RxBuffer[29]_32[3]} {Uart/RxBuffer[29]_32[4]} {Uart/RxBuffer[29]_32[5]} {Uart/RxBuffer[29]_32[6]} {Uart/RxBuffer[29]_32[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe19]
set_property port_width 8 [get_debug_ports u_ila_0/probe19]
connect_debug_port u_ila_0/probe19 [get_nets [list {Uart/RxBuffer[2]_35[0]} {Uart/RxBuffer[2]_35[1]} {Uart/RxBuffer[2]_35[2]} {Uart/RxBuffer[2]_35[3]} {Uart/RxBuffer[2]_35[4]} {Uart/RxBuffer[2]_35[5]} {Uart/RxBuffer[2]_35[6]} {Uart/RxBuffer[2]_35[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe20]
set_property port_width 64 [get_debug_ports u_ila_0/probe20]
connect_debug_port u_ila_0/probe20 [get_nets [list {Uart/MyHex[0]} {Uart/MyHex[1]} {Uart/MyHex[2]} {Uart/MyHex[3]} {Uart/MyHex[4]} {Uart/MyHex[5]} {Uart/MyHex[6]} {Uart/MyHex[7]} {Uart/MyHex[8]} {Uart/MyHex[9]} {Uart/MyHex[10]} {Uart/MyHex[11]} {Uart/MyHex[12]} {Uart/MyHex[13]} {Uart/MyHex[14]} {Uart/MyHex[15]} {Uart/MyHex[16]} {Uart/MyHex[17]} {Uart/MyHex[18]} {Uart/MyHex[19]} {Uart/MyHex[20]} {Uart/MyHex[21]} {Uart/MyHex[22]} {Uart/MyHex[23]} {Uart/MyHex[24]} {Uart/MyHex[25]} {Uart/MyHex[26]} {Uart/MyHex[27]} {Uart/MyHex[28]} {Uart/MyHex[29]} {Uart/MyHex[30]} {Uart/MyHex[31]} {Uart/MyHex[32]} {Uart/MyHex[33]} {Uart/MyHex[34]} {Uart/MyHex[35]} {Uart/MyHex[36]} {Uart/MyHex[37]} {Uart/MyHex[38]} {Uart/MyHex[39]} {Uart/MyHex[40]} {Uart/MyHex[41]} {Uart/MyHex[42]} {Uart/MyHex[43]} {Uart/MyHex[44]} {Uart/MyHex[45]} {Uart/MyHex[46]} {Uart/MyHex[47]} {Uart/MyHex[48]} {Uart/MyHex[49]} {Uart/MyHex[50]} {Uart/MyHex[51]} {Uart/MyHex[52]} {Uart/MyHex[53]} {Uart/MyHex[54]} {Uart/MyHex[55]} {Uart/MyHex[56]} {Uart/MyHex[57]} {Uart/MyHex[58]} {Uart/MyHex[59]} {Uart/MyHex[60]} {Uart/MyHex[61]} {Uart/MyHex[62]} {Uart/MyHex[63]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe21]
set_property port_width 8 [get_debug_ports u_ila_0/probe21]
connect_debug_port u_ila_0/probe21 [get_nets [list {Uart/RxBuffer[10]_13[0]} {Uart/RxBuffer[10]_13[1]} {Uart/RxBuffer[10]_13[2]} {Uart/RxBuffer[10]_13[3]} {Uart/RxBuffer[10]_13[4]} {Uart/RxBuffer[10]_13[5]} {Uart/RxBuffer[10]_13[6]} {Uart/RxBuffer[10]_13[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe22]
set_property port_width 8 [get_debug_ports u_ila_0/probe22]
connect_debug_port u_ila_0/probe22 [get_nets [list {Uart/RxBuffer[15]_18[0]} {Uart/RxBuffer[15]_18[1]} {Uart/RxBuffer[15]_18[2]} {Uart/RxBuffer[15]_18[3]} {Uart/RxBuffer[15]_18[4]} {Uart/RxBuffer[15]_18[5]} {Uart/RxBuffer[15]_18[6]} {Uart/RxBuffer[15]_18[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe23]
set_property port_width 8 [get_debug_ports u_ila_0/probe23]
connect_debug_port u_ila_0/probe23 [get_nets [list {Uart/RxBuffer[16]_19[0]} {Uart/RxBuffer[16]_19[1]} {Uart/RxBuffer[16]_19[2]} {Uart/RxBuffer[16]_19[3]} {Uart/RxBuffer[16]_19[4]} {Uart/RxBuffer[16]_19[5]} {Uart/RxBuffer[16]_19[6]} {Uart/RxBuffer[16]_19[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe24]
set_property port_width 8 [get_debug_ports u_ila_0/probe24]
connect_debug_port u_ila_0/probe24 [get_nets [list {Uart/RxBuffer[19]_22[0]} {Uart/RxBuffer[19]_22[1]} {Uart/RxBuffer[19]_22[2]} {Uart/RxBuffer[19]_22[3]} {Uart/RxBuffer[19]_22[4]} {Uart/RxBuffer[19]_22[5]} {Uart/RxBuffer[19]_22[6]} {Uart/RxBuffer[19]_22[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe25]
set_property port_width 8 [get_debug_ports u_ila_0/probe25]
connect_debug_port u_ila_0/probe25 [get_nets [list {Uart/RxBuffer[30]_33[0]} {Uart/RxBuffer[30]_33[1]} {Uart/RxBuffer[30]_33[2]} {Uart/RxBuffer[30]_33[3]} {Uart/RxBuffer[30]_33[4]} {Uart/RxBuffer[30]_33[5]} {Uart/RxBuffer[30]_33[6]} {Uart/RxBuffer[30]_33[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe26]
set_property port_width 8 [get_debug_ports u_ila_0/probe26]
connect_debug_port u_ila_0/probe26 [get_nets [list {Uart/RxCommand[2]_6[0]} {Uart/RxCommand[2]_6[1]} {Uart/RxCommand[2]_6[2]} {Uart/RxCommand[2]_6[3]} {Uart/RxCommand[2]_6[4]} {Uart/RxCommand[2]_6[5]} {Uart/RxCommand[2]_6[6]} {Uart/RxCommand[2]_6[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe27]
set_property port_width 5 [get_debug_ports u_ila_0/probe27]
connect_debug_port u_ila_0/probe27 [get_nets [list {Uart/Selects[14][0]} {Uart/Selects[14][1]} {Uart/Selects[14][2]} {Uart/Selects[14][3]} {Uart/Selects[14][4]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe28]
set_property port_width 8 [get_debug_ports u_ila_0/probe28]
connect_debug_port u_ila_0/probe28 [get_nets [list {Uart/RxBuffer[4]_11[0]} {Uart/RxBuffer[4]_11[1]} {Uart/RxBuffer[4]_11[2]} {Uart/RxBuffer[4]_11[3]} {Uart/RxBuffer[4]_11[4]} {Uart/RxBuffer[4]_11[5]} {Uart/RxBuffer[4]_11[6]} {Uart/RxBuffer[4]_11[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe29]
set_property port_width 5 [get_debug_ports u_ila_0/probe29]
connect_debug_port u_ila_0/probe29 [get_nets [list {Uart/Selects[2][0]} {Uart/Selects[2][1]} {Uart/Selects[2][2]} {Uart/Selects[2][3]} {Uart/Selects[2][4]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe30]
set_property port_width 5 [get_debug_ports u_ila_0/probe30]
connect_debug_port u_ila_0/probe30 [get_nets [list {Uart/Selects[4][0]} {Uart/Selects[4][1]} {Uart/Selects[4][2]} {Uart/Selects[4][3]} {Uart/Selects[4][4]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe31]
set_property port_width 5 [get_debug_ports u_ila_0/probe31]
connect_debug_port u_ila_0/probe31 [get_nets [list {Uart/Selects[5][0]} {Uart/Selects[5][1]} {Uart/Selects[5][2]} {Uart/Selects[5][3]} {Uart/Selects[5][4]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe32]
set_property port_width 5 [get_debug_ports u_ila_0/probe32]
connect_debug_port u_ila_0/probe32 [get_nets [list {Uart/Selects[3][0]} {Uart/Selects[3][1]} {Uart/Selects[3][2]} {Uart/Selects[3][3]} {Uart/Selects[3][4]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe33]
set_property port_width 5 [get_debug_ports u_ila_0/probe33]
connect_debug_port u_ila_0/probe33 [get_nets [list {Uart/RxPointer[0]} {Uart/RxPointer[1]} {Uart/RxPointer[2]} {Uart/RxPointer[3]} {Uart/RxPointer[4]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe34]
set_property port_width 8 [get_debug_ports u_ila_0/probe34]
connect_debug_port u_ila_0/probe34 [get_nets [list {Uart/RxCommand[1]_8[0]} {Uart/RxCommand[1]_8[1]} {Uart/RxCommand[1]_8[2]} {Uart/RxCommand[1]_8[3]} {Uart/RxCommand[1]_8[4]} {Uart/RxCommand[1]_8[5]} {Uart/RxCommand[1]_8[6]} {Uart/RxCommand[1]_8[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe35]
set_property port_width 8 [get_debug_ports u_ila_0/probe35]
connect_debug_port u_ila_0/probe35 [get_nets [list {Uart/RxBuffer[31]_34[0]} {Uart/RxBuffer[31]_34[1]} {Uart/RxBuffer[31]_34[2]} {Uart/RxBuffer[31]_34[3]} {Uart/RxBuffer[31]_34[4]} {Uart/RxBuffer[31]_34[5]} {Uart/RxBuffer[31]_34[6]} {Uart/RxBuffer[31]_34[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe36]
set_property port_width 5 [get_debug_ports u_ila_0/probe36]
connect_debug_port u_ila_0/probe36 [get_nets [list {Uart/Selects[0][0]} {Uart/Selects[0][1]} {Uart/Selects[0][2]} {Uart/Selects[0][3]} {Uart/Selects[0][4]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe37]
set_property port_width 5 [get_debug_ports u_ila_0/probe37]
connect_debug_port u_ila_0/probe37 [get_nets [list {Uart/Selects[12][0]} {Uart/Selects[12][1]} {Uart/Selects[12][2]} {Uart/Selects[12][3]} {Uart/Selects[12][4]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe38]
set_property port_width 5 [get_debug_ports u_ila_0/probe38]
connect_debug_port u_ila_0/probe38 [get_nets [list {Uart/Selects[13][0]} {Uart/Selects[13][1]} {Uart/Selects[13][2]} {Uart/Selects[13][3]} {Uart/Selects[13][4]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe39]
set_property port_width 8 [get_debug_ports u_ila_0/probe39]
connect_debug_port u_ila_0/probe39 [get_nets [list {Uart/RxCommand[3]_4[0]} {Uart/RxCommand[3]_4[1]} {Uart/RxCommand[3]_4[2]} {Uart/RxCommand[3]_4[3]} {Uart/RxCommand[3]_4[4]} {Uart/RxCommand[3]_4[5]} {Uart/RxCommand[3]_4[6]} {Uart/RxCommand[3]_4[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe40]
set_property port_width 8 [get_debug_ports u_ila_0/probe40]
connect_debug_port u_ila_0/probe40 [get_nets [list {Uart/RxBuffer[7]_5[0]} {Uart/RxBuffer[7]_5[1]} {Uart/RxBuffer[7]_5[2]} {Uart/RxBuffer[7]_5[3]} {Uart/RxBuffer[7]_5[4]} {Uart/RxBuffer[7]_5[5]} {Uart/RxBuffer[7]_5[6]} {Uart/RxBuffer[7]_5[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe41]
set_property port_width 5 [get_debug_ports u_ila_0/probe41]
connect_debug_port u_ila_0/probe41 [get_nets [list {Uart/Selects[7][0]} {Uart/Selects[7][1]} {Uart/Selects[7][2]} {Uart/Selects[7][3]} {Uart/Selects[7][4]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe42]
set_property port_width 8 [get_debug_ports u_ila_0/probe42]
connect_debug_port u_ila_0/probe42 [get_nets [list {Uart/RxCommand[4]_2[0]} {Uart/RxCommand[4]_2[1]} {Uart/RxCommand[4]_2[2]} {Uart/RxCommand[4]_2[3]} {Uart/RxCommand[4]_2[4]} {Uart/RxCommand[4]_2[5]} {Uart/RxCommand[4]_2[6]} {Uart/RxCommand[4]_2[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe43]
set_property port_width 5 [get_debug_ports u_ila_0/probe43]
connect_debug_port u_ila_0/probe43 [get_nets [list {Uart/Selects[10][0]} {Uart/Selects[10][1]} {Uart/Selects[10][2]} {Uart/Selects[10][3]} {Uart/Selects[10][4]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe44]
set_property port_width 5 [get_debug_ports u_ila_0/probe44]
connect_debug_port u_ila_0/probe44 [get_nets [list {Uart/Selects[8][0]} {Uart/Selects[8][1]} {Uart/Selects[8][2]} {Uart/Selects[8][3]} {Uart/Selects[8][4]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe45]
set_property port_width 5 [get_debug_ports u_ila_0/probe45]
connect_debug_port u_ila_0/probe45 [get_nets [list {Uart/Selects[11][0]} {Uart/Selects[11][1]} {Uart/Selects[11][2]} {Uart/Selects[11][3]} {Uart/Selects[11][4]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe46]
set_property port_width 5 [get_debug_ports u_ila_0/probe46]
connect_debug_port u_ila_0/probe46 [get_nets [list {Uart/Selects[15][0]} {Uart/Selects[15][1]} {Uart/Selects[15][2]} {Uart/Selects[15][3]} {Uart/Selects[15][4]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe47]
set_property port_width 5 [get_debug_ports u_ila_0/probe47]
connect_debug_port u_ila_0/probe47 [get_nets [list {Uart/Selects[1][0]} {Uart/Selects[1][1]} {Uart/Selects[1][2]} {Uart/Selects[1][3]} {Uart/Selects[1][4]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe48]
set_property port_width 5 [get_debug_ports u_ila_0/probe48]
connect_debug_port u_ila_0/probe48 [get_nets [list {Uart/Selects[6][0]} {Uart/Selects[6][1]} {Uart/Selects[6][2]} {Uart/Selects[6][3]} {Uart/Selects[6][4]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe49]
set_property port_width 8 [get_debug_ports u_ila_0/probe49]
connect_debug_port u_ila_0/probe49 [get_nets [list {Uart/RxBuffer[6]_7[0]} {Uart/RxBuffer[6]_7[1]} {Uart/RxBuffer[6]_7[2]} {Uart/RxBuffer[6]_7[3]} {Uart/RxBuffer[6]_7[4]} {Uart/RxBuffer[6]_7[5]} {Uart/RxBuffer[6]_7[6]} {Uart/RxBuffer[6]_7[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe50]
set_property port_width 8 [get_debug_ports u_ila_0/probe50]
connect_debug_port u_ila_0/probe50 [get_nets [list {Uart/RxBuffer[9]_1[0]} {Uart/RxBuffer[9]_1[1]} {Uart/RxBuffer[9]_1[2]} {Uart/RxBuffer[9]_1[3]} {Uart/RxBuffer[9]_1[4]} {Uart/RxBuffer[9]_1[5]} {Uart/RxBuffer[9]_1[6]} {Uart/RxBuffer[9]_1[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe51]
set_property port_width 8 [get_debug_ports u_ila_0/probe51]
connect_debug_port u_ila_0/probe51 [get_nets [list {Uart/RxBuffer[5]_12[0]} {Uart/RxBuffer[5]_12[1]} {Uart/RxBuffer[5]_12[2]} {Uart/RxBuffer[5]_12[3]} {Uart/RxBuffer[5]_12[4]} {Uart/RxBuffer[5]_12[5]} {Uart/RxBuffer[5]_12[6]} {Uart/RxBuffer[5]_12[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe52]
set_property port_width 8 [get_debug_ports u_ila_0/probe52]
connect_debug_port u_ila_0/probe52 [get_nets [list {Uart/RxBuffer[8]_3[0]} {Uart/RxBuffer[8]_3[1]} {Uart/RxBuffer[8]_3[2]} {Uart/RxBuffer[8]_3[3]} {Uart/RxBuffer[8]_3[4]} {Uart/RxBuffer[8]_3[5]} {Uart/RxBuffer[8]_3[6]} {Uart/RxBuffer[8]_3[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe53]
set_property port_width 8 [get_debug_ports u_ila_0/probe53]
connect_debug_port u_ila_0/probe53 [get_nets [list {Uart/RxBuffer[3]_10[0]} {Uart/RxBuffer[3]_10[1]} {Uart/RxBuffer[3]_10[2]} {Uart/RxBuffer[3]_10[3]} {Uart/RxBuffer[3]_10[4]} {Uart/RxBuffer[3]_10[5]} {Uart/RxBuffer[3]_10[6]} {Uart/RxBuffer[3]_10[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe54]
set_property port_width 5 [get_debug_ports u_ila_0/probe54]
connect_debug_port u_ila_0/probe54 [get_nets [list {Uart/Selects[9][0]} {Uart/Selects[9][1]} {Uart/Selects[9][2]} {Uart/Selects[9][3]} {Uart/Selects[9][4]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe55]
set_property port_width 4 [get_debug_ports u_ila_0/probe55]
connect_debug_port u_ila_0/probe55 [get_nets [list {Uart/SubMode[0]} {Uart/SubMode[1]} {Uart/SubMode[2]} {Uart/SubMode[3]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe56]
set_property port_width 16 [get_debug_ports u_ila_0/probe56]
connect_debug_port u_ila_0/probe56 [get_nets [list {ClkOut_OBUF[0]} {ClkOut_OBUF[1]} {ClkOut_OBUF[2]} {ClkOut_OBUF[3]} {ClkOut_OBUF[4]} {ClkOut_OBUF[5]} {ClkOut_OBUF[6]} {ClkOut_OBUF[7]} {ClkOut_OBUF[8]} {ClkOut_OBUF[9]} {ClkOut_OBUF[10]} {ClkOut_OBUF[11]} {ClkOut_OBUF[12]} {ClkOut_OBUF[13]} {ClkOut_OBUF[14]} {ClkOut_OBUF[15]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe57]
set_property port_width 8 [get_debug_ports u_ila_0/probe57]
connect_debug_port u_ila_0/probe57 [get_nets [list {Uart/rdata[0]} {Uart/rdata[1]} {Uart/rdata[2]} {Uart/rdata[3]} {Uart/rdata[4]} {Uart/rdata[5]} {Uart/rdata[6]} {Uart/rdata[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe58]
set_property port_width 16 [get_debug_ports u_ila_0/probe58]
connect_debug_port u_ila_0/probe58 [get_nets [list {LtxCount[0]} {LtxCount[1]} {LtxCount[2]} {LtxCount[3]} {LtxCount[4]} {LtxCount[5]} {LtxCount[6]} {LtxCount[7]} {LtxCount[8]} {LtxCount[9]} {LtxCount[10]} {LtxCount[11]} {LtxCount[12]} {LtxCount[13]} {LtxCount[14]} {LtxCount[15]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe59]
set_property port_width 24 [get_debug_ports u_ila_0/probe59]
connect_debug_port u_ila_0/probe59 [get_nets [list {DataInFF[0]} {DataInFF[1]} {DataInFF[2]} {DataInFF[3]} {DataInFF[4]} {DataInFF[5]} {DataInFF[6]} {DataInFF[7]} {DataInFF[8]} {DataInFF[9]} {DataInFF[10]} {DataInFF[11]} {DataInFF[12]} {DataInFF[13]} {DataInFF[14]} {DataInFF[15]} {DataInFF[16]} {DataInFF[17]} {DataInFF[18]} {DataInFF[19]} {DataInFF[20]} {DataInFF[21]} {DataInFF[22]} {DataInFF[23]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe60]
set_property port_width 1 [get_debug_ports u_ila_0/probe60]
connect_debug_port u_ila_0/probe60 [get_nets [list Rxd_IBUF]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe61]
set_property port_width 1 [get_debug_ports u_ila_0/probe61]
connect_debug_port u_ila_0/probe61 [get_nets [list Txd_OBUF]]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets O_BUFG]