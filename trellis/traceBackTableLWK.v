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
   parameter          TB_DEPTH=3;
   parameter          SR_DEPTH=TB_DEPTH+1;
   parameter          SR_BITS=4;

   input              clk,reset,symEn;
   input [19:0]       sel;   // 20 induvidual decision. 0 or 1 tell us if we trace + or - 7 modulo 20
   input [4:0]        index; // pointer to the state which has the maximum metric
   output             decision;
   output             symEnDly;
   reg [SR_DEPTH:0]   tbtSr0;
   reg [SR_DEPTH:0]   tbtSr1;
   reg [SR_DEPTH:0]   tbtSr2;
   reg [SR_DEPTH:0]   tbtSr3;
   reg [SR_DEPTH:0]   tbtSr4;
   reg [SR_DEPTH:0]   tbtSr5;
   reg [SR_DEPTH:0]   tbtSr6;
   reg [SR_DEPTH:0]   tbtSr7;
   reg [SR_DEPTH:0]   tbtSr8;
   reg [SR_DEPTH:0]   tbtSr9;
   reg [SR_DEPTH:0]   tbtSr10;
   reg [SR_DEPTH:0]   tbtSr11;
   reg [SR_DEPTH:0]   tbtSr12;
   reg [SR_DEPTH:0]   tbtSr13;
   reg [SR_DEPTH:0]   tbtSr14;
   reg [SR_DEPTH:0]   tbtSr15;
   reg [SR_DEPTH:0]   tbtSr16;
   reg [SR_DEPTH:0]   tbtSr17;
   reg [SR_DEPTH:0]   tbtSr18;
   reg [SR_DEPTH:0]   tbtSr19;
   reg [4:0]          tbState;


   // 3bits x 20 states trace-back shift-register
   // This block is running at the symEn rate.
   // The input "sel" is stable for the whole symbol
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
           if (symEn) begin
              tbtSr0  <= {tbtSr0 [SR_DEPTH-1:0], sel[0 ]};
              tbtSr1  <= {tbtSr1 [SR_DEPTH-1:0], sel[1 ]};
              tbtSr2  <= {tbtSr2 [SR_DEPTH-1:0], sel[2 ]};
              tbtSr3  <= {tbtSr3 [SR_DEPTH-1:0], sel[3 ]};
              tbtSr4  <= {tbtSr4 [SR_DEPTH-1:0], sel[4 ]};
              tbtSr5  <= {tbtSr5 [SR_DEPTH-1:0], sel[5 ]};
              tbtSr6  <= {tbtSr6 [SR_DEPTH-1:0], sel[6 ]};
              tbtSr7  <= {tbtSr7 [SR_DEPTH-1:0], sel[7 ]};
              tbtSr8  <= {tbtSr8 [SR_DEPTH-1:0], sel[8 ]};
              tbtSr9  <= {tbtSr9 [SR_DEPTH-1:0], sel[9 ]};
              tbtSr10 <= {tbtSr10[SR_DEPTH-1:0], sel[10]};
              tbtSr11 <= {tbtSr11[SR_DEPTH-1:0], sel[11]};
              tbtSr12 <= {tbtSr12[SR_DEPTH-1:0], sel[12]};
              tbtSr13 <= {tbtSr13[SR_DEPTH-1:0], sel[13]};
              tbtSr14 <= {tbtSr14[SR_DEPTH-1:0], sel[14]};
              tbtSr15 <= {tbtSr15[SR_DEPTH-1:0], sel[15]};
              tbtSr16 <= {tbtSr16[SR_DEPTH-1:0], sel[16]};
              tbtSr17 <= {tbtSr17[SR_DEPTH-1:0], sel[17]};
              tbtSr18 <= {tbtSr18[SR_DEPTH-1:0], sel[18]};
              tbtSr19 <= {tbtSr19[SR_DEPTH-1:0], sel[19]};
           end
        end
     end


   // state Machine counter
   reg      [SR_BITS-1:0]   stageCnt;       // Traceback Stage Counter
   reg      [SR_BITS-1:0]   symEnCount;     // Number of symEn during tracing
   reg                                   tracing;
   wire     [SR_BITS-1:0]   lastStage = TB_DEPTH;
   wire             newTrace = (symEn && (stageCnt == lastStage));
   always @(posedge clk) begin
        if (reset) begin
            stageCnt <= lastStage;
            tracing <= 0;
            symEnCount <= 0;
        end
        else if (newTrace) begin
            stageCnt <= 1;
            symEnCount <= 0;
            tracing <= 1;
        end
        else if (stageCnt < lastStage) begin
            stageCnt <= stageCnt + 1;
            if (symEn) begin
                symEnCount <= symEnCount + 1;
            end
        end
        else begin
            tracing <= 0;
        end
   end

   // Path Decisions. stageCnt moves us through the "TB_DEPTH" previous paths
   // This block runs at the clock rate. It takes TB_DEPTH-1 clocks to complete
    wire     [SR_BITS-1:0] tbIndex = stageCnt + symEnCount;
         wire   tbt0 = tbtSr0[tbIndex];
         wire   tbt1 = tbtSr1[tbIndex];
         wire   tbt2 = tbtSr2[tbIndex];
         wire   tbt3 = tbtSr3[tbIndex];
         wire   tbt4 = tbtSr4[tbIndex];
         wire   tbt5 = tbtSr5[tbIndex];
         wire   tbt6 = tbtSr6[tbIndex];
         wire   tbt7 = tbtSr7[tbIndex];
         wire   tbt8 = tbtSr8[tbIndex];
         wire   tbt9 = tbtSr9[tbIndex];
         wire   tbt10 = tbtSr10[tbIndex];
         wire   tbt11 = tbtSr11[tbIndex];
         wire   tbt12 = tbtSr12[tbIndex];
         wire   tbt13 = tbtSr13[tbIndex];
         wire   tbt14 = tbtSr14[tbIndex];
         wire   tbt15 = tbtSr15[tbIndex];
         wire   tbt16 = tbtSr16[tbIndex];
         wire   tbt17 = tbtSr17[tbIndex];
         wire   tbt18 = tbtSr18[tbIndex];
         wire   tbt19 = tbtSr19[tbIndex];
   always @(posedge clk)
     begin
        if (reset) begin
           tbState <= 0;
        end
        // 8 deep else if (symEn && symEnEven) begin
        else if (newTrace) begin
           `define USE_FIRST_STATE
           `ifdef USE_FIRST_STATE
           case (index)
             0 : begin // We are in the "0-th" trellis state
                if (sel[0]==0)
                  tbState <= 7; // sel=0 makes us jump +7 modulo 20.
                else
                  tbState <= 13;  // sel=1,   jump -7 modulo 20
                end
             1 : if (sel[1 ]==0) tbState <= 8 ;  else tbState <= 14;
             2 : if (sel[2 ]==0) tbState <= 9 ;  else tbState <= 15;
             3:  if (sel[3 ]==0) tbState <= 10;  else tbState <= 16;
             4:  if (sel[4 ]==0) tbState <= 11;  else tbState <= 17;
             5:  if (sel[5 ]==0) tbState <= 12;  else tbState <= 18;
             6:  if (sel[6 ]==0) tbState <= 13;  else tbState <= 19;
             7:  if (sel[7 ]==0) tbState <= 14;  else tbState <= 0 ;
             8:  if (sel[8 ]==0) tbState <= 15;  else tbState <= 1 ;
             9:  if (sel[9 ]==0) tbState <= 16;  else tbState <= 2 ;
             10: if (sel[10]==0) tbState <= 17;  else tbState <= 3 ;
             11: if (sel[11]==0) tbState <= 18;  else tbState <= 4 ;
             12: if (sel[12]==0) tbState <= 19;  else tbState <= 5 ;
             13: if (sel[13]==0) tbState <= 0 ;  else tbState <= 6 ;
             14: if (sel[14]==0) tbState <= 1 ;  else tbState <= 7 ;
             15: if (sel[15]==0) tbState <= 2 ;  else tbState <= 8 ;
             16: if (sel[16]==0) tbState <= 3 ;  else tbState <= 9 ;
             17: if (sel[17]==0) tbState <= 4 ;  else tbState <= 10;
             18: if (sel[18]==0) tbState <= 5 ;  else tbState <= 11;
             19: if (sel[19]==0) tbState <= 6 ;  else tbState <= 12;
             default: tbState <= 0;
           endcase
           `else
           tbState <= index;  // loading in the starting max metric index at the trace back update rate
           `endif
        end
        else begin
           case (tbState)
             0 : begin // We are in the "0-th" trellis state
                if (tbt0==0)
                  tbState <= 7; // sel=0 makes us jump +7 modulo 20.
                else
                  tbState <= 13;  // sel=1,   jump -7 modulo 20
                end
             1 : if (tbt1==0) tbState <= 8 ;  else tbState <= 14;
             2 : if (tbt2==0) tbState <= 9 ;  else tbState <= 15;
             3:  if (tbt3==0) tbState <= 10;  else tbState <= 16;
             4:  if (tbt4==0) tbState <= 11;  else tbState <= 17;
             5:  if (tbt5==0) tbState <= 12;  else tbState <= 18;
             6:  if (tbt6==0) tbState <= 13;  else tbState <= 19;
             7:  if (tbt7==0) tbState <= 14;  else tbState <= 0 ;
             8:  if (tbt8==0) tbState <= 15;  else tbState <= 1 ;
             9:  if (tbt9==0) tbState <= 16;  else tbState <= 2 ;
             10: if (tbt10==0) tbState <= 17;  else tbState <= 3 ;
             11: if (tbt11==0) tbState <= 18;  else tbState <= 4 ;
             12: if (tbt12==0) tbState <= 19;  else tbState <= 5 ;
             13: if (tbt13==0) tbState <= 0 ;  else tbState <= 6 ;
             14: if (tbt14==0) tbState <= 1 ;  else tbState <= 7 ;
             15: if (tbt15==0) tbState <= 2 ;  else tbState <= 8 ;
             16: if (tbt16==0) tbState <= 3 ;  else tbState <= 9 ;
             17: if (tbt17==0) tbState <= 4 ;  else tbState <= 10;
             18: if (tbt18==0) tbState <= 5 ;  else tbState <= 11;
             19: if (tbt19==0) tbState <= 6 ;  else tbState <= 12;
             default: tbState <= 0;
           endcase
        end
     end

    // Decision outputs
    reg     tbDecision;
    //wire    [3:0]   decisionIndex = tbIndex + (newTrace ? 0 : symEn);
    wire    [SR_BITS-1:0]   symEnOutputs = symEnCount + symEn;
    wire    symEnOut = ((stageCnt >= (lastStage-symEnOutputs)) && tracing);

    //always @(posedge clk) begin
    always @(tbState or
             tbt0  or tbt1  or tbt2  or tbt3  or tbt4  or
             tbt5  or tbt6  or tbt7  or tbt8  or tbt9  or
             tbt10 or tbt11 or tbt12 or tbt13 or tbt14 or
             tbt15 or tbt16 or tbt17 or tbt18 or tbt19
             ) begin
        case (tbState)
                0:  begin tbDecision <=  tbt0; end
                1:  begin tbDecision <=  tbt1; end
                2:  begin tbDecision <=  tbt2; end
                3:  begin tbDecision <=  tbt3; end
                4:  begin tbDecision <=  tbt4; end
                5:  begin tbDecision <=  tbt5; end
                6:  begin tbDecision <=  tbt6; end
                7:  begin tbDecision <=  tbt7; end
                8:  begin tbDecision <=  tbt8; end
                9:  begin tbDecision <=  tbt9; end
                10: begin tbDecision <= tbt10; end
                11: begin tbDecision <= tbt11; end
                12: begin tbDecision <= tbt12; end
                13: begin tbDecision <= tbt13; end
                14: begin tbDecision <= tbt14; end
                15: begin tbDecision <= tbt15; end
                16: begin tbDecision <= tbt16; end
                17: begin tbDecision <= tbt17; end
                18: begin tbDecision <= tbt18; end
                19: begin tbDecision <= tbt19; end
                default: begin tbDecision <= 1'b0; end
        endcase
    end

    reg     [2:0]   enCount;
    reg     [SR_BITS-1:0]   numOfEnables;
    reg             symEnDly;
    wire            newTraceOutputs = symEnOut && (stageCnt == lastStage);
    always @(posedge clk) begin
        if (newTraceOutputs) begin
            symEnDly <= 1;
            enCount <= 3;
            numOfEnables <= symEnCount;
        end
        else if (numOfEnables > 0) begin
            if (enCount == 0) begin
                symEnDly <= 1;
                numOfEnables <= numOfEnables - 1;
                enCount <= 3;
            end
            else begin
                enCount <= enCount - 1;
                symEnDly <= 0;
            end
        end
        else begin
            symEnDly <= 0;
        end
    end

    bitLifo bitLifo(
        .clk(clk),
        .reset(reset),
        .enIn(symEnOut),
        .din(tbDecision),
        .enOut(symEnDly),
        .dout(decision)
        );


endmodule
