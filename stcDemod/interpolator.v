`include "defines.v"
`timescale 1ns/100ps

/*
*******************************************************************************
interpolator
*******************************************************************************
    Description:
  		interpolator uses a Farrow filter to perform a fractional delay and 
        downsample by 4. The filter is piece-wise parabolic with alpha = 0.5. 

  		4 consecutive samples are grouped together and denoted s_in[i] through 
        s_in[i+3]. The basepoint index is assumed to be s_in[i+1]. That is, the 
        desired output sample lies between s_in[i+1] and s_in[i+2] and it is mu 
        away from the index i+1, where mu is a fraction of a sample period. The
        interpolate signal indicates which sample is s_in[i] and should go true
        once every 4 input samples. The signal, outputEn, indicates when the 
        interpolated output is ready.

        The output is calculated in C using floating point as:
        v2 = 0.5f*(s_in[i+3] - s_in[i+2] - s_in[i+1] + s_in[i]);
        v1 = 0.5f*(-s_in[i+3] + 3*s_in[i+2] - s_in[i+1] - s_in[i]);
        v0 = s_in[i+1];
        s_out = (mu*v2 + v1)*mu + v0;

    Inputs:
        clk - system clock. 
        clkEn - clock enable to run slower than the system clock
        reset - synchronous clear
        interpolate - a boolean indicating
        mu - an unsigned, 18 bit, UQ0.18 fractional number (0.0 <= mu < 1.0) which
            represents the fractional amount of a sample period to add to the 
            input samples to create the output samples
        inputEn - clock enable for the input data
        din - input sample encoded as a signed, 18 bit, Q3.15 fractional number.
    Outputs:
        outputEn - clock enable to indicate and interpolated output is available
        dout - output sample encoded as a signed, 18 bit, Q3.15 fractional number.

*/
module interpolator(
    input                   clk,
    input                   clkEn,
    input                   reset,
    input                   interpolate,
    input           [17:0]  mu,
    input                   inputEn,
    input   signed  [17:0]  din,
    output                  outputEn,
    output  signed  [17:0]  dout
);

    // Convert mu to a signed number
    wire    signed  [17:0]  signedMu = $signed({1'b0,mu[17:1]});

    // Clock samples into the processing buffer
    reg     signed  [17:0]  dinSR[0:2];     // Q3.15
    integer                 i;
    reg     signed  [17:0]  s0,s1,s2,s3;    // Q3.15
    always @(posedge clk) begin
        if (clkEn) begin
            if (inputEn) begin
                dinSR[2] <= din;
                dinSR[1] <= dinSR[2];
                dinSR[0] <= dinSR[1];
            end
            if (interpolate) begin
                s0 <= dinSR[0];
                s1 <= dinSR[1];
                s2 <= dinSR[2];
                s3 <= din;
            end
        end
    end

    // Calculate v2
    wire    signed  [19:0]  v2Sum;          // Q5.15
    assign                  v2Sum = s3 - s2 - s1 + s0;
    reg     signed  [17:0]  v2;             // Q3.15
    always @(posedge clk) begin
        if (clkEn) begin
            casex (v2Sum[19:18])
                2'b01:      v2 <= 18'h1ffff;
                2'b10:      v2 <= 18'h20001;
                default:    v2 <= v2Sum[18:1];
            endcase
        end
    end

    // Calculate v1
    wire    signed  [19:0]  v1Sum;          // Q5.15
    assign                  v1Sum = 3*s2 - s3 - s1 - s0;
    reg     signed  [17:0]  v1;             // Q3.15
    always @(posedge clk) begin
        if (clkEn) begin
            casex (v1Sum[19:18])
                2'b01:      v1 <= 18'h1ffff;
                2'b10:      v1 <= 18'h20001;
                default:    v1 <= v1Sum[18:1];
            endcase
        end
    end

    // Calculate term1 = mu*v2 + v1
    reg     signed  [36:0]  v1Reg,mreg1,tmp1;
    always @(posedge clk) begin
        if (clkEn) begin
            v1Reg <= {v1[17],v1[17],v1,17'b0};
            mreg1 <= signedMu*v2;
            tmp1 <= mreg1 + v1Reg;
        end
    end
    wire    signed  [17:0]  term1 = tmp1[34:17];

    // Calculate doutReg = mu*term1 + s1
    reg     signed  [36:0]  s1Reg, mreg2, tmp2;
    always @(posedge clk) begin
        if (clkEn) begin
            s1Reg <= {s1[17],s1[17],s1,17'b0};
            mreg2 <= signedMu*term1;
            tmp2 <= mreg2 + s1Reg;
        end
    end
    assign dout = tmp2[34:17];

    // Create the outputEn
    reg             [7:0]   outputEnSR;
    always @(posedge clk) begin
        if (clkEn) begin
            outputEnSR  <= {outputEnSR[6:0],interpolate};
        end
    end
    assign outputEn = outputEnSR[5];

endmodule
