/******************************************************************************
Copyright 2008-2015 Koos Technical Services, Inc. All Rights Reserved

This source code is the Intellectual Property of Koos Technical Services,Inc. 
(KTS) and is provided under a License Agreement which protects KTS' ownership and
derivative rights in exchange for negotiated compensation.
******************************************************************************/

`timescale 1ns / 10 ps
`include "addressMap.v"

module dualDecimator( 
    input                       clk, reset, clkEn,
    input                       wr0, wr1, wr2, wr3,
    input               [12:0]  addr,
    input               [31:0]  din,
    output              [31:0]  dout,
    input       signed  [17:0]  inI,inQ,
    output  reg signed  [47:0]  outI,outQ,
    output  reg                 clkEnOut
    );

parameter RegSpace = `CICDECSPACE;

// Register interface
reg cs;
always @* begin
    casex(addr)
        RegSpace:           cs = 1;
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
    .clk(clk), .reset(reset), .clkEn(clkEn),
    .gainShift(cicShift),
    .decimation(cicDecimation),
    .in(inI),
    .out(outI),
    .clkEnOut(clkEnOut)
    );

cicDecimator cicQ( 
    .clk(clk), .reset(reset), .clkEn(clkEn),
    .gainShift(cicShift),
    .decimation(cicDecimation),
    .in(inQ),
    .out(outQ),
    .clkEnOut()
    );


`ifdef SIMULATE
real iCicReal;
real qCicReal;
always @(outI) iCicReal = ((outI[47:30] > 131071.0) ? (outI[47:30] - 262144.0) : outI[47:30])/131072.0;
always @(outQ) qCicReal = ((outQ[47:30] > 131071.0) ? (outQ[47:30] - 262144.0) : outQ[47:30])/131072.0;
`endif

endmodule
