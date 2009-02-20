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

wire [31:0] sweepRate = 32'h00800000;

real bitrateBps = 250000.0;
real bitrateSamples = 1/bitrateBps/`SAMPLE_PERIOD/2.0;
integer bitrateSamplesInt = bitrateSamples;
wire [15:0]bitrateDivider = bitrateSamplesInt - 1;
real actualBitrateBps = SAMPLE_FREQ/bitrateSamplesInt/2.0;

// value = 2^ceiling(log2(R*R))/(R*R), where R = interpolation rate of the FM
// modulator
real interpolationGain = 1.28;

//real deviationHz = 0*0.35 * bitrateBps;
real deviationHz = 2*0.35 * bitrateBps;
real deviationNorm = deviationHz * `SAMPLE_PERIOD * `TWO_POW_32;
integer deviationInt = deviationNorm*interpolationGain;
wire [31:0]deviationQ31 = deviationInt;
wire [17:0]deviation = deviationQ31[31:14];

real cicDecimation = SAMPLE_FREQ/bitrateBps/2.0/2.0/2.0/2.0;
integer cicDecimationInt = cicDecimation;


real resamplerFreqSps = 2*actualBitrateBps;     // 2 samples per symbol
real resamplerFreqNorm = resamplerFreqSps/(SAMPLE_FREQ/cicDecimationInt/4.0) * `TWO_POW_32;
integer resamplerFreqInt = (resamplerFreqNorm >= `TWO_POW_31) ? (resamplerFreqNorm - `TWO_POW_32) : resamplerFreqNorm;
//integer resamplerFreqInt = resamplerFreqNorm;

real resamplerLimitNorm = 0.001*resamplerFreqSps/SAMPLE_FREQ * `TWO_POW_32;
integer resamplerLimitInt = resamplerLimitNorm;


/******************************************************************************
                            Instantiate the Ddc
******************************************************************************/
wire    [17:0]  dac0Out,dac1Out,dac2Out;
ddc ddc( 
    .clk(clk), .reset(reset), .syncIn(sync), 
    .wr0(we0), .wr1(we1), .wr2(we2), .wr3(we3),
    .addr(a),
    .din(d),
    .dout(dout),
    .ddcFreqOffset(32'h0),
    .offsetEn(1'b1),
    .nbAgcGain(21'h0),
    .iIn(18'h0ffff), .qIn(18'h0),
    .syncOut(dac0Sync),
    .iOut(dac0Out),
    .qOut(dac1Out)
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
    .clk(clk), .reset(interpReset), .clkEn(dac0Sync),
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
    ddc.hbReset = 1;
    ddc.cicReset = 1;
    interpReset = 0;
    reset = 0;
    sync = 1;
    clk = 0;
    rd = 0;
    we0 = 0; we1 = 0; we2 = 0; we3 = 0; 
    d = 32'hz;

    // Turn on the clock
    clken=1;
    #(10*C) ;

    // Init the downcoverter register set
    write32(createAddress(`DDCSPACE,`DDC_CONTROL),0);
    write32(createAddress(`DDCSPACE,`DDC_CENTER_FREQ), carrierFreq);

    // Init the cicResampler register set
    write32(createAddress(`CICDECSPACE,`CIC_DECIMATION),cicDecimationInt-1);
    write32(createAddress(`CICDECSPACE,`CIC_SHIFT), 3);

    reset = 1;
    #(2*C) ;
    reset = 0;
    ddc.hbReset = 0;
    ddc.cicReset = 0;

    // Wait 1 bit periods
    #(2*bitrateSamplesInt*C) ;

    // Create a reset to clear the halfband
    ddc.hbReset = 1;
    #(2*C) ;
    ddc.hbReset = 0;

    // Wait 2 bit periods
    #(4.0*bitrateSamplesInt*C) ;

    // Create a reset to clear the cic resampler
    ddc.cicReset = 1;
    #(2*C) ;
    ddc.cicReset = 0;

    // Wait 14 bit periods
    #(28*bitrateSamplesInt*C) ;

    // Create a reset to clear the interpolators
    interpReset = 1;
    #(2*C) ;
    interpReset = 0;


    // Check different carrier Frequencies
    carrierFreqHz <= 1e4;
    write32(createAddress(`DDCSPACE,`DDC_CENTER_FREQ), carrierFreq);
    #(50*bitrateSamplesInt*C) ;

    carrierFreqHz <= 1e5;
    write32(createAddress(`DDCSPACE,`DDC_CENTER_FREQ), carrierFreq);
    #(50*bitrateSamplesInt*C) ;

    carrierFreqHz <= 2e5;
    write32(createAddress(`DDCSPACE,`DDC_CENTER_FREQ), carrierFreq);
    #(50*bitrateSamplesInt*C) ;

    carrierFreqHz <= 4e5;
    write32(createAddress(`DDCSPACE,`DDC_CENTER_FREQ), carrierFreq);
    #(50*bitrateSamplesInt*C) ;

    carrierFreqHz <= 8e5;
    write32(createAddress(`DDCSPACE,`DDC_CENTER_FREQ), carrierFreq);
    #(50*bitrateSamplesInt*C) ;

    carrierFreqHz <= 16e5;
    write32(createAddress(`DDCSPACE,`DDC_CENTER_FREQ), carrierFreq);
    #(50*bitrateSamplesInt*C) ;

    carrierFreqHz <= 1.6e6;
    write32(createAddress(`DDCSPACE,`DDC_CENTER_FREQ), carrierFreq);
    #(50*bitrateSamplesInt*C) ;

    carrierFreqHz <= 4.6e6;
    write32(createAddress(`DDCSPACE,`DDC_CENTER_FREQ), carrierFreq);
    #(50*bitrateSamplesInt*C) ;

    $stop;

    // Wait for some data to pass thru
    #(2*100*bitrateSamplesInt*C) ;
    `ifdef MATLAB_VECTORS
    $fclose(outfile);
    `endif
    $stop;

    end

endmodule

