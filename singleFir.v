
`timescale 1ns/1ps

module singleFir(
    clk, reset, syncIn,
    c0c14, 
    c1c13, 
    c2c12, 
    c3c11, 
    c4c10, 
    c5c9, 
    c6c8, 
    c7,
    in,
    out
    );

input   clk,reset,syncIn;
input   [15:0]  c0c14;
input   [15:0]  c1c13;
input   [15:0]  c2c12;
input   [15:0]  c3c11;
input   [15:0]  c4c10;
input   [15:0]  c5c9;
input   [15:0]  c6c8;
input   [15:0]  c7;   
input   [17:0]  in;
output  [17:0]  out;

reg [17:0]      xn_1, xn_2, xn_3, xn_4, xn_5, xn_6, xn_7, xn_8, xn_9, xn_10, xn_11, xn_12, xn_13, xn_14;


// Delay line
always @(posedge clk) begin
    if (reset) begin
        xn_1 <=  0; 
        xn_2 <=  0;
        xn_3 <=  0;
        xn_4 <=  0;
        xn_5 <=  0;
        xn_6 <=  0;
        xn_7 <=  0;
        xn_8 <=  0;
        xn_9 <=  0;
        xn_10 <= 0;
        xn_11 <= 0;
        xn_12 <= 0;
        xn_13 <= 0;
        xn_14 <= 0;
    end
    else if (syncIn) begin
        xn_1 <=  in   ; 
        xn_2 <=  xn_1 ;
        xn_3 <=  xn_2 ;
        xn_4 <=  xn_3 ;
        xn_5 <=  xn_4 ;
        xn_6 <=  xn_5 ;
        xn_7 <=  xn_6 ;
        xn_8 <=  xn_7 ;
        xn_9 <=  xn_8 ;
        xn_10 <= xn_9 ;
        xn_11 <= xn_10;
        xn_12 <= xn_11;
        xn_13 <= xn_12;
        xn_14 <= xn_13;
    end
end
 
`ifdef SIMULATE
   real in_real;
   real c0c14_real;
   real c1c13_real;
   real c2c12_real;
   real c3c11_real;
   real c4c10_real;
   real c5c9_real;
   real c6c8_real;
   real c7_real;
   always @(in or c0c14 or c1c13 or c2c12 or c3c11 or c4c10 or c5c9 or c6c8 or c7) begin
      in_real <= $itor($signed(in))/(2**17);
      c0c14_real <= $itor($signed(c0c14))/(2**15);
      c1c13_real <= $itor($signed(c1c13))/(2**15);
      c2c12_real <= $itor($signed(c2c12))/(2**15);
      c3c11_real <= $itor($signed(c3c11))/(2**15);
      c4c10_real <= $itor($signed(c4c10))/(2**15);
      c5c9_real <= $itor($signed(c5c9))/(2**15);
      c6c8_real <= $itor($signed(c6c8))/(2**15);
      c7_real <= $itor($signed(c7))/(2**15);
   end
`endif
   
   
   wire [18:0]          xnPn_14   = {  in[17] ,in  } + {xn_14[17] ,xn_14};
   wire [18:0]          xn_1Pn_13 = {xn_1[17] ,xn_1} + {xn_13[17] ,xn_13};
   wire [18:0]          xn_2Pn_12 = {xn_2[17] ,xn_2} + {xn_12[17] ,xn_12}; 
   wire [18:0]          xn_3Pn_11 = {xn_3[17] ,xn_3} + {xn_11[17] ,xn_11}; 
   wire [18:0]          xn_4Pn_10 = {xn_4[17] ,xn_4} + {xn_10[17] ,xn_10}; 
   wire [18:0]          xn_5Pn_9  = {xn_5[17] ,xn_5} + { xn_9[17] ,xn_9 }; 
   wire [18:0]          xn_6Pn_8  = {xn_6[17] ,xn_6} + { xn_8[17] ,xn_8 }; 
   
`ifdef SIMULATE
   real                 xnPn_14_real;
   always @(xnPn_14) begin
      xnPn_14_real <= $itor($signed(xnPn_14[18:1]))/(2**17);
   end
`endif
   
   

   wire [35:0] tap0, tap1, tap2, tap3, tap4, tap5, tap6, tap7;
   mpy18x18WithCe tap0mult (.clk(clk), .a(         xnPn_14[18:1]), .b({c0c14,2'b0}), .ce(syncIn), .p(tap0));
   mpy18x18WithCe tap1mult (.clk(clk), .a(       xn_1Pn_13[18:1]), .b({c1c13,2'b0}), .ce(syncIn), .p(tap1));
   mpy18x18WithCe tap2mult (.clk(clk), .a(       xn_2Pn_12[18:1]), .b({c2c12,2'b0}), .ce(syncIn), .p(tap2));
   mpy18x18WithCe tap3mult (.clk(clk), .a(       xn_3Pn_11[18:1]), .b({c3c11,2'b0}), .ce(syncIn), .p(tap3));
   mpy18x18WithCe tap4mult (.clk(clk), .a(       xn_4Pn_10[18:1]), .b({c4c10,2'b0}), .ce(syncIn), .p(tap4));
   mpy18x18WithCe tap5mult (.clk(clk), .a(        xn_5Pn_9[18:1]), .b({c5c9, 2'b0}), .ce(syncIn), .p(tap5));
   mpy18x18WithCe tap6mult (.clk(clk), .a(        xn_6Pn_8[18:1]), .b({c6c8, 2'b0}), .ce(syncIn), .p(tap6));
   mpy18x18WithCe tap7mult (.clk(clk), .a({xn_7[17], xn_7[17:1]}), .b({c7,   2'b0}), .ce(syncIn), .p(tap7));
   
   wire [42:0] yn = {{ 7{tap0[35]}},tap0} 
               + {{ 7{tap1[35]}},tap1}  
               + {{ 7{tap2[35]}},tap2}  
               + {{ 7{tap3[35]}},tap3}  
               + {{ 7{tap4[35]}},tap4}  
               + {{ 7{tap5[35]}},tap5}  
               + {{ 7{tap6[35]}},tap6}  
               + {{ 7{tap7[35]}},tap7} ;

   
   reg [42:0] ynR;
   reg [17:0] dataBits;
   reg [17:0] out;
   reg        satPos,satNeg;
   reg        sign;
   always @(posedge clk) begin 
      if (syncIn) begin
         sign <= yn[42];
         ynR <= yn;
         dataBits <= ynR[33:16];
         //dataBits <= {phaseError[6:0], 1'b0};
         satPos <= !sign && (ynR[42:33] != 10'b0000000000);
         satNeg <=  sign && (ynR[42:33] != 10'b1111111111);
         if (satPos) begin
            out <= 18'h1ffff;
         end
         else if (satNeg) begin
            out <= 18'h20001;
         end
         else begin
            out <= dataBits;
         end
      end   
   end
   
   
`ifdef SIMULATE
   real yn_real;
   real out_real;
   always @(yn or out) begin
      yn_real <= $itor($signed(yn))/(2.0**(42-9));
      out_real <= $itor($signed(out))/(2**17);
   end
`endif

   
endmodule
