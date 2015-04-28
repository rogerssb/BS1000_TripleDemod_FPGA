
`timescale 1ns/1ps

module videoFir
  ( 
    clk, reset, clkEn,
    cs, wr0, wr1, wr2, wr3,
    addr,
    din,
    dout,
    videoIn,
    videoOut
    );

input           clk,reset,clkEn;
input           cs,wr0,wr1,wr2,wr3;
input   [12:0]  addr;
input   [31:0]  din;
output  [31:0]  dout;
input   [17:0]  videoIn;
output  [17:0]  videoOut;


   wire [15:0]     c0c14, c1c13, c2c12, c3c11, c4c10, c5c9 , c6c8 , c7   ;

dualFirCoeffRegs singleFirCoeffRegs (
    .addr    (addr   ),
    .dataIn  (din    ),
    .dataOut (dout   ),
    .cs      (cs     ),
    .wr0     (wr0), .wr1(wr1), .wr2(wr2), .wr3(wr3),
    .c0      (c0c14  ), 
    .c1      (c1c13  ), 
    .c2      (c2c12  ), 
    .c3      (c3c11  ), 
    .c4      (c4c10  ), 
    .c5      (c5c9   ), 
    .c6      (c6c8   ), 
    .c7      (c7     )
    );


singleFir vidFir(
    .clk        (clk),
    .reset      (reset),
    .syncIn     (clkEn),
    .c0c14      (c0c14  ), 
    .c1c13      (c1c13  ), 
    .c2c12      (c2c12  ), 
    .c3c11      (c3c11  ), 
    .c4c10      (c4c10  ), 
    .c5c9       (c5c9   ), 
    .c6c8       (c6c8   ), 
    .c7         (c7     ),
    .in         (videoIn),
    .out        (videoOut)
    );

endmodule 