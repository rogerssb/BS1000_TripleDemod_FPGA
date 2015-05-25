`timescale 1ns/100ps
`include "addressMap.v"


module despreaderTop (
    ck933,
    nWe,nRd,nCs,
    addr12,
    addr11,addr10,addr9,addr8,
    addr7,addr6,addr5,addr4,
    addr3,addr2,addr1,
    data,
    adc_d,
    demodMode,
    dac0Select,dac1Select,dac2Select,
    auSymClk,
    sdiOut,
    bsync_nLock,demod_nLock,
    iSymData_pad,qSymData_pad,
    demod0OutPin,demod0SyncPin,
    demod1OutPin,demod1SyncPin,
    demod2OutPin,demod2SyncPin,
    trellisSymSync_pad,
    iData,qData,
    dataSymEn,dataSym2xEn,
    iSym2xEn_pad,
    legacyBit_pad,
    vt_txd,
    vt_rxd
    );

input           nWe,nRd,nCs;
input           ck933;
input           addr12;
input           addr11,addr10,addr9,addr8;
input           addr7, addr6,addr5,addr4;
input           addr3,addr2,addr1;
inout   [15:0]  data;
input   [13:0]  adc_d;

output  [4:0]   demodMode;
output  [3:0]   dac0Select,dac1Select,dac2Select;
output          auSymClk;
output          bsync_nLock,demod_nLock;
output          sdiOut;
output  [17:0]  iSymData_pad ;
reg     [17:0]  iSymData_pad ;
output  [17:0]  qSymData_pad ;
reg     [17:0]  qSymData_pad;
output  [13:0]  demod0OutPin,demod1OutPin,demod2OutPin;
output          demod0SyncPin,demod1SyncPin,demod2SyncPin;
output          trellisSymSync_pad ;
reg             trellisSymSync_pad ;
output          iData,qData;
output          dataSymEn,dataSym2xEn;
output          iSym2xEn_pad ;
reg             iSym2xEn_pad ;
output          legacyBit_pad ;
reg             legacyBit_pad ;
output          vt_txd;
input           vt_rxd;
reg     [15 : 0]    rd_mux;
reg     [31 : 0]    vt_bus;

parameter       VER_NUMBER = 16'h1019;

wire    [11 : 0]    addr = {addr11,addr10,addr9,addr8,addr7,addr6,addr5,addr4,addr3,addr2,addr1,1'b0};
wire    [31 : 0]    dataIn = {data,data};
wire                wr0 = !nCs & !nWe & !addr[1];
wire                wr1 = !nCs & !nWe & !addr[1];
wire                wr2 = !nCs & !nWe & addr[1];
wire                wr3 = !nCs & !nWe & addr[1];
//******************************************************************************
//                               Miscellaneous
//******************************************************************************
reg reset;
reg misc_space;
wire misc_en = !nCs && misc_space;

always @(addr) begin
  casex(addr)
    `MISC_SPACE: misc_space <= 1;
    default:     misc_space <= 0;
  endcase
end

// MISCSPACE Writes
reg             clockCounterEn;
reg             startClockCounter;
always @(posedge nWe or posedge clockCounterEn) begin
    if (clockCounterEn) begin
        startClockCounter <= 0;
        end
    else if (misc_en) begin
        casex (addr)
            `MISC_CLOCK:        startClockCounter <= 1;
            endcase
        end
    end

// MISCSPACE Reads
reg     [31:0]  misc_dout;
reg     [31:0]  clockCounterHold;
reg rs;
always @(addr or misc_en or nRd or clockCounterHold) begin
  if(misc_en && !nRd) begin
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

wire    [17:0]  demod0Out,demod1Out,demod2Out;
wire    [31:0]  demodDout;
wire    [4:0]   demodMode;
wire            pcmTrellisMode = (demodMode == `MODE_PCMTRELLIS);
wire            soqpskTrellisMode = (demodMode == `MODE_SOQPSK);
wire            multihMode = (demodMode == `MODE_MULTIH);

wire    [3:0]   dac0Select,dac1Select,dac2Select;
wire    [17:0]  iSymData,qSymData;
wire            iBit,qBit;

wire    [17:0]  iEye,qEye;
wire    [4:0]   eyeOffset;

`ifdef INTERNAL_ADAPT
wire    [31:0]  avgDeviation;
`endif

demod demod(
    .clk(ck933), .reset(reset),
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
    .qSymClk(auSymClk),
    .qBit(qBit),
    .bitsyncLock(bitsyncLock),
    .carrierLock(carrierLock),
    .trellisSymSync(trellisSymSync),
    .iTrellis(iSymData),
    .qTrellis(qSymData),
    .eyeSync(eyeSync),
    .iEye(iEye),.qEye(qEye),
    `ifdef INTERNAL_ADAPT
    .eyeOffset(eyeOffset),
    .avgDeviation(avgDeviation)
    `else //INTERNAL_ADAPT
    .eyeOffset(eyeOffset)
    `endif //INTERNAL_ADAPT
    );

reg              demod0SyncPin,demod1SyncPin,demod2SyncPin;
always @ (posedge ck933)
    begin
    demod0SyncPin <= demod0Sync;
    demod1SyncPin <= demod1Sync;
    demod2SyncPin <= demod2Sync;
    end

assign bsync_nLock = !bitsyncLock;
assign demod_nLock = !carrierLock;
//******************************************************************************
//                              Demod Outputs
//******************************************************************************
wire fmModes = ( (demodMode == `MODE_2FSK)
              || (demodMode == `MODE_FM)
               );
reg  iData,qData;
reg  dataSymEn,dataSym2xEn;
always @(posedge ck933) begin
    if (fmModes) begin
        iData <= ~iBit;
        end
    else begin
        iData <= iBit;
        end
    qData <= qBit;
    dataSymEn <= iSymEn;
    dataSym2xEn <= iSym2xEn;
    end

FDCE demod0OutPin_0  (.Q(demod0OutPin[0]),   .C(ck933),  .CE(1'b1),  .CLR(1'b0), .D(demod0Out[4]));
FDCE demod0OutPin_1  (.Q(demod0OutPin[1]),   .C(ck933),  .CE(1'b1),  .CLR(1'b0), .D(demod0Out[5]));
FDCE demod0OutPin_2  (.Q(demod0OutPin[2]),   .C(ck933),  .CE(1'b1),  .CLR(1'b0), .D(demod0Out[6]));
FDCE demod0OutPin_3  (.Q(demod0OutPin[3]),   .C(ck933),  .CE(1'b1),  .CLR(1'b0), .D(demod0Out[7]));
FDCE demod0OutPin_4  (.Q(demod0OutPin[4]),   .C(ck933),  .CE(1'b1),  .CLR(1'b0), .D(demod0Out[8]));
FDCE demod0OutPin_5  (.Q(demod0OutPin[5]),   .C(ck933),  .CE(1'b1),  .CLR(1'b0), .D(demod0Out[9]));
FDCE demod0OutPin_6  (.Q(demod0OutPin[6]),   .C(ck933),  .CE(1'b1),  .CLR(1'b0), .D(demod0Out[10]));
FDCE demod0OutPin_7  (.Q(demod0OutPin[7]),   .C(ck933),  .CE(1'b1),  .CLR(1'b0), .D(demod0Out[11]));
FDCE demod0OutPin_8  (.Q(demod0OutPin[8]),   .C(ck933),  .CE(1'b1),  .CLR(1'b0), .D(demod0Out[12]));
FDCE demod0OutPin_9  (.Q(demod0OutPin[9]),   .C(ck933),  .CE(1'b1),  .CLR(1'b0), .D(demod0Out[13]));
FDCE demod0OutPin_10 (.Q(demod0OutPin[10]),  .C(ck933),  .CE(1'b1),  .CLR(1'b0), .D(demod0Out[14]));
FDCE demod0OutPin_11 (.Q(demod0OutPin[11]),  .C(ck933),  .CE(1'b1),  .CLR(1'b0), .D(demod0Out[15]));
FDCE demod0OutPin_12 (.Q(demod0OutPin[12]),  .C(ck933),  .CE(1'b1),  .CLR(1'b0), .D(demod0Out[16]));
FDCE demod0OutPin_13 (.Q(demod0OutPin[13]),  .C(ck933),  .CE(1'b1),  .CLR(1'b0), .D(demod0Out[17]));

FDCE demod1OutPin_0  (.Q(demod1OutPin[0]),   .C(ck933),  .CE(1'b1),  .CLR(1'b0), .D(demod1Out[4]));
FDCE demod1OutPin_1  (.Q(demod1OutPin[1]),   .C(ck933),  .CE(1'b1),  .CLR(1'b0), .D(demod1Out[5]));
FDCE demod1OutPin_2  (.Q(demod1OutPin[2]),   .C(ck933),  .CE(1'b1),  .CLR(1'b0), .D(demod1Out[6]));
FDCE demod1OutPin_3  (.Q(demod1OutPin[3]),   .C(ck933),  .CE(1'b1),  .CLR(1'b0), .D(demod1Out[7]));
FDCE demod1OutPin_4  (.Q(demod1OutPin[4]),   .C(ck933),  .CE(1'b1),  .CLR(1'b0), .D(demod1Out[8]));
FDCE demod1OutPin_5  (.Q(demod1OutPin[5]),   .C(ck933),  .CE(1'b1),  .CLR(1'b0), .D(demod1Out[9]));
FDCE demod1OutPin_6  (.Q(demod1OutPin[6]),   .C(ck933),  .CE(1'b1),  .CLR(1'b0), .D(demod1Out[10]));
FDCE demod1OutPin_7  (.Q(demod1OutPin[7]),   .C(ck933),  .CE(1'b1),  .CLR(1'b0), .D(demod1Out[11]));
FDCE demod1OutPin_8  (.Q(demod1OutPin[8]),   .C(ck933),  .CE(1'b1),  .CLR(1'b0), .D(demod1Out[12]));
FDCE demod1OutPin_9  (.Q(demod1OutPin[9]),   .C(ck933),  .CE(1'b1),  .CLR(1'b0), .D(demod1Out[13]));
FDCE demod1OutPin_10 (.Q(demod1OutPin[10]),  .C(ck933),  .CE(1'b1),  .CLR(1'b0), .D(demod1Out[14]));
FDCE demod1OutPin_11 (.Q(demod1OutPin[11]),  .C(ck933),  .CE(1'b1),  .CLR(1'b0), .D(demod1Out[15]));
FDCE demod1OutPin_12 (.Q(demod1OutPin[12]),  .C(ck933),  .CE(1'b1),  .CLR(1'b0), .D(demod1Out[16]));
FDCE demod1OutPin_13 (.Q(demod1OutPin[13]),  .C(ck933),  .CE(1'b1),  .CLR(1'b0), .D(demod1Out[17]));

FDCE demod2OutPin_0  (.Q(demod2OutPin[0]),   .C(ck933),  .CE(1'b1),  .CLR(1'b0), .D(demod2Out[4]));
FDCE demod2OutPin_1  (.Q(demod2OutPin[1]),   .C(ck933),  .CE(1'b1),  .CLR(1'b0), .D(demod2Out[5]));
FDCE demod2OutPin_2  (.Q(demod2OutPin[2]),   .C(ck933),  .CE(1'b1),  .CLR(1'b0), .D(demod2Out[6]));
FDCE demod2OutPin_3  (.Q(demod2OutPin[3]),   .C(ck933),  .CE(1'b1),  .CLR(1'b0), .D(demod2Out[7]));
FDCE demod2OutPin_4  (.Q(demod2OutPin[4]),   .C(ck933),  .CE(1'b1),  .CLR(1'b0), .D(demod2Out[8]));
FDCE demod2OutPin_5  (.Q(demod2OutPin[5]),   .C(ck933),  .CE(1'b1),  .CLR(1'b0), .D(demod2Out[9]));
FDCE demod2OutPin_6  (.Q(demod2OutPin[6]),   .C(ck933),  .CE(1'b1),  .CLR(1'b0), .D(demod2Out[10]));
FDCE demod2OutPin_7  (.Q(demod2OutPin[7]),   .C(ck933),  .CE(1'b1),  .CLR(1'b0), .D(demod2Out[11]));
FDCE demod2OutPin_8  (.Q(demod2OutPin[8]),   .C(ck933),  .CE(1'b1),  .CLR(1'b0), .D(demod2Out[12]));
FDCE demod2OutPin_9  (.Q(demod2OutPin[9]),   .C(ck933),  .CE(1'b1),  .CLR(1'b0), .D(demod2Out[13]));
FDCE demod2OutPin_10 (.Q(demod2OutPin[10]),  .C(ck933),  .CE(1'b1),  .CLR(1'b0), .D(demod2Out[14]));
FDCE demod2OutPin_11 (.Q(demod2OutPin[11]),  .C(ck933),  .CE(1'b1),  .CLR(1'b0), .D(demod2Out[15]));
FDCE demod2OutPin_12 (.Q(demod2OutPin[12]),  .C(ck933),  .CE(1'b1),  .CLR(1'b0), .D(demod2Out[16]));
FDCE demod2OutPin_13 (.Q(demod2OutPin[13]),  .C(ck933),  .CE(1'b1),  .CLR(1'b0), .D(demod2Out[17]));
//******************************************************************************
//                        SDI Output Interface
//******************************************************************************
wire    [31:0]  sdiDout;
//sdi sdi(
//    .clk(ck933),
//    .reset(reset),
//    .wr0(wr0),
//    .wr1(wr1),
//    .wr2(wr2),
//    .wr3(wr3),
//    .addr(addr),
//    .dataIn(dataIn),
//    .dataOut(sdiDout),
//    .iSymEn(iSymEn),
//    .iSymData(iSymData),
//    .qSymEn(qSymEn),
//    .qSymData(qSymData),
//    .eyeSync(eyeSync),
//    .iEye(iEye),.qEye(qEye),
//    .eyeOffset(eyeOffset),
//    .bitsyncLock(!bsync_nLock), .demodLock(!demod_nLock),
//    .sdiOut(sdiOut)
//    );
//******************************************************************************
//                           Processor Read Data Mux
//******************************************************************************
always @* begin
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
        rd_mux <= demodDout[31:16];
        end
      else begin
        rd_mux <= demodDout[15:0];
        end
      end
    `MISC_SPACE : begin
        if (addr[1]) begin
            rd_mux <= misc_dout[31:16];
            end
        else begin
            rd_mux <= misc_dout[15:0];
            end
        end
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

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// Non-mdb cma register access
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
`ifdef TERMITE
reg     [1 : 0] vt_clk_div;
reg             vt_clk;
always @ (posedge ck933) begin
    vt_clk_div <= vt_clk_div - 2'b1;
    vt_clk <= vt_clk_div[1];
    end

wire    [15 : 0]    vt_addr;
wire    [15 : 0]    vt_dout;
reg     [15 : 0]    vt_din;
wire                vt_we,vt_ce,vt_oe;

termite vt (
    .addr       (vt_addr        ),      // address to registers
    .ce         (vt_ce          ),      // chip enable, high-true
    .clk        (vt_clk         ),      // synchronous logic clock
    .ctrl_q     (               ),      // device control, DC1
    .ctrl_r     (               ),      // DC2
    .ctrl_s     (               ),      // DC3
    .ctrl_t     (               ),      // DC4
    .din        (vt_din         ),      // read data from registers
    .dout       (vt_dout        ),      // write data to registers
    .oe         (vt_oe          ),      // tri-state enable, high true
    .rst        (reset          ),      // synchronous logic reset
    .rxd        (vt_rxd         ),      // async receive data
    .txd        (vt_txd         ),      // async transmit data
    .we         (vt_we          )       // write enable, high true
    );

always @ (negedge vt_we or posedge reset) begin
    if (reset) begin
        vt_bus[31 : 0] <= 32'b0;
        vt_bus[25 : 24] <= 2'b00;      // wtReset, enable
        vt_bus[18 : 16] <= 3'b001;     // stepExpo
        vt_bus[15 : 0] <= 16'h08F5;    // refLevel
        end
    else begin
        case (vt_addr[1 : 0])
            2'b00 : vt_bus[15 : 0] <= vt_dout[15 : 0]; //EQUAL_REF_LEVEL
            2'b01 : vt_bus[23 : 16] <= vt_dout[7 : 0]; //EQUAL_STEP_EXPO
            2'b10 : vt_bus[31 : 24] <= vt_dout[7 : 0]; //EQUAL_CONTROL
            endcase
        end
    end

always @* begin
    vt_din = 16'h0000;
    case (vt_addr[1 : 0])
        2'b00 : vt_din[15 : 0] = vt_bus[15 : 0];
        2'b01 : vt_din[7 : 0] = vt_bus[23 : 16];
        2'b10 : vt_din[7 : 0] = vt_bus[31 : 24];
        2'b11 : vt_din[15 : 0] = 16'h0; //VER_NUMBER;
        endcase
    end

`endif //TERMITE

boot_manager bm(
    .rst(reset),
    .clk(ck933),
    .ena(misc_en),
    .wr0(wr0),
    .wr2(wr2),
    .addr(addr),
    .data(dataIn[15 : 0])
    );

// 12 Jun 13
// IOB reclocking of outputs to trellis
always @ (posedge ck933) begin
    legacyBit_pad <= iBit ;
    end
always @ (posedge ck933) begin
    trellisSymSync_pad <= trellisSymSync ;
    end
always @ (posedge ck933) begin
    iSym2xEn_pad <= iSym2xEn ;
    end
always @ (posedge ck933) begin
    iSymData_pad <= iSymData ;
    qSymData_pad <= qSymData ;
    end

endmodule
