############################################################
## This file is generated automatically by Vivado HLS.
## Please DO NOT edit it.
## Copyright (C) 1986-2016 Xilinx, Inc. All Rights Reserved.
############################################################
set_directive_pipeline "calc_ma"
set_directive_array_partition -type complete -dim 1 "mcalcB" est
set_directive_unroll "mcalcB"
set_directive_pipeline "mcalcB"
set_directive_array_partition -type complete -dim 1 "mcalcB" sgn
set_directive_array_partition -type complete -dim 1 "HLSLdpcLogDecScaledMin" Lam_tabx
set_directive_array_partition -type complete -dim 1 "HLSLdpcLogDecScaledMin" Peta_tabx
set_directive_array_partition -type complete -dim 1 "HLSLdpcLogDecScaledMin" Eta_tabx
set_directive_array_partition -type complete -dim 1 "HLSLdpcLogDecScaledMin" Eta_ans
set_directive_array_partition -type complete -dim 1 "HLSLdpcLogDecScaledMin" Lam_taby
set_directive_array_partition -type complete -dim 1 "HLSLdpcLogDecScaledMin" Peta_taby
set_directive_array_partition -type complete -dim 1 "HLSLdpcLogDecScaledMin" Eta_taby
set_directive_array_partition -type complete -dim 1 "HLSLdpcLogDecScaledMin" Eta_ans_1
set_directive_array_partition -type complete -dim 1 "mcalcC" est
set_directive_array_reshape -type complete -dim 1 "mcalcC" sgn
set_directive_unroll "mcalcC"
set_directive_pipeline "mcalcC"
set_directive_pipeline "mcalcAA"
set_directive_unroll "mcalcAB"
set_directive_pipeline "mcalcAB"
set_directive_unroll "mcalcA"
set_directive_pipeline "mcalcA"
set_directive_unroll "mcalcD"
set_directive_pipeline "mcalcD"
set_directive_array_partition -type complete -dim 1 "mcalcD" est
set_directive_array_partition -type complete -dim 1 "mcalcD" sgn
set_directive_array_partition -type complete -dim 1 "HLSLdpcLogDecScaledMin" Lam_tabz
set_directive_array_partition -type complete -dim 1 "HLSLdpcLogDecScaledMin" Peta_tabz
set_directive_array_partition -type complete -dim 1 "HLSLdpcLogDecScaledMin" Eta_tabz
set_directive_array_partition -type complete -dim 1 "HLSLdpcLogDecScaledMin" Eta_ans_2
set_directive_array_partition -type complete -dim 1 "HLSLdpcLogDecScaledMin" Lam_tabe
set_directive_array_partition -type complete -dim 1 "HLSLdpcLogDecScaledMin" Peta_tabe
set_directive_array_partition -type complete -dim 1 "HLSLdpcLogDecScaledMin" Eta_tabe
set_directive_array_partition -type complete -dim 1 "HLSLdpcLogDecScaledMin" Eta_ans_3
set_directive_unroll "mcalcAC"
set_directive_pipeline "mcalcAC"
set_directive_unroll "mcalcAE"
set_directive_pipeline "mcalcAE"
set_directive_unroll "mcalcE"
set_directive_pipeline "mcalcE"
set_directive_array_partition -type complete -dim 1 "HLSLdpcLogDecScaledMin" Lam_tabg
set_directive_array_partition -type complete -dim 1 "HLSLdpcLogDecScaledMin" Lam_tabf
set_directive_array_partition -type complete -dim 1 "HLSLdpcLogDecScaledMin" Peta_tabf
set_directive_array_partition -type complete -dim 1 "HLSLdpcLogDecScaledMin" Eta_tabf
set_directive_array_partition -type complete -dim 1 "HLSLdpcLogDecScaledMin" Eta_ans_4
set_directive_array_partition -type complete -dim 1 "HLSLdpcLogDecScaledMin" Lam_tabg
set_directive_array_partition -type complete -dim 1 "HLSLdpcLogDecScaledMin" Peta_tabg
set_directive_array_partition -type complete -dim 1 "HLSLdpcLogDecScaledMin" Eta_tabg
set_directive_array_partition -type complete -dim 1 "HLSLdpcLogDecScaledMin" Eta_ans_5
set_directive_array_partition -type complete -dim 1 "HLSLdpcLogDecScaledMin" Lam_tabh
set_directive_array_partition -type complete -dim 1 "HLSLdpcLogDecScaledMin" Peta_tabh
set_directive_array_partition -type complete -dim 1 "HLSLdpcLogDecScaledMin" Eta_tabh
set_directive_array_partition -type complete -dim 1 "HLSLdpcLogDecScaledMin" Eta_ans_6
set_directive_unroll "mcalcAF"
set_directive_pipeline "mcalcAF"
set_directive_unroll "mcalcAG"
set_directive_pipeline "mcalcAG"
set_directive_unroll "mcalcAH"
set_directive_pipeline "mcalcAH"
set_directive_unroll "mcalcF"
set_directive_pipeline "mcalcF"
set_directive_unroll "mcalcG"
set_directive_pipeline "mcalcG"
set_directive_unroll "mcalcH"
set_directive_pipeline "mcalcH"
set_directive_array_partition -type complete -dim 1 "HLSLdpcLogDecScaledMin" Lam_tabi
set_directive_array_partition -type complete -dim 1 "HLSLdpcLogDecScaledMin" Peta_tabi
set_directive_array_partition -type complete -dim 1 "HLSLdpcLogDecScaledMin" Eta_tabi
set_directive_array_partition -type complete -dim 1 "HLSLdpcLogDecScaledMin" Eta_ans_7
set_directive_array_partition -type complete -dim 1 "HLSLdpcLogDecScaledMin" Lam_tabj
set_directive_array_partition -type complete -dim 1 "HLSLdpcLogDecScaledMin" Peta_tabj
set_directive_array_partition -type complete -dim 1 "HLSLdpcLogDecScaledMin" Eta_tabj
set_directive_array_partition -type complete -dim 1 "HLSLdpcLogDecScaledMin" Eta_ans_8
set_directive_unroll "mcalcAI"
set_directive_pipeline "mcalcAI"
set_directive_unroll "mcalcAJ"
set_directive_pipeline "mcalcAJ"
set_directive_array_partition -type complete -dim 1 "HLSLdpcLogDecScaledMin" Lam_tabk
set_directive_array_partition -type complete -dim 1 "HLSLdpcLogDecScaledMin" Peta_tabk
set_directive_array_partition -type complete -dim 1 "HLSLdpcLogDecScaledMin" Eta_tabk
set_directive_array_partition -type complete -dim 1 "HLSLdpcLogDecScaledMin" Eta_ans_9
set_directive_array_partition -type complete -dim 1 "HLSLdpcLogDecScaledMin" Lam_tabl
set_directive_array_partition -type complete -dim 1 "HLSLdpcLogDecScaledMin" Peta_tabl
set_directive_array_partition -type complete -dim 1 "HLSLdpcLogDecScaledMin" Peta_tabl
set_directive_array_partition -type complete -dim 1 "HLSLdpcLogDecScaledMin" Eta_tabl
set_directive_array_partition -type complete -dim 1 "HLSLdpcLogDecScaledMin" Eta_ans_10
set_directive_array_partition -type complete -dim 1 "HLSLdpcLogDecScaledMin" Lam_tabm
set_directive_array_partition -type complete -dim 1 "HLSLdpcLogDecScaledMin" Peta_tabm
set_directive_array_partition -type complete -dim 1 "HLSLdpcLogDecScaledMin" Eta_tabm
set_directive_array_partition -type complete -dim 1 "HLSLdpcLogDecScaledMin" Eta_ans_11
set_directive_unroll "mcalcAK"
set_directive_pipeline "mcalcAK"
set_directive_unroll "mcalcAL"
set_directive_pipeline "mcalcAL"
set_directive_unroll "mcalcAM"
set_directive_pipeline "mcalcAM"
set_directive_unroll "mcalcI"
set_directive_pipeline "mcalcI"
set_directive_unroll "mcalcJ"
set_directive_pipeline "mcalcJ"
set_directive_unroll "mcalcK"
set_directive_pipeline "mcalcK"
set_directive_unroll "mcalcL"
set_directive_pipeline "mcalcL"
set_directive_unroll "mcalcM"
set_directive_pipeline "mcalcM"
set_directive_array_partition -type complete -dim 1 "HLSLdpcLogDecScaledMin" Peta_tabn
set_directive_array_partition -type complete -dim 1 "HLSLdpcLogDecScaledMin" Eta_tabn
set_directive_array_partition -type complete -dim 1 "HLSLdpcLogDecScaledMin" Eta_ans_12
set_directive_array_partition -type complete -dim 1 "HLSLdpcLogDecScaledMin" Lam_tabo
set_directive_array_partition -type complete -dim 1 "HLSLdpcLogDecScaledMin" Peta_tabo
set_directive_array_partition -type complete -dim 1 "HLSLdpcLogDecScaledMin" Eta_tabo
set_directive_array_partition -type complete -dim 1 "HLSLdpcLogDecScaledMin" Eta_ans_13
set_directive_array_partition -type complete -dim 1 "HLSLdpcLogDecScaledMin" Lam_tabp
set_directive_array_partition -type complete -dim 1 "HLSLdpcLogDecScaledMin" Peta_tabp
set_directive_array_partition -type complete -dim 1 "HLSLdpcLogDecScaledMin" Eta_tabp
set_directive_array_partition -type complete -dim 1 "HLSLdpcLogDecScaledMin" Eta_ans_14
set_directive_array_partition -type complete -dim 1 "HLSLdpcLogDecScaledMin" Peta_tabq
set_directive_array_partition -type complete -dim 1 "HLSLdpcLogDecScaledMin" Eta_tabq
set_directive_array_partition -type complete -dim 1 "HLSLdpcLogDecScaledMin" Eta_ans_15
set_directive_array_partition -type complete -dim 1 "HLSLdpcLogDecScaledMin" Lam_tabn
set_directive_array_partition -type complete -dim 1 "HLSLdpcLogDecScaledMin" Lam_tabq
set_directive_unroll "mcalcAN"
set_directive_pipeline "mcalcAN"
set_directive_unroll "mcalcAO"
set_directive_pipeline "mcalcAO"
set_directive_unroll "mcalcAP"
set_directive_pipeline "mcalcAP"
set_directive_unroll "mcalcAQ"
set_directive_pipeline "mcalcAQ"
set_directive_unroll "mcalcN"
set_directive_pipeline "mcalcN"
set_directive_unroll "mcalcO"
set_directive_pipeline "mcalcO"
set_directive_unroll "mcalcP"
set_directive_pipeline "mcalcP"
set_directive_unroll "mcalcQ"
set_directive_pipeline "mcalcQ"
set_directive_pipeline "calc_n"
set_directive_pipeline "test_ram"
set_directive_pipeline "calc_n_1"
set_directive_unroll "calc_n_1"
set_directive_resource -core RAM_T2P_BRAM "HLSLdpcLogDecScaledMin" prLam_buf
set_directive_resource -core RAM_T2P_BRAM "HLSLdpcLogDecScaledMin" prLam_buf1
set_directive_resource -core RAM_T2P_BRAM "HLSLdpcLogDecScaledMin" prLam_buf2
set_directive_resource -core RAM_T2P_BRAM "HLSLdpcLogDecScaledMin" prLam_buf3
set_directive_resource -core RAM_T2P_BRAM "HLSLdpcLogDecScaledMin" prLam_buf4
set_directive_resource -core RAM_T2P_BRAM "HLSLdpcLogDecScaledMin" prLam_buf5
set_directive_resource -core RAM_T2P_BRAM "HLSLdpcLogDecScaledMin" prLam_buf6
set_directive_resource -core RAM_T2P_BRAM "HLSLdpcLogDecScaledMin" prLam_buf7
set_directive_resource -core RAM_T2P_BRAM "HLSLdpcLogDecScaledMin" prLam_buf8
set_directive_resource -core RAM_T2P_BRAM "HLSLdpcLogDecScaledMin" prLam_buf9
set_directive_resource -core RAM_T2P_BRAM "HLSLdpcLogDecScaledMin" prLam_buf10
set_directive_pipeline "write_result"
set_directive_pipeline "chk_parity_all"
set_directive_pipeline "write_result_23"
set_directive_pipeline "mcalcAA_23"
set_directive_pipeline "write_result_12"
set_directive_array_partition -type complete -dim 1 "HLSLdpcLogDecScaledMin" inxtab
set_directive_resource -core RAM_S2P_LUTRAM "HLSLdpcLogDecScaledMin" prHat_buf6
set_directive_resource -core RAM_S2P_LUTRAM "HLSLdpcLogDecScaledMin" prHat_buf
set_directive_resource -core RAM_S2P_LUTRAM "HLSLdpcLogDecScaledMin" prHat_buf1
set_directive_resource -core RAM_S2P_LUTRAM "HLSLdpcLogDecScaledMin" prHat_buf2
set_directive_resource -core RAM_S2P_LUTRAM "HLSLdpcLogDecScaledMin" prHat_buf3
set_directive_resource -core RAM_S2P_LUTRAM "HLSLdpcLogDecScaledMin" prHat_buf4
set_directive_resource -core RAM_S2P_LUTRAM "HLSLdpcLogDecScaledMin" prHat_buf8
set_directive_resource -core RAM_S2P_LUTRAM "HLSLdpcLogDecScaledMin" prHat_buf10
set_directive_resource -core RAM_S2P_LUTRAM "HLSLdpcLogDecScaledMin" prHat_bufA
set_directive_resource -core RAM_S2P_LUTRAM "HLSLdpcLogDecScaledMin" prHat_bufA1
set_directive_resource -core RAM_S2P_LUTRAM "HLSLdpcLogDecScaledMin" prHat_bufA2
set_directive_resource -core RAM_S2P_LUTRAM "HLSLdpcLogDecScaledMin" prHat_bufA3
set_directive_resource -core RAM_S2P_LUTRAM "HLSLdpcLogDecScaledMin" prHat_bufA4
set_directive_resource -core RAM_S2P_LUTRAM "HLSLdpcLogDecScaledMin" prHat_bufA5
set_directive_resource -core RAM_S2P_LUTRAM "HLSLdpcLogDecScaledMin" prHat_bufA6
set_directive_resource -core RAM_S2P_LUTRAM "HLSLdpcLogDecScaledMin" prHat_bufA7
set_directive_resource -core RAM_S2P_LUTRAM "HLSLdpcLogDecScaledMin" prHat_bufA9
set_directive_resource -core RAM_S2P_LUTRAM "HLSLdpcLogDecScaledMin" prHat_bufA10
set_directive_resource -core RAM_S2P_LUTRAM "HLSLdpcLogDecScaledMin" prHat_bufB
set_directive_resource -core RAM_S2P_LUTRAM "HLSLdpcLogDecScaledMin" prHat_bufB1
set_directive_resource -core RAM_S2P_LUTRAM "HLSLdpcLogDecScaledMin" prHat_bufB2
set_directive_resource -core RAM_S2P_LUTRAM "HLSLdpcLogDecScaledMin" prHat_bufB3
set_directive_resource -core RAM_S2P_LUTRAM "HLSLdpcLogDecScaledMin" prHat_bufB4
set_directive_resource -core RAM_S2P_LUTRAM "HLSLdpcLogDecScaledMin" prHat_bufB5
set_directive_resource -core RAM_S2P_LUTRAM "HLSLdpcLogDecScaledMin" prHat_bufB6
set_directive_resource -core RAM_S2P_LUTRAM "HLSLdpcLogDecScaledMin" prHat_bufB7
set_directive_resource -core RAM_S2P_LUTRAM "HLSLdpcLogDecScaledMin" prHat_bufB9
set_directive_resource -core RAM_S2P_LUTRAM "HLSLdpcLogDecScaledMin" prHat_bufB10
set_directive_resource -core RAM_S2P_LUTRAM "HLSLdpcLogDecScaledMin" prHat_buf4a
set_directive_resource -core RAM_S2P_LUTRAM "HLSLdpcLogDecScaledMin" prHat_bufAa
set_directive_resource -core RAM_S2P_LUTRAM "HLSLdpcLogDecScaledMin" prHat_bufA4a
set_directive_resource -core RAM_S2P_LUTRAM "HLSLdpcLogDecScaledMin" prHat_bufB1a
set_directive_resource -core RAM_S2P_LUTRAM "HLSLdpcLogDecScaledMin" prHat_bufB5a
set_directive_resource -core RAM_S2P_LUTRAM "HLSLdpcLogDecScaledMin" prHat_bufA2a
set_directive_resource -core RAM_S2P_LUTRAM "HLSLdpcLogDecScaledMin" prHat_bufA10a
set_directive_resource -core RAM_S2P_LUTRAM "HLSLdpcLogDecScaledMin" prHat_bufA6a
set_directive_resource -core RAM_S2P_LUTRAM "HLSLdpcLogDecScaledMin" prHat_bufB3a
set_directive_resource -core RAM_S2P_LUTRAM "HLSLdpcLogDecScaledMin" prHat_buf10a
set_directive_resource -core RAM_S2P_LUTRAM "HLSLdpcLogDecScaledMin" prHat_bufB7a
set_directive_resource -core RAM_S2P_LUTRAM "HLSLdpcLogDecScaledMin" prHat_bufB9a
set_directive_resource -core RAM_S2P_LUTRAM "HLSLdpcLogDecScaledMin" prHat_buf6a
set_directive_resource -core RAM_S2P_LUTRAM "HLSLdpcLogDecScaledMin" prHat_bufA4b
set_directive_pipeline "mcalcAA_12"
set_directive_resource -core RAM_S2P_LUTRAM "HLSLdpcLogDecScaledMin" prHat_buf10b
set_directive_resource -core RAM_S2P_LUTRAM "HLSLdpcLogDecScaledMin" prHat_bufB1b
set_directive_resource -core RAM_S2P_LUTRAM "HLSLdpcLogDecScaledMin" prHat_bufB1c
set_directive_resource -core RAM_S2P_LUTRAM "HLSLdpcLogDecScaledMin" prHat_bufB5b
set_directive_resource -core RAM_S2P_LUTRAM "HLSLdpcLogDecScaledMin" prHat_bufB5c
set_directive_resource -core RAM_S2P_LUTRAM "HLSLdpcLogDecScaledMin" prHat_bufA10b
set_directive_resource -core RAM_S2P_LUTRAM "HLSLdpcLogDecScaledMin" prHat_bufA10c
set_directive_resource -core RAM_S2P_LUTRAM "HLSLdpcLogDecScaledMin" prHat_bufAb
set_directive_resource -core RAM_S2P_LUTRAM "HLSLdpcLogDecScaledMin" prHat_bufAc
set_directive_resource -core RAM_S2P_LUTRAM "HLSLdpcLogDecScaledMin" prHat_bufB3b
set_directive_resource -core RAM_S2P_LUTRAM "HLSLdpcLogDecScaledMin" prHat_bufB3c
set_directive_resource -core RAM_S2P_LUTRAM "HLSLdpcLogDecScaledMin" prHat_bufA2b
set_directive_resource -core RAM_S2P_LUTRAM "HLSLdpcLogDecScaledMin" prHat_bufA2c
set_directive_resource -core RAM_S2P_LUTRAM "HLSLdpcLogDecScaledMin" prHat_bufA6b
set_directive_resource -core RAM_S2P_LUTRAM "HLSLdpcLogDecScaledMin" prHat_bufA6c
