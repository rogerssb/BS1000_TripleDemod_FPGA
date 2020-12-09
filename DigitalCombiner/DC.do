onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /digitalcombiner_tb/CmbDataIn1_p
add wave -noupdate /digitalcombiner_tb/CmbClkIn1_p
add wave -noupdate /digitalcombiner_tb/CmbDataIn2_p
add wave -noupdate /digitalcombiner_tb/CmbClkIn2_p
add wave -noupdate /digitalcombiner_tb/Ch1K7/SysRst
add wave -noupdate -divider Ch1
add wave -noupdate -divider {Combiner Channel 1}
add wave -noupdate /digitalcombiner_tb/CmbK7/SerDes_u/SerDesIn1/clk_div_in
add wave -noupdate /digitalcombiner_tb/CmbK7/SerDes_u/SerDesIn1/clk_in
add wave -noupdate /digitalcombiner_tb/CmbK7/SerDes_u/SerDesIn1/data_in_from_pins
add wave -noupdate /digitalcombiner_tb/CmbK7/SerDes_u/SerDesIn1/data_in_to_device
add wave -noupdate /digitalcombiner_tb/CmbK7/SerDes_u/SerDesIn1/delay_locked
add wave -noupdate /digitalcombiner_tb/CmbK7/SerDes_u/SerDesIn1/io_reset
add wave -noupdate /digitalcombiner_tb/CmbK7/SerDes_u/SerDesIn1/ref_clock
add wave -noupdate -expand /digitalcombiner_tb/CmbK7/SerDes_u/SerDesIn1/bitslip
add wave -noupdate -expand -subitemconfig {/digitalcombiner_tb/CmbK7/SerDes_u/Demux1(5) {-height 15} /digitalcombiner_tb/CmbK7/SerDes_u/Demux1(4) {-height 15 -max 126.99999999999997 -min -128.0} /digitalcombiner_tb/CmbK7/SerDes_u/Demux1(3) {-height 15 -max 126.99999999999997 -min -128.0} /digitalcombiner_tb/CmbK7/SerDes_u/Demux1(2) {-height 15 -max 126.99999999999997 -min -128.0} /digitalcombiner_tb/CmbK7/SerDes_u/Demux1(1) {-height 15 -max 126.99999999999997 -min -128.0} /digitalcombiner_tb/CmbK7/SerDes_u/Demux1(0) {-height 15 -max 126.99999999999997 -min -128.0}} /digitalcombiner_tb/CmbK7/SerDes_u/Demux1
add wave -noupdate /digitalcombiner_tb/XX
add wave -noupdate -divider {Combiner Channel 2}
add wave -noupdate -divider {New Divider}
add wave -noupdate /digitalcombiner_tb/Ch2K7/Diff
add wave -noupdate /digitalcombiner_tb/CmbK7/SerDes_u/SerDesIn2/bitslip
add wave -noupdate /digitalcombiner_tb/CmbK7/SerDes_u/SerDesIn2/clk_div_in
add wave -noupdate /digitalcombiner_tb/CmbK7/SerDes_u/SerDesIn2/clk_in
add wave -noupdate /digitalcombiner_tb/CmbK7/SerDes_u/SerDesIn2/data_in_from_pins
add wave -noupdate /digitalcombiner_tb/CmbK7/SerDes_u/SerDesIn2/data_in_to_device
add wave -noupdate /digitalcombiner_tb/CmbK7/SerDes_u/SerDesIn2/delay_locked
add wave -noupdate /digitalcombiner_tb/CmbK7/SerDes_u/SerDesIn2/io_reset
add wave -noupdate /digitalcombiner_tb/CmbK7/SerDes_u/SerDesIn2/ref_clock
add wave -noupdate -expand -subitemconfig {/digitalcombiner_tb/CmbK7/SerDes_u/Demux2(4) {-format Analog-Step -height 74 -max 126.99999999999997 -min -128.0} /digitalcombiner_tb/CmbK7/SerDes_u/Demux2(3) {-format Analog-Step -height 74 -max 126.99999999999997 -min -128.0} /digitalcombiner_tb/CmbK7/SerDes_u/Demux2(2) {-format Analog-Step -height 74 -max 127.0 -min -125.0} /digitalcombiner_tb/CmbK7/SerDes_u/Demux2(1) {-format Analog-Step -height 74 -max 127.0 -min -126.0} /digitalcombiner_tb/CmbK7/SerDes_u/Demux2(0) {-format Analog-Step -height 74 -max 127.0 -min -126.0}} /digitalcombiner_tb/CmbK7/SerDes_u/Demux2
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {2674037 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 412
configure wave -valuecolwidth 153
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {2542787 ps} {2805287 ps}
bookmark add wave bookmark0 {{2508730 ps} {2540670 ps}} 0
bookmark add wave bookmark1 {{3023030 ps} {3054970 ps}} 0
bookmark add wave bookmark2 {{2187685 ps} {2199857 ps}} 33
bookmark add wave bookmark3 {{3212803 ps} {3228773 ps}} 48
