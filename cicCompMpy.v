/******************************************************************************
Copyright 2008-2015 Koos Technical Services, Inc. All Rights Reserved

This source code is the Intellectual Property of Koos Technical Services,Inc. 
(KTS) and is provided under a License Agreement which protects KTS' ownership and
derivative rights in exchange for negotiated compensation.
******************************************************************************/

`timescale 1ns / 10 ps

module cicCompMpy( 
    clk, reset, sync,
    compIn,
    compOut
    );

input clk;
input reset;
input sync;
input  [17:0]compIn;
output [17:0]compOut;

`include "cicCompCoefs.h"

// Data shift register
reg     [17:0]sr0,sr1,sr2,sr3,sr4,sr5,sr6,sr7;
reg     [17:0]midTap;
reg     [18:0]sum0,sum1;
always @(posedge clk) begin
    if (sync) begin
        sr0 <= compIn;
        sr1 <= sr0;
        sr2 <= sr1;
        sr3 <= sr2;
        sr4 <= sr3;
        sr5 <= sr4;
        sr6 <= sr5;
        sr7 <= sr6;
        // Add the symmetric taps
        sum0 <= {compIn[17],compIn} + {sr7[17],sr7};
        sum1 <= {sr1[17],sr1} + {sr5[17],sr5};
        midTap <= sr3;
        end
    end

// Tap Mpy
wire    [35:0]  tap0;
mpy18x18WithCe mpy0(
    .clk(clk),
    .ce(sync),
    //.sclr(reset),
    .a(sum0[18:1]),
    .b(coef0),
    .p(tap0)
    );
wire    [35:0]  tap1;
mpy18x18WithCe mpy1(
    .clk(clk),
    .ce(sync),
    //.sclr(reset),
    .a(sum1[18:1]),
    .b(coef1),
    .p(tap1)
    );
wire    [35:0]  tap2;
mpy18x18WithCe mpy2(
    .clk(clk),
    .ce(sync),
    //.sclr(reset),
    .a(midTap),
    .b(coef2),
    .p(tap2)
    );
wire    [19:0] finalSum = tap0[34:15] + tap1[34:15] + tap2[34:15];


// Final sum. Check for saturation.
reg     [17:0]  compOut;
always @(posedge clk) begin
    if (reset) begin
        compOut <= 0;
        end
    else if (sync) begin
        if (!finalSum[19] && finalSum[18]) begin
            compOut <= 18'h1ffff;
            end
        else if (finalSum[19] && !finalSum[18]) begin
            compOut <= 18'h20001;
            end
        else begin
            compOut <= finalSum[18:1];
            end
        end
    end


`ifdef SIMULATE
real inReal;
real outReal;
always @(compIn) inReal = ((compIn > 131071.0) ? (compIn - 262144.0) : compIn)/131072.0;
always @(compOut) outReal = ((compOut > 131071.0) ? (compOut - 262144.0) : compOut)/131072.0;
`endif

endmodule



`ifdef TEST_MODULE

module test;

reg reset,clk;

// Create the clocks
parameter HC = 5;
parameter C = 2*HC;
parameter DECIMATION = 2;
reg clken;
always #HC clk = clk^clken;

integer         clkDecimation;
reg             clkEn;
always @(posedge clk) begin
    if (reset) begin
        clkEn <= 0;
        clkDecimation <= DECIMATION-1;
        end
    else begin
        if (clkDecimation == 0) begin
            clkDecimation <= DECIMATION-1;
            clkEn <= 1;
            end
        else begin
            clkDecimation <= clkDecimation - 1;
            clkEn <= 0;
            end
        end
    end

reg     [17:0]  din;
reg     [3:0]   inputCount;
always @(posedge clk) begin
    if (reset) begin
        din <= 0;
        inputCount <= 0;
        end
    else if (clkEn) begin
        if (inputCount == 0) begin
            din <= 18'h10000;
            end
        else begin
            din <= 18'h00000;
            end
        inputCount <= inputCount + 1;
        end
    end

wire    [17:0]  dout;
cicComp cicComp( 
    .clk(clk), .reset(reset), .sync(clkEn),
    .compIn(din),
    .compOut(dout)
    );

initial begin
    reset = 0;
    clk = 0;

    // Turn on the clock
    clken=1;
    #(10*C) ;

    reset = 1;
    #(2*C) ;
    reset = 0;

    #(256*DECIMATION*C) ;
    $stop;
    end

endmodule



`endif
