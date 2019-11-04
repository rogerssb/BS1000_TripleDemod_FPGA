set_property BITSTREAM.CONFIG.CONFIGRATE 50 [current_design]
set_property CONFIG_VOLTAGE 3.3 [current_design]
set_property CFGBVS VCCO [current_design]
set_property BITSTREAM.CONFIG.SPI_BUSWIDTH 1 [current_design]
set_property CONFIG_MODE SPIx1 [current_design]

create_clock -period 6.250 -name pll0_OUT1 -waveform {0.000 3.125} [get_ports pll0_OUT1]
create_clock -period 6.250 -name pll1_OUT1 -waveform {0.000 3.125} [get_ports pll1_OUT1]

create_generated_clock -name cAndD0/dll/dllOutputClk_reg/Q -source [get_ports sysClk] -divide_by 2 [get_pins cAndD0/dll/dllOutputClk_reg/Q]
create_generated_clock -name {cAndD0/dllDivider_reg[0]/Q} -source [get_ports sysClk] -divide_by 4 [get_pins {cAndD0/dllDivider_reg[0]/Q}]
create_generated_clock -name {cAndD0/pllDivider_reg[0]/Q} -source [get_ports pll0_OUT1] -divide_by 4 -add -master_clock pll0_OUT1 [get_pins {cAndD0/pllDivider_reg[0]/Q}]

create_generated_clock -name cAndD1/dll/dllOutputClk_reg/Q -source [get_ports sysClk] -divide_by 2 [get_pins cAndD1/dll/dllOutputClk_reg/Q]
create_generated_clock -name {cAndD1/dllDivider_reg[0]/Q} -source [get_ports sysClk] -divide_by 4 [get_pins {cAndD1/dllDivider_reg[0]/Q}]
create_generated_clock -name {cAndD1/pllDivider_reg[0]/Q} -source [get_ports pll1_OUT1] -divide_by 4 -add -master_clock pll1_OUT1 [get_pins {cAndD1/pllDivider_reg[0]/Q}]


set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets pll0_OUT1_IBUF]

set_clock_groups -asynchronous -group [get_clocks -include_generated_clocks fbClk] -group [get_clocks -include_generated_clocks sysClk] -group [get_clocks -include_generated_clocks pll0_OUT1] -group [get_clocks -include_generated_clocks pll1_OUT1] -group [get_clocks {cAndD0/dll/dllOutputClk_reg/Q {cAndD0/dllDivider_reg[0]/Q} {cAndD0/pllDivider_reg[0]/Q}}] -group [get_clocks {cAndD1/dll/dllOutputClk_reg/Q {cAndD1/dllDivider_reg[0]/Q} {cAndD1/pllDivider_reg[0]/Q}}]

set_input_delay -clock [get_clocks sysClk] -min -add_delay 0.000 [get_ports spiFlashMISO]
set_input_delay -clock [get_clocks sysClk] -max -add_delay 2.000 [get_ports spiFlashMISO]
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

set_output_delay -clock [get_clocks fbClk] -min -add_delay -0.500 [get_ports {fb_data[*]}]
set_output_delay -clock [get_clocks fbClk] -max -add_delay 8.500 [get_ports {fb_data[*]}]
set_output_delay -clock [get_clocks sysClk] -min -add_delay -0.100 [get_ports {dac*_d[*]}]
set_output_delay -clock [get_clocks sysClk] -max -add_delay 3.400 [get_ports {dac*_d[*]}]

set_false_path -from * -to [get_ports {lockLed*n pll*_CS pll*_REF pll_SCK pll_SDI spiFlashMOSI spiFlashCSn ch*DataOut ch*ClkOut}]

set_false_path -from [get_pins stcDemod/Trellis_u/td/stageSetup*/refValid_reg/C] -to [get_pins {stcDemod/Trellis_u/td/stage*/acs*/cmag/mpy*/U0/i_mult/gDSP.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/inferred_dsp.reg_mult.m_reg_reg/A[*]}]
set_false_path -from [get_pins {stcDemod/Trellis_u/td/stage*/wrAddr_reg[*]/C}] -to [get_pins {stcDemod/Trellis_u/td/stage*/acs*/cmag/mpy*/U0/i_mult/gDSP.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/inferred_dsp.reg_mult.m_reg_reg/A[*]}]
set_false_path -from [get_pins stcDemod/Trellis_u/td/stageSetup*/refValid_reg/C] -to [get_pins {stcDemod/Trellis_u/td/stage*/acs*/cmag/mpy*/U0/i_mult/gDSP.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/inferred_dsp.reg_mult.m_reg_reg/B[*]}]
set_false_path -from [get_pins {stcDemod/Trellis_u/td/stage*/wrAddr_reg[*]/C}] -to [get_pins {stcDemod/Trellis_u/td/stage*/acs*/cmag/mpy*/U0/i_mult/gDSP.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/inferred_dsp.reg_mult.m_reg_reg/B[*]}]





