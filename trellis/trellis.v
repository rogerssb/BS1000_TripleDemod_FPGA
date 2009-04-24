//-----------------------------------------------------------------------------
// Project      SEMCO Multi-mode Demodulator
// Design       Viterbi Decoder Top
// Created      07 April 09
//-----------------------------------------------------------------------------
// 1.0      (VS)initial coding
//
//
//-----------------------------------------------------------------------------

`timescale 1ns/1ps

module trellis(
  clk,reset,symEn,sym2xEn,
  iIn,qIn,
  wr0,wr1,wr2,wr3,
  addr,
  din,dout
  );

input clk,reset,symEn,sym2xEn;
input [17:0]iIn,qIn;


input clk,reset,symEn,sym2xEn;
input [17:0]iIn,qIn;
input wr0,wr1,wr2,wr3;
input [11:0]addr;
input [31:0]din;
output [31:0]dout;

wire [17:0]carrierLoopIOut,carrierLoopQOut;
trellisCarrierLoop trellisCarrierLoop(
  .clk(clk),.reset(reset),.symEn(symEn),.sym2xEn(sym2xEn),
  .iIn(iIn),.qIn(qIn),
  .wr0(wr0),.wr1(wr1),.wr2(wr2),.wr3(wr3),
  .addr(addr),
  .din(din),.dout(dout),
  .iOut(carrierLoopIOut),.qOut(carrierLoopQOut)
  );

// there are two samples per symbol and their coefficients order below is
// 0 real, 0 imag, 1 real, 1 imag

wire [17:0]f0I,f0Q;
mfilter #(18'h1B48C,18'h10B85,18'h3D7D4,18'h1FE6B) f0(clk,reset,symEn,sym2xEn,carrierLoopIOut,carrierLoopQOut,f0I,f0Q);

wire [17:0]f1I,f1Q;
mfilter #(18'h1B48C,18'h2F47B,18'h3D7D4,18'h20195) f1(clk,reset,symEn,sym2xEn,carrierLoopIOut,carrierLoopQOut,f1I,f1Q);

wire [17:0]out0Pt1Real,out1Pt1Real,
  out0Pt2Real,out1Pt2Real,
  out0Pt3Real,out1Pt3Real,
  out0Pt4Real,out1Pt4Real,
  out0Pt5Real,out1Pt5Real,
  out0Pt6Real,out1Pt6Real,
  out0Pt7Real,out1Pt7Real,
  out0Pt8Real,out1Pt8Real,
  out0Pt9Real,out1Pt9Real,
  out0Pt10Real,out1Pt10Real,
  out0Pt11Real,out1Pt11Real,
  out0Pt12Real,out1Pt12Real,
  out0Pt13Real,out1Pt13Real,
  out0Pt14Real,out1Pt14Real,
  out0Pt15Real,out1Pt15Real,
  out0Pt16Real,out1Pt16Real,
  out0Pt17Real,out1Pt17Real,
  out0Pt18Real,out1Pt18Real,
  out0Pt19Real,out1Pt19Real,
  out0Pt20Real,out1Pt20Real;

rotator rotator(
  clk,reset,symEn,f0I,f0Q,f1I,f1Q,
  out0Pt1Real,,//out0Pt1Imag,
  out1Pt1Real,,//out1Pt1Imag,
  out0Pt2Real,,//out0Pt2Imag,
  out1Pt2Real,,//out1Pt2Imag,
  out0Pt3Real,,//out0Pt3Imag,
  out1Pt3Real,,//out1Pt3Imag,
  out0Pt4Real,,//out0Pt4Imag,
  out1Pt4Real,,//out1Pt4Imag,
  out0Pt5Real,,//out0Pt5Imag,
  out1Pt5Real,,//out1Pt5Imag,
  out0Pt6Real,,//out0Pt6Imag,
  out1Pt6Real,,//out1Pt6Imag,
  out0Pt7Real,,//out0Pt7Imag,
  out1Pt7Real,,//out1Pt7Imag,
  out0Pt8Real,,//out0Pt8Imag,
  out1Pt8Real,,//out1Pt8Imag,
  out0Pt9Real,,//out0Pt9Imag,
  out1Pt9Real,,//out1Pt9Imag,
  out0Pt10Real,,//out0Pt10Imag,
  out1Pt10Real,,//out1Pt10Imag,
  out0Pt11Real,,//out0Pt11Imag,
  out1Pt11Real,,//out1Pt11Imag,
  out0Pt12Real,,//out0Pt12Imag,
  out1Pt12Real,,//out1Pt12Imag,
  out0Pt13Real,,//out0Pt13Imag,
  out1Pt13Real,,//out1Pt13Imag,
  out0Pt14Real,,//out0Pt14Imag,
  out1Pt14Real,,//out1Pt14Imag,
  out0Pt15Real,,//out0Pt15Imag,
  out1Pt15Real,,//out1Pt15Imag,
  out0Pt16Real,,//out0Pt16Imag,
  out1Pt16Real,,//out1Pt16Imag,
  out0Pt17Real,,//out0Pt17Imag,
  out1Pt17Real,,//out1Pt17Imag,
  out0Pt18Real,,//out0Pt18Imag,
  out1Pt18Real,,//out1Pt18Imag,
  out0Pt19Real,,//out0Pt19Imag,
  out1Pt19Real,,//out1Pt19Imag,
  out0Pt20Real,,//out0Pt20Imag,
  out1Pt20Real,//,out1Pt20Imag
  );

endmodule