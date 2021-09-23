`timescale 1ns/100ps
`include "addressMap.v"

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
    end

`define SAMPLE_PERIOD   (C*1e-9)
`define TWO_POW_31      2147483648.0
`define TWO_POW_32      4294967296.0
`define TWO_POW_17      131072.0

    // Instantiate the variableGain
    reg signed  [17:0]  vgIn;
    wire        [4:0]   gainExponent;
    wire        [15:0]  gainMantissa;
    wire        [17:0]  vgOut;
    wire signed [47:0]  vgInput = {{16{vgIn[17]}},vgIn,14'b0};
    variableGain videoGain(
        .clk(clk), .clkEn(1'b1),
        .exponent(gainExponent),
        .mantissa(gainMantissa),
        .din(vgInput),
        .dout(vgOut)
    );

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
dds6p0 dds(
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

    reg     [20:0]  nbAgcGain;
    assign          gainExponent = nbAgcGain[20:16];
    assign          gainMantissa = nbAgcGain[15:0];
    always @(posedge clk) begin
        if (reset) begin
            nbAgcGain <= 21'h0f_0000;
        end
        else if (clkEn) begin
            if (nbAgcGain == 21'h13_f000) begin
                nbAgcGain <= 21'h0f_0000;
            end
            else begin
                nbAgcGain <= nbAgcGain + 21'h1000;
            end
        end
    end

    always @(posedge clk) begin
        if (reset) begin
            vgIn <= 0;
        end
        else if (clkEn) begin
            if (nbAgcGain == 21'h13_f000) begin
                //vgIn <= {sineOut[17],sineOut[17:1]};
                vgIn <= vgIn + 18'h10;
            end
        end
    end

initial begin
    reset = 0;
    clkEn = 1;
    clkEnCount = 0;
    clk = 0;
    carrierFreqHz = 10e6/decimation;

    // Turn on the clock
    clken=1;
    #(10*C) ;

    reset = 1;
    #(2*C*decimation) ;
    reset = 0;

    `ifdef SINE_TEST

    #(32*C*decimation) ;
    gainExponent = 16;
    gainMantissa = 16'hffff;
    #(32*C*decimation) ;

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

    `else

    while ((vgIn != 18'h3fff0) && (nbAgcGain != 21'h03f000)) begin
        repeat (1) @ (posedge clk) ;
    end
    $stop;

    `endif

    end

endmodule
