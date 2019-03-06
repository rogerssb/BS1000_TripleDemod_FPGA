`timescale 1ns/1ps
`include "addressMap.v"


module dualMseEstimate #(parameter regSpace=`DMSE_SPACE) (
    input                       clk,
    input                       reset,
    `ifdef USE_BUS_CLOCK
    input                       busClk,
    `endif
    input                       cs,
    input                       wr0,wr1,wr2,wr3,
    input               [12:0]  addr,
    input               [31:0]  din,
    output              [31:0]  dout,
    input                       ch0MagClkEn,
    input               [12:0]  ch0Mag,
    input                       ch1MagClkEn,
    input               [12:0]  ch1Mag
);

    reg dmseSpace;
    always @* begin
        casex(addr)
            regSpace:   dmseSpace = cs;
            default:    dmseSpace = 0;
        endcase
    end

    wire    signed  [15:0]  ch0MSE;
    wire    signed  [15:0]  ch0MseOffset;
    wire            [15:0]  ch0MseMean;
    wire            [15:0]  ch0MseAvgLength;
    wire    signed  [15:0]  ch1MSE;
    wire    signed  [15:0]  ch1MseOffset;
    wire            [15:0]  ch1MseMean;
    wire            [15:0]  ch1MseAvgLength;
    dualMseRegs regs(
        .cs(dmseSpace),
        `ifdef USE_BUS_CLOCK
        .busClk(busClk),
        `endif
        .wr0(wr0),.wr1(wr1),.wr2(wr2),.wr3(wr3),
        .addr(addr),
        .dataIn(din),
        .dataOut(dout),
        .ch0MSE(ch0MSE),
        .ch0MseOffset(ch0MseOffset),
        .ch0MseMean(ch0MseMean),
        .ch0MseAvgLength(ch0MseAvgLength),
        .ch1MSE(ch1MSE),
        .ch1MseOffset(ch1MseOffset),
        .ch1MseMean(ch1MseMean),
        .ch1MseAvgLength(ch1MseAvgLength)
    );

    // Averaging State Machine
    reg     [15:0]  ch0AvgCount;
    reg             ch0StartAverage;
    always @(posedge clk) begin
        if (reset) begin
            ch0AvgCount <= 0;
            ch0StartAverage <= 0;
        end
        else if (ch0MagClkEn) begin
            if (ch0AvgCount == 0) begin
                ch0AvgCount <= ch0MseAvgLength;
                ch0StartAverage <= 1;
            end
            else begin
                ch0AvgCount <= ch0AvgCount - 1;
                ch0StartAverage <= 0;
            end
        end
    end

    mseEstimate #(.LOG_BITS(11)) mse0(
        .clk(clk),
        .reset(reset),
        .startEstimate(ch0StartAverage),
        .magClkEn(ch0MagClkEn),
        .mag(ch0Mag),
        .meanMag(ch0MseMean),
        .avgLength(ch0MseAvgLength),
        .log10MseOffset(ch0MseOffset),
        .log10MSE(ch0MSE)
    );

    // Averaging State Machine
    reg     [15:0]  ch1AvgCount;
    reg             ch1StartAverage;
    always @(posedge clk) begin
        if (reset) begin
            ch1AvgCount <= 0;
            ch1StartAverage <= 0;
        end
        else if (ch1MagClkEn) begin
            if (ch1AvgCount == 0) begin
                ch1AvgCount <= ch1MseAvgLength;
                ch1StartAverage <= 1;
            end
            else begin
                ch1AvgCount <= ch1AvgCount - 1;
                ch1StartAverage <= 0;
            end
        end
    end

    mseEstimate #(.LOG_BITS(11)) mse1(
        .clk(clk),
        .reset(reset),
        .startEstimate(ch1StartAverage),
        .magClkEn(ch1MagClkEn),
        .mag(ch1Mag),
        .meanMag(ch1MseMean),
        .avgLength(ch1MseAvgLength),
        .log10MseOffset(ch1MseOffset),
        .log10MSE(ch1MSE)
    );



endmodule