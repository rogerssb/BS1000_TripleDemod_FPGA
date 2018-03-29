/////////////////////////////////////////////////////
// despreader
/////////////////////////////////////////////////////

`timescale 1ns / 10 ps
`include ".\addressMap.v"

module dualDespreader (
    clk,
    clkEn, qClkEn,
    symEn, qSymEn,
    reset,
    cs,
    wr0, wr1, wr2, wr3,
    addr,
    din,
    iIn, qIn,
    demodMode,
    dout,
    despreaderMode,
    iCode, qCode,
    iEpoch, qEpoch,
    iDespread,
    qDespread,
    despreadLock,
    scaledSyncCount,
    scaledSwapSyncCount
    );

parameter SoftBits = 6;

input           clk;
input           clkEn, qClkEn;
input           symEn, qSymEn;
input           reset;
input           cs;
input           wr0, wr1, wr2, wr3;
input   [12:0]  addr;
input   [31:0]  din;
input   [17:0]  iIn, qIn;
input   [4:0]   demodMode;
output  [31:0]  dout;
output  [2:0]   despreaderMode;
output          iCode, qCode;
output          iEpoch,qEpoch;
output  [17:0]  iDespread;
output  [17:0]  qDespread;
output          despreadLock;
output  [15:0]  scaledSyncCount;
output  [15:0]  scaledSwapSyncCount;

// Microprocessor interface
reg despreadSpace;
always @* begin
    casex(addr)
        `DESPREADSPACE: despreadSpace = cs;
        default:        despreadSpace = 0;
        endcase
    end

reg             despreadLock;
wire    [17:0]  init_a, codeRestartCount_a, polyTaps_a, iOutTaps_a, qOutTaps_a, epoch_a;
wire    [17:0]  init_b, codeRestartCount_b, polyTaps_b, iOutTaps_b, qOutTaps_b, epoch_b;
wire    [3:0]   corrLength_a,corrLength_b;
wire    [2:0]   despreaderMode;
wire    [6:0]   acqSyncThreshold,trkSyncThreshold;
wire    [6:0]   syncThreshold = despreadLock ? trkSyncThreshold : acqSyncThreshold;
wire    [15:0]  lockCount;
reg             dsSlipI, dsSlipQ;
despreaderRegs regs(
    .addr(addr),
    .din(din),
    .dout(dout),
    .slipped_a(dsSlipI),.slipped_b(dsSlipQ),
    .cs(despreadSpace),
    .wr0(wr0), .wr1(wr1), .wr2(wr2), .wr3(wr3),
    .manualSlip(manualSlip),
    .init_a(init_a),
    .polyTaps_a(polyTaps_a),
    .codeRestartCount_a(codeRestartCount_a),
    .iOutTaps_a(iOutTaps_a),
    .qOutTaps_a(qOutTaps_a),
    .corrLength_a(corrLength_a),
    .goldEnableA(goldEnableA),
    .slip_a(slip_a),
    .epoch_a(epoch_a),
    .init_b(init_b),
    .polyTaps_b(polyTaps_b),
    .codeRestartCount_b(codeRestartCount_b),
    .iOutTaps_b(iOutTaps_b),
    .qOutTaps_b(qOutTaps_b),
    .corrLength_b(corrLength_b),
    .goldEnableB(goldEnableB),
    .slip_b(slip_b),
    .epoch_b(epoch_b),
    .despreadMode(despreaderMode),
    .acqSyncThreshold(acqSyncThreshold),
    .trkSyncThreshold(trkSyncThreshold),
    .lockCount(lockCount),
    .dsReset(dsReset)
    );

reg     dsSampleEn, dsSymEn;
always @* begin
    casex (despreaderMode)
        `DS_MODE_NASA_DG1_MODE3_SPREAD_Q: begin
            dsSampleEn = qClkEn;
            dsSymEn = qSymEn;
        end
        default: begin
            dsSampleEn = clkEn;
            dsSymEn = symEn;
        end
    endcase
end

reg     dsResetI0,dsResetI1,dsResetEn;
always @(posedge clk) begin
    if (dsSampleEn) begin
        dsResetI0 <= dsReset;
        dsResetI1 <= dsResetI0;
        dsResetEn <= dsResetI0 & !dsResetI1;
    end
end

wire out_a;
codes_gen codes_gen_a(
    .clk(clk),
    .clkEn(dsSampleEn & dsSymEn & !dsSlipI),
    .reset(reset | dsResetEn),
    .init(init_a),
    .epoch(epoch_a),
    .polyTaps(polyTaps_a),
    .restartCount(codeRestartCount_a),
    .iOutTaps(iOutTaps_a),
    .qOutTaps(qOutTaps_a),
    .iOut(iOut_a),
    .qOut(qOut_a),
    .goldOut(goldOut_a),
    .codeEpoch(codeEpoch_a)
    );

wire out_b;
codes_gen codes_gen_b(
    .clk(clk),
    .clkEn(dsSampleEn & dsSymEn & !dsSlipQ),
    .reset(reset | dsResetEn),
    .init(init_b),
    .epoch(epoch_a),
    .polyTaps(polyTaps_b),
    .restartCount(codeRestartCount_b),
    .iOutTaps(iOutTaps_b),
    .qOutTaps(qOutTaps_b),
    .iOut(iOut_b),
    .goldOut(goldOut_b),
    .codeEpoch(codeEpoch_b)
    );

// Select the PN code used for the I and Q channel
reg             iCode, qCode;
reg             iEpoch, qEpoch;
reg     [3:0]   iCorrLength, qCorrLength;
always @* begin
    casex (despreaderMode)
        `DS_MODE_NASA_FWD: begin
            iCode <= goldOut_a;
            iCorrLength <= corrLength_a;
            iEpoch <= codeEpoch_a;
            qCode <= iOut_b;
            qCorrLength <= corrLength_b;
            qEpoch <= codeEpoch_b;
        end
        `DS_MODE_NASA_DG1_MODE1: begin
            iCode <= iOut_a;
            iCorrLength <= corrLength_a;
            iEpoch <= codeEpoch_a;
            qCode <= qOut_a;
            qCorrLength <= corrLength_a;
            qEpoch <= codeEpoch_a;
        end
        `DS_MODE_NASA_DG1_MODE2: begin
            iCode <= goldOut_a;
            iCorrLength <= corrLength_a;
            iEpoch <= codeEpoch_a;
            qCode <= goldOut_b;
            qCorrLength <= corrLength_a;
            qEpoch <= codeEpoch_b;
        end
        `DS_MODE_NASA_DG1_MODE3_SPREAD_I: begin
            iCode <= iOut_a;
            iCorrLength <= corrLength_a;
            iEpoch <= codeEpoch_a;
            // The q channel doesn't matter in this mode as it is not spread.
            // We set values to keep the synthesizer from generating latches.
            qCode <= qOut_a;
            qCorrLength <= corrLength_a;
            qEpoch <= codeEpoch_a;
        end
        `DS_MODE_NASA_DG1_MODE3_SPREAD_Q: begin
            // The i channel doesn't matter in this mode as it is not spread.
            // We set values to keep the synthesizer from generating latches.
            iCode <= iOut_a;
            iCorrLength <= corrLength_a;
            iEpoch <= codeEpoch_a;
            qCode <= qOut_a;
            qCorrLength <= corrLength_a;
            qEpoch <= codeEpoch_a;
        end
        default: begin
            iCode <= iOut_a;
            iCorrLength <= corrLength_a;
            iEpoch <= codeEpoch_a;
            qCode <= qOut_a;
            qCorrLength <= corrLength_a;
            qEpoch <= codeEpoch_a;
        end
    endcase
end

// Map the inputs to soft decision bits
reg     [SoftBits-1:0]   iSoft, iDelay;
reg     [SoftBits-1:0]   qSoft, qDelay0, qDelay1;

always @(posedge clk) begin
    if (dsSampleEn) begin
        iDelay <= iSoft;
        if (iIn[17:(18-SoftBits)] == {1'b1,{(SoftBits-1){1'b0}}}) begin
            iSoft <= {1'b1,{(SoftBits-2){1'b0}},1'b1};
        end
        else begin
            iSoft <= iIn[17:(18-SoftBits)];
        end
    end
    if (dsSampleEn) begin
        qDelay0 <= qSoft;
        qDelay1 <= qDelay0;
        if (qIn[17:(18-SoftBits)] == {1'b1,{(SoftBits-1){1'b0}}}) begin
            qSoft <= {1'b1,{(SoftBits-2){1'b0}},1'b1};
        end
        else begin
            qSoft <= qIn[17:(18-SoftBits)];
        end
    end
end


//******************************* Despread Correlators *************************

`ifdef SIMULATE
reg corrSimReset;
initial corrSimReset = 1;
wire corrReset = reset | corrSimReset;
`else
wire corrReset = reset;
`endif

// Select the correlator inputs
reg     [SoftBits-1:0]  iOntimeIn,iSwapIn;
reg     [SoftBits-1:0]  qOntimeIn,qSwapIn;
always @* begin
    casex (despreaderMode)
        `DS_MODE_NASA_FWD,
        `DS_MODE_NASA_DG1_MODE3_SPREAD_I: begin
            iOntimeIn = iSoft;
            iSwapIn = iSoft;
        end
        `DS_MODE_NASA_DG1_MODE1,
        `DS_MODE_NASA_DG1_MODE2: begin
            iOntimeIn = iDelay;
            iSwapIn = iDelay;
        end
        default: begin
            iOntimeIn = iSoft;
            iSwapIn = iSoft;
        end
    endcase
    casex (despreaderMode)
        `DS_MODE_NASA_FWD,
        `DS_MODE_NASA_DG1_MODE3_SPREAD_Q: begin
            qOntimeIn = qSoft;
            qSwapIn = qSoft;
        end
        `DS_MODE_NASA_DG1_MODE1,
        `DS_MODE_NASA_DG1_MODE2: begin
            qOntimeIn = qSoft;
            qSwapIn = qDelay1;
        end
        default: begin
            qOntimeIn = qSoft;
            qSwapIn = qSoft;
        end
    endcase
end


wire    [17:0]  iCorr;
wire    [5:0]   iSyncCount;
despreadCorrelator #(.CorrLength(64), .InputBits(SoftBits), .CorrBits(SoftBits+32))
iCorrOnTime(
    .clk(clk),
    .clkEn(dsSampleEn),
    .reset(corrReset),
    .onTime(dsSymEn),
    .slip(dsSlipI),
    .codeBit(iCode),
    .rx(iOntimeIn),
    .corrLength(iCorrLength),
    .despread(iCorr),
    .syncCount(iSyncCount)
    );

wire    [17:0]  qCorr;
wire    [5:0]   qSyncCount;
despreadCorrelator #(.CorrLength(64), .InputBits(SoftBits), .CorrBits(SoftBits+32))
qCorrOnTime(
    .clk(clk),
    .clkEn(dsSampleEn),
    .reset(corrReset),
    .onTime(dsSymEn),
    .slip(dsSlipQ),
    .codeBit(qCode),
    .rx(qOntimeIn),
    .corrLength(qCorrLength),
    .despread(qCorr),
    .syncCount(qSyncCount)
    );

// This correlator is used to detect an I/Q swap.
wire    [17:0]  iSwapCorr;
wire    [5:0]   iSwapSyncCount;
despreadCorrelator #(.CorrLength(64), .InputBits(SoftBits), .CorrBits(SoftBits+32))
iSwapOnTime(
    .clk(clk),
    .clkEn(dsSampleEn),
    .reset(corrReset),
    .onTime(dsSymEn),
    .slip(dsSlipI),
    .codeBit(qCode),
    .rx(iSwapIn),
    .corrLength(qCorrLength),
    .despread(iSwapCorr),
    .syncCount(iSwapSyncCount)
    );

wire    [17:0]  qSwapCorr;
wire    [5:0]   qSwapSyncCount;
despreadCorrelator #(.CorrLength(64), .InputBits(SoftBits), .CorrBits(SoftBits+32))
qSwapOnTime(
    .clk(clk),
    .clkEn(dsSampleEn),
    .reset(corrReset),
    .onTime(dsSymEn),
    .slip(dsSlipQ),
    .codeBit(iCode),
    .rx(qSwapIn),
    .corrLength(iCorrLength),
    .despread(qSwapCorr),
    .syncCount(qSwapSyncCount)
    );





//******************************* Acq State Machine ****************************

reg             swapIQ;

wire    [15:0]  negLockCount = (16'hffff - lockCount);

reg     [15:0]  syncCount;
reg     [6:0]   syncSum;
always @* begin
    casex (despreaderMode)
        `DS_MODE_NASA_DG1_MODE3_SPREAD_I:
            // I only in this mode
            syncSum = {iSyncCount[5],iSyncCount};
        `DS_MODE_NASA_DG1_MODE3_SPREAD_Q:
            // Q only in this mode
            syncSum = {qSyncCount[5],qSyncCount};
        default:
            syncSum = {iSyncCount[5],iSyncCount} + {qSyncCount[5],qSyncCount};
    endcase
end
wire    [15:0]  syncUpdate = {{9{syncThreshold[6]}},syncThreshold}
                           - {{9{1'b0}},syncSum};
wire            inSyncIndication = (!syncCount[15]
                                && ((syncCount + syncUpdate) >= lockCount)
                                && (!syncUpdate[15]));
wire            outOfSyncIndication = (syncCount[15]
                                   && ((syncCount + syncUpdate) <= negLockCount)
                                   && (syncUpdate[15]));

reg     [15:0]  swapSyncCount;
reg     [6:0]   swapSyncSum;
always @* begin
    casex (despreaderMode)
        `DS_MODE_NASA_DG1_MODE3_SPREAD_I:
            // Force an out-of-swapSyncCondition.
            swapSyncSum = 63;
        `DS_MODE_NASA_DG1_MODE3_SPREAD_Q:
            // Force an out-of-swapSync condition.
            swapSyncSum = 63;
        default:
            swapSyncSum = {iSwapSyncCount[5],iSwapSyncCount} + {qSwapSyncCount[5],qSwapSyncCount};
    endcase
end
wire    [15:0]  swapSyncUpdate = {{9{syncThreshold[6]}},syncThreshold}
                               - {{9{1'b0}},swapSyncSum};
wire            inSwapSyncIndication = (!swapSyncCount[15]
                                    && ((swapSyncCount + swapSyncUpdate) >= lockCount)
                                    && (!swapSyncUpdate[15]));
wire            outOfSwapSyncIndication = (swapSyncCount[15]
                                       && ((swapSyncCount + swapSyncUpdate) <= negLockCount)
                                       && (swapSyncUpdate[15]));


`ifdef SIMULATE
real syncCountReal;
always @* syncCountReal = $itor($signed(syncCount))/(2**15);
real swapSyncCountReal;
always @* swapSyncCountReal = $itor($signed(swapSyncCount))/(2**15);
`endif


wire    [17:0]  absCorrI = iCorr[17] ? -iCorr : iCorr;
wire    [17:0]  absCorrQ = qCorr[17] ? -qCorr : qCorr;
`ifdef SIMULATE
real absCorrIReal;
always @* absCorrIReal = $itor($signed(absCorrI))/(2**17);
real absCorrQReal;
always @* absCorrQReal = $itor($signed(absCorrQ))/(2**17);
`endif

wire    [17:0]  absCorrSwapI = iSwapCorr[17] ? -iSwapCorr : iSwapCorr;
wire    [17:0]  absCorrSwapQ = qSwapCorr[17] ? -qSwapCorr : qSwapCorr;
`ifdef SIMULATE
real absCorrSwapIReal;
always @* absCorrSwapIReal = $itor($signed(absCorrSwapI))/(2**17);
real absCorrSwapQReal;
always @* absCorrSwapQReal = $itor($signed(absCorrSwapQ))/(2**17);
`endif

reg     [1:0]           acqState;
`define DS_ACQ_SLIP     2'b00
`define DS_ACQ_TEST     2'b01

always @(posedge clk) begin
    if (corrReset) begin
        swapIQ <= 0;
        syncCount <= 0;
        swapSyncCount <= 0;
        despreadLock <= 0;
        dsSlipI <= 0;
        dsSlipQ <= 0;
        acqState <= `DS_ACQ_TEST;
    end
    else if (dsSampleEn) begin
        if (manualSlip) begin
            if (dsSymEn) begin
                if (slip_a) begin
                    dsSlipI <= 1;
                    dsSlipQ <= 1;
                end
                else begin
                    dsSlipI <= 0;
                    dsSlipQ <= 0;
                end
            end
        end
        else if (dsSymEn) begin
            case (acqState)
                `DS_ACQ_SLIP: begin
                    dsSlipI <= 0;
                    dsSlipQ <= 0;
                    acqState <= `DS_ACQ_TEST;
                end
                `DS_ACQ_TEST: begin
                    if (despreadLock) begin
                        if (swapIQ) begin
                            if (outOfSwapSyncIndication) begin
                                syncCount <= 0;
                                swapSyncCount <= 0;
                                dsSlipI <= 1;
                                dsSlipQ <= 1;
                                despreadLock <= 0;
                                acqState <= `DS_ACQ_SLIP;
                            end
                            else if (inSwapSyncIndication) begin
                                swapSyncCount <= lockCount;
                            end
                            else begin
                                swapSyncCount <= swapSyncCount + swapSyncUpdate;
                            end
                            if (outOfSyncIndication) begin
                                syncCount <= negLockCount;
                            end
                            else if (inSyncIndication) begin
                                syncCount <= lockCount;
                            end
                            else begin
                                syncCount <= syncCount + syncUpdate;
                            end
                        end
                        else begin
                            if (outOfSyncIndication) begin
                                syncCount <= 0;
                                swapSyncCount <= 0;
                                dsSlipI <= 1;
                                dsSlipQ <= 1;
                                despreadLock <= 0;
                                acqState <= `DS_ACQ_SLIP;
                            end
                            else if (inSyncIndication) begin
                                syncCount <= lockCount;
                            end
                            else begin
                                syncCount <= syncCount + syncUpdate;
                            end
                            if (outOfSwapSyncIndication) begin
                                swapSyncCount <= negLockCount;
                            end
                            else if (inSwapSyncIndication) begin
                                swapSyncCount <= lockCount;
                            end
                            else begin
                                swapSyncCount <= swapSyncCount + swapSyncUpdate;
                            end
                        end
                    end
                    else if (inSyncIndication) begin
                        syncCount <= lockCount;
                        swapIQ <= 0;
                        despreadLock <= 1;
                    end
                    else if (inSwapSyncIndication) begin
                        swapSyncCount <= lockCount;
                        swapIQ <= 1;
                        despreadLock <= 1;
                    end
                    else begin
                        if (outOfSyncIndication && outOfSwapSyncIndication) begin
                            syncCount <= 0;
                            swapSyncCount <= 0;
                            dsSlipI <= 1;
                            dsSlipQ <= 1;
                            acqState <= `DS_ACQ_SLIP;
                        end
                        else begin
                            if (outOfSyncIndication) begin
                                syncCount <= negLockCount;
                            end
                            else begin
                                syncCount <= syncCount + syncUpdate;
                            end
                            if (outOfSwapSyncIndication) begin
                                swapSyncCount <= negLockCount;
                            end
                            else begin
                                swapSyncCount <= swapSyncCount + swapSyncUpdate;
                            end
                        end
                    end
                end
                default: begin
                    syncCount <= 0;
                    swapSyncCount <= 0;
                    dsSlipI <= 1;
                    dsSlipQ <= 1;
                    despreadLock <= 0;
                    acqState <= `DS_ACQ_SLIP;
                end
            endcase
        end
    end
end

//******************************* Output Assignments **************************

reg     [17:0]  iDespread,qDespread;
always @(posedge clk) begin
    if (dsSampleEn) begin
        casex (despreaderMode)
            `DS_MODE_NASA_DG1_MODE3_SPREAD_I: begin
                iDespread <= iCorr;
                qDespread <= iCorr;
            end
            `DS_MODE_NASA_DG1_MODE3_SPREAD_Q: begin
                iDespread <= qCorr;
                qDespread <= qCorr;
            end
            default: begin
                iDespread <= swapIQ ? qSwapCorr : iCorr;
                qDespread <= swapIQ ? iSwapCorr : qCorr;
            end
        endcase
    end
end

`ifdef SIMULATE
real iDespreadReal;
always @* iDespreadReal = $itor($signed(iDespread))/(2**17);
real qDespreadReal;
always @* qDespreadReal = $itor($signed(qDespread))/(2**17);
`endif

reg     [15:0]  scaledSyncCount;
reg     [15:0]  scaledSwapSyncCount;
always @(posedge clk) begin
    if (clkEn) begin
        `define SCALE_SYNCCOUNT
        `ifdef SCALE_SYNCCOUNT
        casex (lockCount)
            16'b01xx_xxxx_xxxx_xxxx: begin
                scaledSyncCount <= syncCount;
                scaledSwapSyncCount <= swapSyncCount;
                end
            16'b001x_xxxx_xxxx_xxxx: begin
                scaledSyncCount <=      {syncCount[14:0],1'b0};
                scaledSwapSyncCount <=   {swapSyncCount[14:0],1'b0};
                end
            16'b0001_xxxx_xxxx_xxxx: begin
                scaledSyncCount <=      {syncCount[13:0],2'b0};
                scaledSwapSyncCount <=   {swapSyncCount[13:0],2'b0};
                end
            16'b0000_1xxx_xxxx_xxxx: begin
                scaledSyncCount <=      {syncCount[12:0],3'b0};
                scaledSwapSyncCount <=   {swapSyncCount[12:0],3'b0};
                end
            16'b0000_01xx_xxxx_xxxx: begin
                scaledSyncCount <=      {syncCount[11:0],4'b0};
                scaledSwapSyncCount <=   {swapSyncCount[11:0],4'b0};
                end
            16'b0000_001x_xxxx_xxxx: begin
                scaledSyncCount <=      {syncCount[10:0],5'b0};
                scaledSwapSyncCount <=   {swapSyncCount[10:0],5'b0};
                end
            16'b0000_0001_xxxx_xxxx: begin
                scaledSyncCount <=      {syncCount[ 9:0],6'b0};
                scaledSwapSyncCount <=   {swapSyncCount[ 9:0],6'b0};
                end
            16'b0000_0000_1xxx_xxxx: begin
                scaledSyncCount <=      {syncCount[ 8:0],7'b0};
                scaledSwapSyncCount <=   {swapSyncCount[ 8:0],7'b0};
                end
            16'b0000_0000_01xx_xxxx: begin
                scaledSyncCount <=      {syncCount[ 7:0],8'b0};
                scaledSwapSyncCount <=   {swapSyncCount[ 7:0],8'b0};
                end
            16'b0000_0000_001x_xxxx: begin
                scaledSyncCount <=      {syncCount[ 6:0],9'b0};
                scaledSwapSyncCount <=   {swapSyncCount[ 6:0],9'b0};
                end
            16'b0000_0000_0001_xxxx: begin
                scaledSyncCount <=      {syncCount[ 5:0],10'b0};
                scaledSwapSyncCount <=   {swapSyncCount[ 5:0],10'b0};
                end
            16'b0000_0000_0000_1xxx: begin
                scaledSyncCount <=      {syncCount[ 4:0],11'b0};
                scaledSwapSyncCount <=   {swapSyncCount[ 4:0],11'b0};
                end
            16'b0000_0000_0000_01xx: begin
                scaledSyncCount <=      {syncCount[ 3:0],12'b0};
                scaledSwapSyncCount <=   {swapSyncCount[ 3:0],12'b0};
                end
            16'b0000_0000_0000_001x: begin
                scaledSyncCount <=      {syncCount[ 2:0],13'b0};
                scaledSwapSyncCount <=   {swapSyncCount[ 2:0],13'b0};
                end
            16'b0000_0000_0000_0001: begin
                scaledSyncCount <=      {syncCount[ 1:0],14'b0};
                scaledSwapSyncCount <=   {swapSyncCount[ 1:0],14'b0};
                end
            default: begin
                scaledSyncCount <=      syncCount;
                scaledSwapSyncCount <=   swapSyncCount;
                end
        endcase
        `else
        scaledSyncCount <= {syncCount[7:0],8'b0};
        scaledSwapSyncCount <= {swapSyncCount[7:0],8'b0};
        `endif
    end
end


endmodule


