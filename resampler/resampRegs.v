`timescale 1ns/10ps

`include "addressMap.v"

module resampRegs(
    addr,
    dataIn,
    dataOut,
    cs,
    wr0, wr1, wr2, wr3,
    resampleRate,
    auResampleRate,
    auShift,
    auDecimation
    );

input   [11:0]addr;
input   [31:0]dataIn;
output  [31:0]dataOut;
input   cs;
input   wr0,wr1,wr2,wr3;

output  [31:0] resampleRate;
reg     [31:0] resampleRate;

output  [31:0] auResampleRate;
reg     [31:0] auResampleRate;

output  [14:0] auDecimation;
reg     [14:0] auDecimation;

output  [5:0] auShift;
reg     [5:0] auShift;

always @(negedge wr0) begin
    if (cs) begin
        casex (addr)
            `RESAMPLER_RATE: resampleRate[7:0] <= dataIn[7:0];
            `RESAMPLER_AURATE: auResampleRate[7:0] <= dataIn[7:0];
            `RESAMPLER_AUDECIMATION: auDecimation[7:0] <= dataIn[7:0];
            `RESAMPLER_AUSHIFT: auShift <= dataIn[5:0];
            default: ;
            endcase
        end
    end

always @(negedge wr1) begin
    if (cs) begin
        casex (addr)
            `RESAMPLER_RATE:   resampleRate[15:8] <= dataIn[15:8];
            `RESAMPLER_AURATE: auResampleRate[15:8] <= dataIn[15:8];
            `RESAMPLER_AUDECIMATION: auDecimation[14:8] <= dataIn[14:8];
            default:  ;
            endcase
        end
    end

always @(negedge wr2) begin
    if (cs) begin
        casex (addr)
            `RESAMPLER_RATE:   resampleRate[23:16] <= dataIn[23:16];
            `RESAMPLER_AURATE: auResampleRate[23:16] <= dataIn[23:16];
            default:  ;
            endcase
        end
    end

always @(negedge wr3) begin
    if (cs) begin
        casex (addr)
            `RESAMPLER_RATE:   resampleRate[31:24] <= dataIn[31:24];
            `RESAMPLER_AURATE: auResampleRate[31:24] <= dataIn[31:24];
            default:  ;
            endcase
        end
    end

reg [31:0]dataOut;
always @(addr or cs or
         resampleRate or auResampleRate or
         auDecimation or auShift
         ) begin
    if (cs) begin
        casex (addr)
            `RESAMPLER_RATE:            dataOut <= resampleRate;
            `RESAMPLER_AURATE:          dataOut <= auResampleRate;
            `RESAMPLER_AUDECIMATION:    dataOut <= {17'b0,auDecimation};
            `RESAMPLER_AUSHIFT:         dataOut <= {26'b0,auShift};
            default:                    dataOut <= 32'hx;
            endcase
        end
    else begin
        dataOut <= 32'hx;
        end
    end
endmodule
