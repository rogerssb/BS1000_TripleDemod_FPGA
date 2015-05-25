`timescale 1ns/100ps
module cmaEqualizer(
    clk,
    clkEn,
    reset,
    stepSizeExponent,
    refLevel,
    iIn,qIn,
    iOut,qOut
    );

input           clk;
input           clkEn;
input           reset;
input   [2:0]   stepSizeExponent;
input   [17:0]  refLevel;
input   [17:0]  iIn,qIn;
output  [17:0]  iOut,qOut;

real inReal ; always @* inReal = $itor($signed(iIn))/(2**17);
real inImag ; always @* inImag = $itor($signed(qIn))/(2**17);

// Filter Weights
real    w0Real,  w1Real,  w2Real,  w3Real;
real    w4Real,  w5Real,  w6Real,  w7Real;
real    w8Real,  w9Real,  w10Real, w11Real;
real    w12Real, w13Real, w14Real, w15Real;
real    w0Imag,  w1Imag,  w2Imag,  w3Imag;
real    w4Imag,  w5Imag,  w6Imag,  w7Imag;
real    w8Imag,  w9Imag,  w10Imag, w11Imag;
real    w12Imag, w13Imag, w14Imag, w15Imag;

// input sample shift register
real    x0Real,  x1Real,  x2Real,  x3Real;
real    x4Real,  x5Real,  x6Real,  x7Real;
real    x8Real,  x9Real,  x10Real, x11Real;
real    x12Real, x13Real, x14Real, x15Real;
real    x16Real, x17Real;
real    x0Imag,  x1Imag,  x2Imag,  x3Imag;
real    x4Imag,  x5Imag,  x6Imag,  x7Imag;
real    x8Imag,  x9Imag,  x10Imag, x11Imag;
real    x12Imag, x13Imag, x14Imag, x15Imag;
always @(posedge clk) begin
    if (reset) begin
        x0Real <= 0.0;
        x0Imag <= 0.0;
        x1Real <= 0.0;
        x1Imag <= 0.0;
        x2Real <= 0.0;
        x2Imag <= 0.0;
        x3Real <= 0.0;
        x3Imag <= 0.0;
        x4Real <= 0.0;
        x4Imag <= 0.0;
        x5Real <= 0.0;
        x5Imag <= 0.0;
        x6Real <= 0.0;
        x6Imag <= 0.0;
        x7Real <= 0.0;
        x7Imag <= 0.0;
        x8Real <= 0.0;
        x8Imag <= 0.0;
        x9Real <= 0.0;
        x9Imag <= 0.0;
        x10Real <= 0.0;
        x10Imag <= 0.0;
        x11Real <= 0.0;
        x11Imag <= 0.0;
        x12Real <= 0.0;
        x12Imag <= 0.0;
        x13Real <= 0.0;
        x13Imag <= 0.0;
        x14Real <= 0.0;
        x14Imag <= 0.0;
        x15Real <= 0.0;
        x15Imag <= 0.0;
        end
    else if (clkEn) begin
        x0Real <= inReal;
        x0Imag <= inImag;
        x1Real <= x0Real;
        x1Imag <= x0Imag;
        x2Real <= x1Real;
        x2Imag <= x1Imag;
        x3Real <= x2Real;
        x3Imag <= x2Imag;
        x4Real <= x3Real;
        x4Imag <= x3Imag;
        x5Real <= x4Real;
        x5Imag <= x4Imag;
        x6Real <= x5Real;
        x6Imag <= x5Imag;
        x7Real <= x6Real;
        x7Imag <= x6Imag;
        x8Real <= x7Real;
        x8Imag <= x7Imag;
        x9Real <= x8Real;
        x9Imag <= x8Imag;
        x10Real <= x9Real;
        x10Imag <= x9Imag;
        x11Real <= x10Real;
        x11Imag <= x10Imag;
        x12Real <= x11Real;
        x12Imag <= x11Imag;
        x13Real <= x12Real;
        x13Imag <= x12Imag;
        x14Real <= x13Real;
        x14Imag <= x13Imag;
        x15Real <= x14Real;
        x15Imag <= x14Imag;
        end
    end

// equalizer output
real tap0Real = 0.0 ; always @* tap0Real = x0Real*w0Real - x0Imag*w0Imag;
real tap0Imag = 0.0 ; always @* tap0Imag = x0Real*w0Imag + x0Imag*w0Real;
real tap1Real = 0.0 ; always @* tap1Real = x1Real*w1Real - x1Imag*w1Imag;
real tap1Imag = 0.0 ; always @* tap1Imag = x1Real*w1Imag + x1Imag*w1Real;
real tap2Real = 0.0 ; always @* tap2Real = x2Real*w2Real - x2Imag*w2Imag;
real tap2Imag = 0.0 ; always @* tap2Imag = x2Real*w2Imag + x2Imag*w2Real;
real tap3Real = 0.0 ; always @* tap3Real = x3Real*w3Real - x3Imag*w3Imag;
real tap3Imag = 0.0 ; always @* tap3Imag = x3Real*w3Imag + x3Imag*w3Real;
real tap4Real = 0.0 ; always @* tap4Real = x4Real*w4Real - x4Imag*w4Imag;
real tap4Imag = 0.0 ; always @* tap4Imag = x4Real*w4Imag + x4Imag*w4Real;
real tap5Real = 0.0 ; always @* tap5Real = x5Real*w5Real - x5Imag*w5Imag;
real tap5Imag = 0.0 ; always @* tap5Imag = x5Real*w5Imag + x5Imag*w5Real;
real tap6Real = 0.0 ; always @* tap6Real = x6Real*w6Real - x6Imag*w6Imag;
real tap6Imag = 0.0 ; always @* tap6Imag = x6Real*w6Imag + x6Imag*w6Real;
real tap7Real = 0.0 ; always @* tap7Real = x7Real*w7Real - x7Imag*w7Imag;
real tap7Imag = 0.0 ; always @* tap7Imag = x7Real*w7Imag + x7Imag*w7Real;
real tap8Real = 0.0 ; always @* tap8Real = x8Real*w8Real - x8Imag*w8Imag;
real tap8Imag = 0.0 ; always @* tap8Imag = x8Real*w8Imag + x8Imag*w8Real;
real tap9Real = 0.0 ; always @* tap9Real = x9Real*w9Real - x9Imag*w9Imag;
real tap9Imag = 0.0 ; always @* tap9Imag = x9Real*w9Imag + x9Imag*w9Real;
real tap10Real = 0.0 ; always @* tap10Real = x10Real*w10Real - x10Imag*w10Imag;
real tap10Imag = 0.0 ; always @* tap10Imag = x10Real*w10Imag + x10Imag*w10Real;
real tap11Real = 0.0 ; always @* tap11Real = x11Real*w11Real - x11Imag*w11Imag;
real tap11Imag = 0.0 ; always @* tap11Imag = x11Real*w11Imag + x11Imag*w11Real;
real tap12Real = 0.0 ; always @* tap12Real = x12Real*w12Real - x12Imag*w12Imag;
real tap12Imag = 0.0 ; always @* tap12Imag = x12Real*w12Imag + x12Imag*w12Real;
real tap13Real = 0.0 ; always @* tap13Real = x13Real*w13Real - x13Imag*w13Imag;
real tap13Imag = 0.0 ; always @* tap13Imag = x13Real*w13Imag + x13Imag*w13Real;
real tap14Real = 0.0 ; always @* tap14Real = x14Real*w14Real - x14Imag*w14Imag;
real tap14Imag = 0.0 ; always @* tap14Imag = x14Real*w14Imag + x14Imag*w14Real;
real tap15Real = 0.0 ; always @* tap15Real = x15Real*w15Real - x15Imag*w15Imag;
real tap15Imag = 0.0 ; always @* tap15Imag = x15Real*w15Imag + x15Imag*w15Real;

real outReal = 0.0 ;
always @* outReal = tap0Real  + tap1Real  + tap2Real  + tap3Real  +
                    tap4Real  + tap5Real  + tap6Real  + tap7Real  +
                    tap8Real  + tap9Real  + tap10Real + tap11Real +
                    tap12Real + tap13Real + tap14Real + tap15Real;
real outImag = 0.0 ;
always @* outImag = tap0Imag  + tap1Imag  + tap2Imag  + tap3Imag  +
                    tap4Imag  + tap5Imag  + tap6Imag  + tap7Imag  +
                    tap8Imag  + tap9Imag  + tap10Imag + tap11Imag +
                    tap12Imag + tap13Imag + tap14Imag + tap15Imag;

// Error calculation
real stepSize = 0.5;
real mag = 0.0 ; always @* mag = outReal*outReal + outImag*outImag;
real setPoint = $itor($signed(18'h02000))/(2**17) ;
real diff = 0.0 ; always @* diff = setPoint - mag;
real errorReal = 0.0 ; always @* errorReal = stepSize*diff*outReal;
real errorImag = 0.0 ; always @* errorImag = stepSize*diff*outImag;


//(xr - jxi)*(er + jei) = (xr*er + xi*ei) + j(xr*ei - xi*er)

// Update weights
reg     [2:0]   updateCount;
wire            updateWeights = (updateCount == 0);
//wire            updateWeights = 0;
always @(posedge clk) begin
    if (reset) begin
        updateCount <= 0;
        w0Real <= 0.0;
        w0Imag <= 0.0;
        w1Real <= 0.0;
        w1Imag <= 0.0;
        w2Real <= 0.0 ;
        w2Imag <= 0.0;
        w3Real <= $itor($signed(18'h1FFFF)) / (2**17) ;
        w3Imag <= 0.0;
        w4Real <= 0.0;
        w4Imag <= 0.0;
        w5Real <= 0.0;
        w5Imag <= 0.0;
        w6Real <= 0.0;
        w6Imag <= 0.0;
        w7Real <= 0.0;
        w7Imag <= 0.0;
        w8Real <= 0.0;
        w8Imag <= 0.0;
        w9Real <= 0.0;
        w9Imag <= 0.0;
        w10Real <= 0.0;
        w10Imag <= 0.0;
        w11Real <= 0.0;
        w11Imag <= 0.0;
        w12Real <= 0.0;
        w12Imag <= 0.0;
        w13Real <= 0.0;
        w13Imag <= 0.0;
        w14Real <= 0.0;
        w14Imag <= 0.0;
        w15Real <= 0.0;
        w15Imag <= 0.0;
        end
    else if (clkEn) begin
        if (updateWeights) begin
            updateCount <= 0;
            w0Real  <= w0Real  + errorReal*x0Real  + errorImag*x0Imag;
            w0Imag  <= w0Imag  - errorReal*x0Imag  + errorImag*x0Real;
            w1Real  <= w1Real  + errorReal*x1Real  + errorImag*x1Imag;
            w1Imag  <= w1Imag  - errorReal*x1Imag  + errorImag*x1Real;
            w2Real  <= w2Real  + errorReal*x2Real  + errorImag*x2Imag;
            w2Imag  <= w2Imag  - errorReal*x2Imag  + errorImag*x2Real;
            w3Real  <= w3Real  + errorReal*x3Real  + errorImag*x3Imag;
            w3Imag  <= w3Imag  - errorReal*x3Imag  + errorImag*x3Real;
            w4Real  <= w4Real  + errorReal*x4Real  + errorImag*x4Imag;
            w4Imag  <= w4Imag  - errorReal*x4Imag  + errorImag*x4Real;
            w5Real  <= w5Real  + errorReal*x5Real  + errorImag*x5Imag;
            w5Imag  <= w5Imag  - errorReal*x5Imag  + errorImag*x5Real;
            w6Real  <= w6Real  + errorReal*x6Real  + errorImag*x6Imag;
            w6Imag  <= w6Imag  - errorReal*x6Imag  + errorImag*x6Real;
            w7Real  <= w7Real  + errorReal*x7Real  + errorImag*x7Imag;
            w7Imag  <= w7Imag  - errorReal*x7Imag  + errorImag*x7Real;
            w8Real  <= w8Real  + errorReal*x8Real  + errorImag*x8Imag;
            w8Imag  <= w8Imag  - errorReal*x8Imag  + errorImag*x8Real;
            w9Real  <= w9Real  + errorReal*x9Real  + errorImag*x9Imag;
            w9Imag  <= w9Imag  - errorReal*x9Imag  + errorImag*x9Real;
            w10Real <= w10Real + errorReal*x10Real + errorImag*x10Imag;
            w10Imag <= w10Imag - errorReal*x10Imag + errorImag*x10Real;
            w11Real <= w11Real + errorReal*x11Real + errorImag*x11Imag;
            w11Imag <= w11Imag - errorReal*x11Imag + errorImag*x11Real;
            w12Real <= w12Real + errorReal*x12Real + errorImag*x12Imag;
            w12Imag <= w12Imag - errorReal*x12Imag + errorImag*x12Real;
            w13Real <= w13Real + errorReal*x13Real + errorImag*x13Imag;
            w13Imag <= w13Imag - errorReal*x13Imag + errorImag*x13Real;
            w14Real <= w14Real + errorReal*x14Real + errorImag*x14Imag;
            w14Imag <= w14Imag - errorReal*x14Imag + errorImag*x14Real;
            w15Real <= w15Real + errorReal*x15Real + errorImag*x15Imag;
            w15Imag <= w15Imag - errorReal*x15Imag + errorImag*x15Real;
            end
        //else begin
        //    updateCount <= updateCount - 1;
        //    end
        end
    end

integer iInt = 0 ; always @* iInt = $rtoi(outReal * (2**17));
assign iOut = iInt;
integer qInt = 0 ; always @* qInt = $rtoi(outImag * (2**17));
assign qOut = qInt;

integer file1 ; initial file1 = $fopen("src/floats_mag.dat") ;
integer k = 0 ;
always @ (posedge clk) begin
    if (clkEn) begin
        if ($time > 500_000) begin
            k = k + 1 ;
            if (k % 100 == 0) begin
                $fdisplay(file1, "%f",mag) ;
                end
            end
        end
    end

endmodule

