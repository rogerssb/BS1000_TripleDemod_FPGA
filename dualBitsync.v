/******************************************************************************
Copyright 2008-2015 Koos Technical Services, Inc. All Rights Reserved

This source code is the Intellectual Property of Koos Technical Services,Inc.
(KTS) and is provided under a License Agreement which protects KTS' ownership and
derivative rights in exchange for negotiated compensation.
******************************************************************************/

`include "./addressMap.v"
`timescale 1ns/1ps

`define ENABLE_SLIP
//`define USE_GARDNER_TED

module dualBitsync(
    sampleClk, reset,
    ch0ClkEn,
    ch1ClkEn,
    bitsyncMode,
    `ifdef USE_BUS_CLOCK
    busClk,
    `endif
    cs,
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
    bsErrorEn,
    ch0DcError,
    ch0TransitionsDetected,
    ch1DcError,
    ch1TransitionsDetected
    );

input           sampleClk;
input           reset;
input           ch0ClkEn;
input           ch1ClkEn;
input   [1:0]   bitsyncMode;
`ifdef USE_BUS_CLOCK
input           busClk;
`endif
input           cs;
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
output  reg         ch1Sym2xEn;
output  reg         ch1SymEn;
output  reg         ch1SymClk;
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
output  reg signed  [17:0]  ch0DcError;
output  reg                 ch0TransitionsDetected;
output      signed  [17:0]  ch1DcError;
output                      ch1TransitionsDetected;

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
    wire            delayCh0 = 1'b0;
    always @(posedge sampleClk) begin
        if (ch0ClkEn) begin
            ch0MF <= ch0Filtered;
            ch0SymDelay <= ch0Filtered;
            ch1SymDelay <= ch1Filtered;
            if (bitsyncMode == `BS_MODE_OFFSET_CH) begin
                if (delayCh0) begin
                    ch0MF <= ch0SymDelay;
                    ch1MF <= ch1Filtered;
                end
                else begin
                    ch1MF <= ch0Filtered;
                    ch0MF <= ch1SymDelay;
                end
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
    reg     signed  [17:0]  ch0Input;
    reg     signed  [17:0]  ch1Input;
    always @* begin
        casex (bitsyncMode)
            `BS_MODE_DUAL_CH,
            `BS_MODE_OFFSET_CH: begin
                ch0Input = ch0MF;
                ch1Input = ch1MF;
            end
            default: begin
                ch0Input = ch0MF;
                ch1Input = ch0MF;
            end
        endcase
    end
    reg     signed  [17:0]  bbSRI[2:0];
    reg     signed  [17:0]  bbSRQ[2:0];
    always @(posedge sampleClk) begin
        if (ch0ClkEn) begin
            bbSRI[0] <= ch0Input;
            bbSRI[1] <= bbSRI[0];
            bbSRI[2] <= bbSRI[1];
            bbSRQ[0] <= ch1Input;
            bbSRQ[1] <= bbSRQ[0];
            bbSRQ[2] <= bbSRQ[1];
        end
    end

// Timing error variables
wire            earlySignI = bbSRI[2][17];
wire    [17:0]  absEarlyI = earlySignI ? (~bbSRI[2] + 1) : bbSRI[2];
wire            lateSignI = bbSRI[0][17];
wire    [17:0]  absLateI = lateSignI ? (~bbSRI[0] + 1) : bbSRI[0];
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

    `ifdef USE_GARDNER_TED
    //wire    signed  [17:0]  ch0SymDiff = {earlyOnTimeI[17],earlyOnTimeI[17:1]}
    //                                   - {lateOnTimeI[17],lateOnTimeI[17:1]};
    wire    signed  [17:0]  ch0SymDiff = {bbSRI[1][17],bbSRI[1][17:1]}
                                       - {ch0Input[17],ch0Input[17:1]};
    wire    signed  [35:0]  gardnerProductI;
    wire    signed  [17:0]  gardnerTimingErrorI = gardnerProductI[34:17];
    mpy18x18WithCE gardnerMpyI(
        .clk(sampleClk),
        .ce(ch0ClkEn),
        .a(ch0SymDiff),
        //.b(offTimeI),
        .b(bbSRI[0]),
        .p(gardnerProductI)
    );
    //wire    signed  [17:0]  ch1SymDiff = {earlyOnTimeQ[17],earlyOnTimeQ[17:1]}
    //                                   - {lateOnTimeQ[17],lateOnTimeQ[17:1]};
    wire    signed  [17:0]  ch1SymDiff = {bbSRQ[1][17],bbSRQ[1][17:1]}
                                       - {ch1Input[17],ch1Input[17:1]};
    wire    signed  [35:0]  gardnerProductQ;
    wire    signed  [17:0]  gardnerTimingErrorQ = gardnerProductQ[34:17];
    mpy18x18WithCE gardnerMpyQ(
        .clk(sampleClk),
        .ce(ch0ClkEn),
        .a(ch1SymDiff),
        //.b(offTimeQ),
        .b(bbSRQ[0]),
        .p(gardnerProductQ)
    );
    `endif


reg     [17:0]  timingErrorI;
reg     [17:0]  timingErrorQ;
wire    [17:0]  timingError = {timingErrorI[17],timingErrorI[17:1]} + {timingErrorQ[17],timingErrorQ[17:1]};
assign timingErrorEn = (phaseState == ONTIME);

wire    [11:0]  syncThreshold;
wire    [17:0]  multihThreshold = {syncThreshold,6'b0};
wire    [17:0]  negMultihThreshold = ~{syncThreshold,6'b0} + 1;

// DC Offset error variables
reg  [17:0]dcError;
wire offsetEn = (phaseState == OFFTIME);

reg  stateMachineSlip;
`ifdef ENABLE_SMSLIP
wire slip = stateMachineSlip;
`else
//wire  slip = 1'b0;
reg             slip;
`endif
reg slipped;
reg     [17:0]  slipErrorI;
reg     [17:0]  slipErrorQ;
wire    [17:0]  slipError = {slipErrorI[17],slipErrorI[17:1]} + {slipErrorQ[17],slipErrorQ[17:1]};
//wire    [17:0]  slipError = slipErrorI;
wire    [17:0]  absError = timingError[17] ? (~timingError + 1) : timingError;
wire    [17:0]  absSlipError = slipError[17] ? (~slipError + 1) : slipError;
reg     [21:0]  avgError;
reg     [21:0]  avgSlipError;
reg     [3:0]   avgCount;
reg                 transitionI,transitionQ;
reg     [7:0]       ch0TransitionCount;
wire                transition = transitionI || transitionQ;
reg signed  [17:0]  ch1SyncDcError;

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
        ch0TransitionCount <= 0;
        ch0TransitionsDetected <= 0;
        end
    else if (ch0ClkEn) begin
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

                `ifdef USE_GARDNER_TED

                // Is there a data transition on I?
                if (earlySignI != lateSignI) begin

                    // Yes. Use the gardner output
                    transitionI <= 1;
                    timingErrorI <= gardnerTimingErrorI;

                    // Calculate DC offset error
                    ch0TransitionsDetected <= 1;
                    ch0TransitionCount <= 255;
                    //ch0DcError <= {earlyOnTimeI[17],earlyOnTimeI[17:1]}
                    //            + {lateOnTimeI[17],lateOnTimeI[17:1]};
                    ch0DcError <= earlyOnTimeI;

                    // High to low transition?
                    if (earlySignI) begin
                        slipErrorI <= lateOnTimeI;
                    end
                    // Or low to high?
                    else begin
                        slipErrorI <= earlyOnTimeI;
                    end
                end
                else begin
                    transitionI <= 0;
                    timingErrorI <= 0;
                    ch0DcError <= 0;
                    if (ch0TransitionCount > 0) begin
                        ch0TransitionCount <= ch0TransitionCount - 1;
                    end
                    else begin
                        ch0TransitionsDetected <= 0;
                    end
                end


                // Is there a data transition on Q?
                if (earlySignQ != lateSignQ) begin
                    // Yes. Use the gardner output.
                    transitionQ <= 1;
                    timingErrorQ <= gardnerTimingErrorQ;

                    // Calculate DC offset error
                    //ch1SyncDcError <= {earlyOnTimeQ[17],earlyOnTimeQ[17:1]}
                    //                + {lateOnTimeQ[17],lateOnTimeQ[17:1]};
                    ch1SyncDcError <= earlyOnTimeQ[17];

                    // High to low transition?
                    if (earlySignQ) begin
                        slipErrorQ <= lateOnTimeQ;
                    end
                    // Or low to high?
                    else begin
                        slipErrorQ <= earlyOnTimeQ;
                    end
                end
                else begin
                    transitionQ <= 0;
                    timingErrorQ <= 0;
                    ch1SyncDcError <= 0;
                end

                `else // USE_GARDNER_TED

                // Is there a data transition on I?
                if (earlySignI != lateSignI) begin
                    // Yes. Calculate DC offset error
                    transitionI <= 1;
                    ch0TransitionsDetected <= 1;
                    ch0TransitionCount <= 255;
                    //ch0DcError <= {earlyOnTimeI[17],earlyOnTimeI[17:1]}
                    //            + {lateOnTimeI[17],lateOnTimeI[17:1]};
                    ch0DcError <= earlyOnTimeI;

                    // Calculate the timing error
                    // High to low transition?
                    if (earlySignI) begin
                        timingErrorI <= offTimeI;
                        slipErrorI <= lateOnTimeI;
                    end
                    // Or low to high?
                    else begin
                        timingErrorI <= negoffTimeI;
                        slipErrorI <= earlyOnTimeI;
                    end
                end
                else begin
                    transitionI <= 0;
                    ch0DcError <= 0;
                    if (ch0TransitionCount > 0) begin
                        ch0TransitionCount <= ch0TransitionCount - 1;
                    end
                    else begin
                        ch0TransitionsDetected <= 0;
                    end
                    timingErrorI <= 18'h00;
                end

                // Is there a data transition on Q?
                if (earlySignQ != lateSignQ) begin
                    transitionQ <= 1;
                    //ch1SyncDcError <= {earlyOnTimeQ[17],earlyOnTimeQ[17:1]}
                    //                + {lateOnTimeQ[17],lateOnTimeQ[17:1]};
                    ch1SyncDcError <= earlyOnTimeQ[17];

                    // High to low transition?
                    if (earlySignQ) begin
                        timingErrorQ <= offTimeQ;
                        slipErrorQ <= lateOnTimeQ;
                    end
                    // Or low to high?
                    else begin
                        timingErrorQ <= negoffTimeQ;
                        slipErrorQ <= earlyOnTimeQ;
                    end
                end
                else begin
                    transitionQ <= 0;
                    ch1SyncDcError <= 0;
                    timingErrorQ <= 18'h00;
                end

                `endif //USE_GARDNER_TED

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
real timingErrorReal;
real ch0MFReal;
real ch1MFReal;
always @(timingError) timingErrorReal = ((timingError > 131071.0) ? timingError - 262144.0 : timingError)/131072.0;
always @(ch0MF) ch0MFReal = (ch0MF[17] ? ch0MF - 262144.0 : ch0MF)/131072.0;
always @(ch1MF) ch1MFReal = (ch1MF[17] ? ch1MF - 262144.0 : ch1MF)/131072.0;
`endif

//******************************** Loop Filter ********************************

reg bitsyncSpace;
always @* begin
    casex(addr)
        `BITSYNCSPACE:  bitsyncSpace = cs;
        default:        bitsyncSpace = 0;
        endcase
    end
wire    [15:0]  lockCount;
reg             loopFilterEn;
reg     [11:0]  loopFilterError;
always @* begin
    loopFilterError = timingError[17:6] + timingError[5];
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
    .ctrl2(),
    .ctrl4(useSummer),
    .satPos(),
    .satNeg(),
    .lockCount(lockCount),
    .syncThreshold(syncThreshold)
    );

`define RECLOCK_BSERROR
`ifdef RECLOCK_BSERROR
reg     [17:0]  bsError;
reg             bsErrorEn;
always @(posedge sampleClk) begin
    bsError <= timingError;
    bsErrorEn <= loopFilterEn;
    end
`else
assign bsError = timingError;
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
        slip <= 0;
        end
    else if (ch0ClkEn) begin
        if (slipState == TEST) begin
            //if (avgError[21:12] > {2'b0,avgSlipError[21:14]}) begin
            if (avgError[21:12] > {1'b0,avgSlipError[21:13]}) begin
                if (ch0LockCounter == (16'hffff-lockCount)) begin
                    ch0BitsyncLock <= 0;
                    ch0LockCounter <= 16'h0;
                    slip <= 1;
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
        else begin
            slip <= 0;
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


wire asyncEnable = (bitsyncMode == `BS_MODE_IND_CH);

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

    `ifdef USE_GARDNER_TED
    //wire    signed  [17:0]  asyncSymDiff = {asyncEarlyOnTime[17],asyncEarlyOnTime[17:1]}
    //                                     - {asyncLateOnTime[17],asyncLateOnTime[17:1]};
    wire    signed  [17:0]  asyncSymDiff = {asyncSR[1][17],asyncSR[1][17:1]}
                                         - {asyncMF[17],asyncMF[17:1]};
    wire    signed  [35:0]  gardnerProduct;
    wire    signed  [17:0]  gardnerTimingError = gardnerProduct[34:17];
    mpy18x18WithCE gardnerMpy(
        .clk(sampleClk),
        .ce(ch1ClkEn),
        .a(asyncSymDiff),
        //.b(asyncOffTime),
        .b(asyncSR[0]),
        .p(gardnerProduct)
    );
    reg     signed  [11:0]  asyncTimingError;
    `else
    wire    [11:0]  asyncTimingError = asyncOffTimeLevel[17:6] + asyncOffTimeLevel[5];
    `endif

reg                 asyncTransition;
reg                 asyncTransitionsDetected;
reg     [7:0]       asyncTransitionCount;
assign ch1TransitionsDetected = asyncEnable ? asyncTransitionsDetected : ch0TransitionsDetected;
reg signed  [17:0]  asyncDcError;
assign ch1DcError = asyncEnable ? asyncDcError : ch1SyncDcError;

reg                 asyncSlip;
reg                 asyncSlipped;

always @(posedge sampleClk) begin
    if (!asyncEnable) begin
        asyncPhaseState <= ONTIME;
        asyncOffTimeLevel <= 0;
        asyncTransitionCount <= 0;
        asyncTransitionsDetected <= 0;
        asyncSlipped <= 0;
    end
    else if (ch1ClkEn) begin
        // Shift register of baseband sample values
        asyncSR[0] <= asyncMF;
        asyncSR[1] <= asyncSR[0];
        asyncSR[2] <= asyncSR[1];
        case (asyncPhaseState)
            ONTIME: begin
                if (asyncSlip && ~asyncSlipped) begin
                    asyncPhaseState <= ONTIME;
                    end
                else begin
                    asyncPhaseState <= OFFTIME;
                    end
                asyncSlipped <= asyncSlip;
                end
            OFFTIME: begin
                asyncPhaseState <= ONTIME;


                // Is there a data transition?
                if (asyncEarlySign != asyncLateSign) begin
                    // Yes.
                    asyncTransition <= 1;
                    `ifdef USE_GARDNER_TED
                    asyncTimingError <= gardnerTimingError[17:6];
                    `endif
                    //asyncDcError <= {asyncEarlyOnTime[17],asyncEarlyOnTime[17:1]}
                    //              + {asyncLateOnTime[17],asyncLateOnTime[17:1]};
                    asyncDcError <= asyncEarlyOnTime;
                    asyncTransitionsDetected <= 1;
                    asyncTransitionCount <= 255;

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
                    `ifdef USE_GARDNER_TED
                    asyncTimingError <= 0;
                    `endif
                    asyncDcError <= 0;
                    if (asyncTransitionCount > 0) begin
                        asyncTransitionCount <= asyncTransitionCount - 1;
                    end
                    else begin
                        asyncTransitionsDetected <= 0;
                    end
                    asyncOffTimeLevel <= 18'h00;
                end
            end
        endcase
    end
end

`ifdef SIMULATE
real asyncTimingErrorReal;
always @* asyncTimingErrorReal = $itor(asyncTimingError)/(2**11);
`endif

//******************************** Loop Filter ********************************

reg asyncBitsyncSpace;
always @* begin
    casex(addr)
        `BITSYNCAUSPACE:    asyncBitsyncSpace = cs;
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
    .error(asyncTimingError),
    .loopFreq(ch1SampleFreq),
    .ctrl2(),
    .ctrl4(),
    .satPos(),
    .satNeg(),
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
        asyncSlip <= 0;
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
            if (avgAuOffTimeMag[21:12] > {1'b0,avgAuOnTimeMag[21:13]}) begin
                if (asyncLockCounter == (16'hffff - asyncLockCount)) begin
                    ch1BitsyncLock <= 0;
                    asyncLockCounter <= 16'h0;
                    asyncSlip <= 1;
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
        else begin
            asyncSlip <= 0;
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
        ch0SymData <= bbSRI[0];
        if (timingErrorEn) begin
            ch0BitData <= bbSRI[1][17];
            end
        end
    if (asyncEnable) begin
        if (ch1ClkEn) begin
            ch1SymData <= asyncSR[0];
            if (asyncTimingErrorEn) begin
                ch1BitData <= asyncSR[1][17];
                end
            end
        end
    else begin
        if (ch0ClkEn) begin
            // Capture the Q output sample
            ch1SymData <= bbSRQ[0];
            if (timingErrorEn) begin
                ch1BitData <= bbSRQ[1][17];
                end
            end
        end
    end

// Clock Enables
assign ch0Sym2xEn = ch0ClkEn;
assign ch0SymEn = ch0ClkEn & timingErrorEn;
assign ch0SymClk = timingErrorEn;
always @* begin
    if (asyncEnable) begin
        ch1Sym2xEn = ch1ClkEn;
        ch1SymEn = ch1ClkEn & asyncTimingErrorEn;
        ch1SymClk = asyncTimingErrorEn;
    end
    else begin
        ch1Sym2xEn = ch0ClkEn;
        ch1SymEn = ch0ClkEn & timingErrorEn;
        ch1SymClk = timingErrorEn;
    end
end


`ifdef SIMULATE
real ch0SymDataReal;
always @(ch0SymData) ch0SymDataReal = $itor($signed(ch0SymData))/(2**17);
`endif

endmodule


