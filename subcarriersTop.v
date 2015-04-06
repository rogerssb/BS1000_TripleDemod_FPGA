//-----------------------------------------------------------------------------
// Project      SEMCO Multi-mode Demodulator (FPGA 2)
// Design       FM/PM Subcarrier Demodulator Top level
// Created      25 Aug 11
//-----------------------------------------------------------------------------
// 27 Sep 11    Added multiboot

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

`timescale 1ns/100ps
`include "addressMap.v"
`include "defines.v"

//`define DOS_DEMODS

module subcarriersTop (
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
    //dac0Select,dac1Select,dac2Select,
    dac0Data,dac1Data,dac2Data,
    dataSymEn,dataSym2xEn,
    iData,qData,
    iBB,qBB,
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
    vt_txd,vt_rxd
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
//input   [3:0]   dac0Select,dac1Select,dac2Select;
input   [13:0]  dac0Data,dac1Data,dac2Data;
input           dataSymEn,dataSym2xEn;
input           iData,qData;
input   [17:0]  iBB,qBB;
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

output          vt_txd;
input           vt_rxd;

parameter VER_NUMBER = 16'h017c;


`ifndef USE_VTERM
wire    [11:0]  addr = {addr11,addr10,addr9,addr8,addr7,addr6,addr5,addr4,addr3,addr2,addr1,1'b0};
wire            add12 = addr12;
wire            nWr = nWe;
wire            cs = !nCs;
wire            wr0 = !nCs & !nWr & !addr1;
wire            wr1 = !nCs & !nWr & !addr1;
wire            wr2 = !nCs & !nWr & addr1;
wire            wr3 = !nCs & !nWr & addr1;
wire    [31:0]  dataIn = {data,data};
assign          vt_txd = vt_rxd;    // keep unused pins in ucf with pulldown
`else
wire    [15:0]  vt_addr;
wire    [15:0]  vt_dout;
wire    [15:0]  vt_din;
wire            vt_ce,vt_we,vt_oe;
wire    [11:0]  addr = vt_addr[11:0];
wire            add12 = vt_addr[12];
wire            nWr = !vt_we;
wire            cs = vt_ce;
wire            wr0 = vt_ce & vt_we & !vt_addr[0];
wire            wr1 = vt_ce & vt_we & !vt_addr[0];
wire            wr2 = vt_ce & vt_we & vt_addr[0];
wire            wr3 = vt_ce & vt_we & vt_addr[0];
wire    [31:0]  dataIn = {vt_dout,vt_dout};
`endif

//******************************************************************************
//                               Pass Throughs
//******************************************************************************
assign bsync_nLock = bsyncLockInput;
assign demod_nLock = demodLockInput;

//******************************************************************************
//                               Reclock Inputs
//******************************************************************************
reg     [13:0]  demod0_dac0DataIn, demod0_dac1DataIn, demod0_dac2DataIn;
reg             dataSymEnIn,dataSym2xEnIn;
reg             iDataIn,qDataIn;
reg     [17:0]  iBBIn,qBBIn;
reg             auSymClkIn;
always @(posedge ck933) begin
    demod0_dac0DataIn <= dac0Data;
    demod0_dac1DataIn <= dac1Data;
    demod0_dac2DataIn <= dac2Data;
    dataSymEnIn <= dataSymEn;
    dataSym2xEnIn <= dataSym2xEn;
    iDataIn <= iData;
    qDataIn <= qData;
    iBBIn <= iBB;
    qBBIn <= qBB;
    auSymClkIn <= auSymClk;
    end


//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//  DAC and Decoder Input Select Registers
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

reg subcarr_top_space;
always @(addr) begin
  casex(addr)
    `SUBCARR_TOP_SPACE: subcarr_top_space <= 1;
    default:     subcarr_top_space <= 0;
  endcase
end
wire subcarr_top_ena = cs && subcarr_top_space;

reg     [1:0]   dac0_in_sel;
reg     [1:0]   dac1_in_sel;
reg     [1:0]   dac2_in_sel;
reg             dec_in_sel;
`ifdef DOS_DEMODS
reg             dec_out_sel;
`endif

reg     [23:0]  boot_addr;

always @(negedge wr0) begin
    if (subcarr_top_ena) begin
        casex (addr)
            `DAC_IN_SEL:
                begin
                dac0_in_sel <= dataIn[1:0];
                dac1_in_sel <= dataIn[3:2];
                dac2_in_sel <= dataIn[5:4];
                end
            `REBOOT_ADDR:
                begin
                boot_addr[7:0] <= dataIn[7:0];
                end
            default: ;
            endcase
        end
    end

always @(negedge wr1) begin
    if (subcarr_top_ena) begin
        casex (addr)
            `REBOOT_ADDR:
                begin
                boot_addr[15:8] <= dataIn[15:8];
                end
            default: ;
            endcase
        end
    end

always @(negedge wr2) begin
    if (subcarr_top_ena) begin
        casex (addr)
            `DEC_IN_SEL:
                begin
                dec_in_sel <= data[0];
                `ifdef DOS_DEMODS
                dec_out_sel <= data[1];
                `endif
                end

           `REBOOT_ADDR:
                begin
                boot_addr[23:16] <= dataIn[23:16];
                end
            default: ;
            endcase
        end
    end

reg     [31:0]  subcarr_top_dout;
reg rs;
always @
    (
    addr or
    subcarr_top_ena or
    dac0_in_sel or
    dac1_in_sel or
    dac2_in_sel or
    `ifdef DOS_DEMODS
    dec_in_sel or
    dec_out_sel
    `else
    dec_in_sel
    `endif
    ) begin
    if (subcarr_top_ena)
        begin
        casex (addr)
            `MISC_RESET: begin
                rs <= 1;
                subcarr_top_dout <= 32'b0;
                end
            `MISC_VERSION: begin
                rs <= 0;
                subcarr_top_dout <= {VER_NUMBER,16'b0};
                end
            `DAC_IN_SEL:
                begin
                rs <= 0;
                `ifdef DOS_DEMODS
                subcarr_top_dout <= {14'b0,dec_out_sel,dec_in_sel,10'b0,dac2_in_sel,dac1_in_sel,dac0_in_sel};
                `else
                subcarr_top_dout <= {15'b0,dec_in_sel,10'b0,dac2_in_sel,dac1_in_sel,dac0_in_sel};
                `endif
                end
            `DEC_IN_SEL:
                begin
                rs <= 0;
                `ifdef DOS_DEMODS
                subcarr_top_dout <= {14'b0,dec_out_sel,dec_in_sel,10'b0,dac2_in_sel,dac1_in_sel,dac0_in_sel};
                `else
                subcarr_top_dout <= {15'b0,dec_in_sel,10'b0,dac2_in_sel,dac1_in_sel,dac0_in_sel};
                `endif
                end
            default: begin
                subcarr_top_dout <= 32'b0;
                rs <= 0;
                end
        endcase
        end
    else begin
        rs <= 0;
        subcarr_top_dout <= 32'b0;
    end
end

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// Multi-boot
// The reboot address is 24 bits. Writing the upper byte triggers a reboot.
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

reg reboot_decode;
reg [2:0]reboot_decode_sync;
reg reboot;

always @(wr2 or subcarr_top_ena or addr)
    begin
    if (wr2 && subcarr_top_ena)
        begin
        casex (addr)
            `REBOOT_ADDR:
                begin
                reboot_decode <= 1'b1 ;
                end
            default: reboot_decode <= 1'b0 ;
        endcase
        end
    else
        begin
        reboot_decode <= 1'b0 ;
        end
    end

always @ (posedge ck933)
    begin
    reboot_decode_sync <= {reboot_decode_sync[1:0],reboot_decode};
    reboot <= (reboot_decode_sync[2:1] == 2'b10);
    end

multiboot multiboot
    (
    .next_addr(boot_addr),
    .clk(ck933),
    .reboot(reboot)
    );

//******************************************************************************
//                               Miscellaneous
//******************************************************************************

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
wire dac_en = cs & dac_space;

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

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//  FM/PM Subcarrier Demodulators
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

wire demod1_ena = !add12;
wire demod2_ena = add12;

wire    [31:0]  demod1_dout;
wire    [17:0]  demod1_dac0Data;
wire    [17:0]  demod1_dac1Data;
wire    [17:0]  demod1_dac2Data;
wire            demod1_auSymClk;
wire            demod1_iBit;
wire            demod1_iSym2xEn;
wire            demod1_iSymEn;
wire            demod1_qBit;
wire            demod1_qSym2xEn;
wire            demod1_qSymEn;

demod demod1(
    .clk(ck933),
    .reset(reset),
    .wr0(demod1_ena & wr0),
    .wr1(demod1_ena & wr1),
    .wr2(demod1_ena & wr2),
    .wr3(demod1_ena & wr3),
    .addr(addr),
    .din(dataIn),
    .dout(demod1_dout),
//    .demodMode(demodMode),
    .iRx({demod0_dac2DataIn,4'h0}),      // FPGA1 DAC2 output
    .qRx(18'h0),
    .bbClkEn(dataSymEnIn),
    .iBB(iBBIn),
    .qBB(qBBIn),
    .dac0Data(demod1_dac0Data),
//    .dac0Select(demod1_dac0Select),
    .dac0Sync(demod1_dac0Sync),
    .dac1Data(demod1_dac1Data),
//    .dac1Select(demod1_dac1Select),
    .dac1Sync(demod1_dac1Sync),
    .dac2Data(demod1_dac2Data),
//    .dac2Select(demod1_dac2Select),
    .dac2Sync(demod1_dac2Sync),
    .iSym2xEn(demod1_iSym2xEn),
    .iSymEn(demod1_iSymEn),
    .iBit(demod1_iBit),
    .qSym2xEn(demod1_qSym2xEn),
    .qSymEn(demod1_qSymEn),
    .qSymClk(demod1_auSymClk),
    .qBit(demod1_qBit)
//    .bitsyncLock(bitsyncLock),
//    .carrierLock(carrierLock),
//    .trellisSymSync(trellisSymSync),
//    .iTrellis(iSymData),
//    .qTrellis(qSymData),
//    .eyeSync(eyeSync),
//    .iEye(iEye),
//    .qEye(qEye),
//    `ifdef INTERNAL_ADAPT
//    .eyeOffset(eyeOffset),
//    .avgDeviation(avgDeviation)
//    `else
//    .eyeOffset(eyeOffset)
//    `endif
    );

`define USE_INTERPOLATORS
`ifdef USE_INTERPOLATORS

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
wire    [17:0]  demod1_dac0Interp;
interpolate dac0Interp(
    .clk(ck933), .reset(reset), .clkEn(demod1_dac0Sync),
    .cs(dac0CS),
    .wr0(wr0), .wr1(wr1), .wr2(wr2), .wr3(wr3),
    .addr(addr),
    .din(dataIn),
    .dout(dac0Dout),
    .dataIn(demod1_dac0Data),
    .dataOut(demod1_dac0Interp)
    );

wire    [31:0]  dac1Dout;
wire    [17:0]  demod1_dac1Interp;
interpolate dac1Interp(
    .clk(ck933), .reset(reset), .clkEn(demod1_dac1Sync),
    .cs(dac1CS),
    .wr0(wr0), .wr1(wr1), .wr2(wr2), .wr3(wr3),
    .addr(addr),
    .din(dataIn),
    .dout(dac1Dout),
    .dataIn(demod1_dac1Data),
    .dataOut(demod1_dac1Interp)
    );

wire    [31:0]  dac2Dout;
wire    [17:0]  demod1_dac2Interp;
interpolate dac2Interp(
    .clk(ck933), .reset(reset), .clkEn(demod1_dac2Sync),
    .cs(dac2CS),
    .wr0(wr0), .wr1(wr1), .wr2(wr2), .wr3(wr3),
    .addr(addr),
    .din(dataIn),
    .dout(dac2Dout),
    .dataIn(demod1_dac2Data),
    .dataOut(demod1_dac2Interp)
    );

`endif


wire    [31:0]  demod2_dout;
wire    [17:0]  demod2_dac0Data;
wire    [17:0]  demod2_dac1Data;
wire    [17:0]  demod2_dac2Data;
wire            demod2_auSymClk;
wire            demod2_iBit;
wire            demod2_iSym2xEn;
wire            demod2_iSymEn;
wire            demod2_qBit;
wire            demod2_qSym2xEn;
wire            demod2_qSymEn;

`ifdef DOS_DEMODS

demod demod2(
    .clk(ck933),
    .reset(reset),
    .wr0(demod2_ena & wr0),
    .wr1(demod2_ena & wr1),
    .wr2(demod2_ena & wr2),
    .wr3(demod2_ena & wr3),
    .addr(addr),
    .din(dataIn),
    .dout(demod2_dout),
//    .demodMode(demodMode),
    .iRx({demod0_dac2DataIn,4'h0}),      // FPGA1 DAC2 output
    .qRx(18'h0),
    .dac0Data(demod2_dac0Data),
//    .dac0Select(demod2_dac0Select),
//    .dac0Sync(demod2_dac0Sync),
    .dac1Data(demod2_dac1Data),
//    .dac1Select(demod2_dac1Select),
//    .dac1Sync(demod2_dac1Sync),
    .dac2Data(demod2_dac2Data),
//    .dac2Select(demod2_dac2Select),
//    .dac2Sync(demod2_dac2Sync),
    .iSym2xEn(demod2_iSym2xEn),
    .iSymEn(demod2_iSymEn),
    .iBit(demod2_iBit),
    .qSym2xEn(demod2_qSym2xEn),
    .qSymEn(demod2_qSymEn),
    .qSymClk(demod2_auSymClk),
    .qBit(demod2_qBit)
//    .bitsyncLock(bitsyncLock),
//    .carrierLock(carrierLock),
//    .trellisSymSync(trellisSymSync),
//    .iTrellis(iSymData),
//    .qTrellis(qSymData),
//    .eyeSync(eyeSync),
//    .iEye(iEye),
//    .qEye(qEye),
//    `ifdef INTERNAL_ADAPT
//    .eyeOffset(eyeOffset),
//    .avgDeviation(avgDeviation)
//    `else
//    .eyeOffset(eyeOffset)
//    `endif
    );

`endif

//******************************************************************************
//                              DAC Outputs
//******************************************************************************

wire    [13:0]  dac0Out;
mux_4x1x14 mux_4x1x14_inst_1
    (
    .A(demod0_dac0DataIn),
    `ifdef USE_INTERPOLATORS
    .B(demod1_dac0Interp[17:4]),
    `else
    .B(demod1_dac0Data[17:4]),
    `endif
    .C(demod2_dac0Data[17:4]),
    .D(14'h0),
    .Y(dac0Out),
    .SEL(dac0_in_sel),
    .CLK(ck933)
    );

FDCE dac0_d_0  (.Q(dac0_d[0]),   .C(ck933),  .CE(1'b1),  .CLR(1'b0), .D(dac0Out[0] ));
FDCE dac0_d_1  (.Q(dac0_d[1]),   .C(ck933),  .CE(1'b1),  .CLR(1'b0), .D(dac0Out[1] ));
FDCE dac0_d_2  (.Q(dac0_d[2]),   .C(ck933),  .CE(1'b1),  .CLR(1'b0), .D(dac0Out[2] ));
FDCE dac0_d_3  (.Q(dac0_d[3]),   .C(ck933),  .CE(1'b1),  .CLR(1'b0), .D(dac0Out[3] ));
FDCE dac0_d_4  (.Q(dac0_d[4]),   .C(ck933),  .CE(1'b1),  .CLR(1'b0), .D(dac0Out[4] ));
FDCE dac0_d_5  (.Q(dac0_d[5]),   .C(ck933),  .CE(1'b1),  .CLR(1'b0), .D(dac0Out[5] ));
FDCE dac0_d_6  (.Q(dac0_d[6]),   .C(ck933),  .CE(1'b1),  .CLR(1'b0), .D(dac0Out[6] ));
FDCE dac0_d_7  (.Q(dac0_d[7]),   .C(ck933),  .CE(1'b1),  .CLR(1'b0), .D(dac0Out[7] ));
FDCE dac0_d_8  (.Q(dac0_d[8]),   .C(ck933),  .CE(1'b1),  .CLR(1'b0), .D(dac0Out[8] ));
FDCE dac0_d_9  (.Q(dac0_d[9]),   .C(ck933),  .CE(1'b1),  .CLR(1'b0), .D(dac0Out[9] ));
FDCE dac0_d_10 (.Q(dac0_d[10]),  .C(ck933),  .CE(1'b1),  .CLR(1'b0), .D(dac0Out[10]));
FDCE dac0_d_11 (.Q(dac0_d[11]),  .C(ck933),  .CE(1'b1),  .CLR(1'b0), .D(dac0Out[11]));
FDCE dac0_d_12 (.Q(dac0_d[12]),  .C(ck933),  .CE(1'b1),  .CLR(1'b0), .D(dac0Out[12]));
FDCE dac0_d_13 (.Q(dac0_d[13]),  .C(ck933),  .CE(1'b1),  .CLR(1'b0), .D(~dac0Out[13]));
assign dac0_clk = ck933;

wire    [13:0]  dac1Out;
mux_4x1x14 mux_4x1x14_inst_2
    (
    .A(demod0_dac1DataIn),
    `ifdef USE_INTERPOLATORS
    .B(demod1_dac1Interp[17:4]),
    `else
    .B(demod1_dac1Data[17:4]),
    `endif
    .C(demod2_dac1Data[17:4]),
    .D(14'h0),
    .Y(dac1Out),
    .SEL(dac1_in_sel),
    .CLK(ck933)
    );

FDCE dac1_d_0  (.Q(dac1_d[0]),   .C(ck933),  .CE(1'b1),  .CLR(1'b0), .D(dac1Out[0]));
FDCE dac1_d_1  (.Q(dac1_d[1]),   .C(ck933),  .CE(1'b1),  .CLR(1'b0), .D(dac1Out[1]));
FDCE dac1_d_2  (.Q(dac1_d[2]),   .C(ck933),  .CE(1'b1),  .CLR(1'b0), .D(dac1Out[2]));
FDCE dac1_d_3  (.Q(dac1_d[3]),   .C(ck933),  .CE(1'b1),  .CLR(1'b0), .D(dac1Out[3]));
FDCE dac1_d_4  (.Q(dac1_d[4]),   .C(ck933),  .CE(1'b1),  .CLR(1'b0), .D(dac1Out[4]));
FDCE dac1_d_5  (.Q(dac1_d[5]),   .C(ck933),  .CE(1'b1),  .CLR(1'b0), .D(dac1Out[5]));
FDCE dac1_d_6  (.Q(dac1_d[6]),   .C(ck933),  .CE(1'b1),  .CLR(1'b0), .D(dac1Out[6]));
FDCE dac1_d_7  (.Q(dac1_d[7]),   .C(ck933),  .CE(1'b1),  .CLR(1'b0), .D(dac1Out[7]));
FDCE dac1_d_8  (.Q(dac1_d[8]),   .C(ck933),  .CE(1'b1),  .CLR(1'b0), .D(dac1Out[8]));
FDCE dac1_d_9  (.Q(dac1_d[9]),   .C(ck933),  .CE(1'b1),  .CLR(1'b0), .D(dac1Out[9]));
FDCE dac1_d_10 (.Q(dac1_d[10]),  .C(ck933),  .CE(1'b1),  .CLR(1'b0), .D(dac1Out[10]));
FDCE dac1_d_11 (.Q(dac1_d[11]),  .C(ck933),  .CE(1'b1),  .CLR(1'b0), .D(dac1Out[11]));
FDCE dac1_d_12 (.Q(dac1_d[12]),  .C(ck933),  .CE(1'b1),  .CLR(1'b0), .D(dac1Out[12]));
FDCE dac1_d_13 (.Q(dac1_d[13]),  .C(ck933),  .CE(1'b1),  .CLR(1'b0), .D(~dac1Out[13]));
assign dac1_clk = ck933;

wire    [13:0]  dac2Out;
mux_4x1x14 mux_4x1x14_inst_3
    (
    .A(demod0_dac2DataIn),
    `ifdef USE_INTERPOLATORS
    .B(demod1_dac2Interp[17:4]),
    `else
    .B(demod1_dac2Data[17:4]),
    `endif
    .C(demod2_dac2Data[17:4]),
    .D(14'h0),
    .Y(dac2Out),
    .SEL(dac2_in_sel),
    .CLK(ck933)
    );

FDCE dac2_d_0  (.Q(dac2_d[0]),   .C(ck933),  .CE(1'b1),  .CLR(1'b0), .D(dac2Out[0]));
FDCE dac2_d_1  (.Q(dac2_d[1]),   .C(ck933),  .CE(1'b1),  .CLR(1'b0), .D(dac2Out[1]));
FDCE dac2_d_2  (.Q(dac2_d[2]),   .C(ck933),  .CE(1'b1),  .CLR(1'b0), .D(dac2Out[2]));
FDCE dac2_d_3  (.Q(dac2_d[3]),   .C(ck933),  .CE(1'b1),  .CLR(1'b0), .D(dac2Out[3]));
FDCE dac2_d_4  (.Q(dac2_d[4]),   .C(ck933),  .CE(1'b1),  .CLR(1'b0), .D(dac2Out[4]));
FDCE dac2_d_5  (.Q(dac2_d[5]),   .C(ck933),  .CE(1'b1),  .CLR(1'b0), .D(dac2Out[5]));
FDCE dac2_d_6  (.Q(dac2_d[6]),   .C(ck933),  .CE(1'b1),  .CLR(1'b0), .D(dac2Out[6]));
FDCE dac2_d_7  (.Q(dac2_d[7]),   .C(ck933),  .CE(1'b1),  .CLR(1'b0), .D(dac2Out[7]));
FDCE dac2_d_8  (.Q(dac2_d[8]),   .C(ck933),  .CE(1'b1),  .CLR(1'b0), .D(dac2Out[8]));
FDCE dac2_d_9  (.Q(dac2_d[9]),   .C(ck933),  .CE(1'b1),  .CLR(1'b0), .D(dac2Out[9]));
FDCE dac2_d_10 (.Q(dac2_d[10]),  .C(ck933),  .CE(1'b1),  .CLR(1'b0), .D(dac2Out[10]));
FDCE dac2_d_11 (.Q(dac2_d[11]),  .C(ck933),  .CE(1'b1),  .CLR(1'b0), .D(dac2Out[11]));
FDCE dac2_d_12 (.Q(dac2_d[12]),  .C(ck933),  .CE(1'b1),  .CLR(1'b0), .D(dac2Out[12]));
FDCE dac2_d_13 (.Q(dac2_d[13]),  .C(ck933),  .CE(1'b1),  .CLR(1'b0), .D(~dac2Out[13]));
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

wire decoder1_en = cs && decoder_space && !add12;
wire decoder2_en = cs && decoder_space && add12;

wire [15:0]decoder1_dout;
wire decoder1_dout_i,decoder1_dout_q;
wire decoder1_cout;
wire decoder1_fifo_rs;
wire decoder1_cout_inv;

reg  decoder1_iDec;
reg  decoder1_qDec;
reg  decoder1_SymEn;
reg  decoder1_Sym2xEn;

always @ (posedge ck933)
    begin
    if (dec_in_sel)
        begin
        decoder1_iDec <= demod1_iBit ;
        decoder1_qDec <= demod1_qBit ;
        decoder1_SymEn <= demod1_iSymEn ;
        decoder1_Sym2xEn <= demod1_iSym2xEn ;
        end
    else
        begin
        decoder1_iDec <= iDataIn ;
        decoder1_qDec <= qDataIn ;
        decoder1_SymEn <= dataSymEnIn ;
        decoder1_Sym2xEn <= dataSym2xEnIn ;
        end
    end

decoder decoder1
  (
  .rs(reset),
  .en(decoder1_en),
  .wr0(wr0),
  .wr1(wr1),
  .addr(addr),
  .din(data),
  .dout(decoder1_dout),
  .clk(ck933),
  .symb_clk_en(decoder1_SymEn),         // symbol rate clock enable
  .symb_clk_2x_en(decoder1_Sym2xEn),    // 2x symbol rate clock enable
  .symb_i(decoder1_iDec),               // input, i
  .symb_q(decoder1_qDec),               // input, q
  .dout_i(decoder1_dout_i),             // output, i data
  .dout_q(decoder1_dout_q),             // output, q data
  .cout(decoder1_cout),                 // output, i/q clock
  .fifo_rs(decoder1_fifo_rs),
  .clk_inv(decoder1_cout_inv),
  .bypass_fifo(decoder1_bypass_fifo),
  .symb_clk(decoder1_symbol_clk)
  );

//******************************************************************************
//                   Decoder1 Output FIFO and Symbol Clock PLL
//******************************************************************************

wire decoder_fifo_dout_i,decoder_fifo_dout_q;
wire decoder_fifo_empty,decoder_fifo_full;
reg  decoder_fifoReadEn;
wire symb_pll_out;

decoder_output_fifo decoder_output_fifo
  (
  .din({decoder1_dout_q,decoder1_dout_i}),
  .rd_clk(symb_pll_out),
  .rd_en(decoder_fifoReadEn),
  .rst(decoder1_fifo_rs),
  .wr_clk(ck933),
  .wr_en(decoder1_cout),
  .dout({decoder_fifo_dout_q,decoder_fifo_dout_i}),
  .empty(decoder_fifo_empty),
  .full(decoder_fifo_full),
  .prog_full(decoder_fifoHalfFull)
  );

always @(posedge symb_pll_out) begin
    if (decoder1_fifo_rs) begin
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

wire symb_pll_en = cs && pll_space;
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
  .clk_en(decoder1_cout),
  .clk_ref(pllRef),           // output pad, comparator reference clock
  .clk_vco(symb_pll_vco),     // input pad, vco output
  .clk_fbk(symb_pll_fbk),     // output pad, comparator feedback clock
  .clk_out(symb_pll_out)      // output, symbol clock
  );

reg symb_pll_ref;
always @(posedge ck933) begin
    symb_pll_ref <= pllRef;
    end

wire clkOut = decoder1_bypass_fifo ? decoder1_symbol_clk : symb_pll_out;
wire cout = (clkOut) ^ !decoder1_cout_inv;
assign cout_i = cout;
reg cout_q;
always @(demodMode or auSymClkIn or cout) begin
    case (demodMode)
        `MODE_AQPSK,
        `MODE_AUQPSK:   cout_q = auSymClkIn;
        default:        cout_q = cout;
        endcase
    end

reg dout_i,decQ;
always @(posedge clkOut)begin
  dout_i <= decoder1_bypass_fifo ? decoder1_dout_i : decoder_fifo_dout_i;
  decQ <= decoder1_bypass_fifo ? decoder1_dout_q : decoder_fifo_dout_q;
  end
reg dout_q;
always @(demodMode or qDataIn or decQ) begin
    case (demodMode)
        `MODE_AQPSK,
        `MODE_AUQPSK:   dout_q = qDataIn;
        default:        dout_q = decQ;
        endcase
    end

wire decoder2_dout ;
wire decoder2_dout_i ;
wire decoder2_dout_q ;
wire decoder2_symbol_clk ;

reg decoder2_iDec ;
reg decoder2_qDec ;
reg decoder2_SymEn ;
reg decoder2_Sym2xEn ;

always @ (posedge ck933)
    begin
    decoder2_iDec <= demod2_iBit ;
    decoder2_qDec <= demod2_qBit ;
    decoder2_SymEn <= demod2_iSymEn ;
    decoder2_Sym2xEn <= demod2_iSym2xEn ;
    end

`ifdef DOS_DEMODS

decoder decoder2
  (
  .rs(reset),
  .en(decoder2_en),
  .wr0(wr0),
  .wr1(wr1),
  .addr(addr),
  .din(data),                           // processor bus data in
  .dout(decoder2_dout),                 // processor bus data out
  .clk(ck933),
  .symb_clk_en(demod2_iSymEn),          // symbol rate clock enable
  .symb_clk_2x_en(demod2_iSym2xEn),     // 2x symbol rate clock enable
  .symb_i(decoder2_iDec),               // input, i
  .symb_q(decoder2_qDec),               // input, q
  .dout_i(decoder2_dout_i),             // output, i data
  .dout_q(decoder2_dout_q),             // output, q data
//  .cout(decoder2_cout),               // output, i/q clock
//  .fifo_rs(decoder2_fifo_rs),
//  .clk_inv(decoder2_cout_inv),
//  .bypass_fifo(decoder2_bypass_fifo),
  .symb_clk(decoder2_symbol_clk)
  );

`endif

//******************************************************************************
//                           Processor Read Data Mux
//******************************************************************************

`ifdef DOS_DEMODS
wire [31:0]demod_dout = add12 ? demod2_dout : demod1_dout ;
wire [15:0]decoder_dout = add12 ? decoder2_dout : decoder1_dout ;
`else
wire [31:0]demod_dout = demod1_dout ;
wire [15:0]decoder_dout = decoder1_dout ;
`endif

reg [15:0] rd_mux;
always @(
  addr or
  demod_dout or
  dac0Dout or dac1Dout or dac2Dout or
  dac_dout or
  subcarr_top_dout or
  decoder_dout or
  symb_pll_dout
  )begin
  casex(addr)
    `DEMODSPACE,
    `DDCSPACE,
    `DDCFIRSPACE,
    `CICDECSPACE,
    `BITSYNCSPACE,
    `BITSYNCAUSPACE,
    `CHAGCSPACE,
    `RESAMPSPACE,
    `CARRIERSPACE,
    `CHAGCSPACE : begin
      if (addr[1]) begin
        rd_mux <= demod_dout[31:16];
        end
      else begin
        rd_mux <= demod_dout[15:0];
        end
      end
    `ifdef USE_INTERPOLATORS
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
    `endif
    `DAC_SPACE : rd_mux <= dac_dout;
    `SUBCARR_TOP_SPACE : begin
        if (addr[1]) begin
            rd_mux <= subcarr_top_dout[31:16];
            end
        else begin
            rd_mux <= subcarr_top_dout[15:0];
            end
        end
    `DECODERSPACE: rd_mux <= decoder_dout;
    `PLLSPACE: rd_mux <= symb_pll_dout;
    default : rd_mux <= 16'hxxxx;
    endcase
  end

assign data = (cs & !nRd) ? rd_mux : 16'hzzzz;


`ifdef USE_VTERM

assign vt_din = (vt_ce & vt_oe) ? rd_mux : 16'hCAFE;

reg     [1:0] vt_clk;
always @ (posedge ck933)
    begin
    vt_clk <= vt_clk - 2'b1;
    end

vterm vterm
    (
    .addr(vt_addr),     // output, address to registers
    .ce(vt_ce),         // output, chip enable, high true
    .clk(vt_clk[1]),    // input, 25M synchronous logic clock
    .din(vt_din),       // input, read data from registers
    .dout(vt_dout),     // output, write data to registers
    .oe(vt_oe),         // output, output enable, high true
    .rst(1'b0),         // input, synchronous logic reset, high true
    .rxd(vt_rxd),       // input, async receive data
    .txd(vt_txd),       // output, async transmit data
    .we(vt_we)          // output, write enable, high true
    );

wire [35:0] CONTROL0;

chipscope_icon chipscope_icon (
    .CONTROL0(CONTROL0) // INOUT BUS [35:0]
);

chipscope_ila chipscope_ila (
    .CONTROL(CONTROL0), // INOUT BUS [35:0]
    .CLK(ck933), // IN
    .DATA({
        4'b0,
        wr2,
        wr1,
        wr0,
        reboot,
        boot_addr[23:0]
        }),
    .TRIG0(subcarr_top_ena)
);

`endif

endmodule
