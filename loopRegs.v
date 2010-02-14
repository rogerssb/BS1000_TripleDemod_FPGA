`timescale 1ns/10ps

`include ".\addressMap.v"

module loopRegs(addr,
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
               leadExp,
               leadMan,
               lagExp,
               lagMan,
               limit,
               loopData,
               lockCount,
               syncThreshold
               );

input   [11:0]addr;
input   [31:0]dataIn;
output  [31:0]dataOut;
input   cs;
input   wr0,wr1,wr2,wr3;

input           lockStatus;

input   [31:0]  lagAccum;

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
            `LF_LOOPDATA: begin
                loopData[7:0] <= dataIn[7:0];
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
            `LF_LOOPDATA: begin
                loopData[15:8] <= dataIn[15:8];
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
            `LF_LOOPDATA: begin
                loopData[23:16] <= dataIn[23:16];
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
            `LF_LOOPDATA: begin
                loopData[31:24] <= dataIn[31:24];
                end
            `LF_LOCKDETECTOR: begin
                syncThreshold[11:8] <= dataIn[27:24];
                end
            default:  ;
            endcase
        end
    end

reg [31:0]dataOut;
always @(addr or cs or
         lockStatus or
         ctrl2 or invertError or zeroError or clearAccum or ctrl4 or
         lagExp or lagMan or leadExp or leadMan or
         limit or 
         loopData or
         lockCount or syncThreshold or
         lagAccum
         ) begin
    if (cs) begin
        casex (addr)
            `LF_CONTROL:        dataOut <= {lockStatus,26'b0,ctrl4,clearAccum,ctrl2,invertError,zeroError};
            `LF_LEAD_LAG:       dataOut <= {leadMan,3'bx,leadExp,lagMan,3'bx,lagExp};
            `LF_LIMIT:          dataOut <= limit;
            `LF_LOOPDATA:       dataOut <= loopData;
            `LF_LOCKDETECTOR:   dataOut <= {4'h0,syncThreshold,lockCount};
            `LF_INTEGRATOR:     dataOut <= lagAccum;
            default:            dataOut <= 32'hx;
            endcase
        end
    else begin
        dataOut <= 32'hx;
        end
    end



endmodule
