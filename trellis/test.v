//-----------------------------------------------------------------------------
// Project      SEMCO Multi-mode Demodulator
// Design       Viterbi Decoder Test
// Created      07 April 09
//-----------------------------------------------------------------------------
// 1.0      (VS)Initial coding
//
//
//-----------------------------------------------------------------------------

`timescale 1ns/1ps

module test;

reg clk,reset;
reg [79:0]din;
reg symEn,sym2xEn;
wire [17:0]
  out0Pt1Real,out1Pt1Real,
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

trellis uut(clk,reset,symEn,sym2xEn,din[57:40],din[17:0]);

initial clk = 0;
initial reset = 0;

always #4 clk = !clk;

reg [1023:0]readMem[79:0];
reg [10:0]index;

reg [3:0]cnt;
always @(posedge clk)begin
  cnt <= cnt +1;
  case(cnt)
    0,2,4,6,8,10,12,14: begin // keep the symEn evenly spaced
      symEn <= 1;
      sym2xEn <= 1;
      din <= readMem[index];
      index <= index +1;
      end
    1,3,5,7,9,11,13,15: begin // put the second sym2xEn anywhere
      symEn <= 0;
      sym2xEn <= 1;
      din <= readMem[index];
      index <= index +1;
      end
    default: begin
      symEn <= 0;
      sym2xEn <= 0;
      din <= din;
      index <= index;
      end
    endcase
  end

// `define ONEZERO
// `define ALLZEROES
//`define ALLONES
`define RANDOM

integer file1,file2;
initial begin
  #100 reset = !reset;
  #100 reset = !reset;
  cnt = 0;
  index = 0;
  din = 0;

  `ifdef ONEZERO
  $readmemh("../One Zero/mfinputs.hex", readMem);
  file1 = $fopen("../One Zero/filterOutput.dat");
  file2 = $fopen("../One Zero/rotatorOutput.dat");
  `endif

  `ifdef ALLZEROES
  $readmemh("../All Zeroes/mfinputs.hex", readMem);
  file1 = $fopen("../All Zeroes/filterOutput.dat");
  file2 = $fopen("../All Zeroes/rotatorOutput.dat");
  `endif

  `ifdef ALLONES
  $readmemh("../All Ones/mfinputs.hex", readMem);
  file1 = $fopen("../All Ones/filterOutput.dat");
  file2 = $fopen("../All Ones/rotatorOutput.dat");
  `endif

  `ifdef RANDOM
  $readmemh("../Random/mfinputs.hex", readMem);
  file1 = $fopen("../Random/filterOutput.dat");
  file2 = $fopen("../Random/rotatorOutput.dat");
  `endif

  end

always @(posedge clk)begin
  if(symEn)begin
    $fdisplay(file1, "(%h,%h) (%h,%h)",uut.f0I,uut.f0Q,uut.f1I,uut.f1Q);
    $fdisplay(file2, "%d\t%d\t%d\t%d\t%d\t%d\t%d\t%d\t%d\t%d\t%d\t%d\t%d\t%d\t%d\t%d\t%d\t%d\t%d\t%d\n%d\t%d\t%d\t%d\t%d\t%d\t%d\t%d\t%d\t%d\t%d\t%d\t%d\t%d\t%d\t%d\t%d\t%d\t%d\t%d",
      $signed(uut.out0Pt1Real),
      $signed(uut.out0Pt2Real),
      $signed(uut.out0Pt3Real),
      $signed(uut.out0Pt4Real),
      $signed(uut.out0Pt5Real),
      $signed(uut.out0Pt6Real),
      $signed(uut.out0Pt7Real),
      $signed(uut.out0Pt8Real),
      $signed(uut.out0Pt9Real),
      $signed(uut.out0Pt10Real),
      $signed(uut.out0Pt11Real),
      $signed(uut.out0Pt12Real),
      $signed(uut.out0Pt13Real),
      $signed(uut.out0Pt14Real),
      $signed(uut.out0Pt15Real),
      $signed(uut.out0Pt16Real),
      $signed(uut.out0Pt17Real),
      $signed(uut.out0Pt18Real),
      $signed(uut.out0Pt19Real),
      $signed(uut.out0Pt20Real),
      $signed(uut.out1Pt1Real),
      $signed(uut.out1Pt2Real),
      $signed(uut.out1Pt3Real),
      $signed(uut.out1Pt4Real),
      $signed(uut.out1Pt5Real),
      $signed(uut.out1Pt6Real),
      $signed(uut.out1Pt7Real),
      $signed(uut.out1Pt8Real),
      $signed(uut.out1Pt9Real),
      $signed(uut.out1Pt10Real),
      $signed(uut.out1Pt11Real),
      $signed(uut.out1Pt12Real),
      $signed(uut.out1Pt13Real),
      $signed(uut.out1Pt14Real),
      $signed(uut.out1Pt15Real),
      $signed(uut.out1Pt16Real),
      $signed(uut.out1Pt17Real),
      $signed(uut.out1Pt18Real),
      $signed(uut.out1Pt19Real),
      $signed(uut.out1Pt20Real));
    end
  end

initial begin
  uut.f0.pRealLatch = 0;
  uut.f0.pImagLatch = 0;
  uut.f0.shft = 0;
  uut.f0.qOutBuf = 0;
  uut.f0.iOutBuf = 0;
  uut.f0.iOut = 0;
  uut.f0.qOut = 0;

  uut.f1.pRealLatch = 0;
  uut.f1.pImagLatch = 0;
  uut.f1.shft = 0;
  uut.f1.qOutBuf = 0;
  uut.f1.iOutBuf = 0;
  uut.f1.iOut = 0;
  uut.f1.qOut = 0;

  uut.rotator.iInBuf0 = 0;
  uut.rotator.iInBuf1 = 0;
  uut.rotator.qInBuf0 = 0;
  uut.rotator.qInBuf1 = 0;

  uut.rotator.m1.re0 = 0;
  uut.rotator.m1.im0 = 0;
  uut.rotator.m1.reOut0 = 0;
  uut.rotator.m1.imOut0 = 0;
  uut.rotator.m1.reOut1 = 0;
  uut.rotator.m1.imOut1 = 0;
  uut.rotator.m1.symEnDelay = 0;

  uut.rotator.m2.re0 = 0;
  uut.rotator.m2.im0 = 0;
  uut.rotator.m2.reOut0 = 0;
  uut.rotator.m2.imOut0 = 0;
  uut.rotator.m2.reOut1 = 0;
  uut.rotator.m2.imOut1 = 0;
  uut.rotator.m2.symEnDelay = 0;

  uut.rotator.m3.re0 = 0;
  uut.rotator.m3.im0 = 0;
  uut.rotator.m3.reOut0 = 0;
  uut.rotator.m3.imOut0 = 0;
  uut.rotator.m3.reOut1 = 0;
  uut.rotator.m3.imOut1 = 0;
  uut.rotator.m3.symEnDelay = 0;

  uut.rotator.m4.re0 = 0;
  uut.rotator.m4.im0 = 0;
  uut.rotator.m4.reOut0 = 0;
  uut.rotator.m4.imOut0 = 0;
  uut.rotator.m4.reOut1 = 0;
  uut.rotator.m4.imOut1 = 0;
  uut.rotator.m4.symEnDelay = 0;

  uut.rotator.m5.re0 = 0;
  uut.rotator.m5.im0 = 0;
  uut.rotator.m5.reOut0 = 0;
  uut.rotator.m5.imOut0 = 0;
  uut.rotator.m5.reOut1 = 0;
  uut.rotator.m5.imOut1 = 0;
  uut.rotator.m5.symEnDelay = 0;

  uut.rotator.m6.re0 = 0;
  uut.rotator.m6.im0 = 0;
  uut.rotator.m6.reOut0 = 0;
  uut.rotator.m6.imOut0 = 0;
  uut.rotator.m6.reOut1 = 0;
  uut.rotator.m6.imOut1 = 0;
  uut.rotator.m6.symEnDelay = 0;

  uut.rotator.m7.re0 = 0;
  uut.rotator.m7.im0 = 0;
  uut.rotator.m7.reOut0 = 0;
  uut.rotator.m7.imOut0 = 0;
  uut.rotator.m7.reOut1 = 0;
  uut.rotator.m7.imOut1 = 0;
  uut.rotator.m7.symEnDelay = 0;

  uut.rotator.m8.re0 = 0;
  uut.rotator.m8.im0 = 0;
  uut.rotator.m8.reOut0 = 0;
  uut.rotator.m8.imOut0 = 0;
  uut.rotator.m8.reOut1 = 0;
  uut.rotator.m8.imOut1 = 0;
  uut.rotator.m8.symEnDelay = 0;

  uut.rotator.m9.re0 = 0;
  uut.rotator.m9.im0 = 0;
  uut.rotator.m9.reOut0 = 0;
  uut.rotator.m9.imOut0 = 0;
  uut.rotator.m9.reOut1 = 0;
  uut.rotator.m9.imOut1 = 0;
  uut.rotator.m9.symEnDelay = 0;

  uut.rotator.m10.re0 = 0;
  uut.rotator.m10.im0 = 0;
  uut.rotator.m10.reOut0 = 0;
  uut.rotator.m10.imOut0 = 0;
  uut.rotator.m10.reOut1 = 0;
  uut.rotator.m10.imOut1 = 0;
  uut.rotator.m10.symEnDelay = 0;

  uut.rotator.m11.re0 = 0;
  uut.rotator.m11.im0 = 0;
  uut.rotator.m11.reOut0 = 0;
  uut.rotator.m11.imOut0 = 0;
  uut.rotator.m11.reOut1 = 0;
  uut.rotator.m11.imOut1 = 0;
  uut.rotator.m11.symEnDelay = 0;

  uut.rotator.m12.re0 = 0;
  uut.rotator.m12.im0 = 0;
  uut.rotator.m12.reOut0 = 0;
  uut.rotator.m12.imOut0 = 0;
  uut.rotator.m12.reOut1 = 0;
  uut.rotator.m12.imOut1 = 0;
  uut.rotator.m12.symEnDelay = 0;

  uut.rotator.m13.re0 = 0;
  uut.rotator.m13.im0 = 0;
  uut.rotator.m13.reOut0 = 0;
  uut.rotator.m13.imOut0 = 0;
  uut.rotator.m13.reOut1 = 0;
  uut.rotator.m13.imOut1 = 0;
  uut.rotator.m13.symEnDelay = 0;

  uut.rotator.m14.re0 = 0;
  uut.rotator.m14.im0 = 0;
  uut.rotator.m14.reOut0 = 0;
  uut.rotator.m14.imOut0 = 0;
  uut.rotator.m14.reOut1 = 0;
  uut.rotator.m14.imOut1 = 0;
  uut.rotator.m14.symEnDelay = 0;

  uut.rotator.m15.re0 = 0;
  uut.rotator.m15.im0 = 0;
  uut.rotator.m15.reOut0 = 0;
  uut.rotator.m15.imOut0 = 0;
  uut.rotator.m15.reOut1 = 0;
  uut.rotator.m15.imOut1 = 0;
  uut.rotator.m15.symEnDelay = 0;

  uut.rotator.m16.re0 = 0;
  uut.rotator.m16.im0 = 0;
  uut.rotator.m16.reOut0 = 0;
  uut.rotator.m16.imOut0 = 0;
  uut.rotator.m16.reOut1 = 0;
  uut.rotator.m16.imOut1 = 0;
  uut.rotator.m16.symEnDelay = 0;

  uut.rotator.m17.re0 = 0;
  uut.rotator.m17.im0 = 0;
  uut.rotator.m17.reOut0 = 0;
  uut.rotator.m17.imOut0 = 0;
  uut.rotator.m17.reOut1 = 0;
  uut.rotator.m17.imOut1 = 0;
  uut.rotator.m17.symEnDelay = 0;

  uut.rotator.m18.re0 = 0;
  uut.rotator.m18.im0 = 0;
  uut.rotator.m18.reOut0 = 0;
  uut.rotator.m18.imOut0 = 0;
  uut.rotator.m18.reOut1 = 0;
  uut.rotator.m18.imOut1 = 0;
  uut.rotator.m18.symEnDelay = 0;

  uut.rotator.m19.re0 = 0;
  uut.rotator.m19.im0 = 0;
  uut.rotator.m19.reOut0 = 0;
  uut.rotator.m19.imOut0 = 0;
  uut.rotator.m19.reOut1 = 0;
  uut.rotator.m19.imOut1 = 0;
  uut.rotator.m19.symEnDelay = 0;

  uut.rotator.m20.re0 = 0;
  uut.rotator.m20.im0 = 0;
  uut.rotator.m20.reOut0 = 0;
  uut.rotator.m20.imOut0 = 0;
  uut.rotator.m20.reOut1 = 0;
  uut.rotator.m20.imOut1 = 0;
  uut.rotator.m20.symEnDelay = 0;

  end
endmodule