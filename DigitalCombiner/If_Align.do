onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /cmplphsdettb/NoiseGain1
add wave -noupdate /cmplphsdettb/NoiseGain2
add wave -noupdate /cmplphsdettb/PhaseInc
add wave -noupdate -radix decimal -radixshowbase 0 /cmplphsdettb/FreqOffset
add wave -noupdate /cmplphsdettb/Ch1Agc
add wave -noupdate /cmplphsdettb/Ch2Agc
add wave -noupdate /cmplphsdettb/AM_Amp1
add wave -noupdate /cmplphsdettb/AM_Amp2
add wave -noupdate /cmplphsdettb/AM_Freq1
add wave -noupdate /cmplphsdettb/AM_Freq2
add wave -noupdate -radix decimal /cmplphsdettb/Delay
add wave -noupdate /cmplphsdettb/SNR
add wave -noupdate /cmplphsdettb/NoiseGain
add wave -noupdate -radix ufixed /cmplphsdettb/NoiseGain_u
add wave -noupdate /cmplphsdettb/NoiseGain1
add wave -noupdate /cmplphsdettb/DigitalCombiner_u/IF_Align_u/AbeforeB
add wave -noupdate -clampanalog 1 -format Analog-Step -height 74 -max 70000.0 -radix unsigned /cmplphsdettb/DigitalCombiner_u/IF_Align_u/GenCorrs(2)/FftCorr/AbsFft
add wave -noupdate -clampanalog 1 -format Analog-Step -height 74 -max 70000.0 -radix unsigned /cmplphsdettb/DigitalCombiner_u/IF_Align_u/GenCorrs(1)/FftCorr/AbsFft
add wave -noupdate -clampanalog 1 -format Analog-Step -height 74 -max 70000.0 -radix unsigned /cmplphsdettb/DigitalCombiner_u/IF_Align_u/GenCorrs(0)/FftCorr/AbsFft
add wave -noupdate /cmplphsdettb/DigitalCombiner_u/IF_Align_u/FftReady
add wave -noupdate -radix unsigned -childformat {{/cmplphsdettb/DigitalCombiner_u/IF_Align_u/PeakOut(2) -radix unsigned} {/cmplphsdettb/DigitalCombiner_u/IF_Align_u/PeakOut(1) -radix unsigned} {/cmplphsdettb/DigitalCombiner_u/IF_Align_u/PeakOut(0) -radix unsigned}} -expand -subitemconfig {/cmplphsdettb/DigitalCombiner_u/IF_Align_u/PeakOut(2) {-clampanalog 1 -height 15 -radix unsigned -radixshowbase 0} /cmplphsdettb/DigitalCombiner_u/IF_Align_u/PeakOut(1) {-clampanalog 1 -height 15 -radix unsigned -radixshowbase 0} /cmplphsdettb/DigitalCombiner_u/IF_Align_u/PeakOut(0) {-clampanalog 1 -height 15 -radix unsigned -radixshowbase 0}} /cmplphsdettb/DigitalCombiner_u/IF_Align_u/PeakOut
add wave -noupdate -radix decimal -childformat {{/cmplphsdettb/DigitalCombiner_u/IF_Align_u/IndexOut(2) -radix decimal} {/cmplphsdettb/DigitalCombiner_u/IF_Align_u/IndexOut(1) -radix decimal} {/cmplphsdettb/DigitalCombiner_u/IF_Align_u/IndexOut(0) -radix decimal}} -expand -subitemconfig {/cmplphsdettb/DigitalCombiner_u/IF_Align_u/IndexOut(2) {-clampanalog 1 -format Analog-Step -height 15 -max 36.0 -min 28.0 -radix decimal} /cmplphsdettb/DigitalCombiner_u/IF_Align_u/IndexOut(1) {-clampanalog 1 -format Analog-Step -height 15 -max 36.0 -min 28.0 -radix decimal} /cmplphsdettb/DigitalCombiner_u/IF_Align_u/IndexOut(0) {-clampanalog 1 -format Analog-Step -height 15 -max 36.0 -min 28.0 -radix decimal}} /cmplphsdettb/DigitalCombiner_u/IF_Align_u/IndexOut
add wave -noupdate /cmplphsdettb/DigitalCombiner_u/IF_Align_u/Largest
add wave -noupdate -format Analog-Step -height 74 -max 12.000000000000002 -min -13.0 -radix sfixed /cmplphsdettb/DigitalCombiner_u/IF_Align_u/GenCorrs(1)/FftCorr/FreqOffset
add wave -noupdate -format Analog-Step -height 74 -max 2559.0 /cmplphsdettb/SampleCount
add wave -noupdate /cmplphsdettb/DigitalCombiner_u/IF_Align_u/NewIndex
add wave -noupdate -format Analog-Step -height 74 -max 2559.0 /cmplphsdettb/DigitalCombiner_u/IF_Align_u/GenCorrs(1)/FftCorr/SampleCount
add wave -noupdate /cmplphsdettb/DigitalCombiner_u/IF_Align_u/GenCorrs(0)/FftCorr/SampleCount
add wave -noupdate /cmplphsdettb/DigitalCombiner_u/IF_Align_u/GenCorrs(2)/FftCorr/SampleCount
add wave -noupdate -clampanalog 1 -format Analog-Step -height 74 -max 35000.0 -min -35000.0 -radix sfixed /cmplphsdettb/DigitalCombiner_u/IF_Align_u/GenCorrs(0)/FftCorr/NcodI
add wave -noupdate -clampanalog 1 -format Analog-Step -height 74 -max 35000.0 -min -35000.0 -radix sfixed /cmplphsdettb/DigitalCombiner_u/IF_Align_u/GenCorrs(0)/FftCorr/NcodR
add wave -noupdate -clampanalog 1 -format Analog-Step -height 74 -max 35000.0 -min -35000.0 -radix sfixed /cmplphsdettb/DigitalCombiner_u/IF_Align_u/GenCorrs(1)/FftCorr/NcodI
add wave -noupdate -clampanalog 1 -format Analog-Step -height 74 -max 35000.0 -min -35000.0 -radix sfixed /cmplphsdettb/DigitalCombiner_u/IF_Align_u/GenCorrs(1)/FftCorr/NcodR
add wave -noupdate -clampanalog 1 -format Analog-Step -height 74 -max 35000.0 -min -35000.0 -radix sfixed /cmplphsdettb/DigitalCombiner_u/IF_Align_u/GenCorrs(2)/FftCorr/NcodI
add wave -noupdate -clampanalog 1 -format Analog-Step -height 74 -max 35000.0 -min -35000.0 -radix sfixed /cmplphsdettb/DigitalCombiner_u/IF_Align_u/GenCorrs(2)/FftCorr/NcodR
add wave -noupdate /cmplphsdettb/DigitalCombiner_u/IF_Align_u/GenCorrs(1)/FftCorr/Fft_u/m_axis_data_tdata
add wave -noupdate /cmplphsdettb/DigitalCombiner_u/IF_Align_u/GenCorrs(1)/FftCorr/Fft_u/s_axis_data_tdata
add wave -noupdate -format Analog-Step -height 74 -max 70.0 -radix sfixed /cmplphsdettb/ComplexMult/ImInA
add wave -noupdate -format Analog-Step -height 74 -max 14314.000000000002 -min -14491.0 -radix sfixed /cmplphsdettb/ComplexMult/ReInA
add wave -noupdate -format Analog-Step -height 74 -max 131069.99999999999 -min -131070.0 -radix sfixed /cmplphsdettb/ComplexMult/ImInB
add wave -noupdate -format Analog-Step -height 74 -max 114776.00000000001 -min -131070.0 -radix sfixed /cmplphsdettb/ComplexMult/ReInB
add wave -noupdate -format Analog-Step -height 74 -max 10570.999999999998 -min -11474.0 -radix sfixed /cmplphsdettb/ComplexMult/ImOut
add wave -noupdate -format Analog-Step -height 74 -max 13054.0 -min -13305.0 -radix sfixed /cmplphsdettb/ComplexMult/ReOut
add wave -noupdate /cmplphsdettb/DigitalCombiner_u/IF_Align_u/ValidFft
add wave -noupdate /cmplphsdettb/DigitalCombiner_u/IF_Align_u/FftTLastIn
add wave -noupdate -divider -height 40 {New Divider}
add wave -noupdate /cmplphsdettb/DigitalCombiner_u/IF_Align_u/Restart
add wave -noupdate -radix sfixed /cmplphsdettb/DigitalCombiner_u/IF_Align_u/AGC1/GainInt
add wave -noupdate -radix sfixed /cmplphsdettb/DigitalCombiner_u/IF_Align_u/AGC2/GainInt
add wave -noupdate -format Analog-Step -height 74 -max 14489.999999999998 -min -14485.0 -radix sfixed /cmplphsdettb/DigitalCombiner_u/IF_Align_u/GenCorrs(1)/FftCorr/ComplexMult/ImInA
add wave -noupdate -format Analog-Step -height 74 -max 70.0 -radix sfixed /cmplphsdettb/DigitalCombiner_u/IF_Align_u/GenCorrs(1)/FftCorr/ComplexMult/ImInB
add wave -noupdate -format Analog-Step -height 74 -max 14489.000000000002 -min -14485.0 -radix sfixed /cmplphsdettb/DigitalCombiner_u/IF_Align_u/GenCorrs(1)/FftCorr/ComplexMult/ImOut
add wave -noupdate -format Analog-Step -height 74 -max 14467.000000000002 -min -14491.0 -radix sfixed /cmplphsdettb/DigitalCombiner_u/IF_Align_u/GenCorrs(1)/FftCorr/ComplexMult/ReInA
add wave -noupdate -format Analog-Step -height 74 -max 131071.0 -radix sfixed /cmplphsdettb/DigitalCombiner_u/IF_Align_u/GenCorrs(1)/FftCorr/ComplexMult/ReInB
add wave -noupdate -format Analog-Step -height 74 -max 14466.000000000002 -min -14491.0 -radix sfixed /cmplphsdettb/DigitalCombiner_u/IF_Align_u/GenCorrs(1)/FftCorr/ComplexMult/ReOut
add wave -noupdate -format Analog-Step -height 74 -max 14470.0 -min -14491.0 -radix sfixed /cmplphsdettb/NcodI
add wave -noupdate -format Analog-Step -height 74 -max 14489.999999999998 -min -14491.0 -radix sfixed /cmplphsdettb/NcodQ
add wave -noupdate -format Analog-Step -height 74 -max 65536.0 -radix sfixed /cmplphsdettb/AM_Mod1
add wave -noupdate -format Analog-Step -height 74 -max 65536.0 -radix sfixed /cmplphsdettb/AM_Mod2
add wave -noupdate -format Analog-Step -height 74 -max 48372.0 -min -46684.0 -radix sfixed /cmplphsdettb/I1Noisy
add wave -noupdate -format Analog-Step -height 74 -max 53847.0 -min -39599.0 -radix sfixed /cmplphsdettb/I2Noisy
add wave -noupdate -format Analog-Step -height 74 -max 9193.0 -min -9131.0 -radix sfixed /cmplphsdettb/Q1Noisy
add wave -noupdate -format Analog-Step -height 74 -max 18952.000000000004 -min -19547.0 -radix sfixed /cmplphsdettb/Q2Noisy
add wave -noupdate /cmplphsdettb/DigitalCombiner_u/IF_Align_u/GenCorrs(2)/FftCorr/PHASE_INC
add wave -noupdate -format Analog-Step -height 74 -max 131069.99999999999 -min -131070.0 -radix sfixed /cmplphsdettb/DigitalCombiner_u/IF_Align_u/GenCorrs(2)/FftCorr/Cos
add wave -noupdate -format Analog-Step -height 74 -max 131069.99999999999 -min -131070.0 -radix sfixed /cmplphsdettb/DigitalCombiner_u/IF_Align_u/GenCorrs(0)/FftCorr/Cos
add wave -noupdate -format Analog-Step -height 74 -max 131068.99999999999 -min -131071.0 -radix sfixed /cmplphsdettb/DigitalCombiner_u/IF_Align_u/GenCorrs(2)/FftCorr/Sin
add wave -noupdate -format Analog-Step -height 74 -max 131069.99999999999 -min -131070.0 -radix sfixed /cmplphsdettb/DigitalCombiner_u/IF_Align_u/GenCorrs(0)/FftCorr/Sin
add wave -noupdate /cmplphsdettb/DigitalCombiner_u/IF_Align_u/FftReady0
add wave -noupdate -radix sfixed /cmplphsdettb/DigitalCombiner_u/IF_Align_u/Im1In
add wave -noupdate -radix sfixed /cmplphsdettb/DigitalCombiner_u/IF_Align_u/Im1Out
add wave -noupdate -radix sfixed /cmplphsdettb/DigitalCombiner_u/IF_Align_u/Im2In
add wave -noupdate -radix sfixed /cmplphsdettb/DigitalCombiner_u/IF_Align_u/Im2Out
add wave -noupdate -radix sfixed /cmplphsdettb/DigitalCombiner_u/IF_Align_u/ImInDly1
add wave -noupdate -radix sfixed /cmplphsdettb/DigitalCombiner_u/IF_Align_u/ImInDly2
add wave -noupdate -radix sfixed /cmplphsdettb/DigitalCombiner_u/IF_Align_u/Index
add wave -noupdate -radix sfixed /cmplphsdettb/DigitalCombiner_u/IF_Align_u/IndexAbs
add wave -noupdate -radix sfixed /cmplphsdettb/DigitalCombiner_u/IF_Align_u/IndexAcc
add wave -noupdate -radix sfixed /cmplphsdettb/DigitalCombiner_u/IF_Align_u/IndexOut
add wave -noupdate -radix sfixed /cmplphsdettb/DigitalCombiner_u/IF_Align_u/PackI1
add wave -noupdate -radix sfixed /cmplphsdettb/DigitalCombiner_u/IF_Align_u/PackI2
add wave -noupdate -radix sfixed /cmplphsdettb/DigitalCombiner_u/IF_Align_u/PackR1
add wave -noupdate -radix sfixed /cmplphsdettb/DigitalCombiner_u/IF_Align_u/PackR2
add wave -noupdate -divider -height 40 {New Divider}
add wave -noupdate -format Analog-Step -height 74 -max 70882.0 -min -60645.0 -radix sfixed /cmplphsdettb/DigitalCombiner_u/IF_Align_u/PackFifo/ReIn1
add wave -noupdate -format Analog-Step -height 74 -max 55108.999999999985 -min -59545.0 -radix sfixed /cmplphsdettb/DigitalCombiner_u/IF_Align_u/PackFifo/ReIn2
add wave -noupdate /cmplphsdettb/DigitalCombiner_u/IF_Align_u/PackFifo/ImIn1
add wave -noupdate /cmplphsdettb/DigitalCombiner_u/IF_Align_u/PackFifo/ImIn2
add wave -noupdate -format Analog-Step -height 74 -max 99561.0 /cmplphsdettb/DigitalCombiner_u/IF_Align_u/PackFifo/RdCount
add wave -noupdate /cmplphsdettb/DigitalCombiner_u/IF_Align_u/PackFifo/ImOut4x1
add wave -noupdate /cmplphsdettb/DigitalCombiner_u/IF_Align_u/PackFifo/ImOut4x2
add wave -noupdate /cmplphsdettb/DigitalCombiner_u/IF_Align_u/PackFifo/ReOut4x1
add wave -noupdate /cmplphsdettb/DigitalCombiner_u/IF_Align_u/PackFifo/ReOut4x2
add wave -noupdate /cmplphsdettb/DigitalCombiner_u/IF_Align_u/PackFifo/Idle4x
add wave -noupdate /cmplphsdettb/DigitalCombiner_u/IF_Align_u/PackFifo/Mode
add wave -noupdate /cmplphsdettb/DigitalCombiner_u/IF_Align_u/PackFifo/Restart
add wave -noupdate /cmplphsdettb/DigitalCombiner_u/IF_Align_u/PackFifo/Start4x
add wave -noupdate /cmplphsdettb/DigitalCombiner_u/IF_Align_u/PackFifo/ValidDataOut4x
add wave -noupdate /cmplphsdettb/DigitalCombiner_u/IF_Align_u/PackFifo/ValidFftOut4x
add wave -noupdate /cmplphsdettb/DigitalCombiner_u/IF_Align_u/PackFifo/LastOut4x
add wave -noupdate /cmplphsdettb/DigitalCombiner_u/IF_Align_u/PackFifo/ReadyIn
add wave -noupdate /cmplphsdettb/DigitalCombiner_u/IF_Align_u/PackFifo/Pop4x
add wave -noupdate -radix unsigned -radixshowbase 0 /cmplphsdettb/DigitalCombiner_u/IF_Align_u/PackFifo/PopCount4x
add wave -noupdate /cmplphsdettb/DigitalCombiner_u/IF_Align_u/PackFifo/ProgFull4x
add wave -noupdate /cmplphsdettb/DigitalCombiner_u/IF_Align_u/PackFifo/OverFlow4x
add wave -noupdate /cmplphsdettb/DigitalCombiner_u/IF_Align_u/PackFifo/RdRstBusy4x
add wave -noupdate /cmplphsdettb/DigitalCombiner_u/IF_Align_u/PackFifo/UnderFlow4x
add wave -noupdate /cmplphsdettb/DigitalCombiner_u/IF_Align_u/PackFifo/WrEn
add wave -noupdate /cmplphsdettb/DigitalCombiner_u/IF_Align_u/PackFifo/WrRstBusy4x
add wave -noupdate /cmplphsdettb/DigitalCombiner_u/IF_Align_u/Fft_u/s_axis_data_tvalid
add wave -noupdate /cmplphsdettb/DigitalCombiner_u/IF_Align_u/GenCorrs(0)/FftCorr/ValidDataIn
add wave -noupdate /cmplphsdettb/DigitalCombiner_u/IF_Align_u/GenCorrs(0)/FftCorr/ValidFft
add wave -noupdate /cmplphsdettb/DigitalCombiner_u/IF_Align_u/GenCorrs(0)/FftCorr/ValidFftIn
add wave -noupdate /cmplphsdettb/DigitalCombiner_u/IF_Align_u/GenCorrs(0)/FftCorr/ValidMixer
add wave -noupdate /cmplphsdettb/DigitalCombiner_u/IF_Align_u/GenCorrs(1)/FftCorr/ValidDataIn
add wave -noupdate /cmplphsdettb/DigitalCombiner_u/IF_Align_u/GenCorrs(1)/FftCorr/ValidFft
add wave -noupdate /cmplphsdettb/DigitalCombiner_u/IF_Align_u/GenCorrs(1)/FftCorr/ValidFftIn
add wave -noupdate /cmplphsdettb/DigitalCombiner_u/IF_Align_u/GenCorrs(1)/FftCorr/ValidMixer
add wave -noupdate /cmplphsdettb/DigitalCombiner_u/IF_Align_u/GenCorrs(2)/FftCorr/ValidFft
add wave -noupdate /cmplphsdettb/DigitalCombiner_u/IF_Align_u/GenCorrs(2)/FftCorr/ValidFftIn
add wave -noupdate /cmplphsdettb/DigitalCombiner_u/IF_Align_u/GenCorrs(2)/FftCorr/ValidMixer
add wave -noupdate /cmplphsdettb/DigitalCombiner_u/IF_Align_u/Fft_u/event_data_in_channel_halt
add wave -noupdate /cmplphsdettb/DigitalCombiner_u/IF_Align_u/Fft_u/event_frame_started
add wave -noupdate /cmplphsdettb/DigitalCombiner_u/IF_Align_u/Fft_u/event_tlast_missing
add wave -noupdate /cmplphsdettb/DigitalCombiner_u/IF_Align_u/Fft_u/event_tlast_unexpected
add wave -noupdate /cmplphsdettb/DigitalCombiner_u/IF_Align_u/GenCorrs(0)/FftCorr/Fft_u/s_axis_config_tdata
add wave -noupdate /cmplphsdettb/DigitalCombiner_u/IF_Align_u/GenCorrs(0)/FftCorr/Fft_u/s_axis_config_tready
add wave -noupdate /cmplphsdettb/DigitalCombiner_u/IF_Align_u/GenCorrs(0)/FftCorr/Fft_u/s_axis_config_tvalid
add wave -noupdate /cmplphsdettb/DigitalCombiner_u/IF_Align_u/GenCorrs(0)/FftCorr/Fft_u/s_axis_data_tdata
add wave -noupdate /cmplphsdettb/DigitalCombiner_u/IF_Align_u/GenCorrs(0)/FftCorr/Fft_u/s_axis_data_tlast
add wave -noupdate /cmplphsdettb/DigitalCombiner_u/IF_Align_u/GenCorrs(0)/FftCorr/Fft_u/s_axis_data_tready
add wave -noupdate /cmplphsdettb/DigitalCombiner_u/IF_Align_u/GenCorrs(0)/FftCorr/Fft_u/s_axis_data_tvalid
add wave -noupdate /cmplphsdettb/DigitalCombiner_u/IF_Align_u/GenCorrs(0)/FftCorr/Fft_u/m_axis_data_tdata
add wave -noupdate /cmplphsdettb/DigitalCombiner_u/IF_Align_u/GenCorrs(0)/FftCorr/Fft_u/m_axis_data_tlast
add wave -noupdate /cmplphsdettb/DigitalCombiner_u/IF_Align_u/GenCorrs(0)/FftCorr/Fft_u/m_axis_data_tuser
add wave -noupdate /cmplphsdettb/DigitalCombiner_u/IF_Align_u/GenCorrs(0)/FftCorr/Fft_u/m_axis_data_tvalid
add wave -noupdate /cmplphsdettb/DigitalCombiner_u/IF_Align_u/GenCorrs(0)/FftCorr/Fft_u/m_axis_status_tdata
add wave -noupdate /cmplphsdettb/DigitalCombiner_u/IF_Align_u/GenCorrs(0)/FftCorr/Fft_u/m_axis_status_tvalid
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {8834011228 ps} 0} {{Cursor 2} {4705561873 ps} 0}
quietly wave cursor active 2
configure wave -namecolwidth 507
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
WaveRestoreZoom {0 ps} {19312796055 ps}
bookmark add wave bookmark0 {{2508730 ps} {2540670 ps}} 0
bookmark add wave bookmark1 {{3023030 ps} {3054970 ps}} 0
bookmark add wave bookmark2 {{2187685 ps} {2199857 ps}} 33
bookmark add wave bookmark3 {{3212803 ps} {3228773 ps}} 48
