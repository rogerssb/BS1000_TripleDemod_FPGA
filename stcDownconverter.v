/******************************************************************************
Copyright 2008-2015 Koos Technical Services, Inc. All Rights Reserved

This source code is the Intellectual Property of Koos Technical Services,Inc.
(KTS) and is provided under a License Agreement which protects KTS' ownership and
derivative rights in exchange for negotiated compensation.
******************************************************************************/

`include "addressMap.v"
`timescale 1ns / 10 ps

module stcDownconverter(
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
    input       signed  [17:0]  maxChEstI, maxChEstQ,
    input                       maxChEstClkEn,
    input                       sampleRateErrorEn,
    input       signed  [8:0]   sampleRateError,
    input                       locked,
    output      signed  [17:0]  iStc, qStc,
    output                      resampSync,
    output              [3:0]   dac0Select,dac1Select,dac2Select,
    output  reg                 dac0Sync,
    output  reg signed  [17:0]  dac0Data,
    output  reg                 dac1Sync,
    output  reg signed  [17:0]  dac1Data,
    output  reg                 dac2Sync,
    output  reg signed  [17:0]  dac2Data,
    output              [4:0]   demodMode
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
        .highFreqOffset(1'b0),
        .bitsyncLock(1'b0),
        .auBitsyncLock(1'b0),
        .demodLock(1'b0),
        .fskDeviation(16'h0),
        .demodMode(demodMode),
        .oqpskIthenQ(),
        .dac0Select(dac0Select),
        .dac1Select(dac1Select),
        .dac2Select(dac2Select),
        .falseLockAlpha(),
        .falseLockThreshold(),
        .amTC()
    );

    /******************************************************************************
                                    Downconverter
    ******************************************************************************/
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
        .bbClkEn(1'b0),
        .iBB(18'h0), .qBB(18'h0),
        .iIn(iRx), .qIn(qRx),
        .iLagOut(), .qLagOut(),
        .lagClkEn(),
        .syncOut(ddcSync),
        .iOut(iDdc), .qOut(qDdc)
    );

    /******************************************************************************
                                Narrowband Channel AGC
    ******************************************************************************/
    wire    [31:0]  nbAgcDout;
    channelAGC channelAGC(
        .clk(clk), .reset(reset), .clkEn(ddcSync & !locked),
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


    wire    signed  [17:0]  iFiltered = iDdc;
    wire    signed  [17:0]  qFiltered = qDdc;


    /******************************************************************************
                               Phase/Freq/Mag Detector
    ******************************************************************************/
    reg     [17:0]  iFm,qFm;
    reg             fmDemodClkEn;
    always @* begin
        fmDemodClkEn = ddcSync;
        iFm = iFiltered;
        qFm = qFiltered;
    end

    wire    [12:0]  mag;
    wire    [11:0]  phase;
    wire    [11:0]  freq;
    wire    [11:0]  negFreq = ~freq + 1;
    wire    [11:0]  freqError;
    fmDemod fmDemod(
        .clk(clk), .reset(reset),
        .clkEn(ddcSync),
        .iFm(iFiltered),.qFm(qFiltered),
        .demodMode(demodMode),
        .phase(phase),
        .phaseError(),
        .freq(freq),
        .freqError(freqError),
        .mag(mag),
        .clkEnOut(demodSync)
    );

    /******************************************************************************
                               Phase/Freq/Mag Detector
    ******************************************************************************/
    reg     signed  [17:0]  iFmNew,qFmNew;
    reg                     fmDemodNewClkEn;
    always @* begin
        fmDemodNewClkEn = maxChEstClkEn;
        iFmNew = maxChEstI;
        qFmNew = maxChEstQ;
    end

    wire    [12:0]  magNew;
    fmDemod fmDemodNew(
        .clk(clk), .reset(reset),
        .clkEn(fmDemodNewClkEn),
        .iFm(iFmNew),.qFm(qFmNew),
        .demodMode(demodMode),
        .phase(),
        .phaseError(),
        .freq(),
        .freqError(),
        .mag(magNew),
        .clkEnOut()
    );

    /******************************************************************************
                                 AFC/Sweep/Costas Loop
    ******************************************************************************/
    wire    [17:0]  offsetError;
    wire            offsetErrorEn;
    wire    [11:0]  demodLoopError;
    wire    [15:0]  freqLockCounter;
    wire    [31:0]  freqDout;
    wire    [11:0]  rndOffsetError = offsetError[17:6] + offsetError[5];
    carrierLoop #(.RegSpace(`CARRIERSPACE)) carrierLoop(
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
        .highFreqOffset(1'b0),
        .offsetError(12'h0),
        .offsetErrorEn(1'b0),
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
    always @* begin
        iResampIn <= iFiltered;
        qResampIn <= qFiltered;
    end


    /******************************************************************************
                             Resampler Loop Filter
    ******************************************************************************/

    reg bitsyncSpace;
    always @* begin
        casex(addr)
            `BITSYNCSPACE:  bitsyncSpace = cs;
            default:        bitsyncSpace = 0;
        endcase
    end

    wire    signed  [31:0]  sampleFreq;
    wire            [31:0]  bsDout;
    loopFilter sampleLoop(
        .clk(clk),
        .clkEn(sampleRateErrorEn),
        .reset(reset),
        `ifdef USE_BUS_CLOCK
        .busClk(busClk),
        `endif
        .cs(bitsyncSpace),
        .wr0(wr0),.wr1(wr1),.wr2(wr2),.wr3(wr3),
        .addr(addr),
        .din(din),
        .dout(bsDout),
        .error($signed({sampleRateError,3'b0})),
        .loopFreq(sampleFreq),
        .ctrl2(),
        .ctrl4(),
        .satPos(),
        .satNeg(),
        .lockCount(),
        .syncThreshold()
    );




    /******************************************************************************
                                      Resampler
    ******************************************************************************/
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
        .resamplerFreqOffset(sampleFreq),
        .auResamplerFreqOffset(32'h0),
        .offsetEn(1'b1),
        .auOffsetEn(1'b1),
        .iIn(iResampIn),
        .qIn(qResampIn),
        .iOut(iStc),
        .qOut(qStc),
        .clkEnOut(resampSync),
        .sampleOffset(),
        .auClkEnOut()
    );





/******************************************************************************
                               DAC Output Mux
******************************************************************************/


    reg     [17:0]  iResampInReg,qResampInReg;
    reg     [17:0]  iSymDataReg,qSymDataReg;
    reg     [17:0]  freqReg,phaseReg,magReg,freqErrorReg;
    always @(posedge clk) begin
        if (ddcSync) begin
            iResampInReg <= iResampIn;
            qResampInReg <= qResampIn;
        end
        if (resampSync) begin
            iSymDataReg <= iStc;
            qSymDataReg <= qStc;
        end
        if (demodSync) begin
            freqReg <= {freq,6'b0};
            phaseReg <= {phase,6'b0};
            magReg <= {1'b0,mag,4'b0};
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
            dac0Data <= freqReg;
            dac0Sync <= demodSync;
            end
        `DAC_PHASE: begin
            dac0Data <= phaseReg;
            dac0Sync <= demodSync;
            end
        `DAC_MAG: begin
            dac0Data <= magReg;
            dac0Sync <= demodSync;
            end
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
            dac1Data <= freqReg;
            dac1Sync <= demodSync;
            end
        `DAC_PHASE: begin
            dac1Data <= phaseReg;
            dac1Sync <= demodSync;
            end
        `DAC_MAG: begin
            dac1Data <= {1'b0,magNew,4'b0};
            dac1Sync <= 1'b1;
            end
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
            dac2Data <= freqReg;
            dac2Sync <= demodSync;
            end
        `DAC_PHASE: begin
            dac2Data <= phaseReg;
            dac2Sync <= demodSync;
            end
        `DAC_MAG: begin
            dac2Data <= magReg;
            dac2Sync <= demodSync;
            end
        default: begin
            dac2Data <= iResampInReg;
            dac2Sync <= ddcSync;
            end
        endcase
    end


/******************************************************************************
                                uP dout mux
******************************************************************************/
always @* begin
    casex (addr)
        `DEMODSPACE:        dout = demodDout;
        `CHAGCSPACE:        dout = nbAgcDout;
        `CICDECSPACE,
        `DDCFIRSPACE,
        `DDCSPACE:          dout = ddcDout;
        `BITSYNCSPACE:      dout = bsDout;
        `RESAMPSPACE:       dout = resampDout;
        `CARRIERSPACE:      dout = freqDout;
        default:            dout = 32'bx;
        endcase
    end



endmodule

