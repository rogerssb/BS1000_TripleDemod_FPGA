

connect_debug_port u_ila_0/probe8 [get_nets [list {stcDemod/Trellis_u/fa/depth[0]} {stcDemod/Trellis_u/fa/depth[1]} {stcDemod/Trellis_u/fa/depth[2]} {stcDemod/Trellis_u/fa/depth[3]} {stcDemod/Trellis_u/fa/depth[4]} {stcDemod/Trellis_u/fa/depth[5]} {stcDemod/Trellis_u/fa/depth[6]} {stcDemod/Trellis_u/fa/depth[7]} {stcDemod/Trellis_u/fa/depth[8]} {stcDemod/Trellis_u/fa/depth[9]} {stcDemod/Trellis_u/fa/depth[10]} {stcDemod/Trellis_u/fa/depth[11]} {stcDemod/Trellis_u/fa/depth[12]} {stcDemod/Trellis_u/fa/depth[13]} {stcDemod/Trellis_u/fa/depth[14]}]]
connect_debug_port u_ila_0/probe9 [get_nets [list {stcDemod/Trellis_u/fa/rdAddr[0]} {stcDemod/Trellis_u/fa/rdAddr[1]} {stcDemod/Trellis_u/fa/rdAddr[2]} {stcDemod/Trellis_u/fa/rdAddr[3]} {stcDemod/Trellis_u/fa/rdAddr[4]} {stcDemod/Trellis_u/fa/rdAddr[5]} {stcDemod/Trellis_u/fa/rdAddr[6]} {stcDemod/Trellis_u/fa/rdAddr[7]} {stcDemod/Trellis_u/fa/rdAddr[8]} {stcDemod/Trellis_u/fa/rdAddr[9]} {stcDemod/Trellis_u/fa/rdAddr[10]} {stcDemod/Trellis_u/fa/rdAddr[11]} {stcDemod/Trellis_u/fa/rdAddr[12]} {stcDemod/Trellis_u/fa/rdAddr[13]} {stcDemod/Trellis_u/fa/rdAddr[14]}]]
connect_debug_port u_ila_0/probe10 [get_nets [list {stcDemod/Trellis_u/fa/wrAddr[0]} {stcDemod/Trellis_u/fa/wrAddr[1]} {stcDemod/Trellis_u/fa/wrAddr[2]} {stcDemod/Trellis_u/fa/wrAddr[3]} {stcDemod/Trellis_u/fa/wrAddr[4]} {stcDemod/Trellis_u/fa/wrAddr[5]} {stcDemod/Trellis_u/fa/wrAddr[6]} {stcDemod/Trellis_u/fa/wrAddr[7]} {stcDemod/Trellis_u/fa/wrAddr[8]} {stcDemod/Trellis_u/fa/wrAddr[9]} {stcDemod/Trellis_u/fa/wrAddr[10]} {stcDemod/Trellis_u/fa/wrAddr[11]} {stcDemod/Trellis_u/fa/wrAddr[12]} {stcDemod/Trellis_u/fa/wrAddr[13]} {stcDemod/Trellis_u/fa/wrAddr[14]}]]

create_pblock pblock_Trellis_1u
add_cells_to_pblock [get_pblocks pblock_Trellis_1u] [get_cells -quiet [list stcDemod/Trellis_1u]]
resize_pblock [get_pblocks pblock_Trellis_1u] -add {CLOCKREGION_X0Y2:CLOCKREGION_X1Y3}

