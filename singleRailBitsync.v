/******************************************************************************
Copyright 2008-2015 Koos Technical Services, Inc. All Rights Reserved

This source code is the Intellectual Property of Koos Technical Services,Inc.
(KTS) and is provided under a License Agreement which protects KTS' ownership and
derivative rights in exchange for negotiated compensation.
******************************************************************************/

`include "./addressMap.v"
`timescale 1ns/1ps

`define ENABLE_SLIP

module singleRailBitsync(
    sampleClk, reset,
    symTimes2Sync,
    demodMode,
    cs,
    wr0,wr1,wr2,wr3,
    addr,
    din,
    dout,
    i,q,
    offsetError,
    offsetErrorEn,
    `ifdef SYM_DEVIATION
    fskDeviation,
    `else
    posDeviation,
    negDeviation,
    `endif
    sym2xEn,
    symEn,
    symClk,
    symData,
    bitData,
    sampleFreq,
    bitsyncLock,
    lockCounter,
    bsError,
    bsErrorEn
    );

input           sampleClk;
input           reset;
input           symTimes2Sync;
input   [4:0]   demodMode;
input           wr0,wr1,wr2,wr3;
input   [12:0]  addr;
input   [31:0]  din;
output  [31:0]  dout;
input   [17:0]  i,q;
output  [17:0]  offsetError;
output          offsetErrorEn;
`ifdef SYM_DEVIATION
output  [15:0]  fskDeviation;
`else
output  [15:0]  posDeviation;
output  [15:0]  negDeviation;
`endif
output          sym2xEn;
output          symEn;
output          symClk;
output  [17:0]  symData;
output          bitData;
output  [31:0]  sampleFreq;
output          bitsyncLock;
output  [15:0]  lockCounter;
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


//*********************** MF Frequency Discriminator **************************
wire    [11:0]   phase;
vm_cordic cordic(
    .clk(sampleClk),
    .ena(symTimes2Sync),
    .x(iFiltered[17:4]),.y(qFiltered[17:4]),
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
wire    [17:0]  freq = {freqOut,6'b0};


`ifdef SIMULATE
real freqReal;
real phaseReal;
always @(freq) freqReal = (freq[17] ? freq - 262144.0 : freq)/131072.0;
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
reg [17:0]bbSR[3:0];
reg [17:0]bbSRQ[3:0];

// Timing error variables
wire            earlySign = bbSR[2][17];
wire    [17:0]  absEarly = earlySign ? (~bbSR[2] + 1) : bbSR[2];
wire            lateSign = bbSR[0][17];
wire    [17:0]  absLate = lateSign ? (~bbSR[0] + 1) : bbSR[0];
wire    [17:0]  prevOffTime = bbSR[3];
wire    [17:0]  earlyOnTime = bbSR[2];
wire    [17:0]  offTime = bbSR[1];
wire    [17:0]  lateOnTime = bbSR[0];
wire    [17:0]  negoffTime = (~offTime + 1);

reg     [17:0]  timingError;
assign timingErrorEn = (phaseState == ONTIME);

wire    [11:0]  syncThreshold;

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
wire [17:0]absError = timingError[17] ? (~timingError + 1) : timingError;
wire [17:0]absSlipError = slipError[17] ? (~slipError + 1) : slipError;
reg  [21:0]avgError;
reg  [21:0]avgSlipError;
reg  [3:0]avgCount;
reg  dcErrorAvailable;
reg  transition;
reg  [1:0]noTransitionCount;
reg  [1:0]transitionCount;

wire fmModes = ( (demodMode == `MODE_2FSK)
              || (demodMode == `MODE_FM)
               );
always @(posedge sampleClk) begin
    if (reset) begin
        phaseState <= ONTIME;
        slipState <= AVERAGE;
        slipped <= 0;
        timingError <= 0;
        dcError <= 0;
        avgCount <= 15;
        avgError <= 0;
        avgSlipError <= 0;
        end
    else if (symTimes2Sync) begin
        // Shift register of baseband sample values
        if (fmModes) begin
            bbSR[0] <= freq;
            end
        else if (demodMode == `MODE_PM) begin
            bbSR[0] <= {phase,6'b0};
            end
        else begin
            bbSR[0] <= iFiltered;
            end
        bbSR[1] <= bbSR[0];
        bbSR[2] <= bbSR[1];
        bbSR[3] <= bbSR[2];
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
                // Is there a data transition?
                if (earlySign != lateSign) begin
                    // Yes. Calculate DC offset error
                    transition <= 1;
                    noTransitionCount <= 0;
                    transitionCount <= transitionCount + 1;
                    dcError <= offTime;
                    dcErrorAvailable <= 1;

                    // High to low transition?
                    if (earlySign) begin
                        timingError <= offTime;
                        slipError <= lateOnTime;
                        end
                    // Or low to high?
                    else begin
                        timingError <= negoffTime;
                        slipError <= earlyOnTime;
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
                    timingError <= 18'h00;
                    //deviation <= offTime;
                    deviation <= earlyOnTime;
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
wire    [17:0]  timingErr = timingError;
real timingErrorReal;
real iMFReal;
real qMFReal;
always @(timingErr) timingErrorReal = ((timingErr > 131071.0) ? timingErr - 262144.0 : timingErr)/131072.0;
always @(iMF) iMFReal = (iFiltered[17] ? iFiltered - 262144.0 : iFiltered)/131072.0;
always @(qMF) qMFReal = (qFiltered[17] ? qFiltered - 262144.0 : qFiltered)/131072.0;
`endif


assign          offsetError = dcError;
assign          offsetErrorEn = offsetEn;



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
        `BITSYNCSPACE:  bitsyncSpace = cs;
        default:        bitsyncSpace = 0;
        endcase
    end
wire    [15:0]  lockCount;
reg             loopFilterEn;
reg     [11:0]  loopFilterError;
always @* begin
    casex (demodMode)
        default: begin
            loopFilterError = timingError[17:6] + timingError[5];
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
    bsError <= timingError;
    bsErrorEn <= loopFilterEn;
    end
`else
assign bsError = timingError;
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


/******************************************************************************
                                uP dout mux
******************************************************************************/
reg [31:0]dout;
always @* begin
    casex (addr)
        `BITSYNCSPACE:      dout = bsDout;
        default:            dout = 32'bx;
        endcase
    end




/******************************************************************************
                           Recovered Clock and Data
******************************************************************************/


reg     [17:0]  symData;
reg             bitData;

always @(posedge sampleClk) begin
    if (symTimes2Sync) begin
        // Capture the I output sample
        symData <= bbSR[1];
        if (timingErrorEn) begin
            if (fmModes) begin
                bitData <= ~bbSR[1][17];
                end
            else begin
                bitData <= bbSR[1][17];
                end
            end
        end
    end

// Clock Enables
assign sym2xEn = symTimes2Sync;
assign symEn = symTimes2Sync & timingErrorEn;
assign symClk = timingErrorEn;


`ifdef SIMULATE
real symDataReal;
always @(symData) symDataReal = (symData[17] ? symData - 262144.0 : symData)/131072.0;
`endif

endmodule


