`timescale 1ns/10ps

`include ".\addressMap.v"

module demodRegs(
    addr,
    dataIn,
    dataOut,
    cs,
    wr0, wr1, wr2, wr3,
    demodMode
    );

input   [11:0]addr;
input   [31:0]dataIn;
output  [31:0]dataOut;
input   cs;
input   wr0,wr1,wr2,wr3;

output  [2:0]   demodMode;
reg     [2:0]   demodMode;

always @(negedge wr0) begin
    if (cs) begin
        casex (addr)
            `DEMOD_CONTROL: begin
                demodMode <= dataIn[2:0];
                end
            default: ;
            endcase
        end
    end

reg [31:0]dataOut;
always @(addr or cs or
         demodMode
         ) begin
    if (cs) begin
        casex (addr)
            `DEMOD_CONTROL:     dataOut <= {29'bx,demodMode};
            default:            dataOut <= 32'hx;
            endcase
        end
    else begin
        dataOut <= 32'hx;
        end
    end
endmodule
