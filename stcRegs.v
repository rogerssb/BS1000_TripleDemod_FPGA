/******************************************************************************
Copyright 2008-2015 Koos Technical Services, Inc. All Rights Reserved

This source code is the Intellectual Property of Koos Technical Services,Inc.
(KTS) and is provided under a License Agreement which protects KTS' ownership and
derivative rights in exchange for negotiated compensation.
******************************************************************************/

`timescale 1ns/10ps

`include "addressMap.v"

module stcRegs(
    `ifdef USE_BUS_CLOCK
    input                       busClk,
    `endif
    input                       cs,
    input                       wr0, wr1, wr2, wr3,
    input               [12:0]  addr,
    input               [31:0]  dataIn,
    output  reg         [31:0]  dataOut,
    output  reg         [31:0]  clocksPerBit,
    output  reg                 spectrumInvert,
    output  reg         [11:0]  pilotOffset,
    output  reg         [3:0]   dac0Select,
    output  reg         [3:0]   dac1Select,
    output  reg         [3:0]   dac2Select
);

    `ifdef USE_BUS_CLOCK
    always @(posedge busClk) begin
        if (cs & wr0) begin
    `else
    always @(negedge wr0) begin
        if (cs) begin
    `endif
            casex (addr)
                `STC_CLOCKS_PER_BIT: begin
                    clocksPerBit[7:0] <= dataIn[7:0];
                    end
                `STC_PILOT_OFFSET: begin
                    pilotOffset[7:0] <= dataIn[7:0];
                    end
                `STC_DAC_SELECT: begin
                    dac0Select <= dataIn[3:0];
                    end
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
                `STC_CLOCKS_PER_BIT: begin
                    clocksPerBit[15:8] <= dataIn[15:8];
                    end
                `STC_PILOT_OFFSET: begin
                    pilotOffset[11:8] <= dataIn[11:8];
                    end
                `STC_DAC_SELECT: begin
                    dac1Select <= dataIn[11:8];
                    end
                default:  ;
            endcase
        end
    end

    `ifdef USE_BUS_CLOCK
    always @(posedge busClk) begin
        if (cs & wr2) begin
    `else
    always @(negedge wr2) begin
        if (cs) begin
    `endif
            casex (addr)
                `STC_CLOCKS_PER_BIT: begin
                    spectrumInvert <= dataIn[16];
                    end
                `STC_DAC_SELECT: begin
                    dac2Select <= dataIn[19:16];
                    end
                default:  ;
            endcase
        end
    end
/*
    `ifdef USE_BUS_CLOCK
    always @(posedge busClk) begin
        if (cs & wr3) begin
    `else
    always @(negedge wr3) begin
        if (cs) begin
    `endif
            casex (addr)
                `DDC_CENTER_FREQ:   ddcCenterFreq[31:24] <= dataIn[31:24];
                default:  ;
            endcase
        end
    end
*/
    always @* begin
        if (cs) begin
            casex (addr)
                `STC_CLOCKS_PER_BIT:    dataOut = {
                                            15'h0, spectrumInvert, 
                                            clocksPerBit
                                        };
                `STC_PILOT_OFFSET:      dataOut = {20'h0, pilotOffset};
                `STC_DAC_SELECT:        dataOut = {
                                            8'h0, 
                                            4'h0, dac2Select,
                                            4'h0, dac1Select,
                                            4'h0, dac0Select
                                        };
                default:                dataOut = 32'h0;
            endcase
        end
        else begin
            dataOut = 32'hx;
        end
    end

endmodule
