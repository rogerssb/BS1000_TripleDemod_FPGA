/******************************************************************************
Copyright 2008-2015 Koos Technical Services, Inc. All Rights Reserved

This source code is the Intellectual Property of Koos Technical Services,Inc.
(KTS) and is provided under a License Agreement which protects KTS' ownership and
derivative rights in exchange for negotiated compensation.
******************************************************************************/

`timescale 1ns/10ps

`include "addressMap.v"

module combinerRegs(
    input               busClk,
    input       [12:0]  addr,
    input       [31:0]  dataIn,
    output  reg [31:0]  dataOut,
    input               cs,
    input               wr0, wr1, wr2, wr3,
    output  reg [17:0]  lagCoef = 18'h0000,
    output  reg [17:0]  leadCoef = 18'h0000,
    output  reg [13:0]  sweepLimit = 14'h00xx,
    output  reg [17:0]  sweepRate = 18'h0000,
    output  reg [17:0]  refLevel = 18'h0000,
    output  reg [2:0]   attack = 3'b000,
    output  reg [2:0]   decay = 3'b000,
    output  reg         ifBS_n = 1'b0
);

    always @(posedge busClk) begin
        if (cs && wr0) begin
            casex (addr)
                `COMB_LAG_COEF:         lagCoef[7:0]    <= dataIn[7:0];
                `COMB_LEAD_COEF:        leadCoef[7:0]   <= dataIn[7:0];
                `COMB_SWEEP_LIMIT:      sweepLimit[7:0] <= dataIn[7:0];
                `COMB_SWEEP_RATE:       sweepRate[7:0]  <= dataIn[7:0];
                `COMB_REF_LEVEL:        refLevel[7:0]   <= dataIn[7:0];
                default: ;
            endcase
        end
        if (cs && wr1) begin
            casex (addr)
                `COMB_LAG_COEF:         lagCoef[15:8]    <= dataIn[15:8];
                `COMB_LEAD_COEF:        leadCoef[15:8]   <= dataIn[15:8];
                `COMB_SWEEP_LIMIT:      sweepLimit[13:8] <= dataIn[15:8];
                `COMB_SWEEP_RATE:       sweepRate[15:8]  <= dataIn[15:8];
                `COMP_OPTIONS:          ifBS_n           <= dataIn[8];
                `COMB_REF_LEVEL:        refLevel[15:8]   <= dataIn[15:8];
                default: ;
            endcase
        end
        if (cs && wr2) begin
            casex (addr)
                `COMB_LAG_COEF:         lagCoef[17:16]    <= dataIn[17:16];
                `COMB_LEAD_COEF:        leadCoef[17:16]   <= dataIn[17:16];
                `COMB_SWEEP_RATE:       sweepRate[17:16]  <= dataIn[17:16];
                `COMP_OPTIONS:      begin
                                        attack            <= dataIn[18:16];
                                        decay             <= dataIn[22:20];
                                    end
                `COMB_REF_LEVEL:        refLevel[17:16]   <= dataIn[17:16];
                default: ;
            endcase
        end
        if (cs && wr3) begin
            casex (addr)
                `COMP_OPTIONS:          ifBS_n           <= dataIn[24];
                default: ;
            endcase
        end
    end

    always @* begin
        if (cs) begin
            casex (addr)
                `COMB_LAG_COEF: begin
                    dataOut = {14'b0, lagCoef};
                    end
                `COMB_LEAD_COEF: begin
                    dataOut = {14'b0, leadCoef};
                    end
                `COMB_SWEEP_LIMIT: begin
                    dataOut = {"CB", 2'b0, sweepLimit};
                    end
                `COMB_SWEEP_RATE: begin
                    dataOut = {14'b0, sweepRate};
                    end
                `COMP_OPTIONS: begin
                    dataOut = {7'b0, ifBS_n, 1'b0, decay, 1'b0, attack, 16'b0};
                    end
                `COMB_REF_LEVEL: begin
                    dataOut = {14'b0, refLevel};
                    end
                default: begin
                    dataOut = 32'b0;
                    end
            endcase
        end
        else begin
            dataOut = 32'hx;
        end
    end


endmodule

