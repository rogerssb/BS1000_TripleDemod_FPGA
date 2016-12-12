`timescale 1ns / 10 ps
`include "addressMap.v"

module pngenPcmEncoder (
    input           clk,
    input           reset,
    input           clkEn,
    input           pnClkEn,
    input           infoClkEn,
    input   [2:0]   pcmMode,
    input           pcmInvert,
    input           nrzBit,
    output  reg     pcmBit
);

    // Create a differential encoder for M and S
    reg             prevBit;
    reg             diffBit;
    always @(posedge clk) begin
        if (clkEn & infoClkEn) begin
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

    // Create an inversion signal for the second half of the bit period
    reg             secondHalf;
    always @(posedge clk) begin
        if (clkEn) begin
            if (pnClkEn) begin
                if (infoClkEn) begin
                    secondHalf <= 0;
                end
                else begin
                    secondHalf <= 1;
                end
            end
        end
    end

    // Final encode
    always @(posedge clk) begin
        if (clkEn) begin
            case (pcmMode) 
                `PNGEN_PCM_NRZL: begin
                    if (infoClkEn) begin
                        pcmBit <= pcmInvert ^ nrzBit;    
                    end
                end
                `PNGEN_PCM_NRZM,
                `PNGEN_PCM_NRZS: begin
                    if (infoClkEn) begin
                        pcmBit <= pcmInvert ^ diffBit;    
                    end
                end
                `PNGEN_PCM_BIPL: begin
                    if (pnClkEn) begin
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
                    if (pnClkEn) begin
                        if (secondHalf) begin
                            pcmBit <= pcmInvert ^ ~diffBit;    
                        end
                        else begin
                            pcmBit <= pcmInvert ^ diffBit;    
                        end
                    end
                end
                default: begin
                    if (infoClkEn) begin
                        pcmBit <= nrzBit;
                    end
                end
            endcase
        end
    end

endmodule

