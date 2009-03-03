`timescale 1ns/1ps

`define ENABLE_SLIP

module bitsync(
    sampleClk, reset, 
    symTimes2Sync,
    demodMode,
    wr0,wr1,wr2,wr3,
    addr,
    din,
    dout,
    i,q,
    offsetError,
    offsetErrorEn,
    symClk,
    symData,
    bitClk,
    bitData,
    sampleFreq,
    bitsyncLock,
    lockCounter
    );

input           sampleClk;
input           reset;
input           symTimes2Sync;
input   [2:0]   demodMode;
input           wr0,wr1,wr2,wr3;
input   [11:0]  addr;
input   [31:0]  din;
output  [31:0]  dout;
input   [17:0]  i,q;
output  [17:0]  offsetError;
output          offsetErrorEn;
output          symClk;
output  [17:0]  symData;
output          bitClk;
output          bitData;
output  [31:0]  sampleFreq;
output          bitsyncLock;
output  [15:0]  lockCounter;


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
reg [17:0]bbSR[2:0];

// Timing error variables
wire earlySign = bbSR[2][17];
wire lateSign = bbSR[0][17];
wire [17:0]earlyOnTime = bbSR[2];
wire [17:0]lateOnTime = bbSR[0];
wire [17:0]offTime = bbSR[1];
wire [17:0]negOffTime = (~offTime + 1);
reg  [17:0]timingError;
wire timingErrorEn = (phaseState == ONTIME);

// DC Offset error variables
wire [18:0]offsetErrorSum = {bbSR[2][17],bbSR[2]} + {bbSR[0][17],bbSR[0]};
reg  [17:0]offsetError;
wire offsetErrorEn = (phaseState == ONTIME);

reg  stateMachineSlip;
wire registerSlip;
`ifdef ENABLE_SMSLIP
wire slip = (stateMachineSlip | registerSlip);
`else
wire slip = registerSlip;
`endif
reg slipped;
reg  [17:0]slipError;
wire [17:0]absError = timingError[17] ? (~timingError + 1) : timingError;
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
        timingError <= 0;
        offsetError <= 0;
        avgCount <= 15;
        avgError <= 0;
        avgSlipError <= 0;
        end
    else if (symTimes2Sync) begin
        // Shift register of baseband sample values
        bbSR[0] <= i;
        bbSR[1] <= bbSR[0];
        bbSR[2] <= bbSR[1];
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
                    offsetError <= offsetErrorSum[18:1];
                    // High to low transition?
                    if (earlySign) begin
                        timingError <= offTime;
                        slipError <= lateOnTime;
                        end
                    // Or low to high?
                    else begin
                        timingError <= negOffTime;
                        slipError <= earlyOnTime;
                        end
                    end
                else begin
                    transition <= 0;
                    offsetError <= 18'h00;
                    timingError <= 18'h00;
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
real timingErrorReal = ((timingError > 131071.0) ? timingError - 262144.0 : timingError)/131072.0;
`endif

//************************ Recovered Clock and Data ***************************

reg [17:0]symData;
always @(posedge sampleClk) begin
    if (symTimes2Sync) begin
        if (timingErrorEn) begin
            symData <= i;
            end
        end
    end

assign symClk = timingErrorEn;

assign bitData = ~symData[17];
assign bitClk  = symClk;

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
                      .error(timingError[17:10]),
                      .loopFreq(sampleFreq),
                      .ctrl2(registerSlip),
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
real sampleFreqReal = ((sampleFreq > 2147483647.0) ? sampleFreq-4294967296.0 : sampleFreq)/2147483648.0;
`endif

endmodule


