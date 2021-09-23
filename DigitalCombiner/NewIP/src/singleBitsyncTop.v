/******************************************************************************
Copyright 2008-2015 Koos Technical Services, Inc. All Rights Reserved

This source code is the Intellectual Property of Koos Technical Services,Inc.
(KTS) and is provided under a License Agreement which protects KTS' ownership and
derivative rights in exchange for negotiated compensation.
******************************************************************************/

`include "./addressMap.v"
`timescale 1ns / 10 ps

module singleBitsyncTop(
    input                       clk, clkEn, reset,
    `ifdef USE_BUS_CLOCK
    input                       busClk,
    `endif
    input                       cs,
    input                       wr0,wr1,wr2,wr3,
    input               [12:0]  addr,
    input               [31:0]  din,
    output  reg         [31:0]  dout,
    input       signed  [17:0]  rx,
    input                       rxSaturated,
    input               [1:0]   rotation,
    output                      lock,
    output                      sym2xEn,
    output                      symEn,
    output      signed  [17:0]  symData,
    output                      symClk,
    output  reg                 bitOutput,
    output  reg                 dac0ClkEn,
    output  reg signed  [17:0]  dac0Data,
    output  reg                 dac1ClkEn,
    output  reg signed  [17:0]  dac1Data,
    output  reg                 dac2ClkEn,
    output  reg signed  [17:0]  dac2Data,
    output                      highImpedance,
    output                      singleEnded,
    output      signed  [17:0]  gain,
    output      signed  [17:0]  dcOffset
);


    /******************************************************************************
                                    Global Registers
    ******************************************************************************/
    // Microprocessor interface
    reg sbsTopSpace;
    always @* begin
        casex(addr)
            `SBS_TOP_SPACE: sbsTopSpace = cs;
            default:        sbsTopSpace = 0;
        endcase
    end

    wire    [1:0]   bitsyncMode;
    wire    [3:0]   dac0Select, dac1Select, dac2Select;
    wire    [4:0]   dcGain;
    wire    [7:0]   dcTest;
    wire    [31:0]  sbsTopDout;
    bitsyncTopRegs sbsTopRegs(
        `ifdef USE_BUS_CLOCK
        .busClk(busClk),
        `endif
        .addr(addr),
        .dataIn(din),
        .dataOut(sbsTopDout),
        .cs(sbsTopSpace),
        .wr0(wr0), .wr1(wr1), .wr2(wr2), .wr3(wr3),
        .ch0BitsyncLock(lock),
        .ch1BitsyncLock(1'b0),
        .bitsyncMode(bitsyncMode),
        .ch0Dac0Select(dac0Select),
        .ch0Dac1Select(dac1Select),
        .ch0Dac2Select(dac2Select),
        .ch0DCRemovalEnable(dcRemovalEnable),
        .ch0HighImpedance(highImpedance),
        .ch0SingleEnded(singleEnded),
        .ch0DCGain(dcGain),
        .ch0DCTest(dcTest),
        .ch1Dac0Select(),
        .ch1Dac1Select(),
        .ch1Dac2Select(),
        .ch1DCRemovalEnable(),
        .ch1HighImpedance(),
        .ch1SingleEnded(),
        .ch1DCGain(),
        .ch1DCTest()
    );


    /******************************************************************************
                              DC Offset Removal Loop Filter
    ******************************************************************************/
    //`define USE_MEAN_DC

    `ifdef USE_MEAN_DC
    wire    signed  [17:0]  dcError;
    wire    signed  [33:0]  dcIn = $signed({rx,16'h0});
    `else
    wire    signed  [17:0]  dcError;
    wire    signed  [33:0]  dcIn = (transitionsDetected && !rxSaturated) ? $signed({dcError,16'h0})
                                                                         : $signed({rx,16'h0});
    `endif
    wire    signed  [39:0]  dc;
    dcLoopFilter dcLoop(
        .clk(clk), .clkEn(sym2xEn), .reset(reset),
        .error(dcIn),
        .lagExp(dcGain),
        .clearAccum(!dcRemovalEnable),
        .lagAccum(dc)
        );
    assign dcOffset = (dcTest != 0) ? $signed({dcTest,10'h0}) : $signed(dc[39:22]);

    /******************************************************************************
                              Decimating Filters
    ******************************************************************************/
    wire    signed  [17:0]  dfOut;
    wire            [31:0]  dfDout;
    decimatingFilter #(.RegSpace(`SBS_DFSPACE), .FirSpace(`SBS_DFFIRSPACE)) df(
        .clk(clk), .clkEn(clkEn), .reset(reset),
        `ifdef USE_BUS_CLOCK
        .busClk(busClk),
        `endif
        .wr0(wr0) , .wr1(wr1), .wr2(wr2), .wr3(wr3),
        .addr(addr),
        .din(din),
        .dout(dfDout),
        .rx(rx),
        .clkEnOut(dfClkEn),
        .dfOut(dfOut)
    );

    /******************************************************************************
                                      Resamplers
    ******************************************************************************/
    reg resampSpace;
    always @* begin
        casex(addr)
            `SBS_RESAMPSPACE:   resampSpace = cs;
            default:            resampSpace = 0;
        endcase
    end

    wire    [31:0]  resampleRate;
    wire    [31:0]  resampDout;
    resamplerRegs resampRegs(
        `ifdef USE_BUS_CLOCK
        .busClk(busClk),
        `endif
        .addr(addr),
        .dataIn(din),
        .dataOut(resampDout),
        .cs(resampSpace),
        .wr0(wr0), .wr1(wr1), .wr2(wr2), .wr3(wr3),
        .resampleRate(resampleRate),
        .auResampleRate(),
        .auShift(),
        .auDecimation()
    );

    wire    signed  [31:0]  resamplerFreqOffset;
    wire    signed  [17:0]  resampOut;
    resampler resamp(
        .clk(clk), .reset(reset),
        .resetPhase(1'b0),
        .clkEn(dfClkEn),
        .resampleRate(resampleRate),
        .resamplerFreqOffset(resamplerFreqOffset),
        .offsetEn(1'b1),
        .in(dfOut),
        .out(resampOut),
        .clkEnOut(resampClkEn),
        .sampleOffset()
    );

    /******************************************************************************
                         Timing Error Detector and Loop Filter
    ******************************************************************************/

    wire    signed  [17:0]  bsError;
    wire            [15:0]  lockCounter;
    wire            [31:0]  bitsyncDout;
    singleBitsync bs(
        .sampleClk(clk), 
        .reset(reset),
        .clkEn(resampClkEn),
        `ifdef USE_BUS_CLOCK
        .busClk(busClk),
        `endif
        .cs(cs),
        .wr0(wr0),.wr1(wr1),.wr2(wr2),.wr3(wr3),
        .addr(addr),
        .din(din),
        .dout(bitsyncDout),
        .bsInput(resampOut),
        .sym2xEn(sym2xEn),
        .symEn(symEn),
        .symClk(symClk),
        .symData(symData),
        .bitData(bitsyncBit),
        .sampleFreq(resamplerFreqOffset),
        .lock(lock),
        .lockCounter(lockCounter),
        .bsError(bsError), .bsErrorEn(bsErrorEn),
        .dcError(dcError),
        .transitionsDetected(transitionsDetected)
    );


    /******************************************************************************
                                   AGC Loop Filter
    ******************************************************************************/

    wire    [16:0]  level;
    wire    [31:0]  agcDout;
    pcmAgcLoop #(.RegSpace(`SBS_AGCSPACE)) pcmAgcLoop(
        .clk(clk), .reset(reset), .clkEn(dfClkEn),
        `ifdef USE_BUS_CLOCK
        .busClk(busClk),
        `endif
        .wr0(wr0),.wr1(wr1),.wr2(wr2),.wr3(wr3),
        .addr(addr),
        .din(din),
        .dout(agcDout),
        .rx(dfOut),
        .rxLevel(level),
        .agcGain(gain)
    );

    //******************************************************************************
    //                        QPSK/OQPSK Ambiguity Resolution
    //******************************************************************************
        always @(posedge clk) begin
            if (symEn) begin
                bitOutput <= bitsyncBit;
            end
        end


    /******************************************************************************
                                   DAC Output Mux
    ******************************************************************************/

    always @(posedge clk) begin
        case (dac0Select)
            `BS_DAC_ADC: begin
                dac0Data <= rx;
                dac0ClkEn <= clkEn;
                end
            `BS_DAC_DC: begin
                dac0Data <= dcOffset;
                dac0ClkEn <= sym2xEn;
                end
            `BS_DAC_DF: begin
                dac0Data <= dfOut;
                dac0ClkEn <= dfClkEn;
                end
            `BS_DAC_SYM: begin
                dac0Data <= symData;
                dac0ClkEn <= sym2xEn;
                end
            `BS_DAC_AGC: begin
                dac0Data <= {1'b0,gain[17:1]};
                dac0ClkEn <= symEn;
                end
            `BS_DAC_LOCK: begin
                dac0Data <= {lockCounter,2'b0};
                dac0ClkEn <= 1'b1;
                end
            default: begin
                dac0Data <= dfOut;
                dac0ClkEn <= dfClkEn;
                end
            endcase

        case (dac1Select)
            `BS_DAC_ADC: begin
                dac1Data <= rx;
                dac1ClkEn <= clkEn;
                end
            `BS_DAC_DC: begin
                dac1Data <= dcError;
                dac1ClkEn <= sym2xEn;
                end
            `BS_DAC_DF: begin
                dac1Data <= dfOut;
                dac1ClkEn <= dfClkEn;
                end
            `BS_DAC_SYM: begin
                dac1Data <= symData;
                dac1ClkEn <= sym2xEn;
                end
            `BS_DAC_AGC: begin
                dac1Data <= {1'b0,level};
                dac1ClkEn <= symEn;
                end
            `BS_DAC_LOCK: begin
                dac1Data <= {lockCounter,2'b0};
                dac1ClkEn <= 1'b1;
                end
            default: begin
                dac1Data <= dfOut;
                dac1ClkEn <= dfClkEn;
                end
            endcase

        case (dac2Select)
            `BS_DAC_ADC: begin
                dac2Data <= rx;
                dac2ClkEn <= clkEn;
                end
            `BS_DAC_DC: begin
                dac2Data <= dcOffset;
                dac2ClkEn <= sym2xEn;
                end
            `BS_DAC_DF: begin
                dac2Data <= dfOut;
                dac2ClkEn <= dfClkEn;
                end
            `BS_DAC_SYM: begin
                dac2Data <= symData;
                dac2ClkEn <= sym2xEn;
                end
            `BS_DAC_AGC: begin
                dac2Data <= {1'b0,gain[17:1]};
                dac2ClkEn <= symEn;
                end
            `BS_DAC_LOCK: begin
                dac2Data <= {lockCounter,2'b0};
                dac2ClkEn <= 1'b1;
                end
            default: begin
                dac2Data <= dfOut;
                dac2ClkEn <= dfClkEn;
                end
            endcase


        end

    /******************************************************************************
                                    uP dout mux
    ******************************************************************************/
    always @* begin
        casex (addr)
            `SBS_TOP_SPACE:     dout = sbsTopDout;
            `SBS_DFSPACE,
            `SBS_DFFIRSPACE:    dout = dfDout;
            `SBS_RESAMPSPACE:   dout = resampDout;
            `SBS_BITSYNCSPACE:  dout = bitsyncDout;
            `SBS_AGCSPACE:      dout = agcDout;
            default:            dout = 32'bx;
        endcase
    end

endmodule
