create_clock -period 10.714 -name MonClk -waveform {0.000 5.357} [get_ports MonClk]
create_clock -period 10.714 -name DdsPdClk -waveform {0.000 5.357} [get_ports DdsPdClk]

#create_clock -period 2.140 -name SerDesClk1 -waveform {0.000 1.070} [get_ports NextClkIO_p]
#create_clock -period 2.140 -name SerDesClk2 -waveform {0.000 1.070} [get_ports PrevClkIO_p]
set_clock_groups -name AsynchClks -asynchronous -group [get_clocks {MonClk DdsPdClk}] -group [get_clocks [get_clocks -of_objects [get_pins SerDes_u/Pll200/inst/mmcm_adv_inst/CLKOUT0]]] -group [get_clocks [list [get_clocks -of_objects [get_pins SerDes_u/PllXn_u/inst/mmcm_adv_inst/CLKOUT1]] [get_clocks -of_objects [get_pins SerDes_u/PllXn_u/inst/mmcm_adv_inst/CLKOUT0]]]]
# -group [get_clocks SerDesClk1] -group [get_clocks SerDesClk2]

set_false_path -from [get_ports {FPGA_ID* NextClk_p {NextData_p[*]} PrevClk_p {PrevData_p[*]}}] -to *







