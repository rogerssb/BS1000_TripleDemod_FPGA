`include "addressMap.v"
`timescale 1ns/1ps

module multihSuperbaudH1(
    input                       clk,clkEn,reset,
    input       signed  [17:0]  din,
    output      signed  [17:0]  dout
);

    function signed [17:0]  div8;
        input   signed  [17:0]  a;
        div8 = {{3{a[17]}},a[17:3]};
    endfunction

    function signed [17:0]  div16;
        input   signed  [17:0]  a;
        div16 = {{4{a[17]}},a[17:4]};
    endfunction

    reg     signed  [17:0]  dinSR[7:0];
    integer                 i;
    always @(posedge clk) begin
        `ifdef SIMULATE
        if (reset) begin
            for (i = 0; i <= 7; i = i + 1) begin
                dinSR[i] <= 0;
            end
        end
        else if (clkEn) begin
        `else
        if (clkEn) begin
        `endif
            dinSR[0] <= din;
            for (i = 0; i < 7; i = i + 1) begin
                dinSR[i+1] <= dinSR[i];
            end
        end
    end

    wire    signed  [17:0]  taps017and8 = div16(din)      + div8( dinSR[0]) + div8( dinSR[6]) + div16(dinSR[7]);
    wire    signed  [17:0]  taps235and6 = div8( dinSR[1]) + div16(dinSR[2]) + div16(dinSR[4]) + div8( dinSR[5]);
    reg     signed  [17:0]  doutReg;
    always @(posedge clk) begin
        if (clkEn) begin
            doutReg <= taps017and8 + taps235and6;
        end
    end
    assign  dout = doutReg;

endmodule



