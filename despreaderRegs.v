/////////////////////////////////////////////////////
// codes_reg
// register set for the despreader
// codes generator
/////////////////////////////////////////////////////

`timescale 1ns / 10 ps
`include ".\addressMap.v"

module despreaderRegs (
    cs,
    wr0, wr1, wr2, wr3,
    addr,
    din,
    dout,
    slipped_a,
    slipped_b,
    despreadMode,
    init_a,
    polyTaps_a,
    codeRestartCount_a,
    iOutTaps_a,
    qOutTaps_a,
    corrLength_a,
    epoch_a,
    goldEnableA,
    init_b,
    polyTaps_b,
    codeRestartCount_b,
    iOutTaps_b,
    qOutTaps_b,
    corrLength_b,
    epoch_b,
    goldEnableB,
    lockCount,
    acqSyncThreshold,
    trkSyncThreshold,
    manualSlip,
    slip_a,
    slip_b,
    dsReset
    );

input           cs;
input           wr0, wr1, wr2, wr3;
input   [11:0]  addr;
input   [31:0]  din;

output  [31:0]  dout;
reg     [31:0]  dout;

input           slipped_a;
input           slipped_b;

output  [1:0]   despreadMode;
reg     [1:0]   despreadMode;

output  [17:0]  init_a;
reg     [17:0]  init_a;

output  [17:0]  polyTaps_a;
reg     [17:0]  polyTaps_a;

output  [17:0]  codeRestartCount_a;
reg     [17:0]  codeRestartCount_a;

output  [17:0]  iOutTaps_a;
reg     [17:0]  iOutTaps_a;

output  [17:0]  qOutTaps_a;
reg     [17:0]  qOutTaps_a;

output  [3:0]   corrLength_a;
reg     [3:0]   corrLength_a;

output  [17:0]  epoch_a;
reg     [17:0]  epoch_a;

output          goldEnableA;
reg             goldEnableA;

output  [17:0]  init_b;
reg     [17:0]  init_b;

output  [17:0]  polyTaps_b;
reg     [17:0]  polyTaps_b;

output  [17:0]  codeRestartCount_b;
reg     [17:0]  codeRestartCount_b;

output  [17:0]  iOutTaps_b;
reg     [17:0]  iOutTaps_b;

output  [17:0]  qOutTaps_b;
reg     [17:0]  qOutTaps_b;

output  [3:0]   corrLength_b;
reg     [3:0]   corrLength_b;

output  [17:0]  epoch_b;
reg     [17:0]  epoch_b;

output          goldEnableB;
reg             goldEnableB;

output  [15:0]  lockCount;
reg     [15:0]  lockCount;

output  [6:0]   acqSyncThreshold;
reg     [6:0]   acqSyncThreshold;

output  [6:0]   trkSyncThreshold;
reg     [6:0]   trkSyncThreshold;

output          manualSlip;
reg             manualSlip;

output          slip_a;
reg             slip_a;

output          slip_b;
reg             slip_b;

output          dsReset;
reg             dsReset;

always @(negedge wr3 or posedge slipped_a) begin
    if (slipped_a) begin
        slip_a <= 0;
    end
    else if (cs) begin
        casex(addr)
            `DESPREAD_CONTROL_A:        slip_a <= 1;
            default: ;
            endcase
    end
end
always @(negedge wr3 or posedge slipped_b) begin
    if (slipped_b) begin
        slip_b <= 0;
    end
    else if (cs) begin
        casex(addr)
            `DESPREAD_CONTROL_B:        slip_b <= 1;
            default: ;
            endcase
    end
end


always @(negedge wr0) begin
    if (cs) begin
        casex (addr)
            `DESPREAD_INIT_A:           init_a[7:0] <= din[7:0];
            `DESPREAD_POLYTAPS_A:       polyTaps_a[7:0] <= din[7:0];
            `DESPREAD_RESTART_COUNT_A:  codeRestartCount_a[7:0] <= din[7:0];
            `DESPREAD_IOUTTAPS_A:       iOutTaps_a[7:0] <= din[7:0];
            `DESPREAD_QOUTTAPS_A:       qOutTaps_a[7:0] <= din[7:0];
            `DESPREAD_CONTROL_A:        corrLength_a[3:0] <= din[3:0];
            `DESPREAD_EPOCH_A:          epoch_a[7:0] <= din[7:0];
            `DESPREAD_INIT_B:           init_b[7:0] <= din[7:0];
            `DESPREAD_POLYTAPS_B:       polyTaps_b[7:0] <= din[7:0];
            `DESPREAD_RESTART_COUNT_B:  codeRestartCount_b[7:0] <= din[7:0];
            `DESPREAD_IOUTTAPS_B:       iOutTaps_b[7:0] <= din[7:0];
            `DESPREAD_QOUTTAPS_B:       qOutTaps_b[7:0] <= din[7:0];
            `DESPREAD_CONTROL_B:        corrLength_b[3:0] <= din[3:0];
            `DESPREAD_EPOCH_B:          epoch_b[7:0] <= din[7:0];
            `DESPREAD_SYNC_CONTROL:     acqSyncThreshold <= din[6:0];
            `DESPREAD_CONTROL:          despreadMode <= din[1:0];
            default: ;
            endcase
        end
    end

always @(negedge wr1) begin
    if (cs) begin
        casex (addr)
            `DESPREAD_INIT_A:           init_a[15:8] <= din[15:8];
            `DESPREAD_POLYTAPS_A:       polyTaps_a[15:8] <= din[15:8];
            `DESPREAD_RESTART_COUNT_A:  codeRestartCount_a[15:8] <= din[15:8];
            `DESPREAD_IOUTTAPS_A:       iOutTaps_a[15:8] <= din[15:8];
            `DESPREAD_QOUTTAPS_A:       qOutTaps_a[15:8] <= din[15:8];
            `DESPREAD_EPOCH_A:          epoch_a[15:8] <= din[15:8];
            `DESPREAD_CONTROL_A:        goldEnableA <= din[15];
            `DESPREAD_INIT_B:           init_b[15:8] <= din[15:8];
            `DESPREAD_POLYTAPS_B:       polyTaps_b[15:8] <= din[15:8];
            `DESPREAD_RESTART_COUNT_B:  codeRestartCount_b[15:8] <= din[15:8];
            `DESPREAD_IOUTTAPS_B:       iOutTaps_b[15:8] <= din[15:8];
            `DESPREAD_QOUTTAPS_B:       qOutTaps_b[15:8] <= din[15:8];
            `DESPREAD_EPOCH_B:          epoch_b[15:8] <= din[15:8];
            `DESPREAD_CONTROL_B:        goldEnableB <= din[15];
            `DESPREAD_SYNC_CONTROL:     trkSyncThreshold <= din[14:8];
            `DESPREAD_CONTROL:          dsReset <= din[15];
            default: ;
            endcase
        end
    end

always @(negedge wr2) begin
    if (cs) begin
        casex (addr)
            `DESPREAD_INIT_A:           init_a[17:16] <= din[17:16];
            `DESPREAD_POLYTAPS_A:       polyTaps_a[17:16] <= din[17:16];
            `DESPREAD_RESTART_COUNT_A:  codeRestartCount_a[17:16] <= din[17:16];
            `DESPREAD_IOUTTAPS_A:       iOutTaps_a[17:16] <= din[17:16];
            `DESPREAD_QOUTTAPS_A:       qOutTaps_a[17:16] <= din[17:16];
            `DESPREAD_EPOCH_A:          epoch_a[17:16] <= din[17:16];
            `DESPREAD_INIT_B:           init_b[17:16] <= din[17:16];
            `DESPREAD_POLYTAPS_B:       polyTaps_b[17:16] <= din[17:16];
            `DESPREAD_RESTART_COUNT_B:  codeRestartCount_b[17:16] <= din[17:16];
            `DESPREAD_IOUTTAPS_B:       iOutTaps_b[17:16] <= din[17:16];
            `DESPREAD_QOUTTAPS_B:       qOutTaps_b[17:16] <= din[17:16];
            `DESPREAD_EPOCH_B:          epoch_b[17:16] <= din[17:16];
            `DESPREAD_SYNC_CONTROL:     lockCount[7:0] <= din[23:16];
            default: ;
            endcase
        end
    end

always @(negedge wr3) begin
    if (cs) begin
        casex (addr)
            `DESPREAD_SYNC_CONTROL:     lockCount[15:8] <= din[31:24];
            `DESPREAD_CONTROL:          manualSlip <= din[31];
            default: ;
            endcase
        end
    end

always @ (*) begin
    if (cs) begin
        casex (addr)
        `DESPREAD_INIT_A:           dout = {14'b0,init_a};
        `DESPREAD_POLYTAPS_A:       dout = {14'b0,polyTaps_a};
        `DESPREAD_RESTART_COUNT_A:  dout = {14'b0,codeRestartCount_a};
        `DESPREAD_IOUTTAPS_A:       dout = {14'b0,iOutTaps_a};
        `DESPREAD_QOUTTAPS_A:       dout = {14'b0,qOutTaps_a};
        `DESPREAD_CONTROL_A:        dout = {16'b0,goldEnableA,11'b0,corrLength_a};
        `DESPREAD_EPOCH_A:          dout = {14'b0,epoch_a};
        `DESPREAD_INIT_B:           dout = {14'b0,init_b};
        `DESPREAD_POLYTAPS_B:       dout = {14'b0,polyTaps_b};
        `DESPREAD_RESTART_COUNT_B:  dout = {14'b0,codeRestartCount_b};
        `DESPREAD_IOUTTAPS_B:       dout = {14'b0,iOutTaps_b};
        `DESPREAD_QOUTTAPS_B:       dout = {14'b0,qOutTaps_b};
        `DESPREAD_CONTROL_B:        dout = {16'b0,goldEnableB,11'b0,corrLength_b};
        `DESPREAD_EPOCH_B:          dout = {14'b0,epoch_b};
        `DESPREAD_CONTROL:          dout = {manualSlip,15'b0,dsReset,7'b0,6'b0,despreadMode};
        `DESPREAD_SYNC_CONTROL:     dout = {lockCount,1'b0,trkSyncThreshold,1'b0,acqSyncThreshold};
        default:                    dout = 32'hx;
        endcase
    end
    else begin
        dout = 32'hx;
    end
end

endmodule