//-----------------------------------------------------------------------------
// Project      SEMCO Multi-mode Demodulator
// Design       PCMFM 20 point 0/1 input multiplexed rotator
// Created      10 April 09
//-----------------------------------------------------------------------------
// 1.0      (VS)Initial coding
//
//
//-----------------------------------------------------------------------------

`timescale 1ns/1ps

module rotator(
  clk,reset,ena,iIn0,qIn0,iIn1,qIn1,
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

input clk,reset,ena;
parameter ROT_BITS = 0;
input [(ROT_BITS-1):0]iIn0,qIn0,iIn1,qIn1;
output [(ROT_BITS-1):0]
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

parameter pt1Real = 10'h1FF,  pt1Imag = 10'h000,
          pt2Real = 10'h1E6,  pt2Imag = 10'h362,
          pt3Real = 10'h19D,  pt3Imag = 10'h2D4,
          pt4Real = 10'h12C,  pt4Imag = 10'h263,
          pt5Real = 10'h09E,  pt5Imag = 10'h21A,
          pt6Real = 10'h000,  pt6Imag = 10'h201,
          pt7Real = 10'h362,  pt7Imag = 10'h21A,
          pt8Real = 10'h2D4,  pt8Imag = 10'h263,
          pt9Real = 10'h263,  pt9Imag = 10'h2D4,
         pt10Real = 10'h21A, pt10Imag = 10'h362,
         pt11Real = 10'h201, pt11Imag = 10'h000,
         pt12Real = 10'h21A, pt12Imag = 10'h09E,
         pt13Real = 10'h263, pt13Imag = 10'h12C,
         pt14Real = 10'h2D4, pt14Imag = 10'h19D,
         pt15Real = 10'h362, pt15Imag = 10'h1E6,
         pt16Real = 10'h000, pt16Imag = 10'h1FF,
         pt17Real = 10'h09E, pt17Imag = 10'h1E6,
         pt18Real = 10'h12C, pt18Imag = 10'h19D,
         pt19Real = 10'h19D, pt19Imag = 10'h12C,
         pt20Real = 10'h1E6, pt20Imag = 10'h09E;

reg [(ROT_BITS-1):0]iInBuf0,iInBuf1,qInBuf0,qInBuf1;
always @(posedge clk)begin
  if(ena)begin
    iInBuf0 <= iIn0;
    iInBuf1 <= iIn1;
    qInBuf0 <= qIn0;
    qInBuf1 <= qIn1;
    end
  end

reg enaDelay;
always @(posedge clk)begin
  enaDelay <= ena;
  end

wire [(ROT_BITS-1):0]iInSel = enaDelay ? iInBuf0 : iInBuf1;
wire [(ROT_BITS-1):0]qInSel = enaDelay ? qInBuf0 : qInBuf1;

rotMult m1
  (
  .clk(clk),
  .ena(ena),
  .a(iInSel),
  .b(qInSel),
  .c(pt1Real),
  .d(pt1Imag),
  .reOut0(out0Pt1Real),
  .imOut0(out0Pt1Imag),
  .reOut1(out1Pt1Real),
  .imOut1(out1Pt1Imag)
  );

rotMult m2
  (
  .clk(clk),
  .ena(ena),
  .a(iInSel),
  .b(qInSel),
  .c(pt2Real),
  .d(pt2Imag),
  .reOut0(out0Pt2Real),
  .imOut0(out0Pt2Imag),
  .reOut1(out1Pt2Real),
  .imOut1(out1Pt2Imag)
  );

rotMult m3
  (
  .clk(clk),
  .ena(ena),
  .a(iInSel),
  .b(qInSel),
  .c(pt3Real),
  .d(pt3Imag),
  .reOut0(out0Pt3Real),
  .imOut0(out0Pt3Imag),
  .reOut1(out1Pt3Real),
  .imOut1(out1Pt3Imag)
  );

rotMult m4
  (
  .clk(clk),
  .ena(ena),
  .a(iInSel),
  .b(qInSel),
  .c(pt4Real),
  .d(pt4Imag),
  .reOut0(out0Pt4Real),
  .imOut0(out0Pt4Imag),
  .reOut1(out1Pt4Real),
  .imOut1(out1Pt4Imag)
  );

rotMult m5
  (
  .clk(clk),
  .ena(ena),
  .a(iInSel),
  .b(qInSel),
  .c(pt5Real),
  .d(pt5Imag),
  .reOut0(out0Pt5Real),
  .imOut0(out0Pt5Imag),
  .reOut1(out1Pt5Real),
  .imOut1(out1Pt5Imag)
  );

rotMult m6
  (
  .clk(clk),
  .ena(ena),
  .a(iInSel),
  .b(qInSel),
  .c(pt6Real),
  .d(pt6Imag),
  .reOut0(out0Pt6Real),
  .imOut0(out0Pt6Imag),
  .reOut1(out1Pt6Real),
  .imOut1(out1Pt6Imag)
  );

rotMult m7
  (
  .clk(clk),
  .ena(ena),
  .a(iInSel),
  .b(qInSel),
  .c(pt7Real),
  .d(pt7Imag),
  .reOut0(out0Pt7Real),
  .imOut0(out0Pt7Imag),
  .reOut1(out1Pt7Real),
  .imOut1(out1Pt7Imag)
  );

rotMult m8
  (
  .clk(clk),
  .ena(ena),
  .a(iInSel),
  .b(qInSel),
  .c(pt8Real),
  .d(pt8Imag),
  .reOut0(out0Pt8Real),
  .imOut0(out0Pt8Imag),
  .reOut1(out1Pt8Real),
  .imOut1(out1Pt8Imag)
  );

rotMult m9
  (
  .clk(clk),
  .ena(ena),
  .a(iInSel),
  .b(qInSel),
  .c(pt9Real),
  .d(pt9Imag),
  .reOut0(out0Pt9Real),
  .imOut0(out0Pt9Imag),
  .reOut1(out1Pt9Real),
  .imOut1(out1Pt9Imag)
  );

rotMult m10
  (
  .clk(clk),
  .ena(ena),
  .a(iInSel),
  .b(qInSel),
  .c(pt10Real),
  .d(pt10Imag),
  .reOut0(out0Pt10Real),
  .imOut0(out0Pt10Imag),
  .reOut1(out1Pt10Real),
  .imOut1(out1Pt10Imag)
  );

`define USE_SYMMETRY
`ifdef USE_SYMMETRY
assign out0Pt11Real = -out0Pt1Real;
assign out0Pt11Imag = -out0Pt1Imag;
assign out1Pt11Real = -out1Pt1Real;
assign out1Pt11Imag = -out1Pt1Imag;
assign out0Pt12Real = -out0Pt2Real;
assign out0Pt12Imag = -out0Pt2Imag;
assign out1Pt12Real = -out1Pt2Real;
assign out1Pt12Imag = -out1Pt2Imag;
assign out0Pt13Real = -out0Pt3Real;
assign out0Pt13Imag = -out0Pt3Imag;
assign out1Pt13Real = -out1Pt3Real;
assign out1Pt13Imag = -out1Pt3Imag;
assign out0Pt14Real = -out0Pt4Real;
assign out0Pt14Imag = -out0Pt4Imag;
assign out1Pt14Real = -out1Pt4Real;
assign out1Pt14Imag = -out1Pt4Imag;
assign out0Pt15Real = -out0Pt5Real;
assign out0Pt15Imag = -out0Pt5Imag;
assign out1Pt15Real = -out1Pt5Real;
assign out1Pt15Imag = -out1Pt5Imag;
assign out0Pt16Real = -out0Pt6Real;
assign out0Pt16Imag = -out0Pt6Imag;
assign out1Pt16Real = -out1Pt6Real;
assign out1Pt16Imag = -out1Pt6Imag;
assign out0Pt17Real = -out0Pt7Real;
assign out0Pt17Imag = -out0Pt7Imag;
assign out1Pt17Real = -out1Pt7Real;
assign out1Pt17Imag = -out1Pt7Imag;
assign out0Pt18Real = -out0Pt8Real;
assign out0Pt18Imag = -out0Pt8Imag;
assign out1Pt18Real = -out1Pt8Real;
assign out1Pt18Imag = -out1Pt8Imag;
assign out0Pt19Real = -out0Pt9Real;
assign out0Pt19Imag = -out0Pt9Imag;
assign out1Pt19Real = -out1Pt9Real;
assign out1Pt19Imag = -out1Pt9Imag;
assign out0Pt20Real = -out0Pt10Real;
assign out0Pt20Imag = -out0Pt10Imag;
assign out1Pt20Real = -out1Pt10Real;
assign out1Pt20Imag = -out1Pt10Imag;
`else
rotMult m11
  (
  .clk(clk),
  .ena(ena),
  .a(iInSel),
  .b(qInSel),
  .c(pt11Real),
  .d(pt11Imag),
  .reOut0(out0Pt11Real),
  .imOut0(out0Pt11Imag),
  .reOut1(out1Pt11Real),
  .imOut1(out1Pt11Imag)
  );

rotMult m12
  (
  .clk(clk),
  .ena(ena),
  .a(iInSel),
  .b(qInSel),
  .c(pt12Real),
  .d(pt12Imag),
  .reOut0(out0Pt12Real),
  .imOut0(out0Pt12Imag),
  .reOut1(out1Pt12Real),
  .imOut1(out1Pt12Imag)
  );

rotMult m13
  (
  .clk(clk),
  .ena(ena),
  .a(iInSel),
  .b(qInSel),
  .c(pt13Real),
  .d(pt13Imag),
  .reOut0(out0Pt13Real),
  .imOut0(out0Pt13Imag),
  .reOut1(out1Pt13Real),
  .imOut1(out1Pt13Imag)
  );

rotMult m14
  (
  .clk(clk),
  .ena(ena),
  .a(iInSel),
  .b(qInSel),
  .c(pt14Real),
  .d(pt14Imag),
  .reOut0(out0Pt14Real),
  .imOut0(out0Pt14Imag),
  .reOut1(out1Pt14Real),
  .imOut1(out1Pt14Imag)
  );

rotMult m15
  (
  .clk(clk),
  .ena(ena),
  .a(iInSel),
  .b(qInSel),
  .c(pt15Real),
  .d(pt15Imag),
  .reOut0(out0Pt15Real),
  .imOut0(out0Pt15Imag),
  .reOut1(out1Pt15Real),
  .imOut1(out1Pt15Imag)
  );

rotMult m16
  (
  .clk(clk),
  .ena(ena),
  .a(iInSel),
  .b(qInSel),
  .c(pt16Real),
  .d(pt16Imag),
  .reOut0(out0Pt16Real),
  .imOut0(out0Pt16Imag),
  .reOut1(out1Pt16Real),
  .imOut1(out1Pt16Imag)
  );

rotMult m17
  (
  .clk(clk),
  .ena(ena),
  .a(iInSel),
  .b(qInSel),
  .c(pt17Real),
  .d(pt17Imag),
  .reOut0(out0Pt17Real),
  .imOut0(out0Pt17Imag),
  .reOut1(out1Pt17Real),
  .imOut1(out1Pt17Imag)
  );

rotMult m18
  (
  .clk(clk),
  .ena(ena),
  .a(iInSel),
  .b(qInSel),
  .c(pt18Real),
  .d(pt18Imag),
  .reOut0(out0Pt18Real),
  .imOut0(out0Pt18Imag),
  .reOut1(out1Pt18Real),
  .imOut1(out1Pt18Imag)
  );

rotMult m19
  (
  .clk(clk),
  .ena(ena),
  .a(iInSel),
  .b(qInSel),
  .c(pt19Real),
  .d(pt19Imag),
  .reOut0(out0Pt19Real),
  .imOut0(out0Pt19Imag),
  .reOut1(out1Pt19Real),
  .imOut1(out1Pt19Imag)
  );

rotMult m20
  (
  .clk(clk),
  .ena(ena),
  .a(iInSel),
  .b(qInSel),
  .c(pt20Real),
  .d(pt20Imag),
  .reOut0(out0Pt20Real),
  .imOut0(out0Pt20Imag),
  .reOut1(out1Pt20Real),
  .imOut1(out1Pt20Imag)
  );
`endif

endmodule