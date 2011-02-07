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

module traceBackTable8deepSlowRate (clk, reset, symEn,
                                    sel, index,
                                    decision,
                                    symEnDly
                                    );
   
   input              clk,reset,symEn;
   input [19:0]       sel;   // 20 induvidual decision. 0 or 1 tell us if we trace + or - 7 modulo 20 
   input [4:0]        index; // pointer to the state which has the maximum metric
   output             decision;
   output             symEnDly;
   reg                decision;
   reg [9:0]          tbtSr0;
   reg [9:0]          tbtSr1;
   reg [9:0]          tbtSr2;
   reg [9:0]          tbtSr3;
   reg [9:0]          tbtSr4;
   reg [9:0]          tbtSr5;
   reg [9:0]          tbtSr6;
   reg [9:0]          tbtSr7;
   reg [9:0]          tbtSr8;
   reg [9:0]          tbtSr9;
   reg [9:0]          tbtSr10;
   reg [9:0]          tbtSr11;
   reg [9:0]          tbtSr12;
   reg [9:0]          tbtSr13;
   reg [9:0]          tbtSr14;
   reg [9:0]          tbtSr15;
   reg [9:0]          tbtSr16;
   reg [9:0]          tbtSr17;
   reg [9:0]          tbtSr18;
   reg [9:0]          tbtSr19;
   reg [3:0]          stateCnt;
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
           if (stateCnt==7) begin  
              tbtSr0  <= {tbtSr0 [8:0], sel[0 ]};
              tbtSr1  <= {tbtSr1 [8:0], sel[1 ]};
              tbtSr2  <= {tbtSr2 [8:0], sel[2 ]};
              tbtSr3  <= {tbtSr3 [8:0], sel[3 ]};
              tbtSr4  <= {tbtSr4 [8:0], sel[4 ]};
              tbtSr5  <= {tbtSr5 [8:0], sel[5 ]};
              tbtSr6  <= {tbtSr6 [8:0], sel[6 ]};
              tbtSr7  <= {tbtSr7 [8:0], sel[7 ]};
              tbtSr8  <= {tbtSr8 [8:0], sel[8 ]};
              tbtSr9  <= {tbtSr9 [8:0], sel[9 ]};
              tbtSr10 <= {tbtSr10[8:0], sel[10]};
              tbtSr11 <= {tbtSr11[8:0], sel[11]};
              tbtSr12 <= {tbtSr12[8:0], sel[12]};
              tbtSr13 <= {tbtSr13[8:0], sel[13]};
              tbtSr14 <= {tbtSr14[8:0], sel[14]};
              tbtSr15 <= {tbtSr15[8:0], sel[15]};
              tbtSr16 <= {tbtSr16[8:0], sel[16]};
              tbtSr17 <= {tbtSr17[8:0], sel[17]};
              tbtSr18 <= {tbtSr18[8:0], sel[18]};
              tbtSr19 <= {tbtSr19[8:0], sel[19]};
           end
        end 
     end

   // state Machine counter
   always @(posedge clk)
     begin
        if (reset || symEn) begin
           stateCnt <= 0;
        end
        else begin
           if (stateCnt < 8) // stay in the state
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
        else if (stateCnt<8) begin      
           if (stateCnt==7) begin
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
           end // else: !if(stateCnt==7)
        end // if (stateCnt<8)
        else begin
           tbPtr <= tbPtr;
        end
     end

   // Final decision bit
   always @(posedge clk)
     if (reset) begin
        decision <= 0;
     end
     else if (stateCnt == 7) begin
        case (tbPtr)
            0:  begin decision <= tbtSr0[7]; end
            1:  begin decision <= tbtSr1[7]; end
            2:  begin decision <= tbtSr2[7]; end
            3:  begin decision <= tbtSr3[7]; end
            4:  begin decision <= tbtSr4[7]; end
            5:  begin decision <= tbtSr5[7]; end
            6:  begin decision <= tbtSr6[7]; end
            7:  begin decision <= tbtSr7[7]; end
            8:  begin decision <= tbtSr8[7]; end
            9:  begin decision <= tbtSr9[7]; end
            10: begin decision <= tbtSr10[7]; end
            11: begin decision <= tbtSr11[7]; end
            12: begin decision <= tbtSr12[7]; end
            13: begin decision <= tbtSr13[7]; end
            14: begin decision <= tbtSr14[7]; end
            15: begin decision <= tbtSr15[7]; end
            16: begin decision <= tbtSr16[7]; end
            17: begin decision <= tbtSr17[7]; end
            18: begin decision <= tbtSr18[7]; end
            19: begin decision <= tbtSr19[7]; end
        endcase
     end
     else begin
        decision <=  decision;
     end


   
   
 // ++++++++++++  symEN shift +++++++++++++
   reg symEnR;
   always @(posedge clk) begin
      if (reset) symEnR <= 0;
      else symEnR <= symEn;
   end
   
   
   reg [8:0] symEnSr;
   always @(posedge clk) begin
      if (reset) begin
         symEnSr <= 0;
      end
      else if(symEn) begin
         symEnSr <= {symEnSr[6:0], symEn, 1'b0};
      end
      //else if(symEnR) begin
      //   symEnSr <= {symEnSr[7:1], symEn};
      //end
      //else if (symEnSr[0]) begin
      //   symEnSr <= {symEnSr[7:0], 1'b0};
      //end
      //     else if (symEnSr[1]) begin
      //        symEnSr <= {symEnSr[7:1], 1'b0, symEnSr[0]};
      //     end
   end

  reg [6:0] symEnSr2;
  always @(posedge clk) begin
     if (reset) begin
        symEnSr2 <= 0;
     end
     else begin
        symEnSr2 <= {symEnSr2[5:0], symEnSr[8]};
     end
  end


   // +++++++ symEn final output +++++++++
   //assign symEnDly = symEnSr2[2];
   assign symEnDly = symEnSr2[6];

endmodule
