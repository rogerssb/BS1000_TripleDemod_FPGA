create_clock -period 10.714 -name adc_dco_p -waveform {0.000 5.357} [get_ports adc_dco_p]
create_clock -period 5.357 -name Clk186 -waveform {0.000 2.679} -add [get_nets Clk]

set_max_delay -to [get_ports {ClkOut DataOut Blink PilotFound}] 10.000

set_input_delay -clock [get_clocks adc_dco_p] -clock_fall -min -add_delay -0.200 [get_ports {{adc_data_in_p[*]} OverRange_p}]
set_input_delay -clock [get_clocks adc_dco_p] -clock_fall -max -add_delay 0.200 [get_ports {{adc_data_in_p[*]} OverRange_p}]
set_input_delay -clock [get_clocks adc_dco_p] -min -add_delay -0.200 [get_ports {{adc_data_in_p[*]} OverRange_n}]
set_input_delay -clock [get_clocks adc_dco_p] -max -add_delay 0.200 [get_ports {{adc_data_in_p[*]} OverRange_n}]

set_max_delay -from [get_pins {Brik1_u/PD_u/Max_reg[*]/C}] 10.000
set_max_delay -from [get_pins {Brik1_u/PD_u/MaxIndex_reg[*]/C}] 10.000
set_max_delay -to [get_ports OverRange] 10.000

set_input_delay -clock [get_clocks adc_dco_p] -min -add_delay -0.200 [get_ports {adc_data_in_n[*]}]
set_input_delay -clock [get_clocks adc_dco_p] -max -add_delay 0.200 [get_ports {adc_data_in_n[*]}]
set_input_delay -clock [get_clocks adc_dco_p] -clock_fall -min -add_delay -0.200 [get_ports {adc_data_in_n[*]}]
set_input_delay -clock [get_clocks adc_dco_p] -clock_fall -max -add_delay 0.200 [get_ports {adc_data_in_n[*]}]
set_output_delay -clock [get_clocks Clk186] -min -add_delay -0.100 [get_ports {Blink ClkOut DataOut PilotFound}]
set_output_delay -clock [get_clocks Clk186] -max -add_delay 1.000 [get_ports {Blink ClkOut DataOut PilotFound}]

connect_debug_port u_ila_1/probe31 [get_nets [list {Brik1_u/DDC_imag[0]} {Brik1_u/DDC_imag[1]} {Brik1_u/DDC_imag[2]} {Brik1_u/DDC_imag[3]} {Brik1_u/DDC_imag[4]} {Brik1_u/DDC_imag[5]} {Brik1_u/DDC_imag[6]} {Brik1_u/DDC_imag[7]} {Brik1_u/DDC_imag[8]} {Brik1_u/DDC_imag[9]} {Brik1_u/DDC_imag[10]} {Brik1_u/DDC_imag[11]} {Brik1_u/DDC_imag[12]} {Brik1_u/DDC_imag[13]} {Brik1_u/DDC_imag[14]} {Brik1_u/DDC_imag[15]} {Brik1_u/DDC_imag[16]} {Brik1_u/DDC_imag[17]}]]
connect_debug_port u_ila_1/probe32 [get_nets [list {Brik1_u/DDC_real[0]} {Brik1_u/DDC_real[1]} {Brik1_u/DDC_real[2]} {Brik1_u/DDC_real[3]} {Brik1_u/DDC_real[4]} {Brik1_u/DDC_real[5]} {Brik1_u/DDC_real[6]} {Brik1_u/DDC_real[7]} {Brik1_u/DDC_real[8]} {Brik1_u/DDC_real[9]} {Brik1_u/DDC_real[10]} {Brik1_u/DDC_real[11]} {Brik1_u/DDC_real[12]} {Brik1_u/DDC_real[13]} {Brik1_u/DDC_real[14]} {Brik1_u/DDC_real[15]} {Brik1_u/DDC_real[16]} {Brik1_u/DDC_real[17]}]]

create_debug_core u_ila_0 ila
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_0]
set_property ALL_PROBE_SAME_MU_CNT 2 [get_debug_cores u_ila_0]
set_property C_ADV_TRIGGER false [get_debug_cores u_ila_0]
set_property C_DATA_DEPTH 8192 [get_debug_cores u_ila_0]
set_property C_EN_STRG_QUAL true [get_debug_cores u_ila_0]
set_property C_INPUT_PIPE_STAGES 3 [get_debug_cores u_ila_0]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_0]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_0]
set_property port_width 1 [get_debug_ports u_ila_0/clk]
connect_debug_port u_ila_0/clk [get_nets [list Clks/inst/clk_186]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe0]
set_property port_width 8 [get_debug_ports u_ila_0/probe0]
connect_debug_port u_ila_0/probe0 [get_nets [list {Brik1_u/PD_u/BadPilot_Ila[0]} {Brik1_u/PD_u/BadPilot_Ila[1]} {Brik1_u/PD_u/BadPilot_Ila[2]} {Brik1_u/PD_u/BadPilot_Ila[3]} {Brik1_u/PD_u/BadPilot_Ila[4]} {Brik1_u/PD_u/BadPilot_Ila[5]} {Brik1_u/PD_u/BadPilot_Ila[6]} {Brik1_u/PD_u/BadPilot_Ila[7]}]]
create_debug_core u_ila_1 ila
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_1]
set_property ALL_PROBE_SAME_MU_CNT 2 [get_debug_cores u_ila_1]
set_property C_ADV_TRIGGER false [get_debug_cores u_ila_1]
set_property C_DATA_DEPTH 8192 [get_debug_cores u_ila_1]
set_property C_EN_STRG_QUAL true [get_debug_cores u_ila_1]
set_property C_INPUT_PIPE_STAGES 3 [get_debug_cores u_ila_1]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_1]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_1]
set_property port_width 1 [get_debug_ports u_ila_1/clk]
connect_debug_port u_ila_1/clk [get_nets [list Clks/inst/Clk_373]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe0]
set_property port_width 5 [get_debug_ports u_ila_1/probe0]
connect_debug_port u_ila_1/probe0 [get_nets [list {Brik1_u/PD_u/iFftOnesHi[0]} {Brik1_u/PD_u/iFftOnesHi[1]} {Brik1_u/PD_u/iFftOnesHi[2]} {Brik1_u/PD_u/iFftOnesHi[3]} {Brik1_u/PD_u/iFftOnesHi[4]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe1]
set_property port_width 2 [get_debug_ports u_ila_0/probe1]
connect_debug_port u_ila_0/probe1 [get_nets [list {Brik1_u/PD_u/GoodPilot_Ila[0]} {Brik1_u/PD_u/GoodPilot_Ila[1]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe2]
set_property port_width 18 [get_debug_ports u_ila_0/probe2]
connect_debug_port u_ila_0/probe2 [get_nets [list {Brik1_u/PD_u/Peak1_Ila[0]} {Brik1_u/PD_u/Peak1_Ila[1]} {Brik1_u/PD_u/Peak1_Ila[2]} {Brik1_u/PD_u/Peak1_Ila[3]} {Brik1_u/PD_u/Peak1_Ila[4]} {Brik1_u/PD_u/Peak1_Ila[5]} {Brik1_u/PD_u/Peak1_Ila[6]} {Brik1_u/PD_u/Peak1_Ila[7]} {Brik1_u/PD_u/Peak1_Ila[8]} {Brik1_u/PD_u/Peak1_Ila[9]} {Brik1_u/PD_u/Peak1_Ila[10]} {Brik1_u/PD_u/Peak1_Ila[11]} {Brik1_u/PD_u/Peak1_Ila[12]} {Brik1_u/PD_u/Peak1_Ila[13]} {Brik1_u/PD_u/Peak1_Ila[14]} {Brik1_u/PD_u/Peak1_Ila[15]} {Brik1_u/PD_u/Peak1_Ila[16]} {Brik1_u/PD_u/Peak1_Ila[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe3]
set_property port_width 18 [get_debug_ports u_ila_0/probe3]
connect_debug_port u_ila_0/probe3 [get_nets [list {Brik1_u/PD_u/Peak2_Ila[0]} {Brik1_u/PD_u/Peak2_Ila[1]} {Brik1_u/PD_u/Peak2_Ila[2]} {Brik1_u/PD_u/Peak2_Ila[3]} {Brik1_u/PD_u/Peak2_Ila[4]} {Brik1_u/PD_u/Peak2_Ila[5]} {Brik1_u/PD_u/Peak2_Ila[6]} {Brik1_u/PD_u/Peak2_Ila[7]} {Brik1_u/PD_u/Peak2_Ila[8]} {Brik1_u/PD_u/Peak2_Ila[9]} {Brik1_u/PD_u/Peak2_Ila[10]} {Brik1_u/PD_u/Peak2_Ila[11]} {Brik1_u/PD_u/Peak2_Ila[12]} {Brik1_u/PD_u/Peak2_Ila[13]} {Brik1_u/PD_u/Peak2_Ila[14]} {Brik1_u/PD_u/Peak2_Ila[15]} {Brik1_u/PD_u/Peak2_Ila[16]} {Brik1_u/PD_u/Peak2_Ila[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe4]
set_property port_width 11 [get_debug_ports u_ila_0/probe4]
connect_debug_port u_ila_0/probe4 [get_nets [list {Brik1_u/PD_u/PilotIndex[0]} {Brik1_u/PD_u/PilotIndex[1]} {Brik1_u/PD_u/PilotIndex[2]} {Brik1_u/PD_u/PilotIndex[3]} {Brik1_u/PD_u/PilotIndex[4]} {Brik1_u/PD_u/PilotIndex[5]} {Brik1_u/PD_u/PilotIndex[6]} {Brik1_u/PD_u/PilotIndex[7]} {Brik1_u/PD_u/PilotIndex[8]} {Brik1_u/PD_u/PilotIndex[9]} {Brik1_u/PD_u/PilotIndex[10]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe5]
set_property port_width 18 [get_debug_ports u_ila_0/probe5]
connect_debug_port u_ila_0/probe5 [get_nets [list {Brik1_u/PD_u/PilotMag_Ila[0]} {Brik1_u/PD_u/PilotMag_Ila[1]} {Brik1_u/PD_u/PilotMag_Ila[2]} {Brik1_u/PD_u/PilotMag_Ila[3]} {Brik1_u/PD_u/PilotMag_Ila[4]} {Brik1_u/PD_u/PilotMag_Ila[5]} {Brik1_u/PD_u/PilotMag_Ila[6]} {Brik1_u/PD_u/PilotMag_Ila[7]} {Brik1_u/PD_u/PilotMag_Ila[8]} {Brik1_u/PD_u/PilotMag_Ila[9]} {Brik1_u/PD_u/PilotMag_Ila[10]} {Brik1_u/PD_u/PilotMag_Ila[11]} {Brik1_u/PD_u/PilotMag_Ila[12]} {Brik1_u/PD_u/PilotMag_Ila[13]} {Brik1_u/PD_u/PilotMag_Ila[14]} {Brik1_u/PD_u/PilotMag_Ila[15]} {Brik1_u/PD_u/PilotMag_Ila[16]} {Brik1_u/PD_u/PilotMag_Ila[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe6]
set_property port_width 18 [get_debug_ports u_ila_0/probe6]
connect_debug_port u_ila_0/probe6 [get_nets [list {Brik1_u/PD_u/Threshold_Ila[0]} {Brik1_u/PD_u/Threshold_Ila[1]} {Brik1_u/PD_u/Threshold_Ila[2]} {Brik1_u/PD_u/Threshold_Ila[3]} {Brik1_u/PD_u/Threshold_Ila[4]} {Brik1_u/PD_u/Threshold_Ila[5]} {Brik1_u/PD_u/Threshold_Ila[6]} {Brik1_u/PD_u/Threshold_Ila[7]} {Brik1_u/PD_u/Threshold_Ila[8]} {Brik1_u/PD_u/Threshold_Ila[9]} {Brik1_u/PD_u/Threshold_Ila[10]} {Brik1_u/PD_u/Threshold_Ila[11]} {Brik1_u/PD_u/Threshold_Ila[12]} {Brik1_u/PD_u/Threshold_Ila[13]} {Brik1_u/PD_u/Threshold_Ila[14]} {Brik1_u/PD_u/Threshold_Ila[15]} {Brik1_u/PD_u/Threshold_Ila[16]} {Brik1_u/PD_u/Threshold_Ila[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe7]
set_property port_width 13 [get_debug_ports u_ila_0/probe7]
connect_debug_port u_ila_0/probe7 [get_nets [list {Brik1_u/PS_u/IndexOut[0]} {Brik1_u/PS_u/IndexOut[1]} {Brik1_u/PS_u/IndexOut[2]} {Brik1_u/PS_u/IndexOut[3]} {Brik1_u/PS_u/IndexOut[4]} {Brik1_u/PS_u/IndexOut[5]} {Brik1_u/PS_u/IndexOut[6]} {Brik1_u/PS_u/IndexOut[7]} {Brik1_u/PS_u/IndexOut[8]} {Brik1_u/PS_u/IndexOut[9]} {Brik1_u/PS_u/IndexOut[10]} {Brik1_u/PS_u/IndexOut[11]} {Brik1_u/PS_u/IndexOut[12]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe8]
set_property port_width 18 [get_debug_ports u_ila_0/probe8]
connect_debug_port u_ila_0/probe8 [get_nets [list {Brik1_u/PS_u/ReadI_Ila[0]} {Brik1_u/PS_u/ReadI_Ila[1]} {Brik1_u/PS_u/ReadI_Ila[2]} {Brik1_u/PS_u/ReadI_Ila[3]} {Brik1_u/PS_u/ReadI_Ila[4]} {Brik1_u/PS_u/ReadI_Ila[5]} {Brik1_u/PS_u/ReadI_Ila[6]} {Brik1_u/PS_u/ReadI_Ila[7]} {Brik1_u/PS_u/ReadI_Ila[8]} {Brik1_u/PS_u/ReadI_Ila[9]} {Brik1_u/PS_u/ReadI_Ila[10]} {Brik1_u/PS_u/ReadI_Ila[11]} {Brik1_u/PS_u/ReadI_Ila[12]} {Brik1_u/PS_u/ReadI_Ila[13]} {Brik1_u/PS_u/ReadI_Ila[14]} {Brik1_u/PS_u/ReadI_Ila[15]} {Brik1_u/PS_u/ReadI_Ila[16]} {Brik1_u/PS_u/ReadI_Ila[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe9]
set_property port_width 18 [get_debug_ports u_ila_0/probe9]
connect_debug_port u_ila_0/probe9 [get_nets [list {Brik1_u/PS_u/ReadR_Ila[0]} {Brik1_u/PS_u/ReadR_Ila[1]} {Brik1_u/PS_u/ReadR_Ila[2]} {Brik1_u/PS_u/ReadR_Ila[3]} {Brik1_u/PS_u/ReadR_Ila[4]} {Brik1_u/PS_u/ReadR_Ila[5]} {Brik1_u/PS_u/ReadR_Ila[6]} {Brik1_u/PS_u/ReadR_Ila[7]} {Brik1_u/PS_u/ReadR_Ila[8]} {Brik1_u/PS_u/ReadR_Ila[9]} {Brik1_u/PS_u/ReadR_Ila[10]} {Brik1_u/PS_u/ReadR_Ila[11]} {Brik1_u/PS_u/ReadR_Ila[12]} {Brik1_u/PS_u/ReadR_Ila[13]} {Brik1_u/PS_u/ReadR_Ila[14]} {Brik1_u/PS_u/ReadR_Ila[15]} {Brik1_u/PS_u/ReadR_Ila[16]} {Brik1_u/PS_u/ReadR_Ila[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe10]
set_property port_width 14 [get_debug_ports u_ila_0/probe10]
connect_debug_port u_ila_0/probe10 [get_nets [list {Brik1_u/PS_u/SampleCount[0]} {Brik1_u/PS_u/SampleCount[1]} {Brik1_u/PS_u/SampleCount[2]} {Brik1_u/PS_u/SampleCount[3]} {Brik1_u/PS_u/SampleCount[4]} {Brik1_u/PS_u/SampleCount[5]} {Brik1_u/PS_u/SampleCount[6]} {Brik1_u/PS_u/SampleCount[7]} {Brik1_u/PS_u/SampleCount[8]} {Brik1_u/PS_u/SampleCount[9]} {Brik1_u/PS_u/SampleCount[10]} {Brik1_u/PS_u/SampleCount[11]} {Brik1_u/PS_u/SampleCount[12]} {Brik1_u/PS_u/SampleCount[13]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe11]
set_property port_width 19 [get_debug_ports u_ila_0/probe11]
connect_debug_port u_ila_0/probe11 [get_nets [list {Brik1_u/PS_u/SyncErrorIla[0]} {Brik1_u/PS_u/SyncErrorIla[1]} {Brik1_u/PS_u/SyncErrorIla[2]} {Brik1_u/PS_u/SyncErrorIla[3]} {Brik1_u/PS_u/SyncErrorIla[4]} {Brik1_u/PS_u/SyncErrorIla[5]} {Brik1_u/PS_u/SyncErrorIla[6]} {Brik1_u/PS_u/SyncErrorIla[7]} {Brik1_u/PS_u/SyncErrorIla[8]} {Brik1_u/PS_u/SyncErrorIla[9]} {Brik1_u/PS_u/SyncErrorIla[10]} {Brik1_u/PS_u/SyncErrorIla[11]} {Brik1_u/PS_u/SyncErrorIla[12]} {Brik1_u/PS_u/SyncErrorIla[13]} {Brik1_u/PS_u/SyncErrorIla[14]} {Brik1_u/PS_u/SyncErrorIla[15]} {Brik1_u/PS_u/SyncErrorIla[16]} {Brik1_u/PS_u/SyncErrorIla[17]} {Brik1_u/PS_u/SyncErrorIla[18]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe12]
set_property port_width 25 [get_debug_ports u_ila_0/probe12]
connect_debug_port u_ila_0/probe12 [get_nets [list {Brik1_u/PS_u/SyncSumIla[0]} {Brik1_u/PS_u/SyncSumIla[1]} {Brik1_u/PS_u/SyncSumIla[2]} {Brik1_u/PS_u/SyncSumIla[3]} {Brik1_u/PS_u/SyncSumIla[4]} {Brik1_u/PS_u/SyncSumIla[5]} {Brik1_u/PS_u/SyncSumIla[6]} {Brik1_u/PS_u/SyncSumIla[7]} {Brik1_u/PS_u/SyncSumIla[8]} {Brik1_u/PS_u/SyncSumIla[9]} {Brik1_u/PS_u/SyncSumIla[10]} {Brik1_u/PS_u/SyncSumIla[11]} {Brik1_u/PS_u/SyncSumIla[12]} {Brik1_u/PS_u/SyncSumIla[13]} {Brik1_u/PS_u/SyncSumIla[14]} {Brik1_u/PS_u/SyncSumIla[15]} {Brik1_u/PS_u/SyncSumIla[16]} {Brik1_u/PS_u/SyncSumIla[17]} {Brik1_u/PS_u/SyncSumIla[18]} {Brik1_u/PS_u/SyncSumIla[19]} {Brik1_u/PS_u/SyncSumIla[20]} {Brik1_u/PS_u/SyncSumIla[21]} {Brik1_u/PS_u/SyncSumIla[22]} {Brik1_u/PS_u/SyncSumIla[23]} {Brik1_u/PS_u/SyncSumIla[24]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe13]
set_property port_width 18 [get_debug_ports u_ila_0/probe13]
connect_debug_port u_ila_0/probe13 [get_nets [list {Brik2_u/FreqDFT_u/FreqCoarse_Ila[0]} {Brik2_u/FreqDFT_u/FreqCoarse_Ila[1]} {Brik2_u/FreqDFT_u/FreqCoarse_Ila[2]} {Brik2_u/FreqDFT_u/FreqCoarse_Ila[3]} {Brik2_u/FreqDFT_u/FreqCoarse_Ila[4]} {Brik2_u/FreqDFT_u/FreqCoarse_Ila[5]} {Brik2_u/FreqDFT_u/FreqCoarse_Ila[6]} {Brik2_u/FreqDFT_u/FreqCoarse_Ila[7]} {Brik2_u/FreqDFT_u/FreqCoarse_Ila[8]} {Brik2_u/FreqDFT_u/FreqCoarse_Ila[9]} {Brik2_u/FreqDFT_u/FreqCoarse_Ila[10]} {Brik2_u/FreqDFT_u/FreqCoarse_Ila[11]} {Brik2_u/FreqDFT_u/FreqCoarse_Ila[12]} {Brik2_u/FreqDFT_u/FreqCoarse_Ila[13]} {Brik2_u/FreqDFT_u/FreqCoarse_Ila[14]} {Brik2_u/FreqDFT_u/FreqCoarse_Ila[15]} {Brik2_u/FreqDFT_u/FreqCoarse_Ila[16]} {Brik2_u/FreqDFT_u/FreqCoarse_Ila[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe14]
set_property port_width 18 [get_debug_ports u_ila_0/probe14]
connect_debug_port u_ila_0/probe14 [get_nets [list {Brik2_u/FreqDFT_u/FreqLpf_Ila[0]} {Brik2_u/FreqDFT_u/FreqLpf_Ila[1]} {Brik2_u/FreqDFT_u/FreqLpf_Ila[2]} {Brik2_u/FreqDFT_u/FreqLpf_Ila[3]} {Brik2_u/FreqDFT_u/FreqLpf_Ila[4]} {Brik2_u/FreqDFT_u/FreqLpf_Ila[5]} {Brik2_u/FreqDFT_u/FreqLpf_Ila[6]} {Brik2_u/FreqDFT_u/FreqLpf_Ila[7]} {Brik2_u/FreqDFT_u/FreqLpf_Ila[8]} {Brik2_u/FreqDFT_u/FreqLpf_Ila[9]} {Brik2_u/FreqDFT_u/FreqLpf_Ila[10]} {Brik2_u/FreqDFT_u/FreqLpf_Ila[11]} {Brik2_u/FreqDFT_u/FreqLpf_Ila[12]} {Brik2_u/FreqDFT_u/FreqLpf_Ila[13]} {Brik2_u/FreqDFT_u/FreqLpf_Ila[14]} {Brik2_u/FreqDFT_u/FreqLpf_Ila[15]} {Brik2_u/FreqDFT_u/FreqLpf_Ila[16]} {Brik2_u/FreqDFT_u/FreqLpf_Ila[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe15]
set_property port_width 13 [get_debug_ports u_ila_0/probe15]
connect_debug_port u_ila_0/probe15 [get_nets [list {Brik2_u/FreqDFT_u/MaxIndex_Ila[0]} {Brik2_u/FreqDFT_u/MaxIndex_Ila[1]} {Brik2_u/FreqDFT_u/MaxIndex_Ila[2]} {Brik2_u/FreqDFT_u/MaxIndex_Ila[3]} {Brik2_u/FreqDFT_u/MaxIndex_Ila[4]} {Brik2_u/FreqDFT_u/MaxIndex_Ila[5]} {Brik2_u/FreqDFT_u/MaxIndex_Ila[6]} {Brik2_u/FreqDFT_u/MaxIndex_Ila[7]} {Brik2_u/FreqDFT_u/MaxIndex_Ila[8]} {Brik2_u/FreqDFT_u/MaxIndex_Ila[9]} {Brik2_u/FreqDFT_u/MaxIndex_Ila[10]} {Brik2_u/FreqDFT_u/MaxIndex_Ila[11]} {Brik2_u/FreqDFT_u/MaxIndex_Ila[12]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe16]
set_property port_width 11 [get_debug_ports u_ila_0/probe16]
connect_debug_port u_ila_0/probe16 [get_nets [list {Brik2_u/FreqDFT_u/MaxValue_Ila[0]} {Brik2_u/FreqDFT_u/MaxValue_Ila[1]} {Brik2_u/FreqDFT_u/MaxValue_Ila[2]} {Brik2_u/FreqDFT_u/MaxValue_Ila[3]} {Brik2_u/FreqDFT_u/MaxValue_Ila[4]} {Brik2_u/FreqDFT_u/MaxValue_Ila[5]} {Brik2_u/FreqDFT_u/MaxValue_Ila[6]} {Brik2_u/FreqDFT_u/MaxValue_Ila[7]} {Brik2_u/FreqDFT_u/MaxValue_Ila[8]} {Brik2_u/FreqDFT_u/MaxValue_Ila[9]} {Brik2_u/FreqDFT_u/MaxValue_Ila[10]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe17]
set_property port_width 11 [get_debug_ports u_ila_0/probe17]
connect_debug_port u_ila_0/probe17 [get_nets [list {Brik2_u/FreqDFT_u/Scan_Ila[0]} {Brik2_u/FreqDFT_u/Scan_Ila[1]} {Brik2_u/FreqDFT_u/Scan_Ila[2]} {Brik2_u/FreqDFT_u/Scan_Ila[3]} {Brik2_u/FreqDFT_u/Scan_Ila[4]} {Brik2_u/FreqDFT_u/Scan_Ila[5]} {Brik2_u/FreqDFT_u/Scan_Ila[6]} {Brik2_u/FreqDFT_u/Scan_Ila[7]} {Brik2_u/FreqDFT_u/Scan_Ila[8]} {Brik2_u/FreqDFT_u/Scan_Ila[9]} {Brik2_u/FreqDFT_u/Scan_Ila[10]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe18]
set_property port_width 18 [get_debug_ports u_ila_0/probe18]
connect_debug_port u_ila_0/probe18 [get_nets [list {Brik2_u/DF_I_Ila[0]} {Brik2_u/DF_I_Ila[1]} {Brik2_u/DF_I_Ila[2]} {Brik2_u/DF_I_Ila[3]} {Brik2_u/DF_I_Ila[4]} {Brik2_u/DF_I_Ila[5]} {Brik2_u/DF_I_Ila[6]} {Brik2_u/DF_I_Ila[7]} {Brik2_u/DF_I_Ila[8]} {Brik2_u/DF_I_Ila[9]} {Brik2_u/DF_I_Ila[10]} {Brik2_u/DF_I_Ila[11]} {Brik2_u/DF_I_Ila[12]} {Brik2_u/DF_I_Ila[13]} {Brik2_u/DF_I_Ila[14]} {Brik2_u/DF_I_Ila[15]} {Brik2_u/DF_I_Ila[16]} {Brik2_u/DF_I_Ila[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe19]
set_property port_width 18 [get_debug_ports u_ila_0/probe19]
connect_debug_port u_ila_0/probe19 [get_nets [list {Brik2_u/DF_R_Ila[0]} {Brik2_u/DF_R_Ila[1]} {Brik2_u/DF_R_Ila[2]} {Brik2_u/DF_R_Ila[3]} {Brik2_u/DF_R_Ila[4]} {Brik2_u/DF_R_Ila[5]} {Brik2_u/DF_R_Ila[6]} {Brik2_u/DF_R_Ila[7]} {Brik2_u/DF_R_Ila[8]} {Brik2_u/DF_R_Ila[9]} {Brik2_u/DF_R_Ila[10]} {Brik2_u/DF_R_Ila[11]} {Brik2_u/DF_R_Ila[12]} {Brik2_u/DF_R_Ila[13]} {Brik2_u/DF_R_Ila[14]} {Brik2_u/DF_R_Ila[15]} {Brik2_u/DF_R_Ila[16]} {Brik2_u/DF_R_Ila[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe20]
set_property port_width 25 [get_debug_ports u_ila_0/probe20]
connect_debug_port u_ila_0/probe20 [get_nets [list {Brik2_u/Freq_Ila[0]} {Brik2_u/Freq_Ila[1]} {Brik2_u/Freq_Ila[2]} {Brik2_u/Freq_Ila[3]} {Brik2_u/Freq_Ila[4]} {Brik2_u/Freq_Ila[5]} {Brik2_u/Freq_Ila[6]} {Brik2_u/Freq_Ila[7]} {Brik2_u/Freq_Ila[8]} {Brik2_u/Freq_Ila[9]} {Brik2_u/Freq_Ila[10]} {Brik2_u/Freq_Ila[11]} {Brik2_u/Freq_Ila[12]} {Brik2_u/Freq_Ila[13]} {Brik2_u/Freq_Ila[14]} {Brik2_u/Freq_Ila[15]} {Brik2_u/Freq_Ila[16]} {Brik2_u/Freq_Ila[17]} {Brik2_u/Freq_Ila[18]} {Brik2_u/Freq_Ila[19]} {Brik2_u/Freq_Ila[20]} {Brik2_u/Freq_Ila[21]} {Brik2_u/Freq_Ila[22]} {Brik2_u/Freq_Ila[23]} {Brik2_u/Freq_Ila[24]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe21]
set_property port_width 18 [get_debug_ports u_ila_0/probe21]
connect_debug_port u_ila_0/probe21 [get_nets [list {Brik2_u/H0EstI_Ila[0]} {Brik2_u/H0EstI_Ila[1]} {Brik2_u/H0EstI_Ila[2]} {Brik2_u/H0EstI_Ila[3]} {Brik2_u/H0EstI_Ila[4]} {Brik2_u/H0EstI_Ila[5]} {Brik2_u/H0EstI_Ila[6]} {Brik2_u/H0EstI_Ila[7]} {Brik2_u/H0EstI_Ila[8]} {Brik2_u/H0EstI_Ila[9]} {Brik2_u/H0EstI_Ila[10]} {Brik2_u/H0EstI_Ila[11]} {Brik2_u/H0EstI_Ila[12]} {Brik2_u/H0EstI_Ila[13]} {Brik2_u/H0EstI_Ila[14]} {Brik2_u/H0EstI_Ila[15]} {Brik2_u/H0EstI_Ila[16]} {Brik2_u/H0EstI_Ila[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe22]
set_property port_width 18 [get_debug_ports u_ila_0/probe22]
connect_debug_port u_ila_0/probe22 [get_nets [list {Brik2_u/H0EstR_Ila[0]} {Brik2_u/H0EstR_Ila[1]} {Brik2_u/H0EstR_Ila[2]} {Brik2_u/H0EstR_Ila[3]} {Brik2_u/H0EstR_Ila[4]} {Brik2_u/H0EstR_Ila[5]} {Brik2_u/H0EstR_Ila[6]} {Brik2_u/H0EstR_Ila[7]} {Brik2_u/H0EstR_Ila[8]} {Brik2_u/H0EstR_Ila[9]} {Brik2_u/H0EstR_Ila[10]} {Brik2_u/H0EstR_Ila[11]} {Brik2_u/H0EstR_Ila[12]} {Brik2_u/H0EstR_Ila[13]} {Brik2_u/H0EstR_Ila[14]} {Brik2_u/H0EstR_Ila[15]} {Brik2_u/H0EstR_Ila[16]} {Brik2_u/H0EstR_Ila[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe23]
set_property port_width 18 [get_debug_ports u_ila_0/probe23]
connect_debug_port u_ila_0/probe23 [get_nets [list {Brik2_u/H0Mag_Ila[0]} {Brik2_u/H0Mag_Ila[1]} {Brik2_u/H0Mag_Ila[2]} {Brik2_u/H0Mag_Ila[3]} {Brik2_u/H0Mag_Ila[4]} {Brik2_u/H0Mag_Ila[5]} {Brik2_u/H0Mag_Ila[6]} {Brik2_u/H0Mag_Ila[7]} {Brik2_u/H0Mag_Ila[8]} {Brik2_u/H0Mag_Ila[9]} {Brik2_u/H0Mag_Ila[10]} {Brik2_u/H0Mag_Ila[11]} {Brik2_u/H0Mag_Ila[12]} {Brik2_u/H0Mag_Ila[13]} {Brik2_u/H0Mag_Ila[14]} {Brik2_u/H0Mag_Ila[15]} {Brik2_u/H0Mag_Ila[16]} {Brik2_u/H0Mag_Ila[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe24]
set_property port_width 18 [get_debug_ports u_ila_0/probe24]
connect_debug_port u_ila_0/probe24 [get_nets [list {Brik2_u/H1EstI_Ila[0]} {Brik2_u/H1EstI_Ila[1]} {Brik2_u/H1EstI_Ila[2]} {Brik2_u/H1EstI_Ila[3]} {Brik2_u/H1EstI_Ila[4]} {Brik2_u/H1EstI_Ila[5]} {Brik2_u/H1EstI_Ila[6]} {Brik2_u/H1EstI_Ila[7]} {Brik2_u/H1EstI_Ila[8]} {Brik2_u/H1EstI_Ila[9]} {Brik2_u/H1EstI_Ila[10]} {Brik2_u/H1EstI_Ila[11]} {Brik2_u/H1EstI_Ila[12]} {Brik2_u/H1EstI_Ila[13]} {Brik2_u/H1EstI_Ila[14]} {Brik2_u/H1EstI_Ila[15]} {Brik2_u/H1EstI_Ila[16]} {Brik2_u/H1EstI_Ila[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe25]
set_property port_width 18 [get_debug_ports u_ila_0/probe25]
connect_debug_port u_ila_0/probe25 [get_nets [list {Brik2_u/H1EstR_Ila[0]} {Brik2_u/H1EstR_Ila[1]} {Brik2_u/H1EstR_Ila[2]} {Brik2_u/H1EstR_Ila[3]} {Brik2_u/H1EstR_Ila[4]} {Brik2_u/H1EstR_Ila[5]} {Brik2_u/H1EstR_Ila[6]} {Brik2_u/H1EstR_Ila[7]} {Brik2_u/H1EstR_Ila[8]} {Brik2_u/H1EstR_Ila[9]} {Brik2_u/H1EstR_Ila[10]} {Brik2_u/H1EstR_Ila[11]} {Brik2_u/H1EstR_Ila[12]} {Brik2_u/H1EstR_Ila[13]} {Brik2_u/H1EstR_Ila[14]} {Brik2_u/H1EstR_Ila[15]} {Brik2_u/H1EstR_Ila[16]} {Brik2_u/H1EstR_Ila[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe26]
set_property port_width 18 [get_debug_ports u_ila_0/probe26]
connect_debug_port u_ila_0/probe26 [get_nets [list {Brik2_u/H1Mag_Ila[0]} {Brik2_u/H1Mag_Ila[1]} {Brik2_u/H1Mag_Ila[2]} {Brik2_u/H1Mag_Ila[3]} {Brik2_u/H1Mag_Ila[4]} {Brik2_u/H1Mag_Ila[5]} {Brik2_u/H1Mag_Ila[6]} {Brik2_u/H1Mag_Ila[7]} {Brik2_u/H1Mag_Ila[8]} {Brik2_u/H1Mag_Ila[9]} {Brik2_u/H1Mag_Ila[10]} {Brik2_u/H1Mag_Ila[11]} {Brik2_u/H1Mag_Ila[12]} {Brik2_u/H1Mag_Ila[13]} {Brik2_u/H1Mag_Ila[14]} {Brik2_u/H1Mag_Ila[15]} {Brik2_u/H1Mag_Ila[16]} {Brik2_u/H1Mag_Ila[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe27]
set_property port_width 18 [get_debug_ports u_ila_0/probe27]
connect_debug_port u_ila_0/probe27 [get_nets [list {Brik2_u/Mu0_Ila[0]} {Brik2_u/Mu0_Ila[1]} {Brik2_u/Mu0_Ila[2]} {Brik2_u/Mu0_Ila[3]} {Brik2_u/Mu0_Ila[4]} {Brik2_u/Mu0_Ila[5]} {Brik2_u/Mu0_Ila[6]} {Brik2_u/Mu0_Ila[7]} {Brik2_u/Mu0_Ila[8]} {Brik2_u/Mu0_Ila[9]} {Brik2_u/Mu0_Ila[10]} {Brik2_u/Mu0_Ila[11]} {Brik2_u/Mu0_Ila[12]} {Brik2_u/Mu0_Ila[13]} {Brik2_u/Mu0_Ila[14]} {Brik2_u/Mu0_Ila[15]} {Brik2_u/Mu0_Ila[16]} {Brik2_u/Mu0_Ila[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe28]
set_property port_width 18 [get_debug_ports u_ila_0/probe28]
connect_debug_port u_ila_0/probe28 [get_nets [list {Brik2_u/Mu1_Ila[0]} {Brik2_u/Mu1_Ila[1]} {Brik2_u/Mu1_Ila[2]} {Brik2_u/Mu1_Ila[3]} {Brik2_u/Mu1_Ila[4]} {Brik2_u/Mu1_Ila[5]} {Brik2_u/Mu1_Ila[6]} {Brik2_u/Mu1_Ila[7]} {Brik2_u/Mu1_Ila[8]} {Brik2_u/Mu1_Ila[9]} {Brik2_u/Mu1_Ila[10]} {Brik2_u/Mu1_Ila[11]} {Brik2_u/Mu1_Ila[12]} {Brik2_u/Mu1_Ila[13]} {Brik2_u/Mu1_Ila[14]} {Brik2_u/Mu1_Ila[15]} {Brik2_u/Mu1_Ila[16]} {Brik2_u/Mu1_Ila[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe29]
set_property port_width 18 [get_debug_ports u_ila_0/probe29]
connect_debug_port u_ila_0/probe29 [get_nets [list {Brik2_u/Tau0Est_Ila[0]} {Brik2_u/Tau0Est_Ila[1]} {Brik2_u/Tau0Est_Ila[2]} {Brik2_u/Tau0Est_Ila[3]} {Brik2_u/Tau0Est_Ila[4]} {Brik2_u/Tau0Est_Ila[5]} {Brik2_u/Tau0Est_Ila[6]} {Brik2_u/Tau0Est_Ila[7]} {Brik2_u/Tau0Est_Ila[8]} {Brik2_u/Tau0Est_Ila[9]} {Brik2_u/Tau0Est_Ila[10]} {Brik2_u/Tau0Est_Ila[11]} {Brik2_u/Tau0Est_Ila[12]} {Brik2_u/Tau0Est_Ila[13]} {Brik2_u/Tau0Est_Ila[14]} {Brik2_u/Tau0Est_Ila[15]} {Brik2_u/Tau0Est_Ila[16]} {Brik2_u/Tau0Est_Ila[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe30]
set_property port_width 18 [get_debug_ports u_ila_0/probe30]
connect_debug_port u_ila_0/probe30 [get_nets [list {Brik2_u/Tau1Est_Ila[0]} {Brik2_u/Tau1Est_Ila[1]} {Brik2_u/Tau1Est_Ila[2]} {Brik2_u/Tau1Est_Ila[3]} {Brik2_u/Tau1Est_Ila[4]} {Brik2_u/Tau1Est_Ila[5]} {Brik2_u/Tau1Est_Ila[6]} {Brik2_u/Tau1Est_Ila[7]} {Brik2_u/Tau1Est_Ila[8]} {Brik2_u/Tau1Est_Ila[9]} {Brik2_u/Tau1Est_Ila[10]} {Brik2_u/Tau1Est_Ila[11]} {Brik2_u/Tau1Est_Ila[12]} {Brik2_u/Tau1Est_Ila[13]} {Brik2_u/Tau1Est_Ila[14]} {Brik2_u/Tau1Est_Ila[15]} {Brik2_u/Tau1Est_Ila[16]} {Brik2_u/Tau1Est_Ila[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe31]
set_property port_width 18 [get_debug_ports u_ila_0/probe31]
connect_debug_port u_ila_0/probe31 [get_nets [list {InIBrik2Ila[0]} {InIBrik2Ila[1]} {InIBrik2Ila[2]} {InIBrik2Ila[3]} {InIBrik2Ila[4]} {InIBrik2Ila[5]} {InIBrik2Ila[6]} {InIBrik2Ila[7]} {InIBrik2Ila[8]} {InIBrik2Ila[9]} {InIBrik2Ila[10]} {InIBrik2Ila[11]} {InIBrik2Ila[12]} {InIBrik2Ila[13]} {InIBrik2Ila[14]} {InIBrik2Ila[15]} {InIBrik2Ila[16]} {InIBrik2Ila[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe32]
set_property port_width 18 [get_debug_ports u_ila_0/probe32]
connect_debug_port u_ila_0/probe32 [get_nets [list {InRBrik2Ila[0]} {InRBrik2Ila[1]} {InRBrik2Ila[2]} {InRBrik2Ila[3]} {InRBrik2Ila[4]} {InRBrik2Ila[5]} {InRBrik2Ila[6]} {InRBrik2Ila[7]} {InRBrik2Ila[8]} {InRBrik2Ila[9]} {InRBrik2Ila[10]} {InRBrik2Ila[11]} {InRBrik2Ila[12]} {InRBrik2Ila[13]} {InRBrik2Ila[14]} {InRBrik2Ila[15]} {InRBrik2Ila[16]} {InRBrik2Ila[17]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe33]
set_property port_width 4 [get_debug_ports u_ila_0/probe33]
connect_debug_port u_ila_0/probe33 [get_nets [list {TrellisBits[0]} {TrellisBits[1]} {TrellisBits[2]} {TrellisBits[3]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe34]
set_property port_width 12 [get_debug_ports u_ila_0/probe34]
connect_debug_port u_ila_0/probe34 [get_nets [list {TrellisCount[0]} {TrellisCount[1]} {TrellisCount[2]} {TrellisCount[3]} {TrellisCount[4]} {TrellisCount[5]} {TrellisCount[6]} {TrellisCount[7]} {TrellisCount[8]} {TrellisCount[9]} {TrellisCount[10]} {TrellisCount[11]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe35]
set_property port_width 1 [get_debug_ports u_ila_0/probe35]
connect_debug_port u_ila_0/probe35 [get_nets [list Brik2_u/FreqDFT_u/AcqTrack]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe36]
set_property port_width 1 [get_debug_ports u_ila_0/probe36]
connect_debug_port u_ila_0/probe36 [get_nets [list Brik2_u/ChanEstDone]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe37]
set_property port_width 1 [get_debug_ports u_ila_0/probe37]
connect_debug_port u_ila_0/probe37 [get_nets [list ClkOut_OBUF]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe38]
set_property port_width 1 [get_debug_ports u_ila_0/probe38]
connect_debug_port u_ila_0/probe38 [get_nets [list DataOut_OBUF]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe39]
set_property port_width 1 [get_debug_ports u_ila_0/probe39]
connect_debug_port u_ila_0/probe39 [get_nets [list Brik2_u/FreqEstDone]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe40]
set_property port_width 1 [get_debug_ports u_ila_0/probe40]
connect_debug_port u_ila_0/probe40 [get_nets [list Brik2_u/Interpolate]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe41]
set_property port_width 1 [get_debug_ports u_ila_0/probe41]
connect_debug_port u_ila_0/probe41 [get_nets [list Brik1_u/PD_u/PilotFound_Ila]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe42]
set_property port_width 1 [get_debug_ports u_ila_0/probe42]
connect_debug_port u_ila_0/probe42 [get_nets [list PilotFound_OBUF]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe43]
set_property port_width 1 [get_debug_ports u_ila_0/probe43]
connect_debug_port u_ila_0/probe43 [get_nets [list Brik1_u/ResampleI_Valid]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe44]
set_property port_width 1 [get_debug_ports u_ila_0/probe44]
connect_debug_port u_ila_0/probe44 [get_nets [list Brik1_u/ResampleR_Valid]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe45]
set_property port_width 1 [get_debug_ports u_ila_0/probe45]
connect_debug_port u_ila_0/probe45 [get_nets [list StartIla]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe46]
set_property port_width 1 [get_debug_ports u_ila_0/probe46]
connect_debug_port u_ila_0/probe46 [get_nets [list Brik1_u/PS_u/StartOut]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe47]
set_property port_width 1 [get_debug_ports u_ila_0/probe47]
connect_debug_port u_ila_0/probe47 [get_nets [list Brik2_u/StartTime]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe48]
set_property port_width 1 [get_debug_ports u_ila_0/probe48]
connect_debug_port u_ila_0/probe48 [get_nets [list Brik2_u/TimeEstDone]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe49]
set_property port_width 1 [get_debug_ports u_ila_0/probe49]
connect_debug_port u_ila_0/probe49 [get_nets [list TrellisOutEn]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe50]
set_property port_width 1 [get_debug_ports u_ila_0/probe50]
connect_debug_port u_ila_0/probe50 [get_nets [list TrellisSkip]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe51]
set_property port_width 1 [get_debug_ports u_ila_0/probe51]
connect_debug_port u_ila_0/probe51 [get_nets [list TrellisStart]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe52]
set_property port_width 1 [get_debug_ports u_ila_0/probe52]
connect_debug_port u_ila_0/probe52 [get_nets [list Brik2_u/ValidDF_ILA]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe53]
set_property port_width 1 [get_debug_ports u_ila_0/probe53]
connect_debug_port u_ila_0/probe53 [get_nets [list ValidIla]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe54]
set_property port_width 1 [get_debug_ports u_ila_0/probe54]
connect_debug_port u_ila_0/probe54 [get_nets [list Brik1_u/ValidIn]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe1]
set_property port_width 5 [get_debug_ports u_ila_1/probe1]
connect_debug_port u_ila_1/probe1 [get_nets [list {Brik1_u/PD_u/iFftOnesLo[0]} {Brik1_u/PD_u/iFftOnesLo[1]} {Brik1_u/PD_u/iFftOnesLo[2]} {Brik1_u/PD_u/iFftOnesLo[3]} {Brik1_u/PD_u/iFftOnesLo[4]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe2]
set_property port_width 5 [get_debug_ports u_ila_1/probe2]
connect_debug_port u_ila_1/probe2 [get_nets [list {Brik1_u/PD_u/iFftZerosHi[0]} {Brik1_u/PD_u/iFftZerosHi[1]} {Brik1_u/PD_u/iFftZerosHi[2]} {Brik1_u/PD_u/iFftZerosHi[3]} {Brik1_u/PD_u/iFftZerosHi[4]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe3]
set_property port_width 5 [get_debug_ports u_ila_1/probe3]
connect_debug_port u_ila_1/probe3 [get_nets [list {Brik1_u/PD_u/iFftZerosLo[0]} {Brik1_u/PD_u/iFftZerosLo[1]} {Brik1_u/PD_u/iFftZerosLo[2]} {Brik1_u/PD_u/iFftZerosLo[3]} {Brik1_u/PD_u/iFftZerosLo[4]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe4]
set_property port_width 1 [get_debug_ports u_ila_1/probe4]
connect_debug_port u_ila_1/probe4 [get_nets [list Brik1_u/PD_u/H0Pos_x_Fft/OverFlow]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe5]
set_property port_width 1 [get_debug_ports u_ila_1/probe5]
connect_debug_port u_ila_1/probe5 [get_nets [list Brik1_u/PD_u/H1Cntr_x_Fft/OverFlow]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe6]
set_property port_width 1 [get_debug_ports u_ila_1/probe6]
connect_debug_port u_ila_1/probe6 [get_nets [list Brik1_u/PD_u/Cntr0Abs/OverFlow]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe7]
set_property port_width 1 [get_debug_ports u_ila_1/probe7]
connect_debug_port u_ila_1/probe7 [get_nets [list Brik1_u/PD_u/Pos0Abs/OverFlow]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe8]
set_property port_width 1 [get_debug_ports u_ila_1/probe8]
connect_debug_port u_ila_1/probe8 [get_nets [list Brik1_u/PD_u/H0Cntr_x_Fft/OverFlow]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe9]
set_property port_width 1 [get_debug_ports u_ila_1/probe9]
connect_debug_port u_ila_1/probe9 [get_nets [list Brik1_u/PD_u/Cntr1Abs/OverFlow]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe10]
set_property port_width 1 [get_debug_ports u_ila_1/probe10]
connect_debug_port u_ila_1/probe10 [get_nets [list Brik1_u/PD_u/H0Neg_x_Fft/OverFlow]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe11]
set_property port_width 1 [get_debug_ports u_ila_1/probe11]
connect_debug_port u_ila_1/probe11 [get_nets [list Brik1_u/PD_u/H1Neg_x_Fft/OverFlow]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe12]
set_property port_width 1 [get_debug_ports u_ila_1/probe12]
connect_debug_port u_ila_1/probe12 [get_nets [list Brik1_u/PD_u/H1Pos_x_Fft/OverFlow]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe13]
set_property port_width 1 [get_debug_ports u_ila_1/probe13]
connect_debug_port u_ila_1/probe13 [get_nets [list Brik1_u/PD_u/Neg0Abs/OverFlow]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe14]
set_property port_width 1 [get_debug_ports u_ila_1/probe14]
connect_debug_port u_ila_1/probe14 [get_nets [list Brik1_u/PD_u/Neg1Abs/OverFlow]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe15]
set_property port_width 1 [get_debug_ports u_ila_1/probe15]
connect_debug_port u_ila_1/probe15 [get_nets [list Brik1_u/PD_u/Pos1Abs/OverFlow]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe16]
set_property port_width 1 [get_debug_ports u_ila_1/probe16]
connect_debug_port u_ila_1/probe16 [get_nets [list Brik1_u/PD_u/OverflowFft]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe17]
set_property port_width 1 [get_debug_ports u_ila_1/probe17]
connect_debug_port u_ila_1/probe17 [get_nets [list Brik1_u/PD_u/OverflowIFft]]
set_property C_CLK_INPUT_FREQ_HZ 186000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets Clk]
