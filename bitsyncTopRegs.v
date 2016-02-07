/******************************************************************************
Copyright 2008-2015 Koos Technical Services, Inc. All Rights Reserved

This source code is the Intellectual Property of Koos Technical Services,Inc. 
(KTS) and is provided under a License Agreement which protects KTS' ownership and
derivative rights in exchange for negotiated compensation.
******************************************************************************/

`timescale 1ns/10ps

`include ".\addressMap.v"

`ifdef USE_BUS_CLOCK

module bitsyncTopRegs(
    busClk,
    addr,
    dataIn,
    dataOut,
    cs,
    wr0, wr1, wr2, wr3,
    ch0BitsyncLock,
    ch1BitsyncLock,
    bitsyncMode,
    ch0Dac0Select,
    ch0Dac1Select,
    ch0Dac2Select,
    ch1Dac0Select,
    ch1Dac1Select,
    ch1Dac2Select
    );

input           busClk;
input   [12:0]  addr;
input   [31:0]  dataIn;
output  [31:0]  dataOut;
input           cs;
input           wr0,wr1,wr2,wr3;

input           ch0BitsyncLock;
input           ch1BitsyncLock;

output  [1:0]   bitsyncMode;
reg     [1:0]   bitsyncMode;

output  [3:0]   ch0Dac0Select;
reg     [3:0]   ch0Dac0Select;

output  [3:0]   ch0Dac1Select;
reg     [3:0]   ch0Dac1Select;

output  [3:0]   ch0Dac2Select;
reg     [3:0]   ch0Dac2Select;

output  [3:0]   ch1Dac0Select;
reg     [3:0]   ch1Dac0Select;

output  [3:0]   ch1Dac1Select;
reg     [3:0]   ch1Dac1Select;

output  [3:0]   ch1Dac2Select;
reg     [3:0]   ch1Dac2Select;

always @(posedge busClk) begin
    if (cs && wr0) begin
        casex (addr)
            `BS_TOP_CONTROL: begin
                bitsyncMode <= dataIn[1:0];
                end
            `BS_TOP_CH0_DACSELECT: begin
                ch0Dac0Select <= dataIn[3:0];
                end
            `BS_TOP_CH1_DACSELECT: begin
                ch1Dac0Select <= dataIn[3:0];
                end
            default: ;
            endcase
        end
    if (cs && wr1) begin
        casex (addr)
            `BS_TOP_CH0_DACSELECT: begin
                ch0Dac1Select <= dataIn[11:8];
                end
            `BS_TOP_CH1_DACSELECT: begin
                ch1Dac1Select <= dataIn[11:8];
                end
            default: ;
            endcase
        end
    if (cs && wr2) begin
        casex (addr)
            `BS_TOP_CH0_DACSELECT: begin
                ch0Dac2Select <= dataIn[19:16];
                end
            `BS_TOP_CH1_DACSELECT: begin
                ch1Dac2Select <= dataIn[19:16];
                end
            default: ;
            endcase
        end
    if (cs && wr3) begin
        casex (addr)
            default: ;
            endcase
        end
    end

reg [31:0]dataOut;
always @* begin
    if (cs) begin
        casex (addr)
            `BS_TOP_CONTROL:        dataOut = {16'b0,14'b0,bitsyncMode};
            `BS_TOP_CH0_DACSELECT:  dataOut = {12'h0,ch0Dac2Select,4'h0,ch0Dac1Select,4'h0,ch0Dac0Select};
            `BS_TOP_CH1_DACSELECT:  dataOut = {12'h0,ch1Dac2Select,4'h0,ch1Dac1Select,4'h0,ch1Dac0Select};
            `BS_TOP_STATUS:         dataOut = {28'h0,
                                               2'b0,ch1BitsyncLock,ch0BitsyncLock};
            default:                dataOut = 32'h0;
            endcase
        end
    else begin
        dataOut = 32'hx;
        end
    end
endmodule

`else  // USE_BUS_CLOCK


module bitsyncTopRegs(
    addr,
    dataIn,
    dataOut,
    cs,
    wr0, wr1, wr2, wr3,
    ch0BitsyncLock,
    ch1BitsyncLock,
    bitsyncMode,
    ch0Dac0Select,
    ch0Dac1Select,
    ch0Dac2Select
    );

input   [12:0]  addr;
input   [31:0]  dataIn;
output  [31:0]  dataOut;
input           cs;
input           wr0,wr1,wr2,wr3;

input           ch0BitsyncLock;
input           ch1BitsyncLock;

output  [1:0]   bitsyncMode;
reg     [1:0]   bitsyncMode;

output  [3:0]   ch0Dac0Select;
reg     [3:0]   ch0Dac0Select;

output  [3:0]   ch0Dac1Select;
reg     [3:0]   ch0Dac1Select;

output  [3:0]   ch0Dac2Select;
reg     [3:0]   ch0Dac2Select;

always @(negedge wr0) begin
    if (cs) begin
        casex (addr)
            `BS_TOP_CONTROL: begin
                bitsyncMode <= dataIn[1:0];
                end
            `BS_TOP_DACSELECT: begin
                ch0Dac0Select <= dataIn[3:0];
                end
            default: ;
            endcase
        end
    end

always @(negedge wr1) begin
    if (cs) begin
        casex (addr)
            `BS_TOP_DACSELECT: begin
                ch0Dac1Select <= dataIn[11:8];
                end
            default: ;
            endcase
        end
    end

always @(negedge wr2) begin
    if (cs) begin
        casex (addr)
            `BS_TOP_DACSELECT: begin
                ch0Dac2Select <= dataIn[19:16];
                end
            default: ;
            endcase
        end
    end

always @(negedge wr3) begin
    if (cs) begin
        casex (addr)
            default: ;
            endcase
        end
    end

reg [31:0]dataOut;
always @* begin
    if (cs) begin
        casex (addr)
            `BS_TOP_CONTROL:     dataOut = {16'b0,14'b0,bitsyncMode};
            `BS_TOP_DACSELECT:   dataOut = {12'h0,ch0Dac2Select,4'h0,ch0Dac1Select,4'h0,ch0Dac0Select};
            `BS_TOP_STATUS:      dataOut = {28'h0,
                                           2'b0,ch1BitsyncLock,ch0BitsyncLock};
            default:            dataOut = 32'h0;
            endcase
        end
    else begin
        dataOut = 32'hx;
        end
    end
endmodule

`endif  // USE_BUS_CLOCK

