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
    ch0DCRemovalEnable,
    ch0HighImpedance,
    ch0SingleEnded,
    ch0DCGain,
    ch1Dac0Select,
    ch1Dac1Select,
    ch1Dac2Select,
    ch1DCRemovalEnable,
    ch1HighImpedance,
    ch1SingleEnded,
    ch1DCGain
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

output          ch0DCRemovalEnable;
reg             ch0DCRemovalEnable;

output          ch0HighImpedance;
reg             ch0HighImpedance;

output          ch0SingleEnded;
reg             ch0SingleEnded;

output  [4:0]   ch0DCGain;
reg     [4:0]   ch0DCGain;

output  [3:0]   ch1Dac0Select;
reg     [3:0]   ch1Dac0Select;

output  [3:0]   ch1Dac1Select;
reg     [3:0]   ch1Dac1Select;

output  [3:0]   ch1Dac2Select;
reg     [3:0]   ch1Dac2Select;

output          ch1DCRemovalEnable;
reg             ch1DCRemovalEnable;

output          ch1HighImpedance;
reg             ch1HighImpedance;

output          ch1SingleEnded;
reg             ch1SingleEnded;

output  [4:0]   ch1DCGain;
reg     [4:0]   ch1DCGain;

always @(posedge busClk) begin
    if (cs && wr0) begin
        casex (addr)
            `BS_TOP_CONTROL: begin
                bitsyncMode <= dataIn[1:0];
                end
            `BS_TOP_CH0_CONTROL: begin
                ch0Dac0Select <= dataIn[3:0];
                end
            `BS_TOP_CH1_CONTROL: begin
                ch1Dac0Select <= dataIn[3:0];
                end
            `BS_TOP_DC_GAINS:    begin
                ch0DCGain <= dataIn[4:0];
                end
            default: ;
            endcase
        end
    if (cs && wr1) begin
        casex (addr)
            `BS_TOP_CH0_CONTROL: begin
                ch0Dac1Select <= dataIn[11:8];
                end
            `BS_TOP_CH1_CONTROL: begin
                ch1Dac1Select <= dataIn[11:8];
                end
            `BS_TOP_DC_GAINS:    begin
                ch1DCGain <= dataIn[12:8];
                end
            default: ;
            endcase
        end
    if (cs && wr2) begin
        casex (addr)
            `BS_TOP_CH0_CONTROL: begin
                ch0Dac2Select <= dataIn[19:16];
                end
            `BS_TOP_CH1_CONTROL: begin
                ch1Dac2Select <= dataIn[19:16];
                end
            default: ;
            endcase
        end
    if (cs && wr3) begin
        casex (addr)
            `BS_TOP_CH0_CONTROL: begin
                ch0SingleEnded <= dataIn[29];
                ch0HighImpedance <= dataIn[30];
                ch0DCRemovalEnable <= dataIn[31];
                end
            `BS_TOP_CH1_CONTROL: begin
                ch1SingleEnded <= dataIn[29];
                ch1HighImpedance <= dataIn[30];
                ch1DCRemovalEnable <= dataIn[31];
                end
            default: ;
            endcase
        end
    end

reg [31:0]dataOut;
always @* begin
    if (cs) begin
        casex (addr)
            `BS_TOP_CONTROL:        dataOut = {16'b0,14'b0,bitsyncMode};
            `BS_TOP_CH0_CONTROL:    dataOut = {ch0DCRemovalEnable,ch0HighImpedance,ch0SingleEnded,5'b0,
                                               4'h0,ch0Dac2Select,
                                               4'h0,ch0Dac1Select,
                                               4'h0,ch0Dac0Select};
            `BS_TOP_CH1_CONTROL:    dataOut = {ch1DCRemovalEnable,ch1HighImpedance,ch1SingleEnded,5'b0,
                                               4'h0,ch1Dac2Select,
                                               4'h0,ch1Dac1Select,
                                               4'h0,ch1Dac0Select};
            `BS_TOP_STATUS:         dataOut = {28'h0,
                                               2'b0,ch1BitsyncLock,ch0BitsyncLock};
            `BS_TOP_DC_GAINS:       dataOut = {16'h0,3'b0,ch1DCGain,3'b0,ch0DCGain};
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

