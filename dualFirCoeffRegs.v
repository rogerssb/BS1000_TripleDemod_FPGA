/******************************************************************************
Copyright 2008-2015 Koos Technical Services, Inc. All Rights Reserved

This source code is the Intellectual Property of Koos Technical Services,Inc. 
(KTS) and is provided under a License Agreement which protects KTS' ownership and
derivative rights in exchange for negotiated compensation.
******************************************************************************/

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

`include "addressMap.v"

`ifdef USE_BUS_CLOCK

module dualFirCoeffRegs
  (
   busClk,
   addr,
   dataIn,
   dataOut,
   cs,
   wr0, wr1, wr2, wr3,
   c0, c1, c2, c3, c4, c5, c6, c7                   
   );

   input    busClk;
   input   [12:0]addr;
   input [31:0]  dataIn;
   output [31:0] dataOut;
   input         cs;
   input         wr0,wr1,wr2,wr3;
   output [15:0] c0, c1, c2, c3, c4, c5, c6, c7;

`ifdef SIM_NO_uP
   initial begin
      c0 =  0.0015*2**15;
      c1 =  0.0048*2**15;
      c2 = -0.0066*2**15;
      c3 = -0.0362*2**15;
      c4 = -0.0265*2**15;
      c5 =  0.0936*2**15;
      c6 =  0.2814*2**15;
      c7 =  0.3757*2**15;
   end
`endif
   
   
   reg [15:0] c0, c1, c2, c3, c4, c5, c6, c7;
   always @(posedge busClk) begin
      if (cs && wr0) begin
         casex (addr)
           `DDC_FIR_COEFF_0: begin c0[7:0] <= dataIn[7:0]; end
           `DDC_FIR_COEFF_2: begin c2[7:0] <= dataIn[7:0]; end
           `DDC_FIR_COEFF_4: begin c4[7:0] <= dataIn[7:0]; end
           `DDC_FIR_COEFF_6: begin c6[7:0] <= dataIn[7:0]; end
           default: ;
         endcase
      end
      if (cs && wr1) begin
         casex (addr)
           `DDC_FIR_COEFF_0: begin c0[15:8] <= dataIn[15:8]; end
           `DDC_FIR_COEFF_2: begin c2[15:8] <= dataIn[15:8]; end
           `DDC_FIR_COEFF_4: begin c4[15:8] <= dataIn[15:8]; end
           `DDC_FIR_COEFF_6: begin c6[15:8] <= dataIn[15:8]; end
           default: ;
         endcase
      end
      if (cs && wr2) begin
         casex (addr)
           `DDC_FIR_COEFF_1: begin c1[7:0] <= dataIn[23:16]; end
           `DDC_FIR_COEFF_3: begin c3[7:0] <= dataIn[23:16]; end
           `DDC_FIR_COEFF_5: begin c5[7:0] <= dataIn[23:16]; end
           `DDC_FIR_COEFF_7: begin c7[7:0] <= dataIn[23:16]; end
           default: ;
         endcase
      end
      if (cs && wr3) begin
         casex (addr)
           `DDC_FIR_COEFF_1: begin c1[15:8] <= dataIn[31:24]; end
           `DDC_FIR_COEFF_3: begin c3[15:8] <= dataIn[31:24]; end
           `DDC_FIR_COEFF_5: begin c5[15:8] <= dataIn[31:24]; end
           `DDC_FIR_COEFF_7: begin c7[15:8] <= dataIn[31:24]; end
           default: ;
         endcase
      end
   end

   reg [31:0]dataOut;
   always @* begin
      if (cs) begin
         casex (addr)
           `DDC_FIR_COEFF_0:    dataOut = {c1, c0};
           `DDC_FIR_COEFF_1:    dataOut = {c1, c0};
           `DDC_FIR_COEFF_2:    dataOut = {c3, c2};
           `DDC_FIR_COEFF_3:    dataOut = {c3, c2};
           `DDC_FIR_COEFF_4:    dataOut = {c5, c4};
           `DDC_FIR_COEFF_5:    dataOut = {c5, c4};
           `DDC_FIR_COEFF_6:    dataOut = {c7, c6};
           `DDC_FIR_COEFF_7:    dataOut = {c7, c6};
           default         :    dataOut = 32'hx;
         endcase
      end
      else begin
         dataOut = 32'hx;
      end
   end
   
endmodule

`else   // USE_BUS_CLOCK

module dualFirCoeffRegs
  (
   addr,
   dataIn,
   dataOut,
   cs,
   wr0, wr1, wr2, wr3,
   c0, c1, c2, c3, c4, c5, c6, c7                   
   );

   input   [12:0]addr;
   input [31:0]  dataIn;
   output [31:0] dataOut;
   input         cs;
   input         wr0,wr1,wr2,wr3;
   output [15:0] c0, c1, c2, c3, c4, c5, c6, c7;

`ifdef SIM_NO_uP
   initial begin
      c0 =  0.0015*2**15;
      c1 =  0.0048*2**15;
      c2 = -0.0066*2**15;
      c3 = -0.0362*2**15;
      c4 = -0.0265*2**15;
      c5 =  0.0936*2**15;
      c6 =  0.2814*2**15;
      c7 =  0.3757*2**15;
   end
`endif
   
   
   reg [15:0] c0, c1, c2, c3, c4, c5, c6, c7;
   always @(negedge wr0) begin
      if (cs) begin
         casex (addr)
           `DDC_FIR_COEFF_0: begin c0[7:0] <= dataIn[7:0]; end
           `DDC_FIR_COEFF_2: begin c2[7:0] <= dataIn[7:0]; end
           `DDC_FIR_COEFF_4: begin c4[7:0] <= dataIn[7:0]; end
           `DDC_FIR_COEFF_6: begin c6[7:0] <= dataIn[7:0]; end
           default: ;
         endcase
      end
   end
   
   always @(negedge wr1) begin
      if (cs) begin
         casex (addr)
           `DDC_FIR_COEFF_0: begin c0[15:8] <= dataIn[15:8]; end
           `DDC_FIR_COEFF_2: begin c2[15:8] <= dataIn[15:8]; end
           `DDC_FIR_COEFF_4: begin c4[15:8] <= dataIn[15:8]; end
           `DDC_FIR_COEFF_6: begin c6[15:8] <= dataIn[15:8]; end
           default: ;
         endcase
      end
   end

   always @(negedge wr2) begin
      if (cs) begin
         casex (addr)
           `DDC_FIR_COEFF_1: begin c1[7:0] <= dataIn[23:16]; end
           `DDC_FIR_COEFF_3: begin c3[7:0] <= dataIn[23:16]; end
           `DDC_FIR_COEFF_5: begin c5[7:0] <= dataIn[23:16]; end
           `DDC_FIR_COEFF_7: begin c7[7:0] <= dataIn[23:16]; end
           default: ;
         endcase
      end
   end
   
   always @(negedge wr3) begin
      if (cs) begin
         casex (addr)
           `DDC_FIR_COEFF_1: begin c1[15:8] <= dataIn[31:24]; end
           `DDC_FIR_COEFF_3: begin c3[15:8] <= dataIn[31:24]; end
           `DDC_FIR_COEFF_5: begin c5[15:8] <= dataIn[31:24]; end
           `DDC_FIR_COEFF_7: begin c7[15:8] <= dataIn[31:24]; end
           default: ;
         endcase
      end
   end

   reg [31:0]dataOut;
   always @* begin
      if (cs) begin
         casex (addr)
           `DDC_FIR_COEFF_0:    dataOut = {c1, c0};
           `DDC_FIR_COEFF_1:    dataOut = {c1, c0};
           `DDC_FIR_COEFF_2:    dataOut = {c3, c2};
           `DDC_FIR_COEFF_3:    dataOut = {c3, c2};
           `DDC_FIR_COEFF_4:    dataOut = {c5, c4};
           `DDC_FIR_COEFF_5:    dataOut = {c5, c4};
           `DDC_FIR_COEFF_6:    dataOut = {c7, c6};
           `DDC_FIR_COEFF_7:    dataOut = {c7, c6};
           default         :    dataOut = 32'hx;
         endcase
      end
      else begin
         dataOut = 32'hx;
      end
   end
   
endmodule


`endif  // USE_BUS_CLOCK
