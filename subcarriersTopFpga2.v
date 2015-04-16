`timescale 1ns/100ps
`include "addressMap.v"
`include "defines.v"

module subcarriersTopFpga2 (
    clk,
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

    );

input           nWe;
input           clk;
input           nRd,nCs;
input           addr12;
input           addr11,addr10,addr9,addr8;
input           addr7, addr6,addr5,addr4;
input           addr3,addr2,addr1;
inout   [15:0]  data;
inout           dac_sdio;
input   [4:0]   demodMode;
input   [3:0]   dac0Select,dac1Select,dac2Select;
input           auSymClk;
input           bsyncLockInput,demodLockInput;
input           sdiInput;
input   [13:0]  demod0Data,demod1Data,demod2Data;
input           demod0Sync,demod1Sync,demod2Sync;
input           dataSymEn,dataSym2xEn;
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

parameter VER_NUMBER = 16'h0185;

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

reg     [1:0]   dac0_in_sel;
reg     [1:0]   dac1_in_sel;
reg     [1:0]   dac2_in_sel;
reg             dec_in_sel;
reg     [23:0]  boot_addr;

// MISC space writes
always @(negedge wr0) begin
    if (misc_en) begin
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
    if (misc_en) begin
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
    if (misc_en) begin
        casex (addr)
            `DEC_IN_SEL:
                begin
                dec_in_sel <= data[0];
                end
           `REBOOT_ADDR:
                begin
                boot_addr[23:16] <= dataIn[23:16];
                end
            default: ;
            endcase
        end
    end

// MISCSPACE Reads
reg     [31:0]  misc_dout;
reg rs;
always @* begin
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
        `DAC_IN_SEL:
            begin
            rs <= 0;
            misc_dout <= {15'b0,dec_in_sel,10'b0,dac2_in_sel,dac1_in_sel,dac0_in_sel};
            end
        `DEC_IN_SEL:
            begin
            rs <= 0;
            misc_dout <= {15'b0,dec_in_sel,10'b0,dac2_in_sel,dac1_in_sel,dac0_in_sel};
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

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// Multi-boot
// The reboot address is 24 bits. Writing the upper byte triggers a reboot.
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

reg reboot_decode;
reg [7:0]reboot_decode_sync;
reg reboot;

always @*
    begin
    if (wr2 && misc_en)
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

always @ (posedge clk)
    begin
    reboot_decode_sync <= {reboot_decode_sync[6:0],reboot_decode};
    reboot <= (reboot_decode_sync[7:6] == 2'b10);
    end

multiboot multiboot
    (
    .addr(boot_addr),
    .clk(clk),
    .reset(reset),
    .pulse(reboot)
    );


//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// Processor controlled reset
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

reg rs0,rs1;
reg [2:0]resetCount;
always @(posedge clk or posedge rs) begin
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
always @(posedge clk)begin
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
//                              Demod Outputs
//******************************************************************************

reg     [17:0]  iIn,qIn;
reg     [13:0]  demod0DataReg;
reg             demod0SyncReg;
reg     [17:0]  demod1DataReg;
reg             demod1SyncReg;
reg     [17:0]  demod2DataReg;
reg             demod2SyncReg;
reg             iBitReg,qBitReg;
reg             dataSymEnReg,dataSym2xEnReg;
reg             auSymClkIn;

always @(posedge clk) begin
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
    auSymClkIn <= auSymClk;
    end


//******************************************************************************
//                         Subcarrier Demod/Bitsync
//******************************************************************************
wire    [31:0]  sc0_dout;
wire    [17:0]  sc0_dac0Data;
wire    [17:0]  sc0_dac1Data;
wire    [17:0]  sc0_dac2Data;
wire            sc0_auSymClk;
wire            sc0_iBit;
wire            sc0_iSym2xEn;
wire            sc0_iSymEn;
wire            sc0_qBit;
wire            sc0_qSym2xEn;
wire            sc0_qSymEn;

demod sc0(
    .clk(clk),
    .reset(reset),
    .wr0(wr0),
    .wr1(wr1),
    .wr2(wr2),
    .wr3(wr3),
    .addr(addr),
    .din(dataIn),
    .dout(sc0_dout),
    .iRx({demod2DataReg,4'h0}),      // FPGA1 DAC2 output
    .qRx(18'h0),
    .bbClkEn(dataSymEnReg),
    .iBB(iIn),
    .qBB(qIn),
    .dac0Data(sc0_dac0Data),
    .dac0Sync(sc0_dac0Sync),
    .dac1Data(sc0_dac1Data),
    .dac1Sync(sc0_dac1Sync),
    .dac2Data(sc0_dac2Data),
    .dac2Sync(sc0_dac2Sync),
    .iSym2xEn(sc0_iSym2xEn),
    .iSymEn(sc0_iSymEn),
    .iBit(sc0_iBit),
    .qSym2xEn(sc0_qSym2xEn),
    .qSymEn(sc0_qSymEn),
    .qSymClk(sc0_auSymClk),
    .qBit(sc0_qBit)
    );

wire    [31:0]  sc1_dout;
wire    [17:0]  sc1_dac0Data;
wire    [17:0]  sc1_dac1Data;
wire    [17:0]  sc1_dac2Data;
wire            sc1_auSymClk;
wire            sc1_iBit;
wire            sc1_iSym2xEn;
wire            sc1_iSymEn;
wire            sc1_qBit;
wire            sc1_qSym2xEn;
wire            sc1_qSymEn;

demod sc1(
    .clk(clk),
    .reset(reset),
    .wr0(wr0),
    .wr1(wr1),
    .wr2(wr2),
    .wr3(wr3),
    .addr(addr),
    .din(dataIn),
    .dout(sc1_dout),
    .iRx({demod2DataReg,4'h0}),      // FPGA1 DAC2 output
    .qRx(18'h0),
    .bbClkEn(dataSymEnReg),
    .iBB(iIn),
    .qBB(qIn),
    .dac0Data(sc1_dac0Data),
    .dac0Sync(sc1_dac0Sync),
    .dac1Data(sc1_dac1Data),
    .dac1Sync(sc1_dac1Sync),
    .dac2Data(sc1_dac2Data),
    .dac2Sync(sc1_dac2Sync),
    .iSym2xEn(sc1_iSym2xEn),
    .iSymEn(sc1_iSymEn),
    .iBit(sc1_iBit),
    .qSym2xEn(sc1_qSym2xEn),
    .qSymEn(sc1_qSymEn),
    .qSymClk(sc1_auSymClk),
    .qBit(sc1_qBit)
    );



//******************************************************************************
//                          DAC Input Selection
//******************************************************************************
reg  [17:0] interp0DataIn,interp1DataIn,interp2DataIn;
reg         dac0Sync,dac1Sync,dac2Sync;

always @(posedge clk) begin
    if (dac0_in_sel == `DAC_IN_SEL_DEMOD) begin
        interp0DataIn <= {demod0DataReg,4'h0};
        dac0Sync <= demod0SyncReg;
        end
    else if (dac0_in_sel == `DAC_IN_SEL_SC0) begin
        interp0DataIn <= sc0_dac0Data;
        dac0Sync <= sc0_dac0Sync;
        end
    else begin
        interp0DataIn <= sc1_dac0Data;
        dac0Sync <= sc1_dac0Sync;
        end

    if (dac1_in_sel == `DAC_IN_SEL_DEMOD) begin
        interp1DataIn <= {demod1DataReg,4'h0};
        dac1Sync <= demod1SyncReg;
        end
    else if (dac0_in_sel == `DAC_IN_SEL_SC0) begin
        interp1DataIn <= sc0_dac1Data;
        dac1Sync <= sc0_dac1Sync;
        end
    else begin
        interp1DataIn <= sc1_dac1Data;
        dac1Sync <= sc1_dac1Sync;
        end

    if (dac2_in_sel == `DAC_IN_SEL_DEMOD) begin
        interp2DataIn <= {demod2DataReg,4'h0};
        dac2Sync <= demod2SyncReg;
        end
    else if (dac0_in_sel == `DAC_IN_SEL_SC0) begin
        interp2DataIn <= sc0_dac2Data;
        dac2Sync <= sc0_dac2Sync;
        end
    else begin
        interp2DataIn <= sc1_dac2Data;
        dac2Sync <= sc1_dac2Sync;
        end
    end
//******************************************************************************
//                              Interpolators
//******************************************************************************
wire    [31:0]  interp0Dout;
wire    [17:0]  interp0DataOut;
wire    [13:0]  dac0Out = interp0DataOut[17:4];
interpolate #(.RegSpace(`INTERP0SPACE), .FirRegSpace(`VIDFIR0SPACE)) dac0Interp(
    .clk(clk), .reset(reset), .clkEn(dac0Sync),
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
interpolate #(.RegSpace(`INTERP1SPACE), .FirRegSpace(`VIDFIR1SPACE)) dac1Interp(
    .clk(clk), .reset(reset), .clkEn(dac1Sync),
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
interpolate #(.RegSpace(`INTERP2SPACE), .FirRegSpace(`VIDFIR2SPACE)) dac2Interp(
    .clk(clk), .reset(reset), .clkEn(dac2Sync),
    .wr0(wr0), .wr1(wr1), .wr2(wr2), .wr3(wr3),
    .addr(addr),
    .din(dataIn),
    .dout(interp2Dout),
    .dataIn(interp2DataIn),
    .dataOut(interp2DataOut)
    );

FDCE dac0_d_0  (.Q(dac0_d[0]),   .C(clk),  .CE(1'b1),  .CLR(1'b0), .D(dac0Out[0]));
FDCE dac0_d_1  (.Q(dac0_d[1]),   .C(clk),  .CE(1'b1),  .CLR(1'b0), .D(dac0Out[1]));
FDCE dac0_d_2  (.Q(dac0_d[2]),   .C(clk),  .CE(1'b1),  .CLR(1'b0), .D(dac0Out[2]));
FDCE dac0_d_3  (.Q(dac0_d[3]),   .C(clk),  .CE(1'b1),  .CLR(1'b0), .D(dac0Out[3]));
FDCE dac0_d_4  (.Q(dac0_d[4]),   .C(clk),  .CE(1'b1),  .CLR(1'b0), .D(dac0Out[4]));
FDCE dac0_d_5  (.Q(dac0_d[5]),   .C(clk),  .CE(1'b1),  .CLR(1'b0), .D(dac0Out[5]));
FDCE dac0_d_6  (.Q(dac0_d[6]),   .C(clk),  .CE(1'b1),  .CLR(1'b0), .D(dac0Out[6]));
FDCE dac0_d_7  (.Q(dac0_d[7]),   .C(clk),  .CE(1'b1),  .CLR(1'b0), .D(dac0Out[7]));
FDCE dac0_d_8  (.Q(dac0_d[8]),   .C(clk),  .CE(1'b1),  .CLR(1'b0), .D(dac0Out[8]));
FDCE dac0_d_9  (.Q(dac0_d[9]),   .C(clk),  .CE(1'b1),  .CLR(1'b0), .D(dac0Out[9]));
FDCE dac0_d_10 (.Q(dac0_d[10]),  .C(clk),  .CE(1'b1),  .CLR(1'b0), .D(dac0Out[10]));
FDCE dac0_d_11 (.Q(dac0_d[11]),  .C(clk),  .CE(1'b1),  .CLR(1'b0), .D(dac0Out[11]));
FDCE dac0_d_12 (.Q(dac0_d[12]),  .C(clk),  .CE(1'b1),  .CLR(1'b0), .D(dac0Out[12]));
FDCE dac0_d_13 (.Q(dac0_d[13]),  .C(clk),  .CE(1'b1),  .CLR(1'b0), .D(~dac0Out[13]));
assign dac0_clk = clk;

FDCE dac1_d_0  (.Q(dac1_d[0]),   .C(clk),  .CE(1'b1),  .CLR(1'b0), .D(dac1Out[0]));
FDCE dac1_d_1  (.Q(dac1_d[1]),   .C(clk),  .CE(1'b1),  .CLR(1'b0), .D(dac1Out[1]));
FDCE dac1_d_2  (.Q(dac1_d[2]),   .C(clk),  .CE(1'b1),  .CLR(1'b0), .D(dac1Out[2]));
FDCE dac1_d_3  (.Q(dac1_d[3]),   .C(clk),  .CE(1'b1),  .CLR(1'b0), .D(dac1Out[3]));
FDCE dac1_d_4  (.Q(dac1_d[4]),   .C(clk),  .CE(1'b1),  .CLR(1'b0), .D(dac1Out[4]));
FDCE dac1_d_5  (.Q(dac1_d[5]),   .C(clk),  .CE(1'b1),  .CLR(1'b0), .D(dac1Out[5]));
FDCE dac1_d_6  (.Q(dac1_d[6]),   .C(clk),  .CE(1'b1),  .CLR(1'b0), .D(dac1Out[6]));
FDCE dac1_d_7  (.Q(dac1_d[7]),   .C(clk),  .CE(1'b1),  .CLR(1'b0), .D(dac1Out[7]));
FDCE dac1_d_8  (.Q(dac1_d[8]),   .C(clk),  .CE(1'b1),  .CLR(1'b0), .D(dac1Out[8]));
FDCE dac1_d_9  (.Q(dac1_d[9]),   .C(clk),  .CE(1'b1),  .CLR(1'b0), .D(dac1Out[9]));
FDCE dac1_d_10 (.Q(dac1_d[10]),  .C(clk),  .CE(1'b1),  .CLR(1'b0), .D(dac1Out[10]));
FDCE dac1_d_11 (.Q(dac1_d[11]),  .C(clk),  .CE(1'b1),  .CLR(1'b0), .D(dac1Out[11]));
FDCE dac1_d_12 (.Q(dac1_d[12]),  .C(clk),  .CE(1'b1),  .CLR(1'b0), .D(dac1Out[12]));
FDCE dac1_d_13 (.Q(dac1_d[13]),  .C(clk),  .CE(1'b1),  .CLR(1'b0), .D(~dac1Out[13]));
assign dac1_clk = clk;

FDCE dac2_d_0  (.Q(dac2_d[0]),   .C(clk),  .CE(1'b1),  .CLR(1'b0), .D(dac2Out[0]));
FDCE dac2_d_1  (.Q(dac2_d[1]),   .C(clk),  .CE(1'b1),  .CLR(1'b0), .D(dac2Out[1]));
FDCE dac2_d_2  (.Q(dac2_d[2]),   .C(clk),  .CE(1'b1),  .CLR(1'b0), .D(dac2Out[2]));
FDCE dac2_d_3  (.Q(dac2_d[3]),   .C(clk),  .CE(1'b1),  .CLR(1'b0), .D(dac2Out[3]));
FDCE dac2_d_4  (.Q(dac2_d[4]),   .C(clk),  .CE(1'b1),  .CLR(1'b0), .D(dac2Out[4]));
FDCE dac2_d_5  (.Q(dac2_d[5]),   .C(clk),  .CE(1'b1),  .CLR(1'b0), .D(dac2Out[5]));
FDCE dac2_d_6  (.Q(dac2_d[6]),   .C(clk),  .CE(1'b1),  .CLR(1'b0), .D(dac2Out[6]));
FDCE dac2_d_7  (.Q(dac2_d[7]),   .C(clk),  .CE(1'b1),  .CLR(1'b0), .D(dac2Out[7]));
FDCE dac2_d_8  (.Q(dac2_d[8]),   .C(clk),  .CE(1'b1),  .CLR(1'b0), .D(dac2Out[8]));
FDCE dac2_d_9  (.Q(dac2_d[9]),   .C(clk),  .CE(1'b1),  .CLR(1'b0), .D(dac2Out[9]));
FDCE dac2_d_10 (.Q(dac2_d[10]),  .C(clk),  .CE(1'b1),  .CLR(1'b0), .D(dac2Out[10]));
FDCE dac2_d_11 (.Q(dac2_d[11]),  .C(clk),  .CE(1'b1),  .CLR(1'b0), .D(dac2Out[11]));
FDCE dac2_d_12 (.Q(dac2_d[12]),  .C(clk),  .CE(1'b1),  .CLR(1'b0), .D(dac2Out[12]));
FDCE dac2_d_13 (.Q(dac2_d[13]),  .C(clk),  .CE(1'b1),  .CLR(1'b0), .D(~dac2Out[13]));
assign dac2_clk = clk;
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

wire iDec_wire = iBitReg ;
wire qDec_wire = qBitReg ;
wire decSymEn_wire = dataSymEnReg ;
wire decSym2xEn_wire = dataSym2xEnReg ;

always @(posedge clk) begin
    if (dec_in_sel)
        begin
        iDec <= sc0_iBit ;
        qDec <= sc0_qBit ;
        decoderSymEn <= sc0_iSymEn ;
        decoderSym2xEn <= sc0_iSym2xEn ;
        end
    else
        begin
        iDec <= iDec_wire ;
        qDec <= qDec_wire ;
        decoderSymEn <= decSymEn_wire ;
        decoderSym2xEn <= decSym2xEn_wire ;
        end
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
  .clk(clk),
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
  .wr_clk(clk),
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
  .clk(clk),
  .clk_en(decoder_cout),
  .clk_ref(pllRef),           // output pad, comparator reference clock
  .clk_vco(symb_pll_vco),     // input pad, vco output
  .clk_fbk(symb_pll_fbk),     // output pad, comparator feedback clock
  .clk_out(symb_pll_out)      // output, symbol clock
  );

reg symb_pll_ref;
always @(posedge clk) begin
    symb_pll_ref <= pllRef;
    end

wire clkOut = bypass_fifo ? symbol_clk : symb_pll_out;
wire cout = (clkOut) ^ !cout_inv;
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
  dout_i <= bypass_fifo ? decoder_dout_i : decoder_fifo_dout_i;
  decQ <= bypass_fifo ? decoder_dout_q : decoder_fifo_dout_q;
  end
reg dout_q;
always @(demodMode or qData or decQ) begin
    case (demodMode)
        `MODE_AQPSK,
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
        rd_mux <= sc0_dout[31:16];
        end
      else begin
        rd_mux <= sc0_dout[15:0];
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
    `VIDFIR0SPACE,
    `INTERP0SPACE: begin
       if (addr[1]) begin
         rd_mux <= interp0Dout[31:16];
         end
       else begin
         rd_mux <= interp0Dout[15:0];
         end
       end
     `VIDFIR1SPACE,
     `INTERP1SPACE: begin
       if (addr[1]) begin
         rd_mux <= interp1Dout[31:16];
         end
       else begin
         rd_mux <= interp1Dout[15:0];
         end
       end
     `VIDFIR2SPACE,
     `INTERP2SPACE: begin
       if (addr[1]) begin
         rd_mux <= interp2Dout[31:16];
         end
       else begin
         rd_mux <= interp2Dout[15:0];
         end
       end
   
     default : rd_mux <= 16'hxxxx;
    endcase
  end

assign data = (!nCs & !nRd) ? rd_mux : 16'hzzzz;

endmodule