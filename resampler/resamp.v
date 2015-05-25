`timescale 1ns / 1 ps

module resampler( 
    clk, reset, sync,
    wr0, wr1, wr2, wr3,
    addr,
    din,
    dout,
    resamplerFreqOffset,
    iIn,
    qIn,
    iOut,
    qOut,
    syncOut
    );

input clk;
input reset;
input sync;
input   wr0,wr1,wr2,wr3;
input   [11:0]addr;
input   [31:0]din;
output  [31:0]dout;
input   [31:0]resamplerFreqOffset;
input   [17:0]iIn,qIn;
output  [17:0]iOut,qOut;
output syncOut;

// Create the resampler rate
reg [31:0] resamplerPhaseInc;
always @(posedge clk) begin
    resamplerPhaseInc <= resamplerFreqOffset;
    end



// Input data shift register
reg [17:0]iSR[0:287];
integer i;
always @(posedge clk) begin
    for (i = 286; i >= 0; i = i-1) begin
        iSR[i+1] <= iSR[i];
        end
    if (sync) begin
        iSR[0] <= iIn;
        end
    else begin
        iSR[0] <= 18'h0;
        end
    end

// Resampler Phase Accumulator
reg     [31:0]  phase,refPhase;
wire    [32:0]  phaseSum = {1'b0,phase} + {1'b0,resamplerPhaseInc};
reg             resample;
reg     [6:0]   resampleDelay;
reg     [4:0]   offset;
real            additionalPhase = 31.0 - phase[31:27];
real            additionalClocks = additionalPhase * 32.0 / resamplerPhaseInc[31:27];
wire    [4:0]   firDelay = additionalClocks > 31.5 ? 31.0 : additionalClocks;
//wire    [4:0]   firDelay = (5'h1f - (phaseSum[31:27]));
//wire    [4:0]   firDelay = (5'h1f - (phase[31:27]));
reg     [5:0]   resampleCount;
always @(posedge clk) begin
    if (reset) begin
        phase <= resamplerPhaseInc;
        resample <= 0;
        end
    else if (sync) begin
        phase <= phaseSum[31:0];
        // If the phase accumulator rolls over, we need to generate a resampler output.
        if (phaseSum[32]) begin
            resample <= (firDelay == 5'h0);
            resampleCount <= firDelay - 1;
            offset <= firDelay;
            end
        else begin
            resample <= 0;
            end
        end
    else begin
        if (!resample && !resampleCount[5]) begin
            resampleCount <= resampleCount - 1;
            end
        if (resampleCount == 5'h0) begin
            resample <= 1;
            end
        else begin
            resample <= 0;
            end
        end
    resampleDelay <= {resampleDelay[5:0],resample};
    end
always @(posedge clk) begin
    if (reset) begin
        refPhase <= 0;
        end
    else begin
        refPhase <= refPhase + {5'h0,resamplerPhaseInc[31:5]};
        end
    end

`ifdef SIMULATE
integer offsetInt = offset;
`endif

/******************************************************************************
                                FIR Filter
******************************************************************************/


reg     [17:0]taps[0:287];
initial $readmemh("resampler.hex",taps);

reg     [17:0]iOut;
integer k;
real data[0:287];
real coef[0:287];
real sum,sumTotal;
wire [35:0]sumWire;
always @(resample) begin
    if (resample) begin
        for (k = 0; k < 288; k = k + 1) begin
            data[k] = ((iSR[k] > 131071.0) ? iSR[k] - 262144.0 : iSR[k])/131072.0;
            coef[k] = ((taps[k] > 131071.0) ? taps[k] - 262144.0 : taps[k])/131072.0;
            sum = sum + data[k]*coef[k];
            end
        end
    else begin
        sum = 0.0;
        end
    end

integer sumInt = sumTotal * 131072.0;
always @(posedge clk) begin
    if (resample) begin
        sumTotal <= sum;
        end
    if (resampleDelay[0]) begin
        iOut <= sumInt;
        end
    end

assign syncOut = resampleDelay[1];

`ifdef SIMULATE
real iOutReal = ((iOut > 131071.0) ? (iOut - 262144.0) : iOut)/131072.0;
`endif

endmodule

`ifdef TEST_MODULE

`define SINEWAVE_TEST
//`define MATLAB_VECTORS
//`define DEBUG_VECTORS

`timescale 1ns/1ps

module test;

reg reset,clk;

// Create the clocks
parameter SAMPLE_FREQ = 32*9.333333e5;
parameter HC = 1e9/SAMPLE_FREQ/2;
parameter C = 2*HC;
parameter syncDecimation = 32;
reg clken;
always #HC clk = clk^clken;

reg sync;
reg [5:0]syncCount;
always @(posedge clk) begin
    if (reset) begin
        syncCount <= syncDecimation-1;
        end
    else if (syncCount == 0) begin
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
reg     [17:0]iIn;
wire    [17:0]iOut,qOut;
wire    [31:0]resamplerFreq;
resampler resampler( 
    .clk(clk), .reset(reset), .sync(sync),
    .resamplerFreqOffset(resamplerFreq),
    .iIn(iIn),
    .qIn(),
    .iOut(),
    .qOut(),
    .syncOut()
    );

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
    if (sync) begin
        iIn <= {cosineOut[17],cosineOut[17:1]};
        //iIn <= 18'h0ffff;
        //iIn <= 18'h30001;
        end
    end

`ifdef SIMULATE
real iInReal = ((iIn > 131071.0) ? (iIn - 262144.0) : iIn)/131072.0;
`endif

`ifdef DEBUG_VECTORS
/******************************************************************************
                          Vector data for Matlab Analysis
******************************************************************************/
integer outfile;
integer vectorCount;
initial begin
    outfile = $fopen("debug.dat");
    vectorCount = 0;
    end
always @(negedge clk) begin
    if (sync) begin
        $fwrite(outfile,"%08X\t %08X\t %02X\n",resampler.phase,resampler.phaseSum,resampler.firDelay);
        end
    if (resampler.resample) begin
        $fwrite(outfile,"%f\n",resampler.iOutReal);
        vectorCount <= vectorCount + 1;
        if (vectorCount == 1023) begin
            $fclose(outfile);
            $stop;
            end
        end
    end
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
    ddsreset = 0;
    sync = 1;
    syncCount = 0;
    clk = 0;
    //resamplerFreqHz = 23.0/32.0 * SAMPLE_FREQ/syncDecimation;
    resamplerFreqHz = 500000.0;
    carrierFreqHz = resamplerFreqHz/4.0;

    // Turn on the clock
    clken=1;
    #(10*C) ;

    ddsreset = 1;
    #(2*C) ;
    ddsreset = 0;
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




endmodule

`endif

