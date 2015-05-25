`include "./addressMap.v"
`timescale 1ns / 10 ps

module demod(
    clk, reset,
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
    demodMode,
    eyeSync,
    iEye,qEye,
    vt_bus,
    `ifdef INTERNAL_ADAPT
    eyeOffset,
    avgDeviation
    `else
    eyeOffset
    `endif
    );

input           clk;
input           reset;
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
output          eyeSync;
output  [17:0]  iEye,qEye;
output  [4:0]   eyeOffset;
`ifdef INTERNAL_ADAPT
output  [31:0]  avgDeviation;
`endif

input   [31 : 0]    vt_bus;

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
wire    [2:0]   cma_stepExpo;
wire    [15:0]  cma_refLevel;
wire            cma_enable;
wire            cma_wtReset;
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
    .amTC(amTC),
    .cma_stepExpo(cma_stepExpo),  // output [2 : 0]
    .cma_refLevel(cma_refLevel), // output [15 : 0]
    .cma_enable(cma_enable), // output
    .cma_wtReset(cma_wtReset) // output
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
    .clk(clk), .reset(reset),
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
                             Multi-Path Equalizer
******************************************************************************/
reg cma_reset;
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// A good simulation requires reset to be held until data is provided to the
// inputs of the cma. This creates a delayed reset with synchronous
// release based on observed simulation data.
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
`ifdef SIMULATE
reg sim_init;
initial begin
    sim_init = 1;
    #160_000;
    sim_init = 0;
    end
always @ (posedge clk) begin
    if (sim_init) begin
        cma_reset <= 1;
        end
    else if (ddcSync) begin
        cma_reset <= 0;
        end
    end
`else //SIMULATE
always @* cma_reset = reset;
`endif //SIMULATE

`ifndef CMA
wire [17:0]iEqOut = iDdc;
wire [17:0]qEqOut = qDdc;

`else
wire [17:0]iEqOut;
wire [17:0]qEqOut;

cma cma(
    .clk        (clk                ),  // input
    .clkEn      (ddcSync            ),  // input
    .reset      (cma_reset          ),  // input
    `ifdef TERMITE
    .stepExpo   (vt_bus[18 : 16]    ),  // input [2 : 0]
    .refLevel   (vt_bus[15 : 0]     ),  // input [15 : 0]
    .bypass     (!vt_bus[24]        ),  // input
    .wtReset    (vt_bus[25]         ),  // input
    `else
    .stepExpo   (cma_stepExpo       ),
    .refLevel   (cma_refLevel       ),
    .bypass     (!cma_enable        ),
    .wtReset    (cma_wtReset        ),
    `endif
    .iIn        (iDdc               ),  // input [17 : 0]
    .qIn        (qDdc               ),  // input [17 : 0]
    .iOut       (iEqOut             ),  // output [17 : 0]
    .qOut       (qEqOut             )   // output [17 : 0]
    );

`endif //CMA
/******************************************************************************
                           Phase/Freq/Mag Detector
******************************************************************************/
wire    [11:0]   phase;
wire    [11:0]   phaseError;
wire    [11:0]   freq;
wire    [11:0]   negFreq = ~freq + 1;
wire    [11:0]   freqError;
wire    [12:0]   mag;
fmDemod fmDemod(
    .clk(clk), .reset(reset), .sync(ddcSync),
    .iFm(iEqOut),
    .qFm(qEqOut),
    .demodMode(demodMode),
    .phase(phase),
    .phaseError(phaseError),
    .freq(freq),
    .freqError(freqError),
    .mag(mag),
    .syncOut(demodSync)
    );

reg     [17:0]  iDdc0;
reg     [17:0]  qDdc0;
wire    [35:0]  term1,term2;
mpy18x18WithCe mult1(
    .clk(clk),
    .ce(ddcSync),
    .a(qDdc0),
    .b(iEqOut),
    .p(term1)
    );
mpy18x18WithCe mult2(
    .clk(clk),
    .ce(ddcSync),
    .a(iDdc0),
    .b(qEqOut),
    .p(term2)
    );

wire    [35:0]  diff = term2 - term1;
wire    [17:0]  fmVideo = diff[34:17];
always @(posedge clk) begin
    if (ddcSync) begin
        iDdc0 <= iEqOut;
        qDdc0 <= qEqOut;
        end
    end

`ifdef SIMULATE
real    fmVideoReal; always @* fmVideoReal = $itor($signed(fmVideo))/(2**17);
real    iDdcReal; always @* iDdcReal = $itor($signed(iEqOut))/(2**17);
real    qDdcReal; always @* qDdcReal = $itor($signed(qEqOut))/(2**17);
real    iDdc0Real,qDdc0Real;
real    term0Real,term1Real,diffReal;
always @(posedge clk) begin
    if (ddcSync) begin
        iDdc0Real <= iDdcReal;
        qDdc0Real <= qDdcReal;
        term0Real <= iDdcReal*qDdc0Real;
        term1Real <= qDdcReal*iDdc0Real;
        diffReal <= term1Real - term0Real;
        end
    end
`endif


wire    [17:0]  fm = {negFreq,6'h0};
wire    [17:0]  fmInv = {freq,6'h0};

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
    .upperLimit(32'h7fffffff),
    .lowerLimit(32'h00000000),
    .clearAccum(1'b0),
    .sweepEnable(1'b0),
    .acqTrackControl(2'b0),
    .track(1'b0),
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

// Average the absolute value of the frequency error.
reg     [17:0]  averageAbsFreq;
wire    [35:0]  absAlpha;
reg     [17:0]  absFreqSample;
mpy18x18 mpyFLD2(
    .clk(clk),
    .sclr(reset),
    .a(absFreqSample),
    .b({falseLockAlpha,2'b0}),
    .p(absAlpha)
    );
wire    [35:0]  oneMinusAbsAlpha;
wire    [35:0]  absAlphaSum = absAlpha + oneMinusAbsAlpha;
mpy18x18 mpyFLD3(
    .clk(clk),
    .sclr(reset),
    .a(averageAbsFreq),
    .b(oneMinusFalseLockAlpha),
    .p(oneMinusAbsAlpha)
    );


reg     [17:0]  nextFreqSample;
reg     [17:0]  nextAbsSample;
always @(demodMode or fm or fmInv or freqError) begin
    casex (demodMode)
        `MODE_OQPSK,
        `MODE_SOQPSK: begin
            nextFreqSample = fm;
            nextAbsSample = fm[17] ? fmInv : fm;
            end
        default: begin
            nextFreqSample = {freqError,6'h0};
            nextAbsSample = 0;
            end
        endcase
    end

wire    [17:0]  negAverageFreq = -averageFreq;
wire    [17:0]  absAverageFreq = averageFreq[17] ? negAverageFreq : averageFreq;
always @(posedge clk) begin
    if (demodSync) begin
        freqSample <= nextFreqSample;
        absFreqSample <= nextAbsSample;
        averageFreq <= alphaSum[34:17];
        averageAbsFreq <= absAlphaSum[34:17];
        end
    end

always @(posedge clk) begin
    if (demodSync) begin
        if (averageAbsFreq > 18'h10000) begin
            highFreqOffset <= 1;
            end
        else if (absAverageFreq > falseLockThreshold) begin
            highFreqOffset <= !carrierLock;
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
    if (ddcSync) begin
        if (auIQSwap) begin
            iSwap <= qEqOut; //qDdc;
            qSwap <= iEqOut; //iDdc;
            end
        else begin
            iSwap <= iEqOut; //iDdc;
            qSwap <= qEqOut; //qDdc;
            end
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
    .sampleOffset(eyeOffset),
    .auSyncOut(auResampSync)
    );

// Delay the ddc output samples to line things up with the eyeOffset
reg     [17:0]  iSwap0,iSwap1,iSwap2;
reg     [17:0]  qSwap0,qSwap1,qSwap2;
reg     [7:0]   ddcSyncSR;
always @(posedge clk) begin
    ddcSyncSR <= {ddcSyncSR[6:0],ddcSync};
    iSwap0 <= iSwap;
    iSwap1 <= iSwap0;
    iSwap2 <= iSwap1;
    qSwap0 <= qSwap;
    qSwap1 <= qSwap0;
    qSwap2 <= qSwap1;
    end

//assign eyeSync = ddcSyncSR[2];
//assign iEye = iSwap2;
//assign qEye = qSwap2;

/******************************************************************************
                                Bitsync Loop
******************************************************************************/
wire    [17:0]  iSymData;
wire    [17:0]  qSymData;
wire      [17:0]  bsError;
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
    .i(iResamp), .q(qResamp),
    .au(qResamp),
    .offsetError(offsetError),
    .offsetErrorEn(offsetErrorEn),
    .fskDeviation(fskDeviation),
    `ifdef INTERNAL_ADAPT
    .avgDeviation(avgDeviation),
    `endif
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
    .iTrellis(iTrellis),.qTrellis(qTrellis),
    .bsError(bsError), .bsErrorEn(bsErrorEn)
    );

assign trellisSymSync = iSymEn & resampSync;

assign eyeSync = resampSync;
assign cordicModes = ( (demodMode == `MODE_2FSK)
                    || (demodMode == `MODE_PCMTRELLIS)
                    || (demodMode == `MODE_FM)
                    || (demodMode == `MODE_PM));

assign iEye = cordicModes ? iSymData : iResamp;
assign qEye = cordicModes ? qSymData : qResamp;


/******************************************************************************
                               DAC Output Mux
******************************************************************************/

`ifdef FM_FILTER
// Programmable FIR
wire    [15:0]  c0c14, c1c13, c2c12, c3c11, c4c10, c5c9 , c6c8 , c7  ;
reg             firspace;
always @(addr) begin
    casex (addr)
        `VIDFIRSPACE: begin
            firspace = 1;
            end
        default: begin
            firspace = 0;
            end
        endcase
    end

wire    [31:0]  firDout;
dualFirCoeffRegs firCoeffRegs (
    .addr    (addr   ),
    .dataIn  (din    ),
    .dataOut (firDout),
    .cs      (firspace),
    .wr0     (wr0), .wr1(wr1), .wr2(wr2), .wr3(wr3),
    .c0      (c0c14  ),
    .c1      (c1c13  ),
    .c2      (c2c12  ),
    .c3      (c3c11  ),
    .c4      (c4c10  ),
    .c5      (c5c9   ),
    .c6      (c6c8   ),
    .c7      (c7     )
    );

wire    [17:0]  firOut;
singleFir interpFir(
    .clk        (clk),
    .reset      (reset),
    .syncIn     (demodSync),
    .c0c14      (c0c14  ),
    .c1c13      (c1c13  ),
    .c2c12      (c2c12  ),
    .c3c11      (c3c11  ),
    .c4c10      (c4c10  ),
    .c5c9       (c5c9   ),
    .c6c8       (c6c8   ),
    .c7         (c7     ),
    .in         (fm),
    .out        (firOut)
    );
`endif

wire fmMode = (demodMode == `MODE_FM);
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
            `ifdef FM_FILTER
            dac0Data <= firOut;
            `else
            if (fmMode) begin
                dac0Data <= fmVideo;
                dac0Sync <= ddcSync;
                end
            else begin
                dac0Data <= fm;
                dac0Sync <= demodSync;
                end
            `endif
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
            if (fmMode) begin
                dac1Data <= fmVideo;
                dac1Sync <= ddcSync;
                end
            else begin
                dac1Data <= fm;
                dac1Sync <= demodSync;
                end
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
            dac1Data <= averageAbsFreq;
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
            if (fmMode) begin
                dac2Data <= fmVideo;
                dac2Sync <= ddcSync;
                end
            else begin
                dac2Data <= fm;
                dac2Sync <= demodSync;
                end
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
            dac2Data <= bsError;
            dac2Sync <= bsErrorEn;
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

/******************************************************************************
                                uP dout mux
******************************************************************************/
reg [31:0]dout;
always @(addr or
         demodDout or
         `ifdef FM_FILTER
         firDout or
         `endif
         ddcDout or
         nbAgcDout or
         resampDout or
         freqDout or
         bitsyncDout) begin
    casex (addr)
        `DEMODSPACE:        dout <= demodDout;
        `ifdef FM_FILTER
        `VIDFIRSPACE:       dout <= firDout;
        `endif
        `CHAGCSPACE:        dout <= nbAgcDout;
        `CICDECSPACE,
        `DDCFIRSPACE,
        `DDCSPACE:          dout <= ddcDout;
        `RESAMPSPACE:       dout <= resampDout;
        `BITSYNCAUSPACE,
        `BITSYNCSPACE:      dout <= bitsyncDout;
        `CARRIERSPACE:      dout <= freqDout;
        default:            dout <= 32'bx;
        endcase
    end

endmodule
