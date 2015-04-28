`timescale 1ns/10ps

`include ".\addressMap.v"

module carrierLoopRegs(
    addr,
    dataIn,
    dataOut,
    cs,
    wr0, wr1, wr2, wr3,
    lagAccum,
    lockStatus,
    invertError,
    zeroError,
    ctrl2,
    clearAccum,
    ctrl4,
    acqTrackControl,
    leadExp,
    leadMan,
    lagExp,
    lagMan,
    upperLimit,
    lowerLimit,
    loopData,
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

output          invertError,zeroError,ctrl2,clearAccum,ctrl4;
reg             invertError,zeroError,ctrl2,clearAccum,ctrl4;

output  [1:0]   acqTrackControl;
reg     [1:0]   acqTrackControl;

output  [4:0]   leadExp;
reg     [4:0]   leadExp;

output  [7:0]   leadMan;
reg     [7:0]   leadMan;

output  [4:0]   lagExp;
reg     [4:0]   lagExp;

output  [7:0]   lagMan;
reg     [7:0]   lagMan;

output  [31:0]  upperLimit;
reg     [31:0]  upperLimit;

output  [31:0]  lowerLimit;
reg     [31:0]  lowerLimit;

output  [31:0]  loopData;
reg     [31:0]  loopData;

output  [15:0]  lockCount;
reg     [15:0]  lockCount;

output  [11:0]   syncThreshold;
reg     [11:0]   syncThreshold;

always @(negedge wr0) begin
    if (cs) begin
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

always @(negedge wr1) begin
    if (cs) begin
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

always @(negedge wr2) begin
    if (cs) begin
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

always @(negedge wr3) begin
    if (cs) begin
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
