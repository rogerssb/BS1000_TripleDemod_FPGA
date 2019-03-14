



create_debug_core u_ila_0 ila
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_0]
set_property ALL_PROBE_SAME_MU_CNT 4 [get_debug_cores u_ila_0]
set_property C_ADV_TRIGGER true [get_debug_cores u_ila_0]
set_property C_DATA_DEPTH 16384 [get_debug_cores u_ila_0]
set_property C_EN_STRG_QUAL true [get_debug_cores u_ila_0]
set_property C_INPUT_PIPE_STAGES 3 [get_debug_cores u_ila_0]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_0]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_0]
set_property port_width 1 [get_debug_ports u_ila_0/clk]
connect_debug_port u_ila_0/clk [get_nets [list dac2_clk_OBUF]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe0]
set_property port_width 3 [get_debug_ports u_ila_0/probe0]
connect_debug_port u_ila_0/probe0 [get_nets [list {turbo/turbod/ASM/Frame[0]} {turbo/turbod/ASM/Frame[1]} {turbo/turbod/ASM/Frame[2]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe1]
set_property port_width 6 [get_debug_ports u_ila_0/probe1]
connect_debug_port u_ila_0/probe1 [get_nets [list {turbo/turbod/ASM/DataOut[0]} {turbo/turbod/ASM/DataOut[1]} {turbo/turbod/ASM/DataOut[2]} {turbo/turbod/ASM/DataOut[3]} {turbo/turbod/ASM/DataOut[4]} {turbo/turbod/ASM/DataOut[5]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe2]
set_property port_width 2 [get_debug_ports u_ila_0/probe2]
connect_debug_port u_ila_0/probe2 [get_nets [list {turbo/turbod/ASM/Mode[0]} {turbo/turbod/ASM/Mode[1]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe3]
set_property port_width 3 [get_debug_ports u_ila_0/probe3]
connect_debug_port u_ila_0/probe3 [get_nets [list {turbo/turbod/ASM/Rate[0]} {turbo/turbod/ASM/Rate[1]} {turbo/turbod/ASM/Rate[2]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe4]
set_property port_width 7 [get_debug_ports u_ila_0/probe4]
connect_debug_port u_ila_0/probe4 [get_nets [list {turbo/turbod/ASM/MaxCount[0]} {turbo/turbod/ASM/MaxCount[1]} {turbo/turbod/ASM/MaxCount[2]} {turbo/turbod/ASM/MaxCount[3]} {turbo/turbod/ASM/MaxCount[4]} {turbo/turbod/ASM/MaxCount[5]} {turbo/turbod/ASM/MaxCount[6]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe5]
set_property port_width 6 [get_debug_ports u_ila_0/probe5]
connect_debug_port u_ila_0/probe5 [get_nets [list {turbo/turbod/ASM/Data0Dly[0]} {turbo/turbod/ASM/Data0Dly[1]} {turbo/turbod/ASM/Data0Dly[2]} {turbo/turbod/ASM/Data0Dly[3]} {turbo/turbod/ASM/Data0Dly[4]} {turbo/turbod/ASM/Data0Dly[5]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe6]
set_property port_width 6 [get_debug_ports u_ila_0/probe6]
connect_debug_port u_ila_0/probe6 [get_nets [list {turbo/turbod/ASM/Data0[0]} {turbo/turbod/ASM/Data0[1]} {turbo/turbod/ASM/Data0[2]} {turbo/turbod/ASM/Data0[3]} {turbo/turbod/ASM/Data0[4]} {turbo/turbod/ASM/Data0[5]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe7]
set_property port_width 7 [get_debug_ports u_ila_0/probe7]
connect_debug_port u_ila_0/probe7 [get_nets [list {turbo/turbod/ASM/TotalBits[0]} {turbo/turbod/ASM/TotalBits[1]} {turbo/turbod/ASM/TotalBits[2]} {turbo/turbod/ASM/TotalBits[3]} {turbo/turbod/ASM/TotalBits[4]} {turbo/turbod/ASM/TotalBits[5]} {turbo/turbod/ASM/TotalBits[6]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe8]
set_property port_width 16 [get_debug_ports u_ila_0/probe8]
connect_debug_port u_ila_0/probe8 [get_nets [list {turbo/turbod/BerCntr[0]} {turbo/turbod/BerCntr[1]} {turbo/turbod/BerCntr[2]} {turbo/turbod/BerCntr[3]} {turbo/turbod/BerCntr[4]} {turbo/turbod/BerCntr[5]} {turbo/turbod/BerCntr[6]} {turbo/turbod/BerCntr[7]} {turbo/turbod/BerCntr[8]} {turbo/turbod/BerCntr[9]} {turbo/turbod/BerCntr[10]} {turbo/turbod/BerCntr[11]} {turbo/turbod/BerCntr[12]} {turbo/turbod/BerCntr[13]} {turbo/turbod/BerCntr[14]} {turbo/turbod/BerCntr[15]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe9]
set_property port_width 16 [get_debug_ports u_ila_0/probe9]
connect_debug_port u_ila_0/probe9 [get_nets [list {turbo/turbod/BerCount[0]} {turbo/turbod/BerCount[1]} {turbo/turbod/BerCount[2]} {turbo/turbod/BerCount[3]} {turbo/turbod/BerCount[4]} {turbo/turbod/BerCount[5]} {turbo/turbod/BerCount[6]} {turbo/turbod/BerCount[7]} {turbo/turbod/BerCount[8]} {turbo/turbod/BerCount[9]} {turbo/turbod/BerCount[10]} {turbo/turbod/BerCount[11]} {turbo/turbod/BerCount[12]} {turbo/turbod/BerCount[13]} {turbo/turbod/BerCount[14]} {turbo/turbod/BerCount[15]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe10]
set_property port_width 16 [get_debug_ports u_ila_0/probe10]
connect_debug_port u_ila_0/probe10 [get_nets [list {turbo/turbod/ClksPerBit[0]} {turbo/turbod/ClksPerBit[1]} {turbo/turbod/ClksPerBit[2]} {turbo/turbod/ClksPerBit[3]} {turbo/turbod/ClksPerBit[4]} {turbo/turbod/ClksPerBit[5]} {turbo/turbod/ClksPerBit[6]} {turbo/turbod/ClksPerBit[7]} {turbo/turbod/ClksPerBit[8]} {turbo/turbod/ClksPerBit[9]} {turbo/turbod/ClksPerBit[10]} {turbo/turbod/ClksPerBit[11]} {turbo/turbod/ClksPerBit[12]} {turbo/turbod/ClksPerBit[13]} {turbo/turbod/ClksPerBit[14]} {turbo/turbod/ClksPerBit[15]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe11]
set_property port_width 4 [get_debug_ports u_ila_0/probe11]
connect_debug_port u_ila_0/probe11 [get_nets [list {turbo/turbod/IterationCntr[0]} {turbo/turbod/IterationCntr[1]} {turbo/turbod/IterationCntr[2]} {turbo/turbod/IterationCntr[3]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe12]
set_property port_width 1 [get_debug_ports u_ila_0/probe12]
connect_debug_port u_ila_0/probe12 [get_nets [list turbo/turbod/BitOut]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe13]
set_property port_width 1 [get_debug_ports u_ila_0/probe13]
connect_debug_port u_ila_0/probe13 [get_nets [list turbo/turbod/BitOutEn]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe14]
set_property port_width 1 [get_debug_ports u_ila_0/probe14]
connect_debug_port u_ila_0/probe14 [get_nets [list turbo/turbod/BitOutErr]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe15]
set_property port_width 1 [get_debug_ports u_ila_0/probe15]
connect_debug_port u_ila_0/probe15 [get_nets [list turbo/turbod/ASM/InvertEven]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe16]
set_property port_width 1 [get_debug_ports u_ila_0/probe16]
connect_debug_port u_ila_0/probe16 [get_nets [list turbo/turbod/ASM/InvertOdd]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe17]
set_property port_width 1 [get_debug_ports u_ila_0/probe17]
connect_debug_port u_ila_0/probe17 [get_nets [list turbo/turbod/ASM/SyncOut]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe18]
set_property port_width 1 [get_debug_ports u_ila_0/probe18]
connect_debug_port u_ila_0/probe18 [get_nets [list turbo/turbod/SyncOut]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe19]
set_property port_width 1 [get_debug_ports u_ila_0/probe19]
connect_debug_port u_ila_0/probe19 [get_nets [list turbo/turbod/ASM/Valid0]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe20]
set_property port_width 1 [get_debug_ports u_ila_0/probe20]
connect_debug_port u_ila_0/probe20 [get_nets [list turbo/turbod/ASM/Valid1]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe21]
set_property port_width 1 [get_debug_ports u_ila_0/probe21]
connect_debug_port u_ila_0/probe21 [get_nets [list turbo/turbod/ASM/ValidOut]]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets dac2_clk_OBUF]
