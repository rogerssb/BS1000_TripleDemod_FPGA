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
    despreadMode,
    init_a,
    polyTaps_a,
    codeRestartCount_a,
    iOutTaps_a,
    qOutTaps_a,
    init_b,
    polyTaps_b,
    codeRestartCount_b,
    iOutTaps_b,
    qOutTaps_b
    );

input           cs;
input           wr0, wr1, wr2, wr3;
input   [11:0]  addr;
input   [31:0]  din;

output  [31:0]  dout;
reg     [31:0]  dout;

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


always @(negedge wr0) begin
    if (cs) begin
        casex (addr)
            `DESPREAD_INIT_A:           init_a[7:0] <= din[7:0];
            `DESPREAD_POLYTAPS_A:       polyTaps_a[7:0] <= din[7:0];
            `DESPREAD_RESTART_COUNT_A:  codeRestartCount_a[7:0] <= din[7:0];
            `DESPREAD_IOUTTAPS_A:       iOutTaps_a[7:0] <= din[7:0];
            `DESPREAD_QOUTTAPS_A:       qOutTaps_a[7:0] <= din[7:0];
            `DESPREAD_INIT_B:           init_b[7:0] <= din[7:0];
            `DESPREAD_POLYTAPS_B:       polyTaps_b[7:0] <= din[7:0];
            `DESPREAD_RESTART_COUNT_B:  codeRestartCount_b[7:0] <= din[7:0];
            `DESPREAD_IOUTTAPS_B:       iOutTaps_b[7:0] <= din[7:0];
            `DESPREAD_QOUTTAPS_B:       qOutTaps_b[7:0] <= din[7:0];
            `DESPREAD_CONTROL:          despreadMode[1:0] <= din[1:0];
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
            `DESPREAD_INIT_B:           init_b[15:8] <= din[15:8];
            `DESPREAD_POLYTAPS_B:       polyTaps_b[15:8] <= din[15:8];
            `DESPREAD_RESTART_COUNT_B:  codeRestartCount_b[15:8] <= din[15:8];
            `DESPREAD_IOUTTAPS_B:       iOutTaps_b[15:8] <= din[15:8];
            `DESPREAD_QOUTTAPS_B:       qOutTaps_b[15:8] <= din[15:8];
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
            `DESPREAD_INIT_B:           init_b[17:16] <= din[17:16];
            `DESPREAD_POLYTAPS_B:       polyTaps_b[17:16] <= din[17:16];
            `DESPREAD_RESTART_COUNT_B:  codeRestartCount_b[17:16] <= din[17:16];
            `DESPREAD_IOUTTAPS_B:       iOutTaps_b[17:16] <= din[17:16];
            `DESPREAD_QOUTTAPS_B:       qOutTaps_b[17:16] <= din[17:16];
            default: ;
            endcase
        end
    end

always @(negedge wr3) begin
    if (cs) begin
        casex (addr)
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
        `DESPREAD_INIT_B:           dout = {14'b0,init_b};
        `DESPREAD_POLYTAPS_B:       dout = {14'b0,polyTaps_b};
        `DESPREAD_RESTART_COUNT_B:  dout = {14'b0,codeRestartCount_b};
        `DESPREAD_IOUTTAPS_B:       dout = {14'b0,iOutTaps_b};
        `DESPREAD_QOUTTAPS_B:       dout = {14'b0,qOutTaps_b};
        `DESPREAD_CONTROL:          dout = {30'b0,despreadMode};
        default:                    dout = 32'hx;
        endcase
    end
    else begin
        dout = 32'hx;
    end
end

endmodule