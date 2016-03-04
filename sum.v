/******************************************************************************
Copyright 2008-2016 Koos Technical Services, Inc. All Rights Reserved

This source code is the Intellectual Property of Koos Technical Services,Inc. 
(KTS) and is provided under a License Agreement which protects KTS' ownership and
derivative rights in exchange for negotiated compensation.
******************************************************************************/

`timescale 1ns/100ps
module sum (
    t0,t1,t2,t3,t4,t5,t6,t7,t8,t9,t10,t11,t12,t13,t14,t15,
    t16,t17,t18,t19,t20,t21,t22,t23,t24,t25,t26,t27,t28,t29,t30,t31,S,qS,CK,EN,RS);

input [17:0]
    t0,t1,t2,t3,t4,t5,t6,t7,t8,t9,t10,t11,t12,t13,t14,t15,
    t16,t17,t18,t19,t20,t21,t22,t23,t24,t25,t26,t27,t28,t29,t30,t31;
input CK,EN,RS;
output [17:0] S,qS;
wire [17:0] s1,s2,s3,s4;

add8 add8_1 (.A(t0),.B(t1),.C(t2),.D(t3),.E(t4),.F(t5),.G(t6),.H(t7),.S(s1));
add8 add8_2 (.A(t8),.B(t9),.C(t10),.D(t11),.E(t12),.F(t13),.G(t14),.H(t15),.S(s2));
//add8 add8_3 (.A(t16),.B(t17),.C(t18),.D(t19),.E(t20),.F(t21),.G(t22),.H(t23),.S(s3));
//add8 add8_4 (.A(t24),.B(t25),.C(t26),.D(t27),.E(t28),.F(t29),.G(t30),.H(t31),.S(s4));

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// This clock contributes one pipeline delay
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
reg [17 : 0] reg_s1,reg_s2,reg_s3,reg_s4;
always @ (posedge CK) begin
    if (EN) begin
        reg_s1 <= s1;
        reg_s2 <= s2;
//        reg_s3 <= s3;
//        reg_s4 <= s4;
        end
    end

//add4 add4_1 (.A(reg_s1),.B(reg_s2),.C(reg_s3),.D(reg_s4),.S(S));
add2 add2_1 (.A(reg_s1),.B(reg_s2),.S(S));

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// This clock contributes a second pipeline delay
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
reg [17:0]qS;
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

real real_t16 = 0.0; always @* real_t16 = $itor($signed(t16)) / (2**17);
real real_t17 = 0.0; always @* real_t17 = $itor($signed(t17)) / (2**17);
real real_t18 = 0.0; always @* real_t18 = $itor($signed(t18)) / (2**17);
real real_t19 = 0.0; always @* real_t19 = $itor($signed(t19)) / (2**17);
real real_t20 = 0.0; always @* real_t20 = $itor($signed(t20)) / (2**17);
real real_t21 = 0.0; always @* real_t21 = $itor($signed(t21)) / (2**17);
real real_t22 = 0.0; always @* real_t22 = $itor($signed(t22)) / (2**17);
real real_t23 = 0.0; always @* real_t23 = $itor($signed(t23)) / (2**17);

real real_t24 = 0.0; always @* real_t24 = $itor($signed(t24)) / (2**17);
real real_t25 = 0.0; always @* real_t25 = $itor($signed(t25)) / (2**17);
real real_t26 = 0.0; always @* real_t26 = $itor($signed(t26)) / (2**17);
real real_t27 = 0.0; always @* real_t27 = $itor($signed(t27)) / (2**17);
real real_t28 = 0.0; always @* real_t28 = $itor($signed(t28)) / (2**17);
real real_t29 = 0.0; always @* real_t29 = $itor($signed(t29)) / (2**17);
real real_t30 = 0.0; always @* real_t30 = $itor($signed(t30)) / (2**17);
real real_t31 = 0.0; always @* real_t31 = $itor($signed(t31)) / (2**17);

integer sim_S = 0; always @* sim_S = $rtoi(
    (
    real_t0+real_t1+real_t2+real_t3+real_t4+real_t5+real_t6+real_t7+
    real_t8+real_t9+real_t10+real_t11+real_t12+real_t13+real_t14+real_t15+
    real_t16+real_t17+real_t18+real_t19+real_t20+real_t21+real_t22+real_t23+
    real_t24+real_t25+real_t26+real_t27+real_t28+real_t29+real_t30+real_t31
    ) * 2**17);

integer sim_qS = 0;
always @ (posedge CK) begin
    if (EN) begin
        sim_qS <= sim_S;
        end
    end

`endif

endmodule