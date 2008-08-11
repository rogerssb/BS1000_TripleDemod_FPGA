`timescale 1ns / 10 ps

module halfbandDecimate( clk, reset, sync,
                 hbIn,
                 hbOut,
                 syncOut
                 );

input clk;
input reset;
input sync;
input  [17:0]hbIn;
output [17:0]hbOut;
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
wire [32:0]evenOut;
halfbandEven evenFir(.clk(clk),
                     .nd(evenSync & sync),
                     .rfd(),
                     .rdy(),
                     .din(hbIn),
                     .dout(evenOut)
                     );
/*
reg [32:0]evenOut;
always @(posedge clk) begin
    if (evenSync & sync) begin
        evenOut <= hbEvenOut;
        end
    end
*/

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
reg [17:0]fifo[`ODD_DELAY-1:0];
always @(posedge clk) begin
    if (sync) begin
        if (!evenSync) begin
            /*
            for (i = 0; i < `ODD_DELAY-1; i <= i + 1) begin
                fifo[i+1] <= fifo[i];
                end
            */
            fifo[0] <= hbIn;
            fifo[1] <= fifo[0];
            fifo[2] <= fifo[1];
            fifo[3] <= fifo[2];
            fifo[4] <= fifo[3];
            fifo[5] <= fifo[4];
            fifo[6] <= fifo[5];
            fifo[7] <= fifo[6];
            fifo[8] <= fifo[7];
            fifo[9] <= fifo[8];
            fifo[10] <= fifo[9];
            fifo[11] <= fifo[10];
            fifo[12] <= fifo[11];
            fifo[13] <= fifo[12];
            fifo[14] <= fifo[13];
            fifo[15] <= fifo[14];
            end
        end
    end
reg [17:0]oddOut;
always @(fifoMux or fifo[14] or fifo[11] or fifo[10]) begin
    case(fifoMux)
        0:          oddOut = fifo[14];
        1:          oddOut = fifo[11];
        2:          oddOut = fifo[10];
        default:    oddOut = fifo[10];
        endcase
    end

// Add 'em up
reg [17:0]hbOut;
always @(posedge clk) begin
    if (sync) begin
        if (evenSync) begin
            hbOut <= evenOut[27:10] + {{1{oddOut[17]}},oddOut[17:1]};
            end
        end
    end

reg syncOut;
always @(posedge clk) begin
    syncOut <= evenSync & sync;
    end

`ifdef SIMULATE
real outReal = ((hbOut > 131071.0) ? (hbOut - 262144.0) : hbOut)/131072.0;
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
