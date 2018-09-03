`timescale 1ns/100ps

module mpy18x18WithCe(
    input                       clk,
    input                       ce,
    input       signed  [17:0]  a,
    input       signed  [17:0]  b,
    output      signed  [35:0]  p
);

    reg signed  [35:0]  pOut;
    assign p = pOut;
    always @(posedge clk) begin
        if (ce) begin
            pOut <= a * b;
        end
    end

endmodule
