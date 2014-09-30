`include "./addressMap.v"
`timescale 1ns/100ps

`define ENABLE_AGC
//`define ADD_NOISE
//`define BER_TEST
//`define MATLAB_VECTORS
//`define ADD_SC_BITSYNC

`ifdef BER_TEST
!control .savsim=1
!mkeep (test
!mexclude (test(rxRadio
!mexclude (test(txRadio
`endif

//`define BPSK
`define SQPN
//`define OQPSK
//`define SS_UQPSK

module test;

reg reset,clk,we0,we1,we2,we3,rd;
reg sync;
reg [11:0]a;
reg [31:0]d;
wire [31:0]dout;

// Create the clocks
//parameter SAMPLE_FREQ = 9.333333e6;
parameter SAMPLE_FREQ = 100e6;
parameter HC = 1e9/SAMPLE_FREQ/2;
parameter C = 2*HC;
reg clken;
always #HC clk = clk^clken;
`define SAMPLE_PERIOD   (C*1e-9)
`define TWO_POW_32      4294967296.0
`define TWO_POW_31      2147483648.0
`define TWO_POW_17      131072.0

parameter modSampleDecimation = 7;
parameter modChipsPerSymbol = 10;
parameter ddcDecimation = 2;

//real carrierFreqHz = 2333333.3;
real carrierFreqHz = 25000000.0;
real carrierFreqNorm = carrierFreqHz * `SAMPLE_PERIOD * `TWO_POW_32;
integer carrierFreqInt = carrierFreqNorm;
wire [31:0] carrierFreq = carrierFreqInt;

real carrierOffsetFreqHz = 0.0;
real carrierOffsetFreqNorm = carrierOffsetFreqHz * `SAMPLE_PERIOD * `TWO_POW_32;
integer carrierOffsetFreqInt = carrierOffsetFreqNorm;
wire [31:0] carrierOffsetFreq = carrierOffsetFreqInt;

real carrierLimitHz = 60000.0;
real carrierLimitNorm = carrierLimitHz * `SAMPLE_PERIOD * `TWO_POW_32;
integer carrierLimitInt = carrierLimitNorm;
wire [31:0] carrierLimit = carrierLimitInt;

wire [31:0] sweepRate = 32'h00000000;

real chipRateSps = SAMPLE_FREQ/modSampleDecimation/2.0;
real chipRateSamples = 1.0/chipRateSps/`SAMPLE_PERIOD/2.0;
integer chipRateSamplesInt = chipRateSamples;
wire [15:0]chipRateDivider = chipRateSamplesInt - 1;

// value = 2^ceiling(log2(R*R))/(R*R), where R = interpolation rate of the FM
// modulator
real interpolationGain = 1.0;

real cicDecimation;
initial cicDecimation = (ddcDecimation == 1) ? 1 :
                        (ddcDecimation == 2) ? 1 :
                        (ddcDecimation == 3) ? 3 : 
                                               ddcDecimation/2;
integer cicDecimationInt;
initial cicDecimationInt = cicDecimation;

real resamplerFreqSps = 2*chipRateSps;     // 2 samples per symbol
real resamplerFreqNorm = (ddcDecimation == 1) ? resamplerFreqSps/(SAMPLE_FREQ/2.0) * `TWO_POW_32 :
                         (ddcDecimation == 2) ? resamplerFreqSps/(SAMPLE_FREQ/2.0/2.0) * `TWO_POW_32 : 
                         (ddcDecimation == 3) ? resamplerFreqSps/(SAMPLE_FREQ/2.0/3.0) * `TWO_POW_32 :  
                                                resamplerFreqSps/(SAMPLE_FREQ/2.0/cicDecimationInt/2.0) * `TWO_POW_32;
integer resamplerFreqInt = (resamplerFreqNorm >= `TWO_POW_31) ? (resamplerFreqNorm - `TWO_POW_32) : resamplerFreqNorm;

real resamplerLimitNorm = 0.001*resamplerFreqSps/SAMPLE_FREQ * `TWO_POW_32;
integer resamplerLimitInt = resamplerLimitNorm;

reg enableDespreader;
`ifdef SQPN
initial enableDespreader = 1;
`else
initial enableDespreader = 0;
`endif

/******************************************************************************
                            Create a chip sequence
******************************************************************************/

integer chipRateCount;
reg     chipClk;
reg     negEdgeChipClk;
reg     posEdgeChipClk;
always @(posedge clk) begin
    if (reset) begin
        chipRateCount <= 0;
        chipClk <= 0;
        negEdgeChipClk <= 0;
        posEdgeChipClk <= 0;
        end
    else begin
        if (chipRateCount == 0) begin
            chipRateCount <= chipRateSamplesInt-1;
            chipClk <= ~chipClk;
            negEdgeChipClk <= 0;
            posEdgeChipClk <= 0;
            end
        else begin
            chipRateCount <= chipRateCount - 1;
            if (chipRateCount == 1) begin
                if (chipClk) begin
                    negEdgeChipClk <= 1;
                    end
                else begin
                    posEdgeChipClk <= 1;
                    end
                end
            end
        end
    end

// PN Code Generator for the transmitter
codes_gen pnGen(
    .clk(clk),
    .clkEn(posEdgeChipClk),
    .reset(reset),
    //.init(18'h0008f),
    //.init(18'h00063),
    .init(18'h000ff),
    .polyTaps(18'h008e),
    .restartCount(18'h000fe),
    .iOutTaps(18'h00080),  
    .qOutTaps(18'h00090),
    .iOut(iModChip),
    .qOut(qModChip)
    );


reg     oqModChip;
always @(posedge clk) begin
    if (negEdgeChipClk) begin
        oqModChip <= qModChip;
    end
end

/******************************************************************************
                            Create a data stream
******************************************************************************/
integer symbolRateCount;
reg     symbolClk;
wire    negEdgeSymbolClk = posEdgeChipClk & symbolClk & (symbolRateCount == 0);
wire    posEdgeSymbolClk = posEdgeChipClk & !symbolClk & (symbolRateCount == 0);
always @(posedge clk) begin
    if (reset) begin
        symbolRateCount <= 0;
        symbolClk <= 0;
        end
    else if (posEdgeChipClk) begin
        if (symbolRateCount == 0) begin
            symbolRateCount <= modChipsPerSymbol/2 - 1;
            symbolClk <= ~symbolClk;
            end
        else begin
            symbolRateCount <= symbolRateCount - 1;
            end
        end
    end



// Alternating ones and zeros
reg     [3:0]altSR;
wire    modClk;
reg     altData;
always @(posedge clk or posedge reset) begin
    if (reset) begin
        altData <= 0;
        end
    else if (negEdgeSymbolClk) begin
        altData <= ~altData;
        end
    end

// Random data
parameter PN17 = 16'h008e,
          MASK17 = 16'h00ff;
reg [15:0]sr;
reg [4:0]zeroCount;
reg  randData;
always @(posedge clk or posedge reset) begin
    if (reset) begin
        zeroCount <= 5'b0;
        sr <= MASK17;
        end
    else if (negEdgeSymbolClk) begin
        if (sr[0] | (zeroCount == 5'b11111))
            begin
            zeroCount <= 5'h0;
            sr <= {1'b0, sr[15:1]} ^ PN17;
            end
        else
            begin
            zeroCount <= zeroCount + 5'h1;
            sr <= sr >> 1;
            end
        randData <= sr[0];
        end
    end

reg     modData;
always @(posedge clk) begin
    if (posEdgeSymbolClk) begin
        modData <= altData;
        //modData <= 1'b0;
        end
    end
/******************************************************************************
                            Instantiate a Modulator
******************************************************************************/
reg     [17:0]  iBB;
reg     [17:0]  qBB;
always @(*) begin
    casex (demod.demodMode)
        `MODE_OQPSK: begin
            if (enableDespreader) begin
                iBB = {iModChip ^ modData,17'h10000};
                qBB = {oqModChip ^ modData,17'h10000};
            end
            else begin
                iBB = {modData,17'h10000};
                qBB = {modData,17'h10000};
            end
        end
        `MODE_BPSK: begin
            iBB = {modData,17'h10000};
            qBB = 0;
        end
        default: begin
            iBB = {modData,17'h10000};
            qBB = {qModChip,17'h10000};
        end
    endcase
end

`ifdef SIMULATE
real iBBReal;
always @* iBBReal = $itor($signed(iBB))/(2.0**17);
real qBBReal;
always @* qBBReal = $itor($signed(qBB))/(2.0**17);
`endif

wire    [17:0]  iMod;
reg             txInterpReset;
reg             iModInterpCS;
interpolate iModInterp(
    .clk(clk), .reset(txInterpReset), .clkEn(posEdgeChipClk),
    .cs(iModInterpCS),
    .wr0(we0), .wr1(we1), .wr2(we2), .wr3(we3),
    .addr(a),
    .din(d),
    .dout(),
    .dataIn(iBB),
    .dataOut(iMod)
    );
wire    [17:0]  qMod;
reg             qModInterpCS;
interpolate qModInterp(
    .clk(clk), .reset(txInterpReset), .clkEn(posEdgeChipClk),
    .cs(qModInterpCS),
    .wr0(we0), .wr1(we1), .wr2(we2), .wr3(we3),
    .addr(a),
    .din(d),
    .dout(),
    .dataIn(qBB),
    .dataOut(qMod)
    );
wire    [17:0]  iLO,qLO;
dds carrierDds (
    .sclr(reset), 
    .clk(clk), 
    .ce(1'b1),
    .we(1'b1), 
    .data(carrierFreq + carrierOffsetFreq), 
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



/******************************************************************************
                            Channel Model
******************************************************************************/

real iTxReal = (iTx[17] ? (iTx - 262144.0) : iTx)/131072.0;
real qTxReal = (qTx[17] ? (qTx - 262144.0) : qTx)/131072.0;
real txScaleFactor;

//wire [17:0]iSignal = 131072.0*iTxReal * txScaleFactor;
//wire [17:0]qSignal = 131072.0*qTxReal * txScaleFactor;

// 0 Degrees
real rotateReal = 1.0;
real rotateImag = 0.0;
// 45 Degrees
//real rotateReal = 0.707;
//real rotateImag = 0.707;
// 90 Degrees
//real rotateReal = 0.0;
//real rotateImag = 1.0;
// 180 Degrees
//real rotateReal = -1.0;
//real rotateImag = 0.0;

wire    [17:0]iSignal = (2**17)*(iTxReal*rotateReal - qTxReal*rotateImag) * txScaleFactor;
wire    [17:0]qSignal = (2**17)*(iTxReal*rotateImag + qTxReal*rotateReal) * txScaleFactor;


reg  measureSNR;
initial measureSNR = 0;
wire    [17:0]iRx,qRx;
real iSignalReal = (iSignal[17] ? (iSignal - 262144.0) : iSignal)/131072.0;
real qSignalReal = (qSignal[17] ? (qSignal - 262144.0) : qSignal)/131072.0;
real signalMagSquared;
real noiseMagSquared;
integer txSampleCount;
reg [17:0]iNoise,qNoise;
real iNoiseReal = (iNoise[17] ? (iNoise - 262144.0) : iNoise)/131072.0;
real qNoiseReal = (qNoise[17] ? (qNoise - 262144.0) : qNoise)/131072.0;
always @(negedge clk) begin
    `ifdef ADD_NOISE
    iNoise <= $gaussPLI();
    qNoise <= $gaussPLI();
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

real iChReal = (iRx[17] ? (iRx - 262144.0) : iRx)/131072.0;
real qChReal = (qRx[17] ? (qRx - 262144.0) : qRx)/131072.0;
assign iRx = iSignal + iNoise;
assign qRx = qSignal + qNoise;




/******************************************************************************
                            Instantiate the Demod
******************************************************************************/
wire    [17:0]  dac0Out,dac1Out,dac2Out;
wire    [17:0]  iSymData,qSymData;
wire    [17:0]  iEye,qEye;
wire    [4:0]   eyeOffset;
demod demod( 
    .clk(clk), .reset(reset),
    .wr0(we0), .wr1(we1), .wr2(we2), .wr3(we3),
    .addr(a),
    .din(d),
    .dout(dout),
    .iBit(demodBit),
    .iRx(iRx), .qRx(qRx),
    .dac0Sync(dac0Sync),
    .dac0Data(dac0Out),
    .dac1Sync(dac1Sync),
    .dac1Data(dac1Out),
    .dac2Sync(dac2Sync),
    .dac2Data(dac2Out),
    .iSymEn(symEn),
    .iSym2xEn(symX2En),
    .iSymData(iSymData),
    .qSymEn(qSymEn),
    .qSymData(qSymData),
    .eyeSync(eyeSync),
    .iEye(iEye),.qEye(qEye),
    .eyeOffset(eyeOffset)
    );

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
reg             interpReset;
wire    [31:0]  dac0Dout;
wire    [17:0]  dac0Data;
interpolate dac0Interp(
    .clk(clk), .reset(interpReset), .clkEn(dac0Sync),
    .cs(dac0CS),
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
interpolate dac1Interp(
    .clk(clk), .reset(interpReset), .clkEn(dac1Sync),
    .cs(dac1CS),
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
interpolate dac2Interp(
    .clk(clk), .reset(interpReset), .clkEn(dac2Sync),
    .cs(dac2CS),
    .wr0(we0), .wr1(we1), .wr2(we2), .wr3(we3),
    .addr(a),
    .din(d),
    .dout(dac2Dout),
    .dataIn(dac2Out),
    .dataOut(dac2Data)
    );
assign dac2_d = dac2Data[17:4];
assign dac2_clk = clk;


decoder decoder
  (
  .rs(reset),
  .en(1'b0),
  .wr0(1'b0),.wr1(1'b0),
  .addr(),
  .din(),
  .dout(),
  .clk(clk),
  .symb_clk_en(symEn),
  .symb_clk_2x_en(symX2En),
  .symb_i(demodBit),
  .symb_q(),
  .dout_i(),
  .dout_q(),
  .cout(),
  .fifo_rs(),
  .clk_inv()
  );

`ifdef ADD_SC_BITSYNC
reg scEn;
initial scEn = 1;
demod scDemod(
    .clk(clk),
    .reset(reset),
    .wr0(scEn & we0),
    .wr1(scEn & we1),
    .wr2(scEn & we2),
    .wr3(scEn & we3),
    .addr(a),
    .din(d),
    .bbClkEn(symEn),
    .iBB(iSymData),
    .qBB(qSymData)
    );
`endif

//******************************************************************************
//                        SDI Output Interface
//******************************************************************************

wire    [31:0]  sdiDout;
sdi sdi(
    .clk(clk),
    .reset(reset),
    .wr0(we0),
    .wr1(we1),
    .wr2(we2),
    .wr3(we3),
    .addr(a),
    .dataIn(d),
    .dataOut(),
    .iSymEn(symEn),
    .iSymData(iSymData),
    .qSymEn(qSymEn),
    .qSymData(qSymData),
    .eyeSync(eyeSync),
    .iEye(iEye),.qEye(qEye),
    .eyeOffset(eyeOffset),
    .sdiOut(sdiOut)
    );



/******************************************************************************
                       Delay Line for BER Testing
******************************************************************************/
reg [15:0]testSR;
reg [4:0]testZeroCount;
reg testData;
//always @(negedge demodClk or reset) begin
always @(posedge clk or reset) begin
    if (reset) begin
        testZeroCount <= 5'b0;
        testSR <= MASK17;
        end
    else if (symEn) begin
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

reg [127:0]delaySR;
reg txDelay;
//always @(negedge demodClk) begin
always @(posedge clk) begin
    if (symEn) begin
        txDelay <= delaySR[19];
        delaySR <= {delaySR[126:0],testData};
        end
    end

reg testBits;
initial testBits = 0;
integer bitErrors;
initial bitErrors = 0;
integer testBitCount;
initial testBitCount = 0;
always @(posedge clk) begin
    if (symEn) begin
        if (testBits) begin
            testBitCount <= testBitCount + 1;
            if (demodBit != txDelay) begin
                bitErrors <= bitErrors + 1;
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

function [11:0] createAddress;
    input [11:0] addrA;
    input [11:0] addrB;
    
    integer i;
    reg [11:0]finalAddress;

    begin
    for (i = 0; i < 12; i = i+1) begin
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
  input [11:0]addr;
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
  input [11:0]addr;
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
  input [11:0]addr;
  begin
    a = addr;
    rd = 0;
    #100 rd = 1;
    #100 rd = 0;
    #200;
  end
endtask

integer j;
initial begin

    `ifdef ADD_NOISE
    // The 11.5 is a fudge factor (should be 12 for the 2 bit shift) for the scaling 
    // down of the transmit waveform from full scale.
    // The 13.0 is to translate from SNR to EBNO which is 10log10(bitrate/bandwidth).
    $initGaussPLI(1,8.0 + 11.5 - 13.0,131072.0);
    `endif
    demod.ddc.hbReset = 1;
    demod.ddc.cicReset = 1;
    `ifdef ADD_SC_BITSYNC
    scDemod.ddc.cicReset = 1;
    `endif
    txInterpReset = 0;
    interpReset = 0;
    reset = 0;
    sync = 1;
    clk = 0;
    rd = 0;
    we0 = 0; we1 = 0; we2 = 0; we3 = 0; 
    d = 32'hz;
    txScaleFactor = 0.707;
    decoder.decoder_regs.q = 16'h0004;


    // Turn on the clock
    clken=1;
    #(10*C) ;

    iModInterpCS = 1;
    qModInterpCS = 1;
    write32(createAddress(`INTERP0SPACE, `INTERP_CONTROL),8);
    write32(createAddress(`INTERP0SPACE, `INTERP_EXPONENT), 7);
    write32(createAddress(`INTERP0SPACE, `INTERP_MANTISSA), 32'h00011000);
    iModInterpCS = 0;
    qModInterpCS = 0;

    // Init the downcoverter register set
    `ifdef ADD_SC_BITSYNC
    scEn = 1;
    `endif
    write32(createAddress(`DEMODSPACE,`DEMOD_CONTROL),{14'bx,`MODE_SINGLE_RAIL,1'b0,10'bx,`MODE_QPSK});
    write32(createAddress(`DDCSPACE,`DDC_CONTROL), {28'h0,4'b1110});
    write32(createAddress(`DDCSPACE,`DDC_CENTER_FREQ), 0);
    write32(createAddress(`DDCSPACE,`DDC_DECIMATION), 0);
    write32(createAddress(`CICDECSPACE,`CIC_DECIMATION),2);
    write32(createAddress(`CICDECSPACE,`CIC_SHIFT), 5); // log2(cicDecimation ^ 3)

    // Init the sample rate loop filters
    write32(createAddress(`RESAMPSPACE,`RESAMPLER_RATE),32'h99999999);
    write32(createAddress(`BITSYNCSPACE,`LF_CONTROL),1);    // Zero the error
    //write32(createAddress(`BITSYNCSPACE,`LF_LEAD_LAG),32'h001c0010);    
    write32(createAddress(`BITSYNCSPACE,`LF_LEAD_LAG),32'h001a000c);    
    write32(createAddress(`BITSYNCSPACE,`LF_LIMIT), resamplerLimitInt);    

    // Init the channel agc loop filter
    write32(createAddress(`CHAGCSPACE,`ALF_CONTROL),1);                 // Zero the error
    write32(createAddress(`CHAGCSPACE,`ALF_SETPOINT),32'h000000e8);     // AGC Setpoint
    write32(createAddress(`CHAGCSPACE,`ALF_GAINS),32'h00180018);        // AGC Loop Gain
    write32(createAddress(`CHAGCSPACE,`ALF_ULIMIT),32'h4fffffff);       // AGC Upper limit
    write32(createAddress(`CHAGCSPACE,`ALF_LLIMIT),32'h00000000);       // AGC Lower limit
    `ifdef ADD_SC_BITSYNC
    scEn = 0;
    `endif

    // Init the mode
    `ifdef BPSK
    write32(createAddress(`DEMODSPACE,`DEMOD_CONTROL),{14'bx,`MODE_SINGLE_RAIL,enableDespreader,10'bx,`MODE_BPSK});
    `else
    `ifdef SQPN
    //write32(createAddress(`DEMODSPACE,`DEMOD_CONTROL),{14'bx,`MODE_SINGLE_RAIL,enableDespreader,10'bx,`MODE_SQPN});
    write32(createAddress(`DEMODSPACE,`DEMOD_CONTROL),{14'bx,`MODE_SINGLE_RAIL,enableDespreader,10'bx,`MODE_OQPSK});
    `else
    write32(createAddress(`DEMODSPACE,`DEMOD_CONTROL),{14'bx,`MODE_SINGLE_RAIL,enableDespreader,10'bx,`MODE_SS_UQPSK});
    `endif
    `endif

    // Init the sample rate loop filters
    write32(createAddress(`RESAMPSPACE,`RESAMPLER_RATE),resamplerFreqInt);
    write32(createAddress(`BITSYNCSPACE,`LF_CONTROL),1);    // Zero the error
    //write32(createAddress(`BITSYNCSPACE,`LF_LEAD_LAG),32'h001c0010);    
    write32(createAddress(`BITSYNCSPACE,`LF_LEAD_LAG),32'h001a000c);    
    write32(createAddress(`BITSYNCSPACE,`LF_LIMIT), resamplerLimitInt);    

    // Init the carrier loop filters
    write32(createAddress(`CARRIERSPACE,`CLF_CONTROL),1);    // Zero the error
    //write32(createAddress(`CARRIERSPACE,`CLF_LEAD_LAG),32'h0015000b);   
    write32(createAddress(`CARRIERSPACE,`CLF_LEAD_LAG),32'h00130008);   
    write32(createAddress(`CARRIERSPACE,`CLF_ULIMIT), carrierLimit);
    write32(createAddress(`CARRIERSPACE,`CLF_LLIMIT), -carrierLimit);
    write32(createAddress(`CARRIERSPACE,`CLF_LOOPDATA), sweepRate);
    write32(createAddress(`CARRIERSPACE,`CLF_LOCKDETECTOR), 32'h03008000);

    // Init the downcoverter register set
    if (ddcDecimation == 1) begin
        write32(createAddress(`DDCSPACE,`DDC_CONTROL), {29'h0,3'b111});
        end
    else if (ddcDecimation == 2) begin
        write32(createAddress(`DDCSPACE,`DDC_CONTROL), {29'h0,3'b101});
        end
    else if (ddcDecimation == 3) begin
        write32(createAddress(`DDCSPACE,`DDC_CONTROL), {29'h0,3'b110});
        end
    else begin
        write32(createAddress(`DDCSPACE,`DDC_CONTROL), {29'h0,3'b100});
        end
    write32(createAddress(`DDCSPACE,`DDC_CENTER_FREQ), carrierFreq);
    write32(createAddress(`DDCSPACE,`DDC_DECIMATION), 0);

    // Init the cicResampler register set
    write32(createAddress(`CICDECSPACE,`CIC_DECIMATION),cicDecimationInt-1);
    write32(createAddress(`CICDECSPACE,`CIC_SHIFT), 3); // log2(cicDecimation ^ 3)

    // Init the channel agc loop filter
    write32(createAddress(`CHAGCSPACE,`ALF_CONTROL),1);                 // Zero the error
    write32(createAddress(`CHAGCSPACE,`ALF_SETPOINT),32'h000000e8);     // AGC Setpoint
    write32(createAddress(`CHAGCSPACE,`ALF_GAINS),32'h00180018);        // AGC Loop Gain
    write32(createAddress(`CHAGCSPACE,`ALF_ULIMIT),32'h4fffffff);       // AGC Upper limit
    write32(createAddress(`CHAGCSPACE,`ALF_LLIMIT),32'h00000000);       // AGC Lower limit
    // Set the DAC interpolator gains
    write32(createAddress(`DEMODSPACE, `DEMOD_DACSELECT), {12'h0,`DAC_FREQ,
                                                           4'h0,`DAC_DS_CODE,
                                                           4'h0,`DAC_I});
    write32(createAddress(`INTERP0SPACE, `INTERP_CONTROL),0);
    write32(createAddress(`INTERP0SPACE, `INTERP_EXPONENT), 8);
    write32(createAddress(`INTERP0SPACE, `INTERP_MANTISSA), 32'h00012000);
    write32(createAddress(`INTERP1SPACE, `INTERP_CONTROL),1);
    write32(createAddress(`INTERP1SPACE, `INTERP_EXPONENT), 8);
    write32(createAddress(`INTERP1SPACE, `INTERP_MANTISSA), 32'h00012000);
    write32(createAddress(`INTERP2SPACE, `INTERP_CONTROL),0);
    write32(createAddress(`INTERP2SPACE, `INTERP_EXPONENT), 8);
    write32(createAddress(`INTERP2SPACE, `INTERP_MANTISSA), 32'h00012000);

    // Set the SDI baudrate
    write32(createAddress(`UARTSPACE, `UART_BAUD_DIV),99);

    // Set the despread codes
    write32(createAddress(`DESPREADSPACE, `DESPREAD_INIT_A),32'h1);
    write32(createAddress(`DESPREADSPACE, `DESPREAD_POLYTAPS_A),32'h0000008e);
    write32(createAddress(`DESPREADSPACE, `DESPREAD_RESTART_COUNT_A),32'h000000fe);
    write32(createAddress(`DESPREADSPACE, `DESPREAD_IOUTTAPS_A),32'h00000080);
    write32(createAddress(`DESPREADSPACE, `DESPREAD_QOUTTAPS_A),32'h00000090);
    write32(createAddress(`DESPREADSPACE, `DESPREAD_EPOCH_A),32'h000000ff);
    write32(createAddress(`DESPREADSPACE, `DESPREAD_CONTROL_A),32'h00000001);
    write32(createAddress(`DESPREADSPACE, `DESPREAD_SYNC_CONTROL),{16'h000f,1'bx,7'h6,1'bx,7'h3});
    write32(createAddress(`DESPREADSPACE, `DESPREAD_CONTROL),{16'h0,8'h0,5'h0,`DS_MODE_NASA_DG1_MODE1});
    //write32(createAddress(`DESPREADSPACE, `DESPREAD_SYNC_CONTROL),{16'h000f,1'bx,7'h1,1'bx,7'h1});
    //write32(createAddress(`DESPREADSPACE, `DESPREAD_CONTROL),{16'h0,8'h0,5'h0,`DS_MODE_NASA_DG1_MODE3_SPREAD_I});



    reset = 1;
    #(2*C) ;
    reset = 0;
    demod.ddc.hbReset = 0;
    demod.ddc.cicReset = 0;
    `ifdef ADD_SC_BITSYNC
    scDemod.ddc.cicReset = 0;
    `endif

    // Force the carrier frequency to load. We have to do this because
    // the load is normally not done in FSK mode until you get symbol
    // enables from the bitsync
    demod.ddc.ddcFreq = -carrierFreq;

    // Wait 9.5 bit periods
    #(19*chipRateSamplesInt*C) ;

    // Create a reset to clear the nco accumulator
    reset = 1;
    #(2*C) ;
    reset = 0;
    demod.channelAGC.chAgcLoopFilter.integrator = 32'h1c880000;

    // Wait 20 bit periods
    #(40*chipRateSamplesInt*C) ;
    pnGen.restartCounter = 0;

    // Create a reset to clear the transmit interpolators
    txInterpReset = 1;
    #(2*C) ;
    txInterpReset = 0;

    // Wait 2.0 bit periods
    #(4.0*chipRateSamplesInt*C) ;

    // Create a reset to clear the halfband
    demod.ddc.hbReset = 1;
    #(2*C) ;
    demod.ddc.hbReset = 0;

    for (j = 0; j < 64 ; j = j + 1) begin
        demod.despreader.iCorrOnTime.rxSR[j] = 0;
        demod.despreader.qCorrOnTime.rxSR[j] = 0;
        demod.despreader.iSwapOnTime.rxSR[j] = 0;
        demod.despreader.qSwapOnTime.rxSR[j] = 0;
    end
    #(2*chipRateSamplesInt*C) ;
    demod.despreader.corrSimReset = 0;

    // Wait 2 bit periods
    #(4*chipRateSamplesInt*C) ;

    // Create a reset to clear the cic resampler
    demod.ddc.cicReset = 1;
    #(2*C) ;
    demod.ddc.cicReset = 0;

    // Wait
    #(4*chipRateSamplesInt*C) ;

    // Create a reset to clear the cic resampler
    demod.ddc.cicReset = 1;
    #(2*C) ;
    demod.ddc.cicReset = 0;

    // Wait 14 bit periods
    #(28*chipRateSamplesInt*C) ;

    // Create a reset to clear the interpolators
    interpReset = 1;
    #(2*C) ;
    interpReset = 0;

    // Enable the sample rate loop
    write32(createAddress(`BITSYNCSPACE,`LF_CONTROL),32'h00000000);  

    // Wait
    #(10*chipRateSamplesInt*C) ;

    // Enable the carrier loop, invert the error, and enable sweep
    write32(createAddress(`CARRIERSPACE,`CLF_CONTROL),2);  

    `ifdef ENABLE_AGC
    // Enable the AGC loop
    write32(createAddress(`CHAGCSPACE,`ALF_CONTROL),0);              
    `endif

    // Enable the SDI in eye pattern mode
    write32(createAddress(`SDISPACE,`SDI_CONTROL),32'h00000082);

    #(1*100*chipRateSamplesInt*C) ;
    `ifdef ADD_SC_BITSYNC
    scDemod.ddc.hbReset = 1;
    #(2*C) ;
    scDemod.ddc.hbReset = 0;
    `endif

    #(1*100*chipRateSamplesInt*C) ;
    `ifdef ADD_SC_BITSYNC
    scDemod.ddc.cicReset = 1;
    #(2*C) ;
    scDemod.ddc.cicReset = 0;
    `endif

    // Wait for some data to pass thru
    #(1*100*chipRateSamplesInt*C) ;
    `ifdef MATLAB_VECTORS
    $fclose(outfile);
    `endif
    $stop;

    `ifdef ADD_SC_BITSYNC
    scEn = 1;
    write32(createAddress(`BITSYNCSPACE,`LF_CONTROL),32'h00000000);  
    scEn = 0;
    `endif

    //write32(createAddress(`BITSYNCSPACE,`LF_LEAD_LAG),32'h0018000c);    
    //write32(createAddress(`BITSYNCSPACE,`LF_LEAD_LAG),32'h001e0018);    

    read32(createAddress(`SDISPACE,`SDI_CONTROL));

    end

real carrierOffsetReal = demod.carrierLoop.carrierOffsetReal * SAMPLE_FREQ/2.0;
endmodule

