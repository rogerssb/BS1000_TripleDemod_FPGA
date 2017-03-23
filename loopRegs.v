/******************************************************************************
Copyright 2008-2015 Koos Technical Services, Inc. All Rights Reserved

This source code is the Intellectual Property of Koos Technical Services,Inc. 
(KTS) and is provided under a License Agreement which protects KTS' ownership and
derivative rights in exchange for negotiated compensation.
******************************************************************************/

`timescale 1ns/10ps

`include "addressMap.v"

`ifdef USE_BUS_CLOCK

module loopRegs(
    input                       busClk,
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
    output  reg         [4:0]   leadExp,
    output  reg         [7:0]   leadMan,
    output  reg         [4:0]   lagExp,
    output  reg         [7:0]   lagMan,
    output  reg signed  [31:0]  limit,
    output  reg         [31:0]  loopData,
    output  reg         [4:0]   leadExp1,
    output  reg         [7:0]   leadMan1,
    output  reg         [4:0]   lagExp1,
    output  reg         [7:0]   lagMan1,
    output  reg         [31:0]  loopData1,
    output  reg         [15:0]  lockCount,
    output  reg         [11:0]  syncThreshold
);

    always @(posedge busClk) begin
        if (cs && wr0) begin
            casex (addr)
                `LF_CONTROL: begin
                    zeroError <= dataIn[0];
                    invertError <= dataIn[1];
                    ctrl2 <= dataIn[2];
                    clearAccum <= dataIn[3];
                    ctrl4 <= dataIn[4];
                    end
                `LF_LEAD_LAG: begin
                   lagExp <= dataIn[4:0];
                   end
                `LF_LIMIT: begin
                    limit[7:0] <= dataIn[7:0];
                    end
                `LF_LOOPDATA0: begin
                    loopData[7:0] <= dataIn[7:0];
                    end
                `LF_LEAD_LAG1: begin
                   lagExp1 <= dataIn[4:0];
                   end
                `LF_LOOPDATA1: begin
                    loopData1[7:0] <= dataIn[7:0];
                    end
                `LF_LOCKDETECTOR: begin
                    lockCount[7:0] <= dataIn[7:0];
                    end
                default: ;
            endcase
        end
        if (cs && wr1) begin
            casex (addr)
                `LF_LEAD_LAG: begin
                   lagMan <= dataIn[15:8];
                   end
                `LF_LIMIT: begin
                    limit[15:8] <= dataIn[15:8];
                    end
                `LF_LOOPDATA0: begin
                    loopData[15:8] <= dataIn[15:8];
                    end
                `LF_LEAD_LAG1: begin
                   lagMan1 <= dataIn[15:8];
                   end
                `LF_LOOPDATA1: begin
                    loopData1[15:8] <= dataIn[15:8];
                    end
                `LF_LOCKDETECTOR: begin
                    lockCount[15:8] <= dataIn[15:8];
                    end
                default:  ;
            endcase
        end
        if (cs && wr2) begin
            casex (addr)
                `LF_LEAD_LAG: begin
                   leadExp <= dataIn[20:16];
                   end
                `LF_LIMIT: begin
                    limit[23:16] <= dataIn[23:16];
                    end
                `LF_LOOPDATA0: begin
                    loopData[23:16] <= dataIn[23:16];
                    end
                `LF_LEAD_LAG1: begin
                   leadExp1 <= dataIn[20:16];
                   end
                `LF_LOOPDATA1: begin
                    loopData1[23:16] <= dataIn[23:16];
                    end
                `LF_LOCKDETECTOR: begin
                    syncThreshold[7:0] <= dataIn[23:16];
                    end
                default:  ;
            endcase
        end
        if (cs && wr3) begin
            casex (addr)
                `LF_LEAD_LAG: begin
                   leadMan <= dataIn[31:24];
                   end
                `LF_LIMIT: begin
                    limit[31:24] <= dataIn[31:24];
                    end
                `LF_LOOPDATA0: begin
                    loopData[31:24] <= dataIn[31:24];
                    end
                `LF_LEAD_LAG1: begin
                   leadMan1 <= dataIn[31:24];
                   end
                `LF_LOOPDATA1: begin
                    loopData1[31:24] <= dataIn[31:24];
                    end
                `LF_LOCKDETECTOR: begin
                    syncThreshold[11:8] <= dataIn[27:24];
                    end
                default:  ;
            endcase
        end
    end

    always @* begin
        if (cs) begin
            casex (addr)
                `LF_CONTROL:        dataOut = {lockStatus,26'b0,ctrl4,clearAccum,ctrl2,invertError,zeroError};
                `LF_LEAD_LAG:       dataOut = {leadMan,3'bx,leadExp,lagMan,3'bx,lagExp};
                `LF_LIMIT:          dataOut = limit;
                `LF_LOOPDATA0:      dataOut = loopData;
                `LF_LOOPDATA1:      dataOut = loopData1;
                `LF_LEAD_LAG1:      dataOut = {leadMan1,3'bx,leadExp1,lagMan1,3'bx,lagExp1};
                `LF_LOCKDETECTOR:   dataOut = {4'h0,syncThreshold,lockCount};
                `LF_INTEGRATOR:     dataOut = lagAccum;
                default:            dataOut = 32'hx;
            endcase
        end
        else begin
            dataOut = 32'hx;
        end
    end

endmodule


`else   // USE_BUS_CLOCK

module loopRegs(
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
    output  reg         [4:0]   leadExp,
    output  reg         [7:0]   leadMan,
    output  reg         [4:0]   lagExp,
    output  reg         [7:0]   lagMan,
    output  reg signed  [31:0]  limit,
    output  reg         [31:0]  loopData,
    output  reg         [4:0]   leadExp1,
    output  reg         [7:0]   leadMan1,
    output  reg         [4:0]   lagExp1,
    output  reg         [7:0]   lagMan1,
    output  reg         [31:0]  loopData1,
    output  reg         [15:0]  lockCount,
    output  reg         [11:0]  syncThreshold
);

    always @(negedge wr0) begin
        if (cs) begin
            casex (addr)
                `LF_CONTROL: begin
                    zeroError <= dataIn[0];
                    invertError <= dataIn[1];
                    ctrl2 <= dataIn[2];
                    clearAccum <= dataIn[3];
                    ctrl4 <= dataIn[4];
                    end
                `LF_LEAD_LAG: begin
                   lagExp <= dataIn[4:0];
                   end
                `LF_LIMIT: begin
                    limit[7:0] <= dataIn[7:0];
                    end
                `LF_LOOPDATA0: begin
                    loopData[7:0] <= dataIn[7:0];
                    end
                `LF_LEAD_LAG1: begin
                   lagExp1 <= dataIn[4:0];
                   end
                `LF_LOOPDATA1: begin
                    loopData1[7:0] <= dataIn[7:0];
                    end
                `LF_LOCKDETECTOR: begin
                    lockCount[7:0] <= dataIn[7:0];
                    end
                default: ;
            endcase
        end
    end

    always @(negedge wr1) begin
        if (cs) begin
            casex (addr)
                `LF_LEAD_LAG: begin
                   lagMan <= dataIn[15:8];
                   end
                `LF_LIMIT: begin
                    limit[15:8] <= dataIn[15:8];
                    end
                `LF_LOOPDATA0: begin
                    loopData[15:8] <= dataIn[15:8];
                    end
                `LF_LEAD_LAG1: begin
                   lagMan1 <= dataIn[15:8];
                   end
                `LF_LOOPDATA1: begin
                    loopData1[15:8] <= dataIn[15:8];
                    end
                `LF_LOCKDETECTOR: begin
                    lockCount[15:8] <= dataIn[15:8];
                    end
                default:  ;
            endcase
        end
    end

    always @(negedge wr2) begin
        if (cs) begin
            casex (addr)
                `LF_LEAD_LAG: begin
                   leadExp <= dataIn[20:16];
                   end
                `LF_LIMIT: begin
                    limit[23:16] <= dataIn[23:16];
                    end
                `LF_LOOPDATA0: begin
                    loopData[23:16] <= dataIn[23:16];
                    end
                `LF_LEAD_LAG1: begin
                   leadExp1 <= dataIn[20:16];
                   end
                `LF_LOOPDATA1: begin
                    loopData1[23:16] <= dataIn[23:16];
                    end
                `LF_LOCKDETECTOR: begin
                    syncThreshold[7:0] <= dataIn[23:16];
                    end
                default:  ;
            endcase
        end
    end

    always @(negedge wr3) begin
        if (cs) begin
            casex (addr)
                `LF_LEAD_LAG: begin
                   leadMan <= dataIn[31:24];
                   end
                `LF_LIMIT: begin
                    limit[31:24] <= dataIn[31:24];
                    end
                `LF_LOOPDATA0: begin
                    loopData[31:24] <= dataIn[31:24];
                    end
                `LF_LEAD_LAG1: begin
                   leadMan1 <= dataIn[31:24];
                   end
                `LF_LOOPDATA1: begin
                    loopData1[31:24] <= dataIn[31:24];
                    end
                `LF_LOCKDETECTOR: begin
                    syncThreshold[11:8] <= dataIn[27:24];
                    end
                default:  ;
            endcase
        end
    end

    always @* begin
        if (cs) begin
            casex (addr)
                `LF_CONTROL:        dataOut = {lockStatus,26'b0,ctrl4,clearAccum,ctrl2,invertError,zeroError};
                `LF_LEAD_LAG:       dataOut = {leadMan,3'bx,leadExp,lagMan,3'bx,lagExp};
                `LF_LIMIT:          dataOut = limit;
                `LF_LOOPDATA0:      dataOut = loopData;
                `LF_LOOPDATA1:      dataOut = loopData1;
                `LF_LEAD_LAG1:      dataOut = {leadMan1,3'bx,leadExp1,lagMan1,3'bx,lagExp1};
                `LF_LOCKDETECTOR:   dataOut = {4'h0,syncThreshold,lockCount};
                `LF_INTEGRATOR:     dataOut = lagAccum;
                default:            dataOut = 32'hx;
            endcase
        end
        else begin
            dataOut = 32'hx;
        end
    end

endmodule

`endif  // USE_BUS_CLOCK
