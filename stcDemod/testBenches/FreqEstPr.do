onerror {resume}
radix define FLoat16 -fixed -fraction 27 -signed -base signed -precision 6
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix unsigned /freqest_tb/Freq_u/DATA_WIDTH
add wave -noupdate -radix unsigned /freqest_tb/Freq_u/FFT_LENGTH
add wave -noupdate -radix unsigned /freqest_tb/Freq_u/NDX
add wave -noupdate /freqest_tb/Freq_u/clk
add wave -noupdate /freqest_tb/Freq_u/reset
add wave -noupdate /freqest_tb/Freq_u/ce
add wave -noupdate -radix sfixed /freqest_tb/Freq_u/Rr
add wave -noupdate -radix sfixed /freqest_tb/Freq_u/Ri
add wave -noupdate -radix sfixed /freqest_tb/Freq_u/Tau0Est
add wave -noupdate -radix sfixed /freqest_tb/Freq_u/Tau1Est
add wave -noupdate -radix sfixed /freqest_tb/Freq_u/H0EstR
add wave -noupdate -radix sfixed /freqest_tb/Freq_u/H0EstI
add wave -noupdate -radix sfixed /freqest_tb/Freq_u/H1EstR
add wave -noupdate -radix sfixed /freqest_tb/Freq_u/H1EstI
add wave -noupdate -radix sfixed /freqest_tb/tempCount
add wave -noupdate /freqest_tb/Freq_u/StartIn
add wave -noupdate /freqest_tb/Freq_u/freq
add wave -noupdate /freqest_tb/Freq_u/AcqTrack
add wave -noupdate /freqest_tb/Freq_u/Done
add wave -noupdate -radix unsigned /freqest_tb/Freq_u/BufCntr
add wave -noupdate -radix unsigned /freqest_tb/Freq_u/Offset
add wave -noupdate -radix unsigned /freqest_tb/Freq_u/BufCntrMinusOffset
add wave -noupdate -radix unsigned /freqest_tb/Freq_u/PR_Count
add wave -noupdate /freqest_tb/Freq_u/Push
add wave -noupdate /freqest_tb/Freq_u/WrEnPilotA
add wave -noupdate /freqest_tb/Freq_u/WrEnPilotB
add wave -noupdate /freqest_tb/Freq_u/WrEnPilotC
add wave -noupdate -radix sfixed /freqest_tb/Freq_u/p0_r
add wave -noupdate -radix sfixed /freqest_tb/Freq_u/p0_i
add wave -noupdate -radix sfixed /freqest_tb/Freq_u/p1_r
add wave -noupdate -radix sfixed /freqest_tb/Freq_u/p1_i
add wave -noupdate -radix sfixed /freqest_tb/Freq_u/p0Offset_r
add wave -noupdate -radix sfixed /freqest_tb/Freq_u/p0Offset_i
add wave -noupdate -radix sfixed /freqest_tb/Freq_u/p1Offset_r
add wave -noupdate -radix sfixed /freqest_tb/Freq_u/p1Offset_i
add wave -noupdate -divider {New Divider}
add wave -noupdate -format Analog-Step -height 74 -max 189813000.0 -min -189813000.0 -radix sfixed /freqest_tb/Freq_u/p_r
add wave -noupdate -format Analog-Step -height 74 -max 189813000.0 -min -189813000.0 -radix sfixed /freqest_tb/Freq_u/p_i
add wave -noupdate -radix sfixed /freqest_tb/Freq_u/RrDelay(2)
add wave -noupdate -radix sfixed /freqest_tb/Freq_u/RiDelay(2)
add wave -noupdate -format Analog-Step -height 74 -max 355595403.0 -min -521142270.0 -radix sfixed /freqest_tb/Freq_u/PilotTemplate0R
add wave -noupdate -format Analog-Step -height 74 -max 470973687.99999994 -min -395313148.0 -radix sfixed /freqest_tb/Freq_u/PilotTemplate0I
add wave -noupdate -format Analog-Step -height 74 -max 357656825.99999994 -min -523239422.0 -radix sfixed /freqest_tb/Freq_u/PilotTemplate1R
add wave -noupdate -format Analog-Step -height 74 -max 472999381.99999994 -min -397410300.0 -radix sfixed /freqest_tb/Freq_u/PilotTemplate1I
add wave -noupdate -format Analog-Step -height 74 -max 357656999.99999994 -min -523239000.0 -radix sfixed /freqest_tb/Freq_u/PilotTemplate2R
add wave -noupdate -format Analog-Step -height 74 -max 472999000.00000012 -min -397410000.0 -radix sfixed /freqest_tb/Freq_u/PilotTemplate2I
add wave -noupdate -format Analog-Step -height 74 -max 357656999.99999994 -min -523239000.0 -radix sfixed /freqest_tb/Freq_u/PilotTemplate3R
add wave -noupdate -format Analog-Step -height 74 -max 472999000.00000012 -min -397410000.0 -radix sfixed /freqest_tb/Freq_u/PilotTemplate3I
add wave -noupdate -radix sfixed /freqest_tb/Freq_u/p0H0rr
add wave -noupdate -radix sfixed /freqest_tb/Freq_u/p0H0ii
add wave -noupdate -radix sfixed /freqest_tb/Freq_u/p0H0ri
add wave -noupdate -radix sfixed /freqest_tb/Freq_u/p0H0ir
add wave -noupdate -radix sfixed /freqest_tb/Freq_u/p1OffH1rr
add wave -noupdate -radix sfixed /freqest_tb/Freq_u/p1OffH1ii
add wave -noupdate -radix sfixed /freqest_tb/Freq_u/p1OffH1ir
add wave -noupdate -radix sfixed /freqest_tb/Freq_u/p1OffH1ri
add wave -noupdate -radix sfixed /freqest_tb/Freq_u/p1H1rr
add wave -noupdate -radix sfixed /freqest_tb/Freq_u/p1H1ii
add wave -noupdate -radix sfixed /freqest_tb/Freq_u/p1H1ri
add wave -noupdate -radix sfixed /freqest_tb/Freq_u/p1H1ir
add wave -noupdate -radix sfixed /freqest_tb/Freq_u/p0OffH0rr
add wave -noupdate -radix sfixed /freqest_tb/Freq_u/p0OffH0ii
add wave -noupdate -radix sfixed /freqest_tb/Freq_u/p0OffH0ir
add wave -noupdate -radix sfixed /freqest_tb/Freq_u/p0OffH0ri
add wave -noupdate -format Analog-Step -height 74 -max 338844999.99999994 -min -362572000.0 -radix sfixed /freqest_tb/Freq_u/RrPr
add wave -noupdate -format Analog-Step -height 74 -max 317068999.99999994 -min -296817000.0 -radix sfixed /freqest_tb/Freq_u/RrPi
add wave -noupdate -format Analog-Step -height 74 -max 362572000.0 -min -338845000.0 -radix sfixed /freqest_tb/Freq_u/RiPr
add wave -noupdate -format Analog-Step -height 74 -max 296816999.99999994 -min -317069000.0 -radix sfixed /freqest_tb/Freq_u/RiPi
add wave -noupdate -radix sfixed /freqest_tb/Freq_u/Pilot2Prr
add wave -noupdate -radix sfixed /freqest_tb/Freq_u/Pilot2Pri
add wave -noupdate -radix sfixed /freqest_tb/Freq_u/Pilot2Pir
add wave -noupdate -radix sfixed /freqest_tb/Freq_u/Pilot2Pii
add wave -noupdate -radix sfixed /freqest_tb/Freq_u/Pilot1Prr
add wave -noupdate -radix sfixed /freqest_tb/Freq_u/Pilot1Pri
add wave -noupdate -radix sfixed /freqest_tb/Freq_u/Pilot1Pir
add wave -noupdate -radix sfixed /freqest_tb/Freq_u/Pilot1Pii
add wave -noupdate -radix sfixed /freqest_tb/Freq_u/Pilot0Prr
add wave -noupdate -radix sfixed /freqest_tb/Freq_u/Pilot0Pri
add wave -noupdate -radix sfixed /freqest_tb/Freq_u/Pilot0Pir
add wave -noupdate -radix sfixed /freqest_tb/Freq_u/Pilot0Pii
add wave -noupdate -radix sfixed /freqest_tb/Freq_u/PilotPtr2R
add wave -noupdate -radix sfixed /freqest_tb/Freq_u/PilotPtr2I
add wave -noupdate -radix sfixed /freqest_tb/Freq_u/PilotPtr1R
add wave -noupdate -radix sfixed /freqest_tb/Freq_u/PilotPtr1I
add wave -noupdate -radix sfixed /freqest_tb/Freq_u/PilotPtr0R
add wave -noupdate -radix sfixed /freqest_tb/Freq_u/PilotPtr0I
add wave -noupdate /freqest_tb/Freq_u/tempCount
add wave -noupdate /freqest_tb/Freq_u/PilotPtr2
add wave -noupdate /freqest_tb/Freq_u/PilotPtr1
add wave -noupdate /freqest_tb/Freq_u/PilotPtr0
add wave -noupdate /freqest_tb/Freq_u/PilotBufWrData
add wave -noupdate /freqest_tb/Freq_u/PilotBufArd
add wave -noupdate /freqest_tb/Freq_u/PilotBufBrd
add wave -noupdate /freqest_tb/Freq_u/PilotBufCrd
add wave -noupdate /freqest_tb/Freq_u/MuxCntr
add wave -noupdate -divider BuffA
add wave -noupdate /freqest_tb/Freq_u/PilotBufA/reset
add wave -noupdate /freqest_tb/Freq_u/PilotBufA/WrEn
add wave -noupdate /freqest_tb/Freq_u/PilotBufA/WrAddr
add wave -noupdate /freqest_tb/Freq_u/PilotBufA/WrData
add wave -noupdate /freqest_tb/Freq_u/PilotBufA/RdOutA
add wave -noupdate -divider BuffB
add wave -noupdate /freqest_tb/Freq_u/PilotBufB/WrEn
add wave -noupdate /freqest_tb/Freq_u/PilotBufB/WrAddr
add wave -noupdate /freqest_tb/Freq_u/PilotBufB/WrData
add wave -noupdate -divider BuffC
add wave -noupdate /freqest_tb/Freq_u/PilotBufC/WrEn
add wave -noupdate /freqest_tb/Freq_u/PilotBufC/WrAddr
add wave -noupdate /freqest_tb/Freq_u/PilotBufC/WrData
add wave -noupdate -radix sfixed /freqest_tb/Freq_u/FE_FFT_R
add wave -noupdate -radix sfixed /freqest_tb/Freq_u/FE_FFT_I
add wave -noupdate -radix sfixed /freqest_tb/Freq_u/PilotTemplateDown3R
add wave -noupdate -radix sfixed /freqest_tb/Freq_u/PilotTemplateDown3I
add wave -noupdate -radix sfixed /freqest_tb/Freq_u/PilotTemplateDown2R
add wave -noupdate -radix sfixed /freqest_tb/Freq_u/PilotTemplateDown2I
add wave -noupdate -radix sfixed /freqest_tb/Freq_u/PilotTemplateDown1R
add wave -noupdate -radix sfixed /freqest_tb/Freq_u/PilotTemplateDown1I
add wave -noupdate -radix sfixed /freqest_tb/Freq_u/PilotTemplateDown0R
add wave -noupdate -radix sfixed /freqest_tb/Freq_u/PilotTemplateDown0I
add wave -noupdate -radix sfixed /freqest_tb/Freq_u/PilotTemplateDownR
add wave -noupdate -radix sfixed /freqest_tb/Freq_u/PilotTemplateDownI
add wave -noupdate -radix sfixed /freqest_tb/Freq_u/DFT_InputsR
add wave -noupdate -radix sfixed /freqest_tb/Freq_u/DFT_InputsI
add wave -noupdate /freqest_tb/Freq_u/PilotCount
add wave -noupdate /freqest_tb/Freq_u/DFT_Count
add wave -noupdate /freqest_tb/Freq_u/CycleCount
add wave -noupdate /freqest_tb/Freq_u/Dec64Wait
add wave -noupdate /freqest_tb/Freq_u/StartDFT_A
add wave -noupdate /freqest_tb/Freq_u/StartDFT_B
add wave -noupdate /freqest_tb/Freq_u/CycleDFT_A
add wave -noupdate /freqest_tb/Freq_u/CycleDFT_B
add wave -noupdate /freqest_tb/Freq_u/StartDec64
add wave -noupdate /freqest_tb/Freq_u/DoneDec64
add wave -noupdate /freqest_tb/Freq_u/StartFFT
add wave -noupdate /freqest_tb/Freq_u/DoneFE_FFT
add wave -noupdate /freqest_tb/Freq_u/DFT_DoneA
add wave -noupdate /freqest_tb/Freq_u/DFT_DoneB
add wave -noupdate /freqest_tb/Freq_u/DoneSearch
add wave -noupdate /freqest_tb/Freq_u/StartDelay
add wave -noupdate -radix sfixed /freqest_tb/Freq_u/MaxValue
add wave -noupdate -radix sfixed /freqest_tb/Freq_u/DFT_ValueA
add wave -noupdate -radix sfixed /freqest_tb/Freq_u/DFT_ValueB
add wave -noupdate /freqest_tb/Freq_u/PilotIndex
add wave -noupdate /freqest_tb/Freq_u/DataGatherCycle
add wave -noupdate /freqest_tb/Freq_u/FFT_Index
add wave -noupdate /freqest_tb/Freq_u/MaxIndex
add wave -noupdate -radix sfixed /freqest_tb/Freq_u/DFT_IndexInA
add wave -noupdate -radix sfixed /freqest_tb/Freq_u/DFT_IndexInB
add wave -noupdate -radix sfixed /freqest_tb/Freq_u/DFT_IndexA
add wave -noupdate -radix sfixed /freqest_tb/Freq_u/DFT_IndexB
add wave -noupdate -radix sfixed /freqest_tb/Freq_u/FreqCoarse
add wave -noupdate -radix sfixed /freqest_tb/Freq_u/HistCntrFreq
add wave -noupdate -radix sfixed /freqest_tb/Freq_u/FreqEst
add wave -noupdate /freqest_tb/Freq_u/Histogram
add wave -noupdate /freqest_tb/Freq_u/SearchMode
add wave -noupdate /freqest_tb/Freq_u/R_TOP
add wave -noupdate /freqest_tb/Freq_u/R_END
add wave -noupdate /freqest_tb/Freq_u/I_TOP
add wave -noupdate /freqest_tb/Freq_u/I_END
add wave -noupdate /freqest_tb/Freq_u/IND_START
add wave -noupdate /freqest_tb/Freq_u/FS
add wave -noupdate /freqest_tb/Freq_u/LOG2_FFT_LENGTH
add wave -noupdate /freqest_tb/Freq_u/PILOT_COUNT_DONE
add wave -noupdate /freqest_tb/Freq_u/CYCLE_MAX
add wave -noupdate /freqest_tb/Freq_u/DELTA_F_IND
add wave -noupdate /freqest_tb/Freq_u/FREQ_RES
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {514000 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 279
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
WaveRestoreZoom {0 ps} {6300 ns}
