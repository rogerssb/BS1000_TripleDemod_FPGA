//-----------------------------------------------------------------------------
// Project      SEMCO Multi-mode Demodulator
// Design       Viterbi Decoder Top
// Created      24 April 09
//-----------------------------------------------------------------------------
// 1.0      (VS)initial coding
//
//
//-----------------------------------------------------------------------------

`timescale 1ns/1ps
`include "./addressMap.v"

module trellis(
    clk,reset,symEn,sym2xEn,
    iIn,qIn,
    wr0,wr1,wr2,wr3,
    addr,
    din,dout,
    dac0Select,dac1Select,dac2Select,
    dac0Sync,
    dac0Data,
    dac1Sync,
    dac1Data,
    dac2Sync,
    dac2Data,
    decision,
    symEn_tbtDly,
    sym2xEn_tbtDly,
    oneOrZeroPredecessor
    );

parameter size = 8;
parameter ROT_BITS = 10;

input           clk,reset,symEn,sym2xEn;
input   [17:0]  iIn,qIn;
input           wr0,wr1,wr2,wr3;
input   [11:0]  addr;
input   [31:0]  din;
output  [31:0]  dout;
input   [3:0]   dac0Select,dac1Select,dac2Select;
output          dac0Sync;
output  [17:0]  dac0Data;
output          dac1Sync;
output  [17:0]  dac1Data;
output          dac2Sync;
output  [17:0]  dac2Data;
output          decision;
output          symEn_tbtDly;
output          sym2xEn_tbtDly;
output          oneOrZeroPredecessor;
   
   
wire    [ROT_BITS-1:0]  phaseError;
wire                    decision;

reg     [7:0]   phErrShft;
wire    [17:0]  carrierLoopIOut,carrierLoopQOut;
wire    [17:0]  carrierLoopIOutX2,carrierLoopQOutX2;
trellisCarrierLoop trellisCarrierLoop(
  .clk(clk),
  .reset(reset),
  .symEn(symEn),
  .sym2xEn(sym2xEn),
  .iIn(iIn),
  .qIn(qIn),
`ifndef IQ_MAG
  .phaseError(phErrShft),
  .symEn_phErr(symEn_phErr),
`else
  .phaseError(0),
  .symEn_phErr(rotEna),
`endif
  .wr0(wr0),
  .wr1(wr1),
  .wr2(wr2),
  .wr3(wr3),
  .addr(addr),
  .din(din),
  .dout(dout),
  .iOut(carrierLoopIOut),
  .qOut(carrierLoopQOut),
  .symEnDly(symEnDly),
  .sym2xEnDly(sym2xEnDly)
  );

`ifdef SIMULATE
real phErrReal;
always @(phErrShft) phErrReal = (phErrShft[7] ? phErrShft - 256.0 : phErrShft);
`endif


// multiply by two the output from the carrierLoop to compensate for the 1/2 in the cmpy18 module.
multBy2withSat times2I(
                       .clk(clk), 
                       .symEn(symEnDly), 
                       .sym2xEn(sym2xEnDly), 
                       .dIn(carrierLoopIOut),
                       .dOut(carrierLoopIOutX2), 
                       .symEnDly(symEnDly_mult2), 
                       .sym2xEnDly(sym2xEnDly_mult2)
                       );

multBy2withSat times2Q(
                       .clk(clk), 
                       .symEn(symEnDly), 
                       .sym2xEn(sym2xEnDly), 
                       .dIn(carrierLoopQOut),
                       .dOut(carrierLoopQOutX2), 
                       .symEnDly(),
                       .sym2xEnDly()
                       );
   

// there are two samples per symbol and their coefficients order below is
// 0 real, 0 imag, 1 real, 1 imag

wire [17:0]f0I,f0Q;
mfilter #(18'h1B48C,18'h10B85,18'h3D7D4,18'h1FE6B) f0(clk,reset,symEnDly_mult2,sym2xEnDly_mult2,carrierLoopIOutX2,carrierLoopQOutX2,f0I,f0Q);
//mfilter #(18'h1B48C,18'h10B85,18'h3D7D4,18'h1FE6B) f0(clk,reset,symEn,sym2xEn,iIn,qIn,f0I,f0Q);

wire [17:0]f1I,f1Q;
mfilter #(18'h1B48C,18'h2F47B,18'h3D7D4,18'h20195) f1(clk,reset,symEnDly_mult2,sym2xEnDly_mult2,carrierLoopIOutX2,carrierLoopQOutX2,f1I,f1Q);
//mfilter #(18'h1B48C,18'h2F47B,18'h3D7D4,18'h20195) f1(clk,reset,symEn,sym2xEn,iIn,qIn,f1I,f1Q);

reg [15:0]symEnShift;
always @(posedge clk)symEnShift <= {symEnShift[14:0],(sym2xEnDly_mult2 && !symEnDly_mult2)};
//always @(posedge clk)symEnShift <= {symEnShift[14:0],(sym2xEn && !symEn)};

wire rotEna = symEnShift[4];
//wire trellEna = symEnShift[14];
wire trellEna = symEnShift[10];

reg [15:0]sym2xEnShift;
always @(posedge clk)sym2xEnShift <= {sym2xEnShift[14:0],sym2xEnDly_mult2};
//wire trell2xEna = sym2xEnShift[14];
wire trell2xEna = sym2xEnShift[12];

   
`ifdef SIMULATE
real f0IReal;
always @(f0I) f0IReal <= f0I[17] ? f0I - 262144.0 : f0I;
real f0QReal;
always @(f0Q) f0QReal <= f0Q[17] ? f0Q - 262144.0 : f0Q;
real f1IReal;
always @(f1I) f1IReal <= f1I[17] ? f1I - 262144.0 : f1I;
real f1QReal;
always @(f1Q) f1QReal <= f1Q[17] ? f1Q - 262144.0 : f1Q;
real mag0,mag1;
always @(posedge clk) begin
    if (rotEna) begin
        mag0 <= (f0IReal*f0IReal) + (f0QReal*f0QReal);
        mag1 <= (f1IReal*f1IReal) + (f1QReal*f1QReal);
        end                        
    end
`endif

`ifdef IQ_MAG
iqMagEst iqMagEst
  ( 
    .clk(clk), .reset(reset), .syncIn(rotEna),
    .iIn_0(f0I),
    .qIn_0(f0Q),
    .iIn_1(f1I),
    .qIn_1(f1Q),
    .decision(decision)
    );

assign symEn_tbtDly = rotEna;
assign sym2xEn_tbtDly = 0;  // need to allign

`else
   
   
wire [ROT_BITS-1:0]
  out0Pt1Real,out1Pt1Real,          out0Pt1Imag,out1Pt1Imag,
  out0Pt2Real,out1Pt2Real,          out0Pt2Imag,out1Pt2Imag,
  out0Pt3Real,out1Pt3Real,          out0Pt3Imag,out1Pt3Imag,
  out0Pt4Real,out1Pt4Real,          out0Pt4Imag,out1Pt4Imag,
  out0Pt5Real,out1Pt5Real,          out0Pt5Imag,out1Pt5Imag,
  out0Pt6Real,out1Pt6Real,          out0Pt6Imag,out1Pt6Imag,
  out0Pt7Real,out1Pt7Real,          out0Pt7Imag,out1Pt7Imag,
  out0Pt8Real,out1Pt8Real,          out0Pt8Imag,out1Pt8Imag,
  out0Pt9Real,out1Pt9Real,          out0Pt9Imag,out1Pt9Imag,
  out0Pt10Real,out1Pt10Real,        out0Pt10Imag,out1Pt10Imag,
  out0Pt11Real,out1Pt11Real,        out0Pt11Imag,out1Pt11Imag,
  out0Pt12Real,out1Pt12Real,        out0Pt12Imag,out1Pt12Imag,
  out0Pt13Real,out1Pt13Real,        out0Pt13Imag,out1Pt13Imag,
  out0Pt14Real,out1Pt14Real,        out0Pt14Imag,out1Pt14Imag,
  out0Pt15Real,out1Pt15Real,        out0Pt15Imag,out1Pt15Imag,
  out0Pt16Real,out1Pt16Real,        out0Pt16Imag,out1Pt16Imag,
  out0Pt17Real,out1Pt17Real,        out0Pt17Imag,out1Pt17Imag,
  out0Pt18Real,out1Pt18Real,        out0Pt18Imag,out1Pt18Imag,
  out0Pt19Real,out1Pt19Real,        out0Pt19Imag,out1Pt19Imag,
  out0Pt20Real,out1Pt20Real,        out0Pt20Imag,out1Pt20Imag;

rotator #(ROT_BITS) rotator(
  clk,reset,rotEna,
  f0I[17:(17-(ROT_BITS-1))],
  f0Q[17:(17-(ROT_BITS-1))],
  f1I[17:(17-(ROT_BITS-1))],
  f1Q[17:(17-(ROT_BITS-1))],
  out0Pt1Real,out0Pt1Imag,
  out1Pt1Real,out1Pt1Imag,
  out0Pt2Real,out0Pt2Imag,
  out1Pt2Real,out1Pt2Imag,
  out0Pt3Real,out0Pt3Imag,
  out1Pt3Real,out1Pt3Imag,
  out0Pt4Real,out0Pt4Imag,
  out1Pt4Real,out1Pt4Imag,
  out0Pt5Real,out0Pt5Imag,
  out1Pt5Real,out1Pt5Imag,
  out0Pt6Real,out0Pt6Imag,
  out1Pt6Real,out1Pt6Imag,
  out0Pt7Real,out0Pt7Imag,
  out1Pt7Real,out1Pt7Imag,
  out0Pt8Real,out0Pt8Imag,
  out1Pt8Real,out1Pt8Imag,
  out0Pt9Real,out0Pt9Imag,
  out1Pt9Real,out1Pt9Imag,
  out0Pt10Real,out0Pt10Imag,
  out1Pt10Real,out1Pt10Imag,
  out0Pt11Real,out0Pt11Imag,
  out1Pt11Real,out1Pt11Imag,
  out0Pt12Real,out0Pt12Imag,
  out1Pt12Real,out1Pt12Imag,
  out0Pt13Real,out0Pt13Imag,
  out1Pt13Real,out1Pt13Imag,
  out0Pt14Real,out0Pt14Imag,
  out1Pt14Real,out1Pt14Imag,
  out0Pt15Real,out0Pt15Imag,
  out1Pt15Real,out1Pt15Imag,
  out0Pt16Real,out0Pt16Imag,
  out1Pt16Real,out1Pt16Imag,
  out0Pt17Real,out0Pt17Imag,
  out1Pt17Real,out1Pt17Imag,
  out0Pt18Real,out0Pt18Imag,
  out1Pt18Real,out1Pt18Imag,
  out0Pt19Real,out0Pt19Imag,
  out1Pt19Real,out1Pt19Imag,
  out0Pt20Real,out0Pt20Imag,
  out1Pt20Real,out1Pt20Imag
  );

  

wire    [4:0]   index;

viterbi_top #(size, ROT_BITS)viterbi_top
  (
  .clk(clk), .reset(reset), .symEn(trellEna), .sym2xEn(trell2xEna),
  .out0Pt1Real(out0Pt1Real[(ROT_BITS-1):(ROT_BITS-1)-(size-1)])    ,.out0Pt1Imag(out0Pt1Imag),
  .out1Pt1Real(out1Pt1Real[(ROT_BITS-1):(ROT_BITS-1)-(size-1)])    ,.out1Pt1Imag(out1Pt1Imag),
  .out0Pt2Real(out0Pt2Real[(ROT_BITS-1):(ROT_BITS-1)-(size-1)])    ,.out0Pt2Imag(out0Pt2Imag),
  .out1Pt2Real(out1Pt2Real[(ROT_BITS-1):(ROT_BITS-1)-(size-1)])    ,.out1Pt2Imag(out1Pt2Imag),
  .out0Pt3Real(out0Pt3Real[(ROT_BITS-1):(ROT_BITS-1)-(size-1)])    ,.out0Pt3Imag(out0Pt3Imag),
  .out1Pt3Real(out1Pt3Real[(ROT_BITS-1):(ROT_BITS-1)-(size-1)])    ,.out1Pt3Imag(out1Pt3Imag),
  .out0Pt4Real(out0Pt4Real[(ROT_BITS-1):(ROT_BITS-1)-(size-1)])    ,.out0Pt4Imag(out0Pt4Imag),
  .out1Pt4Real(out1Pt4Real[(ROT_BITS-1):(ROT_BITS-1)-(size-1)])    ,.out1Pt4Imag(out1Pt4Imag),
  .out0Pt5Real(out0Pt5Real[(ROT_BITS-1):(ROT_BITS-1)-(size-1)])    ,.out0Pt5Imag(out0Pt5Imag),
  .out1Pt5Real(out1Pt5Real[(ROT_BITS-1):(ROT_BITS-1)-(size-1)])    ,.out1Pt5Imag(out1Pt5Imag),
  .out0Pt6Real(out0Pt6Real[(ROT_BITS-1):(ROT_BITS-1)-(size-1)])    ,.out0Pt6Imag(out0Pt6Imag),
  .out1Pt6Real(out1Pt6Real[(ROT_BITS-1):(ROT_BITS-1)-(size-1)])    ,.out1Pt6Imag(out1Pt6Imag),
  .out0Pt7Real(out0Pt7Real[(ROT_BITS-1):(ROT_BITS-1)-(size-1)])    ,.out0Pt7Imag(out0Pt7Imag),
  .out1Pt7Real(out1Pt7Real[(ROT_BITS-1):(ROT_BITS-1)-(size-1)])    ,.out1Pt7Imag(out1Pt7Imag),
  .out0Pt8Real(out0Pt8Real[(ROT_BITS-1):(ROT_BITS-1)-(size-1)])    ,.out0Pt8Imag(out0Pt8Imag),
  .out1Pt8Real(out1Pt8Real[(ROT_BITS-1):(ROT_BITS-1)-(size-1)])    ,.out1Pt8Imag(out1Pt8Imag),
  .out0Pt9Real(out0Pt9Real[(ROT_BITS-1):(ROT_BITS-1)-(size-1)])    ,.out0Pt9Imag(out0Pt9Imag),
  .out1Pt9Real(out1Pt9Real[(ROT_BITS-1):(ROT_BITS-1)-(size-1)])    ,.out1Pt9Imag(out1Pt9Imag),
  .out0Pt10Real(out0Pt10Real[(ROT_BITS-1):(ROT_BITS-1)-(size-1)]),.out0Pt10Imag(out0Pt10Imag),
  .out1Pt10Real(out1Pt10Real[(ROT_BITS-1):(ROT_BITS-1)-(size-1)]),.out1Pt10Imag(out1Pt10Imag),
  .out0Pt11Real(out0Pt11Real[(ROT_BITS-1):(ROT_BITS-1)-(size-1)]),.out0Pt11Imag(out0Pt11Imag),
  .out1Pt11Real(out1Pt11Real[(ROT_BITS-1):(ROT_BITS-1)-(size-1)]),.out1Pt11Imag(out1Pt11Imag),
  .out0Pt12Real(out0Pt12Real[(ROT_BITS-1):(ROT_BITS-1)-(size-1)]),.out0Pt12Imag(out0Pt12Imag),
  .out1Pt12Real(out1Pt12Real[(ROT_BITS-1):(ROT_BITS-1)-(size-1)]),.out1Pt12Imag(out1Pt12Imag),
  .out0Pt13Real(out0Pt13Real[(ROT_BITS-1):(ROT_BITS-1)-(size-1)]),.out0Pt13Imag(out0Pt13Imag),
  .out1Pt13Real(out1Pt13Real[(ROT_BITS-1):(ROT_BITS-1)-(size-1)]),.out1Pt13Imag(out1Pt13Imag),
  .out0Pt14Real(out0Pt14Real[(ROT_BITS-1):(ROT_BITS-1)-(size-1)]),.out0Pt14Imag(out0Pt14Imag),
  .out1Pt14Real(out1Pt14Real[(ROT_BITS-1):(ROT_BITS-1)-(size-1)]),.out1Pt14Imag(out1Pt14Imag),
  .out0Pt15Real(out0Pt15Real[(ROT_BITS-1):(ROT_BITS-1)-(size-1)]),.out0Pt15Imag(out0Pt15Imag),
  .out1Pt15Real(out1Pt15Real[(ROT_BITS-1):(ROT_BITS-1)-(size-1)]),.out1Pt15Imag(out1Pt15Imag),
  .out0Pt16Real(out0Pt16Real[(ROT_BITS-1):(ROT_BITS-1)-(size-1)]),.out0Pt16Imag(out0Pt16Imag),
  .out1Pt16Real(out1Pt16Real[(ROT_BITS-1):(ROT_BITS-1)-(size-1)]),.out1Pt16Imag(out1Pt16Imag),
  .out0Pt17Real(out0Pt17Real[(ROT_BITS-1):(ROT_BITS-1)-(size-1)]),.out0Pt17Imag(out0Pt17Imag),
  .out1Pt17Real(out1Pt17Real[(ROT_BITS-1):(ROT_BITS-1)-(size-1)]),.out1Pt17Imag(out1Pt17Imag),
  .out0Pt18Real(out0Pt18Real[(ROT_BITS-1):(ROT_BITS-1)-(size-1)]),.out0Pt18Imag(out0Pt18Imag),
  .out1Pt18Real(out1Pt18Real[(ROT_BITS-1):(ROT_BITS-1)-(size-1)]),.out1Pt18Imag(out1Pt18Imag),
  .out0Pt19Real(out0Pt19Real[(ROT_BITS-1):(ROT_BITS-1)-(size-1)]),.out0Pt19Imag(out0Pt19Imag),
  .out1Pt19Real(out1Pt19Real[(ROT_BITS-1):(ROT_BITS-1)-(size-1)]),.out1Pt19Imag(out1Pt19Imag),
  .out0Pt20Real(out0Pt20Real[(ROT_BITS-1):(ROT_BITS-1)-(size-1)]),.out0Pt20Imag(out0Pt20Imag),
  .out1Pt20Real(out1Pt20Real[(ROT_BITS-1):(ROT_BITS-1)-(size-1)]),.out1Pt20Imag(out1Pt20Imag),
/* -----\/----- EXCLUDED -----\/-----
  .out0Pt1Real(out0Pt1Real[(ROT_BITS-1):(ROT_BITS-1)-(size-1)]),.out0Pt1Imag(out0Pt1Imag[(ROT_BITS-1):(ROT_BITS-1)-(size-1)]),
  .out1Pt1Real(out1Pt1Real[(ROT_BITS-1):(ROT_BITS-1)-(size-1)]),.out1Pt1Imag(out1Pt1Imag[(ROT_BITS-1):(ROT_BITS-1)-(size-1)]),
  .out0Pt2Real(out0Pt2Real[(ROT_BITS-1):(ROT_BITS-1)-(size-1)]),.out0Pt2Imag(out0Pt2Imag[(ROT_BITS-1):(ROT_BITS-1)-(size-1)]),
  .out1Pt2Real(out1Pt2Real[(ROT_BITS-1):(ROT_BITS-1)-(size-1)]),.out1Pt2Imag(out1Pt2Imag[(ROT_BITS-1):(ROT_BITS-1)-(size-1)]),
  .out0Pt3Real(out0Pt3Real[(ROT_BITS-1):(ROT_BITS-1)-(size-1)]),.out0Pt3Imag(out0Pt3Imag[(ROT_BITS-1):(ROT_BITS-1)-(size-1)]),
  .out1Pt3Real(out1Pt3Real[(ROT_BITS-1):(ROT_BITS-1)-(size-1)]),.out1Pt3Imag(out1Pt3Imag[(ROT_BITS-1):(ROT_BITS-1)-(size-1)]),
  .out0Pt4Real(out0Pt4Real[(ROT_BITS-1):(ROT_BITS-1)-(size-1)]),.out0Pt4Imag(out0Pt4Imag[(ROT_BITS-1):(ROT_BITS-1)-(size-1)]),
  .out1Pt4Real(out1Pt4Real[(ROT_BITS-1):(ROT_BITS-1)-(size-1)]),.out1Pt4Imag(out1Pt4Imag[(ROT_BITS-1):(ROT_BITS-1)-(size-1)]),
  .out0Pt5Real(out0Pt5Real[(ROT_BITS-1):(ROT_BITS-1)-(size-1)]),.out0Pt5Imag(out0Pt5Imag[(ROT_BITS-1):(ROT_BITS-1)-(size-1)]),
  .out1Pt5Real(out1Pt5Real[(ROT_BITS-1):(ROT_BITS-1)-(size-1)]),.out1Pt5Imag(out1Pt5Imag[(ROT_BITS-1):(ROT_BITS-1)-(size-1)]),
  .out0Pt6Real(out0Pt6Real[(ROT_BITS-1):(ROT_BITS-1)-(size-1)]),.out0Pt6Imag(out0Pt6Imag[(ROT_BITS-1):(ROT_BITS-1)-(size-1)]),
  .out1Pt6Real(out1Pt6Real[(ROT_BITS-1):(ROT_BITS-1)-(size-1)]),.out1Pt6Imag(out1Pt6Imag[(ROT_BITS-1):(ROT_BITS-1)-(size-1)]),
  .out0Pt7Real(out0Pt7Real[(ROT_BITS-1):(ROT_BITS-1)-(size-1)]),.out0Pt7Imag(out0Pt7Imag[(ROT_BITS-1):(ROT_BITS-1)-(size-1)]),
  .out1Pt7Real(out1Pt7Real[(ROT_BITS-1):(ROT_BITS-1)-(size-1)]),.out1Pt7Imag(out1Pt7Imag[(ROT_BITS-1):(ROT_BITS-1)-(size-1)]),
  .out0Pt8Real(out0Pt8Real[(ROT_BITS-1):(ROT_BITS-1)-(size-1)]),.out0Pt8Imag(out0Pt8Imag[(ROT_BITS-1):(ROT_BITS-1)-(size-1)]),
  .out1Pt8Real(out1Pt8Real[(ROT_BITS-1):(ROT_BITS-1)-(size-1)]),.out1Pt8Imag(out1Pt8Imag[(ROT_BITS-1):(ROT_BITS-1)-(size-1)]),
  .out0Pt9Real(out0Pt9Real[(ROT_BITS-1):(ROT_BITS-1)-(size-1)]),.out0Pt9Imag(out0Pt9Imag[(ROT_BITS-1):(ROT_BITS-1)-(size-1)]),
  .out1Pt9Real(out1Pt9Real[(ROT_BITS-1):(ROT_BITS-1)-(size-1)]),.out1Pt9Imag(out1Pt9Imag[(ROT_BITS-1):(ROT_BITS-1)-(size-1)]),
  .out0Pt10Real(out0Pt10Real[(ROT_BITS-1):(ROT_BITS-1)-(size-1)]),.out0Pt10Imag(out0Pt10Imag[(ROT_BITS-1):(ROT_BITS-1)-(size-1)]),
  .out1Pt10Real(out1Pt10Real[(ROT_BITS-1):(ROT_BITS-1)-(size-1)]),.out1Pt10Imag(out1Pt10Imag[(ROT_BITS-1):(ROT_BITS-1)-(size-1)]),
  .out0Pt11Real(out0Pt11Real[(ROT_BITS-1):(ROT_BITS-1)-(size-1)]),.out0Pt11Imag(out0Pt11Imag[(ROT_BITS-1):(ROT_BITS-1)-(size-1)]),
  .out1Pt11Real(out1Pt11Real[(ROT_BITS-1):(ROT_BITS-1)-(size-1)]),.out1Pt11Imag(out1Pt11Imag[(ROT_BITS-1):(ROT_BITS-1)-(size-1)]),
  .out0Pt12Real(out0Pt12Real[(ROT_BITS-1):(ROT_BITS-1)-(size-1)]),.out0Pt12Imag(out0Pt12Imag[(ROT_BITS-1):(ROT_BITS-1)-(size-1)]),
  .out1Pt12Real(out1Pt12Real[(ROT_BITS-1):(ROT_BITS-1)-(size-1)]),.out1Pt12Imag(out1Pt12Imag[(ROT_BITS-1):(ROT_BITS-1)-(size-1)]),
  .out0Pt13Real(out0Pt13Real[(ROT_BITS-1):(ROT_BITS-1)-(size-1)]),.out0Pt13Imag(out0Pt13Imag[(ROT_BITS-1):(ROT_BITS-1)-(size-1)]),
  .out1Pt13Real(out1Pt13Real[(ROT_BITS-1):(ROT_BITS-1)-(size-1)]),.out1Pt13Imag(out1Pt13Imag[(ROT_BITS-1):(ROT_BITS-1)-(size-1)]),
  .out0Pt14Real(out0Pt14Real[(ROT_BITS-1):(ROT_BITS-1)-(size-1)]),.out0Pt14Imag(out0Pt14Imag[(ROT_BITS-1):(ROT_BITS-1)-(size-1)]),
  .out1Pt14Real(out1Pt14Real[(ROT_BITS-1):(ROT_BITS-1)-(size-1)]),.out1Pt14Imag(out1Pt14Imag[(ROT_BITS-1):(ROT_BITS-1)-(size-1)]),
  .out0Pt15Real(out0Pt15Real[(ROT_BITS-1):(ROT_BITS-1)-(size-1)]),.out0Pt15Imag(out0Pt15Imag[(ROT_BITS-1):(ROT_BITS-1)-(size-1)]),
  .out1Pt15Real(out1Pt15Real[(ROT_BITS-1):(ROT_BITS-1)-(size-1)]),.out1Pt15Imag(out1Pt15Imag[(ROT_BITS-1):(ROT_BITS-1)-(size-1)]),
  .out0Pt16Real(out0Pt16Real[(ROT_BITS-1):(ROT_BITS-1)-(size-1)]),.out0Pt16Imag(out0Pt16Imag[(ROT_BITS-1):(ROT_BITS-1)-(size-1)]),
  .out1Pt16Real(out1Pt16Real[(ROT_BITS-1):(ROT_BITS-1)-(size-1)]),.out1Pt16Imag(out1Pt16Imag[(ROT_BITS-1):(ROT_BITS-1)-(size-1)]),
  .out0Pt17Real(out0Pt17Real[(ROT_BITS-1):(ROT_BITS-1)-(size-1)]),.out0Pt17Imag(out0Pt17Imag[(ROT_BITS-1):(ROT_BITS-1)-(size-1)]),
  .out1Pt17Real(out1Pt17Real[(ROT_BITS-1):(ROT_BITS-1)-(size-1)]),.out1Pt17Imag(out1Pt17Imag[(ROT_BITS-1):(ROT_BITS-1)-(size-1)]),
  .out0Pt18Real(out0Pt18Real[(ROT_BITS-1):(ROT_BITS-1)-(size-1)]),.out0Pt18Imag(out0Pt18Imag[(ROT_BITS-1):(ROT_BITS-1)-(size-1)]),
  .out1Pt18Real(out1Pt18Real[(ROT_BITS-1):(ROT_BITS-1)-(size-1)]),.out1Pt18Imag(out1Pt18Imag[(ROT_BITS-1):(ROT_BITS-1)-(size-1)]),
  .out0Pt19Real(out0Pt19Real[(ROT_BITS-1):(ROT_BITS-1)-(size-1)]),.out0Pt19Imag(out0Pt19Imag[(ROT_BITS-1):(ROT_BITS-1)-(size-1)]),
  .out1Pt19Real(out1Pt19Real[(ROT_BITS-1):(ROT_BITS-1)-(size-1)]),.out1Pt19Imag(out1Pt19Imag[(ROT_BITS-1):(ROT_BITS-1)-(size-1)]),
  .out0Pt20Real(out0Pt20Real[(ROT_BITS-1):(ROT_BITS-1)-(size-1)]),.out0Pt20Imag(out0Pt20Imag[(ROT_BITS-1):(ROT_BITS-1)-(size-1)]),
  .out1Pt20Real(out1Pt20Real[(ROT_BITS-1):(ROT_BITS-1)-(size-1)]),.out1Pt20Imag(out1Pt20Imag[(ROT_BITS-1):(ROT_BITS-1)-(size-1)]),
 -----/\----- EXCLUDED -----/\----- */
  .index(index),
  .decision(decision),
  .symEn_tbtDly(symEn_tbtDly),
  .sym2xEn_tbtDly(sym2xEn_tbtDly),
  .phaseError(phaseError),
  .symEn_phErr(symEn_phErr),
  .oneOrZeroPredecessor(oneOrZeroPredecessor)              
  );

`endif


   reg [7:0]            dataBits;
  
   reg                  satPos,satNeg;
   wire                 sign = phaseError[9];

   always @(posedge clk) begin
      //if (symEn | sym2xEn) begin
         dataBits <= {phaseError[5:0], 2'b00};
         satPos <= !sign && (phaseError[9:5] != 5'b00000);
         satNeg <=  sign && (phaseError[9:5] != 5'b11111);
         if (satPos) begin
            phErrShft <= 8'h7f;
         end
         else if (satNeg) begin
            phErrShft <= 8'h81;
         end
         else begin
            phErrShft <= dataBits;
         end
      //end   
   end

   
/******************************************************************************
                               DAC Output Mux
******************************************************************************/

reg             dac0Sync;
reg     [17:0]  dac0Data;
reg             dac1Sync;
reg     [17:0]  dac1Data;
reg             dac2Sync;
reg     [17:0]  dac2Data;
always @(posedge clk) begin
    case (dac0Select) 
        `DAC_TRELLIS_I: begin
            dac0Data <= carrierLoopIOutX2;
            dac0Sync <= sym2xEnDly_mult2;
            end
        `DAC_TRELLIS_Q: begin
            dac0Data <= carrierLoopQOutX2;
            dac0Sync <= sym2xEnDly_mult2;
            end
        `DAC_TRELLIS_PHERR: begin
            dac0Data <= {phErrShft,10'b0};
            dac0Sync <= symEn_phErr;
            end
        `DAC_TRELLIS_INDEX: begin
            dac0Data <= {1'b0,index,12'b0};
            dac0Sync <= symEn_tbtDly;
            end
        default: begin
            dac0Data <= {phErrShft,10'b0};
            dac0Sync <= symEn_phErr;
            end
        endcase

    case (dac1Select) 
        `DAC_TRELLIS_I: begin
            dac1Data <= carrierLoopIOutX2;
            dac1Sync <= sym2xEnDly_mult2;
            end
        `DAC_TRELLIS_Q: begin
            dac1Data <= carrierLoopQOutX2;
            dac1Sync <= sym2xEnDly_mult2;
            end
        `DAC_TRELLIS_PHERR: begin
            dac1Data <= {phErrShft,10'b0};
            dac1Sync <= symEn_phErr;
            end
        `DAC_TRELLIS_INDEX: begin
            dac1Data <= {1'b0,index,12'b0};
            dac1Sync <= symEn_tbtDly;
            end
        default: begin
            dac1Data <= {phErrShft,10'b0};
            dac1Sync <= symEn_phErr;
            end
        endcase

    case (dac2Select) 
        `DAC_TRELLIS_I: begin
            dac2Data <= carrierLoopIOutX2;
            dac2Sync <= sym2xEnDly_mult2;
            end
        `DAC_TRELLIS_Q: begin
            dac2Data <= carrierLoopQOutX2;
            dac2Sync <= sym2xEnDly_mult2;
            end
        `DAC_TRELLIS_PHERR: begin
            dac2Data <= {phErrShft,10'b0};
            dac2Sync <= symEn_phErr;
            end
        `DAC_TRELLIS_INDEX: begin
            dac2Data <= {1'b0,index,12'b0};
            dac2Sync <= symEn_tbtDly;
            end
        default: begin
            dac2Data <= {phErrShft,10'b0};
            dac2Sync <= symEn_phErr;
            end
        endcase

    end

endmodule




module multBy2withSat(clk, symEn, sym2xEn, dIn, dOut, symEnDly, sym2xEnDly);
   
   input                 clk,symEn, sym2xEn; 
   input [17:0]          dIn;
   output [17:0]         dOut;
   output                symEnDly, sym2xEnDly;
      
   reg [17:0]            dataBits;
   reg [17:0]            dOut;//, dOutTmp;
  
   reg                   satPos,satNeg;
   wire                  sign = dIn[17];
   always @(posedge clk) begin
      if (sym2xEn) begin
         dataBits <= {dIn[16:0], 1'b0};
         satPos <= !sign && (dIn[17:16] != 2'b00);
         satNeg <=  sign && (dIn[17:16] != 2'b11);
         //dOut <= dOutTmp;
         if (satPos) begin
            dOut <= 18'h1ffff;
         end
         else if (satNeg) begin
            dOut <= 18'h20001;
         end
         else begin
            dOut <= dataBits;
         end
      end   
   end

   // It works to reuse the symEn without delay because it takes 2 sym2xEn to produce the times 2 output
   // Had to add "dOut <= dOutTmp" to line up the 2 samples per symbol correctly 
   assign symEnDly = symEn;
   assign sym2xEnDly = sym2xEn;
   
endmodule
