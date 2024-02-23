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
    input       [31:0]  din,
    output  reg [31:0]  dout,
    input               cs,
    input               wr0, wr1, wr2, wr3,
    output  reg [3:0]   source,
    output  reg [1:0]   clkPhase,
    output  reg [1:0]   finalOutputSelect,
    output  reg         clkReset,
    output  reg [31:0]  dllCenterFreq,
    output  reg [4:0]   dllLoopGain,
    output  reg [7:0]   dllFeedbackDivider
);

    parameter RegSpace = `CandD0SPACE;

    reg cAndDSpace;
    always @* begin
        casex(addr)
            RegSpace:               cAndDSpace = cs;
            default:                cAndDSpace = 0;
        endcase
    end


    //************************** General Registers ********************************

    always @(posedge busClk) begin
        if (cAndDSpace && wr0) begin
            casex (addr)
                `CandD_CONTROL:   begin
                    source <= din[3:0];
                end
                `CandD_DLL_CENTER_FREQ: begin
                    dllCenterFreq[7:0] <= din[7:0];
                end
                `CandD_DLL_GAINS: begin
                    dllLoopGain <= din[4:0];
                end
                default: ;
            endcase
        end
        if (cAndDSpace && wr1) begin
            casex (addr)
                `CandD_CONTROL:   begin
                    clkPhase <= din[9:8];
                end
                `CandD_DLL_CENTER_FREQ: begin
                    dllCenterFreq[15:8] <= din[15:8];
                end
                default: ;
            endcase
        end
        if (cAndDSpace && wr2) begin
            casex (addr)
                `CandD_DLL_CENTER_FREQ: begin
                    dllCenterFreq[23:16] <= din[23:16];
                end
                `CandD_DLL_FDBK_DIV: begin
                    dllFeedbackDivider <= din[23:16];
                end
                default: ;
            endcase
        end
        if (cAndDSpace && wr3) begin
            casex (addr)
                `CandD_CONTROL:   begin
                    finalOutputSelect <= din[25:24];
                    clkReset <= din[31];
                end
                `CandD_DLL_CENTER_FREQ: begin
                    dllCenterFreq[31:24] <= din[31:24];
                end
                default: ;
            endcase
        end
    end

    always @* begin
        if (cAndDSpace) begin
            casex (addr)
                `CandD_CONTROL: begin
                    dout = {clkReset,5'b0,finalOutputSelect,
                               8'b0,
                               6'b0,clkPhase,
                               4'b0,source};
                end
                `CandD_DLL_CENTER_FREQ: begin
                    dout = dllCenterFreq;
                end
                `CandD_DLL_GAINS: begin
                    dout = {8'b0,dllFeedbackDivider,
                               11'b0,dllLoopGain};
                end
                `CandD_DLL_FDBK_DIV: begin
                    dout = {8'b0,dllFeedbackDivider,
                               11'b0,dllLoopGain};
                end
                default: begin
                    dout = 32'b0;
                end
            endcase
        end
        else begin
            dout = 32'hx;
        end
    end


endmodule

