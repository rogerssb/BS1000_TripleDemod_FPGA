`timescale 1ns / 10 ps
`include "addressMap.v"

module dualResampler( 
    clk, reset, sync,
    wr0, wr1, wr2, wr3,
    addr,
    din,
    dout,
    resamplerFreqOffset,
    auresamplerFreqOffset,
    offsetEn,
    auOffsetEn,
    iIn,
    qIn,
    iOut,
    qOut,
    syncOut,
    auSyncOut,
    );

input           clk;
input           reset;
input           sync;
input           wr0,wr1,wr2,wr3;
input   [11:0]  addr;
input   [31:0]  din;
output  [31:0]  dout;
input   [31:0]  resamplerFreqOffset;
input   [31:0]  auResamplerFreqOffset;
input           offsetEn;
input           auOffsetEn;
input   [17:0]  iIn,qIn;
output  [17:0]  iOut,qOut;
output          syncOut;
output          auSyncOut;

// Microprocessor interface
reg resampSpace;
always @(addr) begin
    casex(addr)
        `RESAMPSPACE:   resampSpace <= 1;
        default:        resampSpace <= 0;
        endcase
    end
wire    [31:0]  resampleRate;
// au - Asymmetric Unbalanced QPSK support
wire    [31:0]  auResampleRate;
wire    [5:0]   auShift;
wire    [14:0]  auDecimation;
resampRegs resampRegs(
    .addr(addr),
    .dataIn(din),
    .dataOut(dout),
    .cs(resampSpace),
    .wr0(wr0), .wr1(wr1), .wr2(wr2), .wr3(wr3),
    .resampleRate(resampleRate),
    .auResampleRate(auResampleRate),
    .auShiftGain(auShift),
    .auDecimation(auDecimation)
     );


resampler resamplerI( 
    .clk(clk), .reset(reset), .sync(sync),
    .resampleRate(resampleRate),
    .resamplerFreqOffset(resamplerFreqOffset),
    .offsetEn(offsetEn),
    .in(iIn),
    .out(iOut),
    .syncOut(syncOut)
    );

wire    [47:0]  cicOut;
cicDecimator auCic( 
    .clk(clk), .reset(reset), .sync(sync),
    .gainShift(auShift),
    .decimation(auDecimation),
    .in(qIn),
    .out(cicOut),
    .syncOut(auSyncOut)
    );

wire    [31:0]  rqResampleRate =    auEnable ? auResampleRate : resampleRate;
wire    [31:0]  rqFreqOffset =      auEnable ? auResamplerFreqOffset : resampleRate;
wire            rqOffsetEn =        auEnable ? auOffsetEn : offsetEn;
wire    [17:0]  rqIn =              auEnable ? cicOut[47:30] : qIn;
wire            rqSync =            auEnable ? auSyncOut : sync;
resampler resamplerQ( 
    .clk(clk), .reset(reset), .sync(rqSync),
    .resampleRate(rqResampleRate),
    .resamplerFreqOffset(rqFreqOffset),
    .offsetEn(rqOffsetEn),
    .in(rqIn),
    .out(qOut),
    .syncOut(auSyncOut)
    );


endmodule

//`define TEST_MODULE
`ifdef TEST_MODULE

//`define RAMP_TEST
`define SINEWAVE_TEST
//`define IMPULSE_TEST
//`define MATLAB_VECTORS

`timescale 1ns/100ps

module test;

reg reset,clk;

// Create the clocks
parameter SAMPLE_FREQ = 9.333333e6;
parameter HC = 1e9/SAMPLE_FREQ/2;
parameter C = 2*HC;
parameter syncDecimation = 2;
reg clken;
always #HC clk = clk^clken;

reg sync;
reg [3:0]syncCount;
always @(posedge clk) begin
    if (syncCount == 0) begin
        syncCount <= syncDecimation-1;
        sync <= 1;
        end
    else begin
        syncCount <= syncCount - 1;
        sync <= 0;
        end
    //sync <= ~sync;
    //sync <= 1;
    end

`define SAMPLE_PERIOD   (C*1e-9)
`define TWO_POW_31      2147483648
`define TWO_POW_32      4294967296
`define TWO_POW_17      131072

// Instantiate the halfband filter
reg     [17:0]iIn,qIn;
wire    [17:0]iOut,qOut;
wire    [31:0]resamplerFreq;
dualResampler resampler( 
    .clk(clk), .reset(reset), .sync(sync),
    .resamplerFreqOffset(resamplerFreq),
    .offsetEn(1'b1),
    .iIn(iIn),
    .qIn(qIn),
    .iOut(),
    .qOut(),
    .syncOut()
    );

`ifdef RAMP_TEST

//Create a triangle wave input
real resamplerFreqHz;
real resamplerFreqNorm = resamplerFreqHz * `SAMPLE_PERIOD * `TWO_POW_32 * syncDecimation;
integer resamplerFreqInt = (resamplerFreqNorm >= `TWO_POW_31) ? (resamplerFreqNorm - `TWO_POW_32) : resamplerFreqNorm;
assign resamplerFreq = resamplerFreqInt;

real rampFreqHz;
real rampFreqNorm = rampFreqHz * `SAMPLE_PERIOD * `TWO_POW_32;
integer rampFreqInt = rampFreqNorm;
wire [31:0] rampInc = rampFreqInt;

reg [31:0]rampCounter;
always @(posedge clk) begin
    if (reset) begin
        rampCounter <= 0;
        end
    else if (sync) begin
        rampCounter <= rampCounter + rampInc;
        end
    iIn <= (rampCounter[31] ^ rampCounter[30]) ? {rampCounter[31],~rampCounter[29:13]} : {rampCounter[31],rampCounter[29:13]};
    qIn <= 0;
    end

`ifdef SIMULATE
real iInReal = ((iIn > 131071.0) ? (iIn - 262144.0) : iIn)/131072.0;
`endif

`ifdef MATLAB_VECTORS
/******************************************************************************
                          Vector data for Matlab Analysis
******************************************************************************/
integer outfile;
integer vectorCount;
reg saveVectors;
initial saveVectors = 0;
initial begin
    outfile = $fopen("vectors.dat");
    vectorCount = 0;
    end
always @(negedge clk) begin
    if (resampler.resample && saveVectors) begin
        $fwrite(outfile,"%f\n",resampler.iOutReal);
    //if (saveVectors) begin
    //    $fwrite(outfile,"%f\n",iInReal);
        vectorCount <= vectorCount + 1;
        if (vectorCount == 1023) begin
            $fclose(outfile);
            $stop;
            end
        end
    end
`endif

initial begin
    reset = 0;
    sync = 1;
    syncCount = 0;
    clk = 0;
    resampler.resampRegs.resampleRate = 32'h0;
    rampFreqHz = 1e6;
    resamplerFreqHz = 23.0/32.0*10e6;

    // Turn on the clock
    clken=1;
    #(10*C) ;

    reset = 1;
    #(2*C) ;
    reset = 0;

    #(1024*C) ;

    $stop;

    `ifdef MATLAB_VECTORS
    saveVectors = 1;
    `endif

    end
`endif

`ifdef SINEWAVE_TEST

//Create a sinewave input
real carrierFreqHz;
real carrierFreqNorm = carrierFreqHz * `SAMPLE_PERIOD * `TWO_POW_32;
integer carrierFreqInt = carrierFreqNorm;
wire [31:0] freq = carrierFreqInt;

real resamplerFreqHz;
real resamplerFreqNorm = resamplerFreqHz * `SAMPLE_PERIOD * `TWO_POW_32 * syncDecimation;
integer resamplerFreqInt = (resamplerFreqNorm >= `TWO_POW_31) ? (resamplerFreqNorm - `TWO_POW_32) : resamplerFreqNorm;
assign resamplerFreq = resamplerFreqInt;

wire [17:0]sineOut,cosineOut;
reg ddsreset;
dds dds(.sclr(ddsreset), .clk(clk), .we(1'b1), .data(freq), .sine(sineOut), .cosine(cosineOut));

always @(posedge clk) begin
    //iIn <= {cosineOut[17],cosineOut[17:1]};
    //qIn <= {sineOut[17],sineOut[17:1]};
    iIn <= {cosineOut};
    qIn <= {sineOut};
    end

`ifdef SIMULATE
real iInReal = ((iIn > 131071.0) ? (iIn - 262144.0) : iIn)/131072.0;
`endif

`ifdef MATLAB_VECTORS
/******************************************************************************
                          Vector data for Matlab Analysis
******************************************************************************/
integer outfile;
integer vectorCount;
reg saveVectors;
initial saveVectors = 0;
initial begin
    outfile = $fopen("vectors.dat");
    vectorCount = 0;
    end
always @(negedge clk) begin
    if (resampler.syncOut && saveVectors) begin
        $fwrite(outfile,"%f\n",resampler.iOutReal);
    //if (saveVectors) begin
    //    $fwrite(outfile,"%f\n",iInReal);
        vectorCount <= vectorCount + 1;
        if (vectorCount == 1023) begin
            $fclose(outfile);
            $stop;
            end
        end
    end
`endif

initial begin
    reset = 0;
    ddsreset = 0;
    sync = 1;
    syncCount = 0;
    clk = 0;
    resampler.resampRegs.resampleRate = 32'h0;
    //resamplerFreqHz = 23.0/32.0/syncDecimation*10e6;
    resamplerFreqHz = 2400000.0;
    carrierFreqHz = resamplerFreqHz/4.0 + resamplerFreqHz/512.0;

    // Turn on the clock
    clken=1;
    #(10*C) ;

    ddsreset = 1;
    #(2*C) ;
    ddsreset = 0;
    #(2*C) ;

    reset = 1;
    #(2*C) ;
    reset = 0;

    #(4096*C) ;

    $stop;

    `ifdef MATLAB_VECTORS
    saveVectors = 1;
    `endif

    end
`endif



`ifdef IMPULSE_TEST

reg saveVectors;
initial saveVectors = 0;
reg [31:0]resamplerPhaseInc;
assign resamplerFreq = resamplerPhaseInc;

initial begin
    reset = 0;
    sync = 1;
    syncCount = 0;
    clk = 0;
    resampler.resampRegs.resampleRate = 32'h0;
    resamplerPhaseInc = 0;
    iIn = 18'h0;
    qIn = 18'h0;

    // Turn on the clock
    clken=1;
    #(10*C) ;

    reset = 1;
    #(2*C) ;
    reset = 0;

    // Clock in 9 zeros
    #(9*C) ;

    // Set resampleFreq to clock in a value that will allow 9 consecutive clocks to 
    // generate all the offset zero outputs.
    resamplerPhaseInc = 32'hf8000009;
    #(1*C) ;

    // Set resampleFreq to rollover on every clock but leave the offset alone.
    resamplerPhaseInc = 32'hffffffff;
    // Clock in an impulse
    iIn = 18'h1ffff;
    qIn = 18'h1ffff;
    #(1*C) ;
    // Clock 7 times to produce each of the 9 outputs for an offset of zero.
    iIn = 18'h0;
    qIn = 18'h0;
    #(7*C) ;

    // Set resamplerPhaseInc to get to next offset
    resamplerPhaseInc = 32'hf8000008;
    #(1*C) ;

    // Set resampleFreq to rollover on every clock but leave the offset alone.
    resamplerPhaseInc = 32'hffffffff;
    // Clock in an impulse
    iIn = 18'h1ffff;
    qIn = 18'h1ffff;
    #(1*C) ;
    // Clock 7 times to produce each of the 9 outputs for an offset of zero.
    iIn = 18'h0;
    qIn = 18'h0;
    #(7*C) ;

    // Set resamplerPhaseInc to get to next offset
    resamplerPhaseInc = 32'hf8000008;
    #(1*C) ;

    // Set resampleFreq to rollover on every clock but leave the offset alone.
    resamplerPhaseInc = 32'hffffffff;
    // Clock in an impulse
    iIn = 18'h1ffff;
    qIn = 18'h1ffff;
    #(1*C) ;
    // Clock 7 times to produce each of the 9 outputs for an offset of zero.
    iIn = 18'h0;
    qIn = 18'h0;
    #(7*C) ;

    // Set resamplerPhaseInc to get to next offset
    resamplerPhaseInc = 32'hf8000008;
    #(1*C) ;

    // Set resampleFreq to rollover on every clock but leave the offset alone.
    resamplerPhaseInc = 32'hffffffff;
    // Clock in an impulse
    iIn = 18'h1ffff;
    qIn = 18'h1ffff;
    #(1*C) ;
    // Clock 7 times.
    iIn = 18'h0;
    qIn = 18'h0;
    #(7*C) ;

    // Set resamplerPhaseInc to get to next offset
    resamplerPhaseInc = 32'hf8000008;
    #(1*C) ;

    // Set resampleFreq to rollover on every clock but leave the offset alone.
    resamplerPhaseInc = 32'hffffffff;
    // Clock in an impulse
    iIn = 18'h1ffff;
    qIn = 18'h1ffff;
    #(1*C) ;
    // Clock 7 times to produce each of the 9 outputs for an offset of zero.
    iIn = 18'h0;
    qIn = 18'h0;
    #(7*C) ;

    // Set resamplerPhaseInc to get to next offset
    resamplerPhaseInc = 32'hf8000008;
    #(1*C) ;

    // Set resampleFreq to rollover on every clock but leave the offset alone.
    resamplerPhaseInc = 32'hffffffff;
    // Clock in an impulse
    iIn = 18'h1ffff;
    qIn = 18'h1ffff;
    #(1*C) ;
    // Clock 7 times to produce each of the 9 outputs for an offset of zero.
    iIn = 18'h0;
    qIn = 18'h0;
    #(7*C) ;

    // Set resamplerPhaseInc to get to next offset
    resamplerPhaseInc = 32'hf8000008;
    #(1*C) ;

    // Set resampleFreq to rollover on every clock but leave the offset alone.
    resamplerPhaseInc = 32'hffffffff;
    // Clock in an impulse
    iIn = 18'h1ffff;
    qIn = 18'h1ffff;
    #(1*C) ;
    // Clock 7 times to produce each of the 9 outputs for an offset of zero.
    iIn = 18'h0;
    qIn = 18'h0;
    #(7*C) ;

    // Set resamplerPhaseInc to get to next offset
    resamplerPhaseInc = 32'hf8000008;
    #(1*C) ;

    // Set resampleFreq to rollover on every clock but leave the offset alone.
    resamplerPhaseInc = 32'hffffffff;
    // Clock in an impulse
    iIn = 18'h1ffff;
    qIn = 18'h1ffff;
    #(1*C) ;
    // Clock 7 times to produce each of the 9 outputs for an offset of zero.
    iIn = 18'h0;
    qIn = 18'h0;
    #(7*C) ;

    // Set resamplerPhaseInc to get to next offset
    resamplerPhaseInc = 32'hf8000008;
    #(1*C) ;

    // Set resampleFreq to rollover on every clock but leave the offset alone.
    resamplerPhaseInc = 32'hffffffff;
    // Clock in an impulse
    iIn = 18'h1ffff;
    qIn = 18'h1ffff;
    #(1*C) ;
    // Clock 7 times to produce each of the 9 outputs for an offset of zero.
    iIn = 18'h0;
    qIn = 18'h0;
    #(7*C) ;

    // Set resamplerPhaseInc to get to next offset
    resamplerPhaseInc = 32'hf8000008;
    #(1*C) ;

    // Set resampleFreq to rollover on every clock but leave the offset alone.
    resamplerPhaseInc = 32'hffffffff;
    // Clock in an impulse
    iIn = 18'h1ffff;
    qIn = 18'h1ffff;
    #(1*C) ;
    // Clock 7 times to produce each of the 9 outputs for an offset of zero.
    iIn = 18'h0;
    qIn = 18'h0;
    #(7*C) ;

    // Set resamplerPhaseInc to get to next offset
    resamplerPhaseInc = 32'hf8000008;
    #(1*C) ;

    // Set resampleFreq to rollover on every clock but leave the offset alone.
    resamplerPhaseInc = 32'hffffffff;
    // Clock in an impulse
    iIn = 18'h1ffff;
    qIn = 18'h1ffff;
    #(1*C) ;
    // Clock 7 times to produce each of the 9 outputs for an offset of zero.
    iIn = 18'h0;
    qIn = 18'h0;
    #(7*C) ;

    // Set resamplerPhaseInc to get to next offset
    resamplerPhaseInc = 32'hf8000008;
    #(1*C) ;

    // Set resampleFreq to rollover on every clock but leave the offset alone.
    resamplerPhaseInc = 32'hffffffff;
    // Clock in an impulse
    iIn = 18'h1ffff;
    qIn = 18'h1ffff;
    #(1*C) ;
    // Clock 7 times to produce each of the 9 outputs for an offset of zero.
    iIn = 18'h0;
    qIn = 18'h0;
    #(7*C) ;

    // Set resamplerPhaseInc to get to next offset
    resamplerPhaseInc = 32'hf8000008;
    #(1*C) ;

    // Set resampleFreq to rollover on every clock but leave the offset alone.
    resamplerPhaseInc = 32'hffffffff;
    // Clock in an impulse
    iIn = 18'h1ffff;
    qIn = 18'h1ffff;
    #(1*C) ;
    // Clock 7 times to produce each of the 9 outputs for an offset of zero.
    iIn = 18'h0;
    qIn = 18'h0;
    #(7*C) ;

    // Set resamplerPhaseInc to get to next offset
    resamplerPhaseInc = 32'hf8000008;
    #(1*C) ;

    // Set resampleFreq to rollover on every clock but leave the offset alone.
    resamplerPhaseInc = 32'hffffffff;
    // Clock in an impulse
    iIn = 18'h1ffff;
    qIn = 18'h1ffff;
    #(1*C) ;
    // Clock 7 times to produce each of the 9 outputs for an offset of zero.
    iIn = 18'h0;
    qIn = 18'h0;
    #(7*C) ;

    // Set resamplerPhaseInc to get to next offset
    resamplerPhaseInc = 32'hf8000008;
    #(1*C) ;

    // Set resampleFreq to rollover on every clock but leave the offset alone.
    resamplerPhaseInc = 32'hffffffff;
    // Clock in an impulse
    iIn = 18'h1ffff;
    qIn = 18'h1ffff;
    #(1*C) ;
    // Clock 7 times to produce each of the 9 outputs for an offset of zero.
    iIn = 18'h0;
    qIn = 18'h0;
    #(7*C) ;

    // Set resamplerPhaseInc to get to next offset
    resamplerPhaseInc = 32'hf8000008;
    #(1*C) ;

    // Set resampleFreq to rollover on every clock but leave the offset alone.
    resamplerPhaseInc = 32'hffffffff;
    // Clock in an impulse
    iIn = 18'h1ffff;
    qIn = 18'h1ffff;
    #(1*C) ;
    // Clock 7 times to produce each of the 9 outputs for an offset of zero.
    iIn = 18'h0;
    qIn = 18'h0;
    #(7*C) ;

    // Set resamplerPhaseInc to get to next offset
    resamplerPhaseInc = 32'hf8000008;
    #(1*C) ;

    // Set resampleFreq to rollover on every clock but leave the offset alone.
    resamplerPhaseInc = 32'hffffffff;
    // Clock in an impulse
    iIn = 18'h1ffff;
    qIn = 18'h1ffff;
    #(1*C) ;
    // Clock 7 times to produce each of the 9 outputs for an offset of zero.
    iIn = 18'h0;
    qIn = 18'h0;
    #(7*C) ;

    // Set resamplerPhaseInc to get to next offset
    resamplerPhaseInc = 32'hf8000008;
    #(1*C) ;

    // Set resampleFreq to rollover on every clock but leave the offset alone.
    resamplerPhaseInc = 32'hffffffff;
    // Clock in an impulse
    iIn = 18'h1ffff;
    qIn = 18'h1ffff;
    #(1*C) ;
    // Clock 7 times to produce each of the 9 outputs for an offset of zero.
    iIn = 18'h0;
    qIn = 18'h0;
    #(7*C) ;

    // Set resamplerPhaseInc to get to next offset
    resamplerPhaseInc = 32'hf8000008;
    #(1*C) ;

    // Set resampleFreq to rollover on every clock but leave the offset alone.
    resamplerPhaseInc = 32'hffffffff;
    // Clock in an impulse
    iIn = 18'h1ffff;
    qIn = 18'h1ffff;
    #(1*C) ;
    // Clock 7 times to produce each of the 9 outputs for an offset of zero.
    iIn = 18'h0;
    qIn = 18'h0;
    #(7*C) ;

    // Set resamplerPhaseInc to get to next offset
    resamplerPhaseInc = 32'hf8000008;
    #(1*C) ;

    // Set resampleFreq to rollover on every clock but leave the offset alone.
    resamplerPhaseInc = 32'hffffffff;
    // Clock in an impulse
    iIn = 18'h1ffff;
    qIn = 18'h1ffff;
    #(1*C) ;
    // Clock 7 times to produce each of the 9 outputs for an offset of zero.
    iIn = 18'h0;
    qIn = 18'h0;
    #(7*C) ;

    // Set resamplerPhaseInc to get to next offset
    resamplerPhaseInc = 32'hf8000008;
    #(1*C) ;

    // Set resampleFreq to rollover on every clock but leave the offset alone.
    resamplerPhaseInc = 32'hffffffff;
    // Clock in an impulse
    iIn = 18'h1ffff;
    qIn = 18'h1ffff;
    #(1*C) ;
    // Clock 7 times to produce each of the 9 outputs for an offset of zero.
    iIn = 18'h0;
    qIn = 18'h0;
    #(7*C) ;

    // Set resamplerPhaseInc to get to next offset
    resamplerPhaseInc = 32'hf8000008;
    #(1*C) ;

    // Set resampleFreq to rollover on every clock but leave the offset alone.
    resamplerPhaseInc = 32'hffffffff;
    // Clock in an impulse
    iIn = 18'h1ffff;
    qIn = 18'h1ffff;
    #(1*C) ;
    // Clock 7 times to produce each of the 9 outputs for an offset of zero.
    iIn = 18'h0;
    qIn = 18'h0;
    #(7*C) ;

    // Set resamplerPhaseInc to get to next offset
    resamplerPhaseInc = 32'hf8000008;
    #(1*C) ;

    // Set resampleFreq to rollover on every clock but leave the offset alone.
    resamplerPhaseInc = 32'hffffffff;
    // Clock in an impulse
    iIn = 18'h1ffff;
    qIn = 18'h1ffff;
    #(1*C) ;
    // Clock 7 times to produce each of the 9 outputs for an offset of zero.
    iIn = 18'h0;
    qIn = 18'h0;
    #(7*C) ;

    // Set resamplerPhaseInc to get to next offset
    resamplerPhaseInc = 32'hf8000008;
    #(1*C) ;

    // Set resampleFreq to rollover on every clock but leave the offset alone.
    resamplerPhaseInc = 32'hffffffff;
    // Clock in an impulse
    iIn = 18'h1ffff;
    qIn = 18'h1ffff;
    #(1*C) ;
    // Clock 7 times to produce each of the 9 outputs for an offset of zero.
    iIn = 18'h0;
    qIn = 18'h0;
    #(7*C) ;

    // Set resamplerPhaseInc to get to next offset
    resamplerPhaseInc = 32'hf8000008;
    #(1*C) ;

    // Set resampleFreq to rollover on every clock but leave the offset alone.
    resamplerPhaseInc = 32'hffffffff;
    // Clock in an impulse
    iIn = 18'h1ffff;
    qIn = 18'h1ffff;
    #(1*C) ;
    // Clock 7 times to produce each of the 9 outputs for an offset of zero.
    iIn = 18'h0;
    qIn = 18'h0;
    #(7*C) ;

    // Set resamplerPhaseInc to get to next offset
    resamplerPhaseInc = 32'hf8000008;
    #(1*C) ;

    // Set resampleFreq to rollover on every clock but leave the offset alone.
    resamplerPhaseInc = 32'hffffffff;
    // Clock in an impulse
    iIn = 18'h1ffff;
    qIn = 18'h1ffff;
    #(1*C) ;
    // Clock 7 times to produce each of the 9 outputs for an offset of zero.
    iIn = 18'h0;
    qIn = 18'h0;
    #(7*C) ;

    // Set resamplerPhaseInc to get to next offset
    resamplerPhaseInc = 32'hf8000008;
    #(1*C) ;

    // Set resampleFreq to rollover on every clock but leave the offset alone.
    resamplerPhaseInc = 32'hffffffff;
    // Clock in an impulse
    iIn = 18'h1ffff;
    qIn = 18'h1ffff;
    #(1*C) ;
    // Clock 7 times to produce each of the 9 outputs for an offset of zero.
    iIn = 18'h0;
    qIn = 18'h0;
    #(7*C) ;

    // Set resamplerPhaseInc to get to next offset
    resamplerPhaseInc = 32'hf8000008;
    #(1*C) ;

    // Set resampleFreq to rollover on every clock but leave the offset alone.
    resamplerPhaseInc = 32'hffffffff;
    // Clock in an impulse
    iIn = 18'h1ffff;
    qIn = 18'h1ffff;
    #(1*C) ;
    // Clock 7 times to produce each of the 9 outputs for an offset of zero.
    iIn = 18'h0;
    qIn = 18'h0;
    #(7*C) ;

    // Set resamplerPhaseInc to get to next offset
    resamplerPhaseInc = 32'hf8000008;
    #(1*C) ;

    // Set resampleFreq to rollover on every clock but leave the offset alone.
    resamplerPhaseInc = 32'hffffffff;
    // Clock in an impulse
    iIn = 18'h1ffff;
    qIn = 18'h1ffff;
    #(1*C) ;
    // Clock 7 times to produce each of the 9 outputs for an offset of zero.
    iIn = 18'h0;
    qIn = 18'h0;
    #(7*C) ;

    // Set resamplerPhaseInc to get to next offset
    resamplerPhaseInc = 32'hf8000008;
    #(1*C) ;

    // Set resampleFreq to rollover on every clock but leave the offset alone.
    resamplerPhaseInc = 32'hffffffff;
    // Clock in an impulse
    iIn = 18'h1ffff;
    qIn = 18'h1ffff;
    #(1*C) ;
    // Clock 7 times to produce each of the 9 outputs for an offset of zero.
    iIn = 18'h0;
    qIn = 18'h0;
    #(7*C) ;

    // Set resamplerPhaseInc to get to next offset
    resamplerPhaseInc = 32'hf8000008;
    #(1*C) ;

    // Set resampleFreq to rollover on every clock but leave the offset alone.
    resamplerPhaseInc = 32'hffffffff;
    // Clock in an impulse
    iIn = 18'h1ffff;
    qIn = 18'h1ffff;
    #(1*C) ;
    // Clock 7 times to produce each of the 9 outputs for an offset of zero.
    iIn = 18'h0;
    qIn = 18'h0;
    #(7*C) ;

    // Set resamplerPhaseInc to get to next offset
    resamplerPhaseInc = 32'hf8000018;
    #(1*C) ;

    // Set resampleFreq to rollover on every clock but leave the offset alone.
    resamplerPhaseInc = 32'hffffffff;
    // Clock in an impulse
    iIn = 18'h1ffff;
    qIn = 18'h1ffff;
    #(1*C) ;
    // Clock 7 times to produce each of the 9 outputs for an offset of zero.
    iIn = 18'h0;
    qIn = 18'h0;
    #(7*C) ;

    // Clock a few more times to get all the outputs
    #(9*C) ;

    saveVectors = 1;
    #(1*C) ;

    $stop;

    `ifdef MATLAB_VECTORS
    saveVectors = 1;
    `endif

    end

integer i,j;
initial i = 0;
initial j = 0;
real impulse[0:287];
wire defined = !(resampler.iOut === 18'hxxxxx);
integer index = (i+j);
always @(negedge clk) begin
    if (defined && (resampler.resample)) begin
        impulse[index] <= resampler.iOutReal;
        if (i == 256) begin
            i <= 0;
            j <= j + 1;
            end
        else begin
            i <= i + 32;
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
    outfile = $fopen("vectors.dat");
    vectorCount = 0;
    end
always @(negedge clk) begin
    if (saveVectors) begin
        for (vectorCount = 0; vectorCount < 288; vectorCount = vectorCount + 1) begin
            $fwrite(outfile,"%f\n",impulse[vectorCount]);
            end
        $fclose(outfile);
        end
    end
`endif

`endif


endmodule

`endif
