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

module multiplier(clk,symEn,a,b,c,d,re0,im0,re1,im1);

input clk,symEn;
input [17:0]a,b,c,d;
output [17:0]re0,im0,re1,im1;

// (a + bi)(c + di) = (ac - bd) + (bc + ad)i

wire [35:0]axc;
multiplier_v10_0 mult_axc(
	.clk(clk),
	.a(a), // Bus [17 : 0]
	.b(c), // Bus [17 : 0]
	.p(axc)); // Bus [35 : 0]

wire [35:0]bxd;
multiplier_v10_0 mult_bxd(
	.clk(clk),
	.a(b), // Bus [17 : 0]
	.b(d), // Bus [17 : 0]
	.p(bxd)); // Bus [35 : 0]

wire [35:0]bxc;
multiplier_v10_0 mult_bxc(
	.clk(clk),
	.a(b), // Bus [17 : 0]
	.b(c), // Bus [17 : 0]
	.p(bxc)); // Bus [35 : 0]

wire [35:0]axd;
multiplier_v10_0 mult_axd(
	.clk(clk),
	.a(a), // Bus [17 : 0]
	.b(d), // Bus [17 : 0]
	.p(axd)); // Bus [35 : 0]

wire [35:0]sumR = {axc[34],axc[34:0]} - {bxd[34],bxd[34:0]};
wire [35:0]sumI = {bxc[34],bxc[34:0]} + {axd[34],axd[34:0]};

reg [17:0]re0,im0,re1,im1;
always @(posedge clk)begin
    re1 <= sumR[35:18];
    im1 <= sumI[35:18];
  if(symEn)begin
    re0 <= sumR[35:18];
    im0 <= sumI[35:18];
    end
  end

endmodule