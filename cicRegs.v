`timescale 1ns/10ps

`include ".\addressMap.v"
//`define CIC_DECIMATION  12'hxx0
//`define CIC_SHIFT       12'hxx4

module cicRegs(addr,
               dataIn,
               dataOut,
               cs,
               wr0, wr1, wr2, wr3,
               cicDecimation,
               cicShift
               );

input   [12:0]addr;
input   [31:0]dataIn;
output  [31:0]dataOut;
input   cs;
input   wr0,wr1,wr2,wr3;

output  [14:0] cicDecimation;
reg     [14:0] cicDecimation;

output  [5:0] cicShift;
reg     [5:0] cicShift;

always @(negedge wr0) begin
    if (cs) begin
        casex (addr)
            `CIC_DECIMATION:    cicDecimation[7:0] <= dataIn[7:0];
            `CIC_SHIFT:         cicShift <= dataIn[5:0];
            default: ;
            endcase
        end
    end

always @(negedge wr1) begin
    if (cs) begin
        casex (addr)
            `CIC_DECIMATION:    cicDecimation[14:8] <= dataIn[14:8];
            default: ;
            endcase
        end
    end

reg [31:0]dataOut;
always @* begin
    if (cs) begin
        casex (addr)
            `CIC_DECIMATION:    dataOut = {17'b0,cicDecimation};
            `CIC_SHIFT:         dataOut = {26'b0,cicShift};
            default:            dataOut = 32'h0;
            endcase
        end
    else begin
        dataOut = 32'hx;
        end
    end
endmodule
