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
    output              pnBit
);


    wire        [23:0]  pnPolyTaps;
    wire        [4:0]   pnPolyLength;
    wire        [31:0]  pnClockRate;
    pngenRegs pngenRegs(
        .busClk(busClk),
        .wr0(wr0), .wr1(wr1), .wr2(wr2), .wr3(wr3),
        .addr(addr),
        .din(din),
        .dout(dout),
        .pnPolyTaps(pnPolyTaps),
        .pnPolyLength(pnPolyLength),
        .pnPolyMode(pnPolyMode),
        .pnClockRate(pnClockRate)
    );


    // Phase Accumulator
    reg     [31:0]  phase;
    wire    [32:0]  phaseSum = {1'b0,phase} + {1'b0,pnClockRate};
    always @(posedge clk) begin
        if (reset) begin
            phase <= 0;
            pnClkEn <= 0;
        end
        else if (clkEn) begin
            phase <= phaseSum[31:0];
            if (phaseSum[32]) begin
                pnClkEn <= 1;
            end
            else begin
                pnClkEn <= 0;
            end
        end
        else begin
            pnClkEn <= 0;
        end
    end



    // PN Generator
    `include "bert/bert_functions.v"
    wire [23:0] poly = pnPolyMode ? mirror_taps (pnPolyTaps, pnPolyLength) : pnPolyTaps;
    bert_lfsr pn_lfsr (
        .poly(poly),
        .poly_length(pnPolyLength),
        .reset(reset),
        .clock(clk),
        .enable(pnClkEn),
        .reload(1'b0),
        .load_data(24'b0),
        .data(),
        .serial(pnBit)
    );




endmodule
