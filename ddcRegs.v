/******************************************************************************
Copyright 2008-2015 Koos Technical Services, Inc. All Rights Reserved

This source code is the Intellectual Property of Koos Technical Services,Inc. 
(KTS) and is provided under a License Agreement which protects KTS' ownership and
derivative rights in exchange for negotiated compensation.
******************************************************************************/

`timescale 1ns/10ps

`include "addressMap.v"

module ddcRegs(
    `ifdef USE_BUS_CLOCK
    input                       busClk,
    `endif
    input                       cs,
    input                       wr0, wr1, wr2, wr3,
    input               [12:0]  addr,
    input               [31:0]  dataIn,
    output  reg         [31:0]  dataOut,
    output  reg signed  [31:0]  ddcCenterFreq,
    output  reg                 bypassCic, bypassHb,bypassFir,
    output  reg                 enableBasebandInputs,
    output  reg         [7:0]   adcDecimation
);

    `ifdef USE_BUS_CLOCK
    always @(posedge busClk) begin
        if (cs & wr0) begin
    `else
    always @(negedge wr0) begin
        if (cs) begin
    `endif
            casex (addr)
                `DDC_CENTER_FREQ: begin
                    ddcCenterFreq[7:0] <= dataIn[7:0];
                    end
                `DDC_CONTROL: begin
                    bypassCic <= dataIn[0];
                    bypassHb <= dataIn[1];
                    bypassFir <= dataIn[2];
                    enableBasebandInputs <= dataIn[3];
                    end
                `DDC_DECIMATION: begin
                    adcDecimation[7:0] <= dataIn[7:0];
                    end
                default: ;
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
                `DDC_CENTER_FREQ:   ddcCenterFreq[15:8] <= dataIn[15:8];
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
                `DDC_CENTER_FREQ:   ddcCenterFreq[23:16] <= dataIn[23:16];
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
                `DDC_CENTER_FREQ:   ddcCenterFreq[31:24] <= dataIn[31:24];
                default:  ;
            endcase
        end
    end

    always @* begin
        if (cs) begin
            casex (addr)
                `DDC_CENTER_FREQ:   dataOut = ddcCenterFreq;
                `DDC_CONTROL:       dataOut = {28'h0,enableBasebandInputs,bypassFir,bypassHb,bypassCic};
                `DDC_DECIMATION:    dataOut = {24'h0,adcDecimation};
                default:            dataOut = 32'h0;
            endcase
        end
        else begin
            dataOut = 32'hx;
        end
    end

endmodule
