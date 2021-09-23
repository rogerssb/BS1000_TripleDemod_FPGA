/******************************************************************************
Copyright 2008-2015 Koos Technical Services, Inc. All Rights Reserved

This source code is the Intellectual Property of Koos Technical Services,Inc. 
(KTS) and is provided under a License Agreement which protects KTS' ownership and
derivative rights in exchange for negotiated compensation.
******************************************************************************/

`timescale 1ns / 10 ps   
`include ".\addressMap.v"

module cicDecimator( 
    input                       clk, reset, clkEn,
    input               [5:0]   gainShift,
    input               [14:0]  decimation,
    input       signed  [17:0]  in,
    output      signed  [47:0]  out,
    output  reg                 clkEnOut
);


    // Input Shift Register
    wire    signed  [47:0]  shift;
    shifter18to48 shifter (
        .clk(clk), .clkEn(clkEn),
        .shift(gainShift),
        .din(in),
        .dout(shift)
    );
                    

    // Three stages of integration
    reg     signed  [47:0]  acc0,acc1,acc2;
    always @(posedge clk) begin
        if (reset) begin
            acc0 <= 0;
            acc1 <= 0;
            acc2 <= 0;
            end
        else if (clkEn) begin
            acc0 <= acc0 + shift;
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

    // Create the decimated clock enable
    reg [14:0]  decCount;
    always @(posedge clk) begin
        if (reset) begin
            decCount <= 1;
        end
        else if (clkEn) begin
            if (decCount == 0) begin
                decCount <= decimation;
                clkEnOut <= 1;
            end
            else begin
                decCount <= decCount - 1;
                clkEnOut <= 0;
            end
        end
        else begin
            clkEnOut <= 0;
        end
    end

    // 3rd order comb with a FIR structure to minimize delay
    // (1 - z)^3 = 1 - 3z + 3z^2 - z^3
    wire signed [48:0]  slice = $signed({acc2[47],acc2[47:0]});
    wire signed [48:0]  accx3 = slice + $signed({acc2,1'b0});
    reg  signed [48:0]  tap0,tap1,tap2;
    reg  signed [47:0]  tap3;
    wire signed [48:0]  sum3 = tap2 + slice;
    always @(posedge clk) begin
        if (clkEnOut) begin
            tap0 <= slice;
            tap1 <= accx3 - tap0;
            tap2 <= tap1 - accx3;
            tap3 <= $signed(sum3[47:0]);
        end
    end

    // Final outputs
    assign out = tap3;

    `ifdef SIMULATE
    real cicReal;
    always @(out) cicReal = ((out[47:30] > 131071.0) ? (out[47:30] - 262144.0) : out[47:30])/131072.0;
    `endif

endmodule
