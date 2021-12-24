`timescale 1ns/100ps

module softDecisionMapper(
    input                   clk, 
    input                   clkEn,
    input                   reset,
    input           [15:0]  inverseMeanMantissa,
    input           [2:0]   inverseMeanExponent,
    input  signed   [17:0]  dIn,
    output reg      [2:0]   dOut
);
/*
This function normalizes an input by the expected RMS value of the input to a
value of 0.5 and quantizes it to 3 bits. The inverse of the RMS value is encoded 
as a mantissa and an exponent. In the Q17 numbering system, the magnitude of all 
inputs is less than 1.0 so the inverse is greater than one. The mantissa is encoded as
                          0.0 < mantissa < 2
using 16, unsigned bits. The input is multiplied by the mantissa. The product
is then used in a shifter to get an overall range of 
                        0.0 < inverseMean < 256.0
The output of the shifter is tested for saturation.

Finally, the 3 msbs of the shifter output are taken as the final output and encoded
as offset binary.

As an example, suppose the input comes from a pcmfm signal. The RMS value from a
properly normalized fm discriminator would be 0.35. The inverse of 0.35 is 2.857.
The power of 2 divisor required to normalize within the range of (0.0,2.0) is
2^1 so the exponent is 1 and the mantissa would be 2.857/2 = 1.42857 which is 
encoded as 1.42857/2 * 65536 = 46811 = 0xb6db.
*/

    // Scale by the inverse of the mean
    wire        [35:0]  inverseProduct;
    mpy18x18WithCe mantissaMpy(
        .clk(clk),
        .ce(clkEn),
        .a(dIn),
        .b({1'b0,inverseMeanMantissa,1'b0}),
        .p(inverseProduct)
    );

    reg                 signBit;
    reg                 satPos,satNeg;
    reg         [2:0]   dataBits;
    always @(posedge clk) begin
        if (clkEn) begin
            signBit <= dIn[17];
            // Extract bits to use if its not saturated
            case (inverseMeanExponent) 
                0:          dataBits <= inverseProduct[34:32];
                1:          dataBits <= inverseProduct[33:31];
                2:          dataBits <= inverseProduct[32:30];
                3:          dataBits <= inverseProduct[31:29];
                4:          dataBits <= inverseProduct[30:28];
                5:          dataBits <= inverseProduct[29:27];
                6:          dataBits <= inverseProduct[28:26];
                7:          dataBits <= inverseProduct[27:25];
                default:    dataBits <= inverseProduct[26:24];
            endcase

            // Detect saturation
            // Is the product negative?
            if (signBit) begin
                satPos <= 0;
                case (inverseMeanExponent)
                    0:          satNeg <= (inverseProduct[35:34] != 2'h3);
                    1:          satNeg <= (inverseProduct[35:33] != 3'h7);
                    2:          satNeg <= (inverseProduct[35:32] != 4'hf);
                    3:          satNeg <= (inverseProduct[35:31] != 5'h1f);
                    4:          satNeg <= (inverseProduct[35:30] != 6'h3f);
                    5:          satNeg <= (inverseProduct[35:29] != 7'h7f);
                    6:          satNeg <= (inverseProduct[35:28] != 8'hff);
                    7:          satNeg <= (inverseProduct[35:27] != 9'h1ff);
                    default:    satNeg <= 0;
                endcase
            end
            // Must be positive
            else begin
                satNeg <= 0;
                case (inverseMeanExponent)
                    0:          satPos <= (inverseProduct[35:34] != 2'h0);
                    1:          satPos <= (inverseProduct[35:33] != 3'h0);
                    2:          satPos <= (inverseProduct[35:32] != 4'h0);
                    3:          satPos <= (inverseProduct[35:31] != 5'h0);
                    4:          satPos <= (inverseProduct[35:30] != 6'h0);
                    5:          satPos <= (inverseProduct[35:29] != 7'h0);
                    6:          satPos <= (inverseProduct[35:28] != 8'h0);
                    7:          satPos <= (inverseProduct[35:27] != 9'h0);
                    default:    satPos <= 0;
                endcase
            end
            // Final output
            if (satPos) begin
                dOut <= 3'h7;
            end
            else if (satNeg) begin
                dOut <= 3'h0;
            end
            else begin
                dOut <= {~dataBits[2],dataBits[1:0]};
            end
        end
    end
endmodule

`ifdef TEST_MODULE

module test;

    reg reset;
    initial reset = 0;
    reg clk;
    initial clk = 0;
    reg clkEn;
    initial clkEn = 1;

    // Create the clocks
    parameter SAMPLE_FREQ = 93.333333e6;
    //parameter SAMPLE_FREQ = 10e6;
    parameter HC = 1e9/SAMPLE_FREQ/2;
    parameter C = 2*HC;

    reg enableClk;
    initial enableClk = 0;

    always #HC clk = clk^enableClk;

    `define SAMPLE_PERIOD   (C*1e-9)
    `define TWO_POW_32      (2.0**32)
    `define TWO_POW_31      (2.0**31)
    `define TWO_POW_17      (2.0**17)

    integer clkCount;
    parameter CLOCK_DECIMATION = 10;
    always @(posedge clk) begin
        if (reset) begin
            clkCount <= CLOCK_DECIMATION - 1;
            clkEn <= 0;
        end
        else if (clkCount == 0) begin
            clkCount <= CLOCK_DECIMATION - 1;
            clkEn <= 1;
        end
        else begin
            clkCount <= clkCount - 1;
            clkEn <= 0;
        end
    end

    reg signed  [17:0]  testInput;
    always @(posedge clk) begin
        if (reset) begin
            testInput <= 18'h20000;
            //testInput <= 18'h0b333;
        end
        else if (clkEn) begin
            testInput <= testInput + 18'h1000;
        end
    end

    reg         [15:0]  mantissa;
    reg         [2:0]   exponent;
    softDecisionMapper mapper(
        .clk(clk), 
        .clkEn(clkEn),
        .reset(reset),
        .inverseMeanMantissa(mantissa),
        .inverseMeanExponent(exponent),
        .dIn(testInput),
        .dOut()
    );

    initial begin
        // Set for inverse of 0.35
        mantissa = 16'hb6db;  
        exponent = 1;

        mantissa = 16'h8000;  
        exponent = 2;
         
        #(10*C) ;
        reset = 0;
        enableClk = 1;
        #(10*C) ;
        reset = 1;
        #(10*C) ;
        reset = 0;

        #(64*CLOCK_DECIMATION*C) ;
        $stop;

    end
endmodule


    
`endif

