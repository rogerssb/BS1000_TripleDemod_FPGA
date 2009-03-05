`timescale 1ns / 10 ps
`include "addressMap.v"

module resampler( 
    clk, reset, sync,
    wr0, wr1, wr2, wr3,
    addr,
    din,
    dout,
    resamplerFreqOffset,
    offsetEn,
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
input   offsetEn;
input   [17:0]iIn,qIn;
output  [17:0]iOut,qOut;
output syncOut;

// Microprocessor interface
reg resampSpace;
always @(addr) begin
    casex(addr)
        `RESAMPSPACE:   resampSpace <= 1;
        default:        resampSpace <= 0;
        endcase
    end
wire [31:0]resampleRate;
resampRegs resampRegs(
    .addr(addr),
    .dataIn(din),
    .dataOut(dout),
    .cs(resampSpace),
    .wr0(wr0), .wr1(wr1), .wr2(wr2), .wr3(wr3),
    .resampleRate(resampleRate)
     );


// Create the resampler rate
reg [31:0] resamplerPhaseInc;
always @(posedge clk) begin
    if (offsetEn) begin
        resamplerPhaseInc <= resampleRate + resamplerFreqOffset;
        end
    end



// Input data shift register
reg [17:0]iSR[0:8];
reg [17:0]qSR[0:8];
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
        iSR[8] <= iSR[7];
        iSR[7] <= iSR[6];
        iSR[6] <= iSR[5];
        iSR[5] <= iSR[4];
        iSR[4] <= iSR[3];
        iSR[3] <= iSR[2];
        iSR[2] <= iSR[1];
        iSR[1] <= iSR[0];
        iSR[0] <= iIn;
        qSR[8] <= qSR[7];
        qSR[7] <= qSR[6];
        qSR[6] <= qSR[5];
        qSR[5] <= qSR[4];
        qSR[4] <= qSR[3];
        qSR[3] <= qSR[2];
        qSR[2] <= qSR[1];
        qSR[1] <= qSR[0];
        qSR[0] <= qIn;
        end
    end

// Resampler Phase Accumulator
reg     [31:0]  phase;
wire    [32:0]  phaseSum = {1'b0,phase} + {1'b0,resamplerPhaseInc};
reg             resample;
reg     [9:0]   resampleDelay;
//real            additionalClocks = (31.0 - phase[31:27]) * 32.0 / resamplerPhaseInc[31:27];
//reg     [4:0]   oldOffset;
wire    [17:0]  reciprocal;
reciprocalLut lut(.a(resamplerPhaseInc[31:27]),.spo(reciprocal));
wire    [35:0]  lutProduct;
wire    [17:0]  additionalPhase = {8'h0,~phase[31:27],5'h00};
mpy18x18 offsetMpy (
    .sclr(1'b0),
    .clk(clk),
    .a(additionalPhase),
    .b(reciprocal),
    .p(lutProduct)
    );
reg     [4:0]   newOffset;
wire    [5:0]   roundedLutProduct = lutProduct[22:17] + {5'h0,lutProduct[16]};
always @(posedge clk) begin
    if (reset) begin
        phase <= 0;
        resample <= 0;
        end
    else if (sync) begin
        phase <= phaseSum[31:0];
        if (phaseSum[32]) begin
            resample <= 1;
            //oldOffset <= additionalClocks;
            end
        else begin
            resample <= 0;
            end
        end
    else begin
        resample <= 0;
        end
    resampleDelay <= {resampleDelay[8:0],resample};
    if (resampleDelay[1]) begin
        //newOffset <= lutProduct[21:17] + {4'h0,lutProduct[16]};
        if (roundedLutProduct[5]) begin
            newOffset <= 5'h1f;
            end
        else begin
            newOffset <= roundedLutProduct[4:0];
            end
        end
    end

`define USE_NEWOFFSET
`ifdef USE_NEWOFFSET
wire    [4:0]offset = newOffset;
`else
wire    [4:0]offset = oldOffset;
`endif

`ifdef SIMULATE
integer offsetInt = offset;
real inIReal = ((iSR[0] > 131071.0) ? (iSR[0] - 262144.0) : iSR[0])/131072.0;
real inQReal = ((qSR[0] > 131071.0) ? (qSR[0] - 262144.0) : qSR[0])/131072.0;
`endif

/******************************************************************************
                                FIR Filter
******************************************************************************/
wire    [17:0]  tap0Coef;
resamplerTap0 tap0(.a(offset),.spo(tap0Coef));
wire    [35:0]  i0Product;
mpy18x18 mpyI0 (
    .sclr(1'b0),
    .clk(clk),
    .a(iSR[0]),
    .b(tap0Coef),
    .p(i0Product)
    );
wire    [35:0]  q0Product;
mpy18x18 mpyQ0 (
    .sclr(1'b0),
    .clk(clk),
    .a(qSR[0]),
    .b(tap0Coef),
    .p(q0Product)
    );

wire    [17:0]  tap1Coef;
resamplerTap1 tap1(.a(offset),.spo(tap1Coef));
wire    [35:0]  i1Product;
mpy18x18 mpyI1 (
    .sclr(1'b0),
    .clk(clk),
    .a(iSR[1]),
    .b(tap1Coef),
    .p(i1Product)
    );
wire    [35:0]  q1Product;
mpy18x18 mpyQ1 (
    .sclr(1'b0),
    .clk(clk),
    .a(qSR[1]),
    .b(tap1Coef),
    .p(q1Product)
    );

wire    [17:0]  tap2Coef;
resamplerTap2 tap2(.a(offset),.spo(tap2Coef));
wire    [35:0]  i2Product;
mpy18x18 mpyI2 (
    .sclr(1'b0),
    .clk(clk),
    .a(iSR[2]),
    .b(tap2Coef),
    .p(i2Product)
    );
wire    [35:0]  q2Product;
mpy18x18 mpyQ2 (
    .sclr(1'b0),
    .clk(clk),
    .a(qSR[2]),
    .b(tap2Coef),
    .p(q2Product)
    );

wire    [17:0]  tap3Coef;
resamplerTap3 tap3(.a(offset),.spo(tap3Coef));
wire    [35:0]  i3Product;
mpy18x18 mpyI3 (
    .sclr(1'b0),
    .clk(clk),
    .a(iSR[3]),
    .b(tap3Coef),
    .p(i3Product)
    );
wire    [35:0]  q3Product;
mpy18x18 mpyQ3 (
    .sclr(1'b0),
    .clk(clk),
    .a(qSR[3]),
    .b(tap3Coef),
    .p(q3Product)
    );

wire    [17:0]  tap4Coef;
resamplerTap4 tap4(.a(offset),.spo(tap4Coef));
wire    [35:0]  i4Product;
mpy18x18 mpyI4 (
    .sclr(1'b0),
    .clk(clk),
    .a(iSR[4]),
    .b(tap4Coef),
    .p(i4Product)
    );
wire    [35:0]  q4Product;
mpy18x18 mpyQ4 (
    .sclr(1'b0),
    .clk(clk),
    .a(qSR[4]),
    .b(tap4Coef),
    .p(q4Product)
    );

wire    [17:0]  tap5Coef;
resamplerTap5 tap5(.a(offset),.spo(tap5Coef));
wire    [35:0]  i5Product;
mpy18x18 mpyI5 (
    .sclr(1'b0),
    .clk(clk),
    .a(iSR[5]),
    .b(tap5Coef),
    .p(i5Product)
    );
wire    [35:0]  q5Product;
mpy18x18 mpyQ5 (
    .sclr(1'b0),
    .clk(clk),
    .a(qSR[5]),
    .b(tap5Coef),
    .p(q5Product)
    );

wire    [17:0]  tap6Coef;
resamplerTap6 tap6(.a(offset),.spo(tap6Coef));
wire    [35:0]  i6Product;
mpy18x18 mpyI6 (
    .sclr(1'b0),
    .clk(clk),
    .a(iSR[6]),
    .b(tap6Coef),
    .p(i6Product)
    );
wire    [35:0]  q6Product;
mpy18x18 mpyQ6 (
    .sclr(1'b0),
    .clk(clk),
    .a(qSR[6]),
    .b(tap6Coef),
    .p(q6Product)
    );

wire    [17:0]  tap7Coef;
resamplerTap7 tap7(.a(offset),.spo(tap7Coef));
wire    [35:0]  i7Product;
mpy18x18 mpyI7 (
    .sclr(1'b0),
    .clk(clk),
    .a(iSR[7]),
    .b(tap7Coef),
    .p(i7Product)
    );
wire    [35:0]  q7Product;
mpy18x18 mpyQ7 (
    .sclr(1'b0),
    .clk(clk),
    .a(qSR[7]),
    .b(tap7Coef),
    .p(q7Product)
    );

wire    [17:0]  tap8Coef;
resamplerTap8 tap8(.a(offset),.spo(tap8Coef));
wire    [35:0]  i8Product;
mpy18x18 mpyI8 (
    .sclr(1'b0),
    .clk(clk),
    .a(iSR[8]),
    .b(tap8Coef),
    .p(i8Product)
    );
wire    [35:0]  q8Product;
mpy18x18 mpyQ8 (
    .sclr(1'b0),
    .clk(clk),
    .a(qSR[8]),
    .b(tap8Coef),
    .p(q8Product)
    );

reg     [35:0]  i01,i23,i45,i67,i0123,i4567;
reg     [35:0]  i8Delay1,i8Delay2,iSum;
reg     [35:0]  q01,q23,q45,q67,q0123,q4567;
reg     [35:0]  q8Delay1,q8Delay2,qSum;
reg     [17:0]  iOut,qOut;
always @(posedge clk) begin
    // First pipeline sums
    i01 <= i0Product + i1Product;
    i23 <= i2Product + i3Product;
    i45 <= i4Product + i5Product;
    i67 <= i6Product + i7Product;
    i8Delay1 <= i8Product;
    q01 <= q0Product + q1Product;
    q23 <= q2Product + q3Product;
    q45 <= q4Product + q5Product;
    q67 <= q6Product + q7Product;
    q8Delay1 <= q8Product;

    // Second pipeline sums
    i0123 <= i01 + i23;
    i4567 <= i45 + i67;
    i8Delay2 <= i8Delay1;
    q0123 <= q01 + q23;
    q4567 <= q45 + q67;
    q8Delay2 <= q8Delay1;

    // Final sum
    iSum <= i0123 + i4567 + i8Delay2;
    qSum <= q0123 + q4567 + q8Delay2;
    `ifdef USE_NEWOFFSET
    if (resampleDelay[8]) begin
    `else
    if (resampleDelay[5]) begin
    `endif
        // Check for overflow
        if (iSum[35] && !iSum[34]) begin
            iOut <= 18'h20001;
            end
        else if (!iSum[35] && iSum[34]) begin
            iOut <= 18'h1ffff;
            end
        else begin
            iOut <= iSum[34:17];
            end
        if (qSum[35] && !qSum[34]) begin
            qOut <= 18'h20001;
            end
        else if (!qSum[35] && qSum[34]) begin
            qOut <= 18'h1ffff;
            end
        else begin
            qOut <= qSum[34:17];
            end
        end
    end

`ifdef USE_NEWOFFSET
assign syncOut = resampleDelay[9];
`else
assign syncOut = resampleDelay[6];
`endif

`ifdef SIMULATE
real iOutReal = ((iOut > 131071.0) ? (iOut - 262144.0) : iOut)/131072.0;
real iSumReal = (iSum[35] ? (iSum[35:18] - 262144.0) : iSum[35:18])/131072.0;
real qOutReal = ((qOut > 131071.0) ? (qOut - 262144.0) : qOut)/131072.0;
`endif

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
parameter syncDecimation = 10;
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
resampler resampler( 
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
    resamplerFreqHz = 500000.0;
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
