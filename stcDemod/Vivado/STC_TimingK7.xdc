create_clock -period 5.350 -name Clk186 -waveform {0.000 2.675} -add [get_nets Clk186]
create_clock -period 2.675 -name Clk373 -waveform {0.000 1.338} -add [get_nets Clk373]

set_output_delay -clock [get_clocks Clk186] -min -add_delay -0.100 [get_ports {Blink ClkOut DataOut PilotFound}]
set_output_delay -clock [get_clocks Clk186] -max -add_delay 1.000 [get_ports {Blink ClkOut DataOut PilotFound}]


set_input_delay -clock [get_clocks Clk186] -min -add_delay 0.100 [get_ports {ClocksPerBit[*]}]
set_input_delay -clock [get_clocks Clk186] -max -add_delay 10.000 [get_ports {ClocksPerBit[*]}]
set_input_delay -clock [get_clocks Clk186] -min -add_delay 0.100 [get_ports {ResampleI[*]}]
set_input_delay -clock [get_clocks Clk186] -max -add_delay 3.000 [get_ports {ResampleI[*]}]
set_input_delay -clock [get_clocks Clk186] -min -add_delay 0.100 [get_ports {ResampleR[*]}]
set_input_delay -clock [get_clocks Clk186] -max -add_delay 3.000 [get_ports {ResampleR[*]}]
set_input_delay -clock [get_clocks Clk186] -min -add_delay 0.100 [get_ports ValidIn]
set_input_delay -clock [get_clocks Clk186] -max -add_delay 3.000 [get_ports ValidIn]
set_output_delay -clock [get_clocks Clk186] -min -add_delay -0.100 [get_ports Blink]
set_output_delay -clock [get_clocks Clk186] -max -add_delay 1.000 [get_ports Blink]
set_output_delay -clock [get_clocks Clk186] -min -add_delay -0.100 [get_ports ClkOut]
set_output_delay -clock [get_clocks Clk186] -max -add_delay 1.000 [get_ports ClkOut]
set_output_delay -clock [get_clocks Clk186] -min -add_delay -0.100 [get_ports DataOut]
set_output_delay -clock [get_clocks Clk186] -max -add_delay 1.000 [get_ports DataOut]
set_output_delay -clock [get_clocks Clk186] -min -add_delay -0.100 [get_ports PilotFound]
set_output_delay -clock [get_clocks Clk186] -max -add_delay 1.000 [get_ports PilotFound]
set_output_delay -clock [get_clocks Clk186] -min -add_delay -0.100 [get_ports PilotLocked]
set_output_delay -clock [get_clocks Clk186] -max -add_delay 1.000 [get_ports PilotLocked]


set_false_path -from [get_ports {ClocksPerBit[*]}] -to [get_pins {{FD/clkCounter_reg[*]/D} FD/ClkOut_reg/D}]
set_false_path -from [get_pins {Variables_reg[*][*]}] -to [get_pins */D]

create_pblock STC_PBlock
add_cells_to_pblock [get_pblocks STC_PBlock] -top
resize_pblock [get_pblocks STC_PBlock] -add {SLICE_X0Y349:SLICE_X153Y25}
resize_pblock [get_pblocks STC_PBlock] -add {DSP48_X0Y10:DSP48_X5Y139}
resize_pblock [get_pblocks STC_PBlock] -add {RAMB18_X0Y139:RAMB18_X6Y10}
resize_pblock [get_pblocks STC_PBlock] -add {RAMB36_X0Y69:RAMB36_X6Y5}
