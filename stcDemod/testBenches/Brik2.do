onerror {resume}
radix define FLoat16 -fixed -fraction 27 -signed -base signed -precision 6
radix define s17 -fixed -fraction 17 -signed -base signed -precision 6
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
quietly WaveActivateNextPane {} 0
add wave -noupdate /brik2_tb/ce
add wave -noupdate /brik2_tb/clk
add wave -noupdate /brik2_tb/DELAY
add wave -noupdate /brik2_tb/DeltaTauEst
add wave -noupdate /brik2_tb/Dones
add wave -noupdate /brik2_tb/FinalMetric
add wave -noupdate /brik2_tb/finalMetricOutputEn
add wave -noupdate /brik2_tb/FrameCount
add wave -noupdate /brik2_tb/H0EstI
add wave -noupdate /brik2_tb/H0EstR
add wave -noupdate /brik2_tb/H1EstI
add wave -noupdate /brik2_tb/H1EstR
add wave -noupdate /brik2_tb/ImagRead
add wave -noupdate /brik2_tb/InterpO_I0
add wave -noupdate /brik2_tb/InterpO_I1
add wave -noupdate /brik2_tb/InterpO_R0
add wave -noupdate /brik2_tb/InterpO_R1
add wave -noupdate /brik2_tb/PacketCount
add wave -noupdate /brik2_tb/Pass
add wave -noupdate /brik2_tb/RealRead
add wave -noupdate /brik2_tb/reset
add wave -noupdate /brik2_tb/SampleCount
add wave -noupdate /brik2_tb/StartIn
add wave -noupdate /brik2_tb/StartRead
add wave -noupdate -format Analog-Step -height 74 -max 127999.99999999999 -min -128000.0 /brik2_tb/Brik2_u/DF_I
add wave -noupdate -format Analog-Step -height 74 -max 127999.99999999999 -min -128000.0 /brik2_tb/Brik2_u/DF_R
add wave -noupdate /brik2_tb/Brik2_u/H0Mag
add wave -noupdate /brik2_tb/Brik2_u/H1Mag
add wave -noupdate /brik2_tb/BER
add wave -noupdate /brik2_tb/BitCount
add wave -noupdate /brik2_tb/ErrorTotal
add wave -noupdate -radix unsigned -radixshowbase 0 /brik2_tb/ErrorCount
add wave -noupdate -radix hexadecimal /brik2_tb/TrellisBits
add wave -noupdate -radix hexadecimal /brik2_tb/TrellisBitsRaw
add wave -noupdate /brik2_tb/TrellisCount
add wave -noupdate /brik2_tb/TrellisEn
add wave -noupdate /brik2_tb/TrellisOutEn
add wave -noupdate /brik2_tb/TrellisOutEnRaw
add wave -noupdate /brik2_tb/TrellisSkip
add wave -noupdate /brik2_tb/TrellisStart
add wave -noupdate /brik2_tb/Brik2_u/InterpCount
add wave -noupdate /brik2_tb/Brik2_u/InterpEn
add wave -noupdate /brik2_tb/Brik2_u/InterpO_I0
add wave -noupdate /brik2_tb/Brik2_u/InterpO_I0_Ila
add wave -noupdate /brik2_tb/Brik2_u/InterpO_I1
add wave -noupdate /brik2_tb/Brik2_u/InterpO_I1_Ila
add wave -noupdate /brik2_tb/Brik2_u/InterpO_R0
add wave -noupdate /brik2_tb/Brik2_u/InterpO_R0_Ila
add wave -noupdate /brik2_tb/Brik2_u/InterpO_R1
add wave -noupdate /brik2_tb/Brik2_u/InterpO_R1_Ila
add wave -noupdate /brik2_tb/Brik2_u/Interpolate
add wave -noupdate /brik2_tb/Brik2_u/InterpRamI0
add wave -noupdate /brik2_tb/Brik2_u/InterpRamI1
add wave -noupdate /brik2_tb/Brik2_u/InterpRamR0
add wave -noupdate /brik2_tb/Brik2_u/InterpRamR1
add wave -noupdate /brik2_tb/Brik2_u/InterpWait
add wave -noupdate /brik2_tb/Brik2_u/m_ndx0
add wave -noupdate /brik2_tb/Brik2_u/m_ndx1
add wave -noupdate /brik2_tb/Brik2_u/MAX_M_NDX
add wave -noupdate /brik2_tb/Brik2_u/MaxRdInterp
add wave -noupdate /brik2_tb/Brik2_u/MIN_M_INDX
add wave -noupdate /brik2_tb/Brik2_u/MIN_M_NDX
add wave -noupdate /brik2_tb/Brik2_u/RdInterpAddr
add wave -noupdate /brik2_tb/Brik2_u/RdInterpAddr0Slv
add wave -noupdate /brik2_tb/Brik2_u/RdInterpAddr1Slv
add wave -noupdate /brik2_tb/Brik2_u/RdInterpRam0
add wave -noupdate /brik2_tb/Brik2_u/RdInterpRam1
add wave -noupdate /brik2_tb/Brik2_u/ReadInterp
add wave -noupdate /brik2_tb/Brik2_u/TrellisDelay
add wave -noupdate /brik2_tb/Brik2_u/TrellisEn
add wave -noupdate /brik2_tb/Brik2_u/TrellisPreStart
add wave -noupdate /brik2_tb/Brik2_u/TrellisStart
add wave -noupdate /brik2_tb/Brik2_u/TrellisStarter
add wave -noupdate /brik2_tb/Brik2_u/WrInterpAddr
add wave -noupdate /brik2_tb/Brik2_u/WrInterpAddrSlv
add wave -noupdate /brik2_tb/Brik2_u/WrInterpRam
add wave -noupdate /brik2_tb/Brik2_u/WriteInterp
add wave -noupdate /brik2_tb/ValidIn
add wave -noupdate /brik2_tb/ValidRead
add wave -noupdate /brik2_tb/Variables
add wave -noupdate /brik2_tb/VarsImag
add wave -noupdate /brik2_tb/VarsReal
add wave -noupdate /brik2_tb/ZEROS_OF
add wave -noupdate /brik2_tb/Brik2_u/AcqTrack
add wave -noupdate /brik2_tb/Brik2_u/AllDone
add wave -noupdate /brik2_tb/Brik2_u/ce
add wave -noupdate /brik2_tb/Brik2_u/ChanEstDone
add wave -noupdate /brik2_tb/Brik2_u/ChanRdAddr
add wave -noupdate /brik2_tb/Brik2_u/clk
add wave -noupdate /brik2_tb/Brik2_u/Cos_sf
add wave -noupdate /brik2_tb/Brik2_u/CosInI
add wave -noupdate /brik2_tb/Brik2_u/CosInR
add wave -noupdate /brik2_tb/Brik2_u/DeltaTauEst
add wave -noupdate /brik2_tb/Brik2_u/DF_DataOut
add wave -noupdate /brik2_tb/Brik2_u/DF_I_Ila
add wave -noupdate /brik2_tb/Brik2_u/DF_R_Ila
add wave -noupdate /brik2_tb/Brik2_u/FirstPass
add wave -noupdate /brik2_tb/Brik2_u/FLUSH
add wave -noupdate /brik2_tb/Brik2_u/Freq
add wave -noupdate /brik2_tb/Brik2_u/Freq_Ila
add wave -noupdate /brik2_tb/Brik2_u/FreqCount
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT
add wave -noupdate /brik2_tb/Brik2_u/FreqEstDone
add wave -noupdate /brik2_tb/Brik2_u/FreqFifoIn
add wave -noupdate /brik2_tb/Brik2_u/FreqI
add wave -noupdate /brik2_tb/Brik2_u/FreqIn
add wave -noupdate /brik2_tb/Brik2_u/FreqIslv
add wave -noupdate /brik2_tb/Brik2_u/FreqR
add wave -noupdate /brik2_tb/Brik2_u/FreqReset
add wave -noupdate /brik2_tb/Brik2_u/FreqRslv
add wave -noupdate /brik2_tb/Brik2_u/H0EstI
add wave -noupdate /brik2_tb/Brik2_u/H0EstI_CE
add wave -noupdate /brik2_tb/Brik2_u/H0EstI_Ila
add wave -noupdate /brik2_tb/Brik2_u/H0EstI_sf
add wave -noupdate /brik2_tb/Brik2_u/H0EstR
add wave -noupdate /brik2_tb/Brik2_u/H0EstR_CE
add wave -noupdate /brik2_tb/Brik2_u/H0EstR_Ila
add wave -noupdate /brik2_tb/Brik2_u/H0EstR_sf
add wave -noupdate /brik2_tb/Brik2_u/H0Mag
add wave -noupdate /brik2_tb/Brik2_u/H0Mag_Ila
add wave -noupdate /brik2_tb/Brik2_u/H1EstI
add wave -noupdate /brik2_tb/Brik2_u/H1EstI_CE
add wave -noupdate /brik2_tb/Brik2_u/H1EstI_Ila
add wave -noupdate /brik2_tb/Brik2_u/H1EstI_sf
add wave -noupdate /brik2_tb/Brik2_u/H1EstR
add wave -noupdate /brik2_tb/Brik2_u/H1EstR_CE
add wave -noupdate /brik2_tb/Brik2_u/H1EstR_Ila
add wave -noupdate /brik2_tb/Brik2_u/H1EstR_sf
add wave -noupdate /brik2_tb/Brik2_u/H1Mag
add wave -noupdate /brik2_tb/Brik2_u/H1Mag_Ila
add wave -noupdate -radix s18_17 /brik2_tb/Brik2_u/InI
add wave -noupdate /brik2_tb/Brik2_u/InI_sf
add wave -noupdate -radix s18_17 /brik2_tb/Brik2_u/InR
add wave -noupdate /brik2_tb/Brik2_u/InR_sf
add wave -noupdate /brik2_tb/Brik2_u/MixI
add wave -noupdate /brik2_tb/Brik2_u/MixR
add wave -noupdate /brik2_tb/Brik2_u/Mu0
add wave -noupdate /brik2_tb/Brik2_u/Mu0_Ila
add wave -noupdate /brik2_tb/Brik2_u/Mu1
add wave -noupdate /brik2_tb/Brik2_u/Mu1_Ila
add wave -noupdate /brik2_tb/Brik2_u/PAYLOAD_SIZE
add wave -noupdate /brik2_tb/Brik2_u/PhaseAcc
add wave -noupdate /brik2_tb/Brik2_u/PhaseInc
add wave -noupdate /brik2_tb/Brik2_u/PILOT_OFFSET
add wave -noupdate /brik2_tb/Brik2_u/PRE_LOAD
add wave -noupdate /brik2_tb/Brik2_u/reset
add wave -noupdate /brik2_tb/Brik2_u/Sin_sf
add wave -noupdate /brik2_tb/Brik2_u/SinCosData
add wave -noupdate /brik2_tb/Brik2_u/SinCosWait
add wave -noupdate /brik2_tb/Brik2_u/SinInI
add wave -noupdate /brik2_tb/Brik2_u/SinInR
add wave -noupdate /brik2_tb/Brik2_u/StartDF
add wave -noupdate /brik2_tb/Brik2_u/StartDF_Delay
add wave -noupdate /brik2_tb/Brik2_u/StartDF_Out
add wave -noupdate /brik2_tb/Brik2_u/StartFreq
add wave -noupdate /brik2_tb/Brik2_u/StartIn
add wave -noupdate /brik2_tb/Brik2_u/StartMix
add wave -noupdate /brik2_tb/Brik2_u/StartTime
add wave -noupdate /brik2_tb/Brik2_u/Tau0Est
add wave -noupdate /brik2_tb/Brik2_u/Tau0Est_Ila
add wave -noupdate /brik2_tb/Brik2_u/Tau0EstA
add wave -noupdate /brik2_tb/Brik2_u/Tau0EstNdxTE
add wave -noupdate /brik2_tb/Brik2_u/Tau0EstTE
add wave -noupdate /brik2_tb/Brik2_u/Tau0EstX4
add wave -noupdate /brik2_tb/Brik2_u/Tau0Int
add wave -noupdate /brik2_tb/Brik2_u/Tau1Est
add wave -noupdate /brik2_tb/Brik2_u/Tau1Est_Ila
add wave -noupdate /brik2_tb/Brik2_u/Tau1EstA
add wave -noupdate /brik2_tb/Brik2_u/Tau1EstNdxTE
add wave -noupdate /brik2_tb/Brik2_u/Tau1EstTE
add wave -noupdate /brik2_tb/Brik2_u/Tau1EstX4
add wave -noupdate /brik2_tb/Brik2_u/Tau1Int
add wave -noupdate /brik2_tb/Brik2_u/TimeActive
add wave -noupdate /brik2_tb/Brik2_u/TimeCount
add wave -noupdate /brik2_tb/Brik2_u/TimeEstDone
add wave -noupdate /brik2_tb/Brik2_u/TimeI
add wave -noupdate /brik2_tb/Brik2_u/TimeIslv
add wave -noupdate /brik2_tb/Brik2_u/TimeR
add wave -noupdate /brik2_tb/Brik2_u/TimeRdAddr
add wave -noupdate /brik2_tb/Brik2_u/TimeRead
add wave -noupdate /brik2_tb/Brik2_u/TimeRslv
add wave -noupdate /brik2_tb/Brik2_u/TRELLIS_WAIT
add wave -noupdate /brik2_tb/Brik2_u/TSAMPLE4
add wave -noupdate /brik2_tb/Brik2_u/ValidCount
add wave -noupdate /brik2_tb/Brik2_u/ValidDF
add wave -noupdate /brik2_tb/Brik2_u/ValidDF_ILA
add wave -noupdate /brik2_tb/Brik2_u/ValidDFreg
add wave -noupdate /brik2_tb/Brik2_u/ValidDly
add wave -noupdate /brik2_tb/Brik2_u/ValidFreq
add wave -noupdate /brik2_tb/Brik2_u/ValidIn
add wave -noupdate /brik2_tb/Brik2_u/ValidMixer
add wave -noupdate /brik2_tb/Brik2_u/ValidSinCos
add wave -noupdate /brik2_tb/Brik2_u/Variables
add wave -noupdate /brik2_tb/Brik2_u/WaitTime
add wave -noupdate /brik2_tb/Brik2_u/WrAddr
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/AcqTrack
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/ACQUIRE_STEP
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/BufCntr
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/BufCntrMinusOffset
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/ce
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/clk
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/CYCLE_MAX
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/CycleCount
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/CycleCount_Ila
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/CycleDFT_A
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/CycleDFT_B
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/DELTA_F_IND
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/DFT_Count
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/DFT_Done
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/DFT_DoneA
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/DFT_DoneB
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/DFT_I_Ila
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/DFT_Index
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/DFT_IndexA
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/DFT_IndexA_Ila
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/DFT_IndexB
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/DFT_IndexB_Ila
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/DFT_IndexInA
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/DFT_IndexInA_Ila
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/DFT_IndexInB
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/DFT_IndexInB_Ila
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/DFT_InputsI
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/DFT_InputsR
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/DFT_R_Ila
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/DFT_Scan
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/DFT_Start
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/DFT_Value
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/DFT_ValueA
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/DFT_ValueA_Ila
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/DFT_ValueB
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/DFT_ValueB_Ila
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/DFT_ValueOut
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/DftOffset
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/DiffBtoO
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/Done
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/DoneDec64
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/FirstTime
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/Freq
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/FreqCoarse
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/FreqCoarse_Ila
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/FreqLpf
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/FreqLpf_Ila
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/AcqCount
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/H0EstI
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/H0EstR
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/H1EstI
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/H1EstR
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/i
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/I_END
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/I_TOP
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/IND_START
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/IndexOffset
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/j
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/LpfDiff
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/LpfDiffAbs
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/LpfIndex
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/LpfPartial
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/MaxIndex
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/MaxIndex_Ila
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/MaxValue
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/MaxValue_Ila
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/MINUS125K
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/MuxCntr
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/NDX
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/Offset
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/p0_i
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/p0_i_slv
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/p0_r
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/p0_r_slv
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/p0H0ii
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/p0H0ir
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/p0H0ri
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/p0H0rr
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/p0OffH0ii
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/p0OffH0ir
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/p0OffH0ri
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/p0OffH0rr
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/p0Offset_i
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/p0Offset_r
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/p0OffsetIslv
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/p0OffsetRslv
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/p1_i
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/p1_i_slv
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/p1_r
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/p1_r_slv
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/p1H1ii
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/p1H1ir
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/p1H1ri
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/p1H1rr
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/p1OffH1ii
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/p1OffH1ir
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/p1OffH1ri
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/p1OffH1rr
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/p1Offset_i
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/p1Offset_r
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/p1OffsetIslv
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/p1OffsetRslv
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/p_i
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/p_r
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/Pilot0Pii
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/Pilot0Pir
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/Pilot0Pri
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/Pilot0Prr
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/Pilot1Pii
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/Pilot1Pir
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/Pilot1Pri
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/Pilot1Prr
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/Pilot2Pii
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/Pilot2Pir
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/Pilot2Pri
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/Pilot2Prr
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/PILOT_COUNT_DONE
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/PilotBufArd
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/PilotBufBrd
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/PilotBufCrd
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/PilotBufWrData
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/PilotCount
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/PilotPtr0
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/PilotPtr0I
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/PilotPtr0R
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/PilotPtr1
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/PilotPtr1I
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/PilotPtr1R
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/PilotPtr2
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/PilotPtr2I
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/PilotPtr2R
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/PilotPtr2R_Ila
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/PilotTemp2R_Ila
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/PilotTemplate0I
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/PilotTemplate0R
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/PilotTemplate1I
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/PilotTemplate1R
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/PilotTemplate2I
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/PilotTemplate2R
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/PilotTemplate3I
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/PilotTemplate3R
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/PilotTemplateDown0I
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/PilotTemplateDown0R
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/PilotTemplateDown1I
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/PilotTemplateDown1R
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/PilotTemplateDown2I
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/PilotTemplateDown2R
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/PilotTemplateDown3I
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/PilotTemplateDown3R
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/PilotTempOut_Ila
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/PIPECOUNT5
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/PipeLine
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/PR_Count
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/Push
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/R_END
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/R_TOP
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/reset
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/Ri
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/RiDelay
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/RiPi
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/RiPr
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/RomPntr
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/Rr
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/RR_DELAY
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/RrDelay
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/RrPi
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/RrPr
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/Scan
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/Scan_Ila
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/ScanCount
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/SearchMode
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/StartDec64
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/StartDFT_A
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/StartDFT_B
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/StartIn
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/STEPS
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/Tau0Est
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/Tau1Est
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/TemplateActive
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/TRACK_STEP
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/ValidIn
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/Variables
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/WrEnPilotA
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/WrEnPilotB
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/WrEnPilotC
add wave -noupdate /brik2_tb/Brik2_u/TE_u/ADDR_MAX
add wave -noupdate /brik2_tb/Brik2_u/TE_u/ALMOST_ONE
add wave -noupdate /brik2_tb/Brik2_u/TE_u/ce
add wave -noupdate /brik2_tb/Brik2_u/TE_u/CenterX
add wave -noupdate /brik2_tb/Brik2_u/TE_u/CenterY
add wave -noupdate /brik2_tb/Brik2_u/TE_u/clk
add wave -noupdate /brik2_tb/Brik2_u/TE_u/ComputeDone
add wave -noupdate /brik2_tb/Brik2_u/TE_u/Done
add wave -noupdate /brik2_tb/Brik2_u/TE_u/Iterations
add wave -noupdate /brik2_tb/Brik2_u/TE_u/MinCM
add wave -noupdate /brik2_tb/Brik2_u/TE_u/MinIndex
add wave -noupdate /brik2_tb/Brik2_u/TE_u/MinX
add wave -noupdate /brik2_tb/Brik2_u/TE_u/MinY
add wave -noupdate /brik2_tb/Brik2_u/TE_u/Mode
add wave -noupdate /brik2_tb/Brik2_u/TE_u/Offset
add wave -noupdate /brik2_tb/Brik2_u/TE_u/OffsetXreg
add wave -noupdate /brik2_tb/Brik2_u/TE_u/OffsetYreg
add wave -noupdate /brik2_tb/Brik2_u/TE_u/PipeLine
add wave -noupdate /brik2_tb/Brik2_u/TE_u/RdAddr
add wave -noupdate /brik2_tb/Brik2_u/TE_u/RdCntr
add wave -noupdate /brik2_tb/Brik2_u/TE_u/RdCntr_u
add wave -noupdate /brik2_tb/Brik2_u/TE_u/reset
add wave -noupdate /brik2_tb/Brik2_u/TE_u/ResultsCM
add wave -noupdate /brik2_tb/Brik2_u/TE_u/ResultsCMreg
add wave -noupdate /brik2_tb/Brik2_u/TE_u/SsInvI0A
add wave -noupdate /brik2_tb/Brik2_u/TE_u/SsInvI0B
add wave -noupdate /brik2_tb/Brik2_u/TE_u/SsInvI0C
add wave -noupdate /brik2_tb/Brik2_u/TE_u/SsInvI0D
add wave -noupdate /brik2_tb/Brik2_u/TE_u/SsInvI1A
add wave -noupdate /brik2_tb/Brik2_u/TE_u/SsInvI1B
add wave -noupdate /brik2_tb/Brik2_u/TE_u/SsInvI1C
add wave -noupdate /brik2_tb/Brik2_u/TE_u/SsInvI1D
add wave -noupdate /brik2_tb/Brik2_u/TE_u/SsInvI2A
add wave -noupdate /brik2_tb/Brik2_u/TE_u/SsInvI2B
add wave -noupdate /brik2_tb/Brik2_u/TE_u/SsInvI2C
add wave -noupdate /brik2_tb/Brik2_u/TE_u/SsInvI2D
add wave -noupdate /brik2_tb/Brik2_u/TE_u/SsInvI3A
add wave -noupdate /brik2_tb/Brik2_u/TE_u/SsInvI3B
add wave -noupdate /brik2_tb/Brik2_u/TE_u/SsInvI3C
add wave -noupdate /brik2_tb/Brik2_u/TE_u/SsInvI3D
add wave -noupdate /brik2_tb/Brik2_u/TE_u/SsInvR0A
add wave -noupdate /brik2_tb/Brik2_u/TE_u/SsInvR0B
add wave -noupdate /brik2_tb/Brik2_u/TE_u/SsInvR0C
add wave -noupdate /brik2_tb/Brik2_u/TE_u/SsInvR0D
add wave -noupdate /brik2_tb/Brik2_u/TE_u/SsInvR1A
add wave -noupdate /brik2_tb/Brik2_u/TE_u/SsInvR1B
add wave -noupdate /brik2_tb/Brik2_u/TE_u/SsInvR1C
add wave -noupdate /brik2_tb/Brik2_u/TE_u/SsInvR1D
add wave -noupdate /brik2_tb/Brik2_u/TE_u/SsInvR2A
add wave -noupdate /brik2_tb/Brik2_u/TE_u/SsInvR2B
add wave -noupdate /brik2_tb/Brik2_u/TE_u/SsInvR2C
add wave -noupdate /brik2_tb/Brik2_u/TE_u/SsInvR2D
add wave -noupdate /brik2_tb/Brik2_u/TE_u/SsInvR3A
add wave -noupdate /brik2_tb/Brik2_u/TE_u/SsInvR3B
add wave -noupdate /brik2_tb/Brik2_u/TE_u/SsInvR3C
add wave -noupdate /brik2_tb/Brik2_u/TE_u/SsInvR3D
add wave -noupdate /brik2_tb/Brik2_u/TE_u/StartCM
add wave -noupdate /brik2_tb/Brik2_u/TE_u/StartIn
add wave -noupdate /brik2_tb/Brik2_u/TE_u/Tau0Est
add wave -noupdate /brik2_tb/Brik2_u/TE_u/Tau0Est_sf
add wave -noupdate /brik2_tb/Brik2_u/TE_u/Tau0Ndx
add wave -noupdate /brik2_tb/Brik2_u/TE_u/Tau0Sf
add wave -noupdate /brik2_tb/Brik2_u/TE_u/Tau1Est
add wave -noupdate /brik2_tb/Brik2_u/TE_u/Tau1Est_sf
add wave -noupdate /brik2_tb/Brik2_u/TE_u/Tau1Ndx
add wave -noupdate /brik2_tb/Brik2_u/TE_u/Tau1Sf
add wave -noupdate /brik2_tb/Brik2_u/TE_u/Xi
add wave -noupdate /brik2_tb/Brik2_u/TE_u/Xr
add wave -noupdate /brik2_tb/Brik2_u/TE_u/xx
add wave -noupdate /brik2_tb/Brik2_u/TE_u/yy
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/SearchA/ce
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/SearchA/clk
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/SearchA/DftIndexA
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/SearchA/DftIndexB
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/SearchA/DftIndexC
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/SearchA/Done
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/SearchA/DoneDft
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/SearchA/IndexIn
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/SearchA/IndexOffset
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/SearchA/IndexOut
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/SearchA/Largest
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/SearchA/LargestAB
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/SearchA/LAST_ONE
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/SearchA/MagDftA
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/SearchA/MagDftB
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/SearchA/MagDftC
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/SearchA/Magnitude
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/SearchA/MaxIndex
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/SearchA/MaxIndexAB
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/SearchA/Mode
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/SearchA/N
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/SearchA/NDX
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/SearchA/NextCycle
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/SearchA/Offset
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/SearchA/reset
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/SearchA/Start
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/SearchA/X_i
add wave -noupdate /brik2_tb/Brik2_u/FreqDFT_u/SearchA/X_r
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {249621000 ps} 0} {{Cursor 2} {70572000 ps} 0}
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
WaveRestoreZoom {249380085 ps} {249861915 ps}
bookmark add wave bookmark0 {{2508730 ps} {2540670 ps}} 0
bookmark add wave bookmark1 {{3023030 ps} {3054970 ps}} 0
bookmark add wave bookmark2 {{2187685 ps} {2199857 ps}} 33
bookmark add wave bookmark3 {{3212803 ps} {3228773 ps}} 48
