// This is a instantiation of the dsp48a library implementation of a multiply and accumulate.
// For more information on the dsp48a slice read
// "XtreamDSP DSP48A for Spartan-3A DSP FPGAs - User Guide" ug431
// Anders Johansson, KTS


`timescale 1 ns/1 ps

module dsp48_mac 
  (
   sclr, 
   clk, 
   a, 
   b, 
   acc,
   accClr, 
   p
   );
   
   input            sclr;
   input            clk;
   input [17 : 0]   a;
   input [17 : 0]   b;
   input            acc;
   input            accClr;
   output [47 : 0]  p;
   
   wire [7:0]       OPMODE = {4'b0000, acc, 3'b001}; // OPMODE sets up the operation of the DSP48A block. The acc input
                                                     // turns on the output accumulator

// DSP48A: DSP Function Block
// Spartan-3A DSP
// Xilinx HDL Libraries Guide, version 10.1.2
DSP48A #(
.A0REG      (0), // Enable=1/disable=0 first stage A input pipeline register
.A1REG      (1), // Enable=1/disable=0 second stage A input pipeline register
.B0REG      (0), // Enable=1/disable=0 first stage B input pipeline register
.B1REG      (1), // Enable=1/disable=0 second stage B input pipeline register
.CARRYINREG (1), // Enable=1/disable=0 CARRYIN input pipeline register
.CARRYINSEL ("OPMODE5"), // Specify carry-in source, "CARRYIN" or "OPMODE5"
.CREG       (1), // Enable=1/disable=0 C input pipeline register
.DREG       (1), // Enable=1/disable=0 D pre-adder input pipeline register
.MREG       (1), // Enable=1/disable=0 M pipeline register
.OPMODEREG  (1), // Enable=1/disable=0 OPMODE input pipeline register
.PREG       (1), // Enable=1/disable=0 P output pipeline register
.RSTTYPE    ("SYNC") // Specify reset type, "SYNC" or "ASYNC"
) 

DSP48A_inst (
.BCOUT       (/*NC*/    ), // 18-bit B port cascade output
.CARRYOUT    (/*NC*/    ), // 1-bit carry output
.P           (p         ), // 48-bit output
.PCOUT       (/*NC*/    ), // 48-bit cascade output
.A           (a         ), // 18-bit A data input
.B           (b         ), // 18-bit B data input (can be connected to fabric or BCOUT of adjacent DSP48A)
.C           (48'b0    ), // 48-bit C data input
.CARRYIN     (1'b0      ), // 1-bit carry input signal
.CEA         (1'b1      ), // 1-bit active high clock enable input for A input registers
.CEB         (1'b1      ), // 1-bit active high clock enable input for B input registers
.CEC         (1'b1      ), // 1-bit active high clock enable input for C input registers
.CECARRYIN   (1'b0      ), // 1-bit active high clock enable input for CARRYIN registers
.CED         (1'b1      ), // 1-bit active high clock enable input for D input registers
.CEM         (1'b1      ), // 1-bit active high clock enable input for multiplier registers
.CEOPMODE    (1'b1), // 1-bit active high clock enable input for OPMODE registers
.CEP         (1'b1      ), // 1-bit active high clock enable input for P output registers
.CLK         (clk       ), // Clock input
.D           (18'b0    ), // 18-bit B pre-adder data input
.OPMODE      (OPMODE    ), // 8-bit operation mode input
.PCIN        (/*NC*/    ), // 48-bit P cascade input
.RSTA        (sclr      ), // 1-bit reset input for A input pipeline registers
.RSTB        (sclr      ), // 1-bit reset input for B input pipeline registers
.RSTC        (sclr      ), // 1-bit reset input for C input pipeline registers
.RSTCARRYIN  (sclr      ), // 1-bit reset input for CARRYIN input pipeline registers
.RSTD        (sclr      ), // 1-bit reset input for D input pipeline registers
.RSTM        (sclr      ), // 1-bit reset input for M pipeline registers
.RSTOPMODE   (sclr      ), // 1-bit reset input for OPMODE input pipeline registers
.RSTP        (accClr    )  // 1-bit reset input for P output pipeline registers
);
// End of DSP48A_inst instantiation

endmodule