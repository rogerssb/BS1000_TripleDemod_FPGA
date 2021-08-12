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
    id 2890 \
    name Lam_bufAa \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename Lam_bufAa \
    op interface \
    ports { Lam_bufAa_address0 { O 10 vector } Lam_bufAa_ce0 { O 1 bit } Lam_bufAa_we0 { O 1 bit } Lam_bufAa_d0 { O 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'Lam_bufAa'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2891 \
    name Lam_bufAb \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename Lam_bufAb \
    op interface \
    ports { Lam_bufAb_address0 { O 10 vector } Lam_bufAb_ce0 { O 1 bit } Lam_bufAb_we0 { O 1 bit } Lam_bufAb_d0 { O 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'Lam_bufAb'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2892 \
    name Lam_bufAc \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename Lam_bufAc \
    op interface \
    ports { Lam_bufAc_address0 { O 10 vector } Lam_bufAc_ce0 { O 1 bit } Lam_bufAc_we0 { O 1 bit } Lam_bufAc_d0 { O 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'Lam_bufAc'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2893 \
    name Lam_bufB \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename Lam_bufB \
    op interface \
    ports { Lam_bufB_address0 { O 10 vector } Lam_bufB_ce0 { O 1 bit } Lam_bufB_we0 { O 1 bit } Lam_bufB_d0 { O 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'Lam_bufB'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2894 \
    name prLamB_buf \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename prLamB_buf \
    op interface \
    ports { prLamB_buf_address0 { O 10 vector } prLamB_buf_ce0 { O 1 bit } prLamB_buf_we0 { O 1 bit } prLamB_buf_d0 { O 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLamB_buf'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2895 \
    name prLamC_buf \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename prLamC_buf \
    op interface \
    ports { prLamC_buf_address0 { O 10 vector } prLamC_buf_ce0 { O 1 bit } prLamC_buf_we0 { O 1 bit } prLamC_buf_d0 { O 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLamC_buf'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2896 \
    name prLamC_bufa \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename prLamC_bufa \
    op interface \
    ports { prLamC_bufa_address0 { O 10 vector } prLamC_bufa_ce0 { O 1 bit } prLamC_bufa_we0 { O 1 bit } prLamC_bufa_d0 { O 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLamC_bufa'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2897 \
    name prLamC_bufb \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename prLamC_bufb \
    op interface \
    ports { prLamC_bufb_address0 { O 10 vector } prLamC_bufb_ce0 { O 1 bit } prLamC_bufb_we0 { O 1 bit } prLamC_bufb_d0 { O 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLamC_bufb'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2898 \
    name prLam2B_buf \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename prLam2B_buf \
    op interface \
    ports { prLam2B_buf_address0 { O 10 vector } prLam2B_buf_ce0 { O 1 bit } prLam2B_buf_we0 { O 1 bit } prLam2B_buf_d0 { O 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLam2B_buf'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2899 \
    name prLam2C_buf \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename prLam2C_buf \
    op interface \
    ports { prLam2C_buf_address0 { O 10 vector } prLam2C_buf_ce0 { O 1 bit } prLam2C_buf_we0 { O 1 bit } prLam2C_buf_d0 { O 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLam2C_buf'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2900 \
    name prLam2C_bufa \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename prLam2C_bufa \
    op interface \
    ports { prLam2C_bufa_address0 { O 10 vector } prLam2C_bufa_ce0 { O 1 bit } prLam2C_bufa_we0 { O 1 bit } prLam2C_bufa_d0 { O 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLam2C_bufa'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2901 \
    name prLam2C_bufb \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename prLam2C_bufb \
    op interface \
    ports { prLam2C_bufb_address0 { O 10 vector } prLam2C_bufb_ce0 { O 1 bit } prLam2C_bufb_we0 { O 1 bit } prLam2C_bufb_d0 { O 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLam2C_bufb'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2903 \
    name Lam_bufA1 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename Lam_bufA1 \
    op interface \
    ports { Lam_bufA1_address0 { O 10 vector } Lam_bufA1_ce0 { O 1 bit } Lam_bufA1_we0 { O 1 bit } Lam_bufA1_d0 { O 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'Lam_bufA1'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2904 \
    name Lam_bufB1a \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename Lam_bufB1a \
    op interface \
    ports { Lam_bufB1a_address0 { O 10 vector } Lam_bufB1a_ce0 { O 1 bit } Lam_bufB1a_we0 { O 1 bit } Lam_bufB1a_d0 { O 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'Lam_bufB1a'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2905 \
    name Lam_bufB1b \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename Lam_bufB1b \
    op interface \
    ports { Lam_bufB1b_address0 { O 10 vector } Lam_bufB1b_ce0 { O 1 bit } Lam_bufB1b_we0 { O 1 bit } Lam_bufB1b_d0 { O 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'Lam_bufB1b'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2906 \
    name Lam_bufB1c \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename Lam_bufB1c \
    op interface \
    ports { Lam_bufB1c_address0 { O 10 vector } Lam_bufB1c_ce0 { O 1 bit } Lam_bufB1c_we0 { O 1 bit } Lam_bufB1c_d0 { O 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'Lam_bufB1c'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2907 \
    name prLamB_buf1 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename prLamB_buf1 \
    op interface \
    ports { prLamB_buf1_address0 { O 10 vector } prLamB_buf1_ce0 { O 1 bit } prLamB_buf1_we0 { O 1 bit } prLamB_buf1_d0 { O 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLamB_buf1'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2908 \
    name prLamB_buf1a \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename prLamB_buf1a \
    op interface \
    ports { prLamB_buf1a_address0 { O 10 vector } prLamB_buf1a_ce0 { O 1 bit } prLamB_buf1a_we0 { O 1 bit } prLamB_buf1a_d0 { O 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLamB_buf1a'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2909 \
    name prLamB_buf1b \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename prLamB_buf1b \
    op interface \
    ports { prLamB_buf1b_address0 { O 10 vector } prLamB_buf1b_ce0 { O 1 bit } prLamB_buf1b_we0 { O 1 bit } prLamB_buf1b_d0 { O 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLamB_buf1b'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2910 \
    name prLamC_buf1 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename prLamC_buf1 \
    op interface \
    ports { prLamC_buf1_address0 { O 10 vector } prLamC_buf1_ce0 { O 1 bit } prLamC_buf1_we0 { O 1 bit } prLamC_buf1_d0 { O 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLamC_buf1'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2911 \
    name prLam2B_buf1 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename prLam2B_buf1 \
    op interface \
    ports { prLam2B_buf1_address0 { O 10 vector } prLam2B_buf1_ce0 { O 1 bit } prLam2B_buf1_we0 { O 1 bit } prLam2B_buf1_d0 { O 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLam2B_buf1'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2912 \
    name prLam2B_buf1a \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename prLam2B_buf1a \
    op interface \
    ports { prLam2B_buf1a_address0 { O 10 vector } prLam2B_buf1a_ce0 { O 1 bit } prLam2B_buf1a_we0 { O 1 bit } prLam2B_buf1a_d0 { O 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLam2B_buf1a'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2913 \
    name prLam2B_buf1b \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename prLam2B_buf1b \
    op interface \
    ports { prLam2B_buf1b_address0 { O 10 vector } prLam2B_buf1b_ce0 { O 1 bit } prLam2B_buf1b_we0 { O 1 bit } prLam2B_buf1b_d0 { O 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLam2B_buf1b'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2914 \
    name prLam2C_buf1 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename prLam2C_buf1 \
    op interface \
    ports { prLam2C_buf1_address0 { O 10 vector } prLam2C_buf1_ce0 { O 1 bit } prLam2C_buf1_we0 { O 1 bit } prLam2C_buf1_d0 { O 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLam2C_buf1'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2916 \
    name Lam_buf2 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename Lam_buf2 \
    op interface \
    ports { Lam_buf2_address0 { O 10 vector } Lam_buf2_ce0 { O 1 bit } Lam_buf2_we0 { O 1 bit } Lam_buf2_d0 { O 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'Lam_buf2'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2917 \
    name Lam_bufA2a \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename Lam_bufA2a \
    op interface \
    ports { Lam_bufA2a_address0 { O 10 vector } Lam_bufA2a_ce0 { O 1 bit } Lam_bufA2a_we0 { O 1 bit } Lam_bufA2a_d0 { O 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'Lam_bufA2a'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2918 \
    name Lam_bufA2b \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename Lam_bufA2b \
    op interface \
    ports { Lam_bufA2b_address0 { O 10 vector } Lam_bufA2b_ce0 { O 1 bit } Lam_bufA2b_we0 { O 1 bit } Lam_bufA2b_d0 { O 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'Lam_bufA2b'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2919 \
    name Lam_bufA2c \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename Lam_bufA2c \
    op interface \
    ports { Lam_bufA2c_address0 { O 10 vector } Lam_bufA2c_ce0 { O 1 bit } Lam_bufA2c_we0 { O 1 bit } Lam_bufA2c_d0 { O 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'Lam_bufA2c'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2920 \
    name Lam_bufB2 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename Lam_bufB2 \
    op interface \
    ports { Lam_bufB2_address0 { O 10 vector } Lam_bufB2_ce0 { O 1 bit } Lam_bufB2_we0 { O 1 bit } Lam_bufB2_d0 { O 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'Lam_bufB2'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2921 \
    name prLam_buf2 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename prLam_buf2 \
    op interface \
    ports { prLam_buf2_address0 { O 10 vector } prLam_buf2_ce0 { O 1 bit } prLam_buf2_we0 { O 1 bit } prLam_buf2_d0 { O 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLam_buf2'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2922 \
    name prLamB_buf2 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename prLamB_buf2 \
    op interface \
    ports { prLamB_buf2_address0 { O 10 vector } prLamB_buf2_ce0 { O 1 bit } prLamB_buf2_we0 { O 1 bit } prLamB_buf2_d0 { O 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLamB_buf2'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2923 \
    name prLamC_buf2 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename prLamC_buf2 \
    op interface \
    ports { prLamC_buf2_address0 { O 10 vector } prLamC_buf2_ce0 { O 1 bit } prLamC_buf2_we0 { O 1 bit } prLamC_buf2_d0 { O 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLamC_buf2'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2924 \
    name prLamC_buf2a \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename prLamC_buf2a \
    op interface \
    ports { prLamC_buf2a_address0 { O 10 vector } prLamC_buf2a_ce0 { O 1 bit } prLamC_buf2a_we0 { O 1 bit } prLamC_buf2a_d0 { O 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLamC_buf2a'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2925 \
    name prLamC_buf2b \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename prLamC_buf2b \
    op interface \
    ports { prLamC_buf2b_address0 { O 10 vector } prLamC_buf2b_ce0 { O 1 bit } prLamC_buf2b_we0 { O 1 bit } prLamC_buf2b_d0 { O 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLamC_buf2b'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2926 \
    name prLam2_buf2 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename prLam2_buf2 \
    op interface \
    ports { prLam2_buf2_address0 { O 10 vector } prLam2_buf2_ce0 { O 1 bit } prLam2_buf2_we0 { O 1 bit } prLam2_buf2_d0 { O 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLam2_buf2'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2927 \
    name prLam2B_buf2 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename prLam2B_buf2 \
    op interface \
    ports { prLam2B_buf2_address0 { O 10 vector } prLam2B_buf2_ce0 { O 1 bit } prLam2B_buf2_we0 { O 1 bit } prLam2B_buf2_d0 { O 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLam2B_buf2'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2928 \
    name prLam2C_buf2 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename prLam2C_buf2 \
    op interface \
    ports { prLam2C_buf2_address0 { O 10 vector } prLam2C_buf2_ce0 { O 1 bit } prLam2C_buf2_we0 { O 1 bit } prLam2C_buf2_d0 { O 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLam2C_buf2'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2929 \
    name prLam2C_buf2a \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename prLam2C_buf2a \
    op interface \
    ports { prLam2C_buf2a_address0 { O 10 vector } prLam2C_buf2a_ce0 { O 1 bit } prLam2C_buf2a_we0 { O 1 bit } prLam2C_buf2a_d0 { O 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLam2C_buf2a'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2930 \
    name prLam2C_buf2b \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename prLam2C_buf2b \
    op interface \
    ports { prLam2C_buf2b_address0 { O 10 vector } prLam2C_buf2b_ce0 { O 1 bit } prLam2C_buf2b_we0 { O 1 bit } prLam2C_buf2b_d0 { O 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLam2C_buf2b'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2932 \
    name Lam_bufA3 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename Lam_bufA3 \
    op interface \
    ports { Lam_bufA3_address0 { O 10 vector } Lam_bufA3_ce0 { O 1 bit } Lam_bufA3_we0 { O 1 bit } Lam_bufA3_d0 { O 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'Lam_bufA3'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2933 \
    name Lam_bufB3a \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename Lam_bufB3a \
    op interface \
    ports { Lam_bufB3a_address0 { O 10 vector } Lam_bufB3a_ce0 { O 1 bit } Lam_bufB3a_we0 { O 1 bit } Lam_bufB3a_d0 { O 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'Lam_bufB3a'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2934 \
    name Lam_bufB3b \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename Lam_bufB3b \
    op interface \
    ports { Lam_bufB3b_address0 { O 10 vector } Lam_bufB3b_ce0 { O 1 bit } Lam_bufB3b_we0 { O 1 bit } Lam_bufB3b_d0 { O 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'Lam_bufB3b'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2935 \
    name Lam_bufB3c \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename Lam_bufB3c \
    op interface \
    ports { Lam_bufB3c_address0 { O 10 vector } Lam_bufB3c_ce0 { O 1 bit } Lam_bufB3c_we0 { O 1 bit } Lam_bufB3c_d0 { O 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'Lam_bufB3c'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2936 \
    name prLamB_buf3 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename prLamB_buf3 \
    op interface \
    ports { prLamB_buf3_address0 { O 10 vector } prLamB_buf3_ce0 { O 1 bit } prLamB_buf3_we0 { O 1 bit } prLamB_buf3_d0 { O 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLamB_buf3'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2937 \
    name prLamB_buf3a \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename prLamB_buf3a \
    op interface \
    ports { prLamB_buf3a_address0 { O 10 vector } prLamB_buf3a_ce0 { O 1 bit } prLamB_buf3a_we0 { O 1 bit } prLamB_buf3a_d0 { O 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLamB_buf3a'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2938 \
    name prLamB_buf3b \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename prLamB_buf3b \
    op interface \
    ports { prLamB_buf3b_address0 { O 10 vector } prLamB_buf3b_ce0 { O 1 bit } prLamB_buf3b_we0 { O 1 bit } prLamB_buf3b_d0 { O 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLamB_buf3b'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2939 \
    name prLamC_buf3 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename prLamC_buf3 \
    op interface \
    ports { prLamC_buf3_address0 { O 10 vector } prLamC_buf3_ce0 { O 1 bit } prLamC_buf3_we0 { O 1 bit } prLamC_buf3_d0 { O 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLamC_buf3'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2940 \
    name prLam2B_buf3 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename prLam2B_buf3 \
    op interface \
    ports { prLam2B_buf3_address0 { O 10 vector } prLam2B_buf3_ce0 { O 1 bit } prLam2B_buf3_we0 { O 1 bit } prLam2B_buf3_d0 { O 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLam2B_buf3'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2941 \
    name prLam2B_buf3a \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename prLam2B_buf3a \
    op interface \
    ports { prLam2B_buf3a_address0 { O 10 vector } prLam2B_buf3a_ce0 { O 1 bit } prLam2B_buf3a_we0 { O 1 bit } prLam2B_buf3a_d0 { O 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLam2B_buf3a'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2942 \
    name prLam2B_buf3b \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename prLam2B_buf3b \
    op interface \
    ports { prLam2B_buf3b_address0 { O 10 vector } prLam2B_buf3b_ce0 { O 1 bit } prLam2B_buf3b_we0 { O 1 bit } prLam2B_buf3b_d0 { O 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLam2B_buf3b'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2943 \
    name prLam2C_buf3 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename prLam2C_buf3 \
    op interface \
    ports { prLam2C_buf3_address0 { O 10 vector } prLam2C_buf3_ce0 { O 1 bit } prLam2C_buf3_we0 { O 1 bit } prLam2C_buf3_d0 { O 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLam2C_buf3'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2945 \
    name Lam_buf4 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename Lam_buf4 \
    op interface \
    ports { Lam_buf4_address0 { O 10 vector } Lam_buf4_ce0 { O 1 bit } Lam_buf4_we0 { O 1 bit } Lam_buf4_d0 { O 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'Lam_buf4'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2946 \
    name Lam_bufA4a \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename Lam_bufA4a \
    op interface \
    ports { Lam_bufA4a_address0 { O 10 vector } Lam_bufA4a_ce0 { O 1 bit } Lam_bufA4a_we0 { O 1 bit } Lam_bufA4a_d0 { O 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'Lam_bufA4a'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2947 \
    name Lam_bufA4b \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename Lam_bufA4b \
    op interface \
    ports { Lam_bufA4b_address0 { O 10 vector } Lam_bufA4b_ce0 { O 1 bit } Lam_bufA4b_we0 { O 1 bit } Lam_bufA4b_d0 { O 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'Lam_bufA4b'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2948 \
    name Lam_bufA4c \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename Lam_bufA4c \
    op interface \
    ports { Lam_bufA4c_address0 { O 10 vector } Lam_bufA4c_ce0 { O 1 bit } Lam_bufA4c_we0 { O 1 bit } Lam_bufA4c_d0 { O 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'Lam_bufA4c'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2949 \
    name Lam_bufB4 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename Lam_bufB4 \
    op interface \
    ports { Lam_bufB4_address0 { O 10 vector } Lam_bufB4_ce0 { O 1 bit } Lam_bufB4_we0 { O 1 bit } Lam_bufB4_d0 { O 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'Lam_bufB4'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2950 \
    name prLamB_buf4 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename prLamB_buf4 \
    op interface \
    ports { prLamB_buf4_address0 { O 10 vector } prLamB_buf4_ce0 { O 1 bit } prLamB_buf4_we0 { O 1 bit } prLamB_buf4_d0 { O 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLamB_buf4'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2951 \
    name prLamC_buf4 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename prLamC_buf4 \
    op interface \
    ports { prLamC_buf4_address0 { O 10 vector } prLamC_buf4_ce0 { O 1 bit } prLamC_buf4_we0 { O 1 bit } prLamC_buf4_d0 { O 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLamC_buf4'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2952 \
    name prLamC_buf4a \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename prLamC_buf4a \
    op interface \
    ports { prLamC_buf4a_address0 { O 10 vector } prLamC_buf4a_ce0 { O 1 bit } prLamC_buf4a_we0 { O 1 bit } prLamC_buf4a_d0 { O 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLamC_buf4a'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2953 \
    name prLamC_buf4b \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename prLamC_buf4b \
    op interface \
    ports { prLamC_buf4b_address0 { O 10 vector } prLamC_buf4b_ce0 { O 1 bit } prLamC_buf4b_we0 { O 1 bit } prLamC_buf4b_d0 { O 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLamC_buf4b'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2954 \
    name prLam2B_buf4 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename prLam2B_buf4 \
    op interface \
    ports { prLam2B_buf4_address0 { O 10 vector } prLam2B_buf4_ce0 { O 1 bit } prLam2B_buf4_we0 { O 1 bit } prLam2B_buf4_d0 { O 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLam2B_buf4'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2955 \
    name prLam2C_buf4 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename prLam2C_buf4 \
    op interface \
    ports { prLam2C_buf4_address0 { O 10 vector } prLam2C_buf4_ce0 { O 1 bit } prLam2C_buf4_we0 { O 1 bit } prLam2C_buf4_d0 { O 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLam2C_buf4'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2956 \
    name prLam2C_buf4a \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename prLam2C_buf4a \
    op interface \
    ports { prLam2C_buf4a_address0 { O 10 vector } prLam2C_buf4a_ce0 { O 1 bit } prLam2C_buf4a_we0 { O 1 bit } prLam2C_buf4a_d0 { O 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLam2C_buf4a'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2957 \
    name prLam2C_buf4b \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename prLam2C_buf4b \
    op interface \
    ports { prLam2C_buf4b_address0 { O 10 vector } prLam2C_buf4b_ce0 { O 1 bit } prLam2C_buf4b_we0 { O 1 bit } prLam2C_buf4b_d0 { O 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLam2C_buf4b'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2959 \
    name Lam_bufA5 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename Lam_bufA5 \
    op interface \
    ports { Lam_bufA5_address0 { O 10 vector } Lam_bufA5_ce0 { O 1 bit } Lam_bufA5_we0 { O 1 bit } Lam_bufA5_d0 { O 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'Lam_bufA5'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2960 \
    name Lam_bufB5a \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename Lam_bufB5a \
    op interface \
    ports { Lam_bufB5a_address0 { O 10 vector } Lam_bufB5a_ce0 { O 1 bit } Lam_bufB5a_we0 { O 1 bit } Lam_bufB5a_d0 { O 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'Lam_bufB5a'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2961 \
    name Lam_bufB5b \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename Lam_bufB5b \
    op interface \
    ports { Lam_bufB5b_address0 { O 10 vector } Lam_bufB5b_ce0 { O 1 bit } Lam_bufB5b_we0 { O 1 bit } Lam_bufB5b_d0 { O 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'Lam_bufB5b'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2962 \
    name Lam_bufB5c \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename Lam_bufB5c \
    op interface \
    ports { Lam_bufB5c_address0 { O 10 vector } Lam_bufB5c_ce0 { O 1 bit } Lam_bufB5c_we0 { O 1 bit } Lam_bufB5c_d0 { O 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'Lam_bufB5c'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2963 \
    name prLamB_buf5 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename prLamB_buf5 \
    op interface \
    ports { prLamB_buf5_address0 { O 10 vector } prLamB_buf5_ce0 { O 1 bit } prLamB_buf5_we0 { O 1 bit } prLamB_buf5_d0 { O 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLamB_buf5'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2964 \
    name prLamB_buf5a \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename prLamB_buf5a \
    op interface \
    ports { prLamB_buf5a_address0 { O 10 vector } prLamB_buf5a_ce0 { O 1 bit } prLamB_buf5a_we0 { O 1 bit } prLamB_buf5a_d0 { O 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLamB_buf5a'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2965 \
    name prLamB_buf5b \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename prLamB_buf5b \
    op interface \
    ports { prLamB_buf5b_address0 { O 10 vector } prLamB_buf5b_ce0 { O 1 bit } prLamB_buf5b_we0 { O 1 bit } prLamB_buf5b_d0 { O 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLamB_buf5b'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2966 \
    name prLamC_buf5 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename prLamC_buf5 \
    op interface \
    ports { prLamC_buf5_address0 { O 10 vector } prLamC_buf5_ce0 { O 1 bit } prLamC_buf5_we0 { O 1 bit } prLamC_buf5_d0 { O 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLamC_buf5'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2967 \
    name prLam2B_buf5 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename prLam2B_buf5 \
    op interface \
    ports { prLam2B_buf5_address0 { O 10 vector } prLam2B_buf5_ce0 { O 1 bit } prLam2B_buf5_we0 { O 1 bit } prLam2B_buf5_d0 { O 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLam2B_buf5'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2968 \
    name prLam2B_buf5a \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename prLam2B_buf5a \
    op interface \
    ports { prLam2B_buf5a_address0 { O 10 vector } prLam2B_buf5a_ce0 { O 1 bit } prLam2B_buf5a_we0 { O 1 bit } prLam2B_buf5a_d0 { O 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLam2B_buf5a'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2969 \
    name prLam2B_buf5b \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename prLam2B_buf5b \
    op interface \
    ports { prLam2B_buf5b_address0 { O 10 vector } prLam2B_buf5b_ce0 { O 1 bit } prLam2B_buf5b_we0 { O 1 bit } prLam2B_buf5b_d0 { O 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLam2B_buf5b'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2970 \
    name prLam2C_buf5 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename prLam2C_buf5 \
    op interface \
    ports { prLam2C_buf5_address0 { O 10 vector } prLam2C_buf5_ce0 { O 1 bit } prLam2C_buf5_we0 { O 1 bit } prLam2C_buf5_d0 { O 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLam2C_buf5'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2972 \
    name Lam_buf6 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename Lam_buf6 \
    op interface \
    ports { Lam_buf6_address0 { O 10 vector } Lam_buf6_ce0 { O 1 bit } Lam_buf6_we0 { O 1 bit } Lam_buf6_d0 { O 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'Lam_buf6'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2973 \
    name Lam_buf6a \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename Lam_buf6a \
    op interface \
    ports { Lam_buf6a_address0 { O 10 vector } Lam_buf6a_ce0 { O 1 bit } Lam_buf6a_we0 { O 1 bit } Lam_buf6a_d0 { O 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'Lam_buf6a'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2974 \
    name Lam_bufA6 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename Lam_bufA6 \
    op interface \
    ports { Lam_bufA6_address0 { O 10 vector } Lam_bufA6_ce0 { O 1 bit } Lam_bufA6_we0 { O 1 bit } Lam_bufA6_d0 { O 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'Lam_bufA6'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2975 \
    name Lam_bufA6b \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename Lam_bufA6b \
    op interface \
    ports { Lam_bufA6b_address0 { O 10 vector } Lam_bufA6b_ce0 { O 1 bit } Lam_bufA6b_we0 { O 1 bit } Lam_bufA6b_d0 { O 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'Lam_bufA6b'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2976 \
    name Lam_bufA6c \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename Lam_bufA6c \
    op interface \
    ports { Lam_bufA6c_address0 { O 10 vector } Lam_bufA6c_ce0 { O 1 bit } Lam_bufA6c_we0 { O 1 bit } Lam_bufA6c_d0 { O 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'Lam_bufA6c'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2977 \
    name Lam_bufB6 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename Lam_bufB6 \
    op interface \
    ports { Lam_bufB6_address0 { O 10 vector } Lam_bufB6_ce0 { O 1 bit } Lam_bufB6_we0 { O 1 bit } Lam_bufB6_d0 { O 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'Lam_bufB6'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2978 \
    name prLamB_buf6 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename prLamB_buf6 \
    op interface \
    ports { prLamB_buf6_address0 { O 10 vector } prLamB_buf6_ce0 { O 1 bit } prLamB_buf6_we0 { O 1 bit } prLamB_buf6_d0 { O 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLamB_buf6'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2979 \
    name prLamC_buf6 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename prLamC_buf6 \
    op interface \
    ports { prLamC_buf6_address0 { O 10 vector } prLamC_buf6_ce0 { O 1 bit } prLamC_buf6_we0 { O 1 bit } prLamC_buf6_d0 { O 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLamC_buf6'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2980 \
    name prLam2B_buf6 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename prLam2B_buf6 \
    op interface \
    ports { prLam2B_buf6_address0 { O 10 vector } prLam2B_buf6_ce0 { O 1 bit } prLam2B_buf6_we0 { O 1 bit } prLam2B_buf6_d0 { O 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLam2B_buf6'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2981 \
    name prLam2C_buf6 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename prLam2C_buf6 \
    op interface \
    ports { prLam2C_buf6_address0 { O 10 vector } prLam2C_buf6_ce0 { O 1 bit } prLam2C_buf6_we0 { O 1 bit } prLam2C_buf6_d0 { O 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLam2C_buf6'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2983 \
    name Lam_bufA7 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename Lam_bufA7 \
    op interface \
    ports { Lam_bufA7_address0 { O 10 vector } Lam_bufA7_ce0 { O 1 bit } Lam_bufA7_we0 { O 1 bit } Lam_bufA7_d0 { O 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'Lam_bufA7'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2984 \
    name Lam_bufB7a \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename Lam_bufB7a \
    op interface \
    ports { Lam_bufB7a_address0 { O 10 vector } Lam_bufB7a_ce0 { O 1 bit } Lam_bufB7a_we0 { O 1 bit } Lam_bufB7a_d0 { O 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'Lam_bufB7a'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2985 \
    name Lam_bufB7b \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename Lam_bufB7b \
    op interface \
    ports { Lam_bufB7b_address0 { O 10 vector } Lam_bufB7b_ce0 { O 1 bit } Lam_bufB7b_we0 { O 1 bit } Lam_bufB7b_d0 { O 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'Lam_bufB7b'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2986 \
    name prLamB_buf7 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename prLamB_buf7 \
    op interface \
    ports { prLamB_buf7_address0 { O 10 vector } prLamB_buf7_ce0 { O 1 bit } prLamB_buf7_we0 { O 1 bit } prLamB_buf7_d0 { O 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLamB_buf7'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2987 \
    name prLamB_buf7a \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename prLamB_buf7a \
    op interface \
    ports { prLamB_buf7a_address0 { O 10 vector } prLamB_buf7a_ce0 { O 1 bit } prLamB_buf7a_we0 { O 1 bit } prLamB_buf7a_d0 { O 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLamB_buf7a'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2988 \
    name prLamC_buf7 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename prLamC_buf7 \
    op interface \
    ports { prLamC_buf7_address0 { O 10 vector } prLamC_buf7_ce0 { O 1 bit } prLamC_buf7_we0 { O 1 bit } prLamC_buf7_d0 { O 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLamC_buf7'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2989 \
    name prLam2B_buf7 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename prLam2B_buf7 \
    op interface \
    ports { prLam2B_buf7_address0 { O 10 vector } prLam2B_buf7_ce0 { O 1 bit } prLam2B_buf7_we0 { O 1 bit } prLam2B_buf7_d0 { O 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLam2B_buf7'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2990 \
    name prLam2B_buf7a \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename prLam2B_buf7a \
    op interface \
    ports { prLam2B_buf7a_address0 { O 10 vector } prLam2B_buf7a_ce0 { O 1 bit } prLam2B_buf7a_we0 { O 1 bit } prLam2B_buf7a_d0 { O 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLam2B_buf7a'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2991 \
    name prLam2C_buf7 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename prLam2C_buf7 \
    op interface \
    ports { prLam2C_buf7_address0 { O 10 vector } prLam2C_buf7_ce0 { O 1 bit } prLam2C_buf7_we0 { O 1 bit } prLam2C_buf7_d0 { O 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLam2C_buf7'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2993 \
    name Lam_buf8 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename Lam_buf8 \
    op interface \
    ports { Lam_buf8_address0 { O 10 vector } Lam_buf8_ce0 { O 1 bit } Lam_buf8_we0 { O 1 bit } Lam_buf8_d0 { O 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'Lam_buf8'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2995 \
    name Lam_bufA9 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename Lam_bufA9 \
    op interface \
    ports { Lam_bufA9_address0 { O 10 vector } Lam_bufA9_ce0 { O 1 bit } Lam_bufA9_we0 { O 1 bit } Lam_bufA9_d0 { O 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'Lam_bufA9'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2996 \
    name Lam_bufB9a \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename Lam_bufB9a \
    op interface \
    ports { Lam_bufB9a_address0 { O 10 vector } Lam_bufB9a_ce0 { O 1 bit } Lam_bufB9a_we0 { O 1 bit } Lam_bufB9a_d0 { O 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'Lam_bufB9a'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2997 \
    name Lam_bufB9b \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename Lam_bufB9b \
    op interface \
    ports { Lam_bufB9b_address0 { O 10 vector } Lam_bufB9b_ce0 { O 1 bit } Lam_bufB9b_we0 { O 1 bit } Lam_bufB9b_d0 { O 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'Lam_bufB9b'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2998 \
    name prLamB_buf9 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename prLamB_buf9 \
    op interface \
    ports { prLamB_buf9_address0 { O 10 vector } prLamB_buf9_ce0 { O 1 bit } prLamB_buf9_we0 { O 1 bit } prLamB_buf9_d0 { O 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLamB_buf9'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2999 \
    name prLamB_buf9a \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename prLamB_buf9a \
    op interface \
    ports { prLamB_buf9a_address0 { O 10 vector } prLamB_buf9a_ce0 { O 1 bit } prLamB_buf9a_we0 { O 1 bit } prLamB_buf9a_d0 { O 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLamB_buf9a'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 3000 \
    name prLamC_buf9 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename prLamC_buf9 \
    op interface \
    ports { prLamC_buf9_address0 { O 10 vector } prLamC_buf9_ce0 { O 1 bit } prLamC_buf9_we0 { O 1 bit } prLamC_buf9_d0 { O 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLamC_buf9'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 3001 \
    name prLam2B_buf9 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename prLam2B_buf9 \
    op interface \
    ports { prLam2B_buf9_address0 { O 10 vector } prLam2B_buf9_ce0 { O 1 bit } prLam2B_buf9_we0 { O 1 bit } prLam2B_buf9_d0 { O 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLam2B_buf9'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 3002 \
    name prLam2B_buf9a \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename prLam2B_buf9a \
    op interface \
    ports { prLam2B_buf9a_address0 { O 10 vector } prLam2B_buf9a_ce0 { O 1 bit } prLam2B_buf9a_we0 { O 1 bit } prLam2B_buf9a_d0 { O 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLam2B_buf9a'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 3003 \
    name prLam2C_buf9 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename prLam2C_buf9 \
    op interface \
    ports { prLam2C_buf9_address0 { O 10 vector } prLam2C_buf9_ce0 { O 1 bit } prLam2C_buf9_we0 { O 1 bit } prLam2C_buf9_d0 { O 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLam2C_buf9'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 3005 \
    name Lam_buf10 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename Lam_buf10 \
    op interface \
    ports { Lam_buf10_address0 { O 10 vector } Lam_buf10_ce0 { O 1 bit } Lam_buf10_we0 { O 1 bit } Lam_buf10_d0 { O 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'Lam_buf10'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 3006 \
    name Lam_buf10a \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename Lam_buf10a \
    op interface \
    ports { Lam_buf10a_address0 { O 10 vector } Lam_buf10a_ce0 { O 1 bit } Lam_buf10a_we0 { O 1 bit } Lam_buf10a_d0 { O 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'Lam_buf10a'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 3007 \
    name Lam_bufA10a \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename Lam_bufA10a \
    op interface \
    ports { Lam_bufA10a_address0 { O 10 vector } Lam_bufA10a_ce0 { O 1 bit } Lam_bufA10a_we0 { O 1 bit } Lam_bufA10a_d0 { O 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'Lam_bufA10a'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 3008 \
    name Lam_bufA10b \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename Lam_bufA10b \
    op interface \
    ports { Lam_bufA10b_address0 { O 10 vector } Lam_bufA10b_ce0 { O 1 bit } Lam_bufA10b_we0 { O 1 bit } Lam_bufA10b_d0 { O 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'Lam_bufA10b'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 3009 \
    name Lam_bufA10c \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename Lam_bufA10c \
    op interface \
    ports { Lam_bufA10c_address0 { O 10 vector } Lam_bufA10c_ce0 { O 1 bit } Lam_bufA10c_we0 { O 1 bit } Lam_bufA10c_d0 { O 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'Lam_bufA10c'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 3010 \
    name Lam_bufB10 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename Lam_bufB10 \
    op interface \
    ports { Lam_bufB10_address0 { O 10 vector } Lam_bufB10_ce0 { O 1 bit } Lam_bufB10_we0 { O 1 bit } Lam_bufB10_d0 { O 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'Lam_bufB10'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 3011 \
    name prLam_buf4 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename prLam_buf4 \
    op interface \
    ports { prLam_buf4_address0 { O 10 vector } prLam_buf4_ce0 { O 1 bit } prLam_buf4_we0 { O 1 bit } prLam_buf4_d0 { O 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLam_buf4'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 3012 \
    name prLam_buf4a \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename prLam_buf4a \
    op interface \
    ports { prLam_buf4a_address0 { O 10 vector } prLam_buf4a_ce0 { O 1 bit } prLam_buf4a_we0 { O 1 bit } prLam_buf4a_d0 { O 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLam_buf4a'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 3013 \
    name prLamB_buf10 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename prLamB_buf10 \
    op interface \
    ports { prLamB_buf10_address0 { O 10 vector } prLamB_buf10_ce0 { O 1 bit } prLamB_buf10_we0 { O 1 bit } prLamB_buf10_d0 { O 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLamB_buf10'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 3014 \
    name prLamC_buf10 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename prLamC_buf10 \
    op interface \
    ports { prLamC_buf10_address0 { O 10 vector } prLamC_buf10_ce0 { O 1 bit } prLamC_buf10_we0 { O 1 bit } prLamC_buf10_d0 { O 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLamC_buf10'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 3015 \
    name prLamC_buf10a \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename prLamC_buf10a \
    op interface \
    ports { prLamC_buf10a_address0 { O 10 vector } prLamC_buf10a_ce0 { O 1 bit } prLamC_buf10a_we0 { O 1 bit } prLamC_buf10a_d0 { O 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLamC_buf10a'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 3016 \
    name prLamC_buf10b \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename prLamC_buf10b \
    op interface \
    ports { prLamC_buf10b_address0 { O 10 vector } prLamC_buf10b_ce0 { O 1 bit } prLamC_buf10b_we0 { O 1 bit } prLamC_buf10b_d0 { O 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLamC_buf10b'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 3017 \
    name prLam2_buf4 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename prLam2_buf4 \
    op interface \
    ports { prLam2_buf4_address0 { O 10 vector } prLam2_buf4_ce0 { O 1 bit } prLam2_buf4_we0 { O 1 bit } prLam2_buf4_d0 { O 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLam2_buf4'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 3018 \
    name prLam2_buf4a \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename prLam2_buf4a \
    op interface \
    ports { prLam2_buf4a_address0 { O 10 vector } prLam2_buf4a_ce0 { O 1 bit } prLam2_buf4a_we0 { O 1 bit } prLam2_buf4a_d0 { O 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLam2_buf4a'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 3019 \
    name prLam2B_buf10 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename prLam2B_buf10 \
    op interface \
    ports { prLam2B_buf10_address0 { O 10 vector } prLam2B_buf10_ce0 { O 1 bit } prLam2B_buf10_we0 { O 1 bit } prLam2B_buf10_d0 { O 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLam2B_buf10'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 3020 \
    name prLam2C_buf10 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename prLam2C_buf10 \
    op interface \
    ports { prLam2C_buf10_address0 { O 10 vector } prLam2C_buf10_ce0 { O 1 bit } prLam2C_buf10_we0 { O 1 bit } prLam2C_buf10_d0 { O 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLam2C_buf10'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 3021 \
    name prLam2C_buf10a \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename prLam2C_buf10a \
    op interface \
    ports { prLam2C_buf10a_address0 { O 10 vector } prLam2C_buf10a_ce0 { O 1 bit } prLam2C_buf10a_we0 { O 1 bit } prLam2C_buf10a_d0 { O 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLam2C_buf10a'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 3022 \
    name prLam2C_buf10b \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename prLam2C_buf10b \
    op interface \
    ports { prLam2C_buf10b_address0 { O 10 vector } prLam2C_buf10b_ce0 { O 1 bit } prLam2C_buf10b_we0 { O 1 bit } prLam2C_buf10b_d0 { O 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLam2C_buf10b'"
}
}


# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2888 \
    name pos_r \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_pos_r \
    op interface \
    ports { pos_r { I 13 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2889 \
    name pest0 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_pest0 \
    op interface \
    ports { pest0 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2902 \
    name pest1 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_pest1 \
    op interface \
    ports { pest1 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2915 \
    name pest2 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_pest2 \
    op interface \
    ports { pest2 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2931 \
    name pest3 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_pest3 \
    op interface \
    ports { pest3 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2944 \
    name pest4 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_pest4 \
    op interface \
    ports { pest4 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2958 \
    name pest5 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_pest5 \
    op interface \
    ports { pest5 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2971 \
    name pest6 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_pest6 \
    op interface \
    ports { pest6 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2982 \
    name pest7 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_pest7 \
    op interface \
    ports { pest7 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2992 \
    name pest8 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_pest8 \
    op interface \
    ports { pest8 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2994 \
    name pest9 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_pest9 \
    op interface \
    ports { pest9 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3004 \
    name pest10 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_pest10 \
    op interface \
    ports { pest10 { I 16 vector } } \
} "
}



# merge
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_end
    cg_default_interface_gen_bundle_end
    AESL_LIB_XILADAPTER::native_axis_end
}


