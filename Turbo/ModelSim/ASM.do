onerror {resume}
radix define sfix8 -fixed -fraction 8 -signed -base signed -precision 6
radix define sfix5 -fixed -fraction 5 -signed -base signed -precision 6
radix define sfix15 -fixed -fraction 15 -signed -base signed -precision 6
radix define sfix12 -fixed -fraction 12 -signed -base signed -precision 6
radix define sfix11 -fixed -fraction 11 -signed -base signed -precision 6
radix define sfix7 -fixed -fraction 7 -signed -precision 6
quietly WaveActivateNextPane {} 0
add wave -noupdate /turboasm_tb/Top/Clk
add wave -noupdate /turboasm_tb/Top/Reset
add wave -noupdate /turboasm_tb/Top/Frame
add wave -noupdate /turboasm_tb/Top/Rate
add wave -noupdate /turboasm_tb/Top/BitSlips
add wave -noupdate /turboasm_tb/Top/IL_BET
add wave -noupdate /turboasm_tb/Top/OOL_BET
add wave -noupdate /turboasm_tb/Top/Verifies
add wave -noupdate /turboasm_tb/Top/FlyWheels
add wave -noupdate -radix unsigned -radixshowbase 0 /turboasm_tb/Top/CountNegEvenOdd
add wave -noupdate -radix unsigned -radixshowbase 0 /turboasm_tb/Top/CountNegOddEven
add wave -noupdate -radix unsigned -radixshowbase 0 /turboasm_tb/Top/CountPosEvenOdd
add wave -noupdate -radix unsigned -radixshowbase 0 /turboasm_tb/Top/CountPosOddEven
add wave -noupdate /turboasm_tb/SyncPattern
add wave -noupdate -radix unsigned -radixshowbase 0 /turboasm_tb/Top/CountNegOddOdd
add wave -noupdate -radix unsigned -radixshowbase 0 /turboasm_tb/Top/CountNegEvenEven
add wave -noupdate -radix unsigned -radixshowbase 0 /turboasm_tb/Top/CountPosOddOdd
add wave -noupdate -radix unsigned -radixshowbase 0 /turboasm_tb/Top/CountPosEvenEven
add wave -noupdate -radix unsigned -radixshowbase 0 /turboasm_tb/FrameCnt
add wave -noupdate /turboasm_tb/SyncIn
add wave -noupdate -format Analog-Step -height 74 -max 64.0 -radix unsigned -radixshowbase 0 /turboasm_tb/Top/TotalBits
add wave -noupdate -radix unsigned -radixshowbase 0 /turboasm_tb/Top/TotalBits
add wave -noupdate -radix unsigned -radixshowbase 0 /turboasm_tb/Top/MaxCount
add wave -noupdate /turboasm_tb/Top/InvertEven
add wave -noupdate /turboasm_tb/InvertEvenIn
add wave -noupdate /turboasm_tb/Top/InvertOdd
add wave -noupdate /turboasm_tb/InvertOddIn
add wave -noupdate /turboasm_tb/Top/Mode
add wave -noupdate -format Analog-Step -height 74 -max 30.999999999999996 -min -32.0 -radix decimal /turboasm_tb/Top/Data0
add wave -noupdate -radix decimal -childformat {{/turboasm_tb/Top/Data1(5) -radix decimal} {/turboasm_tb/Top/Data1(4) -radix decimal} {/turboasm_tb/Top/Data1(3) -radix decimal} {/turboasm_tb/Top/Data1(2) -radix decimal} {/turboasm_tb/Top/Data1(1) -radix decimal} {/turboasm_tb/Top/Data1(0) -radix decimal}} -radixshowbase 0 -subitemconfig {/turboasm_tb/Top/Data1(5) {-height 15 -radix decimal -radixshowbase 0} /turboasm_tb/Top/Data1(4) {-height 15 -radix decimal -radixshowbase 0} /turboasm_tb/Top/Data1(3) {-height 15 -radix decimal -radixshowbase 0} /turboasm_tb/Top/Data1(2) {-height 15 -radix decimal -radixshowbase 0} /turboasm_tb/Top/Data1(1) {-height 15 -radix decimal -radixshowbase 0} /turboasm_tb/Top/Data1(0) {-height 15 -radix decimal -radixshowbase 0}} /turboasm_tb/Top/Data1
add wave -noupdate /turboasm_tb/Top/SyncOut
add wave -noupdate -radix decimal -childformat {{/turboasm_tb/Top/DataOut(5) -radix decimal} {/turboasm_tb/Top/DataOut(4) -radix decimal} {/turboasm_tb/Top/DataOut(3) -radix decimal} {/turboasm_tb/Top/DataOut(2) -radix decimal} {/turboasm_tb/Top/DataOut(1) -radix decimal} {/turboasm_tb/Top/DataOut(0) -radix decimal}} -radixshowbase 0 -subitemconfig {/turboasm_tb/Top/DataOut(5) {-height 15 -radix decimal -radixshowbase 0} /turboasm_tb/Top/DataOut(4) {-height 15 -radix decimal -radixshowbase 0} /turboasm_tb/Top/DataOut(3) {-height 15 -radix decimal -radixshowbase 0} /turboasm_tb/Top/DataOut(2) {-height 15 -radix decimal -radixshowbase 0} /turboasm_tb/Top/DataOut(1) {-height 15 -radix decimal -radixshowbase 0} /turboasm_tb/Top/DataOut(0) {-height 15 -radix decimal -radixshowbase 0}} /turboasm_tb/Top/DataOut
add wave -noupdate /turboasm_tb/Top/ValidOut
add wave -noupdate /turboasm_tb/Top/ModMode
add wave -noupdate /turboasm_tb/Top/Data0Sign
add wave -noupdate /turboasm_tb/Top/SyncEven
add wave -noupdate /turboasm_tb/Top/SearchEven
add wave -noupdate /turboasm_tb/Top/SyncOdd
add wave -noupdate /turboasm_tb/Top/SearchOdd
add wave -noupdate -radix unsigned /turboasm_tb/Top/SyncTime
add wave -noupdate /turboasm_tb/Top/Valid0
add wave -noupdate /turboasm_tb/Top/Valid1
add wave -noupdate /turboasm_tb/Top/ValidPipe
add wave -noupdate /turboasm_tb/Top/ValidPipeDly
add wave -noupdate /turboasm_tb/SyncPattern
add wave -noupdate -radix decimal -radixshowbase 0 /turboasm_tb/OutCntr
add wave -noupdate /turboasm_tb/Data
add wave -noupdate -radix unsigned -radixshowbase 0 /turboasm_tb/InCntr
add wave -noupdate /turboasm_tb/DataOut
add wave -noupdate /turboasm_tb/SyncOut
add wave -noupdate /turboasm_tb/ValidOut
add wave -noupdate /turboasm_tb/Top/Mode
add wave -noupdate /turboasm_tb/Verified
add wave -noupdate /turboasm_tb/Mode
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {25720000 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 258
configure wave -valuecolwidth 187
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
WaveRestoreZoom {6970075 ns} {7001575 ns}
