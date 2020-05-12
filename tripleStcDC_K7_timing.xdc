create_clock -period 500.000 -name spiClk -waveform {0.000 250.000} [get_ports spiClk]
create_clock -period 500.000 -name busClk -waveform {0.000 250.000} [get_pins spiBufg/O]

create_clock -period 6.250 -name pll0_OUT1 -waveform {0.000 3.125} [get_ports pll0_OUT1]
create_clock -period 6.250 -name pll1_OUT1 -waveform {0.000 3.125} [get_ports pll1_OUT1]


create_generated_clock -name PllReadClk0 -source [get_ports pll0_OUT1] -divide_by 4 -add -master_clock pll0_OUT1 [get_pins {cAndD0/pllDivider_reg[0]/Q}]
create_generated_clock -name Pll90Clk0 -source [get_ports pll0_OUT1] -divide_by 4 -add -master_clock pll0_OUT1 [get_pins {cAndD0/pllDivider_reg[1]/Q}]
create_generated_clock -name Pll90Clk1 -source [get_ports pll1_OUT1] -divide_by 4 -add -master_clock pll1_OUT1 [get_pins {cAndD1/pllDivider_reg[1]/Q}]
create_generated_clock -name PllReadClk1 -source [get_ports pll1_OUT1] -divide_by 4 -add -master_clock pll1_OUT1 [get_pins {cAndD1/pllDivider_reg[0]/Q}]

set_clock_groups -asynchronous -group [get_clocks -include_generated_clocks spiClk] -group [get_clocks -include_generated_clocks busClk] -group [get_clocks -include_generated_clocks adc0Clk] -group [get_clocks -include_generated_clocks pll0_OUT1] -group [get_clocks -include_generated_clocks pll1_OUT1]

set_input_delay -clock [get_clocks adc0Clk] -min -add_delay 1.800 [get_ports {adc0[*]}]
set_input_delay -clock [get_clocks adc0Clk] -max -add_delay 5.400 [get_ports {adc0[*]}]

set_output_delay -clock [get_clocks adc0Clk] -min -add_delay -0.100 [get_ports {dac0_d[*]}]
set_output_delay -clock [get_clocks adc0Clk] -max -add_delay 3.400 [get_ports {dac0_d[*]}]
set_output_delay -clock [get_clocks adc0Clk] -min -add_delay -0.100 [get_ports {dac1_d[*]}]
set_output_delay -clock [get_clocks adc0Clk] -max -add_delay 3.400 [get_ports {dac1_d[*]}]

set_false_path -to [get_ports {lockLed*n spiFlashMOSI spiFlashCSn ch*DataOut ch*ClkOut}]

set_false_path -from [get_pins -hierarchical -regexp {.*stcDemod/Trellis_u/td/stageSetup[0-9]*/refValid_reg.*/C$.*}] -to [get_pins -hierarchical -regexp {.*/td/stage[0-9]*/acs[0-9]*/cmag/.*/p_reg/A\[.*}]
set_false_path -from [get_pins -hierarchical -regexp {.*stcDemod/Trellis_u/td/stage[0-9]*/wrAddr_reg\[.*/C$.*}] -to [get_pins -hierarchical -regexp {.*/td/stage[0-9]*/acs[0-9]*/cmag/.*/p_reg/A\[.*}]
set_false_path -from [get_pins -hierarchical -regexp {.*stcDemod/Trellis_u/td/stageSetup[0-9]*/refValid_reg.*/C$.*}] -to [get_pins -hierarchical -regexp {.*/td/stage[0-9]*/acs[0-9]*/cmag/.*/p_reg/B\[.*}]
set_false_path -from [get_pins -hierarchical -regexp {.*stcDemod/Trellis_u/td/stage[0-9]*/wrAddr_reg\[.*/C$.*}] -to [get_pins -hierarchical -regexp {.*/td/stage[0-9]*/acs[0-9]*/cmag/.*/p_reg/B\[.*}]

set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets clk2x]
