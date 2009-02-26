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
    offsetError,
    offsetErrorEn,
    carrierFreqOffset,
    carrierFreqEn,
    loopError,
    carrierLock
    );

input           clk;
input           reset;
input           ddcSync;
input           resampSync;
input           wr0,wr1,wr2,wr3;
input   [11:0]  addr;
input   [31:0]  din;
output  [31:0]  dout;
input   [2:0]   demodMode;
input   [7:0]   phase;
input   [7:0]   freq;
input   [7:0]   offsetError;
input           offsetErrorEn;
output  [31:0]  carrierFreqOffset;
output          carrierFreqEn;
output  [7:0]   loopError;
output          carrierLock;


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
loopRegs loopRegs(
    .cs(freqLoopSpace),
    .addr(addr),
    .wr0(wr0),.wr1(wr1),.wr2(wr2),.wr3(wr3),
    .dataIn(din),
    .dataOut(dout),
    .invertError(invertError),
    .zeroError(zeroError),
    .ctrl2(sweepEnable),
    .leadMan(),
    .leadExp(leadExp),
    .lagMan(),
    .lagExp(lagExp),
    .limit(limit),
    .loopData(sweepOffsetMag),
    .lockCount(lockCount),
    .syncThreshold(syncThreshold)
    );


/************************ Error Signal Source *********************************/

// Determine the source of the error signal
reg     [7:0]   modeError;
reg             modeErrorEn;
reg             sync;
wire    [7:0]   bpskPhase = phase;
wire    [7:0]   qpskPhase = phase - 8'h20;
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
            enableCarrierLock = 0;
            end
        `MODE_PM: begin
            sync <= ddcSync;
            modeError <= phase;
            modeErrorEn <= 1'b1;
            enableCarrierLock = 1;
            end
        `MODE_FM: begin
            sync <= ddcSync;
            modeError <= freq;
            modeErrorEn <= 1'b1;
            enableCarrierLock = 0;
            end
        `MODE_2FSK: begin
            sync <= resampSync;
            modeError <= offsetError;
            modeErrorEn <= offsetErrorEn;
            enableCarrierLock = 0;
            end
        `MODE_BPSK: begin
            sync <= ddcSync;
            modeError <= {bpskPhase[6:0],1'b0};
            modeErrorEn <= 1'b1;
            enableCarrierLock = 1;
            end
        `MODE_QPSK,
        `MODE_OQPSK: begin
            sync <= ddcSync;
            modeError <= {qpskPhase[5:0],2'b0};
            modeErrorEn <= 1'b1;
            enableCarrierLock = 1;
            end
        default: begin
            sync <= 1'b1;
            modeError <= 0;
            modeErrorEn <= 1'b1;
            enableCarrierLock = 1;
            end
        endcase
    end

`ifdef SIMULATE
real modeErrorReal = (modeError[7] ? modeError - 256.0 : modeError)/128.0;
`endif

wire loopFilterEn = sync & modeErrorEn;

/**************************** Adjust Error ************************************/
reg     [7:0]   loopError;
wire    [7:0]   negModeError = ~modeError + 1;
always @(posedge clk) begin 
    if (loopFilterEn) begin
        if (zeroError) begin
            loopError <= 8'h0;
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
wire    [31:0]  leadError;
leadGain leadGain (
    .clk(clk), .clkEn(loopFilterEn), .reset(reset), 
    .error(loopError),
    .leadExp(leadExp),
    .leadError(leadError)
    );

reg             carrierLock;
wire    [31:0]  lagAccum;
lagGain lagGain (
    .clk(clk), .clkEn(loopFilterEn), .reset(reset), 
    .error(loopError),
    .lagExp(lagExp),
    .limit(limit),
    .sweepOffsetMag(sweepOffsetMag),
    .carrierInSync(carrierLock),
    .lagAccum(lagAccum)
    );


// Final filter output
reg [31:0]filterSum;
always @(posedge clk) begin
    if (reset) begin
        filterSum <= 0;
        end
    else if (loopFilterEn) begin
        filterSum <= lagAccum + leadError;
        end
    end

/******************************* Lock Detector ********************************/
wire    [7:0]   absModeError = modeError[7] ? negModeError : modeError;
reg     [15:0]  lockCounter;
wire    [16:0]  lockPlus = {1'b0,lockCounter} + 1;
wire    [16:0]  lockMinus = {1'b0,lockCounter} - 1;
always @(posedge clk) begin
    if (reset) begin
        lockCounter <= 0;
        carrierLock <= 0;
        end
    else if (loopFilterEn) begin
        if (enableCarrierLock) begin
            if (absModeError > syncThreshold) begin
                if (lockMinus[16]) begin
                    carrierLock <= 0;
                    lockCounter <= lockCount;
                    end
                else begin
                    lockCounter <= lockMinus;
                    end
                end
            else begin
                if (lockPlus[16]) begin
                    carrierLock <= 1;
                    lockCounter <= lockCount;
                    end
                else begin
                    lockCounter <= lockPlus[15:0];
                    end
                end
            end
        else begin
            carrierLock <= 1;
            end
        end
    end


// Final Outputs
assign carrierFreqOffset = filterSum;
assign carrierFreqEn = loopFilterEn;

`ifdef SIMULATE
real carrierOffsetReal = ((carrierFreqOffset > 2147483647.0) ? carrierFreqOffset-4294967296.0 : carrierFreqOffset)/2147483648.0;
`endif


endmodule
