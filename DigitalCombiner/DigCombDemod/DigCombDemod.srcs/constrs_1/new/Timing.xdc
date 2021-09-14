
create_clock -period 10.714 -name adc0Clk -waveform {0.000 5.357} [get_ports adc0Clk]
# create_clock -period 2.678 -name VIRTUAL_clk_Nx_SerDesPll_1 -waveform {0.000 1.339}
set_false_path -from [get_ports {FPGA_ID0 FPGA_ID1}] -to *
# set_false_path -from * -to [get_ports {{NextData_n[*]} {PrevData_n[*]}}]





