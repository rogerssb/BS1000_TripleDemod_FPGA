/////////////////////////////////////////////////////
// despreader
/////////////////////////////////////////////////////

`timescale 1ns / 10 ps
`include ".\addressMap.v"

module dualDespreader (
    clk,
    clkEn, auClkEn,
    reset,
    wr0, wr1, wr2, wr3,
    addr,
    din,
    iIn, qIn,
    demodMode,
    dout,
    iCode, qCode,
    iDespread,
    iSymEn,
    iSym2xEn,
    qDespread,
    qSymEn,
    qSym2xEn,
    timingError,
    timingErrorEn
    );

parameter SoftBits = 6;

input           clk;
input           clkEn, auClkEn;
input           reset;
input           wr0, wr1, wr2, wr3;
input   [11:0]  addr;
input   [31:0]  din;
input   [17:0]  iIn, qIn;
input   [4:0]   demodMode;
output  [31:0]  dout;
output          iCode, qCode;
output  [17:0]  iDespread;
output          iSymEn;
output          iSym2xEn;
output  [17:0]  qDespread;
output          qSymEn;
output          qSym2xEn;
output  [17:0]  timingError;
output          timingErrorEn;

// Microprocessor interface
reg cs;
always @(addr) begin
    casex(addr)
        `DESPREADSPACE: cs <= 1;
        default: cs <= 0;
        endcase
    end

wire    [17:0]  init_a, codeRestartCount_a, polyTaps_a, iOutTaps_a, qOutTaps_a;
wire    [17:0]  init_b, codeRestartCount_b, polyTaps_b, iOutTaps_b;
wire    [3:0]   corrLength_a,corrLength_b;
despreaderRegs regs(
    .addr(addr),
    .din(din),
    .dout(dout),
    .cs(cs),
    .wr0(wr0), .wr1(wr1), .wr2(wr2), .wr3(wr3),
    .init_a(init_a),
    .polyTaps_a(polyTaps_a),
    .codeRestartCount_a(codeRestartCount_a),
    .iOutTaps_a(iOutTaps_a),
    .qOutTaps_a(qOutTaps_a),
    .corrLength_a(corrLength_a),
    .init_b(init_b),
    .polyTaps_b(polyTaps_b),
    .codeRestartCount_b(codeRestartCount_b),
    .iOutTaps_b(iOutTaps_b),
    .corrLength_b(corrLength_b)
    );


reg     iSampleEn, iOnTime;
always @(posedge clk) begin
    if (reset) begin
        iOnTime <= 1;
    end
    else if (clkEn) begin
        iSampleEn <= 1;
        if (iOnTime) begin
            iOnTime <= 0;
        end
        else begin
            iOnTime <= 1;
        end
    end
    else begin
        iSampleEn <= 0;
    end
end

reg     qSampleEn, qOnTime;
always @(posedge clk) begin
    if (reset) begin
        qOnTime <= 0;
    end
    else if (clkEn) begin
        qSampleEn <= 1;
        casex (demodMode) 
            `MODE_SQPN: begin
                qOnTime <= iOnTime;
            end
            default: begin
                if (qOnTime) begin
                    qOnTime <= 0;
                end
                else begin
                    qOnTime <= 1;
                end
            end
        endcase
    end
    else begin
        qSampleEn <= 0;
    end
end

wire out_a;
reg dsSlipI;
codes_gen codes_gen_a(
    .clk(clk),
    .clkEn(iSampleEn & iOnTime & !dsSlipI),
    .reset(reset),
    .init(init_a),
    .polyTaps(polyTaps_a),
    .restartCount(codeRestartCount_a),
    .iOutTaps(iOutTaps_a),
    .qOutTaps(qOutTaps_a),
    .iOut(iOut_a),
    .qOut(qOut_a)
    );

wire out_b;
reg dsSlipQ;
codes_gen codes_gen_b(
    .clk(clk),
    .clkEn(qSampleEn & qOnTime & !dsSlipQ),
    .reset(reset),
    .polyTaps(polyTaps_b),
    .restartCount(codeRestartCount_b),
    .iOutTaps(iOutTaps_b),
    .iOut(iOut_b)
    );

// Delay the Q output of the first generator for SQPN modes
reg qDelay;
always @ (posedge clk) begin
    if (qSampleEn & qOnTime) begin
        qDelay <= qOut_a;
    end
end

// Select the PN code used for the I channel
reg iCode, qCode;
reg     [3:0]  iCorrLength, qCorrLength;
always @* begin
    casex (demodMode)
        `MODE_SQPN: begin
            iCode <= iOut_a;
            iCorrLength <= corrLength_a;
            qCode <= qDelay;
            qCorrLength <= corrLength_a;
        end
        default: begin
            iCode <= iOut_a;
            iCorrLength <= corrLength_a;
            qCode <= iOut_b;
            qCorrLength <= corrLength_b;
        end
    endcase
end

`define NEW_MAPPING
`ifdef NEW_MAPPING
// Map the inputs to soft decision bits
reg     [SoftBits-1:0]   iSoft;
reg     [SoftBits-1:0]   qSoft;

always @(posedge clk) begin
    if (iIn[17:(18-SoftBits)] == {1'b1,{(SoftBits-1){1'b0}}}) begin
        iSoft <= {1'b1,{(SoftBits-2){1'b0}},1'b1};
    end
    else begin
        iSoft <= iIn[17:(18-SoftBits)];
    end

    if (qIn[17:(18-SoftBits)] == {1'b1,{(SoftBits-1){1'b0}}}) begin
        qSoft <= {1'b1,{(SoftBits-2){1'b0}},1'b1};
    end
    else begin
        qSoft <= qIn[17:(18-SoftBits)];
    end
end

`else

// Map the inputs to soft decision bits
reg     [2:0]   iSoft;
reg     [2:0]   qSoft;

always @(posedge clk) begin
    casex (iIn[17:14]) 
        4'b011x:    iSoft <= 3'b011;
        4'b0101:    iSoft <= 3'b011;
        4'b0100:    iSoft <= 3'b010;
        4'b0011:    iSoft <= 3'b010;
        4'b0010:    iSoft <= 3'b001;
        4'b0001:    iSoft <= 3'b001;
        4'b0000:    iSoft <= 3'b000;
        4'b1111:    iSoft <= 3'b000;
        4'b1110:    iSoft <= 3'b111;
        4'b1101:    iSoft <= 3'b111;
        4'b1100:    iSoft <= 3'b110;
        4'b1011:    iSoft <= 3'b110;
        4'b1010:    iSoft <= 3'b101;
        4'b100x:    iSoft <= 3'b101;
    endcase
    casex (qIn[17:14]) 
        4'b011x:    qSoft = 3'b011;
        4'b0101:    qSoft = 3'b011;
        4'b0100:    qSoft = 3'b010;
        4'b0011:    qSoft = 3'b010;
        4'b0010:    qSoft = 3'b001;
        4'b0001:    qSoft = 3'b001;
        4'b0000:    qSoft = 3'b000;
        4'b1111:    qSoft = 3'b000;
        4'b1110:    qSoft = 3'b111;
        4'b1101:    qSoft = 3'b111;
        4'b1100:    qSoft = 3'b110;
        4'b1011:    qSoft = 3'b110;
        4'b1010:    qSoft = 3'b101;
        4'b100x:    qSoft = 3'b101;
    endcase
end
`endif

//******************************* Despread Correlators *************************

`ifdef SIMULATE
reg corrSimReset;
initial corrSimReset = 1;
wire corrReset = reset | corrSimReset;
`else
wire corrReset = ;
`endif

wire    [17:0]  iCorr;
wire    [17:0]  iBsError;
wire    [5:0]   iSyncCount;
despreadCorrelator #(.CorrLength(64), .InputBits(SoftBits), .CorrBits(SoftBits+32))
iCorrOnTime(
    .clk(clk),
    .clkEn(iSampleEn),
    .reset(reset),
    .onTime(iOnTime),
    .slip(dsSlipI),
    .codeBit(iCode),
    .rx(iSoft),
    .corrLength(iCorrLength),
    .despread(iCorr),
    .bsError(iBsError),
    .syncCount(iSyncCount)
    );

wire    [17:0]  qCorr;
wire    [17:0]  qBsError;
wire    [5:0]   qSyncCount;
despreadCorrelator #(.CorrLength(64), .InputBits(SoftBits), .CorrBits(SoftBits+32)) 
qCorrOnTime(
    .clk(clk),
    .clkEn(qSampleEn),
    .reset(reset),
    .onTime(qOnTime),
    .slip(dsSlipQ),
    .codeBit(qCode),
    .rx(qSoft),
    .corrLength(qCorrLength),
    .despread(qCorr),
    .bsError(qBsError),
    .syncCount(qSyncCount)
    );

`define ADD_SWAP
`ifdef ADD_SWAP
// This correlator is used to detect an I/Q swap.
wire    [17:0]  iSwapCorr;
wire    [17:0]  iSwapBsError;
wire    [5:0]   iSwapSyncCount;
despreadCorrelator #(.CorrLength(64), .InputBits(SoftBits), .CorrBits(SoftBits+32)) 
iSwapOnTime(
    .clk(clk),
    .clkEn(iSampleEn),
    .reset(reset),
    .onTime(iOnTime),
    .slip(dsSlipI),
    .codeBit(iCode),
    .rx(qSoft),
    .corrLength(iCorrLength),
    .despread(iSwapCorr),
    .bsError(iSwapBsError),
    .syncCount(iSwapSyncCount)
    );

wire    [17:0]  qSwapCorr;
wire    [17:0]  qSwapBsError;
wire    [5:0]   qSwapSyncCount;
despreadCorrelator #(.CorrLength(64), .InputBits(SoftBits), .CorrBits(SoftBits+32)) 
qSwapOnTime(
    .clk(clk),
    .clkEn(qSampleEn),
    .reset(reset),
    .onTime(qOnTime),
    .slip(dsSlipQ),
    .codeBit(qCode),
    .rx(iSoft),
    .corrLength(qCorrLength),
    .despread(qSwapCorr),
    .bsError(qSwapBsError),
    .syncCount(qSwapSyncCount)
    );

`endif




//******************************* Acq State Machine ****************************

`define DS_START_COUNT  16'h000f
`define DS_INC_COUNT    16'h0001
`define DS_DEC_COUNT    16'h0004
`define DS_MAX_COUNT    16'h000f

reg             swapIQ;
reg     [15:0]  syncCount;
wire    [15:0]  decSyncCount = syncCount - `DS_DEC_COUNT;
wire    [15:0]  incSyncCount = syncCount + `DS_INC_COUNT;
reg             despreadSync;

reg     [17:0]  peakCorrI, peakCorrQ;
wire    [17:0]  absCorrI = iCorr[17] ? -iCorr : iCorr;
wire    [17:0]  absCorrQ = qCorr[17] ? -qCorr : qCorr;
reg     [17:0]  peakAbsCorrI, peakAbsCorrQ;
`ifdef SIMULATE
real absCorrIReal;
always @* absCorrIReal = $itor($signed(absCorrI))/(2**17);
real peakAbsCorrIReal;
always @* peakAbsCorrIReal = $itor($signed(peakAbsCorrI))/(2**17);
`endif

`ifdef ADD_SWAP
reg     [17:0]  peakCorrSwapI, peakCorrSwapQ;
wire    [17:0]  absCorrSwapI = iSwapCorr[17] ? -iSwapCorr : iSwapCorr;
wire    [17:0]  absCorrSwapQ = qSwapCorr[17] ? -qSwapCorr : qSwapCorr;
reg     [17:0]  peakAbsCorrSwapI, peakAbsCorrSwapQ;
`ifdef SIMULATE
real absCorrSwapIReal;
always @* absCorrSwapIReal = $itor($signed(absCorrSwapI))/(2**17);
real peakAbsCorrSwapIReal;
always @* peakAbsCorrSwapIReal = $itor($signed(peakAbsCorrSwapI))/(2**17);
`endif
`endif

`ifdef ADD_SWAP
wire            despreadPolarity = swapIQ ? iSwapCorr[17] : iCorr[17];
`else 
wire            despreadPolarity = iCorr[17];
`endif

reg     [1:0]           acqStateI;
`define DS_ACQ_SLIP     2'b00
`define DS_ACQ_TEST     2'b01
`define DS_ACQ_INSYNC   2'b11

`define DS_SYNC_THRESHOLD   18'h02000

always @(posedge clk) begin
    if (corrReset) begin
        swapIQ <= 0;
        peakAbsCorrI <= 0;
        peakAbsCorrQ <= 0;
        `ifdef ADD_SWAP
        peakAbsCorrSwapI <= 0;
        peakAbsCorrSwapQ <= 0;
        `endif
        peakCorrI <= 0;
        despreadSync <= 0;
        syncCount <= `DS_START_COUNT;
        dsSlipI <= 0;
        dsSlipQ <= 0;
        acqStateI <= `DS_ACQ_INSYNC;
    end
    `ifdef SIMULATE
    else if (iCorr === 18'hxxx00) begin
        peakAbsCorrI <= `DS_SYNC_THRESHOLD;
        peakAbsCorrSwapI <= `DS_SYNC_THRESHOLD;
        peakAbsCorrQ <= `DS_SYNC_THRESHOLD;
        peakAbsCorrSwapQ <= `DS_SYNC_THRESHOLD;
    end
    `endif
    else if (iSampleEn) begin
        if (iOnTime) begin
            case (acqStateI)
                `DS_ACQ_SLIP: begin
                    dsSlipI <= 0;
                    dsSlipQ <= 0;
                    acqStateI <= `DS_ACQ_TEST;
                    end
                `DS_ACQ_TEST: begin
                    // Is absCorrI > 2*peakAbsCorrI?
                    if ( {1'b0,absCorrI[17:1]} > peakAbsCorrI)
                      && (1'b0,absCorrQ[17:1]} > peakAbsCorrQ)) begin
                        // Yes. Stop slipping the generator and declare sync
                        dsSlipI <= 0;
                        dsSlipQ <= 0;
                        swapIQ <= 0;
                        despreadSync <= 1;
                        syncCount <= `DS_START_COUNT;
                        acqStateI <= `DS_ACQ_INSYNC;
                    end
                    `ifdef ADD_SWAP
                    // Does the swapped channel have a large correlation peak?
                    else if ( {1'b0,absCorrSwapI[17:1]} > peakAbsCorrSwapI)
                           && {1'b0,absCorrSwapQ[17:1]} > peakAbsCorrSwapQ) begin
                        // Yes. Stop slipping the generator and declare sync
                        dsSlipI <= 0;
                        dsSlipQ <= 0;
                        swapIQ <= 1;
                        despreadSync <= 1;
                        syncCount <= `DS_START_COUNT;
                        acqStateI <= `DS_ACQ_INSYNC;
                    end
                    `endif
                    else begin
                        dsSlipI <= 1;
                        dsSlipQ <= 1;
                        acqStateI <= `DS_ACQ_SLIP;
                    end
                end
                `DS_ACQ_INSYNC: begin
                    // Is the peak negative?
                    if (peakCorrI[17]) begin
                        // Yes. Is the current correlator output negative?
                        if (despreadPolarity) begin
                            // Yes. In sync indication.
                            if (syncCount <= (`DS_MAX_COUNT-`DS_INC_COUNT)) begin
                                syncCount <= incSyncCount;
                            end
                        end
                        else begin
                            // No. Out of sync indication.
                            if (syncCount >= `DS_DEC_COUNT) begin
                                syncCount <= decSyncCount;
                            end
                            else begin
                                // We're out of sync. Start slipping again.
                                peakAbsCorrI <= `DS_SYNC_THRESHOLD;
                                peakAbsCorrQ <= `DS_SYNC_THRESHOLD;
                                `ifdef ADD_SWAP
                                peakAbsCorrSwapI <= `DS_SYNC_THRESHOLD;
                                peakAbsCorrSwapQ <= `DS_SYNC_THRESHOLD;
                                `endif
                                dsSlipI <= 1;
                                dsSlipQ <= 1;
                                swapIQ <= 0;
                                despreadSync <= 0;
                                acqStateI <= `DS_ACQ_SLIP;
                            end
                        end
                    end
                    else begin
                        // No. Is the current correlator output positive?
                        if (!despreadPolarity) begin
                            // Yes. In sync indication.
                            if (syncCount <= (`DS_MAX_COUNT-`DS_INC_COUNT)) begin
                                syncCount <= incSyncCount;
                            end
                        end
                        else begin
                            // No. Out of sync indication.
                            if (syncCount >= `DS_DEC_COUNT) begin
                                syncCount <= decSyncCount;
                            end
                            else begin
                                // We're out of sync. Start slipping again.
                                peakAbsCorrI <= `DS_SYNC_THRESHOLD;
                                peakAbsCorrQ <= `DS_SYNC_THRESHOLD;
                                `ifdef ADD_SWAP
                                peakAbsCorrSwapI <= `DS_SYNC_THRESHOLD;
                                peakAbsCorrSwapQ <= `DS_SYNC_THRESHOLD;
                                `endif
                                dsSlipI <= 1;
                                dsSlipQ <= 1;
                                swapIQ <= 0;
                                despreadSync <= 0;
                                acqStateI <= `DS_ACQ_SLIP;
                            end
                        end
                    end
                end
            endcase
        end
    end
end

//******************************* Output Assignments **************************

assign iSymEn = iSampleEn & iOnTime;
assign iSym2xEn = iSampleEn;
assign qSymEn = qSampleEn & qOnTime;
assign qSym2xEn = qSampleEn;
assign timingError = swapIQ ? iSwapBsError : iBsError;
assign timingErrorEn = !iOnTime & despreadSync;

reg     [17:0]  iDespread,qDespread;
always @(posedge clk) begin
    if (iSym2xEn) begin
        iDespread <= swapIQ ? iSwapCorr : iCorr;
    end
    if (qSym2xEn) begin
        qDespread <= swapIQ ? qSwapCorr : qCorr;
    end
end

`ifdef SIMULATE
real iDespreadReal;
always @* iDespreadReal = $itor($signed(iDespread))/(2**17);
real qDespreadReal;
always @* qDespreadReal = $itor($signed(qDespread))/(2**17);
`endif


endmodule


