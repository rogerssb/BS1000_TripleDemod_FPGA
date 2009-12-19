//-----------------------------------------------------------------------------
// Project      SEMCO Multi-mode Demodulator
// Design       multi-h match filter
// Created      05 August 09
//-----------------------------------------------------------------------------
// The multi-h is a four-ary signaling mode and the signal intervals are +/- 3 and +/-1.
// It is called multi-h due to the fact that modulation index "h" is changing from symbol 
// to symbol. In our case the modulation index varies from 5/16th to 4/16th. 
// This module produces the match filter outputs (64 total). The notation on the match-filter 
// outputs reads as follow:
// Take output mf_p3m1_45Real for example:
// mf = matchfilter
// p3m1 = plus 3 to minus 1 transition
// 45 = represent a 4/16th interval to 5/16th transition 
// mf_p1m1_45 is the complex conjugate of:
// mf_m1p1_45 

// 1.0      AMJ initial coding
//
//
//-----------------------------------------------------------------------------

`timescale 1ns/1ps
  
module mfiltBank
  (
   clk, reset, symEn, sym2xEn,
   i, q, // I and Q input
   // Real outputs
   mf_p3p3_45Real, mf_p3p1_45Real, mf_p3m1_45Real, mf_p3m3_45Real,
   mf_m3p3_45Real, mf_m3p1_45Real, mf_m3m1_45Real, mf_m3m3_45Real,
   mf_p1p3_45Real, mf_p1p1_45Real, mf_p1m1_45Real, mf_p1m3_45Real,
   mf_m1p3_45Real, mf_m1p1_45Real, mf_m1m1_45Real, mf_m1m3_45Real,
   mf_p3p3_54Real, mf_p3p1_54Real, mf_p3m1_54Real, mf_p3m3_54Real,
   mf_m3p3_54Real, mf_m3p1_54Real, mf_m3m1_54Real, mf_m3m3_54Real,
   mf_p1p3_54Real, mf_p1p1_54Real, mf_p1m1_54Real, mf_p1m3_54Real,
   mf_m1p3_54Real, mf_m1p1_54Real, mf_m1m1_54Real, mf_m1m3_54Real,
   // Imaginary outputs
   mf_p3p3_45Imag, mf_p3p1_45Imag, mf_p3m1_45Imag, mf_p3m3_45Imag,
   mf_m3p3_45Imag, mf_m3p1_45Imag, mf_m3m1_45Imag, mf_m3m3_45Imag,
   mf_p1p3_45Imag, mf_p1p1_45Imag, mf_p1m1_45Imag, mf_p1m3_45Imag,
   mf_m1p3_45Imag, mf_m1p1_45Imag, mf_m1m1_45Imag, mf_m1m3_45Imag,
   mf_p3p3_54Imag, mf_p3p1_54Imag, mf_p3m1_54Imag, mf_p3m3_54Imag,
   mf_m3p3_54Imag, mf_m3p1_54Imag, mf_m3m1_54Imag, mf_m3m3_54Imag,
   mf_p1p3_54Imag, mf_p1p1_54Imag, mf_p1m1_54Imag, mf_p1m3_54Imag,
   mf_m1p3_54Imag, mf_m1p1_54Imag, mf_m1m1_54Imag, mf_m1m3_54Imag,
   symEnOut, sym2xEnOut
   );
   
   parameter             MF_BITS = 10;
   input                 clk, reset, symEn, sym2xEn;
   input [17:0]          i,q;
   output [MF_BITS-1:0]  mf_p3p3_45Real, mf_p3p1_45Real, mf_p3m1_45Real, mf_p3m3_45Real,
                         mf_m3p3_45Real, mf_m3p1_45Real, mf_m3m1_45Real, mf_m3m3_45Real,
                         mf_p1p3_45Real, mf_p1p1_45Real, mf_p1m1_45Real, mf_p1m3_45Real,
                         mf_m1p3_45Real, mf_m1p1_45Real, mf_m1m1_45Real, mf_m1m3_45Real,
                         mf_p3p3_54Real, mf_p3p1_54Real, mf_p3m1_54Real, mf_p3m3_54Real,
                         mf_m3p3_54Real, mf_m3p1_54Real, mf_m3m1_54Real, mf_m3m3_54Real,
                         mf_p1p3_54Real, mf_p1p1_54Real, mf_p1m1_54Real, mf_p1m3_54Real,
                         mf_m1p3_54Real, mf_m1p1_54Real, mf_m1m1_54Real, mf_m1m3_54Real,
                         mf_p3p3_45Imag, mf_p3p1_45Imag, mf_p3m1_45Imag, mf_p3m3_45Imag,
                         mf_m3p3_45Imag, mf_m3p1_45Imag, mf_m3m1_45Imag, mf_m3m3_45Imag,
                         mf_p1p3_45Imag, mf_p1p1_45Imag, mf_p1m1_45Imag, mf_p1m3_45Imag,
                         mf_m1p3_45Imag, mf_m1p1_45Imag, mf_m1m1_45Imag, mf_m1m3_45Imag,
                         mf_p3p3_54Imag, mf_p3p1_54Imag, mf_p3m1_54Imag, mf_p3m3_54Imag,
                         mf_m3p3_54Imag, mf_m3p1_54Imag, mf_m3m1_54Imag, mf_m3m3_54Imag,
                         mf_p1p3_54Imag, mf_p1p1_54Imag, mf_p1m1_54Imag, mf_p1m3_54Imag,
                         mf_m1p3_54Imag, mf_m1p1_54Imag, mf_m1m1_54Imag, mf_m1m3_54Imag;
   output                symEnOut, sym2xEnOut;
   

`include "mfiltCoeff.v"

   // match filter outputs for the 4/16 to 5/16 interval
   mfilt # ( C0_0,  C0_1,  C0_2,  C0_3,  C1_0,  C1_1,  C1_2,  C1_3) mf_x3p3_45 ( .clk(clk), .reset(reset), .symEn(symEn), .sym2xEn(sym2xEn), .i(i), .q(q), .mf0IOut(mf_p3p3_45Real), .mf0QOut(mf_p3p3_45Imag), .mf1IOut(mf_m3m3_45Real), .mf1QOut(mf_m3m3_45Imag) );
   mfilt # ( C2_0,  C2_1,  C2_2,  C2_3,  C3_0,  C3_1,  C3_2,  C3_3) mf_x3p1_45 ( .clk(clk), .reset(reset), .symEn(symEn), .sym2xEn(sym2xEn), .i(i), .q(q), .mf0IOut(mf_p3p1_45Real), .mf0QOut(mf_p3p1_45Imag), .mf1IOut(mf_m3m1_45Real), .mf1QOut(mf_m3m1_45Imag) );
   mfilt # ( C4_0,  C4_1,  C4_2,  C4_3,  C5_0,  C5_1,  C5_2,  C5_3) mf_x3m1_45 ( .clk(clk), .reset(reset), .symEn(symEn), .sym2xEn(sym2xEn), .i(i), .q(q), .mf0IOut(mf_p3m1_45Real), .mf0QOut(mf_p3m1_45Imag), .mf1IOut(mf_m3p1_45Real), .mf1QOut(mf_m3p1_45Imag) );
   mfilt # ( C6_0,  C6_1,  C6_2,  C6_3,  C7_0,  C7_1,  C7_2,  C7_3) mf_x3m3_45 ( .clk(clk), .reset(reset), .symEn(symEn), .sym2xEn(sym2xEn), .i(i), .q(q), .mf0IOut(mf_p3m3_45Real), .mf0QOut(mf_p3m3_45Imag), .mf1IOut(mf_m3p3_45Real), .mf1QOut(mf_m3p3_45Imag) );
   mfilt # ( C8_0,  C8_1,  C8_2,  C8_3,  C9_0,  C9_1,  C9_2,  C9_3) mf_x1p3_45 ( .clk(clk), .reset(reset), .symEn(symEn), .sym2xEn(sym2xEn), .i(i), .q(q), .mf0IOut(mf_p1p3_45Real), .mf0QOut(mf_p1p3_45Imag), .mf1IOut(mf_m1m3_45Real), .mf1QOut(mf_m1m3_45Imag) );
   mfilt # (C10_0, C10_1, C10_2, C10_3, C11_0, C11_1, C11_2, C11_3) mf_x1p1_45 ( .clk(clk), .reset(reset), .symEn(symEn), .sym2xEn(sym2xEn), .i(i), .q(q), .mf0IOut(mf_p1p1_45Real), .mf0QOut(mf_p1p1_45Imag), .mf1IOut(mf_m1m1_45Real), .mf1QOut(mf_m1m1_45Imag) );
   mfilt # (C12_0, C12_1, C12_2, C12_3, C13_0, C13_1, C13_2, C13_3) mf_x1m1_45 ( .clk(clk), .reset(reset), .symEn(symEn), .sym2xEn(sym2xEn), .i(i), .q(q), .mf0IOut(mf_p1m1_45Real), .mf0QOut(mf_p1m1_45Imag), .mf1IOut(mf_m1p1_45Real), .mf1QOut(mf_m1p1_45Imag) );
   mfilt # (C14_0, C14_1, C14_2, C14_3, C15_0, C15_1, C15_2, C15_3) mf_x1m3_45 ( .clk(clk), .reset(reset), .symEn(symEn), .sym2xEn(sym2xEn), .i(i), .q(q), .mf0IOut(mf_p1m3_45Real), .mf0QOut(mf_p1m3_45Imag), .mf1IOut(mf_m1p3_45Real), .mf1QOut(mf_m1p3_45Imag) );
                                                                                                                                                                                                                                                        
   // match filter outputs for the 5/16 to 4/16 interval                                                                                                                                                                                                
   mfilt # (C16_0, C16_1, C16_2, C16_3, C17_0, C17_1, C17_2, C17_3) mf_x3p3_54 ( .clk(clk), .reset(reset), .symEn(symEn), .sym2xEn(sym2xEn), .i(i), .q(q), .mf0IOut(mf_p3p3_54Real), .mf0QOut(mf_p3p3_54Imag), .mf1IOut(mf_m3m3_54Real), .mf1QOut(mf_m3m3_54Imag) );
   mfilt # (C18_0, C18_1, C18_2, C18_3, C19_0, C19_1, C19_2, C19_3) mf_x3p1_54 ( .clk(clk), .reset(reset), .symEn(symEn), .sym2xEn(sym2xEn), .i(i), .q(q), .mf0IOut(mf_p3p1_54Real), .mf0QOut(mf_p3p1_54Imag), .mf1IOut(mf_m3m1_54Real), .mf1QOut(mf_m3m1_54Imag) );
   mfilt # (C20_0, C20_1, C20_2, C20_3, C21_0, C21_1, C21_2, C21_3) mf_x3m1_54 ( .clk(clk), .reset(reset), .symEn(symEn), .sym2xEn(sym2xEn), .i(i), .q(q), .mf0IOut(mf_p3m1_54Real), .mf0QOut(mf_p3m1_54Imag), .mf1IOut(mf_m3p1_54Real), .mf1QOut(mf_m3p1_54Imag) );
   mfilt # (C22_0, C22_1, C22_2, C22_3, C23_0, C23_1, C23_2, C23_3) mf_x3m3_54 ( .clk(clk), .reset(reset), .symEn(symEn), .sym2xEn(sym2xEn), .i(i), .q(q), .mf0IOut(mf_p3m3_54Real), .mf0QOut(mf_p3m3_54Imag), .mf1IOut(mf_m3p3_54Real), .mf1QOut(mf_m3p3_54Imag) );
   mfilt # (C24_0, C24_1, C24_2, C24_3, C25_0, C25_1, C25_2, C25_3) mf_x1p3_54 ( .clk(clk), .reset(reset), .symEn(symEn), .sym2xEn(sym2xEn), .i(i), .q(q), .mf0IOut(mf_p1p3_54Real), .mf0QOut(mf_p1p3_54Imag), .mf1IOut(mf_m1m3_54Real), .mf1QOut(mf_m1m3_54Imag) );
   mfilt # (C26_0, C26_1, C26_2, C26_3, C27_0, C27_1, C27_2, C27_3) mf_x1p1_54 ( .clk(clk), .reset(reset), .symEn(symEn), .sym2xEn(sym2xEn), .i(i), .q(q), .mf0IOut(mf_p1p1_54Real), .mf0QOut(mf_p1p1_54Imag), .mf1IOut(mf_m1m1_54Real), .mf1QOut(mf_m1m1_54Imag) );
   mfilt # (C28_0, C28_1, C28_2, C28_3, C29_0, C29_1, C29_2, C29_3) mf_x1m1_54 ( .clk(clk), .reset(reset), .symEn(symEn), .sym2xEn(sym2xEn), .i(i), .q(q), .mf0IOut(mf_p1m1_54Real), .mf0QOut(mf_p1m1_54Imag), .mf1IOut(mf_m1p1_54Real), .mf1QOut(mf_m1p1_54Imag) );
   mfilt # (C30_0, C30_1, C30_2, C30_3, C31_0, C31_1, C31_2, C31_3) mf_x1m3_54 ( .clk(clk), .reset(reset), .symEn(symEn), .sym2xEn(sym2xEn), .i(i), .q(q), .mf0IOut(mf_p1m3_54Real), .mf0QOut(mf_p1m3_54Imag), .mf1IOut(mf_m1p3_54Real), .mf1QOut(mf_m1p3_54Imag) );
                                                                                                                                                                                                                             
   reg [12:0]             symEnSr;
   reg [12:0]             sym2xEnSr;
   always @(posedge clk) begin
      if (reset) begin
         symEnSr <= 0;
         sym2xEnSr <= 0;
      end
      else begin
         symEnSr <= {symEnSr[12:0], symEn};
         sym2xEnSr <= {sym2xEnSr[12:0], sym2xEn};
      end
   end                 
   assign symEnOut = symEnSr[8];
   assign sym2xEnOut = sym2xEnSr[8];



                                                                                                                                                                                                                             
/* -----\/----- EXCLUDED -----\/-----
   always @(posedge clk)
     begin
        //if (symEn)begin
         $display("\t%f\t%f\t%f\t%f\t%f\t%f",
                  $itor($signed(i))/(2**17),
                  $itor($signed(q))/(2**17),
                  $itor($signed(mf_p3p3_45Real))/(2**(MF_BITS-1)),
                  $itor($signed(mf_p3p3_45Imag))/(2**(MF_BITS-1)),
                  $itor($signed(mf_p3p1_45Real))/(2**(MF_BITS-1)),
                  $itor($signed(mf_p3p1_45Imag))/(2**(MF_BITS-1)));
        //end
     end
 -----/\----- EXCLUDED -----/\----- */


   
endmodule
