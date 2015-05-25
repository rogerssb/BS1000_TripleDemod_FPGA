`include "./addressMap.v"
`timescale 1ns/100ps

`define ENABLE_AGC
//`define TRIM_DATA
//`define ADD_NOISE
//`define BER_TEST
//`define MATLAB_VECTORS

`ifdef TRIM_DATA
!control .savsim=1
!mkeep (test
//!mexclude (test(dds
!mexclude (test(demod(ddc
!mkeep (test(lagAccumReal
`endif

module test;

reg reset,clk,we0,we1,we2,we3,rd;
reg sync;
reg [11:0]a;
reg [31:0]d;
wire [31:0]dout;

// Create the clocks
parameter adcDecimation = 2;
parameter SYSTEM_FREQ = 9.333333e6;
parameter SAMPLE_FREQ = SYSTEM_FREQ/adcDecimation;
parameter HC = 1e9/SYSTEM_FREQ/2;
parameter C = 2*HC;
reg clken;
always #HC clk = clk^clken;
`define SYSTEM_PERIOD   (C*1e-9)
`define TWO_POW_32      4294967296.0
`define TWO_POW_31      2147483648.0
`define TWO_POW_17      131072.0


real carrierFreqHz = 2333333.3;
real carrierFreqNorm = carrierFreqHz * `SYSTEM_PERIOD * `TWO_POW_32;
integer carrierFreqInt = carrierFreqNorm;
wire [31:0] carrierFreq = carrierFreqInt;

real carrierOffsetFreqHz = 0000.0;
real carrierOffsetFreqNorm = carrierOffsetFreqHz * `SYSTEM_PERIOD * `TWO_POW_32;
integer carrierOffsetFreqInt = carrierOffsetFreqNorm;
wire [31:0] carrierOffsetFreq = carrierOffsetFreqInt;

real carrierLimitHz = 25000.0;
real carrierLimitNorm = carrierLimitHz * `SYSTEM_PERIOD * `TWO_POW_32;
integer carrierLimitInt = carrierLimitNorm;
wire [31:0] carrierLimit = carrierLimitInt;
integer negCarrierLimitInt = -carrierLimitNorm;
wire    [31:0]  negCarrierLimit = negCarrierLimitInt;

wire [31:0] sweepRate = 32'hffff0000;
//wire [31:0] sweepRate = 32'h0039c759;

real bitrateBps = 600000.0/adcDecimation;
real bitrateSamples = 1/bitrateBps/`SYSTEM_PERIOD/2.0;
integer bitrateSamplesInt = bitrateSamples;
wire [15:0]bitrateDivider = bitrateSamplesInt - 1;
real actualBitrateBps = SYSTEM_FREQ/bitrateSamplesInt/2.0;

integer cicDecimationInt = 3;


real resamplerFreqSps = 2*actualBitrateBps;     // 2 samples per symbol
//real resamplerFreqNorm = resamplerFreqSps/(SAMPLE_FREQ/cicDecimationInt/2.0) * `TWO_POW_32;
real resamplerFreqNorm = resamplerFreqSps/(SAMPLE_FREQ/2.0/2.0) * `TWO_POW_32;
integer resamplerFreqInt = (resamplerFreqNorm >= `TWO_POW_31) ? (resamplerFreqNorm - `TWO_POW_32) : resamplerFreqNorm;
//integer resamplerFreqInt = resamplerFreqNorm;

real resamplerLimitNorm = 0.01*resamplerFreqNorm;
integer resamplerLimitInt = resamplerLimitNorm;

/******************************************************************************
                            Create a bit stream
******************************************************************************/

integer bitrateCount;
reg     modReset;
reg     modClk;
always @(posedge clk) begin
    if (modReset) begin
        bitrateCount <= 0;
        modClk <= 0;
        end
    else begin
        if (bitrateCount == 0) begin
            bitrateCount <= bitrateSamplesInt-1;
            modClk <= ~modClk;
            end
        else begin
            bitrateCount <= bitrateCount - 1;
            end
        end
    end


// Alternating ones and zeros
reg     [3:0]altSR;
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
    //randData <= 1'b0;
    end

/******************************************************************************
                            Instantiate a Modulator
******************************************************************************/
wire    [17:0]  iBB,qBB;
assign iBB = {randData,17'h10000};
assign qBB = 18'h0;
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
demod demod( 
    .clk(clk), .reset(reset),
    .wr0(we0), .wr1(we1), .wr2(we2), .wr3(we3),
    .addr(a),
    .din(d),
    .dout(dout),
    .iSym2xEn(iSym2xEn),
    .iBit(demodBit),
    .iRx(iRx), .qRx(qRx),
    .dac0Sync(dac0Sync),
    .dac0Data(dac0Out),
    .dac1Sync(dac1Sync),
    .dac1Data(dac1Out),
    .dac2Sync(dac2Sync),
    .dac2Data(dac2Out)
    );
reg demodClk;
always @(posedge clk) begin
    if (reset) begin
        demodClk <= 0;
        end
    else if (iSym2xEn) begin
        demodClk <= ~demodClk;
        end
    end

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
    demod.ddc.hbReset = 1;
    demod.ddc.cicReset = 1;
    interpReset = 0;
    modReset = 0;
    reset = 0;
    sync = 1;
    clk = 0;
    rd = 0;
    we0 = 0; we1 = 0; we2 = 0; we3 = 0; 
    d = 32'hz;
    txScaleFactor = 0.25;

    // Turn on the clock
    clken=1;
    #(10*C) ;

    // Init the mode
    write32(createAddress(`DEMODSPACE,`DEMOD_CONTROL),{29'bx,`MODE_BPSK});

    // Init the sample rate loop filters
    //resamplerFreqInt = 32'h83a83a84;
    //resamplerFreqInt = 32'h8000eff9;
    write32(createAddress(`RESAMPSPACE,`RESAMPLER_RATE),resamplerFreqInt);
    write32(createAddress(`BITSYNCSPACE,`LF_CONTROL),1);    // Zero the error
    write32(createAddress(`BITSYNCSPACE,`LF_LEAD_LAG),32'h001a000d);    
    //write32(createAddress(`BITSYNCSPACE,`LF_LEAD_LAG),32'h0014000c);    
    write32(createAddress(`BITSYNCSPACE,`LF_LIMIT), resamplerLimitInt);    
    write32(createAddress(`BITSYNCSPACE,`LF_LOCKDETECTOR), 32'h00308000);

    // Init the carrier loop filters
    write32(createAddress(`CARRIERSPACE,`CLF_CONTROL),1);    // Zero the error
    write32(createAddress(`CARRIERSPACE,`CLF_LEAD_LAG),32'h0014000b);   
    write32(createAddress(`CARRIERSPACE,`CLF_ULIMIT), carrierLimit);
    write32(createAddress(`CARRIERSPACE,`CLF_LLIMIT), negCarrierLimit);
    write32(createAddress(`CARRIERSPACE,`CLF_LOOPDATA), sweepRate);
    write32(createAddress(`CARRIERSPACE,`CLF_LOCKDETECTOR), 32'h00308000);

    // Init the downcoverter register set
    write32(createAddress(`DDCSPACE,`DDC_CONTROL),5);
    write32(createAddress(`DDCSPACE,`DDC_CENTER_FREQ), carrierFreq);
    write32(createAddress(`DDCSPACE,`DDC_DECIMATION), adcDecimation-1);

    // Init the cicResampler register set
    write32(createAddress(`CICDECSPACE,`CIC_DECIMATION),cicDecimationInt-1);
    write32(createAddress(`CICDECSPACE,`CIC_SHIFT), 5);

    // Init the channel agc loop filter
    write32(createAddress(`CHAGCSPACE,`ALF_CONTROL),1);                 // Zero the error
    write32(createAddress(`CHAGCSPACE,`ALF_SETPOINT),32'h000000e8);     // AGC Setpoint
    write32(createAddress(`CHAGCSPACE,`ALF_GAINS),32'h00180018);        // AGC Loop Gain
    write32(createAddress(`CHAGCSPACE,`ALF_ULIMIT),32'h4fffffff);       // AGC Upper limit
    write32(createAddress(`CHAGCSPACE,`ALF_LLIMIT),32'h00000000);       // AGC Lower limit

    // Set the DAC interpolator gains
    write32(createAddress(`DEMODSPACE, `DEMOD_DACSELECT), {12'h0,`DAC_ISYM,
                                                           4'h0,`DAC_Q,
                                                           4'h0,`DAC_I});
    write32(createAddress(`INTERP0SPACE, `INTERP_CONTROL),0);
    write32(createAddress(`INTERP0SPACE, `INTERP_EXPONENT), 6);
    write32(createAddress(`INTERP0SPACE, `INTERP_MANTISSA), 32'h0001c71c);
    write32(createAddress(`INTERP1SPACE, `INTERP_CONTROL),0);
    write32(createAddress(`INTERP1SPACE, `INTERP_EXPONENT), 6);
    write32(createAddress(`INTERP1SPACE, `INTERP_MANTISSA), 32'h0001c71c);
    write32(createAddress(`INTERP2SPACE, `INTERP_CONTROL),1);
    write32(createAddress(`INTERP2SPACE, `INTERP_EXPONENT), 6);
    write32(createAddress(`INTERP2SPACE, `INTERP_MANTISSA), 32'h0001c71c);

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

    // Wait 0.5 bit periods
    #(1.0*bitrateSamplesInt*C) ;

    // Create a reset to restart the modulator
    modReset = 1;
    #(2*C) ;
    modReset = 0;

    // Wait 2.0 bit periods
    #(4.0*bitrateSamplesInt*C) ;

    // Create a reset to clear the halfband
    demod.ddc.hbReset = 1;
    #(2*C) ;
    demod.ddc.hbReset = 0;

    // Wait 2.0 bit periods
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

    // Enable the sample rate loop
    write32(createAddress(`BITSYNCSPACE,`LF_CONTROL),0);  

    // Wait 2 bit periods
    #(4*bitrateSamplesInt*C) ;

    // Enable the carrier loop, invert the error, and enable sweep
    write32(createAddress(`CARRIERSPACE,`CLF_CONTROL),2);  

    `ifdef ENABLE_AGC
    // Enable the AGC loop
    write32(createAddress(`CHAGCSPACE,`ALF_CONTROL),0);              
    `endif

    // Wait for some data to pass thru
    #(2*100*bitrateSamplesInt*C) ;
    `ifdef MATLAB_VECTORS
    $fclose(outfile);
    `endif
    $stop;

    txScaleFactor = 0.25;

    // Wait for some data to pass thru
    #(2*100*bitrateSamplesInt*C) ;
    $stop;

    end

real carrierOffsetReal = demod.carrierLoop.carrierOffsetReal * SAMPLE_FREQ/2.0;
real lagAccumReal = demod.carrierLoop.lagAccumReal * SAMPLE_FREQ/2.0;
endmodule

