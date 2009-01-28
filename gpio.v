//-----------------------------------------------------------------------------
// Project      SEMCO Multi-mode Demodulator
// Design       GPIO Registers
// Created      11/08/08
//-----------------------------------------------------------------------------
// 1.0      Initial coding
//
//
//-----------------------------------------------------------------------------
// This module provides read and write capabilities for the LEDs.
//-----------------------------------------------------------------------------

`timescale 1 ns/100ps
`include ".\addressMap.v"
`include ".\defines.v"

module gpio
  (
  wr,		// input,  processor bus write strobe
  a,      // input, processor bus address
  di,     // input, processor bus data
  do,     // output, processo bus data
  en,     // input, processor bus address decode
	d,		// input, gpio bits
  q		   // output, gpio bits
  );

input [11:0]a;
input [15:0]di;
output [15:0]do;
input wr,en;
input [15:0]d;
output [15:0]q;

reg [15:0]q;
always @(negedge wr) begin
    if(en) begin
        casex (a)
            `LEDS: q <= di;
            default: ;
        endcase
    end
end

reg [15:0]do;
always @(a or en or d) begin
  if(en) begin
    casex(a)
      `LEDS: do <= d;
      default: do <= 16'hxxxx;
    endcase
  end
	else do <= 16'hxxxx;
end

endmodule
