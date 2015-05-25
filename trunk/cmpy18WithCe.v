/******************************************************************************
Copyright 2008-2015 Koos Technical Services, Inc. All Rights Reserved

This source code is the Intellectual Property of Koos Technical Services,Inc. 
(KTS) and is provided under a License Agreement which protects KTS' ownership and
derivative rights in exchange for negotiated compensation.
******************************************************************************/

module cmpy18WithCe(clk,reset,ce,aReal,aImag,bReal,bImag,pReal,pImag);

input clk;
input reset;
input ce;
input [17:0]aReal;
input [17:0]aImag;
input [17:0]bReal;
input [17:0]bImag;
output [17:0]pReal;
output [17:0]pImag;


// Complex Multiplier
//RxR
wire [35:0]productRxR;
mpy18x18WithCe mpyRxR(.clk(clk), 
//                .sclr(reset),
                .a(aReal), 
                .b(bReal), 
                .ce(ce),
                .p(productRxR)
                );

//IxI
wire [35:0]productIxI;
mpy18x18WithCe mpyIxI(.clk(clk), 
//                .sclr(reset),
                .a(aImag), 
                .b(bImag), 
                .ce(ce),
                .p(productIxI)
                );

//RxI
wire [35:0]productRxI;
mpy18x18WithCe mpyRxI(.clk(clk), 
//                .sclr(reset),
                .a(aReal), 
                .b(bImag), 
                .ce(ce),
                .p(productRxI)
                );

//IxR
wire [35:0]productIxR;
mpy18x18WithCe mpyIxR(.clk(clk), 
//                .sclr(reset),
                .a(aImag), 
                .b(bReal), 
                .ce(ce),
                .p(productIxR)
                );

wire [35:0]realSum = {productRxR[34],productRxR[34:0]} - {productIxI[34],productIxI[34:0]};
wire [35:0]imagSum = {productRxI[34],productRxI[34:0]} + {productIxR[34],productIxR[34:0]};
reg [17:0]pReal;
reg [17:0]pImag;
always @(posedge clk) begin
    if (ce) begin
       pReal <= realSum[35:18];
       pImag <= imagSum[35:18];
    end
end

endmodule
