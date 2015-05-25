`timescale 1ns/100ps
module add8 (A,B,C,D,E,F,G,H,S);

input signed [17:0] A,B,C,D,E,F,G,H;
output [17:0] S;

wire [20:0] sum =
    {{3{A[17]}},A} +
    {{3{B[17]}},B} +
    {{3{C[17]}},C} +
    {{3{D[17]}},D} +
    {{3{E[17]}},E} +
    {{3{F[17]}},F} +
    {{3{G[17]}},G} +
    {{3{H[17]}},H};

assign S = limit(sum); // 122 luts without limiting
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function [17:0] limit;
    input [20:0] in;
    if (in[20] && (!in[19] || !in[18] || !in[17])) begin
        limit = 18'h20001;
        `ifdef SIMULATE
        $display ("add8 limited");
        `endif
        end
    else if (!in[20] && (in[19] || in[18] || in[17])) begin
        limit = 18'h1ffff;
        `ifdef SIMULATE
        $display ("add8 limited");
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
real e = 0.0; always @* e = $itor($signed(E)) / (2**17);
real f = 0.0; always @* f = $itor($signed(F)) / (2**17);
real g = 0.0; always @* g = $itor($signed(G)) / (2**17);
real h = 0.0; always @* h = $itor($signed(H)) / (2**17);
integer sim_S = 0; always @* sim_S = $rtoi((a+b+c+d+e+f+g+h) * 2**17);
`endif
endmodule