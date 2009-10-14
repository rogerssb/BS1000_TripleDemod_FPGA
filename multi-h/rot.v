//-----------------------------------------------------------------------------
// Project      SEMCO Multi-mode Demodulator
// Design       multi-h phase rotator
// Created      05 october 09
//-----------------------------------------------------------------------------
//
// 1.0      AMJ initial coding
//
//
//-----------------------------------------------------------------------------

`timescale 1ns/1ps
  
module rot
  (
   clk, reset, symEn,
   i,       // data-in normally I 
   q,       // data-in normally Q
   sel,
   iOut,    
   qOut     
   );
   

   input                 clk, reset, symEn;
   input [17:0]          i, q;
   input [2:0]           sel;
   output [17:0]         iOut, qOut;

   reg [17:0]            iOut, qOut;
   wire [21:0]           ixCi1, qxCi1;
   wire [23:0]           ixCr1, qxCr1;
   wire [22:0]           ixCi2, qxCi2;
   wire [23:0]           ixCr2, qxCr2;
   wire [23:0]           ixCr3, ixCi3, qxCr3, qxCi3;
   wire [23:0]           ixCr4, ixCi4, qxCr4, qxCi4;

   //reg                   ce0, ce1, ce2, ce3, ce4;
   wire                  ce0=1, ce1=1, ce2=1, ce3=1, ce4=1;


   //1to5 Mux:  This will save some power when we turn off the unused multipliers 
/* -----\/----- EXCLUDED -----\/-----
   always @(sel or symEn) begin
      case (sel)
          0: begin
             ce0 <= symEn;
             ce1 <= 0;
             ce2 <= 0;
             ce3 <= 0;
             ce4 <= 0;
          end
          1: begin
             ce0 <= 0;
             ce1 <= symEn;
             ce2 <= 0;
             ce3 <= 0;
             ce4 <= 0;
          end
          2: begin
             ce0 <= 0;
             ce1 <= 0;
             ce2 <= symEn;
             ce3 <= 0;
             ce4 <= 0;
          end
          3: begin
             ce0 <= 0;
             ce1 <= 0;
             ce2 <= 0;
             ce3 <= symEn;
             ce4 <= 0;
          end
          4: begin
             ce0 <= 0;
             ce1 <= 0;
             ce2 <= 0;
             ce3 <= 0;
             ce4 <= symEn;
          end
        endcase // case(sel)
     end
 -----/\----- EXCLUDED -----/\----- */

   
   
   reg [17:0]          iSR0, qSR0, iSR1, qSR1, iSR2, qSR2;
   always @(posedge clk)
     if (reset) begin
        iSR0 <= 0;
        qSR0 <= 0;	
        iSR1 <= 0;
        qSR1 <= 0;	
        iSR2 <= 0;
        qSR2 <= 0;	
     end
     else if (ce0) begin
        iSR0 <= i    ;
        qSR0 <= q    ;
        iSR1 <= iSR0 ;
        qSR1 <= qSR0 ;
        iSR2 <= iSR1 ;
        qSR2 <= qSR1 ;      
     end
   
               
   // ------ 1*2pi/32 = pi/16 rotation ---------
   // dataReal*coeffReal
   constMult12x12_re1 reCr1
     (
      .clk    (clk      ),
      .a      (i[17:6]  ),   // Bus [11 : 0] 
      .ce     (ce1    ),
      .sclr   (reset    ),
      .p      (ixCr1    )    // Bus [23 : 0] 
      );  
   
   // dataImag*coeffImag
   constMult12x12_im1 imCi1
     (
      .clk    (clk      ),
      .a      (q[17:6]  ),   // Bus [11 : 0] 
      .ce     (ce1    ),
      .sclr   (reset    ),
      .p      (qxCi1    )    // Bus [21 : 0] 
      );
   
   // dataReal*coeffImag
   constMult12x12_im1 reCi1
     (
      .clk    (clk      ),
      .a      (i[17:6]  ),   // Bus [11 : 0] 
      .ce     (ce1    ),
      .sclr   (reset    ),
      .p      (ixCi1    )    // Bus [21 : 0] 
      );
  
   // dataImag*coeffReal
   constMult12x12_re1 imCr1
     (
      .clk    (clk      ),
      .a      (q[17:6]  ),   // Bus [11 : 0] 
      .ce     (ce1    ),
      .sclr   (reset    ),
      .p      (qxCr1    )    // Bus [23 : 0] 
      );  

   // ------ 2*2pi/32 = pi/8 rotation ----------
   // dataReal*coeffReal
   constMult12x12_re2 reCr2
     (
      .clk    (clk      ),
      .a      (i[17:6]  ),   // Bus [11 : 0] 
      .ce     (ce2    ),
      .sclr   (reset    ),
      .p      (ixCr2    )    // Bus [23 : 0] 
      );  

   // dataImag*coeffImag
   constMult12x12_im2 imCi2
     (
      .clk    (clk      ),
      .a      (q[17:6]  ),   // Bus [11 : 0] 
      .ce     (ce2    ),
      .sclr   (reset    ),
      .p      (qxCi2    )    // Bus [22 : 0] 
      );
   
   // dataReal*coeffImag
   constMult12x12_im2 reCi2
     (
      .clk    (clk      ),
      .a      (i[17:6]  ),   // Bus [11 : 0] 
      .ce     (ce2    ),
      .sclr   (reset    ),
      .p      (ixCi2    )    // Bus [22 : 0] 
      );
  
   // dataImag*coeffReal
   constMult12x12_re2 imCr2
     (
      .clk    (clk      ),
      .a      (q[17:6]  ),   // Bus [11 : 0] 
      .ce     (ce2    ),
      .sclr   (reset    ),
      .p      (qxCr2    )    // Bus [23 : 0] 
      );
   
   // ------ 3*2pi/32 = 6pi/32 rotation --------
   // dataReal*coeffReal
   constMult12x12_re3 reCr3
     (
      .clk    (clk      ),
      .a      (i[17:6]  ),   // Bus [11 : 0] 
      .ce     (ce3    ),
      .sclr   (reset    ),
      .p      (ixCr3    )    // Bus [23 : 0] 
      );  

   // dataImag*coeffImag
   constMult12x12_im3 imCi3
     (
      .clk    (clk      ),
      .a      (q[17:6]  ),   // Bus [11 : 0] 
      .ce     (ce3    ),
      .sclr   (reset    ),
      .p      (qxCi3    )    // Bus [23 : 0] 
      );
   
   // dataReal*coeffImag
   constMult12x12_im3 reCi3
     (
      .clk    (clk      ),
      .a      (i[17:6]  ),   // Bus [11 : 0] 
      .ce     (ce3    ),
      .sclr   (reset    ),
      .p      (ixCi3    )    // Bus [23 : 0] 
      );
  
   // dataImag*coeffReal
   constMult12x12_re3 imCr3
     (
      .clk    (clk      ),
      .a      (q[17:6]  ),   // Bus [11 : 0] 
      .ce     (ce3    ),
      .sclr   (reset    ),
      .p      (qxCr3    )    // Bus [23 : 0] 
      );
   
   // ------ 4*2pi/32 = pi/4 rotation ----------
   // dataReal*coeffReal
   constMult12x12_re4 reCr4
     (
      .clk    (clk      ),
      .a      (i[17:6]  ),   // Bus [11 : 0] 
      .ce     (ce4    ),
      .sclr   (reset    ),
      .p      (ixCr4    )    // Bus [23 : 0] 
      );  
   
   // dataImag*coeffImag
   constMult12x12_re4 imCi4
     (
      .clk    (clk      ),
      .a      (q[17:6]  ),   // Bus [11 : 0] 
      .ce     (ce4    ),
      .sclr   (reset    ),
      .p      (qxCi4    )    // Bus [23 : 0] 
      );

   // for pi/4 the real=imaginary=sqrt(2)/2. (here we save 2 multiplyer)  
   assign                ixCi4 = ixCr4;
   assign                qxCr4 = qxCi4;
   

   always @(posedge clk)
     if (reset) begin
        iOut <= 0;
        qOut <= 0;	
     end
     else if (symEn) begin
        casex (sel)
          3'b000: begin //0
             iOut <= {iSR2[17], iSR2[17:1]}; //have to div by 2 to match rotated outputs
             qOut <= {qSR2[17], qSR2[17:1]}; //have to div by 2 to match rotated outputs
          end
          3'bx01: begin //1 or 5
             iOut <= {ixCr1[23], ixCr1[23:7]}                       - {qxCi1[21], qxCi1[21], qxCi1[21], qxCi1[21:7]};
             qOut <= {ixCi1[21], ixCi1[21], ixCi1[21], ixCi1[21:7]} + {qxCr1[23], qxCr1[23:7]};
          end
          3'bx10: begin //2 or 6
             iOut <= {ixCr2[23], ixCr2[23:7]}                       - {qxCi2[22], qxCi2[22], qxCi2[22:7]};
             qOut <= {ixCi2[22], ixCi2[22], ixCi2[22:7]}            + {qxCr2[23], qxCr2[23:7]};
          end
          3'bx11: begin //3 or 7
             iOut <= {ixCr3[23], ixCr3[23:7]}                       - {qxCi3[23], qxCi3[23:7]};
             qOut <= {ixCi3[23], ixCi3[23:7]}                       + {qxCr3[23], qxCr3[23:7]};
          end
          3'b100: begin //4
             iOut <= {ixCr4[23], ixCr4[23:7]}                       - {qxCi4[23], qxCi4[23:7]};
             qOut <= {ixCi4[23], ixCi4[23:7]}                       + {qxCr4[23], qxCr4[23:7]};
          end
        endcase // case(sel)
     end

/* -----\/----- EXCLUDED -----\/-----
`ifdef SIMULATE
   real iOut_real;
   real qOut_real;
   always @(iOut or qOut) begin
        iOut_real <= $itor($signed(iOut))/(2**16);
        qOut_real <= $itor($signed(qOut))/(2**16);
   end
   
   always @(posedge clk) begin
      if (symEn) begin
         $display("%f\t%f",
                  $itor($signed(iOut))/(2**16),
                  $itor($signed(qOut))/(2**16));
      end
   end
`endif
 -----/\----- EXCLUDED -----/\----- */
      
endmodule
