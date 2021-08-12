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
    id 1 \
    name r_dat0 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename r_dat0 \
    op interface \
    ports { r_dat0_address0 { O 11 vector } r_dat0_ce0 { O 1 bit } r_dat0_we0 { O 1 bit } r_dat0_d0 { O 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'r_dat0'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2 \
    name r_dat1 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename r_dat1 \
    op interface \
    ports { r_dat1_address0 { O 11 vector } r_dat1_ce0 { O 1 bit } r_dat1_we0 { O 1 bit } r_dat1_d0 { O 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'r_dat1'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 3 \
    name r_dat2 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename r_dat2 \
    op interface \
    ports { r_dat2_address0 { O 11 vector } r_dat2_ce0 { O 1 bit } r_dat2_we0 { O 1 bit } r_dat2_d0 { O 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'r_dat2'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 4 \
    name r_dat3 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename r_dat3 \
    op interface \
    ports { r_dat3_address0 { O 11 vector } r_dat3_ce0 { O 1 bit } r_dat3_we0 { O 1 bit } r_dat3_d0 { O 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'r_dat3'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5 \
    name r_dat4 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename r_dat4 \
    op interface \
    ports { r_dat4_address0 { O 10 vector } r_dat4_ce0 { O 1 bit } r_dat4_we0 { O 1 bit } r_dat4_d0 { O 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'r_dat4'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 6 \
    name r_dat5 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename r_dat5 \
    op interface \
    ports { r_dat5_address0 { O 10 vector } r_dat5_ce0 { O 1 bit } r_dat5_we0 { O 1 bit } r_dat5_d0 { O 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'r_dat5'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 7 \
    name r_dat6 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename r_dat6 \
    op interface \
    ports { r_dat6_address0 { O 10 vector } r_dat6_ce0 { O 1 bit } r_dat6_we0 { O 1 bit } r_dat6_d0 { O 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'r_dat6'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 8 \
    name r_dat7 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename r_dat7 \
    op interface \
    ports { r_dat7_address0 { O 10 vector } r_dat7_ce0 { O 1 bit } r_dat7_we0 { O 1 bit } r_dat7_d0 { O 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'r_dat7'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 9 \
    name r_dat8 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename r_dat8 \
    op interface \
    ports { r_dat8_address0 { O 10 vector } r_dat8_ce0 { O 1 bit } r_dat8_we0 { O 1 bit } r_dat8_d0 { O 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'r_dat8'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 10 \
    name r_dat9 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename r_dat9 \
    op interface \
    ports { r_dat9_address0 { O 10 vector } r_dat9_ce0 { O 1 bit } r_dat9_we0 { O 1 bit } r_dat9_d0 { O 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'r_dat9'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 11 \
    name r_dat10 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename r_dat10 \
    op interface \
    ports { r_dat10_address0 { O 10 vector } r_dat10_ce0 { O 1 bit } r_dat10_we0 { O 1 bit } r_dat10_d0 { O 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'r_dat10'"
}
}


# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 0 \
    name dat \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_dat \
    op interface \
    ports { dat { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 12 \
    name mem \
    type other \
    dir IO \
    reset_level 1 \
    sync_rst true \
    corename dc_mem \
    op interface \
    ports { mem_i { I 16 vector } mem_o { O 16 vector } mem_o_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 13 \
    name pos_r \
    type other \
    dir IO \
    reset_level 1 \
    sync_rst true \
    corename dc_pos_r \
    op interface \
    ports { pos_r_i { I 16 vector } pos_r_o { O 16 vector } pos_r_o_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 14 \
    name trig \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_trig \
    op interface \
    ports { trig { I 12 vector } } \
} "
}



# merge
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_end
    cg_default_interface_gen_bundle_end
    AESL_LIB_XILADAPTER::native_axis_end
}


