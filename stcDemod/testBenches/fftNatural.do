onerror {resume}
radix define s24 -fixed -fraction 24 -signed -precision 6
radix define s23 -fixed -fraction 23 -signed -precision 6
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_xfft_natural/aclk
add wave -noupdate /tb_xfft_natural/aresetn
add wave -noupdate /tb_xfft_natural/aclken
add wave -noupdate /tb_xfft_natural/s_axis_config_tvalid
add wave -noupdate /tb_xfft_natural/s_axis_config_tready
add wave -noupdate /tb_xfft_natural/s_axis_config_tdata
add wave -noupdate /tb_xfft_natural/s_axis_data_tvalid
add wave -noupdate /tb_xfft_natural/s_axis_data_tready
add wave -noupdate /tb_xfft_natural/s_axis_data_tdata
add wave -noupdate /tb_xfft_natural/s_axis_data_tlast
add wave -noupdate /tb_xfft_natural/m_axis_data_tvalid
add wave -noupdate /tb_xfft_natural/m_axis_data_tdata
add wave -noupdate /tb_xfft_natural/m_axis_data_tlast
add wave -noupdate /tb_xfft_natural/event_frame_started
add wave -noupdate /tb_xfft_natural/event_tlast_unexpected
add wave -noupdate /tb_xfft_natural/event_tlast_missing
add wave -noupdate /tb_xfft_natural/event_data_in_channel_halt
add wave -noupdate /tb_xfft_natural/s_axis_config_tdata_fwd_inv
add wave -noupdate -format Analog-Step -height 74 -max 5242879.9999999991 -min -5241400.0 -radix s23 /tb_xfft_natural/s_axis_data_tdata_re
add wave -noupdate -format Analog-Step -height 74 -max 5239549.9999999991 -min -5242510.0 -radix s23 /tb_xfft_natural/s_axis_data_tdata_im
add wave -noupdate -format Analog-Step -height 74 -max 4054230000.0 -min -2643780000.0 -radix s23 /tb_xfft_natural/m_axis_data_tdata_re
add wave -noupdate -format Analog-Step -height 74 -max 12341700000.0 -min -8266890000.0 -radix s23 /tb_xfft_natural/m_axis_data_tdata_im
add wave -noupdate -format Analog-Step -height 74 -max 10028115.999999998 -min -10044892.0 -radix sfixed /tb_xfft_natural/re
add wave -noupdate -format Analog-Step -height 74 -max 10044873.0 -min -10032010.0 -radix sfixed /tb_xfft_natural/im
add wave -noupdate -format Analog-Step -height 74 -max 5875.0 -radix sfixed /tb_xfft_natural/complex_abs
add wave -noupdate /tb_xfft_natural/do_config
add wave -noupdate /tb_xfft_natural/cfg_fwd_inv
add wave -noupdate /tb_xfft_natural/op_sample
add wave -noupdate /tb_xfft_natural/op_sample_first
add wave -noupdate /tb_xfft_natural/ip_frame
add wave -noupdate /tb_xfft_natural/op_data
add wave -noupdate /tb_xfft_natural/op_frame
add wave -noupdate /tb_xfft_natural/CLOCK_PERIOD
add wave -noupdate /tb_xfft_natural/T_HOLD
add wave -noupdate /tb_xfft_natural/T_STROBE
add wave -noupdate /tb_xfft_natural/IP_WIDTH
add wave -noupdate /tb_xfft_natural/MAX_SAMPLES
add wave -noupdate /tb_xfft_natural/IP_TABLE_CLEAR
add wave -noupdate /tb_xfft_natural/IP_DATA
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {313566 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 284
configure wave -valuecolwidth 122
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
WaveRestoreZoom {0 ps} {1365 us}
