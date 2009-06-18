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
  
module soqpskTop
  (clk, reset, symEn,
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
   input [size-1:0]      mfZr0Real, mfPr0Real, mfMr0Real,
                         mfZr1Real, mfPr1Real, mfMr1Real,
                         mfZr2Real, mfPr2Real, mfMr2Real,
                         mfZr3Real, mfPr3Real, mfMr3Real;
   input [ROT_BITS-1:0]  mfZr0Imag, mfPr0Imag, mfMr0Imag,
                         mfZr1Imag, mfPr1Imag, mfMr1Imag,
                         mfZr2Imag, mfPr2Imag, mfMr2Imag,
                         mfZr3Imag, mfPr3Imag, mfMr3Imag;
   
   output [4:0]          index;
   output                decision;
   output [ROT_BITS-1:0] phaseError;
   output [ROT_BITS-1:0] devError;
   wire [(size-1)+4:0]   accMetOut [0:19];
   wire [19:0]           sel;
   reg [19:0]            sel_1dly, sel_2dly, sel_3dly;
   wire [4:0]            index;
   reg [ROT_BITS-1:0]    phaseError;
   reg [ROT_BITS-1:0]    devError;
   reg [1:0]             cnt;
   
   reg [ROT_BITS-1:0]    out1Imag_1dly , out1Imag_2dly , 
                         out2Imag_1dly , out2Imag_2dly , 
                         out3Imag_1dly , out3Imag_2dly , 
                         out4Imag_1dly , out4Imag_2dly ;
   
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
      
   // 20 Add Compare Select (acs) units with its decision output (sel0..sel19) 

   wire                  s0, s1, s2, s3;
   wire                  normalizeIn = s0 | s1 | s2 | s3;
   

    assign symEnEven = everyOtherSymEn;
   // A mux is placed in front of each match filter 1 rotation input on the ACS (add compare select module). The mux selects depending upon even or odd symEn interval
   // Real
   wire [size-1:0]   mf1Acs0 = symEnEven ? mfMr0Real : mfPr2Real;
   wire [size-1:0]   mf1Acs1 = symEnEven ? mfPr1Real : mfMr3Real;
   wire [size-1:0]   mf1Acs2 = symEnEven ? mfPr3Real : mfMr1Real;
   wire [size-1:0]   mf1Acs3 = symEnEven ? mfMr2Real : mfPr0Real;
   // Imag
   wire [ROT_BITS-1:0]   mf1Acs0Im = symEnEven ? mfMr0Imag : mfPr2Imag;
   wire [ROT_BITS-1:0]   mf1Acs1Im = symEnEven ? mfPr1Imag : mfMr3Imag;
   wire [ROT_BITS-1:0]   mf1Acs2Im = symEnEven ? mfPr3Imag : mfMr1Imag;
   wire [ROT_BITS-1:0]   mf1Acs3Im = symEnEven ? mfMr2Imag : mfPr0Imag;
   
   // A mux is placed in front of each accumulated metric 1 rotation input on the ACS (add compare select module). The mux selects depending upon even or odd symEn interval
   wire [size+4-1:0]   acc1Acs0 = symEnEven ? accMetOut[2][(size-1)+4:0] : accMetOut[1][(size-1)+4:0];
   wire [size+4-1:0]   acc1Acs1 = symEnEven ? accMetOut[3][(size-1)+4:0] : accMetOut[0][(size-1)+4:0];
   wire [size+4-1:0]   acc1Acs2 = symEnEven ? accMetOut[0][(size-1)+4:0] : accMetOut[3][(size-1)+4:0];
   wire [size+4-1:0]   acc1Acs3 = symEnEven ? accMetOut[1][(size-1)+4:0] : accMetOut[2][(size-1)+4:0];

   
`ifdef ACS_ANNOTATE                                                                                                                                                                                                                                                                                                                                                   


`else                                                                                                                                                                                                                                                                                                                                                                                                              
   acs #(size, ROT_BITS) acs0  (.clk(clk), .reset(acsReset), .symEn(symEn), .out1PtReal(mf1Acs0), .out0PtReal(mfZr3Real), .accMet1(acc1Acs0), .accMet2(accMetOut[0][(size-1)+4:0]), .accMetOut(accMetOut[0][(size-1)+4:0]), .selOut(sel[0]), .normalizeIn(normalizeIn), .normalizeOut(s0), .out1PtImag(mf1Acs0Im), .out0PtImag(mfZr3Imag), .outImag(out1Imag) );
   acs #(size, ROT_BITS) acs1  (.clk(clk), .reset(acsReset), .symEn(symEn), .out1PtReal(mf1Acs1), .out0PtReal(mfZr2Real), .accMet1(acc1Acs1), .accMet2(accMetOut[1][(size-1)+4:0]), .accMetOut(accMetOut[1][(size-1)+4:0]), .selOut(sel[1]), .normalizeIn(normalizeIn), .normalizeOut(s1), .out1PtImag(mf1Acs1Im), .out0PtImag(mfZr2Imag), .outImag(out2Imag) );
   acs #(size, ROT_BITS) acs2  (.clk(clk), .reset(acsReset), .symEn(symEn), .out1PtReal(mf1Acs2), .out0PtReal(mfZr0Real), .accMet1(acc1Acs2), .accMet2(accMetOut[2][(size-1)+4:0]), .accMetOut(accMetOut[2][(size-1)+4:0]), .selOut(sel[2]), .normalizeIn(normalizeIn), .normalizeOut(s2), .out1PtImag(mf1Acs2Im), .out0PtImag(mfZr0Imag), .outImag(out3Imag) );
   acs #(size, ROT_BITS) acs3  (.clk(clk), .reset(acsReset), .symEn(symEn), .out1PtReal(mf1Acs3), .out0PtReal(mfZr1Real), .accMet1(acc1Acs3), .accMet2(accMetOut[3][(size-1)+4:0]), .accMetOut(accMetOut[3][(size-1)+4:0]), .selOut(sel[3]), .normalizeIn(normalizeIn), .normalizeOut(s3), .out1PtImag(mf1Acs3Im), .out0PtImag(mfZr1Imag), .outImag(out4Imag) );
`endif

  
`ifdef MAX_ANNOTATE
   maxMetric maxMetric symEn
     (
      .clk(clk), 
      .reset(reset), 
      .symEn(symEn), 
      .accMetOut0( accMetOut[0 ]), .accMetOut1( accMetOut[1 ]), 
      .accMetOut2( accMetOut[2 ]), .accMetOut3( accMetOut[3 ]), 
      .accMetOut4( 12'hfff), .accMetOut5( 12'hfff), 
      .accMetOut6( 12'hfff), .accMetOut7( 12'hfff), 
      .accMetOut8( 12'hfff), .accMetOut9( 12'hfff), 
      .accMetOut10(12'hfff), .accMetOut11(12'hfff), 
      .accMetOut12(12'hfff), .accMetOut13(12'hfff), 
      .accMetOut14(12'hfff), .accMetOut15(12'hfff), 
      .accMetOut16(12'hfff), .accMetOut17(12'hfff), 
      .accMetOut18(12'hfff), .accMetOut19(12'hfff),
      .index(index), .symEnDly()
      );
`else                                                                                            
   maxMetric #(size) maxMetric 
     (
      .clk(clk), 
      .reset(reset), 
      .symEn(symEn), 
      .accMetOut0( accMetOut[0 ]), .accMetOut1( accMetOut[1 ]), 
      .accMetOut2( accMetOut[2 ]), .accMetOut3( accMetOut[3 ]), 
      .accMetOut4( 12'hfff), .accMetOut5( 12'hfff), 
      .accMetOut6( 12'hfff), .accMetOut7( 12'hfff), 
      .accMetOut8( 12'hfff), .accMetOut9( 12'hfff), 
      .accMetOut10(12'hfff), .accMetOut11(12'hfff), 
      .accMetOut12(12'hfff), .accMetOut13(12'hfff), 
      .accMetOut14(12'hfff), .accMetOut15(12'hfff), 
      .accMetOut16(12'hfff), .accMetOut17(12'hfff), 
      .accMetOut18(12'hfff), .accMetOut19(12'hfff),
      .index(index), .symEnDly()
      );
`endif


   reg                   testDec;
   reg                   testDec1;
   reg                   testDec2;
   reg                   testDec3;
   //assign testDec = sel_1dly[index];
   
   always @(posedge clk)
     begin
        if (symEn) begin
           sel_1dly <= sel;
           sel_2dly <= sel_1dly;
           sel_3dly <= sel_2dly;
           testDec <= sel[index];
           testDec1 <= sel_1dly[index];
           testDec2 <= sel_2dly[index];
           testDec3 <= sel_3dly[index];
        end
     end
   
`ifdef TB_ANNOTATE
   traceBackTable tbt1
     (
      .clk(clk), 
      .reset(reset), 
      .symEn(symEn),
      .sel(sel_2dly), 
      .index(index),
      .decision(tbDecision),
      .oneOrZeroPredecessor(),
      .symEnDly(symEn_tbtDly)
      );
`else
   traceBackTable #(size) tbt1
     (
      .clk(clk), 
      .reset(reset), 
      .symEn(symEn),
      .sel(sel_2dly), 
      .index(index),
      .decision(tbDecision),
      .oneOrZeroPredecessor(),
      .symEnDly(symEn_tbtDly)
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

   always @(posedge clk)
     begin
        if (symEn_phErr) begin
           out1Imag_2dly  <= out1Imag_1dly ;
           out2Imag_2dly  <= out2Imag_1dly ;
           out3Imag_2dly  <= out3Imag_1dly ;
           out4Imag_2dly  <= out4Imag_1dly ;
        end
     end
   
   
   // counter used to create a delayed verion of the synEn_maxMetDly
   always @(posedge clk)
     begin
        if (reset || symEn) begin
           cnt <= 0;
        end
        else begin
           if (cnt < 3)
             cnt <= cnt + 1;
           else
             cnt <= cnt;
        end
     end
   
   wire oneOrZeroPredecessor = sel_2dly[index];
   reg  everyOtherSymEn;
   
   // creates an enable which strobes only every other symEn 
   assign symEn_phErr = symEn & everyOtherSymEn;

   reg [4:0] index_1d;
   always @(posedge clk)
     begin
        if (reset) begin
           everyOtherSymEn <= 1;
           index_1d <= 0;
        end
        else begin 
           if (symEn) begin
              everyOtherSymEn <= ~everyOtherSymEn;
              index_1d <= index;
           end
        end
      end
         
      
   // Computing the error term
   reg  acsDecision;
   always @(posedge clk)
     begin
        if (reset) begin
           phaseError <= 0;
        end
        else begin 
           if (symEn_tbtDly) begin
             acsDecision <= oneOrZeroPredecessor;
           end
           
           if (symEn_phErr) begin
             case ( {index_1d[4:1], 1'b0} ) // selecting only the even imaginary parts
               0 : phaseError <= out1Imag_2dly ;
               2 : phaseError <= out3Imag_2dly ;
               `ifdef USE_ODDS
               1 : phaseError <= out2Imag_2dly ;
               3 : phaseError <= out4Imag_2dly ;
               `endif
               default: phaseError <= 0;
             endcase
             case ( {index_1d[4:1], 1'b0} ) // selecting only the even imaginary parts
               0 : if (oneOrZeroPredecessor==0) devError <=  out1Imag_2dly ;
                   else                         devError <= -out1Imag_2dly ;
               2 : if (oneOrZeroPredecessor==0) devError <=  out3Imag_2dly ;
                   else                         devError <= -out3Imag_2dly ;
               `ifdef USE_ODDS
               1 : if (oneOrZeroPredecessor==0) devError <=  out2Imag_2dly ;
                   else                         devError <= -out2Imag_2dly ;
               3 : if (oneOrZeroPredecessor==0) devError <=  out4Imag_2dly ;
                   else                         devError <= -out4Imag_2dly ;  
               `endif
               default: devError <= 0;
             endcase
           end
         end
       end

assign decision = tbDecision;

`ifdef SIMULATE

integer file;
initial file = $fopen("decision.dat") ;

   always @(posedge clk)begin
//        if(symEn)begin
        if(symEn_tbtDly)begin
           //$fdisplay(file, "%b\t %d %d", decision, index, $signed(phaseError));
           $fdisplay(file, "%b\t%b\t%b\t%b\t%b", decision, testDec, testDec1, testDec2, testDec3);
        end
   end
`endif   

         
endmodule
