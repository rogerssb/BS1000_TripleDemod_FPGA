`timescale 1ns/100ps

module mpy18x18PL1(
    input                       clk, 
    input                       sclr,
    input       signed  [17:0]  a, 
    input       signed  [17:0]  b, 
    output  reg signed  [35:0]  p
);

    always @(posedge clk) begin
        if (sclr) begin
            p <= 36'h0;
        end
        else begin
            p <= a * b;
        end
    end

endmodule
