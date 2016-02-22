/******************************************************************************
Copyright 2008-2015 Koos Technical Services, Inc. All Rights Reserved

This source code is the Intellectual Property of Koos Technical Services,Inc. 
(KTS) and is provided under a License Agreement which protects KTS' ownership and
derivative rights in exchange for negotiated compensation.
******************************************************************************/

`include "./addressMap.v"
`timescale 1ns/1ps

`define ENABLE_SLIP

module dualBitsync(
    sampleClk, reset, 
    ch0ClkEn,
    ch1ClkEn,
    bitsyncMode,
    `ifdef USE_BUS_CLOCK
    busClk,
    `endif
    wr0,wr1,wr2,wr3,
    addr,
    din,
    dout,
    ch0,ch1,
    ch0Sym2xEn,
    ch0SymEn,
    ch0SymClk,
    ch0SymData,
    ch0BitData,
    ch1Sym2xEn,
    ch1SymEn,
    ch1SymClk,
    ch1SymData,
    ch1BitData,
    ch0SampleFreq,
    ch1SampleFreq,
    ch0BitsyncLock,
    ch0LockCounter,
    ch1BitsyncLock,
    ch1LockCounter,
    bsError,
    bsErrorEn
    );

input           sampleClk;
input           reset;
input           ch0ClkEn;
input           ch1ClkEn;
input   [1:0]   bitsyncMode;
`ifdef USE_BUS_CLOCK
input           busClk;
`endif
input           wr0,wr1,wr2,wr3;
input   [12:0]  addr;
input   [31:0]  din;
output  [31:0]  dout;
input   [17:0]  ch0,ch1;
output          ch0Sym2xEn;
output          ch0SymEn;
output          ch0SymClk;
output  [17:0]  ch0SymData;
output          ch0BitData;
output          ch1Sym2xEn;
output          ch1SymEn;
output          ch1SymClk;
output  [17:0]  ch1SymData;
output          ch1BitData;
output  [31:0]  ch0SampleFreq;
output  [31:0]  ch1SampleFreq;
output          ch0BitsyncLock;
output  [15:0]  ch0LockCounter;
output          ch1BitsyncLock;
output  [15:0]  ch1LockCounter;
output  [17:0]  bsError;
output          bsErrorEn;

//****************************** Two Sample Sum *******************************
wire            useSummer;
reg     [17:0]  ch0Delay,ch1Delay;
reg     [17:0]  ch0Filtered,ch1Filtered;
wire    [18:0]  ch0Sum = ({ch0Delay[17],ch0Delay} + {ch0[17],ch0});
wire    [18:0]  ch1Sum = ({ch1Delay[17],ch1Delay} + {ch1[17],ch1});
always @(posedge sampleClk) begin
    if (ch0ClkEn) begin
        ch0Delay <= ch0;
        ch1Delay <= ch1;
        if (useSummer) begin
            ch0Filtered <= ch0Sum[18:1];
            ch1Filtered <= ch1Sum[18:1];
            end
        else begin
            ch0Filtered <= ch0Delay;
            ch1Filtered <= ch1Delay;
            end
        end
    end

/******************************************************************************
                               Symbol Offset Deskew
******************************************************************************/
reg     [17:0]  ch0MF,ch1MF;
reg     [17:0]  ch0SymDelay,ch1SymDelay;
always @(posedge sampleClk) begin
    if (ch0ClkEn) begin
        ch0MF <= ch0Filtered;
        ch0SymDelay <= ch0Filtered;
        ch1SymDelay <= ch1Filtered;
        if (bitsyncMode == `MODE_OFFSET_CH) begin
            ch0MF <= ch0SymDelay;
            ch1MF <= ch1Filtered;
            end
        else begin
            ch0MF <= ch0Filtered;
            ch1MF <= ch1Filtered;
            end
        end
    end

//****************************** Timing Error Detector ************************

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
    else if (ch0ClkEn) begin
        // Shift register of baseband sample values
        casex (bitsyncMode)
            `MODE_DUAL_CH,
            `MODE_OFFSET_CH: begin
                bbSRI[0] <= ch0MF;
                bbSRQ[0] <= ch1MF;
                end
            default: begin
                bbSRI[0] <= ch0MF;
                bbSRQ[0] <= ch0MF;
                end
            endcase
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
                // Is there a data transition on I?
                if (earlySignI != lateSignI) begin
                    // Yes. Calculate DC offset error
                    transition <= 1;

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
real ch0MFReal;
real ch1MFReal;
always @(timingErr) timingErrorReal = ((timingErr > 131071.0) ? timingErr - 262144.0 : timingErr)/131072.0;
always @(ch0MF) ch0MFReal = (ch0MF[17] ? ch0MF - 262144.0 : ch0MF)/131072.0;
always @(ch1MF) ch1MFReal = (ch1MF[17] ? ch1MF - 262144.0 : ch1MF)/131072.0;
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
    loopFilterError = timingError[18:7] + timingError[6];
    loopFilterEn = (ch0ClkEn & timingErrorEn);
    end
wire    [31:0]  bsDout;
loopFilter sampleLoop(
    .clk(sampleClk),
    .clkEn(loopFilterEn),
    .reset(reset),
    `ifdef USE_BUS_CLOCK
    .busClk(busClk),
    `endif
    .cs(bitsyncSpace),
    .wr0(wr0),.wr1(wr1),.wr2(wr2),.wr3(wr3),
    .addr(addr),
    .din(din),
    .dout(bsDout),
    .error(loopFilterError),
    .loopFreq(ch0SampleFreq),
    .ctrl2(useMatchedFilter),
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

reg     [15:0]  ch0LockCounter;
wire    [16:0]  lockPlus = {1'b0,ch0LockCounter} + 17'h00001;
wire    [16:0]  lockMinus = {1'b0,ch0LockCounter} + 17'h1ffff;
reg             ch0BitsyncLock;
always @(posedge sampleClk) begin
    if (reset) begin
        ch0LockCounter <= 0;
        ch0BitsyncLock <= 0;
        end
    else if (ch0ClkEn) begin
        if (slipState == TEST) begin
            if (avgError[21:14] > {1'b0,avgSlipError[21:15]}) begin
                if (ch0LockCounter == (16'hffff-lockCount)) begin
                    ch0BitsyncLock <= 0;
                    ch0LockCounter <= 16'h0;
                    end
                else begin
                    ch0LockCounter <= lockMinus[15:0];
                    end
                end
            else begin
                if (ch0LockCounter == lockCount) begin
                    ch0BitsyncLock <= 1;
                    ch0LockCounter <= 16'h0;
                    end
                else begin
                    ch0LockCounter <= lockPlus[15:0];
                    end
                end
            end
        end
    end


`ifdef SIMULATE
real ch0SampleFreqReal;
always @* ch0SampleFreqReal = $itor($signed(ch0SampleFreq))/(2**31);
`endif


//*****************************************************************************
//               Second TED and Filter for Independent Channels
//*****************************************************************************
/*
**  This creates a second bitsync that is completely independent of the primary
**  bitsync given above. This allows the data and clock from a QPSK signal which 
**  has two bitstreams which are unrelated in terms of bitrate to be recovered
**  and output on the two clock/data outputs.
**
******************************************************************************/


wire asyncEnable = (bitsyncMode == `MODE_IND_RAIL);

//****************************** Two Sample Sum *******************************
reg     [17:0]  asyncDelay;
reg     [17:0]  asyncMF;
wire    [18:0]  asyncSum = {asyncDelay[17],asyncDelay} + {ch1[17],ch1};
always @(posedge sampleClk) begin
    if (ch1ClkEn) begin
        asyncDelay <= ch1;
        asyncMF <= asyncSum[18:1];
        end
    end

//******************************* Phase Error Detector ************************

// State machine:
//      Based on two clocks per symbol

reg asyncPhaseState;

// Fifo of baseband inputs
reg [17:0]asyncSR[2:0];

// Timing error variables
wire asyncEarlySign = asyncSR[2][17];
wire asyncLateSign = asyncSR[0][17];
wire [17:0]asyncEarlyOnTime = asyncSR[2];
wire [17:0]asyncLateOnTime = asyncSR[0];
wire [17:0]asyncOffTime = asyncSR[1];
wire [17:0]negAsyncOffTime = (~asyncOffTime + 1);

reg  [17:0]asyncOffTimeLevel;
wire asyncTimingErrorEn = (asyncPhaseState == ONTIME);

reg  [17:0]asyncOnTimeLevel;
reg  asyncTransition;
always @(posedge sampleClk) begin
    if (!asyncEnable) begin
        asyncPhaseState <= ONTIME;
        asyncOffTimeLevel <= 0;
        end
    else if (ch1ClkEn) begin
        // Shift register of baseband sample values
        asyncSR[0] <= asyncMF;
        asyncSR[1] <= asyncSR[0];
        asyncSR[2] <= asyncSR[1];
        case (asyncPhaseState)
            ONTIME: begin
                asyncPhaseState <= OFFTIME;
                end
            OFFTIME: begin
                asyncPhaseState <= ONTIME;
                // Is there a data transition on I?
                if (asyncEarlySign != asyncLateSign) begin
                    // Yes. 
                    asyncTransition <= 1;
                    // High to low transition?
                    if (asyncEarlySign) begin
                        asyncOffTimeLevel <= asyncOffTime;
                        asyncOnTimeLevel <= asyncLateOnTime;
                        end
                    // Or low to high?
                    else begin
                        asyncOffTimeLevel <= negAsyncOffTime;
                        asyncOnTimeLevel <= asyncEarlyOnTime;
                        end
                    end
                else begin
                    asyncTransition <= 0;
                    asyncOffTimeLevel <= 18'h00;
                    end
                end
            endcase
        end
    end

`ifdef SIMULATE
wire    [17:0]  asyncTimingErr = asyncOffTimeLevel;
real asyncTimingErrorReal;
always @(asyncTimingErr) asyncTimingErrorReal = ((asyncTimingErr > 131071.0) ? asyncTimingErr - 262144.0 : asyncTimingErr)/131072.0;
`endif

//******************************** Loop Filter ********************************

reg asyncBitsyncSpace;
always @* begin
    casex(addr)
        `BITSYNCAUSPACE:    asyncBitsyncSpace = 1;
        default:            asyncBitsyncSpace = 0;
        endcase
    end

wire    [31:0]  asyncDout;
wire    [15:0]  asyncLockCount;
wire    [11:0]  asyncSyncThreshold;
wire            asyncLoopFilterEn = (ch1ClkEn & asyncTimingErrorEn);
loopFilter asyncSampleLoop(
    .clk(sampleClk),
    .clkEn(asyncLoopFilterEn),
    .reset(reset),
    `ifdef USE_BUS_CLOCK
    .busClk(busClk),
    `endif
    .cs(asyncBitsyncSpace),
    .wr0(wr0),.wr1(wr1),.wr2(wr2),.wr3(wr3),
    .addr(addr),
    .din(din),
    .dout(asyncDout),
    .error(asyncOffTimeLevel[17:6] + asyncOffTimeLevel[5]),
    .loopFreq(ch1SampleFreq),
    .lockCount(asyncLockCount),
    .syncThreshold(asyncSyncThreshold)
    );


//************************** Lock Detector ************************************

reg     [1:0]   asyncAvgState;
wire    [7:0]   asyncSwapCount = asyncSyncThreshold[7:0];
reg     [7:0]   asyncSwapCounter;
reg             asyncIQSwap;
reg     [15:0]  asyncLockCounter;
wire    [16:0]  asyncLockPlus = {1'b0,asyncLockCounter} + 17'h00001;
wire    [16:0]  asyncLockMinus = {1'b0,asyncLockCounter} + 17'h1ffff;
reg             ch1BitsyncLock;
wire    [17:0]  asyncOffTimeMag = asyncOffTimeLevel[17] ? (~asyncOffTimeLevel + 1) : asyncOffTimeLevel;
wire    [17:0]  asyncOnTimeMag = asyncOnTimeLevel[17] ? (~asyncOnTimeLevel + 1) : asyncOnTimeLevel;
reg     [21:0]  avgAuOffTimeMag;
reg     [21:0]  avgAuOnTimeMag;
reg     [3:0]   asyncAvgCount;
always @(posedge sampleClk) begin
    if (!asyncEnable) begin
        asyncAvgState <= AVERAGE;
        asyncLockCounter <= 0;
        ch1BitsyncLock <= 0;
        asyncAvgCount <= 15;
        avgAuOffTimeMag <= 0;
        avgAuOnTimeMag <= 0;
        asyncIQSwap <= 0;
        asyncSwapCounter <= asyncSwapCount;
        end
    else if (ch1ClkEn) begin
        // Averaging state machine
        case (asyncAvgState)
            AVERAGE: begin
                if (asyncTimingErrorEn && asyncTransition) begin
                    avgAuOffTimeMag <= avgAuOffTimeMag + {4'b0,asyncOffTimeMag};
                    avgAuOnTimeMag <= avgAuOnTimeMag + {4'b0,asyncOnTimeMag};
                    if (asyncAvgCount == 0) begin
                        asyncAvgState <= TEST;
                        end
                    else begin
                        asyncAvgCount <= asyncAvgCount - 1;
                        end
                    end
                end
            TEST: begin
                asyncAvgCount <= 15;
                avgAuOffTimeMag <= 0;
                avgAuOnTimeMag <= 0;
                asyncAvgState <= AVERAGE;
                end
            default: begin
                asyncAvgCount <= 15;
                avgAuOffTimeMag <= 0;
                avgAuOnTimeMag <= 0;
                asyncAvgState <= AVERAGE;
                end
            endcase
        if (asyncAvgState == TEST) begin
            if (avgAuOffTimeMag[21:14] > {1'b0,avgAuOnTimeMag[21:15]}) begin
                if (asyncLockCounter == (16'hffff - asyncLockCount)) begin
                    ch1BitsyncLock <= 0;
                    asyncLockCounter <= 16'h0;
                    end
                else begin
                    asyncLockCounter <= asyncLockMinus[15:0];
                    end
                end
            else begin
                if (asyncLockCounter == asyncLockCount) begin
                    ch1BitsyncLock <= 1;
                    asyncLockCounter <= 16'h0;
                    end
                else begin
                    asyncLockCounter <= asyncLockPlus[15:0];
                    end
                end
            end
        end
    end

assign ch1LockCounter = asyncLockCounter;


/******************************************************************************
                                uP dout mux
******************************************************************************/
reg [31:0]dout;
always @* begin
    casex (addr)
        `BITSYNCSPACE:      dout = bsDout;
        `BITSYNCAUSPACE:    dout = asyncDout;
        default:            dout = 32'bx;
        endcase
    end




/******************************************************************************
                           Recovered Clock and Data 
******************************************************************************/


reg     [17:0]  ch0SymData;
reg     [17:0]  ch1SymData;
reg             ch0BitData;
reg             ch1BitData;

always @(posedge sampleClk) begin
    if (ch0ClkEn) begin
        // Capture the I output sample
        ch0SymData <= bbSRI[1];
        if (timingErrorEn) begin
            ch0BitData <= bbSRI[1][17];
            end
        end
    if (asyncEnable) begin
        if (ch1ClkEn) begin
            ch1SymData <= asyncSR[1];
            if (asyncTimingErrorEn) begin
                ch1BitData <= asyncSR[1][17];
                end
            end
        end
    else begin
        if (ch0ClkEn) begin
            // Capture the Q output sample
            ch1SymData <= bbSRQ[1];
            if (timingErrorEn) begin
                ch1BitData <= bbSRQ[1][17];
                end
            end
        end
    end

// Clock Enables
assign ch0Sym2xEn = ch0ClkEn;
assign ch0SymEn = ch0ClkEn & !timingErrorEn;
assign ch0SymClk = timingErrorEn;
assign ch1Sym2xEn = asyncEnable ? ch1ClkEn : ch0ClkEn;
assign ch1SymEn = asyncEnable ? (ch1ClkEn & !asyncTimingErrorEn) : (ch0ClkEn & !timingErrorEn);
assign ch1SymClk = asyncTimingErrorEn;


`ifdef SIMULATE
real ch0SymDataReal;
always @(ch0SymData) ch0SymDataReal = $itor($signed(ch0SymData))/(2**17);
`endif

endmodule


