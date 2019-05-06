`timescale 1ns/1ps

module cmagSquared18(
    input                   clk,clkEn,
    input   signed  [17:0]  inReal, inImag,
    output  signed  [18:0]  magSquared
);

    `define USE_CLOCKED_MPYS
    `ifdef USE_CLOCKED_MPYS

    wire    [35:0]  realSquared;
    mpy18x18 mpyReal(
        .CLK(clk),
        .A(inReal),
        .B(inReal),
        .P(realSquared)
    );
    wire    [35:0]  imagSquared;
    mpy18x18 mpyImag(
        .CLK(clk),
        .A(inImag),
        .B(inImag),
        .P(imagSquared)
    );
    wire    signed  [18:0] sum = {realSquared[34:16]} + {imagSquared[34:16]};
    reg     signed  [17:0] sat;
    always @* begin
        if (sum[18]) begin
            sat = 18'h3ffff;
        end
        else begin
            sat = sum[17:0];
        end
    end
    assign magSquared = sum;

    `else

    wire    [35:0]  realSquared;
    mpy18x18PL0 mpyReal(
        .A(inReal),
        .B(inReal),
        .P(realSquared)
    );
    wire    [35:0]  imagSquared;
    mpy18x18PL0 mpyImag(
        .A(inImag),
        .B(inImag),
        .P(imagSquared)
    );
    wire    signed  [18:0] sum = {realSquared[34:16]} + {imagSquared[34:16]};
    reg     signed  [17:0] sat;
    always @(posedge clk) begin
        if (clkEn) begin
            if (sum[18]) begin
                sat <= 18'h3ffff;
            end
            else begin
                sat <= sum[17:0];
            end
        end
    end
    assign magSquared = sat;

    `endif

endmodule
