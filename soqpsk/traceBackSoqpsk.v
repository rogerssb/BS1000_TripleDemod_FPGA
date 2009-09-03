//-----------------------------------------------------------------------------
// Project      SEMCO Multi-mode Demodulator
// Design       Trace Back for SOQPSK
// Created      29 June 09
//-----------------------------------------------------------------------------
// 1.0      AMJ initial coding
//
//
//-----------------------------------------------------------------------------

`timescale 1ns/1ps

module traceBackSoqpsk
  (
   clk, 
   reset, 
   symEn,
   symEnEven,
   sel, index,
   decision
   );
   
   parameter          size = 8;
   input              clk,reset,symEn;
   input              symEnEven;
   input [3:0]        sel;   // 4 induvidual decision.
   input [1:0]        index; // pointer to the state which has the maximum metric
   output             decision;
   reg                decision;

   wire               dec = sel[index];

   wire [1:0]         cState = index;
   reg [1:0]          nState;
          
   always @(dec or symEnEven or cState )
     begin
        if (dec) begin // if one decision
           if (!symEnEven) begin
              case (cState) 
                0: begin nState <= 1; end 
                1: begin nState <= 0; end 
                2: begin nState <= 3; end 
                3: begin nState <= 2; end
              endcase // case(cState)
           end
           else begin
              case (cState) 
                0: begin nState <= 2; end 
                1: begin nState <= 3; end 
                2: begin nState <= 0; end 
                3: begin nState <= 1; end
              endcase // case(cState)
           end
        end
        else begin // if zero decision
           nState <= cState;
        end
     end
   
   reg [3:0] sel_1dly;
   always @(posedge clk)
     begin
        if (reset) begin
           sel_1dly <= 0;
           decision <= 1'b0;
        end
        else begin
           if (symEn) begin  
              sel_1dly <= sel;
              decision <= decisionTmp;
           end
        end 
     end
         

   reg decisionTmp;
   always @(symEnEven or nState )
     begin
        if (symEnEven) begin // Odd state
           if (nState==2'b01  || nState==2'b10) begin
              decisionTmp <= !sel_1dly[nState]; //invert the decision
           end
           else begin
              decisionTmp <= sel_1dly[nState];
           end
        end
        else begin            // Even state
           if (nState==2'b00 || nState==2'b11) begin
              decisionTmp <= !sel_1dly[nState]; //invert the decision
           end
           else begin
              decisionTmp <= sel_1dly[nState];
           end
        end
     end

         
endmodule
