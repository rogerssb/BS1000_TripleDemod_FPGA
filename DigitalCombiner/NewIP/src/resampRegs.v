/******************************************************************************
Copyright 2008-2015 Koos Technical Services, Inc. All Rights Reserved

This source code is the Intellectual Property of Koos Technical Services,Inc. 
(KTS) and is provided under a License Agreement which protects KTS' ownership and
derivative rights in exchange for negotiated compensation.
******************************************************************************/

`timescale 1ns/10ps

`include "addressMap.v"

module resamplerRegs(
    addr,
    dataIn,
    dataOut,
    `ifdef USE_BUS_CLOCK
    busClk,
    `endif
    cs,
    wr0, wr1, wr2, wr3,
    resampleRate,
    auResampleRate,
    auShift,
    auDecimation
    );

input   [12:0]addr;
input   [31:0]dataIn;
output  [31:0]dataOut;

`ifdef USE_BUS_CLOCK
input   busClk;
`endif
input   cs;
input   wr0,wr1,wr2,wr3;

output  [31:0] resampleRate;
reg     [31:0] resampleRate;

output  [31:0] auResampleRate;
reg     [31:0] auResampleRate;

output  [14:0] auDecimation;
reg     [14:0] auDecimation;

output  [5:0] auShift;
reg     [5:0] auShift;

`ifdef USE_BUS_CLOCK
always @(posedge busClk) begin
    if (cs & wr0) begin
`else
always @(negedge wr0) begin
    if (cs) begin
`endif
        casex (addr)
            `RESAMPLER_RATE: resampleRate[7:0] <= dataIn[7:0];
            `RESAMPLER_AURATE: auResampleRate[7:0] <= dataIn[7:0];
            `RESAMPLER_AUDECIMATION: auDecimation[7:0] <= dataIn[7:0];
            `RESAMPLER_AUSHIFT: auShift <= dataIn[5:0];
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
            `RESAMPLER_RATE:   resampleRate[15:8] <= dataIn[15:8];
            `RESAMPLER_AURATE: auResampleRate[15:8] <= dataIn[15:8];
            `RESAMPLER_AUDECIMATION: auDecimation[14:8] <= dataIn[14:8];
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
            `RESAMPLER_RATE:   resampleRate[23:16] <= dataIn[23:16];
            `RESAMPLER_AURATE: auResampleRate[23:16] <= dataIn[23:16];
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
            `RESAMPLER_RATE:   resampleRate[31:24] <= dataIn[31:24];
            `RESAMPLER_AURATE: auResampleRate[31:24] <= dataIn[31:24];
            default:  ;
            endcase
        end
    end

reg [31:0]dataOut;
always @* begin
    if (cs) begin
        casex (addr)
            `RESAMPLER_RATE:            dataOut = resampleRate;
            `RESAMPLER_AURATE:          dataOut = auResampleRate;
            `RESAMPLER_AUDECIMATION:    dataOut = {17'b0,auDecimation};
            `RESAMPLER_AUSHIFT:         dataOut = {26'b0,auShift};
            default:                    dataOut = 32'hx;
            endcase
        end
    else begin
        dataOut = 32'hx;
        end
    end
endmodule
