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
module traceBackTable(clk, reset, symEn, sym2xEn,
                      sel, index,
                      decision,
                      oneOrZeroPredecessor
                      );
   
   parameter          size = 8;
   input              clk,reset,symEn,sym2xEn;
   input [19:0]       sel;   // 20 induvidual decision. 0 or 1 tell us if we trace + or - 7 modulo 20 
   input [4:0]        index; // pointer to the state which has the maximum metric
   output             decision, oneOrZeroPredecessor;
   reg                decision, oneOrZeroPredecessor;
   reg [5:0]          tbtSr [19:0];
   reg [2:0]          stateCnt;
   reg [4:0]          tbPtr;
   integer            k;
   
   // 3bits x 20 states trace-back shift-register
   always @(posedge clk)
     begin
        if (reset) begin
           //reset the whole traceback table to all zeroes
           for ( k=0 ; k<20; k=k+1 )
             tbtSr[k] <= 0;
        end
        else begin
           if (stateCnt==3) begin  
              tbtSr[0 ] <= {tbtSr[0 ][4:0], sel[0 ]};
              tbtSr[1 ] <= {tbtSr[1 ][4:0], sel[1 ]};
              tbtSr[2 ] <= {tbtSr[2 ][4:0], sel[2 ]};
              tbtSr[3 ] <= {tbtSr[3 ][4:0], sel[3 ]};
              tbtSr[4 ] <= {tbtSr[4 ][4:0], sel[4 ]};
              tbtSr[5 ] <= {tbtSr[5 ][4:0], sel[5 ]};
              tbtSr[6 ] <= {tbtSr[6 ][4:0], sel[6 ]};
              tbtSr[7 ] <= {tbtSr[7 ][4:0], sel[7 ]};
              tbtSr[8 ] <= {tbtSr[8 ][4:0], sel[8 ]};
              tbtSr[9 ] <= {tbtSr[9 ][4:0], sel[9 ]};
              tbtSr[10] <= {tbtSr[10][4:0], sel[10]};
              tbtSr[11] <= {tbtSr[11][4:0], sel[11]};
              tbtSr[12] <= {tbtSr[12][4:0], sel[12]};
              tbtSr[13] <= {tbtSr[13][4:0], sel[13]};
              tbtSr[14] <= {tbtSr[14][4:0], sel[14]};
              tbtSr[15] <= {tbtSr[15][4:0], sel[15]};
              tbtSr[16] <= {tbtSr[16][4:0], sel[16]};
              tbtSr[17] <= {tbtSr[17][4:0], sel[17]};
              tbtSr[18] <= {tbtSr[18][4:0], sel[18]};
              tbtSr[19] <= {tbtSr[19][4:0], sel[19]};
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
                   if (tbtSr[tbPtr][stateCnt]==0) 
                     tbPtr <= 7; // sel=0 makes us jump +7 modulo 20.  
                   else 
                     tbPtr <= 13;  // sel=1,   jump -7 modulo 20
                end
                1 : if (tbtSr[tbPtr][stateCnt]==0) tbPtr <= 8 ;  else tbPtr <= 14;
                2 : if (tbtSr[tbPtr][stateCnt]==0) tbPtr <= 9 ;  else tbPtr <= 15;
                3:  if (tbtSr[tbPtr][stateCnt]==0) tbPtr <= 10;  else tbPtr <= 16;
                4:  if (tbtSr[tbPtr][stateCnt]==0) tbPtr <= 11;  else tbPtr <= 17;
                5:  if (tbtSr[tbPtr][stateCnt]==0) tbPtr <= 12;  else tbPtr <= 18;
                6:  if (tbtSr[tbPtr][stateCnt]==0) tbPtr <= 13;  else tbPtr <= 19;
                7:  if (tbtSr[tbPtr][stateCnt]==0) tbPtr <= 14;  else tbPtr <= 0 ;
                8:  if (tbtSr[tbPtr][stateCnt]==0) tbPtr <= 15;  else tbPtr <= 1 ;
                9:  if (tbtSr[tbPtr][stateCnt]==0) tbPtr <= 16;  else tbPtr <= 2 ;
                10: if (tbtSr[tbPtr][stateCnt]==0) tbPtr <= 17;  else tbPtr <= 3 ;
                11: if (tbtSr[tbPtr][stateCnt]==0) tbPtr <= 18;  else tbPtr <= 4 ;
                12: if (tbtSr[tbPtr][stateCnt]==0) tbPtr <= 19;  else tbPtr <= 5 ;
                13: if (tbtSr[tbPtr][stateCnt]==0) tbPtr <= 0 ;  else tbPtr <= 6 ;
                14: if (tbtSr[tbPtr][stateCnt]==0) tbPtr <= 1 ;  else tbPtr <= 7 ;
                15: if (tbtSr[tbPtr][stateCnt]==0) tbPtr <= 2 ;  else tbPtr <= 8 ;
                16: if (tbtSr[tbPtr][stateCnt]==0) tbPtr <= 3 ;  else tbPtr <= 9 ;
                17: if (tbtSr[tbPtr][stateCnt]==0) tbPtr <= 4 ;  else tbPtr <= 10;
                18: if (tbtSr[tbPtr][stateCnt]==0) tbPtr <= 5 ;  else tbPtr <= 11;
                19: if (tbtSr[tbPtr][stateCnt]==0) tbPtr <= 6 ;  else tbPtr <= 12;
              endcase
           end
        end
        else begin
           // Stay in the same state
           tbPtr <= tbPtr;
        end
     end
           
   
   // Final decision bit
   always @(posedge clk)
     if (reset) begin
        decision <= 0;
        oneOrZeroPredecessor <= 0;
     end
     else if (stateCnt==2) begin
        oneOrZeroPredecessor <= tbtSr[index][0]; //This bit is used to find the frequancy offset error term.
     end
     else if (stateCnt == 3) begin
        decision <= tbtSr[tbPtr][3]; 
     end
     else begin
        decision <=  decision;
        oneOrZeroPredecessor <= oneOrZeroPredecessor;
     end
   
endmodule
