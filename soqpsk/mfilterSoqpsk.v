//-----------------------------------------------------------------------------
// Project      SEMCO Multi-mode Demodulator
// Design       SOQPSK Matched Filter
// Created      15 June 09
//-----------------------------------------------------------------------------
// 1.0      (AMJ)Initial coding
//
//
//-----------------------------------------------------------------------------

`timescale 1ns/1ps

module mfilter
  (
   clk, reset, symEn, sym2xEn,
   iIn,qIn,
   iOut,qOut
   );
   
   input         clk,reset,symEn,sym2xEn;
   input [17:0]  iIn,qIn;
   output [17:0] iOut,qOut;
   
   // assign coefficients at module instantiation
   parameter     reC = 18'h0, imC = 18'h0;
   
   wire [17:0]       iOutMult, qOutMult;
   // Complex mult
   cmpy18WithCe cmpMult
     (
      .clk   ( clk     ),
      .reset ( reset   ),
	  .ce    (sym2xEn  ),
      .aReal ( iIn     ),
      .aImag ( qIn     ),
      .bReal ( reC     ),
      .bImag ( imC     ),
      .pReal ( iOutMult),
      .pImag ( qOutMult)
      );

   // latch the samples
   reg [17:0]       iOut, qOut;
 
   always @(posedge clk)begin
      if(sym2xEn)begin
         iOut <= iOutMult;
         qOut <= qOutMult;
      end
   end


`ifdef SIMULATE
   real iIn_REAL, qIn_REAL, reC_REAL, imC_REAL, iOut_REAL, qOut_REAL, simI_REAL, simQ_REAL;
   always @(iIn)           iIn_REAL = $itor($signed(iIn))/(2**17);
   always @(qIn)           qIn_REAL = $itor($signed(qIn))/(2**17);
   initial                 reC_REAL = $itor($signed(reC))/(2**17);
   initial                 imC_REAL = $itor($signed(imC))/(2**17);
   always @(iOut)          iOut_REAL= $itor($signed(iOut))/(2**16);
   always @(qOut)          qOut_REAL= $itor($signed(qOut))/(2**16);
   always @(iIn_REAL or qIn_REAL) simI_REAL = iIn_REAL*reC_REAL - qIn_REAL*imC_REAL;  //  $itor($signed(iIn*reC) - $signed(qIn*imC))/(2**17);
   always @(iIn_REAL or qIn_REAL) simQ_REAL = iIn_REAL*imC_REAL + qIn_REAL*reC_REAL;  //  $itor($signed(iIn*imC) + $signed(qIn*reC))/(2**17);
`endif

   
endmodule