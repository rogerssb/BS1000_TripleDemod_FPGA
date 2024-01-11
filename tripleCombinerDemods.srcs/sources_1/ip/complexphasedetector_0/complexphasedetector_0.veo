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

// IP VLNV: Semco:SysGen:complexphasedetector:1.1
// IP Revision: 333805135

// The following must be inserted into your Verilog file for this
// core to be instantiated. Change the instance name and port connections
// (in parentheses) to your own signal names.

//----------- Begin Cut here for INSTANTIATION Template ---// INST_TAG
complexphasedetector_0 your_instance_name (
  .ch1agc(ch1agc),                        // input wire [12 : 0] ch1agc
  .ch1imag(ch1imag),                      // input wire [17 : 0] ch1imag
  .ch1real(ch1real),                      // input wire [17 : 0] ch1real
  .ch2agc(ch2agc),                        // input wire [12 : 0] ch2agc
  .ch2imag(ch2imag),                      // input wire [17 : 0] ch2imag
  .ch2real(ch2real),                      // input wire [17 : 0] ch2real
  .enmasterswitching(enmasterswitching),  // input wire enmasterswitching
  .forcech1(forcech1),                    // input wire forcech1
  .lag_coef(lag_coef),                    // input wire [17 : 0] lag_coef
  .lead_coef(lead_coef),                  // input wire [17 : 0] lead_coef
  .lockhysterisis(lockhysterisis),        // input wire [12 : 0] lockhysterisis
  .lockthreshold(lockthreshold),          // input wire [12 : 0] lockthreshold
  .overridech(overridech),                // input wire overridech
  .reset(reset),                          // input wire reset
  .sweeplmt(sweeplmt),                    // input wire [14 : 0] sweeplmt
  .swprate(swprate),                      // input wire [17 : 0] swprate
  .db_range(db_range),                    // input wire [15 : 0] db_range
  .clk(clk),                              // input wire clk
  .ch1ismaster(ch1ismaster),              // output wire ch1ismaster
  .gainoutmax(gainoutmax),                // output wire [17 : 0] gainoutmax
  .gainoutmin(gainoutmin),                // output wire [17 : 0] gainoutmin
  .imaglock(imaglock),                    // output wire [12 : 0] imaglock
  .imagout(imagout),                      // output wire [17 : 0] imagout
  .imagxord(imagxord),                    // output wire imagxord
  .lag_out(lag_out),                      // output wire [31 : 0] lag_out
  .locked(locked),                        // output wire locked
  .maximagout(maximagout),                // output wire [17 : 0] maximagout
  .maxrealout(maxrealout),                // output wire [17 : 0] maxrealout
  .minimagout(minimagout),                // output wire [17 : 0] minimagout
  .minrealout(minrealout),                // output wire [17 : 0] minrealout
  .nco_control_out(nco_control_out),      // output wire [21 : 0] nco_control_out
  .phase_detect(phase_detect),            // output wire [17 : 0] phase_detect
  .power(power),                          // output wire [17 : 0] power
  .reallock(reallock),                    // output wire [12 : 0] reallock
  .realout(realout),                      // output wire [17 : 0] realout
  .realxord(realxord)                    // output wire realxord
);
// INST_TAG_END ------ End INSTANTIATION Template ---------

