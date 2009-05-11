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
  clk,reset,symEn,iIn0,qIn0,iIn1,qIn1,
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

input clk,reset,symEn;
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

/*
parameter pt1Real = 18'h1FFFF,  pt1Imag = 18'h00000,
          pt2Real = 18'h1E6F0,  pt2Imag = 18'h361C9,
          pt3Real = 18'h19E37,  pt3Imag = 18'h2D30E,
          pt4Real = 18'h12CF2,  pt4Imag = 18'h261C9,
          pt5Real = 18'h09E37,  pt5Imag = 18'h21910,
          pt6Real = 18'h00000,  pt6Imag = 18'h20001,
          pt7Real = 18'h361C9,  pt7Imag = 18'h21910,
          pt8Real = 18'h2D30E,  pt8Imag = 18'h261C9,
          pt9Real = 18'h261C9,  pt9Imag = 18'h2D30E,
         pt10Real = 18'h21910, pt10Imag = 18'h361C9,
         pt11Real = 18'h20001, pt11Imag = 18'h00000,
         pt12Real = 18'h21910, pt12Imag = 18'h09E37,
         pt13Real = 18'h261C9, pt13Imag = 18'h12CF2,
         pt14Real = 18'h2D30E, pt14Imag = 18'h19E37,
         pt15Real = 18'h361C9, pt15Imag = 18'h1E6F0,
         pt16Real = 18'h00000, pt16Imag = 18'h1FFFF,
         pt17Real = 18'h09E37, pt17Imag = 18'h1E6F0,
         pt18Real = 18'h12CF2, pt18Imag = 18'h19E37,
         pt19Real = 18'h19E37, pt19Imag = 18'h12CF2,
         pt20Real = 18'h1E6F0, pt20Imag = 18'h09E37;
*/

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
  if(symEn)begin
    iInBuf0 <= iIn0;
    iInBuf1 <= iIn1;
    qInBuf0 <= qIn0;
    qInBuf1 <= qIn1;
    end
  end

reg symEnDelay;
always @(posedge clk)begin 
  symEnDelay <= symEn;
  end

wire [(ROT_BITS-1):0]iInSel = symEnDelay ? iInBuf0 : iInBuf1;
wire [(ROT_BITS-1):0]qInSel = symEnDelay ? qInBuf0 : qInBuf1;

rotMult m1
  (
  .clk(clk),
  .symEn(symEn),
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
  .symEn(symEn),
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
  .symEn(symEn),
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
  .symEn(symEn),
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
  .symEn(symEn),
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
  .symEn(symEn),
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
  .symEn(symEn),
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
  .symEn(symEn),
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
  .symEn(symEn),
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
  .symEn(symEn),
  .a(iInSel),
  .b(qInSel),
  .c(pt10Real),
  .d(pt10Imag),
  .reOut0(out0Pt10Real),
  .imOut0(out0Pt10Imag),
  .reOut1(out1Pt10Real),
  .imOut1(out1Pt10Imag)
  );

rotMult m11
  (
  .clk(clk),
  .symEn(symEn),
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
  .symEn(symEn),
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
  .symEn(symEn),
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
  .symEn(symEn),
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
  .symEn(symEn),
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
  .symEn(symEn),
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
  .symEn(symEn),
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
  .symEn(symEn),
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
  .symEn(symEn),
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
  .symEn(symEn),
  .a(iInSel),
  .b(qInSel),
  .c(pt20Real),
  .d(pt20Imag),
  .reOut0(out0Pt20Real),
  .imOut0(out0Pt20Imag),
  .reOut1(out1Pt20Real),
  .imOut1(out1Pt20Imag)
  );

/*
multiplier m1(clk,symEn,iInSel,qInSel,pt1Real,pt1Imag,out0Pt1Real,out0Pt1Imag,out1Pt1Real,out1Pt1Imag);
multiplier m2(clk,symEn,iInSel,qInSel,pt2Real,pt2Imag,out0Pt2Real,out0Pt2Imag,out1Pt2Real,out1Pt2Imag);
multiplier m3(clk,symEn,iInSel,qInSel,pt3Real,pt3Imag,out0Pt3Real,out0Pt3Imag,out1Pt3Real,out1Pt3Imag);
multiplier m4(clk,symEn,iInSel,qInSel,pt4Real,pt4Imag,out0Pt4Real,out0Pt4Imag,out1Pt4Real,out1Pt4Imag);
multiplier m5(clk,symEn,iInSel,qInSel,pt5Real,pt5Imag,out0Pt5Real,out0Pt5Imag,out1Pt5Real,out1Pt5Imag);
multiplier m6(clk,symEn,iInSel,qInSel,pt6Real,pt6Imag,out0Pt6Real,out0Pt6Imag,out1Pt6Real,out1Pt6Imag);
multiplier m7(clk,symEn,iInSel,qInSel,pt7Real,pt7Imag,out0Pt7Real,out0Pt7Imag,out1Pt7Real,out1Pt7Imag);
multiplier m8(clk,symEn,iInSel,qInSel,pt8Real,pt8Imag,out0Pt8Real,out0Pt8Imag,out1Pt8Real,out1Pt8Imag);
multiplier m9(clk,symEn,iInSel,qInSel,pt9Real,pt9Imag,out0Pt9Real,out0Pt9Imag,out1Pt9Real,out1Pt9Imag);
multiplier m10(clk,symEn,iInSel,qInSel,pt10Real,pt10Imag,out0Pt10Real,out0Pt10Imag,out1Pt10Real,out1Pt10Imag);
multiplier m11(clk,symEn,iInSel,qInSel,pt11Real,pt11Imag,out0Pt11Real,out0Pt11Imag,out1Pt11Real,out1Pt11Imag);
multiplier m12(clk,symEn,iInSel,qInSel,pt12Real,pt12Imag,out0Pt12Real,out0Pt12Imag,out1Pt12Real,out1Pt12Imag);
multiplier m13(clk,symEn,iInSel,qInSel,pt13Real,pt13Imag,out0Pt13Real,out0Pt13Imag,out1Pt13Real,out1Pt13Imag);
multiplier m14(clk,symEn,iInSel,qInSel,pt14Real,pt14Imag,out0Pt14Real,out0Pt14Imag,out1Pt14Real,out1Pt14Imag);
multiplier m15(clk,symEn,iInSel,qInSel,pt15Real,pt15Imag,out0Pt15Real,out0Pt15Imag,out1Pt15Real,out1Pt15Imag);
multiplier m16(clk,symEn,iInSel,qInSel,pt16Real,pt16Imag,out0Pt16Real,out0Pt16Imag,out1Pt16Real,out1Pt16Imag);
multiplier m17(clk,symEn,iInSel,qInSel,pt17Real,pt17Imag,out0Pt17Real,out0Pt17Imag,out1Pt17Real,out1Pt17Imag);
multiplier m18(clk,symEn,iInSel,qInSel,pt18Real,pt18Imag,out0Pt18Real,out0Pt18Imag,out1Pt18Real,out1Pt18Imag);
multiplier m19(clk,symEn,iInSel,qInSel,pt19Real,pt19Imag,out0Pt19Real,out0Pt19Imag,out1Pt19Real,out1Pt19Imag);
multiplier m20(clk,symEn,iInSel,qInSel,pt20Real,pt20Imag,out0Pt20Real,out0Pt20Imag,out1Pt20Real,out1Pt20Imag);
*/


endmodule