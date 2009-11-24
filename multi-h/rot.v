//-----------------------------------------------------------------------------
// Project      SEMCO Multi-mode Demodulator
// Design       multi-h phase rotator
// Created      05 october 09
//-----------------------------------------------------------------------------
//
// 1.0      AMJ initial coding
//
// Updateing the module to run at the clock rate and not at the symbol rate.
// oct-17-09: Parameterize the vector width
//-----------------------------------------------------------------------------

`timescale 1ns/1ps
  
module rot
  (
   clk, reset, symEn, sym2xEn,
   i,       // data-in normally I 
   q,       // data-in normally Q
   sel,
   angle,
   symEnOut,
   sym2xEnOut,
   selOut,
   iOut,    
   qOut     
   );

`include "rotCoeff.v"
   
   parameter               ROT_BITS=10;
   input                   clk, reset, symEn, sym2xEn;
   input [(ROT_BITS-1):0]  i, q;
   input [2:0]             angle;
   input [4:0]             sel;
   output                  symEnOut;
   output                  sym2xEnOut;
   output [4:0]            selOut;
   output [(ROT_BITS-1):0] iOut, qOut;
   
   wire [(ROT_BITS-1):0]    iOut, qOut;

   
/* -----\/----- EXCLUDED -----\/-----
// I and Q is unity gain  tested 11/23/09
   real iIn_real, qIn_real;
   always @(i or q) begin
       iIn_real <= $itor($signed(i))/(2**(ROT_BITS-1));
       qIn_real <= $itor($signed(q))/(2**(ROT_BITS-1));
   end
   
   always @(posedge clk) begin
         $display("%f\t%f\t%d\t%d",
                  
                  iIn_real,
                  qIn_real, 
                  symEn, sym2xEn);
   end
 -----/\----- EXCLUDED -----/\----- */


   // The rot module is running at the 100 MHz rate and not the symEn rate, so we have to provide synch signal aligned with data.
   reg [4:0] symEnSr;
   reg [4:0] sym2xEnSr;
   reg [4:0] selSr0, selSr1, selSr2, selSr3, selSr4;
   always @(posedge clk) begin
      if (reset) begin
         symEnSr <= 0;
         sym2xEnSr <= 0;
         selSr0 <= 5'b0; 
         selSr1 <= 5'b0; 
         selSr2 <= 5'b0; 
         selSr3 <= 5'b0;
         selSr4 <= 5'b0;
      end
      else begin
         symEnSr <= {symEnSr[3:0], symEn};
         sym2xEnSr <= {sym2xEnSr[3:0], sym2xEn};
         selSr0 <= sel; 
         selSr1 <= selSr0; 
         selSr2 <= selSr1; 
         selSr3 <= selSr2;
         selSr4 <= selSr3;
      end
   end

   assign symEnOut = symEnSr[4];
   assign sym2xEnOut = sym2xEnSr[4];
   assign selOut = selSr4;
   

   // not sure if this is the correct way of doing it

   reg [7:0]     cReal,
                 cImag;

   always @(posedge clk)
     if (reset) begin
        cReal <= 0;
        cImag <= 0;	
     end
     else begin
        casex (angle)				   
          3'b000: begin //0
             cReal <= C_RE0;
             cImag <= C_IM0;
          end
          3'bx01: begin //1 or 5
             cReal <= C_RE1;
             cImag <= C_IM1;
          end
          3'bx10: begin //2 or 6
             cReal <= C_RE2;
             cImag <= C_IM2;
          end
          3'bx11: begin //3 or 7
             cReal <= C_RE3;
             cImag <= C_IM3;
          end
          3'b100: begin //4
             cReal <= C_RE4;
             cImag <= C_IM4;
          end
        endcase
     end

   wire [17:0] ixCi, qxCi;
   wire [17:0] ixCr, qxCr;
   
   mult10x8 reCr
     (
      .sclr  (reset          ), 
      .ce    (1'b1           ),
      .clk   (clk            ),
      .a     (i[ROT_BITS-1:0]),  // [9 : 0] 
      .b     (cReal          ),  // [7 : 0] 
      .p     (ixCr           )   // [17 : 0]
      );
        
   mult10x8 imCi
     (
      .sclr  (reset          ), 
      .ce    (1'b1           ),
      .clk   (clk            ),
      .a     (q[ROT_BITS-1:0]),  // [9 : 0] 
      .b     (cImag          ),  // [7 : 0] 
      .p     (qxCi           )   // [17 : 0]
      );
          
   mult10x8 reCi
     (
      .sclr  (reset          ), 
      .ce    (1'b1           ),
      .clk   (clk            ),
      .a     (i[ROT_BITS-1:0]),  // [9 : 0] 
      .b     (cImag          ),  // [7 : 0] 
      .p     (ixCi           )   // [17 : 0]
      );
   
   mult10x8 imCr
     (
      .sclr  (reset          ), 
      .ce    (1'b1           ),
      .clk   (clk            ),
      .a     (q[ROT_BITS-1:0]),  // [9 : 0] 
      .b     (cReal          ),  // [7 : 0] 
      .p     (qxCr           )   // [17 : 0]
      );


   reg [18:0] iOutTmp, qOutTmp;
   always @(posedge clk)
     if (reset) begin
        iOutTmp <= 0;
        qOutTmp <= 0;	
     end
     else begin
//        iOut <= {ixCr[17], ixCr[17:7]} - {qxCi[17], qxCi[17:7]};  //12 bits out
//        qOut <= {ixCi[17], ixCi[17:7]} + {qxCr[17], qxCr[17:7]};
        iOutTmp <= {ixCr[17], ixCr} - {qxCi[17], qxCi};
        qOutTmp <= {ixCi[17], ixCi} + {qxCr[17], qxCr};
     end
   assign iOut = iOutTmp[18:9];
   assign qOut = qOutTmp[18:9];


`ifdef SIMULATE
   real iOut_real;
   real qOut_real;
   always @(iOut or qOut) begin
      iOut_real <= $itor($signed(iOut))/(2**(ROT_BITS-1));
      qOut_real <= $itor($signed(qOut))/(2**(ROT_BITS-1));		 
   end
   
//   always @(posedge clk) begin
////      if (symEn) begin
//      if (sym2xEnOut) begin
//         $display("%f\t%f",
//                  $itor($signed(iOut))/(2**(ROT_BITS-1)),
//                  $itor($signed(qOut))/(2**(ROT_BITS-1)));
//      end
//   end
`endif




   /* -----\/----- EXCLUDED -----\/-----
   reg [18:0] iOutTmp, qOutTmp;
   always @(posedge clk)
     if (reset) begin
        iOutTmp <= 0;
        qOutTmp <= 0;	
     end
     else begin
        iOutTmp <= {ixCr4[17], ixCr4[17:0]} - {qxCi4[17], qxCi4[17:0]};  //19 bits
        qOutTmp <= {ixCi4[17], ixCi4[17:0]} + {qxCr4[17], qxCr4[17:0]};
     end
   
   assign iOut = iOutTmp[18:7];
   assign qOut = qOutTmp[18:7];
   -----/\----- EXCLUDED -----/\----- */
   
   
      
endmodule
