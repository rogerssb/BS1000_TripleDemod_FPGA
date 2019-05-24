create_pblock pblock_turbod
add_cells_to_pblock [get_pblocks pblock_turbod] [get_cells -quiet [list turbo/turbod]]
resize_pblock [get_pblocks pblock_turbod] -add {CLOCKREGION_X0Y3:CLOCKREGION_X1Y6}
create_pblock pblock_1_Larry
add_cells_to_pblock [get_pblocks pblock_1_Larry] [get_cells -quiet [list bert bitsyncTop dec1 diffSync dualDecoder framer mse]]
resize_pblock [get_pblocks pblock_1_Larry] -add {CLOCKREGION_X0Y0:CLOCKREGION_X1Y1}
