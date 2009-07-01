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
   decision,
   symEnDly
   );
   
   parameter          size = 8;
   input              clk,reset,symEn;
   input              symEnEven;
   input [3:0]        sel;   // 4 induvidual decision.
   input [1:0]        index; // pointer to the state which has the maximum metric
   output             decision;
   output             symEnDly;
   wire               decision;

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
   reg [3:0] sel_2dly;
   reg [3:0] sel_3dly;
   always @(posedge clk)
     begin
        if (reset) begin
           sel_1dly <= 0;
           sel_2dly <= 0;
           sel_3dly <= 0;
        end
        else begin
           if (symEn) begin  
              sel_1dly <= sel;
              sel_2dly <= sel_1dly;
              sel_3dly <= sel_2dly;
           end
        end 
     end

	 
   assign decision = sel_1dly[nState];
	 
  // +++++++ symEn final output +++++++++
  //assign symEnDly = symEnSr2[2];



endmodule
