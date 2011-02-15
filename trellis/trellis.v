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
wire    [11:0]   freq;
wire    [17:0]  carrierLoopIOut,carrierLoopQOut;
`ifdef BYPASS_TRELLIS_CARRIER_LOOP
assign freq = 0;
assign carrierLoopIOut = iIn;
assign carrierLoopQOut = qIn;
assign trellisLoopDout = 0;
wire symEnDly = symEn;
wire sym2xEnDly = sym2xEn;
`else
wire    [31:0]  trellisLoopDout;
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
  .phaseErrorIn(phErrShft),
  `endif
  .symEn_phErr(symEn_phErr),
  .wr0(wr0),
  .wr1(wr1),
  .wr2(wr2),
  .wr3(wr3),
  .addr(addr),
  .din(din),
  .dout(trellisLoopDout),
  .iOut(carrierLoopIOut),
  .qOut(carrierLoopQOut),
  .symEnDly(symEnDly),
  .sym2xEnDly(sym2xEnDly),
  .freq(freq)
  );
`endif

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


//`define NEW_HDETECTOR
`ifdef NEW_HDETECTOR

wire    [11:0]  cordicPhase;
reg     [11:0]  prevPhase;
reg     [11:0]  phaseDiff;
reg     [11:0]  absPhaseDiff;
reg             cordicEn;

vm_cordic mfPhase(
    .clk(clk),
    .ena(rotEna),
    .x(f0I[17:4]),
    .y(f0Q[17:4]),
    .p(cordicPhase)
    );

always @(posedge clk) begin
    if (rotEna) begin
        prevPhase <= cordicPhase;
        absPhaseDiff <= phaseDiff[11] ? -phaseDiff : phaseDiff;
        phaseDiff <= prevPhase - cordicPhase;
        end
    end
wire    [15:0]  fskDeviation;
reg     [18:0]  avgDeviation;
always @(posedge clk) begin
    if (reset) begin
        avgDeviation <= 0;
        end
    if (rotEna && absPhaseDiff[10]) begin
        avgDeviation <= (avgDeviation - {{7{avgDeviation[18]}},avgDeviation[18:7]})
                        + {{7{absPhaseDiff[11]}},absPhaseDiff};
        end
    end
assign fskDeviation = avgDeviation[18:3] + avgDeviation[2];

   
`ifdef SIMULATE
real diffReal;
always @(absPhaseDiff) diffReal = (absPhaseDiff[11] ? absPhaseDiff - 4096.0 : absPhaseDiff)/2048.0;
real devReal;
always @(fskDeviation) devReal = (fskDeviation[15] ? fskDeviation - 65536.0 : fskDeviation)/32768.0;
`endif
`endif

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
`ifdef USE_DECAY
reg     [7:0]   decayFactor;
`endif
wire [4:0] indexDelta;
viterbi_top #(size, ROT_BITS)viterbi_top
  (
  .clk(clk), .reset(reset), .symEn(trellEna),
  `ifdef USE_DECAY
  .decayFactor(decayFactor),
  `endif
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
  .indexDelta(indexDelta),
  .symEn_index(symEn_index),
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

//`define INDEX_AVG
`ifdef INDEX_AVG
wire    [4:0]           index0;
wire    [ROT_BITS-1:0]  maxVal0;
maxMetric #(ROT_BITS) maxMetric0 (
    .clk(clk), 
    .reset(reset), 
    .symEn(trellEna), 
    .accMetOut0( out0Pt1Real ), .accMetOut1( out0Pt2Real ), 
    .accMetOut2( out0Pt3Real ), .accMetOut3( out0Pt4Real ), 
    .accMetOut4( out0Pt5Real ), .accMetOut5( out0Pt6Real ), 
    .accMetOut6( out0Pt7Real ), .accMetOut7( out0Pt8Real ), 
    .accMetOut8( out0Pt9Real ), .accMetOut9( out0Pt10Real), 
    .accMetOut10(out0Pt11Real), .accMetOut11(out0Pt12Real), 
    .accMetOut12(out0Pt13Real), .accMetOut13(out0Pt14Real), 
    .accMetOut14(out0Pt15Real), .accMetOut15(out0Pt16Real), 
    .accMetOut16(out0Pt17Real), .accMetOut17(out0Pt18Real), 
    .accMetOut18(out0Pt19Real), .accMetOut19(out0Pt20Real),
    .maxVal(maxVal0),
    .index(index0), .symEnDly(maxEn)
    );

wire    [4:0]           index1;
wire    [ROT_BITS-1:0]  maxVal1;
maxMetric #(ROT_BITS) maxMetric1 (
    .clk(clk), 
    .reset(reset), 
    .symEn(trellEna), 
    .accMetOut0( out1Pt1Real ), .accMetOut1( out1Pt2Real ), 
    .accMetOut2( out1Pt3Real ), .accMetOut3( out1Pt4Real ), 
    .accMetOut4( out1Pt5Real ), .accMetOut5( out1Pt6Real ), 
    .accMetOut6( out1Pt7Real ), .accMetOut7( out1Pt8Real ), 
    .accMetOut8( out1Pt9Real ), .accMetOut9( out1Pt10Real), 
    .accMetOut10(out1Pt11Real), .accMetOut11(out1Pt12Real), 
    .accMetOut12(out1Pt13Real), .accMetOut13(out1Pt14Real), 
    .accMetOut14(out1Pt15Real), .accMetOut15(out1Pt16Real), 
    .accMetOut16(out1Pt17Real), .accMetOut17(out1Pt18Real), 
    .accMetOut18(out1Pt19Real), .accMetOut19(out1Pt20Real),
    .maxVal(maxVal1),
    .index(index1), .symEnDly()
    );

reg     [4:0]   prevIndex;
reg     [4:0]   maxIndex;
wire    [5:0]   idxDiff = {1'b0,prevIndex} - {1'b0,index0};
reg     [5:0]   idxDelta;
always @(posedge clk) begin
    if (maxEn) begin
        case ({maxVal0[ROT_BITS-1], maxVal1[ROT_BITS-1]}) // Checking the sign bit 
            2'b00: begin // both pos
                if (maxVal0 > maxVal1) maxIndex <= index0;
                else maxIndex <= index1;
           end
           2'b01: begin // a=pos, b=neg
                maxIndex <= index0;
           end
           2'b10: begin // a=neg, b=pos
                maxIndex <= index1;
           end
           2'b11: begin //both neg
                if (maxVal0 > maxVal1) maxIndex <= index0;
                else maxIndex <= index1;
           end
         endcase
            
        prevIndex <= index0;
        if (idxDiff[5]) begin
            if (idxDiff < 6'h37) begin
                idxDelta <= idxDiff + 6'h14;
                end
            else begin
                idxDelta <= idxDiff;
                end
            end
        else begin
            if (idxDiff > 6'h09) begin
                idxDelta <= idxDiff - 6'h14;
                end
            else begin
                idxDelta <= idxDiff;
                end
            end
        end
    end

`ifdef SIMULATE
real delta;
always @(idxDelta) delta = idxDelta[5] ? idxDelta - 64.0 : idxDelta;
real avgPosDelta;
real avgNegDelta;
real avgDelta;
always @(posedge clk) begin
    if (reset) begin
        avgPosDelta <= 0.0;
        avgNegDelta <= 0.0;
        end
    else if (maxEn) begin
        if (idxDelta[5]) begin
            avgNegDelta <= (0.99 * avgNegDelta) + (0.01 * delta);
            avgDelta <= (0.99 * avgDelta) + (0.01 * (-delta));
            end
        else begin
            avgPosDelta <= (0.99 * avgPosDelta) + (0.01 * delta);
            avgDelta <= (0.99 * avgDelta) + (0.01 * delta);
            end
        end
    end
`endif
`endif


`define ESTIMATE_BER
`ifdef ESTIMATE_BER
// Create a delayed version of the legacy bit to compare to the decision bit as
// an estimate of the SNR
reg     [31:0]  legacySR;
always @(posedge clk) begin
    if (symEn) begin
        legacySR <= {legacySR[30:0],legacyBit};
        end
    end
bitFifo bitFifo(
    .clk(clk),
    .reset(reset),      
    .enIn(symEn),
    .enOut(symEnOut),
    .din(legacySR[13]),
    .dout(legacyDelayed)
    );

reg     [15:0]  bitCount;
reg     [15:0]  bitErrorCount;
reg             berRestart;
reg             br0,br1;
reg             berRestarted;
always @(posedge clk) begin 
    br0 <= berRestart;
    br1 <= br0;
    if (reset | br1) begin
        bitCount <= 16'hffff;
        bitErrorCount <= 0;
        berRestarted <= 1;
        end
    else if ((symEnOut) && (bitCount != 0)) begin
        berRestarted <= 0;
        bitCount <= bitCount - 1;
        if (legacyDelayed != decision) begin
            bitErrorCount <= bitErrorCount + 1;
            end
        end
    end
`endif

`endif //IQ_MAG
   
/************************ Trellis Register Definitions ************************/

reg trellisSpace;
always @(addr) begin
    casex(addr)
        `TRELLIS_SPACE: trellisSpace <= 1;
        default:        trellisSpace <= 0;
        endcase
    end

`ifdef USE_DECAY
always @(negedge wr0) begin
    if (trellisSpace) begin
        casex (addr) 
            `TRELLIS_DECAY:     decayFactor <= din[7:0];
            default: ;
            endcase
        end
    end
`endif

always @(negedge wr2 or posedge berRestarted) begin
    if (berRestarted) begin
        berRestart <= 0;
        end
    else if (trellisSpace) begin
        berRestart <= 1;
        end
    end

reg [31:0]trellisDout;
always @(trellisSpace or addr or 
         bitErrorCount or bitCount
         `ifdef HNEW_DETECTOR
         or fskDeviation
         `endif
         `ifdef USE_DECAY
         or decayFactor
         `endif
         ) begin
    if (trellisSpace) begin
        casex (addr)
            `TRELLIS_BER:       trellisDout <= {bitErrorCount,bitCount};
            `ifdef HNEW_DETECTOR
            `TRELLIS_DEV:       trellisDout <= {16'b0,fskDeviation};
            `endif
            `ifdef USE_DECAY
            `TRELLIS_DECAY:     trellisDout <= {24'b0,decayFactor};
            `endif
            default:            trellisDout <= 32'hx;
            endcase
        end
    else begin
        trellisDout <= 32'hx;
        end
    end

reg [31:0]dout;
always @(addr or 
         bitErrorCount or bitCount or
         trellisDout or trellisLoopDout
         ) begin
    casex (addr)
        `TRELLIS_SPACE:     dout <= trellisDout;
        `TRELLISLFSPACE:    dout <= trellisLoopDout;
        default:            dout <= 32'hx;
        endcase
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
            dac0Data <= {indexDelta,13'b0};
            dac0Sync <= symEn_index;
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
            dac1Data <= {freq,6'b0};
            dac1Sync <= sym2xEnDly;
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
            dac2Data <= {1'b0,index,12'b0};
            dac2Sync <= symEnOut;
            end
        default: begin
            dac2Data <= {phErrShft,10'b0};
            dac2Sync <= symEn_phErr;
            end
        endcase

    end

endmodule




