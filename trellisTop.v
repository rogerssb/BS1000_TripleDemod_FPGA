//-----------------------------------------------------------------------------
// Project      SEMCO Multi-mode Demodulator
// Design       Trellis Top level
// Created      04/24/09
//-----------------------------------------------------------------------------
// 1.0      Initial coding
//
//
//-----------------------------------------------------------------------------

`timescale 1ns/100ps
`include "addressMap.v"
`include "defines.v"

module trellisTop
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
  cout_i, 
  dout_i, 
  cout_q, 
  dout_q, 
  sdiOut,
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
output cout_i,dout_i; 
output cout_q,dout_q; 
output bsync_nLock,demod_nLock;
output symb_pll_ref,symb_pll_fbk;
input symb_pll_vco;
output  sdiOut;

parameter VER_NUMBER = 16'h007d;

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

// MISCSPACE Writes
reg             clockCounterEn;
reg             startClockCounter;
always @(posedge nWe or posedge clockCounterEn) begin
    if (clockCounterEn) begin
        startClockCounter <= 0;
        end
    else if (misc_en) begin
        casex (addr) 
            `MISC_CLOCK:    startClockCounter <= 1;
            endcase
        end
    end

// MISCSPACE Reads
reg     [31:0]  misc_dout;
reg     [31:0]  clockCounterHold;
reg rs;
always @(addr or misc_en or clockCounterHold) begin
  if(misc_en) begin
    casex (addr)
            `MISC_RESET: begin
                rs <= 1;
                misc_dout <= 32'b0;
                end
            `MISC_VERSION: begin
                rs <= 0;
                misc_dout <= {VER_NUMBER,16'b0};
                end
            `MISC_CLOCK: begin
                rs <= 0;
                misc_dout <= clockCounterHold;
                end
            default: begin
                misc_dout <= 32'b0;
                rs <= 0;
                end
    endcase
    end else begin
        rs <= 0;
        misc_dout <= 32'b0;
    end

end

reg     [31:0]  clockCounter;
reg             sc0,sc1;
reg             me0,me1;
always @(posedge ck933) begin
    sc0 <= startClockCounter;
    sc1 <= sc0;
    if (sc0 & !sc1) begin
        clockCounterEn <= 1;
        clockCounter <= 0;
        end
    else begin
        clockCounterEn <= 0;
        clockCounter <= clockCounter + 1;
        end
    me0 <= misc_en;
    me1 <= me0;
    if (me0 & !me1) begin
        clockCounterHold <= clockCounter;
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

wire    [17:0]  demod0Out,demod1Out,demod2Out;
wire    [31:0]  demodDout;
wire    [3:0]   demodMode;

wire    [3:0]   dac0Select,dac1Select,dac2Select;
wire    [17:0]  iSymData,qSymData;
wire            iBit,qBit;
demod demod(
    .clk(ck933), .reset(reset), .syncIn(1'b1),
    .wr0(wr0), .wr1(wr1), .wr2(wr2), .wr3(wr3),
    .addr(addr),
    .din(dataIn),
    .dout(demodDout),
    .demodMode(demodMode),
    .iRx({ifInput,4'h0}), .qRx(18'h0),
    .dac0Select(dac0Select),
    .dac1Select(dac1Select),
    .dac2Select(dac2Select),
    .dac0Sync(demod0Sync),
    .dac0Data(demod0Out),
    .dac1Sync(demod1Sync),
    .dac1Data(demod1Out),
    .dac2Sync(demod2Sync),
    .dac2Data(demod2Out),
    .iSym2xEn(iSym2xEn),
    .iSymEn(iSymEn),
    .iBit(iBit),
    .qSym2xEn(qSym2xEn),
    .qSymEn(qSymEn),
    .qSymClk(qSymClk),
    .qBit(qBit),
    .bitsyncLock(bitsyncLock),
    .carrierLock(carrierLock),
    .trellisSymSync(trellisSymSync),
    .iTrellis(iSymData),
    .qTrellis(qSymData)
    );


assign bsync_nLock = !bitsyncLock;
assign demod_nLock = !carrierLock;

//******************************************************************************
//                                 Trellis Decoder
//******************************************************************************
reg     symEn,sym2xEn;
reg     [17:0]iIn,qIn;
always @(posedge ck933) begin
    symEn <= trellisSymSync;
    sym2xEn <= iSym2xEn;
    iIn <= iSymData;
    qIn <= qSymData;
    end



wire    [17:0]  trellis0Out,trellis1Out,trellis2Out;
wire    [4:0]   index;
wire    [31:0]  trellis_dout;
trellis trellis(
    .clk(ck933),
    .reset(reset),
    .symEn(symEn),
    .sym2xEn(sym2xEn),
    .iIn(iIn),
    .qIn(qIn),
    .legacyBit(!iBit),
    .wr0(wr0),
    .wr1(wr1),
    .wr2(wr2),
    .wr3(wr3),
    .addr(addr),
    .din(dataIn),
    .dout(trellis_dout),
    .dac0Select(dac0Select),
    .dac1Select(dac1Select),
    .dac2Select(dac2Select),
    .dac0Sync(trellis0Sync),
    .dac0Data(trellis0Out),
    .dac1Sync(trellis1Sync),
    .dac1Data(trellis1Out),
    .dac2Sync(trellis2Sync),
    .dac2Data(trellis2Out),
    .symEnOut(trellisSymEn),
    .sym2xEnOut(trellisSym2xEn),
    .decision(trellisBit)
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

reg     [17:0]  dac0Out,dac1Out,dac2Out;
reg             dac0Sync,dac1Sync,dac2Sync;
always @(posedge ck933) begin
    case (dac0Select) 
        `DAC_TRELLIS_I,
        `DAC_TRELLIS_Q,
        `DAC_TRELLIS_PHERR,
        `DAC_TRELLIS_INDEX: begin
            dac0Out <= trellis0Out;
            dac0Sync <= trellis0Sync;
            end
        default: begin
            dac0Out <= demod0Out;
            dac0Sync <= demod0Sync;
            end
        endcase
    case (dac1Select) 
        `DAC_TRELLIS_I,
        `DAC_TRELLIS_Q,
        `DAC_TRELLIS_PHERR,
        `DAC_TRELLIS_INDEX: begin
            dac1Out <= trellis1Out;
            dac1Sync <= trellis1Sync;
            end
        default: begin
            dac1Out <= demod1Out;
            dac1Sync <= demod1Sync;
            end
        endcase
    case (dac2Select)
        `DAC_TRELLIS_I,
        `DAC_TRELLIS_Q,
        `DAC_TRELLIS_PHERR,
        `DAC_TRELLIS_INDEX: begin
            dac2Out <= trellis2Out;
            dac2Sync <= trellis2Sync;
            end
        default: begin
            dac2Out <= demod2Out;
            dac2Sync <= demod2Sync;
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

//`define DIRECT_OUTPUTS
`ifdef DIRECT_OUTPUTS
reg cout_i;
reg dout_i;
reg cout_q;
reg dout_q;
always @(posedge ck933) begin
    cout_i <= trellisSymEn;
    dout_i <= trellisBit;
    cout_q <= iSymEn;
    dout_q <= iBit;
    end

wire [15:0]decoder_dout = 16'b0;
wire [15:0]symb_pll_dout = 16'b0;

`else
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
wire decoder_dout_i,decoder_dout_q;
wire decoder_cout;
wire decoder_fifo_rs;
wire cout_inv;

wire trellisEn = (demodMode == `MODE_PCMTRELLIS);
wire [2:0]decoder_iIn = trellisEn ? {trellisBit,2'b0} : {iBit,2'b0}; 
wire [2:0]decoder_qIn = {qBit,2'b0};
wire decoderSymEn = trellisEn ? trellisSymEn : iSymEn;
wire decoderSym2xEn = trellisEn ? trellisSym2xEn : iSym2xEn;

decoder decoder
  (
  .rs(reset),
  .en(decoder_en),
  .wr0(wr0),
  .wr1(wr1),
  .addr(addr),
  .din(data),
  .dout(decoder_dout),
  .clk(ck933),
  .symb_clk_en(decoderSymEn),       // symbol rate clock enable
  .symb_clk_2x_en(decoderSym2xEn),  // 2x symbol rate clock enable
  .symb_i(decoder_iIn),             // input, i
  .symb_q(decoder_qIn),             // input, q
  //.symb_clk_en(iSymEn),       // symbol rate clock enable
  //.symb_clk_2x_en(iSym2xEn),  // 2x symbol rate clock enable
  //.symb_i({iBit,2'b0}),             // input, i
  //.symb_q({qBit,2'b0}),             // input, q
  .dout_i(decoder_dout_i),          // output, i data
  .dout_q(decoder_dout_q),          // output, q data
  .cout(decoder_cout),              // output, i/q clock
  .fifo_rs(decoder_fifo_rs),
  .clk_inv(cout_inv)
  );

//******************************************************************************
//                   Decoder Output FIFO and Symbol Clock PLL
//******************************************************************************

wire decoder_fifo_dout_i,decoder_fifo_dout_q;
wire decoder_fifo_empty,decoder_fifo_full,decoder_fifo_ren;
wire symb_pll_out;

decoder_output_fifo decoder_output_fifo
  (
  .din({decoder_dout_q,decoder_dout_i}),
  .rd_clk(symb_pll_out),
  .rd_en(decoder_fifo_ren),
  .rst(decoder_fifo_rs),
  .wr_clk(ck933),
  .wr_en(decoder_cout),
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
  .wr2(wr2),
  .wr3(wr3),
  .a(addr),
  .di(dataIn),
  .do(symb_pll_dout),
  .clk(decoder_cout),
  .clk_en(1'b1),
  .clk_ref(symb_pll_ref),     // output pad, comparator reference clock
  .clk_vco(symb_pll_vco),     // input pad, vco output
  .clk_fbk(symb_pll_fbk),     // output pad, comparator feedback clock
  .clk_out(symb_pll_out)      // output, symbol clock
  );

wire cout = symb_pll_out ^ !cout_inv;
assign cout_i = cout;
assign cout_q = (demodMode == `MODE_AUQPSK) ? qSymClk : cout;

reg dout_i,decQ;
always @(negedge cout)begin
  dout_i <= decoder_fifo_dout_i;
  decQ <= decoder_fifo_dout_q;
  end
assign dout_q = (demodMode == `MODE_AUQPSK) ? qBit : decQ;
`endif

//******************************************************************************
//                        SDI Output Interface
//******************************************************************************

wire    [31:0]  sdiDout;
sdi sdi(
    .clk(ck933),
    .reset(reset),
    .wr0(wr0),
    .wr1(wr1),
    .wr2(wr2),
    .wr3(wr3),
    .addr(addr),
    .dataIn(dataIn),
    .dataOut(sdiDout),
    .iSymEn(iSymEn),
    .iSymData(iSymData),
    .qSymEn(qSymEn),
    .qSymData(qSymData),
    .sdiOut(sdiOut)
    );


//******************************************************************************
//                           Processor Read Data Mux
//******************************************************************************

reg [15:0] rd_mux;
always @(
  addr or
  demodDout or
  dac0Dout or dac1Dout or dac2Dout or
  dac_dout or
  misc_dout or
  decoder_dout or
  symb_pll_dout or
  trellis_dout or
  sdiDout
  )begin
  casex(addr)
    `DEMODSPACE,
    `DDCSPACE,
    `CICDECSPACE,
    `BITSYNCSPACE,
    `BITSYNCAUSPACE,
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
    `INTERP0SPACE: begin
      if (addr[1]) begin
        rd_mux <= dac0Dout[31:16];
        end
      else begin
        rd_mux <= dac0Dout[15:0];
        end
      end
    `INTERP1SPACE: begin
      if (addr[1]) begin
        rd_mux <= dac1Dout[31:16];
        end
      else begin
        rd_mux <= dac1Dout[15:0];
        end
      end
    `INTERP2SPACE: begin
      if (addr[1]) begin
        rd_mux <= dac2Dout[31:16];
        end
      else begin
        rd_mux <= dac2Dout[15:0];
        end
      end
    `TRELLISLFSPACE,
    `TRELLIS_SPACE: begin
      if (addr[1]) begin
        rd_mux <= trellis_dout[31:16];
        end
      else begin
        rd_mux <= trellis_dout[15:0];
        end
      end
    `DAC_SPACE : rd_mux <= dac_dout;
    `MISC_SPACE : begin
        if (addr[1]) begin
            rd_mux <= misc_dout[31:16];
            end
        else begin
            rd_mux <= misc_dout[15:0];
            end
        end
    `DECODERSPACE: rd_mux <= decoder_dout;
    `PLLSPACE: rd_mux <= symb_pll_dout;
    `UARTSPACE,
    `SDISPACE: begin
        if (addr[1]) begin
            rd_mux <= sdiDout[31:16];
            end
        else begin
            rd_mux <= sdiDout[15:0];
            end
        end
    default : rd_mux <= 16'hxxxx;
    endcase
  end

assign data = (!nCs & !nRd) ? rd_mux : 16'hzzzz;

endmodule
