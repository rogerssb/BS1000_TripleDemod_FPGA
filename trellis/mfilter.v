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

// two multiplier approach ------------------------------------------------

// latch the second sample
reg [17:0]iIn1,qIn1;
always @(posedge clk)begin
  if(!symEn & sym2xEn)begin
    iIn1 <= iIn;
    qIn1 <= qIn;
    end
  end

// latch the first sample
reg [17:0]iIn0,qIn0;
always @(posedge clk)begin
  if(symEn)begin
    iIn0 <= iIn;
    qIn0 <= qIn;
    end
  end

// relatch both samples for input into multipliers
reg [17:0]aReal0,aImag0,aReal1,aImag1;
always @(posedge clk)begin
  if(symEn)begin
    aReal0 <= iIn0;
    aImag0 <= qIn0;
    aReal1 <= iIn1;
    aImag1 <= qIn1;
    end
  end

wire [17:0] pReal0,pImag0;
cmpy18 mult0(clk,reset,aReal0,aImag0,reC0,imC0,pReal0,pImag0);

wire [17:0] pReal1,pImag1;
cmpy18 mult1(clk,reset,aReal1,aImag1,reC1,imC1,pReal1,pImag1);

reg [17:0]iOut,qOut;
always @(posedge clk)begin
  iOut <= pReal0 + pReal1;
  qOut <= pImag0 + pImag1;
  end

endmodule