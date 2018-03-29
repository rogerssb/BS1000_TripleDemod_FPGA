/******************************************************************************
Copyright 2008-2015 Koos Technical Services, Inc. All Rights Reserved

This source code is the Intellectual Property of Koos Technical Services,Inc.
(KTS) and is provided under a License Agreement which protects KTS' ownership and
derivative rights in exchange for negotiated compensation.
******************************************************************************/

`timescale 1ns/1ps
`include "./addressMap.v"

module dualFir
  (
    clk, reset, clkEn,
    `ifdef USE_BUS_CLOCK
    busClk,
    `endif
    cs,
    wr0, wr1, wr2, wr3,
    addr,
    din,
    dout,
    iIn,qIn,
    iOut,qOut
    );

parameter RegSpace = `DDCFIRSPACE;

input           clk,reset,clkEn;
`ifdef USE_BUS_CLOCK
input           busClk;
`endif
input           cs;
input           wr0,wr1,wr2,wr3;
input   [12:0]  addr;
input   [31:0]  din;
output  [31:0]  dout;
input   [17:0]  iIn,qIn;
output  [17:0]  iOut,qOut;

reg firSpace;
always @* begin
    casex(addr)
        RegSpace:       firSpace = cs;
        default:        firSpace = 0;
        endcase
    end


   wire [15:0]     c0c14, c1c13, c2c12, c3c11, c4c10, c5c9 , c6c8 , c7   ;

dualFirCoeffRegs dualFirCoeffRegs (
    .addr    (addr   ),
    .dataIn  (din    ),
    .dataOut (dout   ),
    `ifdef USE_BUS_CLOCK
    .busClk(busClk),
    `endif
    .cs      (firSpace ),
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
    .clkEn      (clkEn),
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
    .clkEn      (clkEn),
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