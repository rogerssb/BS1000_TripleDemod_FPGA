`timescale 1ns / 10 ps
`include ".\addressMap.v"

module dualDecimator( 
    clk, reset, sync,
    wr0, wr1, wr2, wr3,
    addr,
    din,
    dout,
    inI,inQ,
    outI,outQ,
    syncOut
    );

input clk;
input reset;
input sync;
input wr0,wr1,wr2,wr3;
input [11:0]addr;
input [31:0]din;
output [31:0]dout;
input  [17:0]inI,inQ;
output [47:0]outI,outQ;
output  syncOut;


// Register interface
reg cs;
always @(addr) begin
    casex(addr)
        `CICDECSPACE:       cs = 1;
        default:            cs = 0;
        endcase
    end

wire    [5:0]   cicShift;
wire    [14:0]   cicDecimation;
cicRegs regs (
    .cs(cs),
    .addr(addr),
    .dataIn(din),
    .dataOut(dout),
    .wr0(wr0), .wr1(wr1), .wr2(wr2), .wr3(wr3),
    .cicDecimation(cicDecimation),
    .cicShift(cicShift)
    );

cicDecimator cicI( 
    .clk(clk), .reset(reset), .sync(sync),
    .gainShift(cicShift),
    .decimation(cicDecimation),
    .in(inI),
    .out(outI),
    .syncOut(syncOut)
    );

cicDecimator cicQ( 
    .clk(clk), .reset(reset), .sync(sync),
    .gainShift(cicShift),
    .decimation(cicDecimation),
    .in(inQ),
    .out(outQ),
    .syncOut()
    );


`ifdef SIMULATE
real iCicReal;
real qCicReal;
always @(outI) iCicReal = ((outI[47:30] > 131071.0) ? (outI[47:30] - 262144.0) : outI[47:30])/131072.0;
always @(outQ) qCicReal = ((outQ[47:30] > 131071.0) ? (outQ[47:30] - 262144.0) : outQ[47:30])/131072.0;
`endif

endmodule
