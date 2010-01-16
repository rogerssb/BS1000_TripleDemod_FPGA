//-----------------------------------------------------------------------------
// Project      SEMCO Multi-mode Demodulator
// Design       MultiH Top level
// Created      12/7/09
//-----------------------------------------------------------------------------
// 1.0      Initial coding
//
//
//-----------------------------------------------------------------------------

`timescale 1ns/100ps
`include "addressMap.v"
`include "defines.v"

module multihTop (
    ck933,
    nWe,nRd,nCs,
    addr12,
    addr11,addr10,addr9,addr8,
    addr7,addr6,addr5,addr4,
    addr3,addr2,addr1,
    data,
    dac_rst,
    dac_sdio,
    demodMode,
    dac0Select,dac1Select,dac2Select,
    dac0Data,dac1Data,dac2Data,
    multiHSymEn,multiHSym2xEn,
    iMultiH,qMultiH,
    dataSymEn,dataSym2xEn,
    iData,qData,
    auSymClk,
    bsyncLockInput,demodLockInput,
    sdiInput,
    dac0_nCs,dac0_sclk,
    dac1_nCs,dac1_sclk,
    dac2_nCs,dac2_sclk,
    dac0_d,dac1_d,dac2_d,
    dac0_clk,dac1_clk,dac2_clk,
    cout_i,dout_i, 
    cout_q,dout_q, 
    bsync_nLock,demod_nLock,
    symb_pll_ref,symb_pll_vco,symb_pll_fbk,
    sdiOut
    );

input           nWe;
input           ck933;
input           nRd,nCs;
input           addr12;
input           addr11,addr10,addr9,addr8;
input           addr7, addr6,addr5,addr4;
input           addr3,addr2,addr1;
inout   [15:0]  data;
inout           dac_sdio;
input   [3:0]   demodMode;
input   [3:0]   dac0Select,dac1Select,dac2Select;
input   [13:0]  dac0Data,dac1Data,dac2Data;
input           multiHSymEn,multiHSym2xEn;
input   [17:0]  iMultiH,qMultiH;
input           dataSymEn,dataSym2xEn;
input           iData,qData;
input           auSymClk;
input           bsyncLockInput,demodLockInput;
input           sdiInput;

output          dac_rst;
output          dac0_nCs,dac0_sclk;
output          dac1_nCs,dac1_sclk;
output          dac2_nCs,dac2_sclk;
output  [13:0]  dac0_d,dac1_d,dac2_d;
output          dac0_clk,dac1_clk,dac2_clk;
output          cout_i,dout_i; 
output          cout_q,dout_q; 
output          bsync_nLock,demod_nLock;
output          symb_pll_ref,symb_pll_fbk;
input           symb_pll_vco;

output          sdiOut;

parameter VER_NUMBER = 16'h0079;

wire    [11:0]  addr = {addr11,addr10,addr9,addr8,addr7,addr6,addr5,addr4,addr3,addr2,addr1,1'b0};

//******************************************************************************
//                               Pass Throughs
//******************************************************************************
assign bsync_nLock = bsyncLockInput;
assign demod_nLock = demodLockInput;

//******************************************************************************
//                               Reclock Inputs
//******************************************************************************
reg     [13:0]  dac0DataIn, dac1DataIn, dac2DataIn;
reg             multiHSymEnIn,multiHSym2xEnIn;
reg     [17:0]  iMultiHIn,qMultiHIn;
reg             dataSymEnIn,dataSym2xEnIn;
reg             iDataIn,qDataIn;
reg             auSymClkIn;
always @(posedge ck933) begin
    dac0DataIn <= dac0Data;
    dac1DataIn <= dac1Data;
    dac2DataIn <= dac2Data;
    multiHSymEnIn <= multiHSymEn;
    multiHSym2xEnIn <= multiHSym2xEn;
    iMultiHIn <= iMultiH;
    qMultiHIn <= qMultiH;
    dataSymEnIn <= dataSymEn;
    dataSym2xEnIn <= dataSym2xEn;
    iDataIn <= iData;
    qDataIn <= qData;
    auSymClkIn <= auSymClk;
    end


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

// MISCSPACE Reads
reg     [31:0]  misc_dout;
reg rs;
always @(addr or misc_en) begin
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

assign sdiOut = sdiInput;
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

//******************************************************************************
//                                 Trellis Decoder
//******************************************************************************
wire    [1:0]   multihBit;
wire    [17:0]  multih0Out,multih1Out,multih2Out;
wire    [31:0]  multih_dout;
trellisMultiH multih
    (
    .clk(ck933),
    .reset(reset),
    .symEn(multiHSymEnIn),
    .sym2xEn(multiHSym2xEn),
    .iIn(iMultiHIn),
    .qIn(qMultiHIn),
    .wr0(wr0),
    .wr1(wr1),
    .wr2(wr2),
    .wr3(wr3),
    .addr(addr),
    .din(dataIn),
    .dout(multih_dout),
    .dac0Select(dac0Select),
    .dac1Select(dac1Select),
    .dac2Select(dac2Select),
    .dac0Sync(multih0Sync),
    .dac0Data(multih0Out),
    .dac1Sync(multih1Sync),
    .dac1Data(multih1Out),
    .dac2Sync(multih2Sync),
    .dac2Data(multih2Out),
    .quadrarySymEnOut(multihSymEnOut),
    .quadrarySym2xEnOut(multihSym2xEnOut),
    .decision(multihBit)
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
            dac0Out <= multih0Out;
            dac0Sync <= multih0Sync;
            end
        default: begin
            dac0Out <= dac0DataIn;
            dac0Sync <= 1;
            end
        endcase
    case (dac1Select) 
        `DAC_TRELLIS_I,
        `DAC_TRELLIS_Q,
        `DAC_TRELLIS_PHERR,
        `DAC_TRELLIS_INDEX: begin
            dac1Out <= multih1Out;
            dac1Sync <= multih1Sync;
            end
        default: begin
            dac1Out <= dac1DataIn;
            dac1Sync <= 1;
            end
        endcase
    case (dac2Select)
        `DAC_TRELLIS_I,
        `DAC_TRELLIS_Q,
        `DAC_TRELLIS_PHERR,
        `DAC_TRELLIS_INDEX: begin
            dac2Out <= multih2Out;
            dac2Sync <= multih2Sync;
            end
        default: begin
            dac2Out <= dac2DataIn;
            dac2Sync <= 1;
            end
        endcase
    end


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

wire trellisEn = (demodMode == `MODE_MULTIH);
reg iDec,qDec;
reg decoderSymEn;
reg decoderSym2xEn;
reg iLegacy;
reg qLegacy;
reg legacySymEn;
reg legacySym2xEn;
always @(posedge ck933) begin
    iLegacy <= iDataIn;
    qLegacy <= qDataIn;
    legacySymEn <= dataSymEnIn;
    legacySym2xEn <= dataSym2xEnIn;
    if (trellisEn) begin
        iDec <= multihBit[0]; 
        qDec <= multihBit[1];
        decoderSymEn <= multihSymEnOut;
        decoderSym2xEn <= multihSym2xEnOut;
        end
    else begin
        iDec <= iLegacy; 
        qDec <= qLegacy;
        decoderSymEn <= legacySymEn;
        decoderSym2xEn <= legacySym2xEn;
        end
    end

wire [2:0]decoder_iIn = {iDec,2'b0}; 
wire [2:0]decoder_qIn = {qDec,2'b0};
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
  .clk(ck933),
  .clk_en(decoder_cout),
  .clk_ref(pllRef),           // output pad, comparator reference clock
  .clk_vco(symb_pll_vco),     // input pad, vco output
  .clk_fbk(symb_pll_fbk),     // output pad, comparator feedback clock
  .clk_out(symb_pll_out)      // output, symbol clock
  );

reg symb_pll_ref;
always @(posedge ck933) begin
    symb_pll_ref <= pllRef;
    end

//`define DIRECT_DATA
`ifdef DIRECT_DATA
assign cout_i = decoder_cout;
assign dout_i = decoder_dout_i;
assign cout_q = symb_pll_out;
assign dout_q = decoder_dout_q;
`else
wire cout = symb_pll_out ^ !cout_inv;
assign cout_i = cout;
reg cout_q;
always @(demodMode or auSymClkIn or cout) begin
    case (demodMode)
        `MODE_AUQPSK:   cout_q = auSymClkIn;
        default:        cout_q = cout;
        endcase
    end

reg dout_i,decQ;
always @(posedge symb_pll_out)begin
  dout_i <= decoder_fifo_dout_i;
  decQ <= decoder_fifo_dout_q;
  end
reg dout_q;
always @(demodMode or qDataIn or decQ) begin
    case (demodMode)
        `MODE_AUQPSK:   dout_q = qDataIn;
        default:        dout_q = decQ;
        endcase
    end
`endif

//******************************************************************************
//                           Processor Read Data Mux
//******************************************************************************

reg [15:0] rd_mux;
always @(
  addr or
  dac_dout or
  misc_dout or
  decoder_dout or
  symb_pll_dout or
  multih_dout
  )begin
  casex(addr)
    `TRELLISLFSPACE,
    `TRELLIS_SPACE: begin
      if (addr[1]) begin
        rd_mux <= multih_dout[31:16];
        end
      else begin
        rd_mux <= multih_dout[15:0];
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
    default : rd_mux <= 16'hxxxx;
    endcase
  end

assign data = (!nCs & !nRd) ? rd_mux : 16'hzzzz;

endmodule
                                                
