
create_clock -period 10.714 -name MonClk -waveform {0.000 5.357} [get_ports MonClk]
create_clock -period 2.678 -name VIRTUAL_clk_Nx_SerDesPll_1 -waveform {0.000 1.339}
set_false_path -from [get_ports {FPGA_ID0 FPGA_ID1}] -to *
set_false_path -from * -to [get_ports {{NextDataIO_n[*]} {PrevDataIO_n[*]}}]
