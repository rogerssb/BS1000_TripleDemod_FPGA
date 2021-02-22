create_clock -period 10.714 -name MonClk -waveform {0.000 5.357} [get_ports MonClk]
create_clock -period 10.714 -name DdsPdClk -waveform {0.000 5.357} -add [get_ports {SideCar[32]}]

##create_clock -period 2.140 -name SerDesClk1 -waveform {0.000 1.070} [get_ports NextClkIO_p]
##create_clock -period 2.140 -name SerDesClk2 -waveform {0.000 1.070} [get_ports PrevClkIO_p]
#set_clock_groups -name AsynchClks -asynchronous -group [get_clocks {MonClk DdsPdClk}] -group [get_clocks [get_clocks -of_objects [get_pins SerDes_u/Pll200/inst/mmcm_adv_inst/CLKOUT0]]] -group [get_clocks [list [get_clocks -of_objects [get_pins SerDes_u/PllXn_u/inst/mmcm_adv_inst/CLKOUT1]] [get_clocks -of_objects [get_pins SerDes_u/PllXn_u/inst/mmcm_adv_inst/CLKOUT0]]]]
## -group [get_clocks SerDesClk1] -group [get_clocks SerDesClk2]
#
#set_false_path -from [get_ports {FPGA_ID* NextClk_p {NextData_p[*]} PrevClk_p {PrevData_p[*]}}] -to *

set_output_delay -clock [get_clocks DdsPdClk] -min -add_delay 0.000 [get_ports {SideCar[*]}]
set_output_delay -clock [get_clocks DdsPdClk] -max -add_delay 1.750 [get_ports {SideCar[*]}]
set_output_delay -clock [get_clocks DdsPdClk] -clock_fall -min -add_delay 0.000 [get_ports {SideCar[*]}]
set_output_delay -clock [get_clocks DdsPdClk] -clock_fall -max -add_delay 1.750 [get_ports {SideCar[*]}]

set_multicycle_path -setup -start -from [get_pins {DdsData_reg[*]/C}] -to [get_ports {SideCar[*}] 2
set_multicycle_path -hold -start -from [get_pins {DdsData_reg[*]/C}] -to [get_ports {SideCar[*}] 0

set_output_delay -clock [get_clocks DdsPdClk] 1.750 [get_ports {SideCar[*]}]
set_output_delay -clock [get_clocks MonClk] 2.300 [get_ports {{dac0_d[*]} {dac1_d[*]}}]
set_false_path -from * -to [get_ports lockLed*n]


