`timescale 1ns/1ps
`include ".\addressMap.v"

module carrierLoop(
    clk, reset, 
    ddcSync,
    resampSync,
    wr0,wr1,wr2,wr3,
    addr,
    din,
    dout,
    demodMode,
    phase,
    freq,
    highFreqOffset,
    offsetError,
    offsetErrorEn,
    carrierFreqOffset,
    carrierLeadFreq,
    carrierFreqEn,
    loopError,
    carrierLock,
    lockCounter
    );

input           clk;
input           reset;
input           ddcSync;
input           resampSync;
input           wr0,wr1,wr2,wr3;
input   [11:0]  addr;
input   [31:0]  din;
output  [31:0]  dout;
input   [3:0]   demodMode;
input   [11:0]  phase;
input   [11:0]  freq;
input           highFreqOffset;
input   [11:0]  offsetError;
input           offsetErrorEn;
output  [31:0]  carrierFreqOffset;
output  [31:0]  carrierLeadFreq;
output          carrierFreqEn;
output  [11:0]   loopError;
output          carrierLock;
output  [15:0]  lockCounter;


/***************************** Control Registers ******************************/

reg freqLoopSpace;
always @(addr) begin
    casex(addr)
        `CARRIERSPACE:  freqLoopSpace <= 1;
        default:        freqLoopSpace <= 0;
        endcase
    end
wire    [31:0]  dout;
wire    [4:0]   leadExp;
wire    [4:0]   lagExp;
wire    [31:0]  limit;
wire    [31:0]  loopOffset;
wire    [31:0]  sweepOffsetMag;
wire    [15:0]  lockCount;
wire    [7:0]   syncThreshold;
wire    [39:0]  lagAccum;
loopRegs loopRegs(
    .cs(freqLoopSpace),
    .addr(addr),
    .wr0(wr0),.wr1(wr1),.wr2(wr2),.wr3(wr3),
    .lagAccum(lagAccum[39:8]),
    .dataIn(din),
    .dataOut(dout),
    .invertError(invertError),
    .zeroError(zeroError),
    .ctrl2(sweepEnable),
    .clearAccum(clearAccum),
    .ctrl4(switchError),
    .leadMan(),
    .leadExp(leadExp),
    .lagMan(),
    .lagExp(lagExp),
    .limit(limit),
    .loopData(sweepOffsetMag),
    .lockCount(lockCount),
    .syncThreshold(syncThreshold)
    );


/************************ Frequency Peak Detect *******************************/
reg     [18:0]  newFreq;
reg     [18:0]  posFrequency;
reg     [18:0]  negFrequency;
wire    [18:0]  freqError = posFrequency + negFrequency;
reg     [11:0]  freqOut;
always @(posedge clk) begin
    if (reset) begin
        posFrequency <= 0;
        negFrequency <= 19'h7ffff;
        end
    else if (ddcSync) begin
        if (freq == 12'h800) begin
            newFreq <= 19'h40080;
            end
        else begin
            newFreq <= {freq,7'b0};
            end
        if (newFreq[18]) begin
            if (newFreq < negFrequency) begin
                negFrequency <= negFrequency - {{7{negFrequency[18]}},negFrequency[18:7]}
                              + {{7{newFreq[18]}},newFreq[18:7]};
                end
            else begin
                if (negFrequency != 19'h0) begin
                    negFrequency <= (negFrequency + 1);
                    end
                end
            end
        else begin
            if (newFreq > posFrequency) begin
                posFrequency <= posFrequency - {{7{posFrequency[18]}},posFrequency[18:7]}
                              + {{7{newFreq[18]}},newFreq[18:7]};
                end
            else begin
                if (posFrequency != 19'h0) begin
                    posFrequency <= posFrequency - 1;
                    end
                end
            end
        if (switchError) begin
            //freqOut <= posFrequency[18:7];
            freqOut <= freq;
            end
        else begin
            //freqOut <= negFrequency[18:7];
            freqOut <= freqError[18:7] + freqError[6];
            end
        end
    end
`ifdef SIMULATE
real posFrequencyReal;
always @(posFrequency) posFrequencyReal = (posFrequency[18] ? posFrequency[18:7] - 4096.0 : posFrequency[18:7])/2048.0;
real negFrequencyReal;
always @(negFrequency) negFrequencyReal = (negFrequency[18] ? negFrequency[18:7] - 4096.0 : negFrequency[18:7])/2048.0;
`endif




// Calculation of average DC offset (freq offset in FSK mode) and average FSK deviation.
reg     [18:0]  avgFrequency;
always @(posedge clk) begin
    if (reset) begin
        avgFrequency <= 0;
        end
    else if (ddcSync) begin
        avgFrequency <= (avgFrequency - {{7{avgFrequency[18]}},avgFrequency[18:7]})
                      + {{7{freq[11]}},freq};
        end
    end
wire    [11:0]  filteredFreq = avgFrequency[18:7] + avgFrequency[6];

`ifdef SIMULATE
real avgFrequencyReal = (avgFrequency[18] ? avgFrequency[18:7] - 4096.0 : avgFrequency[18:7])/2048.0;
`endif




/************************ Error Signal Source *********************************/

// Determine the source of the error signal
reg     [11:0]   modeError;
reg             modeErrorEn;
reg             sync;
wire    [11:0]   bpskPhase = phase;
wire    [11:0]   qpskPhase = phase - 12'h200;
reg             enableCarrierLock;
always @(demodMode or offsetError or offsetErrorEn or 
         qpskPhase or bpskPhase or
         phase or freq or 
         ddcSync or resampSync) begin
    case (demodMode)
        `MODE_AM: begin
            sync <= ddcSync;
            modeError <= 0;
            modeErrorEn <= 1'b1;
            enableCarrierLock <= 0;
            end
        `MODE_PM: begin
            sync <= ddcSync;
            modeError <= phase;
            modeErrorEn <= 1'b1;
            enableCarrierLock <= 1;
            end
        `MODE_PCMTRELLIS,
        `MODE_FM,
        `MODE_2FSK: begin
            sync <= ddcSync;
            modeError <= freqOut;
            modeErrorEn <= 1'b1;
            enableCarrierLock <= 0;
            end
        //`MODE_2FSK: begin
        //    sync <= resampSync;
        //    modeError <= offsetError;
        //    modeErrorEn <= offsetErrorEn;
        //    enableCarrierLock <= 0;
        //    end
        `MODE_BPSK: begin
            sync <= ddcSync;
            modeError <= {bpskPhase[10:0],1'b1};
            modeErrorEn <= 1'b1;
            enableCarrierLock <= 1;
            end
        `MODE_QPSK,
        `MODE_OQPSK,
        `MODE_AUQPSK: begin
            sync <= ddcSync;
            modeError <= {qpskPhase[9:0],2'b10};
            modeErrorEn <= 1'b1;
            enableCarrierLock <= 1;
            end
        default: begin
            sync <= 1'b1;
            modeError <= 0;
            modeErrorEn <= 1'b1;
            enableCarrierLock <= 1;
            end
        endcase
    end

wire loopFilterEn = sync & modeErrorEn;

`ifdef SIMULATE
real modeErrorReal;
always @(modeError) modeErrorReal = (modeError[11] ? modeError - 4096.0 : modeError)/2048.0;
real avgErrorReal;
always @(posedge clk) begin
    if (reset) begin
        avgErrorReal <= 0.0;
        end
    else if (loopFilterEn) begin
        avgErrorReal <= (0.999 * avgErrorReal) + (0.001 * modeErrorReal);
        end
    end
`endif


/**************************** Adjust Error ************************************/
reg     [11:0]   loopError;
wire    [11:0]   negModeError = ~modeError + 1;
reg             carrierLock;
wire            breakLoop = (zeroError || (sweepEnable && !carrierLock && highFreqOffset));
always @(posedge clk) begin 
    if (loopFilterEn) begin
        if (breakLoop) begin
            loopError <= 12'h0;
            end
        else if (invertError) begin
            loopError <= negModeError;
            end
        else begin
            loopError <= modeError;
            end
        end
    end


/***************************** Loop Filter ************************************/

// Instantiate the lead/lag filter gain path
wire    [39:0]  leadError;
leadGain12 leadGain (
    .clk(clk), .clkEn(loopFilterEn), .reset(reset), 
    .error(loopError),
    .leadExp(leadExp),
    .leadError(leadError)
    );

lagGain12 lagGain (
    .clk(clk), .clkEn(loopFilterEn), .reset(reset), 
    .error(loopError),
    .lagExp(lagExp),
    .limit(limit),
    .sweepEnable(sweepEnable),
    .sweepRateMag(sweepOffsetMag),
    .clearAccum(clearAccum),
    .carrierInSync(carrierLock),
    .lagAccum(lagAccum)
    );


// Final filter output
reg [39:0]filterSum;
always @(posedge clk) begin
    if (reset) begin
        filterSum <= 0;
        end
    else if (loopFilterEn) begin
        filterSum <= lagAccum + leadError;
        end
    end

/******************************* Lock Detector ********************************/
wire    [11:0]   absModeError = modeError[7] ? negModeError : modeError;
reg     [15:0]  lockCounter;
wire    [16:0]  lockPlus = {1'b0,lockCounter} + 17'h00001;
wire    [16:0]  lockMinus = {1'b0,lockCounter} + 17'h1ffff;
always @(posedge clk) begin
    if (reset || !enableCarrierLock) begin
        lockCounter <= 0;
        carrierLock <= 1;
        end
    else if (loopFilterEn) begin
        if (absModeError > syncThreshold) begin
            if (lockCounter == (16'hffff - lockCount)) begin
                carrierLock <= 0;
                lockCounter <= 0;
                end
            else begin
                lockCounter <= lockMinus[15:0];
                end
            end
        else begin
            if (lockCounter == lockCount) begin
                carrierLock <= 1;
                lockCounter <= 0;
                end
            else begin
                lockCounter <= lockPlus[15:0];
                end
            end
        end
    end


// Final Outputs
//assign carrierFreqOffset = filterSum[39:8];
assign carrierFreqOffset = lagAccum[39:8];
assign carrierLeadFreq = leadError[39:8];
assign carrierFreqEn = loopFilterEn;

`ifdef SIMULATE
real carrierOffsetReal;
real lagAccumReal; 
integer lockCounterInt;
always @(carrierFreqOffset) carrierOffsetReal = ((carrierFreqOffset > 2147483647.0) ? carrierFreqOffset-4294967296.0 : carrierFreqOffset)/2147483648.0;
always @(lagAccum[39:8]) lagAccumReal = ((lagAccum[39:8] > 2147483647.0) ? lagAccum[39:8]-4294967296.0 : lagAccum[39:8])/2147483648.0; 
always @(lockCounter) lockCounterInt = lockCounter;
`endif


endmodule
