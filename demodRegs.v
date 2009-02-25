`timescale 1ns/10ps

`include ".\addressMap.v"

module demodRegs(
    addr,
    dataIn,
    dataOut,
    cs,
    wr0, wr1, wr2, wr3,
    demodMode,
    dac0Select,
    dac1Select,
    dac2Select
    );

input   [11:0]addr;
input   [31:0]dataIn;
output  [31:0]dataOut;
input   cs;
input   wr0,wr1,wr2,wr3;

output  [2:0]   demodMode;
reg     [2:0]   demodMode;

output  [3:0]   dac0Select;
reg     [3:0]   dac0Select;

output  [3:0]   dac1Select;
reg     [3:0]   dac1Select;

output  [3:0]   dac2Select;
reg     [3:0]   dac2Select;

always @(negedge wr0) begin
    if (cs) begin
        casex (addr)
            `DEMOD_CONTROL: begin
                demodMode <= dataIn[2:0];
                end
            `DEMOD_DACSELECT: begin
                dac0Select <= dataIn[3:0];
                end
            default: ;
            endcase
        end
    end

always @(negedge wr1) begin
    if (cs) begin
        casex (addr)
            `DEMOD_DACSELECT: begin
                dac1Select <= dataIn[11:8];
                end
            default: ;
            endcase
        end
    end

always @(negedge wr2) begin
    if (cs) begin
        casex (addr)
            `DEMOD_DACSELECT: begin
                dac2Select <= dataIn[19:16];
                end
            default: ;
            endcase
        end
    end

reg [31:0]dataOut;
always @(addr or cs or
         demodMode or
         dac0Select or dac1Select or dac2Select 
         ) begin
    if (cs) begin
        casex (addr)
            `DEMOD_CONTROL:     dataOut <= {29'b0,demodMode};
            `DEMOD_DACSELECT:   dataOut <= {12'h0,dac2Select,4'h0,dac1Select,4'h0,dac0Select};
            default:            dataOut <= 32'h0;
            endcase
        end
    else begin
        dataOut <= 32'hx;
        end
    end
endmodule
