`include "stcDefines.vh"
`timescale 1ns/100ps

`define USE_WIDE_OUTPUT

/*
*******************************************************************************
trellisDetector
*******************************************************************************
    Inputs:
        clk - system clock.
        reset - synchronous clear
        inputEn - clock enable used for all inputs
        startFrame - indicates the start of a new frame. This is used to indicate
            a new set of input samples and parameter estimates are available for
            processing. Need valid Estimates and 128 clocks before the first sampleEn.
        in0Real,in0Imag - complex valued inputs from the Detection Filter that
            have been resampled to align with the tau0 estimate. Encoded as a signed 18
            bit, Q17 fractional number pair. The boundary between blocks of 3204
            samples is identified by the startFrame input.
        in1Real,in1Imag - complex valued inputs from the Detection Filter that
            have been resampled to align with the tau1 estimate. Encoded as a signed 18
            bit, Q17 fractional number pair. The boundary between blocks of 3204
            samples is identified by the startFrame input.
        deltaTauEst - the difference in time between the tau0 and tau1 estimates
            normalized to a bit interval. It is provided as a signed, 6-bit Q1.5 fractional
            number representing the range -1.0 <= tau <= 31/32 of a bit interval.
            There is a new estimate available with each startFrame.
        h0EstReal,h0EstIMag - complex valued input representing the estimate of
            the channel 0 gain. Encoded as a signed 18 bit, Q17 fractional number pair.
            There is a new estimate available with each startFrame.
        h1EstReal,h1EstIMag - complex valued input representing the estimate of
            the channel 1 gain. Encoded as a signed 18 bit, Q17 fractional number pair.
            There is a new estimate available with each startFrame.
    Outputs:
        outputEn - clock enable to indicated 4 new output bits are available
        outputBits - 4 detected bits aligned with outputEn.

    Notes:
        1) There are 26*128 = 3328 bits in a frame. Since processing in other parts of the
            system require 4 samples per bit, the minimum system clocks per frame is 13312.
        2) The trellis setup requires (16+32+64+128)=240 processing iterations per frame.
            Once the first 16 are completed, the first and second stages of the trellis
            processing may begin and operate in parallel with the remainder of the setup
            stages. Similarly with the 32/64/128 setup stages.
        3) There are (25*128)/4 + 1 = 801 codeword iterations required per frame. Each
            codeword iteration requires 128 processing iterations in the most complex
            stage or 801*128=102528 ACS iterations per frame. Therefore, you have
            to parallel 102528/13312 = 7.7 iterations per system clock or create a faster
            system clock. This basically means creating 8 ACS units each of which can do
            16 ACS iterations at a rate of 1 iteration per system clock.
        4) At 40 Mbps, the system clock is at least 160 MHz so its not likely the clock can
            be increase much beyond twice that frequency.

    History
*/
module trellisDetector (
    input                   clk, clkEn,
    input                   reset,
    input                   sampleEn,
    input                   startFrame,
    input   signed  [17:0]  in0Real, in0Imag, in1Real, in1Imag,
    input   signed  [5:0]   deltaTauEst,
    input   signed  [17:0]  h0EstReal, h0EstImag, h1EstReal, h1EstImag,
    `ifdef USE_WIDE_OUTPUT
    output  reg             finalMetricOutputEn,
    `else
    output                  finalMetricOutputEn,
    `endif
    output  reg     [17:0]  finalMetric,
    output  reg             outputEn,
    output  reg     [3:0]   outputBits
);


    //-------------------------- Process State Machine ------------------------

    reg             [1:0]   detectorState;
    parameter   TrellisIdle =           2'b00,
                TrellisSetup =          2'b01,
                TrellisDetectInit =     2'b11,
                TrellisDetectBits =     2'b10;
    reg                     positiveTau;
    wire                    setupComplete;
    always @(posedge clk) begin
        if (reset) begin
            positiveTau <= 1;
        end
        else begin
            case (detectorState)
                TrellisIdle: begin
                    if (clkEn & startFrame) begin
                        detectorState <= TrellisSetup;
                        positiveTau <= !deltaTauEst[5];
                    end
                end
                TrellisSetup: begin
                    if (setupComplete) begin
                        detectorState <= TrellisDetectInit;
                    end
                end
                `ifdef JUNK
                TrellisDetectInit: begin
                    if (bitsAvailable) begin
                        detectorState <= TrellisDetectBits;
                        codewordCount <= `CODEWORDS_PER_FRAME-1;
                    end
                end
                TrellisDetectBits: begin
                    if (bitsAvailable) begin
                        if (codewordCount == 0) begin
                            detectorState <= TrellisIdle;
                        end
                        else begin
                            codewordCount <= codewordCount - 1;
                        end
                    end
                end
                `endif
                default: begin
                    detectorState <= TrellisIdle;
                end
            endcase
        end
    end

    wire            [4:0]   absTauIndex = (positiveTau ? deltaTauEst : -deltaTauEst);


    //-------------------------- Input Data Buffer ----------------------------

    reg     signed  [17:0]  s0_0_real,s0_0_imag;
    reg     signed  [17:0]  s0_1_real,s0_1_imag;
    reg     signed  [17:0]  s0_2_real,s0_2_imag;
    reg     signed  [17:0]  s0_3_real,s0_3_imag;
    reg     signed  [17:0]  s0_4_real,s0_4_imag;
    reg     signed  [17:0]  s1_0_real,s1_0_imag;
    reg     signed  [17:0]  s1_1_real,s1_1_imag;
    reg     signed  [17:0]  s1_2_real,s1_2_imag;
    reg     signed  [17:0]  s1_3_real,s1_3_imag;
    reg     signed  [17:0]  s1_4_real,s1_4_imag;
    reg             [1:0]   sampleCount;
    reg                     startBlock,startBlockEarly;
    always @(posedge clk) begin
        if (startFrame) begin
            sampleCount <= 2'd3;
        end
        else if (clkEn & sampleEn) begin
            if (positiveTau) begin
                s1_3_real <= in0Real;
                s1_2_real <= s1_3_real;
                s1_1_real <= s1_2_real;
                s1_0_real <= s1_1_real;
                s1_3_imag <= in0Imag;
                s1_2_imag <= s1_3_imag;
                s1_1_imag <= s1_2_imag;
                s1_0_imag <= s1_1_imag;
                s0_4_real <= in1Real;
                s0_3_real <= s0_4_real;
                s0_2_real <= s0_3_real;
                s0_1_real <= s0_2_real;
                s0_0_real <= s0_1_real;
                s0_4_imag <= in1Imag;
                s0_3_imag <= s0_4_imag;
                s0_2_imag <= s0_3_imag;
                s0_1_imag <= s0_2_imag;
                s0_0_imag <= s0_1_imag;
            end
            else begin
                s0_4_real <= in0Real;
                s0_3_real <= s0_4_real;
                s0_2_real <= s0_3_real;
                s0_1_real <= s0_2_real;
                s0_0_real <= s0_1_real;
                s0_4_imag <= in0Imag;
                s0_3_imag <= s0_4_imag;
                s0_2_imag <= s0_3_imag;
                s0_1_imag <= s0_2_imag;
                s0_0_imag <= s0_1_imag;
                s1_3_real <= in1Real;
                s1_2_real <= s1_3_real;
                s1_1_real <= s1_2_real;
                s1_0_real <= s1_1_real;
                s1_3_imag <= in1Imag;
                s1_2_imag <= s1_3_imag;
                s1_1_imag <= s1_2_imag;
                s1_0_imag <= s1_1_imag;
            end
            sampleCount <= sampleCount - 1;
            startBlockEarly <= (sampleCount == 0);
            startBlock <= startBlockEarly;
        end
    end

    //-------------------------------------------------------------------------
    // Samples used in the acs stages. This is only for debug
    reg     signed  [17:0]  s00r,s00i,s10r,s10i;
    reg     signed  [17:0]  s01r,s01i,s11r,s11i;
    reg     signed  [17:0]  s02r,s02i,s12r,s12i;
    reg     signed  [17:0]  s03r,s03i,s13r,s13i;
    always @(posedge clk) begin
        if (clkEn && sampleEn && startBlock) begin
            s00r <= s0_0_real;      s00i <= s0_0_imag;
            s01r <= s0_1_real;      s01i <= s0_1_imag;
            s02r <= s0_2_real;      s02i <= s0_2_imag;
            s03r <= s0_3_real;      s03i <= s0_3_imag;
            s10r <= s1_0_real;      s10i <= s1_0_imag;
            s11r <= s1_1_real;      s11i <= s1_1_imag;
            s12r <= s1_2_real;      s12i <= s1_2_imag;
            s13r <= s1_3_real;      s13i <= s1_3_imag;
        end
    end

    //-------------------------- Stage 0 --------------------------------------

    wire    signed  [17:0]  setup0Real,setup0Imag;
    stageSetup #(.STAGE(0)) stageSetup0(
        .clk(clk),
        .reset(reset),
        .clkEn(clkEn),
        .start(startFrame),
        .positiveTau(positiveTau),
        .tauIndex(absTauIndex),
        .h0EstReal(h0EstReal), .h0EstImag(h0EstImag),
        .h1EstReal(h1EstReal), .h1EstImag(h1EstImag),
        .stageSetupComplete(stage0SetupComplete),
        .stageOutputValid(stage0OutputValid),
        .refReal(setup0Real), .refImag(setup0Imag)
    );
    `ifdef USE_WIDE_OUTPUT
    wire            [17:0]  startMetric = 18'h0;
    `else
    reg             [17:0]  startMetric;
    `endif
    wire            [17:0]  accMetric0;
    acsStage0 stage0(
        .clk(clk),.clkEn(clkEn), .reset(reset),
        .startFrame(startFrame),
        .startBlock(startBlock & sampleEn),
        .in0Real(s0_0_real),.in0Imag(s0_0_imag),
        .accMetricIn(startMetric),
        .stageSetupComplete(stage0SetupComplete),
        .setupOutputValid(stage0OutputValid),
        .setupReal(setup0Real),.setupImag(setup0Imag),
        .metricRequest(stage0MetricRequest),
        .metricOutEn(metric0OutputEn),
        .accMetricOut(accMetric0),
        .startNextStage(startStage1)
    );


    //--------------------------- Stage 1 -------------------------------------

    wire    signed  [17:0]  setup1Real,setup1Imag;
    stageSetup #(.STAGE(1)) stageSetup1(
        .clk(clk),
        .reset(reset),
        .clkEn(clkEn),
        .start(startFrame),
        .positiveTau(positiveTau),
        .tauIndex(absTauIndex),
        .h0EstReal(h0EstReal), .h0EstImag(h0EstImag),
        .h1EstReal(h1EstReal), .h1EstImag(h1EstImag),
        .stageSetupComplete(stage1SetupComplete),
        .stageOutputValid(stage1OutputValid),
        .refReal(setup1Real), .refImag(setup1Imag)
    );

    wire            [17:0]  accMetric1;
    acsStage1 stage1(
        .clk(clk),.clkEn(clkEn), .reset(reset),
        .startFrame(startFrame),
        .startBlock(startBlock & sampleEn),
        .startStage(startStage1),
        .in1Real(s1_0_real),.in1Imag(s1_0_imag),
        .accMetricInEn(metric0OutputEn),
        .accMetricIn(accMetric0),
        .stageSetupComplete(stage1SetupComplete),
        .setupOutputValid(stage1OutputValid),
        .setupReal(setup1Real),.setupImag(setup1Imag),
        .metricOutEn(metric1OutputEn),
        .accMetricOut(accMetric1),
        .startNextStage(startStage2)
    );

    //----------------------------- Stage 2 -----------------------------------

    wire    signed  [17:0]  setup2Real,setup2Imag;
    stageSetup #(.STAGE(2)) stageSetup2(
        .clk(clk),
        .reset(reset),
        .clkEn(clkEn),
        .start(startFrame),
        .positiveTau(positiveTau),
        .tauIndex(absTauIndex),
        .h0EstReal(h0EstReal), .h0EstImag(h0EstImag),
        .h1EstReal(h1EstReal), .h1EstImag(h1EstImag),
        .stageSetupComplete(stage2SetupComplete),
        .stageOutputValid(stage2OutputValid),
        .refReal(setup2Real), .refImag(setup2Imag)
    );

    wire            [17:0]  accMetric2Even;
    wire            [17:0]  accMetric2Odd;
    acsStage2 stage2(
        .clk(clk),.clkEn(clkEn), .reset(reset),
        .startFrame(startFrame),
        .startBlock(startBlock & sampleEn),
        .startStage(startStage2),
        .in0Real(s0_1_real),.in0Imag(s0_1_imag),
        .accMetricInEn(metric1OutputEn),
        .accMetricIn(accMetric1),
        .setupComplete(stage2SetupComplete),
        .setupOutputValid(stage2OutputValid),
        .setupReal(setup2Real),.setupImag(setup2Imag),
        .metricOutEn(metric2OutputEn),
        .accMetricEvenOut(accMetric2Even),
        .accMetricOddOut(accMetric2Odd),
        .startNextStage(startStage3)
    );

    //----------------------------- Stage 3 -----------------------------------

    wire    signed  [17:0]  setup3Real,setup3Imag;
    stageSetup #(.STAGE(3)) stageSetup3(
        .clk(clk),
        .reset(reset),
        .clkEn(clkEn),
        .start(startFrame),
        .positiveTau(positiveTau),
        .tauIndex(absTauIndex),
        .h0EstReal(h0EstReal), .h0EstImag(h0EstImag),
        .h1EstReal(h1EstReal), .h1EstImag(h1EstImag),
        .stageSetupComplete(stage3SetupComplete),
        .stageOutputValid(stage3OutputValid),
        .refReal(setup3Real), .refImag(setup3Imag)
    );

    wire            [17:0]  accMetric3_00;
    wire            [17:0]  accMetric3_01;
    wire            [17:0]  accMetric3_10;
    wire            [17:0]  accMetric3_11;
    acsStage3 stage3(
        .clk(clk),.clkEn(clkEn), .reset(reset),
        .startFrame(startFrame),
        .startBlock(startBlock & sampleEn),
        .startStage(startStage3),
        .in1Real(s1_1_real),.in1Imag(s1_1_imag),
        .accMetricInEn(metric2OutputEn),
        .accMetricInEven(accMetric2Even),
        .accMetricInOdd(accMetric2Odd),
        .setupComplete(stage3SetupComplete),
        .setupOutputValid(stage3OutputValid),
        .setupReal(setup3Real),.setupImag(setup3Imag),
        .metricOutEn(metric3OutputEn),
        .accMetricOut_00(accMetric3_00),
        .accMetricOut_01(accMetric3_01),
        .accMetricOut_10(accMetric3_10),
        .accMetricOut_11(accMetric3_11),
        .startNextStage(startStage4)
    );


    //----------------------------- Stage 4 -----------------------------------

    wire    signed  [17:0]  setup4Real,setup4Imag;
    stageSetup #(.STAGE(4)) stageSetup4(
        .clk(clk),
        .reset(reset),
        .clkEn(clkEn),
        .start(startFrame),
        .positiveTau(positiveTau),
        .tauIndex(absTauIndex),
        .h0EstReal(h0EstReal), .h0EstImag(h0EstImag),
        .h1EstReal(h1EstReal), .h1EstImag(h1EstImag),
        .stageSetupComplete(stage4SetupComplete),
        .stageOutputValid(stage4OutputValid),
        .refReal(setup4Real), .refImag(setup4Imag)
    );

    `ifdef USE_WIDE_OUTPUT
    wire            [17:0]  startMetric_00;
    wire            [17:0]  startMetric_01;
    wire            [17:0]  startMetric_10;
    wire            [17:0]  startMetric_11;
    wire            [18:0]  sumMetric_00 = {1'b0,accMetric3_00} + {1'b0,startMetric_00};
    wire            [18:0]  sumMetric_01 = {1'b0,accMetric3_01} + {1'b0,startMetric_01};
    wire            [18:0]  sumMetric_10 = {1'b0,accMetric3_10} + {1'b0,startMetric_10};
    wire            [18:0]  sumMetric_11 = {1'b0,accMetric3_11} + {1'b0,startMetric_11};
    wire            [6:0]   winner5;
    reg                     flipTracebackPingPong;
    wire            [3:0]   detectedBits;
    `endif
    wire            [17:0]  accMetric4_000;
    wire            [17:0]  accMetric4_001;
    wire            [17:0]  accMetric4_010;
    wire            [17:0]  accMetric4_011;
    wire            [17:0]  accMetric4_100;
    wire            [17:0]  accMetric4_101;
    wire            [17:0]  accMetric4_110;
    wire            [17:0]  accMetric4_111;
    acsStage4 stage4(
        .clk(clk),.clkEn(clkEn), .reset(reset),
        .positiveTau(positiveTau),
        .startFrame(startFrame),
        .startBlock(startBlock & sampleEn),
        .startStage(startStage4),
        .in0Real(s0_2_real),.in0Imag(s0_2_imag),
        .accMetricInEn(metric3OutputEn),
        `ifdef USE_WIDE_OUTPUT
        .accMetricIn_00(sumMetric_00[18] ? 18'h3ffff : sumMetric_00[17:0]),
        .accMetricIn_01(sumMetric_01[18] ? 18'h3ffff : sumMetric_01[17:0]),
        .accMetricIn_10(sumMetric_10[18] ? 18'h3ffff : sumMetric_10[17:0]),
        .accMetricIn_11(sumMetric_11[18] ? 18'h3ffff : sumMetric_11[17:0]),
        `else
        .accMetricIn_00(accMetric3_00),
        .accMetricIn_01(accMetric3_01),
        .accMetricIn_10(accMetric3_10),
        .accMetricIn_11(accMetric3_11),
        `endif
        .setupComplete(stage4SetupComplete),
        .setupOutputValid(stage4OutputValid),
        .setupReal(setup4Real),.setupImag(setup4Imag),
        .flipTracebackPingPong(flipTracebackPingPong),
        .winner5(winner5),
        .metricOutEn(metric4OutputEn),
        .accMetric_000(accMetric4_000),
        .accMetric_001(accMetric4_001),
        .accMetric_010(accMetric4_010),
        .accMetric_011(accMetric4_011),
        .accMetric_100(accMetric4_100),
        .accMetric_101(accMetric4_101),
        .accMetric_110(accMetric4_110),
        .accMetric_111(accMetric4_111),
        .startNextStage(startStage5),
        .detectedBits(detectedBits)
    );

    //----------------------------- Stage 5 -----------------------------------

    wire    signed  [17:0]  setup5Real,setup5Imag;
    stageSetup #(.STAGE(5)) stageSetup5(
        .clk(clk),
        .reset(reset),
        .clkEn(clkEn),
        .start(startFrame),
        .positiveTau(positiveTau),
        .tauIndex(absTauIndex),
        .h0EstReal(h0EstReal), .h0EstImag(h0EstImag),
        .h1EstReal(h1EstReal), .h1EstImag(h1EstImag),
        .stageSetupComplete(stage5SetupComplete),
        .stageOutputValid(stage5OutputValid),
        .refReal(setup5Real), .refImag(setup5Imag)
    );

    `ifdef USE_WIDE_OUTPUT
    wire            [17:0]  accMetric5_000;
    wire            [17:0]  accMetric5_001;
    wire            [17:0]  accMetric5_010;
    wire            [17:0]  accMetric5_011;
    wire            [17:0]  accMetric5_100;
    wire            [17:0]  accMetric5_101;
    wire            [17:0]  accMetric5_110;
    wire            [17:0]  accMetric5_111;
    wire            [5:0]   winner6;
    acsStage5Wide stage5(
        .clk(clk),.clkEn(clkEn), .reset(reset),
        .positiveTau(positiveTau),
        .startFrame(startFrame),
        .startBlock(startBlock & sampleEn),
        .startStage(startStage5),
        .in1Real(s1_2_real),.in1Imag(s1_2_imag),
        .accMetricInEn(metric4OutputEn),
        .accMetricIn_000(accMetric4_000),
        .accMetricIn_001(accMetric4_001),
        .accMetricIn_010(accMetric4_010),
        .accMetricIn_011(accMetric4_011),
        .accMetricIn_100(accMetric4_100),
        .accMetricIn_101(accMetric4_101),
        .accMetricIn_110(accMetric4_110),
        .accMetricIn_111(accMetric4_111),
        .setupComplete(stage5SetupComplete),
        .setupOutputValid(stage5OutputValid),
        .setupReal(setup5Real),.setupImag(setup5Imag),
        .flipTracebackPingPong(flipTracebackPingPong),
        .winner6(winner6),
        .metricOutEn(metric5OutputEn),
        .accMetric_000(accMetric5_000),
        .accMetric_001(accMetric5_001),
        .accMetric_010(accMetric5_010),
        .accMetric_011(accMetric5_011),
        .accMetric_100(accMetric5_100),
        .accMetric_101(accMetric5_101),
        .accMetric_110(accMetric5_110),
        .accMetric_111(accMetric5_111),
        .startNextStage(startStage6),
        .winner5(winner5)
    );
    `else
    wire            [17:0]  accMetric5_00;
    wire            [17:0]  accMetric5_01;
    wire            [17:0]  accMetric5_10;
    wire            [17:0]  accMetric5_11;
    acsStage5 stage5(
        .clk(clk),.clkEn(clkEn), .reset(reset),
        .positiveTau(positiveTau),
        .startFrame(startFrame),
        .startBlock(startBlock & sampleEn),
        .in1Real(s1_2_real),.in1Imag(s1_2_imag),
        .accMetricInEn(metric4OutputEn),
        .accMetricIn_000(accMetric4_000),
        .accMetricIn_001(accMetric4_001),
        .accMetricIn_010(accMetric4_010),
        .accMetricIn_011(accMetric4_011),
        .accMetricIn_100(accMetric4_100),
        .accMetricIn_101(accMetric4_101),
        .accMetricIn_110(accMetric4_110),
        .accMetricIn_111(accMetric4_111),
        .setupComplete(stage5SetupComplete),
        .setupOutputValid(stage5OutputValid),
        .setupReal(setup5Real),.setupImag(setup5Imag),
        .metricOutEn(metric5OutputEn),
        .accMetric_00(accMetric5_00),
        .accMetric_01(accMetric5_01),
        .accMetric_10(accMetric5_10),
        .accMetric_11(accMetric5_11)
    );
    `endif

    //----------------------------- Stage 6 -----------------------------------

    wire    signed  [17:0]  setup6Real,setup6Imag;
    stageSetup #(.STAGE(6)) stageSetup6(
        .clk(clk),
        .reset(reset),
        .clkEn(clkEn),
        .start(startFrame),
        .positiveTau(positiveTau),
        .tauIndex(absTauIndex),
        .h0EstReal(h0EstReal), .h0EstImag(h0EstImag),
        .h1EstReal(h1EstReal), .h1EstImag(h1EstImag),
        .stageSetupComplete(stage6SetupComplete),
        .stageOutputValid(stage6OutputValid),
        .refReal(setup6Real), .refImag(setup6Imag)
    );

    `ifdef USE_WIDE_OUTPUT
    wire            [17:0]  accMetric6_000;
    wire            [17:0]  accMetric6_001;
    wire            [17:0]  accMetric6_010;
    wire            [17:0]  accMetric6_011;
    wire            [17:0]  accMetric6_100;
    wire            [17:0]  accMetric6_101;
    wire            [17:0]  accMetric6_110;
    wire            [17:0]  accMetric6_111;
    wire            [4:0]   winner7;
    acsStage6Wide stage6(
        .clk(clk),.clkEn(clkEn), .reset(reset),
        .positiveTau(positiveTau),
        .startFrame(startFrame),
        .startBlock(startBlock & sampleEn),
        .startStage(startStage6),
        .in0Real(s0_3_real),.in0Imag(s0_3_imag),
        .accMetricInEn(metric5OutputEn),
        .accMetricIn_000(accMetric5_000),
        .accMetricIn_001(accMetric5_001),
        .accMetricIn_010(accMetric5_010),
        .accMetricIn_011(accMetric5_011),
        .accMetricIn_100(accMetric5_100),
        .accMetricIn_101(accMetric5_101),
        .accMetricIn_110(accMetric5_110),
        .accMetricIn_111(accMetric5_111),
        .setupComplete(stage6SetupComplete),
        .setupOutputValid(stage6OutputValid),
        .setupReal(setup6Real),.setupImag(setup6Imag),
        .flipTracebackPingPong(flipTracebackPingPong),
        .winner7(winner7),
        .metricOutEn(metric6OutputEn),
        .accMetric_000(accMetric6_000),
        .accMetric_001(accMetric6_001),
        .accMetric_010(accMetric6_010),
        .accMetric_011(accMetric6_011),
        .accMetric_100(accMetric6_100),
        .accMetric_101(accMetric6_101),
        .accMetric_110(accMetric6_110),
        .accMetric_111(accMetric6_111),
        .startNextStage(startStage7),
        .winner6(winner6)
    );
    `else
    wire            [17:0]  accMetric6_0;
    wire            [17:0]  accMetric6_1;
    acsStage6 stage6(
        .clk(clk),.clkEn(clkEn), .reset(reset),
        .positiveTau(positiveTau),
        .startFrame(startFrame),
        .startBlock(startBlock & sampleEn),
        .in0Real(s0_3_real),.in0Imag(s0_3_imag),
        .accMetricInEn(metric5OutputEn),
        .accMetricIn_00(accMetric5_00),
        .accMetricIn_01(accMetric5_01),
        .accMetricIn_10(accMetric5_10),
        .accMetricIn_11(accMetric5_11),
        .setupComplete(stage6SetupComplete),
        .setupOutputValid(stage6OutputValid),
        .setupReal(setup6Real),.setupImag(setup6Imag),
        .metricOutEn(metric6OutputEn),
        .accMetric_0(accMetric6_0),
        .accMetric_1(accMetric6_1)
    );
    `endif

    //----------------------------- Stage 7 -----------------------------------

    wire    signed  [17:0]  setup7Real,setup7Imag;
    stageSetup #(.STAGE(7)) stageSetup7(
        .clk(clk),
        .reset(reset),
        .clkEn(clkEn),
        .start(startFrame),
        .positiveTau(positiveTau),
        .tauIndex(absTauIndex),
        .h0EstReal(h0EstReal), .h0EstImag(h0EstImag),
        .h1EstReal(h1EstReal), .h1EstImag(h1EstImag),
        .stageSetupComplete(stage7SetupComplete),
        .stageOutputValid(stage7OutputValid),
        .refReal(setup7Real), .refImag(setup7Imag)
    );

    `ifdef USE_WIDE_OUTPUT
    wire            [17:0]  accMetric7_000;
    wire            [17:0]  accMetric7_001;
    wire            [17:0]  accMetric7_010;
    wire            [17:0]  accMetric7_011;
    wire            [17:0]  accMetric7_100;
    wire            [17:0]  accMetric7_101;
    wire            [17:0]  accMetric7_110;
    wire            [17:0]  accMetric7_111;
    reg             [3:0]   minIndex;
    acsStage7Wide stage7(
        .clk(clk),.clkEn(clkEn), .reset(reset),
        .positiveTau(positiveTau),
        .startFrame(startFrame),
        .startBlock(startBlock & sampleEn),
        .startStage(startStage7),
        .in1Real(s1_3_real),.in1Imag(s1_3_imag),
        .accMetricInEn(metric6OutputEn),
        .accMetricIn_000(accMetric6_000),
        .accMetricIn_001(accMetric6_001),
        .accMetricIn_010(accMetric6_010),
        .accMetricIn_011(accMetric6_011),
        .accMetricIn_100(accMetric6_100),
        .accMetricIn_101(accMetric6_101),
        .accMetricIn_110(accMetric6_110),
        .accMetricIn_111(accMetric6_111),
        .setupComplete(stage7SetupComplete),
        .setupOutputValid(stage7OutputValid),
        .setupReal(setup7Real),.setupImag(setup7Imag),
        .flipTracebackPingPong(flipTracebackPingPong),
        .minIndex(minIndex),
        .metricOutEn(metric7OutputEn),
        .accMetric_000(accMetric7_000),
        .accMetric_001(accMetric7_001),
        .accMetric_010(accMetric7_010),
        .accMetric_011(accMetric7_011),
        .accMetric_100(accMetric7_100),
        .accMetric_101(accMetric7_101),
        .accMetric_110(accMetric7_110),
        .accMetric_111(accMetric7_111),
        .startNextStage(startMinSearch),
        .winner7(winner7)
    );

    // Find the minimum metric and serialize the output
    reg             [2:0]   minState;
    `define                 MIN_IDLE        3'b000
    `define                 MIN_COMPARE8    3'b001
    `define                 MIN_COMPARE4    3'b011
    `define                 MIN_COMPARE2    3'b010
    `define                 MIN_COMPARE1    3'b110
    `define                 MIN_SERIALIZE   3'b100
    reg             [3:0]   minIndex_000,minIndex_100;
    reg             [3:0]   minIndex_001,minIndex_101;
    reg             [3:0]   minIndex_010,minIndex_110;
    reg             [3:0]   minIndex_011,minIndex_111;
    reg             [3:0]   minIndex_00;
    reg             [3:0]   minIndex_01;
    reg             [3:0]   minIndex_10;
    reg             [3:0]   minIndex_11;
    reg             [3:0]   minIndex_0;
    reg             [3:0]   minIndex_1;
    reg             [17:0]  minMetric_000,minMetric_100;
    reg             [17:0]  minMetric_001,minMetric_101;
    reg             [17:0]  minMetric_010,minMetric_110;
    reg             [17:0]  minMetric_011,minMetric_111;
    reg             [17:0]  minMetric_00;
    reg             [17:0]  minMetric_01;
    reg             [17:0]  minMetric_10;
    reg             [17:0]  minMetric_11;
    reg             [17:0]  minMetric_0;
    reg             [17:0]  minMetric_1;
    reg             [17:0]  minMetric;
    reg             [17:0]  accMetric_0000;
    reg             [17:0]  accMetric_0001;
    reg             [17:0]  accMetric_0010;
    reg             [17:0]  accMetric_0011;
    reg             [17:0]  accMetric_0100;
    reg             [17:0]  accMetric_0101;
    reg             [17:0]  accMetric_0110;
    reg             [17:0]  accMetric_0111;
    reg             [17:0]  accMetric_1000;
    reg             [17:0]  accMetric_1001;
    reg             [17:0]  accMetric_1010;
    reg             [17:0]  accMetric_1011;
    reg             [17:0]  accMetric_1100;
    reg             [17:0]  accMetric_1101;
    reg             [17:0]  accMetric_1110;
    reg             [17:0]  accMetric_1111;
    reg             [3:0]   finalMetricCount;
    always @(posedge clk) begin
        if (startFrame) begin
            minState <= `MIN_IDLE;
            minMetric <= 0;
            flipTracebackPingPong <= 0;
        end
        else begin
            case (minState)
                `MIN_IDLE: begin
                    finalMetricOutputEn <= 0;
                    if (metric7OutputEn) begin
                        accMetric_0000 <= accMetric7_000;
                        accMetric_0001 <= accMetric7_001;
                        accMetric_0010 <= accMetric7_010;
                        accMetric_0011 <= accMetric7_011;
                        accMetric_0100 <= accMetric7_100;
                        accMetric_0101 <= accMetric7_101;
                        accMetric_0110 <= accMetric7_110;
                        accMetric_0111 <= accMetric7_111;
                        minState <= `MIN_COMPARE8;
                    end
                end
                `MIN_COMPARE8: begin
                    accMetric_1000 <= accMetric7_000;
                    accMetric_1001 <= accMetric7_001;
                    accMetric_1010 <= accMetric7_010;
                    accMetric_1011 <= accMetric7_011;
                    accMetric_1100 <= accMetric7_100;
                    accMetric_1101 <= accMetric7_101;
                    accMetric_1110 <= accMetric7_110;
                    accMetric_1111 <= accMetric7_111;
                    if (accMetric_0000 <= accMetric7_000) begin
                        minMetric_000 <= accMetric_0000;
                        minIndex_000 <= 0;
                    end
                    else begin
                        minMetric_000 <= accMetric7_000;
                        minIndex_000 <= 8;
                    end
                    if (accMetric_0001 <= accMetric7_001) begin
                        minMetric_001 <= accMetric_0001;
                        minIndex_001 <= 1;
                    end
                    else begin
                        minMetric_001 <= accMetric7_001;
                        minIndex_001 <= 9;
                    end
                    if (accMetric_0010 <= accMetric7_010) begin
                        minMetric_010 <= accMetric_0010;
                        minIndex_010 <= 2;
                    end
                    else begin
                        minMetric_010 <= accMetric7_010;
                        minIndex_010 <= 10;
                    end
                    if (accMetric_0011 <= accMetric7_011) begin
                        minMetric_011 <= accMetric_0011;
                        minIndex_011 <= 3;
                    end
                    else begin
                        minMetric_011 <= accMetric7_011;
                        minIndex_011 <= 11;
                    end
                    if (accMetric_0100 <= accMetric7_100) begin
                        minMetric_100 <= accMetric_0100;
                        minIndex_100 <= 4;
                    end
                    else begin
                        minMetric_100 <= accMetric7_100;
                        minIndex_100 <= 12;
                    end
                    if (accMetric_0101 <= accMetric7_101) begin
                        minMetric_101 <= accMetric_0101;
                        minIndex_101 <= 5;
                    end
                    else begin
                        minMetric_101 <= accMetric7_101;
                        minIndex_101 <= 13;
                    end
                    if (accMetric_0110 <= accMetric7_110) begin
                        minMetric_110 <= accMetric_0110;
                        minIndex_110 <= 6;
                    end
                    else begin
                        minMetric_110 <= accMetric7_110;
                        minIndex_110 <= 14;
                    end
                    if (accMetric_0111 <= accMetric7_111) begin
                        minMetric_111 <= accMetric_0111;
                        minIndex_111 <= 7;
                    end
                    else begin
                        minMetric_111 <= accMetric7_111;
                        minIndex_111 <= 15;
                    end
                    minState <= `MIN_COMPARE4;
                end
                `MIN_COMPARE4: begin
                    if (minMetric_000 <= minMetric_001) begin
                        minMetric_00 <= minMetric_000;
                        minIndex_00 <= minIndex_000;
                    end
                    else begin
                        minMetric_00 <= minMetric_001;
                        minIndex_00 <= minIndex_001;
                    end
                    if (minMetric_010 <= minMetric_011) begin
                        minMetric_01 <= minMetric_010;
                        minIndex_01 <= minIndex_010;
                    end
                    else begin
                        minMetric_01 <= minMetric_011;
                        minIndex_01 <= minIndex_011;
                    end
                    if (minMetric_100 <= minMetric_101) begin
                        minMetric_10 <= minMetric_100;
                        minIndex_10 <= minIndex_100;
                    end
                    else begin
                        minMetric_10 <= minMetric_101;
                        minIndex_10 <= minIndex_101;
                    end
                    if (minMetric_110 <= minMetric_111) begin
                        minMetric_11 <= minMetric_110;
                        minIndex_11 <= minIndex_110;
                    end
                    else begin
                        minMetric_11 <= minMetric_111;
                        minIndex_11 <= minIndex_111;
                    end
                  minState <= `MIN_COMPARE2;
              end
              `MIN_COMPARE2: begin
                    if (minMetric_00 <= minMetric_01) begin
                        minMetric_0 <= minMetric_00;
                        minIndex_0 <= minIndex_00;
                    end
                    else begin
                        minMetric_0 <= minMetric_01;
                        minIndex_0 <= minIndex_01;
                    end
                    if (minMetric_10 <= minMetric_11) begin
                        minMetric_1 <= minMetric_10;
                        minIndex_1 <= minIndex_10;
                    end
                    else begin
                        minMetric_1 <= minMetric_11;
                        minIndex_1 <= minIndex_11;
                    end
                  minState <= `MIN_COMPARE1;
              end
              `MIN_COMPARE1: begin
                    if (minMetric_0 <= minMetric_1) begin
                        minMetric <= minMetric_0;
                        minIndex <= minIndex_0;
                        finalMetric <= accMetric_0000 - minMetric_0;
                    end
                    else begin
                        minMetric <= minMetric_1;
                        minIndex <= minIndex_1;
                        finalMetric <= accMetric_0000 - minMetric_1;
                    end
                    minState <= `MIN_SERIALIZE;
                    finalMetricOutputEn <= 1;
                    finalMetricCount <= 15;
                    flipTracebackPingPong <= 1;
                end
                `MIN_SERIALIZE: begin
                    flipTracebackPingPong <= 0;
                    if (finalMetricCount == 0) begin
                        finalMetricOutputEn <= 0;
                        minState <= `MIN_IDLE;
                    end
                    else begin
                        finalMetricCount <= finalMetricCount - 1;
                    end
                    finalMetric <= accMetric_0001 - minMetric;
                    accMetric_0001 <= accMetric_0010;
                    accMetric_0010 <= accMetric_0011;
                    accMetric_0011 <= accMetric_0100;
                    accMetric_0100 <= accMetric_0101;
                    accMetric_0101 <= accMetric_0110;
                    accMetric_0110 <= accMetric_0111;
                    accMetric_0111 <= accMetric_1000;
                    accMetric_1000 <= accMetric_1001;
                    accMetric_1001 <= accMetric_1010;
                    accMetric_1010 <= accMetric_1011;
                    accMetric_1011 <= accMetric_1100;
                    accMetric_1100 <= accMetric_1101;
                    accMetric_1101 <= accMetric_1110;
                    accMetric_1110 <= accMetric_1111;
                end
                default: begin
                    minState <= `MIN_IDLE;
                end
            endcase
        end
    end

    // Save the final metric as the input metric to the next block
    assign                  startMetricRequest = metric3OutputEn;
    wire            [17:0]  fifoMetric;
    acsFifo #(.LOG2DEPTH(4)) metricFifo(
        .clk(clk),
        .srst(startFrame),
        .wr_en(finalMetricOutputEn),
        .din(finalMetric),
        .rd_en(startMetricRequest),
        .dout(fifoMetric),
        .full(),
        .empty()
    );
    assign startMetric_00 = fifoMetric;
    assign startMetric_01 = fifoMetric;
    assign startMetric_10 = fifoMetric;
    assign startMetric_11 = fifoMetric;

    // Delay the stage 7 startNextStage to create the outputEn
//    reg                     outputEn;
    reg             [31:0]  outputEnSR;
//    reg             [3:0]   outputBits;
    always @(posedge clk) begin
        outputEnSR <= {outputEnSR[30:0],startMinSearch};
        if (reset) begin
            outputBits <= 0;
			outputEn <= 0;
        end
		else if (outputEnSR[10]) begin
            outputBits <= detectedBits;
            outputEn <= 1;
        end
        else begin
            outputEn <= 0;
        end
    end

    `else //USE_WIDE_OUTPUT

    wire            [17:0]  accMetric7;
    acsStage7 stage7(
        .clk(clk),.clkEn(clkEn), .reset(reset),
        .positiveTau(positiveTau),
        .startFrame(startFrame),
        .startBlock(startBlock & sampleEn),
        .in1Real(s1_3_real),.in1Imag(s1_3_imag),
        .accMetricInEn(metric6OutputEn),
        .accMetricIn_0(accMetric6_0),
        .accMetricIn_1(accMetric6_1),
        .setupComplete(stage7SetupComplete),
        .setupOutputValid(stage7OutputValid),
        .setupReal(setup7Real),.setupImag(setup7Imag),
        .metricOutEn(metric7OutputEn),
        .accMetric(accMetric7)
    );

    // Find the minimum metric
    assign                  finalMetricOutputEn = metric7OutputEn;
    assign                  finalMetric = accMetric7;
    reg             [17:0]  minMetric;
    reg             [3:0]   minIndex;
    reg             [3:0]   index;
    reg                     delay;
    wire                    finalStartBlock = (!delay && finalMetricOutputEn);
    always @(posedge clk) begin
        if (reset) begin
            minMetric <= 0;
        end
        else if (finalStartBlock) begin
            minMetric <= finalMetric;
            minIndex <= 0;
            index <= 1;
        end
        else if (finalMetricOutputEn) begin
            if (finalMetric < minMetric) begin
                minMetric <= finalMetric;
                minIndex <= index;
            end
            index <= index + 1;
        end
        delay <= finalMetricOutputEn;
    end

    // Save the final metric as the input metric to the next block
    wire            [17:0]  fifoMetric;
    acsFifo #(.LOG2DEPTH(4)) metricFifo(
        .clk(clk),
        .srst(reset),
        .wr_en(finalMetricOutputEn),
        .din(finalMetric),
        .rd_en(stage0MetricRequest),
        .dout(fifoMetric),
        .full(),
        .empty()
    );

    // Adjust the metrics by the minimum
    always @* begin
        startMetric = fifoMetric - minMetric;
    end


    `endif


    assign  setupComplete = stage4SetupComplete;


endmodule



