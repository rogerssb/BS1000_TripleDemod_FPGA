`timescale 1ns/10ps

`include ".\addressMap.v"

module loopRegs(addr,
               dataIn,
               dataOut,
               cs,
               wr0, wr1, wr2, wr3,
               invertError,
               zeroError,
               slip,
               lead,
               lag,
               limit,
               loopOffset,
               fskThreshold
               );

input   [11:0]addr;
input   [31:0]dataIn;
output  [31:0]dataOut;
input   cs;
input   wr0,wr1,wr2,wr3;

output          invertError,zeroError,slip;
reg             invertError,zeroError,slip;

output  [4:0]   lead;
reg     [4:0]   lead;

output  [4:0]   lag;
reg     [4:0]   lag;

output  [31:0]  limit;
reg     [31:0]  limit;

output  [31:0]  loopOffset;
reg     [31:0]  loopOffset;

output  [7:0]   fskThreshold;
reg     [7:0]   fskThreshold;

always @(negedge wr0) begin
    if (cs) begin
        casex (addr)
            `LF_CONTROL: begin
                zeroError <= dataIn[0];
                invertError <= dataIn[1];
                slip <= dataIn[2];
                end
            `LF_LEAD_LAG: begin
               lag <= dataIn[4:0];
               end
            `LF_LIMIT: begin
                limit[7:0] <= dataIn[7:0];
                end
            `LF_LOOPOFFSET: begin
                loopOffset[7:0] <= dataIn[7:0];
                end
            `LF_FSKTHRESHOLD: begin
                fskThreshold <= dataIn[7:0];
                end
            default: ;
            endcase
        end
    end

always @(negedge wr1) begin
    if (cs) begin
        casex (addr)
            `LF_LIMIT: begin
                limit[15:8] <= dataIn[15:8];
                end
            `LF_LOOPOFFSET: begin
                loopOffset[15:8] <= dataIn[15:8];
                end
            default:  ;
            endcase
        end
    end

always @(negedge wr2) begin
    if (cs) begin
        casex (addr)
            `LF_LEAD_LAG: begin
               lead <= dataIn[20:16];
               end
            `LF_LIMIT: begin
                limit[23:16] <= dataIn[23:16];
                end
            `LF_LOOPOFFSET: begin
                loopOffset[23:16] <= dataIn[23:16];
                end
            default:  ;
            endcase
        end
    end

always @(negedge wr3) begin
    if (cs) begin
        casex (addr)
            `LF_LIMIT: begin
                limit[31:24] <= dataIn[31:24];
                end
            `LF_LOOPOFFSET: begin
                loopOffset[31:24] <= dataIn[31:24];
                end
            default:  ;
            endcase
        end
    end

reg [31:0]dataOut;
always @(addr or cs or
         slip or invertError or zeroError or
         lag or lead or
         limit or 
         loopOffset or
         fskThreshold
         ) begin
    if (cs) begin
        casex (addr)
            `LF_CONTROL:        dataOut <= {29'bx,slip,invertError,zeroError};
            `LF_LEAD_LAG:       dataOut <= {11'bx,lead,11'bx,lag};
            `LF_LIMIT:          dataOut <= limit;
            `LF_LOOPOFFSET:     dataOut <= loopOffset;
            `LF_FSKTHRESHOLD:   dataOut <= {24'bx,fskThreshold};
            default:            dataOut <= 32'hx;
            endcase
        end
    else begin
        dataOut <= 32'hx;
        end
    end



endmodule
