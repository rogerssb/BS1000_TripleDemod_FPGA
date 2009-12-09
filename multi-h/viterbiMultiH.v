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
  
module viterbiMultiH
  (
   clk, reset, symEn, sym2xEn,
   decayFactor,
   mf_p3p3_45Real, mf_p3p1_45Real, mf_p3m1_45Real, mf_p3m3_45Real,
   mf_m3p3_45Real, mf_m3p1_45Real, mf_m3m1_45Real, mf_m3m3_45Real,
   mf_p1p3_45Real, mf_p1p1_45Real, mf_p1m1_45Real, mf_p1m3_45Real,
   mf_m1p3_45Real, mf_m1p1_45Real, mf_m1m1_45Real, mf_m1m3_45Real,
   mf_p3p3_54Real, mf_p3p1_54Real, mf_p3m1_54Real, mf_p3m3_54Real,
   mf_m3p3_54Real, mf_m3p1_54Real, mf_m3m1_54Real, mf_m3m3_54Real,
   mf_p1p3_54Real, mf_p1p1_54Real, mf_p1m1_54Real, mf_p1m3_54Real,
   mf_m1p3_54Real, mf_m1p1_54Real, mf_m1m1_54Real, mf_m1m3_54Real,
   mf_p3p3_45Imag, mf_p3p1_45Imag, mf_p3m1_45Imag, mf_p3m3_45Imag,
   mf_m3p3_45Imag, mf_m3p1_45Imag, mf_m3m1_45Imag, mf_m3m3_45Imag,
   mf_p1p3_45Imag, mf_p1p1_45Imag, mf_p1m1_45Imag, mf_p1m3_45Imag,
   mf_m1p3_45Imag, mf_m1p1_45Imag, mf_m1m1_45Imag, mf_m1m3_45Imag,
   mf_p3p3_54Imag, mf_p3p1_54Imag, mf_p3m1_54Imag, mf_p3m3_54Imag,
   mf_m3p3_54Imag, mf_m3p1_54Imag, mf_m3m1_54Imag, mf_m3m3_54Imag,
   mf_p1p3_54Imag, mf_p1p1_54Imag, mf_p1m1_54Imag, mf_p1m3_54Imag,
   mf_m1p3_54Imag, mf_m1p1_54Imag, mf_m1m1_54Imag, mf_m1m3_54Imag,
   index, decision, 
   phaseError, devError);
   
   parameter             MF_BITS = 10;
   parameter             ACS_BITS = 12;
   input                 clk, reset, symEn, sym2xEn;
   input [7:0]           decayFactor;
   input [MF_BITS-1:0]   mf_p3p3_45Real, mf_p3p1_45Real, mf_p3m1_45Real, mf_p3m3_45Real,
                         mf_m3p3_45Real, mf_m3p1_45Real, mf_m3m1_45Real, mf_m3m3_45Real,
                         mf_p1p3_45Real, mf_p1p1_45Real, mf_p1m1_45Real, mf_p1m3_45Real,
                         mf_m1p3_45Real, mf_m1p1_45Real, mf_m1m1_45Real, mf_m1m3_45Real,
                         mf_p3p3_54Real, mf_p3p1_54Real, mf_p3m1_54Real, mf_p3m3_54Real,
                         mf_m3p3_54Real, mf_m3p1_54Real, mf_m3m1_54Real, mf_m3m3_54Real,
                         mf_p1p3_54Real, mf_p1p1_54Real, mf_p1m1_54Real, mf_p1m3_54Real,
                         mf_m1p3_54Real, mf_m1p1_54Real, mf_m1m1_54Real, mf_m1m3_54Real,
                         mf_p3p3_45Imag, mf_p3p1_45Imag, mf_p3m1_45Imag, mf_p3m3_45Imag,
                         mf_m3p3_45Imag, mf_m3p1_45Imag, mf_m3m1_45Imag, mf_m3m3_45Imag,
                         mf_p1p3_45Imag, mf_p1p1_45Imag, mf_p1m1_45Imag, mf_p1m3_45Imag,
                         mf_m1p3_45Imag, mf_m1p1_45Imag, mf_m1m1_45Imag, mf_m1m3_45Imag,
                         mf_p3p3_54Imag, mf_p3p1_54Imag, mf_p3m1_54Imag, mf_p3m3_54Imag,
                         mf_m3p3_54Imag, mf_m3p1_54Imag, mf_m3m1_54Imag, mf_m3m3_54Imag,
                         mf_p1p3_54Imag, mf_p1p1_54Imag, mf_p1m1_54Imag, mf_p1m3_54Imag,
                         mf_m1p3_54Imag, mf_m1p1_54Imag, mf_m1m1_54Imag, mf_m1m3_54Imag;
   
   output [5:0]          index;
   output [1:0]          decision;
   output [MF_BITS-1:0]  phaseError;
   output [MF_BITS-1:0]  devError;

   wire [ACS_BITS-1:0]   accMetOut0, accMetOut1, accMetOut2, accMetOut3, accMetOut4, accMetOut5, accMetOut6, accMetOut7, 
                         accMetOut8, accMetOut9, accMetOut10, accMetOut11, accMetOut12, accMetOut13, accMetOut14, accMetOut15, 
                         accMetOut16, accMetOut17, accMetOut18, accMetOut19, accMetOut20, accMetOut21, accMetOut22, accMetOut23,
                         accMetOut24, accMetOut25, accMetOut26, accMetOut27, accMetOut28, accMetOut29, accMetOut30, accMetOut31, 
                         accMetOut32, accMetOut33, accMetOut34, accMetOut35, accMetOut36, accMetOut37, accMetOut38, accMetOut39, 
                         accMetOut40, accMetOut41, accMetOut42, accMetOut43, accMetOut44, accMetOut45, accMetOut46, accMetOut47, 
                         accMetOut48, accMetOut49, accMetOut50, accMetOut51, accMetOut52, accMetOut53, accMetOut54, accMetOut55, 
                         accMetOut56, accMetOut57, accMetOut58, accMetOut59, accMetOut60, accMetOut61, accMetOut62, accMetOut63;

   //wire [3:0]            sel;
   reg [MF_BITS-1:0]     phaseError;
   reg [MF_BITS-1:0]     devError;
   
`ifdef SIMULATE
   // in simulation we have to reset the accumulatios when the input data is known.
   // simReset is toggled in the test bench
   reg                   simReset;
   //wire                  acsReset = simReset;
   wire                 acsReset = reset;
`else
   wire                  acsReset = reset;
`endif
      

   wire [4:0]            tilt;
   tilt tiltModule
     (
      .clk   (clk  ), 
      .reset (reset), 
      .symEn (symEn),
      .tilt  (tilt )
      );
   
   // 20 Add Compare Select (acs) units with its decision output (sel0..sel3) 
   wire                  s0, s49, s34, s19, s4, s53, s38, s23, s8, s57, s42, s27, s12, s61, s46, s31,
                         s16, s1, s50, s35, s20, s5, s54, s39, s24, s9, s58, s43, s28, s13, s62, s47,
                         s32, s17, s2, s51, s36, s21, s6, s55, s40, s25, s10, s59, s44, s29, s14, s63,
                         s48, s33, s18, s3, s52, s37, s22, s7, s56, s41, s26, s11, s60, s45, s30, s15;

   // ACS acc. normalization control signal
   wire                  s =  s0 | s49 | s34 | s19 | s4 | s53 | s38 | s23 |
                              s8 | s57 | s42 | s27 | s12 | s61 | s46 | s31 |
                              s16 | s1 | s50 | s35 | s20 | s5 | s54 | s39 |
                              s24 | s9 | s58 | s43 | s28 | s13 | s62 | s47 |
                              s32 | s17 | s2 | s51 | s36 | s21 | s6 | s55 |
                              s40 | s25 | s10 | s59 | s44 | s29 | s14 | s63 |
                              s48 | s33 | s18 | s3 | s52 | s37 | s22 | s7 |
                              s56 | s41 | s26 | s11 | s60 | s45 | s30 | s15;

   
   wire [1:0]            selOut0 , selOut49 , selOut34 , selOut19 , selOut4 , selOut53 , selOut38 , selOut23 , 
                         selOut8 , selOut57 , selOut42 , selOut27 , selOut12 , selOut61 , selOut46 , selOut31 ,
                         selOut16 , selOut1 , selOut50 , selOut35 , selOut20 , selOut5 , selOut54 , selOut39 , 
                         selOut24 , selOut9 , selOut58 , selOut43 , selOut28 , selOut13 , selOut62 , selOut47 , 
                         selOut32 , selOut17 , selOut2 , selOut51 , selOut36 , selOut21 , selOut6 , selOut55 , 
                         selOut40 , selOut25 , selOut10 , selOut59 , selOut44 , selOut29 , selOut14 , selOut63 ,
                         selOut48 , selOut33 , selOut18 , selOut3 , selOut52 , selOut37 , selOut22 , selOut7 ,
                         selOut56 , selOut41 , selOut26 , selOut11 , selOut60 , selOut45 , selOut30 , selOut15;
   wire [MF_BITS-1:0]    iOut0, iOut49, iOut34, iOut19, iOut4, iOut53, iOut38, iOut23,
                         iOut8, iOut57, iOut42, iOut27, iOut12, iOut61, iOut46, iOut31,
                         iOut16, iOut1, iOut50, iOut35, iOut20, iOut5, iOut54, iOut39,
                         iOut24, iOut9, iOut58, iOut43, iOut28, iOut13, iOut62, iOut47,
                         iOut32, iOut17, iOut2, iOut51, iOut36, iOut21, iOut6, iOut55,
                         iOut40, iOut25, iOut10, iOut59, iOut44, iOut29, iOut14, iOut63,
                         iOut48, iOut33, iOut18, iOut3, iOut52, iOut37, iOut22, iOut7,
                         iOut56, iOut41, iOut26, iOut11, iOut60, iOut45, iOut30, iOut15;
   wire [MF_BITS-1:0]    qOut0, qOut49, qOut34, qOut19, qOut4, qOut53, qOut38, qOut23,
                         qOut8, qOut57, qOut42, qOut27, qOut12, qOut61, qOut46, qOut31,
                         qOut16, qOut1, qOut50, qOut35, qOut20, qOut5, qOut54, qOut39,
                         qOut24, qOut9, qOut58, qOut43, qOut28, qOut13, qOut62, qOut47,
                         qOut32, qOut17, qOut2, qOut51, qOut36, qOut21, qOut6, qOut55,
                         qOut40, qOut25, qOut10, qOut59, qOut44, qOut29, qOut14, qOut63,
                         qOut48, qOut33, qOut18, qOut3, qOut52, qOut37, qOut22, qOut7,
                         qOut56, qOut41, qOut26, qOut11, qOut60, qOut45, qOut30, qOut15;
   //         h45 rot para  h54 rot param                                                                            h45 match filters                                                                                           h54 Match filters                                                                                                                                                                                                                                                                                                                            h45 ACC metrics                                                                                            h54 ACC metrics                                                                                                                                                                                            
   acsMultH #(0 ,11, 6, 1,  0 ,12, 8, 4)  acsMultH0    (.clk(clk), .reset(reset), .symEn(symEn), .sym2xEn(sym2xEn), .mfI_45_0(mf_m3m3_54Real), .mfI_45_1(mf_m1m3_54Real), .mfI_45_2(mf_p1m3_54Real), .mfI_45_3(mf_p3m3_54Real), .mfI_54_0(mf_m3m3_45Real), .mfI_54_1(mf_m1m3_45Real), .mfI_54_2(mf_p1m3_45Real), .mfI_54_3(mf_p3m3_45Real), .mfQ_45_0(mf_m3m3_54Imag), .mfQ_45_1(mf_m1m3_54Imag), .mfQ_45_2(mf_p1m3_54Imag), .mfQ_45_3(mf_p3m3_54Imag), .mfQ_54_0(mf_m3m3_45Imag), .mfQ_54_1(mf_m1m3_45Imag), .mfQ_54_2(mf_p1m3_45Imag), .mfQ_54_3(mf_p3m3_45Imag), .tilt(tilt), .accMet_45_0(accMetOut0 ), .accMet_45_1(accMetOut45), .accMet_45_2(accMetOut26), .accMet_45_3(accMetOut7 ), .accMet_54_0(accMetOut0 ), .accMet_54_1(accMetOut49), .accMet_54_2(accMetOut34), .accMet_54_3(accMetOut19), .selOut(selOut0 ), .normalizeIn(s), .normalizeOut(s0 ), .accMetOut(accMetOut0 ), .iOut(iOut0 ), .qOut(qOut0 ));
   acsMultH #(12, 7, 2,13,  12, 8, 4, 0)  acsMultH49   (.clk(clk), .reset(reset), .symEn(symEn), .sym2xEn(sym2xEn), .mfI_45_0(mf_m3m1_54Real), .mfI_45_1(mf_m1m1_54Real), .mfI_45_2(mf_p1m1_54Real), .mfI_45_3(mf_p3m1_54Real), .mfI_54_0(mf_m3m1_45Real), .mfI_54_1(mf_m1m1_45Real), .mfI_54_2(mf_p1m1_45Real), .mfI_54_3(mf_p3m1_45Real), .mfQ_45_0(mf_m3m1_54Imag), .mfQ_45_1(mf_m1m1_54Imag), .mfQ_45_2(mf_p1m1_54Imag), .mfQ_45_3(mf_p3m1_54Imag), .mfQ_54_0(mf_m3m1_45Imag), .mfQ_54_1(mf_m1m1_45Imag), .mfQ_54_2(mf_p1m1_45Imag), .mfQ_54_3(mf_p3m1_45Imag), .tilt(tilt), .accMet_45_0(accMetOut48), .accMet_45_1(accMetOut29), .accMet_45_2(accMetOut10), .accMet_45_3(accMetOut55), .accMet_54_0(accMetOut48), .accMet_54_1(accMetOut33), .accMet_54_2(accMetOut18), .accMet_54_3(accMetOut3 ), .selOut(selOut49), .normalizeIn(s), .normalizeOut(s49), .accMetOut(accMetOut49), .iOut(iOut49), .qOut(qOut49));
   acsMultH #( 8, 3,14, 9,  8 , 4, 0,12)  acsMultH34   (.clk(clk), .reset(reset), .symEn(symEn), .sym2xEn(sym2xEn), .mfI_45_0(mf_m3p1_54Real), .mfI_45_1(mf_m1p1_54Real), .mfI_45_2(mf_p1p1_54Real), .mfI_45_3(mf_p3p1_54Real), .mfI_54_0(mf_m3p1_45Real), .mfI_54_1(mf_m1p1_45Real), .mfI_54_2(mf_p1p1_45Real), .mfI_54_3(mf_p3p1_45Real), .mfQ_45_0(mf_m3p1_54Imag), .mfQ_45_1(mf_m1p1_54Imag), .mfQ_45_2(mf_p1p1_54Imag), .mfQ_45_3(mf_p3p1_54Imag), .mfQ_54_0(mf_m3p1_45Imag), .mfQ_54_1(mf_m1p1_45Imag), .mfQ_54_2(mf_p1p1_45Imag), .mfQ_54_3(mf_p3p1_45Imag), .tilt(tilt), .accMet_45_0(accMetOut32), .accMet_45_1(accMetOut13), .accMet_45_2(accMetOut58), .accMet_45_3(accMetOut39), .accMet_54_0(accMetOut32), .accMet_54_1(accMetOut17), .accMet_54_2(accMetOut2 ), .accMet_54_3(accMetOut51), .selOut(selOut34), .normalizeIn(s), .normalizeOut(s34), .accMetOut(accMetOut34), .iOut(iOut34), .qOut(qOut34));
   acsMultH #( 4,15,10, 5,  4 ,10,12, 8)  acsMultH19   (.clk(clk), .reset(reset), .symEn(symEn), .sym2xEn(sym2xEn), .mfI_45_0(mf_m3p3_54Real), .mfI_45_1(mf_m1p3_54Real), .mfI_45_2(mf_p1p3_54Real), .mfI_45_3(mf_p3p3_54Real), .mfI_54_0(mf_m3p3_45Real), .mfI_54_1(mf_m1p3_45Real), .mfI_54_2(mf_p1p3_45Real), .mfI_54_3(mf_p3p3_45Real), .mfQ_45_0(mf_m3p3_54Imag), .mfQ_45_1(mf_m1p3_54Imag), .mfQ_45_2(mf_p1p3_54Imag), .mfQ_45_3(mf_p3p3_54Imag), .mfQ_54_0(mf_m3p3_45Imag), .mfQ_54_1(mf_m1p3_45Imag), .mfQ_54_2(mf_p1p3_45Imag), .mfQ_54_3(mf_p3p3_45Imag), .tilt(tilt), .accMet_45_0(accMetOut16), .accMet_45_1(accMetOut1 ), .accMet_45_2(accMetOut61), .accMet_45_3(accMetOut42), .accMet_54_0(accMetOut23), .accMet_54_1(accMetOut1 ), .accMet_54_2(accMetOut50), .accMet_54_3(accMetOut35), .selOut(selOut19), .normalizeIn(s), .normalizeOut(s19), .accMetOut(accMetOut19), .iOut(iOut19), .qOut(qOut19));
   acsMultH #( 1,12, 7, 2,  1 ,13, 9, 5)  acsMultH4    (.clk(clk), .reset(reset), .symEn(symEn), .sym2xEn(sym2xEn), .mfI_45_0(mf_m3m3_54Real), .mfI_45_1(mf_m1m3_54Real), .mfI_45_2(mf_p1m3_54Real), .mfI_45_3(mf_p3m3_54Real), .mfI_54_0(mf_m3m3_45Real), .mfI_54_1(mf_m1m3_45Real), .mfI_54_2(mf_p1m3_45Real), .mfI_54_3(mf_p3m3_45Real), .mfQ_45_0(mf_m3m3_54Imag), .mfQ_45_1(mf_m1m3_54Imag), .mfQ_45_2(mf_p1m3_54Imag), .mfQ_45_3(mf_p3m3_54Imag), .mfQ_54_0(mf_m3m3_45Imag), .mfQ_54_1(mf_m1m3_45Imag), .mfQ_54_2(mf_p1m3_45Imag), .mfQ_54_3(mf_p3m3_45Imag), .tilt(tilt), .accMet_45_0(accMetOut4 ), .accMet_45_1(accMetOut49), .accMet_45_2(accMetOut30), .accMet_45_3(accMetOut11), .accMet_54_0(accMetOut4 ), .accMet_54_1(accMetOut53), .accMet_54_2(accMetOut38), .accMet_54_3(accMetOut23), .selOut(selOut4 ), .normalizeIn(s), .normalizeOut(s4 ), .accMetOut(accMetOut4 ), .iOut(iOut4 ), .qOut(qOut4 ));
   acsMultH #(13, 8, 3,14,  13, 9, 5, 1)  acsMultH53   (.clk(clk), .reset(reset), .symEn(symEn), .sym2xEn(sym2xEn), .mfI_45_0(mf_m3m1_54Real), .mfI_45_1(mf_m1m1_54Real), .mfI_45_2(mf_p1m1_54Real), .mfI_45_3(mf_p3m1_54Real), .mfI_54_0(mf_m3m1_45Real), .mfI_54_1(mf_m1m1_45Real), .mfI_54_2(mf_p1m1_45Real), .mfI_54_3(mf_p3m1_45Real), .mfQ_45_0(mf_m3m1_54Imag), .mfQ_45_1(mf_m1m1_54Imag), .mfQ_45_2(mf_p1m1_54Imag), .mfQ_45_3(mf_p3m1_54Imag), .mfQ_54_0(mf_m3m1_45Imag), .mfQ_54_1(mf_m1m1_45Imag), .mfQ_54_2(mf_p1m1_45Imag), .mfQ_54_3(mf_p3m1_45Imag), .tilt(tilt), .accMet_45_0(accMetOut52), .accMet_45_1(accMetOut33), .accMet_45_2(accMetOut14), .accMet_45_3(accMetOut59), .accMet_54_0(accMetOut52), .accMet_54_1(accMetOut37), .accMet_54_2(accMetOut22), .accMet_54_3(accMetOut7 ), .selOut(selOut53), .normalizeIn(s), .normalizeOut(s53), .accMetOut(accMetOut53), .iOut(iOut53), .qOut(qOut53));
   acsMultH #( 9, 4,15,10,   9, 5, 1,13)  acsMultH38   (.clk(clk), .reset(reset), .symEn(symEn), .sym2xEn(sym2xEn), .mfI_45_0(mf_m3p1_54Real), .mfI_45_1(mf_m1p1_54Real), .mfI_45_2(mf_p1p1_54Real), .mfI_45_3(mf_p3p1_54Real), .mfI_54_0(mf_m3p1_45Real), .mfI_54_1(mf_m1p1_45Real), .mfI_54_2(mf_p1p1_45Real), .mfI_54_3(mf_p3p1_45Real), .mfQ_45_0(mf_m3p1_54Imag), .mfQ_45_1(mf_m1p1_54Imag), .mfQ_45_2(mf_p1p1_54Imag), .mfQ_45_3(mf_p3p1_54Imag), .mfQ_54_0(mf_m3p1_45Imag), .mfQ_54_1(mf_m1p1_45Imag), .mfQ_54_2(mf_p1p1_45Imag), .mfQ_54_3(mf_p3p1_45Imag), .tilt(tilt), .accMet_45_0(accMetOut36), .accMet_45_1(accMetOut17), .accMet_45_2(accMetOut62), .accMet_45_3(accMetOut43), .accMet_54_0(accMetOut36), .accMet_54_1(accMetOut21), .accMet_54_2(accMetOut6 ), .accMet_54_3(accMetOut55), .selOut(selOut38), .normalizeIn(s), .normalizeOut(s38), .accMetOut(accMetOut38), .iOut(iOut38), .qOut(qOut38));
   acsMultH #( 5, 0,11, 6,   5, 1,13, 9)  acsMultH23   (.clk(clk), .reset(reset), .symEn(symEn), .sym2xEn(sym2xEn), .mfI_45_0(mf_m3p3_54Real), .mfI_45_1(mf_m1p3_54Real), .mfI_45_2(mf_p1p3_54Real), .mfI_45_3(mf_p3p3_54Real), .mfI_54_0(mf_m3p3_45Real), .mfI_54_1(mf_m1p3_45Real), .mfI_54_2(mf_p1p3_45Real), .mfI_54_3(mf_p3p3_45Real), .mfQ_45_0(mf_m3p3_54Imag), .mfQ_45_1(mf_m1p3_54Imag), .mfQ_45_2(mf_p1p3_54Imag), .mfQ_45_3(mf_p3p3_54Imag), .mfQ_54_0(mf_m3p3_45Imag), .mfQ_54_1(mf_m1p3_45Imag), .mfQ_54_2(mf_p1p3_45Imag), .mfQ_54_3(mf_p3p3_45Imag), .tilt(tilt), .accMet_45_0(accMetOut20), .accMet_45_1(accMetOut1 ), .accMet_45_2(accMetOut46), .accMet_45_3(accMetOut27), .accMet_54_0(accMetOut20), .accMet_54_1(accMetOut5 ), .accMet_54_2(accMetOut54), .accMet_54_3(accMetOut39), .selOut(selOut23), .normalizeIn(s), .normalizeOut(s23), .accMetOut(accMetOut23), .iOut(iOut23), .qOut(qOut23));
   acsMultH #( 2,13, 8, 3,   2,14,10, 6)  acsMultH8    (.clk(clk), .reset(reset), .symEn(symEn), .sym2xEn(sym2xEn), .mfI_45_0(mf_m3m3_54Real), .mfI_45_1(mf_m1m3_54Real), .mfI_45_2(mf_p1m3_54Real), .mfI_45_3(mf_p3m3_54Real), .mfI_54_0(mf_m3m3_45Real), .mfI_54_1(mf_m1m3_45Real), .mfI_54_2(mf_p1m3_45Real), .mfI_54_3(mf_p3m3_45Real), .mfQ_45_0(mf_m3m3_54Imag), .mfQ_45_1(mf_m1m3_54Imag), .mfQ_45_2(mf_p1m3_54Imag), .mfQ_45_3(mf_p3m3_54Imag), .mfQ_54_0(mf_m3m3_45Imag), .mfQ_54_1(mf_m1m3_45Imag), .mfQ_54_2(mf_p1m3_45Imag), .mfQ_54_3(mf_p3m3_45Imag), .tilt(tilt), .accMet_45_0(accMetOut8 ), .accMet_45_1(accMetOut53), .accMet_45_2(accMetOut34), .accMet_45_3(accMetOut15), .accMet_54_0(accMetOut8 ), .accMet_54_1(accMetOut57), .accMet_54_2(accMetOut42), .accMet_54_3(accMetOut27), .selOut(selOut8 ), .normalizeIn(s), .normalizeOut(s8 ), .accMetOut(accMetOut8 ), .iOut(iOut8 ), .qOut(qOut8 ));
   acsMultH #(14, 9, 4,15,  14,10, 6, 2)  acsMultH57   (.clk(clk), .reset(reset), .symEn(symEn), .sym2xEn(sym2xEn), .mfI_45_0(mf_m3m1_54Real), .mfI_45_1(mf_m1m1_54Real), .mfI_45_2(mf_p1m1_54Real), .mfI_45_3(mf_p3m1_54Real), .mfI_54_0(mf_m3m1_45Real), .mfI_54_1(mf_m1m1_45Real), .mfI_54_2(mf_p1m1_45Real), .mfI_54_3(mf_p3m1_45Real), .mfQ_45_0(mf_m3m1_54Imag), .mfQ_45_1(mf_m1m1_54Imag), .mfQ_45_2(mf_p1m1_54Imag), .mfQ_45_3(mf_p3m1_54Imag), .mfQ_54_0(mf_m3m1_45Imag), .mfQ_54_1(mf_m1m1_45Imag), .mfQ_54_2(mf_p1m1_45Imag), .mfQ_54_3(mf_p3m1_45Imag), .tilt(tilt), .accMet_45_0(accMetOut56), .accMet_45_1(accMetOut37), .accMet_45_2(accMetOut18), .accMet_45_3(accMetOut63), .accMet_54_0(accMetOut56), .accMet_54_1(accMetOut41), .accMet_54_2(accMetOut26), .accMet_54_3(accMetOut11), .selOut(selOut57), .normalizeIn(s), .normalizeOut(s57), .accMetOut(accMetOut57), .iOut(iOut57), .qOut(qOut57));
   acsMultH #(10, 5, 0,11,  10, 6, 2,14)  acsMultH42   (.clk(clk), .reset(reset), .symEn(symEn), .sym2xEn(sym2xEn), .mfI_45_0(mf_m3p1_54Real), .mfI_45_1(mf_m1p1_54Real), .mfI_45_2(mf_p1p1_54Real), .mfI_45_3(mf_p3p1_54Real), .mfI_54_0(mf_m3p1_45Real), .mfI_54_1(mf_m1p1_45Real), .mfI_54_2(mf_p1p1_45Real), .mfI_54_3(mf_p3p1_45Real), .mfQ_45_0(mf_m3p1_54Imag), .mfQ_45_1(mf_m1p1_54Imag), .mfQ_45_2(mf_p1p1_54Imag), .mfQ_45_3(mf_p3p1_54Imag), .mfQ_54_0(mf_m3p1_45Imag), .mfQ_54_1(mf_m1p1_45Imag), .mfQ_54_2(mf_p1p1_45Imag), .mfQ_54_3(mf_p3p1_45Imag), .tilt(tilt), .accMet_45_0(accMetOut40), .accMet_45_1(accMetOut21), .accMet_45_2(accMetOut2 ), .accMet_45_3(accMetOut47), .accMet_54_0(accMetOut40), .accMet_54_1(accMetOut25), .accMet_54_2(accMetOut10), .accMet_54_3(accMetOut59), .selOut(selOut42), .normalizeIn(s), .normalizeOut(s42), .accMetOut(accMetOut42), .iOut(iOut42), .qOut(qOut42));
   acsMultH #( 6, 1,12, 7,   6, 2,14,10)  acsMultH27   (.clk(clk), .reset(reset), .symEn(symEn), .sym2xEn(sym2xEn), .mfI_45_0(mf_m3p3_54Real), .mfI_45_1(mf_m1p3_54Real), .mfI_45_2(mf_p1p3_54Real), .mfI_45_3(mf_p3p3_54Real), .mfI_54_0(mf_m3p3_45Real), .mfI_54_1(mf_m1p3_45Real), .mfI_54_2(mf_p1p3_45Real), .mfI_54_3(mf_p3p3_45Real), .mfQ_45_0(mf_m3p3_54Imag), .mfQ_45_1(mf_m1p3_54Imag), .mfQ_45_2(mf_p1p3_54Imag), .mfQ_45_3(mf_p3p3_54Imag), .mfQ_54_0(mf_m3p3_45Imag), .mfQ_54_1(mf_m1p3_45Imag), .mfQ_54_2(mf_p1p3_45Imag), .mfQ_54_3(mf_p3p3_45Imag), .tilt(tilt), .accMet_45_0(accMetOut24), .accMet_45_1(accMetOut5 ), .accMet_45_2(accMetOut50), .accMet_45_3(accMetOut31), .accMet_54_0(accMetOut24), .accMet_54_1(accMetOut9 ), .accMet_54_2(accMetOut58), .accMet_54_3(accMetOut43), .selOut(selOut27), .normalizeIn(s), .normalizeOut(s27), .accMetOut(accMetOut27), .iOut(iOut27), .qOut(qOut27));
   acsMultH #( 3,14, 9, 4,   3,15,11, 7)  acsMultH12   (.clk(clk), .reset(reset), .symEn(symEn), .sym2xEn(sym2xEn), .mfI_45_0(mf_m3m3_54Real), .mfI_45_1(mf_m1m3_54Real), .mfI_45_2(mf_p1m3_54Real), .mfI_45_3(mf_p3m3_54Real), .mfI_54_0(mf_m3m3_45Real), .mfI_54_1(mf_m1m3_45Real), .mfI_54_2(mf_p1m3_45Real), .mfI_54_3(mf_p3m3_45Real), .mfQ_45_0(mf_m3m3_54Imag), .mfQ_45_1(mf_m1m3_54Imag), .mfQ_45_2(mf_p1m3_54Imag), .mfQ_45_3(mf_p3m3_54Imag), .mfQ_54_0(mf_m3m3_45Imag), .mfQ_54_1(mf_m1m3_45Imag), .mfQ_54_2(mf_p1m3_45Imag), .mfQ_54_3(mf_p3m3_45Imag), .tilt(tilt), .accMet_45_0(accMetOut12), .accMet_45_1(accMetOut57), .accMet_45_2(accMetOut38), .accMet_45_3(accMetOut19), .accMet_54_0(accMetOut12), .accMet_54_1(accMetOut61), .accMet_54_2(accMetOut46), .accMet_54_3(accMetOut31), .selOut(selOut12), .normalizeIn(s), .normalizeOut(s12), .accMetOut(accMetOut12), .iOut(iOut12), .qOut(qOut12));
   acsMultH #(15,10, 5, 0,  15,11, 7, 3)  acsMultH61   (.clk(clk), .reset(reset), .symEn(symEn), .sym2xEn(sym2xEn), .mfI_45_0(mf_m3m1_54Real), .mfI_45_1(mf_m1m1_54Real), .mfI_45_2(mf_p1m1_54Real), .mfI_45_3(mf_p3m1_54Real), .mfI_54_0(mf_m3m1_45Real), .mfI_54_1(mf_m1m1_45Real), .mfI_54_2(mf_p1m1_45Real), .mfI_54_3(mf_p3m1_45Real), .mfQ_45_0(mf_m3m1_54Imag), .mfQ_45_1(mf_m1m1_54Imag), .mfQ_45_2(mf_p1m1_54Imag), .mfQ_45_3(mf_p3m1_54Imag), .mfQ_54_0(mf_m3m1_45Imag), .mfQ_54_1(mf_m1m1_45Imag), .mfQ_54_2(mf_p1m1_45Imag), .mfQ_54_3(mf_p3m1_45Imag), .tilt(tilt), .accMet_45_0(accMetOut60), .accMet_45_1(accMetOut41), .accMet_45_2(accMetOut22), .accMet_45_3(accMetOut3 ), .accMet_54_0(accMetOut60), .accMet_54_1(accMetOut45), .accMet_54_2(accMetOut30), .accMet_54_3(accMetOut15), .selOut(selOut61), .normalizeIn(s), .normalizeOut(s61), .accMetOut(accMetOut61), .iOut(iOut61), .qOut(qOut61));
   acsMultH #(11, 6, 1,12,  11, 7, 3,15)  acsMultH46   (.clk(clk), .reset(reset), .symEn(symEn), .sym2xEn(sym2xEn), .mfI_45_0(mf_m3p1_54Real), .mfI_45_1(mf_m1p1_54Real), .mfI_45_2(mf_p1p1_54Real), .mfI_45_3(mf_p3p1_54Real), .mfI_54_0(mf_m3p1_45Real), .mfI_54_1(mf_m1p1_45Real), .mfI_54_2(mf_p1p1_45Real), .mfI_54_3(mf_p3p1_45Real), .mfQ_45_0(mf_m3p1_54Imag), .mfQ_45_1(mf_m1p1_54Imag), .mfQ_45_2(mf_p1p1_54Imag), .mfQ_45_3(mf_p3p1_54Imag), .mfQ_54_0(mf_m3p1_45Imag), .mfQ_54_1(mf_m1p1_45Imag), .mfQ_54_2(mf_p1p1_45Imag), .mfQ_54_3(mf_p3p1_45Imag), .tilt(tilt), .accMet_45_0(accMetOut44), .accMet_45_1(accMetOut25), .accMet_45_2(accMetOut6 ), .accMet_45_3(accMetOut51), .accMet_54_0(accMetOut44), .accMet_54_1(accMetOut29), .accMet_54_2(accMetOut14), .accMet_54_3(accMetOut63), .selOut(selOut46), .normalizeIn(s), .normalizeOut(s46), .accMetOut(accMetOut46), .iOut(iOut46), .qOut(qOut46));
   acsMultH #( 7, 2,13, 8,   7, 3,15,11)  acsMultH31   (.clk(clk), .reset(reset), .symEn(symEn), .sym2xEn(sym2xEn), .mfI_45_0(mf_m3p3_54Real), .mfI_45_1(mf_m1p3_54Real), .mfI_45_2(mf_p1p3_54Real), .mfI_45_3(mf_p3p3_54Real), .mfI_54_0(mf_m3p3_45Real), .mfI_54_1(mf_m1p3_45Real), .mfI_54_2(mf_p1p3_45Real), .mfI_54_3(mf_p3p3_45Real), .mfQ_45_0(mf_m3p3_54Imag), .mfQ_45_1(mf_m1p3_54Imag), .mfQ_45_2(mf_p1p3_54Imag), .mfQ_45_3(mf_p3p3_54Imag), .mfQ_54_0(mf_m3p3_45Imag), .mfQ_54_1(mf_m1p3_45Imag), .mfQ_54_2(mf_p1p3_45Imag), .mfQ_54_3(mf_p3p3_45Imag), .tilt(tilt), .accMet_45_0(accMetOut28), .accMet_45_1(accMetOut9 ), .accMet_45_2(accMetOut54), .accMet_45_3(accMetOut35), .accMet_54_0(accMetOut28), .accMet_54_1(accMetOut13), .accMet_54_2(accMetOut62), .accMet_54_3(accMetOut47), .selOut(selOut31), .normalizeIn(s), .normalizeOut(s31), .accMetOut(accMetOut31), .iOut(iOut31), .qOut(qOut31));
   acsMultH #( 4,15,10, 5,   4, 0,12, 8)  acsMultH16   (.clk(clk), .reset(reset), .symEn(symEn), .sym2xEn(sym2xEn), .mfI_45_0(mf_m3m3_54Real), .mfI_45_1(mf_m1m3_54Real), .mfI_45_2(mf_p1m3_54Real), .mfI_45_3(mf_p3m3_54Real), .mfI_54_0(mf_m3m3_45Real), .mfI_54_1(mf_m1m3_45Real), .mfI_54_2(mf_p1m3_45Real), .mfI_54_3(mf_p3m3_45Real), .mfQ_45_0(mf_m3m3_54Imag), .mfQ_45_1(mf_m1m3_54Imag), .mfQ_45_2(mf_p1m3_54Imag), .mfQ_45_3(mf_p3m3_54Imag), .mfQ_54_0(mf_m3m3_45Imag), .mfQ_54_1(mf_m1m3_45Imag), .mfQ_54_2(mf_p1m3_45Imag), .mfQ_54_3(mf_p3m3_45Imag), .tilt(tilt), .accMet_45_0(accMetOut16), .accMet_45_1(accMetOut61), .accMet_45_2(accMetOut42), .accMet_45_3(accMetOut23), .accMet_54_0(accMetOut16), .accMet_54_1(accMetOut1 ), .accMet_54_2(accMetOut50), .accMet_54_3(accMetOut35), .selOut(selOut16), .normalizeIn(s), .normalizeOut(s16), .accMetOut(accMetOut16), .iOut(iOut16), .qOut(qOut16));
   acsMultH #( 0,11, 6, 1,   0,12, 8, 4)  acsMultH1    (.clk(clk), .reset(reset), .symEn(symEn), .sym2xEn(sym2xEn), .mfI_45_0(mf_m3m1_54Real), .mfI_45_1(mf_m1m1_54Real), .mfI_45_2(mf_p1m1_54Real), .mfI_45_3(mf_p3m1_54Real), .mfI_54_0(mf_m3m1_45Real), .mfI_54_1(mf_m1m1_45Real), .mfI_54_2(mf_p1m1_45Real), .mfI_54_3(mf_p3m1_45Real), .mfQ_45_0(mf_m3m1_54Imag), .mfQ_45_1(mf_m1m1_54Imag), .mfQ_45_2(mf_p1m1_54Imag), .mfQ_45_3(mf_p3m1_54Imag), .mfQ_54_0(mf_m3m1_45Imag), .mfQ_54_1(mf_m1m1_45Imag), .mfQ_54_2(mf_p1m1_45Imag), .mfQ_54_3(mf_p3m1_45Imag), .tilt(tilt), .accMet_45_0(accMetOut0 ), .accMet_45_1(accMetOut45), .accMet_45_2(accMetOut26), .accMet_45_3(accMetOut7 ), .accMet_54_0(accMetOut0 ), .accMet_54_1(accMetOut49), .accMet_54_2(accMetOut34), .accMet_54_3(accMetOut19), .selOut(selOut1 ), .normalizeIn(s), .normalizeOut(s1 ), .accMetOut(accMetOut1 ), .iOut(iOut1 ), .qOut(qOut1 ));
   acsMultH #(12, 7, 2,13,  12, 8, 4, 0)  acsMultH50   (.clk(clk), .reset(reset), .symEn(symEn), .sym2xEn(sym2xEn), .mfI_45_0(mf_m3p1_54Real), .mfI_45_1(mf_m1p1_54Real), .mfI_45_2(mf_p1p1_54Real), .mfI_45_3(mf_p3p1_54Real), .mfI_54_0(mf_m3p1_45Real), .mfI_54_1(mf_m1p1_45Real), .mfI_54_2(mf_p1p1_45Real), .mfI_54_3(mf_p3p1_45Real), .mfQ_45_0(mf_m3p1_54Imag), .mfQ_45_1(mf_m1p1_54Imag), .mfQ_45_2(mf_p1p1_54Imag), .mfQ_45_3(mf_p3p1_54Imag), .mfQ_54_0(mf_m3p1_45Imag), .mfQ_54_1(mf_m1p1_45Imag), .mfQ_54_2(mf_p1p1_45Imag), .mfQ_54_3(mf_p3p1_45Imag), .tilt(tilt), .accMet_45_0(accMetOut48), .accMet_45_1(accMetOut29), .accMet_45_2(accMetOut10), .accMet_45_3(accMetOut55), .accMet_54_0(accMetOut48), .accMet_54_1(accMetOut33), .accMet_54_2(accMetOut18), .accMet_54_3(accMetOut3 ), .selOut(selOut50), .normalizeIn(s), .normalizeOut(s50), .accMetOut(accMetOut50), .iOut(iOut50), .qOut(qOut50));
   acsMultH #( 8, 3,14, 9,   8, 4, 0,12)  acsMultH35   (.clk(clk), .reset(reset), .symEn(symEn), .sym2xEn(sym2xEn), .mfI_45_0(mf_m3p3_54Real), .mfI_45_1(mf_m1p3_54Real), .mfI_45_2(mf_p1p3_54Real), .mfI_45_3(mf_p3p3_54Real), .mfI_54_0(mf_m3p3_45Real), .mfI_54_1(mf_m1p3_45Real), .mfI_54_2(mf_p1p3_45Real), .mfI_54_3(mf_p3p3_45Real), .mfQ_45_0(mf_m3p3_54Imag), .mfQ_45_1(mf_m1p3_54Imag), .mfQ_45_2(mf_p1p3_54Imag), .mfQ_45_3(mf_p3p3_54Imag), .mfQ_54_0(mf_m3p3_45Imag), .mfQ_54_1(mf_m1p3_45Imag), .mfQ_54_2(mf_p1p3_45Imag), .mfQ_54_3(mf_p3p3_45Imag), .tilt(tilt), .accMet_45_0(accMetOut32), .accMet_45_1(accMetOut13), .accMet_45_2(accMetOut58), .accMet_45_3(accMetOut39), .accMet_54_0(accMetOut32), .accMet_54_1(accMetOut17), .accMet_54_2(accMetOut2 ), .accMet_54_3(accMetOut51), .selOut(selOut35), .normalizeIn(s), .normalizeOut(s35), .accMetOut(accMetOut35), .iOut(iOut35), .qOut(qOut35));
   acsMultH #( 5, 0,11, 6,   5, 1,13, 9)  acsMultH20   (.clk(clk), .reset(reset), .symEn(symEn), .sym2xEn(sym2xEn), .mfI_45_0(mf_m3m3_54Real), .mfI_45_1(mf_m1m3_54Real), .mfI_45_2(mf_p1m3_54Real), .mfI_45_3(mf_p3m3_54Real), .mfI_54_0(mf_m3m3_45Real), .mfI_54_1(mf_m1m3_45Real), .mfI_54_2(mf_p1m3_45Real), .mfI_54_3(mf_p3m3_45Real), .mfQ_45_0(mf_m3m3_54Imag), .mfQ_45_1(mf_m1m3_54Imag), .mfQ_45_2(mf_p1m3_54Imag), .mfQ_45_3(mf_p3m3_54Imag), .mfQ_54_0(mf_m3m3_45Imag), .mfQ_54_1(mf_m1m3_45Imag), .mfQ_54_2(mf_p1m3_45Imag), .mfQ_54_3(mf_p3m3_45Imag), .tilt(tilt), .accMet_45_0(accMetOut20), .accMet_45_1(accMetOut1 ), .accMet_45_2(accMetOut46), .accMet_45_3(accMetOut27), .accMet_54_0(accMetOut20), .accMet_54_1(accMetOut5 ), .accMet_54_2(accMetOut54), .accMet_54_3(accMetOut39), .selOut(selOut20), .normalizeIn(s), .normalizeOut(s20), .accMetOut(accMetOut20), .iOut(iOut20), .qOut(qOut20));
   acsMultH #( 1,12, 7, 2,   1,13, 9, 5)  acsMultH5    (.clk(clk), .reset(reset), .symEn(symEn), .sym2xEn(sym2xEn), .mfI_45_0(mf_m3m1_54Real), .mfI_45_1(mf_m1m1_54Real), .mfI_45_2(mf_p1m1_54Real), .mfI_45_3(mf_p3m1_54Real), .mfI_54_0(mf_m3m1_45Real), .mfI_54_1(mf_m1m1_45Real), .mfI_54_2(mf_p1m1_45Real), .mfI_54_3(mf_p3m1_45Real), .mfQ_45_0(mf_m3m1_54Imag), .mfQ_45_1(mf_m1m1_54Imag), .mfQ_45_2(mf_p1m1_54Imag), .mfQ_45_3(mf_p3m1_54Imag), .mfQ_54_0(mf_m3m1_45Imag), .mfQ_54_1(mf_m1m1_45Imag), .mfQ_54_2(mf_p1m1_45Imag), .mfQ_54_3(mf_p3m1_45Imag), .tilt(tilt), .accMet_45_0(accMetOut4 ), .accMet_45_1(accMetOut49), .accMet_45_2(accMetOut30), .accMet_45_3(accMetOut11), .accMet_54_0(accMetOut4 ), .accMet_54_1(accMetOut53), .accMet_54_2(accMetOut38), .accMet_54_3(accMetOut23), .selOut(selOut5 ), .normalizeIn(s), .normalizeOut(s5 ), .accMetOut(accMetOut5 ), .iOut(iOut5 ), .qOut(qOut5 ));
   acsMultH #(13, 8, 3,14,  13, 9, 5, 1)  acsMultH54   (.clk(clk), .reset(reset), .symEn(symEn), .sym2xEn(sym2xEn), .mfI_45_0(mf_m3p1_54Real), .mfI_45_1(mf_m1p1_54Real), .mfI_45_2(mf_p1p1_54Real), .mfI_45_3(mf_p3p1_54Real), .mfI_54_0(mf_m3p1_45Real), .mfI_54_1(mf_m1p1_45Real), .mfI_54_2(mf_p1p1_45Real), .mfI_54_3(mf_p3p1_45Real), .mfQ_45_0(mf_m3p1_54Imag), .mfQ_45_1(mf_m1p1_54Imag), .mfQ_45_2(mf_p1p1_54Imag), .mfQ_45_3(mf_p3p1_54Imag), .mfQ_54_0(mf_m3p1_45Imag), .mfQ_54_1(mf_m1p1_45Imag), .mfQ_54_2(mf_p1p1_45Imag), .mfQ_54_3(mf_p3p1_45Imag), .tilt(tilt), .accMet_45_0(accMetOut52), .accMet_45_1(accMetOut33), .accMet_45_2(accMetOut14), .accMet_45_3(accMetOut59), .accMet_54_0(accMetOut52), .accMet_54_1(accMetOut37), .accMet_54_2(accMetOut22), .accMet_54_3(accMetOut7 ), .selOut(selOut54), .normalizeIn(s), .normalizeOut(s54), .accMetOut(accMetOut54), .iOut(iOut54), .qOut(qOut54));
   acsMultH #( 9, 4,15,10,   9, 5, 1,13)  acsMultH39   (.clk(clk), .reset(reset), .symEn(symEn), .sym2xEn(sym2xEn), .mfI_45_0(mf_m3p3_54Real), .mfI_45_1(mf_m1p3_54Real), .mfI_45_2(mf_p1p3_54Real), .mfI_45_3(mf_p3p3_54Real), .mfI_54_0(mf_m3p3_45Real), .mfI_54_1(mf_m1p3_45Real), .mfI_54_2(mf_p1p3_45Real), .mfI_54_3(mf_p3p3_45Real), .mfQ_45_0(mf_m3p3_54Imag), .mfQ_45_1(mf_m1p3_54Imag), .mfQ_45_2(mf_p1p3_54Imag), .mfQ_45_3(mf_p3p3_54Imag), .mfQ_54_0(mf_m3p3_45Imag), .mfQ_54_1(mf_m1p3_45Imag), .mfQ_54_2(mf_p1p3_45Imag), .mfQ_54_3(mf_p3p3_45Imag), .tilt(tilt), .accMet_45_0(accMetOut36), .accMet_45_1(accMetOut17), .accMet_45_2(accMetOut62), .accMet_45_3(accMetOut43), .accMet_54_0(accMetOut36), .accMet_54_1(accMetOut21), .accMet_54_2(accMetOut6 ), .accMet_54_3(accMetOut55), .selOut(selOut39), .normalizeIn(s), .normalizeOut(s39), .accMetOut(accMetOut39), .iOut(iOut39), .qOut(qOut39));
   acsMultH #( 6, 1,12, 7,   6, 2,14,10)  acsMultH24   (.clk(clk), .reset(reset), .symEn(symEn), .sym2xEn(sym2xEn), .mfI_45_0(mf_m3m3_54Real), .mfI_45_1(mf_m1m3_54Real), .mfI_45_2(mf_p1m3_54Real), .mfI_45_3(mf_p3m3_54Real), .mfI_54_0(mf_m3m3_45Real), .mfI_54_1(mf_m1m3_45Real), .mfI_54_2(mf_p1m3_45Real), .mfI_54_3(mf_p3m3_45Real), .mfQ_45_0(mf_m3m3_54Imag), .mfQ_45_1(mf_m1m3_54Imag), .mfQ_45_2(mf_p1m3_54Imag), .mfQ_45_3(mf_p3m3_54Imag), .mfQ_54_0(mf_m3m3_45Imag), .mfQ_54_1(mf_m1m3_45Imag), .mfQ_54_2(mf_p1m3_45Imag), .mfQ_54_3(mf_p3m3_45Imag), .tilt(tilt), .accMet_45_0(accMetOut24), .accMet_45_1(accMetOut5 ), .accMet_45_2(accMetOut50), .accMet_45_3(accMetOut31), .accMet_54_0(accMetOut24), .accMet_54_1(accMetOut9 ), .accMet_54_2(accMetOut58), .accMet_54_3(accMetOut43), .selOut(selOut24), .normalizeIn(s), .normalizeOut(s24), .accMetOut(accMetOut24), .iOut(iOut24), .qOut(qOut24));
   acsMultH #( 2,13, 8, 3,   2,14,10, 6)  acsMultH9    (.clk(clk), .reset(reset), .symEn(symEn), .sym2xEn(sym2xEn), .mfI_45_0(mf_m3m1_54Real), .mfI_45_1(mf_m1m1_54Real), .mfI_45_2(mf_p1m1_54Real), .mfI_45_3(mf_p3m1_54Real), .mfI_54_0(mf_m3m1_45Real), .mfI_54_1(mf_m1m1_45Real), .mfI_54_2(mf_p1m1_45Real), .mfI_54_3(mf_p3m1_45Real), .mfQ_45_0(mf_m3m1_54Imag), .mfQ_45_1(mf_m1m1_54Imag), .mfQ_45_2(mf_p1m1_54Imag), .mfQ_45_3(mf_p3m1_54Imag), .mfQ_54_0(mf_m3m1_45Imag), .mfQ_54_1(mf_m1m1_45Imag), .mfQ_54_2(mf_p1m1_45Imag), .mfQ_54_3(mf_p3m1_45Imag), .tilt(tilt), .accMet_45_0(accMetOut8 ), .accMet_45_1(accMetOut53), .accMet_45_2(accMetOut34), .accMet_45_3(accMetOut15), .accMet_54_0(accMetOut8 ), .accMet_54_1(accMetOut57), .accMet_54_2(accMetOut42), .accMet_54_3(accMetOut27), .selOut(selOut9 ), .normalizeIn(s), .normalizeOut(s9 ), .accMetOut(accMetOut9 ), .iOut(iOut9 ), .qOut(qOut9 ));
   acsMultH #( 14,9, 4,15,  14,10, 6, 2)  acsMultH58   (.clk(clk), .reset(reset), .symEn(symEn), .sym2xEn(sym2xEn), .mfI_45_0(mf_m3p1_54Real), .mfI_45_1(mf_m1p1_54Real), .mfI_45_2(mf_p1p1_54Real), .mfI_45_3(mf_p3p1_54Real), .mfI_54_0(mf_m3p1_45Real), .mfI_54_1(mf_m1p1_45Real), .mfI_54_2(mf_p1p1_45Real), .mfI_54_3(mf_p3p1_45Real), .mfQ_45_0(mf_m3p1_54Imag), .mfQ_45_1(mf_m1p1_54Imag), .mfQ_45_2(mf_p1p1_54Imag), .mfQ_45_3(mf_p3p1_54Imag), .mfQ_54_0(mf_m3p1_45Imag), .mfQ_54_1(mf_m1p1_45Imag), .mfQ_54_2(mf_p1p1_45Imag), .mfQ_54_3(mf_p3p1_45Imag), .tilt(tilt), .accMet_45_0(accMetOut56), .accMet_45_1(accMetOut37), .accMet_45_2(accMetOut18), .accMet_45_3(accMetOut63), .accMet_54_0(accMetOut56), .accMet_54_1(accMetOut41), .accMet_54_2(accMetOut26), .accMet_54_3(accMetOut11), .selOut(selOut58), .normalizeIn(s), .normalizeOut(s58), .accMetOut(accMetOut58), .iOut(iOut58), .qOut(qOut58));
   acsMultH #(10, 5, 0,11,  10, 6, 2,14)  acsMultH43   (.clk(clk), .reset(reset), .symEn(symEn), .sym2xEn(sym2xEn), .mfI_45_0(mf_m3p3_54Real), .mfI_45_1(mf_m1p3_54Real), .mfI_45_2(mf_p1p3_54Real), .mfI_45_3(mf_p3p3_54Real), .mfI_54_0(mf_m3p3_45Real), .mfI_54_1(mf_m1p3_45Real), .mfI_54_2(mf_p1p3_45Real), .mfI_54_3(mf_p3p3_45Real), .mfQ_45_0(mf_m3p3_54Imag), .mfQ_45_1(mf_m1p3_54Imag), .mfQ_45_2(mf_p1p3_54Imag), .mfQ_45_3(mf_p3p3_54Imag), .mfQ_54_0(mf_m3p3_45Imag), .mfQ_54_1(mf_m1p3_45Imag), .mfQ_54_2(mf_p1p3_45Imag), .mfQ_54_3(mf_p3p3_45Imag), .tilt(tilt), .accMet_45_0(accMetOut40), .accMet_45_1(accMetOut21), .accMet_45_2(accMetOut2 ), .accMet_45_3(accMetOut47), .accMet_54_0(accMetOut40), .accMet_54_1(accMetOut25), .accMet_54_2(accMetOut10), .accMet_54_3(accMetOut59), .selOut(selOut43), .normalizeIn(s), .normalizeOut(s43), .accMetOut(accMetOut43), .iOut(iOut43), .qOut(qOut43));
   acsMultH #( 7, 2,13, 8,   7, 3,15,11)  acsMultH28   (.clk(clk), .reset(reset), .symEn(symEn), .sym2xEn(sym2xEn), .mfI_45_0(mf_m3m3_54Real), .mfI_45_1(mf_m1m3_54Real), .mfI_45_2(mf_p1m3_54Real), .mfI_45_3(mf_p3m3_54Real), .mfI_54_0(mf_m3m3_45Real), .mfI_54_1(mf_m1m3_45Real), .mfI_54_2(mf_p1m3_45Real), .mfI_54_3(mf_p3m3_45Real), .mfQ_45_0(mf_m3m3_54Imag), .mfQ_45_1(mf_m1m3_54Imag), .mfQ_45_2(mf_p1m3_54Imag), .mfQ_45_3(mf_p3m3_54Imag), .mfQ_54_0(mf_m3m3_45Imag), .mfQ_54_1(mf_m1m3_45Imag), .mfQ_54_2(mf_p1m3_45Imag), .mfQ_54_3(mf_p3m3_45Imag), .tilt(tilt), .accMet_45_0(accMetOut28), .accMet_45_1(accMetOut9 ), .accMet_45_2(accMetOut54), .accMet_45_3(accMetOut35), .accMet_54_0(accMetOut28), .accMet_54_1(accMetOut13), .accMet_54_2(accMetOut62), .accMet_54_3(accMetOut47), .selOut(selOut28), .normalizeIn(s), .normalizeOut(s28), .accMetOut(accMetOut28), .iOut(iOut28), .qOut(qOut28));
   acsMultH #( 3,14, 9, 4,   3,15,11, 7)  acsMultH13   (.clk(clk), .reset(reset), .symEn(symEn), .sym2xEn(sym2xEn), .mfI_45_0(mf_m3m1_54Real), .mfI_45_1(mf_m1m1_54Real), .mfI_45_2(mf_p1m1_54Real), .mfI_45_3(mf_p3m1_54Real), .mfI_54_0(mf_m3m1_45Real), .mfI_54_1(mf_m1m1_45Real), .mfI_54_2(mf_p1m1_45Real), .mfI_54_3(mf_p3m1_45Real), .mfQ_45_0(mf_m3m1_54Imag), .mfQ_45_1(mf_m1m1_54Imag), .mfQ_45_2(mf_p1m1_54Imag), .mfQ_45_3(mf_p3m1_54Imag), .mfQ_54_0(mf_m3m1_45Imag), .mfQ_54_1(mf_m1m1_45Imag), .mfQ_54_2(mf_p1m1_45Imag), .mfQ_54_3(mf_p3m1_45Imag), .tilt(tilt), .accMet_45_0(accMetOut12), .accMet_45_1(accMetOut57), .accMet_45_2(accMetOut38), .accMet_45_3(accMetOut19), .accMet_54_0(accMetOut12), .accMet_54_1(accMetOut61), .accMet_54_2(accMetOut46), .accMet_54_3(accMetOut31), .selOut(selOut13), .normalizeIn(s), .normalizeOut(s13), .accMetOut(accMetOut13), .iOut(iOut13), .qOut(qOut13));
   acsMultH #(15,10, 5, 0,  15,11, 7, 3)  acsMultH62   (.clk(clk), .reset(reset), .symEn(symEn), .sym2xEn(sym2xEn), .mfI_45_0(mf_m3p1_54Real), .mfI_45_1(mf_m1p1_54Real), .mfI_45_2(mf_p1p1_54Real), .mfI_45_3(mf_p3p1_54Real), .mfI_54_0(mf_m3p1_45Real), .mfI_54_1(mf_m1p1_45Real), .mfI_54_2(mf_p1p1_45Real), .mfI_54_3(mf_p3p1_45Real), .mfQ_45_0(mf_m3p1_54Imag), .mfQ_45_1(mf_m1p1_54Imag), .mfQ_45_2(mf_p1p1_54Imag), .mfQ_45_3(mf_p3p1_54Imag), .mfQ_54_0(mf_m3p1_45Imag), .mfQ_54_1(mf_m1p1_45Imag), .mfQ_54_2(mf_p1p1_45Imag), .mfQ_54_3(mf_p3p1_45Imag), .tilt(tilt), .accMet_45_0(accMetOut60), .accMet_45_1(accMetOut41), .accMet_45_2(accMetOut22), .accMet_45_3(accMetOut3 ), .accMet_54_0(accMetOut60), .accMet_54_1(accMetOut45), .accMet_54_2(accMetOut30), .accMet_54_3(accMetOut15), .selOut(selOut62), .normalizeIn(s), .normalizeOut(s62), .accMetOut(accMetOut62), .iOut(iOut62), .qOut(qOut62));
   acsMultH #(11, 6, 1,12,  11, 7, 3,15)  acsMultH47   (.clk(clk), .reset(reset), .symEn(symEn), .sym2xEn(sym2xEn), .mfI_45_0(mf_m3p3_54Real), .mfI_45_1(mf_m1p3_54Real), .mfI_45_2(mf_p1p3_54Real), .mfI_45_3(mf_p3p3_54Real), .mfI_54_0(mf_m3p3_45Real), .mfI_54_1(mf_m1p3_45Real), .mfI_54_2(mf_p1p3_45Real), .mfI_54_3(mf_p3p3_45Real), .mfQ_45_0(mf_m3p3_54Imag), .mfQ_45_1(mf_m1p3_54Imag), .mfQ_45_2(mf_p1p3_54Imag), .mfQ_45_3(mf_p3p3_54Imag), .mfQ_54_0(mf_m3p3_45Imag), .mfQ_54_1(mf_m1p3_45Imag), .mfQ_54_2(mf_p1p3_45Imag), .mfQ_54_3(mf_p3p3_45Imag), .tilt(tilt), .accMet_45_0(accMetOut44), .accMet_45_1(accMetOut25), .accMet_45_2(accMetOut6 ), .accMet_45_3(accMetOut51), .accMet_54_0(accMetOut44), .accMet_54_1(accMetOut29), .accMet_54_2(accMetOut14), .accMet_54_3(accMetOut63), .selOut(selOut47), .normalizeIn(s), .normalizeOut(s47), .accMetOut(accMetOut47), .iOut(iOut47), .qOut(qOut47));
   acsMultH #( 8, 3,14, 9,   8, 4, 0,12)  acsMultH32   (.clk(clk), .reset(reset), .symEn(symEn), .sym2xEn(sym2xEn), .mfI_45_0(mf_m3m3_54Real), .mfI_45_1(mf_m1m3_54Real), .mfI_45_2(mf_p1m3_54Real), .mfI_45_3(mf_p3m3_54Real), .mfI_54_0(mf_m3m3_45Real), .mfI_54_1(mf_m1m3_45Real), .mfI_54_2(mf_p1m3_45Real), .mfI_54_3(mf_p3m3_45Real), .mfQ_45_0(mf_m3m3_54Imag), .mfQ_45_1(mf_m1m3_54Imag), .mfQ_45_2(mf_p1m3_54Imag), .mfQ_45_3(mf_p3m3_54Imag), .mfQ_54_0(mf_m3m3_45Imag), .mfQ_54_1(mf_m1m3_45Imag), .mfQ_54_2(mf_p1m3_45Imag), .mfQ_54_3(mf_p3m3_45Imag), .tilt(tilt), .accMet_45_0(accMetOut32), .accMet_45_1(accMetOut13), .accMet_45_2(accMetOut58), .accMet_45_3(accMetOut39), .accMet_54_0(accMetOut32), .accMet_54_1(accMetOut17), .accMet_54_2(accMetOut2 ), .accMet_54_3(accMetOut51), .selOut(selOut32), .normalizeIn(s), .normalizeOut(s32), .accMetOut(accMetOut32), .iOut(iOut32), .qOut(qOut32));
   acsMultH #( 4,15,10, 5,   4, 0,12, 8)  acsMultH17   (.clk(clk), .reset(reset), .symEn(symEn), .sym2xEn(sym2xEn), .mfI_45_0(mf_m3m1_54Real), .mfI_45_1(mf_m1m1_54Real), .mfI_45_2(mf_p1m1_54Real), .mfI_45_3(mf_p3m1_54Real), .mfI_54_0(mf_m3m1_45Real), .mfI_54_1(mf_m1m1_45Real), .mfI_54_2(mf_p1m1_45Real), .mfI_54_3(mf_p3m1_45Real), .mfQ_45_0(mf_m3m1_54Imag), .mfQ_45_1(mf_m1m1_54Imag), .mfQ_45_2(mf_p1m1_54Imag), .mfQ_45_3(mf_p3m1_54Imag), .mfQ_54_0(mf_m3m1_45Imag), .mfQ_54_1(mf_m1m1_45Imag), .mfQ_54_2(mf_p1m1_45Imag), .mfQ_54_3(mf_p3m1_45Imag), .tilt(tilt), .accMet_45_0(accMetOut16), .accMet_45_1(accMetOut61), .accMet_45_2(accMetOut42), .accMet_45_3(accMetOut23), .accMet_54_0(accMetOut16), .accMet_54_1(accMetOut1 ), .accMet_54_2(accMetOut50), .accMet_54_3(accMetOut35), .selOut(selOut17), .normalizeIn(s), .normalizeOut(s17), .accMetOut(accMetOut17), .iOut(iOut17), .qOut(qOut17));
   acsMultH #( 0,11, 6, 1,   0,12, 8, 4)  acsMultH2    (.clk(clk), .reset(reset), .symEn(symEn), .sym2xEn(sym2xEn), .mfI_45_0(mf_m3p1_54Real), .mfI_45_1(mf_m1p1_54Real), .mfI_45_2(mf_p1p1_54Real), .mfI_45_3(mf_p3p1_54Real), .mfI_54_0(mf_m3p1_45Real), .mfI_54_1(mf_m1p1_45Real), .mfI_54_2(mf_p1p1_45Real), .mfI_54_3(mf_p3p1_45Real), .mfQ_45_0(mf_m3p1_54Imag), .mfQ_45_1(mf_m1p1_54Imag), .mfQ_45_2(mf_p1p1_54Imag), .mfQ_45_3(mf_p3p1_54Imag), .mfQ_54_0(mf_m3p1_45Imag), .mfQ_54_1(mf_m1p1_45Imag), .mfQ_54_2(mf_p1p1_45Imag), .mfQ_54_3(mf_p3p1_45Imag), .tilt(tilt), .accMet_45_0(accMetOut0 ), .accMet_45_1(accMetOut45), .accMet_45_2(accMetOut26), .accMet_45_3(accMetOut7 ), .accMet_54_0(accMetOut0 ), .accMet_54_1(accMetOut49), .accMet_54_2(accMetOut34), .accMet_54_3(accMetOut19), .selOut(selOut2 ), .normalizeIn(s), .normalizeOut(s2 ), .accMetOut(accMetOut2 ), .iOut(iOut2 ), .qOut(qOut2 ));
   acsMultH #(12, 7, 2,13,  12, 8, 4, 0)  acsMultH51   (.clk(clk), .reset(reset), .symEn(symEn), .sym2xEn(sym2xEn), .mfI_45_0(mf_m3p3_54Real), .mfI_45_1(mf_m1p3_54Real), .mfI_45_2(mf_p1p3_54Real), .mfI_45_3(mf_p3p3_54Real), .mfI_54_0(mf_m3p3_45Real), .mfI_54_1(mf_m1p3_45Real), .mfI_54_2(mf_p1p3_45Real), .mfI_54_3(mf_p3p3_45Real), .mfQ_45_0(mf_m3p3_54Imag), .mfQ_45_1(mf_m1p3_54Imag), .mfQ_45_2(mf_p1p3_54Imag), .mfQ_45_3(mf_p3p3_54Imag), .mfQ_54_0(mf_m3p3_45Imag), .mfQ_54_1(mf_m1p3_45Imag), .mfQ_54_2(mf_p1p3_45Imag), .mfQ_54_3(mf_p3p3_45Imag), .tilt(tilt), .accMet_45_0(accMetOut48), .accMet_45_1(accMetOut29), .accMet_45_2(accMetOut10), .accMet_45_3(accMetOut55), .accMet_54_0(accMetOut48), .accMet_54_1(accMetOut33), .accMet_54_2(accMetOut18), .accMet_54_3(accMetOut3 ), .selOut(selOut51), .normalizeIn(s), .normalizeOut(s51), .accMetOut(accMetOut51), .iOut(iOut51), .qOut(qOut51));
   acsMultH #( 9, 4,15,10,   9, 5, 1,13)  acsMultH36   (.clk(clk), .reset(reset), .symEn(symEn), .sym2xEn(sym2xEn), .mfI_45_0(mf_m3m3_54Real), .mfI_45_1(mf_m1m3_54Real), .mfI_45_2(mf_p1m3_54Real), .mfI_45_3(mf_p3m3_54Real), .mfI_54_0(mf_m3m3_45Real), .mfI_54_1(mf_m1m3_45Real), .mfI_54_2(mf_p1m3_45Real), .mfI_54_3(mf_p3m3_45Real), .mfQ_45_0(mf_m3m3_54Imag), .mfQ_45_1(mf_m1m3_54Imag), .mfQ_45_2(mf_p1m3_54Imag), .mfQ_45_3(mf_p3m3_54Imag), .mfQ_54_0(mf_m3m3_45Imag), .mfQ_54_1(mf_m1m3_45Imag), .mfQ_54_2(mf_p1m3_45Imag), .mfQ_54_3(mf_p3m3_45Imag), .tilt(tilt), .accMet_45_0(accMetOut36), .accMet_45_1(accMetOut17), .accMet_45_2(accMetOut62), .accMet_45_3(accMetOut43), .accMet_54_0(accMetOut36), .accMet_54_1(accMetOut21), .accMet_54_2(accMetOut6 ), .accMet_54_3(accMetOut55), .selOut(selOut36), .normalizeIn(s), .normalizeOut(s36), .accMetOut(accMetOut36), .iOut(iOut36), .qOut(qOut36));
   acsMultH #( 5, 0,11, 6,   5, 1,13, 9)  acsMultH21   (.clk(clk), .reset(reset), .symEn(symEn), .sym2xEn(sym2xEn), .mfI_45_0(mf_m3m1_54Real), .mfI_45_1(mf_m1m1_54Real), .mfI_45_2(mf_p1m1_54Real), .mfI_45_3(mf_p3m1_54Real), .mfI_54_0(mf_m3m1_45Real), .mfI_54_1(mf_m1m1_45Real), .mfI_54_2(mf_p1m1_45Real), .mfI_54_3(mf_p3m1_45Real), .mfQ_45_0(mf_m3m1_54Imag), .mfQ_45_1(mf_m1m1_54Imag), .mfQ_45_2(mf_p1m1_54Imag), .mfQ_45_3(mf_p3m1_54Imag), .mfQ_54_0(mf_m3m1_45Imag), .mfQ_54_1(mf_m1m1_45Imag), .mfQ_54_2(mf_p1m1_45Imag), .mfQ_54_3(mf_p3m1_45Imag), .tilt(tilt), .accMet_45_0(accMetOut20), .accMet_45_1(accMetOut1 ), .accMet_45_2(accMetOut46), .accMet_45_3(accMetOut27), .accMet_54_0(accMetOut20), .accMet_54_1(accMetOut5 ), .accMet_54_2(accMetOut54), .accMet_54_3(accMetOut39), .selOut(selOut21), .normalizeIn(s), .normalizeOut(s21), .accMetOut(accMetOut21), .iOut(iOut21), .qOut(qOut21));
   acsMultH #( 1,12, 7, 2,   1,13, 9, 5)  acsMultH6    (.clk(clk), .reset(reset), .symEn(symEn), .sym2xEn(sym2xEn), .mfI_45_0(mf_m3p1_54Real), .mfI_45_1(mf_m1p1_54Real), .mfI_45_2(mf_p1p1_54Real), .mfI_45_3(mf_p3p1_54Real), .mfI_54_0(mf_m3p1_45Real), .mfI_54_1(mf_m1p1_45Real), .mfI_54_2(mf_p1p1_45Real), .mfI_54_3(mf_p3p1_45Real), .mfQ_45_0(mf_m3p1_54Imag), .mfQ_45_1(mf_m1p1_54Imag), .mfQ_45_2(mf_p1p1_54Imag), .mfQ_45_3(mf_p3p1_54Imag), .mfQ_54_0(mf_m3p1_45Imag), .mfQ_54_1(mf_m1p1_45Imag), .mfQ_54_2(mf_p1p1_45Imag), .mfQ_54_3(mf_p3p1_45Imag), .tilt(tilt), .accMet_45_0(accMetOut4 ), .accMet_45_1(accMetOut49), .accMet_45_2(accMetOut30), .accMet_45_3(accMetOut11), .accMet_54_0(accMetOut4 ), .accMet_54_1(accMetOut53), .accMet_54_2(accMetOut38), .accMet_54_3(accMetOut23), .selOut(selOut6 ), .normalizeIn(s), .normalizeOut(s6 ), .accMetOut(accMetOut6 ), .iOut(iOut6 ), .qOut(qOut6 ));
   acsMultH #(13, 8, 3,14,  13, 9, 5, 1)  acsMultH55   (.clk(clk), .reset(reset), .symEn(symEn), .sym2xEn(sym2xEn), .mfI_45_0(mf_m3p3_54Real), .mfI_45_1(mf_m1p3_54Real), .mfI_45_2(mf_p1p3_54Real), .mfI_45_3(mf_p3p3_54Real), .mfI_54_0(mf_m3p3_45Real), .mfI_54_1(mf_m1p3_45Real), .mfI_54_2(mf_p1p3_45Real), .mfI_54_3(mf_p3p3_45Real), .mfQ_45_0(mf_m3p3_54Imag), .mfQ_45_1(mf_m1p3_54Imag), .mfQ_45_2(mf_p1p3_54Imag), .mfQ_45_3(mf_p3p3_54Imag), .mfQ_54_0(mf_m3p3_45Imag), .mfQ_54_1(mf_m1p3_45Imag), .mfQ_54_2(mf_p1p3_45Imag), .mfQ_54_3(mf_p3p3_45Imag), .tilt(tilt), .accMet_45_0(accMetOut52), .accMet_45_1(accMetOut33), .accMet_45_2(accMetOut14), .accMet_45_3(accMetOut59), .accMet_54_0(accMetOut52), .accMet_54_1(accMetOut37), .accMet_54_2(accMetOut22), .accMet_54_3(accMetOut7 ), .selOut(selOut55), .normalizeIn(s), .normalizeOut(s55), .accMetOut(accMetOut55), .iOut(iOut55), .qOut(qOut55));
   acsMultH #(10, 5, 0,11,  10, 6, 2,14)  acsMultH40   (.clk(clk), .reset(reset), .symEn(symEn), .sym2xEn(sym2xEn), .mfI_45_0(mf_m3m3_54Real), .mfI_45_1(mf_m1m3_54Real), .mfI_45_2(mf_p1m3_54Real), .mfI_45_3(mf_p3m3_54Real), .mfI_54_0(mf_m3m3_45Real), .mfI_54_1(mf_m1m3_45Real), .mfI_54_2(mf_p1m3_45Real), .mfI_54_3(mf_p3m3_45Real), .mfQ_45_0(mf_m3m3_54Imag), .mfQ_45_1(mf_m1m3_54Imag), .mfQ_45_2(mf_p1m3_54Imag), .mfQ_45_3(mf_p3m3_54Imag), .mfQ_54_0(mf_m3m3_45Imag), .mfQ_54_1(mf_m1m3_45Imag), .mfQ_54_2(mf_p1m3_45Imag), .mfQ_54_3(mf_p3m3_45Imag), .tilt(tilt), .accMet_45_0(accMetOut40), .accMet_45_1(accMetOut21), .accMet_45_2(accMetOut2 ), .accMet_45_3(accMetOut47), .accMet_54_0(accMetOut40), .accMet_54_1(accMetOut25), .accMet_54_2(accMetOut10), .accMet_54_3(accMetOut59), .selOut(selOut40), .normalizeIn(s), .normalizeOut(s40), .accMetOut(accMetOut40), .iOut(iOut40), .qOut(qOut40));
   acsMultH #( 6, 1,12, 7,   6, 2,14,10)  acsMultH25   (.clk(clk), .reset(reset), .symEn(symEn), .sym2xEn(sym2xEn), .mfI_45_0(mf_m3m1_54Real), .mfI_45_1(mf_m1m1_54Real), .mfI_45_2(mf_p1m1_54Real), .mfI_45_3(mf_p3m1_54Real), .mfI_54_0(mf_m3m1_45Real), .mfI_54_1(mf_m1m1_45Real), .mfI_54_2(mf_p1m1_45Real), .mfI_54_3(mf_p3m1_45Real), .mfQ_45_0(mf_m3m1_54Imag), .mfQ_45_1(mf_m1m1_54Imag), .mfQ_45_2(mf_p1m1_54Imag), .mfQ_45_3(mf_p3m1_54Imag), .mfQ_54_0(mf_m3m1_45Imag), .mfQ_54_1(mf_m1m1_45Imag), .mfQ_54_2(mf_p1m1_45Imag), .mfQ_54_3(mf_p3m1_45Imag), .tilt(tilt), .accMet_45_0(accMetOut24), .accMet_45_1(accMetOut5 ), .accMet_45_2(accMetOut50), .accMet_45_3(accMetOut31), .accMet_54_0(accMetOut24), .accMet_54_1(accMetOut9 ), .accMet_54_2(accMetOut58), .accMet_54_3(accMetOut43), .selOut(selOut25), .normalizeIn(s), .normalizeOut(s25), .accMetOut(accMetOut25), .iOut(iOut25), .qOut(qOut25));
   acsMultH #( 2,13, 8, 3,   2,14,10, 6)  acsMultH10   (.clk(clk), .reset(reset), .symEn(symEn), .sym2xEn(sym2xEn), .mfI_45_0(mf_m3p1_54Real), .mfI_45_1(mf_m1p1_54Real), .mfI_45_2(mf_p1p1_54Real), .mfI_45_3(mf_p3p1_54Real), .mfI_54_0(mf_m3p1_45Real), .mfI_54_1(mf_m1p1_45Real), .mfI_54_2(mf_p1p1_45Real), .mfI_54_3(mf_p3p1_45Real), .mfQ_45_0(mf_m3p1_54Imag), .mfQ_45_1(mf_m1p1_54Imag), .mfQ_45_2(mf_p1p1_54Imag), .mfQ_45_3(mf_p3p1_54Imag), .mfQ_54_0(mf_m3p1_45Imag), .mfQ_54_1(mf_m1p1_45Imag), .mfQ_54_2(mf_p1p1_45Imag), .mfQ_54_3(mf_p3p1_45Imag), .tilt(tilt), .accMet_45_0(accMetOut8 ), .accMet_45_1(accMetOut53), .accMet_45_2(accMetOut34), .accMet_45_3(accMetOut15), .accMet_54_0(accMetOut8 ), .accMet_54_1(accMetOut57), .accMet_54_2(accMetOut42), .accMet_54_3(accMetOut27), .selOut(selOut10), .normalizeIn(s), .normalizeOut(s10), .accMetOut(accMetOut10), .iOut(iOut10), .qOut(qOut10));
   acsMultH #(14, 9, 4,15,  14,10, 6, 2)  acsMultH59   (.clk(clk), .reset(reset), .symEn(symEn), .sym2xEn(sym2xEn), .mfI_45_0(mf_m3p3_54Real), .mfI_45_1(mf_m1p3_54Real), .mfI_45_2(mf_p1p3_54Real), .mfI_45_3(mf_p3p3_54Real), .mfI_54_0(mf_m3p3_45Real), .mfI_54_1(mf_m1p3_45Real), .mfI_54_2(mf_p1p3_45Real), .mfI_54_3(mf_p3p3_45Real), .mfQ_45_0(mf_m3p3_54Imag), .mfQ_45_1(mf_m1p3_54Imag), .mfQ_45_2(mf_p1p3_54Imag), .mfQ_45_3(mf_p3p3_54Imag), .mfQ_54_0(mf_m3p3_45Imag), .mfQ_54_1(mf_m1p3_45Imag), .mfQ_54_2(mf_p1p3_45Imag), .mfQ_54_3(mf_p3p3_45Imag), .tilt(tilt), .accMet_45_0(accMetOut56), .accMet_45_1(accMetOut37), .accMet_45_2(accMetOut18), .accMet_45_3(accMetOut63), .accMet_54_0(accMetOut56), .accMet_54_1(accMetOut41), .accMet_54_2(accMetOut26), .accMet_54_3(accMetOut11), .selOut(selOut59), .normalizeIn(s), .normalizeOut(s59), .accMetOut(accMetOut59), .iOut(iOut59), .qOut(qOut59));
   acsMultH #(11, 6, 1,12,  11, 7, 3,15)  acsMultH44   (.clk(clk), .reset(reset), .symEn(symEn), .sym2xEn(sym2xEn), .mfI_45_0(mf_m3m3_54Real), .mfI_45_1(mf_m1m3_54Real), .mfI_45_2(mf_p1m3_54Real), .mfI_45_3(mf_p3m3_54Real), .mfI_54_0(mf_m3m3_45Real), .mfI_54_1(mf_m1m3_45Real), .mfI_54_2(mf_p1m3_45Real), .mfI_54_3(mf_p3m3_45Real), .mfQ_45_0(mf_m3m3_54Imag), .mfQ_45_1(mf_m1m3_54Imag), .mfQ_45_2(mf_p1m3_54Imag), .mfQ_45_3(mf_p3m3_54Imag), .mfQ_54_0(mf_m3m3_45Imag), .mfQ_54_1(mf_m1m3_45Imag), .mfQ_54_2(mf_p1m3_45Imag), .mfQ_54_3(mf_p3m3_45Imag), .tilt(tilt), .accMet_45_0(accMetOut44), .accMet_45_1(accMetOut25), .accMet_45_2(accMetOut6 ), .accMet_45_3(accMetOut51), .accMet_54_0(accMetOut44), .accMet_54_1(accMetOut29), .accMet_54_2(accMetOut14), .accMet_54_3(accMetOut63), .selOut(selOut44), .normalizeIn(s), .normalizeOut(s44), .accMetOut(accMetOut44), .iOut(iOut44), .qOut(qOut44));
   acsMultH #( 7, 2,13, 8,   7, 3,15,11)  acsMultH29   (.clk(clk), .reset(reset), .symEn(symEn), .sym2xEn(sym2xEn), .mfI_45_0(mf_m3m1_54Real), .mfI_45_1(mf_m1m1_54Real), .mfI_45_2(mf_p1m1_54Real), .mfI_45_3(mf_p3m1_54Real), .mfI_54_0(mf_m3m1_45Real), .mfI_54_1(mf_m1m1_45Real), .mfI_54_2(mf_p1m1_45Real), .mfI_54_3(mf_p3m1_45Real), .mfQ_45_0(mf_m3m1_54Imag), .mfQ_45_1(mf_m1m1_54Imag), .mfQ_45_2(mf_p1m1_54Imag), .mfQ_45_3(mf_p3m1_54Imag), .mfQ_54_0(mf_m3m1_45Imag), .mfQ_54_1(mf_m1m1_45Imag), .mfQ_54_2(mf_p1m1_45Imag), .mfQ_54_3(mf_p3m1_45Imag), .tilt(tilt), .accMet_45_0(accMetOut28), .accMet_45_1(accMetOut9 ), .accMet_45_2(accMetOut54), .accMet_45_3(accMetOut35), .accMet_54_0(accMetOut28), .accMet_54_1(accMetOut13), .accMet_54_2(accMetOut62), .accMet_54_3(accMetOut47), .selOut(selOut29), .normalizeIn(s), .normalizeOut(s29), .accMetOut(accMetOut29), .iOut(iOut29), .qOut(qOut29));
   acsMultH #( 3,14, 9, 4,   3,15,11, 7)  acsMultH14   (.clk(clk), .reset(reset), .symEn(symEn), .sym2xEn(sym2xEn), .mfI_45_0(mf_m3p1_54Real), .mfI_45_1(mf_m1p1_54Real), .mfI_45_2(mf_p1p1_54Real), .mfI_45_3(mf_p3p1_54Real), .mfI_54_0(mf_m3p1_45Real), .mfI_54_1(mf_m1p1_45Real), .mfI_54_2(mf_p1p1_45Real), .mfI_54_3(mf_p3p1_45Real), .mfQ_45_0(mf_m3p1_54Imag), .mfQ_45_1(mf_m1p1_54Imag), .mfQ_45_2(mf_p1p1_54Imag), .mfQ_45_3(mf_p3p1_54Imag), .mfQ_54_0(mf_m3p1_45Imag), .mfQ_54_1(mf_m1p1_45Imag), .mfQ_54_2(mf_p1p1_45Imag), .mfQ_54_3(mf_p3p1_45Imag), .tilt(tilt), .accMet_45_0(accMetOut12), .accMet_45_1(accMetOut57), .accMet_45_2(accMetOut38), .accMet_45_3(accMetOut19), .accMet_54_0(accMetOut12), .accMet_54_1(accMetOut61), .accMet_54_2(accMetOut46), .accMet_54_3(accMetOut31), .selOut(selOut14), .normalizeIn(s), .normalizeOut(s14), .accMetOut(accMetOut14), .iOut(iOut14), .qOut(qOut14));
   acsMultH #(15,10, 5, 0,  15,11, 7, 3)  acsMultH63   (.clk(clk), .reset(reset), .symEn(symEn), .sym2xEn(sym2xEn), .mfI_45_0(mf_m3p3_54Real), .mfI_45_1(mf_m1p3_54Real), .mfI_45_2(mf_p1p3_54Real), .mfI_45_3(mf_p3p3_54Real), .mfI_54_0(mf_m3p3_45Real), .mfI_54_1(mf_m1p3_45Real), .mfI_54_2(mf_p1p3_45Real), .mfI_54_3(mf_p3p3_45Real), .mfQ_45_0(mf_m3p3_54Imag), .mfQ_45_1(mf_m1p3_54Imag), .mfQ_45_2(mf_p1p3_54Imag), .mfQ_45_3(mf_p3p3_54Imag), .mfQ_54_0(mf_m3p3_45Imag), .mfQ_54_1(mf_m1p3_45Imag), .mfQ_54_2(mf_p1p3_45Imag), .mfQ_54_3(mf_p3p3_45Imag), .tilt(tilt), .accMet_45_0(accMetOut60), .accMet_45_1(accMetOut41), .accMet_45_2(accMetOut22), .accMet_45_3(accMetOut3 ), .accMet_54_0(accMetOut60), .accMet_54_1(accMetOut45), .accMet_54_2(accMetOut30), .accMet_54_3(accMetOut15), .selOut(selOut63), .normalizeIn(s), .normalizeOut(s63), .accMetOut(accMetOut63), .iOut(iOut63), .qOut(qOut63));
   acsMultH #(12, 7, 2,13,  12, 8, 4, 0)  acsMultH48   (.clk(clk), .reset(reset), .symEn(symEn), .sym2xEn(sym2xEn), .mfI_45_0(mf_m3m3_54Real), .mfI_45_1(mf_m1m3_54Real), .mfI_45_2(mf_p1m3_54Real), .mfI_45_3(mf_p3m3_54Real), .mfI_54_0(mf_m3m3_45Real), .mfI_54_1(mf_m1m3_45Real), .mfI_54_2(mf_p1m3_45Real), .mfI_54_3(mf_p3m3_45Real), .mfQ_45_0(mf_m3m3_54Imag), .mfQ_45_1(mf_m1m3_54Imag), .mfQ_45_2(mf_p1m3_54Imag), .mfQ_45_3(mf_p3m3_54Imag), .mfQ_54_0(mf_m3m3_45Imag), .mfQ_54_1(mf_m1m3_45Imag), .mfQ_54_2(mf_p1m3_45Imag), .mfQ_54_3(mf_p3m3_45Imag), .tilt(tilt), .accMet_45_0(accMetOut48), .accMet_45_1(accMetOut29), .accMet_45_2(accMetOut10), .accMet_45_3(accMetOut55), .accMet_54_0(accMetOut48), .accMet_54_1(accMetOut33), .accMet_54_2(accMetOut18), .accMet_54_3(accMetOut3 ), .selOut(selOut48), .normalizeIn(s), .normalizeOut(s48), .accMetOut(accMetOut48), .iOut(iOut48), .qOut(qOut48));
   acsMultH #( 8, 3,14, 9,   8, 4, 0,12)  acsMultH33   (.clk(clk), .reset(reset), .symEn(symEn), .sym2xEn(sym2xEn), .mfI_45_0(mf_m3m1_54Real), .mfI_45_1(mf_m1m1_54Real), .mfI_45_2(mf_p1m1_54Real), .mfI_45_3(mf_p3m1_54Real), .mfI_54_0(mf_m3m1_45Real), .mfI_54_1(mf_m1m1_45Real), .mfI_54_2(mf_p1m1_45Real), .mfI_54_3(mf_p3m1_45Real), .mfQ_45_0(mf_m3m1_54Imag), .mfQ_45_1(mf_m1m1_54Imag), .mfQ_45_2(mf_p1m1_54Imag), .mfQ_45_3(mf_p3m1_54Imag), .mfQ_54_0(mf_m3m1_45Imag), .mfQ_54_1(mf_m1m1_45Imag), .mfQ_54_2(mf_p1m1_45Imag), .mfQ_54_3(mf_p3m1_45Imag), .tilt(tilt), .accMet_45_0(accMetOut32), .accMet_45_1(accMetOut13), .accMet_45_2(accMetOut58), .accMet_45_3(accMetOut39), .accMet_54_0(accMetOut32), .accMet_54_1(accMetOut17), .accMet_54_2(accMetOut2 ), .accMet_54_3(accMetOut51), .selOut(selOut33), .normalizeIn(s), .normalizeOut(s33), .accMetOut(accMetOut33), .iOut(iOut33), .qOut(qOut33));
   acsMultH #( 4,15,10, 5,   4, 0,12, 8)  acsMultH18   (.clk(clk), .reset(reset), .symEn(symEn), .sym2xEn(sym2xEn), .mfI_45_0(mf_m3p1_54Real), .mfI_45_1(mf_m1p1_54Real), .mfI_45_2(mf_p1p1_54Real), .mfI_45_3(mf_p3p1_54Real), .mfI_54_0(mf_m3p1_45Real), .mfI_54_1(mf_m1p1_45Real), .mfI_54_2(mf_p1p1_45Real), .mfI_54_3(mf_p3p1_45Real), .mfQ_45_0(mf_m3p1_54Imag), .mfQ_45_1(mf_m1p1_54Imag), .mfQ_45_2(mf_p1p1_54Imag), .mfQ_45_3(mf_p3p1_54Imag), .mfQ_54_0(mf_m3p1_45Imag), .mfQ_54_1(mf_m1p1_45Imag), .mfQ_54_2(mf_p1p1_45Imag), .mfQ_54_3(mf_p3p1_45Imag), .tilt(tilt), .accMet_45_0(accMetOut16), .accMet_45_1(accMetOut61), .accMet_45_2(accMetOut42), .accMet_45_3(accMetOut23), .accMet_54_0(accMetOut16), .accMet_54_1(accMetOut1 ), .accMet_54_2(accMetOut50), .accMet_54_3(accMetOut35), .selOut(selOut18), .normalizeIn(s), .normalizeOut(s18), .accMetOut(accMetOut18), .iOut(iOut18), .qOut(qOut18));
   acsMultH #( 0,11, 6, 1,   0,12, 8, 4)  acsMultH3    (.clk(clk), .reset(reset), .symEn(symEn), .sym2xEn(sym2xEn), .mfI_45_0(mf_m3p3_54Real), .mfI_45_1(mf_m1p3_54Real), .mfI_45_2(mf_p1p3_54Real), .mfI_45_3(mf_p3p3_54Real), .mfI_54_0(mf_m3p3_45Real), .mfI_54_1(mf_m1p3_45Real), .mfI_54_2(mf_p1p3_45Real), .mfI_54_3(mf_p3p3_45Real), .mfQ_45_0(mf_m3p3_54Imag), .mfQ_45_1(mf_m1p3_54Imag), .mfQ_45_2(mf_p1p3_54Imag), .mfQ_45_3(mf_p3p3_54Imag), .mfQ_54_0(mf_m3p3_45Imag), .mfQ_54_1(mf_m1p3_45Imag), .mfQ_54_2(mf_p1p3_45Imag), .mfQ_54_3(mf_p3p3_45Imag), .tilt(tilt), .accMet_45_0(accMetOut0 ), .accMet_45_1(accMetOut45), .accMet_45_2(accMetOut26), .accMet_45_3(accMetOut7 ), .accMet_54_0(accMetOut0 ), .accMet_54_1(accMetOut49), .accMet_54_2(accMetOut34), .accMet_54_3(accMetOut19), .selOut(selOut3 ), .normalizeIn(s), .normalizeOut(s3 ), .accMetOut(accMetOut3 ), .iOut(iOut3 ), .qOut(qOut3 ));
   acsMultH #(13, 8, 3,14,  13, 9, 5, 1)  acsMultH52   (.clk(clk), .reset(reset), .symEn(symEn), .sym2xEn(sym2xEn), .mfI_45_0(mf_m3m3_54Real), .mfI_45_1(mf_m1m3_54Real), .mfI_45_2(mf_p1m3_54Real), .mfI_45_3(mf_p3m3_54Real), .mfI_54_0(mf_m3m3_45Real), .mfI_54_1(mf_m1m3_45Real), .mfI_54_2(mf_p1m3_45Real), .mfI_54_3(mf_p3m3_45Real), .mfQ_45_0(mf_m3m3_54Imag), .mfQ_45_1(mf_m1m3_54Imag), .mfQ_45_2(mf_p1m3_54Imag), .mfQ_45_3(mf_p3m3_54Imag), .mfQ_54_0(mf_m3m3_45Imag), .mfQ_54_1(mf_m1m3_45Imag), .mfQ_54_2(mf_p1m3_45Imag), .mfQ_54_3(mf_p3m3_45Imag), .tilt(tilt), .accMet_45_0(accMetOut52), .accMet_45_1(accMetOut33), .accMet_45_2(accMetOut14), .accMet_45_3(accMetOut59), .accMet_54_0(accMetOut52), .accMet_54_1(accMetOut37), .accMet_54_2(accMetOut22), .accMet_54_3(accMetOut7 ), .selOut(selOut52), .normalizeIn(s), .normalizeOut(s52), .accMetOut(accMetOut52), .iOut(iOut52), .qOut(qOut52));
   acsMultH #( 9, 4,15,10,   9, 5, 1,13)  acsMultH37   (.clk(clk), .reset(reset), .symEn(symEn), .sym2xEn(sym2xEn), .mfI_45_0(mf_m3m1_54Real), .mfI_45_1(mf_m1m1_54Real), .mfI_45_2(mf_p1m1_54Real), .mfI_45_3(mf_p3m1_54Real), .mfI_54_0(mf_m3m1_45Real), .mfI_54_1(mf_m1m1_45Real), .mfI_54_2(mf_p1m1_45Real), .mfI_54_3(mf_p3m1_45Real), .mfQ_45_0(mf_m3m1_54Imag), .mfQ_45_1(mf_m1m1_54Imag), .mfQ_45_2(mf_p1m1_54Imag), .mfQ_45_3(mf_p3m1_54Imag), .mfQ_54_0(mf_m3m1_45Imag), .mfQ_54_1(mf_m1m1_45Imag), .mfQ_54_2(mf_p1m1_45Imag), .mfQ_54_3(mf_p3m1_45Imag), .tilt(tilt), .accMet_45_0(accMetOut36), .accMet_45_1(accMetOut17), .accMet_45_2(accMetOut62), .accMet_45_3(accMetOut43), .accMet_54_0(accMetOut36), .accMet_54_1(accMetOut21), .accMet_54_2(accMetOut6 ), .accMet_54_3(accMetOut55), .selOut(selOut37), .normalizeIn(s), .normalizeOut(s37), .accMetOut(accMetOut37), .iOut(iOut37), .qOut(qOut37));
   acsMultH #( 5, 0,11, 6,   5, 1,13, 9)  acsMultH22   (.clk(clk), .reset(reset), .symEn(symEn), .sym2xEn(sym2xEn), .mfI_45_0(mf_m3p1_54Real), .mfI_45_1(mf_m1p1_54Real), .mfI_45_2(mf_p1p1_54Real), .mfI_45_3(mf_p3p1_54Real), .mfI_54_0(mf_m3p1_45Real), .mfI_54_1(mf_m1p1_45Real), .mfI_54_2(mf_p1p1_45Real), .mfI_54_3(mf_p3p1_45Real), .mfQ_45_0(mf_m3p1_54Imag), .mfQ_45_1(mf_m1p1_54Imag), .mfQ_45_2(mf_p1p1_54Imag), .mfQ_45_3(mf_p3p1_54Imag), .mfQ_54_0(mf_m3p1_45Imag), .mfQ_54_1(mf_m1p1_45Imag), .mfQ_54_2(mf_p1p1_45Imag), .mfQ_54_3(mf_p3p1_45Imag), .tilt(tilt), .accMet_45_0(accMetOut20), .accMet_45_1(accMetOut1 ), .accMet_45_2(accMetOut46), .accMet_45_3(accMetOut27), .accMet_54_0(accMetOut20), .accMet_54_1(accMetOut5 ), .accMet_54_2(accMetOut54), .accMet_54_3(accMetOut39), .selOut(selOut22), .normalizeIn(s), .normalizeOut(s22), .accMetOut(accMetOut22), .iOut(iOut22), .qOut(qOut22));
   acsMultH #( 1,12, 7, 2,   1,13, 9, 5)  acsMultH7    (.clk(clk), .reset(reset), .symEn(symEn), .sym2xEn(sym2xEn), .mfI_45_0(mf_m3p3_54Real), .mfI_45_1(mf_m1p3_54Real), .mfI_45_2(mf_p1p3_54Real), .mfI_45_3(mf_p3p3_54Real), .mfI_54_0(mf_m3p3_45Real), .mfI_54_1(mf_m1p3_45Real), .mfI_54_2(mf_p1p3_45Real), .mfI_54_3(mf_p3p3_45Real), .mfQ_45_0(mf_m3p3_54Imag), .mfQ_45_1(mf_m1p3_54Imag), .mfQ_45_2(mf_p1p3_54Imag), .mfQ_45_3(mf_p3p3_54Imag), .mfQ_54_0(mf_m3p3_45Imag), .mfQ_54_1(mf_m1p3_45Imag), .mfQ_54_2(mf_p1p3_45Imag), .mfQ_54_3(mf_p3p3_45Imag), .tilt(tilt), .accMet_45_0(accMetOut4 ), .accMet_45_1(accMetOut49), .accMet_45_2(accMetOut30), .accMet_45_3(accMetOut11), .accMet_54_0(accMetOut4 ), .accMet_54_1(accMetOut53), .accMet_54_2(accMetOut38), .accMet_54_3(accMetOut23), .selOut(selOut7 ), .normalizeIn(s), .normalizeOut(s7 ), .accMetOut(accMetOut7 ), .iOut(iOut7 ), .qOut(qOut7 ));
   acsMultH #(14, 9, 4,15,  14,10, 6, 2)  acsMultH56   (.clk(clk), .reset(reset), .symEn(symEn), .sym2xEn(sym2xEn), .mfI_45_0(mf_m3m3_54Real), .mfI_45_1(mf_m1m3_54Real), .mfI_45_2(mf_p1m3_54Real), .mfI_45_3(mf_p3m3_54Real), .mfI_54_0(mf_m3m3_45Real), .mfI_54_1(mf_m1m3_45Real), .mfI_54_2(mf_p1m3_45Real), .mfI_54_3(mf_p3m3_45Real), .mfQ_45_0(mf_m3m3_54Imag), .mfQ_45_1(mf_m1m3_54Imag), .mfQ_45_2(mf_p1m3_54Imag), .mfQ_45_3(mf_p3m3_54Imag), .mfQ_54_0(mf_m3m3_45Imag), .mfQ_54_1(mf_m1m3_45Imag), .mfQ_54_2(mf_p1m3_45Imag), .mfQ_54_3(mf_p3m3_45Imag), .tilt(tilt), .accMet_45_0(accMetOut56), .accMet_45_1(accMetOut37), .accMet_45_2(accMetOut18), .accMet_45_3(accMetOut63), .accMet_54_0(accMetOut56), .accMet_54_1(accMetOut41), .accMet_54_2(accMetOut26), .accMet_54_3(accMetOut11), .selOut(selOut56), .normalizeIn(s), .normalizeOut(s56), .accMetOut(accMetOut56), .iOut(iOut56), .qOut(qOut56));
   acsMultH #(10, 5, 0,11,  10, 6, 2,14)  acsMultH41   (.clk(clk), .reset(reset), .symEn(symEn), .sym2xEn(sym2xEn), .mfI_45_0(mf_m3m1_54Real), .mfI_45_1(mf_m1m1_54Real), .mfI_45_2(mf_p1m1_54Real), .mfI_45_3(mf_p3m1_54Real), .mfI_54_0(mf_m3m1_45Real), .mfI_54_1(mf_m1m1_45Real), .mfI_54_2(mf_p1m1_45Real), .mfI_54_3(mf_p3m1_45Real), .mfQ_45_0(mf_m3m1_54Imag), .mfQ_45_1(mf_m1m1_54Imag), .mfQ_45_2(mf_p1m1_54Imag), .mfQ_45_3(mf_p3m1_54Imag), .mfQ_54_0(mf_m3m1_45Imag), .mfQ_54_1(mf_m1m1_45Imag), .mfQ_54_2(mf_p1m1_45Imag), .mfQ_54_3(mf_p3m1_45Imag), .tilt(tilt), .accMet_45_0(accMetOut40), .accMet_45_1(accMetOut21), .accMet_45_2(accMetOut2 ), .accMet_45_3(accMetOut47), .accMet_54_0(accMetOut40), .accMet_54_1(accMetOut25), .accMet_54_2(accMetOut10), .accMet_54_3(accMetOut59), .selOut(selOut41), .normalizeIn(s), .normalizeOut(s41), .accMetOut(accMetOut41), .iOut(iOut41), .qOut(qOut41));
   acsMultH #( 6, 1,12, 7,   6, 2,14,10)  acsMultH26   (.clk(clk), .reset(reset), .symEn(symEn), .sym2xEn(sym2xEn), .mfI_45_0(mf_m3p1_54Real), .mfI_45_1(mf_m1p1_54Real), .mfI_45_2(mf_p1p1_54Real), .mfI_45_3(mf_p3p1_54Real), .mfI_54_0(mf_m3p1_45Real), .mfI_54_1(mf_m1p1_45Real), .mfI_54_2(mf_p1p1_45Real), .mfI_54_3(mf_p3p1_45Real), .mfQ_45_0(mf_m3p1_54Imag), .mfQ_45_1(mf_m1p1_54Imag), .mfQ_45_2(mf_p1p1_54Imag), .mfQ_45_3(mf_p3p1_54Imag), .mfQ_54_0(mf_m3p1_45Imag), .mfQ_54_1(mf_m1p1_45Imag), .mfQ_54_2(mf_p1p1_45Imag), .mfQ_54_3(mf_p3p1_45Imag), .tilt(tilt), .accMet_45_0(accMetOut24), .accMet_45_1(accMetOut5 ), .accMet_45_2(accMetOut50), .accMet_45_3(accMetOut31), .accMet_54_0(accMetOut24), .accMet_54_1(accMetOut9 ), .accMet_54_2(accMetOut58), .accMet_54_3(accMetOut43), .selOut(selOut26), .normalizeIn(s), .normalizeOut(s26), .accMetOut(accMetOut26), .iOut(iOut26), .qOut(qOut26));
   acsMultH #( 2,13, 8, 3,   2,14,10, 6)  acsMultH11   (.clk(clk), .reset(reset), .symEn(symEn), .sym2xEn(sym2xEn), .mfI_45_0(mf_m3p3_54Real), .mfI_45_1(mf_m1p3_54Real), .mfI_45_2(mf_p1p3_54Real), .mfI_45_3(mf_p3p3_54Real), .mfI_54_0(mf_m3p3_45Real), .mfI_54_1(mf_m1p3_45Real), .mfI_54_2(mf_p1p3_45Real), .mfI_54_3(mf_p3p3_45Real), .mfQ_45_0(mf_m3p3_54Imag), .mfQ_45_1(mf_m1p3_54Imag), .mfQ_45_2(mf_p1p3_54Imag), .mfQ_45_3(mf_p3p3_54Imag), .mfQ_54_0(mf_m3p3_45Imag), .mfQ_54_1(mf_m1p3_45Imag), .mfQ_54_2(mf_p1p3_45Imag), .mfQ_54_3(mf_p3p3_45Imag), .tilt(tilt), .accMet_45_0(accMetOut8 ), .accMet_45_1(accMetOut53), .accMet_45_2(accMetOut34), .accMet_45_3(accMetOut15), .accMet_54_0(accMetOut8 ), .accMet_54_1(accMetOut57), .accMet_54_2(accMetOut42), .accMet_54_3(accMetOut27), .selOut(selOut11), .normalizeIn(s), .normalizeOut(s11), .accMetOut(accMetOut11), .iOut(iOut11), .qOut(qOut11));
   acsMultH #(15,10, 5, 0,  15,11, 7, 3)  acsMultH60   (.clk(clk), .reset(reset), .symEn(symEn), .sym2xEn(sym2xEn), .mfI_45_0(mf_m3m3_54Real), .mfI_45_1(mf_m1m3_54Real), .mfI_45_2(mf_p1m3_54Real), .mfI_45_3(mf_p3m3_54Real), .mfI_54_0(mf_m3m3_45Real), .mfI_54_1(mf_m1m3_45Real), .mfI_54_2(mf_p1m3_45Real), .mfI_54_3(mf_p3m3_45Real), .mfQ_45_0(mf_m3m3_54Imag), .mfQ_45_1(mf_m1m3_54Imag), .mfQ_45_2(mf_p1m3_54Imag), .mfQ_45_3(mf_p3m3_54Imag), .mfQ_54_0(mf_m3m3_45Imag), .mfQ_54_1(mf_m1m3_45Imag), .mfQ_54_2(mf_p1m3_45Imag), .mfQ_54_3(mf_p3m3_45Imag), .tilt(tilt), .accMet_45_0(accMetOut60), .accMet_45_1(accMetOut41), .accMet_45_2(accMetOut22), .accMet_45_3(accMetOut3 ), .accMet_54_0(accMetOut60), .accMet_54_1(accMetOut45), .accMet_54_2(accMetOut30), .accMet_54_3(accMetOut15), .selOut(selOut60), .normalizeIn(s), .normalizeOut(s60), .accMetOut(accMetOut60), .iOut(iOut60), .qOut(qOut60));
   acsMultH #(11, 6, 1,12,  11, 7, 3,15)  acsMultH45   (.clk(clk), .reset(reset), .symEn(symEn), .sym2xEn(sym2xEn), .mfI_45_0(mf_m3m1_54Real), .mfI_45_1(mf_m1m1_54Real), .mfI_45_2(mf_p1m1_54Real), .mfI_45_3(mf_p3m1_54Real), .mfI_54_0(mf_m3m1_45Real), .mfI_54_1(mf_m1m1_45Real), .mfI_54_2(mf_p1m1_45Real), .mfI_54_3(mf_p3m1_45Real), .mfQ_45_0(mf_m3m1_54Imag), .mfQ_45_1(mf_m1m1_54Imag), .mfQ_45_2(mf_p1m1_54Imag), .mfQ_45_3(mf_p3m1_54Imag), .mfQ_54_0(mf_m3m1_45Imag), .mfQ_54_1(mf_m1m1_45Imag), .mfQ_54_2(mf_p1m1_45Imag), .mfQ_54_3(mf_p3m1_45Imag), .tilt(tilt), .accMet_45_0(accMetOut44), .accMet_45_1(accMetOut25), .accMet_45_2(accMetOut6 ), .accMet_45_3(accMetOut51), .accMet_54_0(accMetOut44), .accMet_54_1(accMetOut29), .accMet_54_2(accMetOut14), .accMet_54_3(accMetOut63), .selOut(selOut45), .normalizeIn(s), .normalizeOut(s45), .accMetOut(accMetOut45), .iOut(iOut45), .qOut(qOut45));
   acsMultH #( 7, 2,13, 8,   7, 3,15,11)  acsMultH30   (.clk(clk), .reset(reset), .symEn(symEn), .sym2xEn(sym2xEn), .mfI_45_0(mf_m3p1_54Real), .mfI_45_1(mf_m1p1_54Real), .mfI_45_2(mf_p1p1_54Real), .mfI_45_3(mf_p3p1_54Real), .mfI_54_0(mf_m3p1_45Real), .mfI_54_1(mf_m1p1_45Real), .mfI_54_2(mf_p1p1_45Real), .mfI_54_3(mf_p3p1_45Real), .mfQ_45_0(mf_m3p1_54Imag), .mfQ_45_1(mf_m1p1_54Imag), .mfQ_45_2(mf_p1p1_54Imag), .mfQ_45_3(mf_p3p1_54Imag), .mfQ_54_0(mf_m3p1_45Imag), .mfQ_54_1(mf_m1p1_45Imag), .mfQ_54_2(mf_p1p1_45Imag), .mfQ_54_3(mf_p3p1_45Imag), .tilt(tilt), .accMet_45_0(accMetOut28), .accMet_45_1(accMetOut9 ), .accMet_45_2(accMetOut54), .accMet_45_3(accMetOut35), .accMet_54_0(accMetOut28), .accMet_54_1(accMetOut13), .accMet_54_2(accMetOut62), .accMet_54_3(accMetOut47), .selOut(selOut30), .normalizeIn(s), .normalizeOut(s30), .accMetOut(accMetOut30), .iOut(iOut30), .qOut(qOut30));
   acsMultH #( 3,14, 9, 4,   3,15,11, 7)  acsMultH15   (.clk(clk), .reset(reset), .symEn(symEn), .sym2xEn(sym2xEn), .mfI_45_0(mf_m3p3_54Real), .mfI_45_1(mf_m1p3_54Real), .mfI_45_2(mf_p1p3_54Real), .mfI_45_3(mf_p3p3_54Real), .mfI_54_0(mf_m3p3_45Real), .mfI_54_1(mf_m1p3_45Real), .mfI_54_2(mf_p1p3_45Real), .mfI_54_3(mf_p3p3_45Real), .mfQ_45_0(mf_m3p3_54Imag), .mfQ_45_1(mf_m1p3_54Imag), .mfQ_45_2(mf_p1p3_54Imag), .mfQ_45_3(mf_p3p3_54Imag), .mfQ_54_0(mf_m3p3_45Imag), .mfQ_54_1(mf_m1p3_45Imag), .mfQ_54_2(mf_p1p3_45Imag), .mfQ_54_3(mf_p3p3_45Imag), .tilt(tilt), .accMet_45_0(accMetOut12), .accMet_45_1(accMetOut57), .accMet_45_2(accMetOut38), .accMet_45_3(accMetOut19), .accMet_54_0(accMetOut12), .accMet_54_1(accMetOut61), .accMet_54_2(accMetOut46), .accMet_54_3(accMetOut31), .selOut(selOut15), .normalizeIn(s), .normalizeOut(s15), .accMetOut(accMetOut15), .iOut(iOut15), .qOut(qOut15));


   maxMetricMultiH  maxMetric 
     (
      .clk(clk), 
      .reset(reset), 
      .symEn(symEn), 
      .accMetOut0( accMetOut0 ), .accMetOut1( accMetOut1 ), .accMetOut2( accMetOut2 ), .accMetOut3( accMetOut3 ), 
      .accMetOut4( accMetOut4 ), .accMetOut5( accMetOut5 ), .accMetOut6( accMetOut6 ), .accMetOut7( accMetOut7 ), 
      .accMetOut8( accMetOut8 ), .accMetOut9( accMetOut9 ), .accMetOut10(accMetOut10), .accMetOut11(accMetOut11), 
      .accMetOut12(accMetOut12), .accMetOut13(accMetOut13), .accMetOut14(accMetOut14), .accMetOut15(accMetOut15), 
      .accMetOut16(accMetOut16), .accMetOut17(accMetOut17), .accMetOut18(accMetOut18), .accMetOut19(accMetOut19),
      .accMetOut20(accMetOut20), .accMetOut21(accMetOut21), .accMetOut22(accMetOut22), .accMetOut23(accMetOut23), 
      .accMetOut24(accMetOut24), .accMetOut25(accMetOut25), .accMetOut26(accMetOut26), .accMetOut27(accMetOut27), 
      .accMetOut28(accMetOut28), .accMetOut29(accMetOut29), .accMetOut30(accMetOut30), .accMetOut31(accMetOut31), 
      .accMetOut32(accMetOut32), .accMetOut33(accMetOut33), .accMetOut34(accMetOut34), .accMetOut35(accMetOut35), 
      .accMetOut36(accMetOut36), .accMetOut37(accMetOut37), .accMetOut38(accMetOut38), .accMetOut39(accMetOut39),
      .accMetOut40(accMetOut40), .accMetOut41(accMetOut41), .accMetOut42(accMetOut42), .accMetOut43(accMetOut43), 
      .accMetOut44(accMetOut44), .accMetOut45(accMetOut45), .accMetOut46(accMetOut46), .accMetOut47(accMetOut47), 
      .accMetOut48(accMetOut48), .accMetOut49(accMetOut49), .accMetOut50(accMetOut50), .accMetOut51(accMetOut51), 
      .accMetOut52(accMetOut52), .accMetOut53(accMetOut53), .accMetOut54(accMetOut54), .accMetOut55(accMetOut55), 
      .accMetOut56(accMetOut56), .accMetOut57(accMetOut57), .accMetOut58(accMetOut58), .accMetOut59(accMetOut59),
      .accMetOut60(accMetOut60), .accMetOut61(accMetOut61), .accMetOut62(accMetOut62), .accMetOut63(accMetOut63), 
      .index(index), .symEnDly(symEn_maxMetDly)
      );


   // ----- decision before the traceback -----
   reg [1:0]             decision;
   reg [1:0]             selOut0r , selOut49r , selOut34r , selOut19r , selOut4r , selOut53r , selOut38r , selOut23r , 
                         selOut8r , selOut57r , selOut42r , selOut27r , selOut12r , selOut61r , selOut46r , selOut31r ,
                         selOut16r , selOut1r , selOut50r , selOut35r , selOut20r , selOut5r , selOut54r , selOut39r , 
                         selOut24r , selOut9r , selOut58r , selOut43r , selOut28r , selOut13r , selOut62r , selOut47r , 
                         selOut32r , selOut17r , selOut2r , selOut51r , selOut36r , selOut21r , selOut6r , selOut55r , 
                         selOut40r , selOut25r , selOut10r , selOut59r , selOut44r , selOut29r , selOut14r , selOut63r ,
                         selOut48r , selOut33r , selOut18r , selOut3r , selOut52r , selOut37r , selOut22r , selOut7r ,
                         selOut56r , selOut41r , selOut26r , selOut11r , selOut60r , selOut45r , selOut30r , selOut15r;
   always @(posedge clk)
     begin
        if (reset) begin
           decision  <= 0;
           selOut0r  <= 0;
           selOut1r  <= 0;
           selOut2r  <= 0;
           selOut3r  <= 0;
           selOut4r  <= 0;
           selOut5r  <= 0;
           selOut6r  <= 0;
           selOut7r  <= 0;
           selOut8r  <= 0;
           selOut9r  <= 0;
           selOut10r <= 0;
           selOut11r <= 0;
           selOut12r <= 0;
           selOut13r <= 0;
           selOut14r <= 0;
           selOut15r <= 0;
           selOut16r <= 0;
           selOut17r <= 0;
           selOut18r <= 0;
           selOut19r <= 0;
           selOut20r <= 0;
           selOut31r <= 0;
           selOut32r <= 0;
           selOut33r <= 0;
           selOut34r <= 0;
           selOut35r <= 0;
           selOut36r <= 0;
           selOut37r <= 0;
           selOut38r <= 0;
           selOut39r <= 0;
           selOut40r <= 0;
           selOut41r <= 0;
           selOut42r <= 0;
           selOut43r <= 0;
           selOut44r <= 0;
           selOut45r <= 0;
           selOut46r <= 0;
           selOut47r <= 0;
           selOut48r <= 0;
           selOut49r <= 0;
           selOut50r <= 0;
           selOut51r <= 0;
           selOut52r <= 0;
           selOut53r <= 0;
           selOut54r <= 0;
           selOut55r <= 0;
           selOut56r <= 0;
           selOut57r <= 0;
           selOut58r <= 0;
           selOut59r <= 0;
           selOut60r <= 0;
           selOut61r <= 0;
           selOut62r <= 0;
           selOut63r <= 0;           
        end
        else if (symEn_maxMetDly) begin
           selOut0r  <= selOut0 ;
           selOut1r  <= selOut1 ;
           selOut2r  <= selOut2 ;
           selOut3r  <= selOut3 ;
           selOut4r  <= selOut4 ;
           selOut5r  <= selOut5 ;
           selOut6r  <= selOut6 ;
           selOut7r  <= selOut7 ;
           selOut8r  <= selOut8 ;
           selOut9r  <= selOut9 ;
           selOut10r <= selOut10;
           selOut11r <= selOut11;
           selOut12r <= selOut12;
           selOut13r <= selOut13;
           selOut14r <= selOut14;
           selOut15r <= selOut15;
           selOut16r <= selOut16;
           selOut17r <= selOut17;
           selOut18r <= selOut18;
           selOut19r <= selOut19;
           selOut20r <= selOut20;
           selOut31r <= selOut31;
           selOut32r <= selOut32;
           selOut33r <= selOut33;
           selOut34r <= selOut34;
           selOut35r <= selOut35;
           selOut36r <= selOut36;
           selOut37r <= selOut37;
           selOut38r <= selOut38;
           selOut39r <= selOut39;
           selOut40r <= selOut40;
           selOut41r <= selOut41;
           selOut42r <= selOut42;
           selOut43r <= selOut43;
           selOut44r <= selOut44;
           selOut45r <= selOut45;
           selOut46r <= selOut46;
           selOut47r <= selOut47;
           selOut48r <= selOut48;
           selOut49r <= selOut49;
           selOut50r <= selOut50;
           selOut51r <= selOut51;
           selOut52r <= selOut52;
           selOut53r <= selOut53;
           selOut54r <= selOut54;
           selOut55r <= selOut55;
           selOut56r <= selOut56;
           selOut57r <= selOut57;
           selOut58r <= selOut58;
           selOut59r <= selOut59;
           selOut60r <= selOut60;
           selOut61r <= selOut61;
           selOut62r <= selOut62;
           selOut63r <= selOut63;           
           case (index)
             0 : begin decision <= selOut0r ; end
             1 : begin decision <= selOut1r ; end
             2 : begin decision <= selOut2r ; end
             3 : begin decision <= selOut3r ; end
             4 : begin decision <= selOut4r ; end
             5 : begin decision <= selOut5r ; end
             6 : begin decision <= selOut6r ; end
             7 : begin decision <= selOut7r ; end
             8 : begin decision <= selOut8r ; end
             9 : begin decision <= selOut9r ; end
             10: begin decision <= selOut10r; end
             11: begin decision <= selOut11r; end
             12: begin decision <= selOut12r; end
             13: begin decision <= selOut13r; end
             14: begin decision <= selOut14r; end
             15: begin decision <= selOut15r; end
             16: begin decision <= selOut16r; end
             17: begin decision <= selOut17r; end
             18: begin decision <= selOut18r; end
             19: begin decision <= selOut19r; end
             20: begin decision <= selOut20r; end
             31: begin decision <= selOut31r; end
             32: begin decision <= selOut32r; end
             33: begin decision <= selOut33r; end
             34: begin decision <= selOut34r; end
             35: begin decision <= selOut35r; end
             36: begin decision <= selOut36r; end
             37: begin decision <= selOut37r; end
             38: begin decision <= selOut38r; end
             39: begin decision <= selOut39r; end
             40: begin decision <= selOut40r; end
             41: begin decision <= selOut41r; end
             42: begin decision <= selOut42r; end
             43: begin decision <= selOut43r; end
             44: begin decision <= selOut44r; end
             45: begin decision <= selOut45r; end
             46: begin decision <= selOut46r; end
             47: begin decision <= selOut47r; end
             48: begin decision <= selOut48r; end
             49: begin decision <= selOut49r; end
             50: begin decision <= selOut50r; end
             51: begin decision <= selOut51r; end
             52: begin decision <= selOut52r; end
             53: begin decision <= selOut53r; end
             54: begin decision <= selOut54r; end
             55: begin decision <= selOut55r; end
             56: begin decision <= selOut56r; end
             57: begin decision <= selOut57r; end
             58: begin decision <= selOut58r; end
             59: begin decision <= selOut59r; end
             60: begin decision <= selOut60r; end
             61: begin decision <= selOut61r; end
             62: begin decision <= selOut62r; end
             63: begin decision <= selOut63r; end
           endcase
        end  
     end

   

                                                                                                                                   
                                                                                                                                   
/* -----\/----- EXCLUDED -----\/-----
   // For the SOQPSK mode we have only 4 states so we don't need the large maxMetric module                                        
   comp4twosComp  #((size+4), 0)  soqpskMaxMetric                                                                                  
     (                                                                                                                             
      .clk    (clk         ), 
      .reset  (acsReset    ),
      .a      (accMetOut0), 
      .b      (accMetOut1), 
      .c      (accMetOut2), 
      .d      (accMetOut3), 
      .index  (indexTmp    ), 
      .maxVal (            )
      );
   
   
   reg                   everyOtherSymEn;
   wire                  symEnEven = everyOtherSymEn;

   
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
 -----/\----- EXCLUDED -----/\----- */
      


/* -----\/----- EXCLUDED -----\/-----
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
 -----/\----- EXCLUDED -----/\----- */
         

   

endmodule // viterbiMultiH