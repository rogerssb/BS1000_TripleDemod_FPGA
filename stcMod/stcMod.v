`timescale 1ns / 10 ps
`include "addressMap.v"

module stcMod(
    input                       clk, clkEn, reset,
    input                       busClk,
    input                       cs,
    input                       wr0, wr1, wr2, wr3,
    input               [12:0]  addr,
    input               [31:0]  din,
    output              [31:0]  dout,
    input                       modData0,
    input                       modData1,
    input                       modDataValid,
    input                       txEnable,
    output  reg                 posEdgeModClkEn,
    output      signed  [17:0]  modWaveform0,
    output      signed  [17:0]  modWaveform1,
    output      signed  [31:0]  fmModFreq0,
    output      signed  [31:0]  fmModFreq1
);

    // Register interface
    reg fmModSpace;
    always @* begin
        casex(addr)
            `FMMODSPACE: fmModSpace = cs;
            default:     fmModSpace = 0;
        endcase
    end

    wire  signed    [31:0]  carrierFreq;
    wire            [17:0]  devMantissa;
    wire            [3:0]   devExponent;
    wire            [15:0]  modSampleDiv;
    wire            [4:0]   cicShift;

    fmModRegs regs  (
        .busClk(busClk),
        .cs(fmModSpace),
        .addr(addr),
        .dataIn(din),
        .dataOut(dout),
        .wr0(wr0), .wr1(wr1), .wr2(wr2), .wr3(wr3),
        .carrierFreq(carrierFreq),
        .devMantissa(devMantissa),
        .devExponent(devExponent),
        .bitrateDiv(modSampleDiv),
        .modClkSel(modClkSel),
        .cicShift(cicShift)
    );

    // Generate internal bitrate clock
    reg             modSampleEn;
    reg     [15:0]  modSampleCount;
    reg     [2:0]   bitrateCount;
    always @(posedge clk) begin
        if (reset) begin
            modSampleCount <= modSampleDiv;
            bitrateCount <= 0;
            modSampleEn <= 0;
        end
        else if (clkEn) begin
            if (modSampleDiv == 0) begin
                posEdgeModClkEn <= (bitrateCount == 0);
            end
            else begin
                posEdgeModClkEn <= (modSampleCount == 1) && (bitrateCount == 0);
            end
            if (modSampleCount == 0) begin
                modSampleCount <= modSampleDiv;
                modSampleEn <= txEnable;
                // This is for two modSamples per bit (two modSamples per ternary symbol)
                if (bitrateCount == 0) begin
                    bitrateCount <= 1;
                end
                else begin
                    bitrateCount <= bitrateCount - 1;
                end
            end
            else begin
                modSampleEn <= 0;
                modSampleCount <= modSampleCount - 1;
            end
        end
    end

    // The SOQPSK deviation generator
    wire    signed  [17:0]  stcDev0;
    wire    signed  [17:0]  stcDev1;
    dualSoqpskMod dualMod(
        .clk(clk),
        .clkEn(clkEn),
        .reset(reset),
        .modSampleEn(modSampleEn),
        .posEdgeModClkEn(posEdgeModClkEn),
        .modData0(modData0),
        .modData1(modData1),
        .modDataValid(modDataValid),
        .deviationClkEn(stcDevClkEn),
        .deviation0(stcDev0),
        .deviation1(stcDev1)
    );

    reg     [17:0]  cicIn0;
    reg     [17:0]  cicIn1;
    reg             cicClkEn;
    always @(posedge clk) begin
        if (clkEn) begin
            cicIn0 <= stcDev0;
            cicIn1 <= stcDev1;
            cicClkEn <= stcDevClkEn;
        end
    end

    `ifdef SIMULATE
    real devReal;
    wire    [17:0]  deviation = cicIn0;
    always @(deviation)begin
        devReal = $itor(deviation)/(2**17);
    end
    `endif

    // CIC Interpolation Filter
    `ifdef SIMULATE
    reg             cicReset;
    initial         cicReset = 0;
    `endif
    wire    signed  [33:0]  cicOut0;
    fmModInterpolate cic0(
        .clk(clk),
        `ifdef SIMULATE
        .reset(!modDataValid | cicReset),
        `else
        .reset(!modDataValid),
        `endif
        .clkEn(clkEn),
        .inputClkEn(cicClkEn),
        .dIn(cicIn0),
        .dOut(cicOut0)
    );
    wire    signed  [33:0]  cicOut1;
    fmModInterpolate cic1(
        .clk(clk),
        `ifdef SIMULATE
        .reset(!modDataValid | cicReset),
        `else
        .reset(!modDataValid),
        `endif
        .clkEn(clkEn),
        .inputClkEn(cicClkEn),
        .dIn(cicIn1),
        .dOut(cicOut1)
    );

    wire    signed  [17:0]  interpOut0;
    shift34to18 cicGainAdjust0(
        .clk(clk),
        .clkEn(clkEn),
        .shift(cicShift),
        .dIn(cicOut0),
        .dOut(interpOut0)
    );
    wire    signed  [17:0]  interpOut1;
    shift34to18 cicGainAdjust1(
        .clk(clk),
        .clkEn(clkEn),
        .shift(cicShift),
        .dIn(cicOut1),
        .dOut(interpOut1)
    );


    `ifdef SIMULATE
    real interpReal;
    wire    signed  [17:0]  devInput = interpOut0;
    always @(devInput)begin
        interpReal = $itor(devInput)/(2**17);
    end
    `endif

    wire    signed  [35:0] scaledOut0;
    mpy18x18 scaler0 (
        .sclr(1'b0),
        .clk(clk),
        .a(interpOut0),
        .b(devMantissa),
        .p(scaledOut0)
    );
    wire    signed  [35:0] scaledOut1;
    mpy18x18 scaler1 (
        .sclr(1'b0),
        .clk(clk),
        .a(interpOut1),
        .b(devMantissa),
        .p(scaledOut1)
    );

    `define USE_SHIFTER
    `ifdef USE_SHIFTER
    wire    signed  [31:0]  modFreq0;
    shift32to32 devShifter0(
        .clk(clk),
        .clkEn(clkEn),
        .shift(devExponent),
        .dIn(scaledOut0[34:3]),
        .dOut(modFreq0)
    );
    wire    signed  [31:0]  modFreq1;
    shift32to32 devShifter1(
        .clk(clk),
        .clkEn(clkEn),
        .shift(devExponent),
        .dIn(scaledOut1[34:3]),
        .dOut(modFreq1)
    );
    `else
    wire    signed  [31:0]  modFreq0 = $signed(scaledOut0[34:3]);
    wire    signed  [31:0]  modFreq1 = $signed(scaledOut1[34:3]);
    `endif

    `ifdef SIMULATE
    real modFreq0Real;
    real carrierFreqReal;
    always @* begin
        modFreq0Real = $itor($signed(modFreq0))/(2.0**31);
        carrierFreqReal = $itor(carrierFreq)/(2.0**31);
    end
    `endif

    assign fmModFreq0 = modFreq0 + carrierFreq;
    assign modWaveform0 = interpOut0;
    assign fmModFreq1 = modFreq1 + carrierFreq;
    assign modWaveform1 = interpOut1;

endmodule
