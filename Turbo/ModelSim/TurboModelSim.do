onerror {resume}
radix define sfix8 -fixed -fraction 8 -signed -base signed -precision 6
radix define sfix5 -fixed -fraction 5 -signed -base signed -precision 6
radix define sfix15 -fixed -fraction 15 -signed -base signed -precision 6
radix define sfix12 -fixed -fraction 12 -signed -base signed -precision 6
radix define sfix11 -fixed -fraction 11 -signed -base signed -precision 6
quietly WaveActivateNextPane {} 0
add wave -noupdate /turbomodelsim_tb/Vivado_tb/Rate
add wave -noupdate /turbomodelsim_tb/Vivado_tb/Frame
add wave -noupdate /turbomodelsim_tb/Vivado_tb/Gain
add wave -noupdate /turbomodelsim_tb/Vivado_tb/RateOut
add wave -noupdate /turbomodelsim_tb/Vivado_tb/IterationsOut
add wave -noupdate /turbomodelsim_tb/Vivado_tb/FrameOut
add wave -noupdate /turbomodelsim_tb/Vivado_tb/reset
add wave -noupdate /turbomodelsim_tb/Vivado_tb/GainVio
add wave -noupdate /turbomodelsim_tb/Vivado_tb/RateVio
add wave -noupdate /turbomodelsim_tb/Vivado_tb/FrameVio
add wave -noupdate /turbomodelsim_tb/Vivado_tb/ItersVio
add wave -noupdate /turbomodelsim_tb/Vivado_tb/SyncIn
add wave -noupdate /turbomodelsim_tb/Vivado_tb/ValidIn
add wave -noupdate -radix sfixed /turbomodelsim_tb/Vivado_tb/Noise
add wave -noupdate -radix sfixed /turbomodelsim_tb/Vivado_tb/Data
add wave -noupdate -format Analog-Step -height 74 -max 4445.0 -min -4523.0 -radix sfixed /turbomodelsim_tb/Vivado_tb/Sum
add wave -noupdate /turbomodelsim_tb/Vivado_tb/DF_Rom/Addr
add wave -noupdate -radix sfix11 /turbomodelsim_tb/Vivado_tb/DF_Rom/ReOut
add wave -noupdate /turbomodelsim_tb/Vivado_tb/uHat
add wave -noupdate /turbomodelsim_tb/Vivado_tb/uHatExpected(0)
add wave -noupdate /turbomodelsim_tb/Vivado_tb/ValidOut
add wave -noupdate /turbomodelsim_tb/Vivado_tb/ResetVio
add wave -noupdate /turbomodelsim_tb/Vivado_tb/SyncOut
add wave -noupdate -radix unsigned /turbomodelsim_tb/Vivado_tb/OutCntr
add wave -noupdate /turbomodelsim_tb/Vivado_tb/BerCntr
add wave -noupdate -radix unsigned /turbomodelsim_tb/Vivado_tb/BerCount
add wave -noupdate /turbomodelsim_tb/Vivado_tb/IterationCntr
add wave -noupdate /turbomodelsim_tb/Vivado_tb/ValidData
add wave -noupdate /turbomodelsim_tb/Vivado_tb/DataOut
add wave -noupdate /turbomodelsim_tb/Vivado_tb/Magnitude
add wave -noupdate -radix unsigned /turbomodelsim_tb/Vivado_tb/DfAddr
add wave -noupdate /turbomodelsim_tb/Vivado_tb/TurboDecTop/FrameFull
add wave -noupdate -radix unsigned /turbomodelsim_tb/Vivado_tb/TurboDecTop/FrameCntr
add wave -noupdate -radix sfixed -childformat {{/turbomodelsim_tb/Vivado_tb/TurboDecTop/PCIA(0) -radix sfixed} {/turbomodelsim_tb/Vivado_tb/TurboDecTop/PCIA(1) -radix sfixed} {/turbomodelsim_tb/Vivado_tb/TurboDecTop/PCIA(2) -radix sfixed} {/turbomodelsim_tb/Vivado_tb/TurboDecTop/PCIA(3) -radix sfixed} {/turbomodelsim_tb/Vivado_tb/TurboDecTop/PCIA(4) -radix sfixed} {/turbomodelsim_tb/Vivado_tb/TurboDecTop/PCIA(5) -radix sfixed} {/turbomodelsim_tb/Vivado_tb/TurboDecTop/PCIA(6) -radix sfixed} {/turbomodelsim_tb/Vivado_tb/TurboDecTop/PCIA(7) -radix sfixed} {/turbomodelsim_tb/Vivado_tb/TurboDecTop/PCIA(8) -radix sfixed} {/turbomodelsim_tb/Vivado_tb/TurboDecTop/PCIA(9) -radix sfixed} {/turbomodelsim_tb/Vivado_tb/TurboDecTop/PCIA(10) -radix sfixed} {/turbomodelsim_tb/Vivado_tb/TurboDecTop/PCIA(11) -radix sfixed} {/turbomodelsim_tb/Vivado_tb/TurboDecTop/PCIA(12) -radix sfixed} {/turbomodelsim_tb/Vivado_tb/TurboDecTop/PCIA(13) -radix sfixed} {/turbomodelsim_tb/Vivado_tb/TurboDecTop/PCIA(14) -radix sfixed} {/turbomodelsim_tb/Vivado_tb/TurboDecTop/PCIA(15) -radix sfixed}} -expand -subitemconfig {/turbomodelsim_tb/Vivado_tb/TurboDecTop/PCIA(0) {-height 15 -radix sfixed} /turbomodelsim_tb/Vivado_tb/TurboDecTop/PCIA(1) {-height 15 -radix sfixed} /turbomodelsim_tb/Vivado_tb/TurboDecTop/PCIA(2) {-height 15 -radix sfixed} /turbomodelsim_tb/Vivado_tb/TurboDecTop/PCIA(3) {-height 15 -radix sfixed} /turbomodelsim_tb/Vivado_tb/TurboDecTop/PCIA(4) {-height 15 -radix sfixed} /turbomodelsim_tb/Vivado_tb/TurboDecTop/PCIA(5) {-height 15 -radix sfixed} /turbomodelsim_tb/Vivado_tb/TurboDecTop/PCIA(6) {-height 15 -radix sfixed} /turbomodelsim_tb/Vivado_tb/TurboDecTop/PCIA(7) {-height 15 -radix sfixed} /turbomodelsim_tb/Vivado_tb/TurboDecTop/PCIA(8) {-height 15 -radix sfixed} /turbomodelsim_tb/Vivado_tb/TurboDecTop/PCIA(9) {-height 15 -radix sfixed} /turbomodelsim_tb/Vivado_tb/TurboDecTop/PCIA(10) {-height 15 -radix sfixed} /turbomodelsim_tb/Vivado_tb/TurboDecTop/PCIA(11) {-height 15 -radix sfixed} /turbomodelsim_tb/Vivado_tb/TurboDecTop/PCIA(12) {-height 15 -radix sfixed} /turbomodelsim_tb/Vivado_tb/TurboDecTop/PCIA(13) {-height 15 -radix sfixed} /turbomodelsim_tb/Vivado_tb/TurboDecTop/PCIA(14) {-height 15 -radix sfixed} /turbomodelsim_tb/Vivado_tb/TurboDecTop/PCIA(15) {-height 15 -radix sfixed}} /turbomodelsim_tb/Vivado_tb/TurboDecTop/PCIA
add wave -noupdate -radix sfixed -childformat {{/turbomodelsim_tb/Vivado_tb/TurboDecTop/PCIB(0) -radix sfixed} {/turbomodelsim_tb/Vivado_tb/TurboDecTop/PCIB(1) -radix sfixed} {/turbomodelsim_tb/Vivado_tb/TurboDecTop/PCIB(2) -radix sfixed} {/turbomodelsim_tb/Vivado_tb/TurboDecTop/PCIB(3) -radix sfixed}} -subitemconfig {/turbomodelsim_tb/Vivado_tb/TurboDecTop/PCIB(0) {-height 15 -radix sfixed} /turbomodelsim_tb/Vivado_tb/TurboDecTop/PCIB(1) {-height 15 -radix sfixed} /turbomodelsim_tb/Vivado_tb/TurboDecTop/PCIB(2) {-height 15 -radix sfixed} /turbomodelsim_tb/Vivado_tb/TurboDecTop/PCIB(3) {-height 15 -radix sfixed}} /turbomodelsim_tb/Vivado_tb/TurboDecTop/PCIB
add wave -noupdate /turbomodelsim_tb/Vivado_tb/DF_Rom/Clk
add wave -noupdate /turbomodelsim_tb/Vivado_tb/DF_Rom/Rate
add wave -noupdate /turbomodelsim_tb/Vivado_tb/DF_Rom/Frame
add wave -noupdate /turbomodelsim_tb/Vivado_tb/DF_Rom/Addr
add wave -noupdate /turbomodelsim_tb/Vivado_tb/Gain
add wave -noupdate /turbomodelsim_tb/Vivado_tb/TurboDecTop/FrontEnd/ValidIn
add wave -noupdate /turbomodelsim_tb/Vivado_tb/TurboDecTop/FrontEnd/ValidOut
add wave -noupdate -radix sfixed /turbomodelsim_tb/Vivado_tb/TurboDecTop/FrontEnd/DeRand
add wave -noupdate /turbomodelsim_tb/Vivado_tb/TurboDecTop/FrontEnd/DeRandValid
add wave -noupdate /turbomodelsim_tb/Vivado_tb/TurboDecTop/FrontEnd/RandomBit
add wave -noupdate /turbomodelsim_tb/Vivado_tb/TurboDecTop/FifoWrPntr
add wave -noupdate /turbomodelsim_tb/Vivado_tb/TurboDecTop/FifoRdPntr
add wave -noupdate /turbomodelsim_tb/Vivado_tb/TurboDecTop/NextFrame
add wave -noupdate -radix sfix12 /turbomodelsim_tb/Vivado_tb/TurboDecTop/Fifo
add wave -noupdate /turbomodelsim_tb/Vivado_tb/TurboDecTop/FifoValid
add wave -noupdate /turbomodelsim_tb/Vivado_tb/TurboDecTop/Clk31
add wave -noupdate -divider FifoA
add wave -noupdate /turbomodelsim_tb/Vivado_tb/ValidIn
add wave -noupdate -radix sfixed /turbomodelsim_tb/Vivado_tb/Sum
add wave -noupdate /turbomodelsim_tb/Vivado_tb/TurboDecTop/InputDly
add wave -noupdate /turbomodelsim_tb/Vivado_tb/TurboDecTop/ValidDly
add wave -noupdate /turbomodelsim_tb/Vivado_tb/TurboDecTop/FifoA/din
add wave -noupdate /turbomodelsim_tb/Vivado_tb/TurboDecTop/FifoA/wr_en
add wave -noupdate /turbomodelsim_tb/Vivado_tb/TurboDecTop/FifoA/wr_data_count
add wave -noupdate /turbomodelsim_tb/Vivado_tb/TurboDecTop/FifoA/wr_clk
add wave -noupdate /turbomodelsim_tb/Vivado_tb/TurboDecTop/FifoA/rd_clk
add wave -noupdate /turbomodelsim_tb/Vivado_tb/TurboDecTop/FifoA/rd_en
add wave -noupdate /turbomodelsim_tb/Vivado_tb/TurboDecTop/FifoA/empty
add wave -noupdate -radix unsigned -radixshowbase 0 /turbomodelsim_tb/Vivado_tb/TurboDecTop/FifoA/rd_data_count
add wave -noupdate /turbomodelsim_tb/Vivado_tb/TurboDecTop/FifoA/rst
add wave -noupdate /turbomodelsim_tb/Vivado_tb/TurboDecTop/FifoA/wr_rst_busy
add wave -noupdate /turbomodelsim_tb/Vivado_tb/TurboDecTop/FifoA/rd_rst_busy
add wave -noupdate -divider FifoB
add wave -noupdate /turbomodelsim_tb/Vivado_tb/TurboDecTop/FifoB/rd_en
add wave -noupdate /turbomodelsim_tb/Vivado_tb/TurboDecTop/FifoB/empty
add wave -noupdate /turbomodelsim_tb/Vivado_tb/TurboDecTop/FifoB/rd_data_count
add wave -noupdate /turbomodelsim_tb/Vivado_tb/TurboDecTop/NextFrame
add wave -noupdate /turbomodelsim_tb/Vivado_tb/TurboDecTop/Reset
add wave -noupdate /turbomodelsim_tb/Vivado_tb/TurboDecTop/FifoValid
add wave -noupdate /turbomodelsim_tb/Vivado_tb/TurboDecTop/ValidFE
add wave -noupdate /turbomodelsim_tb/Vivado_tb/TurboDecTop/FrameLast
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {11331584022 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 337
configure wave -valuecolwidth 146
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
WaveRestoreZoom {4993830 ns} {13918830 ns}
