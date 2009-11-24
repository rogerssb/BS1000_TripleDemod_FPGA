//-----------------------------------------------------------------------------
// Project      SEMCO Multi-mode Demodulator
// Design       multi-h phase rotator
// Created      06 october 09
//-----------------------------------------------------------------------------
//
// 1.0      AMJ initial coding
//
// tested on all 32 input combinations and all 32 rotation
// oct-15-09: Rewrote ro run at the 100MHz clock rate
// oct-17-09: Parameterize the vector width
//-----------------------------------------------------------------------------

`timescale 1ns/1ps
  
module rotator
  (
   clk, reset, symEn, sym2xEn,
   i,
   q,
   sel,
   symEnOut,
   sym2xEnOut,
   iOut,    
   qOut     
   );
   
   parameter             ROT_BITS=10;
   input                 clk, reset, symEn, sym2xEn;
   input [ROT_BITS-1:0]  i, q;
   input [4:0]           sel;
   output                symEnOut;
   output                sym2xEnOut;
   output [ROT_BITS-1:0] iOut, qOut;
   reg [ROT_BITS-1:0]    iOut, qOut;
   wire [ROT_BITS-1:0]   iRot, qRot;
   
   reg [ROT_BITS-1:0]    iLimit, qLimit;
   always @(i or q) begin
      if (i == 10'h200) begin
         iLimit <= 10'h201;
      end
      else begin
         iLimit <= i;
      end
      if (q == 10'h200) begin
         qLimit <= 10'h201;
      end
      else begin
         qLimit <= q;
      end
   end	   
      
   
   reg [ROT_BITS-1:0]           iIn, qIn;
   reg [2:0]            angle;
   always @(posedge clk) begin
      case (sel)
        // First quadrant
        0,1,2,3: begin
           iIn <= iLimit;
           qIn <= qLimit;
           angle <= sel[2:0];
        end
        4,5,6,7: begin
           iIn <= qLimit;
           qIn <= iLimit;
           angle <= ~sel[2:0]+1;
        end
        // Second quadrant
        8,9,10,11: begin
           iIn <= -qLimit;
           qIn <= iLimit;
           angle <= sel[2:0];
        end
        12,13,14,15: begin
           iIn <= -iLimit;
           qIn <= qLimit;
           angle <= ~sel[2:0]+1;
        end
        // Third quadrant
        16,17,18,19: begin
           iIn <= -iLimit;
           qIn <= -qLimit;
           angle <= sel[2:0];
        end
        20,21,22,23: begin
           iIn <= -qLimit;
           qIn <= -iLimit;
           angle <= ~sel[2:0]+1;
        end
        // Fourth quadrant
        24,25,26,27: begin
           iIn <= qLimit;
           qIn <= -iLimit;
           angle <= sel[2:0];
        end
        28,29,30,31: begin
           iIn <= iLimit;
           qIn <= -qLimit;
           angle <= ~sel[2:0]+1;
        end
      endcase // case(sel)
   end
   
   wire [4:0] selRot;
   rot rot
     ( 
       .clk        (clk), 
       .reset      (reset), 
       .symEn      (symEn), 
       .sym2xEn    (sym2xEn), 
       .i          (iIn), 
       .q          (qIn), 
       .sel        (sel),
       .angle      (angle),
       .symEnOut   (symEnOut),
       .sym2xEnOut (sym2xEnOut),
       .selOut     (selRot),
       .iOut       (iRot), 
       .qOut       (qRot) 
       );

   
   always @(posedge clk)
     if (reset) begin
        iOut <= 0;
        qOut <= 0;
     end
     else begin
        case (selRot)
          0,1,2,3, 8,9,10,11, 16,17,18,19, 24,25,26,27 : begin
             iOut <= iRot;
             qOut <= qRot;
          end
          4,5,6,7, 20,21,22,23 : begin
             iOut <= -iRot;
             qOut <= qRot;
          end
          12,13,14,15, 28,29,30,31: begin
             iOut <= iRot;
             qOut <= -qRot;
          end
        endcase
     end

   

`ifdef SIMULATE
   real iOut_real, qOut_real;
   always @(iOut or qOut) begin
       iOut_real <= $itor($signed(iOut))/(2**(ROT_BITS-1));
       qOut_real <= $itor($signed(qOut))/(2**(ROT_BITS-1));
   end
   
   always @(posedge clk) begin
	   if (sym2xEnOut) begin
         $display("%d\t%f\t%f",
                  sel,
                  iOut_real,
                  qOut_real);
	   end
   end


/* -----\/----- EXCLUDED -----\/-----
   real iRot00_real,
       qRot00_real,
       iRot01_real,
       qRot01_real,
       iRot10_real,
       qRot10_real,
       iRot11_real,
       qRot11_real,
       iRot20_real,
       qRot20_real,
       iRot21_real,
       qRot21_real,
       iRot30_real,
       qRot30_real,
       iRot31_real,
       qRot31_real;



   always @(iRot00 or qRot00 or iRot01 or qRot01 or iRot10 or qRot10 or iRot11 or qRot11 or 
            iRot20 or qRot20 or iRot21 or qRot21 or iRot30 or qRot30 or iRot31 or qRot31    ) begin
       iRot00_real <= $itor($signed(iRot00))/(ROT_BITS-1);
       qRot00_real <= $itor($signed(qRot00))/(ROT_BITS-1);
       iRot01_real <= $itor($signed(iRot01))/(ROT_BITS-1);
       qRot01_real <= $itor($signed(qRot01))/(ROT_BITS-1);
       iRot10_real <= $itor($signed(iRot10))/(ROT_BITS-1);
       qRot10_real <= $itor($signed(qRot10))/(ROT_BITS-1);
       iRot11_real <= $itor($signed(iRot11))/(ROT_BITS-1);
       qRot11_real <= $itor($signed(qRot11))/(ROT_BITS-1);
       iRot20_real <= $itor($signed(iRot20))/(ROT_BITS-1);
       qRot20_real <= $itor($signed(qRot20))/(ROT_BITS-1);
       iRot21_real <= $itor($signed(iRot21))/(ROT_BITS-1);
       qRot21_real <= $itor($signed(qRot21))/(ROT_BITS-1);
       iRot30_real <= $itor($signed(iRot30))/(ROT_BITS-1);
       qRot30_real <= $itor($signed(qRot30))/(ROT_BITS-1);
       iRot31_real <= $itor($signed(iRot31))/(ROT_BITS-1);
       qRot31_real <= $itor($signed(qRot31))/(ROT_BITS-1);
   end
   
   always @(posedge clk) begin
      if (symEn) begin
         $display("%f\t%f\t%f\t%f\t%f\t%f\t%f\t%f\t%f\t%f\t%f\t%f\t%f\t%f\t%f\t%f",
                  iRot00_real,
                  qRot00_real,
                  iRot01_real,
                  qRot01_real,
                  iRot10_real,
                  qRot10_real,
                  iRot11_real,
                  qRot11_real,
                  iRot20_real,
                  qRot20_real,
                  iRot21_real,
                  qRot21_real,
                  iRot30_real,
                  qRot30_real,
                  iRot31_real,
                  qRot31_real);
      end
   end
 -----/\----- EXCLUDED -----/\----- */
`endif
   
endmodule