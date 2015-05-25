`timescale 1ns/100ps
module cmaEqualizer(
    clk,
    clkEn,
    reset,
    stepSizeExponent,
    refLevel,
    iIn,qIn,
    iOut,qOut,
    wtUpdate
    );

input           clk;
input           clkEn;
input           reset;
input   [2:0]   stepSizeExponent;
input   [17:0]  refLevel;
input   [17:0]  iIn,qIn;
output  [17:0]  iOut,qOut;
input           wtUpdate ;

`define INIT_WEIGHT 18'h1FFFF
`define NUM_TAPS_16

parameter pipeDelay = 5 ;

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// Input conversions to float
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
real inReal = 0.0 ; always @* inReal = $itor($signed(iIn))/(2**17);
real inImag = 0.0 ; always @* inImag = $itor($signed(qIn))/(2**17);
real setPoint = 0.0 ; always @* setPoint = $itor($signed(refLevel))/(2**17);
real stepSize = 0.0 ; always @* stepSize = 2.0**($signed(stepSizeExponent)) ;
real initWeight = $itor($signed(`INIT_WEIGHT)) / (2**17) ;
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// input sample shift register
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
real xReal[36:0],xImag[36:0] ;
always @(posedge clk) begin
    if (reset) begin
        xReal[0] <= 0.0;
        xReal[1] <= 0.0;
        xReal[2] <= 0.0;
        xReal[3] <= 0.0;
        xReal[4] <= 0.0;
        xReal[5] <= 0.0;
        xReal[6] <= 0.0;
        xReal[7] <= 0.0;
        xReal[8] <= 0.0;
        xReal[9] <= 0.0;
        xReal[10] <= 0.0;
        xReal[11] <= 0.0;
        xReal[12] <= 0.0;
        xReal[13] <= 0.0;
        xReal[14] <= 0.0;
        xReal[15] <= 0.0;
        xReal[16] <= 0.0;
        xReal[17] <= 0.0;
        xReal[18] <= 0.0;
        xReal[19] <= 0.0;
        xReal[20] <= 0.0;
        xReal[21] <= 0.0;
        xReal[22] <= 0.0;
        xReal[23] <= 0.0;
        xReal[24] <= 0.0;
        xReal[25] <= 0.0;
        xReal[26] <= 0.0;
        xReal[27] <= 0.0;
        xReal[28] <= 0.0;
        xReal[29] <= 0.0;
        xReal[30] <= 0.0;
        xReal[31] <= 0.0;
        xReal[32] <= 0.0;
        xReal[33] <= 0.0;
        xReal[34] <= 0.0;
        xReal[35] <= 0.0;
        xReal[36] <= 0.0;
        xImag[0] <= 0.0;
        xImag[1] <= 0.0;
        xImag[2] <= 0.0;
        xImag[3] <= 0.0;
        xImag[4] <= 0.0;
        xImag[5] <= 0.0;
        xImag[6] <= 0.0;
        xImag[7] <= 0.0;
        xImag[8] <= 0.0;
        xImag[9] <= 0.0;
        xImag[10] <= 0.0;
        xImag[11] <= 0.0;
        xImag[12] <= 0.0;
        xImag[13] <= 0.0;
        xImag[14] <= 0.0;
        xImag[15] <= 0.0;
        xImag[16] <= 0.0;
        xImag[17] <= 0.0;
        xImag[18] <= 0.0;
        xImag[19] <= 0.0;
        xImag[20] <= 0.0;
        xImag[21] <= 0.0;
        xImag[22] <= 0.0;
        xImag[23] <= 0.0;
        xImag[24] <= 0.0;
        xImag[25] <= 0.0;
        xImag[26] <= 0.0;
        xImag[27] <= 0.0;
        xImag[28] <= 0.0;
        xImag[29] <= 0.0;
        xImag[30] <= 0.0;
        xImag[31] <= 0.0;
        xImag[32] <= 0.0;
        xImag[33] <= 0.0;
        xImag[34] <= 0.0;
        xImag[35] <= 0.0;
		xImag[36] <= 0.0;
        end
    else if (clkEn) begin
        xReal[0] <= inReal;
        xReal[1] <= xReal[0];
        xReal[2] <= xReal[1];
        xReal[3] <= xReal[2];
        xReal[4] <= xReal[3];
        xReal[5] <= xReal[4];
        xReal[6] <= xReal[5];
        xReal[7] <= xReal[6];
        xReal[8] <= xReal[7];
        xReal[9] <= xReal[8];
        xReal[10] <= xReal[9];
        xReal[11] <= xReal[10];
        xReal[12] <= xReal[11];
        xReal[13] <= xReal[12];
        xReal[14] <= xReal[13];
        xReal[15] <= xReal[14];
        xReal[16] <= xReal[15];
        xReal[17] <= xReal[16];
        xReal[18] <= xReal[17];
        xReal[19] <= xReal[18];
        xReal[20] <= xReal[19];
        xReal[21] <= xReal[20];
        xReal[22] <= xReal[21];
        xReal[23] <= xReal[22];
        xReal[24] <= xReal[23];
        xReal[25] <= xReal[24];
        xReal[26] <= xReal[25];
        xReal[27] <= xReal[26];
        xReal[28] <= xReal[27];
        xReal[29] <= xReal[28];
        xReal[30] <= xReal[29];
        xReal[31] <= xReal[30];
        xReal[32] <= xReal[31];
        xReal[33] <= xReal[32];
        xReal[34] <= xReal[33];
        xReal[35] <= xReal[34];
        xImag[0] <= inImag;
        xImag[1] <= xImag[0];
        xImag[2] <= xImag[1];
        xImag[3] <= xImag[2];
        xImag[4] <= xImag[3];
        xImag[5] <= xImag[4];
        xImag[6] <= xImag[5];
        xImag[7] <= xImag[6];
        xImag[8] <= xImag[7];
        xImag[9] <= xImag[8];
        xImag[10] <= xImag[9];
        xImag[11] <= xImag[10];
        xImag[12] <= xImag[11];
        xImag[13] <= xImag[12];
        xImag[14] <= xImag[13];
        xImag[15] <= xImag[14];
        xImag[16] <= xImag[15];
        xImag[17] <= xImag[16];
        xImag[18] <= xImag[17];
        xImag[19] <= xImag[18];
        xImag[20] <= xImag[19];
        xImag[21] <= xImag[20];
        xImag[22] <= xImag[21];
        xImag[23] <= xImag[22];
        xImag[24] <= xImag[23];
        xImag[25] <= xImag[24];
        xImag[26] <= xImag[25];
        xImag[27] <= xImag[26];
        xImag[28] <= xImag[27];
        xImag[29] <= xImag[28];
        xImag[30] <= xImag[29];
        xImag[31] <= xImag[30];
        xImag[32] <= xImag[31];
        xImag[33] <= xImag[32];
        xImag[34] <= xImag[33];
        xImag[35] <= xImag[34];
        end
    end
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// tap outputs
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
real    w0Real,w1Real,w2Real,w3Real,w4Real,w5Real,w6Real,w7Real,w8Real,w9Real,w10Real,w11Real,w12Real,w13Real,w14Real,w15Real,w16Real,w17Real,w18Real,w19Real,w20Real,w21Real,w22Real,w23Real,w24Real,w25Real,w26Real,w27Real,w28Real,w29Real,w30Real,w31Real;
real    w0Imag,w1Imag,w2Imag,w3Imag,w4Imag,w5Imag,w6Imag,w7Imag,w8Imag,w9Imag,w10Imag,w11Imag,w12Imag,w13Imag,w14Imag,w15Imag,w16Imag,w17Imag,w18Imag,w19Imag,w20Imag,w21Imag,w22Imag,w23Imag,w24Imag,w25Imag,w26Imag,w27Imag,w28Imag,w29Imag,w30Imag,w31Imag;
real    tap0Real,tap1Real,tap2Real,tap3Real,tap4Real,tap5Real,tap6Real,tap7Real,tap8Real,tap9Real,tap10Real,tap11Real,tap12Real,tap13Real,tap14Real,tap15Real,tap16Real,tap17Real,tap18Real,tap19Real,tap20Real,tap21Real,tap22Real,tap23Real,tap24Real,tap25Real,tap26Real,tap27Real,tap28Real,tap29Real,tap30Real,tap31Real;
real    tap0Imag,tap1Imag,tap2Imag,tap3Imag,tap4Imag,tap5Imag,tap6Imag,tap7Imag,tap8Imag,tap9Imag,tap10Imag,tap11Imag,tap12Imag,tap13Imag,tap14Imag,tap15Imag,tap16Imag,tap17Imag,tap18Imag,tap19Imag,tap20Imag,tap21Imag,tap22Imag,tap23Imag,tap24Imag,tap25Imag,tap26Imag,tap27Imag,tap28Imag,tap29Imag,tap30Imag,tap31Imag;
always @ (posedge clk) begin // pipeline delay no. 1 ~~~~~~~~~~~~~~~~~~~~~~~~~~
    if (reset) begin
        tap0Real <= 0.0 ;
        tap1Real <= 0.0 ;
        tap2Real <= 0.0 ;
        tap3Real <= 0.0 ;
        tap4Real <= 0.0 ;
        tap5Real <= 0.0 ;
        tap6Real <= 0.0 ;
        tap7Real <= 0.0 ;
        tap8Real <= 0.0 ;
        tap9Real <= 0.0 ;
        tap10Real <= 0.0 ;
        tap11Real <= 0.0 ;
        tap12Real <= 0.0 ;
        tap13Real <= 0.0 ;
        tap14Real <= 0.0 ;
        tap15Real <= 0.0 ;
        tap16Real <= 0.0 ;
        tap17Real <= 0.0 ;
        tap18Real <= 0.0 ;
        tap19Real <= 0.0 ;
        tap20Real <= 0.0 ;
        tap21Real <= 0.0 ;
        tap22Real <= 0.0 ;
        tap23Real <= 0.0 ;
        tap24Real <= 0.0 ;
        tap25Real <= 0.0 ;
        tap26Real <= 0.0 ;
        tap27Real <= 0.0 ;
        tap28Real <= 0.0 ;
        tap29Real <= 0.0 ;
        tap30Real <= 0.0 ;
        tap31Real <= 0.0 ;
        tap0Imag <= 0.0 ;
        tap1Imag <= 0.0 ;
        tap2Imag <= 0.0 ;
        tap3Imag <= 0.0 ;
        tap4Imag <= 0.0 ;
        tap5Imag <= 0.0 ;
        tap6Imag <= 0.0 ;
        tap7Imag <= 0.0 ;
        tap8Imag <= 0.0 ;
        tap9Imag <= 0.0 ;
        tap10Imag <= 0.0 ;
        tap11Imag <= 0.0 ;
        tap12Imag <= 0.0 ;
        tap13Imag <= 0.0 ;
        tap14Imag <= 0.0 ;
        tap15Imag <= 0.0 ;
        tap16Imag <= 0.0 ;
        tap17Imag <= 0.0 ;
        tap18Imag <= 0.0 ;
        tap19Imag <= 0.0 ;
        tap20Imag <= 0.0 ;
        tap21Imag <= 0.0 ;
        tap22Imag <= 0.0 ;
        tap23Imag <= 0.0 ;
        tap24Imag <= 0.0 ;
        tap25Imag <= 0.0 ;
        tap26Imag <= 0.0 ;
        tap27Imag <= 0.0 ;
        tap28Imag <= 0.0 ;
        tap29Imag <= 0.0 ;
        tap30Imag <= 0.0 ;
        tap31Imag <= 0.0 ;
        end
    else if (clkEn) begin
        tap0Real <= xReal[0]*w0Real - xImag[0]*w0Imag;
        tap1Real <= xReal[1]*w1Real - xImag[1]*w1Imag;
        tap2Real <= xReal[2]*w2Real - xImag[2]*w2Imag;
        tap3Real <= xReal[3]*w3Real - xImag[3]*w3Imag;
        tap4Real <= xReal[4]*w4Real - xImag[4]*w4Imag;
        tap5Real <= xReal[5]*w5Real - xImag[5]*w5Imag;
        tap6Real <= xReal[6]*w6Real - xImag[6]*w6Imag;
        tap7Real <= xReal[7]*w7Real - xImag[7]*w7Imag;
        tap8Real <= xReal[8]*w8Real - xImag[8]*w8Imag;
        tap9Real <= xReal[9]*w9Real - xImag[9]*w9Imag;
        tap10Real <= xReal[10]*w10Real - xImag[10]*w10Imag;
        tap11Real <= xReal[11]*w11Real - xImag[11]*w11Imag;
        tap12Real <= xReal[12]*w12Real - xImag[12]*w12Imag;
        tap13Real <= xReal[13]*w13Real - xImag[13]*w13Imag;
        tap14Real <= xReal[14]*w14Real - xImag[14]*w14Imag;
        tap15Real <= xReal[15]*w15Real - xImag[15]*w15Imag;
        tap16Real <= xReal[16]*w16Real - xImag[16]*w16Imag;
        tap17Real <= xReal[17]*w17Real - xImag[17]*w17Imag;
        tap18Real <= xReal[18]*w18Real - xImag[18]*w18Imag;
        tap19Real <= xReal[19]*w19Real - xImag[19]*w19Imag;
        tap20Real <= xReal[20]*w20Real - xImag[20]*w20Imag;
        tap21Real <= xReal[21]*w21Real - xImag[21]*w21Imag;
        tap22Real <= xReal[22]*w22Real - xImag[22]*w22Imag;
        tap23Real <= xReal[23]*w23Real - xImag[23]*w23Imag;
        tap24Real <= xReal[24]*w24Real - xImag[24]*w24Imag;
        tap25Real <= xReal[25]*w25Real - xImag[25]*w25Imag;
        tap26Real <= xReal[26]*w26Real - xImag[26]*w26Imag;
        tap27Real <= xReal[27]*w27Real - xImag[27]*w27Imag;
        tap28Real <= xReal[28]*w28Real - xImag[28]*w28Imag;
        tap29Real <= xReal[29]*w29Real - xImag[29]*w29Imag;
        tap30Real <= xReal[30]*w30Real - xImag[30]*w30Imag;
        tap31Real <= xReal[31]*w31Real - xImag[31]*w31Imag;
        tap0Imag <= xReal[0]*w0Imag + xImag[0]*w0Real;
        tap1Imag <= xReal[1]*w1Imag + xImag[1]*w1Real;
        tap2Imag <= xReal[2]*w2Imag + xImag[2]*w2Real;
        tap3Imag <= xReal[3]*w3Imag + xImag[3]*w3Real;
        tap4Imag <= xReal[4]*w4Imag + xImag[4]*w4Real;
        tap5Imag <= xReal[5]*w5Imag + xImag[5]*w5Real;
        tap6Imag <= xReal[6]*w6Imag + xImag[6]*w6Real;
        tap7Imag <= xReal[7]*w7Imag + xImag[7]*w7Real;
        tap8Imag <= xReal[8]*w8Imag + xImag[8]*w8Real;
        tap9Imag <= xReal[9]*w9Imag + xImag[9]*w9Real;
        tap10Imag <= xReal[10]*w10Imag + xImag[10]*w10Real;
        tap11Imag <= xReal[11]*w11Imag + xImag[11]*w11Real;
        tap12Imag <= xReal[12]*w12Imag + xImag[12]*w12Real;
        tap13Imag <= xReal[13]*w13Imag + xImag[13]*w13Real;
        tap14Imag <= xReal[14]*w14Imag + xImag[14]*w14Real;
        tap15Imag <= xReal[15]*w15Imag + xImag[15]*w15Real;
        tap16Imag <= xReal[16]*w16Imag + xImag[16]*w16Real;
        tap17Imag <= xReal[17]*w17Imag + xImag[17]*w17Real;
        tap18Imag <= xReal[18]*w18Imag + xImag[18]*w18Real;
        tap19Imag <= xReal[19]*w19Imag + xImag[19]*w19Real;
        tap20Imag <= xReal[20]*w20Imag + xImag[20]*w20Real;
        tap21Imag <= xReal[21]*w21Imag + xImag[21]*w21Real;
        tap22Imag <= xReal[22]*w22Imag + xImag[22]*w22Real;
        tap23Imag <= xReal[23]*w23Imag + xImag[23]*w23Real;
        tap24Imag <= xReal[24]*w24Imag + xImag[24]*w24Real;
        tap25Imag <= xReal[25]*w25Imag + xImag[25]*w25Real;
        tap26Imag <= xReal[26]*w26Imag + xImag[26]*w26Real;
        tap27Imag <= xReal[27]*w27Imag + xImag[27]*w27Real;
        tap28Imag <= xReal[28]*w28Imag + xImag[28]*w28Real;
        tap29Imag <= xReal[29]*w29Imag + xImag[29]*w29Real;
        tap30Imag <= xReal[30]*w30Imag + xImag[30]*w30Real;
        tap31Imag <= xReal[31]*w31Imag + xImag[31]*w31Real;
        end
    end
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// tap outputs summations
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
real sumReal,outReal,sumImag,outImag ;
always @ (posedge clk) begin // pipeline delay nos. #2 and #3 ~~~~~~~~~~~~~~~~~
    if (reset) begin
        sumReal <= 0.0 ;
        outReal <= 0.0 ;
        sumImag <= 0.0 ;
        outImag <= 0.0 ;
        end
    else if (clkEn) begin
        sumReal <=
              tap0Real + tap1Real
            + tap2Real + tap3Real
            + tap4Real + tap5Real
            + tap6Real + tap7Real
            + tap8Real + tap9Real
            + tap10Real + tap11Real
            + tap12Real + tap13Real
            + tap14Real + tap15Real
        `ifndef NUM_TAPS_16
            + tap16Real + tap17Real
        `ifndef NUM_TAPS_18
            + tap18Real + tap19Real
        `ifndef NUM_TAPS_20
            + tap20Real + tap21Real
        `ifndef NUM_TAPS_22
            + tap22Real + tap23Real
        `ifndef NUM_TAPS_24
            + tap24Real + tap25Real
        `ifndef NUM_TAPS_26
            + tap26Real + tap27Real
        `ifndef NUM_TAPS_28
            + tap28Real + tap29Real
        `endif //NUM_TAPS_28
        `endif //NUM_TAPS_26
        `endif //NUM_TAPS_24
        `endif //NUM_TAPS_22
        `endif //NUM_TAPS_20
        `endif //NUM_TAPS_18
        `endif //NUM_TAPS_16
        ;
        outReal <= sumReal ;

       sumImag <=
              tap0Imag + tap1Imag
            + tap2Imag + tap3Imag
            + tap4Imag + tap5Imag
            + tap6Imag + tap7Imag
            + tap8Imag + tap9Imag
            + tap10Imag + tap11Imag
            + tap12Imag + tap13Imag
            + tap14Imag + tap15Imag
        `ifndef NUM_TAPS_16
            + tap16Imag + tap17Imag
        `ifndef NUM_TAPS_18
            + tap18Imag + tap19Imag
        `ifndef NUM_TAPS_20
            + tap20Imag + tap21Imag
        `ifndef NUM_TAPS_22
            + tap22Imag + tap23Imag
        `ifndef NUM_TAPS_24
            + tap24Imag + tap25Imag
        `ifndef NUM_TAPS_26
            + tap26Imag + tap27Imag
        `ifndef NUM_TAPS_28
            + tap28Imag + tap29Imag
        `endif //NUM_TAPS_28
        `endif //NUM_TAPS_26
        `endif //NUM_TAPS_24
        `endif //NUM_TAPS_22
        `endif //NUM_TAPS_20
        `endif //NUM_TAPS_18
        `endif //NUM_TAPS_16
        ;
        outImag <= sumImag ;
        end
    end
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// Output conversions to integer
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
integer iInt = 0 ; always @* iInt = $rtoi(outReal * (2**17));
assign iOut = iInt;
integer qInt = 0 ; always @* qInt = $rtoi(outImag * (2**17));
assign qOut = qInt;
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// Error
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
real mag = 0.0 ; always @* mag <= outReal*outReal + outImag*outImag;
real diff = 0.0 ; always @* diff <= setPoint - mag;

real diff_reg = 0.0 ;
real iOut_reg = 0.0 ;
real qOut_reg = 0.0 ;
real errorReal = 0.0 ;
real errorImag = 0.0 ;
always @ (posedge clk) begin // pipeline delay nos. 4 & 5 ~~~~~~~~~~~~~~~~~~~~~
    if (reset) begin
        diff_reg <= 0.0 ;
        iOut_reg <= 0.0 ;
        qOut_reg <= 0.0 ;
        errorReal <= 0.0 ;
        errorImag <= 0.0 ;
        end
    else if (clkEn) begin
        diff_reg <= diff ;
        iOut_reg <= outReal ;
        qOut_reg <= outImag ;
        errorReal <= stepSize * diff_reg * iOut_reg ;
        errorImag <= stepSize * diff_reg * qOut_reg ;
        end
    end
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// Weight update
//(xr - jxi)*(er + jei) = (xr*er + xi*ei) + j(xr*ei - xi*er)
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
always @(posedge clk) begin
    if (reset) begin
        w0Real <= 0.0 ;
        w1Real <= 0.0 ;
        w2Real <= initWeight ;
        w3Real <= 0.0  ;
        w4Real <= 0.0  ;
        w5Real <= 0.0 ;
        w6Real <= 0.0;
        w7Real <= 0.0 ;
        w8Real <= 0.0 ;
        w9Real <= 0.0 ;
        w10Real <= 0.0 ;
        w11Real <= 0.0 ;
        w12Real <= 0.0 ;
        w13Real <= 0.0 ;
        w14Real <= 0.0 ;
        w15Real <= 0.0 ;
        w16Real <= 0.0 ;
        w17Real <= 0.0 ;
        w18Real <= 0.0 ;
        w19Real <= 0.0 ;
        w20Real <= 0.0 ;
        w21Real <= 0.0 ;
        w22Real <= 0.0 ;
        w23Real <= 0.0 ;
        w24Real <= 0.0 ;
        w25Real <= 0.0 ;
        w26Real <= 0.0 ;
        w27Real <= 0.0 ;
        w28Real <= 0.0 ;
        w29Real <= 0.0 ;
        w30Real <= 0.0 ;
        w31Real <= 0.0 ;
        w0Imag <= 0.0 ;
        w1Imag <= 0.0 ;
        w2Imag <= 0.0 ;
        w3Imag <= 0.0 ;
        w4Imag <= 0.0 ;
        w5Imag <= 0.0 ;
        w6Imag <= 0.0 ;
        w7Imag <= 0.0 ;
        w8Imag <= 0.0 ;
        w9Imag <= 0.0 ;
        w10Imag <= 0.0 ;
        w11Imag <= 0.0 ;
        w12Imag <= 0.0 ;
        w13Imag <= 0.0 ;
        w14Imag <= 0.0 ;
        w15Imag <= 0.0 ;
        w16Imag <= 0.0 ;
        w17Imag <= 0.0 ;
        w18Imag <= 0.0 ;
        w19Imag <= 0.0 ;
        w20Imag <= 0.0 ;
        w21Imag <= 0.0 ;
        w22Imag <= 0.0 ;
        w23Imag <= 0.0 ;
        w24Imag <= 0.0 ;
        w25Imag <= 0.0 ;
        w26Imag <= 0.0 ;
        w27Imag <= 0.0 ;
        w28Imag <= 0.0 ;
        w29Imag <= 0.0 ;
        w30Imag <= 0.0 ;
        w31Imag <= 0.0 ;
        end
    else if (clkEn) begin
        if (wtUpdate) begin
            w0Real <= w0Real + errorReal*xReal[0+pipeDelay] + errorImag*xImag[0+pipeDelay] ;
            w1Real <= w1Real + errorReal*xReal[1+pipeDelay] + errorImag*xImag[1+pipeDelay] ;
            w2Real <= w2Real + errorReal*xReal[2+pipeDelay] + errorImag*xImag[2+pipeDelay] ;
            w3Real <= w3Real + errorReal*xReal[3+pipeDelay] + errorImag*xImag[3+pipeDelay] ;
            w4Real <= w4Real + errorReal*xReal[4+pipeDelay] + errorImag*xImag[4+pipeDelay] ;
            w5Real <= w5Real + errorReal*xReal[5+pipeDelay] + errorImag*xImag[5+pipeDelay] ;
            w6Real <= w6Real + errorReal*xReal[6+pipeDelay] + errorImag*xImag[6+pipeDelay] ;
            w7Real <= w7Real + errorReal*xReal[7+pipeDelay] + errorImag*xImag[7+pipeDelay] ;
            w8Real <= w8Real + errorReal*xReal[8+pipeDelay] + errorImag*xImag[8+pipeDelay] ;
            w9Real <= w9Real + errorReal*xReal[9+pipeDelay] + errorImag*xImag[9+pipeDelay] ;
            w10Real <= w10Real + errorReal*xReal[10+pipeDelay] + errorImag*xImag[10+pipeDelay] ;
            w11Real <= w11Real + errorReal*xReal[11+pipeDelay] + errorImag*xImag[11+pipeDelay] ;
            w12Real <= w12Real + errorReal*xReal[12+pipeDelay] + errorImag*xImag[12+pipeDelay] ;
            w13Real <= w13Real + errorReal*xReal[13+pipeDelay] + errorImag*xImag[13+pipeDelay] ;
            w14Real <= w14Real + errorReal*xReal[14+pipeDelay] + errorImag*xImag[14+pipeDelay] ;
            w15Real <= w15Real + errorReal*xReal[15+pipeDelay] + errorImag*xImag[15+pipeDelay] ;
            w16Real <= w16Real + errorReal*xReal[16+pipeDelay] + errorImag*xImag[16+pipeDelay] ;
            w17Real <= w17Real + errorReal*xReal[17+pipeDelay] + errorImag*xImag[17+pipeDelay] ;
            w18Real <= w18Real + errorReal*xReal[18+pipeDelay] + errorImag*xImag[18+pipeDelay] ;
            w19Real <= w19Real + errorReal*xReal[19+pipeDelay] + errorImag*xImag[19+pipeDelay] ;
            w20Real <= w20Real + errorReal*xReal[20+pipeDelay] + errorImag*xImag[20+pipeDelay] ;
            w21Real <= w21Real + errorReal*xReal[21+pipeDelay] + errorImag*xImag[21+pipeDelay] ;
            w22Real <= w22Real + errorReal*xReal[22+pipeDelay] + errorImag*xImag[22+pipeDelay] ;
            w23Real <= w23Real + errorReal*xReal[23+pipeDelay] + errorImag*xImag[23+pipeDelay] ;
            w24Real <= w24Real + errorReal*xReal[24+pipeDelay] + errorImag*xImag[24+pipeDelay] ;
            w25Real <= w25Real + errorReal*xReal[25+pipeDelay] + errorImag*xImag[25+pipeDelay] ;
            w26Real <= w26Real + errorReal*xReal[26+pipeDelay] + errorImag*xImag[26+pipeDelay] ;
            w27Real <= w27Real + errorReal*xReal[27+pipeDelay] + errorImag*xImag[27+pipeDelay] ;
            w28Real <= w28Real + errorReal*xReal[28+pipeDelay] + errorImag*xImag[28+pipeDelay] ;
            w29Real <= w29Real + errorReal*xReal[29+pipeDelay] + errorImag*xImag[29+pipeDelay] ;
            w30Real <= w30Real + errorReal*xReal[30+pipeDelay] + errorImag*xImag[30+pipeDelay] ;
            w31Real <= w31Real + errorReal*xReal[31+pipeDelay] + errorImag*xImag[31+pipeDelay] ;
            w0Imag <= w0Imag - errorReal*xImag[0+pipeDelay] + errorImag*xReal[0+pipeDelay] ;
            w1Imag <= w1Imag - errorReal*xImag[1+pipeDelay] + errorImag*xReal[1+pipeDelay] ;
            w2Imag <= w2Imag - errorReal*xImag[2+pipeDelay] + errorImag*xReal[2+pipeDelay] ;
            w3Imag <= w3Imag - errorReal*xImag[3+pipeDelay] + errorImag*xReal[3+pipeDelay] ;
            w4Imag <= w4Imag - errorReal*xImag[4+pipeDelay] + errorImag*xReal[4+pipeDelay] ;
            w5Imag <= w5Imag - errorReal*xImag[5+pipeDelay] + errorImag*xReal[5+pipeDelay] ;
            w6Imag <= w6Imag - errorReal*xImag[6+pipeDelay] + errorImag*xReal[6+pipeDelay] ;
            w7Imag <= w7Imag - errorReal*xImag[7+pipeDelay] + errorImag*xReal[7+pipeDelay] ;
            w8Imag <= w8Imag - errorReal*xImag[8+pipeDelay] + errorImag*xReal[8+pipeDelay] ;
            w9Imag <= w9Imag - errorReal*xImag[9+pipeDelay] + errorImag*xReal[9+pipeDelay] ;
            w10Imag <= w10Imag - errorReal*xImag[10+pipeDelay] + errorImag*xReal[10+pipeDelay] ;
            w11Imag <= w11Imag - errorReal*xImag[11+pipeDelay] + errorImag*xReal[11+pipeDelay] ;
            w12Imag <= w12Imag - errorReal*xImag[12+pipeDelay] + errorImag*xReal[12+pipeDelay] ;
            w13Imag <= w13Imag - errorReal*xImag[13+pipeDelay] + errorImag*xReal[13+pipeDelay] ;
            w14Imag <= w14Imag - errorReal*xImag[14+pipeDelay] + errorImag*xReal[14+pipeDelay] ;
            w15Imag <= w15Imag - errorReal*xImag[15+pipeDelay] + errorImag*xReal[15+pipeDelay] ;
            w16Imag <= w16Imag - errorReal*xImag[16+pipeDelay] + errorImag*xReal[16+pipeDelay] ;
            w17Imag <= w17Imag - errorReal*xImag[17+pipeDelay] + errorImag*xReal[17+pipeDelay] ;
            w18Imag <= w18Imag - errorReal*xImag[18+pipeDelay] + errorImag*xReal[18+pipeDelay] ;
            w19Imag <= w19Imag - errorReal*xImag[19+pipeDelay] + errorImag*xReal[19+pipeDelay] ;
            w20Imag <= w20Imag - errorReal*xImag[20+pipeDelay] + errorImag*xReal[20+pipeDelay] ;
            w21Imag <= w21Imag - errorReal*xImag[21+pipeDelay] + errorImag*xReal[21+pipeDelay] ;
            w22Imag <= w22Imag - errorReal*xImag[22+pipeDelay] + errorImag*xReal[22+pipeDelay] ;
            w23Imag <= w23Imag - errorReal*xImag[23+pipeDelay] + errorImag*xReal[23+pipeDelay] ;
            w24Imag <= w24Imag - errorReal*xImag[24+pipeDelay] + errorImag*xReal[24+pipeDelay] ;
            w25Imag <= w25Imag - errorReal*xImag[25+pipeDelay] + errorImag*xReal[25+pipeDelay] ;
            w26Imag <= w26Imag - errorReal*xImag[26+pipeDelay] + errorImag*xReal[26+pipeDelay] ;
            w27Imag <= w27Imag - errorReal*xImag[27+pipeDelay] + errorImag*xReal[27+pipeDelay] ;
            w28Imag <= w28Imag - errorReal*xImag[28+pipeDelay] + errorImag*xReal[28+pipeDelay] ;
            w29Imag <= w29Imag - errorReal*xImag[29+pipeDelay] + errorImag*xReal[29+pipeDelay] ;
            w30Imag <= w30Imag - errorReal*xImag[30+pipeDelay] + errorImag*xReal[30+pipeDelay] ;
            w31Imag <= w31Imag - errorReal*xImag[31+pipeDelay] + errorImag*xReal[31+pipeDelay] ;
            end
        end
    end

integer file1 ; initial file1 = $fopen("src/floatsPipedParam_mag_26_1.dat") ;
integer k = 0 ;
always @ (posedge clk) begin
    if (clkEn) begin
        if ($time > 1_200_000) begin
            k = k + 1 ;
            if (k % 100 == 0) begin
                $fdisplay(file1, "%f",mag) ;
                end
            end
        end
    end

endmodule
