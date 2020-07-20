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
radix define s19 -fixed -fraction 19 -signed -precision 10
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
radix define s18_17 -fixed -fraction 17 -signed -base signed -precision 6
radix define s31 -fixed -fraction 31 -signed -precision 6
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider Single
add wave -noupdate /chanest_tb/reset
add wave -noupdate /chanest_tb/clk
add wave -noupdate /chanest_tb/ce
add wave -noupdate /chanest_tb/StartIn
add wave -noupdate /chanest_tb/Pass
add wave -noupdate -radix sfixed /chanest_tb/Xr
add wave -noupdate -radix sfixed /chanest_tb/Xi
add wave -noupdate -radix sfixed /chanest_tb/H0EstR
add wave -noupdate -radix sfixed /chanest_tb/H0EstI
add wave -noupdate -radix sfixed /chanest_tb/H1EstR
add wave -noupdate -radix sfixed /chanest_tb/H1EstI
add wave -noupdate /chanest_tb/VarsReadR
add wave -noupdate /chanest_tb/VarsReadI
add wave -noupdate /chanest_tb/Count
add wave -noupdate /chanest_tb/RdAddr
add wave -noupdate /chanest_tb/CE_u/clk
add wave -noupdate /chanest_tb/CE_u/ce
add wave -noupdate /chanest_tb/CE_u/reset
add wave -noupdate /chanest_tb/CE_u/StartIn
add wave -noupdate -radix unsigned /chanest_tb/CE_u/TauEst0Index
add wave -noupdate -radix unsigned /chanest_tb/CE_u/TauEst1Index
add wave -noupdate -format Analog-Step -height 74 -max 123881.0 -min -122946.0 -radix sfixed /chanest_tb/CE_u/Xr
add wave -noupdate -format Analog-Step -height 74 -max 124005.0 -min -119530.0 -radix sfixed /chanest_tb/CE_u/Xi
add wave -noupdate -radix sfixed /chanest_tb/CE_u/H0EstR
add wave -noupdate -radix sfixed /chanest_tb/CE_u/H0EstI
add wave -noupdate -radix sfixed /chanest_tb/CE_u/H1EstR
add wave -noupdate -radix sfixed /chanest_tb/CE_u/H1EstI
add wave -noupdate /chanest_tb/CE_u/RdAddr
add wave -noupdate /chanest_tb/CE_u/Done
add wave -noupdate /chanest_tb/CE_u/Mode
add wave -noupdate -radix sfixed -childformat {{/chanest_tb/CE_u/Ss0R(0) -radix sfixed} {/chanest_tb/CE_u/Ss0R(-1) -radix sfixed} {/chanest_tb/CE_u/Ss0R(-2) -radix sfixed} {/chanest_tb/CE_u/Ss0R(-3) -radix sfixed} {/chanest_tb/CE_u/Ss0R(-4) -radix sfixed} {/chanest_tb/CE_u/Ss0R(-5) -radix sfixed} {/chanest_tb/CE_u/Ss0R(-6) -radix sfixed} {/chanest_tb/CE_u/Ss0R(-7) -radix sfixed} {/chanest_tb/CE_u/Ss0R(-8) -radix sfixed} {/chanest_tb/CE_u/Ss0R(-9) -radix sfixed} {/chanest_tb/CE_u/Ss0R(-10) -radix sfixed} {/chanest_tb/CE_u/Ss0R(-11) -radix sfixed} {/chanest_tb/CE_u/Ss0R(-12) -radix sfixed} {/chanest_tb/CE_u/Ss0R(-13) -radix sfixed} {/chanest_tb/CE_u/Ss0R(-14) -radix sfixed} {/chanest_tb/CE_u/Ss0R(-15) -radix sfixed} {/chanest_tb/CE_u/Ss0R(-16) -radix sfixed} {/chanest_tb/CE_u/Ss0R(-17) -radix sfixed}} -subitemconfig {/chanest_tb/CE_u/Ss0R(0) {-height 15 -radix sfixed} /chanest_tb/CE_u/Ss0R(-1) {-height 15 -radix sfixed} /chanest_tb/CE_u/Ss0R(-2) {-height 15 -radix sfixed} /chanest_tb/CE_u/Ss0R(-3) {-height 15 -radix sfixed} /chanest_tb/CE_u/Ss0R(-4) {-height 15 -radix sfixed} /chanest_tb/CE_u/Ss0R(-5) {-height 15 -radix sfixed} /chanest_tb/CE_u/Ss0R(-6) {-height 15 -radix sfixed} /chanest_tb/CE_u/Ss0R(-7) {-height 15 -radix sfixed} /chanest_tb/CE_u/Ss0R(-8) {-height 15 -radix sfixed} /chanest_tb/CE_u/Ss0R(-9) {-height 15 -radix sfixed} /chanest_tb/CE_u/Ss0R(-10) {-height 15 -radix sfixed} /chanest_tb/CE_u/Ss0R(-11) {-height 15 -radix sfixed} /chanest_tb/CE_u/Ss0R(-12) {-height 15 -radix sfixed} /chanest_tb/CE_u/Ss0R(-13) {-height 15 -radix sfixed} /chanest_tb/CE_u/Ss0R(-14) {-height 15 -radix sfixed} /chanest_tb/CE_u/Ss0R(-15) {-height 15 -radix sfixed} /chanest_tb/CE_u/Ss0R(-16) {-height 15 -radix sfixed} /chanest_tb/CE_u/Ss0R(-17) {-height 15 -radix sfixed}} /chanest_tb/CE_u/Ss0R
add wave -noupdate -radix sfixed /chanest_tb/CE_u/Ss0I
add wave -noupdate -radix sfixed /chanest_tb/CE_u/Ss1R
add wave -noupdate -radix sfixed /chanest_tb/CE_u/Ss1I
add wave -noupdate -radix sfixed /chanest_tb/CE_u/SsInvR0
add wave -noupdate -radix sfixed /chanest_tb/CE_u/SsInvR1
add wave -noupdate -radix sfixed /chanest_tb/CE_u/SsInvR2
add wave -noupdate -radix sfixed /chanest_tb/CE_u/SsInvR3
add wave -noupdate -radix sfixed /chanest_tb/CE_u/SsInvI0
add wave -noupdate -radix sfixed /chanest_tb/CE_u/SsInvI1
add wave -noupdate -radix sfixed /chanest_tb/CE_u/SsInvI2
add wave -noupdate -radix sfixed /chanest_tb/CE_u/SsInvI3
add wave -noupdate -radix sfixed /chanest_tb/CE_u/SsInvR0Ss0R
add wave -noupdate -radix sfixed /chanest_tb/CE_u/SsInvR0Ss0I
add wave -noupdate -radix sfixed /chanest_tb/CE_u/SsInvI0Ss0R
add wave -noupdate -radix sfixed /chanest_tb/CE_u/SsInvI0Ss0I
add wave -noupdate -radix sfixed /chanest_tb/CE_u/SsInvR1Ss1R
add wave -noupdate -radix sfixed /chanest_tb/CE_u/SsInvR1Ss1I
add wave -noupdate -radix sfixed /chanest_tb/CE_u/SsInvI1Ss1R
add wave -noupdate -radix sfixed /chanest_tb/CE_u/SsInvI1Ss1I
add wave -noupdate -radix sfixed /chanest_tb/CE_u/SsInvR2Ss0R
add wave -noupdate -radix sfixed /chanest_tb/CE_u/SsInvR2Ss0I
add wave -noupdate -radix sfixed /chanest_tb/CE_u/SsInvI2Ss0R
add wave -noupdate -radix sfixed /chanest_tb/CE_u/SsInvI2Ss0I
add wave -noupdate -radix sfixed /chanest_tb/CE_u/SsInvR3Ss1R
add wave -noupdate -radix sfixed /chanest_tb/CE_u/SsInvR3Ss1I
add wave -noupdate -radix sfixed /chanest_tb/CE_u/SsInvI3Ss1R
add wave -noupdate -radix sfixed /chanest_tb/CE_u/SsInvI3Ss1I
add wave -noupdate -radix sfixed /chanest_tb/CE_u/SpinvR0
add wave -noupdate -radix sfixed /chanest_tb/CE_u/SpinvI0
add wave -noupdate -radix sfixed /chanest_tb/CE_u/SpinvR1
add wave -noupdate -radix sfixed /chanest_tb/CE_u/SpinvI1
add wave -noupdate -radix sfixed /chanest_tb/CE_u/SpinvR0Dly
add wave -noupdate -radix sfixed /chanest_tb/CE_u/SpinvI0Dly
add wave -noupdate -radix sfixed /chanest_tb/CE_u/SpinvR1Dly
add wave -noupdate -radix sfixed /chanest_tb/CE_u/SpinvI1Dly
add wave -noupdate -radix sfixed /chanest_tb/CE_u/XrSpinvR0
add wave -noupdate -radix sfixed /chanest_tb/CE_u/XrSpinvI0
add wave -noupdate -radix sfixed -childformat {{/chanest_tb/CE_u/XiSpinvR0(-7) -radix sfixed} {/chanest_tb/CE_u/XiSpinvR0(-8) -radix sfixed} {/chanest_tb/CE_u/XiSpinvR0(-9) -radix sfixed} {/chanest_tb/CE_u/XiSpinvR0(-10) -radix sfixed} {/chanest_tb/CE_u/XiSpinvR0(-11) -radix sfixed} {/chanest_tb/CE_u/XiSpinvR0(-12) -radix sfixed} {/chanest_tb/CE_u/XiSpinvR0(-13) -radix sfixed} {/chanest_tb/CE_u/XiSpinvR0(-14) -radix sfixed} {/chanest_tb/CE_u/XiSpinvR0(-15) -radix sfixed} {/chanest_tb/CE_u/XiSpinvR0(-16) -radix sfixed} {/chanest_tb/CE_u/XiSpinvR0(-17) -radix sfixed} {/chanest_tb/CE_u/XiSpinvR0(-18) -radix sfixed} {/chanest_tb/CE_u/XiSpinvR0(-19) -radix sfixed} {/chanest_tb/CE_u/XiSpinvR0(-20) -radix sfixed} {/chanest_tb/CE_u/XiSpinvR0(-21) -radix sfixed} {/chanest_tb/CE_u/XiSpinvR0(-22) -radix sfixed} {/chanest_tb/CE_u/XiSpinvR0(-23) -radix sfixed} {/chanest_tb/CE_u/XiSpinvR0(-24) -radix sfixed}} -subitemconfig {/chanest_tb/CE_u/XiSpinvR0(-7) {-height 15 -radix sfixed} /chanest_tb/CE_u/XiSpinvR0(-8) {-height 15 -radix sfixed} /chanest_tb/CE_u/XiSpinvR0(-9) {-height 15 -radix sfixed} /chanest_tb/CE_u/XiSpinvR0(-10) {-height 15 -radix sfixed} /chanest_tb/CE_u/XiSpinvR0(-11) {-height 15 -radix sfixed} /chanest_tb/CE_u/XiSpinvR0(-12) {-height 15 -radix sfixed} /chanest_tb/CE_u/XiSpinvR0(-13) {-height 15 -radix sfixed} /chanest_tb/CE_u/XiSpinvR0(-14) {-height 15 -radix sfixed} /chanest_tb/CE_u/XiSpinvR0(-15) {-height 15 -radix sfixed} /chanest_tb/CE_u/XiSpinvR0(-16) {-height 15 -radix sfixed} /chanest_tb/CE_u/XiSpinvR0(-17) {-height 15 -radix sfixed} /chanest_tb/CE_u/XiSpinvR0(-18) {-height 15 -radix sfixed} /chanest_tb/CE_u/XiSpinvR0(-19) {-height 15 -radix sfixed} /chanest_tb/CE_u/XiSpinvR0(-20) {-height 15 -radix sfixed} /chanest_tb/CE_u/XiSpinvR0(-21) {-height 15 -radix sfixed} /chanest_tb/CE_u/XiSpinvR0(-22) {-height 15 -radix sfixed} /chanest_tb/CE_u/XiSpinvR0(-23) {-height 15 -radix sfixed} /chanest_tb/CE_u/XiSpinvR0(-24) {-height 15 -radix sfixed}} /chanest_tb/CE_u/XiSpinvR0
add wave -noupdate -radix sfixed /chanest_tb/CE_u/XiSpinvI0
add wave -noupdate -radix sfixed /chanest_tb/CE_u/XrSpinvR1
add wave -noupdate -radix sfixed /chanest_tb/CE_u/XrSpinvI1
add wave -noupdate -radix sfixed /chanest_tb/CE_u/XiSpinvR1
add wave -noupdate -radix sfixed /chanest_tb/CE_u/XiSpinvI1
add wave -noupdate -radix sfixed /chanest_tb/CE_u/Ar0
add wave -noupdate -radix sfixed /chanest_tb/CE_u/Ai0
add wave -noupdate -radix sfixed /chanest_tb/CE_u/Ar1
add wave -noupdate -radix sfixed /chanest_tb/CE_u/Ai1
add wave -noupdate /chanest_tb/CE_u/PilotCount
add wave -noupdate -radix sfixed /chanest_tb/CE_u/XrDelay
add wave -noupdate -radix sfixed /chanest_tb/CE_u/XiDelay
add wave -noupdate /chanest_tb/CE_u/DELAY
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {255714 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 323
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
WaveRestoreZoom {253773 ps} {269797 ps}
bookmark add wave bookmark2 {{3023030 ps} {3054970 ps}} 0
bookmark add wave bookmark3 {{2508730 ps} {2540670 ps}} 0
