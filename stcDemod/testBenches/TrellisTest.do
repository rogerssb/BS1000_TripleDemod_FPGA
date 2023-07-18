onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /fa_tb/STC_u/Trellis_u/fa/clk
add wave -noupdate /fa_tb/STC_u/Trellis_u/fa/clkEn
add wave -noupdate /fa_tb/STC_u/Trellis_u/fa/clkEnOut
add wave -noupdate /fa_tb/STC_u/Trellis_u/fa/clksPerOutput
add wave -noupdate /fa_tb/STC_u/Trellis_u/fa/decimationCount
add wave -noupdate /fa_tb/STC_u/Trellis_u/fa/depth
add wave -noupdate /fa_tb/STC_u/Trellis_u/fa/dinImag
add wave -noupdate /fa_tb/STC_u/Trellis_u/fa/dinReal
add wave -noupdate /fa_tb/STC_u/Trellis_u/fa/doutImag1
add wave -noupdate /fa_tb/STC_u/Trellis_u/fa/doutReal0
add wave -noupdate /fa_tb/STC_u/Trellis_u/fa/doutReal1
add wave -noupdate /fa_tb/STC_u/Trellis_u/fa/fifoRdData0
add wave -noupdate /fa_tb/STC_u/Trellis_u/fa/fifoRdData1
add wave -noupdate /fa_tb/STC_u/Trellis_u/fa/fifoWrEn
add wave -noupdate /fa_tb/STC_u/Trellis_u/fa/m_ndx0
add wave -noupdate /fa_tb/STC_u/Trellis_u/fa/m_ndx1
add wave -noupdate /fa_tb/STC_u/Trellis_u/fa/outputCount
add wave -noupdate /fa_tb/STC_u/Trellis_u/fa/outputState
add wave -noupdate /fa_tb/STC_u/Trellis_u/fa/rdAddr0
add wave -noupdate /fa_tb/STC_u/Trellis_u/fa/rdAddr0Tmp
add wave -noupdate /fa_tb/STC_u/Trellis_u/fa/rdAddr1
add wave -noupdate /fa_tb/STC_u/Trellis_u/fa/rdAddr1Tmp
add wave -noupdate /fa_tb/STC_u/Trellis_u/fa/reset
add wave -noupdate /fa_tb/STC_u/Trellis_u/fa/sampleCount
add wave -noupdate /fa_tb/STC_u/Trellis_u/fa/TwoClksPerTrellis
add wave -noupdate /fa_tb/STC_u/Trellis_u/fa/valid
add wave -noupdate /fa_tb/STC_u/Trellis_u/fa/myStartOfTrellis
add wave -noupdate /fa_tb/STC_u/Trellis_u/fa/rdAddr
add wave -noupdate /fa_tb/STC_u/Trellis_u/fa/sofDetected
add wave -noupdate /fa_tb/STC_u/Trellis_u/fa/startOfFrame
add wave -noupdate /fa_tb/STC_u/Trellis_u/fa/wrAddr
add wave -noupdate -divider {New Divider}
add wave -noupdate /fa_tb/STC_u/Trellis_u/faFifo/myReset
add wave -noupdate /fa_tb/STC_u/Trellis_u/fa/interpolate
add wave -noupdate /fa_tb/STC_u/Trellis_u/faFifo/interpolate
add wave -noupdate -height 25 /fa_tb/STC_u/Trellis_u/fa/doutImag0
add wave -noupdate /fa_tb/STC_u/Trellis_u/faFifo/doutImag0
add wave -noupdate /fa_tb/STC_u/Trellis_u/fa/fifoRdEn
add wave -noupdate /fa_tb/STC_u/Trellis_u/faFifo/fifoRdEn
add wave -noupdate /fa_tb/STC_u/Trellis_u/fa/estimatesDone
add wave -noupdate /fa_tb/STC_u/Trellis_u/faFifo/estimatesDone
add wave -noupdate /fa_tb/STC_u/Trellis_u/faFifo/estimateFound
add wave -noupdate /fa_tb/STC_u/Trellis_u/fa/fifoOutputValid
add wave -noupdate /fa_tb/STC_u/Trellis_u/faFifo/fifoOutputValid
add wave -noupdate /fa_tb/STC_u/Trellis_u/fa/lastSample
add wave -noupdate /fa_tb/STC_u/Trellis_u/fa/lastSamplesAvailable
add wave -noupdate /fa_tb/STC_u/Trellis_u/faFifo/lastSample
add wave -noupdate /fa_tb/STC_u/Trellis_u/faFifo/myStartOfTrellis
add wave -noupdate /fa_tb/STC_u/Trellis_u/faFifo/rdAddr
add wave -noupdate /fa_tb/STC_u/Trellis_u/faFifo/sofDetected
add wave -noupdate /fa_tb/STC_u/Trellis_u/faFifo/startFound
add wave -noupdate /fa_tb/STC_u/Trellis_u/faFifo/startOfFrame
add wave -noupdate /fa_tb/STC_u/Trellis_u/faFifo/startOfTrellis
add wave -noupdate /fa_tb/STC_u/Trellis_u/faFifo/syncTime
add wave -noupdate -format Analog-Step -height 80 -max 130.0 /fa_tb/STC_u/Trellis_u/fa/trellisInitCnt
add wave -noupdate -format Analog-Step -height 80 -max 130.0 /fa_tb/STC_u/Trellis_u/faFifo/trellisInitCnt
add wave -noupdate -format Analog-Step -height 80 -max 16386.0 -radix unsigned /fa_tb/STC_u/Trellis_u/faFifo/depth
add wave -noupdate /fa_tb/STC_u/Trellis_u/faFifo/wrAddr
add wave -noupdate /fa_tb/DataRate
add wave -noupdate /fa_tb/STC_u/Trellis_u/faFifo/almostEmpty
add wave -noupdate /fa_tb/STC_u/Trellis_u/faFifo/clk
add wave -noupdate /fa_tb/STC_u/Trellis_u/faFifo/clkEn
add wave -noupdate /fa_tb/STC_u/Trellis_u/faFifo/clkEnOut
add wave -noupdate /fa_tb/STC_u/Trellis_u/faFifo/clksPerOutput
add wave -noupdate /fa_tb/STC_u/Trellis_u/faFifo/decimationCount
add wave -noupdate /fa_tb/STC_u/Trellis_u/faFifo/delayLine
add wave -noupdate /fa_tb/STC_u/Trellis_u/faFifo/dinImag
add wave -noupdate /fa_tb/STC_u/Trellis_u/faFifo/dinReal
add wave -noupdate /fa_tb/STC_u/Trellis_u/faFifo/doutImag1
add wave -noupdate /fa_tb/STC_u/Trellis_u/faFifo/doutReal0
add wave -noupdate /fa_tb/STC_u/Trellis_u/faFifo/doutReal1
add wave -noupdate /fa_tb/STC_u/Trellis_u/faFifo/fifoOut
add wave -noupdate /fa_tb/STC_u/Trellis_u/faFifo/fifoWrEn
add wave -noupdate /fa_tb/STC_u/Trellis_u/faFifo/i
add wave -noupdate /fa_tb/STC_u/Trellis_u/faFifo/index0
add wave -noupdate /fa_tb/STC_u/Trellis_u/faFifo/index1
add wave -noupdate /fa_tb/STC_u/Trellis_u/faFifo/m_ndx0
add wave -noupdate /fa_tb/STC_u/Trellis_u/faFifo/m_ndx1
add wave -noupdate /fa_tb/STC_u/Trellis_u/faFifo/outputCount
add wave -noupdate /fa_tb/STC_u/Trellis_u/faFifo/outputState
add wave -noupdate /fa_tb/STC_u/Trellis_u/faFifo/outRealImag0
add wave -noupdate /fa_tb/STC_u/Trellis_u/faFifo/outRealImag1
add wave -noupdate /fa_tb/STC_u/Trellis_u/faFifo/reset
add wave -noupdate /fa_tb/STC_u/Trellis_u/faFifo/sampleCount
add wave -noupdate /fa_tb/STC_u/Trellis_u/faFifo/TwoClksPerTrellis
add wave -noupdate /fa_tb/STC_u/Trellis_u/faFifo/valid
add wave -noupdate -format Analog-Step -height 80 -max 2537.0 /fa_tb/STC_u/PD_u/AbsCntr0
add wave -noupdate /fa_tb/STC_u/Trellis_u/inCount
add wave -noupdate /fa_tb/STC_u/Trellis_u/dfCount
add wave -noupdate /fa_tb/STC_u/Trellis_u/faCount
add wave -noupdate /fa_tb/STC_u/Trellis_u/outCount
add wave -noupdate /fa_tb/STC_u/Trellis_u/tdCount
add wave -noupdate /fa_tb/STC_u/ResampleI
add wave -noupdate -format Analog-Step -max 1.0 /fa_tb/Accum
add wave -noupdate /fa_tb/clk93
add wave -noupdate /fa_tb/Valid
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {596167906 ps} 0} {{Cursor 3} {4352719380 ps} 0}
quietly wave cursor active 2
configure wave -namecolwidth 410
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
WaveRestoreZoom {3950493644 ps} {5173511272 ps}
bookmark add wave bookmark0 {{2508730 ps} {2540670 ps}} 0
bookmark add wave bookmark1 {{3023030 ps} {3054970 ps}} 0
bookmark add wave bookmark2 {{2187685 ps} {2199857 ps}} 33
bookmark add wave bookmark3 {{3212803 ps} {3228773 ps}} 48
