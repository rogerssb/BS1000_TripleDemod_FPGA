onerror {resume}
radix define sfix17 -fixed -fraction 17 -signed -base signed -precision 6
radix define u6 -fixed -fraction 6 -base signed -precision 6
radix define s18 -fixed -fraction 18 -signed -base signed -precision 6
radix define s18_17 -fixed -fraction 17 -signed -base signed -precision 6
radix define s17 -fixed -fraction 17 -signed -base signed -precision 6
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
radix define fixed#31#decimal -fixed -fraction 31 -base signed -precision 6
radix define fixed#32#decimal -fixed -fraction 32 -base signed -precision 6
radix define fixed#17#decimal#signed -fixed -fraction 17 -signed -base signed -precision 6
radix define fixed#7#decimal#signed -fixed -fraction 7 -signed -base signed -precision 6
radix define s31 -fixed -fraction 31 -signed -precision 6
radix define fixed#5#decimal#signed -fixed -fraction 5 -signed -base signed -precision 6
radix define fixed#17#decimal -fixed -fraction 17 -base signed -precision 6
radix define fixed#31#decimal#signed -fixed -fraction 31 -signed -base signed -precision 6
quietly WaveActivateNextPane {} 0
add wave -noupdate -format Analog-Step -height 74 -max 123488.0 -min -123522.0 /stc_hw_tb/Brik1/H0i
add wave -noupdate -format Analog-Step -height 74 -max 124020.99999999997 -min -124319.0 /stc_hw_tb/Brik1/H0r
add wave -noupdate -format Analog-Step -height 74 -max 123780.00000000001 -min -123159.0 /stc_hw_tb/Brik1/H1i
add wave -noupdate -format Analog-Step -height 74 -max 123481.00000000001 -min -123092.0 /stc_hw_tb/Brik1/H1r
add wave -noupdate /stc_hw_tb/Brik1/UUTu/PD_u/BadPilot
add wave -noupdate /stc_hw_tb/Brik1/UUTu/PD_u/CalcThreshold
add wave -noupdate /stc_hw_tb/Brik1/UUTu/PD_u/ConfigDone
add wave -noupdate /stc_hw_tb/Brik1/UUTu/PD_u/ConfigTReady
add wave -noupdate /stc_hw_tb/Brik1/UUTu/PD_u/ConfigTValid
add wave -noupdate /stc_hw_tb/Brik1/UUTu/PD_u/CurrentPeak
add wave -noupdate /stc_hw_tb/Brik1/UUTu/PD_u/FftHalted
add wave -noupdate /stc_hw_tb/Brik1/UUTu/PD_u/FftMissing
add wave -noupdate /stc_hw_tb/Brik1/UUTu/PD_u/FftOutSlv
add wave -noupdate /stc_hw_tb/Brik1/UUTu/PD_u/FftReady
add wave -noupdate /stc_hw_tb/Brik1/UUTu/PD_u/FftStarted
add wave -noupdate /stc_hw_tb/Brik1/UUTu/PD_u/FftTLastIn
add wave -noupdate /stc_hw_tb/Brik1/UUTu/PD_u/FftTLastOut
add wave -noupdate /stc_hw_tb/Brik1/UUTu/PD_u/FftUnexpected
add wave -noupdate /stc_hw_tb/Brik1/UUTu/PD_u/GoodPilot
add wave -noupdate /stc_hw_tb/Brik1/UUTu/PD_u/Count
add wave -noupdate /stc_hw_tb/Brik1/UUTu/PD_u/ValidFft
add wave -noupdate /stc_hw_tb/Brik1/UUTu/PD_u/ValidFftDly
add wave -noupdate /stc_hw_tb/Brik1/UUTu/PD_u/ValidIFftOut
add wave -noupdate /stc_hw_tb/Brik1/UUTu/PD_u/FftR
add wave -noupdate /stc_hw_tb/Brik1/UUTu/PD_u/FftI
add wave -noupdate /stc_hw_tb/Brik1/UUTu/PD_u/H0CntrR
add wave -noupdate /stc_hw_tb/Brik1/UUTu/PD_u/H0CntrI
add wave -noupdate /stc_hw_tb/Brik1/UUTu/PD_u/XC0CntrR
add wave -noupdate /stc_hw_tb/Brik1/UUTu/PD_u/XC0CntrI
add wave -noupdate /stc_hw_tb/Brik1/UUTu/PD_u/H1CntrI
add wave -noupdate /stc_hw_tb/Brik1/UUTu/PD_u/H1CntrR
add wave -noupdate /stc_hw_tb/Brik1/UUTu/PD_u/XC1CntrR
add wave -noupdate /stc_hw_tb/Brik1/UUTu/PD_u/XC1CntrI
add wave -noupdate /stc_hw_tb/Brik1/UUTu/PD_u/Hi0
add wave -noupdate /stc_hw_tb/Brik1/UUTu/PD_u/Hi1
add wave -noupdate /stc_hw_tb/Brik1/UUTu/PD_u/iFftReady
add wave -noupdate /stc_hw_tb/Brik1/UUTu/PD_u/IgnoreInitial
add wave -noupdate /stc_hw_tb/Brik1/UUTu/PD_u/ImIn
add wave -noupdate /stc_hw_tb/Brik1/UUTu/PD_u/ImInDly
add wave -noupdate /stc_hw_tb/Brik1/UUTu/PD_u/ImOut
add wave -noupdate /stc_hw_tb/Brik1/UUTu/PD_u/Index0
add wave -noupdate /stc_hw_tb/Brik1/UUTu/PD_u/Index1
add wave -noupdate /stc_hw_tb/Brik1/UUTu/PD_u/Lo0
add wave -noupdate /stc_hw_tb/Brik1/UUTu/PD_u/Lo1
add wave -noupdate -format Analog-Step -height 74 -max 122513.99999999999 -min -123065.0 /stc_hw_tb/Brik1/UUTu/PD_u/PackI
add wave -noupdate -format Analog-Step -height 74 -max 122501.99999999997 -min -122930.0 /stc_hw_tb/Brik1/UUTu/PD_u/PackR
add wave -noupdate -format Analog-Step -height 74 -max 37649.000000000007 -min -40332.0 -radix sfixed /stc_hw_tb/Brik1/UUTu/PD_u/iFftCntr0I
add wave -noupdate -format Analog-Step -height 74 -max 45211.0 -min -58317.0 -radix sfixed /stc_hw_tb/Brik1/UUTu/PD_u/iFftCntr0R
add wave -noupdate -format Analog-Step -height 74 -max 35012.0 -min -38741.0 -radix sfixed /stc_hw_tb/Brik1/UUTu/PD_u/iFftCntr1I
add wave -noupdate -format Analog-Step -height 74 -max 36215.000000000007 -min -56562.0 -radix sfixed /stc_hw_tb/Brik1/UUTu/PD_u/iFftCntr1R
add wave -noupdate -format Analog-Step -height 74 -max 6202.0 /stc_hw_tb/Brik1/UUTu/PD_u/AbsCntr0
add wave -noupdate -format Analog-Step -height 74 -max 5635.0 /stc_hw_tb/Brik1/UUTu/PD_u/AbsCntr1
add wave -noupdate -clampanalog 1 -format Analog-Step -height 74 -max 100000.0 -radix s18_17 /stc_hw_tb/Brik1/UUTu/Magnitude0
add wave -noupdate -clampanalog 1 -format Analog-Step -height 74 -max 100000.0 -radix s18_17 /stc_hw_tb/Brik1/UUTu/Magnitude1
add wave -noupdate -format Analog-Step -height 74 -max 131024.00000000001 -min -130940.0 -radix s18_17 /stc_hw_tb/Brik1/UUTu/PhaseOut0
add wave -noupdate -format Analog-Step -height 74 -max 131024.00000000001 -min -130940.0 -radix s18_17 /stc_hw_tb/Brik1/UUTu/PhaseOut1
add wave -noupdate -format Analog-Step -height 74 -max 123252.0 -min -123120.0 /stc_hw_tb/Brik1/UUTu/PS_u/ReadI
add wave -noupdate -format Analog-Step -height 74 -max 124313.00000000001 -min -124076.0 /stc_hw_tb/Brik1/UUTu/PS_u/ReadR
add wave -noupdate -format Analog-Step -height 74 -max 445.0 /stc_hw_tb/Brik1/UUTu/PS_u/SyncSumIla
add wave -noupdate /stc_hw_tb/Brik1/UUTu/PD_u/MagDelay
add wave -noupdate /stc_hw_tb/Brik1/UUTu/PD_u/Max
add wave -noupdate /stc_hw_tb/Brik1/UUTu/PD_u/MaxCntr
add wave -noupdate /stc_hw_tb/Brik1/UUTu/PD_u/MaxIndex
add wave -noupdate /stc_hw_tb/Brik1/UUTu/PD_u/Peak1
add wave -noupdate /stc_hw_tb/Brik1/UUTu/PD_u/Peak2
add wave -noupdate /stc_hw_tb/Brik1/UUTu/PD_u/PilotMag
add wave -noupdate /stc_hw_tb/Brik1/UUTu/PD_u/MultTLast
add wave -noupdate /stc_hw_tb/Brik1/UUTu/PD_u/OverflowFft
add wave -noupdate /stc_hw_tb/Brik1/UUTu/PD_u/OverflowIFft
add wave -noupdate /stc_hw_tb/Brik1/UUTu/PD_u/PeakPointer
add wave -noupdate /stc_hw_tb/Brik1/UUTu/PD_u/PilotFound
add wave -noupdate /stc_hw_tb/Brik1/UUTu/PD_u/PilotIndex
add wave -noupdate /stc_hw_tb/Brik1/UUTu/PD_u/PilotPulse
add wave -noupdate /stc_hw_tb/Brik1/UUTu/PD_u/PilotPulse1x
add wave -noupdate /stc_hw_tb/Brik1/UUTu/PD_u/ReIn
add wave -noupdate /stc_hw_tb/Brik1/UUTu/PD_u/ReInDly
add wave -noupdate /stc_hw_tb/Brik1/UUTu/PD_u/ReOut
add wave -noupdate /stc_hw_tb/Brik1/UUTu/PD_u/reset
add wave -noupdate /stc_hw_tb/Brik1/UUTu/PD_u/reset2x
add wave -noupdate /stc_hw_tb/Brik1/UUTu/PD_u/SampleCount
add wave -noupdate /stc_hw_tb/Brik1/UUTu/PD_u/SkipPacket
add wave -noupdate /stc_hw_tb/Brik1/UUTu/PD_u/StartOut
add wave -noupdate /stc_hw_tb/Brik1/UUTu/PD_u/tdata1
add wave -noupdate /stc_hw_tb/Brik1/UUTu/PD_u/tdata2
add wave -noupdate /stc_hw_tb/Brik1/UUTu/PD_u/Threshold
add wave -noupdate /stc_hw_tb/Brik1/UUTu/PD_u/ValidAbs
add wave -noupdate /stc_hw_tb/Brik1/UUTu/PD_u/ValidAbsDly
add wave -noupdate /stc_hw_tb/Brik1/UUTu/PD_u/ValidIn
add wave -noupdate /stc_hw_tb/Brik1/UUTu/PD_u/ValidInDly
add wave -noupdate /stc_hw_tb/Brik1/UUTu/PD_u/ValidMult
add wave -noupdate /stc_hw_tb/Brik1/UUTu/PD_u/ValidOut
add wave -noupdate /stc_hw_tb/Brik1/UUTu/PD_u/ValidPack
add wave -noupdate /stc_hw_tb/Brik1/UUTu/PS_u/Clock256
add wave -noupdate /stc_hw_tb/Brik1/UUTu/PS_u/ImagIn
add wave -noupdate /stc_hw_tb/Brik1/UUTu/PS_u/ImagOutSlv
add wave -noupdate /stc_hw_tb/Brik1/UUTu/PS_u/IndexIn
add wave -noupdate /stc_hw_tb/Brik1/UUTu/PS_u/IndexOut
add wave -noupdate /stc_hw_tb/Brik1/UUTu/PS_u/InvRdCount
add wave -noupdate /stc_hw_tb/Brik1/UUTu/PS_u/PacketCount_i
add wave -noupdate /stc_hw_tb/Brik1/UUTu/PS_u/PilotCaptureI_slv
add wave -noupdate /stc_hw_tb/Brik1/UUTu/PS_u/PilotCaptureR_slv
add wave -noupdate /stc_hw_tb/Brik1/UUTu/PS_u/PilotCount
add wave -noupdate /stc_hw_tb/Brik1/UUTu/PS_u/PilotLocked
add wave -noupdate /stc_hw_tb/Brik1/UUTu/PS_u/PilotPacket
add wave -noupdate /stc_hw_tb/Brik1/UUTu/PS_u/PilotPulseIn
add wave -noupdate /stc_hw_tb/Brik1/UUTu/PS_u/PilotValid
add wave -noupdate /stc_hw_tb/Brik1/UUTu/PS_u/RdAddr
add wave -noupdate /stc_hw_tb/Brik1/UUTu/PS_u/RdAddr_i
add wave -noupdate /stc_hw_tb/Brik1/UUTu/PS_u/ReadCount
add wave -noupdate /stc_hw_tb/Brik1/UUTu/PS_u/RealIn
add wave -noupdate -format Analog-Step -height 74 -max 123811.00000000003 -min -123817.0 /stc_hw_tb/Brik1/UUTu/PS_u/ImagOut
add wave -noupdate -format Analog-Step -height 74 -max 124086.00000000001 -min -124064.0 /stc_hw_tb/Brik1/UUTu/PS_u/RealOut
add wave -noupdate -format Analog-Step -height 74 -max 123252.0 -min -123120.0 /stc_hw_tb/Brik1/UUTu/PS_u/ReadI_Ila
add wave -noupdate -format Analog-Step -height 74 -max 124086.00000000001 -min -124064.0 /stc_hw_tb/Brik1/UUTu/PS_u/ReadR_Ila
add wave -noupdate /stc_hw_tb/Brik1/UUTu/PS_u/RealOutSlv
add wave -noupdate /stc_hw_tb/Brik1/UUTu/PS_u/reset
add wave -noupdate /stc_hw_tb/Brik1/UUTu/PS_u/SampleCount
add wave -noupdate /stc_hw_tb/Brik1/UUTu/PS_u/StartNext
add wave -noupdate /stc_hw_tb/Brik1/UUTu/PS_u/StartOut
add wave -noupdate /stc_hw_tb/Brik1/UUTu/PS_u/SyncError
add wave -noupdate -format Analog-Step -height 74 -max 2923480.0 /stc_hw_tb/Brik1/UUTu/PS_u/SyncSum
add wave -noupdate /stc_hw_tb/Brik1/UUTu/PS_u/ValidIn
add wave -noupdate /stc_hw_tb/Brik1/UUTu/PS_u/ValidOut
add wave -noupdate /stc_hw_tb/Brik1/UUTu/PS_u/WaitCount_i
add wave -noupdate /stc_hw_tb/Brik1/UUTu/PS_u/WrAddr
add wave -noupdate /stc_hw_tb/Brik1/UUTu/PS_u/WrAddr_i
add wave -noupdate /stc_hw_tb/Brik1/DataValid(0)
add wave -noupdate /stc_hw_tb/Brik1/BitRateAcc
add wave -noupdate -radix hexadecimal /stc_hw_tb/Brik1/Offset
add wave -noupdate -radix hexadecimal /stc_hw_tb/Brik1/PilotSyncOffset
add wave -noupdate /stc_hw_tb/Brik1/Frequency0
add wave -noupdate /stc_hw_tb/Brik1/Frequency1
add wave -noupdate /stc_hw_tb/Brik1/Power0
add wave -noupdate /stc_hw_tb/Brik1/Power1
add wave -noupdate /stc_hw_tb/Brik1/NoiseGainSlv
add wave -noupdate /stc_hw_tb/Brik1/Phase0
add wave -noupdate /stc_hw_tb/Brik1/Phase1
add wave -noupdate /stc_hw_tb/Brik1/NoiseGain
add wave -noupdate /stc_hw_tb/Brik1/DeltaT_slv
add wave -noupdate /stc_hw_tb/Brik1/MiscBits
add wave -noupdate /stc_hw_tb/Brik1/Errors
add wave -noupdate /stc_hw_tb/Brik1/UUTu/Reset
add wave -noupdate /stc_hw_tb/Brik1/UUTu/Reset2x
add wave -noupdate /stc_hw_tb/Brik1/UUTu/Brik2_u/TE_u/StartIn
add wave -noupdate /stc_hw_tb/Brik1/UUTu/Brik2_u/TE_u/Xr
add wave -noupdate /stc_hw_tb/Brik1/UUTu/Brik2_u/TE_u/Xi
add wave -noupdate /stc_hw_tb/Brik1/UUTu/Brik2_u/TE_u/RdAddr
add wave -noupdate /stc_hw_tb/Brik1/UUTu/Brik2_u/TE_u/Tau0Est
add wave -noupdate /stc_hw_tb/Brik1/UUTu/Brik2_u/TE_u/Tau1Est
add wave -noupdate /stc_hw_tb/Brik1/UUTu/Brik2_u/TE_u/Tau0Ndx
add wave -noupdate /stc_hw_tb/Brik1/UUTu/Brik2_u/TE_u/Tau1Ndx
add wave -noupdate /stc_hw_tb/Brik1/UUTu/Brik2_u/CE_u/StartIn
add wave -noupdate /stc_hw_tb/Brik1/UUTu/Brik2_u/CE_u/Xr
add wave -noupdate /stc_hw_tb/Brik1/UUTu/Brik2_u/CE_u/Xi
add wave -noupdate /stc_hw_tb/Brik1/UUTu/Brik2_u/CE_u/H0EstR
add wave -noupdate /stc_hw_tb/Brik1/UUTu/Brik2_u/CE_u/H0EstI
add wave -noupdate /stc_hw_tb/Brik1/UUTu/Brik2_u/CE_u/H1EstR
add wave -noupdate /stc_hw_tb/Brik1/UUTu/Brik2_u/CE_u/H1EstI
add wave -noupdate /stc_hw_tb/Brik1/UUTu/Brik2_u/CE_u/RdAddr
add wave -noupdate /stc_hw_tb/Brik1/UUTu/TrellisBits
add wave -noupdate /stc_hw_tb/Brik1/UUTu/TrellisCount
add wave -noupdate /stc_hw_tb/Brik1/UUTu/TrellisOutEn
add wave -noupdate /stc_hw_tb/Brik1/UUTu/Trellis_u/fa/dinImag
add wave -noupdate /stc_hw_tb/Brik1/UUTu/Trellis_u/fa/dinReal
add wave -noupdate /stc_hw_tb/Brik1/UUTu/Trellis_u/fa/doutImag
add wave -noupdate /stc_hw_tb/Brik1/UUTu/Trellis_u/fa/doutReal
add wave -noupdate /stc_hw_tb/Brik1/UUTu/Trellis_u/fa/empty
add wave -noupdate /stc_hw_tb/Brik1/UUTu/Trellis_u/fa/estimatesDone
add wave -noupdate /stc_hw_tb/Brik1/UUTu/Trellis_u/fa/fifoRdEn
add wave -noupdate /stc_hw_tb/Brik1/UUTu/Trellis_u/fa/fifoWrEn
add wave -noupdate /stc_hw_tb/Brik1/UUTu/Trellis_u/fa/frameActive
add wave -noupdate /stc_hw_tb/Brik1/UUTu/Trellis_u/fa/full
add wave -noupdate /stc_hw_tb/Brik1/UUTu/Trellis_u/fa/interpolate
add wave -noupdate /stc_hw_tb/Brik1/UUTu/Trellis_u/fa/myStartOfTrellis
add wave -noupdate /stc_hw_tb/Brik1/UUTu/Trellis_u/fa/rdAddr
add wave -noupdate /stc_hw_tb/Brik1/UUTu/Trellis_u/fa/sampleOut
add wave -noupdate /stc_hw_tb/Brik1/UUTu/Trellis_u/fa/sofDetected
add wave -noupdate /stc_hw_tb/Brik1/UUTu/Trellis_u/fa/startOfFrame
add wave -noupdate /stc_hw_tb/Brik1/UUTu/Trellis_u/fa/trellisInitCnt
add wave -noupdate /stc_hw_tb/Brik1/UUTu/Trellis_u/fa/wrAddr
add wave -noupdate /stc_hw_tb/Brik1/UUTu/Trellis_u/dfImagOutput
add wave -noupdate /stc_hw_tb/Brik1/UUTu/Trellis_u/dfRealOutput
add wave -noupdate /stc_hw_tb/Brik1/UUTu/Trellis_u/dfValid
add wave -noupdate /stc_hw_tb/Brik1/UUTu/Trellis_u/dinImag
add wave -noupdate /stc_hw_tb/Brik1/UUTu/Trellis_u/dinReal
add wave -noupdate /stc_hw_tb/Brik1/UUTu/Trellis_u/frameStart
add wave -noupdate /stc_hw_tb/Brik1/UUTu/Trellis_u/inputValid
add wave -noupdate /stc_hw_tb/Brik1/UUTu/Trellis_u/h0EstImag
add wave -noupdate /stc_hw_tb/Brik1/UUTu/Trellis_u/h0EstReal
add wave -noupdate /stc_hw_tb/Brik1/UUTu/Trellis_u/h1EstImag
add wave -noupdate /stc_hw_tb/Brik1/UUTu/Trellis_u/h1EstReal
add wave -noupdate /stc_hw_tb/Brik1/UUTu/Brik2_u/AllDone
add wave -noupdate /stc_hw_tb/Brik1/UUTu/Brik2_u/ChanEstDone
add wave -noupdate /stc_hw_tb/Brik1/UUTu/Brik2_u/EstimatesDone
add wave -noupdate /stc_hw_tb/Brik1/UUTu/Brik2_u/FirstPass
add wave -noupdate /stc_hw_tb/Brik1/UUTu/Brik2_u/FreqEstDone
add wave -noupdate /stc_hw_tb/Brik1/UUTu/Brik2_u/TimeEstDone
add wave -noupdate /stc_hw_tb/Brik1/UUTu/Brik2_u/StartIn
add wave -noupdate /stc_hw_tb/Brik1/UUTu/Brik2_u/StartTime
add wave -noupdate /stc_hw_tb/Brik1/UUTu/Brik2_u/StartTimeChan
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {11804610000 ps} 0} {{Cursor 2} {485454000 ps} 0} {{Cursor 3} {182405940 ps} 0}
quietly wave cursor active 3
configure wave -namecolwidth 312
configure wave -valuecolwidth 65
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
WaveRestoreZoom {0 ps} {127445325 ps}
bookmark add wave bookmark6 {{2508730 ps} {2540670 ps}} 0
bookmark add wave bookmark7 {{3023030 ps} {3054970 ps}} 0
bookmark add wave bookmark8 {{2187685 ps} {2199857 ps}} 33
bookmark add wave bookmark9 {{3212803 ps} {3228773 ps}} 48
