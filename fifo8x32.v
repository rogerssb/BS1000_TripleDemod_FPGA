/******************************************************************************
Copyright 2008-2015 Koos Technical Services, Inc. All Rights Reserved

This source code is the Intellectual Property of Koos Technical Services,Inc.
(KTS) and is provided under a License Agreement which protects KTS' ownership and
derivative rights in exchange for negotiated compensation.
******************************************************************************/

`timescale 1ns/1ps
module fifo8x32(
    input               clk,
    input               clkEn,
    input               reset,
    input               wrEn,
    input       [7:0]   din,
    input               rdEn,
    output  reg [7:0]   dout,
    output              fifoEmpty
);

    reg     [7:0]   fifo[63:0];
    reg     [6:0]   depth;
    assign          fifoEmpty = (depth == 0);
    reg     [5:0]   rdAddr,wrAddr;
    always @(posedge clk) begin
        if (reset) begin
            rdAddr <= 0;
            wrAddr <= 0;
            depth <= 0;
        end
        else if (clkEn) begin
            // Fifo addresses
            if (wrEn && (depth < 64)) begin
                wrAddr <= wrAddr + 1;
            end
            if (rdEn && (depth > 0)) begin
                rdAddr <= rdAddr + 1;
            end
            // Fifo Depth
            if (wrEn && rdEn) begin
                depth <= depth;
            end
            else if (wrEn && (depth < 64)) begin
                depth <= depth + 1;
            end
            else if (rdEn && (depth > 0)) begin
                depth <= depth - 1;
            end
            // Data write
            if (wrEn) begin
                fifo[wrAddr] <= din;
            end
            dout <= fifo[rdAddr];
        end
    end


endmodule



