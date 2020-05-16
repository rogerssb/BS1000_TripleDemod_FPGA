create_clock -period 500.000 -name spiClk -waveform {0.000 250.000} [get_ports spiClk]
create_clock -period 500.000 -name spiClk1 -waveform {0.000 250.000} [get_pins spiClk1_reg/Q]

create_clock -period 25.000 -name pll0_OUT1 -waveform {0.000 12.500} [get_ports pll0_OUT1]
create_clock -period 25.000 -name pll1_OUT1 -waveform {0.000 12.500} [get_ports pll1_OUT1]
create_clock -period 21.428 -name VIRTUAL_cAndD0/dll/dllOutputClk -waveform {0.000 10.714}
create_clock -period 5.357 -name VIRTUAL_clk186_systemClock -waveform {0.000 2.678}
create_generated_clock -name cAndD0/dll/dllOutputClk -source [get_pins systemClock/inst/mmcm_adv_inst/CLKOUT0] -divide_by 2 [get_pins cAndD0/dll/dllOutputClk_reg/Q]
create_generated_clock -name cAndD0/dllReadClk -source [get_pins cAndD0/dll/dllOutputClk_reg/Q] -divide_by 2 [get_pins {cAndD0/dllDivider_reg[0]/Q}]
create_generated_clock -name cAndD0/pllReadClk -source [get_ports pll0_OUT1] -divide_by 2 [get_pins {cAndD0/pllDivider_reg[0]/Q}]
create_generated_clock -name cAndD1/dll/dllOutputClk -source [get_pins systemClock/inst/mmcm_adv_inst/CLKOUT0] -divide_by 2 [get_pins cAndD1/dll/dllOutputClk_reg/Q]
create_generated_clock -name cAndD1/dllReadClk -source [get_pins cAndD1/dll/dllOutputClk_reg/Q] -divide_by 2 [get_pins {cAndD1/dllDivider_reg[0]/Q}]
create_generated_clock -name cAndD1/pllReadClk -source [get_ports pll1_OUT1] -divide_by 2 [get_pins {cAndD1/pllDivider_reg[0]/Q}]

set_clock_groups -asynchronous -group [get_clocks -include_generated_clocks {spiClk spiClk1}] -group [get_clocks -include_generated_clocks adc0Clk] -group [get_clocks -include_generated_clocks pll0_OUT1] -group [get_clocks -include_generated_clocks pll1_OUT1]


set_input_delay -clock [get_clocks adc0Clk] -min -add_delay 1.800 [get_ports {adc0[*]}]
set_input_delay -clock [get_clocks adc0Clk] -max -add_delay 5.400 [get_ports {adc0[*]}]

set_output_delay -clock [get_clocks adc0Clk] -min -add_delay -0.100 [get_ports {dac0_d[*]}]
set_output_delay -clock [get_clocks adc0Clk] -max -add_delay 3.400 [get_ports {dac0_d[*]}]
set_output_delay -clock [get_clocks adc0Clk] -min -add_delay -0.100 [get_ports {dac1_d[*]}]
set_output_delay -clock [get_clocks adc0Clk] -max -add_delay 3.400 [get_ports {dac1_d[*]}]




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

set_input_delay -clock [get_clocks adc0Clk] -min -add_delay 1.000 [get_ports amAdcDataIn]
set_input_delay -clock [get_clocks adc0Clk] -max -add_delay 1.000 [get_ports amAdcDataIn]
set_input_delay -clock [get_clocks adc0Clk] -min -add_delay 1.000 [get_ports spiCSn]
set_input_delay -clock [get_clocks adc0Clk] -max -add_delay 1.000 [get_ports spiCSn]
set_input_delay -clock [get_clocks adc0Clk] -min -add_delay 1.000 [get_ports spiDataIn]
set_input_delay -clock [get_clocks adc0Clk] -max -add_delay 1.000 [get_ports spiDataIn]
set_input_delay -clock [get_clocks adc0Clk] -min -add_delay 1.000 [get_ports spiFlashMISO]
set_input_delay -clock [get_clocks adc0Clk] -max -add_delay 1.000 [get_ports spiFlashMISO]
set_output_delay -clock [get_clocks adc0Clk] -min -add_delay -1.000 [get_ports {video*InSelect[*]}]
set_output_delay -clock [get_clocks adc0Clk] -max -add_delay 2.000 [get_ports {video*InSelect[*]}]
set_output_delay -clock [get_clocks adc0Clk] -min -add_delay -1.000 [get_ports {video*OutSelect[*]}]
set_output_delay -clock [get_clocks adc0Clk] -max -add_delay 2.000 [get_ports {video*OutSelect[*]}]
set_output_delay -clock [get_clocks adc0Clk] -min -add_delay -1.000 [get_ports amAdcCSn]
set_output_delay -clock [get_clocks adc0Clk] -max -add_delay 2.000 [get_ports amAdcCSn]
set_output_delay -clock [get_clocks adc0Clk] -min -add_delay -1.000 [get_ports amAdcClk]
set_output_delay -clock [get_clocks adc0Clk] -max -add_delay 2.000 [get_ports amAdcClk]
set_output_delay -clock [get_clocks adc0Clk] -min -add_delay -1.000 [get_ports amDacCSn]
set_output_delay -clock [get_clocks adc0Clk] -max -add_delay 2.000 [get_ports amDacCSn]
set_output_delay -clock [get_clocks adc0Clk] -min -add_delay -1.000 [get_ports amDacClk]
set_output_delay -clock [get_clocks adc0Clk] -max -add_delay 2.000 [get_ports amDacClk]
set_output_delay -clock [get_clocks adc0Clk] -min -add_delay -1.000 [get_ports amDacDataOut]
set_output_delay -clock [get_clocks adc0Clk] -max -add_delay 2.000 [get_ports amDacDataOut]
set_output_delay -clock [get_clocks adc0Clk] -clock_fall -min -add_delay -1.000 [get_ports spiDataOut]
set_output_delay -clock [get_clocks adc0Clk] -clock_fall -max -add_delay 2.000 [get_ports spiDataOut]
set_output_delay -clock [get_clocks adc0Clk] -min -add_delay -1.000 [get_ports spiDataOut]
set_output_delay -clock [get_clocks adc0Clk] -max -add_delay 2.000 [get_ports spiDataOut]
set_output_delay -clock [get_clocks adc0Clk] -min -add_delay -1.000 [get_ports spiFlashCSn]
set_output_delay -clock [get_clocks adc0Clk] -max -add_delay 2.000 [get_ports spiFlashCSn]
set_output_delay -clock [get_clocks adc0Clk] -min -add_delay -1.000 [get_ports spiFlashMOSI]
set_output_delay -clock [get_clocks adc0Clk] -max -add_delay 2.000 [get_ports spiFlashMOSI]
set_false_path -to [get_ports {ch*ClkOut ch*DataOut lockLed*n}]
set_false_path -from [get_pins -hierarchical -regexp {.*stcDemod/Trellis_u/td/stageSetup[0-9]*/refValid_reg.*/C$.*}] -to [get_pins -hierarchical -regexp {.*/td/stage[0-9]*/acs[0-9]*/cmag/.*/p_reg/A\[.*}]
set_false_path -from [get_pins -hierarchical -regexp {.*stcDemod/Trellis_u/td/stage[0-9]*/wrAddr_reg\[.*/C$.*}] -to [get_pins -hierarchical -regexp {.*/td/stage[0-9]*/acs[0-9]*/cmag/.*/p_reg/A\[.*}]
set_false_path -from [get_pins -hierarchical -regexp {.*stcDemod/Trellis_u/td/stageSetup[0-9]*/refValid_reg.*/C$.*}] -to [get_pins -hierarchical -regexp {.*/td/stage[0-9]*/acs[0-9]*/cmag/.*/p_reg/B\[.*}]
set_false_path -from [get_pins -hierarchical -regexp {.*stcDemod/Trellis_u/td/stage[0-9]*/wrAddr_reg\[.*/C$.*}] -to [get_pins -hierarchical -regexp {.*/td/stage[0-9]*/acs[0-9]*/cmag/.*/p_reg/B\[.*}]



