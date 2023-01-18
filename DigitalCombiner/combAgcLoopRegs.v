/******************************************************************************
Copyright 2008-2015 Koos Technical Services, Inc. All Rights Reserved

This source code is the Intellectual Property of Koos Technical Services,Inc.
(KTS) and is provided under a License Agreement which protects KTS' ownership and
derivative rights in exchange for negotiated compensation.
******************************************************************************/

`include "addressMap.v"
`timescale 1ns/10ps

/*
#define MDB_CalfControlsLS16         210
#define MDB_CalfControlsMS16         211
#define MDB_CalfULimitLS16          212
#define MDB_CalfULimitMS16          213
#define MDB_CalfLLimitLS16          214
#define MDB_CalfLLimitMS16          215
#define MDB_CalfRatiosLS16          216
#define MDB_CalfRatiosMS16          217
#define MDB_CalfIntegrator0         218
#define MDB_CalfIntegrator1         219
*/

module combAgcLoopRegs(
    input               busClk, sysClk,
    input       [5:0]   addr,
    input       [31:0]  dataIn,
    output  reg [31:0]  dataOut,
    input               cs,
    input               wr0, wr1, wr2, wr3,
    input       [15:0]  integrator0, integrator1,
    output  reg [7:0]   agcSetpoint     = 8'hE0,
    output  reg         invertError     = 1'b0,
    output  reg         zeroError       = 1'b0,
    output  reg         byPassAgc       = 1'b0,
    output  reg         agc_d_outputs   = 1'b0,
    output  reg         ifCalibration   = 1'b0,     // not used in hardware. It's a software flag
    output  reg [4:0]   posErrorGain    = 5'h1B,
    output  reg [4:0]   negErrorGain    = 5'h1B,
    output  reg [31:0]  upperLimit      = 32'h4fffffff,
    output  reg [31:0]  lowerLimit      = 32'h00000000,
    output  reg [15:0]  frontEndRatio0  = 16'h8000,
    output  reg [15:0]  frontEndRatio1  = 16'h8000

);

    always @(posedge busClk) begin

        if (cs && wr0) begin
            casex (addr)
                `CALF_CONTROL: begin
                    zeroError           <= dataIn[0];
                    invertError         <= dataIn[1];
                    byPassAgc           <= dataIn[2];
                    agc_d_outputs       <= dataIn[3];
                    ifCalibration       <= dataIn[4];
                    end
                `CALF_ULIMIT: begin
                    upperLimit[7:0]     <= dataIn[7:0];
                    end
                `CALF_LLIMIT: begin
                    lowerLimit[7:0]     <= dataIn[7:0];
                    end
                `CALF_RATIOS: begin
                    frontEndRatio0[7:0] <= dataIn[7:0];
                    end
                default: ;
            endcase
        end

        if (cs && wr1) begin
            casex (addr)
                `CALF_CONTROL: begin
                    agcSetpoint         <= dataIn[15:8];
                    end
                `CALF_ULIMIT: begin
                    upperLimit[15:8]    <= dataIn[15:8];
                    end
                `CALF_LLIMIT: begin
                    lowerLimit[15:8]    <= dataIn[15:8];
                    end
                `CALF_RATIOS: begin
                    frontEndRatio0[15:8] <= dataIn[15:8];
                    end
                default:  ;
            endcase
        end

        if (cs && wr2) begin
            casex (addr)
                `CALF_CONTROL: begin
                   posErrorGain         <= dataIn[20:16];
                   end
                `CALF_ULIMIT: begin
                    upperLimit[23:16]   <= dataIn[23:16];
                    end
                `CALF_LLIMIT: begin
                    lowerLimit[23:16]   <= dataIn[23:16];
                    end
                `CALF_RATIOS: begin
                    frontEndRatio1[7:0] <= dataIn[23:16];
                    end
                default:  ;
            endcase
        end

        if (cs && wr3) begin
            casex (addr)
                `CALF_CONTROL: begin
                   negErrorGain         <= dataIn[28:24];
                   end
                `CALF_ULIMIT: begin
                    upperLimit[31:24]   <= dataIn[31:24];
                    end
                `CALF_LLIMIT: begin
                    lowerLimit[31:24]   <= dataIn[31:24];
                    end
                `CALF_RATIOS: begin
                    frontEndRatio1[15:8] <= dataIn[31:24];
                    end
                default:  ;
            endcase
        end
    end

    reg [31:0]  integrators;    // latch current integrator values while reading
    always @(posedge sysClk) begin
        if (~cs) begin
            integrators <= {integrator1,integrator0};
        end
    end

    always @* begin
        if (cs) begin
            casex (addr)
                `CALF_CONTROL:       dataOut = {3'bx,negErrorGain,3'bx,posErrorGain,agcSetpoint,3'bx,ifCalibration,agc_d_outputs,byPassAgc,invertError,zeroError};
                `CALF_ULIMIT:        dataOut = upperLimit;
                `CALF_LLIMIT:        dataOut = lowerLimit;
                `CALF_INTEGRATOR:    dataOut = integrators;
                `CALF_RATIOS:        dataOut = {frontEndRatio1, frontEndRatio0};
                default:             dataOut = 32'hx;
            endcase
        end
        else begin
            dataOut = 32'hx;
        end
    end

endmodule
