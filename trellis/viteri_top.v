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

module viterbi_top(clk,reset,symEn,sym2xEn,
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
                   decision, freqError);
   
   parameter            size = 8;
   input 			clk,reset,symEn,sym2xEn;
   input [size-1:0] 	out0Pt1Real, out0Pt1Imag, out1Pt1Real, out1Pt1Imag,
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
				out0Pt20Real,out0Pt20Imag,out1Pt20Real,out1Pt20Imag;
   
   output 			decision;
   output [size-1:0] 	freqError;
   
   
   wire [(size-1)+4:0] 	accMetOut [0:19];
   wire [19:0] 		sel;
   wire [4:0] 		index;
   
   reg [size-1:0] 	freqError;
   
   reg [1:0] 		cnt;
   
   reg [size-1:0] 	out0Pt1Imag_1dly , out1Pt1Imag_1dly , out0Pt1Imag_2dly , out1Pt1Imag_2dly ,
				out0Pt2Imag_1dly , out1Pt2Imag_1dly , out0Pt2Imag_2dly , out1Pt2Imag_2dly ,
				out0Pt3Imag_1dly , out1Pt3Imag_1dly , out0Pt3Imag_2dly , out1Pt3Imag_2dly ,
				out0Pt4Imag_1dly , out1Pt4Imag_1dly , out0Pt4Imag_2dly , out1Pt4Imag_2dly ,
				out0Pt5Imag_1dly , out1Pt5Imag_1dly , out0Pt5Imag_2dly , out1Pt5Imag_2dly ,
				out0Pt6Imag_1dly , out1Pt6Imag_1dly , out0Pt6Imag_2dly , out1Pt6Imag_2dly ,
				out0Pt7Imag_1dly , out1Pt7Imag_1dly , out0Pt7Imag_2dly , out1Pt7Imag_2dly ,
				out0Pt8Imag_1dly , out1Pt8Imag_1dly , out0Pt8Imag_2dly , out1Pt8Imag_2dly ,
				out0Pt9Imag_1dly , out1Pt9Imag_1dly , out0Pt9Imag_2dly , out1Pt9Imag_2dly ,
				out0Pt10Imag_1dly, out1Pt10Imag_1dly, out0Pt10Imag_2dly, out1Pt10Imag_2dly,
				out0Pt11Imag_1dly, out1Pt11Imag_1dly, out0Pt11Imag_2dly, out1Pt11Imag_2dly,
				out0Pt12Imag_1dly, out1Pt12Imag_1dly, out0Pt12Imag_2dly, out1Pt12Imag_2dly,
				out0Pt13Imag_1dly, out1Pt13Imag_1dly, out0Pt13Imag_2dly, out1Pt13Imag_2dly,
				out0Pt14Imag_1dly, out1Pt14Imag_1dly, out0Pt14Imag_2dly, out1Pt14Imag_2dly,
				out0Pt15Imag_1dly, out1Pt15Imag_1dly, out0Pt15Imag_2dly, out1Pt15Imag_2dly,
				out0Pt16Imag_1dly, out1Pt16Imag_1dly, out0Pt16Imag_2dly, out1Pt16Imag_2dly,
				out0Pt17Imag_1dly, out1Pt17Imag_1dly, out0Pt17Imag_2dly, out1Pt17Imag_2dly,
				out0Pt18Imag_1dly, out1Pt18Imag_1dly, out0Pt18Imag_2dly, out1Pt18Imag_2dly,
				out0Pt19Imag_1dly, out1Pt19Imag_1dly, out0Pt19Imag_2dly, out1Pt19Imag_2dly,
				out0Pt20Imag_1dly, out1Pt20Imag_1dly, out0Pt20Imag_2dly, out1Pt20Imag_2dly;
   

`ifdef SIMULATE
   // in simulation we have to reset the accumulatios when the input data is known.
   // simReset is toggled in the test bench
   reg 			simReset;
   wire 			acsReset = simReset;
`else
   wire 			acsReset = reset;
`endif
      
   // 20 Add Compare Select (acs) units with its decision output (sel0..sel19) 
   acs #(size) acs0  (clk, acsReset, symEn, out1Pt1Real,  out0Pt15Real, accMetOut[0 ][(size-1)+4:0], accMetOut[14][(size-1)+4:0], accMetOut[7 ][(size-1)+4:0], sel[ 7]);
   acs #(size) acs1  (clk, acsReset, symEn, out1Pt2Real,  out0Pt16Real, accMetOut[1 ][(size-1)+4:0], accMetOut[15][(size-1)+4:0], accMetOut[8 ][(size-1)+4:0], sel[ 8]);
   acs #(size) acs2  (clk, acsReset, symEn, out1Pt3Real,  out0Pt17Real, accMetOut[2 ][(size-1)+4:0], accMetOut[16][(size-1)+4:0], accMetOut[9 ][(size-1)+4:0], sel[ 9]);
   acs #(size) acs3  (clk, acsReset, symEn, out1Pt4Real,  out0Pt18Real, accMetOut[3 ][(size-1)+4:0], accMetOut[17][(size-1)+4:0], accMetOut[10][(size-1)+4:0], sel[10]);
   acs #(size) acs4  (clk, acsReset, symEn, out1Pt5Real,  out0Pt19Real, accMetOut[4 ][(size-1)+4:0], accMetOut[18][(size-1)+4:0], accMetOut[11][(size-1)+4:0], sel[11]);
   acs #(size) acs5  (clk, acsReset, symEn, out1Pt6Real,  out0Pt20Real, accMetOut[5 ][(size-1)+4:0], accMetOut[19][(size-1)+4:0], accMetOut[12][(size-1)+4:0], sel[12]);
   acs #(size) acs6  (clk, acsReset, symEn, out1Pt7Real,  out0Pt1Real,  accMetOut[6 ][(size-1)+4:0], accMetOut[0 ][(size-1)+4:0], accMetOut[13][(size-1)+4:0], sel[13]);
   acs #(size) acs7  (clk, acsReset, symEn, out1Pt8Real,  out0Pt2Real,  accMetOut[7 ][(size-1)+4:0], accMetOut[1 ][(size-1)+4:0], accMetOut[14][(size-1)+4:0], sel[14]);
   acs #(size) acs8  (clk, acsReset, symEn, out1Pt9Real,  out0Pt3Real,  accMetOut[8 ][(size-1)+4:0], accMetOut[2 ][(size-1)+4:0], accMetOut[15][(size-1)+4:0], sel[15]);
   acs #(size) acs9  (clk, acsReset, symEn, out1Pt10Real, out0Pt4Real,  accMetOut[9 ][(size-1)+4:0], accMetOut[3 ][(size-1)+4:0], accMetOut[16][(size-1)+4:0], sel[16]);
   acs #(size) acs10 (clk, acsReset, symEn, out1Pt11Real, out0Pt5Real,  accMetOut[10][(size-1)+4:0], accMetOut[4 ][(size-1)+4:0], accMetOut[17][(size-1)+4:0], sel[17]);
   acs #(size) acs11 (clk, acsReset, symEn, out1Pt12Real, out0Pt6Real,  accMetOut[11][(size-1)+4:0], accMetOut[5 ][(size-1)+4:0], accMetOut[18][(size-1)+4:0], sel[18]);
   acs #(size) acs12 (clk, acsReset, symEn, out1Pt13Real, out0Pt7Real,  accMetOut[12][(size-1)+4:0], accMetOut[6 ][(size-1)+4:0], accMetOut[19][(size-1)+4:0], sel[19]);
   acs #(size) acs13 (clk, acsReset, symEn, out1Pt14Real, out0Pt8Real,  accMetOut[13][(size-1)+4:0], accMetOut[7 ][(size-1)+4:0], accMetOut[0 ][(size-1)+4:0], sel[ 0]);
   acs #(size) acs14 (clk, acsReset, symEn, out1Pt15Real, out0Pt9Real,  accMetOut[14][(size-1)+4:0], accMetOut[8 ][(size-1)+4:0], accMetOut[1 ][(size-1)+4:0], sel[ 1]);
   acs #(size) acs15 (clk, acsReset, symEn, out1Pt16Real, out0Pt10Real, accMetOut[15][(size-1)+4:0], accMetOut[9 ][(size-1)+4:0], accMetOut[2 ][(size-1)+4:0], sel[ 2]);
   acs #(size) acs16 (clk, acsReset, symEn, out1Pt17Real, out0Pt11Real, accMetOut[16][(size-1)+4:0], accMetOut[10][(size-1)+4:0], accMetOut[3 ][(size-1)+4:0], sel[ 3]);
   acs #(size) acs17 (clk, acsReset, symEn, out1Pt18Real, out0Pt12Real, accMetOut[17][(size-1)+4:0], accMetOut[11][(size-1)+4:0], accMetOut[4 ][(size-1)+4:0], sel[ 4]);
   acs #(size) acs18 (clk, acsReset, symEn, out1Pt19Real, out0Pt13Real, accMetOut[18][(size-1)+4:0], accMetOut[12][(size-1)+4:0], accMetOut[5 ][(size-1)+4:0], sel[ 5]);
   acs #(size) acs19 (clk, acsReset, symEn, out1Pt20Real, out0Pt14Real, accMetOut[19][(size-1)+4:0], accMetOut[13][(size-1)+4:0], accMetOut[6 ][(size-1)+4:0], sel[ 6]);

                                                                                            
   maxMetric #(size) maxMetric (clk,reset,symEn,sym2xEn ,
                                accMetOut[0 ], accMetOut[1 ], accMetOut[2 ], accMetOut[3 ], accMetOut[4 ], 
                                accMetOut[5 ], accMetOut[6 ], accMetOut[7 ], accMetOut[8 ], accMetOut[9 ], 
                                accMetOut[10], accMetOut[11], accMetOut[12], accMetOut[13], accMetOut[14], 
                                accMetOut[15], accMetOut[16], accMetOut[17], accMetOut[18], accMetOut[19],
                                index
                                );
      
   traceBackTable #(size) tbu(clk, reset, symEn, sym2xEn, sel, index, decision, oneOrZeroPredecessor);


   always @(posedge clk)
     begin
        /*if (reset) begin
            <= 0;
        end
	  else*/ if (symEn) begin
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
   

   // counter used to create a delayed verion of the synEn
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
   

   
   // Computing the error term
   always @(posedge clk)
     begin
        if (reset) begin
           freqError <= 0;
        end
	  else if (cnt==3) begin
           case (index)
	    0 : if (oneOrZeroPredecessor==0) freqError <= out0Pt1Imag_2dly ;
	       else                           freqError <= out1Pt1Imag_2dly ;
	    1 : if (oneOrZeroPredecessor==0) freqError <= out0Pt2Imag_2dly ;
	        else                           freqError <= out1Pt2Imag_2dly ;
          2 : if (oneOrZeroPredecessor==0) freqError <= out0Pt3Imag_2dly ;
	        else                           freqError <= out1Pt3Imag_2dly ;
          3 : if (oneOrZeroPredecessor==0) freqError <= out0Pt4Imag_2dly ;
	        else                           freqError <= out1Pt4Imag_2dly ;  
          4 : if (oneOrZeroPredecessor==0) freqError <= out0Pt5Imag_2dly ;
	        else                           freqError <= out1Pt5Imag_2dly ; 
          5 : if (oneOrZeroPredecessor==0) freqError <= out0Pt6Imag_2dly ;
	        else                           freqError <= out1Pt6Imag_2dly ; 
          6 : if (oneOrZeroPredecessor==0) freqError <= out0Pt7Imag_2dly ;
	        else                           freqError <= out1Pt7Imag_2dly ; 
          7 : if (oneOrZeroPredecessor==0) freqError <= out0Pt8Imag_2dly ;
	        else                           freqError <= out1Pt8Imag_2dly ; 
          8 : if (oneOrZeroPredecessor==0) freqError <= out0Pt9Imag_2dly ;
	        else                           freqError <= out1Pt9Imag_2dly ;
          9 : if (oneOrZeroPredecessor==0) freqError <= out0Pt10Imag_2dly;
	        else                           freqError <= out1Pt10Imag_2dly;  
          10: if (oneOrZeroPredecessor==0) freqError <= out0Pt11Imag_2dly;
	        else                           freqError <= out1Pt11Imag_2dly;
          11: if (oneOrZeroPredecessor==0) freqError <= out0Pt12Imag_2dly;
	        else                           freqError <= out1Pt12Imag_2dly;
          12: if (oneOrZeroPredecessor==0) freqError <= out0Pt13Imag_2dly;
	        else                           freqError <= out1Pt13Imag_2dly;
          13: if (oneOrZeroPredecessor==0) freqError <= out0Pt14Imag_2dly;
	        else                           freqError <= out1Pt14Imag_2dly;
          14: if (oneOrZeroPredecessor==0) freqError <= out0Pt15Imag_2dly;
	        else                           freqError <= out1Pt15Imag_2dly;
          15: if (oneOrZeroPredecessor==0) freqError <= out0Pt16Imag_2dly;
	        else                           freqError <= out1Pt16Imag_2dly;
          16: if (oneOrZeroPredecessor==0) freqError <= out0Pt17Imag_2dly;
	        else                           freqError <= out1Pt17Imag_2dly;
          17: if (oneOrZeroPredecessor==0) freqError <= out0Pt18Imag_2dly;
	        else                           freqError <= out1Pt18Imag_2dly;
          18: if (oneOrZeroPredecessor==0) freqError <= out0Pt19Imag_2dly;
	        else                           freqError <= out1Pt19Imag_2dly;
          19: if (oneOrZeroPredecessor==0) freqError <= out0Pt20Imag_2dly;
	        else                           freqError <= out1Pt20Imag_2dly;
           endcase
        end
     end


`ifdef SIMULATE

integer file;
initial file = $fopen("decision.dat") ;

   always @(posedge clk)begin
	if(symEn)begin
	   $fdisplay(file, "%b\t ", decision);
	end
   end
`endif   
	 
/* -----\/----- EXCLUDED -----\/-----
	 
	 `ifdef SIMULATE

integer file;
initial file = $fopen("accMetric.dat") ;

always @(posedge clk)begin
  if(symEn)begin
//    $display("MF (%h,%h) (%h,%h)",f0I,f0Q,f1I,f1Q);
     $fdisplay(file, "%d\t%d\t%d\t%d\t%d\t%d\t%d\t%d\t%d\t%d\t%d\t%d\t%d\t%d\t%d\t%d\t%d\t%d\t%d\t%d",$signed(out0Pt1Real),$signed(out0Pt2Real),$signed(out0Pt3Real),$signed(out0Pt4Real),$signed(out0Pt5Real),$signed(out0Pt6Real),$signed(out0Pt7Real),$signed(out0Pt8Real),$signed(out0Pt9Real),$signed(out0Pt10Real),$signed(out0Pt11Real),$signed(out0Pt12Real),$signed(out0Pt13Real),$signed(out0Pt14Real),$signed(out0Pt15Real),$signed(out0Pt16Real),$signed(out0Pt17Real),$signed(out0Pt18Real),$signed(out0Pt19Real),$signed(out0Pt20Real));
     $fdisplay(file, "%d\t%d\t%d\t%d\t%d\t%d\t%d\t%d\t%d\t%d\t%d\t%d\t%d\t%d\t%d\t%d\t%d\t%d\t%d\t%d",$signed(out1Pt1Real),$signed(out1Pt2Real),$signed(out1Pt3Real),$signed(out1Pt4Real),$signed(out1Pt5Real),$signed(out1Pt6Real),$signed(out1Pt7Real),$signed(out1Pt8Real),$signed(out1Pt9Real),$signed(out1Pt10Real),$signed(out1Pt11Real),$signed(out1Pt12Real),$signed(out1Pt13Real),$signed(out1Pt14Real),$signed(out1Pt15Real),$signed(out1Pt16Real),$signed(out1Pt17Real),$signed(out1Pt18Real),$signed(out1Pt19Real),$signed(out1Pt20Real));
     
     $fdisplay(file, "%d\t%d\t%d\t%d\t%d\t%d\t%d\t%d\t%d\t%d\t%d\t%d\t%d\t%d\t%d\t%d\t%d\t%d\t%d\t%d",$signed(accMetOut[0 ][(size-1)+4:0]),
																     $signed(accMetOut[1 ][(size-1)+4:0]),
																     $signed(accMetOut[2 ][(size-1)+4:0]),
																     $signed(accMetOut[3 ][(size-1)+4:0]),
																     $signed(accMetOut[4 ][(size-1)+4:0]),
																     $signed(accMetOut[5 ][(size-1)+4:0]),
																     $signed(accMetOut[6 ][(size-1)+4:0]),
																     $signed(accMetOut[7 ][(size-1)+4:0]),
																     $signed(accMetOut[8 ][(size-1)+4:0]),
																     $signed(accMetOut[9 ][(size-1)+4:0]),
																     $signed(accMetOut[10][(size-1)+4:0]),
		  														     $signed(accMetOut[11][(size-1)+4:0]),
																     $signed(accMetOut[12][(size-1)+4:0]),
																     $signed(accMetOut[13][(size-1)+4:0]),
																     $signed(accMetOut[14][(size-1)+4:0]),
																     $signed(accMetOut[15][(size-1)+4:0]),
																     $signed(accMetOut[16][(size-1)+4:0]),
																     $signed(accMetOut[17][(size-1)+4:0]),
																     $signed(accMetOut[18][(size-1)+4:0]),
																     $signed(accMetOut[19][(size-1)+4:0]));
     
     $fdisplay(file, "%d\tb%b\t", index, sel);
     
		    
//    $fdisplay(file, "%h\t%h\t%h\t%h\t%h\t%h\t%h\t%h\t%h\t%h\t%h\t%h\t%h\t%h\t%h\t%h\t%h\t%h\t%h\t%h",out1Pt1Real,out1Pt2Real,out1Pt3Real,out1Pt4Real,out1Pt5Real,out1Pt6Real,out1Pt7Real,out1Pt8Real,out1Pt9Real,out1Pt10Real,out1Pt11Real,out1Pt12Real,out1Pt13Real,out1Pt14Real,out1Pt15Real,out1Pt16Real,out1Pt17Real,out1Pt18Real,out1Pt19Real,out1Pt20Real,);
    end
  end
`endif
	 
 -----/\----- EXCLUDED -----/\----- */
	 
	 
	 
endmodule