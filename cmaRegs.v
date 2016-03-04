/******************************************************************************
Copyright 2008-2016 Koos Technical Services, Inc. All Rights Reserved

This source code is the Intellectual Property of Koos Technical Services,Inc. 
(KTS) and is provided under a License Agreement which protects KTS' ownership and
derivative rights in exchange for negotiated compensation.
******************************************************************************/

`timescale 1ns/10ps

`include ".\addressMap.v"

module cmaRegs(
    input               [12:0]  addr,
    input               [31:0]  dataIn,
    output  reg         [31:0]  dataOut,
    input                       cs,
    input                       wr0, wr1, wr2, wr3,
    output  reg                 enableEqualizer,
    output  reg                 resetEqualizer,
    output  reg         [2:0]   eqStepSizeExponent,
    output  reg         [15:0]  cmaReference
);

    always @(negedge wr0) begin
        if (cs) begin
            casex (addr)
                `EQ_CONTROL: begin
                    enableEqualizer <= dataIn[0];
                    resetEqualizer  <= dataIn[1];
                end
                `EQ_STEP_SIZE: begin
                    eqStepSizeExponent <= dataIn[2:0];
                end
                `EQ_CMA_REFERENCE: begin
                    cmaReference[7:0] <= dataIn[7:0];
                end
                default: ;
            endcase
        end
    end

    always @(negedge wr1) begin
        if (cs) begin
            casex (addr)
                `EQ_CMA_REFERENCE: begin
                    cmaReference[15:8] <= dataIn[15:8];
                end
                default:  ;
            endcase
        end
    end


    always @* begin
        if (cs) begin
            casex (addr)
                `EQ_CONTROL:        dataOut = {30'h0,resetEqualizer,enableEqualizer};
                `EQ_STEP_SIZE:      dataOut = {29'h0,eqStepSizeExponent};
                `EQ_CMA_REFERENCE:  dataOut = {16'h0,cmaReference};
                default:            dataOut = 32'h0;
            endcase
        end
        else begin
            dataOut = 32'hx;
        end
    end
endmodule
