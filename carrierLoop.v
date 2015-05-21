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

parameter RegSpace = `CARRIERSPACE;

input           clk;
input           reset;
input           ddcSync;
input           resampSync;
input           wr0,wr1,wr2,wr3;
input   [12:0]  addr;
input   [31:0]  din;
output  [31:0]  dout;
input   [4:0]   demodMode;
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
always @* begin
    casex(addr)
        RegSpace:       freqLoopSpace = 1;
        default:        freqLoopSpace = 0;
        endcase
    end
wire    [31:0]  dout;
wire    [1:0]   acqTrackControl;
wire    [4:0]   leadExp;
wire    [4:0]   lagExp;
wire    [31:0]  upperLimit;
wire    [31:0]  lowerLimit;
wire    [31:0]  loopOffset;
wire    [31:0]  sweepOffsetMag;
wire    [15:0]  lockCount;
wire    [11:0]  syncThreshold;
wire    [39:0]  lagAccum;
carrierLoopRegs loopRegs(
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
    .acqTrackControl(acqTrackControl),
    .leadMan(),
    .leadExp(leadExp),
    .lagMan(),
    .lagExp(lagExp),
    .upperLimit(upperLimit),
    .lowerLimit(lowerLimit),
    .loopData(sweepOffsetMag),
    .lockCount(lockCount),
    .syncThreshold(syncThreshold)
    );


/************************ Error Signal Source *********************************/

// Determine the source of the error signal
reg     [11:0]  modeError;
reg             loopFilterEn;
wire    [11:0]  bpskPhase = phase;
wire    [11:0]  qpskPhase = phase - 12'h200;
reg             enableCarrierLock;
always @(posedge clk) begin
    case (demodMode)
        `MODE_AM: begin
            loopFilterEn <= ddcSync;
            modeError <= 0;
            enableCarrierLock <= 0;
            end
        `MODE_PM: begin
            loopFilterEn <= ddcSync;
            modeError <= phase;
            enableCarrierLock <= 1;
            end
        `MODE_PCMTRELLIS: begin
            loopFilterEn <= resampSync & offsetErrorEn;
            modeError <= offsetError;
            enableCarrierLock <= 0;
            //loopFilterEn <= ddcSync;
            //modeError <= freq;
            //enableCarrierLock <= 0;
            end
        `MODE_MULTIH,
        `MODE_FM: begin
            loopFilterEn <= ddcSync;
            modeError <= freq;
            enableCarrierLock <= 0;
            end
        `MODE_2FSK: begin
            //loopFilterEn <= resampSync & offsetErrorEn;
            //modeError <= offsetError;
            //enableCarrierLock <= 0;
            loopFilterEn <= ddcSync;
            modeError <= freq;
            enableCarrierLock <= 0;
            end
        `MODE_UQPSK,
        `MODE_AUQPSK,
        `MODE_BPSK: begin
            loopFilterEn <= ddcSync;
            modeError <= {bpskPhase[10:0],1'b1};
            enableCarrierLock <= 1;
            end
        `MODE_QPSK,
        `MODE_OQPSK,
        `MODE_SOQPSK,
        `MODE_AQPSK: begin
            loopFilterEn <= ddcSync;
            modeError <= {qpskPhase[9:0],2'b10};
            enableCarrierLock <= 1;
            end
        default: begin
            loopFilterEn <= 1'b1;
            modeError <= 0;
            enableCarrierLock <= 1;
            end
        endcase
    end

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
wire            breakLoop = (zeroError || (sweepEnable && highFreqOffset));
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
    .acqTrackControl(acqTrackControl),
    .track(carrierLock),
    .leadError(leadError)
    );

lagGain12 lagGain (
    .clk(clk), .clkEn(loopFilterEn), .reset(reset), 
    .error(loopError),
    .lagExp(lagExp),
    .upperLimit(upperLimit),
    .lowerLimit(lowerLimit),
    .sweepEnable(sweepEnable),
    .sweepRateMag(sweepOffsetMag),
    .clearAccum(clearAccum),
    .carrierInSync(carrierLock && !highFreqOffset),
    .acqTrackControl(acqTrackControl),
    .track(carrierLock),
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

reg     [11:0]  absModeError;
reg     [15:0]  lockCounter;
wire    [16:0]  lockPlus = {1'b0,lockCounter} + 17'h00001;
wire    [16:0]  lockMinus = {1'b0,lockCounter} + 17'h1ffff;
always @(posedge clk) begin
    if (reset || !enableCarrierLock) begin
        lockCounter <= 0;
        carrierLock <= 1;
        end
    else if (loopFilterEn) begin
        absModeError <= modeError[11] ? negModeError : modeError;
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
assign carrierFreqOffset = lagAccum[39:8] + lagAccum[7];
//assign carrierLeadFreq = leadError[39:8];
assign carrierLeadFreq = leadError[39:8] + leadError[7];
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




`ifdef TEST_MODULE
`timescale 1ns/100ps

module test;

reg reset,clk;

// Create the clocks
parameter SAMPLE_FREQ = 10e6;
parameter HC = 1e9/SAMPLE_FREQ/2;
parameter C = 2*HC;
parameter syncDecimation = 4;
reg clken;
always #HC clk = clk^clken;

reg sync;
reg [3:0]syncCount;
always @(posedge clk) begin
    if (syncCount == 0) begin
        syncCount <= syncDecimation-1;
        sync <= 1;
        end
    else begin
        syncCount <= syncCount - 1;
        sync <= 0;
        end
    //sync <= ~sync;
    //sync <= 1;
    end

// Instantiate the carrier loop filter
reg     [11:0]  noise;
carrierLoop loop(
    .clk(clk), 
    .reset(reset), 
    .ddcSync(sync),
    .resampSync(sync),
    .wr0(1'b0),.wr1(1'b0),.wr2(1'b0),.wr3(1'b0),
    .addr(13'b0),
    .din(),
    .dout(),
    .demodMode(`MODE_PCMTRELLIS),
    .phase(),
    .freq(),
    .highFreqOffset(),
    .offsetError(noise),
    .offsetErrorEn(sync),
    .carrierFreqOffset(),
    .carrierLeadFreq(),
    .carrierFreqEn(),
    .loopError(),
    .carrierLock(),
    .lockCounter()
    );



// Create some noise samples
real            noiseSum;
always @(posedge clk) begin
    if (reset) begin
        noise <= 0;
        noiseSum <= 0.0;
        end
    else if (sync) begin
        noise <= $gaussPLI();
        noiseSum <= noiseSum - $itor($signed(noise));
        end
    end


initial begin
    $initGaussPLI(1,8.0,(2.0**10));

    reset = 0;
    sync = 1;
    syncCount = 0;
    clk = 0;

    // Set the loop filter regs
    loop.loopRegs.leadExp = 0;
    loop.loopRegs.lagExp = 5'hc;
    loop.loopRegs.upperLimit = 32'h100000;
    loop.loopRegs.lowerLimit = 32'hfff00000;
    loop.loopRegs.zeroError = 1'b1;
    loop.loopRegs.invertError = 1'b1;
    loop.loopRegs.acqTrackControl = 2'b00;

    // Turn on the clock
    clken=1;
    #(10*C) ;

    // Reset
    reset = 1;
    #(2*C) ;
    reset = 0;

    // Enable the loop filter
    loop.loopRegs.zeroError = 1'b0;

    // Clock the loop filter
    #(1024*C) ;

    $stop;



    end

endmodule
`endif

