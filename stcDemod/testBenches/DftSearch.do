onerror {resume}
radix define FLoat16 -fixed -fraction 27 -signed -base signed -precision 6
radix define s17 -fixed -fraction 17 -signed -base signed -precision 6
radix define s24 -fixed -fraction 24 -signed -base signed -precision 6
radix define fixed#5#decimal#signed -fixed -fraction 5 -signed -base signed -precision 6
radix define fixed#17#decimal#signed -fixed -fraction 17 -signed -base signed -precision 6
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
add wave -noupdate -divider {DFT Search}
add wave -noupdate /dftsearch_tb/Search_u/N
add wave -noupdate /dftsearch_tb/Search_u/NDX
add wave -noupdate /dftsearch_tb/Search_u/clk
add wave -noupdate /dftsearch_tb/Search_u/reset
add wave -noupdate /dftsearch_tb/Search_u/ce
add wave -noupdate /dftsearch_tb/Search_u/X_r
add wave -noupdate /dftsearch_tb/Search_u/X_i
add wave -noupdate /dftsearch_tb/Search_u/IndexIn
add wave -noupdate /dftsearch_tb/Search_u/IndexOffset
add wave -noupdate /dftsearch_tb/Search_u/Start
add wave -noupdate /dftsearch_tb/Search_u/NextCycle
add wave -noupdate /dftsearch_tb/Search_u/Magnitude
add wave -noupdate /dftsearch_tb/Search_u/IndexOut
add wave -noupdate /dftsearch_tb/Search_u/Done
add wave -noupdate /dftsearch_tb/Search_u/Mode
add wave -noupdate /dftsearch_tb/Search_u/DoneDft
add wave -noupdate /dftsearch_tb/Search_u/MaxIndex
add wave -noupdate /dftsearch_tb/Search_u/DftIndexA
add wave -noupdate /dftsearch_tb/Search_u/DftIndexB
add wave -noupdate /dftsearch_tb/Search_u/DftIndexC
add wave -noupdate /dftsearch_tb/Search_u/Offset
add wave -noupdate /dftsearch_tb/Search_u/MagDftA
add wave -noupdate /dftsearch_tb/Search_u/MagDftB
add wave -noupdate /dftsearch_tb/Search_u/MagDftC
add wave -noupdate /dftsearch_tb/Search_u/Largest
add wave -noupdate /dftsearch_tb/Search_u/DftCount
add wave -noupdate /dftsearch_tb/Search_u/MAX_COUNT
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {369164 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 380
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
WaveRestoreZoom {0 ps} {525 ns}
bookmark add wave bookmark3 {{3023030 ps} {3054970 ps}} 0
bookmark add wave bookmark4 {{2508730 ps} {2540670 ps}} 0
