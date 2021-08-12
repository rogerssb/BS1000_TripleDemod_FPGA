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
    id 759 \
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
    id 763 \
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
    id 767 \
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
    id 768 \
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
    id 770 \
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
    id 771 \
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
    id 773 \
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
    id 774 \
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
    id 776 \
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
    id 777 \
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
    id 779 \
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
    id 780 \
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
    id 782 \
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
    id 783 \
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
    id 784 \
    name prHat_buf2 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename prHat_buf2 \
    op interface \
    ports { prHat_buf2_address0 { O 11 vector } prHat_buf2_ce0 { O 1 bit } prHat_buf2_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prHat_buf2'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 785 \
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
    id 786 \
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
    id 790 \
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
    id 791 \
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
    id 794 \
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
    id 795 \
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
    id 798 \
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
    id 799 \
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
    id 802 \
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
    id 803 \
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
    id 806 \
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
    id 807 \
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
    id 810 \
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
    id 811 \
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
    id 814 \
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
    id 815 \
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
    id 818 \
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
    id 819 \
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
    id 822 \
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
    id 823 \
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
    id 826 \
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
    id 827 \
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
    id 830 \
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
    id 831 \
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
    id 834 \
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
    id 835 \
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
    id 836 \
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
    id 837 \
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
    id 838 \
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
    id 839 \
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
    id 840 \
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
    id 841 \
    name prHat_buf1 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename prHat_buf1 \
    op interface \
    ports { prHat_buf1_address0 { O 11 vector } prHat_buf1_ce0 { O 1 bit } prHat_buf1_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prHat_buf1'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 842 \
    name prHat_buf3 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename prHat_buf3 \
    op interface \
    ports { prHat_buf3_address0 { O 11 vector } prHat_buf3_ce0 { O 1 bit } prHat_buf3_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prHat_buf3'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 843 \
    name prHat_bufA4 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename prHat_bufA4 \
    op interface \
    ports { prHat_bufA4_address0 { O 11 vector } prHat_bufA4_ce0 { O 1 bit } prHat_bufA4_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prHat_bufA4'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 844 \
    name prHat_bufA4b \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename prHat_bufA4b \
    op interface \
    ports { prHat_bufA4b_address0 { O 11 vector } prHat_bufA4b_ce0 { O 1 bit } prHat_bufA4b_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prHat_bufA4b'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 845 \
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
    id 846 \
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
    id 847 \
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
    id 848 \
    name prHat_bufA4a \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename prHat_bufA4a \
    op interface \
    ports { prHat_bufA4a_address0 { O 11 vector } prHat_bufA4a_ce0 { O 1 bit } prHat_bufA4a_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prHat_bufA4a'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 852 \
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
    id 853 \
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
    id 856 \
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
    id 857 \
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
    id 860 \
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
    id 861 \
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
    id 864 \
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
    id 865 \
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
    id 868 \
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
    id 869 \
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
    id 872 \
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
    id 873 \
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
    id 876 \
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
    id 877 \
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
    id 880 \
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
    id 881 \
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
    id 884 \
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
    id 885 \
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
    id 888 \
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
    id 889 \
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
    id 892 \
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
    id 893 \
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
    id 896 \
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
    id 897 \
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
    id 898 \
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
    id 899 \
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
    id 900 \
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
    id 901 \
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
    id 902 \
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
    id 903 \
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
    id 904 \
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
    id 905 \
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
    id 906 \
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
    id 907 \
    name prHat_bufB4 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename prHat_bufB4 \
    op interface \
    ports { prHat_bufB4_address0 { O 11 vector } prHat_bufB4_ce0 { O 1 bit } prHat_bufB4_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prHat_bufB4'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 908 \
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
    id 909 \
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
    id 910 \
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
    id 911 \
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


# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 757 \
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
    id 758 \
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
    id 760 \
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
    id 761 \
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
    id 762 \
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
    id 764 \
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
    id 765 \
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
    id 766 \
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
    id 769 \
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
    id 772 \
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
    id 775 \
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
    id 778 \
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
    id 781 \
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
    id 787 \
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
    id 788 \
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
    id 789 \
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
    id 792 \
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
    id 793 \
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
    id 796 \
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
    id 797 \
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
    id 800 \
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
    id 801 \
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
    id 804 \
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
    id 805 \
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
    id 808 \
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
    id 809 \
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
    id 812 \
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
    id 813 \
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
    id 816 \
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
    id 817 \
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
    id 820 \
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
    id 821 \
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
    id 824 \
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
    id 825 \
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
    id 828 \
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
    id 829 \
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
    id 832 \
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
    id 833 \
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
    id 849 \
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
    id 850 \
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
    id 851 \
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
    id 854 \
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
    id 855 \
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
    id 858 \
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
    id 859 \
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
    id 862 \
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
    id 863 \
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
    id 866 \
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
    id 867 \
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
    id 870 \
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
    id 871 \
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
    id 874 \
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
    id 875 \
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
    id 878 \
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
    id 879 \
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
    id 882 \
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
    id 883 \
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
    id 886 \
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
    id 887 \
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
    id 890 \
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
    id 891 \
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
    id 894 \
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
    id 895 \
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
    id 912 \
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


