`include "addressMap.v"
`timescale 1ns/100ps


module test;
    parameter CLOCK_FREQ = 93.333333e6;
    parameter HC = 1e9/CLOCK_FREQ/2;
    parameter C = 2*HC;
    parameter CLOCK_DECIMATION = 1;
    parameter BITRATE_DECIMATION = 4;

    reg     reset;
    initial reset = 0;

    // Create the clocks
    reg     clk;
    initial clk = 1;
    reg     clken;
    always #HC clk = clk^clken;
    `define CLOCK_PERIOD   (C*1e-9)


    // Clock Enable
    reg     clkEnable;
    initial clkEnable = 0;
    integer clkCount;
    initial clkCount = 0;
    always @(posedge clk) begin
        if (clkCount == CLOCK_DECIMATION-1) begin
            clkCount <= 0;
            clkEnable <= 1;
        end
        else begin
            clkCount <= clkCount + 1;
            clkEnable <= 0;
        end
    end

    // Bitrate Enable
    reg     pnClkEn;
    reg     infoClkEn;
    integer bitCount;
    initial bitCount = 1;
    reg     everyOtherEn;
    initial everyOtherEn = 0;
    always @(posedge clk) begin
        if (clkEnable) begin
            if (bitCount == 0) begin
                bitCount <= BITRATE_DECIMATION - 1;
                pnClkEn <= 1;
                everyOtherEn <= ~everyOtherEn;
                if (everyOtherEn) begin
                    infoClkEn <= 1;
                end
            end
            else begin
                bitCount <= bitCount - 1;
                pnClkEn <= 0;
                infoClkEn <= 0;
            end
        end
        else begin
            pnClkEn <= 0;
            infoClkEn <= 0;
        end
    end

    // Random data
    parameter PN17 = 16'h00b8,
              MASK17 = 16'h0099;
    reg [15:0]sr;
    reg  randData;
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            sr <= MASK17;
        end
        else if (infoClkEn) begin
            sr <= {sr[14:0], ^(PN17 & sr)};
            randData <= sr[0];
        end
    end

    //----------------------------------- UUT ---------------------------------

    reg     [3:0]   pcmMode;
    pngenPcmEncoder pcm (
        .clk(clk),
        .reset(reset),
        .clkEn(clkEnable),
        .pnClkEn(pnClkEn),
        .infoClkEn(infoClkEn),
        .pcmMode(pcmMode),
        .pcmInvert(1'b0),
        .nrzBit(randData),
        .pcmBit(pcmBit)
    );

    millerDecoder md(
        .clk(clk),
        .reset(reset),
        .clkEn(clkEnable),
        .pcmEn(pnClkEn),
        .pcmMode(pcmMode),
        .pcmBit(pcmBit),
        .nrzEn(nrzEn),
        .nrzBit(nrzBit)
    );


    //-------------------------------- Bit Error Test -------------------------

    reg     [31:0]  infoBitSR;
    always @(posedge clk) begin
        if (clkEnable) begin
            if (infoClkEn) begin
                infoBitSR <= {infoBitSR[30:0],randData};
            end
        end
    end

    reg             bitError;
    always @* begin
        case (pcmMode)
            `PNGEN_PCM_MDMM,
            `PNGEN_PCM_MDMS:    bitError = nrzBit ^ infoBitSR[6];
            default:            bitError = nrzBit ^ infoBitSR[5];
        endcase
    end

    initial begin
        reset = 0;
        pcmMode = `PNGEN_PCM_MDMM;

        // Turn on the clock
        clken=1;
        #(10*C) ;

        #(16*C) ;
        reset = 1;
        #(2*C) ;
        reset = 0;

        repeat (2000) @ (posedge clk) ;

        $stop;

    end

endmodule

