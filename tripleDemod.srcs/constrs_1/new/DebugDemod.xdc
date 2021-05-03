

create_debug_core u_ila_0 ila
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_0]
set_property ALL_PROBE_SAME_MU_CNT 4 [get_debug_cores u_ila_0]
set_property C_ADV_TRIGGER true [get_debug_cores u_ila_0]
set_property C_DATA_DEPTH 4096 [get_debug_cores u_ila_0]
set_property C_EN_STRG_QUAL true [get_debug_cores u_ila_0]
set_property C_INPUT_PIPE_STAGES 2 [get_debug_cores u_ila_0]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_0]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_0]
set_property port_width 1 [get_debug_ports u_ila_0/clk]
connect_debug_port u_ila_0/clk [get_nets [list systemClock/inst/clk_out1]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe0]
set_property port_width 8 [get_debug_ports u_ila_0/probe0]
connect_debug_port u_ila_0/probe0 [get_nets [list {combinerOut/Ch1SerDes/TxData[4][0]} {combinerOut/Ch1SerDes/TxData[4][1]} {combinerOut/Ch1SerDes/TxData[4][2]} {combinerOut/Ch1SerDes/TxData[4][3]} {combinerOut/Ch1SerDes/TxData[4][4]} {combinerOut/Ch1SerDes/TxData[4][5]} {combinerOut/Ch1SerDes/TxData[4][6]} {combinerOut/Ch1SerDes/TxData[4][7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe1]
set_property port_width 8 [get_debug_ports u_ila_0/probe1]
connect_debug_port u_ila_0/probe1 [get_nets [list {combinerOut/Ch1SerDes/TxData[3][0]} {combinerOut/Ch1SerDes/TxData[3][1]} {combinerOut/Ch1SerDes/TxData[3][2]} {combinerOut/Ch1SerDes/TxData[3][3]} {combinerOut/Ch1SerDes/TxData[3][4]} {combinerOut/Ch1SerDes/TxData[3][5]} {combinerOut/Ch1SerDes/TxData[3][6]} {combinerOut/Ch1SerDes/TxData[3][7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe2]
set_property port_width 8 [get_debug_ports u_ila_0/probe2]
connect_debug_port u_ila_0/probe2 [get_nets [list {combinerOut/Ch1SerDes/TxData[2][0]} {combinerOut/Ch1SerDes/TxData[2][1]} {combinerOut/Ch1SerDes/TxData[2][2]} {combinerOut/Ch1SerDes/TxData[2][3]} {combinerOut/Ch1SerDes/TxData[2][4]} {combinerOut/Ch1SerDes/TxData[2][5]} {combinerOut/Ch1SerDes/TxData[2][6]} {combinerOut/Ch1SerDes/TxData[2][7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe3]
set_property port_width 8 [get_debug_ports u_ila_0/probe3]
connect_debug_port u_ila_0/probe3 [get_nets [list {combinerOut/Ch1SerDes/TxData[1][0]} {combinerOut/Ch1SerDes/TxData[1][1]} {combinerOut/Ch1SerDes/TxData[1][2]} {combinerOut/Ch1SerDes/TxData[1][3]} {combinerOut/Ch1SerDes/TxData[1][4]} {combinerOut/Ch1SerDes/TxData[1][5]} {combinerOut/Ch1SerDes/TxData[1][6]} {combinerOut/Ch1SerDes/TxData[1][7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe4]
set_property port_width 8 [get_debug_ports u_ila_0/probe4]
connect_debug_port u_ila_0/probe4 [get_nets [list {combinerOut/Ch1SerDes/TxData[0][0]} {combinerOut/Ch1SerDes/TxData[0][1]} {combinerOut/Ch1SerDes/TxData[0][2]} {combinerOut/Ch1SerDes/TxData[0][3]} {combinerOut/Ch1SerDes/TxData[0][4]} {combinerOut/Ch1SerDes/TxData[0][5]} {combinerOut/Ch1SerDes/TxData[0][6]} {combinerOut/Ch1SerDes/TxData[0][7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe5]
set_property port_width 6 [get_debug_ports u_ila_0/probe5]
connect_debug_port u_ila_0/probe5 [get_nets [list {combinerOut/Ch1SerDes/SyncRst[0]} {combinerOut/Ch1SerDes/SyncRst[1]} {combinerOut/Ch1SerDes/SyncRst[2]} {combinerOut/Ch1SerDes/SyncRst[3]} {combinerOut/Ch1SerDes/SyncRst[4]} {combinerOut/Ch1SerDes/SyncRst[5]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe6]
set_property port_width 6 [get_debug_ports u_ila_0/probe6]
connect_debug_port u_ila_0/probe6 [get_nets [list {combinerOut/Ch2SerDes/SyncRst[0]} {combinerOut/Ch2SerDes/SyncRst[1]} {combinerOut/Ch2SerDes/SyncRst[2]} {combinerOut/Ch2SerDes/SyncRst[3]} {combinerOut/Ch2SerDes/SyncRst[4]} {combinerOut/Ch2SerDes/SyncRst[5]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe7]
set_property port_width 8 [get_debug_ports u_ila_0/probe7]
connect_debug_port u_ila_0/probe7 [get_nets [list {combinerOut/Ch2SerDes/TxData[0][0]} {combinerOut/Ch2SerDes/TxData[0][1]} {combinerOut/Ch2SerDes/TxData[0][2]} {combinerOut/Ch2SerDes/TxData[0][3]} {combinerOut/Ch2SerDes/TxData[0][4]} {combinerOut/Ch2SerDes/TxData[0][5]} {combinerOut/Ch2SerDes/TxData[0][6]} {combinerOut/Ch2SerDes/TxData[0][7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe8]
set_property port_width 8 [get_debug_ports u_ila_0/probe8]
connect_debug_port u_ila_0/probe8 [get_nets [list {combinerOut/Ch2SerDes/TxData[1][0]} {combinerOut/Ch2SerDes/TxData[1][1]} {combinerOut/Ch2SerDes/TxData[1][2]} {combinerOut/Ch2SerDes/TxData[1][3]} {combinerOut/Ch2SerDes/TxData[1][4]} {combinerOut/Ch2SerDes/TxData[1][5]} {combinerOut/Ch2SerDes/TxData[1][6]} {combinerOut/Ch2SerDes/TxData[1][7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe9]
set_property port_width 8 [get_debug_ports u_ila_0/probe9]
connect_debug_port u_ila_0/probe9 [get_nets [list {combinerOut/Ch2SerDes/TxData[2][0]} {combinerOut/Ch2SerDes/TxData[2][1]} {combinerOut/Ch2SerDes/TxData[2][2]} {combinerOut/Ch2SerDes/TxData[2][3]} {combinerOut/Ch2SerDes/TxData[2][4]} {combinerOut/Ch2SerDes/TxData[2][5]} {combinerOut/Ch2SerDes/TxData[2][6]} {combinerOut/Ch2SerDes/TxData[2][7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe10]
set_property port_width 8 [get_debug_ports u_ila_0/probe10]
connect_debug_port u_ila_0/probe10 [get_nets [list {combinerOut/Ch2SerDes/TxData[3][0]} {combinerOut/Ch2SerDes/TxData[3][1]} {combinerOut/Ch2SerDes/TxData[3][2]} {combinerOut/Ch2SerDes/TxData[3][3]} {combinerOut/Ch2SerDes/TxData[3][4]} {combinerOut/Ch2SerDes/TxData[3][5]} {combinerOut/Ch2SerDes/TxData[3][6]} {combinerOut/Ch2SerDes/TxData[3][7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe11]
set_property port_width 8 [get_debug_ports u_ila_0/probe11]
connect_debug_port u_ila_0/probe11 [get_nets [list {combinerOut/Ch2SerDes/TxData[4][0]} {combinerOut/Ch2SerDes/TxData[4][1]} {combinerOut/Ch2SerDes/TxData[4][2]} {combinerOut/Ch2SerDes/TxData[4][3]} {combinerOut/Ch2SerDes/TxData[4][4]} {combinerOut/Ch2SerDes/TxData[4][5]} {combinerOut/Ch2SerDes/TxData[4][6]} {combinerOut/Ch2SerDes/TxData[4][7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe12]
set_property port_width 18 [get_debug_ports u_ila_0/probe12]
connect_debug_port u_ila_0/probe12 [get_nets [list {demod/iDdc[0]} {demod/iDdc[1]} {demod/iDdc[2]} {demod/iDdc[3]} {demod/iDdc[4]} {demod/iDdc[5]} {demod/iDdc[6]} {demod/iDdc[7]} {demod/iDdc[8]} {demod/iDdc[9]} {demod/iDdc[10]} {demod/iDdc[11]} {demod/iDdc[12]} {demod/iDdc[13]} {demod/iDdc[14]} {demod/iDdc[15]} {demod/iDdc[16]} {demod/iDdc[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe13]
set_property port_width 18 [get_debug_ports u_ila_0/probe13]
connect_debug_port u_ila_0/probe13 [get_nets [list {demod/qDdc[0]} {demod/qDdc[1]} {demod/qDdc[2]} {demod/qDdc[3]} {demod/qDdc[4]} {demod/qDdc[5]} {demod/qDdc[6]} {demod/qDdc[7]} {demod/qDdc[8]} {demod/qDdc[9]} {demod/qDdc[10]} {demod/qDdc[11]} {demod/qDdc[12]} {demod/qDdc[13]} {demod/qDdc[14]} {demod/qDdc[15]} {demod/qDdc[16]} {demod/qDdc[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe14]
set_property port_width 14 [get_debug_ports u_ila_0/probe14]
connect_debug_port u_ila_0/probe14 [get_nets [list {adc0In[4]} {adc0In[5]} {adc0In[6]} {adc0In[7]} {adc0In[8]} {adc0In[9]} {adc0In[10]} {adc0In[11]} {adc0In[12]} {adc0In[13]} {adc0In[14]} {adc0In[15]} {adc0In[16]} {adc0In[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe15]
set_property port_width 1 [get_debug_ports u_ila_0/probe15]
connect_debug_port u_ila_0/probe15 [get_nets [list iDemodBit]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe16]
set_property port_width 1 [get_debug_ports u_ila_0/probe16]
connect_debug_port u_ila_0/probe16 [get_nets [list iDemodBitEn]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe17]
set_property port_width 1 [get_debug_ports u_ila_0/probe17]
connect_debug_port u_ila_0/probe17 [get_nets [list combinerOut/Ch2SerDes/LockPll]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe18]
set_property port_width 1 [get_debug_ports u_ila_0/probe18]
connect_debug_port u_ila_0/probe18 [get_nets [list combinerOut/Ch1SerDes/LockPll]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe19]
set_property port_width 1 [get_debug_ports u_ila_0/probe19]
connect_debug_port u_ila_0/probe19 [get_nets [list qDemodBit]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe20]
set_property port_width 1 [get_debug_ports u_ila_0/probe20]
connect_debug_port u_ila_0/probe20 [get_nets [list qDemodBitEn]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe21]
set_property port_width 1 [get_debug_ports u_ila_0/probe21]
connect_debug_port u_ila_0/probe21 [get_nets [list combinerOut/Ch2SerDes/Reset]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe22]
set_property port_width 1 [get_debug_ports u_ila_0/probe22]
connect_debug_port u_ila_0/probe22 [get_nets [list combinerOut/Ch1SerDes/Reset]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe23]
set_property port_width 1 [get_debug_ports u_ila_0/probe23]
connect_debug_port u_ila_0/probe23 [get_nets [list demod/demodCarrierLock]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe24]
set_property port_width 1 [get_debug_ports u_ila_0/probe24]
connect_debug_port u_ila_0/probe24 [get_nets [list demod/demodTimingLock]]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets dac1_clk_OBUF]
