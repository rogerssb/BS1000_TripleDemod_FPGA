`timescale 1ns/100ps
module add4 (A,B,C,D,S);

input signed [17:0] A,B,C,D;
output [17:0] S;

wire [19:0] sum =
    {{2{A[17]}},A} +
    {{2{B[17]}},B} +
    {{2{C[17]}},C} +
    {{2{D[17]}},D};

assign S = limit(sum); // 54 luts without limiting, 75 with
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function [17:0] limit;
    input [19:0] in;
    if (in[19] && (!in[18] || !in[17])) begin
        limit = 18'h20001;
        `ifdef SIMULATE
        $display ("add4 limited");
        `endif
        end
    else if (!in[19] && (in[18] || in[17])) begin
        limit = 18'h1ffff;
        `ifdef SIMULATE
        $display ("add4 limited");
        `endif
        end

    else limit = in[17:0];
endfunction
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
`ifdef SIMULATE
real a = 0.0; always @* a = $itor($signed(A)) / (2**17);
real b = 0.0; always @* b = $itor($signed(B)) / (2**17);
real c = 0.0; always @* c = $itor($signed(C)) / (2**17);
real d = 0.0; always @* d = $itor($signed(D)) / (2**17);
integer sim_S = 0; always @* sim_S = $rtoi((a+b+c+d) * 2**17);
`endif
endmodule