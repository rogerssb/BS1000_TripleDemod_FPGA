/******************************************************************************
Copyright 2008-2015 Koos Technical Services, Inc. All Rights Reserved

This source code is the Intellectual Property of Koos Technical Services,Inc.
(KTS) and is provided under a License Agreement which protects KTS' ownership and
derivative rights in exchange for negotiated compensation.
******************************************************************************/

`timescale 1ns/10ps

`include "addressMap.v"

module interpRegs(
    `ifdef USE_BUS_CLOCK
    input                       busClk,
    `endif
    input                       cs,
    input                       wr0, wr1, wr2, wr3,
    input               [12:0]  addr,
    input               [31:0]  dataIn,
    output  reg         [31:0]  dataOut,
    output  reg                 bypass,
    output  reg                 test,
    output  reg                 invert,
    output  reg                 bypassEQ,
    output  reg         [3:0]   source,
    output  reg signed  [17:0]  testValue,
    output  reg         [4:0]   cicExponent,
    output  reg         [17:0]  cicMantissa,
    output  reg         [4:0]   gainExponent,
    output  reg         [15:0]  gainMantissa
);

    `ifdef USE_BUS_CLOCK
    always @(posedge busClk) begin
        if (cs & wr0) begin
    `else
    always @(negedge wr0) begin
        if (cs) begin
    `endif
            casex (addr)
                `INTERP_CONTROL: begin
                                        bypass <= dataIn[0];
                                        test <= dataIn[1];
                                        invert <= dataIn[2];
                                        bypassEQ <= dataIn[3];
                end
                `INTERP_CIC_MANTISSA:   cicMantissa[7:0] <= dataIn[7:0];
                `INTERP_CIC_EXPONENT:   cicExponent[4:0] <= dataIn[4:0];
                `INTERP_TEST:           testValue[7:0] <= dataIn[7:0];
                default:  ;
            endcase
        end
    end

    `ifdef USE_BUS_CLOCK
    always @(posedge busClk) begin
        if (cs & wr1) begin
    `else
    always @(negedge wr1) begin
        if (cs) begin
    `endif
            casex (addr)
                `INTERP_CONTROL:        source <= dataIn[11:8];
                `INTERP_CIC_MANTISSA:   cicMantissa[15:8] <= dataIn[15:8];
                `INTERP_TEST:           testValue[15:8] <= dataIn[15:8];
                default:  ;
            endcase
        end
    end

    `ifdef USE_BUS_CLOCK
    always @(posedge busClk) begin
        if (cs & wr2) begin
    `else
    always @(negedge wr2) begin
        if (cs) begin
    `endif
            casex (addr)
                `INTERP_GAIN_MANTISSA:  gainMantissa[7:0] <= dataIn[23:16];
                `INTERP_CIC_MANTISSA:   cicMantissa[17:16] <= dataIn[17:16];
                `INTERP_GAIN_EXPONENT:  gainExponent[4:0] <= dataIn[23:16];
                `INTERP_TEST:           testValue[17:16] <= dataIn[17:16];
                default:  ;
            endcase
        end
    end

    `ifdef USE_BUS_CLOCK
    always @(posedge busClk) begin
        if (cs & wr3) begin
    `else
    always @(negedge wr3) begin
        if (cs) begin
    `endif
            casex (addr)
                `INTERP_GAIN_MANTISSA:  gainMantissa[15:8] <= dataIn[31:24];
                default:  ;
            endcase
        end
    end

    always @* begin
        if (cs) begin
            casex (addr)
                `INTERP_CONTROL:        dataOut = {gainMantissa,4'h0,source,4'h0,bypassEQ,invert,test,bypass};
                `INTERP_GAIN_MANTISSA:  dataOut = {gainMantissa,4'h0,source,4'h0,bypassEQ,invert,test,bypass};
                `INTERP_CIC_MANTISSA:   dataOut = {14'b0,cicMantissa};
                `INTERP_CIC_EXPONENT:   dataOut = {11'b0,gainExponent,11'b0,cicExponent};
                `INTERP_GAIN_EXPONENT:  dataOut = {11'b0,gainExponent,11'b0,cicExponent};
                `INTERP_TEST:           dataOut = {14'b0,testValue};
                default:                dataOut = 32'hx;
            endcase
        end
        else begin
            dataOut = 32'hx;
        end
    end

endmodule

