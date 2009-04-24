//-----------------------------------------------------------------------------
// Project      SEMCO Multi-mode Demodulator
// Design       PCMFM Matched Filter
// Created      07 April 09
//-----------------------------------------------------------------------------
// 1.0      (VS)Initial coding
//
//
//-----------------------------------------------------------------------------

`timescale 1ns/1ps

module mfilter(clk,reset,symEn,sym2xEn,iIn,qIn,iOut,qOut);

input clk,reset,symEn,sym2xEn;
input [17:0]iIn,qIn;
output [17:0]iOut,qOut;

// assign coefficients at module instantiation
parameter reC0 = 18'h0, imC0 = 18'h0, reC1 = 18'h0, imC1 = 18'h0;

wire [17:0]bReal = (!symEn & sym2xEn) ? reC1 : reC0;
wire [17:0]bImag = (!symEn & sym2xEn) ? imC1 : imC0;
wire [17:0]pReal,pImag;

cmpy18 cmpy18(clk,reset,iIn,qIn,bReal,bImag,pReal,pImag);

// Sum the current and previous multiplier outputs.
// The relationship of symEn to sym2xEn is such that the first of two samples
// per symbol is at the multiplier input when symEn and sym2xEn are both
// asserted. The second sample is at the multiplier input when only sym2xEn is
// asserted. symEn has a fixed period but sym2xEn does not. This means the
// second sample shifts in time with respect to the first. To correctly sum the
// current and previous multiplier outputs, we must use an enable that is based
// on the arrival of the second sample.

// pReal and pImag are scaled to 0.5.  A sign extension is not required for this
// addition.

reg [3:0]shft;
reg [17:0]pRealLatch,pImagLatch;
reg [17:0]iOutBuf,qOutBuf;
always @(posedge clk)begin
  pRealLatch <= pReal;
  pImagLatch <= pImag;
  shft <= {shft[2:0],(!symEn & sym2xEn)};
  if(shft[3])begin
    iOutBuf <= pReal + pRealLatch;
    qOutBuf <= pImag + pImagLatch;
    end
  end

`ifdef SIMULATE
// the overflow condition exists whenever the addends have the same sign and
// their sum has the opposite sign
wire [17:0]iOutBufWire = pReal+pRealLatch;
wire [17:0]qOutBufWire = pImag+pImagLatch;
wire iOutOvf = (pReal[17]^iOutBufWire[17])&(pRealLatch[17]^iOutBufWire[17]);
wire qOutOvf = (pImag[17]^qOutBufWire[17])&(pImagLatch[17]^qOutBufWire[17]);
`endif

reg [17:0]iOut,qOut;
always @(posedge clk)begin
  if(symEn)begin
    iOut <= iOutBuf;
    qOut <= qOutBuf;
    end
  end

endmodule