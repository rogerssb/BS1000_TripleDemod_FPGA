`timescale 1ns / 10 ps
`include "addressMap.v"

module fractionalDelay( 
    clk, reset, sync,
    sampleOffset,
    in,
    out
    );

input clk;
input reset;
input sync;
input           [4:0]   sampleOffset;
input   signed  [17:0]  in;
output  signed  [17:0]  out;


// Input data shift register
reg signed      [17:0]  inSR[0:8];
`ifdef SIMULATE
integer i;
`endif
always @(posedge clk) begin
    if (sync) begin
        //`ifdef SIMULATE
        //for (i = 7; i >= 0; i = i-1) begin
        //    iSR[i+1] <= iSR[i];
        //    qSR[i+1] <= qSR[i];
        //    end
        //`endif
        inSR[8] <= inSR[7];
        inSR[7] <= inSR[6];
        inSR[6] <= inSR[5];
        inSR[5] <= inSR[4];
        inSR[4] <= inSR[3];
        inSR[3] <= inSR[2];
        inSR[2] <= inSR[1];
        inSR[1] <= inSR[0];
        inSR[0] <= in;
        end
    end

/******************************************************************************
                                  FIR Filter
******************************************************************************/
wire    signed  [17:0]  tap0Coef;
resamplerTap0 tap0(.a(sampleOffset),.spo(tap0Coef));
wire    signed  [35:0]  i0Product;
mpy18x18WithCe mpy0 (
    .clk(clk),
    .ce(sync),
    .a(inSR[0]),
    .b(tap0Coef),
    .p(i0Product)
    );

wire    signed  [17:0]  tap1Coef;
resamplerTap1 tap1(.a(sampleOffset),.spo(tap1Coef));
wire    signed  [35:0]  i1Product;
mpy18x18WithCe mpy1 (
    .clk(clk),
    .ce(sync),
    .a(inSR[1]),
    .b(tap1Coef),
    .p(i1Product)
    );

wire    signed  [17:0]  tap2Coef;
resamplerTap2 tap2(.a(sampleOffset),.spo(tap2Coef));
wire    signed  [35:0]  i2Product;
mpy18x18WithCe mpy2 (
    .clk(clk),
    .ce(sync),
    .a(inSR[2]),
    .b(tap2Coef),
    .p(i2Product)
    );

wire    signed  [17:0]  tap3Coef;
resamplerTap3 tap3(.a(sampleOffset),.spo(tap3Coef));
wire    signed  [35:0]  i3Product;
mpy18x18WithCe mpy3 (
    .clk(clk),
    .ce(sync),
    .a(inSR[3]),
    .b(tap3Coef),
    .p(i3Product)
    );

wire    signed  [17:0]  tap4Coef;
resamplerTap4 tap4(.a(sampleOffset),.spo(tap4Coef));
wire    signed  [35:0]  i4Product;
mpy18x18WithCe mpy4 (
    .clk(clk),
    .ce(sync),
    .a(inSR[4]),
    .b(tap4Coef),
    .p(i4Product)
    );

wire    signed  [17:0]  tap5Coef;
resamplerTap5 tap5(.a(sampleOffset),.spo(tap5Coef));
wire    signed  [35:0]  i5Product;
mpy18x18WithCe mpy5 (
    .clk(clk),
    .ce(sync),
    .a(inSR[5]),
    .b(tap5Coef),
    .p(i5Product)
    );

wire    signed  [17:0]  tap6Coef;
resamplerTap6 tap6(.a(sampleOffset),.spo(tap6Coef));
wire    signed  [35:0]  i6Product;
mpy18x18WithCe mpy6 (
    .clk(clk),
    .ce(sync),
    .a(inSR[6]),
    .b(tap6Coef),
    .p(i6Product)
    );

wire    signed  [17:0]  tap7Coef;
resamplerTap7 tap7(.a(sampleOffset),.spo(tap7Coef));
wire    signed  [35:0]  i7Product;
mpy18x18WithCe mpy7 (
    .clk(clk),
    .ce(sync),
    .a(inSR[7]),
    .b(tap7Coef),
    .p(i7Product)
    );

wire    signed  [17:0]  tap8Coef;
resamplerTap8 tap8(.a(sampleOffset),.spo(tap8Coef));
wire    signed  [35:0]  i8Product;
mpy18x18WithCe mpy8 (
    .clk(clk),
    .ce(sync),
    .a(inSR[8]),
    .b(tap8Coef),
    .p(i8Product)
    );

reg     signed  [35:0]  i01,i23,i45,i67,i0123,i4567;
reg     signed  [35:0]  i8Delay1,i8Delay2,sum;
reg     signed  [17:0]  out;
always @(posedge clk) begin
    if (sync) begin
        // First pipeline sums
        i01 <= i0Product + i1Product;
        i23 <= i2Product + i3Product;
        i45 <= i4Product + i5Product;
        i67 <= i6Product + i7Product;
        i8Delay1 <= i8Product;

        // Second pipeline sums
        i0123 <= i01 + i23;
        i4567 <= i45 + i67;
        i8Delay2 <= i8Delay1;

        // Final sum
        sum <= i0123 + i4567 + i8Delay2;

        // Check for overflow
        if (sum[35] && !sum[34]) begin
            out <= 18'h20001;
            end
        else if (!sum[35] && sum[34]) begin
            out <= 18'h1ffff;
            end
        else begin
            out <= sum[34:17];
            end
        end
    end


`ifdef SIMULATE
real outReal;
real sumReal;
always @(out) outReal = ((out > 131071.0) ? (out - 262144.0) : out)/131072.0;
always @(sum) sumReal = (sum[35] ? (sum[35:18] - 262144.0) : sum[35:18])/131072.0;
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
parameter SAMPLE_FREQ = 93.333333e6;
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
reg     [4:0]sampleOffset;
fractionalDelay delay( 
    .clk(clk), .reset(reset), .sync(sync),
    .sampleOffset(sampleOffset),
    .in(iIn),
    .out()
    );

`ifdef SINEWAVE_TEST

//Create a sinewave input
real carrierFreqHz;
real carrierFreqNorm = carrierFreqHz * `SAMPLE_PERIOD * `TWO_POW_32;
integer carrierFreqInt = carrierFreqNorm;
wire [31:0] freq = carrierFreqInt;

wire [17:0]sineOut,cosineOut;
reg ddsreset;
dds dds(.ce (1'b1), .sclr(ddsreset), .clk(clk), .we(1'b1), .data(freq), .sine(sineOut), .cosine(cosineOut));

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
    sampleOffset = 15;
    carrierFreqHz = SAMPLE_FREQ/4/syncDecimation;

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

    sampleOffset = 0;
    #(1024*C) ;
    sampleOffset = 1;
    #(1024*C) ;
    sampleOffset = 2;
    #(1024*C) ;
    sampleOffset = 3;
    #(1024*C) ;
    sampleOffset = 4;
    #(1024*C) ;
    sampleOffset = 5;
    #(1024*C) ;
    sampleOffset = 6;
    #(1024*C) ;
    sampleOffset = 7;
    #(1024*C) ;
    sampleOffset = 8;
    #(1024*C) ;
    sampleOffset = 9;
    #(1024*C) ;
    sampleOffset = 10;
    #(1024*C) ;
    sampleOffset = 11;
    #(1024*C) ;
    sampleOffset = 12;
    #(1024*C) ;
    sampleOffset = 13;
    #(1024*C) ;
    sampleOffset = 14;
    #(1024*C) ;
    sampleOffset = 15;
    #(1024*C) ;
    sampleOffset = 16;
    #(1024*C) ;
    sampleOffset = 17;
    #(1024*C) ;
    sampleOffset = 18;
    #(1024*C) ;
    sampleOffset = 19;
    #(1024*C) ;
    sampleOffset = 20;
    #(1024*C) ;
    sampleOffset = 21;
    #(1024*C) ;
    sampleOffset = 22;
    #(1024*C) ;
    sampleOffset = 23;
    #(1024*C) ;
    sampleOffset = 24;
    #(1024*C) ;
    sampleOffset = 25;
    #(1024*C) ;
    sampleOffset = 26;
    #(1024*C) ;
    sampleOffset = 27;
    #(1024*C) ;
    sampleOffset = 28;
    #(1024*C) ;
    sampleOffset = 29;
    #(1024*C) ;
    sampleOffset = 30;
    #(1024*C) ;
    sampleOffset = 31;
    #(1024*C) ;

    $stop;

    end
`endif




endmodule

`endif

