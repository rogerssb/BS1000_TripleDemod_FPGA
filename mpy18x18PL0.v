`timescale 1ns/100ps

module mpy18x18PL0(
    input       signed  [17:0]  a, 
    input       signed  [17:0]  b, 
    output  reg signed  [35:0]  p
);

    always @* begin
        p = a * b;
    end

endmodule
