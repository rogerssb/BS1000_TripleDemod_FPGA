`timescale 1ns / 10 ps
//`include ".\addressMap.v"

module dds( clk, reset,
            txSelect,
            rxFreq,
            txFreq,
            iDds, qDds);

input           clk;
input           reset;
input           txSelect;
input   [31:0]  rxFreq;
input   [31:0]  txFreq;
output  [17:0]  iDds;
output  [17:0]  qDds;


// DDS
wire [31:0]ddsFreq = txSelect ? txFreq : rxFreq;
nco nco( .sclr(reset),
         .clk(clk),
         .we(1'b1),
         .data(ddsFreq),
         .sine(qDds),
         .cosine(iDds)
        );
`ifdef SIMULATE
real iDdsReal = 0 ; // = ((iDds > 131071.0) ? (iDds - 262144.0) : iDds)/131072.0;
real qDdsReal = 0; // = ((qDds > 131071.0) ? (qDds - 262144.0) : qDds)/131072.0;

always @(iDds)
        iDdsReal = ((iDds > 131071.0) ? (iDds - 262144.0) : iDds)/131072.0;

always @(qDds)
        qDdsReal = ((qDds > 131071.0) ? (qDds - 262144.0) : qDds)/131072.0;
`endif

endmodule
