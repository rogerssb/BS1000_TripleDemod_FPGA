`timescale 1ns/10ps

`include ".\addressMap.v"

module viterbiRegs(
    input                       cs,
    input                       wr0, wr1, wr2, wr3,
    input               [12:0]  addr,
    input               [31:0]  dataIn,
    output  reg         [31:0]  dataOut,
    input                       inSync,
    input               [2:0]   syncState,
    output  reg         [15:0]  inverseMeanMantissa,
    output  reg         [2:0]   inverseMeanExponent
);

    always @(negedge wr0) begin
        if (cs) begin
            casex (addr)
                `VIT_INVERSE_MEAN: begin
                    inverseMeanMantissa[7:0] <= dataIn[7:0];
                end
                default: ;
            endcase
        end
    end

    always @(negedge wr1) begin
        if (cs) begin
            casex (addr)
                `VIT_INVERSE_MEAN: begin
                    inverseMeanMantissa[15:8] <= dataIn[15:8];
                end
                default:  ;
            endcase
        end
    end

    always @(negedge wr2) begin
        if (cs) begin
            casex (addr)
                `VIT_INVERSE_MEAN: begin
                    inverseMeanExponent <= dataIn[18:16];
                end
                default: ;
            endcase
        end
    end


    always @* begin
        if (cs) begin
            casex (addr)
                `VIT_INVERSE_MEAN:  dataOut = {13'h0,inverseMeanExponent,inverseMeanMantissa};
                `VIT_STATUS:        dataOut = {inSync,15'h0,13'b0,syncState};
                default:            dataOut = 32'h0;
            endcase
        end
        else begin
            dataOut = 32'hx;
        end
    end
endmodule
