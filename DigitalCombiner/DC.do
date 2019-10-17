onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /digitalcombiner_tb/Ch1NextDataIO_p
add wave -noupdate /digitalcombiner_tb/Ch1PrevDataIO_p
add wave -noupdate /digitalcombiner_tb/Ch2NextDataIO_p
add wave -noupdate /digitalcombiner_tb/Ch2PrevDataIO_p
add wave -noupdate /digitalcombiner_tb/CommandIO
add wave -noupdate /digitalcombiner_tb/Ch1K7/SysRst
add wave -noupdate -divider Ch1Ch1
add wave -noupdate /digitalcombiner_tb/Ch1K7/SerDes/Ch1SerDes/DELAY_ADJUST
add wave -noupdate /digitalcombiner_tb/Ch1K7/SerDes/Ch1SerDes/ALIGN_DATA
add wave -noupdate /digitalcombiner_tb/Ch1K7/SerDes/Ch1SerDes/DATA_MODE
add wave -noupdate /digitalcombiner_tb/Ch1K7/SerDes/Ch1SerDes/Active
add wave -noupdate /digitalcombiner_tb/Ch1K7/SerDes/Ch1SerDes/Clk
add wave -noupdate /digitalcombiner_tb/Ch1K7/SerDes/Ch1SerDes/Clk466M
add wave -noupdate /digitalcombiner_tb/Ch1K7/SerDes/Ch1SerDes/Clk93M
add wave -noupdate /digitalcombiner_tb/Ch1K7/SerDes/Ch1SerDes/Command
add wave -noupdate /digitalcombiner_tb/Ch1K7/SerDes/Ch1SerDes/DataOut
add wave -noupdate /digitalcombiner_tb/Ch1K7/SerDes/Ch1SerDes/DataOut_n
add wave -noupdate /digitalcombiner_tb/Ch1K7/SerDes/Ch1SerDes/DataOut_p
add wave -noupdate /digitalcombiner_tb/Ch1K7/SerDes/Ch1SerDes/Diff
add wave -noupdate /digitalcombiner_tb/Ch1K7/SerDes/Ch1SerDes/KO
add wave -noupdate /digitalcombiner_tb/Ch1K7/SerDes/Ch1SerDes/Lock466M
add wave -noupdate /digitalcombiner_tb/Ch1K7/SerDes/Ch1SerDes/PORTS
add wave -noupdate /digitalcombiner_tb/Ch1K7/SerDes/Ch1SerDes/Reset
add wave -noupdate /digitalcombiner_tb/Ch1K7/SerDes/Ch1SerDes/SRst
add wave -noupdate /digitalcombiner_tb/Ch1K7/SerDes/Ch1SerDes/SyncRst
add wave -noupdate /digitalcombiner_tb/Ch1K7/SerDes/Ch1SerDes/TenB_Out
add wave -noupdate -expand /digitalcombiner_tb/Ch1K7/SerDes/Ch1SerDes/ChTenB
add wave -noupdate /digitalcombiner_tb/Ch1K7/SerDes/Ch1SerDes/Tx1
add wave -noupdate /digitalcombiner_tb/Ch1K7/SerDes/Ch1SerDes/Tx2
add wave -noupdate /digitalcombiner_tb/Ch1K7/SerDes/Ch1SerDes/TxData
add wave -noupdate /digitalcombiner_tb/Ch1K7/SerDes/Ch1SerDes/TxDataDly
add wave -noupdate -divider CmbCh1
add wave -noupdate /digitalcombiner_tb/CmbK7/SerDes/Ch1SerDes_u/ALIGN_DATA
add wave -noupdate /digitalcombiner_tb/CmbK7/SerDes/Ch1SerDes_u/ChBitSlip
add wave -noupdate /digitalcombiner_tb/Ch1K7/SerDes/Ch1SerDes/SerDes5x10Out/data_out_from_device
add wave -noupdate /digitalcombiner_tb/CmbK7/SerDes/Ch1SerDes_u/ChOut
add wave -noupdate -expand /digitalcombiner_tb/CmbK7/SerDes/Ch1SerDes_u/ChTenB
add wave -noupdate /digitalcombiner_tb/CmbK7/SerDes/Ch1SerDes_u/Taps
add wave -noupdate /digitalcombiner_tb/CmbK7/SerDes/Ch1SerDes_u/SerDes5x10In/in_delay_tap_out
add wave -noupdate /digitalcombiner_tb/CmbK7/SerDes/Ch1SerDes_u/TapLoad
add wave -noupdate /digitalcombiner_tb/CmbK7/SerDes/Ch1SerDes_u/Clk
add wave -noupdate /digitalcombiner_tb/CmbK7/SerDes/Ch1SerDes_u/Clk466M
add wave -noupdate /digitalcombiner_tb/XX
add wave -noupdate /digitalcombiner_tb/CmbK7/SerDes/Ch1SerDes_u/Clk93M
add wave -noupdate /digitalcombiner_tb/CmbK7/SerDes/Ch1SerDes_u/Clk_199m999
add wave -noupdate -radix unsigned -childformat {{/digitalcombiner_tb/CmbK7/SerDes/Ch1SerDes_u/Command(1) -radix unsigned} {/digitalcombiner_tb/CmbK7/SerDes/Ch1SerDes_u/Command(0) -radix unsigned}} -expand -subitemconfig {/digitalcombiner_tb/CmbK7/SerDes/Ch1SerDes_u/Command(1) {-height 15 -radix unsigned} /digitalcombiner_tb/CmbK7/SerDes/Ch1SerDes_u/Command(0) {-height 15 -radix unsigned}} /digitalcombiner_tb/CmbK7/SerDes/Ch1SerDes_u/Command
add wave -noupdate /digitalcombiner_tb/CmbK7/SerDes/Ch1SerDes_u/DATA_MODE
add wave -noupdate /digitalcombiner_tb/CmbK7/SerDes/Ch1SerDes_u/DELAY_ADJUST
add wave -noupdate /digitalcombiner_tb/CmbK7/SerDes/Ch1SerDes_u/DataIn_n
add wave -noupdate -expand /digitalcombiner_tb/CmbK7/SerDes/Ch1SerDes_u/DataIn_p
add wave -noupdate /digitalcombiner_tb/CmbK7/SerDes/Ch1SerDes_u/DataOut
add wave -noupdate /digitalcombiner_tb/CmbK7/SerDes/Ch1SerDes_u/DelayLocked
add wave -noupdate /digitalcombiner_tb/CmbK7/SerDes/Ch1SerDes_u/KO
add wave -noupdate /digitalcombiner_tb/CmbK7/SerDes/Ch1SerDes_u/Lock199m999
add wave -noupdate /digitalcombiner_tb/CmbK7/SerDes/Ch1SerDes_u/Lock466M
add wave -noupdate /digitalcombiner_tb/CmbK7/SerDes/Ch1SerDes_u/PORTS
add wave -noupdate /digitalcombiner_tb/CmbK7/SerDes/Ch1SerDes_u/Reset
add wave -noupdate /digitalcombiner_tb/CmbK7/SerDes/Ch1SerDes_u/SRst
add wave -noupdate /digitalcombiner_tb/CmbK7/SerDes/Ch1SerDes_u/SyncRst
add wave -noupdate -format Analog-Step -height 74 -max 63.0 -radix unsigned /digitalcombiner_tb/CmbK7/SerDes/Ch1SerDes_u/Count
add wave -noupdate /digitalcombiner_tb/CmbK7/SerDes/Ch2SerDes_u/ChBitSlip
add wave -noupdate /digitalcombiner_tb/CmbK7/SerDes/Ch2SerDes_u/ChOut
add wave -noupdate /digitalcombiner_tb/CmbK7/SerDes/Ch2SerDes_u/Count
add wave -noupdate /digitalcombiner_tb/CmbK7/SerDes/Ch2SerDes_u/DataOut
add wave -noupdate /digitalcombiner_tb/CmbK7/SerDes/Ch2SerDes_u/DelayLocked
add wave -noupdate /digitalcombiner_tb/CmbK7/SerDes/Ch2SerDes_u/Lock199m999
add wave -noupdate /digitalcombiner_tb/CmbK7/SerDes/Ch2SerDes_u/Lock466M
add wave -noupdate /digitalcombiner_tb/CmbK7/SerDes/Ch2SerDes_u/TapLoad
add wave -noupdate /digitalcombiner_tb/CmbK7/SerDes/Ch2SerDes_u/Taps
add wave -noupdate -expand /digitalcombiner_tb/CmbK7/SerDes/Ch2SerDes_u/DataIn_p
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {7486881 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 400
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
WaveRestoreZoom {9844140 ps} {10008204 ps}
