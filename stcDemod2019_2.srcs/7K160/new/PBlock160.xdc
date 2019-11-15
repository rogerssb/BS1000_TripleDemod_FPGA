create_pblock pblock_td
add_cells_to_pblock [get_pblocks pblock_td] [get_cells -quiet [list stcDemod/Trellis_u/td]]
resize_pblock [get_pblocks pblock_td] -add {SLICE_X0Y0:SLICE_X109Y75}
resize_pblock [get_pblocks pblock_td] -add {RAMB18_X0Y0:RAMB18_X6Y29}
resize_pblock [get_pblocks pblock_td] -add {RAMB36_X0Y0:RAMB36_X6Y14}

