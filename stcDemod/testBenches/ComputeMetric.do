onerror {resume}
radix define FLoat16 -fixed -fraction 27 -signed -base signed -precision 6
radix define s17 -fixed -fraction 17 -signed -base signed -precision 6
radix define s24 -fixed -fraction 24 -signed -base signed -precision 6
quietly WaveActivateNextPane {} 0
add wave -noupdate /computemetric_tb/Count
add wave -noupdate /computemetric_tb/Done
add wave -noupdate /computemetric_tb/Dones
add wave -noupdate /computemetric_tb/ErrorCount
add wave -noupdate -radix sfixed -childformat {{/computemetric_tb/Result(8) -radix sfixed} {/computemetric_tb/Result(7) -radix sfixed} {/computemetric_tb/Result(6) -radix sfixed} {/computemetric_tb/Result(5) -radix sfixed} {/computemetric_tb/Result(4) -radix sfixed} {/computemetric_tb/Result(3) -radix sfixed} {/computemetric_tb/Result(2) -radix sfixed} {/computemetric_tb/Result(1) -radix sfixed} {/computemetric_tb/Result(0) -radix sfixed} {/computemetric_tb/Result(-1) -radix sfixed} {/computemetric_tb/Result(-2) -radix sfixed} {/computemetric_tb/Result(-3) -radix sfixed} {/computemetric_tb/Result(-4) -radix sfixed} {/computemetric_tb/Result(-5) -radix sfixed} {/computemetric_tb/Result(-6) -radix sfixed} {/computemetric_tb/Result(-7) -radix sfixed} {/computemetric_tb/Result(-8) -radix sfixed} {/computemetric_tb/Result(-9) -radix sfixed} {/computemetric_tb/Result(-10) -radix sfixed} {/computemetric_tb/Result(-11) -radix sfixed} {/computemetric_tb/Result(-12) -radix sfixed} {/computemetric_tb/Result(-13) -radix sfixed} {/computemetric_tb/Result(-14) -radix sfixed} {/computemetric_tb/Result(-15) -radix sfixed} {/computemetric_tb/Result(-16) -radix sfixed}} -subitemconfig {/computemetric_tb/Result(8) {-height 15 -radix sfixed} /computemetric_tb/Result(7) {-height 15 -radix sfixed} /computemetric_tb/Result(6) {-height 15 -radix sfixed} /computemetric_tb/Result(5) {-height 15 -radix sfixed} /computemetric_tb/Result(4) {-height 15 -radix sfixed} /computemetric_tb/Result(3) {-height 15 -radix sfixed} /computemetric_tb/Result(2) {-height 15 -radix sfixed} /computemetric_tb/Result(1) {-height 15 -radix sfixed} /computemetric_tb/Result(0) {-height 15 -radix sfixed} /computemetric_tb/Result(-1) {-height 15 -radix sfixed} /computemetric_tb/Result(-2) {-height 15 -radix sfixed} /computemetric_tb/Result(-3) {-height 15 -radix sfixed} /computemetric_tb/Result(-4) {-height 15 -radix sfixed} /computemetric_tb/Result(-5) {-height 15 -radix sfixed} /computemetric_tb/Result(-6) {-height 15 -radix sfixed} /computemetric_tb/Result(-7) {-height 15 -radix sfixed} /computemetric_tb/Result(-8) {-height 15 -radix sfixed} /computemetric_tb/Result(-9) {-height 15 -radix sfixed} /computemetric_tb/Result(-10) {-height 15 -radix sfixed} /computemetric_tb/Result(-11) {-height 15 -radix sfixed} /computemetric_tb/Result(-12) {-height 15 -radix sfixed} /computemetric_tb/Result(-13) {-height 15 -radix sfixed} /computemetric_tb/Result(-14) {-height 15 -radix sfixed} /computemetric_tb/Result(-15) {-height 15 -radix sfixed} /computemetric_tb/Result(-16) {-height 15 -radix sfixed}} /computemetric_tb/Result
add wave -noupdate /computemetric_tb/StartIn
add wave -noupdate /computemetric_tb/Xi
add wave -noupdate /computemetric_tb/Xr
add wave -noupdate /computemetric_tb/ce
add wave -noupdate /computemetric_tb/clk
add wave -noupdate /computemetric_tb/reset
add wave -noupdate -radix unsigned /computemetric_tb/xx
add wave -noupdate -radix unsigned /computemetric_tb/yy
add wave -noupdate /computemetric_tb/CM_u/DELAY
add wave -noupdate /computemetric_tb/CM_u/DELAY23
add wave -noupdate /computemetric_tb/CM_u/Done
add wave -noupdate /computemetric_tb/CM_u/IndexX
add wave -noupdate /computemetric_tb/CM_u/IndexY
add wave -noupdate /computemetric_tb/CM_u/Mode
add wave -noupdate /computemetric_tb/CM_u/StartIn
add wave -noupdate /computemetric_tb/CM_u/PilotCount
add wave -noupdate -radix sfixed /computemetric_tb/CM_u/Ss0R
add wave -noupdate -radix sfixed /computemetric_tb/CM_u/Ss0I
add wave -noupdate -radix sfixed /computemetric_tb/CM_u/Ss1R
add wave -noupdate -radix sfixed /computemetric_tb/CM_u/Ss1I
add wave -noupdate -radix sfixed /computemetric_tb/CM_u/SsInvI0
add wave -noupdate -radix sfixed /computemetric_tb/CM_u/SsInvI1
add wave -noupdate -radix sfixed /computemetric_tb/CM_u/SsInvI2
add wave -noupdate -radix sfixed /computemetric_tb/CM_u/SsInvI3
add wave -noupdate -radix sfixed /computemetric_tb/CM_u/SsInvR0
add wave -noupdate -radix sfixed /computemetric_tb/CM_u/SsInvR1
add wave -noupdate -radix sfixed /computemetric_tb/CM_u/SsInvR2
add wave -noupdate -radix sfixed /computemetric_tb/CM_u/SsInvR3
add wave -noupdate -radix sfixed /computemetric_tb/CM_u/SpinvR0
add wave -noupdate -radix sfixed /computemetric_tb/CM_u/SpinvI0
add wave -noupdate -radix sfixed /computemetric_tb/CM_u/SpinvR1
add wave -noupdate -radix sfixed /computemetric_tb/CM_u/SpinvI1
add wave -noupdate /computemetric_tb/CM_u/XrSpinvR0
add wave -noupdate /computemetric_tb/CM_u/XrSpinvI0
add wave -noupdate /computemetric_tb/CM_u/XiSpinvR0
add wave -noupdate /computemetric_tb/CM_u/XiSpinvI0
add wave -noupdate /computemetric_tb/CM_u/XrSpinvR1
add wave -noupdate /computemetric_tb/CM_u/XrSpinvI1
add wave -noupdate /computemetric_tb/CM_u/XiSpinvR1
add wave -noupdate /computemetric_tb/CM_u/XiSpinvI1
add wave -noupdate -radix sfixed -childformat {{/computemetric_tb/CM_u/NormTempR0(4) -radix sfixed} {/computemetric_tb/CM_u/NormTempR0(3) -radix sfixed} {/computemetric_tb/CM_u/NormTempR0(2) -radix sfixed} {/computemetric_tb/CM_u/NormTempR0(1) -radix sfixed} {/computemetric_tb/CM_u/NormTempR0(0) -radix sfixed} {/computemetric_tb/CM_u/NormTempR0(-1) -radix sfixed} {/computemetric_tb/CM_u/NormTempR0(-2) -radix sfixed} {/computemetric_tb/CM_u/NormTempR0(-3) -radix sfixed} {/computemetric_tb/CM_u/NormTempR0(-4) -radix sfixed} {/computemetric_tb/CM_u/NormTempR0(-5) -radix sfixed} {/computemetric_tb/CM_u/NormTempR0(-6) -radix sfixed} {/computemetric_tb/CM_u/NormTempR0(-7) -radix sfixed} {/computemetric_tb/CM_u/NormTempR0(-8) -radix sfixed} {/computemetric_tb/CM_u/NormTempR0(-9) -radix sfixed} {/computemetric_tb/CM_u/NormTempR0(-10) -radix sfixed} {/computemetric_tb/CM_u/NormTempR0(-11) -radix sfixed} {/computemetric_tb/CM_u/NormTempR0(-12) -radix sfixed} {/computemetric_tb/CM_u/NormTempR0(-13) -radix sfixed} {/computemetric_tb/CM_u/NormTempR0(-14) -radix sfixed} {/computemetric_tb/CM_u/NormTempR0(-15) -radix sfixed} {/computemetric_tb/CM_u/NormTempR0(-16) -radix sfixed} {/computemetric_tb/CM_u/NormTempR0(-17) -radix sfixed} {/computemetric_tb/CM_u/NormTempR0(-18) -radix sfixed} {/computemetric_tb/CM_u/NormTempR0(-19) -radix sfixed} {/computemetric_tb/CM_u/NormTempR0(-20) -radix sfixed}} -subitemconfig {/computemetric_tb/CM_u/NormTempR0(4) {-height 15 -radix sfixed} /computemetric_tb/CM_u/NormTempR0(3) {-height 15 -radix sfixed} /computemetric_tb/CM_u/NormTempR0(2) {-height 15 -radix sfixed} /computemetric_tb/CM_u/NormTempR0(1) {-height 15 -radix sfixed} /computemetric_tb/CM_u/NormTempR0(0) {-height 15 -radix sfixed} /computemetric_tb/CM_u/NormTempR0(-1) {-height 15 -radix sfixed} /computemetric_tb/CM_u/NormTempR0(-2) {-height 15 -radix sfixed} /computemetric_tb/CM_u/NormTempR0(-3) {-height 15 -radix sfixed} /computemetric_tb/CM_u/NormTempR0(-4) {-height 15 -radix sfixed} /computemetric_tb/CM_u/NormTempR0(-5) {-height 15 -radix sfixed} /computemetric_tb/CM_u/NormTempR0(-6) {-height 15 -radix sfixed} /computemetric_tb/CM_u/NormTempR0(-7) {-height 15 -radix sfixed} /computemetric_tb/CM_u/NormTempR0(-8) {-height 15 -radix sfixed} /computemetric_tb/CM_u/NormTempR0(-9) {-height 15 -radix sfixed} /computemetric_tb/CM_u/NormTempR0(-10) {-height 15 -radix sfixed} /computemetric_tb/CM_u/NormTempR0(-11) {-height 15 -radix sfixed} /computemetric_tb/CM_u/NormTempR0(-12) {-height 15 -radix sfixed} /computemetric_tb/CM_u/NormTempR0(-13) {-height 15 -radix sfixed} /computemetric_tb/CM_u/NormTempR0(-14) {-height 15 -radix sfixed} /computemetric_tb/CM_u/NormTempR0(-15) {-height 15 -radix sfixed} /computemetric_tb/CM_u/NormTempR0(-16) {-height 15 -radix sfixed} /computemetric_tb/CM_u/NormTempR0(-17) {-height 15 -radix sfixed} /computemetric_tb/CM_u/NormTempR0(-18) {-height 15 -radix sfixed} /computemetric_tb/CM_u/NormTempR0(-19) {-height 15 -radix sfixed} /computemetric_tb/CM_u/NormTempR0(-20) {-height 15 -radix sfixed}} /computemetric_tb/CM_u/NormTempR0
add wave -noupdate -radix sfixed /computemetric_tb/CM_u/NormTempI0
add wave -noupdate -radix sfixed /computemetric_tb/CM_u/NormTempR1
add wave -noupdate -radix sfixed /computemetric_tb/CM_u/NormTempI1
add wave -noupdate -radix sfixed /computemetric_tb/CM_u/Ss0R23
add wave -noupdate -radix sfixed /computemetric_tb/CM_u/Ss0I23
add wave -noupdate -radix sfixed /computemetric_tb/CM_u/Ss1R23
add wave -noupdate -radix sfixed /computemetric_tb/CM_u/Ss1I23
add wave -noupdate -clampanalog 1 -radix sfixed /computemetric_tb/CM_u/NormISs0R0
add wave -noupdate -clampanalog 1 -radix sfixed /computemetric_tb/CM_u/NormISs0I0
add wave -noupdate -clampanalog 1 -radix sfixed /computemetric_tb/CM_u/NormISs1R1
add wave -noupdate -clampanalog 1 -radix sfixed /computemetric_tb/CM_u/NormISs1I1
add wave -noupdate -clampanalog 1 -radix sfixed /computemetric_tb/CM_u/NormRSs0I0
add wave -noupdate -clampanalog 1 -radix sfixed /computemetric_tb/CM_u/NormRSs0R0
add wave -noupdate -clampanalog 1 -radix sfixed /computemetric_tb/CM_u/NormRSs1I1
add wave -noupdate -clampanalog 1 -radix sfixed /computemetric_tb/CM_u/NormRSs1R1
add wave -noupdate -clampanalog 1 -radix sfixed /computemetric_tb/CM_u/NormLongR
add wave -noupdate -clampanalog 1 -radix sfixed /computemetric_tb/CM_u/NormLongI
add wave -noupdate -clampanalog 1 -radix sfixed /computemetric_tb/CM_u/XrNorm
add wave -noupdate -clampanalog 1 -radix sfixed /computemetric_tb/CM_u/XiNorm
add wave -noupdate -radix sfixed /computemetric_tb/CM_u/XiNormSq
add wave -noupdate -radix sfixed /computemetric_tb/CM_u/XrNormSq
add wave -noupdate -radix sfixed -childformat {{/computemetric_tb/CM_u/NormOut(8) -radix sfixed} {/computemetric_tb/CM_u/NormOut(7) -radix sfixed} {/computemetric_tb/CM_u/NormOut(6) -radix sfixed} {/computemetric_tb/CM_u/NormOut(5) -radix sfixed} {/computemetric_tb/CM_u/NormOut(4) -radix sfixed} {/computemetric_tb/CM_u/NormOut(3) -radix sfixed} {/computemetric_tb/CM_u/NormOut(2) -radix sfixed} {/computemetric_tb/CM_u/NormOut(1) -radix sfixed} {/computemetric_tb/CM_u/NormOut(0) -radix sfixed} {/computemetric_tb/CM_u/NormOut(-1) -radix sfixed} {/computemetric_tb/CM_u/NormOut(-2) -radix sfixed} {/computemetric_tb/CM_u/NormOut(-3) -radix sfixed} {/computemetric_tb/CM_u/NormOut(-4) -radix sfixed} {/computemetric_tb/CM_u/NormOut(-5) -radix sfixed} {/computemetric_tb/CM_u/NormOut(-6) -radix sfixed} {/computemetric_tb/CM_u/NormOut(-7) -radix sfixed} {/computemetric_tb/CM_u/NormOut(-8) -radix sfixed} {/computemetric_tb/CM_u/NormOut(-9) -radix sfixed} {/computemetric_tb/CM_u/NormOut(-10) -radix sfixed} {/computemetric_tb/CM_u/NormOut(-11) -radix sfixed} {/computemetric_tb/CM_u/NormOut(-12) -radix sfixed} {/computemetric_tb/CM_u/NormOut(-13) -radix sfixed} {/computemetric_tb/CM_u/NormOut(-14) -radix sfixed} {/computemetric_tb/CM_u/NormOut(-15) -radix sfixed} {/computemetric_tb/CM_u/NormOut(-16) -radix sfixed}} -subitemconfig {/computemetric_tb/CM_u/NormOut(8) {-height 15 -radix sfixed} /computemetric_tb/CM_u/NormOut(7) {-height 15 -radix sfixed} /computemetric_tb/CM_u/NormOut(6) {-height 15 -radix sfixed} /computemetric_tb/CM_u/NormOut(5) {-height 15 -radix sfixed} /computemetric_tb/CM_u/NormOut(4) {-height 15 -radix sfixed} /computemetric_tb/CM_u/NormOut(3) {-height 15 -radix sfixed} /computemetric_tb/CM_u/NormOut(2) {-height 15 -radix sfixed} /computemetric_tb/CM_u/NormOut(1) {-height 15 -radix sfixed} /computemetric_tb/CM_u/NormOut(0) {-height 15 -radix sfixed} /computemetric_tb/CM_u/NormOut(-1) {-height 15 -radix sfixed} /computemetric_tb/CM_u/NormOut(-2) {-height 15 -radix sfixed} /computemetric_tb/CM_u/NormOut(-3) {-height 15 -radix sfixed} /computemetric_tb/CM_u/NormOut(-4) {-height 15 -radix sfixed} /computemetric_tb/CM_u/NormOut(-5) {-height 15 -radix sfixed} /computemetric_tb/CM_u/NormOut(-6) {-height 15 -radix sfixed} /computemetric_tb/CM_u/NormOut(-7) {-height 15 -radix sfixed} /computemetric_tb/CM_u/NormOut(-8) {-height 15 -radix sfixed} /computemetric_tb/CM_u/NormOut(-9) {-height 15 -radix sfixed} /computemetric_tb/CM_u/NormOut(-10) {-height 15 -radix sfixed} /computemetric_tb/CM_u/NormOut(-11) {-height 15 -radix sfixed} /computemetric_tb/CM_u/NormOut(-12) {-height 15 -radix sfixed} /computemetric_tb/CM_u/NormOut(-13) {-height 15 -radix sfixed} /computemetric_tb/CM_u/NormOut(-14) {-height 15 -radix sfixed} /computemetric_tb/CM_u/NormOut(-15) {-height 15 -radix sfixed} /computemetric_tb/CM_u/NormOut(-16) {-height 15 -radix sfixed}} /computemetric_tb/CM_u/NormOut
add wave -noupdate -radix sfixed -childformat {{/computemetric_tb/CM_u/Result(8) -radix sfixed} {/computemetric_tb/CM_u/Result(7) -radix sfixed} {/computemetric_tb/CM_u/Result(6) -radix sfixed} {/computemetric_tb/CM_u/Result(5) -radix sfixed} {/computemetric_tb/CM_u/Result(4) -radix sfixed} {/computemetric_tb/CM_u/Result(3) -radix sfixed} {/computemetric_tb/CM_u/Result(2) -radix sfixed} {/computemetric_tb/CM_u/Result(1) -radix sfixed} {/computemetric_tb/CM_u/Result(0) -radix sfixed} {/computemetric_tb/CM_u/Result(-1) -radix sfixed} {/computemetric_tb/CM_u/Result(-2) -radix sfixed} {/computemetric_tb/CM_u/Result(-3) -radix sfixed} {/computemetric_tb/CM_u/Result(-4) -radix sfixed} {/computemetric_tb/CM_u/Result(-5) -radix sfixed} {/computemetric_tb/CM_u/Result(-6) -radix sfixed} {/computemetric_tb/CM_u/Result(-7) -radix sfixed} {/computemetric_tb/CM_u/Result(-8) -radix sfixed} {/computemetric_tb/CM_u/Result(-9) -radix sfixed} {/computemetric_tb/CM_u/Result(-10) -radix sfixed} {/computemetric_tb/CM_u/Result(-11) -radix sfixed} {/computemetric_tb/CM_u/Result(-12) -radix sfixed} {/computemetric_tb/CM_u/Result(-13) -radix sfixed} {/computemetric_tb/CM_u/Result(-14) -radix sfixed} {/computemetric_tb/CM_u/Result(-15) -radix sfixed} {/computemetric_tb/CM_u/Result(-16) -radix sfixed}} -subitemconfig {/computemetric_tb/CM_u/Result(8) {-height 15 -radix sfixed} /computemetric_tb/CM_u/Result(7) {-height 15 -radix sfixed} /computemetric_tb/CM_u/Result(6) {-height 15 -radix sfixed} /computemetric_tb/CM_u/Result(5) {-height 15 -radix sfixed} /computemetric_tb/CM_u/Result(4) {-height 15 -radix sfixed} /computemetric_tb/CM_u/Result(3) {-height 15 -radix sfixed} /computemetric_tb/CM_u/Result(2) {-height 15 -radix sfixed} /computemetric_tb/CM_u/Result(1) {-height 15 -radix sfixed} /computemetric_tb/CM_u/Result(0) {-height 15 -radix sfixed} /computemetric_tb/CM_u/Result(-1) {-height 15 -radix sfixed} /computemetric_tb/CM_u/Result(-2) {-height 15 -radix sfixed} /computemetric_tb/CM_u/Result(-3) {-height 15 -radix sfixed} /computemetric_tb/CM_u/Result(-4) {-height 15 -radix sfixed} /computemetric_tb/CM_u/Result(-5) {-height 15 -radix sfixed} /computemetric_tb/CM_u/Result(-6) {-height 15 -radix sfixed} /computemetric_tb/CM_u/Result(-7) {-height 15 -radix sfixed} /computemetric_tb/CM_u/Result(-8) {-height 15 -radix sfixed} /computemetric_tb/CM_u/Result(-9) {-height 15 -radix sfixed} /computemetric_tb/CM_u/Result(-10) {-height 15 -radix sfixed} /computemetric_tb/CM_u/Result(-11) {-height 15 -radix sfixed} /computemetric_tb/CM_u/Result(-12) {-height 15 -radix sfixed} /computemetric_tb/CM_u/Result(-13) {-height 15 -radix sfixed} /computemetric_tb/CM_u/Result(-14) {-height 15 -radix sfixed} /computemetric_tb/CM_u/Result(-15) {-height 15 -radix sfixed} /computemetric_tb/CM_u/Result(-16) {-height 15 -radix sfixed}} /computemetric_tb/CM_u/Result
add wave -noupdate -radix sfixed -childformat {{/computemetric_tb/CM_u/XrDelay(6) -radix sfixed} {/computemetric_tb/CM_u/XrDelay(5) -radix sfixed} {/computemetric_tb/CM_u/XrDelay(4) -radix sfixed} {/computemetric_tb/CM_u/XrDelay(3) -radix sfixed} {/computemetric_tb/CM_u/XrDelay(2) -radix sfixed} {/computemetric_tb/CM_u/XrDelay(1) -radix sfixed} {/computemetric_tb/CM_u/XrDelay(0) -radix sfixed}} -expand -subitemconfig {/computemetric_tb/CM_u/XrDelay(6) {-height 15 -radix sfixed} /computemetric_tb/CM_u/XrDelay(5) {-height 15 -radix sfixed} /computemetric_tb/CM_u/XrDelay(4) {-height 15 -radix sfixed} /computemetric_tb/CM_u/XrDelay(3) {-height 15 -radix sfixed} /computemetric_tb/CM_u/XrDelay(2) {-height 15 -radix sfixed} /computemetric_tb/CM_u/XrDelay(1) {-height 15 -radix sfixed} /computemetric_tb/CM_u/XrDelay(0) {-height 15 -radix sfixed}} /computemetric_tb/CM_u/XrDelay
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {256882 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 248
configure wave -valuecolwidth 105
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
WaveRestoreZoom {254976 ps} {273024 ps}
bookmark add wave bookmark0 {{3023030 ps} {3054970 ps}} 0
bookmark add wave bookmark1 {{2508730 ps} {2540670 ps}} 0
