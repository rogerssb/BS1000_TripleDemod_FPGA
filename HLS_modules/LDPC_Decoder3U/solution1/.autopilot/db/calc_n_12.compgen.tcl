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
    id 2297 \
    name pLambda0 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename pLambda0 \
    op interface \
    ports { pLambda0_address0 { O 11 vector } pLambda0_ce0 { O 1 bit } pLambda0_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'pLambda0'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2298 \
    name prLamB_buf \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename prLamB_buf \
    op interface \
    ports { prLamB_buf_address0 { O 10 vector } prLamB_buf_ce0 { O 1 bit } prLamB_buf_we0 { O 1 bit } prLamB_buf_d0 { O 16 vector } prLamB_buf_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLamB_buf'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2299 \
    name prLamC_buf \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename prLamC_buf \
    op interface \
    ports { prLamC_buf_address0 { O 10 vector } prLamC_buf_ce0 { O 1 bit } prLamC_buf_we0 { O 1 bit } prLamC_buf_d0 { O 16 vector } prLamC_buf_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLamC_buf'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2300 \
    name prLam2B_buf \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename prLam2B_buf \
    op interface \
    ports { prLam2B_buf_address0 { O 10 vector } prLam2B_buf_ce0 { O 1 bit } prLam2B_buf_we0 { O 1 bit } prLam2B_buf_d0 { O 16 vector } prLam2B_buf_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLam2B_buf'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2301 \
    name prLam2C_buf \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename prLam2C_buf \
    op interface \
    ports { prLam2C_buf_address0 { O 10 vector } prLam2C_buf_ce0 { O 1 bit } prLam2C_buf_we0 { O 1 bit } prLam2C_buf_d0 { O 16 vector } prLam2C_buf_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLam2C_buf'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2303 \
    name pLambda1 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename pLambda1 \
    op interface \
    ports { pLambda1_address0 { O 11 vector } pLambda1_ce0 { O 1 bit } pLambda1_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'pLambda1'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2304 \
    name prLamB_buf1 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename prLamB_buf1 \
    op interface \
    ports { prLamB_buf1_address0 { O 10 vector } prLamB_buf1_ce0 { O 1 bit } prLamB_buf1_we0 { O 1 bit } prLamB_buf1_d0 { O 16 vector } prLamB_buf1_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLamB_buf1'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2305 \
    name prLamB_buf1a \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename prLamB_buf1a \
    op interface \
    ports { prLamB_buf1a_address0 { O 10 vector } prLamB_buf1a_ce0 { O 1 bit } prLamB_buf1a_we0 { O 1 bit } prLamB_buf1a_d0 { O 16 vector } prLamB_buf1a_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLamB_buf1a'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2306 \
    name prLamC_buf1 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename prLamC_buf1 \
    op interface \
    ports { prLamC_buf1_address0 { O 10 vector } prLamC_buf1_ce0 { O 1 bit } prLamC_buf1_we0 { O 1 bit } prLamC_buf1_d0 { O 16 vector } prLamC_buf1_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLamC_buf1'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2307 \
    name prLam2B_buf1 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename prLam2B_buf1 \
    op interface \
    ports { prLam2B_buf1_address0 { O 10 vector } prLam2B_buf1_ce0 { O 1 bit } prLam2B_buf1_we0 { O 1 bit } prLam2B_buf1_d0 { O 16 vector } prLam2B_buf1_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLam2B_buf1'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2308 \
    name prLam2B_buf1a \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename prLam2B_buf1a \
    op interface \
    ports { prLam2B_buf1a_address0 { O 10 vector } prLam2B_buf1a_ce0 { O 1 bit } prLam2B_buf1a_we0 { O 1 bit } prLam2B_buf1a_d0 { O 16 vector } prLam2B_buf1a_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLam2B_buf1a'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2309 \
    name prLam2C_buf1 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename prLam2C_buf1 \
    op interface \
    ports { prLam2C_buf1_address0 { O 10 vector } prLam2C_buf1_ce0 { O 1 bit } prLam2C_buf1_we0 { O 1 bit } prLam2C_buf1_d0 { O 16 vector } prLam2C_buf1_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLam2C_buf1'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2311 \
    name pLambda2 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename pLambda2 \
    op interface \
    ports { pLambda2_address0 { O 11 vector } pLambda2_ce0 { O 1 bit } pLambda2_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'pLambda2'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2312 \
    name prLam_buf2 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename prLam_buf2 \
    op interface \
    ports { prLam_buf2_address0 { O 10 vector } prLam_buf2_ce0 { O 1 bit } prLam_buf2_we0 { O 1 bit } prLam_buf2_d0 { O 16 vector } prLam_buf2_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLam_buf2'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2313 \
    name prLam2_buf2 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename prLam2_buf2 \
    op interface \
    ports { prLam2_buf2_address0 { O 10 vector } prLam2_buf2_ce0 { O 1 bit } prLam2_buf2_we0 { O 1 bit } prLam2_buf2_d0 { O 16 vector } prLam2_buf2_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLam2_buf2'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2315 \
    name pLambda3 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename pLambda3 \
    op interface \
    ports { pLambda3_address0 { O 11 vector } pLambda3_ce0 { O 1 bit } pLambda3_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'pLambda3'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2316 \
    name prLamB_buf3 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename prLamB_buf3 \
    op interface \
    ports { prLamB_buf3_address0 { O 10 vector } prLamB_buf3_ce0 { O 1 bit } prLamB_buf3_we0 { O 1 bit } prLamB_buf3_d0 { O 16 vector } prLamB_buf3_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLamB_buf3'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2317 \
    name prLamB_buf3a \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename prLamB_buf3a \
    op interface \
    ports { prLamB_buf3a_address0 { O 10 vector } prLamB_buf3a_ce0 { O 1 bit } prLamB_buf3a_we0 { O 1 bit } prLamB_buf3a_d0 { O 16 vector } prLamB_buf3a_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLamB_buf3a'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2318 \
    name prLamC_buf3 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename prLamC_buf3 \
    op interface \
    ports { prLamC_buf3_address0 { O 10 vector } prLamC_buf3_ce0 { O 1 bit } prLamC_buf3_we0 { O 1 bit } prLamC_buf3_d0 { O 16 vector } prLamC_buf3_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLamC_buf3'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2319 \
    name prLam2B_buf3 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename prLam2B_buf3 \
    op interface \
    ports { prLam2B_buf3_address0 { O 10 vector } prLam2B_buf3_ce0 { O 1 bit } prLam2B_buf3_we0 { O 1 bit } prLam2B_buf3_d0 { O 16 vector } prLam2B_buf3_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLam2B_buf3'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2320 \
    name prLam2B_buf3a \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename prLam2B_buf3a \
    op interface \
    ports { prLam2B_buf3a_address0 { O 10 vector } prLam2B_buf3a_ce0 { O 1 bit } prLam2B_buf3a_we0 { O 1 bit } prLam2B_buf3a_d0 { O 16 vector } prLam2B_buf3a_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLam2B_buf3a'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2321 \
    name prLam2C_buf3 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename prLam2C_buf3 \
    op interface \
    ports { prLam2C_buf3_address0 { O 10 vector } prLam2C_buf3_ce0 { O 1 bit } prLam2C_buf3_we0 { O 1 bit } prLam2C_buf3_d0 { O 16 vector } prLam2C_buf3_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLam2C_buf3'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2323 \
    name pLambda4 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename pLambda4 \
    op interface \
    ports { pLambda4_address0 { O 11 vector } pLambda4_ce0 { O 1 bit } pLambda4_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'pLambda4'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2324 \
    name prLam_buf4 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename prLam_buf4 \
    op interface \
    ports { prLam_buf4_address0 { O 10 vector } prLam_buf4_ce0 { O 1 bit } prLam_buf4_we0 { O 1 bit } prLam_buf4_d0 { O 16 vector } prLam_buf4_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLam_buf4'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2325 \
    name prLam_buf4a \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename prLam_buf4a \
    op interface \
    ports { prLam_buf4a_address0 { O 10 vector } prLam_buf4a_ce0 { O 1 bit } prLam_buf4a_we0 { O 1 bit } prLam_buf4a_d0 { O 16 vector } prLam_buf4a_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLam_buf4a'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2326 \
    name prLamB_buf4 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename prLamB_buf4 \
    op interface \
    ports { prLamB_buf4_address0 { O 10 vector } prLamB_buf4_ce0 { O 1 bit } prLamB_buf4_we0 { O 1 bit } prLamB_buf4_d0 { O 16 vector } prLamB_buf4_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLamB_buf4'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2327 \
    name prLamC_buf4 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename prLamC_buf4 \
    op interface \
    ports { prLamC_buf4_address0 { O 10 vector } prLamC_buf4_ce0 { O 1 bit } prLamC_buf4_we0 { O 1 bit } prLamC_buf4_d0 { O 16 vector } prLamC_buf4_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLamC_buf4'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2328 \
    name prLamC_buf4a \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename prLamC_buf4a \
    op interface \
    ports { prLamC_buf4a_address0 { O 10 vector } prLamC_buf4a_ce0 { O 1 bit } prLamC_buf4a_we0 { O 1 bit } prLamC_buf4a_d0 { O 16 vector } prLamC_buf4a_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLamC_buf4a'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2329 \
    name prLamC_buf4b \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename prLamC_buf4b \
    op interface \
    ports { prLamC_buf4b_address0 { O 10 vector } prLamC_buf4b_ce0 { O 1 bit } prLamC_buf4b_we0 { O 1 bit } prLamC_buf4b_d0 { O 16 vector } prLamC_buf4b_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLamC_buf4b'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2330 \
    name prLam2_buf4 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename prLam2_buf4 \
    op interface \
    ports { prLam2_buf4_address0 { O 10 vector } prLam2_buf4_ce0 { O 1 bit } prLam2_buf4_we0 { O 1 bit } prLam2_buf4_d0 { O 16 vector } prLam2_buf4_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLam2_buf4'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2331 \
    name prLam2_buf4a \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename prLam2_buf4a \
    op interface \
    ports { prLam2_buf4a_address0 { O 10 vector } prLam2_buf4a_ce0 { O 1 bit } prLam2_buf4a_we0 { O 1 bit } prLam2_buf4a_d0 { O 16 vector } prLam2_buf4a_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLam2_buf4a'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2332 \
    name prLam2B_buf4 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename prLam2B_buf4 \
    op interface \
    ports { prLam2B_buf4_address0 { O 10 vector } prLam2B_buf4_ce0 { O 1 bit } prLam2B_buf4_we0 { O 1 bit } prLam2B_buf4_d0 { O 16 vector } prLam2B_buf4_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLam2B_buf4'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2333 \
    name prLam2C_buf4 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename prLam2C_buf4 \
    op interface \
    ports { prLam2C_buf4_address0 { O 10 vector } prLam2C_buf4_ce0 { O 1 bit } prLam2C_buf4_we0 { O 1 bit } prLam2C_buf4_d0 { O 16 vector } prLam2C_buf4_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLam2C_buf4'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2334 \
    name prLam2C_buf4a \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename prLam2C_buf4a \
    op interface \
    ports { prLam2C_buf4a_address0 { O 10 vector } prLam2C_buf4a_ce0 { O 1 bit } prLam2C_buf4a_we0 { O 1 bit } prLam2C_buf4a_d0 { O 16 vector } prLam2C_buf4a_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLam2C_buf4a'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2335 \
    name prLam2C_buf4b \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename prLam2C_buf4b \
    op interface \
    ports { prLam2C_buf4b_address0 { O 10 vector } prLam2C_buf4b_ce0 { O 1 bit } prLam2C_buf4b_we0 { O 1 bit } prLam2C_buf4b_d0 { O 16 vector } prLam2C_buf4b_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLam2C_buf4b'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2342 \
    name prLamB_buf3b \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename prLamB_buf3b \
    op interface \
    ports { prLamB_buf3b_address0 { O 10 vector } prLamB_buf3b_ce0 { O 1 bit } prLamB_buf3b_we0 { O 1 bit } prLamB_buf3b_d0 { O 16 vector } prLamB_buf3b_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLamB_buf3b'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2343 \
    name prLamC_buf5 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename prLamC_buf5 \
    op interface \
    ports { prLamC_buf5_address0 { O 10 vector } prLamC_buf5_ce0 { O 1 bit } prLamC_buf5_we0 { O 1 bit } prLamC_buf5_d0 { O 16 vector } prLamC_buf5_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLamC_buf5'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2344 \
    name prLam2B_buf3b \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename prLam2B_buf3b \
    op interface \
    ports { prLam2B_buf3b_address0 { O 10 vector } prLam2B_buf3b_ce0 { O 1 bit } prLam2B_buf3b_we0 { O 1 bit } prLam2B_buf3b_d0 { O 16 vector } prLam2B_buf3b_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLam2B_buf3b'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2345 \
    name prLam2C_buf5 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename prLam2C_buf5 \
    op interface \
    ports { prLam2C_buf5_address0 { O 10 vector } prLam2C_buf5_ce0 { O 1 bit } prLam2C_buf5_we0 { O 1 bit } prLam2C_buf5_d0 { O 16 vector } prLam2C_buf5_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLam2C_buf5'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2346 \
    name prLamB_buf5 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename prLamB_buf5 \
    op interface \
    ports { prLamB_buf5_address0 { O 10 vector } prLamB_buf5_ce0 { O 1 bit } prLamB_buf5_we0 { O 1 bit } prLamB_buf5_d0 { O 16 vector } prLamB_buf5_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLamB_buf5'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2347 \
    name prLamB_buf5a \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename prLamB_buf5a \
    op interface \
    ports { prLamB_buf5a_address0 { O 10 vector } prLamB_buf5a_ce0 { O 1 bit } prLamB_buf5a_we0 { O 1 bit } prLamB_buf5a_d0 { O 16 vector } prLamB_buf5a_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLamB_buf5a'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2348 \
    name prLamC_buf6 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename prLamC_buf6 \
    op interface \
    ports { prLamC_buf6_address0 { O 10 vector } prLamC_buf6_ce0 { O 1 bit } prLamC_buf6_we0 { O 1 bit } prLamC_buf6_d0 { O 16 vector } prLamC_buf6_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLamC_buf6'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2349 \
    name prLam2B_buf5 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename prLam2B_buf5 \
    op interface \
    ports { prLam2B_buf5_address0 { O 10 vector } prLam2B_buf5_ce0 { O 1 bit } prLam2B_buf5_we0 { O 1 bit } prLam2B_buf5_d0 { O 16 vector } prLam2B_buf5_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLam2B_buf5'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2350 \
    name prLam2B_buf5a \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename prLam2B_buf5a \
    op interface \
    ports { prLam2B_buf5a_address0 { O 10 vector } prLam2B_buf5a_ce0 { O 1 bit } prLam2B_buf5a_we0 { O 1 bit } prLam2B_buf5a_d0 { O 16 vector } prLam2B_buf5a_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLam2B_buf5a'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2351 \
    name prLam2C_buf6 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename prLam2C_buf6 \
    op interface \
    ports { prLam2C_buf6_address0 { O 10 vector } prLam2C_buf6_ce0 { O 1 bit } prLam2C_buf6_we0 { O 1 bit } prLam2C_buf6_d0 { O 16 vector } prLam2C_buf6_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLam2C_buf6'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2352 \
    name prLamB_buf6 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename prLamB_buf6 \
    op interface \
    ports { prLamB_buf6_address0 { O 10 vector } prLamB_buf6_ce0 { O 1 bit } prLamB_buf6_we0 { O 1 bit } prLamB_buf6_d0 { O 16 vector } prLamB_buf6_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLamB_buf6'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2353 \
    name prLam2B_buf6 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename prLam2B_buf6 \
    op interface \
    ports { prLam2B_buf6_address0 { O 10 vector } prLam2B_buf6_ce0 { O 1 bit } prLam2B_buf6_we0 { O 1 bit } prLam2B_buf6_d0 { O 16 vector } prLam2B_buf6_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLam2B_buf6'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2354 \
    name prLamB_buf7 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename prLamB_buf7 \
    op interface \
    ports { prLamB_buf7_address0 { O 10 vector } prLamB_buf7_ce0 { O 1 bit } prLamB_buf7_we0 { O 1 bit } prLamB_buf7_d0 { O 16 vector } prLamB_buf7_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLamB_buf7'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2355 \
    name prLamB_buf7a \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename prLamB_buf7a \
    op interface \
    ports { prLamB_buf7a_address0 { O 10 vector } prLamB_buf7a_ce0 { O 1 bit } prLamB_buf7a_we0 { O 1 bit } prLamB_buf7a_d0 { O 16 vector } prLamB_buf7a_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLamB_buf7a'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2356 \
    name prLamC_buf7 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename prLamC_buf7 \
    op interface \
    ports { prLamC_buf7_address0 { O 10 vector } prLamC_buf7_ce0 { O 1 bit } prLamC_buf7_we0 { O 1 bit } prLamC_buf7_d0 { O 16 vector } prLamC_buf7_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLamC_buf7'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2357 \
    name prLam2B_buf7 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename prLam2B_buf7 \
    op interface \
    ports { prLam2B_buf7_address0 { O 10 vector } prLam2B_buf7_ce0 { O 1 bit } prLam2B_buf7_we0 { O 1 bit } prLam2B_buf7_d0 { O 16 vector } prLam2B_buf7_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLam2B_buf7'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2358 \
    name prLam2B_buf7a \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename prLam2B_buf7a \
    op interface \
    ports { prLam2B_buf7a_address0 { O 10 vector } prLam2B_buf7a_ce0 { O 1 bit } prLam2B_buf7a_we0 { O 1 bit } prLam2B_buf7a_d0 { O 16 vector } prLam2B_buf7a_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLam2B_buf7a'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2359 \
    name prLam2C_buf7 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename prLam2C_buf7 \
    op interface \
    ports { prLam2C_buf7_address0 { O 10 vector } prLam2C_buf7_ce0 { O 1 bit } prLam2C_buf7_we0 { O 1 bit } prLam2C_buf7_d0 { O 16 vector } prLam2C_buf7_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLam2C_buf7'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2360 \
    name prLamB_buf9a \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename prLamB_buf9a \
    op interface \
    ports { prLamB_buf9a_address0 { O 10 vector } prLamB_buf9a_ce0 { O 1 bit } prLamB_buf9a_we0 { O 1 bit } prLamB_buf9a_d0 { O 16 vector } prLamB_buf9a_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLamB_buf9a'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2361 \
    name prLamB_buf10 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename prLamB_buf10 \
    op interface \
    ports { prLamB_buf10_address0 { O 10 vector } prLamB_buf10_ce0 { O 1 bit } prLamB_buf10_we0 { O 1 bit } prLamB_buf10_d0 { O 16 vector } prLamB_buf10_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLamB_buf10'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2362 \
    name prLamB_buf9 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename prLamB_buf9 \
    op interface \
    ports { prLamB_buf9_address0 { O 10 vector } prLamB_buf9_ce0 { O 1 bit } prLamB_buf9_we0 { O 1 bit } prLamB_buf9_d0 { O 16 vector } prLamB_buf9_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLamB_buf9'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2363 \
    name prLamC_buf10 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename prLamC_buf10 \
    op interface \
    ports { prLamC_buf10_address0 { O 10 vector } prLamC_buf10_ce0 { O 1 bit } prLamC_buf10_we0 { O 1 bit } prLamC_buf10_d0 { O 16 vector } prLamC_buf10_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLamC_buf10'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2364 \
    name prLamC_buf10a \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename prLamC_buf10a \
    op interface \
    ports { prLamC_buf10a_address0 { O 10 vector } prLamC_buf10a_ce0 { O 1 bit } prLamC_buf10a_we0 { O 1 bit } prLamC_buf10a_d0 { O 16 vector } prLamC_buf10a_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLamC_buf10a'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2365 \
    name prLamC_buf10b \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename prLamC_buf10b \
    op interface \
    ports { prLamC_buf10b_address0 { O 10 vector } prLamC_buf10b_ce0 { O 1 bit } prLamC_buf10b_we0 { O 1 bit } prLamC_buf10b_d0 { O 16 vector } prLamC_buf10b_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLamC_buf10b'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2366 \
    name prLam2B_buf9a \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename prLam2B_buf9a \
    op interface \
    ports { prLam2B_buf9a_address0 { O 10 vector } prLam2B_buf9a_ce0 { O 1 bit } prLam2B_buf9a_we0 { O 1 bit } prLam2B_buf9a_d0 { O 16 vector } prLam2B_buf9a_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLam2B_buf9a'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2367 \
    name prLam2B_buf10 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename prLam2B_buf10 \
    op interface \
    ports { prLam2B_buf10_address0 { O 10 vector } prLam2B_buf10_ce0 { O 1 bit } prLam2B_buf10_we0 { O 1 bit } prLam2B_buf10_d0 { O 16 vector } prLam2B_buf10_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLam2B_buf10'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2368 \
    name prLam2B_buf9 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename prLam2B_buf9 \
    op interface \
    ports { prLam2B_buf9_address0 { O 10 vector } prLam2B_buf9_ce0 { O 1 bit } prLam2B_buf9_we0 { O 1 bit } prLam2B_buf9_d0 { O 16 vector } prLam2B_buf9_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLam2B_buf9'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2369 \
    name prLam2C_buf10 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename prLam2C_buf10 \
    op interface \
    ports { prLam2C_buf10_address0 { O 10 vector } prLam2C_buf10_ce0 { O 1 bit } prLam2C_buf10_we0 { O 1 bit } prLam2C_buf10_d0 { O 16 vector } prLam2C_buf10_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLam2C_buf10'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2370 \
    name prLam2C_buf10a \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename prLam2C_buf10a \
    op interface \
    ports { prLam2C_buf10a_address0 { O 10 vector } prLam2C_buf10a_ce0 { O 1 bit } prLam2C_buf10a_we0 { O 1 bit } prLam2C_buf10a_d0 { O 16 vector } prLam2C_buf10a_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLam2C_buf10a'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2371 \
    name prLam2C_buf10b \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename prLam2C_buf10b \
    op interface \
    ports { prLam2C_buf10b_address0 { O 10 vector } prLam2C_buf10b_ce0 { O 1 bit } prLam2C_buf10b_we0 { O 1 bit } prLam2C_buf10b_d0 { O 16 vector } prLam2C_buf10b_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLam2C_buf10b'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2372 \
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
    id 2373 \
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
    id 2374 \
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
    id 2375 \
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
    id 2376 \
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
    id 2377 \
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
    id 2378 \
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
    id 2379 \
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
    id 2380 \
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
    id 2381 \
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
    id 2382 \
    name Lam_buf4a \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename Lam_buf4a \
    op interface \
    ports { Lam_buf4a_address0 { O 10 vector } Lam_buf4a_ce0 { O 1 bit } Lam_buf4a_we0 { O 1 bit } Lam_buf4a_d0 { O 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'Lam_buf4a'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2383 \
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
    id 2384 \
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
    id 2385 \
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
    id 2386 \
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
    id 2387 \
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
    id 2388 \
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
    id 2389 \
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
    id 2390 \
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
    id 2391 \
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
    id 2392 \
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
    id 2393 \
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
    id 2394 \
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
    id 2395 \
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
    id 2396 \
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
    id 2397 \
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
    id 2398 \
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
    id 2399 \
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
    id 2400 \
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
    id 2401 \
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
    id 2402 \
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
    id 2403 \
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
    id 2404 \
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
    id 2405 \
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
    id 2406 \
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
    id 2407 \
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
    id 2408 \
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
    id 2409 \
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
    id 2410 \
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
    id 2411 \
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
    id 2412 \
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
    id 2413 \
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
    id 2414 \
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
    id 2415 \
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
    id 2416 \
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
    id 2417 \
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
    id 2418 \
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
    id 2419 \
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
    id 2420 \
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
    id 2421 \
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
    id 2422 \
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
    id 2423 \
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
    id 2424 \
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
    id 2425 \
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
    id 2426 \
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
    id 2427 \
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
    id 2428 \
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
    id 2429 \
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
    id 2430 \
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
    id 2431 \
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


# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2296 \
    name nCodeN11 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_nCodeN11 \
    op interface \
    ports { nCodeN11 { I 12 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2302 \
    name pest0 \
    type other \
    dir IO \
    reset_level 1 \
    sync_rst true \
    corename dc_pest0 \
    op interface \
    ports { pest0_i { I 16 vector } pest0_o { O 16 vector } pest0_o_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2310 \
    name pest1 \
    type other \
    dir IO \
    reset_level 1 \
    sync_rst true \
    corename dc_pest1 \
    op interface \
    ports { pest1_i { I 16 vector } pest1_o { O 16 vector } pest1_o_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2314 \
    name pest2 \
    type other \
    dir IO \
    reset_level 1 \
    sync_rst true \
    corename dc_pest2 \
    op interface \
    ports { pest2_i { I 16 vector } pest2_o { O 16 vector } pest2_o_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2322 \
    name pest3 \
    type other \
    dir IO \
    reset_level 1 \
    sync_rst true \
    corename dc_pest3 \
    op interface \
    ports { pest3_i { I 16 vector } pest3_o { O 16 vector } pest3_o_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2336 \
    name pest4 \
    type other \
    dir IO \
    reset_level 1 \
    sync_rst true \
    corename dc_pest4 \
    op interface \
    ports { pest4_i { I 16 vector } pest4_o { O 16 vector } pest4_o_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2337 \
    name bpest0 \
    type other \
    dir IO \
    reset_level 1 \
    sync_rst true \
    corename dc_bpest0 \
    op interface \
    ports { bpest0_i { I 1 vector } bpest0_o { O 1 vector } bpest0_o_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2338 \
    name bpest1 \
    type other \
    dir IO \
    reset_level 1 \
    sync_rst true \
    corename dc_bpest1 \
    op interface \
    ports { bpest1_i { I 1 vector } bpest1_o { O 1 vector } bpest1_o_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2339 \
    name bpest2 \
    type other \
    dir IO \
    reset_level 1 \
    sync_rst true \
    corename dc_bpest2 \
    op interface \
    ports { bpest2_i { I 1 vector } bpest2_o { O 1 vector } bpest2_o_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2340 \
    name bpest3 \
    type other \
    dir IO \
    reset_level 1 \
    sync_rst true \
    corename dc_bpest3 \
    op interface \
    ports { bpest3_i { I 1 vector } bpest3_o { O 1 vector } bpest3_o_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2341 \
    name bpest4 \
    type other \
    dir IO \
    reset_level 1 \
    sync_rst true \
    corename dc_bpest4 \
    op interface \
    ports { bpest4_i { I 1 vector } bpest4_o { O 1 vector } bpest4_o_ap_vld { O 1 bit } } \
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


