// (c) Copyright 1995-2021 Xilinx, Inc. All rights reserved.
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


// IP VLNV: SEMCO:SysGen:hbf_fft:1.0
// IP Revision: 242072367

(* X_CORE_INFO = "hbf_fft,Vivado 2017.2.1" *)
(* CHECK_LICENSE_TYPE = "hbf_fft_0,hbf_fft,{}" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)
module hbf_fft_0 (
  datain,
  nfft,
  nfftwe,
  rstfifo,
  scalesch,
  spectinv,
  startn,
  window,
  clk,
  ce2,
  fifofull_i,
  fifofull_q,
  idata,
  n,
  qdata,
  fft_axis_tuser_xk_index_d,
  fft_mag_finished,
  fft_mag_m_axis_data_tlast,
  fft_mag_m_axis_dout_tvalid,
  fft_mag_m_axis_tdata_real,
  index_k
);

(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 datain DATA" *)
input wire [13 : 0] datain;
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 nfft DATA" *)
input wire [4 : 0] nfft;
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 nfftwe DATA" *)
input wire [0 : 0] nfftwe;
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 rstfifo DATA" *)
input wire [0 : 0] rstfifo;
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 scalesch DATA" *)
input wire [11 : 0] scalesch;
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 spectinv DATA" *)
input wire [0 : 0] spectinv;
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 startn DATA" *)
input wire [0 : 0] startn;
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 window DATA" *)
input wire [15 : 0] window;
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 clk CLK" *)
input wire clk;
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 ce2 DATA" *)
output wire [0 : 0] ce2;
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 fifofull_i DATA" *)
output wire [0 : 0] fifofull_i;
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 fifofull_q DATA" *)
output wire [0 : 0] fifofull_q;
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 idata DATA" *)
output wire [18 : 0] idata;
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 n DATA" *)
output wire [12 : 0] n;
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 qdata DATA" *)
output wire [15 : 0] qdata;
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 fft_axis_tuser_xk_index_d DATA" *)
output wire [11 : 0] fft_axis_tuser_xk_index_d;
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 fft_mag_finished DATA" *)
output wire [0 : 0] fft_mag_finished;
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 fft_mag_m_axis_data_tlast DATA" *)
output wire [0 : 0] fft_mag_m_axis_data_tlast;
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 fft_mag_m_axis_dout_tvalid DATA" *)
output wire [0 : 0] fft_mag_m_axis_dout_tvalid;
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 fft_mag_m_axis_tdata_real DATA" *)
output wire [15 : 0] fft_mag_m_axis_tdata_real;
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 index_k DATA" *)
output wire [12 : 0] index_k;

  hbf_fft inst (
    .datain(datain),
    .nfft(nfft),
    .nfftwe(nfftwe),
    .rstfifo(rstfifo),
    .scalesch(scalesch),
    .spectinv(spectinv),
    .startn(startn),
    .window(window),
    .clk(clk),
    .ce2(ce2),
    .fifofull_i(fifofull_i),
    .fifofull_q(fifofull_q),
    .idata(idata),
    .n(n),
    .qdata(qdata),
    .fft_axis_tuser_xk_index_d(fft_axis_tuser_xk_index_d),
    .fft_mag_finished(fft_mag_finished),
    .fft_mag_m_axis_data_tlast(fft_mag_m_axis_data_tlast),
    .fft_mag_m_axis_dout_tvalid(fft_mag_m_axis_dout_tvalid),
    .fft_mag_m_axis_tdata_real(fft_mag_m_axis_tdata_real),
    .index_k(index_k)
  );
endmodule
