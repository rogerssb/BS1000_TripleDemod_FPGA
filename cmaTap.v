/******************************************************************************
Copyright 2008-2016 Koos Technical Services, Inc. All Rights Reserved

This source code is the Intellectual Property of Koos Technical Services,Inc.
(KTS) and is provided under a License Agreement which protects KTS' ownership and
derivative rights in exchange for negotiated compensation.
******************************************************************************/

`timescale 1ns/100ps
module cmaTap (
    clk, // input
    clkEn, // input
    reset, // input
    wtUpdate, // input
    wtReset, // input
    iIn, // input [17 : 0]
    qIn, // input [17 : 0]
    iInDelay, // input [17 : 0]
    qInDelay, // input [17 : 0]
    iError, // input [17 : 0]
    qError, // input [17 : 0]
    wtOvf,   // output
    iOut, // output [17 : 0]
    qOut); // output [17 : 0]

input               clk,clkEn,reset,wtUpdate,wtReset;
input signed [17:0] iIn,qIn;
input signed [17:0] iInDelay,qInDelay;
input signed [17:0] iError,qError;
output              wtOvf;
output [17:0]       iOut,qOut;

parameter initWeight = "";
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function chkOvf;
    input [19:0] in;
    if (in[19] && (!in[18] || !in[17])) chkOvf = 1'b1;
    else if (!in[19] && (in[18] || in[17])) chkOvf = 1'b1;
    else chkOvf = 1'b0;
endfunction
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function [17:0] limitAdd3;
    input [19:0] in;
    if (in[19] && (!in[18] || !in[17])) begin
        limitAdd3 = 18'h20001;
        `ifdef SIMULATE
        $display ("tap limited");
        `endif
        end
    else if (!in[19] && (in[18] || in[17])) begin
        limitAdd3 = 18'h1ffff;
        `ifdef SIMULATE
        $display ("tap limited");
        `endif
        end
    else limitAdd3 = in[17:0];
endfunction
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function [17:0]limitAdd2;
    input [18:0]in;
    if (in[18] && !in[17]) begin
        limitAdd2 = 18'h20001;
        `ifdef SIMULATE
        $display ("tap limited");
        `endif
        end
    else if (!in[18] && in[17]) begin
        limitAdd2 = 18'h1ffff;
        `ifdef SIMULATE
        $display ("tap limited");
        `endif
        end
    else limitAdd2 = in[17:0];
endfunction
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// tapReal = xReal*wReal - xImag*wImag;
// tapImag = xReal*wImag + xImag*wReal;
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
reg signed [17:0] iWeight,qWeight;
cmpy18WithCePL1 cmpy(
    .clk(clk),
    .clkEn(clkEn),
    .reset(reset),
    .aReal(iIn),        .aImag(qIn),
    .bReal(iWeight),    .bImag(qWeight),
    .pReal(iOut),       .pImag(qOut)
);
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// Weight update
// wReal  <= wReal  + errorReal*xReal  + errorImag*xImag;
// wImag  <= wImag  - errorReal*xImag  + errorImag*xReal;
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

wire signed [19:0] p1;
multiplier #(.AWIDTH(10), .BWIDTH(10), .PLSTAGES(0)) inst_1(
    .clk(),
    .clkEn(),
    .reset(),
    .a(iError[17:8]),
    .b(iInDelay[17:8]),
    .p(p1)
);
wire signed [19:0] p2;
multiplier #(.AWIDTH(10), .BWIDTH(10), .PLSTAGES(0)) inst_2(
    .clk(),
    .clkEn(),
    .reset(),
    .a(qError[17:8]),
    .b(qInDelay[17:8]),
    .p(p2)
);
wire signed [19:0] p3;
multiplier #(.AWIDTH(10), .BWIDTH(10), .PLSTAGES(0)) inst_3(
    .clk(),
    .clkEn(),
    .reset(),
    .a(iError[17:8]),
    .b(qInDelay[17:8]),
    .p(p3)
);
wire signed [19:0] p4;
multiplier #(.AWIDTH(10), .BWIDTH(10), .PLSTAGES(0)) inst_4(
    .clk(),
    .clkEn(),
    .reset(),
    .a(qError[17:8]),
    .b(iInDelay[17:8]),
    .p(p4)
);

wire [19 : 0] iWeightWire = {{2{iWeight[17]}},iWeight} + {{2{p1[18]}},p1[18:1]} + {{2{p2[18]}},p2[18:1]};
wire [19 : 0] qWeightWire = {{2{qWeight[17]}},qWeight} - {{2{p3[18]}},p3[18:1]} + {{2{p4[18]}},p4[18:1]};

reg  wtOvf;
always @(posedge clk) begin
    if (reset || wtReset) begin
        iWeight <= initWeight;
        qWeight <= 0;
        wtOvf <= 1'b0;
        end
    else if (clkEn) begin
        wtOvf <= chkOvf(iWeightWire) || chkOvf(qWeightWire);
        if (chkOvf(iWeightWire) || chkOvf(qWeightWire)) begin
            iWeight <= initWeight;
            qWeight <= 0;
        end
        else if (wtUpdate) begin
            iWeight <= limitAdd3(iWeightWire);
            qWeight <= limitAdd3(qWeightWire);
            end
        end
    end

endmodule //tap