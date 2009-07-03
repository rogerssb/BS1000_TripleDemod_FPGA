`include "./addressMap.v"
`timescale 1ns/1ps

`define ENABLE_SLIP

module bitsync(
    sampleClk, reset, 
    symTimes2Sync,
    auResampSync,
    demodMode,
    bitsyncMode,
    wr0,wr1,wr2,wr3,
    addr,
    din,
    dout,
    i,q,
    offsetError,
    offsetErrorEn,
    fskDeviation,
    symClk,
    symDataI,
    symDataQ,
    symPhase,
    symPhaseSync,
    bitClk,
    bitDataI,
    bitDataQ,
    sampleFreq,
    bitsyncLock,
    lockCounter,
    iMF,qMF
    );

input           sampleClk;
input           reset;
input           symTimes2Sync;
input           auResampSync;
input   [3:0]   demodMode;
input   [1:0]   bitsyncMode;
input           wr0,wr1,wr2,wr3;
input   [11:0]  addr;
input   [31:0]  din;
output  [31:0]  dout;
input   [17:0]  i,q;
output  [17:0]  offsetError;
output          offsetErrorEn;
output  [15:0]  fskDeviation;
output          symClk;
output  [17:0]  symDataI;
output  [17:0]  symDataQ;
output  [7:0]   symPhase;
output          symPhaseSync;
output          bitClk;
output          bitDataI;
output          bitDataQ;
output  [31:0]  sampleFreq;
output          bitsyncLock;
output  [15:0]  lockCounter;
output  [17:0]  iMF,qMF;

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
reg     [17:0]  iMF,qMF;
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
            iMF <= iSum[18:1];
            qMF <= qSum[18:1];
            end
        else begin
            iMF <= iDelay;
            qMF <= qDelay;
            end
        end
    end
`else

//****************************** Two Sample Sum *******************************
reg     [17:0]  iDelay,qDelay;
reg     [17:0]  iMF,qMF;
wire    [18:0]  iSum = {iDelay[17],iDelay} + {i[17],i};
wire    [18:0]  qSum = {qDelay[17],qDelay} + {q[17],q};
always @(posedge sampleClk) begin
    if (symTimes2Sync) begin
        iDelay <= i;
        qDelay <= q;
        iMF <= iSum[18:1];
        qMF <= qSum[18:1];
        end
    end
`endif

//************************** Frequency Discriminator **************************
`define USE_FMDEMOD
`ifdef USE_FMDEMOD
wire    [7:0]   phase;
wire    [7:0]   freqOut;
wire    [8:0]   mag;
fmDemod fmDemod( 
    .clk(sampleClk), .reset(reset), .sync(symTimes2Sync),
    .iFm(iMF),.qFm(qMF),
    .phase(phase),
    .freq(freqOut),
    .mag(mag)
    );
wire    [17:0]  freq = {freqOut,10'b0};
`else
reg     [17:0]  iMF0,iMF1;
reg     [17:0]  qMF0,qMF1;
wire    [35:0]  term1,term2;
mpy18x18 mult1(.clk(sampleClk), 
                .sclr(reset),
                .a(qMF1), 
                .b(iMF), 
                .p(term1)
                );
mpy18x18 mult2(.clk(sampleClk), 
                .sclr(reset),
                .a(iMF1), 
                .b(qMF), 
                .p(term2)
                );

wire    [35:0]  diff = term1 - term2;
reg     [17:0]  freq;
always @(posedge sampleClk) begin
    if (symTimes2Sync) begin
        iMF0 <= iMF;
        iMF1 <= iMF0;
        qMF0 <= qMF;
        qMF1 <= qMF0;
        freq <= diff[35:18];
        end
end
`endif

`ifdef SIMULATE
real freqReal;
real phaseReal;
always @(freq) freqReal = ((freq > 131071.0) ? freq - 262144.0 : freq)/131072.0;
always @(phase) phaseReal = ((phase > 127.0) ? phase - 256.0: phase)/256.0;
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
reg [17:0]bbSRI[2:0];
reg [17:0]bbSRQ[2:0];

// Timing error variables
wire earlySignI = bbSRI[2][17];
wire lateSignI = bbSRI[0][17];
wire [17:0]earlyOnTimeI = bbSRI[2];
wire [17:0]lateOnTimeI = bbSRI[0];
wire [17:0]offTimeI = bbSRI[1];
wire [17:0]negoffTimeI = (~offTimeI + 1);
wire earlySignQ = bbSRQ[2][17];
wire lateSignQ = bbSRQ[0][17];
wire [17:0]earlyOnTimeQ = bbSRQ[2];
wire [17:0]lateOnTimeQ = bbSRQ[0];
wire [17:0]offTimeQ = bbSRQ[1];
wire [17:0]negoffTimeQ = (~offTimeQ + 1);

reg  [17:0]timingErrorI;
reg  [17:0]timingErrorQ;
wire    [18:0]  timingError = {timingErrorI[17],timingErrorI} + {timingErrorQ[17],timingErrorQ};
wire timingErrorEn = (phaseState == ONTIME);

// DC Offset error variables
wire [18:0]offsetErrorSum = {bbSRI[2][17],bbSRI[2]} + {bbSRI[0][17],bbSRI[0]};
reg  [17:0]dcError;
wire offsetErrorEn = (phaseState == OFFTIME);

// Deviation variables
reg  [17:0]deviation;
wire [17:0]absDeviation = deviation[17] ? (~deviation + 1) : deviation;

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
reg  transition;
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
        if ((demodMode == `MODE_2FSK) || (demodMode == `MODE_PCMTRELLIS))begin
            bbSRI[0] <= freq;
            bbSRQ[0] <= freq;
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
                // Is there a data transition on I?
                if (earlySignI != lateSignI) begin
                    // Yes. Calculate DC offset error
                    transition <= 1;
                    if (offsetErrorSum[18:17] == 2'b10) begin
                        dcError <= 18'h20001;
                        end
                    else if (offsetErrorSum[18:17] == 2'b01) begin
                        dcError <= 18'h1ffff;
                        end
                    else begin
                        dcError <= offsetErrorSum[17:0];
                        end
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
                    dcError <= 18'h00;
                    timingErrorI <= 18'h00;
                    deviation <= offTimeI;
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


// Calculation of average DC offset (freq offset in FSK mode) and average FSK deviation.
reg     [24:0]  avgDeviation;
reg     [24:0]  avgOffsetError;
assign          offsetError = avgOffsetError[24:7];
always @(posedge sampleClk) begin
    if (reset) begin
        avgOffsetError <= 0;
        avgDeviation <= 0;
        end
    else if (symTimes2Sync) begin
        if (offsetErrorEn) begin
            avgOffsetError <= (avgOffsetError - {{7{avgOffsetError[24]}},avgOffsetError[24:7]})
                            + {{7{dcError[17]}},dcError};
            end
        if (offsetErrorEn && !transition) begin
            avgDeviation <= (avgDeviation - {{7{avgDeviation[24]}},avgDeviation[24:7]})
                          + {{7{absDeviation[17]}},absDeviation};
            end
        end
    end
assign fskDeviation = avgDeviation[24:9];

`ifdef SIMULATE
real avgOffsetReal = (avgOffsetError[24] ? avgOffsetError[24:7] - 262144.0 : avgOffsetError[24:7])/131072.0;
real avgDevReal = (avgDeviation[24] ? avgDeviation[24:7] - 262144.0 : avgDeviation[24:7])/131072.0;
`endif

//************************ Recovered Clock and Data ***************************

reg     [17:0]  symDataI;
reg     [17:0]  symDataQ;
reg     [7:0]   symPhase;
reg             enSR[9:0];
assign          symPhaseSync = enSR[9];
reg             bitDataI;
reg             bitDataQ;
always @(posedge sampleClk) begin
    if (symTimes2Sync) begin
        // Delay the clock enable to match the delay through the fmDemod
        enSR[0] <= timingErrorEn;
        enSR[1] <= enSR[0];
        enSR[2] <= enSR[1];
        enSR[3] <= enSR[2];
        enSR[4] <= enSR[3];
        enSR[5] <= enSR[4];
        enSR[6] <= enSR[5];
        enSR[7] <= enSR[6];
        enSR[8] <= enSR[7];
        enSR[9] <= enSR[8];
        // Capture the output samples
        symDataI <= bbSRI[1];
        symDataQ <= bbSRQ[1];
        if (symPhaseSync) begin
            symPhase <= phase;
            end
        if (timingErrorEn) begin
            bitDataI <= bbSRI[1][17];
            bitDataQ <= bbSRQ[1][17];
            end
        end
    end


assign symClk = timingErrorEn;

assign bitClk  = symClk;

`ifdef SIMULATE
real symDataIReal;
real symPhaseReal;
always @(symDataI) symDataIReal = (symDataI[17] ? symDataI - 262144.0 : symDataI)/131072.0;
always @(symPhase) symPhaseReal = (symPhase[7] ? symPhase - 256.0 : symPhase)/128.0;
`endif
//******************************** Loop Filter ********************************

reg bitsyncSpace;
always @(addr) begin
    casex(addr)
        `BITSYNCSPACE:  bitsyncSpace <= 1;
        default:        bitsyncSpace <= 0;
        endcase
    end
wire    [15:0]  lockCount;
wire    [7:0]   syncThreshold;
wire            loopFilterEn = (symTimes2Sync & timingErrorEn);
loopFilter sampleLoop(.clk(sampleClk),
                      .clkEn(loopFilterEn),
                      .reset(reset),
                      .cs(bitsyncSpace),
                      .wr0(wr0),.wr1(wr1),.wr2(wr2),.wr3(wr3),
                      .addr(addr),
                      .din(din),
                      .dout(dout),
                      .error(timingError[18:11]),
                      .loopFreq(sampleFreq),
                      .ctrl2(useCompFilter),
                      .ctrl4(useSummer),
                      .satPos(satPos),
                      .satNeg(satNeg),
                      .lockCount(lockCount),
                      .syncThreshold(syncThreshold)
                      );

//************************** Lock Detector ************************************

`define NEW_DETECTOR
`ifdef NEW_DETECTOR
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
            //if (avgError[21:14] > syncThreshold) begin
            if (avgError[21:14] > {1'b0,avgSlipError[21:15]}) begin
                if (lockMinus[16]) begin
                    bitsyncLock <= 0;
                    lockCounter <= lockCount;
                    end
                else begin
                    lockCounter <= lockMinus[15:0];
                    end
                end
            else begin
                if (lockPlus[16]) begin
                    bitsyncLock <= 1;
                    lockCounter <= lockCount;
                    end
                else begin
                    lockCounter <= lockPlus[15:0];
                    end
                end
            end
        end
    end

`else

reg     [15:0]  lockCounter;
wire    [16:0]  lockPlus = {1'b0,lockCounter} + 17'h00001;
wire    [16:0]  lockMinus = {1'b0,lockCounter} - {2'b0,syncThreshold};
reg             bitsyncLock;
always @(posedge sampleClk) begin
    if (reset) begin
        lockCounter <= 0;
        bitsyncLock <= 0;
        end
    else if (loopFilterEn) begin
        if (satPos || satNeg) begin
            if (lockMinus[16]) begin
                bitsyncLock <= 0;
                lockCounter <= lockCount;
                end
            else begin
                lockCounter <= lockMinus[15:0];
                end
            end
        else begin
            if (lockPlus[16]) begin
                bitsyncLock <= 1;
                lockCounter <= lockCount;
                end
            else begin
                lockCounter <= lockPlus[15:0];
                end
            end
        end
    end

`endif

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

//****************************** Two Sample Sum *******************************
reg     [17:0]  auDelay;
reg     [17:0]  auMF;
wire    [18:0]  auSum = {auDelay[17],auDelay} + {au[17],au};
always @(posedge sampleClk) begin
    if (symTimes2Sync) begin
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
wire [17:0]auOffTimeMag = auOffTimeLevel[17] ? (~auOffTimeLevel + 1) : auOffTimeLevel;
wire [17:0]auOnTimeMag = auOnTimeLevel[17] ? (~auOnTimeLevel + 1) : auOnTimeLevel;
reg  [21:0]avgAuOffTimeMag;
reg  [21:0]avgAuOnTimeMag;
reg  [3:0]auAvgCount;
reg  auTransition;
always @(posedge sampleClk) begin
    if (reset) begin
        auPhaseState <= ONTIME;
        slipState <= AVERAGE;
        slipped <= 0;
        auOffTimeLevel <= 0;
        auAvgCount <= 15;
        avgAuOffTimeMag <= 0;
        avgAuOnTimeMag <= 0;
        end
    else if (symTimes2Sync) begin
        // Shift register of baseband sample values
        auSR[0] <= qMF;
        auSR[1] <= auSR[0];
        auSR[2] <= auSR[1];
        case (auPhaseState)
            ONTIME: begin
                auPhaseState = OFFTIME;
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
                if (avgAuOnTimeMag < {1'b0,avgAuOffTimeMag[21:1]}) begin
                    slipState <= SLIP0;
                    stateMachineSlip <= 1;
                    end
                else begin
                    slipState <= AVERAGE;
                    end
                end


endmodule


