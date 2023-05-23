/******************************************************************************
Copyright 2008-2015 Koos Technical Services, Inc. All Rights Reserved

This source code is the Intellectual Property of Koos Technical Services,Inc.
(KTS) and is provided under a License Agreement which protects KTS' ownership and
derivative rights in exchange for negotiated compensation.
******************************************************************************/

`include "addressMap.v"
`timescale 1ns/1ps

`define ENABLE_SLIP

module bitsync(
    input                       clk, reset,
    input                       sym2xClkEn,
    input                       auResampClkEn,
    input               [4:0]   demodMode,
    input                       oqpskIthenQ,
    `ifdef ADD_DESPREADER
    input                       enableDespreader,
    `endif
    `ifdef USE_BUS_CLOCK
    input                       busClk,
    `endif
    input                       cs,
    input                       wr0,wr1,wr2,wr3,
    input               [12:0]  addr,
    input               [31:0]  din,
    output  reg         [31:0]  dout,
    input       signed  [17:0]  i,q,
    input       signed  [17:0]  au,
    input                       track,
    output      signed  [17:0]  offsetError,
    output                      offsetErrorEn,
    output              [15:0]  fskDeviation,
    output                      iSym2xEn,
    output                      iSymEn,
    output                      iSymClk,
    output  reg signed  [17:0]  symDataI,
    output  wire                iBitEn,
    output  reg                 iBit,
    output                      qSym2xEn,
    output                      qSymEn,
    output                      qSymClk,
    output  reg signed  [17:0]  symDataQ,
    output                      qBitEn,
    output  reg                 qBit,
    output              [31:0]  sampleFreq,
    output              [31:0]  auSampleFreq,
    output  reg                 bitsyncLock,
    output  reg         [15:0]  lockCounter,
    output  reg                 auBitsyncLock,
    output  reg         [15:0]  auLockCounter,
    output  reg                 auIQSwap,
    output                      sdiSymEn,
    output      signed  [17:0]  iTrellis,qTrellis,
    output  reg                 legacyBit,
    `ifdef CLF_SOQPSK_USE_RESAMP_PHASE
    output      signed  [11:0]  phase,
    `endif
    `ifdef ADD_LDPC
    output                      iLdpcSymEn,qLdpcSymEn,
    output  reg signed  [17:0]  iLdpc,qLdpc,
    `endif
    `ifdef ADD_SUPERBAUD_TED
    output  reg signed  [17:0]  bsError,
    output  reg                 bsErrorEn,
    output      signed  [17:0]  tedOutput,
    output                      tedOutputEn,
    output                      tedSyncPulse,
    output                      tedSymEnEven
    `else
    output  reg signed  [17:0]  bsError,
    output  reg                 bsErrorEn
    `endif
);

    `define USE_COMP
    `ifdef USE_COMP

    wire    signed  [17:0]  iComp,qComp;
    cicComp cicCompI(
        .clk(clk),
        .reset(reset),
        .clkEn(sym2xClkEn),
        .compIn(i),
        .compOut(iComp)
    );
    cicComp cicCompQ(
        .clk(clk),
        .reset(reset),
        .clkEn(sym2xClkEn),
        .compIn(q),
        .compOut(qComp)
    );
    //****************************** Two Sample Sum *******************************
    wire                    useCompFilter;
    wire                    useSummer;
    reg     signed  [17:0]  iDelay,qDelay;
    reg     signed  [17:0]  iFiltered,qFiltered;
    wire    signed  [18:0]  iSum = useCompFilter ? ({iDelay[17],iDelay} + {iComp[17],iComp})
                                                 : ({iDelay[17],iDelay} + {i[17],i});
    wire    signed  [18:0]  qSum = useCompFilter ? ({qDelay[17],qDelay} + {qComp[17],qComp})
                                                 : ({qDelay[17],qDelay} + {q[17],q});
    `ifdef ADD_SUPERBAUD_TED
    reg     signed  [17:0]  iTed,qTed;
    `endif
    always @(posedge clk) begin
        if (sym2xClkEn) begin
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
            `ifdef ADD_SUPERBAUD_TED
            iTed <= iSum[18:1];
            qTed <= qSum[18:1];
            `endif
        end
    end

    `else   //USE_COMP

    //****************************** Two Sample Sum *******************************
    reg     signed  [17:0]  iDelay,qDelay;
    reg     signed  [17:0]  iFiltered,qFiltered;
    wire    signed  [18:0]  iSum = {iDelay[17],iDelay} + {i[17],i};
    wire    signed  [18:0]  qSum = {qDelay[17],qDelay} + {q[17],q};
    always @(posedge clk) begin
        if (sym2xClkEn) begin
            iDelay <= i;
            qDelay <= q;
            iFiltered <= iSum[18:1];
            qFiltered <= qSum[18:1];
        end
    end

    `endif  //USE_COMP

    `ifdef ADD_DESPREADER
    /******************************************************************************
                                   Symbol Offset Deskew
    ******************************************************************************/
    reg signed  [17:0]  iMF,qMF,iSymDelay,qSymDelay;
    always @(posedge clk) begin
        if (sym2xClkEn) begin
            iSymDelay <= iFiltered;
            qSymDelay <= qFiltered;
            if (demodMode == `MODE_OQPSK) begin
                `ifdef ADD_LDPC
                iLdpc <= iFiltered;
                qLdpc <= qFiltered;
                `endif
                if (enableDespreader) begin
                    iMF <= iSymDelay;
                    qMF <= qFiltered;
                end
                else if (oqpskIthenQ) begin
                    iMF <= iSymDelay;
                    qMF <= qFiltered;
                end
                else begin
                    iMF <= iFiltered;
                    qMF <= qSymDelay;
                end
            end
            else if (demodMode == `MODE_SOQPSK) begin
                iMF <= iFiltered;
                qMF <= qSymDelay;
            end
            else begin
                iMF <= iFiltered;
                qMF <= qFiltered;
            end
        end
    end

    `else   //ADD_DESPREADER

    /******************************************************************************
                                   Symbol Offset Deskew
    ******************************************************************************/
    reg signed  [17:0]  iMF,qMF,iSymDelay,qSymDelay;
    always @(posedge clk) begin
        if (sym2xClkEn) begin
            iSymDelay <= iFiltered;
            qSymDelay <= qFiltered;
            if (demodMode == `MODE_SOQPSK) begin
                iMF <= iFiltered;
                qMF <= qSymDelay;
            end
            else if (demodMode == `MODE_OQPSK) begin
                `ifdef ADD_LDPC
                iLdpc <= iFiltered;
                qLdpc <= qFiltered;
                `endif
                if (oqpskIthenQ) begin
                    iMF <= iSymDelay;
                    qMF <= qFiltered;
                end
                else begin
                    iMF <= iFiltered;
                    qMF <= qSymDelay;
                end
            end
            else begin
                iMF <= iFiltered;
                qMF <= qFiltered;
            end
        end
    end

    `endif  //ADD_DESPREADER

    wire fmTrellisModes = ( (demodMode == `MODE_MULTIH)
                         || (demodMode == `MODE_PCMTRELLIS)
                          );

    `ifdef NEW_FM_TIMING
    reg signed  [17:0]  iTrellis,qTrellis;
    always @(posedge clk) begin
        if (sym2xClkEn) begin
            iTrellis <= iMF;
            qTrellis <= qMF;
        end
    end
    `else
    assign iTrellis = iMF;
    assign qTrellis = qMF;
    `endif

    `ifdef ADD_SUPERBAUD_TED
    //********************** Multih Superbaud TED *********************************
    multihSuperbaudTED ted(
        .clk(clk),
        .symEn(iBitEn),
        .sym2xEn(sym2xClkEn),
        .reset(reset),
        //.i(iTrellis),.q(qTrellis),
        .i(iTed),.q(qTed),
        .tedOutputEn(tedOutputEn),
        .tedOutput(tedOutput),
        .syncPulse(tedSyncPulse),
        .symEnEven(tedSymEnEven)
    );
    `endif //ADD_SUPERBAUD_TED


    //*********************** MF Frequency Discriminator **************************
    wire    signed  [11:0]   phase;
    vm_cordic cordic(
        .clk(clk),
        .ena(sym2xClkEn),
        .x(iMF[17:4]),.y(qMF[17:4]),
        .m(),
        .p(phase)
        );
    reg     signed  [11:0]  freqOut;
    reg     signed  [11:0]  prevPhase;
    wire    signed  [11:0]  phaseDiff = phase - prevPhase;
    always @(posedge clk) begin
        if (sym2xClkEn) begin
            if (phaseDiff == 12'h800) begin
                freqOut <= 0;
            end
            else begin
            freqOut <= phaseDiff;
            end
            prevPhase <= phase;
        end
    end

    wire    signed  [17:0]  freq = $signed({freqOut,6'b0});


    `ifdef SIMULATE
    real freqReal;
    always @(freq) freqReal = $itor(freq)/(2**17);
    real phaseReal;
    always @(phase) phaseReal = $itor(phase)/(2**11);
    `endif

//***************************** Timing Error Detector *************************

// State machine:
//      Based on two clocks per symbol. Similar to Gardner detector but uses
//      on-time samples to detect transitions

    reg tedState;
    parameter ONTIME =   1'b0;
    parameter OFFTIME =  1'b1;

    reg [1:0]slipState;
    parameter AVERAGE =  2'b00;
    parameter TEST =     2'b01;
    parameter SLIP0 =    2'b11;
    parameter SLIP1 =    2'b10;


    // Fifo of baseband inputs
    reg     signed  [17:0]  bbSRI[2:0];
    reg     signed  [17:0]  bbSRQ[2:0];
    `ifdef MULTIH_USE_GARDNER_TED
    wire fmModes = ( (demodMode == `MODE_2FSK)
                  || (demodMode == `MODE_PCMTRELLIS)
                  || (demodMode == `MODE_FM)
                   );
    wire multihMode = (demodMode == `MODE_MULTIH);
    `else //MULTIH_USE_GARDNER_TED
    wire fmModes = ( (demodMode == `MODE_2FSK)
                  || (demodMode == `MODE_MULTIH)
                  || (demodMode == `MODE_PCMTRELLIS)
                  || (demodMode == `MODE_FM)
                   );
    `endif // MULTIH_USE_GARDNER_TED
    wire dualRailModes = ( (demodMode == `MODE_QPSK)
                        || (demodMode == `MODE_OQPSK)
                        || (demodMode == `MODE_SOQPSK)
                        || (demodMode == `MODE_AQPSK)
                        || (demodMode == `MODE_AUQPSK)
                        || (demodMode == `MODE_UQPSK)
                         );
    always @(posedge clk) begin
        if (sym2xClkEn) begin
            // Shift register of baseband sample values
            if (fmModes) begin
                bbSRI[0] <= freq;
                bbSRQ[0] <= freq;
            end
            else if (demodMode == `MODE_PM) begin
                bbSRI[0] <= $signed({phase,6'b0});
                bbSRQ[0] <= $signed({phase,6'b0});
            end
            else if (dualRailModes) begin
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
        end
    end


    // Timing error variables
    wire    signed  [17:0]  earlyOnTimeI = bbSRI[2];
    wire    signed  [17:0]  offTimeI = bbSRI[1];
    wire    signed  [17:0]  lateOnTimeI = bbSRI[0];
    wire    signed  [17:0]  earlyOnTimeQ = bbSRQ[2];
    wire    signed  [17:0]  offTimeQ = bbSRQ[1];
    wire    signed  [17:0]  lateOnTimeQ = bbSRQ[0];
    wire                    lateSignI = bbSRI[0][17];
    wire                    earlySignI = bbSRI[2][17];
    wire                    earlySignQ = bbSRQ[2][17];
    wire                    lateSignQ = bbSRQ[0][17];
    wire    signed  [17:0]  absEarlyI = earlySignI ? -bbSRI[2] : bbSRI[2];
    wire    signed  [17:0]  absLateI = lateSignI ? -bbSRI[0] : bbSRI[0];
    wire    signed  [17:0]  absEarlyQ = earlySignQ ? -bbSRQ[2] : bbSRQ[2];
    wire    signed  [17:0]  absLateQ = lateSignQ ? -bbSRQ[0] : bbSRQ[0];

    reg     signed  [17:0]  timingErrorI;
    reg     signed  [17:0]  timingErrorQ;
    wire    signed  [18:0]  timingError = timingErrorI + timingErrorQ;
    assign                  timingErrorEn = (tedState == ONTIME);

    wire            [11:0]  syncThreshold;
    wire    signed  [17:0]  multihThreshold = $signed({syncThreshold,6'b0});
    wire    signed  [17:0]  negMultihThreshold = -multihThreshold;

    //`define MULTIH_USE_GARDNER_TED
    `ifdef  MULTIH_USE_GARDNER_TED
    wire    signed  [31:0]  gardnerTED;
    assign  gardnerTED = offTimeI * (lateOnTimeI - earlyOnTimeI);
    `endif

    // DC Offset error variables
    reg     signed  [18:0]  dcError;
    wire                    offsetEn = (tedState == OFFTIME);
    assign                  offsetError = dcError[18:1];
    assign                  offsetErrorEn = offsetEn;

    // Deviation variables
    reg     signed  [17:0]  deviation;
    wire    signed  [17:0]  absDeviation = deviation[17] ? -deviation : deviation;

    reg                     stateMachineSlip;
    `ifdef ENABLE_SMSLIP
    wire                    slip = stateMachineSlip;
    `else
    reg                     slip;
    `endif
    reg                     slipped;
    reg     signed  [17:0]  slipError;
    wire    signed  [17:0]  absError = timingErrorI[17] ? -timingErrorI : timingErrorI;
    wire    signed  [17:0]  absSlipError = slipError[17] ? -slipError : slipError;
    reg     signed  [21:0]  avgError;
    reg     signed  [21:0]  avgSlipError;
    reg             [3:0]   avgCount;

    // Used to detect when to take a sample for deviation estimation
    reg                     transition;
    reg             [1:0]   noTransitionCount;

    // This is used to show there are transitions on the incoming data
    reg             [7:0]   transitionCount;
    reg                     transitionsDetected;

    //------------------- Timing error detector state machine -----------------
    always @(posedge clk) begin
        if (reset) begin
            tedState <= ONTIME;
            slipped <= 0;
            timingErrorI <= 0;
            timingErrorQ <= 0;
            dcError <= 0;
            transitionsDetected <= 0;
            transitionCount <= 0;
        end
        else if (sym2xClkEn) begin
            case (tedState)
                ONTIME: begin
                    `ifdef ENABLE_SLIP
                    if (slip && ~slipped) begin
                        tedState <= ONTIME;

                    end
                    else begin
                        tedState <= OFFTIME;
                    end
                    `else
                    tedState = OFFTIME;
                    `endif
                    slipped <= slip;
                end
                OFFTIME: begin
                    tedState <= ONTIME;
                    `ifndef ADD_SUPERBAUD_TED
                    `ifdef MULTIH_USE_GARDNER_TED
                    if (demodMode == `MODE_MULTIH) begin

                        timingErrorI <= gardnerTED[30:13];
                        timingErrorQ <= gardnerTED[30:13];
                        transition <= 1;

                    end
                    else begin
                    `else  //MULTIH_USE_GARDNER_TED
                    if (demodMode == `MODE_MULTIH) begin
                        // Are the early and late symbols opposite polarity?
                        if (earlySignI != lateSignI) begin
                            // Yes. Are they of the same deviation?
                            if ( (absEarlyI < multihThreshold) && (absLateI < multihThreshold)
                                || (absEarlyI >= multihThreshold) && (absLateI >= multihThreshold)) begin
                                // Yes.
                                transition <= 1;
                                // High to low?
                                if (earlySignI) begin
                                    timingErrorI <= offTimeI;
                                    slipError <= lateOnTimeI;
                                end
                                // Or low to high?
                                else begin
                                    timingErrorI <= -offTimeI;
                                    slipError <= earlyOnTimeI;
                                end
                            end
                            else begin
                                transition <= 0;
                                timingErrorI <= 8'h0;
                                timingErrorQ <= 8'h0;
                            end
                        end
                        else begin
                            transition <= 0;
                            timingErrorI <= 8'h0;
                            timingErrorQ <= 8'h0;
                        end
                    end
                    else begin
                    `endif //MULTIH_USE_GARDNER_TED
                    `else //ADD_SUPERBAUD_TED
                    begin
                    `endif
                        // Is there a data transition on I?
                        if (earlySignI != lateSignI) begin
                            // Yes. Set transition flags
                            transition <= 1;
                            noTransitionCount <= 0;

                            // Calculate DC offset error
                            transitionCount <= 255;
                            dcError <= earlyOnTimeI + lateOnTimeI;

                            // Now, timing error
                            // High to low transition?
                            if (earlySignI) begin
                                timingErrorI <= offTimeI;
                                slipError <= lateOnTimeI;
                            end
                            // Or low to high?
                            else begin
                                timingErrorI <= -offTimeI;
                                slipError <= earlyOnTimeI;
                            end
                        end
                        else begin
                            transition <= 0;
                            if (noTransitionCount < 3) begin
                                noTransitionCount <= noTransitionCount + 1;
                            end

                            dcError <= 0;
                            if (transitionCount > 0) begin
                                transitionCount <= transitionCount - 1;
                            end
                            else begin
                                transitionsDetected <= 0;
                            end

                            timingErrorI <= 0;

                            // We capture deviation samples whenever there
                            // is not a transition.
                            deviation <= lateOnTimeI;
                        end
                        // Is there a data transition on Q?
                        if (earlySignQ != lateSignQ) begin
                            // High to low transition?
                            if (earlySignQ) begin
                                timingErrorQ <= offTimeQ;
                            end
                            // Or low to high?
                            else begin
                                timingErrorQ <= -offTimeQ;
                            end
                        end
                        else begin
                            timingErrorQ <= 18'h00;
                        end
                    end
                end
            endcase
        end
    end

    //----------------- Averaging/Slip state machine --------------------------
    always @(posedge clk) begin
        if (reset) begin
            slipState <= AVERAGE;
            avgCount <= 15;
            avgError <= 0;
            avgSlipError <= 0;
        end
        else if (sym2xClkEn) begin
            case (slipState)
                AVERAGE: begin
                    stateMachineSlip <= 0;
                    if (timingErrorEn && transition) begin
                    avgError <= avgError + absError;
                    avgSlipError <= avgSlipError + absSlipError;
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
                    // Is the slip error less than 1/2 of the average timing error
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
    wire    signed  [17:0]  timingErr = timingError[18:1];
    real timingErrorReal;
    always @(timingErr) timingErrorReal = $itor(timingErr)/(2**17);
    real iMFReal;
    always @(iMF) iMFReal = $itor(iMF)/(2**17);
    real qMFReal;
    always @(qMF) qMFReal = $itor(qMF)/(2**17);
    `endif

    `define DEVIATION_USE_LONGER_AVG
    `ifdef DEVIATION_USE_LONGER_AVG
    // Calculation of average DC offset (freq offset in FSK mode) and average FSK deviation.
    // This is an alpha/(1-alpha) filter where alpha = 1/(2^17).
    reg             [34:0]  avgDeviation;
    assign                  fskDeviation = avgDeviation[34:19];
    always @(posedge clk) begin
        if (reset) begin
            avgDeviation <= 0;
        end
        else if (sym2xClkEn) begin
            // Only use deviations isolated from a transition.
            if (offsetEn && (noTransitionCount > 0) && (earlySignI == lateSignI)) begin
                avgDeviation <= (avgDeviation - {{17{avgDeviation[34]}},avgDeviation[34:17]})
                              + {{17{absDeviation[17]}},absDeviation};
            end
        end
    end
    `else // DEVIATION_USE_LONGER_AVG
    // Calculation of average DC offset (freq offset in FSK mode) and average FSK deviation.
    reg             [24:0]  avgDeviation;
    assign                  fskDeviation = avgDeviation[24:9];
    always @(posedge clk) begin
        if (reset) begin
            avgDeviation <= 0;
        end
        else if (sym2xClkEn) begin
            // Only use deviations isolated from a transition.
            if (offsetEn && (noTransitionCount > 0) && (earlySignI == lateSignI)) begin
                avgDeviation <= (avgDeviation - {{7{avgDeviation[24]}},avgDeviation[24:7]})
                              + {{7{absDeviation[17]}},absDeviation};
            end
        end
    end
    `endif // DEVIATION_USE_LONGER_AVG

    `ifdef SIMULATE
    reg     [24:0]  avgOffsetError;
    always @(posedge clk) begin
        if (reset) begin
            avgOffsetError <= 0;
            end
        else if (sym2xClkEn) begin
            if (offsetEn && transition) begin
                avgOffsetError <= (avgOffsetError - {{7{avgOffsetError[24]}},avgOffsetError[24:7]})
                                + {{7{dcError[17]}},dcError};
            end
        end
    end

    `ifdef SILOS
    real avgOffsetReal;
    always @* avgOffsetReal = $itor($signed(avgOffsetError[24:7]))/(2**17);
    real avgDevReal;
    always @* avgDevReal = $itor(avgDeviation[24:7])/(2**17);
    `endif

    `endif

    //******************************** Loop Filter ********************************
    wire            [15:0]  lockCount;
    reg     signed  [11:0]  loopFilterError;
    reg                     loopFilterEn;
    always @* begin
        casex (demodMode)
            `ifdef ADD_SUPERBAUD_TED
            `MODE_MULTIH: begin
                loopFilterError = $signed(tedOutput[17:6]);
                loopFilterEn = sym2xClkEn;
            end
            `endif
            default: begin
                loopFilterError = $signed(timingError[18:7] + timingError[6]);
                loopFilterEn = (sym2xClkEn & timingErrorEn);
            end
        endcase
    end

    reg bitsyncSpace;
    always @* begin
        casex(addr)
            `BITSYNCSPACE:  bitsyncSpace = cs;
            default:        bitsyncSpace = 0;
        endcase
    end
    wire    [31:0]  bsDout;
    loopFilter sampleLoop(
        .clk(clk),
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
        .track(track),
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
    always @(posedge clk) begin
        bsError <= $signed(timingError[18:1] + timingError[0]);
        bsErrorEn <= loopFilterEn;
        end
    `else
    assign bsError = $signed(timingError[18:1] + timingError[0]);
    assign bsErrorEn = loopFilterEn;
    `endif


    //************************** Lock Detector ************************************

    wire    [16:0]  lockPlus = {1'b0,lockCounter} + 17'h00001;
    wire    [16:0]  lockMinus = {1'b0,lockCounter} + 17'h1ffff;
    always @(posedge clk) begin
        if (reset) begin
            lockCounter <= 0;
            bitsyncLock <= 0;
            slip <= 0;
        end
        else if (sym2xClkEn) begin
            if (slipState == TEST) begin
                if (avgError[21:14] > {1'b0,avgSlipError[21:15]}) begin
                    if (lockCounter == (16'hffff-lockCount)) begin
                        bitsyncLock <= 0;
                        lockCounter <= 16'h0;
                        //slip <= 1;
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
            else begin
                //slip <= 0;
            end
        end
    end


    `ifdef SILOS
    real sampleFreqReal;
    always @(sampleFreq) sampleFreqReal = ((sampleFreq > 2147483647.0) ? sampleFreq-4294967296.0 : sampleFreq)/2147483648.0;
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

    wire auEnable = ((demodMode == `MODE_AQPSK) || (demodMode == `MODE_AUQPSK));

    //****************************** Two Sample Sum *******************************
    reg     signed  [17:0]  auDelay;
    reg     signed  [17:0]  auMF;
    wire    signed  [18:0]  auSum = auDelay + au;
    always @(posedge clk) begin
        if (auResampClkEn) begin
            auDelay <= au;
            auMF <= $signed(auSum[18:1]);
        end
    end

//*************************** AU Timing Error Detector ************************

    // State machine:
    //      Based on two clocks per symbol

    reg                     auTedState;
    wire                    auTimingErrorEn = (auTedState == ONTIME);

    // Fifo of baseband inputs
    reg     signed  [17:0]  auSR[2:0];
    always @(posedge clk) begin
        if (auResampClkEn) begin
            // Shift register of baseband sample values
            auSR[0] <= auMF;
            auSR[1] <= auSR[0];
            auSR[2] <= auSR[1];
        end
    end

    // Timing error variables
    wire    signed  [17:0]  auEarlyOnTime = auSR[2];
    wire    signed  [17:0]  auOffTime = auSR[1];
    wire    signed  [17:0]  auLateOnTime = auSR[0];
    wire                    auEarlySign = auSR[2][17];
    wire                    auLateSign = auSR[0][17];

    // Variables used for lock detection
    reg     signed  [17:0]  auOffTimeLevel;
    reg     signed  [17:0]  auOnTimeLevel;
    reg                     auTransition;

    // Variables used to slip the TED to break false locks
    reg                     auSlip;
    reg                     auSlipped;

    //-------------------------- TED State Machine ----------------------------
    always @(posedge clk) begin
        if (!auEnable) begin
            auTedState <= ONTIME;
            auOffTimeLevel <= 0;
            auSlipped <= 0;
        end
        else if (auResampClkEn) begin

            case (auTedState)
                ONTIME: begin
                    `ifdef ENABLE_SLIP
                    if (auSlip && ~auSlipped) begin
                        auTedState <= ONTIME;

                    end
                    else begin
                        auTedState <= OFFTIME;
                    end
                    `else
                    auTedState = OFFTIME;
                    `endif
                    auSlipped <= auSlip;
                end
                OFFTIME: begin
                    auTedState <= ONTIME;
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
                            auOffTimeLevel <= -auOffTime;
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
    always @(auTimingErr) auTimingErrorReal = $itor(auTimingErr)/(2**17);
    `endif

    //******************************** Loop Filter ********************************

    reg auBitsyncSpace;
    always @* begin
        casex(addr)
            `BITSYNCAUSPACE:    auBitsyncSpace = cs;
            default:            auBitsyncSpace = 0;
        endcase
    end

    wire    [31:0]  auDout;
    wire    [11:0]  auSyncThreshold;
    wire    [15:0]  auLockCount;
    wire            auLoopFilterEn = (auResampClkEn & auTimingErrorEn);
    loopFilter auSampleLoop(
        .clk(clk),
        .clkEn(auLoopFilterEn),
        .reset(reset),
        `ifdef USE_BUS_CLOCK
        .busClk(busClk),
        `endif
        .cs(auBitsyncSpace),
        .wr0(wr0),.wr1(wr1),.wr2(wr2),.wr3(wr3),
        .addr(addr),
        .din(din),
        .dout(auDout),
        .error(auOffTimeLevel[17:6] + auOffTimeLevel[5]),
        .track(1'b1),
        .loopFreq(auSampleFreq),
        .ctrl2(),
        .ctrl4(),
        .satPos(),
        .satNeg(),
        .lockCount(auLockCount),
        .syncThreshold(auSyncThreshold)
    );


    //************************** Lock Detector ************************************

    reg             [1:0]   auAvgState;
    wire            [7:0]   auSwapCount = auSyncThreshold[7:0];
    reg             [7:0]   auSwapCounter;
    wire            [16:0]  auLockPlus = {1'b0,auLockCounter} + 17'h00001;
    wire            [16:0]  auLockMinus = {1'b0,auLockCounter} + 17'h1ffff;
    wire    signed  [17:0]  auOffTimeMag = auOffTimeLevel[17] ? -auOffTimeLevel : auOffTimeLevel;
    wire    signed  [17:0]  auOnTimeMag = auOnTimeLevel[17] ? -auOnTimeLevel : auOnTimeLevel;
    reg     signed  [21:0]  avgAuOffTimeMag;
    reg     signed  [21:0]  avgAuOnTimeMag;
    reg             [3:0]   auAvgCount;
    always @(posedge clk) begin
        if (!auEnable) begin
            auAvgState <= AVERAGE;
            auLockCounter <= 0;
            auBitsyncLock <= 0;
            auAvgCount <= 15;
            avgAuOffTimeMag <= 0;
            avgAuOnTimeMag <= 0;
            auIQSwap <= 0;
            auSwapCounter <= auSwapCount;
        end
        else if (auResampClkEn) begin
            // Averaging state machine
            case (auAvgState)
                AVERAGE: begin
                    if (auTimingErrorEn && auTransition) begin
                        avgAuOffTimeMag <= avgAuOffTimeMag + auOffTimeMag;
                        avgAuOnTimeMag <= avgAuOnTimeMag + auOnTimeMag;
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
                    auAvgState <= AVERAGE;
                end
                default: begin
                    auAvgCount <= 15;
                    avgAuOffTimeMag <= 0;
                    avgAuOnTimeMag <= 0;
                    auAvgState <= AVERAGE;
                end
            endcase
            if (auAvgState == TEST) begin
                // Test if the on time sample average is less than 1/2 the off time sample average
                // This is an indication that we are out of lock.
                if (avgAuOffTimeMag[21:14] > {1'b0,avgAuOnTimeMag[21:15]}) begin
                    // Are we out of lock?
                    if (auLockCounter == (16'hffff - auLockCount)) begin
                        // Yes. Update the status flag and force a slip on the
                        // assumed timing.
                        auBitsyncLock <= 0;
                        auLockCounter <= 16'h0;
                        //auSlip <= 1;
                        // Is the higher rate channel locked?
                        if (bitsyncLock) begin
                            // Yes. Is it time to force an I/Q swap?
                            if (auSwapCounter > 0) begin
                                auSwapCounter <= auSwapCounter - 1;
                            end
                            else begin
                                auSwapCounter <= auSwapCount;
                                auIQSwap <= ~auIQSwap;
                            end
                        end
                        else begin
                            // No. Swap I and Q and try again.
                            auSwapCounter <= auSwapCount;
                            auIQSwap <= ~auIQSwap;
                        end
                    end
                    else begin
                        auLockCounter <= auLockMinus[15:0];
                    end
                end
                else begin
                    // Is it time to declare victory?
                    if (auLockCounter == auLockCount) begin
                        // Yes.
                        auBitsyncLock <= 1;
                        auLockCounter <= 16'h0;
                        auSwapCounter <= auSwapCount;
                    end
                    else begin
                        auLockCounter <= auLockPlus[15:0];
                    end
                end
            end
            else begin
                auSlip <= 0;
            end
        end
    end


    /******************************************************************************
                                    uP dout mux
    ******************************************************************************/
    always @* begin
        casex (addr)
            `BITSYNCSPACE:      dout = bsDout;
            `BITSYNCAUSPACE:    dout = auDout;
            default:            dout = 32'bx;
        endcase
    end




    /******************************************************************************
                               Recovered Clock and Data
    ******************************************************************************/


    `define ENABLE_MULTIH
    `ifdef ENABLE_MULTIH
    always @(posedge clk) begin

        // I channel outputs
        if (sym2xClkEn) begin
            // Capture the I output sample
            if (fmModes) begin
                symDataI <= freq;
            end
            else if (demodMode == `MODE_PM) begin
                symDataI <= $signed({phase,6'b0});
            end
            else begin
                symDataI <= iMF;
            end
            if (timingErrorEn) begin
                if (fmModes) begin
                    iBit <= bbSRI[1][17];
                end
                else begin
                    iBit <= bbSRI[1][17];
                end
            end
            if (timingErrorEn) begin
                legacyBit <= bbSRI[1][17];
            end
        end

        // Q channel outputs
        if (auEnable) begin
            if (auResampClkEn) begin
                symDataQ <= auSR[1];
                if (auTimingErrorEn) begin
                    qBit <= auSR[1][17];
                end
            end
        end
        else begin
            if (sym2xClkEn) begin
                // Capture the Q output sample
                if (fmModes) begin
                    symDataQ <= 0;
                end
                else if (demodMode == `MODE_PM) begin
                    symDataQ <= 0;
                end
                else begin
                    symDataQ <= qMF;
                end

                if (demodMode == `MODE_MULTIH) begin
                    if (timingErrorEn) begin
                        if (bbSRQ[1][17]) begin
                            qBit <= (bbSRQ[1] < negMultihThreshold);
                        end
                        else begin
                            qBit <= (bbSRQ[1] < multihThreshold);
                        end
                    end
                end
                else begin
                    if (timingErrorEn) begin
                        qBit <= bbSRQ[1][17];
                    end
                end
            end
        end
    end

    `else   //ENABLE_MULTIH

    always @(posedge clk) begin

        // I channel outputs
        if (sym2xClkEn) begin
            // Capture the I output sample
            symDataI <= bbSRI[1];
            if (timingErrorEn) begin
                if (fmModes) begin
                    iBit <= bbSRI[1][17];
                end
                else begin
                    iBit <= bbSRI[1][17];
                end
            end
        end

        // Q channel outputs
        if (auEnable) begin
            if (auResampClkEn) begin
                symDataQ <= auSR[1];
                if (auTimingErrorEn) begin
                    qBit <= auSR[1][17];
                end
            end
        end
        else begin
            if (sym2xClkEn) begin
                // Capture the Q output sample
                symDataQ <= bbSRQ[1];
                if (timingErrorEn) begin
                    qBit <= bbSRQ[1][17];
                end
            end
        end
    end

    `endif  //ENABLE_MULTIH

    // Clock Enables
    assign iSym2xEn = sym2xClkEn;
    assign iSymEn = sym2xClkEn & !timingErrorEn;
    assign sdiSymEn = sym2xClkEn & !timingErrorEn;
    assign iSymClk = timingErrorEn;
    assign iBitEn = sym2xClkEn & timingErrorEn;
    assign qSym2xEn = auEnable ? auResampClkEn : sym2xClkEn;
    assign qSymEn = auEnable ? (auResampClkEn & !auTimingErrorEn) : (sym2xClkEn & !timingErrorEn);
    assign qSymClk = auTimingErrorEn;
    assign qBitEn = auEnable ? (auResampClkEn & auTimingErrorEn) : (sym2xClkEn & timingErrorEn);

    `ifdef ADD_LDPC
    assign iLdpcSymEn = sym2xClkEn & timingErrorEn;
    assign qLdpcSymEn = sym2xClkEn & !timingErrorEn;
    `endif


    `ifdef SIMULATE
    real symDataIReal;
    always @(symDataI) symDataIReal = $itor(symDataI)/(2**17);
    `endif

endmodule


