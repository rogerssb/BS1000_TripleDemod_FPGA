onerror {resume}
quietly set dataset_list [list sim]
if {[catch {datasetcheck $dataset_list}]} {abort}
radix define s17 -fixed -fraction 17 -signed -base signed -precision 6
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
radix define s18 -fixed -fraction 18 -signed -base signed -precision 6
radix define s19 -fixed -fraction 19 -signed -base signed -precision 6
radix define s20 -fixed -fraction 20 -signed -base signed -precision 6
radix define s21 -fixed -fraction 21 -signed -base signed -precision 6
radix define s22 -fixed -fraction 22 -signed -base signed -precision 6
radix define s23 -fixed -fraction 23 -signed -base signed -precision 6
radix define s24 -fixed -fraction 24 -signed -base signed -precision 6
radix define s25 -fixed -fraction 25 -signed -base signed -precision 6
radix define s26 -fixed -fraction 26 -signed -base signed -precision 6
radix define s27 -fixed -fraction 27 -signed -base signed -precision 6
radix define float -fixed -fraction 27 -signed -base signed -precision 6
radix define float_1k -fixed -fraction 21 -signed -base signed -precision 6
radix define float_4k -fixed -fraction 19 -signed -base signed -precision 6
radix define float_64k -fixed -fraction 15 -signed -base signed -precision 6
radix define float_1m -fixed -fraction 11 -signed -base signed -precision 6
radix define float_1b -fixed -fraction 1 -signed -base signed -precision 6
radix define FLoat16 -fixed -fraction 27 -signed -base signed -precision 6
radix define s18_17 -fixed -fraction 17 -signed -base signed -precision 6
quietly WaveActivateNextPane {} 0
add wave -noupdate sim:/pilot_tb/DELAY
add wave -noupdate sim:/pilot_tb/Variables
add wave -noupdate sim:/pilot_tb/ce
add wave -noupdate sim:/pilot_tb/clk
add wave -noupdate sim:/pilot_tb/reset
add wave -noupdate sim:/pilot_tb/Count
add wave -noupdate sim:/pilot_tb/DataValid
add wave -noupdate sim:/pilot_tb/RealRead
add wave -noupdate sim:/pilot_tb/ImagRead
add wave -noupdate sim:/pilot_tb/ValidIn
add wave -noupdate sim:/pilot_tb/Done1
add wave -noupdate sim:/pilot_tb/Done2
add wave -noupdate sim:/pilot_tb/PilotCount
add wave -noupdate -expand sim:/pilot_tb/PilotIndex
add wave -noupdate sim:/pilot_tb/PilotPulse
add wave -noupdate sim:/pilot_tb/PilotFound
add wave -noupdate sim:/pilot_tb/StartOut
add wave -noupdate sim:/pilot_tb/ValidOut
add wave -noupdate sim:/pilot_tb/Booleans
add wave -noupdate sim:/pilot_tb/ImagRead
add wave -noupdate sim:/pilot_tb/ImOut
add wave -noupdate sim:/pilot_tb/MagThresh
add wave -noupdate sim:/pilot_tb/PilotMag
add wave -noupdate sim:/pilot_tb/ReImOut
add wave -noupdate sim:/pilot_tb/ReOut
add wave -noupdate sim:/pilot_tb/Threshold
add wave -noupdate -divider PilotSync
add wave -noupdate sim:/pilot_tb/clk2x
add wave -noupdate sim:/pilot_tb/PD/clk
add wave -noupdate sim:/pilot_tb/PD/reset
add wave -noupdate sim:/pilot_tb/PD/ce
add wave -noupdate sim:/pilot_tb/PD/PilotMag
add wave -noupdate sim:/pilot_tb/PD/Threshold
add wave -noupdate sim:/pilot_tb/PD/ReOut
add wave -noupdate sim:/pilot_tb/PD/ImOut
add wave -noupdate sim:/pilot_tb/PD/PilotPulse
add wave -noupdate sim:/pilot_tb/PD/PilotFound
add wave -noupdate sim:/pilot_tb/PD/ValidOut
add wave -noupdate sim:/pilot_tb/PD/StartOut
add wave -noupdate sim:/pilot_tb/PD/ValidAbs
add wave -noupdate -clampanalog 1 -format Analog-Step -height 75 -max 45000.0 sim:/pilot_tb/PD/AbsCntr0
add wave -noupdate -clampanalog 1 -format Analog-Step -height 75 -max 45000.0 sim:/pilot_tb/PD/AbsCntr1
add wave -noupdate -clampanalog 1 -format Analog-Step -height 75 -max 45000.0 sim:/pilot_tb/PD/MaxCntr
add wave -noupdate sim:/pilot_tb/PD/Max1
add wave -noupdate sim:/pilot_tb/PD/Max2
add wave -noupdate -format Analog-Step -height 74 -max 42526.0 sim:/pilot_tb/PD/Max
add wave -noupdate sim:/pilot_tb/PD/Index0
add wave -noupdate sim:/pilot_tb/PD/Index1
add wave -noupdate sim:/pilot_tb/PD/Index2
add wave -noupdate sim:/pilot_tb/PD/Index3
add wave -noupdate sim:/pilot_tb/PD/MaxIndex
add wave -noupdate sim:/pilot_tb/PD/PilotFound
add wave -noupdate sim:/pilot_tb/PD/PilotIndex
add wave -noupdate sim:/pilot_tb/PD/PilotMag
add wave -noupdate sim:/pilot_tb/PD/Threshold
add wave -noupdate sim:/pilot_tb/PD/PilotPulse
add wave -noupdate sim:/pilot_tb/PD/BadPilot
add wave -noupdate sim:/pilot_tb/PD/GoodPilot
add wave -noupdate -format Analog-Step -height 74 -max 42526.0 -radix ufixed sim:/pilot_tb/PD/Peak1
add wave -noupdate -format Analog-Step -height 74 -max 10499.0 -radix ufixed sim:/pilot_tb/PD/Peak2
add wave -noupdate sim:/pilot_tb/PD/PS_u/IndexOut
add wave -noupdate sim:/pilot_tb/PD/PS_u/PilotPulseIn
add wave -noupdate sim:/pilot_tb/PD/ConfigTValid
add wave -noupdate -radix hexadecimal sim:/pilot_tb/PD/ConfigTReady
add wave -noupdate sim:/pilot_tb/PD/ConfigDone
add wave -noupdate -format Analog-Step -height 74 -max 123968.0 -min -123957.0 sim:/pilot_tb/PD/ReIn
add wave -noupdate -format Analog-Step -height 74 -max 123656.0 -min -123995.0 sim:/pilot_tb/PD/ImIn
add wave -noupdate sim:/pilot_tb/PD/ValidIn
add wave -noupdate sim:/pilot_tb/PD/ReInDly
add wave -noupdate sim:/pilot_tb/PD/ImInDly
add wave -noupdate sim:/pilot_tb/PD/PackR
add wave -noupdate sim:/pilot_tb/PD/PackI
add wave -noupdate sim:/pilot_tb/PD/StartFft
add wave -noupdate sim:/pilot_tb/PD/FftReady
add wave -noupdate -divider PackFifo
add wave -noupdate sim:/pilot_tb/PD/PackFifo/ce
add wave -noupdate sim:/pilot_tb/PD/PackFifo/clk
add wave -noupdate sim:/pilot_tb/PD/PackFifo/clk2x
add wave -noupdate sim:/pilot_tb/PD/PackFifo/reset
add wave -noupdate sim:/pilot_tb/PD/PackFifo/ImIn
add wave -noupdate sim:/pilot_tb/PD/PackFifo/ReIn
add wave -noupdate sim:/pilot_tb/PD/PackFifo/ReadyIn
add wave -noupdate sim:/pilot_tb/PD/PackFifo/ValidIn
add wave -noupdate sim:/pilot_tb/PD/PackFifo/Idle2x
add wave -noupdate sim:/pilot_tb/PD/PackFifo/LastOut2x
add wave -noupdate sim:/pilot_tb/PD/PackFifo/OverFlow2x
add wave -noupdate sim:/pilot_tb/PD/PackFifo/UnderFlow2x
add wave -noupdate sim:/pilot_tb/PD/PackFifo/Pop2x
add wave -noupdate sim:/pilot_tb/PD/PackFifo/PopCount2x
add wave -noupdate sim:/pilot_tb/PD/PackFifo/ProgFull2x
add wave -noupdate sim:/pilot_tb/PD/PackFifo/RdRstBusy2x
add wave -noupdate sim:/pilot_tb/PD/PackFifo/FifoData2x
add wave -noupdate -format Analog-Step -height 74 -max 123642.0 -min -123995.0 sim:/pilot_tb/PD/PackFifo/ImOut2x
add wave -noupdate -format Analog-Step -height 74 -max 123968.0 -min -123957.0 sim:/pilot_tb/PD/PackFifo/ReOut2x
add wave -noupdate sim:/pilot_tb/PD/PackFifo/Start2x
add wave -noupdate sim:/pilot_tb/PD/PackFifo/ValidOut2x
add wave -noupdate sim:/pilot_tb/PD/PackFifo/WrRstBusy2x
add wave -noupdate sim:/pilot_tb/PD/PackFifo/Clk2xFifo/overflow
add wave -noupdate sim:/pilot_tb/PD/PackFifo/Clk2xFifo/prog_empty
add wave -noupdate sim:/pilot_tb/PD/PackFifo/Clk2xFifo/prog_full
add wave -noupdate sim:/pilot_tb/PD/PackFifo/Clk2xFifo/rd_en
add wave -noupdate sim:/pilot_tb/PD/PackFifo/Clk2xFifo/rd_rst_busy
add wave -noupdate sim:/pilot_tb/PD/PackFifo/Clk2xFifo/underflow
add wave -noupdate sim:/pilot_tb/PD/PackFifo/Clk2xFifo/wr_data_count
add wave -noupdate sim:/pilot_tb/PD/PackFifo/Clk2xFifo/wr_en
add wave -noupdate sim:/pilot_tb/PD/PackFifo/Clk2xFifo/wr_rst_busy
add wave -noupdate sim:/pilot_tb/PD/PackFifo/Clk1xFifo/overflow
add wave -noupdate sim:/pilot_tb/PD/PackFifo/Clk1xFifo/prog_empty
add wave -noupdate sim:/pilot_tb/PD/PackFifo/Clk1xFifo/prog_full
add wave -noupdate sim:/pilot_tb/PD/PackFifo/Clk1xFifo/rd_data_count
add wave -noupdate sim:/pilot_tb/PD/PackFifo/Clk1xFifo/rd_en
add wave -noupdate sim:/pilot_tb/PD/PackFifo/Clk1xFifo/rd_rst_busy
add wave -noupdate sim:/pilot_tb/PD/PackFifo/Clk1xFifo/sbiterr
add wave -noupdate sim:/pilot_tb/PD/PackFifo/Clk1xFifo/underflow
add wave -noupdate sim:/pilot_tb/PD/PackFifo/Clk1xFifo/wr_data_count
add wave -noupdate sim:/pilot_tb/PD/PackFifo/Clk1xFifo/din
add wave -noupdate sim:/pilot_tb/PD/PackFifo/Clk1xFifo/wr_en
add wave -noupdate sim:/pilot_tb/PD/PackFifo/Clk1xFifo/wr_rst_busy
add wave -noupdate sim:/pilot_tb/PD/PackFifo/Idle1x
add wave -noupdate sim:/pilot_tb/PD/PackFifo/LastOut1x
add wave -noupdate sim:/pilot_tb/PD/PackFifo/OverFlow1x
add wave -noupdate sim:/pilot_tb/PD/PackFifo/UnderFlow1x
add wave -noupdate sim:/pilot_tb/PD/PackFifo/Pop1x
add wave -noupdate sim:/pilot_tb/PD/PackFifo/PopCount1x
add wave -noupdate sim:/pilot_tb/PD/PackFifo/ProgFull1x
add wave -noupdate sim:/pilot_tb/PD/PackFifo/RdRstBusy1x
add wave -noupdate sim:/pilot_tb/PD/PackFifo/FifoData1x
add wave -noupdate -format Analog-Step -height 74 -max 123918.0 -min -123855.0 sim:/pilot_tb/PD/PackFifo/ReOut1x
add wave -noupdate -format Analog-Step -height 74 -max 123642.00000000001 -min -123662.0 sim:/pilot_tb/PD/PackFifo/ImOut1x
add wave -noupdate sim:/pilot_tb/PD/PackFifo/Start1x
add wave -noupdate sim:/pilot_tb/PD/PackFifo/ValidOut1x
add wave -noupdate -format Analog-Step -height 74 -max 123918.0 -min -123855.0 sim:/pilot_tb/PD/RealOutA
add wave -noupdate -format Analog-Step -height 74 -max 123642.00000000001 -min -123662.0 sim:/pilot_tb/PD/ImagOutA
add wave -noupdate sim:/pilot_tb/PD/StartOutA
add wave -noupdate sim:/pilot_tb/PD/ValidOutA
add wave -noupdate sim:/pilot_tb/PD/PackFifo/WrRstBusy1x
add wave -noupdate sim:/pilot_tb/PD/PackFifo/WORDS
add wave -noupdate sim:/pilot_tb/PD/PackFifo/BINPT
add wave -noupdate sim:/pilot_tb/PD/PackFifo/DATA_WIDTH
add wave -noupdate -divider FFT
add wave -noupdate sim:/pilot_tb/PD/StartPack
add wave -noupdate sim:/pilot_tb/PD/ValidPack
add wave -noupdate sim:/pilot_tb/PD/FftTLastIn
add wave -noupdate sim:/pilot_tb/PD/ValidFft
add wave -noupdate sim:/pilot_tb/PD/Fft_u/s_axis_config_tdata
add wave -noupdate sim:/pilot_tb/PD/Fft_u/s_axis_config_tvalid
add wave -noupdate sim:/pilot_tb/PD/Fft_u/s_axis_config_tready
add wave -noupdate sim:/pilot_tb/PD/Fft_u/s_axis_data_tdata
add wave -noupdate sim:/pilot_tb/PD/Fft_u/s_axis_data_tvalid
add wave -noupdate sim:/pilot_tb/PD/Fft_u/s_axis_data_tready
add wave -noupdate sim:/pilot_tb/PD/Fft_u/s_axis_data_tlast
add wave -noupdate sim:/pilot_tb/PD/Fft_u/m_axis_data_tdata
add wave -noupdate sim:/pilot_tb/PD/Fft_u/m_axis_data_tvalid
add wave -noupdate sim:/pilot_tb/PD/Fft_u/m_axis_data_tlast
add wave -noupdate sim:/pilot_tb/PD/Fft_u/event_frame_started
add wave -noupdate sim:/pilot_tb/PD/Fft_u/event_tlast_unexpected
add wave -noupdate sim:/pilot_tb/PD/Fft_u/event_tlast_missing
add wave -noupdate sim:/pilot_tb/PD/Fft_u/event_data_in_channel_halt
add wave -noupdate -format Analog-Step -height 74 -max 1023.0000000000001 -radix unsigned -radixshowbase 0 sim:/pilot_tb/PD/Count
add wave -noupdate -radix s17 -childformat {{/pilot_tb/PD/FftOutSlv(63) -radix s17} {/pilot_tb/PD/FftOutSlv(62) -radix s17} {/pilot_tb/PD/FftOutSlv(61) -radix s17} {/pilot_tb/PD/FftOutSlv(60) -radix s17} {/pilot_tb/PD/FftOutSlv(59) -radix s17} {/pilot_tb/PD/FftOutSlv(58) -radix s17} {/pilot_tb/PD/FftOutSlv(57) -radix s17} {/pilot_tb/PD/FftOutSlv(56) -radix s17} {/pilot_tb/PD/FftOutSlv(55) -radix s17} {/pilot_tb/PD/FftOutSlv(54) -radix s17} {/pilot_tb/PD/FftOutSlv(53) -radix s17} {/pilot_tb/PD/FftOutSlv(52) -radix s17} {/pilot_tb/PD/FftOutSlv(51) -radix s17} {/pilot_tb/PD/FftOutSlv(50) -radix s17} {/pilot_tb/PD/FftOutSlv(49) -radix s17} {/pilot_tb/PD/FftOutSlv(48) -radix s17} {/pilot_tb/PD/FftOutSlv(47) -radix s17} {/pilot_tb/PD/FftOutSlv(46) -radix s17} {/pilot_tb/PD/FftOutSlv(45) -radix s17} {/pilot_tb/PD/FftOutSlv(44) -radix s17} {/pilot_tb/PD/FftOutSlv(43) -radix s17} {/pilot_tb/PD/FftOutSlv(42) -radix s17} {/pilot_tb/PD/FftOutSlv(41) -radix s17} {/pilot_tb/PD/FftOutSlv(40) -radix s17} {/pilot_tb/PD/FftOutSlv(39) -radix s17} {/pilot_tb/PD/FftOutSlv(38) -radix s17} {/pilot_tb/PD/FftOutSlv(37) -radix s17} {/pilot_tb/PD/FftOutSlv(36) -radix s17} {/pilot_tb/PD/FftOutSlv(35) -radix s17} {/pilot_tb/PD/FftOutSlv(34) -radix s17} {/pilot_tb/PD/FftOutSlv(33) -radix s17} {/pilot_tb/PD/FftOutSlv(32) -radix s17} {/pilot_tb/PD/FftOutSlv(31) -radix s17} {/pilot_tb/PD/FftOutSlv(30) -radix s17} {/pilot_tb/PD/FftOutSlv(29) -radix s17} {/pilot_tb/PD/FftOutSlv(28) -radix s17} {/pilot_tb/PD/FftOutSlv(27) -radix s17} {/pilot_tb/PD/FftOutSlv(26) -radix s17} {/pilot_tb/PD/FftOutSlv(25) -radix s17} {/pilot_tb/PD/FftOutSlv(24) -radix s17} {/pilot_tb/PD/FftOutSlv(23) -radix s17} {/pilot_tb/PD/FftOutSlv(22) -radix s17} {/pilot_tb/PD/FftOutSlv(21) -radix s17} {/pilot_tb/PD/FftOutSlv(20) -radix s17} {/pilot_tb/PD/FftOutSlv(19) -radix s17} {/pilot_tb/PD/FftOutSlv(18) -radix s17} {/pilot_tb/PD/FftOutSlv(17) -radix s17} {/pilot_tb/PD/FftOutSlv(16) -radix s17} {/pilot_tb/PD/FftOutSlv(15) -radix s17} {/pilot_tb/PD/FftOutSlv(14) -radix s17} {/pilot_tb/PD/FftOutSlv(13) -radix s17} {/pilot_tb/PD/FftOutSlv(12) -radix s17} {/pilot_tb/PD/FftOutSlv(11) -radix s17} {/pilot_tb/PD/FftOutSlv(10) -radix s17} {/pilot_tb/PD/FftOutSlv(9) -radix s17} {/pilot_tb/PD/FftOutSlv(8) -radix s17} {/pilot_tb/PD/FftOutSlv(7) -radix s17} {/pilot_tb/PD/FftOutSlv(6) -radix s17} {/pilot_tb/PD/FftOutSlv(5) -radix s17} {/pilot_tb/PD/FftOutSlv(4) -radix s17} {/pilot_tb/PD/FftOutSlv(3) -radix s17} {/pilot_tb/PD/FftOutSlv(2) -radix s17} {/pilot_tb/PD/FftOutSlv(1) -radix s17} {/pilot_tb/PD/FftOutSlv(0) -radix s17}} -subitemconfig {/pilot_tb/PD/FftOutSlv(63) {-height 15 -radix s17} /pilot_tb/PD/FftOutSlv(62) {-height 15 -radix s17} /pilot_tb/PD/FftOutSlv(61) {-height 15 -radix s17} /pilot_tb/PD/FftOutSlv(60) {-height 15 -radix s17} /pilot_tb/PD/FftOutSlv(59) {-height 15 -radix s17} /pilot_tb/PD/FftOutSlv(58) {-height 15 -radix s17} /pilot_tb/PD/FftOutSlv(57) {-height 15 -radix s17} /pilot_tb/PD/FftOutSlv(56) {-height 15 -radix s17} /pilot_tb/PD/FftOutSlv(55) {-height 15 -radix s17} /pilot_tb/PD/FftOutSlv(54) {-height 15 -radix s17} /pilot_tb/PD/FftOutSlv(53) {-height 15 -radix s17} /pilot_tb/PD/FftOutSlv(52) {-height 15 -radix s17} /pilot_tb/PD/FftOutSlv(51) {-height 15 -radix s17} /pilot_tb/PD/FftOutSlv(50) {-height 15 -radix s17} /pilot_tb/PD/FftOutSlv(49) {-height 15 -radix s17} /pilot_tb/PD/FftOutSlv(48) {-height 15 -radix s17} /pilot_tb/PD/FftOutSlv(47) {-height 15 -radix s17} /pilot_tb/PD/FftOutSlv(46) {-height 15 -radix s17} /pilot_tb/PD/FftOutSlv(45) {-height 15 -radix s17} /pilot_tb/PD/FftOutSlv(44) {-height 15 -radix s17} /pilot_tb/PD/FftOutSlv(43) {-height 15 -radix s17} /pilot_tb/PD/FftOutSlv(42) {-height 15 -radix s17} /pilot_tb/PD/FftOutSlv(41) {-height 15 -radix s17} /pilot_tb/PD/FftOutSlv(40) {-height 15 -radix s17} /pilot_tb/PD/FftOutSlv(39) {-height 15 -radix s17} /pilot_tb/PD/FftOutSlv(38) {-height 15 -radix s17} /pilot_tb/PD/FftOutSlv(37) {-height 15 -radix s17} /pilot_tb/PD/FftOutSlv(36) {-height 15 -radix s17} /pilot_tb/PD/FftOutSlv(35) {-height 15 -radix s17} /pilot_tb/PD/FftOutSlv(34) {-height 15 -radix s17} /pilot_tb/PD/FftOutSlv(33) {-height 15 -radix s17} /pilot_tb/PD/FftOutSlv(32) {-height 15 -radix s17} /pilot_tb/PD/FftOutSlv(31) {-height 15 -radix s17} /pilot_tb/PD/FftOutSlv(30) {-height 15 -radix s17} /pilot_tb/PD/FftOutSlv(29) {-height 15 -radix s17} /pilot_tb/PD/FftOutSlv(28) {-height 15 -radix s17} /pilot_tb/PD/FftOutSlv(27) {-height 15 -radix s17} /pilot_tb/PD/FftOutSlv(26) {-height 15 -radix s17} /pilot_tb/PD/FftOutSlv(25) {-height 15 -radix s17} /pilot_tb/PD/FftOutSlv(24) {-height 15 -radix s17} /pilot_tb/PD/FftOutSlv(23) {-height 15 -radix s17} /pilot_tb/PD/FftOutSlv(22) {-height 15 -radix s17} /pilot_tb/PD/FftOutSlv(21) {-height 15 -radix s17} /pilot_tb/PD/FftOutSlv(20) {-height 15 -radix s17} /pilot_tb/PD/FftOutSlv(19) {-height 15 -radix s17} /pilot_tb/PD/FftOutSlv(18) {-height 15 -radix s17} /pilot_tb/PD/FftOutSlv(17) {-height 15 -radix s17} /pilot_tb/PD/FftOutSlv(16) {-height 15 -radix s17} /pilot_tb/PD/FftOutSlv(15) {-height 15 -radix s17} /pilot_tb/PD/FftOutSlv(14) {-height 15 -radix s17} /pilot_tb/PD/FftOutSlv(13) {-height 15 -radix s17} /pilot_tb/PD/FftOutSlv(12) {-height 15 -radix s17} /pilot_tb/PD/FftOutSlv(11) {-height 15 -radix s17} /pilot_tb/PD/FftOutSlv(10) {-height 15 -radix s17} /pilot_tb/PD/FftOutSlv(9) {-height 15 -radix s17} /pilot_tb/PD/FftOutSlv(8) {-height 15 -radix s17} /pilot_tb/PD/FftOutSlv(7) {-height 15 -radix s17} /pilot_tb/PD/FftOutSlv(6) {-height 15 -radix s17} /pilot_tb/PD/FftOutSlv(5) {-height 15 -radix s17} /pilot_tb/PD/FftOutSlv(4) {-height 15 -radix s17} /pilot_tb/PD/FftOutSlv(3) {-height 15 -radix s17} /pilot_tb/PD/FftOutSlv(2) {-height 15 -radix s17} /pilot_tb/PD/FftOutSlv(1) {-height 15 -radix s17} /pilot_tb/PD/FftOutSlv(0) {-height 15 -radix s17}} sim:/pilot_tb/PD/FftOutSlv
add wave -noupdate -format Analog-Step -height 74 -max 125800.99999999997 -min -82786.0 sim:/pilot_tb/PD/FftR
add wave -noupdate sim:/pilot_tb/PD/FftR
add wave -noupdate sim:/pilot_tb/PD/FftI
add wave -noupdate sim:/pilot_tb/PD/StartAbs
add wave -noupdate sim:/pilot_tb/PD/iFftReady
add wave -noupdate sim:/pilot_tb/PD/ValidFftDly
add wave -noupdate sim:/pilot_tb/PD/H0NegR
add wave -noupdate sim:/pilot_tb/PD/H0NegI
add wave -noupdate sim:/pilot_tb/PD/H1NegR
add wave -noupdate sim:/pilot_tb/PD/H1NegI
add wave -noupdate sim:/pilot_tb/PD/H0CntrR
add wave -noupdate sim:/pilot_tb/PD/H0CntrI
add wave -noupdate sim:/pilot_tb/PD/H1CntrR
add wave -noupdate sim:/pilot_tb/PD/H1CntrI
add wave -noupdate sim:/pilot_tb/PD/H0PosR
add wave -noupdate sim:/pilot_tb/PD/H0PosI
add wave -noupdate sim:/pilot_tb/PD/H1PosR
add wave -noupdate sim:/pilot_tb/PD/H1PosI
add wave -noupdate -radix s6 sim:/pilot_tb/PD/XC0NegR
add wave -noupdate -radix s6 sim:/pilot_tb/PD/XC0NegI
add wave -noupdate -clampanalog 1 -radix sfixed -childformat {{/pilot_tb/PD/XC0CntrR(14) -radix s6} {/pilot_tb/PD/XC0CntrR(13) -radix s6} {/pilot_tb/PD/XC0CntrR(12) -radix s6} {/pilot_tb/PD/XC0CntrR(11) -radix s6} {/pilot_tb/PD/XC0CntrR(10) -radix s6} {/pilot_tb/PD/XC0CntrR(9) -radix s6} {/pilot_tb/PD/XC0CntrR(8) -radix s6} {/pilot_tb/PD/XC0CntrR(7) -radix s6} {/pilot_tb/PD/XC0CntrR(6) -radix s6} {/pilot_tb/PD/XC0CntrR(5) -radix s6} {/pilot_tb/PD/XC0CntrR(4) -radix s6} {/pilot_tb/PD/XC0CntrR(3) -radix s6} {/pilot_tb/PD/XC0CntrR(2) -radix s6} {/pilot_tb/PD/XC0CntrR(1) -radix s6} {/pilot_tb/PD/XC0CntrR(0) -radix s6} {/pilot_tb/PD/XC0CntrR(-1) -radix s6} {/pilot_tb/PD/XC0CntrR(-2) -radix s6} {/pilot_tb/PD/XC0CntrR(-3) -radix s6}} -subitemconfig {/pilot_tb/PD/XC0CntrR(14) {-height 15 -radix s6} /pilot_tb/PD/XC0CntrR(13) {-height 15 -radix s6} /pilot_tb/PD/XC0CntrR(12) {-height 15 -radix s6} /pilot_tb/PD/XC0CntrR(11) {-height 15 -radix s6} /pilot_tb/PD/XC0CntrR(10) {-height 15 -radix s6} /pilot_tb/PD/XC0CntrR(9) {-height 15 -radix s6} /pilot_tb/PD/XC0CntrR(8) {-height 15 -radix s6} /pilot_tb/PD/XC0CntrR(7) {-height 15 -radix s6} /pilot_tb/PD/XC0CntrR(6) {-height 15 -radix s6} /pilot_tb/PD/XC0CntrR(5) {-height 15 -radix s6} /pilot_tb/PD/XC0CntrR(4) {-height 15 -radix s6} /pilot_tb/PD/XC0CntrR(3) {-height 15 -radix s6} /pilot_tb/PD/XC0CntrR(2) {-height 15 -radix s6} /pilot_tb/PD/XC0CntrR(1) {-height 15 -radix s6} /pilot_tb/PD/XC0CntrR(0) {-height 15 -radix s6} /pilot_tb/PD/XC0CntrR(-1) {-height 15 -radix s6} /pilot_tb/PD/XC0CntrR(-2) {-height 15 -radix s6} /pilot_tb/PD/XC0CntrR(-3) {-height 15 -radix s6}} sim:/pilot_tb/PD/XC0CntrR
add wave -noupdate -clampanalog 1 -radix sfixed -childformat {{/pilot_tb/PD/XC0CntrI(14) -radix s6} {/pilot_tb/PD/XC0CntrI(13) -radix s6} {/pilot_tb/PD/XC0CntrI(12) -radix s6} {/pilot_tb/PD/XC0CntrI(11) -radix s6} {/pilot_tb/PD/XC0CntrI(10) -radix s6} {/pilot_tb/PD/XC0CntrI(9) -radix s6} {/pilot_tb/PD/XC0CntrI(8) -radix s6} {/pilot_tb/PD/XC0CntrI(7) -radix s6} {/pilot_tb/PD/XC0CntrI(6) -radix s6} {/pilot_tb/PD/XC0CntrI(5) -radix s6} {/pilot_tb/PD/XC0CntrI(4) -radix s6} {/pilot_tb/PD/XC0CntrI(3) -radix s6} {/pilot_tb/PD/XC0CntrI(2) -radix s6} {/pilot_tb/PD/XC0CntrI(1) -radix s6} {/pilot_tb/PD/XC0CntrI(0) -radix s6} {/pilot_tb/PD/XC0CntrI(-1) -radix s6} {/pilot_tb/PD/XC0CntrI(-2) -radix s6} {/pilot_tb/PD/XC0CntrI(-3) -radix s6}} -subitemconfig {/pilot_tb/PD/XC0CntrI(14) {-height 15 -radix s6} /pilot_tb/PD/XC0CntrI(13) {-height 15 -radix s6} /pilot_tb/PD/XC0CntrI(12) {-height 15 -radix s6} /pilot_tb/PD/XC0CntrI(11) {-height 15 -radix s6} /pilot_tb/PD/XC0CntrI(10) {-height 15 -radix s6} /pilot_tb/PD/XC0CntrI(9) {-height 15 -radix s6} /pilot_tb/PD/XC0CntrI(8) {-height 15 -radix s6} /pilot_tb/PD/XC0CntrI(7) {-height 15 -radix s6} /pilot_tb/PD/XC0CntrI(6) {-height 15 -radix s6} /pilot_tb/PD/XC0CntrI(5) {-height 15 -radix s6} /pilot_tb/PD/XC0CntrI(4) {-height 15 -radix s6} /pilot_tb/PD/XC0CntrI(3) {-height 15 -radix s6} /pilot_tb/PD/XC0CntrI(2) {-height 15 -radix s6} /pilot_tb/PD/XC0CntrI(1) {-height 15 -radix s6} /pilot_tb/PD/XC0CntrI(0) {-height 15 -radix s6} /pilot_tb/PD/XC0CntrI(-1) {-height 15 -radix s6} /pilot_tb/PD/XC0CntrI(-2) {-height 15 -radix s6} /pilot_tb/PD/XC0CntrI(-3) {-height 15 -radix s6}} sim:/pilot_tb/PD/XC0CntrI
add wave -noupdate -radix s6 -childformat {{/pilot_tb/PD/XC0PosR(14) -radix s6} {/pilot_tb/PD/XC0PosR(13) -radix s6} {/pilot_tb/PD/XC0PosR(12) -radix s6} {/pilot_tb/PD/XC0PosR(11) -radix s6} {/pilot_tb/PD/XC0PosR(10) -radix s6} {/pilot_tb/PD/XC0PosR(9) -radix s6} {/pilot_tb/PD/XC0PosR(8) -radix s6} {/pilot_tb/PD/XC0PosR(7) -radix s6} {/pilot_tb/PD/XC0PosR(6) -radix s6} {/pilot_tb/PD/XC0PosR(5) -radix s6} {/pilot_tb/PD/XC0PosR(4) -radix s6} {/pilot_tb/PD/XC0PosR(3) -radix s6} {/pilot_tb/PD/XC0PosR(2) -radix s6} {/pilot_tb/PD/XC0PosR(1) -radix s6} {/pilot_tb/PD/XC0PosR(0) -radix s6} {/pilot_tb/PD/XC0PosR(-1) -radix s6} {/pilot_tb/PD/XC0PosR(-2) -radix s6} {/pilot_tb/PD/XC0PosR(-3) -radix s6}} -subitemconfig {/pilot_tb/PD/XC0PosR(14) {-height 15 -radix s6} /pilot_tb/PD/XC0PosR(13) {-height 15 -radix s6} /pilot_tb/PD/XC0PosR(12) {-height 15 -radix s6} /pilot_tb/PD/XC0PosR(11) {-height 15 -radix s6} /pilot_tb/PD/XC0PosR(10) {-height 15 -radix s6} /pilot_tb/PD/XC0PosR(9) {-height 15 -radix s6} /pilot_tb/PD/XC0PosR(8) {-height 15 -radix s6} /pilot_tb/PD/XC0PosR(7) {-height 15 -radix s6} /pilot_tb/PD/XC0PosR(6) {-height 15 -radix s6} /pilot_tb/PD/XC0PosR(5) {-height 15 -radix s6} /pilot_tb/PD/XC0PosR(4) {-height 15 -radix s6} /pilot_tb/PD/XC0PosR(3) {-height 15 -radix s6} /pilot_tb/PD/XC0PosR(2) {-height 15 -radix s6} /pilot_tb/PD/XC0PosR(1) {-height 15 -radix s6} /pilot_tb/PD/XC0PosR(0) {-height 15 -radix s6} /pilot_tb/PD/XC0PosR(-1) {-height 15 -radix s6} /pilot_tb/PD/XC0PosR(-2) {-height 15 -radix s6} /pilot_tb/PD/XC0PosR(-3) {-height 15 -radix s6}} sim:/pilot_tb/PD/XC0PosR
add wave -noupdate -radix s6 sim:/pilot_tb/PD/XC0PosI
add wave -noupdate -radix s6 sim:/pilot_tb/PD/XC1NegR
add wave -noupdate -radix s6 sim:/pilot_tb/PD/XC1NegI
add wave -noupdate -radix s6 sim:/pilot_tb/PD/XC1CntrR
add wave -noupdate -radix s6 sim:/pilot_tb/PD/XC1CntrI
add wave -noupdate -radix s6 sim:/pilot_tb/PD/XC1PosR
add wave -noupdate -radix s6 sim:/pilot_tb/PD/XC1PosI
add wave -noupdate sim:/pilot_tb/PD/ValidMult
add wave -noupdate -clampanalog 1 sim:/pilot_tb/PD/iFftNeg0R
add wave -noupdate -clampanalog 1 sim:/pilot_tb/PD/iFftNeg0I
add wave -noupdate -clampanalog 1 sim:/pilot_tb/PD/iFftNeg1R
add wave -noupdate -clampanalog 1 sim:/pilot_tb/PD/iFftNeg1I
add wave -noupdate -clampanalog 1 sim:/pilot_tb/PD/iFftCntr0R
add wave -noupdate -clampanalog 1 sim:/pilot_tb/PD/iFftCntr0I
add wave -noupdate -clampanalog 1 sim:/pilot_tb/PD/iFftCntr1R
add wave -noupdate -clampanalog 1 sim:/pilot_tb/PD/iFftCntr1I
add wave -noupdate -clampanalog 1 sim:/pilot_tb/PD/iFftPos0R
add wave -noupdate -clampanalog 1 sim:/pilot_tb/PD/iFftPos0I
add wave -noupdate -clampanalog 1 sim:/pilot_tb/PD/iFftPos1R
add wave -noupdate -clampanalog 1 sim:/pilot_tb/PD/iFftPos1I
add wave -noupdate sim:/pilot_tb/PD/ValidIFftOut
add wave -noupdate -radix hexadecimal -childformat {{/pilot_tb/PD/MultTLast(6) -radix hexadecimal} {/pilot_tb/PD/MultTLast(5) -radix hexadecimal} {/pilot_tb/PD/MultTLast(4) -radix hexadecimal} {/pilot_tb/PD/MultTLast(3) -radix hexadecimal} {/pilot_tb/PD/MultTLast(2) -radix hexadecimal} {/pilot_tb/PD/MultTLast(1) -radix hexadecimal} {/pilot_tb/PD/MultTLast(0) -radix hexadecimal}} -subitemconfig {/pilot_tb/PD/MultTLast(6) {-height 15 -radix hexadecimal} /pilot_tb/PD/MultTLast(5) {-height 15 -radix hexadecimal} /pilot_tb/PD/MultTLast(4) {-height 15 -radix hexadecimal} /pilot_tb/PD/MultTLast(3) {-height 15 -radix hexadecimal} /pilot_tb/PD/MultTLast(2) {-height 15 -radix hexadecimal} /pilot_tb/PD/MultTLast(1) {-height 15 -radix hexadecimal} /pilot_tb/PD/MultTLast(0) {-height 15 -radix hexadecimal}} sim:/pilot_tb/PD/MultTLast
add wave -noupdate sim:/pilot_tb/PD/StartPeak
add wave -noupdate sim:/pilot_tb/PD/AbsPos0
add wave -noupdate sim:/pilot_tb/PD/AbsPos1
add wave -noupdate -clampanalog 1 -format Analog-Step -height 74 -max 42526.0 -radix sfixed sim:/pilot_tb/PD/AbsCntr0
add wave -noupdate -clampanalog 1 -format Analog-Step -height 74 -max 42526.0 sim:/pilot_tb/PD/AbsCntr1
add wave -noupdate sim:/pilot_tb/PD/AbsNeg0
add wave -noupdate sim:/pilot_tb/PD/AbsNeg1
add wave -noupdate sim:/pilot_tb/PD/ValidAbs
add wave -noupdate sim:/pilot_tb/PD/MaxPos
add wave -noupdate -clampanalog 1 -format Analog-Step -height 74 -max 42526.0 sim:/pilot_tb/PD/MaxCntr
add wave -noupdate sim:/pilot_tb/PD/MaxNeg
add wave -noupdate sim:/pilot_tb/PD/IgnoreInitial
add wave -noupdate sim:/pilot_tb/PD/MagDelay
add wave -noupdate sim:/pilot_tb/PD/OverflowFft
add wave -noupdate sim:/pilot_tb/PD/OverflowIFftCntr0
add wave -noupdate sim:/pilot_tb/PD/OverflowIFftCntr1
add wave -noupdate sim:/pilot_tb/PD/OverflowIFftNeg0
add wave -noupdate sim:/pilot_tb/PD/OverflowIFftNeg1
add wave -noupdate sim:/pilot_tb/PD/OverflowIFftPos0
add wave -noupdate sim:/pilot_tb/PD/OverflowIFftPos1
add wave -noupdate sim:/pilot_tb/PD/PS_u/IndexIn
add wave -noupdate sim:/pilot_tb/PD/PS_u/OFFSET
add wave -noupdate sim:/pilot_tb/PD/CalcThreshold
add wave -noupdate -radix unsigned -radixshowbase 0 sim:/pilot_tb/PD/PeakPointer
add wave -noupdate -format Analog-Step -height 74 -max 123918.0 -min -123855.0 sim:/pilot_tb/PD/RealOutA
add wave -noupdate -format Analog-Step -height 74 -max 123642.00000000001 -min -123648.0 sim:/pilot_tb/PD/ImagOutA
add wave -noupdate sim:/pilot_tb/PD/StartOutA
add wave -noupdate sim:/pilot_tb/PD/ValidOutA
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 3} {7011251 ps} 0} {{Cursor 4} {156362710 ps} 0}
quietly wave cursor active 2
configure wave -namecolwidth 271
configure wave -valuecolwidth 74
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
WaveRestoreZoom {154353219 ps} {158038367 ps}
bookmark add wave bookmark0 {{2508730 ps} {2540670 ps}} 0
bookmark add wave bookmark1 {{3023030 ps} {3054970 ps}} 0
bookmark add wave bookmark2 {{2187685 ps} {2199857 ps}} 33
bookmark add wave bookmark3 {{3212803 ps} {3228773 ps}} 48
