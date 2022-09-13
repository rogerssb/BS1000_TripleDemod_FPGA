`timescale 1ns/10ps

`include ".\addressMap.v"

module viterbiRegs(
    input                       busClk,
    input                       cs,
    input                       wr0, wr1, wr2, wr3,
    input               [12:0]  addr,
    input               [31:0]  dataIn,
    output  reg         [31:0]  dataOut,
    input                       ch0InSync,
    input                       ch1InSync,
    input               [3:0]   ch0SyncState,
    input               [3:0]   ch1SyncState,
    output  reg         [4:0]   viterbiMode,
    output  reg         [15:0]  inverseMeanMantissa,
    output  reg         [2:0]   inverseMeanExponent,
    output  reg         [15:0]  berTestLength
);

    always @(posedge busClk) begin
        if (cs & wr0) begin
            casex (addr)
                `VIT_INVERSE_MEAN: begin
                    inverseMeanMantissa[7:0] <= dataIn[7:0];
                end
                `VIT_BER_TEST_LENGTH: begin
                    berTestLength[7:0]      <= dataIn[7:0];
                end
                `VIT_CONTROL: begin
                    viterbiMode             <= dataIn[4:0];
                end
                default: ;
            endcase
        end
    end

    always @(posedge busClk) begin
        if (cs & wr1) begin
            casex (addr)
                `VIT_INVERSE_MEAN: begin
                    inverseMeanMantissa[15:8] <= dataIn[15:8];
                end
                `VIT_BER_TEST_LENGTH: begin
                    berTestLength[15:8] <= dataIn[15:8];
                end
                default:  ;
            endcase
        end
    end

    always @(posedge busClk) begin
        if (cs & wr2) begin
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
                `VIT_INVERSE_MEAN:      dataOut = {13'h0,inverseMeanExponent,inverseMeanMantissa};
                `VIT_BER_TEST_LENGTH:   dataOut = {16'h0,berTestLength};
                `VIT_STATUS:            dataOut = {ch1InSync,ch0InSync,14'h0,
                                                   8'b0,ch1SyncState,ch0SyncState};
                `VIT_CONTROL:           dataOut = {27'b0, viterbiMode};
                default:                dataOut = 32'h0;
            endcase
        end
        else begin
            dataOut = 32'hx;
        end
    end
endmodule
