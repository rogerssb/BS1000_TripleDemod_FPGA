# This script segment is generated automatically by AutoPilot

# clear list
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_begin
    cg_default_interface_gen_bundle_begin
    AESL_LIB_XILADAPTER::native_axis_begin
}

# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 980 \
    name Lam_buf4 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename Lam_buf4 \
    op interface \
    ports { Lam_buf4_address0 { O 10 vector } Lam_buf4_ce0 { O 1 bit } Lam_buf4_q0 { I 16 vector } Lam_buf4_address1 { O 10 vector } Lam_buf4_ce1 { O 1 bit } Lam_buf4_q1 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'Lam_buf4'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 981 \
    name Lam_buf6 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename Lam_buf6 \
    op interface \
    ports { Lam_buf6_address0 { O 10 vector } Lam_buf6_ce0 { O 1 bit } Lam_buf6_q0 { I 16 vector } Lam_buf6_address1 { O 10 vector } Lam_buf6_ce1 { O 1 bit } Lam_buf6_q1 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'Lam_buf6'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 982 \
    name Lam_buf6a \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename Lam_buf6a \
    op interface \
    ports { Lam_buf6a_address0 { O 10 vector } Lam_buf6a_ce0 { O 1 bit } Lam_buf6a_q0 { I 16 vector } Lam_buf6a_address1 { O 10 vector } Lam_buf6a_ce1 { O 1 bit } Lam_buf6a_q1 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'Lam_buf6a'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 983 \
    name SpEtaPrev \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename SpEtaPrev \
    op interface \
    ports { SpEtaPrev_address0 { O 11 vector } SpEtaPrev_ce0 { O 1 bit } SpEtaPrev_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'SpEtaPrev'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 984 \
    name SpEtaPrevC \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename SpEtaPrevC \
    op interface \
    ports { SpEtaPrevC_address0 { O 11 vector } SpEtaPrevC_ce0 { O 1 bit } SpEtaPrevC_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'SpEtaPrevC'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 985 \
    name Lam_bufAa \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename Lam_bufAa \
    op interface \
    ports { Lam_bufAa_address0 { O 10 vector } Lam_bufAa_ce0 { O 1 bit } Lam_bufAa_q0 { I 16 vector } Lam_bufAa_address1 { O 10 vector } Lam_bufAa_ce1 { O 1 bit } Lam_bufAa_q1 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'Lam_bufAa'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 986 \
    name Lam_bufAb \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename Lam_bufAb \
    op interface \
    ports { Lam_bufAb_address0 { O 10 vector } Lam_bufAb_ce0 { O 1 bit } Lam_bufAb_q0 { I 16 vector } Lam_bufAb_address1 { O 10 vector } Lam_bufAb_ce1 { O 1 bit } Lam_bufAb_q1 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'Lam_bufAb'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 987 \
    name Lam_bufAc \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename Lam_bufAc \
    op interface \
    ports { Lam_bufAc_address0 { O 10 vector } Lam_bufAc_ce0 { O 1 bit } Lam_bufAc_q0 { I 16 vector } Lam_bufAc_address1 { O 10 vector } Lam_bufAc_ce1 { O 1 bit } Lam_bufAc_q1 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'Lam_bufAc'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 988 \
    name Lam_bufA1 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename Lam_bufA1 \
    op interface \
    ports { Lam_bufA1_address0 { O 10 vector } Lam_bufA1_ce0 { O 1 bit } Lam_bufA1_q0 { I 16 vector } Lam_bufA1_address1 { O 10 vector } Lam_bufA1_ce1 { O 1 bit } Lam_bufA1_q1 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'Lam_bufA1'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 989 \
    name Lam_bufA2a \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename Lam_bufA2a \
    op interface \
    ports { Lam_bufA2a_address0 { O 10 vector } Lam_bufA2a_ce0 { O 1 bit } Lam_bufA2a_q0 { I 16 vector } Lam_bufA2a_address1 { O 10 vector } Lam_bufA2a_ce1 { O 1 bit } Lam_bufA2a_q1 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'Lam_bufA2a'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 990 \
    name Lam_bufA3 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename Lam_bufA3 \
    op interface \
    ports { Lam_bufA3_address0 { O 10 vector } Lam_bufA3_ce0 { O 1 bit } Lam_bufA3_q0 { I 16 vector } Lam_bufA3_address1 { O 10 vector } Lam_bufA3_ce1 { O 1 bit } Lam_bufA3_q1 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'Lam_bufA3'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 991 \
    name Lam_bufA5 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename Lam_bufA5 \
    op interface \
    ports { Lam_bufA5_address0 { O 10 vector } Lam_bufA5_ce0 { O 1 bit } Lam_bufA5_q0 { I 16 vector } Lam_bufA5_address1 { O 10 vector } Lam_bufA5_ce1 { O 1 bit } Lam_bufA5_q1 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'Lam_bufA5'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 992 \
    name Lam_bufA6b \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename Lam_bufA6b \
    op interface \
    ports { Lam_bufA6b_address0 { O 10 vector } Lam_bufA6b_ce0 { O 1 bit } Lam_bufA6b_q0 { I 16 vector } Lam_bufA6b_address1 { O 10 vector } Lam_bufA6b_ce1 { O 1 bit } Lam_bufA6b_q1 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'Lam_bufA6b'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 993 \
    name Lam_bufA6c \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename Lam_bufA6c \
    op interface \
    ports { Lam_bufA6c_address0 { O 10 vector } Lam_bufA6c_ce0 { O 1 bit } Lam_bufA6c_q0 { I 16 vector } Lam_bufA6c_address1 { O 10 vector } Lam_bufA6c_ce1 { O 1 bit } Lam_bufA6c_q1 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'Lam_bufA6c'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 994 \
    name Lam_bufA6 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename Lam_bufA6 \
    op interface \
    ports { Lam_bufA6_address0 { O 10 vector } Lam_bufA6_ce0 { O 1 bit } Lam_bufA6_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'Lam_bufA6'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 995 \
    name SpEtaPrevA \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename SpEtaPrevA \
    op interface \
    ports { SpEtaPrevA_address0 { O 11 vector } SpEtaPrevA_ce0 { O 1 bit } SpEtaPrevA_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'SpEtaPrevA'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 996 \
    name SpEtaPrevAa \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename SpEtaPrevAa \
    op interface \
    ports { SpEtaPrevAa_address0 { O 11 vector } SpEtaPrevAa_ce0 { O 1 bit } SpEtaPrevAa_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'SpEtaPrevAa'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 997 \
    name SpEtaPrevAb \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename SpEtaPrevAb \
    op interface \
    ports { SpEtaPrevAb_address0 { O 10 vector } SpEtaPrevAb_ce0 { O 1 bit } SpEtaPrevAb_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'SpEtaPrevAb'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 998 \
    name SpEtaPrevD \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename SpEtaPrevD \
    op interface \
    ports { SpEtaPrevD_address0 { O 11 vector } SpEtaPrevD_ce0 { O 1 bit } SpEtaPrevD_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'SpEtaPrevD'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 999 \
    name SpEtaPrevDa \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename SpEtaPrevDa \
    op interface \
    ports { SpEtaPrevDa_address0 { O 11 vector } SpEtaPrevDa_ce0 { O 1 bit } SpEtaPrevDa_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'SpEtaPrevDa'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1000 \
    name SpEtaPrevDb \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename SpEtaPrevDb \
    op interface \
    ports { SpEtaPrevDb_address0 { O 10 vector } SpEtaPrevDb_ce0 { O 1 bit } SpEtaPrevDb_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'SpEtaPrevDb'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1001 \
    name Lam_bufB \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename Lam_bufB \
    op interface \
    ports { Lam_bufB_address0 { O 10 vector } Lam_bufB_ce0 { O 1 bit } Lam_bufB_q0 { I 16 vector } Lam_bufB_address1 { O 10 vector } Lam_bufB_ce1 { O 1 bit } Lam_bufB_q1 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'Lam_bufB'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1002 \
    name Lam_bufB1a \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename Lam_bufB1a \
    op interface \
    ports { Lam_bufB1a_address0 { O 10 vector } Lam_bufB1a_ce0 { O 1 bit } Lam_bufB1a_q0 { I 16 vector } Lam_bufB1a_address1 { O 10 vector } Lam_bufB1a_ce1 { O 1 bit } Lam_bufB1a_q1 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'Lam_bufB1a'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1003 \
    name Lam_bufB1b \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename Lam_bufB1b \
    op interface \
    ports { Lam_bufB1b_address0 { O 10 vector } Lam_bufB1b_ce0 { O 1 bit } Lam_bufB1b_q0 { I 16 vector } Lam_bufB1b_address1 { O 10 vector } Lam_bufB1b_ce1 { O 1 bit } Lam_bufB1b_q1 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'Lam_bufB1b'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1004 \
    name Lam_bufB1c \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename Lam_bufB1c \
    op interface \
    ports { Lam_bufB1c_address0 { O 10 vector } Lam_bufB1c_ce0 { O 1 bit } Lam_bufB1c_q0 { I 16 vector } Lam_bufB1c_address1 { O 10 vector } Lam_bufB1c_ce1 { O 1 bit } Lam_bufB1c_q1 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'Lam_bufB1c'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1005 \
    name Lam_bufB2 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename Lam_bufB2 \
    op interface \
    ports { Lam_bufB2_address0 { O 10 vector } Lam_bufB2_ce0 { O 1 bit } Lam_bufB2_q0 { I 16 vector } Lam_bufB2_address1 { O 10 vector } Lam_bufB2_ce1 { O 1 bit } Lam_bufB2_q1 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'Lam_bufB2'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1006 \
    name Lam_bufB3a \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename Lam_bufB3a \
    op interface \
    ports { Lam_bufB3a_address0 { O 10 vector } Lam_bufB3a_ce0 { O 1 bit } Lam_bufB3a_q0 { I 16 vector } Lam_bufB3a_address1 { O 10 vector } Lam_bufB3a_ce1 { O 1 bit } Lam_bufB3a_q1 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'Lam_bufB3a'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1007 \
    name Lam_bufB3b \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename Lam_bufB3b \
    op interface \
    ports { Lam_bufB3b_address0 { O 10 vector } Lam_bufB3b_ce0 { O 1 bit } Lam_bufB3b_q0 { I 16 vector } Lam_bufB3b_address1 { O 10 vector } Lam_bufB3b_ce1 { O 1 bit } Lam_bufB3b_q1 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'Lam_bufB3b'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1008 \
    name Lam_bufB5a \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename Lam_bufB5a \
    op interface \
    ports { Lam_bufB5a_address0 { O 10 vector } Lam_bufB5a_ce0 { O 1 bit } Lam_bufB5a_q0 { I 16 vector } Lam_bufB5a_address1 { O 10 vector } Lam_bufB5a_ce1 { O 1 bit } Lam_bufB5a_q1 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'Lam_bufB5a'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1009 \
    name Lam_bufB5b \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename Lam_bufB5b \
    op interface \
    ports { Lam_bufB5b_address0 { O 10 vector } Lam_bufB5b_ce0 { O 1 bit } Lam_bufB5b_q0 { I 16 vector } Lam_bufB5b_address1 { O 10 vector } Lam_bufB5b_ce1 { O 1 bit } Lam_bufB5b_q1 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'Lam_bufB5b'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1010 \
    name Lam_bufB6 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename Lam_bufB6 \
    op interface \
    ports { Lam_bufB6_address0 { O 10 vector } Lam_bufB6_ce0 { O 1 bit } Lam_bufB6_q0 { I 16 vector } Lam_bufB6_address1 { O 10 vector } Lam_bufB6_ce1 { O 1 bit } Lam_bufB6_q1 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'Lam_bufB6'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1011 \
    name SpEtaPrevB \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename SpEtaPrevB \
    op interface \
    ports { SpEtaPrevB_address0 { O 11 vector } SpEtaPrevB_ce0 { O 1 bit } SpEtaPrevB_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'SpEtaPrevB'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1012 \
    name SpEtaPrevBa \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename SpEtaPrevBa \
    op interface \
    ports { SpEtaPrevBa_address0 { O 11 vector } SpEtaPrevBa_ce0 { O 1 bit } SpEtaPrevBa_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'SpEtaPrevBa'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1013 \
    name SpEtaPrevBb \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename SpEtaPrevBb \
    op interface \
    ports { SpEtaPrevBb_address0 { O 10 vector } SpEtaPrevBb_ce0 { O 1 bit } SpEtaPrevBb_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'SpEtaPrevBb'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1014 \
    name SpEtaPrevE \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename SpEtaPrevE \
    op interface \
    ports { SpEtaPrevE_address0 { O 11 vector } SpEtaPrevE_ce0 { O 1 bit } SpEtaPrevE_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'SpEtaPrevE'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1015 \
    name SpEtaPrevEa \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename SpEtaPrevEa \
    op interface \
    ports { SpEtaPrevEa_address0 { O 11 vector } SpEtaPrevEa_ce0 { O 1 bit } SpEtaPrevEa_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'SpEtaPrevEa'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1016 \
    name SpEtaPrevEb \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename SpEtaPrevEb \
    op interface \
    ports { SpEtaPrevEb_address0 { O 10 vector } SpEtaPrevEb_ce0 { O 1 bit } SpEtaPrevEb_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'SpEtaPrevEb'"
}
}


# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 973 \
    name m \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_m \
    op interface \
    ports { m { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 974 \
    name mA \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mA \
    op interface \
    ports { mA { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 975 \
    name mB \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mB \
    op interface \
    ports { mB { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 976 \
    name inxtab_0 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_inxtab_0 \
    op interface \
    ports { inxtab_0 { O 16 vector } inxtab_0_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 977 \
    name inxtab_1 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_inxtab_1 \
    op interface \
    ports { inxtab_1 { O 16 vector } inxtab_1_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 978 \
    name inxtab_2 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_inxtab_2 \
    op interface \
    ports { inxtab_2 { O 16 vector } inxtab_2_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 979 \
    name numb \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_numb \
    op interface \
    ports { numb { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1017 \
    name nIterationCounter \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_nIterationCounter \
    op interface \
    ports { nIterationCounter { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1018 \
    name Eta_tabx_0 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Eta_tabx_0 \
    op interface \
    ports { Eta_tabx_0 { O 16 vector } Eta_tabx_0_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1019 \
    name Eta_tabx_1 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Eta_tabx_1 \
    op interface \
    ports { Eta_tabx_1 { O 16 vector } Eta_tabx_1_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1020 \
    name Eta_tabx_2 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Eta_tabx_2 \
    op interface \
    ports { Eta_tabx_2 { O 16 vector } Eta_tabx_2_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1021 \
    name Lam_tabx_0 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Lam_tabx_0 \
    op interface \
    ports { Lam_tabx_0 { O 16 vector } Lam_tabx_0_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1022 \
    name Lam_tabx_1 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Lam_tabx_1 \
    op interface \
    ports { Lam_tabx_1 { O 16 vector } Lam_tabx_1_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1023 \
    name Lam_tabx_2 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Lam_tabx_2 \
    op interface \
    ports { Lam_tabx_2 { O 16 vector } Lam_tabx_2_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1024 \
    name Peta_tabx_0 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Peta_tabx_0 \
    op interface \
    ports { Peta_tabx_0 { O 16 vector } Peta_tabx_0_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1025 \
    name Peta_tabx_1 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Peta_tabx_1 \
    op interface \
    ports { Peta_tabx_1 { O 16 vector } Peta_tabx_1_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1026 \
    name Peta_tabx_2 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Peta_tabx_2 \
    op interface \
    ports { Peta_tabx_2 { O 16 vector } Peta_tabx_2_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1027 \
    name Eta_taby_0 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Eta_taby_0 \
    op interface \
    ports { Eta_taby_0 { O 16 vector } Eta_taby_0_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1028 \
    name Eta_taby_1 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Eta_taby_1 \
    op interface \
    ports { Eta_taby_1 { O 16 vector } Eta_taby_1_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1029 \
    name Eta_taby_2 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Eta_taby_2 \
    op interface \
    ports { Eta_taby_2 { O 16 vector } Eta_taby_2_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1030 \
    name Eta_taby_3 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Eta_taby_3 \
    op interface \
    ports { Eta_taby_3 { O 16 vector } Eta_taby_3_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1031 \
    name Eta_taby_4 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Eta_taby_4 \
    op interface \
    ports { Eta_taby_4 { O 16 vector } Eta_taby_4_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1032 \
    name Eta_taby_5 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Eta_taby_5 \
    op interface \
    ports { Eta_taby_5 { O 16 vector } Eta_taby_5_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1033 \
    name Eta_taby_6 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Eta_taby_6 \
    op interface \
    ports { Eta_taby_6 { O 16 vector } Eta_taby_6_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1034 \
    name Eta_taby_7 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Eta_taby_7 \
    op interface \
    ports { Eta_taby_7 { O 16 vector } Eta_taby_7_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1035 \
    name Eta_taby_8 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Eta_taby_8 \
    op interface \
    ports { Eta_taby_8 { O 16 vector } Eta_taby_8_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1036 \
    name Eta_taby_9 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Eta_taby_9 \
    op interface \
    ports { Eta_taby_9 { O 16 vector } Eta_taby_9_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1037 \
    name Lam_taby_0 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Lam_taby_0 \
    op interface \
    ports { Lam_taby_0 { O 16 vector } Lam_taby_0_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1038 \
    name Lam_taby_1 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Lam_taby_1 \
    op interface \
    ports { Lam_taby_1 { O 16 vector } Lam_taby_1_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1039 \
    name Lam_taby_2 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Lam_taby_2 \
    op interface \
    ports { Lam_taby_2 { O 16 vector } Lam_taby_2_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1040 \
    name Lam_taby_3 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Lam_taby_3 \
    op interface \
    ports { Lam_taby_3 { O 16 vector } Lam_taby_3_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1041 \
    name Lam_taby_4 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Lam_taby_4 \
    op interface \
    ports { Lam_taby_4 { O 16 vector } Lam_taby_4_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1042 \
    name Lam_taby_5 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Lam_taby_5 \
    op interface \
    ports { Lam_taby_5 { O 16 vector } Lam_taby_5_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1043 \
    name Lam_taby_6 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Lam_taby_6 \
    op interface \
    ports { Lam_taby_6 { O 16 vector } Lam_taby_6_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1044 \
    name Lam_taby_7 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Lam_taby_7 \
    op interface \
    ports { Lam_taby_7 { O 16 vector } Lam_taby_7_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1045 \
    name Lam_taby_8 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Lam_taby_8 \
    op interface \
    ports { Lam_taby_8 { O 16 vector } Lam_taby_8_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1046 \
    name Lam_taby_9 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Lam_taby_9 \
    op interface \
    ports { Lam_taby_9 { O 16 vector } Lam_taby_9_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1047 \
    name Lam_taby_10 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Lam_taby_10 \
    op interface \
    ports { Lam_taby_10 { O 16 vector } Lam_taby_10_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1048 \
    name Lam_taby_11 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Lam_taby_11 \
    op interface \
    ports { Lam_taby_11 { O 16 vector } Lam_taby_11_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1049 \
    name Lam_taby_12 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Lam_taby_12 \
    op interface \
    ports { Lam_taby_12 { O 16 vector } Lam_taby_12_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1050 \
    name Lam_taby_13 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Lam_taby_13 \
    op interface \
    ports { Lam_taby_13 { O 16 vector } Lam_taby_13_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1051 \
    name Lam_taby_14 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Lam_taby_14 \
    op interface \
    ports { Lam_taby_14 { O 16 vector } Lam_taby_14_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1052 \
    name Lam_taby_15 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Lam_taby_15 \
    op interface \
    ports { Lam_taby_15 { O 16 vector } Lam_taby_15_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1053 \
    name Lam_taby_16 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Lam_taby_16 \
    op interface \
    ports { Lam_taby_16 { O 16 vector } Lam_taby_16_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1054 \
    name Lam_taby_17 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Lam_taby_17 \
    op interface \
    ports { Lam_taby_17 { O 16 vector } Lam_taby_17_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1055 \
    name Peta_taby_0 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Peta_taby_0 \
    op interface \
    ports { Peta_taby_0 { O 16 vector } Peta_taby_0_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1056 \
    name Peta_taby_1 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Peta_taby_1 \
    op interface \
    ports { Peta_taby_1 { O 16 vector } Peta_taby_1_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1057 \
    name Peta_taby_2 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Peta_taby_2 \
    op interface \
    ports { Peta_taby_2 { O 16 vector } Peta_taby_2_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1058 \
    name Peta_taby_3 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Peta_taby_3 \
    op interface \
    ports { Peta_taby_3 { O 16 vector } Peta_taby_3_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1059 \
    name Peta_taby_4 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Peta_taby_4 \
    op interface \
    ports { Peta_taby_4 { O 16 vector } Peta_taby_4_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1060 \
    name Peta_taby_5 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Peta_taby_5 \
    op interface \
    ports { Peta_taby_5 { O 16 vector } Peta_taby_5_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1061 \
    name Peta_taby_6 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Peta_taby_6 \
    op interface \
    ports { Peta_taby_6 { O 16 vector } Peta_taby_6_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1062 \
    name Peta_taby_7 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Peta_taby_7 \
    op interface \
    ports { Peta_taby_7 { O 16 vector } Peta_taby_7_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1063 \
    name Peta_taby_8 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Peta_taby_8 \
    op interface \
    ports { Peta_taby_8 { O 16 vector } Peta_taby_8_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1064 \
    name Peta_taby_9 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Peta_taby_9 \
    op interface \
    ports { Peta_taby_9 { O 16 vector } Peta_taby_9_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1065 \
    name Peta_taby_10 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Peta_taby_10 \
    op interface \
    ports { Peta_taby_10 { O 16 vector } Peta_taby_10_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1066 \
    name Peta_taby_11 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Peta_taby_11 \
    op interface \
    ports { Peta_taby_11 { O 16 vector } Peta_taby_11_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1067 \
    name Peta_taby_12 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Peta_taby_12 \
    op interface \
    ports { Peta_taby_12 { O 16 vector } Peta_taby_12_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1068 \
    name Peta_taby_13 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Peta_taby_13 \
    op interface \
    ports { Peta_taby_13 { O 16 vector } Peta_taby_13_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1069 \
    name Peta_taby_14 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Peta_taby_14 \
    op interface \
    ports { Peta_taby_14 { O 16 vector } Peta_taby_14_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1070 \
    name Peta_taby_15 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Peta_taby_15 \
    op interface \
    ports { Peta_taby_15 { O 16 vector } Peta_taby_15_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1071 \
    name Peta_taby_16 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Peta_taby_16 \
    op interface \
    ports { Peta_taby_16 { O 16 vector } Peta_taby_16_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1072 \
    name Peta_taby_17 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Peta_taby_17 \
    op interface \
    ports { Peta_taby_17 { O 16 vector } Peta_taby_17_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1073 \
    name Eta_tabz_0 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Eta_tabz_0 \
    op interface \
    ports { Eta_tabz_0 { O 16 vector } Eta_tabz_0_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1074 \
    name Eta_tabz_1 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Eta_tabz_1 \
    op interface \
    ports { Eta_tabz_1 { O 16 vector } Eta_tabz_1_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1075 \
    name Eta_tabz_2 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Eta_tabz_2 \
    op interface \
    ports { Eta_tabz_2 { O 16 vector } Eta_tabz_2_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1076 \
    name Eta_tabz_3 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Eta_tabz_3 \
    op interface \
    ports { Eta_tabz_3 { O 16 vector } Eta_tabz_3_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1077 \
    name Eta_tabz_4 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Eta_tabz_4 \
    op interface \
    ports { Eta_tabz_4 { O 16 vector } Eta_tabz_4_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1078 \
    name Eta_tabz_5 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Eta_tabz_5 \
    op interface \
    ports { Eta_tabz_5 { O 16 vector } Eta_tabz_5_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1079 \
    name Eta_tabz_6 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Eta_tabz_6 \
    op interface \
    ports { Eta_tabz_6 { O 16 vector } Eta_tabz_6_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1080 \
    name Eta_tabz_7 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Eta_tabz_7 \
    op interface \
    ports { Eta_tabz_7 { O 16 vector } Eta_tabz_7_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1081 \
    name Eta_tabz_8 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Eta_tabz_8 \
    op interface \
    ports { Eta_tabz_8 { O 16 vector } Eta_tabz_8_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1082 \
    name Eta_tabz_9 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Eta_tabz_9 \
    op interface \
    ports { Eta_tabz_9 { O 16 vector } Eta_tabz_9_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1083 \
    name Lam_tabz_0 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Lam_tabz_0 \
    op interface \
    ports { Lam_tabz_0 { O 16 vector } Lam_tabz_0_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1084 \
    name Lam_tabz_1 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Lam_tabz_1 \
    op interface \
    ports { Lam_tabz_1 { O 16 vector } Lam_tabz_1_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1085 \
    name Lam_tabz_2 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Lam_tabz_2 \
    op interface \
    ports { Lam_tabz_2 { O 16 vector } Lam_tabz_2_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1086 \
    name Lam_tabz_3 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Lam_tabz_3 \
    op interface \
    ports { Lam_tabz_3 { O 16 vector } Lam_tabz_3_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1087 \
    name Lam_tabz_4 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Lam_tabz_4 \
    op interface \
    ports { Lam_tabz_4 { O 16 vector } Lam_tabz_4_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1088 \
    name Lam_tabz_5 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Lam_tabz_5 \
    op interface \
    ports { Lam_tabz_5 { O 16 vector } Lam_tabz_5_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1089 \
    name Lam_tabz_6 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Lam_tabz_6 \
    op interface \
    ports { Lam_tabz_6 { O 16 vector } Lam_tabz_6_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1090 \
    name Lam_tabz_7 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Lam_tabz_7 \
    op interface \
    ports { Lam_tabz_7 { O 16 vector } Lam_tabz_7_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1091 \
    name Lam_tabz_8 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Lam_tabz_8 \
    op interface \
    ports { Lam_tabz_8 { O 16 vector } Lam_tabz_8_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1092 \
    name Lam_tabz_9 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Lam_tabz_9 \
    op interface \
    ports { Lam_tabz_9 { O 16 vector } Lam_tabz_9_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1093 \
    name Lam_tabz_10 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Lam_tabz_10 \
    op interface \
    ports { Lam_tabz_10 { O 16 vector } Lam_tabz_10_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1094 \
    name Lam_tabz_11 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Lam_tabz_11 \
    op interface \
    ports { Lam_tabz_11 { O 16 vector } Lam_tabz_11_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1095 \
    name Lam_tabz_12 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Lam_tabz_12 \
    op interface \
    ports { Lam_tabz_12 { O 16 vector } Lam_tabz_12_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1096 \
    name Lam_tabz_13 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Lam_tabz_13 \
    op interface \
    ports { Lam_tabz_13 { O 16 vector } Lam_tabz_13_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1097 \
    name Lam_tabz_14 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Lam_tabz_14 \
    op interface \
    ports { Lam_tabz_14 { O 16 vector } Lam_tabz_14_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1098 \
    name Lam_tabz_15 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Lam_tabz_15 \
    op interface \
    ports { Lam_tabz_15 { O 16 vector } Lam_tabz_15_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1099 \
    name Lam_tabz_16 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Lam_tabz_16 \
    op interface \
    ports { Lam_tabz_16 { O 16 vector } Lam_tabz_16_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1100 \
    name Lam_tabz_17 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Lam_tabz_17 \
    op interface \
    ports { Lam_tabz_17 { O 16 vector } Lam_tabz_17_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1101 \
    name Peta_tabz_0 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Peta_tabz_0 \
    op interface \
    ports { Peta_tabz_0 { O 16 vector } Peta_tabz_0_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1102 \
    name Peta_tabz_1 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Peta_tabz_1 \
    op interface \
    ports { Peta_tabz_1 { O 16 vector } Peta_tabz_1_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1103 \
    name Peta_tabz_2 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Peta_tabz_2 \
    op interface \
    ports { Peta_tabz_2 { O 16 vector } Peta_tabz_2_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1104 \
    name Peta_tabz_3 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Peta_tabz_3 \
    op interface \
    ports { Peta_tabz_3 { O 16 vector } Peta_tabz_3_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1105 \
    name Peta_tabz_4 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Peta_tabz_4 \
    op interface \
    ports { Peta_tabz_4 { O 16 vector } Peta_tabz_4_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1106 \
    name Peta_tabz_5 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Peta_tabz_5 \
    op interface \
    ports { Peta_tabz_5 { O 16 vector } Peta_tabz_5_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1107 \
    name Peta_tabz_6 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Peta_tabz_6 \
    op interface \
    ports { Peta_tabz_6 { O 16 vector } Peta_tabz_6_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1108 \
    name Peta_tabz_7 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Peta_tabz_7 \
    op interface \
    ports { Peta_tabz_7 { O 16 vector } Peta_tabz_7_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1109 \
    name Peta_tabz_8 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Peta_tabz_8 \
    op interface \
    ports { Peta_tabz_8 { O 16 vector } Peta_tabz_8_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1110 \
    name Peta_tabz_9 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Peta_tabz_9 \
    op interface \
    ports { Peta_tabz_9 { O 16 vector } Peta_tabz_9_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1111 \
    name Peta_tabz_10 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Peta_tabz_10 \
    op interface \
    ports { Peta_tabz_10 { O 16 vector } Peta_tabz_10_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1112 \
    name Peta_tabz_11 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Peta_tabz_11 \
    op interface \
    ports { Peta_tabz_11 { O 16 vector } Peta_tabz_11_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1113 \
    name Peta_tabz_12 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Peta_tabz_12 \
    op interface \
    ports { Peta_tabz_12 { O 16 vector } Peta_tabz_12_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1114 \
    name Peta_tabz_13 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Peta_tabz_13 \
    op interface \
    ports { Peta_tabz_13 { O 16 vector } Peta_tabz_13_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1115 \
    name Peta_tabz_14 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Peta_tabz_14 \
    op interface \
    ports { Peta_tabz_14 { O 16 vector } Peta_tabz_14_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1116 \
    name Peta_tabz_15 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Peta_tabz_15 \
    op interface \
    ports { Peta_tabz_15 { O 16 vector } Peta_tabz_15_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1117 \
    name Peta_tabz_16 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Peta_tabz_16 \
    op interface \
    ports { Peta_tabz_16 { O 16 vector } Peta_tabz_16_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1118 \
    name Peta_tabz_17 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Peta_tabz_17 \
    op interface \
    ports { Peta_tabz_17 { O 16 vector } Peta_tabz_17_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1119 \
    name Eta_tabe_0 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Eta_tabe_0 \
    op interface \
    ports { Eta_tabe_0 { O 16 vector } Eta_tabe_0_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1120 \
    name Eta_tabe_1 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Eta_tabe_1 \
    op interface \
    ports { Eta_tabe_1 { O 16 vector } Eta_tabe_1_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1121 \
    name Eta_tabe_2 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Eta_tabe_2 \
    op interface \
    ports { Eta_tabe_2 { O 16 vector } Eta_tabe_2_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1122 \
    name Lam_tabe_0 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Lam_tabe_0 \
    op interface \
    ports { Lam_tabe_0 { O 16 vector } Lam_tabe_0_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1123 \
    name Lam_tabe_1 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Lam_tabe_1 \
    op interface \
    ports { Lam_tabe_1 { O 16 vector } Lam_tabe_1_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1124 \
    name Lam_tabe_2 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Lam_tabe_2 \
    op interface \
    ports { Lam_tabe_2 { O 16 vector } Lam_tabe_2_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1125 \
    name Peta_tabe_0 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Peta_tabe_0 \
    op interface \
    ports { Peta_tabe_0 { O 16 vector } Peta_tabe_0_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1126 \
    name Peta_tabe_1 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Peta_tabe_1 \
    op interface \
    ports { Peta_tabe_1 { O 16 vector } Peta_tabe_1_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1127 \
    name Peta_tabe_2 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Peta_tabe_2 \
    op interface \
    ports { Peta_tabe_2 { O 16 vector } Peta_tabe_2_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1128 \
    name Eta_tabf_0 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Eta_tabf_0 \
    op interface \
    ports { Eta_tabf_0 { O 16 vector } Eta_tabf_0_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1129 \
    name Eta_tabf_1 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Eta_tabf_1 \
    op interface \
    ports { Eta_tabf_1 { O 16 vector } Eta_tabf_1_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1130 \
    name Eta_tabf_2 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Eta_tabf_2 \
    op interface \
    ports { Eta_tabf_2 { O 16 vector } Eta_tabf_2_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1131 \
    name Eta_tabf_3 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Eta_tabf_3 \
    op interface \
    ports { Eta_tabf_3 { O 16 vector } Eta_tabf_3_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1132 \
    name Eta_tabf_4 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Eta_tabf_4 \
    op interface \
    ports { Eta_tabf_4 { O 16 vector } Eta_tabf_4_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1133 \
    name Eta_tabf_5 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Eta_tabf_5 \
    op interface \
    ports { Eta_tabf_5 { O 16 vector } Eta_tabf_5_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1134 \
    name Eta_tabf_6 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Eta_tabf_6 \
    op interface \
    ports { Eta_tabf_6 { O 16 vector } Eta_tabf_6_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1135 \
    name Eta_tabf_7 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Eta_tabf_7 \
    op interface \
    ports { Eta_tabf_7 { O 16 vector } Eta_tabf_7_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1136 \
    name Eta_tabf_8 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Eta_tabf_8 \
    op interface \
    ports { Eta_tabf_8 { O 16 vector } Eta_tabf_8_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1137 \
    name Eta_tabf_9 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Eta_tabf_9 \
    op interface \
    ports { Eta_tabf_9 { O 16 vector } Eta_tabf_9_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1138 \
    name Lam_tabf_0 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Lam_tabf_0 \
    op interface \
    ports { Lam_tabf_0 { O 16 vector } Lam_tabf_0_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1139 \
    name Lam_tabf_1 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Lam_tabf_1 \
    op interface \
    ports { Lam_tabf_1 { O 16 vector } Lam_tabf_1_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1140 \
    name Lam_tabf_2 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Lam_tabf_2 \
    op interface \
    ports { Lam_tabf_2 { O 16 vector } Lam_tabf_2_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1141 \
    name Lam_tabf_3 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Lam_tabf_3 \
    op interface \
    ports { Lam_tabf_3 { O 16 vector } Lam_tabf_3_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1142 \
    name Lam_tabf_4 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Lam_tabf_4 \
    op interface \
    ports { Lam_tabf_4 { O 16 vector } Lam_tabf_4_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1143 \
    name Lam_tabf_5 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Lam_tabf_5 \
    op interface \
    ports { Lam_tabf_5 { O 16 vector } Lam_tabf_5_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1144 \
    name Lam_tabf_6 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Lam_tabf_6 \
    op interface \
    ports { Lam_tabf_6 { O 16 vector } Lam_tabf_6_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1145 \
    name Lam_tabf_7 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Lam_tabf_7 \
    op interface \
    ports { Lam_tabf_7 { O 16 vector } Lam_tabf_7_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1146 \
    name Lam_tabf_8 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Lam_tabf_8 \
    op interface \
    ports { Lam_tabf_8 { O 16 vector } Lam_tabf_8_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1147 \
    name Lam_tabf_9 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Lam_tabf_9 \
    op interface \
    ports { Lam_tabf_9 { O 16 vector } Lam_tabf_9_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1148 \
    name Lam_tabf_10 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Lam_tabf_10 \
    op interface \
    ports { Lam_tabf_10 { O 16 vector } Lam_tabf_10_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1149 \
    name Lam_tabf_11 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Lam_tabf_11 \
    op interface \
    ports { Lam_tabf_11 { O 16 vector } Lam_tabf_11_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1150 \
    name Lam_tabf_12 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Lam_tabf_12 \
    op interface \
    ports { Lam_tabf_12 { O 16 vector } Lam_tabf_12_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1151 \
    name Lam_tabf_13 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Lam_tabf_13 \
    op interface \
    ports { Lam_tabf_13 { O 16 vector } Lam_tabf_13_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1152 \
    name Lam_tabf_14 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Lam_tabf_14 \
    op interface \
    ports { Lam_tabf_14 { O 16 vector } Lam_tabf_14_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1153 \
    name Lam_tabf_15 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Lam_tabf_15 \
    op interface \
    ports { Lam_tabf_15 { O 16 vector } Lam_tabf_15_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1154 \
    name Lam_tabf_16 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Lam_tabf_16 \
    op interface \
    ports { Lam_tabf_16 { O 16 vector } Lam_tabf_16_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1155 \
    name Lam_tabf_17 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Lam_tabf_17 \
    op interface \
    ports { Lam_tabf_17 { O 16 vector } Lam_tabf_17_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1156 \
    name Peta_tabf_0 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Peta_tabf_0 \
    op interface \
    ports { Peta_tabf_0 { O 16 vector } Peta_tabf_0_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1157 \
    name Peta_tabf_1 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Peta_tabf_1 \
    op interface \
    ports { Peta_tabf_1 { O 16 vector } Peta_tabf_1_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1158 \
    name Peta_tabf_2 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Peta_tabf_2 \
    op interface \
    ports { Peta_tabf_2 { O 16 vector } Peta_tabf_2_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1159 \
    name Peta_tabf_3 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Peta_tabf_3 \
    op interface \
    ports { Peta_tabf_3 { O 16 vector } Peta_tabf_3_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1160 \
    name Peta_tabf_4 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Peta_tabf_4 \
    op interface \
    ports { Peta_tabf_4 { O 16 vector } Peta_tabf_4_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1161 \
    name Peta_tabf_5 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Peta_tabf_5 \
    op interface \
    ports { Peta_tabf_5 { O 16 vector } Peta_tabf_5_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1162 \
    name Peta_tabf_6 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Peta_tabf_6 \
    op interface \
    ports { Peta_tabf_6 { O 16 vector } Peta_tabf_6_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1163 \
    name Peta_tabf_7 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Peta_tabf_7 \
    op interface \
    ports { Peta_tabf_7 { O 16 vector } Peta_tabf_7_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1164 \
    name Peta_tabf_8 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Peta_tabf_8 \
    op interface \
    ports { Peta_tabf_8 { O 16 vector } Peta_tabf_8_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1165 \
    name Peta_tabf_9 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Peta_tabf_9 \
    op interface \
    ports { Peta_tabf_9 { O 16 vector } Peta_tabf_9_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1166 \
    name Peta_tabf_10 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Peta_tabf_10 \
    op interface \
    ports { Peta_tabf_10 { O 16 vector } Peta_tabf_10_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1167 \
    name Peta_tabf_11 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Peta_tabf_11 \
    op interface \
    ports { Peta_tabf_11 { O 16 vector } Peta_tabf_11_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1168 \
    name Peta_tabf_12 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Peta_tabf_12 \
    op interface \
    ports { Peta_tabf_12 { O 16 vector } Peta_tabf_12_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1169 \
    name Peta_tabf_13 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Peta_tabf_13 \
    op interface \
    ports { Peta_tabf_13 { O 16 vector } Peta_tabf_13_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1170 \
    name Peta_tabf_14 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Peta_tabf_14 \
    op interface \
    ports { Peta_tabf_14 { O 16 vector } Peta_tabf_14_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1171 \
    name Peta_tabf_15 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Peta_tabf_15 \
    op interface \
    ports { Peta_tabf_15 { O 16 vector } Peta_tabf_15_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1172 \
    name Peta_tabf_16 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Peta_tabf_16 \
    op interface \
    ports { Peta_tabf_16 { O 16 vector } Peta_tabf_16_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1173 \
    name Peta_tabf_17 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Peta_tabf_17 \
    op interface \
    ports { Peta_tabf_17 { O 16 vector } Peta_tabf_17_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1174 \
    name Eta_tabg_0 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Eta_tabg_0 \
    op interface \
    ports { Eta_tabg_0 { O 16 vector } Eta_tabg_0_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1175 \
    name Eta_tabg_1 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Eta_tabg_1 \
    op interface \
    ports { Eta_tabg_1 { O 16 vector } Eta_tabg_1_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1176 \
    name Eta_tabg_2 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Eta_tabg_2 \
    op interface \
    ports { Eta_tabg_2 { O 16 vector } Eta_tabg_2_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1177 \
    name Eta_tabg_3 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Eta_tabg_3 \
    op interface \
    ports { Eta_tabg_3 { O 16 vector } Eta_tabg_3_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1178 \
    name Eta_tabg_4 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Eta_tabg_4 \
    op interface \
    ports { Eta_tabg_4 { O 16 vector } Eta_tabg_4_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1179 \
    name Eta_tabg_5 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Eta_tabg_5 \
    op interface \
    ports { Eta_tabg_5 { O 16 vector } Eta_tabg_5_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1180 \
    name Eta_tabg_6 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Eta_tabg_6 \
    op interface \
    ports { Eta_tabg_6 { O 16 vector } Eta_tabg_6_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1181 \
    name Eta_tabg_7 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Eta_tabg_7 \
    op interface \
    ports { Eta_tabg_7 { O 16 vector } Eta_tabg_7_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1182 \
    name Eta_tabg_8 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Eta_tabg_8 \
    op interface \
    ports { Eta_tabg_8 { O 16 vector } Eta_tabg_8_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1183 \
    name Eta_tabg_9 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Eta_tabg_9 \
    op interface \
    ports { Eta_tabg_9 { O 16 vector } Eta_tabg_9_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1184 \
    name Lam_tabg_0 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Lam_tabg_0 \
    op interface \
    ports { Lam_tabg_0 { O 16 vector } Lam_tabg_0_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1185 \
    name Lam_tabg_1 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Lam_tabg_1 \
    op interface \
    ports { Lam_tabg_1 { O 16 vector } Lam_tabg_1_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1186 \
    name Lam_tabg_2 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Lam_tabg_2 \
    op interface \
    ports { Lam_tabg_2 { O 16 vector } Lam_tabg_2_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1187 \
    name Lam_tabg_3 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Lam_tabg_3 \
    op interface \
    ports { Lam_tabg_3 { O 16 vector } Lam_tabg_3_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1188 \
    name Lam_tabg_4 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Lam_tabg_4 \
    op interface \
    ports { Lam_tabg_4 { O 16 vector } Lam_tabg_4_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1189 \
    name Lam_tabg_5 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Lam_tabg_5 \
    op interface \
    ports { Lam_tabg_5 { O 16 vector } Lam_tabg_5_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1190 \
    name Lam_tabg_6 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Lam_tabg_6 \
    op interface \
    ports { Lam_tabg_6 { O 16 vector } Lam_tabg_6_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1191 \
    name Lam_tabg_7 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Lam_tabg_7 \
    op interface \
    ports { Lam_tabg_7 { O 16 vector } Lam_tabg_7_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1192 \
    name Lam_tabg_8 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Lam_tabg_8 \
    op interface \
    ports { Lam_tabg_8 { O 16 vector } Lam_tabg_8_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1193 \
    name Lam_tabg_9 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Lam_tabg_9 \
    op interface \
    ports { Lam_tabg_9 { O 16 vector } Lam_tabg_9_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1194 \
    name Lam_tabg_10 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Lam_tabg_10 \
    op interface \
    ports { Lam_tabg_10 { O 16 vector } Lam_tabg_10_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1195 \
    name Lam_tabg_11 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Lam_tabg_11 \
    op interface \
    ports { Lam_tabg_11 { O 16 vector } Lam_tabg_11_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1196 \
    name Lam_tabg_12 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Lam_tabg_12 \
    op interface \
    ports { Lam_tabg_12 { O 16 vector } Lam_tabg_12_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1197 \
    name Lam_tabg_13 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Lam_tabg_13 \
    op interface \
    ports { Lam_tabg_13 { O 16 vector } Lam_tabg_13_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1198 \
    name Lam_tabg_14 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Lam_tabg_14 \
    op interface \
    ports { Lam_tabg_14 { O 16 vector } Lam_tabg_14_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1199 \
    name Lam_tabg_15 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Lam_tabg_15 \
    op interface \
    ports { Lam_tabg_15 { O 16 vector } Lam_tabg_15_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1200 \
    name Lam_tabg_16 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Lam_tabg_16 \
    op interface \
    ports { Lam_tabg_16 { O 16 vector } Lam_tabg_16_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1201 \
    name Lam_tabg_17 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Lam_tabg_17 \
    op interface \
    ports { Lam_tabg_17 { O 16 vector } Lam_tabg_17_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1202 \
    name Peta_tabg_0 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Peta_tabg_0 \
    op interface \
    ports { Peta_tabg_0 { O 16 vector } Peta_tabg_0_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1203 \
    name Peta_tabg_1 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Peta_tabg_1 \
    op interface \
    ports { Peta_tabg_1 { O 16 vector } Peta_tabg_1_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1204 \
    name Peta_tabg_2 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Peta_tabg_2 \
    op interface \
    ports { Peta_tabg_2 { O 16 vector } Peta_tabg_2_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1205 \
    name Peta_tabg_3 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Peta_tabg_3 \
    op interface \
    ports { Peta_tabg_3 { O 16 vector } Peta_tabg_3_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1206 \
    name Peta_tabg_4 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Peta_tabg_4 \
    op interface \
    ports { Peta_tabg_4 { O 16 vector } Peta_tabg_4_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1207 \
    name Peta_tabg_5 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Peta_tabg_5 \
    op interface \
    ports { Peta_tabg_5 { O 16 vector } Peta_tabg_5_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1208 \
    name Peta_tabg_6 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Peta_tabg_6 \
    op interface \
    ports { Peta_tabg_6 { O 16 vector } Peta_tabg_6_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1209 \
    name Peta_tabg_7 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Peta_tabg_7 \
    op interface \
    ports { Peta_tabg_7 { O 16 vector } Peta_tabg_7_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1210 \
    name Peta_tabg_8 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Peta_tabg_8 \
    op interface \
    ports { Peta_tabg_8 { O 16 vector } Peta_tabg_8_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1211 \
    name Peta_tabg_9 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Peta_tabg_9 \
    op interface \
    ports { Peta_tabg_9 { O 16 vector } Peta_tabg_9_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1212 \
    name Peta_tabg_10 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Peta_tabg_10 \
    op interface \
    ports { Peta_tabg_10 { O 16 vector } Peta_tabg_10_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1213 \
    name Peta_tabg_11 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Peta_tabg_11 \
    op interface \
    ports { Peta_tabg_11 { O 16 vector } Peta_tabg_11_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1214 \
    name Peta_tabg_12 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Peta_tabg_12 \
    op interface \
    ports { Peta_tabg_12 { O 16 vector } Peta_tabg_12_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1215 \
    name Peta_tabg_13 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Peta_tabg_13 \
    op interface \
    ports { Peta_tabg_13 { O 16 vector } Peta_tabg_13_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1216 \
    name Peta_tabg_14 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Peta_tabg_14 \
    op interface \
    ports { Peta_tabg_14 { O 16 vector } Peta_tabg_14_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1217 \
    name Peta_tabg_15 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Peta_tabg_15 \
    op interface \
    ports { Peta_tabg_15 { O 16 vector } Peta_tabg_15_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1218 \
    name Peta_tabg_16 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Peta_tabg_16 \
    op interface \
    ports { Peta_tabg_16 { O 16 vector } Peta_tabg_16_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1219 \
    name Peta_tabg_17 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Peta_tabg_17 \
    op interface \
    ports { Peta_tabg_17 { O 16 vector } Peta_tabg_17_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id -1 \
    name ap_ctrl \
    type ap_ctrl \
    reset_level 1 \
    sync_rst true \
    corename ap_ctrl \
    op interface \
    ports { ap_start { I 1 bit } ap_ready { O 1 bit } ap_done { O 1 bit } ap_idle { O 1 bit } } \
} "
}


# Adapter definition:
set PortName ap_clk
set DataWd 1 
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc cg_default_interface_gen_clock] == "cg_default_interface_gen_clock"} {
eval "cg_default_interface_gen_clock { \
    id -2 \
    name ${PortName} \
    reset_level 1 \
    sync_rst true \
    corename apif_ap_clk \
    data_wd ${DataWd} \
    op interface \
}"
} else {
puts "@W \[IMPL-113\] Cannot find bus interface model in the library. Ignored generation of bus interface for '${PortName}'"
}
}


# Adapter definition:
set PortName ap_rst
set DataWd 1 
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc cg_default_interface_gen_reset] == "cg_default_interface_gen_reset"} {
eval "cg_default_interface_gen_reset { \
    id -3 \
    name ${PortName} \
    reset_level 1 \
    sync_rst true \
    corename apif_ap_rst \
    data_wd ${DataWd} \
    op interface \
}"
} else {
puts "@W \[IMPL-114\] Cannot find bus interface model in the library. Ignored generation of bus interface for '${PortName}'"
}
}



# merge
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_end
    cg_default_interface_gen_bundle_end
    AESL_LIB_XILADAPTER::native_axis_end
}


