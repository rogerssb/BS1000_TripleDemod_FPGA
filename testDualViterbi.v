`include "./addressMap.v"
`timescale 1ns/100ps

//`define ALDEC

`define ENABLE_AGC
//`define TEST_BPSK
//`define ADD_NOISE
//`define BER_TEST
//`define MATLAB_VECTORS

//`define ROT0
`define ROT90
//`define ROT180
//`define ROT270
//`define ROT45

`ifdef TEST_OQPSK
//    `define Q_BEFORE_I
`endif

`ifdef BER_TEST
//!control .savsim=1
//!mkeep (test
//!mexclude (test(demod
//!mexclude (test(trellis
`endif

module test;

reg reset,we0,we1,we2,we3,rd;
reg clken;
reg sync;
reg [12:0]a;
reg [31:0]d;
wire [31:0]dout;

reg     [1:0]   dec_in_sel;
initial         dec_in_sel = `DEC_MUX_SEL_DUALVIT;

// Create the clocks
parameter TX_FREQ = 93.333333e6;
parameter THC = 1e9/TX_FREQ/2;
parameter TC = 2*THC;
reg txClk;
initial txClk = 0;
always #THC txClk = txClk^clken;

parameter RX_SAMPLE_FREQ = 93.333333e6;
parameter HC = 1e9/RX_SAMPLE_FREQ/2;
parameter C = 2*HC;
reg clk;
initial clk = 0;
always #HC clk = clk^clken;
`define SAMPLE_PERIOD   (C*1e-9)
`define TWO_POW_32      4294967296.0
`define TWO_POW_31      2147483648.0
`define TWO_POW_17      131072.0


real carrierFreqHz;
real carrierFreqNorm;
initial begin
  carrierFreqHz = 23333333.3;
  carrierFreqNorm = carrierFreqHz * `SAMPLE_PERIOD * `TWO_POW_32;
end

integer carrierFreqInt;
initial begin
  carrierFreqInt = carrierFreqNorm;
end
wire [31:0] carrierFreq = carrierFreqInt;

real carrierOffsetFreqHz;
real carrierOffsetFreqNorm;
integer carrierOffsetFreqInt;
initial begin
  carrierOffsetFreqHz = 0.0;
  carrierOffsetFreqNorm = carrierOffsetFreqHz * `SAMPLE_PERIOD * `TWO_POW_32;
  carrierOffsetFreqInt = carrierOffsetFreqNorm;
end
wire [31:0] carrierOffsetFreq = carrierOffsetFreqInt;

real carrierLimitHz;
real carrierLimitNorm;
integer carrierLimitInt;
initial begin
  carrierLimitHz = 60000.0;
  carrierLimitNorm = carrierLimitHz * `SAMPLE_PERIOD * `TWO_POW_32;
  carrierLimitInt = carrierLimitNorm;
end
wire [31:0] carrierLimit = carrierLimitInt;

wire [31:0] sweepRate = 32'h00000000;

integer bitrateSamplesInt;
initial bitrateSamplesInt = 10;
real bitrateBps = TX_FREQ/$itor(bitrateSamplesInt);
wire [15:0]bitrateDivider = bitrateSamplesInt/2 - 1;

// value = 2^ceiling(log2(R*R))/(R*R), where R = interpolation rate of the FM
// modulator
real interpolationGain = 1.28;

//real deviationHz = 0*0.35 * bitrateBps;
real deviationHz;
real deviationNorm;
integer deviationInt;
initial begin
  deviationHz = 2*0.350 * bitrateBps;
  deviationNorm = deviationHz * `SAMPLE_PERIOD * `TWO_POW_32;
  deviationInt = deviationNorm*interpolationGain;
end
wire [31:0]deviationQ31 = deviationInt;
wire [17:0]deviation = deviationQ31[31:14];

real cicDecimation;
integer cicDecimationInt;
initial cicDecimation = RX_SAMPLE_FREQ/bitrateBps/2.0/2.0/2.0/2.0;
initial cicDecimationInt = (cicDecimation < 2.0) ? 1 : cicDecimation;


real resamplerFreqSps;     // 2 samples per symbol
real resamplerFreqNorm;
integer resamplerFreqInt;
always @* resamplerFreqSps = 2*bitrateBps;     // 2 samples per symbol
always @* resamplerFreqNorm = resamplerFreqSps/(RX_SAMPLE_FREQ/cicDecimationInt/4.0) * `TWO_POW_32;
always @* resamplerFreqInt = (resamplerFreqNorm >= `TWO_POW_31) ? (resamplerFreqNorm - `TWO_POW_32) : resamplerFreqNorm;

//integer resamplerFreqInt = resamplerFreqNorm;
real resamplerLimitNorm;
integer resamplerLimitInt;
always @* begin
  resamplerLimitNorm = 0.001*resamplerFreqSps/RX_SAMPLE_FREQ * `TWO_POW_32;
  resamplerLimitInt = resamplerLimitNorm;
end
/******************************************************************************
                            Create a bit stream
******************************************************************************/
wire    modClk;
reg     infoBitEn;
always @(negedge modClk or posedge reset) begin
    if (reset) begin
        infoBitEn <= 0;
    end
    else begin
        infoBitEn <= ~infoBitEn;
    end
end


// Alternating ones and zeros
reg     [3:0]altCnt;
reg     [3:0]altSR;
reg     altData;
always @(negedge modClk or posedge reset) begin
    if (reset) begin
        altData <= 0;
        altCnt <= 0;
        end
    else if (altCnt == 0) begin
        //altData <= ~altData;
        altData <= 1;
        altCnt <= altCnt + 1;
        end
    else begin
        altData <= 0;
        altCnt <= altCnt + 1;
        end
    end

// Random data
parameter PN17 = 16'h008e,
          MASK17 = 16'h00ff;
reg         enableSR1;
reg [15:0]  sr0;
reg [15:0]  sr1;
reg [4:0]   zeroCount0;
reg [4:0]   zeroCount1;
reg         randData;
reg         altBit;
always @(negedge modClk or posedge reset) begin
    if (reset) begin
        enableSR1 <= 0;
    end
    else if (infoBitEn) begin
        enableSR1 <= ~enableSR1;
    end

    if (reset) begin
        altBit <= 0;
        zeroCount0 <= 5'b0;
        zeroCount1 <= 5'b0;
        sr0 <= MASK17;
        sr1 <= PN17;
    end
    else if (infoBitEn & !enableSR1) begin
        if (sr0[0] | (zeroCount0 == 5'b11111)) begin
            zeroCount0 <= 5'h0;
            sr0 <= {1'b0, sr0[15:1]} ^ PN17;
        end
        else begin
            zeroCount0 <= zeroCount0 + 5'h1;
            sr0 <= sr0 >> 1;
        end
    end
    else if (!infoBitEn & enableSR1) begin
        if (sr1[0] | (zeroCount1 == 5'b11111)) begin
            zeroCount1 <= 5'h0;
            sr1 <= {1'b0, sr1[15:1]} ^ PN17;
        end
        else begin
            zeroCount1 <= zeroCount1 + 5'h1;
            sr1 <= sr1 >> 1;
        end
    end
end

    // Incrementing Data
    reg [7:0]   incSR;
    integer     bitCnt;
    reg [7:0]   incValue;
    always @(negedge modClk or posedge reset) begin
        if (reset) begin
            bitCnt <= 5;
            incValue <= 0;
        end
        else if (infoBitEn) begin
            if (bitCnt == 0) begin
                bitCnt <= 5;
                incSR <= incValue;
                incValue <= incValue + 1;
            end
            else begin
                bitCnt <= bitCnt - 1;
                incSR <= {1'b0,incSR[7:1]};
            end
        end
    end

    // Non-systematic R1/2, K7 Convolutional Encoder
    // Uses generator polys G1 = 171 (octal) and G2 = 133
    //wire            vitData = incSR[0];
    wire            vitData = randData;
    //wire            vitData = altData;
    reg     [5:0]   gSR0;
    reg     [5:0]   gSR1;
    always @(negedge modClk or posedge reset) begin
        if (reset) begin
            gSR0 <= 6'b000000;
            gSR1 <= 6'b000000;
        end
        else if (infoBitEn & !enableSR1) begin
            gSR0 <= {gSR0[4:0],sr0[0]};
        end
        else if (!infoBitEn & enableSR1) begin
            gSR1 <= {gSR1[4:0],sr1[0]};
        end
    end

                      //   x6        x5       x4        x3       x2        x1        x0
wire            g1Bit0 = sr0[0] ^ gSR0[0] ^ gSR0[1] ^ gSR0[2]                    ^ gSR0[5];
wire            g2Bit0 = sr0[0]           ^ gSR0[1] ^ gSR0[2]          ^ gSR0[4] ^ gSR0[5];
wire            g1Bit1 = sr1[0] ^ gSR1[0] ^ gSR1[1] ^ gSR1[2]                    ^ gSR1[5];
wire            g2Bit1 = sr1[0]           ^ gSR1[1] ^ gSR1[2]          ^ gSR1[4] ^ gSR1[5];

reg modData;
always @(negedge modClk) begin
    if (infoBitEn) begin
        modData <= g2Bit0;
    end
    else begin
        modData <= g1Bit0;
    end
end


`ifdef TEST_BPSK
/******************************************************************************
                            Instantiate a Modulator
******************************************************************************/
// Generate internal bitrate clock
reg             fmModCS;
reg             enableTx;
initial         enableTx = 0;
reg             modSampleEn;
reg     [15:0]  modSampleCount;
reg     [2:0]   bitrateCount;
reg             oqpskModClk;
assign          modClk = oqpskModClk;
reg             posEdgeModClk;
always @(posedge txClk) begin
    if (reset) begin
        modSampleCount <= bitrateDivider;
        bitrateCount <= 0;
        modSampleEn <= 0;
        end
    else if (enableTx) begin
        if (bitrateDivider == 0) begin
            posEdgeModClk <= (bitrateCount == 0);
            end
        else begin
            posEdgeModClk <= (modSampleCount == 1) && (bitrateCount == 0);
            end
        if (modSampleCount == 0) begin
            modSampleEn <= 0;
            modSampleCount <= bitrateDivider;
            // This is for two modSamples per bit
            if (bitrateCount == 0) begin
                bitrateCount <= 1;
                end
            else begin
                bitrateCount <= bitrateCount - 1;
                end
            if (bitrateCount == 1) begin
                oqpskModClk <= 0;
                end
            else begin
                oqpskModClk <= 1;
                end
            end
        else if (modSampleCount == 1) begin
            modSampleEn <= 1;
            modSampleCount <= modSampleCount - 1;
            end
        else begin
            modSampleEn <= 0;
            modSampleCount <= modSampleCount - 1;
            end
        end
    end

wire    signed  [17:0]  iBpsk,qBpsk;
oqpskMod oqpsk(
    .clk(txClk),
    .clkEn(enableTx),
    .modSampleEn(modSampleEn),
    .posEdgeModClk(posEdgeModClk),
    .modData(modData),
    .modDataValid(1'b1),
    .modemMode(3'h7),       //MODE_OBPSK
    .oqpskClkEn(cicClkEn),
    .iOut(iBpsk),.qOut(qBpsk)
    );

// CIC Interpolation Filter
`ifdef SIMULATE
reg             cicReset;
initial         cicReset = 0;
`endif
// This value is ceiling(log2(R*R)), where R = interpolation rate.
reg     [4:0]   modExponent;
initial         modExponent = 8;
reg     [17:0]  modMantissa;
initial         modMantissa = 18'h16a0a;    // 1/sqrt(2)
wire    [33:0]  iCicOut;
real            iCicReal;
always @*       iCicReal = $itor($signed(iCicOut));
oqpskInterpolate cicI(
    .clk(txClk),
    .reset(!modDataValid | cicReset),
    .clkEn(enableTx),
    .inputClkEn(cicClkEn),
    .dIn(iBpsk),
    .dOut(iCicOut)
    );
wire    [17:0]  iInterpOut;
real            iTxInterpReal;
always @*       iTxInterpReal = $itor($signed(iInterpOut))/(2**17);
shift34to18 cicGainAdjustI(
    .clk(txClk),
    .clkEn(enableTx),
    .shift(modExponent),
    .dIn(iCicOut),
    .dOut(iInterpOut)
    );
wire    [35:0] iScaledOut;
mpy18x18 iScaler (
    .sclr(1'b0),
    .clk(txClk),
    .a(iInterpOut),
    .b(modMantissa),
    .p(iScaledOut)
    );
wire    signed  [17:0]  iTx = $signed(iScaledOut[33:16]);
wire    signed  [17:0]  qTx = 0;

`elsif TEST_QPSK

/******************************************************************************
                            Instantiate a Modulator
******************************************************************************/
// Generate internal bitrate clock
reg             fmModCS;
reg             enableTx;
initial         enableTx = 0;
reg             modSampleEn;
reg     [15:0]  modSampleCount;
reg     [2:0]   bitrateCount;
reg             qpskModClk;
assign          modClk = modSampleEn;
reg             posEdgeModClk;
always @(posedge txClk) begin
    if (reset) begin
        modSampleCount <= bitrateDivider;
        bitrateCount <= 0;
        modSampleEn <= 0;
        end
    else if (enableTx) begin
        if (bitrateDivider == 0) begin
            posEdgeModClk <= (bitrateCount == 0);
            end
        else begin
            posEdgeModClk <= (modSampleCount == 1);
            end
        if (modSampleCount == 0) begin
            modSampleEn <= 1;
            modSampleCount <= bitrateDivider;
            end
        else begin
            modSampleEn <= 0;
            modSampleCount <= modSampleCount - 1;
            end
        end
    end

reg     signed  [17:0]  iQpsk,qQpsk;
always @(posedge txClk) begin
    if (modSampleEn & infoBitEn) begin
        iQpsk <= {g1Bit,17'h10000};
        qQpsk <= {g2Bit,17'h10000};
    end
end

// CIC Interpolation Filter
`ifdef SIMULATE
reg             cicReset;
initial         cicReset = 0;
`endif
// This value is ceiling(log2(R*R)), where R = interpolation rate.
reg     [4:0]   modExponent;
initial         modExponent = 8;
reg     [17:0]  modMantissa;
initial         modMantissa = 18'h16a0a;    // 1/sqrt(2)

wire    [33:0]  iCicOut;
real            iCicReal;
always @*       iCicReal = $itor($signed(iCicOut));
oqpskInterpolate cicI(
    .clk(txClk),
    .reset(!modDataValid | cicReset),
    .clkEn(enableTx),
    .inputClkEn(modSampleEn),
    .dIn(iQpsk),
    .dOut(iCicOut)
    );
wire    [17:0]  iInterpOut;
real            iTxInterpReal;
always @*       iTxInterpReal = $itor($signed(iInterpOut))/(2**17);
shift34to18 cicGainAdjustI(
    .clk(txClk),
    .clkEn(enableTx),
    .shift(modExponent),
    .dIn(iCicOut),
    .dOut(iInterpOut)
    );
wire    [35:0] iScaledOut;
mpy18x18 iScaler (
    .sclr(1'b0),
    .clk(txClk),
    .a(iInterpOut),
    .b(modMantissa),
    .p(iScaledOut)
    );
wire    signed  [17:0]  iTx = $signed(iScaledOut[33:16]);

wire    [33:0]  qCicOut;
real            qCicReal;
always @*       qCicReal = $itor($signed(qCicOut));
oqpskInterpolate cicQ(
    .clk(txClk),
    .reset(!modDataValid | cicReset),
    .clkEn(enableTx),
    .inputClkEn(modSampleEn),
    .dIn(qQpsk),
    .dOut(qCicOut)
    );
wire    [17:0]  qInterpOut;
real            qTxInterpReal;
always @*       qTxInterpReal = $itor($signed(qInterpOut))/(2**17);
shift34to18 cicGainAdjustQ(
    .clk(txClk),
    .clkEn(enableTx),
    .shift(modExponent),
    .dIn(qCicOut),
    .dOut(qInterpOut)
    );
wire    [35:0] qScaledOut;
mpy18x18 qScaler (
    .sclr(1'b0),
    .clk(txClk),
    .a(qInterpOut),
    .b(modMantissa),
    .p(qScaledOut)
    );
wire    signed  [17:0]  qTx = $signed(qScaledOut[33:16]);

`elsif TEST_OQPSK

/******************************************************************************
                            Instantiate a Modulator
******************************************************************************/
// Generate internal bitrate clock
reg             fmModCS;
reg             enableTx;
initial         enableTx = 0;
reg             modSampleEn;
reg     [15:0]  modSampleCount;
reg     [2:0]   bitrateCount;
reg             qpskModClk;
assign          modClk = modSampleEn;
reg             posEdgeModClk;
always @(posedge txClk) begin
    if (reset) begin
        modSampleCount <= bitrateDivider;
        bitrateCount <= 0;
        modSampleEn <= 0;
        end
    else if (enableTx) begin
        if (bitrateDivider == 0) begin
            posEdgeModClk <= (bitrateCount == 0);
            end
        else begin
            posEdgeModClk <= (modSampleCount == 1);
            end
        if (modSampleCount == 0) begin
            modSampleEn <= 1;
            modSampleCount <= bitrateDivider;
            end
        else begin
            modSampleEn <= 0;
            modSampleCount <= modSampleCount - 1;
            end
        end
    end

reg     signed  [17:0]  iQpsk,qQpsk;
always @(posedge txClk) begin
    if (modSampleEn & !infoBitEn) begin
        if (enableSR1) begin
            iQpsk <= {g1Bit0,17'h10000};
        end
        else begin
            iQpsk <= {g2Bit0,17'h10000};
        end
    end
    else if (modSampleEn & infoBitEn) begin
        if (enableSR1) begin
            qQpsk <= {g1Bit1,17'h10000};
        end
        else begin
            qQpsk <= {g2Bit1,17'h10000};
        end
    end
end

// CIC Interpolation Filter
`ifdef SIMULATE
reg             cicReset;
initial         cicReset = 0;
`endif
// This value is ceiling(log2(R*R)), where R = interpolation rate.
reg     [4:0]   modExponent;
initial         modExponent = 8;
reg     [17:0]  modMantissa;
initial         modMantissa = 18'h16a0a;    // 1/sqrt(2)

wire    [33:0]  iCicOut;
real            iCicReal;
always @*       iCicReal = $itor($signed(iCicOut));
oqpskInterpolate cicI(
    .clk(txClk),
    .reset(!modDataValid | cicReset),
    .clkEn(enableTx),
    .inputClkEn(modSampleEn),
    .dIn(iQpsk),
    .dOut(iCicOut)
    );
wire    [17:0]  iInterpOut;
real            iTxInterpReal;
always @*       iTxInterpReal = $itor($signed(iInterpOut))/(2**17);
shift34to18 cicGainAdjustI(
    .clk(txClk),
    .clkEn(enableTx),
    .shift(modExponent),
    .dIn(iCicOut),
    .dOut(iInterpOut)
    );
wire    [35:0] iScaledOut;
mpy18x18 iScaler (
    .sclr(1'b0),
    .clk(txClk),
    .a(iInterpOut),
    .b(modMantissa),
    .p(iScaledOut)
    );
wire    signed  [17:0]  iTx = $signed(iScaledOut[33:16]);

wire    [33:0]  qCicOut;
real            qCicReal;
always @*       qCicReal = $itor($signed(qCicOut));
oqpskInterpolate cicQ(
    .clk(txClk),
    .reset(!modDataValid | cicReset),
    .clkEn(enableTx),
    .inputClkEn(modSampleEn),
    .dIn(qQpsk),
    .dOut(qCicOut)
    );
wire    [17:0]  qInterpOut;
real            qTxInterpReal;
always @*       qTxInterpReal = $itor($signed(qInterpOut))/(2**17);
shift34to18 cicGainAdjustQ(
    .clk(txClk),
    .clkEn(enableTx),
    .shift(modExponent),
    .dIn(qCicOut),
    .dOut(qInterpOut)
    );
wire    [35:0] qScaledOut;
mpy18x18 qScaler (
    .sclr(1'b0),
    .clk(txClk),
    .a(qInterpOut),
    .b(modMantissa),
    .p(qScaledOut)
    );
wire    signed  [17:0]  qTx = $signed(qScaledOut[33:16]);

`else //FSK

/******************************************************************************
                            Instantiate a Modulator
******************************************************************************/
wire    [31:0]fmModFreq;
reg     fmModCS;
reg     enableTx;
initial enableTx = 0;
fmMod fmMod(
    .clk(clk), .reset(reset),
    .cs(fmModCS),
    .wr0(we0), .wr1(we1), .wr2(we2), .wr3(we3),
    .addr(a[11:0]),
    .din(d),
    .dout(dout),
    .fskMode(2'b00),
    .txSelect(1'b1),
    .modData(modData),
    .modClkOut(modClk),
    .modDataValid(enableTx),
    .fmModFreq(fmModFreq)
    );
`define USE_BASEBAND
`ifdef USE_BASEBAND
wire    [17:0]iTx,qTx;
dds iqDds (
//dds4p0 iqDds (
    .sclr(reset),
    .clk(clk),
    .ce(1'b1),
    .we(1'b1),
    .data(fmModFreq),
    .sine(),
    .cosine(iTx)
    );
assign qTx = 18'h0;
`else
wire    [17:0]  iBB,qBB;
dds iqDds (
    .sclr(reset),
    .clk(clk),
    .ce(1'b1),
    .we(1'b1),
    .data(fmModFreq),
    .sine(qBB),
    .cosine(iBB)
    );
wire    [17:0]  iLO,qLO;
dds carrierDds (
    .sclr(reset),
    .clk(clk),
    .ce(1'b1),
    .we(1'b1),
    .data(carrierFreq),
    .sine(qLO),
    .cosine(iLO)
    );
wire [35:0]productI;
mpy18x18 mpyI(.clk(clk),
                .sclr(reset),
                .a(iBB),
                .b(iLO),
                .p(productI)
                );
wire [35:0]productQ;
mpy18x18 mpyQ(.clk(clk),
                .sclr(reset),
                .a(qBB),
                .b(qLO),
                .p(productQ)
                );
wire [35:0]carrierSum = productI + productQ;
reg [17:0]iTx;
wire [17:0]qTx = 18'h0;
always @(posedge clk) begin
    iTx <= carrierSum[35:18];
    end
`endif //USE_BASEBAND

`endif //Modulation Format Selection



/******************************************************************************
                            Channel Model
******************************************************************************/

real iTxReal;
real qTxReal;
real txScaleFactor;
 always @(iTx) iTxReal = $itor(iTx)/(2**17);
 //always @(iTx) (iTx[17] ? (iTx - 262144.0) : iTx)/131072.0;
 always @(qTx) qTxReal = $itor(qTx)/(2**17);
 //always @(qTx) qTxReal = (qTx[17] ? (qTx - 262144.0) : qTx)/131072.0;


`ifdef ROT0
// 0 Degrees
real rotateReal = 1.0;
real rotateImag = 0.0;
`elsif ROT45
// 45 Degrees
real rotateReal = 0.707;
real rotateImag = 0.707;
`elsif ROT90
// 90 Degrees
real rotateReal = 0.0;
real rotateImag = 1.0;
`elsif ROT180
// 180 Degrees
real rotateReal = -1.0;
real rotateImag = 0.0;
`endif

real iRotReal = (iTxReal*rotateReal - qTxReal*rotateImag) * txScaleFactor;
real qRotReal = (iTxReal*rotateImag + qTxReal*rotateReal) * txScaleFactor;

wire [17:0]iSignal = 131072.0*iRotReal;
wire [17:0]qSignal = 131072.0*qRotReal;


reg  measureSNR;
initial measureSNR = 0;
reg     [17:0]iRx;
reg     [17:0]qRx;
real iSignalReal;
real qSignalReal;
real signalMagSquared;
real noiseMagSquared;
integer txSampleCount;
reg [17:0]iNoise,qNoise;
real iNoiseReal;
real qNoiseReal;
always @(iSignal) iSignalReal = (iSignal[17] ? (iSignal - 262144.0) : iSignal)/131072.0;
always @(qSignal)  qSignalReal = (qSignal[17] ? (qSignal - 262144.0) : qSignal)/131072.0;
always @(iNoise)  iNoiseReal = (iNoise[17] ? (iNoise - 262144.0) : iNoise)/131072.0;
always @(qNoise)  qNoiseReal = (qNoise[17] ? (qNoise - 262144.0) : qNoise)/131072.0;


always @(negedge txClk) begin
    `ifdef ADD_NOISE
    iNoise <= $gaussPLI();
    //qNoise <= $gaussPLI();
    qNoise <= 0;
    `else
    iNoise <= 0;
    qNoise <= 0;
    `endif
    if (measureSNR) begin
        signalMagSquared <= signalMagSquared + (iSignalReal*iSignalReal + qSignalReal*qSignalReal);
        noiseMagSquared <= noiseMagSquared + (iNoiseReal*iNoiseReal + qNoiseReal*qNoiseReal);
        txSampleCount <= txSampleCount + 1;
        end
    else begin
        signalMagSquared <= 0.0;
        noiseMagSquared <= 0.0;
        txSampleCount <= 0;
        end
    end

wire    [18:0]  iRxSum = {iSignal[17],iSignal} + {iNoise[17],iNoise};
always @(iRxSum) begin
    if (iRxSum[18] & !iRxSum[17]) begin
        iRx = 18'h20001;
        end
    else if (!iRxSum[18] & iRxSum[17]) begin
        iRx = 18'h1ffff;
        end
    else begin
        iRx = iRxSum[17:0];
        end
    end
wire    [18:0]  qRxSum = {qSignal[17],qSignal} + {qNoise[17],qNoise};
always @(qRxSum) begin
    if (qRxSum[18] & !qRxSum[17]) begin
        qRx = 18'h20001;
        end
    else if (!qRxSum[18] & qRxSum[17]) begin
        qRx = 18'h1ffff;
        end
    else begin
        qRx = qRxSum[17:0];
        end
    end




/******************************************************************************
                            Instantiate the Demod
******************************************************************************/
wire            [17:0]  dac0Out,dac1Out,dac2Out;
wire    signed  [17:0]  iSymData, qSymData, sdiDataI, sdiDataQ;
wire            [4:0]   demodMode;
demod demod(
    .clk(clk), .reset(reset),
    .wr0(we0), .wr1(we1), .wr2(we2), .wr3(we3),
    .addr(a),
    .din(d),
    .dout(dout),
    .iBit(iDemodBit),
    .qBit(qDemodBit),
    .iRx(iRx), .qRx(qRx),
    .dac0Sync(dac0Sync),
    .dac0Data(dac0Out),
    .dac1Sync(dac1Sync),
    .dac1Data(dac1Out),
    .dac2Sync(dac2Sync),
    .dac2Data(dac2Out),
    .iSymEn(demodSymEn),
    .iSym2xEn(demodSym2xEn),
    .iSymData(sdiDataI),
    .qSymData(sdiDataQ),
    .sdiSymEn(sdiSymEn),
    .trellisSymSync(trellisSymSync),
    .iTrellis(iSymData),
    .qTrellis(qSymData),
    .demodMode(demodMode)
    );

//******************************************************************************
//                          Dual Viterbi Decoder
//******************************************************************************
    // Simulate the one clock delay in FPGA2
    reg     signed  [17:0]  iIn,qIn;
    always @(posedge clk) begin
        iIn <= iSymData;
        qIn <= qSymData;
    end

    wire    [31:0]  vitDout;
    dualViterbi viterbi(
        .clk(clk),
        .clkEn(1'b1),
        .reset(reset),
        .wr0(we0),.wr1(we1),.wr2(we2),.wr3(we3),
        .addr(a),
        .din(d),
        .dout(vitDout),
        .demodMode(demodMode),
        .decoderSource(dec_in_sel),
        .symEn(demodSymEn),
        .iSymData(iIn),
        .qSymData(qIn),
        .bitEnOut(viterbiSymEn),
        .iBitOut(viterbiBit0),
        .qBitOut(viterbiBit1),
        .vitError()
    );
    reg viterbiSym2xEn;
    always @* begin
        case (demodMode)
            `MODE_QPSK,
            `MODE_OQPSK: begin
                viterbiSym2xEn = demodSym2xEn;
            end
            default: begin
                viterbiSym2xEn = demodSymEn;
            end
        endcase
    end


/******************************************************************************
                              Interpolated DACs
******************************************************************************/

reg dac0CS,dac1CS,dac2CS;
always @(a) begin
    casex (a)
        `INTERP0SPACE: begin
            dac0CS <= 1;
            dac1CS <= 0;
            dac2CS <= 0;
            end
        `INTERP1SPACE: begin
            dac0CS <= 0;
            dac1CS <= 1;
            dac2CS <= 0;
            end
        `INTERP2SPACE: begin
            dac0CS <= 0;
            dac1CS <= 0;
            dac2CS <= 1;
            end
        default: begin
            dac0CS <= 0;
            dac1CS <= 0;
            dac2CS <= 0;
            end
        endcase
    end
wire    [31:0]  dac0Dout;
wire    [17:0]  dac0Data;
reg             interpReset;
interpolate #(.RegSpace(`INTERP0SPACE), .FirRegSpace(`VIDFIR0SPACE)) dac0Interp(
    .clk(clk), .reset(interpReset), .clkEn(dac0Sync),
    .wr0(we0), .wr1(we1), .wr2(we2), .wr3(we3),
    .addr(a),
    .din(d),
    .dout(dac0Dout),
    .dataIn(dac0Out),
    .dataOut(dac0Data)
    );
assign dac0_d = dac0Data[17:4];
assign dac0_clk = clk;

wire    [31:0]  dac1Dout;
wire    [17:0]  dac1Data;
interpolate #(.RegSpace(`INTERP1SPACE), .FirRegSpace(`VIDFIR1SPACE))dac1Interp(
    .clk(clk), .reset(interpReset), .clkEn(dac1Sync),
    .wr0(we0), .wr1(we1), .wr2(we2), .wr3(we3),
    .addr(a),
    .din(d),
    .dout(dac1Dout),
    .dataIn(dac1Out),
    .dataOut(dac1Data)
    );
assign dac1_d = dac1Data[17:4];
assign dac1_clk = clk;

wire    [31:0]  dac2Dout;
wire    [17:0]  dac2Data;
interpolate #(.RegSpace(`INTERP2SPACE), .FirRegSpace(`VIDFIR2SPACE))dac2Interp(
    .clk(clk), .reset(interpReset), .clkEn(dac2Sync),
    .wr0(we0), .wr1(we1), .wr2(we2), .wr3(we3),
    .addr(a),
    .din(d),
    .dout(dac2Dout),
    .dataIn(dac2Out),
    .dataOut(dac2Data)
    );
assign dac2_d = dac2Data[17:4];
assign dac2_clk = clk;


reg             iDec,qDec;
reg             decoderSymEn;
reg             decoderSym2xEn;
always @(posedge clk) begin
    case (dec_in_sel)
        `DEC_MUX_SEL_DEMOD: begin
            iDec <= iDemodBit ;
            qDec <= qDemodBit ;
            decoderSymEn <= demodSymEn ;
            decoderSym2xEn <= demodSym2xEn ;
        end
        `DEC_MUX_SEL_VITERBI: begin
            iDec <= viterbiBit0;
            qDec <= viterbiBit0;
            decoderSymEn <= viterbiSymEn;
            decoderSym2xEn <= viterbiSym2xEn;
        end
        `DEC_MUX_SEL_DUALVIT: begin
            iDec <= viterbiBit0;
            qDec <= viterbiBit1;
            decoderSymEn <= viterbiSymEn;
            decoderSym2xEn <= viterbiSym2xEn;
        end
        default: begin
            iDec <= iDemodBit ;
            qDec <= qDemodBit ;
            decoderSymEn <= demodSymEn ;
            decoderSym2xEn <= demodSym2xEn ;
        end
    endcase
end

decoder decoder
  (
  .rs(reset),
  .en(1'b0),
  .wr0(1'b0),.wr1(1'b0),
  .addr(),
  .din(),
  .dout(),
  .clk(clk),
  .symb_clk_en(decoderSymEn),
  .symb_clk_2x_en(decoderSym2xEn),
  .symb_i(iDec),
  .symb_q(qDec),
  .dout_i(iDout),
  .dout_q(qDout),
  .outputClkEn(outputClkEn),
  .fifo_rs(),
  .clk_inv()
  );

/******************************************************************************
                       Delay Line for BER Testing
******************************************************************************/

reg [15:0]testSR;
reg [4:0]testZeroCount;
reg testData;
always @(posedge clk or reset) begin
    if (reset) begin
        testZeroCount <= 5'b0;
        testSR <= MASK17;
        end
    `ifdef TRELLIS
    else if (symEnTrellisOut) begin
    `else
    else if (demodSymEn) begin
    `endif
        if (testSR[0] | (testZeroCount == 5'b11111))
            begin
            testZeroCount <= 5'h0;
            testSR <= {1'b0, testSR[15:1]} ^ PN17;
            end
        else
            begin
            testZeroCount <= testZeroCount + 5'h1;
            testSR <= testSR >> 1;
            end
        testData <= testSR[0];
        end
    end

reg [511:0]delaySR;
reg txDelay;
always @(posedge clk) begin
    if (demodSymEn) begin
        `ifdef TEST_BPSK
        txDelay <= delaySR[412];
        `elsif TEST_QPSK
        txDelay <= delaySR[468];
        `elsif TEST_OQPSK
        txDelay <= delaySR[468];
        `else
        txDelay <= delaySR[418];
        `endif
        //delaySR <= {delaySR[126:0],testData};
        delaySR <= {delaySR[510:0],vitData};
        end
    end

reg testBits;
initial testBits = 0;
reg     bitError;
integer bitErrors;
initial bitErrors = 0;
integer testBitCount;
initial testBitCount = 0;
always @(posedge clk) begin
    if (demodSymEn) begin
        if (testBits) begin
            testBitCount <= testBitCount + 1;
            if (iDout != txDelay) begin
                bitError <= 1;
                bitErrors <= bitErrors + 1;
                end
            else begin
                bitError <= 0;
                end
            end
        end
    end


`ifdef MATLAB_VECTORS
/******************************************************************************
                          Vector data for Matlab Analysis
******************************************************************************/
integer outfile;
integer vectorCount;
initial begin
    outfile = $fopen("fskVectors.dat");
    vectorCount = 0;
    end
always @(negedge clk) begin
    if (testBits) begin
        $fwrite(outfile,"%f %f\n",iTxReal,qTxReal);
        vectorCount <= vectorCount + 1;
        if (vectorCount == 10239) begin
            $fclose(outfile);
            $stop;
            end
        end
    end
`endif

/******************************************************************************
                                uP Read/Write Functions
******************************************************************************/

function [12:0] createAddress;
    input [12:0] addrA;
    input [12:0] addrB;

    integer i;
    reg [12:0]finalAddress;

    begin
    for (i = 0; i < 13; i = i+1) begin
        if (addrA[i] === 1'bx) begin
            finalAddress[i] = addrB[i];
            end
        else if (addrB[i] === 1'bx) begin
            finalAddress[i] = addrA[i];
            end
        else begin
            finalAddress[i] = addrA[i] | addrB[i];
            end
        end
    createAddress = finalAddress;
    end
endfunction


task write16;
  input [12:0]addr;
  input [15:0]data;
  begin

    a = addr;
    rd = 0;
    if (addr[1]) begin
        d[31:16] = data;
        #100 we2 = 1; we3 = 1;
        #100 we2 = 0; we3 = 0;
        end
    else begin
        d[15:0] = data;
        #100 we0 = 1; we1 = 1;
        #100 we0 = 0; we1 = 0;
        end
    #100
    d = 32'hz;
    #200;
  end
endtask

task write32;
  input [12:0]addr;
  input [31:0]data;
  begin
    a = addr;
    d = data;
    rd = 0;
    #100 we0 = 1; we1 = 1; we2 = 1; we3 = 1;
    #100 we0 = 0; we1 = 0; we2 = 0; we3 = 0;
    #100
    d = 32'hz;
    #200;
  end
endtask

task read32;
  input [12:0]addr;
  begin
    a = addr;
    rd = 0;
    #100 rd = 1;
    #100 rd = 0;
    #200;
  end
endtask

initial begin

    `ifdef ADD_NOISE
    // The 11.5 is a fudge factor (should be 12 for the 2 bit shift) for the scaling
    // down of the transmit waveform from full scale.
    // The 13.0 is to translate from SNR to EBNO which is 10log10(bitrate/bandwidth).
    $initGaussPLI(1,20.0 + 11.5 - 7.0,131072.0);
    `endif
    demod.ddc.hbReset = 1;
    demod.ddc.cicReset = 1;
    interpReset = 0;
    reset = 0;
    sync = 1;
    clk = 0;
    rd = 0;
    we0 = 0; we1 = 0; we2 = 0; we3 = 0;
    d = 32'hz;
    fmModCS = 0;
    txScaleFactor = 0.25;
    decoder.decoder_regs.q = 16'h0004;

    // Turn on the clock
    clken=1;
    #(10*C) ;

    `ifdef TEST_BPSK

    // This value is ceiling(log2(R*R)), where R = interpolation rate.
    modExponent = 7;

    `elsif TEST_QPSK

    // This value is ceiling(log2(R*R)), where R = interpolation rate.
    modExponent = 7;

    `elsif TEST_OQPSK

    // This value is ceiling(log2(R*R)), where R = interpolation rate.
    modExponent = 7;

    `else

    // Init the fm modulator
    // Init the modulator register set
    fmModCS = 1;
    write32(`FM_MOD_FREQ, carrierFreq + carrierOffsetFreq);
    write32(`FM_MOD_DEV, {14'bx,deviation});
    write32(`FM_MOD_BITRATE, {1'b0,15'bx,bitrateDivider});
    // This value is ceiling(log2(R*R)), where R = interpolation rate.
    write32(`FM_MOD_CIC,5);
    fmModCS = 0;

    `endif

    // Init the mode
    `ifdef TEST_BPSK
    write32(createAddress(`DEMODSPACE,`DEMOD_CONTROL),{14'bx,`MODE_SINGLE_RAIL,11'bx,`MODE_BPSK});
    `elsif TEST_QPSK
    write32(createAddress(`DEMODSPACE,`DEMOD_CONTROL),{14'bx,`MODE_SINGLE_RAIL,11'bx,`MODE_QPSK});
    `elsif TEST_OQPSK
        `ifdef Q_BEFORE_I
        write32(createAddress(`DEMODSPACE,`DEMOD_CONTROL),{14'bx,`MODE_SINGLE_RAIL,2'b0,1'b0,8'b0,`MODE_OQPSK});
        `else
        write32(createAddress(`DEMODSPACE,`DEMOD_CONTROL),{14'bx,`MODE_SINGLE_RAIL,2'b0,1'b1,8'b0,`MODE_OQPSK});
        `endif
    `else
    write32(createAddress(`DEMODSPACE,`DEMOD_CONTROL),{14'bx,`MODE_SINGLE_RAIL,11'bx,`MODE_2FSK});
    `endif

    // Init the sample rate loop filters
    write32(createAddress(`RESAMPSPACE,`RESAMPLER_RATE),resamplerFreqInt);
    write32(createAddress(`BITSYNCSPACE,`LF_CONTROL),1);    // Zero the error
    write32(createAddress(`BITSYNCSPACE,`LF_LEAD_LAG),32'h001b0016);
    //write32(createAddress(`BITSYNCSPACE,`LF_LEAD_LAG),32'h0014000c);
    write32(createAddress(`BITSYNCSPACE,`LF_LIMIT), resamplerLimitInt);

    // Init the carrier loop filters
    `ifdef TEST_BPSK
    write32(createAddress(`CARRIERSPACE,`CLF_CONTROL),1);    // Zero the error
    write32(createAddress(`CARRIERSPACE,`CLF_LEAD_LAG),32'h18180808);
    write32(createAddress(`CARRIERSPACE,`CLF_ULIMIT), carrierLimit);
    write32(createAddress(`CARRIERSPACE,`CLF_LLIMIT), -carrierLimit);
    write32(createAddress(`CARRIERSPACE,`CLF_LOOPDATA), sweepRate);
    `elsif TEST_QPSK
    write32(createAddress(`CARRIERSPACE,`CLF_CONTROL),1);    // Zero the error
    write32(createAddress(`CARRIERSPACE,`CLF_LEAD_LAG),32'h18180808);
    write32(createAddress(`CARRIERSPACE,`CLF_ULIMIT), carrierLimit);
    write32(createAddress(`CARRIERSPACE,`CLF_LLIMIT), -carrierLimit);
    write32(createAddress(`CARRIERSPACE,`CLF_LOOPDATA), sweepRate);
    `elsif TEST_OQPSK
    write32(createAddress(`CARRIERSPACE,`CLF_CONTROL),1);    // Zero the error
    write32(createAddress(`CARRIERSPACE,`CLF_LEAD_LAG),32'h18180808);
    write32(createAddress(`CARRIERSPACE,`CLF_ULIMIT), carrierLimit);
    write32(createAddress(`CARRIERSPACE,`CLF_LLIMIT), -carrierLimit);
    write32(createAddress(`CARRIERSPACE,`CLF_LOOPDATA), sweepRate);
    `else
    // Setup for AFC
    write32(createAddress(`CARRIERSPACE,`CLF_CONTROL),1);    // Zero the error
    write32(createAddress(`CARRIERSPACE,`CLF_LEAD_LAG),32'h00000012);
    write32(createAddress(`CARRIERSPACE,`CLF_ULIMIT), carrierLimit);
    write32(createAddress(`CARRIERSPACE,`CLF_LLIMIT), -carrierLimit);
    write32(createAddress(`CARRIERSPACE,`CLF_LOOPDATA), sweepRate);
    `endif

    // Init the trellis carrier loop
    write32(createAddress(`TRELLISLFSPACE,`LF_CONTROL),13);    // Forces the lag acc and the error term to be zero
    write32(createAddress(`TRELLISLFSPACE,`LF_LEAD_LAG),32'h0015_0005);
    write32(createAddress(`TRELLISLFSPACE,`LF_LIMIT),32'h0100_0000);
    //write32(createAddress(`TRELLISLFSPACE,`LF_LOOPDATA0),32'h0333_3333);
    //write32(createAddress(`TRELLISLFSPACE,`LF_LOOPDATA0),32'h0666_6666);
    write32(createAddress(`TRELLISLFSPACE,`LF_LOOPDATA0),32'h0100_0000);
    write32(createAddress(`TRELLISLFSPACE,`LF_LOOPDATA1),32'hff00_0000);

    write32(createAddress(`TRELLIS_SPACE,`TRELLIS_DECAY),217);

    // Init the downcoverter register set
    write32(createAddress(`DDCSPACE,`DDC_CONTROL),5);   // Bypass the CIC and FIR
    `ifdef TEST_BPSK
    write32(createAddress(`DDCSPACE,`DDC_CENTER_FREQ), 0);
    `elsif TEST_QPSK
    write32(createAddress(`DDCSPACE,`DDC_CENTER_FREQ), 0);
    `elsif TEST_OQPSK
    write32(createAddress(`DDCSPACE,`DDC_CENTER_FREQ), 0);
    `else
    write32(createAddress(`DDCSPACE,`DDC_CENTER_FREQ), carrierFreq);
    `endif
    write32(createAddress(`DDCSPACE,`DDC_DECIMATION), 0);

    // Init the cicResampler register set
    write32(createAddress(`CICDECSPACE,`CIC_DECIMATION),cicDecimationInt-1);
    write32(createAddress(`CICDECSPACE,`CIC_SHIFT), 3);

    // Init the channel agc loop filter
    write32(createAddress(`CHAGCSPACE,`ALF_CONTROL),1);                 // Zero the error
    write32(createAddress(`CHAGCSPACE,`ALF_SETPOINT),32'h000000e0);     // AGC Setpoint
    write32(createAddress(`CHAGCSPACE,`ALF_GAINS),32'h00180018);        // AGC Loop Gain
    write32(createAddress(`CHAGCSPACE,`ALF_ULIMIT),32'h4fffffff);       // AGC Upper limit
    write32(createAddress(`CHAGCSPACE,`ALF_LLIMIT),32'h00000000);       // AGC Lower limit

    // Set the DAC interpolator gains
    write32(createAddress(`DEMODSPACE, `DEMOD_DACSELECT), {12'h0,`DAC_FREQ,
                                                           4'h0,`DAC_Q,
                                                           4'h0,`DAC_I});
    write32(createAddress(`INTERP0SPACE, `INTERP_CONTROL),0);
    write32(createAddress(`INTERP0SPACE, `INTERP_EXPONENT), 8);
    write32(createAddress(`INTERP0SPACE, `INTERP_MANTISSA), 32'h00012000);
    write32(createAddress(`INTERP1SPACE, `INTERP_CONTROL),0);
    write32(createAddress(`INTERP1SPACE, `INTERP_EXPONENT), 8);
    write32(createAddress(`INTERP1SPACE, `INTERP_MANTISSA), 32'h00012000);
    write32(createAddress(`INTERP2SPACE, `INTERP_CONTROL),1);
    write32(createAddress(`INTERP2SPACE, `INTERP_EXPONENT), 8);
    write32(createAddress(`INTERP2SPACE, `INTERP_MANTISSA), 32'h00012000);

    `ifdef TEST_BPSK
    // Set for inverse of 0.45 which is a smidge less than the AGC setpoint of 0.5 to
    // account for shaping filter losses.
    write32(createAddress(`VITERBISPACE, `VIT_INVERSE_MEAN), 32'h00018e39);
    `elsif TEST_QPSK
    // Set for inverse of 0.225 which is a smidge less than the AGC setpoint of 0.25 to
    // account for shaping filter losses.
    write32(createAddress(`VITERBISPACE, `VIT_INVERSE_MEAN), 32'h00028e39);
    `elsif TEST_OQPSK
    // Set for inverse of 0.225 which is a smidge less than the AGC setpoint of 0.25 to
    // account for shaping filter losses.
    write32(createAddress(`VITERBISPACE, `VIT_INVERSE_MEAN), 32'h00028e39);
    `else
    // Set for inverse of 0.35
    write32(createAddress(`VITERBISPACE, `VIT_INVERSE_MEAN), 32'h0001b6db);
    `endif

    reset = 1;
    #(2*C) ;
    reset = 0;
    demod.ddc.hbReset = 0;
    demod.ddc.cicReset = 0;

    // Wait 9.5 bit periods
    #(19*bitrateSamplesInt*TC) ;

    `ifdef TEST_BPSK
    demod.ddc.ddcFreq = 0;
    `elsif TEST_QPSK
    demod.ddc.ddcFreq = 0;
    `elsif TEST_OQPSK
    demod.ddc.ddcFreq = 0;
    `else
    // Force the carrier frequency to load. We have to do this because
    // the load is normally not done in FSK mode until you get symbol
    // enables from the bitsync
    demod.ddc.ddcFreq = -carrierFreq;
    `endif

    // Create a reset to clear the nco accumulator
    reset = 1;
    #(2*C) ;
    reset = 0;

    enableTx = 1;

    // Wait 30.0 bit periods
    #(30.0*bitrateSamplesInt*TC) ;

    `ifdef TEST_BPSK
    cicReset = 1;
    #(2*C) ;
    cicReset = 0;
    `elsif TEST_QPSK
    cicReset = 1;
    #(2*C) ;
    cicReset = 0;
    `elsif TEST_OQPSK
    cicReset = 1;
    #(2*C) ;
    cicReset = 0;
    `endif

    // Create a reset to clear the halfband
    demod.ddc.hbReset = 1;
    #(2*C) ;
    demod.ddc.hbReset = 0;

    // Wait 2 bit periods
    #(4.0*bitrateSamplesInt*TC) ;

    // Create a reset to clear the cic resampler
    demod.ddc.cicReset = 1;
    #(2*C) ;
    demod.ddc.cicReset = 0;

    // Wait 14 bit periods
    #(28*bitrateSamplesInt*TC) ;

    // Create a reset to clear the interpolators
    interpReset = 1;
    #(2*C) ;
    interpReset = 0;

    // Enable the sample rate loop without 2 sample summer
    write32(createAddress(`BITSYNCSPACE,`LF_CONTROL),32'h0000_0000);

    // Wait 2 bit periods
    #(10*bitrateSamplesInt*TC) ;

    viterbi.vitReset = 1;
    #(2*2*bitrateSamplesInt*TC) ;
    viterbi.vitReset = 0;
    //viterbi.codeEn = 1;

    `ifdef ENABLE_AGC
    // Enable the AGC loop
    write32(createAddress(`CHAGCSPACE,`ALF_CONTROL),0);
    `endif

    `ifdef TEST_BPSK
    write32(createAddress(`CARRIERSPACE,`CLF_CONTROL),2);
    `elsif TEST_QPSK
    write32(createAddress(`CARRIERSPACE,`CLF_CONTROL),2);
    `elsif TEST_OQPSK
    write32(createAddress(`CARRIERSPACE,`CLF_CONTROL),2);
    `endif

    // Wait for some data to pass thru
    #(2*50*bitrateSamplesInt*TC) ;

    // Turn on the BERT
    testBits = 1;
    measureSNR = 1;
    // Run the BERT
    #(2*200000*bitrateSamplesInt*TC) ;
    `ifdef MATLAB_VECTORS
    $fclose(outfile);
    `endif
    $stop;

    end

real carrierOffsetReal;
always @(demod.carrierLoop.carrierOffsetReal) carrierOffsetReal = demod.carrierLoop.carrierOffsetReal * RX_SAMPLE_FREQ/2.0;

endmodule

