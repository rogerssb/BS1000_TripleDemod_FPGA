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
    id 2433 \
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
    id 2434 \
    name prLamB_buf \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename prLamB_buf \
    op interface \
    ports { prLamB_buf_address0 { O 10 vector } prLamB_buf_ce0 { O 1 bit } prLamB_buf_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLamB_buf'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2435 \
    name prLamC_buf \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename prLamC_buf \
    op interface \
    ports { prLamC_buf_address0 { O 10 vector } prLamC_buf_ce0 { O 1 bit } prLamC_buf_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLamC_buf'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2436 \
    name prLamC_bufa \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename prLamC_bufa \
    op interface \
    ports { prLamC_bufa_address0 { O 10 vector } prLamC_bufa_ce0 { O 1 bit } prLamC_bufa_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLamC_bufa'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2437 \
    name prLamC_bufb \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename prLamC_bufb \
    op interface \
    ports { prLamC_bufb_address0 { O 10 vector } prLamC_bufb_ce0 { O 1 bit } prLamC_bufb_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLamC_bufb'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2438 \
    name prLam2B_buf \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename prLam2B_buf \
    op interface \
    ports { prLam2B_buf_address0 { O 10 vector } prLam2B_buf_ce0 { O 1 bit } prLam2B_buf_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLam2B_buf'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2439 \
    name prLam2C_buf \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename prLam2C_buf \
    op interface \
    ports { prLam2C_buf_address0 { O 10 vector } prLam2C_buf_ce0 { O 1 bit } prLam2C_buf_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLam2C_buf'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2440 \
    name prLam2C_bufa \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename prLam2C_bufa \
    op interface \
    ports { prLam2C_bufa_address0 { O 10 vector } prLam2C_bufa_ce0 { O 1 bit } prLam2C_bufa_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLam2C_bufa'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2441 \
    name prLam2C_bufb \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename prLam2C_bufb \
    op interface \
    ports { prLam2C_bufb_address0 { O 10 vector } prLam2C_bufb_ce0 { O 1 bit } prLam2C_bufb_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLam2C_bufb'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2443 \
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
    id 2444 \
    name prLamB_buf1 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename prLamB_buf1 \
    op interface \
    ports { prLamB_buf1_address0 { O 10 vector } prLamB_buf1_ce0 { O 1 bit } prLamB_buf1_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLamB_buf1'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2445 \
    name prLamB_buf1a \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename prLamB_buf1a \
    op interface \
    ports { prLamB_buf1a_address0 { O 10 vector } prLamB_buf1a_ce0 { O 1 bit } prLamB_buf1a_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLamB_buf1a'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2446 \
    name prLamB_buf1b \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename prLamB_buf1b \
    op interface \
    ports { prLamB_buf1b_address0 { O 10 vector } prLamB_buf1b_ce0 { O 1 bit } prLamB_buf1b_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLamB_buf1b'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2447 \
    name prLamC_buf1 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename prLamC_buf1 \
    op interface \
    ports { prLamC_buf1_address0 { O 10 vector } prLamC_buf1_ce0 { O 1 bit } prLamC_buf1_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLamC_buf1'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2448 \
    name prLam2B_buf1 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename prLam2B_buf1 \
    op interface \
    ports { prLam2B_buf1_address0 { O 10 vector } prLam2B_buf1_ce0 { O 1 bit } prLam2B_buf1_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLam2B_buf1'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2449 \
    name prLam2B_buf1a \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename prLam2B_buf1a \
    op interface \
    ports { prLam2B_buf1a_address0 { O 10 vector } prLam2B_buf1a_ce0 { O 1 bit } prLam2B_buf1a_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLam2B_buf1a'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2450 \
    name prLam2B_buf1b \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename prLam2B_buf1b \
    op interface \
    ports { prLam2B_buf1b_address0 { O 10 vector } prLam2B_buf1b_ce0 { O 1 bit } prLam2B_buf1b_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLam2B_buf1b'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2451 \
    name prLam2C_buf1 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename prLam2C_buf1 \
    op interface \
    ports { prLam2C_buf1_address0 { O 10 vector } prLam2C_buf1_ce0 { O 1 bit } prLam2C_buf1_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLam2C_buf1'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2453 \
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
    id 2454 \
    name prLamB_buf2 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename prLamB_buf2 \
    op interface \
    ports { prLamB_buf2_address0 { O 10 vector } prLamB_buf2_ce0 { O 1 bit } prLamB_buf2_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLamB_buf2'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2455 \
    name prLamC_buf2 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename prLamC_buf2 \
    op interface \
    ports { prLamC_buf2_address0 { O 10 vector } prLamC_buf2_ce0 { O 1 bit } prLamC_buf2_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLamC_buf2'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2456 \
    name prLamC_buf2a \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename prLamC_buf2a \
    op interface \
    ports { prLamC_buf2a_address0 { O 10 vector } prLamC_buf2a_ce0 { O 1 bit } prLamC_buf2a_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLamC_buf2a'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2457 \
    name prLamC_buf2b \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename prLamC_buf2b \
    op interface \
    ports { prLamC_buf2b_address0 { O 10 vector } prLamC_buf2b_ce0 { O 1 bit } prLamC_buf2b_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLamC_buf2b'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2458 \
    name prLam2B_buf2 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename prLam2B_buf2 \
    op interface \
    ports { prLam2B_buf2_address0 { O 10 vector } prLam2B_buf2_ce0 { O 1 bit } prLam2B_buf2_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLam2B_buf2'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2459 \
    name prLam2C_buf2 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename prLam2C_buf2 \
    op interface \
    ports { prLam2C_buf2_address0 { O 10 vector } prLam2C_buf2_ce0 { O 1 bit } prLam2C_buf2_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLam2C_buf2'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2460 \
    name prLam2C_buf2a \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename prLam2C_buf2a \
    op interface \
    ports { prLam2C_buf2a_address0 { O 10 vector } prLam2C_buf2a_ce0 { O 1 bit } prLam2C_buf2a_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLam2C_buf2a'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2461 \
    name prLam2C_buf2b \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename prLam2C_buf2b \
    op interface \
    ports { prLam2C_buf2b_address0 { O 10 vector } prLam2C_buf2b_ce0 { O 1 bit } prLam2C_buf2b_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLam2C_buf2b'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2463 \
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
    id 2464 \
    name prLamB_buf3 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename prLamB_buf3 \
    op interface \
    ports { prLamB_buf3_address0 { O 10 vector } prLamB_buf3_ce0 { O 1 bit } prLamB_buf3_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLamB_buf3'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2465 \
    name prLamB_buf3a \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename prLamB_buf3a \
    op interface \
    ports { prLamB_buf3a_address0 { O 10 vector } prLamB_buf3a_ce0 { O 1 bit } prLamB_buf3a_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLamB_buf3a'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2466 \
    name prLamB_buf3b \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename prLamB_buf3b \
    op interface \
    ports { prLamB_buf3b_address0 { O 10 vector } prLamB_buf3b_ce0 { O 1 bit } prLamB_buf3b_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLamB_buf3b'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2467 \
    name prLamC_buf3 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename prLamC_buf3 \
    op interface \
    ports { prLamC_buf3_address0 { O 10 vector } prLamC_buf3_ce0 { O 1 bit } prLamC_buf3_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLamC_buf3'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2468 \
    name prLam2B_buf3 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename prLam2B_buf3 \
    op interface \
    ports { prLam2B_buf3_address0 { O 10 vector } prLam2B_buf3_ce0 { O 1 bit } prLam2B_buf3_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLam2B_buf3'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2469 \
    name prLam2B_buf3a \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename prLam2B_buf3a \
    op interface \
    ports { prLam2B_buf3a_address0 { O 10 vector } prLam2B_buf3a_ce0 { O 1 bit } prLam2B_buf3a_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLam2B_buf3a'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2470 \
    name prLam2B_buf3b \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename prLam2B_buf3b \
    op interface \
    ports { prLam2B_buf3b_address0 { O 10 vector } prLam2B_buf3b_ce0 { O 1 bit } prLam2B_buf3b_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLam2B_buf3b'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2471 \
    name prLam2C_buf3 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename prLam2C_buf3 \
    op interface \
    ports { prLam2C_buf3_address0 { O 10 vector } prLam2C_buf3_ce0 { O 1 bit } prLam2C_buf3_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLam2C_buf3'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2473 \
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
    id 2474 \
    name prLam_buf4 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename prLam_buf4 \
    op interface \
    ports { prLam_buf4_address0 { O 10 vector } prLam_buf4_ce0 { O 1 bit } prLam_buf4_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLam_buf4'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2475 \
    name prLamB_buf4 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename prLamB_buf4 \
    op interface \
    ports { prLamB_buf4_address0 { O 10 vector } prLamB_buf4_ce0 { O 1 bit } prLamB_buf4_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLamB_buf4'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2476 \
    name prLamC_buf4 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename prLamC_buf4 \
    op interface \
    ports { prLamC_buf4_address0 { O 10 vector } prLamC_buf4_ce0 { O 1 bit } prLamC_buf4_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLamC_buf4'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2477 \
    name prLamC_buf4a \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename prLamC_buf4a \
    op interface \
    ports { prLamC_buf4a_address0 { O 10 vector } prLamC_buf4a_ce0 { O 1 bit } prLamC_buf4a_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLamC_buf4a'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2478 \
    name prLamC_buf4b \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename prLamC_buf4b \
    op interface \
    ports { prLamC_buf4b_address0 { O 10 vector } prLamC_buf4b_ce0 { O 1 bit } prLamC_buf4b_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLamC_buf4b'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2479 \
    name prLam2_buf4 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename prLam2_buf4 \
    op interface \
    ports { prLam2_buf4_address0 { O 10 vector } prLam2_buf4_ce0 { O 1 bit } prLam2_buf4_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLam2_buf4'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2480 \
    name prLam2B_buf4 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename prLam2B_buf4 \
    op interface \
    ports { prLam2B_buf4_address0 { O 10 vector } prLam2B_buf4_ce0 { O 1 bit } prLam2B_buf4_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLam2B_buf4'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2481 \
    name prLam2C_buf4 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename prLam2C_buf4 \
    op interface \
    ports { prLam2C_buf4_address0 { O 10 vector } prLam2C_buf4_ce0 { O 1 bit } prLam2C_buf4_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLam2C_buf4'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2482 \
    name prLam2C_buf4a \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename prLam2C_buf4a \
    op interface \
    ports { prLam2C_buf4a_address0 { O 10 vector } prLam2C_buf4a_ce0 { O 1 bit } prLam2C_buf4a_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLam2C_buf4a'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2483 \
    name prLam2C_buf4b \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename prLam2C_buf4b \
    op interface \
    ports { prLam2C_buf4b_address0 { O 10 vector } prLam2C_buf4b_ce0 { O 1 bit } prLam2C_buf4b_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLam2C_buf4b'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2485 \
    name pLambda5 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename pLambda5 \
    op interface \
    ports { pLambda5_address0 { O 10 vector } pLambda5_ce0 { O 1 bit } pLambda5_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'pLambda5'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2486 \
    name prLamB_buf5 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename prLamB_buf5 \
    op interface \
    ports { prLamB_buf5_address0 { O 10 vector } prLamB_buf5_ce0 { O 1 bit } prLamB_buf5_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLamB_buf5'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2487 \
    name prLamB_buf5a \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename prLamB_buf5a \
    op interface \
    ports { prLamB_buf5a_address0 { O 10 vector } prLamB_buf5a_ce0 { O 1 bit } prLamB_buf5a_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLamB_buf5a'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2488 \
    name prLamB_buf5b \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename prLamB_buf5b \
    op interface \
    ports { prLamB_buf5b_address0 { O 10 vector } prLamB_buf5b_ce0 { O 1 bit } prLamB_buf5b_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLamB_buf5b'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2489 \
    name prLamC_buf5 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename prLamC_buf5 \
    op interface \
    ports { prLamC_buf5_address0 { O 10 vector } prLamC_buf5_ce0 { O 1 bit } prLamC_buf5_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLamC_buf5'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2490 \
    name prLam2B_buf5 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename prLam2B_buf5 \
    op interface \
    ports { prLam2B_buf5_address0 { O 10 vector } prLam2B_buf5_ce0 { O 1 bit } prLam2B_buf5_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLam2B_buf5'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2491 \
    name prLam2B_buf5a \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename prLam2B_buf5a \
    op interface \
    ports { prLam2B_buf5a_address0 { O 10 vector } prLam2B_buf5a_ce0 { O 1 bit } prLam2B_buf5a_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLam2B_buf5a'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2492 \
    name prLam2B_buf5b \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename prLam2B_buf5b \
    op interface \
    ports { prLam2B_buf5b_address0 { O 10 vector } prLam2B_buf5b_ce0 { O 1 bit } prLam2B_buf5b_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLam2B_buf5b'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2493 \
    name prLam2C_buf5 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename prLam2C_buf5 \
    op interface \
    ports { prLam2C_buf5_address0 { O 10 vector } prLam2C_buf5_ce0 { O 1 bit } prLam2C_buf5_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLam2C_buf5'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2495 \
    name pLambda6 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename pLambda6 \
    op interface \
    ports { pLambda6_address0 { O 10 vector } pLambda6_ce0 { O 1 bit } pLambda6_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'pLambda6'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2496 \
    name prLam_buf2 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename prLam_buf2 \
    op interface \
    ports { prLam_buf2_address0 { O 10 vector } prLam_buf2_ce0 { O 1 bit } prLam_buf2_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLam_buf2'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2497 \
    name prLam_buf4a \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename prLam_buf4a \
    op interface \
    ports { prLam_buf4a_address0 { O 10 vector } prLam_buf4a_ce0 { O 1 bit } prLam_buf4a_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLam_buf4a'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2498 \
    name prLamB_buf6 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename prLamB_buf6 \
    op interface \
    ports { prLamB_buf6_address0 { O 10 vector } prLamB_buf6_ce0 { O 1 bit } prLamB_buf6_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLamB_buf6'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2499 \
    name prLamC_buf6 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename prLamC_buf6 \
    op interface \
    ports { prLamC_buf6_address0 { O 10 vector } prLamC_buf6_ce0 { O 1 bit } prLamC_buf6_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLamC_buf6'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2500 \
    name prLamC_buf10a \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename prLamC_buf10a \
    op interface \
    ports { prLamC_buf10a_address0 { O 10 vector } prLamC_buf10a_ce0 { O 1 bit } prLamC_buf10a_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLamC_buf10a'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2501 \
    name prLamC_buf10b \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename prLamC_buf10b \
    op interface \
    ports { prLamC_buf10b_address0 { O 10 vector } prLamC_buf10b_ce0 { O 1 bit } prLamC_buf10b_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLamC_buf10b'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2502 \
    name prLam2_buf2 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename prLam2_buf2 \
    op interface \
    ports { prLam2_buf2_address0 { O 10 vector } prLam2_buf2_ce0 { O 1 bit } prLam2_buf2_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLam2_buf2'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2503 \
    name prLam2_buf4a \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename prLam2_buf4a \
    op interface \
    ports { prLam2_buf4a_address0 { O 10 vector } prLam2_buf4a_ce0 { O 1 bit } prLam2_buf4a_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLam2_buf4a'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2504 \
    name prLam2B_buf6 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename prLam2B_buf6 \
    op interface \
    ports { prLam2B_buf6_address0 { O 10 vector } prLam2B_buf6_ce0 { O 1 bit } prLam2B_buf6_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLam2B_buf6'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2505 \
    name prLam2C_buf6 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename prLam2C_buf6 \
    op interface \
    ports { prLam2C_buf6_address0 { O 10 vector } prLam2C_buf6_ce0 { O 1 bit } prLam2C_buf6_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLam2C_buf6'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2506 \
    name prLam2C_buf10a \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename prLam2C_buf10a \
    op interface \
    ports { prLam2C_buf10a_address0 { O 10 vector } prLam2C_buf10a_ce0 { O 1 bit } prLam2C_buf10a_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLam2C_buf10a'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2507 \
    name prLam2C_buf10b \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename prLam2C_buf10b \
    op interface \
    ports { prLam2C_buf10b_address0 { O 10 vector } prLam2C_buf10b_ce0 { O 1 bit } prLam2C_buf10b_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLam2C_buf10b'"
}
}


# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2432 \
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
    id 2442 \
    name pest0 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_pest0 \
    op interface \
    ports { pest0 { O 16 vector } pest0_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2452 \
    name pest1 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_pest1 \
    op interface \
    ports { pest1 { O 16 vector } pest1_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2462 \
    name pest2 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_pest2 \
    op interface \
    ports { pest2 { O 16 vector } pest2_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2472 \
    name pest3 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_pest3 \
    op interface \
    ports { pest3 { O 16 vector } pest3_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2484 \
    name pest4 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_pest4 \
    op interface \
    ports { pest4 { O 16 vector } pest4_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2494 \
    name pest5 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_pest5 \
    op interface \
    ports { pest5 { O 16 vector } pest5_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2508 \
    name pest6 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_pest6 \
    op interface \
    ports { pest6 { O 16 vector } pest6_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2509 \
    name bpest0 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_bpest0 \
    op interface \
    ports { bpest0 { O 1 vector } bpest0_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2510 \
    name bpest1 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_bpest1 \
    op interface \
    ports { bpest1 { O 1 vector } bpest1_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2511 \
    name bpest2 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_bpest2 \
    op interface \
    ports { bpest2 { O 1 vector } bpest2_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2512 \
    name bpest3 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_bpest3 \
    op interface \
    ports { bpest3 { O 1 vector } bpest3_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2513 \
    name bpest4 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_bpest4 \
    op interface \
    ports { bpest4 { O 1 vector } bpest4_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2514 \
    name bpest5 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_bpest5 \
    op interface \
    ports { bpest5 { O 1 vector } bpest5_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2515 \
    name bpest6 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_bpest6 \
    op interface \
    ports { bpest6 { O 1 vector } bpest6_ap_vld { O 1 bit } } \
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


