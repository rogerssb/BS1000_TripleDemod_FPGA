/******************************************************************************
Copyright 2008-2015 Koos Technical Services, Inc. All Rights Reserved

This source code is the Intellectual Property of Koos Technical Services,Inc. 
(KTS) and is provided under a License Agreement which protects KTS' ownership and
derivative rights in exchange for negotiated compensation.
******************************************************************************/

`timescale 1ns / 10 ps
`include "addressMap.v"

module cicInterpolate( 
    clk, reset, clkEn,
    dIn,
    dOut
    );

input           clk;
input           reset;
input           clkEn;
input   [17:0]  dIn;
output  [47:0]  dOut;

// 3rd order comb with a FIR structure to minimize delay
// (1 - z)^3 = 1 - 3z + 3z^2 - z^3
wire    [19:0]  slice = {dIn[17],dIn[17],dIn};
wire    [20:0]  dinX3 = {slice[19],slice} + {slice,1'b0};
reg     [20:0]  tap0;
reg     [20:0]  tap1;
reg     [20:0]  tap2;
reg     [20:0]  tap3;
wire    [20:0]  sum3 = tap2 + {slice[19],slice};
always @(posedge clk) begin
    if (reset) begin
        tap0 <= 0;
        tap1 <= 0;
        tap2 <= 0;
        tap3 <= 0;
        end
    else if (clkEn) begin
        tap0 <= {slice[19],slice};
        tap1 <= dinX3 - tap0;
        tap2 <= tap1 - dinX3;
        tap3 <= sum3;
        end
    else begin
        tap3 <= 0;
        end
    end

`ifdef SIMULATE
real tap0Real;
real tap1Real; 
real tap2Real; 
real sum3Real; 
always @(tap0) tap0Real = (tap0[20] ? tap0 - 2097152.0 : tap0)/1048576.0;
always @(tap1) tap1Real = (tap1[20] ? tap1 - 2097152.0 : tap1)/1048576.0; 
always @(tap2) tap2Real = (tap2[20] ? tap2 - 2097152.0 : tap2)/1048576.0; 
always @(tap0) sum3Real = (sum3[20] ? sum3 - 2097152.0 : sum3)/1048576.0; 
`endif

// Three stages of integration
reg     [47:0]  acc0,acc1,acc2;
always @(posedge clk) begin
    if (reset) begin
        acc0 <= 0;
        acc1 <= 0;
        acc2 <= 0;
        end
    else begin
        acc0 <= acc0 + {{27{tap3[20]}},tap3};
        acc1 <= acc1 + acc0;
        acc2 <= acc2 + acc1;
        end
    end

`ifdef SIMULATE
wire [31:0]acc0Slice = acc0[47:16];
real acc0Real;
always @(acc0Slice) acc0Real = ((acc0Slice > 2147483647.0) ? acc0Slice-4294967296.0 : acc0Slice)/2147483648.0;
wire [31:0]acc1Slice = acc1[47:16];
real acc1Real;
always @(acc1Slice) acc1Real = ((acc1Slice > 2147483647.0) ? acc1Slice-4294967296.0 : acc1Slice)/2147483648.0;
wire [31:0]acc2Slice = acc2[47:16];
real acc2Real;
always @(acc2Slice) acc2Real = ((acc2Slice > 2147483647.0) ? acc2Slice-4294967296.0 : acc2Slice)/2147483648.0;
`endif

// Final output
assign dOut = acc2;

endmodule
