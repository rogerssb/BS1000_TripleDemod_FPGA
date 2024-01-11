`timescale 1ns/1ps
`include "addressMap.v"


module log10Estimate
    #(parameter NUM_ITERS = 6,
                LOG_BITS = 11,
                LOG_FRAC_BITS = 7
    )
(
    input                               clk,
    input                               outputClkEn,
    input               [33:0]          linearValue,
    output  reg signed  [LOG_BITS-1:0]  log10Estimate
);

    // Log10 Estimate
    /*

    This log10 estimate is generated using an iterative shift-and-add algorithm
    similar to the CORDIC algorithm. It estimates the log10 function over a range

                        1/16384 <= x <= 16383.0

    to an accuracy of less than 0.05.

    INPUTS:

    outputClkEn latches the current output of the iterative algorithm into
        log10Estimate.
    linearValue is an unsigned, fixed point value with 14 bits above the binary
        point.

    OUTPUTS:

    log10Estimate is a signed Q4.12 value representing log values in the range of
        [-8.0,8.0).

    The algorithm starts with a normalization step that checks for leading zeros to
    determine an initial value of x and log10(x). These values are then iterated as
    shown:
                            x(n+1) = x(n)*K(n)
                      log10X(n+1) = log10X(n) + log10(K(n))

    The algorithm drives x(n) to 1.0 and accumulates the logarithmic terms it takes
    to get there. At any iteration, if the term would cause x(n+1) to exceed 1.0,
    it is skipped.
    */

    wire        [27:0]  testBits = linearValue[33:6];
    reg         [NUM_ITERS-1:0] initialX;
    reg signed  [LOG_BITS-1:0]  initialLogX;        // Q4.7
    always @* begin
        casex (testBits)
            // NOTE: The extra underscore shows where the implied binary point is
            28'b1xxx_xxxx_xxxx_xx_xx_xxxx_xxxx_xxxx:
                begin
                initialX = linearValue[33:28];
                initialLogX = 11'd539;          //$rtoi($log10(2.0**14) * (2.0**LOG_FRAC_BITS));
                end
            28'b01xx_xxxx_xxxx_xx_xx_xxxx_xxxx_xxxx:
                begin
                initialX = linearValue[32:27];
                initialLogX = 11'd501;          //$rtoi($log10(2.0**13) * (2.0**LOG_FRAC_BITS));
                end
            28'b001x_xxxx_xxxx_xx_xx_xxxx_xxxx_xxxx:
                begin
                initialX = linearValue[31:26];
                initialLogX = 11'd462;          //$rtoi($log10(2.0**12) * (2.0**LOG_FRAC_BITS));
                end
            28'b0001_xxxx_xxxx_xx_xx_xxxx_xxxx_xxxx:
                begin
                initialX = linearValue[30:25];
                initialLogX = 11'd424;          //$rtoi($log10(2.0**11) * (2.0**LOG_FRAC_BITS));
                end
            28'b0000_1xxx_xxxx_xx_xx_xxxx_xxxx_xxxx:
                begin
                initialX = linearValue[29:24];
                initialLogX = 11'd385;          //$rtoi($log10(2.0**10) * (2.0**LOG_FRAC_BITS));
                end
            28'b0000_01xx_xxxx_xx_xx_xxxx_xxxx_xxxx:
                begin
                initialX = linearValue[28:23];
                initialLogX = 11'd347;          //$rtoi($log10(2.0**9) * (2.0**LOG_FRAC_BITS));
                end
            28'b0000_001x_xxxx_xx_xx_xxxx_xxxx_xxxx:
                begin
                initialX = linearValue[27:22];
                initialLogX = 11'd308;          //$rtoi($log10(2.0**8) * (2.0**LOG_FRAC_BITS));
                end
            28'b0000_0001_xxxx_xx_xx_xxxx_xxxx_xxxx:
                begin
                initialX = linearValue[26:21];
                initialLogX = 11'd270;          //$rtoi($log10(2.0**7) * (2.0**LOG_FRAC_BITS));
                end
            28'b0000_0000_1xxx_xx_xx_xxxx_xxxx_xxxx:
                begin
                initialX = linearValue[25:20];
                initialLogX = 11'd231;          //$rtoi($log10(2.0**6) * (2.0**LOG_FRAC_BITS));
                end
            28'b0000_0000_01xx_xx_xx_xxxx_xxxx_xxxx:
                begin
                initialX = linearValue[24:19];
                initialLogX = 11'd193;          //$rtoi($log10(2.0**5) * (2.0**LOG_FRAC_BITS));
                end
            28'b0000_0000_001x_xx_xx_xxxx_xxxx_xxxx:
                begin
                initialX = linearValue[23:18];
                initialLogX = 11'd154;          //$rtoi($log10(2.0**4) * (2.0**LOG_FRAC_BITS));
                end
            28'b0000_0000_0001_xx_xx_xxxx_xxxx_xxxx:
                begin
                initialX = linearValue[22:17];
                initialLogX = 11'd116;          //$rtoi($log10(2.0**3) * (2.0**LOG_FRAC_BITS));
                end
            28'b0000_0000_0000_1x_xx_xxxx_xxxx_xxxx:
                begin
                initialX = linearValue[21:16];
                initialLogX = 11'd77;           //$rtoi($log10(2.0**2) * (2.0**LOG_FRAC_BITS));
                end
            28'b0000_0000_0000_01_xx_xxxx_xxxx_xxxx:
                begin
                initialX = linearValue[20:15];
                initialLogX = 11'd39;           //$rtoi($log10(2.0**1) * (2.0**LOG_FRAC_BITS));
                end
            28'b0000_0000_0000_00_1x_xxxx_xxxx_xxxx:
                begin
                initialX = linearValue[19:14];
                initialLogX = 11'd0;            //$rtoi($log10(2.0**0) * (2.0**LOG_FRAC_BITS));
                end
            28'b0000_0000_0000_00_01_xxxx_xxxx_xxxx:
                begin
                initialX = linearValue[18:13];
                initialLogX = -11'sd39;         //$rtoi($log10(2.0**-1) * (2.0**LOG_FRAC_BITS));
                end
            28'b0000_0000_0000_00_00_1xxx_xxxx_xxxx:
                begin
                initialX = linearValue[17:12];
                initialLogX = -11'sd77;         //$rtoi($log10(2.0**-2) * (2.0**LOG_FRAC_BITS));
                end
            28'b0000_0000_0000_00_00_01xx_xxxx_xxxx:
                begin
                initialX = linearValue[16:11];
                initialLogX = -11'sd116;        //$rtoi($log10(2.0**-3) * (2.0**LOG_FRAC_BITS));
                end
            28'b0000_0000_0000_00_00_001x_xxxx_xxxx:
                begin
                initialX = linearValue[15:10];
                initialLogX = -11'sd154;        //$rtoi($log10(2.0**-4) * (2.0**LOG_FRAC_BITS));
                end
            28'b0000_0000_0000_00_00_0001_xxxx_xxxx:
                begin
                initialX = linearValue[14: 9];
                initialLogX = -11'sd193;        //$rtoi($log10(2.0**-5) * (2.0**LOG_FRAC_BITS));
                end
            28'b0000_0000_0000_00_00_0000_1xxx_xxxx:
                begin
                initialX = linearValue[13: 8];
                initialLogX = -11'sd231;        //$rtoi($log10(2.0**-6) * (2.0**LOG_FRAC_BITS));
                end
            28'b0000_0000_0000_00_00_0000_01xx_xxxx:
                begin
                initialX = linearValue[12: 7];
                initialLogX = -11'sd270;        //$rtoi($log10(2.0**-7) * (2.0**LOG_FRAC_BITS));
                end
            28'b0000_0000_0000_00_00_0000_001x_xxxx:
                begin
                initialX = linearValue[11: 6];
                initialLogX = -11'sd308;        //$rtoi($log10(2.0**-8) * (2.0**LOG_FRAC_BITS));
                end
            28'b0000_0000_0000_00_00_0000_0001_xxxx:
                begin
                initialX = linearValue[10: 5];
                initialLogX = -11'sd347;        //$rtoi($log10(2.0**-9) * (2.0**LOG_FRAC_BITS));
                end
            28'b0000_0000_0000_00_00_0000_0000_1xxx:
                begin
                initialX = linearValue[ 9: 4];
                initialLogX = -11'sd385;        //$rtoi($log10(2.0**-10) * (2.0**LOG_FRAC_BITS));
                end
            28'b0000_0000_0000_00_00_0000_0000_01xx:
                begin
                initialX = linearValue[ 8: 3];
                initialLogX = -11'sd424;        //$rtoi($log10(2.0**-11) * (2.0**LOG_FRAC_BITS));
                end
            28'b0000_0000_0000_00_00_0000_0000_001x:
                begin
                initialX = linearValue[ 7: 2];
                initialLogX = -11'sd462;        //$rtoi($log10(2.0**-12) * (2.0**LOG_FRAC_BITS));
                end
            28'b0000_0000_0000_00_00_0000_0000_0001:
                begin
                initialX = linearValue[ 6: 1];
                initialLogX = -11'sd501;        //$rtoi($log10(2.0**-13) * (2.0**LOG_FRAC_BITS));
                end
            default:
                begin
                initialX = linearValue[ 5: 0];
                initialLogX = -11'sd539;        //$rtoi($log10(2.0**-14) * (2.0**LOG_FRAC_BITS));
                end
        endcase
    end


    // xScale is a table of x scale factors that are of the form, 1 + 1/(2^K) encoded into
    // NUM_ITERS + 1 bits as an unsigned integer.
    reg         [NUM_ITERS:0]   xScale[0:NUM_ITERS-1];
    // logXScale is a table containing log10(xScale).
    reg signed  [LOG_BITS-1:0]  logXScale[0:NUM_ITERS-1];
    integer                     ix;
    initial begin
        /*
        for (ix = 0; ix < NUM_ITERS; ix = ix + 1) begin
            xScale[ix] = $unsigned({1'b1, {NUM_ITERS{1'b0}}}) + $rtoi((2.0**(NUM_ITERS-ix-1)));
        end
        */
        xScale[0] = 'b110_0000;
        xScale[1] = 'b101_0000;
        xScale[2] = 'b100_1000;
        xScale[3] = 'b100_0100;
        xScale[4] = 'b100_0010;
        xScale[5] = 'b100_0001;
        /*
        for (ix = 0; ix < NUM_ITERS; ix = ix + 1) begin
            logXScale[ix] = $rtoi($log10(1.0 + (2.0**(-ix-1))) * (2.0**LOG_FRAC_BITS) + 0.5);
        end
        */
        logXScale[0] = 'd23;
        logXScale[1] = 'd12;
        logXScale[2] = 'd7;
        logXScale[3] = 'd3;
        logXScale[4] = 'd2;
        logXScale[5] = 'd1;
    end


    genvar                      i;
    wire         [2*NUM_ITERS:0]    currentX[0:NUM_ITERS];
    assign                          currentX[0] = {1'b0,initialX,{NUM_ITERS{1'b0}}};
    wire signed  [LOG_BITS-1:0]     currentLogX[0:NUM_ITERS];        // Q4.7
    assign                          currentLogX[0] = initialLogX;
    /*
    // This implements a multiplication that takes advantage of the form of the x scale
    // factors.
    wire        [2*NUM_ITERS:0] possibleX = currentX
                                          + {2'b0,{i{1'b0}},currentX[2*NUM_ITERS-1:(i+1)]};
    */
    wire        [2*NUM_ITERS:0] possibleX[0:NUM_ITERS-1];
    wire                        possibleOverflow[0:NUM_ITERS-1];

    generate
        for (i = 0; i < NUM_ITERS; i = i + 1) begin
            assign possibleX[i] = currentX[i]
                                + {2'b0,{i{1'b0}},currentX[i][2*NUM_ITERS-1:(i+1)]};
            assign possibleOverflow[i] = possibleX[i][2*NUM_ITERS];
            assign currentX[i+1] = possibleOverflow[i] ? currentX[i]
                                                       : possibleX[i];
            assign currentLogX[i+1] = possibleOverflow[i] ? currentLogX[i]
                                                          : currentLogX[i] - logXScale[i];
        end
    endgenerate

    reg         [2*NUM_ITERS:0] finalX;
    always @(posedge clk) begin
        if (outputClkEn) begin
            log10Estimate <= currentLogX[NUM_ITERS-1];
            finalX <= currentX[NUM_ITERS-1];
        end
    end

endmodule