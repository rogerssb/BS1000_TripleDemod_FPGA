/******************************************************************************
Copyright 2008-2015 Koos Technical Services, Inc. All Rights Reserved

This source code is the Intellectual Property of Koos Technical Services,Inc.
(KTS) and is provided under a License Agreement which protects KTS' ownership and
derivative rights in exchange for negotiated compensation.
******************************************************************************/

`timescale 1ns / 10 ps
`include ".\addressMap.v"

module loopFilter (
    input                       clk, clkEn, reset,
    `ifdef USE_BUS_CLOCK
    input                       busClk,
    `endif
    input                       cs,
    input                       wr0,wr1,wr2,wr3,
    input               [12:0]  addr,
    input               [31:0]  din,
    output              [31:0]  dout,
    input       signed  [11:0]  error,
    output      signed  [31:0]  loopFreq,
    output                      ctrl2,
    output                      ctrl4,
    output  reg                 satPos,
    output  reg                 satNeg,
    output              [15:0]  lockCount,
    output              [11:0]  syncThreshold
);

    // Microprocessor interface
    wire            [4:0]   lead, lag;
    wire    signed  [31:0]  limit;
    wire            [31:0]  loopOffset;
    wire    signed  [31:0]  lowerLimit = -limit;
    wire    signed  [31:0]  upperLimit = limit;
    reg     signed  [31:0]  lagAccum;
    loopRegs micro(
        `ifdef USE_BUS_CLOCK
        .busClk(busClk),
        `endif
        .addr(addr),
        .dataIn(din),
        .dataOut(dout),
        .cs(cs),
        .wr0(wr0), .wr1(wr1), .wr2(wr2), .wr3(wr3),
        .lockStatus(1'b0),
        .lagAccum(lagAccum),
        .invertError(invertError),
        .zeroError(zeroError),
        .ctrl2(ctrl2),
        .clearAccum(clearAccum),
        .ctrl4(ctrl4),
        .leadExp(lead),
        .leadMan(),
        .lagExp(lag),
        .lagMan(),
        .limit(limit),
        .loopData(),
        .leadExp1(),
        .leadMan1(),
        .lagExp1(),
        .lagMan1(),
        .loopData1(),
        .lockCount(lockCount),
        .syncThreshold(syncThreshold)
    );

    /**************************** Adjust Error ************************************/
    reg     signed  [11:0]  loopError;
    reg             [2:0]   clkEnDly;
    always @(posedge clk) begin
        clkEnDly <= {clkEnDly[1:0], clkEn};
        if (zeroError) begin
            loopError <= 12'h0;
        end
        else if (clkEn) begin
            if (invertError) begin
                loopError <= -error;
            end
            else begin
                loopError <= error;
            end
        end
    end



    /*************************** Lead Gain Section ********************************/

    reg     signed  [31:0]  leadError, leadErrorDly;
    always @(posedge clk) begin
        if (reset) begin
            leadError <= 0;
        end
        else if (clkEnDly[0]) begin
            case(lead)
                  5'h00: leadError <= 0;
                  5'h01: leadError <= $signed({{30{loopError[11]}},loopError[11:10]});
                  5'h02: leadError <= $signed({{29{loopError[11]}},loopError[11:9]});
                  5'h03: leadError <= $signed({{28{loopError[11]}},loopError[11:8]});
                  5'h04: leadError <= $signed({{27{loopError[11]}},loopError[11:7]});
                  5'h05: leadError <= $signed({{26{loopError[11]}},loopError[11:6]});
                  5'h06: leadError <= $signed({{25{loopError[11]}},loopError[11:5]});
                  5'h07: leadError <= $signed({{24{loopError[11]}},loopError[11:4]});
                  5'h08: leadError <= $signed({{23{loopError[11]}},loopError[11:3]});
                  5'h09: leadError <= $signed({{22{loopError[11]}},loopError[11:2]});
                  5'h0A: leadError <= $signed({{21{loopError[11]}},loopError[11:1]});
                  5'h0B: leadError <= $signed({{20{loopError[11]}},loopError});
                  5'h0C: leadError <= $signed({{19{loopError[11]}},loopError, 1'b0});
                  5'h0D: leadError <= $signed({{18{loopError[11]}},loopError, 2'b0});
                  5'h0E: leadError <= $signed({{17{loopError[11]}},loopError, 3'b0});
                  5'h0F: leadError <= $signed({{16{loopError[11]}},loopError, 4'b0});
                  5'h10: leadError <= $signed({{15{loopError[11]}},loopError, 5'b0});
                  5'h11: leadError <= $signed({{14{loopError[11]}},loopError, 6'b0});
                  5'h12: leadError <= $signed({{13{loopError[11]}},loopError, 7'b0});
                  5'h13: leadError <= $signed({{12{loopError[11]}},loopError, 8'b0});
                  5'h14: leadError <= $signed({{11{loopError[11]}},loopError, 9'b0});
                  5'h15: leadError <= $signed({{10{loopError[11]}},loopError,10'b0});
                  5'h16: leadError <= $signed({{09{loopError[11]}},loopError,11'b0});
                  5'h17: leadError <= $signed({{08{loopError[11]}},loopError,12'b0});
                  5'h18: leadError <= $signed({{07{loopError[11]}},loopError,13'b0});
                  5'h19: leadError <= $signed({{06{loopError[11]}},loopError,14'b0});
                  5'h1A: leadError <= $signed({{05{loopError[11]}},loopError,15'b0});
                  5'h1B: leadError <= $signed({{04{loopError[11]}},loopError,16'b0});
                  5'h1C: leadError <= $signed({{03{loopError[11]}},loopError,17'b0});
                  5'h1D: leadError <= $signed({{02{loopError[11]}},loopError,18'b0});
                  5'h1E: leadError <= $signed({{01{loopError[11]}},loopError,19'b0});
                  5'h1F: leadError <= $signed({loopError,20'b0});
            endcase
        end
    end

    /*************************** Lead Gain Section ********************************/

    reg     signed  [31:0]  lagError;
    always @(posedge clk) begin
        if (reset) begin
            lagError <= 0;
        end
        else if (clkEnDly[0]) begin
            case(lag)
                  5'h00: lagError <= 0;
                  5'h01: lagError <= $signed({{30{loopError[11]}},loopError[11:10]});
                  5'h02: lagError <= $signed({{29{loopError[11]}},loopError[11:9]});
                  5'h03: lagError <= $signed({{28{loopError[11]}},loopError[11:8]});
                  5'h04: lagError <= $signed({{27{loopError[11]}},loopError[11:7]});
                  5'h05: lagError <= $signed({{26{loopError[11]}},loopError[11:6]});
                  5'h06: lagError <= $signed({{25{loopError[11]}},loopError[11:5]});
                  5'h07: lagError <= $signed({{24{loopError[11]}},loopError[11:4]});
                  5'h08: lagError <= $signed({{23{loopError[11]}},loopError[11:3]});
                  5'h09: lagError <= $signed({{22{loopError[11]}},loopError[11:2]});
                  5'h0A: lagError <= $signed({{21{loopError[11]}},loopError[11:1]});
                  5'h0B: lagError <= $signed({{20{loopError[11]}},loopError});
                  5'h0C: lagError <= $signed({{19{loopError[11]}},loopError, 1'b0});
                  5'h0D: lagError <= $signed({{18{loopError[11]}},loopError, 2'b0});
                  5'h0E: lagError <= $signed({{17{loopError[11]}},loopError, 3'b0});
                  5'h0F: lagError <= $signed({{16{loopError[11]}},loopError, 4'b0});
                  5'h10: lagError <= $signed({{15{loopError[11]}},loopError, 5'b0});
                  5'h11: lagError <= $signed({{14{loopError[11]}},loopError, 6'b0});
                  5'h12: lagError <= $signed({{13{loopError[11]}},loopError, 7'b0});
                  5'h13: lagError <= $signed({{12{loopError[11]}},loopError, 8'b0});
                  5'h14: lagError <= $signed({{11{loopError[11]}},loopError, 9'b0});
                  5'h15: lagError <= $signed({{10{loopError[11]}},loopError,10'b0});
                  5'h16: lagError <= $signed({{09{loopError[11]}},loopError,11'b0});
                  5'h17: lagError <= $signed({{08{loopError[11]}},loopError,12'b0});
                  5'h18: lagError <= $signed({{07{loopError[11]}},loopError,13'b0});
                  5'h19: lagError <= $signed({{06{loopError[11]}},loopError,14'b0});
                  5'h1A: lagError <= $signed({{05{loopError[11]}},loopError,15'b0});
                  5'h1B: lagError <= $signed({{04{loopError[11]}},loopError,16'b0});
                  5'h1C: lagError <= $signed({{03{loopError[11]}},loopError,17'b0});
                  5'h1D: lagError <= $signed({{02{loopError[11]}},loopError,18'b0});
                  5'h1E: lagError <= $signed({{01{loopError[11]}},loopError,19'b0});
                  5'h1F: lagError <= $signed({loopError,20'b0});
            endcase
        end
    end

    // limit and accumulate the decimated accPhaseB
    //            80<------|------------|------0--------|---------|--------->7f
    // CASE1               LL                                     UL
    // CASE2               LL          UL
    // CASE3                                            LL        UL
    //
    wire    signed  [31:0] sum = lagAccum + lagError;
    always @ (posedge clk) begin
        if (reset) begin
            lagAccum <= 0;
        end
        else if (clearAccum) begin
            lagAccum <= 0;
        end
        else if (clkEnDly[1]) begin
            leadErrorDly <= leadError;             // delay lead error to match lagAccum timing
            if ( (sum[31] && upperLimit[31])          // both negative
             && (sum >= upperLimit) ) begin       // between upper limit and 0
                lagAccum <= upperLimit;
                satPos <= 1;
                satNeg <= 0;
                end
            else if ( (!sum[31] && !upperLimit[31])   // both positive
               && (sum >= upperLimit) ) begin       // between upper limit and +saturation
                lagAccum <= upperLimit;
                satPos <= 1;
                satNeg <= 0;
                end
            else if ( (!sum[31] && !lowerLimit[31])   // both positive
               && (sum < lowerLimit) ) begin      // between lower limit and 0
                lagAccum <= lowerLimit;
                satPos <= 0;
                satNeg <= 1;
                end
            else if ( (sum[31] && lowerLimit[31])     // both negative
                 && (sum < lowerLimit) ) begin        // between lower limit and -saturation
                lagAccum <= lowerLimit;
                satPos <= 0;
                satNeg <= 1;
            end
            else begin
                lagAccum <= sum;
                satPos <= 0;
                satNeg <= 0;
            end
        end
    end

    reg     signed  [31:0]  filterSum;
    always @(posedge clk) begin
        if (reset) begin
            filterSum <= 0;
        end
        else if (clkEnDly[2]) begin
            filterSum <= lagAccum + leadErrorDly;
        end
    end


    assign loopFreq = filterSum;

endmodule
