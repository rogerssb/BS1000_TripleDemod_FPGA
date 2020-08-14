
set_clock_groups -asynchronous -group [get_clocks -include_generated_clocks fbClk] -group [get_clocks -include_generated_clocks sysClk]

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



set_property BITSTREAM.CONFIG.CONFIGRATE 66 [current_design]
set_property CONFIG_VOLTAGE 3.3 [current_design]
set_property CFGBVS VCCO [current_design]
set_property BITSTREAM.CONFIG.SPI_32BIT_ADDR YES [current_design]
set_property BITSTREAM.CONFIG.SPI_BUSWIDTH 1 [current_design]


