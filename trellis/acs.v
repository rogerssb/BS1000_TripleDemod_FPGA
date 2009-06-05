`timescale 1ns/1ps


// two's complement adder
// This added adds 2, two's comp. numbers of different number of bits
// the "b" side of the added is 4 bits wider than the a side, so the result it then: sizeof(a) + 4bits + 1carry out 
module adder2s (a, b, sum);
   parameter             size = 8;
   input [size-1:0]      a;
   input [(size-1)+4:0]  b;
   output [size-1+4:0]   sum;
   
   wire [(size-1)+4:0]   sum;
   wire [size+4:0]       tmpSum;
   wire [size+4:0]       aExt = {a[size-1],a[size-1],a[size-1],a[size-1],a[size-1], a};
   wire [size+4:0]       bExt = {b[(size-1)+4], b};

   assign tmpSum = aExt + bExt;
   assign sum = tmpSum[size+4-1:0];    // slicing off the MSB (watchout for the sign bit) 
   
endmodule
            

module comp (a, b, bLarger);
   parameter                 size = 8;
   input [(size-1)+4: 0]     a, b;
   output                    bLarger;
   reg                       bLarger;
   
   always @(a or b) 
     begin
        case ({a[(size-1)+4], b[(size-1)+4]}) // Checking the sign bit 
          2'b00: begin // both pos
             bLarger <= (b > a) ? 1 : 0;
          end
          2'b01: begin // a=pos, b=neg
             bLarger <= 0;
          end
          2'b10: begin // a=neg, b=pos
             bLarger <= 1;
          end
          2'b11: begin //both neg
             bLarger <= (b > a) ? 1 : 0;
          end
        endcase
     end
endmodule                                                    

   
module mux_2_1 (a, b, sel, y);
   parameter               size = 8;
   input [(size-1)+4:0]    a, b;
   input                   sel;
   output [(size-1)+4:0]   y;
   reg [(size-1)+4:0]      y;
   
   always @ (sel or a or b) begin
     if (sel == 0) begin
       y <= a;
     end
     else begin
       y <= b;
     end
   end

endmodule         
            

module acs (clk, reset, symEn, sym2xEn, matFilt1, matFilt2, accMet1, accMet2, accMetOut, selOut, shiftIn, shiftOut, symEnDly, sym2xEnDly);
   parameter             size = 8;
   input                 clk, reset;
   input                 symEn;
   input                 sym2xEn;
   input [size-1:0]      matFilt1, matFilt2;
   input [(size-1)+4:0]  accMet1, accMet2;
   output [(size-1)+4:0] accMetOut;
   output                selOut;
   input                 shiftIn;
   output                shiftOut;
   output                symEnDly;
   output                sym2xEnDly;
         
   reg  [(size-1)+4:0]   accMetOut;
   reg  [(size-1)+4:0]   accTemp;
   
   wire [(size-1)+4:0]   add1, add2;
   wire [(size-1)+4:0]   muxOut;
   wire                  bLarger;
   reg                   selOut;
         
   // First we add the accumulatior metric with the matchfilter output
   adder2s #(size) adder2s_1
     (
      .a          (matFilt1),
      .b          (accMet1 ),
      .sum        (add1    )
      );   
   
   adder2s #(size) adder2s_2
     (
      .a          (matFilt2),
      .b          (accMet2 ),
      .sum        (add2    )
      );   

   // Compare
   comp #(size) comparator
     (
      .a          (add1   ), 
      .b          (add2   ), 
      .bLarger    (bLarger)
      );

   // Select
   mux_2_1 #(size) selector
     (
      .a         (add1       ),
      .b         (add2       ), 
      .sel       (bLarger    ), 
      .y         (muxOut     )
      );

   reg shiftOut;
   always @(muxOut[(size-1)+4:(size-1)+3]) begin
         //if ( accMetOut[(size-1)+4:(size-1)+1] == 4'b0001 ) begin //check (in the pos. case) if the acc. 8th bit saturate
         if ((muxOut[(size-1)+4:(size-1)+3] == 2'b01) ) begin //check (in the pos. case) if the acc. 8th bit saturate
            shiftOut <= 1;
         end
         else begin
            shiftOut <= 0;
         end
      end
   
   // subtracting of a constant and saturate all neg numbers to zero to bring down the acc and prevent it from overflowing

   always @(muxOut or shiftIn) begin
	accTemp <= muxOut - 512;
	if (accTemp[(size-1)+4]) begin // check to see if the msb is 1 (i.e. neg), then set the acc to zero
	   accTemp <= 0;
	end
   end


   always @(posedge clk)
      if (reset) begin
         accMetOut <= 0;
      end
      else if (symEn) begin
	   if (shiftIn) begin
		accMetOut <= accTemp;
	   end
	   else begin
		accMetOut <= muxOut;
         end
	end
   

/* -----\/----- EXCLUDED -----\/-----
   always @(posedge clk)
      if (reset) begin
         accMetOut <= 0;
      end
      else if (symEn) begin
         if (shiftIn) begin
            accMetOut <= 0;
            //accMetOut <= accMetOut - 64;
            //accMetOut <= {1'b0, muxOut[(size-1)+4:1]};
         end
         else begin
            accMetOut <= muxOut;
         end
      end
 -----/\----- EXCLUDED -----/\----- */

   always @(posedge clk)
      if (reset) begin
         selOut <= 0;
      end
      else if (symEn) begin
         selOut <= ~bLarger;
      end
   
   assign symEnDly = symEn;
   assign sym2xEnDly = sym2xEn;

/* -----\/----- EXCLUDED -----\/-----
   reg [3:0] symEnSr;
   reg [3:0] sym2xEnSr;
   always @(posedge clk) begin
      if (reset) begin
         symEnSr <= 0;
         sym2xEnSr <= 0;
      end
      else begin
         symEnSr <= {symEnSr[2:0], symEn};
         sym2xEnSr <= {sym2xEnSr[2:0], sym2xEn};
      end
   end
   
   assign symEnDly = symEnSr[3];
   assign sym2xEnDly = sym2xEnSr[3];
 -----/\----- EXCLUDED -----/\----- */
   
endmodule