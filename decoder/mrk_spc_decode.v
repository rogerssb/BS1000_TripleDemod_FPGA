//------------------------------------------------------------------------------
// Project      SEMCO Multi-mode Demodulator
// Design       Mark/Space Decoder
// Created      February 20, 2009
//------------------------------------------------------------------------------
// 1.0      Initial coding
//
//
//------------------------------------------------------------------------------

`timescale 1ns/100ps

module mrk_spc_decode(rs, din, last_din, clk, clk_en, biphase_en, mode, dout);

  input rs, clk, clk_en, biphase_en;
  input [2:0] din,last_din;
  input [1:0] mode;
  output [2:0] dout;

  reg [2:0] dout;

  parameter Bypass  = 2'b00;
  parameter Invert  = 2'b01;
  parameter Mark    = 2'b10;
  parameter Space = 2'b11;

  always @ (posedge clk or posedge rs) begin
    if (rs)
      dout <= 0;
    else if(clk_en)begin
      if (biphase_en) begin
        case (mode)
          Bypass: dout <= din;
          Invert: dout <= ~din;
          Mark: dout <=  {3{din[2] ^ last_din}};
          Space:  dout <= ~{3{din[2] ^ last_din}};
          default: dout <= din;
        endcase
      end
    end
  end
endmodule
