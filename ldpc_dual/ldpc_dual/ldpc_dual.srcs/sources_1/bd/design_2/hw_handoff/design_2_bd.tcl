
################################################################
# This is a generated script based on design: design_2
#
# Though there are limitations about the generated script,
# the main purpose of this utility is to make learning
# IP Integrator Tcl commands easier.
################################################################

namespace eval _tcl {
proc get_script_folder {} {
   set script_path [file normalize [info script]]
   set script_folder [file dirname $script_path]
   return $script_folder
}
}
variable script_folder
set script_folder [_tcl::get_script_folder]

################################################################
# Check if script is running in correct Vivado version.
################################################################
set scripts_vivado_version 2016.3
set current_vivado_version [version -short]

if { [string first $scripts_vivado_version $current_vivado_version] == -1 } {
   puts ""
   catch {common::send_msg_id "BD_TCL-109" "ERROR" "This script was generated using Vivado <$scripts_vivado_version> and is being run in <$current_vivado_version> of Vivado. Please run the script in Vivado <$scripts_vivado_version> then open the design in Vivado <$current_vivado_version>. Upgrade the design by running \"Tools => Report => Report IP Status...\", then run write_bd_tcl to create an updated script."}

   return 1
}

################################################################
# START
################################################################

# To test this script, run the following commands from Vivado Tcl console:
# source design_2_script.tcl

# If there is no project opened, this script will create a
# project, but make sure you do not have an existing project
# <./myproj/project_1.xpr> in the current working folder.

set list_projs [get_projects -quiet]
if { $list_projs eq "" } {
   create_project project_1 myproj -part xc7k160tfbg676-1
}


# CHANGE DESIGN NAME HERE
set design_name design_2

# If you do not already have an existing IP Integrator design open,
# you can create a design using the following command:
#    create_bd_design $design_name

# Creating design if needed
set errMsg ""
set nRet 0

set cur_design [current_bd_design -quiet]
set list_cells [get_bd_cells -quiet]

if { ${design_name} eq "" } {
   # USE CASES:
   #    1) Design_name not set

   set errMsg "Please set the variable <design_name> to a non-empty value."
   set nRet 1

} elseif { ${cur_design} ne "" && ${list_cells} eq "" } {
   # USE CASES:
   #    2): Current design opened AND is empty AND names same.
   #    3): Current design opened AND is empty AND names diff; design_name NOT in project.
   #    4): Current design opened AND is empty AND names diff; design_name exists in project.

   if { $cur_design ne $design_name } {
      common::send_msg_id "BD_TCL-001" "INFO" "Changing value of <design_name> from <$design_name> to <$cur_design> since current design is empty."
      set design_name [get_property NAME $cur_design]
   }
   common::send_msg_id "BD_TCL-002" "INFO" "Constructing design in IPI design <$cur_design>..."

} elseif { ${cur_design} ne "" && $list_cells ne "" && $cur_design eq $design_name } {
   # USE CASES:
   #    5) Current design opened AND has components AND same names.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 1
} elseif { [get_files -quiet ${design_name}.bd] ne "" } {
   # USE CASES: 
   #    6) Current opened design, has components, but diff names, design_name exists in project.
   #    7) No opened design, design_name exists in project.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 2

} else {
   # USE CASES:
   #    8) No opened design, design_name not in project.
   #    9) Current opened design, has components, but diff names, design_name not in project.

   common::send_msg_id "BD_TCL-003" "INFO" "Currently there is no design <$design_name> in project, so creating one..."

   create_bd_design $design_name

   common::send_msg_id "BD_TCL-004" "INFO" "Making design <$design_name> as current_bd_design."
   current_bd_design $design_name

}

common::send_msg_id "BD_TCL-005" "INFO" "Currently the variable <design_name> is equal to \"$design_name\"."

if { $nRet != 0 } {
   catch {common::send_msg_id "BD_TCL-114" "ERROR" $errMsg}
   return $nRet
}

##################################################################
# DESIGN PROCs
##################################################################



# Procedure to create entire design; Provide argument to make
# procedure reusable. If parentCell is "", will use root.
proc create_root_design { parentCell } {

  variable script_folder

  if { $parentCell eq "" } {
     set parentCell [get_bd_cells /]
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj


  # Create interface ports

  # Create ports
  set BLOCK_RATE [ create_bd_port -dir I -from 1 -to 0 BLOCK_RATE ]
  set BLOCK_SIZE [ create_bd_port -dir I -from 1 -to 0 BLOCK_SIZE ]
  set DECODE_OUT [ create_bd_port -dir O -from 0 -to 0 DECODE_OUT ]
  set DECODE_OUT_VALID [ create_bd_port -dir O DECODE_OUT_VALID ]
  set Decoder_B_Iterations [ create_bd_port -dir O -from 7 -to 0 -type data Decoder_B_Iterations ]
  set ERR_CODE [ create_bd_port -dir O -from 15 -to 0 ERR_CODE ]
  set Iteration_Number [ create_bd_port -dir O -from 7 -to 0 -type data Iteration_Number ]
  set LDPC_MODE [ create_bd_port -dir O -from 1 -to 0 LDPC_MODE ]
  set LDPC_RUN [ create_bd_port -dir I LDPC_RUN ]
  set buff_ready [ create_bd_port -dir O -from 0 -to 0 buff_ready ]
  set clk_div [ create_bd_port -dir I -from 15 -to 0 -type data clk_div ]
  set_property -dict [ list \
CONFIG.LAYERED_METADATA {xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 16} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value true}}}}}} \
 ] $clk_div
  set clock_rtl [ create_bd_port -dir I -type clk clock_rtl ]
  set_property -dict [ list \
CONFIG.FREQ_HZ {100000000} \
CONFIG.PHASE {0.000} \
 ] $clock_rtl
  set cnt [ create_bd_port -dir O -from 31 -to 0 -type data cnt ]
  set cnt_B [ create_bd_port -dir O -from 31 -to 0 -type data cnt_B ]
  set cur_read_pos_V [ create_bd_port -dir O -from 15 -to 0 -type data cur_read_pos_V ]
  set cur_write_pos_V [ create_bd_port -dir O -from 15 -to 0 -type data cur_write_pos_V ]
  set data_in [ create_bd_port -dir I -from 7 -to 0 -type data data_in ]
  set_property -dict [ list \
CONFIG.LAYERED_METADATA {xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 8} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value true}}}}}} \
 ] $data_in
  set deran_data [ create_bd_port -dir O -from 7 -to 0 -type data deran_data ]
  set deran_data_ap_vld [ create_bd_port -dir O deran_data_ap_vld ]
  set deran_sel [ create_bd_port -dir I -from 1 -to 0 -type data deran_sel ]
  set_property -dict [ list \
CONFIG.LAYERED_METADATA {xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 2} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value false}}}}}} \
 ] $deran_sel
  set full [ create_bd_port -dir O -from 0 -to 0 -type data full ]
  set overrun [ create_bd_port -dir O -from 0 -to 0 -type data overrun ]
  set pMaxIterations [ create_bd_port -dir I -from 15 -to 0 -type data pMaxIterations ]
  set_property -dict [ list \
CONFIG.LAYERED_METADATA {xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 16} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value false}}}}}} \
 ] $pMaxIterations
  set rd_clk_in [ create_bd_port -dir I -from 0 -to 0 -type data rd_clk_in ]
  set_property -dict [ list \
CONFIG.LAYERED_METADATA {xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}}}} \
 ] $rd_clk_in
  set rd_clk_out [ create_bd_port -dir O -from 0 -to 0 -type data rd_clk_out ]
  set read_clk_en [ create_bd_port -dir O -from 0 -to 0 -type data read_clk_en ]
  set reset_rtl [ create_bd_port -dir I -type rst reset_rtl ]
  set_property -dict [ list \
CONFIG.POLARITY {ACTIVE_HIGH} \
 ] $reset_rtl
  set sync [ create_bd_port -dir I -from 0 -to 0 -type data sync ]
  set_property -dict [ list \
CONFIG.LAYERED_METADATA {xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}}}} \
 ] $sync
  set write_clk_en [ create_bd_port -dir I -from 0 -to 0 -type data write_clk_en ]
  set_property -dict [ list \
CONFIG.LAYERED_METADATA {xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}}}} \
 ] $write_clk_en

  # Create instance: CE_not, and set properties
  set CE_not [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 CE_not ]
  set_property -dict [ list \
CONFIG.C_OPERATION {not} \
CONFIG.C_SIZE {1} \
 ] $CE_not

  # Create instance: Decoder_A, and set properties
  set Decoder_A [ create_bd_cell -type ip -vlnv xilinx.com:hls:HLSLdpcLogDecScaledMin:1.0 Decoder_A ]

  # Create instance: Decoder_B, and set properties
  set Decoder_B [ create_bd_cell -type ip -vlnv xilinx.com:hls:HLSLdpcLogDecScaledMin:1.0 Decoder_B ]

  # Create instance: LDPC_CTRL_0, and set properties
  set LDPC_CTRL_0 [ create_bd_cell -type ip -vlnv xilinx.com:hls:LDPC_CTRL:1.0 LDPC_CTRL_0 ]

  # Create instance: LDPC_CTRL_ap_start, and set properties
  set LDPC_CTRL_ap_start [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 LDPC_CTRL_ap_start ]

  # Create instance: LDPC_Div_0, and set properties
  set LDPC_Div_0 [ create_bd_cell -type ip -vlnv xilinx.com:hls:LDPC_Div:1.0 LDPC_Div_0 ]

  # Create instance: LDPC_Out_0, and set properties
  set LDPC_Out_0 [ create_bd_cell -type ip -vlnv xilinx.com:hls:LDPC_Out:1.0 LDPC_Out_0 ]

  # Create instance: LDPC_buff_0, and set properties
  set LDPC_buff_0 [ create_bd_cell -type ip -vlnv xilinx.com:hls:LDPC_buff:1.0 LDPC_buff_0 ]

  # Create instance: buff_rst_lat, and set properties
  set buff_rst_lat [ create_bd_cell -type ip -vlnv xilinx.com:ip:c_addsub:12.0 buff_rst_lat ]
  set_property -dict [ list \
CONFIG.A_Type {Unsigned} \
CONFIG.A_Width {1} \
CONFIG.B_Constant {true} \
CONFIG.B_Type {Unsigned} \
CONFIG.B_Value {0} \
CONFIG.B_Width {1} \
CONFIG.Latency {1} \
CONFIG.Out_Width {1} \
 ] $buff_rst_lat

  # Create instance: buff_start_lat, and set properties
  set buff_start_lat [ create_bd_cell -type ip -vlnv xilinx.com:ip:c_addsub:12.0 buff_start_lat ]
  set_property -dict [ list \
CONFIG.A_Type {Unsigned} \
CONFIG.A_Width {1} \
CONFIG.B_Constant {true} \
CONFIG.B_Type {Unsigned} \
CONFIG.B_Value {0} \
CONFIG.B_Width {1} \
CONFIG.Latency {1} \
CONFIG.Out_Width {1} \
 ] $buff_start_lat

  # Create instance: data_ce_mux, and set properties
  set data_ce_mux [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 data_ce_mux ]
  set_property -dict [ list \
CONFIG.C_SIZE {1} \
 ] $data_ce_mux

  # Create instance: data_ce_mux1, and set properties
  set data_ce_mux1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 data_ce_mux1 ]
  set_property -dict [ list \
CONFIG.C_SIZE {1} \
 ] $data_ce_mux1

  # Create instance: data_ce_mux_ab_1, and set properties
  set data_ce_mux_ab_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 data_ce_mux_ab_1 ]
  set_property -dict [ list \
CONFIG.C_SIZE {1} \
 ] $data_ce_mux_ab_1

  # Create instance: data_ce_mux_ab_2, and set properties
  set data_ce_mux_ab_2 [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 data_ce_mux_ab_2 ]
  set_property -dict [ list \
CONFIG.C_SIZE {1} \
 ] $data_ce_mux_ab_2

  # Create instance: data_ce_mux_ab_3, and set properties
  set data_ce_mux_ab_3 [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 data_ce_mux_ab_3 ]
  set_property -dict [ list \
CONFIG.C_SIZE {1} \
 ] $data_ce_mux_ab_3

  # Create instance: data_ce_mux_ab_4, and set properties
  set data_ce_mux_ab_4 [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 data_ce_mux_ab_4 ]
  set_property -dict [ list \
CONFIG.C_SIZE {1} \
 ] $data_ce_mux_ab_4

  # Create instance: data_ce_mux_ab_5, and set properties
  set data_ce_mux_ab_5 [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 data_ce_mux_ab_5 ]
  set_property -dict [ list \
CONFIG.C_SIZE {1} \
 ] $data_ce_mux_ab_5

  # Create instance: data_ce_mux_ab_6, and set properties
  set data_ce_mux_ab_6 [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 data_ce_mux_ab_6 ]
  set_property -dict [ list \
CONFIG.C_SIZE {1} \
 ] $data_ce_mux_ab_6

  # Create instance: data_ce_mux_ab_7, and set properties
  set data_ce_mux_ab_7 [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 data_ce_mux_ab_7 ]
  set_property -dict [ list \
CONFIG.C_SIZE {1} \
 ] $data_ce_mux_ab_7

  # Create instance: data_ce_mux_bb_1, and set properties
  set data_ce_mux_bb_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 data_ce_mux_bb_1 ]
  set_property -dict [ list \
CONFIG.C_SIZE {1} \
 ] $data_ce_mux_bb_1

  # Create instance: data_ce_mux_bb_2, and set properties
  set data_ce_mux_bb_2 [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 data_ce_mux_bb_2 ]
  set_property -dict [ list \
CONFIG.C_SIZE {1} \
 ] $data_ce_mux_bb_2

  # Create instance: data_ce_mux_bb_3, and set properties
  set data_ce_mux_bb_3 [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 data_ce_mux_bb_3 ]
  set_property -dict [ list \
CONFIG.C_SIZE {1} \
 ] $data_ce_mux_bb_3

  # Create instance: data_ce_mux_bb_4, and set properties
  set data_ce_mux_bb_4 [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 data_ce_mux_bb_4 ]
  set_property -dict [ list \
CONFIG.C_SIZE {1} \
 ] $data_ce_mux_bb_4

  # Create instance: data_ce_mux_bb_5, and set properties
  set data_ce_mux_bb_5 [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 data_ce_mux_bb_5 ]
  set_property -dict [ list \
CONFIG.C_SIZE {1} \
 ] $data_ce_mux_bb_5

  # Create instance: data_ce_mux_bb_6, and set properties
  set data_ce_mux_bb_6 [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 data_ce_mux_bb_6 ]
  set_property -dict [ list \
CONFIG.C_SIZE {1} \
 ] $data_ce_mux_bb_6

  # Create instance: data_ce_mux_bb_7, and set properties
  set data_ce_mux_bb_7 [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 data_ce_mux_bb_7 ]
  set_property -dict [ list \
CONFIG.C_SIZE {1} \
 ] $data_ce_mux_bb_7

  # Create instance: data_mux1, and set properties
  set data_mux1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:c_addsub:12.0 data_mux1 ]
  set_property -dict [ list \
CONFIG.A_Type {Unsigned} \
CONFIG.A_Width {1} \
CONFIG.B_Constant {true} \
CONFIG.B_Type {Unsigned} \
CONFIG.B_Value {0} \
CONFIG.B_Width {1} \
CONFIG.Bypass {true} \
CONFIG.CE {false} \
CONFIG.Latency {0} \
CONFIG.Out_Width {1} \
 ] $data_mux1

  # Create instance: data_mux11, and set properties
  set data_mux11 [ create_bd_cell -type ip -vlnv xilinx.com:ip:c_addsub:12.0 data_mux11 ]
  set_property -dict [ list \
CONFIG.A_Type {Unsigned} \
CONFIG.A_Width {1} \
CONFIG.B_Constant {true} \
CONFIG.B_Type {Unsigned} \
CONFIG.B_Value {0} \
CONFIG.B_Width {1} \
CONFIG.Bypass {true} \
CONFIG.CE {false} \
CONFIG.Latency {0} \
CONFIG.Out_Width {1} \
 ] $data_mux11

  # Create instance: data_mux12, and set properties
  set data_mux12 [ create_bd_cell -type ip -vlnv xilinx.com:ip:c_addsub:12.0 data_mux12 ]
  set_property -dict [ list \
CONFIG.A_Type {Unsigned} \
CONFIG.A_Width {1} \
CONFIG.B_Constant {true} \
CONFIG.B_Type {Unsigned} \
CONFIG.B_Value {0} \
CONFIG.B_Width {1} \
CONFIG.Bypass {true} \
CONFIG.CE {false} \
CONFIG.Latency {0} \
CONFIG.Out_Width {1} \
 ] $data_mux12

  # Create instance: data_mux13, and set properties
  set data_mux13 [ create_bd_cell -type ip -vlnv xilinx.com:ip:c_addsub:12.0 data_mux13 ]
  set_property -dict [ list \
CONFIG.A_Type {Unsigned} \
CONFIG.A_Width {1} \
CONFIG.B_Constant {true} \
CONFIG.B_Type {Unsigned} \
CONFIG.B_Value {0} \
CONFIG.B_Width {1} \
CONFIG.Bypass {true} \
CONFIG.CE {false} \
CONFIG.Latency {0} \
CONFIG.Out_Width {1} \
 ] $data_mux13

  # Create instance: data_mux14, and set properties
  set data_mux14 [ create_bd_cell -type ip -vlnv xilinx.com:ip:c_addsub:12.0 data_mux14 ]
  set_property -dict [ list \
CONFIG.A_Type {Unsigned} \
CONFIG.A_Width {1} \
CONFIG.B_Constant {true} \
CONFIG.B_Type {Unsigned} \
CONFIG.B_Value {0} \
CONFIG.B_Width {1} \
CONFIG.Bypass {true} \
CONFIG.CE {false} \
CONFIG.Latency {0} \
CONFIG.Out_Width {1} \
 ] $data_mux14

  # Create instance: data_mux15, and set properties
  set data_mux15 [ create_bd_cell -type ip -vlnv xilinx.com:ip:c_addsub:12.0 data_mux15 ]
  set_property -dict [ list \
CONFIG.A_Type {Unsigned} \
CONFIG.A_Width {1} \
CONFIG.B_Constant {true} \
CONFIG.B_Type {Unsigned} \
CONFIG.B_Value {0} \
CONFIG.B_Width {1} \
CONFIG.Bypass {true} \
CONFIG.CE {false} \
CONFIG.Latency {0} \
CONFIG.Out_Width {1} \
 ] $data_mux15

  # Create instance: data_mux16, and set properties
  set data_mux16 [ create_bd_cell -type ip -vlnv xilinx.com:ip:c_addsub:12.0 data_mux16 ]
  set_property -dict [ list \
CONFIG.A_Type {Unsigned} \
CONFIG.A_Width {1} \
CONFIG.B_Constant {true} \
CONFIG.B_Type {Unsigned} \
CONFIG.B_Value {0} \
CONFIG.B_Width {1} \
CONFIG.Bypass {true} \
CONFIG.CE {false} \
CONFIG.Latency {0} \
CONFIG.Out_Width {1} \
 ] $data_mux16

  # Create instance: data_mux17, and set properties
  set data_mux17 [ create_bd_cell -type ip -vlnv xilinx.com:ip:c_addsub:12.0 data_mux17 ]
  set_property -dict [ list \
CONFIG.A_Type {Unsigned} \
CONFIG.A_Width {1} \
CONFIG.B_Constant {true} \
CONFIG.B_Type {Unsigned} \
CONFIG.B_Value {0} \
CONFIG.B_Width {1} \
CONFIG.Bypass {true} \
CONFIG.CE {false} \
CONFIG.Latency {0} \
CONFIG.Out_Width {1} \
 ] $data_mux17

  # Create instance: decode_data_a_0, and set properties
  set decode_data_a_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:blk_mem_gen:8.3 decode_data_a_0 ]
  set_property -dict [ list \
CONFIG.Byte_Size {9} \
CONFIG.Enable_32bit_Address {false} \
CONFIG.Enable_B {Use_ENB_Pin} \
CONFIG.Memory_Type {True_Dual_Port_RAM} \
CONFIG.Port_B_Clock {100} \
CONFIG.Port_B_Enable_Rate {100} \
CONFIG.Port_B_Write_Rate {50} \
CONFIG.Read_Width_A {1} \
CONFIG.Read_Width_B {1} \
CONFIG.Register_PortA_Output_of_Memory_Primitives {false} \
CONFIG.Register_PortB_Output_of_Memory_Primitives {false} \
CONFIG.Use_Byte_Write_Enable {false} \
CONFIG.Use_RSTA_Pin {false} \
CONFIG.Write_Width_A {1} \
CONFIG.Write_Width_B {1} \
CONFIG.use_bram_block {Stand_Alone} \
 ] $decode_data_a_0

  # Create instance: decode_data_a_1, and set properties
  set decode_data_a_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:blk_mem_gen:8.3 decode_data_a_1 ]
  set_property -dict [ list \
CONFIG.Byte_Size {9} \
CONFIG.Enable_32bit_Address {false} \
CONFIG.Enable_B {Use_ENB_Pin} \
CONFIG.Memory_Type {True_Dual_Port_RAM} \
CONFIG.Port_B_Clock {100} \
CONFIG.Port_B_Enable_Rate {100} \
CONFIG.Port_B_Write_Rate {50} \
CONFIG.Read_Width_A {1} \
CONFIG.Read_Width_B {1} \
CONFIG.Register_PortA_Output_of_Memory_Primitives {false} \
CONFIG.Register_PortB_Output_of_Memory_Primitives {false} \
CONFIG.Use_Byte_Write_Enable {false} \
CONFIG.Use_RSTA_Pin {false} \
CONFIG.Write_Width_A {1} \
CONFIG.Write_Width_B {1} \
CONFIG.use_bram_block {Stand_Alone} \
 ] $decode_data_a_1

  # Create instance: decode_data_a_2, and set properties
  set decode_data_a_2 [ create_bd_cell -type ip -vlnv xilinx.com:ip:blk_mem_gen:8.3 decode_data_a_2 ]
  set_property -dict [ list \
CONFIG.Byte_Size {9} \
CONFIG.Enable_32bit_Address {false} \
CONFIG.Enable_B {Use_ENB_Pin} \
CONFIG.Memory_Type {True_Dual_Port_RAM} \
CONFIG.Port_B_Clock {100} \
CONFIG.Port_B_Enable_Rate {100} \
CONFIG.Port_B_Write_Rate {50} \
CONFIG.Read_Width_A {1} \
CONFIG.Read_Width_B {1} \
CONFIG.Register_PortA_Output_of_Memory_Primitives {false} \
CONFIG.Register_PortB_Output_of_Memory_Primitives {false} \
CONFIG.Use_Byte_Write_Enable {false} \
CONFIG.Use_RSTA_Pin {false} \
CONFIG.Write_Width_A {1} \
CONFIG.Write_Width_B {1} \
CONFIG.use_bram_block {Stand_Alone} \
 ] $decode_data_a_2

  # Create instance: decode_data_a_3, and set properties
  set decode_data_a_3 [ create_bd_cell -type ip -vlnv xilinx.com:ip:blk_mem_gen:8.3 decode_data_a_3 ]
  set_property -dict [ list \
CONFIG.Byte_Size {9} \
CONFIG.Enable_32bit_Address {false} \
CONFIG.Enable_B {Use_ENB_Pin} \
CONFIG.Memory_Type {True_Dual_Port_RAM} \
CONFIG.Port_B_Clock {100} \
CONFIG.Port_B_Enable_Rate {100} \
CONFIG.Port_B_Write_Rate {50} \
CONFIG.Read_Width_A {1} \
CONFIG.Read_Width_B {1} \
CONFIG.Register_PortA_Output_of_Memory_Primitives {false} \
CONFIG.Register_PortB_Output_of_Memory_Primitives {false} \
CONFIG.Use_Byte_Write_Enable {false} \
CONFIG.Use_RSTA_Pin {false} \
CONFIG.Write_Width_A {1} \
CONFIG.Write_Width_B {1} \
CONFIG.use_bram_block {Stand_Alone} \
 ] $decode_data_a_3

  # Create instance: decode_data_a_4, and set properties
  set decode_data_a_4 [ create_bd_cell -type ip -vlnv xilinx.com:ip:blk_mem_gen:8.3 decode_data_a_4 ]
  set_property -dict [ list \
CONFIG.Byte_Size {9} \
CONFIG.Enable_32bit_Address {false} \
CONFIG.Enable_B {Use_ENB_Pin} \
CONFIG.Memory_Type {True_Dual_Port_RAM} \
CONFIG.Port_B_Clock {100} \
CONFIG.Port_B_Enable_Rate {100} \
CONFIG.Port_B_Write_Rate {50} \
CONFIG.Read_Width_A {1} \
CONFIG.Read_Width_B {1} \
CONFIG.Register_PortA_Output_of_Memory_Primitives {false} \
CONFIG.Register_PortB_Output_of_Memory_Primitives {false} \
CONFIG.Use_Byte_Write_Enable {false} \
CONFIG.Use_RSTA_Pin {false} \
CONFIG.Write_Width_A {1} \
CONFIG.Write_Width_B {1} \
CONFIG.use_bram_block {Stand_Alone} \
 ] $decode_data_a_4

  # Create instance: decode_data_a_5, and set properties
  set decode_data_a_5 [ create_bd_cell -type ip -vlnv xilinx.com:ip:blk_mem_gen:8.3 decode_data_a_5 ]
  set_property -dict [ list \
CONFIG.Byte_Size {9} \
CONFIG.Enable_32bit_Address {false} \
CONFIG.Enable_B {Use_ENB_Pin} \
CONFIG.Memory_Type {True_Dual_Port_RAM} \
CONFIG.Port_B_Clock {100} \
CONFIG.Port_B_Enable_Rate {100} \
CONFIG.Port_B_Write_Rate {50} \
CONFIG.Read_Width_A {1} \
CONFIG.Read_Width_B {1} \
CONFIG.Register_PortA_Output_of_Memory_Primitives {false} \
CONFIG.Register_PortB_Output_of_Memory_Primitives {false} \
CONFIG.Use_Byte_Write_Enable {false} \
CONFIG.Use_RSTA_Pin {false} \
CONFIG.Write_Width_A {1} \
CONFIG.Write_Width_B {1} \
CONFIG.use_bram_block {Stand_Alone} \
 ] $decode_data_a_5

  # Create instance: decode_data_a_6, and set properties
  set decode_data_a_6 [ create_bd_cell -type ip -vlnv xilinx.com:ip:blk_mem_gen:8.3 decode_data_a_6 ]
  set_property -dict [ list \
CONFIG.Byte_Size {9} \
CONFIG.Enable_32bit_Address {false} \
CONFIG.Enable_B {Use_ENB_Pin} \
CONFIG.Memory_Type {True_Dual_Port_RAM} \
CONFIG.Port_B_Clock {100} \
CONFIG.Port_B_Enable_Rate {100} \
CONFIG.Port_B_Write_Rate {50} \
CONFIG.Read_Width_A {1} \
CONFIG.Read_Width_B {1} \
CONFIG.Register_PortA_Output_of_Memory_Primitives {false} \
CONFIG.Register_PortB_Output_of_Memory_Primitives {false} \
CONFIG.Use_Byte_Write_Enable {false} \
CONFIG.Use_RSTA_Pin {false} \
CONFIG.Write_Width_A {1} \
CONFIG.Write_Width_B {1} \
CONFIG.use_bram_block {Stand_Alone} \
 ] $decode_data_a_6

  # Create instance: decode_data_a_7, and set properties
  set decode_data_a_7 [ create_bd_cell -type ip -vlnv xilinx.com:ip:blk_mem_gen:8.3 decode_data_a_7 ]
  set_property -dict [ list \
CONFIG.Byte_Size {9} \
CONFIG.Enable_32bit_Address {false} \
CONFIG.Enable_B {Use_ENB_Pin} \
CONFIG.Memory_Type {True_Dual_Port_RAM} \
CONFIG.Port_B_Clock {100} \
CONFIG.Port_B_Enable_Rate {100} \
CONFIG.Port_B_Write_Rate {50} \
CONFIG.Read_Width_A {1} \
CONFIG.Read_Width_B {1} \
CONFIG.Register_PortA_Output_of_Memory_Primitives {false} \
CONFIG.Register_PortB_Output_of_Memory_Primitives {false} \
CONFIG.Use_Byte_Write_Enable {false} \
CONFIG.Use_RSTA_Pin {false} \
CONFIG.Write_Width_A {1} \
CONFIG.Write_Width_B {1} \
CONFIG.use_bram_block {Stand_Alone} \
 ] $decode_data_a_7

  # Create instance: decode_data_b_0, and set properties
  set decode_data_b_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:blk_mem_gen:8.3 decode_data_b_0 ]
  set_property -dict [ list \
CONFIG.Byte_Size {9} \
CONFIG.Enable_32bit_Address {false} \
CONFIG.Enable_B {Use_ENB_Pin} \
CONFIG.Memory_Type {True_Dual_Port_RAM} \
CONFIG.Port_B_Clock {100} \
CONFIG.Port_B_Enable_Rate {100} \
CONFIG.Port_B_Write_Rate {50} \
CONFIG.Read_Width_A {1} \
CONFIG.Read_Width_B {1} \
CONFIG.Register_PortA_Output_of_Memory_Primitives {false} \
CONFIG.Register_PortB_Output_of_Memory_Primitives {false} \
CONFIG.Use_Byte_Write_Enable {false} \
CONFIG.Use_RSTA_Pin {false} \
CONFIG.Write_Width_A {1} \
CONFIG.Write_Width_B {1} \
CONFIG.use_bram_block {Stand_Alone} \
 ] $decode_data_b_0

  # Create instance: decode_data_b_1, and set properties
  set decode_data_b_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:blk_mem_gen:8.3 decode_data_b_1 ]
  set_property -dict [ list \
CONFIG.Byte_Size {9} \
CONFIG.Enable_32bit_Address {false} \
CONFIG.Enable_B {Use_ENB_Pin} \
CONFIG.Memory_Type {True_Dual_Port_RAM} \
CONFIG.Port_B_Clock {100} \
CONFIG.Port_B_Enable_Rate {100} \
CONFIG.Port_B_Write_Rate {50} \
CONFIG.Read_Width_A {1} \
CONFIG.Read_Width_B {1} \
CONFIG.Register_PortA_Output_of_Memory_Primitives {false} \
CONFIG.Register_PortB_Output_of_Memory_Primitives {false} \
CONFIG.Use_Byte_Write_Enable {false} \
CONFIG.Use_RSTA_Pin {false} \
CONFIG.Write_Width_A {1} \
CONFIG.Write_Width_B {1} \
CONFIG.use_bram_block {Stand_Alone} \
 ] $decode_data_b_1

  # Create instance: decode_data_b_2, and set properties
  set decode_data_b_2 [ create_bd_cell -type ip -vlnv xilinx.com:ip:blk_mem_gen:8.3 decode_data_b_2 ]
  set_property -dict [ list \
CONFIG.Byte_Size {9} \
CONFIG.Enable_32bit_Address {false} \
CONFIG.Enable_B {Use_ENB_Pin} \
CONFIG.Memory_Type {True_Dual_Port_RAM} \
CONFIG.Port_B_Clock {100} \
CONFIG.Port_B_Enable_Rate {100} \
CONFIG.Port_B_Write_Rate {50} \
CONFIG.Read_Width_A {1} \
CONFIG.Read_Width_B {1} \
CONFIG.Register_PortA_Output_of_Memory_Primitives {false} \
CONFIG.Register_PortB_Output_of_Memory_Primitives {false} \
CONFIG.Use_Byte_Write_Enable {false} \
CONFIG.Use_RSTA_Pin {false} \
CONFIG.Write_Width_A {1} \
CONFIG.Write_Width_B {1} \
CONFIG.use_bram_block {Stand_Alone} \
 ] $decode_data_b_2

  # Create instance: decode_data_b_3, and set properties
  set decode_data_b_3 [ create_bd_cell -type ip -vlnv xilinx.com:ip:blk_mem_gen:8.3 decode_data_b_3 ]
  set_property -dict [ list \
CONFIG.Byte_Size {9} \
CONFIG.Enable_32bit_Address {false} \
CONFIG.Enable_B {Use_ENB_Pin} \
CONFIG.Memory_Type {True_Dual_Port_RAM} \
CONFIG.Port_B_Clock {100} \
CONFIG.Port_B_Enable_Rate {100} \
CONFIG.Port_B_Write_Rate {50} \
CONFIG.Read_Width_A {1} \
CONFIG.Read_Width_B {1} \
CONFIG.Register_PortA_Output_of_Memory_Primitives {false} \
CONFIG.Register_PortB_Output_of_Memory_Primitives {false} \
CONFIG.Use_Byte_Write_Enable {false} \
CONFIG.Use_RSTA_Pin {false} \
CONFIG.Write_Width_A {1} \
CONFIG.Write_Width_B {1} \
CONFIG.use_bram_block {Stand_Alone} \
 ] $decode_data_b_3

  # Create instance: decode_data_b_4, and set properties
  set decode_data_b_4 [ create_bd_cell -type ip -vlnv xilinx.com:ip:blk_mem_gen:8.3 decode_data_b_4 ]
  set_property -dict [ list \
CONFIG.Byte_Size {9} \
CONFIG.Enable_32bit_Address {false} \
CONFIG.Enable_B {Use_ENB_Pin} \
CONFIG.Memory_Type {True_Dual_Port_RAM} \
CONFIG.Port_B_Clock {100} \
CONFIG.Port_B_Enable_Rate {100} \
CONFIG.Port_B_Write_Rate {50} \
CONFIG.Read_Width_A {1} \
CONFIG.Read_Width_B {1} \
CONFIG.Register_PortA_Output_of_Memory_Primitives {false} \
CONFIG.Register_PortB_Output_of_Memory_Primitives {false} \
CONFIG.Use_Byte_Write_Enable {false} \
CONFIG.Use_RSTA_Pin {false} \
CONFIG.Write_Width_A {1} \
CONFIG.Write_Width_B {1} \
CONFIG.use_bram_block {Stand_Alone} \
 ] $decode_data_b_4

  # Create instance: decode_data_b_5, and set properties
  set decode_data_b_5 [ create_bd_cell -type ip -vlnv xilinx.com:ip:blk_mem_gen:8.3 decode_data_b_5 ]
  set_property -dict [ list \
CONFIG.Byte_Size {9} \
CONFIG.Enable_32bit_Address {false} \
CONFIG.Enable_B {Use_ENB_Pin} \
CONFIG.Memory_Type {True_Dual_Port_RAM} \
CONFIG.Port_B_Clock {100} \
CONFIG.Port_B_Enable_Rate {100} \
CONFIG.Port_B_Write_Rate {50} \
CONFIG.Read_Width_A {1} \
CONFIG.Read_Width_B {1} \
CONFIG.Register_PortA_Output_of_Memory_Primitives {false} \
CONFIG.Register_PortB_Output_of_Memory_Primitives {false} \
CONFIG.Use_Byte_Write_Enable {false} \
CONFIG.Use_RSTA_Pin {false} \
CONFIG.Write_Width_A {1} \
CONFIG.Write_Width_B {1} \
CONFIG.use_bram_block {Stand_Alone} \
 ] $decode_data_b_5

  # Create instance: decode_data_b_6, and set properties
  set decode_data_b_6 [ create_bd_cell -type ip -vlnv xilinx.com:ip:blk_mem_gen:8.3 decode_data_b_6 ]
  set_property -dict [ list \
CONFIG.Byte_Size {9} \
CONFIG.Enable_32bit_Address {false} \
CONFIG.Enable_B {Use_ENB_Pin} \
CONFIG.Memory_Type {True_Dual_Port_RAM} \
CONFIG.Port_B_Clock {100} \
CONFIG.Port_B_Enable_Rate {100} \
CONFIG.Port_B_Write_Rate {50} \
CONFIG.Read_Width_A {1} \
CONFIG.Read_Width_B {1} \
CONFIG.Register_PortA_Output_of_Memory_Primitives {false} \
CONFIG.Register_PortB_Output_of_Memory_Primitives {false} \
CONFIG.Use_Byte_Write_Enable {false} \
CONFIG.Use_RSTA_Pin {false} \
CONFIG.Write_Width_A {1} \
CONFIG.Write_Width_B {1} \
CONFIG.use_bram_block {Stand_Alone} \
 ] $decode_data_b_6

  # Create instance: decode_data_b_7, and set properties
  set decode_data_b_7 [ create_bd_cell -type ip -vlnv xilinx.com:ip:blk_mem_gen:8.3 decode_data_b_7 ]
  set_property -dict [ list \
CONFIG.Byte_Size {9} \
CONFIG.Enable_32bit_Address {false} \
CONFIG.Enable_B {Use_ENB_Pin} \
CONFIG.Memory_Type {True_Dual_Port_RAM} \
CONFIG.Port_B_Clock {100} \
CONFIG.Port_B_Enable_Rate {100} \
CONFIG.Port_B_Write_Rate {50} \
CONFIG.Read_Width_A {1} \
CONFIG.Read_Width_B {1} \
CONFIG.Register_PortA_Output_of_Memory_Primitives {false} \
CONFIG.Register_PortB_Output_of_Memory_Primitives {false} \
CONFIG.Use_Byte_Write_Enable {false} \
CONFIG.Use_RSTA_Pin {false} \
CONFIG.Write_Width_A {1} \
CONFIG.Write_Width_B {1} \
CONFIG.use_bram_block {Stand_Alone} \
 ] $decode_data_b_7

  # Create instance: decode_start_lat, and set properties
  set decode_start_lat [ create_bd_cell -type ip -vlnv xilinx.com:ip:c_addsub:12.0 decode_start_lat ]
  set_property -dict [ list \
CONFIG.A_Type {Unsigned} \
CONFIG.A_Width {1} \
CONFIG.B_Constant {true} \
CONFIG.B_Type {Unsigned} \
CONFIG.B_Value {0} \
CONFIG.B_Width {1} \
CONFIG.Latency {1} \
CONFIG.Out_Width {1} \
CONFIG.SCLR {true} \
 ] $decode_start_lat

  # Create instance: decode_start_lat1, and set properties
  set decode_start_lat1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:c_addsub:12.0 decode_start_lat1 ]
  set_property -dict [ list \
CONFIG.A_Type {Unsigned} \
CONFIG.A_Width {1} \
CONFIG.B_Constant {true} \
CONFIG.B_Type {Unsigned} \
CONFIG.B_Value {0} \
CONFIG.B_Width {1} \
CONFIG.Latency {1} \
CONFIG.Out_Width {1} \
CONFIG.SCLR {true} \
 ] $decode_start_lat1

  # Create instance: deran_lat, and set properties
  set deran_lat [ create_bd_cell -type ip -vlnv xilinx.com:ip:c_addsub:12.0 deran_lat ]
  set_property -dict [ list \
CONFIG.A_Type {Unsigned} \
CONFIG.A_Width {8} \
CONFIG.B_Constant {true} \
CONFIG.B_Type {Unsigned} \
CONFIG.B_Value {00000000} \
CONFIG.B_Width {8} \
CONFIG.Latency {1} \
CONFIG.Out_Width {8} \
 ] $deran_lat

  # Create instance: err_code_lat, and set properties
  set err_code_lat [ create_bd_cell -type ip -vlnv xilinx.com:ip:c_addsub:12.0 err_code_lat ]
  set_property -dict [ list \
CONFIG.A_Type {Unsigned} \
CONFIG.A_Width {16} \
CONFIG.B_Constant {true} \
CONFIG.B_Type {Unsigned} \
CONFIG.B_Value {0000000000000000} \
CONFIG.B_Width {16} \
CONFIG.Latency {1} \
CONFIG.Out_Width {16} \
 ] $err_code_lat

  # Create instance: etaIndexM_M_lat, and set properties
  set etaIndexM_M_lat [ create_bd_cell -type ip -vlnv xilinx.com:ip:c_addsub:12.0 etaIndexM_M_lat ]
  set_property -dict [ list \
CONFIG.A_Type {Unsigned} \
CONFIG.A_Width {16} \
CONFIG.B_Constant {true} \
CONFIG.B_Type {Unsigned} \
CONFIG.B_Value {0000000000000000} \
CONFIG.B_Width {16} \
CONFIG.Latency {1} \
CONFIG.Out_Width {16} \
 ] $etaIndexM_M_lat

  # Create instance: init_start_lat, and set properties
  set init_start_lat [ create_bd_cell -type ip -vlnv xilinx.com:ip:c_addsub:12.0 init_start_lat ]
  set_property -dict [ list \
CONFIG.A_Type {Unsigned} \
CONFIG.A_Width {1} \
CONFIG.B_Constant {true} \
CONFIG.B_Type {Unsigned} \
CONFIG.B_Value {0} \
CONFIG.B_Width {1} \
CONFIG.Latency {1} \
CONFIG.Out_Width {1} \
 ] $init_start_lat

  # Create instance: itt_num_lat, and set properties
  set itt_num_lat [ create_bd_cell -type ip -vlnv xilinx.com:ip:c_addsub:12.0 itt_num_lat ]
  set_property -dict [ list \
CONFIG.A_Type {Unsigned} \
CONFIG.A_Width {8} \
CONFIG.B_Constant {true} \
CONFIG.B_Type {Unsigned} \
CONFIG.B_Value {00000000} \
CONFIG.B_Width {8} \
CONFIG.Latency {1} \
CONFIG.Out_Width {8} \
 ] $itt_num_lat

  # Create instance: itt_num_lat1, and set properties
  set itt_num_lat1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:c_addsub:12.0 itt_num_lat1 ]
  set_property -dict [ list \
CONFIG.A_Type {Unsigned} \
CONFIG.A_Width {8} \
CONFIG.B_Constant {true} \
CONFIG.B_Type {Unsigned} \
CONFIG.B_Value {00000000} \
CONFIG.B_Width {8} \
CONFIG.Latency {1} \
CONFIG.Out_Width {8} \
 ] $itt_num_lat1

  # Create instance: nR_M_lat, and set properties
  set nR_M_lat [ create_bd_cell -type ip -vlnv xilinx.com:ip:c_addsub:12.0 nR_M_lat ]
  set_property -dict [ list \
CONFIG.A_Type {Unsigned} \
CONFIG.A_Width {16} \
CONFIG.B_Constant {true} \
CONFIG.B_Type {Unsigned} \
CONFIG.B_Value {0000000000000000} \
CONFIG.B_Width {16} \
CONFIG.Latency {1} \
CONFIG.Out_Width {16} \
 ] $nR_M_lat

  # Create instance: numbits_lat, and set properties
  set numbits_lat [ create_bd_cell -type ip -vlnv xilinx.com:ip:c_addsub:12.0 numbits_lat ]
  set_property -dict [ list \
CONFIG.A_Type {Unsigned} \
CONFIG.A_Width {16} \
CONFIG.B_Constant {true} \
CONFIG.B_Type {Unsigned} \
CONFIG.B_Value {0000000000000000} \
CONFIG.B_Width {16} \
CONFIG.Latency {1} \
CONFIG.Out_Width {16} \
 ] $numbits_lat

  # Create instance: out_mux_lat, and set properties
  set out_mux_lat [ create_bd_cell -type ip -vlnv xilinx.com:ip:c_addsub:12.0 out_mux_lat ]
  set_property -dict [ list \
CONFIG.A_Type {Unsigned} \
CONFIG.A_Width {1} \
CONFIG.B_Constant {true} \
CONFIG.B_Type {Unsigned} \
CONFIG.B_Value {0} \
CONFIG.B_Width {1} \
CONFIG.Latency {1} \
CONFIG.Out_Width {1} \
 ] $out_mux_lat

  # Create instance: pCodeM_lat, and set properties
  set pCodeM_lat [ create_bd_cell -type ip -vlnv xilinx.com:ip:c_addsub:12.0 pCodeM_lat ]
  set_property -dict [ list \
CONFIG.A_Type {Unsigned} \
CONFIG.A_Width {16} \
CONFIG.B_Constant {true} \
CONFIG.B_Type {Unsigned} \
CONFIG.B_Value {0000000000000000} \
CONFIG.B_Width {16} \
CONFIG.Latency {1} \
CONFIG.Out_Width {16} \
 ] $pCodeM_lat

  # Create instance: pMaxIterations_lat, and set properties
  set pMaxIterations_lat [ create_bd_cell -type ip -vlnv xilinx.com:ip:c_addsub:12.0 pMaxIterations_lat ]
  set_property -dict [ list \
CONFIG.A_Type {Unsigned} \
CONFIG.A_Width {16} \
CONFIG.B_Constant {true} \
CONFIG.B_Type {Unsigned} \
CONFIG.B_Value {0000000000000000} \
CONFIG.B_Width {16} \
CONFIG.Latency {1} \
CONFIG.Out_Width {16} \
 ] $pMaxIterations_lat

  # Create instance: rate_lat, and set properties
  set rate_lat [ create_bd_cell -type ip -vlnv xilinx.com:ip:c_addsub:12.0 rate_lat ]
  set_property -dict [ list \
CONFIG.A_Type {Unsigned} \
CONFIG.A_Width {2} \
CONFIG.B_Constant {true} \
CONFIG.B_Type {Unsigned} \
CONFIG.B_Value {00} \
CONFIG.B_Width {2} \
CONFIG.Latency {1} \
CONFIG.Out_Width {2} \
 ] $rate_lat

  # Create instance: raw_ce_mux_aa, and set properties
  set raw_ce_mux_aa [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 raw_ce_mux_aa ]
  set_property -dict [ list \
CONFIG.C_SIZE {1} \
 ] $raw_ce_mux_aa

  # Create instance: raw_ce_mux_aa1, and set properties
  set raw_ce_mux_aa1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 raw_ce_mux_aa1 ]
  set_property -dict [ list \
CONFIG.C_SIZE {1} \
 ] $raw_ce_mux_aa1

  # Create instance: raw_ce_mux_aa2, and set properties
  set raw_ce_mux_aa2 [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 raw_ce_mux_aa2 ]
  set_property -dict [ list \
CONFIG.C_SIZE {1} \
 ] $raw_ce_mux_aa2

  # Create instance: raw_ce_mux_aa3, and set properties
  set raw_ce_mux_aa3 [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 raw_ce_mux_aa3 ]
  set_property -dict [ list \
CONFIG.C_SIZE {1} \
 ] $raw_ce_mux_aa3

  # Create instance: raw_ce_mux_aa4, and set properties
  set raw_ce_mux_aa4 [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 raw_ce_mux_aa4 ]
  set_property -dict [ list \
CONFIG.C_SIZE {1} \
 ] $raw_ce_mux_aa4

  # Create instance: raw_ce_mux_aa5, and set properties
  set raw_ce_mux_aa5 [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 raw_ce_mux_aa5 ]
  set_property -dict [ list \
CONFIG.C_SIZE {1} \
 ] $raw_ce_mux_aa5

  # Create instance: raw_ce_mux_aa6, and set properties
  set raw_ce_mux_aa6 [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 raw_ce_mux_aa6 ]
  set_property -dict [ list \
CONFIG.C_SIZE {1} \
 ] $raw_ce_mux_aa6

  # Create instance: raw_ce_mux_aa7, and set properties
  set raw_ce_mux_aa7 [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 raw_ce_mux_aa7 ]
  set_property -dict [ list \
CONFIG.C_SIZE {1} \
 ] $raw_ce_mux_aa7

  # Create instance: raw_ce_mux_aa8, and set properties
  set raw_ce_mux_aa8 [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 raw_ce_mux_aa8 ]
  set_property -dict [ list \
CONFIG.C_SIZE {1} \
 ] $raw_ce_mux_aa8

  # Create instance: raw_ce_mux_aa9, and set properties
  set raw_ce_mux_aa9 [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 raw_ce_mux_aa9 ]
  set_property -dict [ list \
CONFIG.C_SIZE {1} \
 ] $raw_ce_mux_aa9

  # Create instance: raw_ce_mux_ba, and set properties
  set raw_ce_mux_ba [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 raw_ce_mux_ba ]
  set_property -dict [ list \
CONFIG.C_SIZE {1} \
 ] $raw_ce_mux_ba

  # Create instance: raw_ce_mux_ba1, and set properties
  set raw_ce_mux_ba1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 raw_ce_mux_ba1 ]
  set_property -dict [ list \
CONFIG.C_SIZE {1} \
 ] $raw_ce_mux_ba1

  # Create instance: raw_ce_mux_ba2, and set properties
  set raw_ce_mux_ba2 [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 raw_ce_mux_ba2 ]
  set_property -dict [ list \
CONFIG.C_SIZE {1} \
 ] $raw_ce_mux_ba2

  # Create instance: raw_ce_mux_ba3, and set properties
  set raw_ce_mux_ba3 [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 raw_ce_mux_ba3 ]
  set_property -dict [ list \
CONFIG.C_SIZE {1} \
 ] $raw_ce_mux_ba3

  # Create instance: raw_ce_mux_ba4, and set properties
  set raw_ce_mux_ba4 [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 raw_ce_mux_ba4 ]
  set_property -dict [ list \
CONFIG.C_SIZE {1} \
 ] $raw_ce_mux_ba4

  # Create instance: raw_ce_mux_ba5, and set properties
  set raw_ce_mux_ba5 [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 raw_ce_mux_ba5 ]
  set_property -dict [ list \
CONFIG.C_SIZE {1} \
 ] $raw_ce_mux_ba5

  # Create instance: raw_ce_mux_ba6, and set properties
  set raw_ce_mux_ba6 [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 raw_ce_mux_ba6 ]
  set_property -dict [ list \
CONFIG.C_SIZE {1} \
 ] $raw_ce_mux_ba6

  # Create instance: raw_ce_mux_ba7, and set properties
  set raw_ce_mux_ba7 [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 raw_ce_mux_ba7 ]
  set_property -dict [ list \
CONFIG.C_SIZE {1} \
 ] $raw_ce_mux_ba7

  # Create instance: raw_ce_mux_ba8, and set properties
  set raw_ce_mux_ba8 [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 raw_ce_mux_ba8 ]
  set_property -dict [ list \
CONFIG.C_SIZE {1} \
 ] $raw_ce_mux_ba8

  # Create instance: raw_ce_mux_ba9, and set properties
  set raw_ce_mux_ba9 [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 raw_ce_mux_ba9 ]
  set_property -dict [ list \
CONFIG.C_SIZE {1} \
 ] $raw_ce_mux_ba9

  # Create instance: raw_data_a, and set properties
  set raw_data_a [ create_bd_cell -type ip -vlnv xilinx.com:ip:blk_mem_gen:8.3 raw_data_a ]
  set_property -dict [ list \
CONFIG.Byte_Size {9} \
CONFIG.Enable_32bit_Address {false} \
CONFIG.Enable_B {Use_ENB_Pin} \
CONFIG.Memory_Type {True_Dual_Port_RAM} \
CONFIG.Port_B_Clock {100} \
CONFIG.Port_B_Enable_Rate {100} \
CONFIG.Port_B_Write_Rate {50} \
CONFIG.Read_Width_A {8} \
CONFIG.Read_Width_B {8} \
CONFIG.Register_PortA_Output_of_Memory_Primitives {false} \
CONFIG.Register_PortB_Output_of_Memory_Primitives {false} \
CONFIG.Use_Byte_Write_Enable {false} \
CONFIG.Use_RSTA_Pin {true} \
CONFIG.Write_Width_A {8} \
CONFIG.Write_Width_B {8} \
CONFIG.use_bram_block {Stand_Alone} \
 ] $raw_data_a

  # Create instance: raw_data_a1, and set properties
  set raw_data_a1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:blk_mem_gen:8.3 raw_data_a1 ]
  set_property -dict [ list \
CONFIG.Byte_Size {9} \
CONFIG.Enable_32bit_Address {false} \
CONFIG.Enable_B {Use_ENB_Pin} \
CONFIG.Memory_Type {True_Dual_Port_RAM} \
CONFIG.Port_B_Clock {100} \
CONFIG.Port_B_Enable_Rate {100} \
CONFIG.Port_B_Write_Rate {50} \
CONFIG.Read_Width_A {8} \
CONFIG.Read_Width_B {8} \
CONFIG.Register_PortA_Output_of_Memory_Primitives {false} \
CONFIG.Register_PortB_Output_of_Memory_Primitives {false} \
CONFIG.Use_Byte_Write_Enable {false} \
CONFIG.Use_RSTA_Pin {false} \
CONFIG.Write_Width_A {8} \
CONFIG.Write_Width_B {8} \
CONFIG.use_bram_block {Stand_Alone} \
 ] $raw_data_a1

  # Create instance: raw_data_a2, and set properties
  set raw_data_a2 [ create_bd_cell -type ip -vlnv xilinx.com:ip:blk_mem_gen:8.3 raw_data_a2 ]
  set_property -dict [ list \
CONFIG.Byte_Size {9} \
CONFIG.Enable_32bit_Address {false} \
CONFIG.Enable_B {Use_ENB_Pin} \
CONFIG.Memory_Type {True_Dual_Port_RAM} \
CONFIG.Port_B_Clock {100} \
CONFIG.Port_B_Enable_Rate {100} \
CONFIG.Port_B_Write_Rate {50} \
CONFIG.Read_Width_A {8} \
CONFIG.Read_Width_B {8} \
CONFIG.Register_PortA_Output_of_Memory_Primitives {false} \
CONFIG.Register_PortB_Output_of_Memory_Primitives {false} \
CONFIG.Use_Byte_Write_Enable {false} \
CONFIG.Use_RSTA_Pin {false} \
CONFIG.Write_Width_A {8} \
CONFIG.Write_Width_B {8} \
CONFIG.use_bram_block {Stand_Alone} \
 ] $raw_data_a2

  # Create instance: raw_data_a3, and set properties
  set raw_data_a3 [ create_bd_cell -type ip -vlnv xilinx.com:ip:blk_mem_gen:8.3 raw_data_a3 ]
  set_property -dict [ list \
CONFIG.Byte_Size {9} \
CONFIG.Enable_32bit_Address {false} \
CONFIG.Enable_B {Use_ENB_Pin} \
CONFIG.Memory_Type {True_Dual_Port_RAM} \
CONFIG.Port_B_Clock {100} \
CONFIG.Port_B_Enable_Rate {100} \
CONFIG.Port_B_Write_Rate {50} \
CONFIG.Read_Width_A {8} \
CONFIG.Read_Width_B {8} \
CONFIG.Register_PortA_Output_of_Memory_Primitives {false} \
CONFIG.Register_PortB_Output_of_Memory_Primitives {false} \
CONFIG.Use_Byte_Write_Enable {false} \
CONFIG.Use_RSTA_Pin {false} \
CONFIG.Write_Width_A {8} \
CONFIG.Write_Width_B {8} \
CONFIG.use_bram_block {Stand_Alone} \
 ] $raw_data_a3

  # Create instance: raw_data_a4, and set properties
  set raw_data_a4 [ create_bd_cell -type ip -vlnv xilinx.com:ip:blk_mem_gen:8.3 raw_data_a4 ]
  set_property -dict [ list \
CONFIG.Byte_Size {9} \
CONFIG.Enable_32bit_Address {false} \
CONFIG.Enable_B {Use_ENB_Pin} \
CONFIG.Memory_Type {True_Dual_Port_RAM} \
CONFIG.Port_B_Clock {100} \
CONFIG.Port_B_Enable_Rate {100} \
CONFIG.Port_B_Write_Rate {50} \
CONFIG.Read_Width_A {8} \
CONFIG.Read_Width_B {8} \
CONFIG.Register_PortA_Output_of_Memory_Primitives {false} \
CONFIG.Register_PortB_Output_of_Memory_Primitives {false} \
CONFIG.Use_Byte_Write_Enable {false} \
CONFIG.Use_RSTA_Pin {false} \
CONFIG.Write_Width_A {8} \
CONFIG.Write_Width_B {8} \
CONFIG.use_bram_block {Stand_Alone} \
 ] $raw_data_a4

  # Create instance: raw_data_a5, and set properties
  set raw_data_a5 [ create_bd_cell -type ip -vlnv xilinx.com:ip:blk_mem_gen:8.3 raw_data_a5 ]
  set_property -dict [ list \
CONFIG.Byte_Size {9} \
CONFIG.Enable_32bit_Address {false} \
CONFIG.Enable_B {Use_ENB_Pin} \
CONFIG.Memory_Type {True_Dual_Port_RAM} \
CONFIG.Port_B_Clock {100} \
CONFIG.Port_B_Enable_Rate {100} \
CONFIG.Port_B_Write_Rate {50} \
CONFIG.Read_Width_A {8} \
CONFIG.Read_Width_B {8} \
CONFIG.Register_PortA_Output_of_Memory_Primitives {false} \
CONFIG.Register_PortB_Output_of_Memory_Primitives {false} \
CONFIG.Use_Byte_Write_Enable {false} \
CONFIG.Use_RSTA_Pin {false} \
CONFIG.Write_Width_A {8} \
CONFIG.Write_Width_B {8} \
CONFIG.use_bram_block {Stand_Alone} \
 ] $raw_data_a5

  # Create instance: raw_data_a6, and set properties
  set raw_data_a6 [ create_bd_cell -type ip -vlnv xilinx.com:ip:blk_mem_gen:8.3 raw_data_a6 ]
  set_property -dict [ list \
CONFIG.Byte_Size {9} \
CONFIG.Enable_32bit_Address {false} \
CONFIG.Enable_B {Use_ENB_Pin} \
CONFIG.Memory_Type {True_Dual_Port_RAM} \
CONFIG.Port_B_Clock {100} \
CONFIG.Port_B_Enable_Rate {100} \
CONFIG.Port_B_Write_Rate {50} \
CONFIG.Read_Width_A {8} \
CONFIG.Read_Width_B {8} \
CONFIG.Register_PortA_Output_of_Memory_Primitives {false} \
CONFIG.Register_PortB_Output_of_Memory_Primitives {false} \
CONFIG.Use_Byte_Write_Enable {false} \
CONFIG.Use_RSTA_Pin {false} \
CONFIG.Write_Width_A {8} \
CONFIG.Write_Width_B {8} \
CONFIG.use_bram_block {Stand_Alone} \
 ] $raw_data_a6

  # Create instance: raw_data_a7, and set properties
  set raw_data_a7 [ create_bd_cell -type ip -vlnv xilinx.com:ip:blk_mem_gen:8.3 raw_data_a7 ]
  set_property -dict [ list \
CONFIG.Byte_Size {9} \
CONFIG.Enable_32bit_Address {false} \
CONFIG.Enable_B {Use_ENB_Pin} \
CONFIG.Memory_Type {True_Dual_Port_RAM} \
CONFIG.Port_B_Clock {100} \
CONFIG.Port_B_Enable_Rate {100} \
CONFIG.Port_B_Write_Rate {50} \
CONFIG.Read_Width_A {8} \
CONFIG.Read_Width_B {8} \
CONFIG.Register_PortA_Output_of_Memory_Primitives {false} \
CONFIG.Register_PortB_Output_of_Memory_Primitives {false} \
CONFIG.Use_Byte_Write_Enable {false} \
CONFIG.Use_RSTA_Pin {false} \
CONFIG.Write_Width_A {8} \
CONFIG.Write_Width_B {8} \
CONFIG.use_bram_block {Stand_Alone} \
 ] $raw_data_a7

  # Create instance: raw_data_a8, and set properties
  set raw_data_a8 [ create_bd_cell -type ip -vlnv xilinx.com:ip:blk_mem_gen:8.3 raw_data_a8 ]
  set_property -dict [ list \
CONFIG.Byte_Size {9} \
CONFIG.Enable_32bit_Address {false} \
CONFIG.Enable_B {Use_ENB_Pin} \
CONFIG.Memory_Type {True_Dual_Port_RAM} \
CONFIG.Port_B_Clock {100} \
CONFIG.Port_B_Enable_Rate {100} \
CONFIG.Port_B_Write_Rate {50} \
CONFIG.Read_Width_A {8} \
CONFIG.Read_Width_B {8} \
CONFIG.Register_PortA_Output_of_Memory_Primitives {false} \
CONFIG.Register_PortB_Output_of_Memory_Primitives {false} \
CONFIG.Use_Byte_Write_Enable {false} \
CONFIG.Use_RSTA_Pin {false} \
CONFIG.Write_Width_A {8} \
CONFIG.Write_Width_B {8} \
CONFIG.use_bram_block {Stand_Alone} \
 ] $raw_data_a8

  # Create instance: raw_data_a9, and set properties
  set raw_data_a9 [ create_bd_cell -type ip -vlnv xilinx.com:ip:blk_mem_gen:8.3 raw_data_a9 ]
  set_property -dict [ list \
CONFIG.Byte_Size {9} \
CONFIG.Enable_32bit_Address {false} \
CONFIG.Enable_B {Use_ENB_Pin} \
CONFIG.Memory_Type {True_Dual_Port_RAM} \
CONFIG.Port_B_Clock {100} \
CONFIG.Port_B_Enable_Rate {100} \
CONFIG.Port_B_Write_Rate {50} \
CONFIG.Read_Width_A {8} \
CONFIG.Read_Width_B {8} \
CONFIG.Register_PortA_Output_of_Memory_Primitives {false} \
CONFIG.Register_PortB_Output_of_Memory_Primitives {false} \
CONFIG.Use_Byte_Write_Enable {false} \
CONFIG.Use_RSTA_Pin {false} \
CONFIG.Write_Width_A {8} \
CONFIG.Write_Width_B {8} \
CONFIG.use_bram_block {Stand_Alone} \
 ] $raw_data_a9

  # Create instance: raw_data_b, and set properties
  set raw_data_b [ create_bd_cell -type ip -vlnv xilinx.com:ip:blk_mem_gen:8.3 raw_data_b ]
  set_property -dict [ list \
CONFIG.Byte_Size {9} \
CONFIG.Enable_32bit_Address {false} \
CONFIG.Enable_B {Use_ENB_Pin} \
CONFIG.Memory_Type {True_Dual_Port_RAM} \
CONFIG.Port_B_Clock {100} \
CONFIG.Port_B_Enable_Rate {100} \
CONFIG.Port_B_Write_Rate {50} \
CONFIG.Read_Width_A {8} \
CONFIG.Read_Width_B {8} \
CONFIG.Register_PortA_Output_of_Memory_Primitives {false} \
CONFIG.Register_PortB_Output_of_Memory_Primitives {false} \
CONFIG.Use_Byte_Write_Enable {false} \
CONFIG.Use_RSTA_Pin {true} \
CONFIG.Write_Width_A {8} \
CONFIG.Write_Width_B {8} \
CONFIG.use_bram_block {Stand_Alone} \
 ] $raw_data_b

  # Create instance: raw_data_b1, and set properties
  set raw_data_b1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:blk_mem_gen:8.3 raw_data_b1 ]
  set_property -dict [ list \
CONFIG.Byte_Size {9} \
CONFIG.Enable_32bit_Address {false} \
CONFIG.Enable_B {Use_ENB_Pin} \
CONFIG.Memory_Type {True_Dual_Port_RAM} \
CONFIG.Port_B_Clock {100} \
CONFIG.Port_B_Enable_Rate {100} \
CONFIG.Port_B_Write_Rate {50} \
CONFIG.Read_Width_A {8} \
CONFIG.Read_Width_B {8} \
CONFIG.Register_PortA_Output_of_Memory_Primitives {false} \
CONFIG.Register_PortB_Output_of_Memory_Primitives {false} \
CONFIG.Use_Byte_Write_Enable {false} \
CONFIG.Use_RSTA_Pin {false} \
CONFIG.Write_Width_A {8} \
CONFIG.Write_Width_B {8} \
CONFIG.use_bram_block {Stand_Alone} \
 ] $raw_data_b1

  # Create instance: raw_data_b2, and set properties
  set raw_data_b2 [ create_bd_cell -type ip -vlnv xilinx.com:ip:blk_mem_gen:8.3 raw_data_b2 ]
  set_property -dict [ list \
CONFIG.Byte_Size {9} \
CONFIG.Enable_32bit_Address {false} \
CONFIG.Enable_B {Use_ENB_Pin} \
CONFIG.Memory_Type {True_Dual_Port_RAM} \
CONFIG.Port_B_Clock {100} \
CONFIG.Port_B_Enable_Rate {100} \
CONFIG.Port_B_Write_Rate {50} \
CONFIG.Read_Width_A {8} \
CONFIG.Read_Width_B {8} \
CONFIG.Register_PortA_Output_of_Memory_Primitives {false} \
CONFIG.Register_PortB_Output_of_Memory_Primitives {false} \
CONFIG.Use_Byte_Write_Enable {false} \
CONFIG.Use_RSTA_Pin {false} \
CONFIG.Write_Width_A {8} \
CONFIG.Write_Width_B {8} \
CONFIG.use_bram_block {Stand_Alone} \
 ] $raw_data_b2

  # Create instance: raw_data_b3, and set properties
  set raw_data_b3 [ create_bd_cell -type ip -vlnv xilinx.com:ip:blk_mem_gen:8.3 raw_data_b3 ]
  set_property -dict [ list \
CONFIG.Byte_Size {9} \
CONFIG.Enable_32bit_Address {false} \
CONFIG.Enable_B {Use_ENB_Pin} \
CONFIG.Memory_Type {True_Dual_Port_RAM} \
CONFIG.Port_B_Clock {100} \
CONFIG.Port_B_Enable_Rate {100} \
CONFIG.Port_B_Write_Rate {50} \
CONFIG.Read_Width_A {8} \
CONFIG.Read_Width_B {8} \
CONFIG.Register_PortA_Output_of_Memory_Primitives {false} \
CONFIG.Register_PortB_Output_of_Memory_Primitives {false} \
CONFIG.Use_Byte_Write_Enable {false} \
CONFIG.Use_RSTA_Pin {false} \
CONFIG.Write_Width_A {8} \
CONFIG.Write_Width_B {8} \
CONFIG.use_bram_block {Stand_Alone} \
 ] $raw_data_b3

  # Create instance: raw_data_b4, and set properties
  set raw_data_b4 [ create_bd_cell -type ip -vlnv xilinx.com:ip:blk_mem_gen:8.3 raw_data_b4 ]
  set_property -dict [ list \
CONFIG.Byte_Size {9} \
CONFIG.Enable_32bit_Address {false} \
CONFIG.Enable_B {Use_ENB_Pin} \
CONFIG.Memory_Type {True_Dual_Port_RAM} \
CONFIG.Port_B_Clock {100} \
CONFIG.Port_B_Enable_Rate {100} \
CONFIG.Port_B_Write_Rate {50} \
CONFIG.Read_Width_A {8} \
CONFIG.Read_Width_B {8} \
CONFIG.Register_PortA_Output_of_Memory_Primitives {false} \
CONFIG.Register_PortB_Output_of_Memory_Primitives {false} \
CONFIG.Use_Byte_Write_Enable {false} \
CONFIG.Use_RSTA_Pin {false} \
CONFIG.Write_Width_A {8} \
CONFIG.Write_Width_B {8} \
CONFIG.use_bram_block {Stand_Alone} \
 ] $raw_data_b4

  # Create instance: raw_data_b5, and set properties
  set raw_data_b5 [ create_bd_cell -type ip -vlnv xilinx.com:ip:blk_mem_gen:8.3 raw_data_b5 ]
  set_property -dict [ list \
CONFIG.Byte_Size {9} \
CONFIG.Enable_32bit_Address {false} \
CONFIG.Enable_B {Use_ENB_Pin} \
CONFIG.Memory_Type {True_Dual_Port_RAM} \
CONFIG.Port_B_Clock {100} \
CONFIG.Port_B_Enable_Rate {100} \
CONFIG.Port_B_Write_Rate {50} \
CONFIG.Read_Width_A {8} \
CONFIG.Read_Width_B {8} \
CONFIG.Register_PortA_Output_of_Memory_Primitives {false} \
CONFIG.Register_PortB_Output_of_Memory_Primitives {false} \
CONFIG.Use_Byte_Write_Enable {false} \
CONFIG.Use_RSTA_Pin {false} \
CONFIG.Write_Width_A {8} \
CONFIG.Write_Width_B {8} \
CONFIG.use_bram_block {Stand_Alone} \
 ] $raw_data_b5

  # Create instance: raw_data_b6, and set properties
  set raw_data_b6 [ create_bd_cell -type ip -vlnv xilinx.com:ip:blk_mem_gen:8.3 raw_data_b6 ]
  set_property -dict [ list \
CONFIG.Byte_Size {9} \
CONFIG.Enable_32bit_Address {false} \
CONFIG.Enable_B {Use_ENB_Pin} \
CONFIG.Memory_Type {True_Dual_Port_RAM} \
CONFIG.Port_B_Clock {100} \
CONFIG.Port_B_Enable_Rate {100} \
CONFIG.Port_B_Write_Rate {50} \
CONFIG.Read_Width_A {8} \
CONFIG.Read_Width_B {8} \
CONFIG.Register_PortA_Output_of_Memory_Primitives {false} \
CONFIG.Register_PortB_Output_of_Memory_Primitives {false} \
CONFIG.Use_Byte_Write_Enable {false} \
CONFIG.Use_RSTA_Pin {false} \
CONFIG.Write_Width_A {8} \
CONFIG.Write_Width_B {8} \
CONFIG.use_bram_block {Stand_Alone} \
 ] $raw_data_b6

  # Create instance: raw_data_b7, and set properties
  set raw_data_b7 [ create_bd_cell -type ip -vlnv xilinx.com:ip:blk_mem_gen:8.3 raw_data_b7 ]
  set_property -dict [ list \
CONFIG.Byte_Size {9} \
CONFIG.Enable_32bit_Address {false} \
CONFIG.Enable_B {Use_ENB_Pin} \
CONFIG.Memory_Type {True_Dual_Port_RAM} \
CONFIG.Port_B_Clock {100} \
CONFIG.Port_B_Enable_Rate {100} \
CONFIG.Port_B_Write_Rate {50} \
CONFIG.Read_Width_A {8} \
CONFIG.Read_Width_B {8} \
CONFIG.Register_PortA_Output_of_Memory_Primitives {false} \
CONFIG.Register_PortB_Output_of_Memory_Primitives {false} \
CONFIG.Use_Byte_Write_Enable {false} \
CONFIG.Use_RSTA_Pin {false} \
CONFIG.Write_Width_A {8} \
CONFIG.Write_Width_B {8} \
CONFIG.use_bram_block {Stand_Alone} \
 ] $raw_data_b7

  # Create instance: raw_data_b8, and set properties
  set raw_data_b8 [ create_bd_cell -type ip -vlnv xilinx.com:ip:blk_mem_gen:8.3 raw_data_b8 ]
  set_property -dict [ list \
CONFIG.Byte_Size {9} \
CONFIG.Enable_32bit_Address {false} \
CONFIG.Enable_B {Use_ENB_Pin} \
CONFIG.Memory_Type {True_Dual_Port_RAM} \
CONFIG.Port_B_Clock {100} \
CONFIG.Port_B_Enable_Rate {100} \
CONFIG.Port_B_Write_Rate {50} \
CONFIG.Read_Width_A {8} \
CONFIG.Read_Width_B {8} \
CONFIG.Register_PortA_Output_of_Memory_Primitives {false} \
CONFIG.Register_PortB_Output_of_Memory_Primitives {false} \
CONFIG.Use_Byte_Write_Enable {false} \
CONFIG.Use_RSTA_Pin {false} \
CONFIG.Write_Width_A {8} \
CONFIG.Write_Width_B {8} \
CONFIG.use_bram_block {Stand_Alone} \
 ] $raw_data_b8

  # Create instance: raw_data_b9, and set properties
  set raw_data_b9 [ create_bd_cell -type ip -vlnv xilinx.com:ip:blk_mem_gen:8.3 raw_data_b9 ]
  set_property -dict [ list \
CONFIG.Byte_Size {9} \
CONFIG.Enable_32bit_Address {false} \
CONFIG.Enable_B {Use_ENB_Pin} \
CONFIG.Memory_Type {True_Dual_Port_RAM} \
CONFIG.Port_B_Clock {100} \
CONFIG.Port_B_Enable_Rate {100} \
CONFIG.Port_B_Write_Rate {50} \
CONFIG.Read_Width_A {8} \
CONFIG.Read_Width_B {8} \
CONFIG.Register_PortA_Output_of_Memory_Primitives {false} \
CONFIG.Register_PortB_Output_of_Memory_Primitives {false} \
CONFIG.Use_Byte_Write_Enable {false} \
CONFIG.Use_RSTA_Pin {false} \
CONFIG.Write_Width_A {8} \
CONFIG.Write_Width_B {8} \
CONFIG.use_bram_block {Stand_Alone} \
 ] $raw_data_b9

  # Create instance: setupLDPC_0, and set properties
  set setupLDPC_0 [ create_bd_cell -type ip -vlnv xilinx.com:hls:setupLDPC:1.0 setupLDPC_0 ]

  # Create instance: size_lat, and set properties
  set size_lat [ create_bd_cell -type ip -vlnv xilinx.com:ip:c_addsub:12.0 size_lat ]
  set_property -dict [ list \
CONFIG.A_Type {Unsigned} \
CONFIG.A_Width {2} \
CONFIG.B_Constant {true} \
CONFIG.B_Type {Unsigned} \
CONFIG.B_Value {00} \
CONFIG.B_Width {2} \
CONFIG.Latency {1} \
CONFIG.Out_Width {2} \
 ] $size_lat

  # Create instance: status_lat, and set properties
  set status_lat [ create_bd_cell -type ip -vlnv xilinx.com:ip:c_addsub:12.0 status_lat ]
  set_property -dict [ list \
CONFIG.A_Type {Unsigned} \
CONFIG.A_Width {2} \
CONFIG.B_Constant {true} \
CONFIG.B_Type {Unsigned} \
CONFIG.B_Value {00} \
CONFIG.B_Width {2} \
CONFIG.Latency {1} \
CONFIG.Out_Width {2} \
 ] $status_lat

  # Create instance: util_vector_logic_0, and set properties
  set util_vector_logic_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 util_vector_logic_0 ]
  set_property -dict [ list \
CONFIG.C_OPERATION {not} \
CONFIG.C_SIZE {1} \
 ] $util_vector_logic_0

  # Create instance: xlconstant_0, and set properties
  set xlconstant_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_0 ]
  set_property -dict [ list \
CONFIG.CONST_VAL {0} \
CONFIG.CONST_WIDTH {8} \
 ] $xlconstant_0

  # Create instance: xlconstant_1, and set properties
  set xlconstant_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_1 ]
  set_property -dict [ list \
CONFIG.CONST_VAL {0} \
 ] $xlconstant_1

  # Create instance: xlconstant_2, and set properties
  set xlconstant_2 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_2 ]
  set_property -dict [ list \
CONFIG.CONST_VAL {0} \
 ] $xlconstant_2

  # Create instance: xlconstant_3, and set properties
  set xlconstant_3 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_3 ]
  set_property -dict [ list \
CONFIG.CONST_VAL {0} \
CONFIG.CONST_WIDTH {8} \
 ] $xlconstant_3

  # Create port connections
  connect_bd_net -net BLOCK_RATE_1 [get_bd_ports BLOCK_RATE] [get_bd_pins LDPC_CTRL_0/code_V]
  connect_bd_net -net BLOCK_SIZE_1 [get_bd_ports BLOCK_SIZE] [get_bd_pins LDPC_CTRL_0/block_V]
  connect_bd_net -net Decoder_A_pbhat0_address0 [get_bd_pins Decoder_A/pbhat0_address0] [get_bd_pins decode_data_a_0/addrb]
  connect_bd_net -net Decoder_A_pbhat0_ce0 [get_bd_pins Decoder_A/pbhat0_ce0] [get_bd_pins decode_data_a_0/enb]
  connect_bd_net -net Decoder_A_pbhat0_d0 [get_bd_pins Decoder_A/pbhat0_d0] [get_bd_pins decode_data_a_0/dinb]
  connect_bd_net -net Decoder_A_pbhat0_we0 [get_bd_pins Decoder_A/pbhat0_we0] [get_bd_pins decode_data_a_0/web]
  connect_bd_net -net Decoder_A_pbhat1_address0 [get_bd_pins Decoder_A/pbhat1_address0] [get_bd_pins decode_data_a_1/addrb]
  connect_bd_net -net Decoder_A_pbhat1_ce0 [get_bd_pins Decoder_A/pbhat1_ce0] [get_bd_pins decode_data_a_1/enb]
  connect_bd_net -net Decoder_A_pbhat1_d0 [get_bd_pins Decoder_A/pbhat1_d0] [get_bd_pins decode_data_a_1/dinb]
  connect_bd_net -net Decoder_A_pbhat1_we0 [get_bd_pins Decoder_A/pbhat1_we0] [get_bd_pins decode_data_a_1/web]
  connect_bd_net -net Decoder_A_pbhat2_address0 [get_bd_pins Decoder_A/pbhat2_address0] [get_bd_pins decode_data_a_2/addrb]
  connect_bd_net -net Decoder_A_pbhat2_ce0 [get_bd_pins Decoder_A/pbhat2_ce0] [get_bd_pins decode_data_a_2/enb]
  connect_bd_net -net Decoder_A_pbhat2_d0 [get_bd_pins Decoder_A/pbhat2_d0] [get_bd_pins decode_data_a_2/dinb]
  connect_bd_net -net Decoder_A_pbhat2_we0 [get_bd_pins Decoder_A/pbhat2_we0] [get_bd_pins decode_data_a_2/web]
  connect_bd_net -net Decoder_A_pbhat3_address0 [get_bd_pins Decoder_A/pbhat3_address0] [get_bd_pins decode_data_a_3/addrb]
  connect_bd_net -net Decoder_A_pbhat3_ce0 [get_bd_pins Decoder_A/pbhat3_ce0] [get_bd_pins decode_data_a_3/enb]
  connect_bd_net -net Decoder_A_pbhat3_d0 [get_bd_pins Decoder_A/pbhat3_d0] [get_bd_pins decode_data_a_3/dinb]
  connect_bd_net -net Decoder_A_pbhat3_we0 [get_bd_pins Decoder_A/pbhat3_we0] [get_bd_pins decode_data_a_3/web]
  connect_bd_net -net Decoder_A_pbhat4_address0 [get_bd_pins Decoder_A/pbhat4_address0] [get_bd_pins decode_data_a_4/addrb]
  connect_bd_net -net Decoder_A_pbhat4_ce0 [get_bd_pins Decoder_A/pbhat4_ce0] [get_bd_pins decode_data_a_4/enb]
  connect_bd_net -net Decoder_A_pbhat4_d0 [get_bd_pins Decoder_A/pbhat4_d0] [get_bd_pins decode_data_a_4/dinb]
  connect_bd_net -net Decoder_A_pbhat4_we0 [get_bd_pins Decoder_A/pbhat4_we0] [get_bd_pins decode_data_a_4/web]
  connect_bd_net -net Decoder_A_pbhat5_address0 [get_bd_pins Decoder_A/pbhat5_address0] [get_bd_pins decode_data_a_5/addrb]
  connect_bd_net -net Decoder_A_pbhat5_ce0 [get_bd_pins Decoder_A/pbhat5_ce0] [get_bd_pins decode_data_a_5/enb]
  connect_bd_net -net Decoder_A_pbhat5_d0 [get_bd_pins Decoder_A/pbhat5_d0] [get_bd_pins decode_data_a_5/dinb]
  connect_bd_net -net Decoder_A_pbhat5_we0 [get_bd_pins Decoder_A/pbhat5_we0] [get_bd_pins decode_data_a_5/web]
  connect_bd_net -net Decoder_A_pbhat6_address0 [get_bd_pins Decoder_A/pbhat6_address0] [get_bd_pins decode_data_a_6/addrb]
  connect_bd_net -net Decoder_A_pbhat6_ce0 [get_bd_pins Decoder_A/pbhat6_ce0] [get_bd_pins decode_data_a_6/enb]
  connect_bd_net -net Decoder_A_pbhat6_d0 [get_bd_pins Decoder_A/pbhat6_d0] [get_bd_pins decode_data_a_6/dinb]
  connect_bd_net -net Decoder_A_pbhat6_we0 [get_bd_pins Decoder_A/pbhat6_we0] [get_bd_pins decode_data_a_6/web]
  connect_bd_net -net Decoder_A_pbhat7_address0 [get_bd_pins Decoder_A/pbhat7_address0] [get_bd_pins decode_data_a_7/addrb]
  connect_bd_net -net Decoder_A_pbhat7_ce0 [get_bd_pins Decoder_A/pbhat7_ce0] [get_bd_pins decode_data_a_7/enb]
  connect_bd_net -net Decoder_A_pbhat7_d0 [get_bd_pins Decoder_A/pbhat7_d0] [get_bd_pins decode_data_a_7/dinb]
  connect_bd_net -net Decoder_A_pbhat7_we0 [get_bd_pins Decoder_A/pbhat7_we0] [get_bd_pins decode_data_a_7/web]
  connect_bd_net -net Decoder_B_ap_done [get_bd_pins Decoder_B/ap_done] [get_bd_pins LDPC_buff_0/decode_done_b]
  connect_bd_net -net Decoder_B_cnt [get_bd_ports cnt_B] [get_bd_pins Decoder_B/cnt]
  connect_bd_net -net Decoder_B_itt_num [get_bd_pins Decoder_B/itt_num] [get_bd_pins itt_num_lat1/A]
  connect_bd_net -net Decoder_B_itt_num_ap_vld [get_bd_pins Decoder_B/itt_num_ap_vld] [get_bd_pins itt_num_lat1/CE]
  connect_bd_net -net Decoder_B_pR1_address0 [get_bd_pins Decoder_B/pR1_address0] [get_bd_pins raw_data_b1/addrb]
  connect_bd_net -net Decoder_B_pR1_ce0 [get_bd_pins Decoder_B/pR1_ce0] [get_bd_pins raw_data_b1/enb]
  connect_bd_net -net Decoder_B_pR2_address0 [get_bd_pins Decoder_B/pR2_address0] [get_bd_pins raw_data_b2/addrb]
  connect_bd_net -net Decoder_B_pR2_ce0 [get_bd_pins Decoder_B/pR2_ce0] [get_bd_pins raw_data_b2/enb]
  connect_bd_net -net Decoder_B_pR3_address0 [get_bd_pins Decoder_B/pR3_address0] [get_bd_pins raw_data_b3/addrb]
  connect_bd_net -net Decoder_B_pR3_ce0 [get_bd_pins Decoder_B/pR3_ce0] [get_bd_pins raw_data_b3/enb]
  connect_bd_net -net Decoder_B_pR4_address0 [get_bd_pins Decoder_B/pR4_address0] [get_bd_pins raw_data_b4/addrb]
  connect_bd_net -net Decoder_B_pR4_ce0 [get_bd_pins Decoder_B/pR4_ce0] [get_bd_pins raw_data_b4/enb]
  connect_bd_net -net Decoder_B_pR5_address0 [get_bd_pins Decoder_B/pR5_address0] [get_bd_pins raw_data_b5/addrb]
  connect_bd_net -net Decoder_B_pR5_ce0 [get_bd_pins Decoder_B/pR5_ce0] [get_bd_pins raw_data_b5/enb]
  connect_bd_net -net Decoder_B_pR6_address0 [get_bd_pins Decoder_B/pR6_address0] [get_bd_pins raw_data_b6/addrb]
  connect_bd_net -net Decoder_B_pR6_ce0 [get_bd_pins Decoder_B/pR6_ce0] [get_bd_pins raw_data_b6/enb]
  connect_bd_net -net Decoder_B_pR7_address0 [get_bd_pins Decoder_B/pR7_address0] [get_bd_pins raw_data_b7/addrb]
  connect_bd_net -net Decoder_B_pR7_ce0 [get_bd_pins Decoder_B/pR7_ce0] [get_bd_pins raw_data_b7/enb]
  connect_bd_net -net Decoder_B_pR8_address0 [get_bd_pins Decoder_B/pR8_address0] [get_bd_pins raw_data_b8/addrb]
  connect_bd_net -net Decoder_B_pR8_ce0 [get_bd_pins Decoder_B/pR8_ce0] [get_bd_pins raw_data_b8/enb]
  connect_bd_net -net Decoder_B_pR9_address0 [get_bd_pins Decoder_B/pR9_address0] [get_bd_pins raw_data_b9/addrb]
  connect_bd_net -net Decoder_B_pR9_ce0 [get_bd_pins Decoder_B/pR9_ce0] [get_bd_pins raw_data_b9/enb]
  connect_bd_net -net Decoder_B_pR_address0 [get_bd_pins Decoder_B/pR_address0] [get_bd_pins raw_data_b/addrb]
  connect_bd_net -net Decoder_B_pR_ce0 [get_bd_pins Decoder_B/pR_ce0] [get_bd_pins raw_data_b/enb]
  connect_bd_net -net Decoder_B_pbhat0_address0 [get_bd_pins Decoder_B/pbhat0_address0] [get_bd_pins decode_data_b_0/addrb]
  connect_bd_net -net Decoder_B_pbhat0_ce0 [get_bd_pins Decoder_B/pbhat0_ce0] [get_bd_pins decode_data_b_0/enb]
  connect_bd_net -net Decoder_B_pbhat0_d0 [get_bd_pins Decoder_B/pbhat0_d0] [get_bd_pins decode_data_b_0/dinb]
  connect_bd_net -net Decoder_B_pbhat0_we0 [get_bd_pins Decoder_B/pbhat0_we0] [get_bd_pins decode_data_b_0/web]
  connect_bd_net -net Decoder_B_pbhat1_address0 [get_bd_pins Decoder_B/pbhat1_address0] [get_bd_pins decode_data_b_1/addrb]
  connect_bd_net -net Decoder_B_pbhat1_ce0 [get_bd_pins Decoder_B/pbhat1_ce0] [get_bd_pins decode_data_b_1/enb]
  connect_bd_net -net Decoder_B_pbhat1_d0 [get_bd_pins Decoder_B/pbhat1_d0] [get_bd_pins decode_data_b_1/dinb]
  connect_bd_net -net Decoder_B_pbhat1_we0 [get_bd_pins Decoder_B/pbhat1_we0] [get_bd_pins decode_data_b_1/web]
  connect_bd_net -net Decoder_B_pbhat2_address0 [get_bd_pins Decoder_B/pbhat2_address0] [get_bd_pins decode_data_b_2/addrb]
  connect_bd_net -net Decoder_B_pbhat2_ce0 [get_bd_pins Decoder_B/pbhat2_ce0] [get_bd_pins decode_data_b_2/enb]
  connect_bd_net -net Decoder_B_pbhat2_d0 [get_bd_pins Decoder_B/pbhat2_d0] [get_bd_pins decode_data_b_2/dinb]
  connect_bd_net -net Decoder_B_pbhat2_we0 [get_bd_pins Decoder_B/pbhat2_we0] [get_bd_pins decode_data_b_2/web]
  connect_bd_net -net Decoder_B_pbhat3_address0 [get_bd_pins Decoder_B/pbhat3_address0] [get_bd_pins decode_data_b_3/addrb]
  connect_bd_net -net Decoder_B_pbhat3_ce0 [get_bd_pins Decoder_B/pbhat3_ce0] [get_bd_pins decode_data_b_3/enb]
  connect_bd_net -net Decoder_B_pbhat3_d0 [get_bd_pins Decoder_B/pbhat3_d0] [get_bd_pins decode_data_b_3/dinb]
  connect_bd_net -net Decoder_B_pbhat3_we0 [get_bd_pins Decoder_B/pbhat3_we0] [get_bd_pins decode_data_b_3/web]
  connect_bd_net -net Decoder_B_pbhat4_address0 [get_bd_pins Decoder_B/pbhat4_address0] [get_bd_pins decode_data_b_4/addrb]
  connect_bd_net -net Decoder_B_pbhat4_ce0 [get_bd_pins Decoder_B/pbhat4_ce0] [get_bd_pins decode_data_b_4/enb]
  connect_bd_net -net Decoder_B_pbhat4_d0 [get_bd_pins Decoder_B/pbhat4_d0] [get_bd_pins decode_data_b_4/dinb]
  connect_bd_net -net Decoder_B_pbhat4_we0 [get_bd_pins Decoder_B/pbhat4_we0] [get_bd_pins decode_data_b_4/web]
  connect_bd_net -net Decoder_B_pbhat5_address0 [get_bd_pins Decoder_B/pbhat5_address0] [get_bd_pins decode_data_b_5/addrb]
  connect_bd_net -net Decoder_B_pbhat5_ce0 [get_bd_pins Decoder_B/pbhat5_ce0] [get_bd_pins decode_data_b_5/enb]
  connect_bd_net -net Decoder_B_pbhat5_d0 [get_bd_pins Decoder_B/pbhat5_d0] [get_bd_pins decode_data_b_5/dinb]
  connect_bd_net -net Decoder_B_pbhat5_we0 [get_bd_pins Decoder_B/pbhat5_we0] [get_bd_pins decode_data_b_5/web]
  connect_bd_net -net Decoder_B_pbhat6_address0 [get_bd_pins Decoder_B/pbhat6_address0] [get_bd_pins decode_data_b_6/addrb]
  connect_bd_net -net Decoder_B_pbhat6_ce0 [get_bd_pins Decoder_B/pbhat6_ce0] [get_bd_pins decode_data_b_6/enb]
  connect_bd_net -net Decoder_B_pbhat6_d0 [get_bd_pins Decoder_B/pbhat6_d0] [get_bd_pins decode_data_b_6/dinb]
  connect_bd_net -net Decoder_B_pbhat6_we0 [get_bd_pins Decoder_B/pbhat6_we0] [get_bd_pins decode_data_b_6/web]
  connect_bd_net -net Decoder_B_pbhat7_address0 [get_bd_pins Decoder_B/pbhat7_address0] [get_bd_pins decode_data_b_7/addrb]
  connect_bd_net -net Decoder_B_pbhat7_ce0 [get_bd_pins Decoder_B/pbhat7_ce0] [get_bd_pins decode_data_b_7/enb]
  connect_bd_net -net Decoder_B_pbhat7_d0 [get_bd_pins Decoder_B/pbhat7_d0] [get_bd_pins decode_data_b_7/dinb]
  connect_bd_net -net Decoder_B_pbhat7_we0 [get_bd_pins Decoder_B/pbhat7_we0] [get_bd_pins decode_data_b_7/web]
  connect_bd_net -net HLSLdpcLogDecScaledMin_0_ap_done [get_bd_pins Decoder_A/ap_done] [get_bd_pins LDPC_buff_0/decode_done]
  connect_bd_net -net HLSLdpcLogDecScaledMin_0_ap_ready [get_bd_pins Decoder_A/ap_ready] [get_bd_pins LDPC_buff_0/decode_ready] [get_bd_pins decode_start_lat/SCLR]
  connect_bd_net -net HLSLdpcLogDecScaledMin_0_cnt [get_bd_ports cnt] [get_bd_pins Decoder_A/cnt]
  connect_bd_net -net HLSLdpcLogDecScaledMin_0_itt_num [get_bd_pins Decoder_A/itt_num] [get_bd_pins itt_num_lat/A]
  connect_bd_net -net HLSLdpcLogDecScaledMin_0_itt_num_ap_vld [get_bd_pins Decoder_A/itt_num_ap_vld] [get_bd_pins itt_num_lat/CE]
  connect_bd_net -net HLSLdpcLogDecScaledMin_0_pR1_address0 [get_bd_pins Decoder_A/pR1_address0] [get_bd_pins raw_data_a1/addrb]
  connect_bd_net -net HLSLdpcLogDecScaledMin_0_pR1_ce0 [get_bd_pins Decoder_A/pR1_ce0] [get_bd_pins raw_data_a1/enb]
  connect_bd_net -net HLSLdpcLogDecScaledMin_0_pR2_address0 [get_bd_pins Decoder_A/pR2_address0] [get_bd_pins raw_data_a2/addrb]
  connect_bd_net -net HLSLdpcLogDecScaledMin_0_pR2_ce0 [get_bd_pins Decoder_A/pR2_ce0] [get_bd_pins raw_data_a2/enb]
  connect_bd_net -net HLSLdpcLogDecScaledMin_0_pR3_address0 [get_bd_pins Decoder_A/pR3_address0] [get_bd_pins raw_data_a3/addrb]
  connect_bd_net -net HLSLdpcLogDecScaledMin_0_pR3_ce0 [get_bd_pins Decoder_A/pR3_ce0] [get_bd_pins raw_data_a3/enb]
  connect_bd_net -net HLSLdpcLogDecScaledMin_0_pR4_address0 [get_bd_pins Decoder_A/pR4_address0] [get_bd_pins raw_data_a4/addrb]
  connect_bd_net -net HLSLdpcLogDecScaledMin_0_pR4_ce0 [get_bd_pins Decoder_A/pR4_ce0] [get_bd_pins raw_data_a4/enb]
  connect_bd_net -net HLSLdpcLogDecScaledMin_0_pR5_address0 [get_bd_pins Decoder_A/pR5_address0] [get_bd_pins raw_data_a5/addrb]
  connect_bd_net -net HLSLdpcLogDecScaledMin_0_pR5_ce0 [get_bd_pins Decoder_A/pR5_ce0] [get_bd_pins raw_data_a5/enb]
  connect_bd_net -net HLSLdpcLogDecScaledMin_0_pR6_address0 [get_bd_pins Decoder_A/pR6_address0] [get_bd_pins raw_data_a6/addrb]
  connect_bd_net -net HLSLdpcLogDecScaledMin_0_pR6_ce0 [get_bd_pins Decoder_A/pR6_ce0] [get_bd_pins raw_data_a6/enb]
  connect_bd_net -net HLSLdpcLogDecScaledMin_0_pR7_address0 [get_bd_pins Decoder_A/pR7_address0] [get_bd_pins raw_data_a7/addrb]
  connect_bd_net -net HLSLdpcLogDecScaledMin_0_pR7_ce0 [get_bd_pins Decoder_A/pR7_ce0] [get_bd_pins raw_data_a7/enb]
  connect_bd_net -net HLSLdpcLogDecScaledMin_0_pR8_address0 [get_bd_pins Decoder_A/pR8_address0] [get_bd_pins raw_data_a8/addrb]
  connect_bd_net -net HLSLdpcLogDecScaledMin_0_pR8_ce0 [get_bd_pins Decoder_A/pR8_ce0] [get_bd_pins raw_data_a8/enb]
  connect_bd_net -net HLSLdpcLogDecScaledMin_0_pR9_address0 [get_bd_pins Decoder_A/pR9_address0] [get_bd_pins raw_data_a9/addrb]
  connect_bd_net -net HLSLdpcLogDecScaledMin_0_pR9_ce0 [get_bd_pins Decoder_A/pR9_ce0] [get_bd_pins raw_data_a9/enb]
  connect_bd_net -net HLSLdpcLogDecScaledMin_0_pR_V_address0 [get_bd_pins Decoder_A/pR_address0] [get_bd_pins raw_data_a/addrb]
  connect_bd_net -net HLSLdpcLogDecScaledMin_0_pR_V_ce0 [get_bd_pins Decoder_A/pR_ce0] [get_bd_pins raw_data_a/enb]
  connect_bd_net -net LDPC_CTRL_0_buff_reset [get_bd_pins LDPC_CTRL_0/buff_reset] [get_bd_pins buff_rst_lat/A]
  connect_bd_net -net LDPC_CTRL_0_buff_reset_ap_vld [get_bd_pins LDPC_CTRL_0/buff_reset_ap_vld] [get_bd_pins buff_rst_lat/CE]
  connect_bd_net -net LDPC_CTRL_0_buff_start [get_bd_pins LDPC_CTRL_0/buff_start] [get_bd_pins buff_start_lat/A]
  connect_bd_net -net LDPC_CTRL_0_buff_start_ap_vld [get_bd_pins LDPC_CTRL_0/buff_start_ap_vld] [get_bd_pins buff_start_lat/CE]
  connect_bd_net -net LDPC_CTRL_0_err_code [get_bd_pins LDPC_CTRL_0/err_code] [get_bd_pins err_code_lat/A]
  connect_bd_net -net LDPC_CTRL_0_err_code_ap_vld [get_bd_pins LDPC_CTRL_0/err_code_ap_vld] [get_bd_pins err_code_lat/CE]
  connect_bd_net -net LDPC_CTRL_0_init_start [get_bd_pins LDPC_CTRL_0/init_start] [get_bd_pins init_start_lat/A]
  connect_bd_net -net LDPC_CTRL_0_init_start_ap_vld [get_bd_pins LDPC_CTRL_0/init_start_ap_vld] [get_bd_pins init_start_lat/CE]
  connect_bd_net -net LDPC_CTRL_0_mem_mux [get_bd_pins LDPC_buff_0/mux] [get_bd_pins raw_ce_mux_ba/Op2] [get_bd_pins raw_ce_mux_ba1/Op2] [get_bd_pins raw_ce_mux_ba2/Op2] [get_bd_pins raw_ce_mux_ba3/Op2] [get_bd_pins raw_ce_mux_ba4/Op2] [get_bd_pins raw_ce_mux_ba5/Op2] [get_bd_pins raw_ce_mux_ba6/Op2] [get_bd_pins raw_ce_mux_ba7/Op2] [get_bd_pins raw_ce_mux_ba8/Op2] [get_bd_pins raw_ce_mux_ba9/Op2] [get_bd_pins util_vector_logic_0/Op1]
  connect_bd_net -net LDPC_CTRL_0_rate_V [get_bd_pins LDPC_CTRL_0/rate_V] [get_bd_pins rate_lat/A]
  connect_bd_net -net LDPC_CTRL_0_rate_V_ap_vld [get_bd_pins LDPC_CTRL_0/rate_V_ap_vld] [get_bd_pins rate_lat/CE]
  connect_bd_net -net LDPC_CTRL_0_size_V [get_bd_pins LDPC_CTRL_0/size_V] [get_bd_pins size_lat/A]
  connect_bd_net -net LDPC_CTRL_0_size_V_ap_vld [get_bd_pins LDPC_CTRL_0/size_V_ap_vld] [get_bd_pins size_lat/CE]
  connect_bd_net -net LDPC_CTRL_0_status_V [get_bd_pins LDPC_CTRL_0/status_V] [get_bd_pins status_lat/A]
  connect_bd_net -net LDPC_CTRL_0_status_V_ap_vld [get_bd_pins LDPC_CTRL_0/status_V_ap_vld] [get_bd_pins status_lat/CE]
  connect_bd_net -net LDPC_Out_0_cur_read_pos_V [get_bd_ports cur_read_pos_V] [get_bd_pins LDPC_Out_0/cur_read_pos_V]
  connect_bd_net -net LDPC_Out_0_data_out [get_bd_ports DECODE_OUT] [get_bd_pins LDPC_Out_0/data_out]
  connect_bd_net -net LDPC_Out_0_data_out_ap_vld [get_bd_ports DECODE_OUT_VALID] [get_bd_pins LDPC_Out_0/data_out_ap_vld]
  connect_bd_net -net LDPC_Out_0_mem_out1_address0 [get_bd_pins LDPC_Out_0/mem_out1_address0] [get_bd_pins decode_data_a_1/addra] [get_bd_pins decode_data_b_1/addra]
  connect_bd_net -net LDPC_Out_0_mem_out1_ce0 [get_bd_pins LDPC_Out_0/mem_out1_ce0] [get_bd_pins data_ce_mux_ab_1/Op2] [get_bd_pins data_ce_mux_bb_1/Op2]
  connect_bd_net -net LDPC_Out_0_mem_out2_address0 [get_bd_pins LDPC_Out_0/mem_out2_address0] [get_bd_pins decode_data_a_2/addra] [get_bd_pins decode_data_b_2/addra]
  connect_bd_net -net LDPC_Out_0_mem_out2_ce0 [get_bd_pins LDPC_Out_0/mem_out2_ce0] [get_bd_pins data_ce_mux_ab_2/Op2] [get_bd_pins data_ce_mux_bb_2/Op2]
  connect_bd_net -net LDPC_Out_0_mem_out3_address0 [get_bd_pins LDPC_Out_0/mem_out3_address0] [get_bd_pins decode_data_a_3/addra] [get_bd_pins decode_data_b_3/addra]
  connect_bd_net -net LDPC_Out_0_mem_out3_ce0 [get_bd_pins LDPC_Out_0/mem_out3_ce0] [get_bd_pins data_ce_mux_ab_3/Op2] [get_bd_pins data_ce_mux_bb_3/Op2]
  connect_bd_net -net LDPC_Out_0_mem_out4_address0 [get_bd_pins LDPC_Out_0/mem_out4_address0] [get_bd_pins decode_data_a_4/addra] [get_bd_pins decode_data_b_4/addra]
  connect_bd_net -net LDPC_Out_0_mem_out4_ce0 [get_bd_pins LDPC_Out_0/mem_out4_ce0] [get_bd_pins data_ce_mux_ab_4/Op2] [get_bd_pins data_ce_mux_bb_4/Op2]
  connect_bd_net -net LDPC_Out_0_mem_out5_address0 [get_bd_pins LDPC_Out_0/mem_out5_address0] [get_bd_pins decode_data_a_5/addra] [get_bd_pins decode_data_b_5/addra]
  connect_bd_net -net LDPC_Out_0_mem_out5_ce0 [get_bd_pins LDPC_Out_0/mem_out5_ce0] [get_bd_pins data_ce_mux_ab_5/Op2] [get_bd_pins data_ce_mux_bb_5/Op2]
  connect_bd_net -net LDPC_Out_0_mem_out6_address0 [get_bd_pins LDPC_Out_0/mem_out6_address0] [get_bd_pins decode_data_a_6/addra] [get_bd_pins decode_data_b_6/addra]
  connect_bd_net -net LDPC_Out_0_mem_out6_ce0 [get_bd_pins LDPC_Out_0/mem_out6_ce0] [get_bd_pins data_ce_mux_ab_6/Op2] [get_bd_pins data_ce_mux_bb_6/Op2]
  connect_bd_net -net LDPC_Out_0_mem_out7_address0 [get_bd_pins LDPC_Out_0/mem_out7_address0] [get_bd_pins decode_data_a_7/addra] [get_bd_pins decode_data_b_7/addra]
  connect_bd_net -net LDPC_Out_0_mem_out7_ce0 [get_bd_pins LDPC_Out_0/mem_out7_ce0] [get_bd_pins data_ce_mux_ab_7/Op2] [get_bd_pins data_ce_mux_bb_7/Op2]
  connect_bd_net -net LDPC_Out_0_rd_clk_out [get_bd_ports rd_clk_out] [get_bd_pins LDPC_Div_0/rd_clk_out]
  connect_bd_net -net LDPC_Out_0_rd_mux [get_bd_pins LDPC_Out_0/rd_mux] [get_bd_pins out_mux_lat/A]
  connect_bd_net -net LDPC_Out_0_rd_mux_ap_vld [get_bd_pins LDPC_Out_0/rd_mux_ap_vld] [get_bd_pins out_mux_lat/CE]
  connect_bd_net -net LDPC_Out_0_read_r [get_bd_ports read_clk_en] [get_bd_pins LDPC_Div_0/rd_clk_out_ap_vld]
  connect_bd_net -net LDPC_RUN_1 [get_bd_ports LDPC_RUN] [get_bd_pins LDPC_CTRL_0/run]
  connect_bd_net -net LDPC_buff_0_cur_write_pos_V [get_bd_ports cur_write_pos_V] [get_bd_pins LDPC_buff_0/cur_write_pos_V]
  connect_bd_net -net LDPC_buff_0_dec_dat_address0 [get_bd_pins LDPC_Out_0/mem_out0_address0] [get_bd_pins decode_data_a_0/addra] [get_bd_pins decode_data_b_0/addra]
  connect_bd_net -net LDPC_buff_0_dec_dat_ce0 [get_bd_pins LDPC_Out_0/mem_out0_ce0] [get_bd_pins data_ce_mux/Op1] [get_bd_pins data_ce_mux1/Op1]
  connect_bd_net -net LDPC_buff_0_decode_start [get_bd_pins LDPC_buff_0/decode_start] [get_bd_pins decode_start_lat/A]
  connect_bd_net -net LDPC_buff_0_decode_start_ap_vld [get_bd_pins LDPC_buff_0/decode_start_ap_vld] [get_bd_pins decode_start_lat/CE]
  connect_bd_net -net LDPC_buff_0_decode_start_b [get_bd_pins LDPC_buff_0/decode_start_b] [get_bd_pins decode_start_lat1/A]
  connect_bd_net -net LDPC_buff_0_decode_start_b_ap_vld [get_bd_pins LDPC_buff_0/decode_start_b_ap_vld] [get_bd_pins decode_start_lat1/CE]
  connect_bd_net -net LDPC_buff_0_deran_data [get_bd_pins LDPC_buff_0/deran_data] [get_bd_pins deran_lat/A]
  connect_bd_net -net LDPC_buff_0_full [get_bd_ports full] [get_bd_pins LDPC_buff_0/full]
  connect_bd_net -net LDPC_buff_0_overrun [get_bd_ports overrun] [get_bd_pins LDPC_buff_0/overrun]
  connect_bd_net -net LDPC_buff_0_raw_dat1_address0 [get_bd_pins LDPC_buff_0/raw_dat1_address0] [get_bd_pins raw_data_a1/addra] [get_bd_pins raw_data_b1/addra]
  connect_bd_net -net LDPC_buff_0_raw_dat1_ce0 [get_bd_pins LDPC_buff_0/raw_dat1_ce0] [get_bd_pins raw_ce_mux_aa1/Op1] [get_bd_pins raw_ce_mux_ba1/Op1]
  connect_bd_net -net LDPC_buff_0_raw_dat1_d0 [get_bd_pins LDPC_buff_0/raw_dat1_d0] [get_bd_pins raw_data_a1/dina] [get_bd_pins raw_data_b1/dina]
  connect_bd_net -net LDPC_buff_0_raw_dat1_we0 [get_bd_pins LDPC_buff_0/raw_dat1_we0] [get_bd_pins raw_data_a1/wea] [get_bd_pins raw_data_b1/wea]
  connect_bd_net -net LDPC_buff_0_raw_dat2_address0 [get_bd_pins LDPC_buff_0/raw_dat2_address0] [get_bd_pins raw_data_a2/addra] [get_bd_pins raw_data_b2/addra]
  connect_bd_net -net LDPC_buff_0_raw_dat2_ce0 [get_bd_pins LDPC_buff_0/raw_dat2_ce0] [get_bd_pins raw_ce_mux_aa2/Op1] [get_bd_pins raw_ce_mux_ba2/Op1]
  connect_bd_net -net LDPC_buff_0_raw_dat2_d0 [get_bd_pins LDPC_buff_0/raw_dat2_d0] [get_bd_pins raw_data_a2/dina] [get_bd_pins raw_data_b2/dina]
  connect_bd_net -net LDPC_buff_0_raw_dat2_we0 [get_bd_pins LDPC_buff_0/raw_dat2_we0] [get_bd_pins raw_data_a2/wea] [get_bd_pins raw_data_b2/wea]
  connect_bd_net -net LDPC_buff_0_raw_dat3_address0 [get_bd_pins LDPC_buff_0/raw_dat3_address0] [get_bd_pins raw_data_a3/addra] [get_bd_pins raw_data_b3/addra]
  connect_bd_net -net LDPC_buff_0_raw_dat3_ce0 [get_bd_pins LDPC_buff_0/raw_dat3_ce0] [get_bd_pins raw_ce_mux_aa3/Op1] [get_bd_pins raw_ce_mux_ba3/Op1]
  connect_bd_net -net LDPC_buff_0_raw_dat3_d0 [get_bd_pins LDPC_buff_0/raw_dat3_d0] [get_bd_pins raw_data_a3/dina] [get_bd_pins raw_data_b3/dina]
  connect_bd_net -net LDPC_buff_0_raw_dat3_we0 [get_bd_pins LDPC_buff_0/raw_dat3_we0] [get_bd_pins raw_data_a3/wea] [get_bd_pins raw_data_b3/wea]
  connect_bd_net -net LDPC_buff_0_raw_dat4_address0 [get_bd_pins LDPC_buff_0/raw_dat4_address0] [get_bd_pins raw_data_a4/addra] [get_bd_pins raw_data_b4/addra]
  connect_bd_net -net LDPC_buff_0_raw_dat4_ce0 [get_bd_pins LDPC_buff_0/raw_dat4_we0] [get_bd_pins raw_data_a4/wea] [get_bd_pins raw_data_b4/wea]
  connect_bd_net -net LDPC_buff_0_raw_dat4_ce1 [get_bd_pins LDPC_buff_0/raw_dat4_ce0] [get_bd_pins raw_ce_mux_aa4/Op1] [get_bd_pins raw_ce_mux_ba4/Op1]
  connect_bd_net -net LDPC_buff_0_raw_dat4_d0 [get_bd_pins LDPC_buff_0/raw_dat4_d0] [get_bd_pins raw_data_a4/dina] [get_bd_pins raw_data_b4/dina]
  connect_bd_net -net LDPC_buff_0_raw_dat5_address0 [get_bd_pins LDPC_buff_0/raw_dat5_address0] [get_bd_pins raw_data_a5/addra] [get_bd_pins raw_data_b5/addra]
  connect_bd_net -net LDPC_buff_0_raw_dat5_ce0 [get_bd_pins LDPC_buff_0/raw_dat5_ce0] [get_bd_pins raw_ce_mux_aa5/Op1] [get_bd_pins raw_ce_mux_ba5/Op1]
  connect_bd_net -net LDPC_buff_0_raw_dat5_d0 [get_bd_pins LDPC_buff_0/raw_dat5_d0] [get_bd_pins raw_data_a5/dina] [get_bd_pins raw_data_b5/dina]
  connect_bd_net -net LDPC_buff_0_raw_dat5_we0 [get_bd_pins LDPC_buff_0/raw_dat5_we0] [get_bd_pins raw_data_a5/wea] [get_bd_pins raw_data_b5/wea]
  connect_bd_net -net LDPC_buff_0_raw_dat6_address0 [get_bd_pins LDPC_buff_0/raw_dat6_address0] [get_bd_pins raw_data_a6/addra] [get_bd_pins raw_data_b6/addra]
  connect_bd_net -net LDPC_buff_0_raw_dat6_ce0 [get_bd_pins LDPC_buff_0/raw_dat6_ce0] [get_bd_pins raw_ce_mux_aa6/Op1] [get_bd_pins raw_ce_mux_ba6/Op1]
  connect_bd_net -net LDPC_buff_0_raw_dat6_d0 [get_bd_pins LDPC_buff_0/raw_dat6_d0] [get_bd_pins raw_data_a6/dina] [get_bd_pins raw_data_b6/dina]
  connect_bd_net -net LDPC_buff_0_raw_dat6_we0 [get_bd_pins LDPC_buff_0/raw_dat6_we0] [get_bd_pins raw_data_a6/wea] [get_bd_pins raw_data_b6/wea]
  connect_bd_net -net LDPC_buff_0_raw_dat7_address0 [get_bd_pins LDPC_buff_0/raw_dat7_address0] [get_bd_pins raw_data_a7/addra] [get_bd_pins raw_data_b7/addra]
  connect_bd_net -net LDPC_buff_0_raw_dat7_ce0 [get_bd_pins LDPC_buff_0/raw_dat7_ce0] [get_bd_pins raw_ce_mux_aa7/Op1] [get_bd_pins raw_ce_mux_ba7/Op1]
  connect_bd_net -net LDPC_buff_0_raw_dat7_d0 [get_bd_pins LDPC_buff_0/raw_dat7_d0] [get_bd_pins raw_data_a7/dina] [get_bd_pins raw_data_b7/dina]
  connect_bd_net -net LDPC_buff_0_raw_dat7_we0 [get_bd_pins LDPC_buff_0/raw_dat7_we0] [get_bd_pins raw_data_a7/wea] [get_bd_pins raw_data_b7/wea]
  connect_bd_net -net LDPC_buff_0_raw_dat8_address0 [get_bd_pins LDPC_buff_0/raw_dat8_address0] [get_bd_pins raw_data_a8/addra] [get_bd_pins raw_data_b8/addra]
  connect_bd_net -net LDPC_buff_0_raw_dat8_ce0 [get_bd_pins LDPC_buff_0/raw_dat8_ce0] [get_bd_pins raw_ce_mux_aa8/Op1] [get_bd_pins raw_ce_mux_ba8/Op1]
  connect_bd_net -net LDPC_buff_0_raw_dat8_d0 [get_bd_pins LDPC_buff_0/raw_dat8_d0] [get_bd_pins raw_data_a8/dina] [get_bd_pins raw_data_b8/dina]
  connect_bd_net -net LDPC_buff_0_raw_dat8_we0 [get_bd_pins LDPC_buff_0/raw_dat8_we0] [get_bd_pins raw_data_a8/wea] [get_bd_pins raw_data_b8/wea]
  connect_bd_net -net LDPC_buff_0_raw_dat9_address0 [get_bd_pins LDPC_buff_0/raw_dat9_address0] [get_bd_pins raw_data_a9/addra] [get_bd_pins raw_data_b9/addra]
  connect_bd_net -net LDPC_buff_0_raw_dat9_ce0 [get_bd_pins LDPC_buff_0/raw_dat9_ce0] [get_bd_pins raw_ce_mux_aa9/Op1] [get_bd_pins raw_ce_mux_ba9/Op1]
  connect_bd_net -net LDPC_buff_0_raw_dat9_d0 [get_bd_pins LDPC_buff_0/raw_dat9_d0] [get_bd_pins raw_data_a9/dina] [get_bd_pins raw_data_b9/dina]
  connect_bd_net -net LDPC_buff_0_raw_dat9_we0 [get_bd_pins LDPC_buff_0/raw_dat9_we0] [get_bd_pins raw_data_a9/wea] [get_bd_pins raw_data_b9/wea]
  connect_bd_net -net LDPC_buff_0_raw_dat_V_address0 [get_bd_pins LDPC_buff_0/raw_dat0_address0] [get_bd_pins raw_data_a/addra] [get_bd_pins raw_data_b/addra]
  connect_bd_net -net LDPC_buff_0_raw_dat_V_ce0 [get_bd_pins LDPC_buff_0/raw_dat0_ce0] [get_bd_pins raw_ce_mux_aa/Op1] [get_bd_pins raw_ce_mux_ba/Op1]
  connect_bd_net -net LDPC_buff_0_raw_dat_V_d0 [get_bd_pins LDPC_buff_0/raw_dat0_d0] [get_bd_pins raw_data_a/dina] [get_bd_pins raw_data_b/dina]
  connect_bd_net -net LDPC_buff_0_upgraded_ipi_deran_data_ap_vld [get_bd_ports deran_data_ap_vld] [get_bd_pins LDPC_buff_0/deran_data_ap_vld] [get_bd_pins deran_lat/CE]
  connect_bd_net -net LDPC_buff_0_upgraded_ipi_raw_dat_we0 [get_bd_pins LDPC_buff_0/raw_dat0_we0] [get_bd_pins raw_data_a/wea] [get_bd_pins raw_data_b/wea]
  connect_bd_net -net Net [get_bd_pins CE_not/Op1] [get_bd_pins Decoder_A/mux] [get_bd_pins data_ce_mux/Op2] [get_bd_pins data_ce_mux_bb_1/Op1] [get_bd_pins data_ce_mux_bb_2/Op1] [get_bd_pins data_ce_mux_bb_3/Op1] [get_bd_pins data_ce_mux_bb_4/Op1] [get_bd_pins data_ce_mux_bb_5/Op1] [get_bd_pins data_ce_mux_bb_6/Op1] [get_bd_pins data_ce_mux_bb_7/Op1] [get_bd_pins data_mux1/BYPASS] [get_bd_pins data_mux11/BYPASS] [get_bd_pins data_mux12/BYPASS] [get_bd_pins data_mux13/BYPASS] [get_bd_pins data_mux14/BYPASS] [get_bd_pins data_mux15/BYPASS] [get_bd_pins data_mux16/BYPASS] [get_bd_pins data_mux17/BYPASS] [get_bd_pins out_mux_lat/S]
  connect_bd_net -net Net1 [get_bd_pins Decoder_B/ap_ready] [get_bd_pins LDPC_buff_0/decode_ready_b] [get_bd_pins decode_start_lat1/SCLR]
  connect_bd_net -net ap_rst_1 [get_bd_ports reset_rtl] [get_bd_pins LDPC_CTRL_0/ap_rst]
  connect_bd_net -net buff_rst_lat_S [get_bd_pins Decoder_A/ap_rst] [get_bd_pins Decoder_B/ap_rst] [get_bd_pins LDPC_Div_0/ap_rst] [get_bd_pins LDPC_Out_0/ap_rst] [get_bd_pins LDPC_buff_0/ap_rst] [get_bd_pins buff_rst_lat/S]
  connect_bd_net -net c_addsub_0_S [get_bd_ports buff_ready] [get_bd_pins LDPC_Div_0/ap_start] [get_bd_pins LDPC_Out_0/ap_start] [get_bd_pins LDPC_buff_0/ap_start] [get_bd_pins buff_start_lat/S]
  connect_bd_net -net c_addsub_10_S [get_bd_pins LDPC_Div_0/block_V] [get_bd_pins setupLDPC_0/size_V] [get_bd_pins size_lat/S]
  connect_bd_net -net c_addsub_11_S [get_bd_pins rate_lat/S] [get_bd_pins setupLDPC_0/rate_V]
  connect_bd_net -net c_addsub_1_S [get_bd_ports LDPC_MODE] [get_bd_pins status_lat/S]
  connect_bd_net -net c_addsub_2_S [get_bd_ports ERR_CODE] [get_bd_pins err_code_lat/S]
  connect_bd_net -net c_addsub_3_S [get_bd_pins Decoder_A/nR_M] [get_bd_pins Decoder_B/nR_M] [get_bd_pins nR_M_lat/S]
  connect_bd_net -net c_addsub_4_S [get_bd_pins Decoder_A/etaIndexM_M] [get_bd_pins Decoder_B/etaIndexM_M] [get_bd_pins etaIndexM_M_lat/S]
  connect_bd_net -net c_addsub_5_S [get_bd_pins Decoder_A/pCodeM] [get_bd_pins Decoder_B/pCodeM] [get_bd_pins pCodeM_lat/S]
  connect_bd_net -net c_addsub_7_S [get_bd_pins Decoder_A/numbits] [get_bd_pins Decoder_B/numbits] [get_bd_pins LDPC_Out_0/numbits_V] [get_bd_pins LDPC_buff_0/numbits_V] [get_bd_pins numbits_lat/S]
  connect_bd_net -net c_addsub_8_S [get_bd_pins init_start_lat/S] [get_bd_pins setupLDPC_0/ap_start]
  connect_bd_net -net clk_div_1 [get_bd_ports clk_div] [get_bd_pins LDPC_Div_0/clk_div]
  connect_bd_net -net clk_wiz_0_clk_out1 [get_bd_ports clock_rtl] [get_bd_pins Decoder_A/ap_clk] [get_bd_pins Decoder_B/ap_clk] [get_bd_pins LDPC_CTRL_0/ap_clk] [get_bd_pins LDPC_Div_0/ap_clk] [get_bd_pins LDPC_Out_0/ap_clk] [get_bd_pins LDPC_buff_0/ap_clk] [get_bd_pins buff_rst_lat/CLK] [get_bd_pins buff_start_lat/CLK] [get_bd_pins decode_data_a_0/clka] [get_bd_pins decode_data_a_0/clkb] [get_bd_pins decode_data_a_1/clka] [get_bd_pins decode_data_a_1/clkb] [get_bd_pins decode_data_a_2/clka] [get_bd_pins decode_data_a_2/clkb] [get_bd_pins decode_data_a_3/clka] [get_bd_pins decode_data_a_3/clkb] [get_bd_pins decode_data_a_4/clka] [get_bd_pins decode_data_a_4/clkb] [get_bd_pins decode_data_a_5/clka] [get_bd_pins decode_data_a_5/clkb] [get_bd_pins decode_data_a_6/clka] [get_bd_pins decode_data_a_6/clkb] [get_bd_pins decode_data_a_7/clka] [get_bd_pins decode_data_a_7/clkb] [get_bd_pins decode_data_b_0/clka] [get_bd_pins decode_data_b_0/clkb] [get_bd_pins decode_data_b_1/clka] [get_bd_pins decode_data_b_1/clkb] [get_bd_pins decode_data_b_2/clka] [get_bd_pins decode_data_b_2/clkb] [get_bd_pins decode_data_b_3/clka] [get_bd_pins decode_data_b_3/clkb] [get_bd_pins decode_data_b_4/clka] [get_bd_pins decode_data_b_4/clkb] [get_bd_pins decode_data_b_5/clka] [get_bd_pins decode_data_b_5/clkb] [get_bd_pins decode_data_b_6/clka] [get_bd_pins decode_data_b_6/clkb] [get_bd_pins decode_data_b_7/clka] [get_bd_pins decode_data_b_7/clkb] [get_bd_pins decode_start_lat/CLK] [get_bd_pins decode_start_lat1/CLK] [get_bd_pins deran_lat/CLK] [get_bd_pins err_code_lat/CLK] [get_bd_pins etaIndexM_M_lat/CLK] [get_bd_pins init_start_lat/CLK] [get_bd_pins itt_num_lat/CLK] [get_bd_pins itt_num_lat1/CLK] [get_bd_pins nR_M_lat/CLK] [get_bd_pins numbits_lat/CLK] [get_bd_pins out_mux_lat/CLK] [get_bd_pins pCodeM_lat/CLK] [get_bd_pins pMaxIterations_lat/CLK] [get_bd_pins rate_lat/CLK] [get_bd_pins raw_data_a/clka] [get_bd_pins raw_data_a/clkb] [get_bd_pins raw_data_a1/clka] [get_bd_pins raw_data_a1/clkb] [get_bd_pins raw_data_a2/clka] [get_bd_pins raw_data_a2/clkb] [get_bd_pins raw_data_a3/clka] [get_bd_pins raw_data_a3/clkb] [get_bd_pins raw_data_a4/clka] [get_bd_pins raw_data_a4/clkb] [get_bd_pins raw_data_a5/clka] [get_bd_pins raw_data_a5/clkb] [get_bd_pins raw_data_a6/clka] [get_bd_pins raw_data_a6/clkb] [get_bd_pins raw_data_a7/clka] [get_bd_pins raw_data_a7/clkb] [get_bd_pins raw_data_a8/clka] [get_bd_pins raw_data_a8/clkb] [get_bd_pins raw_data_a9/clka] [get_bd_pins raw_data_a9/clkb] [get_bd_pins raw_data_b/clka] [get_bd_pins raw_data_b/clkb] [get_bd_pins raw_data_b1/clka] [get_bd_pins raw_data_b1/clkb] [get_bd_pins raw_data_b2/clka] [get_bd_pins raw_data_b2/clkb] [get_bd_pins raw_data_b3/clka] [get_bd_pins raw_data_b3/clkb] [get_bd_pins raw_data_b4/clka] [get_bd_pins raw_data_b4/clkb] [get_bd_pins raw_data_b5/clka] [get_bd_pins raw_data_b5/clkb] [get_bd_pins raw_data_b6/clka] [get_bd_pins raw_data_b6/clkb] [get_bd_pins raw_data_b7/clka] [get_bd_pins raw_data_b7/clkb] [get_bd_pins raw_data_b8/clka] [get_bd_pins raw_data_b8/clkb] [get_bd_pins raw_data_b9/clka] [get_bd_pins raw_data_b9/clkb] [get_bd_pins size_lat/CLK] [get_bd_pins status_lat/CLK]
  connect_bd_net -net data_ce_mux1_Res [get_bd_pins data_ce_mux1/Res] [get_bd_pins decode_data_a_0/ena]
  connect_bd_net -net data_ce_mux2_Res [get_bd_pins CE_not/Res] [get_bd_pins Decoder_B/mux] [get_bd_pins LDPC_buff_0/out_mux] [get_bd_pins data_ce_mux1/Op2] [get_bd_pins data_ce_mux_ab_1/Op1] [get_bd_pins data_ce_mux_ab_2/Op1] [get_bd_pins data_ce_mux_ab_3/Op1] [get_bd_pins data_ce_mux_ab_4/Op1] [get_bd_pins data_ce_mux_ab_5/Op1] [get_bd_pins data_ce_mux_ab_6/Op1] [get_bd_pins data_ce_mux_ab_7/Op1]
  connect_bd_net -net data_ce_mux2_Res1 [get_bd_pins data_ce_mux_bb_1/Res] [get_bd_pins decode_data_b_1/ena]
  connect_bd_net -net data_ce_mux3_Res [get_bd_pins data_ce_mux_ab_1/Res] [get_bd_pins decode_data_a_1/ena]
  connect_bd_net -net data_ce_mux_Res [get_bd_pins data_ce_mux/Res] [get_bd_pins decode_data_b_0/ena]
  connect_bd_net -net data_ce_mux_ab_2_Res [get_bd_pins data_ce_mux_ab_2/Res] [get_bd_pins decode_data_a_2/ena]
  connect_bd_net -net data_ce_mux_ab_3_Res [get_bd_pins data_ce_mux_ab_3/Res] [get_bd_pins decode_data_a_3/ena]
  connect_bd_net -net data_ce_mux_ab_4_Res [get_bd_pins data_ce_mux_ab_4/Res] [get_bd_pins decode_data_a_4/ena]
  connect_bd_net -net data_ce_mux_ab_5_Res [get_bd_pins data_ce_mux_ab_5/Res] [get_bd_pins decode_data_a_5/ena]
  connect_bd_net -net data_ce_mux_ab_6_Res [get_bd_pins data_ce_mux_ab_6/Res] [get_bd_pins decode_data_a_6/ena]
  connect_bd_net -net data_ce_mux_ab_7_Res [get_bd_pins data_ce_mux_ab_7/Res] [get_bd_pins decode_data_a_7/ena]
  connect_bd_net -net data_ce_mux_bb_2_Res [get_bd_pins data_ce_mux_bb_2/Res] [get_bd_pins decode_data_b_2/ena]
  connect_bd_net -net data_ce_mux_bb_3_Res [get_bd_pins data_ce_mux_bb_3/Res] [get_bd_pins decode_data_b_3/ena]
  connect_bd_net -net data_ce_mux_bb_4_Res [get_bd_pins data_ce_mux_bb_4/Res] [get_bd_pins decode_data_b_4/ena]
  connect_bd_net -net data_ce_mux_bb_5_Res [get_bd_pins data_ce_mux_bb_5/Res] [get_bd_pins decode_data_b_5/ena]
  connect_bd_net -net data_ce_mux_bb_6_Res [get_bd_pins data_ce_mux_bb_6/Res] [get_bd_pins decode_data_b_6/ena]
  connect_bd_net -net data_ce_mux_bb_7_Res [get_bd_pins data_ce_mux_bb_7/Res] [get_bd_pins decode_data_b_7/ena]
  connect_bd_net -net data_in_1 [get_bd_ports data_in] [get_bd_pins LDPC_buff_0/data_in]
  connect_bd_net -net data_mux11_S [get_bd_pins LDPC_Out_0/mem_out1_q0] [get_bd_pins data_mux11/S]
  connect_bd_net -net data_mux12_S [get_bd_pins LDPC_Out_0/mem_out2_q0] [get_bd_pins data_mux12/S]
  connect_bd_net -net data_mux13_S [get_bd_pins LDPC_Out_0/mem_out3_q0] [get_bd_pins data_mux13/S]
  connect_bd_net -net data_mux14_S [get_bd_pins LDPC_Out_0/mem_out4_q0] [get_bd_pins data_mux14/S]
  connect_bd_net -net data_mux15_S [get_bd_pins LDPC_Out_0/mem_out5_q0] [get_bd_pins data_mux15/S]
  connect_bd_net -net data_mux16_S [get_bd_pins LDPC_Out_0/mem_out6_q0] [get_bd_pins data_mux16/S]
  connect_bd_net -net data_mux17_S [get_bd_pins LDPC_Out_0/mem_out7_q0] [get_bd_pins data_mux17/S]
  connect_bd_net -net data_mux1_S [get_bd_pins LDPC_Out_0/mem_out0_q0] [get_bd_pins data_mux1/S]
  connect_bd_net -net decode_data_0_douta [get_bd_pins data_mux1/A] [get_bd_pins decode_data_a_0/douta]
  connect_bd_net -net decode_data_1_douta [get_bd_pins data_mux1/B] [get_bd_pins decode_data_b_0/douta]
  connect_bd_net -net decode_data_a_1_douta [get_bd_pins data_mux11/A] [get_bd_pins decode_data_a_1/douta]
  connect_bd_net -net decode_data_a_2_douta [get_bd_pins data_mux12/A] [get_bd_pins decode_data_a_2/douta]
  connect_bd_net -net decode_data_a_3_douta [get_bd_pins data_mux13/A] [get_bd_pins decode_data_a_3/douta]
  connect_bd_net -net decode_data_a_4_douta [get_bd_pins data_mux14/A] [get_bd_pins decode_data_a_4/douta]
  connect_bd_net -net decode_data_a_5_douta [get_bd_pins data_mux15/A] [get_bd_pins decode_data_a_5/douta]
  connect_bd_net -net decode_data_a_6_douta [get_bd_pins data_mux16/A] [get_bd_pins decode_data_a_6/douta]
  connect_bd_net -net decode_data_a_7_douta [get_bd_pins data_mux17/A] [get_bd_pins decode_data_a_7/douta]
  connect_bd_net -net decode_data_b_1_douta [get_bd_pins data_mux11/B] [get_bd_pins decode_data_b_1/douta]
  connect_bd_net -net decode_data_b_2_douta [get_bd_pins data_mux12/B] [get_bd_pins decode_data_b_2/douta]
  connect_bd_net -net decode_data_b_3_douta [get_bd_pins data_mux13/B] [get_bd_pins decode_data_b_3/douta]
  connect_bd_net -net decode_data_b_4_douta [get_bd_pins data_mux14/B] [get_bd_pins decode_data_b_4/douta]
  connect_bd_net -net decode_data_b_5_douta [get_bd_pins data_mux15/B] [get_bd_pins decode_data_b_5/douta]
  connect_bd_net -net decode_data_b_6_douta [get_bd_pins data_mux16/B] [get_bd_pins decode_data_b_6/douta]
  connect_bd_net -net decode_data_b_7_douta [get_bd_pins data_mux17/B] [get_bd_pins decode_data_b_7/douta]
  connect_bd_net -net decode_start_lat1_S [get_bd_ports deran_data] [get_bd_pins deran_lat/S]
  connect_bd_net -net decode_start_lat1_S1 [get_bd_pins Decoder_B/ap_start] [get_bd_pins decode_start_lat1/S]
  connect_bd_net -net decode_start_lat_S [get_bd_pins Decoder_A/ap_start] [get_bd_pins decode_start_lat/S]
  connect_bd_net -net deran_sel_1 [get_bd_ports deran_sel] [get_bd_pins LDPC_buff_0/deran_V]
  connect_bd_net -net itt_num_lat1_S [get_bd_ports Decoder_B_Iterations] [get_bd_pins itt_num_lat1/S]
  connect_bd_net -net mux_lat1_S [get_bd_ports Iteration_Number] [get_bd_pins itt_num_lat/S]
  connect_bd_net -net pMaxIterations_1 [get_bd_ports pMaxIterations] [get_bd_pins Decoder_A/pMaxIterations] [get_bd_pins Decoder_B/pMaxIterations]
  connect_bd_net -net raw_ce_mux1_Res [get_bd_pins raw_ce_mux_aa/Res] [get_bd_pins raw_data_a/ena]
  connect_bd_net -net raw_ce_mux2_Res [get_bd_pins raw_ce_mux_ba/Res] [get_bd_pins raw_data_b/ena]
  connect_bd_net -net raw_ce_mux_aa1_Res [get_bd_pins raw_ce_mux_aa1/Res] [get_bd_pins raw_data_a1/ena]
  connect_bd_net -net raw_ce_mux_aa2_Res [get_bd_pins raw_ce_mux_aa2/Res] [get_bd_pins raw_data_a2/ena]
  connect_bd_net -net raw_ce_mux_aa3_Res [get_bd_pins raw_ce_mux_aa3/Res] [get_bd_pins raw_data_a3/ena]
  connect_bd_net -net raw_ce_mux_aa4_Res [get_bd_pins raw_ce_mux_aa4/Res] [get_bd_pins raw_data_a4/ena]
  connect_bd_net -net raw_ce_mux_aa5_Res [get_bd_pins raw_ce_mux_aa5/Res] [get_bd_pins raw_data_a5/ena]
  connect_bd_net -net raw_ce_mux_aa6_Res [get_bd_pins raw_ce_mux_aa6/Res] [get_bd_pins raw_data_a6/ena]
  connect_bd_net -net raw_ce_mux_aa7_Res [get_bd_pins raw_ce_mux_aa7/Res] [get_bd_pins raw_data_a7/ena]
  connect_bd_net -net raw_ce_mux_aa8_Res [get_bd_pins raw_ce_mux_aa8/Res] [get_bd_pins raw_data_a8/ena]
  connect_bd_net -net raw_ce_mux_aa9_Res [get_bd_pins raw_ce_mux_aa9/Res] [get_bd_pins raw_data_a9/ena]
  connect_bd_net -net raw_ce_mux_ba1_Res [get_bd_pins raw_ce_mux_ba1/Res] [get_bd_pins raw_data_b1/ena]
  connect_bd_net -net raw_ce_mux_ba2_Res [get_bd_pins raw_ce_mux_ba2/Res] [get_bd_pins raw_data_b2/ena]
  connect_bd_net -net raw_ce_mux_ba3_Res [get_bd_pins raw_ce_mux_ba3/Res] [get_bd_pins raw_data_b3/ena]
  connect_bd_net -net raw_ce_mux_ba4_Res [get_bd_pins raw_ce_mux_ba4/Res] [get_bd_pins raw_data_b4/ena]
  connect_bd_net -net raw_ce_mux_ba5_Res [get_bd_pins raw_ce_mux_ba5/Res] [get_bd_pins raw_data_b5/ena]
  connect_bd_net -net raw_ce_mux_ba6_Res [get_bd_pins raw_ce_mux_ba6/Res] [get_bd_pins raw_data_b6/ena]
  connect_bd_net -net raw_ce_mux_ba7_Res [get_bd_pins raw_ce_mux_ba7/Res] [get_bd_pins raw_data_b7/ena]
  connect_bd_net -net raw_ce_mux_ba8_Res [get_bd_pins raw_ce_mux_ba8/Res] [get_bd_pins raw_data_b8/ena]
  connect_bd_net -net raw_ce_mux_ba9_Res [get_bd_pins raw_ce_mux_ba9/Res] [get_bd_pins raw_data_b9/ena]
  connect_bd_net -net raw_data_0_doutb [get_bd_pins Decoder_A/pR_q0] [get_bd_pins raw_data_a/doutb]
  connect_bd_net -net raw_data_a1_doutb [get_bd_pins Decoder_A/pR1_q0] [get_bd_pins raw_data_a1/doutb]
  connect_bd_net -net raw_data_a2_doutb [get_bd_pins Decoder_A/pR2_q0] [get_bd_pins raw_data_a2/doutb]
  connect_bd_net -net raw_data_a3_doutb [get_bd_pins Decoder_A/pR3_q0] [get_bd_pins raw_data_a3/doutb]
  connect_bd_net -net raw_data_a4_doutb [get_bd_pins Decoder_A/pR4_q0] [get_bd_pins raw_data_a4/doutb]
  connect_bd_net -net raw_data_a5_doutb [get_bd_pins Decoder_A/pR5_q0] [get_bd_pins raw_data_a5/doutb]
  connect_bd_net -net raw_data_a6_doutb [get_bd_pins Decoder_A/pR6_q0] [get_bd_pins raw_data_a6/doutb]
  connect_bd_net -net raw_data_a7_doutb [get_bd_pins Decoder_A/pR7_q0] [get_bd_pins raw_data_a7/doutb]
  connect_bd_net -net raw_data_a8_doutb [get_bd_pins Decoder_A/pR8_q0] [get_bd_pins raw_data_a8/doutb]
  connect_bd_net -net raw_data_a9_doutb [get_bd_pins Decoder_A/pR9_q0] [get_bd_pins raw_data_a9/doutb]
  connect_bd_net -net raw_data_b1_doutb [get_bd_pins Decoder_B/pR1_q0] [get_bd_pins raw_data_b1/doutb]
  connect_bd_net -net raw_data_b2_doutb [get_bd_pins Decoder_B/pR2_q0] [get_bd_pins raw_data_b2/doutb]
  connect_bd_net -net raw_data_b3_doutb [get_bd_pins Decoder_B/pR3_q0] [get_bd_pins raw_data_b3/doutb]
  connect_bd_net -net raw_data_b4_doutb [get_bd_pins Decoder_B/pR4_q0] [get_bd_pins raw_data_b4/doutb]
  connect_bd_net -net raw_data_b5_doutb [get_bd_pins Decoder_B/pR5_q0] [get_bd_pins raw_data_b5/doutb]
  connect_bd_net -net raw_data_b6_doutb [get_bd_pins Decoder_B/pR6_q0] [get_bd_pins raw_data_b6/doutb]
  connect_bd_net -net raw_data_b7_doutb [get_bd_pins Decoder_B/pR7_q0] [get_bd_pins raw_data_b7/doutb]
  connect_bd_net -net raw_data_b8_doutb [get_bd_pins Decoder_B/pR8_q0] [get_bd_pins raw_data_b8/doutb]
  connect_bd_net -net raw_data_b9_doutb [get_bd_pins Decoder_B/pR9_q0] [get_bd_pins raw_data_b9/doutb]
  connect_bd_net -net raw_data_b_doutb [get_bd_pins Decoder_B/pR_q0] [get_bd_pins raw_data_b/doutb]
  connect_bd_net -net rd_clk_in_1 [get_bd_ports rd_clk_in] [get_bd_pins LDPC_Out_0/rd_clk_in]
  connect_bd_net -net reset_1 [get_bd_ports sync] [get_bd_pins LDPC_Div_0/reset] [get_bd_pins LDPC_Out_0/reset] [get_bd_pins LDPC_buff_0/reset]
  connect_bd_net -net setupLDPC_0_ap_done [get_bd_pins LDPC_CTRL_0/init_done] [get_bd_pins setupLDPC_0/ap_done]
  connect_bd_net -net setupLDPC_0_ap_ready [get_bd_pins LDPC_CTRL_0/init_ready] [get_bd_pins setupLDPC_0/ap_ready]
  connect_bd_net -net setupLDPC_0_etaIndexM_M_V [get_bd_pins etaIndexM_M_lat/A] [get_bd_pins setupLDPC_0/etaIndexM_M_V]
  connect_bd_net -net setupLDPC_0_etaIndexM_M_V_ap_vld [get_bd_pins etaIndexM_M_lat/CE] [get_bd_pins setupLDPC_0/etaIndexM_M_V_ap_vld]
  connect_bd_net -net setupLDPC_0_nR_M_V [get_bd_pins nR_M_lat/A] [get_bd_pins setupLDPC_0/nR_M_V]
  connect_bd_net -net setupLDPC_0_nR_M_V_ap_vld [get_bd_pins nR_M_lat/CE] [get_bd_pins setupLDPC_0/nR_M_V_ap_vld]
  connect_bd_net -net setupLDPC_0_numbits_V [get_bd_pins numbits_lat/A] [get_bd_pins setupLDPC_0/numbits_V]
  connect_bd_net -net setupLDPC_0_numbits_V_ap_vld [get_bd_pins numbits_lat/CE] [get_bd_pins setupLDPC_0/numbits_V_ap_vld]
  connect_bd_net -net setupLDPC_0_pCodeM_V [get_bd_pins pCodeM_lat/A] [get_bd_pins setupLDPC_0/pCodeM_V]
  connect_bd_net -net setupLDPC_0_pCodeM_V_ap_vld [get_bd_pins pCodeM_lat/CE] [get_bd_pins setupLDPC_0/pCodeM_V_ap_vld]
  connect_bd_net -net setupLDPC_0_pMaxIterations_V [get_bd_pins pMaxIterations_lat/A] [get_bd_pins setupLDPC_0/pMaxIterations_V]
  connect_bd_net -net setupLDPC_0_pMaxIterations_V_ap_vld [get_bd_pins pMaxIterations_lat/CE] [get_bd_pins setupLDPC_0/pMaxIterations_V_ap_vld]
  connect_bd_net -net util_vector_logic_0_Res [get_bd_pins raw_ce_mux_aa/Op2] [get_bd_pins raw_ce_mux_aa1/Op2] [get_bd_pins raw_ce_mux_aa2/Op2] [get_bd_pins raw_ce_mux_aa3/Op2] [get_bd_pins raw_ce_mux_aa4/Op2] [get_bd_pins raw_ce_mux_aa5/Op2] [get_bd_pins raw_ce_mux_aa6/Op2] [get_bd_pins raw_ce_mux_aa7/Op2] [get_bd_pins raw_ce_mux_aa8/Op2] [get_bd_pins raw_ce_mux_aa9/Op2] [get_bd_pins util_vector_logic_0/Res]
  connect_bd_net -net write_clk_en_1 [get_bd_ports write_clk_en] [get_bd_pins LDPC_buff_0/write_r]
  connect_bd_net -net xlconstant_0_dout [get_bd_pins LDPC_CTRL_0/ap_start] [get_bd_pins LDPC_CTRL_ap_start/dout]
  connect_bd_net -net xlconstant_0_dout1 [get_bd_pins Decoder_A/pR10_q0] [get_bd_pins Decoder_A/pR10_q1] [get_bd_pins xlconstant_0/dout]
  connect_bd_net -net xlconstant_1_dout [get_bd_pins raw_data_a/web] [get_bd_pins raw_data_a1/web] [get_bd_pins raw_data_a2/web] [get_bd_pins raw_data_a3/web] [get_bd_pins raw_data_a4/web] [get_bd_pins raw_data_a5/web] [get_bd_pins raw_data_a6/web] [get_bd_pins raw_data_a7/web] [get_bd_pins raw_data_a8/web] [get_bd_pins raw_data_a9/web] [get_bd_pins raw_data_b/web] [get_bd_pins raw_data_b1/web] [get_bd_pins raw_data_b2/web] [get_bd_pins raw_data_b3/web] [get_bd_pins raw_data_b4/web] [get_bd_pins raw_data_b5/web] [get_bd_pins raw_data_b6/web] [get_bd_pins raw_data_b7/web] [get_bd_pins raw_data_b8/web] [get_bd_pins raw_data_b9/web] [get_bd_pins xlconstant_1/dout]
  connect_bd_net -net xlconstant_2_dout [get_bd_pins decode_data_a_0/wea] [get_bd_pins decode_data_a_1/wea] [get_bd_pins decode_data_a_2/wea] [get_bd_pins decode_data_a_3/wea] [get_bd_pins decode_data_a_4/wea] [get_bd_pins decode_data_a_5/wea] [get_bd_pins decode_data_a_6/wea] [get_bd_pins decode_data_a_7/wea] [get_bd_pins decode_data_b_0/wea] [get_bd_pins decode_data_b_1/wea] [get_bd_pins decode_data_b_2/wea] [get_bd_pins decode_data_b_3/wea] [get_bd_pins decode_data_b_4/wea] [get_bd_pins decode_data_b_5/wea] [get_bd_pins decode_data_b_6/wea] [get_bd_pins decode_data_b_7/wea] [get_bd_pins xlconstant_2/dout]
  connect_bd_net -net xlconstant_3_dout [get_bd_pins Decoder_B/pR10_q0] [get_bd_pins Decoder_B/pR10_q1] [get_bd_pins xlconstant_3/dout]

  # Create address segments

  # Perform GUI Layout
  regenerate_bd_layout -layout_string {
   guistr: "# # String gsaved with Nlview 6.6.5b  2016-09-06 bk=1.3687 VDI=39 GEI=35 GUI=JA:1.6
#  -string -flagsOSRD
preplace port reset_rtl -pg 1 -y 6440 -defaultsOSRD
preplace port LDPC_RUN -pg 1 -y 6520 -defaultsOSRD
preplace port DECODE_OUT_VALID -pg 1 -y 6350 -defaultsOSRD
preplace port deran_data_ap_vld -pg 1 -y 6310 -defaultsOSRD
preplace port clock_rtl -pg 1 -y 4190 -defaultsOSRD
preplace portBus read_clk_en -pg 1 -y 6710 -defaultsOSRD
preplace portBus BLOCK_RATE -pg 1 -y 6500 -defaultsOSRD
preplace portBus BLOCK_SIZE -pg 1 -y 6480 -defaultsOSRD
preplace portBus Decoder_B_Iterations -pg 1 -y 600 -defaultsOSRD
preplace portBus full -pg 1 -y 3590 -defaultsOSRD
preplace portBus sync -pg 1 -y 2910 -defaultsOSRD
preplace portBus deran_sel -pg 1 -y 3570 -defaultsOSRD
preplace portBus overrun -pg 1 -y 4250 -defaultsOSRD
preplace portBus LDPC_MODE -pg 1 -y 6540 -defaultsOSRD
preplace portBus rd_clk_in -pg 1 -y 6460 -defaultsOSRD
preplace portBus rd_clk_out -pg 1 -y 6730 -defaultsOSRD
preplace portBus cnt -pg 1 -y 6330 -defaultsOSRD
preplace portBus cnt_B -pg 1 -y 580 -defaultsOSRD
preplace portBus data_in -pg 1 -y 3490 -defaultsOSRD
preplace portBus cur_write_pos_V -pg 1 -y 3630 -defaultsOSRD
preplace portBus Iteration_Number -pg 1 -y 5520 -defaultsOSRD
preplace portBus pMaxIterations -pg 1 -y 4510 -defaultsOSRD
preplace portBus DECODE_OUT -pg 1 -y 3610 -defaultsOSRD
preplace portBus buff_ready -pg 1 -y 6610 -defaultsOSRD
preplace portBus cur_read_pos_V -pg 1 -y 5590 -defaultsOSRD
preplace portBus clk_div -pg 1 -y 6760 -defaultsOSRD
preplace portBus deran_data -pg 1 -y 5660 -defaultsOSRD
preplace portBus ERR_CODE -pg 1 -y 6420 -defaultsOSRD
preplace portBus write_clk_en -pg 1 -y 3550 -defaultsOSRD
preplace inst data_ce_mux_bb_1 -pg 1 -lvl 11 -y 7500 -defaultsOSRD
preplace inst data_ce_mux_bb_2 -pg 1 -lvl 11 -y 8120 -defaultsOSRD
preplace inst data_ce_mux_bb_3 -pg 1 -lvl 11 -y 8730 -defaultsOSRD
preplace inst status_lat -pg 1 -lvl 12 -y 6850 -defaultsOSRD
preplace inst init_start_lat -pg 1 -lvl 3 -y 6330 -defaultsOSRD
preplace inst itt_num_lat1 -pg 1 -lvl 13 -y 600 -defaultsOSRD
preplace inst data_ce_mux_bb_4 -pg 1 -lvl 11 -y 9350 -defaultsOSRD
preplace inst data_ce_mux_bb_5 -pg 1 -lvl 11 -y 9910 -defaultsOSRD
preplace inst raw_data_a1 -pg 1 -lvl 12 -y 2650 -defaultsOSRD
preplace inst data_ce_mux1 -pg 1 -lvl 11 -y 7140 -defaultsOSRD
preplace inst data_ce_mux_bb_6 -pg 1 -lvl 11 -y 10460 -defaultsOSRD
preplace inst raw_data_a2 -pg 1 -lvl 12 -y 3290 -defaultsOSRD
preplace inst data_ce_mux_bb_7 -pg 1 -lvl 11 -y 11020 -defaultsOSRD
preplace inst raw_data_a3 -pg 1 -lvl 12 -y 40 -defaultsOSRD
preplace inst buff_rst_lat -pg 1 -lvl 5 -y 6450 -defaultsOSRD
preplace inst raw_data_a4 -pg 1 -lvl 12 -y 4290 -defaultsOSRD
preplace inst CE_not -pg 1 -lvl 9 -y 6960 -defaultsOSRD
preplace inst raw_data_a5 -pg 1 -lvl 12 -y 730 -defaultsOSRD
preplace inst decode_data_b_0 -pg 1 -lvl 12 -y 7280 -defaultsOSRD
preplace inst decode_data_b_1 -pg 1 -lvl 12 -y 7940 -defaultsOSRD
preplace inst raw_data_a6 -pg 1 -lvl 12 -y 1370 -defaultsOSRD
preplace inst raw_ce_mux_aa -pg 1 -lvl 11 -y 4620 -defaultsOSRD
preplace inst decode_data_b_2 -pg 1 -lvl 12 -y 8600 -defaultsOSRD
preplace inst data_ce_mux_ab_1 -pg 1 -lvl 11 -y 7760 -defaultsOSRD
preplace inst etaIndexM_M_lat -pg 1 -lvl 8 -y 5620 -defaultsOSRD
preplace inst numbits_lat -pg 1 -lvl 5 -y 5810 -defaultsOSRD
preplace inst raw_data_a7 -pg 1 -lvl 12 -y 2010 -defaultsOSRD
preplace inst decode_data_b_3 -pg 1 -lvl 12 -y 9260 -defaultsOSRD
preplace inst data_ce_mux_ab_2 -pg 1 -lvl 11 -y 8350 -defaultsOSRD
preplace inst LDPC_Div_0 -pg 1 -lvl 12 -y 7010 -defaultsOSRD
preplace inst decode_data_a_0 -pg 1 -lvl 12 -y 7610 -defaultsOSRD
preplace inst raw_data_a8 -pg 1 -lvl 12 -y 5610 -defaultsOSRD
preplace inst decode_start_lat1 -pg 1 -lvl 10 -y -660 -defaultsOSRD
preplace inst decode_data_b_4 -pg 1 -lvl 12 -y 9920 -defaultsOSRD
preplace inst data_ce_mux_ab_3 -pg 1 -lvl 11 -y 8930 -defaultsOSRD
preplace inst decode_data_a_1 -pg 1 -lvl 12 -y 8270 -defaultsOSRD
preplace inst pCodeM_lat -pg 1 -lvl 8 -y 6080 -defaultsOSRD
preplace inst raw_data_a9 -pg 1 -lvl 12 -y 6510 -defaultsOSRD
preplace inst decode_data_b_5 -pg 1 -lvl 12 -y 10580 -defaultsOSRD
preplace inst data_ce_mux_ab_4 -pg 1 -lvl 11 -y 9580 -defaultsOSRD
preplace inst decode_data_a_2 -pg 1 -lvl 12 -y 8930 -defaultsOSRD
preplace inst LDPC_buff_0 -pg 1 -lvl 6 -y 3510 -defaultsOSRD
preplace inst decode_data_b_6 -pg 1 -lvl 12 -y 11240 -defaultsOSRD
preplace inst data_ce_mux_ab_5 -pg 1 -lvl 11 -y 10110 -defaultsOSRD
preplace inst decode_data_a_3 -pg 1 -lvl 12 -y 9590 -defaultsOSRD
preplace inst decode_data_b_7 -pg 1 -lvl 12 -y 11900 -defaultsOSRD
preplace inst data_ce_mux_ab_6 -pg 1 -lvl 11 -y 10700 -defaultsOSRD
preplace inst decode_data_a_4 -pg 1 -lvl 12 -y 10250 -defaultsOSRD
preplace inst data_ce_mux_ab_7 -pg 1 -lvl 11 -y 11250 -defaultsOSRD
preplace inst decode_data_a_5 -pg 1 -lvl 12 -y 10910 -defaultsOSRD
preplace inst decode_data_a_6 -pg 1 -lvl 12 -y 11570 -defaultsOSRD
preplace inst LDPC_CTRL_ap_start -pg 1 -lvl 1 -y 6410 -defaultsOSRD
preplace inst LDPC_Out_0 -pg 1 -lvl 9 -y 6270 -defaultsOSRD
preplace inst decode_data_a_7 -pg 1 -lvl 12 -y 12230 -defaultsOSRD
preplace inst raw_data_a -pg 1 -lvl 12 -y 4650 -defaultsOSRD
preplace inst raw_data_b -pg 1 -lvl 12 -y 4970 -defaultsOSRD
preplace inst itt_num_lat -pg 1 -lvl 12 -y 5830 -defaultsOSRD
preplace inst nR_M_lat -pg 1 -lvl 8 -y 5760 -defaultsOSRD
preplace inst out_mux_lat -pg 1 -lvl 7 -y 6670 -defaultsOSRD
preplace inst size_lat -pg 1 -lvl 1 -y 6680 -defaultsOSRD -orient R180
preplace inst raw_ce_mux_aa1 -pg 1 -lvl 11 -y 2520 -defaultsOSRD
preplace inst util_vector_logic_0 -pg 1 -lvl 9 -y 3830 -defaultsOSRD
preplace inst raw_ce_mux_aa2 -pg 1 -lvl 11 -y 3240 -defaultsOSRD
preplace inst raw_data_b1 -pg 1 -lvl 12 -y 2970 -defaultsOSRD
preplace inst Decoder_A -pg 1 -lvl 9 -y 4300 -defaultsOSRD -resize 388 502
preplace inst raw_ce_mux_aa3 -pg 1 -lvl 11 -y 1380 -defaultsOSRD
preplace inst raw_data_b2 -pg 1 -lvl 12 -y 3610 -defaultsOSRD
preplace inst Decoder_B -pg 1 -lvl 11 -y -30 -defaultsOSRD
preplace inst raw_ce_mux_aa4 -pg 1 -lvl 11 -y 3970 -defaultsOSRD
preplace inst raw_data_b3 -pg 1 -lvl 12 -y 370 -defaultsOSRD
preplace inst raw_ce_mux_aa5 -pg 1 -lvl 11 -y 1260 -defaultsOSRD
preplace inst raw_data_b4 -pg 1 -lvl 12 -y 3970 -defaultsOSRD
preplace inst raw_ce_mux_aa6 -pg 1 -lvl 11 -y 1540 -defaultsOSRD
preplace inst raw_data_b5 -pg 1 -lvl 12 -y 1050 -defaultsOSRD
preplace inst LDPC_CTRL_0 -pg 1 -lvl 2 -y 6480 -defaultsOSRD
preplace inst rate_lat -pg 1 -lvl 1 -y 6310 -defaultsOSRD -orient R180
preplace inst raw_ce_mux_aa7 -pg 1 -lvl 11 -y 2030 -defaultsOSRD
preplace inst raw_data_b6 -pg 1 -lvl 12 -y 1690 -defaultsOSRD
preplace inst decode_start_lat -pg 1 -lvl 8 -y 4040 -defaultsOSRD -orient R90
preplace inst pMaxIterations_lat -pg 1 -lvl 6 -y 5870 -defaultsOSRD
preplace inst data_mux11 -pg 1 -lvl 8 -y 7050 -defaultsOSRD
preplace inst raw_ce_mux_aa8 -pg 1 -lvl 11 -y 5100 -defaultsOSRD
preplace inst raw_data_b7 -pg 1 -lvl 12 -y 2330 -defaultsOSRD
preplace inst data_mux12 -pg 1 -lvl 8 -y 7200 -defaultsOSRD
preplace inst raw_ce_mux_aa9 -pg 1 -lvl 11 -y 5470 -defaultsOSRD
preplace inst raw_data_b8 -pg 1 -lvl 12 -y 5290 -defaultsOSRD
preplace inst data_mux13 -pg 1 -lvl 8 -y 7370 -defaultsOSRD
preplace inst raw_data_b9 -pg 1 -lvl 12 -y 6190 -defaultsOSRD
preplace inst data_mux14 -pg 1 -lvl 8 -y 7570 -defaultsOSRD
preplace inst setupLDPC_0 -pg 1 -lvl 4 -y 5910 -defaultsOSRD -resize 383 726
preplace inst data_mux1 -pg 1 -lvl 8 -y 6830 -defaultsOSRD
preplace inst data_mux15 -pg 1 -lvl 8 -y 7770 -defaultsOSRD
preplace inst data_mux16 -pg 1 -lvl 8 -y 7940 -defaultsOSRD
preplace inst data_ce_mux -pg 1 -lvl 11 -y 6910 -defaultsOSRD
preplace inst data_mux17 -pg 1 -lvl 8 -y 8120 -defaultsOSRD
preplace inst raw_ce_mux_ba1 -pg 1 -lvl 9 -y 2780 -defaultsOSRD
preplace inst raw_ce_mux_ba2 -pg 1 -lvl 9 -y 3420 -defaultsOSRD
preplace inst xlconstant_0 -pg 1 -lvl 8 -y 4460 -defaultsOSRD
preplace inst raw_ce_mux_ba3 -pg 1 -lvl 9 -y 1410 -defaultsOSRD
preplace inst buff_start_lat -pg 1 -lvl 11 -y 6590 -defaultsOSRD
preplace inst err_code_lat -pg 1 -lvl 12 -y 6730 -defaultsOSRD
preplace inst raw_ce_mux_ba -pg 1 -lvl 9 -y 4650 -defaultsOSRD
preplace inst xlconstant_1 -pg 1 -lvl 11 -y 5910 -defaultsOSRD
preplace inst raw_ce_mux_ba4 -pg 1 -lvl 9 -y 3700 -defaultsOSRD
preplace inst xlconstant_2 -pg 1 -lvl 11 -y 7380 -defaultsOSRD
preplace inst raw_ce_mux_ba5 -pg 1 -lvl 9 -y 1660 -defaultsOSRD
preplace inst xlconstant_3 -pg 1 -lvl 10 -y -280 -defaultsOSRD
preplace inst raw_ce_mux_ba6 -pg 1 -lvl 9 -y 1530 -defaultsOSRD
preplace inst deran_lat -pg 1 -lvl 12 -y 5970 -defaultsOSRD
preplace inst raw_ce_mux_ba7 -pg 1 -lvl 9 -y 2220 -defaultsOSRD
preplace inst raw_ce_mux_ba8 -pg 1 -lvl 9 -y 4810 -defaultsOSRD
preplace inst raw_ce_mux_ba9 -pg 1 -lvl 9 -y 5400 -defaultsOSRD
preplace netloc setupLDPC_0_nR_M_V_ap_vld 1 4 4 N 5580 NJ 5580 NJ 5580 2410J
preplace netloc Decoder_B_pR2_address0 1 11 1 6040
preplace netloc decode_data_a_6_douta 1 7 5 2470 11520 NJ 11520 NJ 11520 NJ 11520 NJ
preplace netloc raw_data_0_doutb 1 8 4 2930J 4720 NJ 4720 NJ 4720 NJ
preplace netloc xlconstant_1_dout 1 11 1 6090
preplace netloc LDPC_buff_0_raw_dat8_d0 1 6 6 2030J 5240 NJ 5240 NJ 5240 NJ 5240 NJ 5240 6190
preplace netloc itt_num_lat1_S 1 13 1 N
preplace netloc Decoder_B_pbhat4_ce0 1 11 1 5670
preplace netloc Decoder_B_pR6_ce0 1 11 1 6170
preplace netloc c_addsub_0_S 1 5 9 1570 6000 NJ 6000 NJ 6000 2770 6000 NJ 6000 NJ 6000 5410 7120 6740J 6610 NJ
preplace netloc Decoder_A_pbhat0_we0 1 9 3 3610J 4150 NJ 4150 5540
preplace netloc LDPC_buff_0_raw_dat3_we0 1 6 6 NJ 3090 NJ 3090 NJ 3090 NJ 3090 NJ 3090 5470
preplace netloc Decoder_A_pbhat3_ce0 1 9 3 NJ 4209 NJ 4209 5230
preplace netloc Decoder_B_pR6_address0 1 11 1 6080
preplace netloc data_ce_mux_ab_5_Res 1 11 1 4890
preplace netloc LDPC_CTRL_0_rate_V_ap_vld 1 1 2 NJ 6290 630
preplace netloc data_ce_mux_Res 1 11 1 5240
preplace netloc data_mux16_S 1 8 1 2900
preplace netloc LDPC_buff_0_raw_dat8_ce0 1 6 5 NJ 3270 NJ 3270 2820 3270 NJ 3270 4110J
preplace netloc raw_data_a6_doutb 1 8 4 2900J 1470 NJ 1470 NJ 1470 5560J
preplace netloc Decoder_B_pR_ce0 1 11 1 6100
preplace netloc LDPC_buff_0_raw_dat9_ce0 1 6 5 NJ 3310 NJ 3310 2800 3310 NJ 3310 4090J
preplace netloc Decoder_B_pbhat4_d0 1 11 1 4890
preplace netloc LDPC_buff_0_raw_dat7_address0 1 6 6 2130J 1920 NJ 1920 NJ 1920 NJ 1920 NJ 1920 6200
preplace netloc data_ce_mux_bb_5_Res 1 11 1 4920
preplace netloc c_addsub_8_S 1 3 1 850
preplace netloc decode_data_b_4_douta 1 7 5 2510 9840 NJ 9840 NJ 9840 NJ 9840 4950J
preplace netloc LDPC_Out_0_mem_out6_ce0 1 9 2 NJ 6240 4000
preplace netloc raw_ce_mux_aa9_Res 1 11 1 5520
preplace netloc LDPC_buff_0_raw_dat_V_ce0 1 6 5 NJ 2950 NJ 2950 2840 2950 NJ 2950 4140J
preplace netloc data_mux13_S 1 8 1 2850
preplace netloc Decoder_A_pbhat4_d0 1 9 3 3500J 10320 NJ 10320 NJ
preplace netloc Decoder_B_pbhat6_d0 1 11 1 5250
preplace netloc Decoder_B_pbhat5_we0 1 11 1 5580
preplace netloc HLSLdpcLogDecScaledMin_0_pR8_address0 1 9 3 3650J 5640 NJ 5640 NJ
preplace netloc raw_ce_mux_ba8_Res 1 9 3 NJ 4810 NJ 4810 5650J
preplace netloc c_addsub_4_S 1 8 3 2860 5620 NJ 5620 4020J
preplace netloc data_mux15_S 1 8 1 2890
preplace netloc HLSLdpcLogDecScaledMin_0_pR3_ce0 1 9 3 3510 860 NJ 860 5440J
preplace netloc Decoder_B_cnt 1 11 3 5380J 530 NJ 530 6950J
preplace netloc LDPC_CTRL_0_buff_reset_ap_vld 1 2 3 NJ 6470 NJ 6470 NJ
preplace netloc Decoder_A_pbhat1_d0 1 9 3 3740J 4430 NJ 4430 5320
preplace netloc LDPC_buff_0_raw_dat5_address0 1 6 6 2040J 960 NJ 960 NJ 960 NJ 960 NJ 960 5690
preplace netloc data_ce_mux_bb_2_Res 1 11 1 5070
preplace netloc Decoder_B_pbhat5_address0 1 11 1 5390
preplace netloc clk_wiz_0_clk_out1 1 0 13 30J 4130 240 4130 680 4130 NJ 4130 1350 4130 1550 4130 2070 4130 2430 N 2740 -180 3580J -180 4170 700 5490 560 6740J
preplace netloc decode_data_a_5_douta 1 7 5 2460 10860 NJ 10860 NJ 10860 NJ 10860 NJ
preplace netloc data_mux14_S 1 8 1 2870
preplace netloc Decoder_A_pbhat7_we0 1 9 3 3510J 12340 NJ 12340 NJ
preplace netloc raw_ce_mux_aa7_Res 1 11 1 5630
preplace netloc LDPC_buff_0_decode_start_b_ap_vld 1 6 4 2020 -650 NJ -650 NJ -650 NJ
preplace netloc Decoder_B_pbhat7_d0 1 11 1 5180
preplace netloc Decoder_B_pbhat4_address0 1 11 1 5480
preplace netloc LDPC_buff_0_dec_dat_address0 1 9 3 NJ 6340 NJ 6340 5290
preplace netloc Decoder_A_pbhat6_we0 1 9 3 3540J 11680 NJ 11680 NJ
preplace netloc Decoder_A_pbhat0_d0 1 9 3 3600J 7680 NJ 7680 NJ
preplace netloc LDPC_buff_0_raw_dat1_we0 1 6 6 NJ 3010 NJ 3010 NJ 3010 NJ 3010 NJ 3010 5680
preplace netloc LDPC_Out_0_mem_out5_address0 1 9 3 NJ 6440 NJ 6440 4980
preplace netloc decode_start_lat_S 1 8 1 2810
preplace netloc LDPC_buff_0_raw_dat3_d0 1 6 6 2030J 680 NJ 680 NJ 680 NJ 680 NJ 680 5320
preplace netloc LDPC_Out_0_data_out_ap_vld 1 9 5 NJ 6060 NJ 6060 5870J 5900 NJ 5900 6930J
preplace netloc c_addsub_11_S 1 0 4 10 6180 NJ 6180 NJ 6180 NJ
preplace netloc Decoder_B_itt_num 1 11 2 5460 570 6730J
preplace netloc HLSLdpcLogDecScaledMin_0_ap_ready 1 5 4 1620 4140 NJ 4140 NJ N 2760
preplace netloc LDPC_buff_0_raw_dat6_ce0 1 6 5 NJ 3190 NJ 3190 2760 3190 NJ 3190 4050J
preplace netloc setupLDPC_0_nR_M_V 1 4 4 NJ 5940 NJ 5940 NJ 5940 2420
preplace netloc decode_data_b_5_douta 1 7 5 2520 10530 NJ 10530 NJ 10530 NJ 10530 NJ
preplace netloc Decoder_B_pbhat7_address0 1 11 1 5200
preplace netloc LDPC_buff_0_raw_dat7_d0 1 6 6 2140J 2280 NJ 2280 NJ 2280 NJ 2280 NJ 2280 5780
preplace netloc Decoder_B_pR5_ce0 1 11 1 6180
preplace netloc LDPC_buff_0_raw_dat2_we0 1 6 6 NJ 3050 NJ 3050 NJ 3050 NJ 3050 NJ 3050 5970
preplace netloc LDPC_buff_0_raw_dat1_ce0 1 6 5 NJ 2990 NJ 2990 2780 2990 NJ 2990 4030J
preplace netloc LDPC_buff_0_full 1 6 8 2160J 3780 NJ 3780 NJ 3780 NJ 3780 NJ 3780 NJ 3780 NJ 3780 6930J
preplace netloc raw_data_a9_doutb 1 8 4 2950J 6540 NJ 6540 4270J 6510 5370J
preplace netloc LDPC_Out_0_mem_out1_address0 1 9 3 NJ 6360 NJ 6360 5210
preplace netloc LDPC_buff_0_raw_dat4_d0 1 6 6 2110J 3920 NJ 3920 NJ 3920 NJ 3920 4100J 3740 5870
preplace netloc HLSLdpcLogDecScaledMin_0_pR6_address0 1 9 3 3590J 1440 NJ 1440 5550J
preplace netloc setupLDPC_0_ap_ready 1 1 3 270 5960 NJ 5960 NJ
preplace netloc raw_ce_mux_aa3_Res 1 11 1 5410
preplace netloc LDPC_CTRL_0_err_code 1 2 10 600J 6540 NJ 6540 NJ 6540 NJ 6540 NJ 6540 NJ 6540 2740J 6660 NJ 6660 NJ 6660 5310J
preplace netloc HLSLdpcLogDecScaledMin_0_cnt 1 9 5 NJ 4524 NJ 4524 5790J 4490 NJ 4490 6940
preplace netloc Decoder_A_pbhat0_ce0 1 9 3 3680J 7700 NJ 7700 NJ
preplace netloc raw_data_a2_doutb 1 8 4 2960J 3360 NJ 3360 NJ 3360 NJ
preplace netloc data_ce_mux_bb_4_Res 1 11 1 4960
preplace netloc decode_start_lat1_S 1 12 2 NJ 5970 6950
preplace netloc LDPC_Out_0_read_r 1 12 2 NJ 7000 6940J
preplace netloc data_ce_mux2_Res1 1 11 1 5160
preplace netloc LDPC_CTRL_0_init_start_ap_vld 1 2 1 N
preplace netloc raw_ce_mux_aa2_Res 1 11 1 5370
preplace netloc decode_data_0_douta 1 7 5 2410 7490 2750J 7560 NJ 7560 NJ 7560 NJ
preplace netloc Decoder_B_pbhat3_address0 1 11 1 5600
preplace netloc decode_start_lat1_S1 1 10 1 4280
preplace netloc raw_data_b8_doutb 1 10 2 4230J 5360 NJ
preplace netloc data_ce_mux_ab_2_Res 1 11 1 5050
preplace netloc Decoder_A_pbhat5_address0 1 9 3 NJ 4482 NJ 4482 5060
preplace netloc Decoder_B_itt_num_ap_vld 1 11 2 5320J -120 6750J
preplace netloc raw_ce_mux_ba1_Res 1 9 3 NJ 2780 NJ 2780 5990
preplace netloc decode_data_a_1_douta 1 7 5 2420 8220 NJ 8220 NJ 8220 NJ 8220 NJ
preplace netloc decode_data_b_1_douta 1 7 5 2480 7870 NJ 7870 NJ 7870 NJ 7870 5140J
preplace netloc raw_data_a8_doutb 1 8 4 2940J 5680 NJ 5680 NJ 5680 NJ
preplace netloc LDPC_buff_0_raw_dat4_address0 1 6 6 2150J 3880 NJ 3880 NJ 3880 NJ 3880 NJ 3880 6200
preplace netloc data_mux12_S 1 8 1 2830
preplace netloc Decoder_B_pbhat1_address0 1 11 1 5070
preplace netloc reset_1 1 0 12 20J 4180 NJ 4180 NJ 4180 NJ 4180 NJ 4180 1560 4180 NJ 4180 NJ 4180 2760 6010 NJ 6010 NJ 6010 5450J
preplace netloc HLSLdpcLogDecScaledMin_0_pR3_address0 1 9 3 3520J -580 4180J -710 6200J
preplace netloc data_ce_mux_ab_7_Res 1 11 1 4850
preplace netloc raw_ce_mux_aa5_Res 1 11 1 5500
preplace netloc HLSLdpcLogDecScaledMin_0_pR2_ce0 1 9 3 NJ 4083 NJ 4083 5790J
preplace netloc LDPC_buff_0_raw_dat9_address0 1 6 6 2090J 3900 NJ 3900 NJ 3900 NJ 3900 NJ 3900 5370
preplace netloc raw_data_a4_doutb 1 8 4 2960J 4570 3730J 4360 NJ 4360 NJ
preplace netloc HLSLdpcLogDecScaledMin_0_pR9_ce0 1 9 3 NJ 4132 NJ 4132 5660
preplace netloc util_vector_logic_0_Res 1 9 2 NJ 3830 4180
preplace netloc Decoder_A_pbhat4_we0 1 9 3 3610J 10360 NJ 10360 NJ
preplace netloc data_ce_mux1_Res 1 11 1 5190
preplace netloc decode_data_b_3_douta 1 7 5 2500 9210 NJ 9210 NJ 9210 NJ 9210 NJ
preplace netloc LDPC_CTRL_0_status_V_ap_vld 1 2 10 670J 6530 NJ 6530 NJ 6530 NJ 6530 NJ 6530 NJ 6530 NJ 6530 NJ 6530 4280J 6520 5300J
preplace netloc LDPC_buff_0_deran_data 1 6 6 2020J 5950 NJ 5950 NJ 5950 NJ 5950 4150J 4030 5770J
preplace netloc HLSLdpcLogDecScaledMin_0_pR9_address0 1 9 3 NJ 4375 NJ 4375 5620J
preplace netloc Decoder_B_pR9_ce0 1 11 1 6020
preplace netloc data_ce_mux_ab_6_Res 1 11 1 4870
preplace netloc raw_ce_mux_aa6_Res 1 11 1 5540
preplace netloc LDPC_buff_0_raw_dat9_we0 1 6 6 NJ 3330 NJ 3330 NJ 3330 NJ 3330 NJ 3330 5780
preplace netloc Decoder_B_pbhat3_ce0 1 11 1 5760
preplace netloc LDPC_buff_0_raw_dat8_address0 1 6 6 2050J 5200 NJ 5200 NJ 5200 NJ 5200 NJ 5200 6200
preplace netloc LDPC_CTRL_0_buff_reset 1 2 3 NJ 6610 NJ 6610 1360J
preplace netloc LDPC_buff_0_raw_dat1_d0 1 6 6 NJ 3570 NJ 3570 NJ 3570 NJ 3570 NJ 3570 5710
preplace netloc buff_rst_lat_S 1 5 7 1530 -160 NJ -160 NJ -160 2830 -160 NJ -160 4160J 5850 5470J
preplace netloc LDPC_Out_0_cur_read_pos_V 1 9 5 NJ 6300 NJ 6300 5850J 5450 NJ 5450 6930
preplace netloc Decoder_A_pbhat2_d0 1 9 3 3570J 9000 NJ 9000 NJ
preplace netloc Decoder_B_pbhat2_address0 1 11 1 5020
preplace netloc BLOCK_RATE_1 1 0 2 NJ 6500 NJ
preplace netloc setupLDPC_0_etaIndexM_M_V 1 4 4 1320J 5600 NJ 5600 NJ 5600 NJ
preplace netloc Decoder_A_pbhat6_ce0 1 9 3 3560J 11660 NJ 11660 NJ
preplace netloc LDPC_buff_0_raw_dat2_ce0 1 6 5 NJ 3030 NJ 3030 2860 3030 NJ 3030 4150J
preplace netloc HLSLdpcLogDecScaledMin_0_pR5_address0 1 9 3 3550J 760 NJ 760 NJ
preplace netloc LDPC_buff_0_raw_dat5_d0 1 6 6 2050J 1000 NJ 1000 NJ 1000 NJ 1000 NJ 1000 5710
preplace netloc LDPC_Out_0_mem_out5_ce0 1 9 2 NJ 6220 4010
preplace netloc Decoder_B_pR8_address0 1 11 1 5980
preplace netloc Decoder_B_pR1_address0 1 11 1 6070
preplace netloc data_ce_mux_bb_7_Res 1 11 1 4860
preplace netloc LDPC_CTRL_0_size_V_ap_vld 1 1 2 NJ 6660 610
preplace netloc data_ce_mux_ab_4_Res 1 11 1 4930
preplace netloc LDPC_buff_0_decode_start_b 1 6 4 2070 -690 NJ -690 NJ -690 NJ
preplace netloc HLSLdpcLogDecScaledMin_0_pR6_ce0 1 9 3 NJ 4111 NJ 4111 5690J
preplace netloc setupLDPC_0_pMaxIterations_V_ap_vld 1 4 2 1340J 5890 NJ
preplace netloc c_addsub_5_S 1 8 3 2730 140 NJ 140 NJ
preplace netloc Decoder_A_pbhat3_address0 1 9 3 NJ 4454 NJ 4454 5170
preplace netloc Decoder_B_pR9_address0 1 11 1 5930
preplace netloc LDPC_Out_0_rd_clk_out 1 12 2 NJ 7020 6950J
preplace netloc HLSLdpcLogDecScaledMin_0_pR_V_ce0 1 9 3 NJ 4069 NJ 4069 5840J
preplace netloc LDPC_buff_0_raw_dat2_d0 1 6 6 NJ 3610 NJ 3610 NJ 3610 NJ 3610 NJ 3610 5750
preplace netloc raw_data_b_doutb 1 10 2 4190J 5040 NJ
preplace netloc Decoder_A_pbhat5_d0 1 9 3 3630J 4510 NJ 4510 5040
preplace netloc clk_div_1 1 0 12 NJ 6760 NJ 6760 NJ 6760 NJ 6760 NJ 6760 NJ 6760 NJ 6760 NJ 6760 NJ 6760 NJ 6760 NJ 6760 5270J
preplace netloc rd_clk_in_1 1 0 9 NJ 6460 220J 6260 NJ 6260 860J 6290 NJ 6290 NJ 6290 NJ 6290 NJ 6290 2740J
preplace netloc raw_data_b5_doutb 1 10 2 4260J 1120 NJ
preplace netloc raw_ce_mux_ba3_Res 1 9 3 NJ 1410 3980J 830 5450J
preplace netloc Decoder_A_pbhat5_ce0 1 9 3 NJ 4239 NJ 4239 5100
preplace netloc decode_data_b_6_douta 1 7 5 2530 11190 NJ 11190 NJ 11190 NJ 11190 NJ
preplace netloc data_mux11_S 1 8 1 2810
preplace netloc LDPC_Out_0_mem_out4_address0 1 9 3 NJ 6420 NJ 6420 5030
preplace netloc LDPC_buff_0_raw_dat9_d0 1 6 6 NJ 3890 NJ 3890 NJ 3890 NJ 3890 NJ 3890 5710
preplace netloc LDPC_Out_0_mem_out2_address0 1 9 3 NJ 6380 NJ 6380 5130
preplace netloc Decoder_B_pbhat6_ce0 1 11 1 5510
preplace netloc setupLDPC_0_numbits_V_ap_vld 1 4 1 1330
preplace netloc Decoder_B_pR3_address0 1 11 1 6120
preplace netloc data_ce_mux_bb_6_Res 1 11 1 4880
preplace netloc Decoder_A_pbhat1_we0 1 9 3 NJ 4188 NJ 4188 5440
preplace netloc Decoder_B_pbhat6_address0 1 11 1 5260
preplace netloc raw_ce_mux_ba9_Res 1 9 3 NJ 5400 NJ 5400 5590J
preplace netloc Decoder_A_pbhat6_address0 1 9 3 NJ 4496 NJ 4496 5000
preplace netloc Decoder_A_pbhat4_address0 1 9 3 NJ 4468 NJ 4468 5110
preplace netloc LDPC_CTRL_0_rate_V 1 1 2 230J 6300 620
preplace netloc Decoder_B_pR8_ce0 1 11 1 6050
preplace netloc Decoder_B_pR7_ce0 1 11 1 6150
preplace netloc raw_ce_mux2_Res 1 9 3 3550J 4940 NJ 4940 NJ
preplace netloc Decoder_B_pbhat0_address0 1 11 1 5810
preplace netloc LDPC_Out_0_mem_out7_address0 1 9 3 NJ 6480 NJ 6480 4910
preplace netloc c_addsub_2_S 1 12 2 NJ 6730 6920
preplace netloc LDPC_buff_0_raw_dat3_ce0 1 6 5 NJ 3070 NJ 3070 2750 3070 NJ 3070 4000J
preplace netloc LDPC_buff_0_raw_dat8_we0 1 6 6 2100J 5280 NJ 5280 NJ 5280 NJ 5280 NJ 5280 6080
preplace netloc raw_ce_mux_ba5_Res 1 9 3 NJ 1660 NJ 1660 5530
preplace netloc Decoder_A_pbhat2_ce0 1 9 3 3670J 9020 NJ 9020 NJ
preplace netloc LDPC_CTRL_0_err_code_ap_vld 1 2 10 650J 6560 NJ 6560 NJ 6560 NJ 6560 NJ 6560 NJ 6560 NJ 6560 NJ 6560 4260J 6490 5330J
preplace netloc LDPC_Out_0_mem_out3_address0 1 9 3 NJ 6400 NJ 6400 5090
preplace netloc deran_sel_1 1 0 6 NJ 3570 NJ 3570 NJ 3570 NJ 3570 NJ 3570 1540J
preplace netloc LDPC_CTRL_0_mem_mux 1 6 3 2040 4660 NJ 4660 2880
preplace netloc decode_data_a_7_douta 1 7 5 2480 12180 NJ 12180 NJ 12180 NJ 12180 NJ
preplace netloc HLSLdpcLogDecScaledMin_0_pR1_ce0 1 9 3 3540 2740 NJ 2740 NJ
preplace netloc setupLDPC_0_ap_done 1 1 3 260 5850 NJ 5850 NJ
preplace netloc Decoder_B_ap_done 1 5 6 1580 -220 NJ -220 NJ -220 NJ -220 NJ -220 NJ
preplace netloc Decoder_B_pbhat1_ce0 1 11 1 5900
preplace netloc LDPC_Out_0_mem_out4_ce0 1 9 2 NJ 6200 4020
preplace netloc LDPC_CTRL_0_status_V 1 2 10 640J 6550 NJ 6550 NJ 6550 NJ 6550 NJ 6550 NJ 6550 NJ 6550 NJ 6550 4030J 6830 NJ
preplace netloc Decoder_A_pbhat6_d0 1 9 3 3490J 11640 NJ 11640 NJ
preplace netloc Net 1 7 4 2400 6670 2920 6670 NJ 6670 3980
preplace netloc data_ce_mux_ab_3_Res 1 11 1 4970
preplace netloc LDPC_buff_0_upgraded_ipi_deran_data_ap_vld 1 6 8 2060J 5990 NJ 5990 NJ 5990 NJ 5990 NJ 5990 6070 6350 6740J 6310 NJ
preplace netloc Decoder_A_pbhat7_d0 1 9 3 3470J 12300 NJ 12300 NJ
preplace netloc data_mux17_S 1 8 1 2940
preplace netloc LDPC_RUN_1 1 0 2 NJ 6520 NJ
preplace netloc LDPC_buff_0_raw_dat7_we0 1 6 6 2060J 2320 NJ 2320 NJ 2320 NJ 2320 NJ 2320 5790
preplace netloc Decoder_B_pR4_ce0 1 11 1 6130
preplace netloc LDPC_buff_0_raw_dat3_address0 1 6 6 NJ 3630 NJ 3630 NJ 3630 NJ 3630 NJ 3630 5520
preplace netloc HLSLdpcLogDecScaledMin_0_pR7_address0 1 9 3 3620J 2090 NJ 2090 5620J
preplace netloc HLSLdpcLogDecScaledMin_0_pR2_address0 1 9 3 3600J 3320 NJ 3320 NJ
preplace netloc LDPC_buff_0_raw_dat_V_address0 1 6 6 NJ 3510 NJ 3510 NJ 3510 NJ 3510 NJ 3510 5860
preplace netloc Decoder_B_pbhat2_d0 1 11 1 5010
preplace netloc raw_data_b2_doutb 1 10 2 4210J 3680 NJ
preplace netloc setupLDPC_0_pCodeM_V 1 4 4 NJ 6060 NJ 6060 NJ 6060 N
preplace netloc LDPC_buff_0_raw_dat6_d0 1 6 6 2080J 1320 NJ 1320 NJ 1320 NJ 1320 NJ 1320 6190
preplace netloc Decoder_B_pR4_address0 1 11 1 6030
preplace netloc decode_data_b_2_douta 1 7 5 2490 8550 NJ 8550 NJ 8550 NJ 8550 NJ
preplace netloc HLSLdpcLogDecScaledMin_0_pR_V_address0 1 9 3 3710J 4680 NJ 4680 NJ
preplace netloc HLSLdpcLogDecScaledMin_0_pR5_ce0 1 9 3 3470 820 NJ 820 NJ
preplace netloc Decoder_A_pbhat7_ce0 1 9 3 NJ 4271 NJ 4271 4990
preplace netloc data_ce_mux_bb_3_Res 1 11 1 5010
preplace netloc ap_rst_1 1 0 2 10J 6470 250J
preplace netloc Decoder_B_pR2_ce0 1 11 1 6140
preplace netloc LDPC_Out_0_mem_out1_ce0 1 9 2 NJ 6140 4060
preplace netloc Decoder_A_pbhat3_d0 1 9 3 3520J 9660 NJ 9660 NJ
preplace netloc Decoder_B_pbhat6_we0 1 11 1 4900
preplace netloc LDPC_CTRL_0_init_start 1 2 1 660
preplace netloc LDPC_Out_0_data_out 1 9 5 3700J 3770 NJ 3770 NJ 3770 NJ 3770 6940J
preplace netloc data_ce_mux3_Res 1 11 1 5120
preplace netloc c_addsub_7_S 1 5 6 1520 180 NJ 180 NJ 180 2790J 180 NJ 180 NJ
preplace netloc Decoder_A_pbhat0_address0 1 9 3 3620J 7640 NJ 7640 NJ
preplace netloc Decoder_B_pbhat0_ce0 1 11 1 5960
preplace netloc raw_data_a7_doutb 1 8 4 2910J 2110 NJ 2110 NJ 2110 5630J
preplace netloc LDPC_buff_0_raw_dat4_ce0 1 6 6 NJ 3130 NJ 3130 NJ 3130 NJ 3130 NJ 3130 5910
preplace netloc decode_data_a_2_douta 1 7 5 2430 8870 NJ 8870 NJ 8870 NJ 8870 5020J
preplace netloc LDPC_CTRL_0_size_V 1 1 2 NJ 6700 600
preplace netloc LDPC_buff_0_raw_dat4_ce1 1 6 5 NJ 3110 NJ 3110 2850 3110 NJ 3110 4130J
preplace netloc decode_data_a_4_douta 1 7 5 2450 10200 NJ 10200 NJ 10200 NJ 10200 NJ
preplace netloc Decoder_B_pR3_ce0 1 11 1 6190
preplace netloc raw_ce_mux_ba4_Res 1 9 3 NJ 3700 NJ 3700 5920
preplace netloc Decoder_A_pbhat7_address0 1 9 3 3480J 12260 NJ 12260 NJ
preplace netloc Decoder_A_pbhat1_ce0 1 9 3 3690J 4170 NJ 4170 5460
preplace netloc LDPC_buff_0_raw_dat7_ce0 1 6 5 NJ 3230 NJ 3230 2820 3230 NJ 3230 4090
preplace netloc decode_data_a_3_douta 1 7 5 2440 9640 NJ 9640 NJ 9640 NJ 9640 5010J
preplace netloc xlconstant_3_dout 1 10 1 4180
preplace netloc Decoder_B_pbhat1_we0 1 11 1 5880
preplace netloc raw_data_b4_doutb 1 10 2 4220J 4040 NJ
preplace netloc raw_ce_mux_aa1_Res 1 11 1 5990
preplace netloc raw_data_b1_doutb 1 10 2 4200J 3040 NJ
preplace netloc raw_ce_mux_aa4_Res 1 11 1 5850
preplace netloc LDPC_buff_0_decode_start 1 6 2 NJ 4010 2400J
preplace netloc write_clk_en_1 1 0 6 10J 3520 NJ 3520 NJ 3520 NJ 3520 NJ 3520 NJ
preplace netloc Decoder_A_pbhat5_we0 1 9 3 3710J 4260 NJ 4260 5080
preplace netloc Decoder_A_pbhat2_we0 1 9 3 3660J 9040 NJ 9040 NJ
preplace netloc Decoder_B_pbhat2_ce0 1 11 1 5820
preplace netloc LDPC_Out_0_mem_out2_ce0 1 9 2 NJ 6160 4050
preplace netloc c_addsub_3_S 1 8 3 2850 5760 NJ 5760 4010J
preplace netloc setupLDPC_0_numbits_V 1 4 1 1360
preplace netloc Decoder_B_pR5_address0 1 11 1 6110
preplace netloc raw_data_b3_doutb 1 10 2 4250J 650 5420J
preplace netloc LDPC_Out_0_mem_out7_ce0 1 9 2 NJ 6260 3990
preplace netloc decode_data_b_7_douta 1 7 5 2540 11850 NJ 11850 NJ 11850 NJ 11850 NJ
preplace netloc LDPC_CTRL_0_buff_start 1 2 9 630J 6570 NJ 6570 NJ 6570 NJ 6570 NJ 6570 NJ 6570 NJ 6570 NJ 6570 NJ
preplace netloc LDPC_buff_0_raw_dat1_address0 1 6 6 NJ 3550 NJ 3550 NJ 3550 NJ 3550 NJ 3550 5700
preplace netloc Decoder_B_pbhat7_ce0 1 11 1 5430
preplace netloc LDPC_buff_0_dec_dat_ce0 1 9 2 NJ 6120 4070
preplace netloc Decoder_B_pbhat3_we0 1 11 1 5740
preplace netloc data_in_1 1 0 6 -10J 3460 NJ 3460 NJ 3460 NJ 3460 NJ 3460 NJ
preplace netloc LDPC_Out_0_rd_mux_ap_vld 1 6 4 2160 6740 NJ 6740 NJ 6740 3450
preplace netloc setupLDPC_0_pMaxIterations_V 1 4 2 NJ 6120 1560
preplace netloc LDPC_buff_0_decode_start_ap_vld 1 6 2 NJ 3430 2430
preplace netloc HLSLdpcLogDecScaledMin_0_pR4_ce0 1 9 3 NJ 4097 NJ 4097 5830J
preplace netloc Decoder_B_pbhat0_we0 1 11 1 5950
preplace netloc raw_data_b7_doutb 1 10 2 4280J 2400 NJ
preplace netloc raw_data_b6_doutb 1 10 2 4270J 1760 NJ
preplace netloc xlconstant_2_dout 1 11 1 5930
preplace netloc LDPC_CTRL_0_buff_start_ap_vld 1 2 9 680J 6420 880J 6370 NJ 6370 NJ 6370 NJ 6370 NJ 6370 2750J 6610 NJ 6610 N
preplace netloc raw_data_a3_doutb 1 8 4 2920J 840 NJ 840 NJ 840 5370J
preplace netloc raw_data_a5_doutb 1 8 4 2890J 800 NJ 800 NJ 800 NJ
preplace netloc HLSLdpcLogDecScaledMin_0_itt_num 1 9 3 3530J 5810 NJ 5810 NJ
preplace netloc Decoder_B_pbhat7_we0 1 11 1 5360
preplace netloc Decoder_B_pR_address0 1 11 1 6000
preplace netloc LDPC_buff_0_raw_dat5_ce0 1 6 5 NJ 3150 NJ 3150 2770 3150 NJ 3150 3990J
preplace netloc Decoder_B_pR1_ce0 1 11 1 6160
preplace netloc mux_lat1_S 1 12 2 NJ 5830 6920
preplace netloc LDPC_Out_0_mem_out6_address0 1 9 3 NJ 6460 NJ 6460 4940
preplace netloc LDPC_buff_0_raw_dat5_we0 1 6 6 NJ 3170 NJ 3170 NJ 3170 NJ 3170 NJ 3170 5590
preplace netloc c_addsub_10_S 1 0 12 10 6750 NJ 6750 NJ 6750 870 6750 NJ 6750 NJ 6750 NJ 6750 NJ 6750 N 6750 NJ 6750 NJ 6750 5280J
preplace netloc HLSLdpcLogDecScaledMin_0_ap_done 1 5 4 1610 4160 NJ 4160 NJ 4160 2750J
preplace netloc Decoder_B_pbhat5_d0 1 11 1 5350
preplace netloc HLSLdpcLogDecScaledMin_0_pR1_address0 1 9 3 NJ 4311 NJ 4311 5320J
preplace netloc HLSLdpcLogDecScaledMin_0_itt_num_ap_vld 1 9 3 NJ 4295 NJ 4295 5690J
preplace netloc Decoder_B_pbhat1_d0 1 11 1 5050
preplace netloc raw_data_b9_doutb 1 10 2 4240J 6260 NJ
preplace netloc Decoder_B_pbhat0_d0 1 11 1 5400
preplace netloc raw_ce_mux_ba7_Res 1 9 3 NJ 2220 NJ 2220 5990
preplace netloc xlconstant_0_dout1 1 8 1 2750
preplace netloc LDPC_buff_0_raw_dat6_address0 1 6 6 2090J 1600 NJ 1600 NJ 1600 NJ 1600 NJ 1600 5710
preplace netloc decode_data_1_douta 1 7 5 2440 7270 NJ 7270 NJ 7270 NJ 7270 5860J
preplace netloc c_addsub_1_S 1 12 2 NJ 6850 6930
preplace netloc data_ce_mux2_Res 1 5 6 1600 200 NJ 200 NJ 200 NJ 200 3580J 200 4080
preplace netloc LDPC_buff_0_upgraded_ipi_raw_dat_we0 1 6 6 NJ 2970 NJ 2970 NJ 2970 NJ 2970 NJ 2970 5890
preplace netloc BLOCK_SIZE_1 1 0 2 NJ 6480 NJ
preplace netloc LDPC_Out_0_mem_out3_ce0 1 9 2 NJ 6180 4040
preplace netloc Decoder_A_pbhat1_address0 1 9 3 3720J 4420 NJ 4420 5340
preplace netloc LDPC_buff_0_raw_dat_V_d0 1 6 6 2120J 4920 NJ 4920 NJ 4920 NJ 4920 NJ 4920 5870
preplace netloc Decoder_B_pR7_address0 1 11 1 6060
preplace netloc LDPC_buff_0_raw_dat2_address0 1 6 6 NJ 3590 NJ 3590 NJ 3590 NJ 3590 NJ 3590 5720
preplace netloc raw_ce_mux_ba2_Res 1 9 3 NJ 3420 NJ 3420 5940
preplace netloc setupLDPC_0_etaIndexM_M_V_ap_vld 1 4 4 NJ 5640 NJ 5640 NJ 5640 NJ
preplace netloc Decoder_B_pbhat2_we0 1 11 1 5800
preplace netloc LDPC_buff_0_cur_write_pos_V 1 6 8 2170J 3530 NJ 3530 NJ 3530 NJ 3530 NJ 3530 5730J 3450 NJ 3450 6950
preplace netloc Net1 1 5 6 1590 -200 NJ -200 NJ -200 NJ -200 3700J -200 N
preplace netloc xlconstant_0_dout 1 1 1 230J
preplace netloc Decoder_A_pbhat4_ce0 1 9 3 NJ 4223 NJ 4223 5150
preplace netloc Decoder_A_pbhat2_address0 1 9 3 NJ 4440 NJ 4440 5220
preplace netloc pMaxIterations_1 1 0 11 0J 160 NJ 160 NJ 160 NJ 160 NJ 160 NJ 160 NJ 160 NJ 160 2870J 160 NJ 160 NJ
preplace netloc setupLDPC_0_pCodeM_V_ap_vld 1 4 4 NJ 5700 NJ 5700 NJ 5700 2400J
preplace netloc data_mux1_S 1 8 1 2780
preplace netloc Decoder_B_pbhat4_we0 1 11 1 5640
preplace netloc HLSLdpcLogDecScaledMin_0_pR4_address0 1 9 3 NJ 4335 NJ 4335 5380J
preplace netloc HLSLdpcLogDecScaledMin_0_pR7_ce0 1 9 3 3560J 2100 NJ 2100 NJ
preplace netloc Decoder_B_pbhat5_ce0 1 11 1 5610
preplace netloc HLSLdpcLogDecScaledMin_0_pR8_ce0 1 9 3 3750 5700 NJ 5700 NJ
preplace netloc Decoder_A_pbhat3_we0 1 9 3 3640J 9700 NJ 9700 NJ
preplace netloc LDPC_buff_0_overrun 1 6 8 NJ 3950 NJ 3950 NJ 3950 NJ 3950 4120J 3810 NJ 3810 NJ 3810 6940
preplace netloc LDPC_buff_0_raw_dat6_we0 1 6 6 NJ 3210 NJ 3210 NJ 3210 NJ 3210 4040 1450 6200
preplace netloc raw_ce_mux1_Res 1 11 1 N
preplace netloc raw_ce_mux_ba6_Res 1 9 3 NJ 1530 3980J 1610 6010
preplace netloc LDPC_Out_0_rd_mux 1 6 4 2160 5980 NJ 5980 NJ 5980 3460
preplace netloc Decoder_B_pbhat3_d0 1 11 1 5570
preplace netloc raw_ce_mux_aa8_Res 1 11 1 5630
preplace netloc raw_data_a1_doutb 1 8 4 2950J 2720 NJ 2720 NJ 2720 NJ
levelinfo -pg 1 -30 130 440 770 1100 1440 1820 2320 2640 3230 3900 4660 6580 6840 7000 -top -730 -bot 12420
",
}

  # Restore current instance
  current_bd_instance $oldCurInst

  save_bd_design
}
# End of create_root_design()


##################################################################
# MAIN FLOW
##################################################################

create_root_design ""


