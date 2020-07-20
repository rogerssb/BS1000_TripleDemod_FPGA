/******************************************************************************
Copyright 2008-2015 Koos Technical Services, Inc. All Rights Reserved

This source code is the Intellectual Property of Koos Technical Services,Inc. 
(KTS) and is provided under a License Agreement which protects KTS' ownership and
derivative rights in exchange for negotiated compensation.
******************************************************************************/

`timescale 1ns/10ps

`include ".\addressMap.v"

`ifdef USE_BUS_CLOCK

module dfRegs(
    busClk,
    addr,
    dataIn,
    dataOut,
    cs,
    wr0, wr1, wr2, wr3,
    bypassHb0, bypassCic, bypassHb1,bypassFir,
    cicDecimation,
    cicShift
);

input           busClk;
input   [12:0]  addr;
input   [31:0]  dataIn;
output  [31:0]  dataOut;
input           cs;
input           wr0,wr1,wr2,wr3;


output          bypassHb0;
reg             bypassHb0;

output          bypassCic;
reg             bypassCic;

output          bypassHb1;
reg             bypassHb1;

output          bypassFir;
reg             bypassFir;

output  [14:0]  cicDecimation;
reg     [14:0]  cicDecimation;

output  [5:0]   cicShift;
reg     [5:0]   cicShift;

always @(posedge busClk) begin
    if (cs && wr0) begin
        casex (addr)
            `DF_CONTROL: begin
                bypassHb0 <= dataIn[0];
                bypassCic <= dataIn[1];
                bypassHb1 <= dataIn[2];
                bypassFir <= dataIn[3];
                end
            `DF_CIC_DECIMATION:    cicDecimation[7:0] <= dataIn[7:0];
            `DF_CIC_SHIFT:         cicShift <= dataIn[5:0];
            default: ;
            endcase
        end
    if (cs && wr1) begin
        casex (addr)
            `DF_CIC_DECIMATION:    cicDecimation[14:8] <= dataIn[14:8];
            default:  ;
            endcase
        end
    end

reg [31:0]dataOut;
always @* begin
    if (cs) begin
        casex (addr)
            `DF_CONTROL:        dataOut = {28'h0,bypassFir,bypassHb1,bypassCic,bypassHb0};
            `DF_CIC_DECIMATION: dataOut = {17'b0,cicDecimation};
            `DF_CIC_SHIFT:      dataOut = {26'b0,cicShift};
            default:            dataOut = 32'h0;
            endcase
        end
    else begin
        dataOut = 32'hx;
        end
    end
endmodule

`else // USE_BUS_CLOCK

module dfRegs(addr,
               dataIn,
               dataOut,
               cs,
               wr0, wr1, wr2, wr3,
               bypassHb0, bypassCic, bypassHb1,bypassFir,
               cicDecimation,
               cicShift
               );

input   [12:0]  addr;
input   [31:0]  dataIn;
output  [31:0]  dataOut;
input           cs;
input           wr0,wr1,wr2,wr3;


output          bypassHb0;
reg             bypassHb0;

output          bypassCic;
reg             bypassCic;

output          bypassHb1;
reg             bypassHb1;

output          bypassFir;
reg             bypassFir;

output  [14:0]  cicDecimation;
reg     [14:0]  cicDecimation;

output  [5:0]   cicShift;
reg     [5:0]   cicShift;

always @(negedge wr0) begin
    if (cs) begin
        casex (addr)
            `DF_CONTROL: begin
                bypassHb0 <= dataIn[0];
                bypassCic <= dataIn[1];
                bypassHb1 <= dataIn[2];
                bypassFir <= dataIn[3];
                end
            `DF_CIC_DECIMATION:    cicDecimation[7:0] <= dataIn[7:0];
            `DF_CIC_SHIFT:         cicShift <= dataIn[5:0];
            default: ;
            endcase
        end
    end

always @(negedge wr1) begin
    if (cs) begin
        casex (addr)
            `DF_CIC_DECIMATION:    cicDecimation[14:8] <= dataIn[14:8];
            default:  ;
            endcase
        end
    end

reg [31:0]dataOut;
always @* begin
    if (cs) begin
        casex (addr)
            `DF_CONTROL:        dataOut = {28'h0,bypassFir,bypassHb1,bypassCic,bypassHb0};
            `DF_CIC_DECIMATION: dataOut = {17'b0,cicDecimation};
            `DF_CIC_SHIFT:      dataOut = {26'b0,cicShift};
            default:            dataOut = 32'h0;
            endcase
        end
    else begin
        dataOut = 32'hx;
        end
    end
endmodule

`endif  // USE_BUS_CLOCK
