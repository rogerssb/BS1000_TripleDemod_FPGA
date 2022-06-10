create_clock -period 500.000 -name spiClk -waveform {0.000 250.000} [get_ports spiClk]

set_clock_groups -asynchronous -group [get_clocks -include_generated_clocks spiClk] -group [get_clocks -include_generated_clocks adc0Clk]

set_input_delay -clock [get_clocks adc0Clk] -min -add_delay 1.800 [get_ports {adc0[*]}]
set_input_delay -clock [get_clocks adc0Clk] -max -add_delay 5.400 [get_ports {adc0[*]}]

set_output_delay -clock [get_clocks adc0Clk] -min -add_delay -0.100 [get_ports {dac0_d[*]}]
set_output_delay -clock [get_clocks adc0Clk] -max -add_delay 3.400 [get_ports {dac0_d[*]}]
set_output_delay -clock [get_clocks adc0Clk] -min -add_delay -0.100 [get_ports {dac1_d[*]}]
set_output_delay -clock [get_clocks adc0Clk] -max -add_delay 3.400 [get_ports {dac1_d[*]}]

set_multicycle_path 4 -setup -from [get_pins -hierarchical -regexp {.*dqm/dqmm/diffTotal_reg.*/C$}] -to [get_pins -hierarchical -regexp {.*dqm/dqmm/.*/D$}]
set_multicycle_path 3 -hold -from [get_pins -hierarchical -regexp {.*dqm/dqmm/diffTotal_reg.*/C$}] -to [get_pins -hierarchical -regexp {.*dqm/dqmm/.*/D$}]

set_multicycle_path 4 -setup -from [get_pins -hierarchical -regexp {.*pcmTrellis/viterbi_top/acs.*/C$}] -to [get_pins -hierarchical -regexp {.*pcmTrellis/viterbi_top/maxMetric/.*/D$}]
set_multicycle_path 3 -hold -from [get_pins -hierarchical -regexp {.*pcmTrellis/viterbi_top/acs.*/C$}] -to [get_pins -hierarchical -regexp {.*pcmTrellis/viterbi_top/maxMetric/.*/D$}]

set_multicycle_path 4 -setup -from [get_pins -hierarchical -regexp {.*pcmTrellis/viterbi_top/acs.*/C$}] -to [get_pins -hierarchical -regexp {.*pcmTrellis/viterbi_top/acs.*/D$}]
set_multicycle_path 3 -hold -from [get_pins -hierarchical -regexp {.*pcmTrellis/viterbi_top/acs.*/C$}] -to [get_pins -hierarchical -regexp {.*pcmTrellis/viterbi_top/acs.*/D$}]

