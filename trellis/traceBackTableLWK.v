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
   parameter          TB_DEPTH=4;
   input              clk,reset,symEn;
   input [19:0]       sel;   // 20 induvidual decision. 0 or 1 tell us if we trace + or - 7 modulo 20 
   input [4:0]        index; // pointer to the state which has the maximum metric
   output             decision;
   output             symEnDly;
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

   reg  decisionTest;
   
   // state Machine counter
   reg      [3:0]   stateCnt;       // Traceback State
   reg      [3:0]   symEnCount;     // Number of symEn during tracing
   reg              tracing;
   wire     [3:0]   lastState = TB_DEPTH-1;
   wire             newTrace = (symEn && (stateCnt == lastState));
   always @(posedge clk) begin
        if (reset) begin
            stateCnt <= lastState;
            tracing <= 0;
            symEnCount <= 0;
        end
        else if (newTrace) begin
            stateCnt <= 0;
            symEnCount <= 0;
            tracing <= 1;
        end
        else if (stateCnt < lastState) begin
            stateCnt <= stateCnt + 1;
            if (symEn) begin
                symEnCount <= symEnCount + 1;
            end
        end
        else begin
            tracing <= 0;
        end
   end

   // Path Decisions. stateCnt moves us through the "TB_DEPTH" previous paths
   // This block runs at the clock rate. It takes TB_DEPTH-1 clocks to complete
   wire     [3:0] tbIndex = stateCnt + symEnCount;
   always @(posedge clk)
     begin
        if (reset) begin
           tbPtr <= 0;
        end
        // 8 deep else if (symEn && symEnEven) begin
        else if (newTrace) begin
           tbPtr <= index;  // loading in the starting max metric index at the trace back update rate
        end
        else begin    
           case (tbPtr)
             0 : begin // We are in the "0-th" trellis state
                if (tbtSr0[tbIndex]==0) 
                  tbPtr <= 7; // sel=0 makes us jump +7 modulo 20.  
                else 
                  tbPtr <= 13;  // sel=1,   jump -7 modulo 20
                end
             1 : if (tbtSr1[tbIndex]==0) tbPtr <= 8 ;  else tbPtr <= 14;
             2 : if (tbtSr2[tbIndex]==0) tbPtr <= 9 ;  else tbPtr <= 15;
             3:  if (tbtSr3[tbIndex]==0) tbPtr <= 10;  else tbPtr <= 16;
             4:  if (tbtSr4[tbIndex]==0) tbPtr <= 11;  else tbPtr <= 17;
             5:  if (tbtSr5[tbIndex]==0) tbPtr <= 12;  else tbPtr <= 18;
             6:  if (tbtSr6[tbIndex]==0) tbPtr <= 13;  else tbPtr <= 19;
             7:  if (tbtSr7[tbIndex]==0) tbPtr <= 14;  else tbPtr <= 0 ;
             8:  if (tbtSr8[tbIndex]==0) tbPtr <= 15;  else tbPtr <= 1 ;
             9:  if (tbtSr9[tbIndex]==0) tbPtr <= 16;  else tbPtr <= 2 ;
             10: if (tbtSr10[tbIndex]==0) tbPtr <= 17;  else tbPtr <= 3 ;
             11: if (tbtSr11[tbIndex]==0) tbPtr <= 18;  else tbPtr <= 4 ;
             12: if (tbtSr12[tbIndex]==0) tbPtr <= 19;  else tbPtr <= 5 ;
             13: if (tbtSr13[tbIndex]==0) tbPtr <= 0 ;  else tbPtr <= 6 ;
             14: if (tbtSr14[tbIndex]==0) tbPtr <= 1 ;  else tbPtr <= 7 ;
             15: if (tbtSr15[tbIndex]==0) tbPtr <= 2 ;  else tbPtr <= 8 ;
             16: if (tbtSr16[tbIndex]==0) tbPtr <= 3 ;  else tbPtr <= 9 ;
             17: if (tbtSr17[tbIndex]==0) tbPtr <= 4 ;  else tbPtr <= 10;
             18: if (tbtSr18[tbIndex]==0) tbPtr <= 5 ;  else tbPtr <= 11;
             19: if (tbtSr19[tbIndex]==0) tbPtr <= 6 ;  else tbPtr <= 12;
           endcase
        end
     end

    // Decision outputs
    reg     tbDecision;
    wire    [3:0]   decisionIndex = tbIndex;
    //wire    [3:0]   decisionIndex = tbIndex + (newTrace ? 0 : symEn);
    wire    [3:0]   symEnOutputs = symEnCount + symEn;
    wire    symEnOut = ((stateCnt >= (lastState-symEnOutputs)) && tracing);
    always @(posedge clk) begin
        if (symEnOut) begin
           case (tbPtr)
             0:  begin tbDecision <=  tbtSr0[decisionIndex]; end
             1:  begin tbDecision <=  tbtSr1[decisionIndex]; end
             2:  begin tbDecision <=  tbtSr2[decisionIndex]; end
             3:  begin tbDecision <=  tbtSr3[decisionIndex]; end
             4:  begin tbDecision <=  tbtSr4[decisionIndex]; end
             5:  begin tbDecision <=  tbtSr5[decisionIndex]; end
             6:  begin tbDecision <=  tbtSr6[decisionIndex]; end
             7:  begin tbDecision <=  tbtSr7[decisionIndex]; end
             8:  begin tbDecision <=  tbtSr8[decisionIndex]; end
             9:  begin tbDecision <=  tbtSr9[decisionIndex]; end
             10: begin tbDecision <= tbtSr10[decisionIndex]; end
             11: begin tbDecision <= tbtSr11[decisionIndex]; end
             12: begin tbDecision <= tbtSr12[decisionIndex]; end
             13: begin tbDecision <= tbtSr13[decisionIndex]; end
             14: begin tbDecision <= tbtSr14[decisionIndex]; end
             15: begin tbDecision <= tbtSr15[decisionIndex]; end
             16: begin tbDecision <= tbtSr16[decisionIndex]; end
             17: begin tbDecision <= tbtSr17[decisionIndex]; end
             18: begin tbDecision <= tbtSr18[decisionIndex]; end
             19: begin tbDecision <= tbtSr19[decisionIndex]; end
           endcase
        end
    end

    reg     [2:0]   enCount;
    reg     [3:0]   numOfEnables;
    reg             symEnDly;
    wire            newTraceOutputs = symEnOut && (stateCnt == lastState);
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
