// (c) Copyright 1995-2023 Xilinx, Inc. All rights reserved.
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


// IP VLNV: xilinx.com:hls:HLSLdpcLogDecScaledMin:11.0
// IP Revision: 2112311606

(* X_CORE_INFO = "HLSLdpcLogDecScaledMin,Vivado 2016.3" *)
(* CHECK_LICENSE_TYPE = "design_2_HLSLdpcLogDecScaledMin_0_1,HLSLdpcLogDecScaledMin,{}" *)
(* CORE_GENERATION_INFO = "design_2_HLSLdpcLogDecScaledMin_0_1,HLSLdpcLogDecScaledMin,{x_ipProduct=Vivado 2016.3,x_ipVendor=xilinx.com,x_ipLibrary=hls,x_ipName=HLSLdpcLogDecScaledMin,x_ipVersion=11.0,x_ipCoreRevision=2112311606,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED}" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)
module design_2_HLSLdpcLogDecScaledMin_0_1 (
  pR_ce0,
  pR1_ce0,
  pR2_ce0,
  pR3_ce0,
  pR4_ce0,
  pR5_ce0,
  pR6_ce0,
  pR6_we0,
  pR7_ce0,
  pR7_we0,
  pR8_ce0,
  pR8_we0,
  pR9_ce0,
  pR9_we0,
  pR10_ce0,
  pR10_we0,
  pbhat0_ce0,
  pbhat0_we0,
  pbhat1_ce0,
  pbhat1_we0,
  pbhat2_ce0,
  pbhat2_we0,
  pbhat3_ce0,
  pbhat3_we0,
  pbhat4_ce0,
  pbhat4_we0,
  pbhat5_ce0,
  pbhat5_we0,
  pbhat6_ce0,
  pbhat6_we0,
  pbhat7_ce0,
  pbhat7_we0,
  cnt_ap_vld,
  itt_num_ap_vld,
  ap_clk,
  ap_rst,
  ap_start,
  ap_done,
  ap_idle,
  ap_ready,
  pR_address0,
  pR_q0,
  pR1_address0,
  pR1_q0,
  pR2_address0,
  pR2_q0,
  pR3_address0,
  pR3_q0,
  pR4_address0,
  pR4_q0,
  pR5_address0,
  pR5_q0,
  pR6_address0,
  pR6_d0,
  pR6_q0,
  pR7_address0,
  pR7_d0,
  pR7_q0,
  pR8_address0,
  pR8_d0,
  pR8_q0,
  pR9_address0,
  pR9_d0,
  pR9_q0,
  pR10_address0,
  pR10_d0,
  pR10_q0,
  pbhat0_address0,
  pbhat0_d0,
  pbhat1_address0,
  pbhat1_d0,
  pbhat2_address0,
  pbhat2_d0,
  pbhat3_address0,
  pbhat3_d0,
  pbhat4_address0,
  pbhat4_d0,
  pbhat4_q0,
  pbhat5_address0,
  pbhat5_d0,
  pbhat5_q0,
  pbhat6_address0,
  pbhat6_d0,
  pbhat6_q0,
  pbhat7_address0,
  pbhat7_d0,
  pbhat7_q0,
  cnt,
  nR_M,
  etaIndexM_M,
  pCodeM,
  pMaxIterations,
  itt_num,
  numbits,
  mux,
  test_port
);

output wire pR_ce0;
output wire pR1_ce0;
output wire pR2_ce0;
output wire pR3_ce0;
output wire pR4_ce0;
output wire pR5_ce0;
output wire pR6_ce0;
output wire pR6_we0;
output wire pR7_ce0;
output wire pR7_we0;
output wire pR8_ce0;
output wire pR8_we0;
output wire pR9_ce0;
output wire pR9_we0;
output wire pR10_ce0;
output wire pR10_we0;
output wire pbhat0_ce0;
output wire pbhat0_we0;
output wire pbhat1_ce0;
output wire pbhat1_we0;
output wire pbhat2_ce0;
output wire pbhat2_we0;
output wire pbhat3_ce0;
output wire pbhat3_we0;
output wire pbhat4_ce0;
output wire pbhat4_we0;
output wire pbhat5_ce0;
output wire pbhat5_we0;
output wire pbhat6_ce0;
output wire pbhat6_we0;
output wire pbhat7_ce0;
output wire pbhat7_we0;
output wire cnt_ap_vld;
output wire itt_num_ap_vld;
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
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 pR_address0 DATA" *)
output wire [10 : 0] pR_address0;
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 pR_q0 DATA" *)
input wire [7 : 0] pR_q0;
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 pR1_address0 DATA" *)
output wire [10 : 0] pR1_address0;
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 pR1_q0 DATA" *)
input wire [7 : 0] pR1_q0;
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 pR2_address0 DATA" *)
output wire [10 : 0] pR2_address0;
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 pR2_q0 DATA" *)
input wire [7 : 0] pR2_q0;
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 pR3_address0 DATA" *)
output wire [10 : 0] pR3_address0;
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 pR3_q0 DATA" *)
input wire [7 : 0] pR3_q0;
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 pR4_address0 DATA" *)
output wire [9 : 0] pR4_address0;
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 pR4_q0 DATA" *)
input wire [7 : 0] pR4_q0;
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 pR5_address0 DATA" *)
output wire [9 : 0] pR5_address0;
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 pR5_q0 DATA" *)
input wire [7 : 0] pR5_q0;
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 pR6_address0 DATA" *)
output wire [9 : 0] pR6_address0;
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 pR6_d0 DATA" *)
output wire [7 : 0] pR6_d0;
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 pR6_q0 DATA" *)
input wire [7 : 0] pR6_q0;
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 pR7_address0 DATA" *)
output wire [9 : 0] pR7_address0;
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 pR7_d0 DATA" *)
output wire [7 : 0] pR7_d0;
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 pR7_q0 DATA" *)
input wire [7 : 0] pR7_q0;
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 pR8_address0 DATA" *)
output wire [9 : 0] pR8_address0;
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 pR8_d0 DATA" *)
output wire [7 : 0] pR8_d0;
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 pR8_q0 DATA" *)
input wire [7 : 0] pR8_q0;
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 pR9_address0 DATA" *)
output wire [9 : 0] pR9_address0;
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 pR9_d0 DATA" *)
output wire [7 : 0] pR9_d0;
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 pR9_q0 DATA" *)
input wire [7 : 0] pR9_q0;
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 pR10_address0 DATA" *)
output wire [9 : 0] pR10_address0;
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 pR10_d0 DATA" *)
output wire [7 : 0] pR10_d0;
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 pR10_q0 DATA" *)
input wire [7 : 0] pR10_q0;
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 pbhat0_address0 DATA" *)
output wire [10 : 0] pbhat0_address0;
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 pbhat0_d0 DATA" *)
output wire [0 : 0] pbhat0_d0;
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 pbhat1_address0 DATA" *)
output wire [10 : 0] pbhat1_address0;
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 pbhat1_d0 DATA" *)
output wire [0 : 0] pbhat1_d0;
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 pbhat2_address0 DATA" *)
output wire [9 : 0] pbhat2_address0;
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 pbhat2_d0 DATA" *)
output wire [0 : 0] pbhat2_d0;
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 pbhat3_address0 DATA" *)
output wire [9 : 0] pbhat3_address0;
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 pbhat3_d0 DATA" *)
output wire [0 : 0] pbhat3_d0;
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 pbhat4_address0 DATA" *)
output wire [9 : 0] pbhat4_address0;
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 pbhat4_d0 DATA" *)
output wire [0 : 0] pbhat4_d0;
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 pbhat4_q0 DATA" *)
input wire [0 : 0] pbhat4_q0;
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 pbhat5_address0 DATA" *)
output wire [9 : 0] pbhat5_address0;
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 pbhat5_d0 DATA" *)
output wire [0 : 0] pbhat5_d0;
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 pbhat5_q0 DATA" *)
input wire [0 : 0] pbhat5_q0;
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 pbhat6_address0 DATA" *)
output wire [9 : 0] pbhat6_address0;
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 pbhat6_d0 DATA" *)
output wire [0 : 0] pbhat6_d0;
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 pbhat6_q0 DATA" *)
input wire [0 : 0] pbhat6_q0;
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 pbhat7_address0 DATA" *)
output wire [9 : 0] pbhat7_address0;
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 pbhat7_d0 DATA" *)
output wire [0 : 0] pbhat7_d0;
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 pbhat7_q0 DATA" *)
input wire [0 : 0] pbhat7_q0;
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 cnt DATA" *)
output wire [31 : 0] cnt;
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 nR_M DATA" *)
input wire [15 : 0] nR_M;
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 etaIndexM_M DATA" *)
input wire [15 : 0] etaIndexM_M;
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 pCodeM DATA" *)
input wire [15 : 0] pCodeM;
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 pMaxIterations DATA" *)
input wire [15 : 0] pMaxIterations;
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 itt_num DATA" *)
output wire [7 : 0] itt_num;
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 numbits DATA" *)
input wire [15 : 0] numbits;
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 mux DATA" *)
input wire [0 : 0] mux;
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 test_port DATA" *)
input wire [15 : 0] test_port;

  HLSLdpcLogDecScaledMin inst (
    .pR_ce0(pR_ce0),
    .pR1_ce0(pR1_ce0),
    .pR2_ce0(pR2_ce0),
    .pR3_ce0(pR3_ce0),
    .pR4_ce0(pR4_ce0),
    .pR5_ce0(pR5_ce0),
    .pR6_ce0(pR6_ce0),
    .pR6_we0(pR6_we0),
    .pR7_ce0(pR7_ce0),
    .pR7_we0(pR7_we0),
    .pR8_ce0(pR8_ce0),
    .pR8_we0(pR8_we0),
    .pR9_ce0(pR9_ce0),
    .pR9_we0(pR9_we0),
    .pR10_ce0(pR10_ce0),
    .pR10_we0(pR10_we0),
    .pbhat0_ce0(pbhat0_ce0),
    .pbhat0_we0(pbhat0_we0),
    .pbhat1_ce0(pbhat1_ce0),
    .pbhat1_we0(pbhat1_we0),
    .pbhat2_ce0(pbhat2_ce0),
    .pbhat2_we0(pbhat2_we0),
    .pbhat3_ce0(pbhat3_ce0),
    .pbhat3_we0(pbhat3_we0),
    .pbhat4_ce0(pbhat4_ce0),
    .pbhat4_we0(pbhat4_we0),
    .pbhat5_ce0(pbhat5_ce0),
    .pbhat5_we0(pbhat5_we0),
    .pbhat6_ce0(pbhat6_ce0),
    .pbhat6_we0(pbhat6_we0),
    .pbhat7_ce0(pbhat7_ce0),
    .pbhat7_we0(pbhat7_we0),
    .cnt_ap_vld(cnt_ap_vld),
    .itt_num_ap_vld(itt_num_ap_vld),
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(ap_start),
    .ap_done(ap_done),
    .ap_idle(ap_idle),
    .ap_ready(ap_ready),
    .pR_address0(pR_address0),
    .pR_q0(pR_q0),
    .pR1_address0(pR1_address0),
    .pR1_q0(pR1_q0),
    .pR2_address0(pR2_address0),
    .pR2_q0(pR2_q0),
    .pR3_address0(pR3_address0),
    .pR3_q0(pR3_q0),
    .pR4_address0(pR4_address0),
    .pR4_q0(pR4_q0),
    .pR5_address0(pR5_address0),
    .pR5_q0(pR5_q0),
    .pR6_address0(pR6_address0),
    .pR6_d0(pR6_d0),
    .pR6_q0(pR6_q0),
    .pR7_address0(pR7_address0),
    .pR7_d0(pR7_d0),
    .pR7_q0(pR7_q0),
    .pR8_address0(pR8_address0),
    .pR8_d0(pR8_d0),
    .pR8_q0(pR8_q0),
    .pR9_address0(pR9_address0),
    .pR9_d0(pR9_d0),
    .pR9_q0(pR9_q0),
    .pR10_address0(pR10_address0),
    .pR10_d0(pR10_d0),
    .pR10_q0(pR10_q0),
    .pbhat0_address0(pbhat0_address0),
    .pbhat0_d0(pbhat0_d0),
    .pbhat1_address0(pbhat1_address0),
    .pbhat1_d0(pbhat1_d0),
    .pbhat2_address0(pbhat2_address0),
    .pbhat2_d0(pbhat2_d0),
    .pbhat3_address0(pbhat3_address0),
    .pbhat3_d0(pbhat3_d0),
    .pbhat4_address0(pbhat4_address0),
    .pbhat4_d0(pbhat4_d0),
    .pbhat4_q0(pbhat4_q0),
    .pbhat5_address0(pbhat5_address0),
    .pbhat5_d0(pbhat5_d0),
    .pbhat5_q0(pbhat5_q0),
    .pbhat6_address0(pbhat6_address0),
    .pbhat6_d0(pbhat6_d0),
    .pbhat6_q0(pbhat6_q0),
    .pbhat7_address0(pbhat7_address0),
    .pbhat7_d0(pbhat7_d0),
    .pbhat7_q0(pbhat7_q0),
    .cnt(cnt),
    .nR_M(nR_M),
    .etaIndexM_M(etaIndexM_M),
    .pCodeM(pCodeM),
    .pMaxIterations(pMaxIterations),
    .itt_num(itt_num),
    .numbits(numbits),
    .mux(mux),
    .test_port(test_port)
  );
endmodule
