create_clock -period 10.700 -name Clk93 -waveform {0.000 5.350} [get_ports Clk93]
create_clock -period 10.000 -name ClkPll -waveform {0.000 5.000} [get_ports ClkPll]

set_false_path -from [get_clocks Clk93] -to [get_clocks ClkPll]
set_false_path -from [get_clocks ClkPll] -to [get_clocks Clk93]

create_generated_clock -name Clk31 -source [get_ports Clk93] -divide_by 3 -add -master_clock Clk93 [get_pins TurboDecTop/Clk31]
set_false_path -from [get_pins {Vio/inst/PROBE_OUT_ALL_INST/G_PROBE_OUT[*].PROBE_OUT*_INST/Probe_out_reg[*]/C}] -to *
set_multicycle_path -setup -from [get_pins TurboDecTop/ASM/*/C] -to [get_pins TurboDecTop/ASM/Count*/D] 2
set_multicycle_path -hold -from [get_pins TurboDecTop/ASM/*/C] -to [get_pins TurboDecTop/ASM/Count*/D] 1

connect_debug_port u_ila_0/clk [get_nets [list Pll2Ref_OBUF_BUFG]]

create_debug_core u_ila_0 ila
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_0]
set_property ALL_PROBE_SAME_MU_CNT 4 [get_debug_cores u_ila_0]
set_property C_ADV_TRIGGER true [get_debug_cores u_ila_0]
set_property C_DATA_DEPTH 1024 [get_debug_cores u_ila_0]
set_property C_EN_STRG_QUAL true [get_debug_cores u_ila_0]
set_property C_INPUT_PIPE_STAGES 3 [get_debug_cores u_ila_0]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_0]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_0]
set_property port_width 1 [get_debug_ports u_ila_0/clk]
connect_debug_port u_ila_0/clk [get_nets [list Pll3Ref_OBUF_BUFG]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe0]
set_property port_width 4 [get_debug_ports u_ila_0/probe0]
connect_debug_port u_ila_0/probe0 [get_nets [list {TurboDecTop/ASM/DataOut[0]} {TurboDecTop/ASM/DataOut[1]} {TurboDecTop/ASM/DataOut[2]} {TurboDecTop/ASM/DataOut[3]}]]
create_debug_core u_ila_1 ila
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_1]
set_property ALL_PROBE_SAME_MU_CNT 4 [get_debug_cores u_ila_1]
set_property C_ADV_TRIGGER true [get_debug_cores u_ila_1]
set_property C_DATA_DEPTH 1024 [get_debug_cores u_ila_1]
set_property C_EN_STRG_QUAL true [get_debug_cores u_ila_1]
set_property C_INPUT_PIPE_STAGES 3 [get_debug_cores u_ila_1]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_1]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_1]
set_property port_width 1 [get_debug_ports u_ila_1/clk]
connect_debug_port u_ila_1/clk [get_nets [list resetBufg]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe0]
set_property port_width 1 [get_debug_ports u_ila_1/probe0]
connect_debug_port u_ila_1/probe0 [get_nets [list SyncOut]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe1]
set_property port_width 8 [get_debug_ports u_ila_0/probe1]
connect_debug_port u_ila_0/probe1 [get_nets [list {TurboDecTop/ASM/MaxCount[0]} {TurboDecTop/ASM/MaxCount[1]} {TurboDecTop/ASM/MaxCount[2]} {TurboDecTop/ASM/MaxCount[3]} {TurboDecTop/ASM/MaxCount[4]} {TurboDecTop/ASM/MaxCount[5]} {TurboDecTop/ASM/MaxCount[6]} {TurboDecTop/ASM/MaxCount[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe2]
set_property port_width 8 [get_debug_ports u_ila_0/probe2]
connect_debug_port u_ila_0/probe2 [get_nets [list {TurboDecTop/ASM/TotalBits[0]} {TurboDecTop/ASM/TotalBits[1]} {TurboDecTop/ASM/TotalBits[2]} {TurboDecTop/ASM/TotalBits[3]} {TurboDecTop/ASM/TotalBits[4]} {TurboDecTop/ASM/TotalBits[5]} {TurboDecTop/ASM/TotalBits[6]} {TurboDecTop/ASM/TotalBits[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe3]
set_property port_width 2 [get_debug_ports u_ila_0/probe3]
connect_debug_port u_ila_0/probe3 [get_nets [list {TurboDecTop/ASM/Mode[0]} {TurboDecTop/ASM/Mode[1]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe4]
set_property port_width 4 [get_debug_ports u_ila_0/probe4]
connect_debug_port u_ila_0/probe4 [get_nets [list {TurboDecTop/Ch0Data[0]} {TurboDecTop/Ch0Data[1]} {TurboDecTop/Ch0Data[2]} {TurboDecTop/Ch0Data[3]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe5]
set_property port_width 12 [get_debug_ports u_ila_0/probe5]
connect_debug_port u_ila_0/probe5 [get_nets [list {TurboDecTop/PCI01[11]} {TurboDecTop/PCI01[10]} {TurboDecTop/PCI01[9]} {TurboDecTop/PCI01[8]} {TurboDecTop/PCI01[7]} {TurboDecTop/PCI01[6]} {TurboDecTop/PCI01[5]} {TurboDecTop/PCI01[4]} {TurboDecTop/PCI01[3]} {TurboDecTop/PCI01[2]} {TurboDecTop/PCI01[1]} {TurboDecTop/PCI01[0]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe6]
set_property port_width 12 [get_debug_ports u_ila_0/probe6]
connect_debug_port u_ila_0/probe6 [get_nets [list {TurboDecTop/EuI_Slv[0]} {TurboDecTop/EuI_Slv[1]} {TurboDecTop/EuI_Slv[2]} {TurboDecTop/EuI_Slv[3]} {TurboDecTop/EuI_Slv[4]} {TurboDecTop/EuI_Slv[5]} {TurboDecTop/EuI_Slv[6]} {TurboDecTop/EuI_Slv[7]} {TurboDecTop/EuI_Slv[8]} {TurboDecTop/EuI_Slv[9]} {TurboDecTop/EuI_Slv[10]} {TurboDecTop/EuI_Slv[11]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe7]
set_property port_width 12 [get_debug_ports u_ila_0/probe7]
connect_debug_port u_ila_0/probe7 [get_nets [list {TurboDecTop/EuO[0]} {TurboDecTop/EuO[1]} {TurboDecTop/EuO[2]} {TurboDecTop/EuO[3]} {TurboDecTop/EuO[4]} {TurboDecTop/EuO[5]} {TurboDecTop/EuO[6]} {TurboDecTop/EuO[7]} {TurboDecTop/EuO[8]} {TurboDecTop/EuO[9]} {TurboDecTop/EuO[10]} {TurboDecTop/EuO[11]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe8]
set_property port_width 10 [get_debug_ports u_ila_0/probe8]
connect_debug_port u_ila_0/probe8 [get_nets [list {BerCntrDbg[0]} {BerCntrDbg[1]} {BerCntrDbg[2]} {BerCntrDbg[3]} {BerCntrDbg[4]} {BerCntrDbg[5]} {BerCntrDbg[6]} {BerCntrDbg[7]} {BerCntrDbg[8]} {BerCntrDbg[9]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe9]
set_property port_width 10 [get_debug_ports u_ila_0/probe9]
connect_debug_port u_ila_0/probe9 [get_nets [list {BerCountDbg[0]} {BerCountDbg[1]} {BerCountDbg[2]} {BerCountDbg[3]} {BerCountDbg[4]} {BerCountDbg[5]} {BerCountDbg[6]} {BerCountDbg[7]} {BerCountDbg[8]} {BerCountDbg[9]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe10]
set_property port_width 1 [get_debug_ports u_ila_0/probe10]
connect_debug_port u_ila_0/probe10 [get_nets [list BitClk_OBUF]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe11]
set_property port_width 1 [get_debug_ports u_ila_0/probe11]
connect_debug_port u_ila_0/probe11 [get_nets [list BitOut_OBUF]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe12]
set_property port_width 1 [get_debug_ports u_ila_0/probe12]
connect_debug_port u_ila_0/probe12 [get_nets [list TurboDecTop/BitOutEn]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe13]
set_property port_width 1 [get_debug_ports u_ila_0/probe13]
connect_debug_port u_ila_0/probe13 [get_nets [list BitOutErr]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe14]
set_property port_width 1 [get_debug_ports u_ila_0/probe14]
connect_debug_port u_ila_0/probe14 [get_nets [list TurboDecTop/ch0En]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe15]
set_property port_width 1 [get_debug_ports u_ila_0/probe15]
connect_debug_port u_ila_0/probe15 [get_nets [list TurboDecTop/ASM/InvertEven]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe16]
set_property port_width 1 [get_debug_ports u_ila_0/probe16]
connect_debug_port u_ila_0/probe16 [get_nets [list TurboDecTop/ASM/InvertOdd]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe17]
set_property port_width 1 [get_debug_ports u_ila_0/probe17]
connect_debug_port u_ila_0/probe17 [get_nets [list TurboDecTop/SovaActiveA]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe18]
set_property port_width 1 [get_debug_ports u_ila_0/probe18]
connect_debug_port u_ila_0/probe18 [get_nets [list TurboDecTop/SovaActiveB]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe19]
set_property port_width 1 [get_debug_ports u_ila_0/probe19]
connect_debug_port u_ila_0/probe19 [get_nets [list TurboDecTop/SovaReady]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe20]
set_property port_width 1 [get_debug_ports u_ila_0/probe20]
connect_debug_port u_ila_0/probe20 [get_nets [list TurboDecTop/SovaValidOut]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe21]
set_property port_width 1 [get_debug_ports u_ila_0/probe21]
connect_debug_port u_ila_0/probe21 [get_nets [list TurboDecTop/ASM/SyncOut]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe22]
set_property port_width 1 [get_debug_ports u_ila_0/probe22]
connect_debug_port u_ila_0/probe22 [get_nets [list TurboDecTop/uHatB]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe23]
set_property port_width 1 [get_debug_ports u_ila_0/probe23]
connect_debug_port u_ila_0/probe23 [get_nets [list TurboDecTop/ASM/ValidOut]]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets Pll3Ref_OBUF_BUFG]
