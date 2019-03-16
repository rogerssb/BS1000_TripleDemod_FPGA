create_pblock pblock_turbod
add_cells_to_pblock [get_pblocks pblock_turbod] [get_cells -quiet [list turbo/turbod]]
resize_pblock [get_pblocks pblock_turbod] -add {CLOCKREGION_X0Y3:CLOCKREGION_X1Y6}
create_pblock pblock_1_Larry
add_cells_to_pblock [get_pblocks pblock_1_Larry] [get_cells -quiet [list bert bitsyncTop dec1 diffSync dualDecoder framer mse]]
resize_pblock [get_pblocks pblock_1_Larry] -add {CLOCKREGION_X0Y0:CLOCKREGION_X1Y1}
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets dac2_clk_OBUF]
