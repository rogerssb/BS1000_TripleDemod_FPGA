/******************************************************************************
Copyright 2008-2015 Koos Technical Services, Inc. All Rights Reserved

This source code is the Intellectual Property of Koos Technical Services,Inc. 
(KTS) and is provided under a License Agreement which protects KTS' ownership and
derivative rights in exchange for negotiated compensation.
******************************************************************************/

`timescale 1ns/10ps

`include ".\addressMap.v"

module agcLoopRegs(
    addr,
    dataIn,
    dataOut,
    cs,
    wr0, wr1, wr2, wr3,
    agcSetpoint,
    invertError,
    zeroError,
    posErrorGain,
    negErrorGain,
    upperLimit,
    lowerLimit,
    integrator
    );

input   [12:0]addr;
input   [31:0]dataIn;
output  [31:0]dataOut;
input   cs;
input   wr0,wr1,wr2,wr3;

output  [7:0]   agcSetpoint;
reg     [7:0]   agcSetpoint;

output          invertError,zeroError;
reg             invertError,zeroError;

output  [4:0]   posErrorGain,negErrorGain;
reg     [4:0]   posErrorGain,negErrorGain;

output  [31:0]  upperLimit,lowerLimit;
reg     [31:0]  upperLimit,lowerLimit;

input   [31:0]  integrator;

always @(negedge wr0) begin
    if (cs) begin
        casex (addr)
            `ALF_CONTROL: begin
                zeroError <= dataIn[0];
                invertError <= dataIn[1];
                end
            `ALF_SETPOINT: begin
                agcSetpoint <= dataIn[7:0];
                end
            `ALF_GAINS: begin
               posErrorGain <= dataIn[4:0];
               end
            `ALF_ULIMIT: begin
                upperLimit[7:0] <= dataIn[7:0];
                end
            `ALF_LLIMIT: begin
                lowerLimit[7:0] <= dataIn[7:0];
                end
            default: ;
            endcase
        end
    end

always @(negedge wr1) begin
    if (cs) begin
        casex (addr)
            `ALF_ULIMIT: begin
                upperLimit[15:8] <= dataIn[15:8];
                end
            `ALF_LLIMIT: begin
                lowerLimit[15:8] <= dataIn[15:8];
                end
            default:  ;
            endcase
        end
    end

always @(negedge wr2) begin
    if (cs) begin
        casex (addr)
            `ALF_GAINS: begin
               negErrorGain <= dataIn[20:16];
               end
            `ALF_ULIMIT: begin
                upperLimit[23:16] <= dataIn[23:16];
                end
            `ALF_LLIMIT: begin
                lowerLimit[23:16] <= dataIn[23:16];
                end
            default:  ;
            endcase
        end
    end

always @(negedge wr3) begin
    if (cs) begin
        casex (addr)
            `ALF_ULIMIT: begin
                upperLimit[31:24] <= dataIn[31:24];
                end
            `ALF_LLIMIT: begin
                lowerLimit[31:24] <= dataIn[31:24];
                end
            default:  ;
            endcase
        end
    end

reg [31:0]dataOut;
always @* begin
    if (cs) begin
        casex (addr)
            `ALF_CONTROL:       dataOut = {30'bx,invertError,zeroError};
            `ALF_SETPOINT:      dataOut = {24'bx,agcSetpoint};
            `ALF_GAINS:         dataOut = {11'bx,negErrorGain,11'bx,posErrorGain};
            `ALF_ULIMIT:        dataOut = upperLimit;
            `ALF_LLIMIT:        dataOut = lowerLimit;
            `ALF_INTEGRATOR:    dataOut = integrator;
            default:            dataOut = 32'hx;
            endcase
        end
    else begin
        dataOut = 32'hx;
        end
    end



endmodule
