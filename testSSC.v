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


`ifndef 0
    initial begin
    #100
    write16(createAddress(`SSCSPACE,`SSC_BAUD_DIV), 5);
    write16(createAddress(`SSCSPACE,`SSC_CONTROL), {8'h2,5'h6,1'b1,1'b1,1'b1});     //Averate=2^2, NFFT=2^6, Window-Enable=1, Spect-Inv=1, FFT-Enable=1  
    write16(createAddress(`SSCSPACE,`SSC_FRAME_WAIT), 80);
    write16(createAddress(`SSCSPACE,`SSC_CH), 1);         
    // test not our space
//    write16(createAddress(`SDISPACE,`SSC_BAUD_DIV), 111);
//    write16(createAddress(`VIDSWITCHSPACE,`SSC_CONTROL), {8'h0,5'h0,0'b0,1'b0,1'b1});     //NFFT=12, Window-Enable=1, Spect-Inv=1, FFT-Enable=1  
//    write16(createAddress(`SEMCO_TOP_SPACE,`SSC_FRAME_WAIT), 1);
//    write16(createAddress(`DUAL_DECODERSPACE,`SSC_CH), 1);         
    
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
        #(2*C*decimation);
        reset = 1;
        #(2*C*decimation) ;
        reset = 0;        
    end
    
    always@(posedge ssc.clk) begin
        if(ssc.fifoWe) begin
            $display("[display] time=%0t fft=0x%h fft<7=%h fifoIn=0x%h fifoOut=0x%h xk=0x%h",
                $time,
                ssc.fft_mag_m_axis_tdata_real,
                {ssc.fft_mag_m_axis_tdata_real,7'h0},
                ssc.fft_avg_fifo_in,
                ssc.fifoDataOutAvg,
                ssc.fft_axis_tuser_xk_index_d);
        end
    end
    always@(ssc.avgCount) begin
        $display("[display] time=%0t AGC-Count=%d",$time,ssc.avgCount);
    end
`else   
///////////////////////////////////////////////////////   test hbf_fft directly     ////////////////////////////////////////////////////////////////////////////////////////
//    reg  [5:0]      nfft;
    reg             nfftwe;
    reg             rstfifo;
//    reg  [12 : 0]   scalesch;
    reg             spectinv;
    reg             startn;
    
//    wire [13 : 0]   fftN;
//    wire [13 : 0]   index_k                           ;
//    wire [12 : 0]   fft_axis_tuser_xk_index_d         ;
    wire            fft_mag_m_axis_data_tlast         ;
    wire            fft_mag_m_axis_dout_tvalid        ;
//    wire [15 : 0]   fft_mag_m_axis_tdata_real         ;
    wire            fft_mag_finished                  ;
//    wire [15 : 0]   window = 16'hffff                 ;
    wire            fifofull_i;
    wire            fifofull_q;
  
  //----
    reg     [4 : 0] nfft ;          //= 5'hA;    
//    reg [0 : 0] nfftwe;
//    reg [0 : 0] rstfifo;
//    reg [0 : 0] startn;
//    wire [0 : 0] fifofull_i;
//    wire [0 : 0] fifofull_q;
    wire [18 : 0] idata;
    wire [15 : 0] qdata;
    wire [11 : 0] fft_axis_tuser_xk_index_d;
//    wire [0 : 0] fft_mag_m_axis_data_tlast;
//    wire [0 : 0] fft_mag_m_axis_dout_tvalid;
    wire [15 : 0] fft_mag_m_axis_tdata_real;
//    wire [0 : 0] fft_mag_finished;
    reg  [15 : 0] winCoef;
    wire [12 : 0] winAddr;
    reg [11 : 0] scalesch;
    wire [12: 0] fftN;
    wire ce2;
    
    
    hbf_fft_0 fft0 (
      .datain(sineOut[17:4]),                                          // input wire [13 : 0] datain
      .nfft(nfft),                                              // input wire [4 : 0] nfft
      .nfftwe(nfftwe),                                          // input wire [0 : 0] nfftwe
      .rstfifo(rstfifo),                                        // input wire [0 : 0] rstfifo
      .scalesch(scalesch),                                       // input wire [11 : 0] scalesch
      .spectinv(spectinv),                                      // input wire [0 : 0] spectinv
      .startn(startn),                                          // input wire [0 : 0] startn
//        .fft_m_axis_data_tready(fft_m_axis_data_tready0),          // input wire [0 : 0] fft_m_axis_data_tready
      .clk(adcClk),                                                // input wire clk
      .fifofull_i(fifofull_i),                                  // output wire [0 : 0] fifofull_i
      .fifofull_q(fifofull_q),                                  // output wire [0 : 0] fifofull_q
      .idata(idata),                                            // output wire [13 : 0] idata
       .n(fftN),
      .qdata(qdata),                                            // output wire [13 : 0] qdata
      .fft_axis_tuser_xk_index_d(fft_axis_tuser_xk_index_d),    // output wire [11 : 0] fft_axis_tuser_xk_index_d
      .fft_mag_m_axis_data_tlast(fft_mag_m_axis_data_tlast),    // output wire [0 : 0] fft_mag_m_axis_data_tlast
      .fft_mag_m_axis_dout_tvalid(fft_mag_m_axis_dout_tvalid),  // output wire [0 : 0] fft_mag_m_axis_dout_tvalid
      .fft_mag_m_axis_tdata_real(fft_mag_m_axis_tdata_real),    // output wire [15 : 0] fft_mag_m_axis_tdata_real
      .fft_mag_finished(fft_mag_finished) ,                     // output wire [0 : 0] fft_mag_finished
      .window(winCoef),                                         // input wire [15 : 0] window 16.14 fixed point number
      .index_k(winAddr),                                        // output wire [12 : 0] index_k
      .ce2(ce2)
    );

    always@(nfft) begin
         case(nfft)
         0:  scalesch <= 12'b0000000000000000;           //1
         1:  scalesch <= 12'b0000000000000010;         //2
         2:  scalesch <= 12'b0000000000000010;         //4
         3:  scalesch <= 12'b0000000000000110;         //8
         4:  scalesch <= 12'b0000000000001010;         //16
         5:  scalesch <= 12'b0000000000011010;         //32
         6:  scalesch <= 12'b0000000000101010;         //64
         7:  scalesch <= 12'b0000000001101010;         //128
         8:  scalesch <= 12'b0000000010101010;         //256
         9:  scalesch <= 12'b0000000110101010;         //512
         10: scalesch <= 12'b0000001010101010;         //1024
         11: scalesch <= 12'b0000011010101010;         //2048
         12: scalesch <= 12'b0000101010101010;         //4096
         default: scalesch <= 12'b0000101010101010;
         endcase
    end

    initial begin
        reset       = 0;
        nfft        = 6'hC;
        nfftwe      = 1'b0;
        rstfifo     = 1'b0;
        spectinv    = 1'b1;
        startn      = 1'b0;
        winCoef     = 16'h4000;               
        clkEn           = 0;
        clkEnCount      = 0;
        clk             = 0;
        carrierFreqHz   = 71e6;
        adcClk          = 1;
        // Turn on the clock
        clken           = 1;
        #(10*C);    
        reset           = 1;
        rstfifo         = 1;
        #(10*C) ;
        reset           = 0;
        rstfifo         = 0;
        #(10*C);
        nfftwe          = 1;
        #(2*C);
        nfftwe          = 0;
        #(16*C);
        startn          = 1;
        #(2*C);
        startn          = 0;
    end
`endif     
endmodule
