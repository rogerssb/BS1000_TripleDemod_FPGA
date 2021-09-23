`timescale 1ns / 10 ps
`include "addressMap.v"

module framerTop(
    input               reset,
    input               busClk,
    input               cs,
    input               wr0, wr1, wr2, wr3,
    input       [12:0]  addr,
    input       [31:0]  din,
    output      [31:0]  dout,
    input               clk,
    input               clkEn,
    input               dataBitIn,
    output reg  [1:0]   rotation,
    output      [3:0]   inputSourceSelect,
    output              framedBitOut,
    output reg          framesync,
    output              framesyncPulse
);

    reg         [1:0]   syncState;
        `define OUT_OF_SYNC     2'b00
        `define SKIP_PAYLOAD    2'b01
        `define TEST_SYNC       2'b11
    reg                 invertData;
    wire        [4:0]   bitsPerWord;
    wire        [15:0]  wordsPerFrame;
    wire        [31:0]  syncwordMask;
    wire        [31:0]  syncword;
    wire signed [6:0]   syncThreshold;
    framerRegs framerRegs(
        .busClk(busClk),
        .cs(cs),
        .wr0(wr0), .wr1(wr1), .wr2(wr2), .wr3(wr3),
        .addr(addr),
        .din(din),
        .dout(dout),
        .framesync(framesync),
        .syncState(syncState),
        .invertData(invertData),
        .bitsPerWord(bitsPerWord),
        .wordsPerFrame(wordsPerFrame),
        .syncwordMask(syncwordMask),
        .syncword(syncword),
        .syncThreshold(syncThreshold),
        .inputSourceSelect(inputSourceSelect)
    );

    // Calculate syncwordBits from syncwordMask
    reg     [4:0]   syncwordBits;
    always @* begin
        casex (syncwordMask)
            32'b1xxxxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx: syncwordBits = 31;
            32'b01xxxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx: syncwordBits = 30;
            32'b001xxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx: syncwordBits = 29;
            32'b0001xxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx: syncwordBits = 28;
            32'b00001xxx_xxxxxxxx_xxxxxxxx_xxxxxxxx: syncwordBits = 27;
            32'b000001xx_xxxxxxxx_xxxxxxxx_xxxxxxxx: syncwordBits = 26;
            32'b0000001x_xxxxxxxx_xxxxxxxx_xxxxxxxx: syncwordBits = 25;
            32'b00000001_xxxxxxxx_xxxxxxxx_xxxxxxxx: syncwordBits = 24;
            32'b00000000_1xxxxxxx_xxxxxxxx_xxxxxxxx: syncwordBits = 23;
            32'b00000000_01xxxxxx_xxxxxxxx_xxxxxxxx: syncwordBits = 22;
            32'b00000000_001xxxxx_xxxxxxxx_xxxxxxxx: syncwordBits = 21;
            32'b00000000_0001xxxx_xxxxxxxx_xxxxxxxx: syncwordBits = 20;
            32'b00000000_00001xxx_xxxxxxxx_xxxxxxxx: syncwordBits = 19;
            32'b00000000_000001xx_xxxxxxxx_xxxxxxxx: syncwordBits = 18;
            32'b00000000_0000001x_xxxxxxxx_xxxxxxxx: syncwordBits = 17;
            32'b00000000_00000001_xxxxxxxx_xxxxxxxx: syncwordBits = 16;
            32'b00000000_00000000_1xxxxxxx_xxxxxxxx: syncwordBits = 15;
            32'b00000000_00000000_01xxxxxx_xxxxxxxx: syncwordBits = 14;
            32'b00000000_00000000_001xxxxx_xxxxxxxx: syncwordBits = 13;
            32'b00000000_00000000_0001xxxx_xxxxxxxx: syncwordBits = 12;
            32'b00000000_00000000_00001xxx_xxxxxxxx: syncwordBits = 11;
            32'b00000000_00000000_000001xx_xxxxxxxx: syncwordBits = 10;
            32'b00000000_00000000_0000001x_xxxxxxxx: syncwordBits =  9;
            32'b00000000_00000000_00000001_xxxxxxxx: syncwordBits =  8;
            32'b00000000_00000000_00000000_1xxxxxxx: syncwordBits =  7;
            32'b00000000_00000000_00000000_01xxxxxx: syncwordBits =  6;
            32'b00000000_00000000_00000000_001xxxxx: syncwordBits =  5;
            32'b00000000_00000000_00000000_0001xxxx: syncwordBits =  4;
            32'b00000000_00000000_00000000_00001xxx: syncwordBits =  3;
            32'b00000000_00000000_00000000_000001xx: syncwordBits =  2;
            32'b00000000_00000000_00000000_0000001x: syncwordBits =  1;
            32'b00000000_00000000_00000000_00000001: syncwordBits =  0;
            default:                                     syncwordBits =  0;
        endcase       
    end               

    // Polarity inversion
    reg     polarityCorrectedData;
    always @(posedge clk) begin
        if (clkEn) begin
            if (invertData) begin
                polarityCorrectedData <= ~dataBitIn;
            end
            else begin
                polarityCorrectedData <= dataBitIn;
            end
        end
    end

    // Shift register used in correlator
    reg [31:0]corrSR;
    always @(posedge clk) begin
        if (clkEn) begin
            corrSR <= {corrSR[30:0],polarityCorrectedData};
        end
    end

    wire signed [3:0]   corr0;
    fourBitCorrelator corrNibble0(
        .clk(clk),
        .data(corrSR[3:0]),
        .pattern(syncword[3:0]),
        .mask(syncwordMask[3:0]),
        .correlation(corr0)
        );

    wire signed [3:0]   corr1;
    fourBitCorrelator corrNibble1(
        .clk(clk),
        .data(corrSR[7:4]),
        .pattern(syncword[7:4]),
        .mask(syncwordMask[7:4]),
        .correlation(corr1)
        );

    wire signed [3:0]   corr2;
    fourBitCorrelator corrNibble2(
        .clk(clk),
        .data(corrSR[11:8]),
        .pattern(syncword[11:8]),
        .mask(syncwordMask[11:8]),
        .correlation(corr2)
        );

    wire signed [3:0]   corr3;
    fourBitCorrelator corrNibble3(
        .clk(clk),
        .data(corrSR[15:12]),
        .pattern(syncword[15:12]),
        .mask(syncwordMask[15:12]),
        .correlation(corr3)
        );

    wire signed [3:0]   corr4;
    fourBitCorrelator corrNibble4(
        .clk(clk),
        .data(corrSR[19:16]),
        .pattern(syncword[19:16]),
        .mask(syncwordMask[19:16]),
        .correlation(corr4)
        );

    wire signed [3:0]   corr5;
    fourBitCorrelator corrNibble5(
        .clk(clk),
        .data(corrSR[23:20]),
        .pattern(syncword[23:20]),
        .mask(syncwordMask[23:20]),
        .correlation(corr5)
        );

    wire signed [3:0]   corr6;
    fourBitCorrelator corrNibble6(
        .clk(clk),
        .data(corrSR[27:24]),
        .pattern(syncword[27:24]),
        .mask(syncwordMask[27:24]),
        .correlation(corr6)
        );

    wire signed [3:0]   corr7;
    fourBitCorrelator corrNibble7(
        .clk(clk),
        .data(corrSR[31:28]),
        .pattern(syncword[31:28]),
        .mask(syncwordMask[31:28]),
        .correlation(corr7)
        );


    wire signed [6:0]   bitSum = $signed({{3{corr0[3]}},corr0})
                               + $signed({{3{corr1[3]}},corr1})
                               + $signed({{3{corr2[3]}},corr2})
                               + $signed({{3{corr3[3]}},corr3})
                               + $signed({{3{corr4[3]}},corr4})
                               + $signed({{3{corr5[3]}},corr5})
                               + $signed({{3{corr6[3]}},corr6})
                               + $signed({{3{corr7[3]}},corr7});

    `ifdef SIMULATE
    real    correlation;
    always @* correlation = $itor(bitSum);
    `endif

    // Sync Detector
    reg syncDetected;
    reg negPolarity;
    wire signed [6:0]   negSyncThreshold = -syncThreshold;
    always @(posedge clk) begin
        if (clkEn) begin
            if (bitSum > syncThreshold) begin
                syncDetected <= 1;
                negPolarity <= 0;
            end
            else if (bitSum < negSyncThreshold) begin
                syncDetected <= 1;
                negPolarity <= 1;
            end
            else begin
                syncDetected <= 0;
            end
        end
    end

    // Framesync State Machine
    reg     [15:0]  wordCount;
    reg     [4:0]   bitCount;
    wire            endOfPayload = ((bitCount == 0) && (wordCount == 0));
    integer         syncCount;
        `define FRAMER_MAX_SYNC_COUNT 5
    always @(posedge clk) begin
        if (reset) begin
            syncState <= `OUT_OF_SYNC;
            invertData <= 0;
            rotation <= 0;
        end
        else if (clkEn) begin
            case (syncState)
                `OUT_OF_SYNC: begin
                    framesync <= 0;
                    // Have we found a syncword?
                    if (syncDetected) begin
                        bitCount <= bitsPerWord;
                        wordCount <= wordsPerFrame;
                        syncCount <= 0;
                        syncState <= `SKIP_PAYLOAD;
                        invertData <= negPolarity;
                    end
                    // Do we need to try another rotation?
                    else if (endOfPayload) begin
                        bitCount <= syncwordBits;
                        wordCount <= wordsPerFrame;
                        rotation <= rotation + 1;
                    end
                    // Then keep looking
                    else if (bitCount == 0) begin
                        bitCount <= bitsPerWord;
                        if (wordCount == 0) begin
                            wordCount <= wordsPerFrame;
                        end
                        else begin
                            wordCount <= wordCount - 1;
                        end
                    end
                    else begin
                        bitCount <= bitCount - 1;
                    end
                end
                `SKIP_PAYLOAD: begin
                    if (endOfPayload) begin
                        bitCount <= syncwordBits;
                        syncState <= `TEST_SYNC;
                    end
                    else if (bitCount == 0) begin
                        bitCount <= bitsPerWord;
                        if (wordCount == 0) begin
                            wordCount <= wordsPerFrame;
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
                        if (syncDetected && !negPolarity) begin
                            if (syncCount < `FRAMER_MAX_SYNC_COUNT) begin
                                syncCount <= syncCount + 1;
                            end
                            else begin
                                framesync <= 1;
                            end
                            bitCount <= bitsPerWord;
                            wordCount <= wordsPerFrame;
                            syncState <= `SKIP_PAYLOAD;
                        end
                        else if (syncCount == 0) begin
                            rotation <= rotation + 1;
                            invertData <= 0;
                            syncState <= `OUT_OF_SYNC;
                        end
                        else begin
                            syncCount <= syncCount - 1;
                            bitCount <= bitsPerWord;
                            wordCount <= wordsPerFrame;
                            syncState <= `SKIP_PAYLOAD;
                        end
                    end
                    else begin
                        bitCount <= bitCount - 1;
                    end
                end
                default: begin
                    syncState <= `OUT_OF_SYNC;
                    syncCount <= 0;
                    invertData <= 0;
                    rotation <= 0;
                    wordCount <= 0;
                    bitCount <= 0;
                end
            endcase
        end
    end

    assign framesyncPulse = (syncDetected & framesync);
    assign framedBitOut = corrSR[1];

endmodule

module fourBitCorrelator(
    input                       clk,
    input               [3:0]   data,
    input               [3:0]   pattern,
    input               [3:0]   mask,
    output signed       [3:0]   correlation
    );

    wire        [3:0]   corr = (~(data ^ pattern)) & mask;
    reg signed  [3:0]   corr_reg;
    assign correlation = corr_reg;
    always @* begin
        casex (mask)
            4'b1xxx:
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
            4'b01xx:
                casex (corr)
                    4'bx000:    corr_reg <= -3;
                    4'bx001,
                    4'bx010,
                    4'bx100:    corr_reg <= -1;
                    4'bx011,
                    4'bx101,
                    4'bx110:    corr_reg <= 1;
                    4'bx111:    corr_reg <= 3;
                endcase
            4'b001x:
                casex (corr)
                    4'bxx00:    corr_reg <= -2;
                    4'bxx01,
                    4'bxx10:    corr_reg <= 0;
                    4'bxx11:    corr_reg <= 2;
                endcase
            4'b0001:
                casex (corr)
                    4'bxxx0:    corr_reg <= -1;
                    4'bxxx1:    corr_reg <= 1;
                endcase
            default:            corr_reg <= 0;
        endcase
    end

endmodule


