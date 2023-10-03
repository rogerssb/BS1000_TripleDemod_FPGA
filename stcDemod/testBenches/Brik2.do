onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /brik2_tb/BER
add wave -noupdate /brik2_tb/BitCount
add wave -noupdate /brik2_tb/DELAY
add wave -noupdate /brik2_tb/DeltaTauEst
add wave -noupdate /brik2_tb/Dones
add wave -noupdate /brik2_tb/ErrorCount
add wave -noupdate /brik2_tb/ErrorTotal
add wave -noupdate /brik2_tb/ExpectedBer
add wave -noupdate /brik2_tb/FinalMetric
add wave -noupdate /brik2_tb/FrameCount
add wave -noupdate /brik2_tb/H0EstI
add wave -noupdate /brik2_tb/H0EstR
add wave -noupdate /brik2_tb/H1EstI
add wave -noupdate /brik2_tb/H1EstR
add wave -noupdate /brik2_tb/ImagRead
add wave -noupdate /brik2_tb/Mag0GTMag1
add wave -noupdate /brik2_tb/NotFirstFrame
add wave -noupdate /brik2_tb/PacketCount
add wave -noupdate /brik2_tb/Pass
add wave -noupdate /brik2_tb/RealRead
add wave -noupdate /brik2_tb/SampleCount
add wave -noupdate /brik2_tb/StartHPP
add wave -noupdate /brik2_tb/StartIn
add wave -noupdate /brik2_tb/StartRead
add wave -noupdate /brik2_tb/TrellisBits
add wave -noupdate /brik2_tb/TrellisBitsRaw
add wave -noupdate /brik2_tb/TrellisCount
add wave -noupdate /brik2_tb/TrellisEn
add wave -noupdate /brik2_tb/TrellisOutEn
add wave -noupdate /brik2_tb/TrellisOutEnRaw
add wave -noupdate /brik2_tb/TrellisSkip
add wave -noupdate /brik2_tb/TrellisStart
add wave -noupdate /brik2_tb/ValidIn
add wave -noupdate /brik2_tb/ValidRead
add wave -noupdate /brik2_tb/VarsImag
add wave -noupdate /brik2_tb/VarsReal
add wave -noupdate /brik2_tb/ZEROS_OF
add wave -noupdate /brik2_tb/ce
add wave -noupdate /brik2_tb/clk
add wave -noupdate /brik2_tb/clk2x
add wave -noupdate /brik2_tb/finalMetricOutputEn
add wave -noupdate /brik2_tb/reset
add wave -noupdate /brik2_tb/Brik2_u/ChanEstDoneDly
add wave -noupdate /brik2_tb/Brik2_u/ChanRdAddr
add wave -noupdate /brik2_tb/Brik2_u/DeltaTauEst
add wave -noupdate /brik2_tb/Brik2_u/H0EstI_CE
add wave -noupdate /brik2_tb/Brik2_u/H0EstI_Ila
add wave -noupdate /brik2_tb/Brik2_u/H0EstI_Sqr
add wave -noupdate /brik2_tb/Brik2_u/H0EstR_CE
add wave -noupdate /brik2_tb/Brik2_u/H0EstR_Ila
add wave -noupdate /brik2_tb/Brik2_u/H0EstR_Sqr
add wave -noupdate /brik2_tb/Brik2_u/H0MagCE
add wave -noupdate /brik2_tb/Brik2_u/H0MagIn
add wave -noupdate /brik2_tb/Brik2_u/H0MagOver32
add wave -noupdate /brik2_tb/Brik2_u/H1EstI_CE
add wave -noupdate /brik2_tb/Brik2_u/H1EstI_Ila
add wave -noupdate /brik2_tb/Brik2_u/H1EstI_Sqr
add wave -noupdate /brik2_tb/Brik2_u/H1EstR_CE
add wave -noupdate /brik2_tb/Brik2_u/H1EstR_Ila
add wave -noupdate /brik2_tb/Brik2_u/H1EstR_Sqr
add wave -noupdate /brik2_tb/Brik2_u/H1MagCE
add wave -noupdate /brik2_tb/Brik2_u/H1MagIn
add wave -noupdate /brik2_tb/Brik2_u/H1MagOver32
add wave -noupdate /brik2_tb/Brik2_u/InI
add wave -noupdate /brik2_tb/Brik2_u/InR
add wave -noupdate /brik2_tb/Brik2_u/MAX_M_NDX
add wave -noupdate /brik2_tb/Brik2_u/MIN_M_NDX
add wave -noupdate /brik2_tb/Brik2_u/Mag0GtMag1
add wave -noupdate /brik2_tb/Brik2_u/Mu0
add wave -noupdate /brik2_tb/Brik2_u/Mu1
add wave -noupdate /brik2_tb/Brik2_u/PhaseDiff
add wave -noupdate /brik2_tb/Brik2_u/FirstPass
add wave -noupdate -divider {New Divider}
add wave -noupdate /brik2_tb/Phase
add wave -noupdate /brik2_tb/Cosine
add wave -noupdate /brik2_tb/Sine
add wave -noupdate -format Analog-Step -height 80 -max 1437.0 /brik2_tb/cordic0/m
add wave -noupdate -format Analog-Step -height 80 -max 1798.0000000000002 -min -1936.0 /brik2_tb/cordic0/p
add wave -noupdate -format Analog-Step -height 80 -max 51945.0 -min -43963.0 /brik2_tb/ImagRot
add wave -noupdate -format Analog-Step -height 80 -max 61892.000000000007 -min -43946.0 /brik2_tb/RealRot
add wave -noupdate -format Analog-Step -height 80 -max 131061.00000000001 -min -131072.0 -radix sfixed /brik2_tb/Brik2_u/InI_sf
add wave -noupdate -format Analog-Step -height 80 -max 131070.00000000003 -min -131065.0 -radix sfixed /brik2_tb/Brik2_u/InR_sf
add wave -noupdate /brik2_tb/Brik2_u/ValidIn
add wave -noupdate /brik2_tb/Brik2_u/StartIn
add wave -noupdate -radix unsigned -radixshowbase 0 /brik2_tb/Brik2_u/HPP/PilotCount
add wave -noupdate /brik2_tb/Brik2_u/HPP/PilotPacket
add wave -noupdate /brik2_tb/Brik2_u/H0EstI
add wave -noupdate /brik2_tb/Brik2_u/H1EstI
add wave -noupdate /brik2_tb/Brik2_u/H0EstR
add wave -noupdate /brik2_tb/Brik2_u/H1EstR
add wave -noupdate /brik2_tb/Brik2_u/TimeEstDone
add wave -noupdate /brik2_tb/Brik2_u/ChanEstDone
add wave -noupdate /brik2_tb/Brik2_u/EstimatesDone
add wave -noupdate /brik2_tb/Brik2_u/StartHPP
add wave -noupdate /brik2_tb/Brik2_u/StartTime
add wave -noupdate /brik2_tb/Brik2_u/HPP/H0MagNorm
add wave -noupdate /brik2_tb/Brik2_u/HPP/H1MagNorm
add wave -noupdate /brik2_tb/Brik2_u/HPP/NormDone
add wave -noupdate -format Analog-Step -height 80 -max 71865.0 -radix sfixed /brik2_tb/Brik2_u/HPP/SyncError
add wave -noupdate -radix sfixed /brik2_tb/Brik2_u/HPP/SyncSum
add wave -noupdate /brik2_tb/Brik2_u/PilotLocked
add wave -noupdate -format Analog-Step -height 80 -max 501591.99999999994 -min -509830.0 -radix sfixed /brik2_tb/Noise1Gained
add wave -noupdate /brik2_tb/SNR
add wave -noupdate -divider {New Divider}
add wave -noupdate /brik2_tb/Brik2_u/Tau0Est
add wave -noupdate /brik2_tb/Brik2_u/Tau0EstA
add wave -noupdate /brik2_tb/Brik2_u/Tau0EstNdxTE
add wave -noupdate /brik2_tb/Brik2_u/Tau0EstTE
add wave -noupdate /brik2_tb/Brik2_u/Tau0EstX4
add wave -noupdate /brik2_tb/Brik2_u/Tau0Int
add wave -noupdate /brik2_tb/Brik2_u/Tau1Est
add wave -noupdate /brik2_tb/Brik2_u/Tau1EstA
add wave -noupdate /brik2_tb/Brik2_u/Tau1EstNdxTE
add wave -noupdate /brik2_tb/Brik2_u/Tau1EstTE
add wave -noupdate /brik2_tb/Brik2_u/Tau1EstX4
add wave -noupdate /brik2_tb/Brik2_u/Tau1Int
add wave -noupdate /brik2_tb/Brik2_u/TauEst0Ila
add wave -noupdate /brik2_tb/Brik2_u/TauEst1Ila
add wave -noupdate /brik2_tb/Brik2_u/TimeActive
add wave -noupdate /brik2_tb/Brik2_u/TimeCount
add wave -noupdate /brik2_tb/Brik2_u/TimeI
add wave -noupdate /brik2_tb/Brik2_u/TimeIslv
add wave -noupdate /brik2_tb/Brik2_u/TimeR
add wave -noupdate /brik2_tb/Brik2_u/TimeRdAddr
add wave -noupdate /brik2_tb/Brik2_u/TimeRead
add wave -noupdate /brik2_tb/Brik2_u/TimeRslv
add wave -noupdate /brik2_tb/Brik2_u/TrellisDelay
add wave -noupdate /brik2_tb/Brik2_u/WrAddr
add wave -noupdate /brik2_tb/Brik2_u/ce
add wave -noupdate /brik2_tb/Brik2_u/clk186
add wave -noupdate /brik2_tb/Brik2_u/clk93
add wave -noupdate /brik2_tb/Brik2_u/m_ndx0
add wave -noupdate /brik2_tb/Brik2_u/m_ndx1
add wave -noupdate /brik2_tb/Brik2_u/reset
add wave -noupdate /brik2_tb/Brik2_u/reset2x
add wave -noupdate /brik2_tb/Brik2_u/HPP/CalcPhase
add wave -noupdate /brik2_tb/Brik2_u/HPP/CalcPhaseDly
add wave -noupdate /brik2_tb/Brik2_u/HPP/ce
add wave -noupdate /brik2_tb/Brik2_u/HPP/clk
add wave -noupdate /brik2_tb/Brik2_u/HPP/CmplxCount
add wave -noupdate /brik2_tb/Brik2_u/HPP/CmplxH0i
add wave -noupdate /brik2_tb/Brik2_u/HPP/CmplxH0r
add wave -noupdate /brik2_tb/Brik2_u/HPP/CmplxValid
add wave -noupdate /brik2_tb/Brik2_u/HPP/CordicI0
add wave -noupdate /brik2_tb/Brik2_u/HPP/CordicR0
add wave -noupdate /brik2_tb/Brik2_u/HPP/CordicStart
add wave -noupdate /brik2_tb/Brik2_u/HPP/H0AccI
add wave -noupdate /brik2_tb/Brik2_u/HPP/H0AccR
add wave -noupdate /brik2_tb/Brik2_u/HPP/H0I
add wave -noupdate /brik2_tb/Brik2_u/HPP/H0INormd
add wave -noupdate /brik2_tb/Brik2_u/HPP/H0Islv
add wave -noupdate /brik2_tb/Brik2_u/HPP/H0Mag
add wave -noupdate /brik2_tb/Brik2_u/HPP/H0R
add wave -noupdate /brik2_tb/Brik2_u/HPP/H0RNormd
add wave -noupdate /brik2_tb/Brik2_u/HPP/H0Rslv
add wave -noupdate /brik2_tb/Brik2_u/HPP/H0SumIA
add wave -noupdate /brik2_tb/Brik2_u/HPP/H0SumIB
add wave -noupdate /brik2_tb/Brik2_u/HPP/H0SumRA
add wave -noupdate /brik2_tb/Brik2_u/HPP/H0SumRB
add wave -noupdate /brik2_tb/Brik2_u/HPP/H1EstI
add wave -noupdate /brik2_tb/Brik2_u/HPP/H1EstR
add wave -noupdate /brik2_tb/Brik2_u/HPP/H1I
add wave -noupdate /brik2_tb/Brik2_u/HPP/H1IINormd
add wave -noupdate /brik2_tb/Brik2_u/HPP/H1INormd
add wave -noupdate /brik2_tb/Brik2_u/HPP/H1IRNormd
add wave -noupdate /brik2_tb/Brik2_u/HPP/H1Islv
add wave -noupdate /brik2_tb/Brik2_u/HPP/H1Mag
add wave -noupdate /brik2_tb/Brik2_u/HPP/H1R
add wave -noupdate /brik2_tb/Brik2_u/HPP/H1RINormd
add wave -noupdate /brik2_tb/Brik2_u/HPP/H1RNormd
add wave -noupdate /brik2_tb/Brik2_u/HPP/H1RRNormd
add wave -noupdate /brik2_tb/Brik2_u/HPP/H1Rslv
add wave -noupdate /brik2_tb/Brik2_u/HPP/InI
add wave -noupdate /brik2_tb/Brik2_u/HPP/InR
add wave -noupdate /brik2_tb/Brik2_u/HPP/InvRdCount
add wave -noupdate /brik2_tb/Brik2_u/HPP/m_ndx
add wave -noupdate /brik2_tb/Brik2_u/HPP/m_ndx0
add wave -noupdate /brik2_tb/Brik2_u/HPP/m_ndx1
add wave -noupdate /brik2_tb/Brik2_u/HPP/Mag
add wave -noupdate /brik2_tb/Brik2_u/HPP/Mag0GtMag1
add wave -noupdate /brik2_tb/Brik2_u/HPP/Normalize
add wave -noupdate /brik2_tb/Brik2_u/HPP/Phase
add wave -noupdate /brik2_tb/Brik2_u/HPP/PhaseA
add wave -noupdate /brik2_tb/Brik2_u/HPP/PhaseB
add wave -noupdate /brik2_tb/Brik2_u/HPP/PhaseDiff
add wave -noupdate /brik2_tb/Brik2_u/HPP/PilotCaptureI0_slv
add wave -noupdate /brik2_tb/Brik2_u/HPP/PilotCaptureI_slv
add wave -noupdate /brik2_tb/Brik2_u/HPP/PilotCaptureR0_slv
add wave -noupdate /brik2_tb/Brik2_u/HPP/PilotCaptureR_slv
add wave -noupdate /brik2_tb/Brik2_u/HPP/PilotLocked
add wave -noupdate /brik2_tb/Brik2_u/HPP/READ_START
add wave -noupdate /brik2_tb/Brik2_u/HPP/READ_STOP
add wave -noupdate /brik2_tb/Brik2_u/HPP/ReadCount
add wave -noupdate /brik2_tb/Brik2_u/HPP/ReadCount0
add wave -noupdate /brik2_tb/Brik2_u/HPP/ReadCount1
add wave -noupdate /brik2_tb/Brik2_u/HPP/ReadCountR
add wave -noupdate -subitemconfig {/brik2_tb/Brik2_u/HPP/ReadIDly(2) {-height 18 -max 61219.000000000007 -min -61131.0} /brik2_tb/Brik2_u/HPP/ReadIDly(1) {-format Analog-Step -height 80 -max 61219.000000000007 -min -61131.0} /brik2_tb/Brik2_u/HPP/ReadIDly(0) {-format Analog-Step -height 80 -max 61219.000000000007 -min -61131.0}} /brik2_tb/Brik2_u/HPP/ReadIDly
add wave -noupdate -subitemconfig {/brik2_tb/Brik2_u/HPP/ReadRDly(2) {-height 18 -max 61428.999999999993 -min -61528.0} /brik2_tb/Brik2_u/HPP/ReadRDly(1) {-format Analog-Step -height 80 -max 61428.999999999993 -min -61528.0}} /brik2_tb/Brik2_u/HPP/ReadRDly
add wave -noupdate /brik2_tb/Brik2_u/HPP/H0EstI
add wave -noupdate /brik2_tb/Brik2_u/HPP/H0EstR
add wave -noupdate /brik2_tb/Brik2_u/HPP/H0EstINorm
add wave -noupdate /brik2_tb/Brik2_u/HPP/H0EstRNorm
add wave -noupdate /brik2_tb/Brik2_u/HPP/H1EstINorm
add wave -noupdate /brik2_tb/Brik2_u/HPP/H1EstRNorm
add wave -noupdate -format Analog-Step -height 80 -max 131071.0 -min -131072.0 /brik2_tb/Brik2_u/HPP/H0I
add wave -noupdate -format Analog-Step -height 80 -max 131071.0 -min -131072.0 /brik2_tb/Brik2_u/HPP/H1I
add wave -noupdate -format Analog-Step -height 80 -max 131071.0 -min -131072.0 /brik2_tb/Brik2_u/HPP/H0R
add wave -noupdate -format Analog-Step -height 80 -max 131071.0 -min -131072.0 /brik2_tb/Brik2_u/HPP/H1R
add wave -noupdate -format Analog-Step -height 80 -max 131071.0 -min -131072.0 /brik2_tb/Brik2_u/HPP/H0IINormd
add wave -noupdate -format Analog-Step -height 80 -max 131071.0 -min -131072.0 /brik2_tb/Brik2_u/HPP/H0IRNormd
add wave -noupdate -format Analog-Step -height 80 -max 131071.0 -min -131072.0 /brik2_tb/Brik2_u/HPP/H0RINormd
add wave -noupdate -format Analog-Step -height 80 -max 131071.0 -min -131072.0 /brik2_tb/Brik2_u/HPP/H0RRNormd
add wave -noupdate -divider -height 80 {New Divider}
add wave -noupdate -format Analog-Step -height 80 -max 131071.0 -min -131072.0 /brik2_tb/Brik2_u/HPP/ReadIDly(1)
add wave -noupdate -format Analog-Step -height 80 -max 131071.0 -min -131072.0 /brik2_tb/Brik2_u/HPP/H0H1I
add wave -noupdate -format Analog-Step -height 80 -max 131071.0 -min -131072.0 /brik2_tb/Brik2_u/HPP/ReadRDly(1)
add wave -noupdate -format Analog-Step -height 80 -max 131071.0 -min -131072.0 /brik2_tb/Brik2_u/HPP/H0H1R
add wave -noupdate /brik2_tb/Brik2_u/HPP/reset
add wave -noupdate /brik2_tb/Brik2_u/HPP/StartHPP
add wave -noupdate /brik2_tb/Brik2_u/HPP/StartIn
add wave -noupdate /brik2_tb/Brik2_u/HPP/ValidCordic
add wave -noupdate /brik2_tb/Brik2_u/HPP/ValidCordicDly
add wave -noupdate /brik2_tb/Brik2_u/HPP/ValidIn
add wave -noupdate /brik2_tb/Brik2_u/HPP/WrAddr
add wave -noupdate /brik2_tb/Brik2_u/HPP/PilotCapture_ReadR_u/RdOutB
add wave -noupdate -radix decimal -radixshowbase 0 /brik2_tb/Brik2_u/HPP/PilotCapture_ReadR_u/RdAddrB
add wave -noupdate -radix unsigned -radixshowbase 0 /brik2_tb/Brik2_u/HPP/PilotCapture_ReadI_u/RdAddrB
add wave -noupdate -radix decimal -radixshowbase 0 /brik2_tb/Brik2_u/HPP/PilotCapture_ReadR_u/WrAddr
add wave -noupdate -format Analog-Step -height 80 -max 61428.999999999993 -min -61528.0 -radix sfixed -childformat {{/brik2_tb/Brik2_u/HPP/PilotCapture_ReadR_u/WrData(17) -radix sfixed} {/brik2_tb/Brik2_u/HPP/PilotCapture_ReadR_u/WrData(16) -radix sfixed} {/brik2_tb/Brik2_u/HPP/PilotCapture_ReadR_u/WrData(15) -radix sfixed} {/brik2_tb/Brik2_u/HPP/PilotCapture_ReadR_u/WrData(14) -radix sfixed} {/brik2_tb/Brik2_u/HPP/PilotCapture_ReadR_u/WrData(13) -radix sfixed} {/brik2_tb/Brik2_u/HPP/PilotCapture_ReadR_u/WrData(12) -radix sfixed} {/brik2_tb/Brik2_u/HPP/PilotCapture_ReadR_u/WrData(11) -radix sfixed} {/brik2_tb/Brik2_u/HPP/PilotCapture_ReadR_u/WrData(10) -radix sfixed} {/brik2_tb/Brik2_u/HPP/PilotCapture_ReadR_u/WrData(9) -radix sfixed} {/brik2_tb/Brik2_u/HPP/PilotCapture_ReadR_u/WrData(8) -radix sfixed} {/brik2_tb/Brik2_u/HPP/PilotCapture_ReadR_u/WrData(7) -radix sfixed} {/brik2_tb/Brik2_u/HPP/PilotCapture_ReadR_u/WrData(6) -radix sfixed} {/brik2_tb/Brik2_u/HPP/PilotCapture_ReadR_u/WrData(5) -radix sfixed} {/brik2_tb/Brik2_u/HPP/PilotCapture_ReadR_u/WrData(4) -radix sfixed} {/brik2_tb/Brik2_u/HPP/PilotCapture_ReadR_u/WrData(3) -radix sfixed} {/brik2_tb/Brik2_u/HPP/PilotCapture_ReadR_u/WrData(2) -radix sfixed} {/brik2_tb/Brik2_u/HPP/PilotCapture_ReadR_u/WrData(1) -radix sfixed} {/brik2_tb/Brik2_u/HPP/PilotCapture_ReadR_u/WrData(0) -radix sfixed}} -subitemconfig {/brik2_tb/Brik2_u/HPP/PilotCapture_ReadR_u/WrData(17) {-height 18 -radix sfixed} /brik2_tb/Brik2_u/HPP/PilotCapture_ReadR_u/WrData(16) {-height 18 -radix sfixed} /brik2_tb/Brik2_u/HPP/PilotCapture_ReadR_u/WrData(15) {-height 18 -radix sfixed} /brik2_tb/Brik2_u/HPP/PilotCapture_ReadR_u/WrData(14) {-height 18 -radix sfixed} /brik2_tb/Brik2_u/HPP/PilotCapture_ReadR_u/WrData(13) {-height 18 -radix sfixed} /brik2_tb/Brik2_u/HPP/PilotCapture_ReadR_u/WrData(12) {-height 18 -radix sfixed} /brik2_tb/Brik2_u/HPP/PilotCapture_ReadR_u/WrData(11) {-height 18 -radix sfixed} /brik2_tb/Brik2_u/HPP/PilotCapture_ReadR_u/WrData(10) {-height 18 -radix sfixed} /brik2_tb/Brik2_u/HPP/PilotCapture_ReadR_u/WrData(9) {-height 18 -radix sfixed} /brik2_tb/Brik2_u/HPP/PilotCapture_ReadR_u/WrData(8) {-height 18 -radix sfixed} /brik2_tb/Brik2_u/HPP/PilotCapture_ReadR_u/WrData(7) {-height 18 -radix sfixed} /brik2_tb/Brik2_u/HPP/PilotCapture_ReadR_u/WrData(6) {-height 18 -radix sfixed} /brik2_tb/Brik2_u/HPP/PilotCapture_ReadR_u/WrData(5) {-height 18 -radix sfixed} /brik2_tb/Brik2_u/HPP/PilotCapture_ReadR_u/WrData(4) {-height 18 -radix sfixed} /brik2_tb/Brik2_u/HPP/PilotCapture_ReadR_u/WrData(3) {-height 18 -radix sfixed} /brik2_tb/Brik2_u/HPP/PilotCapture_ReadR_u/WrData(2) {-height 18 -radix sfixed} /brik2_tb/Brik2_u/HPP/PilotCapture_ReadR_u/WrData(1) {-height 18 -radix sfixed} /brik2_tb/Brik2_u/HPP/PilotCapture_ReadR_u/WrData(0) {-height 18 -radix sfixed}} /brik2_tb/Brik2_u/HPP/PilotCapture_ReadR_u/WrData
add wave -noupdate /brik2_tb/Brik2_u/HPP/PilotCapture_ReadR_u/WrEn
add wave -noupdate /brik2_tb/Brik2_u/HPP/PilotCapture_ReadI_u/RdOutB
add wave -noupdate -format Analog-Step -height 80 -max 61399.0 -min -59836.0 /brik2_tb/Brik2_u/HPP/PilotCapture_ReadI_u/WrData
add wave -noupdate /brik2_tb/Brik2_u/HPP/CmplxMultConj/ImInA
add wave -noupdate /brik2_tb/Brik2_u/HPP/CmplxMultConj/ImInB
add wave -noupdate /brik2_tb/Brik2_u/HPP/CmplxMultConj/ImOut
add wave -noupdate /brik2_tb/Brik2_u/HPP/CmplxMultConj/ReInA
add wave -noupdate /brik2_tb/Brik2_u/HPP/CmplxMultConj/ReInB
add wave -noupdate /brik2_tb/Brik2_u/HPP/CmplxMultConj/ReOut
add wave -noupdate /brik2_tb/Brik2_u/HPP/CmplxMultConj/ValidOut
add wave -noupdate /brik2_tb/Brik2_u/HPP/CmplxMultConj/ValidIn
add wave -noupdate /brik2_tb/Brik2_u/HPP/CalcPhase
add wave -noupdate /brik2_tb/Brik2_u/HPP/CalcPhaseDly
add wave -noupdate /brik2_tb/Brik2_u/HPP/CaptureI
add wave -noupdate /brik2_tb/Brik2_u/HPP/CaptureR
add wave -noupdate /brik2_tb/Brik2_u/HPP/CmplxConjH0i
add wave -noupdate /brik2_tb/Brik2_u/HPP/CmplxConjH0r
add wave -noupdate /brik2_tb/Brik2_u/HPP/CmplxConjValid
add wave -noupdate /brik2_tb/Brik2_u/HPP/Conjugate
add wave -noupdate /brik2_tb/Brik2_u/HPP/NormDone
add wave -noupdate /brik2_tb/Brik2_u/HPP/PilotCount
add wave -noupdate /brik2_tb/Brik2_u/HPP/PilotLocked
add wave -noupdate /brik2_tb/Brik2_u/HPP/PilotPacket
add wave -noupdate /brik2_tb/Brik2_u/HPP/ReadCount
add wave -noupdate -format Analog-Step -height 80 -max 123733.00000000001 -min -124013.0 -radix sfixed -childformat {{/brik2_tb/Brik2_u/HPP/ReadI(0) -radix sfixed} {/brik2_tb/Brik2_u/HPP/ReadI(-1) -radix sfixed} {/brik2_tb/Brik2_u/HPP/ReadI(-2) -radix sfixed} {/brik2_tb/Brik2_u/HPP/ReadI(-3) -radix sfixed} {/brik2_tb/Brik2_u/HPP/ReadI(-4) -radix sfixed} {/brik2_tb/Brik2_u/HPP/ReadI(-5) -radix sfixed} {/brik2_tb/Brik2_u/HPP/ReadI(-6) -radix sfixed} {/brik2_tb/Brik2_u/HPP/ReadI(-7) -radix sfixed} {/brik2_tb/Brik2_u/HPP/ReadI(-8) -radix sfixed} {/brik2_tb/Brik2_u/HPP/ReadI(-9) -radix sfixed} {/brik2_tb/Brik2_u/HPP/ReadI(-10) -radix sfixed} {/brik2_tb/Brik2_u/HPP/ReadI(-11) -radix sfixed} {/brik2_tb/Brik2_u/HPP/ReadI(-12) -radix sfixed} {/brik2_tb/Brik2_u/HPP/ReadI(-13) -radix sfixed} {/brik2_tb/Brik2_u/HPP/ReadI(-14) -radix sfixed} {/brik2_tb/Brik2_u/HPP/ReadI(-15) -radix sfixed} {/brik2_tb/Brik2_u/HPP/ReadI(-16) -radix sfixed} {/brik2_tb/Brik2_u/HPP/ReadI(-17) -radix sfixed}} -subitemconfig {/brik2_tb/Brik2_u/HPP/ReadI(0) {-height 18 -radix sfixed} /brik2_tb/Brik2_u/HPP/ReadI(-1) {-height 18 -radix sfixed} /brik2_tb/Brik2_u/HPP/ReadI(-2) {-height 18 -radix sfixed} /brik2_tb/Brik2_u/HPP/ReadI(-3) {-height 18 -radix sfixed} /brik2_tb/Brik2_u/HPP/ReadI(-4) {-height 18 -radix sfixed} /brik2_tb/Brik2_u/HPP/ReadI(-5) {-height 18 -radix sfixed} /brik2_tb/Brik2_u/HPP/ReadI(-6) {-height 18 -radix sfixed} /brik2_tb/Brik2_u/HPP/ReadI(-7) {-height 18 -radix sfixed} /brik2_tb/Brik2_u/HPP/ReadI(-8) {-height 18 -radix sfixed} /brik2_tb/Brik2_u/HPP/ReadI(-9) {-height 18 -radix sfixed} /brik2_tb/Brik2_u/HPP/ReadI(-10) {-height 18 -radix sfixed} /brik2_tb/Brik2_u/HPP/ReadI(-11) {-height 18 -radix sfixed} /brik2_tb/Brik2_u/HPP/ReadI(-12) {-height 18 -radix sfixed} /brik2_tb/Brik2_u/HPP/ReadI(-13) {-height 18 -radix sfixed} /brik2_tb/Brik2_u/HPP/ReadI(-14) {-height 18 -radix sfixed} /brik2_tb/Brik2_u/HPP/ReadI(-15) {-height 18 -radix sfixed} /brik2_tb/Brik2_u/HPP/ReadI(-16) {-height 18 -radix sfixed} /brik2_tb/Brik2_u/HPP/ReadI(-17) {-height 18 -radix sfixed}} /brik2_tb/Brik2_u/HPP/ReadI
add wave -noupdate -format Analog-Step -height 80 -max 123570.0 -min -123768.0 -radix sfixed /brik2_tb/Brik2_u/HPP/ReadR
add wave -noupdate -format Analog-Step -height 80 -max 6569.0 /brik2_tb/Brik2_u/HPP/SyncError
add wave -noupdate -format Analog-Step -height 80 -max 961844.0 /brik2_tb/Brik2_u/HPP/SyncSum
add wave -noupdate /brik2_tb/Brik2_u/HPP/m_ndx
add wave -noupdate /brik2_tb/H0EstI
add wave -noupdate /brik2_tb/H0EstR
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {18274465 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 305
configure wave -valuecolwidth 153
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
WaveRestoreZoom {18232968 ps} {18767137 ps}
bookmark add wave bookmark33 {{2508730 ps} {2540670 ps}} 0
bookmark add wave bookmark34 {{2187685 ps} {2199857 ps}} 33
bookmark add wave bookmark35 {{3023030 ps} {3054970 ps}} 0
bookmark add wave bookmark36 {{3212803 ps} {3228773 ps}} 48
