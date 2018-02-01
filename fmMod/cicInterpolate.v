`timescale 1ns / 10 ps
`include "..\addressMap.v"

module fmInterpolate(
    clk, reset, clkEn,
    dIn,
    dOut
    );

input           clk;
input           reset;
input           clkEn;
input   [17:0]  dIn;
output  [33:0]  dOut;

// 3rd order comb with a FIR structure to minimize delay
// (1 - z)^3 = 1 - 3z + 3z^2 - z^3
wire    [18:0]  slice = {dIn[17],dIn};
wire    [19:0]  dinX3 = {slice[18],slice} + {slice,1'b0};
reg     [19:0]  tap0;
reg     [19:0]  tap1;
reg     [19:0]  tap2;
reg     [19:0]  tap3;
wire    [19:0]  sum3 = tap2 + {slice[18],slice};
always @(posedge clk) begin
    if (reset) begin
        tap0 <= 0;
        tap1 <= 0;
        tap2 <= 0;
        tap3 <= 0;
        end
    else if (clkEn) begin
        tap0 <= {slice[18],slice};
        tap1 <= dinX3 - tap0;
        tap2 <= tap1 - dinX3;
        tap3 <= sum3;
        end
    else begin
        tap3 <= 0;
        end
    end

// Three stages of integration
reg     [33:0]  acc0,acc1,acc2;
always @(posedge clk) begin
    if (reset) begin
        acc0 <= 0;
        acc1 <= 0;
        acc2 <= 0;
        end
    else begin
        acc0 <= acc0 + {{14{tap3[19]}},tap3};
        acc1 <= acc1 + acc0;
        acc2 <= acc2 + acc1;
        end
    end

// Final output
assign dOut = acc2;

endmodule
