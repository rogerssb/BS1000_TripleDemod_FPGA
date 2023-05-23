/******************************************************************************
Copyright 2008-2015 Koos Technical Services, Inc. All Rights Reserved

This source code is the Intellectual Property of Koos Technical Services,Inc.
(KTS) and is provided under a License Agreement which protects KTS' ownership and
derivative rights in exchange for negotiated compensation.
******************************************************************************/

`include "./addressMap.v"
`timescale 1ns/1ps

`define ENABLE_SLIP

module singleBitsync(
    input                       sampleClk,
    input                       reset,
    input                       clkEn,
    `ifdef USE_BUS_CLOCK
    input                       busClk,
    `endif
    input                       cs,
    input                       wr0,wr1,wr2,wr3,
    input               [12:0]  addr,
    input               [31:0]  din,
    output              [31:0]  dout,
    input       signed  [17:0]  bsInput,
    output                      sym2xEn,
    output                      symEn,
    output                      symClk,
    output  reg signed  [17:0]  symData,
    output  reg                 bitData,
    output      signed  [31:0]  sampleFreq,
    output  reg                 lock,
    output  reg         [15:0]  lockCounter,
    output  reg signed  [17:0]  bsError,
    output  reg                 bsErrorEn,
    output  reg signed  [17:0]  dcError,
    output  reg                 transitionsDetected
);


    //****************************** Two Sample Sum *******************************
    wire                    useSummer;
    reg     signed  [17:0]  bsInputDelay;
    reg     signed  [17:0]  bsInputMF;
    wire    signed  [18:0]  bsInputSum = ({bsInputDelay[17],bsInputDelay} + {bsInput[17],bsInput});
    always @(posedge sampleClk) begin
        if (clkEn) begin
            bsInputDelay <= bsInput;
            if (useSummer) begin
                bsInputMF <= bsInputSum[18:1];
            end
            else begin
                bsInputMF <= bsInputDelay;
            end
        end
    end

//****************************** Timing Error Detector ************************

    // State machine:
    //      Based on two clocks per symbol

    reg                     phaseState;
    wire                    timingErrorEn = (phaseState == ONTIME);
    wire                    offsetEn = (phaseState == OFFTIME);
    parameter ONTIME =   1'b0;
    parameter OFFTIME =  1'b1;

    reg             [1:0]   slipState;
    parameter AVERAGE =  2'b00;
    parameter TEST =     2'b01;
    parameter SLIP0 =    2'b11;
    parameter SLIP1 =    2'b10;

    // Fifo of baseband inputs
    reg     signed  [17:0]  bbSRI[2:0];
    always @(posedge sampleClk) begin
        if (clkEn) begin
            bbSRI[0] <= bsInputMF;
            bbSRI[1] <= bbSRI[0];
            bbSRI[2] <= bbSRI[1];
        end
    end

    // Timing error variables
    wire                    earlySignI = bbSRI[2][17];
    wire            [17:0]  absEarlyI = earlySignI ? -bbSRI[2] : bbSRI[2];
    wire                    lateSignI = bbSRI[0][17];
    wire            [17:0]  absLateI = lateSignI ? -bbSRI[0] : bbSRI[0];
    wire    signed  [17:0]  earlyOnTimeI = bbSRI[2];
    wire    signed  [17:0]  offTimeI = bbSRI[1];
    wire    signed  [17:0]  lateOnTimeI = bbSRI[0];


    reg     signed  [17:0]  timingError;

    reg                     stateMachineSlip;
    `ifdef ENABLE_SMSLIP
    wire                    slip = stateMachineSlip;
    `else
    reg                     slip;
    `endif
    reg                     slipped;
    reg     signed  [17:0]  slipError;
    wire            [17:0]  absError = timingError[17] ? -timingError : timingError;
    wire            [17:0]  absSlipError = slipError[17] ? (~slipError + 1) : slipError;
    reg             [21:0]  avgError;
    reg             [21:0]  avgSlipError;
    reg             [3:0]   avgCount;
    reg                     transition;
    reg             [7:0]   transitionCount;

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
            transitionCount <= 0;
            transitionsDetected <= 0;
        end
        else if (clkEn) begin
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
                        transitionsDetected <= 1;
                        transitionCount <= 255;
                        dcError <= earlyOnTimeI;

                        // Calculate the timing error
                        // High to low transition?
                        if (earlySignI) begin
                            timingError <= offTimeI;
                            slipError <= lateOnTimeI;
                        end
                        // Or low to high?
                        else begin
                            timingError <= -offTimeI;
                            slipError <= earlyOnTimeI;
                        end
                    end
                    else begin
                        transition <= 0;
                        dcError <= 0;
                        if (transitionCount > 0) begin
                            transitionCount <= transitionCount - 1;
                        end
                        else begin
                            transitionsDetected <= 0;
                        end
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
    real timingErrorReal;
    real bsInputMFReal;
    real ch1MFReal;
    always @(timingError) timingErrorReal = ((timingError > 131071.0) ? timingError - 262144.0 : timingError)/131072.0;
    always @(bsInputMF) bsInputMFReal = (bsInputMF[17] ? bsInputMF - 262144.0 : bsInputMF)/131072.0;
    always @(ch1MF) ch1MFReal = (ch1MF[17] ? ch1MF - 262144.0 : ch1MF)/131072.0;
    `endif

    //******************************** Loop Filter ********************************

    reg bitsyncSpace;
    always @* begin
        casex(addr)
            `SBS_BITSYNCSPACE:  bitsyncSpace = cs;
            default:            bitsyncSpace = 0;
            endcase
        end
    wire    [15:0]  lockCount;
    reg             loopFilterEn;
    reg     [11:0]  loopFilterError;
    always @* begin
        loopFilterError = timingError[17:6] + timingError[5];
        loopFilterEn = (clkEn & timingErrorEn);
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
        .dout(dout),
        .error(loopFilterError),
        .track(1'b1),
        .loopFreq(sampleFreq),
        .ctrl2(),
        .ctrl4(useSummer),
        .satPos(),
        .satNeg(),
        .lockCount(lockCount),
        .syncThreshold()
    );

    `define RECLOCK_BSERROR
    `ifdef RECLOCK_BSERROR
    always @(posedge sampleClk) begin
        bsError <= timingError;
        bsErrorEn <= loopFilterEn;
        end
    `else
    assign bsError = timingError;
    assign bsErrorEn = loopFilterEn;
    `endif


    //************************** Lock Detector ************************************

    wire    [16:0]  lockPlus = {1'b0,lockCounter} + 17'h00001;
    wire    [16:0]  lockMinus = {1'b0,lockCounter} + 17'h1ffff;
    always @(posedge sampleClk) begin
        if (reset) begin
            lockCounter <= 0;
            lock <= 0;
            slip <= 0;
            end
        else if (clkEn) begin
            if (slipState == TEST) begin
                if (avgError[21:12] > {1'b0,avgSlipError[21:13]}) begin
                    if (lockCounter == (16'hffff-lockCount)) begin
                        lock <= 0;
                        lockCounter <= 16'h0;
                        slip <= 1;
                    end
                    else begin
                        lockCounter <= lockMinus[15:0];
                    end
                end
                else begin
                    if (lockCounter == lockCount) begin
                        lock <= 1;
                        lockCounter <= 16'h0;
                    end
                    else begin
                        lockCounter <= lockPlus[15:0];
                    end
                end
            end
            else begin
                slip <= 0;
            end
        end
    end


    `ifdef SIMULATE
    real sampleFreqReal;
    always @* sampleFreqReal = $itor($signed(sampleFreq))/(2**31);
    `endif


    /******************************************************************************
                               Recovered Clock and Data
    ******************************************************************************/


    always @(posedge sampleClk) begin
        if (clkEn) begin
            // Capture the I output sample
            symData <= bbSRI[0];
            if (timingErrorEn) begin
                bitData <= bbSRI[1][17];
            end
        end
    end

    // Clock Enables
    assign sym2xEn = clkEn;
    assign symEn = clkEn & timingErrorEn;
    assign symClk = timingErrorEn;


    `ifdef SIMULATE
    real symDataReal;
    always @(symData) symDataReal = $itor($signed(symData))/(2**17);
    `endif

endmodule


