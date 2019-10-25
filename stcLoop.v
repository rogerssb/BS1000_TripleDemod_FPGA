/******************************************************************************
Copyright 2008-2015 Koos Technical Services, Inc. All Rights Reserved

This source code is the Intellectual Property of Koos Technical Services,Inc.
(KTS) and is provided under a License Agreement which protects KTS' ownership and
derivative rights in exchange for negotiated compensation.
******************************************************************************/

`timescale 1ns/1ps
`include ".\addressMap.v"

module stcLoop(
    input                       clk, reset,
    input                       clkEn,
    `ifdef USE_BUS_CLOCK
    input                       busClk,
    `endif
    input                       cs,
    input                       wr0,wr1,wr2,wr3,
    input               [12:0]  addr,
    input               [31:0]  din,
    output              [31:0]  dout,
    input       signed  [11:0]  phase,
    input       signed  [11:0]  freq,
    output      signed  [31:0]  carrierFreqOffset,
    output      signed  [31:0]  carrierLeadFreq,
    output                      carrierFreqEn,
    output  reg signed  [11:0]  phaseLoopError,
    output      signed  [11:0]  avgFreqError,
    output  reg                 freqAcquired,
    output  reg         [15:0]  lockCounter
    );

    parameter RegSpace = `CARRIERSPACE;


    /***************************** Control Registers ******************************/

    reg freqLoopSpace;
    always @* begin
        casex(addr)
            RegSpace:       freqLoopSpace = cs;
            default:        freqLoopSpace = 0;
        endcase
    end

    wire            [4:0]   leadExp;
    wire            [4:0]   phaseLagExp;
    wire            [4:0]   freqLagExp;
    wire    signed  [31:0]  upperLimit;
    wire    signed  [31:0]  lowerLimit;
    wire            [31:0]  loopOffset;
    wire            [31:0]  loopData;
    assign                  freqLagExp = loopData[4:0];
    wire            [15:0]  lockCount;
    wire            [11:0]  syncThreshold;
    wire    signed  [39:0]  lagAccum;
    carrierLoopRegs loopRegs(
        .cs(freqLoopSpace),
        .addr(addr),
        `ifdef USE_BUS_CLOCK
        .busClk(busClk),
        `endif
        .wr0(wr0),.wr1(wr1),.wr2(wr2),.wr3(wr3),
        .lagAccum(lagAccum[39:8]),
        .lockStatus(1'b0),
        .dataIn(din),
        .dataOut(dout),
        .invertError(invertError),
        .zeroError(zeroError),
        .ctrl2(sweepEnable),
        .clearAccum(clearAccum),
        .ctrl4(),
        .acqTrackControl(),
        .leadMan(),
        .leadExp(leadExp),
        .lagMan(),
        .lagExp(phaseLagExp),
        .upperLimit(upperLimit),
        .lowerLimit(lowerLimit),
        .loopData(loopData),
        .lockCount(lockCount),
        .syncThreshold(syncThreshold)
        );


    /**************************** Adjust Error ************************************/
    always @(posedge clk) begin
        if (zeroError || !freqAcquired) begin
            phaseLoopError <= 12'h0;
        end
        else if (invertError) begin
            phaseLoopError <= -phase;
        end
        else begin
            phaseLoopError <= phase;
        end
        freqLoopError <= freq;
    end

    reg         [3:0]   loopEnSR;
    wire                loopEn = loopEnSR[3];
    always @(posedge clk) begin
        if (reset) begin
            loopEnSR <= 0;
        end
        else begin
            loopEnSR <= {loopEnSR[2:0],clkEn};
        end
    end


    /***************************** Loop Filter ************************************/

    // Instantiate the lead/lag filter gain path
    wire    signed  [39:0]  leadError;
    leadGain12 leadGain (
        .clk(clk), .clkEn(1'b1), .reset(reset),
        .error(phaseLoopError),
        .leadExp(leadExp),
        .acqTrackControl(0),
        .track(1'b0),
        .leadError(leadError)
        );

    stcLagGain12 lagGain (
        .clk(clk), .clkEn(loopEnSR[0]), .reset(reset),
        .phaseError(phaseLoopError),
        .freqError(freqLoopError),
        .phaseLagExp(phaseLagExp),
        .freqLagExp(freqLagExp),
        .upperLimit(upperLimit),
        .lowerLimit(lowerLimit),
        .freqAcquired(freqAcquired),
        .clearAccum(clearAccum),
        .lagAccum(lagAccum)
        );

    // Final filter output
    reg signed  [39:0]  filterSum;
    always @(posedge clk) begin
        if (reset) begin
            filterSum <= 0;
        end
        else if (loopEn) begin
            filterSum <= lagAccum + leadError;
        end
    end

    /******************************* Freq Lock Detector ********************************/

    reg     [11:0]  absModeError;
    reg     [15:0]  avgAbsModeError;
    assign          avgFreqError = avgAbsModeError[15:4];
    wire    [16:0]  lockPlus = {1'b0,lockCounter} + 17'h00001;
    wire    [16:0]  lockMinus = {1'b0,lockCounter} + 17'h1ffff;
    always @(posedge clk) begin
        if (reset) begin
            lockCounter <= 0;
            freqAcquired <= 1;
            end
        else if (clkEn) begin
            absModeError <= $unsigned(freq[11] ? -freq : freq);
            avgAbsModeError <= avgAbsModeError - {4'b0,avgAbsModeError[15:4]} + {4'b0,absModeError};  
            if (avgAbsModeError > syncThreshold) begin
                if (lockCounter == (16'hffff - lockCount)) begin
                    freqAcquired <= 0;
                    lockCounter <= 0;
                    end
                else begin
                    lockCounter <= lockMinus[15:0];
                    end
                end
            else begin
                if (lockCounter == lockCount) begin
                    freqAcquired <= 1;
                    lockCounter <= 0;
                    end
                else begin
                    lockCounter <= lockPlus[15:0];
                    end
                end
            end
        end


    // Final Outputs
    assign carrierFreqOffset = $signed(lagAccum[39:8] + lagAccum[7]);
    assign carrierLeadFreq = $signed(leadError[39:8] + leadError[7]);
    assign carrierFreqEn = loopEn;

    `ifdef SIMULATE
    real carrierOffsetReal;
    real lagAccumReal;
    integer lockCounterInt;
    always @(carrierFreqOffset) carrierOffsetReal = $itor(carrierFreqOffset)/(2**31);
    always @(lagAccum[39:8]) lagAccumReal = $itor($signed(lagAccum[39:8]))/(2**31);
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
    .ddcClkEn(sync),
    .resampClkEn(sync),
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

