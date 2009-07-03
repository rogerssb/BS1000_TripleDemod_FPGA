`timescale 1ns / 10 ps
`include "addressMap.v"

module fmDemod( 
    clk, reset, sync,
    iFm,qFm,
    demodMode,
    phase,
    phaseError,
    freq,
    freqError,
    mag);

input clk;
input reset;
input sync;
input   [17:0]  iFm;
input   [17:0]  qFm;
input   [3:0]   demodMode;
output  [7:0]   phase;
output  [7:0]   phaseError;
output  [7:0]   freq;
output  [7:0]   freqError;
output  [8:0]   mag;

`ifdef SIMULATE
real iFmReal;
real qFmReal;
always @(iFm) iFmReal = ((iFm > 131071.0) ? (iFm - 262144.0) : iFm)/131072.0;
always @(qFm) qFmReal = ((qFm > 131071.0) ? (qFm - 262144.0) : qFm)/131072.0;
`endif


// CORDIC
`ifdef COREGEN
cordic18x12 cordic( .clk        (clk),
                    .ce         (sync),
                    .x_in       (iFm),
                    .y_in       (qFm),
                    .rdy        (cordicSync),
                    .x_out      (mag),
                    .phase_out  (phase)
                  );
`else
vm_cordic cordic(.clk(clk),
                 .ena(sync),
                 .x(iFm[17:8]),.y(qFm[17:8]),
                 .m(mag),
                 .p(phase)
                 );
/*
cordic cordic (.clk(clk),
               .ena(sync),
               .Iin(iFm[17:8]), .Qin(qFm[17:8]),
               .magn(mag),
               .phase(phase)
               );
*/
`endif

wire    [7:0]   bpskPhase = phase;
wire    [7:0]   qpskPhase = phase - 8'h20;
reg     [7:0]   phaseError;
always @(posedge clk) begin
    if (sync) begin
        case (demodMode)
            `MODE_AM: begin
                phaseError <= 0;
                end
            `MODE_PM: begin
                phaseError <= phase;
                end
            `MODE_FM: begin
                phaseError <= phase;
                end
            `MODE_2FSK: begin
                phaseError <= phase;
                end
            `MODE_BPSK: begin
                phaseError <= {bpskPhase[6:0],1'b0};
                end
            `MODE_QPSK,
            `MODE_OQPSK: begin
                phaseError <= {qpskPhase[5:0],2'b0};
                end
            default: begin
                phaseError <= 0;
                end
            endcase
        end
    end

// FM = derivative approximation based on phase difference

reg [7:0]freq;
reg [7:0]freqError;
reg [7:0]prevPhase;
reg [7:0]prevPhaseError;
wire [7:0]phaseDiff = phase - prevPhase;
wire [7:0]phaseErrorDiff = phaseError - prevPhaseError;
always @(posedge clk) begin
    if (sync) begin
        freq <= phaseDiff;
        prevPhase <= phase;
        freqError <= phaseErrorDiff;
        prevPhaseError <= phaseError;
        end
    end


`ifdef SIMULATE
real magReal;
real phaseReal;
real phaseErrorReal;
real freqReal;
real freqErrorReal; 
always @(mag) magReal   = mag/512.0;
always @(phase) phaseReal = ((phase > 127.0) ? (phase - 256.0) : phase)/128.0;
always @(phaseError) phaseErrorReal = ((phaseError > 127.0) ? (phaseError - 256.0) : phaseError)/128.0;
always @(freq) freqReal = ((freq > 127.0) ? (freq - 256.0) : freq)/128.0; 
always @(freqError) freqErrorReal = ((freqError > 127.0) ? (freqError - 256.0) : freqError)/128.0; 
`endif

endmodule
