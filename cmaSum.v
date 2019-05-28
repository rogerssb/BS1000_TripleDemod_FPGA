/******************************************************************************
Copyright 2008-2016 Koos Technical Services, Inc. All Rights Reserved

This source code is the Intellectual Property of Koos Technical Services,Inc.
(KTS) and is provided under a License Agreement which protects KTS' ownership and
derivative rights in exchange for negotiated compensation.
******************************************************************************/

`timescale 1ns/100ps
module cmaSum (
    input                       CK,EN,RS,
    input       signed  [17:0]  t0,t1,t2,t3,t4,t5,t6,t7,
                                t8,t9,t10,t11,t12,t13,t14,t15,
    output      signed  [17:0]  S,
    output  reg signed  [17:0]  qS
);

    wire signed [17:0] s1,s2,s3,s4;

    add8Taps add8_1 (.A(t0),.B(t1),.C(t2),.D(t3),.E(t4),.F(t5),.G(t6),.H(t7),.S(s1));
    add8Taps add8_2 (.A(t8),.B(t9),.C(t10),.D(t11),.E(t12),.F(t13),.G(t14),.H(t15),.S(s2));

    //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    // This clock contributes one pipeline delay
    //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    reg signed  [17 : 0] reg_s1,reg_s2,reg_s3,reg_s4;
    always @ (posedge CK) begin
        if (EN) begin
            reg_s1 <= s1;
            reg_s2 <= s2;
            end
        end

    add2Taps add2_1 (.A(reg_s1),.B(reg_s2),.S(S));

    //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    // This clock contributes a second pipeline delay
    //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    always @ (posedge CK) begin
        if (RS) begin
            qS <= 18'h0;
            end
        else if (EN) begin
            qS <= S;
            end
        end

    `ifdef SIMULATE
    real real_t0 = 0.0; always @* real_t0 = $itor($signed(t0)) / (2**17);
    real real_t1 = 0.0; always @* real_t1 = $itor($signed(t1)) / (2**17);
    real real_t2 = 0.0; always @* real_t2 = $itor($signed(t2)) / (2**17);
    real real_t3 = 0.0; always @* real_t3 = $itor($signed(t3)) / (2**17);
    real real_t4 = 0.0; always @* real_t4 = $itor($signed(t4)) / (2**17);
    real real_t5 = 0.0; always @* real_t5 = $itor($signed(t5)) / (2**17);
    real real_t6 = 0.0; always @* real_t6 = $itor($signed(t6)) / (2**17);
    real real_t7 = 0.0; always @* real_t7 = $itor($signed(t7)) / (2**17);

    real real_t8 = 0.0; always @*  real_t8 = $itor($signed(t8)) / (2**17);
    real real_t9 = 0.0; always @*  real_t9 = $itor($signed(t9)) / (2**17);
    real real_t10 = 0.0; always @* real_t10 = $itor($signed(t10)) / (2**17);
    real real_t11 = 0.0; always @* real_t11 = $itor($signed(t11)) / (2**17);
    real real_t12 = 0.0; always @* real_t12 = $itor($signed(t12)) / (2**17);
    real real_t13 = 0.0; always @* real_t13 = $itor($signed(t13)) / (2**17);
    real real_t14 = 0.0; always @* real_t14 = $itor($signed(t14)) / (2**17);
    real real_t15 = 0.0; always @* real_t15 = $itor($signed(t15)) / (2**17);

    integer sim_S = 0; always @* sim_S = $rtoi(
        (
        real_t0+real_t1+real_t2+real_t3+real_t4+real_t5+real_t6+real_t7+
        real_t8+real_t9+real_t10+real_t11+real_t12+real_t13+real_t14+real_t15
        ) * 2**17);

    integer sim_qS = 0;
    always @ (posedge CK) begin
        if (EN) begin
            sim_qS <= sim_S;
            end
        end

    `endif

endmodule


module add8Taps(
    input   signed  [17:0]  A,
    input   signed  [17:0]  B,
    input   signed  [17:0]  C,
    input   signed  [17:0]  D,
    input   signed  [17:0]  E,
    input   signed  [17:0]  F,
    input   signed  [17:0]  G,
    input   signed  [17:0]  H,
    output  signed  [17:0]  S
);


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


module add2Taps (
    input   signed  [17:0]  A,B,
    output  signed  [17:0]  S
);

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


