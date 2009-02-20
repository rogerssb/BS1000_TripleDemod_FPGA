`timescale 1ns / 10 ps
`include ".\addressMap.v"

module ddc( clk, reset, syncIn, 
            wr0,wr1,wr2,wr3,
            addr,
            din,
            dout,
            ddcFreqOffset,
            offsetEn,
            nbAgcGain,
            syncOut,
            iIn, qIn, 
            iOut, qOut);

input           clk;
input           reset;
input           syncIn;
input           wr0,wr1,wr2,wr3;
input   [11:0]  addr;
input   [31:0]  din;
output  [31:0]  dout;
input   [31:0]  ddcFreqOffset;
input           offsetEn;
input   [20:0]  nbAgcGain;
output          syncOut;
input   [17:0]  iIn;
input   [17:0]  qIn;
output  [17:0]  iOut;
output  [17:0]  qOut;


// Microprocessor interface
reg ddcSpace;
always @(addr) begin
    casex(addr)
        `DDCSPACE: ddcSpace <= 1;
        default:   ddcSpace <= 0;
        endcase
    end
wire [31:0]ddcCenterFreq;
wire [31:0]ddcDout;
ddcRegs micro(
    .addr(addr),
    .dataIn(din),
    .dataOut(ddcDout),
    .cs(ddcSpace),
    .wr0(wr0), .wr1(wr1), .wr2(wr2), .wr3(wr3),
    .bypassCic(bypassCic),
    .bypassHb(bypassHb),
    .ddcCenterFreq(ddcCenterFreq)
    );


// Create the LO frequency
reg [31:0] ddcFreq;
reg [31:0] newOffset;
always @(posedge clk) begin
    if (reset) begin
        newOffset <= 0;
        end
    if (offsetEn) begin
        newOffset <= ddcFreqOffset;
        end
    ddcFreq <= ddcFreqOffset - ddcCenterFreq;
    end


// LO Generator
wire    [17:0]iDds;
wire    [17:0]qDds;
dds dds ( 
    .sclr(reset), 
    .clk(clk), 
    .we(1'b1), 
    .data(ddcFreq), 
    .sine(qDds), 
    .cosine(iDds)
    );
`ifdef SIMULATE
real iDdsReal = ((iDds > 131071.0) ? (iDds - 262144.0) : iDds)/131072.0;
real qDdsReal = ((qDds > 131071.0) ? (qDds - 262144.0) : qDds)/131072.0;
`endif


// Complex Multiplier
wire [17:0]iMix;
wire [17:0]qMix;
cmpy18 mixer( .clk(clk),
              .reset(reset),
              .aReal(iIn),
              .aImag(qIn),
              .bReal(iDds),
              .bImag(qDds),
              .pReal(iMix),
              .pImag(qMix)
              );
`ifdef SIMULATE
real iMixReal = ((iMix > 131071.0) ? (iMix - 262144.0) : iMix)/131072.0;
real qMixReal = ((qMix > 131071.0) ? (qMix - 262144.0) : qMix)/131072.0;
`endif


// First Halfband Filters
wire [17:0]iHb0,qHb0;
`ifdef SIMULATE
reg hbReset;
halfbandDecimate hb0( 
    .clk(clk), .reset(hbReset), .sync(syncIn),
`else
halfbandDecimate hb0( 
    .clk(clk), .reset(reset), .sync(syncIn),
`endif
    .iIn(iMix),.qIn(qMix),
    .iOut(iHb0),.qOut(qHb0),
    .syncOut(hb0SyncOut)
    );

`ifdef SIMULATE
real iHb0Real = ((iHb0 > 131071.0) ? (iHb0 - 262144.0) : iHb0)/131072.0;
real qHb0Real = ((qHb0 > 131071.0) ? (qHb0 - 262144.0) : qHb0)/131072.0;
`endif

// CIC Decimator
wire [47:0]iCic,qCic;
wire cicSyncOut;
wire [31:0]cicDout;
`ifdef SIMULATE
reg cicReset;
cicDecimator cic( 
    .clk(clk), .reset(cicReset), .sync(hb0SyncOut),
`else
cicDecimator cic( 
    .clk(clk), .reset(reset), .sync(hb0SyncOut),
`endif
    .wr0(wr0), .wr1(wr1), .wr2(wr2), .wr3(wr3),
    .addr(addr),
    .din(din),
    .dout(cicDout),
    .inI(iHb0),.inQ(qHb0),
    .outI(iCic),.outQ(qCic),
    .syncOut(cicSyncOut)
    );

wire    [47:0]  iAgcIn,qAgcIn;
assign          iAgcIn = bypassCic ? {iHb0,30'h0} : iCic;
assign          qAgcIn = bypassCic ? {qHb0,30'h0} : qCic;
wire            agcSync = bypassCic ? hb0SyncOut : cicSyncOut;
wire    [17:0]  iAgc,qAgc;
variableGain gainI(
    .clk(clk), .clkEn(agcSync),
    .exponent(nbAgcGain[20:16]), .mantissa(nbAgcGain[15:0]),
    .din(iAgcIn),
    .dout(iAgc)
    );
variableGain gainQ(
    .clk(clk), .clkEn(agcSync),
    .exponent(nbAgcGain[20:16]), .mantissa(nbAgcGain[15:0]),
    .din(qAgcIn),
    .dout(qAgc)
    );

`ifdef SIMULATE
real iAgcReal = ((iAgc > 131071.0) ? (iAgc - 262144.0) : iAgc)/131072.0;
real qAgcReal = ((qAgc > 131071.0) ? (qAgc - 262144.0) : qAgc)/131072.0;
`endif

// CIC Compensation
wire    [17:0]  iComp,qComp;
cicComp cicCompI(
    .clk(clk), 
    .reset(reset),
    .sync(agcSync), 
    .compIn(iAgc),
    .compOut(iComp)
    );
cicComp cicCompQ(
    .clk(clk), 
    .reset(reset),
    .sync(agcSync), 
    .compIn(qAgc),
    .compOut(qComp)
    );
`ifdef SIMULATE
real iCompReal = ((iComp > 131071.0) ? (iComp - 262144.0) : iComp)/131072.0;
real qCompReal = ((qComp > 131071.0) ? (qComp - 262144.0) : qComp)/131072.0;
`endif

// Second Halfband Filter
wire    [17:0]  iHbIn,qHbIn;
assign iHbIn = bypassCic ? iAgc : iComp;
assign qHbIn = bypassCic ? qAgc : qComp;
wire [17:0]iHb,qHb;
halfbandDecimate hb( 
`ifdef SIMULATE
    .clk(clk), .reset(cicReset), .sync(agcSync),
`else
    .clk(clk), .reset(reset), .sync(agcSync),
`endif
    .iIn(iHbIn),.qIn(qHbIn),
    .iOut(iHb),.qOut(qHb),
    .syncOut(hbSyncOut)
    );

`ifdef SIMULATE
real iHbReal = ((iHb > 131071.0) ? (iHb - 262144.0) : iHb)/131072.0;
real qHbReal = ((qHb > 131071.0) ? (qHb - 262144.0) : qHb)/131072.0;
`endif

//assign iOut = iAgc;
//assign qOut = qAgc;
//assign syncOut = agcSync;
assign iOut = bypassHb ? iAgc : iHb;
assign qOut = bypassHb ? qAgc : qHb;
assign syncOut = bypassHb ? agcSync : hbSyncOut;

reg [31:0]dout;
always @(addr or cicDout or ddcDout) begin
    casex (addr)
        `DDCSPACE:          dout <= ddcDout;
        `CICDECSPACE:       dout <= cicDout;    
        default:            dout <= 32'bx;
        endcase
    end

endmodule
                     
