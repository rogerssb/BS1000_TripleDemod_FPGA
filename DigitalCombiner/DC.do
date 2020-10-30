onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /digitalcombiner_tb/Ch1NextDataIO_p
add wave -noupdate /digitalcombiner_tb/Ch1PrevDataIO_p
add wave -noupdate /digitalcombiner_tb/Ch2NextDataIO_p
add wave -noupdate /digitalcombiner_tb/CmbDataIn1_p
add wave -noupdate /digitalcombiner_tb/CmbDataIn2_p
add wave -noupdate /digitalcombiner_tb/NextClkIO_p
add wave -noupdate /digitalcombiner_tb/PrevClkIO_p
add wave -noupdate /digitalcombiner_tb/CmbClkIn1_p
add wave -noupdate /digitalcombiner_tb/CmbClkIn2_p
add wave -noupdate /digitalcombiner_tb/Ch1K7/SysRst
add wave -noupdate -divider Ch1
add wave -noupdate /digitalcombiner_tb/Ch1K7/SerDes/Ch1SerDes/Active
add wave -noupdate /digitalcombiner_tb/Ch1K7/SerDes/Ch1SerDes/Clk1x
add wave -noupdate /digitalcombiner_tb/Ch1K7/SerDes/Ch1SerDes/DataOut_n
add wave -noupdate -expand /digitalcombiner_tb/Ch1K7/SerDes/Ch1SerDes/DataOut_p
add wave -noupdate /digitalcombiner_tb/Ch1K7/SerDes/Ch1SerDes/RefClkOut_p
add wave -noupdate /digitalcombiner_tb/Ch1K7/SerDes/Ch1SerDes/PORTS
add wave -noupdate /digitalcombiner_tb/Ch1K7/SerDes/Ch1SerDes/Reset
add wave -noupdate /digitalcombiner_tb/Ch1K7/SerDes/Ch1SerDes/SRst
add wave -noupdate /digitalcombiner_tb/Ch1K7/SerDes/Ch1SerDes/SyncRst
add wave -noupdate /digitalcombiner_tb/Ch1K7/SerDes/Ch1SerDes/SerDes5x10Out/inst/data_out_from_device
add wave -noupdate /digitalcombiner_tb/Ch1K7/SerDes/Ch1SerDes/SerDesIn
add wave -noupdate /digitalcombiner_tb/Ch1K7/SerDes/Ch1SerDes/TxData
add wave -noupdate /digitalcombiner_tb/Ch1K7/SerDes/Ch1SerDes/TxDataDly
add wave -noupdate -divider {Combiner Channel 1}
add wave -noupdate /digitalcombiner_tb/CmbK7/SerDes/Ch1SerDes_u/Clk93M
add wave -noupdate /digitalcombiner_tb/CmbK7/SerDes/Ch1SerDes_u/Clk_199m999
add wave -noupdate /digitalcombiner_tb/CmbK7/SerDes/Ch1SerDes_u/DataIn_n
add wave -noupdate -expand /digitalcombiner_tb/CmbK7/SerDes/Ch1SerDes_u/DataIn_p
add wave -noupdate /digitalcombiner_tb/CmbK7/SerDes/Ch1SerDes_u/DataIn
add wave -noupdate /digitalcombiner_tb/CmbK7/SerDes/Ch1SerDes_u/ClkIn
add wave -noupdate /digitalcombiner_tb/CmbK7/SerDes/Ch1SerDes_u/ClkInX1
add wave -noupdate /digitalcombiner_tb/CmbK7/SerDes/Ch1SerDes_u/Reset
add wave -noupdate /digitalcombiner_tb/CmbK7/SerDes/Ch1SerDes_u/SRst
add wave -noupdate /digitalcombiner_tb/CmbK7/SerDes/Ch1SerDes_u/SyncRst
add wave -noupdate /digitalcombiner_tb/CmbK7/SerDes/Ch1SerDes_u/Lock199m999
add wave -noupdate /digitalcombiner_tb/CmbK7/SerDes/Ch1SerDes_u/LockedX5
add wave -noupdate /digitalcombiner_tb/CmbK7/SerDes/Ch1SerDes_u/DelayLocked
add wave -noupdate /digitalcombiner_tb/CmbK7/SerDes/Ch1SerDes_u/ChBitSlip
add wave -noupdate /digitalcombiner_tb/XX
add wave -noupdate /digitalcombiner_tb/CmbK7/SerDes/Ch1SerDes_u/ProbeOut2
add wave -noupdate -expand /digitalcombiner_tb/CmbK7/SerDes/Ch1SerDes_u/SerDes5x10In/data_in_from_pins
add wave -noupdate /digitalcombiner_tb/CmbK7/SerDes/Ch1SerDes_u/ChOut
add wave -noupdate -expand /digitalcombiner_tb/CmbK7/SerDes/Ch1SerDes_u/ChTenB
add wave -noupdate /digitalcombiner_tb/CmbK7/SerDes/Ch1SerDes_u/DataOut
add wave -noupdate /digitalcombiner_tb/CmbK7/SerDes/Ch1SerDes_u/ChTenB
add wave -noupdate /digitalcombiner_tb/CmbK7/SerDes/Ch1SerDes_u/KO
add wave -noupdate -divider {Combiner Channel 2}
add wave -noupdate /digitalcombiner_tb/CmbK7/SerDes/Ch2SerDes_u/ChBitSlip
add wave -noupdate /digitalcombiner_tb/CmbK7/SerDes/Ch2SerDes_u/ChOut
add wave -noupdate /digitalcombiner_tb/CmbK7/SerDes/Ch2SerDes_u/DataOut
add wave -noupdate /digitalcombiner_tb/CmbK7/SerDes/Ch2SerDes_u/DelayLocked
add wave -noupdate /digitalcombiner_tb/CmbK7/SerDes/Ch2SerDes_u/Lock199m999
add wave -noupdate /digitalcombiner_tb/CmbK7/SerDes/Ch2SerDes_u/DataIn_p
add wave -noupdate -divider {New Divider}
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {2556337 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 285
configure wave -valuecolwidth 153
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
WaveRestoreZoom {2162587 ps} {2950087 ps}
bookmark add wave bookmark0 {{2508730 ps} {2540670 ps}} 0
bookmark add wave bookmark1 {{3023030 ps} {3054970 ps}} 0
bookmark add wave bookmark2 {{2187685 ps} {2199857 ps}} 33
bookmark add wave bookmark3 {{3212803 ps} {3228773 ps}} 48
