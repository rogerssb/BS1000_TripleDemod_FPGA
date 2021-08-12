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
    id 2202 \
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
    id 2203 \
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
    id 2205 \
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
    id 2206 \
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
    id 2207 \
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
    id 2209 \
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
    id 2211 \
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
    id 2212 \
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
    id 2213 \
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
    id 2215 \
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
    id 2216 \
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
    id 2217 \
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
    id 2218 \
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
    id 2219 \
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
    id 2220 \
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
    id 2221 \
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
    id 2222 \
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
    id 2223 \
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
    id 2224 \
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
    id 2225 \
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
    id 2226 \
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
    id 2227 \
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
    id 2228 \
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
    id 2229 \
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
    id 2230 \
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
    id 2231 \
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
    id 2232 \
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
    id 2233 \
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
    id 2234 \
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
    id 2235 \
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
    id 2236 \
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
    id 2237 \
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
    id 2238 \
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
    id 2239 \
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
    id 2240 \
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
    id 2241 \
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
    id 2242 \
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
    id 2243 \
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
    id 2244 \
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
    id 2245 \
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
    id 2246 \
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
    id 2247 \
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
    id 2248 \
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
    id 2249 \
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
    id 2250 \
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
    id 2251 \
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
    id 2252 \
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
    id 2253 \
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
    id 2254 \
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
    id 2255 \
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
    id 2256 \
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
    id 2257 \
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
    id 2258 \
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
    id 2259 \
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
    id 2260 \
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
    id 2261 \
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
    id 2262 \
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
    id 2263 \
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
    id 2264 \
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
    id 2265 \
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
    id 2266 \
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
    id 2267 \
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
    id 2268 \
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
    id 2269 \
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
    id 2270 \
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
    id 2271 \
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
    id 2272 \
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
    id 2273 \
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
    id 2274 \
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
    id 2275 \
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
    id 2276 \
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
    id 2277 \
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
    id 2278 \
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
    id 2279 \
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
    id 2280 \
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
    id 2281 \
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
    id 2282 \
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
    id 2283 \
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
    id 2284 \
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
    id 2285 \
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
    id 2286 \
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
    id 2287 \
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
    id 2288 \
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
    id 2289 \
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
    id 2290 \
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
    id 2291 \
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
    id 2292 \
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
    id 2293 \
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
    id 2294 \
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
    id 2295 \
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
    id 2200 \
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
    id 2201 \
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
    id 2204 \
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
    id 2208 \
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
    id 2210 \
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
    id 2214 \
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



# merge
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_end
    cg_default_interface_gen_bundle_end
    AESL_LIB_XILADAPTER::native_axis_end
}


