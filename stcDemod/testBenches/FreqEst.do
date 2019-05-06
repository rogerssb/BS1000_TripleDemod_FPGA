onerror {resume}
radix define fixed#17#decimal#signed -fixed -fraction 17 -signed -base signed -precision 6
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
radix define s31 -fixed -fraction 31 -signed -precision 6
radix define fixed#5#decimal#signed -fixed -fraction 5 -signed -base signed -precision 6
radix define fixed#17#decimal -fixed -fraction 17 -base signed -precision 6
quietly WaveActivateNextPane {} 0
add wave -noupdate /freqest_tb/FirstStart
add wave -noupdate /freqest_tb/FirstTime
add wave -noupdate /freqest_tb/StartIn
add wave -noupdate /freqest_tb/ValidIn
add wave -noupdate /freqest_tb/Dones
add wave -noupdate -radix unsigned /freqest_tb/PacketCount
add wave -noupdate -radix sfixed /freqest_tb/r_r
add wave -noupdate -radix sfixed /freqest_tb/r_i
add wave -noupdate /freqest_tb/Freq_u/FFT_LENGTH
add wave -noupdate /freqest_tb/Freq_u/NDX
add wave -noupdate /freqest_tb/Freq_u/reset
add wave -noupdate /freqest_tb/Freq_u/ce
add wave -noupdate /freqest_tb/Freq_u/StartIn
add wave -noupdate /freqest_tb/Freq_u/ValidIn
add wave -noupdate -radix sfixed /freqest_tb/Freq_u/Rr
add wave -noupdate -radix sfixed /freqest_tb/Freq_u/Ri
add wave -noupdate -radix sfixed /freqest_tb/Freq_u/Tau0Est
add wave -noupdate -radix sfixed /freqest_tb/Freq_u/Tau1Est
add wave -noupdate -radix sfixed /freqest_tb/Freq_u/H0EstR
add wave -noupdate -radix sfixed /freqest_tb/Freq_u/H0EstI
add wave -noupdate -radix sfixed /freqest_tb/Freq_u/H1EstR
add wave -noupdate -radix sfixed /freqest_tb/Freq_u/H1EstI
add wave -noupdate -radix sfixed /freqest_tb/Freq_u/Freq
add wave -noupdate -radix sfixed /freqest_tb/Freq_u/AcqTrack
add wave -noupdate -radix sfixed /freqest_tb/Freq_u/Done
add wave -noupdate -radix sfixed /freqest_tb/Freq_u/p0_r
add wave -noupdate -radix sfixed /freqest_tb/Freq_u/p0_i
add wave -noupdate -radix sfixed /freqest_tb/Freq_u/p1_r
add wave -noupdate -radix sfixed /freqest_tb/Freq_u/p1_i
add wave -noupdate -radix sfixed /freqest_tb/Freq_u/p0Offset_r
add wave -noupdate -radix sfixed /freqest_tb/Freq_u/p0Offset_i
add wave -noupdate -radix sfixed /freqest_tb/Freq_u/p1Offset_r
add wave -noupdate -radix sfixed /freqest_tb/Freq_u/p1Offset_i
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
add wave -noupdate -radix sfixed /freqest_tb/Freq_u/PilotPtr2R
add wave -noupdate -radix sfixed /freqest_tb/Freq_u/PilotPtr2I
add wave -noupdate -radix sfixed /freqest_tb/Freq_u/PilotPtr1R
add wave -noupdate -radix sfixed /freqest_tb/Freq_u/PilotPtr1I
add wave -noupdate -radix sfixed /freqest_tb/Freq_u/PilotPtr0R
add wave -noupdate -radix sfixed /freqest_tb/Freq_u/PilotPtr0I
add wave -noupdate -radix sfixed /freqest_tb/Freq_u/p_r
add wave -noupdate -radix sfixed /freqest_tb/Freq_u/p_i
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
add wave -noupdate -radix sfixed -childformat {{/freqest_tb/Freq_u/RrDelay(3) -radix sfixed} {/freqest_tb/Freq_u/RrDelay(2) -radix sfixed} {/freqest_tb/Freq_u/RrDelay(1) -radix sfixed} {/freqest_tb/Freq_u/RrDelay(0) -radix sfixed}} -subitemconfig {/freqest_tb/Freq_u/RrDelay(3) {-height 15 -radix sfixed} /freqest_tb/Freq_u/RrDelay(2) {-height 15 -radix sfixed} /freqest_tb/Freq_u/RrDelay(1) {-height 15 -radix sfixed} /freqest_tb/Freq_u/RrDelay(0) {-height 15 -radix sfixed}} /freqest_tb/Freq_u/RrDelay
add wave -noupdate -radix sfixed -childformat {{/freqest_tb/Freq_u/RiDelay(3) -radix sfixed} {/freqest_tb/Freq_u/RiDelay(2) -radix sfixed} {/freqest_tb/Freq_u/RiDelay(1) -radix sfixed} {/freqest_tb/Freq_u/RiDelay(0) -radix sfixed}} -subitemconfig {/freqest_tb/Freq_u/RiDelay(3) {-height 15 -radix sfixed} /freqest_tb/Freq_u/RiDelay(2) {-height 15 -radix sfixed} /freqest_tb/Freq_u/RiDelay(1) {-height 15 -radix sfixed} /freqest_tb/Freq_u/RiDelay(0) {-height 15 -radix sfixed}} /freqest_tb/Freq_u/RiDelay
add wave -noupdate -radix sfixed /freqest_tb/Freq_u/p0_r_slv
add wave -noupdate -radix sfixed /freqest_tb/Freq_u/p0_i_slv
add wave -noupdate -radix sfixed /freqest_tb/Freq_u/p1_r_slv
add wave -noupdate -radix sfixed /freqest_tb/Freq_u/p1_i_slv
add wave -noupdate -radix sfixed /freqest_tb/Freq_u/p0OffsetRslv
add wave -noupdate -radix sfixed /freqest_tb/Freq_u/p0OffsetIslv
add wave -noupdate -radix sfixed /freqest_tb/Freq_u/p1OffsetRslv
add wave -noupdate -radix sfixed /freqest_tb/Freq_u/p1OffsetIslv
add wave -noupdate -radix sfixed /freqest_tb/Freq_u/RrPr
add wave -noupdate -radix sfixed /freqest_tb/Freq_u/RrPi
add wave -noupdate -radix sfixed /freqest_tb/Freq_u/RiPr
add wave -noupdate -radix sfixed /freqest_tb/Freq_u/RiPi
add wave -noupdate -radix sfixed /freqest_tb/Freq_u/PilotTemplate3R
add wave -noupdate -radix sfixed /freqest_tb/Freq_u/PilotTemplate3I
add wave -noupdate -radix sfixed /freqest_tb/Freq_u/PilotTemplate0R
add wave -noupdate -radix sfixed /freqest_tb/Freq_u/PilotTemplate0I
add wave -noupdate -radix sfixed /freqest_tb/Freq_u/PilotTemplate1R
add wave -noupdate -radix sfixed /freqest_tb/Freq_u/PilotTemplate1I
add wave -noupdate -radix sfixed /freqest_tb/Freq_u/PilotTemplate2R
add wave -noupdate -radix sfixed /freqest_tb/Freq_u/PilotTemplate2I
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
add wave -noupdate -radix sfixed /freqest_tb/Freq_u/PilotDownSlvR
add wave -noupdate -radix sfixed /freqest_tb/Freq_u/PilotDownSlvI
add wave -noupdate -format Analog-Step -height 74 -max 19210900.0 -min -15988300.0 -radix sfixed /freqest_tb/Freq_u/FE_FFT_R
add wave -noupdate -format Analog-Step -height 74 -max 14106299.999999996 -min -19713700.0 -radix sfixed /freqest_tb/Freq_u/FE_FFT_I
add wave -noupdate -format Analog-Step -height 74 -max 5370.0 -radix sfixed /freqest_tb/Freq_u/SquareRe
add wave -noupdate -format Analog-Step -height 74 -max 5655.0 -radix sfixed /freqest_tb/Freq_u/SquareIm
add wave -noupdate -format Analog-Step -height 74 -max 5999.0 -radix sfixed /freqest_tb/Freq_u/ComplexAbs
add wave -noupdate -format Analog-Step -height 74 -max 5301.0 /freqest_tb/Freq_u/NaturalRead
add wave -noupdate -radix sfixed /freqest_tb/Freq_u/FftMaxValue
add wave -noupdate -radix sfixed /freqest_tb/Freq_u/DFT_InputsR
add wave -noupdate -radix sfixed /freqest_tb/Freq_u/DFT_InputsI
add wave -noupdate -radix sfixed /freqest_tb/Freq_u/PilotPtr2
add wave -noupdate -radix sfixed /freqest_tb/Freq_u/PilotPtr1
add wave -noupdate -radix sfixed /freqest_tb/Freq_u/PilotPtr0
add wave -noupdate -radix sfixed /freqest_tb/Freq_u/PilotBufWrData
add wave -noupdate -radix sfixed /freqest_tb/Freq_u/PilotBufArd
add wave -noupdate -radix sfixed /freqest_tb/Freq_u/PilotBufBrd
add wave -noupdate -radix sfixed /freqest_tb/Freq_u/PilotBufCrd
add wave -noupdate -radix sfixed /freqest_tb/Freq_u/MuxCntr
add wave -noupdate -radix sfixed /freqest_tb/Freq_u/BufCntr
add wave -noupdate -radix sfixed /freqest_tb/Freq_u/BufCntrMinusOffset
add wave -noupdate -radix sfixed /freqest_tb/Freq_u/Offset
add wave -noupdate -radix sfixed /freqest_tb/Freq_u/PR_Count
add wave -noupdate -radix sfixed /freqest_tb/Freq_u/PilotCount
add wave -noupdate -radix sfixed /freqest_tb/Freq_u/DFT_Count
add wave -noupdate -radix sfixed /freqest_tb/Freq_u/CycleCount
add wave -noupdate -radix sfixed /freqest_tb/Freq_u/FftIndex
add wave -noupdate -radix sfixed /freqest_tb/Freq_u/FftIndex2
add wave -noupdate /freqest_tb/Freq_u/Push
add wave -noupdate /freqest_tb/Freq_u/WrEnPilotA
add wave -noupdate /freqest_tb/Freq_u/WrEnPilotB
add wave -noupdate /freqest_tb/Freq_u/WrEnPilotC
add wave -noupdate /freqest_tb/Freq_u/StartDFT_A
add wave -noupdate /freqest_tb/Freq_u/StartDFT_B
add wave -noupdate /freqest_tb/Freq_u/CycleDFT_A
add wave -noupdate /freqest_tb/Freq_u/CycleDFT_B
add wave -noupdate /freqest_tb/Freq_u/StartDec64
add wave -noupdate /freqest_tb/Freq_u/DoneDec64
add wave -noupdate /freqest_tb/Freq_u/DFT_DoneA
add wave -noupdate /freqest_tb/Freq_u/DFT_DoneB
add wave -noupdate /freqest_tb/Freq_u/FirstTime
add wave -noupdate /freqest_tb/Freq_u/TemplateActive
add wave -noupdate /freqest_tb/Freq_u/FftReady
add wave -noupdate /freqest_tb/Freq_u/ValidInFFT
add wave -noupdate /freqest_tb/Freq_u/ValidOutFFT
add wave -noupdate /freqest_tb/Freq_u/MaxValue
add wave -noupdate /freqest_tb/Freq_u/DFT_ValueA
add wave -noupdate /freqest_tb/Freq_u/DFT_ValueB
add wave -noupdate /freqest_tb/Freq_u/PilotIndex
add wave -noupdate /freqest_tb/Freq_u/HistFreqAmbgty
add wave -noupdate /freqest_tb/Freq_u/MaxIndex
add wave -noupdate /freqest_tb/Freq_u/DFT_IndexInA
add wave -noupdate /freqest_tb/Freq_u/DFT_IndexInB
add wave -noupdate /freqest_tb/Freq_u/DFT_IndexA
add wave -noupdate /freqest_tb/Freq_u/DFT_IndexB
add wave -noupdate /freqest_tb/Freq_u/FreqCoarse
add wave -noupdate /freqest_tb/Freq_u/FreqEst
add wave -noupdate -radix sfixed /freqest_tb/Freq_u/Freq
add wave -noupdate /freqest_tb/Freq_u/HistCntrFreq
add wave -noupdate /freqest_tb/Freq_u/HistogramBin
add wave -noupdate /freqest_tb/Freq_u/DataGatherCycle
add wave -noupdate /freqest_tb/Freq_u/Max2ValRatio
add wave -noupdate -expand /freqest_tb/Freq_u/Histogram
add wave -noupdate /freqest_tb/Freq_u/Max1Hist
add wave -noupdate /freqest_tb/Freq_u/Max2Hist
add wave -noupdate /freqest_tb/Freq_u/SearchMode
add wave -noupdate /freqest_tb/Freq_u/IND_START
add wave -noupdate /freqest_tb/Freq_u/LOG2_FFT_LENGTH
add wave -noupdate /freqest_tb/Freq_u/PILOT_COUNT_DONE
add wave -noupdate /freqest_tb/Freq_u/CYCLE_MAX
add wave -noupdate /freqest_tb/Freq_u/DELTA_F_IND
add wave -noupdate /freqest_tb/Freq_u/RR_DELAY
add wave -noupdate /freqest_tb/Freq_u/SearchA/X_r
add wave -noupdate /freqest_tb/Freq_u/SearchA/X_i
add wave -noupdate /freqest_tb/Freq_u/SearchA/IndexIn
add wave -noupdate /freqest_tb/Freq_u/SearchA/IndexOffset
add wave -noupdate /freqest_tb/Freq_u/SearchA/Start
add wave -noupdate /freqest_tb/Freq_u/SearchA/NextCycle
add wave -noupdate /freqest_tb/Freq_u/SearchA/Magnitude
add wave -noupdate /freqest_tb/Freq_u/SearchA/IndexOut
add wave -noupdate /freqest_tb/Freq_u/SearchA/Done
add wave -noupdate /freqest_tb/Freq_u/SearchA/Mode
add wave -noupdate /freqest_tb/Freq_u/SearchA/DoneDft
add wave -noupdate /freqest_tb/Freq_u/SearchA/MaxIndex
add wave -noupdate /freqest_tb/Freq_u/SearchA/MaxIndexAB
add wave -noupdate /freqest_tb/Freq_u/SearchA/LargestAB
add wave -noupdate /freqest_tb/Freq_u/SearchA/DftIndexA
add wave -noupdate /freqest_tb/Freq_u/SearchA/DftIndexB
add wave -noupdate /freqest_tb/Freq_u/SearchA/DftIndexC
add wave -noupdate /freqest_tb/Freq_u/SearchA/Offset
add wave -noupdate /freqest_tb/Freq_u/SearchA/MagDftA
add wave -noupdate /freqest_tb/Freq_u/SearchA/MagDftB
add wave -noupdate /freqest_tb/Freq_u/SearchA/MagDftC
add wave -noupdate /freqest_tb/Freq_u/SearchA/Largest
add wave -noupdate /freqest_tb/Freq_u/SearchA/DftCount
add wave -noupdate /freqest_tb/FreqDFT_u/AcqTrack
add wave -noupdate /freqest_tb/FreqDFT_u/BufCntr
add wave -noupdate /freqest_tb/FreqDFT_u/BufCntrMinusOffset
add wave -noupdate /freqest_tb/FreqDFT_u/ce
add wave -noupdate /freqest_tb/FreqDFT_u/clk
add wave -noupdate /freqest_tb/FreqDFT_u/CYCLE_MAX
add wave -noupdate /freqest_tb/FreqDFT_u/CycleCount
add wave -noupdate /freqest_tb/FreqDFT_u/CycleCount_Ila
add wave -noupdate /freqest_tb/FreqDFT_u/CycleDFT_A
add wave -noupdate /freqest_tb/FreqDFT_u/CycleDFT_B
add wave -noupdate /freqest_tb/FreqDFT_u/DataGatherCycle
add wave -noupdate /freqest_tb/FreqDFT_u/DELTA_F_IND
add wave -noupdate /freqest_tb/FreqDFT_u/DeltaFreq
add wave -noupdate /freqest_tb/FreqDFT_u/DeltaOverAmbig
add wave -noupdate /freqest_tb/FreqDFT_u/DFT_Count
add wave -noupdate /freqest_tb/FreqDFT_u/DFT_Done
add wave -noupdate /freqest_tb/FreqDFT_u/DFT_DoneA
add wave -noupdate /freqest_tb/FreqDFT_u/DFT_DoneA_Ila
add wave -noupdate /freqest_tb/FreqDFT_u/DFT_DoneB
add wave -noupdate /freqest_tb/FreqDFT_u/DFT_DoneB_Ila
add wave -noupdate -format Analog-Step -height 74 -max 316305.00000000012 -min -646806.0 /freqest_tb/FreqDFT_u/DFT_I_Ila
add wave -noupdate -format Analog-Step -height 74 -max 11866.999999999982 -min -731806.0 /freqest_tb/FreqDFT_u/DFT_R_Ila
add wave -noupdate /freqest_tb/FreqDFT_u/DFT_Index
add wave -noupdate /freqest_tb/FreqDFT_u/DFT_IndexA
add wave -noupdate /freqest_tb/FreqDFT_u/DFT_IndexA_Ila
add wave -noupdate /freqest_tb/FreqDFT_u/DFT_IndexB
add wave -noupdate /freqest_tb/FreqDFT_u/DFT_IndexB_Ila
add wave -noupdate /freqest_tb/FreqDFT_u/DFT_IndexInA
add wave -noupdate /freqest_tb/FreqDFT_u/DFT_IndexInA_Ila
add wave -noupdate /freqest_tb/FreqDFT_u/DFT_IndexInB
add wave -noupdate /freqest_tb/FreqDFT_u/DFT_IndexInB_Ila
add wave -noupdate /freqest_tb/FreqDFT_u/DFT_InputsR
add wave -noupdate -expand /freqest_tb/FreqDFT_u/DFT_InputsI
add wave -noupdate /freqest_tb/FreqDFT_u/DFT_Scan
add wave -noupdate /freqest_tb/FreqDFT_u/DFT_Start
add wave -noupdate /freqest_tb/FreqDFT_u/DFT_Value
add wave -noupdate /freqest_tb/FreqDFT_u/DFT_ValueA
add wave -noupdate /freqest_tb/FreqDFT_u/DFT_ValueA_Ila
add wave -noupdate /freqest_tb/FreqDFT_u/DFT_ValueB
add wave -noupdate /freqest_tb/FreqDFT_u/DFT_ValueB_Ila
add wave -noupdate /freqest_tb/FreqDFT_u/DFT_ValueOut
add wave -noupdate /freqest_tb/FreqDFT_u/DftOffset
add wave -noupdate /freqest_tb/FreqDFT_u/Done
add wave -noupdate /freqest_tb/FreqDFT_u/DoneDec64
add wave -noupdate /freqest_tb/FreqDFT_u/FirstTime
add wave -noupdate /freqest_tb/FreqDFT_u/Freq
add wave -noupdate /freqest_tb/FreqDFT_u/FreqCoarse
add wave -noupdate /freqest_tb/FreqDFT_u/FreqCoarse_Ila
add wave -noupdate /freqest_tb/FreqDFT_u/FreqEst
add wave -noupdate /freqest_tb/FreqDFT_u/FreqEst_Ila
add wave -noupdate /freqest_tb/FreqDFT_u/H0EstI
add wave -noupdate /freqest_tb/FreqDFT_u/H0EstR
add wave -noupdate /freqest_tb/FreqDFT_u/H1EstI
add wave -noupdate /freqest_tb/FreqDFT_u/H1EstR
add wave -noupdate /freqest_tb/FreqDFT_u/HistCntrFreq
add wave -noupdate /freqest_tb/FreqDFT_u/HistCntrFreq_Ila
add wave -noupdate /freqest_tb/FreqDFT_u/HistFreqAmbgty
add wave -noupdate /freqest_tb/FreqDFT_u/Histogram
add wave -noupdate /freqest_tb/FreqDFT_u/HistogramBin
add wave -noupdate /freqest_tb/FreqDFT_u/i
add wave -noupdate /freqest_tb/FreqDFT_u/I_END
add wave -noupdate /freqest_tb/FreqDFT_u/I_TOP
add wave -noupdate /freqest_tb/FreqDFT_u/IND_START
add wave -noupdate /freqest_tb/FreqDFT_u/IndexOffset
add wave -noupdate /freqest_tb/FreqDFT_u/j
add wave -noupdate /freqest_tb/FreqDFT_u/Max1Hist
add wave -noupdate /freqest_tb/FreqDFT_u/Max1Val
add wave -noupdate /freqest_tb/FreqDFT_u/Max1Val_s
add wave -noupdate /freqest_tb/FreqDFT_u/Max2Hist
add wave -noupdate /freqest_tb/FreqDFT_u/Max2Minus6
add wave -noupdate /freqest_tb/FreqDFT_u/Max2OffTimesAmb
add wave -noupdate /freqest_tb/FreqDFT_u/Max2Val
add wave -noupdate /freqest_tb/FreqDFT_u/Max2Val_s
add wave -noupdate /freqest_tb/FreqDFT_u/Max2ValRatio
add wave -noupdate /freqest_tb/FreqDFT_u/MaxIndex
add wave -noupdate /freqest_tb/FreqDFT_u/MaxIndex_Ila
add wave -noupdate /freqest_tb/FreqDFT_u/MaxValue
add wave -noupdate /freqest_tb/FreqDFT_u/MaxValue_Ila
add wave -noupdate /freqest_tb/FreqDFT_u/MINUS125K
add wave -noupdate /freqest_tb/FreqDFT_u/MuxCntr
add wave -noupdate /freqest_tb/FreqDFT_u/NDX
add wave -noupdate /freqest_tb/FreqDFT_u/Offset
add wave -noupdate /freqest_tb/FreqDFT_u/p0_i
add wave -noupdate /freqest_tb/FreqDFT_u/p0_i_slv
add wave -noupdate /freqest_tb/FreqDFT_u/p0_r
add wave -noupdate /freqest_tb/FreqDFT_u/p0_r_Ila
add wave -noupdate /freqest_tb/FreqDFT_u/p0_r_slv
add wave -noupdate /freqest_tb/FreqDFT_u/p0H0ii
add wave -noupdate /freqest_tb/FreqDFT_u/p0H0ir
add wave -noupdate /freqest_tb/FreqDFT_u/p0H0ri
add wave -noupdate /freqest_tb/FreqDFT_u/p0H0rr
add wave -noupdate /freqest_tb/FreqDFT_u/P0H0rr_Ila
add wave -noupdate /freqest_tb/FreqDFT_u/p0OffH0ii
add wave -noupdate /freqest_tb/FreqDFT_u/p0OffH0ir
add wave -noupdate /freqest_tb/FreqDFT_u/p0OffH0ri
add wave -noupdate /freqest_tb/FreqDFT_u/p0OffH0rr
add wave -noupdate /freqest_tb/FreqDFT_u/p0Offset_i
add wave -noupdate /freqest_tb/FreqDFT_u/p0Offset_r
add wave -noupdate /freqest_tb/FreqDFT_u/p0OffsetIslv
add wave -noupdate /freqest_tb/FreqDFT_u/p0OffsetRslv
add wave -noupdate /freqest_tb/FreqDFT_u/p1_i
add wave -noupdate /freqest_tb/FreqDFT_u/p1_i_slv
add wave -noupdate /freqest_tb/FreqDFT_u/p1_r
add wave -noupdate /freqest_tb/FreqDFT_u/p1_r_slv
add wave -noupdate /freqest_tb/FreqDFT_u/p1H1ii
add wave -noupdate /freqest_tb/FreqDFT_u/p1H1ir
add wave -noupdate /freqest_tb/FreqDFT_u/p1H1ri
add wave -noupdate /freqest_tb/FreqDFT_u/p1H1rr
add wave -noupdate /freqest_tb/FreqDFT_u/p1OffH1ii
add wave -noupdate /freqest_tb/FreqDFT_u/p1OffH1ir
add wave -noupdate /freqest_tb/FreqDFT_u/p1OffH1ri
add wave -noupdate /freqest_tb/FreqDFT_u/p1OffH1rr
add wave -noupdate /freqest_tb/FreqDFT_u/p1Offset_i
add wave -noupdate /freqest_tb/FreqDFT_u/p1Offset_r
add wave -noupdate /freqest_tb/FreqDFT_u/p1OffsetIslv
add wave -noupdate /freqest_tb/FreqDFT_u/p1OffsetRslv
add wave -noupdate /freqest_tb/FreqDFT_u/p_i
add wave -noupdate /freqest_tb/FreqDFT_u/p_r
add wave -noupdate /freqest_tb/FreqDFT_u/p_r_Ila
add wave -noupdate /freqest_tb/FreqDFT_u/Pilot0Pii
add wave -noupdate /freqest_tb/FreqDFT_u/Pilot0Pir
add wave -noupdate /freqest_tb/FreqDFT_u/Pilot0Pri
add wave -noupdate /freqest_tb/FreqDFT_u/Pilot0Prr
add wave -noupdate /freqest_tb/FreqDFT_u/Pilot1Pii
add wave -noupdate /freqest_tb/FreqDFT_u/Pilot1Pir
add wave -noupdate /freqest_tb/FreqDFT_u/Pilot1Pri
add wave -noupdate /freqest_tb/FreqDFT_u/Pilot1Prr
add wave -noupdate /freqest_tb/FreqDFT_u/Pilot2Pii
add wave -noupdate /freqest_tb/FreqDFT_u/Pilot2Pir
add wave -noupdate /freqest_tb/FreqDFT_u/Pilot2Pri
add wave -noupdate /freqest_tb/FreqDFT_u/Pilot2Prr
add wave -noupdate /freqest_tb/FreqDFT_u/PILOT_COUNT_DONE
add wave -noupdate /freqest_tb/FreqDFT_u/PilotBufArd
add wave -noupdate /freqest_tb/FreqDFT_u/PilotBufBrd
add wave -noupdate /freqest_tb/FreqDFT_u/PilotBufCrd
add wave -noupdate /freqest_tb/FreqDFT_u/PilotBufWrData
add wave -noupdate /freqest_tb/FreqDFT_u/PilotCount
add wave -noupdate /freqest_tb/FreqDFT_u/PilotPtr0
add wave -noupdate /freqest_tb/FreqDFT_u/PilotPtr0I
add wave -noupdate /freqest_tb/FreqDFT_u/PilotPtr0R
add wave -noupdate /freqest_tb/FreqDFT_u/PilotPtr1
add wave -noupdate /freqest_tb/FreqDFT_u/PilotPtr1I
add wave -noupdate /freqest_tb/FreqDFT_u/PilotPtr1R
add wave -noupdate /freqest_tb/FreqDFT_u/PilotPtr2
add wave -noupdate /freqest_tb/FreqDFT_u/PilotPtr2I
add wave -noupdate /freqest_tb/FreqDFT_u/PilotPtr2R
add wave -noupdate /freqest_tb/FreqDFT_u/PilotTemp3R_Ila
add wave -noupdate /freqest_tb/FreqDFT_u/PilotTemplate0I
add wave -noupdate /freqest_tb/FreqDFT_u/PilotTemplate0R
add wave -noupdate /freqest_tb/FreqDFT_u/PilotTemplate1I
add wave -noupdate /freqest_tb/FreqDFT_u/PilotTemplate1R
add wave -noupdate /freqest_tb/FreqDFT_u/PilotTemplate2I
add wave -noupdate /freqest_tb/FreqDFT_u/PilotTemplate2R
add wave -noupdate /freqest_tb/FreqDFT_u/PilotTemplate3I
add wave -noupdate /freqest_tb/FreqDFT_u/PilotTemplate3R
add wave -noupdate /freqest_tb/FreqDFT_u/PilotTemplateDown0I
add wave -noupdate /freqest_tb/FreqDFT_u/PilotTemplateDown0R
add wave -noupdate /freqest_tb/FreqDFT_u/PilotTemplateDown1I
add wave -noupdate /freqest_tb/FreqDFT_u/PilotTemplateDown1R
add wave -noupdate /freqest_tb/FreqDFT_u/PilotTemplateDown2I
add wave -noupdate /freqest_tb/FreqDFT_u/PilotTemplateDown2R
add wave -noupdate /freqest_tb/FreqDFT_u/PilotTemplateDown3I
add wave -noupdate /freqest_tb/FreqDFT_u/PilotTemplateDown3R
add wave -noupdate /freqest_tb/FreqDFT_u/PIPECOUNT5
add wave -noupdate /freqest_tb/FreqDFT_u/PipeLine
add wave -noupdate /freqest_tb/FreqDFT_u/PR_Count
add wave -noupdate /freqest_tb/FreqDFT_u/Push
add wave -noupdate /freqest_tb/FreqDFT_u/R_END
add wave -noupdate /freqest_tb/FreqDFT_u/R_TOP
add wave -noupdate /freqest_tb/FreqDFT_u/reset
add wave -noupdate /freqest_tb/FreqDFT_u/Ri
add wave -noupdate /freqest_tb/FreqDFT_u/RiDelay
add wave -noupdate /freqest_tb/FreqDFT_u/RiPi
add wave -noupdate /freqest_tb/FreqDFT_u/RiPr
add wave -noupdate /freqest_tb/FreqDFT_u/RoundUpDeltaAmbig
add wave -noupdate /freqest_tb/FreqDFT_u/Rr
add wave -noupdate /freqest_tb/FreqDFT_u/RR_DELAY
add wave -noupdate /freqest_tb/FreqDFT_u/RrDelay
add wave -noupdate /freqest_tb/FreqDFT_u/RrPi
add wave -noupdate /freqest_tb/FreqDFT_u/RrPr
add wave -noupdate /freqest_tb/FreqDFT_u/RrPr_Ila
add wave -noupdate -format Analog-Step -height 74 -max 683285.0 /freqest_tb/FreqDFT_u/Scan
add wave -noupdate /freqest_tb/FreqDFT_u/Scan_Ila
add wave -noupdate /freqest_tb/FreqDFT_u/ScanCount
add wave -noupdate /freqest_tb/FreqDFT_u/SearchMode
add wave -noupdate /freqest_tb/FreqDFT_u/StartDec64
add wave -noupdate /freqest_tb/FreqDFT_u/StartDFT_A
add wave -noupdate /freqest_tb/FreqDFT_u/StartDFT_B
add wave -noupdate /freqest_tb/FreqDFT_u/StartIn
add wave -noupdate /freqest_tb/FreqDFT_u/Tau0Est
add wave -noupdate /freqest_tb/FreqDFT_u/Tau1Est
add wave -noupdate /freqest_tb/FreqDFT_u/TemplateActive
add wave -noupdate /freqest_tb/FreqDFT_u/ValidIn
add wave -noupdate /freqest_tb/FreqDFT_u/Variables
add wave -noupdate /freqest_tb/FreqDFT_u/WrEnPilotA
add wave -noupdate /freqest_tb/FreqDFT_u/WrEnPilotB
add wave -noupdate /freqest_tb/FreqDFT_u/WrEnPilotC
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {37094050 ps} 0} {{Cursor 2} {151635285 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 335
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
WaveRestoreZoom {0 ps} {42 us}
bookmark add wave bookmark6 {{2508730 ps} {2540670 ps}} 0
bookmark add wave bookmark7 {{3023030 ps} {3054970 ps}} 0
bookmark add wave bookmark8 {{2187685 ps} {2199857 ps}} 33
bookmark add wave bookmark9 {{3212803 ps} {3228773 ps}} 48
