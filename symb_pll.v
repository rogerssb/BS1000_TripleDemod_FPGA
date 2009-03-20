//-----------------------------------------------------------------------------
// Project      SEMCO Multi-mode Demodulator
// Design       Symbol Clock PLL Control
// Created      02/18/2009
//-----------------------------------------------------------------------------
// 1.0      Initial coding
//
//
//-----------------------------------------------------------------------------

`timescale 1ns/100ps
`include "addressMap.v"
`include "defines.v"

module symb_pll(rs,en,wr0,wr1,a,di,do,clk,clk_en,clk_ref,clk_vco,clk_fbk,clk_out);

input clk;            // system clock
input clk_en;         // system clock enable
output clk_ref;       // pll comparator reference clock
input clk_vco;        // pll vco output clock
output clk_fbk;       // pll comparator feedback clock
output clk_out;       // filtered symbol clock

input rs,en,wr0,wr1;  // processor interface signals
input [11:0]a;
input [15:0]di;
output [15:0]do;

// processor write -------------------------------------------------------------

`ifdef MANUAL_NCO_SETUP

wire [15:0]ref = 1;
wire [15:0]fbk = 1;
wire [15:0]vco = 1;

parameter vco_freq = 10;  // KHz
parameter nco_step =
  vco_freq == 10 ? 7 : (
  vco_freq == 20 ? 13 : (
  vco_freq == 50 ? 33 : (
  vco_freq == 100 ? 66 : (
  vco_freq == 200 ? 131 : (
  vco_freq == 500 ? 328 : (
  vco_freq == 1000 ? 655 : (
  vco_freq == 2000 ? 1311 : (
  vco_freq == 5000 ? 3277 : (
  vco_freq == 6250 ? 4096 : 0 )))))))));

`else

reg [15:0]ref,fbk,vco,nco_step;
always @(negedge wr0)begin
  if(en)begin
    casex (a)
      `SYMB_PLL_REF: ref[7:0] <= di[7:0];
      `SYMB_PLL_FBK: fbk[7:0] <= di[7:0];
      `SYMB_PLL_VCO: vco[7:0] <= di[7:0];
      `SYMB_PLL_NCO: nco_step[7:0] <= di[7:0];
      default: ;
    endcase
  end
end

always @(negedge wr1)begin
  if(en)begin
    casex (a)
      `SYMB_PLL_REF: ref[15:8] <= di[15:8];
      `SYMB_PLL_FBK: fbk[15:8] <= di[15:8];
      `SYMB_PLL_VCO: vco[15:8] <= di[15:8];
      `SYMB_PLL_NCO: nco_step[15:8] <= di[15:8];
      default: ;
    endcase
  end
end

`endif

// processor read --------------------------------------------------------------

reg [15:0]do;
always @(a or en or ref or fbk or vco or nco_step)begin
  if(en)begin
    casex(a)
      `SYMB_PLL_REF: do <= ref;
      `SYMB_PLL_FBK: do <= fbk;
      `SYMB_PLL_VCO: do <= vco;
      `SYMB_PLL_NCO: do <= nco_step;
      default: do <= 16'hxxxx;
    endcase
  end
  else do <= 16'hxxxx;
end

// test nco --------------------------------------------------------------------

//`define USE_NCO
`ifdef USE_NCO
reg [15:0]acc;
reg nco_clk_en;
wire [15:0]acc_in = acc+nco_step;
always @(posedge clk or posedge rs)begin
  if(rs)acc <= 0;
  else begin
    acc <= acc_in;
    nco_clk_en <= !acc[15] && acc_in[15];
    end
  end
`endif

// reference divider -----------------------------------------------------------

wire [9:0]ref_cnt_tc = ref / 2;
reg [9:0]ref_cnt;
reg ref_div;
always @(posedge clk or posedge rs)begin
  if(rs)begin
    ref_cnt <= 1;
    ref_div <= 0;
    end

  `ifdef USE_NCO
  else if(nco_clk_en)begin
  `else
  else if(clk_en)begin
  `endif

    if(ref_cnt == ref_cnt_tc)begin
      ref_cnt <= 1;
      ref_div <= !ref_div;
      end
    else begin
      ref_cnt <= ref_cnt +1;
      ref_div <= ref_div;
      end
    end
end

`ifdef USE_NCO
assign clk_ref = ref < 2 ? acc[15] : ref_div;
`else
assign clk_ref = ref < 2 ? clk : ref_div;
`endif

// feedback divider ------------------------------------------------------------

wire [9:0]fbk_cnt_tc = fbk / 2;
reg [9:0]fbk_cnt;
reg fbk_div;
always @(posedge clk_vco or posedge rs)begin
  if(rs)begin
    fbk_cnt <= 1;
    fbk_div <= 0;
    end
  else if(fbk_cnt == fbk_cnt_tc)begin
    fbk_cnt <= 1;
    fbk_div <= !fbk_div;
    end
  else begin
    fbk_cnt <= fbk_cnt +1;
    fbk_div <= fbk_div;
    end
end

assign clk_fbk = fbk < 2 ? clk_vco : fbk_div;

// vco output divider ----------------------------------------------------------

wire [9:0]vco_cnt_tc = vco / 2;
reg [9:0]vco_cnt;
reg vco_div;
always @(posedge clk_vco or posedge rs)begin
  if(rs)begin
    vco_cnt <= 1;
    vco_div <= 0;
    end
  else if(vco_cnt == vco_cnt_tc)begin
    vco_cnt <= 1;
    vco_div <= !vco_div;
    end
  else begin
    vco_cnt <= vco_cnt +1;
    vco_div <= vco_div;
    end
end

assign clk_out = vco < 2 ? clk_vco : vco_div;

endmodule


/*
module symb_pll_test;

reg clk;            // system clock
reg clk_en;         // system clock enable
wire clk_ref;       // pll comparator reference clock
reg clk_vco;        // pll vco output clock
wire clk_fbk;       // pll comparator feedback clock
wire clk_out;       // filtered symbol clock

reg rs,en,wr0,wr1;  // processor interface signals
reg [11:0]a;
reg [15:0]di;
wire [15:0]do;
symb_pll uut(rs,en,wr0,wr1,a,di,do,clk,1'b1,clk_ref,clk_vco,clk_fbk,clk_out);

always #5 clk = !clk; // 100 MHz system clock
always @(posedge clk) clk_en = !clk_en;

always #(31.25) clk_vco = !clk_vco;

initial begin
  clk = 0;
  clk_en = 0;
  clk_vco = 0;
  rs = 0;
  en = 0;
  wr0 = 0;
  wr1 = 0;
  a = 0;
  di = 0;

  uut.ref = 1;
  uut.fbk = 1;
  uut.vco = 1;

  #200 rs = 1;
  #200 rs = 0;
  end
endmodule
*/