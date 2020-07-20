`timescale 1ns / 10 ps
`include "addressMap.v"

module pcmEncoder (
    input           clk,
    input           reset,
    input           clkEn,
    input           sym2xClkEn,
    input           symClkEn,
    input   [3:0]   pcmMode,
    input           pcmInvert,
    input           nrzBit,
    output  reg     pcmBit
);

    // Create a differential encoder for M and S
    reg             prevBit;
    reg             diffBit;
    always @(posedge clk) begin
        if (reset) begin
            prevBit <= 0;
        end
        if (clkEn & symClkEn) begin
            prevBit <= nrzBit;
            case (pcmMode)
                `PNGEN_PCM_NRZM:
                    if (prevBit ^ nrzBit) begin
                        diffBit <= 1;
                    end
                    else begin
                        diffBit <= 0;
                    end
                default:
                    if (!(prevBit ^ nrzBit)) begin
                        diffBit <= 1;
                    end
                    else begin
                        diffBit <= 0;
                    end
            endcase
        end
    end

    // Create a signal to identify the second half of the bit period
    reg             secondHalf;
    always @(posedge clk) begin
        if (clkEn) begin
            if (sym2xClkEn) begin
                if (symClkEn) begin
                    secondHalf <= 0;
                end
                else begin
                    secondHalf <= 1;
                end
            end
        end
    end

    // Modified DM-M omission state machine. In MDMM and MDMS modes, we have to
    // create an omission signal by detecting when an even number of contiguous
    // 1's is preceded by an odd number of (possibly non-continguous) 0s since
    // the last omission signal. Since the definition of the omission signal is
    // recursive, we will assume the first occurrence of an even number of 1s
    // creates an omission.
    wire            modifyEnable = ( (pcmMode == `PNGEN_PCM_MDMM)
                                  || (pcmMode == `PNGEN_PCM_MDMS)
                                   );
    reg     [31:0]  dmBitSR;
    wire            dmBit = dmBitSR[2];
    wire            prevDmBit = dmBitSR[3];
    reg     [7:0]   zerosCount,onesCount;
    reg             dmOmission;
    always @(posedge clk) begin
        if (reset) begin
            onesCount <= 0;
            zerosCount <= 0;
        end
        else if (clkEn) begin
            if (symClkEn) begin
                // Invert the incoming NRZ data if in one of the Space modes.
                case (pcmMode)
                    `PNGEN_PCM_DMS,
                    `PNGEN_PCM_MDMS:    dmBitSR <= {dmBitSR[30:0],!nrzBit};
                    default:            dmBitSR <= {dmBitSR[30:0], nrzBit};
                endcase

                // Omission State Machine
                // Is the bit a 1?
                if (dmBitSR[0]) begin
                    // Yes. Count the ones.
                    onesCount <= onesCount + 1;
                    dmOmission <= 0;
                end
                else begin
                    // No. Does this terminate a sequence of consecutive ones?
                    if (onesCount > 0) begin
                        // Yes. Is the number of ones even?
                        if (!onesCount[0]) begin
                            // Yes. Is the number of preceding zeros odd?
                            if (zerosCount[0]) begin
                                // Yes. Create an omission and clear the counts
                                dmOmission <= modifyEnable;
                                zerosCount <= 1; // Count the current zero
                            end
                            else begin
                                // No. Keep counting zeros
                                dmOmission <= 0;
                                zerosCount <= zerosCount + 1;
                            end
                        end
                        else begin
                            // No. Clear the ones count and count the zero.
                            dmOmission <= 0;
                            zerosCount <= zerosCount + 1;
                        end
                    end
                    else begin
                        // No. Clear the ones count and count the zero.
                        dmOmission <= 0;
                        zerosCount <= zerosCount + 1;
                    end
                    onesCount <= 0;
                end
            end
        end
    end



    // Final encode
    reg             prevOmission;
    always @(posedge clk) begin
        if (reset) begin
            pcmBit <= 0;
        end
        else if (clkEn) begin
            case (pcmMode)
                `PNGEN_PCM_NRZL: begin
                    if (symClkEn) begin
                        pcmBit <= pcmInvert ^ nrzBit;
                    end
                end
                `PNGEN_PCM_NRZM,
                `PNGEN_PCM_NRZS: begin
                    if (symClkEn) begin
                        pcmBit <= pcmInvert ^ diffBit;
                    end
                end
                `PNGEN_PCM_BIPL: begin
                    if (sym2xClkEn) begin
                        if (secondHalf) begin
                            pcmBit <= pcmInvert ^ ~nrzBit;
                        end
                        else begin
                            pcmBit <= pcmInvert ^ nrzBit;
                        end
                    end
                end
                `PNGEN_PCM_BIPM,
                `PNGEN_PCM_BIPS: begin
                    if (sym2xClkEn) begin
                        if (secondHalf) begin
                            pcmBit <= pcmInvert ^ ~diffBit;
                        end
                        else begin
                            pcmBit <= pcmInvert ^ diffBit;
                        end
                    end
                end
                `PNGEN_PCM_DMM,
                `PNGEN_PCM_DMS,
                `PNGEN_PCM_MDMM,
                `PNGEN_PCM_MDMS: begin
                    if (sym2xClkEn) begin
                        // Am I calculating the first half of the next bit?
                        if (secondHalf) begin
                            // Yes. If the uncoded bit is a one, leave the
                            // first half unchanged. Else, if the uncoded bit
                            // is a zero preceded by a zero, flip the output
                            if (!dmBit) begin
                                if (!prevDmBit) begin
                                    pcmBit <= !pcmBit;
                                end
                            end
                            // Delay the omission signal by half a bit
                            prevOmission <= dmOmission;
                        end
                        // Calculating second half of the next bit. By this time,
                        // prevBit contains the bit we are encoding.
                        else begin
                            // If the uncoded bit was a one, flip the output.
                            if (prevDmBit && !prevOmission) begin
                                pcmBit <= !pcmBit;
                            end
                        end
                    end
                end
                default: begin
                    if (symClkEn) begin
                        pcmBit <= nrzBit;
                    end
                end
            endcase
        end
    end

endmodule

