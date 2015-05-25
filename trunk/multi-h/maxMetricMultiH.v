`timescale 1ns/1ps

// Finds the index (0-19) of the metric wih the largest number. The maxValue is also computed but is not used in the design
// If all inputs are the same the 19th (13hex) index will be picked.
// All done with 2's complement numbers
module maxMetricMultiH(clk, reset, symEn, sym2xEn,
                       accMetOut0, accMetOut1, accMetOut2, accMetOut3, accMetOut4, accMetOut5, accMetOut6, accMetOut7, 
                       accMetOut8, accMetOut9, accMetOut10, accMetOut11, accMetOut12, accMetOut13, accMetOut14, accMetOut15, 
                       accMetOut16, accMetOut17, accMetOut18, accMetOut19, accMetOut20, accMetOut21, accMetOut22, accMetOut23,
                       accMetOut24, accMetOut25, accMetOut26, accMetOut27, accMetOut28, accMetOut29, accMetOut30, accMetOut31, 
                       accMetOut32, accMetOut33, accMetOut34, accMetOut35, accMetOut36, accMetOut37, accMetOut38, accMetOut39, 
                       accMetOut40, accMetOut41, accMetOut42, accMetOut43, accMetOut44, accMetOut45, accMetOut46, accMetOut47, 
                       accMetOut48, accMetOut49, accMetOut50, accMetOut51, accMetOut52, accMetOut53, accMetOut54, accMetOut55, 
                       accMetOut56, accMetOut57, accMetOut58, accMetOut59, accMetOut60, accMetOut61, accMetOut62, accMetOut63,
                       maxVal,
                       index, symEnOut, sym2xEnOut
                       );
   
   parameter            size = 8;
   input                clk,reset,symEn,sym2xEn;
   input [(size-1):0]   accMetOut0, accMetOut1, accMetOut2, accMetOut3, accMetOut4, accMetOut5, accMetOut6, accMetOut7, 
                        accMetOut8, accMetOut9, accMetOut10, accMetOut11, accMetOut12, accMetOut13, accMetOut14, accMetOut15, 
                        accMetOut16, accMetOut17, accMetOut18, accMetOut19, accMetOut20, accMetOut21, accMetOut22, accMetOut23,
                        accMetOut24, accMetOut25, accMetOut26, accMetOut27, accMetOut28, accMetOut29, accMetOut30, accMetOut31, 
                        accMetOut32, accMetOut33, accMetOut34, accMetOut35, accMetOut36, accMetOut37, accMetOut38, accMetOut39, 
                        accMetOut40, accMetOut41, accMetOut42, accMetOut43, accMetOut44, accMetOut45, accMetOut46, accMetOut47, 
                        accMetOut48, accMetOut49, accMetOut50, accMetOut51, accMetOut52, accMetOut53, accMetOut54, accMetOut55, 
                        accMetOut56, accMetOut57, accMetOut58, accMetOut59, accMetOut60, accMetOut61, accMetOut62, accMetOut63;
   output [5:0]         index; // max index (0-63)
   output [(size-1):0]  maxVal;
   output               symEnOut, sym2xEnOut;
   reg [5:0]            index;                      
   
   wire [(size-1):0]    maxValS1_0, maxValS1_1, maxValS1_2, maxValS1_3, maxValS1_4, maxValS1_5, maxValS1_6, maxValS1_7,
                        maxValS1_8, maxValS1_9, maxValS1_10, maxValS1_11, maxValS1_12, maxValS1_13, maxValS1_14, maxValS1_15,
                        maxValS2_0, maxValS2_1, maxValS2_2, maxValS2_3,
                        maxValS3;
   
   reg [(size-1):0]     maxVal; // the maximum value is not used in the design but it is nice for debug
   
   wire [5:0]           iS1_0; // possible value 3..0
   wire [5:0]           iS1_1; // possible value 4..7
   wire [5:0]           iS1_2; // possible value 8..11
   wire [5:0]           iS1_3; // possible value 12..15
   wire [5:0]           iS1_4; // possible value 16..19
   wire [5:0]           iS1_5; // possible value 20..23
   wire [5:0]           iS1_6; // possible value 24..27
   wire [5:0]           iS1_7; // possible value 28..31
   wire [5:0]           iS1_8; // possible value 32..35
   wire [5:0]           iS1_9; // possible value 36..19
   wire [5:0]           iS1_10; // possible value 40..43
   wire [5:0]           iS1_11; // possible value 44..47
   wire [5:0]           iS1_12; // possible value 48..51
   wire [5:0]           iS1_13; // possible value 52..55
   wire [5:0]           iS1_14; // possible value 56..60
   wire [5:0]           iS1_15; // possible value 60..63
   
   wire [5:0]           iS2_0, iS2_1, iS2_2, iS2_3,
                        iS3;
   
   
   reg [5:0]            indexS2;
   reg [5:0]            indexS3;
//   reg                  syncToACS;
//   reg [1:0]            cnt;
               
`ifdef USE_CLK
   // Stage 1 compare. The index value comming out of is scaled to 0..19 using the parameter indesOffset, by adding 4,8,12,or 16
   comp4twosCompMultiH  #(size, 0)  compS1_0_3   (clk,  accMetOut0 , accMetOut1 , accMetOut2 , accMetOut3 , iS1_0,  maxValS1_0 );
   comp4twosCompMultiH  #(size, 4)  compS1_4_7   (clk,  accMetOut4 , accMetOut5 , accMetOut6 , accMetOut7 , iS1_1,  maxValS1_1 );
   comp4twosCompMultiH  #(size, 8)  compS1_8_11  (clk,  accMetOut8 , accMetOut9 , accMetOut10, accMetOut11, iS1_2,  maxValS1_2 );
   comp4twosCompMultiH  #(size, 12) compS1_12_15 (clk,  accMetOut12, accMetOut13, accMetOut14, accMetOut15, iS1_3,  maxValS1_3 );
   comp4twosCompMultiH  #(size, 16) compS1_16_19 (clk,  accMetOut16, accMetOut17, accMetOut18, accMetOut19, iS1_4,  maxValS1_4 );
   comp4twosCompMultiH  #(size, 20) compS1_20_23 (clk,  accMetOut20, accMetOut21, accMetOut22, accMetOut23, iS1_5,  maxValS1_5 );
   comp4twosCompMultiH  #(size, 24) compS1_24_27 (clk,  accMetOut24, accMetOut25, accMetOut26, accMetOut27, iS1_6,  maxValS1_6 );
   comp4twosCompMultiH  #(size, 28) compS1_28_31 (clk,  accMetOut28, accMetOut29, accMetOut30, accMetOut31, iS1_7,  maxValS1_7 );
   comp4twosCompMultiH  #(size, 32) compS1_32_35 (clk,  accMetOut32, accMetOut33, accMetOut34, accMetOut35, iS1_8,  maxValS1_8 );
   comp4twosCompMultiH  #(size, 36) compS1_36_39 (clk,  accMetOut36, accMetOut37, accMetOut38, accMetOut39, iS1_9,  maxValS1_9 );
   comp4twosCompMultiH  #(size, 40) compS1_40_43 (clk,  accMetOut40, accMetOut41, accMetOut42, accMetOut43, iS1_10, maxValS1_10);
   comp4twosCompMultiH  #(size, 44) compS1_44_47 (clk,  accMetOut44, accMetOut45, accMetOut46, accMetOut47, iS1_11, maxValS1_11);
   comp4twosCompMultiH  #(size, 48) compS1_48_51 (clk,  accMetOut48, accMetOut49, accMetOut50, accMetOut51, iS1_12, maxValS1_12);
   comp4twosCompMultiH  #(size, 52) compS1_52_55 (clk,  accMetOut52, accMetOut53, accMetOut54, accMetOut55, iS1_13, maxValS1_13);
   comp4twosCompMultiH  #(size, 56) compS1_56_59 (clk,  accMetOut56, accMetOut57, accMetOut58, accMetOut59, iS1_14, maxValS1_14);
   comp4twosCompMultiH  #(size, 60) compS1_60_63 (clk,  accMetOut60, accMetOut61, accMetOut62, accMetOut63, iS1_15, maxValS1_15);
   // Stage 2 compare
   comp4twosCompMultiH  #(size, 0)  compS2_0_3   (clk, maxValS1_0 , maxValS1_1 , maxValS1_2 , maxValS1_3 , iS2_0  , maxValS2_0 ); //winner from  0-15
   comp4twosCompMultiH  #(size, 4)  compS2_4_7   (clk, maxValS1_4 , maxValS1_5 , maxValS1_6 , maxValS1_7 , iS2_1  , maxValS2_1 ); //winner from 16-31 
   comp4twosCompMultiH  #(size, 8)  compS2_8_11  (clk, maxValS1_8 , maxValS1_9 , maxValS1_10, maxValS1_11, iS2_2  , maxValS2_2 ); //winner from 32-47
   comp4twosCompMultiH  #(size, 12) compS2_12_15 (clk, maxValS1_12, maxValS1_13, maxValS1_14, maxValS1_15, iS2_3  , maxValS2_3 ); //winner from 48-63
   // Stage 3 compare (final compare)
   comp4twosCompMultiH  #(size, 0)  compS3_0_3   (clk, maxValS2_0 , maxValS2_1,  maxValS2_2,  maxValS2_3 , iS3    , maxValS3   );
`else
   // Stage 1 compare. The index value comming out of is scaled to 0..19 using the parameter indesOffset, by adding 4,8,12,or 16
   comp4twosCompMultiH  #(size, 0)  compS1_0_3   (accMetOut0 , accMetOut1 , accMetOut2 , accMetOut3 , iS1_0,  maxValS1_0 );
   comp4twosCompMultiH  #(size, 4)  compS1_4_7   (accMetOut4 , accMetOut5 , accMetOut6 , accMetOut7 , iS1_1,  maxValS1_1 );
   comp4twosCompMultiH  #(size, 8)  compS1_8_11  (accMetOut8 , accMetOut9 , accMetOut10, accMetOut11, iS1_2,  maxValS1_2 );
   comp4twosCompMultiH  #(size, 12) compS1_12_15 (accMetOut12, accMetOut13, accMetOut14, accMetOut15, iS1_3,  maxValS1_3 );
   comp4twosCompMultiH  #(size, 16) compS1_16_19 (accMetOut16, accMetOut17, accMetOut18, accMetOut19, iS1_4,  maxValS1_4 );
   comp4twosCompMultiH  #(size, 20) compS1_20_23 (accMetOut20, accMetOut21, accMetOut22, accMetOut23, iS1_5,  maxValS1_5 );
   comp4twosCompMultiH  #(size, 24) compS1_24_27 (accMetOut24, accMetOut25, accMetOut26, accMetOut27, iS1_6,  maxValS1_6 );
   comp4twosCompMultiH  #(size, 28) compS1_28_31 (accMetOut28, accMetOut29, accMetOut30, accMetOut31, iS1_7,  maxValS1_7 );
   comp4twosCompMultiH  #(size, 32) compS1_32_35 (accMetOut32, accMetOut33, accMetOut34, accMetOut35, iS1_8,  maxValS1_8 );
   comp4twosCompMultiH  #(size, 36) compS1_36_39 (accMetOut36, accMetOut37, accMetOut38, accMetOut39, iS1_9,  maxValS1_9 );
   comp4twosCompMultiH  #(size, 40) compS1_40_43 (accMetOut40, accMetOut41, accMetOut42, accMetOut43, iS1_10, maxValS1_10);
   comp4twosCompMultiH  #(size, 44) compS1_44_47 (accMetOut44, accMetOut45, accMetOut46, accMetOut47, iS1_11, maxValS1_11);
   comp4twosCompMultiH  #(size, 48) compS1_48_51 (accMetOut48, accMetOut49, accMetOut50, accMetOut51, iS1_12, maxValS1_12);
   comp4twosCompMultiH  #(size, 52) compS1_52_55 (accMetOut52, accMetOut53, accMetOut54, accMetOut55, iS1_13, maxValS1_13);
   comp4twosCompMultiH  #(size, 56) compS1_56_59 (accMetOut56, accMetOut57, accMetOut58, accMetOut59, iS1_14, maxValS1_14);
   comp4twosCompMultiH  #(size, 60) compS1_60_63 (accMetOut60, accMetOut61, accMetOut62, accMetOut63, iS1_15, maxValS1_15);
   // Stage 2 compare
   comp4twosCompMultiH  #(size, 0)  compS2_0_3   (maxValS1_0 , maxValS1_1 , maxValS1_2 , maxValS1_3 , iS2_0  , maxValS2_0 ); //winner from  0-15
   comp4twosCompMultiH  #(size, 4)  compS2_4_7   (maxValS1_4 , maxValS1_5 , maxValS1_6 , maxValS1_7 , iS2_1  , maxValS2_1 ); //winner from 16-31 
   comp4twosCompMultiH  #(size, 8)  compS2_8_11  (maxValS1_8 , maxValS1_9 , maxValS1_10, maxValS1_11, iS2_2  , maxValS2_2 ); //winner from 32-47
   comp4twosCompMultiH  #(size, 12) compS2_12_15 (maxValS1_12, maxValS1_13, maxValS1_14, maxValS1_15, iS2_3  , maxValS2_3 ); //winner from 48-63
   // Stage 3 compare (final compare)
   comp4twosCompMultiH  #(size, 0)  compS3_0_3   (maxValS2_0 , maxValS2_1,  maxValS2_2,  maxValS2_3 , iS3    , maxValS3   );
`endif

   
   always @(iS3 or iS2_0 or iS2_1 or iS2_2 or iS2_3)
     begin
        case (iS3)
          0:  indexS3 <= iS2_0;
          1:  indexS3 <= iS2_1; 
          2:  indexS3 <= iS2_2;
          3:  indexS3 <= iS2_3;
          default: indexS3 <= 6'bx;
        endcase
     end


   // Mux the largest index after stage 1 using the select out of stage 2
   always @(iS1_0 or iS1_1 or iS1_2 or iS1_3 or iS1_4 or iS1_5 or iS1_6 or iS1_7 or 
            iS1_8 or iS1_9 or iS1_10 or iS1_11 or iS1_12 or iS1_13 or iS1_14 or iS1_15 or 
            indexS3)
     begin
        case (indexS3)
          0:  indexS2 <= iS1_0;
          1:  indexS2 <= iS1_1; 
          2:  indexS2 <= iS1_2;
          3:  indexS2 <= iS1_3;
          4:  indexS2 <= iS1_4;
          5:  indexS2 <= iS1_5; 
          6:  indexS2 <= iS1_6;
          7:  indexS2 <= iS1_7;
          8:  indexS2 <= iS1_8;
          9:  indexS2 <= iS1_9; 
          10: indexS2 <= iS1_10;
          11: indexS2 <= iS1_11;
          12: indexS2 <= iS1_12;
          13: indexS2 <= iS1_13; 
          14: indexS2 <= iS1_14;
          15: indexS2 <= iS1_15;
          default: indexS2 <= 6'bx;
        endcase
     end

   // Latching the final index and MaxVal
   always @(posedge clk)
     begin
        if (reset) begin
           index <= 0;
           maxVal <= 0;
        end
          else if (symEn) begin
           maxVal <= maxValS3;
           index <= indexS2;
        end
     end
   
   


   
endmodule