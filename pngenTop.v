`timescale 1ns / 10 ps
`include "addressMap.v"

module pngenTop(
    input               clk,
    input               clkEn,
    input               reset,
    input               busClk,
    input               wr0, wr1, wr2, wr3,
    input       [12:0]  addr,
    input       [31:0]  din,
    output      [31:0]  dout,
    output  reg         pnClkEn,
    output  reg         nrzBit,
    output              pnBit,
    output              pnClk
);


    wire        [23:0]  pnPolyTaps;
    wire        [4:0]   pnPolyLength;
    wire        [31:0]  pnClockRate;
    wire        [3:0]   pcmMode;    
    pngenRegs pngenRegs(
        .busClk(busClk),
        .wr0(wr0), .wr1(wr1), .wr2(wr2), .wr3(wr3),
        .addr(addr),
        .din(din),
        .dout(dout),
        .pnPolyTaps(pnPolyTaps),
        .pnPolyLength(pnPolyLength),
        .pnPolyMode(pnPolyMode),
        .pnClockRate(pnClockRate),
        .pcmMode(pcmMode),
        .pcmInvert(pcmInvert),
        .pnRestart(pnRestart),
        .inject1E3Errors(inject1E3Errors),
        .injectError(injectError),
        .fecMode(fecMode),
        .vitG2Inv(vitG2Inv)
    );

    // Phase Accumulator
    reg     [31:0]  phase;
    assign          pnClk = phase[31];
    wire    [32:0]  phaseSum = {1'b0,phase} + {1'b0,pnClockRate};
    reg             infoClkEn;
    reg             everyOtherEn;
    wire            pause;
    
    always @(posedge clk) begin
        if (reset) begin
            phase <= 0;
            pnClkEn <= 0;
            everyOtherEn <= 0;
        end
        else if (clkEn) begin
            case (pcmMode) 
                `PNGEN_PCM_NRZL,
                `PNGEN_PCM_NRZM,
                `PNGEN_PCM_NRZS: begin
                    phase <= phaseSum[31:0];
                    if (phaseSum[32]) begin
                        pnClkEn <= 1;
                        if(~pause)
                            infoClkEn <= 1;
                    end
                    else begin
                        pnClkEn <= 0;
                        if(~pause)
                            infoClkEn <= 0;
                    end
                end
                default: begin
                    phase <= phaseSum[31:0];
                    if (phaseSum[32]) begin
                        pnClkEn <= 1;
                        if(~pause) begin
                            everyOtherEn <= ~everyOtherEn;
                            if (everyOtherEn) begin
                                infoClkEn <= 1;
                            end
                        end
                    end
                    else begin
                        pnClkEn <= 0;
                        infoClkEn <= 0;
                    end
                end
            endcase
        end
        else begin
            pnClkEn <= 0;
            infoClkEn <= 0;
        end
    end

    `define ADD_PCM_ENCODER
    `ifndef ADD_PCM_ENCODER

    // PN Generator
    `include "bert/bert_functions.v"
    wire [23:0] poly = pnPolyMode ? mirror_taps (pnPolyTaps, pnPolyLength) : pnPolyTaps;
    bert_lfsr pn_lfsr (
        .poly(poly),
        .poly_length(pnPolyLength),
        .reset(reset),
        .clock(clk),
        .enable(infoClkEn),
        .reload(1'b0),
        .load_data(24'b0),
        .data(),
        .serial(pnBit0)
    );

    `else //ADD_PCM_ENCODER

    // PN Generator
    `include "bert/bert_functions.v"
    wire [23:0] poly = pnPolyMode ? mirror_taps (pnPolyTaps, pnPolyLength) : pnPolyTaps;
    bert_lfsr pn_lfsr (
        .poly(poly),
        .poly_length(pnPolyLength),
        .reset(reset),
        .clock(clk),
        .enable(infoClkEn),
        .reload(1'b0),
        .load_data(24'b0),
        .data(),
        .serial(errorFreeNrzBit)
    );

    // Circuit to inject a bit error.
    reg     [2:0]   injectSR;
    reg     [9:0]   injectBitCount;
    reg             inject1E3Error;
    always @(posedge clk) begin
        if (infoClkEn) begin
            if (injectBitCount > 0) begin
                injectBitCount <= injectBitCount - 1;
                inject1E3Error <= 0;
            end
            else begin
                injectBitCount <= 10'd999;
                inject1E3Error <= inject1E3Errors;
            end
            injectSR <= {injectSR[1:0],injectError};
            if ((injectSR == 3'b011) || inject1E3Error) begin
                nrzBit <= ~errorFreeNrzBit;
            end
            else begin
                nrzBit <= errorFreeNrzBit;
            end
        end
    end

    // PCM Encoder
    pngenPcmEncoder pn_enc(
        .clk(clk),
        .reset(reset),
        .clkEn(clkEn),
        .pnClkEn(pnClkEn & ~pause),
        .infoClkEn(infoClkEn),
        .pcmMode(pcmMode),
        .pcmInvert(pcmInvert),
        .nrzBit(nrzBit),
        .pcmBit(pnBit0)
    );

    `endif //ADD_PCM_ENCODER
    
    // Foward Error Corrections 
    reg convEncReset;       
    convEncoder conv_enc
    (
        .clk(clk),
        .clkEn(pnClkEn),
        .reset(convEncReset),
        .pcmBit(pnBit0),
        .hold(pause),
        .encBit(pnBitConvEnc),
        .vitG2Inv(vitG2Inv)
    );


    reg pnBitMux;
    always @(posedge clk) begin
        if (reset) begin
            pnBitMux <= 0;
            convEncReset <= 1;
        end
        else if(pnClkEn) begin
            case (fecMode) 
            `PNGEN_FEC_OFF:     begin
                                pnBitMux <= pnBit0;
                                convEncReset <= 1;
                                end
            `PNGEN_FEC_CONV:    begin
                                pnBitMux <= pnBitConvEnc;
                                convEncReset <= 0;
                                end
            default:            begin 
                                pnBitMux <= pnBit0;
                                convEncReset <= 1;
                                end
            endcase
        end
    end
    assign pnBit = pnBitMux;
    
endmodule
