onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /digitalcombiner_tb/LogLin/ARRAY_SIZE
add wave -noupdate -radix ufixed /digitalcombiner_tb/LogLin/BlockRom
add wave -noupdate -radix ufixed /digitalcombiner_tb/LogLin/LinearOut
add wave -noupdate -radix sfixed -childformat {{/digitalcombiner_tb/LogLin/LogIn(4) -radix sfixed} {/digitalcombiner_tb/LogLin/LogIn(3) -radix sfixed} {/digitalcombiner_tb/LogLin/LogIn(2) -radix sfixed} {/digitalcombiner_tb/LogLin/LogIn(1) -radix sfixed} {/digitalcombiner_tb/LogLin/LogIn(0) -radix sfixed} {/digitalcombiner_tb/LogLin/LogIn(-1) -radix sfixed} {/digitalcombiner_tb/LogLin/LogIn(-2) -radix sfixed} {/digitalcombiner_tb/LogLin/LogIn(-3) -radix sfixed} {/digitalcombiner_tb/LogLin/LogIn(-4) -radix sfixed} {/digitalcombiner_tb/LogLin/LogIn(-5) -radix sfixed}} -expand -subitemconfig {/digitalcombiner_tb/LogLin/LogIn(4) {-height 15 -radix sfixed} /digitalcombiner_tb/LogLin/LogIn(3) {-height 15 -radix sfixed} /digitalcombiner_tb/LogLin/LogIn(2) {-height 15 -radix sfixed} /digitalcombiner_tb/LogLin/LogIn(1) {-height 15 -radix sfixed} /digitalcombiner_tb/LogLin/LogIn(0) {-height 15 -radix sfixed} /digitalcombiner_tb/LogLin/LogIn(-1) {-height 15 -radix sfixed} /digitalcombiner_tb/LogLin/LogIn(-2) {-height 15 -radix sfixed} /digitalcombiner_tb/LogLin/LogIn(-3) {-height 15 -radix sfixed} /digitalcombiner_tb/LogLin/LogIn(-4) {-height 15 -radix sfixed} /digitalcombiner_tb/LogLin/LogIn(-5) {-height 15 -radix sfixed}} /digitalcombiner_tb/LogLin/LogIn
add wave -noupdate /digitalcombiner_tb/LogLin/RdAddr
add wave -noupdate -radix sfixed -childformat {{/digitalcombiner_tb/LogLin/ZeroAdj(5) -radix sfixed} {/digitalcombiner_tb/LogLin/ZeroAdj(4) -radix sfixed} {/digitalcombiner_tb/LogLin/ZeroAdj(3) -radix sfixed} {/digitalcombiner_tb/LogLin/ZeroAdj(2) -radix sfixed} {/digitalcombiner_tb/LogLin/ZeroAdj(1) -radix sfixed} {/digitalcombiner_tb/LogLin/ZeroAdj(0) -radix sfixed} {/digitalcombiner_tb/LogLin/ZeroAdj(-1) -radix sfixed} {/digitalcombiner_tb/LogLin/ZeroAdj(-2) -radix sfixed} {/digitalcombiner_tb/LogLin/ZeroAdj(-3) -radix sfixed} {/digitalcombiner_tb/LogLin/ZeroAdj(-4) -radix sfixed} {/digitalcombiner_tb/LogLin/ZeroAdj(-5) -radix sfixed}} -expand -subitemconfig {/digitalcombiner_tb/LogLin/ZeroAdj(5) {-height 15 -radix sfixed} /digitalcombiner_tb/LogLin/ZeroAdj(4) {-height 15 -radix sfixed} /digitalcombiner_tb/LogLin/ZeroAdj(3) {-height 15 -radix sfixed} /digitalcombiner_tb/LogLin/ZeroAdj(2) {-height 15 -radix sfixed} /digitalcombiner_tb/LogLin/ZeroAdj(1) {-height 15 -radix sfixed} /digitalcombiner_tb/LogLin/ZeroAdj(0) {-height 15 -radix sfixed} /digitalcombiner_tb/LogLin/ZeroAdj(-1) {-height 15 -radix sfixed} /digitalcombiner_tb/LogLin/ZeroAdj(-2) {-height 15 -radix sfixed} /digitalcombiner_tb/LogLin/ZeroAdj(-3) {-height 15 -radix sfixed} /digitalcombiner_tb/LogLin/ZeroAdj(-4) {-height 15 -radix sfixed} /digitalcombiner_tb/LogLin/ZeroAdj(-5) {-height 15 -radix sfixed}} /digitalcombiner_tb/LogLin/ZeroAdj
add wave -noupdate /digitalcombiner_tb/LogLin/ce
add wave -noupdate /digitalcombiner_tb/LogLin/clk
add wave -noupdate /digitalcombiner_tb/LogLin/reset
add wave -noupdate -radix sfixed -childformat {{/digitalcombiner_tb/LogLin/MinLogIn(5) -radix sfixed} {/digitalcombiner_tb/LogLin/MinLogIn(4) -radix sfixed} {/digitalcombiner_tb/LogLin/MinLogIn(3) -radix sfixed} {/digitalcombiner_tb/LogLin/MinLogIn(2) -radix sfixed} {/digitalcombiner_tb/LogLin/MinLogIn(1) -radix sfixed} {/digitalcombiner_tb/LogLin/MinLogIn(0) -radix sfixed} {/digitalcombiner_tb/LogLin/MinLogIn(-1) -radix sfixed} {/digitalcombiner_tb/LogLin/MinLogIn(-2) -radix sfixed} {/digitalcombiner_tb/LogLin/MinLogIn(-3) -radix sfixed} {/digitalcombiner_tb/LogLin/MinLogIn(-4) -radix sfixed} {/digitalcombiner_tb/LogLin/MinLogIn(-5) -radix sfixed}} -subitemconfig {/digitalcombiner_tb/LogLin/MinLogIn(5) {-height 15 -radix sfixed} /digitalcombiner_tb/LogLin/MinLogIn(4) {-height 15 -radix sfixed} /digitalcombiner_tb/LogLin/MinLogIn(3) {-height 15 -radix sfixed} /digitalcombiner_tb/LogLin/MinLogIn(2) {-height 15 -radix sfixed} /digitalcombiner_tb/LogLin/MinLogIn(1) {-height 15 -radix sfixed} /digitalcombiner_tb/LogLin/MinLogIn(0) {-height 15 -radix sfixed} /digitalcombiner_tb/LogLin/MinLogIn(-1) {-height 15 -radix sfixed} /digitalcombiner_tb/LogLin/MinLogIn(-2) {-height 15 -radix sfixed} /digitalcombiner_tb/LogLin/MinLogIn(-3) {-height 15 -radix sfixed} /digitalcombiner_tb/LogLin/MinLogIn(-4) {-height 15 -radix sfixed} /digitalcombiner_tb/LogLin/MinLogIn(-5) {-height 15 -radix sfixed}} /digitalcombiner_tb/LogLin/MinLogIn
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {7575600 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 271
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
WaveRestoreZoom {6591176 ps} {7001352 ps}
