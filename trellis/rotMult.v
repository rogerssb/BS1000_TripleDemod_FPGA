//-----------------------------------------------------------------------------
// Project      SEMCO Multi-mode Demodulator
// Design       Rotator's 10x10 Distributed Multiplier
// Created      10 April 09
//-----------------------------------------------------------------------------
// 1.0      (VS)Initial coding
//
//
//-----------------------------------------------------------------------------

`timescale 1ns/1ps

module rotMult(clk,ena,a,b,c,d,reOut0,imOut0,reOut1,imOut1);

input clk,ena;
input [9:0]a,b,c,d;
output [9:0]reOut0,imOut0,reOut1,imOut1;

`ifdef USE_VIVADO_CORES
// (a + bi)(c + di) = (ac - bd) + (bc + ad)i

wire [19:0]axc;
mult10x10 mult_axc(
        .CLK(clk),
        .A(a), // Bus [9 : 0]
        .B(c), // Bus [9 : 0]
        .P(axc)); // Bus [19 : 0]

wire [19:0]bxd;
mult10x10 mult_bxd(
        .CLK(clk),
        .A(b), // Bus [9 : 0]
        .B(d), // Bus [9 : 0]
        .P(bxd)); // Bus [19 : 0]

wire [19:0]bxc;
mult10x10 mult_bxc(
        .CLK(clk),
        .A(b), // Bus [9 : 0]
        .B(c), // Bus [9 : 0]
        .P(bxc)); // Bus [19 : 0]

wire [19:0]axd;
mult10x10 mult_axd(
        .CLK(clk),
        .A(a), // Bus [9 : 0]
        .B(d), // Bus [9 : 0]
        .P(axd)); // Bus [19 : 0]

`else // USE_VIVADO_CORES

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
`endif

wire [20:0]sumR = {axc[19],axc[19:0]} - {bxd[19],bxd[19:0]};
wire [20:0]sumI = {bxc[19],bxc[19:0]} + {axd[19],axd[19:0]};

// align the outputs

reg [5:0]enaDelay;
reg [9:0]re0,im0,reOut0,imOut0,reOut1,imOut1;
always @(posedge clk)begin
  enaDelay <= {enaDelay[4:0],ena};
  if(enaDelay[4])begin
    if (sumR[20] && (sumR[19:18] != 2'b11)) begin
        re0 <= 10'h201;
        end
    else if (!sumR[20] && (sumR[19:18] != 2'b00)) begin
        re0 <= 10'h1ff;
        end
    else begin
        re0 <= sumR[18:9];
        end
    if (sumI[20] && (sumI[19:18] != 2'b11)) begin
        im0 <= 10'h201;
        end
    else if (!sumI[20] && (sumI[19:18] != 2'b00)) begin
        im0 <= 10'h1ff;
        end
    else begin
        im0 <= sumI[18:9];
        end
    end
  else if(enaDelay[5])begin
    reOut0 <= re0;
    imOut0 <= im0;
    if (sumR[20] && (sumR[19:18] != 2'b11)) begin
        reOut1 <= 10'h201;
        end
    else if (!sumR[20] && (sumR[19:18] != 2'b00)) begin
        reOut1 <= 10'h1ff;
        end
    else begin
        reOut1 <= sumR[18:9];
        end
    if (sumI[20] && (sumI[19:18] != 2'b11)) begin
        imOut1 <= 10'h201;
        end
    else if (!sumI[20] && (sumI[19:18] != 2'b00)) begin
        imOut1 <= 10'h1ff;
        end
    else begin
        imOut1 <= sumI[18:9];
        end
    end
  end

endmodule