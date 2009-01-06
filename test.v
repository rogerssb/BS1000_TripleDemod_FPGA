`include "./addressMap.v"
`timescale 1ns/100ps

//`define ENABLE_AGC
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
parameter SAMPLE_FREQ = 9.333333e6;
parameter HC = 1e9/SAMPLE_FREQ/2;
parameter C = 2*HC;
reg clken;
always #HC clk = clk^clken;
`define SAMPLE_PERIOD   (C*1e-9)
`define TWO_POW_32      4294967296.0
`define TWO_POW_31      2147483648.0
`define TWO_POW_17      131072.0


real carrierFreqHz = 2333333.0;
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

real bitrateBps = 250000.0;
real bitrateSamples = 1/bitrateBps/`SAMPLE_PERIOD/2.0;
integer bitrateSamplesInt = bitrateSamples;
wire [15:0]bitrateDivider = bitrateSamplesInt - 1;
real actualBitrateBps = SAMPLE_FREQ/bitrateSamplesInt/2.0;

// value = 2^ceiling(log2(R*R))/(R*R), where R = interpolation rate of the FM
// modulator
real interpolationGain = 1.28;

real deviationHz = 2*0.35 * bitrateBps;
real deviationNorm = deviationHz * `SAMPLE_PERIOD * `TWO_POW_32;
integer deviationInt = deviationNorm*interpolationGain;
wire [31:0]deviationQ31 = deviationInt;
wire [17:0]deviation = deviationQ31[31:14];

real cicDecimation = SAMPLE_FREQ/bitrateBps/2.0/2.0/2.0;
integer cicDecimationInt = cicDecimation;


real resamplerFreqSps = 2*actualBitrateBps;     // 2 samples per symbol
real resamplerFreqNorm = resamplerFreqSps/(SAMPLE_FREQ/cicDecimationInt/2.0) * `TWO_POW_32;
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
wire    [17:0]iTx,qTx;
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
dds dds ( 
    .sclr(reset), 
    .clk(clk), 
    .we(1'b1), 
    .data(fmModFreq), 
    .sine(qTx), 
    .cosine(iTx)
    );


/******************************************************************************
                            Channel Model
******************************************************************************/

reg  measureSNR;
initial measureSNR = 0;
wire    [17:0]iRx,qRx;
wire    [17:0]iSignal = {{2{iTx[17]}},iTx[17:2]};
wire    [17:0]qSignal = {{2{qTx[17]}},qTx[17:2]};
real iSignalReal = (iSignal[17] ? (iSignal - 262144.0) : iSignal)/131072.0;
real qSignalReal = (qSignal[17] ? (qSignal - 262144.0) : qSignal)/131072.0;
real iTxReal = (iTx[17] ? (iTx - 262144.0) : iTx)/131072.0;
real qTxReal = (qTx[17] ? (qTx - 262144.0) : qTx)/131072.0;
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
demod demod( 
    .clk(clk), .reset(reset), .syncIn(sync), 
    .wr0(we0), .wr1(we1), .wr2(we2), .wr3(we3),
    .addr(a),
    .din(d),
    .dout(dout),
    .demodClk(demodClk),
    .demodBit(demodBit),
    .iRx(iRx), .qRx(qRx)
    );

/******************************************************************************
                       Delay Line for BER Testing
******************************************************************************/

reg [15:0]testSR;
reg [4:0]testZeroCount;
reg testData;
always @(negedge demodClk or reset) begin
    if (reset) begin
        testZeroCount <= 5'b0;
        testSR <= MASK17;
        end
    else if (testSR[0] | (testZeroCount == 5'b11111))
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

reg [127:0]delaySR;
reg txDelay;
always @(negedge demodClk) begin
    txDelay <= delaySR[19];
    delaySR <= {delaySR[126:0],testData};
    end

reg testBits;
initial testBits = 0;
integer bitErrors;
initial bitErrors = 0;
integer testBitCount;
initial testBitCount = 0;
always @(posedge demodClk) begin
    if (testBits) begin
        testBitCount <= testBitCount + 1;
        if (demodBit != txDelay) begin
            bitErrors <= bitErrors + 1;
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
    demod.ddc.cicReset = 0;
    reset = 0;
    sync = 1;
    clk = 0;
    rd = 0;
    we0 = 0; we1 = 0; we2 = 0; we3 = 0; 
    d = 32'hz;
    fmModCS = 0;

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
    write32(`FM_MOD_CIC,9);
    fmModCS = 0;

    // Init the mode
    write32(createAddress(`DEMODSPACE,`DEMOD_CONTROL),{29'bx,`MODE_2FSK});

    // Init the sample rate loop filters
    write32(createAddress(`RESAMPSPACE,`RESAMPLER_RATE),resamplerFreqInt);
    write32(createAddress(`BITSYNCSPACE,`LF_CONTROL),1);    // Zero the error
    write32(createAddress(`BITSYNCSPACE,`LF_LEAD_LAG),32'h001a0014);    
    //write32(createAddress(`BITSYNCSPACE,`LF_LEAD_LAG),32'h0014000c);    
    write32(createAddress(`BITSYNCSPACE,`LF_LIMIT), resamplerLimitInt);    

    // Init the carrier loop filters
    write32(createAddress(`CARRIERSPACE,`LF_CONTROL),1);    // Zero the error
    write32(createAddress(`CARRIERSPACE,`LF_LEAD_LAG),32'h00000012);   
    write32(createAddress(`CARRIERSPACE,`LF_LIMIT), carrierLimit);

    // Init the downcoverter register set
    write32(createAddress(`DDCSPACE,`DDC_CENTER_FREQ), carrierFreq);

    // Init the cicResampler register set
    write32(createAddress(`CICDECSPACE,`CIC_DECIMATION),cicDecimationInt-1);
    write32(createAddress(`CICDECSPACE,`CIC_SHIFT), 5);

    // Init the channel agc loop filter
    write32(createAddress(`CHAGCSPACE,`ALF_CONTROL),1);                 // Zero the error
    write32(createAddress(`CHAGCSPACE,`ALF_SETPOINT),32'h000000e0);     // AGC Setpoint
    write32(createAddress(`CHAGCSPACE,`ALF_GAINS),32'h00000018);        // AGC Loop Gain
    write32(createAddress(`CHAGCSPACE,`ALF_ULIMIT),32'h4fffffff);       // AGC Upper limit
    write32(createAddress(`CHAGCSPACE,`ALF_LLIMIT),32'h20000000);       // AGC Lower limit

    reset = 1;
    #(2*C) ;
    reset = 0;

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

    // Wait 1.5 bit periods
    #(3.0*bitrateSamplesInt*C) ;

    enableTx = 1;

    // Create a reset to clear the cic resampler
    demod.ddc.cicReset = 1;
    #(2*C) ;
    demod.ddc.cicReset = 0;

    // Wait 14 bit periods
    #(28*bitrateSamplesInt*C) ;

    // Enable the sample rate loop
    write32(createAddress(`BITSYNCSPACE,`LF_CONTROL),0);  

    // Wait 2 bit periods
    #(4*bitrateSamplesInt*C) ;

    // Enable the AFC loop and invert the error
    write32(createAddress(`CARRIERSPACE,`LF_CONTROL),2);  

    `ifdef ENABLE_AGC
    // Wait 8 bit periods
    #(16*bitrateSamplesInt*C) ;

    // Enable the AGC loop
    write32(createAddress(`CHAGCSPACE,`ALF_CONTROL),0);              
    `endif

    // Wait for some data to pass thru
    #(2*100*bitrateSamplesInt*C) ;
    `ifdef MATLAB_VECTORS
    $fclose(outfile);
    `endif
    $stop;

    end

real carrierOffsetReal = demod.carrierLoop.carrierOffsetReal * SAMPLE_FREQ/2.0;
endmodule

