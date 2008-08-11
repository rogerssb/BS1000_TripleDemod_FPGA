`timescale 1ns / 10 ps
`include ".\addressMap.v"

module ddc( clk, reset, syncIn, 
            wr0,wr1,wr2,wr3,
            addr,
            din,
            dout,
            ddcFreqOffset,
            offsetEn,
            symTimes2SyncOut,
            symTimes4SyncOut,
            iIn, qIn, 
            iOut, qOut);

input clk;
input reset;
input syncIn;
input wr0,wr1,wr2,wr3;
input [11:0]addr;
input [31:0]din;
output [31:0]dout;
input [31:0]ddcFreqOffset;
input offsetEn;
output symTimes2SyncOut;
output symTimes4SyncOut;
input [17:0]iIn;
input [17:0]qIn;
output [17:0]iOut;
output [17:0]qOut;


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
ddcRegs micro(.addr(addr),
            .dataIn(din),
            .dataOut(ddcDout),
            .cs(ddcSpace),
            .wr0(wr0), .wr1(wr1), .wr2(wr2), .wr3(wr3),
            .ddcCenterFreq(ddcCenterFreq)
             );


// Create the LO frequency
reg [31:0] ddcFreq;
always @(posedge clk) begin
    if (offsetEn) begin
        ddcFreq <= ddcFreqOffset - ddcCenterFreq;
        end
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


// CIC Decimator
wire [17:0]iCic,qCic;
wire cicSyncOut;
wire [31:0]cicDout;
`ifdef SIMULATE
reg cicReset;
cicDecimator cic( 
    .clk(clk), .reset(cicReset), .sync(syncIn),
`else
cicDecimator cic( 
    .clk(clk), .reset(reset), .sync(syncIn),
`endif
    .wr0(wr0), .wr1(wr1), .wr2(wr2), .wr3(wr3),
    .addr(addr),
    .din(din),
    .dout(cicDout),
    .inI(iMix),.inQ(qMix),
    .outI(iCic),.outQ(qCic),
    .syncOut(cicSyncOut)
    );

`ifdef SIMULATE
real iCicReal = ((iCic > 131071.0) ? (iCic - 262144.0) : iCic)/131072.0;
real qCicReal = ((qCic > 131071.0) ? (qCic - 262144.0) : qCic)/131072.0;
`endif


// Halfband Filters
wire [17:0]iHb,qHb;
halfbandDecimate hbI( 
    .clk(clk), .reset(reset), .sync(cicSyncOut),
    .hbIn(iCic),
    .hbOut(iHb),
    .syncOut(iHbSyncOut)
    );
halfbandDecimate hbQ( 
    .clk(clk), .reset(reset), .sync(cicSyncOut),
    .hbIn(qCic),
    .hbOut(qHb),
    .syncOut(qHbSyncOut)
    );

`ifdef SIMULATE
real iHbReal = ((iHb > 131071.0) ? (iHb - 262144.0) : iHb)/131072.0;
real qHbReal = ((qHb > 131071.0) ? (qHb - 262144.0) : qHb)/131072.0;
`endif

wire [17:0]iAgc,qAgc;
wire [19:0]nbAgcGain = {4'h0,16'hffff};
variableGain gainI(
    .clk(clk), .clkEn(iHbSyncOut),
    .exponent(nbAgcGain[19:16]), .mantissa(nbAgcGain[15:0]),
    .din(iHb),
    .dout(iAgc)
    );
variableGain gainQ(
    .clk(clk), .clkEn(qHbSyncOut),
    .exponent(nbAgcGain[19:16]), .mantissa(nbAgcGain[15:0]),
    .din(qHb),
    .dout(qAgc)
    );

`ifdef SIMULATE
real iAgcReal = ((iAgc > 131071.0) ? (iAgc - 262144.0) : iAgc)/131072.0;
real qAgcReal = ((qAgc > 131071.0) ? (qAgc - 262144.0) : qAgc)/131072.0;
`endif

assign iOut = iHb;
assign qOut = qHb;
assign symTimes2SyncOut = iHbSyncOut;
assign symTimes4SyncOut = cicSyncOut;

reg [31:0]dout;
always @(addr or cicDout or ddcDout) begin
    casex (addr)
        `DDCSPACE:          dout <= ddcDout;
        `CICDECSPACE:       dout <= cicDout;    
        default:            dout <= 32'bx;
        endcase
    end

endmodule
