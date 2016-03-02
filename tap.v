`timescale 1ns/100ps
module tap (
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
cmult18 cmult18_1 (
    .A(iIn), // input [17 : 0]
    .B(qIn), // input [17 : 0]
    .C(iWeight), // input [17 : 0]
    .D(qWeight), // input [17 : 0]
    .R(iOut), // output [17 : 0]
    .I(qOut), // output [17 : 0]
    .EN(clkEn), // input
    .CK(clk), // input
    .RS(reset)); // input
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// Weight update
// wReal  <= wReal  + errorReal*xReal  + errorImag*xImag;
// wImag  <= wImag  - errorReal*xImag  + errorImag*xReal;
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

wire signed [19:0] p1;
mult10x10PL0 inst_1 (
  .a(iError[17:8]), // input [9 : 0] a
  .b(iInDelay[17:8]), // input [9 : 0] b
  .p(p1)); // output [19 : 0] p

wire signed [19:0] p2;
mult10x10PL0 inst_2 (
  .a(qError[17:8]), // input [9 : 0] a
  .b(qInDelay[17:8]), // input [9 : 0] b
  .p(p2)); // output [19 : 0] p

wire signed [19:0] p3;
mult10x10PL0 inst_3 (
  .a(iError[17:8]), // input [9 : 0] a
  .b(qInDelay[17:8]), // input [9 : 0] b
  .p(p3)); // output [19 : 0] p

wire signed [19:0] p4;
mult10x10PL0 inst_4 (
  .a(qError[17:8]), // input [9 : 0] a
  .b(iInDelay[17:8]), // input [9 : 0] b
  .p(p4)); // output [19 : 0] p

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
        if (wtUpdate) begin
            iWeight <= limitAdd3(iWeightWire);
            qWeight <= limitAdd3(qWeightWire);
            end
        end
    end

endmodule //tap