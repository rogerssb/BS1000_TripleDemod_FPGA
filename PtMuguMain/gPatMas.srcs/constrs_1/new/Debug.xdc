


set_property OFFCHIP_TERM NONE [get_ports Txd]
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
connect_debug_port u_ila_0/clk [get_nets [list O_BUFG]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe0]
set_property port_width 8 [get_debug_ports u_ila_0/probe0]
connect_debug_port u_ila_0/probe0 [get_nets [list {Uart/RxBuffer[3][0]} {Uart/RxBuffer[3][1]} {Uart/RxBuffer[3][2]} {Uart/RxBuffer[3][3]} {Uart/RxBuffer[3][4]} {Uart/RxBuffer[3][5]} {Uart/RxBuffer[3][6]} {Uart/RxBuffer[3][7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe1]
set_property port_width 32 [get_debug_ports u_ila_0/probe1]
connect_debug_port u_ila_0/probe1 [get_nets [list {Uart/MyInt[0]} {Uart/MyInt[1]} {Uart/MyInt[2]} {Uart/MyInt[3]} {Uart/MyInt[4]} {Uart/MyInt[5]} {Uart/MyInt[6]} {Uart/MyInt[7]} {Uart/MyInt[8]} {Uart/MyInt[9]} {Uart/MyInt[10]} {Uart/MyInt[11]} {Uart/MyInt[12]} {Uart/MyInt[13]} {Uart/MyInt[14]} {Uart/MyInt[15]} {Uart/MyInt[16]} {Uart/MyInt[17]} {Uart/MyInt[18]} {Uart/MyInt[19]} {Uart/MyInt[20]} {Uart/MyInt[21]} {Uart/MyInt[22]} {Uart/MyInt[23]} {Uart/MyInt[24]} {Uart/MyInt[25]} {Uart/MyInt[26]} {Uart/MyInt[27]} {Uart/MyInt[28]} {Uart/MyInt[29]} {Uart/MyInt[30]} {Uart/MyInt[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe2]
set_property port_width 8 [get_debug_ports u_ila_0/probe2]
connect_debug_port u_ila_0/probe2 [get_nets [list {Uart/RxBuffer[26][0]} {Uart/RxBuffer[26][1]} {Uart/RxBuffer[26][2]} {Uart/RxBuffer[26][3]} {Uart/RxBuffer[26][4]} {Uart/RxBuffer[26][5]} {Uart/RxBuffer[26][6]} {Uart/RxBuffer[26][7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe3]
set_property port_width 8 [get_debug_ports u_ila_0/probe3]
connect_debug_port u_ila_0/probe3 [get_nets [list {Uart/RxBuffer[4][0]} {Uart/RxBuffer[4][1]} {Uart/RxBuffer[4][2]} {Uart/RxBuffer[4][3]} {Uart/RxBuffer[4][4]} {Uart/RxBuffer[4][5]} {Uart/RxBuffer[4][6]} {Uart/RxBuffer[4][7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe4]
set_property port_width 8 [get_debug_ports u_ila_0/probe4]
connect_debug_port u_ila_0/probe4 [get_nets [list {Uart/RxBuffer[11][0]} {Uart/RxBuffer[11][1]} {Uart/RxBuffer[11][2]} {Uart/RxBuffer[11][3]} {Uart/RxBuffer[11][4]} {Uart/RxBuffer[11][5]} {Uart/RxBuffer[11][6]} {Uart/RxBuffer[11][7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe5]
set_property port_width 8 [get_debug_ports u_ila_0/probe5]
connect_debug_port u_ila_0/probe5 [get_nets [list {Uart/RxBuffer[5][0]} {Uart/RxBuffer[5][1]} {Uart/RxBuffer[5][2]} {Uart/RxBuffer[5][3]} {Uart/RxBuffer[5][4]} {Uart/RxBuffer[5][5]} {Uart/RxBuffer[5][6]} {Uart/RxBuffer[5][7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe6]
set_property port_width 64 [get_debug_ports u_ila_0/probe6]
connect_debug_port u_ila_0/probe6 [get_nets [list {Uart/MyHex[0]} {Uart/MyHex[1]} {Uart/MyHex[2]} {Uart/MyHex[3]} {Uart/MyHex[4]} {Uart/MyHex[5]} {Uart/MyHex[6]} {Uart/MyHex[7]} {Uart/MyHex[8]} {Uart/MyHex[9]} {Uart/MyHex[10]} {Uart/MyHex[11]} {Uart/MyHex[12]} {Uart/MyHex[13]} {Uart/MyHex[14]} {Uart/MyHex[15]} {Uart/MyHex[16]} {Uart/MyHex[17]} {Uart/MyHex[18]} {Uart/MyHex[19]} {Uart/MyHex[20]} {Uart/MyHex[21]} {Uart/MyHex[22]} {Uart/MyHex[23]} {Uart/MyHex[24]} {Uart/MyHex[25]} {Uart/MyHex[26]} {Uart/MyHex[27]} {Uart/MyHex[28]} {Uart/MyHex[29]} {Uart/MyHex[30]} {Uart/MyHex[31]} {Uart/MyHex[32]} {Uart/MyHex[33]} {Uart/MyHex[34]} {Uart/MyHex[35]} {Uart/MyHex[36]} {Uart/MyHex[37]} {Uart/MyHex[38]} {Uart/MyHex[39]} {Uart/MyHex[40]} {Uart/MyHex[41]} {Uart/MyHex[42]} {Uart/MyHex[43]} {Uart/MyHex[44]} {Uart/MyHex[45]} {Uart/MyHex[46]} {Uart/MyHex[47]} {Uart/MyHex[48]} {Uart/MyHex[49]} {Uart/MyHex[50]} {Uart/MyHex[51]} {Uart/MyHex[52]} {Uart/MyHex[53]} {Uart/MyHex[54]} {Uart/MyHex[55]} {Uart/MyHex[56]} {Uart/MyHex[57]} {Uart/MyHex[58]} {Uart/MyHex[59]} {Uart/MyHex[60]} {Uart/MyHex[61]} {Uart/MyHex[62]} {Uart/MyHex[63]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe7]
set_property port_width 8 [get_debug_ports u_ila_0/probe7]
connect_debug_port u_ila_0/probe7 [get_nets [list {Uart/RxBuffer[13][0]} {Uart/RxBuffer[13][1]} {Uart/RxBuffer[13][2]} {Uart/RxBuffer[13][3]} {Uart/RxBuffer[13][4]} {Uart/RxBuffer[13][5]} {Uart/RxBuffer[13][6]} {Uart/RxBuffer[13][7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe8]
set_property port_width 8 [get_debug_ports u_ila_0/probe8]
connect_debug_port u_ila_0/probe8 [get_nets [list {Uart/RxBuffer[17][0]} {Uart/RxBuffer[17][1]} {Uart/RxBuffer[17][2]} {Uart/RxBuffer[17][3]} {Uart/RxBuffer[17][4]} {Uart/RxBuffer[17][5]} {Uart/RxBuffer[17][6]} {Uart/RxBuffer[17][7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe9]
set_property port_width 8 [get_debug_ports u_ila_0/probe9]
connect_debug_port u_ila_0/probe9 [get_nets [list {Uart/RxBuffer[21][0]} {Uart/RxBuffer[21][1]} {Uart/RxBuffer[21][2]} {Uart/RxBuffer[21][3]} {Uart/RxBuffer[21][4]} {Uart/RxBuffer[21][5]} {Uart/RxBuffer[21][6]} {Uart/RxBuffer[21][7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe10]
set_property port_width 8 [get_debug_ports u_ila_0/probe10]
connect_debug_port u_ila_0/probe10 [get_nets [list {Uart/RxBuffer[23][0]} {Uart/RxBuffer[23][1]} {Uart/RxBuffer[23][2]} {Uart/RxBuffer[23][3]} {Uart/RxBuffer[23][4]} {Uart/RxBuffer[23][5]} {Uart/RxBuffer[23][6]} {Uart/RxBuffer[23][7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe11]
set_property port_width 8 [get_debug_ports u_ila_0/probe11]
connect_debug_port u_ila_0/probe11 [get_nets [list {Uart/RxBuffer[24][0]} {Uart/RxBuffer[24][1]} {Uart/RxBuffer[24][2]} {Uart/RxBuffer[24][3]} {Uart/RxBuffer[24][4]} {Uart/RxBuffer[24][5]} {Uart/RxBuffer[24][6]} {Uart/RxBuffer[24][7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe12]
set_property port_width 8 [get_debug_ports u_ila_0/probe12]
connect_debug_port u_ila_0/probe12 [get_nets [list {Uart/RxBuffer[29][0]} {Uart/RxBuffer[29][1]} {Uart/RxBuffer[29][2]} {Uart/RxBuffer[29][3]} {Uart/RxBuffer[29][4]} {Uart/RxBuffer[29][5]} {Uart/RxBuffer[29][6]} {Uart/RxBuffer[29][7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe13]
set_property port_width 2 [get_debug_ports u_ila_0/probe13]
connect_debug_port u_ila_0/probe13 [get_nets [list {Uart/Mode[0]} {Uart/Mode[1]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe14]
set_property port_width 8 [get_debug_ports u_ila_0/probe14]
connect_debug_port u_ila_0/probe14 [get_nets [list {Uart/RxBuffer[30][0]} {Uart/RxBuffer[30][1]} {Uart/RxBuffer[30][2]} {Uart/RxBuffer[30][3]} {Uart/RxBuffer[30][4]} {Uart/RxBuffer[30][5]} {Uart/RxBuffer[30][6]} {Uart/RxBuffer[30][7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe15]
set_property port_width 8 [get_debug_ports u_ila_0/probe15]
connect_debug_port u_ila_0/probe15 [get_nets [list {Uart/RxBuffer[15][0]} {Uart/RxBuffer[15][1]} {Uart/RxBuffer[15][2]} {Uart/RxBuffer[15][3]} {Uart/RxBuffer[15][4]} {Uart/RxBuffer[15][5]} {Uart/RxBuffer[15][6]} {Uart/RxBuffer[15][7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe16]
set_property port_width 8 [get_debug_ports u_ila_0/probe16]
connect_debug_port u_ila_0/probe16 [get_nets [list {Uart/RxBuffer[1][0]} {Uart/RxBuffer[1][1]} {Uart/RxBuffer[1][2]} {Uart/RxBuffer[1][3]} {Uart/RxBuffer[1][4]} {Uart/RxBuffer[1][5]} {Uart/RxBuffer[1][6]} {Uart/RxBuffer[1][7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe17]
set_property port_width 8 [get_debug_ports u_ila_0/probe17]
connect_debug_port u_ila_0/probe17 [get_nets [list {Uart/RxBuffer[10][0]} {Uart/RxBuffer[10][1]} {Uart/RxBuffer[10][2]} {Uart/RxBuffer[10][3]} {Uart/RxBuffer[10][4]} {Uart/RxBuffer[10][5]} {Uart/RxBuffer[10][6]} {Uart/RxBuffer[10][7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe18]
set_property port_width 8 [get_debug_ports u_ila_0/probe18]
connect_debug_port u_ila_0/probe18 [get_nets [list {Uart/RxBuffer[12][0]} {Uart/RxBuffer[12][1]} {Uart/RxBuffer[12][2]} {Uart/RxBuffer[12][3]} {Uart/RxBuffer[12][4]} {Uart/RxBuffer[12][5]} {Uart/RxBuffer[12][6]} {Uart/RxBuffer[12][7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe19]
set_property port_width 8 [get_debug_ports u_ila_0/probe19]
connect_debug_port u_ila_0/probe19 [get_nets [list {Uart/RxBuffer[14][0]} {Uart/RxBuffer[14][1]} {Uart/RxBuffer[14][2]} {Uart/RxBuffer[14][3]} {Uart/RxBuffer[14][4]} {Uart/RxBuffer[14][5]} {Uart/RxBuffer[14][6]} {Uart/RxBuffer[14][7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe20]
set_property port_width 8 [get_debug_ports u_ila_0/probe20]
connect_debug_port u_ila_0/probe20 [get_nets [list {Uart/RxBuffer[20][0]} {Uart/RxBuffer[20][1]} {Uart/RxBuffer[20][2]} {Uart/RxBuffer[20][3]} {Uart/RxBuffer[20][4]} {Uart/RxBuffer[20][5]} {Uart/RxBuffer[20][6]} {Uart/RxBuffer[20][7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe21]
set_property port_width 8 [get_debug_ports u_ila_0/probe21]
connect_debug_port u_ila_0/probe21 [get_nets [list {Uart/RxBuffer[31][0]} {Uart/RxBuffer[31][1]} {Uart/RxBuffer[31][2]} {Uart/RxBuffer[31][3]} {Uart/RxBuffer[31][4]} {Uart/RxBuffer[31][5]} {Uart/RxBuffer[31][6]} {Uart/RxBuffer[31][7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe22]
set_property port_width 8 [get_debug_ports u_ila_0/probe22]
connect_debug_port u_ila_0/probe22 [get_nets [list {Uart/RxBuffer[16][0]} {Uart/RxBuffer[16][1]} {Uart/RxBuffer[16][2]} {Uart/RxBuffer[16][3]} {Uart/RxBuffer[16][4]} {Uart/RxBuffer[16][5]} {Uart/RxBuffer[16][6]} {Uart/RxBuffer[16][7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe23]
set_property port_width 8 [get_debug_ports u_ila_0/probe23]
connect_debug_port u_ila_0/probe23 [get_nets [list {Uart/RxBuffer[19][0]} {Uart/RxBuffer[19][1]} {Uart/RxBuffer[19][2]} {Uart/RxBuffer[19][3]} {Uart/RxBuffer[19][4]} {Uart/RxBuffer[19][5]} {Uart/RxBuffer[19][6]} {Uart/RxBuffer[19][7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe24]
set_property port_width 8 [get_debug_ports u_ila_0/probe24]
connect_debug_port u_ila_0/probe24 [get_nets [list {Uart/RxBuffer[22][0]} {Uart/RxBuffer[22][1]} {Uart/RxBuffer[22][2]} {Uart/RxBuffer[22][3]} {Uart/RxBuffer[22][4]} {Uart/RxBuffer[22][5]} {Uart/RxBuffer[22][6]} {Uart/RxBuffer[22][7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe25]
set_property port_width 8 [get_debug_ports u_ila_0/probe25]
connect_debug_port u_ila_0/probe25 [get_nets [list {Uart/RxBuffer[18][0]} {Uart/RxBuffer[18][1]} {Uart/RxBuffer[18][2]} {Uart/RxBuffer[18][3]} {Uart/RxBuffer[18][4]} {Uart/RxBuffer[18][5]} {Uart/RxBuffer[18][6]} {Uart/RxBuffer[18][7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe26]
set_property port_width 8 [get_debug_ports u_ila_0/probe26]
connect_debug_port u_ila_0/probe26 [get_nets [list {Uart/RxBuffer[25][0]} {Uart/RxBuffer[25][1]} {Uart/RxBuffer[25][2]} {Uart/RxBuffer[25][3]} {Uart/RxBuffer[25][4]} {Uart/RxBuffer[25][5]} {Uart/RxBuffer[25][6]} {Uart/RxBuffer[25][7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe27]
set_property port_width 8 [get_debug_ports u_ila_0/probe27]
connect_debug_port u_ila_0/probe27 [get_nets [list {Uart/RxBuffer[27][0]} {Uart/RxBuffer[27][1]} {Uart/RxBuffer[27][2]} {Uart/RxBuffer[27][3]} {Uart/RxBuffer[27][4]} {Uart/RxBuffer[27][5]} {Uart/RxBuffer[27][6]} {Uart/RxBuffer[27][7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe28]
set_property port_width 8 [get_debug_ports u_ila_0/probe28]
connect_debug_port u_ila_0/probe28 [get_nets [list {Uart/RxBuffer[28][0]} {Uart/RxBuffer[28][1]} {Uart/RxBuffer[28][2]} {Uart/RxBuffer[28][3]} {Uart/RxBuffer[28][4]} {Uart/RxBuffer[28][5]} {Uart/RxBuffer[28][6]} {Uart/RxBuffer[28][7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe29]
set_property port_width 8 [get_debug_ports u_ila_0/probe29]
connect_debug_port u_ila_0/probe29 [get_nets [list {Uart/RxBuffer[2][0]} {Uart/RxBuffer[2][1]} {Uart/RxBuffer[2][2]} {Uart/RxBuffer[2][3]} {Uart/RxBuffer[2][4]} {Uart/RxBuffer[2][5]} {Uart/RxBuffer[2][6]} {Uart/RxBuffer[2][7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe30]
set_property port_width 5 [get_debug_ports u_ila_0/probe30]
connect_debug_port u_ila_0/probe30 [get_nets [list {Uart/Selects[9][0]} {Uart/Selects[9][1]} {Uart/Selects[9][2]} {Uart/Selects[9][3]} {Uart/Selects[9][4]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe31]
set_property port_width 8 [get_debug_ports u_ila_0/probe31]
connect_debug_port u_ila_0/probe31 [get_nets [list {Uart/RxBuffer[9][0]} {Uart/RxBuffer[9][1]} {Uart/RxBuffer[9][2]} {Uart/RxBuffer[9][3]} {Uart/RxBuffer[9][4]} {Uart/RxBuffer[9][5]} {Uart/RxBuffer[9][6]} {Uart/RxBuffer[9][7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe32]
set_property port_width 5 [get_debug_ports u_ila_0/probe32]
connect_debug_port u_ila_0/probe32 [get_nets [list {Uart/Selects[15][0]} {Uart/Selects[15][1]} {Uart/Selects[15][2]} {Uart/Selects[15][3]} {Uart/Selects[15][4]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe33]
set_property port_width 8 [get_debug_ports u_ila_0/probe33]
connect_debug_port u_ila_0/probe33 [get_nets [list {Uart/RxBuffer[6][0]} {Uart/RxBuffer[6][1]} {Uart/RxBuffer[6][2]} {Uart/RxBuffer[6][3]} {Uart/RxBuffer[6][4]} {Uart/RxBuffer[6][5]} {Uart/RxBuffer[6][6]} {Uart/RxBuffer[6][7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe34]
set_property port_width 5 [get_debug_ports u_ila_0/probe34]
connect_debug_port u_ila_0/probe34 [get_nets [list {Uart/Selects[11][0]} {Uart/Selects[11][1]} {Uart/Selects[11][2]} {Uart/Selects[11][3]} {Uart/Selects[11][4]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe35]
set_property port_width 5 [get_debug_ports u_ila_0/probe35]
connect_debug_port u_ila_0/probe35 [get_nets [list {Uart/Selects[12][0]} {Uart/Selects[12][1]} {Uart/Selects[12][2]} {Uart/Selects[12][3]} {Uart/Selects[12][4]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe36]
set_property port_width 5 [get_debug_ports u_ila_0/probe36]
connect_debug_port u_ila_0/probe36 [get_nets [list {Uart/Selects[13][0]} {Uart/Selects[13][1]} {Uart/Selects[13][2]} {Uart/Selects[13][3]} {Uart/Selects[13][4]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe37]
set_property port_width 8 [get_debug_ports u_ila_0/probe37]
connect_debug_port u_ila_0/probe37 [get_nets [list {Uart/RxCommand[3][0]} {Uart/RxCommand[3][1]} {Uart/RxCommand[3][2]} {Uart/RxCommand[3][3]} {Uart/RxCommand[3][4]} {Uart/RxCommand[3][5]} {Uart/RxCommand[3][6]} {Uart/RxCommand[3][7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe38]
set_property port_width 5 [get_debug_ports u_ila_0/probe38]
connect_debug_port u_ila_0/probe38 [get_nets [list {Uart/Selects[5][0]} {Uart/Selects[5][1]} {Uart/Selects[5][2]} {Uart/Selects[5][3]} {Uart/Selects[5][4]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe39]
set_property port_width 8 [get_debug_ports u_ila_0/probe39]
connect_debug_port u_ila_0/probe39 [get_nets [list {Uart/RxBuffer[7][0]} {Uart/RxBuffer[7][1]} {Uart/RxBuffer[7][2]} {Uart/RxBuffer[7][3]} {Uart/RxBuffer[7][4]} {Uart/RxBuffer[7][5]} {Uart/RxBuffer[7][6]} {Uart/RxBuffer[7][7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe40]
set_property port_width 8 [get_debug_ports u_ila_0/probe40]
connect_debug_port u_ila_0/probe40 [get_nets [list {Uart/RxCommand[4][0]} {Uart/RxCommand[4][1]} {Uart/RxCommand[4][2]} {Uart/RxCommand[4][3]} {Uart/RxCommand[4][4]} {Uart/RxCommand[4][5]} {Uart/RxCommand[4][6]} {Uart/RxCommand[4][7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe41]
set_property port_width 5 [get_debug_ports u_ila_0/probe41]
connect_debug_port u_ila_0/probe41 [get_nets [list {Uart/Selects[1][0]} {Uart/Selects[1][1]} {Uart/Selects[1][2]} {Uart/Selects[1][3]} {Uart/Selects[1][4]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe42]
set_property port_width 8 [get_debug_ports u_ila_0/probe42]
connect_debug_port u_ila_0/probe42 [get_nets [list {Uart/RxCommand[1][0]} {Uart/RxCommand[1][1]} {Uart/RxCommand[1][2]} {Uart/RxCommand[1][3]} {Uart/RxCommand[1][4]} {Uart/RxCommand[1][5]} {Uart/RxCommand[1][6]} {Uart/RxCommand[1][7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe43]
set_property port_width 5 [get_debug_ports u_ila_0/probe43]
connect_debug_port u_ila_0/probe43 [get_nets [list {Uart/Selects[4][0]} {Uart/Selects[4][1]} {Uart/Selects[4][2]} {Uart/Selects[4][3]} {Uart/Selects[4][4]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe44]
set_property port_width 5 [get_debug_ports u_ila_0/probe44]
connect_debug_port u_ila_0/probe44 [get_nets [list {Uart/Selects[6][0]} {Uart/Selects[6][1]} {Uart/Selects[6][2]} {Uart/Selects[6][3]} {Uart/Selects[6][4]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe45]
set_property port_width 5 [get_debug_ports u_ila_0/probe45]
connect_debug_port u_ila_0/probe45 [get_nets [list {Uart/RxPointer[0]} {Uart/RxPointer[1]} {Uart/RxPointer[2]} {Uart/RxPointer[3]} {Uart/RxPointer[4]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe46]
set_property port_width 5 [get_debug_ports u_ila_0/probe46]
connect_debug_port u_ila_0/probe46 [get_nets [list {Uart/Selects[8][0]} {Uart/Selects[8][1]} {Uart/Selects[8][2]} {Uart/Selects[8][3]} {Uart/Selects[8][4]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe47]
set_property port_width 5 [get_debug_ports u_ila_0/probe47]
connect_debug_port u_ila_0/probe47 [get_nets [list {Uart/Selects[7][0]} {Uart/Selects[7][1]} {Uart/Selects[7][2]} {Uart/Selects[7][3]} {Uart/Selects[7][4]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe48]
set_property port_width 5 [get_debug_ports u_ila_0/probe48]
connect_debug_port u_ila_0/probe48 [get_nets [list {Uart/Selects[0][0]} {Uart/Selects[0][1]} {Uart/Selects[0][2]} {Uart/Selects[0][3]} {Uart/Selects[0][4]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe49]
set_property port_width 5 [get_debug_ports u_ila_0/probe49]
connect_debug_port u_ila_0/probe49 [get_nets [list {Uart/Selects[3][0]} {Uart/Selects[3][1]} {Uart/Selects[3][2]} {Uart/Selects[3][3]} {Uart/Selects[3][4]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe50]
set_property port_width 4 [get_debug_ports u_ila_0/probe50]
connect_debug_port u_ila_0/probe50 [get_nets [list {Uart/SubMode[0]} {Uart/SubMode[1]} {Uart/SubMode[2]} {Uart/SubMode[3]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe51]
set_property port_width 8 [get_debug_ports u_ila_0/probe51]
connect_debug_port u_ila_0/probe51 [get_nets [list {Uart/RxBuffer[8][0]} {Uart/RxBuffer[8][1]} {Uart/RxBuffer[8][2]} {Uart/RxBuffer[8][3]} {Uart/RxBuffer[8][4]} {Uart/RxBuffer[8][5]} {Uart/RxBuffer[8][6]} {Uart/RxBuffer[8][7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe52]
set_property port_width 8 [get_debug_ports u_ila_0/probe52]
connect_debug_port u_ila_0/probe52 [get_nets [list {Uart/RxCommand[2][0]} {Uart/RxCommand[2][1]} {Uart/RxCommand[2][2]} {Uart/RxCommand[2][3]} {Uart/RxCommand[2][4]} {Uart/RxCommand[2][5]} {Uart/RxCommand[2][6]} {Uart/RxCommand[2][7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe53]
set_property port_width 5 [get_debug_ports u_ila_0/probe53]
connect_debug_port u_ila_0/probe53 [get_nets [list {Uart/Selects[10][0]} {Uart/Selects[10][1]} {Uart/Selects[10][2]} {Uart/Selects[10][3]} {Uart/Selects[10][4]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe54]
set_property port_width 5 [get_debug_ports u_ila_0/probe54]
connect_debug_port u_ila_0/probe54 [get_nets [list {Uart/Selects[14][0]} {Uart/Selects[14][1]} {Uart/Selects[14][2]} {Uart/Selects[14][3]} {Uart/Selects[14][4]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe55]
set_property port_width 5 [get_debug_ports u_ila_0/probe55]
connect_debug_port u_ila_0/probe55 [get_nets [list {Uart/Selects[2][0]} {Uart/Selects[2][1]} {Uart/Selects[2][2]} {Uart/Selects[2][3]} {Uart/Selects[2][4]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe56]
set_property port_width 24 [get_debug_ports u_ila_0/probe56]
connect_debug_port u_ila_0/probe56 [get_nets [list {LtxCount[0]} {LtxCount[1]} {LtxCount[2]} {LtxCount[3]} {LtxCount[4]} {LtxCount[5]} {LtxCount[6]} {LtxCount[7]} {LtxCount[8]} {LtxCount[9]} {LtxCount[10]} {LtxCount[11]} {LtxCount[12]} {LtxCount[13]} {LtxCount[14]} {LtxCount[15]} {LtxCount[16]} {LtxCount[17]} {LtxCount[18]} {LtxCount[19]} {LtxCount[20]} {LtxCount[21]} {LtxCount[22]} {LtxCount[23]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe57]
set_property port_width 16 [get_debug_ports u_ila_0/probe57]
connect_debug_port u_ila_0/probe57 [get_nets [list {DataOut_OBUF[0]} {DataOut_OBUF[1]} {DataOut_OBUF[2]} {DataOut_OBUF[3]} {DataOut_OBUF[4]} {DataOut_OBUF[5]} {DataOut_OBUF[6]} {DataOut_OBUF[7]} {DataOut_OBUF[8]} {DataOut_OBUF[9]} {DataOut_OBUF[10]} {DataOut_OBUF[11]} {DataOut_OBUF[12]} {DataOut_OBUF[13]} {DataOut_OBUF[14]} {DataOut_OBUF[15]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe58]
set_property port_width 8 [get_debug_ports u_ila_0/probe58]
connect_debug_port u_ila_0/probe58 [get_nets [list {Uart/rdata[0]} {Uart/rdata[1]} {Uart/rdata[2]} {Uart/rdata[3]} {Uart/rdata[4]} {Uart/rdata[5]} {Uart/rdata[6]} {Uart/rdata[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe59]
set_property port_width 16 [get_debug_ports u_ila_0/probe59]
connect_debug_port u_ila_0/probe59 [get_nets [list {ClkOut_OBUF[0]} {ClkOut_OBUF[1]} {ClkOut_OBUF[2]} {ClkOut_OBUF[3]} {ClkOut_OBUF[4]} {ClkOut_OBUF[5]} {ClkOut_OBUF[6]} {ClkOut_OBUF[7]} {ClkOut_OBUF[8]} {ClkOut_OBUF[9]} {ClkOut_OBUF[10]} {ClkOut_OBUF[11]} {ClkOut_OBUF[12]} {ClkOut_OBUF[13]} {ClkOut_OBUF[14]} {ClkOut_OBUF[15]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe60]
set_property port_width 24 [get_debug_ports u_ila_0/probe60]
connect_debug_port u_ila_0/probe60 [get_nets [list {DataInDly[0]} {DataInDly[1]} {DataInDly[2]} {DataInDly[3]} {DataInDly[4]} {DataInDly[5]} {DataInDly[6]} {DataInDly[7]} {DataInDly[8]} {DataInDly[9]} {DataInDly[10]} {DataInDly[11]} {DataInDly[12]} {DataInDly[13]} {DataInDly[14]} {DataInDly[15]} {DataInDly[16]} {DataInDly[17]} {DataInDly[18]} {DataInDly[19]} {DataInDly[20]} {DataInDly[21]} {DataInDly[22]} {DataInDly[23]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe61]
set_property port_width 1 [get_debug_ports u_ila_0/probe61]
connect_debug_port u_ila_0/probe61 [get_nets [list Rxd_IBUF]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe62]
set_property port_width 1 [get_debug_ports u_ila_0/probe62]
connect_debug_port u_ila_0/probe62 [get_nets [list Txd_OBUF]]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets O_BUFG]
