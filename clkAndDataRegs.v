/******************************************************************************
Copyright 2008-2015 Koos Technical Services, Inc. All Rights Reserved

This source code is the Intellectual Property of Koos Technical Services,Inc.
(KTS) and is provided under a License Agreement which protects KTS' ownership and
derivative rights in exchange for negotiated compensation.
******************************************************************************/

`timescale 1ns/10ps

`include "addressMap.v"

module clkAndDataRegs(
    input               busClk,
    input       [12:0]  addr,
    input       [31:0]  dataIn,
    output  reg [31:0]  dataOut,
    input               wr0, wr1, wr2, wr3,
    output  reg [2:0]   source,
    output  reg [1:0]   clkPhase,
    output  reg         finalOutputSelect,
    output  reg         clkReset,
    output  reg [31:0]  dllCenterFreq,
    output  reg [4:0]   dllLoopGain,
    output  reg [7:0]   dllFeedbackDivider
);

    parameter RegSpace = `CandD0SPACE;

    reg cs;
    always @* begin
        casex(addr)
            RegSpace:               cs = 1;
            default:                cs = 0;
        endcase
    end


    //************************** General Registers ********************************

    always @(posedge busClk) begin
        if (cs && wr0) begin
            casex (addr)
                `CandD_CONTROL:   begin
                    source <= dataIn[2:0];
                end
                `CandD_DLL_CENTER_FREQ: begin
                    dllCenterFreq[7:0] <= dataIn[7:0];
                end
                `CandD_DLL_GAINS: begin
                    dllLoopGain <= dataIn[4:0];
                end
                default: ;
            endcase
        end
        if (cs && wr1) begin
            casex (addr)
                `CandD_CONTROL:   begin
                    clkPhase <= dataIn[9:8];
                end
                `CandD_DLL_CENTER_FREQ: begin
                    dllCenterFreq[15:8] <= dataIn[15:8];
                end
                default: ;
            endcase
        end
        if (cs && wr2) begin
            casex (addr)
                `CandD_DLL_CENTER_FREQ: begin
                    dllCenterFreq[23:16] <= dataIn[23:16];
                end
                `CandD_DLL_FDBK_DIV: begin
                    dllFeedbackDivider <= dataIn[23:16];
                end
                default: ;
            endcase
        end
        if (cs && wr3) begin
            casex (addr)
                `CandD_CONTROL:   begin
                    finalOutputSelect <= dataIn[24];
                    clkReset <= dataIn[31];
                end
                `CandD_DLL_CENTER_FREQ: begin
                    dllCenterFreq[31:24] <= dataIn[31:24];
                end
                default: ;
            endcase
        end
    end

    always @* begin
        if (cs) begin
            casex (addr)
                `CandD_CONTROL: begin
                    dataOut = {clkReset,6'b0,finalOutputSelect,
                               8'b0,
                               6'b0,clkPhase,
                               5'b0,source};
                end
                `CandD_DLL_CENTER_FREQ: begin
                    dataOut = dllCenterFreq;
                end
                `CandD_DLL_GAINS: begin
                    dataOut = {8'b0,dllFeedbackDivider,
                               11'b0,dllLoopGain};
                end
                `CandD_DLL_FDBK_DIV: begin
                    dataOut = {8'b0,dllFeedbackDivider,
                               11'b0,dllLoopGain};
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

