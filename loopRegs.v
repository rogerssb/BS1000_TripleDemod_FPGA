/******************************************************************************
Copyright 2008-2015 Koos Technical Services, Inc. All Rights Reserved

This source code is the Intellectual Property of Koos Technical Services,Inc. 
(KTS) and is provided under a License Agreement which protects KTS' ownership and
derivative rights in exchange for negotiated compensation.
******************************************************************************/

`timescale 1ns/10ps

`include ".\addressMap.v"

`ifdef USE_BUS_CLOCK

module loopRegs(
    busClk,
    addr,
    dataIn,
    dataOut,
    cs,
    wr0, wr1, wr2, wr3,
    lagAccum,
    loopDataRead,
    loopData1Read,
    lockStatus,
    invertError,
    zeroError,
    ctrl2,
    clearAccum,
    ctrl4,
    leadExp,
    leadMan,
    lagExp,
    lagMan,
    limit,
    loopData,
    leadExp1,
    leadMan1,
    lagExp1,
    lagMan1,
    loopData1,
    lockCount,
    syncThreshold
    );

input           busClk;

input   [12:0]  addr;
input   [31:0]  dataIn;
output  [31:0]  dataOut;
input           cs;
input           wr0,wr1,wr2,wr3;

input           lockStatus;

input   [31:0]  lagAccum;

input   [31:0]  loopDataRead;
input   [31:0]  loopData1Read;

output          invertError,zeroError,ctrl2,clearAccum,ctrl4;
reg             invertError,zeroError,ctrl2,clearAccum,ctrl4;

output  [4:0]   leadExp;
reg     [4:0]   leadExp;

output  [7:0]   leadMan;
reg     [7:0]   leadMan;

output  [4:0]   lagExp;
reg     [4:0]   lagExp;

output  [7:0]   lagMan;
reg     [7:0]   lagMan;

output  [31:0]  limit;
reg     [31:0]  limit;

output  [31:0]  loopData;
reg     [31:0]  loopData;

output  [4:0]   leadExp1;
reg     [4:0]   leadExp1;

output  [7:0]   leadMan1;
reg     [7:0]   leadMan1;

output  [4:0]   lagExp1;
reg     [4:0]   lagExp1;

output  [7:0]   lagMan1;
reg     [7:0]   lagMan1;

output  [31:0]  loopData1;
reg     [31:0]  loopData1;

output  [15:0]  lockCount;
reg     [15:0]  lockCount;

output  [11:0]   syncThreshold;
reg     [11:0]   syncThreshold;

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

reg     [31:0]  dataOut;
always @* begin
    if (cs) begin
        casex (addr)
            `LF_CONTROL:        dataOut = {lockStatus,26'b0,ctrl4,clearAccum,ctrl2,invertError,zeroError};
            `LF_LEAD_LAG:       dataOut = {leadMan,3'bx,leadExp,lagMan,3'bx,lagExp};
            `LF_LIMIT:          dataOut = limit;
            `LF_LOOPDATA0:      dataOut = loopData;
            `LF_LOOPDATA1:      dataOut = loopData1;
            //`LF_LOOPDATA0:      dataOut = loopDataRead;
            `LF_LEAD_LAG1:      dataOut = {leadMan1,3'bx,leadExp1,lagMan1,3'bx,lagExp1};
            //`LF_LOOPDATA1:      dataOut = loopData1Read;
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
    addr,
    dataIn,
    dataOut,
    cs,
    wr0, wr1, wr2, wr3,
    lagAccum,
    loopDataRead,
    loopData1Read,
    lockStatus,
    invertError,
    zeroError,
    ctrl2,
    clearAccum,
    ctrl4,
    leadExp,
    leadMan,
    lagExp,
    lagMan,
    limit,
    loopData,
    leadExp1,
    leadMan1,
    lagExp1,
    lagMan1,
    loopData1,
    lockCount,
    syncThreshold
    );

input   [12:0]addr;
input   [31:0]dataIn;
output  [31:0]dataOut;
input   cs;
input   wr0,wr1,wr2,wr3;

input           lockStatus;

input   [31:0]  lagAccum;

input   [31:0]  loopDataRead;
input   [31:0]  loopData1Read;

output          invertError,zeroError,ctrl2,clearAccum,ctrl4;
reg             invertError,zeroError,ctrl2,clearAccum,ctrl4;

output  [4:0]   leadExp;
reg     [4:0]   leadExp;

output  [7:0]   leadMan;
reg     [7:0]   leadMan;

output  [4:0]   lagExp;
reg     [4:0]   lagExp;

output  [7:0]   lagMan;
reg     [7:0]   lagMan;

output  [31:0]  limit;
reg     [31:0]  limit;

output  [31:0]  loopData;
reg     [31:0]  loopData;

output  [4:0]   leadExp1;
reg     [4:0]   leadExp1;

output  [7:0]   leadMan1;
reg     [7:0]   leadMan1;

output  [4:0]   lagExp1;
reg     [4:0]   lagExp1;

output  [7:0]   lagMan1;
reg     [7:0]   lagMan1;

output  [31:0]  loopData1;
reg     [31:0]  loopData1;

output  [15:0]  lockCount;
reg     [15:0]  lockCount;

output  [11:0]   syncThreshold;
reg     [11:0]   syncThreshold;

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

reg     [31:0]  dataOut;
always @* begin
    if (cs) begin
        casex (addr)
            `LF_CONTROL:        dataOut = {lockStatus,26'b0,ctrl4,clearAccum,ctrl2,invertError,zeroError};
            `LF_LEAD_LAG:       dataOut = {leadMan,3'bx,leadExp,lagMan,3'bx,lagExp};
            `LF_LIMIT:          dataOut = limit;
            `LF_LOOPDATA0:      dataOut = loopData;
            `LF_LOOPDATA1:      dataOut = loopData1;
            //`LF_LOOPDATA0:      dataOut = loopDataRead;
            `LF_LEAD_LAG1:      dataOut = {leadMan1,3'bx,leadExp1,lagMan1,3'bx,lagExp1};
            //`LF_LOOPDATA1:      dataOut = loopData1Read;
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
