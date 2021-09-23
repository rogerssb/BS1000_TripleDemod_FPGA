/******************************************************************************
Copyright 2008-2015 Koos Technical Services, Inc. All Rights Reserved

This source code is the Intellectual Property of Koos Technical Services,Inc.
(KTS) and is provided under a License Agreement which protects KTS' ownership and
derivative rights in exchange for negotiated compensation.
******************************************************************************/
`timescale 1ns/100ps


/*
Reduce to three multipliers:
pr = ar*br - ai*bi = ar*br + (ar*bi - ar*bi) - ai*bi
   = (ar*br - ar*bi) + (ar*bi - ai*bi)
   = ar*(br - bi) + (ar - ai)*bi
pi = ar*bi + ai*br
   = ar*bi + (ai*bi - ai*bi) + ai*br
   = (ai*br + ai*bi) + (ar*bi - ai*bi)
   = ai*(br + bi) + (ar - ai)*bi
*/

module cmpy18WithCePL1(
    input                       clk,
    input                       clkEn,
    input                       reset,
    input       signed  [17:0]  aReal,aImag,
    input       signed  [17:0]  bReal,bImag,
    output  reg signed  [17:0]  pReal,pImag
);

    wire    signed  [18:0]  arMinusAi = aReal - aImag;
    wire    signed  [18:0]  brMinusBi = bReal - bImag;
    wire    signed  [18:0]  brPlusBi = bReal + bImag;
    wire    signed  [36:0]  prTerm1 = aReal * brMinusBi;
    wire    signed  [36:0]  piTerm1 = aImag * brPlusBi;
    wire    signed  [36:0]  commonTerm = bImag * arMinusAi;
    wire    signed  [36:0]  prSum = prTerm1 + commonTerm;
    wire    signed  [36:0]  piSum = piTerm1 + commonTerm;

    always @(posedge clk) begin
        if (clkEn) begin
            if (prSum[36] & (!prSum[35] | !prSum[34])) begin
                pReal <= 18'h20001;
            end
            else if (!prSum[36] & (prSum[35] | prSum[34])) begin
                pReal <= 18'h1ffff;
            end
            else begin
                pReal <= $signed(prSum[34:17]);
            end
            if (piSum[36] & (!piSum[35] | !piSum[34])) begin
                pImag <= 18'h20001;
            end
            else if (!piSum[36] & (piSum[35] | piSum[34])) begin
                pImag <= 18'h1ffff;
            end
            else begin
                pImag <= $signed(piSum[34:17]);
            end
        end
    end

endmodule
