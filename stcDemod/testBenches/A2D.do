onerror {resume}
radix define s17 -fixed -fraction 17 -signed -base signed -precision 6
radix define FLoat16 -fixed -fraction 27 -signed -base signed -precision 6
radix define s24 -fixed -fraction 24 -signed -base signed -precision 6
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
radix define s18_17 -fixed -fraction 17 -signed -base signed -precision 6
radix define s31 -fixed -fraction 31 -signed -precision 6
radix define fixed#5#decimal#signed -fixed -fraction 5 -signed -base signed -precision 6
radix define fixed#17#decimal#signed -fixed -fraction 17 -signed -base signed -precision 6
radix define s18 -fixed -fraction 18 -signed -base signed -precision 6
radix define s19 -fixed -fraction 19 -signed -base signed -precision 6
radix define s20 -fixed -fraction 20 -signed -base signed -precision 6
radix define s21 -fixed -fraction 21 -signed -base signed -precision 6
radix define s22 -fixed -fraction 22 -signed -base signed -precision 6
radix define s23 -fixed -fraction 23 -signed -base signed -precision 6
radix define s25 -fixed -fraction 25 -signed -base signed -precision 6
radix define s26 -fixed -fraction 26 -signed -base signed -precision 6
radix define s27 -fixed -fraction 27 -signed -base signed -precision 6
radix define float -fixed -fraction 27 -signed -base signed -precision 6
radix define float_1k -fixed -fraction 21 -signed -base signed -precision 6
radix define float_4k -fixed -fraction 19 -signed -base signed -precision 6
radix define float_64k -fixed -fraction 15 -signed -base signed -precision 6
radix define float_1m -fixed -fraction 11 -signed -base signed -precision 6
radix define float_1b -fixed -fraction 1 -signed -base signed -precision 6
radix define fixed#17#decimal -fixed -fraction 17 -base signed -precision 6
quietly virtual signal -install /a2d_tb/dut/A2D_In { /a2d_tb/dut/A2D_In/DdrData(17 downto 2)} Outs
quietly virtual signal -install /a2d_tb { (context /a2d_tb )( Data(15) & Data(13) & Data(11) & Data(9) & Data(7) & Data(5) & Data(3) & Data(1) )} Odds
quietly virtual signal -install /a2d_tb { (context /a2d_tb )( Data(14) & Data(12) & Data(10) & Data(8) & Data(6) & Data(4) & Data(2) & Data(0) )} Evens
quietly virtual signal -install /a2d_tb/dut/A2D_In { /a2d_tb/dut/A2D_In/a2d_data(17 downto 2)} Outs001
quietly virtual signal -install /a2d_tb/dut/A2D_In { (context /a2d_tb/dut/A2D_In )( a2d_data(17) & a2d_data(15) & a2d_data(13) & a2d_data(11) & a2d_data(9) & a2d_data(7) & a2d_data(5) & a2d_data(3) )} OddOut
quietly virtual signal -install /a2d_tb/dut/A2D_In { (context /a2d_tb/dut/A2D_In )( a2d_data(16) & a2d_data(14) & a2d_data(12) & a2d_data(10) & a2d_data(8) & a2d_data(6) & a2d_data(4) & a2d_data(2) )} EvenOut
quietly WaveActivateNextPane {} 0
add wave -noupdate /a2d_tb/reset_in
add wave -noupdate /a2d_tb/adc_clk_p
add wave -noupdate /a2d_tb/adc_clk_n
add wave -noupdate -radix hexadecimal -childformat {{/a2d_tb/Data(15) -radix hexadecimal} {/a2d_tb/Data(14) -radix hexadecimal} {/a2d_tb/Data(13) -radix hexadecimal} {/a2d_tb/Data(12) -radix hexadecimal} {/a2d_tb/Data(11) -radix hexadecimal} {/a2d_tb/Data(10) -radix hexadecimal} {/a2d_tb/Data(9) -radix hexadecimal} {/a2d_tb/Data(8) -radix hexadecimal} {/a2d_tb/Data(7) -radix hexadecimal} {/a2d_tb/Data(6) -radix hexadecimal} {/a2d_tb/Data(5) -radix hexadecimal} {/a2d_tb/Data(4) -radix hexadecimal} {/a2d_tb/Data(3) -radix hexadecimal} {/a2d_tb/Data(2) -radix hexadecimal} {/a2d_tb/Data(1) -radix hexadecimal} {/a2d_tb/Data(0) -radix hexadecimal}} -expand -subitemconfig {/a2d_tb/Data(15) {-height 15 -radix hexadecimal} /a2d_tb/Data(14) {-height 15 -radix hexadecimal} /a2d_tb/Data(13) {-height 15 -radix hexadecimal} /a2d_tb/Data(12) {-height 15 -radix hexadecimal} /a2d_tb/Data(11) {-height 15 -radix hexadecimal} /a2d_tb/Data(10) {-height 15 -radix hexadecimal} /a2d_tb/Data(9) {-height 15 -radix hexadecimal} /a2d_tb/Data(8) {-height 15 -radix hexadecimal} /a2d_tb/Data(7) {-height 15 -radix hexadecimal} /a2d_tb/Data(6) {-height 15 -radix hexadecimal} /a2d_tb/Data(5) {-height 15 -radix hexadecimal} /a2d_tb/Data(4) {-height 15 -radix hexadecimal} /a2d_tb/Data(3) {-height 15 -radix hexadecimal} /a2d_tb/Data(2) {-height 15 -radix hexadecimal} /a2d_tb/Data(1) {-height 15 -radix hexadecimal} /a2d_tb/Data(0) {-height 15 -radix hexadecimal}} /a2d_tb/Data
add wave -noupdate -radix hexadecimal /a2d_tb/Odds
add wave -noupdate -radix hexadecimal /a2d_tb/Evens
add wave -noupdate -radix hexadecimal /a2d_tb/adc_data_in_p
add wave -noupdate -radix hexadecimal /a2d_tb/adc_data_in_n
add wave -noupdate /a2d_tb/dut/adc_clk_p
add wave -noupdate /a2d_tb/dut/adc_clk_n
add wave -noupdate -radix hexadecimal /a2d_tb/dut/adc_data_in_p
add wave -noupdate -radix hexadecimal /a2d_tb/dut/adc_data_in_n
add wave -noupdate /a2d_tb/dut/Clk93P
add wave -noupdate /a2d_tb/dut/Clk93N
add wave -noupdate /a2d_tb/dut/reset
add wave -noupdate -radix hexadecimal /a2d_tb/dut/a2d_data
add wave -noupdate /a2d_tb/dut/A2D_In/clk_93_p
add wave -noupdate /a2d_tb/dut/A2D_In/clk_93_n
add wave -noupdate -radix hexadecimal /a2d_tb/dut/A2D_In/adc_data_in_p
add wave -noupdate -radix hexadecimal /a2d_tb/dut/A2D_In/adc_data_in_n
add wave -noupdate -radix hexadecimal /a2d_tb/dut/A2D_In/ddr
add wave -noupdate -radix hexadecimal -childformat {{/a2d_tb/dut/A2D_In/DdrData(17) -radix hexadecimal} {/a2d_tb/dut/A2D_In/DdrData(16) -radix hexadecimal} {/a2d_tb/dut/A2D_In/DdrData(15) -radix hexadecimal} {/a2d_tb/dut/A2D_In/DdrData(14) -radix hexadecimal} {/a2d_tb/dut/A2D_In/DdrData(13) -radix hexadecimal} {/a2d_tb/dut/A2D_In/DdrData(12) -radix hexadecimal} {/a2d_tb/dut/A2D_In/DdrData(11) -radix hexadecimal} {/a2d_tb/dut/A2D_In/DdrData(10) -radix hexadecimal} {/a2d_tb/dut/A2D_In/DdrData(9) -radix hexadecimal} {/a2d_tb/dut/A2D_In/DdrData(8) -radix hexadecimal} {/a2d_tb/dut/A2D_In/DdrData(7) -radix hexadecimal} {/a2d_tb/dut/A2D_In/DdrData(6) -radix hexadecimal} {/a2d_tb/dut/A2D_In/DdrData(5) -radix hexadecimal} {/a2d_tb/dut/A2D_In/DdrData(4) -radix hexadecimal} {/a2d_tb/dut/A2D_In/DdrData(3) -radix hexadecimal} {/a2d_tb/dut/A2D_In/DdrData(2) -radix hexadecimal} {/a2d_tb/dut/A2D_In/DdrData(1) -radix hexadecimal} {/a2d_tb/dut/A2D_In/DdrData(0) -radix hexadecimal}} -subitemconfig {/a2d_tb/dut/A2D_In/DdrData(17) {-height 15 -radix hexadecimal} /a2d_tb/dut/A2D_In/DdrData(16) {-height 15 -radix hexadecimal} /a2d_tb/dut/A2D_In/DdrData(15) {-height 15 -radix hexadecimal} /a2d_tb/dut/A2D_In/DdrData(14) {-height 15 -radix hexadecimal} /a2d_tb/dut/A2D_In/DdrData(13) {-height 15 -radix hexadecimal} /a2d_tb/dut/A2D_In/DdrData(12) {-height 15 -radix hexadecimal} /a2d_tb/dut/A2D_In/DdrData(11) {-height 15 -radix hexadecimal} /a2d_tb/dut/A2D_In/DdrData(10) {-height 15 -radix hexadecimal} /a2d_tb/dut/A2D_In/DdrData(9) {-height 15 -radix hexadecimal} /a2d_tb/dut/A2D_In/DdrData(8) {-height 15 -radix hexadecimal} /a2d_tb/dut/A2D_In/DdrData(7) {-height 15 -radix hexadecimal} /a2d_tb/dut/A2D_In/DdrData(6) {-height 15 -radix hexadecimal} /a2d_tb/dut/A2D_In/DdrData(5) {-height 15 -radix hexadecimal} /a2d_tb/dut/A2D_In/DdrData(4) {-height 15 -radix hexadecimal} /a2d_tb/dut/A2D_In/DdrData(3) {-height 15 -radix hexadecimal} /a2d_tb/dut/A2D_In/DdrData(2) {-height 15 -radix hexadecimal} /a2d_tb/dut/A2D_In/DdrData(1) {-height 15 -radix hexadecimal} /a2d_tb/dut/A2D_In/DdrData(0) {-height 15 -radix hexadecimal}} /a2d_tb/dut/A2D_In/DdrData
add wave -noupdate -radix hexadecimal /a2d_tb/dut/A2D_In/OddOut
add wave -noupdate -radix hexadecimal /a2d_tb/dut/A2D_In/EvenOut
add wave -noupdate -radix hexadecimal -childformat {{/a2d_tb/dut/A2D_In/a2d_data(17) -radix hexadecimal} {/a2d_tb/dut/A2D_In/a2d_data(16) -radix hexadecimal} {/a2d_tb/dut/A2D_In/a2d_data(15) -radix hexadecimal} {/a2d_tb/dut/A2D_In/a2d_data(14) -radix hexadecimal} {/a2d_tb/dut/A2D_In/a2d_data(13) -radix hexadecimal} {/a2d_tb/dut/A2D_In/a2d_data(12) -radix hexadecimal} {/a2d_tb/dut/A2D_In/a2d_data(11) -radix hexadecimal} {/a2d_tb/dut/A2D_In/a2d_data(10) -radix hexadecimal} {/a2d_tb/dut/A2D_In/a2d_data(9) -radix hexadecimal} {/a2d_tb/dut/A2D_In/a2d_data(8) -radix hexadecimal} {/a2d_tb/dut/A2D_In/a2d_data(7) -radix hexadecimal} {/a2d_tb/dut/A2D_In/a2d_data(6) -radix hexadecimal} {/a2d_tb/dut/A2D_In/a2d_data(5) -radix hexadecimal} {/a2d_tb/dut/A2D_In/a2d_data(4) -radix hexadecimal} {/a2d_tb/dut/A2D_In/a2d_data(3) -radix hexadecimal} {/a2d_tb/dut/A2D_In/a2d_data(2) -radix hexadecimal} {/a2d_tb/dut/A2D_In/a2d_data(1) -radix hexadecimal} {/a2d_tb/dut/A2D_In/a2d_data(0) -radix hexadecimal}} -subitemconfig {/a2d_tb/dut/A2D_In/a2d_data(17) {-height 15 -radix hexadecimal} /a2d_tb/dut/A2D_In/a2d_data(16) {-height 15 -radix hexadecimal} /a2d_tb/dut/A2D_In/a2d_data(15) {-height 15 -radix hexadecimal} /a2d_tb/dut/A2D_In/a2d_data(14) {-height 15 -radix hexadecimal} /a2d_tb/dut/A2D_In/a2d_data(13) {-height 15 -radix hexadecimal} /a2d_tb/dut/A2D_In/a2d_data(12) {-height 15 -radix hexadecimal} /a2d_tb/dut/A2D_In/a2d_data(11) {-height 15 -radix hexadecimal} /a2d_tb/dut/A2D_In/a2d_data(10) {-height 15 -radix hexadecimal} /a2d_tb/dut/A2D_In/a2d_data(9) {-height 15 -radix hexadecimal} /a2d_tb/dut/A2D_In/a2d_data(8) {-height 15 -radix hexadecimal} /a2d_tb/dut/A2D_In/a2d_data(7) {-height 15 -radix hexadecimal} /a2d_tb/dut/A2D_In/a2d_data(6) {-height 15 -radix hexadecimal} /a2d_tb/dut/A2D_In/a2d_data(5) {-height 15 -radix hexadecimal} /a2d_tb/dut/A2D_In/a2d_data(4) {-height 15 -radix hexadecimal} /a2d_tb/dut/A2D_In/a2d_data(3) {-height 15 -radix hexadecimal} /a2d_tb/dut/A2D_In/a2d_data(2) {-height 15 -radix hexadecimal} /a2d_tb/dut/A2D_In/a2d_data(1) {-height 15 -radix hexadecimal} /a2d_tb/dut/A2D_In/a2d_data(0) {-height 15 -radix hexadecimal}} /a2d_tb/dut/A2D_In/a2d_data
add wave -noupdate -label Outs -radix hexadecimal -childformat {{/a2d_tb/dut/A2D_In/Outs001(17) -radix hexadecimal} {/a2d_tb/dut/A2D_In/Outs001(16) -radix hexadecimal} {/a2d_tb/dut/A2D_In/Outs001(15) -radix hexadecimal} {/a2d_tb/dut/A2D_In/Outs001(14) -radix hexadecimal} {/a2d_tb/dut/A2D_In/Outs001(13) -radix hexadecimal} {/a2d_tb/dut/A2D_In/Outs001(12) -radix hexadecimal} {/a2d_tb/dut/A2D_In/Outs001(11) -radix hexadecimal} {/a2d_tb/dut/A2D_In/Outs001(10) -radix hexadecimal} {/a2d_tb/dut/A2D_In/Outs001(9) -radix hexadecimal} {/a2d_tb/dut/A2D_In/Outs001(8) -radix hexadecimal} {/a2d_tb/dut/A2D_In/Outs001(7) -radix hexadecimal} {/a2d_tb/dut/A2D_In/Outs001(6) -radix hexadecimal} {/a2d_tb/dut/A2D_In/Outs001(5) -radix hexadecimal} {/a2d_tb/dut/A2D_In/Outs001(4) -radix hexadecimal} {/a2d_tb/dut/A2D_In/Outs001(3) -radix hexadecimal} {/a2d_tb/dut/A2D_In/Outs001(2) -radix hexadecimal}} -subitemconfig {/a2d_tb/dut/A2D_In/a2d_data(17) {-radix hexadecimal} /a2d_tb/dut/A2D_In/a2d_data(16) {-radix hexadecimal} /a2d_tb/dut/A2D_In/a2d_data(15) {-radix hexadecimal} /a2d_tb/dut/A2D_In/a2d_data(14) {-radix hexadecimal} /a2d_tb/dut/A2D_In/a2d_data(13) {-radix hexadecimal} /a2d_tb/dut/A2D_In/a2d_data(12) {-radix hexadecimal} /a2d_tb/dut/A2D_In/a2d_data(11) {-radix hexadecimal} /a2d_tb/dut/A2D_In/a2d_data(10) {-radix hexadecimal} /a2d_tb/dut/A2D_In/a2d_data(9) {-radix hexadecimal} /a2d_tb/dut/A2D_In/a2d_data(8) {-radix hexadecimal} /a2d_tb/dut/A2D_In/a2d_data(7) {-radix hexadecimal} /a2d_tb/dut/A2D_In/a2d_data(6) {-radix hexadecimal} /a2d_tb/dut/A2D_In/a2d_data(5) {-radix hexadecimal} /a2d_tb/dut/A2D_In/a2d_data(4) {-radix hexadecimal} /a2d_tb/dut/A2D_In/a2d_data(3) {-radix hexadecimal} /a2d_tb/dut/A2D_In/a2d_data(2) {-radix hexadecimal}} /a2d_tb/dut/A2D_In/Outs001
add wave -noupdate /a2d_tb/a2d_data
add wave -noupdate /a2d_tb/ce
add wave -noupdate -radix hexadecimal -childformat {{/a2d_tb/Data(15) -radix hexadecimal} {/a2d_tb/Data(14) -radix hexadecimal} {/a2d_tb/Data(13) -radix hexadecimal} {/a2d_tb/Data(12) -radix hexadecimal} {/a2d_tb/Data(11) -radix hexadecimal} {/a2d_tb/Data(10) -radix hexadecimal} {/a2d_tb/Data(9) -radix hexadecimal} {/a2d_tb/Data(8) -radix hexadecimal} {/a2d_tb/Data(7) -radix hexadecimal} {/a2d_tb/Data(6) -radix hexadecimal} {/a2d_tb/Data(5) -radix hexadecimal} {/a2d_tb/Data(4) -radix hexadecimal} {/a2d_tb/Data(3) -radix hexadecimal} {/a2d_tb/Data(2) -radix hexadecimal} {/a2d_tb/Data(1) -radix hexadecimal} {/a2d_tb/Data(0) -radix hexadecimal}} -subitemconfig {/a2d_tb/Data(15) {-height 15 -radix hexadecimal} /a2d_tb/Data(14) {-height 15 -radix hexadecimal} /a2d_tb/Data(13) {-height 15 -radix hexadecimal} /a2d_tb/Data(12) {-height 15 -radix hexadecimal} /a2d_tb/Data(11) {-height 15 -radix hexadecimal} /a2d_tb/Data(10) {-height 15 -radix hexadecimal} /a2d_tb/Data(9) {-height 15 -radix hexadecimal} /a2d_tb/Data(8) {-height 15 -radix hexadecimal} /a2d_tb/Data(7) {-height 15 -radix hexadecimal} /a2d_tb/Data(6) {-height 15 -radix hexadecimal} /a2d_tb/Data(5) {-height 15 -radix hexadecimal} /a2d_tb/Data(4) {-height 15 -radix hexadecimal} /a2d_tb/Data(3) {-height 15 -radix hexadecimal} /a2d_tb/Data(2) {-height 15 -radix hexadecimal} /a2d_tb/Data(1) {-height 15 -radix hexadecimal} /a2d_tb/Data(0) {-height 15 -radix hexadecimal}} /a2d_tb/Data
add wave -noupdate -radix hexadecimal /a2d_tb/Odds
add wave -noupdate -radix hexadecimal /a2d_tb/Evens
add wave -noupdate /a2d_tb/South
add wave -noupdate /a2d_tb/Pass
add wave -noupdate /a2d_tb/Fail
add wave -noupdate /a2d_tb/Blink
add wave -noupdate /a2d_tb/GPIO_DipSw
add wave -noupdate /a2d_tb/Count100
add wave -noupdate /a2d_tb/Count
add wave -noupdate /a2d_tb/SpiShift
add wave -noupdate /a2d_tb/SpiReg
add wave -noupdate /a2d_tb/SpiClk
add wave -noupdate /a2d_tb/SpiCs_n
add wave -noupdate /a2d_tb/SpiIO
add wave -noupdate /a2d_tb/dut/reset_in
add wave -noupdate /a2d_tb/dut/South
add wave -noupdate /a2d_tb/dut/GPIO_DipSw
add wave -noupdate /a2d_tb/dut/Pass
add wave -noupdate /a2d_tb/dut/Fail
add wave -noupdate /a2d_tb/dut/SpiOut
add wave -noupdate /a2d_tb/dut/ClkOut
add wave -noupdate /a2d_tb/dut/Blink
add wave -noupdate /a2d_tb/dut/SpiCs_n
add wave -noupdate /a2d_tb/dut/SpiClk
add wave -noupdate /a2d_tb/dut/SpiIO
add wave -noupdate /a2d_tb/dut/ce
add wave -noupdate /a2d_tb/dut/clk
add wave -noupdate /a2d_tb/dut/ValidIn
add wave -noupdate /a2d_tb/dut/Locked
add wave -noupdate /a2d_tb/dut/DDC_Valid
add wave -noupdate /a2d_tb/dut/DecValid
add wave -noupdate /a2d_tb/dut/adc_clk
add wave -noupdate /a2d_tb/dut/DDC_real
add wave -noupdate /a2d_tb/dut/DDC_imag
add wave -noupdate /a2d_tb/dut/PilotReal
add wave -noupdate /a2d_tb/dut/PilotImag
add wave -noupdate /a2d_tb/dut/TrellisBits
add wave -noupdate /a2d_tb/dut/LedFlash
add wave -noupdate /a2d_tb/dut/A2D_In/reset
add wave -noupdate /a2d_tb/dut/A2D_In/South
add wave -noupdate /a2d_tb/dut/A2D_In/GPIO_DipSw
add wave -noupdate /a2d_tb/dut/A2D_In/SpiClk
add wave -noupdate /a2d_tb/dut/A2D_In/SpiCs_n
add wave -noupdate /a2d_tb/dut/A2D_In/SpiIO
add wave -noupdate /a2d_tb/dut/A2D_In/SpiCapture
add wave -noupdate /a2d_tb/dut/A2D_In/Init
add wave -noupdate /a2d_tb/dut/A2D_In/SouthDly
add wave -noupdate /a2d_tb/dut/A2D_In/SpiOutEn
add wave -noupdate -radix hexadecimal /a2d_tb/dut/A2D_In/SpiReg
add wave -noupdate /a2d_tb/dut/A2D_In/SpiCount
add wave -noupdate -radix unsigned /a2d_tb/dut/A2D_In/DivBy4
add wave -noupdate -divider {New Divider}
add wave -noupdate /a2d_tb/dut/A2D_In/IDDRE_0/Q1
add wave -noupdate /a2d_tb/dut/A2D_In/IDDRE_0/Q2
add wave -noupdate /a2d_tb/dut/A2D_In/IDDRE_0/C
add wave -noupdate /a2d_tb/dut/A2D_In/IDDRE_0/CB
add wave -noupdate /a2d_tb/dut/A2D_In/IDDRE_0/D
add wave -noupdate /a2d_tb/dut/A2D_In/IDDRE_0/R
add wave -noupdate /a2d_tb/dut/A2D_In/IDDRE_0/DDR_CLK_EDGE_BIN
add wave -noupdate /a2d_tb/dut/A2D_In/IDDRE_0/IS_CB_INVERTED_BIN
add wave -noupdate /a2d_tb/dut/A2D_In/IDDRE_0/IS_C_INVERTED_BIN
add wave -noupdate /a2d_tb/dut/A2D_In/IDDRE_0/glblGSR
add wave -noupdate /a2d_tb/dut/A2D_In/IDDRE_0/xil_attr_test
add wave -noupdate /a2d_tb/dut/A2D_In/IDDRE_0/CB_in
add wave -noupdate /a2d_tb/dut/A2D_In/IDDRE_0/C_in
add wave -noupdate /a2d_tb/dut/A2D_In/IDDRE_0/D_in
add wave -noupdate /a2d_tb/dut/A2D_In/IDDRE_0/R_in
add wave -noupdate /a2d_tb/dut/A2D_In/IDDRE_0/q1_o_reg
add wave -noupdate /a2d_tb/dut/A2D_In/IDDRE_0/q2_o_reg
add wave -noupdate /a2d_tb/dut/A2D_In/IDDRE_0/q3_o_reg
add wave -noupdate /a2d_tb/dut/A2D_In/IDDRE_0/q4_o_reg
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {42000 ps} 0} {{Cursor 2} {145386 ps} 0}
quietly wave cursor active 2
configure wave -namecolwidth 276
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
WaveRestoreZoom {125188 ps} {203938 ps}
bookmark add wave bookmark6 {{3023030 ps} {3054970 ps}} 0
bookmark add wave bookmark7 {{2508730 ps} {2540670 ps}} 0
