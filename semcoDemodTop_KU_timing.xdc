set_property BITSTREAM.GENERAL.SYSMONPOWERDOWN ENABLE [current_design]
set_property BITSTREAM.CONFIG.CONFIGRATE 50 [current_design]
set_property CONFIG_VOLTAGE 3.3 [current_design]
set_property CFGBVS VCCO [current_design]
set_property BITSTREAM.CONFIG.SPI_BUSWIDTH 1 [current_design]

create_clock -period 500.000 -name spiClk -waveform {0.000 250.000} [get_ports spiClk]

set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets spiClk_IBUF_inst/O]

# set_clock_groups -asynchronous -group [get_clocks -include_generated_clocks spiBusClock/inst/clk_in1] -group [get_clocks -include_generated_clocks adc0Clock]
set_clock_groups -asynchronous -group [get_clocks -include_generated_clocks spiClk] -group [get_clocks -include_generated_clocks adc0Clock]

