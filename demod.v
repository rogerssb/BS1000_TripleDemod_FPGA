`timescale 1ns / 10 ps

module demod( 
    clk, reset, syncIn, 
    rd, wr0,wr1,wr2,wr3,
    addr,
    din,
    dout,
    iRx, qRx, 
    iDataClk,
    iBit,
    qDataClk,
    qBit,
    bitsyncLock,
    carrierLock,
    symTimes2Sync,
    symSync,
    dac0Sync,
    dac0Data,
    dac1Sync,
    dac1Data,
    dac2Sync,
    dac2Data
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
output          iDataClk;
output          iBit;
output          qDataClk;
output          qBit;
output          bitsyncLock;
output          carrierLock;
output          symTimes2Sync;
output          symSync;
output          dac0Sync;
output  [17:0]  dac0Data;
output          dac1Sync;
output  [17:0]  dac1Data;
output          dac2Sync;
output  [17:0]  dac2Data;



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
wire    [2:0]   demodMode;
wire    [3:0]   dac0Select;
wire    [3:0]   dac1Select;
wire    [3:0]   dac2Select;
wire    [31:0]  demodDout;
demodRegs demodRegs(
    .addr(addr),
    .dataIn(din),
    .dataOut(demodDout),
    .cs(demodSpace),
    .wr0(wr0), .wr1(wr1), .wr2(wr2), .wr3(wr3),
    .demodMode(demodMode),
    .dac0Select(dac0Select),
    .dac1Select(dac1Select),
    .dac2Select(dac2Select)
    );

/******************************************************************************
                                Downconverter
******************************************************************************/
wire    [17:0]  iDdc,qDdc;
wire    [20:0]  nbAgcGain;
wire    [31:0]  carrierFreqOffset;
wire    [31:0]  ddcDout;
ddc ddc( 
    .clk(clk), .reset(reset), .syncIn(syncIn), 
    .wr0(wr0) , .wr1(wr1), .wr2(wr2), .wr3(wr3),
    .addr(addr),
    .din(din),
    .dout(ddcDout),
    .ddcFreqOffset(carrierFreqOffset),
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
    

//`define RESAMPLER_FIRST
`ifdef RESAMPLER_FIRST
/******************************************************************************
                                  Resampler
******************************************************************************/
wire    [17:0]  iResamp,qResamp;
wire    [31:0]  resamplerFreqOffset;
wire    [31:0]  resampDout;
resampler resampler(
    .clk(clk), .reset(reset), .sync(ddcSync),
    .wr0(wr0) , .wr1(wr1), .wr2(wr2), .wr3(wr3),
    .addr(addr),
    .din(din),
    .dout(resampDout),
    .resamplerFreqOffset(resamplerFreqOffset),
    .offsetEn(1'b1),
    .iIn(iDdc),
    .qIn(qDdc),
    .iOut(iResamp),
    .qOut(qResamp),
    .syncOut(resampSync)
    );

/******************************************************************************
                               Symbol Offset Deskew
******************************************************************************/
reg     [17:0]  iSym,qSym,qDelay;
always @(posedge clk) begin
    if (resampSync) begin
        iSym <= iResamp;
        qDelay <= qResamp;
        if (demodMode == `MODE_OQPSK) begin
            qSym <= qDelay;
            end
        else begin
            qSym <= qResamp;
            end
        end
    end

/******************************************************************************
                           Phase/Freq/Mag Detector
******************************************************************************/
wire    [7:0]   phase;
wire    [7:0]   freq;
wire    [8:0]   mag;
fmDemod fmDemod( 
    .clk(clk), .reset(reset), .sync(resampSync),
    .iFm(iSym),.qFm(qSym),
    .phase(phase),
    .freq(freq),
    .mag(mag)
    );


/******************************************************************************
                             AFC/Sweep/Costas Loop
******************************************************************************/
wire    [17:0]   offsetError;
wire    [31:0]  freqDout;
carrierLoop carrierLoop(
    .clk(clk), .reset(reset),
    .resampSync(resampSync),
    .ddcSync(ddcSync),
    .wr0(wr0),.wr1(wr1),.wr2(wr2),.wr3(wr3),
    .addr(addr),
    .din(din),
    .dout(freqDout),
    .demodMode(demodMode),
    .phase(phase),
    .freq(freq),
    .offsetError(offsetError[17:10]),
    .offsetErrorEn(offsetErrorEn),
    .carrierFreqOffset(carrierFreqOffset),
    .carrierFreqEn(carrierOffsetEn)
    );

/******************************************************************************
                                Bitsync Loop
******************************************************************************/
wire    [31:0]  bitsyncDout;
wire    [17:0]  demodData;
bitsync bitsync(
    .sampleClk(clk), .reset(reset), 
    .symTimes2Sync(resampSync),
    .demodMode(demodMode),
    .wr0(wr0),.wr1(wr1),.wr2(wr2),.wr3(wr3),
    .addr(addr),
    .din(din),
    .dout(bitsyncDout),
    .i({freq,10'b0}),.q(),
    .offsetError(offsetError),
    .offsetErrorEn(offsetErrorEn),
    .symClk(symClk),
    .symData(demodData),
    .bitClk(demodClk),
    .bitData(demodBit),
    .sampleFreq(resamplerFreqOffset)
    );


`else   // RESAMPLER_FIRST

/******************************************************************************
                           Phase/Freq/Mag Detector
******************************************************************************/
wire    [7:0]   phase;
wire    [7:0]   freq;
wire    [8:0]   mag;
fmDemod fmDemod( 
    .clk(clk), .reset(reset), .sync(ddcSync),
    .iFm(iDdc),.qFm(qDdc),
    .phase(phase),
    .freq(freq),
    .mag(mag)
    );


/******************************************************************************
                             AFC/Sweep/Costas Loop
******************************************************************************/
wire    [17:0]  offsetError;
wire    [7:0]   phaseError;
wire    [31:0]  freqDout;
carrierLoop carrierLoop(
    .clk(clk), .reset(reset),
    .resampSync(resampSync),
    .ddcSync(ddcSync),
    .wr0(wr0),.wr1(wr1),.wr2(wr2),.wr3(wr3),
    .addr(addr),
    .din(din),
    .dout(freqDout),
    .demodMode(demodMode),
    .phase(phase),
    .freq(freq),
    .offsetError(offsetError[17:10]),
    .offsetErrorEn(offsetErrorEn),
    .carrierFreqOffset(carrierFreqOffset),
    .carrierFreqEn(carrierOffsetEn),
    .loopError(phaseError),
    .carrierLock(carrierLock)
    );

/******************************************************************************
                                  Resampler
******************************************************************************/
reg     [17:0]  iResampIn,qResampIn;
always @(posedge clk) begin
    case (demodMode)
        `MODE_2FSK: begin
            iResampIn <= {freq,10'b0};
            qResampIn <= 0;
            end
        default: begin
            iResampIn <= iDdc;
            qResampIn <= qDdc;
            end
        endcase
    end
wire    [17:0]  iResamp,qResamp;
wire    [31:0]  resamplerFreqOffset;
wire    [31:0]  resampDout;
resampler resampler(
    .clk(clk), .reset(reset), .sync(ddcSync),
    .wr0(wr0) , .wr1(wr1), .wr2(wr2), .wr3(wr3),
    .addr(addr),
    .din(din),
    .dout(resampDout),
    .resamplerFreqOffset(resamplerFreqOffset),
    .offsetEn(1'b1),
    .iIn(iResampIn),
    .qIn(qResampIn),
    .iOut(iResamp),
    .qOut(qResamp),
    .syncOut(resampSync)
    );

/******************************************************************************
                               Symbol Offset Deskew
******************************************************************************/
reg     [17:0]  iSym,qSym,qDelay;
always @(posedge clk) begin
    if (resampSync) begin
        iSym <= iResamp;
        qDelay <= qResamp;
        if (demodMode == `MODE_OQPSK) begin
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
wire    [17:0]  demodData;
wire    [15:0]  bsLockCounter;
wire    [31:0]  bitsyncDout;
bitsync bitsync(
    .sampleClk(clk), .reset(reset), 
    .symTimes2Sync(resampSync),
    .demodMode(demodMode),
    .wr0(wr0),.wr1(wr1),.wr2(wr2),.wr3(wr3),
    .addr(addr),
    .din(din),
    .dout(bitsyncDout),
    .i(iSym), .q(qSym),
    .offsetError(offsetError),
    .offsetErrorEn(offsetErrorEn),
    .symClk(symClk),
    .symData(demodData),
    .bitClk(demodClk),
    .bitData(demodBit),
    .sampleFreq(resamplerFreqOffset),
    .bitsyncLock(bitsyncLock),
    .lockCounter(bsLockCounter)
    );

assign symTimes2Sync = resampSync;
assign symSync = symClk & resampSync;

`endif  // RESAMPLER_FIRST

/******************************************************************************
                               Data Output Mux
******************************************************************************/
reg iDataClk,iBit;
reg qDataClk,qBit;
always @(demodMode or demodClk or demodBit) begin
    iDataClk <= demodClk;
    iBit <= demodBit;
    qDataClk <= demodClk;
    qBit <= demodBit;
    end

/******************************************************************************
                               DAC Output Mux
******************************************************************************/

//`define SKIP_DATAMUX
`ifdef SKIP_DATAMUX
assign dac0Data = iDdc;
assign dac0Sync = ddcSync;
assign dac1Data = qDdc;
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
            dac0Data <= iDdc;
            dac0Sync <= ddcSync;
            end
        `DAC_Q: begin
            dac0Data <= qDdc;
            dac0Sync <= ddcSync;
            end
        `DAC_ISYM: begin
            dac0Data <= iSym;
            dac0Sync <= resampSync;
            end
        `DAC_QSYM: begin
            dac0Data <= qSym;
            dac0Sync <= resampSync;
            end
        `DAC_FREQ: begin
            dac0Data <= {freq,10'h0};
            dac0Sync <= ddcSync;
            end
        `DAC_PHASE: begin
            dac0Data <= {phase,10'b0};
            dac0Sync <= ddcSync;
            end
        `DAC_MAG: begin
            dac0Data <= {~mag[8],mag[7:0],9'b0};
            dac0Sync <= ddcSync;
            end
        `DAC_PHERROR: begin
            dac0Data <= {phaseError,10'h0};
            dac0Sync <= ddcSync;
            end
        `DAC_BSLOCK: begin
            dac0Data <= {bsLockCounter,2'b0};
            dac0Sync <= 1'b1;
            end
        default: begin
            dac0Data <= iDdc;
            dac0Sync <= ddcSync;
            end
        endcase

    case (dac1Select) 
        `DAC_I: begin
            dac1Data <= iDdc;
            dac1Sync <= ddcSync;
            end
        `DAC_Q: begin
            dac1Data <= qDdc;
            dac1Sync <= ddcSync;
            end
        `DAC_ISYM: begin
            dac1Data <= iSym;
            dac1Sync <= resampSync;
            end
        `DAC_QSYM: begin
            dac1Data <= qSym;
            dac1Sync <= resampSync;
            end
        `DAC_FREQ: begin
            dac1Data <= {freq,10'h0};
            dac1Sync <= ddcSync;
            end
        `DAC_PHASE: begin
            dac1Data <= {phase,10'b0};
            dac1Sync <= ddcSync;
            end
        `DAC_MAG: begin
            dac1Data <= {~mag[8],mag[7:0],9'b0};
            dac1Sync <= ddcSync;
            end
        `DAC_PHERROR: begin
            dac1Data <= {phaseError,10'h0};
            dac1Sync <= ddcSync;
            end
        `DAC_BSLOCK: begin
            dac1Data <= {bsLockCounter,2'b0};
            dac1Sync <= 1'b1;
            end
        default: begin
            dac1Data <= iDdc;
            dac1Sync <= ddcSync;
            end
        endcase

    case (dac2Select) 
        `DAC_I: begin
            dac2Data <= iDdc;
            dac2Sync <= ddcSync;
            end
        `DAC_Q: begin
            dac2Data <= qDdc;
            dac2Sync <= ddcSync;
            end
        `DAC_ISYM: begin
            dac2Data <= iSym;
            dac2Sync <= resampSync;
            end
        `DAC_QSYM: begin
            dac2Data <= qSym;
            dac2Sync <= resampSync;
            end
        `DAC_FREQ: begin
            dac2Data <= {freq,10'h0};
            dac2Sync <= ddcSync;
            end
        `DAC_PHASE: begin
            dac2Data <= {phase,10'b0};
            dac2Sync <= ddcSync;
            end
        `DAC_MAG: begin
            dac2Data <= {~mag[8],mag[7:0],9'b0};
            dac2Sync <= ddcSync;
            end
        `DAC_PHERROR: begin
            dac2Data <= {phaseError,10'h0};
            dac2Sync <= ddcSync;
            end
        `DAC_BSLOCK: begin
            dac2Data <= {bsLockCounter,2'b0};
            dac2Sync <= 1'b1;
            end
        default: begin
            dac2Data <= iDdc;
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
        `BITSYNCSPACE:      dout <= bitsyncDout;
        `CARRIERSPACE:      dout <= freqDout;
        default:            dout <= 32'bx;
        endcase
    end

endmodule
