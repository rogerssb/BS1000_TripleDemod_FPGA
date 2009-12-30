`timescale 1ns/1ps
module acsMultH
  (
   clk, reset, symEn, sym2xEn,
   symEnEven,
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
   iOut, qOut,
   symEnOut, sym2xEnOut
   );
   parameter             ROT_45_0=0, ROT_45_1=0, ROT_45_2 =0,ROT_45_3=0,
                         ROT_54_0=0, ROT_54_1=0, ROT_54_2 =0,ROT_54_3=0;
   parameter             ENABLE_DEBUG_PRINTOUT=0;  // Turnes on the debug display printout. You can look at induvidual ASC outputs by turning  
   parameter             ACS_BITS = 12;
   parameter             MF_BITS = 10;
   parameter             ROT_BITS = 8;
   
   input                 clk, reset;
   input                 symEn, sym2xEn, symEnEven;
   `ifdef USE_DECAY
   input [7:0]           decayFactor;
   `endif

   input [MF_BITS-1:0]   mfI_45_0, mfI_45_1, mfI_45_2, mfI_45_3, 
                         mfI_54_0, mfI_54_1, mfI_54_2, mfI_54_3, 
                         mfQ_45_0, mfQ_45_1, mfQ_45_2, mfQ_45_3, 
                         mfQ_54_0, mfQ_54_1, mfQ_54_2, mfQ_54_3;
   input [4:0]           tilt;
   input [ACS_BITS-1:0]  accMet_45_0, accMet_45_1, accMet_45_2, accMet_45_3, 
                         accMet_54_0, accMet_54_1, accMet_54_2, accMet_54_3;
   

   output [1:0]          selOut;
   input                 normalizeIn;
   output                normalizeOut;
   output [ACS_BITS-1:0] accMetOut;     
   output [ROT_BITS-1:0] iOut;
   output [ROT_BITS-1:0] qOut;
   output                symEnOut, sym2xEnOut;

   // re-clock the Match Filter inputs to improve the fan-out on the register to register timing 
   // from the matchfiter output to the imput of the ACS 
   reg [MF_BITS-1:0]     mfI_45_0r, mfI_45_1r, mfI_45_2r, mfI_45_3r, 
                         mfI_54_0r, mfI_54_1r, mfI_54_2r, mfI_54_3r, 
                         mfQ_45_0r, mfQ_45_1r, mfQ_45_2r, mfQ_45_3r, 
                         mfQ_54_0r, mfQ_54_1r, mfQ_54_2r, mfQ_54_3r;
   always @(posedge clk) begin
      if (reset) begin
         mfI_45_0r <= 0;
         mfI_45_1r <= 0;
         mfI_45_2r <= 0;
         mfI_45_3r <= 0;
         mfI_54_0r <= 0;
         mfI_54_1r <= 0;
         mfI_54_2r <= 0;
         mfI_54_3r <= 0;
         mfQ_45_0r <= 0;
         mfQ_45_1r <= 0;
         mfQ_45_2r <= 0;
         mfQ_45_3r <= 0;
         mfQ_54_0r <= 0;
         mfQ_54_1r <= 0;
         mfQ_54_2r <= 0;
         mfQ_54_3r <= 0;
      end
      else if (symEn) begin
         mfI_45_0r <= mfI_45_0;
         mfI_45_1r <= mfI_45_1;
         mfI_45_2r <= mfI_45_2;
         mfI_45_3r <= mfI_45_3;
         mfI_54_0r <= mfI_54_0;
         mfI_54_1r <= mfI_54_1;
         mfI_54_2r <= mfI_54_2;
         mfI_54_3r <= mfI_54_3;
         mfQ_45_0r <= mfQ_45_0;
         mfQ_45_1r <= mfQ_45_1;
         mfQ_45_2r <= mfQ_45_2;
         mfQ_45_3r <= mfQ_45_3;
         mfQ_54_0r <= mfQ_54_0;
         mfQ_54_1r <= mfQ_54_1;
         mfQ_54_2r <= mfQ_54_2;
         mfQ_54_3r <= mfQ_54_3;
      end
   end

   reg [5:0] symEnSr;
   reg [5:0] sym2xEnSr;
   reg [5:0] symEnEvenSr;
   always @(posedge clk) begin
      if (reset) begin
         symEnSr <= 0;
         sym2xEnSr <= 0;
      end
      else begin
         symEnSr <= {symEnSr[4:0], symEnRot};
         sym2xEnSr <= {sym2xEnSr[4:0], sym2xEnRot};
         symEnEvenSr <= {symEnEvenSr[4:0], symEnEven};
      end
   end

   wire symEnAdder = symEnRot; //symEnSr[3];    
   wire symEnEvenAdder = symEnEvenSr[1]; //symEnEvenSr[5];  // 2 clocks through rotator and 4 in the ACS loop
   wire symEnMax = symEnSr[3];    
   wire sym2xEnMax = sym2xEnSr[3];    
   wire symEnOut = symEnMax;
   wire sym2xEnOut = sym2xEnMax;


   // Some control singnals  
   //reg                   symEnEven;   // toggles with every symEn
   reg [1:0]             inputMuxSel; // starts to count to 3, resets to 0 at symEn
   always @(posedge clk)
     begin
        if (reset) begin
           //symEnEven <= 1;
           inputMuxSel <= 3; //0;
        end
        else begin 
           if (symEn) begin
              //symEnEven <= ~symEnEven;
              inputMuxSel <= 0;
           end
           else begin
              if (inputMuxSel<3) begin
                 inputMuxSel <= inputMuxSel+1;
              end
           end
        end
     end

   reg [1:0]             inputMuxSelAcs; // starts to count to 3, resets to 0 at symEn
   always @(posedge clk)
     begin
        if (reset) begin
           inputMuxSelAcs <= 0;
        end
        else begin 
           if (symEnAdder) begin
              inputMuxSelAcs <= 0;
           end
           else begin
              if (inputMuxSelAcs<3) begin
                 inputMuxSelAcs <= inputMuxSelAcs+1;
              end
           end
        end
     end

   

/* -----\/----- EXCLUDED -----\/-----
   reg symEn1dly, sym2xEn1dly;
   always @(posedge clk) begin
      symEn1dly <= symEn;
      sym2xEn1dly <= sym2xEn;
   end
 -----/\----- EXCLUDED -----/\----- */


   
   // four 4to1 input muxes on the match filter inputs. 
   reg [MF_BITS-1:0]    mfI45MuxOut, mfI54MuxOut,
                        mfQ45MuxOut, mfQ54MuxOut;
   always @(inputMuxSel or 
            mfI_45_0r or mfI_54_0r or
            mfI_45_1r or mfI_54_1r or 
            mfI_45_2r or mfI_54_2r or 
            mfI_45_3r or mfI_54_3r or 
            mfQ_45_0r or mfQ_54_0r or
            mfQ_45_1r or mfQ_54_1r or 
            mfQ_45_2r or mfQ_54_2r or 
            mfQ_45_3r or mfQ_54_3r) 

     begin
        case(inputMuxSel) 
          0: begin
             mfI45MuxOut <= mfI_45_0r;
             mfI54MuxOut <= mfI_54_0r;
             mfQ45MuxOut <= mfQ_45_0r;
             mfQ54MuxOut <= mfQ_54_0r;
          end
          1: begin
             mfI45MuxOut <= mfI_45_1r;
             mfI54MuxOut <= mfI_54_1r;
             mfQ45MuxOut <= mfQ_45_1r;
             mfQ54MuxOut <= mfQ_54_1r;
          end
          2: begin
             mfI45MuxOut <= mfI_45_2r;
             mfI54MuxOut <= mfI_54_2r;
             mfQ45MuxOut <= mfQ_45_2r;
             mfQ54MuxOut <= mfQ_54_2r;
          end
          3: begin
             mfI45MuxOut <= mfI_45_3r;
             mfI54MuxOut <= mfI_54_3r;
             mfQ45MuxOut <= mfQ_45_3r;
             mfQ54MuxOut <= mfQ_54_3r;
          end
        endcase
     end
   

   // Two 4to1 input muxes on the accumulated metric inputs. 
   reg [ACS_BITS-1:0]    accMet45MuxOut, accMet54MuxOut;
   always @(inputMuxSelAcs or 
            accMet_45_0 or accMet_54_0 or
            accMet_45_1 or accMet_54_1 or 
            accMet_45_2 or accMet_54_2 or 
            accMet_45_3 or accMet_54_3)
     begin
        case(inputMuxSelAcs) 
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


   `ifdef SIMULATE
   real accMet_45_0_real, accMet_45_1_real, accMet_45_2_real, accMet_45_3_real, accMet_54_0_real, accMet_54_1_real, accMet_54_2_real, accMet_54_3_real;
   always @(accMet_45_0 or accMet_45_1 or accMet_45_2 or accMet_45_3 or accMet_54_0 or accMet_54_1 or accMet_54_2 or accMet_54_3) begin
      accMet_45_0_real <= $itor($signed(accMet_45_0))/(2**(ACS_BITS-6));
      accMet_45_1_real <= $itor($signed(accMet_45_1))/(2**(ACS_BITS-6));
      accMet_45_2_real <= $itor($signed(accMet_45_2))/(2**(ACS_BITS-6));
      accMet_45_3_real <= $itor($signed(accMet_45_3))/(2**(ACS_BITS-6));
      accMet_54_0_real <= $itor($signed(accMet_54_0))/(2**(ACS_BITS-6));
      accMet_54_1_real <= $itor($signed(accMet_54_1))/(2**(ACS_BITS-6));
      accMet_54_2_real <= $itor($signed(accMet_54_2))/(2**(ACS_BITS-6));
      accMet_54_3_real <= $itor($signed(accMet_54_3))/(2**(ACS_BITS-6));
   end
   `endif 



   
   // Selects the amount of rotation bases on the matlab signal theta(n-2), here called ROT_45/54_?. 
   reg [4:0] rotSel;
   always @(inputMuxSel or symEnEven or tilt)
     begin
        if (~symEnEven) begin
           case(inputMuxSel) 
             0: begin
                rotSel <= 32 - (tilt + (ROT_45_0<<1));
             end
             1: begin
                rotSel <= 32 - (tilt + (ROT_45_1<<1));
             end
             2: begin
                rotSel <= 32 - (tilt + (ROT_45_2<<1));
             end
             3: begin
                rotSel <= 32 - (tilt + (ROT_45_3<<1));
             end
           endcase // case(inputMuxSel)
        end
        else begin
           case(inputMuxSel) 
             0: begin
                rotSel <= 32 - (tilt + (ROT_54_0<<1));
             end
             1: begin
                rotSel <= 32 - (tilt + (ROT_54_1<<1));
             end
             2: begin
                rotSel <= 32 - (tilt + (ROT_54_2<<1));
             end
             3: begin
                rotSel <= 32 - (tilt + (ROT_54_3<<1));
             end
           endcase // case(inputMuxSel)
        end
     end
   
   reg [MF_BITS-1:0]     iMfInRot, qMfInRot;
   //reg [ACS_BITS-1:0]    accMetTmp;
   always @ (symEnEven or 
             mfI45MuxOut or mfI54MuxOut or
             mfQ45MuxOut or mfQ54MuxOut /*or 
             accMet45MuxOut or accMet54MuxOut*/) begin
      if (~symEnEven) begin
         iMfInRot <= mfI45MuxOut;
         qMfInRot <= mfQ45MuxOut;
         //accMetTmp <= accMet54MuxOut;
      end
      else begin
         iMfInRot <= mfI54MuxOut;
         qMfInRot <= mfQ54MuxOut;
         //accMetTmp <= accMet45MuxOut;
      end
   end


   reg [ACS_BITS-1:0]    accMetTmp;
   always @ (symEnEvenAdder or 
             accMet45MuxOut or accMet54MuxOut) begin
      if (symEnEvenAdder) begin
         accMetTmp <= accMet54MuxOut;
      end
      else begin
         accMetTmp <= accMet45MuxOut;
      end
   end

   
   `ifdef SIMULATE
   real iMfInRot_real, qMfInRot_real;
   always @(iMfInRot or qMfInRot) begin
      iMfInRot_real <= $itor($signed(iMfInRot))/(2**(MF_BITS-2));
      qMfInRot_real <= $itor($signed(qMfInRot))/(2**(MF_BITS-2));
   end

   real mfI_45_0_real, mfI_45_1_real, mfI_45_2_real, mfI_45_3_real, mfI_54_0_real, mfI_54_1_real, mfI_54_2_real, mfI_54_3_real;
   always @(mfI_45_0 or mfI_45_1 or mfI_45_2 or mfI_45_3 or mfI_54_0 or mfI_54_1 or mfI_54_2 or mfI_54_3) begin
      mfI_45_0_real <= $itor($signed(mfI_45_0))/(2**(MF_BITS-2));
      mfI_45_1_real <= $itor($signed(mfI_45_1))/(2**(MF_BITS-2));
      mfI_45_2_real <= $itor($signed(mfI_45_2))/(2**(MF_BITS-2));
      mfI_45_3_real <= $itor($signed(mfI_45_3))/(2**(MF_BITS-2));
      mfI_54_0_real <= $itor($signed(mfI_54_0))/(2**(MF_BITS-2));
      mfI_54_1_real <= $itor($signed(mfI_54_1))/(2**(MF_BITS-2));
      mfI_54_2_real <= $itor($signed(mfI_54_2))/(2**(MF_BITS-2));
      mfI_54_3_real <= $itor($signed(mfI_54_3))/(2**(MF_BITS-2));
   end
   `endif 

   
   
   wire [ROT_BITS-1:0] iOutRot, qOutRot;
   wire                symEnRot, sym2xEnRot;
   rot8x8 rotator
     (
      .clk        (clk        ), 
      .reset      (reset      ), 
      .symEn      (symEn      ), 
      .sym2xEn    (sym2xEn    ), 
      .i          (iMfInRot[MF_BITS-1:MF_BITS-ROT_BITS] ),    
      .q          (qMfInRot[MF_BITS-1:MF_BITS-ROT_BITS] ),
      .angle      (rotSel     ),
      .symEnOut   (symEnRot   ),   
      .sym2xEnOut (sym2xEnRot ),   
      .iOut       (iOutRot    ),   
      .qOut       (qOutRot    )
      );


   `ifdef SIMULATE
   real iOutRot_real, qOutRot_real;
   always @(iOutRot or qOutRot) begin
      iOutRot_real <= $itor($signed(iOutRot))/(2**(ROT_BITS-2));
      qOutRot_real <= $itor($signed(qOutRot))/(2**(ROT_BITS-2));
   end
   `endif
   


   wire [ACS_BITS-1:0]    accMetInAdder = accMetTmp;

   // ************** replace iInAdder with iOutRot in the file ******************
   wire [ROT_BITS-1:0]    iInAdder = iOutRot, 
                          qInAdder = qOutRot;

   
   // 2-comp adder: Adds a vector of width 8 and one of 12.
   wire [ACS_BITS-1:0]    sum;
   wire [ACS_BITS:0]      tmpSum;
   wire [ACS_BITS:0]      aExt = {iInAdder[ROT_BITS-1], iInAdder[ROT_BITS-1], iInAdder[ROT_BITS-1], iInAdder[ROT_BITS-1], iInAdder[ROT_BITS-1], iInAdder};
   wire [ACS_BITS:0]      bExt = {accMetInAdder[ACS_BITS-1], accMetInAdder};
   assign                 tmpSum = aExt + bExt;
   assign                 sum = tmpSum[ACS_BITS-1:0];    // slicing off the MSB (watchout for the sign bit) 

   
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


   wire [1:0] tecken = {sum[ACS_BITS-1], maxSum[ACS_BITS-1]};
   
   
   // finding the max Value
   reg [ACS_BITS-1:0]     maxSum;
   reg [ACS_BITS-1:0]     bestMetric;
   reg [1:0]              selOut;
   reg [1:0]              selOutTmp;
   reg [ROT_BITS-1:0]     iSurvivingRotMf;
   reg [ROT_BITS-1:0]     qSurvivingRotMf;
   reg [ROT_BITS-1:0]     iSurvivingRotMfTmp;
   reg [ROT_BITS-1:0]     qSurvivingRotMfTmp; 
   always @(posedge clk) begin
      if (reset) begin
         maxSum <= 0;
         bestMetric <= 0;
         selOut <= 0;
         selOutTmp <= 0;
         iSurvivingRotMf <= 0;
         qSurvivingRotMf <= 0;
         iSurvivingRotMfTmp <= 0;
         qSurvivingRotMfTmp <= 0;
      end
      else if (maxCnt==0) begin
         maxSum <= sum;
         selOutTmp <= maxCnt;
         iSurvivingRotMfTmp <= iInAdder;
         qSurvivingRotMfTmp <= qInAdder;
      end
      else if (~maxCnt[2]) begin // if maxCnt = 0,1,2, or 3
         case ({sum[ACS_BITS-1], maxSum[ACS_BITS-1]}) // Checking the sign bit 
           2'b00: begin // both pos
              if (sum>maxSum) begin
                 maxSum <= sum;
                 selOutTmp <= maxCnt;
                 iSurvivingRotMfTmp <= iInAdder;
                 qSurvivingRotMfTmp <= qInAdder;
              end
              if (maxCnt==3) begin
                 if (sum>maxSum) begin
                    bestMetric <= sum;
                    selOut <= maxCnt;
                    iSurvivingRotMf <= iInAdder;
                    qSurvivingRotMf <= qInAdder;
                 end
                 else begin
                    bestMetric <= maxSum;
                    selOut <= selOutTmp;
                    iSurvivingRotMf <= iSurvivingRotMfTmp;
                    qSurvivingRotMf <= qSurvivingRotMfTmp;
                 end
              end
           end
           2'b01:  begin // sum=pos, maxSum=neg
              maxSum <= sum;
              selOutTmp <= maxCnt;
              iSurvivingRotMfTmp <= iInAdder;
              qSurvivingRotMfTmp <= qInAdder;
              if (maxCnt==3) begin
                 bestMetric <= sum;
                 selOut <= maxCnt;
                 iSurvivingRotMf <= iInAdder;
                 qSurvivingRotMf <= qInAdder;
              end
           end
           2'b10: begin // sum=neg, maxSum=pos
              if (maxCnt==3) begin 
                 bestMetric <= maxSum;
                 selOut <= selOutTmp;
                 iSurvivingRotMf <= iSurvivingRotMfTmp;
                 qSurvivingRotMf <= qSurvivingRotMfTmp;
              end
           end
           2'b11: begin // both neg
              if (sum[ACS_BITS-2:0] > maxSum[ACS_BITS-2:0]) begin
                 maxSum <= sum;
                 selOutTmp <= maxCnt;
                 iSurvivingRotMfTmp <= iInAdder;
                 qSurvivingRotMfTmp <= qInAdder;
              end
              if (maxCnt==3) begin
                 if (sum[ACS_BITS-2:0]>maxSum[ACS_BITS-2:0]) begin
                    bestMetric <= sum;
                    selOut <= maxCnt;
                    iSurvivingRotMf <= iInAdder;
                    qSurvivingRotMf <= qInAdder;
                 end
                 else begin
                    bestMetric <= maxSum;
                    selOut <= selOutTmp;
                    iSurvivingRotMf <= iSurvivingRotMfTmp;
                    qSurvivingRotMf <= qSurvivingRotMfTmp;
                 end
              end
           end
         endcase
      end
   end

   
   wire [ROT_BITS-1:0] iOut = iSurvivingRotMf;
   wire [ROT_BITS-1:0] qOut = qSurvivingRotMf;
   
   
   // --------- Normailzation and forget factor -------------
//`define USE_DELAYED_NORM
`ifdef USE_DELAYED_NORM
`else
   reg normalizeOut;
   always @(bestMetric[ACS_BITS-1:ACS_BITS-2]) begin
      if ((bestMetric[ACS_BITS-1:ACS_BITS-2] == 2'b01) ) begin //check (in the pos. case) if the acc. 8th bit saturate
         normalizeOut <= 1;
      end
      else begin
         normalizeOut <= 0;
      end
   end
`endif
   
   // subtracting of a constant and saturate all neg numbers to zero to bring down the acc and prevent it from overflowing

   wire [ACS_BITS-1:0]  accTempSum = bestMetric - 512;
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
//      .ce(symEnRot), 
      .ce(symEnMax), 
      .clk(clk), 
      .sclr(reset),
      .a(normalizeIn ? accTemp : bestMetric), 
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
//   always @(posedge clk)
   always @(reset or accTemp or bestMetric or normalizeIn)
     if (reset) begin
        accMetOut <= 0;
     end
//     else if (symEnRot) begin
//     else if (symEnAdder) begin
//     else if (symEnMax) begin
     else if (normalizeIn) begin
        accMetOut <= accTemp;
     end
     else begin
        accMetOut <= bestMetric;
     end
`endif   


`ifdef SIMULATE
   real accMetOut_real, accMetInAdder_real, accMetTmp_real, sum_real, maxSum_real, bestMetric_real, iInAdder_real;
   real iSurvivingRotMf_real, qSurvivingRotMf_real;
   always @(accMetOut or accMetInAdder or accMetTmp or sum or maxSum or bestMetric or iInAdder or
            iSurvivingRotMf or qSurvivingRotMf) begin
      accMetOut_real       <= $itor($signed(accMetOut       ))/(2**(ROT_BITS-2));
      accMetTmp_real       <= $itor($signed(accMetTmp       ))/(2**(ACS_BITS-6));
      accMetInAdder_real   <= $itor($signed(accMetInAdder   ))/(2**(ACS_BITS-6));
      sum_real             <= $itor($signed(sum             ))/(2**(ACS_BITS-6));
      maxSum_real          <= $itor($signed(maxSum          ))/(2**(ACS_BITS-6));
      bestMetric_real      <= $itor($signed(bestMetric      ))/(2**(ACS_BITS-6));
      iInAdder_real        <= $itor($signed(iInAdder        ))/(2**(ROT_BITS-2));
      iSurvivingRotMf_real <= $itor($signed(iSurvivingRotMf ))/(2**(ROT_BITS-2));
      qSurvivingRotMf_real <= $itor($signed(qSurvivingRotMf ))/(2**(ROT_BITS-2));
   end

   always @(posedge clk)
     begin
        if(ENABLE_DEBUG_PRINTOUT) begin
           $display("\t%d\t%d\t%f\t%f\t%f\t%f\t%f\t%d",
                    symEnSr[1],
                    maxCnt,
                    iInAdder_real,
                    accMetInAdder_real,
                    sum_real,
                    maxSum_real,
                    bestMetric_real,
                    selOut
                    );
        end
     end

`endif
   
   
endmodule

   