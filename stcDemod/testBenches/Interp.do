onerror {resume}
radix define FLoat16 -fixed -fraction 27 -signed -base signed -precision 6
radix define s17 -fixed -fraction 17 -signed -base signed -precision 6
radix define s24 -fixed -fraction 24 -signed -base signed -precision 6
radix define u6 -fixed -fraction 6 -base signed -precision 6
radix define u7 -fixed -fraction 7 -base signed -precision 6
radix define u8 -fixed -fraction 8 -base signed -precision 6
radix define u9 -fixed -fraction 9 -base signed -precision 6
radix define u10 -fixed -fraction 10 -base signed -precision 6
radix define u11 -fixed -fraction 11 -base signed -precision 6
radix define u12 -fixed -fraction 12 -base signed -precision 6
radix define u13 -fixed -fraction 13 -base signed -precision 6
radix define u14 -fixed -fraction 14 -base signed -precision 6
radix define u15 -fixed -fraction 15 -base signed -precision 6
radix define u16 -fixed -fraction 16 -base signed -precision 6
radix define s6 -fixed -fraction 6 -signed -base signed -precision 6
radix define s7 -fixed -fraction 7 -signed -base signed -precision 6
radix define s8 -fixed -fraction 8 -signed -base signed -precision 6
radix define s9 -fixed -fraction 9 -signed -base signed -precision 6
radix define s10 -fixed -fraction 10 -signed -base signed -precision 6
radix define s11 -fixed -fraction 11 -signed -base signed -precision 6
radix define s12 -fixed -fraction 12 -signed -base signed -precision 6
radix define s13 -fixed -fraction 13 -signed -base signed -precision 6
radix define s14 -fixed -fraction 14 -signed -base signed -precision 6
radix define s15 -fixed -fraction 15 -signed -base signed -precision 6
radix define s16 -fixed -fraction 16 -signed -base signed -precision 6
radix define s18_17 -fixed -fraction 17 -signed -base signed -precision 6
radix define s31 -fixed -fraction 31 -signed -precision 6
radix define fixed#5#decimal#signed -fixed -fraction 5 -signed -base signed -precision 6
radix define fixed#17#decimal#signed -fixed -fraction 17 -signed -base signed -precision 6
radix define s18 -fixed -fraction 18 -signed -base signed -precision 6
radix define s19 -fixed -fraction 19 -signed -base signed -precision 6
radix define s20 -fixed -fraction 20 -signed -base signed -precision 6
radix define s21 -fixed -fraction 21 -signed -base signed -precision 6
radix define s22 -fixed -fraction 22 -signed -base signed -precision 6
radix define s23 -fixed -fraction 23 -signed -base signed -precision 6
radix define s25 -fixed -fraction 25 -signed -base signed -precision 6
radix define s26 -fixed -fraction 26 -signed -base signed -precision 6
radix define s27 -fixed -fraction 27 -signed -base signed -precision 6
radix define float -fixed -fraction 27 -signed -base signed -precision 6
radix define float_1k -fixed -fraction 21 -signed -base signed -precision 6
radix define float_4k -fixed -fraction 19 -signed -base signed -precision 6
radix define float_64k -fixed -fraction 15 -signed -base signed -precision 6
radix define float_1m -fixed -fraction 11 -signed -base signed -precision 6
radix define float_1b -fixed -fraction 1 -signed -base signed -precision 6
radix define fixed#17#decimal -fixed -fraction 17 -base signed -precision 6
quietly WaveActivateNextPane {} 0
add wave -noupdate /interp_tb/ce
add wave -noupdate /interp_tb/clk
add wave -noupdate /interp_tb/Count
add wave -noupdate /interp_tb/DataIn
add wave -noupdate /interp_tb/DataOut
add wave -noupdate /interp_tb/Interpolate
add wave -noupdate /interp_tb/ValidIn
add wave -noupdate /interp_tb/ReadData
add wave -noupdate /interp_tb/reset
add wave -noupdate /interp_tb/SignedMu
add wave -noupdate /interp_tb/ValidOut
add wave -noupdate /interp_tb/Interp_u/ce
add wave -noupdate /interp_tb/Interp_u/clk
add wave -noupdate /interp_tb/Interp_u/DataIn
add wave -noupdate -expand /interp_tb/Interp_u/InArray1
add wave -noupdate -expand /interp_tb/Interp_u/InArray2
add wave -noupdate /interp_tb/Interp_u/InterpDly
add wave -noupdate /interp_tb/Interp_u/Interpolate
add wave -noupdate /interp_tb/Interp_u/DataOut
add wave -noupdate /interp_tb/Interp_u/reset
add wave -noupdate /interp_tb/Interp_u/SignedMu
add wave -noupdate /interp_tb/Interp_u/Sum
add wave -noupdate /interp_tb/Interp_u/ThreeIn2
add wave -noupdate /interp_tb/Interp_u/v0
add wave -noupdate /interp_tb/Interp_u/v1
add wave -noupdate /interp_tb/Interp_u/v2
add wave -noupdate /interp_tb/Interp_u/ValidIn
add wave -noupdate /interp_tb/Interp_u/ValidOut
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {24276 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 228
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
WaveRestoreZoom {6999 ps} {48999 ps}
bookmark add wave bookmark0 {{2508730 ps} {2540670 ps}} 0
bookmark add wave bookmark1 {{3023030 ps} {3054970 ps}} 0
bookmark add wave bookmark2 {{2187685 ps} {2199857 ps}} 33
bookmark add wave bookmark3 {{3212803 ps} {3228773 ps}} 48
