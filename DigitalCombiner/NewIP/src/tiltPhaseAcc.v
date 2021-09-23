`timescale 1ns/1ps
  
module tilt
  (
   clk, reset, symEn,
   tilt,
   symEnEven
   );
   

   input                 clk, reset, symEn;
   output [4:0]          tilt;
   input                 symEnEven;
   

   tiltPhaseAcc tiltPhaseAcc
     (
      .clk       (clk      ), 
      .reset     (reset    ), 
      .symEn     (symEn    ),
      .symEnEven (symEnEven),
      .tilt      (tilt     )
      );

   endmodule

//-----------------------------------------------------------------------------
// Project      SEMCO Multi-mode Demodulator
// Design       multi-h Tilt phase accumulator
// Created      15 october 09
//-----------------------------------------------------------------------------
//
// 1.0      AMJ initial coding
//
// Tested against billy's spread sheet  
//-----------------------------------------------------------------------------

`timescale 1ns/1ps
  
module tiltPhaseAcc
  (
   clk, reset, symEn,
   symEnEven,
   tilt
   );

   input                 clk, reset, symEn;
   input                 symEnEven;
   output [4:0]          tilt;

   reg [4:0]             acc, tilt;
   
   always @(tilt or symEnEven or reset)
     if (reset) begin
        acc <= 0;
     end
     else if (~symEnEven) begin
        acc <= tilt - 5'b01100; // this has to be (tilt-12)%32 
     end
     else begin
        acc <= tilt - 5'b01111; // this has to be (tilt-15)%32
     end
   
   
   always @(posedge clk)
     if (reset) begin
        //tilt <= 0;
        tilt <= 17;
        //tilt <= 5;
        //tilt <= 22;
     end
     else if (symEn) begin
        tilt <= acc;
     end

endmodule // tiltPhaseAcc