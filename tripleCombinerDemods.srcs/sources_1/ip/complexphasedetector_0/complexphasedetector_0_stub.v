// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2016.4 (win64) Build 1756540 Mon Jan 23 19:11:23 MST 2017
// Date        : Mon Dec 18 13:17:52 2023
// Host        : SEMCO_1039B running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               C:/Semco/Vivado/Demods2022/tripleCombinerDemods.srcs/sources_1/ip/complexphasedetector_0/complexphasedetector_0_stub.v
// Design      : complexphasedetector_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7k325tfbg676-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "complexphasedetector,Vivado 2016.4" *)
module complexphasedetector_0(ch1agc, ch1imag, ch1real, ch2agc, ch2imag, ch2real, 
  enmasterswitching, forcech1, lag_coef, lead_coef, lockhysterisis, lockthreshold, overridech, 
  reset, sweeplmt, swprate, db_range, clk, ch1ismaster, gainoutmax, gainoutmin, imaglock, imagout, 
  imagxord, lag_out, locked, maximagout, maxrealout, minimagout, minrealout, nco_control_out, 
  phase_detect, power, reallock, realout, realxord)
/* synthesis syn_black_box black_box_pad_pin="ch1agc[12:0],ch1imag[17:0],ch1real[17:0],ch2agc[12:0],ch2imag[17:0],ch2real[17:0],enmasterswitching,forcech1,lag_coef[17:0],lead_coef[17:0],lockhysterisis[12:0],lockthreshold[12:0],overridech,reset,sweeplmt[14:0],swprate[17:0],db_range[15:0],clk,ch1ismaster,gainoutmax[17:0],gainoutmin[17:0],imaglock[12:0],imagout[17:0],imagxord,lag_out[31:0],locked,maximagout[17:0],maxrealout[17:0],minimagout[17:0],minrealout[17:0],nco_control_out[21:0],phase_detect[17:0],power[17:0],reallock[12:0],realout[17:0],realxord" */;
  input [12:0]ch1agc;
  input [17:0]ch1imag;
  input [17:0]ch1real;
  input [12:0]ch2agc;
  input [17:0]ch2imag;
  input [17:0]ch2real;
  input enmasterswitching;
  input forcech1;
  input [17:0]lag_coef;
  input [17:0]lead_coef;
  input [12:0]lockhysterisis;
  input [12:0]lockthreshold;
  input overridech;
  input reset;
  input [14:0]sweeplmt;
  input [17:0]swprate;
  input [15:0]db_range;
  input clk;
  output ch1ismaster;
  output [17:0]gainoutmax;
  output [17:0]gainoutmin;
  output [12:0]imaglock;
  output [17:0]imagout;
  output imagxord;
  output [31:0]lag_out;
  output locked;
  output [17:0]maximagout;
  output [17:0]maxrealout;
  output [17:0]minimagout;
  output [17:0]minrealout;
  output [21:0]nco_control_out;
  output [17:0]phase_detect;
  output [17:0]power;
  output [12:0]reallock;
  output [17:0]realout;
  output realxord;
endmodule
