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


// IP VLNV: xilinx.com:hls:LDPC_buff:1.0
// IP Revision: 1909301635

`timescale 1ns/1ps

(* DowngradeIPIdentifiedWarnings = "yes" *)
module design_2_LDPC_buff_0_0 (
  raw_dat0_ce0,
  raw_dat0_we0,
  raw_dat1_ce0,
  raw_dat1_we0,
  raw_dat2_ce0,
  raw_dat2_we0,
  raw_dat3_ce0,
  raw_dat3_we0,
  raw_dat4_ce0,
  raw_dat4_we0,
  raw_dat5_ce0,
  raw_dat5_we0,
  raw_dat6_ce0,
  raw_dat6_we0,
  raw_dat7_ce0,
  raw_dat7_we0,
  raw_dat8_ce0,
  raw_dat8_we0,
  raw_dat9_ce0,
  raw_dat9_we0,
  raw_dat10_ce0,
  raw_dat10_we0,
  overrun_ap_vld,
  full_ap_vld,
  decode_start_ap_vld,
  decode_start_b_ap_vld,
  deran_data_ap_vld,
  cur_write_pos_V_ap_vld,
  ap_clk,
  ap_rst,
  ap_start,
  ap_done,
  ap_idle,
  ap_ready,
  data_in,
  reset,
  raw_dat0_address0,
  raw_dat0_d0,
  raw_dat1_address0,
  raw_dat1_d0,
  raw_dat2_address0,
  raw_dat2_d0,
  raw_dat3_address0,
  raw_dat3_d0,
  raw_dat4_address0,
  raw_dat4_d0,
  raw_dat5_address0,
  raw_dat5_d0,
  raw_dat6_address0,
  raw_dat6_d0,
  raw_dat7_address0,
  raw_dat7_d0,
  raw_dat8_address0,
  raw_dat8_d0,
  raw_dat9_address0,
  raw_dat9_d0,
  raw_dat10_address0,
  raw_dat10_d0,
  numbits_V,
  overrun,
  full,
  write_r,
  deran_V,
  mux,
  decode_done,
  decode_start,
  decode_ready,
  decode_done_b,
  decode_start_b,
  decode_ready_b,
  deran_data,
  cur_write_pos_V,
  out_mux
);

output wire raw_dat0_ce0;
output wire raw_dat0_we0;
output wire raw_dat1_ce0;
output wire raw_dat1_we0;
output wire raw_dat2_ce0;
output wire raw_dat2_we0;
output wire raw_dat3_ce0;
output wire raw_dat3_we0;
output wire raw_dat4_ce0;
output wire raw_dat4_we0;
output wire raw_dat5_ce0;
output wire raw_dat5_we0;
output wire raw_dat6_ce0;
output wire raw_dat6_we0;
output wire raw_dat7_ce0;
output wire raw_dat7_we0;
output wire raw_dat8_ce0;
output wire raw_dat8_we0;
output wire raw_dat9_ce0;
output wire raw_dat9_we0;
output wire raw_dat10_ce0;
output wire raw_dat10_we0;
output wire overrun_ap_vld;
output wire full_ap_vld;
output wire decode_start_ap_vld;
output wire decode_start_b_ap_vld;
output wire deran_data_ap_vld;
output wire cur_write_pos_V_ap_vld;
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
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 data_in DATA" *)
input wire [7 : 0] data_in;
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 reset DATA" *)
input wire [0 : 0] reset;
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 raw_dat0_address0 DATA" *)
output wire [10 : 0] raw_dat0_address0;
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 raw_dat0_d0 DATA" *)
output wire [7 : 0] raw_dat0_d0;
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 raw_dat1_address0 DATA" *)
output wire [10 : 0] raw_dat1_address0;
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 raw_dat1_d0 DATA" *)
output wire [7 : 0] raw_dat1_d0;
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 raw_dat2_address0 DATA" *)
output wire [10 : 0] raw_dat2_address0;
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 raw_dat2_d0 DATA" *)
output wire [7 : 0] raw_dat2_d0;
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 raw_dat3_address0 DATA" *)
output wire [10 : 0] raw_dat3_address0;
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 raw_dat3_d0 DATA" *)
output wire [7 : 0] raw_dat3_d0;
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 raw_dat4_address0 DATA" *)
output wire [9 : 0] raw_dat4_address0;
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 raw_dat4_d0 DATA" *)
output wire [7 : 0] raw_dat4_d0;
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 raw_dat5_address0 DATA" *)
output wire [9 : 0] raw_dat5_address0;
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 raw_dat5_d0 DATA" *)
output wire [7 : 0] raw_dat5_d0;
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 raw_dat6_address0 DATA" *)
output wire [9 : 0] raw_dat6_address0;
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 raw_dat6_d0 DATA" *)
output wire [7 : 0] raw_dat6_d0;
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 raw_dat7_address0 DATA" *)
output wire [9 : 0] raw_dat7_address0;
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 raw_dat7_d0 DATA" *)
output wire [7 : 0] raw_dat7_d0;
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 raw_dat8_address0 DATA" *)
output wire [9 : 0] raw_dat8_address0;
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 raw_dat8_d0 DATA" *)
output wire [7 : 0] raw_dat8_d0;
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 raw_dat9_address0 DATA" *)
output wire [9 : 0] raw_dat9_address0;
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 raw_dat9_d0 DATA" *)
output wire [7 : 0] raw_dat9_d0;
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 raw_dat10_address0 DATA" *)
output wire [9 : 0] raw_dat10_address0;
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 raw_dat10_d0 DATA" *)
output wire [7 : 0] raw_dat10_d0;
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 numbits_V DATA" *)
input wire [15 : 0] numbits_V;
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 overrun DATA" *)
output wire [0 : 0] overrun;
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 full DATA" *)
output wire [0 : 0] full;
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 write_r DATA" *)
input wire [0 : 0] write_r;
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 deran_V DATA" *)
input wire [1 : 0] deran_V;
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 mux DATA" *)
output wire [0 : 0] mux;
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 decode_done DATA" *)
input wire [0 : 0] decode_done;
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 decode_start DATA" *)
output wire [0 : 0] decode_start;
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 decode_ready DATA" *)
input wire [0 : 0] decode_ready;
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 decode_done_b DATA" *)
input wire [0 : 0] decode_done_b;
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 decode_start_b DATA" *)
output wire [0 : 0] decode_start_b;
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 decode_ready_b DATA" *)
input wire [0 : 0] decode_ready_b;
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 deran_data DATA" *)
output wire [7 : 0] deran_data;
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 cur_write_pos_V DATA" *)
output wire [15 : 0] cur_write_pos_V;
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 out_mux DATA" *)
input wire [0 : 0] out_mux;

  LDPC_buff inst (
    .raw_dat0_ce0(raw_dat0_ce0),
    .raw_dat0_we0(raw_dat0_we0),
    .raw_dat1_ce0(raw_dat1_ce0),
    .raw_dat1_we0(raw_dat1_we0),
    .raw_dat2_ce0(raw_dat2_ce0),
    .raw_dat2_we0(raw_dat2_we0),
    .raw_dat3_ce0(raw_dat3_ce0),
    .raw_dat3_we0(raw_dat3_we0),
    .raw_dat4_ce0(raw_dat4_ce0),
    .raw_dat4_we0(raw_dat4_we0),
    .raw_dat5_ce0(raw_dat5_ce0),
    .raw_dat5_we0(raw_dat5_we0),
    .raw_dat6_ce0(raw_dat6_ce0),
    .raw_dat6_we0(raw_dat6_we0),
    .raw_dat7_ce0(raw_dat7_ce0),
    .raw_dat7_we0(raw_dat7_we0),
    .raw_dat8_ce0(raw_dat8_ce0),
    .raw_dat8_we0(raw_dat8_we0),
    .raw_dat9_ce0(raw_dat9_ce0),
    .raw_dat9_we0(raw_dat9_we0),
    .raw_dat10_ce0(raw_dat10_ce0),
    .raw_dat10_we0(raw_dat10_we0),
    .overrun_ap_vld(overrun_ap_vld),
    .full_ap_vld(full_ap_vld),
    .decode_start_ap_vld(decode_start_ap_vld),
    .decode_start_b_ap_vld(decode_start_b_ap_vld),
    .deran_data_ap_vld(deran_data_ap_vld),
    .cur_write_pos_V_ap_vld(cur_write_pos_V_ap_vld),
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(ap_start),
    .ap_done(ap_done),
    .ap_idle(ap_idle),
    .ap_ready(ap_ready),
    .data_in(data_in),
    .reset(reset),
    .raw_dat0_address0(raw_dat0_address0),
    .raw_dat0_d0(raw_dat0_d0),
    .raw_dat1_address0(raw_dat1_address0),
    .raw_dat1_d0(raw_dat1_d0),
    .raw_dat2_address0(raw_dat2_address0),
    .raw_dat2_d0(raw_dat2_d0),
    .raw_dat3_address0(raw_dat3_address0),
    .raw_dat3_d0(raw_dat3_d0),
    .raw_dat4_address0(raw_dat4_address0),
    .raw_dat4_d0(raw_dat4_d0),
    .raw_dat5_address0(raw_dat5_address0),
    .raw_dat5_d0(raw_dat5_d0),
    .raw_dat6_address0(raw_dat6_address0),
    .raw_dat6_d0(raw_dat6_d0),
    .raw_dat7_address0(raw_dat7_address0),
    .raw_dat7_d0(raw_dat7_d0),
    .raw_dat8_address0(raw_dat8_address0),
    .raw_dat8_d0(raw_dat8_d0),
    .raw_dat9_address0(raw_dat9_address0),
    .raw_dat9_d0(raw_dat9_d0),
    .raw_dat10_address0(raw_dat10_address0),
    .raw_dat10_d0(raw_dat10_d0),
    .numbits_V(numbits_V),
    .overrun(overrun),
    .full(full),
    .write_r(write_r),
    .deran_V(deran_V),
    .mux(mux),
    .decode_done(decode_done),
    .decode_start(decode_start),
    .decode_ready(decode_ready),
    .decode_done_b(decode_done_b),
    .decode_start_b(decode_start_b),
    .decode_ready_b(decode_ready_b),
    .deran_data(deran_data),
    .cur_write_pos_V(cur_write_pos_V),
    .out_mux(out_mux)
  );
endmodule
