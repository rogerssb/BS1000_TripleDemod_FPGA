`timescale 1ns/1ps

module soqpsk2TapMF #(
    parameter   ACOEF = 18'h0,
                BCOEF = 18'h0,
                `ifdef SIMULATE
                CCOEF = $rtoi(0.707107*(2**17))
                `else
                CCOEF = $signed(18'd92682)
                `endif
)
(
    input                       clk,
    input                       reset,
    input                       symEn,
    input                       sym2xEn,
    input       signed  [17:0]  iIn,
    input       signed  [17:0]  qIn,
    output      signed  [17:0]  ipOut,
    output      signed  [17:0]  qpOut,
    output  reg signed  [17:0]  izOut,
    output  reg signed  [17:0]  qzOut,
    output      signed  [17:0]  imOut,
    output      signed  [17:0]  qmOut
);

/*
    For the special case of a two tap, 1 sample per bit matched filter, all the real
    and imaginary tap weights in the impulse response are one of two values, called
    ACOEF and BCOEF in this file. The equations are:

               MFPOut = Outp0 + Outp1 = (I0+jQ0)(A+jB) + (I1+jQ1)(A-jB)
               MFMOut = Outm0 + Outm1 = (I0+jQ0)(B+jA) - (I1+jQ1)(B-jA),

    where A = ACOEF, B = BCOEF, I0/Q0 and I1/Q1 are two consecutive complex input
    samples, and MFPOut and MFMOut are the "plus" and "minus" ternary matched filter
    outputs.

    After expansion and using a one-sample delay line, these outputs can be created from
    four multiply/sums:

                                 SUM0 = IA - QB
                                 SUM1 = IB + QA
                                 SUM2 = IA + QB
                                 SUM3 = IB - QA

*/

    reg     signed  [35:0]  ia0,ib0,qa0,qb0;
    wire    signed  [35:0]  sum00 = ia0 - qb0;
    wire    signed  [35:0]  sum10 = ib0 + qa0;
    wire    signed  [35:0]  sum20 = ia0 + qb0;
    wire    signed  [35:0]  sum30 = ib0 - qa0;
    reg     signed  [35:0]  sum01,sum11,sum21,sum31;
    reg     signed  [35:0]  pReal,pImag;
    reg     signed  [35:0]  mReal,mImag;
    always @(posedge clk) begin
        if (sym2xEn) begin
            ia0 <= iIn * ACOEF;
            ib0 <= iIn * BCOEF;
            qa0 <= qIn * ACOEF;
            qb0 <= qIn * BCOEF;

            sum01 <= sum00;
            sum11 <= sum10;
            sum21 <= sum20;
            sum31 <= sum30;

    `define SOQPSK_2TAPMF_REVERSE
    //`define SOQPSK_REV_PHASE
    `ifdef  SOQPSK_2TAPMF_REVERSE
        `ifdef SOQPSK_REV_PHASE
            mReal <= sum20 + sum01;
            mImag <= -sum30 + sum11;

            pReal <= -sum10 + sum31;
            pImag <= sum00 + sum21;
        `else
            pReal <= sum20 + sum01;
            pImag <= -sum30 + sum11;

            mReal <= -sum10 + sum31;
            mImag <= sum00 + sum21;
        `endif
    `else
        `ifdef SOQPSK_REV_PHASE
            mReal <= sum00 + sum21;
            mImag <= sum10 - sum31;

            pReal <= sum30 - sum11;
            pImag <= sum20 + sum01;
        `else
            pReal <= sum00 + sum21;
            pImag <= sum10 - sum31;

            mReal <= sum30 - sum11;
            mImag <= sum20 + sum01;
        `endif
    `endif
        end
    end

    assign ipOut = $signed(pReal[35:18]);
    assign qpOut = $signed(pImag[35:18]);
    assign imOut = $signed(mReal[35:18]);
    assign qmOut = $signed(mImag[35:18]);

/*
    The "zero" matched filter has coefficients of 1/sqrt(2) * (1 + j*1). So, the
    final output is

               MFZOut =  [(I0+jQ0)*(1+j) + (I1 +jQ1)*(1+j)]/sqrt(2)
               MFZOut = {[(I0-Q0) + (I1-Q1)] + j[(i0+Q0) + (I1+Q1)]}/sqrt(2)

    We define CCOEF to be 1/sqrt(2).

*/

    reg     signed  [35:0]  i0,q0;
    wire    signed  [35:0]  sum0 = i0 + q0;
    wire    signed  [35:0]  diff0 = i0 - q0;
    reg     signed  [35:0]  sum1;
    reg     signed  [35:0]  diff1;
    reg     signed  [35:0]  zReal,zImag;
    always @(posedge clk) begin
        if (sym2xEn) begin
            i0 <= iIn * CCOEF;
            q0 <= qIn * CCOEF;
            //i0 <= iIn;
            //q0 <= qIn;

            sum1 <= sum0;
            diff1 <= diff0;

            zReal <= diff0 + diff1;
            zImag <= sum0 + sum1;
        end
    end

    always @* begin
        case (zReal[35:34])
            //2'b01:      izOut = 18'h1ffff;
            //2'b10:      izOut = 18'h20001;
            //default:    izOut = zReal[34:17];
            default:    izOut = $signed(zReal[35:18]);
        endcase
        case (zImag[35:34])
            //2'b01:      qzOut = 18'h1ffff;
            //2'b10:      qzOut = 18'h20001;
            //default:    qzOut = zImag[34:17];
            default:    qzOut = $signed(zImag[35:18]);
        endcase
    end

endmodule

