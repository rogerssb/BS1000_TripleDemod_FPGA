//-----------------------------------------------------------------------------
// Project      SEMCO Multi-mode Demodulator
// Design       Decoder Registers
// Created      2009/02/20
//-----------------------------------------------------------------------------
// 1.0      Initial coding
//
//
//-----------------------------------------------------------------------------
//
//-----------------------------------------------------------------------------

`timescale 1 ns/100ps
`include "../addressMap.v"

module decoder_regs
  (
  wr0,   // input,  processor bus write strobe
  wr1,
  a,    // input, processor bus address
  di,   // input, processor bus data
  do,   // output, processo bus data
  en,   // input, processor bus address decode
  d,    // input, gpio bits
  q     // output, gpio bits
  );

input [11:0]a;
input [15:0]di;
output [15:0]do;
input wr0,wr1,en;
input [15:0]d;
output [15:0]q;

reg [15:0]q;
always @(negedge wr0) begin
  if(en) begin
    casex (a)
      12'hxx0: q[7:0] <= di[7:0];
      default: ;
    endcase
  end
  else q[7:0] <= q[7:0];
end

always @(negedge wr1) begin
  if(en) begin
    casex (a)
      12'hxx0: q[15:8] <= di[15:8];
      default: ;
    endcase
  end
  else q[15:8] <= q[15:8];
end

reg [15:0]do;
always @(a or en or d) begin
  if(en) begin
    casex(a)
      12'hxx0: do <= d;
      default: do <= 16'hxxxx;
    endcase
  end
  else do <= 16'hxxxx;
end

endmodule
