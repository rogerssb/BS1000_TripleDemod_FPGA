`timescale 1ns/100ps
module add2 (A,B,S);

input signed [17:0] A,B;
output [17:0] S;

//wire [19:0] sum = {{1{A[17]}},A} + {{1{B[17]}},B};

assign S = limitAdd2({{1{A[17]}},A} + {{1{B[17]}},B});
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function [17:0] limitAdd2;
    input [18:0] in;
    if (in[18] && !in[17]) begin
        limitAdd2 = 18'h20001;
        `ifdef SIMULATE
        $display ("add2 limited");
        `endif
        end
    else if (!in[18] && in[17]) begin
        limitAdd2 = 18'h1ffff;
        `ifdef SIMULATE
        $display ("add2 limited");
        `endif
        end

    else limitAdd2 = in[17:0];
endfunction
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
`ifdef SIMULATE
real a = 0.0; always @* a = $itor($signed(A)) / (2**17);
real b = 0.0; always @* b = $itor($signed(B)) / (2**17);
//real c = 0.0; always @* c = $itor($signed(C)) / (2**17);
//real d = 0.0; always @* d = $itor($signed(D)) / (2**17);
integer sim_S = 0; always @* sim_S = $rtoi((a+b) * 2**17);
`endif
endmodule