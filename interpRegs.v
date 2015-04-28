`timescale 1ns/10ps

`include "addressMap.v"

module interpRegs(
    cs,
    addr,
    dataIn,
    dataOut,
    wr0, wr1, wr2, wr3,
    bypass,
    test,
    invert,
    bypassEQ,
    testValue,
    exponent,
    mantissa
    );

input   cs;
input   [12:0]addr;
input   [31:0]dataIn;
output  [31:0]dataOut;
input   wr0,wr1,wr2,wr3;

output  [4:0]exponent;
reg     [4:0]exponent;

output  [17:0] mantissa;
reg     [17:0] mantissa;

output  bypass;
reg     bypass;

output  test;
reg     test;

output  invert;
reg     invert;

output  bypassEQ;
reg     bypassEQ;

output  [17:0]  testValue;
reg     [17:0]  testValue;


always @(negedge wr0) begin
    if (cs) begin
        casex (addr)
            `INTERP_CONTROL: begin
                                bypass <= dataIn[0];
                                test <= dataIn[1];
                                invert <= dataIn[2];
                                bypassEQ <= dataIn[3];
                end
            `INTERP_MANTISSA:   mantissa[7:0] <= dataIn[7:0];
            `INTERP_EXPONENT:   exponent[4:0] <= dataIn[4:0];
            `INTERP_TEST:       testValue[7:0] <= dataIn[7:0];
            default:  ;
            endcase
        end
    end

always @(negedge wr1) begin
    if (cs) begin
        casex (addr)
            `INTERP_MANTISSA:   mantissa[15:8] <= dataIn[15:8];
            `INTERP_TEST:       testValue[15:8] <= dataIn[15:8];
            default:  ;
            endcase
        end
    end

always @(negedge wr2) begin
    if (cs) begin
        casex (addr)
            `INTERP_MANTISSA:   mantissa[17:16] <= dataIn[17:16];
            `INTERP_TEST:       testValue[17:16] <= dataIn[17:16];
            default:  ;
            endcase
        end
    end

reg [31:0]dataOut;
always @* begin
    if (cs) begin
        casex (addr)
            `INTERP_CONTROL:    dataOut = {28'h0,bypassEQ,invert,test,bypass};
            `INTERP_MANTISSA:   dataOut = {14'bx,mantissa};
            `INTERP_EXPONENT:   dataOut = {27'bx,exponent};
            `INTERP_TEST:       dataOut = {14'b0,testValue};
            default:            dataOut = 32'hx;
            endcase
        end
    else begin
        dataOut = 32'hx;
        end
    end

endmodule
