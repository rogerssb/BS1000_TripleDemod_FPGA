`timescale 1ns/100ps

module divSqrt2WithCE(
    input                       clk, 
    input                       ce,
    input       signed  [17:0]  a, 
    output  reg signed  [34:0]  p
);

    //  1/sqrt(2) = $rtoi(0.70710678*(2**17)) = 0x16a0a 

    wire        signed  [17:0]  b = 18'h16a0a;
    always @(posedge clk) begin
        if (ce) begin
            p <= a * b;
        end
    end

endmodule
