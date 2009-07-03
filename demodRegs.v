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
    demodLock,
    fskDeviation,
    demodMode,
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
input           demodLock;

input   [15:0]  fskDeviation;

output  [3:0]   demodMode;
reg     [3:0]   demodMode;

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
                demodMode <= dataIn[3:0];
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
always @(addr or cs or
         fskDeviation or
         demodMode or
         bitsyncMode or
         dac0Select or dac1Select or dac2Select or
         falseLockAlpha or falseLockThreshold or 
         highFreqOffset or bitsyncLock or demodLock or
         amTC
         ) begin
    if (cs) begin
        casex (addr)
            `DEMOD_CONTROL:     dataOut <= {14'b0,bitsyncMode,12'b0,demodMode};
            `DEMOD_DACSELECT:   dataOut <= {12'h0,dac2Select,4'h0,dac1Select,4'h0,dac0Select};
            `DEMOD_FALSELOCK:   dataOut <= {falseLockThreshold,falseLockAlpha};
            `DEMOD_STATUS:      dataOut <= {29'h0,highFreqOffset,bitsyncLock,demodLock};
            `DEMOD_AMTC:        dataOut <= {27'b0,amTC};
            `DEMOD_FSKDEV:      dataOut <= {16'b0,fskDeviation};
            default:            dataOut <= 32'h0;
            endcase
        end
    else begin
        dataOut <= 32'hx;
        end
    end
endmodule
