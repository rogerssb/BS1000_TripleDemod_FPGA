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


// IP VLNV: xilinx.com:hls:setupLDPC:1.0
// IP Revision: 1903141453

(* X_CORE_INFO = "setupLDPC,Vivado 2016.3" *)
(* CHECK_LICENSE_TYPE = "design_2_setupLDPC_0_0,setupLDPC,{}" *)
(* CORE_GENERATION_INFO = "design_2_setupLDPC_0_0,setupLDPC,{x_ipProduct=Vivado 2016.3,x_ipVendor=xilinx.com,x_ipLibrary=hls,x_ipName=setupLDPC,x_ipVersion=1.0,x_ipCoreRevision=1903141453,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED}" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)
module design_2_setupLDPC_0_0 (
  nR_M_V_ap_vld,
  etaIndexM_M_V_ap_vld,
  pCodeM_V_ap_vld,
  pMaxIterations_V_ap_vld,
  numbits_V_ap_vld,
  split_V_ap_vld,
  ap_start,
  ap_done,
  ap_idle,
  ap_ready,
  size_V,
  rate_V,
  nR_M_V,
  etaIndexM_M_V,
  pCodeM_V,
  pMaxIterations_V,
  numbits_V,
  split_V
);

output wire nR_M_V_ap_vld;
output wire etaIndexM_M_V_ap_vld;
output wire pCodeM_V_ap_vld;
output wire pMaxIterations_V_ap_vld;
output wire numbits_V_ap_vld;
output wire split_V_ap_vld;
(* X_INTERFACE_INFO = "xilinx.com:interface:acc_handshake:1.0 ap_ctrl start" *)
input wire ap_start;
(* X_INTERFACE_INFO = "xilinx.com:interface:acc_handshake:1.0 ap_ctrl done" *)
output wire ap_done;
(* X_INTERFACE_INFO = "xilinx.com:interface:acc_handshake:1.0 ap_ctrl idle" *)
output wire ap_idle;
(* X_INTERFACE_INFO = "xilinx.com:interface:acc_handshake:1.0 ap_ctrl ready" *)
output wire ap_ready;
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 size_V DATA" *)
input wire [1 : 0] size_V;
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 rate_V DATA" *)
input wire [1 : 0] rate_V;
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 nR_M_V DATA" *)
output wire [15 : 0] nR_M_V;
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 etaIndexM_M_V DATA" *)
output wire [15 : 0] etaIndexM_M_V;
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 pCodeM_V DATA" *)
output wire [15 : 0] pCodeM_V;
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 pMaxIterations_V DATA" *)
output wire [15 : 0] pMaxIterations_V;
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 numbits_V DATA" *)
output wire [15 : 0] numbits_V;
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 split_V DATA" *)
output wire [15 : 0] split_V;

  setupLDPC inst (
    .nR_M_V_ap_vld(nR_M_V_ap_vld),
    .etaIndexM_M_V_ap_vld(etaIndexM_M_V_ap_vld),
    .pCodeM_V_ap_vld(pCodeM_V_ap_vld),
    .pMaxIterations_V_ap_vld(pMaxIterations_V_ap_vld),
    .numbits_V_ap_vld(numbits_V_ap_vld),
    .split_V_ap_vld(split_V_ap_vld),
    .ap_start(ap_start),
    .ap_done(ap_done),
    .ap_idle(ap_idle),
    .ap_ready(ap_ready),
    .size_V(size_V),
    .rate_V(rate_V),
    .nR_M_V(nR_M_V),
    .etaIndexM_M_V(etaIndexM_M_V),
    .pCodeM_V(pCodeM_V),
    .pMaxIterations_V(pMaxIterations_V),
    .numbits_V(numbits_V),
    .split_V(split_V)
  );
endmodule
