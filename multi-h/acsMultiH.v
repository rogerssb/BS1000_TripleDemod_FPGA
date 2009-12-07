`timescale 1ns/1ps
module acsMultH
  (
   clk, reset, symEn, sym2xEn,
   `ifdef USE_DECAY
   decayFactor,
   `endif
   mfI_45_0, mfI_45_1, mfI_45_2,mfI_45_3, 
   mfI_54_0, mfI_54_1, mfI_54_2,mfI_54_3, 
   mfQ_45_0, mfQ_45_1, mfQ_45_2,mfQ_45_3, 
   mfQ_54_0, mfQ_54_1, mfQ_54_2,mfQ_54_3,
   tilt,
   accMet_45_0, accMet_45_1, accMet_45_2, accMet_45_3, 
   accMet_54_0, accMet_54_1, accMet_54_2, accMet_54_3, 
   selOut,
   normalizeIn, normalizeOut,
   accMetOut,
   iOut, qOut
   );
   parameter             ROT_45_0=0, ROT_45_1=0, ROT_45_2 =0,ROT_45_3=0,
                         ROT_54_0=0, ROT_54_1=0, ROT_54_2 =0,ROT_54_3=0;
   
   parameter             ACS_BITS = 12;
   parameter             MF_BITS = 10;
   
   input                 clk, reset;
   input                 symEn, sym2xEn;
   `ifdef USE_DECAY
   input [7:0]           decayFactor;
   `endif

   input [MF_BITS-1:0]   mfI_45_0, mfI_45_1, mfI_45_2,mfI_45_3, 
                         mfI_54_0, mfI_54_1, mfI_54_2,mfI_54_3, 
                         mfQ_45_0, mfQ_45_1, mfQ_45_2,mfQ_45_3, 
                         mfQ_54_0, mfQ_54_1, mfQ_54_2,mfQ_54_3;
   input [4:0]           tilt;
   input [ACS_BITS-1:0]  accMet_45_0, accMet_45_1, accMet_45_2, accMet_45_3, 
                         accMet_54_0, accMet_54_1, accMet_54_2, accMet_54_3;
   

   output [1:0]          selOut;
   input                 normalizeIn;
   output                normalizeOut;
   output [ACS_BITS-1:0] accMetOut;     
   output [MF_BITS-1:0]  iOut;
   output [MF_BITS-1:0]  qOut;

   // Some control singnals  
   reg                   symEnEven;   // toggles with every symEn
   reg [1:0]             inputMuxSel; // starts to count to 3, resets to 0 at symEn
   always @(posedge clk)
     begin
        if (reset) begin
           symEnEven <= 1;
           inputMuxSel <= 0;
        end
        else begin 
           if (symEn) begin
              symEnEven <= ~symEnEven;
              inputMuxSel <= 0;
           end
           else begin
              if (inputMuxSel<3) begin
                 inputMuxSel <= inputMuxSel+1;
              end
           end
        end
     end


   reg symEn1dly, sym2xEn1dly;
   always @(posedge clk) begin
      symEn1dly <= symEn;
      sym2xEn1dly <= sym2xEn;
   end


   
   // four 4to1 input muxes on the match filter inputs. 
   reg [MF_BITS-1:0]    mfI45MuxOut, mfI54MuxOut,
                        mfQ45MuxOut, mfQ54MuxOut;
   always @(inputMuxSel or 
            mfI_45_0 or mfI_54_0 or
            mfI_45_1 or mfI_54_1 or 
            mfI_45_2 or mfI_54_2 or 
            mfI_45_3 or mfI_54_3 or 
            mfQ_45_0 or mfQ_54_0 or
            mfQ_45_1 or mfQ_54_1 or 
            mfQ_45_2 or mfQ_54_2 or 
            mfQ_45_3 or mfQ_54_3) 

     begin
        case(inputMuxSel) 
          0: begin
             mfI45MuxOut <= mfI_45_0;
             mfI54MuxOut <= mfI_54_0;
             mfQ45MuxOut <= mfQ_45_0;
             mfQ54MuxOut <= mfQ_54_0;
          end
          1: begin
             mfI45MuxOut <= mfI_45_1;
             mfI54MuxOut <= mfI_54_1;
             mfQ45MuxOut <= mfQ_45_1;
             mfQ54MuxOut <= mfQ_54_1;
          end
          2: begin
             mfI45MuxOut <= mfI_45_2;
             mfI54MuxOut <= mfI_54_2;
             mfQ45MuxOut <= mfQ_45_2;
             mfQ54MuxOut <= mfQ_54_2;
          end
          3: begin
             mfI45MuxOut <= mfI_45_3;
             mfI54MuxOut <= mfI_54_3;
             mfQ45MuxOut <= mfQ_45_3;
             mfQ54MuxOut <= mfQ_54_3;
          end
        endcase
     end
   

   // Two 4to1 input muxes on the accumulated metric inputs. 
   reg [ACS_BITS-1:0]    accMet45MuxOut, accMet54MuxOut;
   always @(inputMuxSel or 
            accMet_45_0 or accMet_54_0 or
            accMet_45_1 or accMet_54_1 or 
            accMet_45_2 or accMet_54_2 or 
            accMet_45_3 or accMet_54_3)
     begin
        case(inputMuxSel) 
          0: begin
             accMet45MuxOut <= accMet_45_0;
             accMet54MuxOut <= accMet_54_0;
          end
          1: begin
             accMet45MuxOut <= accMet_45_1;
             accMet54MuxOut <= accMet_54_1;
          end
          2: begin
             accMet45MuxOut <= accMet_45_2;
             accMet54MuxOut <= accMet_54_2;
          end
          3: begin
             accMet45MuxOut <= accMet_45_3;
             accMet54MuxOut <= accMet_54_3;
          end
        endcase
     end


   // Selects the amount of rotation bases on the matlab signal theta(n-2), here called ROT_45/54_?. 
   reg [4:0] rotSel;
   always @(inputMuxSel or symEnEven or tilt or 
            ROT_45_0 or ROT_45_1 or ROT_45_2 or ROT_45_3 or
            ROT_54_0 or ROT_54_1 or ROT_54_2 or ROT_54_3
            )
     begin
        if (symEnEven) begin
           case(inputMuxSel) 
             0: begin
                rotSel = tilt + ROT_45_0;
             end
             1: begin
                rotSel = tilt + ROT_45_1;
             end
             2: begin
                rotSel = tilt + ROT_45_2;
             end
             3: begin
                rotSel = tilt + ROT_45_3;
             end
           endcase // case(inputMuxSel)
        end
        else begin
           case(inputMuxSel) 
             0: begin
                rotSel = tilt + ROT_54_0;
             end
             1: begin
                rotSel = tilt + ROT_54_1;
             end
             2: begin
                rotSel = tilt + ROT_54_2;
             end
             3: begin
                rotSel = tilt + ROT_54_3;
             end
           endcase // case(inputMuxSel)
        end
     end
   
   
/* -----\/----- EXCLUDED -----\/-----
   tiltPhaseAcc tiltPhaseAcc
     (
      .clk       (clk      ), 
      .reset     (reset    ), 
      .symEn     (symEn    ),
      .symEnEven (symEnEven),
      .tilt      (tilt     )
      );
 -----/\----- EXCLUDED -----/\----- */


   reg [MF_BITS-1:0]     iMfInRot, qMfInRot;
   reg [ACS_BITS-1:0]    accMetTmp;
   always @ (symEnEven or 
             mfI45MuxOut or mfI54MuxOut or
             mfQ45MuxOut or mfQ54MuxOut or 
             accMet45MuxOut or accMet54MuxOut) begin
      if (symEnEven) begin
         iMfInRot <= mfI45MuxOut;
         qMfInRot <= mfQ45MuxOut;
         accMetTmp <= accMet45MuxOut;
      end
      else begin
         iMfInRot <= mfI54MuxOut;
         qMfInRot <= mfQ54MuxOut;
         accMetTmp <= accMet54MuxOut;
      end
   end

   wire [MF_BITS-1:0] iOutRot, qOutRot;
   rotator rotator
     (
      .clk        (clk        ), 
      .reset      (reset      ), 
      .symEn      (symEn1dly  ), 
      .sym2xEn    (sym2xEn1dly), 
      .i          (iMfInRot   ),    
      .q          (qMfInRot   ),
      .sel        (rotSel     ),
      .symEnOut   (symEnRot   ),   
      .sym2xEnOut (sym2xEnRot ),   
      .iOut       (iOutRot    ),   
      .qOut       (qOutRot    )
      );


   // aligning accMet data with the data output the rotator
   // Simmulated and Verified!
   reg [ACS_BITS-1:0]    accMetSr0;
   reg [ACS_BITS-1:0]    accMetSr1;
   reg [ACS_BITS-1:0]    accMetSr2;
   reg [ACS_BITS-1:0]    accMetSr3;
   reg [ACS_BITS-1:0]    accMetSr4;
   always @(posedge clk) begin
      if (reset) begin
         accMetSr0 <= 0;
         accMetSr1 <= 0;
         accMetSr2 <= 0;
         accMetSr3 <= 0;
         accMetSr4 <= 0;
      end
      else begin
         accMetSr0 <= accMetTmp;
         accMetSr1 <= accMetSr0;
         accMetSr2 <= accMetSr1;
         accMetSr3 <= accMetSr2;
         accMetSr4 <= accMetSr3;
      end
   end
   
      
   wire [ACS_BITS-1:0]    accMetInAdder = accMetSr4;
   
   // 2-comp adder: Adds a vector of width 10 and one of 12.
   wire [ACS_BITS-1:0]    sum;
   wire [ACS_BITS:0]      tmpSum;
   wire [ACS_BITS:0]      aExt = {iOutRot[MF_BITS-1], iOutRot[MF_BITS-1], iOutRot[MF_BITS-1], iOutRot};
   wire [ACS_BITS:0]      bExt = {accMetInAdder[ACS_BITS-1], accMetInAdder};
   assign                 tmpSum = aExt + bExt;
   //assign #1000           sum = tmpSum[ACS_BITS-1:0];    // slicing off the MSB (watchout for the sign bit) 
   assign                 sum = tmpSum[ACS_BITS-1:0];    // slicing off the MSB (watchout for the sign bit) 

//   reg                    symEnAdder;    
//   reg                    sym2xEnAdde;
//   always @(posedge clk) begin
//      symEnAdder <= symEnRot;
//      sym2xEnAdder <= sym2xEnRot;
//   end


   // max hold circuit
   reg [2:0]             maxCnt; // starts to count to maximum 4, resets to 0 at symEn
   always @(posedge clk) begin
      if (reset) begin
         maxCnt <= 1;
      end
      else if (symEnRot) begin
         maxCnt <= 0;
      end
      else if (maxCnt<4) begin
         maxCnt <= maxCnt+1;
      end
   end

   // finding the max Value
   reg [ACS_BITS-1:0]     maxSum;
   reg [1:0]              selOut;
   reg [MF_BITS-1:0]     iSurvivingRotMf;
   reg [MF_BITS-1:0]     qSurvivingRotMf;
   always @(posedge clk) begin
      if (reset) begin
         maxSum <= 0;
         selOut <= 0;
         iSurvivingRotMf <= 0;
         qSurvivingRotMf <= 0;
      end
      else if (symEnRot) begin
            maxSum <= sum;
            selOut <= maxCnt+1;
            iSurvivingRotMf <= iOutRot;
            qSurvivingRotMf <= qOutRot;
      end
      else if (maxCnt<4) begin
         case ({sum[ACS_BITS-1], maxSum[ACS_BITS-1]}) // Checking the sign bit 
           2'b00: begin // both pos
              if (sum>maxSum) begin
                 maxSum <= sum;
                 selOut <= maxCnt+1;
                 iSurvivingRotMf <= iOutRot;
                 qSurvivingRotMf <= qOutRot;
              end
           end
           2'b01:  begin // sum=pos, maxSum=neg
              if (sum[ACS_BITS-2:0] < maxSum[ACS_BITS-2:0]) begin
                 maxSum <= sum;
                 selOut <= maxCnt+1;
                 iSurvivingRotMf <= iOutRot;
                 qSurvivingRotMf <= qOutRot;
              end

           end
           
           2'b10: begin // sum=neg, maxSum=pos

           end
           2'b11: begin // both neg
              if (sum[ACS_BITS-2:0] > maxSum[ACS_BITS-2:0]) begin
                 maxSum <= sum;
                 selOut <= maxCnt+1;
                 iSurvivingRotMf <= iOutRot;
                 qSurvivingRotMf <= qOutRot;
              end
           end
         endcase
      end
   end


   // --------- Normailzation and forget factor -------------
//`define USE_DELAYED_NORM
`ifdef USE_DELAYED_NORM
`else
   reg normalizeOut;
   always @(maxSum[ACS_BITS-1:ACS_BITS-2]) begin
      if ((maxSum[ACS_BITS-1:ACS_BITS-2] == 2'b01) ) begin //check (in the pos. case) if the acc. 8th bit saturate
         normalizeOut <= 1;
      end
      else begin
         normalizeOut <= 0;
      end
   end
`endif
   
   // subtracting of a constant and saturate all neg numbers to zero to bring down the acc and prevent it from overflowing

   wire [ACS_BITS-1:0]  accTempSum = maxSum - 512;
   reg [ACS_BITS-1:0]   accTemp;
   always @(accTempSum) begin
        if (accTempSum[ACS_BITS-1]) begin // check to see if the msb is 1 (i.e. neg), then set the acc to zero
            accTemp <= 0;
        end else begin
            accTemp <= accTempSum;
        end
   end

   
`ifdef USE_DECAY
   wire [ACS_BITS-1:0]   accMetOut;
   wire [12:0]           decayOut;
   assign                accMetOut = decayOut[12:1] + decayOut[0];
   mult12x8 accumDecay
     (
      .ce(symEnRot), 
      .clk(clk), 
      .sclr(reset),
      .a(normalizeIn ? accTemp : maxSum), 
      .b(decayFactor), 
      .p(decayOut)
      );

`ifdef USE_DELAYED_NORM
   reg normalizeOut;
   always @(decayOut[12:11]) begin
         if ((decayOut[12:11] == 2'b01) ) begin //check (in the pos. case) if the acc. 8th bit saturate
            normalizeOut <= 1;
         end
         else begin
            normalizeOut <= 0;
         end
      end
`endif
   
`else
   reg [ACS_BITS-1:0]    accMetOut;
   always @(posedge clk)
     if (reset) begin
        accMetOut <= 0;
     end
     else if (symEnRot) begin
        if (normalizeIn) begin
           accMetOut <= accTemp;
        end
        else begin
           accMetOut <= maxSum;
        end
     end
`endif   

   
endmodule

   