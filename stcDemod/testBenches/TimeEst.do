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
add wave -noupdate /timeest_tb/Count
add wave -noupdate /timeest_tb/Dones
add wave -noupdate /timeest_tb/ErrorCount
add wave -noupdate /timeest_tb/Pass
add wave -noupdate /timeest_tb/TE_u/Done
add wave -noupdate /timeest_tb/reset
add wave -noupdate /timeest_tb/StartIn
add wave -noupdate -format Analog-Step -height 74 -max 15948700.0 -min -15757300.0 -radix sfixed /timeest_tb/Xr
add wave -noupdate -format Analog-Step -height 74 -max 15890799.999999996 -min -15650700.0 -radix sfixed /timeest_tb/Xi
add wave -noupdate -radix sfixed /timeest_tb/TE_u/Xi
add wave -noupdate -radix sfixed /timeest_tb/TE_u/Xr
add wave -noupdate /timeest_tb/TE_u/reset
add wave -noupdate /timeest_tb/TE_u/StartCM
add wave -noupdate /timeest_tb/TE_u/StartIn
add wave -noupdate /timeest_tb/TE_u/Mode
add wave -noupdate /timeest_tb/TE_u/CenterX
add wave -noupdate /timeest_tb/TE_u/CenterY
add wave -noupdate /timeest_tb/TE_u/Offset
add wave -noupdate /timeest_tb/TE_u/ComputeDone
add wave -noupdate -radix sfixed /timeest_tb/TE_u/ResultsCM
add wave -noupdate /timeest_tb/TE_u/MinIndex
add wave -noupdate /timeest_tb/TE_u/Iterations
add wave -noupdate /timeest_tb/TE_u/ResultsCMreg
add wave -noupdate /timeest_tb/TE_u/PipeLine
add wave -noupdate /timeest_tb/TE_u/OffsetXreg
add wave -noupdate /timeest_tb/TE_u/OffsetYreg
add wave -noupdate -radix sfixed /timeest_tb/TE_u/MinCM
add wave -noupdate /timeest_tb/TE_u/MinX
add wave -noupdate /timeest_tb/TE_u/MinY
add wave -noupdate /timeest_tb/TE_u/xx
add wave -noupdate /timeest_tb/TE_u/yy
add wave -noupdate -radix unsigned /timeest_tb/TE_u/RdCntr
add wave -noupdate -radix unsigned /timeest_tb/TE_u/RdCntr_u
add wave -noupdate /timeest_tb/Tau0Ndx
add wave -noupdate /timeest_tb/Tau1Ndx
add wave -noupdate /timeest_tb/Tau0Est
add wave -noupdate /timeest_tb/Tau1Est
add wave -noupdate -radix unsigned /timeest_tb/TE_u/RdAddr
add wave -noupdate /timeest_tb/TE_u/ADDR_MAX
add wave -noupdate /timeest_tb/TE_u/ComputeMetric1_u/IndexX
add wave -noupdate /timeest_tb/TE_u/ComputeMetric1_u/IndexY
add wave -noupdate /timeest_tb/TE_u/ComputeMetric2_u/IndexX
add wave -noupdate /timeest_tb/TE_u/ComputeMetric2_u/IndexY
add wave -noupdate /timeest_tb/TE_u/ComputeMetric3_u/IndexX
add wave -noupdate /timeest_tb/TE_u/ComputeMetric3_u/IndexY
add wave -noupdate /timeest_tb/TE_u/ComputeMetric4_u/IndexX
add wave -noupdate /timeest_tb/TE_u/ComputeMetric4_u/IndexY
add wave -noupdate -divider CM1
add wave -noupdate /timeest_tb/TE_u/ComputeMetric1_u/ce
add wave -noupdate /timeest_tb/TE_u/ComputeMetric1_u/clk
add wave -noupdate /timeest_tb/TE_u/ComputeMetric1_u/DELAY
add wave -noupdate /timeest_tb/TE_u/ComputeMetric1_u/DELAY23
add wave -noupdate /timeest_tb/TE_u/ComputeMetric1_u/Done
add wave -noupdate /timeest_tb/TE_u/ComputeMetric1_u/IndexX
add wave -noupdate /timeest_tb/TE_u/ComputeMetric1_u/IndexY
add wave -noupdate /timeest_tb/TE_u/ComputeMetric1_u/Mode
add wave -noupdate -radix sfixed /timeest_tb/TE_u/ComputeMetric1_u/SsInvR0
add wave -noupdate -radix sfixed /timeest_tb/TE_u/ComputeMetric1_u/SsInvR1
add wave -noupdate -radix sfixed /timeest_tb/TE_u/ComputeMetric1_u/SsInvR2
add wave -noupdate -radix sfixed /timeest_tb/TE_u/ComputeMetric1_u/SsInvR3
add wave -noupdate -radix sfixed /timeest_tb/TE_u/ComputeMetric1_u/SsInvI0
add wave -noupdate -radix sfixed /timeest_tb/TE_u/ComputeMetric1_u/SsInvI1
add wave -noupdate -radix sfixed /timeest_tb/TE_u/ComputeMetric1_u/SsInvI2
add wave -noupdate -radix sfixed /timeest_tb/TE_u/ComputeMetric1_u/SsInvI3
add wave -noupdate -radix sfixed /timeest_tb/TE_u/ComputeMetric1_u/Ss0I
add wave -noupdate -radix sfixed /timeest_tb/TE_u/ComputeMetric1_u/Ss0R
add wave -noupdate -radix sfixed /timeest_tb/TE_u/ComputeMetric1_u/Ss1I
add wave -noupdate -radix sfixed /timeest_tb/TE_u/ComputeMetric1_u/Ss1R
add wave -noupdate -radix sfixed /timeest_tb/TE_u/ComputeMetric1_u/SsInvI0Ss0I
add wave -noupdate -radix sfixed /timeest_tb/TE_u/ComputeMetric1_u/SsInvI0Ss0R
add wave -noupdate -radix sfixed /timeest_tb/TE_u/ComputeMetric1_u/SsInvI1Ss1I
add wave -noupdate -radix sfixed /timeest_tb/TE_u/ComputeMetric1_u/SsInvI1Ss1R
add wave -noupdate -radix sfixed /timeest_tb/TE_u/ComputeMetric1_u/SsInvI2Ss0I
add wave -noupdate -radix sfixed /timeest_tb/TE_u/ComputeMetric1_u/SsInvI2Ss0R
add wave -noupdate -radix sfixed /timeest_tb/TE_u/ComputeMetric1_u/SsInvI3Ss1I
add wave -noupdate -radix sfixed /timeest_tb/TE_u/ComputeMetric1_u/SsInvI3Ss1R
add wave -noupdate -radix sfixed /timeest_tb/TE_u/ComputeMetric1_u/SsInvR0Ss0I
add wave -noupdate -radix sfixed /timeest_tb/TE_u/ComputeMetric1_u/SsInvR0Ss0R
add wave -noupdate -radix sfixed /timeest_tb/TE_u/ComputeMetric1_u/SsInvR1Ss1I
add wave -noupdate -radix sfixed /timeest_tb/TE_u/ComputeMetric1_u/SsInvR1Ss1R
add wave -noupdate -radix sfixed /timeest_tb/TE_u/ComputeMetric1_u/SsInvR2Ss0I
add wave -noupdate -radix sfixed /timeest_tb/TE_u/ComputeMetric1_u/SsInvR2Ss0R
add wave -noupdate -radix sfixed /timeest_tb/TE_u/ComputeMetric1_u/SsInvR3Ss1I
add wave -noupdate -radix sfixed -childformat {{/timeest_tb/TE_u/ComputeMetric1_u/SsInvR3Ss1R(-7) -radix sfixed} {/timeest_tb/TE_u/ComputeMetric1_u/SsInvR3Ss1R(-8) -radix sfixed} {/timeest_tb/TE_u/ComputeMetric1_u/SsInvR3Ss1R(-9) -radix sfixed} {/timeest_tb/TE_u/ComputeMetric1_u/SsInvR3Ss1R(-10) -radix sfixed} {/timeest_tb/TE_u/ComputeMetric1_u/SsInvR3Ss1R(-11) -radix sfixed} {/timeest_tb/TE_u/ComputeMetric1_u/SsInvR3Ss1R(-12) -radix sfixed} {/timeest_tb/TE_u/ComputeMetric1_u/SsInvR3Ss1R(-13) -radix sfixed} {/timeest_tb/TE_u/ComputeMetric1_u/SsInvR3Ss1R(-14) -radix sfixed} {/timeest_tb/TE_u/ComputeMetric1_u/SsInvR3Ss1R(-15) -radix sfixed} {/timeest_tb/TE_u/ComputeMetric1_u/SsInvR3Ss1R(-16) -radix sfixed} {/timeest_tb/TE_u/ComputeMetric1_u/SsInvR3Ss1R(-17) -radix sfixed} {/timeest_tb/TE_u/ComputeMetric1_u/SsInvR3Ss1R(-18) -radix sfixed} {/timeest_tb/TE_u/ComputeMetric1_u/SsInvR3Ss1R(-19) -radix sfixed} {/timeest_tb/TE_u/ComputeMetric1_u/SsInvR3Ss1R(-20) -radix sfixed} {/timeest_tb/TE_u/ComputeMetric1_u/SsInvR3Ss1R(-21) -radix sfixed} {/timeest_tb/TE_u/ComputeMetric1_u/SsInvR3Ss1R(-22) -radix sfixed} {/timeest_tb/TE_u/ComputeMetric1_u/SsInvR3Ss1R(-23) -radix sfixed} {/timeest_tb/TE_u/ComputeMetric1_u/SsInvR3Ss1R(-24) -radix sfixed}} -subitemconfig {/timeest_tb/TE_u/ComputeMetric1_u/SsInvR3Ss1R(-7) {-height 15 -radix sfixed} /timeest_tb/TE_u/ComputeMetric1_u/SsInvR3Ss1R(-8) {-height 15 -radix sfixed} /timeest_tb/TE_u/ComputeMetric1_u/SsInvR3Ss1R(-9) {-height 15 -radix sfixed} /timeest_tb/TE_u/ComputeMetric1_u/SsInvR3Ss1R(-10) {-height 15 -radix sfixed} /timeest_tb/TE_u/ComputeMetric1_u/SsInvR3Ss1R(-11) {-height 15 -radix sfixed} /timeest_tb/TE_u/ComputeMetric1_u/SsInvR3Ss1R(-12) {-height 15 -radix sfixed} /timeest_tb/TE_u/ComputeMetric1_u/SsInvR3Ss1R(-13) {-height 15 -radix sfixed} /timeest_tb/TE_u/ComputeMetric1_u/SsInvR3Ss1R(-14) {-height 15 -radix sfixed} /timeest_tb/TE_u/ComputeMetric1_u/SsInvR3Ss1R(-15) {-height 15 -radix sfixed} /timeest_tb/TE_u/ComputeMetric1_u/SsInvR3Ss1R(-16) {-height 15 -radix sfixed} /timeest_tb/TE_u/ComputeMetric1_u/SsInvR3Ss1R(-17) {-height 15 -radix sfixed} /timeest_tb/TE_u/ComputeMetric1_u/SsInvR3Ss1R(-18) {-height 15 -radix sfixed} /timeest_tb/TE_u/ComputeMetric1_u/SsInvR3Ss1R(-19) {-height 15 -radix sfixed} /timeest_tb/TE_u/ComputeMetric1_u/SsInvR3Ss1R(-20) {-height 15 -radix sfixed} /timeest_tb/TE_u/ComputeMetric1_u/SsInvR3Ss1R(-21) {-height 15 -radix sfixed} /timeest_tb/TE_u/ComputeMetric1_u/SsInvR3Ss1R(-22) {-height 15 -radix sfixed} /timeest_tb/TE_u/ComputeMetric1_u/SsInvR3Ss1R(-23) {-height 15 -radix sfixed} /timeest_tb/TE_u/ComputeMetric1_u/SsInvR3Ss1R(-24) {-height 15 -radix sfixed}} /timeest_tb/TE_u/ComputeMetric1_u/SsInvR3Ss1R
add wave -noupdate -radix sfixed /timeest_tb/TE_u/ComputeMetric1_u/SpinvI0
add wave -noupdate -radix sfixed /timeest_tb/TE_u/ComputeMetric1_u/SpinvI1
add wave -noupdate -radix sfixed /timeest_tb/TE_u/ComputeMetric1_u/SpinvR0
add wave -noupdate -radix sfixed /timeest_tb/TE_u/ComputeMetric1_u/SpinvR1
add wave -noupdate -radix sfixed /timeest_tb/TE_u/ComputeMetric1_u/XrSpinvI0
add wave -noupdate -radix sfixed /timeest_tb/TE_u/ComputeMetric1_u/XrSpinvI1
add wave -noupdate -radix sfixed /timeest_tb/TE_u/ComputeMetric1_u/XrSpinvR0
add wave -noupdate -radix sfixed /timeest_tb/TE_u/ComputeMetric1_u/XrSpinvR1
add wave -noupdate -radix sfixed /timeest_tb/TE_u/ComputeMetric1_u/XiSpinvI0
add wave -noupdate -radix sfixed /timeest_tb/TE_u/ComputeMetric1_u/XiSpinvI1
add wave -noupdate -radix sfixed /timeest_tb/TE_u/ComputeMetric1_u/XiSpinvR0
add wave -noupdate -radix sfixed /timeest_tb/TE_u/ComputeMetric1_u/XiSpinvR1
add wave -noupdate -radix sfixed /timeest_tb/TE_u/ComputeMetric1_u/NormTempR0
add wave -noupdate -radix sfixed /timeest_tb/TE_u/ComputeMetric1_u/NormTempR1
add wave -noupdate -radix sfixed /timeest_tb/TE_u/ComputeMetric1_u/NormTempI0
add wave -noupdate -radix sfixed /timeest_tb/TE_u/ComputeMetric1_u/NormTempI1
add wave -noupdate -radix sfixed -childformat {{/timeest_tb/TE_u/ComputeMetric1_u/Xr(0) -radix sfixed} {/timeest_tb/TE_u/ComputeMetric1_u/Xr(-1) -radix sfixed} {/timeest_tb/TE_u/ComputeMetric1_u/Xr(-2) -radix sfixed} {/timeest_tb/TE_u/ComputeMetric1_u/Xr(-3) -radix sfixed} {/timeest_tb/TE_u/ComputeMetric1_u/Xr(-4) -radix sfixed} {/timeest_tb/TE_u/ComputeMetric1_u/Xr(-5) -radix sfixed} {/timeest_tb/TE_u/ComputeMetric1_u/Xr(-6) -radix sfixed} {/timeest_tb/TE_u/ComputeMetric1_u/Xr(-7) -radix sfixed} {/timeest_tb/TE_u/ComputeMetric1_u/Xr(-8) -radix sfixed} {/timeest_tb/TE_u/ComputeMetric1_u/Xr(-9) -radix sfixed} {/timeest_tb/TE_u/ComputeMetric1_u/Xr(-10) -radix sfixed} {/timeest_tb/TE_u/ComputeMetric1_u/Xr(-11) -radix sfixed} {/timeest_tb/TE_u/ComputeMetric1_u/Xr(-12) -radix sfixed} {/timeest_tb/TE_u/ComputeMetric1_u/Xr(-13) -radix sfixed} {/timeest_tb/TE_u/ComputeMetric1_u/Xr(-14) -radix sfixed} {/timeest_tb/TE_u/ComputeMetric1_u/Xr(-15) -radix sfixed} {/timeest_tb/TE_u/ComputeMetric1_u/Xr(-16) -radix sfixed} {/timeest_tb/TE_u/ComputeMetric1_u/Xr(-17) -radix sfixed} {/timeest_tb/TE_u/ComputeMetric1_u/Xr(-18) -radix sfixed} {/timeest_tb/TE_u/ComputeMetric1_u/Xr(-19) -radix sfixed} {/timeest_tb/TE_u/ComputeMetric1_u/Xr(-20) -radix sfixed} {/timeest_tb/TE_u/ComputeMetric1_u/Xr(-21) -radix sfixed} {/timeest_tb/TE_u/ComputeMetric1_u/Xr(-22) -radix sfixed} {/timeest_tb/TE_u/ComputeMetric1_u/Xr(-23) -radix sfixed} {/timeest_tb/TE_u/ComputeMetric1_u/Xr(-24) -radix sfixed}} -subitemconfig {/timeest_tb/TE_u/ComputeMetric1_u/Xr(0) {-height 15 -radix sfixed} /timeest_tb/TE_u/ComputeMetric1_u/Xr(-1) {-height 15 -radix sfixed} /timeest_tb/TE_u/ComputeMetric1_u/Xr(-2) {-height 15 -radix sfixed} /timeest_tb/TE_u/ComputeMetric1_u/Xr(-3) {-height 15 -radix sfixed} /timeest_tb/TE_u/ComputeMetric1_u/Xr(-4) {-height 15 -radix sfixed} /timeest_tb/TE_u/ComputeMetric1_u/Xr(-5) {-height 15 -radix sfixed} /timeest_tb/TE_u/ComputeMetric1_u/Xr(-6) {-height 15 -radix sfixed} /timeest_tb/TE_u/ComputeMetric1_u/Xr(-7) {-height 15 -radix sfixed} /timeest_tb/TE_u/ComputeMetric1_u/Xr(-8) {-height 15 -radix sfixed} /timeest_tb/TE_u/ComputeMetric1_u/Xr(-9) {-height 15 -radix sfixed} /timeest_tb/TE_u/ComputeMetric1_u/Xr(-10) {-height 15 -radix sfixed} /timeest_tb/TE_u/ComputeMetric1_u/Xr(-11) {-height 15 -radix sfixed} /timeest_tb/TE_u/ComputeMetric1_u/Xr(-12) {-height 15 -radix sfixed} /timeest_tb/TE_u/ComputeMetric1_u/Xr(-13) {-height 15 -radix sfixed} /timeest_tb/TE_u/ComputeMetric1_u/Xr(-14) {-height 15 -radix sfixed} /timeest_tb/TE_u/ComputeMetric1_u/Xr(-15) {-height 15 -radix sfixed} /timeest_tb/TE_u/ComputeMetric1_u/Xr(-16) {-height 15 -radix sfixed} /timeest_tb/TE_u/ComputeMetric1_u/Xr(-17) {-height 15 -radix sfixed} /timeest_tb/TE_u/ComputeMetric1_u/Xr(-18) {-height 15 -radix sfixed} /timeest_tb/TE_u/ComputeMetric1_u/Xr(-19) {-height 15 -radix sfixed} /timeest_tb/TE_u/ComputeMetric1_u/Xr(-20) {-height 15 -radix sfixed} /timeest_tb/TE_u/ComputeMetric1_u/Xr(-21) {-height 15 -radix sfixed} /timeest_tb/TE_u/ComputeMetric1_u/Xr(-22) {-height 15 -radix sfixed} /timeest_tb/TE_u/ComputeMetric1_u/Xr(-23) {-height 15 -radix sfixed} /timeest_tb/TE_u/ComputeMetric1_u/Xr(-24) {-height 15 -radix sfixed}} /timeest_tb/TE_u/ComputeMetric1_u/Xr
add wave -noupdate -radix sfixed -childformat {{/timeest_tb/TE_u/ComputeMetric1_u/XrDelay(7) -radix sfixed} {/timeest_tb/TE_u/ComputeMetric1_u/XrDelay(6) -radix sfixed} {/timeest_tb/TE_u/ComputeMetric1_u/XrDelay(5) -radix sfixed} {/timeest_tb/TE_u/ComputeMetric1_u/XrDelay(4) -radix sfixed} {/timeest_tb/TE_u/ComputeMetric1_u/XrDelay(3) -radix sfixed} {/timeest_tb/TE_u/ComputeMetric1_u/XrDelay(2) -radix sfixed} {/timeest_tb/TE_u/ComputeMetric1_u/XrDelay(1) -radix sfixed} {/timeest_tb/TE_u/ComputeMetric1_u/XrDelay(0) -radix sfixed}} -expand -subitemconfig {/timeest_tb/TE_u/ComputeMetric1_u/XrDelay(7) {-height 15 -radix sfixed} /timeest_tb/TE_u/ComputeMetric1_u/XrDelay(6) {-height 15 -radix sfixed} /timeest_tb/TE_u/ComputeMetric1_u/XrDelay(5) {-height 15 -radix sfixed} /timeest_tb/TE_u/ComputeMetric1_u/XrDelay(4) {-height 15 -radix sfixed} /timeest_tb/TE_u/ComputeMetric1_u/XrDelay(3) {-height 15 -radix sfixed} /timeest_tb/TE_u/ComputeMetric1_u/XrDelay(2) {-height 15 -radix sfixed} /timeest_tb/TE_u/ComputeMetric1_u/XrDelay(1) {-height 15 -radix sfixed} /timeest_tb/TE_u/ComputeMetric1_u/XrDelay(0) {-height 15 -radix sfixed}} /timeest_tb/TE_u/ComputeMetric1_u/XrDelay
add wave -noupdate -radix sfixed -childformat {{/timeest_tb/TE_u/ComputeMetric1_u/Xi(0) -radix sfixed} {/timeest_tb/TE_u/ComputeMetric1_u/Xi(-1) -radix sfixed} {/timeest_tb/TE_u/ComputeMetric1_u/Xi(-2) -radix sfixed} {/timeest_tb/TE_u/ComputeMetric1_u/Xi(-3) -radix sfixed} {/timeest_tb/TE_u/ComputeMetric1_u/Xi(-4) -radix sfixed} {/timeest_tb/TE_u/ComputeMetric1_u/Xi(-5) -radix sfixed} {/timeest_tb/TE_u/ComputeMetric1_u/Xi(-6) -radix sfixed} {/timeest_tb/TE_u/ComputeMetric1_u/Xi(-7) -radix sfixed} {/timeest_tb/TE_u/ComputeMetric1_u/Xi(-8) -radix sfixed} {/timeest_tb/TE_u/ComputeMetric1_u/Xi(-9) -radix sfixed} {/timeest_tb/TE_u/ComputeMetric1_u/Xi(-10) -radix sfixed} {/timeest_tb/TE_u/ComputeMetric1_u/Xi(-11) -radix sfixed} {/timeest_tb/TE_u/ComputeMetric1_u/Xi(-12) -radix sfixed} {/timeest_tb/TE_u/ComputeMetric1_u/Xi(-13) -radix sfixed} {/timeest_tb/TE_u/ComputeMetric1_u/Xi(-14) -radix sfixed} {/timeest_tb/TE_u/ComputeMetric1_u/Xi(-15) -radix sfixed} {/timeest_tb/TE_u/ComputeMetric1_u/Xi(-16) -radix sfixed} {/timeest_tb/TE_u/ComputeMetric1_u/Xi(-17) -radix sfixed} {/timeest_tb/TE_u/ComputeMetric1_u/Xi(-18) -radix sfixed} {/timeest_tb/TE_u/ComputeMetric1_u/Xi(-19) -radix sfixed} {/timeest_tb/TE_u/ComputeMetric1_u/Xi(-20) -radix sfixed} {/timeest_tb/TE_u/ComputeMetric1_u/Xi(-21) -radix sfixed} {/timeest_tb/TE_u/ComputeMetric1_u/Xi(-22) -radix sfixed} {/timeest_tb/TE_u/ComputeMetric1_u/Xi(-23) -radix sfixed} {/timeest_tb/TE_u/ComputeMetric1_u/Xi(-24) -radix sfixed}} -subitemconfig {/timeest_tb/TE_u/ComputeMetric1_u/Xi(0) {-height 15 -radix sfixed} /timeest_tb/TE_u/ComputeMetric1_u/Xi(-1) {-height 15 -radix sfixed} /timeest_tb/TE_u/ComputeMetric1_u/Xi(-2) {-height 15 -radix sfixed} /timeest_tb/TE_u/ComputeMetric1_u/Xi(-3) {-height 15 -radix sfixed} /timeest_tb/TE_u/ComputeMetric1_u/Xi(-4) {-height 15 -radix sfixed} /timeest_tb/TE_u/ComputeMetric1_u/Xi(-5) {-height 15 -radix sfixed} /timeest_tb/TE_u/ComputeMetric1_u/Xi(-6) {-height 15 -radix sfixed} /timeest_tb/TE_u/ComputeMetric1_u/Xi(-7) {-height 15 -radix sfixed} /timeest_tb/TE_u/ComputeMetric1_u/Xi(-8) {-height 15 -radix sfixed} /timeest_tb/TE_u/ComputeMetric1_u/Xi(-9) {-height 15 -radix sfixed} /timeest_tb/TE_u/ComputeMetric1_u/Xi(-10) {-height 15 -radix sfixed} /timeest_tb/TE_u/ComputeMetric1_u/Xi(-11) {-height 15 -radix sfixed} /timeest_tb/TE_u/ComputeMetric1_u/Xi(-12) {-height 15 -radix sfixed} /timeest_tb/TE_u/ComputeMetric1_u/Xi(-13) {-height 15 -radix sfixed} /timeest_tb/TE_u/ComputeMetric1_u/Xi(-14) {-height 15 -radix sfixed} /timeest_tb/TE_u/ComputeMetric1_u/Xi(-15) {-height 15 -radix sfixed} /timeest_tb/TE_u/ComputeMetric1_u/Xi(-16) {-height 15 -radix sfixed} /timeest_tb/TE_u/ComputeMetric1_u/Xi(-17) {-height 15 -radix sfixed} /timeest_tb/TE_u/ComputeMetric1_u/Xi(-18) {-height 15 -radix sfixed} /timeest_tb/TE_u/ComputeMetric1_u/Xi(-19) {-height 15 -radix sfixed} /timeest_tb/TE_u/ComputeMetric1_u/Xi(-20) {-height 15 -radix sfixed} /timeest_tb/TE_u/ComputeMetric1_u/Xi(-21) {-height 15 -radix sfixed} /timeest_tb/TE_u/ComputeMetric1_u/Xi(-22) {-height 15 -radix sfixed} /timeest_tb/TE_u/ComputeMetric1_u/Xi(-23) {-height 15 -radix sfixed} /timeest_tb/TE_u/ComputeMetric1_u/Xi(-24) {-height 15 -radix sfixed}} /timeest_tb/TE_u/ComputeMetric1_u/Xi
add wave -noupdate -radix sfixed -childformat {{/timeest_tb/TE_u/ComputeMetric1_u/XiDelay(7) -radix sfixed} {/timeest_tb/TE_u/ComputeMetric1_u/XiDelay(6) -radix sfixed} {/timeest_tb/TE_u/ComputeMetric1_u/XiDelay(5) -radix sfixed} {/timeest_tb/TE_u/ComputeMetric1_u/XiDelay(4) -radix sfixed} {/timeest_tb/TE_u/ComputeMetric1_u/XiDelay(3) -radix sfixed} {/timeest_tb/TE_u/ComputeMetric1_u/XiDelay(2) -radix sfixed} {/timeest_tb/TE_u/ComputeMetric1_u/XiDelay(1) -radix sfixed} {/timeest_tb/TE_u/ComputeMetric1_u/XiDelay(0) -radix sfixed}} -subitemconfig {/timeest_tb/TE_u/ComputeMetric1_u/XiDelay(7) {-height 15 -radix sfixed} /timeest_tb/TE_u/ComputeMetric1_u/XiDelay(6) {-height 15 -radix sfixed} /timeest_tb/TE_u/ComputeMetric1_u/XiDelay(5) {-height 15 -radix sfixed} /timeest_tb/TE_u/ComputeMetric1_u/XiDelay(4) {-height 15 -radix sfixed} /timeest_tb/TE_u/ComputeMetric1_u/XiDelay(3) {-height 15 -radix sfixed} /timeest_tb/TE_u/ComputeMetric1_u/XiDelay(2) {-height 15 -radix sfixed} /timeest_tb/TE_u/ComputeMetric1_u/XiDelay(1) {-height 15 -radix sfixed} /timeest_tb/TE_u/ComputeMetric1_u/XiDelay(0) {-height 15 -radix sfixed}} /timeest_tb/TE_u/ComputeMetric1_u/XiDelay
add wave -noupdate /timeest_tb/TE_u/ComputeMetric1_u/PilotCount
add wave -noupdate /timeest_tb/TE_u/ComputeMetric1_u/reset
add wave -noupdate -radix sfixed /timeest_tb/TE_u/ComputeMetric1_u/Result
add wave -noupdate /timeest_tb/TE_u/ComputeMetric1_u/StartIn
add wave -noupdate -radix sfixed /timeest_tb/TE_u/ComputeMetric1_u/Ss0R23
add wave -noupdate -radix sfixed /timeest_tb/TE_u/ComputeMetric1_u/Ss0I23
add wave -noupdate -radix sfixed /timeest_tb/TE_u/ComputeMetric1_u/Ss1R23
add wave -noupdate -radix sfixed /timeest_tb/TE_u/ComputeMetric1_u/Ss1I23
add wave -noupdate -radix sfixed /timeest_tb/TE_u/ComputeMetric1_u/NormRSs0I0
add wave -noupdate -radix sfixed /timeest_tb/TE_u/ComputeMetric1_u/NormRSs0R0
add wave -noupdate -radix sfixed /timeest_tb/TE_u/ComputeMetric1_u/NormRSs1I1
add wave -noupdate -radix sfixed /timeest_tb/TE_u/ComputeMetric1_u/NormRSs1R1
add wave -noupdate -radix sfixed /timeest_tb/TE_u/ComputeMetric1_u/NormISs0I0
add wave -noupdate -radix sfixed /timeest_tb/TE_u/ComputeMetric1_u/NormISs0R0
add wave -noupdate -radix sfixed /timeest_tb/TE_u/ComputeMetric1_u/NormISs1I1
add wave -noupdate -radix sfixed /timeest_tb/TE_u/ComputeMetric1_u/NormISs1R1
add wave -noupdate -radix sfixed /timeest_tb/TE_u/ComputeMetric1_u/NormLongR
add wave -noupdate -radix sfixed /timeest_tb/TE_u/ComputeMetric1_u/NormLongI
add wave -noupdate -radix sfixed /timeest_tb/TE_u/ComputeMetric1_u/XrNorm
add wave -noupdate -radix sfixed /timeest_tb/TE_u/ComputeMetric1_u/XiNorm
add wave -noupdate -radix sfixed /timeest_tb/TE_u/ComputeMetric1_u/XiNormSq
add wave -noupdate -radix sfixed /timeest_tb/TE_u/ComputeMetric1_u/XrNormSq
add wave -noupdate -radix sfixed /timeest_tb/TE_u/ComputeMetric1_u/NormOut
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {5281333 ps} 0}
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
WaveRestoreZoom {5273847 ps} {5286153 ps}
bookmark add wave bookmark3 {{3023030 ps} {3054970 ps}} 0
bookmark add wave bookmark4 {{2508730 ps} {2540670 ps}} 0
