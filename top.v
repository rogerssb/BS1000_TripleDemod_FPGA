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
  addr12,
  addr11,addr10,addr9,addr8,
  addr7,addr6,addr5,addr4,
  addr3,addr2,addr1,
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
  bsync_nLock,demod_nLock,
  symb_pll_ref,symb_pll_vco,symb_pll_fbk
  );

input nWe;
input ck933;
input nRd,nCs;
input addr12;
input addr11,addr10,addr9,addr8;
input addr7, addr6,addr5,addr4;
input addr3,addr2,addr1;
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
output symb_pll_ref,symb_pll_fbk;
input symb_pll_vco;

parameter VER_NUMBER = 16'h0003;

wire [11:0]addr = {addr11,addr10,addr9,addr8,addr7,addr6,addr5,addr4,addr3,addr2,addr1,1'b0};

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

reg reset;
reg rs0,rs1;
reg [2:0]resetCount;
always @(posedge ck933 or posedge rs) begin
  if (rs) begin
    rs0 <= 1;
    end
  else begin
    rs1 <= rs0;
    if (rs1) begin
      resetCount <= 5;
        reset <= 1;
        rs0 <= 0;
        end
    else if (resetCount != 0) begin
      resetCount <= resetCount - 1;
      reset <= 1;
      end
    else begin
      reset <= 0;
      end
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
  .rs(reset),
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
assign dac_rst = reset;

//******************************************************************************
//                              Reclock ADC Inputs
//******************************************************************************
// This should get these FFs into the IOB.

reg     [13:0]  ifInput;
always @(posedge ck933) begin
    ifInput <= adc_d;
    end

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

//`define DDS_ONLY
`ifdef DDS_ONLY

/******************************************************************************
                                Downconverter
******************************************************************************/
wire    [17:0]  iDdc,qDdc;
ddc ddc(
    .clk(ck933), .reset(reset), .syncIn(1'b1),
    .wr0(wr0) , .wr1(wr1), .wr2(wr2), .wr3(wr3),
    .addr(addr),
    .din(dataIn),
    .dout(demodDout),
    .ddcFreqOffset(32'h0),
    .offsetEn(1'b1),
    .nbAgcGain(21'h0),
    .syncOut(ddcSync),
    .iIn({ifInput,4'h0}), .qIn(18'h0),
    .iOut(dac0Out), .qOut(dac1Out)
    );

wire dac0Sync = ddcSync;
wire dac1Sync = ddcSync;
wire dac2Sync = ddcSync;
`else

demod demod(
    .clk(ck933), .reset(reset), .syncIn(1'b1),
    .wr0(wr0), .wr1(wr1), .wr2(wr2), .wr3(wr3),
    .addr(addr),
    .din(dataIn),
    .dout(demodDout),
    .iRx({ifInput,4'h0}), .qRx(18'h0),
    .dac0Sync(dac0Sync),
    .dac0Data(dac0Out),
    .dac1Sync(dac1Sync),
    .dac1Data(dac1Out),
    .dac2Sync(dac2Sync),
    .dac2Data(dac2Out),
    .iDataClk(iDataClk),
    .iBit(iBit),
    .qDataClk(qDataClk),
    .qBit(qBit),
    .symTimes2Sync(symTimes2Sync),
    .symSync(symSync)
    );
`endif


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

`define USE_INTERPOLATORS
`ifdef USE_INTERPOLATORS
wire    [31:0]  dac0Dout;
wire    [17:0]  dac0Data;
interpolate dac0Interp(
    .clk(ck933), .reset(reset), .clkEn(dac0Sync),
    .cs(dac0CS),
    .wr0(wr0), .wr1(wr1), .wr2(wr2), .wr3(wr3),
    .addr(addr),
    .din(dataIn),
    .dout(dac0Dout),
    .dataIn(dac0Out),
    .dataOut(dac0Data)
    );
FDCE dac0_d_0  (.Q(dac0_d[0]),   .C(ck933),  .CE(1'b1),  .CLR(1'b0), .D(dac0Data[4]));
FDCE dac0_d_1  (.Q(dac0_d[1]),   .C(ck933),  .CE(1'b1),  .CLR(1'b0), .D(dac0Data[5]));
FDCE dac0_d_2  (.Q(dac0_d[2]),   .C(ck933),  .CE(1'b1),  .CLR(1'b0), .D(dac0Data[6]));
FDCE dac0_d_3  (.Q(dac0_d[3]),   .C(ck933),  .CE(1'b1),  .CLR(1'b0), .D(dac0Data[7]));
FDCE dac0_d_4  (.Q(dac0_d[4]),   .C(ck933),  .CE(1'b1),  .CLR(1'b0), .D(dac0Data[8]));
FDCE dac0_d_5  (.Q(dac0_d[5]),   .C(ck933),  .CE(1'b1),  .CLR(1'b0), .D(dac0Data[9]));
FDCE dac0_d_6  (.Q(dac0_d[6]),   .C(ck933),  .CE(1'b1),  .CLR(1'b0), .D(dac0Data[10]));
FDCE dac0_d_7  (.Q(dac0_d[7]),   .C(ck933),  .CE(1'b1),  .CLR(1'b0), .D(dac0Data[11]));
FDCE dac0_d_8  (.Q(dac0_d[8]),   .C(ck933),  .CE(1'b1),  .CLR(1'b0), .D(dac0Data[12]));
FDCE dac0_d_9  (.Q(dac0_d[9]),   .C(ck933),  .CE(1'b1),  .CLR(1'b0), .D(dac0Data[13]));
FDCE dac0_d_10 (.Q(dac0_d[10]),  .C(ck933),  .CE(1'b1),  .CLR(1'b0), .D(dac0Data[14]));
FDCE dac0_d_11 (.Q(dac0_d[11]),  .C(ck933),  .CE(1'b1),  .CLR(1'b0), .D(dac0Data[15]));
FDCE dac0_d_12 (.Q(dac0_d[12]),  .C(ck933),  .CE(1'b1),  .CLR(1'b0), .D(dac0Data[16]));
FDCE dac0_d_13 (.Q(dac0_d[13]),  .C(ck933),  .CE(1'b1),  .CLR(1'b0), .D(~dac0Data[17]));
assign dac0_clk = ck933;

wire    [31:0]  dac1Dout;
wire    [17:0]  dac1Data;
interpolate dac1Interp(
    .clk(ck933), .reset(reset), .clkEn(dac1Sync),
    .cs(dac1CS),
    .wr0(wr0), .wr1(wr1), .wr2(wr2), .wr3(wr3),
    .addr(addr),
    .din(dataIn),
    .dout(dac1Dout),
    .dataIn(dac1Out),
    .dataOut(dac1Data)
    );
FDCE dac1_d_0  (.Q(dac1_d[0]),   .C(ck933),  .CE(1'b1),  .CLR(1'b0), .D(dac1Data[4]));
FDCE dac1_d_1  (.Q(dac1_d[1]),   .C(ck933),  .CE(1'b1),  .CLR(1'b0), .D(dac1Data[5]));
FDCE dac1_d_2  (.Q(dac1_d[2]),   .C(ck933),  .CE(1'b1),  .CLR(1'b0), .D(dac1Data[6]));
FDCE dac1_d_3  (.Q(dac1_d[3]),   .C(ck933),  .CE(1'b1),  .CLR(1'b0), .D(dac1Data[7]));
FDCE dac1_d_4  (.Q(dac1_d[4]),   .C(ck933),  .CE(1'b1),  .CLR(1'b0), .D(dac1Data[8]));
FDCE dac1_d_5  (.Q(dac1_d[5]),   .C(ck933),  .CE(1'b1),  .CLR(1'b0), .D(dac1Data[9]));
FDCE dac1_d_6  (.Q(dac1_d[6]),   .C(ck933),  .CE(1'b1),  .CLR(1'b0), .D(dac1Data[10]));
FDCE dac1_d_7  (.Q(dac1_d[7]),   .C(ck933),  .CE(1'b1),  .CLR(1'b0), .D(dac1Data[11]));
FDCE dac1_d_8  (.Q(dac1_d[8]),   .C(ck933),  .CE(1'b1),  .CLR(1'b0), .D(dac1Data[12]));
FDCE dac1_d_9  (.Q(dac1_d[9]),   .C(ck933),  .CE(1'b1),  .CLR(1'b0), .D(dac1Data[13]));
FDCE dac1_d_10 (.Q(dac1_d[10]),  .C(ck933),  .CE(1'b1),  .CLR(1'b0), .D(dac1Data[14]));
FDCE dac1_d_11 (.Q(dac1_d[11]),  .C(ck933),  .CE(1'b1),  .CLR(1'b0), .D(dac1Data[15]));
FDCE dac1_d_12 (.Q(dac1_d[12]),  .C(ck933),  .CE(1'b1),  .CLR(1'b0), .D(dac1Data[16]));
FDCE dac1_d_13 (.Q(dac1_d[13]),  .C(ck933),  .CE(1'b1),  .CLR(1'b0), .D(~dac1Data[17]));
assign dac1_clk = ck933;

wire    [31:0]  dac2Dout;
wire    [17:0]  dac2Data;
interpolate dac2Interp(
    .clk(ck933), .reset(reset), .clkEn(dac2Sync),
    .cs(dac2CS),
    .wr0(wr0), .wr1(wr1), .wr2(wr2), .wr3(wr3),
    .addr(addr),
    .din(dataIn),
    .dout(dac2Dout),
    .dataIn(dac2Out),
    .dataOut(dac2Data)
    );
FDCE dac2_d_0  (.Q(dac2_d[0]),   .C(ck933),  .CE(1'b1),  .CLR(1'b0), .D(dac2Data[4]));
FDCE dac2_d_1  (.Q(dac2_d[1]),   .C(ck933),  .CE(1'b1),  .CLR(1'b0), .D(dac2Data[5]));
FDCE dac2_d_2  (.Q(dac2_d[2]),   .C(ck933),  .CE(1'b1),  .CLR(1'b0), .D(dac2Data[6]));
FDCE dac2_d_3  (.Q(dac2_d[3]),   .C(ck933),  .CE(1'b1),  .CLR(1'b0), .D(dac2Data[7]));
FDCE dac2_d_4  (.Q(dac2_d[4]),   .C(ck933),  .CE(1'b1),  .CLR(1'b0), .D(dac2Data[8]));
FDCE dac2_d_5  (.Q(dac2_d[5]),   .C(ck933),  .CE(1'b1),  .CLR(1'b0), .D(dac2Data[9]));
FDCE dac2_d_6  (.Q(dac2_d[6]),   .C(ck933),  .CE(1'b1),  .CLR(1'b0), .D(dac2Data[10]));
FDCE dac2_d_7  (.Q(dac2_d[7]),   .C(ck933),  .CE(1'b1),  .CLR(1'b0), .D(dac2Data[11]));
FDCE dac2_d_8  (.Q(dac2_d[8]),   .C(ck933),  .CE(1'b1),  .CLR(1'b0), .D(dac2Data[12]));
FDCE dac2_d_9  (.Q(dac2_d[9]),   .C(ck933),  .CE(1'b1),  .CLR(1'b0), .D(dac2Data[13]));
FDCE dac2_d_10 (.Q(dac2_d[10]),  .C(ck933),  .CE(1'b1),  .CLR(1'b0), .D(dac2Data[14]));
FDCE dac2_d_11 (.Q(dac2_d[11]),  .C(ck933),  .CE(1'b1),  .CLR(1'b0), .D(dac2Data[15]));
FDCE dac2_d_12 (.Q(dac2_d[12]),  .C(ck933),  .CE(1'b1),  .CLR(1'b0), .D(dac2Data[16]));
FDCE dac2_d_13 (.Q(dac2_d[13]),  .C(ck933),  .CE(1'b1),  .CLR(1'b0), .D(~dac2Data[17]));
assign dac2_clk = ck933;

`else

FDCE dac0_d_0  (.Q(dac0_d[0]),   .C(ck933),  .CE(dac0Sync),  .CLR(1'b0), .D(dac0Out[4]));
FDCE dac0_d_1  (.Q(dac0_d[1]),   .C(ck933),  .CE(dac0Sync),  .CLR(1'b0), .D(dac0Out[5]));
FDCE dac0_d_2  (.Q(dac0_d[2]),   .C(ck933),  .CE(dac0Sync),  .CLR(1'b0), .D(dac0Out[6]));
FDCE dac0_d_3  (.Q(dac0_d[3]),   .C(ck933),  .CE(dac0Sync),  .CLR(1'b0), .D(dac0Out[7]));
FDCE dac0_d_4  (.Q(dac0_d[4]),   .C(ck933),  .CE(dac0Sync),  .CLR(1'b0), .D(dac0Out[8]));
FDCE dac0_d_5  (.Q(dac0_d[5]),   .C(ck933),  .CE(dac0Sync),  .CLR(1'b0), .D(dac0Out[9]));
FDCE dac0_d_6  (.Q(dac0_d[6]),   .C(ck933),  .CE(dac0Sync),  .CLR(1'b0), .D(dac0Out[10]));
FDCE dac0_d_7  (.Q(dac0_d[7]),   .C(ck933),  .CE(dac0Sync),  .CLR(1'b0), .D(dac0Out[11]));
FDCE dac0_d_8  (.Q(dac0_d[8]),   .C(ck933),  .CE(dac0Sync),  .CLR(1'b0), .D(dac0Out[12]));
FDCE dac0_d_9  (.Q(dac0_d[9]),   .C(ck933),  .CE(dac0Sync),  .CLR(1'b0), .D(dac0Out[13]));
FDCE dac0_d_10 (.Q(dac0_d[10]),  .C(ck933),  .CE(dac0Sync),  .CLR(1'b0), .D(dac0Out[14]));
FDCE dac0_d_11 (.Q(dac0_d[11]),  .C(ck933),  .CE(dac0Sync),  .CLR(1'b0), .D(dac0Out[15]));
FDCE dac0_d_12 (.Q(dac0_d[12]),  .C(ck933),  .CE(dac0Sync),  .CLR(1'b0), .D(dac0Out[16]));
FDCE dac0_d_13 (.Q(dac0_d[13]),  .C(ck933),  .CE(dac0Sync),  .CLR(1'b0), .D(~dac0Out[17]));
assign dac0_clk = ck933;

FDCE dac1_d_0  (.Q(dac1_d[0]),   .C(ck933),  .CE(dac1Sync),  .CLR(1'b0), .D(dac1Out[4]));
FDCE dac1_d_1  (.Q(dac1_d[1]),   .C(ck933),  .CE(dac1Sync),  .CLR(1'b0), .D(dac1Out[5]));
FDCE dac1_d_2  (.Q(dac1_d[2]),   .C(ck933),  .CE(dac1Sync),  .CLR(1'b0), .D(dac1Out[6]));
FDCE dac1_d_3  (.Q(dac1_d[3]),   .C(ck933),  .CE(dac1Sync),  .CLR(1'b0), .D(dac1Out[7]));
FDCE dac1_d_4  (.Q(dac1_d[4]),   .C(ck933),  .CE(dac1Sync),  .CLR(1'b0), .D(dac1Out[8]));
FDCE dac1_d_5  (.Q(dac1_d[5]),   .C(ck933),  .CE(dac1Sync),  .CLR(1'b0), .D(dac1Out[9]));
FDCE dac1_d_6  (.Q(dac1_d[6]),   .C(ck933),  .CE(dac1Sync),  .CLR(1'b0), .D(dac1Out[10]));
FDCE dac1_d_7  (.Q(dac1_d[7]),   .C(ck933),  .CE(dac1Sync),  .CLR(1'b0), .D(dac1Out[11]));
FDCE dac1_d_8  (.Q(dac1_d[8]),   .C(ck933),  .CE(dac1Sync),  .CLR(1'b0), .D(dac1Out[12]));
FDCE dac1_d_9  (.Q(dac1_d[9]),   .C(ck933),  .CE(dac1Sync),  .CLR(1'b0), .D(dac1Out[13]));
FDCE dac1_d_10 (.Q(dac1_d[10]),  .C(ck933),  .CE(dac1Sync),  .CLR(1'b0), .D(dac1Out[14]));
FDCE dac1_d_11 (.Q(dac1_d[11]),  .C(ck933),  .CE(dac1Sync),  .CLR(1'b0), .D(dac1Out[15]));
FDCE dac1_d_12 (.Q(dac1_d[12]),  .C(ck933),  .CE(dac1Sync),  .CLR(1'b0), .D(dac1Out[16]));
FDCE dac1_d_13 (.Q(dac1_d[13]),  .C(ck933),  .CE(dac1Sync),  .CLR(1'b0), .D(~dac1Out[17]));
assign dac1_clk = ck933;

FDCE dac2_d_0  (.Q(dac2_d[0]),   .C(ck933),  .CE(dac2Sync),  .CLR(1'b0), .D(dac2Out[4]));
FDCE dac2_d_1  (.Q(dac2_d[1]),   .C(ck933),  .CE(dac2Sync),  .CLR(1'b0), .D(dac2Out[5]));
FDCE dac2_d_2  (.Q(dac2_d[2]),   .C(ck933),  .CE(dac2Sync),  .CLR(1'b0), .D(dac2Out[6]));
FDCE dac2_d_3  (.Q(dac2_d[3]),   .C(ck933),  .CE(dac2Sync),  .CLR(1'b0), .D(dac2Out[7]));
FDCE dac2_d_4  (.Q(dac2_d[4]),   .C(ck933),  .CE(dac2Sync),  .CLR(1'b0), .D(dac2Out[8]));
FDCE dac2_d_5  (.Q(dac2_d[5]),   .C(ck933),  .CE(dac2Sync),  .CLR(1'b0), .D(dac2Out[9]));
FDCE dac2_d_6  (.Q(dac2_d[6]),   .C(ck933),  .CE(dac2Sync),  .CLR(1'b0), .D(dac2Out[10]));
FDCE dac2_d_7  (.Q(dac2_d[7]),   .C(ck933),  .CE(dac2Sync),  .CLR(1'b0), .D(dac2Out[11]));
FDCE dac2_d_8  (.Q(dac2_d[8]),   .C(ck933),  .CE(dac2Sync),  .CLR(1'b0), .D(dac2Out[12]));
FDCE dac2_d_9  (.Q(dac2_d[9]),   .C(ck933),  .CE(dac2Sync),  .CLR(1'b0), .D(dac2Out[13]));
FDCE dac2_d_10 (.Q(dac2_d[10]),  .C(ck933),  .CE(dac2Sync),  .CLR(1'b0), .D(dac2Out[14]));
FDCE dac2_d_11 (.Q(dac2_d[11]),  .C(ck933),  .CE(dac2Sync),  .CLR(1'b0), .D(dac2Out[15]));
FDCE dac2_d_12 (.Q(dac2_d[12]),  .C(ck933),  .CE(dac2Sync),  .CLR(1'b0), .D(dac2Out[16]));
FDCE dac2_d_13 (.Q(dac2_d[13]),  .C(ck933),  .CE(dac2Sync),  .CLR(1'b0), .D(~dac2Out[17]));
assign dac2_clk = ck933;

`endif

//******************************************************************************
//                                 Decoder
//******************************************************************************

reg decoder_space;
always @(addr) begin
  casex(addr)
    `DECODERSPACE: decoder_space <= 1;
    default: decoder_space <= 0;
  endcase
end

wire decoder_en = !nCs && decoder_space;
wire [15:0]decoder_dout;
wire [2:0]decoder_dout_i,decoder_dout_q;
wire decoder_cout_i,decoder_cout_q;
wire decoder_fifo_rs;

decoder decoder
  (
  .rs(reset),
  .en(decoder_en),
  .wr0(wr0),
  .wr1(wr1),
  .addr(addr),
  .din(data),
  .dout(decoder_dout),
  .ck933(ck933),
  .symb_clk_en(symSync),            // symbol rate clock enable
  .symb_clk_2x_en(symTimes2Sync),   // 2x symbol rate clock enable
  .symb_i({iBit,2'b0}),             // input, i
  .symb_q({qBit,2'b0}),             // input, q
  .dout_i(decoder_dout_i),          // output, i data
  .cout_i(decoder_cout_i),          // output, i & q clock
  .dout_q(decoder_dout_q),          // output, q data
  .cout_q(decoder_cout_q),          // output, q clock
  .fifo_rs(decoder_fifo_rs)
  );

//******************************************************************************
//                   Decoder Output FIFO and Symbol Clock PLL
//******************************************************************************

wire decoder_fifo_dout_i,decoder_fifo_dout_q;
wire decoder_fifo_empty,decoder_fifo_full,decoder_fifo_ren;
wire symb_pll_out;

decoder_output_fifo decoder_output_fifo
  (
  .din({decoder_dout_q[2],decoder_dout_i[2]}),
  .rd_clk(symb_pll_out),
  .rd_en(decoder_fifo_ren),
  .rst(decoder_fifo_rs),
  .wr_clk(decoder_cout_i),
  .wr_en(1'b1),
  .dout({decoder_fifo_dout_q,decoder_fifo_dout_i}),
  .empty(decoder_fifo_empty),
  .full(decoder_fifo_full),
  .prog_full(decoder_fifo_ren)
  );

reg pll_space;
always @(addr) begin
  casex(addr)
    `PLLSPACE: pll_space <= 1;
    default: pll_space <= 0;
  endcase
end

wire symb_pll_en = !nCs && pll_space;
wire [15:0]symb_pll_dout;

symb_pll symb_pll
  (
  .rs(reset),
  .en(symb_pll_en),
  .wr0(wr0),
  .wr1(wr1),
  .a(addr),
  .di(data),
  .do(symb_pll_dout),
  .clk(decoder_cout_i),
  .clk_en(1'b1),
  .clk_ref(symb_pll_ref),     // output pad, comparator reference clock
  .clk_vco(symb_pll_vco),     // input pad, vco output
  .clk_fbk(symb_pll_fbk),     // output pad, comparator feedback clock
  .clk_out(symb_pll_out)        // output, filtered symbol clock
  );

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
  misc_dout or
  decoder_dout or
  symb_pll_dout
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
    `DECODERSPACE: rd_mux <= decoder_dout;
    `PLLSPACE: rd_mux <= symb_pll_dout;
    default : rd_mux <= 16'hxxxx;
    endcase
  end

assign data = (!nCs & !nRd) ? rd_mux : 16'hzzzz;

endmodule