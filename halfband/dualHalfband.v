/******************************************************************************
Copyright 2008-2015 Koos Technical Services, Inc. All Rights Reserved

This source code is the Intellectual Property of Koos Technical Services,Inc. 
(KTS) and is provided under a License Agreement which protects KTS' ownership and
derivative rights in exchange for negotiated compensation.
******************************************************************************/

`timescale 1ns / 10 ps
`include "addressMap.v"

//************************ Two Channel Version ********************************

module dualHalfbandDecimate( 
    input                       clk, reset, clkEn,
    input       signed  [17:0]  iIn,qIn,
    output  reg signed  [17:0]  iOut,qOut,
    output  reg                 clkEnOut
);

    reg clkEnEven;
    always @(posedge clk) begin
        if (reset) begin
            clkEnEven <= 0;
        end
        else if (clkEn) begin  
            clkEnEven <= ~clkEnEven;    
        end
    end

    // Even tap fir
    `ifdef USE_VIVADO_CORES

    wire    signed  [31:0]  evenOutI;
    halfbandEven evenFirI(
        .aclk(clk),
        .aclken(clkEnEven & clkEn),
        .aresetn(!reset),
        .s_axis_data_tvalid(1'b1),
        .s_axis_data_tready(evenFirIReady),
        .s_axis_data_tdata({6'b0,iIn}),
        .m_axis_data_tvalid(evenOutIValid),
        .m_axis_data_tdata(evenOutI),
        .m_axis_data_tuser()
    );
    wire    signed  [31:0]  evenOutQ;
    halfbandEven evenFirQ(
        .aclk(clk),
        .aclken(clkEnEven & clkEn),
        .aresetn(!reset),
        .s_axis_data_tvalid(1'b1),
        .s_axis_data_tready(evenFirQReady),
        .s_axis_data_tdata({6'b0,qIn}),
        .m_axis_data_tvalid(evenOutQValid),
        .m_axis_data_tdata(evenOutQ),
        .m_axis_data_tuser()
    );

    `else

    wire signed [32:0]  evenOutI;
    wire signed [32:0]  evenOutQ;
    halfbandEven evenFirI(
        .clk(clk),
        .nd((clkEnEven & clkEn) | reset),
        .rfd(),
        .rdy(),
        .din(iIn),
        .dout(evenOutI)
    );
    halfbandEven evenFirQ(
        .clk(clk),
        .nd((clkEnEven & clkEn) | reset),
        .rfd(),
        .rdy(),
        .din(qIn),
        .dout(evenOutQ)
    );
    `endif

    // Odd tap delay and scale
    // Detect the input decimation
    reg [2:0]decCount;
    reg [2:0]fifoMux;
    always @(posedge clk) begin
        if (clkEn) begin
            decCount <= 0;
            fifoMux <= decCount;
        end
        else begin
            if (decCount < 7) begin
                decCount <= decCount + 1;
            end
        end
    end

    `define ODD_DELAY  25
    reg signed  [17:0]  fifoI[`ODD_DELAY-1:0];
    reg signed  [17:0]  fifoQ[`ODD_DELAY-1:0];
    integer i;
    always @(posedge clk) begin
        if (clkEn) begin
            if (!clkEnEven) begin
                fifoI[0] <= iIn;
                fifoQ[0] <= qIn;
                for (i = 1; i < `ODD_DELAY; i = i + 1) begin
                    fifoI[i] <= fifoI[i-1];
                    fifoQ[i] <= fifoQ[i-1];
                end
            end
        end
    end

    reg signed  [17:0]  oddOutI,oddOutQ;
    `ifdef USE_VIVADO_CORES
    always @* begin
        oddOutI = fifoI[`ODD_DELAY-1];
        oddOutQ = fifoQ[`ODD_DELAY-1];
    end
    `else
    always @* begin
        case(fifoMux)
            0: begin
                oddOutI = fifoI[15];
                oddOutQ = fifoQ[15];
                end
            1: begin
                oddOutI = fifoI[12];
                oddOutQ = fifoQ[12];
                end
            2: begin
                oddOutI = fifoI[11];
                oddOutQ = fifoQ[11];
                end
            3,4,5: begin
                oddOutI = fifoI[10];
                oddOutQ = fifoQ[10];
                end
            default: begin
                oddOutI = fifoI[9];
                oddOutQ = fifoQ[9];
                end
        endcase
    end
    `endif

    // Add 'em up
    wire    signed  [18:0]  sumI = evenOutI[28:10] + {{2{oddOutI[17]}},oddOutI[17:1]};
    wire    signed  [18:0]  sumQ = evenOutQ[28:10] + {{2{oddOutQ[17]}},oddOutQ[17:1]};
    reg     signed  [17:0]  iData;
    reg     signed  [17:0]  qData;
    always @(posedge clk) begin
        if (clkEn) begin
            if (clkEnEven) begin
                if (sumI[18] & !sumI[17]) begin
                    iData <= 18'h20001;
                end
                else if (!sumI[18] & sumI[17]) begin
                    iData <= 18'h1ffff;
                end
                else begin
                    iData <= sumI[17:0];
                end
                if (sumQ[18] & !sumQ[17]) begin
                    qData <= 18'h20001;
                end
                else if (!sumQ[18] & sumQ[17]) begin
                    qData <= 18'h1ffff;
                end
                else begin
                    qData <= sumQ[17:0];
                end
            end
        end
    end

    always @(posedge clk) begin
        iOut <= iData;
        qOut <= qData;
        clkEnOut <= clkEnEven & clkEn;
    end

    `ifdef SIMULATE
    real inIReal;
    always @* inIReal = ((iIn > 131071.0) ? (iIn - 262144.0) : iIn)/131072.0;
    real outIReal;
    always @* outIReal = ((iOut > 131071.0) ? (iOut - 262144.0) : iOut)/131072.0;
    real outQReal;
    always @* outQReal = ((qOut > 131071.0) ? (qOut - 262144.0) : qOut)/131072.0;
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

reg clkEn;
reg [7:0]clkEnCount;
always @(posedge clk) begin
    if (clkEnCount == 0) begin
        clkEnCount <= decimation-1;
        clkEn <= 1;
        end
    else begin
        clkEnCount <= clkEnCount - 1;
        clkEn <= 0;
        end
    //clkEn <= ~clkEn;
    //clkEn <= 1;
    end

`define SAMPLE_PERIOD   (C*1e-9)
`define TWO_POW_31      2147483648.0
`define TWO_POW_32      4294967296.0
`define TWO_POW_17      131072.0

// Instantiate the halfband filter
reg     [17:0]hbIn;
wire    [17:0]hbOut;
halfbandDecimate hb ( .clk(clk), .reset(reset), .clkEn(clkEn),
                      .iIn(hbIn),
                      .iOut(hbOut),
                      .clkEnOut()
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
    if (clkEn) begin
        hbIn <= {sineOut[17],sineOut[17:1]};
        end
    end

initial begin
    reset = 0;
    clkEn = 1;
    clkEnCount = 0;
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
    if (clkEn) begin
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
    clkEn = 1;
    clkEnCount = 0;
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
