set_property CONFIG_VOLTAGE 3.3 [current_design]
set_property CFGBVS VCCO [current_design]

set_property PACKAGE_PIN F24 [get_ports spare]
set_property PACKAGE_PIN C12 [get_ports sysClk]
set_property PACKAGE_PIN G25 [get_ports dqmCapUart_O]
set_property PACKAGE_PIN J25 [get_ports singleEndedClk]
set_property PACKAGE_PIN J24 [get_ports singleEndedData]

set_property SLEW SLOW [get_ports spare]
set_property IOSTANDARD LVCMOS33 [get_ports spare]
set_property IOSTANDARD LVCMOS33 [get_ports dqmCapUart_O]
set_property IOSTANDARD LVCMOS33 [get_ports sysClk]
set_property IOSTANDARD LVCMOS33 [get_ports singleEndedClk]
set_property IOSTANDARD LVCMOS33 [get_ports singleEndedData]


create_clock -period 25.000 -name singleEndedClk -waveform {0.000 12.500} [get_ports singleEndedClk]
set_input_delay -clock [get_clocks singleEndedClk] -min -add_delay 12.500 [get_ports singleEndedData]
set_input_delay -clock [get_clocks singleEndedClk] -max -add_delay 12.500 [get_ports singleEndedData]
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets singleEndedClk_IBUF]
set_clock_groups -asynchronous -group [get_clocks -include_generated_clocks singleEndedClk] -group [get_clocks -include_generated_clocks sysClk]


set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets singleEndedClk_IBUF_BUFG]
