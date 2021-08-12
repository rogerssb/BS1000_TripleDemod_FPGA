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
    name block_V \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_block_V \
    op interface \
    ports { block_V { I 2 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1 \
    name code_V \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_code_V \
    op interface \
    ports { code_V { I 2 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2 \
    name run \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_run \
    op interface \
    ports { run { I 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3 \
    name init_start \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_init_start \
    op interface \
    ports { init_start { O 1 bit } init_start_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4 \
    name init_done \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_init_done \
    op interface \
    ports { init_done { I 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5 \
    name init_ready \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_init_ready \
    op interface \
    ports { init_ready { I 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 6 \
    name buff_start \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_buff_start \
    op interface \
    ports { buff_start { O 1 bit } buff_start_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 7 \
    name status_V \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_status_V \
    op interface \
    ports { status_V { O 2 vector } status_V_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 8 \
    name err_code \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_err_code \
    op interface \
    ports { err_code { O 16 vector } err_code_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 9 \
    name size_V \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_size_V \
    op interface \
    ports { size_V { O 2 vector } size_V_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 10 \
    name rate_V \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_rate_V \
    op interface \
    ports { rate_V { O 2 vector } rate_V_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 11 \
    name buff_reset \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_buff_reset \
    op interface \
    ports { buff_reset { O 1 bit } buff_reset_ap_vld { O 1 bit } } \
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


