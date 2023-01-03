/******************************************************************************
Copyright 2008-2015 Koos Technical Services, Inc. All Rights Reserved

This source code is the Intellectual Property of Koos Technical Services,Inc.
(KTS) and is provided under a License Agreement which protects KTS' ownership and
derivative rights in exchange for negotiated compensation.
******************************************************************************/

`timescale 1ns/1ps

module combChannelAGC(
    input                       clk, reset, clkEn,
    input                       busClk,
    input                       cs,
    input                       wr0, wr1, wr2, wr3,
    input               [12:0]  addr,
    input               [31:0]  din,
    output              [31:0]  dout,
    input       signed  [17:0]  iIn0,qIn0,
    input       signed  [17:0]  iIn1,qIn1,
    output              [20:0]  nbagcgain0, nbagcgain1,
    output              [12:0]  squelchLvl,
    output              [15:0]  squelchRatio
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

    // Do channel 0
    // First, pick the min and max.
    wire    [17:0]   absI0 = $unsigned(iIn0[17] ? -iIn0 : iIn0);
    wire    [17:0]   absQ0 = $unsigned(qIn0[17] ? -qIn0 : qIn0);
    reg     [16:0]   max0,min0;
    always @(posedge clk) begin
        if (clkEn) begin
            if (absI0 > absQ0) begin
                max0 <= absI0[16:0];
                min0 <= absQ0[16:0];
            end
            else begin
                max0 <= absQ0[16:0];
                min0 <= absI0[16:0];
            end
        end
    end

    // Now, calculate the instantaneous level approximation
    wire [35:0]maxTerm0,minTerm0;
    wire [17:0]maxWeight = 125886;

    mpy18x18PL1 mpyMax0(
        .clk(clk),
        .sclr(reset),
        .a({1'b0,max0}),
        .b(maxWeight),
        .p(maxTerm0)
    );
    wire [17:0]minWeight = 52144;

    mpy18x18PL1 mpyMin0(
        .clk(clk),
        .sclr(reset),
        .a({1'b0,min0}),
        .b(minWeight),
        .p(minTerm0)
    );

    wire    [16:0]  sum0 = maxTerm0[34:18] + minTerm0[34:18];
    reg     [15:0]  rxLevel0;
    always @(posedge clk) begin
        if (clkEn) begin
            if (sum0[16]) begin
                rxLevel0 <= 16'hffff;
            end
            else begin
                rxLevel0 <= sum0[15:0];
            end
        end
    end


    // Convert the linear level to log base 2
    wire [11:0]log2Mag0;
    combLog2 log20(
        .clk(clk),
        .reset(reset),
        .clkEn(clkEn),
        .linear(rxLevel0),
        .log(log2Mag0)
    );

    // Do same process for channel 1
    // First, pick the min and max.
    wire    [17:0]   absI1 = $unsigned(iIn1[17] ? -iIn1 : iIn1);
    wire    [17:0]   absQ1 = $unsigned(qIn1[17] ? -qIn1 : qIn1);
    reg     [16:0]   max1,min1;
    always @(posedge clk) begin
        if (clkEn) begin
            if (absI1 > absQ1) begin
                max1 <= absI1[16:0];
                min1 <= absQ1[16:0];
            end
            else begin
                max1 <= absQ1[16:0];
                min1 <= absI1[16:0];
            end
        end
    end

    // Now, calculate the instantaneous level approximation
    wire [35:0]maxTerm1,minTerm1;

    mpy18x18PL1 mpyMax1(
        .clk(clk),
        .sclr(reset),
        .a({1'b0,max1}),
        .b(maxWeight),
        .p(maxTerm1)
    );

    mpy18x18PL1 mpyMin1(
        .clk(clk),
        .sclr(reset),
        .a({1'b0,min1}),
        .b(minWeight),
        .p(minTerm1)
    );

    wire    [16:0]  sum1 = maxTerm1[34:18] + minTerm1[34:18];
    reg     [15:0]  rxLevel1;
    always @(posedge clk) begin
        if (clkEn) begin
            if (sum1[16]) begin
                rxLevel1 <= 16'hffff;
            end
            else begin
                rxLevel1 <= sum1[15:0];
            end
        end
    end

    // Convert the linear level to log base 2
    wire [11:0]log2Mag1;
    combLog2 log21(
        .clk(clk),
        .reset(reset),
        .clkEn(clkEn),
        .linear(rxLevel1),
        .log(log2Mag1)
    );


    // Run the loop filter
    wire    [31:0]loopOutput0, loopOutput1;
    combAgcLoopFilter chAgcLoopFilter(
        .clk(clk), .reset(reset), .clkEn(clkEn),
        .busClk(busClk),
        .cs(cs),
        .wr0(wr0), .wr1(wr1), .wr2(wr2), .wr3(wr3),
        .addr(addr),
        .din(din),
        .dout(dout),
        .signalLevel0(log2Mag0),
        .signalLevel1(log2Mag1),
        .loopOutput0(loopOutput0),
        .loopOutput1(loopOutput1),
        .squelchLvl(squelchLvl),
        .squelchRatio(squelchRatio)
        );

    assign nbagcgain0 = loopOutput0[31:11];
    assign nbagcgain1 = loopOutput1[31:11];

endmodule
