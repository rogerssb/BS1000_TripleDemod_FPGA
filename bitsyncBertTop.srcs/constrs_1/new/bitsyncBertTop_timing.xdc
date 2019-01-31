create_clock -period 32.000 -name virtual_clock
create_clock -period 25.000 -name pll0_OUT1 -waveform {0.000 12.500} [get_ports pll0_OUT1]
create_clock -period 25.000 -name pll1_OUT1 -waveform {0.000 12.500} [get_ports pll1_OUT1]
create_clock -period 25.000 -name pll2_OUT1 -waveform {0.000 12.500} [get_ports pll2_OUT1]
create_clock -period 25.000 -name differentialClk -waveform {0.000 12.500} [get_ports differentialClk]
create_clock -period 25.000 -name singleEndedClk -waveform {0.000 12.500} [get_ports singleEndedClk]
#create_generated_clock -name {pll0Divider_reg_n_0_[0]} -source [get_ports pll0_OUT1] -divide_by 4 [get_pins {pll0Divider_reg[0]/Q}]
#create_generated_clock -name {pll1Divider_reg_n_0_[0]} -source [get_ports pll1_OUT1] -divide_by 4 [get_pins {pll1Divider_reg[0]/Q}]
create_generated_clock -name cAndD0/dll/dllOutputClk -source [get_pins systemClock/inst/mmcm_adv_inst/CLKOUT0] -divide_by 1 [get_pins cAndD0/dll/dllOutputClk_reg/Q]
create_generated_clock -name {cAndD0/dllDivider_reg_n_0_[0]} -source [get_pins cAndD0/dll/dllOutputClk_reg/Q] -divide_by 4 [get_pins {cAndD0/dllDivider_reg[0]/Q}]
create_generated_clock -name {cAndD0/pllDivider_reg_n_0_[0]} -source [get_ports pll0_OUT1] -divide_by 4 [get_pins {cAndD0/pllDivider_reg[0]/Q}]
create_generated_clock -name cAndD1/dll/dllOutputClk -source [get_pins systemClock/inst/mmcm_adv_inst/CLKOUT0] -divide_by 1 [get_pins cAndD1/dll/dllOutputClk_reg/Q]
create_generated_clock -name {cAndD1/dllDivider_reg_n_0_[0]} -source [get_pins cAndD1/dll/dllOutputClk_reg/Q] -divide_by 4 [get_pins {cAndD1/dllDivider_reg[0]/Q}]
create_generated_clock -name {cAndD1/pllDivider_reg_n_0_[0]} -source [get_ports pll1_OUT1] -divide_by 4 [get_pins {cAndD1/pllDivider_reg[0]/Q}]
create_generated_clock -name cAndD2/dll/dllOutputClk -source [get_pins systemClock/inst/mmcm_adv_inst/CLKOUT0] -divide_by 1 [get_pins cAndD2/dll/dllOutputClk_reg/Q]
create_generated_clock -name {cAndD2/dllDivider_reg_n_0_[0]} -source [get_pins cAndD2/dll/dllOutputClk_reg/Q] -divide_by 4 [get_pins {cAndD2/dllDivider_reg[0]/Q}]
create_generated_clock -name {cAndD2/pllDivider_reg_n_0_[0]} -source [get_ports pll2_OUT1] -divide_by 4 [get_pins {cAndD2/pllDivider_reg[0]/Q}]

set_input_delay -clock [get_clocks sysClk] -min -add_delay 1.800 [get_ports {adc0[*]}]
set_input_delay -clock [get_clocks sysClk] -max -add_delay 5.400 [get_ports {adc0[*]}]
set_input_delay -clock [get_clocks sysClk] -min -add_delay 1.800 [get_ports {adc1[*]}]
set_input_delay -clock [get_clocks sysClk] -max -add_delay 5.400 [get_ports {adc1[*]}]
set_input_delay -clock [get_clocks fbClk] -min -add_delay 0.500 [get_ports {fb_addr[*]}]
set_input_delay -clock [get_clocks fbClk] -max -add_delay 13.500 [get_ports {fb_addr[*]}]
set_input_delay -clock [get_clocks fbClk] -min -add_delay 0.500 [get_ports fb_ale]
set_input_delay -clock [get_clocks fbClk] -max -add_delay 13.500 [get_ports fb_ale]
set_input_delay -clock [get_clocks fbClk] -min -add_delay 0.500 [get_ports fb_csn]
set_input_delay -clock [get_clocks fbClk] -max -add_delay 13.500 [get_ports fb_csn]
set_input_delay -clock [get_clocks fbClk] -min -add_delay 0.500 [get_ports fb_wrn]
set_input_delay -clock [get_clocks fbClk] -max -add_delay 13.500 [get_ports fb_wrn]
set_input_delay -clock [get_clocks virtual_clock] -min -add_delay 1.000 [get_ports fb_oen]
set_input_delay -clock [get_clocks virtual_clock] -max -add_delay 1.000 [get_ports fb_oen]
set_input_delay -clock [get_clocks differentialClk] -min -add_delay 12.500 [get_ports differentialData]
set_input_delay -clock [get_clocks differentialClk] -max -add_delay 12.500 [get_ports differentialData]
set_input_delay -clock [get_clocks singleEndedClk] -min -add_delay 12.500 [get_ports singleEndedData]
set_input_delay -clock [get_clocks singleEndedClk] -max -add_delay 12.500 [get_ports singleEndedData]

set_output_delay -clock [get_clocks sysClk] -min -add_delay -0.100 [get_ports {dac0_d[*]}]
set_output_delay -clock [get_clocks sysClk] -max -add_delay 3.400 [get_ports {dac0_d[*]}]
set_output_delay -clock [get_clocks sysClk] -min -add_delay -0.100 [get_ports {dac1_d[*]}]
set_output_delay -clock [get_clocks sysClk] -max -add_delay 3.400 [get_ports {dac1_d[*]}]
set_output_delay -clock [get_clocks sysClk] -min -add_delay -0.100 [get_ports {dac2_d[*]}]
set_output_delay -clock [get_clocks sysClk] -max -add_delay 3.400 [get_ports {dac2_d[*]}]
set_output_delay -clock [get_clocks fbClk] -min -add_delay -0.500 [get_ports {fb_data[*]}]
set_output_delay -clock [get_clocks fbClk] -max -add_delay 15.500 [get_ports {fb_data[*]}]
set_output_delay -clock [get_clocks virtual_clock] -min -add_delay 1.000 [get_ports {fb_data[0]}]
set_output_delay -clock [get_clocks virtual_clock] -max -add_delay 1.000 [get_ports {fb_data[0]}]
set_output_delay -clock [get_clocks virtual_clock] -min -add_delay 1.000 [get_ports {fb_data[1]}]
set_output_delay -clock [get_clocks virtual_clock] -max -add_delay 1.000 [get_ports {fb_data[1]}]
set_output_delay -clock [get_clocks virtual_clock] -min -add_delay 1.000 [get_ports {fb_data[2]}]
set_output_delay -clock [get_clocks virtual_clock] -max -add_delay 1.000 [get_ports {fb_data[2]}]
set_output_delay -clock [get_clocks virtual_clock] -min -add_delay 1.000 [get_ports {fb_data[3]}]
set_output_delay -clock [get_clocks virtual_clock] -max -add_delay 1.000 [get_ports {fb_data[3]}]
set_output_delay -clock [get_clocks virtual_clock] -min -add_delay 1.000 [get_ports {fb_data[4]}]
set_output_delay -clock [get_clocks virtual_clock] -max -add_delay 1.000 [get_ports {fb_data[4]}]
set_output_delay -clock [get_clocks virtual_clock] -min -add_delay 1.000 [get_ports {fb_data[5]}]
set_output_delay -clock [get_clocks virtual_clock] -max -add_delay 1.000 [get_ports {fb_data[5]}]
set_output_delay -clock [get_clocks virtual_clock] -min -add_delay 1.000 [get_ports {fb_data[6]}]
set_output_delay -clock [get_clocks virtual_clock] -max -add_delay 1.000 [get_ports {fb_data[6]}]
set_output_delay -clock [get_clocks virtual_clock] -min -add_delay 1.000 [get_ports {fb_data[7]}]
set_output_delay -clock [get_clocks virtual_clock] -max -add_delay 1.000 [get_ports {fb_data[7]}]
set_output_delay -clock [get_clocks virtual_clock] -min -add_delay 1.000 [get_ports {fb_data[8]}]
set_output_delay -clock [get_clocks virtual_clock] -max -add_delay 1.000 [get_ports {fb_data[8]}]
set_output_delay -clock [get_clocks virtual_clock] -min -add_delay 1.000 [get_ports {fb_data[9]}]
set_output_delay -clock [get_clocks virtual_clock] -max -add_delay 1.000 [get_ports {fb_data[9]}]
set_output_delay -clock [get_clocks virtual_clock] -min -add_delay 1.000 [get_ports {fb_data[10]}]
set_output_delay -clock [get_clocks virtual_clock] -max -add_delay 1.000 [get_ports {fb_data[10]}]
set_output_delay -clock [get_clocks virtual_clock] -min -add_delay 1.000 [get_ports {fb_data[11]}]
set_output_delay -clock [get_clocks virtual_clock] -max -add_delay 1.000 [get_ports {fb_data[11]}]
set_output_delay -clock [get_clocks virtual_clock] -min -add_delay 1.000 [get_ports {fb_data[12]}]
set_output_delay -clock [get_clocks virtual_clock] -max -add_delay 1.000 [get_ports {fb_data[12]}]
set_output_delay -clock [get_clocks virtual_clock] -min -add_delay 1.000 [get_ports {fb_data[13]}]
set_output_delay -clock [get_clocks virtual_clock] -max -add_delay 1.000 [get_ports {fb_data[13]}]
set_output_delay -clock [get_clocks virtual_clock] -min -add_delay 1.000 [get_ports {fb_data[14]}]
set_output_delay -clock [get_clocks virtual_clock] -max -add_delay 1.000 [get_ports {fb_data[14]}]
set_output_delay -clock [get_clocks virtual_clock] -min -add_delay 1.000 [get_ports {fb_data[15]}]
set_output_delay -clock [get_clocks virtual_clock] -max -add_delay 1.000 [get_ports {fb_data[15]}]
set_output_delay -clock [get_clocks sysClk] -min -add_delay -2.000 [get_ports bsClkOut]
set_output_delay -clock [get_clocks sysClk] -max -add_delay 4.000 [get_ports bsClkOut]
set_output_delay -clock [get_clocks sysClk] -min -add_delay -2.000 [get_ports bsDataOut]
set_output_delay -clock [get_clocks sysClk] -max -add_delay 4.000 [get_ports bsDataOut]
set_output_delay -clock [get_clocks sysClk] -min -add_delay -2.000 [get_ports bsDiffClkOut]
set_output_delay -clock [get_clocks sysClk] -max -add_delay 4.000 [get_ports bsDiffClkOut]
set_output_delay -clock [get_clocks sysClk] -min -add_delay -2.000 [get_ports bsDiffDataOut]
set_output_delay -clock [get_clocks sysClk] -max -add_delay 4.000 [get_ports bsDiffDataOut]
set_output_delay -clock [get_clocks sysClk] -min -add_delay -2.000 [get_ports encClkOut]
set_output_delay -clock [get_clocks sysClk] -max -add_delay 4.000 [get_ports encClkOut]
set_output_delay -clock [get_clocks sysClk] -min -add_delay -2.000 [get_ports encDataOut]
set_output_delay -clock [get_clocks sysClk] -max -add_delay 4.000 [get_ports encDataOut]
set_output_delay -clock [get_clocks sysClk] -min -add_delay -2.000 [get_ports fsClkOut]
set_output_delay -clock [get_clocks sysClk] -max -add_delay 4.000 [get_ports fsClkOut]
set_output_delay -clock [get_clocks sysClk] -min -add_delay -2.000 [get_ports fsDataOut]
set_output_delay -clock [get_clocks sysClk] -max -add_delay 4.000 [get_ports fsDataOut]
set_output_delay -clock [get_clocks sysClk] -min -add_delay -2.000 [get_ports fsDiffClkOut]
set_output_delay -clock [get_clocks sysClk] -max -add_delay 4.000 [get_ports fsDiffClkOut]
set_output_delay -clock [get_clocks sysClk] -min -add_delay -2.000 [get_ports fsDiffDataOut]
set_output_delay -clock [get_clocks sysClk] -max -add_delay 4.000 [get_ports fsDiffDataOut]
set_output_delay -clock [get_clocks sysClk] -min -add_delay -2.500 [get_ports pll*_CS]
set_output_delay -clock [get_clocks sysClk] -max -add_delay 2.500 [get_ports pll*_CS]
set_output_delay -clock [get_clocks sysClk] -min -add_delay -2.500 [get_ports pll*_REF]
set_output_delay -clock [get_clocks sysClk] -max -add_delay 2.500 [get_ports pll*_REF]
set_output_delay -clock [get_clocks sysClk] -min -add_delay -2.500 [get_ports pll_SCK]
set_output_delay -clock [get_clocks sysClk] -max -add_delay 2.500 [get_ports pll_SCK]
set_output_delay -clock [get_clocks sysClk] -min -add_delay -2.500 [get_ports pll_SDI]
set_output_delay -clock [get_clocks sysClk] -max -add_delay 2.500 [get_ports pll_SDI]
set_output_delay -clock [get_clocks sysClk] -min -add_delay -10.000 [get_ports dacSCLK]
set_output_delay -clock [get_clocks sysClk] -max -add_delay 15.000 [get_ports dacSCLK]
set_output_delay -clock [get_clocks sysClk] -min -add_delay -10.000 [get_ports dacMOSI]
set_output_delay -clock [get_clocks sysClk] -max -add_delay 15.000 [get_ports dacMOSI]
set_output_delay -clock [get_clocks sysClk] -min -add_delay -10.000 [get_ports ch*SELn]
set_output_delay -clock [get_clocks sysClk] -max -add_delay 15.000 [get_ports ch*SELn]
set_output_delay -clock [get_clocks differentialClk] -min -add_delay 0.000 [get_ports framer_Sync]
set_output_delay -clock [get_clocks differentialClk] -max -add_delay 5.000 [get_ports framer_Sync]
set_output_delay -clock [get_clocks singleEndedClk] -min -add_delay 0.000 [get_ports framer_Sync]
set_output_delay -clock [get_clocks singleEndedClk] -max -add_delay 5.000 [get_ports framer_Sync]
set_output_delay -clock [get_clocks fbClk] -min -add_delay 0.000 [get_ports spareData]
set_output_delay -clock [get_clocks fbClk] -max -add_delay 5.000 [get_ports spareData]
set_output_delay -clock [get_clocks sysClk] -min -add_delay 0.000 [get_ports spareData]
set_output_delay -clock [get_clocks sysClk] -max -add_delay 5.000 [get_ports spareData]
set_output_delay -clock [get_clocks differentialClk] -min -add_delay 0.000 [get_ports spareData]
set_output_delay -clock [get_clocks differentialClk] -max -add_delay 5.000 [get_ports spareData]
set_output_delay -clock [get_clocks pll0_OUT1] -min -add_delay 0.000 [get_ports spareData]
set_output_delay -clock [get_clocks pll0_OUT1] -max -add_delay 5.000 [get_ports spareData]
set_output_delay -clock [get_clocks pll1_OUT1] -min -add_delay 0.000 [get_ports spareData]
set_output_delay -clock [get_clocks pll1_OUT1] -max -add_delay 5.000 [get_ports spareData]
set_output_delay -clock [get_clocks pll2_OUT1] -min -add_delay 0.000 [get_ports spareData]
set_output_delay -clock [get_clocks pll2_OUT1] -max -add_delay 5.000 [get_ports spareData]
set_output_delay -clock [get_clocks singleEndedClk] -min -add_delay 0.000 [get_ports spareData]
set_output_delay -clock [get_clocks singleEndedClk] -max -add_delay 5.000 [get_ports spareData]

set_property BITSTREAM.CONFIG.CONFIGRATE 50 [current_design]
set_property CONFIG_VOLTAGE 3.3 [current_design]
set_property CFGBVS VCCO [current_design]
set_property BITSTREAM.CONFIG.SPI_BUSWIDTH 1 [current_design]

set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets pll0_OUT1_IBUF]
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets pll2_OUT1_IBUF]
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets singleEndedClk_IBUF]
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets singleEndedClk_IBUF_BUFG]
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets differentialClk_IBUF]
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets differentialClk_IBUF_BUFG]





set_clock_groups -asynchronous -group [get_clocks -include_generated_clocks fbClk] -group [get_clocks -include_generated_clocks sysClk]
set_clock_groups -asynchronous -group [get_clocks -include_generated_clocks differentialClk] -group [get_clocks -include_generated_clocks sysClk]
set_clock_groups -asynchronous -group [get_clocks -include_generated_clocks singleEndedClk] -group [get_clocks -include_generated_clocks sysClk]
set_clock_groups -asynchronous -group [get_clocks -include_generated_clocks pll0_OUT1] -group [get_clocks -include_generated_clocks sysClk]
set_clock_groups -asynchronous -group [get_clocks -include_generated_clocks pll1_OUT1] -group [get_clocks -include_generated_clocks sysClk]
set_clock_groups -asynchronous -group [get_clocks -include_generated_clocks pll2_OUT1] -group [get_clocks -include_generated_clocks sysClk]
# set_clock_groups -asynchronous -group [get_clocks -include_generated_clocks fbClk] -group [get_clocks -include_generated_clocks singleEndedClk]
# set_clock_groups -asynchronous -group [get_clocks -include_generated_clocks fbClk] -group [get_clocks -include_generated_clocks differentialClk]
# set_clock_groups -asynchronous -group [get_clocks -include_generated_clocks fbClk] -group [get_clocks -include_generated_clocks pll0_OUT1]
# set_clock_groups -asynchronous -group [get_clocks -include_generated_clocks fbClk] -group [get_clocks -include_generated_clocks pll1_OUT1]
# set_clock_groups -asynchronous -group [get_clocks -include_generated_clocks singleEndedClk] -group [get_clocks -include_generated_clocks differentialClk]
# set_clock_groups -asynchronous -group [get_clocks -include_generated_clocks singleEndedClk] -group [get_clocks -include_generated_clocks pll0_OUT1]
# set_clock_groups -asynchronous -group [get_clocks -include_generated_clocks singleEndedClk] -group [get_clocks -include_generated_clocks pll1_OUT1]
# set_clock_groups -asynchronous -group [get_clocks -include_generated_clocks singleEndedClk] -group [get_clocks -include_generated_clocks sysClk]
# set_clock_groups -asynchronous -group [get_clocks -include_generated_clocks differentialClk] -group [get_clocks -include_generated_clocks pll0_OUT1]
# set_clock_groups -asynchronous -group [get_clocks -include_generated_clocks differentialClk] -group [get_clocks -include_generated_clocks pll1_OUT1]
# set_clock_groups -asynchronous -group [get_clocks -include_generated_clocks differentialClk] -group [get_clocks -include_generated_clocks sysClk]
# set_clock_groups -asynchronous -group [get_clocks -include_generated_clocks pll0_OUT1] -group [get_clocks -include_generated_clocks pll1_OUT1]
# set_clock_groups -asynchronous -group [get_clocks -include_generated_clocks pll0_OUT1] -group [get_clocks -include_generated_clocks sysClk]
# set_clock_groups -asynchronous -group [get_clocks -include_generated_clocks pll1_OUT1] -group [get_clocks -include_generated_clocks sysClk]

# set_multicycle_path -from [get_pins {dacInterface/sr_reg[15]/C}] -to [get_ports dacMOSI] 2








set_false_path -from [all_registers] -to [get_ports fb_data*]
set_false_path -from [get_ports fb_oen*] -to [get_ports fb_data*]
set_false_path -from [get_clocks fbClk] -to [get_ports bsClkOut]
set_false_path -from [get_clocks fbClk] -to [get_ports bsDataOut]
set_false_path -from [get_clocks fbClk] -to [get_ports bsDiffClkOut]
set_false_path -from [get_clocks fbClk] -to [get_ports bsDiffDataOut]
set_false_path -from [get_clocks fbClk] -to [get_ports encClkOut]
set_false_path -from [get_clocks fbClk] -to [get_ports encDataOut]
set_false_path -from [get_clocks fbClk] -to [get_ports fsClkOut]
set_false_path -from [get_clocks fbClk] -to [get_ports fsDataOut]
set_false_path -from [get_clocks fbClk] -to [get_ports fsDiffClkOut]
set_false_path -from [get_clocks fbClk] -to [get_ports fsDiffDataOut]
set_false_path -from [get_clocks sysClk] -to [get_ports ch0Lockn]
set_false_path -from [get_clocks sysClk] -to [get_ports ch1Lockn]
set_false_path -from [get_clocks fbClk] -to [get_ports pll*_PWDn]
set_false_path -from [get_clocks fbClk] -to [get_ports ch*HighImpedance]
set_false_path -from [get_clocks fbClk] -to [get_ports ch*SingleEnded]



