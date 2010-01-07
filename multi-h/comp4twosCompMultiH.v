`timescale 1ns/1ps

//  For multi H mode the index has to range from 0-64 so index has to be 6 bits

module comp4twosCompMultiH (clk,a,b,c,d,index,maxVal);
   parameter             size = 8;
   parameter             indexOffset=0;
`ifdef SIMULATE
`else
   defparam              compTwosCompFunc.size = size;
`endif
   

   input                 clk;
   input [(size-1):0]    a, b, c, d;
   output [5:0]          index;
   output [(size-1):0]   maxVal;
   reg [(size-1):0]      maxVal;
   reg [1:0]             tempIndex;
   reg [5:0]             index;                         
   wire                  sel0, sel1;

      
   // This function returns 0 if "a" is larger and 1 if "b" is larger
   function compTwosCompFunc;
      parameter size = 8;
      input [size-1:0] a,b;
      begin
         case ({a[size-1], b[size-1]}) // Checking the sign bit 
           2'b00: begin // both pos
              compTwosCompFunc = (b > a) ? 1'b1 : 1'b0;
           end
           2'b01: begin // a=pos, b=neg
              compTwosCompFunc = 1'b0;
           end
           2'b10: begin // a=neg, b=pos
              compTwosCompFunc = 1'b1;
           end
           2'b11: begin //both neg
              compTwosCompFunc = (b >= a) ? 1'b1 : 1'b0;
           end
         endcase
      end
   endfunction
   
   // Comparing input 'a' with input 'b'. 'sel' could be used to sel the largest value using a mux
   assign sel0 = (compTwosCompFunc(a,b)==1'b0) ? 0 : 1;//? a : b;
   // Comparing input 'c' with input 'd'. 'sel' could be used to sel the largest value using a mux
   assign sel1 = (compTwosCompFunc(c,d)==1'b0) ? 0 : 1;//? c : d;

   // tempIndex points at the largest index out of inputs a,d,c, or d.
   always @(a or b or c or d or sel0 or sel1 )
     begin
        case ({sel0, sel1}) 
          2'b00: 
            begin // compare "a" and "c"
               if ( compTwosCompFunc(a,c)==1'b0 )
                  tempIndex <= 0; // a 
               else
                 tempIndex <= 2; // c
            end
          2'b01: 
            begin // compare "a" and "d"
               if ( compTwosCompFunc(a,d)==1'b0 )
                 tempIndex <= 0; // a
               else
                 tempIndex <= 3; // d
            end
          2'b10: 
            begin // compare "b" and "c"
               if ( compTwosCompFunc(b,c)==1'b0 )
                 tempIndex <= 1; // b
               else
                 tempIndex <= 2; // c
            end
          2'b11: 
            begin // compare "b" and "d"
               if ( compTwosCompFunc(b,d)==1'b0 )
                 tempIndex <= 1; // b
               else
                 tempIndex <= 3; //d
            end
        endcase 
     end 
   
   // sync with the system clock
   always @(posedge clk)
     begin
        index <= tempIndex + indexOffset;
        case (tempIndex)
          0: maxVal <= a;
          1: maxVal <= b;
          2: maxVal <= c;
          3: maxVal <= d;
          default: maxVal <= 0;
        endcase
     end
   
endmodule         