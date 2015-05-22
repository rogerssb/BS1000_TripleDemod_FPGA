/******************************************************************************
Copyright 2008-2015 Koos Technical Services, Inc. All Rights Reserved

This source code is the Intellectual Property of Koos Technical Services,Inc. 
(KTS) and is provided under a License Agreement which protects KTS' ownership and
derivative rights in exchange for negotiated compensation.
******************************************************************************/

//`define UNITY_GAIN


module cmpy18(
    clk,
    reset,
    aReal,aImag,
    bReal,bImag,
    pReal,pImag
    );

input clk;
input reset;
input [17:0]aReal;
input [17:0]aImag;
input [17:0]bReal;
input [17:0]bImag;
output [17:0]pReal;
output [17:0]pImag;

// Complex Multiplier
//RxR
wire [35:0]productRxR;
mpy18x18 mpyRxR(.clk(clk), 
                .sclr(reset),
                .a(aReal), 
                .b(bReal), 
                .p(productRxR)
                );

//IxI
wire [35:0]productIxI;
mpy18x18 mpyIxI(.clk(clk), 
                .sclr(reset),
                .a(aImag), 
                .b(bImag), 
                .p(productIxI)
                );

//RxI
wire [35:0]productRxI;
mpy18x18 mpyRxI(.clk(clk), 
                .sclr(reset),
                .a(aReal), 
                .b(bImag), 
                .p(productRxI)
                );

//IxR
wire [35:0]productIxR;
mpy18x18 mpyIxR(.clk(clk), 
                .sclr(reset),
                .a(aImag), 
                .b(bReal), 
                .p(productIxR)
                );

wire [35:0]realSum = {productRxR[34],productRxR[34:0]} - {productIxI[34],productIxI[34:0]};
wire [35:0]imagSum = {productRxI[34],productRxI[34:0]} + {productIxR[34],productIxR[34:0]};

`ifdef UNITY_GAIN

reg [17:0]pReal;
reg [17:0]pImag;
always @(posedge clk) begin
    if (realSum[35] & !realSum[34]) begin
        pReal <= 18'h20001;
        end
    else if (!realSum[35] & realSum[34]) begin
        pReal <= 18'h1ffff;
        end
    else begin
        pReal <= realSum[34:17];
        end
    if (imagSum[35] & !imagSum[34]) begin
        pImag <= 18'h20001;
        end
    else if (!imagSum[35] & imagSum[34]) begin
        pImag <= 18'h1ffff;
        end
    else begin
        pImag <= imagSum[34:17];
        end
    end

`else

reg [17:0]pReal;
reg [17:0]pImag;
always @(posedge clk) begin
    pReal <= realSum[35:18];
    pImag <= imagSum[35:18];
    end

`endif

endmodule
