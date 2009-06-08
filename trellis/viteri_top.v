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

   reg [ROT_BITS-1:0]   out0Pt1Imag_1dly , out1Pt1Imag_1dly , out0Pt1Imag_2dly , out1Pt1Imag_2dly , out0Pt1Imag_3dly , out1Pt1Imag_3dly ,
                        out0Pt2Imag_1dly , out1Pt2Imag_1dly , out0Pt2Imag_2dly , out1Pt2Imag_2dly , out0Pt2Imag_3dly , out1Pt2Imag_3dly ,
                        out0Pt3Imag_1dly , out1Pt3Imag_1dly , out0Pt3Imag_2dly , out1Pt3Imag_2dly , out0Pt3Imag_3dly , out1Pt3Imag_3dly ,
                        out0Pt4Imag_1dly , out1Pt4Imag_1dly , out0Pt4Imag_2dly , out1Pt4Imag_2dly , out0Pt4Imag_3dly , out1Pt4Imag_3dly ,
                        out0Pt5Imag_1dly , out1Pt5Imag_1dly , out0Pt5Imag_2dly , out1Pt5Imag_2dly , out0Pt5Imag_3dly , out1Pt5Imag_3dly ,
                        out0Pt6Imag_1dly , out1Pt6Imag_1dly , out0Pt6Imag_2dly , out1Pt6Imag_2dly , out0Pt6Imag_3dly , out1Pt6Imag_3dly ,
                        out0Pt7Imag_1dly , out1Pt7Imag_1dly , out0Pt7Imag_2dly , out1Pt7Imag_2dly , out0Pt7Imag_3dly , out1Pt7Imag_3dly ,
                        out0Pt8Imag_1dly , out1Pt8Imag_1dly , out0Pt8Imag_2dly , out1Pt8Imag_2dly , out0Pt8Imag_3dly , out1Pt8Imag_3dly ,
                        out0Pt9Imag_1dly , out1Pt9Imag_1dly , out0Pt9Imag_2dly , out1Pt9Imag_2dly , out0Pt9Imag_3dly , out1Pt9Imag_3dly ,
                        out0Pt10Imag_1dly, out1Pt10Imag_1dly, out0Pt10Imag_2dly, out1Pt10Imag_2dly, out0Pt10Imag_3dly, out1Pt10Imag_3dly,
                        out0Pt11Imag_1dly, out1Pt11Imag_1dly, out0Pt11Imag_2dly, out1Pt11Imag_2dly, out0Pt11Imag_3dly, out1Pt11Imag_3dly,
                        out0Pt12Imag_1dly, out1Pt12Imag_1dly, out0Pt12Imag_2dly, out1Pt12Imag_2dly, out0Pt12Imag_3dly, out1Pt12Imag_3dly,
                        out0Pt13Imag_1dly, out1Pt13Imag_1dly, out0Pt13Imag_2dly, out1Pt13Imag_2dly, out0Pt13Imag_3dly, out1Pt13Imag_3dly,
                        out0Pt14Imag_1dly, out1Pt14Imag_1dly, out0Pt14Imag_2dly, out1Pt14Imag_2dly, out0Pt14Imag_3dly, out1Pt14Imag_3dly,
                        out0Pt15Imag_1dly, out1Pt15Imag_1dly, out0Pt15Imag_2dly, out1Pt15Imag_2dly, out0Pt15Imag_3dly, out1Pt15Imag_3dly,
                        out0Pt16Imag_1dly, out1Pt16Imag_1dly, out0Pt16Imag_2dly, out1Pt16Imag_2dly, out0Pt16Imag_3dly, out1Pt16Imag_3dly,
                        out0Pt17Imag_1dly, out1Pt17Imag_1dly, out0Pt17Imag_2dly, out1Pt17Imag_2dly, out0Pt17Imag_3dly, out1Pt17Imag_3dly,
                        out0Pt18Imag_1dly, out1Pt18Imag_1dly, out0Pt18Imag_2dly, out1Pt18Imag_2dly, out0Pt18Imag_3dly, out1Pt18Imag_3dly,
                        out0Pt19Imag_1dly, out1Pt19Imag_1dly, out0Pt19Imag_2dly, out1Pt19Imag_2dly, out0Pt19Imag_3dly, out1Pt19Imag_3dly,
                        out0Pt20Imag_1dly, out1Pt20Imag_1dly, out0Pt20Imag_2dly, out1Pt20Imag_2dly, out0Pt20Imag_3dly, out1Pt20Imag_3dly;
   

`ifdef SIMULATE
   // in simulation we have to reset the accumulatios when the input data is known.
   // simReset is toggled in the test bench
//   reg                  simReset;
//   wire                 acsReset = simReset;
   wire                 acsReset = reset;
`else
   wire                 acsReset = reset;
`endif
      
   // 20 Add Compare Select (acs) units with its decision output (sel0..sel19) 

   wire s0, s1, s2, s3,  s4, s5, s6, s7, s8, s9, s10, s11, s12, s13, s14, s15, s16, s17, s18, s19;
   wire shiftIn = s0 | s1 | s2 | s3 |  s4 | s5 | s6 | s7 | s8 | s9 | s10 | s11 | s12 | s13 | s14 | s15 | s16 | s17 | s18 | s19; // shiftIn determines if the accumlator output need to be shifted or not

`ifdef ACS_ANNOTATE
   acs acs7  (.clk(clk), .reset(acsReset), .symEn(symEn), .matFilt1(out1Pt1Real ),  .matFilt2(out0Pt15Real),  .accMet1(accMetOut[0][(size-1)+4:0] ), .accMet2(accMetOut[14][(size-1)+4:0]), .accMetOut(accMetOut[7][(size-1)+4:0] ), .selOut(sel[7 ]), .shiftIn(shiftIn), .shiftOut(s7 ));
   acs acs8  (.clk(clk), .reset(acsReset), .symEn(symEn), .matFilt1(out1Pt2Real ),  .matFilt2(out0Pt16Real),  .accMet1(accMetOut[1][(size-1)+4:0] ), .accMet2(accMetOut[15][(size-1)+4:0]), .accMetOut(accMetOut[8][(size-1)+4:0] ), .selOut(sel[8 ]), .shiftIn(shiftIn), .shiftOut(s8 ));
   acs acs9  (.clk(clk), .reset(acsReset), .symEn(symEn), .matFilt1(out1Pt3Real ),  .matFilt2(out0Pt17Real),  .accMet1(accMetOut[2][(size-1)+4:0] ), .accMet2(accMetOut[16][(size-1)+4:0]), .accMetOut(accMetOut[9][(size-1)+4:0] ), .selOut(sel[9 ]), .shiftIn(shiftIn), .shiftOut(s9 ));
   acs acs10 (.clk(clk), .reset(acsReset), .symEn(symEn), .matFilt1(out1Pt4Real ),  .matFilt2(out0Pt18Real),  .accMet1(accMetOut[3][(size-1)+4:0] ), .accMet2(accMetOut[17][(size-1)+4:0]), .accMetOut(accMetOut[10][(size-1)+4:0]), .selOut(sel[10]), .shiftIn(shiftIn), .shiftOut(s10));
   acs acs11 (.clk(clk), .reset(acsReset), .symEn(symEn), .matFilt1(out1Pt5Real ),  .matFilt2(out0Pt19Real),  .accMet1(accMetOut[4][(size-1)+4:0] ), .accMet2(accMetOut[18][(size-1)+4:0]), .accMetOut(accMetOut[11][(size-1)+4:0]), .selOut(sel[11]), .shiftIn(shiftIn), .shiftOut(s11));
   acs acs12 (.clk(clk), .reset(acsReset), .symEn(symEn), .matFilt1(out1Pt6Real ),  .matFilt2(out0Pt20Real),  .accMet1(accMetOut[5][(size-1)+4:0] ), .accMet2(accMetOut[19][(size-1)+4:0]), .accMetOut(accMetOut[12][(size-1)+4:0]), .selOut(sel[12]), .shiftIn(shiftIn), .shiftOut(s12));
   acs acs13 (.clk(clk), .reset(acsReset), .symEn(symEn), .matFilt1(out1Pt7Real ),  .matFilt2(out0Pt1Real ),  .accMet1(accMetOut[6][(size-1)+4:0] ), .accMet2(accMetOut[0 ][(size-1)+4:0]), .accMetOut(accMetOut[13][(size-1)+4:0]), .selOut(sel[13]), .shiftIn(shiftIn), .shiftOut(s13));
   acs acs14 (.clk(clk), .reset(acsReset), .symEn(symEn), .matFilt1(out1Pt8Real ),  .matFilt2(out0Pt2Real ),  .accMet1(accMetOut[7][(size-1)+4:0] ), .accMet2(accMetOut[1 ][(size-1)+4:0]), .accMetOut(accMetOut[14][(size-1)+4:0]), .selOut(sel[14]), .shiftIn(shiftIn), .shiftOut(s14));
   acs acs15 (.clk(clk), .reset(acsReset), .symEn(symEn), .matFilt1(out1Pt9Real ),  .matFilt2(out0Pt3Real ),  .accMet1(accMetOut[8][(size-1)+4:0] ), .accMet2(accMetOut[2 ][(size-1)+4:0]), .accMetOut(accMetOut[15][(size-1)+4:0]), .selOut(sel[15]), .shiftIn(shiftIn), .shiftOut(s15));
   acs acs16 (.clk(clk), .reset(acsReset), .symEn(symEn), .matFilt1(out1Pt10Real),  .matFilt2(out0Pt4Real ),  .accMet1(accMetOut[9][(size-1)+4:0] ), .accMet2(accMetOut[3 ][(size-1)+4:0]), .accMetOut(accMetOut[16][(size-1)+4:0]), .selOut(sel[16]), .shiftIn(shiftIn), .shiftOut(s16));
   acs acs17 (.clk(clk), .reset(acsReset), .symEn(symEn), .matFilt1(out1Pt11Real),  .matFilt2(out0Pt5Real ),  .accMet1(accMetOut[10][(size-1)+4:0]), .accMet2(accMetOut[4 ][(size-1)+4:0]), .accMetOut(accMetOut[17][(size-1)+4:0]), .selOut(sel[17]), .shiftIn(shiftIn), .shiftOut(s17));
   acs acs18 (.clk(clk), .reset(acsReset), .symEn(symEn), .matFilt1(out1Pt12Real),  .matFilt2(out0Pt6Real ),  .accMet1(accMetOut[11][(size-1)+4:0]), .accMet2(accMetOut[5 ][(size-1)+4:0]), .accMetOut(accMetOut[18][(size-1)+4:0]), .selOut(sel[18]), .shiftIn(shiftIn), .shiftOut(s18));
   acs acs19 (.clk(clk), .reset(acsReset), .symEn(symEn), .matFilt1(out1Pt13Real),  .matFilt2(out0Pt7Real ),  .accMet1(accMetOut[12][(size-1)+4:0]), .accMet2(accMetOut[6 ][(size-1)+4:0]), .accMetOut(accMetOut[19][(size-1)+4:0]), .selOut(sel[19]), .shiftIn(shiftIn), .shiftOut(s19));
   acs acs0  (.clk(clk), .reset(acsReset), .symEn(symEn), .matFilt1(out1Pt14Real),  .matFilt2(out0Pt8Real ),  .accMet1(accMetOut[13][(size-1)+4:0]), .accMet2(accMetOut[7 ][(size-1)+4:0]), .accMetOut(accMetOut[0][(size-1)+4:0] ), .selOut(sel[0 ]), .shiftIn(shiftIn), .shiftOut(s0 ));
   acs acs1  (.clk(clk), .reset(acsReset), .symEn(symEn), .matFilt1(out1Pt15Real),  .matFilt2(out0Pt9Real ),  .accMet1(accMetOut[14][(size-1)+4:0]), .accMet2(accMetOut[8 ][(size-1)+4:0]), .accMetOut(accMetOut[1][(size-1)+4:0] ), .selOut(sel[1 ]), .shiftIn(shiftIn), .shiftOut(s1 ));
   acs acs2  (.clk(clk), .reset(acsReset), .symEn(symEn), .matFilt1(out1Pt16Real),  .matFilt2(out0Pt10Real),  .accMet1(accMetOut[15][(size-1)+4:0]), .accMet2(accMetOut[9 ][(size-1)+4:0]), .accMetOut(accMetOut[2][(size-1)+4:0] ), .selOut(sel[2 ]), .shiftIn(shiftIn), .shiftOut(s2 ));
   acs acs3  (.clk(clk), .reset(acsReset), .symEn(symEn), .matFilt1(out1Pt17Real),  .matFilt2(out0Pt11Real),  .accMet1(accMetOut[16][(size-1)+4:0]), .accMet2(accMetOut[10][(size-1)+4:0]), .accMetOut(accMetOut[3][(size-1)+4:0] ), .selOut(sel[3 ]), .shiftIn(shiftIn), .shiftOut(s3 ));
   acs acs4  (.clk(clk), .reset(acsReset), .symEn(symEn), .matFilt1(out1Pt18Real),  .matFilt2(out0Pt12Real),  .accMet1(accMetOut[17][(size-1)+4:0]), .accMet2(accMetOut[11][(size-1)+4:0]), .accMetOut(accMetOut[4][(size-1)+4:0] ), .selOut(sel[4 ]), .shiftIn(shiftIn), .shiftOut(s4 ));
   acs acs5  (.clk(clk), .reset(acsReset), .symEn(symEn), .matFilt1(out1Pt19Real),  .matFilt2(out0Pt13Real),  .accMet1(accMetOut[18][(size-1)+4:0]), .accMet2(accMetOut[12][(size-1)+4:0]), .accMetOut(accMetOut[5][(size-1)+4:0] ), .selOut(sel[5 ]), .shiftIn(shiftIn), .shiftOut(s5 ));
   acs acs6  (.clk(clk), .reset(acsReset), .symEn(symEn), .matFilt1(out1Pt20Real),  .matFilt2(out0Pt14Real),  .accMet1(accMetOut[19][(size-1)+4:0]), .accMet2(accMetOut[13][(size-1)+4:0]), .accMetOut(accMetOut[6][(size-1)+4:0] ), .selOut(sel[6 ]), .shiftIn(shiftIn), .shiftOut(s6 ));
`else
   acs #(size) acs7  (clk, acsReset, symEn, out1Pt1Real,  out0Pt15Real,  accMetOut[0][(size-1)+4:0],  accMetOut[14][(size-1)+4:0], accMetOut[7][(size-1)+4:0],  sel[7 ], shiftIn, s7);
   acs #(size) acs8  (clk, acsReset, symEn, out1Pt2Real,  out0Pt16Real,  accMetOut[1][(size-1)+4:0],  accMetOut[15][(size-1)+4:0], accMetOut[8][(size-1)+4:0],  sel[8 ], shiftIn, s8);
   acs #(size) acs9  (clk, acsReset, symEn, out1Pt3Real,  out0Pt17Real,  accMetOut[2][(size-1)+4:0],  accMetOut[16][(size-1)+4:0], accMetOut[9][(size-1)+4:0],  sel[9 ], shiftIn, s9);
   acs #(size) acs10 (clk, acsReset, symEn, out1Pt4Real,  out0Pt18Real,  accMetOut[3][(size-1)+4:0],  accMetOut[17][(size-1)+4:0], accMetOut[10][(size-1)+4:0], sel[10], shiftIn, s10);
   acs #(size) acs11 (clk, acsReset, symEn, out1Pt5Real,  out0Pt19Real,  accMetOut[4][(size-1)+4:0],  accMetOut[18][(size-1)+4:0], accMetOut[11][(size-1)+4:0], sel[11], shiftIn, s11);
   acs #(size) acs12 (clk, acsReset, symEn, out1Pt6Real,  out0Pt20Real,  accMetOut[5][(size-1)+4:0],  accMetOut[19][(size-1)+4:0], accMetOut[12][(size-1)+4:0], sel[12], shiftIn, s12);
   acs #(size) acs13 (clk, acsReset, symEn, out1Pt7Real,   out0Pt1Real,  accMetOut[6][(size-1)+4:0],  accMetOut[0 ][(size-1)+4:0], accMetOut[13][(size-1)+4:0], sel[13], shiftIn, s13);
   acs #(size) acs14 (clk, acsReset, symEn, out1Pt8Real,   out0Pt2Real,  accMetOut[7][(size-1)+4:0],  accMetOut[1 ][(size-1)+4:0], accMetOut[14][(size-1)+4:0], sel[14], shiftIn, s14);
   acs #(size) acs15 (clk, acsReset, symEn, out1Pt9Real,   out0Pt3Real,  accMetOut[8][(size-1)+4:0],  accMetOut[2 ][(size-1)+4:0], accMetOut[15][(size-1)+4:0], sel[15], shiftIn, s15);
   acs #(size) acs16 (clk, acsReset, symEn, out1Pt10Real,  out0Pt4Real,  accMetOut[9][(size-1)+4:0],  accMetOut[3 ][(size-1)+4:0], accMetOut[16][(size-1)+4:0], sel[16], shiftIn, s16);
   acs #(size) acs17 (clk, acsReset, symEn, out1Pt11Real,  out0Pt5Real,  accMetOut[10][(size-1)+4:0], accMetOut[4 ][(size-1)+4:0], accMetOut[17][(size-1)+4:0], sel[17], shiftIn, s17);
   acs #(size) acs18 (clk, acsReset, symEn, out1Pt12Real,  out0Pt6Real,  accMetOut[11][(size-1)+4:0], accMetOut[5 ][(size-1)+4:0], accMetOut[18][(size-1)+4:0], sel[18], shiftIn, s18);
   acs #(size) acs19 (clk, acsReset, symEn, out1Pt13Real,  out0Pt7Real,  accMetOut[12][(size-1)+4:0], accMetOut[6 ][(size-1)+4:0], accMetOut[19][(size-1)+4:0], sel[19], shiftIn, s19);
   acs #(size) acs0  (clk, acsReset, symEn, out1Pt14Real,  out0Pt8Real,  accMetOut[13][(size-1)+4:0], accMetOut[7 ][(size-1)+4:0], accMetOut[0][(size-1)+4:0],  sel[0 ], shiftIn, s0);
   acs #(size) acs1  (clk, acsReset, symEn, out1Pt15Real,  out0Pt9Real,  accMetOut[14][(size-1)+4:0], accMetOut[8 ][(size-1)+4:0], accMetOut[1][(size-1)+4:0],  sel[1 ], shiftIn, s1);
   acs #(size) acs2  (clk, acsReset, symEn, out1Pt16Real, out0Pt10Real,  accMetOut[15][(size-1)+4:0], accMetOut[9 ][(size-1)+4:0], accMetOut[2][(size-1)+4:0],  sel[2 ], shiftIn, s2);
   acs #(size) acs3  (clk, acsReset, symEn, out1Pt17Real, out0Pt11Real,  accMetOut[16][(size-1)+4:0], accMetOut[10][(size-1)+4:0], accMetOut[3][(size-1)+4:0],  sel[3 ], shiftIn, s3);
   acs #(size) acs4  (clk, acsReset, symEn, out1Pt18Real, out0Pt12Real,  accMetOut[17][(size-1)+4:0], accMetOut[11][(size-1)+4:0], accMetOut[4][(size-1)+4:0],  sel[4 ], shiftIn, s4);
   acs #(size) acs5  (clk, acsReset, symEn, out1Pt19Real, out0Pt13Real,  accMetOut[18][(size-1)+4:0], accMetOut[12][(size-1)+4:0], accMetOut[5][(size-1)+4:0],  sel[5 ], shiftIn, s5);
   acs #(size) acs6  (clk, acsReset, symEn, out1Pt20Real, out0Pt14Real,  accMetOut[19][(size-1)+4:0], accMetOut[13][(size-1)+4:0], accMetOut[6][(size-1)+4:0],  sel[6 ], shiftIn, s6);
`endif

`ifdef MAX_ANNOTATE
   maxMetric maxMetric (
        .clk(clk), 
        .reset(reset), 
        .symEn(symEn), 
        .accMetOut0(accMetOut[0 ]), .accMetOut1(accMetOut[1 ]), 
        .accMetOut2(accMetOut[2 ]), .accMetOut3(accMetOut[3 ]), 
        .accMetOut4(accMetOut[4 ]), .accMetOut5(accMetOut[5 ]), 
        .accMetOut6(accMetOut[6 ]), .accMetOut7(accMetOut[7 ]), 
        .accMetOut8(accMetOut[8 ]), .accMetOut9(accMetOut[9 ]), 
        .accMetOut10(accMetOut[10]), .accMetOut11(accMetOut[11]), 
        .accMetOut12(accMetOut[12]), .accMetOut13(accMetOut[13]), 
        .accMetOut14(accMetOut[14]), .accMetOut15(accMetOut[15]), 
        .accMetOut16(accMetOut[16]), .accMetOut17(accMetOut[17]), 
        .accMetOut18(accMetOut[18]), .accMetOut19(accMetOut[19]),
        .index(index), .symEnDly(symEn_maxMetDly)
        );
`else                                                                                            
   maxMetric #(size) maxMetric (clk, reset, symEn,
                                accMetOut[0 ], accMetOut[1 ], accMetOut[2 ], accMetOut[3 ], accMetOut[4 ], 
                                accMetOut[5 ], accMetOut[6 ], accMetOut[7 ], accMetOut[8 ], accMetOut[9 ], 
                                accMetOut[10], accMetOut[11], accMetOut[12], accMetOut[13], accMetOut[14], 
                                accMetOut[15], accMetOut[16], accMetOut[17], accMetOut[18], accMetOut[19],
                                index, symEn_maxMetDly
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

/* -----\/----- EXCLUDED -----\/-----
   traceBackTable #(size) tbt0
     (
      .clk(clk), 
      .reset(reset), 
      .symEn(symEn_maxMetDly),
      .sel(sel), 
      .index(index),
      .decision(decision0),
      .oneOrZeroPredecessor(),
      .symEnDly(symEn_tbtDly),
      );
 -----/\----- EXCLUDED -----/\----- */
`ifdef TB_ANNOTATE
   traceBackTable tbt1
     (
      .clk(clk), 
      .reset(reset), 
      .symEn(symEn_maxMetDly),
      //.sel(sel_1dly), 
        .sel(sel_2dly), 
      .index(index),
//      .decision(decision1),
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
      //.sel(sel_1dly), 
        .sel(sel_2dly), 
      .index(index),
//      .decision(decision1),
      .decision(tbDecision),
      .oneOrZeroPredecessor(),
      .symEnDly(symEn_tbtDly)
      );
`endif
/* -----\/----- EXCLUDED -----\/-----
   traceBackTable #(size) tbt2
     (
      .clk(clk), 
      .reset(reset), 
      .symEn(symEn_maxMetDly),
      .sel(sel_2dly), 
      .index(index),
      .decision(decision2),
      .oneOrZeroPredecessor(),
      .symEnDly(symEn_tbtDly),
      );
   traceBackTable #(size) tbt3
     (
      .clk(clk), 
      .reset(reset), 
      .symEn(symEn_maxMetDly),
      .sel(sel_3dly), 
      .index(index),
      .decision(decision),
      .oneOrZeroPredecessor(),
      .symEnDly(symEn_tbtDly),
      );
 -----/\----- EXCLUDED -----/\----- */

      
   always @(posedge clk)
     begin
          if (symEn) begin
             out0Pt1Imag_1dly  <= out0Pt1Imag ;   out1Pt1Imag_1dly  <= out1Pt1Imag ;
             out0Pt2Imag_1dly  <= out0Pt2Imag ;   out1Pt2Imag_1dly  <= out1Pt2Imag ;
             out0Pt3Imag_1dly  <= out0Pt3Imag ;   out1Pt3Imag_1dly  <= out1Pt3Imag ;
             out0Pt4Imag_1dly  <= out0Pt4Imag ;   out1Pt4Imag_1dly  <= out1Pt4Imag ;
             out0Pt5Imag_1dly  <= out0Pt5Imag ;   out1Pt5Imag_1dly  <= out1Pt5Imag ;
             out0Pt6Imag_1dly  <= out0Pt6Imag ;   out1Pt6Imag_1dly  <= out1Pt6Imag ;
             out0Pt7Imag_1dly  <= out0Pt7Imag ;   out1Pt7Imag_1dly  <= out1Pt7Imag ;
             out0Pt8Imag_1dly  <= out0Pt8Imag ;   out1Pt8Imag_1dly  <= out1Pt8Imag ;
             out0Pt9Imag_1dly  <= out0Pt9Imag ;   out1Pt9Imag_1dly  <= out1Pt9Imag ;
             out0Pt10Imag_1dly <= out0Pt10Imag;   out1Pt10Imag_1dly <= out1Pt10Imag;
             out0Pt11Imag_1dly <= out0Pt11Imag;   out1Pt11Imag_1dly <= out1Pt11Imag;
             out0Pt12Imag_1dly <= out0Pt12Imag;   out1Pt12Imag_1dly <= out1Pt12Imag;
             out0Pt13Imag_1dly <= out0Pt13Imag;   out1Pt13Imag_1dly <= out1Pt13Imag;
             out0Pt14Imag_1dly <= out0Pt14Imag;   out1Pt14Imag_1dly <= out1Pt14Imag;
             out0Pt15Imag_1dly <= out0Pt15Imag;   out1Pt15Imag_1dly <= out1Pt15Imag;
             out0Pt16Imag_1dly <= out0Pt16Imag;   out1Pt16Imag_1dly <= out1Pt16Imag;
             out0Pt17Imag_1dly <= out0Pt17Imag;   out1Pt17Imag_1dly <= out1Pt17Imag;
             out0Pt18Imag_1dly <= out0Pt18Imag;   out1Pt18Imag_1dly <= out1Pt18Imag;
             out0Pt19Imag_1dly <= out0Pt19Imag;   out1Pt19Imag_1dly <= out1Pt19Imag;
             out0Pt20Imag_1dly <= out0Pt20Imag;   out1Pt20Imag_1dly <= out1Pt20Imag;
          end
     end

   always @(posedge clk)
     begin
          if (symEn) begin
             out0Pt1Imag_2dly  <= out0Pt1Imag_1dly ;   out1Pt1Imag_2dly  <= out1Pt1Imag_1dly ;
             out0Pt2Imag_2dly  <= out0Pt2Imag_1dly ;   out1Pt2Imag_2dly  <= out1Pt2Imag_1dly ;
             out0Pt3Imag_2dly  <= out0Pt3Imag_1dly ;   out1Pt3Imag_2dly  <= out1Pt3Imag_1dly ;
             out0Pt4Imag_2dly  <= out0Pt4Imag_1dly ;   out1Pt4Imag_2dly  <= out1Pt4Imag_1dly ;
             out0Pt5Imag_2dly  <= out0Pt5Imag_1dly ;   out1Pt5Imag_2dly  <= out1Pt5Imag_1dly ;
             out0Pt6Imag_2dly  <= out0Pt6Imag_1dly ;   out1Pt6Imag_2dly  <= out1Pt6Imag_1dly ;
             out0Pt7Imag_2dly  <= out0Pt7Imag_1dly ;   out1Pt7Imag_2dly  <= out1Pt7Imag_1dly ;
             out0Pt8Imag_2dly  <= out0Pt8Imag_1dly ;   out1Pt8Imag_2dly  <= out1Pt8Imag_1dly ;
             out0Pt9Imag_2dly  <= out0Pt9Imag_1dly ;   out1Pt9Imag_2dly  <= out1Pt9Imag_1dly ;
             out0Pt10Imag_2dly <= out0Pt10Imag_1dly;   out1Pt10Imag_2dly <= out1Pt10Imag_1dly;
             out0Pt11Imag_2dly <= out0Pt11Imag_1dly;   out1Pt11Imag_2dly <= out1Pt11Imag_1dly;
             out0Pt12Imag_2dly <= out0Pt12Imag_1dly;   out1Pt12Imag_2dly <= out1Pt12Imag_1dly;
             out0Pt13Imag_2dly <= out0Pt13Imag_1dly;   out1Pt13Imag_2dly <= out1Pt13Imag_1dly;
             out0Pt14Imag_2dly <= out0Pt14Imag_1dly;   out1Pt14Imag_2dly <= out1Pt14Imag_1dly;
             out0Pt15Imag_2dly <= out0Pt15Imag_1dly;   out1Pt15Imag_2dly <= out1Pt15Imag_1dly;
             out0Pt16Imag_2dly <= out0Pt16Imag_1dly;   out1Pt16Imag_2dly <= out1Pt16Imag_1dly;
             out0Pt17Imag_2dly <= out0Pt17Imag_1dly;   out1Pt17Imag_2dly <= out1Pt17Imag_1dly;
             out0Pt18Imag_2dly <= out0Pt18Imag_1dly;   out1Pt18Imag_2dly <= out1Pt18Imag_1dly;
             out0Pt19Imag_2dly <= out0Pt19Imag_1dly;   out1Pt19Imag_2dly <= out1Pt19Imag_1dly;
             out0Pt20Imag_2dly <= out0Pt20Imag_1dly;   out1Pt20Imag_2dly <= out1Pt20Imag_1dly;
          end
     end
   
   always @(posedge clk)
     begin
          if (symEn) begin
             out0Pt1Imag_3dly  <= out0Pt1Imag_2dly ;   out1Pt1Imag_3dly  <= out1Pt1Imag_2dly ;
             out0Pt2Imag_3dly  <= out0Pt2Imag_2dly ;   out1Pt2Imag_3dly  <= out1Pt2Imag_2dly ;
             out0Pt3Imag_3dly  <= out0Pt3Imag_2dly ;   out1Pt3Imag_3dly  <= out1Pt3Imag_2dly ;
             out0Pt4Imag_3dly  <= out0Pt4Imag_2dly ;   out1Pt4Imag_3dly  <= out1Pt4Imag_2dly ;
             out0Pt5Imag_3dly  <= out0Pt5Imag_2dly ;   out1Pt5Imag_3dly  <= out1Pt5Imag_2dly ;
             out0Pt6Imag_3dly  <= out0Pt6Imag_2dly ;   out1Pt6Imag_3dly  <= out1Pt6Imag_2dly ;
             out0Pt7Imag_3dly  <= out0Pt7Imag_2dly ;   out1Pt7Imag_3dly  <= out1Pt7Imag_2dly ;
             out0Pt8Imag_3dly  <= out0Pt8Imag_2dly ;   out1Pt8Imag_3dly  <= out1Pt8Imag_2dly ;
             out0Pt9Imag_3dly  <= out0Pt9Imag_2dly ;   out1Pt9Imag_3dly  <= out1Pt9Imag_2dly ;
             out0Pt10Imag_3dly <= out0Pt10Imag_2dly;   out1Pt10Imag_3dly <= out1Pt10Imag_2dly;
             out0Pt11Imag_3dly <= out0Pt11Imag_2dly;   out1Pt11Imag_3dly <= out1Pt11Imag_2dly;
             out0Pt12Imag_3dly <= out0Pt12Imag_2dly;   out1Pt12Imag_3dly <= out1Pt12Imag_2dly;
             out0Pt13Imag_3dly <= out0Pt13Imag_2dly;   out1Pt13Imag_3dly <= out1Pt13Imag_2dly;
             out0Pt14Imag_3dly <= out0Pt14Imag_2dly;   out1Pt14Imag_3dly <= out1Pt14Imag_2dly;
             out0Pt15Imag_3dly <= out0Pt15Imag_2dly;   out1Pt15Imag_3dly <= out1Pt15Imag_2dly;
             out0Pt16Imag_3dly <= out0Pt16Imag_2dly;   out1Pt16Imag_3dly <= out1Pt16Imag_2dly;
             out0Pt17Imag_3dly <= out0Pt17Imag_2dly;   out1Pt17Imag_3dly <= out1Pt17Imag_2dly;
             out0Pt18Imag_3dly <= out0Pt18Imag_2dly;   out1Pt18Imag_3dly <= out1Pt18Imag_2dly;
             out0Pt19Imag_3dly <= out0Pt19Imag_2dly;   out1Pt19Imag_3dly <= out1Pt19Imag_2dly;
             out0Pt20Imag_3dly <= out0Pt20Imag_2dly;   out1Pt20Imag_3dly <= out1Pt20Imag_2dly;
          end
     end

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
   
   //wire oneOrZeroPredecessor = sel_1dly[index];
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
         
   //reg oneOrZeroPredecessor_1d;
 
      
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
               0 : if (oneOrZeroPredecessor==0) phaseError <= out0Pt1Imag_3dly ;
                   else                         phaseError <= out1Pt1Imag_3dly ;
               2 : if (oneOrZeroPredecessor==0) phaseError <= out0Pt3Imag_3dly ;
                   else                         phaseError <= out1Pt3Imag_3dly ;
               4 : if (oneOrZeroPredecessor==0) phaseError <= out0Pt5Imag_3dly ;
                   else                         phaseError <= out1Pt5Imag_3dly ; 
               6 : if (oneOrZeroPredecessor==0) phaseError <= out0Pt7Imag_3dly ;
                   else                         phaseError <= out1Pt7Imag_3dly ; 
               8 : if (oneOrZeroPredecessor==0) phaseError <= out0Pt9Imag_3dly ;
                   else                         phaseError <= out1Pt9Imag_3dly ;
               10: if (oneOrZeroPredecessor==0) phaseError <= out0Pt11Imag_3dly;
                   else                         phaseError <= out1Pt11Imag_3dly;
               12: if (oneOrZeroPredecessor==0) phaseError <= out0Pt13Imag_3dly;
                   else                         phaseError <= out1Pt13Imag_3dly;
               14: if (oneOrZeroPredecessor==0) phaseError <= out0Pt15Imag_3dly;
                   else                         phaseError <= out1Pt15Imag_3dly;
               16: if (oneOrZeroPredecessor==0) phaseError <= out0Pt17Imag_3dly;
                   else                         phaseError <= out1Pt17Imag_3dly;
               18: if (oneOrZeroPredecessor==0) phaseError <= out0Pt19Imag_3dly;
                   else                         phaseError <= out1Pt19Imag_3dly;
               `ifdef USE_ODDS
               1 : if (oneOrZeroPredecessor==0) phaseError <= out0Pt2Imag_3dly ;
                   else                         phaseError <= out1Pt2Imag_3dly ;
               3 : if (oneOrZeroPredecessor==0) phaseError <= out0Pt4Imag_3dly ;
                   else                         phaseError <= out1Pt4Imag_3dly ;  
               5 : if (oneOrZeroPredecessor==0) phaseError <= out0Pt6Imag_3dly ;
                   else                         phaseError <= out1Pt6Imag_3dly ; 
               7 : if (oneOrZeroPredecessor==0) phaseError <= out0Pt8Imag_3dly ;
                   else                         phaseError <= out1Pt8Imag_3dly ; 
               9 : if (oneOrZeroPredecessor==0) phaseError <= out0Pt10Imag_3dly;
                   else                         phaseError <= out1Pt10Imag_3dly;  
               11: if (oneOrZeroPredecessor==0) phaseError <= out0Pt12Imag_3dly;
                   else                         phaseError <= out1Pt12Imag_3dly;
               13: if (oneOrZeroPredecessor==0) phaseError <= out0Pt14Imag_3dly;
                   else                         phaseError <= out1Pt14Imag_3dly;
               15: if (oneOrZeroPredecessor==0) phaseError <= out0Pt16Imag_3dly;
                   else                         phaseError <= out1Pt16Imag_3dly;
               17: if (oneOrZeroPredecessor==0) phaseError <= out0Pt18Imag_3dly;
                   else                         phaseError <= out1Pt18Imag_3dly;
               19: if (oneOrZeroPredecessor==0) phaseError <= out0Pt20Imag_3dly;
                   else                         phaseError <= out1Pt20Imag_3dly;
               `endif
               default: phaseError <= 0;
             endcase
             case ( {index_1d[4:1], 1'b0} ) // selecting only the even imaginary parts
               0 : if (oneOrZeroPredecessor==0) devError <= out0Pt1Imag_3dly ;
                   else                         devError <= -out1Pt1Imag_3dly ;
               2 : if (oneOrZeroPredecessor==0) devError <= out0Pt3Imag_3dly ;
                   else                         devError <= -out1Pt3Imag_3dly ;
               4 : if (oneOrZeroPredecessor==0) devError <= out0Pt5Imag_3dly ;
                   else                         devError <= -out1Pt5Imag_3dly ; 
               6 : if (oneOrZeroPredecessor==0) devError <= out0Pt7Imag_3dly ;
                   else                         devError <= -out1Pt7Imag_3dly ; 
               8 : if (oneOrZeroPredecessor==0) devError <= out0Pt9Imag_3dly ;
                   else                         devError <= -out1Pt9Imag_3dly ;
               10: if (oneOrZeroPredecessor==0) devError <= out0Pt11Imag_3dly;
                   else                         devError <= -out1Pt11Imag_3dly;
               12: if (oneOrZeroPredecessor==0) devError <= out0Pt13Imag_3dly;
                   else                         devError <= -out1Pt13Imag_3dly;
               14: if (oneOrZeroPredecessor==0) devError <= out0Pt15Imag_3dly;
                   else                         devError <= -out1Pt15Imag_3dly;
               16: if (oneOrZeroPredecessor==0) devError <= out0Pt17Imag_3dly;
                   else                         devError <= -out1Pt17Imag_3dly;
               18: if (oneOrZeroPredecessor==0) devError <= out0Pt19Imag_3dly;
                   else                         devError <= -out1Pt19Imag_3dly;
               `ifdef USE_ODDS
               1 : if (oneOrZeroPredecessor==0) devError <= out0Pt2Imag_3dly ;
                   else                         devError <= -out1Pt2Imag_3dly ;
               3 : if (oneOrZeroPredecessor==0) devError <= out0Pt4Imag_3dly ;
                   else                         devError <= -out1Pt4Imag_3dly ;  
               5 : if (oneOrZeroPredecessor==0) devError <= out0Pt6Imag_3dly ;
                   else                         devError <= -out1Pt6Imag_3dly ; 
               7 : if (oneOrZeroPredecessor==0) devError <= out0Pt8Imag_3dly ;
                   else                         devError <= -out1Pt8Imag_3dly ; 
               9 : if (oneOrZeroPredecessor==0) devError <= out0Pt10Imag_3dly;
                   else                         devError <= -out1Pt10Imag_3dly;  
               11: if (oneOrZeroPredecessor==0) devError <= out0Pt12Imag_3dly;
                   else                         devError <= -out1Pt12Imag_3dly;
               13: if (oneOrZeroPredecessor==0) devError <= out0Pt14Imag_3dly;
                   else                         devError <= -out1Pt14Imag_3dly;
               15: if (oneOrZeroPredecessor==0) devError <= out0Pt16Imag_3dly;
                   else                         devError <= -out1Pt16Imag_3dly;
               17: if (oneOrZeroPredecessor==0) devError <= out0Pt18Imag_3dly;
                   else                         devError <= -out1Pt18Imag_3dly;
               19: if (oneOrZeroPredecessor==0) devError <= out0Pt20Imag_3dly;
                   else                         devError <= -out1Pt20Imag_3dly;
               `endif
               default: devError <= 0;
             endcase
           end
         end     //remove
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


//   reg [0:0] readMemResult[10001:0];

//   $readmemh("c:/projects/semco/hdl/data/noisy_data.txt", data);

         
         
endmodule
