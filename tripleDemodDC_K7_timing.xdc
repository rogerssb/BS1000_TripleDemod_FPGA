create_clock -period 500.000 -name spiClk -waveform {0.000 250.000} [get_ports spiClk]
create_clock -period 10.714 -name adc0Clk -waveform {0.000 5.357} -add [get_ports adc0Clk]

set_clock_groups -asynchronous -group [get_clocks -include_generated_clocks spiClk] -group [get_clocks -include_generated_clocks adc0Clk]

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


set_false_path -from [get_pins topRegs/reset_reg_rep/C] -to [get_pins {Combiner/SerDesIn/SyncRst_reg[*]/D}]
set_false_path -from [get_pins topRegs/reset_reg_rep/C] -to [get_pins {Combiner/SerDesIn/SyncRst_reg[*]/S}]

set_input_delay -clock [get_clocks [get_clocks -of_objects [get_pins systemClock/inst/mmcm_adv_inst/CLKOUT0]]] 2.000 [get_ports {SideCar[32]}]
set_output_delay -clock [get_clocks [get_clocks -of_objects [get_pins systemClock/inst/mmcm_adv_inst/CLKOUT0]]] 2.000 [get_ports {SideCar[*]}]








