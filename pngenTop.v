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
    wire        [1:0]   fecMode;
    wire        [1:0]   ldpcRate;
    wire        [1:0]   ldpcRandomize;
    wire        [31:0]  rsEncoderASM;
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
        .vitG2Inv(vitG2Inv),
        .ldpcRate(ldpcRate),
        .ldpcBlockSize(ldpcBlockSize),
        `ifdef ADD_RSENCODER
        .ldpcRandomize(ldpcRandomize),
        .rsParity32(rsParity32),
        .rsASMEnable(rsASMEnable),
        .rsEncoderASM(rsEncoderASM)
        `else
        .ldpcRandomize(ldpcRandomize)
        `endif
    );

    // Phase Accumulator
    reg     [31:0]  phase;
    assign          pnClk = phase[31];
    wire    [32:0]  phaseSum = {1'b0,phase} + {1'b0,pnClockRate};
    reg             infoClkEn;
    reg             everyOtherEn;
    reg             pause;

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
    wire [23:0] polyData;
    bert_lfsr pn_lfsr (
        .poly(poly),
        .poly_length(pnPolyLength),
        .reset(reset),
        .clock(clk),
        .enable(infoClkEn),
        .reload(~|polyData),    // TODO FZ lfsr was going to all zeroes if fed bad poly. Couldn't recover
        .load_data(24'h0099),
        .data(polyData),
        .serial(pnBit0)
    );

    `else //ADD_PCM_ENCODER

    // PN Generator
    `include "bert/bert_functions.v"
    wire [23:0] poly = pnPolyMode ? mirror_taps (pnPolyTaps, pnPolyLength) : pnPolyTaps;
    wire [23:0] polyData;
    bert_lfsr pn_lfsr (
        .poly(poly),
        .poly_length(pnPolyLength),
        .reset(reset),
        .clock(clk),
        .enable(infoClkEn),
        .reload(~|polyData),    // TODO FZ lfsr was going to all zeroes if fed bad poly. Couldn't recover
        .load_data(24'b0),
        .data(polyData),
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
        .hold(holdConvEnc),
        .encBit(pnBitConvEnc),
        .vitG2Inv(vitG2Inv)
    );


   wire holdLdpc;
   reg  ldpcEncReset;
    `ifdef ADD_LDPC
    /// LDPC Encoder ///
    ldpc_encoder ldpc(
        .clk(clk),
        .clkEn(pnClkEn),
        .reset(ldpcEncReset),
        .pcmBit(pnBit0),
        .hold(holdLdpc),
        .encBit(ldpcEncBit),
        .rate(ldpcRate),
        .blocksize(ldpcBlockSize),
        .randomize(ldpcRandomize)
    );
    `endif

    `ifdef ADD_RSENCODER
    wire    holdRS = !rsInputReady;
    rsEncoder rsEnc (
        .clk(clk),
        .clkEn(1'b1),
        .reset(reset),
        .rsParity32(rsParity32),
        .rsASMEnable(rsASMEnable),
        .rsEncoderASM(rsEncoderASM),
        .infoBitValid(pnClkEn),
        .infoBit(pnBit0),
        .inputReady(rsInputReady),
        .rsBitEn(rsBitEn),
        .rsBit(rsBit)
    );
    `endif


    always @* begin
        case (fecMode)
            `PNGEN_FEC_CONV:    pause = holdConvEnc;
            `PNGEN_FEC_LDPC:    pause = holdLdpc;
            `ifdef ADD_RSENCODER
            `PNGEN_FEC_RS:      pause = holdRS;
            `endif
            default:            pause = 0;
        endcase
    end


    reg pnBitMux;
    always @(posedge clk) begin
        if (reset) begin
            pnBitMux <= 1'b0;
            convEncReset <= 1'b1;
            ldpcEncReset <= 1'b1;
        end
        else if(pnClkEn) begin
            case (fecMode)
            `PNGEN_FEC_OFF:     begin
                                pnBitMux <= pnBit0;
                                convEncReset <= 1;
                                ldpcEncReset <= 1;
                                end
            `PNGEN_FEC_CONV:    begin
                                pnBitMux <= pnBitConvEnc;
                                convEncReset <= 0;
                                ldpcEncReset <= 1;
                                end
        `ifdef ADD_LDPC
            `PNGEN_FEC_LDPC:    begin
                                pnBitMux <= ldpcEncBit;
                                ldpcEncReset <= 0;
                                convEncReset <= 1;
                                end
        `endif
        `ifdef ADD_RSENCODER
            `PNGEN_FEC_RS:      begin
                                pnBitMux <= rsBit;
                                convEncReset <= 1;
                                ldpcEncReset <= 1;
                                end
        `endif
            default:            begin
                                pnBitMux <= pnBit0;
                                convEncReset <= 1;
                                ldpcEncReset <= 1;
                                end
            endcase
        end
    end
    assign pnBit = pnBitMux;

endmodule
