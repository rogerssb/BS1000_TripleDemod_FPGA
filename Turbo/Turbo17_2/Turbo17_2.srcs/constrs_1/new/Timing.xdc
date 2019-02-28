create_clock -period 11.000 -name Clk93 -waveform {0.000 5.500} [get_ports Clk93]
create_clock -period 10.000 -name ClkPll -waveform {0.000 5.000} [get_ports ClkPll]

set_false_path -from [get_clocks Clk93] -to [get_clocks ClkPll]
set_false_path -from [get_clocks ClkPll] -to [get_clocks Clk93]

set_multicycle_path -setup -from [get_pins TurboDecTop/Sova/*/C] -to [get_pins {TurboDecTop/Sova/*/D TurboDecTop/Sova/*/CE TurboDecTop/Sova/*/R}] 3
set_multicycle_path -setup -from [get_pins TurboDecTop/Sova/*/C] -to [get_pins {TurboDecTop/Sova/*/D TurboDecTop/Sova/*/CE TurboDecTop/Sova/*/R}] 3
set_multicycle_path -hold -from [get_pins TurboDecTop/Sova/*/C] -to [get_pins TurboDecTop/Sova/*/D] 2
set_multicycle_path -hold -from [get_pins TurboDecTop/Sova/*/C] -to [get_pins TurboDecTop/Sova/*/D] 2
set_multicycle_path -setup -from [get_pins {TurboDecTop/PCI?_Ram*/CLKBWRCLK TurboDecTop/EuI?_Ram*/CLKBWRCLK {TurboDecTop/Sova/peC[*]} TurboDecTop/SovaActive?_reg/C {TurboDecTop/IterationCntr_u_reg[*]/C}}] -to [get_pins {TurboDecTop/Sova/pRM_reg[*]/D}] 3
set_multicycle_path -hold -from [get_pins {TurboDecTop/PCI?_Ram*/CLKBWRCLK TurboDecTop/EuI?_Ram*/CLKBWRCLK {TurboDecTop/Sova/peC[*]} TurboDecTop/SovaActive?_reg/C {TurboDecTop/IterationCntr_u_reg[*]/C}}] -to [get_pins {TurboDecTop/Sova/pRM_reg[*]/D}] 2
set_multicycle_path -setup -from [get_pins TurboDecTop/Sova/IndexOut_u*/C] -to * 3
set_multicycle_path -hold -from [get_pins TurboDecTop/Sova/IndexOut_u*/C] -to * 2

set_false_path -from [get_pins {TurboDecTop/Sova/dGlobalMax_reg[*]/C}] -to *
set_false_path -from [get_pins {TurboDecTop/Sova/dGlobalMin_reg[*]/C}] -to *




create_debug_core u_ila_0 ila
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_0]
set_property ALL_PROBE_SAME_MU_CNT 2 [get_debug_cores u_ila_0]
set_property C_ADV_TRIGGER false [get_debug_cores u_ila_0]
set_property C_DATA_DEPTH 1024 [get_debug_cores u_ila_0]
set_property C_EN_STRG_QUAL true [get_debug_cores u_ila_0]
set_property C_INPUT_PIPE_STAGES 2 [get_debug_cores u_ila_0]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_0]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_0]
set_property port_width 1 [get_debug_ports u_ila_0/clk]
connect_debug_port u_ila_0/clk [get_nets [list Pll2Ref_OBUF_BUFG]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe0]
set_property port_width 10 [get_debug_ports u_ila_0/probe0]
connect_debug_port u_ila_0/probe0 [get_nets [list {BerCntrDbg[0]} {BerCntrDbg[1]} {BerCntrDbg[2]} {BerCntrDbg[3]} {BerCntrDbg[4]} {BerCntrDbg[5]} {BerCntrDbg[6]} {BerCntrDbg[7]} {BerCntrDbg[8]} {BerCntrDbg[9]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe1]
set_property port_width 10 [get_debug_ports u_ila_0/probe1]
connect_debug_port u_ila_0/probe1 [get_nets [list {BerCountDbg[0]} {BerCountDbg[1]} {BerCountDbg[2]} {BerCountDbg[3]} {BerCountDbg[4]} {BerCountDbg[5]} {BerCountDbg[6]} {BerCountDbg[7]} {BerCountDbg[8]} {BerCountDbg[9]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe2]
set_property port_width 1 [get_debug_ports u_ila_0/probe2]
connect_debug_port u_ila_0/probe2 [get_nets [list BitClk_OBUF]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe3]
set_property port_width 1 [get_debug_ports u_ila_0/probe3]
connect_debug_port u_ila_0/probe3 [get_nets [list BitOut_OBUF]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe4]
set_property port_width 1 [get_debug_ports u_ila_0/probe4]
connect_debug_port u_ila_0/probe4 [get_nets [list BitOutErr]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe5]
set_property port_width 1 [get_debug_ports u_ila_0/probe5]
connect_debug_port u_ila_0/probe5 [get_nets [list SyncOut]]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets Pll3Ref_OBUF_BUFG]
