`timescale 1ns/10ps

`include ".\addressMap.v"

module turboRegs(
    input                       busClk,
    input                       cs,
    input                       wr0, wr1, wr2, wr3,
    input               [12:0]  addr,
    input               [31:0]  dataIn,
    input                       overflow,
    output  reg         [31:0]  dataOut,
    output  reg         [2:0]   codeRate,
    output  reg         [2:0]   codeLength,
    output  reg         [3:0]   maxIterations,
    output  reg         [15:0]  inverseMeanMantissa,
    output  reg         [2:0]   inverseMeanExponent,
    output  reg         [15:0]  outputEnClkDiv,
    output  reg         [3:0]   dac0Select,
    output  reg         [3:0]   dac1Select,
    output  reg         [3:0]   dac2Select,
    output  reg         [31:0]  asmParms
);

    always @(posedge busClk) begin
        if (cs & wr0) begin
            casex (addr)
                `TURBO_CONTROL:  begin
                    codeRate <= dataIn[2:0];
                    codeLength <= dataIn[6:4];
                end
                `TURBO_INVERSE_MEAN: begin
                    inverseMeanMantissa[7:0] <= dataIn[7:0];
                end
                `TURBO_OUTPUT_CLK_DIV: begin
                    outputEnClkDiv[7:0] <= dataIn[7:0];
                end
                `TURBO_DAC_SELECT: begin
                    dac0Select <= dataIn[3:0];
                end
                `TURBO_ASM_PARMS: begin
                    asmParms[7:0] <= dataIn[7:0];
                 end
                default: ;
            endcase
        end
    end

    always @(posedge busClk) begin
        if (cs & wr1) begin
            casex (addr)
                `TURBO_CONTROL: begin
                    maxIterations <= dataIn[11:8];
                end
                `TURBO_INVERSE_MEAN: begin
                    inverseMeanMantissa[15:8] <= dataIn[15:8];
                end
                `TURBO_OUTPUT_CLK_DIV: begin
                    outputEnClkDiv[15:8] <= dataIn[15:8];
                end
                `TURBO_DAC_SELECT: begin
                    dac1Select <= dataIn[11:8];
                end
                `TURBO_ASM_PARMS: begin
                    asmParms[15:8] <= dataIn[15:8];
                 end
                default:  ;
            endcase
        end
    end

    always @(posedge busClk) begin
        if (cs & wr2) begin
            casex (addr)
                `TURBO_INVERSE_MEAN: begin
                    inverseMeanExponent <= dataIn[18:16];
                end
                `TURBO_DAC_SELECT: begin
                    dac2Select <= dataIn[19:16];
                end
                `TURBO_ASM_PARMS: begin
                    asmParms[23:16] <= dataIn[23:16];
                 end
                default: ;
            endcase
        end
    end

    always @(posedge busClk) begin
        if (cs & wr3) begin
            casex (addr)
                `TURBO_ASM_PARMS: begin
                    asmParms[31:24] <= dataIn[31:24];
                 end
                default: ;
            endcase
        end
    end

    always @* begin
        if (cs) begin
            casex (addr)
                `TURBO_CONTROL:         dataOut = {15'b0, overflow,
                                                   4'b0,maxIterations,
                                                   1'b0,codeLength,1'b0,codeRate};
                `TURBO_INVERSE_MEAN:    dataOut = {13'h0,inverseMeanExponent,inverseMeanMantissa};
                `TURBO_OUTPUT_CLK_DIV:  dataOut = {16'h0,outputEnClkDiv};
                `TURBO_DAC_SELECT:      dataOut = {8'b0,
                                                   4'b0,dac2Select,
                                                   4'b0,dac1Select,
                                                   4'b0,dac0Select};
                `TURBO_ASM_PARMS:       dataOut = asmParms[31:0];
                default:                dataOut = 32'h0;
            endcase
        end
        else begin
            dataOut = 32'hx;
        end
    end
endmodule

