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

// latch the samples
reg [17:0]iIn0,qIn0,iIn1,qIn1;
always @(posedge clk)begin
  if(sym2xEn)begin
	  if(symEn)begin
      iIn0 <= iIn;
      qIn0 <= qIn;
	    end
  	else begin
      iIn1 <= iIn;
      qIn1 <= qIn;
      end
    end
  end

wire [17:0] pReal0,pImag0;
cmpy18 mult0(clk,reset,iIn0,qIn0,reC0,imC0,pReal0,pImag0);

wire [17:0] pReal1,pImag1;
cmpy18 mult1(clk,reset,iIn1,qIn1,reC1,imC1,pReal1,pImag1);

assign iOut = pReal0 + pReal1;
assign qOut = pImag0 + pImag1;

endmodule