//------------------------------------------------------------------------------
// Project      SEMCO Multi-mode Demodulator
// Design       Biphase to NRZ Converter
// Created      February 19, 2009
//------------------------------------------------------------------------------
// 1.0      Initial coding
//
//
//------------------------------------------------------------------------------

`timescale 1 ns /10 ps

module biphase_to_nrz(rs, clk, symb_clk_en, biphase_en, biphase, symb_i, last_symb_i, nrz_i);

  input rs, clk, symb_clk_en, biphase;
  input [2:0] symb_i, last_symb_i;
  output  biphase_en;
  output [2:0] nrz_i;

  reg [2:0] nrz_i;
  reg [7:0] count;
  reg divide;

  wire  biphase_en = (biphase) ? count[7] ^ divide : 1'b1;
  wire  [2:0] sum = (symb_i + ~last_symb_i) >> 1 ;

  always @ (posedge clk or posedge rs) begin
    if (rs) begin
      count <= 8'h88;
      divide <= 0;
      nrz_i <= 0;
    end
    else if(symb_clk_en)begin
      divide <= ~divide;
      if (~divide) begin
        if (symb_i[2] == last_symb_i[2])
          if (|count == 1) // not all zeroes
            count <= count - 1;
      end
      else begin
        if (symb_i[2] == last_symb_i[2])
          if (&count == 0) // not all ones
            count <= count + 1;
      end
      if (biphase_en)
          nrz_i <= (biphase) ? ~sum[2:0] : symb_i;
    end
  end

endmodule
