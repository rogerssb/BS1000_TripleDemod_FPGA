create_pblock pblock_TrellisProcess
add_cells_to_pblock [get_pblocks pblock_TrellisProcess] [get_cells -quiet [list stcDemod/Trellis_u]]
resize_pblock [get_pblocks pblock_TrellisProcess] -add {CLOCKREGION_X0Y0:CLOCKREGION_X1Y1}


