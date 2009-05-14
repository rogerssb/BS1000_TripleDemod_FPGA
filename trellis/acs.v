`timescale 1ns/1ps


// two's complement adder
// This added adds 2, two's comp. numbers of different number of bits
// the "b" side of the added is 4 bits wider than the a side, so the result it then: sizeof(a) + 4bits + 1carry out 
module adder2s (clk, reset, symEn, a, b, sum);
   parameter             size = 8;
   input                 clk, reset;
   input                 symEn;
   input [size-1:0]      a;
   input [(size-1)+4:0]  b;
   output [size-1+4:0]   sum;
   
   wire [(size-1)+4:0]   sum;
   reg [size+4:0]        tmpSum;
   
   
   always @(posedge clk)
     if (reset) begin
        tmpSum <= 0;
     end
     else if (symEn) begin
        tmpSum <= {a[size-1],a[size-1],a[size-1],a[size-1],a[size-1], a} + {b[size-1], b}; // sign extending the shorter vector
     end
   
   assign sum = tmpSum[size+4:1];    // slicing off the lsb (need to keep the msb's due to signbits) 
   
endmodule
            

module comp (/*clk,*/ a, b, bLarger);
   parameter                 size = 8;
   //input                   clk;
   input [(size-1)+4: 0]     a, b;
   output                    bLarger;
   reg                       bLarger;
   
   //always @(posedge clk)
   always @(a or b) 
     begin
        case ({a[size-1], b[size-1]}) // Checking the sign bit 
          2'b00: begin // both pos
             bLarger <= (b >= a) ? 1 : 0;
          end
          2'b01: begin // a=pos, b=neg
             bLarger <= 0;
          end
          2'b10: begin // a=neg, b=pos
             bLarger <= 1;
          end
          2'b11: begin //both neg
             bLarger <= (b >= a) ? 1 : 0;
          end
        endcase
     end
endmodule                                                    


module mux_2_1 (clk, a, b, sel, y);
   parameter               size = 8;
   input                   clk;
   input [(size-1)+4:0]    a, b;
   input                   sel;
   output [(size-1)+4:0]   y;
   reg [(size-1)+4:0]      y;
   
   //always @ (sel, a, b)
   always @(posedge clk)
     if (sel == 0) y <= a; else
       y <= b;

endmodule         
            

module acs (clk, reset, symEn, matFilt1, matFilt2, accMet1, accMet2, accMetOut, sel, symEnDly);
   parameter             size = 8;
   input                 clk, reset;
   input                 symEn;
   input [size-1:0]      matFilt1, matFilt2;
   input [(size-1)+4:0]  accMet1, accMet2;
   output [(size-1)+4:0] accMetOut;
   output                sel;
   output 			 symEnDly;
      
   wire [(size-1)+4:0]   accMetOut;
   
   wire [(size-1)+4:0]   add1, add2;
   
   // First we add the accumulatior metric with the matchfilter output
   adder2s #(size) adder2s_1
     (
      .clk        (clk     ),
      .reset      (reset   ),
      .symEn      (symEn   ),
      .a          (matFilt1),
      .b          (accMet1 ),
      .sum        (add1    )
      );   
   
   adder2s #(size) adder2s_2
     (
      .clk        (clk     ),
      .reset      (reset   ),
      .symEn      (symEn   ),
      .a          (matFilt2),
      .b          (accMet2 ),
      .sum        (add2    )
      );   

   // Compare
   comp #(size) comparator
     (
      .a          (add1 ), 
      .b          (add2 ), 
      .bLarger    (sel  )
      );

   // Select
   mux_2_1 #(size) selector
     (
      .clk       (clk        ),
      .a         (add1       ),
      .b         (add2       ), 
      .sel       (sel        ), 
      .y         (accMetOut  )
      );

   reg [3:0] 		 symEnSr;
   always @(posedge clk) begin
	if (reset) begin
         symEnSr <= 0;
	end
	else begin
         symEnSr <= {symEnSr[2:0], symEn};
	end
   end
   assign symEnDly = symEnSr[3];
   
endmodule