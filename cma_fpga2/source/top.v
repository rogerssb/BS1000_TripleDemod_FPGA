`timescale 1ns/100ps
`include "addressMap.v"
`include "defines.v"

module top (
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
    sdiOut,
    demod0Data,demod0Sync,
    demod1Data,demod1Sync,
    demod2Data,demod2Sync,

    // decoder group
    iData,qData,
    dataSymEn,dataSym2xEn,

    // trellis group
    iSymData_pad,
    qSymData_pad,
    trellisSymSync_pad,
    iSym2xEn_pad,
    legacyBit_pad
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
input           auSymClk;
input           bsyncLockInput,demodLockInput;
input           sdiInput;
input   [17:0]  iSymData_pad ;
input   [17:0]  qSymData_pad;
input   [13:0]  demod0Data,demod1Data,demod2Data;
input           demod0Sync,demod1Sync,demod2Sync;
input           trellisSymSync_pad ;
input           dataSymEn,dataSym2xEn;
input           iSym2xEn_pad ;
input           iData,qData;

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
input           legacyBit_pad ;

parameter VER_NUMBER = 16'h014A;

// 12 Jun 13
// IOB reclocking of inputs to trellis
reg             legacyBit ;
always @ (posedge ck933) begin
    legacyBit <= legacyBit_pad ;
    end
reg             trellisSymSync ;
always @ (posedge ck933) begin
    trellisSymSync <= trellisSymSync_pad ;
    end
reg             iSym2xEn ;
always @ (posedge ck933) begin
    iSym2xEn <= iSym2xEn_pad ;
    end
reg     [17:0]  iSymData ;
reg     [17:0]  qSymData;
always @ (posedge ck933) begin
    iSymData <= iSymData_pad ;
    qSymData <= qSymData_pad ;
    end

wire    [11:0]  addr = {addr11,addr10,addr9,addr8,addr7,addr6,addr5,addr4,addr3,addr2,addr1,1'b0};
wire            nWr = nWe;
wire            rd  = !nCs & !nRd;
wire            wr0 = !nCs & !nWr & !addr1;
wire            wr1 = !nCs & !nWr & !addr1;
wire            wr2 = !nCs & !nWr & addr1;
wire            wr3 = !nCs & !nWr & addr1;
wire    [31:0]  dataIn = {data,data};
//******************************************************************************
//                               Pass Throughs
//******************************************************************************
assign bsync_nLock = bsyncLockInput;
assign demod_nLock = demodLockInput;
//******************************************************************************
//                               Miscellaneous
//******************************************************************************
reg reset;
reg misc_space;
always @(addr) begin
  casex(addr)
    `MISC_SPACE: misc_space <= 1;
    default:     misc_space <= 0;
  endcase
end
wire misc_en = !nCs && misc_space;

boot_manager bm(
    .rst(reset),
    .clk(ck933),
    .ena(misc_en),
    .wr0(wr0),
    .wr2(wr2),
    .addr(addr),
    .data(dataIn[15 : 0])
    );

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
//                            Processor Interface
//******************************************************************************
reg interp0CS,interp1CS,interp2CS;
always @(addr) begin
    casex (addr)
        `INTERP0SPACE: begin
            interp0CS <= 1;
            interp1CS <= 0;
            interp2CS <= 0;
            end
        `INTERP1SPACE: begin
            interp0CS <= 0;
            interp1CS <= 1;
            interp2CS <= 0;
            end
        `INTERP2SPACE: begin
            interp0CS <= 0;
            interp1CS <= 0;
            interp2CS <= 1;
            end
        default: begin
            interp0CS <= 0;
            interp1CS <= 0;
            interp2CS <= 0;
            end
        endcase
    end
//******************************************************************************
//                              Demod Outputs
//******************************************************************************
wire  pcmTrellisMode = (demodMode == `MODE_PCMTRELLIS);
wire  soqpskTrellisMode = (demodMode == `MODE_SOQPSK);

reg  pcmSymEn,soqpskSymEn;
reg  pcmSym2xEn,soqpskSym2xEn;
reg [17:0]  iIn,qIn;
reg  [13:0]demod0DataReg;
reg  demod0SyncReg;
reg  [17:0]demod1DataReg;
reg  demod1SyncReg;
reg  [17:0]demod2DataReg;
reg  demod2SyncReg;
reg  iBitReg,qBitReg;
reg  dataSymEnReg,dataSym2xEnReg;

always @(posedge ck933) begin
    pcmSymEn <= trellisSymSync & pcmTrellisMode;
    pcmSym2xEn <= iSym2xEn & pcmTrellisMode;
    soqpskSymEn <= trellisSymSync & soqpskTrellisMode;
    soqpskSym2xEn <= iSym2xEn & soqpskTrellisMode;
    iIn <= iSymData;
    qIn <= qSymData;
    demod0DataReg <= demod0Data;
    demod0SyncReg <= demod0Sync;
    demod1DataReg <= demod1Data;
    demod1SyncReg <= demod1Sync;
    demod2DataReg <= demod2Data;
    demod2SyncReg <= demod2Sync;

    iBitReg <= iData;
    qBitReg <= qData;
    dataSymEnReg <= dataSymEn ;
    dataSym2xEnReg <= dataSym2xEn ;
    end

reg  trellisSymEn,trellisSym2xEn,trellisBit;
wire trellisEn = (pcmTrellisMode || (demodMode == `MODE_SOQPSK));

//******************************************************************************
//                             PCM Trellis Decoder
//******************************************************************************
wire    [17:0]  pcmTrellis0Out,pcmTrellis1Out,pcmTrellis2Out;
wire    [31:0]  pcmTrellisDout;

trellis trellis(
    .clk(ck933),
    .reset(reset),
    .symEn(pcmSymEn),
    .sym2xEn(pcmSym2xEn),
    .iIn(iIn),
    .qIn(qIn),
    .legacyBit(legacyBit),
    `ifdef INTERNAL_ADAPT
    .avgDeviation(avgDeviation),
    `endif
    .wr0(wr0),
    .wr1(wr1),
    .wr2(wr2),
    .wr3(wr3),
    .addr(addr),
    .din(dataIn),
    .dout(pcmTrellisDout),
    .dac0Select(dac0Select),
    .dac1Select(dac1Select),
    .dac2Select(dac2Select),
    .dac0Sync(pcmTrellis0Sync),
    .dac0Data(pcmTrellis0Out),
    .dac1Sync(pcmTrellis1Sync),
    .dac1Data(pcmTrellis1Out),
    .dac2Sync(pcmTrellis2Sync),
    .dac2Data(pcmTrellis2Out),
    .symEnOut(pcmTrellisSymEn),
    .sym2xEnOut(pcmTrellisSym2xEn),
    .decision(pcmTrellisBit)
    );
//******************************************************************************
//                           SOQPSK Trellis Decoder
//******************************************************************************
wire    [17:0]  soqpskTrellis0Out,soqpskTrellis1Out,soqpskTrellis2Out;
wire    [31:0]  soqpskTrellisDout;
trellisSoqpsk soqpsk
    (
    .clk(ck933),
    .reset(reset),
    .symEn(soqpskSymEn),
    .sym2xEn(soqpskSym2xEn),
    .iIn(iIn),
    .qIn(qIn),
    .wr0(wr0),
    .wr1(wr1),
    .wr2(wr2),
    .wr3(wr3),
    .addr(addr),
    .din(dataIn),
    .dout(soqpskTrellisDout),
    .dac0Select(dac0Select),
    .dac1Select(dac1Select),
    .dac2Select(dac2Select),
    .dac0Sync(soqpskTrellis0Sync),
    .dac0Data(soqpskTrellis0Out),
    .dac1Sync(soqpskTrellis1Sync),
    .dac1Data(soqpskTrellis1Out),
    .dac2Sync(soqpskTrellis2Sync),
    .dac2Data(soqpskTrellis2Out),
    .ternarySymEnOut(soqpskTrellisSymEn),
    .ternarySym2xEnOut(soqpskTrellisSym2xEn),
    .decision(soqpskTrellisBit)
   );

// The pcmTrellisBit is inverted to correct a polarity problem of the data.
// This is the wrong place to fix this, but Semco wanted it done in the
// FPGA rather than in software configuration somewhere else.

always @(posedge ck933) begin
    trellisSymEn <= pcmTrellisMode ? pcmTrellisSymEn : soqpskTrellisSymEn;
    trellisSym2xEn <= pcmTrellisMode ? pcmTrellisSym2xEn : soqpskTrellisSym2xEn;
    trellisBit <= pcmTrellisMode ? !pcmTrellisBit : soqpskTrellisBit;
    end

//******************************************************************************
//                          Trellis Output Selection
//******************************************************************************
wire [31:0] trellisDout = pcmTrellisMode ? pcmTrellisDout : soqpskTrellisDout;
wire [17:0] trellis0Out = pcmTrellisMode ? pcmTrellis0Out : soqpskTrellis0Out;
wire        trellis0Sync = pcmTrellisMode ? pcmTrellis0Sync : soqpskTrellis0Sync;
wire [17:0] trellis1Out = pcmTrellisMode ? pcmTrellis1Out : soqpskTrellis1Out;
wire        trellis1Sync = pcmTrellisMode ? pcmTrellis1Sync : soqpskTrellis1Sync;
wire [17:0] trellis2Out = pcmTrellisMode ? pcmTrellis2Out : soqpskTrellis2Out;
wire        trellis2Sync = pcmTrellisMode ? pcmTrellis2Sync : soqpskTrellis2Sync;
reg  [17:0] interp0DataIn,interp1DataIn,interp2DataIn;
reg         dac0Sync,dac1Sync,dac2Sync;

always @(posedge ck933) begin
    case (dac0Select)
        `DAC_TRELLIS_I,
        `DAC_TRELLIS_Q,
        `DAC_TRELLIS_PHERR,
        `DAC_TRELLIS_INDEX: begin
            interp0DataIn <= trellis0Out;
            dac0Sync <= trellis0Sync;
            end
        default: begin
            interp0DataIn <= {demod0DataReg,4'h0};
            dac0Sync <= demod0SyncReg;
            end
        endcase
    case (dac1Select)
        `DAC_TRELLIS_I,
        `DAC_TRELLIS_Q,
        `DAC_TRELLIS_PHERR,
        `DAC_TRELLIS_INDEX: begin
            interp1DataIn <= trellis1Out;
            dac1Sync <= trellis1Sync;
            end
        default: begin
            interp1DataIn <= {demod1DataReg,4'h0};
            dac1Sync <= demod1SyncReg;
            end
        endcase
    case (dac2Select)
        `DAC_TRELLIS_I,
        `DAC_TRELLIS_Q,
        `DAC_TRELLIS_PHERR,
        `DAC_TRELLIS_INDEX: begin
            interp2DataIn <= trellis2Out;
            dac2Sync <= trellis2Sync;
            end
        default: begin
            interp2DataIn <= {demod2DataReg,4'h0};
            dac2Sync <= demod2SyncReg;
            end
        endcase
    end
//******************************************************************************
//                              Interpolators
//******************************************************************************
wire    [31:0]  interp0Dout;
wire    [17:0]  interp0DataOut;
wire    [13:0]  dac0Out = interp0DataOut[17:4];
interpolate dac0Interp(
    .clk(ck933), .reset(reset), .clkEn(dac0Sync),
    .cs(interp0CS),
    .wr0(wr0), .wr1(wr1), .wr2(wr2), .wr3(wr3),
    .addr(addr),
    .din(dataIn),
    .dout(interp0Dout),
    .dataIn(interp0DataIn),
    .dataOut(interp0DataOut)
    );

wire    [31:0]  interp1Dout;
wire    [17:0]  interp1DataOut;
wire    [13:0]  dac1Out = interp1DataOut[17:4];
interpolate dac1Interp(
    .clk(ck933), .reset(reset), .clkEn(dac1Sync),
    .cs(interp1CS),
    .wr0(wr0), .wr1(wr1), .wr2(wr2), .wr3(wr3),
    .addr(addr),
    .din(dataIn),
    .dout(interp1Dout),
    .dataIn(interp1DataIn),
    .dataOut(interp1DataOut)
    );

wire    [31:0]  interp2Dout;
wire    [17:0]  interp2DataOut;
wire    [13:0]  dac2Out = interp2DataOut[17:4];
interpolate dac2Interp(
    .clk(ck933), .reset(reset), .clkEn(dac2Sync),
    .cs(interp2CS),
    .wr0(wr0), .wr1(wr1), .wr2(wr2), .wr3(wr3),
    .addr(addr),
    .din(dataIn),
    .dout(interp2Dout),
    .dataIn(interp2DataIn),
    .dataOut(interp2DataOut)
    );

FDCE dac0_d_0  (.Q(dac0_d[0]),   .C(ck933),  .CE(dac0Sync),  .CLR(1'b0), .D(dac0Out[0]));
FDCE dac0_d_1  (.Q(dac0_d[1]),   .C(ck933),  .CE(dac0Sync),  .CLR(1'b0), .D(dac0Out[1]));
FDCE dac0_d_2  (.Q(dac0_d[2]),   .C(ck933),  .CE(dac0Sync),  .CLR(1'b0), .D(dac0Out[2]));
FDCE dac0_d_3  (.Q(dac0_d[3]),   .C(ck933),  .CE(dac0Sync),  .CLR(1'b0), .D(dac0Out[3]));
FDCE dac0_d_4  (.Q(dac0_d[4]),   .C(ck933),  .CE(dac0Sync),  .CLR(1'b0), .D(dac0Out[4]));
FDCE dac0_d_5  (.Q(dac0_d[5]),   .C(ck933),  .CE(dac0Sync),  .CLR(1'b0), .D(dac0Out[5]));
FDCE dac0_d_6  (.Q(dac0_d[6]),   .C(ck933),  .CE(dac0Sync),  .CLR(1'b0), .D(dac0Out[6]));
FDCE dac0_d_7  (.Q(dac0_d[7]),   .C(ck933),  .CE(dac0Sync),  .CLR(1'b0), .D(dac0Out[7]));
FDCE dac0_d_8  (.Q(dac0_d[8]),   .C(ck933),  .CE(dac0Sync),  .CLR(1'b0), .D(dac0Out[8]));
FDCE dac0_d_9  (.Q(dac0_d[9]),   .C(ck933),  .CE(dac0Sync),  .CLR(1'b0), .D(dac0Out[9]));
FDCE dac0_d_10 (.Q(dac0_d[10]),  .C(ck933),  .CE(dac0Sync),  .CLR(1'b0), .D(dac0Out[10]));
FDCE dac0_d_11 (.Q(dac0_d[11]),  .C(ck933),  .CE(dac0Sync),  .CLR(1'b0), .D(dac0Out[11]));
FDCE dac0_d_12 (.Q(dac0_d[12]),  .C(ck933),  .CE(dac0Sync),  .CLR(1'b0), .D(dac0Out[12]));
FDCE dac0_d_13 (.Q(dac0_d[13]),  .C(ck933),  .CE(dac0Sync),  .CLR(1'b0), .D(~dac0Out[13]));
assign dac0_clk = ck933;

FDCE dac1_d_0  (.Q(dac1_d[0]),   .C(ck933),  .CE(dac1Sync),  .CLR(1'b0), .D(dac1Out[0]));
FDCE dac1_d_1  (.Q(dac1_d[1]),   .C(ck933),  .CE(dac1Sync),  .CLR(1'b0), .D(dac1Out[1]));
FDCE dac1_d_2  (.Q(dac1_d[2]),   .C(ck933),  .CE(dac1Sync),  .CLR(1'b0), .D(dac1Out[2]));
FDCE dac1_d_3  (.Q(dac1_d[3]),   .C(ck933),  .CE(dac1Sync),  .CLR(1'b0), .D(dac1Out[3]));
FDCE dac1_d_4  (.Q(dac1_d[4]),   .C(ck933),  .CE(dac1Sync),  .CLR(1'b0), .D(dac1Out[4]));
FDCE dac1_d_5  (.Q(dac1_d[5]),   .C(ck933),  .CE(dac1Sync),  .CLR(1'b0), .D(dac1Out[5]));
FDCE dac1_d_6  (.Q(dac1_d[6]),   .C(ck933),  .CE(dac1Sync),  .CLR(1'b0), .D(dac1Out[6]));
FDCE dac1_d_7  (.Q(dac1_d[7]),   .C(ck933),  .CE(dac1Sync),  .CLR(1'b0), .D(dac1Out[7]));
FDCE dac1_d_8  (.Q(dac1_d[8]),   .C(ck933),  .CE(dac1Sync),  .CLR(1'b0), .D(dac1Out[8]));
FDCE dac1_d_9  (.Q(dac1_d[9]),   .C(ck933),  .CE(dac1Sync),  .CLR(1'b0), .D(dac1Out[9]));
FDCE dac1_d_10 (.Q(dac1_d[10]),  .C(ck933),  .CE(dac1Sync),  .CLR(1'b0), .D(dac1Out[10]));
FDCE dac1_d_11 (.Q(dac1_d[11]),  .C(ck933),  .CE(dac1Sync),  .CLR(1'b0), .D(dac1Out[11]));
FDCE dac1_d_12 (.Q(dac1_d[12]),  .C(ck933),  .CE(dac1Sync),  .CLR(1'b0), .D(dac1Out[12]));
FDCE dac1_d_13 (.Q(dac1_d[13]),  .C(ck933),  .CE(dac1Sync),  .CLR(1'b0), .D(~dac1Out[13]));
assign dac1_clk = ck933;

FDCE dac2_d_0  (.Q(dac2_d[0]),   .C(ck933),  .CE(dac2Sync),  .CLR(1'b0), .D(dac2Out[0]));
FDCE dac2_d_1  (.Q(dac2_d[1]),   .C(ck933),  .CE(dac2Sync),  .CLR(1'b0), .D(dac2Out[1]));
FDCE dac2_d_2  (.Q(dac2_d[2]),   .C(ck933),  .CE(dac2Sync),  .CLR(1'b0), .D(dac2Out[2]));
FDCE dac2_d_3  (.Q(dac2_d[3]),   .C(ck933),  .CE(dac2Sync),  .CLR(1'b0), .D(dac2Out[3]));
FDCE dac2_d_4  (.Q(dac2_d[4]),   .C(ck933),  .CE(dac2Sync),  .CLR(1'b0), .D(dac2Out[4]));
FDCE dac2_d_5  (.Q(dac2_d[5]),   .C(ck933),  .CE(dac2Sync),  .CLR(1'b0), .D(dac2Out[5]));
FDCE dac2_d_6  (.Q(dac2_d[6]),   .C(ck933),  .CE(dac2Sync),  .CLR(1'b0), .D(dac2Out[6]));
FDCE dac2_d_7  (.Q(dac2_d[7]),   .C(ck933),  .CE(dac2Sync),  .CLR(1'b0), .D(dac2Out[7]));
FDCE dac2_d_8  (.Q(dac2_d[8]),   .C(ck933),  .CE(dac2Sync),  .CLR(1'b0), .D(dac2Out[8]));
FDCE dac2_d_9  (.Q(dac2_d[9]),   .C(ck933),  .CE(dac2Sync),  .CLR(1'b0), .D(dac2Out[9]));
FDCE dac2_d_10 (.Q(dac2_d[10]),  .C(ck933),  .CE(dac2Sync),  .CLR(1'b0), .D(dac2Out[10]));
FDCE dac2_d_11 (.Q(dac2_d[11]),  .C(ck933),  .CE(dac2Sync),  .CLR(1'b0), .D(dac2Out[11]));
FDCE dac2_d_12 (.Q(dac2_d[12]),  .C(ck933),  .CE(dac2Sync),  .CLR(1'b0), .D(dac2Out[12]));
FDCE dac2_d_13 (.Q(dac2_d[13]),  .C(ck933),  .CE(dac2Sync),  .CLR(1'b0), .D(~dac2Out[13]));
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

reg iDec,qDec;
reg decoderSymEn;
reg decoderSym2xEn;

wire iDec_wire = trellisEn ? trellisBit : iBitReg ;
wire qDec_wire = trellisEn ? trellisBit : qBitReg ;
wire decSymEn_wire = trellisEn ? trellisSymEn : dataSymEnReg ;
wire decSym2xEn_wire = trellisEn ? trellisSym2xEn : dataSym2xEnReg ;

always @(posedge ck933) begin
    iDec <= iDec_wire ;
    qDec <= qDec_wire ;
    decoderSymEn <= decSymEn_wire ;
    decoderSym2xEn <= decSym2xEn_wire ;
    end

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
  .symb_i(iDec),                    // input, i
  .symb_q(qDec),                    // input, q
  .dout_i(decoder_dout_i),          // output, i data
  .dout_q(decoder_dout_q),          // output, q data
  .cout(decoder_cout),              // output, i/q clock
  .fifo_rs(decoder_fifo_rs),
  .clk_inv(cout_inv),
  .bypass_fifo(bypass_fifo),
  .symb_clk(symbol_clk)
  );
//******************************************************************************
//                   Decoder Output FIFO and Symbol Clock PLL
//******************************************************************************
wire decoder_fifo_dout_i,decoder_fifo_dout_q;
wire decoder_fifo_empty,decoder_fifo_full;
reg  decoder_fifoReadEn;
wire symb_pll_out;

decoder_output_fifo decoder_output_fifo
  (
  .din({decoder_dout_q,decoder_dout_i}),
  .rd_clk(symb_pll_out),
  .rd_en(decoder_fifoReadEn),
  .rst(decoder_fifo_rs),
  .wr_clk(ck933),
  .wr_en(decoder_cout),
  .dout({decoder_fifo_dout_q,decoder_fifo_dout_i}),
  .empty(decoder_fifo_empty),
  .full(decoder_fifo_full),
  .prog_full(decoder_fifoHalfFull)
  );

always @(posedge symb_pll_out) begin
    if (decoder_fifo_rs) begin
        decoder_fifoReadEn <= 0;
        end
    else if (decoder_fifoHalfFull) begin
        decoder_fifoReadEn <= 1;
        end
    end

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

reg             auSymClkIn;
always @(posedge ck933) begin
    auSymClkIn <= auSymClk;
    end

wire clkOut = bypass_fifo ? symbol_clk : symb_pll_out;
wire cout = (clkOut) ^ !cout_inv;
assign cout_i = cout;
reg cout_q;
always @(demodMode or auSymClkIn or cout) begin
    case (demodMode)
        `MODE_AUQPSK:   cout_q = auSymClkIn;
        default:        cout_q = cout;
        endcase
    end

reg dout_i,decQ;
always @(posedge clkOut)begin
  dout_i <= bypass_fifo ? decoder_dout_i : decoder_fifo_dout_i;
  decQ <= bypass_fifo ? decoder_dout_q : decoder_fifo_dout_q;
  end
reg dout_q;
always @(demodMode or qData or decQ) begin
    case (demodMode)
        `MODE_AUQPSK:   dout_q = qData;
        default:        dout_q = decQ;
        endcase
    end
//******************************************************************************
//                           Processor Read Data Mux
//******************************************************************************
reg [15:0] rd_mux;
always @(*) begin
  casex(addr)
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
   `INTERP0SPACE: begin
      if (addr[1]) begin
        rd_mux <= interp0Dout[31:16];
        end
      else begin
        rd_mux <= interp0Dout[15:0];
        end
      end
    `INTERP1SPACE: begin
      if (addr[1]) begin
        rd_mux <= interp1Dout[31:16];
        end
      else begin
        rd_mux <= interp1Dout[15:0];
        end
      end
    `INTERP2SPACE: begin
      if (addr[1]) begin
        rd_mux <= interp2Dout[31:16];
        end
      else begin
        rd_mux <= interp2Dout[15:0];
        end
      end
    `TRELLISLFSPACE,
    `TRELLIS_SPACE: begin
        if (addr[1]) begin
            rd_mux <= trellisDout[31:16];
            end
        else begin
            rd_mux <= trellisDout[15:0];
            end
        end

    default : rd_mux <= 16'hxxxx;
    endcase
  end

assign data = (!nCs & !nRd) ? rd_mux : 16'hzzzz;

/*
wire [35:0] CONTROL0 ;
wire TRIG0 = 1'b0 ;

chipscope_icon icon (
    .CONTROL0(CONTROL0) // INOUT BUS [35:0]
);

chipscope_ila ila (
    .CONTROL(CONTROL0), // INOUT BUS [35:0]
    .CLK(ck933), // IN
    .DATA({
        demodMode,
        4'b0,
        iSymData[7:0],
        qSymData[7:0],
        1'b0,
        legacyBit,
        trellisSymSync,
        iSym2xEn,
        iData,
        qData,
        dataSymEn,
        dataSym2xEn
        }), // IN BUS [31:0]
    .TRIG0(TRIG0) // IN BUS [0:0]
);
*/



endmodule