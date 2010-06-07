
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
input   [17:0]  out;

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

wire [17:0]          xnPn_14   = in   + xn_14;
wire [17:0]          xn_1Pn_13 = xn_1 + xn_13;
wire [17:0]          xn_2Pn_12 = xn_2 + xn_12; 
wire [17:0]          xn_3Pn_11 = xn_3 + xn_11; 
wire [17:0]          xn_4Pn_10 = xn_4 + xn_10; 
wire [17:0]          xn_5Pn_9  = xn_5 + xn_9 ; 
wire [17:0]          xn_6Pn_8  = xn_6 + xn_8 ; 


wire [35:0] tap0, tap1, tap2, tap3, tap4, tap5, tap6, tap7;
mpy18x18WithCe tap0mult (.clk(clk), .a(xnPn_14  ), .b({{2{c0c14[15]}},c0c14}), .ce(syncIn), .p(tap0));
mpy18x18WithCe tap1mult (.clk(clk), .a(xn_1Pn_13), .b({{2{c1c13[15]}},c1c13}), .ce(syncIn), .p(tap1));
mpy18x18WithCe tap2mult (.clk(clk), .a(xn_2Pn_12), .b({{2{c2c12[15]}},c2c12}), .ce(syncIn), .p(tap2));
mpy18x18WithCe tap3mult (.clk(clk), .a(xn_3Pn_11), .b({{2{c3c11[15]}},c3c11}), .ce(syncIn), .p(tap3));
mpy18x18WithCe tap4mult (.clk(clk), .a(xn_4Pn_10), .b({{2{c4c10[15]}},c4c10}), .ce(syncIn), .p(tap4));
mpy18x18WithCe tap5mult (.clk(clk), .a(xn_5Pn_9 ), .b({{2{c5c9[15] }},c5c9 }), .ce(syncIn), .p(tap5));
mpy18x18WithCe tap6mult (.clk(clk), .a(xn_6Pn_8 ), .b({{2{c6c8[15] }},c6c8 }), .ce(syncIn), .p(tap6));
mpy18x18WithCe tap7mult (.clk(clk), .a(xn_7     ), .b({{2{c7[15]   }},c7   }), .ce(syncIn), .p(tap7));

wire [42:0] yn = tap0 + tap1 + tap2 + tap3 + tap4 + tap5 + tap6 + tap7;

reg  [17:0] out;
always @(posedge clk) begin
    if (reset) begin
        out <= 0;
    end
    else if (syncIn) begin
        out <= yn[42:(42-17)];  // pickin off the upper 18 bits
    end
end
            
endmodule
