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

module top(clk,reset,symEn,sym2xEn,I,Q);

input clk,reset,symEn,sym2xEn;
input [17:0]I,Q;

// there are two samples per symbol and their coefficients order below is
// 0 real, 0 imag, 1 real, 1 imag
wire [17:0]f0I,f0Q;
filter #(18'h1B48C,18'h10B85,18'h3D7D4,18'h1FE6B) f0(clk,reset,symEn,sym2xEn,I,Q,f0I,f0Q);

wire [17:0]f1I,f1Q;
filter #(18'h1B48C,18'h2F47B,18'h3D7D4,18'h20195) f1(clk,reset,symEn,sym2xEn,I,Q,f1I,f1Q);


wire [17:0]
  out0Pt1Real,out0Pt1Imag,out1Pt1Real,out1Pt1Imag,
  out0Pt2Real,out0Pt2Imag,out1Pt2Real,out1Pt2Imag,
  out0Pt3Real,out0Pt3Imag,out1Pt3Real,out1Pt3Imag,
  out0Pt4Real,out0Pt4Imag,out1Pt4Real,out1Pt4Imag,
  out0Pt5Real,out0Pt5Imag,out1Pt5Real,out1Pt5Imag,
  out0Pt6Real,out0Pt6Imag,out1Pt6Real,out1Pt6Imag,
  out0Pt7Real,out0Pt7Imag,out1Pt7Real,out1Pt7Imag,
  out0Pt8Real,out0Pt8Imag,out1Pt8Real,out1Pt8Imag,
  out0Pt9Real,out0Pt9Imag,out1Pt9Real,out1Pt9Imag,
  out0Pt10Real,out0Pt10Imag,out1Pt10Real,out1Pt10Imag,
  out0Pt11Real,out0Pt11Imag,out1Pt11Real,out1Pt11Imag,
  out0Pt12Real,out0Pt12Imag,out1Pt12Real,out1Pt12Imag,
  out0Pt13Real,out0Pt13Imag,out1Pt13Real,out1Pt13Imag,
  out0Pt14Real,out0Pt14Imag,out1Pt14Real,out1Pt14Imag,
  out0Pt15Real,out0Pt15Imag,out1Pt15Real,out1Pt15Imag,
  out0Pt16Real,out0Pt16Imag,out1Pt16Real,out1Pt16Imag,
  out0Pt17Real,out0Pt17Imag,out1Pt17Real,out1Pt17Imag,
  out0Pt18Real,out0Pt18Imag,out1Pt18Real,out1Pt18Imag,
  out0Pt19Real,out0Pt19Imag,out1Pt19Real,out1Pt19Imag,
  out0Pt20Real,out0Pt20Imag,out1Pt20Real,out1Pt20Imag;

rotator rotator(
  clk,reset,symEn,f0I,f0Q,f1I,f1Q,
  out0Pt1Real,out0Pt1Imag,out1Pt1Real,out1Pt1Imag,
  out0Pt2Real,out0Pt2Imag,out1Pt2Real,out1Pt2Imag,
  out0Pt3Real,out0Pt3Imag,out1Pt3Real,out1Pt3Imag,
  out0Pt4Real,out0Pt4Imag,out1Pt4Real,out1Pt4Imag,
  out0Pt5Real,out0Pt5Imag,out1Pt5Real,out1Pt5Imag,
  out0Pt6Real,out0Pt6Imag,out1Pt6Real,out1Pt6Imag,
  out0Pt7Real,out0Pt7Imag,out1Pt7Real,out1Pt7Imag,
  out0Pt8Real,out0Pt8Imag,out1Pt8Real,out1Pt8Imag,
  out0Pt9Real,out0Pt9Imag,out1Pt9Real,out1Pt9Imag,
  out0Pt10Real,out0Pt10Imag,out1Pt10Real,out1Pt10Imag,
  out0Pt11Real,out0Pt11Imag,out1Pt11Real,out1Pt11Imag,
  out0Pt12Real,out0Pt12Imag,out1Pt12Real,out1Pt12Imag,
  out0Pt13Real,out0Pt13Imag,out1Pt13Real,out1Pt13Imag,
  out0Pt14Real,out0Pt14Imag,out1Pt14Real,out1Pt14Imag,
  out0Pt15Real,out0Pt15Imag,out1Pt15Real,out1Pt15Imag,
  out0Pt16Real,out0Pt16Imag,out1Pt16Real,out1Pt16Imag,
  out0Pt17Real,out0Pt17Imag,out1Pt17Real,out1Pt17Imag,
  out0Pt18Real,out0Pt18Imag,out1Pt18Real,out1Pt18Imag,
  out0Pt19Real,out0Pt19Imag,out1Pt19Real,out1Pt19Imag,
  out0Pt20Real,out0Pt20Imag,out1Pt20Real,out1Pt20Imag);

`ifdef SIMULATE
always @(posedge clk)begin
  if(symEn)begin
    $display("MF (%h,%h) (%h,%h)",f0I,f0Q,f1I,f1Q);
    $display("1  (%h,%h) (%h,%h)",out0Pt1Real,out0Pt1Imag,out1Pt1Real,out1Pt1Imag);
    $display("2  (%h,%h) (%h,%h)",out0Pt2Real,out0Pt2Imag,out1Pt2Real,out1Pt2Imag);
    $display("3  (%h,%h) (%h,%h)",out0Pt3Real,out0Pt3Imag,out1Pt3Real,out1Pt3Imag);
    $display("4  (%h,%h) (%h,%h)",out0Pt4Real,out0Pt4Imag,out1Pt4Real,out1Pt4Imag);
    $display("5  (%h,%h) (%h,%h)",out0Pt5Real,out0Pt5Imag,out1Pt5Real,out1Pt5Imag);
    $display("6  (%h,%h) (%h,%h)",out0Pt6Real,out0Pt6Imag,out1Pt6Real,out1Pt6Imag);
    $display("7  (%h,%h) (%h,%h)",out0Pt7Real,out0Pt7Imag,out1Pt7Real,out1Pt7Imag);
    $display("8  (%h,%h) (%h,%h)",out0Pt8Real,out0Pt8Imag,out1Pt8Real,out1Pt8Imag);
    $display("9  (%h,%h) (%h,%h)",out0Pt9Real,out0Pt9Imag,out1Pt9Real,out1Pt9Imag);
    $display("10 (%h,%h) (%h,%h)",out0Pt10Real,out0Pt10Imag,out1Pt10Real,out1Pt10Imag);
    $display("11 (%h,%h) (%h,%h)",out0Pt11Real,out0Pt11Imag,out1Pt11Real,out1Pt11Imag);
    $display("12 (%h,%h) (%h,%h)",out0Pt12Real,out0Pt12Imag,out1Pt12Real,out1Pt12Imag);
    $display("13 (%h,%h) (%h,%h)",out0Pt13Real,out0Pt13Imag,out1Pt13Real,out1Pt13Imag);
    $display("14 (%h,%h) (%h,%h)",out0Pt14Real,out0Pt14Imag,out1Pt14Real,out1Pt14Imag);
    $display("15 (%h,%h) (%h,%h)",out0Pt15Real,out0Pt15Imag,out1Pt15Real,out1Pt15Imag);
    $display("16 (%h,%h) (%h,%h)",out0Pt16Real,out0Pt16Imag,out1Pt16Real,out1Pt16Imag);
    $display("17 (%h,%h) (%h,%h)",out0Pt17Real,out0Pt17Imag,out1Pt17Real,out1Pt17Imag);
    $display("18 (%h,%h) (%h,%h)",out0Pt18Real,out0Pt18Imag,out1Pt18Real,out1Pt18Imag);
    $display("19 (%h,%h) (%h,%h)",out0Pt19Real,out0Pt19Imag,out1Pt19Real,out1Pt19Imag);
    $display("20 (%h,%h) (%h,%h)\n",out0Pt20Real,out0Pt20Imag,out1Pt20Real,out1Pt20Imag);
    end
  end
`endif

endmodule