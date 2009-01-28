`timescale 1ns/10ps

`include "addressMap.v"

module interpRegs(
    cs,
    addr,
    dataIn,
    dataOut,
    wr0, wr1, wr2, wr3,
    exponent,
    mantissa
    );

input   cs;
input   [11:0]addr;
input   [31:0]dataIn;
output  [31:0]dataOut;
input   wr0,wr1,wr2,wr3;

output  [4:0]exponent;
reg     [4:0]exponent;

output  [17:0] mantissa;
reg     [17:0] mantissa;


always @(negedge wr0) begin
    if (cs) begin
        casex (addr)
            `INTERP_MANTISSA:   mantissa[7:0] <= dataIn[7:0];
            `INTERP_EXPONENT:   exponent[4:0] <= dataIn[4:0];
            default:  ;
            endcase
        end
    end

always @(negedge wr1) begin
    if (cs) begin
        casex (addr)
            `INTERP_MANTISSA:   mantissa[15:8] <= dataIn[15:8];
            default:  ;
            endcase
        end
    end

always @(negedge wr2) begin
    if (cs) begin
        casex (addr)
            `INTERP_MANTISSA:   mantissa[17:16] <= dataIn[17:16];
            default:  ;
            endcase
        end
    end

reg [31:0]dataOut;
always @(cs or addr or
         exponent or 
         mantissa)
    begin
    if (cs) begin
        casex (addr)
            `INTERP_MANTISSA:   dataOut <= {14'bx,mantissa};
            `INTERP_EXPONENT:   dataOut <= {27'bx,exponent};
            default:            dataOut <= 32'hx;
            endcase
        end
    else begin
        dataOut <= 32'hx;
        end
    end
endmodule
