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

`ifdef ADD_CMA
module legacyCmaTop (
`else
module legacyDemodTop (
`endif
    clk,
    nWe,nRd,nCs,
    addr12,
    addr11,addr10,addr9,addr8,
    addr7,addr6,addr5,addr4,
    addr3,addr2,addr1,
    data,
    adc_d,
    multihPhaseError,
    multihPhaseErrorEn,
    multihPhaseErrorValid,
    demodMode,
    dac0Sync,dac1Sync,dac2Sync,
    dac0Select,dac1Select,dac2Select,
    dac0_d,dac1_d,dac2_d,
    dataSymEn,dataSym2xEn,
    iData,qData,
    auSymClk,
    sdiOut,
    bsync_nLock,demod_nLock,
    trellisSymEn,
    trellisSym2xEn,
    iTrellis,
    qTrellis,
    legacyBit     
    );

input           nWe;
input           clk;
input           nRd,nCs;
input           addr12;
input           addr11,addr10,addr9,addr8;
input           addr7, addr6,addr5,addr4;
input           addr3,addr2,addr1;
inout   [15:0]  data;
input   [13:0]  adc_d;
input   [7:0]   multihPhaseError;
input           multihPhaseErrorEn;
input           multihPhaseErrorValid;

output  [4:0]   demodMode;

output          dac0Sync,dac1Sync,dac2Sync;
output  [3:0]   dac0Select,dac1Select,dac2Select;
output  [13:0]  dac0_d,dac1_d,dac2_d;

output          dataSymEn,dataSym2xEn;
output          iData,qData;

output          auSymClk;

output          bsync_nLock,demod_nLock;
output          sdiOut;

output          trellisSymEn;
output          trellisSym2xEn;
output  [17:0]  iTrellis;  
output  [17:0]  qTrellis;  
output          legacyBit;

parameter VER_NUMBER = 16'd432;

wire    [12:0]  addr = {addr12,addr11,addr10,addr9,addr8,addr7,addr6,addr5,addr4,addr3,addr2,addr1,1'b0};
wire            nWr = nWe;
wire            rd  = !nCs & !nRd;
wire            wr0 = !nCs & !nWr & !addr1;
wire            wr1 = !nCs & !nWr & !addr1;
wire            wr2 = !nCs & !nWr & addr1;
wire            wr3 = !nCs & !nWr & addr1;
wire    [31:0]  dataIn = {data,data};
reg     [15:0]  rd_mux;


//******************************************************************************
//                               Miscellaneous
//******************************************************************************

reg misc_space;
always @* begin
  casex(addr)
    `MISC_SPACE: misc_space = 1;
    default:     misc_space = 0;
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
            `MISC_CLOCK:        startClockCounter <= 1;
            endcase
        end
    end

reg     [23:0]  boot_addr;
always @(negedge wr0) begin
    if (misc_en) begin
        casex (addr)
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
reg     [31:0]  clockCounterHold;
reg rs;
always @* begin
  if(misc_en && !nRd) begin
    casex (addr)
            `MISC_RESET: begin
                rs = 1;
                misc_dout = 32'b0;
                end
            `MISC_VERSION: begin
                rs = 0;
                misc_dout = {VER_NUMBER,16'b0};
                end
            `MISC_CLOCK: begin
                rs = 0;
                misc_dout = clockCounterHold;
                end
            `MISC_TYPE: begin
                rs = 0;
                `ifdef ADD_CMA
                misc_dout = {16'b0,`LEGACY_CMA_IMAGE};
                `else
                misc_dout = {16'b0,`LEGACY_DEMOD_IMAGE};
                `endif
                end
            default: begin
                misc_dout = 32'b0;
                rs = 0;
                end
    endcase
    end else begin
        rs = 0;
        misc_dout = 32'b0;
    end

end

reg     [31:0]  clockCounter;
reg             sc0,sc1;
reg             me0,me1;
always @(posedge clk) begin
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
                reboot_decode = 1'b1 ;
                end
            default: reboot_decode = 1'b0 ;
        endcase
        end
    else
        begin
        reboot_decode = 1'b0 ;
        end
    end

always @ (posedge clk)
    begin
    reboot_decode_sync <= {reboot_decode_sync[6:0],reboot_decode};
    reboot <= (reboot_decode_sync[7:6] == 2'b10);
    end

reg reset;
multiboot multiboot
    (
    .addr(boot_addr),
    .clk(clk),
    .reset(reset),
    .pulse(reboot)
    );


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
//                              Reclock ADC Inputs
//******************************************************************************
// This should get these FFs into the IOB.

reg     [13:0]  ifInput;
always @(posedge clk) begin
    ifInput <= adc_d;
    end

//******************************************************************************
//                                Legacy Demod
//******************************************************************************

wire    [17:0]  demod0Out,demod1Out,demod2Out;
wire    [31:0]  demodDout;
wire    [4:0]   demodMode;
wire            multihMode = (demodMode == `MODE_MULTIH);

wire    [3:0]   dac0Select,dac1Select,dac2Select;
wire    [17:0]  iSymData,qSymData;
wire            iBit,qBit;

`ifdef ADD_SCPATH
wire    [17:0]  iScPath,qScPath;
`endif

wire    [17:0]  iEye,qEye;
wire    [4:0]   eyeOffset;

`ifdef INTERNAL_ADAPT
wire    [31:0]  avgDeviation;
`endif

wire    [17:0]  sdiDataI,sdiDataQ;
demod demod(
    .clk(clk), .reset(reset),
    .wr0(wr0 & !addr12), .wr1(wr1 & !addr12), .wr2(wr2 & !addr12), .wr3(wr3 & !addr12),
    .addr(addr),
    .din(dataIn),
    .dout(demodDout),
    .demodMode(demodMode),
    .bbClkEn(1'b0),
    .iBB(18'h0), .qBB(18'h0),
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
    .iSymData(sdiDataI),
    .iSym2xEn(iSym2xEn),
    .iSymEn(iSymEn),
    .iBit(iBit),
    .qSymData(sdiDataQ),
    .qSym2xEn(qSym2xEn),
    .qSymEn(qSymEn),
    .qBit(qBit),
    .auSymClk(auSymClk),
    .auBit(auBit),
    .timingLock(bitsyncLock),
    .carrierLock(carrierLock),
    .trellisSymSync(trellisSymSync),
    .iTrellis(iSymData),
    .qTrellis(qSymData),
    `ifdef ADD_SCPATH
    .enableScPath(enableScPath),
    .iBBOut(iScPath), .qBBOut(qScPath),
    .bbClkEnOut(scPathClkEn),
    `endif
    `ifdef ADD_DESPREADER
    .iEpoch(iEpoch), .qEpoch(qEpoch),
    `endif
    .sdiSymEn(sdiSymEn),
    .eyeSync(eyeSync),
    .iEye(iEye),.qEye(qEye),
    .eyeOffset(eyeOffset)
    );

assign bsync_nLock = !bitsyncLock;

`ifdef ADD_SCPATH
//******************************************************************************
//                           Subcarrier Demod IF Path
//******************************************************************************

wire    [17:0]  scDemodOut;
wire    [31:0]  scPathDout;
scIfPath scIfPath(
    .clk(clk), .reset(reset),
    .wr0(wr0), .wr1(wr1), .wr2(wr2), .wr3(wr3),
    .addr(addr),
    .din(dataIn),
    .dout(scPathDout),
    .bbClkEn(scPathClkEn),
    .iBB(iScPath), .qBB(qScPath),
    .demodMode(demodMode),
    .scDemodOut(scDemodOut),
    .scClkEn(scClkEn)
    );

`define ADD_SCINTERP
`ifdef ADD_SCINTERP
wire    [31:0]  scInterpDout;
wire    [17:0]  interpData;
interpolate #(.RegSpace(`INTERP2SPACE), .FirRegSpace(`VIDFIR2SPACE)) scInterp(
    .clk(clk), .reset(reset), .clkEn(scClkEn),
    .wr0(wr0), .wr1(wr1), .wr2(wr2), .wr3(wr3),
    .addr(addr),
    .din(dataIn),
    .dout(scInterpDout),
    .dataIn(scDemodOut),
    .dataOut(interpData),
    .clkEnOut(interpClkEn)
    );
`endif

`endif

//******************************************************************************
//                           MultiH Carrier Loop
//******************************************************************************

// Signals originating in the legacy demod going to the multih carrier loop
reg             multihSymEn;
reg             multihSym2xEn;
reg     [17:0]  iMultihIn,qMultihIn;
always @(posedge clk) begin
    multihSymEn <= trellisSymSync & multihMode;
    multihSym2xEn <= iSym2xEn & multihMode;
    iMultihIn <= iSymData;
    qMultihIn <= qSymData;
    end


// Signals originating in FPGA2 going to the multih carrier loop
reg     [7:0]   multihPhaseErrorIn;
reg             multihPhaseErrorEnIn;
reg             multihPhaseErrorValidIn;
always @(posedge clk) begin
    multihPhaseErrorIn <= multihPhaseError;
    multihPhaseErrorEnIn <= multihPhaseErrorEn;
    multihPhaseErrorValidIn <= multihPhaseErrorValid;
    end

wire    [17:0]  multihDac0Data,multihDac1Data,multihDac2Data;
wire    [17:0]  iMultihLoop,qMultihLoop;
wire    [31:0]  multihLoopDout;
multihCarrierLoop multihLoop(
    .clk(clk),
    .reset(reset),
    .symEn(multihSymEn),
    .sym2xEn(multihSym2xEn),
    .iIn(iMultihIn),
    .qIn(qMultihIn),
    .phaseError(multihPhaseErrorIn),
    .phaseErrorEn(multihPhaseErrorEnIn),
    .phaseErrorValid(multihPhaseErrorValidIn),
    .wr0(wr0),
    .wr1(wr1),
    .wr2(wr2),
    .wr3(wr3),
    .addr(addr),
    .din(dataIn),
    .dout(multihLoopDout),
    .dac0Select(dac0Select),.dac1Select(dac1Select),.dac2Select(dac2Select),
    .dac0Sync(multihDac0Sync),
    .dac0Data(multihDac0Data),
    .dac0En(multihDac0En),
    .dac1Sync(multihDac1Sync),
    .dac1Data(multihDac1Data),
    .dac1En(multihDac1En),
    .dac2Sync(multihDac2Sync),
    .dac2Data(multihDac2Data),
    .dac2En(multihDac2En),
    .demodLock(multihDemodLock),
    .iOut(iMultihLoop),
    .qOut(qMultihLoop),
    .symEnOut(multihLoopEn),
    .sym2xEnOut(multihLoop2xEn)
    );


// Output signals going to FPGA2
reg             trellisSymEn;
reg             trellisSym2xEn;
reg     [17:0]  iTrellis,qTrellis;
reg             legacyBit;
always @(posedge clk) begin
    trellisSymEn <=     multihMode ? multihLoopEn : trellisSymSync;
    trellisSym2xEn <=   multihMode ? multihLoop2xEn : iSym2xEn;
    iTrellis <=         multihMode ? iMultihLoop : iSymData;
    qTrellis <=         multihMode ? qMultihLoop : qSymData;
    legacyBit <=        iBit;
    end


assign demod_nLock = multihMode ? !multihDemodLock : !carrierLock;


//******************************************************************************
//                              Demod Outputs
//******************************************************************************
wire fmModes = ( (demodMode == `MODE_2FSK)
              || (demodMode == `MODE_FM)
               );
wire aModes  = ( (demodMode == `MODE_AUQPSK)
              || (demodMode == `MODE_AQPSK)
               );
reg  iData,qData;
reg  dataSymEn,dataSym2xEn;
always @(posedge clk) begin
    if (fmModes) begin
        iData <= ~iBit;
        end
    else begin
        iData <= iBit;
        end
    if (aModes) begin
        qData <= auBit;
        end
    else begin
        qData <= qBit;
        end
    dataSymEn <= iSymEn;
    dataSym2xEn <= iSym2xEn;
    end


//******************************************************************************
//                              DAC Outputs
//******************************************************************************
wire    [15:0]  bepLLR;
reg     [17:0]  dac0Out,dac1Out,dac2Out;
reg             dac0Sync,dac1Sync,dac2Sync;
always @(posedge clk) begin
    if (multihDac0En && multihMode) begin
        dac0Out <= multihDac0Data;
        dac0Sync <= multihDac0Sync;
        end
    else begin
        dac0Out <= demod0Out;
        dac0Sync <= demod0Sync;
        end
    if (multihDac1En && multihMode) begin
        dac1Out <= multihDac1Data;
        dac1Sync <= multihDac1Sync;
        end
    else begin
        dac1Out <= demod1Out;
        dac1Sync <= demod1Sync;
        end
    `ifdef ADD_SCPATH
    if (enableScPath) begin
        `ifdef ADD_SCINTERP
        dac2Out <= interpData;
        dac2Sync <= 1'b1;
        `else
        dac2Out <= scDemodOut;
        dac2Sync <= scClkEn;
        `endif
        end
    else if (multihDac2En && multihMode) begin
    `else
    if (multihDac2En && multihMode) begin
    `endif
        dac2Out <= multihDac2Data;
        dac2Sync <= multihDac2Sync;
        end
    else begin
        dac2Out <= demod2Out;
        dac2Sync <= demod2Sync;
        end
    end

FDCE dac0_d_0  (.Q(dac0_d[0]),   .C(clk),  .CE(dac0Sync),  .CLR(1'b0), .D(dac0Out[4]));
FDCE dac0_d_1  (.Q(dac0_d[1]),   .C(clk),  .CE(dac0Sync),  .CLR(1'b0), .D(dac0Out[5]));
FDCE dac0_d_2  (.Q(dac0_d[2]),   .C(clk),  .CE(dac0Sync),  .CLR(1'b0), .D(dac0Out[6]));
FDCE dac0_d_3  (.Q(dac0_d[3]),   .C(clk),  .CE(dac0Sync),  .CLR(1'b0), .D(dac0Out[7]));
FDCE dac0_d_4  (.Q(dac0_d[4]),   .C(clk),  .CE(dac0Sync),  .CLR(1'b0), .D(dac0Out[8]));
FDCE dac0_d_5  (.Q(dac0_d[5]),   .C(clk),  .CE(dac0Sync),  .CLR(1'b0), .D(dac0Out[9]));
FDCE dac0_d_6  (.Q(dac0_d[6]),   .C(clk),  .CE(dac0Sync),  .CLR(1'b0), .D(dac0Out[10]));
FDCE dac0_d_7  (.Q(dac0_d[7]),   .C(clk),  .CE(dac0Sync),  .CLR(1'b0), .D(dac0Out[11]));
FDCE dac0_d_8  (.Q(dac0_d[8]),   .C(clk),  .CE(dac0Sync),  .CLR(1'b0), .D(dac0Out[12]));
FDCE dac0_d_9  (.Q(dac0_d[9]),   .C(clk),  .CE(dac0Sync),  .CLR(1'b0), .D(dac0Out[13]));
FDCE dac0_d_10 (.Q(dac0_d[10]),  .C(clk),  .CE(dac0Sync),  .CLR(1'b0), .D(dac0Out[14]));
FDCE dac0_d_11 (.Q(dac0_d[11]),  .C(clk),  .CE(dac0Sync),  .CLR(1'b0), .D(dac0Out[15]));
FDCE dac0_d_12 (.Q(dac0_d[12]),  .C(clk),  .CE(dac0Sync),  .CLR(1'b0), .D(dac0Out[16]));
FDCE dac0_d_13 (.Q(dac0_d[13]),  .C(clk),  .CE(dac0Sync),  .CLR(1'b0), .D(dac0Out[17]));

FDCE dac1_d_0  (.Q(dac1_d[0]),   .C(clk),  .CE(dac1Sync),  .CLR(1'b0), .D(dac1Out[4]));
FDCE dac1_d_1  (.Q(dac1_d[1]),   .C(clk),  .CE(dac1Sync),  .CLR(1'b0), .D(dac1Out[5]));
FDCE dac1_d_2  (.Q(dac1_d[2]),   .C(clk),  .CE(dac1Sync),  .CLR(1'b0), .D(dac1Out[6]));
FDCE dac1_d_3  (.Q(dac1_d[3]),   .C(clk),  .CE(dac1Sync),  .CLR(1'b0), .D(dac1Out[7]));
FDCE dac1_d_4  (.Q(dac1_d[4]),   .C(clk),  .CE(dac1Sync),  .CLR(1'b0), .D(dac1Out[8]));
FDCE dac1_d_5  (.Q(dac1_d[5]),   .C(clk),  .CE(dac1Sync),  .CLR(1'b0), .D(dac1Out[9]));
FDCE dac1_d_6  (.Q(dac1_d[6]),   .C(clk),  .CE(dac1Sync),  .CLR(1'b0), .D(dac1Out[10]));
FDCE dac1_d_7  (.Q(dac1_d[7]),   .C(clk),  .CE(dac1Sync),  .CLR(1'b0), .D(dac1Out[11]));
FDCE dac1_d_8  (.Q(dac1_d[8]),   .C(clk),  .CE(dac1Sync),  .CLR(1'b0), .D(dac1Out[12]));
FDCE dac1_d_9  (.Q(dac1_d[9]),   .C(clk),  .CE(dac1Sync),  .CLR(1'b0), .D(dac1Out[13]));
FDCE dac1_d_10 (.Q(dac1_d[10]),  .C(clk),  .CE(dac1Sync),  .CLR(1'b0), .D(dac1Out[14]));
FDCE dac1_d_11 (.Q(dac1_d[11]),  .C(clk),  .CE(dac1Sync),  .CLR(1'b0), .D(dac1Out[15]));
FDCE dac1_d_12 (.Q(dac1_d[12]),  .C(clk),  .CE(dac1Sync),  .CLR(1'b0), .D(dac1Out[16]));
FDCE dac1_d_13 (.Q(dac1_d[13]),  .C(clk),  .CE(dac1Sync),  .CLR(1'b0), .D(dac1Out[17]));

//`define USE_SC_INTERP
`ifdef USE_SC_INTERP
wire    [31:0]  interpDout;
wire    [17:0]  interpData;
interpolate #(.RegSpace(`INTERP2SPACE), .FirRegSpace(`VIDFIR2SPACE)) scInterp(
    .clk(clk), .reset(reset), .clkEn(dac2Sync),
    .wr0(wr0), .wr1(wr1), .wr2(wr2), .wr3(wr3),
    .addr(addr),
    .din(dataIn),
    .dout(scInterpDout),
    .dataIn(dac2Out),
    .dataOut(interpData),
    .clkEnOut(interpClkEn)
    );


FDCE dac2_d_0  (.Q(dac2_d[0]),   .C(clk),  .CE(interpClkEn),  .CLR(1'b0), .D(interpData[4]));
FDCE dac2_d_1  (.Q(dac2_d[1]),   .C(clk),  .CE(interpClkEn),  .CLR(1'b0), .D(interpData[5]));
FDCE dac2_d_2  (.Q(dac2_d[2]),   .C(clk),  .CE(interpClkEn),  .CLR(1'b0), .D(interpData[6]));
FDCE dac2_d_3  (.Q(dac2_d[3]),   .C(clk),  .CE(interpClkEn),  .CLR(1'b0), .D(interpData[7]));
FDCE dac2_d_4  (.Q(dac2_d[4]),   .C(clk),  .CE(interpClkEn),  .CLR(1'b0), .D(interpData[8]));
FDCE dac2_d_5  (.Q(dac2_d[5]),   .C(clk),  .CE(interpClkEn),  .CLR(1'b0), .D(interpData[9]));
FDCE dac2_d_6  (.Q(dac2_d[6]),   .C(clk),  .CE(interpClkEn),  .CLR(1'b0), .D(interpData[10]));
FDCE dac2_d_7  (.Q(dac2_d[7]),   .C(clk),  .CE(interpClkEn),  .CLR(1'b0), .D(interpData[11]));
FDCE dac2_d_8  (.Q(dac2_d[8]),   .C(clk),  .CE(interpClkEn),  .CLR(1'b0), .D(interpData[12]));
FDCE dac2_d_9  (.Q(dac2_d[9]),   .C(clk),  .CE(interpClkEn),  .CLR(1'b0), .D(interpData[13]));
FDCE dac2_d_10 (.Q(dac2_d[10]),  .C(clk),  .CE(interpClkEn),  .CLR(1'b0), .D(interpData[14]));
FDCE dac2_d_11 (.Q(dac2_d[11]),  .C(clk),  .CE(interpClkEn),  .CLR(1'b0), .D(interpData[15]));
FDCE dac2_d_12 (.Q(dac2_d[12]),  .C(clk),  .CE(interpClkEn),  .CLR(1'b0), .D(interpData[16]));
FDCE dac2_d_13 (.Q(dac2_d[13]),  .C(clk),  .CE(interpClkEn),  .CLR(1'b0), .D(interpData[17]));

`else
FDCE dac2_d_0  (.Q(dac2_d[0]),   .C(clk),  .CE(dac2Sync),  .CLR(1'b0), .D(dac2Out[4]));
FDCE dac2_d_1  (.Q(dac2_d[1]),   .C(clk),  .CE(dac2Sync),  .CLR(1'b0), .D(dac2Out[5]));
FDCE dac2_d_2  (.Q(dac2_d[2]),   .C(clk),  .CE(dac2Sync),  .CLR(1'b0), .D(dac2Out[6]));
FDCE dac2_d_3  (.Q(dac2_d[3]),   .C(clk),  .CE(dac2Sync),  .CLR(1'b0), .D(dac2Out[7]));
FDCE dac2_d_4  (.Q(dac2_d[4]),   .C(clk),  .CE(dac2Sync),  .CLR(1'b0), .D(dac2Out[8]));
FDCE dac2_d_5  (.Q(dac2_d[5]),   .C(clk),  .CE(dac2Sync),  .CLR(1'b0), .D(dac2Out[9]));
FDCE dac2_d_6  (.Q(dac2_d[6]),   .C(clk),  .CE(dac2Sync),  .CLR(1'b0), .D(dac2Out[10]));
FDCE dac2_d_7  (.Q(dac2_d[7]),   .C(clk),  .CE(dac2Sync),  .CLR(1'b0), .D(dac2Out[11]));
FDCE dac2_d_8  (.Q(dac2_d[8]),   .C(clk),  .CE(dac2Sync),  .CLR(1'b0), .D(dac2Out[12]));
FDCE dac2_d_9  (.Q(dac2_d[9]),   .C(clk),  .CE(dac2Sync),  .CLR(1'b0), .D(dac2Out[13]));
FDCE dac2_d_10 (.Q(dac2_d[10]),  .C(clk),  .CE(dac2Sync),  .CLR(1'b0), .D(dac2Out[14]));
FDCE dac2_d_11 (.Q(dac2_d[11]),  .C(clk),  .CE(dac2Sync),  .CLR(1'b0), .D(dac2Out[15]));
FDCE dac2_d_12 (.Q(dac2_d[12]),  .C(clk),  .CE(dac2Sync),  .CLR(1'b0), .D(dac2Out[16]));
FDCE dac2_d_13 (.Q(dac2_d[13]),  .C(clk),  .CE(dac2Sync),  .CLR(1'b0), .D(dac2Out[17]));
`endif

//******************************************************************************
//                        SDI Output Interface
//******************************************************************************

wire    [31:0]  sdiDout;
sdi sdi(
    .clk(clk),
    .reset(reset),
    .wr0(wr0),
    .wr1(wr1),
    .wr2(wr2),
    .wr3(wr3),
    .addr(addr),
    .dataIn(dataIn),
    .dataOut(sdiDout),
    .iSymEn(sdiSymEn),
    .iSymData(sdiDataI),
    .qSymEn(sdiSymEn),
    .qSymData(sdiDataQ),
    .eyeSync(eyeSync),
    .iEye(iEye),.qEye(qEye),
    .eyeOffset(eyeOffset),
    .bitsyncLock(!bsync_nLock), .demodLock(!demod_nLock),
    `ifdef ADD_DESPREADER
    .iEpoch(iEpoch), .qEpoch(qEpoch),
    `endif
    .sdiOut(sdiOut)
    );

`ifdef ADD_DQM
//******************************************************************************
//                       Bit Error Probability Estimation
//******************************************************************************

wire    [31:0]  bepDout;
bepEstimate bep(
  .clk(clk),
  .reset(reset),
  .wr0(wr0),.wr1(wr1),.wr2(wr2),.wr3(wr3),
  .addr(addr),
  .dataIn(dataIn),
  .dataOut(bepDout),
  .symEn(sdiSymEn),
  .symData(sdiDataI),
  .iData(iSymData),
  .qData(qSymData),
  .sym2xEn(iSym2xEn)
);
`endif


//******************************************************************************
//                           Processor Read Data Mux
//******************************************************************************
always @* begin
  casex(addr)
    `DEMODSPACE,
    `ifdef ADD_CMA
    `EQUALIZERSPACE,
    `endif
    `ifdef ADD_DESPREADER
    `DESPREADSPACE,
    `endif
    `DDCSPACE,
    `DDCFIRSPACE,
    `CICDECSPACE,
    `BITSYNCSPACE,
    `BITSYNCAUSPACE,
    `RESAMPSPACE,
    `CARRIERSPACE,
    `CHAGCSPACE : begin
        if (!addr[12]) begin
            if (addr[1]) begin
                rd_mux = demodDout[31:16];
                end
            else begin
                rd_mux = demodDout[15:0];
                end
            end
            else begin
                rd_mux = 16'h0;
            end
        end
    `ifdef ADD_SCPATH
    `SCDDCSPACE,
    `SCDDCFIRSPACE,
    `SCCICDECSPACE,
    `SCAGCSPACE,
    `SCCARRIERSPACE: begin
      if (addr[1]) begin
        rd_mux = scPathDout[31:16];
        end
      else begin
        rd_mux = scPathDout[15:0];
        end
      end
    `endif
    `ifdef USE_SC_INTERP
    `INTERP2SPACE,
    `VIDFIR2SPACE: begin
      if (addr[1]) begin
        rd_mux = scInterpDout[31:16];
        end
      else begin
        rd_mux = scInterpDout[15:0];
        end
    end
    `endif
    `TRELLISLFSPACE,
    `TRELLIS_SPACE: begin
         if (addr[1]) begin
           rd_mux = multihLoopDout[31:16];
           end
         else begin
           rd_mux = multihLoopDout[15:0];
           end
      end
    `MISC_SPACE : begin
        if (addr[1]) begin
            rd_mux = misc_dout[31:16];
            end
        else begin
            rd_mux = misc_dout[15:0];
            end
        end
    `UARTSPACE,
    `SDISPACE: begin
        if (addr[1]) begin
            rd_mux = sdiDout[31:16];
            end
        else begin
            rd_mux = sdiDout[15:0];
            end
        end
    `ifdef ADD_DQM
    `BEPRAMSPACE,
    `BEPSPACE: begin
        if (addr[1]) begin
            rd_mux = bepDout[31:16];
            end
        else begin
            rd_mux = bepDout[15:0];
            end
        end
    `endif
    default : rd_mux = 16'hxxxx;
    endcase
  end

assign data = (!nCs & !nRd) ? rd_mux : 16'hzzzz;

endmodule
