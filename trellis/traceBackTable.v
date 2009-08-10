//-----------------------------------------------------------------------------
// Project      SEMCO Multi-mode Demodulator
// Design       Trace Back Table
// Created      22 April 09
//-----------------------------------------------------------------------------
// 1.0      AMJ initial coding
//
//
//-----------------------------------------------------------------------------

`timescale 1ns/1ps

// I may have to delay the symEn into this module to allow for the last samples to be computed
module traceBackTable(clk, reset, symEn,
                      sel, index,
                      decision,
                      oneOrZeroPredecessor,
                      symEnDly
                      );
   
   parameter          size = 8;
   input              clk,reset,symEn;
   input [19:0]       sel;   // 20 induvidual decision. 0 or 1 tell us if we trace + or - 7 modulo 20 
   input [4:0]        index; // pointer to the state which has the maximum metric
   output             decision, oneOrZeroPredecessor;
   output             symEnDly;
   reg                decision, oneOrZeroPredecessor;
   reg [5:0]          tbtSr0;
   reg [5:0]          tbtSr1;
   reg [5:0]          tbtSr2;
   reg [5:0]          tbtSr3;
   reg [5:0]          tbtSr4;
   reg [5:0]          tbtSr5;
   reg [5:0]          tbtSr6;
   reg [5:0]          tbtSr7;
   reg [5:0]          tbtSr8;
   reg [5:0]          tbtSr9;
   reg [5:0]          tbtSr10;
   reg [5:0]          tbtSr11;
   reg [5:0]          tbtSr12;
   reg [5:0]          tbtSr13;
   reg [5:0]          tbtSr14;
   reg [5:0]          tbtSr15;
   reg [5:0]          tbtSr16;
   reg [5:0]          tbtSr17;
   reg [5:0]          tbtSr18;
   reg [5:0]          tbtSr19;
   reg [2:0]          stateCnt;
   reg [4:0]          tbPtr;
   integer            k;
   
   // 3bits x 20 states trace-back shift-register
   always @(posedge clk)
     begin
        if (reset) begin
           //reset the whole traceback table to all zeroes
           /*
           for ( k=0 ; k<20; k=k+1 )
             tbtSr[k] <= 0;
           */
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
           if (stateCnt==3) begin  
              tbtSr0  <= {tbtSr0 [4:0], sel[0 ]};
              tbtSr1  <= {tbtSr1 [4:0], sel[1 ]};
              tbtSr2  <= {tbtSr2 [4:0], sel[2 ]};
              tbtSr3  <= {tbtSr3 [4:0], sel[3 ]};
              tbtSr4  <= {tbtSr4 [4:0], sel[4 ]};
              tbtSr5  <= {tbtSr5 [4:0], sel[5 ]};
              tbtSr6  <= {tbtSr6 [4:0], sel[6 ]};
              tbtSr7  <= {tbtSr7 [4:0], sel[7 ]};
              tbtSr8  <= {tbtSr8 [4:0], sel[8 ]};
              tbtSr9  <= {tbtSr9 [4:0], sel[9 ]};
              tbtSr10 <= {tbtSr10[4:0], sel[10]};
              tbtSr11 <= {tbtSr11[4:0], sel[11]};
              tbtSr12 <= {tbtSr12[4:0], sel[12]};
              tbtSr13 <= {tbtSr13[4:0], sel[13]};
              tbtSr14 <= {tbtSr14[4:0], sel[14]};
              tbtSr15 <= {tbtSr15[4:0], sel[15]};
              tbtSr16 <= {tbtSr16[4:0], sel[16]};
              tbtSr17 <= {tbtSr17[4:0], sel[17]};
              tbtSr18 <= {tbtSr18[4:0], sel[18]};
              tbtSr19 <= {tbtSr19[4:0], sel[19]};
           end
        end 
     end

      
   // state Machine counter
   always @(posedge clk)
     begin
        if (reset || symEn) begin
        //if (reset || symEnPipeDly) begin
            stateCnt <= 0;
        end
        else begin
           if (stateCnt < 4) // stay in the state
             stateCnt <= stateCnt+1;
           else
             stateCnt <= stateCnt;
        end
     end

  
   // Path Decisions. stateCnt moves us through the 4 prevoius paths
   always @(posedge clk)
     begin
        if (reset) begin
           tbPtr <= 0;
        end
        else if (stateCnt<4) begin    
           if (stateCnt==3) begin
              // loading in the max metric index
              tbPtr <= index; 
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


  reg t0, t1, t2, t3, t4, t5;
   // Final decision bit
   always @(posedge clk)
     if (reset) begin
        decision <= 0;
        //oneOrZeroPredecessor <= 0;
     end
     else if (stateCnt==2) begin
        //oneOrZeroPredecessor <= tbtSr[index][0]; //This bit is used to find the frequancy offset error term.
/* -----\/----- EXCLUDED -----\/-----
        t0 <= tbtSr[index][0];
        t1 <= tbtSr[index][1];
        t2 <= tbtSr[index][2];
        t3 <= tbtSr[index][3];
        t4 <= tbtSr[index][4];
        t5 <= tbtSr[index][5];
 -----/\----- EXCLUDED -----/\----- */
     end
     else if (stateCnt == 3) begin
        case (tbPtr)
            0: begin
                decision <= tbtSr0[3]; 
                t0 <= tbtSr0[0];
                t1 <= tbtSr0[1];
                t2 <= tbtSr0[2];
                t3 <= tbtSr0[3];
                t4 <= tbtSr0[4];
                t5 <= tbtSr0[5];
                end
            1: begin
                decision <= tbtSr1[3]; 
                t0 <= tbtSr1[0];
                t1 <= tbtSr1[1];
                t2 <= tbtSr1[2];
                t3 <= tbtSr1[3];
                t4 <= tbtSr1[4];
                t5 <= tbtSr1[5];
                end
            2: begin
                decision <= tbtSr2[3]; 
                t0 <= tbtSr2[0];
                t1 <= tbtSr2[1];
                t2 <= tbtSr2[2];
                t3 <= tbtSr2[3];
                t4 <= tbtSr2[4];
                t5 <= tbtSr2[5];
                end
            3: begin
                decision <= tbtSr3[3]; 
                t0 <= tbtSr3[0];
                t1 <= tbtSr3[1];
                t2 <= tbtSr3[2];
                t3 <= tbtSr3[3];
                t4 <= tbtSr3[4];
                t5 <= tbtSr3[5];
                end
            4: begin
                decision <= tbtSr4[3]; 
                t0 <= tbtSr4[0];
                t1 <= tbtSr4[1];
                t2 <= tbtSr4[2];
                t3 <= tbtSr4[3];
                t4 <= tbtSr4[4];
                t5 <= tbtSr4[5];
                end
            5: begin
                decision <= tbtSr5[3]; 
                t0 <= tbtSr5[0];
                t1 <= tbtSr5[1];
                t2 <= tbtSr5[2];
                t3 <= tbtSr5[3];
                t4 <= tbtSr5[4];
                t5 <= tbtSr5[5];
                end
            6: begin
                decision <= tbtSr6[3]; 
                t0 <= tbtSr6[0];
                t1 <= tbtSr6[1];
                t2 <= tbtSr6[2];
                t3 <= tbtSr6[3];
                t4 <= tbtSr6[4];
                t5 <= tbtSr6[5];
                end
            7: begin
                decision <= tbtSr7[3]; 
                t0 <= tbtSr7[0];
                t1 <= tbtSr7[1];
                t2 <= tbtSr7[2];
                t3 <= tbtSr7[3];
                t4 <= tbtSr7[4];
                t5 <= tbtSr7[5];
                end
            8: begin
                decision <= tbtSr8[3]; 
                t0 <= tbtSr8[0];
                t1 <= tbtSr8[1];
                t2 <= tbtSr8[2];
                t3 <= tbtSr8[3];
                t4 <= tbtSr8[4];
                t5 <= tbtSr8[5];
                end
            9: begin
                decision <= tbtSr9[3]; 
                t0 <= tbtSr9[0];
                t1 <= tbtSr9[1];
                t2 <= tbtSr9[2];
                t3 <= tbtSr9[3];
                t4 <= tbtSr9[4];
                t5 <= tbtSr9[5];
                end
            10: begin
                decision <= tbtSr10[3]; 
                t0 <= tbtSr10[0];
                t1 <= tbtSr10[1];
                t2 <= tbtSr10[2];
                t3 <= tbtSr10[3];
                t4 <= tbtSr10[4];
                t5 <= tbtSr10[5];
                end
            11: begin
                decision <= tbtSr11[3]; 
                t0 <= tbtSr11[0];
                t1 <= tbtSr11[1];
                t2 <= tbtSr11[2];
                t3 <= tbtSr11[3];
                t4 <= tbtSr11[4];
                t5 <= tbtSr11[5];
                end
            12: begin
                decision <= tbtSr12[3]; 
                t0 <= tbtSr12[0];
                t1 <= tbtSr12[1];
                t2 <= tbtSr12[2];
                t3 <= tbtSr12[3];
                t4 <= tbtSr12[4];
                t5 <= tbtSr12[5];
                end
            13: begin
                decision <= tbtSr13[3]; 
                t0 <= tbtSr13[0];
                t1 <= tbtSr13[1];
                t2 <= tbtSr13[2];
                t3 <= tbtSr13[3];
                t4 <= tbtSr13[4];
                t5 <= tbtSr13[5];
                end
            14: begin
                decision <= tbtSr14[3]; 
                t0 <= tbtSr14[0];
                t1 <= tbtSr14[1];
                t2 <= tbtSr14[2];
                t3 <= tbtSr14[3];
                t4 <= tbtSr14[4];
                t5 <= tbtSr14[5];
                end
            15: begin
                decision <= tbtSr15[3]; 
                t0 <= tbtSr15[0];
                t1 <= tbtSr15[1];
                t2 <= tbtSr15[2];
                t3 <= tbtSr15[3];
                t4 <= tbtSr15[4];
                t5 <= tbtSr15[5];
                end
            16: begin
                decision <= tbtSr16[3]; 
                t0 <= tbtSr16[0];
                t1 <= tbtSr16[1];
                t2 <= tbtSr16[2];
                t3 <= tbtSr16[3];
                t4 <= tbtSr16[4];
                t5 <= tbtSr16[5];
                end
            17: begin
                decision <= tbtSr17[3]; 
                t0 <= tbtSr17[0];
                t1 <= tbtSr17[1];
                t2 <= tbtSr17[2];
                t3 <= tbtSr17[3];
                t4 <= tbtSr17[4];
                t5 <= tbtSr17[5];
                end
            18: begin
                decision <= tbtSr18[3]; 
                t0 <= tbtSr18[0];
                t1 <= tbtSr18[1];
                t2 <= tbtSr18[2];
                t3 <= tbtSr18[3];
                t4 <= tbtSr18[4];
                t5 <= tbtSr18[5];
                end
            19: begin
                decision <= tbtSr19[3]; 
                t0 <= tbtSr19[0];
                t1 <= tbtSr19[1];
                t2 <= tbtSr19[2];
                t3 <= tbtSr19[3];
                t4 <= tbtSr19[4];
                t5 <= tbtSr19[5];
                end
            endcase
     end
     else begin
        decision <=  decision;
        //oneOrZeroPredecessor <= oneOrZeroPredecessor;
     end


/* -----\/----- EXCLUDED -----\/-----
  always @(posedge clk)
     begin
        if (reset) begin
           oneOrZeroPredecessor <= 0;
        end
        else if (symEn) begin
           oneOrZeroPredecessor <= sel[index];
        end
     end
 -----/\----- EXCLUDED -----/\----- */



    
 // ++++++++++++  symEN shift +++++++++++++
  reg [8:0] symEnSr;
  always @(posedge clk) begin
     if (reset) begin
        symEnSr <= 0;
     end
     else if(symEn) begin
        symEnSr <= {symEnSr[7:0], symEn};
     end
     else if(symEnSr[0]) begin
        symEnSr <= {symEnSr[7:0], symEn};
     end
  end

  reg [2:0] symEnSr2;
  always @(posedge clk) begin
     if (reset) begin
        symEnSr2 <= 0;
     end
     else begin
        symEnSr2 <= {symEnSr2[1:0], symEnSr[8]};
     end
  end



/* -----\/----- EXCLUDED -----\/-----
  // ++++++++++++  sym2xEN shift +++++++++++++
  reg [24:0] sym2xEnSr;
  always @(posedge clk) begin
     if (reset) begin
        sym2xEnSr <= 0;
   end
     else if(sym2xEn) begin
        sym2xEnSr <= {sym2xEnSr[15:0], 1'b1};
     end
     else if(sym2xEnSr[0]) begin
        sym2xEnSr <= {sym2xEnSr[15:0], 1'b0};
     end
  end

  reg [2:0] symEnSr2,sym2xEnSr2;
//  reg sym2xEnDly;
  always @(posedge clk) begin
     if (reset) begin
        symEnSr2 <= 0;
        sym2xEnSr2 <= 0;
     end
     else begin
        symEnSr2 <= {symEnSr2[1:0], symEnSr[8]};
        sym2xEnSr2 <= {sym2xEnSr2[1:0], sym2xEnSr[16]};                // sym2xEn final output
     end
  end
 -----/\----- EXCLUDED -----/\----- */

  // +++++++ symEn final output +++++++++
  assign symEnDly = symEnSr2[2];
  //assign sym2xEnDly = sym2xEnSr2[2];


endmodule
