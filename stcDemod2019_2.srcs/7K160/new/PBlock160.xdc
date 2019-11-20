create_pblock pblock_td
add_cells_to_pblock [get_pblocks pblock_td] [get_cells -quiet [list stcDemod/Trellis_u]]
resize_pblock [get_pblocks pblock_td] -add {SLICE_X0Y0:SLICE_X109Y65}
resize_pblock [get_pblocks pblock_td] -add {DSP48_X0Y0:DSP48_X5Y25}
resize_pblock [get_pblocks pblock_td] -add {RAMB18_X0Y0:RAMB18_X6Y25}
resize_pblock [get_pblocks pblock_td] -add {RAMB36_X0Y0:RAMB36_X6Y12}



create_pblock pblock_Channel
add_cells_to_pblock [get_pblocks pblock_Channel] [get_cells -quiet [list stcDemod/Brik2_u/CE_u]]
resize_pblock [get_pblocks pblock_Channel] -add {SLICE_X0Y66:SLICE_X109Y95}
resize_pblock [get_pblocks pblock_Channel] -add {DSP48_X0Y28:DSP48_X5Y37}
resize_pblock [get_pblocks pblock_Channel] -add {RAMB18_X0Y28:RAMB18_X6Y37}
resize_pblock [get_pblocks pblock_Channel] -add {RAMB36_X0Y14:RAMB36_X6Y18}
create_pblock pblock_Pilot
add_cells_to_pblock [get_pblocks pblock_Pilot] [get_cells -quiet [list stcDemod/PD_u stcDemod/PS_u]]
resize_pblock [get_pblocks pblock_Pilot] -add {SLICE_X0Y163:SLICE_X101Y249}
resize_pblock [get_pblocks pblock_Pilot] -add {DSP48_X0Y66:DSP48_X5Y99}
resize_pblock [get_pblocks pblock_Pilot] -add {RAMB18_X0Y66:RAMB18_X5Y99}
resize_pblock [get_pblocks pblock_Pilot] -add {RAMB36_X0Y33:RAMB36_X5Y49}
create_pblock pblock_TE_u
add_cells_to_pblock [get_pblocks pblock_TE_u] [get_cells -quiet [list stcDemod/Brik2_u/RepeatI_u stcDemod/Brik2_u/RepeatR_u stcDemod/Brik2_u/TE_u]]
resize_pblock [get_pblocks pblock_TE_u] -add {SLICE_X0Y162:SLICE_X109Y96}
resize_pblock [get_pblocks pblock_TE_u] -add {DSP48_X0Y40:DSP48_X5Y63}
resize_pblock [get_pblocks pblock_TE_u] -add {RAMB18_X0Y63:RAMB18_X6Y40}
resize_pblock [get_pblocks pblock_TE_u] -add {RAMB36_X0Y31:RAMB36_X6Y20}

set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets clk2x]
