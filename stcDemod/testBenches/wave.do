onerror {resume}
radix define FLoat16 -fixed -fraction 27 -signed -base signed -precision 6
radix define s17 -fixed -fraction 17 -signed -base signed -precision 6
radix define s24 -fixed -fraction 24 -signed -base signed -precision 6
quietly WaveActivateNextPane {} 0
add wave -noupdate -format Analog-Step -height 74 -max 16777100.000000002 -min -16777200.0 -radix sfixed /brik2_tb/RealRead
add wave -noupdate -format Analog-Step -height 74 -max 16777100.000000002 -min -16777200.0 -radix sfixed /brik2_tb/ImagRead
add wave -noupdate /brik2_tb/StartIn
add wave -noupdate /brik2_tb/ValidRead(0)(0)
add wave -noupdate /brik2_tb/fe_mode
add wave -noupdate -radix sfixed /brik2_tb/Brik2_u/InI
add wave -noupdate -radix sfixed /brik2_tb/Brik2_u/InR
add wave -noupdate -radix sfixed /brik2_tb/Brik2_u/OutI
add wave -noupdate -radix sfixed /brik2_tb/Brik2_u/OutR
add wave -noupdate /brik2_tb/Brik2_u/StartFE
add wave -noupdate /brik2_tb/Brik2_u/StartIn
add wave -noupdate /brik2_tb/Brik2_u/StartOut
add wave -noupdate /brik2_tb/Brik2_u/ValidFifoIn
add wave -noupdate /brik2_tb/Brik2_u/ValidIn
add wave -noupdate /brik2_tb/Brik2_u/ValidOut
add wave -noupdate -radix sfixed /brik2_tb/Brik2_u/h0EstI
add wave -noupdate -radix sfixed /brik2_tb/Brik2_u/h0EstR
add wave -noupdate -radix sfixed /brik2_tb/Brik2_u/h1EstI
add wave -noupdate -radix sfixed /brik2_tb/Brik2_u/h1EstR
add wave -noupdate -radix sfixed /brik2_tb/Brik2_u/tau0Est
add wave -noupdate -radix sfixed /brik2_tb/Brik2_u/tau1Est
add wave -noupdate -radix sfixed /brik2_tb/Brik2_u/FreqInI
add wave -noupdate -radix sfixed /brik2_tb/Brik2_u/FreqInR
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {242109 ps} 0} {{Cursor 2} {63580735 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 269
configure wave -valuecolwidth 100
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
WaveRestoreZoom {920423 ps} {4037873 ps}
bookmark add wave bookmark0 {{3023030 ps} {3054970 ps}} 0
bookmark add wave bookmark1 {{2508730 ps} {2540670 ps}} 0
