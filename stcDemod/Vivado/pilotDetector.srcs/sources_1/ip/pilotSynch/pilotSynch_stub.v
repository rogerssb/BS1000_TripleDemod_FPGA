// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2016.3 (win64) Build 1682563 Mon Oct 10 19:07:27 MDT 2016
// Date        : Fri Dec 09 11:24:34 2016
// Host        : Sherlock running 64-bit Service Pack 1  (build 7601)
// Command     : write_verilog -force -mode synth_stub
//               c:/modem/telemetry/stcDemod/pilotDetector.srcs/sources_1/ip/pilotSynch/pilotSynch_stub.v
// Design      : pilotSynch
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7k160tfbg676-3
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "pilotsync,Vivado 2016.3" *)
module pilotSynch(imagsyncin, pilotindexin, pilotpulsein, 
  realsyncin, validsyncin, clk, imagout, offset, realout, startout, validout, pilot_index)
/* synthesis syn_black_box black_box_pad_pin="imagsyncin[17:0],pilotindexin[10:0],pilotpulsein[0:0],realsyncin[17:0],validsyncin[0:0],clk,imagout[17:0],offset[10:0],realout[17:0],startout[0:0],validout[0:0],pilot_index[10:0]" */;
  input [17:0]imagsyncin;
  input [10:0]pilotindexin;
  input [0:0]pilotpulsein;
  input [17:0]realsyncin;
  input [0:0]validsyncin;
  input clk;
  output [17:0]imagout;
  output [10:0]offset;
  output [17:0]realout;
  output [0:0]startout;
  output [0:0]validout;
  output [10:0]pilot_index;
endmodule
