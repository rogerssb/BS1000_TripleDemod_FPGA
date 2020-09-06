onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /trellisilatb/Trellis_u/sample0i
add wave -noupdate /trellisilatb/StartIn
add wave -noupdate /trellisilatb/DataValid
add wave -noupdate /trellisilatb/ImagRead
add wave -noupdate /trellisilatb/RealRead
add wave -noupdate -radix hexadecimal /trellisilatb/PrnError
add wave -noupdate /trellisilatb/PrnErrors
add wave -noupdate /trellisilatb/RdAddr_i
add wave -noupdate /trellisilatb/DeltaTauEst
add wave -noupdate /trellisilatb/EstimatesDone
add wave -noupdate /trellisilatb/EstimatesDoneDly
add wave -noupdate /trellisilatb/Frequency
add wave -noupdate /trellisilatb/H0EstI
add wave -noupdate /trellisilatb/H0EstR
add wave -noupdate /trellisilatb/H0Mag
add wave -noupdate /trellisilatb/H0Mag_u
add wave -noupdate /trellisilatb/H0Phase
add wave -noupdate /trellisilatb/H1EstI
add wave -noupdate /trellisilatb/H1EstR
add wave -noupdate /trellisilatb/H1Mag
add wave -noupdate /trellisilatb/H1Mag_u
add wave -noupdate /trellisilatb/H1Phase
add wave -noupdate /trellisilatb/Locked
add wave -noupdate /trellisilatb/Mag0GtMag1
add wave -noupdate /trellisilatb/Reset
add wave -noupdate /trellisilatb/TwoClksPerTrellis
add wave -noupdate /trellisilatb/ValidCount
add wave -noupdate /trellisilatb/ValidInDly
add wave -noupdate /trellisilatb/m_ndx0
add wave -noupdate /trellisilatb/m_ndx0slv
add wave -noupdate /trellisilatb/m_ndx1
add wave -noupdate /trellisilatb/m_ndx1slv
add wave -noupdate /trellisilatb/Trellis_u/fa/TwoClksPerTrellis
add wave -noupdate /trellisilatb/Trellis_u/fa/clk
add wave -noupdate /trellisilatb/Trellis_u/fa/clkEn
add wave -noupdate /trellisilatb/Trellis_u/fa/clkEnOut
add wave -noupdate /trellisilatb/Trellis_u/fa/clksPerOutput
add wave -noupdate -radix decimal /trellisilatb/Trellis_u/fa/depth
add wave -noupdate -radix unsigned /trellisilatb/Trellis_u/fa/wrAddr
add wave -noupdate -radix unsigned /trellisilatb/Trellis_u/fa/rdAddr
add wave -noupdate -radix unsigned /trellisilatb/Trellis_u/fa/rdAddr0
add wave -noupdate -radix unsigned /trellisilatb/Trellis_u/fa/rdAddr1
add wave -noupdate /trellisilatb/TrellisBits
add wave -noupdate /trellisilatb/TrellisOutEn
add wave -noupdate -radix unsigned /trellisilatb/Trellis_u/fa/rdAddr0Tmp
add wave -noupdate -radix unsigned /trellisilatb/Trellis_u/fa/rdAddr1Tmp
add wave -noupdate /trellisilatb/Trellis_u/fa/decimationCount
add wave -noupdate -radix decimal -radixshowbase 0 /trellisilatb/Trellis_u/fa/dinImag
add wave -noupdate /trellisilatb/Trellis_u/fa/dinReal
add wave -noupdate /trellisilatb/Trellis_u/fa/doutImag0
add wave -noupdate /trellisilatb/Trellis_u/fa/doutImag1
add wave -noupdate /trellisilatb/Trellis_u/fa/doutReal0
add wave -noupdate /trellisilatb/Trellis_u/fa/doutReal1
add wave -noupdate /trellisilatb/Trellis_u/fa/estimatesDone
add wave -noupdate /trellisilatb/Trellis_u/fa/fifoOutputValid
add wave -noupdate /trellisilatb/Trellis_u/fa/fifoRdData0
add wave -noupdate /trellisilatb/Trellis_u/fa/fifoRdData1
add wave -noupdate /trellisilatb/Trellis_u/fa/fifoRdEn
add wave -noupdate /trellisilatb/Trellis_u/fa/fifoWrEn
add wave -noupdate /trellisilatb/Trellis_u/fa/interpolate
add wave -noupdate /trellisilatb/Trellis_u/fa/lastSample
add wave -noupdate /trellisilatb/Trellis_u/fa/m_ndx0
add wave -noupdate /trellisilatb/Trellis_u/fa/m_ndx1
add wave -noupdate /trellisilatb/Trellis_u/fa/myStartOfTrellis
add wave -noupdate /trellisilatb/Trellis_u/fa/outputCount
add wave -noupdate /trellisilatb/Trellis_u/fa/outputState
add wave -noupdate /trellisilatb/Trellis_u/fa/reset
add wave -noupdate /trellisilatb/Trellis_u/fa/sampleCount
add wave -noupdate /trellisilatb/Trellis_u/fa/sofDetected
add wave -noupdate /trellisilatb/Trellis_u/fa/startOfFrame
add wave -noupdate /trellisilatb/Trellis_u/fa/trellisInitCnt
add wave -noupdate /trellisilatb/Trellis_u/fa/valid
add wave -noupdate /trellisilatb/Trellis_u/faClkEn
add wave -noupdate /trellisilatb/Trellis_u/faImag0
add wave -noupdate /trellisilatb/Trellis_u/faImag1
add wave -noupdate /trellisilatb/Trellis_u/faReal0
add wave -noupdate /trellisilatb/Trellis_u/faReal1
add wave -noupdate /trellisilatb/Trellis_u/interpOutEn
add wave -noupdate /trellisilatb/Trellis_u/interpolate
add wave -noupdate /trellisilatb/Trellis_u/lastSampleReset
add wave -noupdate /trellisilatb/Trellis_u/sample0i
add wave -noupdate /trellisilatb/Trellis_u/sample0r
add wave -noupdate /trellisilatb/Trellis_u/sample1i
add wave -noupdate /trellisilatb/Trellis_u/sample1r
add wave -noupdate /trellisilatb/Trellis_u/sampleOut
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1594658831 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 243
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
WaveRestoreZoom {1594434523 ps} {1594883139 ps}
bookmark add wave bookmark0 {{2508730 ps} {2540670 ps}} 0
bookmark add wave bookmark1 {{3023030 ps} {3054970 ps}} 0
bookmark add wave bookmark2 {{2187685 ps} {2199857 ps}} 33
bookmark add wave bookmark3 {{3212803 ps} {3228773 ps}} 48
