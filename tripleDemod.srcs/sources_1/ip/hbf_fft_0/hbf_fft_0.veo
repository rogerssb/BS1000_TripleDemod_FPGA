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

// IP VLNV: SEMCO:SysGen:hbf_fft:1.0
// IP Revision: 199734469

// The following must be inserted into your Verilog file for this
// core to be instantiated. Change the instance name and port connections
// (in parentheses) to your own signal names.

//----------- Begin Cut here for INSTANTIATION Template ---// INST_TAG
hbf_fft_0 your_instance_name (
  .datain(datain),                                          // input wire [13 : 0] datain
  .nfft(nfft),                                              // input wire [4 : 0] nfft
  .nfftwe(nfftwe),                                          // input wire [0 : 0] nfftwe
  .rstfifo(rstfifo),                                        // input wire [0 : 0] rstfifo
  .scalesch(scalesch),                                      // input wire [11 : 0] scalesch
  .spectinv(spectinv),                                      // input wire [0 : 0] spectinv
  .startn(startn),                                          // input wire [0 : 0] startn
  .window(window),                                          // input wire [15 : 0] window
  .clk(clk),                                                // input wire clk
  .fifofull_i(fifofull_i),                                  // output wire [0 : 0] fifofull_i
  .fifofull_q(fifofull_q),                                  // output wire [0 : 0] fifofull_q
  .idata(idata),                                            // output wire [18 : 0] idata
  .n(n),                                                    // output wire [12 : 0] n
  .qdata(qdata),                                            // output wire [15 : 0] qdata
  .fft_axis_tuser_xk_index_d(fft_axis_tuser_xk_index_d),    // output wire [11 : 0] fft_axis_tuser_xk_index_d
  .fft_mag_finished(fft_mag_finished),                      // output wire [0 : 0] fft_mag_finished
  .fft_mag_m_axis_data_tlast(fft_mag_m_axis_data_tlast),    // output wire [0 : 0] fft_mag_m_axis_data_tlast
  .fft_mag_m_axis_dout_tvalid(fft_mag_m_axis_dout_tvalid),  // output wire [0 : 0] fft_mag_m_axis_dout_tvalid
  .fft_mag_m_axis_tdata_real(fft_mag_m_axis_tdata_real),    // output wire [15 : 0] fft_mag_m_axis_tdata_real
  .index_k(index_k),                                        // output wire [12 : 0] index_k
  .ce2(ce2)                                                // output wire [0 : 0] ce2
);
// INST_TAG_END ------ End INSTANTIATION Template ---------

