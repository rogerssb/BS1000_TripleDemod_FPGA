/*---------------------------------------------------------------------------
   signMag_2sComp.V - Sign Magnitude or 2's Comp module for Microdyne Bit Sync Controller

  Accepts 3 bit data input and mode input 'mode' then processes data
  depending on mode.

// convert straight binary to signed magnitude or two's comp format
//  Bin   2'sC    SignMag
//  111   011   011 Strong One
//  110   010   010
//  101   001   001
//  100   000   000 Weak One
//  011   111   100 Weak Zero
//  010   110   101
//  001   101   110
//  000   100   111 Strong Zero
--------------------------------------------------------------------------*/

`timescale 1ns/100ps

module format_output(din, clk, clk_en, mode, rs, dout);

  input [2:0] din;
  input clk, clk_en, mode, rs;
  output [2:0] dout;

  reg [2:0] dout;

  wire [2:0]mode_0_out = {~din[2], din[1:0]};
  wire [2:0]mode_1_out = {~din[2], ~din[2] ^ din[1], ~din[2] ^ din[0]};

  always @(posedge clk or posedge rs)begin
    if(rs)
      dout <= 0;
    else if(clk_en)
      dout <= mode ? mode_1_out : mode_0_out;
    end
endmodule
