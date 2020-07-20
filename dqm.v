`timescale 1ns/1ps
`include "addressMap.v"


module dqm #(parameter regSpace = `DQMSPACE,
                       lutSpace = `DQMLUTSPACE
)
(
    input                       clk,
    input                       reset,
    `ifdef USE_BUS_CLOCK
    input                       busClk,
    `endif
    input                       cs,
    input                       wr0,wr1,wr2,wr3,
    input               [12:0]  addr,
    input               [31:0]  din,
    output reg          [31:0]  dout,
    input                       bitClkEn,
    input                       payloadBit,
    input                       magClkEn,
    input               [12:0]  mag,
    output              [3:0]   sourceSelect,
    output                      dqmBitEn,
    output                      dqmBit
);

    reg dqmSpace;
    always @* begin
        casex(addr)
            regSpace:   dqmSpace = cs;
            default:    dqmSpace = 0;
        endcase
    end

    wire    signed  [15:0]  log10MSE;
    wire    signed  [15:0]  log10MseOffset;
    wire            [15:0]  mseMean;
    wire            [15:0]  mseAvgLength;
    wire            [13:0]  payloadSize;
    wire            [15:0]  clksPerBit;
    wire            [31:0]  regDout;
    dqmRegs dqmr(
        .cs(dqmSpace),
        `ifdef USE_BUS_CLOCK
        .busClk(busClk),
        `endif
        .wr0(wr0),.wr1(wr1),.wr2(wr2),.wr3(wr3),
        .addr(addr),
        .dataIn(din),
        .dataOut(regDout),
        .log10MSE(log10MSE),
        .log10MseOffset(log10MseOffset),
        .mseMean(mseMean),
        .mseAvgLength(mseAvgLength),
        .payloadSize(payloadSize),
        .clksPerBit(clksPerBit),
        .sourceSelect(sourceSelect)
    );


/******************************************************************************
                      Unit Circle MSE Estimate
******************************************************************************/
    mseEstimate #(.LOG_BITS(11)) dqmm(
        .clk(clk),
        .reset(reset),
        .startEstimate(dqmStartOfFrame),
        .magClkEn(magClkEn),
        .mag(mag),
        .meanMag(mseMean),
        .avgLength(mseAvgLength),
        .log10MseOffset(log10MseOffset),
        .log10MSE(log10MSE)
    );

/******************************************************************************
                                DQM LUT
******************************************************************************/
    wire            [15:0]  dqmValue;
    wire            [31:0]  lutDout;
    dqmLookupTable #(.LOGBITS(11), .regSpace(lutSpace)) dqml(
        .clk(clk),
        .reset(reset),
        .cs(cs),
        `ifdef USE_BUS_CLOCK
        .busClk(busClk),
        `endif
        .wr0(wr0),.wr1(wr1),.wr2(wr2),.wr3(wr3),
        .addr(addr),
        .dataIn(din),
        .dataOut(lutDout),
        .log10MSE(log10MSE),
        .dqmValue(dqmValue)
    );

/******************************************************************************
                                DQM Framer
******************************************************************************/
    dqmFramer #(.VERSION(4'd0)) dqmf(
        .clk(clk),
        .reset(reset),
        .dqm(dqmValue),
        .payloadSize(payloadSize),
        .payloadBitEn(bitClkEn),
        .payloadBit(payloadBit),
        .clksPerBit(clksPerBit),
        .dqmStartOfFrame(dqmStartOfFrame),
        .dqmBitEn(dqmBitEn),
        .dqmBit(dqmBit)
    );

    always @* begin
        if (dqmSpace) begin
            dout = regDout;
        end
        else begin
            dout = lutDout;
        end
    end


endmodule