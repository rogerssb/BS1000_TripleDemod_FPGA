`timescale 1ns/10ps

`include ".\addressMap.v"

module ddcRegs(addr,
               dataIn,
               dataOut,
               cs,
               wr0, wr1, wr2, wr3,
               ddcCenterFreq,
               bypassCic, bypassHb
               );

input   [11:0]addr;
input   [31:0]dataIn;
output  [31:0]dataOut;
input   cs;
input   wr0,wr1,wr2,wr3;

output  [31:0] ddcCenterFreq;
reg     [31:0] ddcCenterFreq;

output          bypassHb;
reg             bypassHb;

output          bypassCic;
reg             bypassCic;

always @(negedge wr0) begin
    if (cs) begin
        casex (addr)
            `DDC_CENTER_FREQ: begin
                ddcCenterFreq[7:0] <= dataIn[7:0];
                end
            `DDC_CONTROL: begin
                bypassCic = dataIn[0];
                bypassHb = dataIn[1];
                end
            default: ;
            endcase
        end
    end

always @(negedge wr1) begin
    if (cs) begin
        casex (addr)
            `DDC_CENTER_FREQ:   ddcCenterFreq[15:8] <= dataIn[15:8];
            default:  ;
            endcase
        end
    end

always @(negedge wr2) begin
    if (cs) begin
        casex (addr)
            `DDC_CENTER_FREQ:   ddcCenterFreq[23:16] <= dataIn[23:16];
            default:  ;
            endcase
        end
    end

always @(negedge wr3) begin
    if (cs) begin
        casex (addr)
            `DDC_CENTER_FREQ:   ddcCenterFreq[31:24] <= dataIn[31:24];
            default:  ;
            endcase
        end
    end

reg [31:0]dataOut;
always @(addr or cs or
         ddcCenterFreq or
         bypassCic or bypassHb
         ) begin
    if (cs) begin
        casex (addr)
            `DDC_CENTER_FREQ:   dataOut <= ddcCenterFreq;
            `DDC_CONTROL:       dataOut <= {30'hx,bypassHb,bypassCic};
            default:            dataOut <= 32'hx;
            endcase
        end
    else begin
        dataOut <= 32'hx;
        end
    end
endmodule
