/******************************************************************************
Copyright 2008-2015 Koos Technical Services, Inc. All Rights Reserved

This source code is the Intellectual Property of Koos Technical Services,Inc. 
(KTS) and is provided under a License Agreement which protects KTS' ownership and
derivative rights in exchange for negotiated compensation.
*******************************************************************************

This detects the magnitude of an all-real, NRZ waveform and uses it to drive
an AGC loop. This code assumes a bitsync loop force the clkEn to sample at the 
optimum time.
******************************************************************************/

`timescale 1ns/1ps
`include "./addressMap.v"

module pcmAgcLoop( 
    clk, reset, clkEn,
    `ifdef USE_BUS_CLOCK
    busClk,
    `endif
    wr0, wr1, wr2, wr3,
    addr,
    din,
    dout,
    rx,
    agcGain
    );

parameter RegSpace = `CH0_AGCSPACE;

input           clk,reset,clkEn;
`ifdef USE_BUS_CLOCK
input           busClk;
`endif
input           wr0,wr1,wr2,wr3;
input   [12:0]  addr;
input   [31:0]  din;
output  [31:0]  dout;
input   [17:0]  rx;
output  [20:0]  agcGain;



wire    [17:0]   abs = rx[17] ? -rx : rx;
reg     [15:0]   rxLevel;
always @(posedge clk) begin
    if (reset) begin
        end
    else if (clkEn) begin
        rxLevel <= abs[16:1];
        end
    end    


// Convert the linear level to log base 2
wire [7:0]log2Mag;
log2 log2(
    .clk(clk),
    .reset(reset),
    .syncIn(clkEn),
    //.linear({mag,7'b0000001}),
    .linear(rxLevel),
    .log(log2Mag)
    );

`ifdef SIMULATE
real magReal;
always @* magReal = rxLevel/65536.0;
real log2MagReal;
always @* log2MagReal = (log2Mag - 256.0)/16.0;
`endif


// Run the loop filter
reg chAgcSpace;
always @* begin
    casex(addr)
        RegSpace:           chAgcSpace = 1;
        default:            chAgcSpace = 0;
        endcase
    end
wire    [31:0]loopOutput;
agcLoopFilter chAgcLoopFilter(
    .clk(clk), .reset(reset), .clkEn(clkEn),
    `ifdef USE_BUS_CLOCK
    .busClk(busClk),
    `endif
    .cs(chAgcSpace),
    .wr0(wr0), .wr1(wr1), .wr2(wr2), .wr3(wr3),
    .addr(addr),
    .din(din),
    .dout(dout),
    .signalLevel(log2Mag),
    .loopOutput(loopOutput)
    );

assign agcGain = loopOutput[31:11];

endmodule
