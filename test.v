`include "./addressMap.v"
`timescale 1ns/100ps

`define ENABLE_AGC
//`define ADD_NOISE
//`define BER_TEST
//`define MATLAB_VECTORS

`ifdef BER_TEST
!control .savsim=1
!mkeep (test
!mexclude (test(rxRadio
!mexclude (test(txRadio
`endif

module test;

reg reset,clk,we0,we1,we2,we3,rd;
reg sync;
reg [11:0]a;
reg [31:0]d;
wire [31:0]dout;

// Create the clocks
//parameter SAMPLE_FREQ = 9.333333e6;
parameter SAMPLE_FREQ = 10e6;
parameter HC = 1e9/SAMPLE_FREQ/2;
parameter C = 2*HC;
reg clken;
always #HC clk = clk^clken;
`define SAMPLE_PERIOD   (C*1e-9)
`define TWO_POW_32      4294967296.0
`define TWO_POW_31      2147483648.0
`define TWO_POW_17      131072.0


real carrierFreqHz = 2500000.0;
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

real bitrateBps = 200000.0;
real bitrateSamples = 1/bitrateBps/`SAMPLE_PERIOD/2.0;
integer bitrateSamplesInt = bitrateSamples;
wire [15:0]bitrateDivider = bitrateSamplesInt - 1;
real actualBitrateBps = SAMPLE_FREQ/bitrateSamplesInt/2.0;

// value = 2^ceiling(log2(R*R))/(R*R), where R = interpolation rate of the FM
// modulator
real interpolationGain = 1.6384;

//real deviationHz = 0*0.35 * bitrateBps;
real deviationHz = 2*0.350 * bitrateBps;
real deviationNorm = deviationHz * `SAMPLE_PERIOD * `TWO_POW_32;
integer deviationInt = deviationNorm*interpolationGain;
wire [31:0]deviationQ31 = deviationInt;
wire [17:0]deviation = deviationQ31[31:14];

real cicDecimation;
initial cicDecimation = SAMPLE_FREQ/bitrateBps/2.0/2.0/2.0/2.0;
integer cicDecimationInt;
initial cicDecimationInt = (cicDecimation < 2.0) ? 2 : cicDecimation;


real resamplerFreqSps = 2*actualBitrateBps;     // 2 samples per symbol
real resamplerFreqNorm = resamplerFreqSps/(SAMPLE_FREQ/cicDecimationInt/4.0) * `TWO_POW_32;
integer resamplerFreqInt = (resamplerFreqNorm >= `TWO_POW_31) ? (resamplerFreqNorm - `TWO_POW_32) : resamplerFreqNorm;
//integer resamplerFreqInt = resamplerFreqNorm;

real resamplerLimitNorm = 0.001*resamplerFreqSps/SAMPLE_FREQ * `TWO_POW_32;
integer resamplerLimitInt = resamplerLimitNorm;

/******************************************************************************
                            Create a bit stream
******************************************************************************/

// Alternating ones and zeros
reg     [3:0]altSR;
wire    modClk;
reg     altData;
always @(negedge modClk or posedge reset) begin
    if (reset) begin
        altData <= 0;
        end
    else begin
        altData <= ~altData;
        end
    end

// Random data
parameter PN17 = 16'h008e,
          MASK17 = 16'h00ff;
reg [15:0]sr;
reg [4:0]zeroCount;
reg  randData;
always @(negedge modClk or posedge reset) begin
    if (reset) begin
        zeroCount <= 5'b0;
        sr <= MASK17;
        end
    else if (sr[0] | (zeroCount == 5'b11111))
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

wire modData = randData;
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
    .addr(a),
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
`endif



/******************************************************************************
                            Channel Model
******************************************************************************/

real iTxReal = (iTx[17] ? (iTx - 262144.0) : iTx)/131072.0;
real qTxReal = (qTx[17] ? (qTx - 262144.0) : qTx)/131072.0;
real txScaleFactor;

wire [17:0]iSignal = 131072.0*iTxReal * txScaleFactor;
wire [17:0]qSignal = 131072.0*qTxReal * txScaleFactor;

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
    .clk(clk), .reset(reset), .syncIn(sync), 
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
wire    [31:0]  dac0Dout;
wire    [17:0]  dac0Data;
reg             interpReset;
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

initial begin

    `ifdef ADD_NOISE
    // The 11.5 is a fudge factor (should be 12 for the 2 bit shift) for the scaling 
    // down of the transmit waveform from full scale.
    // The 13.0 is to translate from SNR to EBNO which is 10log10(bitrate/bandwidth).
    $initGaussPLI(1,8.0 + 11.5 - 13.0,131072.0);
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
    txScaleFactor = 0.707;
    decoder.decoder_regs.q = 16'h0004;


    // Turn on the clock
    clken=1;
    #(10*C) ;

    // Init the fm modulator
    // Init the modulator register set
    fmModCS = 1;
    write32(`FM_MOD_FREQ, carrierFreq + carrierOffsetFreq);
    write32(`FM_MOD_DEV, {14'bx,deviation});
    write32(`FM_MOD_BITRATE, {1'b0,15'bx,bitrateDivider});
    // This value is ceiling(log2(R*R)), where R = interpolation rate.
    write32(`FM_MOD_CIC,10);
    fmModCS = 0;

    // Init the mode
    write32(createAddress(`DEMODSPACE,`DEMOD_CONTROL),{14'bx,`MODE_SINGLE_RAIL,13'bx,`MODE_2FSK});

    // Init the sample rate loop filters
    write32(createAddress(`RESAMPSPACE,`RESAMPLER_RATE),resamplerFreqInt);
    write32(createAddress(`BITSYNCSPACE,`LF_CONTROL),1);    // Zero the error
    write32(createAddress(`BITSYNCSPACE,`LF_LEAD_LAG),32'h001c0014);    
    //write32(createAddress(`BITSYNCSPACE,`LF_LEAD_LAG),32'h0014000c);    
    write32(createAddress(`BITSYNCSPACE,`LF_LIMIT), resamplerLimitInt);    

    // Init the carrier loop filters
    write32(createAddress(`CARRIERSPACE,`LF_CONTROL),1);    // Zero the error
    write32(createAddress(`CARRIERSPACE,`LF_LEAD_LAG),32'h0000000c);   
    write32(createAddress(`CARRIERSPACE,`LF_LIMIT), carrierLimit);
    write32(createAddress(`CARRIERSPACE,`LF_LOOPDATA), sweepRate);

    // Init the downcoverter register set
    write32(createAddress(`DDCSPACE,`DDC_CONTROL),0);
    write32(createAddress(`DDCSPACE,`DDC_CENTER_FREQ), carrierFreq);

    // Init the cicResampler register set
    write32(createAddress(`CICDECSPACE,`CIC_DECIMATION),cicDecimationInt-1);
    write32(createAddress(`CICDECSPACE,`CIC_SHIFT), 5);

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
    write32(createAddress(`INTERP2SPACE, `INTERP_CONTROL),0);
    write32(createAddress(`INTERP2SPACE, `INTERP_EXPONENT), 8);
    write32(createAddress(`INTERP2SPACE, `INTERP_MANTISSA), 32'h00012000);

    // Set the SDI baudrate
    write32(createAddress(`UARTSPACE, `UART_BAUD_DIV),99);

    reset = 1;
    #(2*C) ;
    reset = 0;
    demod.ddc.hbReset = 0;
    demod.ddc.cicReset = 0;

    // Wait 9.5 bit periods
    #(19*bitrateSamplesInt*C) ;

    // Force the carrier frequency to load. We have to do this because
    // the load is normally not done in FSK mode until you get symbol
    // enables from the bitsync
    demod.ddc.ddcFreq = -carrierFreq;

    // Create a reset to clear the nco accumulator
    reset = 1;
    #(2*C) ;
    reset = 0;

    // Wait 2.0 bit periods
    #(4.0*bitrateSamplesInt*C) ;

    enableTx = 1;

    // Create a reset to clear the halfband
    demod.ddc.hbReset = 1;
    #(2*C) ;
    demod.ddc.hbReset = 0;

    // Wait 2 bit periods
    #(4.0*bitrateSamplesInt*C) ;

    // Create a reset to clear the cic resampler
    demod.ddc.cicReset = 1;
    #(2*C) ;
    demod.ddc.cicReset = 0;

    // Wait 14 bit periods
    #(28*bitrateSamplesInt*C) ;

    // Create a reset to clear the interpolators
    interpReset = 1;
    #(2*C) ;
    interpReset = 0;

    // Enable the sample rate loop with 2 sample summer
    write32(createAddress(`BITSYNCSPACE,`LF_CONTROL),32'h00000010);  

    // Wait 2 bit periods
    #(4*bitrateSamplesInt*C) ;

    // Enable the AFC loop and invert the error
    //write32(createAddress(`CARRIERSPACE,`LF_CONTROL),2);  

    `ifdef ENABLE_AGC
    // Enable the AGC loop
    write32(createAddress(`CHAGCSPACE,`ALF_CONTROL),0);              
    `endif

    // Enable the SDI in eye pattern mode
    write32(createAddress(`SDISPACE,`SDI_CONTROL),32'h00000082);


    // Wait for some data to pass thru
    #(2*100*bitrateSamplesInt*C) ;
    `ifdef MATLAB_VECTORS
    $fclose(outfile);
    `endif
    $stop;

    //write32(createAddress(`BITSYNCSPACE,`LF_LEAD_LAG),32'h0018000c);    
    write32(createAddress(`BITSYNCSPACE,`LF_LEAD_LAG),32'h001e0018);    

    read32(createAddress(`SDISPACE,`SDI_CONTROL));

    end

real carrierOffsetReal = demod.carrierLoop.carrierOffsetReal * SAMPLE_FREQ/2.0;
endmodule

