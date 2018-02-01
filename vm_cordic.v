/******************************************************************************
Copyright 2008-2015 Koos Technical Services, Inc. All Rights Reserved

This source code is the Intellectual Property of Koos Technical Services,Inc.
(KTS) and is provided under a License Agreement which protects KTS' ownership and
derivative rights in exchange for negotiated compensation.
******************************************************************************/

//  This vectoring mode CORDIC implementation is described in detail
//  in "A survey of CORDIC algorithms for FPGA based computers" by Ray Andraka.
//
//  Originated by Verne Stauffer 10/05/06

`timescale 1ns/100ps

module vm_cordic(clk,ena,x,y,m,p);

    parameter n = 14;

    `include "vm_include.v"

    input   clk;
    input   ena;
    input   [n-1:0] x,y;
    output  [mh:ml] m;
    output  [ph:pl] p;


    reg [n:0] xin, yin, zin;

    always @(posedge clk)begin
        if(ena)begin
            xin <= {x[n-1],x[n-1:0]};
            yin <= {y[n-1],y[n-1:0]};
            zin <= 0;
            end
        end

    wire [n:0] nxin = ~xin +1;
    wire [n:0] nyin = ~yin +1;

    // equations for the initial rotation +/- pi/2
    //
    //  x' = (-d)(y)
    //
    //  y' = (d)(x)
    //
    //  z' = z + (d)(pi/2)     where d = +1 if y<0, -1 otherwise

    reg [n:0] xi, yi, zi;

    wire [n:0] nxi = ~xi +1;
    wire [n:0] nyi = ~yi +1;

    always @(posedge clk)begin
        if(ena)begin

            if(yin[n])begin
                xi <= nyin;
                yi <= xin;
                zi <= atan_ki;
                end
            else begin
                xi <= yin;
                yi <= nxin;
                zi <= natan_ki;
                end
            end
        end

    // equations for the remaining rotations
    //
    // x(i+1) = x(i) - y(i) * d(i) * 2^(-i)
    //
    // y(i+1) = y(i) + x(i) * d(i) * 2^(-i)
    //
    // z(i+1) = z(i) - d(i) * atan(2^(-i))   where d(i) = +1 if y(i) < 0, -1 otherwise

    // 2^(-0) rotation --------------------------------------------------------

    reg [n:0] x0, y0, z0;

    wire [n:0] nx0 = ~x0 +1;
    wire [n:0] ny0 = ~y0 +1;

    always @(posedge clk)begin
        if(ena)begin

            if(yi[n])begin
                x0 <= xi + {{0{nyi[n]}},nyi[n:0]};
                y0 <= yi + {{0{xi[n]}},xi[n:0]};
                z0 <= zi + atan_k0;
                end
            else begin
                x0 <= xi + {{0{yi[n]}},yi[n:0]};
                y0 <= yi + {{0{nxi[n]}},nxi[n:0]};
                z0 <= zi + natan_k0;
                end
            end
        end

    // 2^(-1) rotation --------------------------------------------------------

    reg [n:0] x1, y1, z1;

    wire [n:0] nx1 = ~x1 +1;
    wire [n:0] ny1 = ~y1 +1;

    always @(posedge clk)begin
        if(ena)begin

            if(y0[n])begin
                x1 <= x0 + {{1{ny0[n]}},ny0[n:1]};
                y1 <= y0 + {{1{x0[n]}},x0[n:1]};
                z1 <= z0 + atan_k1;
                end
            else begin
                x1 <= x0 + {{1{y0[n]}},y0[n:1]};
                y1 <= y0 + {{1{nx0[n]}},nx0[n:1]};
                z1 <= z0 + natan_k1;
                end
            end
        end

    // 2^(-2) rotation --------------------------------------------------------

    reg [n:0] x2, y2, z2;

    wire [n:0] nx2 = ~x2 +1;
    wire [n:0] ny2 = ~y2 +1;

    always @(posedge clk)begin
        if(ena)begin

            if(y1[n])begin
                x2 <= x1 + {{2{ny1[n]}},ny1[n:2]};
                y2 <= y1 + {{2{x1[n]}},x1[n:2]};
                z2 <= z1 + atan_k2;
                end
            else begin
                x2 <= x1 + {{2{y1[n]}},y1[n:2]};
                y2 <= y1 + {{2{nx1[n]}},nx1[n:2]};
                z2 <= z1 + natan_k2;
                end
            end
        end

    // 2^(-3) rotation --------------------------------------------------------

    reg [n:0] x3, y3, z3;

    wire [n:0] nx3 = ~x3 +1;
    wire [n:0] ny3 = ~y3 +1;

    always @(posedge clk)begin
        if(ena)begin

            if(y2[n])begin
                x3 <= x2 + {{3{ny2[n]}},ny2[n:3]};
                y3 <= y2 + {{3{x2[n]}},x2[n:3]};
                z3 <= z2 + atan_k3;
                end
            else begin
                x3 <= x2 + {{3{y2[n]}},y2[n:3]};
                y3 <= y2 + {{3{nx2[n]}},nx2[n:3]};
                z3 <= z2 + natan_k3;
                end
            end
        end

    // 2^(-4) rotation --------------------------------------------------------

    reg [n:0] x4, y4, z4;

    wire [n:0] nx4 = ~x4 +1;
    wire [n:0] ny4 = ~y4 +1;

    always @(posedge clk)begin
        if(ena)begin

            if(y3[n])begin
                x4 <= x3 + {{4{ny3[n]}},ny3[n:4]};
                y4 <= y3 + {{4{x3[n]}},x3[n:4]};
                z4 <= z3 + atan_k4;
                end
            else begin
                x4 <= x3 + {{4{y3[n]}},y3[n:4]};
                y4 <= y3 + {{4{nx3[n]}},nx3[n:4]};
                z4 <= z3 + natan_k4;
                end
            end
        end

    // 2^(-5) rotation --------------------------------------------------------

    reg [n:0] x5, y5, z5;

    wire [n:0] nx5 = ~x5 +1;
    wire [n:0] ny5 = ~y5 +1;

    always @(posedge clk)begin
        if(ena)begin

            if(y4[n])begin
                x5 <= x4 + {{5{ny4[n]}},ny4[n:5]};
                y5 <= y4 + {{5{x4[n]}},x4[n:5]};
                z5 <= z4 + atan_k5;
                end
            else begin
                x5 <= x4 + {{5{y4[n]}},y4[n:5]};
                y5 <= y4 + {{5{nx4[n]}},nx4[n:5]};
                z5 <= z4 + natan_k5;
                end
            end
        end

    // 2^(-6) rotation --------------------------------------------------------

    reg [n:0] x6, y6, z6;

    wire [n:0] nx6 = ~x6 +1;
    wire [n:0] ny6 = ~y6 +1;

    always @(posedge clk)begin
        if(ena)begin

            if(y5[n])begin
                x6 <= x5 + {{6{ny5[n]}},ny5[n:6]};
                y6 <= y5 + {{6{x5[n]}},x5[n:6]};
                z6 <= z5 + atan_k6;
                end
            else begin
                x6 <= x5 + {{6{y5[n]}},y5[n:6]};
                y6 <= y5 + {{6{nx5[n]}},nx5[n:6]};
                z6 <= z5 + natan_k6;
                end
            end
        end

    // 2^(-7) rotation --------------------------------------------------------

    reg [n:0] x7, y7, z7;

    wire [n:0] nx7 = ~x7 +1;
    wire [n:0] ny7 = ~y7 +1;

    always @(posedge clk)begin
        if(ena)begin

            if(y6[n])begin
                x7 <= x6 + {{7{ny6[n]}},ny6[n:7]};
                y7 <= y6 + {{7{x6[n]}},x6[n:7]};
                z7 <= z6 + atan_k7;
                end
            else begin
                x7 <= x6 + {{7{y6[n]}},y6[n:7]};
                y7 <= y6 + {{7{nx6[n]}},nx6[n:7]};
                z7 <= z6 + natan_k7;
                end
            end
        end

    // 2^(-8) rotation --------------------------------------------------------

    reg [n:0] x8, y8, z8;

    wire [n:0] nx8 = ~x8 +1;
    wire [n:0] ny8 = ~y8 +1;

    always @(posedge clk)begin
        if(ena)begin
            if(y7[n])begin
                x8 <= x7 + {{8{ny7[n]}},ny7[n:8]};
                y8 <= y7 + {{8{x7[n]}},x7[n:8]};
                z8 <= z7 + atan_k8;
                end
            else begin
                x8 <= x7 + {{8{y7[n]}},y7[n:8]};
                y8 <= y7 + {{8{nx7[n]}},nx7[n:8]};
                z8 <= z7 + natan_k8;
                end
            end
        end

    // 2^(-9) rotation --------------------------------------------------------

    reg [n:0] x9, y9, z9;

    wire [n:0] nx9 = ~x9 +1;
    wire [n:0] ny9 = ~y9 +1;

    always @(posedge clk)begin
        if(ena)begin
            if(y8[n])begin
                x9 <= x8 + {{9{ny8[n]}},ny8[n:9]};
                y9 <= y8 + {{9{x8[n]}},x8[n:9]};
                z9 <= z8 + atan_k9;
                end
            else begin
                x9 <= x8 + {{9{y8[n]}},y8[n:9]};
                y9 <= y8 + {{9{nx8[n]}},nx8[n:9]};
                z9 <= z8 + natan_k9;
                end
            end
        end

    // 2^(-10) rotation --------------------------------------------------------

    reg [n:0] x10, y10, z10;

    wire [n:0] nx10 = ~x10 +1;
    wire [n:0] ny10 = ~y10 +1;

    always @(posedge clk)begin
        if(ena)begin
            if(y9[n])begin
                x10 <= x9 + {{10{ny9[n]}},ny9[n:10]};
                y10 <= y9 + {{10{x9[n]}},x9[n:10]};
                z10 <= z9 + atan_k10;
                end
            else begin
                x10 <= x9 + {{10{y9[n]}},y9[n:10]};
                y10 <= y9 + {{10{nx9[n]}},nx9[n:10]};
                z10 <= z9 + natan_k10;
                end
            end
        end

    // 2^(-11) rotation --------------------------------------------------------

    reg [n:0] x11, y11, z11;

    wire [n:0] nx11 = ~x11 +1;
    wire [n:0] ny11 = ~y11 +1;

    always @(posedge clk)begin
        if(ena)begin
            if(y10[n])begin
                x11 <= x10 + {{11{ny10[n]}},ny10[n:11]};
                y11 <= y10 + {{11{x10[n]}},x10[n:11]};
                z11 <= z10 + atan_k11;
                end
            else begin
                x11 <= x10 + {{11{y10[n]}},y10[n:11]};
                y11 <= y10 + {{11{nx10[n]}},nx10[n:11]};
                z11 <= z10 + natan_k11;
                end
            end
        end

    // output slicing ---------------------------------------------------------

    reg [mh:ml] m;
    reg [ph:pl] p;

    // Scale the magnitude by (2 - 0.25) = 1.75
    wire [mh+1:ml]mX2 = {x11[mh:ml],1'b0};
    wire [mh+1:ml]mDiv4 = {3'b0,x11[mh:ml+2]};
    wire [mh+1:ml]mScaled = mX2 - mDiv4;
    always @(posedge clk)begin
        m <= mScaled[mh+1] ? 13'h1fff : mScaled[mh:ml];
        p <= ~z11[ph:pl] +1;
        end

endmodule

`ifdef SELFTEST
module test ();

parameter n = 14;

reg clk;
reg reset;
initial clk = 0;
always  #5 clk = !clk;

// LO Generator
`ifdef USE_VIVADO_CORES
wire    [47:0]  m_axis;
wire    [17:0]  qDds = m_axis[41:24];
wire    [17:0]  iDds = m_axis[17:0];
dds6p0 dds(
  .aclk(clk),
  .aclken(1'b1),
  .aresetn(!reset),
  .m_axis_data_tdata(m_axis),
  .m_axis_data_tvalid(),
  .s_axis_phase_tdata(32'h0020_0000),
  //.s_axis_phase_tdata(32'hffe0_0000),
  .s_axis_phase_tvalid(1'b1)
);
assign qTx = 18'h0;
`else
wire    [17:0]iDds;
wire    [17:0]qDds;
dds dds (
    .sclr(reset),
    .clk(clk),
    .ce(1'b1),
    .we(1'b1),
    .data(32'h0020_0000),
    .sine(qDds),
    .cosine(iDds)
    );
`endif

wire    [n-1:0]  x = iDds[17:(17-n+1)];
wire    [n-1:0]  y = qDds[17:(17-n+1)];
real xReal;
always @* xReal = (x[n-1] ? x - 16384.0 : x)/8192.0;
real yReal;
always @* yReal = (y[n-1] ? y - 16384.0 : y)/8192.0;
wire [n-2:0]mag;
wire [n-3:0]phase;
real magReal;
always @* magReal = mag/8192.0;
real phaseReal;
always @* phaseReal = (phase[n-3] ? phase - 4096.0 : phase)/2048.0;
vm_cordic #(n) uut(
    .clk(clk),
    .ena(1'b1),
    .x(x), .y(y),
    .m(mag),
    .p(phase));

initial begin
    reset = 0;
    #(2*10) ;
    reset = 1;
    #(2*10) ;
    reset = 0;
    #(1024*1024*10) ;
    $stop;

    end

endmodule

`endif
