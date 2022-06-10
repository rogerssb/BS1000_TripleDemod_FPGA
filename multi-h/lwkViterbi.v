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
`include "addressMap.v"

`define USE_DECAY
`define USE_TRACEBACK
`define USE_SYM_EN_EVEN_INPUT

module viterbiMultiH
  (
   clk, reset, symEnEven, symEn, sym2xEn,
   decayFactor,
   tbEnable,
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
   normalize,
   maxAcs,
   phaseError,
   phaseErrorEn,
   phaseErrorValid,
   symEnOut, sym2xEnOut
   );

   parameter             MF_BITS = 10;
   //parameter             ACS_BITS = 12;
   parameter             ACS_BITS = 10;
   parameter             ROT_BITS = 8;
   input                 clk, reset, symEnEven, symEn, sym2xEn;
   input                 tbEnable;
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
   output                normalize;
   output [ACS_BITS-1:0] maxAcs;
   output [ROT_BITS-1:0] phaseError;
   output                phaseErrorEn;
   output                phaseErrorValid;
   output                symEnOut, sym2xEnOut;

   wire [ACS_BITS-1:0]   accMetOut0, accMetOut1, accMetOut2, accMetOut3, accMetOut4, accMetOut5, accMetOut6, accMetOut7,
                         accMetOut8, accMetOut9, accMetOut10, accMetOut11, accMetOut12, accMetOut13, accMetOut14, accMetOut15,
                         accMetOut16, accMetOut17, accMetOut18, accMetOut19, accMetOut20, accMetOut21, accMetOut22, accMetOut23,
                         accMetOut24, accMetOut25, accMetOut26, accMetOut27, accMetOut28, accMetOut29, accMetOut30, accMetOut31,
                         accMetOut32, accMetOut33, accMetOut34, accMetOut35, accMetOut36, accMetOut37, accMetOut38, accMetOut39,
                         accMetOut40, accMetOut41, accMetOut42, accMetOut43, accMetOut44, accMetOut45, accMetOut46, accMetOut47,
                         accMetOut48, accMetOut49, accMetOut50, accMetOut51, accMetOut52, accMetOut53, accMetOut54, accMetOut55,
                         accMetOut56, accMetOut57, accMetOut58, accMetOut59, accMetOut60, accMetOut61, accMetOut62, accMetOut63;

   reg [ROT_BITS-1:0]    phaseError0;
   reg [ROT_BITS-1:0]    phaseError1;
   reg [ROT_BITS-1:0]    phaseError2;

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


    `ifndef USE_SYM_EN_EVEN_INPUT
   // symEnEven is the signal who indicate if we are in a 54 or 45 interval
   reg                   symEnEven_reg;
   wire                  symEnEvenIn = symEnEven_reg;
   always @(posedge clk)
     begin
        if (reset) begin
           //symEnEven <= 0;
           symEnEven_reg <= 1;
        end
        else begin
           if (symEn) begin
              symEnEven_reg <= ~ symEnEven_reg;
           end
        end
      end
   `else
   wire                  symEnEvenIn = symEnEven;
   `endif

   // This is not pretty but it is a way to get the design going
   // The normailization has to be insync with the controls in acsMultH/compSel
   reg [6:0] symEnEvenSr;
   always @(posedge clk) begin
      if (reset) begin
         symEnEvenSr <= 0;
      end
      else begin
         symEnEvenSr <= {symEnEvenSr[5:0], symEnEvenIn};
      end
   end
   wire symEnEvenAcsMux = symEnEvenSr[6];    // there is a total of 3+1 clock delay through the acs module

   // ACS acc. normalization control signal
   reg [3:0] normSr;
   wire symEnAcs;
   always @(posedge clk)
     begin
        if (reset) begin
           normSr <= 0;
        end
        else if (symEnAcs) begin
           normSr <= {normSr[2:0], s0  | s49 | s34 | s19 | s4  | s53 | s38 | s23 |
                                 s8  | s57 | s42 | s27 | s12 | s61 | s46 | s31 |
                                 s16 | s1  | s50 | s35 | s20 | s5  | s54 | s39 |
                                 s24 | s9  | s58 | s43 | s28 | s13 | s62 | s47 |
                                 s32 | s17 | s2  | s51 | s36 | s21 | s6  | s55 |
                                 s40 | s25 | s10 | s59 | s44 | s29 | s14 | s63 |
                                 s48 | s33 | s18 | s3  | s52 | s37 | s22 | s7  |
                                 s56 | s41 | s26 | s11 | s60 | s45 | s30 | s15};
        end
     end
   wire s = (normSr[1:0]==2'b01) ? 1 : 0; // edge trigger on the normailzation to prevent under saturation
   assign normalize = s;


   wire [1:0]            selOut0 , selOut49 , selOut34 , selOut19 , selOut4 , selOut53 , selOut38 , selOut23 ,
                         selOut8 , selOut57 , selOut42 , selOut27 , selOut12 , selOut61 , selOut46 , selOut31 ,
                         selOut16 , selOut1 , selOut50 , selOut35 , selOut20 , selOut5 , selOut54 , selOut39 ,
                         selOut24 , selOut9 , selOut58 , selOut43 , selOut28 , selOut13 , selOut62 , selOut47 ,
                         selOut32 , selOut17 , selOut2 , selOut51 , selOut36 , selOut21 , selOut6 , selOut55 ,
                         selOut40 , selOut25 , selOut10 , selOut59 , selOut44 , selOut29 , selOut14 , selOut63 ,
                         selOut48 , selOut33 , selOut18 , selOut3 , selOut52 , selOut37 , selOut22 , selOut7 ,
                         selOut56 , selOut41 , selOut26 , selOut11 , selOut60 , selOut45 , selOut30 , selOut15;

   /* -----\/----- EXCLUDED -----\/-----
   wire [ROT_BITS-1:0]   iOut0, iOut49, iOut34, iOut19, iOut4, iOut53, iOut38, iOut23,
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

   wire [MF_BITS-1:0]   iMfInRot0, qMfInRot0,
                        iMfInRot1, qMfInRot1,
                        iMfInRot2, qMfInRot2,
                        iMfInRot3, qMfInRot3;
   wire                 symEnRotMux, sym2xEnRotMux, symEnEvenRotMux;
   rotMux #(MF_BITS) rotMux0     (.clk(clk), .reset(reset), .symEn(symEn), .sym2xEn(sym2xEn), .symEnEven(symEnEvenIn), .mfI_45_0(mf_m3m3_54Real), .mfI_45_1(mf_m1m3_54Real), .mfI_45_2(mf_p1m3_54Real), .mfI_45_3(mf_p3m3_54Real), .mfI_54_0(mf_m3m3_45Real), .mfI_54_1(mf_m1m3_45Real), .mfI_54_2(mf_p1m3_45Real), .mfI_54_3(mf_p3m3_45Real), .mfQ_45_0(mf_m3m3_54Imag), .mfQ_45_1(mf_m1m3_54Imag), .mfQ_45_2(mf_p1m3_54Imag), .mfQ_45_3(mf_p3m3_54Imag), .mfQ_54_0(mf_m3m3_45Imag), .mfQ_54_1(mf_m1m3_45Imag), .mfQ_54_2(mf_p1m3_45Imag), .mfQ_54_3(mf_p3m3_45Imag), .iMfInRot(iMfInRot0), .qMfInRot(qMfInRot0), .symEnOut(symEnRotMux), .sym2xEnOut(sym2xEnRotMux), .symEnEvenOut(symEnEvenRotMux) );
   rotMux #(MF_BITS) rotMux1     (.clk(clk), .reset(reset), .symEn(symEn), .sym2xEn(sym2xEn), .symEnEven(symEnEvenIn), .mfI_45_0(mf_m3m1_54Real), .mfI_45_1(mf_m1m1_54Real), .mfI_45_2(mf_p1m1_54Real), .mfI_45_3(mf_p3m1_54Real), .mfI_54_0(mf_m3m1_45Real), .mfI_54_1(mf_m1m1_45Real), .mfI_54_2(mf_p1m1_45Real), .mfI_54_3(mf_p3m1_45Real), .mfQ_45_0(mf_m3m1_54Imag), .mfQ_45_1(mf_m1m1_54Imag), .mfQ_45_2(mf_p1m1_54Imag), .mfQ_45_3(mf_p3m1_54Imag), .mfQ_54_0(mf_m3m1_45Imag), .mfQ_54_1(mf_m1m1_45Imag), .mfQ_54_2(mf_p1m1_45Imag), .mfQ_54_3(mf_p3m1_45Imag), .iMfInRot(iMfInRot1), .qMfInRot(qMfInRot1), .symEnOut(), .sym2xEnOut(), .symEnEvenOut() );
   rotMux #(MF_BITS) rotMux2     (.clk(clk), .reset(reset), .symEn(symEn), .sym2xEn(sym2xEn), .symEnEven(symEnEvenIn), .mfI_45_0(mf_m3p1_54Real), .mfI_45_1(mf_m1p1_54Real), .mfI_45_2(mf_p1p1_54Real), .mfI_45_3(mf_p3p1_54Real), .mfI_54_0(mf_m3p1_45Real), .mfI_54_1(mf_m1p1_45Real), .mfI_54_2(mf_p1p1_45Real), .mfI_54_3(mf_p3p1_45Real), .mfQ_45_0(mf_m3p1_54Imag), .mfQ_45_1(mf_m1p1_54Imag), .mfQ_45_2(mf_p1p1_54Imag), .mfQ_45_3(mf_p3p1_54Imag), .mfQ_54_0(mf_m3p1_45Imag), .mfQ_54_1(mf_m1p1_45Imag), .mfQ_54_2(mf_p1p1_45Imag), .mfQ_54_3(mf_p3p1_45Imag), .iMfInRot(iMfInRot2), .qMfInRot(qMfInRot2), .symEnOut(), .sym2xEnOut(), .symEnEvenOut() );
   rotMux #(MF_BITS) rotMux3     (.clk(clk), .reset(reset), .symEn(symEn), .sym2xEn(sym2xEn), .symEnEven(symEnEvenIn), .mfI_45_0(mf_m3p3_54Real), .mfI_45_1(mf_m1p3_54Real), .mfI_45_2(mf_p1p3_54Real), .mfI_45_3(mf_p3p3_54Real), .mfI_54_0(mf_m3p3_45Real), .mfI_54_1(mf_m1p3_45Real), .mfI_54_2(mf_p1p3_45Real), .mfI_54_3(mf_p3p3_45Real), .mfQ_45_0(mf_m3p3_54Imag), .mfQ_45_1(mf_m1p3_54Imag), .mfQ_45_2(mf_p1p3_54Imag), .mfQ_45_3(mf_p3p3_54Imag), .mfQ_54_0(mf_m3p3_45Imag), .mfQ_54_1(mf_m1p3_45Imag), .mfQ_54_2(mf_p1p3_45Imag), .mfQ_54_3(mf_p3p3_45Imag), .iMfInRot(iMfInRot3), .qMfInRot(qMfInRot3), .symEnOut(), .sym2xEnOut(), .symEnEvenOut() );

   //         h45 rot para  h54 rot param                                                                                                                                                      match filters                                           ACC metrics
   acsMultH #(0 ,11, 6, 1,  0 ,12, 8, 4, ACS_BITS, MF_BITS, ROT_BITS, 0)  acsMultH0    (.clk(clk), .reset(reset), .symEn(symEnRotMux), .sym2xEn(sym2xEnRotMux), .symEnEven(symEnEvenIn), .symEnEvenRot(symEnEvenRotMux), .iMfInRot(iMfInRot0), .qMfInRot(qMfInRot0), .accMetMuxOut_0(accMuxOut0_0 ), .accMetMuxOut_1(accMuxOut0_1 ), .accMetMuxOut_2(accMuxOut0_2 ), .accMetMuxOut_3(accMuxOut0_3 ), .selOut(selOut0 ), .normalizeIn(s), .normalizeOut(s0 ), .accMetOut(accMetOut0 ), .iOut(/*iOut0*/ ), .qOut(qOut0 ), .symEnOut(symEnAcs), .sym2xEnOut(sym2xEnAcs));
   acsMultH #(12, 7, 2,13,  12, 8, 4, 0, ACS_BITS, MF_BITS, ROT_BITS, 0)  acsMultH49   (.clk(clk), .reset(reset), .symEn(symEnRotMux), .sym2xEn(sym2xEnRotMux), .symEnEven(symEnEvenIn), .symEnEvenRot(symEnEvenRotMux), .iMfInRot(iMfInRot1), .qMfInRot(qMfInRot1), .accMetMuxOut_0(accMuxOut48_0), .accMetMuxOut_1(accMuxOut48_1), .accMetMuxOut_2(accMuxOut48_2), .accMetMuxOut_3(accMuxOut48_3), .selOut(selOut49), .normalizeIn(s), .normalizeOut(s49), .accMetOut(accMetOut49), .iOut(/*iOut49*/), .qOut(qOut49), .symEnOut(), .sym2xEnOut());
   acsMultH #( 8, 3,14, 9,  8 , 4, 0,12, ACS_BITS, MF_BITS, ROT_BITS, 0)  acsMultH34   (.clk(clk), .reset(reset), .symEn(symEnRotMux), .sym2xEn(sym2xEnRotMux), .symEnEven(symEnEvenIn), .symEnEvenRot(symEnEvenRotMux), .iMfInRot(iMfInRot2), .qMfInRot(qMfInRot2), .accMetMuxOut_0(accMuxOut32_0), .accMetMuxOut_1(accMuxOut32_1), .accMetMuxOut_2(accMuxOut32_2), .accMetMuxOut_3(accMuxOut32_3), .selOut(selOut34), .normalizeIn(s), .normalizeOut(s34), .accMetOut(accMetOut34), .iOut(/*iOut34*/), .qOut(qOut34), .symEnOut(), .sym2xEnOut());
   acsMultH #( 4,15,10, 5,  4 , 0,12, 8, ACS_BITS, MF_BITS, ROT_BITS, 0)  acsMultH19   (.clk(clk), .reset(reset), .symEn(symEnRotMux), .sym2xEn(sym2xEnRotMux), .symEnEven(symEnEvenIn), .symEnEvenRot(symEnEvenRotMux), .iMfInRot(iMfInRot3), .qMfInRot(qMfInRot3), .accMetMuxOut_0(accMuxOut16_0), .accMetMuxOut_1(accMuxOut16_1), .accMetMuxOut_2(accMuxOut16_2), .accMetMuxOut_3(accMuxOut16_3), .selOut(selOut19), .normalizeIn(s), .normalizeOut(s19), .accMetOut(accMetOut19), .iOut(/*iOut19*/), .qOut(qOut19), .symEnOut(), .sym2xEnOut());
   acsMultH #( 1,12, 7, 2,  1 ,13, 9, 5, ACS_BITS, MF_BITS, ROT_BITS, 0)  acsMultH4    (.clk(clk), .reset(reset), .symEn(symEnRotMux), .sym2xEn(sym2xEnRotMux), .symEnEven(symEnEvenIn), .symEnEvenRot(symEnEvenRotMux), .iMfInRot(iMfInRot0), .qMfInRot(qMfInRot0), .accMetMuxOut_0(accMuxOut4_0 ), .accMetMuxOut_1(accMuxOut4_1 ), .accMetMuxOut_2(accMuxOut4_2 ), .accMetMuxOut_3(accMuxOut4_3 ), .selOut(selOut4 ), .normalizeIn(s), .normalizeOut(s4 ), .accMetOut(accMetOut4 ), .iOut(/*iOut4 */), .qOut(qOut4 ), .symEnOut(), .sym2xEnOut());
   acsMultH #(13, 8, 3,14,  13, 9, 5, 1, ACS_BITS, MF_BITS, ROT_BITS, 0)  acsMultH53   (.clk(clk), .reset(reset), .symEn(symEnRotMux), .sym2xEn(sym2xEnRotMux), .symEnEven(symEnEvenIn), .symEnEvenRot(symEnEvenRotMux), .iMfInRot(iMfInRot1), .qMfInRot(qMfInRot1), .accMetMuxOut_0(accMuxOut52_0), .accMetMuxOut_1(accMuxOut52_1), .accMetMuxOut_2(accMuxOut52_2), .accMetMuxOut_3(accMuxOut52_3), .selOut(selOut53), .normalizeIn(s), .normalizeOut(s53), .accMetOut(accMetOut53), .iOut(/*iOut53*/), .qOut(qOut53), .symEnOut(), .sym2xEnOut());
   acsMultH #( 9, 4,15,10,   9, 5, 1,13, ACS_BITS, MF_BITS, ROT_BITS, 0)  acsMultH38   (.clk(clk), .reset(reset), .symEn(symEnRotMux), .sym2xEn(sym2xEnRotMux), .symEnEven(symEnEvenIn), .symEnEvenRot(symEnEvenRotMux), .iMfInRot(iMfInRot2), .qMfInRot(qMfInRot2), .accMetMuxOut_0(accMuxOut36_0), .accMetMuxOut_1(accMuxOut36_1), .accMetMuxOut_2(accMuxOut36_2), .accMetMuxOut_3(accMuxOut36_3), .selOut(selOut38), .normalizeIn(s), .normalizeOut(s38), .accMetOut(accMetOut38), .iOut(/*iOut38*/), .qOut(qOut38), .symEnOut(), .sym2xEnOut());
   acsMultH #( 5, 0,11, 6,   5, 1,13, 9, ACS_BITS, MF_BITS, ROT_BITS, 0)  acsMultH23   (.clk(clk), .reset(reset), .symEn(symEnRotMux), .sym2xEn(sym2xEnRotMux), .symEnEven(symEnEvenIn), .symEnEvenRot(symEnEvenRotMux), .iMfInRot(iMfInRot3), .qMfInRot(qMfInRot3), .accMetMuxOut_0(accMuxOut20_0), .accMetMuxOut_1(accMuxOut20_1), .accMetMuxOut_2(accMuxOut20_2), .accMetMuxOut_3(accMuxOut20_3), .selOut(selOut23), .normalizeIn(s), .normalizeOut(s23), .accMetOut(accMetOut23), .iOut(/*iOut23*/), .qOut(qOut23), .symEnOut(), .sym2xEnOut());
   acsMultH #( 2,13, 8, 3,   2,14,10, 6, ACS_BITS, MF_BITS, ROT_BITS, 0)  acsMultH8    (.clk(clk), .reset(reset), .symEn(symEnRotMux), .sym2xEn(sym2xEnRotMux), .symEnEven(symEnEvenIn), .symEnEvenRot(symEnEvenRotMux), .iMfInRot(iMfInRot0), .qMfInRot(qMfInRot0), .accMetMuxOut_0(accMuxOut8_0 ), .accMetMuxOut_1(accMuxOut8_1 ), .accMetMuxOut_2(accMuxOut8_2 ), .accMetMuxOut_3(accMuxOut8_3 ), .selOut(selOut8 ), .normalizeIn(s), .normalizeOut(s8 ), .accMetOut(accMetOut8 ), .iOut(/*iOut8 */), .qOut(qOut8 ), .symEnOut(), .sym2xEnOut());
   acsMultH #(14, 9, 4,15,  14,10, 6, 2, ACS_BITS, MF_BITS, ROT_BITS, 0)  acsMultH57   (.clk(clk), .reset(reset), .symEn(symEnRotMux), .sym2xEn(sym2xEnRotMux), .symEnEven(symEnEvenIn), .symEnEvenRot(symEnEvenRotMux), .iMfInRot(iMfInRot1), .qMfInRot(qMfInRot1), .accMetMuxOut_0(accMuxOut56_0), .accMetMuxOut_1(accMuxOut56_1), .accMetMuxOut_2(accMuxOut56_2), .accMetMuxOut_3(accMuxOut56_3), .selOut(selOut57), .normalizeIn(s), .normalizeOut(s57), .accMetOut(accMetOut57), .iOut(/*iOut57*/), .qOut(qOut57), .symEnOut(), .sym2xEnOut());
   acsMultH #(10, 5, 0,11,  10, 6, 2,14, ACS_BITS, MF_BITS, ROT_BITS, 0)  acsMultH42   (.clk(clk), .reset(reset), .symEn(symEnRotMux), .sym2xEn(sym2xEnRotMux), .symEnEven(symEnEvenIn), .symEnEvenRot(symEnEvenRotMux), .iMfInRot(iMfInRot2), .qMfInRot(qMfInRot2), .accMetMuxOut_0(accMuxOut40_0), .accMetMuxOut_1(accMuxOut40_1), .accMetMuxOut_2(accMuxOut40_2), .accMetMuxOut_3(accMuxOut40_3), .selOut(selOut42), .normalizeIn(s), .normalizeOut(s42), .accMetOut(accMetOut42), .iOut(/*iOut42*/), .qOut(qOut42), .symEnOut(), .sym2xEnOut());
   acsMultH #( 6, 1,12, 7,   6, 2,14,10, ACS_BITS, MF_BITS, ROT_BITS, 0)  acsMultH27   (.clk(clk), .reset(reset), .symEn(symEnRotMux), .sym2xEn(sym2xEnRotMux), .symEnEven(symEnEvenIn), .symEnEvenRot(symEnEvenRotMux), .iMfInRot(iMfInRot3), .qMfInRot(qMfInRot3), .accMetMuxOut_0(accMuxOut24_0), .accMetMuxOut_1(accMuxOut24_1), .accMetMuxOut_2(accMuxOut24_2), .accMetMuxOut_3(accMuxOut24_3), .selOut(selOut27), .normalizeIn(s), .normalizeOut(s27), .accMetOut(accMetOut27), .iOut(/*iOut27*/), .qOut(qOut27), .symEnOut(), .sym2xEnOut());
   acsMultH #( 3,14, 9, 4,   3,15,11, 7, ACS_BITS, MF_BITS, ROT_BITS, 0)  acsMultH12   (.clk(clk), .reset(reset), .symEn(symEnRotMux), .sym2xEn(sym2xEnRotMux), .symEnEven(symEnEvenIn), .symEnEvenRot(symEnEvenRotMux), .iMfInRot(iMfInRot0), .qMfInRot(qMfInRot0), .accMetMuxOut_0(accMuxOut12_0), .accMetMuxOut_1(accMuxOut12_1), .accMetMuxOut_2(accMuxOut12_2), .accMetMuxOut_3(accMuxOut12_3), .selOut(selOut12), .normalizeIn(s), .normalizeOut(s12), .accMetOut(accMetOut12), .iOut(/*iOut12*/), .qOut(qOut12), .symEnOut(), .sym2xEnOut());
   acsMultH #(15,10, 5, 0,  15,11, 7, 3, ACS_BITS, MF_BITS, ROT_BITS, 0)  acsMultH61   (.clk(clk), .reset(reset), .symEn(symEnRotMux), .sym2xEn(sym2xEnRotMux), .symEnEven(symEnEvenIn), .symEnEvenRot(symEnEvenRotMux), .iMfInRot(iMfInRot1), .qMfInRot(qMfInRot1), .accMetMuxOut_0(accMuxOut60_0), .accMetMuxOut_1(accMuxOut60_1), .accMetMuxOut_2(accMuxOut60_2), .accMetMuxOut_3(accMuxOut60_3), .selOut(selOut61), .normalizeIn(s), .normalizeOut(s61), .accMetOut(accMetOut61), .iOut(/*iOut61*/), .qOut(qOut61), .symEnOut(), .sym2xEnOut());
   acsMultH #(11, 6, 1,12,  11, 7, 3,15, ACS_BITS, MF_BITS, ROT_BITS, 0)  acsMultH46   (.clk(clk), .reset(reset), .symEn(symEnRotMux), .sym2xEn(sym2xEnRotMux), .symEnEven(symEnEvenIn), .symEnEvenRot(symEnEvenRotMux), .iMfInRot(iMfInRot2), .qMfInRot(qMfInRot2), .accMetMuxOut_0(accMuxOut44_0), .accMetMuxOut_1(accMuxOut44_1), .accMetMuxOut_2(accMuxOut44_2), .accMetMuxOut_3(accMuxOut44_3), .selOut(selOut46), .normalizeIn(s), .normalizeOut(s46), .accMetOut(accMetOut46), .iOut(/*iOut46*/), .qOut(qOut46), .symEnOut(), .sym2xEnOut());
   acsMultH #( 7, 2,13, 8,   7, 3,15,11, ACS_BITS, MF_BITS, ROT_BITS, 0)  acsMultH31   (.clk(clk), .reset(reset), .symEn(symEnRotMux), .sym2xEn(sym2xEnRotMux), .symEnEven(symEnEvenIn), .symEnEvenRot(symEnEvenRotMux), .iMfInRot(iMfInRot3), .qMfInRot(qMfInRot3), .accMetMuxOut_0(accMuxOut28_0), .accMetMuxOut_1(accMuxOut28_1), .accMetMuxOut_2(accMuxOut28_2), .accMetMuxOut_3(accMuxOut28_3), .selOut(selOut31), .normalizeIn(s), .normalizeOut(s31), .accMetOut(accMetOut31), .iOut(/*iOut31*/), .qOut(qOut31), .symEnOut(), .sym2xEnOut());
   acsMultH #( 4,15,10, 5,   4, 0,12, 8, ACS_BITS, MF_BITS, ROT_BITS, 0)  acsMultH16   (.clk(clk), .reset(reset), .symEn(symEnRotMux), .sym2xEn(sym2xEnRotMux), .symEnEven(symEnEvenIn), .symEnEvenRot(symEnEvenRotMux), .iMfInRot(iMfInRot0), .qMfInRot(qMfInRot0), .accMetMuxOut_0(accMuxOut16_0), .accMetMuxOut_1(accMuxOut16_1), .accMetMuxOut_2(accMuxOut16_2), .accMetMuxOut_3(accMuxOut16_3), .selOut(selOut16), .normalizeIn(s), .normalizeOut(s16), .accMetOut(accMetOut16), .iOut(/*iOut16*/), .qOut(qOut16), .symEnOut(), .sym2xEnOut());
   acsMultH #( 0,11, 6, 1,   0,12, 8, 4, ACS_BITS, MF_BITS, ROT_BITS, 0)  acsMultH1    (.clk(clk), .reset(reset), .symEn(symEnRotMux), .sym2xEn(sym2xEnRotMux), .symEnEven(symEnEvenIn), .symEnEvenRot(symEnEvenRotMux), .iMfInRot(iMfInRot1), .qMfInRot(qMfInRot1), .accMetMuxOut_0(accMuxOut0_0 ), .accMetMuxOut_1(accMuxOut0_1 ), .accMetMuxOut_2(accMuxOut0_2 ), .accMetMuxOut_3(accMuxOut0_3 ), .selOut(selOut1 ), .normalizeIn(s), .normalizeOut(s1 ), .accMetOut(accMetOut1 ), .iOut(/*iOut1 */), .qOut(qOut1 ), .symEnOut(), .sym2xEnOut());
   acsMultH #(12, 7, 2,13,  12, 8, 4, 0, ACS_BITS, MF_BITS, ROT_BITS, 0)  acsMultH50   (.clk(clk), .reset(reset), .symEn(symEnRotMux), .sym2xEn(sym2xEnRotMux), .symEnEven(symEnEvenIn), .symEnEvenRot(symEnEvenRotMux), .iMfInRot(iMfInRot2), .qMfInRot(qMfInRot2), .accMetMuxOut_0(accMuxOut48_0), .accMetMuxOut_1(accMuxOut48_1), .accMetMuxOut_2(accMuxOut48_2), .accMetMuxOut_3(accMuxOut48_3), .selOut(selOut50), .normalizeIn(s), .normalizeOut(s50), .accMetOut(accMetOut50), .iOut(/*iOut50*/), .qOut(qOut50), .symEnOut(), .sym2xEnOut());
   acsMultH #( 8, 3,14, 9,   8, 4, 0,12, ACS_BITS, MF_BITS, ROT_BITS, 0)  acsMultH35   (.clk(clk), .reset(reset), .symEn(symEnRotMux), .sym2xEn(sym2xEnRotMux), .symEnEven(symEnEvenIn), .symEnEvenRot(symEnEvenRotMux), .iMfInRot(iMfInRot3), .qMfInRot(qMfInRot3), .accMetMuxOut_0(accMuxOut32_0), .accMetMuxOut_1(accMuxOut32_1), .accMetMuxOut_2(accMuxOut32_2), .accMetMuxOut_3(accMuxOut32_3), .selOut(selOut35), .normalizeIn(s), .normalizeOut(s35), .accMetOut(accMetOut35), .iOut(/*iOut35*/), .qOut(qOut35), .symEnOut(), .sym2xEnOut());
   acsMultH #( 5, 0,11, 6,   5, 1,13, 9, ACS_BITS, MF_BITS, ROT_BITS, 0)  acsMultH20   (.clk(clk), .reset(reset), .symEn(symEnRotMux), .sym2xEn(sym2xEnRotMux), .symEnEven(symEnEvenIn), .symEnEvenRot(symEnEvenRotMux), .iMfInRot(iMfInRot0), .qMfInRot(qMfInRot0), .accMetMuxOut_0(accMuxOut20_0), .accMetMuxOut_1(accMuxOut20_1), .accMetMuxOut_2(accMuxOut20_2), .accMetMuxOut_3(accMuxOut20_3), .selOut(selOut20), .normalizeIn(s), .normalizeOut(s20), .accMetOut(accMetOut20), .iOut(/*iOut20*/), .qOut(qOut20), .symEnOut(), .sym2xEnOut());
   acsMultH #( 1,12, 7, 2,   1,13, 9, 5, ACS_BITS, MF_BITS, ROT_BITS, 0)  acsMultH5    (.clk(clk), .reset(reset), .symEn(symEnRotMux), .sym2xEn(sym2xEnRotMux), .symEnEven(symEnEvenIn), .symEnEvenRot(symEnEvenRotMux), .iMfInRot(iMfInRot1), .qMfInRot(qMfInRot1), .accMetMuxOut_0(accMuxOut4_0 ), .accMetMuxOut_1(accMuxOut4_1 ), .accMetMuxOut_2(accMuxOut4_2 ), .accMetMuxOut_3(accMuxOut4_3 ), .selOut(selOut5 ), .normalizeIn(s), .normalizeOut(s5 ), .accMetOut(accMetOut5 ), .iOut(/*iOut5 */), .qOut(qOut5 ), .symEnOut(), .sym2xEnOut());
   acsMultH #(13, 8, 3,14,  13, 9, 5, 1, ACS_BITS, MF_BITS, ROT_BITS, 0)  acsMultH54   (.clk(clk), .reset(reset), .symEn(symEnRotMux), .sym2xEn(sym2xEnRotMux), .symEnEven(symEnEvenIn), .symEnEvenRot(symEnEvenRotMux), .iMfInRot(iMfInRot2), .qMfInRot(qMfInRot2), .accMetMuxOut_0(accMuxOut52_0), .accMetMuxOut_1(accMuxOut52_1), .accMetMuxOut_2(accMuxOut52_2), .accMetMuxOut_3(accMuxOut52_3), .selOut(selOut54), .normalizeIn(s), .normalizeOut(s54), .accMetOut(accMetOut54), .iOut(/*iOut54*/), .qOut(qOut54), .symEnOut(), .sym2xEnOut());
   acsMultH #( 9, 4,15,10,   9, 5, 1,13, ACS_BITS, MF_BITS, ROT_BITS, 0)  acsMultH39   (.clk(clk), .reset(reset), .symEn(symEnRotMux), .sym2xEn(sym2xEnRotMux), .symEnEven(symEnEvenIn), .symEnEvenRot(symEnEvenRotMux), .iMfInRot(iMfInRot3), .qMfInRot(qMfInRot3), .accMetMuxOut_0(accMuxOut36_0), .accMetMuxOut_1(accMuxOut36_1), .accMetMuxOut_2(accMuxOut36_2), .accMetMuxOut_3(accMuxOut36_3), .selOut(selOut39), .normalizeIn(s), .normalizeOut(s39), .accMetOut(accMetOut39), .iOut(/*iOut39*/), .qOut(qOut39), .symEnOut(), .sym2xEnOut());
   acsMultH #( 6, 1,12, 7,   6, 2,14,10, ACS_BITS, MF_BITS, ROT_BITS, 0)  acsMultH24   (.clk(clk), .reset(reset), .symEn(symEnRotMux), .sym2xEn(sym2xEnRotMux), .symEnEven(symEnEvenIn), .symEnEvenRot(symEnEvenRotMux), .iMfInRot(iMfInRot0), .qMfInRot(qMfInRot0), .accMetMuxOut_0(accMuxOut24_0), .accMetMuxOut_1(accMuxOut24_1), .accMetMuxOut_2(accMuxOut24_2), .accMetMuxOut_3(accMuxOut24_3), .selOut(selOut24), .normalizeIn(s), .normalizeOut(s24), .accMetOut(accMetOut24), .iOut(/*iOut24*/), .qOut(qOut24), .symEnOut(), .sym2xEnOut());
   acsMultH #( 2,13, 8, 3,   2,14,10, 6, ACS_BITS, MF_BITS, ROT_BITS, 0)  acsMultH9    (.clk(clk), .reset(reset), .symEn(symEnRotMux), .sym2xEn(sym2xEnRotMux), .symEnEven(symEnEvenIn), .symEnEvenRot(symEnEvenRotMux), .iMfInRot(iMfInRot1), .qMfInRot(qMfInRot1), .accMetMuxOut_0(accMuxOut8_0 ), .accMetMuxOut_1(accMuxOut8_1 ), .accMetMuxOut_2(accMuxOut8_2 ), .accMetMuxOut_3(accMuxOut8_3 ), .selOut(selOut9 ), .normalizeIn(s), .normalizeOut(s9 ), .accMetOut(accMetOut9 ), .iOut(/*iOut9 */), .qOut(qOut9 ), .symEnOut(), .sym2xEnOut());
   acsMultH #( 14,9, 4,15,  14,10, 6, 2, ACS_BITS, MF_BITS, ROT_BITS, 0)  acsMultH58   (.clk(clk), .reset(reset), .symEn(symEnRotMux), .sym2xEn(sym2xEnRotMux), .symEnEven(symEnEvenIn), .symEnEvenRot(symEnEvenRotMux), .iMfInRot(iMfInRot2), .qMfInRot(qMfInRot2), .accMetMuxOut_0(accMuxOut56_0), .accMetMuxOut_1(accMuxOut56_1), .accMetMuxOut_2(accMuxOut56_2), .accMetMuxOut_3(accMuxOut56_3), .selOut(selOut58), .normalizeIn(s), .normalizeOut(s58), .accMetOut(accMetOut58), .iOut(/*iOut58*/), .qOut(qOut58), .symEnOut(), .sym2xEnOut());
   acsMultH #(10, 5, 0,11,  10, 6, 2,14, ACS_BITS, MF_BITS, ROT_BITS, 0)  acsMultH43   (.clk(clk), .reset(reset), .symEn(symEnRotMux), .sym2xEn(sym2xEnRotMux), .symEnEven(symEnEvenIn), .symEnEvenRot(symEnEvenRotMux), .iMfInRot(iMfInRot3), .qMfInRot(qMfInRot3), .accMetMuxOut_0(accMuxOut40_0), .accMetMuxOut_1(accMuxOut40_1), .accMetMuxOut_2(accMuxOut40_2), .accMetMuxOut_3(accMuxOut40_3), .selOut(selOut43), .normalizeIn(s), .normalizeOut(s43), .accMetOut(accMetOut43), .iOut(/*iOut43*/), .qOut(qOut43), .symEnOut(), .sym2xEnOut());
   acsMultH #( 7, 2,13, 8,   7, 3,15,11, ACS_BITS, MF_BITS, ROT_BITS, 0)  acsMultH28   (.clk(clk), .reset(reset), .symEn(symEnRotMux), .sym2xEn(sym2xEnRotMux), .symEnEven(symEnEvenIn), .symEnEvenRot(symEnEvenRotMux), .iMfInRot(iMfInRot0), .qMfInRot(qMfInRot0), .accMetMuxOut_0(accMuxOut28_0), .accMetMuxOut_1(accMuxOut28_1), .accMetMuxOut_2(accMuxOut28_2), .accMetMuxOut_3(accMuxOut28_3), .selOut(selOut28), .normalizeIn(s), .normalizeOut(s28), .accMetOut(accMetOut28), .iOut(/*iOut28*/), .qOut(qOut28), .symEnOut(), .sym2xEnOut());
   acsMultH #( 3,14, 9, 4,   3,15,11, 7, ACS_BITS, MF_BITS, ROT_BITS, 0)  acsMultH13   (.clk(clk), .reset(reset), .symEn(symEnRotMux), .sym2xEn(sym2xEnRotMux), .symEnEven(symEnEvenIn), .symEnEvenRot(symEnEvenRotMux), .iMfInRot(iMfInRot1), .qMfInRot(qMfInRot1), .accMetMuxOut_0(accMuxOut12_0), .accMetMuxOut_1(accMuxOut12_1), .accMetMuxOut_2(accMuxOut12_2), .accMetMuxOut_3(accMuxOut12_3), .selOut(selOut13), .normalizeIn(s), .normalizeOut(s13), .accMetOut(accMetOut13), .iOut(/*iOut13*/), .qOut(qOut13), .symEnOut(), .sym2xEnOut());
   acsMultH #(15,10, 5, 0,  15,11, 7, 3, ACS_BITS, MF_BITS, ROT_BITS, 0)  acsMultH62   (.clk(clk), .reset(reset), .symEn(symEnRotMux), .sym2xEn(sym2xEnRotMux), .symEnEven(symEnEvenIn), .symEnEvenRot(symEnEvenRotMux), .iMfInRot(iMfInRot2), .qMfInRot(qMfInRot2), .accMetMuxOut_0(accMuxOut60_0), .accMetMuxOut_1(accMuxOut60_1), .accMetMuxOut_2(accMuxOut60_2), .accMetMuxOut_3(accMuxOut60_3), .selOut(selOut62), .normalizeIn(s), .normalizeOut(s62), .accMetOut(accMetOut62), .iOut(/*iOut62*/), .qOut(qOut62), .symEnOut(), .sym2xEnOut());
   acsMultH #(11, 6, 1,12,  11, 7, 3,15, ACS_BITS, MF_BITS, ROT_BITS, 0)  acsMultH47   (.clk(clk), .reset(reset), .symEn(symEnRotMux), .sym2xEn(sym2xEnRotMux), .symEnEven(symEnEvenIn), .symEnEvenRot(symEnEvenRotMux), .iMfInRot(iMfInRot3), .qMfInRot(qMfInRot3), .accMetMuxOut_0(accMuxOut44_0), .accMetMuxOut_1(accMuxOut44_1), .accMetMuxOut_2(accMuxOut44_2), .accMetMuxOut_3(accMuxOut44_3), .selOut(selOut47), .normalizeIn(s), .normalizeOut(s47), .accMetOut(accMetOut47), .iOut(/*iOut47*/), .qOut(qOut47), .symEnOut(), .sym2xEnOut());
   acsMultH #( 8, 3,14, 9,   8, 4, 0,12, ACS_BITS, MF_BITS, ROT_BITS, 0)  acsMultH32   (.clk(clk), .reset(reset), .symEn(symEnRotMux), .sym2xEn(sym2xEnRotMux), .symEnEven(symEnEvenIn), .symEnEvenRot(symEnEvenRotMux), .iMfInRot(iMfInRot0), .qMfInRot(qMfInRot0), .accMetMuxOut_0(accMuxOut32_0), .accMetMuxOut_1(accMuxOut32_1), .accMetMuxOut_2(accMuxOut32_2), .accMetMuxOut_3(accMuxOut32_3), .selOut(selOut32), .normalizeIn(s), .normalizeOut(s32), .accMetOut(accMetOut32), .iOut(/*iOut32*/), .qOut(qOut32), .symEnOut(), .sym2xEnOut());
   acsMultH #( 4,15,10, 5,   4, 0,12, 8, ACS_BITS, MF_BITS, ROT_BITS, 0)  acsMultH17   (.clk(clk), .reset(reset), .symEn(symEnRotMux), .sym2xEn(sym2xEnRotMux), .symEnEven(symEnEvenIn), .symEnEvenRot(symEnEvenRotMux), .iMfInRot(iMfInRot1), .qMfInRot(qMfInRot1), .accMetMuxOut_0(accMuxOut16_0), .accMetMuxOut_1(accMuxOut16_1), .accMetMuxOut_2(accMuxOut16_2), .accMetMuxOut_3(accMuxOut16_3), .selOut(selOut17), .normalizeIn(s), .normalizeOut(s17), .accMetOut(accMetOut17), .iOut(/*iOut17*/), .qOut(qOut17), .symEnOut(), .sym2xEnOut());
   acsMultH #( 0,11, 6, 1,   0,12, 8, 4, ACS_BITS, MF_BITS, ROT_BITS, 0)  acsMultH2    (.clk(clk), .reset(reset), .symEn(symEnRotMux), .sym2xEn(sym2xEnRotMux), .symEnEven(symEnEvenIn), .symEnEvenRot(symEnEvenRotMux), .iMfInRot(iMfInRot2), .qMfInRot(qMfInRot2), .accMetMuxOut_0(accMuxOut0_0 ), .accMetMuxOut_1(accMuxOut0_1 ), .accMetMuxOut_2(accMuxOut0_2 ), .accMetMuxOut_3(accMuxOut0_3 ), .selOut(selOut2 ), .normalizeIn(s), .normalizeOut(s2 ), .accMetOut(accMetOut2 ), .iOut(/*iOut2 */), .qOut(qOut2 ), .symEnOut(), .sym2xEnOut());
   acsMultH #(12, 7, 2,13,  12, 8, 4, 0, ACS_BITS, MF_BITS, ROT_BITS, 0)  acsMultH51   (.clk(clk), .reset(reset), .symEn(symEnRotMux), .sym2xEn(sym2xEnRotMux), .symEnEven(symEnEvenIn), .symEnEvenRot(symEnEvenRotMux), .iMfInRot(iMfInRot3), .qMfInRot(qMfInRot3), .accMetMuxOut_0(accMuxOut48_0), .accMetMuxOut_1(accMuxOut48_1), .accMetMuxOut_2(accMuxOut48_2), .accMetMuxOut_3(accMuxOut48_3), .selOut(selOut51), .normalizeIn(s), .normalizeOut(s51), .accMetOut(accMetOut51), .iOut(/*iOut51*/), .qOut(qOut51), .symEnOut(), .sym2xEnOut());
   acsMultH #( 9, 4,15,10,   9, 5, 1,13, ACS_BITS, MF_BITS, ROT_BITS, 0)  acsMultH36   (.clk(clk), .reset(reset), .symEn(symEnRotMux), .sym2xEn(sym2xEnRotMux), .symEnEven(symEnEvenIn), .symEnEvenRot(symEnEvenRotMux), .iMfInRot(iMfInRot0), .qMfInRot(qMfInRot0), .accMetMuxOut_0(accMuxOut36_0), .accMetMuxOut_1(accMuxOut36_1), .accMetMuxOut_2(accMuxOut36_2), .accMetMuxOut_3(accMuxOut36_3), .selOut(selOut36), .normalizeIn(s), .normalizeOut(s36), .accMetOut(accMetOut36), .iOut(/*iOut36*/), .qOut(qOut36), .symEnOut(), .sym2xEnOut());
   acsMultH #( 5, 0,11, 6,   5, 1,13, 9, ACS_BITS, MF_BITS, ROT_BITS, 0)  acsMultH21   (.clk(clk), .reset(reset), .symEn(symEnRotMux), .sym2xEn(sym2xEnRotMux), .symEnEven(symEnEvenIn), .symEnEvenRot(symEnEvenRotMux), .iMfInRot(iMfInRot1), .qMfInRot(qMfInRot1), .accMetMuxOut_0(accMuxOut20_0), .accMetMuxOut_1(accMuxOut20_1), .accMetMuxOut_2(accMuxOut20_2), .accMetMuxOut_3(accMuxOut20_3), .selOut(selOut21), .normalizeIn(s), .normalizeOut(s21), .accMetOut(accMetOut21), .iOut(/*iOut21*/), .qOut(qOut21), .symEnOut(), .sym2xEnOut());
   acsMultH #( 1,12, 7, 2,   1,13, 9, 5, ACS_BITS, MF_BITS, ROT_BITS, 0)  acsMultH6    (.clk(clk), .reset(reset), .symEn(symEnRotMux), .sym2xEn(sym2xEnRotMux), .symEnEven(symEnEvenIn), .symEnEvenRot(symEnEvenRotMux), .iMfInRot(iMfInRot2), .qMfInRot(qMfInRot2), .accMetMuxOut_0(accMuxOut4_0 ), .accMetMuxOut_1(accMuxOut4_1 ), .accMetMuxOut_2(accMuxOut4_2 ), .accMetMuxOut_3(accMuxOut4_3 ), .selOut(selOut6 ), .normalizeIn(s), .normalizeOut(s6 ), .accMetOut(accMetOut6 ), .iOut(/*iOut6 */), .qOut(qOut6 ), .symEnOut(), .sym2xEnOut());
   acsMultH #(13, 8, 3,14,  13, 9, 5, 1, ACS_BITS, MF_BITS, ROT_BITS, 0)  acsMultH55   (.clk(clk), .reset(reset), .symEn(symEnRotMux), .sym2xEn(sym2xEnRotMux), .symEnEven(symEnEvenIn), .symEnEvenRot(symEnEvenRotMux), .iMfInRot(iMfInRot3), .qMfInRot(qMfInRot3), .accMetMuxOut_0(accMuxOut52_0), .accMetMuxOut_1(accMuxOut52_1), .accMetMuxOut_2(accMuxOut52_2), .accMetMuxOut_3(accMuxOut52_3), .selOut(selOut55), .normalizeIn(s), .normalizeOut(s55), .accMetOut(accMetOut55), .iOut(/*iOut55*/), .qOut(qOut55), .symEnOut(), .sym2xEnOut());
   acsMultH #(10, 5, 0,11,  10, 6, 2,14, ACS_BITS, MF_BITS, ROT_BITS, 0)  acsMultH40   (.clk(clk), .reset(reset), .symEn(symEnRotMux), .sym2xEn(sym2xEnRotMux), .symEnEven(symEnEvenIn), .symEnEvenRot(symEnEvenRotMux), .iMfInRot(iMfInRot0), .qMfInRot(qMfInRot0), .accMetMuxOut_0(accMuxOut40_0), .accMetMuxOut_1(accMuxOut40_1), .accMetMuxOut_2(accMuxOut40_2), .accMetMuxOut_3(accMuxOut40_3), .selOut(selOut40), .normalizeIn(s), .normalizeOut(s40), .accMetOut(accMetOut40), .iOut(/*iOut40*/), .qOut(qOut40), .symEnOut(), .sym2xEnOut());
   acsMultH #( 6, 1,12, 7,   6, 2,14,10, ACS_BITS, MF_BITS, ROT_BITS, 0)  acsMultH25   (.clk(clk), .reset(reset), .symEn(symEnRotMux), .sym2xEn(sym2xEnRotMux), .symEnEven(symEnEvenIn), .symEnEvenRot(symEnEvenRotMux), .iMfInRot(iMfInRot1), .qMfInRot(qMfInRot1), .accMetMuxOut_0(accMuxOut24_0), .accMetMuxOut_1(accMuxOut24_1), .accMetMuxOut_2(accMuxOut24_2), .accMetMuxOut_3(accMuxOut24_3), .selOut(selOut25), .normalizeIn(s), .normalizeOut(s25), .accMetOut(accMetOut25), .iOut(/*iOut25*/), .qOut(qOut25), .symEnOut(), .sym2xEnOut());
   acsMultH #( 2,13, 8, 3,   2,14,10, 6, ACS_BITS, MF_BITS, ROT_BITS, 0)  acsMultH10   (.clk(clk), .reset(reset), .symEn(symEnRotMux), .sym2xEn(sym2xEnRotMux), .symEnEven(symEnEvenIn), .symEnEvenRot(symEnEvenRotMux), .iMfInRot(iMfInRot2), .qMfInRot(qMfInRot2), .accMetMuxOut_0(accMuxOut8_0 ), .accMetMuxOut_1(accMuxOut8_1 ), .accMetMuxOut_2(accMuxOut8_2 ), .accMetMuxOut_3(accMuxOut8_3 ), .selOut(selOut10), .normalizeIn(s), .normalizeOut(s10), .accMetOut(accMetOut10), .iOut(/*iOut10*/), .qOut(qOut10), .symEnOut(), .sym2xEnOut());
   acsMultH #(14, 9, 4,15,  14,10, 6, 2, ACS_BITS, MF_BITS, ROT_BITS, 0)  acsMultH59   (.clk(clk), .reset(reset), .symEn(symEnRotMux), .sym2xEn(sym2xEnRotMux), .symEnEven(symEnEvenIn), .symEnEvenRot(symEnEvenRotMux), .iMfInRot(iMfInRot3), .qMfInRot(qMfInRot3), .accMetMuxOut_0(accMuxOut56_0), .accMetMuxOut_1(accMuxOut56_1), .accMetMuxOut_2(accMuxOut56_2), .accMetMuxOut_3(accMuxOut56_3), .selOut(selOut59), .normalizeIn(s), .normalizeOut(s59), .accMetOut(accMetOut59), .iOut(/*iOut59*/), .qOut(qOut59), .symEnOut(), .sym2xEnOut());
   acsMultH #(11, 6, 1,12,  11, 7, 3,15, ACS_BITS, MF_BITS, ROT_BITS, 0)  acsMultH44   (.clk(clk), .reset(reset), .symEn(symEnRotMux), .sym2xEn(sym2xEnRotMux), .symEnEven(symEnEvenIn), .symEnEvenRot(symEnEvenRotMux), .iMfInRot(iMfInRot0), .qMfInRot(qMfInRot0), .accMetMuxOut_0(accMuxOut44_0), .accMetMuxOut_1(accMuxOut44_1), .accMetMuxOut_2(accMuxOut44_2), .accMetMuxOut_3(accMuxOut44_3), .selOut(selOut44), .normalizeIn(s), .normalizeOut(s44), .accMetOut(accMetOut44), .iOut(/*iOut44*/), .qOut(qOut44), .symEnOut(), .sym2xEnOut());
   acsMultH #( 7, 2,13, 8,   7, 3,15,11, ACS_BITS, MF_BITS, ROT_BITS, 0)  acsMultH29   (.clk(clk), .reset(reset), .symEn(symEnRotMux), .sym2xEn(sym2xEnRotMux), .symEnEven(symEnEvenIn), .symEnEvenRot(symEnEvenRotMux), .iMfInRot(iMfInRot1), .qMfInRot(qMfInRot1), .accMetMuxOut_0(accMuxOut28_0), .accMetMuxOut_1(accMuxOut28_1), .accMetMuxOut_2(accMuxOut28_2), .accMetMuxOut_3(accMuxOut28_3), .selOut(selOut29), .normalizeIn(s), .normalizeOut(s29), .accMetOut(accMetOut29), .iOut(/*iOut29*/), .qOut(qOut29), .symEnOut(), .sym2xEnOut());
   acsMultH #( 3,14, 9, 4,   3,15,11, 7, ACS_BITS, MF_BITS, ROT_BITS, 0)  acsMultH14   (.clk(clk), .reset(reset), .symEn(symEnRotMux), .sym2xEn(sym2xEnRotMux), .symEnEven(symEnEvenIn), .symEnEvenRot(symEnEvenRotMux), .iMfInRot(iMfInRot2), .qMfInRot(qMfInRot2), .accMetMuxOut_0(accMuxOut12_0), .accMetMuxOut_1(accMuxOut12_1), .accMetMuxOut_2(accMuxOut12_2), .accMetMuxOut_3(accMuxOut12_3), .selOut(selOut14), .normalizeIn(s), .normalizeOut(s14), .accMetOut(accMetOut14), .iOut(/*iOut14*/), .qOut(qOut14), .symEnOut(), .sym2xEnOut());
   acsMultH #(15,10, 5, 0,  15,11, 7, 3, ACS_BITS, MF_BITS, ROT_BITS, 0)  acsMultH63   (.clk(clk), .reset(reset), .symEn(symEnRotMux), .sym2xEn(sym2xEnRotMux), .symEnEven(symEnEvenIn), .symEnEvenRot(symEnEvenRotMux), .iMfInRot(iMfInRot3), .qMfInRot(qMfInRot3), .accMetMuxOut_0(accMuxOut60_0), .accMetMuxOut_1(accMuxOut60_1), .accMetMuxOut_2(accMuxOut60_2), .accMetMuxOut_3(accMuxOut60_3), .selOut(selOut63), .normalizeIn(s), .normalizeOut(s63), .accMetOut(accMetOut63), .iOut(/*iOut63*/), .qOut(qOut63), .symEnOut(), .sym2xEnOut());
   acsMultH #(12, 7, 2,13,  12, 8, 4, 0, ACS_BITS, MF_BITS, ROT_BITS, 0)  acsMultH48   (.clk(clk), .reset(reset), .symEn(symEnRotMux), .sym2xEn(sym2xEnRotMux), .symEnEven(symEnEvenIn), .symEnEvenRot(symEnEvenRotMux), .iMfInRot(iMfInRot0), .qMfInRot(qMfInRot0), .accMetMuxOut_0(accMuxOut48_0), .accMetMuxOut_1(accMuxOut48_1), .accMetMuxOut_2(accMuxOut48_2), .accMetMuxOut_3(accMuxOut48_3), .selOut(selOut48), .normalizeIn(s), .normalizeOut(s48), .accMetOut(accMetOut48), .iOut(/*iOut48*/), .qOut(qOut48), .symEnOut(), .sym2xEnOut());
   acsMultH #( 8, 3,14, 9,   8, 4, 0,12, ACS_BITS, MF_BITS, ROT_BITS, 0)  acsMultH33   (.clk(clk), .reset(reset), .symEn(symEnRotMux), .sym2xEn(sym2xEnRotMux), .symEnEven(symEnEvenIn), .symEnEvenRot(symEnEvenRotMux), .iMfInRot(iMfInRot1), .qMfInRot(qMfInRot1), .accMetMuxOut_0(accMuxOut32_0), .accMetMuxOut_1(accMuxOut32_1), .accMetMuxOut_2(accMuxOut32_2), .accMetMuxOut_3(accMuxOut32_3), .selOut(selOut33), .normalizeIn(s), .normalizeOut(s33), .accMetOut(accMetOut33), .iOut(/*iOut33*/), .qOut(qOut33), .symEnOut(), .sym2xEnOut());
   acsMultH #( 4,15,10, 5,   4, 0,12, 8, ACS_BITS, MF_BITS, ROT_BITS, 0)  acsMultH18   (.clk(clk), .reset(reset), .symEn(symEnRotMux), .sym2xEn(sym2xEnRotMux), .symEnEven(symEnEvenIn), .symEnEvenRot(symEnEvenRotMux), .iMfInRot(iMfInRot2), .qMfInRot(qMfInRot2), .accMetMuxOut_0(accMuxOut16_0), .accMetMuxOut_1(accMuxOut16_1), .accMetMuxOut_2(accMuxOut16_2), .accMetMuxOut_3(accMuxOut16_3), .selOut(selOut18), .normalizeIn(s), .normalizeOut(s18), .accMetOut(accMetOut18), .iOut(/*iOut18*/), .qOut(qOut18), .symEnOut(), .sym2xEnOut());
   acsMultH #( 0,11, 6, 1,   0,12, 8, 4, ACS_BITS, MF_BITS, ROT_BITS, 0)  acsMultH3    (.clk(clk), .reset(reset), .symEn(symEnRotMux), .sym2xEn(sym2xEnRotMux), .symEnEven(symEnEvenIn), .symEnEvenRot(symEnEvenRotMux), .iMfInRot(iMfInRot3), .qMfInRot(qMfInRot3), .accMetMuxOut_0(accMuxOut0_0 ), .accMetMuxOut_1(accMuxOut0_1 ), .accMetMuxOut_2(accMuxOut0_2 ), .accMetMuxOut_3(accMuxOut0_3 ), .selOut(selOut3 ), .normalizeIn(s), .normalizeOut(s3 ), .accMetOut(accMetOut3 ), .iOut(/*iOut3 */), .qOut(qOut3 ), .symEnOut(), .sym2xEnOut());
   acsMultH #(13, 8, 3,14,  13, 9, 5, 1, ACS_BITS, MF_BITS, ROT_BITS, 0)  acsMultH52   (.clk(clk), .reset(reset), .symEn(symEnRotMux), .sym2xEn(sym2xEnRotMux), .symEnEven(symEnEvenIn), .symEnEvenRot(symEnEvenRotMux), .iMfInRot(iMfInRot0), .qMfInRot(qMfInRot0), .accMetMuxOut_0(accMuxOut52_0), .accMetMuxOut_1(accMuxOut52_1), .accMetMuxOut_2(accMuxOut52_2), .accMetMuxOut_3(accMuxOut52_3), .selOut(selOut52), .normalizeIn(s), .normalizeOut(s52), .accMetOut(accMetOut52), .iOut(/*iOut52*/), .qOut(qOut52), .symEnOut(), .sym2xEnOut());
   acsMultH #( 9, 4,15,10,   9, 5, 1,13, ACS_BITS, MF_BITS, ROT_BITS, 0)  acsMultH37   (.clk(clk), .reset(reset), .symEn(symEnRotMux), .sym2xEn(sym2xEnRotMux), .symEnEven(symEnEvenIn), .symEnEvenRot(symEnEvenRotMux), .iMfInRot(iMfInRot1), .qMfInRot(qMfInRot1), .accMetMuxOut_0(accMuxOut36_0), .accMetMuxOut_1(accMuxOut36_1), .accMetMuxOut_2(accMuxOut36_2), .accMetMuxOut_3(accMuxOut36_3), .selOut(selOut37), .normalizeIn(s), .normalizeOut(s37), .accMetOut(accMetOut37), .iOut(/*iOut37*/), .qOut(qOut37), .symEnOut(), .sym2xEnOut());
   acsMultH #( 5, 0,11, 6,   5, 1,13, 9, ACS_BITS, MF_BITS, ROT_BITS, 0)  acsMultH22   (.clk(clk), .reset(reset), .symEn(symEnRotMux), .sym2xEn(sym2xEnRotMux), .symEnEven(symEnEvenIn), .symEnEvenRot(symEnEvenRotMux), .iMfInRot(iMfInRot2), .qMfInRot(qMfInRot2), .accMetMuxOut_0(accMuxOut20_0), .accMetMuxOut_1(accMuxOut20_1), .accMetMuxOut_2(accMuxOut20_2), .accMetMuxOut_3(accMuxOut20_3), .selOut(selOut22), .normalizeIn(s), .normalizeOut(s22), .accMetOut(accMetOut22), .iOut(/*iOut22*/), .qOut(qOut22), .symEnOut(), .sym2xEnOut());
   acsMultH #( 1,12, 7, 2,   1,13, 9, 5, ACS_BITS, MF_BITS, ROT_BITS, 0)  acsMultH7    (.clk(clk), .reset(reset), .symEn(symEnRotMux), .sym2xEn(sym2xEnRotMux), .symEnEven(symEnEvenIn), .symEnEvenRot(symEnEvenRotMux), .iMfInRot(iMfInRot3), .qMfInRot(qMfInRot3), .accMetMuxOut_0(accMuxOut4_0 ), .accMetMuxOut_1(accMuxOut4_1 ), .accMetMuxOut_2(accMuxOut4_2 ), .accMetMuxOut_3(accMuxOut4_3 ), .selOut(selOut7 ), .normalizeIn(s), .normalizeOut(s7 ), .accMetOut(accMetOut7 ), .iOut(/*iOut7 */), .qOut(qOut7 ), .symEnOut(), .sym2xEnOut());
   acsMultH #(14, 9, 4,15,  14,10, 6, 2, ACS_BITS, MF_BITS, ROT_BITS, 0)  acsMultH56   (.clk(clk), .reset(reset), .symEn(symEnRotMux), .sym2xEn(sym2xEnRotMux), .symEnEven(symEnEvenIn), .symEnEvenRot(symEnEvenRotMux), .iMfInRot(iMfInRot0), .qMfInRot(qMfInRot0), .accMetMuxOut_0(accMuxOut56_0), .accMetMuxOut_1(accMuxOut56_1), .accMetMuxOut_2(accMuxOut56_2), .accMetMuxOut_3(accMuxOut56_3), .selOut(selOut56), .normalizeIn(s), .normalizeOut(s56), .accMetOut(accMetOut56), .iOut(/*iOut56*/), .qOut(qOut56), .symEnOut(), .sym2xEnOut());
   acsMultH #(10, 5, 0,11,  10, 6, 2,14, ACS_BITS, MF_BITS, ROT_BITS, 0)  acsMultH41   (.clk(clk), .reset(reset), .symEn(symEnRotMux), .sym2xEn(sym2xEnRotMux), .symEnEven(symEnEvenIn), .symEnEvenRot(symEnEvenRotMux), .iMfInRot(iMfInRot1), .qMfInRot(qMfInRot1), .accMetMuxOut_0(accMuxOut40_0), .accMetMuxOut_1(accMuxOut40_1), .accMetMuxOut_2(accMuxOut40_2), .accMetMuxOut_3(accMuxOut40_3), .selOut(selOut41), .normalizeIn(s), .normalizeOut(s41), .accMetOut(accMetOut41), .iOut(/*iOut41*/), .qOut(qOut41), .symEnOut(), .sym2xEnOut());
   acsMultH #( 6, 1,12, 7,   6, 2,14,10, ACS_BITS, MF_BITS, ROT_BITS, 0)  acsMultH26   (.clk(clk), .reset(reset), .symEn(symEnRotMux), .sym2xEn(sym2xEnRotMux), .symEnEven(symEnEvenIn), .symEnEvenRot(symEnEvenRotMux), .iMfInRot(iMfInRot2), .qMfInRot(qMfInRot2), .accMetMuxOut_0(accMuxOut24_0), .accMetMuxOut_1(accMuxOut24_1), .accMetMuxOut_2(accMuxOut24_2), .accMetMuxOut_3(accMuxOut24_3), .selOut(selOut26), .normalizeIn(s), .normalizeOut(s26), .accMetOut(accMetOut26), .iOut(/*iOut26*/), .qOut(qOut26), .symEnOut(), .sym2xEnOut());
   acsMultH #( 2,13, 8, 3,   2,14,10, 6, ACS_BITS, MF_BITS, ROT_BITS, 0)  acsMultH11   (.clk(clk), .reset(reset), .symEn(symEnRotMux), .sym2xEn(sym2xEnRotMux), .symEnEven(symEnEvenIn), .symEnEvenRot(symEnEvenRotMux), .iMfInRot(iMfInRot3), .qMfInRot(qMfInRot3), .accMetMuxOut_0(accMuxOut8_0 ), .accMetMuxOut_1(accMuxOut8_1 ), .accMetMuxOut_2(accMuxOut8_2 ), .accMetMuxOut_3(accMuxOut8_3 ), .selOut(selOut11), .normalizeIn(s), .normalizeOut(s11), .accMetOut(accMetOut11), .iOut(/*iOut11*/), .qOut(qOut11), .symEnOut(), .sym2xEnOut());
   acsMultH #(15,10, 5, 0,  15,11, 7, 3, ACS_BITS, MF_BITS, ROT_BITS, 0)  acsMultH60   (.clk(clk), .reset(reset), .symEn(symEnRotMux), .sym2xEn(sym2xEnRotMux), .symEnEven(symEnEvenIn), .symEnEvenRot(symEnEvenRotMux), .iMfInRot(iMfInRot0), .qMfInRot(qMfInRot0), .accMetMuxOut_0(accMuxOut60_0), .accMetMuxOut_1(accMuxOut60_1), .accMetMuxOut_2(accMuxOut60_2), .accMetMuxOut_3(accMuxOut60_3), .selOut(selOut60), .normalizeIn(s), .normalizeOut(s60), .accMetOut(accMetOut60), .iOut(/*iOut60*/), .qOut(qOut60), .symEnOut(), .sym2xEnOut());
   acsMultH #(11, 6, 1,12,  11, 7, 3,15, ACS_BITS, MF_BITS, ROT_BITS, 0)  acsMultH45   (.clk(clk), .reset(reset), .symEn(symEnRotMux), .sym2xEn(sym2xEnRotMux), .symEnEven(symEnEvenIn), .symEnEvenRot(symEnEvenRotMux), .iMfInRot(iMfInRot1), .qMfInRot(qMfInRot1), .accMetMuxOut_0(accMuxOut44_0), .accMetMuxOut_1(accMuxOut44_1), .accMetMuxOut_2(accMuxOut44_2), .accMetMuxOut_3(accMuxOut44_3), .selOut(selOut45), .normalizeIn(s), .normalizeOut(s45), .accMetOut(accMetOut45), .iOut(/*iOut45*/), .qOut(qOut45), .symEnOut(), .sym2xEnOut());
   acsMultH #( 7, 2,13, 8,   7, 3,15,11, ACS_BITS, MF_BITS, ROT_BITS, 0)  acsMultH30   (.clk(clk), .reset(reset), .symEn(symEnRotMux), .sym2xEn(sym2xEnRotMux), .symEnEven(symEnEvenIn), .symEnEvenRot(symEnEvenRotMux), .iMfInRot(iMfInRot2), .qMfInRot(qMfInRot2), .accMetMuxOut_0(accMuxOut28_0), .accMetMuxOut_1(accMuxOut28_1), .accMetMuxOut_2(accMuxOut28_2), .accMetMuxOut_3(accMuxOut28_3), .selOut(selOut30), .normalizeIn(s), .normalizeOut(s30), .accMetOut(accMetOut30), .iOut(/*iOut30*/), .qOut(qOut30), .symEnOut(), .sym2xEnOut());
   acsMultH #( 3,14, 9, 4,   3,15,11, 7, ACS_BITS, MF_BITS, ROT_BITS, 0)  acsMultH15   (.clk(clk), .reset(reset), .symEn(symEnRotMux), .sym2xEn(sym2xEnRotMux), .symEnEven(symEnEvenIn), .symEnEvenRot(symEnEvenRotMux), .iMfInRot(iMfInRot3), .qMfInRot(qMfInRot3), .accMetMuxOut_0(accMuxOut12_0), .accMetMuxOut_1(accMuxOut12_1), .accMetMuxOut_2(accMuxOut12_2), .accMetMuxOut_3(accMuxOut12_3), .selOut(selOut15), .normalizeIn(s), .normalizeOut(s15), .accMetOut(accMetOut15), .iOut(/*iOut15*/), .qOut(qOut15), .symEnOut(), .sym2xEnOut());

   `ifdef USE_DECAY
   `ifdef USE_VIVADO_CORES
   acsMuxMpy #(ACS_BITS) acsMux0    (.decayFactor(decayFactor), .symEnEven(symEnEvenAcsMux), .accMet_45_0(accMetOut0 ), .accMet_45_1(accMetOut45), .accMet_45_2(accMetOut26), .accMet_45_3(accMetOut7 ), .accMet_54_0(accMetOut0 ), .accMet_54_1(accMetOut49), .accMet_54_2(accMetOut34), .accMet_54_3(accMetOut19), .accMuxOut0(accMuxOut0_0 ), .accMuxOut1(accMuxOut0_1 ), .accMuxOut2(accMuxOut0_2 ), .accMuxOut3(accMuxOut0_3 ));
   `else
   acsMuxLut #(ACS_BITS) acsMux0    (.decayFactor(decayFactor), .symEnEven(symEnEvenAcsMux), .accMet_45_0(accMetOut0 ), .accMet_45_1(accMetOut45), .accMet_45_2(accMetOut26), .accMet_45_3(accMetOut7 ), .accMet_54_0(accMetOut0 ), .accMet_54_1(accMetOut49), .accMet_54_2(accMetOut34), .accMet_54_3(accMetOut19), .accMuxOut0(accMuxOut0_0 ), .accMuxOut1(accMuxOut0_1 ), .accMuxOut2(accMuxOut0_2 ), .accMuxOut3(accMuxOut0_3 ));
   `endif
   acsMuxMpy #(ACS_BITS) acsMux16   (.decayFactor(decayFactor), .symEnEven(symEnEvenAcsMux), .accMet_45_0(accMetOut16), .accMet_45_1(accMetOut61), .accMet_45_2(accMetOut42), .accMet_45_3(accMetOut23), .accMet_54_0(accMetOut16), .accMet_54_1(accMetOut1 ), .accMet_54_2(accMetOut50), .accMet_54_3(accMetOut35), .accMuxOut0(accMuxOut16_0), .accMuxOut1(accMuxOut16_1), .accMuxOut2(accMuxOut16_2), .accMuxOut3(accMuxOut16_3));
   acsMuxMpy #(ACS_BITS) acsMux4    (.decayFactor(decayFactor), .symEnEven(symEnEvenAcsMux), .accMet_45_0(accMetOut4 ), .accMet_45_1(accMetOut49), .accMet_45_2(accMetOut30), .accMet_45_3(accMetOut11), .accMet_54_0(accMetOut4 ), .accMet_54_1(accMetOut53), .accMet_54_2(accMetOut38), .accMet_54_3(accMetOut23), .accMuxOut0(accMuxOut4_0 ), .accMuxOut1(accMuxOut4_1 ), .accMuxOut2(accMuxOut4_2 ), .accMuxOut3(accMuxOut4_3 ));
   acsMuxMpy #(ACS_BITS) acsMux8    (.decayFactor(decayFactor), .symEnEven(symEnEvenAcsMux), .accMet_45_0(accMetOut8 ), .accMet_45_1(accMetOut53), .accMet_45_2(accMetOut34), .accMet_45_3(accMetOut15), .accMet_54_0(accMetOut8 ), .accMet_54_1(accMetOut57), .accMet_54_2(accMetOut42), .accMet_54_3(accMetOut27), .accMuxOut0(accMuxOut8_0 ), .accMuxOut1(accMuxOut8_1 ), .accMuxOut2(accMuxOut8_2 ), .accMuxOut3(accMuxOut8_3 ));
   acsMuxMpy #(ACS_BITS) acsMux12   (.decayFactor(decayFactor), .symEnEven(symEnEvenAcsMux), .accMet_45_0(accMetOut12), .accMet_45_1(accMetOut57), .accMet_45_2(accMetOut38), .accMet_45_3(accMetOut19), .accMet_54_0(accMetOut12), .accMet_54_1(accMetOut61), .accMet_54_2(accMetOut46), .accMet_54_3(accMetOut31), .accMuxOut0(accMuxOut12_0), .accMuxOut1(accMuxOut12_1), .accMuxOut2(accMuxOut12_2), .accMuxOut3(accMuxOut12_3));
   acsMuxMpy #(ACS_BITS) acsMux20   (.decayFactor(decayFactor), .symEnEven(symEnEvenAcsMux), .accMet_45_0(accMetOut20), .accMet_45_1(accMetOut1 ), .accMet_45_2(accMetOut46), .accMet_45_3(accMetOut27), .accMet_54_0(accMetOut20), .accMet_54_1(accMetOut5 ), .accMet_54_2(accMetOut54), .accMet_54_3(accMetOut39), .accMuxOut0(accMuxOut20_0), .accMuxOut1(accMuxOut20_1), .accMuxOut2(accMuxOut20_2), .accMuxOut3(accMuxOut20_3));
   acsMuxMpy #(ACS_BITS) acsMux24   (.decayFactor(decayFactor), .symEnEven(symEnEvenAcsMux), .accMet_45_0(accMetOut24), .accMet_45_1(accMetOut5 ), .accMet_45_2(accMetOut50), .accMet_45_3(accMetOut31), .accMet_54_0(accMetOut24), .accMet_54_1(accMetOut9 ), .accMet_54_2(accMetOut58), .accMet_54_3(accMetOut43), .accMuxOut0(accMuxOut24_0), .accMuxOut1(accMuxOut24_1), .accMuxOut2(accMuxOut24_2), .accMuxOut3(accMuxOut24_3));
   acsMuxMpy #(ACS_BITS) acsMux28   (.decayFactor(decayFactor), .symEnEven(symEnEvenAcsMux), .accMet_45_0(accMetOut28), .accMet_45_1(accMetOut9 ), .accMet_45_2(accMetOut54), .accMet_45_3(accMetOut35), .accMet_54_0(accMetOut28), .accMet_54_1(accMetOut13), .accMet_54_2(accMetOut62), .accMet_54_3(accMetOut47), .accMuxOut0(accMuxOut28_0), .accMuxOut1(accMuxOut28_1), .accMuxOut2(accMuxOut28_2), .accMuxOut3(accMuxOut28_3));
   acsMuxMpy #(ACS_BITS) acsMux32   (.decayFactor(decayFactor), .symEnEven(symEnEvenAcsMux), .accMet_45_0(accMetOut32), .accMet_45_1(accMetOut13), .accMet_45_2(accMetOut58), .accMet_45_3(accMetOut39), .accMet_54_0(accMetOut32), .accMet_54_1(accMetOut17), .accMet_54_2(accMetOut2 ), .accMet_54_3(accMetOut51), .accMuxOut0(accMuxOut32_0), .accMuxOut1(accMuxOut32_1), .accMuxOut2(accMuxOut32_2), .accMuxOut3(accMuxOut32_3));
   acsMuxMpy #(ACS_BITS) acsMux36   (.decayFactor(decayFactor), .symEnEven(symEnEvenAcsMux), .accMet_45_0(accMetOut36), .accMet_45_1(accMetOut17), .accMet_45_2(accMetOut62), .accMet_45_3(accMetOut43), .accMet_54_0(accMetOut36), .accMet_54_1(accMetOut21), .accMet_54_2(accMetOut6 ), .accMet_54_3(accMetOut55), .accMuxOut0(accMuxOut36_0), .accMuxOut1(accMuxOut36_1), .accMuxOut2(accMuxOut36_2), .accMuxOut3(accMuxOut36_3));
   acsMuxMpy #(ACS_BITS) acsMux40   (.decayFactor(decayFactor), .symEnEven(symEnEvenAcsMux), .accMet_45_0(accMetOut40), .accMet_45_1(accMetOut21), .accMet_45_2(accMetOut2 ), .accMet_45_3(accMetOut47), .accMet_54_0(accMetOut40), .accMet_54_1(accMetOut25), .accMet_54_2(accMetOut10), .accMet_54_3(accMetOut59), .accMuxOut0(accMuxOut40_0), .accMuxOut1(accMuxOut40_1), .accMuxOut2(accMuxOut40_2), .accMuxOut3(accMuxOut40_3));
   acsMuxMpy #(ACS_BITS) acsMux44   (.decayFactor(decayFactor), .symEnEven(symEnEvenAcsMux), .accMet_45_0(accMetOut44), .accMet_45_1(accMetOut25), .accMet_45_2(accMetOut6 ), .accMet_45_3(accMetOut51), .accMet_54_0(accMetOut44), .accMet_54_1(accMetOut29), .accMet_54_2(accMetOut14), .accMet_54_3(accMetOut63), .accMuxOut0(accMuxOut44_0), .accMuxOut1(accMuxOut44_1), .accMuxOut2(accMuxOut44_2), .accMuxOut3(accMuxOut44_3));
   acsMuxMpy #(ACS_BITS) acsMux48   (.decayFactor(decayFactor), .symEnEven(symEnEvenAcsMux), .accMet_45_0(accMetOut48), .accMet_45_1(accMetOut29), .accMet_45_2(accMetOut10), .accMet_45_3(accMetOut55), .accMet_54_0(accMetOut48), .accMet_54_1(accMetOut33), .accMet_54_2(accMetOut18), .accMet_54_3(accMetOut3 ), .accMuxOut0(accMuxOut48_0), .accMuxOut1(accMuxOut48_1), .accMuxOut2(accMuxOut48_2), .accMuxOut3(accMuxOut48_3));
   acsMuxMpy #(ACS_BITS) acsMux52   (.decayFactor(decayFactor), .symEnEven(symEnEvenAcsMux), .accMet_45_0(accMetOut52), .accMet_45_1(accMetOut33), .accMet_45_2(accMetOut14), .accMet_45_3(accMetOut59), .accMet_54_0(accMetOut52), .accMet_54_1(accMetOut37), .accMet_54_2(accMetOut22), .accMet_54_3(accMetOut7 ), .accMuxOut0(accMuxOut52_0), .accMuxOut1(accMuxOut52_1), .accMuxOut2(accMuxOut52_2), .accMuxOut3(accMuxOut52_3));
   acsMuxMpy #(ACS_BITS) acsMux56   (.decayFactor(decayFactor), .symEnEven(symEnEvenAcsMux), .accMet_45_0(accMetOut56), .accMet_45_1(accMetOut37), .accMet_45_2(accMetOut18), .accMet_45_3(accMetOut63), .accMet_54_0(accMetOut56), .accMet_54_1(accMetOut41), .accMet_54_2(accMetOut26), .accMet_54_3(accMetOut11), .accMuxOut0(accMuxOut56_0), .accMuxOut1(accMuxOut56_1), .accMuxOut2(accMuxOut56_2), .accMuxOut3(accMuxOut56_3));
   acsMuxMpy #(ACS_BITS) acsMux60   (.decayFactor(decayFactor), .symEnEven(symEnEvenAcsMux), .accMet_45_0(accMetOut60), .accMet_45_1(accMetOut41), .accMet_45_2(accMetOut22), .accMet_45_3(accMetOut3 ), .accMet_54_0(accMetOut60), .accMet_54_1(accMetOut45), .accMet_54_2(accMetOut30), .accMet_54_3(accMetOut15), .accMuxOut0(accMuxOut60_0), .accMuxOut1(accMuxOut60_1), .accMuxOut2(accMuxOut60_2), .accMuxOut3(accMuxOut60_3));
   `else
   acsMux #(ACS_BITS) acsMux0    (.symEnEven(symEnEvenAcsMux), .accMet_45_0(accMetOut0 ), .accMet_45_1(accMetOut45), .accMet_45_2(accMetOut26), .accMet_45_3(accMetOut7 ), .accMet_54_0(accMetOut0 ), .accMet_54_1(accMetOut49), .accMet_54_2(accMetOut34), .accMet_54_3(accMetOut19), .accMuxOut0(accMuxOut0_0 ), .accMuxOut1(accMuxOut0_1 ), .accMuxOut2(accMuxOut0_2 ), .accMuxOut3(accMuxOut0_3 ));
   acsMux #(ACS_BITS) acsMux16   (.symEnEven(symEnEvenAcsMux), .accMet_45_0(accMetOut16), .accMet_45_1(accMetOut61), .accMet_45_2(accMetOut42), .accMet_45_3(accMetOut23), .accMet_54_0(accMetOut16), .accMet_54_1(accMetOut1 ), .accMet_54_2(accMetOut50), .accMet_54_3(accMetOut35), .accMuxOut0(accMuxOut16_0), .accMuxOut1(accMuxOut16_1), .accMuxOut2(accMuxOut16_2), .accMuxOut3(accMuxOut16_3));
   acsMux #(ACS_BITS) acsMux4    (.symEnEven(symEnEvenAcsMux), .accMet_45_0(accMetOut4 ), .accMet_45_1(accMetOut49), .accMet_45_2(accMetOut30), .accMet_45_3(accMetOut11), .accMet_54_0(accMetOut4 ), .accMet_54_1(accMetOut53), .accMet_54_2(accMetOut38), .accMet_54_3(accMetOut23), .accMuxOut0(accMuxOut4_0 ), .accMuxOut1(accMuxOut4_1 ), .accMuxOut2(accMuxOut4_2 ), .accMuxOut3(accMuxOut4_3 ));
   acsMux #(ACS_BITS) acsMux8    (.symEnEven(symEnEvenAcsMux), .accMet_45_0(accMetOut8 ), .accMet_45_1(accMetOut53), .accMet_45_2(accMetOut34), .accMet_45_3(accMetOut15), .accMet_54_0(accMetOut8 ), .accMet_54_1(accMetOut57), .accMet_54_2(accMetOut42), .accMet_54_3(accMetOut27), .accMuxOut0(accMuxOut8_0 ), .accMuxOut1(accMuxOut8_1 ), .accMuxOut2(accMuxOut8_2 ), .accMuxOut3(accMuxOut8_3 ));
   acsMux #(ACS_BITS) acsMux12   (.symEnEven(symEnEvenAcsMux), .accMet_45_0(accMetOut12), .accMet_45_1(accMetOut57), .accMet_45_2(accMetOut38), .accMet_45_3(accMetOut19), .accMet_54_0(accMetOut12), .accMet_54_1(accMetOut61), .accMet_54_2(accMetOut46), .accMet_54_3(accMetOut31), .accMuxOut0(accMuxOut12_0), .accMuxOut1(accMuxOut12_1), .accMuxOut2(accMuxOut12_2), .accMuxOut3(accMuxOut12_3));
   acsMux #(ACS_BITS) acsMux20   (.symEnEven(symEnEvenAcsMux), .accMet_45_0(accMetOut20), .accMet_45_1(accMetOut1 ), .accMet_45_2(accMetOut46), .accMet_45_3(accMetOut27), .accMet_54_0(accMetOut20), .accMet_54_1(accMetOut5 ), .accMet_54_2(accMetOut54), .accMet_54_3(accMetOut39), .accMuxOut0(accMuxOut20_0), .accMuxOut1(accMuxOut20_1), .accMuxOut2(accMuxOut20_2), .accMuxOut3(accMuxOut20_3));
   acsMux #(ACS_BITS) acsMux24   (.symEnEven(symEnEvenAcsMux), .accMet_45_0(accMetOut24), .accMet_45_1(accMetOut5 ), .accMet_45_2(accMetOut50), .accMet_45_3(accMetOut31), .accMet_54_0(accMetOut24), .accMet_54_1(accMetOut9 ), .accMet_54_2(accMetOut58), .accMet_54_3(accMetOut43), .accMuxOut0(accMuxOut24_0), .accMuxOut1(accMuxOut24_1), .accMuxOut2(accMuxOut24_2), .accMuxOut3(accMuxOut24_3));
   acsMux #(ACS_BITS) acsMux28   (.symEnEven(symEnEvenAcsMux), .accMet_45_0(accMetOut28), .accMet_45_1(accMetOut9 ), .accMet_45_2(accMetOut54), .accMet_45_3(accMetOut35), .accMet_54_0(accMetOut28), .accMet_54_1(accMetOut13), .accMet_54_2(accMetOut62), .accMet_54_3(accMetOut47), .accMuxOut0(accMuxOut28_0), .accMuxOut1(accMuxOut28_1), .accMuxOut2(accMuxOut28_2), .accMuxOut3(accMuxOut28_3));
   acsMux #(ACS_BITS) acsMux32   (.symEnEven(symEnEvenAcsMux), .accMet_45_0(accMetOut32), .accMet_45_1(accMetOut13), .accMet_45_2(accMetOut58), .accMet_45_3(accMetOut39), .accMet_54_0(accMetOut32), .accMet_54_1(accMetOut17), .accMet_54_2(accMetOut2 ), .accMet_54_3(accMetOut51), .accMuxOut0(accMuxOut32_0), .accMuxOut1(accMuxOut32_1), .accMuxOut2(accMuxOut32_2), .accMuxOut3(accMuxOut32_3));
   acsMux #(ACS_BITS) acsMux36   (.symEnEven(symEnEvenAcsMux), .accMet_45_0(accMetOut36), .accMet_45_1(accMetOut17), .accMet_45_2(accMetOut62), .accMet_45_3(accMetOut43), .accMet_54_0(accMetOut36), .accMet_54_1(accMetOut21), .accMet_54_2(accMetOut6 ), .accMet_54_3(accMetOut55), .accMuxOut0(accMuxOut36_0), .accMuxOut1(accMuxOut36_1), .accMuxOut2(accMuxOut36_2), .accMuxOut3(accMuxOut36_3));
   acsMux #(ACS_BITS) acsMux40   (.symEnEven(symEnEvenAcsMux), .accMet_45_0(accMetOut40), .accMet_45_1(accMetOut21), .accMet_45_2(accMetOut2 ), .accMet_45_3(accMetOut47), .accMet_54_0(accMetOut40), .accMet_54_1(accMetOut25), .accMet_54_2(accMetOut10), .accMet_54_3(accMetOut59), .accMuxOut0(accMuxOut40_0), .accMuxOut1(accMuxOut40_1), .accMuxOut2(accMuxOut40_2), .accMuxOut3(accMuxOut40_3));
   acsMux #(ACS_BITS) acsMux44   (.symEnEven(symEnEvenAcsMux), .accMet_45_0(accMetOut44), .accMet_45_1(accMetOut25), .accMet_45_2(accMetOut6 ), .accMet_45_3(accMetOut51), .accMet_54_0(accMetOut44), .accMet_54_1(accMetOut29), .accMet_54_2(accMetOut14), .accMet_54_3(accMetOut63), .accMuxOut0(accMuxOut44_0), .accMuxOut1(accMuxOut44_1), .accMuxOut2(accMuxOut44_2), .accMuxOut3(accMuxOut44_3));
   acsMux #(ACS_BITS) acsMux48   (.symEnEven(symEnEvenAcsMux), .accMet_45_0(accMetOut48), .accMet_45_1(accMetOut29), .accMet_45_2(accMetOut10), .accMet_45_3(accMetOut55), .accMet_54_0(accMetOut48), .accMet_54_1(accMetOut33), .accMet_54_2(accMetOut18), .accMet_54_3(accMetOut3 ), .accMuxOut0(accMuxOut48_0), .accMuxOut1(accMuxOut48_1), .accMuxOut2(accMuxOut48_2), .accMuxOut3(accMuxOut48_3));
   acsMux #(ACS_BITS) acsMux52   (.symEnEven(symEnEvenAcsMux), .accMet_45_0(accMetOut52), .accMet_45_1(accMetOut33), .accMet_45_2(accMetOut14), .accMet_45_3(accMetOut59), .accMet_54_0(accMetOut52), .accMet_54_1(accMetOut37), .accMet_54_2(accMetOut22), .accMet_54_3(accMetOut7 ), .accMuxOut0(accMuxOut52_0), .accMuxOut1(accMuxOut52_1), .accMuxOut2(accMuxOut52_2), .accMuxOut3(accMuxOut52_3));
   acsMux #(ACS_BITS) acsMux56   (.symEnEven(symEnEvenAcsMux), .accMet_45_0(accMetOut56), .accMet_45_1(accMetOut37), .accMet_45_2(accMetOut18), .accMet_45_3(accMetOut63), .accMet_54_0(accMetOut56), .accMet_54_1(accMetOut41), .accMet_54_2(accMetOut26), .accMet_54_3(accMetOut11), .accMuxOut0(accMuxOut56_0), .accMuxOut1(accMuxOut56_1), .accMuxOut2(accMuxOut56_2), .accMuxOut3(accMuxOut56_3));
   acsMux #(ACS_BITS) acsMux60   (.symEnEven(symEnEvenAcsMux), .accMet_45_0(accMetOut60), .accMet_45_1(accMetOut41), .accMet_45_2(accMetOut22), .accMet_45_3(accMetOut3 ), .accMet_54_0(accMetOut60), .accMet_54_1(accMetOut45), .accMet_54_2(accMetOut30), .accMet_54_3(accMetOut15), .accMuxOut0(accMuxOut60_0), .accMuxOut1(accMuxOut60_1), .accMuxOut2(accMuxOut60_2), .accMuxOut3(accMuxOut60_3));
   `endif

   maxMetricMultiH  #(ACS_BITS) maxMetric
     (
      .clk(clk),
      .reset(reset),
      .symEn(symEnAcs),
      .sym2xEn(sym2xEnAcs),
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
      .maxVal(maxAcs), .index(index)
      );
    //assign maxAcs = accMetOut0;

   // ----- decision before the traceback -----
   reg [1:0]             acsDecision;
   reg [1:0]             selOut0r , selOut49r , selOut34r , selOut19r , selOut4r , selOut53r , selOut38r , selOut23r ,
                         selOut8r , selOut57r , selOut42r , selOut27r , selOut12r , selOut61r , selOut46r , selOut31r ,
                         selOut16r , selOut1r , selOut50r , selOut35r , selOut20r , selOut5r , selOut54r , selOut39r ,
                         selOut24r , selOut9r , selOut58r , selOut43r , selOut28r , selOut13r , selOut62r , selOut47r ,
                         selOut32r , selOut17r , selOut2r , selOut51r , selOut36r , selOut21r , selOut6r , selOut55r ,
                         selOut40r , selOut25r , selOut10r , selOut59r , selOut44r , selOut29r , selOut14r , selOut63r ,
                         selOut48r , selOut33r , selOut18r , selOut3r , selOut52r , selOut37r , selOut22r , selOut7r ,
                         selOut56r , selOut41r , selOut26r , selOut11r , selOut60r , selOut45r , selOut30r , selOut15r;
   reg [5:0]             indexReg;
   always @(posedge clk)
     begin
        if (reset) begin
           acsDecision  <= 0;
           indexReg  <= 0;
           selOut0r  <= 0; selOut1r  <= 0; selOut2r  <= 0; selOut3r  <= 0; selOut4r  <= 0; selOut5r  <= 0; selOut6r  <= 0; selOut7r  <= 0;
           selOut8r  <= 0; selOut9r  <= 0; selOut10r <= 0; selOut11r <= 0; selOut12r <= 0; selOut13r <= 0; selOut14r <= 0; selOut15r <= 0;
           selOut16r <= 0; selOut17r <= 0; selOut18r <= 0; selOut19r <= 0; selOut20r <= 0; selOut21r <= 0; selOut22r <= 0; selOut23r <= 0;
           selOut24r <= 0; selOut25r <= 0; selOut26r <= 0; selOut27r <= 0; selOut28r <= 0; selOut29r <= 0; selOut30r <= 0; selOut31r <= 0;
           selOut32r <= 0; selOut33r <= 0; selOut34r <= 0; selOut35r <= 0; selOut36r <= 0; selOut37r <= 0; selOut38r <= 0; selOut39r <= 0;
           selOut40r <= 0; selOut41r <= 0; selOut42r <= 0; selOut43r <= 0; selOut44r <= 0; selOut45r <= 0; selOut46r <= 0; selOut47r <= 0;
           selOut48r <= 0; selOut49r <= 0; selOut50r <= 0; selOut51r <= 0; selOut52r <= 0; selOut53r <= 0; selOut54r <= 0; selOut55r <= 0;
           selOut56r <= 0; selOut57r <= 0; selOut58r <= 0; selOut59r <= 0; selOut60r <= 0; selOut61r <= 0; selOut62r <= 0; selOut63r <= 0;
        end
        else if (symEnAcs) begin
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
           selOut21r <= selOut21;
           selOut22r <= selOut22;
           selOut23r <= selOut23;
           selOut24r <= selOut24;
           selOut25r <= selOut25;
           selOut26r <= selOut26;
           selOut27r <= selOut27;
           selOut28r <= selOut28;
           selOut29r <= selOut29;
           selOut30r <= selOut30;
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
           indexReg <= index;
           case (index)
             0 : begin acsDecision <= selOut0 ;end
             1 : begin acsDecision <= selOut1 ;end
             2 : begin acsDecision <= selOut2 ;end
             3 : begin acsDecision <= selOut3 ;end
             4 : begin acsDecision <= selOut4 ;end
             5 : begin acsDecision <= selOut5 ;end
             6 : begin acsDecision <= selOut6 ;end
             7 : begin acsDecision <= selOut7 ;end
             8 : begin acsDecision <= selOut8 ;end
             9 : begin acsDecision <= selOut9 ;end
             10: begin acsDecision <= selOut10;end
             11: begin acsDecision <= selOut11;end
             12: begin acsDecision <= selOut12;end
             13: begin acsDecision <= selOut13;end
             14: begin acsDecision <= selOut14;end
             15: begin acsDecision <= selOut15;end
             16: begin acsDecision <= selOut16;end
             17: begin acsDecision <= selOut17;end
             18: begin acsDecision <= selOut18;end
             19: begin acsDecision <= selOut19;end
             20: begin acsDecision <= selOut20;end
             21: begin acsDecision <= selOut21;end
             22: begin acsDecision <= selOut22;end
             23: begin acsDecision <= selOut23;end
             24: begin acsDecision <= selOut24;end
             25: begin acsDecision <= selOut25;end
             26: begin acsDecision <= selOut26;end
             27: begin acsDecision <= selOut27;end
             28: begin acsDecision <= selOut28;end
             29: begin acsDecision <= selOut29;end
             30: begin acsDecision <= selOut30;end
             31: begin acsDecision <= selOut31;end
             32: begin acsDecision <= selOut32;end
             33: begin acsDecision <= selOut33;end
             34: begin acsDecision <= selOut34;end
             35: begin acsDecision <= selOut35;end
             36: begin acsDecision <= selOut36;end
             37: begin acsDecision <= selOut37;end
             38: begin acsDecision <= selOut38;end
             39: begin acsDecision <= selOut39;end
             40: begin acsDecision <= selOut40;end
             41: begin acsDecision <= selOut41;end
             42: begin acsDecision <= selOut42;end
             43: begin acsDecision <= selOut43;end
             44: begin acsDecision <= selOut44;end
             45: begin acsDecision <= selOut45;end
             46: begin acsDecision <= selOut46;end
             47: begin acsDecision <= selOut47;end
             48: begin acsDecision <= selOut48;end
             49: begin acsDecision <= selOut49;end
             50: begin acsDecision <= selOut50;end
             51: begin acsDecision <= selOut51;end
             52: begin acsDecision <= selOut52;end
             53: begin acsDecision <= selOut53;end
             54: begin acsDecision <= selOut54;end
             55: begin acsDecision <= selOut55;end
             56: begin acsDecision <= selOut56;end
             57: begin acsDecision <= selOut57;end
             58: begin acsDecision <= selOut58;end
             59: begin acsDecision <= selOut59;end
             60: begin acsDecision <= selOut60;end
             61: begin acsDecision <= selOut61;end
             62: begin acsDecision <= selOut62;end
             63: begin acsDecision <= selOut63;end
           endcase
        end
     end


`ifdef USE_TRACEBACK
   wire [1:0] decTbtIn = acsDecision;
`endif

   // Compute the phase Error
   reg phaseErrorValid;
    always @(posedge clk)
     begin
        if (reset) begin
           phaseError0 <= 0;
           phaseError1 <= 0;
           phaseError2 <= 0;
           phaseErrorValid <= 0;
        end
        else if (symEnAcs) begin
           case (index)
             0 :      begin  phaseError1 <= qOut0 ; end
             1 :      begin  phaseError1 <= qOut1 ; end
             2 :      begin  phaseError1 <= qOut2 ; end
             3 :      begin  phaseError1 <= qOut3 ; end
             4 :      begin  phaseError1 <= qOut4 ; end
             5 :      begin  phaseError1 <= qOut5 ; end
             6 :      begin  phaseError1 <= qOut6 ; end
             7 :      begin  phaseError1 <= qOut7 ; end
             8 :      begin  phaseError1 <= qOut8 ; end
             9 :      begin  phaseError1 <= qOut9 ; end
            10 :      begin  phaseError1 <= qOut10 ; end
            11 :      begin  phaseError1 <= qOut11 ; end
            12 :      begin  phaseError1 <= qOut12 ; end
            13 :      begin  phaseError1 <= qOut13 ; end
            14 :      begin  phaseError1 <= qOut14 ; end
            15 :      begin  phaseError1 <= qOut15 ; end
             // default: begin  phaseError1 <= phaseError1; phaseErrorValid <= 0; end
             default: begin  phaseError1 <= 0; end
           endcase
           //phaseErrorValid <= (index[5:3] == 3'b000);
           phaseErrorValid <= (index[5:4] == 2'b00);
        end
     end

   wire [ROT_BITS-1:0]  phaseError = phaseError1;

//   assign phaseErrorEn = symEnAcs & phaseErrorValid;
   assign phaseErrorEn = symEnAcs;


`ifdef USE_TRACEBACK
   wire [1:0] tbDecision;
   traceBackMultiH traceBackMultiH
     (
      .clk       (clk     ),
      .reset     (reset   ),
      .symEn     (symEnAcs),
      .sym2xEn   (sym2xEnAcs),
      .symEnEven (symEnEvenAcsMux),
      .sel0      (selOut0 ), .sel1 (selOut1 ), .sel2 (selOut2 ), .sel3 (selOut3 ), .sel4 (selOut4 ), .sel5 (selOut5 ), .sel6 (selOut6 ), .sel7 (selOut7 ),
      .sel8      (selOut8 ), .sel9 (selOut9 ), .sel10(selOut10), .sel11(selOut11), .sel12(selOut12), .sel13(selOut13), .sel14(selOut14), .sel15(selOut15),
      .sel16     (selOut16), .sel17(selOut17), .sel18(selOut18), .sel19(selOut19), .sel20(selOut20), .sel21(selOut21), .sel22(selOut22), .sel23(selOut23),
      .sel24     (selOut24), .sel25(selOut25), .sel26(selOut26), .sel27(selOut27), .sel28(selOut28), .sel29(selOut29), .sel30(selOut30), .sel31(selOut31),
      .sel32     (selOut32), .sel33(selOut33), .sel34(selOut34), .sel35(selOut35), .sel36(selOut36), .sel37(selOut37), .sel38(selOut38), .sel39(selOut39),
      .sel40     (selOut40), .sel41(selOut41), .sel42(selOut42), .sel43(selOut43), .sel44(selOut44), .sel45(selOut45), .sel46(selOut46), .sel47(selOut47),
      .sel48     (selOut48), .sel49(selOut49), .sel50(selOut50), .sel51(selOut51), .sel52(selOut52), .sel53(selOut53), .sel54(selOut54), .sel55(selOut55),
      .sel56     (selOut56), .sel57(selOut57), .sel58(selOut58), .sel59(selOut59), .sel60(selOut60), .sel61(selOut61), .sel62(selOut62), .sel63(selOut63),
      .symEnOut  (symEnTb),
      .sym2xEnOut(sym2xEnTb),
      .index     (index ),
      .decision  (tbDecision)
      );
   assign     decision = tbEnable ? tbDecision : acsDecision;
   assign     symEnOut = symEnTb;
   assign     sym2xEnOut = sym2xEnTb;


`else
   assign     symEnOut = symEnAcs;
   assign     sym2xEnOut = sym2xEnAcs;
   assign     decision = acsDecision;
`endif



/* -----\/----- EXCLUDED -----\/-----
`ifdef SIMULATE
   always @(posedge clk) begin
      if (symEnAcs) begin
         //$display("\t%d\t%d\t%d\t%d\t%d\t%d", index, decision, acsDecision, $signed(iOut), $signed(qOut), phaseErrorEnOut);
         $display("\t%d\t%d\t%d", index, tbDecision, acsDecision);
      end
   end
`endif
 -----/\----- EXCLUDED -----/\----- */







endmodule // viterbiMultiH
