//-----------------------------------------------------------------------------
// Project      SEMCO Multi-mode Demodulator
// Design       Top level
// Created      12/23/08
//-----------------------------------------------------------------------------
// 1.0      Initial coding
//
//
//-----------------------------------------------------------------------------

`timescale 1ns/100ps
`include "addressMap.v"
`include "defines.v"

module top
  (
  ck933,
  nWe,nRd,nCs,
  addr12,addr11,addr10,addr9,addr4,addr3,addr2,addr1,
  data,
  dac_rst,
  dac_sdio,
  dac0_nCs,dac0_sclk,
  dac1_nCs,dac1_sclk,
  dac2_nCs,dac2_sclk,
  dac0_d,dac1_d,dac2_d,
  dac0_clk,dac1_clk,dac2_clk,
  adc_d,
  iDataClk,
  iBit,
  qDataClk,
  qBit,
  bsync_nLock,demod_nLock
  );

input nWe;
input ck933;
input nRd,nCs;
input addr12,addr11,addr10,addr9,addr4,addr3,addr2,addr1;
inout [15:0]data;
inout dac_sdio;
output dac_rst;
output dac0_nCs,dac0_sclk;
output dac1_nCs,dac1_sclk;
output dac2_nCs,dac2_sclk;
output [13:0]dac0_d,dac1_d,dac2_d;
output dac0_clk,dac1_clk,dac2_clk;
input [13:0]adc_d;
output iDataClk,iBit;
output qDataClk,qBit;
output bsync_nLock,demod_nLock;

parameter VER_NUMBER = 16'hABCD;

wire [11:0]addr = {addr11,addr10,addr9,4'bx,addr4,addr3,addr2,addr1,1'b0};

//******************************************************************************
//                               Miscellaneous
//******************************************************************************

reg misc_space;
always @(addr) begin
  casex(addr)
    `MISC_SPACE: misc_space <= 1;
    default:     misc_space <= 0;
  endcase
end
wire misc_en = !nCs && misc_space;

// address decoded reset
reg [15:0] misc_dout;
reg rs;
always @(addr or misc_en) begin
  rs <= 0;
  if(misc_en) begin
    casex (addr)
      `RESET: rs <= 1;
      `VERSION: misc_dout <= VER_NUMBER;
      default: ;
    endcase
  end
end

//******************************************************************************
//                           DAC Serial Interface
//******************************************************************************

reg dac_space;
always @(addr) begin
  casex(addr)
    `DAC_SPACE: dac_space <= 1;
    default: dac_space <= 0;
  endcase
end
wire dac_en = !nCs & dac_space;

// maximum transfer rate on the AD9707 serial port is 20 MHz. The input clock is
// divided by 4 for an 11.66 MHz transfer clock.

reg [1:0]dac_clk_div;
always @(posedge ck933)begin
        dac_clk_div <= dac_clk_div -1;
end

wire dac_control_ck;
BUFG BUFG_dac_control_ck
        (
        .O(dac_control_ck), // Clock buffer output
        .I(dac_clk_div[1]) // Clock buffer input
        );
// End of BUFG_inst instantiation

wire [15:0]dac_dout;
wire dac0_sel,dac1_sel,dac2_sel;
wire dac_soe,dac_sdo,dac_sck;

dac_control dac_control
  (
  .wr(!nWe),
  .a(addr),
  .di(data),
  .do(dac_dout),
  .ck(dac_control_ck),
  .en(dac_en),
  .rs(rs),
  .sck(dac_sck),
  .sel0(dac0_sel),
  .sel1(dac1_sel),
  .sel2(dac2_sel),
  .sdi(dac_sdio),
  .sdo(dac_sdo),
  .soe(dac_soe)
  );

assign dac_sdio = dac_soe ? dac_sdo : 1'bz;
assign dac0_nCs = !dac0_sel;
assign dac1_nCs = !dac1_sel;
assign dac2_nCs = !dac2_sel; 
assign dac0_sclk = dac_sck;
assign dac1_sclk = dac_sck;
assign dac2_sclk = dac_sck;
assign dac_rst = rs;

//******************************************************************************
//                                Legacy Demod
//******************************************************************************

wire            nWr = nWe;
wire            rd  = !nCs & !nRd;
wire            wr0 = !nCs & !nWr & !addr1;
wire            wr1 = !nCs & !nWr & !addr1;
wire            wr2 = !nCs & !nWr & addr1;
wire            wr3 = !nCs & !nWr & addr1;
wire    [31:0]  dataIn = {data,data};

wire    [17:0]  dac0Out,dac1Out,dac2Out;
wire    [31:0]  demodDout;
demod demod( 
    .clk(ck933), .reset(rs), .syncIn(1'b1), 
    .rd(rd), .wr0(wr0),.wr1(wr1),.wr2(wr2),.wr3(wr3),
    .addr(addr),
    .din(dataIn),
    .dout(demodDout),
    .iRx({adc_d,4'h0}), .qRx(18'h0), 
    .iDataClk(iDataClk),
    .iBit(iBit),
    .qDataClk(qDataClk),
    .qBit(qBit),
    .dac0Sync(dac0Sync),
    .dac0Data(dac0Out),
    .dac1Sync(dac1Sync),
    .dac1Data(dac1Out),
    .dac2Sync(dac2Sync),
    .dac2Data(dac2Out)
    );


//******************************************************************************
//                              DAC Outputs
//******************************************************************************

reg dac0CS,dac1CS,dac2CS;
always @(addr) begin
    casex (addr)
        `INTERP0SPACE: begin
            dac0CS <= 1;
            dac1CS <= 0;
            dac2CS <= 0;
            end
        `INTERP1SPACE: begin
            dac0CS <= 0;
            dac1CS <= 1;
            dac2CS <= 0;
            end
        `INTERP2SPACE: begin
            dac0CS <= 0;
            dac1CS <= 0;
            dac2CS <= 1;
            end
        default: begin  
            dac0CS <= 0;
            dac1CS <= 0;
            dac2CS <= 0;
            end
        endcase
    end
wire    [31:0]  dac0Dout;
wire    [17:0]  dac0Data;
interpolate dac0Interp(
    .clk(ck933), .reset(rs), .clkEn(dac0Sync),
    .cs(dac0CS),
    .wr0(wr0), .wr1(wr1), .wr2(wr2), .wr3(wr3),
    .addr(addr),
    .din(dataIn),
    .dout(dac0Dout),
    .dataIn(dac0Out),
    .dataOut(dac0Data)
    );
assign dac0_d = dac0Data[17:4];
assign dac0_clk = ck933;

wire    [31:0]  dac1Dout;
wire    [17:0]  dac1Data;
interpolate dac1Interp(
    .clk(ck933), .reset(rs), .clkEn(dac1Sync),
    .cs(dac1CS),
    .wr0(wr0), .wr1(wr1), .wr2(wr2), .wr3(wr3),
    .addr(addr),
    .din(dataIn),
    .dout(dac1Dout),
    .dataIn(dac1Out),
    .dataOut(dac1Data)
    );
assign dac1_d = dac1Data[17:4];
assign dac1_clk = ck933;

wire    [31:0]  dac2Dout;
wire    [17:0]  dac2Data;
interpolate dac2Interp(
    .clk(ck933), .reset(rs), .clkEn(dac2Sync),
    .cs(dac2CS),
    .wr0(wr0), .wr1(wr1), .wr2(wr2), .wr3(wr3),
    .addr(addr),
    .din(dataIn),
    .dout(dac2Dout),
    .dataIn(dac2Out),
    .dataOut(dac2Data)
    );
assign dac2_d = dac2Data[17:4];
assign dac2_clk = ck933;




//******************************************************************************
//                                 GPIO
//******************************************************************************

reg gpio_space;
always @(addr) begin
  casex(addr)
    `GPIOSPACE: gpio_space <= 1;
    default: gpio_space <= 0;
  endcase
end
wire gpio_en = !nCs && gpio_space;

wire [15:0]gpio_q,gpio_dout;

gpio gpio
  (
  .wr(!nWe),
  .a(addr),
  .di(data),
  .do(gpio_dout),
  .en(gpio_en),
  .d(gpio_q),
  .q(gpio_q)
  );
  
assign bsync_nLock = gpio_q[0];
assign demod_nLock = gpio_q[1];  

//******************************************************************************
//                           Processor Read Data Mux
//******************************************************************************

reg [15:0] rd_mux;
always @(
    addr or 
    demodDout or
    gpio_dout or 
    dac_dout or
    misc_dout
    )begin
    casex(addr)
        `DEMODSPACE,    
        `DDCSPACE,      
        `CICDECSPACE,
        `BITSYNCSPACE,  
        `CHAGCSPACE, 
        `RESAMPSPACE,   
        `CARRIERSPACE,
        `CHAGCSPACE : begin
            if (addr[1]) begin
                rd_mux <= demodDout[31:16];
                end
            else begin
                rd_mux <= demodDout[15:0];
                end
            end
        `DAC_SPACE : rd_mux <= dac_dout;
        `MISC_SPACE : rd_mux <= misc_dout;    
        `GPIOSPACE: rd_mux <= gpio_dout;
        default : rd_mux <= 16'hxxxx;
        endcase
    end

assign data = (!nCs & !nRd) ? rd_mux : 16'hzzzz;

endmodule