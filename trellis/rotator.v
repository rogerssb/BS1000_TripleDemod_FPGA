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
input [17:0]iIn0,qIn0,iIn1,qIn1;

output [17:0]
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

reg [17:0]iInBuf0,iInBuf1,qInBuf0,qInBuf1;
always @(posedge clk)begin
  if(symEn)begin
    iInBuf0 <= iIn0;
    iInBuf1 <= iIn1;
    qInBuf0 <= qIn0;
    qInBuf1 <= qIn1;
    end
  end

wire [17:0]iInSel = symEn ? iInBuf1 : iInBuf0;
wire [17:0]qInSel = symEn ? qInBuf1 : qInBuf0;

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

endmodule