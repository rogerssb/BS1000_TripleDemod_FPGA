`timescale 1ns/10ps

`include ".\addressMap.v"

module ldpcRegs(
    input                       busClk,
    input                       cs,
    input                       wr0, wr1, wr2, wr3,
    input               [12:0]  addr,
    input               [31:0]  dataIn,
    output  reg         [31:0]  dataOut,
    input                       inSync,
    input               [1:0]   syncState,
    input               [1:0]   rotation,
    output  reg                 codeLength4096,
    output  reg         [1:0]   codeRate,
    output  reg         [10:0]  syncThreshold,
    output  reg         [15:0]  inverseMeanMantissa,
    output  reg         [2:0]   inverseMeanExponent,
    output  reg                 ldpcRun
);

    always @(posedge busClk) begin
        if (cs & wr0) begin
            casex (addr)
                `LDPC_CONTROL:  begin
                    codeRate <= dataIn[1:0];
                    codeLength4096 <= dataIn[3];
                end
                `LDPC_INVERSE_MEAN: begin
                    inverseMeanMantissa[7:0] <= dataIn[7:0];
                end
                default: ;
            endcase
        end
    end

    always @(posedge busClk) begin
        if (cs & wr1) begin
            casex (addr)
                `LDPC_INVERSE_MEAN: begin
                    inverseMeanMantissa[15:8] <= dataIn[15:8];
                end
                default:  ;
            endcase
        end
    end

    always @(posedge busClk) begin
        if (cs & wr2) begin
            casex (addr)
                `LDPC_CONTROL:  begin
                    syncThreshold[7:0] <= dataIn[23:16];
                end
                `LDPC_INVERSE_MEAN: begin
                    inverseMeanExponent <= dataIn[18:16];
                end
                default: ;
            endcase
        end
    end

    always @(posedge busClk) begin
        if (cs & wr3) begin
            casex (addr)
                `LDPC_CONTROL:  begin
                    syncThreshold[10:8] <= dataIn[26:24];
                    ldpcRun <= dataIn[31];
                end
                default: ;
            endcase
        end
    end

    always @* begin
        if (cs) begin
            casex (addr)
                `LDPC_CONTROL:          dataOut = {ldpcRun,4'b0,syncThreshold,12'b0,codeLength4096,1'b0,codeRate};
                `LDPC_INVERSE_MEAN:     dataOut = {13'h0,inverseMeanExponent,inverseMeanMantissa};
                `LDPC_STATUS:           dataOut = {inSync,15'h0,
                                                   6'b0,rotation,6'b0,syncState};
                default:                dataOut = 32'h0;
            endcase
        end
        else begin
            dataOut = 32'hx;
        end
    end
endmodule
