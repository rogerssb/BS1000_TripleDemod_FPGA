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

module legacyPassThru (
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
    dac0_d,dac1_d,dac2_d,
    multiHSymEn,multiHSym2xEn,
    iMultiH,qMultiH,
    dataSymEn,dataSym2xEn,
    iData,qData,
    auSymClk,
    sdiOut,
    bsync_nLock,demod_nLock,
    );

input           nWe;
input           ck933;
input           nRd,nCs;
input           addr12;
input           addr11,addr10,addr9,addr8;
input           addr7, addr6,addr5,addr4;
input           addr3,addr2,addr1;
inout   [15:0]  data;
input   [13:0]  adc_d;

output  [3:0]   demodMode;

output  [3:0]   dac0Select,dac1Select,dac2Select;
output  [13:0]  dac0_d,dac1_d,dac2_d;

output          multiHSymEn,multiHSym2xEn;
output  [17:0]  iMultiH,qMultiH;

output          dataSymEn,dataSym2xEn;
output          iData,qData;

output          auSymClk;

output          bsync_nLock,demod_nLock;
output          sdiOut;

parameter VER_NUMBER = 16'h0000;

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
wire            pcmTrellisMode = (demodMode == `MODE_PCMTRELLIS);
wire            soqpskTrellisMode = (demodMode == `MODE_SOQPSK);
wire            multiHMode = (demodMode == `MODE_MULTIH);

wire    [3:0]   dac0Select,dac1Select,dac2Select;
wire    [17:0]  iSymData,qSymData;
wire            iBit,qBit;

wire    [17:0]  iEye,qEye;
wire    [4:0]   eyeOffset;
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
    .qSymClk(auSymClk),
    .qBit(qBit),
    .bitsyncLock(bitsyncLock),
    .carrierLock(carrierLock),
    .trellisSymSync(trellisSymSync),
    .iTrellis(iSymData),
    .qTrellis(qSymData),
    .eyeSync(eyeSync),
    .iEye(iEye),.qEye(qEye),
    .eyeOffset(eyeOffset)
    );

reg             pcmSymEn,soqpskSymEn;
reg             pcmSym2xEn,soqpskSym2xEn;
reg     [17:0]  iIn,qIn;
always @(posedge ck933) begin
    pcmSymEn <= trellisSymSync & pcmTrellisMode;
    pcmSym2xEn <= iSym2xEn & pcmTrellisMode;
    soqpskSymEn <= trellisSymSync & soqpskTrellisMode;
    soqpskSym2xEn <= iSym2xEn & soqpskTrellisMode;
    iIn <= iSymData;
    qIn <= qSymData;
    end

reg     [17:0]  iMultiH,qMultiH;
FDCE multiHSymEnFF  (.Q(multiHSymEn),   .C(ck933),  .CE(1'b1),  .CLR(1'b0), .D(trellisSymSync & multiHMode));
FDCE multiHSym2xEnFF  (.Q(multiHSym2xEn),   .C(ck933),  .CE(1'b1),  .CLR(1'b0), .D(iSym2xEn & multiHMode));
always @(posedge ck933) begin
    iMultiH <= iSymData;
    qMultiH <= qSymData;
    end


assign bsync_nLock = !bitsyncLock;
assign demod_nLock = !carrierLock;

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
    .legacyBit(iBit),
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
   

//******************************************************************************
//                          Trellis Muxes
//******************************************************************************
wire    [31:0] trellisDout = pcmTrellisMode
                           ? pcmTrellisDout
                           : soqpskTrellisDout;
wire    [17:0] trellis0Out = pcmTrellisMode
                           ? pcmTrellis0Out
                           : soqpskTrellis0Out;
wire    trellis0Sync = pcmTrellisMode
                     ? pcmTrellis0Sync
                     : soqpskTrellis0Sync;
wire    [17:0] trellis1Out = pcmTrellisMode
                           ? pcmTrellis1Out
                           : soqpskTrellis1Out;
wire    trellis1Sync = pcmTrellisMode
                     ? pcmTrellis1Sync
                     : soqpskTrellis1Sync;
wire    [17:0] trellis2Out = pcmTrellisMode
                           ? pcmTrellis2Out
                           : soqpskTrellis2Out;
wire    trellis2Sync = pcmTrellisMode
                     ? pcmTrellis2Sync
                     : soqpskTrellis2Sync;
`define RECLOCK_TRELLIS_OUTPUTS
`ifdef RECLOCK_TRELLIS_OUTPUTS
reg trellisSymEn,trellisSym2xEn,trellisBit;
always @(posedge ck933) begin
    trellisSymEn = pcmTrellisMode
                 ? pcmTrellisSymEn
                 : soqpskTrellisSymEn;
    trellisSym2xEn = pcmTrellisMode
                   ? pcmTrellisSym2xEn
                   : soqpskTrellisSym2xEn;
    trellisBit = pcmTrellisMode
               ? pcmTrellisBit
               : soqpskTrellisBit;
    end
`else
wire    trellisSymEn = pcmTrellisMode
                     ? pcmTrellisSymEn
                     : soqpskTrellisSymEn;
wire    trellisSym2xEn = pcmTrellisMode
                       ? pcmTrellisSym2xEn
                       : soqpskTrellisSym2xEn;
wire    trellisBit = pcmTrellisMode
                   ? pcmTrellisBit
                   : soqpskTrellisBit;
`endif

//******************************************************************************
//                              Demod Outputs
//******************************************************************************

wire trellisEn = (pcmTrellisMode || (demodMode == `MODE_SOQPSK));
reg  iData,qData;
reg  dataSymEn,dataSym2xEn;
always @(posedge ck933) begin
    iData <= trellisEn ? trellisBit : iBit;
    qData <= trellisEn ? trellisBit : qBit;
    dataSymEn <= trellisEn ? trellisSymEn : iSymEn;
    dataSym2xEn <= trellisEn ? trellisSym2xEn : iSym2xEn;
    end


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
FDCE dac0_d_13 (.Q(dac0_d[13]),  .C(ck933),  .CE(1'b1),  .CLR(1'b0), .D(dac0Data[17]));

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
FDCE dac1_d_13 (.Q(dac1_d[13]),  .C(ck933),  .CE(1'b1),  .CLR(1'b0), .D(dac1Data[17]));

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
FDCE dac2_d_13 (.Q(dac2_d[13]),  .C(ck933),  .CE(1'b1),  .CLR(1'b0), .D(dac2Data[17]));

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
FDCE dac0_d_13 (.Q(dac0_d[13]),  .C(ck933),  .CE(dac0Sync),  .CLR(1'b0), .D(dac0Out[17]));

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
FDCE dac1_d_13 (.Q(dac1_d[13]),  .C(ck933),  .CE(dac1Sync),  .CLR(1'b0), .D(dac1Out[17]));

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
FDCE dac2_d_13 (.Q(dac2_d[13]),  .C(ck933),  .CE(dac2Sync),  .CLR(1'b0), .D(dac2Out[17]));

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
    .eyeSync(eyeSync),
    .iEye(iEye),.qEye(qEye),
    .eyeOffset(eyeOffset),
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
  trellisDout or
  misc_dout or
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
        rd_mux <= trellisDout[31:16];
        end
      else begin
        rd_mux <= trellisDout[15:0];
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

endmodule