// DDC FIR coefficient register file. 
// The DDC FIR filter was designed to be a 15 tap symmetric FIR filter.
// Due to the odd symmetry the coefficient c14 = c0, c13 = c1
// c14 = c0 
// c13 = c1 
// c12 = c2
// c11 = c3
// c10 = c4 
// c9  = c5
// c8  = c6
// c7 is the odd center tap coefficient.


`timescale 1ns/10ps

`include ".\addressMap.v"

module ddcFirCoeffRegs
  (
   addr,
   dataIn,
   dataOut,
   cs,
   wr0, wr1, wr2, wr3,
   c0, c1, c2, c3, c4, c5, c6, c7                   
   );

   input   [11:0]addr;
   input [31:0]  dataIn;
   output [31:0] dataOut;
   input         cs;
   input         wr0,wr1,wr2,wr3;
   output [15:0] c0, c1, c2, c3, c4, c5, c6, c7;

`define SIM_NO_uP
      
`ifdef SIM_NO_uP
   initial begin
      c0 = 16'hb;
      c1 = 16'h16;
      c2 = 16'h21;
      c3 = 16'h2c;
      c4 = 16'h37;
      c5 = 16'h42;
      c6 = 16'h4d;
      c7 = 16'h58;
   end
`endif
   
   
   reg [15:0] c0, c1, c2, c3, c4, c5, c6, c7;
   always @(negedge wr0) begin
      if (cs) begin
         casex (addr)
           `DDC_FIR_COEFF_0: begin c0[7:0] <= dataIn[7:0]; end
           `DDC_FIR_COEFF_1: begin c1[7:0] <= dataIn[7:0]; end
           `DDC_FIR_COEFF_2: begin c2[7:0] <= dataIn[7:0]; end
           `DDC_FIR_COEFF_3: begin c3[7:0] <= dataIn[7:0]; end
           `DDC_FIR_COEFF_4: begin c4[7:0] <= dataIn[7:0]; end
           `DDC_FIR_COEFF_5: begin c5[7:0] <= dataIn[7:0]; end
           `DDC_FIR_COEFF_6: begin c6[7:0] <= dataIn[7:0]; end
           `DDC_FIR_COEFF_7: begin c7[7:0] <= dataIn[7:0]; end
           default: ;
         endcase
      end
   end
   
   always @(negedge wr1) begin
      if (cs) begin
         casex (addr)
           `DDC_FIR_COEFF_0: begin c0[15:8] <= dataIn[15:8]; end
           `DDC_FIR_COEFF_1: begin c1[15:8] <= dataIn[15:8]; end
           `DDC_FIR_COEFF_2: begin c2[15:8] <= dataIn[15:8]; end
           `DDC_FIR_COEFF_3: begin c3[15:8] <= dataIn[15:8]; end
           `DDC_FIR_COEFF_4: begin c4[15:8] <= dataIn[15:8]; end
           `DDC_FIR_COEFF_5: begin c5[15:8] <= dataIn[15:8]; end
           `DDC_FIR_COEFF_6: begin c6[15:8] <= dataIn[15:8]; end
           `DDC_FIR_COEFF_7: begin c7[15:8] <= dataIn[15:8]; end
           default: ;
         endcase
      end
   end
  /* -----\/----- EXCLUDED -----\/-----
   always @(negedge wr2) begin
      if (cs) begin
         casex (addr)
           `DDC_FIR_COEFF_0: begin c0[17:16] <= dataIn[17:16]; end
           `DDC_FIR_COEFF_1: begin c1[17:16] <= dataIn[17:16]; end
           `DDC_FIR_COEFF_2: begin c2[17:16] <= dataIn[17:16]; end
           `DDC_FIR_COEFF_3: begin c3[17:16] <= dataIn[17:16]; end
           `DDC_FIR_COEFF_4: begin c4[17:16] <= dataIn[17:16]; end
           `DDC_FIR_COEFF_5: begin c5[17:16] <= dataIn[17:16]; end
           `DDC_FIR_COEFF_6: begin c6[17:16] <= dataIn[17:16]; end
           `DDC_FIR_COEFF_7: begin c7[17:16] <= dataIn[17:16]; end
           default: ;
         endcase
      end
   end

   
   -----/\----- EXCLUDED -----/\----- */
   
   reg [31:0]dataOut;
   always @(addr or cs or
            c0 or c1 or c2 or c3 or c4 or c5 or c6 or c7) begin
      if (cs) begin
         casex (addr)
           `DDC_FIR_COEFF_0:    dataOut <= {16'bx, c0};
           `DDC_FIR_COEFF_1:    dataOut <= {16'bx, c1};
           `DDC_FIR_COEFF_2:    dataOut <= {16'bx, c2};
           `DDC_FIR_COEFF_3:    dataOut <= {16'bx, c3};
           `DDC_FIR_COEFF_4:    dataOut <= {16'bx, c4};
           `DDC_FIR_COEFF_5:    dataOut <= {16'bx, c5};
           `DDC_FIR_COEFF_6:    dataOut <= {16'bx, c6};
           `DDC_FIR_COEFF_7:    dataOut <= {16'bx, c7};
           default         :    dataOut <= 32'hx;
         endcase
      end
      else begin
         dataOut <= 32'hx;
      end
   end
   
endmodule
