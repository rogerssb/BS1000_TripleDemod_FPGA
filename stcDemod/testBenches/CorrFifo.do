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
add wave -noupdate /brik1_tb/Brik1u/ValidIn
add wave -noupdate -radix s18_17 /brik1_tb/Brik1u/IfIn
add wave -noupdate -radix s18_17 /brik1_tb/Brik1u/Re
add wave -noupdate -radix s18_17 /brik1_tb/Brik1u/Im
add wave -noupdate /brik1_tb/Brik1u/ValidOut
add wave -noupdate /brik1_tb/Brik1u/DDC_Valid
add wave -noupdate -radix s18_17 /brik1_tb/Brik1u/DDC_Re
add wave -noupdate -radix s18_17 /brik1_tb/Brik1u/DecRe
add wave -noupdate -radix s18_17 -childformat {{/brik1_tb/VarsComp0(0)(17) -radix s18_17} {/brik1_tb/VarsComp0(0)(16) -radix s18_17} {/brik1_tb/VarsComp0(0)(15) -radix s18_17} {/brik1_tb/VarsComp0(0)(14) -radix s18_17} {/brik1_tb/VarsComp0(0)(13) -radix s18_17} {/brik1_tb/VarsComp0(0)(12) -radix s18_17} {/brik1_tb/VarsComp0(0)(11) -radix s18_17} {/brik1_tb/VarsComp0(0)(10) -radix s18_17} {/brik1_tb/VarsComp0(0)(9) -radix s18_17} {/brik1_tb/VarsComp0(0)(8) -radix s18_17} {/brik1_tb/VarsComp0(0)(7) -radix s18_17} {/brik1_tb/VarsComp0(0)(6) -radix s18_17} {/brik1_tb/VarsComp0(0)(5) -radix s18_17} {/brik1_tb/VarsComp0(0)(4) -radix s18_17} {/brik1_tb/VarsComp0(0)(3) -radix s18_17} {/brik1_tb/VarsComp0(0)(2) -radix s18_17} {/brik1_tb/VarsComp0(0)(1) -radix s18_17} {/brik1_tb/VarsComp0(0)(0) -radix s18_17}} -subitemconfig {/brik1_tb/VarsComp0(0)(17) {-height 15 -radix s18_17} /brik1_tb/VarsComp0(0)(16) {-height 15 -radix s18_17} /brik1_tb/VarsComp0(0)(15) {-height 15 -radix s18_17} /brik1_tb/VarsComp0(0)(14) {-height 15 -radix s18_17} /brik1_tb/VarsComp0(0)(13) {-height 15 -radix s18_17} /brik1_tb/VarsComp0(0)(12) {-height 15 -radix s18_17} /brik1_tb/VarsComp0(0)(11) {-height 15 -radix s18_17} /brik1_tb/VarsComp0(0)(10) {-height 15 -radix s18_17} /brik1_tb/VarsComp0(0)(9) {-height 15 -radix s18_17} /brik1_tb/VarsComp0(0)(8) {-height 15 -radix s18_17} /brik1_tb/VarsComp0(0)(7) {-height 15 -radix s18_17} /brik1_tb/VarsComp0(0)(6) {-height 15 -radix s18_17} /brik1_tb/VarsComp0(0)(5) {-height 15 -radix s18_17} /brik1_tb/VarsComp0(0)(4) {-height 15 -radix s18_17} /brik1_tb/VarsComp0(0)(3) {-height 15 -radix s18_17} /brik1_tb/VarsComp0(0)(2) {-height 15 -radix s18_17} /brik1_tb/VarsComp0(0)(1) {-height 15 -radix s18_17} /brik1_tb/VarsComp0(0)(0) {-height 15 -radix s18_17}} /brik1_tb/VarsComp0(0)
add wave -noupdate -radix sfixed -childformat {{/brik1_tb/CompareReal/RefValue(0)(1) -radix s18_17} {/brik1_tb/CompareReal/RefValue(0)(0) -radix s18_17} {/brik1_tb/CompareReal/RefValue(0)(-1) -radix s18_17} {/brik1_tb/CompareReal/RefValue(0)(-2) -radix s18_17} {/brik1_tb/CompareReal/RefValue(0)(-3) -radix s18_17} {/brik1_tb/CompareReal/RefValue(0)(-4) -radix s18_17} {/brik1_tb/CompareReal/RefValue(0)(-5) -radix s18_17} {/brik1_tb/CompareReal/RefValue(0)(-6) -radix s18_17} {/brik1_tb/CompareReal/RefValue(0)(-7) -radix s18_17} {/brik1_tb/CompareReal/RefValue(0)(-8) -radix s18_17} {/brik1_tb/CompareReal/RefValue(0)(-9) -radix s18_17} {/brik1_tb/CompareReal/RefValue(0)(-10) -radix s18_17} {/brik1_tb/CompareReal/RefValue(0)(-11) -radix s18_17} {/brik1_tb/CompareReal/RefValue(0)(-12) -radix s18_17} {/brik1_tb/CompareReal/RefValue(0)(-13) -radix s18_17} {/brik1_tb/CompareReal/RefValue(0)(-14) -radix s18_17} {/brik1_tb/CompareReal/RefValue(0)(-15) -radix s18_17} {/brik1_tb/CompareReal/RefValue(0)(-16) -radix s18_17} {/brik1_tb/CompareReal/RefValue(0)(-17) -radix s18_17}} -subitemconfig {/brik1_tb/CompareReal/RefValue(0)(1) {-height 15 -radix s18_17} /brik1_tb/CompareReal/RefValue(0)(0) {-height 15 -radix s18_17} /brik1_tb/CompareReal/RefValue(0)(-1) {-height 15 -radix s18_17} /brik1_tb/CompareReal/RefValue(0)(-2) {-height 15 -radix s18_17} /brik1_tb/CompareReal/RefValue(0)(-3) {-height 15 -radix s18_17} /brik1_tb/CompareReal/RefValue(0)(-4) {-height 15 -radix s18_17} /brik1_tb/CompareReal/RefValue(0)(-5) {-height 15 -radix s18_17} /brik1_tb/CompareReal/RefValue(0)(-6) {-height 15 -radix s18_17} /brik1_tb/CompareReal/RefValue(0)(-7) {-height 15 -radix s18_17} /brik1_tb/CompareReal/RefValue(0)(-8) {-height 15 -radix s18_17} /brik1_tb/CompareReal/RefValue(0)(-9) {-height 15 -radix s18_17} /brik1_tb/CompareReal/RefValue(0)(-10) {-height 15 -radix s18_17} /brik1_tb/CompareReal/RefValue(0)(-11) {-height 15 -radix s18_17} /brik1_tb/CompareReal/RefValue(0)(-12) {-height 15 -radix s18_17} /brik1_tb/CompareReal/RefValue(0)(-13) {-height 15 -radix s18_17} /brik1_tb/CompareReal/RefValue(0)(-14) {-height 15 -radix s18_17} /brik1_tb/CompareReal/RefValue(0)(-15) {-height 15 -radix s18_17} /brik1_tb/CompareReal/RefValue(0)(-16) {-height 15 -radix s18_17} /brik1_tb/CompareReal/RefValue(0)(-17) {-height 15 -radix s18_17}} /brik1_tb/CompareReal/RefValue(0)
add wave -noupdate -radix sfixed -childformat {{/brik1_tb/CompareReal/Errors(0)(14) -radix s18_17} {/brik1_tb/CompareReal/Errors(0)(13) -radix s18_17} {/brik1_tb/CompareReal/Errors(0)(12) -radix s18_17} {/brik1_tb/CompareReal/Errors(0)(11) -radix s18_17} {/brik1_tb/CompareReal/Errors(0)(10) -radix s18_17} {/brik1_tb/CompareReal/Errors(0)(9) -radix s18_17} {/brik1_tb/CompareReal/Errors(0)(8) -radix s18_17} {/brik1_tb/CompareReal/Errors(0)(7) -radix s18_17} {/brik1_tb/CompareReal/Errors(0)(6) -radix s18_17} {/brik1_tb/CompareReal/Errors(0)(5) -radix s18_17} {/brik1_tb/CompareReal/Errors(0)(4) -radix s18_17} {/brik1_tb/CompareReal/Errors(0)(3) -radix s18_17} {/brik1_tb/CompareReal/Errors(0)(2) -radix s18_17} {/brik1_tb/CompareReal/Errors(0)(1) -radix s18_17} {/brik1_tb/CompareReal/Errors(0)(0) -radix s18_17} {/brik1_tb/CompareReal/Errors(0)(-1) -radix s18_17} {/brik1_tb/CompareReal/Errors(0)(-2) -radix s18_17} {/brik1_tb/CompareReal/Errors(0)(-3) -radix s18_17} {/brik1_tb/CompareReal/Errors(0)(-4) -radix s18_17} {/brik1_tb/CompareReal/Errors(0)(-5) -radix s18_17} {/brik1_tb/CompareReal/Errors(0)(-6) -radix s18_17} {/brik1_tb/CompareReal/Errors(0)(-7) -radix s18_17} {/brik1_tb/CompareReal/Errors(0)(-8) -radix s18_17} {/brik1_tb/CompareReal/Errors(0)(-9) -radix s18_17} {/brik1_tb/CompareReal/Errors(0)(-10) -radix s18_17} {/brik1_tb/CompareReal/Errors(0)(-11) -radix s18_17} {/brik1_tb/CompareReal/Errors(0)(-12) -radix s18_17} {/brik1_tb/CompareReal/Errors(0)(-13) -radix s18_17} {/brik1_tb/CompareReal/Errors(0)(-14) -radix s18_17} {/brik1_tb/CompareReal/Errors(0)(-15) -radix s18_17} {/brik1_tb/CompareReal/Errors(0)(-16) -radix s18_17} {/brik1_tb/CompareReal/Errors(0)(-17) -radix s18_17}} -subitemconfig {/brik1_tb/CompareReal/Errors(0)(14) {-height 15 -radix s18_17} /brik1_tb/CompareReal/Errors(0)(13) {-height 15 -radix s18_17} /brik1_tb/CompareReal/Errors(0)(12) {-height 15 -radix s18_17} /brik1_tb/CompareReal/Errors(0)(11) {-height 15 -radix s18_17} /brik1_tb/CompareReal/Errors(0)(10) {-height 15 -radix s18_17} /brik1_tb/CompareReal/Errors(0)(9) {-height 15 -radix s18_17} /brik1_tb/CompareReal/Errors(0)(8) {-height 15 -radix s18_17} /brik1_tb/CompareReal/Errors(0)(7) {-height 15 -radix s18_17} /brik1_tb/CompareReal/Errors(0)(6) {-height 15 -radix s18_17} /brik1_tb/CompareReal/Errors(0)(5) {-height 15 -radix s18_17} /brik1_tb/CompareReal/Errors(0)(4) {-height 15 -radix s18_17} /brik1_tb/CompareReal/Errors(0)(3) {-height 15 -radix s18_17} /brik1_tb/CompareReal/Errors(0)(2) {-height 15 -radix s18_17} /brik1_tb/CompareReal/Errors(0)(1) {-height 15 -radix s18_17} /brik1_tb/CompareReal/Errors(0)(0) {-height 15 -radix s18_17} /brik1_tb/CompareReal/Errors(0)(-1) {-height 15 -radix s18_17} /brik1_tb/CompareReal/Errors(0)(-2) {-height 15 -radix s18_17} /brik1_tb/CompareReal/Errors(0)(-3) {-height 15 -radix s18_17} /brik1_tb/CompareReal/Errors(0)(-4) {-height 15 -radix s18_17} /brik1_tb/CompareReal/Errors(0)(-5) {-height 15 -radix s18_17} /brik1_tb/CompareReal/Errors(0)(-6) {-height 15 -radix s18_17} /brik1_tb/CompareReal/Errors(0)(-7) {-height 15 -radix s18_17} /brik1_tb/CompareReal/Errors(0)(-8) {-height 15 -radix s18_17} /brik1_tb/CompareReal/Errors(0)(-9) {-height 15 -radix s18_17} /brik1_tb/CompareReal/Errors(0)(-10) {-height 15 -radix s18_17} /brik1_tb/CompareReal/Errors(0)(-11) {-height 15 -radix s18_17} /brik1_tb/CompareReal/Errors(0)(-12) {-height 15 -radix s18_17} /brik1_tb/CompareReal/Errors(0)(-13) {-height 15 -radix s18_17} /brik1_tb/CompareReal/Errors(0)(-14) {-height 15 -radix s18_17} /brik1_tb/CompareReal/Errors(0)(-15) {-height 15 -radix s18_17} /brik1_tb/CompareReal/Errors(0)(-16) {-height 15 -radix s18_17} /brik1_tb/CompareReal/Errors(0)(-17) {-height 15 -radix s18_17}} /brik1_tb/CompareReal/Errors(0)
add wave -noupdate -radix s18_17 /brik1_tb/Brik1u/DDC_Im
add wave -noupdate -radix s18_17 /brik1_tb/Brik1u/DecIm
add wave -noupdate -radix s18_17 /brik1_tb/VarsComp1(0)
add wave -noupdate -radix s18_17 /brik1_tb/CompareImag/RefValue(0)
add wave -noupdate -radix sfixed /brik1_tb/CompareImag/Errors(0)
add wave -noupdate /brik1_tb/Brik1u/DecValid
add wave -noupdate -radix unsigned /brik1_tb/Brik1u/DDC_Count
add wave -noupdate -radix unsigned /brik1_tb/Brik1u/DecCount
add wave -noupdate /brik1_tb/Brik1u/CorFifoStart
add wave -noupdate /brik1_tb/Brik1u/CorFifoRe
add wave -noupdate /brik1_tb/Brik1u/CorFifoIm
add wave -noupdate /brik1_tb/Brik1u/CorFifo_u/FIFO_WIDTH
add wave -noupdate /brik1_tb/Brik1u/CorFifo_u/clk
add wave -noupdate /brik1_tb/Brik1u/CorFifo_u/reset
add wave -noupdate /brik1_tb/Brik1u/CorFifo_u/ce
add wave -noupdate /brik1_tb/Brik1u/CorFifo_u/ReIn
add wave -noupdate /brik1_tb/Brik1u/CorFifo_u/ImIn
add wave -noupdate /brik1_tb/Brik1u/CorFifo_u/Push
add wave -noupdate /brik1_tb/Brik1u/CorFifo_u/ReOut
add wave -noupdate /brik1_tb/Brik1u/CorFifo_u/ImOut
add wave -noupdate /brik1_tb/Brik1u/CorFifo_u/Start
add wave -noupdate /brik1_tb/Brik1u/CorFifo_u/Pop
add wave -noupdate /brik1_tb/Brik1u/CorFifo_u/PopReg
add wave -noupdate /brik1_tb/Brik1u/CorFifo_u/RdAddr
add wave -noupdate /brik1_tb/Brik1u/CorFifo_u/WrAddr
add wave -noupdate /brik1_tb/Brik1u/CorFifo_u/Depth
add wave -noupdate /brik1_tb/Brik1u/CorFifo_u/PopCount
add wave -noupdate /brik1_tb/Brik1u/CorFifo_u/ReFifoOut
add wave -noupdate /brik1_tb/Brik1u/CorFifo_u/ReFifoLast
add wave -noupdate /brik1_tb/Brik1u/CorFifo_u/ImFifoOut
add wave -noupdate /brik1_tb/Brik1u/CorFifo_u/ImFifoLast
add wave -noupdate /brik1_tb/Brik1u/CorFifo_u/ReFifo_u/LATENCY
add wave -noupdate /brik1_tb/Brik1u/CorFifo_u/ReFifo_u/DATA_WIDTH
add wave -noupdate /brik1_tb/Brik1u/CorFifo_u/ReFifo_u/ADDR_WIDTH
add wave -noupdate /brik1_tb/Brik1u/CorFifo_u/ReFifo_u/clk
add wave -noupdate /brik1_tb/Brik1u/CorFifo_u/ReFifo_u/ce
add wave -noupdate /brik1_tb/Brik1u/CorFifo_u/ReFifo_u/reset
add wave -noupdate /brik1_tb/Brik1u/CorFifo_u/ReFifo_u/WrEn
add wave -noupdate /brik1_tb/Brik1u/CorFifo_u/ReFifo_u/WrDin
add wave -noupdate /brik1_tb/Brik1u/CorFifo_u/ReFifo_u/WrAddr
add wave -noupdate /brik1_tb/Brik1u/CorFifo_u/ReFifo_u/RdAddr
add wave -noupdate /brik1_tb/Brik1u/CorFifo_u/ReFifo_u/RdOut
add wave -noupdate /brik1_tb/Brik1u/CorFifo_u/ReFifo_u/RdOutLatch
add wave -noupdate /brik1_tb/Brik1u/CorFifo_u/ReFifo_u/DistRam
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {2321202 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 297
configure wave -valuecolwidth 109
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
WaveRestoreZoom {2338616 ps} {2350600 ps}
