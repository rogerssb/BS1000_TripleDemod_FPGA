`timescale 1ns/100ps

module cmult8x8(
    clk,ce,ceOut,
    ar,ai,
    br,bi,
    pr,pi);

input           clk;
input           ce;
output          ceOut;
input   [7:0]  ar;
input   [7:0]  ai;
input   [7:0]  br;
input   [7:0]  bi;
output  [16:0]  pr;
output  [16:0]  pi;

reg     [1:0]   clkCnt;
always @(posedge clk) begin
    if (ce) begin
        clkCnt <= 1;
        end
    else if (clkCnt > 0) begin
        clkCnt <= clkCnt - 1;
        end
    end

reg     [7:0]   a0,a1,b0,b1;
always @(clkCnt or ar or br or ai or bi) begin
    case (clkCnt)
        1: begin
            a0 = ar;
            b0 = br;
            a1 = ar;
            b1 = bi;
            end
        0: begin
            a0 = ai;
            b0 = bi;
            a1 = ai;
            b1 = br;
            end
        default: begin
            a0 = 8'hx;
            a1 = 8'hx;
            b0 = 8'hx;
            b1 = 8'hx;
            end
        endcase
    end
// This multiplier produces ar*br in the first clock and ai*bi in the second
wire    [15:0]  p0;
mult8x8Thru mult0(
    .a(a0),
    .b(b0),
    .p(p0)
    );
// This multiplier produces ar*bi in the first clock and ai*br in the second
wire    [15:0]  p1;
mult8x8Thru mult1(
    .a(a1),
    .b(b1),
    .p(p1)
    );
reg     [15:0] firstTerm0;
reg     [15:0] firstTerm1;
always @(posedge clk) begin
    if (clkCnt == 1) begin
        firstTerm0 <= p0;
        firstTerm1 <= p1;
        end
    end

// Create a clock delayed version of the clkEn
reg [4:0]   enSR;
always @(posedge clk)begin
    enSR <= {enSR[3:0],ce};
    end
assign ceOut = enSR[2];

// Final Output
wire    [15:0]  realSum = {firstTerm0[14],firstTerm0[14:0]} - {p0[14],p0[14:0]};
wire    [15:0]  imagSum = {firstTerm1[14],firstTerm1[14:0]} + {p1[14],p1[14:0]};
reg     [16:0]  pr;
reg     [16:0]  pi;
always @(posedge clk) begin
    if (enSR[1]) begin
        `define UNITY_GAIN
        `ifdef UNITY_GAIN
        if (realSum[15] && !realSum[14]) begin
            pr <= 17'h10001;
            end
        else if (!realSum[15] && realSum[14]) begin
            pr <= 17'hffff;
            end
        else begin
            pr <= {realSum[14:0],2'b0};
            end
        if (imagSum[15] && !imagSum[14]) begin
            pi <= 17'h10001;
            end
        else if (!imagSum[15] && imagSum[14]) begin
            pi <= 17'hffff;
            end
        else begin
            pi <= {imagSum[14:0],2'b0};
            end
        `else
        pr = realSum[15:0];
        pi = imagSum[15:0];
        `endif
        end
    end


endmodule
