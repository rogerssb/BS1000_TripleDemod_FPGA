onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /cmplx_tb/reset
add wave -noupdate /cmplx_tb/clk
add wave -noupdate /cmplx_tb/ce
add wave -noupdate /cmplx_tb/Start
add wave -noupdate /cmplx_tb/StartMult
add wave -noupdate /cmplx_tb/StartAbs
add wave -noupdate /cmplx_tb/ValidIn
add wave -noupdate /cmplx_tb/ValidCos
add wave -noupdate /cmplx_tb/ValidMult
add wave -noupdate /cmplx_tb/ValidAbs
add wave -noupdate -format Analog-Step -height 74 -max 131069.99999999999 -min -131070.0 /cmplx_tb/Ar
add wave -noupdate -format Analog-Step -height 74 -max 131069.99999999999 -min -131070.0 /cmplx_tb/Ai
add wave -noupdate -format Analog-Step -height 74 -max 131069.99999999999 -min -131070.0 /cmplx_tb/Br
add wave -noupdate -format Analog-Step -height 74 -max 131069.99999999999 -min -131070.0 /cmplx_tb/Bi
add wave -noupdate -format Analog-Step -height 74 -max 131067.00000000001 -min -131067.0 /cmplx_tb/Cr
add wave -noupdate -format Analog-Step -height 74 -max 131067.99999999999 -min -131069.0 /cmplx_tb/Ci
add wave -noupdate -format Analog-Step -height 74 -max 131067.0 -min 131060.0 -radix sfixed /cmplx_tb/MagOut
add wave -noupdate /cmplx_tb/PhaseAcc
add wave -noupdate /cmplx_tb/Count
add wave -noupdate -divider Mult
add wave -noupdate /cmplx_tb/Mult/clk
add wave -noupdate /cmplx_tb/Mult/reset
add wave -noupdate /cmplx_tb/Mult/ce
add wave -noupdate /cmplx_tb/Mult/ReInA
add wave -noupdate /cmplx_tb/Mult/ImInA
add wave -noupdate /cmplx_tb/Mult/ReInB
add wave -noupdate /cmplx_tb/Mult/ImInB
add wave -noupdate /cmplx_tb/Mult/ValidIn
add wave -noupdate /cmplx_tb/Mult/StartIn
add wave -noupdate /cmplx_tb/Mult/A0
add wave -noupdate /cmplx_tb/Mult/B0
add wave -noupdate /cmplx_tb/Mult/C0
add wave -noupdate /cmplx_tb/Mult/D0
add wave -noupdate /cmplx_tb/Mult/A1
add wave -noupdate /cmplx_tb/Mult/B1
add wave -noupdate /cmplx_tb/Mult/D1
add wave -noupdate /cmplx_tb/Mult/DiffAB
add wave -noupdate /cmplx_tb/Mult/DiffCD
add wave -noupdate /cmplx_tb/Mult/SumCD
add wave -noupdate /cmplx_tb/Mult/Mult0
add wave -noupdate /cmplx_tb/Mult/MultR
add wave -noupdate /cmplx_tb/Mult/MultI
add wave -noupdate /cmplx_tb/Mult/Mult0DlyA
add wave -noupdate /cmplx_tb/Mult/Mult0DlyB
add wave -noupdate /cmplx_tb/Mult/MultRDly
add wave -noupdate /cmplx_tb/Mult/MultIDly
add wave -noupdate /cmplx_tb/Mult/ValidDly
add wave -noupdate /cmplx_tb/Mult/StartDly
add wave -noupdate /cmplx_tb/Mult/ReOut
add wave -noupdate /cmplx_tb/Mult/ImOut
add wave -noupdate /cmplx_tb/Mult/ValidOut
add wave -noupdate /cmplx_tb/Mult/StartOut
add wave -noupdate -divider Abs
add wave -noupdate /cmplx_tb/Absolute/clk
add wave -noupdate /cmplx_tb/Absolute/reset
add wave -noupdate /cmplx_tb/Absolute/ce
add wave -noupdate /cmplx_tb/Absolute/ReIn
add wave -noupdate /cmplx_tb/Absolute/ImIn
add wave -noupdate /cmplx_tb/Absolute/ValidIn
add wave -noupdate /cmplx_tb/Absolute/StartIn
add wave -noupdate /cmplx_tb/Absolute/AbsOut
add wave -noupdate /cmplx_tb/Absolute/ValidOut
add wave -noupdate /cmplx_tb/Absolute/StartOut
add wave -noupdate /cmplx_tb/Absolute/A0
add wave -noupdate /cmplx_tb/Absolute/B0
add wave -noupdate /cmplx_tb/Absolute/MultR
add wave -noupdate /cmplx_tb/Absolute/MultI
add wave -noupdate /cmplx_tb/Absolute/MultRDly
add wave -noupdate /cmplx_tb/Absolute/MultIDly
add wave -noupdate /cmplx_tb/Absolute/ValidDly
add wave -noupdate /cmplx_tb/Absolute/StartDly
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {15572 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 203
configure wave -valuecolwidth 40
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
WaveRestoreZoom {0 ps} {123048 ps}
bookmark add wave bookmark0 {{3023030 ps} {3054970 ps}} 0
bookmark add wave bookmark1 {{2508730 ps} {2540670 ps}} 0
