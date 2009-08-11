`include "./addressMap.v"
`timescale 1ns / 10 ps

module demod( 
    clk, reset, syncIn, 
    rd, wr0,wr1,wr2,wr3,
    addr,
    din,
    dout,
    iRx, qRx, 
    iSym2xEn,
    iSymEn,
    iSymData,
    iBit,
    qSym2xEn,
    qSymEn,
    qSymClk,
    qSymData,
    qBit,
    bitsyncLock,
    carrierLock,
    trellisSymSync,
    iTrellis,
    qTrellis,
    dac0Select,dac1Select,dac2Select,
    dac0Sync,
    dac0Data,
    dac1Sync,
    dac1Data,
    dac2Sync,
    dac2Data,
    demodMode
    );

input           clk;
input           reset;
input           syncIn;
input           rd,wr0,wr1,wr2,wr3;
input   [11:0]  addr;
input   [31:0]  din;
output  [31:0]  dout;
input   [17:0]  iRx;
input   [17:0]  qRx;
output          iSym2xEn;
output          iSymEn;
output          iBit;
output [17:0]   iSymData;
output          qSym2xEn;
output          qSymEn;
output          qSymClk;
output          qBit;
output [17:0]   qSymData;
output          bitsyncLock;
output          carrierLock;
output          trellisSymSync;
output  [17:0]  iTrellis,qTrellis;
output  [3:0]   dac0Select,dac1Select,dac2Select;
output          dac0Sync;
output  [17:0]  dac0Data;
output          dac1Sync;
output  [17:0]  dac1Data;
output          dac2Sync;
output  [17:0]  dac2Data;
output  [3:0]   demodMode;



/******************************************************************************
                                Global Registers
******************************************************************************/
// Microprocessor interface
reg demodSpace;
always @(addr) begin
    casex(addr)
        `DEMODSPACE: demodSpace <= 1;
        default:     demodSpace <= 0;
        endcase
    end
wire    [15:0]  fskDeviation;
wire    [1:0]   bitsyncMode;
wire    [15:0]  falseLockAlpha;
wire    [15:0]  falseLockThreshold;
wire    [4:0]   amTC;
reg             highFreqOffset;
wire    [31:0]  demodDout;
demodRegs demodRegs(
    .addr(addr),
    .dataIn(din),
    .dataOut(demodDout),
    .cs(demodSpace),
    .wr0(wr0), .wr1(wr1), .wr2(wr2), .wr3(wr3),
    .highFreqOffset(highFreqOffset),
    .bitsyncLock(bitsyncLock),
    .auBitsyncLock(auBitsyncLock),
    .demodLock(carrierLock),
    .fskDeviation(fskDeviation),
    .demodMode(demodMode),
    .bitsyncMode(bitsyncMode),
    .dac0Select(dac0Select),
    .dac1Select(dac1Select),
    .dac2Select(dac2Select),
    .falseLockAlpha(falseLockAlpha),
    .falseLockThreshold(falseLockThreshold),
    .amTC(amTC)
    );

/******************************************************************************
                                Downconverter
******************************************************************************/
wire    [17:0]  iDdc,qDdc;
wire    [20:0]  nbAgcGain;
wire    [31:0]  carrierFreqOffset;
wire    [31:0]  carrierLeadFreq;
wire    [31:0]  ddcDout;
ddc ddc( 
    .clk(clk), .reset(reset), .syncIn(syncIn), 
    .wr0(wr0) , .wr1(wr1), .wr2(wr2), .wr3(wr3),
    .addr(addr),
    .din(din),
    .dout(ddcDout),
    .ddcFreqOffset(carrierFreqOffset),
    .leadFreq(carrierLeadFreq),
    .offsetEn(carrierOffsetEn),
    .nbAgcGain(nbAgcGain),
    .syncOut(ddcSync),
    .iIn(iRx), .qIn(qRx), 
    .iOut(iDdc), .qOut(qDdc)
    );

/******************************************************************************
                            Narrowband Channel AGC
******************************************************************************/
wire    [31:0]  nbAgcDout;
channelAGC channelAGC( 
    .clk(clk), .reset(reset), .syncIn(ddcSync),
    .wr0(wr0) , .wr1(wr1), .wr2(wr2), .wr3(wr3),
    .addr(addr),
    .din(din),
    .dout(nbAgcDout),
    .iIn(iDdc),.qIn(qDdc),
    .agcGain(nbAgcGain)
    );
    

/******************************************************************************
                           Phase/Freq/Mag Detector
******************************************************************************/
wire    [11:0]   phase;
wire    [11:0]   phaseError;
wire    [11:0]   freq;
wire    [11:0]   freqError;
wire    [12:0]   mag;
fmDemod fmDemod( 
    .clk(clk), .reset(reset), .sync(ddcSync),
    .iFm(iDdc),.qFm(qDdc),
    .demodMode(demodMode),
    .phase(phase),
    .phaseError(phaseError),
    .freq(freq),
    .freqError(freqError),
    .mag(mag),
    .syncOut(demodSync)
    );

/******************************************************************************
                           Magnitude Filter
******************************************************************************/
reg     [13:0]  magError;
wire    [39:0]  magAccum;
always @(posedge clk) begin
    if (demodSync) begin
        magError <= {1'b0,mag} - magAccum[39:25];
        end
    end
lagGain12 magLoop(
    .clk(clk), .clkEn(demodSync), .reset(reset), 
    .error(magError[13:2]),
    .lagExp(amTC),
    .limit(32'h7fffffff),
    .clearAccum(1'b0),
    .sweepEnable(1'b0),
    .lagAccum(magAccum)
    );


/******************************************************************************
                             False Lock Detector
******************************************************************************/

// Average the frequency error.
reg     [17:0]  averageFreq;
wire    [17:0]  oneMinusFalseLockAlpha = (18'h20000 + ~{falseLockAlpha,2'b0});
wire    [35:0]  alpha;
reg     [17:0]  freqSample;
mpy18x18 mpyFLD0(
    .clk(clk), 
    .sclr(reset),
    .a(freqSample), 
    .b({falseLockAlpha,2'b0}), 
    .p(alpha)
    );
wire    [35:0]  oneMinusAlpha;
wire    [35:0]  alphaSum = alpha + oneMinusAlpha;
mpy18x18 mpyFLD1(
    .clk(clk), 
    .sclr(reset),
    .a(averageFreq), 
    .b(oneMinusFalseLockAlpha), 
    .p(oneMinusAlpha)
    );
wire    [17:0]  negAverageFreq = -averageFreq;
wire    [17:0]  absAverageFreq = averageFreq[17] ? negAverageFreq : averageFreq;
always @(posedge clk) begin
    if (demodSync) begin
        if ( (demodMode == `MODE_OQPSK)
          || (demodMode == `MODE_SOQPSK)) begin
            freqSample <= {freq,6'h0};
            end
        else begin
            freqSample <= {freqError,6'h0};
            end
        averageFreq <= alphaSum[34:17];
        if (absAverageFreq > falseLockThreshold) begin
            highFreqOffset <= 1;
            end
        else begin
            highFreqOffset <= 0;
            end
        end
    end




/******************************************************************************
                             AFC/Sweep/Costas Loop
******************************************************************************/
wire    [17:0]  offsetError;
wire    [11:0]   rndOffsetError = offsetError[17:6] + offsetError[5];
wire    [11:0]   demodLoopError;
wire    [15:0]  freqLockCounter;
wire    [31:0]  freqDout;
carrierLoop carrierLoop(
    .clk(clk), .reset(reset),
    .resampSync(resampSync),
    .ddcSync(demodSync),
    .wr0(wr0),.wr1(wr1),.wr2(wr2),.wr3(wr3),
    .addr(addr),
    .din(din),
    .dout(freqDout),
    .demodMode(demodMode),
    .phase(phase),
    .freq(freq),
    .highFreqOffset(highFreqOffset),
    .offsetError(rndOffsetError),
    .offsetErrorEn(offsetErrorEn),
    .carrierFreqOffset(carrierFreqOffset),
    .carrierLeadFreq(carrierLeadFreq),
    .carrierFreqEn(carrierOffsetEn),
    .loopError(demodLoopError),
    .carrierLock(carrierLock),
    .lockCounter(freqLockCounter)
    );

/******************************************************************************
                                  I/Q Swap
******************************************************************************/
wire            auIQSwap;
reg     [17:0]  iSwap,qSwap;
always @(posedge clk) begin
    if (auIQSwap) begin
        iSwap <= qDdc;
        qSwap <= iDdc;
        end
    else begin
        iSwap <= iDdc;
        qSwap <= qDdc;
        end
    end

/******************************************************************************
                                  Resampler
******************************************************************************/
wire    [17:0]  iResamp,qResamp;
wire    [31:0]  resamplerFreqOffset;
wire    [31:0]  auResamplerFreqOffset;
wire    [31:0]  resampDout;
dualResampler resampler(
    .clk(clk), .reset(reset), .sync(ddcSync),
    .wr0(wr0) , .wr1(wr1), .wr2(wr2), .wr3(wr3),
    .addr(addr),
    .din(din),
    .dout(resampDout),
    .demodMode(demodMode),
    .resamplerFreqOffset(resamplerFreqOffset),
    .auResamplerFreqOffset(auResamplerFreqOffset),
    .offsetEn(1'b1),
    .auOffsetEn(1'b1),
    .iIn(iSwap),
    .qIn(qSwap),
    .iOut(iResamp),
    .qOut(qResamp),
    .syncOut(resampSync),
    .auSyncOut(auResampSync)
    );

/******************************************************************************
                               Symbol Offset Deskew
******************************************************************************/
reg     [17:0]  iSym,qSym,qDelay;
always @(posedge clk) begin
    if (resampSync) begin
        iSym <= iResamp;
        qDelay <= qResamp;
        if ( (demodMode == `MODE_OQPSK)
          || (demodMode == `MODE_SOQPSK)) begin
            qSym <= qDelay;
            end
        else begin
            qSym <= qResamp;
            end
        end
    end

/******************************************************************************
                                Bitsync Loop
******************************************************************************/
wire    [17:0]  iSymData;
wire    [17:0]  qSymData;
wire    [15:0]  bsLockCounter;
wire    [15:0]  auLockCounter;
wire    [31:0]  bitsyncDout;
bitsync bitsync(
    .sampleClk(clk), .reset(reset), 
    .symTimes2Sync(resampSync),
    .auResampSync(auResampSync),
    .demodMode(demodMode),
    .bitsyncMode(bitsyncMode),
    .wr0(wr0),.wr1(wr1),.wr2(wr2),.wr3(wr3),
    .addr(addr),
    .din(din),
    .dout(bitsyncDout),
    .i(iSym), .q(qSym),
    .au(qResamp),
    .offsetError(offsetError),
    .offsetErrorEn(offsetErrorEn),
    .fskDeviation(fskDeviation),
    .iSym2xEn(iSym2xEn),
    .iSymEn(iSymEn),
    .symDataI(iSymData),
    .bitDataI(iBit),
    .qSym2xEn(qSym2xEn),
    .qSymEn(qSymEn),
    .qSymClk(qSymClk),
    .symDataQ(qSymData),
    .bitDataQ(qBit),
    .sampleFreq(resamplerFreqOffset),
    .auSampleFreq(auResamplerFreqOffset),
    .bitsyncLock(bitsyncLock),
    .lockCounter(bsLockCounter),
    .auBitsyncLock(auBitsyncLock),
    .auLockCounter(auLockCounter),
    .auIQSwap(auIQSwap),
    .iMF(iTrellis),.qMF(qTrellis)
    );

assign trellisSymSync = iSymEn & resampSync;

/******************************************************************************
                               DAC Output Mux
******************************************************************************/

//`define SKIP_DATAMUX
`ifdef SKIP_DATAMUX
assign dac0Data = iSwap;
assign dac0Sync = ddcSync;
assign dac1Data = qSwap;
assign dac1Sync = ddcSync;
`else
reg             dac0Sync;
reg     [17:0]  dac0Data;
reg             dac1Sync;
reg     [17:0]  dac1Data;
reg             dac2Sync;
reg     [17:0]  dac2Data;
always @(posedge clk) begin
    case (dac0Select) 
        `DAC_I: begin
            dac0Data <= iSwap;
            dac0Sync <= ddcSync;
            end
        `DAC_Q: begin
            dac0Data <= qSwap;
            dac0Sync <= ddcSync;
            end
        `DAC_ISYM: begin
            dac0Data <= iSymData;
            dac0Sync <= resampSync;
            end
        `DAC_QSYM: begin
            dac0Data <= qSymData;
            dac0Sync <= resampSync;
            end
        `DAC_FREQ: begin
            dac0Data <= {freq,6'h0};
            dac0Sync <= demodSync;
            end
        `DAC_PHASE: begin
            dac0Data <= {phase,6'b0};
            dac0Sync <= demodSync;
            end
        `DAC_MAG: begin
            //dac0Data <= {~mag[8],mag[7:0],9'b0};
            dac0Data <= {~magAccum[38],magAccum[37:21]};
            dac0Sync <= demodSync;
            end
        `DAC_PHERROR: begin
            dac0Data <= {demodLoopError,6'h0};
            dac0Sync <= carrierOffsetEn;
            end
        `DAC_BSLOCK: begin
            dac0Data <= {auLockCounter,2'b0};
            dac0Sync <= 1'b1;
            end
        `DAC_FREQLOCK: begin
            dac0Data <= {freqLockCounter,2'b0};
            dac0Sync <= 1'b1;
            end
        `DAC_AVGFREQ: begin
            dac0Data <= averageFreq;
            dac0Sync <= ddcSync;
            end
        `DAC_FREQERROR: begin
            dac0Data <= {freqError,6'h0};
            dac0Sync <= demodSync;
            end
        default: begin
            dac0Data <= iSwap;
            dac0Sync <= ddcSync;
            end
        endcase

    case (dac1Select) 
        `DAC_I: begin
            dac1Data <= iSwap;
            dac1Sync <= ddcSync;
            end
        `DAC_Q: begin
            dac1Data <= qSwap;
            dac1Sync <= ddcSync;
            end
        `DAC_ISYM: begin
            dac1Data <= iSymData;
            dac1Sync <= resampSync;
            end
        `DAC_QSYM: begin
            dac1Data <= qSymData;
            dac1Sync <= resampSync;
            end
        `DAC_FREQ: begin
            dac1Data <= {freq,6'h0};
            dac1Sync <= demodSync;
            end
        `DAC_PHASE: begin
            dac1Data <= {phase,6'b0};
            dac1Sync <= demodSync;
            end
        `DAC_MAG: begin
            //dac1Data <= {~mag[8],mag[7:0],9'b0};
            dac1Data <= {~magAccum[38],magAccum[37:21]};
            dac1Sync <= demodSync;
            end
        `DAC_PHERROR: begin
            dac1Data <= {demodLoopError,6'h0};
            dac1Sync <= carrierOffsetEn;
            end
        `DAC_BSLOCK: begin
            dac1Data <= {bsLockCounter,2'b0};
            dac1Sync <= 1'b1;
            end
        `DAC_FREQLOCK: begin
            dac1Data <= {freqLockCounter,2'b0};
            dac1Sync <= 1'b1;
            end
        `DAC_AVGFREQ: begin
            dac1Data <= averageFreq;
            dac1Sync <= ddcSync;
            end
        `DAC_FREQERROR: begin
            dac1Data <= {freqError,6'h0};
            dac1Sync <= demodSync;
            end
        default: begin
            dac1Data <= iSwap;
            dac1Sync <= ddcSync;
            end
        endcase

    case (dac2Select) 
        `DAC_I: begin
            dac2Data <= iSwap;
            dac2Sync <= ddcSync;
            end
        `DAC_Q: begin
            dac2Data <= qSwap;
            dac2Sync <= ddcSync;
            end
        `DAC_ISYM: begin
            dac2Data <= iSymData;
            dac2Sync <= resampSync;
            end
        `DAC_QSYM: begin
            dac2Data <= qSymData;
            dac2Sync <= resampSync;
            end
        `DAC_FREQ: begin
            dac2Data <= {freq,6'h0};
            dac2Sync <= demodSync;
            end
        `DAC_PHASE: begin
            dac2Data <= {phase,6'b0};
            dac2Sync <= demodSync;
            end
        `DAC_MAG: begin
            //dac2Data <= {~mag[8],mag[7:0],9'b0};
            dac2Data <= {~magAccum[38],magAccum[37:21]};
            dac2Sync <= demodSync;
            end
        `DAC_PHERROR: begin
            dac2Data <= {demodLoopError,6'h0};
            dac2Sync <= carrierOffsetEn;
            end
        `DAC_BSLOCK: begin
            dac2Data <= {bsLockCounter,2'b0};
            dac2Sync <= 1'b1;
            end
        `DAC_FREQLOCK: begin
            dac2Data <= {freqLockCounter,2'b0};
            dac2Sync <= 1'b1;
            end
        `DAC_AVGFREQ: begin
            dac2Data <= averageFreq;
            dac2Sync <= ddcSync;
            end
        `DAC_FREQERROR: begin
            dac2Data <= {freqError,6'h0};
            dac2Sync <= demodSync;
            end
        default: begin
            dac2Data <= iSwap;
            dac2Sync <= ddcSync;
            end
        endcase

    end
`endif

/******************************************************************************
                                uP dout mux
******************************************************************************/
reg [31:0]dout;
always @(addr or 
         demodDout or
         ddcDout or
         nbAgcDout or
         resampDout or 
         freqDout or
         bitsyncDout) begin
    casex (addr)
        `DEMODSPACE:        dout <= demodDout;
        `CHAGCSPACE:        dout <= nbAgcDout;
        `CICDECSPACE,
        `DDCSPACE:          dout <= ddcDout;
        `RESAMPSPACE:       dout <= resampDout;
        `BITSYNCAUSPACE,
        `BITSYNCSPACE:      dout <= bitsyncDout;
        `CARRIERSPACE:      dout <= freqDout;
        default:            dout <= 32'bx;
        endcase
    end

endmodule
