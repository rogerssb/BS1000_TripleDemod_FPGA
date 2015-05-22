/******************************************************************************
Copyright 2008-2015 Koos Technical Services, Inc. All Rights Reserved

This source code is the Intellectual Property of Koos Technical Services,Inc. 
(KTS) and is provided under a License Agreement which protects KTS' ownership and
derivative rights in exchange for negotiated compensation.
******************************************************************************/

`timescale 1ns/10ps

`include "..\addressMap.v"

module fmRegs(addr,
             dataIn,
             dataOut,
             wr0, wr1, wr2, wr3,
             discDelay
             );

input   [11:0]addr;
input   [31:0]dataIn;
output  [31:0]dataOut;
input   wr0,wr1,wr2,wr3;

output  [7:0] discDelay;
reg     [7:0] discDelay;

always @(negedge wr0) begin
    casex (addr)
        `FM_CONTROL0:       discDelay <= dataIn[7:0];
        default:  ;
        endcase
    end


reg [31:0]dataOut;
always @(addr or
         discDelay) begin
    casex (addr)
        `FM_CONTROL0:       dataOut <= {24'bx,discDelay};
        default:            dataOut <= 32'hx;
        endcase
    end
endmodule
