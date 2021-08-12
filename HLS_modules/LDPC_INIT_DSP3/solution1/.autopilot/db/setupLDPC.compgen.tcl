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
    id 25 \
    name etaIndexM_V \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename etaIndexM_V \
    op interface \
    ports { etaIndexM_V_address0 { O 16 vector } etaIndexM_V_ce0 { O 1 bit } etaIndexM_V_we0 { O 1 bit } etaIndexM_V_d0 { O 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'etaIndexM_V'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 26 \
    name etaIndexN_V \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename etaIndexN_V \
    op interface \
    ports { etaIndexN_V_address0 { O 16 vector } etaIndexN_V_ce0 { O 1 bit } etaIndexN_V_we0 { O 1 bit } etaIndexN_V_d0 { O 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'etaIndexN_V'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 27 \
    name lambdaIndexM_V \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename lambdaIndexM_V \
    op interface \
    ports { lambdaIndexM_V_address0 { O 16 vector } lambdaIndexM_V_ce0 { O 1 bit } lambdaIndexM_V_we0 { O 1 bit } lambdaIndexM_V_d0 { O 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'lambdaIndexM_V'"
}
}


# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 18 \
    name size_V \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_size_V \
    op interface \
    ports { size_V { I 2 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 19 \
    name rate_V \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rate_V \
    op interface \
    ports { rate_V { I 2 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 20 \
    name nR_M_V \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_nR_M_V \
    op interface \
    ports { nR_M_V { O 16 vector } nR_M_V_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 21 \
    name etaIndexM_M_V \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_etaIndexM_M_V \
    op interface \
    ports { etaIndexM_M_V { O 16 vector } etaIndexM_M_V_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 22 \
    name etaIndexN_M_V \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_etaIndexN_M_V \
    op interface \
    ports { etaIndexN_M_V { O 16 vector } etaIndexN_M_V_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 23 \
    name pCodeM_V \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_pCodeM_V \
    op interface \
    ports { pCodeM_V { O 16 vector } pCodeM_V_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 24 \
    name pMaxIterations_V \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_pMaxIterations_V \
    op interface \
    ports { pMaxIterations_V { O 16 vector } pMaxIterations_V_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 28 \
    name dout \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_dout \
    op interface \
    ports { dout { O 1 vector } dout_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 29 \
    name din \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_din \
    op interface \
    ports { din { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 30 \
    name cs \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_cs \
    op interface \
    ports { cs { O 1 vector } cs_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 31 \
    name clk \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_clk \
    op interface \
    ports { clk { O 1 vector } clk_ap_vld { O 1 bit } } \
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


