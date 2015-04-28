
`timescale 1ns/1ps

module dualFir
  ( 
    clk, reset, syncIn,
    cs, wr0, wr1, wr2, wr3,
    addr,
    din,
    dout,
    iIn,qIn,
    iOut,qOut
    );

input           clk,reset,syncIn;
input           cs,wr0,wr1,wr2,wr3;
input   [12:0]  addr;
input   [31:0]  din;
output  [31:0]  dout;
input   [17:0]  iIn,qIn;
output  [17:0]  iOut,qOut;


   wire [15:0]     c0c14, c1c13, c2c12, c3c11, c4c10, c5c9 , c6c8 , c7   ;

dualFirCoeffRegs dualFirCoeffRegs (
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


singleFir iFir(
    .clk        (clk),
    .reset      (reset),
    .syncIn     (syncIn),
    .c0c14      (c0c14  ), 
    .c1c13      (c1c13  ), 
    .c2c12      (c2c12  ), 
    .c3c11      (c3c11  ), 
    .c4c10      (c4c10  ), 
    .c5c9       (c5c9   ), 
    .c6c8       (c6c8   ), 
    .c7         (c7     ),
    .in         (iIn),
    .out        (iOut)
    );
singleFir qFir(
    .clk        (clk),
    .reset      (reset),
    .syncIn     (syncIn),
    .c0c14      (c0c14  ), 
    .c1c13      (c1c13  ), 
    .c2c12      (c2c12  ), 
    .c3c11      (c3c11  ), 
    .c4c10      (c4c10  ), 
    .c5c9       (c5c9   ), 
    .c6c8       (c6c8   ), 
    .c7         (c7     ),
    .in         (qIn),
    .out        (qOut)
    );

endmodule 