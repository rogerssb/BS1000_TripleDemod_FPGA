`timescale 1ns / 10 ps
`include "addressMap.v"

module ldpcFramer(
    input                   clk,
    input                   clkEn,
    input                   reset,
    input                   ldpcRun,
    input                   ldpcReady,
    input                   dataBitIn,
    input                   codeLength4096,
    input           [1:0]   codeRate,
    input  signed   [10:0]  syncThreshold,
    output reg      [1:0]   rotation,
    output          [1:0]   frameSyncState,
    output reg              frameSync,
    output reg              codewordEn,
    output signed   [17:0]  correlation,
    output          [17:0]  sprtSyncCount
);

    `define BITS_PER_WORD   64
    reg         [2:0]   syncWords;
    reg         [7:0]   wordsPerFrame;
    always @* begin
        case (codeRate)
            `LDPC_RATE_1_2:
                if (codeLength4096) begin
                    wordsPerFrame = 128;
                    syncWords = 4;
                end
                else begin
                    wordsPerFrame = 32;
                    syncWords = 1;
                end
            `LDPC_RATE_2_3:
                if (codeLength4096) begin
                    wordsPerFrame = 96;
                    syncWords = 4;
                end
                else begin
                    wordsPerFrame = 24;
                    syncWords = 1;
                end
            `LDPC_RATE_4_5:
                if (codeLength4096) begin
                    wordsPerFrame = 80;
                    syncWords = 4;
                end
                else begin
                    wordsPerFrame = 20;
                    syncWords = 1;
                end
            default: begin
                wordsPerFrame = 32;
                syncWords = 1;
            end
        endcase
    end

    // Shift register used in correlator
    reg [63:0]corrSR;
    always @(posedge clk) begin
        if (clkEn) begin
            corrSR <= {corrSR[62:0],dataBitIn};
        end
    end

    wire [63:0] syncword = 64'hFCB8_8938_D8D7_6A4F;

    wire signed [3:0]   corr0;
    fourBitCorrelatorLdpc corrNibble0(
        .clk(clk),
        .data(corrSR[3:0]),
        .pattern(syncword[3:0]),
        .correlation(corr0)
        );

    wire signed [3:0]   corr1;
    fourBitCorrelatorLdpc corrNibble1(
        .clk(clk),
        .data(corrSR[7:4]),
        .pattern(syncword[7:4]),
        .correlation(corr1)
        );

    wire signed [3:0]   corr2;
    fourBitCorrelatorLdpc corrNibble2(
        .clk(clk),
        .data(corrSR[11:8]),
        .pattern(syncword[11:8]),
        .correlation(corr2)
        );

    wire signed [3:0]   corr3;
    fourBitCorrelatorLdpc corrNibble3(
        .clk(clk),
        .data(corrSR[15:12]),
        .pattern(syncword[15:12]),
        .correlation(corr3)
        );

    wire signed [3:0]   corr4;
    fourBitCorrelatorLdpc corrNibble4(
        .clk(clk),
        .data(corrSR[19:16]),
        .pattern(syncword[19:16]),
        .correlation(corr4)
        );

    wire signed [3:0]   corr5;
    fourBitCorrelatorLdpc corrNibble5(
        .clk(clk),
        .data(corrSR[23:20]),
        .pattern(syncword[23:20]),
        .correlation(corr5)
        );

    wire signed [3:0]   corr6;
    fourBitCorrelatorLdpc corrNibble6(
        .clk(clk),
        .data(corrSR[27:24]),
        .pattern(syncword[27:24]),
        .correlation(corr6)
        );

    wire signed [3:0]   corr7;
    fourBitCorrelatorLdpc corrNibble7(
        .clk(clk),
        .data(corrSR[31:28]),
        .pattern(syncword[31:28]),
        .correlation(corr7)
        );

    wire signed [3:0]   corr8;
    fourBitCorrelatorLdpc corrNibble8(
        .clk(clk),
        .data(corrSR[35:32]),
        .pattern(syncword[35:32]),
        .correlation(corr8)
        );

    wire signed [3:0]   corr9;
    fourBitCorrelatorLdpc corrNibble9(
        .clk(clk),
        .data(corrSR[39:36]),
        .pattern(syncword[39:36]),
        .correlation(corr9)
        );

    wire signed [3:0]   corr10;
    fourBitCorrelatorLdpc corrNibble10(
        .clk(clk),
        .data(corrSR[43:40]),
        .pattern(syncword[43:40]),
        .correlation(corr10)
        );

    wire signed [3:0]   corr11;
    fourBitCorrelatorLdpc corrNibble11(
        .clk(clk),
        .data(corrSR[47:44]),
        .pattern(syncword[47:44]),
        .correlation(corr11)
        );

    wire signed [3:0]   corr12;
    fourBitCorrelatorLdpc corrNibble12(
        .clk(clk),
        .data(corrSR[51:48]),
        .pattern(syncword[51:48]),
        .correlation(corr12)
        );

    wire signed [3:0]   corr13;
    fourBitCorrelatorLdpc corrNibble13(
        .clk(clk),
        .data(corrSR[55:52]),
        .pattern(syncword[55:52]),
        .correlation(corr13)
        );

    wire signed [3:0]   corr14;
    fourBitCorrelatorLdpc corrNibble14(
        .clk(clk),
        .data(corrSR[59:56]),
        .pattern(syncword[59:56]),
        .correlation(corr14)
        );

    wire signed [3:0]   corr15;
    fourBitCorrelatorLdpc corrNibble15(
        .clk(clk),
        .data(corrSR[63:60]),
        .pattern(syncword[63:60]),
        .correlation(corr15)
        );

    wire signed [8:0]   bitSum = $signed({{5{corr0[3]}},corr0})
                               + $signed({{5{corr1[3]}},corr1})
                               + $signed({{5{corr2[3]}},corr2})
                               + $signed({{5{corr3[3]}},corr3})
                               + $signed({{5{corr4[3]}},corr4})
                               + $signed({{5{corr5[3]}},corr5})
                               + $signed({{5{corr6[3]}},corr6})
                               + $signed({{5{corr7[3]}},corr7})
                               + $signed({{5{corr8[3]}},corr8})
                               + $signed({{5{corr9[3]}},corr9})
                               + $signed({{5{corr10[3]}},corr10})
                               + $signed({{5{corr11[3]}},corr11})
                               + $signed({{5{corr12[3]}},corr12})
                               + $signed({{5{corr13[3]}},corr13})
                               + $signed({{5{corr14[3]}},corr14})
                               + $signed({{5{corr15[3]}},corr15});

    // Remember the last 192 bit sums to calculate the long syncword correlation
    integer i;
    reg signed  [8:0]   bitSumSR    [0:191];
    always @(posedge clk) begin
        if (clkEn) begin
            if (codeLength4096) begin
                bitSumSR[0] <= bitSum;
            end
            else begin
                bitSumSR[0] <= 0;
            end
            for (i = 1; i < 192; i = i + 1) begin
                bitSumSR[i] <= bitSumSR[i-1];
            end
        end
    end
    wire signed [10:0]  longBitSum = $signed({{2{bitSum[8]}},bitSum})
                                   - $signed({{2{bitSumSR[63][8]}},bitSumSR[63]})
                                   + $signed({{2{bitSumSR[127][8]}},bitSumSR[127]})
                                   + $signed({{2{bitSumSR[191][8]}},bitSumSR[191]});

    assign correlation = codeLength4096 ? $signed({longBitSum,7'b0})
                                        : $signed({bitSum,9'b0});

    // Sync Detector
    wire    signed  [10:0] syncBitSum;
    assign syncBitSum = codeLength4096 ? longBitSum
                                       : $signed({{2{bitSum[8]}},bitSum});
    reg syncDetected;
    reg negPolarity;
    wire signed [10:0]   negSyncThreshold = -syncThreshold;
    always @(posedge clk) begin
        if (clkEn) begin
            if (syncBitSum > syncThreshold) begin
                syncDetected <= 1;
                negPolarity <= 0;
            end
            else if (syncBitSum < negSyncThreshold) begin
                syncDetected <= 1;
                negPolarity <= 1;
            end
            else begin
                syncDetected <= 0;
            end
        end
    end

    // Framesync State Machine
    reg         [1:0]   syncState;
        `define OUT_OF_SYNC     2'b00
        `define SKIP_PAYLOAD    2'b01
        `define TEST_SYNC       2'b11
    assign          frameSyncState = syncState;
    reg     [7:0]   wordCount;
    reg     [5:0]   bitCount;
    wire            endOfPayload = ((bitCount == 0) && (wordCount == 0));
    reg     [2:0]   syncCount;
        `ifdef SIMULATE
        `define FRAMER_MAX_SYNC_COUNT 2
        `else
        `define FRAMER_MAX_SYNC_COUNT 5
        `endif
    assign sprtSyncCount = {1'b0,syncCount,14'b0};
    always @(posedge clk) begin
        if (reset || !ldpcRun) begin
            syncState <= `OUT_OF_SYNC;
            frameSync <= 0;
            codewordEn <= 0;
            bitCount <= `BITS_PER_WORD-1;
            wordCount <= wordsPerFrame + syncWords;
            rotation <= 0;
        end
        else if (clkEn) begin
            case (syncState)
                `OUT_OF_SYNC: begin
                    frameSync <= 0;
                    // Have we found a syncword?
                    if (syncDetected) begin
                        bitCount <= `BITS_PER_WORD-1;
                        wordCount <= wordsPerFrame-1;
                        rotation <= {negPolarity ^ rotation[1],rotation[0]};
                        syncCount <= 1;
                        syncState <= `SKIP_PAYLOAD;
                    end
                    // Do we need to try another rotation?
                    else if (endOfPayload) begin
                        bitCount <= `BITS_PER_WORD-1;
                        wordCount <= wordsPerFrame + syncWords;
                        rotation <= rotation + 1;
                    end
                    // Then keep looking
                    else if (bitCount == 0) begin
                        bitCount <= `BITS_PER_WORD-1;
                        wordCount <= wordCount - 1;
                    end
                    else begin
                        bitCount <= bitCount - 1;
                    end
                end
                `SKIP_PAYLOAD: begin
                    if (endOfPayload) begin
                        bitCount <= `BITS_PER_WORD-1;
                        wordCount <= syncWords-1;
                        codewordEn <= 0;
                        syncState <= `TEST_SYNC;
                    end
                    else if (bitCount == 0) begin
                        bitCount <= `BITS_PER_WORD-1;
                        if (wordCount == 0) begin
                            wordCount <= wordsPerFrame-1;
                        end
                        else begin
                            wordCount <= wordCount - 1;
                        end
                    end
                    else begin
                        bitCount <= bitCount - 1;
                    end
                end
                `TEST_SYNC: begin
                    if (bitCount == 0) begin
                        bitCount <= `BITS_PER_WORD-1;
                        if (wordCount == 0) begin
                            if (syncDetected && !negPolarity) begin
                                if (syncCount < `FRAMER_MAX_SYNC_COUNT) begin
                                    syncCount <= syncCount + 1;
                                    codewordEn <= frameSync;
                                end
                                else begin
                                    codewordEn <= ldpcReady;
                                    frameSync <= ldpcReady;
                                end
                                wordCount <= wordsPerFrame-1;
                                syncState <= `SKIP_PAYLOAD;
                            end
                            else if (syncCount == 0) begin
                                wordCount <= wordsPerFrame + syncWords;
                                rotation <= rotation + 1;
                                codewordEn <= 0;
                                frameSync <= 0;
                                syncState <= `OUT_OF_SYNC;
                            end
                            else begin
                                syncCount <= syncCount - 1;
                                wordCount <= wordsPerFrame-1;
                                codewordEn <= frameSync;
                                syncState <= `SKIP_PAYLOAD;
                            end
                        end
                        else begin
                            wordCount <= wordCount - 1;
                        end
                    end
                    else begin
                        bitCount <= bitCount - 1;
                    end
                end
                default: begin
                    syncState <= `OUT_OF_SYNC;
                    frameSync <= 0;
                    codewordEn <= 0;
                    syncCount <= 0;
                    rotation <= 0;
                    wordCount <= 0;
                    bitCount <= 0;
                end
            endcase
        end
    end

endmodule

module fourBitCorrelatorLdpc(       // renamed to avoid conflict with framerTop.v
    input                       clk,
    input               [3:0]   data,
    input               [3:0]   pattern,
    output signed       [3:0]   correlation
    );

    wire        [3:0]   corr = (~(data ^ pattern));
    reg signed  [3:0]   corr_reg;
    assign correlation = corr_reg;
    always @* begin
        case (corr)
            4'b0000:    corr_reg <= -4;
            4'b0001,
            4'b0010,
            4'b0100,
            4'b1000:    corr_reg <= -2;
            4'b0011,
            4'b0101,
            4'b1001,
            4'b0110,
            4'b1010,
            4'b1100:    corr_reg <= 0;
            4'b0111,
            4'b1011,
            4'b1101,
            4'b1110:    corr_reg <= 2;
            4'b1111:    corr_reg <= 4;
        endcase
    end

endmodule


