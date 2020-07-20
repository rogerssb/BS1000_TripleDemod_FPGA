onerror {resume}
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
radix define fixed#31#decimal -fixed -fraction 31 -base signed -precision 6
radix define fixed#32#decimal -fixed -fraction 32 -base signed -precision 6
radix define fixed#17#decimal#signed -fixed -fraction 17 -signed -base signed -precision 6
radix define fixed#7#decimal#signed -fixed -fraction 7 -signed -base signed -precision 6
radix define s31 -fixed -fraction 31 -signed -precision 6
radix define fixed#5#decimal#signed -fixed -fraction 5 -signed -base signed -precision 6
radix define fixed#17#decimal -fixed -fraction 17 -base signed -precision 6
radix define fixed#31#decimal#signed -fixed -fraction 31 -signed -base signed -precision 6
quietly WaveActivateNextPane {} 0
add wave -noupdate /brik1_tb/C_READ
add wave -noupdate /brik1_tb/DataValid
add wave -noupdate /brik1_tb/DataValid_o
add wave -noupdate /brik1_tb/Dones
add wave -noupdate /brik1_tb/ImagOut
add wave -noupdate /brik1_tb/ImagRead
add wave -noupdate /brik1_tb/PilotPacket
add wave -noupdate /brik1_tb/RealOut
add wave -noupdate /brik1_tb/RealRead
add wave -noupdate /brik1_tb/StartOut
add wave -noupdate -expand /brik1_tb/Variables
add wave -noupdate /brik1_tb/ce
add wave -noupdate /brik1_tb/clk
add wave -noupdate /brik1_tb/clk2x
add wave -noupdate /brik1_tb/reset
add wave -noupdate /brik1_tb/Brik1u/ImagOut
add wave -noupdate /brik1_tb/Brik1u/PilotFound
add wave -noupdate /brik1_tb/Brik1u/PilotImagOut
add wave -noupdate /brik1_tb/Brik1u/PilotIndex
add wave -noupdate /brik1_tb/Brik1u/PilotLocked
add wave -noupdate /brik1_tb/Brik1u/PilotMag
add wave -noupdate /brik1_tb/Brik1u/PilotPulse
add wave -noupdate /brik1_tb/Brik1u/PilotRealOut
add wave -noupdate /brik1_tb/Brik1u/PilotValidOut
add wave -noupdate /brik1_tb/Brik1u/RealOut
add wave -noupdate -format Analog-Step -height 74 -max 123867.99999999999 -min -124935.0 /brik1_tb/Brik1u/ResampleI
add wave -noupdate /brik1_tb/Brik1u/StartOut
add wave -noupdate /brik1_tb/Brik1u/Threshold
add wave -noupdate /brik1_tb/Brik1u/ValidIn
add wave -noupdate /brik1_tb/Brik1u/ValidOut
add wave -noupdate /brik1_tb/Brik1u/Variables
add wave -noupdate /brik1_tb/Brik1u/ce
add wave -noupdate /brik1_tb/Brik1u/clk
add wave -noupdate /brik1_tb/Brik1u/clk2x
add wave -noupdate /brik1_tb/Brik1u/reset
add wave -noupdate /brik1_tb/Brik1u/reset2x
add wave -noupdate /brik1_tb/Brik1u/PS_u/ADDR_BITS
add wave -noupdate /brik1_tb/Brik1u/PS_u/Clock256
add wave -noupdate -format Analog-Step -height 74 -max 14932.0 /brik1_tb/RdAddr_i
add wave -noupdate -format Analog-Step -height 74 -max 124918.99999999999 -min -124545.0 /brik1_tb/Brik1u/PS_u/RealIn
add wave -noupdate -format Analog-Step -height 74 -max 124174.99999999997 -min -124297.0 /brik1_tb/Brik1u/PS_u/ImagIn
add wave -noupdate -radix unsigned /brik1_tb/Brik1u/PS_u/RdAddr
add wave -noupdate -format Analog-Step -height 74 -max 8191.0 -radix unsigned -radixshowbase 0 /brik1_tb/Brik1u/PS_u/RdAddr_i
add wave -noupdate -radix unsigned /brik1_tb/Brik1u/PS_u/WrAddr
add wave -noupdate -radix unsigned /brik1_tb/Brik1u/PS_u/WrAddr_i
add wave -noupdate /brik1_tb/Ratio
add wave -noupdate -format Analog-Step -height 74 -max 124767.99999999997 -min -123987.0 /brik1_tb/Brik1u/PS_u/ImagOut
add wave -noupdate -format Analog-Step -height 74 -max 124018.0 -min -124065.0 /brik1_tb/Brik1u/PS_u/RealOut
add wave -noupdate /brik1_tb/Brik1u/PS_u/StartOut
add wave -noupdate /brik1_tb/Brik1u/PS_u/ValidOut
add wave -noupdate /brik1_tb/Brik1u/PS_u/IndexIn
add wave -noupdate /brik1_tb/Brik1u/PS_u/IndexOut
add wave -noupdate /brik1_tb/Brik1u/PS_u/PilotLocked
add wave -noupdate /brik1_tb/Brik1u/PS_u/PilotPacket
add wave -noupdate /brik1_tb/Brik1u/PS_u/PilotPulseIn
add wave -noupdate /brik1_tb/Brik1u/PS_u/PilotValid
add wave -noupdate -format Analog-Step -height 74 -max 121795.0 -min -123770.0 /brik1_tb/Brik1u/PS_u/ReadI
add wave -noupdate -format Analog-Step -height 74 -max 122455.99999999999 -min -124065.0 /brik1_tb/Brik1u/PS_u/ReadR
add wave -noupdate -format Analog-Step -height 74 -max 69478.000000000015 -min -114240.0 /brik1_tb/Brik1u/PS_u/SyncError
add wave -noupdate -format Analog-Step -height 74 -max 25791000.0 -radix unsigned /brik1_tb/Brik1u/PS_u/SyncSum
add wave -noupdate /brik1_tb/Brik1u/PS_u/PacketCount_i
add wave -noupdate /brik1_tb/Brik1u/PS_u/PilotCount
add wave -noupdate /brik1_tb/Brik1u/PS_u/ReadCount
add wave -noupdate /brik1_tb/Brik1u/PS_u/InvRdCount
add wave -noupdate /brik1_tb/Brik1u/PS_u/RealOutSlv
add wave -noupdate /brik1_tb/Brik1u/PS_u/SampleCount
add wave -noupdate /brik1_tb/Brik1u/PS_u/StartNext
add wave -noupdate /brik1_tb/Brik1u/PS_u/SyncErrorIla
add wave -noupdate /brik1_tb/Brik1u/PS_u/SyncSumIla
add wave -noupdate /brik1_tb/Brik1u/PS_u/ValidIn
add wave -noupdate -expand /brik1_tb/Brik1u/PS_u/Variables
add wave -noupdate /brik1_tb/Brik1u/PS_u/WaitCount_i
add wave -noupdate /brik1_tb/Brik1u/PS_u/ImagOutSlv
add wave -noupdate /brik1_tb/Brik1u/PS_u/ce
add wave -noupdate /brik1_tb/Brik1u/PS_u/clk
add wave -noupdate /brik1_tb/Brik1u/PS_u/reset
add wave -noupdate -divider PilotDetector
add wave -noupdate /brik1_tb/Brik1u/PD_u/ReIn
add wave -noupdate /brik1_tb/Brik1u/PD_u/ImIn
add wave -noupdate /brik1_tb/Brik1u/PD_u/ValidIn
add wave -noupdate /brik1_tb/Brik1u/PD_u/ReInDly
add wave -noupdate /brik1_tb/Brik1u/PD_u/ImInDly
add wave -noupdate /brik1_tb/Brik1u/PD_u/ValidInDly
add wave -noupdate /brik1_tb/Brik1u/PD_u/StartPack
add wave -noupdate /brik1_tb/Brik1u/PD_u/ValidPack
add wave -noupdate -format Analog-Step -height 74 -max 124579.0 -min -124927.0 /brik1_tb/Brik1u/PD_u/PackR
add wave -noupdate -format Analog-Step -height 74 -max 124783.99999999999 -min -124608.0 /brik1_tb/Brik1u/PD_u/PackI
add wave -noupdate /brik1_tb/Brik1u/PD_u/ValidFft
add wave -noupdate -format Analog-Step -height 74 -max 63803.0 -min -65348.0 /brik1_tb/Brik1u/PD_u/FftR
add wave -noupdate -format Analog-Step -height 74 -max 101162.99999999999 -min -41630.0 /brik1_tb/Brik1u/PD_u/FftI
add wave -noupdate /brik1_tb/Brik1u/PD_u/ValidFftDly
add wave -noupdate /brik1_tb/Brik1u/PD_u/SampleCount
add wave -noupdate /brik1_tb/Brik1u/PD_u/Start1x
add wave -noupdate /brik1_tb/Brik1u/PD_u/ValidMult
add wave -noupdate /brik1_tb/Brik1u/PD_u/H0CntrI
add wave -noupdate /brik1_tb/Brik1u/PD_u/H0CntrR
add wave -noupdate /brik1_tb/Brik1u/PD_u/H0NegI
add wave -noupdate /brik1_tb/Brik1u/PD_u/H0NegR
add wave -noupdate /brik1_tb/Brik1u/PD_u/H0PosI
add wave -noupdate /brik1_tb/Brik1u/PD_u/H0PosR
add wave -noupdate /brik1_tb/Brik1u/PD_u/H1CntrI
add wave -noupdate /brik1_tb/Brik1u/PD_u/H1CntrR
add wave -noupdate /brik1_tb/Brik1u/PD_u/H1NegI
add wave -noupdate /brik1_tb/Brik1u/PD_u/H1NegR
add wave -noupdate /brik1_tb/Brik1u/PD_u/H1PosI
add wave -noupdate /brik1_tb/Brik1u/PD_u/H1PosR
add wave -noupdate /brik1_tb/Brik1u/PD_u/XC0CntrR
add wave -noupdate /brik1_tb/Brik1u/PD_u/XC0CntrI
add wave -noupdate /brik1_tb/Brik1u/PD_u/XC0NegI
add wave -noupdate /brik1_tb/Brik1u/PD_u/XC0NegR
add wave -noupdate /brik1_tb/Brik1u/PD_u/XC0PosI
add wave -noupdate /brik1_tb/Brik1u/PD_u/XC0PosR
add wave -noupdate /brik1_tb/Brik1u/PD_u/XC1CntrI
add wave -noupdate /brik1_tb/Brik1u/PD_u/XC1CntrR
add wave -noupdate /brik1_tb/Brik1u/PD_u/XC1NegI
add wave -noupdate /brik1_tb/Brik1u/PD_u/XC1NegR
add wave -noupdate /brik1_tb/Brik1u/PD_u/XC1PosI
add wave -noupdate /brik1_tb/Brik1u/PD_u/XC1PosR
add wave -noupdate /brik1_tb/Brik1u/PD_u/ValidIFftOut
add wave -noupdate /brik1_tb/Brik1u/PD_u/iFftCntr0I
add wave -noupdate -format Analog-Step -height 74 -max 129838.99999999999 -min -93430.0 /brik1_tb/Brik1u/PD_u/iFftCntr0R
add wave -noupdate /brik1_tb/Brik1u/PD_u/iFftCntr1I
add wave -noupdate /brik1_tb/Brik1u/PD_u/iFftCntr1R
add wave -noupdate /brik1_tb/Brik1u/PD_u/iFftCntr1Slv
add wave -noupdate /brik1_tb/Brik1u/PD_u/iFftNeg0I
add wave -noupdate /brik1_tb/Brik1u/PD_u/iFftNeg0R
add wave -noupdate /brik1_tb/Brik1u/PD_u/iFftNeg0Slv
add wave -noupdate /brik1_tb/Brik1u/PD_u/iFftNeg1I
add wave -noupdate /brik1_tb/Brik1u/PD_u/iFftNeg1R
add wave -noupdate /brik1_tb/Brik1u/PD_u/iFftNeg1Slv
add wave -noupdate /brik1_tb/Brik1u/PD_u/ValidCos
add wave -noupdate /brik1_tb/Brik1u/PD_u/ValidOut
add wave -noupdate /brik1_tb/Brik1u/PD_u/iFftPos0I
add wave -noupdate /brik1_tb/Brik1u/PD_u/iFftPos0R
add wave -noupdate /brik1_tb/Brik1u/PD_u/iFftPos0Slv
add wave -noupdate /brik1_tb/Brik1u/PD_u/iFftPos1I
add wave -noupdate /brik1_tb/Brik1u/PD_u/iFftPos1R
add wave -noupdate /brik1_tb/Brik1u/PD_u/iFftPos1Slv
add wave -noupdate /brik1_tb/Brik1u/PD_u/iFftReady
add wave -noupdate /brik1_tb/Brik1u/PD_u/ValidAbs
add wave -noupdate /brik1_tb/Brik1u/PD_u/ValidAbsDly
add wave -noupdate -clampanalog 1 -format Analog-Step -height 74 -max 25000.0 /brik1_tb/Brik1u/PD_u/Cntr0Abs/FullSize
add wave -noupdate -clampanalog 1 -format Analog-Step -height 74 -max 25000.0 /brik1_tb/Brik1u/PD_u/AbsCntr0
add wave -noupdate -clampanalog 1 -format Analog-Step -height 74 -max 25000.0 /brik1_tb/Brik1u/PD_u/AbsCntr1
add wave -noupdate /brik1_tb/Brik1u/PD_u/Cntr1Abs/FullSize
add wave -noupdate -clampanalog 1 -format Analog-Step -height 74 -max 25000.0 /brik1_tb/Brik1u/PD_u/AbsNeg0
add wave -noupdate -clampanalog 1 -format Analog-Step -height 74 -max 25000.0 /brik1_tb/Brik1u/PD_u/AbsNeg1
add wave -noupdate -clampanalog 1 -format Analog-Step -height 74 -max 25000.0 /brik1_tb/Brik1u/PD_u/AbsPos0
add wave -noupdate -clampanalog 1 -format Analog-Step -height 74 -max 25000.0 /brik1_tb/Brik1u/PD_u/AbsPos1
add wave -noupdate /brik1_tb/Brik1u/PD_u/MaxNeg
add wave -noupdate /brik1_tb/Brik1u/PD_u/MaxPos
add wave -noupdate /brik1_tb/Brik1u/PD_u/Max
add wave -noupdate /brik1_tb/Brik1u/PD_u/PilotPulse
add wave -noupdate /brik1_tb/Brik1u/PD_u/PilotPulse1x
add wave -noupdate -format Analog-Step -height 74 -max 33815.0 /brik1_tb/Brik1u/PD_u/Peak1
add wave -noupdate -format Analog-Step -height 74 -max 22606.0 /brik1_tb/Brik1u/PD_u/Peak2
add wave -noupdate -format Analog-Step -height 74 -max 57856.0 -min 8506.0 -radix sfixed -childformat {{/brik1_tb/Brik1u/PD_u/Threshold(11) -radix sfixed} {/brik1_tb/Brik1u/PD_u/Threshold(10) -radix sfixed} {/brik1_tb/Brik1u/PD_u/Threshold(9) -radix sfixed} {/brik1_tb/Brik1u/PD_u/Threshold(8) -radix sfixed} {/brik1_tb/Brik1u/PD_u/Threshold(7) -radix sfixed} {/brik1_tb/Brik1u/PD_u/Threshold(6) -radix sfixed} {/brik1_tb/Brik1u/PD_u/Threshold(5) -radix sfixed} {/brik1_tb/Brik1u/PD_u/Threshold(4) -radix sfixed} {/brik1_tb/Brik1u/PD_u/Threshold(3) -radix sfixed} {/brik1_tb/Brik1u/PD_u/Threshold(2) -radix sfixed} {/brik1_tb/Brik1u/PD_u/Threshold(1) -radix sfixed} {/brik1_tb/Brik1u/PD_u/Threshold(0) -radix sfixed} {/brik1_tb/Brik1u/PD_u/Threshold(-1) -radix sfixed} {/brik1_tb/Brik1u/PD_u/Threshold(-2) -radix sfixed} {/brik1_tb/Brik1u/PD_u/Threshold(-3) -radix sfixed} {/brik1_tb/Brik1u/PD_u/Threshold(-4) -radix sfixed} {/brik1_tb/Brik1u/PD_u/Threshold(-5) -radix sfixed} {/brik1_tb/Brik1u/PD_u/Threshold(-6) -radix sfixed}} -subitemconfig {/brik1_tb/Brik1u/PD_u/Threshold(11) {-height 15 -radix sfixed} /brik1_tb/Brik1u/PD_u/Threshold(10) {-height 15 -radix sfixed} /brik1_tb/Brik1u/PD_u/Threshold(9) {-height 15 -radix sfixed} /brik1_tb/Brik1u/PD_u/Threshold(8) {-height 15 -radix sfixed} /brik1_tb/Brik1u/PD_u/Threshold(7) {-height 15 -radix sfixed} /brik1_tb/Brik1u/PD_u/Threshold(6) {-height 15 -radix sfixed} /brik1_tb/Brik1u/PD_u/Threshold(5) {-height 15 -radix sfixed} /brik1_tb/Brik1u/PD_u/Threshold(4) {-height 15 -radix sfixed} /brik1_tb/Brik1u/PD_u/Threshold(3) {-height 15 -radix sfixed} /brik1_tb/Brik1u/PD_u/Threshold(2) {-height 15 -radix sfixed} /brik1_tb/Brik1u/PD_u/Threshold(1) {-height 15 -radix sfixed} /brik1_tb/Brik1u/PD_u/Threshold(0) {-height 15 -radix sfixed} /brik1_tb/Brik1u/PD_u/Threshold(-1) {-height 15 -radix sfixed} /brik1_tb/Brik1u/PD_u/Threshold(-2) {-height 15 -radix sfixed} /brik1_tb/Brik1u/PD_u/Threshold(-3) {-height 15 -radix sfixed} /brik1_tb/Brik1u/PD_u/Threshold(-4) {-height 15 -radix sfixed} /brik1_tb/Brik1u/PD_u/Threshold(-5) {-height 15 -radix sfixed} /brik1_tb/Brik1u/PD_u/Threshold(-6) {-height 15 -radix sfixed}} /brik1_tb/Brik1u/PD_u/Threshold
add wave -noupdate -format Analog-Step -height 74 -max 33210.0 -radix sfixed -childformat {{/brik1_tb/Brik1u/PD_u/PilotMag(11) -radix sfixed} {/brik1_tb/Brik1u/PD_u/PilotMag(10) -radix sfixed} {/brik1_tb/Brik1u/PD_u/PilotMag(9) -radix sfixed} {/brik1_tb/Brik1u/PD_u/PilotMag(8) -radix sfixed} {/brik1_tb/Brik1u/PD_u/PilotMag(7) -radix sfixed} {/brik1_tb/Brik1u/PD_u/PilotMag(6) -radix sfixed} {/brik1_tb/Brik1u/PD_u/PilotMag(5) -radix sfixed} {/brik1_tb/Brik1u/PD_u/PilotMag(4) -radix sfixed} {/brik1_tb/Brik1u/PD_u/PilotMag(3) -radix sfixed} {/brik1_tb/Brik1u/PD_u/PilotMag(2) -radix sfixed} {/brik1_tb/Brik1u/PD_u/PilotMag(1) -radix sfixed} {/brik1_tb/Brik1u/PD_u/PilotMag(0) -radix sfixed} {/brik1_tb/Brik1u/PD_u/PilotMag(-1) -radix sfixed} {/brik1_tb/Brik1u/PD_u/PilotMag(-2) -radix sfixed} {/brik1_tb/Brik1u/PD_u/PilotMag(-3) -radix sfixed} {/brik1_tb/Brik1u/PD_u/PilotMag(-4) -radix sfixed} {/brik1_tb/Brik1u/PD_u/PilotMag(-5) -radix sfixed} {/brik1_tb/Brik1u/PD_u/PilotMag(-6) -radix sfixed}} -subitemconfig {/brik1_tb/Brik1u/PD_u/PilotMag(11) {-height 15 -radix sfixed} /brik1_tb/Brik1u/PD_u/PilotMag(10) {-height 15 -radix sfixed} /brik1_tb/Brik1u/PD_u/PilotMag(9) {-height 15 -radix sfixed} /brik1_tb/Brik1u/PD_u/PilotMag(8) {-height 15 -radix sfixed} /brik1_tb/Brik1u/PD_u/PilotMag(7) {-height 15 -radix sfixed} /brik1_tb/Brik1u/PD_u/PilotMag(6) {-height 15 -radix sfixed} /brik1_tb/Brik1u/PD_u/PilotMag(5) {-height 15 -radix sfixed} /brik1_tb/Brik1u/PD_u/PilotMag(4) {-height 15 -radix sfixed} /brik1_tb/Brik1u/PD_u/PilotMag(3) {-height 15 -radix sfixed} /brik1_tb/Brik1u/PD_u/PilotMag(2) {-height 15 -radix sfixed} /brik1_tb/Brik1u/PD_u/PilotMag(1) {-height 15 -radix sfixed} /brik1_tb/Brik1u/PD_u/PilotMag(0) {-height 15 -radix sfixed} /brik1_tb/Brik1u/PD_u/PilotMag(-1) {-height 15 -radix sfixed} /brik1_tb/Brik1u/PD_u/PilotMag(-2) {-height 15 -radix sfixed} /brik1_tb/Brik1u/PD_u/PilotMag(-3) {-height 15 -radix sfixed} /brik1_tb/Brik1u/PD_u/PilotMag(-4) {-height 15 -radix sfixed} /brik1_tb/Brik1u/PD_u/PilotMag(-5) {-height 15 -radix sfixed} /brik1_tb/Brik1u/PD_u/PilotMag(-6) {-height 15 -radix sfixed}} /brik1_tb/Brik1u/PD_u/PilotMag
add wave -noupdate /brik1_tb/Brik1u/PD_u/PilotFound
add wave -noupdate -format Analog-Step -height 74 -max 123721.00000000001 -min -123507.0 /brik1_tb/Brik1u/PD_u/ReOut
add wave -noupdate -format Analog-Step -height 74 -max 123310.99999999999 -min -123676.0 /brik1_tb/Brik1u/PD_u/ImOut
add wave -noupdate /brik1_tb/Brik1u/PD_u/CalcThreshold
add wave -noupdate /brik1_tb/Brik1u/PD_u/CurrentPeak
add wave -noupdate /brik1_tb/Brik1u/PD_u/PeakPointer
add wave -noupdate /brik1_tb/Brik1u/PD_u/PilotIndex
add wave -noupdate /brik1_tb/Brik1u/PD_u/Index0
add wave -noupdate /brik1_tb/Brik1u/PD_u/Index3
add wave -noupdate /brik1_tb/Brik1u/PD_u/MagDelay
add wave -noupdate /brik1_tb/Brik1u/PD_u/BadPilot
add wave -noupdate /brik1_tb/Brik1u/PD_u/GoodPilot
add wave -noupdate -radix unsigned /brik1_tb/Brik1u/PD_u/SkipPacket
add wave -noupdate /brik1_tb/Brik1u/PD_u/StartOut
add wave -noupdate /brik1_tb/Brik1u/PD_u/iFftOnesHi
add wave -noupdate /brik1_tb/Brik1u/PD_u/iFftOnesLo
add wave -noupdate /brik1_tb/Brik1u/PD_u/iFftZerosHi
add wave -noupdate /brik1_tb/Brik1u/PD_u/iFftZerosLo
add wave -noupdate /brik1_tb/Brik1u/PD_u/Hi0
add wave -noupdate /brik1_tb/Brik1u/PD_u/Hi1
add wave -noupdate /brik1_tb/Brik1u/PD_u/Lo0
add wave -noupdate /brik1_tb/Brik1u/PD_u/Lo1
add wave -noupdate -divider -height 34 OverFlows
add wave -noupdate /brik1_tb/Brik1u/PD_u/Cntr0Abs/OverFlow
add wave -noupdate /brik1_tb/Brik1u/PD_u/Cntr1Abs/OverFlow
add wave -noupdate /brik1_tb/Brik1u/PD_u/OverflowIFft
add wave -noupdate /brik1_tb/Brik1u/PD_u/OverflowFft
add wave -noupdate /brik1_tb/Brik1u/PD_u/PackFifo/Idle1x
add wave -noupdate /brik1_tb/Brik1u/PD_u/PackFifo/Idle2x
add wave -noupdate /brik1_tb/Brik1u/PD_u/PackFifo/OverFlow1x
add wave -noupdate /brik1_tb/Brik1u/PD_u/PackFifo/OverFlow2x
add wave -noupdate /brik1_tb/Brik1u/PD_u/PackFifo/ProgFull1x
add wave -noupdate /brik1_tb/Brik1u/PD_u/PackFifo/ProgFull2x
add wave -noupdate /brik1_tb/Brik1u/PD_u/PackFifo/UnderFlow1x
add wave -noupdate /brik1_tb/Brik1u/PD_u/PackFifo/UnderFlow2x
add wave -noupdate -divider -height 34 {Timing Estimate}
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {11804610000 ps} 0} {{Cursor 2} {1709322024 ps} 0} {{Cursor 3} {7580320000 ps} 0}
quietly wave cursor active 2
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
WaveRestoreZoom {0 ps} {24228750 ps}
bookmark add wave bookmark0 {{2508730 ps} {2540670 ps}} 0
bookmark add wave bookmark1 {{3023030 ps} {3054970 ps}} 0
bookmark add wave bookmark2 {{2187685 ps} {2199857 ps}} 33
bookmark add wave bookmark3 {{3212803 ps} {3228773 ps}} 48
