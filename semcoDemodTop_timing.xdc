set_property BITSTREAM.CONFIG.CONFIGRATE 50 [current_design]
set_property CONFIG_VOLTAGE 3.3 [current_design]
set_property CFGBVS VCCO [current_design]
set_property BITSTREAM.CONFIG.SPI_BUSWIDTH 1 [current_design]

set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets pll0_OUT1_IBUF]

set_clock_groups -asynchronous -group [get_clocks -include_generated_clocks fbClk] -group [get_clocks -include_generated_clocks sysClk]
#set_clock_groups -asynchronous -group [get_clocks -include_generated_clocks fbClk] -group [get_clocks -include_generated_clocks ldpc/ldpcc/clk_out1]
#set_clock_groups -asynchronous -group [get_clocks -include_generated_clocks sysClk] -group [get_clocks -include_generated_clocks ldpc/ldpcc/clk_out1]

#set_false_path -from [get_pins topRegs/reset_reg/C] -to [get_pins -hierarchical -regexp {.*ldpc/ldpcd/.*/R}]

set_input_delay -clock [get_clocks sysClk] -min -add_delay 1.800 [get_ports {adc0[*]}]
set_input_delay -clock [get_clocks sysClk] -max -add_delay 5.400 [get_ports {adc0[*]}]
set_input_delay -clock [get_clocks fbClk] -min -add_delay 0.500 [get_ports {fb_addr[*]}]
set_input_delay -clock [get_clocks fbClk] -max -add_delay 13.500 [get_ports {fb_addr[*]}]
set_input_delay -clock [get_clocks fbClk] -min -add_delay 0.500 [get_ports {fb_data[*]}]
set_input_delay -clock [get_clocks fbClk] -max -add_delay 13.500 [get_ports {fb_data[*]}]
set_input_delay -clock [get_clocks fbClk] -min -add_delay 0.500 [get_ports fb_ale]
set_input_delay -clock [get_clocks fbClk] -max -add_delay 13.500 [get_ports fb_ale]
set_input_delay -clock [get_clocks fbClk] -min -add_delay 0.500 [get_ports fb_csn]
set_input_delay -clock [get_clocks fbClk] -max -add_delay 13.500 [get_ports fb_csn]
set_input_delay -clock [get_clocks fbClk] -min -add_delay 0.500 [get_ports fb_wrn]
set_input_delay -clock [get_clocks fbClk] -max -add_delay 13.500 [get_ports fb_wrn]

set_output_delay -clock [get_clocks sysClk] -min -add_delay -0.100 [get_ports {dac0_d[*]}]
set_output_delay -clock [get_clocks sysClk] -max -add_delay 3.400 [get_ports {dac0_d[*]}]
set_output_delay -clock [get_clocks sysClk] -min -add_delay -0.100 [get_ports {dac1_d[*]}]
set_output_delay -clock [get_clocks sysClk] -max -add_delay 3.400 [get_ports {dac1_d[*]}]
set_output_delay -clock [get_clocks sysClk] -min -add_delay -0.100 [get_ports {dac2_d[*]}]
set_output_delay -clock [get_clocks sysClk] -max -add_delay 3.400 [get_ports {dac2_d[*]}]

set_multicycle_path -setup -from [get_pins -hierarchical -regexp {.*dqm/dqmm/diffTotal_reg.*/C$}] -to [get_pins -hierarchical -regexp {.*dqm/dqmm/.*/D$}] 4
set_multicycle_path -hold -from [get_pins -hierarchical -regexp {.*dqm/dqmm/diffTotal_reg.*/C$}] -to [get_pins -hierarchical -regexp {.*dqm/dqmm/.*/D$}] 3



# TIMEGRP "rot" = FFS(multih/viterbiMultiH/acsMultH*/iOutRot*) FFS(multih/viterbiMultiH/acsMultH*/qOutRot*);
# TIMEGRP "bestMetric" = FFS(multih/viterbiMultiH/acsMultH*/compSel/maxVal*) FFS(multih/viterbiMultiH/*selOut*) FFS(multih/viterbiMultiH/acsMultH*/compSel/index*);
# TIMESPEC TS_rot = FROM "rot" TO "bestMetric" 25 MHz;
# set_multicycle_path 4 -setup -from [get_pins -hierarchical -regexp {.*acsMultH[0-9]+/[iq]+OutRot.*/C$}] -to [get_pins -hierarchical -regexp {.*viterbiMultiH/symEnEvenSr.*/D$}]
# set_multicycle_path 3 -hold -from [get_pins -hierarchical -regexp {.*acsMultH[0-9]+/[iq]+OutRot.*/C$}] -to [get_pins -hierarchical -regexp {.*viterbiMultiH/symEnEvenSr.*/D$}]

# TIMEGRP "bestMetric" = FFS(multih/viterbiMultiH/acsMultH*/compSel/maxVal*) FFS(multih/viterbiMultiH/*selOut*) FFS(multih/viterbiMultiH/acsMultH*/compSel/index*);
# TIMESPEC TS_best = FROM "bestMetric" TO "bestMetric" 25 MHz;
# set_multicycle_path 4 -setup -from [get_pins -hierarchical -regexp {.*acsMultH[0-9]+/compSel/maxVal.*/C$}] -to [get_pins -hierarchical -regexp {.*viterbiMultiH/symEnEvenSr.*/D$}]
# set_multicycle_path 4 -setup -from [get_pins -hierarchical -regexp {.*acsMultH[0-9]+/compSel/index.*/C$}] -to [get_pins -hierarchical -regexp {.*viterbiMultiH/symEnEvenSr.*/D$}]
# set_multicycle_path 4 -setup -from [get_pins -hierarchical -regexp {.*viterbiMultiH/.*selOut.*/C$}] -to [get_pins -hierarchical -regexp {.*viterbiMultiH/symEnEvenSr.*/D$}]
# set_multicycle_path 3 -hold -from [get_pins -hierarchical -regexp {.*acsMultH[0-9]+/compSel/maxVal.*/C$}] -to [get_pins -hierarchical -regexp {.*viterbiMultiH/symEnEvenSr.*/D$}]
#set_multicycle_path 3 -hold -from [get_pins -hierarchical -regexp {.*acsMultH[0-9]+/compSel/index.*/C$}] -to [get_pins -hierarchical -regexp {.*viterbiMultiH/symEnEvenSr.*/D$}]
# set_multicycle_path 3 -hold -from [get_pins -hierarchical -regexp {.*viterbiMultiH/.*selOut.*/C$}] -to [get_pins -hierarchical -regexp {.*viterbiMultiH/symEnEvenSr.*/D$}]

# TIMEGRP "bestMetric" = FFS(multih/viterbiMultiH/acsMultH*/compSel/maxVal*) FFS(multih/viterbiMultiH/*selOut*) FFS(multih/viterbiMultiH/acsMultH*/compSel/index*);
# TIMEGRP "maxMetric" = FFS(multih/viterbiMultiH/maxMetric/*) FFS(multih/viterbiMultiH/normSr*);
# TIMESPEC TS_max = FROM "bestMetric" to "maxMetric" 25 MHz;



set_property BITSTREAM.CONFIG.SPI_32BIT_ADDR YES [current_design]
