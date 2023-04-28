create_clock -period 500.000 -name spiClk -waveform {0.000 250.000} [get_ports spiClk]

set_clock_groups -asynchronous -group [get_clocks -include_generated_clocks spiClk] -group [get_clocks -include_generated_clocks adc0Clk]

set_input_delay -clock [get_clocks adc0Clk] -min -add_delay 1.800 [get_ports {adc0[*]}]
set_input_delay -clock [get_clocks adc0Clk] -max -add_delay 5.400 [get_ports {adc0[*]}]

set_output_delay -clock [get_clocks adc0Clk] -min -add_delay -0.100 [get_ports {dac0_d[*]}]
set_output_delay -clock [get_clocks adc0Clk] -max -add_delay 3.400 [get_ports {dac0_d[*]}]
set_output_delay -clock [get_clocks adc0Clk] -min -add_delay -0.100 [get_ports {dac1_d[*]}]
set_output_delay -clock [get_clocks adc0Clk] -max -add_delay 3.400 [get_ports {dac1_d[*]}]

set_multicycle_path -setup -from [get_pins -hierarchical -regexp {.*dqm/dqmm/diffTotal_reg.*/C$}] -to [get_pins -hierarchical -regexp {.*dqm/dqmm/.*/D$}] 4
set_multicycle_path -hold -from [get_pins -hierarchical -regexp {.*dqm/dqmm/diffTotal_reg.*/C$}] -to [get_pins -hierarchical -regexp {.*dqm/dqmm/.*/D$}] 3

# TIMEGRP "rot" = FFS(multih/viterbiMultiH/acsMultH*/iOutRot*) FFS(multih/viterbiMultiH/acsMultH*/qOutRot*);
# TIMEGRP "bestMetric" = FFS(multih/viterbiMultiH/acsMultH*/compSel/maxVal*) FFS(multih/viterbiMultiH/*selOut*) FFS(multih/viterbiMultiH/acsMultH*/compSel/index*);
# TIMESPEC TS_rot = FROM "rot" TO "bestMetric" 25 MHz;
set_multicycle_path -setup -from [get_pins -hierarchical -regexp {.*acsMultH[0-9]+/[iq]+OutRot.*/C$}] -to [get_pins -hierarchical -regexp {.*acsMultH[0-9]+/compSel/maxVal.*/D$}] 4
set_multicycle_path -setup -from [get_pins -hierarchical -regexp {.*acsMultH[0-9]+/[iq]+OutRot.*/C$}] -to [get_pins -hierarchical -regexp {.*acsMultH[0-9]+/compSel/index.*/D$}] 4
set_multicycle_path -setup -from [get_pins -hierarchical -regexp {.*acsMultH[0-9]+/[iq]+OutRot.*/C$}] -to [get_pins -hierarchical -regexp {.*viterbiMultiH/.*selOut.*/D$}] 4
# set_multicycle_path 4 -setup -from [get_pins -hierarchical -regexp {.*acsMultH[0-9]+/[iq]+OutRot.*/C$}] -to [get_pins -hierarchical -regexp {.*viterbiMultiH/symEnEvenSr.*/D$}]
set_multicycle_path -hold -from [get_pins -hierarchical -regexp {.*acsMultH[0-9]+/[iq]+OutRot.*/C$}] -to [get_pins -hierarchical -regexp {.*acsMultH[0-9]+/compSel/maxVal.*/D$}] 3
set_multicycle_path -hold -from [get_pins -hierarchical -regexp {.*acsMultH[0-9]+/[iq]+OutRot.*/C$}] -to [get_pins -hierarchical -regexp {.*acsMultH[0-9]+/compSel/index.*/D$}] 3
set_multicycle_path -hold -from [get_pins -hierarchical -regexp {.*acsMultH[0-9]+/[iq]+OutRot.*/C$}] -to [get_pins -hierarchical -regexp {.*viterbiMultiH/.*selOut.*/D$}] 3
# set_multicycle_path 3 -hold -from [get_pins -hierarchical -regexp {.*acsMultH[0-9]+/[iq]+OutRot.*/C$}] -to [get_pins -hierarchical -regexp {.*viterbiMultiH/symEnEvenSr.*/D$}]

# TIMEGRP "bestMetric" = FFS(multih/viterbiMultiH/acsMultH*/compSel/maxVal*) FFS(multih/viterbiMultiH/*selOut*) FFS(multih/viterbiMultiH/acsMultH*/compSel/index*);
# TIMESPEC TS_best = FROM "bestMetric" TO "bestMetric" 25 MHz;
set_multicycle_path -setup -from [get_pins -hierarchical -regexp {.*acsMultH[0-9]+/compSel/maxVal.*/C$}] -to [get_pins -hierarchical -regexp {.*acsMultH[0-9]+/compSel/maxVal.*/D$}] 4
set_multicycle_path -setup -from [get_pins -hierarchical -regexp {.*acsMultH[0-9]+/compSel/maxVal.*/C$}] -to [get_pins -hierarchical -regexp {.*acsMultH[0-9]+/compSel/index.*/D$}] 4
set_multicycle_path -setup -from [get_pins -hierarchical -regexp {.*acsMultH[0-9]+/compSel/maxVal.*/C$}] -to [get_pins -hierarchical -regexp {.*viterbiMultiH/.*selOut.*/D$}] 4
# set_multicycle_path 4 -setup -from [get_pins -hierarchical -regexp {.*acsMultH[0-9]+/compSel/maxVal.*/C$}] -to [get_pins -hierarchical -regexp {.*viterbiMultiH/symEnEvenSr.*/D$}]
set_multicycle_path -setup -from [get_pins -hierarchical -regexp {.*acsMultH[0-9]+/compSel/index.*/C$}] -to [get_pins -hierarchical -regexp {.*acsMultH[0-9]+/compSel/maxVal.*/D$}] 4
set_multicycle_path -setup -from [get_pins -hierarchical -regexp {.*acsMultH[0-9]+/compSel/index.*/C$}] -to [get_pins -hierarchical -regexp {.*acsMultH[0-9]+/compSel/index.*/D$}] 4
set_multicycle_path -setup -from [get_pins -hierarchical -regexp {.*acsMultH[0-9]+/compSel/index.*/C$}] -to [get_pins -hierarchical -regexp {.*viterbiMultiH/.*selOut.*/D$}] 4
# set_multicycle_path 4 -setup -from [get_pins -hierarchical -regexp {.*acsMultH[0-9]+/compSel/index.*/C$}] -to [get_pins -hierarchical -regexp {.*viterbiMultiH/symEnEvenSr.*/D$}]
set_multicycle_path -setup -from [get_pins -hierarchical -regexp {.*viterbiMultiH/.*selOut.*/C$}] -to [get_pins -hierarchical -regexp {.*acsMultH[0-9]+/compSel/maxVal.*/D$}] 4
set_multicycle_path -setup -from [get_pins -hierarchical -regexp {.*viterbiMultiH/.*selOut.*/C$}] -to [get_pins -hierarchical -regexp {.*acsMultH[0-9]+/compSel/index.*/D$}] 4
set_multicycle_path -setup -from [get_pins -hierarchical -regexp {.*viterbiMultiH/.*selOut.*/C$}] -to [get_pins -hierarchical -regexp {.*viterbiMultiH/.*selOut.*/D$}] 4
# set_multicycle_path 4 -setup -from [get_pins -hierarchical -regexp {.*viterbiMultiH/.*selOut.*/C$}] -to [get_pins -hierarchical -regexp {.*viterbiMultiH/symEnEvenSr.*/D$}]
set_multicycle_path -setup -from [get_pins -hierarchical -regexp {.*viterbiMultiH/symEnEvenSr.*/C$}] -to [get_pins -hierarchical -regexp {.*acsMultH[0-9]+/compSel/maxVal.*/D$}] 4
set_multicycle_path -setup -from [get_pins -hierarchical -regexp {.*viterbiMultiH/symEnEvenSr.*/C$}] -to [get_pins -hierarchical -regexp {.*acsMultH[0-9]+/compSel/index.*/D$}] 4
set_multicycle_path -setup -from [get_pins -hierarchical -regexp {.*viterbiMultiH/symEnEvenSr.*/C$}] -to [get_pins -hierarchical -regexp {.*viterbiMultiH/.*selOut.*/D$}] 4
set_multicycle_path -setup -from [get_pins -hierarchical -regexp {.*viterbiMultiH/symEnEvenSr.*/C$}] -to [get_pins -hierarchical -regexp {.*viterbiMultiH/symEnEvenSr.*/D$}] 4
set_multicycle_path -hold -from [get_pins -hierarchical -regexp {.*acsMultH[0-9]+/compSel/maxVal.*/C$}] -to [get_pins -hierarchical -regexp {.*acsMultH[0-9]+/compSel/maxVal.*/D$}] 3
set_multicycle_path -hold -from [get_pins -hierarchical -regexp {.*acsMultH[0-9]+/compSel/maxVal.*/C$}] -to [get_pins -hierarchical -regexp {.*acsMultH[0-9]+/compSel/index.*/D$}] 3
set_multicycle_path -hold -from [get_pins -hierarchical -regexp {.*acsMultH[0-9]+/compSel/maxVal.*/C$}] -to [get_pins -hierarchical -regexp {.*viterbiMultiH/.*selOut.*/D$}] 3
# set_multicycle_path 3 -hold -from [get_pins -hierarchical -regexp {.*acsMultH[0-9]+/compSel/maxVal.*/C$}] -to [get_pins -hierarchical -regexp {.*viterbiMultiH/symEnEvenSr.*/D$}]
set_multicycle_path -hold -from [get_pins -hierarchical -regexp {.*acsMultH[0-9]+/compSel/index.*/C$}] -to [get_pins -hierarchical -regexp {.*acsMultH[0-9]+/compSel/maxVal.*/D$}] 3
set_multicycle_path -hold -from [get_pins -hierarchical -regexp {.*acsMultH[0-9]+/compSel/index.*/C$}] -to [get_pins -hierarchical -regexp {.*acsMultH[0-9]+/compSel/index.*/D$}] 3
set_multicycle_path -hold -from [get_pins -hierarchical -regexp {.*acsMultH[0-9]+/compSel/index.*/C$}] -to [get_pins -hierarchical -regexp {.*viterbiMultiH/.*selOut.*/D$}] 3
#set_multicycle_path 3 -hold -from [get_pins -hierarchical -regexp {.*acsMultH[0-9]+/compSel/index.*/C$}] -to [get_pins -hierarchical -regexp {.*viterbiMultiH/symEnEvenSr.*/D$}]
set_multicycle_path -hold -from [get_pins -hierarchical -regexp {.*viterbiMultiH/.*selOut.*/C$}] -to [get_pins -hierarchical -regexp {.*acsMultH[0-9]+/compSel/maxVal.*/D$}] 3
set_multicycle_path -hold -from [get_pins -hierarchical -regexp {.*viterbiMultiH/.*selOut.*/C$}] -to [get_pins -hierarchical -regexp {.*acsMultH[0-9]+/compSel/index.*/D$}] 3
set_multicycle_path -hold -from [get_pins -hierarchical -regexp {.*viterbiMultiH/.*selOut.*/C$}] -to [get_pins -hierarchical -regexp {.*viterbiMultiH/.*selOut.*/D$}] 3
# set_multicycle_path 3 -hold -from [get_pins -hierarchical -regexp {.*viterbiMultiH/.*selOut.*/C$}] -to [get_pins -hierarchical -regexp {.*viterbiMultiH/symEnEvenSr.*/D$}]
set_multicycle_path -hold -from [get_pins -hierarchical -regexp {.*viterbiMultiH/symEnEvenSr.*/C$}] -to [get_pins -hierarchical -regexp {.*acsMultH[0-9]+/compSel/maxVal.*/D$}] 3
set_multicycle_path -hold -from [get_pins -hierarchical -regexp {.*viterbiMultiH/symEnEvenSr.*/C$}] -to [get_pins -hierarchical -regexp {.*acsMultH[0-9]+/compSel/index.*/D$}] 3
set_multicycle_path -hold -from [get_pins -hierarchical -regexp {.*viterbiMultiH/symEnEvenSr.*/C$}] -to [get_pins -hierarchical -regexp {.*viterbiMultiH/.*selOut.*/D$}] 3
set_multicycle_path -hold -from [get_pins -hierarchical -regexp {.*viterbiMultiH/symEnEvenSr.*/C$}] -to [get_pins -hierarchical -regexp {.*viterbiMultiH/symEnEvenSr.*/D$}] 3

# TIMEGRP "bestMetric" = FFS(multih/viterbiMultiH/acsMultH*/compSel/maxVal*) FFS(multih/viterbiMultiH/*selOut*) FFS(multih/viterbiMultiH/acsMultH*/compSel/index*);
# TIMEGRP "maxMetric" = FFS(multih/viterbiMultiH/maxMetric/*) FFS(multih/viterbiMultiH/normSr*);
# TIMESPEC TS_max = FROM "bestMetric" to "maxMetric" 25 MHz;
set_multicycle_path -setup -from [get_pins -hierarchical -regexp {.*acsMultH[0-9]+/compSel/maxVal.*/C$}] -to [get_pins -hierarchical -regexp {.*viterbiMultiH/maxMetric/.*/D$}] 4
set_multicycle_path -setup -from [get_pins -hierarchical -regexp {.*acsMultH[0-9]+/compSel/maxVal.*/C$}] -to [get_pins -hierarchical -regexp {.*viterbiMultiH/normSr.*/D$}] 4
set_multicycle_path -setup -from [get_pins -hierarchical -regexp {.*acsMultH[0-9]+/compSel/index.*/C$}] -to [get_pins -hierarchical -regexp {.*viterbiMultiH/maxMetric/.*/D$}] 4
set_multicycle_path -setup -from [get_pins -hierarchical -regexp {.*acsMultH[0-9]+/compSel/index.*/C$}] -to [get_pins -hierarchical -regexp {.*viterbiMultiH/normSr.*/D$}] 4
set_multicycle_path -setup -from [get_pins -hierarchical -regexp {.*viterbiMultiH/.*selOut.*/C$}] -to [get_pins -hierarchical -regexp {.*viterbiMultiH/maxMetric/.*/D$}] 4
set_multicycle_path -setup -from [get_pins -hierarchical -regexp {.*viterbiMultiH/.*selOut.*/C$}] -to [get_pins -hierarchical -regexp {.*viterbiMultiH/normSr.*/D$}] 4
set_multicycle_path -setup -from [get_pins -hierarchical -regexp {.*viterbiMultiH/symEnEvenSr.*/C$}] -to [get_pins -hierarchical -regexp {.*viterbiMultiH/maxMetric/.*/D$}] 4
set_multicycle_path -setup -from [get_pins -hierarchical -regexp {.*viterbiMultiH/symEnEvenSr.*/C$}] -to [get_pins -hierarchical -regexp {.*viterbiMultiH/normSr.*/D$}] 4
set_multicycle_path -hold -from [get_pins -hierarchical -regexp {.*acsMultH[0-9]+/compSel/maxVal.*/C$}] -to [get_pins -hierarchical -regexp {.*viterbiMultiH/maxMetric/.*/D$}] 3
set_multicycle_path -hold -from [get_pins -hierarchical -regexp {.*acsMultH[0-9]+/compSel/maxVal.*/C$}] -to [get_pins -hierarchical -regexp {.*viterbiMultiH/normSr.*/D$}] 3
set_multicycle_path -hold -from [get_pins -hierarchical -regexp {.*acsMultH[0-9]+/compSel/index.*/C$}] -to [get_pins -hierarchical -regexp {.*viterbiMultiH/maxMetric/.*/D$}] 3
set_multicycle_path -hold -from [get_pins -hierarchical -regexp {.*acsMultH[0-9]+/compSel/index.*/C$}] -to [get_pins -hierarchical -regexp {.*viterbiMultiH/normSr.*/D$}] 3
set_multicycle_path -hold -from [get_pins -hierarchical -regexp {.*viterbiMultiH/.*selOut.*/C$}] -to [get_pins -hierarchical -regexp {.*viterbiMultiH/maxMetric/.*/D$}] 3
set_multicycle_path -hold -from [get_pins -hierarchical -regexp {.*viterbiMultiH/.*selOut.*/C$}] -to [get_pins -hierarchical -regexp {.*viterbiMultiH/normSr.*/D$}] 3
set_multicycle_path -hold -from [get_pins -hierarchical -regexp {.*viterbiMultiH/symEnEvenSr.*/C$}] -to [get_pins -hierarchical -regexp {.*viterbiMultiH/maxMetric/.*/D$}] 3
set_multicycle_path -hold -from [get_pins -hierarchical -regexp {.*viterbiMultiH/symEnEvenSr.*/C$}] -to [get_pins -hierarchical -regexp {.*viterbiMultiH/normSr.*/D$}] 3


create_debug_core u_ila_0 ila
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_0]
set_property ALL_PROBE_SAME_MU_CNT 4 [get_debug_cores u_ila_0]
set_property C_ADV_TRIGGER true [get_debug_cores u_ila_0]
set_property C_DATA_DEPTH 1024 [get_debug_cores u_ila_0]
set_property C_EN_STRG_QUAL true [get_debug_cores u_ila_0]
set_property C_INPUT_PIPE_STAGES 2 [get_debug_cores u_ila_0]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_0]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_0]
set_property port_width 1 [get_debug_ports u_ila_0/clk]
connect_debug_port u_ila_0/clk [get_nets [list systemClock/inst/clk1x]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe0]
set_property port_width 8 [get_debug_ports u_ila_0/probe0]
connect_debug_port u_ila_0/probe0 [get_nets [list {multiboot/cnt[0]} {multiboot/cnt[1]} {multiboot/cnt[2]} {multiboot/cnt[3]} {multiboot/cnt[4]} {multiboot/cnt[5]} {multiboot/cnt[6]} {multiboot/cnt[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe1]
set_property port_width 32 [get_debug_ports u_ila_0/probe1]
connect_debug_port u_ila_0/probe1 [get_nets [list {multiboot/iCapeOut[0]} {multiboot/iCapeOut[1]} {multiboot/iCapeOut[2]} {multiboot/iCapeOut[3]} {multiboot/iCapeOut[4]} {multiboot/iCapeOut[5]} {multiboot/iCapeOut[6]} {multiboot/iCapeOut[7]} {multiboot/iCapeOut[8]} {multiboot/iCapeOut[9]} {multiboot/iCapeOut[10]} {multiboot/iCapeOut[11]} {multiboot/iCapeOut[12]} {multiboot/iCapeOut[13]} {multiboot/iCapeOut[14]} {multiboot/iCapeOut[15]} {multiboot/iCapeOut[16]} {multiboot/iCapeOut[17]} {multiboot/iCapeOut[18]} {multiboot/iCapeOut[19]} {multiboot/iCapeOut[20]} {multiboot/iCapeOut[21]} {multiboot/iCapeOut[22]} {multiboot/iCapeOut[23]} {multiboot/iCapeOut[24]} {multiboot/iCapeOut[25]} {multiboot/iCapeOut[26]} {multiboot/iCapeOut[27]} {multiboot/iCapeOut[28]} {multiboot/iCapeOut[29]} {multiboot/iCapeOut[30]} {multiboot/iCapeOut[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe2]
set_property port_width 9 [get_debug_ports u_ila_0/probe2]
connect_debug_port u_ila_0/probe2 [get_nets [list {multiboot/idCode[0]} {multiboot/idCode[1]} {multiboot/idCode[2]} {multiboot/idCode[3]} {multiboot/idCode[4]} {multiboot/idCode[5]} {multiboot/idCode[6]} {multiboot/idCode[7]} {multiboot/idCode[8]}]]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets dac1_clk_OBUF]
