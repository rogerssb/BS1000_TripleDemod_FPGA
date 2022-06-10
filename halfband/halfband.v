/******************************************************************************
Copyright 2008-2015 Koos Technical Services, Inc. All Rights Reserved

This source code is the Intellectual Property of Koos Technical Services,Inc.
(KTS) and is provided under a License Agreement which protects KTS' ownership and
derivative rights in exchange for negotiated compensation.
******************************************************************************/

`timescale 1ns / 10 ps
`include "addressMap.v"

//************************ Single Channel Version *****************************

module halfbandDecimate(
    clk, reset, sync,
    din,
    dout,
    syncOut
    );

input clk;
input reset;
input sync;
input  [17:0]din;
output [17:0]dout;
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
`ifdef USE_VIVADO_CORES

wire    [31:0]  evenOut;
halfbandEven evenFir(
    .aclk(clk),
    .aclken(evenSync & sync),
    .aresetn(!reset),
    .s_axis_data_tvalid(1'b1),
    .s_axis_data_tready(evenFirReady),
    .s_axis_data_tdata({6'b0,din}),
    .m_axis_data_tvalid(evenOutValid),
    .m_axis_data_tuser(),
    .m_axis_data_tdata(evenOut)
);

`else

wire [32:0]evenOut;
halfbandEven evenFir(
    .clk(clk),
    .nd((evenSync & sync) | reset),
    .rfd(),
    .rdy(),
    .din(din),
    .dout(evenOut)
    );
`endif

// Odd tap delay and scale
// Detect the input decimation
reg [2:0]decCount;
reg [2:0]fifoMux;
always @(posedge clk) begin
    if (sync) begin
        decCount <= 0;
        fifoMux <= decCount;
        end
    else begin
        if (decCount < 7) begin
            decCount <= decCount + 1;
            end
        end
    end

`define HB_ODD_DELAY  25
reg [17:0]fifo[`HB_ODD_DELAY-1:0];
always @(posedge clk) begin
    if (sync) begin
        if (!evenSync) begin
            fifo[0] <= din;
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
            fifo[16] <= fifo[15];
            fifo[17] <= fifo[16];
            fifo[18] <= fifo[17];
            fifo[19] <= fifo[18];
            fifo[20] <= fifo[19];
            fifo[21] <= fifo[20];
            fifo[22] <= fifo[21];
            fifo[23] <= fifo[22];
            fifo[24] <= fifo[23];
            end
        end
    end
reg [17:0]oddOut;
`ifdef USE_VIVADO_CORES
always @* begin
    oddOut = fifo[24];
end
`else
always @* begin
    case(fifoMux)
        0: begin
            oddOut = fifo[15];
            end
        1: begin
            oddOut = fifo[12];
            end
        2: begin
            oddOut = fifo[11];
            end
        3,4,5: begin
            oddOut = fifo[10];
            end
        default: begin
            oddOut = fifo[9];
            end
        endcase
    end
`endif

// Add 'em up
wire    [18:0]  sum = evenOut[28:10] + {{2{oddOut[17]}},oddOut[17:1]};
reg     [17:0]  data;
always @(posedge clk) begin
    if (sync) begin
        if (evenSync) begin
            if (sum[18] & !sum[17]) begin
                data <= 18'h20001;
                end
            else if (!sum[18] & sum[17]) begin
                data <= 18'h1ffff;
                end
            else begin
                data <= sum[17:0];
                end
            end
        end
    end

reg             syncOut;
reg     [17:0]  dout;
always @(posedge clk) begin
    dout <= data;
    syncOut <= evenSync & sync;
    end

`ifdef SIMULATE
real dinReal;
always @* dinReal = $itor($signed(din))/(2**17);
real doutReal;
always @* doutReal = $itor($signed(dout))/(2**17);
`endif

endmodule


//************************** Test Bench ***************************************

//`define TEST_MODULE
`ifdef TEST_MODULE

`define SINEWAVE_TEST
//`define IMPULSE_TEST

`timescale 1ns/100ps

module test;

reg reset,clk;

// Create the clocks
parameter decimation = 4;
parameter HC = 5;
parameter C = 2*HC;
reg clken;
always #HC clk = clk^clken;

reg sync;
reg [7:0]syncCount;
always @(posedge clk) begin
    if (syncCount == 0) begin
        syncCount <= decimation-1;
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
`define TWO_POW_31      2147483648.0
`define TWO_POW_32      4294967296.0
`define TWO_POW_17      131072.0

// Instantiate the halfband filter
reg     [17:0]hbIn;
wire    [17:0]hbOut;
halfbandDecimate hb ( .clk(clk), .reset(reset), .sync(sync),
                      .iIn(hbIn),
                      .iOut(hbOut),
                      .syncOut()
                    );

`ifdef SINEWAVE_TEST

//Create a sinewave input
real carrierFreqHz;
real carrierFreqNorm;
always @* carrierFreqNorm = carrierFreqHz * `SAMPLE_PERIOD * `TWO_POW_32;
integer carrierFreqInt;
always @* carrierFreqInt = carrierFreqNorm;
wire [31:0] freq = carrierFreqInt;

`ifdef USE_VIVADO_CORES
wire    [47:0]  m_axis;
wire    [17:0]  sineOut = m_axis[41:24];
wire    [17:0]  cosOut = m_axis[17:0];
dds dds(
  .aclk(clk),
  .aclken(1'b1),
  .aresetn(!reset),
  .m_axis_data_tdata(m_axis),
  .m_axis_data_tvalid(),
  .s_axis_phase_tdata(freq),
  .s_axis_phase_tvalid(1'b1)
);
`else
wire [17:0]sineOut;
dds dds(
    .sclr(reset), .clk(clk), .ce(1'b1), .we(1'b1), .data(freq), .sine(sineOut), .cosine()
);
`endif

always @(posedge clk) begin
    if (sync) begin
        hbIn <= {sineOut[17],sineOut[17:1]};
        end
    end

initial begin
    reset = 0;
    sync = 1;
    syncCount = 0;
    clk = 0;
    carrierFreqHz = 1e6/decimation;

    // Turn on the clock
    clken=1;
    #(10*C) ;

    reset = 1;
    #(2*C*decimation) ;
    reset = 0;

    #(64*C*decimation) ;

    carrierFreqHz = 10e6/decimation;

    #(64*C*decimation) ;

    carrierFreqHz = 20e6/decimation;

    #(64*C*decimation) ;

    carrierFreqHz = 25e6/decimation;

    #(64*C*decimation) ;

    carrierFreqHz = 30e6/decimation;

    #(64*C*decimation) ;

    carrierFreqHz = 35e6/decimation;

    #(128*C*decimation) ;

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
            //hbIn <= 18'h10000;
            hbIn <= 18'h00000;
            end
        else if (bitCount == 63) begin
            hbIn <= 18'h10000;
            end
        else if (bitCount == 64) begin
            //hbIn <= 18'h10000;
            hbIn <= 18'h00000;
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

    #(256*C*decimation) ;

    $stop;

    end
`endif


endmodule

`endif
