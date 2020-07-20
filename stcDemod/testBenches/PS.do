onerror {resume}
quietly set dataset_list [list sim PD2 vsim PD1 PD]
if {[catch {datasetcheck $dataset_list}]} {abort}
radix define s17 -fixed -fraction 17 -signed -base signed -precision 6
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
radix define s24 -fixed -fraction 24 -signed -base signed -precision 6
radix define s25 -fixed -fraction 25 -signed -base signed -precision 6
radix define s26 -fixed -fraction 26 -signed -base signed -precision 6
radix define s27 -fixed -fraction 27 -signed -base signed -precision 6
radix define float -fixed -fraction 27 -signed -base signed -precision 6
radix define float_1k -fixed -fraction 21 -signed -base signed -precision 6
radix define float_4k -fixed -fraction 19 -signed -base signed -precision 6
radix define float_64k -fixed -fraction 15 -signed -base signed -precision 6
radix define float_1m -fixed -fraction 11 -signed -base signed -precision 6
radix define float_1b -fixed -fraction 1 -signed -base signed -precision 6
radix define FLoat16 -fixed -fraction 27 -signed -base signed -precision 6
radix define s18_17 -fixed -fraction 17 -signed -base signed -precision 6
quietly WaveActivateNextPane {} 0
add wave -noupdate sim:/pilotsync_tb/Booleans
add wave -noupdate sim:/pilotsync_tb/Done1
add wave -noupdate sim:/pilotsync_tb/Done2
add wave -noupdate sim:/pilotsync_tb/ImOut
add wave -noupdate sim:/pilotsync_tb/MagThresh
add wave -noupdate sim:/pilotsync_tb/ReImRead
add wave -noupdate sim:/pilotsync_tb/ReOut
add wave -noupdate sim:/pilotsync_tb/StartOut
add wave -noupdate sim:/pilotsync_tb/ValidIn
add wave -noupdate sim:/pilotsync_tb/ValidOut
add wave -noupdate sim:/pilotsync_tb/PS_u/ImagIn
add wave -noupdate sim:/pilotsync_tb/PS_u/RealIn
add wave -noupdate sim:/pilotsync_tb/PS_u/IndexIn
add wave -noupdate sim:/pilotsync_tb/PS_u/IndexOut
add wave -noupdate sim:/pilotsync_tb/PS_u/OFFSET
add wave -noupdate sim:/pilotsync_tb/PS_u/ValidIn
add wave -noupdate sim:/pilotsync_tb/PS_u/ValidOut
add wave -noupdate -format Analog-Step -height 74 -max 512.0 -radix unsigned -radixshowbase 0 sim:/pilotsync_tb/PS_u/PacketCount_i
add wave -noupdate -format Analog-Step -height 74 -max 123664.0 -min -123995.0 sim:/pilotsync_tb/PS_u/ImagOut
add wave -noupdate -format Analog-Step -height 74 -max 123974.00000000001 -min -123965.0 sim:/pilotsync_tb/PS_u/RealOut
add wave -noupdate -radix unsigned -radixshowbase 0 sim:/pilotsync_tb/PS_u/WrAddr
add wave -noupdate sim:/pilotsync_tb/PS_u/PilotPulseIn
add wave -noupdate sim:/pilotsync_tb/PS_u/StartNext
add wave -noupdate sim:/pilotsync_tb/PS_u/StartOut
add wave -noupdate -radix unsigned -radixshowbase 0 sim:/pilotsync_tb/PS_u/RdAddr
add wave -noupdate -radix unsigned -radixshowbase 0 sim:/pilotsync_tb/PS_u/RdAddr_i
add wave -noupdate -format Analog-Step -height 74 -max 4094.9999999999995 sim:/pilotsync_tb/PS_u/RdAddr_i
add wave -noupdate -format Analog-Step -height 74 -max 61.0 sim:/pilotsync_tb/PS_u/WaitCount_i
add wave -noupdate -format Analog-Step -height 74 -max 4094.9999999999995 sim:/pilotsync_tb/PS_u/WrAddr_i
add wave -noupdate sim:/pilotsync_tb/PS_u/ce
add wave -noupdate sim:/pilotsync_tb/PS_u/clk
add wave -noupdate sim:/pilotsync_tb/PS_u/reset
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 3} {107655949 ps} 0} {{Cursor 4} {156362710 ps} 0} {{Cursor 3} {108101000 ps} 0}
quietly wave cursor active 3
configure wave -namecolwidth 271
configure wave -valuecolwidth 74
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
WaveRestoreZoom {0 ps} {116550 ns}
bookmark add wave bookmark0 {{2508730 ps} {2540670 ps}} 0
bookmark add wave bookmark1 {{3023030 ps} {3054970 ps}} 0
bookmark add wave bookmark2 {{2187685 ps} {2199857 ps}} 33
bookmark add wave bookmark3 {{3212803 ps} {3228773 ps}} 48
