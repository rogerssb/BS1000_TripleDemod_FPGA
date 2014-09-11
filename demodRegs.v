`timescale 1ns/10ps

`include ".\addressMap.v"

module demodRegs(
    addr,
    dataIn,
    dataOut,
    cs,
    wr0, wr1, wr2, wr3,
    highFreqOffset,
    bitsyncLock,
    auBitsyncLock,
    demodLock,
    `ifdef SYM_DEVIATION
    fskDeviation,
    `else
    posDeviation,
    negDeviation,
    `endif
    demodMode,
    `ifdef ADD_DESPREADER
    despreadLock,
    enableDespreader,
    `endif
    bitsyncMode,
    dac0Select,
    dac1Select,
    dac2Select,
    falseLockAlpha,
    falseLockThreshold,
    amTC
    );

input   [11:0]addr;
input   [31:0]dataIn;
output  [31:0]dataOut;
input   cs;
input   wr0,wr1,wr2,wr3;

input           highFreqOffset;
input           bitsyncLock;
input           auBitsyncLock;
input           demodLock;
`ifdef ADD_DESPREADER
input           despreadLock;
`endif

`ifdef SYM_DEVIATION
input   [15:0]  fskDeviation;
`else
input   [15:0]  posDeviation;
input   [15:0]  negDeviation;
`endif

output  [4:0]   demodMode;
reg     [4:0]   demodMode;

`ifdef ADD_DESPREADER
output          enableDespreader;
reg             enableDespreader;
`endif

output  [1:0]   bitsyncMode;
reg     [1:0]   bitsyncMode;

output  [3:0]   dac0Select;
reg     [3:0]   dac0Select;

output  [3:0]   dac1Select;
reg     [3:0]   dac1Select;

output  [3:0]   dac2Select;
reg     [3:0]   dac2Select;

output  [15:0]  falseLockAlpha;
reg     [15:0]  falseLockAlpha;

output  [15:0]  falseLockThreshold;
reg     [15:0]  falseLockThreshold;

output  [4:0]   amTC;
reg     [4:0]   amTC;


always @(negedge wr0) begin
    if (cs) begin
        casex (addr)
            `DEMOD_CONTROL: begin
                demodMode <= dataIn[4:0];
                end
            `DEMOD_DACSELECT: begin
                dac0Select <= dataIn[3:0];
                end
            `DEMOD_FALSELOCK: begin
                falseLockAlpha[7:0] <= dataIn[7:0];
                end
            `DEMOD_AMTC: begin
                amTC <= dataIn[4:0];
                end
            default: ;
            endcase
        end
    end

always @(negedge wr1) begin
    if (cs) begin
        casex (addr)
            `ifdef ADD_DESPREADER
            `DEMOD_CONTROL: begin
                enableDespreader <= dataIn[15];
                end
            `endif
            `DEMOD_DACSELECT: begin
                dac1Select <= dataIn[11:8];
                end
            `DEMOD_FALSELOCK: begin
                falseLockAlpha[15:8] <= dataIn[15:8];
                end
            default: ;
            endcase
        end
    end

always @(negedge wr2) begin
    if (cs) begin
        casex (addr)
            `DEMOD_CONTROL: begin
                bitsyncMode <= dataIn[17:16];
                end
            `DEMOD_DACSELECT: begin
                dac2Select <= dataIn[19:16];
                end
            `DEMOD_FALSELOCK: begin
                falseLockThreshold[7:0] <= dataIn[23:16];
                end
            default: ;
            endcase
        end
    end

always @(negedge wr3) begin
    if (cs) begin
        casex (addr)
            `DEMOD_FALSELOCK: begin
                falseLockThreshold[15:8] <= dataIn[31:24];
                end
            default: ;
            endcase
        end
    end

reg [31:0]dataOut;
always @* begin
    if (cs) begin
        casex (addr)
            `ifdef ADD_DESPREADER
            `DEMOD_CONTROL:     dataOut <= {14'b0,bitsyncMode,enableDespreader,10'b0,demodMode};
            `else
            `DEMOD_CONTROL:     dataOut <= {14'b0,bitsyncMode,11'b0,demodMode};
            `endif
            `DEMOD_DACSELECT:   dataOut <= {12'h0,dac2Select,4'h0,dac1Select,4'h0,dac0Select};
            `DEMOD_FALSELOCK:   dataOut <= {falseLockThreshold,falseLockAlpha};
            `ifdef ADD_DESPREADER
            `DEMOD_STATUS:      dataOut <= {27'h0,despreadLock,
            `else
            `DEMOD_STATUS:      dataOut <= {28'h0,
            `endif
                                            auBitsyncLock,highFreqOffset,bitsyncLock,demodLock};
            `DEMOD_AMTC:        dataOut <= {27'b0,amTC};
            `ifdef SYM_DEVIATION
            `DEMOD_FSKDEV:      dataOut <= {16'b0,fskDeviation};
            `else
            `DEMOD_FSKDEV:      dataOut <= {negDeviation,posDeviation};
            `endif
            default:            dataOut <= 32'h0;
            endcase
        end
    else begin
        dataOut <= 32'hx;
        end
    end
endmodule
