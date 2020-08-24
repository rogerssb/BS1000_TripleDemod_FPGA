create_pblock pblock_Trellis_u
add_cells_to_pblock [get_pblocks pblock_Trellis_u] [get_cells -quiet [list stcDemod/Trellis_0u]]
resize_pblock [get_pblocks pblock_Trellis_u] -add {CLOCKREGION_X0Y0:CLOCKREGION_X1Y1}
add_cells_to_pblock [get_pblocks pblock_Trellis_u] [get_cells -quiet [list stcDemod/Trellis_u]]












