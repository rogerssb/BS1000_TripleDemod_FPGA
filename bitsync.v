/******************************************************************************
Copyright 2008-2015 Koos Technical Services, Inc. All Rights Reserved

This source code is the Intellectual Property of Koos Technical Services,Inc. 
(KTS) and is provided under a License Agreement which protects KTS' ownership and
derivative rights in exchange for negotiated compensation.
******************************************************************************/

`include "./addressMap.v"
`timescale 1ns/1ps

`define ENABLE_SLIP

module bitsync(
    sampleClk, reset, 
    symTimes2Sync,
    auResampSync,
    demodMode,
    `ifdef ADD_DESPREADER
    enableDespreader,
    `endif
    bitsyncMode,
    wr0,wr1,wr2,wr3,
    addr,
    din,
    dout,
    i,q,
    au,
    offsetError,
    offsetErrorEn,
    `ifdef SYM_DEVIATION
    fskDeviation,
    `else
    posDeviation,
    negDeviation,
    `endif
    iSym2xEn,
    iSymEn,
    iSymClk,
    symDataI,
    bitDataI,
    qSym2xEn,
    qSymEn,
    qSymClk,
    symDataQ,
    bitDataQ,
    sampleFreq,
    auSampleFreq,
    bitsyncLock,
    lockCounter,
    auBitsyncLock,
    auLockCounter,
    auIQSwap,
    iTrellis,qTrellis,
    bsError,
    bsErrorEn
    );

input           sampleClk;
input           reset;
input           symTimes2Sync;
input           auResampSync;
input   [4:0]   demodMode;
`ifdef ADD_DESPREADER
input           enableDespreader;
`endif
input   [1:0]   bitsyncMode;
input           wr0,wr1,wr2,wr3;
input   [12:0]  addr;
input   [31:0]  din;
output  [31:0]  dout;
input   [17:0]  i,q;
input   [17:0]  au;
output  [17:0]  offsetError;
output          offsetErrorEn;
`ifdef SYM_DEVIATION
output  [15:0]  fskDeviation;
`else
output  [15:0]  posDeviation;
output  [15:0]  negDeviation;
`endif
output          iSym2xEn;
output          iSymEn;
output          iSymClk;
output  [17:0]  symDataI;
output          bitDataI;
output          qSym2xEn;
output          qSymEn;
output          qSymClk;
output  [17:0]  symDataQ;
output          bitDataQ;
output  [31:0]  sampleFreq;
output  [31:0]  auSampleFreq;
output          bitsyncLock;
output  [15:0]  lockCounter;
output          auBitsyncLock;
output  [15:0]  auLockCounter;
output          auIQSwap;
output  [17:0]  iTrellis,qTrellis;
output  [17:0]  bsError;
output          bsErrorEn;

`define USE_COMP
`ifdef USE_COMP

wire    [17:0]  iComp,qComp;
cicComp cicCompI(
    .clk(sampleClk), 
    .reset(reset),
    .sync(symTimes2Sync), 
    .compIn(i),
    .compOut(iComp)
    );
cicComp cicCompQ(
    .clk(sampleClk), 
    .reset(reset),
    .sync(symTimes2Sync), 
    .compIn(q),
    .compOut(qComp)
    );
//****************************** Two Sample Sum *******************************
wire            useCompFilter;
wire            useSummer;
reg     [17:0]  iDelay,qDelay;
reg     [17:0]  iFiltered,qFiltered;
wire    [18:0]  iSum = useCompFilter ? ({iDelay[17],iDelay} + {iComp[17],iComp}) 
                                     : ({iDelay[17],iDelay} + {i[17],i});
wire    [18:0]  qSum = useCompFilter ? ({qDelay[17],qDelay} + {qComp[17],qComp})
                                     : ({qDelay[17],qDelay} + {q[17],q});
always @(posedge sampleClk) begin
    if (symTimes2Sync) begin
        if (useCompFilter) begin
            iDelay <= iComp;
            qDelay <= qComp;
            end
        else begin
            iDelay <= i;
            qDelay <= q;
            end
        if (useSummer) begin
            iFiltered <= iSum[18:1];
            qFiltered <= qSum[18:1];
            end
        else begin
            iFiltered <= iDelay;
            qFiltered <= qDelay;
            end
        end
    end
`else

//****************************** Two Sample Sum *******************************
reg     [17:0]  iDelay,qDelay;
reg     [17:0]  iFiltered,qFiltered;
wire    [18:0]  iSum = {iDelay[17],iDelay} + {i[17],i};
wire    [18:0]  qSum = {qDelay[17],qDelay} + {q[17],q};
always @(posedge sampleClk) begin
    if (symTimes2Sync) begin
        iDelay <= i;
        qDelay <= q;
        iFiltered <= iSum[18:1];
        qFiltered <= qSum[18:1];
        end
    end
`endif

`ifdef ADD_DESPREADER
/******************************************************************************
                               Symbol Offset Deskew
******************************************************************************/
reg     [17:0]  iMF,qMF,iSymDelay,qSymDelay;
always @(posedge sampleClk) begin
    if (symTimes2Sync) begin
        iSymDelay <= iFiltered;
        qSymDelay <= qFiltered;
        if (demodMode == `MODE_OQPSK) begin
            if (enableDespreader) begin
                iMF <= iSymDelay;
                qMF <= qFiltered;
                end
            else begin
                iMF <= iFiltered;
                qMF <= qSymDelay;
                end
            end
        else if (demodMode == `MODE_SOQPSK) begin
            iMF <= iFiltered;
            qMF <= qSymDelay;
            end
        else begin
            iMF <= iFiltered;
            qMF <= qFiltered;
            end
        end
    end
`else
/******************************************************************************
                               Symbol Offset Deskew
******************************************************************************/
reg     [17:0]  iMF,qMF,qSymDelay;
always @(posedge sampleClk) begin
    if (symTimes2Sync) begin
        iMF <= iFiltered;
        qSymDelay <= qFiltered;
        if ( (demodMode == `MODE_OQPSK)
          || (demodMode == `MODE_SOQPSK)) begin
            qMF <= qSymDelay;
            end
        else begin
            qMF <= qFiltered;
            end
        end
    end

`endif

wire fmTrellisModes = ( (demodMode == `MODE_MULTIH)
                     || (demodMode == `MODE_PCMTRELLIS)
                      );
//wire fmTrellisModes = ( (demodMode == `MODE_PCMTRELLIS)
//                      );
assign iTrellis = fmTrellisModes ? iMF : i;
assign qTrellis = fmTrellisModes ? qMF : q;

//*********************** MF Frequency Discriminator **************************
wire    [11:0]   phase;
vm_cordic cordic(
    .clk(sampleClk),
    .ena(symTimes2Sync),
    .x(iMF[17:4]),.y(qMF[17:4]),
    .p(phase)
    );
reg [11:0]freqOut;
reg [11:0]prevPhase;
wire [11:0]phaseDiff = phase - prevPhase;
always @(posedge sampleClk) begin
    if (symTimes2Sync) begin
        if (phaseDiff == 12'h800) begin
            freqOut <= 0;
            end
        else begin
        freqOut <= phaseDiff;
            end
        prevPhase <= phase;
        end
    end

wire    [11:0]  eqFreq;
multihEQ multihEQ (
    .clk(sampleClk), 
    .sync(symTimes2Sync), 
    .reset(reset),
    .din(freqOut),
    .dout(eqFreq)
    );

//wire    [17:0]  freq = (demodMode == `MODE_MULTIH) ? {eqFreq,6'b0} : {freqOut,6'b0};
wire    [17:0]  freq = {freqOut,6'b0};


`ifdef SIMULATE
real freqReal;
real multihReal;
real phaseReal;
always @(freq) freqReal = (freq[17] ? freq - 262144.0 : freq)/131072.0;
always @(eqFreq) multihReal = (eqFreq[11] ? eqFreq - 4096.0 : eqFreq)/2048.0;
always @(phase) phaseReal = (phase[11] ? phase - 4096.0: phase)/2048.0;
`endif

//******************************* Phase Error Detector ************************

// State machine:
//      Based on two clocks per symbol

reg phaseState;
parameter ONTIME =   1'b0;
parameter OFFTIME =  1'b1;

reg [1:0]slipState;
parameter AVERAGE =  2'b00;
parameter TEST =     2'b01;
parameter SLIP0 =    2'b11;
parameter SLIP1 =    2'b10;

// Fifo of baseband inputs
reg [17:0]bbSRI[3:0];
reg [17:0]bbSRQ[3:0];

// Timing error variables
wire            earlySignI = bbSRI[2][17];
wire    [17:0]  absEarlyI = earlySignI ? (~bbSRI[2] + 1) : bbSRI[2];
wire            lateSignI = bbSRI[0][17];
wire    [17:0]  absLateI = lateSignI ? (~bbSRI[0] + 1) : bbSRI[0];
wire    [17:0]  prevOffTimeI = bbSRI[3];
wire    [17:0]  earlyOnTimeI = bbSRI[2];
wire    [17:0]  offTimeI = bbSRI[1];
wire    [17:0]  lateOnTimeI = bbSRI[0];
wire    [17:0]  negoffTimeI = (~offTimeI + 1);
wire            earlySignQ = bbSRQ[2][17];
wire    [17:0]  absEarlyQ = earlySignQ ? (~bbSRQ[2] + 1) : bbSRQ[2];
wire            lateSignQ = bbSRQ[0][17];
wire    [17:0]  absLateQ = lateSignQ ? (~bbSRQ[0] + 1) : bbSRQ[0];
wire    [17:0]  earlyOnTimeQ = bbSRQ[2];
wire    [17:0]  lateOnTimeQ = bbSRQ[0];
wire    [17:0]  offTimeQ = bbSRQ[1];
wire    [17:0]  negoffTimeQ = (~offTimeQ + 1);

reg     [17:0]  timingErrorI;
reg     [17:0]  timingErrorQ;
wire    [18:0]  timingError = {timingErrorI[17],timingErrorI} + {timingErrorQ[17],timingErrorQ};
assign timingErrorEn = (phaseState == ONTIME);

wire    [11:0]  syncThreshold;
wire    [17:0]  multihThreshold = {syncThreshold,6'b0};
wire    [17:0]  negMultihThreshold = ~{syncThreshold,6'b0} + 1;

// DC Offset error variables
reg  [17:0]dcError;
wire offsetEn = (phaseState == OFFTIME);

// Deviation variables
reg  [17:0]deviation;
`ifdef SYM_DEVIATION
wire [17:0]absDeviation = deviation[17] ? (~deviation + 1) : deviation;
`else
wire [17:0]absDeviation = (~deviation + 1);
`endif

reg  stateMachineSlip;
`ifdef ENABLE_SMSLIP
wire slip = stateMachineSlip;
`else
wire slip = 1'b0;
`endif
reg slipped;
reg  [17:0]slipError;
wire [17:0]absError = timingErrorI[17] ? (~timingErrorI + 1) : timingErrorI;
wire [17:0]absSlipError = slipError[17] ? (~slipError + 1) : slipError;
reg  [21:0]avgError;
reg  [21:0]avgSlipError;
reg  [3:0]avgCount;
reg  dcErrorAvailable;
reg  transition;
reg  [1:0]noTransitionCount;
reg  [1:0]transitionCount;

wire fmModes = ( (demodMode == `MODE_2FSK)
              || (demodMode == `MODE_MULTIH)
              || (demodMode == `MODE_PCMTRELLIS)
              || (demodMode == `MODE_FM)
               );
always @(posedge sampleClk) begin
    if (reset) begin
        phaseState <= ONTIME;
        slipState <= AVERAGE;
        slipped <= 0;
        timingErrorI <= 0;
        timingErrorQ <= 0;
        dcError <= 0;
        avgCount <= 15;
        avgError <= 0;
        avgSlipError <= 0;
        end
    else if (symTimes2Sync) begin
        // Shift register of baseband sample values
        if (fmModes) begin
            bbSRI[0] <= freq;
            bbSRQ[0] <= freq;
            end
        else if (demodMode == `MODE_PM) begin
            bbSRI[0] <= {phase,6'b0};
            bbSRQ[0] <= {phase,6'b0};
            end
        else if (bitsyncMode == `MODE_DUAL_RAIL) begin
            bbSRI[0] <= iMF;
            bbSRQ[0] <= qMF;
            end
        else begin
            bbSRI[0] <= iMF;
            bbSRQ[0] <= iMF;
            end
        bbSRI[1] <= bbSRI[0];
        bbSRI[2] <= bbSRI[1];
        bbSRI[3] <= bbSRI[2];
        bbSRQ[1] <= bbSRQ[0];
        bbSRQ[2] <= bbSRQ[1];
        case (phaseState)
            ONTIME: begin
                `ifdef ENABLE_SLIP
                if (slip && ~slipped) begin
                    phaseState <= ONTIME;
                    end
                else begin
                    phaseState <= OFFTIME;
                    end
                `else
                phaseState = OFFTIME;
                `endif
                slipped <= slip;
                end
            OFFTIME: begin
                phaseState <= ONTIME;
                if (demodMode == `MODE_MULTIH) begin
                    // Are the early and late symbols opposite polarity?
                    if (earlySignI != lateSignI) begin
                        // Yes. Are they of the same deviation?
                        if ( (absEarlyI < multihThreshold) && (absLateI < multihThreshold)
                            || (absEarlyI >= multihThreshold) && (absLateI >= multihThreshold)) begin
                            // Yes.
                            transition <= 1;
                            // High to low?
                            if (earlySignI) begin
                                timingErrorI <= offTimeI;
                                slipError <= lateOnTimeI;
                                end
                            // Or low to high?
                            else begin
                                timingErrorI <= negoffTimeI;
                                slipError <= earlyOnTimeI;
                                end
                            end
                        else begin
                            transition <= 0;
                            timingErrorI <= 8'h0;
                            timingErrorQ <= 8'h0;
                            end
                        end
                    else begin
                        transition <= 0;
                        timingErrorI <= 8'h0;
                        timingErrorQ <= 8'h0;
                        end
                    end
                else begin
                    // Is there a data transition on I?
                    if (earlySignI != lateSignI) begin
                        // Yes. Calculate DC offset error
                        transition <= 1;
                        noTransitionCount <= 0;
                        transitionCount <= transitionCount + 1;
                        //dcError <= offTimeI + prevOffTimeI;
                        dcError <= offTimeI;
                        dcErrorAvailable <= 1;

                        // High to low transition?
                        if (earlySignI) begin
                            timingErrorI <= offTimeI;
                            slipError <= lateOnTimeI;
                            end
                        // Or low to high?
                        else begin
                            timingErrorI <= negoffTimeI;
                            slipError <= earlyOnTimeI;
                            end
                        end
                    else begin
                        transition <= 0;
                        transitionCount <= 0;
                        if (noTransitionCount < 3) begin
                            noTransitionCount <= noTransitionCount + 1;
                            end
                        dcError <= 18'h00;
                        dcErrorAvailable <= 0;
                        timingErrorI <= 18'h00;
                        //deviation <= offTimeI;
                        deviation <= earlyOnTimeI;
                        end
                    // Is there a data transition on Q?
                    if (earlySignQ != lateSignQ) begin
                        // High to low transition?
                        if (earlySignQ) begin
                            timingErrorQ <= offTimeQ;
                            end
                        // Or low to high?
                        else begin
                            timingErrorQ <= negoffTimeQ;
                            end
                        end
                    else begin
                        timingErrorQ <= 18'h00;
                        end
                    end
                end
            endcase
        // Slip state machine
        case (slipState)
            AVERAGE: begin
                stateMachineSlip <= 0;
                if (timingErrorEn && transition) begin
                    avgError <= avgError + {4'b0,absError};
                    avgSlipError <= avgSlipError + {4'b0,absSlipError};
                    if (avgCount == 0) begin
                        slipState <= TEST;
                        end
                    else begin
                        avgCount <= avgCount - 1;
                        end
                    end
                end
            TEST: begin
                avgCount <= 15;
                avgError <= 0;
                avgSlipError <= 0;
                if (avgSlipError < {1'b0,avgError[21:1]}) begin
                    slipState <= SLIP0;
                    stateMachineSlip <= 1;
                    end
                else begin
                    slipState <= AVERAGE;
                    end
                end
            SLIP0: begin
                stateMachineSlip <= 0;
                slipState <= SLIP1;
                end
            SLIP1: begin
                stateMachineSlip <= 0;
                slipState <= AVERAGE;
                end
            endcase
        end
    end

`ifdef SIMULATE
wire    [17:0]  timingErr = timingError[18:1];
real timingErrorReal;
real iMFReal;
real qMFReal;
always @(timingErr) timingErrorReal = ((timingErr > 131071.0) ? timingErr - 262144.0 : timingErr)/131072.0;
always @(iMF) iMFReal = (iMF[17] ? iMF - 262144.0 : iMF)/131072.0;
always @(qMF) qMFReal = (qMF[17] ? qMF - 262144.0 : qMF)/131072.0;
`endif


//`define NEW_OFFSET_ERROR
`ifdef NEW_OFFSET_ERROR

reg     [17:0]  iMF0;
reg     [17:0]  qMF0;
wire    [35:0]  term1,term2;
mpy18x18WithCe mult1(
    .clk(sampleClk),
    .ce(symTimes2Sync),
    .a(qMF0),
    .b(iMF),
    .p(term1)
    );
mpy18x18WithCe mult2(
    .clk(sampleClk),
    .ce(symTimes2Sync),
    .a(iMF0),
    .b(qMF),
    .p(term2)
    );

wire    [35:0]  diff = term2 - term1;
wire    [17:0]  mpyFreq = diff[34:17];
always @(posedge sampleClk) begin
    if (symTimes2Sync) begin
        iMF0 <= iMF;
        qMF0 <= qMF;
        end
    end

reg     [17:0]  prevMidSample;
reg     [17:0]  afcError;
reg             prevSign;
reg             bitTransition;
always @(posedge sampleClk) begin
    if (symTimes2Sync) begin
        if (timingErrorEn) begin
            if (prevSign != mpyFreq[17]) begin
                bitTransition <= 1;
                end
            else begin
                bitTransition <= 0;
                end
            prevSign <= mpyFreq[17];
            end
        else begin
            if (bitTransition) begin
                afcError <= prevMidSample;
                end
            else begin
                afcError <= 0;
                end
            prevMidSample <= mpyFreq;
            end
        end
    end
assign          offsetError = afcError;
assign          offsetErrorEn = !timingErrorEn;

`ifdef SIMULATE
real mpyFreqReal;
always @* mpyFreqReal = $itor($signed(mpyFreq))/(2**17);
`endif

`else   //NEW_OFFSET_ERROR

assign          offsetError = dcError;
assign          offsetErrorEn = offsetEn;

`endif  //NEW_OFFSET_ERROR



// Calculation of average DC offset (freq offset in FSK mode) and average FSK deviation.
`ifdef SYM_DEVIATION
reg     [24:0]  avgDeviation;
`else
reg     [24:0]  avgPosDeviation;
reg     [24:0]  avgNegDeviation;
`endif
reg     [24:0]  avgOffsetError;
//assign          offsetError = avgOffsetError[24:7];
always @(posedge sampleClk) begin
    if (reset) begin
        avgOffsetError <= 0;
        `ifdef SYM_DEVIATION
        avgDeviation <= 0;
        `else
        avgPosDeviation <= 0;
        avgNegDeviation <= 0;
        `endif
        end
    else if (symTimes2Sync) begin
        if (offsetEn && dcErrorAvailable) begin
            avgOffsetError <= (avgOffsetError - {{7{avgOffsetError[24]}},avgOffsetError[24:7]})
                            + {{7{dcError[17]}},dcError};
            end
        `ifdef SYM_DEVIATION
        if (offsetEn && (noTransitionCount > 1)) begin
            avgDeviation <= (avgDeviation - {{7{avgDeviation[24]}},avgDeviation[24:7]})
                          + {{7{absDeviation[17]}},absDeviation};
            end
        `else
        if (offsetEn && (noTransitionCount > 1)) begin
            if (deviation[17]) begin
                avgNegDeviation <= (avgNegDeviation - {{7{avgNegDeviation[24]}},avgNegDeviation[24:7]})
                                 + {{7{absDeviation[17]}},absDeviation};
                end
            else begin
                avgPosDeviation <= (avgPosDeviation - {{7{avgPosDeviation[24]}},avgPosDeviation[24:7]})
                                 + {{7{deviation[17]}},deviation};
                end
            end
        `endif
        end
    end
`ifdef SYM_DEVIATION
assign fskDeviation = avgDeviation[24:9];
`else
assign posDeviation = avgPosDeviation[24:9];
assign negDeviation = avgNegDeviation[24:9];
`endif

`ifdef SIMULATE
real avgOffsetReal = (avgOffsetError[24] ? avgOffsetError[24:7] - 262144.0 : avgOffsetError[24:7])/131072.0;
`ifdef SYM_DEVIATION
real avgDevReal = (avgDeviation[24] ? avgDeviation[24:7] - 262144.0 : avgDeviation[24:7])/131072.0;
`else
real avgPosDevReal;
always @* avgPosDevReal = $itor($signed(avgPosDeviation))/(2**17);
real avgNegDevReal;
always @* avgNegDevReal = $itor($signed(avgNegDeviation))/(2**17);
`endif
`endif

//******************************** Loop Filter ********************************

reg bitsyncSpace;
always @* begin
    casex(addr)
        `BITSYNCSPACE:  bitsyncSpace = 1;
        default:        bitsyncSpace = 0;
        endcase
    end
wire    [15:0]  lockCount;
reg             loopFilterEn;
reg     [11:0]  loopFilterError;
always @* begin
    casex (demodMode) 
        default: begin
            loopFilterError = timingError[18:7] + timingError[6];
            loopFilterEn = (symTimes2Sync & timingErrorEn);
        end
    endcase
end
wire    [31:0]  bsDout;
loopFilter sampleLoop(
    .clk(sampleClk),
    .clkEn(loopFilterEn),
    .reset(reset),
    .cs(bitsyncSpace),
    .wr0(wr0),.wr1(wr1),.wr2(wr2),.wr3(wr3),
    .addr(addr),
    .din(din),
    .dout(bsDout),
    .error(loopFilterError),
    .loopFreq(sampleFreq),
    .ctrl2(useCompFilter),
    .ctrl4(useSummer),
    .satPos(satPos),
    .satNeg(satNeg),
    .lockCount(lockCount),
    .syncThreshold(syncThreshold)
    );

`define RECLOCK_BSERROR
`ifdef RECLOCK_BSERROR
reg     [17:0]  bsError;
reg             bsErrorEn;
always @(posedge sampleClk) begin
    bsError <= timingError[18:1] + timingError[0];
    bsErrorEn <= loopFilterEn;
    end
`else
assign bsError = timingError[18:1] + timingError[0];
assign bsErrorEn = loopFilterEn;
`endif


//************************** Lock Detector ************************************

reg     [15:0]  lockCounter;
wire    [16:0]  lockPlus = {1'b0,lockCounter} + 17'h00001;
wire    [16:0]  lockMinus = {1'b0,lockCounter} + 17'h1ffff;
reg             bitsyncLock;
always @(posedge sampleClk) begin
    if (reset) begin
        lockCounter <= 0;
        bitsyncLock <= 0;
        end
    else if (symTimes2Sync) begin
        if (slipState == TEST) begin
            if (avgError[21:14] > {1'b0,avgSlipError[21:15]}) begin
                if (lockCounter == (16'hffff-lockCount)) begin
                    bitsyncLock <= 0;
                    lockCounter <= 16'h0;
                    end
                else begin
                    lockCounter <= lockMinus[15:0];
                    end
                end
            else begin
                if (lockCounter == lockCount) begin
                    bitsyncLock <= 1;
                    lockCounter <= 16'h0;
                    end
                else begin
                    lockCounter <= lockPlus[15:0];
                    end
                end
            end
        end
    end


`ifdef SIMULATE
real sampleFreqReal;
always @(sampleFreq) sampleFreqReal = ((sampleFreq > 2147483647.0) ? sampleFreq-4294967296.0 : sampleFreq)/2147483648.0;
`endif


//*****************************************************************************
//                  Asymmetric, Unbalanced QPSK Support
//*****************************************************************************
/*
**  This creates a second bitsync that is completely independent of the primary
**  bitsync given above. This allows the data and clock from a QPSK signal which 
**  has two bitstreams which are unrelated in terms of bitrate to be recovered
**  and output on the two clock/data outputs.
**
******************************************************************************/

wire auEnable = ((demodMode == `MODE_AQPSK) || (demodMode == `MODE_AUQPSK));

//****************************** Two Sample Sum *******************************
reg     [17:0]  auDelay;
reg     [17:0]  auMF;
wire    [18:0]  auSum = {auDelay[17],auDelay} + {au[17],au};
always @(posedge sampleClk) begin
    if (auResampSync) begin
        auDelay <= au;
        auMF <= auSum[18:1];
        end
    end

//******************************* Phase Error Detector ************************

// State machine:
//      Based on two clocks per symbol

reg auPhaseState;

// Fifo of baseband inputs
reg [17:0]auSR[2:0];

// Timing error variables
wire auEarlySign = auSR[2][17];
wire auLateSign = auSR[0][17];
wire [17:0]auEarlyOnTime = auSR[2];
wire [17:0]auLateOnTime = auSR[0];
wire [17:0]auOffTime = auSR[1];
wire [17:0]negAuOffTime = (~auOffTime + 1);

reg  [17:0]auOffTimeLevel;
wire auTimingErrorEn = (auPhaseState == ONTIME);

reg  [17:0]auOnTimeLevel;
reg  auTransition;
always @(posedge sampleClk) begin
    if (!auEnable) begin
        auPhaseState <= ONTIME;
        auOffTimeLevel <= 0;
        end
    else if (auResampSync) begin
        // Shift register of baseband sample values
        auSR[0] <= auMF;
        auSR[1] <= auSR[0];
        auSR[2] <= auSR[1];
        case (auPhaseState)
            ONTIME: begin
                auPhaseState <= OFFTIME;
                end
            OFFTIME: begin
                auPhaseState <= ONTIME;
                // Is there a data transition on I?
                if (auEarlySign != auLateSign) begin
                    // Yes. 
                    auTransition <= 1;
                    // High to low transition?
                    if (auEarlySign) begin
                        auOffTimeLevel <= auOffTime;
                        auOnTimeLevel <= auLateOnTime;
                        end
                    // Or low to high?
                    else begin
                        auOffTimeLevel <= negAuOffTime;
                        auOnTimeLevel <= auEarlyOnTime;
                        end
                    end
                else begin
                    auTransition <= 0;
                    auOffTimeLevel <= 18'h00;
                    end
                end
            endcase
        end
    end

`ifdef SIMULATE
wire    [17:0]  auTimingErr = auOffTimeLevel;
real auTimingErrorReal;
always @(auTimingErr) auTimingErrorReal = ((auTimingErr > 131071.0) ? auTimingErr - 262144.0 : auTimingErr)/131072.0;
`endif

//******************************** Loop Filter ********************************

reg auBitsyncSpace;
always @* begin
    casex(addr)
        `BITSYNCAUSPACE:    auBitsyncSpace = 1;
        default:            auBitsyncSpace = 0;
        endcase
    end

wire    [31:0]  auDout;
wire    [15:0]  auLockCount;
wire    [11:0]   auSyncThreshold;
wire            auLoopFilterEn = (auResampSync & auTimingErrorEn);
loopFilter auSampleLoop(
    .clk(sampleClk),
    .clkEn(auLoopFilterEn),
    .reset(reset),
    .cs(auBitsyncSpace),
    .wr0(wr0),.wr1(wr1),.wr2(wr2),.wr3(wr3),
    .addr(addr),
    .din(din),
    .dout(auDout),
    .error(auOffTimeLevel[17:6] + auOffTimeLevel[5]),
    .loopFreq(auSampleFreq),
    .lockCount(auLockCount),
    .syncThreshold(auSyncThreshold)
    );


//************************** Lock Detector ************************************

reg     [1:0]   auAvgState;
wire    [7:0]   auSwapCount = auSyncThreshold[7:0];
reg     [7:0]   auSwapCounter;
reg             auIQSwap;
reg     [15:0]  auLockCounter;
wire    [16:0]  auLockPlus = {1'b0,auLockCounter} + 17'h00001;
wire    [16:0]  auLockMinus = {1'b0,auLockCounter} + 17'h1ffff;
reg             auBitsyncLock;
wire    [17:0]  auOffTimeMag = auOffTimeLevel[17] ? (~auOffTimeLevel + 1) : auOffTimeLevel;
wire    [17:0]  auOnTimeMag = auOnTimeLevel[17] ? (~auOnTimeLevel + 1) : auOnTimeLevel;
reg     [21:0]  avgAuOffTimeMag;
reg     [21:0]  avgAuOnTimeMag;
reg     [3:0]   auAvgCount;
always @(posedge sampleClk) begin
    if (!auEnable) begin
        auAvgState <= AVERAGE;
        auLockCounter <= 0;
        auBitsyncLock <= 0;
        auAvgCount <= 15;
        avgAuOffTimeMag <= 0;
        avgAuOnTimeMag <= 0;
        auIQSwap <= 0;
        auSwapCounter <= auSwapCount;
        end
    else if (auResampSync) begin
        // Averaging state machine
        case (auAvgState)
            AVERAGE: begin
                if (auTimingErrorEn && auTransition) begin
                    avgAuOffTimeMag <= avgAuOffTimeMag + {4'b0,auOffTimeMag};
                    avgAuOnTimeMag <= avgAuOnTimeMag + {4'b0,auOnTimeMag};
                    if (auAvgCount == 0) begin
                        auAvgState <= TEST;
                        end
                    else begin
                        auAvgCount <= auAvgCount - 1;
                        end
                    end
                end
            TEST: begin
                auAvgCount <= 15;
                avgAuOffTimeMag <= 0;
                avgAuOnTimeMag <= 0;
                auAvgState <= AVERAGE;
                end
            endcase
        if (auAvgState == TEST) begin
            if (avgAuOffTimeMag[21:14] > {1'b0,avgAuOnTimeMag[21:15]}) begin
                if (auLockCounter == (16'hffff - auLockCount)) begin
                    auBitsyncLock <= 0;
                    auLockCounter <= 16'h0;
                    if (bitsyncLock) begin
                        if (auSwapCounter > 0) begin
                            auSwapCounter <= auSwapCounter - 1;
                            end
                        else begin
                            auSwapCounter <= auSwapCount;
                            auIQSwap <= ~auIQSwap;
                            end
                        end
                    else begin
                        auSwapCounter <= auSwapCount;
                        auIQSwap <= ~auIQSwap;
                        end
                    end
                else begin
                    auLockCounter <= auLockMinus[15:0];
                    end
                end
            else begin
                if (auLockCounter == auLockCount) begin
                    auBitsyncLock <= 1;
                    auLockCounter <= 16'h0;
                    auSwapCounter <= auSwapCount;
                    end
                else begin
                    auLockCounter <= auLockPlus[15:0];
                    end
                end
            end
        end
    end

//************************** I/Q Swap State Machine ***************************
always @(posedge sampleClk) begin
    if (!auEnable ) begin
        end
    else if (auResampSync) begin
        
        end
    end


/******************************************************************************
                                uP dout mux
******************************************************************************/
reg [31:0]dout;
always @* begin
    casex (addr)
        `BITSYNCSPACE:      dout = bsDout;
        `BITSYNCAUSPACE:    dout = auDout;
        default:            dout = 32'bx;
        endcase
    end




/******************************************************************************
                           Recovered Clock and Data 
******************************************************************************/


reg     [17:0]  symDataI;
reg     [17:0]  symDataQ;
reg             bitDataI;
reg             bitDataQ;

`define ENABLE_MULTIH
`ifdef ENABLE_MULTIH
always @(posedge sampleClk) begin
    if (symTimes2Sync) begin
        // Capture the I output sample
        symDataI <= bbSRI[1];
        if (timingErrorEn) begin
            if (fmModes) begin
                bitDataI <= ~bbSRI[1][17];
                end
            else begin
                bitDataI <= bbSRI[1][17];
                end
            end
        end
    if (auEnable) begin
        if (auResampSync) begin
            symDataQ <= auSR[1];
            if (auTimingErrorEn) begin
                bitDataQ <= auSR[1][17];
                end
            end
        end
    else begin
        if (symTimes2Sync) begin
            // Capture the Q output sample
            if (demodMode == `MODE_MULTIH) begin
                symDataQ <= bbSRQ[1];
                if (timingErrorEn) begin
                    if (bbSRQ[1][17]) begin
                        bitDataQ <= (bbSRQ[1] < negMultihThreshold);
                        end
                    else begin
                        bitDataQ <= (bbSRQ[1] < multihThreshold);
                        end
                    end
                end
            else begin
                symDataQ <= bbSRQ[1];
                if (timingErrorEn) begin
                    bitDataQ <= bbSRQ[1][17];
                    end
                end
            end
        end
    end
`else
always @(posedge sampleClk) begin
    if (symTimes2Sync) begin
        // Capture the I output sample
        symDataI <= bbSRI[1];
        if (timingErrorEn) begin
            if (fmModes) begin
                bitDataI <= ~bbSRI[1][17];
                end
            else begin
                bitDataI <= bbSRI[1][17];
                end
            end
        end
    if (auEnable) begin
        if (auResampSync) begin
            symDataQ <= auSR[1];
            if (auTimingErrorEn) begin
                bitDataQ <= auSR[1][17];
                end
            end
        end
    else begin
        if (symTimes2Sync) begin
            // Capture the Q output sample
            symDataQ <= bbSRQ[1];
            if (timingErrorEn) begin
                bitDataQ <= bbSRQ[1][17];
                end
            end
        end
    end
`endif

// Clock Enables
assign iSym2xEn = symTimes2Sync;
assign iSymEn = symTimes2Sync & timingErrorEn;
assign iSymClk = timingErrorEn;
assign qSym2xEn = auEnable ? auResampSync : symTimes2Sync;
assign qSymEn = auEnable ? (auResampSync & auTimingErrorEn) : (symTimes2Sync & timingErrorEn);
assign qSymClk = auTimingErrorEn;


`ifdef SIMULATE
real symDataIReal;
always @(symDataI) symDataIReal = (symDataI[17] ? symDataI - 262144.0 : symDataI)/131072.0;
`endif

endmodule


