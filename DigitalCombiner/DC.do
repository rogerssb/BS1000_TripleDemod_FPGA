onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /digitalcombiner_tb/CmbK7/SerDes_u/SyncRst
add wave -noupdate /digitalcombiner_tb/CmbK7/SerDes_u/CHANNEL
add wave -noupdate /digitalcombiner_tb/CmbK7/SerDes_u/CLOCK
add wave -noupdate /digitalcombiner_tb/CmbK7/SerDes_u/ChBitSlip1
add wave -noupdate /digitalcombiner_tb/CmbK7/SerDes_u/ChBitSlip2
add wave -noupdate /digitalcombiner_tb/CmbK7/SerDes_u/ChOut1
add wave -noupdate /digitalcombiner_tb/CmbK7/SerDes_u/ChOut2
add wave -noupdate /digitalcombiner_tb/CmbK7/SerDes_u/Clk200M
add wave -noupdate /digitalcombiner_tb/CmbK7/SerDes_u/Clk93M
add wave -noupdate /digitalcombiner_tb/CmbK7/SerDes_u/ClkIn1
add wave -noupdate /digitalcombiner_tb/CmbK7/SerDes_u/ClkIn2
add wave -noupdate /digitalcombiner_tb/CmbK7/SerDes_u/ClkNx
add wave -noupdate /digitalcombiner_tb/CmbK7/SerDes_u/ClkStopped200
add wave -noupdate /digitalcombiner_tb/CmbK7/SerDes_u/ClkStoppedXn
add wave -noupdate /digitalcombiner_tb/CmbK7/SerDes_u/ClkX1
add wave -noupdate /digitalcombiner_tb/CmbK7/SerDes_u/Count
add wave -noupdate -expand /digitalcombiner_tb/CmbK7/SerDes_u/DataIn1
add wave -noupdate /digitalcombiner_tb/CmbK7/SerDes_u/DataIn2
add wave -noupdate /digitalcombiner_tb/CmbK7/SerDes_u/DataOut10
add wave -noupdate /digitalcombiner_tb/CmbK7/SerDes_u/DataOut11
add wave -noupdate /digitalcombiner_tb/CmbK7/SerDes_u/DataOut12
add wave -noupdate /digitalcombiner_tb/CmbK7/SerDes_u/DataOut13
add wave -noupdate /digitalcombiner_tb/CmbK7/SerDes_u/DataOut14
add wave -noupdate /digitalcombiner_tb/CmbK7/SerDes_u/DataOut20
add wave -noupdate /digitalcombiner_tb/CmbK7/SerDes_u/DataOut21
add wave -noupdate /digitalcombiner_tb/CmbK7/SerDes_u/DataOut22
add wave -noupdate /digitalcombiner_tb/CmbK7/SerDes_u/DataOut23
add wave -noupdate /digitalcombiner_tb/CmbK7/SerDes_u/DataOut24
add wave -noupdate /digitalcombiner_tb/CmbK7/SerDes_u/DelayLocked1
add wave -noupdate /digitalcombiner_tb/CmbK7/SerDes_u/DelayLocked2
add wave -noupdate -expand /digitalcombiner_tb/CmbK7/SerDes_u/Demux1
add wave -noupdate -expand -subitemconfig {/digitalcombiner_tb/CmbK7/SerDes_u/Demux2(4) {-height 15}} /digitalcombiner_tb/CmbK7/SerDes_u/Demux2
add wave -noupdate /digitalcombiner_tb/CmbK7/SerDes_u/Lock200
add wave -noupdate /digitalcombiner_tb/CmbK7/SerDes_u/LockedXn
add wave -noupdate /digitalcombiner_tb/CmbK7/SerDes_u/PORTS
add wave -noupdate /digitalcombiner_tb/CmbK7/SerDes_u/Reset
add wave -noupdate /digitalcombiner_tb/CmbK7/SerDes_u/ResetPll
add wave -noupdate /digitalcombiner_tb/Ch1K7/combinerOut/Active1
add wave -noupdate /digitalcombiner_tb/Ch1K7/combinerOut/Active2
add wave -noupdate /digitalcombiner_tb/Ch1K7/combinerOut/CHANNEL_1
add wave -noupdate /digitalcombiner_tb/Ch1K7/combinerOut/CHANNEL_2
add wave -noupdate /digitalcombiner_tb/Ch1K7/combinerOut/COMBINER
add wave -noupdate /digitalcombiner_tb/Ch1K7/combinerOut/Clk
add wave -noupdate /digitalcombiner_tb/Ch1K7/combinerOut/FPGA_ID0
add wave -noupdate /digitalcombiner_tb/Ch1K7/combinerOut/FPGA_ID1
add wave -noupdate /digitalcombiner_tb/Ch1K7/combinerOut/ID
add wave -noupdate /digitalcombiner_tb/Ch1K7/combinerOut/NextClk_n
add wave -noupdate /digitalcombiner_tb/Ch1K7/combinerOut/NextClk_p
add wave -noupdate /digitalcombiner_tb/Ch1K7/combinerOut/NextData_n
add wave -noupdate /digitalcombiner_tb/Ch1K7/combinerOut/NextData_p
add wave -noupdate /digitalcombiner_tb/Ch1K7/combinerOut/PORTS
add wave -noupdate /digitalcombiner_tb/Ch1K7/combinerOut/PrevClk_n
add wave -noupdate /digitalcombiner_tb/Ch1K7/combinerOut/PrevClk_p
add wave -noupdate /digitalcombiner_tb/Ch1K7/combinerOut/PrevData_n
add wave -noupdate /digitalcombiner_tb/Ch1K7/combinerOut/PrevData_p
add wave -noupdate /digitalcombiner_tb/Ch1K7/combinerOut/Reset
add wave -noupdate /digitalcombiner_tb/Ch1K7/combinerOut/TxData1
add wave -noupdate /digitalcombiner_tb/Ch1K7/combinerOut/TxData2
add wave -noupdate /digitalcombiner_tb/Ch1K7/combinerOut/TxData4
add wave -noupdate /digitalcombiner_tb/Ch1K7/combinerOut/Vio9
add wave -noupdate /digitalcombiner_tb/Ch1K7/combinerOut/adc0
add wave -noupdate /digitalcombiner_tb/Ch1K7/combinerOut/amDataEn
add wave -noupdate /digitalcombiner_tb/Ch1K7/combinerOut/amDataIn
add wave -noupdate /digitalcombiner_tb/Ch1K7/combinerOut/iDemodBit
add wave -noupdate /digitalcombiner_tb/Ch1K7/combinerOut/qDemodBit
add wave -noupdate /digitalcombiner_tb/Ch1K7/combinerOut/FPGA_ID1
add wave -noupdate /digitalcombiner_tb/Ch1K7/IF_BS_n
add wave -noupdate /digitalcombiner_tb/Ch1K7/Vio9
add wave -noupdate /digitalcombiner_tb/Ch1K7/reset
add wave -noupdate /digitalcombiner_tb/Ch1K7/combinerOut/Clk
add wave -noupdate /digitalcombiner_tb/Ch1K7/combinerOut/Reset
add wave -noupdate /digitalcombiner_tb/Ch1K7/combinerOut/FPGA_ID0
add wave -noupdate /digitalcombiner_tb/Ch1K7/combinerOut/FPGA_ID1
add wave -noupdate /digitalcombiner_tb/Ch1K7/combinerOut/amDataEn
add wave -noupdate /digitalcombiner_tb/Ch1K7/combinerOut/iDemodBit
add wave -noupdate /digitalcombiner_tb/Ch1K7/combinerOut/qDemodBit
add wave -noupdate /digitalcombiner_tb/Ch1K7/combinerOut/amDataIn
add wave -noupdate /digitalcombiner_tb/Ch1K7/combinerOut/adc0
add wave -noupdate /digitalcombiner_tb/Ch1K7/combinerOut/PrevData_p
add wave -noupdate /digitalcombiner_tb/Ch1K7/combinerOut/PrevData_n
add wave -noupdate /digitalcombiner_tb/Ch1K7/combinerOut/NextData_p
add wave -noupdate /digitalcombiner_tb/Ch1K7/combinerOut/NextData_n
add wave -noupdate /digitalcombiner_tb/Ch1K7/combinerOut/NextClk_p
add wave -noupdate /digitalcombiner_tb/Ch1K7/combinerOut/NextClk_n
add wave -noupdate /digitalcombiner_tb/Ch1K7/combinerOut/PrevClk_p
add wave -noupdate /digitalcombiner_tb/Ch1K7/combinerOut/PrevClk_n
add wave -noupdate /digitalcombiner_tb/Ch1K7/combinerOut/ID
add wave -noupdate /digitalcombiner_tb/Ch1K7/combinerOut/TxData4
add wave -noupdate /digitalcombiner_tb/Ch1K7/combinerOut/TxData1
add wave -noupdate /digitalcombiner_tb/Ch1K7/combinerOut/TxData2
add wave -noupdate /digitalcombiner_tb/Ch1K7/combinerOut/Vio9
add wave -noupdate /digitalcombiner_tb/Ch1K7/combinerOut/Active1
add wave -noupdate /digitalcombiner_tb/Ch1K7/combinerOut/Active2
add wave -noupdate /digitalcombiner_tb/Ch1K7/combinerOut/Vio9
add wave -noupdate /digitalcombiner_tb/Ch1K7/combinerOut/Ch1SerDes/Reset
add wave -noupdate /digitalcombiner_tb/Ch1K7/combinerOut/Ch1SerDes/SyncRst
add wave -noupdate /digitalcombiner_tb/Ch1K7/combinerOut/Reset
add wave -noupdate /digitalcombiner_tb/Ch1K7/IF_BS_n
add wave -noupdate /digitalcombiner_tb/Ch1K7/Vio9
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {3205421 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 323
configure wave -valuecolwidth 126
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
WaveRestoreZoom {4686058 ps} {5016524 ps}
bookmark add wave bookmark3 {{2508730 ps} {2540670 ps}} 0
bookmark add wave bookmark4 {{3023030 ps} {3054970 ps}} 0
bookmark add wave bookmark5 {{2187685 ps} {2199857 ps}} 33
bookmark add wave bookmark6 {{3212803 ps} {3228773 ps}} 48
