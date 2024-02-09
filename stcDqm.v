`timescale 1ns/1ps
`include "addressMap.v"


module dqm #(parameter regSpace = `DQMSPACE,
                       lutSpace = `DQMLUTSPACE,
                       LOG_BITS = 11
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
    input                       mseEn,
    input  signed       [15:0]  log10MSE,
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

    // With STC, the number of bits is fixed to the frame size of the STC frame.
    wire            [13:0]  payloadSize = 14'd3199;
    `ifdef DQM_USE_DPLL
    wire            [31:0]  dllCenterFreq;
    `else
    wire            [15:0]  clksPerBit;
    `endif
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
        .log10MseOffset(),
        .mseMean(),
        .mseAvgLength(),
        .payloadSize(),
        `ifdef DQM_USE_DPLL
        .dllCenterFreq(dllCenterFreq),
        `else
        .clksPerBit(clksPerBit),
        `endif
        .sourceSelect(),
        .combinerMode()
    );


    reg    signed       [15:0]  log10MSELatched;
    always @(posedge clk) begin
        if (mseEn) begin
            log10MSELatched <= log10MSE;
        end
    end

/******************************************************************************
                                DQM LUT
******************************************************************************/
    wire            [15:0]  dqmValue;
    wire            [31:0]  lutDout;
    dqmLookupTable #(.LOGBITS(LOG_BITS), .regSpace(lutSpace)) dqml(
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
        .log10MSE(log10MSELatched),
        .dqmValue(dqmValue)
    );

/******************************************************************************
                                DQM Framer
******************************************************************************/
    dqmFramer #(.VERSION(4'd1)) dqmf(
        .clk(clk),
        .reset(reset),
        .dqm(dqmValue),
        .payloadSize(payloadSize),
        .payloadBitEn(bitClkEn),
        .payloadBit(payloadBit),
        `ifdef DQM_USE_DPLL
        .dllCenterFreq(dllCenterFreq),
        `else
        .clksPerBit(clksPerBit),
        `endif
        .dqmStartOfFrame(),
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