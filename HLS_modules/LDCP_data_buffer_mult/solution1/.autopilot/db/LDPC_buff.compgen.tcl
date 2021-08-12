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
    id 17 \
    name raw_dat0 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename raw_dat0 \
    op interface \
    ports { raw_dat0_address0 { O 11 vector } raw_dat0_ce0 { O 1 bit } raw_dat0_we0 { O 1 bit } raw_dat0_d0 { O 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'raw_dat0'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 18 \
    name raw_dat1 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename raw_dat1 \
    op interface \
    ports { raw_dat1_address0 { O 11 vector } raw_dat1_ce0 { O 1 bit } raw_dat1_we0 { O 1 bit } raw_dat1_d0 { O 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'raw_dat1'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 19 \
    name raw_dat2 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename raw_dat2 \
    op interface \
    ports { raw_dat2_address0 { O 11 vector } raw_dat2_ce0 { O 1 bit } raw_dat2_we0 { O 1 bit } raw_dat2_d0 { O 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'raw_dat2'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 20 \
    name raw_dat3 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename raw_dat3 \
    op interface \
    ports { raw_dat3_address0 { O 11 vector } raw_dat3_ce0 { O 1 bit } raw_dat3_we0 { O 1 bit } raw_dat3_d0 { O 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'raw_dat3'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 21 \
    name raw_dat4 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename raw_dat4 \
    op interface \
    ports { raw_dat4_address0 { O 10 vector } raw_dat4_ce0 { O 1 bit } raw_dat4_we0 { O 1 bit } raw_dat4_d0 { O 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'raw_dat4'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 22 \
    name raw_dat5 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename raw_dat5 \
    op interface \
    ports { raw_dat5_address0 { O 10 vector } raw_dat5_ce0 { O 1 bit } raw_dat5_we0 { O 1 bit } raw_dat5_d0 { O 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'raw_dat5'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 23 \
    name raw_dat6 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename raw_dat6 \
    op interface \
    ports { raw_dat6_address0 { O 10 vector } raw_dat6_ce0 { O 1 bit } raw_dat6_we0 { O 1 bit } raw_dat6_d0 { O 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'raw_dat6'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 24 \
    name raw_dat7 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename raw_dat7 \
    op interface \
    ports { raw_dat7_address0 { O 10 vector } raw_dat7_ce0 { O 1 bit } raw_dat7_we0 { O 1 bit } raw_dat7_d0 { O 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'raw_dat7'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 25 \
    name raw_dat8 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename raw_dat8 \
    op interface \
    ports { raw_dat8_address0 { O 10 vector } raw_dat8_ce0 { O 1 bit } raw_dat8_we0 { O 1 bit } raw_dat8_d0 { O 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'raw_dat8'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 26 \
    name raw_dat9 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename raw_dat9 \
    op interface \
    ports { raw_dat9_address0 { O 10 vector } raw_dat9_ce0 { O 1 bit } raw_dat9_we0 { O 1 bit } raw_dat9_d0 { O 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'raw_dat9'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 27 \
    name raw_dat10 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename raw_dat10 \
    op interface \
    ports { raw_dat10_address0 { O 10 vector } raw_dat10_ce0 { O 1 bit } raw_dat10_we0 { O 1 bit } raw_dat10_d0 { O 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'raw_dat10'"
}
}


# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 15 \
    name data_in \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_data_in \
    op interface \
    ports { data_in { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 16 \
    name reset \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_reset \
    op interface \
    ports { reset { I 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 28 \
    name numbits_V \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_numbits_V \
    op interface \
    ports { numbits_V { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 29 \
    name overrun \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_overrun \
    op interface \
    ports { overrun { O 1 bit } overrun_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 30 \
    name full \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_full \
    op interface \
    ports { full { O 1 bit } full_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 31 \
    name write_r \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_write_r \
    op interface \
    ports { write_r { I 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 32 \
    name deran_V \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_deran_V \
    op interface \
    ports { deran_V { I 2 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 33 \
    name mux \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_mux \
    op interface \
    ports { mux { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 34 \
    name decode_done \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_decode_done \
    op interface \
    ports { decode_done { I 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 35 \
    name decode_start \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_decode_start \
    op interface \
    ports { decode_start { O 1 bit } decode_start_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 36 \
    name decode_ready \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_decode_ready \
    op interface \
    ports { decode_ready { I 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 37 \
    name decode_done_b \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_decode_done_b \
    op interface \
    ports { decode_done_b { I 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 38 \
    name decode_start_b \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_decode_start_b \
    op interface \
    ports { decode_start_b { O 1 bit } decode_start_b_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 39 \
    name decode_ready_b \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_decode_ready_b \
    op interface \
    ports { decode_ready_b { I 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 40 \
    name deran_data \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_deran_data \
    op interface \
    ports { deran_data { O 8 vector } deran_data_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 41 \
    name cur_write_pos_V \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_cur_write_pos_V \
    op interface \
    ports { cur_write_pos_V { O 16 vector } cur_write_pos_V_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 42 \
    name out_mux \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_out_mux \
    op interface \
    ports { out_mux { I 1 bit } } \
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


