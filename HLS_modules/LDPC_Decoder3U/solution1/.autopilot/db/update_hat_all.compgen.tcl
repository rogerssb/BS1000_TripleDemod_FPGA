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
    id 3025 \
    name prHat_buf \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename prHat_buf \
    op interface \
    ports { prHat_buf_address1 { O 11 vector } prHat_buf_ce1 { O 1 bit } prHat_buf_we1 { O 1 bit } prHat_buf_d1 { O 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prHat_buf'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 3026 \
    name prHat_bufA \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename prHat_bufA \
    op interface \
    ports { prHat_bufA_address1 { O 11 vector } prHat_bufA_ce1 { O 1 bit } prHat_bufA_we1 { O 1 bit } prHat_bufA_d1 { O 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prHat_bufA'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 3027 \
    name prHat_bufAa \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename prHat_bufAa \
    op interface \
    ports { prHat_bufAa_address1 { O 11 vector } prHat_bufAa_ce1 { O 1 bit } prHat_bufAa_we1 { O 1 bit } prHat_bufAa_d1 { O 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prHat_bufAa'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 3028 \
    name prHat_bufAb \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename prHat_bufAb \
    op interface \
    ports { prHat_bufAb_address1 { O 11 vector } prHat_bufAb_ce1 { O 1 bit } prHat_bufAb_we1 { O 1 bit } prHat_bufAb_d1 { O 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prHat_bufAb'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 3029 \
    name prHat_bufAc \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename prHat_bufAc \
    op interface \
    ports { prHat_bufAc_address1 { O 11 vector } prHat_bufAc_ce1 { O 1 bit } prHat_bufAc_we1 { O 1 bit } prHat_bufAc_d1 { O 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prHat_bufAc'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 3030 \
    name prHat_bufB \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename prHat_bufB \
    op interface \
    ports { prHat_bufB_address1 { O 11 vector } prHat_bufB_ce1 { O 1 bit } prHat_bufB_we1 { O 1 bit } prHat_bufB_d1 { O 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prHat_bufB'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 3032 \
    name prHat_buf1 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename prHat_buf1 \
    op interface \
    ports { prHat_buf1_address1 { O 11 vector } prHat_buf1_ce1 { O 1 bit } prHat_buf1_we1 { O 1 bit } prHat_buf1_d1 { O 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prHat_buf1'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 3033 \
    name prHat_bufA1 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename prHat_bufA1 \
    op interface \
    ports { prHat_bufA1_address1 { O 11 vector } prHat_bufA1_ce1 { O 1 bit } prHat_bufA1_we1 { O 1 bit } prHat_bufA1_d1 { O 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prHat_bufA1'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 3034 \
    name prHat_bufB1 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename prHat_bufB1 \
    op interface \
    ports { prHat_bufB1_address1 { O 11 vector } prHat_bufB1_ce1 { O 1 bit } prHat_bufB1_we1 { O 1 bit } prHat_bufB1_d1 { O 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prHat_bufB1'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 3035 \
    name prHat_bufB1a \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename prHat_bufB1a \
    op interface \
    ports { prHat_bufB1a_address1 { O 11 vector } prHat_bufB1a_ce1 { O 1 bit } prHat_bufB1a_we1 { O 1 bit } prHat_bufB1a_d1 { O 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prHat_bufB1a'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 3036 \
    name prHat_bufB1b \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename prHat_bufB1b \
    op interface \
    ports { prHat_bufB1b_address1 { O 11 vector } prHat_bufB1b_ce1 { O 1 bit } prHat_bufB1b_we1 { O 1 bit } prHat_bufB1b_d1 { O 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prHat_bufB1b'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 3037 \
    name prHat_bufB1c \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename prHat_bufB1c \
    op interface \
    ports { prHat_bufB1c_address1 { O 11 vector } prHat_bufB1c_ce1 { O 1 bit } prHat_bufB1c_we1 { O 1 bit } prHat_bufB1c_d1 { O 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prHat_bufB1c'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 3039 \
    name prHat_buf2 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename prHat_buf2 \
    op interface \
    ports { prHat_buf2_address1 { O 11 vector } prHat_buf2_ce1 { O 1 bit } prHat_buf2_we1 { O 1 bit } prHat_buf2_d1 { O 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prHat_buf2'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 3040 \
    name prHat_bufA2 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename prHat_bufA2 \
    op interface \
    ports { prHat_bufA2_address1 { O 11 vector } prHat_bufA2_ce1 { O 1 bit } prHat_bufA2_we1 { O 1 bit } prHat_bufA2_d1 { O 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prHat_bufA2'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 3041 \
    name prHat_bufA2a \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename prHat_bufA2a \
    op interface \
    ports { prHat_bufA2a_address1 { O 11 vector } prHat_bufA2a_ce1 { O 1 bit } prHat_bufA2a_we1 { O 1 bit } prHat_bufA2a_d1 { O 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prHat_bufA2a'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 3042 \
    name prHat_bufA2b \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename prHat_bufA2b \
    op interface \
    ports { prHat_bufA2b_address1 { O 11 vector } prHat_bufA2b_ce1 { O 1 bit } prHat_bufA2b_we1 { O 1 bit } prHat_bufA2b_d1 { O 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prHat_bufA2b'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 3043 \
    name prHat_bufA2c \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename prHat_bufA2c \
    op interface \
    ports { prHat_bufA2c_address1 { O 11 vector } prHat_bufA2c_ce1 { O 1 bit } prHat_bufA2c_we1 { O 1 bit } prHat_bufA2c_d1 { O 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prHat_bufA2c'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 3044 \
    name prHat_bufB2 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename prHat_bufB2 \
    op interface \
    ports { prHat_bufB2_address1 { O 11 vector } prHat_bufB2_ce1 { O 1 bit } prHat_bufB2_we1 { O 1 bit } prHat_bufB2_d1 { O 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prHat_bufB2'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 3046 \
    name prHat_buf3 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename prHat_buf3 \
    op interface \
    ports { prHat_buf3_address1 { O 11 vector } prHat_buf3_ce1 { O 1 bit } prHat_buf3_we1 { O 1 bit } prHat_buf3_d1 { O 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prHat_buf3'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 3047 \
    name prHat_bufA3 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename prHat_bufA3 \
    op interface \
    ports { prHat_bufA3_address1 { O 11 vector } prHat_bufA3_ce1 { O 1 bit } prHat_bufA3_we1 { O 1 bit } prHat_bufA3_d1 { O 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prHat_bufA3'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 3048 \
    name prHat_bufB3 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename prHat_bufB3 \
    op interface \
    ports { prHat_bufB3_address1 { O 11 vector } prHat_bufB3_ce1 { O 1 bit } prHat_bufB3_we1 { O 1 bit } prHat_bufB3_d1 { O 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prHat_bufB3'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 3049 \
    name prHat_bufB3a \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename prHat_bufB3a \
    op interface \
    ports { prHat_bufB3a_address1 { O 11 vector } prHat_bufB3a_ce1 { O 1 bit } prHat_bufB3a_we1 { O 1 bit } prHat_bufB3a_d1 { O 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prHat_bufB3a'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 3050 \
    name prHat_bufB3b \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename prHat_bufB3b \
    op interface \
    ports { prHat_bufB3b_address1 { O 11 vector } prHat_bufB3b_ce1 { O 1 bit } prHat_bufB3b_we1 { O 1 bit } prHat_bufB3b_d1 { O 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prHat_bufB3b'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 3051 \
    name prHat_bufB3c \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename prHat_bufB3c \
    op interface \
    ports { prHat_bufB3c_address1 { O 11 vector } prHat_bufB3c_ce1 { O 1 bit } prHat_bufB3c_we1 { O 1 bit } prHat_bufB3c_d1 { O 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prHat_bufB3c'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 3053 \
    name prHat_buf4 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename prHat_buf4 \
    op interface \
    ports { prHat_buf4_address1 { O 11 vector } prHat_buf4_ce1 { O 1 bit } prHat_buf4_we1 { O 1 bit } prHat_buf4_d1 { O 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prHat_buf4'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 3054 \
    name prHat_buf4a \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename prHat_buf4a \
    op interface \
    ports { prHat_buf4a_address1 { O 11 vector } prHat_buf4a_ce1 { O 1 bit } prHat_buf4a_we1 { O 1 bit } prHat_buf4a_d1 { O 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prHat_buf4a'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 3055 \
    name prHat_bufA4 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename prHat_bufA4 \
    op interface \
    ports { prHat_bufA4_address1 { O 11 vector } prHat_bufA4_ce1 { O 1 bit } prHat_bufA4_we1 { O 1 bit } prHat_bufA4_d1 { O 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prHat_bufA4'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 3056 \
    name prHat_bufA4a \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename prHat_bufA4a \
    op interface \
    ports { prHat_bufA4a_address1 { O 11 vector } prHat_bufA4a_ce1 { O 1 bit } prHat_bufA4a_we1 { O 1 bit } prHat_bufA4a_d1 { O 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prHat_bufA4a'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 3057 \
    name prHat_bufA4b \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename prHat_bufA4b \
    op interface \
    ports { prHat_bufA4b_address1 { O 11 vector } prHat_bufA4b_ce1 { O 1 bit } prHat_bufA4b_we1 { O 1 bit } prHat_bufA4b_d1 { O 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prHat_bufA4b'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 3058 \
    name prHat_bufB4 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename prHat_bufB4 \
    op interface \
    ports { prHat_bufB4_address1 { O 11 vector } prHat_bufB4_ce1 { O 1 bit } prHat_bufB4_we1 { O 1 bit } prHat_bufB4_d1 { O 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prHat_bufB4'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 3060 \
    name prHat_bufA5 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename prHat_bufA5 \
    op interface \
    ports { prHat_bufA5_address1 { O 11 vector } prHat_bufA5_ce1 { O 1 bit } prHat_bufA5_we1 { O 1 bit } prHat_bufA5_d1 { O 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prHat_bufA5'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 3061 \
    name prHat_bufB5 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename prHat_bufB5 \
    op interface \
    ports { prHat_bufB5_address1 { O 11 vector } prHat_bufB5_ce1 { O 1 bit } prHat_bufB5_we1 { O 1 bit } prHat_bufB5_d1 { O 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prHat_bufB5'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 3062 \
    name prHat_bufB5a \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename prHat_bufB5a \
    op interface \
    ports { prHat_bufB5a_address1 { O 11 vector } prHat_bufB5a_ce1 { O 1 bit } prHat_bufB5a_we1 { O 1 bit } prHat_bufB5a_d1 { O 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prHat_bufB5a'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 3063 \
    name prHat_bufB5b \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename prHat_bufB5b \
    op interface \
    ports { prHat_bufB5b_address1 { O 11 vector } prHat_bufB5b_ce1 { O 1 bit } prHat_bufB5b_we1 { O 1 bit } prHat_bufB5b_d1 { O 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prHat_bufB5b'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 3064 \
    name prHat_bufB5c \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename prHat_bufB5c \
    op interface \
    ports { prHat_bufB5c_address1 { O 11 vector } prHat_bufB5c_ce1 { O 1 bit } prHat_bufB5c_we1 { O 1 bit } prHat_bufB5c_d1 { O 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prHat_bufB5c'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 3066 \
    name prHat_buf6 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename prHat_buf6 \
    op interface \
    ports { prHat_buf6_address1 { O 11 vector } prHat_buf6_ce1 { O 1 bit } prHat_buf6_we1 { O 1 bit } prHat_buf6_d1 { O 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prHat_buf6'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 3067 \
    name prHat_buf6a \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename prHat_buf6a \
    op interface \
    ports { prHat_buf6a_address1 { O 11 vector } prHat_buf6a_ce1 { O 1 bit } prHat_buf6a_we1 { O 1 bit } prHat_buf6a_d1 { O 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prHat_buf6a'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 3068 \
    name prHat_bufA6 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename prHat_bufA6 \
    op interface \
    ports { prHat_bufA6_address1 { O 11 vector } prHat_bufA6_ce1 { O 1 bit } prHat_bufA6_we1 { O 1 bit } prHat_bufA6_d1 { O 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prHat_bufA6'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 3069 \
    name prHat_bufA6a \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename prHat_bufA6a \
    op interface \
    ports { prHat_bufA6a_address1 { O 11 vector } prHat_bufA6a_ce1 { O 1 bit } prHat_bufA6a_we1 { O 1 bit } prHat_bufA6a_d1 { O 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prHat_bufA6a'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 3070 \
    name prHat_bufA6b \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename prHat_bufA6b \
    op interface \
    ports { prHat_bufA6b_address1 { O 11 vector } prHat_bufA6b_ce1 { O 1 bit } prHat_bufA6b_we1 { O 1 bit } prHat_bufA6b_d1 { O 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prHat_bufA6b'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 3071 \
    name prHat_bufA6c \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename prHat_bufA6c \
    op interface \
    ports { prHat_bufA6c_address1 { O 11 vector } prHat_bufA6c_ce1 { O 1 bit } prHat_bufA6c_we1 { O 1 bit } prHat_bufA6c_d1 { O 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prHat_bufA6c'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 3072 \
    name prHat_bufB6 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename prHat_bufB6 \
    op interface \
    ports { prHat_bufB6_address1 { O 11 vector } prHat_bufB6_ce1 { O 1 bit } prHat_bufB6_we1 { O 1 bit } prHat_bufB6_d1 { O 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prHat_bufB6'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 3074 \
    name prHat_bufA7 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename prHat_bufA7 \
    op interface \
    ports { prHat_bufA7_address1 { O 11 vector } prHat_bufA7_ce1 { O 1 bit } prHat_bufA7_we1 { O 1 bit } prHat_bufA7_d1 { O 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prHat_bufA7'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 3075 \
    name prHat_bufB7 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename prHat_bufB7 \
    op interface \
    ports { prHat_bufB7_address1 { O 11 vector } prHat_bufB7_ce1 { O 1 bit } prHat_bufB7_we1 { O 1 bit } prHat_bufB7_d1 { O 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prHat_bufB7'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 3076 \
    name prHat_bufB7a \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename prHat_bufB7a \
    op interface \
    ports { prHat_bufB7a_address1 { O 11 vector } prHat_bufB7a_ce1 { O 1 bit } prHat_bufB7a_we1 { O 1 bit } prHat_bufB7a_d1 { O 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prHat_bufB7a'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 3078 \
    name prHat_buf8 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename prHat_buf8 \
    op interface \
    ports { prHat_buf8_address1 { O 11 vector } prHat_buf8_ce1 { O 1 bit } prHat_buf8_we1 { O 1 bit } prHat_buf8_d1 { O 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prHat_buf8'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 3080 \
    name prHat_bufA9 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename prHat_bufA9 \
    op interface \
    ports { prHat_bufA9_address1 { O 11 vector } prHat_bufA9_ce1 { O 1 bit } prHat_bufA9_we1 { O 1 bit } prHat_bufA9_d1 { O 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prHat_bufA9'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 3081 \
    name prHat_bufB9 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename prHat_bufB9 \
    op interface \
    ports { prHat_bufB9_address1 { O 11 vector } prHat_bufB9_ce1 { O 1 bit } prHat_bufB9_we1 { O 1 bit } prHat_bufB9_d1 { O 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prHat_bufB9'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 3082 \
    name prHat_bufB9a \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename prHat_bufB9a \
    op interface \
    ports { prHat_bufB9a_address1 { O 11 vector } prHat_bufB9a_ce1 { O 1 bit } prHat_bufB9a_we1 { O 1 bit } prHat_bufB9a_d1 { O 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prHat_bufB9a'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 3084 \
    name prHat_buf10 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename prHat_buf10 \
    op interface \
    ports { prHat_buf10_address1 { O 11 vector } prHat_buf10_ce1 { O 1 bit } prHat_buf10_we1 { O 1 bit } prHat_buf10_d1 { O 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prHat_buf10'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 3085 \
    name prHat_buf10a \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename prHat_buf10a \
    op interface \
    ports { prHat_buf10a_address1 { O 11 vector } prHat_buf10a_ce1 { O 1 bit } prHat_buf10a_we1 { O 1 bit } prHat_buf10a_d1 { O 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prHat_buf10a'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 3086 \
    name prHat_bufA10 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename prHat_bufA10 \
    op interface \
    ports { prHat_bufA10_address1 { O 11 vector } prHat_bufA10_ce1 { O 1 bit } prHat_bufA10_we1 { O 1 bit } prHat_bufA10_d1 { O 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prHat_bufA10'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 3087 \
    name prHat_bufA10a \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename prHat_bufA10a \
    op interface \
    ports { prHat_bufA10a_address1 { O 11 vector } prHat_bufA10a_ce1 { O 1 bit } prHat_bufA10a_we1 { O 1 bit } prHat_bufA10a_d1 { O 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prHat_bufA10a'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 3088 \
    name prHat_bufA10b \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename prHat_bufA10b \
    op interface \
    ports { prHat_bufA10b_address1 { O 11 vector } prHat_bufA10b_ce1 { O 1 bit } prHat_bufA10b_we1 { O 1 bit } prHat_bufA10b_d1 { O 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prHat_bufA10b'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 3089 \
    name prHat_bufA10c \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename prHat_bufA10c \
    op interface \
    ports { prHat_bufA10c_address1 { O 11 vector } prHat_bufA10c_ce1 { O 1 bit } prHat_bufA10c_we1 { O 1 bit } prHat_bufA10c_d1 { O 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prHat_bufA10c'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 3090 \
    name prHat_buf10b \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename prHat_buf10b \
    op interface \
    ports { prHat_buf10b_address1 { O 11 vector } prHat_buf10b_ce1 { O 1 bit } prHat_buf10b_we1 { O 1 bit } prHat_buf10b_d1 { O 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prHat_buf10b'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 3091 \
    name prHat_bufB10 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename prHat_bufB10 \
    op interface \
    ports { prHat_bufB10_address1 { O 11 vector } prHat_bufB10_ce1 { O 1 bit } prHat_bufB10_we1 { O 1 bit } prHat_bufB10_d1 { O 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prHat_bufB10'"
}
}


# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3023 \
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
    id 3024 \
    name bpest0 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_bpest0 \
    op interface \
    ports { bpest0 { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3031 \
    name bpest1 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_bpest1 \
    op interface \
    ports { bpest1 { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3038 \
    name bpest2 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_bpest2 \
    op interface \
    ports { bpest2 { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3045 \
    name bpest3 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_bpest3 \
    op interface \
    ports { bpest3 { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3052 \
    name bpest4 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_bpest4 \
    op interface \
    ports { bpest4 { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3059 \
    name bpest5 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_bpest5 \
    op interface \
    ports { bpest5 { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3065 \
    name bpest6 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_bpest6 \
    op interface \
    ports { bpest6 { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3073 \
    name bpest7 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_bpest7 \
    op interface \
    ports { bpest7 { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3077 \
    name bpest8 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_bpest8 \
    op interface \
    ports { bpest8 { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3079 \
    name bpest9 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_bpest9 \
    op interface \
    ports { bpest9 { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3083 \
    name bpest10 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_bpest10 \
    op interface \
    ports { bpest10 { I 1 vector } } \
} "
}



# merge
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_end
    cg_default_interface_gen_bundle_end
    AESL_LIB_XILADAPTER::native_axis_end
}


