// (c) Copyright 1995-2019 Xilinx, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// 
// DO NOT MODIFY THIS FILE.


// IP VLNV: xilinx.com:hls:LDPC_Out:1.0
// IP Revision: 1910100858

(* X_CORE_INFO = "LDPC_Out,Vivado 2016.3" *)
(* CHECK_LICENSE_TYPE = "design_2_LDPC_Out_0_0,LDPC_Out,{}" *)
(* CORE_GENERATION_INFO = "design_2_LDPC_Out_0_0,LDPC_Out,{x_ipProduct=Vivado 2016.3,x_ipVendor=xilinx.com,x_ipLibrary=hls,x_ipName=LDPC_Out,x_ipVersion=1.0,x_ipCoreRevision=1910100858,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED}" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)
module design_2_LDPC_Out_0_0 (
  data_out_ap_vld,
  cur_read_pos_V_ap_vld,
  rd_mux_ap_vld,
  mem_out0_ce0,
  mem_out1_ce0,
  mem_out2_ce0,
  mem_out3_ce0,
  mem_out4_ce0,
  mem_out5_ce0,
  mem_out6_ce0,
  mem_out7_ce0,
  ap_clk,
  ap_rst,
  ap_start,
  ap_done,
  ap_idle,
  ap_ready,
  data_out,
  reset,
  cur_read_pos_V,
  numbits_V,
  rd_clk_in,
  rd_mux,
  mem_out0_address0,
  mem_out0_q0,
  mem_out1_address0,
  mem_out1_q0,
  mem_out2_address0,
  mem_out2_q0,
  mem_out3_address0,
  mem_out3_q0,
  mem_out4_address0,
  mem_out4_q0,
  mem_out5_address0,
  mem_out5_q0,
  mem_out6_address0,
  mem_out6_q0,
  mem_out7_address0,
  mem_out7_q0
);

output wire data_out_ap_vld;
output wire cur_read_pos_V_ap_vld;
output wire rd_mux_ap_vld;
output wire mem_out0_ce0;
output wire mem_out1_ce0;
output wire mem_out2_ce0;
output wire mem_out3_ce0;
output wire mem_out4_ce0;
output wire mem_out5_ce0;
output wire mem_out6_ce0;
output wire mem_out7_ce0;
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 ap_clk CLK" *)
input wire ap_clk;
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 ap_rst RST" *)
input wire ap_rst;
(* X_INTERFACE_INFO = "xilinx.com:interface:acc_handshake:1.0 ap_ctrl start" *)
input wire ap_start;
(* X_INTERFACE_INFO = "xilinx.com:interface:acc_handshake:1.0 ap_ctrl done" *)
output wire ap_done;
(* X_INTERFACE_INFO = "xilinx.com:interface:acc_handshake:1.0 ap_ctrl idle" *)
output wire ap_idle;
(* X_INTERFACE_INFO = "xilinx.com:interface:acc_handshake:1.0 ap_ctrl ready" *)
output wire ap_ready;
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 data_out DATA" *)
output wire [0 : 0] data_out;
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 reset DATA" *)
input wire [0 : 0] reset;
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 cur_read_pos_V DATA" *)
output wire [15 : 0] cur_read_pos_V;
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 numbits_V DATA" *)
input wire [15 : 0] numbits_V;
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 rd_clk_in DATA" *)
input wire [0 : 0] rd_clk_in;
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 rd_mux DATA" *)
output wire [0 : 0] rd_mux;
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 mem_out0_address0 DATA" *)
output wire [10 : 0] mem_out0_address0;
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 mem_out0_q0 DATA" *)
input wire [0 : 0] mem_out0_q0;
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 mem_out1_address0 DATA" *)
output wire [10 : 0] mem_out1_address0;
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 mem_out1_q0 DATA" *)
input wire [0 : 0] mem_out1_q0;
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 mem_out2_address0 DATA" *)
output wire [9 : 0] mem_out2_address0;
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 mem_out2_q0 DATA" *)
input wire [0 : 0] mem_out2_q0;
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 mem_out3_address0 DATA" *)
output wire [9 : 0] mem_out3_address0;
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 mem_out3_q0 DATA" *)
input wire [0 : 0] mem_out3_q0;
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 mem_out4_address0 DATA" *)
output wire [9 : 0] mem_out4_address0;
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 mem_out4_q0 DATA" *)
input wire [0 : 0] mem_out4_q0;
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 mem_out5_address0 DATA" *)
output wire [9 : 0] mem_out5_address0;
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 mem_out5_q0 DATA" *)
input wire [0 : 0] mem_out5_q0;
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 mem_out6_address0 DATA" *)
output wire [9 : 0] mem_out6_address0;
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 mem_out6_q0 DATA" *)
input wire [0 : 0] mem_out6_q0;
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 mem_out7_address0 DATA" *)
output wire [9 : 0] mem_out7_address0;
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 mem_out7_q0 DATA" *)
input wire [0 : 0] mem_out7_q0;

  LDPC_Out inst (
    .data_out_ap_vld(data_out_ap_vld),
    .cur_read_pos_V_ap_vld(cur_read_pos_V_ap_vld),
    .rd_mux_ap_vld(rd_mux_ap_vld),
    .mem_out0_ce0(mem_out0_ce0),
    .mem_out1_ce0(mem_out1_ce0),
    .mem_out2_ce0(mem_out2_ce0),
    .mem_out3_ce0(mem_out3_ce0),
    .mem_out4_ce0(mem_out4_ce0),
    .mem_out5_ce0(mem_out5_ce0),
    .mem_out6_ce0(mem_out6_ce0),
    .mem_out7_ce0(mem_out7_ce0),
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(ap_start),
    .ap_done(ap_done),
    .ap_idle(ap_idle),
    .ap_ready(ap_ready),
    .data_out(data_out),
    .reset(reset),
    .cur_read_pos_V(cur_read_pos_V),
    .numbits_V(numbits_V),
    .rd_clk_in(rd_clk_in),
    .rd_mux(rd_mux),
    .mem_out0_address0(mem_out0_address0),
    .mem_out0_q0(mem_out0_q0),
    .mem_out1_address0(mem_out1_address0),
    .mem_out1_q0(mem_out1_q0),
    .mem_out2_address0(mem_out2_address0),
    .mem_out2_q0(mem_out2_q0),
    .mem_out3_address0(mem_out3_address0),
    .mem_out3_q0(mem_out3_q0),
    .mem_out4_address0(mem_out4_address0),
    .mem_out4_q0(mem_out4_q0),
    .mem_out5_address0(mem_out5_address0),
    .mem_out5_q0(mem_out5_q0),
    .mem_out6_address0(mem_out6_address0),
    .mem_out6_q0(mem_out6_q0),
    .mem_out7_address0(mem_out7_address0),
    .mem_out7_q0(mem_out7_q0)
  );
endmodule
