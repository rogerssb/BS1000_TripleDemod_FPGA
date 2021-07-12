create_clock -period 10.714 -name DdsPdClk -waveform {0.000 5.357} -add [get_ports {SideCar[32]}]
set_clock_groups -name SideCarClk -asynchronous -group [get_clocks DdsPdClk]

set_false_path -from [get_ports {FPGA_ID* NextClk_p {NextData_p[*]} PrevClk_p {PrevData_p[*]}}] -to *

set_output_delay -clock [get_clocks DdsPdClk] -min -add_delay 0.000 [get_ports {SideCar[*]}]
set_output_delay -clock [get_clocks DdsPdClk] -max -add_delay 1.750 [get_ports {SideCar[*]}]
set_output_delay -clock [get_clocks DdsPdClk] -clock_fall -min -add_delay 0.000 [get_ports {SideCar[*]}]
set_output_delay -clock [get_clocks DdsPdClk] -clock_fall -max -add_delay 1.750 [get_ports {SideCar[*]}]

set_multicycle_path -setup -start -from [get_pins {DdsData_reg[*]/C}] -to [get_ports {SideCar[*}] 2
set_multicycle_path -hold -start -from [get_pins {DdsData_reg[*]/C}] -to [get_ports {SideCar[*}] 0

set_output_delay -clock [get_clocks DdsPdClk] 1.750 [get_ports {SideCar[*]}]






