onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -format Analog-Step -height 74 -max 14615.0 -min -14615.0 -radix sfixed /demodserdestop/DataI
add wave -noupdate -format Analog-Step -height 74 -max 70.0 -radix sfixed /demodserdestop/DataQ
add wave -noupdate /demodserdestop/MDB_180_1
add wave -noupdate /demodserdestop/MDB_182_3
add wave -noupdate /demodserdestop/MDB_184_5
add wave -noupdate /demodserdestop/MDB_186
add wave -noupdate /demodserdestop/MDB_187
add wave -noupdate /demodserdestop/MDB_188_9
add wave -noupdate -format Analog-Step -height 74 -max 22469.0 -min -22457.0 -radix sfixed /demodserdestop/NoisyI
add wave -noupdate -format Analog-Step -height 74 -max 8135.9999999999991 -min -8243.0 -radix sfixed /demodserdestop/NoisyQ
add wave -noupdate -format Analog-Step -height 74 -max 1.0 -min -3.0 -radix sfixed /demodserdestop/QAM_d
add wave -noupdate -format Analog-Step -height 74 -max 18267.0 -min -18269.0 -radix sfixed /demodserdestop/IAM_d
add wave -noupdate -format Analog-Step -height 74 -max 23166.999999999996 -min -23168.0 -radix sfixed /demodserdestop/adc0In
add wave -noupdate -format Analog-Step -height 74 -max 5168.0000000000009 -min -5406.0 -radix sfixed /demodserdestop/NoiseGainedI
add wave -noupdate -format Analog-Step -height 74 -max 7168.0000000000009 -min -7430.0 -radix sfixed /demodserdestop/NoiseGainedQ
add wave -noupdate -format Analog-Step -height 74 -max 3229.9999999999995 -min -3379.0 -radix sfixed /demodserdestop/NoiseI
add wave -noupdate -format Analog-Step -height 74 -max 4480.0 -min -4644.0 -radix sfixed /demodserdestop/NoiseQ
add wave -noupdate -format Analog-Step -height 74 -max 14614.000000000004 -min -14615.0 -radix sfixed /demodserdestop/NcodI
add wave -noupdate -format Analog-Step -height 74 -max 14614.000000000004 -min -14615.0 -radix sfixed /demodserdestop/NcodQ
add wave -noupdate -format Analog-Step -height 74 -max 14614.000000000004 -min -14615.0 -radix sfixed /demodserdestop/AM_Mod
add wave -noupdate -format Analog-Step -height 74 -max 14614.000000000004 -min -14615.0 -radix sfixed /demodserdestop/ComplexMult/ImInA
add wave -noupdate -format Analog-Step -height 74 -max 14614.000000000004 -min -14615.0 -radix sfixed /demodserdestop/ComplexMult/ImInB
add wave -noupdate -format Analog-Step -height 74 -max 14614.000000000004 -min -14615.0 -radix sfixed /demodserdestop/ComplexMult/ReInA
add wave -noupdate -format Analog-Step -height 74 -max 14614.000000000004 -min -14615.0 -radix sfixed /demodserdestop/ComplexMult/ReInB
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {13642389 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 294
configure wave -valuecolwidth 129
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
WaveRestoreZoom {12854779 ps} {15300433 ps}
bookmark add wave bookmark0 {{2508730 ps} {2540670 ps}} 0
bookmark add wave bookmark1 {{3023030 ps} {3054970 ps}} 0
bookmark add wave bookmark2 {{2187685 ps} {2199857 ps}} 33
bookmark add wave bookmark3 {{3212803 ps} {3228773 ps}} 48
