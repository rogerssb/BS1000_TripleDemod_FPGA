/******************************************************************************
Copyright 2008-2015 Koos Technical Services, Inc. All Rights Reserved

This source code is the Intellectual Property of Koos Technical Services,Inc.
(KTS) and is provided under a License Agreement which protects KTS' ownership and
derivative rights in exchange for negotiated compensation.
******************************************************************************/

`timescale 1ns/10ps
//`include "./../addressMap.v"

`ifndef COMB_LAG_COEF
`define COMB_LAG_COEF      6'b00_00xx
`define COMB_LEAD_COEF     6'b00_01xx
`define COMB_SWEEP_RATE    6'b00_10xx
`define COMB_SWEEP_LIMIT   6'b00_110x
`define COMB_OPTIONS       6'b00_111x
`define COMB_REF_LEVEL     6'b01_00xx
`endif

module combinerRegs(
    input               busClk,
    input       [5:0]   addr,
    input       [31:0]  dataIn,
    output  reg [31:0]  dataOut,
    input               cs,
    input               wr0, wr1, wr2, wr3,
    input               realLock, imagLock, locked, ddsMiso, combinerFlag, agc0_gt_agc1,
    input       [7:0]   Index,
    output  reg [31:0]  MDB_CombLag     = 32'h0000,
    output  reg [31:0]  MDB_CombLead    = 32'h0000,
    output  reg [15:0]  MDB_CombSwLmt   = 16'h0000,
    output  reg [31:0]  MDB_CombRate    = 32'h0000,
    output  reg [31:0]  MDB_CombRefLvl  = 32'h0000,
    output  reg [15:0]  MDB_CombOptions = 16'h0000
);

    always @(posedge busClk) begin
        if (cs && wr0) begin
            casex (addr)
                `COMB_LAG_COEF:         MDB_CombLag[7:0]        <= dataIn[7:0];
                `COMB_LEAD_COEF:        MDB_CombLead[7:0]       <= dataIn[7:0];
                `COMB_SWEEP_RATE:       MDB_CombRate[7:0]       <= dataIn[7:0];
                `COMB_REF_LEVEL:        MDB_CombRefLvl[7:0]     <= dataIn[7:0];
                `COMB_SWEEP_LIMIT:      MDB_CombSwLmt[7:0]      <= dataIn[7:0];
                default: ;
            endcase
        end
        if (cs && wr1) begin
            casex (addr)
                `COMB_LAG_COEF:         MDB_CombLag[15:8]       <= dataIn[15:8];
                `COMB_LEAD_COEF:        MDB_CombLead[15:8]      <= dataIn[15:8];
                `COMB_SWEEP_RATE:       MDB_CombRate[15:8]      <= dataIn[15:8];
                `COMB_REF_LEVEL:        MDB_CombRefLvl[15:8]    <= dataIn[15:8];
                `COMB_SWEEP_LIMIT:      MDB_CombSwLmt[15:8]     <= dataIn[15:8];
                default: ;
            endcase
        end
        if (cs && wr2) begin
            casex (addr)
                `COMB_LAG_COEF:         MDB_CombLag[23:16]      <= dataIn[23:16];
                `COMB_LEAD_COEF:        MDB_CombLead[23:16]     <= dataIn[23:16];
                `COMB_SWEEP_RATE:       MDB_CombRate[23:16]     <= dataIn[23:16];
                `COMB_REF_LEVEL:        MDB_CombRefLvl[23:16]   <= dataIn[23:16];
                `COMB_OPTIONS:          MDB_CombOptions[7:0]    <= dataIn[23:16];
                default: ;
            endcase
        end
        if (cs && wr3) begin
            casex (addr)
                `COMB_LAG_COEF:         MDB_CombLag[25:24]      <= dataIn[25:24];  // Upper 6 bits are feedback
 //             `COMB_LEAD_COEF:        MDB_CombLead[31:24]     <= dataIn[31:24];  // Use MSB for Index feedback
                `COMB_SWEEP_RATE:       MDB_CombRate[31:24]     <= dataIn[31:24];
                `COMB_REF_LEVEL:        MDB_CombRefLvl[31:24]   <= dataIn[31:24];
                `COMB_OPTIONS:          MDB_CombOptions[15:8]   <= dataIn[31:24];
                default: ;
            endcase
        end
    end

    always @* begin
        if (cs) begin
            casex (addr)
                `COMB_LAG_COEF:     dataOut = {ddsMiso, realLock, imagLock, locked, combinerFlag, agc0_gt_agc1, MDB_CombLag[25:0]};
                `COMB_LEAD_COEF:    dataOut = {Index, MDB_CombLead[23:0]};
                `COMB_SWEEP_LIMIT,
                `COMB_OPTIONS:      dataOut = {MDB_CombOptions, MDB_CombSwLmt};
                `COMB_SWEEP_RATE:   dataOut = MDB_CombRate;
                `COMB_REF_LEVEL:    dataOut = MDB_CombRefLvl;
                default:            dataOut = 32'b0;
            endcase
        end
        else begin
            dataOut = 32'hx;
        end
    end


endmodule

