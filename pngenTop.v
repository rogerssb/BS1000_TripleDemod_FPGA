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
    output              nrzBit,
    output              pnBit
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
        .pnRestart(pnRestart)
    );

    // Phase Accumulator
    reg     [31:0]  phase;
    wire    [32:0]  phaseSum = {1'b0,phase} + {1'b0,pnClockRate};
    reg             infoClkEn;
    reg             everyOtherEn;
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
                        infoClkEn <= 1;
                    end
                    else begin
                        pnClkEn <= 0;
                        infoClkEn <= 0;
                    end
                end
                default: begin
                    phase <= phaseSum[31:0];
                    if (phaseSum[32]) begin
                        pnClkEn <= 1;
                        everyOtherEn <= ~everyOtherEn;
                        if (everyOtherEn) begin
                            infoClkEn <= 1;
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
        .serial(pnBit)
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
        .serial(nrzBit)
    );


    // PCM Encoder
    pngenPcmEncoder pn_enc(
        .clk(clk),
        .reset(reset),
        .clkEn(clkEn),
        .pnClkEn(pnClkEn),
        .infoClkEn(infoClkEn),
        .pcmMode(pcmMode),
        .pcmInvert(pcmInvert),
        .nrzBit(nrzBit),
        .pcmBit(pnBit)
    );

    `endif //ADD_PCM_ENCODER

endmodule
