`include "./addressMap.v"
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
   input [size-1:0]        a, b;
   input                   sel;
   output [size-1:0]       y;
   reg [size-1:0]          y;
   
   always @ (sel or a or b) begin
      if (sel == 0) begin
         y <= a;
      end
      else begin
         y <= b;
      end
   end
   
endmodule         
            

module acs 
  (
   clk, reset, symEn,
   decayFactor,
   out1PtReal, out0PtReal,
   accMet1, accMet2,
   accMetOut, selOut,
   normalizeIn, normalizeOut,
   out0PtImag, out1PtImag, outImag
   ,outReal
   );
   parameter             size = 8;
   parameter             ROT_BITS = 10;
   input                 clk, reset;
   input                 symEn;
   input [7:0]           decayFactor;
   input [ROT_BITS-1:0]  out1PtReal, out0PtReal;
   input [(size-1)+4:0]  accMet1, accMet2;
   output [(size-1)+4:0] accMetOut;
   output                selOut;
   input                 normalizeIn;
   output                normalizeOut;
     
   input [ROT_BITS-1:0]  out0PtImag, out1PtImag;
   output [ROT_BITS-1:0] outImag;
   output [ROT_BITS-1:0] outReal;

 
         
   wire [(size-1)+4:0]   accMetOut;
   reg  [(size-1)+4:0]   accTemp;
   
   wire [(size-1)+4:0]   add1, add2;
   wire [(size-1)+4:0]   muxOut;
   wire                  bLarger;
   reg                   selOut;
   reg [ROT_BITS-1:0]    outImag;
   wire [ROT_BITS-1:0]   outImagAsync;
   
   wire [ROT_BITS-1:0] outRealAsync;
   reg [ROT_BITS-1:0] outReal;
 
   // First we add the accumulatior metric with the matchfilter output
   adder2s #(size) adder2s_1
     (
      .a          (out1PtReal[(ROT_BITS-1):(ROT_BITS-size)]),
      .b          (accMet1   ),
      .sum        (add1      )
      );   
   // subtracting of a constant and saturate all neg numbers to zero to bring down the acc and prevent it from overflowing
   wire [(size-1)+4:0]  acc1TempSum = add1 - 512;
   reg  [(size-1)+4:0]  acc1Temp;
   always @(acc1TempSum) begin
        if (acc1TempSum[(size-1)+4]) begin // check to see if the msb is 1 (i.e. neg), then set the acc to zero
            acc1Temp <= 0;
        end else begin
            acc1Temp <= acc1TempSum;
        end
   end
   wire [(size-1)+4:0]  acc1 = normalizeIn ? acc1Temp : add1;

   
   adder2s #(size) adder2s_2
     (
      .a          (out0PtReal[(ROT_BITS-1):(ROT_BITS-size)]),
      .b          (accMet2   ),
      .sum        (add2      )
      );   
   // subtracting of a constant and saturate all neg numbers to zero to bring down the acc and prevent it from overflowing
   wire [(size-1)+4:0]  acc2TempSum = add2 - 512;
   reg  [(size-1)+4:0]  acc2Temp;
   always @(acc2TempSum) begin
        if (acc2TempSum[(size-1)+4]) begin // check to see if the msb is 1 (i.e. neg), then set the acc to zero
            acc2Temp <= 0;
        end else begin
            acc2Temp <= acc2TempSum;
        end
   end
   wire [(size-1)+4:0]  acc2 = normalizeIn ? acc2Temp : add2;

   // Compare
   comp #(size) comparator
     (
      .a          (add1   ), 
      .b          (add2   ), 
      .bLarger    (bLarger)
      );

   // Select
   mux_2_1 #(size+4) selector
     (
      .a         (acc1       ),
      .b         (acc2       ), 
      .sel       (bLarger    ), 
      .y         (muxOut     )
      );

   mux_2_1 #(ROT_BITS) selectorImag
     (
      .a         (out1PtImag   ),
      .b         (out0PtImag   ), 
      .sel       (bLarger      ), 
      .y         (outImagAsync )
      );

   mux_2_1 #(ROT_BITS) selectorReal
     (
      .a         (out1PtReal   ),
      .b         (out0PtReal   ), 
      .sel       (bLarger      ), 
      .y         (outRealAsync )
      );

`define USE_DELAYED_NORM
`ifdef USE_DELAYED_NORM
`else
   reg normalizeOut;
   always @(muxOut[(size-1)+4:(size-1)+3]) begin
         //if ( accMetOut[(size-1)+4:(size-1)+1] == 4'b0001 ) begin //check (in the pos. case) if the acc. 8th bit saturate
         if ((muxOut[(size-1)+4:(size-1)+3] == 2'b01) ) begin //check (in the pos. case) if the acc. 8th bit saturate
            normalizeOut <= 1;
         end
         else begin
            normalizeOut <= 0;
         end
      end
`endif
   


wire    [12:0]  decayOut;
assign          accMetOut = decayOut[12:1] + decayOut[0];
mult12x8 accumDecay(
    .ce(symEn), 
    .clk(clk), 
    .sclr(reset),
    .a(muxOut), 
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
   

   always @(posedge clk)
     if (reset) begin
        selOut <= 0;
        outImag <= 0;
        outReal <= 0;
     end
     else if (symEn) begin
        selOut <= ~bLarger;
        outImag <= outImagAsync;
        outReal <= outRealAsync;
     end
   
endmodule