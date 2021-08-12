# This script segment is generated automatically by AutoPilot

# clear list
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_begin
    cg_default_interface_gen_bundle_begin
    AESL_LIB_XILADAPTER::native_axis_begin
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 0 \
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
    id 1 \
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
    id 2 \
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
    id 3 \
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
    id 4 \
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
    id 5 \
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
    id 6 \
    name numbits_V \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_numbits_V \
    op interface \
    ports { numbits_V { O 16 vector } numbits_V_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 7 \
    name split_V \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_split_V \
    op interface \
    ports { split_V { O 16 vector } split_V_ap_vld { O 1 bit } } \
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



# merge
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_end
    cg_default_interface_gen_bundle_end
    AESL_LIB_XILADAPTER::native_axis_end
}


