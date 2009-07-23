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

module viterbi_top(clk, reset, symEn,
                   out0Pt1Real, out0Pt1Imag, out1Pt1Real, out1Pt1Imag,
                   out0Pt2Real, out0Pt2Imag, out1Pt2Real, out1Pt2Imag,
                   out0Pt3Real, out0Pt3Imag, out1Pt3Real, out1Pt3Imag,
                   out0Pt4Real, out0Pt4Imag, out1Pt4Real, out1Pt4Imag,
                   out0Pt5Real, out0Pt5Imag, out1Pt5Real, out1Pt5Imag,
                   out0Pt6Real, out0Pt6Imag, out1Pt6Real, out1Pt6Imag,
                   out0Pt7Real, out0Pt7Imag, out1Pt7Real, out1Pt7Imag,
                   out0Pt8Real, out0Pt8Imag, out1Pt8Real, out1Pt8Imag,
                   out0Pt9Real, out0Pt9Imag, out1Pt9Real, out1Pt9Imag,
                   out0Pt10Real,out0Pt10Imag,out1Pt10Real,out1Pt10Imag,
                   out0Pt11Real,out0Pt11Imag,out1Pt11Real,out1Pt11Imag,
                   out0Pt12Real,out0Pt12Imag,out1Pt12Real,out1Pt12Imag,
                   out0Pt13Real,out0Pt13Imag,out1Pt13Real,out1Pt13Imag,
                   out0Pt14Real,out0Pt14Imag,out1Pt14Real,out1Pt14Imag,
                   out0Pt15Real,out0Pt15Imag,out1Pt15Real,out1Pt15Imag,
                   out0Pt16Real,out0Pt16Imag,out1Pt16Real,out1Pt16Imag,
                   out0Pt17Real,out0Pt17Imag,out1Pt17Real,out1Pt17Imag,
                   out0Pt18Real,out0Pt18Imag,out1Pt18Real,out1Pt18Imag,
                   out0Pt19Real,out0Pt19Imag,out1Pt19Real,out1Pt19Imag,
                   out0Pt20Real,out0Pt20Imag,out1Pt20Real,out1Pt20Imag,
                   index, decision, symEn_tbtDly, 
                   phaseError, devError, symEn_phErr, 
                   oneOrZeroPredecessor);
   
   parameter            size = 8;
   parameter            ROT_BITS = 10;
   input                clk,reset,symEn;
   input [size-1:0]     out0Pt1Real, out1Pt1Real,  
                        out0Pt2Real, out1Pt2Real,  
                        out0Pt3Real, out1Pt3Real,  
                        out0Pt4Real, out1Pt4Real,  
                        out0Pt5Real, out1Pt5Real,  
                        out0Pt6Real, out1Pt6Real,  
                        out0Pt7Real, out1Pt7Real,  
                        out0Pt8Real, out1Pt8Real,  
                        out0Pt9Real, out1Pt9Real,  
                        out0Pt10Real,out1Pt10Real, 
                        out0Pt11Real,out1Pt11Real, 
                        out0Pt12Real,out1Pt12Real, 
                        out0Pt13Real,out1Pt13Real, 
                        out0Pt14Real,out1Pt14Real, 
                        out0Pt15Real,out1Pt15Real, 
                        out0Pt16Real,out1Pt16Real, 
                        out0Pt17Real,out1Pt17Real, 
                        out0Pt18Real,out1Pt18Real, 
                        out0Pt19Real,out1Pt19Real, 
                        out0Pt20Real,out1Pt20Real;

   input [ROT_BITS-1:0] out0Pt1Imag, out1Pt1Imag,     
                        out0Pt2Imag, out1Pt2Imag,     
                        out0Pt3Imag, out1Pt3Imag,     
                        out0Pt4Imag, out1Pt4Imag,     
                        out0Pt5Imag, out1Pt5Imag,     
                        out0Pt6Imag, out1Pt6Imag,     
                        out0Pt7Imag, out1Pt7Imag,        
                        out0Pt8Imag, out1Pt8Imag,     
                        out0Pt9Imag,  out1Pt9Imag,    
                        out0Pt10Imag, out1Pt10Imag,
                        out0Pt11Imag, out1Pt11Imag,
                        out0Pt12Imag, out1Pt12Imag,
                        out0Pt13Imag, out1Pt13Imag,
                        out0Pt14Imag, out1Pt14Imag,
                        out0Pt15Imag, out1Pt15Imag,
                        out0Pt16Imag, out1Pt16Imag,
                        out0Pt17Imag, out1Pt17Imag,
                        out0Pt18Imag, out1Pt18Imag,
                        out0Pt19Imag, out1Pt19Imag,
                        out0Pt20Imag, out1Pt20Imag;
   
   output   [4:0]        index;
   output                decision;
   output                symEn_tbtDly;
   output [ROT_BITS-1:0] phaseError;
   output [ROT_BITS-1:0] devError;
   output                symEn_phErr;
   output                oneOrZeroPredecessor;
   wire [(size-1)+4:0]   accMetOut [0:19];
   wire [19:0]           sel;
   reg [19:0]            sel_1dly, sel_2dly, sel_3dly;
   wire [4:0]            index;
   reg [ROT_BITS-1:0]    phaseError;
   reg [ROT_BITS-1:0]    devError;
   reg [1:0]             cnt;

   reg [ROT_BITS-1:0] out1Imag_1dly , out1Imag_2dly , // out1Imag_3dly ,
                      out2Imag_1dly , out2Imag_2dly , // out2Imag_3dly ,
                      out3Imag_1dly , out3Imag_2dly , // out3Imag_3dly ,
                      out4Imag_1dly , out4Imag_2dly , // out4Imag_3dly ,
                      out5Imag_1dly , out5Imag_2dly , // out5Imag_3dly ,
                      out6Imag_1dly , out6Imag_2dly , // out6Imag_3dly ,
                      out7Imag_1dly , out7Imag_2dly , // out7Imag_3dly ,
                      out8Imag_1dly , out8Imag_2dly , // out8Imag_3dly ,
                      out9Imag_1dly , out9Imag_2dly , // out9Imag_3dly ,
                      out10Imag_1dly, out10Imag_2dly, // out10Imag_3dly,
                      out11Imag_1dly, out11Imag_2dly, // out11Imag_3dly,
                      out12Imag_1dly, out12Imag_2dly, // out12Imag_3dly,
                      out13Imag_1dly, out13Imag_2dly, // out13Imag_3dly,
                      out14Imag_1dly, out14Imag_2dly, // out14Imag_3dly,
                      out15Imag_1dly, out15Imag_2dly, // out15Imag_3dly,
                      out16Imag_1dly, out16Imag_2dly, // out16Imag_3dly,
                      out17Imag_1dly, out17Imag_2dly, // out17Imag_3dly,
                      out18Imag_1dly, out18Imag_2dly, // out18Imag_3dly,
                      out19Imag_1dly, out19Imag_2dly, // out19Imag_3dly,
                      out20Imag_1dly, out20Imag_2dly; // out20Imag_3dly;


   wire [ROT_BITS-1:0] out1Imag , 
                       out2Imag , 
                       out3Imag , 
                       out4Imag , 
                       out5Imag , 
                       out6Imag , 
                       out7Imag , 
                       out8Imag , 
                       out9Imag , 
                       out10Imag, 
                       out11Imag, 
                       out12Imag, 
                       out13Imag, 
                       out14Imag, 
                       out15Imag, 
                       out16Imag, 
                       out17Imag, 
                       out18Imag, 
                       out19Imag, 
                       out20Imag;
`ifdef USE_LEAKY
   wire [ROT_BITS-1:0] out1Real , 
                       out2Real , 
                       out3Real , 
                       out4Real , 
                       out5Real , 
                       out6Real , 
                       out7Real , 
                       out8Real , 
                       out9Real , 
                       out10Real, 
                       out11Real, 
                       out12Real, 
                       out13Real, 
                       out14Real, 
                       out15Real, 
                       out16Real, 
                       out17Real, 
                       out18Real, 
                       out19Real, 
                       out20Real;
`endif
   
`ifdef SIMULATE
   // in simulation we have to reset the accumulatios when the input data is known.
   // simReset is toggled in the test bench
   //reg                  simReset;
   //wire                 acsReset = simReset;
   wire                 acsReset = reset;
`else
   wire                 acsReset = reset;
`endif
      
   // 20 Add Compare Select (acs) units with its decision output (sel0..sel19) 

   wire s0, s1, s2, s3,  s4, s5, s6, s7, s8, s9, s10, s11, s12, s13, s14, s15, s16, s17, s18, s19;
   wire normalizeIn = s0 | s1 | s2 | s3 |  s4 | s5 | s6 | s7 | s8 | s9 | s10 | s11 | s12 | s13 | s14 | s15 | s16 | s17 | s18 | s19; // normalizeIn determines if the accumlator output need to be normalized or not

`ifdef ACS_ANNOTATE                                                                                                                                                                                                                                                                                                                                                   
   acs acs7  (.clk(clk), .reset(acsReset), .symEn(symEn), .matFilt1(out1Pt1Real ),  .matFilt2(out0Pt15Real),  .accMet1(accMetOut[0][(size-1)+4:0] ), .accMet2(accMetOut[14][(size-1)+4:0]), .accMetOut(accMetOut[7][(size-1)+4:0] ), .selOut(sel[7 ]), .normalizeIn(normalizeIn), .normalizeOut(s7 ), .out1PtImag(out1Pt1Imag ), .out0PtImag(out0Pt15Imag), .outImag(out8Imag ) );
   acs acs8  (.clk(clk), .reset(acsReset), .symEn(symEn), .matFilt1(out1Pt2Real ),  .matFilt2(out0Pt16Real),  .accMet1(accMetOut[1][(size-1)+4:0] ), .accMet2(accMetOut[15][(size-1)+4:0]), .accMetOut(accMetOut[8][(size-1)+4:0] ), .selOut(sel[8 ]), .normalizeIn(normalizeIn), .normalizeOut(s8 ), .out1PtImag(out1Pt2Imag ), .out0PtImag(out0Pt16Imag), .outImag(out9Imag ) );
   acs acs9  (.clk(clk), .reset(acsReset), .symEn(symEn), .matFilt1(out1Pt3Real ),  .matFilt2(out0Pt17Real),  .accMet1(accMetOut[2][(size-1)+4:0] ), .accMet2(accMetOut[16][(size-1)+4:0]), .accMetOut(accMetOut[9][(size-1)+4:0] ), .selOut(sel[9 ]), .normalizeIn(normalizeIn), .normalizeOut(s9 ), .out1PtImag(out1Pt3Imag ), .out0PtImag(out0Pt17Imag), .outImag(out10Imag) );
   acs acs10 (.clk(clk), .reset(acsReset), .symEn(symEn), .matFilt1(out1Pt4Real ),  .matFilt2(out0Pt18Real),  .accMet1(accMetOut[3][(size-1)+4:0] ), .accMet2(accMetOut[17][(size-1)+4:0]), .accMetOut(accMetOut[10][(size-1)+4:0]), .selOut(sel[10]), .normalizeIn(normalizeIn), .normalizeOut(s10), .out1PtImag(out1Pt4Imag ), .out0PtImag(out0Pt18Imag), .outImag(out11Imag) );
   acs acs11 (.clk(clk), .reset(acsReset), .symEn(symEn), .matFilt1(out1Pt5Real ),  .matFilt2(out0Pt19Real),  .accMet1(accMetOut[4][(size-1)+4:0] ), .accMet2(accMetOut[18][(size-1)+4:0]), .accMetOut(accMetOut[11][(size-1)+4:0]), .selOut(sel[11]), .normalizeIn(normalizeIn), .normalizeOut(s11), .out1PtImag(out1Pt5Imag ), .out0PtImag(out0Pt19Imag), .outImag(out12Imag) );
   acs acs12 (.clk(clk), .reset(acsReset), .symEn(symEn), .matFilt1(out1Pt6Real ),  .matFilt2(out0Pt20Real),  .accMet1(accMetOut[5][(size-1)+4:0] ), .accMet2(accMetOut[19][(size-1)+4:0]), .accMetOut(accMetOut[12][(size-1)+4:0]), .selOut(sel[12]), .normalizeIn(normalizeIn), .normalizeOut(s12), .out1PtImag(out1Pt6Imag ), .out0PtImag(out0Pt20Imag), .outImag(out13Imag) );
   acs acs13 (.clk(clk), .reset(acsReset), .symEn(symEn), .matFilt1(out1Pt7Real ),  .matFilt2(out0Pt1Real ),  .accMet1(accMetOut[6][(size-1)+4:0] ), .accMet2(accMetOut[0 ][(size-1)+4:0]), .accMetOut(accMetOut[13][(size-1)+4:0]), .selOut(sel[13]), .normalizeIn(normalizeIn), .normalizeOut(s13), .out1PtImag(out1Pt7Imag ), .out0PtImag(out0Pt1Imag ), .outImag(out14Imag) );
   acs acs14 (.clk(clk), .reset(acsReset), .symEn(symEn), .matFilt1(out1Pt8Real ),  .matFilt2(out0Pt2Real ),  .accMet1(accMetOut[7][(size-1)+4:0] ), .accMet2(accMetOut[1 ][(size-1)+4:0]), .accMetOut(accMetOut[14][(size-1)+4:0]), .selOut(sel[14]), .normalizeIn(normalizeIn), .normalizeOut(s14), .out1PtImag(out1Pt8Imag ), .out0PtImag(out0Pt2Imag ), .outImag(out15Imag) );
   acs acs15 (.clk(clk), .reset(acsReset), .symEn(symEn), .matFilt1(out1Pt9Real ),  .matFilt2(out0Pt3Real ),  .accMet1(accMetOut[8][(size-1)+4:0] ), .accMet2(accMetOut[2 ][(size-1)+4:0]), .accMetOut(accMetOut[15][(size-1)+4:0]), .selOut(sel[15]), .normalizeIn(normalizeIn), .normalizeOut(s15), .out1PtImag(out1Pt9Imag ), .out0PtImag(out0Pt3Imag ), .outImag(out16Imag) );
   acs acs16 (.clk(clk), .reset(acsReset), .symEn(symEn), .matFilt1(out1Pt10Real),  .matFilt2(out0Pt4Real ),  .accMet1(accMetOut[9][(size-1)+4:0] ), .accMet2(accMetOut[3 ][(size-1)+4:0]), .accMetOut(accMetOut[16][(size-1)+4:0]), .selOut(sel[16]), .normalizeIn(normalizeIn), .normalizeOut(s16), .out1PtImag(out1Pt10Imag), .out0PtImag(out0Pt4Imag ), .outImag(out17Imag) );
   acs acs17 (.clk(clk), .reset(acsReset), .symEn(symEn), .matFilt1(out1Pt11Real),  .matFilt2(out0Pt5Real ),  .accMet1(accMetOut[10][(size-1)+4:0]), .accMet2(accMetOut[4 ][(size-1)+4:0]), .accMetOut(accMetOut[17][(size-1)+4:0]), .selOut(sel[17]), .normalizeIn(normalizeIn), .normalizeOut(s17), .out1PtImag(out1Pt11Imag), .out0PtImag(out0Pt5Imag ), .outImag(out18Imag) );
   acs acs18 (.clk(clk), .reset(acsReset), .symEn(symEn), .matFilt1(out1Pt12Real),  .matFilt2(out0Pt6Real ),  .accMet1(accMetOut[11][(size-1)+4:0]), .accMet2(accMetOut[5 ][(size-1)+4:0]), .accMetOut(accMetOut[18][(size-1)+4:0]), .selOut(sel[18]), .normalizeIn(normalizeIn), .normalizeOut(s18), .out1PtImag(out1Pt12Imag), .out0PtImag(out0Pt6Imag ), .outImag(out19Imag) );
   acs acs19 (.clk(clk), .reset(acsReset), .symEn(symEn), .matFilt1(out1Pt13Real),  .matFilt2(out0Pt7Real ),  .accMet1(accMetOut[12][(size-1)+4:0]), .accMet2(accMetOut[6 ][(size-1)+4:0]), .accMetOut(accMetOut[19][(size-1)+4:0]), .selOut(sel[19]), .normalizeIn(normalizeIn), .normalizeOut(s19), .out1PtImag(out1Pt13Imag), .out0PtImag(out0Pt7Imag ), .outImag(out20Imag) );
   acs acs0  (.clk(clk), .reset(acsReset), .symEn(symEn), .matFilt1(out1Pt14Real),  .matFilt2(out0Pt8Real ),  .accMet1(accMetOut[13][(size-1)+4:0]), .accMet2(accMetOut[7 ][(size-1)+4:0]), .accMetOut(accMetOut[0][(size-1)+4:0] ), .selOut(sel[0 ]), .normalizeIn(normalizeIn), .normalizeOut(s0 ), .out1PtImag(out1Pt14Imag), .out0PtImag(out0Pt8Imag ), .outImag(out1Imag ) );
   acs acs1  (.clk(clk), .reset(acsReset), .symEn(symEn), .matFilt1(out1Pt15Real),  .matFilt2(out0Pt9Real ),  .accMet1(accMetOut[14][(size-1)+4:0]), .accMet2(accMetOut[8 ][(size-1)+4:0]), .accMetOut(accMetOut[1][(size-1)+4:0] ), .selOut(sel[1 ]), .normalizeIn(normalizeIn), .normalizeOut(s1 ), .out1PtImag(out1Pt15Imag), .out0PtImag(out0Pt9Imag ), .outImag(out2Imag ) );
   acs acs2  (.clk(clk), .reset(acsReset), .symEn(symEn), .matFilt1(out1Pt16Real),  .matFilt2(out0Pt10Real),  .accMet1(accMetOut[15][(size-1)+4:0]), .accMet2(accMetOut[9 ][(size-1)+4:0]), .accMetOut(accMetOut[2][(size-1)+4:0] ), .selOut(sel[2 ]), .normalizeIn(normalizeIn), .normalizeOut(s2 ), .out1PtImag(out1Pt16Imag), .out0PtImag(out0Pt10Imag), .outImag(out3Imag ) );
   acs acs3  (.clk(clk), .reset(acsReset), .symEn(symEn), .matFilt1(out1Pt17Real),  .matFilt2(out0Pt11Real),  .accMet1(accMetOut[16][(size-1)+4:0]), .accMet2(accMetOut[10][(size-1)+4:0]), .accMetOut(accMetOut[3][(size-1)+4:0] ), .selOut(sel[3 ]), .normalizeIn(normalizeIn), .normalizeOut(s3 ), .out1PtImag(out1Pt17Imag), .out0PtImag(out0Pt11Imag), .outImag(out4Imag ) );
   acs acs4  (.clk(clk), .reset(acsReset), .symEn(symEn), .matFilt1(out1Pt18Real),  .matFilt2(out0Pt12Real),  .accMet1(accMetOut[17][(size-1)+4:0]), .accMet2(accMetOut[11][(size-1)+4:0]), .accMetOut(accMetOut[4][(size-1)+4:0] ), .selOut(sel[4 ]), .normalizeIn(normalizeIn), .normalizeOut(s4 ), .out1PtImag(out1Pt18Imag), .out0PtImag(out0Pt12Imag), .outImag(out5Imag ) );
   acs acs5  (.clk(clk), .reset(acsReset), .symEn(symEn), .matFilt1(out1Pt19Real),  .matFilt2(out0Pt13Real),  .accMet1(accMetOut[18][(size-1)+4:0]), .accMet2(accMetOut[12][(size-1)+4:0]), .accMetOut(accMetOut[5][(size-1)+4:0] ), .selOut(sel[5 ]), .normalizeIn(normalizeIn), .normalizeOut(s5 ), .out1PtImag(out1Pt19Imag), .out0PtImag(out0Pt13Imag), .outImag(out6Imag ) );
   acs acs6  (.clk(clk), .reset(acsReset), .symEn(symEn), .matFilt1(out1Pt20Real),  .matFilt2(out0Pt14Real),  .accMet1(accMetOut[19][(size-1)+4:0]), .accMet2(accMetOut[13][(size-1)+4:0]), .accMetOut(accMetOut[6][(size-1)+4:0] ), .selOut(sel[6 ]), .normalizeIn(normalizeIn), .normalizeOut(s6 ), .out1PtImag(out1Pt20Imag), .out0PtImag(out0Pt14Imag), .outImag(out7Imag ) );
`else                                                                                                                                                                                                                                                                                                                                                                                                              
`ifdef USE_LEAKY
   acs #(size, ROT_BITS) acs7  (.clk(clk), .reset(acsReset), .symEn(symEn), .matFilt1(out1Pt1Real ),  .matFilt2(out0Pt15Real),  .accMet1(accMetOut[0][(size-1)+4:0] ), .accMet2(accMetOut[14][(size-1)+4:0]), .accMetOut(accMetOut[7][(size-1)+4:0] ), .selOut(sel[7 ]), .normalizeIn(normalizeIn), .normalizeOut(s7 ), .out1PtImag(out1Pt1Imag ), .out0PtImag(out0Pt15Imag), .outImag(out8Imag ), .outReal(out8Real ) );
   acs #(size, ROT_BITS) acs8  (.clk(clk), .reset(acsReset), .symEn(symEn), .matFilt1(out1Pt2Real ),  .matFilt2(out0Pt16Real),  .accMet1(accMetOut[1][(size-1)+4:0] ), .accMet2(accMetOut[15][(size-1)+4:0]), .accMetOut(accMetOut[8][(size-1)+4:0] ), .selOut(sel[8 ]), .normalizeIn(normalizeIn), .normalizeOut(s8 ), .out1PtImag(out1Pt2Imag ), .out0PtImag(out0Pt16Imag), .outImag(out9Imag ), .outReal(out9Real ) );
   acs #(size, ROT_BITS) acs9  (.clk(clk), .reset(acsReset), .symEn(symEn), .matFilt1(out1Pt3Real ),  .matFilt2(out0Pt17Real),  .accMet1(accMetOut[2][(size-1)+4:0] ), .accMet2(accMetOut[16][(size-1)+4:0]), .accMetOut(accMetOut[9][(size-1)+4:0] ), .selOut(sel[9 ]), .normalizeIn(normalizeIn), .normalizeOut(s9 ), .out1PtImag(out1Pt3Imag ), .out0PtImag(out0Pt17Imag), .outImag(out10Imag), .outReal(out10Real) );
   acs #(size, ROT_BITS) acs10 (.clk(clk), .reset(acsReset), .symEn(symEn), .matFilt1(out1Pt4Real ),  .matFilt2(out0Pt18Real),  .accMet1(accMetOut[3][(size-1)+4:0] ), .accMet2(accMetOut[17][(size-1)+4:0]), .accMetOut(accMetOut[10][(size-1)+4:0]), .selOut(sel[10]), .normalizeIn(normalizeIn), .normalizeOut(s10), .out1PtImag(out1Pt4Imag ), .out0PtImag(out0Pt18Imag), .outImag(out11Imag), .outReal(out11Real) );
   acs #(size, ROT_BITS) acs11 (.clk(clk), .reset(acsReset), .symEn(symEn), .matFilt1(out1Pt5Real ),  .matFilt2(out0Pt19Real),  .accMet1(accMetOut[4][(size-1)+4:0] ), .accMet2(accMetOut[18][(size-1)+4:0]), .accMetOut(accMetOut[11][(size-1)+4:0]), .selOut(sel[11]), .normalizeIn(normalizeIn), .normalizeOut(s11), .out1PtImag(out1Pt5Imag ), .out0PtImag(out0Pt19Imag), .outImag(out12Imag), .outReal(out12Real) );
   acs #(size, ROT_BITS) acs12 (.clk(clk), .reset(acsReset), .symEn(symEn), .matFilt1(out1Pt6Real ),  .matFilt2(out0Pt20Real),  .accMet1(accMetOut[5][(size-1)+4:0] ), .accMet2(accMetOut[19][(size-1)+4:0]), .accMetOut(accMetOut[12][(size-1)+4:0]), .selOut(sel[12]), .normalizeIn(normalizeIn), .normalizeOut(s12), .out1PtImag(out1Pt6Imag ), .out0PtImag(out0Pt20Imag), .outImag(out13Imag), .outReal(out13Real) );
   acs #(size, ROT_BITS) acs13 (.clk(clk), .reset(acsReset), .symEn(symEn), .matFilt1(out1Pt7Real ),  .matFilt2(out0Pt1Real ),  .accMet1(accMetOut[6][(size-1)+4:0] ), .accMet2(accMetOut[0 ][(size-1)+4:0]), .accMetOut(accMetOut[13][(size-1)+4:0]), .selOut(sel[13]), .normalizeIn(normalizeIn), .normalizeOut(s13), .out1PtImag(out1Pt7Imag ), .out0PtImag(out0Pt1Imag ), .outImag(out14Imag), .outReal(out14Real) );
   acs #(size, ROT_BITS) acs14 (.clk(clk), .reset(acsReset), .symEn(symEn), .matFilt1(out1Pt8Real ),  .matFilt2(out0Pt2Real ),  .accMet1(accMetOut[7][(size-1)+4:0] ), .accMet2(accMetOut[1 ][(size-1)+4:0]), .accMetOut(accMetOut[14][(size-1)+4:0]), .selOut(sel[14]), .normalizeIn(normalizeIn), .normalizeOut(s14), .out1PtImag(out1Pt8Imag ), .out0PtImag(out0Pt2Imag ), .outImag(out15Imag), .outReal(out15Real) );
   acs #(size, ROT_BITS) acs15 (.clk(clk), .reset(acsReset), .symEn(symEn), .matFilt1(out1Pt9Real ),  .matFilt2(out0Pt3Real ),  .accMet1(accMetOut[8][(size-1)+4:0] ), .accMet2(accMetOut[2 ][(size-1)+4:0]), .accMetOut(accMetOut[15][(size-1)+4:0]), .selOut(sel[15]), .normalizeIn(normalizeIn), .normalizeOut(s15), .out1PtImag(out1Pt9Imag ), .out0PtImag(out0Pt3Imag ), .outImag(out16Imag), .outReal(out16Real) );
   acs #(size, ROT_BITS) acs16 (.clk(clk), .reset(acsReset), .symEn(symEn), .matFilt1(out1Pt10Real),  .matFilt2(out0Pt4Real ),  .accMet1(accMetOut[9][(size-1)+4:0] ), .accMet2(accMetOut[3 ][(size-1)+4:0]), .accMetOut(accMetOut[16][(size-1)+4:0]), .selOut(sel[16]), .normalizeIn(normalizeIn), .normalizeOut(s16), .out1PtImag(out1Pt10Imag), .out0PtImag(out0Pt4Imag ), .outImag(out17Imag), .outReal(out17Real) );
   acs #(size, ROT_BITS) acs17 (.clk(clk), .reset(acsReset), .symEn(symEn), .matFilt1(out1Pt11Real),  .matFilt2(out0Pt5Real ),  .accMet1(accMetOut[10][(size-1)+4:0]), .accMet2(accMetOut[4 ][(size-1)+4:0]), .accMetOut(accMetOut[17][(size-1)+4:0]), .selOut(sel[17]), .normalizeIn(normalizeIn), .normalizeOut(s17), .out1PtImag(out1Pt11Imag), .out0PtImag(out0Pt5Imag ), .outImag(out18Imag), .outReal(out18Real) );
   acs #(size, ROT_BITS) acs18 (.clk(clk), .reset(acsReset), .symEn(symEn), .matFilt1(out1Pt12Real),  .matFilt2(out0Pt6Real ),  .accMet1(accMetOut[11][(size-1)+4:0]), .accMet2(accMetOut[5 ][(size-1)+4:0]), .accMetOut(accMetOut[18][(size-1)+4:0]), .selOut(sel[18]), .normalizeIn(normalizeIn), .normalizeOut(s18), .out1PtImag(out1Pt12Imag), .out0PtImag(out0Pt6Imag ), .outImag(out19Imag), .outReal(out19Real) );
   acs #(size, ROT_BITS) acs19 (.clk(clk), .reset(acsReset), .symEn(symEn), .matFilt1(out1Pt13Real),  .matFilt2(out0Pt7Real ),  .accMet1(accMetOut[12][(size-1)+4:0]), .accMet2(accMetOut[6 ][(size-1)+4:0]), .accMetOut(accMetOut[19][(size-1)+4:0]), .selOut(sel[19]), .normalizeIn(normalizeIn), .normalizeOut(s19), .out1PtImag(out1Pt13Imag), .out0PtImag(out0Pt7Imag ), .outImag(out20Imag), .outReal(out20Real) );
   acs #(size, ROT_BITS) acs0  (.clk(clk), .reset(acsReset), .symEn(symEn), .matFilt1(out1Pt14Real),  .matFilt2(out0Pt8Real ),  .accMet1(accMetOut[13][(size-1)+4:0]), .accMet2(accMetOut[7 ][(size-1)+4:0]), .accMetOut(accMetOut[0][(size-1)+4:0] ), .selOut(sel[0 ]), .normalizeIn(normalizeIn), .normalizeOut(s0 ), .out1PtImag(out1Pt14Imag), .out0PtImag(out0Pt8Imag ), .outImag(out1Imag ), .outReal(out1Real ) );
   acs #(size, ROT_BITS) acs1  (.clk(clk), .reset(acsReset), .symEn(symEn), .matFilt1(out1Pt15Real),  .matFilt2(out0Pt9Real ),  .accMet1(accMetOut[14][(size-1)+4:0]), .accMet2(accMetOut[8 ][(size-1)+4:0]), .accMetOut(accMetOut[1][(size-1)+4:0] ), .selOut(sel[1 ]), .normalizeIn(normalizeIn), .normalizeOut(s1 ), .out1PtImag(out1Pt15Imag), .out0PtImag(out0Pt9Imag ), .outImag(out2Imag ), .outReal(out2Real ) );
   acs #(size, ROT_BITS) acs2  (.clk(clk), .reset(acsReset), .symEn(symEn), .matFilt1(out1Pt16Real),  .matFilt2(out0Pt10Real),  .accMet1(accMetOut[15][(size-1)+4:0]), .accMet2(accMetOut[9 ][(size-1)+4:0]), .accMetOut(accMetOut[2][(size-1)+4:0] ), .selOut(sel[2 ]), .normalizeIn(normalizeIn), .normalizeOut(s2 ), .out1PtImag(out1Pt16Imag), .out0PtImag(out0Pt10Imag), .outImag(out3Imag ), .outReal(out3Real ) );
   acs #(size, ROT_BITS) acs3  (.clk(clk), .reset(acsReset), .symEn(symEn), .matFilt1(out1Pt17Real),  .matFilt2(out0Pt11Real),  .accMet1(accMetOut[16][(size-1)+4:0]), .accMet2(accMetOut[10][(size-1)+4:0]), .accMetOut(accMetOut[3][(size-1)+4:0] ), .selOut(sel[3 ]), .normalizeIn(normalizeIn), .normalizeOut(s3 ), .out1PtImag(out1Pt17Imag), .out0PtImag(out0Pt11Imag), .outImag(out4Imag ), .outReal(out4Real ) );
   acs #(size, ROT_BITS) acs4  (.clk(clk), .reset(acsReset), .symEn(symEn), .matFilt1(out1Pt18Real),  .matFilt2(out0Pt12Real),  .accMet1(accMetOut[17][(size-1)+4:0]), .accMet2(accMetOut[11][(size-1)+4:0]), .accMetOut(accMetOut[4][(size-1)+4:0] ), .selOut(sel[4 ]), .normalizeIn(normalizeIn), .normalizeOut(s4 ), .out1PtImag(out1Pt18Imag), .out0PtImag(out0Pt12Imag), .outImag(out5Imag ), .outReal(out5Real ) );
   acs #(size, ROT_BITS) acs5  (.clk(clk), .reset(acsReset), .symEn(symEn), .matFilt1(out1Pt19Real),  .matFilt2(out0Pt13Real),  .accMet1(accMetOut[18][(size-1)+4:0]), .accMet2(accMetOut[12][(size-1)+4:0]), .accMetOut(accMetOut[5][(size-1)+4:0] ), .selOut(sel[5 ]), .normalizeIn(normalizeIn), .normalizeOut(s5 ), .out1PtImag(out1Pt19Imag), .out0PtImag(out0Pt13Imag), .outImag(out6Imag ), .outReal(out6Real ) );
   acs #(size, ROT_BITS) acs6  (.clk(clk), .reset(acsReset), .symEn(symEn), .matFilt1(out1Pt20Real),  .matFilt2(out0Pt14Real),  .accMet1(accMetOut[19][(size-1)+4:0]), .accMet2(accMetOut[13][(size-1)+4:0]), .accMetOut(accMetOut[6][(size-1)+4:0] ), .selOut(sel[6 ]), .normalizeIn(normalizeIn), .normalizeOut(s6 ), .out1PtImag(out1Pt20Imag), .out0PtImag(out0Pt14Imag), .outImag(out7Imag ), .outReal(out7Real ) );
`else
   acs #(size, ROT_BITS) acs7  (.clk(clk), .reset(acsReset), .symEn(symEn), .matFilt1(out1Pt1Real ),  .matFilt2(out0Pt15Real),  .accMet1(accMetOut[0][(size-1)+4:0] ), .accMet2(accMetOut[14][(size-1)+4:0]), .accMetOut(accMetOut[7][(size-1)+4:0] ), .selOut(sel[7 ]), .normalizeIn(normalizeIn), .normalizeOut(s7 ), .out1PtImag(out1Pt1Imag ), .out0PtImag(out0Pt15Imag), .outImag(out8Imag ) );
   acs #(size, ROT_BITS) acs8  (.clk(clk), .reset(acsReset), .symEn(symEn), .matFilt1(out1Pt2Real ),  .matFilt2(out0Pt16Real),  .accMet1(accMetOut[1][(size-1)+4:0] ), .accMet2(accMetOut[15][(size-1)+4:0]), .accMetOut(accMetOut[8][(size-1)+4:0] ), .selOut(sel[8 ]), .normalizeIn(normalizeIn), .normalizeOut(s8 ), .out1PtImag(out1Pt2Imag ), .out0PtImag(out0Pt16Imag), .outImag(out9Imag ) );
   acs #(size, ROT_BITS) acs9  (.clk(clk), .reset(acsReset), .symEn(symEn), .matFilt1(out1Pt3Real ),  .matFilt2(out0Pt17Real),  .accMet1(accMetOut[2][(size-1)+4:0] ), .accMet2(accMetOut[16][(size-1)+4:0]), .accMetOut(accMetOut[9][(size-1)+4:0] ), .selOut(sel[9 ]), .normalizeIn(normalizeIn), .normalizeOut(s9 ), .out1PtImag(out1Pt3Imag ), .out0PtImag(out0Pt17Imag), .outImag(out10Imag) );
   acs #(size, ROT_BITS) acs10 (.clk(clk), .reset(acsReset), .symEn(symEn), .matFilt1(out1Pt4Real ),  .matFilt2(out0Pt18Real),  .accMet1(accMetOut[3][(size-1)+4:0] ), .accMet2(accMetOut[17][(size-1)+4:0]), .accMetOut(accMetOut[10][(size-1)+4:0]), .selOut(sel[10]), .normalizeIn(normalizeIn), .normalizeOut(s10), .out1PtImag(out1Pt4Imag ), .out0PtImag(out0Pt18Imag), .outImag(out11Imag) );
   acs #(size, ROT_BITS) acs11 (.clk(clk), .reset(acsReset), .symEn(symEn), .matFilt1(out1Pt5Real ),  .matFilt2(out0Pt19Real),  .accMet1(accMetOut[4][(size-1)+4:0] ), .accMet2(accMetOut[18][(size-1)+4:0]), .accMetOut(accMetOut[11][(size-1)+4:0]), .selOut(sel[11]), .normalizeIn(normalizeIn), .normalizeOut(s11), .out1PtImag(out1Pt5Imag ), .out0PtImag(out0Pt19Imag), .outImag(out12Imag) );
   acs #(size, ROT_BITS) acs12 (.clk(clk), .reset(acsReset), .symEn(symEn), .matFilt1(out1Pt6Real ),  .matFilt2(out0Pt20Real),  .accMet1(accMetOut[5][(size-1)+4:0] ), .accMet2(accMetOut[19][(size-1)+4:0]), .accMetOut(accMetOut[12][(size-1)+4:0]), .selOut(sel[12]), .normalizeIn(normalizeIn), .normalizeOut(s12), .out1PtImag(out1Pt6Imag ), .out0PtImag(out0Pt20Imag), .outImag(out13Imag) );
   acs #(size, ROT_BITS) acs13 (.clk(clk), .reset(acsReset), .symEn(symEn), .matFilt1(out1Pt7Real ),  .matFilt2(out0Pt1Real ),  .accMet1(accMetOut[6][(size-1)+4:0] ), .accMet2(accMetOut[0 ][(size-1)+4:0]), .accMetOut(accMetOut[13][(size-1)+4:0]), .selOut(sel[13]), .normalizeIn(normalizeIn), .normalizeOut(s13), .out1PtImag(out1Pt7Imag ), .out0PtImag(out0Pt1Imag ), .outImag(out14Imag) );
   acs #(size, ROT_BITS) acs14 (.clk(clk), .reset(acsReset), .symEn(symEn), .matFilt1(out1Pt8Real ),  .matFilt2(out0Pt2Real ),  .accMet1(accMetOut[7][(size-1)+4:0] ), .accMet2(accMetOut[1 ][(size-1)+4:0]), .accMetOut(accMetOut[14][(size-1)+4:0]), .selOut(sel[14]), .normalizeIn(normalizeIn), .normalizeOut(s14), .out1PtImag(out1Pt8Imag ), .out0PtImag(out0Pt2Imag ), .outImag(out15Imag) );
   acs #(size, ROT_BITS) acs15 (.clk(clk), .reset(acsReset), .symEn(symEn), .matFilt1(out1Pt9Real ),  .matFilt2(out0Pt3Real ),  .accMet1(accMetOut[8][(size-1)+4:0] ), .accMet2(accMetOut[2 ][(size-1)+4:0]), .accMetOut(accMetOut[15][(size-1)+4:0]), .selOut(sel[15]), .normalizeIn(normalizeIn), .normalizeOut(s15), .out1PtImag(out1Pt9Imag ), .out0PtImag(out0Pt3Imag ), .outImag(out16Imag) );
   acs #(size, ROT_BITS) acs16 (.clk(clk), .reset(acsReset), .symEn(symEn), .matFilt1(out1Pt10Real),  .matFilt2(out0Pt4Real ),  .accMet1(accMetOut[9][(size-1)+4:0] ), .accMet2(accMetOut[3 ][(size-1)+4:0]), .accMetOut(accMetOut[16][(size-1)+4:0]), .selOut(sel[16]), .normalizeIn(normalizeIn), .normalizeOut(s16), .out1PtImag(out1Pt10Imag), .out0PtImag(out0Pt4Imag ), .outImag(out17Imag) );
   acs #(size, ROT_BITS) acs17 (.clk(clk), .reset(acsReset), .symEn(symEn), .matFilt1(out1Pt11Real),  .matFilt2(out0Pt5Real ),  .accMet1(accMetOut[10][(size-1)+4:0]), .accMet2(accMetOut[4 ][(size-1)+4:0]), .accMetOut(accMetOut[17][(size-1)+4:0]), .selOut(sel[17]), .normalizeIn(normalizeIn), .normalizeOut(s17), .out1PtImag(out1Pt11Imag), .out0PtImag(out0Pt5Imag ), .outImag(out18Imag) );
   acs #(size, ROT_BITS) acs18 (.clk(clk), .reset(acsReset), .symEn(symEn), .matFilt1(out1Pt12Real),  .matFilt2(out0Pt6Real ),  .accMet1(accMetOut[11][(size-1)+4:0]), .accMet2(accMetOut[5 ][(size-1)+4:0]), .accMetOut(accMetOut[18][(size-1)+4:0]), .selOut(sel[18]), .normalizeIn(normalizeIn), .normalizeOut(s18), .out1PtImag(out1Pt12Imag), .out0PtImag(out0Pt6Imag ), .outImag(out19Imag) );
   acs #(size, ROT_BITS) acs19 (.clk(clk), .reset(acsReset), .symEn(symEn), .matFilt1(out1Pt13Real),  .matFilt2(out0Pt7Real ),  .accMet1(accMetOut[12][(size-1)+4:0]), .accMet2(accMetOut[6 ][(size-1)+4:0]), .accMetOut(accMetOut[19][(size-1)+4:0]), .selOut(sel[19]), .normalizeIn(normalizeIn), .normalizeOut(s19), .out1PtImag(out1Pt13Imag), .out0PtImag(out0Pt7Imag ), .outImag(out20Imag) );
   acs #(size, ROT_BITS) acs0  (.clk(clk), .reset(acsReset), .symEn(symEn), .matFilt1(out1Pt14Real),  .matFilt2(out0Pt8Real ),  .accMet1(accMetOut[13][(size-1)+4:0]), .accMet2(accMetOut[7 ][(size-1)+4:0]), .accMetOut(accMetOut[0][(size-1)+4:0] ), .selOut(sel[0 ]), .normalizeIn(normalizeIn), .normalizeOut(s0 ), .out1PtImag(out1Pt14Imag), .out0PtImag(out0Pt8Imag ), .outImag(out1Imag ) );
   acs #(size, ROT_BITS) acs1  (.clk(clk), .reset(acsReset), .symEn(symEn), .matFilt1(out1Pt15Real),  .matFilt2(out0Pt9Real ),  .accMet1(accMetOut[14][(size-1)+4:0]), .accMet2(accMetOut[8 ][(size-1)+4:0]), .accMetOut(accMetOut[1][(size-1)+4:0] ), .selOut(sel[1 ]), .normalizeIn(normalizeIn), .normalizeOut(s1 ), .out1PtImag(out1Pt15Imag), .out0PtImag(out0Pt9Imag ), .outImag(out2Imag ) );
   acs #(size, ROT_BITS) acs2  (.clk(clk), .reset(acsReset), .symEn(symEn), .matFilt1(out1Pt16Real),  .matFilt2(out0Pt10Real),  .accMet1(accMetOut[15][(size-1)+4:0]), .accMet2(accMetOut[9 ][(size-1)+4:0]), .accMetOut(accMetOut[2][(size-1)+4:0] ), .selOut(sel[2 ]), .normalizeIn(normalizeIn), .normalizeOut(s2 ), .out1PtImag(out1Pt16Imag), .out0PtImag(out0Pt10Imag), .outImag(out3Imag ) );
   acs #(size, ROT_BITS) acs3  (.clk(clk), .reset(acsReset), .symEn(symEn), .matFilt1(out1Pt17Real),  .matFilt2(out0Pt11Real),  .accMet1(accMetOut[16][(size-1)+4:0]), .accMet2(accMetOut[10][(size-1)+4:0]), .accMetOut(accMetOut[3][(size-1)+4:0] ), .selOut(sel[3 ]), .normalizeIn(normalizeIn), .normalizeOut(s3 ), .out1PtImag(out1Pt17Imag), .out0PtImag(out0Pt11Imag), .outImag(out4Imag ) );
   acs #(size, ROT_BITS) acs4  (.clk(clk), .reset(acsReset), .symEn(symEn), .matFilt1(out1Pt18Real),  .matFilt2(out0Pt12Real),  .accMet1(accMetOut[17][(size-1)+4:0]), .accMet2(accMetOut[11][(size-1)+4:0]), .accMetOut(accMetOut[4][(size-1)+4:0] ), .selOut(sel[4 ]), .normalizeIn(normalizeIn), .normalizeOut(s4 ), .out1PtImag(out1Pt18Imag), .out0PtImag(out0Pt12Imag), .outImag(out5Imag ) );
   acs #(size, ROT_BITS) acs5  (.clk(clk), .reset(acsReset), .symEn(symEn), .matFilt1(out1Pt19Real),  .matFilt2(out0Pt13Real),  .accMet1(accMetOut[18][(size-1)+4:0]), .accMet2(accMetOut[12][(size-1)+4:0]), .accMetOut(accMetOut[5][(size-1)+4:0] ), .selOut(sel[5 ]), .normalizeIn(normalizeIn), .normalizeOut(s5 ), .out1PtImag(out1Pt19Imag), .out0PtImag(out0Pt13Imag), .outImag(out6Imag ) );
   acs #(size, ROT_BITS) acs6  (.clk(clk), .reset(acsReset), .symEn(symEn), .matFilt1(out1Pt20Real),  .matFilt2(out0Pt14Real),  .accMet1(accMetOut[19][(size-1)+4:0]), .accMet2(accMetOut[13][(size-1)+4:0]), .accMetOut(accMetOut[6][(size-1)+4:0] ), .selOut(sel[6 ]), .normalizeIn(normalizeIn), .normalizeOut(s6 ), .out1PtImag(out1Pt20Imag), .out0PtImag(out0Pt14Imag), .outImag(out7Imag ) );
`endif
`endif

`ifdef MAX_ANNOTATE
   maxMetric maxMetric symEn
     (
      .clk(clk), 
      .reset(reset), 
      .symEn(symEn), 
      .accMetOut0( accMetOut[0 ]), .accMetOut1( accMetOut[1 ]), 
      .accMetOut2( accMetOut[2 ]), .accMetOut3( accMetOut[3 ]), 
      .accMetOut4( accMetOut[4 ]), .accMetOut5( accMetOut[5 ]), 
      .accMetOut6( accMetOut[6 ]), .accMetOut7( accMetOut[7 ]), 
      .accMetOut8( accMetOut[8 ]), .accMetOut9( accMetOut[9 ]), 
      .accMetOut10(accMetOut[10]), .accMetOut11(accMetOut[11]), 
      .accMetOut12(accMetOut[12]), .accMetOut13(accMetOut[13]), 
      .accMetOut14(accMetOut[14]), .accMetOut15(accMetOut[15]), 
      .accMetOut16(accMetOut[16]), .accMetOut17(accMetOut[17]), 
      .accMetOut18(accMetOut[18]), .accMetOut19(accMetOut[19]),
      .index(index), .symEnDly(symEn_maxMetDly)
      );
`else                                                                                            
   maxMetric #(size) maxMetric 
     (
      .clk(clk), 
      .reset(reset), 
      .symEn(symEn), 
      .accMetOut0( accMetOut[0 ]), .accMetOut1( accMetOut[1 ]), 
      .accMetOut2( accMetOut[2 ]), .accMetOut3( accMetOut[3 ]), 
      .accMetOut4( accMetOut[4 ]), .accMetOut5( accMetOut[5 ]), 
      .accMetOut6( accMetOut[6 ]), .accMetOut7( accMetOut[7 ]), 
      .accMetOut8( accMetOut[8 ]), .accMetOut9( accMetOut[9 ]), 
      .accMetOut10(accMetOut[10]), .accMetOut11(accMetOut[11]), 
      .accMetOut12(accMetOut[12]), .accMetOut13(accMetOut[13]), 
      .accMetOut14(accMetOut[14]), .accMetOut15(accMetOut[15]), 
      .accMetOut16(accMetOut[16]), .accMetOut17(accMetOut[17]), 
      .accMetOut18(accMetOut[18]), .accMetOut19(accMetOut[19]),
      .index(index), .symEnDly(symEn_maxMetDly)
      );
`endif


   reg  testDec;
   reg  testDec1;
   reg  testDec2;
   reg  testDec3;
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
      .symEn(symEn_maxMetDly),
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
      .symEn(symEn_maxMetDly),
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
           out5Imag_1dly  <= out5Imag ;
           out6Imag_1dly  <= out6Imag ;
           out7Imag_1dly  <= out7Imag ;
           out8Imag_1dly  <= out8Imag ;
           out9Imag_1dly  <= out9Imag ;
           out10Imag_1dly <= out10Imag;
           out11Imag_1dly <= out11Imag;
           out12Imag_1dly <= out12Imag;
           out13Imag_1dly <= out13Imag;
           out14Imag_1dly <= out14Imag;
           out15Imag_1dly <= out15Imag;
           out16Imag_1dly <= out16Imag;
           out17Imag_1dly <= out17Imag;
           out18Imag_1dly <= out18Imag;
           out19Imag_1dly <= out19Imag;
           out20Imag_1dly <= out20Imag;
        end
     end

   always @(posedge clk)
     begin
        if (symEn_phErr) begin
           out1Imag_2dly  <= out1Imag_1dly ;
           out2Imag_2dly  <= out2Imag_1dly ;
           out3Imag_2dly  <= out3Imag_1dly ;
           out4Imag_2dly  <= out4Imag_1dly ;
           out5Imag_2dly  <= out5Imag_1dly ;
           out6Imag_2dly  <= out6Imag_1dly ;
           out7Imag_2dly  <= out7Imag_1dly ;
           out8Imag_2dly  <= out8Imag_1dly ;
           out9Imag_2dly  <= out9Imag_1dly ;
           out10Imag_2dly <= out10Imag_1dly;
           out11Imag_2dly <= out11Imag_1dly;
           out12Imag_2dly <= out12Imag_1dly;
           out13Imag_2dly <= out13Imag_1dly;
           out14Imag_2dly <= out14Imag_1dly;
           out15Imag_2dly <= out15Imag_1dly;
           out16Imag_2dly <= out16Imag_1dly;
           out17Imag_2dly <= out17Imag_1dly;
           out18Imag_2dly <= out18Imag_1dly;
           out19Imag_2dly <= out19Imag_1dly;
           out20Imag_2dly <= out20Imag_1dly;
        end
     end
   
/* -----\/----- EXCLUDED -----\/-----
   always @(posedge clk)
     begin
        if (symEn_phErr) begin
           out1Imag_3dly  <= out1Imag_2dly ;
           out2Imag_3dly  <= out2Imag_2dly ;
           out3Imag_3dly  <= out3Imag_2dly ;
           out4Imag_3dly  <= out4Imag_2dly ;
           out5Imag_3dly  <= out5Imag_2dly ;
           out6Imag_3dly  <= out6Imag_2dly ;
           out7Imag_3dly  <= out7Imag_2dly ;
           out8Imag_3dly  <= out8Imag_2dly ;
           out9Imag_3dly  <= out9Imag_2dly ;
           out10Imag_3dly <= out10Imag_2dly;
           out11Imag_3dly <= out11Imag_2dly;
           out12Imag_3dly <= out12Imag_2dly;
           out13Imag_3dly <= out13Imag_2dly;
           out14Imag_3dly <= out14Imag_2dly;
           out15Imag_3dly <= out15Imag_2dly;
           out16Imag_3dly <= out16Imag_2dly;
           out17Imag_3dly <= out17Imag_2dly;
           out18Imag_3dly <= out18Imag_2dly;
           out19Imag_3dly <= out19Imag_2dly;
           out20Imag_3dly <= out20Imag_2dly;
        end
     end
 -----/\----- EXCLUDED -----/\----- */
   
   // counter used to create a delayed verion of the synEn_maxMetDly
   always @(posedge clk)
     begin
        if (reset || symEn_maxMetDly) begin
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
   reg everyOtherSymEn;

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
               4 : phaseError <= out5Imag_2dly ;
               6 : phaseError <= out7Imag_2dly ;
               8 : phaseError <= out9Imag_2dly ;
               10: phaseError <= out11Imag_2dly;
               12: phaseError <= out13Imag_2dly;
               14: phaseError <= out15Imag_2dly;
               16: phaseError <= out17Imag_2dly;
               18: phaseError <= out19Imag_2dly;
               `ifdef USE_ODDS
               1 : phaseError <= out0Pt2Imag_2dly ;
               3 : phaseError <= out0Pt4Imag_2dly ;
               5 : phaseError <= out0Pt6Imag_2dly ;
               7 : phaseError <= out0Pt8Imag_2dly ;
               9 : phaseError <= out0Pt10Imag_2dly;
               11: phaseError <= out0Pt12Imag_2dly;
               13: phaseError <= out0Pt14Imag_2dly;
               15: phaseError <= out0Pt16Imag_2dly;
               17: phaseError <= out0Pt18Imag_2dly;
               19: phaseError <= out0Pt20Imag_2dly;
               `endif
               default: phaseError <= 0;
             endcase
             case ( {index_1d[4:1], 1'b0} ) // selecting only the even imaginary parts
               0 : if (oneOrZeroPredecessor==0) devError <=  out1Imag_2dly ;
                   else                         devError <= -out1Imag_2dly ;
               2 : if (oneOrZeroPredecessor==0) devError <=  out3Imag_2dly ;
                   else                         devError <= -out3Imag_2dly ;
               4 : if (oneOrZeroPredecessor==0) devError <=  out5Imag_2dly ;
                   else                         devError <= -out5Imag_2dly ; 
               6 : if (oneOrZeroPredecessor==0) devError <=  out7Imag_2dly ;
                   else                         devError <= -out7Imag_2dly ; 
               8 : if (oneOrZeroPredecessor==0) devError <=  out9Imag_2dly ;
                   else                         devError <= -out9Imag_2dly ;
               10: if (oneOrZeroPredecessor==0) devError <=  out11Imag_2dly;
                   else                         devError <= -out11Imag_2dly;
               12: if (oneOrZeroPredecessor==0) devError <=  out13Imag_2dly;
                   else                         devError <= -out13Imag_2dly;
               14: if (oneOrZeroPredecessor==0) devError <=  out15Imag_2dly;
                   else                         devError <= -out15Imag_2dly;
               16: if (oneOrZeroPredecessor==0) devError <=  out17Imag_2dly;
                   else                         devError <= -out17Imag_2dly;
               18: if (oneOrZeroPredecessor==0) devError <=  out19Imag_2dly;
                   else                         devError <= -out19Imag_2dly;
               `ifdef USE_ODDS
               1 : if (oneOrZeroPredecessor==0) devError <=  out2Imag_2dly ;
                   else                         devError <= -out2Imag_2dly ;
               3 : if (oneOrZeroPredecessor==0) devError <=  out4Imag_2dly ;
                   else                         devError <= -out4Imag_2dly ;  
               5 : if (oneOrZeroPredecessor==0) devError <=  out6Imag_2dly ;
                   else                         devError <= -out6Imag_2dly ; 
               7 : if (oneOrZeroPredecessor==0) devError <=  out8Imag_2dly ;
                   else                         devError <= -out8Imag_2dly ; 
               9 : if (oneOrZeroPredecessor==0) devError <=  out10Imag_2dly;
                   else                         devError <= -out10Imag_2dly;  
               11: if (oneOrZeroPredecessor==0) devError <=  out12Imag_2dly;
                   else                         devError <= -out12Imag_2dly;
               13: if (oneOrZeroPredecessor==0) devError <=  out14Imag_2dly;
                   else                         devError <= -out14Imag_2dly;
               15: if (oneOrZeroPredecessor==0) devError <=  out16Imag_2dly;
                   else                         devError <= -out16Imag_2dly;
               17: if (oneOrZeroPredecessor==0) devError <=  out18Imag_2dly;
                   else                         devError <= -out18Imag_2dly;
               19: if (oneOrZeroPredecessor==0) devError <=  out20Imag_2dly;
                   else                         devError <= -out20Imag_2dly;
               `endif
               default: devError <= 0;
             endcase
           end
         end
       end

assign decision = tbDecision;

`ifdef SIMULATE
real devErrorReal;
always @(devError) devErrorReal = devError[9] ? devError - 1024.0 : devError;
`endif

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
