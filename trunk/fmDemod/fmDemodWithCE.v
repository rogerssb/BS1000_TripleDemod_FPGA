/******************************************************************************
Copyright 2008-2015 Koos Technical Services, Inc. All Rights Reserved

This source code is the Intellectual Property of Koos Technical Services,Inc. 
(KTS) and is provided under a License Agreement which protects KTS' ownership and
derivative rights in exchange for negotiated compensation.
******************************************************************************/

`timescale 1ns / 10 ps
`include "addressMap.v"

module fmDemodWithCE( 
    clk, reset, sync,
    iFm,qFm,
    demodMode,
    phase,
    phaseError,
    freq,
    freqError,
    mag
    );

input clk;
input reset;
input sync;
input   [17:0]  iFm;
input   [17:0]  qFm;
input   [3:0]   demodMode;
output  [11:0]   phase;
output  [11:0]   phaseError;
output  [11:0]   freq;
output  [11:0]   freqError;
output  [12:0]   mag;

`ifdef SIMULATE
real iFmReal;
real qFmReal;
always @(iFm) iFmReal = ((iFm > 131071.0) ? (iFm - 262144.0) : iFm)/131072.0;
always @(qFm) qFmReal = ((qFm > 131071.0) ? (qFm - 262144.0) : qFm)/131072.0;
`endif


// CORDIC
vm_cordic cordic(
    .clk(clk),
    .ena(sync),
    .x(iFm[17:4]),.y(qFm[17:4]),
    .m(mag),
    .p(phase)
    );

wire    [11:0]   bpskPhase = phase;
wire    [11:0]   qpskPhase = phase - 12'h200;
reg     [11:0]   phaseError;
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
            `MODE_UQPSK,
            `MODE_AUQPSK,
            `MODE_BPSK: begin
                phaseError <= {bpskPhase[10:0],1'b0};
                end
            `MODE_QPSK,
            `MODE_OQPSK,
            `MODE_AQPSK: begin
                phaseError <= {qpskPhase[9:0],2'b0};
                end
            default: begin
                phaseError <= 0;
                end
            endcase
        end
    end

// FM = derivative approximation based on phase difference

reg     [11:0]  freq;
reg     [11:0]  freqError;
reg     [11:0]  prevPhase;
reg     [11:0]  prevPhaseError;
wire    [11:0]  phaseDiff = phase - prevPhase;
wire    [11:0]  phaseErrorDiff = phaseError - prevPhaseError;
reg             polarityFlag;
`ifdef SIMULATE
initial polarityFlag = 1;
`endif
always @(posedge clk) begin
    if (sync) begin
        if (phaseDiff == 12'h800) begin
            polarityFlag <= ~polarityFlag;
            if (polarityFlag) begin
                freq <= 12'h801;
                end
            else begin
                freq <= 12'h7ff;
                end
            end
        else begin
            freq <= phaseDiff;
            end
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
always @(phase) phaseReal = (phase[11] ? (phase - 4096.0) : phase)/2048.0;
always @(phaseError) phaseErrorReal = (phaseError[11] ? (phaseError - 4096.0) : phaseError)/2048.0;
always @(freq) freqReal = (freq[11] ? (freq - 4096.0) : freq)/2048.0; 
always @(freqError) freqErrorReal = (freqError[11] ? (freqError - 4096.0) : freqError)/2048.0; 
`endif

endmodule
