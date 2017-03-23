/******************************************************************************
Copyright 2008-2015 Koos Technical Services, Inc. All Rights Reserved

This source code is the Intellectual Property of Koos Technical Services,Inc. 
(KTS) and is provided under a License Agreement which protects KTS' ownership and
derivative rights in exchange for negotiated compensation.
******************************************************************************/

`timescale 1ns/10ps
`include "addressMap.v"

module cicRegs(
    `ifdef USE_BUS_CLOCK
    input           busClk,
    `endif
    input           cs,
    input           wr0, wr1, wr2, wr3,
    input       [12:0]  addr,
    input       [31:0]  dataIn,
    output      [31:0]  dataOut,
    output  reg [14:0]  cicDecimation,
    output  reg [5:0]   cicShift
);

    `ifdef USE_BUS_CLOCK
    always @(posedge busClk) begin
        if (cs & wr0) begin
    `else
    always @(negedge wr0) begin
        if (cs) begin
    `endif
            casex (addr)
                `CIC_DECIMATION:    cicDecimation[7:0] <= dataIn[7:0];
                `CIC_SHIFT:         cicShift <= dataIn[5:0];
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
                `CIC_DECIMATION:    cicDecimation[14:8] <= dataIn[14:8];
                default: ;
            endcase
        end
    end

    reg [31:0]dataOut;
    always @* begin
        if (cs) begin
            casex (addr)
                `CIC_DECIMATION:    dataOut = {17'b0,cicDecimation};
                `CIC_SHIFT:         dataOut = {26'b0,cicShift};
                default:            dataOut = 32'h0;
            endcase
        end
        else begin
            dataOut = 32'hx;
        end
    end

endmodule
