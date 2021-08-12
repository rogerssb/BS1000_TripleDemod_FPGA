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
    id 1222 \
    name SpEtaPrev \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename SpEtaPrev \
    op interface \
    ports { SpEtaPrev_address0 { O 11 vector } SpEtaPrev_ce0 { O 1 bit } SpEtaPrev_we0 { O 1 bit } SpEtaPrev_d0 { O 32 vector } SpEtaPrev_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'SpEtaPrev'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1226 \
    name SpEtaPrevC \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename SpEtaPrevC \
    op interface \
    ports { SpEtaPrevC_address0 { O 11 vector } SpEtaPrevC_ce0 { O 1 bit } SpEtaPrevC_we0 { O 1 bit } SpEtaPrevC_d0 { O 32 vector } SpEtaPrevC_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'SpEtaPrevC'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1230 \
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
    id 1232 \
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
    id 1234 \
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
    id 1236 \
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
    id 1238 \
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
    id 1240 \
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
    id 1241 \
    name prHat_buf4 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename prHat_buf4 \
    op interface \
    ports { prHat_buf4_address0 { O 11 vector } prHat_buf4_ce0 { O 1 bit } prHat_buf4_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prHat_buf4'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1242 \
    name prHat_buf6 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename prHat_buf6 \
    op interface \
    ports { prHat_buf6_address0 { O 11 vector } prHat_buf6_ce0 { O 1 bit } prHat_buf6_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prHat_buf6'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1243 \
    name prHat_buf4a \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename prHat_buf4a \
    op interface \
    ports { prHat_buf4a_address0 { O 11 vector } prHat_buf4a_ce0 { O 1 bit } prHat_buf4a_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prHat_buf4a'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1244 \
    name prHat_buf6a \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename prHat_buf6a \
    op interface \
    ports { prHat_buf6a_address0 { O 11 vector } prHat_buf6a_ce0 { O 1 bit } prHat_buf6a_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prHat_buf6a'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1248 \
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
    id 1251 \
    name prLamC_bufa \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename prLamC_bufa \
    op interface \
    ports { prLamC_bufa_address0 { O 10 vector } prLamC_bufa_ce0 { O 1 bit } prLamC_bufa_we0 { O 1 bit } prLamC_bufa_d0 { O 16 vector } prLamC_bufa_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLamC_bufa'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1254 \
    name prLamC_bufb \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename prLamC_bufb \
    op interface \
    ports { prLamC_bufb_address0 { O 10 vector } prLamC_bufb_ce0 { O 1 bit } prLamC_bufb_we0 { O 1 bit } prLamC_bufb_d0 { O 16 vector } prLamC_bufb_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLamC_bufb'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1257 \
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
    id 1260 \
    name prLamC_buf2 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename prLamC_buf2 \
    op interface \
    ports { prLamC_buf2_address0 { O 10 vector } prLamC_buf2_ce0 { O 1 bit } prLamC_buf2_we0 { O 1 bit } prLamC_buf2_d0 { O 16 vector } prLamC_buf2_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLamC_buf2'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1263 \
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
    id 1266 \
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
    id 1269 \
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
    id 1272 \
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
    id 1275 \
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
    id 1278 \
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
    id 1281 \
    name prLam2C_bufa \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename prLam2C_bufa \
    op interface \
    ports { prLam2C_bufa_address0 { O 10 vector } prLam2C_bufa_ce0 { O 1 bit } prLam2C_bufa_we0 { O 1 bit } prLam2C_bufa_d0 { O 16 vector } prLam2C_bufa_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLam2C_bufa'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1284 \
    name prLam2C_bufb \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename prLam2C_bufb \
    op interface \
    ports { prLam2C_bufb_address0 { O 10 vector } prLam2C_bufb_ce0 { O 1 bit } prLam2C_bufb_we0 { O 1 bit } prLam2C_bufb_d0 { O 16 vector } prLam2C_bufb_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLam2C_bufb'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1287 \
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
    id 1290 \
    name prLam2C_buf2 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename prLam2C_buf2 \
    op interface \
    ports { prLam2C_buf2_address0 { O 10 vector } prLam2C_buf2_ce0 { O 1 bit } prLam2C_buf2_we0 { O 1 bit } prLam2C_buf2_d0 { O 16 vector } prLam2C_buf2_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLam2C_buf2'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1293 \
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
    id 1296 \
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
    id 1299 \
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
    id 1302 \
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
    id 1305 \
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
    id 1306 \
    name SpEtaPrevA \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename SpEtaPrevA \
    op interface \
    ports { SpEtaPrevA_address0 { O 11 vector } SpEtaPrevA_ce0 { O 1 bit } SpEtaPrevA_we0 { O 1 bit } SpEtaPrevA_d0 { O 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'SpEtaPrevA'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1307 \
    name SpEtaPrevAa \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename SpEtaPrevAa \
    op interface \
    ports { SpEtaPrevAa_address0 { O 11 vector } SpEtaPrevAa_ce0 { O 1 bit } SpEtaPrevAa_we0 { O 1 bit } SpEtaPrevAa_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'SpEtaPrevAa'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1308 \
    name SpEtaPrevAb \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename SpEtaPrevAb \
    op interface \
    ports { SpEtaPrevAb_address0 { O 10 vector } SpEtaPrevAb_ce0 { O 1 bit } SpEtaPrevAb_we0 { O 1 bit } SpEtaPrevAb_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'SpEtaPrevAb'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1309 \
    name SpEtaPrevD \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename SpEtaPrevD \
    op interface \
    ports { SpEtaPrevD_address0 { O 11 vector } SpEtaPrevD_ce0 { O 1 bit } SpEtaPrevD_we0 { O 1 bit } SpEtaPrevD_d0 { O 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'SpEtaPrevD'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1310 \
    name SpEtaPrevDa \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename SpEtaPrevDa \
    op interface \
    ports { SpEtaPrevDa_address0 { O 11 vector } SpEtaPrevDa_ce0 { O 1 bit } SpEtaPrevDa_we0 { O 1 bit } SpEtaPrevDa_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'SpEtaPrevDa'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1311 \
    name SpEtaPrevDb \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename SpEtaPrevDb \
    op interface \
    ports { SpEtaPrevDb_address0 { O 10 vector } SpEtaPrevDb_ce0 { O 1 bit } SpEtaPrevDb_we0 { O 1 bit } SpEtaPrevDb_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'SpEtaPrevDb'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1312 \
    name prHat_bufA \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename prHat_bufA \
    op interface \
    ports { prHat_bufA_address0 { O 11 vector } prHat_bufA_ce0 { O 1 bit } prHat_bufA_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prHat_bufA'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1313 \
    name prHat_bufAb \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename prHat_bufAb \
    op interface \
    ports { prHat_bufAb_address0 { O 11 vector } prHat_bufAb_ce0 { O 1 bit } prHat_bufAb_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prHat_bufAb'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1314 \
    name prHat_bufA1 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename prHat_bufA1 \
    op interface \
    ports { prHat_bufA1_address0 { O 11 vector } prHat_bufA1_ce0 { O 1 bit } prHat_bufA1_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prHat_bufA1'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1315 \
    name prHat_bufA2 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename prHat_bufA2 \
    op interface \
    ports { prHat_bufA2_address0 { O 11 vector } prHat_bufA2_ce0 { O 1 bit } prHat_bufA2_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prHat_bufA2'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1316 \
    name prHat_bufA3 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename prHat_bufA3 \
    op interface \
    ports { prHat_bufA3_address0 { O 11 vector } prHat_bufA3_ce0 { O 1 bit } prHat_bufA3_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prHat_bufA3'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1317 \
    name prHat_bufA5 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename prHat_bufA5 \
    op interface \
    ports { prHat_bufA5_address0 { O 11 vector } prHat_bufA5_ce0 { O 1 bit } prHat_bufA5_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prHat_bufA5'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1318 \
    name prHat_bufA6 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename prHat_bufA6 \
    op interface \
    ports { prHat_bufA6_address0 { O 11 vector } prHat_bufA6_ce0 { O 1 bit } prHat_bufA6_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prHat_bufA6'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1319 \
    name prHat_bufA6b \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename prHat_bufA6b \
    op interface \
    ports { prHat_bufA6b_address0 { O 11 vector } prHat_bufA6b_ce0 { O 1 bit } prHat_bufA6b_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prHat_bufA6b'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1320 \
    name prHat_bufAa \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename prHat_bufAa \
    op interface \
    ports { prHat_bufAa_address0 { O 11 vector } prHat_bufAa_ce0 { O 1 bit } prHat_bufAa_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prHat_bufAa'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1321 \
    name prHat_bufAc \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename prHat_bufAc \
    op interface \
    ports { prHat_bufAc_address0 { O 11 vector } prHat_bufAc_ce0 { O 1 bit } prHat_bufAc_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prHat_bufAc'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1322 \
    name prHat_bufA2a \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename prHat_bufA2a \
    op interface \
    ports { prHat_bufA2a_address0 { O 11 vector } prHat_bufA2a_ce0 { O 1 bit } prHat_bufA2a_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prHat_bufA2a'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1323 \
    name prHat_bufA6a \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename prHat_bufA6a \
    op interface \
    ports { prHat_bufA6a_address0 { O 11 vector } prHat_bufA6a_ce0 { O 1 bit } prHat_bufA6a_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prHat_bufA6a'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1324 \
    name prHat_bufA6c \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename prHat_bufA6c \
    op interface \
    ports { prHat_bufA6c_address0 { O 11 vector } prHat_bufA6c_ce0 { O 1 bit } prHat_bufA6c_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prHat_bufA6c'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1328 \
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
    id 1331 \
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
    id 1334 \
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
    id 1337 \
    name prLamB_buf1b \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename prLamB_buf1b \
    op interface \
    ports { prLamB_buf1b_address0 { O 10 vector } prLamB_buf1b_ce0 { O 1 bit } prLamB_buf1b_we0 { O 1 bit } prLamB_buf1b_d0 { O 16 vector } prLamB_buf1b_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLamB_buf1b'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1340 \
    name prLamB_buf2 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename prLamB_buf2 \
    op interface \
    ports { prLamB_buf2_address0 { O 10 vector } prLamB_buf2_ce0 { O 1 bit } prLamB_buf2_we0 { O 1 bit } prLamB_buf2_d0 { O 16 vector } prLamB_buf2_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLamB_buf2'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1343 \
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
    id 1346 \
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
    id 1349 \
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
    id 1352 \
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
    id 1355 \
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
    id 1358 \
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
    id 1361 \
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
    id 1364 \
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
    id 1367 \
    name prLam2B_buf1b \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename prLam2B_buf1b \
    op interface \
    ports { prLam2B_buf1b_address0 { O 10 vector } prLam2B_buf1b_ce0 { O 1 bit } prLam2B_buf1b_we0 { O 1 bit } prLam2B_buf1b_d0 { O 16 vector } prLam2B_buf1b_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLam2B_buf1b'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1370 \
    name prLam2B_buf2 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename prLam2B_buf2 \
    op interface \
    ports { prLam2B_buf2_address0 { O 10 vector } prLam2B_buf2_ce0 { O 1 bit } prLam2B_buf2_we0 { O 1 bit } prLam2B_buf2_d0 { O 16 vector } prLam2B_buf2_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prLam2B_buf2'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1373 \
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
    id 1376 \
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
    id 1379 \
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
    id 1382 \
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
    id 1385 \
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
    id 1386 \
    name SpEtaPrevB \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename SpEtaPrevB \
    op interface \
    ports { SpEtaPrevB_address0 { O 11 vector } SpEtaPrevB_ce0 { O 1 bit } SpEtaPrevB_we0 { O 1 bit } SpEtaPrevB_d0 { O 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'SpEtaPrevB'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1387 \
    name SpEtaPrevBa \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename SpEtaPrevBa \
    op interface \
    ports { SpEtaPrevBa_address0 { O 11 vector } SpEtaPrevBa_ce0 { O 1 bit } SpEtaPrevBa_we0 { O 1 bit } SpEtaPrevBa_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'SpEtaPrevBa'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1388 \
    name SpEtaPrevBb \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename SpEtaPrevBb \
    op interface \
    ports { SpEtaPrevBb_address0 { O 10 vector } SpEtaPrevBb_ce0 { O 1 bit } SpEtaPrevBb_we0 { O 1 bit } SpEtaPrevBb_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'SpEtaPrevBb'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1389 \
    name SpEtaPrevE \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename SpEtaPrevE \
    op interface \
    ports { SpEtaPrevE_address0 { O 11 vector } SpEtaPrevE_ce0 { O 1 bit } SpEtaPrevE_we0 { O 1 bit } SpEtaPrevE_d0 { O 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'SpEtaPrevE'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1390 \
    name SpEtaPrevEa \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename SpEtaPrevEa \
    op interface \
    ports { SpEtaPrevEa_address0 { O 11 vector } SpEtaPrevEa_ce0 { O 1 bit } SpEtaPrevEa_we0 { O 1 bit } SpEtaPrevEa_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'SpEtaPrevEa'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1391 \
    name SpEtaPrevEb \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename SpEtaPrevEb \
    op interface \
    ports { SpEtaPrevEb_address0 { O 10 vector } SpEtaPrevEb_ce0 { O 1 bit } SpEtaPrevEb_we0 { O 1 bit } SpEtaPrevEb_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'SpEtaPrevEb'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1392 \
    name prHat_bufB \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename prHat_bufB \
    op interface \
    ports { prHat_bufB_address0 { O 11 vector } prHat_bufB_ce0 { O 1 bit } prHat_bufB_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prHat_bufB'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1393 \
    name prHat_bufB1 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename prHat_bufB1 \
    op interface \
    ports { prHat_bufB1_address0 { O 11 vector } prHat_bufB1_ce0 { O 1 bit } prHat_bufB1_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prHat_bufB1'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1394 \
    name prHat_bufB1b \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename prHat_bufB1b \
    op interface \
    ports { prHat_bufB1b_address0 { O 11 vector } prHat_bufB1b_ce0 { O 1 bit } prHat_bufB1b_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prHat_bufB1b'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1395 \
    name prHat_bufB2 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename prHat_bufB2 \
    op interface \
    ports { prHat_bufB2_address0 { O 11 vector } prHat_bufB2_ce0 { O 1 bit } prHat_bufB2_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prHat_bufB2'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1396 \
    name prHat_bufB3 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename prHat_bufB3 \
    op interface \
    ports { prHat_bufB3_address0 { O 11 vector } prHat_bufB3_ce0 { O 1 bit } prHat_bufB3_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prHat_bufB3'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1397 \
    name prHat_bufB3b \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename prHat_bufB3b \
    op interface \
    ports { prHat_bufB3b_address0 { O 11 vector } prHat_bufB3b_ce0 { O 1 bit } prHat_bufB3b_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prHat_bufB3b'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1398 \
    name prHat_bufB5 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename prHat_bufB5 \
    op interface \
    ports { prHat_bufB5_address0 { O 11 vector } prHat_bufB5_ce0 { O 1 bit } prHat_bufB5_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prHat_bufB5'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1399 \
    name prHat_bufB5b \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename prHat_bufB5b \
    op interface \
    ports { prHat_bufB5b_address0 { O 11 vector } prHat_bufB5b_ce0 { O 1 bit } prHat_bufB5b_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prHat_bufB5b'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1400 \
    name prHat_bufB6 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename prHat_bufB6 \
    op interface \
    ports { prHat_bufB6_address0 { O 11 vector } prHat_bufB6_ce0 { O 1 bit } prHat_bufB6_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prHat_bufB6'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1401 \
    name prHat_bufB1a \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename prHat_bufB1a \
    op interface \
    ports { prHat_bufB1a_address0 { O 11 vector } prHat_bufB1a_ce0 { O 1 bit } prHat_bufB1a_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prHat_bufB1a'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1402 \
    name prHat_bufB1c \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename prHat_bufB1c \
    op interface \
    ports { prHat_bufB1c_address0 { O 11 vector } prHat_bufB1c_ce0 { O 1 bit } prHat_bufB1c_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prHat_bufB1c'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1403 \
    name prHat_bufB3a \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename prHat_bufB3a \
    op interface \
    ports { prHat_bufB3a_address0 { O 11 vector } prHat_bufB3a_ce0 { O 1 bit } prHat_bufB3a_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prHat_bufB3a'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1404 \
    name prHat_bufB3c \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename prHat_bufB3c \
    op interface \
    ports { prHat_bufB3c_address0 { O 11 vector } prHat_bufB3c_ce0 { O 1 bit } prHat_bufB3c_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prHat_bufB3c'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1405 \
    name prHat_bufB5a \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename prHat_bufB5a \
    op interface \
    ports { prHat_bufB5a_address0 { O 11 vector } prHat_bufB5a_ce0 { O 1 bit } prHat_bufB5a_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prHat_bufB5a'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1406 \
    name prHat_bufB5c \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename prHat_bufB5c \
    op interface \
    ports { prHat_bufB5c_address0 { O 11 vector } prHat_bufB5c_ce0 { O 1 bit } prHat_bufB5c_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prHat_bufB5c'"
}
}


# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1220 \
    name inxtab_0 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_inxtab_0 \
    op interface \
    ports { inxtab_0 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1221 \
    name Eta_ans_0 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_Eta_ans_0 \
    op interface \
    ports { Eta_ans_0 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1223 \
    name Eta_ans_1_32 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_Eta_ans_1_32 \
    op interface \
    ports { Eta_ans_1_32 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1224 \
    name Eta_ans_2_25 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_Eta_ans_2_25 \
    op interface \
    ports { Eta_ans_2_25 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1225 \
    name Eta_ans_3_0 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_Eta_ans_3_0 \
    op interface \
    ports { Eta_ans_3_0 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1227 \
    name Eta_ans_3_1 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_Eta_ans_3_1 \
    op interface \
    ports { Eta_ans_3_1 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1228 \
    name Eta_ans_3_2 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_Eta_ans_3_2 \
    op interface \
    ports { Eta_ans_3_2 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1229 \
    name Eta_tabx_0 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_Eta_tabx_0 \
    op interface \
    ports { Eta_tabx_0 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1231 \
    name Eta_tabx_1 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_Eta_tabx_1 \
    op interface \
    ports { Eta_tabx_1 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1233 \
    name Eta_tabx_2 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_Eta_tabx_2 \
    op interface \
    ports { Eta_tabx_2 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1235 \
    name Eta_tabe_0 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_Eta_tabe_0 \
    op interface \
    ports { Eta_tabe_0 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1237 \
    name Eta_tabe_1 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_Eta_tabe_1 \
    op interface \
    ports { Eta_tabe_1 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1239 \
    name Eta_tabe_2 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_Eta_tabe_2 \
    op interface \
    ports { Eta_tabe_2 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1245 \
    name inxtab_1 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_inxtab_1 \
    op interface \
    ports { inxtab_1 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1246 \
    name Eta_ans_1_0 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_Eta_ans_1_0 \
    op interface \
    ports { Eta_ans_1_0 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1247 \
    name Eta_taby_0 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_Eta_taby_0 \
    op interface \
    ports { Eta_taby_0 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1249 \
    name Eta_ans_1_1 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_Eta_ans_1_1 \
    op interface \
    ports { Eta_ans_1_1 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1250 \
    name Eta_taby_1 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_Eta_taby_1 \
    op interface \
    ports { Eta_taby_1 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1252 \
    name Eta_ans_1_2 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_Eta_ans_1_2 \
    op interface \
    ports { Eta_ans_1_2 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1253 \
    name Eta_taby_2 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_Eta_taby_2 \
    op interface \
    ports { Eta_taby_2 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1255 \
    name Eta_ans_1_3 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_Eta_ans_1_3 \
    op interface \
    ports { Eta_ans_1_3 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1256 \
    name Eta_taby_3 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_Eta_taby_3 \
    op interface \
    ports { Eta_taby_3 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1258 \
    name Eta_ans_1_4 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_Eta_ans_1_4 \
    op interface \
    ports { Eta_ans_1_4 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1259 \
    name Eta_taby_4 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_Eta_taby_4 \
    op interface \
    ports { Eta_taby_4 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1261 \
    name Eta_ans_1_5 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_Eta_ans_1_5 \
    op interface \
    ports { Eta_ans_1_5 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1262 \
    name Eta_taby_5 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_Eta_taby_5 \
    op interface \
    ports { Eta_taby_5 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1264 \
    name Eta_ans_1_6 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_Eta_ans_1_6 \
    op interface \
    ports { Eta_ans_1_6 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1265 \
    name Eta_taby_6 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_Eta_taby_6 \
    op interface \
    ports { Eta_taby_6 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1267 \
    name Eta_ans_1_7 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_Eta_ans_1_7 \
    op interface \
    ports { Eta_ans_1_7 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1268 \
    name Eta_taby_7 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_Eta_taby_7 \
    op interface \
    ports { Eta_taby_7 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1270 \
    name Eta_ans_1_8 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_Eta_ans_1_8 \
    op interface \
    ports { Eta_ans_1_8 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1271 \
    name Eta_taby_8 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_Eta_taby_8 \
    op interface \
    ports { Eta_taby_8 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1273 \
    name Eta_ans_1_9 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_Eta_ans_1_9 \
    op interface \
    ports { Eta_ans_1_9 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1274 \
    name Eta_taby_9 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_Eta_taby_9 \
    op interface \
    ports { Eta_taby_9 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1276 \
    name Eta_ans_4_0 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_Eta_ans_4_0 \
    op interface \
    ports { Eta_ans_4_0 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1277 \
    name Eta_tabf_0 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_Eta_tabf_0 \
    op interface \
    ports { Eta_tabf_0 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1279 \
    name Eta_ans_4_1 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_Eta_ans_4_1 \
    op interface \
    ports { Eta_ans_4_1 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1280 \
    name Eta_tabf_1 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_Eta_tabf_1 \
    op interface \
    ports { Eta_tabf_1 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1282 \
    name Eta_ans_4_2 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_Eta_ans_4_2 \
    op interface \
    ports { Eta_ans_4_2 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1283 \
    name Eta_tabf_2 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_Eta_tabf_2 \
    op interface \
    ports { Eta_tabf_2 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1285 \
    name Eta_ans_4_3 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_Eta_ans_4_3 \
    op interface \
    ports { Eta_ans_4_3 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1286 \
    name Eta_tabf_3 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_Eta_tabf_3 \
    op interface \
    ports { Eta_tabf_3 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1288 \
    name Eta_ans_4_4 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_Eta_ans_4_4 \
    op interface \
    ports { Eta_ans_4_4 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1289 \
    name Eta_tabf_4 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_Eta_tabf_4 \
    op interface \
    ports { Eta_tabf_4 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1291 \
    name Eta_ans_4_5 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_Eta_ans_4_5 \
    op interface \
    ports { Eta_ans_4_5 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1292 \
    name Eta_tabf_5 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_Eta_tabf_5 \
    op interface \
    ports { Eta_tabf_5 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1294 \
    name Eta_ans_4_6 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_Eta_ans_4_6 \
    op interface \
    ports { Eta_ans_4_6 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1295 \
    name Eta_tabf_6 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_Eta_tabf_6 \
    op interface \
    ports { Eta_tabf_6 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1297 \
    name Eta_ans_4_7 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_Eta_ans_4_7 \
    op interface \
    ports { Eta_ans_4_7 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1298 \
    name Eta_tabf_7 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_Eta_tabf_7 \
    op interface \
    ports { Eta_tabf_7 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1300 \
    name Eta_ans_4_8 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_Eta_ans_4_8 \
    op interface \
    ports { Eta_ans_4_8 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1301 \
    name Eta_tabf_8 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_Eta_tabf_8 \
    op interface \
    ports { Eta_tabf_8 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1303 \
    name Eta_ans_4_9 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_Eta_ans_4_9 \
    op interface \
    ports { Eta_ans_4_9 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1304 \
    name Eta_tabf_9 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_Eta_tabf_9 \
    op interface \
    ports { Eta_tabf_9 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1325 \
    name inxtab_2 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_inxtab_2 \
    op interface \
    ports { inxtab_2 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1326 \
    name Eta_ans_2_0 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_Eta_ans_2_0 \
    op interface \
    ports { Eta_ans_2_0 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1327 \
    name Eta_tabz_0 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_Eta_tabz_0 \
    op interface \
    ports { Eta_tabz_0 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1329 \
    name Eta_ans_2_1 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_Eta_ans_2_1 \
    op interface \
    ports { Eta_ans_2_1 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1330 \
    name Eta_tabz_1 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_Eta_tabz_1 \
    op interface \
    ports { Eta_tabz_1 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1332 \
    name Eta_ans_2_2 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_Eta_ans_2_2 \
    op interface \
    ports { Eta_ans_2_2 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1333 \
    name Eta_tabz_2 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_Eta_tabz_2 \
    op interface \
    ports { Eta_tabz_2 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1335 \
    name Eta_ans_2_3 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_Eta_ans_2_3 \
    op interface \
    ports { Eta_ans_2_3 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1336 \
    name Eta_tabz_3 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_Eta_tabz_3 \
    op interface \
    ports { Eta_tabz_3 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1338 \
    name Eta_ans_2_4 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_Eta_ans_2_4 \
    op interface \
    ports { Eta_ans_2_4 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1339 \
    name Eta_tabz_4 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_Eta_tabz_4 \
    op interface \
    ports { Eta_tabz_4 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1341 \
    name Eta_ans_2_5 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_Eta_ans_2_5 \
    op interface \
    ports { Eta_ans_2_5 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1342 \
    name Eta_tabz_5 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_Eta_tabz_5 \
    op interface \
    ports { Eta_tabz_5 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1344 \
    name Eta_ans_2_6 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_Eta_ans_2_6 \
    op interface \
    ports { Eta_ans_2_6 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1345 \
    name Eta_tabz_6 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_Eta_tabz_6 \
    op interface \
    ports { Eta_tabz_6 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1347 \
    name Eta_ans_2_7 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_Eta_ans_2_7 \
    op interface \
    ports { Eta_ans_2_7 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1348 \
    name Eta_tabz_7 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_Eta_tabz_7 \
    op interface \
    ports { Eta_tabz_7 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1350 \
    name Eta_ans_2_8 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_Eta_ans_2_8 \
    op interface \
    ports { Eta_ans_2_8 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1351 \
    name Eta_tabz_8 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_Eta_tabz_8 \
    op interface \
    ports { Eta_tabz_8 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1353 \
    name Eta_ans_2_9 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_Eta_ans_2_9 \
    op interface \
    ports { Eta_ans_2_9 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1354 \
    name Eta_tabz_9 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_Eta_tabz_9 \
    op interface \
    ports { Eta_tabz_9 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1356 \
    name Eta_ans_5_0 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_Eta_ans_5_0 \
    op interface \
    ports { Eta_ans_5_0 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1357 \
    name Eta_tabg_0 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_Eta_tabg_0 \
    op interface \
    ports { Eta_tabg_0 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1359 \
    name Eta_ans_5_1 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_Eta_ans_5_1 \
    op interface \
    ports { Eta_ans_5_1 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1360 \
    name Eta_tabg_1 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_Eta_tabg_1 \
    op interface \
    ports { Eta_tabg_1 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1362 \
    name Eta_ans_5_2 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_Eta_ans_5_2 \
    op interface \
    ports { Eta_ans_5_2 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1363 \
    name Eta_tabg_2 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_Eta_tabg_2 \
    op interface \
    ports { Eta_tabg_2 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1365 \
    name Eta_ans_5_3 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_Eta_ans_5_3 \
    op interface \
    ports { Eta_ans_5_3 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1366 \
    name Eta_tabg_3 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_Eta_tabg_3 \
    op interface \
    ports { Eta_tabg_3 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1368 \
    name Eta_ans_5_4 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_Eta_ans_5_4 \
    op interface \
    ports { Eta_ans_5_4 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1369 \
    name Eta_tabg_4 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_Eta_tabg_4 \
    op interface \
    ports { Eta_tabg_4 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1371 \
    name Eta_ans_5_5 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_Eta_ans_5_5 \
    op interface \
    ports { Eta_ans_5_5 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1372 \
    name Eta_tabg_5 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_Eta_tabg_5 \
    op interface \
    ports { Eta_tabg_5 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1374 \
    name Eta_ans_5_6 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_Eta_ans_5_6 \
    op interface \
    ports { Eta_ans_5_6 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1375 \
    name Eta_tabg_6 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_Eta_tabg_6 \
    op interface \
    ports { Eta_tabg_6 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1377 \
    name Eta_ans_5_7 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_Eta_ans_5_7 \
    op interface \
    ports { Eta_ans_5_7 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1378 \
    name Eta_tabg_7 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_Eta_tabg_7 \
    op interface \
    ports { Eta_tabg_7 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1380 \
    name Eta_ans_5_8 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_Eta_ans_5_8 \
    op interface \
    ports { Eta_ans_5_8 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1381 \
    name Eta_tabg_8 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_Eta_tabg_8 \
    op interface \
    ports { Eta_tabg_8 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1383 \
    name Eta_ans_5_9 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_Eta_ans_5_9 \
    op interface \
    ports { Eta_ans_5_9 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1384 \
    name Eta_tabg_9 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_Eta_tabg_9 \
    op interface \
    ports { Eta_tabg_9 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1407 \
    name bAllChecksPassed \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_bAllChecksPassed \
    op interface \
    ports { bAllChecksPassed { O 1 vector } bAllChecksPassed_ap_vld { O 1 bit } } \
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


# Adapter definition:
set PortName ap_ce
set DataWd 1 
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc cg_default_interface_gen_ce] == "cg_default_interface_gen_ce"} {
eval "cg_default_interface_gen_ce { \
    id -4 \
    name ${PortName} \
    reset_level 1 \
    sync_rst true \
    corename apif_ap_ce \
    data_wd ${DataWd} \
    op interface \
}"
} else {
puts "@W \[IMPL-113\] Cannot find bus interface model in the library. Ignored generation of bus interface for '${PortName}'"
}
}



# merge
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_end
    cg_default_interface_gen_bundle_end
    AESL_LIB_XILADAPTER::native_axis_end
}


