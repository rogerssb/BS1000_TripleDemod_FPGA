`timescale 1ns / 10 ps
`include "addressMap.v"

module millerDecoder(
    input           clk,
    input           reset,
    input           clkEn,
    input           pcmEn,
    input   [3:0]   pcmMode,
    input           pcmBit,
    output          nrzEn,
    output  reg     nrzBit
);

    //---------------------------- Transition Detector ------------------------
    //  This counts the number of pcmBits between transitions. In the absence of
    //  bit errors, the maximum distance between transitions for a Miller code is 
    //  4 samples (assuming 2 samples per information bit), so the counter saturates
    //  at 7.

    reg             lastSample;
    reg             transition;
    reg     [2:0]   transitionCount;
    reg     [2:0]   samplesBetweenTransitions;
    always @(posedge clk) begin
        if (clkEn) begin
            if (pcmEn) begin
                // Is there a transition?
                if (lastSample != pcmBit) begin
                    // Yes. Save the transition count
                    samplesBetweenTransitions <= transitionCount;
                    transitionCount <= 1;
                    transition <= 1;
                end
                else if (transitionCount < 7) begin
                    // No. Increment the transition count
                    transitionCount <= transitionCount + 1;
                    transition <= 0;
                end
                else begin
                    transition <= 0;
                end
                // Save the last sample
                lastSample <= pcmBit;
            end
        end
    end

    //---------------------------- Symbol Sync --------------------------------
    //  The longest transition (4) can only happen when the information bit sequence 
    //  is "101", and its edges fall in the middle of "1" bits. This is used to 
    //  synchronize to the incoming pcm samples and create nrzEn.
    reg             midbitSample;
    reg     [3:0]   oosyncCount;
        `define MILLER_MAX_SYNC_COUNT 15
    reg             syncState;
        `define MILLER_OOSYNC   1'b0
        `define MILLER_INSYNC   1'b1
    reg             inSync;
    always @(posedge clk) begin
        if (reset) begin
            inSync <= 0;
            syncState <= `MILLER_OOSYNC;
        end
        else if (clkEn) begin
            if (pcmEn) begin
                case (syncState)
                    `MILLER_OOSYNC: begin
                        if (transition) begin
                            if (samplesBetweenTransitions == 4) begin
                                inSync <= 1;
                                midbitSample <= 0;
                                oosyncCount <= 0;
                                syncState <= `MILLER_INSYNC;
                            end
                        end
                    end
                    `MILLER_INSYNC: begin
                        midbitSample <= !midbitSample;

                        // Test for out of sync. All 4-sample transitions should
                        // occur when midbitSample is high. 
                        if (transition) begin
                            if (samplesBetweenTransitions == 4) begin
                                if (!midbitSample) begin
                                    if (oosyncCount < `MILLER_MAX_SYNC_COUNT) begin
                                        oosyncCount <= oosyncCount + 1;
                                    end
                                    else begin
                                        syncState <= `MILLER_OOSYNC;
                                    end
                                end
                                else begin
                                    if (oosyncCount > 0) begin
                                        oosyncCount <= oosyncCount - 1;
                                    end
                                end
                            end
                        end
                    end
                    default: begin
                        inSync <= 0;
                        syncState <= `MILLER_OOSYNC;
                    end
                endcase
            end
        end
    end
    assign nrzEn = !midbitSample;

    //------------------------- Transition Decoder ----------------------------

    reg             nextNrzBit;
    reg             mdmNrzBit;
    reg             dmOmission;
    always @(posedge clk) begin
        if (clkEn) begin
            if (pcmEn) begin
                if (midbitSample) begin
                    // A midbit transition always indicates a 1.
                    if (transition) begin
                        nextNrzBit <= 1;
                    end
                    // No midbit transition always indicates a 0.
                    else begin
                        nextNrzBit <= 0;
                    end

                    // Test for omissions for modified modes
                    if (midbitSample && (transitionCount > 4)) begin
                        dmOmission <= 1;
                    end
                    else begin
                        dmOmission <= 0;
                    end
                end

                // Create an NRZ bit stream to use for restoring omissions
                if (nrzEn) begin
                    mdmNrzBit <= nextNrzBit;
                end

            end

        end
    end

    //------------------------- Mark/Space Decoder ----------------------------

    always @(posedge clk) begin
        if (clkEn) begin
            if (pcmEn & nrzEn) begin
                case (pcmMode) 
                    `PNGEN_PCM_DMM:     nrzBit <=  nextNrzBit;
                    `PNGEN_PCM_DMS:     nrzBit <= !nextNrzBit;
                    `PNGEN_PCM_MDMM:    nrzBit <=   mdmNrzBit | dmOmission;
                    `PNGEN_PCM_MDMS:    nrzBit <= !(mdmNrzBit | dmOmission);
                    default:            nrzBit <=  nextNrzBit;
                endcase
            end
        end
    end


endmodule
