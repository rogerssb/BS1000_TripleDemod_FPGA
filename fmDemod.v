/******************************************************************************
Copyright 2008-2015 Koos Technical Services, Inc. All Rights Reserved

This source code is the Intellectual Property of Koos Technical Services,Inc. 
(KTS) and is provided under a License Agreement which protects KTS' ownership and
derivative rights in exchange for negotiated compensation.
******************************************************************************/

`timescale 1ns / 10 ps
`include "addressMap.v"

module fmDemod( 
    input                       clk, reset, clkEn,
    input       signed  [17:0]  iFm,qFm,
    input               [4:0]   demodMode,
    output      signed  [11:0]  phase,
    output  reg signed  [11:0]  phaseError,
    output  reg signed  [11:0]  freq,
    output  reg signed  [11:0]  freqError,
    output              [12:0]  mag,
    output                      clkEnOut
);

    `ifdef SIMULATE
    real iFmReal;
    real qFmReal;
    always @(iFm) iFmReal = ((iFm > 131071.0) ? (iFm - 262144.0) : iFm)/131072.0;
    always @(qFm) qFmReal = ((qFm > 131071.0) ? (qFm - 262144.0) : qFm)/131072.0;
    `endif


    // CORDIC
    vm_cordic_fast cordic(
        .clk(clk),
        .ena(clkEn),
        .x(iFm[17:4]),.y(qFm[17:4]),
        .m(mag),
        .p(phase),
        .enOut(clkEnOut)
    );

    wire    signed  [11:0]   bpskPhase = phase;
    wire    signed  [11:0]   qpskPhase = phase - $signed(12'h200);
    always @(posedge clk) begin
        if (clkEnOut) begin
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
                    phaseError <= $signed({bpskPhase[10:0],1'b0});
                    end
                `MODE_QPSK,
                `MODE_OQPSK,
                `MODE_AQPSK: begin
                    phaseError <= $signed({qpskPhase[9:0],2'b0});
                    end
                default: begin
                    phaseError <= 0;
                    end
            endcase
        end
    end

    // FM = derivative approximation based on phase difference

    reg     signed  [11:0]  prevPhase;
    reg     signed  [11:0]  prevPhaseError;
    wire    signed  [11:0]  phaseDiff = phase - prevPhase;
    wire    signed  [11:0]  phaseErrorDiff = phaseError - prevPhaseError;
    reg                     polarityFlag;
    `ifdef SIMULATE
    initial polarityFlag = 1;
    `endif
    always @(posedge clk) begin
        if (clkEnOut) begin
            if (phaseDiff == 12'h800) begin
                polarityFlag <= ~polarityFlag;
                if (polarityFlag) begin
                    freq <= $signed(12'h801);
                end
                else begin
                    freq <= $signed(12'h7ff);
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
    always @(mag) magReal   = $itor(mag)/(2**13);
    real phaseReal;
    always @(phase) phaseReal = $itor(phase)/(2**11);
    real phaseErrorReal;
    always @(phaseError) phaseErrorReal = $itor(phaseError)/(2**11);
    real freqReal;
    always @(freq) freqReal = $itor(freq)/(2**11);
    real freqErrorReal; 
    always @(freqError) freqErrorReal = $itor(freqError)/(2**11);
    `endif

endmodule
