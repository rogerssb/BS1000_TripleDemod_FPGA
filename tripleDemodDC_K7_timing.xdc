create_clock -period 500.000 -name spiClk -waveform {0.000 250.000} [get_ports spiClk]
create_clock -period 10.714 -name adc0Clk -waveform {0.000 5.357} [get_ports adc0Clk]
create_clock -period 25.000 -name pll0_OUT1 -waveform {0.000 12.500} [get_ports pll0_OUT1]
create_clock -period 25.000 -name pll1_OUT1 -waveform {0.000 12.500} [get_ports pll1_OUT1]
create_clock -period 500.000 -name busClk -waveform {0.000 250.000} [get_pins spiBufg/O]

create_generated_clock -name cAndD0/dll/CLK -source [get_pins {systemClock/inst/mmcm_adv_inst/CLKOUT0}] -divide_by 4 [get_pins {cAndD0/dll/dllOutputClk_reg/Q}]
create_generated_clock -name {cAndD0/dllDivider_reg_n_0_[0]} -source [get_pins {cAndD0/dll/dllOutputClk_reg/Q}] -divide_by 4 [get_pins {cAndD0/dllDivider_reg[0]/Q}]
create_generated_clock -name cAndD1/dll/CLK -source [get_pins {systemClock/inst/mmcm_adv_inst/CLKOUT0}] -divide_by 4 [get_pins {cAndD1/dll/dllOutputClk_reg/Q}]
create_generated_clock -name {cAndD1/dllDivider_reg_n_0_[0]} -source [get_pins {cAndD1/dll/dllOutputClk_reg/Q}] -divide_by 4 [get_pins {cAndD1/dllDivider_reg[0]/Q}]
create_generated_clock -name spiClk1 -source [get_pins {systemClock/inst/mmcm_adv_inst/CLKOUT0}] -divide_by 4 [get_pins {spiClk1_reg/Q}]
create_generated_clock -name {cAndD0/pllDivider_reg_n_0_[0]} -source [get_ports {pll0_OUT1}] -divide_by 4 [get_pins {cAndD0/pllDivider_reg[0]/Q}]
create_generated_clock -name {cAndD1/pllDivider_reg_n_0_[0]} -source [get_ports {pll1_OUT1}] -divide_by 4 [get_pins {cAndD1/pllDivider_reg[0]/Q}]

set_clock_groups -asynchronous -group [get_clocks -include_generated_clocks spiClk] -group [get_clocks -include_generated_clocks adc0Clk] -group [get_clocks -include_generated_clocks busClk] -group [get_clocks -include_generated_clocks pll0_OUT1] -group [get_clocks -include_generated_clocks pll1_OUT1]

set_input_delay -clock [get_clocks adc0Clk] -min -add_delay 1.800 [get_ports {adc0[*]}]
set_input_delay -clock [get_clocks adc0Clk] -max -add_delay 5.400 [get_ports {adc0[*]}]

set_output_delay -clock [get_clocks adc0Clk] -min -add_delay -0.100 [get_ports {dac0_d[*]}]
set_output_delay -clock [get_clocks adc0Clk] -max -add_delay 3.400 [get_ports {dac0_d[*]}]
set_output_delay -clock [get_clocks adc0Clk] -min -add_delay -0.100 [get_ports {dac1_d[*]}]
set_output_delay -clock [get_clocks adc0Clk] -max -add_delay 3.400 [get_ports {dac1_d[*]}]

set_multicycle_path -setup -from [get_pins -hierarchical -regexp {.*dqm/dqmm/diffTotal_reg.*/C$}] -to [get_pins -hierarchical -regexp {.*dqm/dqmm/.*/D$}] 4
set_multicycle_path -hold -from [get_pins -hierarchical -regexp {.*dqm/dqmm/diffTotal_reg.*/C$}] -to [get_pins -hierarchical -regexp {.*dqm/dqmm/.*/D$}] 3

set_multicycle_path -setup -from [get_pins -hierarchical -regexp {.*pcmTrellis/viterbi_top/acs.*/C$}] -to [get_pins -hierarchical -regexp {.*pcmTrellis/viterbi_top/maxMetric/.*/D$}] 4
set_multicycle_path -hold -from [get_pins -hierarchical -regexp {.*pcmTrellis/viterbi_top/acs.*/C$}] -to [get_pins -hierarchical -regexp {.*pcmTrellis/viterbi_top/maxMetric/.*/D$}] 3

set_multicycle_path -setup -from [get_pins -hierarchical -regexp {.*pcmTrellis/viterbi_top/acs.*/C$}] -to [get_pins -hierarchical -regexp {.*pcmTrellis/viterbi_top/acs.*/D$}] 4
set_multicycle_path -hold -from [get_pins -hierarchical -regexp {.*pcmTrellis/viterbi_top/acs.*/C$}] -to [get_pins -hierarchical -regexp {.*pcmTrellis/viterbi_top/acs.*/D$}] 3

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




