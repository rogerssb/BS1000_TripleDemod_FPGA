/******************************************************************************
Copyright 2008-2015 Koos Technical Services, Inc. All Rights Reserved

This source code is the Intellectual Property of Koos Technical Services,Inc.
(KTS) and is provided under a License Agreement which protects KTS' ownership and
derivative rights in exchange for negotiated compensation.
******************************************************************************/

`include "addressMap.v"
`timescale 1ns / 10 ps

module demod(
    input                       clk, reset,
    `ifdef USE_BUS_CLOCK
    input                       busClk,
    `endif
    input                       cs,
    input                       wr0,wr1,wr2,wr3,
    input               [12:0]  addr,
    input               [31:0]  din,
    output  reg         [31:0]  dout,
    input       signed  [17:0]  iRx, qRx,
    input                       bbClkEn,
    input       signed  [17:0]  iBB, qBB,
    output                      iSym2xEn,
    output                      iSymEn,
    output      signed  [17:0]  iSymData,
    output                      iSymClk,
    output                      iBitEn,
    output                      iBit,
    output                      qSym2xEn,
    output                      qSymEn,
    output                      qSymClk,
    output      signed  [17:0]  qSymData,
    output                      qBitEn,
    output                      qBit,
    output                      auSymClk,
    output                      auBit,
    output                      timingLock,
    output                      carrierLock,
    output                      trellisSymEn,
    output      signed  [17:0]  iTrellis,
    output      signed  [17:0]  qTrellis,
    `ifdef ADD_LDPC
    output                      iLdpcSymEn,qLdpcSymEn,
    output      signed  [17:0]  iLdpc,
    output      signed  [17:0]  qLdpc,
    `endif
    `ifdef ADD_SUPERBAUD_TED
    output                      multihSymEnEven,
    `endif
    output              [3:0]   dac0Select,dac1Select,dac2Select,
    output  reg                 dac0Sync,
    output  reg signed  [17:0]  dac0Data,
    output  reg                 dac1Sync,
    output  reg signed  [17:0]  dac1Data,
    output  reg                 dac2Sync,
    output  reg signed  [17:0]  dac2Data,
    output              [4:0]   demodMode,
    output              [12:0]  mag,
    output                      magClkEn,
    `ifdef ADD_SCPATH
    output                      enableScPath,
    output      signed  [17:0]  iBBOut, qBBOut,
    output                      bbClkEnOut,
    `endif
    `ifdef ADD_DESPREADER
    output                      iEpoch,qEpoch,
    `endif
    output                      sdiSymEn,
    output                      eyeSync,
    output      signed  [17:0]  iEye,qEye,
    output              [4:0]   eyeOffset
);


/******************************************************************************
                                Global Registers
******************************************************************************/
// Microprocessor interface
reg demodSpace;
always @* begin
    casex(addr)
        `DEMODSPACE: demodSpace = cs;
        default:     demodSpace = 0;
        endcase
    end
wire    [15:0]  fskDeviation;
wire    [15:0]  falseLockAlpha;
wire    [15:0]  falseLockThreshold;
wire    [4:0]   amTC;
reg             highFreqOffset;
wire    [31:0]  demodDout;
demodRegs demodRegs(
    .addr(addr),
    .dataIn(din),
    .dataOut(demodDout),
    `ifdef USE_BUS_CLOCK
    .busClk(busClk),
    `endif
    .cs(demodSpace),
    .wr0(wr0), .wr1(wr1), .wr2(wr2), .wr3(wr3),
    .highFreqOffset(highFreqOffset),
    .bitsyncLock(bitsyncLock),
    .auBitsyncLock(auBitsyncLock),
    .demodLock(carrierLock),
    .fskDeviation(fskDeviation),
    .demodMode(demodMode),
    `ifdef ADD_DESPREADER
    .despreadLock(despreadLock),
    .enableDespreader(enableDespreader),
    `endif
    `ifdef ADD_SCPATH
    .enableScPath(enableScPath),
    `endif
    .oqpskIthenQ(oqpskIthenQ),
    .dac0Select(dac0Select),
    .dac1Select(dac1Select),
    .dac2Select(dac2Select),
    .falseLockAlpha(falseLockAlpha),
    .falseLockThreshold(falseLockThreshold),
    .amTC(amTC)
    );

/******************************************************************************
                                Downconverter
******************************************************************************/
`ifdef ADD_SCPATH
wire    [17:0]  iLagOut,qLagOut;
`endif
wire    [17:0]  iDdc,qDdc;
wire    [20:0]  nbAgcGain;
wire    [31:0]  carrierFreqOffset;
wire    [31:0]  carrierLeadFreq;
wire    [31:0]  ddcDout;
ddc ddc(
    .clk(clk), .reset(reset),
    `ifdef USE_BUS_CLOCK
    .busClk(busClk),
    `endif
    .cs(cs),
    .wr0(wr0) , .wr1(wr1), .wr2(wr2), .wr3(wr3),
    .addr(addr),
    .din(din),
    .dout(ddcDout),
    .ddcFreqOffset(carrierFreqOffset),
    .leadFreq(carrierLeadFreq),
    .offsetEn(carrierOffsetEn),
    .nbAgcGain(nbAgcGain),
    .bbClkEn(bbClkEn),
    .iBB(iBB), .qBB(qBB),
    .iIn(iRx), .qIn(qRx),
    `ifdef ADD_SCPATH
    .iLagOut(iBBOut), .qLagOut(qBBOut),
    .lagClkEn(bbClkEnOut),
    `else
    .iLagOut(), .qLagOut(),
    .lagClkEn(),
    `endif
    .syncOut(ddcSync),
    .iOut(iDdc), .qOut(qDdc)
    );

/******************************************************************************
                            Narrowband Channel AGC
******************************************************************************/
wire    [31:0]  nbAgcDout;
channelAGC channelAGC(
    .clk(clk), .reset(reset), .clkEn(ddcSync),
    `ifdef USE_BUS_CLOCK
    .busClk(busClk),
    `endif
    .cs(cs),
    .wr0(wr0) , .wr1(wr1), .wr2(wr2), .wr3(wr3),
    .addr(addr),
    .din(din),
    .dout(nbAgcDout),
    .iIn(iDdc),.qIn(qDdc),
    .agcGain(nbAgcGain)
    );


`ifdef ADD_CMA
/******************************************************************************
                                 CMA Equalizer
******************************************************************************/
    reg cmaSpace;
    always @* begin
        casex(addr)
            `EQUALIZERSPACE:    cmaSpace = cs;
            default:            cmaSpace = 0;
        endcase
    end
    wire    signed  [2:0]   stepSizeExponent;
    wire            [15:0]  cmaReference;
    `ifdef ADD_CMA_DISPLAY
    wire            [15:0]  maxWtMag;
    `endif
    wire            [31:0]  cmaDout;
    cmaRegs cmaRegs(
        .addr(addr),
        .dataIn(din),
        .dataOut(cmaDout),
        .cs(cmaSpace),
        `ifdef USE_BUS_CLOCK
        .busClk(busClk),
        `endif
        .wr0(wr0), .wr1(wr1), .wr2(wr2), .wr3(wr3),
        .wtOvf(cmaWeightOverflow),
        `ifdef ADD_CMA_DISPLAY
        .maxWeightMag(maxWtMag),
        `endif
        .enableEqualizer(enableEqualizer),
        .resetEqualizer(resetEqualizer),
        .eqStepSizeExponent(stepSizeExponent),
        .cmaReference(cmaReference)
    );

    wire    signed  [17:0]  iCma;
    wire    signed  [17:0]  qCma;
    `ifdef ADD_CMA_DISPLAY
    wire    signed  [17:0]  cmaWeightVideo;
    `endif
    cma cma(
        .clk(clk),
        .clkEn(ddcSync),
        .reset(reset),
        .wtReset(resetEqualizer),
        .stepExpo(stepSizeExponent),
        .refLevel(cmaReference),
        .iIn(iDdc),
        .qIn(qDdc),
        .weightOverflow(cmaWeightOverflow),
        `ifdef ADD_CMA_DISPLAY
        .maxMag(maxWtMag),
        .video(cmaWeightVideo),
        `endif
        .iOut(iCma),
        .qOut(qCma)
    );

    wire    signed  [17:0]  iFiltered = enableEqualizer ? iCma : iDdc;
    wire    signed  [17:0]  qFiltered = enableEqualizer ? qCma : qDdc;

`else //ADD_CMA

    wire    signed  [17:0]  iFiltered = iDdc;
    wire    signed  [17:0]  qFiltered = qDdc;

`endif //ADD_CMA

/******************************************************************************
                           Phase/Freq/Mag Detector
******************************************************************************/
reg     [17:0]  iFm,qFm;
reg             fmDemodClkEn;
always @* begin
    casex (demodMode)
        default: begin
            fmDemodClkEn = ddcSync;
            iFm = iFiltered;
            qFm = qFiltered;
        end
    endcase
end

wire    [11:0]   phase;
wire    [11:0]   freq;
wire    [11:0]   negFreq = ~freq + 1;
wire    [11:0]   freqError;
fmDemod fmDemod(
    .clk(clk), .reset(reset),
    `ifdef ADD_DESPREADER
    .clkEn(fmDemodClkEn),
    .iFm(iFm),.qFm(qFm),
    `else
    .clkEn(ddcSync),
    .iFm(iFiltered),.qFm(qFiltered),
    `endif
    .demodMode(demodMode),
    .phase(phase),
    .phaseError(),
    .freq(freq),
    .freqError(freqError),
    .mag(mag),
    .clkEnOut(demodSync)
    );
assign magClkEn = demodSync;

reg     [17:0]  iDdc0;
reg     [17:0]  qDdc0;
wire    [35:0]  term1,term2;
mpy18x18WithCe mult1(
    .clk(clk),
    .ce(ddcSync),
    .a(qDdc0),
    .b(iFiltered),
    .p(term1)
    );
mpy18x18WithCe mult2(
    .clk(clk),
    .ce(ddcSync),
    .a(iDdc0),
    .b(qFiltered),
    .p(term2)
    );

wire    [35:0]  diff = term2 - term1;
wire    [17:0]  fmVideo = diff[34:17];
always @(posedge clk) begin
    if (ddcSync) begin
        iDdc0 <= iFiltered;
        qDdc0 <= qFiltered;
        end
    end

`ifdef SIMULATE
real    fmVideoReal;
always @* fmVideoReal = $itor($signed(fmVideo))/(2**17);
real    iFilteredReal;
always @* iFilteredReal = $itor($signed(iFiltered))/(2**17);
real    qFilteredReal;
always @* qFilteredReal = $itor($signed(qFiltered))/(2**17);
real    iDdc0Real,qDdc0Real;
real    term0Real,term1Real,diffReal;
always @(posedge clk) begin
    if (ddcSync) begin
        iDdc0Real <= iFilteredReal;
        qDdc0Real <= qFilteredReal;
        term0Real <= iFilteredReal*qDdc0Real;
        term1Real <= qFilteredReal*iDdc0Real;
        diffReal <= term1Real - term0Real;
        end
    end
`endif


wire    [17:0]  fm = {negFreq,6'h0};
wire    [17:0]  fmInv = {freq,6'h0};

/******************************************************************************
                           Magnitude Filter
******************************************************************************/
reg     [13:0]  magError;
wire    [39:0]  magAccum;
always @(posedge clk) begin
    if (demodSync) begin
        magError <= {1'b0,mag} - magAccum[39:25];
        end
    end
lagGain12 magLoop(
    .clk(clk), .clkEn(demodSync), .reset(reset),
    .error(magError[13:2]),
    .lagExp(amTC),
    .upperLimit(32'h7fffffff),
    .lowerLimit(32'h00000000),
    .clearAccum(1'b0),
    .sweepEnable(1'b0),
    .sweepRateMag(32'h0),
    .carrierInSync(1'b0),
    .acqTrackControl(2'b0),
    .track(1'b0),
    .lagAccum(magAccum)
    );


/******************************************************************************
                             False Lock Detector
******************************************************************************/

// Average the frequency error.
reg     [17:0]  averageFreq;
wire    [17:0]  oneMinusFalseLockAlpha = (18'h20000 + ~{falseLockAlpha,2'b0});
wire    [35:0]  alpha;
reg     [17:0]  freqSample;
mpy18x18PL1 mpyFLD0(
    .clk(clk),
    .sclr(reset),
    .a(freqSample),
    .b({falseLockAlpha,2'b0}),
    .p(alpha)
    );
wire    [35:0]  oneMinusAlpha;
wire    [35:0]  alphaSum = alpha + oneMinusAlpha;
mpy18x18PL1 mpyFLD1(
    .clk(clk),
    .sclr(reset),
    .a(averageFreq),
    .b(oneMinusFalseLockAlpha),
    .p(oneMinusAlpha)
    );

// Average the absolute value of the frequency error.
reg     [17:0]  averageAbsFreq;
wire    [35:0]  absAlpha;
reg     [17:0]  absFreqSample;
mpy18x18PL1 mpyFLD2(
    .clk(clk),
    .sclr(reset),
    .a(absFreqSample),
    .b({falseLockAlpha,2'b0}),
    .p(absAlpha)
    );
wire    [35:0]  oneMinusAbsAlpha;
wire    [35:0]  absAlphaSum = absAlpha + oneMinusAbsAlpha;
mpy18x18PL1 mpyFLD3(
    .clk(clk),
    .sclr(reset),
    .a(averageAbsFreq),
    .b(oneMinusFalseLockAlpha),
    .p(oneMinusAbsAlpha)
    );


reg     [17:0]  nextFreqSample;
reg     [17:0]  nextAbsSample;
always @(demodMode or fm or fmInv or freqError) begin
    casex (demodMode)
        `MODE_OQPSK,
        `MODE_SOQPSK: begin
            nextFreqSample = fm;
            nextAbsSample = fm[17] ? fmInv : fm;
            end
        default: begin
            nextFreqSample = {freqError,6'h0};
            nextAbsSample = 0;
            end
        endcase
    end

wire    [17:0]  negAverageFreq = -averageFreq;
wire    [17:0]  absAverageFreq = averageFreq[17] ? negAverageFreq : averageFreq;
always @(posedge clk) begin
    if (demodSync) begin
        freqSample <= nextFreqSample;
        absFreqSample <= nextAbsSample;
        averageFreq <= alphaSum[34:17];
        averageAbsFreq <= absAlphaSum[34:17];
        end
    end

always @(posedge clk) begin
    if (demodSync) begin
        if (averageAbsFreq > 18'h10000) begin
            highFreqOffset <= 1;
            end
        else if (absAverageFreq > falseLockThreshold) begin
            highFreqOffset <= !carrierLock;
            end
        else begin
            highFreqOffset <= 0;
            end
        end
    end




/******************************************************************************
                             AFC/Sweep/Costas Loop
******************************************************************************/
wire    [17:0]  offsetError;
wire            offsetErrorEn;
wire    [11:0]  demodLoopError;
wire    [15:0]  freqLockCounter;
wire    [31:0]  freqDout;
wire    [11:0]  rndOffsetError = offsetError[17:6] + offsetError[5];
//reg     [11:0]   rndOffsetError;
//always @(posedge clk) begin
//    if (offsetErrorEn) begin
//        casex (offsetError[17:14])
//            4'b10xx,
//            4'b110x,
//            4'b1110:    rndOffsetError <= 12'h801;
//            4'b01xx,
//            4'b001x,
//            4'b0001:    rndOffsetError <= 12'h7ff;
//            default:    rndOffsetError <= offsetError[14:3] + offsetError[2];
//            endcase
//        end
//    end
carrierLoop carrierLoop(
    .clk(clk), .reset(reset),
    .resampClkEn(resampSync),
    .ddcClkEn(demodSync),
    `ifdef USE_BUS_CLOCK
    .busClk(busClk),
    `endif
    .cs(cs),
    .wr0(wr0),.wr1(wr1),.wr2(wr2),.wr3(wr3),
    .addr(addr),
    .din(din),
    .dout(freqDout),
    .demodMode(demodMode),
    .phase(phase),
    .freq(freq),
    .highFreqOffset(highFreqOffset),
    .offsetError(rndOffsetError),
    .offsetErrorEn(offsetErrorEn),
    .carrierFreqOffset(carrierFreqOffset),
    .carrierLeadFreq(carrierLeadFreq),
    .carrierFreqEn(carrierOffsetEn),
    .loopError(demodLoopError),
    .carrierLock(carrierLock),
    .lockCounter(freqLockCounter)
    );

/******************************************************************************
                                  I/Q Swap
******************************************************************************/
wire            auIQSwap;
reg     [17:0]  iResampIn,qResampIn;
always @(posedge clk) begin
    if (ddcSync) begin
        if (auIQSwap) begin
            iResampIn <= qFiltered;
            qResampIn <= iFiltered;
            end
        else begin
            iResampIn <= iFiltered;
            qResampIn <= qFiltered;
            end
        end
    end

/******************************************************************************
                                  Resampler
******************************************************************************/
wire    [17:0]  iResamp,qResamp;
wire    [31:0]  resamplerFreqOffset;
wire    [31:0]  auResamplerFreqOffset;
wire    [31:0]  resampDout;
dualResampler resampler(
    .clk(clk), .reset(reset), .clkEn(ddcSync),
    `ifdef USE_BUS_CLOCK
    .busClk(busClk),
    `endif
    .cs(cs),
    .wr0(wr0) , .wr1(wr1), .wr2(wr2), .wr3(wr3),
    .addr(addr),
    .din(din),
    .dout(resampDout),
    .demodMode(demodMode),
    .resamplerFreqOffset(resamplerFreqOffset),
    .auResamplerFreqOffset(auResamplerFreqOffset),
    .offsetEn(1'b1),
    .auOffsetEn(1'b1),
    .iIn(iResampIn),
    .qIn(qResampIn),
    .iOut(iResamp),
    .qOut(qResamp),
    .clkEnOut(resampSync),
    .sampleOffset(eyeOffset),
    .auClkEnOut(auResampSync)
    );




`ifdef ADD_DESPREADER
/******************************************************************************
                                Despreader
******************************************************************************/
wire    [17:0]  dsTimingError;
wire    [31:0]  despreaderDout;
wire    [2:0]   despreaderMode;
wire    [17:0]  iDsSymData,qDsSymData;
wire    [15:0]  dsSyncCount,dsSwapSyncCount;
dualDespreader despreader(
    .clk(clk),
    .clkEn(resampSync), .qClkEn(qSym2xEn),
    .symEn(iSymEn),   .qSymEn(qSymEn),
    .reset(reset),
    `ifdef USE_BUS_CLOCK
    .busClk(busClk),
    `endif
    .cs(cs),
    .wr0(wr0) , .wr1(wr1), .wr2(wr2), .wr3(wr3),
    .addr(addr),
    .din(din),
    .iIn(iResamp), .qIn(qResamp),
    .demodMode(demodMode),
    .dout(despreaderDout),
    .despreaderMode(despreaderMode),
    .iDespread(iDsSymData),
    .qDespread(qDsSymData),
    .iCode(iCode),.qCode(qCode),
    .iEpoch(iEpoch), .qEpoch(qEpoch),
    .despreadLock(despreadLock),
    .scaledSyncCount(dsSyncCount),
    .scaledSwapSyncCount(dsSwapSyncCount)
    );
`endif


/******************************************************************************
                                Bitsync Loop
******************************************************************************/

`ifdef SUBCARRIER_DEMOD

wire    [17:0]  iBsSymData,qBsSymData;
wire    [17:0]  iBsTrellis,qBsTrellis;
wire    [17:0]  bsError;
wire    [15:0]  bsLockCounter;
wire    [15:0]  auLockCounter;
wire    [31:0]  bitsyncDout;
singleRailBitsync bitsync(
    .sampleClk(clk), .reset(reset),
    .symTimes2Sync(resampSync),
    .demodMode(demodMode),
    `ifdef USE_BUS_CLOCK
    .busClk(busClk),
    `endif
    .cs(cs),
    .wr0(wr0),.wr1(wr1),.wr2(wr2),.wr3(wr3),
    .addr(addr),
    .din(din),
    .dout(bitsyncDout),
    .i(iResamp), .q(qResamp),
    .offsetError(offsetError),
    .offsetErrorEn(offsetErrorEn),
    `ifdef SYM_DEVIATION
    .fskDeviation(fskDeviation),
    `else
    .posDeviation(posDeviation),
    .negDeviation(negDeviation),
    `endif
    .sym2xEn(iSym2xEn),
    .symEn(iSymEn),
    .symClk(iSymClk),
    .symData(iSymData),
    .bitData(iBit),
    .sampleFreq(resamplerFreqOffset),
    .bitsyncLock(bitsyncLock),
    .lockCounter(bsLockCounter),
    `ifdef ADD_SUPERBAUD_TED
    .bsError(bsError), .bsErrorEn(bsErrorEn),
    .tedOutput(tedOutput), .tedOutputEn(tedOutputEn)
    `else
    .bsError(bsError), .bsErrorEn(bsErrorEn)
    `endif
    );

wire    [17:0]  qSymData = 0;
assign          iTrellis = 0;
assign          qTrellis = 0;
wire            timingLock = bitsyncLock;

`else  // SUBCARRIER_DEMOD

wire    [17:0]  iBsSymData,qBsSymData;
wire    [17:0]  iBsTrellis,qBsTrellis;
wire    [17:0]  bsError;
wire    [15:0]  bsLockCounter;
wire    [15:0]  auLockCounter;
wire    [31:0]  bitsyncDout;
    `ifdef ADD_SUPERBAUD_TED
    wire    signed  [17:0]  tedOutput;
    `endif
bitsync bitsync(
    .clk(clk), .reset(reset),
    .sym2xClkEn(resampSync),
    .auResampClkEn(auResampSync),
    .demodMode(demodMode),
    .oqpskIthenQ(oqpskIthenQ),
    `ifdef ADD_DESPREADER
    .enableDespreader(enableDespreader),
    `endif
    `ifdef USE_BUS_CLOCK
    .busClk(busClk),
    `endif
    .cs(cs),
    .wr0(wr0),.wr1(wr1),.wr2(wr2),.wr3(wr3),
    .addr(addr),
    .din(din),
    .dout(bitsyncDout),
    .i(iResamp), .q(qResamp),
    .au(qResamp),
    .offsetError(offsetError),
    .offsetErrorEn(offsetErrorEn),
    `ifdef SYM_DEVIATION
    .fskDeviation(fskDeviation),
    `else
    .posDeviation(posDeviation),
    .negDeviation(negDeviation),
    `endif
    .iSym2xEn(iSym2xEn),
    .iSymEn(iSymEn),
    .iSymClk(iSymClk),
    .symDataI(iBsSymData),
    .iBitEn(iBitEn),
    .iBit(iBit),
    .qSym2xEn(qSym2xEn),
    .qSymEn(qSymEn),
    .qSymClk(qSymClk),
    .symDataQ(qBsSymData),
    .qBitEn(qBitEn),
    .qBit(qBit),
    .sampleFreq(resamplerFreqOffset),
    .auSampleFreq(auResamplerFreqOffset),
    .bitsyncLock(bitsyncLock),
    .lockCounter(bsLockCounter),
    .auBitsyncLock(auBitsyncLock),
    .auLockCounter(auLockCounter),
    .auIQSwap(auIQSwap),
    .sdiSymEn(sdiSymEn),
    .iTrellis(iBsTrellis),.qTrellis(qBsTrellis),
    `ifdef ADD_LDPC
    .iLdpcSymEn(iLdpcSymEn),.qLdpcSymEn(qLdpcSymEn),
    .iLdpc(iLdpc), .qLdpc(qLdpc),
    `endif
    `ifdef ADD_SUPERBAUD_TED
    .bsError(bsError), .bsErrorEn(bsErrorEn),
    .tedOutput(tedOutput), .tedOutputEn(tedOutputEn),
    .tedSyncPulse(tedSyncPulse),
    .tedSymEnEven(multihSymEnEven)
    `else
    .bsError(bsError), .bsErrorEn(bsErrorEn)
    `endif
    );

`ifdef ADD_DESPREADER

reg             auSymClk;
reg             auBit;
reg     [17:0]  iSymData;
reg     [17:0]  qSymData;
reg     [17:0]  iTrellis,qTrellis;
reg             timingLock;
always @* begin
    if (enableDespreader) begin
        iSymData = iDsSymData;
        qSymData = qDsSymData;
        iTrellis = iDsSymData;
        qTrellis = qDsSymData;
        timingLock = despreadLock & bitsyncLock;
        case (despreaderMode)
            `DS_MODE_NASA_DG1_MODE3_SPREAD_Q: begin
                auSymClk = iSymClk;
                auBit = iBit;
            end
            default: begin
                auSymClk = qSymClk;
                auBit = qBit;
            end
        endcase
    end
    else begin
        iSymData = iBsSymData;
        qSymData = qBsSymData;
        iTrellis = iBsTrellis;
        qTrellis = qBsTrellis;
        timingLock = bitsyncLock;
        auSymClk = qSymClk;
        auBit = qBit;
    end
end

`else  // ADD_DESPREADER

assign          auSymClk = qSymClk;
assign          auBit = qBit;
assign          iSymData = iBsSymData;
assign          qSymData = qBsSymData;
assign          iTrellis = iBsTrellis;
assign          qTrellis = qBsTrellis;
assign          timingLock = bitsyncLock;
`endif

`ifdef SIMULATE
real iTrellisReal;
always @* iTrellisReal = $itor($signed(iTrellis))/(2.0**17);
real iSymReal;
always @* iSymReal = $itor($signed(iSymData))/(2.0**17);
`endif

assign trellisSymEn = iBitEn & resampSync;

assign eyeSync = resampSync;
assign cordicModes = ( (demodMode == `MODE_2FSK)
                    || (demodMode == `MODE_PCMTRELLIS)
                    || (demodMode == `MODE_FM)
                    || (demodMode == `MODE_PM));

assign iEye = cordicModes ? iSymData : iResamp;
assign qEye = cordicModes ? qSymData : qResamp;

`endif // SUBCARRIER_DEMOD


/******************************************************************************
                               DAC Output Mux
******************************************************************************/

`ifdef ADD_VID_FILTER
// Programmable FIR
wire    [15:0]  c0c14, c1c13, c2c12, c3c11, c4c10, c5c9 , c6c8 , c7   ;
reg             firspace;
always @* begin
    casex (addr)
        `VIDFIRSPACE: begin
            firspace = cs;
            end
        default: begin
            firspace = 0;
            end
        endcase
    end

wire    [31:0]  firDout;
dualFirCoeffRegs firCoeffRegs (
    .addr    (addr   ),
    .dataIn  (din    ),
    .dataOut (firDout),
    `ifdef USE_BUS_CLOCK
    .busClk(busClk),
    `endif
    .cs      (firspace),
    .wr0     (wr0), .wr1(wr1), .wr2(wr2), .wr3(wr3),
    .c0      (c0c14  ),
    .c1      (c1c13  ),
    .c2      (c2c12  ),
    .c3      (c3c11  ),
    .c4      (c4c10  ),
    .c5      (c5c9   ),
    .c6      (c6c8   ),
    .c7      (c7     )
    );

wire    [17:0]  firOut;
singleFir interpFir(
    .clk        (clk),
    .reset      (reset),
    .syncIn     (demodSync),
    .c0c14      (c0c14  ),
    .c1c13      (c1c13  ),
    .c2c12      (c2c12  ),
    .c3c11      (c3c11  ),
    .c4c10      (c4c10  ),
    .c5c9       (c5c9   ),
    .c6c8       (c6c8   ),
    .c7         (c7     ),
    .in         (fm),
    .out        (firOut)
    );
`endif

`define NEW_DAC_MUX
`ifdef NEW_DAC_MUX
    reg     [17:0]  iResampInReg,qResampInReg,fmVideoReg,averageFreqReg,averageAbsFreqReg;
    reg     [17:0]  iSymDataReg,qSymDataReg;
    `ifdef ADD_DESPREADER
    reg     [17:0]  dsSyncCountReg,dsSwapSyncCountReg;
    `endif
    reg     [17:0]  fmReg,phaseReg,magAccumReg,freqErrorReg;
    always @(posedge clk) begin
        if (ddcSync) begin
            iResampInReg <= iResampIn;
            qResampInReg <= qResampIn;
            fmVideoReg <= fmVideo;
            averageFreqReg <= averageFreq;
            averageAbsFreqReg <= averageAbsFreq;
        end
        if (resampSync) begin
            iSymDataReg <= iSymData;
            qSymDataReg <= qSymData;
            `ifdef ADD_DESPREADER
            dsSyncCountReg <= {dsSyncCount,2'b0};
            dsSwapSyncCountReg <= {dsSwapSyncCount,2'b0};
            `endif
        end
        if (demodSync) begin
            fmReg <= fm;
            phaseReg <= {phase,6'b0};
            magAccumReg <= {~magAccum[38],magAccum[37:21]};
            freqErrorReg <= {freqError,6'h0};
        end
    end
wire fmMode = (demodMode == `MODE_FM);

always @(posedge clk) begin
    case (dac0Select)
        `DAC_I: begin
            dac0Data <= iResampInReg;
            dac0Sync <= ddcSync;
            end
        `DAC_Q: begin
            dac0Data <= qResampInReg;
            dac0Sync <= ddcSync;
            end
        `DAC_ISYM: begin
            dac0Data <= iSymDataReg;
            dac0Sync <= resampSync;
            end
        `DAC_QSYM: begin
            dac0Data <= qSymDataReg;
            dac0Sync <= resampSync;
            end
        `DAC_FREQ: begin
            `ifdef FM_FILTER
            dac0Data <= firOut;
            `else
            if (fmMode) begin
                dac0Data <= fmVideoReg;
                dac0Sync <= ddcSync;
                end
            else begin
                dac0Data <= fmReg;
                dac0Sync <= demodSync;
                end
            `endif
            end
        `DAC_PHASE: begin
            dac0Data <= phaseReg;
            dac0Sync <= demodSync;
            end
        `DAC_MAG: begin
            dac0Data <= magAccumReg;
            dac0Sync <= demodSync;
            end
        `DAC_PHERROR: begin
            dac0Data <= {demodLoopError,6'h0};
            dac0Sync <= carrierOffsetEn;
            end
        `DAC_BSLOCK: begin
            dac0Data <= {auLockCounter,2'b0};
            dac0Sync <= 1'b1;
            end
        `DAC_FREQLOCK: begin
            dac0Data <= {freqLockCounter,2'b0};
            dac0Sync <= 1'b1;
            end
        `DAC_AVGFREQ: begin
            dac0Data <= averageFreqReg;
            dac0Sync <= ddcSync;
            end
        `DAC_FREQERROR: begin
            dac0Data <= freqErrorReg;
            dac0Sync <= demodSync;
            end
        `ifdef ADD_DESPREADER
        `DAC_DS_CODE: begin
            dac0Data <= {iCode,17'h10000};
            dac0Sync <= iSymEn;
            end
        `DAC_DS_LOCK: begin
            dac0Data <= dsSyncCountReg;
            dac0Sync <= resampSync;
            end
        `DAC_DS_EPOCH: begin
            dac0Data <= {iEpoch,17'h10000};
            dac0Sync <= iSymEn;
            end
        `endif
        default: begin
            dac0Data <= iResampInReg;
            dac0Sync <= ddcSync;
            end
        endcase

    case (dac1Select)
        `DAC_I: begin
            dac1Data <= iResampInReg;
            dac1Sync <= ddcSync;
            end
        `DAC_Q: begin
            dac1Data <= qResampInReg;
            dac1Sync <= ddcSync;
            end
        `DAC_ISYM: begin
            dac1Data <= iSymDataReg;
            dac1Sync <= resampSync;
            end
        `DAC_QSYM: begin
            dac1Data <= qSymDataReg;
            dac1Sync <= resampSync;
            end
        `DAC_FREQ: begin
            if (fmMode) begin
                dac1Data <= fmVideoReg;
                dac1Sync <= ddcSync;
                end
            else begin
                dac1Data <= fmReg;
                dac1Sync <= demodSync;
                end
            end
        `DAC_PHASE: begin
            dac1Data <= phaseReg;
            dac1Sync <= demodSync;
            end
        `DAC_MAG: begin
            dac1Data <= magAccumReg;
            dac1Sync <= demodSync;
            end
        `DAC_PHERROR: begin
            dac1Data <= {demodLoopError,6'h0};
            dac1Sync <= carrierOffsetEn;
            end
        `DAC_BSLOCK: begin
            dac1Data <= {bsLockCounter,2'b0};
            dac1Sync <= 1'b1;
            end
        `DAC_FREQLOCK: begin
            dac1Data <= {freqLockCounter,2'b0};
            dac1Sync <= 1'b1;
            end
        `DAC_AVGFREQ: begin
            dac1Data <= averageAbsFreqReg;
            dac1Sync <= ddcSync;
            end
        `DAC_FREQERROR: begin
            dac1Data <= freqErrorReg;
            dac1Sync <= demodSync;
            end
        `ifdef ADD_DESPREADER
        `DAC_DS_CODE: begin
            dac1Data <= {qCode,17'h10000};
            dac1Sync <= qSymEn;
            end
        `DAC_DS_LOCK: begin
            dac1Data <= dsSwapSyncCountReg;
            dac1Sync <= resampSync;
            end
        `DAC_DS_EPOCH: begin
            dac1Data <= {qEpoch,17'h10000};
            dac1Sync <= qSymEn;
            end
        `endif
        default: begin
            dac1Data <= iResampInReg;
            dac1Sync <= ddcSync;
            end
        endcase

    case (dac2Select)
        `DAC_I: begin
            dac2Data <= iResampInReg;
            dac2Sync <= ddcSync;
            end
        `DAC_Q: begin
            dac2Data <= qResampInReg;
            dac2Sync <= ddcSync;
            end
        `DAC_ISYM: begin
            dac2Data <= iSymDataReg;
            dac2Sync <= resampSync;
            end
        `DAC_QSYM: begin
            dac2Data <= qSymDataReg;
            dac2Sync <= resampSync;
            end
        `DAC_FREQ: begin
            if (fmMode) begin
                dac2Data <= fmVideoReg;
                dac2Sync <= ddcSync;
                end
            else begin
                dac2Data <= fmReg;
                dac2Sync <= demodSync;
                end
            end
        `DAC_PHASE: begin
            dac2Data <= phaseReg;
            dac2Sync <= demodSync;
            end
        `DAC_MAG: begin
            `ifdef ADD_CMA_DISPLAY
            if (enableEqualizer) begin
                dac2Data <= cmaWeightVideo;
                dac2Sync <= 1'b1;
            end
            else begin
                dac2Data <= magAccumReg;
                dac2Sync <= demodSync;
            end
            `else
            dac2Data <= magAccumReg;
            dac2Sync <= demodSync;
            `endif
            end
        `DAC_PHERROR: begin
            dac2Data <= {demodLoopError,6'h0};
            dac2Sync <= carrierOffsetEn;
            end
        `DAC_BSLOCK: begin
            `ifdef ADD_SUPERBAUD_TED
            dac2Data <= tedOutput;
            dac2Sync <= tedOutputEn;
            `else
            dac2Data <= bsError;
            dac2Sync <= bsErrorEn;
            `endif
            end
        `DAC_FREQLOCK: begin
            dac2Data <= {freqLockCounter,2'b0};
            dac2Sync <= 1'b1;
            end
        `DAC_AVGFREQ: begin
            dac2Data <= averageFreqReg;
            dac2Sync <= ddcSync;
            end
        `DAC_FREQERROR: begin
            dac2Data <= freqErrorReg;
            dac2Sync <= demodSync;
            end
        `ifdef ADD_DESPREADER
        `DAC_DS_CODE: begin
            dac2Data <= {iEpoch,17'h10000};
            dac2Sync <= 1'b1;
            end
        `endif
        default: begin
            dac2Data <= iResampInReg;
            dac2Sync <= ddcSync;
            end
        endcase
    end

`else //NEW_DAC_MUX

wire fmMode = (demodMode == `MODE_FM);
reg             dac0Sync;
reg     [17:0]  dac0Data;
reg             dac1Sync;
reg     [17:0]  dac1Data;
reg             dac2Sync;
reg     [17:0]  dac2Data;
always @(posedge clk) begin
    case (dac0Select)
        `DAC_I: begin
            dac0Data <= iResampIn;
            dac0Sync <= ddcSync;
            end
        `DAC_Q: begin
            dac0Data <= qResampIn;
            dac0Sync <= ddcSync;
            end
        `DAC_ISYM: begin
            dac0Data <= iSymData;
            dac0Sync <= resampSync;
            end
        `DAC_QSYM: begin
            dac0Data <= qSymData;
            dac0Sync <= resampSync;
            end
        `DAC_FREQ: begin
            `ifdef FM_FILTER
            dac0Data <= firOut;
            `else
            if (fmMode) begin
                dac0Data <= fmVideo;
                dac0Sync <= ddcSync;
                end
            else begin
                dac0Data <= fm;
                dac0Sync <= demodSync;
                end
            `endif
            end
        `DAC_PHASE: begin
            dac0Data <= {phase,6'b0};
            dac0Sync <= demodSync;
            end
        `DAC_MAG: begin
            //dac0Data <= {~mag[8],mag[7:0],9'b0};
            dac0Data <= {~magAccum[38],magAccum[37:21]};
            dac0Sync <= demodSync;
            end
        `DAC_PHERROR: begin
            dac0Data <= {demodLoopError,6'h0};
            dac0Sync <= carrierOffsetEn;
            end
        `DAC_BSLOCK: begin
            dac0Data <= {auLockCounter,2'b0};
            dac0Sync <= 1'b1;
            end
        `DAC_FREQLOCK: begin
            dac0Data <= {freqLockCounter,2'b0};
            dac0Sync <= 1'b1;
            end
        `DAC_AVGFREQ: begin
            dac0Data <= averageFreq;
            dac0Sync <= ddcSync;
            end
        `DAC_FREQERROR: begin
            dac0Data <= {freqError,6'h0};
            dac0Sync <= demodSync;
            end
        `ifdef ADD_DESPREADER
        `DAC_DS_CODE: begin
            dac0Data <= {iCode,17'h10000};
            dac0Sync <= iSymEn;
            end
        `DAC_DS_LOCK: begin
            dac0Data <= {dsSyncCount,2'b0};
            dac0Sync <= resampSync;
            end
        `DAC_DS_EPOCH: begin
            dac0Data <= {iEpoch,17'h10000};
            dac0Sync <= iSymEn;
            end
        `endif
        default: begin
            dac0Data <= iResampIn;
            dac0Sync <= ddcSync;
            end
        endcase

    case (dac1Select)
        `DAC_I: begin
            dac1Data <= iResampIn;
            dac1Sync <= ddcSync;
            end
        `DAC_Q: begin
            dac1Data <= qResampIn;
            dac1Sync <= ddcSync;
            end
        `DAC_ISYM: begin
            dac1Data <= iSymData;
            dac1Sync <= resampSync;
            end
        `DAC_QSYM: begin
            dac1Data <= qSymData;
            dac1Sync <= resampSync;
            end
        `DAC_FREQ: begin
            if (fmMode) begin
                dac1Data <= fmVideo;
                dac1Sync <= ddcSync;
                end
            else begin
                dac1Data <= fm;
                dac1Sync <= demodSync;
                end
            end
        `DAC_PHASE: begin
            dac1Data <= {phase,6'b0};
            dac1Sync <= demodSync;
            end
        `DAC_MAG: begin
            //dac1Data <= {~mag[8],mag[7:0],9'b0};
            dac1Data <= {~magAccum[38],magAccum[37:21]};
            dac1Sync <= demodSync;
            end
        `DAC_PHERROR: begin
            dac1Data <= {demodLoopError,6'h0};
            dac1Sync <= carrierOffsetEn;
            end
        `DAC_BSLOCK: begin
            dac1Data <= {bsLockCounter,2'b0};
            dac1Sync <= 1'b1;
            end
        `DAC_FREQLOCK: begin
            dac1Data <= {freqLockCounter,2'b0};
            dac1Sync <= 1'b1;
            end
        `DAC_AVGFREQ: begin
            dac1Data <= averageAbsFreq;
            dac1Sync <= ddcSync;
            end
        `DAC_FREQERROR: begin
            dac1Data <= {freqError,6'h0};
            dac1Sync <= demodSync;
            end
        `ifdef ADD_DESPREADER
        `DAC_DS_CODE: begin
            dac1Data <= {qCode,17'h10000};
            dac1Sync <= qSymEn;
            end
        `DAC_DS_LOCK: begin
            dac1Data <= {dsSwapSyncCount,2'b0};
            dac1Sync <= resampSync;
            end
        `DAC_DS_EPOCH: begin
            dac1Data <= {qEpoch,17'h10000};
            dac1Sync <= qSymEn;
            end
        `endif
        default: begin
            dac1Data <= iResampIn;
            dac1Sync <= ddcSync;
            end
        endcase

    case (dac2Select)
        `DAC_I: begin
            dac2Data <= iResampIn;
            dac2Sync <= ddcSync;
            end
        `DAC_Q: begin
            dac2Data <= qResampIn;
            dac2Sync <= ddcSync;
            end
        `DAC_ISYM: begin
            dac2Data <= iSymData;
            dac2Sync <= resampSync;
            end
        `DAC_QSYM: begin
            dac2Data <= qSymData;
            dac2Sync <= resampSync;
            end
        `DAC_FREQ: begin
            if (fmMode) begin
                dac2Data <= fmVideo;
                dac2Sync <= ddcSync;
                end
            else begin
                dac2Data <= fm;
                dac2Sync <= demodSync;
                end
            end
        `DAC_PHASE: begin
            dac2Data <= {phase,6'b0};
            dac2Sync <= demodSync;
            end
        `DAC_MAG: begin
            //dac2Data <= {~mag[8],mag[7:0],9'b0};
            dac2Data <= {~magAccum[38],magAccum[37:21]};
            dac2Sync <= demodSync;
            end
        `DAC_PHERROR: begin
            dac2Data <= {demodLoopError,6'h0};
            dac2Sync <= carrierOffsetEn;
            end
        `DAC_BSLOCK: begin
            dac2Data <= bsError;
            dac2Sync <= bsErrorEn;
            end
        `DAC_FREQLOCK: begin
            dac2Data <= {freqLockCounter,2'b0};
            dac2Sync <= 1'b1;
            end
        `DAC_AVGFREQ: begin
            dac2Data <= averageFreq;
            dac2Sync <= ddcSync;
            end
        `DAC_FREQERROR: begin
            dac2Data <= {freqError,6'h0};
            dac2Sync <= demodSync;
            end
        `ifdef ADD_DESPREADER
        `DAC_DS_CODE: begin
            dac2Data <= {iEpoch,17'h10000};
            dac2Sync <= 1'b1;
            end
        `endif
        default: begin
            dac2Data <= iResampIn;
            dac2Sync <= ddcSync;
            end
        endcase

    end
`endif //NEW_DAC_MUX

/******************************************************************************
                                uP dout mux
******************************************************************************/
always @* begin
    casex (addr)
        `DEMODSPACE:        dout = demodDout;
        `ifdef ADD_DESPREADER
        `DESPREADSPACE:     dout = despreaderDout;
        `endif
        `ifdef FM_FILTER
        `VIDFIRSPACE:       dout = firDout;
        `endif
        `ifdef ADD_CMA
        `EQUALIZERSPACE:    dout = cmaDout;
        `endif
        `CHAGCSPACE:        dout = nbAgcDout;
        `CICDECSPACE,
        `DDCFIRSPACE,
        `DDCSPACE:          dout = ddcDout;
        `RESAMPSPACE:       dout = resampDout;
        `BITSYNCAUSPACE,
        `BITSYNCSPACE:      dout = bitsyncDout;
        `CARRIERSPACE:      dout = freqDout;
        default:            dout = 32'bx;
        endcase
    end



endmodule