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
    input                   clk,reset,clkEn,
    `ifdef USE_BUS_CLOCK
    input                   busClk,
    `endif
    input                   wr0,wr1,wr2,wr3,
    input           [12:0]  addr,
    input           [31:0]  din,
    output          [31:0]  dout,
    input   signed  [17:0]  rx,
    output  reg     [16:0]  rxLevel,
    output          [17:0]  agcGain
);

    parameter RegSpace = `CH0_AGCSPACE;

    wire    signed  [17:0]   abs = rx[17] ? -rx : rx;
    always @(posedge clk) begin
        if (clkEn) begin
            rxLevel <= $unsigned(abs[16:0]);
        end
    end    

`ifdef SIMULATE
real magReal;
always @* magReal = $itor($unsigned(rxLevel))/(2**17);
`endif

    // Convert the linear level to log base 2
    wire    [7:0]   log2Mag;
    wire    [15:0]  linear = rxLevel[16:1];
    log2 log2(
        .clk(clk),
        .reset(reset),
        .clkEn(clkEn),
        .linear(linear),
        .log(log2Mag)
    );


// Run the loop filter
reg chAgcSpace;
always @* begin
    casex(addr)
        RegSpace:           chAgcSpace = 1;
        default:            chAgcSpace = 0;
        endcase
    end
wire    [31:0]loopOutput;
pcmAgcLoopFilter lf(
    .clk(clk), .reset(reset), .clkEn(clkEn),
    `ifdef USE_BUS_CLOCK
    .busClk(busClk),
    `endif
    .cs(chAgcSpace),
    .wr0(wr0), .wr1(wr1), .wr2(wr2), .wr3(wr3),
    .addr(addr),
    .din(din),
    .dout(dout),
    .signalLevel(rxLevel),
    .log2SignalLevel(log2Mag),
    .loopOutput(loopOutput)
    );

assign agcGain = loopOutput[31:14];

endmodule
