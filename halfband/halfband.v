`timescale 1ns / 10 ps

module halfbandDecimate( clk, reset, sync,
                 iIn,qIn,
                 iOut,qOut,
                 syncOut
                 );

input clk;
input reset;
input sync;
input  [17:0]iIn,qIn;
output [17:0]iOut,qOut;
output syncOut;

reg evenSync;
always @(posedge clk) begin
    if (reset) begin
        evenSync <= 0;
        end
    else if (sync) begin  
        evenSync <= ~evenSync;    
        end
    end

// Even tap fir
wire [32:0]evenOutI;
wire [32:0]evenOutQ;
halfbandEven evenFirI(
    .clk(clk),
    .nd(evenSync & sync),
    .rfd(),
    .rdy(),
    .din(iIn),
    .dout(evenOutI)
    );
halfbandEven evenFirQ(
    .clk(clk),
    .nd(evenSync & sync),
    .rfd(),
    .rdy(),
    .din(qIn),
    .dout(evenOutQ)
    );

// Odd tap delay and scale
// Detect the input decimation
reg [1:0]decCount;
reg [1:0]fifoMux;
always @(posedge clk) begin
    if (sync) begin
        decCount <= 0;
        fifoMux <= decCount;
        end
    else begin
        if (decCount < 2) begin
            decCount <= decCount + 1;
            end
        end
    end

`define ODD_DELAY  16
reg [17:0]fifoI[`ODD_DELAY-1:0];
reg [17:0]fifoQ[`ODD_DELAY-1:0];
always @(posedge clk) begin
    if (sync) begin
        if (!evenSync) begin
            fifoI[0] <= iIn;
            fifoI[1] <= fifoI[0];
            fifoI[2] <= fifoI[1];
            fifoI[3] <= fifoI[2];
            fifoI[4] <= fifoI[3];
            fifoI[5] <= fifoI[4];
            fifoI[6] <= fifoI[5];
            fifoI[7] <= fifoI[6];
            fifoI[8] <= fifoI[7];
            fifoI[9] <= fifoI[8];
            fifoI[10] <= fifoI[9];
            fifoI[11] <= fifoI[10];
            fifoI[12] <= fifoI[11];
            fifoI[13] <= fifoI[12];
            fifoI[14] <= fifoI[13];
            fifoI[15] <= fifoI[14];
            fifoQ[0] <= qIn;
            fifoQ[1] <= fifoQ[0];
            fifoQ[2] <= fifoQ[1];
            fifoQ[3] <= fifoQ[2];
            fifoQ[4] <= fifoQ[3];
            fifoQ[5] <= fifoQ[4];
            fifoQ[6] <= fifoQ[5];
            fifoQ[7] <= fifoQ[6];
            fifoQ[8] <= fifoQ[7];
            fifoQ[9] <= fifoQ[8];
            fifoQ[10] <= fifoQ[9];
            fifoQ[11] <= fifoQ[10];
            fifoQ[12] <= fifoQ[11];
            fifoQ[13] <= fifoQ[12];
            fifoQ[14] <= fifoQ[13];
            fifoQ[15] <= fifoQ[14];
            end
        end
    end
reg [17:0]oddOutI,oddOutQ;
always @(
    fifoMux or 
    fifoI[14] or fifoI[11] or fifoI[10] or
    fifoQ[14] or fifoQ[11] or fifoQ[10]) begin
    case(fifoMux)
        0: begin
            oddOutI = fifoI[14];
            oddOutQ = fifoQ[14];
            end
        1: begin
            oddOutI = fifoI[11];
            oddOutQ = fifoQ[11];
            end
        2: begin
            oddOutI = fifoI[10];
            oddOutQ = fifoQ[10];
            end
        default: begin
            oddOutI = fifoI[10];
            oddOutQ = fifoQ[10];
            end
        endcase
    end

// Add 'em up
reg [17:0]iOut;
reg [17:0]qOut;
always @(posedge clk) begin
    if (sync) begin
        if (evenSync) begin
            iOut <= evenOutI[27:10] + {{1{oddOutI[17]}},oddOutI[17:1]};
            qOut <= evenOutQ[27:10] + {{1{oddOutQ[17]}},oddOutQ[17:1]};
            end
        end
    end

reg syncOut;
always @(posedge clk) begin
    syncOut <= evenSync & sync;
    end

`ifdef SIMULATE
real outIReal = ((iOut > 131071.0) ? (iOut - 262144.0) : iOut)/131072.0;
real outQReal = ((qOut > 131071.0) ? (qOut - 262144.0) : qOut)/131072.0;
`endif

endmodule

//`define TEST_MODULE
`ifdef TEST_MODULE

//`define SINEWAVE_TEST
`define IMPULSE_TEST

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
        syncCount <= 5;
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
reg     [17:0]hbIn;
wire    [17:0]hbOut;
halfbandDecimate hb ( .clk(clk), .reset(reset), .sync(sync),
                      .hbIn(hbIn),
                      .hbOut(hbOut),
                      .syncOut()
                    );

`ifdef SINEWAVE_TEST

//Create a sinewave input
real carrierFreqHz;
real carrierFreqNorm = carrierFreqHz * `SAMPLE_PERIOD * `TWO_POW_32;
integer carrierFreqInt = carrierFreqNorm;
wire [31:0] freq = carrierFreqInt;
wire [17:0]sineOut;
nco dds(.sclr(reset), .clk(clk), .we(1'b1), .data(freq), .sine(sineOut), .cosine());

always @(posedge clk) begin
    hbIn <= sineOut;
    end

initial begin
    reset = 0;
    sync = 1;
    syncCount = 0;
    clk = 0;
    carrierFreqHz = 1e6;

    // Turn on the clock
    clken=1;
    #(10*C) ;

    reset = 1;
    #(2*C) ;
    reset = 0;

    #(256*C) ;

    carrierFreqHz = 20e6/2;

    #(256*C) ;

    carrierFreqHz = 25e6/2;

    #(256*C) ;

    carrierFreqHz = 30e6/2;

    #(256*C) ;

    carrierFreqHz = 35e6/2;

    #(256*C) ;

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
