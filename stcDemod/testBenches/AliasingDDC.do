onerror {resume}
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
radix define s17 -fixed -fraction 16 -signed -base signed -precision 6
radix define s18_17 -fixed -fraction 17 -signed -base signed -precision 6
quietly WaveActivateNextPane {} 0
add wave -noupdate /aliasingddc_tb/reset
add wave -noupdate /aliasingddc_tb/clk
add wave -noupdate /aliasingddc_tb/ce
add wave -noupdate /aliasingddc_tb/DataValid
add wave -noupdate /aliasingddc_tb/DataValid_o
add wave -noupdate /aliasingddc_tb/Done
add wave -noupdate /aliasingddc_tb/Errors
add wave -noupdate /aliasingddc_tb/ErrorCount
add wave -noupdate /aliasingddc_tb/VarsComp0
add wave -noupdate /aliasingddc_tb/VarsComp1
add wave -noupdate /aliasingddc_tb/VarsRead
add wave -noupdate /aliasingddc_tb/DELAY
add wave -noupdate /aliasingddc_tb/Aliasing_DDCu/IN_WIDTH
add wave -noupdate /aliasingddc_tb/Aliasing_DDCu/IN_BINPT
add wave -noupdate /aliasingddc_tb/Aliasing_DDCu/OUT_WIDTH
add wave -noupdate /aliasingddc_tb/Aliasing_DDCu/OUT_BINPT
add wave -noupdate /aliasingddc_tb/Aliasing_DDCu/clk
add wave -noupdate /aliasingddc_tb/Aliasing_DDCu/ce
add wave -noupdate /aliasingddc_tb/Aliasing_DDCu/reset
add wave -noupdate /aliasingddc_tb/Aliasing_DDCu/ValidIn
add wave -noupdate -format Analog-Step -height 74 -max 131071.00000000001 -min -131064.0 -radix s18_17 /aliasingddc_tb/Aliasing_DDCu/IfIn
add wave -noupdate -format Analog-Step -height 74 -max 131071.00000000001 -min -131064.0 -radix s18_17 /aliasingddc_tb/Aliasing_DDCu/If_fix
add wave -noupdate /aliasingddc_tb/Aliasing_DDCu/ValidOut
add wave -noupdate -format Analog-Step -height 74 -max 131071.00000000001 -min -131064.0 -radix s18_17 /aliasingddc_tb/Aliasing_DDCu/Delay0
add wave -noupdate -format Analog-Step -height 74 -max 131064.00000000001 -min -131071.0 -radix s18_17 /aliasingddc_tb/Aliasing_DDCu/DataImag
add wave -noupdate -format Analog-Step -height 74 -max 131064.00000000001 -min -131071.0 -radix s18_17 /aliasingddc_tb/Aliasing_DDCu/DataReal
add wave -noupdate -format Analog-Step -height 74 -max 131064.00000000001 -min -131071.0 -radix s18_17 /aliasingddc_tb/Aliasing_DDCu/NegDelay0
add wave -noupdate -format Analog-Step -height 74 -max 131060.99999999997 -min -131062.0 -radix s18_17 /aliasingddc_tb/Aliasing_DDCu/Delay3
add wave -noupdate -format Analog-Step -height 74 -max 65512.999999999993 -min -65542.0 -radix s18_17 /aliasingddc_tb/Aliasing_DDCu/Delay4
add wave -noupdate /aliasingddc_tb/Aliasing_DDCu/PassThru
add wave -noupdate -format Analog-Step -height 74 -max 3.0 -radix unsigned /aliasingddc_tb/Aliasing_DDCu/Counter
add wave -noupdate /aliasingddc_tb/Aliasing_DDCu/MainValid
add wave -noupdate /aliasingddc_tb/Aliasing_DDCu/Delay1
add wave -noupdate /aliasingddc_tb/Aliasing_DDCu/PASS_THRU_LENGTH
add wave -noupdate -format Analog-Step -height 74 -max 131064.00000000001 -min -131071.0 -radix s18_17 /aliasingddc_tb/Aliasing_DDCu/DataReal
add wave -noupdate -format Analog-Step -height 74 -max 131060.99999999997 -min -131062.0 -radix s18_17 /aliasingddc_tb/Aliasing_DDCu/Re
add wave -noupdate -format Analog-Step -height 74 -max 131071.0 -min -131071.0 -radix s18_17 /aliasingddc_tb/RealComp
add wave -noupdate -format Analog-Step -height 74 -max 131071.00000000001 -min -131072.0 -radix s18_17 /aliasingddc_tb/CompareReal/RefValue(0)
add wave -noupdate -format Analog-Step -height 74 -max 261723.00000000006 -min -261558.0 -radix s18_17 /aliasingddc_tb/CompareReal/Errors(0)
add wave -noupdate -divider -height 50 Imaginary
add wave -noupdate -format Analog-Step -height 74 -max 131071.00000000001 -min -131072.0 -radix s18_17 /aliasingddc_tb/ImagComp
add wave -noupdate -format Analog-Step -height 74 -max 131071.00000000001 -min -131047.0 -radix s18_17 /aliasingddc_tb/CompareImag/RefValue(0)
add wave -noupdate -format Analog-Step -height 74 -max 156806.0 -min -156688.0 -radix s18_17 /aliasingddc_tb/CompareImag/Errors(0)
add wave -noupdate /aliasingddc_tb/Aliasing_DDCu/filter_u/ValidIn
add wave -noupdate -radix s18_17 /aliasingddc_tb/Aliasing_DDCu/filter_u/DataIn
add wave -noupdate -radix sfixed /aliasingddc_tb/Aliasing_DDCu/filter_u/DataOut
add wave -noupdate -radix sfixed -childformat {{/aliasingddc_tb/Aliasing_DDCu/filter_u/DataShift(0) -radix sfixed} {/aliasingddc_tb/Aliasing_DDCu/filter_u/DataShift(1) -radix sfixed} {/aliasingddc_tb/Aliasing_DDCu/filter_u/DataShift(2) -radix sfixed} {/aliasingddc_tb/Aliasing_DDCu/filter_u/DataShift(3) -radix sfixed} {/aliasingddc_tb/Aliasing_DDCu/filter_u/DataShift(4) -radix sfixed} {/aliasingddc_tb/Aliasing_DDCu/filter_u/DataShift(5) -radix sfixed} {/aliasingddc_tb/Aliasing_DDCu/filter_u/DataShift(6) -radix sfixed} {/aliasingddc_tb/Aliasing_DDCu/filter_u/DataShift(7) -radix sfixed} {/aliasingddc_tb/Aliasing_DDCu/filter_u/DataShift(8) -radix sfixed} {/aliasingddc_tb/Aliasing_DDCu/filter_u/DataShift(9) -radix sfixed} {/aliasingddc_tb/Aliasing_DDCu/filter_u/DataShift(10) -radix sfixed} {/aliasingddc_tb/Aliasing_DDCu/filter_u/DataShift(11) -radix sfixed} {/aliasingddc_tb/Aliasing_DDCu/filter_u/DataShift(12) -radix sfixed} {/aliasingddc_tb/Aliasing_DDCu/filter_u/DataShift(13) -radix sfixed} {/aliasingddc_tb/Aliasing_DDCu/filter_u/DataShift(14) -radix sfixed} {/aliasingddc_tb/Aliasing_DDCu/filter_u/DataShift(15) -radix sfixed} {/aliasingddc_tb/Aliasing_DDCu/filter_u/DataShift(16) -radix sfixed} {/aliasingddc_tb/Aliasing_DDCu/filter_u/DataShift(17) -radix sfixed} {/aliasingddc_tb/Aliasing_DDCu/filter_u/DataShift(18) -radix sfixed} {/aliasingddc_tb/Aliasing_DDCu/filter_u/DataShift(19) -radix sfixed} {/aliasingddc_tb/Aliasing_DDCu/filter_u/DataShift(20) -radix sfixed} {/aliasingddc_tb/Aliasing_DDCu/filter_u/DataShift(21) -radix sfixed} {/aliasingddc_tb/Aliasing_DDCu/filter_u/DataShift(22) -radix sfixed} {/aliasingddc_tb/Aliasing_DDCu/filter_u/DataShift(23) -radix sfixed}} -subitemconfig {/aliasingddc_tb/Aliasing_DDCu/filter_u/DataShift(0) {-height 15 -radix sfixed} /aliasingddc_tb/Aliasing_DDCu/filter_u/DataShift(1) {-height 15 -radix sfixed} /aliasingddc_tb/Aliasing_DDCu/filter_u/DataShift(2) {-height 15 -radix sfixed} /aliasingddc_tb/Aliasing_DDCu/filter_u/DataShift(3) {-height 15 -radix sfixed} /aliasingddc_tb/Aliasing_DDCu/filter_u/DataShift(4) {-height 15 -radix sfixed} /aliasingddc_tb/Aliasing_DDCu/filter_u/DataShift(5) {-height 15 -radix sfixed} /aliasingddc_tb/Aliasing_DDCu/filter_u/DataShift(6) {-height 15 -radix sfixed} /aliasingddc_tb/Aliasing_DDCu/filter_u/DataShift(7) {-height 15 -radix sfixed} /aliasingddc_tb/Aliasing_DDCu/filter_u/DataShift(8) {-height 15 -radix sfixed} /aliasingddc_tb/Aliasing_DDCu/filter_u/DataShift(9) {-height 15 -radix sfixed} /aliasingddc_tb/Aliasing_DDCu/filter_u/DataShift(10) {-height 15 -radix sfixed} /aliasingddc_tb/Aliasing_DDCu/filter_u/DataShift(11) {-height 15 -radix sfixed} /aliasingddc_tb/Aliasing_DDCu/filter_u/DataShift(12) {-height 15 -radix sfixed} /aliasingddc_tb/Aliasing_DDCu/filter_u/DataShift(13) {-height 15 -radix sfixed} /aliasingddc_tb/Aliasing_DDCu/filter_u/DataShift(14) {-height 15 -radix sfixed} /aliasingddc_tb/Aliasing_DDCu/filter_u/DataShift(15) {-height 15 -radix sfixed} /aliasingddc_tb/Aliasing_DDCu/filter_u/DataShift(16) {-height 15 -radix sfixed} /aliasingddc_tb/Aliasing_DDCu/filter_u/DataShift(17) {-height 15 -radix sfixed} /aliasingddc_tb/Aliasing_DDCu/filter_u/DataShift(18) {-height 15 -radix sfixed} /aliasingddc_tb/Aliasing_DDCu/filter_u/DataShift(19) {-height 15 -radix sfixed} /aliasingddc_tb/Aliasing_DDCu/filter_u/DataShift(20) {-height 15 -radix sfixed} /aliasingddc_tb/Aliasing_DDCu/filter_u/DataShift(21) {-height 15 -radix sfixed} /aliasingddc_tb/Aliasing_DDCu/filter_u/DataShift(22) {-height 15 -radix sfixed} /aliasingddc_tb/Aliasing_DDCu/filter_u/DataShift(23) {-height 15 -radix sfixed}} /aliasingddc_tb/Aliasing_DDCu/filter_u/DataShift
add wave -noupdate /aliasingddc_tb/Aliasing_DDCu/filter_u/Delay1
add wave -noupdate /aliasingddc_tb/Aliasing_DDCu/filter_u/Delay3
add wave -noupdate -radix sfixed /aliasingddc_tb/Aliasing_DDCu/filter_u/Delay0
add wave -noupdate -radix sfixed /aliasingddc_tb/Aliasing_DDCu/filter_u/Mux0
add wave -noupdate -radix sfixed /aliasingddc_tb/Aliasing_DDCu/filter_u/Mux1
add wave -noupdate -radix sfixed /aliasingddc_tb/Aliasing_DDCu/filter_u/Mux2
add wave -noupdate -radix sfixed /aliasingddc_tb/Aliasing_DDCu/filter_u/Mux3
add wave -noupdate -radix sfixed /aliasingddc_tb/Aliasing_DDCu/filter_u/Mux4
add wave -noupdate -radix sfixed /aliasingddc_tb/Aliasing_DDCu/filter_u/Mux5
add wave -noupdate -radix sfixed /aliasingddc_tb/Aliasing_DDCu/filter_u/Mux6
add wave -noupdate -radix sfixed /aliasingddc_tb/Aliasing_DDCu/filter_u/Mux7
add wave -noupdate -radix sfixed -childformat {{/aliasingddc_tb/Aliasing_DDCu/filter_u/Mux8(0) -radix sfixed} {/aliasingddc_tb/Aliasing_DDCu/filter_u/Mux8(-1) -radix sfixed} {/aliasingddc_tb/Aliasing_DDCu/filter_u/Mux8(-2) -radix sfixed} {/aliasingddc_tb/Aliasing_DDCu/filter_u/Mux8(-3) -radix sfixed} {/aliasingddc_tb/Aliasing_DDCu/filter_u/Mux8(-4) -radix sfixed} {/aliasingddc_tb/Aliasing_DDCu/filter_u/Mux8(-5) -radix sfixed} {/aliasingddc_tb/Aliasing_DDCu/filter_u/Mux8(-6) -radix sfixed} {/aliasingddc_tb/Aliasing_DDCu/filter_u/Mux8(-7) -radix sfixed} {/aliasingddc_tb/Aliasing_DDCu/filter_u/Mux8(-8) -radix sfixed} {/aliasingddc_tb/Aliasing_DDCu/filter_u/Mux8(-9) -radix sfixed} {/aliasingddc_tb/Aliasing_DDCu/filter_u/Mux8(-10) -radix sfixed} {/aliasingddc_tb/Aliasing_DDCu/filter_u/Mux8(-11) -radix sfixed} {/aliasingddc_tb/Aliasing_DDCu/filter_u/Mux8(-12) -radix sfixed} {/aliasingddc_tb/Aliasing_DDCu/filter_u/Mux8(-13) -radix sfixed} {/aliasingddc_tb/Aliasing_DDCu/filter_u/Mux8(-14) -radix sfixed} {/aliasingddc_tb/Aliasing_DDCu/filter_u/Mux8(-15) -radix sfixed} {/aliasingddc_tb/Aliasing_DDCu/filter_u/Mux8(-16) -radix sfixed} {/aliasingddc_tb/Aliasing_DDCu/filter_u/Mux8(-17) -radix sfixed}} -subitemconfig {/aliasingddc_tb/Aliasing_DDCu/filter_u/Mux8(0) {-height 15 -radix sfixed} /aliasingddc_tb/Aliasing_DDCu/filter_u/Mux8(-1) {-height 15 -radix sfixed} /aliasingddc_tb/Aliasing_DDCu/filter_u/Mux8(-2) {-height 15 -radix sfixed} /aliasingddc_tb/Aliasing_DDCu/filter_u/Mux8(-3) {-height 15 -radix sfixed} /aliasingddc_tb/Aliasing_DDCu/filter_u/Mux8(-4) {-height 15 -radix sfixed} /aliasingddc_tb/Aliasing_DDCu/filter_u/Mux8(-5) {-height 15 -radix sfixed} /aliasingddc_tb/Aliasing_DDCu/filter_u/Mux8(-6) {-height 15 -radix sfixed} /aliasingddc_tb/Aliasing_DDCu/filter_u/Mux8(-7) {-height 15 -radix sfixed} /aliasingddc_tb/Aliasing_DDCu/filter_u/Mux8(-8) {-height 15 -radix sfixed} /aliasingddc_tb/Aliasing_DDCu/filter_u/Mux8(-9) {-height 15 -radix sfixed} /aliasingddc_tb/Aliasing_DDCu/filter_u/Mux8(-10) {-height 15 -radix sfixed} /aliasingddc_tb/Aliasing_DDCu/filter_u/Mux8(-11) {-height 15 -radix sfixed} /aliasingddc_tb/Aliasing_DDCu/filter_u/Mux8(-12) {-height 15 -radix sfixed} /aliasingddc_tb/Aliasing_DDCu/filter_u/Mux8(-13) {-height 15 -radix sfixed} /aliasingddc_tb/Aliasing_DDCu/filter_u/Mux8(-14) {-height 15 -radix sfixed} /aliasingddc_tb/Aliasing_DDCu/filter_u/Mux8(-15) {-height 15 -radix sfixed} /aliasingddc_tb/Aliasing_DDCu/filter_u/Mux8(-16) {-height 15 -radix sfixed} /aliasingddc_tb/Aliasing_DDCu/filter_u/Mux8(-17) {-height 15 -radix sfixed}} /aliasingddc_tb/Aliasing_DDCu/filter_u/Mux8
add wave -noupdate -radix sfixed -childformat {{/aliasingddc_tb/Aliasing_DDCu/filter_u/Add0(1) -radix sfixed} {/aliasingddc_tb/Aliasing_DDCu/filter_u/Add0(0) -radix sfixed} {/aliasingddc_tb/Aliasing_DDCu/filter_u/Add0(-1) -radix sfixed} {/aliasingddc_tb/Aliasing_DDCu/filter_u/Add0(-2) -radix sfixed} {/aliasingddc_tb/Aliasing_DDCu/filter_u/Add0(-3) -radix sfixed} {/aliasingddc_tb/Aliasing_DDCu/filter_u/Add0(-4) -radix sfixed} {/aliasingddc_tb/Aliasing_DDCu/filter_u/Add0(-5) -radix sfixed} {/aliasingddc_tb/Aliasing_DDCu/filter_u/Add0(-6) -radix sfixed} {/aliasingddc_tb/Aliasing_DDCu/filter_u/Add0(-7) -radix sfixed} {/aliasingddc_tb/Aliasing_DDCu/filter_u/Add0(-8) -radix sfixed} {/aliasingddc_tb/Aliasing_DDCu/filter_u/Add0(-9) -radix sfixed} {/aliasingddc_tb/Aliasing_DDCu/filter_u/Add0(-10) -radix sfixed} {/aliasingddc_tb/Aliasing_DDCu/filter_u/Add0(-11) -radix sfixed} {/aliasingddc_tb/Aliasing_DDCu/filter_u/Add0(-12) -radix sfixed} {/aliasingddc_tb/Aliasing_DDCu/filter_u/Add0(-13) -radix sfixed} {/aliasingddc_tb/Aliasing_DDCu/filter_u/Add0(-14) -radix sfixed} {/aliasingddc_tb/Aliasing_DDCu/filter_u/Add0(-15) -radix sfixed} {/aliasingddc_tb/Aliasing_DDCu/filter_u/Add0(-16) -radix sfixed} {/aliasingddc_tb/Aliasing_DDCu/filter_u/Add0(-17) -radix sfixed}} -subitemconfig {/aliasingddc_tb/Aliasing_DDCu/filter_u/Add0(1) {-height 15 -radix sfixed} /aliasingddc_tb/Aliasing_DDCu/filter_u/Add0(0) {-height 15 -radix sfixed} /aliasingddc_tb/Aliasing_DDCu/filter_u/Add0(-1) {-height 15 -radix sfixed} /aliasingddc_tb/Aliasing_DDCu/filter_u/Add0(-2) {-height 15 -radix sfixed} /aliasingddc_tb/Aliasing_DDCu/filter_u/Add0(-3) {-height 15 -radix sfixed} /aliasingddc_tb/Aliasing_DDCu/filter_u/Add0(-4) {-height 15 -radix sfixed} /aliasingddc_tb/Aliasing_DDCu/filter_u/Add0(-5) {-height 15 -radix sfixed} /aliasingddc_tb/Aliasing_DDCu/filter_u/Add0(-6) {-height 15 -radix sfixed} /aliasingddc_tb/Aliasing_DDCu/filter_u/Add0(-7) {-height 15 -radix sfixed} /aliasingddc_tb/Aliasing_DDCu/filter_u/Add0(-8) {-height 15 -radix sfixed} /aliasingddc_tb/Aliasing_DDCu/filter_u/Add0(-9) {-height 15 -radix sfixed} /aliasingddc_tb/Aliasing_DDCu/filter_u/Add0(-10) {-height 15 -radix sfixed} /aliasingddc_tb/Aliasing_DDCu/filter_u/Add0(-11) {-height 15 -radix sfixed} /aliasingddc_tb/Aliasing_DDCu/filter_u/Add0(-12) {-height 15 -radix sfixed} /aliasingddc_tb/Aliasing_DDCu/filter_u/Add0(-13) {-height 15 -radix sfixed} /aliasingddc_tb/Aliasing_DDCu/filter_u/Add0(-14) {-height 15 -radix sfixed} /aliasingddc_tb/Aliasing_DDCu/filter_u/Add0(-15) {-height 15 -radix sfixed} /aliasingddc_tb/Aliasing_DDCu/filter_u/Add0(-16) {-height 15 -radix sfixed} /aliasingddc_tb/Aliasing_DDCu/filter_u/Add0(-17) {-height 15 -radix sfixed}} /aliasingddc_tb/Aliasing_DDCu/filter_u/Add0
add wave -noupdate -radix sfixed /aliasingddc_tb/Aliasing_DDCu/filter_u/Add1
add wave -noupdate -radix sfixed /aliasingddc_tb/Aliasing_DDCu/filter_u/Add2
add wave -noupdate -radix sfixed /aliasingddc_tb/Aliasing_DDCu/filter_u/Mult0
add wave -noupdate -radix sfixed /aliasingddc_tb/Aliasing_DDCu/filter_u/Mult1
add wave -noupdate -radix sfixed /aliasingddc_tb/Aliasing_DDCu/filter_u/Mult2
add wave -noupdate -radix sfixed /aliasingddc_tb/Aliasing_DDCu/filter_u/Delay2
add wave -noupdate -radix sfixed /aliasingddc_tb/Aliasing_DDCu/filter_u/Add3
add wave -noupdate -radix sfixed /aliasingddc_tb/Aliasing_DDCu/filter_u/Add4
add wave -noupdate -radix sfixed /aliasingddc_tb/Aliasing_DDCu/filter_u/Add5
add wave -noupdate -radix sfixed /aliasingddc_tb/Aliasing_DDCu/filter_u/Accum
add wave -noupdate /aliasingddc_tb/Aliasing_DDCu/filter_u/Counter
add wave -noupdate /aliasingddc_tb/Aliasing_DDCu/filter_u/NotCounter
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1004000 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 315
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
WaveRestoreZoom {0 ps} {1155 ns}
