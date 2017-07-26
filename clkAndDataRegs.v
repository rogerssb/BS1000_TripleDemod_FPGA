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
    output  reg         clkReset
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
                default: ;
            endcase
        end
        if (cs && wr1) begin
            casex (addr)
                `CandD_CONTROL:   begin
                    clkPhase <= dataIn[9:8];
                end
                default: ;
            endcase
        end
        if (cs && wr3) begin
            casex (addr)
                `CandD_CONTROL:   begin
                    clkReset <= dataIn[31];
                end
                default: ;
            endcase
        end
    end

    always @* begin
        if (cs) begin
            casex (addr)
                `CandD_CONTROL: begin
                    dataOut = {clkReset,15'b0,6'b0,clkPhase,5'b0,source};
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

