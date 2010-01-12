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
   //parameter             ACS_BITS = 12;
   parameter             ACS_BITS = 10;
   parameter             ROT_BITS = 8;
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
   output [ROT_BITS-1:0] phaseError;
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
   reg [ROT_BITS-1:0]    phaseError;
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
         
   wire                  s0, s49, s34, s19, s4, s53, s38, s23, s8, s57, s42, s27, s12, s61, s46, s31,
                         s16, s1, s50, s35, s20, s5, s54, s39, s24, s9, s58, s43, s28, s13, s62, s47,
                         s32, s17, s2, s51, s36, s21, s6, s55, s40, s25, s10, s59, s44, s29, s14, s63,
                         s48, s33, s18, s3, s52, s37, s22, s7, s56, s41, s26, s11, s60, s45, s30, s15;

   // ACS acc. normalization control signal
   reg [1:0] normSr;
   wire symEnAcs;
   always @(posedge clk)
     begin
        if (reset) begin
           normSr <= 0;
        end
        else if (symEnAcs) begin
           normSr <= {normSr[0], s0  | s49 | s34 | s19 | s4  | s53 | s38 | s23 |
                                 s8  | s57 | s42 | s27 | s12 | s61 | s46 | s31 |
                                 s16 | s1  | s50 | s35 | s20 | s5  | s54 | s39 |
                                 s24 | s9  | s58 | s43 | s28 | s13 | s62 | s47 |
                                 s32 | s17 | s2  | s51 | s36 | s21 | s6  | s55 |
                                 s40 | s25 | s10 | s59 | s44 | s29 | s14 | s63 |
                                 s48 | s33 | s18 | s3  | s52 | s37 | s22 | s7  |
                                 s56 | s41 | s26 | s11 | s60 | s45 | s30 | s15};
        end
     end
   wire s = (normSr==2'b01) ? 1 : 0; // edge trigger on the normailzation to prevent under saturation
   

   wire [1:0]            selOut0 , selOut49 , selOut34 , selOut19 , selOut4 , selOut53 , selOut38 , selOut23 , 
                         selOut8 , selOut57 , selOut42 , selOut27 , selOut12 , selOut61 , selOut46 , selOut31 ,
                         selOut16 , selOut1 , selOut50 , selOut35 , selOut20 , selOut5 , selOut54 , selOut39 , 
                         selOut24 , selOut9 , selOut58 , selOut43 , selOut28 , selOut13 , selOut62 , selOut47 , 
                         selOut32 , selOut17 , selOut2 , selOut51 , selOut36 , selOut21 , selOut6 , selOut55 , 
                         selOut40 , selOut25 , selOut10 , selOut59 , selOut44 , selOut29 , selOut14 , selOut63 ,
                         selOut48 , selOut33 , selOut18 , selOut3 , selOut52 , selOut37 , selOut22 , selOut7 ,
                         selOut56 , selOut41 , selOut26 , selOut11 , selOut60 , selOut45 , selOut30 , selOut15;
   /* -----\/----- EXCLUDED -----\/-----
   wire [MF_BITS-1:0]    iOut0, iOut49, iOut34, iOut19, iOut4, iOut53, iOut38, iOut23,
                         iOut8, iOut57, iOut42, iOut27, iOut12, iOut61, iOut46, iOut31,
                         iOut16, iOut1, iOut50, iOut35, iOut20, iOut5, iOut54, iOut39,
                         iOut24, iOut9, iOut58, iOut43, iOut28, iOut13, iOut62, iOut47,
                         iOut32, iOut17, iOut2, iOut51, iOut36, iOut21, iOut6, iOut55,
                         iOut40, iOut25, iOut10, iOut59, iOut44, iOut29, iOut14, iOut63,
                         iOut48, iOut33, iOut18, iOut3, iOut52, iOut37, iOut22, iOut7,
                         iOut56, iOut41, iOut26, iOut11, iOut60, iOut45, iOut30, iOut15;
    -----/\----- EXCLUDED -----/\----- */
   // The Imaginary part is used to compute the phaseError
   wire [ROT_BITS-1:0]   qOut0, qOut49, qOut34, qOut19, qOut4, qOut53, qOut38, qOut23,
                         qOut8, qOut57, qOut42, qOut27, qOut12, qOut61, qOut46, qOut31,
                         qOut16, qOut1, qOut50, qOut35, qOut20, qOut5, qOut54, qOut39,
                         qOut24, qOut9, qOut58, qOut43, qOut28, qOut13, qOut62, qOut47,
                         qOut32, qOut17, qOut2, qOut51, qOut36, qOut21, qOut6, qOut55,
                         qOut40, qOut25, qOut10, qOut59, qOut44, qOut29, qOut14, qOut63,
                         qOut48, qOut33, qOut18, qOut3, qOut52, qOut37, qOut22, qOut7,
                         qOut56, qOut41, qOut26, qOut11, qOut60, qOut45, qOut30, qOut15;

    wire [ACS_BITS-1:0]  accMuxOut0_0 ,  accMuxOut0_1 ,  accMuxOut0_2 ,  accMuxOut0_3,  
                         accMuxOut16_0,  accMuxOut16_1,  accMuxOut16_2,  accMuxOut16_3,
                         accMuxOut4_0 ,  accMuxOut4_1 ,  accMuxOut4_2 ,  accMuxOut4_3 ,
                         accMuxOut8_0 ,  accMuxOut8_1 ,  accMuxOut8_2 ,  accMuxOut8_3 ,
                         accMuxOut12_0,  accMuxOut12_1,  accMuxOut12_2,  accMuxOut12_3,
                         accMuxOut20_0,  accMuxOut20_1,  accMuxOut20_2,  accMuxOut20_3,
                         accMuxOut24_0,  accMuxOut24_1,  accMuxOut24_2,  accMuxOut24_3,
                         accMuxOut28_0,  accMuxOut28_1,  accMuxOut28_2,  accMuxOut28_3,
                         accMuxOut32_0,  accMuxOut32_1,  accMuxOut32_2,  accMuxOut32_3,
                         accMuxOut36_0,  accMuxOut36_1,  accMuxOut36_2,  accMuxOut36_3,
                         accMuxOut40_0,  accMuxOut40_1,  accMuxOut40_2,  accMuxOut40_3,
                         accMuxOut44_0,  accMuxOut44_1,  accMuxOut44_2,  accMuxOut44_3,
                         accMuxOut48_0,  accMuxOut48_1,  accMuxOut48_2,  accMuxOut48_3,
                         accMuxOut52_0,  accMuxOut52_1,  accMuxOut52_2,  accMuxOut52_3,
                         accMuxOut56_0,  accMuxOut56_1,  accMuxOut56_2,  accMuxOut56_3,
                         accMuxOut60_0,  accMuxOut60_1,  accMuxOut60_2,  accMuxOut60_3;
   wire                  symEnEvenRotMux;

   // symEnEven is the signal who indicate if we are in a 54 or 45 interval
   reg                   symEnEven;
   always @(posedge clk)
     begin
        if (reset) begin
           //symEnEven <= 0;
           symEnEven <= 1;
        end
        else begin 
           if (symEn) begin
              symEnEven <= ~ symEnEven;
           end
        end
      end

   wire [MF_BITS-1:0]   iMfInRot0, qMfInRot0,
                        iMfInRot1, qMfInRot1,
                        iMfInRot2, qMfInRot2,
                        iMfInRot3, qMfInRot3;

   rotMux #(MF_BITS) rotMux0     (.clk(clk), .reset(reset), .symEn(symEn), .sym2xEn(sym2xEn), .symEnEven(symEnEven), .mfI_45_0(mf_m3m3_54Real), .mfI_45_1(mf_m1m3_54Real), .mfI_45_2(mf_p1m3_54Real), .mfI_45_3(mf_p3m3_54Real), .mfI_54_0(mf_m3m3_45Real), .mfI_54_1(mf_m1m3_45Real), .mfI_54_2(mf_p1m3_45Real), .mfI_54_3(mf_p3m3_45Real), .mfQ_45_0(mf_m3m3_54Imag), .mfQ_45_1(mf_m1m3_54Imag), .mfQ_45_2(mf_p1m3_54Imag), .mfQ_45_3(mf_p3m3_54Imag), .mfQ_54_0(mf_m3m3_45Imag), .mfQ_54_1(mf_m1m3_45Imag), .mfQ_54_2(mf_p1m3_45Imag), .mfQ_54_3(mf_p3m3_45Imag), .iMfInRot(iMfInRot0), .qMfInRot(qMfInRot0), .symEnOut(symEnRotMux), .sym2xEnOut(sym2xEnRotMux), .symEnEvenOut(symEnEvenRotMux) );
   rotMux #(MF_BITS) rotMux1     (.clk(clk), .reset(reset), .symEn(symEn), .sym2xEn(sym2xEn), .symEnEven(symEnEven), .mfI_45_0(mf_m3m1_54Real), .mfI_45_1(mf_m1m1_54Real), .mfI_45_2(mf_p1m1_54Real), .mfI_45_3(mf_p3m1_54Real), .mfI_54_0(mf_m3m1_45Real), .mfI_54_1(mf_m1m1_45Real), .mfI_54_2(mf_p1m1_45Real), .mfI_54_3(mf_p3m1_45Real), .mfQ_45_0(mf_m3m1_54Imag), .mfQ_45_1(mf_m1m1_54Imag), .mfQ_45_2(mf_p1m1_54Imag), .mfQ_45_3(mf_p3m1_54Imag), .mfQ_54_0(mf_m3m1_45Imag), .mfQ_54_1(mf_m1m1_45Imag), .mfQ_54_2(mf_p1m1_45Imag), .mfQ_54_3(mf_p3m1_45Imag), .iMfInRot(iMfInRot1), .qMfInRot(qMfInRot1), .symEnOut(), .sym2xEnOut(), .symEnEvenOut() );
   rotMux #(MF_BITS) rotMux2     (.clk(clk), .reset(reset), .symEn(symEn), .sym2xEn(sym2xEn), .symEnEven(symEnEven), .mfI_45_0(mf_m3p1_54Real), .mfI_45_1(mf_m1p1_54Real), .mfI_45_2(mf_p1p1_54Real), .mfI_45_3(mf_p3p1_54Real), .mfI_54_0(mf_m3p1_45Real), .mfI_54_1(mf_m1p1_45Real), .mfI_54_2(mf_p1p1_45Real), .mfI_54_3(mf_p3p1_45Real), .mfQ_45_0(mf_m3p1_54Imag), .mfQ_45_1(mf_m1p1_54Imag), .mfQ_45_2(mf_p1p1_54Imag), .mfQ_45_3(mf_p3p1_54Imag), .mfQ_54_0(mf_m3p1_45Imag), .mfQ_54_1(mf_m1p1_45Imag), .mfQ_54_2(mf_p1p1_45Imag), .mfQ_54_3(mf_p3p1_45Imag), .iMfInRot(iMfInRot2), .qMfInRot(qMfInRot2), .symEnOut(), .sym2xEnOut(), .symEnEvenOut() );
   rotMux #(MF_BITS) rotMux3     (.clk(clk), .reset(reset), .symEn(symEn), .sym2xEn(sym2xEn), .symEnEven(symEnEven), .mfI_45_0(mf_m3p3_54Real), .mfI_45_1(mf_m1p3_54Real), .mfI_45_2(mf_p1p3_54Real), .mfI_45_3(mf_p3p3_54Real), .mfI_54_0(mf_m3p3_45Real), .mfI_54_1(mf_m1p3_45Real), .mfI_54_2(mf_p1p3_45Real), .mfI_54_3(mf_p3p3_45Real), .mfQ_45_0(mf_m3p3_54Imag), .mfQ_45_1(mf_m1p3_54Imag), .mfQ_45_2(mf_p1p3_54Imag), .mfQ_45_3(mf_p3p3_54Imag), .mfQ_54_0(mf_m3p3_45Imag), .mfQ_54_1(mf_m1p3_45Imag), .mfQ_54_2(mf_p1p3_45Imag), .mfQ_54_3(mf_p3p3_45Imag), .iMfInRot(iMfInRot3), .qMfInRot(qMfInRot3), .symEnOut(), .sym2xEnOut(), .symEnEvenOut() );

   //         h45 rot para  h54 rot param                                                                                                                                                      match filters                                           ACC metrics
   acsMultH #(0 ,11, 6, 1,  0 ,12, 8, 4, ACS_BITS, MF_BITS, ROT_BITS, 0)  acsMultH0    (.clk(clk), .reset(reset), .symEn(symEnRotMux), .sym2xEn(sym2xEnRotMux), .symEnEven(symEnEven), .symEnEvenRot(symEnEvenRotMux), .iMfInRot(iMfInRot0), .qMfInRot(qMfInRot0), .tilt(tilt), .accMetMuxOut_0(accMuxOut0_0 ), .accMetMuxOut_1(accMuxOut0_1 ), .accMetMuxOut_2(accMuxOut0_2 ), .accMetMuxOut_3(accMuxOut0_3 ), .selOut(selOut0 ), .normalizeIn(s), .normalizeOut(s0 ), .accMetOut(accMetOut0 ), .iOut(/*iOut0 */), .qOut(qOut0 ), .symEnOut(symEnAcs), .sym2xEnOut(sym2xEnAcs));
   acsMultH #(12, 7, 2,13,  12, 8, 4, 0, ACS_BITS, MF_BITS, ROT_BITS, 0)  acsMultH49   (.clk(clk), .reset(reset), .symEn(symEnRotMux), .sym2xEn(sym2xEnRotMux), .symEnEven(symEnEven), .symEnEvenRot(symEnEvenRotMux), .iMfInRot(iMfInRot1), .qMfInRot(qMfInRot1), .tilt(tilt), .accMetMuxOut_0(accMuxOut48_0), .accMetMuxOut_1(accMuxOut48_1), .accMetMuxOut_2(accMuxOut48_2), .accMetMuxOut_3(accMuxOut48_3), .selOut(selOut49), .normalizeIn(s), .normalizeOut(s49), .accMetOut(accMetOut49), .iOut(/*iOut49*/), .qOut(qOut49), .symEnOut(), .sym2xEnOut());
   acsMultH #( 8, 3,14, 9,  8 , 4, 0,12, ACS_BITS, MF_BITS, ROT_BITS, 0)  acsMultH34   (.clk(clk), .reset(reset), .symEn(symEnRotMux), .sym2xEn(sym2xEnRotMux), .symEnEven(symEnEven), .symEnEvenRot(symEnEvenRotMux), .iMfInRot(iMfInRot2), .qMfInRot(qMfInRot2), .tilt(tilt), .accMetMuxOut_0(accMuxOut32_0), .accMetMuxOut_1(accMuxOut32_1), .accMetMuxOut_2(accMuxOut32_2), .accMetMuxOut_3(accMuxOut32_3), .selOut(selOut34), .normalizeIn(s), .normalizeOut(s34), .accMetOut(accMetOut34), .iOut(/*iOut34*/), .qOut(qOut34), .symEnOut(), .sym2xEnOut());
   acsMultH #( 4,15,10, 5,  4 , 0,12, 8, ACS_BITS, MF_BITS, ROT_BITS, 0)  acsMultH19   (.clk(clk), .reset(reset), .symEn(symEnRotMux), .sym2xEn(sym2xEnRotMux), .symEnEven(symEnEven), .symEnEvenRot(symEnEvenRotMux), .iMfInRot(iMfInRot3), .qMfInRot(qMfInRot3), .tilt(tilt), .accMetMuxOut_0(accMuxOut16_0), .accMetMuxOut_1(accMuxOut16_1), .accMetMuxOut_2(accMuxOut16_2), .accMetMuxOut_3(accMuxOut16_3), .selOut(selOut19), .normalizeIn(s), .normalizeOut(s19), .accMetOut(accMetOut19), .iOut(/*iOut19*/), .qOut(qOut19), .symEnOut(), .sym2xEnOut());
   acsMultH #( 1,12, 7, 2,  1 ,13, 9, 5, ACS_BITS, MF_BITS, ROT_BITS, 0)  acsMultH4    (.clk(clk), .reset(reset), .symEn(symEnRotMux), .sym2xEn(sym2xEnRotMux), .symEnEven(symEnEven), .symEnEvenRot(symEnEvenRotMux), .iMfInRot(iMfInRot0), .qMfInRot(qMfInRot0), .tilt(tilt), .accMetMuxOut_0(accMuxOut4_0 ), .accMetMuxOut_1(accMuxOut4_1 ), .accMetMuxOut_2(accMuxOut4_2 ), .accMetMuxOut_3(accMuxOut4_3 ), .selOut(selOut4 ), .normalizeIn(s), .normalizeOut(s4 ), .accMetOut(accMetOut4 ), .iOut(/*iOut4 */), .qOut(qOut4 ), .symEnOut(), .sym2xEnOut());
   acsMultH #(13, 8, 3,14,  13, 9, 5, 1, ACS_BITS, MF_BITS, ROT_BITS, 0)  acsMultH53   (.clk(clk), .reset(reset), .symEn(symEnRotMux), .sym2xEn(sym2xEnRotMux), .symEnEven(symEnEven), .symEnEvenRot(symEnEvenRotMux), .iMfInRot(iMfInRot1), .qMfInRot(qMfInRot1), .tilt(tilt), .accMetMuxOut_0(accMuxOut52_0), .accMetMuxOut_1(accMuxOut52_1), .accMetMuxOut_2(accMuxOut52_2), .accMetMuxOut_3(accMuxOut52_3), .selOut(selOut53), .normalizeIn(s), .normalizeOut(s53), .accMetOut(accMetOut53), .iOut(/*iOut53*/), .qOut(qOut53), .symEnOut(), .sym2xEnOut());
   acsMultH #( 9, 4,15,10,   9, 5, 1,13, ACS_BITS, MF_BITS, ROT_BITS, 0)  acsMultH38   (.clk(clk), .reset(reset), .symEn(symEnRotMux), .sym2xEn(sym2xEnRotMux), .symEnEven(symEnEven), .symEnEvenRot(symEnEvenRotMux), .iMfInRot(iMfInRot2), .qMfInRot(qMfInRot2), .tilt(tilt), .accMetMuxOut_0(accMuxOut36_0), .accMetMuxOut_1(accMuxOut36_1), .accMetMuxOut_2(accMuxOut36_2), .accMetMuxOut_3(accMuxOut36_3), .selOut(selOut38), .normalizeIn(s), .normalizeOut(s38), .accMetOut(accMetOut38), .iOut(/*iOut38*/), .qOut(qOut38), .symEnOut(), .sym2xEnOut());
   acsMultH #( 5, 0,11, 6,   5, 1,13, 9, ACS_BITS, MF_BITS, ROT_BITS, 0)  acsMultH23   (.clk(clk), .reset(reset), .symEn(symEnRotMux), .sym2xEn(sym2xEnRotMux), .symEnEven(symEnEven), .symEnEvenRot(symEnEvenRotMux), .iMfInRot(iMfInRot3), .qMfInRot(qMfInRot3), .tilt(tilt), .accMetMuxOut_0(accMuxOut20_0), .accMetMuxOut_1(accMuxOut20_1), .accMetMuxOut_2(accMuxOut20_2), .accMetMuxOut_3(accMuxOut20_3), .selOut(selOut23), .normalizeIn(s), .normalizeOut(s23), .accMetOut(accMetOut23), .iOut(/*iOut23*/), .qOut(qOut23), .symEnOut(), .sym2xEnOut());
   acsMultH #( 2,13, 8, 3,   2,14,10, 6, ACS_BITS, MF_BITS, ROT_BITS, 0)  acsMultH8    (.clk(clk), .reset(reset), .symEn(symEnRotMux), .sym2xEn(sym2xEnRotMux), .symEnEven(symEnEven), .symEnEvenRot(symEnEvenRotMux), .iMfInRot(iMfInRot0), .qMfInRot(qMfInRot0), .tilt(tilt), .accMetMuxOut_0(accMuxOut8_0 ), .accMetMuxOut_1(accMuxOut8_1 ), .accMetMuxOut_2(accMuxOut8_2 ), .accMetMuxOut_3(accMuxOut8_3 ), .selOut(selOut8 ), .normalizeIn(s), .normalizeOut(s8 ), .accMetOut(accMetOut8 ), .iOut(/*iOut8 */), .qOut(qOut8 ), .symEnOut(), .sym2xEnOut());
   acsMultH #(14, 9, 4,15,  14,10, 6, 2, ACS_BITS, MF_BITS, ROT_BITS, 0)  acsMultH57   (.clk(clk), .reset(reset), .symEn(symEnRotMux), .sym2xEn(sym2xEnRotMux), .symEnEven(symEnEven), .symEnEvenRot(symEnEvenRotMux), .iMfInRot(iMfInRot1), .qMfInRot(qMfInRot1), .tilt(tilt), .accMetMuxOut_0(accMuxOut56_0), .accMetMuxOut_1(accMuxOut56_1), .accMetMuxOut_2(accMuxOut56_2), .accMetMuxOut_3(accMuxOut56_3), .selOut(selOut57), .normalizeIn(s), .normalizeOut(s57), .accMetOut(accMetOut57), .iOut(/*iOut57*/), .qOut(qOut57), .symEnOut(), .sym2xEnOut());
   acsMultH #(10, 5, 0,11,  10, 6, 2,14, ACS_BITS, MF_BITS, ROT_BITS, 0)  acsMultH42   (.clk(clk), .reset(reset), .symEn(symEnRotMux), .sym2xEn(sym2xEnRotMux), .symEnEven(symEnEven), .symEnEvenRot(symEnEvenRotMux), .iMfInRot(iMfInRot2), .qMfInRot(qMfInRot2), .tilt(tilt), .accMetMuxOut_0(accMuxOut40_0), .accMetMuxOut_1(accMuxOut40_1), .accMetMuxOut_2(accMuxOut40_2), .accMetMuxOut_3(accMuxOut40_3), .selOut(selOut42), .normalizeIn(s), .normalizeOut(s42), .accMetOut(accMetOut42), .iOut(/*iOut42*/), .qOut(qOut42), .symEnOut(), .sym2xEnOut());
   acsMultH #( 6, 1,12, 7,   6, 2,14,10, ACS_BITS, MF_BITS, ROT_BITS, 0)  acsMultH27   (.clk(clk), .reset(reset), .symEn(symEnRotMux), .sym2xEn(sym2xEnRotMux), .symEnEven(symEnEven), .symEnEvenRot(symEnEvenRotMux), .iMfInRot(iMfInRot3), .qMfInRot(qMfInRot3), .tilt(tilt), .accMetMuxOut_0(accMuxOut24_0), .accMetMuxOut_1(accMuxOut24_1), .accMetMuxOut_2(accMuxOut24_2), .accMetMuxOut_3(accMuxOut24_3), .selOut(selOut27), .normalizeIn(s), .normalizeOut(s27), .accMetOut(accMetOut27), .iOut(/*iOut27*/), .qOut(qOut27), .symEnOut(), .sym2xEnOut());
   acsMultH #( 3,14, 9, 4,   3,15,11, 7, ACS_BITS, MF_BITS, ROT_BITS, 0)  acsMultH12   (.clk(clk), .reset(reset), .symEn(symEnRotMux), .sym2xEn(sym2xEnRotMux), .symEnEven(symEnEven), .symEnEvenRot(symEnEvenRotMux), .iMfInRot(iMfInRot0), .qMfInRot(qMfInRot0), .tilt(tilt), .accMetMuxOut_0(accMuxOut12_0), .accMetMuxOut_1(accMuxOut12_1), .accMetMuxOut_2(accMuxOut12_2), .accMetMuxOut_3(accMuxOut12_3), .selOut(selOut12), .normalizeIn(s), .normalizeOut(s12), .accMetOut(accMetOut12), .iOut(/*iOut12*/), .qOut(qOut12), .symEnOut(), .sym2xEnOut());
   acsMultH #(15,10, 5, 0,  15,11, 7, 3, ACS_BITS, MF_BITS, ROT_BITS, 0)  acsMultH61   (.clk(clk), .reset(reset), .symEn(symEnRotMux), .sym2xEn(sym2xEnRotMux), .symEnEven(symEnEven), .symEnEvenRot(symEnEvenRotMux), .iMfInRot(iMfInRot1), .qMfInRot(qMfInRot1), .tilt(tilt), .accMetMuxOut_0(accMuxOut60_0), .accMetMuxOut_1(accMuxOut60_1), .accMetMuxOut_2(accMuxOut60_2), .accMetMuxOut_3(accMuxOut60_3), .selOut(selOut61), .normalizeIn(s), .normalizeOut(s61), .accMetOut(accMetOut61), .iOut(/*iOut61*/), .qOut(qOut61), .symEnOut(), .sym2xEnOut());
   acsMultH #(11, 6, 1,12,  11, 7, 3,15, ACS_BITS, MF_BITS, ROT_BITS, 0)  acsMultH46   (.clk(clk), .reset(reset), .symEn(symEnRotMux), .sym2xEn(sym2xEnRotMux), .symEnEven(symEnEven), .symEnEvenRot(symEnEvenRotMux), .iMfInRot(iMfInRot2), .qMfInRot(qMfInRot2), .tilt(tilt), .accMetMuxOut_0(accMuxOut44_0), .accMetMuxOut_1(accMuxOut44_1), .accMetMuxOut_2(accMuxOut44_2), .accMetMuxOut_3(accMuxOut44_3), .selOut(selOut46), .normalizeIn(s), .normalizeOut(s46), .accMetOut(accMetOut46), .iOut(/*iOut46*/), .qOut(qOut46), .symEnOut(), .sym2xEnOut());
   acsMultH #( 7, 2,13, 8,   7, 3,15,11, ACS_BITS, MF_BITS, ROT_BITS, 0)  acsMultH31   (.clk(clk), .reset(reset), .symEn(symEnRotMux), .sym2xEn(sym2xEnRotMux), .symEnEven(symEnEven), .symEnEvenRot(symEnEvenRotMux), .iMfInRot(iMfInRot3), .qMfInRot(qMfInRot3), .tilt(tilt), .accMetMuxOut_0(accMuxOut28_0), .accMetMuxOut_1(accMuxOut28_1), .accMetMuxOut_2(accMuxOut28_2), .accMetMuxOut_3(accMuxOut28_3), .selOut(selOut31), .normalizeIn(s), .normalizeOut(s31), .accMetOut(accMetOut31), .iOut(/*iOut31*/), .qOut(qOut31), .symEnOut(), .sym2xEnOut());
   acsMultH #( 4,15,10, 5,   4, 0,12, 8, ACS_BITS, MF_BITS, ROT_BITS, 0)  acsMultH16   (.clk(clk), .reset(reset), .symEn(symEnRotMux), .sym2xEn(sym2xEnRotMux), .symEnEven(symEnEven), .symEnEvenRot(symEnEvenRotMux), .iMfInRot(iMfInRot0), .qMfInRot(qMfInRot0), .tilt(tilt), .accMetMuxOut_0(accMuxOut16_0), .accMetMuxOut_1(accMuxOut16_1), .accMetMuxOut_2(accMuxOut16_2), .accMetMuxOut_3(accMuxOut16_3), .selOut(selOut16), .normalizeIn(s), .normalizeOut(s16), .accMetOut(accMetOut16), .iOut(/*iOut16*/), .qOut(qOut16), .symEnOut(), .sym2xEnOut());
   acsMultH #( 0,11, 6, 1,   0,12, 8, 4, ACS_BITS, MF_BITS, ROT_BITS, 0)  acsMultH1    (.clk(clk), .reset(reset), .symEn(symEnRotMux), .sym2xEn(sym2xEnRotMux), .symEnEven(symEnEven), .symEnEvenRot(symEnEvenRotMux), .iMfInRot(iMfInRot1), .qMfInRot(qMfInRot1), .tilt(tilt), .accMetMuxOut_0(accMuxOut0_0 ), .accMetMuxOut_1(accMuxOut0_1 ), .accMetMuxOut_2(accMuxOut0_2 ), .accMetMuxOut_3(accMuxOut0_3 ), .selOut(selOut1 ), .normalizeIn(s), .normalizeOut(s1 ), .accMetOut(accMetOut1 ), .iOut(/*iOut1 */), .qOut(qOut1 ), .symEnOut(), .sym2xEnOut());
   acsMultH #(12, 7, 2,13,  12, 8, 4, 0, ACS_BITS, MF_BITS, ROT_BITS, 0)  acsMultH50   (.clk(clk), .reset(reset), .symEn(symEnRotMux), .sym2xEn(sym2xEnRotMux), .symEnEven(symEnEven), .symEnEvenRot(symEnEvenRotMux), .iMfInRot(iMfInRot2), .qMfInRot(qMfInRot2), .tilt(tilt), .accMetMuxOut_0(accMuxOut48_0), .accMetMuxOut_1(accMuxOut48_1), .accMetMuxOut_2(accMuxOut48_2), .accMetMuxOut_3(accMuxOut48_3), .selOut(selOut50), .normalizeIn(s), .normalizeOut(s50), .accMetOut(accMetOut50), .iOut(/*iOut50*/), .qOut(qOut50), .symEnOut(), .sym2xEnOut());
   acsMultH #( 8, 3,14, 9,   8, 4, 0,12, ACS_BITS, MF_BITS, ROT_BITS, 0)  acsMultH35   (.clk(clk), .reset(reset), .symEn(symEnRotMux), .sym2xEn(sym2xEnRotMux), .symEnEven(symEnEven), .symEnEvenRot(symEnEvenRotMux), .iMfInRot(iMfInRot3), .qMfInRot(qMfInRot3), .tilt(tilt), .accMetMuxOut_0(accMuxOut32_0), .accMetMuxOut_1(accMuxOut32_1), .accMetMuxOut_2(accMuxOut32_2), .accMetMuxOut_3(accMuxOut32_3), .selOut(selOut35), .normalizeIn(s), .normalizeOut(s35), .accMetOut(accMetOut35), .iOut(/*iOut35*/), .qOut(qOut35), .symEnOut(), .sym2xEnOut());
   acsMultH #( 5, 0,11, 6,   5, 1,13, 9, ACS_BITS, MF_BITS, ROT_BITS, 0)  acsMultH20   (.clk(clk), .reset(reset), .symEn(symEnRotMux), .sym2xEn(sym2xEnRotMux), .symEnEven(symEnEven), .symEnEvenRot(symEnEvenRotMux), .iMfInRot(iMfInRot0), .qMfInRot(qMfInRot0), .tilt(tilt), .accMetMuxOut_0(accMuxOut20_0), .accMetMuxOut_1(accMuxOut20_1), .accMetMuxOut_2(accMuxOut20_2), .accMetMuxOut_3(accMuxOut20_3), .selOut(selOut20), .normalizeIn(s), .normalizeOut(s20), .accMetOut(accMetOut20), .iOut(/*iOut20*/), .qOut(qOut20), .symEnOut(), .sym2xEnOut());
   acsMultH #( 1,12, 7, 2,   1,13, 9, 5, ACS_BITS, MF_BITS, ROT_BITS, 0)  acsMultH5    (.clk(clk), .reset(reset), .symEn(symEnRotMux), .sym2xEn(sym2xEnRotMux), .symEnEven(symEnEven), .symEnEvenRot(symEnEvenRotMux), .iMfInRot(iMfInRot1), .qMfInRot(qMfInRot1), .tilt(tilt), .accMetMuxOut_0(accMuxOut4_0 ), .accMetMuxOut_1(accMuxOut4_1 ), .accMetMuxOut_2(accMuxOut4_2 ), .accMetMuxOut_3(accMuxOut4_3 ), .selOut(selOut5 ), .normalizeIn(s), .normalizeOut(s5 ), .accMetOut(accMetOut5 ), .iOut(/*iOut5 */), .qOut(qOut5 ), .symEnOut(), .sym2xEnOut());
   acsMultH #(13, 8, 3,14,  13, 9, 5, 1, ACS_BITS, MF_BITS, ROT_BITS, 0)  acsMultH54   (.clk(clk), .reset(reset), .symEn(symEnRotMux), .sym2xEn(sym2xEnRotMux), .symEnEven(symEnEven), .symEnEvenRot(symEnEvenRotMux), .iMfInRot(iMfInRot2), .qMfInRot(qMfInRot2), .tilt(tilt), .accMetMuxOut_0(accMuxOut52_0), .accMetMuxOut_1(accMuxOut52_1), .accMetMuxOut_2(accMuxOut52_2), .accMetMuxOut_3(accMuxOut52_3), .selOut(selOut54), .normalizeIn(s), .normalizeOut(s54), .accMetOut(accMetOut54), .iOut(/*iOut54*/), .qOut(qOut54), .symEnOut(), .sym2xEnOut());
   acsMultH #( 9, 4,15,10,   9, 5, 1,13, ACS_BITS, MF_BITS, ROT_BITS, 0)  acsMultH39   (.clk(clk), .reset(reset), .symEn(symEnRotMux), .sym2xEn(sym2xEnRotMux), .symEnEven(symEnEven), .symEnEvenRot(symEnEvenRotMux), .iMfInRot(iMfInRot3), .qMfInRot(qMfInRot3), .tilt(tilt), .accMetMuxOut_0(accMuxOut36_0), .accMetMuxOut_1(accMuxOut36_1), .accMetMuxOut_2(accMuxOut36_2), .accMetMuxOut_3(accMuxOut36_3), .selOut(selOut39), .normalizeIn(s), .normalizeOut(s39), .accMetOut(accMetOut39), .iOut(/*iOut39*/), .qOut(qOut39), .symEnOut(), .sym2xEnOut());
   acsMultH #( 6, 1,12, 7,   6, 2,14,10, ACS_BITS, MF_BITS, ROT_BITS, 0)  acsMultH24   (.clk(clk), .reset(reset), .symEn(symEnRotMux), .sym2xEn(sym2xEnRotMux), .symEnEven(symEnEven), .symEnEvenRot(symEnEvenRotMux), .iMfInRot(iMfInRot0), .qMfInRot(qMfInRot0), .tilt(tilt), .accMetMuxOut_0(accMuxOut24_0), .accMetMuxOut_1(accMuxOut24_1), .accMetMuxOut_2(accMuxOut24_2), .accMetMuxOut_3(accMuxOut24_3), .selOut(selOut24), .normalizeIn(s), .normalizeOut(s24), .accMetOut(accMetOut24), .iOut(/*iOut24*/), .qOut(qOut24), .symEnOut(), .sym2xEnOut());
   acsMultH #( 2,13, 8, 3,   2,14,10, 6, ACS_BITS, MF_BITS, ROT_BITS, 0)  acsMultH9    (.clk(clk), .reset(reset), .symEn(symEnRotMux), .sym2xEn(sym2xEnRotMux), .symEnEven(symEnEven), .symEnEvenRot(symEnEvenRotMux), .iMfInRot(iMfInRot1), .qMfInRot(qMfInRot1), .tilt(tilt), .accMetMuxOut_0(accMuxOut8_0 ), .accMetMuxOut_1(accMuxOut8_1 ), .accMetMuxOut_2(accMuxOut8_2 ), .accMetMuxOut_3(accMuxOut8_3 ), .selOut(selOut9 ), .normalizeIn(s), .normalizeOut(s9 ), .accMetOut(accMetOut9 ), .iOut(/*iOut9 */), .qOut(qOut9 ), .symEnOut(), .sym2xEnOut());
   acsMultH #( 14,9, 4,15,  14,10, 6, 2, ACS_BITS, MF_BITS, ROT_BITS, 0)  acsMultH58   (.clk(clk), .reset(reset), .symEn(symEnRotMux), .sym2xEn(sym2xEnRotMux), .symEnEven(symEnEven), .symEnEvenRot(symEnEvenRotMux), .iMfInRot(iMfInRot2), .qMfInRot(qMfInRot2), .tilt(tilt), .accMetMuxOut_0(accMuxOut56_0), .accMetMuxOut_1(accMuxOut56_1), .accMetMuxOut_2(accMuxOut56_2), .accMetMuxOut_3(accMuxOut56_3), .selOut(selOut58), .normalizeIn(s), .normalizeOut(s58), .accMetOut(accMetOut58), .iOut(/*iOut58*/), .qOut(qOut58), .symEnOut(), .sym2xEnOut());
   acsMultH #(10, 5, 0,11,  10, 6, 2,14, ACS_BITS, MF_BITS, ROT_BITS, 0)  acsMultH43   (.clk(clk), .reset(reset), .symEn(symEnRotMux), .sym2xEn(sym2xEnRotMux), .symEnEven(symEnEven), .symEnEvenRot(symEnEvenRotMux), .iMfInRot(iMfInRot3), .qMfInRot(qMfInRot3), .tilt(tilt), .accMetMuxOut_0(accMuxOut40_0), .accMetMuxOut_1(accMuxOut40_1), .accMetMuxOut_2(accMuxOut40_2), .accMetMuxOut_3(accMuxOut40_3), .selOut(selOut43), .normalizeIn(s), .normalizeOut(s43), .accMetOut(accMetOut43), .iOut(/*iOut43*/), .qOut(qOut43), .symEnOut(), .sym2xEnOut());
   acsMultH #( 7, 2,13, 8,   7, 3,15,11, ACS_BITS, MF_BITS, ROT_BITS, 0)  acsMultH28   (.clk(clk), .reset(reset), .symEn(symEnRotMux), .sym2xEn(sym2xEnRotMux), .symEnEven(symEnEven), .symEnEvenRot(symEnEvenRotMux), .iMfInRot(iMfInRot0), .qMfInRot(qMfInRot0), .tilt(tilt), .accMetMuxOut_0(accMuxOut28_0), .accMetMuxOut_1(accMuxOut28_1), .accMetMuxOut_2(accMuxOut28_2), .accMetMuxOut_3(accMuxOut28_3), .selOut(selOut28), .normalizeIn(s), .normalizeOut(s28), .accMetOut(accMetOut28), .iOut(/*iOut28*/), .qOut(qOut28), .symEnOut(), .sym2xEnOut());
   acsMultH #( 3,14, 9, 4,   3,15,11, 7, ACS_BITS, MF_BITS, ROT_BITS, 0)  acsMultH13   (.clk(clk), .reset(reset), .symEn(symEnRotMux), .sym2xEn(sym2xEnRotMux), .symEnEven(symEnEven), .symEnEvenRot(symEnEvenRotMux), .iMfInRot(iMfInRot1), .qMfInRot(qMfInRot1), .tilt(tilt), .accMetMuxOut_0(accMuxOut12_0), .accMetMuxOut_1(accMuxOut12_1), .accMetMuxOut_2(accMuxOut12_2), .accMetMuxOut_3(accMuxOut12_3), .selOut(selOut13), .normalizeIn(s), .normalizeOut(s13), .accMetOut(accMetOut13), .iOut(/*iOut13*/), .qOut(qOut13), .symEnOut(), .sym2xEnOut());
   acsMultH #(15,10, 5, 0,  15,11, 7, 3, ACS_BITS, MF_BITS, ROT_BITS, 0)  acsMultH62   (.clk(clk), .reset(reset), .symEn(symEnRotMux), .sym2xEn(sym2xEnRotMux), .symEnEven(symEnEven), .symEnEvenRot(symEnEvenRotMux), .iMfInRot(iMfInRot2), .qMfInRot(qMfInRot2), .tilt(tilt), .accMetMuxOut_0(accMuxOut60_0), .accMetMuxOut_1(accMuxOut60_1), .accMetMuxOut_2(accMuxOut60_2), .accMetMuxOut_3(accMuxOut60_3), .selOut(selOut62), .normalizeIn(s), .normalizeOut(s62), .accMetOut(accMetOut62), .iOut(/*iOut62*/), .qOut(qOut62), .symEnOut(), .sym2xEnOut());
   acsMultH #(11, 6, 1,12,  11, 7, 3,15, ACS_BITS, MF_BITS, ROT_BITS, 0)  acsMultH47   (.clk(clk), .reset(reset), .symEn(symEnRotMux), .sym2xEn(sym2xEnRotMux), .symEnEven(symEnEven), .symEnEvenRot(symEnEvenRotMux), .iMfInRot(iMfInRot3), .qMfInRot(qMfInRot3), .tilt(tilt), .accMetMuxOut_0(accMuxOut44_0), .accMetMuxOut_1(accMuxOut44_1), .accMetMuxOut_2(accMuxOut44_2), .accMetMuxOut_3(accMuxOut44_3), .selOut(selOut47), .normalizeIn(s), .normalizeOut(s47), .accMetOut(accMetOut47), .iOut(/*iOut47*/), .qOut(qOut47), .symEnOut(), .sym2xEnOut());
   acsMultH #( 8, 3,14, 9,   8, 4, 0,12, ACS_BITS, MF_BITS, ROT_BITS, 0)  acsMultH32   (.clk(clk), .reset(reset), .symEn(symEnRotMux), .sym2xEn(sym2xEnRotMux), .symEnEven(symEnEven), .symEnEvenRot(symEnEvenRotMux), .iMfInRot(iMfInRot0), .qMfInRot(qMfInRot0), .tilt(tilt), .accMetMuxOut_0(accMuxOut32_0), .accMetMuxOut_1(accMuxOut32_1), .accMetMuxOut_2(accMuxOut32_2), .accMetMuxOut_3(accMuxOut32_3), .selOut(selOut32), .normalizeIn(s), .normalizeOut(s32), .accMetOut(accMetOut32), .iOut(/*iOut32*/), .qOut(qOut32), .symEnOut(), .sym2xEnOut());
   acsMultH #( 4,15,10, 5,   4, 0,12, 8, ACS_BITS, MF_BITS, ROT_BITS, 0)  acsMultH17   (.clk(clk), .reset(reset), .symEn(symEnRotMux), .sym2xEn(sym2xEnRotMux), .symEnEven(symEnEven), .symEnEvenRot(symEnEvenRotMux), .iMfInRot(iMfInRot1), .qMfInRot(qMfInRot1), .tilt(tilt), .accMetMuxOut_0(accMuxOut16_0), .accMetMuxOut_1(accMuxOut16_1), .accMetMuxOut_2(accMuxOut16_2), .accMetMuxOut_3(accMuxOut16_3), .selOut(selOut17), .normalizeIn(s), .normalizeOut(s17), .accMetOut(accMetOut17), .iOut(/*iOut17*/), .qOut(qOut17), .symEnOut(), .sym2xEnOut());
   acsMultH #( 0,11, 6, 1,   0,12, 8, 4, ACS_BITS, MF_BITS, ROT_BITS, 0)  acsMultH2    (.clk(clk), .reset(reset), .symEn(symEnRotMux), .sym2xEn(sym2xEnRotMux), .symEnEven(symEnEven), .symEnEvenRot(symEnEvenRotMux), .iMfInRot(iMfInRot2), .qMfInRot(qMfInRot2), .tilt(tilt), .accMetMuxOut_0(accMuxOut0_0 ), .accMetMuxOut_1(accMuxOut0_1 ), .accMetMuxOut_2(accMuxOut0_2 ), .accMetMuxOut_3(accMuxOut0_3 ), .selOut(selOut2 ), .normalizeIn(s), .normalizeOut(s2 ), .accMetOut(accMetOut2 ), .iOut(/*iOut2 */), .qOut(qOut2 ), .symEnOut(), .sym2xEnOut());
   acsMultH #(12, 7, 2,13,  12, 8, 4, 0, ACS_BITS, MF_BITS, ROT_BITS, 0)  acsMultH51   (.clk(clk), .reset(reset), .symEn(symEnRotMux), .sym2xEn(sym2xEnRotMux), .symEnEven(symEnEven), .symEnEvenRot(symEnEvenRotMux), .iMfInRot(iMfInRot3), .qMfInRot(qMfInRot3), .tilt(tilt), .accMetMuxOut_0(accMuxOut48_0), .accMetMuxOut_1(accMuxOut48_1), .accMetMuxOut_2(accMuxOut48_2), .accMetMuxOut_3(accMuxOut48_3), .selOut(selOut51), .normalizeIn(s), .normalizeOut(s51), .accMetOut(accMetOut51), .iOut(/*iOut51*/), .qOut(qOut51), .symEnOut(), .sym2xEnOut());
   acsMultH #( 9, 4,15,10,   9, 5, 1,13, ACS_BITS, MF_BITS, ROT_BITS, 0)  acsMultH36   (.clk(clk), .reset(reset), .symEn(symEnRotMux), .sym2xEn(sym2xEnRotMux), .symEnEven(symEnEven), .symEnEvenRot(symEnEvenRotMux), .iMfInRot(iMfInRot0), .qMfInRot(qMfInRot0), .tilt(tilt), .accMetMuxOut_0(accMuxOut36_0), .accMetMuxOut_1(accMuxOut36_1), .accMetMuxOut_2(accMuxOut36_2), .accMetMuxOut_3(accMuxOut36_3), .selOut(selOut36), .normalizeIn(s), .normalizeOut(s36), .accMetOut(accMetOut36), .iOut(/*iOut36*/), .qOut(qOut36), .symEnOut(), .sym2xEnOut());
   acsMultH #( 5, 0,11, 6,   5, 1,13, 9, ACS_BITS, MF_BITS, ROT_BITS, 0)  acsMultH21   (.clk(clk), .reset(reset), .symEn(symEnRotMux), .sym2xEn(sym2xEnRotMux), .symEnEven(symEnEven), .symEnEvenRot(symEnEvenRotMux), .iMfInRot(iMfInRot1), .qMfInRot(qMfInRot1), .tilt(tilt), .accMetMuxOut_0(accMuxOut20_0), .accMetMuxOut_1(accMuxOut20_1), .accMetMuxOut_2(accMuxOut20_2), .accMetMuxOut_3(accMuxOut20_3), .selOut(selOut21), .normalizeIn(s), .normalizeOut(s21), .accMetOut(accMetOut21), .iOut(/*iOut21*/), .qOut(qOut21), .symEnOut(), .sym2xEnOut());
   acsMultH #( 1,12, 7, 2,   1,13, 9, 5, ACS_BITS, MF_BITS, ROT_BITS, 0)  acsMultH6    (.clk(clk), .reset(reset), .symEn(symEnRotMux), .sym2xEn(sym2xEnRotMux), .symEnEven(symEnEven), .symEnEvenRot(symEnEvenRotMux), .iMfInRot(iMfInRot2), .qMfInRot(qMfInRot2), .tilt(tilt), .accMetMuxOut_0(accMuxOut4_0 ), .accMetMuxOut_1(accMuxOut4_1 ), .accMetMuxOut_2(accMuxOut4_2 ), .accMetMuxOut_3(accMuxOut4_3 ), .selOut(selOut6 ), .normalizeIn(s), .normalizeOut(s6 ), .accMetOut(accMetOut6 ), .iOut(/*iOut6 */), .qOut(qOut6 ), .symEnOut(), .sym2xEnOut());
   acsMultH #(13, 8, 3,14,  13, 9, 5, 1, ACS_BITS, MF_BITS, ROT_BITS, 0)  acsMultH55   (.clk(clk), .reset(reset), .symEn(symEnRotMux), .sym2xEn(sym2xEnRotMux), .symEnEven(symEnEven), .symEnEvenRot(symEnEvenRotMux), .iMfInRot(iMfInRot3), .qMfInRot(qMfInRot3), .tilt(tilt), .accMetMuxOut_0(accMuxOut52_0), .accMetMuxOut_1(accMuxOut52_1), .accMetMuxOut_2(accMuxOut52_2), .accMetMuxOut_3(accMuxOut52_3), .selOut(selOut55), .normalizeIn(s), .normalizeOut(s55), .accMetOut(accMetOut55), .iOut(/*iOut55*/), .qOut(qOut55), .symEnOut(), .sym2xEnOut());
   acsMultH #(10, 5, 0,11,  10, 6, 2,14, ACS_BITS, MF_BITS, ROT_BITS, 0)  acsMultH40   (.clk(clk), .reset(reset), .symEn(symEnRotMux), .sym2xEn(sym2xEnRotMux), .symEnEven(symEnEven), .symEnEvenRot(symEnEvenRotMux), .iMfInRot(iMfInRot0), .qMfInRot(qMfInRot0), .tilt(tilt), .accMetMuxOut_0(accMuxOut40_0), .accMetMuxOut_1(accMuxOut40_1), .accMetMuxOut_2(accMuxOut40_2), .accMetMuxOut_3(accMuxOut40_3), .selOut(selOut40), .normalizeIn(s), .normalizeOut(s40), .accMetOut(accMetOut40), .iOut(/*iOut40*/), .qOut(qOut40), .symEnOut(), .sym2xEnOut());
   acsMultH #( 6, 1,12, 7,   6, 2,14,10, ACS_BITS, MF_BITS, ROT_BITS, 0)  acsMultH25   (.clk(clk), .reset(reset), .symEn(symEnRotMux), .sym2xEn(sym2xEnRotMux), .symEnEven(symEnEven), .symEnEvenRot(symEnEvenRotMux), .iMfInRot(iMfInRot1), .qMfInRot(qMfInRot1), .tilt(tilt), .accMetMuxOut_0(accMuxOut24_0), .accMetMuxOut_1(accMuxOut24_1), .accMetMuxOut_2(accMuxOut24_2), .accMetMuxOut_3(accMuxOut24_3), .selOut(selOut25), .normalizeIn(s), .normalizeOut(s25), .accMetOut(accMetOut25), .iOut(/*iOut25*/), .qOut(qOut25), .symEnOut(), .sym2xEnOut());
   acsMultH #( 2,13, 8, 3,   2,14,10, 6, ACS_BITS, MF_BITS, ROT_BITS, 0)  acsMultH10   (.clk(clk), .reset(reset), .symEn(symEnRotMux), .sym2xEn(sym2xEnRotMux), .symEnEven(symEnEven), .symEnEvenRot(symEnEvenRotMux), .iMfInRot(iMfInRot2), .qMfInRot(qMfInRot2), .tilt(tilt), .accMetMuxOut_0(accMuxOut8_0 ), .accMetMuxOut_1(accMuxOut8_1 ), .accMetMuxOut_2(accMuxOut8_2 ), .accMetMuxOut_3(accMuxOut8_3 ), .selOut(selOut10), .normalizeIn(s), .normalizeOut(s10), .accMetOut(accMetOut10), .iOut(/*iOut10*/), .qOut(qOut10), .symEnOut(), .sym2xEnOut());
   acsMultH #(14, 9, 4,15,  14,10, 6, 2, ACS_BITS, MF_BITS, ROT_BITS, 0)  acsMultH59   (.clk(clk), .reset(reset), .symEn(symEnRotMux), .sym2xEn(sym2xEnRotMux), .symEnEven(symEnEven), .symEnEvenRot(symEnEvenRotMux), .iMfInRot(iMfInRot3), .qMfInRot(qMfInRot3), .tilt(tilt), .accMetMuxOut_0(accMuxOut56_0), .accMetMuxOut_1(accMuxOut56_1), .accMetMuxOut_2(accMuxOut56_2), .accMetMuxOut_3(accMuxOut56_3), .selOut(selOut59), .normalizeIn(s), .normalizeOut(s59), .accMetOut(accMetOut59), .iOut(/*iOut59*/), .qOut(qOut59), .symEnOut(), .sym2xEnOut());
   acsMultH #(11, 6, 1,12,  11, 7, 3,15, ACS_BITS, MF_BITS, ROT_BITS, 0)  acsMultH44   (.clk(clk), .reset(reset), .symEn(symEnRotMux), .sym2xEn(sym2xEnRotMux), .symEnEven(symEnEven), .symEnEvenRot(symEnEvenRotMux), .iMfInRot(iMfInRot0), .qMfInRot(qMfInRot0), .tilt(tilt), .accMetMuxOut_0(accMuxOut44_0), .accMetMuxOut_1(accMuxOut44_1), .accMetMuxOut_2(accMuxOut44_2), .accMetMuxOut_3(accMuxOut44_3), .selOut(selOut44), .normalizeIn(s), .normalizeOut(s44), .accMetOut(accMetOut44), .iOut(/*iOut44*/), .qOut(qOut44), .symEnOut(), .sym2xEnOut());
   acsMultH #( 7, 2,13, 8,   7, 3,15,11, ACS_BITS, MF_BITS, ROT_BITS, 0)  acsMultH29   (.clk(clk), .reset(reset), .symEn(symEnRotMux), .sym2xEn(sym2xEnRotMux), .symEnEven(symEnEven), .symEnEvenRot(symEnEvenRotMux), .iMfInRot(iMfInRot1), .qMfInRot(qMfInRot1), .tilt(tilt), .accMetMuxOut_0(accMuxOut28_0), .accMetMuxOut_1(accMuxOut28_1), .accMetMuxOut_2(accMuxOut28_2), .accMetMuxOut_3(accMuxOut28_3), .selOut(selOut29), .normalizeIn(s), .normalizeOut(s29), .accMetOut(accMetOut29), .iOut(/*iOut29*/), .qOut(qOut29), .symEnOut(), .sym2xEnOut());
   acsMultH #( 3,14, 9, 4,   3,15,11, 7, ACS_BITS, MF_BITS, ROT_BITS, 0)  acsMultH14   (.clk(clk), .reset(reset), .symEn(symEnRotMux), .sym2xEn(sym2xEnRotMux), .symEnEven(symEnEven), .symEnEvenRot(symEnEvenRotMux), .iMfInRot(iMfInRot2), .qMfInRot(qMfInRot2), .tilt(tilt), .accMetMuxOut_0(accMuxOut12_0), .accMetMuxOut_1(accMuxOut12_1), .accMetMuxOut_2(accMuxOut12_2), .accMetMuxOut_3(accMuxOut12_3), .selOut(selOut14), .normalizeIn(s), .normalizeOut(s14), .accMetOut(accMetOut14), .iOut(/*iOut14*/), .qOut(qOut14), .symEnOut(), .sym2xEnOut());
   acsMultH #(15,10, 5, 0,  15,11, 7, 3, ACS_BITS, MF_BITS, ROT_BITS, 0)  acsMultH63   (.clk(clk), .reset(reset), .symEn(symEnRotMux), .sym2xEn(sym2xEnRotMux), .symEnEven(symEnEven), .symEnEvenRot(symEnEvenRotMux), .iMfInRot(iMfInRot3), .qMfInRot(qMfInRot3), .tilt(tilt), .accMetMuxOut_0(accMuxOut60_0), .accMetMuxOut_1(accMuxOut60_1), .accMetMuxOut_2(accMuxOut60_2), .accMetMuxOut_3(accMuxOut60_3), .selOut(selOut63), .normalizeIn(s), .normalizeOut(s63), .accMetOut(accMetOut63), .iOut(/*iOut63*/), .qOut(qOut63), .symEnOut(), .sym2xEnOut());
   acsMultH #(12, 7, 2,13,  12, 8, 4, 0, ACS_BITS, MF_BITS, ROT_BITS, 0)  acsMultH48   (.clk(clk), .reset(reset), .symEn(symEnRotMux), .sym2xEn(sym2xEnRotMux), .symEnEven(symEnEven), .symEnEvenRot(symEnEvenRotMux), .iMfInRot(iMfInRot0), .qMfInRot(qMfInRot0), .tilt(tilt), .accMetMuxOut_0(accMuxOut48_0), .accMetMuxOut_1(accMuxOut48_1), .accMetMuxOut_2(accMuxOut48_2), .accMetMuxOut_3(accMuxOut48_3), .selOut(selOut48), .normalizeIn(s), .normalizeOut(s48), .accMetOut(accMetOut48), .iOut(/*iOut48*/), .qOut(qOut48), .symEnOut(), .sym2xEnOut());
   acsMultH #( 8, 3,14, 9,   8, 4, 0,12, ACS_BITS, MF_BITS, ROT_BITS, 0)  acsMultH33   (.clk(clk), .reset(reset), .symEn(symEnRotMux), .sym2xEn(sym2xEnRotMux), .symEnEven(symEnEven), .symEnEvenRot(symEnEvenRotMux), .iMfInRot(iMfInRot1), .qMfInRot(qMfInRot1), .tilt(tilt), .accMetMuxOut_0(accMuxOut32_0), .accMetMuxOut_1(accMuxOut32_1), .accMetMuxOut_2(accMuxOut32_2), .accMetMuxOut_3(accMuxOut32_3), .selOut(selOut33), .normalizeIn(s), .normalizeOut(s33), .accMetOut(accMetOut33), .iOut(/*iOut33*/), .qOut(qOut33), .symEnOut(), .sym2xEnOut());
   acsMultH #( 4,15,10, 5,   4, 0,12, 8, ACS_BITS, MF_BITS, ROT_BITS, 0)  acsMultH18   (.clk(clk), .reset(reset), .symEn(symEnRotMux), .sym2xEn(sym2xEnRotMux), .symEnEven(symEnEven), .symEnEvenRot(symEnEvenRotMux), .iMfInRot(iMfInRot2), .qMfInRot(qMfInRot2), .tilt(tilt), .accMetMuxOut_0(accMuxOut16_0), .accMetMuxOut_1(accMuxOut16_1), .accMetMuxOut_2(accMuxOut16_2), .accMetMuxOut_3(accMuxOut16_3), .selOut(selOut18), .normalizeIn(s), .normalizeOut(s18), .accMetOut(accMetOut18), .iOut(/*iOut18*/), .qOut(qOut18), .symEnOut(), .sym2xEnOut());
   acsMultH #( 0,11, 6, 1,   0,12, 8, 4, ACS_BITS, MF_BITS, ROT_BITS, 0)  acsMultH3    (.clk(clk), .reset(reset), .symEn(symEnRotMux), .sym2xEn(sym2xEnRotMux), .symEnEven(symEnEven), .symEnEvenRot(symEnEvenRotMux), .iMfInRot(iMfInRot3), .qMfInRot(qMfInRot3), .tilt(tilt), .accMetMuxOut_0(accMuxOut0_0 ), .accMetMuxOut_1(accMuxOut0_1 ), .accMetMuxOut_2(accMuxOut0_2 ), .accMetMuxOut_3(accMuxOut0_3 ), .selOut(selOut3 ), .normalizeIn(s), .normalizeOut(s3 ), .accMetOut(accMetOut3 ), .iOut(/*iOut3 */), .qOut(qOut3 ), .symEnOut(), .sym2xEnOut());
   acsMultH #(13, 8, 3,14,  13, 9, 5, 1, ACS_BITS, MF_BITS, ROT_BITS, 0)  acsMultH52   (.clk(clk), .reset(reset), .symEn(symEnRotMux), .sym2xEn(sym2xEnRotMux), .symEnEven(symEnEven), .symEnEvenRot(symEnEvenRotMux), .iMfInRot(iMfInRot0), .qMfInRot(qMfInRot0), .tilt(tilt), .accMetMuxOut_0(accMuxOut52_0), .accMetMuxOut_1(accMuxOut52_1), .accMetMuxOut_2(accMuxOut52_2), .accMetMuxOut_3(accMuxOut52_3), .selOut(selOut52), .normalizeIn(s), .normalizeOut(s52), .accMetOut(accMetOut52), .iOut(/*iOut52*/), .qOut(qOut52), .symEnOut(), .sym2xEnOut());
   acsMultH #( 9, 4,15,10,   9, 5, 1,13, ACS_BITS, MF_BITS, ROT_BITS, 0)  acsMultH37   (.clk(clk), .reset(reset), .symEn(symEnRotMux), .sym2xEn(sym2xEnRotMux), .symEnEven(symEnEven), .symEnEvenRot(symEnEvenRotMux), .iMfInRot(iMfInRot1), .qMfInRot(qMfInRot1), .tilt(tilt), .accMetMuxOut_0(accMuxOut36_0), .accMetMuxOut_1(accMuxOut36_1), .accMetMuxOut_2(accMuxOut36_2), .accMetMuxOut_3(accMuxOut36_3), .selOut(selOut37), .normalizeIn(s), .normalizeOut(s37), .accMetOut(accMetOut37), .iOut(/*iOut37*/), .qOut(qOut37), .symEnOut(), .sym2xEnOut());
   acsMultH #( 5, 0,11, 6,   5, 1,13, 9, ACS_BITS, MF_BITS, ROT_BITS, 0)  acsMultH22   (.clk(clk), .reset(reset), .symEn(symEnRotMux), .sym2xEn(sym2xEnRotMux), .symEnEven(symEnEven), .symEnEvenRot(symEnEvenRotMux), .iMfInRot(iMfInRot2), .qMfInRot(qMfInRot2), .tilt(tilt), .accMetMuxOut_0(accMuxOut20_0), .accMetMuxOut_1(accMuxOut20_1), .accMetMuxOut_2(accMuxOut20_2), .accMetMuxOut_3(accMuxOut20_3), .selOut(selOut22), .normalizeIn(s), .normalizeOut(s22), .accMetOut(accMetOut22), .iOut(/*iOut22*/), .qOut(qOut22), .symEnOut(), .sym2xEnOut());
   acsMultH #( 1,12, 7, 2,   1,13, 9, 5, ACS_BITS, MF_BITS, ROT_BITS, 0)  acsMultH7    (.clk(clk), .reset(reset), .symEn(symEnRotMux), .sym2xEn(sym2xEnRotMux), .symEnEven(symEnEven), .symEnEvenRot(symEnEvenRotMux), .iMfInRot(iMfInRot3), .qMfInRot(qMfInRot3), .tilt(tilt), .accMetMuxOut_0(accMuxOut4_0 ), .accMetMuxOut_1(accMuxOut4_1 ), .accMetMuxOut_2(accMuxOut4_2 ), .accMetMuxOut_3(accMuxOut4_3 ), .selOut(selOut7 ), .normalizeIn(s), .normalizeOut(s7 ), .accMetOut(accMetOut7 ), .iOut(/*iOut7 */), .qOut(qOut7 ), .symEnOut(), .sym2xEnOut());
   acsMultH #(14, 9, 4,15,  14,10, 6, 2, ACS_BITS, MF_BITS, ROT_BITS, 0)  acsMultH56   (.clk(clk), .reset(reset), .symEn(symEnRotMux), .sym2xEn(sym2xEnRotMux), .symEnEven(symEnEven), .symEnEvenRot(symEnEvenRotMux), .iMfInRot(iMfInRot0), .qMfInRot(qMfInRot0), .tilt(tilt), .accMetMuxOut_0(accMuxOut56_0), .accMetMuxOut_1(accMuxOut56_1), .accMetMuxOut_2(accMuxOut56_2), .accMetMuxOut_3(accMuxOut56_3), .selOut(selOut56), .normalizeIn(s), .normalizeOut(s56), .accMetOut(accMetOut56), .iOut(/*iOut56*/), .qOut(qOut56), .symEnOut(), .sym2xEnOut());
   acsMultH #(10, 5, 0,11,  10, 6, 2,14, ACS_BITS, MF_BITS, ROT_BITS, 0)  acsMultH41   (.clk(clk), .reset(reset), .symEn(symEnRotMux), .sym2xEn(sym2xEnRotMux), .symEnEven(symEnEven), .symEnEvenRot(symEnEvenRotMux), .iMfInRot(iMfInRot1), .qMfInRot(qMfInRot1), .tilt(tilt), .accMetMuxOut_0(accMuxOut40_0), .accMetMuxOut_1(accMuxOut40_1), .accMetMuxOut_2(accMuxOut40_2), .accMetMuxOut_3(accMuxOut40_3), .selOut(selOut41), .normalizeIn(s), .normalizeOut(s41), .accMetOut(accMetOut41), .iOut(/*iOut41*/), .qOut(qOut41), .symEnOut(), .sym2xEnOut());
   acsMultH #( 6, 1,12, 7,   6, 2,14,10, ACS_BITS, MF_BITS, ROT_BITS, 0)  acsMultH26   (.clk(clk), .reset(reset), .symEn(symEnRotMux), .sym2xEn(sym2xEnRotMux), .symEnEven(symEnEven), .symEnEvenRot(symEnEvenRotMux), .iMfInRot(iMfInRot2), .qMfInRot(qMfInRot2), .tilt(tilt), .accMetMuxOut_0(accMuxOut24_0), .accMetMuxOut_1(accMuxOut24_1), .accMetMuxOut_2(accMuxOut24_2), .accMetMuxOut_3(accMuxOut24_3), .selOut(selOut26), .normalizeIn(s), .normalizeOut(s26), .accMetOut(accMetOut26), .iOut(/*iOut26*/), .qOut(qOut26), .symEnOut(), .sym2xEnOut());
   acsMultH #( 2,13, 8, 3,   2,14,10, 6, ACS_BITS, MF_BITS, ROT_BITS, 0)  acsMultH11   (.clk(clk), .reset(reset), .symEn(symEnRotMux), .sym2xEn(sym2xEnRotMux), .symEnEven(symEnEven), .symEnEvenRot(symEnEvenRotMux), .iMfInRot(iMfInRot3), .qMfInRot(qMfInRot3), .tilt(tilt), .accMetMuxOut_0(accMuxOut8_0 ), .accMetMuxOut_1(accMuxOut8_1 ), .accMetMuxOut_2(accMuxOut8_2 ), .accMetMuxOut_3(accMuxOut8_3 ), .selOut(selOut11), .normalizeIn(s), .normalizeOut(s11), .accMetOut(accMetOut11), .iOut(/*iOut11*/), .qOut(qOut11), .symEnOut(), .sym2xEnOut());
   acsMultH #(15,10, 5, 0,  15,11, 7, 3, ACS_BITS, MF_BITS, ROT_BITS, 0)  acsMultH60   (.clk(clk), .reset(reset), .symEn(symEnRotMux), .sym2xEn(sym2xEnRotMux), .symEnEven(symEnEven), .symEnEvenRot(symEnEvenRotMux), .iMfInRot(iMfInRot0), .qMfInRot(qMfInRot0), .tilt(tilt), .accMetMuxOut_0(accMuxOut60_0), .accMetMuxOut_1(accMuxOut60_1), .accMetMuxOut_2(accMuxOut60_2), .accMetMuxOut_3(accMuxOut60_3), .selOut(selOut60), .normalizeIn(s), .normalizeOut(s60), .accMetOut(accMetOut60), .iOut(/*iOut60*/), .qOut(qOut60), .symEnOut(), .sym2xEnOut());
   acsMultH #(11, 6, 1,12,  11, 7, 3,15, ACS_BITS, MF_BITS, ROT_BITS, 0)  acsMultH45   (.clk(clk), .reset(reset), .symEn(symEnRotMux), .sym2xEn(sym2xEnRotMux), .symEnEven(symEnEven), .symEnEvenRot(symEnEvenRotMux), .iMfInRot(iMfInRot1), .qMfInRot(qMfInRot1), .tilt(tilt), .accMetMuxOut_0(accMuxOut44_0), .accMetMuxOut_1(accMuxOut44_1), .accMetMuxOut_2(accMuxOut44_2), .accMetMuxOut_3(accMuxOut44_3), .selOut(selOut45), .normalizeIn(s), .normalizeOut(s45), .accMetOut(accMetOut45), .iOut(/*iOut45*/), .qOut(qOut45), .symEnOut(), .sym2xEnOut());
   acsMultH #( 7, 2,13, 8,   7, 3,15,11, ACS_BITS, MF_BITS, ROT_BITS, 0)  acsMultH30   (.clk(clk), .reset(reset), .symEn(symEnRotMux), .sym2xEn(sym2xEnRotMux), .symEnEven(symEnEven), .symEnEvenRot(symEnEvenRotMux), .iMfInRot(iMfInRot2), .qMfInRot(qMfInRot2), .tilt(tilt), .accMetMuxOut_0(accMuxOut28_0), .accMetMuxOut_1(accMuxOut28_1), .accMetMuxOut_2(accMuxOut28_2), .accMetMuxOut_3(accMuxOut28_3), .selOut(selOut30), .normalizeIn(s), .normalizeOut(s30), .accMetOut(accMetOut30), .iOut(/*iOut30*/), .qOut(qOut30), .symEnOut(), .sym2xEnOut());
   acsMultH #( 3,14, 9, 4,   3,15,11, 7, ACS_BITS, MF_BITS, ROT_BITS, 0)  acsMultH15   (.clk(clk), .reset(reset), .symEn(symEnRotMux), .sym2xEn(sym2xEnRotMux), .symEnEven(symEnEven), .symEnEvenRot(symEnEvenRotMux), .iMfInRot(iMfInRot3), .qMfInRot(qMfInRot3), .tilt(tilt), .accMetMuxOut_0(accMuxOut12_0), .accMetMuxOut_1(accMuxOut12_1), .accMetMuxOut_2(accMuxOut12_2), .accMetMuxOut_3(accMuxOut12_3), .selOut(selOut15), .normalizeIn(s), .normalizeOut(s15), .accMetOut(accMetOut15), .iOut(/*iOut15*/), .qOut(qOut15), .symEnOut(), .sym2xEnOut());


   reg [5:0] symEnEvenSr;
   always @(posedge clk) begin
      if (reset) begin
         symEnEvenSr <= 0;
      end
      else begin
         symEnEvenSr <= {symEnEvenSr[4:0], symEnEven};
      end
   end
   wire symEnEvenAcsMux = symEnEvenSr[3];    // there is a total of 3+1 clock delay through the acs module


   acsMux #(ACS_BITS) acsMux0    (.clk(clk), .symEnEven(symEnEvenAcsMux), .accMet_45_0(accMetOut0 ), .accMet_45_1(accMetOut45), .accMet_45_2(accMetOut26), .accMet_45_3(accMetOut7 ), .accMet_54_0(accMetOut0 ), .accMet_54_1(accMetOut49), .accMet_54_2(accMetOut34), .accMet_54_3(accMetOut19), .accMuxOut0(accMuxOut0_0 ), .accMuxOut1(accMuxOut0_1 ), .accMuxOut2(accMuxOut0_2 ), .accMuxOut3(accMuxOut0_3 ));
   acsMux #(ACS_BITS) acsMux16   (.clk(clk), .symEnEven(symEnEvenAcsMux), .accMet_45_0(accMetOut16), .accMet_45_1(accMetOut61), .accMet_45_2(accMetOut42), .accMet_45_3(accMetOut23), .accMet_54_0(accMetOut16), .accMet_54_1(accMetOut1 ), .accMet_54_2(accMetOut50), .accMet_54_3(accMetOut35), .accMuxOut0(accMuxOut16_0), .accMuxOut1(accMuxOut16_1), .accMuxOut2(accMuxOut16_2), .accMuxOut3(accMuxOut16_3));
   acsMux #(ACS_BITS) acsMux4    (.clk(clk), .symEnEven(symEnEvenAcsMux), .accMet_45_0(accMetOut4 ), .accMet_45_1(accMetOut49), .accMet_45_2(accMetOut30), .accMet_45_3(accMetOut11), .accMet_54_0(accMetOut4 ), .accMet_54_1(accMetOut53), .accMet_54_2(accMetOut38), .accMet_54_3(accMetOut23), .accMuxOut0(accMuxOut4_0 ), .accMuxOut1(accMuxOut4_1 ), .accMuxOut2(accMuxOut4_2 ), .accMuxOut3(accMuxOut4_3 ));
   acsMux #(ACS_BITS) acsMux8    (.clk(clk), .symEnEven(symEnEvenAcsMux), .accMet_45_0(accMetOut8 ), .accMet_45_1(accMetOut53), .accMet_45_2(accMetOut34), .accMet_45_3(accMetOut15), .accMet_54_0(accMetOut8 ), .accMet_54_1(accMetOut57), .accMet_54_2(accMetOut42), .accMet_54_3(accMetOut27), .accMuxOut0(accMuxOut8_0 ), .accMuxOut1(accMuxOut8_1 ), .accMuxOut2(accMuxOut8_2 ), .accMuxOut3(accMuxOut8_3 ));
   acsMux #(ACS_BITS) acsMux12   (.clk(clk), .symEnEven(symEnEvenAcsMux), .accMet_45_0(accMetOut12), .accMet_45_1(accMetOut57), .accMet_45_2(accMetOut38), .accMet_45_3(accMetOut19), .accMet_54_0(accMetOut12), .accMet_54_1(accMetOut61), .accMet_54_2(accMetOut46), .accMet_54_3(accMetOut31), .accMuxOut0(accMuxOut12_0), .accMuxOut1(accMuxOut12_1), .accMuxOut2(accMuxOut12_2), .accMuxOut3(accMuxOut12_3));
   acsMux #(ACS_BITS) acsMux20   (.clk(clk), .symEnEven(symEnEvenAcsMux), .accMet_45_0(accMetOut20), .accMet_45_1(accMetOut1 ), .accMet_45_2(accMetOut46), .accMet_45_3(accMetOut27), .accMet_54_0(accMetOut20), .accMet_54_1(accMetOut5 ), .accMet_54_2(accMetOut54), .accMet_54_3(accMetOut39), .accMuxOut0(accMuxOut20_0), .accMuxOut1(accMuxOut20_1), .accMuxOut2(accMuxOut20_2), .accMuxOut3(accMuxOut20_3));
   acsMux #(ACS_BITS) acsMux24   (.clk(clk), .symEnEven(symEnEvenAcsMux), .accMet_45_0(accMetOut24), .accMet_45_1(accMetOut5 ), .accMet_45_2(accMetOut50), .accMet_45_3(accMetOut31), .accMet_54_0(accMetOut24), .accMet_54_1(accMetOut9 ), .accMet_54_2(accMetOut58), .accMet_54_3(accMetOut43), .accMuxOut0(accMuxOut24_0), .accMuxOut1(accMuxOut24_1), .accMuxOut2(accMuxOut24_2), .accMuxOut3(accMuxOut24_3));
   acsMux #(ACS_BITS) acsMux28   (.clk(clk), .symEnEven(symEnEvenAcsMux), .accMet_45_0(accMetOut28), .accMet_45_1(accMetOut9 ), .accMet_45_2(accMetOut54), .accMet_45_3(accMetOut35), .accMet_54_0(accMetOut28), .accMet_54_1(accMetOut13), .accMet_54_2(accMetOut62), .accMet_54_3(accMetOut47), .accMuxOut0(accMuxOut28_0), .accMuxOut1(accMuxOut28_1), .accMuxOut2(accMuxOut28_2), .accMuxOut3(accMuxOut28_3));
   acsMux #(ACS_BITS) acsMux32   (.clk(clk), .symEnEven(symEnEvenAcsMux), .accMet_45_0(accMetOut32), .accMet_45_1(accMetOut13), .accMet_45_2(accMetOut58), .accMet_45_3(accMetOut39), .accMet_54_0(accMetOut32), .accMet_54_1(accMetOut17), .accMet_54_2(accMetOut2 ), .accMet_54_3(accMetOut51), .accMuxOut0(accMuxOut32_0), .accMuxOut1(accMuxOut32_1), .accMuxOut2(accMuxOut32_2), .accMuxOut3(accMuxOut32_3));
   acsMux #(ACS_BITS) acsMux36   (.clk(clk), .symEnEven(symEnEvenAcsMux), .accMet_45_0(accMetOut36), .accMet_45_1(accMetOut17), .accMet_45_2(accMetOut62), .accMet_45_3(accMetOut43), .accMet_54_0(accMetOut36), .accMet_54_1(accMetOut21), .accMet_54_2(accMetOut6 ), .accMet_54_3(accMetOut55), .accMuxOut0(accMuxOut36_0), .accMuxOut1(accMuxOut36_1), .accMuxOut2(accMuxOut36_2), .accMuxOut3(accMuxOut36_3));
   acsMux #(ACS_BITS) acsMux40   (.clk(clk), .symEnEven(symEnEvenAcsMux), .accMet_45_0(accMetOut40), .accMet_45_1(accMetOut21), .accMet_45_2(accMetOut2 ), .accMet_45_3(accMetOut47), .accMet_54_0(accMetOut40), .accMet_54_1(accMetOut25), .accMet_54_2(accMetOut10), .accMet_54_3(accMetOut59), .accMuxOut0(accMuxOut40_0), .accMuxOut1(accMuxOut40_1), .accMuxOut2(accMuxOut40_2), .accMuxOut3(accMuxOut40_3));
   acsMux #(ACS_BITS) acsMux44   (.clk(clk), .symEnEven(symEnEvenAcsMux), .accMet_45_0(accMetOut44), .accMet_45_1(accMetOut25), .accMet_45_2(accMetOut6 ), .accMet_45_3(accMetOut51), .accMet_54_0(accMetOut44), .accMet_54_1(accMetOut29), .accMet_54_2(accMetOut14), .accMet_54_3(accMetOut63), .accMuxOut0(accMuxOut44_0), .accMuxOut1(accMuxOut44_1), .accMuxOut2(accMuxOut44_2), .accMuxOut3(accMuxOut44_3));
   acsMux #(ACS_BITS) acsMux48   (.clk(clk), .symEnEven(symEnEvenAcsMux), .accMet_45_0(accMetOut48), .accMet_45_1(accMetOut29), .accMet_45_2(accMetOut10), .accMet_45_3(accMetOut55), .accMet_54_0(accMetOut48), .accMet_54_1(accMetOut33), .accMet_54_2(accMetOut18), .accMet_54_3(accMetOut3 ), .accMuxOut0(accMuxOut48_0), .accMuxOut1(accMuxOut48_1), .accMuxOut2(accMuxOut48_2), .accMuxOut3(accMuxOut48_3));
   acsMux #(ACS_BITS) acsMux52   (.clk(clk), .symEnEven(symEnEvenAcsMux), .accMet_45_0(accMetOut52), .accMet_45_1(accMetOut33), .accMet_45_2(accMetOut14), .accMet_45_3(accMetOut59), .accMet_54_0(accMetOut52), .accMet_54_1(accMetOut37), .accMet_54_2(accMetOut22), .accMet_54_3(accMetOut7 ), .accMuxOut0(accMuxOut52_0), .accMuxOut1(accMuxOut52_1), .accMuxOut2(accMuxOut52_2), .accMuxOut3(accMuxOut52_3));
   acsMux #(ACS_BITS) acsMux56   (.clk(clk), .symEnEven(symEnEvenAcsMux), .accMet_45_0(accMetOut56), .accMet_45_1(accMetOut37), .accMet_45_2(accMetOut18), .accMet_45_3(accMetOut63), .accMet_54_0(accMetOut56), .accMet_54_1(accMetOut41), .accMet_54_2(accMetOut26), .accMet_54_3(accMetOut11), .accMuxOut0(accMuxOut56_0), .accMuxOut1(accMuxOut56_1), .accMuxOut2(accMuxOut56_2), .accMuxOut3(accMuxOut56_3));
   acsMux #(ACS_BITS) acsMux60   (.clk(clk), .symEnEven(symEnEvenAcsMux), .accMet_45_0(accMetOut60), .accMet_45_1(accMetOut41), .accMet_45_2(accMetOut22), .accMet_45_3(accMetOut3 ), .accMet_54_0(accMetOut60), .accMet_54_1(accMetOut45), .accMet_54_2(accMetOut30), .accMet_54_3(accMetOut15), .accMuxOut0(accMuxOut60_0), .accMuxOut1(accMuxOut60_1), .accMuxOut2(accMuxOut60_2), .accMuxOut3(accMuxOut60_3));
   
   maxMetricMultiH  #(ACS_BITS) maxMetric 
     (
      .clk(clk), 
      .reset(reset), 
      .symEn(symEnAcs),
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
      .maxVal(), .index(index), .symEnDly(symEn_maxMetDly)
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
   reg [ROT_BITS-1:0]    qOut0r, qOut49r, qOut34r, qOut19r, qOut4r, qOut53r, qOut38r, qOut23r,
                         qOut8r, qOut57r, qOut42r, qOut27r, qOut12r, qOut61r, qOut46r, qOut31r,
                         qOut16r, qOut1r, qOut50r, qOut35r, qOut20r, qOut5r, qOut54r, qOut39r,
                         qOut24r, qOut9r, qOut58r, qOut43r, qOut28r, qOut13r, qOut62r, qOut47r,
                         qOut32r, qOut17r, qOut2r, qOut51r, qOut36r, qOut21r, qOut6r, qOut55r,
                         qOut40r, qOut25r, qOut10r, qOut59r, qOut44r, qOut29r, qOut14r, qOut63r,
                         qOut48r, qOut33r, qOut18r, qOut3r, qOut52r, qOut37r, qOut22r, qOut7r,
                         qOut56r, qOut41r, qOut26r, qOut11r, qOut60r, qOut45r, qOut30r, qOut15r;
   always @(posedge clk)
     begin
        if (reset) begin
           decision  <= 0;
           selOut0r  <= 0; selOut1r  <= 0; selOut2r  <= 0; selOut3r  <= 0; selOut4r  <= 0; selOut5r  <= 0; selOut6r  <= 0; selOut7r  <= 0;
           selOut8r  <= 0; selOut9r  <= 0; selOut10r <= 0; selOut11r <= 0; selOut12r <= 0; selOut13r <= 0; selOut14r <= 0; selOut15r <= 0;
           selOut16r <= 0; selOut17r <= 0; selOut18r <= 0; selOut19r <= 0; selOut20r <= 0; selOut21r <= 0; selOut22r <= 0; selOut23r <= 0; 
           selOut24r <= 0; selOut25r <= 0; selOut26r <= 0; selOut27r <= 0; selOut28r <= 0; selOut29r <= 0; selOut30r <= 0; selOut31r <= 0;
           selOut32r <= 0; selOut33r <= 0; selOut34r <= 0; selOut35r <= 0; selOut36r <= 0; selOut37r <= 0; selOut38r <= 0; selOut39r <= 0; 
           selOut40r <= 0; selOut41r <= 0; selOut42r <= 0; selOut43r <= 0; selOut44r <= 0; selOut45r <= 0; selOut46r <= 0; selOut47r <= 0;
           selOut48r <= 0; selOut49r <= 0; selOut50r <= 0; selOut51r <= 0; selOut52r <= 0; selOut53r <= 0; selOut54r <= 0; selOut55r <= 0;
           selOut56r <= 0; selOut57r <= 0; selOut58r <= 0; selOut59r <= 0; selOut60r <= 0; selOut61r <= 0; selOut62r <= 0; selOut63r <= 0;
           phaseError <= 0; 
           qOut0r  <= 0; qOut1r  <= 0; qOut2r  <= 0; qOut3r  <= 0; qOut4r  <= 0; qOut5r  <= 0; qOut6r  <= 0; qOut7r  <= 0; 
           qOut8r  <= 0; qOut9r  <= 0; qOut10r <= 0; qOut11r <= 0; qOut12r <= 0; qOut13r <= 0; qOut14r <= 0; qOut15r <= 0; 
           qOut16r <= 0; qOut17r <= 0; qOut18r <= 0; qOut19r <= 0; qOut20r <= 0; qOut21r <= 0; qOut22r <= 0; qOut23r <= 0; 
           qOut24r <= 0; qOut25r <= 0; qOut26r <= 0; qOut27r <= 0; qOut28r <= 0; qOut29r <= 0; qOut20r <= 0; qOut31r <= 0; 
           qOut32r <= 0; qOut33r <= 0; qOut34r <= 0; qOut35r <= 0; qOut36r <= 0; qOut37r <= 0; qOut38r <= 0; qOut39r <= 0;
           qOut40r <= 0; qOut41r <= 0; qOut42r <= 0; qOut43r <= 0; qOut44r <= 0; qOut45r <= 0; qOut46r <= 0; qOut47r <= 0; 
           qOut48r <= 0; qOut49r <= 0; qOut50r <= 0; qOut51r <= 0; qOut52r <= 0; qOut53r <= 0; qOut54r <= 0; qOut55r <= 0; 
           qOut56r <= 0; qOut57r <= 0; qOut58r <= 0; qOut59r <= 0; qOut60r <= 0; qOut61r <= 0; qOut62r <= 0; qOut63r <= 0; 
        end
        else if (symEn_maxMetDly) begin
           selOut0r  <= selOut0 ;   qOut0r  <= qOut0;
           selOut1r  <= selOut1 ;   qOut1r  <= qOut1;
           selOut2r  <= selOut2 ;   qOut2r  <= qOut2;
           selOut3r  <= selOut3 ;   qOut3r  <= qOut3;
           selOut4r  <= selOut4 ;   qOut4r  <= qOut4;
           selOut5r  <= selOut5 ;   qOut5r  <= qOut5;
           selOut6r  <= selOut6 ;   qOut6r  <= qOut6;
           selOut7r  <= selOut7 ;   qOut7r  <= qOut7;
           selOut8r  <= selOut8 ;   qOut8r  <= qOut8;
           selOut9r  <= selOut9 ;   qOut9r  <= qOut9;
           selOut10r <= selOut10;   qOut10r <= qOut10;
           selOut11r <= selOut11;   qOut11r <= qOut11;
           selOut12r <= selOut12;   qOut12r <= qOut12;
           selOut13r <= selOut13;   qOut13r <= qOut13;
           selOut14r <= selOut14;   qOut14r <= qOut14;
           selOut15r <= selOut15;   qOut15r <= qOut15;
           selOut16r <= selOut16;   qOut16r <= qOut16;
           selOut17r <= selOut17;   qOut17r <= qOut17;
           selOut18r <= selOut18;   qOut18r <= qOut18;
           selOut19r <= selOut19;   qOut19r <= qOut19;
           selOut20r <= selOut20;   qOut20r <= qOut20;
           selOut21r <= selOut21;   qOut21r <= qOut21;
           selOut22r <= selOut22;   qOut22r <= qOut22;
           selOut23r <= selOut23;   qOut23r <= qOut23;
           selOut24r <= selOut24;   qOut24r <= qOut24;
           selOut25r <= selOut25;   qOut25r <= qOut25;
           selOut26r <= selOut26;   qOut26r <= qOut26;
           selOut27r <= selOut27;   qOut27r <= qOut27;
           selOut28r <= selOut28;   qOut28r <= qOut28;
           selOut29r <= selOut29;   qOut29r <= qOut29;
           selOut30r <= selOut30;   qOut30r <= qOut30;
           selOut31r <= selOut31;   qOut31r <= qOut31;
           selOut32r <= selOut32;   qOut32r <= qOut32;
           selOut33r <= selOut33;   qOut33r <= qOut33;
           selOut34r <= selOut34;   qOut34r <= qOut34;
           selOut35r <= selOut35;   qOut35r <= qOut35;
           selOut36r <= selOut36;   qOut36r <= qOut36;
           selOut37r <= selOut37;   qOut37r <= qOut37;
           selOut38r <= selOut38;   qOut38r <= qOut38;
           selOut39r <= selOut39;   qOut39r <= qOut39;
           selOut40r <= selOut40;   qOut40r <= qOut40;
           selOut41r <= selOut41;   qOut41r <= qOut41;
           selOut42r <= selOut42;   qOut42r <= qOut42;
           selOut43r <= selOut43;   qOut43r <= qOut43;
           selOut44r <= selOut44;   qOut44r <= qOut44;
           selOut45r <= selOut45;   qOut45r <= qOut45;
           selOut46r <= selOut46;   qOut46r <= qOut46;
           selOut47r <= selOut47;   qOut47r <= qOut47;
           selOut48r <= selOut48;   qOut48r <= qOut48;
           selOut49r <= selOut49;   qOut49r <= qOut49;
           selOut50r <= selOut50;   qOut50r <= qOut50;
           selOut51r <= selOut51;   qOut51r <= qOut51;
           selOut52r <= selOut52;   qOut52r <= qOut52;
           selOut53r <= selOut53;   qOut53r <= qOut53;
           selOut54r <= selOut54;   qOut54r <= qOut54;
           selOut55r <= selOut55;   qOut55r <= qOut55;
           selOut56r <= selOut56;   qOut56r <= qOut56;
           selOut57r <= selOut57;   qOut57r <= qOut57;
           selOut58r <= selOut58;   qOut58r <= qOut58;
           selOut59r <= selOut59;   qOut59r <= qOut59;
           selOut60r <= selOut60;   qOut60r <= qOut60;
           selOut61r <= selOut61;   qOut61r <= qOut61;
           selOut62r <= selOut62;   qOut62r <= qOut62;
           selOut63r <= selOut63;   qOut63r <= qOut63;
           case (index)
             0 : begin decision <= selOut0r ; phaseError <= qOut0r ; end
             1 : begin decision <= selOut1r ; phaseError <= qOut1r ; end
             2 : begin decision <= selOut2r ; phaseError <= qOut2r ; end
             3 : begin decision <= selOut3r ; phaseError <= qOut3r ; end
             4 : begin decision <= selOut4r ; phaseError <= qOut4r ; end
             5 : begin decision <= selOut5r ; phaseError <= qOut5r ; end
             6 : begin decision <= selOut6r ; phaseError <= qOut6r ; end
             7 : begin decision <= selOut7r ; phaseError <= qOut7r ; end
             8 : begin decision <= selOut8r ; phaseError <= qOut8r ; end
             9 : begin decision <= selOut9r ; phaseError <= qOut9r ; end
             10: begin decision <= selOut10r; phaseError <= qOut10r; end
             11: begin decision <= selOut11r; phaseError <= qOut11r; end
             12: begin decision <= selOut12r; phaseError <= qOut12r; end
             13: begin decision <= selOut13r; phaseError <= qOut13r; end
             14: begin decision <= selOut14r; phaseError <= qOut14r; end
             15: begin decision <= selOut15r; phaseError <= qOut15r; end
             16: begin decision <= selOut16r; phaseError <= qOut16r; end
             17: begin decision <= selOut17r; phaseError <= qOut17r; end
             18: begin decision <= selOut18r; phaseError <= qOut18r; end
             19: begin decision <= selOut19r; phaseError <= qOut19r; end
             20: begin decision <= selOut20r; phaseError <= qOut20r; end
             21: begin decision <= selOut21r; phaseError <= qOut21r; end
             22: begin decision <= selOut22r; phaseError <= qOut22r; end
             23: begin decision <= selOut23r; phaseError <= qOut23r; end
             24: begin decision <= selOut24r; phaseError <= qOut24r; end
             25: begin decision <= selOut25r; phaseError <= qOut25r; end
             26: begin decision <= selOut26r; phaseError <= qOut26r; end
             27: begin decision <= selOut27r; phaseError <= qOut27r; end
             28: begin decision <= selOut28r; phaseError <= qOut28r; end
             29: begin decision <= selOut29r; phaseError <= qOut29r; end
             30: begin decision <= selOut30r; phaseError <= qOut30r; end
             31: begin decision <= selOut31r; phaseError <= qOut31r; end
             32: begin decision <= selOut32r; phaseError <= qOut32r; end
             33: begin decision <= selOut33r; phaseError <= qOut33r; end
             34: begin decision <= selOut34r; phaseError <= qOut34r; end
             35: begin decision <= selOut35r; phaseError <= qOut35r; end
             36: begin decision <= selOut36r; phaseError <= qOut36r; end
             37: begin decision <= selOut37r; phaseError <= qOut37r; end
             38: begin decision <= selOut38r; phaseError <= qOut38r; end
             39: begin decision <= selOut39r; phaseError <= qOut39r; end
             40: begin decision <= selOut40r; phaseError <= qOut40r; end
             41: begin decision <= selOut41r; phaseError <= qOut41r; end
             42: begin decision <= selOut42r; phaseError <= qOut42r; end
             43: begin decision <= selOut43r; phaseError <= qOut43r; end
             44: begin decision <= selOut44r; phaseError <= qOut44r; end
             45: begin decision <= selOut45r; phaseError <= qOut45r; end
             46: begin decision <= selOut46r; phaseError <= qOut46r; end
             47: begin decision <= selOut47r; phaseError <= qOut47r; end
             48: begin decision <= selOut48r; phaseError <= qOut48r; end
             49: begin decision <= selOut49r; phaseError <= qOut49r; end
             50: begin decision <= selOut50r; phaseError <= qOut50r; end
             51: begin decision <= selOut51r; phaseError <= qOut51r; end
             52: begin decision <= selOut52r; phaseError <= qOut52r; end
             53: begin decision <= selOut53r; phaseError <= qOut53r; end
             54: begin decision <= selOut54r; phaseError <= qOut54r; end
             55: begin decision <= selOut55r; phaseError <= qOut55r; end
             56: begin decision <= selOut56r; phaseError <= qOut56r; end
             57: begin decision <= selOut57r; phaseError <= qOut57r; end
             58: begin decision <= selOut58r; phaseError <= qOut58r; end
             59: begin decision <= selOut59r; phaseError <= qOut59r; end
             60: begin decision <= selOut60r; phaseError <= qOut60r; end
             61: begin decision <= selOut61r; phaseError <= qOut61r; end
             62: begin decision <= selOut62r; phaseError <= qOut62r; end
             63: begin decision <= selOut63r; phaseError <= qOut63r; end
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
