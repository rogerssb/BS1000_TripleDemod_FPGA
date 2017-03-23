/******************************************************************************
Copyright 2008-2015 Koos Technical Services, Inc. All Rights Reserved

This source code is the Intellectual Property of Koos Technical Services,Inc. 
(KTS) and is provided under a License Agreement which protects KTS' ownership and
derivative rights in exchange for negotiated compensation.
******************************************************************************/

`timescale 1ns/10ps

`include ".\addressMap.v"

module carrierLoopRegs(
    `ifdef USE_BUS_CLOCK
    input                       busClk,
    `endif
    input                       cs,
    input                       wr0, wr1, wr2, wr3,
    input               [12:0]  addr,
    input               [31:0]  dataIn,
    output  reg         [31:0]  dataOut,
    input       signed  [31:0]  lagAccum,
    input                       lockStatus,
    output  reg                 invertError,
    output  reg                 zeroError,
    output  reg                 ctrl2,
    output  reg                 clearAccum,
    output  reg                 ctrl4,
    output  reg         [1:0]   acqTrackControl,
    output  reg         [4:0]   leadExp,
    output  reg         [7:0]   leadMan,
    output  reg         [4:0]   lagExp,
    output  reg         [7:0]   lagMan,
    output  reg signed  [31:0]  upperLimit,
    output  reg signed  [31:0]  lowerLimit,
    output  reg         [31:0]  loopData,
    output  reg         [15:0]  lockCount,
    output  reg         [11:0]  syncThreshold
);

    `ifdef USE_BUS_CLOCK
    always @(posedge busClk) begin
        if (cs & wr0) begin
    `else
    always @(negedge wr0) begin
        if (cs) begin
    `endif
            casex (addr)
                `CLF_CONTROL: begin
                    zeroError <= dataIn[0];
                    invertError <= dataIn[1];
                    ctrl2 <= dataIn[2];
                    clearAccum <= dataIn[3];
                    ctrl4 <= dataIn[4];
                    end
                `CLF_LEAD_LAG: begin
                   lagExp <= dataIn[4:0];
                   end
                `CLF_ULIMIT: begin
                    upperLimit[7:0] <= dataIn[7:0];
                    end
                `CLF_LLIMIT: begin
                    lowerLimit[7:0] <= dataIn[7:0];
                    end
                `CLF_LOOPDATA: begin
                    loopData[7:0] <= dataIn[7:0];
                    end
                `CLF_LOCKDETECTOR: begin
                    lockCount[7:0] <= dataIn[7:0];
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
                `CLF_CONTROL: begin
                    acqTrackControl <= dataIn[9:8];
                    end
                `CLF_LEAD_LAG: begin
                    lagMan <= dataIn[15:8];
                    end
                `CLF_ULIMIT: begin
                    upperLimit[15:8] <= dataIn[15:8];
                    end
                `CLF_LLIMIT: begin
                    lowerLimit[15:8] <= dataIn[15:8];
                    end
                `CLF_LOOPDATA: begin
                    loopData[15:8] <= dataIn[15:8];
                    end
                `CLF_LOCKDETECTOR: begin
                    lockCount[15:8] <= dataIn[15:8];
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
                `CLF_LEAD_LAG: begin
                   leadExp <= dataIn[20:16];
                   end
                `CLF_ULIMIT: begin
                    upperLimit[23:16] <= dataIn[23:16];
                    end
                `CLF_LLIMIT: begin
                    lowerLimit[23:16] <= dataIn[23:16];
                    end
                `CLF_LOOPDATA: begin
                    loopData[23:16] <= dataIn[23:16];
                    end
                `CLF_LOCKDETECTOR: begin
                    syncThreshold[7:0] <= dataIn[23:16];
                    end
                default:  ;
            endcase
        end
    end

    `ifdef USE_BUS_CLOCK
    always @(posedge busClk) begin
        if (cs & wr3) begin
    `else
    always @(negedge wr3) begin
        if (cs) begin
    `endif
            casex (addr)
                `CLF_LEAD_LAG: begin
                   leadMan <= dataIn[31:24];
                   end
                `CLF_ULIMIT: begin
                    upperLimit[31:24] <= dataIn[31:24];
                    end
                `CLF_LLIMIT: begin
                    lowerLimit[31:24] <= dataIn[31:24];
                    end
                `CLF_LOOPDATA: begin
                    loopData[31:24] <= dataIn[31:24];
                    end
                `CLF_LOCKDETECTOR: begin
                    syncThreshold[11:8] <= dataIn[27:24];
                    end
                default:  ;
            endcase
        end
    end

    reg [31:0]dataOut;
    always @* begin
        if (cs) begin
            casex (addr)
                `CLF_CONTROL:        dataOut = {lockStatus,16'b0,6'b0,acqTrackControl,3'b0,ctrl4,clearAccum,ctrl2,invertError,zeroError};
                `CLF_LEAD_LAG:       dataOut = {leadMan,3'bx,leadExp,lagMan,3'bx,lagExp};
                `CLF_ULIMIT:         dataOut = upperLimit;
                `CLF_LLIMIT:         dataOut = lowerLimit;
                `CLF_LOOPDATA:       dataOut = loopData;
                `CLF_LOCKDETECTOR:   dataOut = {4'h0,syncThreshold,lockCount};
                `CLF_INTEGRATOR:     dataOut = lagAccum;
                default:             dataOut = 32'hx;
            endcase
        end
        else begin
            dataOut = 32'hx;
        end
    end

endmodule
