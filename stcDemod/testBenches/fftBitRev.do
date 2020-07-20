onerror {resume}
radix define s24 -fixed -fraction 24 -signed -precision 6
radix define s23 -fixed -fraction 23 -signed -precision 6
radix define FLoat16 -fixed -fraction 27 -signed -base signed -precision 6
radix define s17 -fixed -fraction 17 -signed -base signed -precision 6
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_xfft_0/aclk
add wave -noupdate /tb_xfft_0/aresetn
add wave -noupdate /tb_xfft_0/aclken
add wave -noupdate /tb_xfft_0/s_axis_config_tvalid
add wave -noupdate /tb_xfft_0/s_axis_config_tready
add wave -noupdate /tb_xfft_0/s_axis_config_tdata
add wave -noupdate /tb_xfft_0/s_axis_data_tvalid
add wave -noupdate /tb_xfft_0/s_axis_data_tready
add wave -noupdate -radix s23 /tb_xfft_0/s_axis_data_tdata
add wave -noupdate /tb_xfft_0/s_axis_data_tlast
add wave -noupdate /tb_xfft_0/m_axis_data_tvalid
add wave -noupdate /tb_xfft_0/m_axis_data_tdata
add wave -noupdate /tb_xfft_0/m_axis_data_tlast
add wave -noupdate /tb_xfft_0/event_frame_started
add wave -noupdate /tb_xfft_0/event_tlast_unexpected
add wave -noupdate /tb_xfft_0/event_tlast_missing
add wave -noupdate /tb_xfft_0/event_data_in_channel_halt
add wave -noupdate /tb_xfft_0/s_axis_config_tdata_fwd_inv
add wave -noupdate -format Analog-Step -height 74 -max 12427.99999999982 -min -1817730.0 -radix s23 -childformat {{/tb_xfft_0/s_axis_data_tdata_re(23) -radix s23} {/tb_xfft_0/s_axis_data_tdata_re(22) -radix s23} {/tb_xfft_0/s_axis_data_tdata_re(21) -radix s23} {/tb_xfft_0/s_axis_data_tdata_re(20) -radix s23} {/tb_xfft_0/s_axis_data_tdata_re(19) -radix s23} {/tb_xfft_0/s_axis_data_tdata_re(18) -radix s23} {/tb_xfft_0/s_axis_data_tdata_re(17) -radix s23} {/tb_xfft_0/s_axis_data_tdata_re(16) -radix s23} {/tb_xfft_0/s_axis_data_tdata_re(15) -radix s23} {/tb_xfft_0/s_axis_data_tdata_re(14) -radix s23} {/tb_xfft_0/s_axis_data_tdata_re(13) -radix s23} {/tb_xfft_0/s_axis_data_tdata_re(12) -radix s23} {/tb_xfft_0/s_axis_data_tdata_re(11) -radix s23} {/tb_xfft_0/s_axis_data_tdata_re(10) -radix s23} {/tb_xfft_0/s_axis_data_tdata_re(9) -radix s23} {/tb_xfft_0/s_axis_data_tdata_re(8) -radix s23} {/tb_xfft_0/s_axis_data_tdata_re(7) -radix s23} {/tb_xfft_0/s_axis_data_tdata_re(6) -radix s23} {/tb_xfft_0/s_axis_data_tdata_re(5) -radix s23} {/tb_xfft_0/s_axis_data_tdata_re(4) -radix s23} {/tb_xfft_0/s_axis_data_tdata_re(3) -radix s23} {/tb_xfft_0/s_axis_data_tdata_re(2) -radix s23} {/tb_xfft_0/s_axis_data_tdata_re(1) -radix s23} {/tb_xfft_0/s_axis_data_tdata_re(0) -radix s23}} -subitemconfig {/tb_xfft_0/s_axis_data_tdata_re(23) {-height 15 -radix s23} /tb_xfft_0/s_axis_data_tdata_re(22) {-height 15 -radix s23} /tb_xfft_0/s_axis_data_tdata_re(21) {-height 15 -radix s23} /tb_xfft_0/s_axis_data_tdata_re(20) {-height 15 -radix s23} /tb_xfft_0/s_axis_data_tdata_re(19) {-height 15 -radix s23} /tb_xfft_0/s_axis_data_tdata_re(18) {-height 15 -radix s23} /tb_xfft_0/s_axis_data_tdata_re(17) {-height 15 -radix s23} /tb_xfft_0/s_axis_data_tdata_re(16) {-height 15 -radix s23} /tb_xfft_0/s_axis_data_tdata_re(15) {-height 15 -radix s23} /tb_xfft_0/s_axis_data_tdata_re(14) {-height 15 -radix s23} /tb_xfft_0/s_axis_data_tdata_re(13) {-height 15 -radix s23} /tb_xfft_0/s_axis_data_tdata_re(12) {-height 15 -radix s23} /tb_xfft_0/s_axis_data_tdata_re(11) {-height 15 -radix s23} /tb_xfft_0/s_axis_data_tdata_re(10) {-height 15 -radix s23} /tb_xfft_0/s_axis_data_tdata_re(9) {-height 15 -radix s23} /tb_xfft_0/s_axis_data_tdata_re(8) {-height 15 -radix s23} /tb_xfft_0/s_axis_data_tdata_re(7) {-height 15 -radix s23} /tb_xfft_0/s_axis_data_tdata_re(6) {-height 15 -radix s23} /tb_xfft_0/s_axis_data_tdata_re(5) {-height 15 -radix s23} /tb_xfft_0/s_axis_data_tdata_re(4) {-height 15 -radix s23} /tb_xfft_0/s_axis_data_tdata_re(3) {-height 15 -radix s23} /tb_xfft_0/s_axis_data_tdata_re(2) {-height 15 -radix s23} /tb_xfft_0/s_axis_data_tdata_re(1) {-height 15 -radix s23} /tb_xfft_0/s_axis_data_tdata_re(0) {-height 15 -radix s23}} /tb_xfft_0/s_axis_data_tdata_re
add wave -noupdate -format Analog-Step -height 74 -max 9399.0000000004366 -min -4203000.0 -radix s23 -childformat {{/tb_xfft_0/s_axis_data_tdata_im(23) -radix s23} {/tb_xfft_0/s_axis_data_tdata_im(22) -radix s23} {/tb_xfft_0/s_axis_data_tdata_im(21) -radix s23} {/tb_xfft_0/s_axis_data_tdata_im(20) -radix s23} {/tb_xfft_0/s_axis_data_tdata_im(19) -radix s23} {/tb_xfft_0/s_axis_data_tdata_im(18) -radix s23} {/tb_xfft_0/s_axis_data_tdata_im(17) -radix s23} {/tb_xfft_0/s_axis_data_tdata_im(16) -radix s23} {/tb_xfft_0/s_axis_data_tdata_im(15) -radix s23} {/tb_xfft_0/s_axis_data_tdata_im(14) -radix s23} {/tb_xfft_0/s_axis_data_tdata_im(13) -radix s23} {/tb_xfft_0/s_axis_data_tdata_im(12) -radix s23} {/tb_xfft_0/s_axis_data_tdata_im(11) -radix s23} {/tb_xfft_0/s_axis_data_tdata_im(10) -radix s23} {/tb_xfft_0/s_axis_data_tdata_im(9) -radix s23} {/tb_xfft_0/s_axis_data_tdata_im(8) -radix s23} {/tb_xfft_0/s_axis_data_tdata_im(7) -radix s23} {/tb_xfft_0/s_axis_data_tdata_im(6) -radix s23} {/tb_xfft_0/s_axis_data_tdata_im(5) -radix s23} {/tb_xfft_0/s_axis_data_tdata_im(4) -radix s23} {/tb_xfft_0/s_axis_data_tdata_im(3) -radix s23} {/tb_xfft_0/s_axis_data_tdata_im(2) -radix s23} {/tb_xfft_0/s_axis_data_tdata_im(1) -radix s23} {/tb_xfft_0/s_axis_data_tdata_im(0) -radix s23}} -subitemconfig {/tb_xfft_0/s_axis_data_tdata_im(23) {-height 15 -radix s23} /tb_xfft_0/s_axis_data_tdata_im(22) {-height 15 -radix s23} /tb_xfft_0/s_axis_data_tdata_im(21) {-height 15 -radix s23} /tb_xfft_0/s_axis_data_tdata_im(20) {-height 15 -radix s23} /tb_xfft_0/s_axis_data_tdata_im(19) {-height 15 -radix s23} /tb_xfft_0/s_axis_data_tdata_im(18) {-height 15 -radix s23} /tb_xfft_0/s_axis_data_tdata_im(17) {-height 15 -radix s23} /tb_xfft_0/s_axis_data_tdata_im(16) {-height 15 -radix s23} /tb_xfft_0/s_axis_data_tdata_im(15) {-height 15 -radix s23} /tb_xfft_0/s_axis_data_tdata_im(14) {-height 15 -radix s23} /tb_xfft_0/s_axis_data_tdata_im(13) {-height 15 -radix s23} /tb_xfft_0/s_axis_data_tdata_im(12) {-height 15 -radix s23} /tb_xfft_0/s_axis_data_tdata_im(11) {-height 15 -radix s23} /tb_xfft_0/s_axis_data_tdata_im(10) {-height 15 -radix s23} /tb_xfft_0/s_axis_data_tdata_im(9) {-height 15 -radix s23} /tb_xfft_0/s_axis_data_tdata_im(8) {-height 15 -radix s23} /tb_xfft_0/s_axis_data_tdata_im(7) {-height 15 -radix s23} /tb_xfft_0/s_axis_data_tdata_im(6) {-height 15 -radix s23} /tb_xfft_0/s_axis_data_tdata_im(5) {-height 15 -radix s23} /tb_xfft_0/s_axis_data_tdata_im(4) {-height 15 -radix s23} /tb_xfft_0/s_axis_data_tdata_im(3) {-height 15 -radix s23} /tb_xfft_0/s_axis_data_tdata_im(2) {-height 15 -radix s23} /tb_xfft_0/s_axis_data_tdata_im(1) {-height 15 -radix s23} /tb_xfft_0/s_axis_data_tdata_im(0) {-height 15 -radix s23}} /tb_xfft_0/s_axis_data_tdata_im
add wave -noupdate -format Analog-Step -height 74 -max 101814000.0 -min -112112000.0 -radix decimal /tb_xfft_0/m_axis_data_tdata_re
add wave -noupdate -format Analog-Step -height 74 -max 76997000.000000015 -min -118969000.0 -radix decimal /tb_xfft_0/m_axis_data_tdata_im
add wave -noupdate -format Analog-Step -height 74 -max 101814000.0 -min -112112000.0 -radix sfixed /tb_xfft_0/re
add wave -noupdate -format Analog-Step -height 74 -max 76997000.000000015 -min -118969000.0 -radix sfixed /tb_xfft_0/im
add wave -noupdate -format Analog-Step -height 74 -max 3467180.0 -radix sfixed /tb_xfft_0/complex_abs
add wave -noupdate -radix sfixed /tb_xfft_0/MaxValue
add wave -noupdate /tb_xfft_0/MaxIndex
add wave -noupdate -format Analog-Step -height 74 -max 3467180.0 -radix sfixed /tb_xfft_0/RvrsDisp
add wave -noupdate /tb_xfft_0/RevIndex
add wave -noupdate /tb_xfft_0/BitRvrs
add wave -noupdate /tb_xfft_0/Index
add wave -noupdate /tb_xfft_0/do_config
add wave -noupdate /tb_xfft_0/cfg_fwd_inv
add wave -noupdate -radix hexadecimal /tb_xfft_0/op_sample
add wave -noupdate /tb_xfft_0/op_sample_first
add wave -noupdate /tb_xfft_0/ip_frame
add wave -noupdate /tb_xfft_0/op_frame
add wave -noupdate /tb_xfft_0/CLOCK_PERIOD
add wave -noupdate /tb_xfft_0/T_HOLD
add wave -noupdate /tb_xfft_0/T_STROBE
add wave -noupdate /tb_xfft_0/IP_WIDTH
add wave -noupdate /tb_xfft_0/MAX_SAMPLES
add wave -noupdate /tb_xfft_0/IP_TABLE_CLEAR
add wave -noupdate /tb_xfft_0/IP_DATA
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {682231 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 259
configure wave -valuecolwidth 119
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
WaveRestoreZoom {0 ps} {2604390 ps}
