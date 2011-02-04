//-----------------------------------------------------------------------------
// Project      SEMCO Multi-mode Demodulator
// Design       Trace Back Table pcm Trellis
// Created      22 April 09
//-----------------------------------------------------------------------------
// 1.0      AMJ initial coding
// 2.0      AMJ expanding the trace back depth to 8, tested only for 8 deep traceback
//
//-----------------------------------------------------------------------------

`timescale 1ns/1ps

module traceBackTableDeeper(clk, reset, symEn,
                      sel, index,
                      decision,
                      symEnDly
                      );
   parameter          TB_DEPTH=8;                       
   input              clk,reset,symEn;
   input [19:0]       sel;   // 20 induvidual decision. 0 or 1 tell us if we trace + or - 7 modulo 20 
   input [4:0]        index; // pointer to the state which has the maximum metric
   output             decision;
   output             symEnDly;
   reg                decision;
   reg [TB_DEPTH:0]   tbtSr0;
   reg [TB_DEPTH:0]   tbtSr1;
   reg [TB_DEPTH:0]   tbtSr2;
   reg [TB_DEPTH:0]   tbtSr3;
   reg [TB_DEPTH:0]   tbtSr4;
   reg [TB_DEPTH:0]   tbtSr5;
   reg [TB_DEPTH:0]   tbtSr6;
   reg [TB_DEPTH:0]   tbtSr7;
   reg [TB_DEPTH:0]   tbtSr8;
   reg [TB_DEPTH:0]   tbtSr9;
   reg [TB_DEPTH:0]   tbtSr10;
   reg [TB_DEPTH:0]   tbtSr11;
   reg [TB_DEPTH:0]   tbtSr12;
   reg [TB_DEPTH:0]   tbtSr13;
   reg [TB_DEPTH:0]   tbtSr14;
   reg [TB_DEPTH:0]   tbtSr15;
   reg [TB_DEPTH:0]   tbtSr16;
   reg [TB_DEPTH:0]   tbtSr17;
   reg [TB_DEPTH:0]   tbtSr18;
   reg [TB_DEPTH:0]   tbtSr19;
   reg [4:0]          tbPtr;
   
   // 3bits x 20 states trace-back shift-register
   always @(posedge clk)
     begin
        if (reset) begin
           //reset the whole traceback table to all zeroes
           tbtSr0  <= 0;
           tbtSr1  <= 0;
           tbtSr2  <= 0;
           tbtSr3  <= 0;
           tbtSr4  <= 0;
           tbtSr5  <= 0;
           tbtSr6  <= 0;
           tbtSr7  <= 0;
           tbtSr8  <= 0;
           tbtSr9  <= 0;
           tbtSr10 <= 0;
           tbtSr11 <= 0;
           tbtSr12 <= 0;
           tbtSr13 <= 0;
           tbtSr14 <= 0;
           tbtSr15 <= 0;
           tbtSr16 <= 0;
           tbtSr17 <= 0;
           tbtSr18 <= 0;
           tbtSr19 <= 0;
        end
        else begin
           //if (symEnCnt == 3) begin  // {1}
           //if (outputCnt == TB_DEPTH -1) begin
	   if (symEn) begin // debug comment: problem with timing ? for 4 deep we hade {3}
              tbtSr0  <= {tbtSr0 [TB_DEPTH-1:0], sel[0 ]};
              tbtSr1  <= {tbtSr1 [TB_DEPTH-1:0], sel[1 ]};
              tbtSr2  <= {tbtSr2 [TB_DEPTH-1:0], sel[2 ]};
              tbtSr3  <= {tbtSr3 [TB_DEPTH-1:0], sel[3 ]};
              tbtSr4  <= {tbtSr4 [TB_DEPTH-1:0], sel[4 ]};
              tbtSr5  <= {tbtSr5 [TB_DEPTH-1:0], sel[5 ]};
              tbtSr6  <= {tbtSr6 [TB_DEPTH-1:0], sel[6 ]};
              tbtSr7  <= {tbtSr7 [TB_DEPTH-1:0], sel[7 ]};
              tbtSr8  <= {tbtSr8 [TB_DEPTH-1:0], sel[8 ]};
              tbtSr9  <= {tbtSr9 [TB_DEPTH-1:0], sel[9 ]};
              tbtSr10 <= {tbtSr10[TB_DEPTH-1:0], sel[10]};
              tbtSr11 <= {tbtSr11[TB_DEPTH-1:0], sel[11]};
              tbtSr12 <= {tbtSr12[TB_DEPTH-1:0], sel[12]};
              tbtSr13 <= {tbtSr13[TB_DEPTH-1:0], sel[13]};
              tbtSr14 <= {tbtSr14[TB_DEPTH-1:0], sel[14]};
              tbtSr15 <= {tbtSr15[TB_DEPTH-1:0], sel[15]};
              tbtSr16 <= {tbtSr16[TB_DEPTH-1:0], sel[16]};
              tbtSr17 <= {tbtSr17[TB_DEPTH-1:0], sel[17]};
              tbtSr18 <= {tbtSr18[TB_DEPTH-1:0], sel[18]};
              tbtSr19 <= {tbtSr19[TB_DEPTH-1:0], sel[19]};
           end
        end 
     end


   reg clearStateCntFlag;
   always @(posedge clk)
     begin
        if (reset) begin
	   clearStateCntFlag <= 1;
	end
	else if (symEn) begin
	   clearStateCntFlag <= ~clearStateCntFlag;
	end
	else if (outputCnt == TB_DEPTH-1) begin
	   clearStateCntFlag <= 1;
	end
     end
      
   // state Machine counter
   reg [3:0]          stateCnt;
   reg [3:0] 	      outputCnt;    // Just a counter the keeps track of when to output the final decision
   always @(posedge clk)
     begin
        if (reset) begin
	   stateCnt <= 0;
           outputCnt <= 0;
	end
	else if (symEn && clearStateCntFlag) begin
	   stateCnt <= 0;
           outputCnt <= 0;
	end
        else begin
           if (outputCnt < TB_DEPTH) begin
              outputCnt <= outputCnt+1;
	      if (symEn) begin // check if another symEn occured and if so we need to bump the stateCnt by 2
		 stateCnt <= stateCnt+2;
	      end
	      else begin 
		 stateCnt <= stateCnt+1;
	      end
	   end
	   else begin
              stateCnt <= stateCnt; // stop incrementing the stateCnt to prevent roll over
              outputCnt <= outputCnt;
	   end
        end
     end

  
   // Path Decisions. stateCnt moves us through the "TB_DEPTH" previous paths
   // This block runs at the clock rate. It takes TB_DEPTH-1 clocks to complete
   always @(posedge clk)
     begin
        if (reset) begin
           tbPtr <= 0;
        end
        else if (outputCnt < TB_DEPTH) begin    
           if (outputCnt == TB_DEPTH-1) begin
              tbPtr <= index;  // loading in the starting max metric index at the trace back update rate
           end
           else begin
              case (tbPtr)
                0 : begin // We are in the "0-th" trellis state
                   if (tbtSr0[stateCnt]==0) 
                     tbPtr <= 7; // sel=0 makes us jump +7 modulo 20.  
                   else 
                     tbPtr <= 13;  // sel=1,   jump -7 modulo 20
                end
                1 : if (tbtSr1[stateCnt]==0) tbPtr <= 8 ;  else tbPtr <= 14;
                2 : if (tbtSr2[stateCnt]==0) tbPtr <= 9 ;  else tbPtr <= 15;
                3:  if (tbtSr3[stateCnt]==0) tbPtr <= 10;  else tbPtr <= 16;
                4:  if (tbtSr4[stateCnt]==0) tbPtr <= 11;  else tbPtr <= 17;
                5:  if (tbtSr5[stateCnt]==0) tbPtr <= 12;  else tbPtr <= 18;
                6:  if (tbtSr6[stateCnt]==0) tbPtr <= 13;  else tbPtr <= 19;
                7:  if (tbtSr7[stateCnt]==0) tbPtr <= 14;  else tbPtr <= 0 ;
                8:  if (tbtSr8[stateCnt]==0) tbPtr <= 15;  else tbPtr <= 1 ;
                9:  if (tbtSr9[stateCnt]==0) tbPtr <= 16;  else tbPtr <= 2 ;
                10: if (tbtSr10[stateCnt]==0) tbPtr <= 17;  else tbPtr <= 3 ;
                11: if (tbtSr11[stateCnt]==0) tbPtr <= 18;  else tbPtr <= 4 ;
                12: if (tbtSr12[stateCnt]==0) tbPtr <= 19;  else tbPtr <= 5 ;
                13: if (tbtSr13[stateCnt]==0) tbPtr <= 0 ;  else tbPtr <= 6 ;
                14: if (tbtSr14[stateCnt]==0) tbPtr <= 1 ;  else tbPtr <= 7 ;
                15: if (tbtSr15[stateCnt]==0) tbPtr <= 2 ;  else tbPtr <= 8 ;
                16: if (tbtSr16[stateCnt]==0) tbPtr <= 3 ;  else tbPtr <= 9 ;
                17: if (tbtSr17[stateCnt]==0) tbPtr <= 4 ;  else tbPtr <= 10;
                18: if (tbtSr18[stateCnt]==0) tbPtr <= 5 ;  else tbPtr <= 11;
                19: if (tbtSr19[stateCnt]==0) tbPtr <= 6 ;  else tbPtr <= 12;
              endcase
           end
        end
        else begin
           // Stay in the same state
           tbPtr <= tbPtr;
        end
     end

   // Output 2 decisions every other symEn. There my be an offset in the tbtSr if the symEn rate is faster than the traceback table
   // depth. This is determained by comparing the two counters (stateCnt == outputCnt)
   reg firstDecision, secondDecision;
   always @(posedge clk)
     if (reset) begin
        firstDecision <= 0;
        secondDecision <= 0;
     end
     else if (outputCnt == TB_DEPTH-2) begin   // finding the first decision
	secondDecision <= secondDecision;
	if (stateCnt == outputCnt) begin // slow symEn
	   case (tbPtr)
             0:  begin firstDecision <=  tbtSr0[TB_DEPTH-2]; end
             1:  begin firstDecision <=  tbtSr1[TB_DEPTH-2]; end
             2:  begin firstDecision <=  tbtSr2[TB_DEPTH-2]; end
             3:  begin firstDecision <=  tbtSr3[TB_DEPTH-2]; end
             4:  begin firstDecision <=  tbtSr4[TB_DEPTH-2]; end
             5:  begin firstDecision <=  tbtSr5[TB_DEPTH-2]; end
             6:  begin firstDecision <=  tbtSr6[TB_DEPTH-2]; end
             7:  begin firstDecision <=  tbtSr7[TB_DEPTH-2]; end
             8:  begin firstDecision <=  tbtSr8[TB_DEPTH-2]; end
             9:  begin firstDecision <=  tbtSr9[TB_DEPTH-2]; end
             10: begin firstDecision <= tbtSr10[TB_DEPTH-2]; end
             11: begin firstDecision <= tbtSr11[TB_DEPTH-2]; end
             12: begin firstDecision <= tbtSr12[TB_DEPTH-2]; end
             13: begin firstDecision <= tbtSr13[TB_DEPTH-2]; end
             14: begin firstDecision <= tbtSr14[TB_DEPTH-2]; end
             15: begin firstDecision <= tbtSr15[TB_DEPTH-2]; end
             16: begin firstDecision <= tbtSr16[TB_DEPTH-2]; end
             17: begin firstDecision <= tbtSr17[TB_DEPTH-2]; end
             18: begin firstDecision <= tbtSr18[TB_DEPTH-2]; end
             19: begin firstDecision <= tbtSr19[TB_DEPTH-2]; end
           endcase
	end
	else begin // fast symEn
	   case (tbPtr)
             0:  begin firstDecision <=  tbtSr0[TB_DEPTH-1]; end
             1:  begin firstDecision <=  tbtSr1[TB_DEPTH-1]; end
             2:  begin firstDecision <=  tbtSr2[TB_DEPTH-1]; end
             3:  begin firstDecision <=  tbtSr3[TB_DEPTH-1]; end
             4:  begin firstDecision <=  tbtSr4[TB_DEPTH-1]; end
             5:  begin firstDecision <=  tbtSr5[TB_DEPTH-1]; end
             6:  begin firstDecision <=  tbtSr6[TB_DEPTH-1]; end
             7:  begin firstDecision <=  tbtSr7[TB_DEPTH-1]; end
             8:  begin firstDecision <=  tbtSr8[TB_DEPTH-1]; end
             9:  begin firstDecision <=  tbtSr9[TB_DEPTH-1]; end
             10: begin firstDecision <= tbtSr10[TB_DEPTH-1]; end
             11: begin firstDecision <= tbtSr11[TB_DEPTH-1]; end
             12: begin firstDecision <= tbtSr12[TB_DEPTH-1]; end
             13: begin firstDecision <= tbtSr13[TB_DEPTH-1]; end
             14: begin firstDecision <= tbtSr14[TB_DEPTH-1]; end
             15: begin firstDecision <= tbtSr15[TB_DEPTH-1]; end
             16: begin firstDecision <= tbtSr16[TB_DEPTH-1]; end
             17: begin firstDecision <= tbtSr17[TB_DEPTH-1]; end
             18: begin firstDecision <= tbtSr18[TB_DEPTH-1]; end
             19: begin firstDecision <= tbtSr19[TB_DEPTH-1]; end
	   endcase
	end
     end
     else if (outputCnt == TB_DEPTH-1) begin  // finding the second symEn
	firstDecision <= firstDecision;
	if (stateCnt == outputCnt) begin // slow symEn
	   case (tbPtr)
             0:  begin secondDecision <=  tbtSr0[TB_DEPTH-1]; end
             1:  begin secondDecision <=  tbtSr1[TB_DEPTH-1]; end
             2:  begin secondDecision <=  tbtSr2[TB_DEPTH-1]; end
             3:  begin secondDecision <=  tbtSr3[TB_DEPTH-1]; end
             4:  begin secondDecision <=  tbtSr4[TB_DEPTH-1]; end
             5:  begin secondDecision <=  tbtSr5[TB_DEPTH-1]; end
             6:  begin secondDecision <=  tbtSr6[TB_DEPTH-1]; end
             7:  begin secondDecision <=  tbtSr7[TB_DEPTH-1]; end
             8:  begin secondDecision <=  tbtSr8[TB_DEPTH-1]; end
             9:  begin secondDecision <=  tbtSr9[TB_DEPTH-1]; end
             10: begin secondDecision <= tbtSr10[TB_DEPTH-1]; end
             11: begin secondDecision <= tbtSr11[TB_DEPTH-1]; end
             12: begin secondDecision <= tbtSr12[TB_DEPTH-1]; end
             13: begin secondDecision <= tbtSr13[TB_DEPTH-1]; end
             14: begin secondDecision <= tbtSr14[TB_DEPTH-1]; end
             15: begin secondDecision <= tbtSr15[TB_DEPTH-1]; end
             16: begin secondDecision <= tbtSr16[TB_DEPTH-1]; end
             17: begin secondDecision <= tbtSr17[TB_DEPTH-1]; end
             18: begin secondDecision <= tbtSr18[TB_DEPTH-1]; end
             19: begin secondDecision <= tbtSr19[TB_DEPTH-1]; end
           endcase
	end
	else begin // fast symEn
	   case (tbPtr)
             0:  begin secondDecision <=  tbtSr0[TB_DEPTH]; end
             1:  begin secondDecision <=  tbtSr1[TB_DEPTH]; end
             2:  begin secondDecision <=  tbtSr2[TB_DEPTH]; end
             3:  begin secondDecision <=  tbtSr3[TB_DEPTH]; end
             4:  begin secondDecision <=  tbtSr4[TB_DEPTH]; end
             5:  begin secondDecision <=  tbtSr5[TB_DEPTH]; end
             6:  begin secondDecision <=  tbtSr6[TB_DEPTH]; end
             7:  begin secondDecision <=  tbtSr7[TB_DEPTH]; end
             8:  begin secondDecision <=  tbtSr8[TB_DEPTH]; end
             9:  begin secondDecision <=  tbtSr9[TB_DEPTH]; end
             10: begin secondDecision <= tbtSr10[TB_DEPTH]; end
             11: begin secondDecision <= tbtSr11[TB_DEPTH]; end
             12: begin secondDecision <= tbtSr12[TB_DEPTH]; end
             13: begin secondDecision <= tbtSr13[TB_DEPTH]; end
             14: begin secondDecision <= tbtSr14[TB_DEPTH]; end
             15: begin secondDecision <= tbtSr15[TB_DEPTH]; end
             16: begin secondDecision <= tbtSr16[TB_DEPTH]; end
             17: begin secondDecision <= tbtSr17[TB_DEPTH]; end
             18: begin secondDecision <= tbtSr18[TB_DEPTH]; end
             19: begin secondDecision <= tbtSr19[TB_DEPTH]; end
           endcase
	end 
     end
     else begin
	firstDecision <= firstDecision;
        secondDecision <=  secondDecision;
     end

 // Final decision output 
   always @(posedge clk) begin
      if (reset) begin
         decision <= 0;
      end
      else if (symEnDly) begin  
         if (!clearStateCntFlag) begin // low every other symEn
            decision <= firstDecision;
         end
         else begin
            decision <= secondDecision;
         end
      end 
   end   


   reg [8:0] symEnSr3;
   always @(posedge clk) begin
      if (reset) begin
         symEnSr3 <= 0;
      end
      else begin
         symEnSr3 <= {symEnSr3[7:0], symEn};
      end
   end
   wire  symEnDly = symEnSr3[8];
   

endmodule
