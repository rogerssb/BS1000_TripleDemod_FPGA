`timescale 1ns / 10ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/14/2019 05:12:27 PM
// Design Name: Spectral Sweep
// Module Name: ssc
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

`include "addressMap.v"

module ssc(
    input                [13:0] atod,
    input                       clk,
    input                       reset,
    input                       busClk,
    input                       cs,
    input                       wr0,wr1,wr2,wr3,
    input               [12:0]  addr,
    input               [31:0]  dataIn,
    output reg          [31:0]  dataOut,
    output                      uartOut
    );
    
    reg [31:0] sscDOut;
    
    parameter real CLK_FREQ=93333333.33;
    localparam integer MSEC = (1e-3*CLK_FREQ);
    parameter MSEC_SIZE = 17;
    
    reg     [9:0]   frameWaitMSec ; //= 50;
    reg     [3:0]   ch;
    reg     [15:0]  baudDiv;        //= 15'd405; //230400 //15'd100 921600;
    reg     [4 : 0] nfft ;          //= 5'hA;
    reg     fftEnable;    
    reg     winSel;                 //= 1'b1;
    reg     spectinv;
        
//    ////DEBUG VIO
//    vio_0 vio_ssc (
//      .clk(clk),                // input wire clk
//      .probe_out0(nfft),        // output wire [4 : 0] probe_out0
//      .probe_out1(winSel),      // output wire [0 : 0] probe_out1
//      .probe_out2(ch),   // output wire [3 : 0] probe_out2
//      .probe_out3(spectinv)
//     );
     
//         ///for simulation
//     reg [5:0]enClk;
//     always @(posedge clk) begin
//         if(reset) begin
//             enClk <= 0;
//             fftEnable <=0 ;
//         end
//         else begin
//             if(enClk==5'h1F) begin
//                 fftEnable <= 1;
//             end
//             else begin
//                 enClk <= enClk + 1;
//             end
//         end
//     end

    ///----------------------------------------------   
    /// BUS Read & Write
    ///----------------------------------------------
    reg sdiSpace;
    always @* begin
      casex(addr)
        `SSCSPACE:      sdiSpace = cs;
        default:        sdiSpace = 0;
      endcase
    end
    
    always @(posedge busClk or posedge reset) begin
        if (reset) begin
            fftEnable <= 0;
            end
        else if (sdiSpace && wr0) begin
            casex (addr)
                `SDI_CONTROL: begin
                    fftEnable <= dataIn[0];
                    end
                default: ;
                endcase
            end
        end
    always @(posedge busClk) begin
        if (sdiSpace && wr0) begin
            casex (addr)
                `SSC_CONTROL    :begin 
                    //7:3,2,1,0	    //nfft, windowEn, spectInv, fft-en
                    nfft            <= dataIn[7:3];
                    winSel          <= dataIn[2];
                    spectinv        <= dataIn[1];
                end
                `SSC_FRAME_WAIT :begin 
                    frameWaitMSec[7:0]   <= dataIn[7:0];
                 end
                `SSC_CH         :begin 
                    ch              <= dataIn[3:0];
                end
                default: ;
                endcase
            end
        end
    always@(posedge busClk) begin
        if(sdiSpace && wr1) begin
            casex (addr)
                `SSC_FRAME_WAIT :begin
                    frameWaitMSec[9:8]   <= dataIn[9:8];      
                end
            endcase;
       end
    end
    
    always @* begin
        casex(addr)
            `SSC_BAUD_DIV:      begin
                                    sscDOut <= {16'b0,baudDiv};
                                end
            `SSC_CONTROL:       begin
                                    sscDOut <= {24'b0,nfft,winSel,spectinv,fftEnable};
                                end
            `SSC_FRAME_WAIT:    begin
                                    sscDOut <= {22'b0,frameWaitMSec};
                                end
            `SSC_CH:            begin
                                    sscDOut <= {28'b0, ch}; 
                                end
            
            default:            begin
                                    sscDOut = 32'hx;
                                end
        endcase
    end
    
    always @(posedge busClk) begin
        if (sdiSpace & wr0) begin
            casex (addr)
                `SSC_BAUD_DIV: baudDiv[7:0] = dataIn[7:0];
                default: ;
            endcase
        end
    end
        
    always @(posedge busClk) begin
        if (sdiSpace & wr1) begin
            casex (addr)
                `SSC_BAUD_DIV: baudDiv[15:8] = dataIn[15:8];
                default: ;
            endcase
        end
    end


//reg     [31:0]  dataOut;
always @* begin
    casex(addr)
        `SSCSPACE:      dataOut = sscDOut;
        default:        dataOut = 32'hx;
        endcase
    end



     
    ///----------------------------------------------   
    /// HBF Quad-Down Converter FFT
    ///----------------------------------------------
    wire [13 : 0] adDatain = atod;
    reg [0 : 0] nfftwe;
    reg [0 : 0] rstfifo;
    reg [0 : 0] startn;
    //    wire [0 : 0] fft_m_axis_data_tready0;
    wire [0 : 0] fifofull_i;
    wire [0 : 0] fifofull_q;
    wire [18 : 0] idata;
    wire [15 : 0] qdata;
    wire [11 : 0] fft_axis_tuser_xk_index_d;
    wire [0 : 0] fft_mag_m_axis_data_tlast;
    wire [0 : 0] fft_mag_m_axis_dout_tvalid;
    wire [15 : 0] fft_mag_m_axis_tdata_real;
    wire [0 : 0] fft_mag_finished;
    reg  [15 : 0] winCoef;
    wire [12 : 0] winAddr;
    reg [11 : 0] scalesch;
    wire [12: 0] fftN;
    wire ce2;
   

    
    //(* DONT_TOUCH = "true|yes" *) 
    hbf_fft_0 fft0 (
      .datain(adDatain),                                          // input wire [13 : 0] datain
      .nfft(nfft),                                              // input wire [4 : 0] nfft
      .nfftwe(nfftwe),                                          // input wire [0 : 0] nfftwe
      .rstfifo(rstfifo),                                        // input wire [0 : 0] rstfifo
      .scalesch(scalesch),                                       // input wire [11 : 0] scalesch
      .spectinv(spectinv),                                      // input wire [0 : 0] spectinv
      .startn(startn),                                          // input wire [0 : 0] startn
//        .fft_m_axis_data_tready(fft_m_axis_data_tready0),          // input wire [0 : 0] fft_m_axis_data_tready
      .clk(clk),                                                // input wire clk
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
    

     
    always@(posedge clk) begin
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
    
    ///----------------------------------------------
    /// Hamming Windowing Function ROM  
    ///----------------------------------------------
    reg [11:0] wdec;
    always@(posedge clk) begin
        case(nfft)
        0:  wdec <= 4096;         //1
        1:  wdec <= 2048;         //2
        2:  wdec <= 1024;         //4
        3:  wdec <= 512;         //8
        4:  wdec <= 256;         //16
        5:  wdec <= 128;         //32
        6:  wdec <= 64;         //64
        7:  wdec <= 32;         //128
        8:  wdec <= 16;         //256
        9:  wdec <= 8;         //512
        10: wdec <= 4;         //1024
        11: wdec <= 2;         //2048
        12: wdec <= 1;         //4096
        default: wdec <= 1;
        endcase
      end    
      
    parameter ROM_WIDTH = 15;
    parameter ROM_ADDR_BITS = 12;
    
    (* rom_style="{distributed}" *)
    reg [ROM_WIDTH-1:0] window [(2**ROM_ADDR_BITS)-1:0];
    
    initial
      $readmemh("./hamming_12_15.mem",window, 0, (2**ROM_ADDR_BITS)-1); 	// Was hard coded to C:/Modem/Vivado. FZ
                 
    wire [15:0] windowData = winSel ?  {1'b0,window[winAddr[11:0]* wdec]}: 16'b0100000000000000;
    
    always @(posedge clk)
      if (ce2)
         winCoef <= windowData;
    
    ///----------------------------------------------
    /// FIFO for FFT output
    ///----------------------------------------------
    reg     fifoEn0,fifoEn;
    wire    fifoFull;
    reg     fifoReset;
    reg     fifoRead;
    wire    [15:0] fifoDataOut;
    wire    fifoEmpty;
    


    always @(posedge clk or posedge fifoFull) begin
        if (fifoFull) begin
            fifoEn0 <= 0;
            fifoEn <= 0;
            end
        else begin
            fifoEn0 <= fftEnable;
            fifoEn <= fifoEn0;
            end
        end
    
    wire fifoWe = fft_mag_m_axis_dout_tvalid && ce2;
    fifoFft fifoFft (
          .clk(clk),                            // input wire clk
          .srst(fifoReset),                     // input wire srst
          .din(fft_mag_m_axis_tdata_real),      // input wire [15 : 0] din
          .wr_en(fifoWe),                       // input wire wr_en
          .rd_en(fifoRead),                     // input wire rd_en
          .dout(fifoDataOut),                   // output wire [15 : 0] dout
          .full(fifoFull),                      // output wire full
          .empty(fifoEmpty)                     // output wire empty
        );

  
  ///----------------------------------------------
  /// Uart
  ///----------------------------------------------
  reg               uartDataAvailable;
  wire              uartDataNeeded;
  reg       [7:0]   uartData;
  reg       [13:0]  dataCnt;
  always@(posedge clk) begin
    if(ce2) begin
        dataCnt <= fftN*2;
    end
  end  
 

//`define PCS6630_FORMAT  
`ifdef PCS6630_FORMAT  

  wire      [31:0]  uartDout;
  reg       [3:0]   D1000;
  reg       [13:0]  D1000a;
  reg       [3:0]   D100;
  reg       [3:0]   D100a;
  reg       [3:0]   D10;
  reg       [13:0]  D10a;
  reg       [3:0]   D1;  
  reg       [7:0]   Na0;
  reg       [7:0]   Na1;
  reg       [7:0]   Na2;
  reg       [7:0]   Na3;
  
  always @(posedge clk) begin
    D1000   = dataCnt/1000;
    D100    = (dataCnt-D1000a)/100;
    D10     = (dataCnt-D1000a-D100a)/10;
    D1      = (dataCnt-D1000a-D100a-D10a);  
  
    D1000a  = D1000*1000;
    D100a   = D100*100;
    D10a    = D10*10;
  end
  ///give 3 clks to update
  always @(posedge clk) begin
    Na0 = {4'h3, D1};
    Na1 = {4'h3, D10};
    Na2 = {4'h3, D100};
    Na3 = {4'h3, D1000}; 
  end
   localparam HEADR_SIZE=14;
   wire      [7:0] header [0:13] ={"[","0","1","9","0","R","F","F","T", Na3, Na2, Na1, Na0, {4'h3,ch}};//
`else
   localparam HEADR_SIZE = 12;
   wire      [7:0]   header [0:HEADR_SIZE-1]={"[","0","1","9","0","R","F","F","T", {2'b00,dataCnt[13:8]}, dataCnt[7:0], {4'h3,ch} };  //[12*8-1:0] header = {{4'h3,ch},dataCnt[7:0], {2'b00,dataCnt[13:8]}, cmd};
`endif
 wire        [7:0] frameEnd = "]"; 

  wire baudEn;
  uartBaudGen uartbg(
      .clk(clk),
      .reset(reset),
      .baudDiv(baudDiv),
      .baudEn(baudEn)
      );
  
 // `define DBGNOTX
  `ifdef DBGNOTX
  `else
  uartTx uartTx(
      .clk(clk),
      .reset(reset),
      .baudEn(baudEn),
      .data(uartData),
      .dataAvailable(uartDataAvailable),
      .dataNeeded(uartDataNeeded),
      .uartOutput(uartOut)
      );
    `endif

  ///----------------------------------------------
  /// increment time1msCounter ever 1 mili Seconds 
  ///-----------------------------------------------
  reg [9:0]           timer1msCounter;  
  reg                 timer1msRst=0;
  reg [MSEC_SIZE-1:0] timer1mS=0; 
  always@(posedge clk) begin
    if(timer1msRst) begin
        timer1mS <= 17'h0;
        timer1msCounter <= 0;
    end
    else begin
        if(timer1mS == MSEC) begin
            timer1msCounter <= timer1msCounter + 1;
            timer1mS <= 0;
        end
        else begin 
            timer1mS <= timer1mS+1;
        end    
    end
  end  
  
  ///----------------------------------------------
  /// State Machine - Start Process FFT Data for UART output
  ///----------------------------------------------
parameter       SM_IDLE         = 4'b0000,
                SM_NFFT         = 4'b0001,
                SM_NFFT2        = 4'b0011,
                SM_START        = 4'b0010,
                SM_START2       = 4'b0110,
                SM_START_WAIT   = 4'b0111,
                SM_HEADER1      = 4'b0101,
                SM_HDER1_WAIT   = 4'b0100,
                SM_MSB          = 4'b1100,
                SM_MSB_WAIT     = 4'b1101,             
                SM_LSB          = 4'b1111,
                SM_LSB_WAIT     = 4'b1011,
                SM_LSB_LAST     = 4'b1010,
                SM_LSB_WT_LAST  = 4'b1000,             
                SM_HOLD         = 4'b1001;


    reg [3:0] smState;
    reg [12:0] count;
    
`ifdef DBGNOTX
    assign uartDataNeeded = ((smState==SM_START_WAIT)||(smState==SM_HDER1_WAIT)|| (smState==SM_MSB_Wait) ||(smState== SM_LSB_Wait)) ? 1:0;
`endif

    always @(posedge clk) begin
        if (reset) begin
            smState <= SM_IDLE;
            uartDataAvailable <= 0;
            nfftwe <= 0;
            fifoReset <= 1;
            startn <=0;
            count <= 13'h0000;
            fifoRead <=0;
            rstfifo <=1;
            timer1msRst <= 1;
        end
        else begin
            case (smState)
                SM_IDLE      	: begin
                    fifoReset <= 1;
                    rstfifo <=0;
                    count <=13'h0000;
                    if(fftEnable) begin
                        smState <= SM_NFFT;
                        nfftwe <= 1;
                    end
                end
                SM_NFFT         : begin
                    fifoReset <= 0;
                    smState <= SM_NFFT2;
                end
                SM_NFFT2        : begin
                    nfftwe <= 0;                        //must hold for 2 clocks
                    if(count > 6) begin
                        smState <= SM_START;            //wait to allow to config
                        startn <= 1;
                        count <= 0;
                    end
                    else begin
                        count <= count + 1;
                    end
                end
                SM_START        : begin
                    smState <= SM_START2;
                end
                SM_START2        : begin
                    startn <= 0;                            //must hold for 2 clocks
                    if(fft_mag_finished && !fifoEmpty) begin
                        smState <= SM_START_WAIT;
                        fifoRead <= 1;
                    end
                end
                SM_START_WAIT    : begin  
                    fifoRead <= 0;                  
                    if(uartDataNeeded) begin
                        uartDataAvailable <= 1;
                        uartData <= header[count];  //[(count*8)+:8];
                        count <= count + 1;
                        smState <= SM_HEADER1;
                    end
                end
                SM_HEADER1      : begin
                    if (!uartDataNeeded) begin
                       smState <= SM_HDER1_WAIT;
                    end
                end
                SM_HDER1_WAIT   : begin
                    if (uartDataNeeded) begin
                        if(count < HEADR_SIZE) begin
                            smState <= SM_HEADER1;
                            uartData <= header[count];  // header[(count*8)+:8];
                            count <= count + 1;
                        end
                        else begin
                            smState <= SM_MSB;
                            count <= 13'h00000;
                            uartData <= fifoDataOut[7:0];    
                        end
                    end
                end
                SM_MSB          : begin
                    if (!uartDataNeeded) begin
                        smState <= SM_MSB_WAIT;           
                    end                
                end
                SM_MSB_WAIT     : begin
                    if (uartDataNeeded && !fifoEmpty) begin
                        smState <= SM_LSB;
                        uartData <= fifoDataOut[15:8];
                        fifoRead <= 1;
                   end
                   else if (uartDataNeeded && fifoEmpty) begin
                        uartData <= fifoDataOut[15:8];
                        smState <= SM_LSB_LAST;     
                   end             
                end
                SM_LSB          : begin
                    fifoRead <=0;
                    if (!uartDataNeeded) begin
                        smState <= SM_LSB_WAIT;
                    end
                end
                SM_LSB_WAIT     : begin                   
                    if (uartDataNeeded) begin
                       smState <= SM_MSB;
                       uartData <= fifoDataOut[7:0]; 
                   end
                end   
                SM_LSB_LAST          : begin
                    if (!uartDataNeeded) begin
                        smState <= SM_LSB_WT_LAST;
                         uartDataAvailable <= 0;
                    end
                end
                SM_LSB_WT_LAST     : begin                   
                    if (uartDataNeeded) begin
                       smState <= SM_HOLD;
                       fifoReset <= 1;
                       rstfifo <= 1;
                       timer1msRst <=1;
                   end
                end   
                SM_HOLD         : begin
                    timer1msRst <= 0;
                    if(frameWaitMSec == timer1msCounter) begin
                        smState <= SM_IDLE;
                    end
                end
                default: begin
                    timer1msRst <= 1;
                    smState <= SM_IDLE;
                    uartDataAvailable <= 0;
                    nfftwe <= 0;
                    startn <=0;
                    count <= 13'h0000;
                    fifoRead <=0;
                    rstfifo <=0;
                end
          endcase
                   
        end
    end 
           
endmodule
