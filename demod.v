`timescale 1ns / 10 ps

module demod( 
    clk, reset, syncIn, 
    rd, wr0,wr1,wr2,wr3,
    addr,
    din,
    dout,
    iRx, qRx, 
    demodClk,
    demodData,
    demodBit
    );

input           clk;
input           reset;
input           syncIn;
input           rd,wr0,wr1,wr2,wr3;
input   [11:0]  addr;
input   [31:0]  din;
output  [31:0]  dout;
input   [17:0]   iRx;
input   [17:0]   qRx;
output          demodClk;
output  [7:0]   demodData;
output          demodBit;


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
wire    [31:0]  demodDout;
demodRegs demodRegs(
    .addr(addr),
    .dataIn(din),
    .dataOut(demodDout),
    .cs(demodSpace),
    .wr0(wr0), .wr1(wr1), .wr2(wr2), .wr3(wr3),
    .demodMode(demodMode)
    );

/******************************************************************************
                                Downconverter
******************************************************************************/
wire    [17:0]  iDdc,qDdc;
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
    .syncOut(ddcSync),
    .iIn(iRx), .qIn(qRx), 
    .iOut(iDdc), .qOut(qDdc)
    );

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
wire    [7:0]   offsetError;
wire    [31:0]  freqDout;
carrierLoop carrierLoop(
    .clk(clk), .reset(reset),
    .sync(resampSync),
    .wr0(wr0),.wr1(wr1),.wr2(wr2),.wr3(wr3),
    .addr(addr),
    .din(din),
    .dout(freqDout),
    .demodMode(demodMode),
    .phase(phase),
    .freq(freq),
    .offsetError(offsetError),
    .offsetErrorEn(offsetErrorEn),
    .carrierFreqOffset(carrierFreqOffset),
    .carrierFreqEn(carrierOffsetEn)
    );

/******************************************************************************
                                Bitsync Loop
******************************************************************************/
wire    [31:0]  bitsyncDout;
bitsync bitsync(
    .sampleClk(clk), .reset(reset), 
    .symTimes2Sync(resampSync),
    .demodMode(demodMode),
    .wr0(wr0),.wr1(wr1),.wr2(wr2),.wr3(wr3),
    .addr(addr),
    .din(din),
    .dout(bitsyncDout),
    .freq(freq),
    .offsetError(offsetError),
    .offsetErrorEn(offsetErrorEn),
    .symClk(symClk),
    .symData(demodData),
    .bitClk(demodClk),
    .bitData(demodBit),
    .sampleFreq(resamplerFreqOffset)
    );



/******************************************************************************
                                uP dout mux
******************************************************************************/
reg [31:0]dout;
always @(addr or 
         demodDout or
         ddcDout or
         resampDout or 
         bitsyncDout) begin
    casex (addr)
        `DEMODSPACE:        dout <= demodDout;
        `DDCSPACE:          dout <= ddcDout;
        `RESAMPSPACE:       dout <= resampDout;
        `BITSYNCSPACE:      dout <= bitsyncDout;
        default:            dout <= 32'bx;
        endcase
    end

endmodule
