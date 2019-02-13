`timescale 1ns/100ps

module mpy18x18(
    input                       clk,
    input                       sclr,
    input       signed  [17:0]  a,
    input       signed  [17:0]  b,
    output  reg signed  [35:0]  p
);

    reg     signed  [17:0]  aReg,bReg;
    reg     signed  [35:0]  pReg;
    always @(posedge clk) begin
        if (sclr) begin
            p <= 36'h0;
        end
        else begin
            aReg <= a;
            bReg <= b;
            pReg <= a * b;
            p <= pReg;
        end
    end

endmodule