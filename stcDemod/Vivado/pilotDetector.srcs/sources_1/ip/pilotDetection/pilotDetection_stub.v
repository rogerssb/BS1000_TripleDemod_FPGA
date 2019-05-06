// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2016.3 (win64) Build 1682563 Mon Oct 10 19:07:27 MDT 2016
// Date        : Fri Dec 09 11:50:35 2016
// Host        : Sherlock running 64-bit Service Pack 1  (build 7601)
// Command     : write_verilog -force -mode synth_stub
//               c:/modem/telemetry/stcDemod/pilotDetector.srcs/sources_1/ip/pilotDetection/pilotDetection_stub.v
// Design      : pilotDetection
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7k160tfbg676-3
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "pilotdetect,Vivado 2016.3" *)
module pilotDetection(imagdata, realdata, validpilot, conj_imag, clk, 
  pilot_mag, pilot_found, pilot_indexes, pilot_pulse, imagpilotout, realpilotout, 
  validpilotout)
/* synthesis syn_black_box black_box_pad_pin="imagdata[17:0],realdata[17:0],validpilot[0:0],conj_imag[0:0],clk,pilot_mag[17:0],pilot_found[0:0],pilot_indexes[8:0],pilot_pulse[0:0],imagpilotout[17:0],realpilotout[17:0],validpilotout[0:0]" */;
  input [17:0]imagdata;
  input [17:0]realdata;
  input [0:0]validpilot;
  input [0:0]conj_imag;
  input clk;
  output [17:0]pilot_mag;
  output [0:0]pilot_found;
  output [8:0]pilot_indexes;
  output [0:0]pilot_pulse;
  output [17:0]imagpilotout;
  output [17:0]realpilotout;
  output [0:0]validpilotout;
endmodule
