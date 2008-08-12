`timescale 1ns / 10 ps

module resampler( 
    clk, reset, sync,
    resamplerPhaseInc,
    iIn,
    qIn,
    iOut,
    qOut,
    syncOut
    );

input clk;
input reset;
input sync;
input   [31:0]resamplerPhaseInc;
input   [17:0]iIn,qIn;
output  [17:0]iOut,qOut;
output syncOut;

// Input data shift register
reg [17:0]iSR[0:31];
reg [17:0]qSR[0:31];
integer i;
always @(posedge clk) begin
    if (sync) begin
        iSR[0] <= iIn;
        qSR[0] <= qIn;
        for (i = 0; i <= 30; i = i+1) begin
            iSR[i+1] <= iSR[i];
            qSR[i+1] <= qSR[i];
            end
        end
    end

// Resampler Phase Accumulator
reg     [31:0]  phase;
wire    [31:0]  phaseSum = phase + resamplerPhaseInc;
reg             resample;
reg     [4:0]   offset;
always @(posedge clk) begin
    if (reset) begin
        phase <= 0;
        resample <= 0;
        end
    else begin
        phase <= phaseSum;
        if (phase[31] & !phaseSum[31]) begin
            resample <= 1;
            offset <= ~(phaseSum[30:26] + {4'h0,phaseSum[25]});
            end
        else begin
            resample <= 0;
            end
        end
    end

`ifdef SIMULATE
integer offsetInt = offset;
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
always @(posedge clk) begin
    if (resample) begin
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
        end
    end

assign iOut = iSum[34:17];
assign qOut = qSum[34:17];

`ifdef SIMULATE
real iOutReal = ((iOut > 131071.0) ? (iOut - 262144.0) : iOut)/131072.0;
`endif

endmodule

`define TEST_MODULE
`ifdef TEST_MODULE

`define SINEWAVE_TEST
//`define IMPULSE_TEST

`timescale 1ns/100ps

module test;

reg reset,clk;

// Create the clocks
parameter HC = 5;
parameter C = 2*HC;
reg clken;
always #HC clk = clk^clken;

reg sync;
reg [3:0]syncCount;
always @(posedge clk) begin
    if (syncCount == 0) begin
        syncCount <= 4;
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
    .resamplerPhaseInc(resamplerFreq),
    .iIn(iIn),
    .qIn(qIn),
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
real resamplerFreqNorm = resamplerFreqHz * `SAMPLE_PERIOD * `TWO_POW_32;
integer resamplerFreqInt = resamplerFreqNorm;
assign resamplerFreq = resamplerFreqInt;

wire [17:0]sineOut,cosineOut;
dds dds(.sclr(reset), .clk(clk), .we(1'b1), .data(freq), .sine(sineOut), .cosine(cosineOut));

always @(posedge clk) begin
    iIn <= cosineOut;
    qIn <= sineOut;
    end

`ifdef SIMULATE
real iInReal = ((iIn > 131071.0) ? (iIn - 262144.0) : iIn)/131072.0;
`endif

initial begin
    reset = 0;
    sync = 1;
    syncCount = 0;
    clk = 0;
    carrierFreqHz = 1e6;
    resamplerFreqHz = 13e6;

    // Turn on the clock
    clken=1;
    #(10*C) ;

    reset = 1;
    #(2*C) ;
    reset = 0;

    #(1024*C) ;

    $stop;

    end
`endif

`ifdef IMPULSE_TEST
// Create an impulse to drive the filter with
reg [6:0]bitCount;
always @(posedge clk) begin
    if (sync) begin
        bitCount <= bitCount + 1;
        if (bitCount == 0) begin
            hbIn <= 18'h10000;
            end
        else if (bitCount == 1) begin
            hbIn <= 18'h10000;
            end
        else if (bitCount == 63) begin
            hbIn <= 18'h10000;
            end
        else if (bitCount == 64) begin
            hbIn <= 18'h10000;
            end
        else begin
            hbIn <= 18'h0;
            end
        end
    end

initial begin
    reset = 0;
    sync = 1;
    syncCount = 0;
    clk = 0;
    bitCount = 0;       

    // Turn on the clock
    clken=1;
    #(10*C) ;

    reset = 1;
    #(2*C) ;
    reset = 0;

    #(1024*C) ;

    $stop;

    end
`endif


endmodule

`endif
