`timescale 1ns/100ps

module test ();

parameter n = 14;

reg clk;
reg reset;
initial clk = 0;

// Create the clocks
parameter SAMPLE_FREQ = 8e6;
parameter HC = 1e9/SAMPLE_FREQ/2;
parameter C = 2*HC;
reg clken;
always #HC clk = clk^clken;
`define SAMPLE_PERIOD   (C*1e-9)
`define TWO_POW_32      4294967296.0
`define TWO_POW_31      2147483648.0
`define TWO_POW_17      131072.0


real carrierFreqHz = 25000.0;
real carrierFreqNorm = carrierFreqHz * `SAMPLE_PERIOD * `TWO_POW_32;
integer carrierFreqInt = carrierFreqNorm;
wire [31:0] carrierFreq = carrierFreqInt;


// Ref Generator
wire    [17:0]iDds;
wire    [17:0]qDds;
wire    [39:0]lagAccum;
dds dds ( 
    .sclr(reset), 
    .clk(clk), 
    .ce(1'b1),
    .we(1'b1), 
    .data(carrierFreq - lagAccum[39:8]), 
    .sine(qDds), 
    .cosine(iDds)
    );

// Frequency Detector
wire    [n-1:0]  x = iDds[17:(17-n+1)];
wire    [n-1:0]  y = qDds[17:(17-n+1)];
real xReal = (x[n-1] ? x - 16384.0 : x)/8192.0;
real yReal = (y[n-1] ? y - 16384.0 : y)/8192.0;
wire [n-2:0]mag;
wire [n-3:0]phase;
real magReal = mag/8192.0;
real phaseReal = (phase[n-3] ? phase - 4096.0 : phase)/2048.0;
vm_cordic #(n) uut(
    .clk(clk),
    .ena(1'b1),
    .x(x), .y(y),
    .m(mag),
    .p(phase));
reg [11:0]freqOut;
reg [11:0]prevPhase;
wire [11:0]phaseDiff = phase - prevPhase;
always @(posedge clk) begin
    if (phaseDiff == 12'h800) begin
        freqOut <= 0;
        end
    else begin
        freqOut <= phaseDiff;
        end
    prevPhase <= phase;
    end

wire    [17:0]  freq = {freqOut,6'b0};
wire    [17:0]  negFreqError = ~freq + 1;

real freqReal;
always @(freq) freqReal = (freq[17] ? freq - 262144.0 : freq)/131072.0;


// Loop Filter
reg clearAccum;
lagGain12 lagGain (
    .clk(clk), .clkEn(1'b1), .reset(reset), 
    .error(freqOut),
    .lagExp(5'h14),
    .limit(32'h10000000),
    .sweepEnable(1'b0),
    .clearAccum(clearAccum),
    .lagAccum(lagAccum)
    );


initial begin
    clken = 1;
    reset = 0;
    clearAccum = 1;
    #(2*10) ;
    reset = 1;
    #(200*10) ;
    reset = 0;
    clearAccum = 0;
    #(1024*1024*10) ;
    $stop;
    
    end

endmodule


