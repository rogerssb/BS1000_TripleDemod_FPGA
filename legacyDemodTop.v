`timescale 1ns / 10 ps

module legacyDemodTop(
    clk, reset, syncIn,
    rd, wr0,wr1,wr2,wr3,
    addr,
    din,
    dout,
    iRx, qRx,
    iDataClk,
    iBit,
    qDataClk,
    qBit,
    bitsyncLock,
    carrierLock,
    symTimes2Sync,
    symSync,
    dac0Sync,
    dac0Data,
    dac1Sync,
    dac1Data,
    dac2Sync,
    dac2Data
    );

input           clk;
input           reset;
input           syncIn;
input           rd,wr0,wr1,wr2,wr3;
input   [11:0]  addr;
input   [31:0]  din;
output  [31:0]  dout;
input   [17:0]  iRx;
input   [17:0]  qRx;
output          iDataClk;
output          iBit;
output          qDataClk;
output          qBit;
output          bitsyncLock;
output          carrierLock;
output          symTimes2Sync;
output          symSync;
output          dac0Sync;
output  [17:0]  dac0Data;
output          dac1Sync;
output  [17:0]  dac1Data;
output          dac2Sync;
output  [17:0]  dac2Data;

legacyDemod legacyDemod(
    clk, reset, syncIn,
    rd, wr0,wr1,wr2,wr3,
    addr,
    din,
    dout,
    iRx, qRx,
    iDataClk,
    iBit,
    qDataClk,
    qBit,
    bitsyncLock,
    carrierLock,
    symTimes2Sync,
    symSync,
    dac0Sync,
    dac0Data,
    dac1Sync,
    dac1Data,
    dac2Sync,
    dac2Data
    );

endmodule
