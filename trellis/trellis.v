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
    legacyBit,
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
    symEnOut,
    sym2xEnOut,
    oneOrZeroPredecessor
    );

parameter size = 8;
parameter ROT_BITS = 10;

input           clk,reset,symEn,sym2xEn;
input   [17:0]  iIn,qIn;
input           legacyBit;
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
output          symEnOut;
output          sym2xEnOut;
output          oneOrZeroPredecessor;
   
   
wire                    decision;

wire            symEn_phErr;
reg     [7:0]   phErrShft;
`ifdef USE_LEAKY
wire    [ROT_BITS-1:0]   phaseErrorReal;
wire    [7:0]   phaseError;
`endif
wire    [ROT_BITS-1:0]   phaseErrorImag;
wire    [7:0]   freq;
wire    [17:0]  carrierLoopIOut,carrierLoopQOut;
trellisCarrierLoop trellisCarrierLoop(
  .clk(clk),
  .reset(reset),
  .symEn(symEn),
  .sym2xEn(sym2xEn),
  .iIn(iIn),
  .qIn(qIn),
  .legacyBit(legacyBit),
  `ifdef USE_LEAKY
  .phaseErrorReal(phaseErrorReal),
  .phaseErrorImag(phaseErrorImag),
  .enableLoop(enableLoop),
  .phaseError(phaseError),
  `else
  .phaseError(phErrShft),
  `endif
  .symEn_phErr(symEn_phErr),
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
  .sym2xEnDly(sym2xEnDly),
  .freq(freq)
  );

`ifdef SIMULATE
`ifdef USE_LEAKY
real errorRealReal;
real errorImagReal;
always @(phaseErrorReal) errorRealReal = (phaseErrorReal[9] ? phaseErrorReal - 1024.0 : phaseErrorReal)/512.0;
always @(phaseErrorImag) errorImagReal = (phaseErrorImag[9] ? phaseErrorImag - 1024.0 : phaseErrorImag)/512.0;
`else
real phErrReal;
always @(phErrShft) phErrReal = (phErrShft[7] ? phErrShft - 256.0 : phErrShft);
`endif
`endif


// there are two samples per symbol and their coefficients order below is
// 0 real, 0 imag, 1 real, 1 imag

wire [17:0]f0I,f0Q;
mfilter #(18'h1B48C,18'h10B85,18'h3D7D4,18'h1FE6B) f0(clk,reset,symEnDly,sym2xEnDly,carrierLoopIOut,carrierLoopQOut,f0I,f0Q);
//mfilter #(18'h1B48C,18'h10B85,18'h3D7D4,18'h1FE6B) f0(clk,reset,symEn,sym2xEn,iIn,qIn,f0I,f0Q);

wire [17:0]f1I,f1Q;
mfilter #(18'h1B48C,18'h2F47B,18'h3D7D4,18'h20195) f1(clk,reset,symEnDly,sym2xEnDly,carrierLoopIOut,carrierLoopQOut,f1I,f1Q);
//mfilter #(18'h1B48C,18'h2F47B,18'h3D7D4,18'h20195) f1(clk,reset,symEn,sym2xEn,iIn,qIn,f1I,f1Q);

reg [15:0]symEnShift;
always @(posedge clk)symEnShift <= {symEnShift[14:0],(sym2xEnDly && !symEnDly)};
//always @(posedge clk)symEnShift <= {symEnShift[14:0],(sym2xEn && !symEn)};

wire rotEna = symEnShift[4];
//wire trellEna = symEnShift[14];
wire trellEna = symEnShift[10];

reg [15:0]sym2xEnShift;
always @(posedge clk)sym2xEnShift <= {sym2xEnShift[14:0],sym2xEnDly};
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
reg magDecision;
reg [6:0]mdSR;
always @(posedge clk) begin
    if (rotEna) begin
        mag0 <= (f0IReal*f0IReal) + (f0QReal*f0QReal);
        mag1 <= (f1IReal*f1IReal) + (f1QReal*f1QReal);
        if (mag0 < mag1) begin
            mdSR <= {mdSR[5:0],1'b1};
            end
        else begin
            mdSR <= {mdSR[5:0],1'b0};
            end
        end                        
    if (trellEna) begin
        magDecision <= mdSR[6];
        end
    end
`endif

`ifdef IQ_MAG
assign symEnOut = rotEna;
assign sym2xEnOut = 0;  // need to allign
wire    [4:0]   index = 0;
assign          symEn_phErr = 1;
wire            trellEna = 1;
always @(posedge clk) begin 
    phErrShft <= 0;
    end


iqMagEst iqMagEst
  ( 
    .clk(clk), .reset(reset), .syncIn(rotEna),
    //.iIn_0(f0I),
    //.qIn_0(f0Q),
    //.iIn_1(f1I),
    //.qIn_1(f1Q),
    .iIn_0({out0Pt10Real,8'b0}),
    .qIn_0({out0Pt10Imag,8'b0}),
    .iIn_1({out1Pt10Real,8'b0}),
    .qIn_1({out1Pt10Imag,8'b0}),
    .decision(decision)
    );

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

`ifdef VITERBI_ANNOTATE
reg [ROT_BITS-1:0]
  out0Pt1RealDly,out1Pt1RealDly,          out0Pt1ImagDly,out1Pt1ImagDly,
  out0Pt2RealDly,out1Pt2RealDly,          out0Pt2ImagDly,out1Pt2ImagDly,
  out0Pt3RealDly,out1Pt3RealDly,          out0Pt3ImagDly,out1Pt3ImagDly,
  out0Pt4RealDly,out1Pt4RealDly,          out0Pt4ImagDly,out1Pt4ImagDly,
  out0Pt5RealDly,out1Pt5RealDly,          out0Pt5ImagDly,out1Pt5ImagDly,
  out0Pt6RealDly,out1Pt6RealDly,          out0Pt6ImagDly,out1Pt6ImagDly,
  out0Pt7RealDly,out1Pt7RealDly,          out0Pt7ImagDly,out1Pt7ImagDly,
  out0Pt8RealDly,out1Pt8RealDly,          out0Pt8ImagDly,out1Pt8ImagDly,
  out0Pt9RealDly,out1Pt9RealDly,          out0Pt9ImagDly,out1Pt9ImagDly,
  out0Pt10RealDly,out1Pt10RealDly,        out0Pt10ImagDly,out1Pt10ImagDly,
  out0Pt11RealDly,out1Pt11RealDly,        out0Pt11ImagDly,out1Pt11ImagDly,
  out0Pt12RealDly,out1Pt12RealDly,        out0Pt12ImagDly,out1Pt12ImagDly,
  out0Pt13RealDly,out1Pt13RealDly,        out0Pt13ImagDly,out1Pt13ImagDly,
  out0Pt14RealDly,out1Pt14RealDly,        out0Pt14ImagDly,out1Pt14ImagDly,
  out0Pt15RealDly,out1Pt15RealDly,        out0Pt15ImagDly,out1Pt15ImagDly,
  out0Pt16RealDly,out1Pt16RealDly,        out0Pt16ImagDly,out1Pt16ImagDly,
  out0Pt17RealDly,out1Pt17RealDly,        out0Pt17ImagDly,out1Pt17ImagDly,
  out0Pt18RealDly,out1Pt18RealDly,        out0Pt18ImagDly,out1Pt18ImagDly,
  out0Pt19RealDly,out1Pt19RealDly,        out0Pt19ImagDly,out1Pt19ImagDly,
  out0Pt20RealDly,out1Pt20RealDly,        out0Pt20ImagDly,out1Pt20ImagDly;

always @(negedge clk) begin
    trellEnaDly <= trellEna;
    out0Pt1RealDly <= out0Pt1Real;
    out1Pt1RealDly <= out1Pt1Real;
    out0Pt1ImagDly <= out0Pt1Imag;
    out1Pt1ImagDly <= out1Pt1Imag;
    out0Pt2RealDly <= out0Pt2Real;
    out1Pt2RealDly <= out1Pt2Real;
    out0Pt2ImagDly <= out0Pt2Imag;
    out1Pt2ImagDly <= out1Pt2Imag;
    out0Pt3RealDly <= out0Pt3Real;
    out1Pt3RealDly <= out1Pt3Real;
    out0Pt3ImagDly <= out0Pt3Imag;
    out1Pt3ImagDly <= out1Pt3Imag;
    out0Pt4RealDly <= out0Pt4Real;
    out1Pt4RealDly <= out1Pt4Real;
    out0Pt4ImagDly <= out0Pt4Imag;
    out1Pt4ImagDly <= out1Pt4Imag;
    out0Pt5RealDly <= out0Pt5Real;
    out1Pt5RealDly <= out1Pt5Real;
    out0Pt5ImagDly <= out0Pt5Imag;
    out1Pt5ImagDly <= out1Pt5Imag;
    out0Pt6RealDly <= out0Pt6Real;
    out1Pt6RealDly <= out1Pt6Real;
    out0Pt6ImagDly <= out0Pt6Imag;
    out1Pt6ImagDly <= out1Pt6Imag;
    out0Pt7RealDly <= out0Pt7Real;
    out1Pt7RealDly <= out1Pt7Real;
    out0Pt7ImagDly <= out0Pt7Imag;
    out1Pt7ImagDly <= out1Pt7Imag;
    out0Pt8RealDly <= out0Pt8Real;
    out1Pt8RealDly <= out1Pt8Real;
    out0Pt8ImagDly <= out0Pt8Imag;
    out1Pt8ImagDly <= out1Pt8Imag;
    out0Pt9RealDly <= out0Pt9Real;
    out1Pt9RealDly <= out1Pt9Real;
    out0Pt9ImagDly <= out0Pt9Imag;
    out1Pt9ImagDly <= out1Pt9Imag;
    out0Pt10RealDly <= out0Pt10Real;
    out1Pt10RealDly <= out1Pt10Real;
    out0Pt10ImagDly <= out0Pt10Imag;
    out1Pt10ImagDly <= out1Pt10Imag;
    out0Pt11RealDly <= out0Pt11Real;
    out1Pt11RealDly <= out1Pt11Real;
    out0Pt11ImagDly <= out0Pt11Imag;
    out1Pt11ImagDly <= out1Pt11Imag;
    out0Pt12RealDly <= out0Pt12Real;
    out1Pt12RealDly <= out1Pt12Real;
    out0Pt12ImagDly <= out0Pt12Imag;
    out1Pt12ImagDly <= out1Pt12Imag;
    out0Pt13RealDly <= out0Pt13Real;
    out1Pt13RealDly <= out1Pt13Real;
    out0Pt13ImagDly <= out0Pt13Imag;
    out1Pt13ImagDly <= out1Pt13Imag;
    out0Pt14RealDly <= out0Pt14Real;
    out1Pt14RealDly <= out1Pt14Real;
    out0Pt14ImagDly <= out0Pt14Imag;
    out1Pt14ImagDly <= out1Pt14Imag;
    out0Pt15RealDly <= out0Pt15Real;
    out1Pt15RealDly <= out1Pt15Real;
    out0Pt15ImagDly <= out0Pt15Imag;
    out1Pt15ImagDly <= out1Pt15Imag;
    out0Pt16RealDly <= out0Pt16Real;
    out1Pt16RealDly <= out1Pt16Real;
    out0Pt16ImagDly <= out0Pt16Imag;
    out1Pt16ImagDly <= out1Pt16Imag;
    out0Pt17RealDly <= out0Pt17Real;
    out1Pt17RealDly <= out1Pt17Real;
    out0Pt17ImagDly <= out0Pt17Imag;
    out1Pt17ImagDly <= out1Pt17Imag;
    out0Pt18RealDly <= out0Pt18Real;
    out1Pt18RealDly <= out1Pt18Real;
    out0Pt18ImagDly <= out0Pt18Imag;
    out1Pt18ImagDly <= out1Pt18Imag;
    out0Pt19RealDly <= out0Pt19Real;
    out1Pt19RealDly <= out1Pt19Real;
    out0Pt19ImagDly <= out0Pt19Imag;
    out1Pt19ImagDly <= out1Pt19Imag;
    out0Pt20RealDly <= out0Pt20Real;
    out1Pt20RealDly <= out1Pt20Real;
    out0Pt20ImagDly <= out0Pt20Imag;
    out1Pt20ImagDly <= out1Pt20Imag;
    end
viterbi_top viterbi_top
  (
  .clk(clk), .reset(reset), .symEn(trellEna), 
  .out0Pt1Real(out0Pt1Real)    ,.out0Pt1Imag(out0Pt1Imag),
  .out1Pt1Real(out1Pt1Real)    ,.out1Pt1Imag(out1Pt1Imag),
  .out0Pt2Real(out0Pt2Real)    ,.out0Pt2Imag(out0Pt2Imag),
  .out1Pt2Real(out1Pt2Real)    ,.out1Pt2Imag(out1Pt2Imag),
  .out0Pt3Real(out0Pt3Real)    ,.out0Pt3Imag(out0Pt3Imag),
  .out1Pt3Real(out1Pt3Real)    ,.out1Pt3Imag(out1Pt3Imag),
  .out0Pt4Real(out0Pt4Real)    ,.out0Pt4Imag(out0Pt4Imag),
  .out1Pt4Real(out1Pt4Real)    ,.out1Pt4Imag(out1Pt4Imag),
  .out0Pt5Real(out0Pt5Real)    ,.out0Pt5Imag(out0Pt5Imag),
  .out1Pt5Real(out1Pt5Real)    ,.out1Pt5Imag(out1Pt5Imag),
  .out0Pt6Real(out0Pt6Real)    ,.out0Pt6Imag(out0Pt6Imag),
  .out1Pt6Real(out1Pt6Real)    ,.out1Pt6Imag(out1Pt6Imag),
  .out0Pt7Real(out0Pt7Real)    ,.out0Pt7Imag(out0Pt7Imag),
  .out1Pt7Real(out1Pt7Real)    ,.out1Pt7Imag(out1Pt7Imag),
  .out0Pt8Real(out0Pt8Real)    ,.out0Pt8Imag(out0Pt8Imag),
  .out1Pt8Real(out1Pt8Real)    ,.out1Pt8Imag(out1Pt8Imag),
  .out0Pt9Real(out0Pt9Real)    ,.out0Pt9Imag(out0Pt9Imag),
  .out1Pt9Real(out1Pt9Real)    ,.out1Pt9Imag(out1Pt9Imag),
  .out0Pt10Real(out0Pt10Real),.out0Pt10Imag(out0Pt10Imag),
  .out1Pt10Real(out1Pt10Real),.out1Pt10Imag(out1Pt10Imag),
  .out0Pt11Real(out0Pt11Real),.out0Pt11Imag(out0Pt11Imag),
  .out1Pt11Real(out1Pt11Real),.out1Pt11Imag(out1Pt11Imag),
  .out0Pt12Real(out0Pt12Real),.out0Pt12Imag(out0Pt12Imag),
  .out1Pt12Real(out1Pt12Real),.out1Pt12Imag(out1Pt12Imag),
  .out0Pt13Real(out0Pt13Real),.out0Pt13Imag(out0Pt13Imag),
  .out1Pt13Real(out1Pt13Real),.out1Pt13Imag(out1Pt13Imag),
  .out0Pt14Real(out0Pt14Real),.out0Pt14Imag(out0Pt14Imag),
  .out1Pt14Real(out1Pt14Real),.out1Pt14Imag(out1Pt14Imag),
  .out0Pt15Real(out0Pt15Real),.out0Pt15Imag(out0Pt15Imag),
  .out1Pt15Real(out1Pt15Real),.out1Pt15Imag(out1Pt15Imag),
  .out0Pt16Real(out0Pt16Real),.out0Pt16Imag(out0Pt16Imag),
  .out1Pt16Real(out1Pt16Real),.out1Pt16Imag(out1Pt16Imag),
  .out0Pt17Real(out0Pt17Real),.out0Pt17Imag(out0Pt17Imag),
  .out1Pt17Real(out1Pt17Real),.out1Pt17Imag(out1Pt17Imag),
  .out0Pt18Real(out0Pt18Real),.out0Pt18Imag(out0Pt18Imag),
  .out1Pt18Real(out1Pt18Real),.out1Pt18Imag(out1Pt18Imag),
  .out0Pt19Real(out0Pt19Real),.out0Pt19Imag(out0Pt19Imag),
  .out1Pt19Real(out1Pt19Real),.out1Pt19Imag(out1Pt19Imag),
  .out0Pt20Real(out0Pt20Real),.out0Pt20Imag(out0Pt20Imag),
  .out1Pt20Real(out1Pt20Real),.out1Pt20Imag(out1Pt20Imag),
`else
viterbi_top #(size, ROT_BITS)viterbi_top
  (
  .clk(clk), .reset(reset), .symEn(trellEna),
  .out0Pt1Real(out0Pt1Real)    ,.out0Pt1Imag(out0Pt1Imag),
  .out1Pt1Real(out1Pt1Real)    ,.out1Pt1Imag(out1Pt1Imag),
  .out0Pt2Real(out0Pt2Real)    ,.out0Pt2Imag(out0Pt2Imag),
  .out1Pt2Real(out1Pt2Real)    ,.out1Pt2Imag(out1Pt2Imag),
  .out0Pt3Real(out0Pt3Real)    ,.out0Pt3Imag(out0Pt3Imag),
  .out1Pt3Real(out1Pt3Real)    ,.out1Pt3Imag(out1Pt3Imag),
  .out0Pt4Real(out0Pt4Real)    ,.out0Pt4Imag(out0Pt4Imag),
  .out1Pt4Real(out1Pt4Real)    ,.out1Pt4Imag(out1Pt4Imag),
  .out0Pt5Real(out0Pt5Real)    ,.out0Pt5Imag(out0Pt5Imag),
  .out1Pt5Real(out1Pt5Real)    ,.out1Pt5Imag(out1Pt5Imag),
  .out0Pt6Real(out0Pt6Real)    ,.out0Pt6Imag(out0Pt6Imag),
  .out1Pt6Real(out1Pt6Real)    ,.out1Pt6Imag(out1Pt6Imag),
  .out0Pt7Real(out0Pt7Real)    ,.out0Pt7Imag(out0Pt7Imag),
  .out1Pt7Real(out1Pt7Real)    ,.out1Pt7Imag(out1Pt7Imag),
  .out0Pt8Real(out0Pt8Real)    ,.out0Pt8Imag(out0Pt8Imag),
  .out1Pt8Real(out1Pt8Real)    ,.out1Pt8Imag(out1Pt8Imag),
  .out0Pt9Real(out0Pt9Real)    ,.out0Pt9Imag(out0Pt9Imag),
  .out1Pt9Real(out1Pt9Real)    ,.out1Pt9Imag(out1Pt9Imag),
  .out0Pt10Real(out0Pt10Real),.out0Pt10Imag(out0Pt10Imag),
  .out1Pt10Real(out1Pt10Real),.out1Pt10Imag(out1Pt10Imag),
  .out0Pt11Real(out0Pt11Real),.out0Pt11Imag(out0Pt11Imag),
  .out1Pt11Real(out1Pt11Real),.out1Pt11Imag(out1Pt11Imag),
  .out0Pt12Real(out0Pt12Real),.out0Pt12Imag(out0Pt12Imag),
  .out1Pt12Real(out1Pt12Real),.out1Pt12Imag(out1Pt12Imag),
  .out0Pt13Real(out0Pt13Real),.out0Pt13Imag(out0Pt13Imag),
  .out1Pt13Real(out1Pt13Real),.out1Pt13Imag(out1Pt13Imag),
  .out0Pt14Real(out0Pt14Real),.out0Pt14Imag(out0Pt14Imag),
  .out1Pt14Real(out1Pt14Real),.out1Pt14Imag(out1Pt14Imag),
  .out0Pt15Real(out0Pt15Real),.out0Pt15Imag(out0Pt15Imag),
  .out1Pt15Real(out1Pt15Real),.out1Pt15Imag(out1Pt15Imag),
  .out0Pt16Real(out0Pt16Real),.out0Pt16Imag(out0Pt16Imag),
  .out1Pt16Real(out1Pt16Real),.out1Pt16Imag(out1Pt16Imag),
  .out0Pt17Real(out0Pt17Real),.out0Pt17Imag(out0Pt17Imag),
  .out1Pt17Real(out1Pt17Real),.out1Pt17Imag(out1Pt17Imag),
  .out0Pt18Real(out0Pt18Real),.out0Pt18Imag(out0Pt18Imag),
  .out1Pt18Real(out1Pt18Real),.out1Pt18Imag(out1Pt18Imag),
  .out0Pt19Real(out0Pt19Real),.out0Pt19Imag(out0Pt19Imag),
  .out1Pt19Real(out1Pt19Real),.out1Pt19Imag(out1Pt19Imag),
  .out0Pt20Real(out0Pt20Real),.out0Pt20Imag(out0Pt20Imag),
  .out1Pt20Real(out1Pt20Real),.out1Pt20Imag(out1Pt20Imag),
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
`endif
  .index(index),
  .decision(decision),
  .symEn_tbtDly(symEnOut),
  `ifdef USE_LEAKY
  .phaseErrorReal(phaseErrorReal),
  `endif
  .phaseErrorImag(phaseErrorImag),
  .symEn_phErr(symEn_phErr),
  .oneOrZeroPredecessor(oneOrZeroPredecessor)              
  );


// This is a kludge to create a 2x clock enable from the 1x clock enable to satisfy the design
// of the pre-existing line decoder. This design assumes at least 3 clocks between each 1x clock
// enable.
reg se0,sym2xEnOut;
always @(posedge clk) begin
    se0 <= symEnOut;
    sym2xEnOut <= se0 | symEnOut;
    end


reg     [7:0]   dataBits;
reg             satPos,satNeg;
wire            sign = phaseErrorImag[9];

always @(posedge clk) begin
    if (symEn_phErr) begin
        dataBits <= phaseErrorImag[7:0];
        satPos <= !sign && (phaseErrorImag[8:7] != 2'b00);
        satNeg <=  sign && (phaseErrorImag[8:7] != 2'b11);
        if (satPos) begin
            phErrShft <= 8'h7f;
        end else if (satNeg) begin
            phErrShft <= 8'h81;
        end else begin
            phErrShft <= dataBits;
        end
    end   
end



`endif //IQ_MAG
   
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
            dac0Data <= carrierLoopIOut;
            dac0Sync <= sym2xEnDly;
            end
        `DAC_TRELLIS_Q: begin
            dac0Data <= carrierLoopQOut;
            dac0Sync <= sym2xEnDly;
            end
        `DAC_TRELLIS_PHERR: begin
            `ifdef USE_LEAKY
            dac0Data <= {phaseErrorReal,8'b0};
            `else
            dac0Data <= {phErrShft,10'b0};
            `endif
            dac0Sync <= symEn_phErr;
            end
        `DAC_TRELLIS_INDEX: begin
            dac0Data <= {1'b0,index,12'b0};
            dac0Sync <= trellEna;
            end
        default: begin
            dac0Data <= {phErrShft,10'b0};
            dac0Sync <= symEn_phErr;
            end
        endcase

    case (dac1Select) 
        `DAC_TRELLIS_I: begin
            dac1Data <= carrierLoopIOut;
            dac1Sync <= sym2xEnDly;
            end
        `DAC_TRELLIS_Q: begin
            dac1Data <= carrierLoopQOut;
            dac1Sync <= sym2xEnDly;
            end
        `DAC_TRELLIS_PHERR: begin
            `ifdef USE_LEAKY
            dac1Data <= {phaseErrorImag,8'b0};
            `else
            dac1Data <= {phErrShft,10'b0};
            `endif
            dac1Sync <= symEn_phErr;
            end
        `DAC_TRELLIS_INDEX: begin
            dac2Data <= {freq,10'b0};
            dac2Sync <= sym2xEnDly;
            end
        default: begin
            dac1Data <= {phErrShft,10'b0};
            dac1Sync <= symEn_phErr;
            end
        endcase

    case (dac2Select) 
        `DAC_TRELLIS_I: begin
            dac2Data <= carrierLoopIOut;
            dac2Sync <= sym2xEnDly;
            end
        `DAC_TRELLIS_Q: begin
            dac2Data <= carrierLoopQOut;
            dac2Sync <= sym2xEnDly;
            end
        `DAC_TRELLIS_PHERR: begin
            `ifdef USE_LEAKY
            dac2Data <= {phaseError,10'b0};
            `else
            dac2Data <= {phErrShft,10'b0};
            `endif
            dac2Sync <= symEn_phErr;
            end
        `DAC_TRELLIS_INDEX: begin
            dac2Data <= {phErrShft,10'b0};
            dac2Sync <= symEn_phErr;
            end
        default: begin
            dac2Data <= {phErrShft,10'b0};
            dac2Sync <= symEn_phErr;
            end
        endcase

    end

endmodule




