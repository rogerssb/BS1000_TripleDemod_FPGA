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
add wave -noupdate /stc_tb/clk
add wave -noupdate /stc_tb/STC_u/reset
add wave -noupdate -format Analog-Step -height 74 -max 123692.00000000003 -min -122266.0 -radix s18_17 -childformat {{/stc_tb/STC_u/InRBrik2Dly(17) -radix s18_17} {/stc_tb/STC_u/InRBrik2Dly(16) -radix s18_17} {/stc_tb/STC_u/InRBrik2Dly(15) -radix s18_17} {/stc_tb/STC_u/InRBrik2Dly(14) -radix s18_17} {/stc_tb/STC_u/InRBrik2Dly(13) -radix s18_17} {/stc_tb/STC_u/InRBrik2Dly(12) -radix s18_17} {/stc_tb/STC_u/InRBrik2Dly(11) -radix s18_17} {/stc_tb/STC_u/InRBrik2Dly(10) -radix s18_17} {/stc_tb/STC_u/InRBrik2Dly(9) -radix s18_17} {/stc_tb/STC_u/InRBrik2Dly(8) -radix s18_17} {/stc_tb/STC_u/InRBrik2Dly(7) -radix s18_17} {/stc_tb/STC_u/InRBrik2Dly(6) -radix s18_17} {/stc_tb/STC_u/InRBrik2Dly(5) -radix s18_17} {/stc_tb/STC_u/InRBrik2Dly(4) -radix s18_17} {/stc_tb/STC_u/InRBrik2Dly(3) -radix s18_17} {/stc_tb/STC_u/InRBrik2Dly(2) -radix s18_17} {/stc_tb/STC_u/InRBrik2Dly(1) -radix s18_17} {/stc_tb/STC_u/InRBrik2Dly(0) -radix s18_17}} -subitemconfig {/stc_tb/STC_u/InRBrik2Dly(17) {-height 15 -radix s18_17} /stc_tb/STC_u/InRBrik2Dly(16) {-height 15 -radix s18_17} /stc_tb/STC_u/InRBrik2Dly(15) {-height 15 -radix s18_17} /stc_tb/STC_u/InRBrik2Dly(14) {-height 15 -radix s18_17} /stc_tb/STC_u/InRBrik2Dly(13) {-height 15 -radix s18_17} /stc_tb/STC_u/InRBrik2Dly(12) {-height 15 -radix s18_17} /stc_tb/STC_u/InRBrik2Dly(11) {-height 15 -radix s18_17} /stc_tb/STC_u/InRBrik2Dly(10) {-height 15 -radix s18_17} /stc_tb/STC_u/InRBrik2Dly(9) {-height 15 -radix s18_17} /stc_tb/STC_u/InRBrik2Dly(8) {-height 15 -radix s18_17} /stc_tb/STC_u/InRBrik2Dly(7) {-height 15 -radix s18_17} /stc_tb/STC_u/InRBrik2Dly(6) {-height 15 -radix s18_17} /stc_tb/STC_u/InRBrik2Dly(5) {-height 15 -radix s18_17} /stc_tb/STC_u/InRBrik2Dly(4) {-height 15 -radix s18_17} /stc_tb/STC_u/InRBrik2Dly(3) {-height 15 -radix s18_17} /stc_tb/STC_u/InRBrik2Dly(2) {-height 15 -radix s18_17} /stc_tb/STC_u/InRBrik2Dly(1) {-height 15 -radix s18_17} /stc_tb/STC_u/InRBrik2Dly(0) {-height 15 -radix s18_17}} /stc_tb/STC_u/InRBrik2Dly
add wave -noupdate -format Analog-Step -height 74 -max 124433.0 -min -122388.0 -radix s18_17 /stc_tb/STC_u/InIBrik2Dly
add wave -noupdate -radix s18_17 /stc_tb/STC_u/InRBrik2Dly
add wave -noupdate -radix s18_17 /stc_tb/STC_u/InIBrik2Dly
add wave -noupdate /stc_tb/STC_u/StartInBrik2Dly
add wave -noupdate /stc_tb/STC_u/ValidInBrik2Dly
add wave -noupdate /stc_tb/STC_u/Brik2_u/DF_I
add wave -noupdate /stc_tb/STC_u/Brik2_u/DF_R
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqR
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqI
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqCount
add wave -noupdate /stc_tb/STC_u/Brik2_u/StartFreq
add wave -noupdate /stc_tb/STC_u/Brik2_u/ValidFreq
add wave -noupdate -radix sfixed /stc_tb/STC_u/Brik2_u/FreqForce
add wave -noupdate /stc_tb/STC_u/Brik2_u/CE_u/H0EstR
add wave -noupdate /stc_tb/STC_u/Brik2_u/CE_u/H0EstI
add wave -noupdate /stc_tb/STC_u/Brik2_u/H0Mag
add wave -noupdate /stc_tb/STC_u/Brik2_u/CE_u/H1EstR
add wave -noupdate /stc_tb/STC_u/Brik2_u/CE_u/H1EstI
add wave -noupdate /stc_tb/STC_u/Brik2_u/H1Mag
add wave -noupdate /stc_tb/STC_u/Brik2_u/TE_u/ResultsCMreg
add wave -noupdate /stc_tb/STC_u/Brik2_u/TE_u/Tau0Ndx
add wave -noupdate /stc_tb/STC_u/Brik2_u/TE_u/Tau1Ndx
add wave -noupdate /stc_tb/STC_u/Brik2_u/TE_u/Tau0Est
add wave -noupdate /stc_tb/STC_u/Brik2_u/TE_u/Tau1Est
add wave -noupdate /stc_tb/STC_u/Brik2_u/TE_u/CenterX
add wave -noupdate /stc_tb/STC_u/Brik2_u/TE_u/CenterY
add wave -noupdate /stc_tb/STC_u/Brik2_u/TE_u/ComputeDone
add wave -noupdate /stc_tb/STC_u/Brik2_u/TE_u/MinCM
add wave -noupdate /stc_tb/STC_u/Brik2_u/TE_u/MinIndex
add wave -noupdate /stc_tb/STC_u/Brik2_u/TE_u/ResultsCM
add wave -noupdate /stc_tb/STC_u/Brik2_u/TE_u/SsInvI0A
add wave -noupdate /stc_tb/STC_u/Brik2_u/TE_u/xx
add wave -noupdate /stc_tb/STC_u/Brik2_u/TE_u/yy
add wave -noupdate /stc_tb/STC_u/Brik2_u/TE_u/StartIn
add wave -noupdate /stc_tb/STC_u/Brik2_u/StartDF
add wave -noupdate /stc_tb/STC_u/Brik2_u/StartFreq
add wave -noupdate /stc_tb/STC_u/Brik2_u/StartIn
add wave -noupdate /stc_tb/STC_u/Brik2_u/StartMix
add wave -noupdate /stc_tb/STC_u/Brik2_u/StartSelect
add wave -noupdate /stc_tb/STC_u/Brik2_u/StartTime
add wave -noupdate /stc_tb/STC_u/Brik2_u/ValidDF
add wave -noupdate /stc_tb/STC_u/Brik2_u/ValidDFreg
add wave -noupdate -radix unsigned /stc_tb/STC_u/Brik2_u/ValidDly
add wave -noupdate /stc_tb/STC_u/Brik2_u/ValidFreq
add wave -noupdate /stc_tb/STC_u/Brik2_u/ValidIn
add wave -noupdate /stc_tb/STC_u/Brik2_u/ValidMixer
add wave -noupdate /stc_tb/STC_u/Brik2_u/ValidSinCos
add wave -noupdate -radix unsigned -radixshowbase 0 /stc_tb/STC_u/Brik2_u/TimeCount
add wave -noupdate /stc_tb/STC_u/Brik2_u/CE_u/StartIn
add wave -noupdate /stc_tb/STC_u/Brik2_u/CE_u/Done
add wave -noupdate /stc_tb/STC_u/Brik2_u/CE_u/reset
add wave -noupdate /stc_tb/STC_u/Brik2_u/CE_u/TauEst0Index
add wave -noupdate /stc_tb/STC_u/Brik2_u/CE_u/TauEst1Index
add wave -noupdate /stc_tb/STC_u/Brik2_u/Tau0Est
add wave -noupdate /stc_tb/STC_u/Brik2_u/Tau1Est
add wave -noupdate /stc_tb/STC_u/Brik2_u/CE_u/Sig0I
add wave -noupdate /stc_tb/STC_u/Brik2_u/CE_u/SpinvI0
add wave -noupdate /stc_tb/STC_u/Brik2_u/CE_u/SsInvI0Ss0I
add wave -noupdate /stc_tb/STC_u/Brik2_u/CE_u/XiSpinvI0
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqFifoIn
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqFifo/ce
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqFifo/clk
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqFifo/DATA_WIDTH
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqFifo/Depth
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqFifo/ImIn
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqFifo/ImOut
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqFifo/LastOut
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqFifo/Pop
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqFifo/PopCount
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqFifo/PopReg
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqFifo/Push
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqFifo/PushFifo
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqFifo/RdAddr
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqFifo/ReIn
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqFifo/ReOut
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqFifo/reset
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqFifo/Start
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqFifo/ValidOut
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqFifo/WORDS
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqFifo/WrAddr
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/AcqTrack
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/BufCntr
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/BufCntrMinusOffset
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/CYCLE_MAX
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/CycleCount
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/CycleCount_Ila
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/CycleDFT_A
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/CycleDFT_B
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/DELTA_F_IND
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/DFT_Count
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/DFT_Done
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/DFT_DoneA
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/DFT_DoneA_Ila
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/DFT_DoneB
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/DFT_DoneB_Ila
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/DFT_I_Ila
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/DFT_Index
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/DFT_IndexA
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/DFT_IndexA_Ila
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/DFT_IndexB
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/DFT_IndexB_Ila
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/DFT_IndexInA
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/DFT_IndexInA_Ila
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/DFT_IndexInB
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/DFT_IndexInB_Ila
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/DFT_InputsI
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/DFT_InputsR
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/DFT_R_Ila
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/DFT_Scan
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/DFT_Start
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/DFT_Value
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/DFT_ValueA
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/DFT_ValueA_Ila
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/DFT_ValueB
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/DFT_ValueB_Ila
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/DFT_ValueOut
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/DataGatherCycle
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/DeltaFreq
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/DeltaOverAmbig
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/DftOffset
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/Done
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/DoneDec64
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/FirstTime
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/Freq
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/FreqCoarse
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/FreqCoarse_Ila
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/FreqEst
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/FreqEst_Ila
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/MaxIndex
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/MaxValue
add wave -noupdate -format Analog-Step -height 74 -max 5158260.0 /stc_tb/STC_u/Brik2_u/FreqDFT_u/Scan
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/ScanCount
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/SearchMode
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/StartDFT_A
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/StartDFT_B
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/Tau0Est
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/Tau1Est
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/H0EstI
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/H0EstR
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/H1EstI
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/H1EstR
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/HistCntrFreq
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/HistCntrFreq_Ila
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/HistFreqAmbgty
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/Histogram
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/HistogramBin
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/IND_START
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/I_END
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/I_TOP
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/IlaCount32
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/IlaCount8
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/IndexOffset
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/MINUS125K
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/Max1Hist
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/Max1Val
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/Max1Val_s
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/Max2Hist
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/Max2Minus6
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/Max2OffTimesAmb
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/Max2Val
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/Max2ValRatio
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/Max2Val_s
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/MaxIndex_Ila
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/MaxValue_Ila
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/MuxCntr
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/NDX
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/Offset
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/P0H0rr_Ila
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/PILOT_COUNT_DONE
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/PIPECOUNT5
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/PR_Count
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/Pilot0Pii
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/Pilot0Pir
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/Pilot0Pri
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/Pilot0Prr
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/Pilot1Pii
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/Pilot1Pir
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/Pilot1Pri
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/Pilot1Prr
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/Pilot2Pii
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/Pilot2Pir
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/Pilot2Pri
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/Pilot2Prr
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/PilotBufArd
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/PilotBufBrd
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/PilotBufCrd
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/PilotBufWrData
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/PilotCount
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/PilotPtr0
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/PilotPtr0I
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/PilotPtr0R
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/PilotPtr1
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/PilotPtr1I
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/PilotPtr1R
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/PilotPtr2
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/PilotPtr2I
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/PilotPtr2R
add wave -noupdate -format Analog-Step -height 74 -max 207.99999999999955 -min -10997.0 -radix s18_17 /stc_tb/STC_u/Brik2_u/FreqDFT_u/PilotTemp3R_Ila
add wave -noupdate -format Analog-Step -height 74 -min -810498.0 -radix s20 /stc_tb/STC_u/Brik2_u/FreqDFT_u/PilotTempOut_Ila
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/PilotTemplate0I
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/PilotTemplate0R
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/PilotTemplate1I
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/PilotTemplate1R
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/PilotTemplate2I
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/PilotTemplate2R
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/PilotTemplate3I
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/PilotTemplate3R
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/PilotTemplateDown0I
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/PilotTemplateDown0R
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/PilotTemplateDown1I
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/PilotTemplateDown1R
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/PilotTemplateDown2I
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/PilotTemplateDown2R
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/PilotTemplateDown3I
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/PilotTemplateDown3R
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/PipeLine
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/Push
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/RR_DELAY
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/R_END
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/R_TOP
add wave -noupdate -format Analog-Step -height 74 -max 15927399.999999998 -min -15665700.0 /stc_tb/STC_u/Brik2_u/FreqDFT_u/Ri
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/RiDelay
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/RiPi
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/RiPr
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/RoundUpDeltaAmbig
add wave -noupdate -format Analog-Step -height 74 -max 15832600.0 -min -15679400.0 /stc_tb/STC_u/Brik2_u/FreqDFT_u/Rr
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/RrDelay
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/RrPi
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/RrPr
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/RrPr_Ila
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/StartDec64
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/StartIn
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/TemplateActive
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/ValidIn
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/Variables
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/WrEnPilotA
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/WrEnPilotB
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/WrEnPilotC
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/ce
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/clk
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/i
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/j
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/p0H0ii
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/p0H0ir
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/p0H0ri
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/p0H0rr
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/p0OffH0ii
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/p0OffH0ir
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/p0OffH0ri
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/p0OffH0rr
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/p0OffsetIslv
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/p0OffsetRslv
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/p0Offset_i
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/p0Offset_r
add wave -noupdate -format Analog-Step -height 74 -max 131071.00000000001 -min -131072.0 /stc_tb/STC_u/Brik2_u/FreqDFT_u/p0_i
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/p0_i_slv
add wave -noupdate -format Analog-Step -height 74 -max 131071.00000000001 -min -131072.0 /stc_tb/STC_u/Brik2_u/FreqDFT_u/p0_r
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/p0_r_Ila
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/p0_r_slv
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/p1H1ii
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/p1H1ir
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/p1H1ri
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/p1H1rr
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/p1OffH1ii
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/p1OffH1ir
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/p1OffH1ri
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/p1OffH1rr
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/p1OffsetIslv
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/p1OffsetRslv
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/p1Offset_i
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/p1Offset_r
add wave -noupdate -format Analog-Step -height 74 -max 131071.00000000001 -min -131072.0 /stc_tb/STC_u/Brik2_u/FreqDFT_u/p1_i
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/p1_i_slv
add wave -noupdate -format Analog-Step -height 74 -max 131071.00000000001 -min -131072.0 /stc_tb/STC_u/Brik2_u/FreqDFT_u/p1_r
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/p1_r_slv
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/p_i
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/p_r
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/p_r_Ila
add wave -noupdate /stc_tb/STC_u/Brik2_u/FreqDFT_u/reset
add wave -noupdate /stc_tb/Test_u/Blink
add wave -noupdate /stc_tb/Test_u/DFT_Count
add wave -noupdate /stc_tb/Test_u/DFT_Index
add wave -noupdate /stc_tb/Test_u/DFT_InputsI
add wave -noupdate /stc_tb/Test_u/DFT_InputsR
add wave -noupdate /stc_tb/Test_u/DFT_Mode
add wave -noupdate /stc_tb/Test_u/DFT_Start
add wave -noupdate /stc_tb/Test_u/DFT_ValueOut
add wave -noupdate /stc_tb/Test_u/DoneDec64
add wave -noupdate /stc_tb/Test_u/Dones
add wave -noupdate /stc_tb/Test_u/Float16HP
add wave -noupdate /stc_tb/Test_u/FreqResolution
add wave -noupdate /stc_tb/Test_u/IndexN125K
add wave -noupdate /stc_tb/Test_u/IndexP125K
add wave -noupdate /stc_tb/Test_u/LedFlash
add wave -noupdate /stc_tb/Test_u/OneOverFreqAmb
add wave -noupdate /stc_tb/Test_u/OneOverFreqRes
add wave -noupdate /stc_tb/Test_u/PacketCount
add wave -noupdate /stc_tb/Test_u/PilotSyncOffset
add wave -noupdate /stc_tb/Test_u/PilotTempDown3R
add wave -noupdate /stc_tb/Test_u/PromAddr
add wave -noupdate /stc_tb/Test_u/ResetBrik2
add wave -noupdate /stc_tb/Test_u/SampleCount
add wave -noupdate /stc_tb/Test_u/StartRead
add wave -noupdate /stc_tb/Test_u/TSample
add wave -noupdate /stc_tb/Test_u/VIO_Bits
add wave -noupdate /stc_tb/Test_u/ValidIn
add wave -noupdate /stc_tb/Test_u/ValidRead
add wave -noupdate /stc_tb/Test_u/VarsImag
add wave -noupdate /stc_tb/Test_u/VarsReal
add wave -noupdate /stc_tb/Test_u/adc_dco_n
add wave -noupdate /stc_tb/Test_u/adc_dco_p
add wave -noupdate /stc_tb/Test_u/ce
add wave -noupdate /stc_tb/Test_u/clk
add wave -noupdate /stc_tb/Test_u/reset
add wave -noupdate /stc_tb/Test_u/DFT_u/ce
add wave -noupdate /stc_tb/Test_u/DFT_u/clk
add wave -noupdate /stc_tb/Test_u/DFT_u/DDS_Reset_n
add wave -noupdate /stc_tb/Test_u/DFT_u/DelayStart
add wave -noupdate /stc_tb/Test_u/DFT_u/DelayX_i
add wave -noupdate /stc_tb/Test_u/DFT_u/DelayX_r
add wave -noupdate /stc_tb/Test_u/DFT_u/DelayXi
add wave -noupdate /stc_tb/Test_u/DFT_u/DelayXr
add wave -noupdate /stc_tb/Test_u/DFT_u/Done
add wave -noupdate /stc_tb/Test_u/DFT_u/IndexCount
add wave -noupdate /stc_tb/Test_u/DFT_u/IndexIn
add wave -noupdate /stc_tb/Test_u/DFT_u/IndexInDly
add wave -noupdate /stc_tb/Test_u/DFT_u/InternalStart
add wave -noupdate /stc_tb/Test_u/DFT_u/LOG2_N
add wave -noupdate /stc_tb/Test_u/DFT_u/MagIm
add wave -noupdate /stc_tb/Test_u/DFT_u/Magnitude
add wave -noupdate /stc_tb/Test_u/DFT_u/MagRe
add wave -noupdate /stc_tb/Test_u/DFT_u/N
add wave -noupdate /stc_tb/Test_u/DFT_u/NDX
add wave -noupdate /stc_tb/Test_u/DFT_u/PHASE_JUMP0
add wave -noupdate /stc_tb/Test_u/DFT_u/PHASE_JUMP123
add wave -noupdate /stc_tb/Test_u/DFT_u/PHASE_OFFSETA
add wave -noupdate /stc_tb/Test_u/DFT_u/PHASE_OFFSETB
add wave -noupdate /stc_tb/Test_u/DFT_u/PhaseAcc
add wave -noupdate /stc_tb/Test_u/DFT_u/PhaseActive
add wave -noupdate /stc_tb/Test_u/DFT_u/PhaseCount
add wave -noupdate /stc_tb/Test_u/DFT_u/PhaseInc
add wave -noupdate /stc_tb/Test_u/DFT_u/PhaseJump
add wave -noupdate /stc_tb/Test_u/DFT_u/reset
add wave -noupdate /stc_tb/Test_u/DFT_u/SIN_COS_LATENCY
add wave -noupdate /stc_tb/Test_u/DFT_u/StartIn
add wave -noupdate /stc_tb/Test_u/DFT_u/tdata
add wave -noupdate /stc_tb/Test_u/DFT_u/tvalid
add wave -noupdate /stc_tb/Test_u/DFT_u/W_i
add wave -noupdate /stc_tb/Test_u/DFT_u/W_r
add wave -noupdate /stc_tb/Test_u/DFT_u/WiXi
add wave -noupdate /stc_tb/Test_u/DFT_u/WiXr
add wave -noupdate /stc_tb/Test_u/DFT_u/WrXi
add wave -noupdate /stc_tb/Test_u/DFT_u/WrXr
add wave -noupdate /stc_tb/Test_u/DFT_u/X_i
add wave -noupdate /stc_tb/Test_u/DFT_u/X_r
add wave -noupdate /stc_tb/Test_u/DFT_u/XRay_i
add wave -noupdate /stc_tb/Test_u/DFT_u/XRay_r
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 3} {4145000 ps} 0} {{Cursor 4} {123451208 ps} 0}
quietly wave cursor active 2
configure wave -namecolwidth 295
configure wave -valuecolwidth 84
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
WaveRestoreZoom {0 ps} {134388450 ps}
bookmark add wave bookmark0 {{2508730 ps} {2540670 ps}} 0
bookmark add wave bookmark1 {{3023030 ps} {3054970 ps}} 0
bookmark add wave bookmark2 {{2187685 ps} {2199857 ps}} 33
bookmark add wave bookmark3 {{3212803 ps} {3228773 ps}} 48
