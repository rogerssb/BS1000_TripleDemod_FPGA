//-----------------------------------------------------------------------------
// Project      SEMCO Multi-mode Demodulator
// Design       Viterbi Top
// Created      07 April 09
//-----------------------------------------------------------------------------
// 1.0      AMJ initial coding
//
//
//-----------------------------------------------------------------------------

`timescale 1ns/1ps
  
module soqpskViterbi
  (clk, reset, symEn,
   decayFactor,
   mfZr0Real, mfPr0Real, mfMr0Real,
   mfZr1Real, mfPr1Real, mfMr1Real,
   mfZr2Real, mfPr2Real, mfMr2Real,
   mfZr3Real, mfPr3Real, mfMr3Real,
   mfZr0Imag, mfPr0Imag, mfMr0Imag,
   mfZr1Imag, mfPr1Imag, mfMr1Imag,
   mfZr2Imag, mfPr2Imag, mfMr2Imag,
   mfZr3Imag, mfPr3Imag, mfMr3Imag,
   index, decision, 
   phaseError, devError);
   
   parameter             size = 8;
   parameter             ROT_BITS = 10;
   input                 clk,reset,symEn;
   input [7:0]           decayFactor;
   input [ROT_BITS-1:0]  mfZr0Real, mfPr0Real, mfMr0Real,
                         mfZr1Real, mfPr1Real, mfMr1Real,
                         mfZr2Real, mfPr2Real, mfMr2Real,
                         mfZr3Real, mfPr3Real, mfMr3Real;
   input [ROT_BITS-1:0]  mfZr0Imag, mfPr0Imag, mfMr0Imag,
                         mfZr1Imag, mfPr1Imag, mfMr1Imag,
                         mfZr2Imag, mfPr2Imag, mfMr2Imag,
                         mfZr3Imag, mfPr3Imag, mfMr3Imag;
   
   output [1:0]          index;
   output                decision;
   output [ROT_BITS-1:0] phaseError;
   output [ROT_BITS-1:0] devError;
   wire [(size-1)+4:0]   accMetOut [0:3];
   wire [3:0]            sel;
   reg [3:0]             sel_1dly, sel_2dly, sel_3dly;
   wire[4:0]             indexTmp;
   reg [1:0]             index;
   reg [ROT_BITS-1:0]    phaseError;
   reg [ROT_BITS-1:0]    devError;
   
   reg [ROT_BITS-1:0]    out1Imag_1dly , 
                         out2Imag_1dly , 
                         out3Imag_1dly , 
                         out4Imag_1dly ; 
   
   wire [ROT_BITS-1:0]   out1Imag , 
                         out2Imag , 
                         out3Imag , 
                         out4Imag ;   
`ifdef SIMULATE
   // in simulation we have to reset the accumulatios when the input data is known.
   // simReset is toggled in the test bench
   reg                   simReset;
   wire                  acsReset = simReset;
   //wire                 acsReset = reset;
`else
   wire                  acsReset = reset;
`endif
      
   // 20 Add Compare Select (acs) units with its decision output (sel0..sel3) 

   wire                  s0, s1, s2, s3;
   wire                  normalizeIn = s0 | s1 | s2 | s3;
   

   reg                   everyOtherSymEn;
   wire                  symEnEven = everyOtherSymEn;
   `define USE_CLOCK_MUX
   `ifdef USE_CLOCK_MUX
   // A mux is placed in front of each match filter 1 rotation input on the ACS (add compare select module). The mux selects depending upon even or odd symEn interval
   // Real

   wire  [(ROT_BITS-1):(ROT_BITS-1)-(size-1)] mfMr0RealTrunc = mfMr0Real[(ROT_BITS-1):(ROT_BITS-1)-(size-1)];
   wire  [(ROT_BITS-1):(ROT_BITS-1)-(size-1)] mfPr2RealTrunc = mfPr2Real[(ROT_BITS-1):(ROT_BITS-1)-(size-1)];
   
   wire [size-1:0]                            mf1Acs0Trunc = !symEnEven ? mfMr0RealTrunc : mfPr2RealTrunc;
                         
   reg [ROT_BITS-1:0]                         mf1Acs0;
   reg [ROT_BITS-1:0]                         mf1Acs1;
   reg [ROT_BITS-1:0]                         mf1Acs2;
   reg [ROT_BITS-1:0]                         mf1Acs3;
   reg [ROT_BITS-1:0]                         mfZr3RealLatched;
   reg [ROT_BITS-1:0]                         mfZr2RealLatched;
   reg [ROT_BITS-1:0]                         mfZr0RealLatched;
   reg [ROT_BITS-1:0]                         mfZr1RealLatched;     

always @(posedge clk) begin
    if (symEn) begin
       mf1Acs0 <= !symEnEven ? mfMr0Real : mfPr2Real;
       mf1Acs1 <= !symEnEven ? mfPr1Real : mfMr3Real;
       mf1Acs2 <= !symEnEven ? mfPr3Real : mfMr1Real;
       mf1Acs3 <= !symEnEven ? mfMr2Real : mfPr0Real;
       mfZr3RealLatched <= mfZr3Real;
       mfZr2RealLatched <= mfZr2Real;
       mfZr0RealLatched <= mfZr0Real;
       mfZr1RealLatched <= mfZr1Real;     


    end
end

   // Imag
reg     [ROT_BITS-1:0]  mf1Acs0Im, mfZr3ImagLatched;
reg     [ROT_BITS-1:0]  mf1Acs1Im, mfZr2ImagLatched;
reg     [ROT_BITS-1:0]  mf1Acs2Im, mfZr0ImagLatched;
reg     [ROT_BITS-1:0]  mf1Acs3Im, mfZr1ImagLatched;
always @(posedge clk) begin
    if (symEn) begin
       mf1Acs0Im <= !symEnEven ? mfMr0Imag : mfPr2Imag;
       mf1Acs1Im <= !symEnEven ? mfPr1Imag : mfMr3Imag;
       mf1Acs2Im <= !symEnEven ? mfPr3Imag : mfMr1Imag;
       mf1Acs3Im <= !symEnEven ? mfMr2Imag : mfPr0Imag;
       mfZr3ImagLatched <= mfZr3Imag;
       mfZr2ImagLatched <= mfZr2Imag;
       mfZr0ImagLatched <= mfZr0Imag;
       mfZr1ImagLatched <= mfZr1Imag;     
        end
    end
   `else
   // A mux is placed in front of each match filter 1 rotation input on the ACS (add compare select module). The mux selects depending upon even or odd symEn interval
   // Real
   wire [ROT_BITS-1:0]       mf1Acs0 = symEnEven ? mfMr0Real : mfPr2Real;
   wire [ROT_BITS-1:0]       mf1Acs1 = symEnEven ? mfPr1Real : mfMr3Real;
   wire [ROT_BITS-1:0]       mf1Acs2 = symEnEven ? mfPr3Real : mfMr1Real;
   wire [ROT_BITS-1:0]       mf1Acs3 = symEnEven ? mfMr2Real : mfPr0Real;
   // Imag
   wire [ROT_BITS-1:0]       mf1Acs0Im = symEnEven ? mfMr0Imag : mfPr2Imag;
   wire [ROT_BITS-1:0]       mf1Acs1Im = symEnEven ? mfPr1Imag : mfMr3Imag;
   wire [ROT_BITS-1:0]       mf1Acs2Im = symEnEven ? mfPr3Imag : mfMr1Imag;
   wire [ROT_BITS-1:0]       mf1Acs3Im = symEnEven ? mfMr2Imag : mfPr0Imag;
   
   wire [ROT_BITS-1:0]       mfZr3RealLatched = mfZr3Real;
   wire [ROT_BITS-1:0]       mfZr2RealLatched = mfZr2Real;
   wire [ROT_BITS-1:0]       mfZr0RealLatched = mfZr0Real;
   wire [ROT_BITS-1:0]       mfZr1RealLatched = mfZr1Real;     
   wire [ROT_BITS-1:0]       mfZr3ImagLatched = mfZr3Imag;
   wire [ROT_BITS-1:0]       mfZr2ImagLatched = mfZr2Imag;
   wire [ROT_BITS-1:0]       mfZr0ImagLatched = mfZr0Imag;
   wire [ROT_BITS-1:0]       mfZr1ImagLatched = mfZr1Imag;     
  
  `endif
   
   // A mux is placed in front of each accumulated metric 1 rotation input on the ACS (add compare select module). The mux selects depending upon even or odd symEn interval
   wire [size+4-1:0]     acc1Acs0 = symEnEven ? accMetOut[2][(size-1)+4:0] : accMetOut[1][(size-1)+4:0];
   wire [size+4-1:0]     acc1Acs1 = symEnEven ? accMetOut[3][(size-1)+4:0] : accMetOut[0][(size-1)+4:0];
   wire [size+4-1:0]     acc1Acs2 = symEnEven ? accMetOut[0][(size-1)+4:0] : accMetOut[3][(size-1)+4:0];
   wire [size+4-1:0]     acc1Acs3 = symEnEven ? accMetOut[1][(size-1)+4:0] : accMetOut[2][(size-1)+4:0];

      
   //                                                                                                   MF 1                    MF 0                  ACC 1                                 ACC 0                                                                                                                         IMAG MF 1               IMAG MF 0                                                                       
   acs #(size, ROT_BITS) acs0  (.clk(clk), .reset(acsReset), .symEn(symEn), .decayFactor(decayFactor), .out1PtReal(mf1Acs0), .out0PtReal(mfZr3RealLatched), .accMet1(acc1Acs0), .accMet2(accMetOut[0][(size-1)+4:0]), .accMetOut(accMetOut[0][(size-1)+4:0]), .selOut(sel[0]), .normalizeIn(normalizeIn), .normalizeOut(s0), .out1PtImag(mf1Acs0Im), .out0PtImag(mfZr3ImagLatched), .outImag(out1Imag) );
   acs #(size, ROT_BITS) acs1  (.clk(clk), .reset(acsReset), .symEn(symEn), .decayFactor(decayFactor), .out1PtReal(mf1Acs1), .out0PtReal(mfZr2RealLatched), .accMet1(acc1Acs1), .accMet2(accMetOut[1][(size-1)+4:0]), .accMetOut(accMetOut[1][(size-1)+4:0]), .selOut(sel[1]), .normalizeIn(normalizeIn), .normalizeOut(s1), .out1PtImag(mf1Acs1Im), .out0PtImag(mfZr2ImagLatched), .outImag(out2Imag) );
   acs #(size, ROT_BITS) acs2  (.clk(clk), .reset(acsReset), .symEn(symEn), .decayFactor(decayFactor), .out1PtReal(mf1Acs2), .out0PtReal(mfZr0RealLatched), .accMet1(acc1Acs2), .accMet2(accMetOut[2][(size-1)+4:0]), .accMetOut(accMetOut[2][(size-1)+4:0]), .selOut(sel[2]), .normalizeIn(normalizeIn), .normalizeOut(s2), .out1PtImag(mf1Acs2Im), .out0PtImag(mfZr0ImagLatched), .outImag(out3Imag) );
   acs #(size, ROT_BITS) acs3  (.clk(clk), .reset(acsReset), .symEn(symEn), .decayFactor(decayFactor), .out1PtReal(mf1Acs3), .out0PtReal(mfZr1RealLatched), .accMet1(acc1Acs3), .accMet2(accMetOut[3][(size-1)+4:0]), .accMetOut(accMetOut[3][(size-1)+4:0]), .selOut(sel[3]), .normalizeIn(normalizeIn), .normalizeOut(s3), .out1PtImag(mf1Acs3Im), .out0PtImag(mfZr1ImagLatched), .outImag(out4Imag) );

  
   // For the SOQPSK mode we have only 4 states so we don't need the large maxMetric module
   comp4twosComp  #((size+4), 0)  soqpskMaxMetric   
     (
      .clk    (clk         ), 
      .reset  (acsReset    ),
      .a      (accMetOut[0]), 
      .b      (accMetOut[1]), 
      .c      (accMetOut[2]), 
      .d      (accMetOut[3]), 
      .index  (indexTmp    ), 
      .maxVal (            )
      );
   
   // aligning the index with sym rate
   always @(posedge clk)
     begin
        if (symEn) begin
           index <= indexTmp[1:0];
        end
     end
   
   reg                   testDec;
   reg                   testDec1;
   
   always @(posedge clk)
     begin
        if (symEn) begin
           sel_1dly <= sel;
           sel_2dly <= sel_1dly;
           sel_3dly <= sel_2dly;
           testDec  <= ~sel[index];
           testDec1 <= ~sel_1dly[index];    // this is the right sel and index for SOQPSK
        end
     end


`ifdef SIMULATE
   always @(posedge clk)begin
      if(symEn)begin
    //     $display("\t%b\t%b\t%b\t%b",
    //              ~sel[0], ~sel[1], ~sel[2], ~sel[3]
    //              testDec ,
    //              testDec1,
    //              );
      end
   end
`endif   




   
`ifdef TB_ANNOTATE
   traceBackSoqpsk tbt1
     (
      .clk(clk), 
      .reset(reset), 
      .symEn(symEn),
      .symEnEven(symEnEven),
      .sel(sel_1dly), 
      .index(index),
      .decision(decision)
      );
`else
   traceBackSoqpsk #(size) tbt1
     (
      .clk(clk), 
      .reset(reset), 
      .symEn(symEn),
      .symEnEven(symEnEven),
      .sel(sel_1dly), 
      .index(index),
      .decision(decision)
      );
`endif
      
   always @(posedge clk)
     begin
        if (symEn) begin
           out1Imag_1dly  <= out1Imag ;
           out2Imag_1dly  <= out2Imag ;
           out3Imag_1dly  <= out3Imag ;
           out4Imag_1dly  <= out4Imag ;
        end
     end


   wire oneOrZeroPredecessor = ~sel_1dly[index];
   always @(posedge clk)
     begin
        if (reset) begin
           everyOtherSymEn <= 1;
        end
        else begin 
           if (symEn) begin
              everyOtherSymEn <= ~everyOtherSymEn;
           end
        end
      end
         

   
`ifdef SIMULATE
   real                phErr_REAL;   
   always @(phaseError) phErr_REAL = $itor($signed(phaseError))/(2**ROT_BITS);

   always @(posedge clk)begin
      if(symEn)begin                               
         //$display("%f\t%d", phErr_REAL, $signed(phaseError));
      end                                         
   end
`endif

   
   always @(posedge clk)
     begin
        if (reset) begin
           phaseError <= 0;
        end
        else begin 
           if (symEn) begin
              case ( index ) // selecting only the even imaginary parts
                0 : phaseError <= out1Imag_1dly ;
                1 : phaseError <= out2Imag_1dly ;
                2 : phaseError <= out3Imag_1dly ;
                3 : phaseError <= out4Imag_1dly ;
                default: phaseError <= 0;
              endcase
           end
        end
     end
   
endmodule
