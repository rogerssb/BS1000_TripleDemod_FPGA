//-----------------------------------------------------------------------------
// Project      SEMCO Multi-mode Demodulator
// Design       Distributed Multiplier 18x18
// Created      10 April 09
//-----------------------------------------------------------------------------
// 1.0      (VS)Initial coding
//
//
//-----------------------------------------------------------------------------

`timescale 1ns/1ps

module rotator_mult10x10(clk,symEn,a,b,c,d,reOut0,imOut0,reOut1,imOut1);

input clk,symEn;
input [9:0]a,b,c,d;
output [9:0]reOut0,imOut0,reOut1,imOut1;

// (a + bi)(c + di) = (ac - bd) + (bc + ad)i

wire [19:0]axc;
mult10x10 mult_axc(
	.clk(clk),
	.a(a), // Bus [9 : 0]
	.b(c), // Bus [9 : 0]
	.p(axc)); // Bus [19 : 0]

wire [19:0]bxd;
mult10x10 mult_bxd(
	.clk(clk),
	.a(b), // Bus [9 : 0]
	.b(d), // Bus [9 : 0]
	.p(bxd)); // Bus [19 : 0]

wire [19:0]bxc;
mult10x10 mult_bxc(
	.clk(clk),
	.a(b), // Bus [9 : 0]
	.b(c), // Bus [9 : 0]
	.p(bxc)); // Bus [19 : 0]

wire [19:0]axd;
mult10x10 mult_axd(
	.clk(clk),
	.a(a), // Bus [9 : 0]
	.b(d), // Bus [9 : 0]
	.p(axd)); // Bus [19 : 0]

wire [20:0]sumR = {axc[19],axc[19:0]} - {bxd[19],bxd[19:0]};
wire [20:0]sumI = {bxc[19],bxc[19:0]} + {axd[19],axd[19:0]};

reg [9:0]re0,im0;
always @(posedge clk)begin
  if(symEn)begin
    re0 <= sumR[20:11];
    im0 <= sumI[20:11];
    end
  end

// resync outputs to symEn
reg [9:0]reOut0,imOut0,reOut1,imOut1;
reg symEnDelay;
always @(posedge clk)begin
  `ifdef SIMULATE
  #1 symEnDelay <= symEn;
  `else
  symEnDelay <= symEn;
  `endif
  if(symEnDelay)begin
    reOut0 <= re0;
    imOut0 <= im0;
    reOut1 <= sumR[20:11];
    imOut1 <= sumI[20:11];
    end
  end
endmodule