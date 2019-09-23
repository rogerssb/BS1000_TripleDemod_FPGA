`timescale 1ns/100ps
`include "addressMap.v"

module testSSC;

    `ifdef TRIPLE_DEMOD
        `include "upSpiTasks.v"
    `else
        `include "upBusTasks.v"
    `endif
    
// Create the clocks
parameter decimation = 4;
parameter HC = 5;
parameter C = 2*HC;
reg clkEn;
reg clken;
reg [7:0]clkEnCount;
reg clk;
reg reset;

always #HC clk = clk^clken;
`define SAMPLE_PERIOD   (C*1e-9)
`define TWO_POW_31      2147483648.0
`define TWO_POW_32      4294967296.0
`define TWO_POW_17      131072.0

parameter ADC_HC = 5.4;
reg adcClk;
always # ADC_HC adcClk=adcClk^clken;


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

    initial begin
    #100
    write16(createAddress(`SSCSPACE,`SSC_BAUD_DIV), 405);
    write16(createAddress(`SSCSPACE,`SSC_CONTROL), {8'h0,5'hc,1'b1,1'b1,1'b1});     //NFFT=12, Window-Enable=1, Spect-Inv=1, FFT-Enable=1  
    write16(createAddress(`SSCSPACE,`SSC_FRAME_WAIT), 80);
    write16(createAddress(`SSCSPACE,`SSC_CH), 1);         
    // test not our space
    write16(createAddress(`SDISPACE,`SSC_BAUD_DIV), 111);
    write16(createAddress(`VIDSWITCHSPACE,`SSC_CONTROL), {8'h0,5'h0,0'b0,1'b0,1'b1});     //NFFT=12, Window-Enable=1, Spect-Inv=1, FFT-Enable=1  
    write16(createAddress(`SEMCO_TOP_SPACE,`SSC_FRAME_WAIT), 1);
    write16(createAddress(`DUAL_DECODERSPACE,`SSC_CH), 1);         
    
    end

wire [13:0] atod = sineOut[17:4];

    `ifdef TRIPLE_DEMOD
    spiBusInterface spi(
        .clk(clk),
        .reset(reset),
        .spiClk(busClk),
        .spiCS(spiCS),
        .spiDataIn(spiDataIn),
        .spiDataOut(),
        .spiDataOE(spiDataOE),
        .cs(cs),
        .wr0(wr0),.wr1(wr1),.wr2(wr2),.wr3(wr3),
        .addr(a),
        .dataIn(d),
        .dataOut()
    );

    `endif
    
    ssc  #(.CLK_FREQ(10000)) ssc(
        .atod(atod),
        .clk(adcClk),
        .reset(reset),
        .busClk(busClk),
        .cs(cs),
        .wr0(wr0),
        .wr1(wr1),
        .wr2(wr2),
        .wr3(wr3),
        .addr(a),
        .dataIn(d),
        .dataOut()
        );
    
    
    initial begin
        reset = 0;
        clkEn = 1;
        clkEnCount = 0;
        clk = 0;
        carrierFreqHz = 71e6;
        adcClk = 1;
        // Turn on the clock
        clken=1;
        #(10*C) ;
    
        reset = 1;
        #(2*C*decimation) ;
        reset = 0;
    end
    
          
endmodule
