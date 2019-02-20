/******************************************************************************
Copyright 2008-2015 Koos Technical Services, Inc. All Rights Reserved

This source code is the Intellectual Property of Koos Technical Services,Inc.
(KTS) and is provided under a License Agreement which protects KTS' ownership and
derivative rights in exchange for negotiated compensation.
******************************************************************************/

`timescale 1ns/10ps

`include "addressMap.v"

module decoderRegs #(parameter ADDR_BITS = 13) (
    `ifdef USE_BUS_CLOCK
    input                   busClk,
    `endif
    input                   cs,
    input                   wr0, wr1, wr2, wr3,
    input   [ADDR_BITS-1:0] addr,
    input           [31:0]  dataIn,
    output  reg     [31:0]  dataOut,
    output  reg             fifoReset,
    output  reg     [1:0]   clkPhase,
    output  reg             clkSelect,
    output  reg             dataInvert,
    output  reg     [2:0]   derandomize,
    output  reg             demuxEnable,
    output  reg             feherEnable,
    output  reg             iqSwap,
    output  reg             biphaseEnable,
    output  reg             millerEnable,
    output  reg     [1:0]   mode,
    output  reg     [1:0]   inputSelect
);

    //************************** General Registers ********************************

    `ifdef USE_BUS_CLOCK
    always @(posedge busClk) begin
        if (cs && wr0) begin
    `else
    always @(negedge wr0) begin
        if (cs) begin
    `endif
            casex (addr)
                `DEC_CONTROL: begin
                    fifoReset <= dataIn[0];
                    clkPhase[0] <= dataIn[1];
                    clkSelect <= dataIn[2];
                    dataInvert <= dataIn[3];
                    derandomize[0] <= dataIn[4];
                    demuxEnable <= dataIn[5];
                    feherEnable <= dataIn[6];
                    iqSwap <= dataIn[7];
                end
                default: ;
            endcase
        end
    end


    `ifdef USE_BUS_CLOCK
    always @(posedge busClk) begin
        if (cs && wr1) begin
    `else
    always @(negedge wr1) begin
        if (cs) begin
    `endif
            casex (addr)
                `DEC_CONTROL: begin
                    biphaseEnable <= dataIn[8];
                    millerEnable <= dataIn[9];
                    mode <= dataIn[11:10];
                    derandomize[1] <= dataIn[12];
                    inputSelect <= dataIn[14:13];
                    derandomize[2] <= dataIn[15];
                end
                default: ;
            endcase
        end
    end

    `ifdef USE_BUS_CLOCK
    always @(posedge busClk) begin
        if (cs && wr2) begin
    `else
    always @(negedge wr2) begin
        if (cs) begin
    `endif
            casex (addr)
                `DEC_CONTROL: begin
                    clkPhase[1] <= dataIn[16];
                end
                default: ;
            endcase
        end
    end

    always @* begin
        if (cs) begin
            casex (addr)
                `DEC_CONTROL: begin
                    dataOut = { 15'h0,clkPhase[1],
                                derandomize[2], inputSelect, derandomize[1],
                                mode, millerEnable, biphaseEnable,
                                iqSwap, feherEnable, demuxEnable, derandomize[0],
                                dataInvert, clkSelect, clkPhase[0], fifoReset
                    };
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

