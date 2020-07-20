onerror {resume}
radix define FLoat16 -fixed -fraction 27 -signed -base signed -precision 6
radix define s17 -fixed -fraction 16 -signed -base signed -precision 6
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
quietly WaveActivateNextPane {} 0
add wave -noupdate /dft_tb/Search_u/N
add wave -noupdate /dft_tb/Search_u/NDX
add wave -noupdate /dft_tb/Search_u/clk
add wave -noupdate /dft_tb/Search_u/reset
add wave -noupdate /dft_tb/Search_u/ce
add wave -noupdate /dft_tb/Search_u/X_r
add wave -noupdate /dft_tb/Search_u/X_i
add wave -noupdate -radix sfixed /dft_tb/Search_u/IndexIn
add wave -noupdate /dft_tb/Search_u/StartIn
add wave -noupdate /dft_tb/Search_u/Magnitude
add wave -noupdate -radix sfixed /dft_tb/Search_u/Done
add wave -noupdate -format Analog-Step -height 74 -max 131070.0 -min -128392.0 -radix sfixed /dft_tb/Search_u/W_r
add wave -noupdate -format Analog-Step -height 74 -max 131051.0 -min -119539.0 -radix sfixed /dft_tb/Search_u/W_i
add wave -noupdate -format Analog-Step -height 74 -min -1073220000.0 -radix sfixed /dft_tb/Search_u/PhaseInc
add wave -noupdate -format Analog-Step -height 74 -min -1501040000.0 -radix sfixed /dft_tb/Search_u/PhaseJump
add wave -noupdate -format Analog-Step -height 74 -max 2124409999.9999998 -min -2112880000.0 -radix sfixed /dft_tb/Search_u/PhaseAcc
add wave -noupdate -format Analog-Step -height 74 -max 4018139999.9999995 -radix hexadecimal /dft_tb/Search_u/PhaseAcc
add wave -noupdate -radix sfixed /dft_tb/Search_u/PhaseAcc
add wave -noupdate -radix hexadecimal -childformat {{/dft_tb/Search_u/Count(0) -radix hexadecimal} {/dft_tb/Search_u/Count(-1) -radix hexadecimal} {/dft_tb/Search_u/Count(-2) -radix hexadecimal} {/dft_tb/Search_u/Count(-3) -radix hexadecimal} {/dft_tb/Search_u/Count(-4) -radix hexadecimal} {/dft_tb/Search_u/Count(-5) -radix hexadecimal} {/dft_tb/Search_u/Count(-6) -radix hexadecimal} {/dft_tb/Search_u/Count(-7) -radix hexadecimal} {/dft_tb/Search_u/Count(-8) -radix hexadecimal} {/dft_tb/Search_u/Count(-9) -radix hexadecimal} {/dft_tb/Search_u/Count(-10) -radix hexadecimal} {/dft_tb/Search_u/Count(-11) -radix hexadecimal} {/dft_tb/Search_u/Count(-12) -radix hexadecimal} {/dft_tb/Search_u/Count(-13) -radix hexadecimal} {/dft_tb/Search_u/Count(-14) -radix hexadecimal} {/dft_tb/Search_u/Count(-15) -radix hexadecimal} {/dft_tb/Search_u/Count(-16) -radix hexadecimal} {/dft_tb/Search_u/Count(-17) -radix hexadecimal} {/dft_tb/Search_u/Count(-18) -radix hexadecimal} {/dft_tb/Search_u/Count(-19) -radix hexadecimal} {/dft_tb/Search_u/Count(-20) -radix hexadecimal} {/dft_tb/Search_u/Count(-21) -radix hexadecimal} {/dft_tb/Search_u/Count(-22) -radix hexadecimal} {/dft_tb/Search_u/Count(-23) -radix hexadecimal} {/dft_tb/Search_u/Count(-24) -radix hexadecimal} {/dft_tb/Search_u/Count(-25) -radix hexadecimal} {/dft_tb/Search_u/Count(-26) -radix hexadecimal} {/dft_tb/Search_u/Count(-27) -radix hexadecimal} {/dft_tb/Search_u/Count(-28) -radix hexadecimal} {/dft_tb/Search_u/Count(-29) -radix hexadecimal} {/dft_tb/Search_u/Count(-30) -radix hexadecimal} {/dft_tb/Search_u/Count(-31) -radix hexadecimal}} -subitemconfig {/dft_tb/Search_u/Count(0) {-height 15 -radix hexadecimal} /dft_tb/Search_u/Count(-1) {-height 15 -radix hexadecimal} /dft_tb/Search_u/Count(-2) {-height 15 -radix hexadecimal} /dft_tb/Search_u/Count(-3) {-height 15 -radix hexadecimal} /dft_tb/Search_u/Count(-4) {-height 15 -radix hexadecimal} /dft_tb/Search_u/Count(-5) {-height 15 -radix hexadecimal} /dft_tb/Search_u/Count(-6) {-height 15 -radix hexadecimal} /dft_tb/Search_u/Count(-7) {-height 15 -radix hexadecimal} /dft_tb/Search_u/Count(-8) {-height 15 -radix hexadecimal} /dft_tb/Search_u/Count(-9) {-height 15 -radix hexadecimal} /dft_tb/Search_u/Count(-10) {-height 15 -radix hexadecimal} /dft_tb/Search_u/Count(-11) {-height 15 -radix hexadecimal} /dft_tb/Search_u/Count(-12) {-height 15 -radix hexadecimal} /dft_tb/Search_u/Count(-13) {-height 15 -radix hexadecimal} /dft_tb/Search_u/Count(-14) {-height 15 -radix hexadecimal} /dft_tb/Search_u/Count(-15) {-height 15 -radix hexadecimal} /dft_tb/Search_u/Count(-16) {-height 15 -radix hexadecimal} /dft_tb/Search_u/Count(-17) {-height 15 -radix hexadecimal} /dft_tb/Search_u/Count(-18) {-height 15 -radix hexadecimal} /dft_tb/Search_u/Count(-19) {-height 15 -radix hexadecimal} /dft_tb/Search_u/Count(-20) {-height 15 -radix hexadecimal} /dft_tb/Search_u/Count(-21) {-height 15 -radix hexadecimal} /dft_tb/Search_u/Count(-22) {-height 15 -radix hexadecimal} /dft_tb/Search_u/Count(-23) {-height 15 -radix hexadecimal} /dft_tb/Search_u/Count(-24) {-height 15 -radix hexadecimal} /dft_tb/Search_u/Count(-25) {-height 15 -radix hexadecimal} /dft_tb/Search_u/Count(-26) {-height 15 -radix hexadecimal} /dft_tb/Search_u/Count(-27) {-height 15 -radix hexadecimal} /dft_tb/Search_u/Count(-28) {-height 15 -radix hexadecimal} /dft_tb/Search_u/Count(-29) {-height 15 -radix hexadecimal} /dft_tb/Search_u/Count(-30) {-height 15 -radix hexadecimal} /dft_tb/Search_u/Count(-31) {-height 15 -radix hexadecimal}} /dft_tb/Search_u/Count
add wave -noupdate -radix sfixed -childformat {{/dft_tb/Search_u/Count(0) -radix hexadecimal} {/dft_tb/Search_u/Count(-1) -radix hexadecimal} {/dft_tb/Search_u/Count(-2) -radix hexadecimal} {/dft_tb/Search_u/Count(-3) -radix hexadecimal} {/dft_tb/Search_u/Count(-4) -radix hexadecimal} {/dft_tb/Search_u/Count(-5) -radix hexadecimal} {/dft_tb/Search_u/Count(-6) -radix hexadecimal} {/dft_tb/Search_u/Count(-7) -radix hexadecimal} {/dft_tb/Search_u/Count(-8) -radix hexadecimal} {/dft_tb/Search_u/Count(-9) -radix hexadecimal} {/dft_tb/Search_u/Count(-10) -radix hexadecimal} {/dft_tb/Search_u/Count(-11) -radix hexadecimal} {/dft_tb/Search_u/Count(-12) -radix hexadecimal} {/dft_tb/Search_u/Count(-13) -radix hexadecimal} {/dft_tb/Search_u/Count(-14) -radix hexadecimal} {/dft_tb/Search_u/Count(-15) -radix hexadecimal} {/dft_tb/Search_u/Count(-16) -radix hexadecimal} {/dft_tb/Search_u/Count(-17) -radix hexadecimal} {/dft_tb/Search_u/Count(-18) -radix hexadecimal} {/dft_tb/Search_u/Count(-19) -radix hexadecimal} {/dft_tb/Search_u/Count(-20) -radix hexadecimal} {/dft_tb/Search_u/Count(-21) -radix hexadecimal} {/dft_tb/Search_u/Count(-22) -radix hexadecimal} {/dft_tb/Search_u/Count(-23) -radix hexadecimal} {/dft_tb/Search_u/Count(-24) -radix hexadecimal} {/dft_tb/Search_u/Count(-25) -radix hexadecimal} {/dft_tb/Search_u/Count(-26) -radix hexadecimal} {/dft_tb/Search_u/Count(-27) -radix hexadecimal} {/dft_tb/Search_u/Count(-28) -radix hexadecimal} {/dft_tb/Search_u/Count(-29) -radix hexadecimal} {/dft_tb/Search_u/Count(-30) -radix hexadecimal} {/dft_tb/Search_u/Count(-31) -radix hexadecimal}} -subitemconfig {/dft_tb/Search_u/Count(0) {-height 15 -radix hexadecimal} /dft_tb/Search_u/Count(-1) {-height 15 -radix hexadecimal} /dft_tb/Search_u/Count(-2) {-height 15 -radix hexadecimal} /dft_tb/Search_u/Count(-3) {-height 15 -radix hexadecimal} /dft_tb/Search_u/Count(-4) {-height 15 -radix hexadecimal} /dft_tb/Search_u/Count(-5) {-height 15 -radix hexadecimal} /dft_tb/Search_u/Count(-6) {-height 15 -radix hexadecimal} /dft_tb/Search_u/Count(-7) {-height 15 -radix hexadecimal} /dft_tb/Search_u/Count(-8) {-height 15 -radix hexadecimal} /dft_tb/Search_u/Count(-9) {-height 15 -radix hexadecimal} /dft_tb/Search_u/Count(-10) {-height 15 -radix hexadecimal} /dft_tb/Search_u/Count(-11) {-height 15 -radix hexadecimal} /dft_tb/Search_u/Count(-12) {-height 15 -radix hexadecimal} /dft_tb/Search_u/Count(-13) {-height 15 -radix hexadecimal} /dft_tb/Search_u/Count(-14) {-height 15 -radix hexadecimal} /dft_tb/Search_u/Count(-15) {-height 15 -radix hexadecimal} /dft_tb/Search_u/Count(-16) {-height 15 -radix hexadecimal} /dft_tb/Search_u/Count(-17) {-height 15 -radix hexadecimal} /dft_tb/Search_u/Count(-18) {-height 15 -radix hexadecimal} /dft_tb/Search_u/Count(-19) {-height 15 -radix hexadecimal} /dft_tb/Search_u/Count(-20) {-height 15 -radix hexadecimal} /dft_tb/Search_u/Count(-21) {-height 15 -radix hexadecimal} /dft_tb/Search_u/Count(-22) {-height 15 -radix hexadecimal} /dft_tb/Search_u/Count(-23) {-height 15 -radix hexadecimal} /dft_tb/Search_u/Count(-24) {-height 15 -radix hexadecimal} /dft_tb/Search_u/Count(-25) {-height 15 -radix hexadecimal} /dft_tb/Search_u/Count(-26) {-height 15 -radix hexadecimal} /dft_tb/Search_u/Count(-27) {-height 15 -radix hexadecimal} /dft_tb/Search_u/Count(-28) {-height 15 -radix hexadecimal} /dft_tb/Search_u/Count(-29) {-height 15 -radix hexadecimal} /dft_tb/Search_u/Count(-30) {-height 15 -radix hexadecimal} /dft_tb/Search_u/Count(-31) {-height 15 -radix hexadecimal}} /dft_tb/Search_u/Count
add wave -noupdate -radix sfixed /dft_tb/Search_u/TempR
add wave -noupdate -format Analog-Step -height 74 -max 131069.99999999999 -min -131070.0 -radix sfixed /dft_tb/Search_u/TempR
add wave -noupdate -format Analog-Step -height 74 -max 131069.99999999999 -min -131070.0 -radix sfixed /dft_tb/Search_u/TempI
add wave -noupdate /dft_tb/Search_u/DelayX_r
add wave -noupdate /dft_tb/Search_u/DelayX_i
add wave -noupdate /dft_tb/Search_u/DelayXr
add wave -noupdate /dft_tb/Search_u/DelayXi
add wave -noupdate /dft_tb/Search_u/WrXr
add wave -noupdate /dft_tb/Search_u/WrXi
add wave -noupdate /dft_tb/Search_u/WiXr
add wave -noupdate /dft_tb/Search_u/WiXi
add wave -noupdate /dft_tb/Search_u/IndexInDly
add wave -noupdate /dft_tb/Search_u/XRay_r
add wave -noupdate /dft_tb/Search_u/XRay_i
add wave -noupdate /dft_tb/Search_u/MagRe
add wave -noupdate /dft_tb/Search_u/MagIm
add wave -noupdate /dft_tb/Search_u/IndexCount
add wave -noupdate /dft_tb/Search_u/PhaseCount
add wave -noupdate /dft_tb/Search_u/tvalid
add wave -noupdate /dft_tb/Search_u/tempV
add wave -noupdate /dft_tb/Search_u/DDS_Reset_n
add wave -noupdate /dft_tb/Search_u/PhaseActive
add wave -noupdate /dft_tb/Search_u/InternalStart
add wave -noupdate /dft_tb/Search_u/tdata
add wave -noupdate /dft_tb/Search_u/tempD
add wave -noupdate /dft_tb/Search_u/DelayStart
add wave -noupdate /dft_tb/Search_u/SIN_COS_LATENCY
add wave -noupdate /dft_tb/Search_u/LOG2_N
add wave -noupdate /dft_tb/Search_u/PHASE_OFFSETA
add wave -noupdate /dft_tb/Search_u/PHASE_OFFSETB
add wave -noupdate /dft_tb/Search_u/PHASE_JUMP123
add wave -noupdate /dft_tb/Search_u/PHASE_JUMP0
add wave -noupdate -format Analog-Step -height 74 -max 30656.0 -min -25544.0 /dft_tb/Search_u/SinCos_u/s_axis_phase_tdata
add wave -noupdate /dft_tb/Search_u/SinCos_u/m_axis_data_tdata
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {56000 ps} 0} {{Cursor 2} {53000 ps} 0}
quietly wave cursor active 2
configure wave -namecolwidth 232
configure wave -valuecolwidth 147
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
WaveRestoreZoom {0 ps} {105 ns}
