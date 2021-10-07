/******************************************************************************
Copyright 2008-2015 Koos Technical Services, Inc. All Rights Reserved

This source code is the Intellectual Property of Koos Technical Services,Inc.
(KTS) and is provided under a License Agreement which protects KTS' ownership and
derivative rights in exchange for negotiated compensation.
******************************************************************************/

`timescale 1ns/10ps
`define COMB_LAG_COEF      5'b0_00xx
`define COMB_LEAD_COEF     5'b0_01xx
`define COMB_SWEEP_RATE    5'b0_10xx
`define COMB_SWEEP_LIMIT   5'b0_110x
`define COMB_OPTIONS       5'b0_111x
`define COMB_REF_LEVEL     5'b1_00xx


module combinerRegs(
    input               busClk,
    input       [4:0]   addr,
    input       [31:0]  dataIn,
    output  reg [31:0]  dataOut,
    input               cs,
    input               wr0, wr1, wr2, wr3,
    input               realLock, imagLock,
    input       [7:0]   Index,
    output  reg [31:0]  MDB_180_1 = 32'h0000,
    output  reg [31:0]  MDB_182_3 = 32'h0000,
    output  reg [15:0]  MDB_186   = 16'h0000,
    output  reg [31:0]  MDB_184_5 = 32'h0000,
    output  reg [31:0]  MDB_188_9 = 32'h0000,
    output  reg [15:0]  MDB_187   = 16'h0000
);

    always @(posedge busClk) begin
        if (cs && wr0) begin
            casex (addr)
                `COMB_LAG_COEF:         MDB_180_1[7:0]  <= dataIn[7:0];
                `COMB_LEAD_COEF:        MDB_182_3[7:0]  <= dataIn[7:0];
                `COMB_SWEEP_RATE:       MDB_184_5[7:0]  <= dataIn[7:0];
                `COMB_REF_LEVEL:        MDB_188_9[7:0]  <= dataIn[7:0];
                `COMB_SWEEP_LIMIT:      MDB_186[7:0]    <= dataIn[7:0];
                default: ;
            endcase
        end
        if (cs && wr1) begin
            casex (addr)
                `COMB_LAG_COEF:         MDB_180_1[15:8] <= dataIn[15:8];
                `COMB_LEAD_COEF:        MDB_182_3[15:8] <= dataIn[15:8];
                `COMB_SWEEP_RATE:       MDB_184_5[15:8] <= dataIn[15:8];
                `COMB_REF_LEVEL:        MDB_188_9[15:8] <= dataIn[15:8];
                `COMB_SWEEP_LIMIT:      MDB_186[15:8]   <= dataIn[15:8];
                default: ;
            endcase
        end
        if (cs && wr2) begin
            casex (addr)
                `COMB_LAG_COEF:         MDB_180_1[23:16] <= dataIn[23:16];
                `COMB_LEAD_COEF:        MDB_182_3[23:16] <= dataIn[23:16];
                `COMB_SWEEP_RATE:       MDB_184_5[23:16] <= dataIn[23:16];
                `COMB_REF_LEVEL:        MDB_188_9[23:16] <= dataIn[23:16];
                `COMB_OPTIONS:          MDB_187[7:0]     <= dataIn[23:16];
                default: ;
            endcase
        end
        if (cs && wr3) begin
            casex (addr)
                `COMB_LAG_COEF:         MDB_180_1[28:24] <= dataIn[28:24];
 //             `COMB_LEAD_COEF:        MDB_182_3[31:24] <= dataIn[31:24];
                `COMB_SWEEP_RATE:       MDB_184_5[31:24] <= dataIn[31:24];
                `COMB_REF_LEVEL:        MDB_188_9[31:24] <= dataIn[31:24];
                `COMB_OPTIONS:          MDB_187[15:8]    <= dataIn[31:24];
                default: ;
            endcase
        end
    end

    always @* begin
        MDB_180_1[31:29] = {realLock | imagLock, realLock, imagLock};
        MDB_182_3[31:24] = Index;
        if (cs) begin
            casex (addr)
                `COMB_LAG_COEF:     dataOut = MDB_180_1;
                `COMB_LEAD_COEF:    dataOut = MDB_182_3;
                `COMB_SWEEP_LIMIT,
                `COMB_OPTIONS:      dataOut = {MDB_187, MDB_186};
                `COMB_SWEEP_RATE:   dataOut = MDB_184_5;
                `COMB_REF_LEVEL:    dataOut = MDB_188_9;
                default:            dataOut = 32'b0;
            endcase
        end
        else begin
            dataOut = 32'hx;
        end
    end


endmodule

