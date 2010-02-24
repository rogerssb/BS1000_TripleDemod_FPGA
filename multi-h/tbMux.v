//-----------------------------------------------------------------------------
// Project      SEMCO Multi-mode Demodulator
// Design       Trace Back Mux
// Created      18 Jan 10
//-----------------------------------------------------------------------------
// 1.0      AMJ initial coding
//-----------------------------------------------------------------------------

`timescale 1ns/1ps

module tbMux
  (
   clk, 
   reset,
   ce,
   symEnEvenToggle,
   cState,
   tbt0 , tbt1 , tbt2 , tbt3 , tbt4 , tbt5 , tbt6 , tbt7 , 
   tbt8 , tbt9 , tbt10, tbt11, tbt12, tbt13, tbt14, tbt15, 
   tbt16, tbt17, tbt18, tbt19, tbt20, tbt21, tbt22, tbt23, 
   tbt24, tbt25, tbt26, tbt27, tbt28, tbt29, tbt30, tbt31, 
   tbt32, tbt33, tbt34, tbt35, tbt36, tbt37, tbt38, tbt39, 
   tbt40, tbt41, tbt42, tbt43, tbt44, tbt45, tbt46, tbt47, 
   tbt48, tbt49, tbt50, tbt51, tbt52, tbt53, tbt54, tbt55, 
   tbt56, tbt57, tbt58, tbt59, tbt60, tbt61, tbt62, tbt63,
   nState,
   );
   
   input              clk,reset;
   input              ce;
   input              symEnEvenToggle;
   input [5:0]        cState;
   input [1:0]        tbt0 , tbt1 , tbt2 , tbt3 , tbt4 , tbt5 , tbt6 , tbt7 , 
                      tbt8 , tbt9 , tbt10, tbt11, tbt12, tbt13, tbt14, tbt15, 
                      tbt16, tbt17, tbt18, tbt19, tbt20, tbt21, tbt22, tbt23, 
                      tbt24, tbt25, tbt26, tbt27, tbt28, tbt29, tbt30, tbt31, 
                      tbt32, tbt33, tbt34, tbt35, tbt36, tbt37, tbt38, tbt39, 
                      tbt40, tbt41, tbt42, tbt43, tbt44, tbt45, tbt46, tbt47, 
                      tbt48, tbt49, tbt50, tbt51, tbt52, tbt53, tbt54, tbt55, 
                      tbt56, tbt57, tbt58, tbt59, tbt60, tbt61, tbt62, tbt63; // 64 induvidual decision.
   output [5:0]       nState;

   reg [1:0]          d; 
   reg [5:0]          nState;
   
   always @(posedge clk) begin
      nState[1:0] <= d;
      if (~symEnEvenToggle) begin
         //nState[5:2] <= cState[5:2]-5*decisionTmp;
         case (d) // lookup table implementation of above
           0 : begin nState[5:2] <= cState[5:2]; end 
           1 : begin nState[5:2] <= cState[5:2]-5; end 
           2 : begin nState[5:2] <= cState[5:2]-10; end 
           3 : begin nState[5:2] <= cState[5:2]-15; end
         endcase
      end
      else begin
         //nState[5:2] <= cState[5:2]-4*decisionTmp;
         case (d) // lookup table implementation of above
           0 : begin nState[5:2] <= cState[5:2]; end 
           1 : begin nState[5:2] <= cState[5:2]-4; end 
           2 : begin nState[5:2] <= cState[5:2]-8; end 
           3 : begin nState[5:2] <= cState[5:2]-12; end
         endcase
      end
   end 
   
   
   always @(cState or
            tbt0  or tbt1  or tbt2  or tbt3  or tbt4  or tbt5  or tbt6  or tbt7  or 
            tbt8  or tbt9  or tbt10 or tbt11 or tbt12 or tbt13 or tbt14 or tbt15 or 
            tbt16 or tbt17 or tbt18 or tbt19 or tbt20 or tbt21 or tbt22 or tbt23 or 
            tbt24 or tbt25 or tbt26 or tbt27 or tbt28 or tbt29 or tbt30 or tbt31 or 
            tbt32 or tbt33 or tbt34 or tbt35 or tbt36 or tbt37 or tbt38 or tbt39 or 
            tbt40 or tbt41 or tbt42 or tbt43 or tbt44 or tbt45 or tbt46 or tbt47 or 
            tbt48 or tbt49 or tbt50 or tbt51 or tbt52 or tbt53 or tbt54 or tbt55 or 
            tbt56 or tbt57 or tbt58 or tbt59 or tbt60 or tbt61 or tbt62 or tbt63
            ) begin
      case (cState)
       0 : begin d <= tbt0 ; end
       1 : begin d <= tbt1 ; end
       2 : begin d <= tbt2 ; end
       3 : begin d <= tbt3 ; end
       4 : begin d <= tbt4 ; end
       5 : begin d <= tbt5 ; end
       6 : begin d <= tbt6 ; end
       7 : begin d <= tbt7 ; end
       8 : begin d <= tbt8 ; end
       9 : begin d <= tbt9 ; end
       10: begin d <= tbt10; end
       11: begin d <= tbt11; end
       12: begin d <= tbt12; end
       13: begin d <= tbt13; end
       14: begin d <= tbt14; end
       15: begin d <= tbt15; end
       16: begin d <= tbt16; end
       17: begin d <= tbt17; end
       18: begin d <= tbt18; end
       19: begin d <= tbt19; end
       20: begin d <= tbt20; end
       21: begin d <= tbt21; end
       22: begin d <= tbt22; end
       23: begin d <= tbt23; end
       24: begin d <= tbt24; end
       25: begin d <= tbt25; end
       26: begin d <= tbt26; end
       27: begin d <= tbt27; end
       28: begin d <= tbt28; end
       29: begin d <= tbt29; end
       30: begin d <= tbt30; end
       31: begin d <= tbt31; end
       32: begin d <= tbt32; end
       33: begin d <= tbt33; end
       34: begin d <= tbt34; end
       35: begin d <= tbt35; end
       36: begin d <= tbt36; end
       37: begin d <= tbt37; end
       38: begin d <= tbt38; end
       39: begin d <= tbt39; end
       40: begin d <= tbt40; end
       41: begin d <= tbt41; end
       42: begin d <= tbt42; end
       43: begin d <= tbt43; end
       44: begin d <= tbt44; end
       45: begin d <= tbt45; end
       46: begin d <= tbt46; end
       47: begin d <= tbt47; end
       48: begin d <= tbt48; end
       49: begin d <= tbt49; end
       50: begin d <= tbt50; end
       51: begin d <= tbt51; end
       52: begin d <= tbt52; end
       53: begin d <= tbt53; end
       54: begin d <= tbt54; end
       55: begin d <= tbt55; end
       56: begin d <= tbt56; end
       57: begin d <= tbt57; end
       58: begin d <= tbt58; end
       59: begin d <= tbt59; end
       60: begin d <= tbt60; end
       61: begin d <= tbt61; end
       62: begin d <= tbt62; end
       63: begin d <= tbt63; end
     endcase
   end

   
endmodule

