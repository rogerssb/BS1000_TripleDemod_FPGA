/******************************************************************************
Copyright 2008-2015 Koos Technical Services, Inc. All Rights Reserved

This source code is the Intellectual Property of Koos Technical Services,Inc.
(KTS) and is provided under a License Agreement which protects KTS' ownership and
derivative rights in exchange for negotiated compensation.
******************************************************************************/

`timescale 1ns/1ps
`include "./addressMap.v"

module cmagEstimate(
    input                       clk, reset, clkEn,
    input       signed  [17:0]  iIn,qIn,
    output  reg         [15:0]  magnitude
);

    // Uses a min/max approximation based on the following equation:
    //
    //      Mag = Alpha*Max + Beta*Min,
    //
    // where Max = max(abs(I),abs(q), Min = min(abs(I),abs(Q)), and Alpha and Beta
    // are two constants. The following table gives a list of possible values for
    // Alpha and Beta.
    //
    //     =====================================================================
    //                  Alpha * Max + Beta * Min Magnitude Estimator
    //
    //     Name                  Alpha           Beta       Avg Err   RMS   Peak
    //                                                      (linear)  (dB)  (dB)
    //     ---------------------------------------------------------------------
    //     Min RMS Err      0.947543636291 0.392485425092   0.000547 -32.6 -25.6
    //     Min Peak Err     0.960433870103 0.397824734759  -0.013049 -31.4 -28.1
    //     Min RMS w/ Avg=0 0.948059448969 0.392699081699   0.000003 -32.6 -25.7
    //     1, Min RMS Err   1.000000000000 0.323260990000  -0.020865 -28.7 -23.8
    //     1, Min Peak Err  1.000000000000 0.335982538000  -0.025609 -28.3 -25.1
    //     1, 1/2           1.000000000000 0.500000000000  -0.086775 -20.7 -18.6
    //     1, 1/4           1.000000000000 0.250000000000   0.006456 -27.6 -18.7
    //     Frerking         1.000000000000 0.400000000000  -0.049482 -25.1 -22.3
    //     1, 11/32         1.000000000000 0.343750000000  -0.028505 -28.0 -24.8
    //     1, 3/8           1.000000000000 0.375000000000  -0.040159 -26.4 -23.4
    //     15/16, 15/32     0.937500000000 0.468750000000  -0.018851 -29.2 -24.1
    //     15/16, 1/2       0.937500000000 0.500000000000  -0.030505 -26.9 -24.1
    //     31/32, 11/32     0.968750000000 0.343750000000  -0.000371 -31.6 -22.9
    //     31/32, 3/8       0.968750000000 0.375000000000  -0.012024 -31.4 -26.1
    //     61/64, 3/8       0.953125000000 0.375000000000   0.002043 -32.5 -24.3
    //     61/64, 13/32     0.953125000000 0.406250000000  -0.009611 -31.8 -26.6
    //     =====================================================================
    //
    // We'll use the Min Peak Err values.

    // First, pick the min and max.
    wire    [17:0]   absI = $unsigned(iIn[17] ? -iIn : iIn);
    wire    [17:0]   absQ = $unsigned(qIn[17] ? -qIn : qIn);
    reg     [16:0]   max,min;
    always @(posedge clk) begin
        if (clkEn) begin
            if (absI > absQ) begin
                max <= absI[16:0];
                min <= absQ[16:0];
            end
            else begin
                max <= absQ[16:0];
                min <= absI[16:0];
            end
        end
    end

    // Now, calculate the instantaneous level approximation
    wire [35:0]maxTerm,minTerm;
    `ifdef SIMULATE
    wire [17:0]maxWeight = (0.960433870103*131072);
    `else
    wire [17:0]maxWeight = 125886;
    `endif
    mpy18x18PL1 mpyMax(
        .clk(clk),
        .sclr(reset),
        .a({1'b0,max}),
        .b(maxWeight),
        .p(maxTerm)
    );
    `ifdef SIMULATE
    wire [17:0]minWeight = (0.397824734759*131072);
    `else
    wire [17:0]minWeight = 52144;
    `endif
    mpy18x18PL1 mpyMin(
        .clk(clk),
        .sclr(reset),
        .a({1'b0,min}),
        .b(minWeight),
        .p(minTerm)
    );

    wire    [16:0]  sum = maxTerm[35:19] + minTerm[35:19];
    always @(posedge clk) begin
        if (clkEn) begin
            if (sum[16]) begin
                magnitude <= 16'hffff;
            end
            else begin
                magnitude <= sum[15:0];
            end
        end
    end


endmodule
