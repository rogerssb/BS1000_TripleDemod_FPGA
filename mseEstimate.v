`timescale 1ns/1ps
`include "addressMap.v"


module mseEstimate
    #(parameter NUM_ITERS = 6,
                LOG_BITS = 11,
                LOG_FRAC_BITS = 7
    )
(
    input                               clk,
    input                               reset,
    input               [2:0]           combinerMode,
    input                               combinerStartOfFrame,
    input   signed      [33:0]          ch0MseSum,
    input   signed      [LOG_BITS-1:0]  ch0Log10MSE,
    input   signed      [33:0]          ch1MseSum,
    input   signed      [LOG_BITS-1:0]  ch1Log10MSE,
    input                               startEstimate,
    input                               magClkEn,
    input               [12:0]          mag,
    input               [15:0]          meanMag,
    input               [15:0]          avgLength,
    input   signed      [15:0]          log10MseOffset,
    output  signed      [33:0]          mseSum,
    output  signed      [LOG_BITS-1:0]  log10MseSum,
    output  signed      [15:0]          log10MSE
);

    //`define MSE_USE_INSIDE_POINTS

    /*
    This calculates a normalized MSE estimate for constant envelope signals.
    It normalizes the mean to one. It assumes the mean is the radius of the
    constellation circle and mag is the vector length from the origin to the
    constellation sample.

    The calculation is

            MSE = log10(1/K * 1/mean^2 * SUM[(mag - mean)^2]),

    where K is the number of elements in the summation,

    It is implemented as

            MSE = FF + log10(SUM[(mag - mean)^2],

    where FF = log10(1/K/mean^2) and is calculated offline at configuration.
    This value is the log10MseOffset input to this module.

    The variables, mag and mean, are interpreted as Q0.13, positive numbers that
    always have magnitude less than 1.0. Therefore, the difference squared is
    also always less than one. This means the summation is always less than the
    number of elements in the sum.

    The summation allows up to 14 bits of overflow so we can sum 16384 samples to
    to create the average.
    */

    reg             [1:0]   sofSR;
    wire                    startAverage = (sofSR == 2'b10);  //Detect trailing edge of startAverage
    reg     signed  [17:0]  diff;
    wire            [35:0]  diffSquared = diff * diff;
    reg             [47:0]  diffAccum;
    reg             [47:0]  diffTotal;
    reg             [15:0]  avgCount;
    wire                    avgComplete = (avgCount == 0);
    reg                     avgCompleteDelayed;
    always @(posedge clk) begin
        if (reset) begin
            avgCount <= 0;
            diffAccum <= 0;
            sofSR <= 0;
        end
        else if (magClkEn) begin
            sofSR <= {sofSR[0],startEstimate};
            avgCompleteDelayed <= avgComplete;
            if (avgComplete) begin
                `ifdef MSE_USE_INSIDE_POINTS
                if (combinerInput) begin
                    if (diff <= 0) begin
                        diffAccum <= diffSquared;
                    end
                    else begin
                        diffAccum <= 0;
                    end
                end
                else begin
                    diffAccum <= diffSquared;
                end
                `else
                diffAccum <= diffSquared;
                `endif
                if (!avgCompleteDelayed) begin  // Leading edge of avgComplete?
                    diffTotal <= diffAccum;
                end
                if (startAverage) begin
                    avgCount <= avgLength;
                end
            end
            else begin

                `ifdef MSE_USE_INSIDE_POINTS
                if (combinerInput) begin
                    if (diff <= 0) begin
                        avgCount <= avgCount - 1;
                        diffAccum <= diffAccum + diffSquared;
                    end
                end
                else begin
                    avgCount <= avgCount - 1;
                    diffAccum <= diffAccum + diffSquared;
                end
                `else
                avgCount <= avgCount - 1;
                diffAccum <= diffAccum + diffSquared;
                `endif

                `ifdef BITSYNC_BERT
                diff <= $signed({1'b0,mag,4'b0}) - $signed({1'b0,meanMag,1'b0});
                `else
                diff <= $signed({mag,5'b0}) - $signed({1'b0,meanMag,1'b0});
                `endif
            end
        end
    end

    `define USE_LOG10_MODULE
    `ifdef USE_LOG10_MODULE
    wire                            combinerInput = (combinerMode == `DQM_CMD_MODE_OPTRATIO);
    wire            [33:0]          linearValue = combinerInput ? ch0MseSum + ch1MseSum
                                                                : diffTotal[47:14];
    wire    signed  [LOG_BITS-1:0]  logValue;
    log10Estimate
        #(.NUM_ITERS(NUM_ITERS),
          .LOG_BITS(LOG_BITS),
          .LOG_FRAC_BITS(LOG_FRAC_BITS)
        )
    logDiff (
        .clk(clk),
        .outputClkEn(avgComplete),
        .linearValue(linearValue),
        .log10Estimate(logValue)
    );

    // Calculate the combined MSE including the fudge factor.
    `ifdef COMBINER
        wire    signed  [LOG_BITS-1:0]  log10CmbMSE = ch0Log10MSE
                                                + ch1Log10MSE
                                                - (logValue + log10MseOffset[LOG_BITS-1:0]);
    `else
        wire    signed  [LOG_BITS-1:0]  log10CmbMSE = 0;
    `endif
    // Add in the fudge factor offset for non-combiner operation
    wire    signed  [LOG_BITS-1:0] finalLogX = logValue + log10MseOffset[LOG_BITS-1:0];

    // Mux and Sign extend to get the final output
    reg signed  [LOG_BITS-1:0]  log10MSEMux;
    always @* begin
        case (combinerMode)
            `DQM_CMB_MODE_DISABLED:     log10MSEMux = finalLogX;
            `DQM_CMB_MODE_CH0SELECT:    log10MSEMux = ch0Log10MSE;
            `DQM_CMB_MODE_CH1SELECT:    log10MSEMux = ch1Log10MSE;
            `DQM_CMB_MODE_OPTSELECT:    log10MSEMux = (ch0Log10MSE < ch1Log10MSE) ? ch0Log10MSE : ch1Log10MSE;
            `DQM_CMD_MODE_OPTRATIO:     log10MSEMux = log10CmbMSE;
            default:                    log10MSEMux = finalLogX;
        endcase
    end
    assign log10MSE = {{16-LOG_BITS{log10MSEMux[LOG_BITS-1]}},log10MSEMux};
    /*
    assign log10MSE = combinerInput ? {{16-LOG_BITS{log10CmbMSE[LOG_BITS-1]}},log10CmbMSE}
                                    : {{16-LOG_BITS{finalLogX[LOG_BITS-1]}},finalLogX};
    */
    assign mseSum = diffTotal[47:14];
    assign log10MseSum = finalLogX;

    `else  //USE_LOG10_MODULE

    // Log10 MSE Estimate
    /*
    This log10 estimate is generated using an iterative shift-and-add algorithm
    similar to the CORDIC algorithm. It estimates the log10 function over a range

                        1/16384 <= x <= 16383.0

    to an accuracy of less than 0.05.

    The algorithm starts with a normalization step that checks for leading zeros to
    determine an inital value of x and log10(x). These values are then iterated as
    shown:
                            x(n+1) = x(n)*K(n)
                      log10X(n+1) = log10X(n) + log10(K(n))

    The algorithm drives x(n) to 1.0 and accumulates the logarithmic terms it takes
    to get there. At any iteration, if the term would cause x(n+1) to exceed 1.0,
    it is skipped.
    */

    wire        [27:0]  testBits = diffTotal[47:20];
    wire        [47:0]  linearMSE = diffTotal;
    reg         [NUM_ITERS-1:0] initialX;
    reg signed  [LOG_BITS-1:0]  initialLogX;        // Q4.7
    always @* begin
        casex (testBits)
            // NOTE: The extra underscore shows where the implied binary point is
            28'b1xxx_xxxx_xxxx_xx_xx_xxxx_xxxx_xxxx:
                begin
                initialX = linearMSE[47:42];
                initialLogX = 11'd539;          //$rtoi($log10(2.0**14) * (2.0**LOG_FRAC_BITS));
                end
            28'b01xx_xxxx_xxxx_xx_xx_xxxx_xxxx_xxxx:
                begin
                initialX = linearMSE[46:41];
                initialLogX = 11'd501;          //$rtoi($log10(2.0**13) * (2.0**LOG_FRAC_BITS));
                end
            28'b001x_xxxx_xxxx_xx_xx_xxxx_xxxx_xxxx:
                begin
                initialX = linearMSE[45:40];
                initialLogX = 11'd462;          //$rtoi($log10(2.0**12) * (2.0**LOG_FRAC_BITS));
                end
            28'b0001_xxxx_xxxx_xx_xx_xxxx_xxxx_xxxx:
                begin
                initialX = linearMSE[44:39];
                initialLogX = 11'd424;          //$rtoi($log10(2.0**11) * (2.0**LOG_FRAC_BITS));
                end
            28'b0000_1xxx_xxxx_xx_xx_xxxx_xxxx_xxxx:
                begin
                initialX = linearMSE[43:38];
                initialLogX = 11'd385;          //$rtoi($log10(2.0**10) * (2.0**LOG_FRAC_BITS));
                end
            28'b0000_01xx_xxxx_xx_xx_xxxx_xxxx_xxxx:
                begin
                initialX = linearMSE[42:37];
                initialLogX = 11'd347;          //$rtoi($log10(2.0**9) * (2.0**LOG_FRAC_BITS));
                end
            28'b0000_001x_xxxx_xx_xx_xxxx_xxxx_xxxx:
                begin
                initialX = linearMSE[41:36];
                initialLogX = 11'd308;          //$rtoi($log10(2.0**8) * (2.0**LOG_FRAC_BITS));
                end
            28'b0000_0001_xxxx_xx_xx_xxxx_xxxx_xxxx:
                begin
                initialX = linearMSE[40:35];
                initialLogX = 11'd270;          //$rtoi($log10(2.0**7) * (2.0**LOG_FRAC_BITS));
                end
            28'b0000_0000_1xxx_xx_xx_xxxx_xxxx_xxxx:
                begin
                initialX = linearMSE[39:34];
                initialLogX = 11'd231;          //$rtoi($log10(2.0**6) * (2.0**LOG_FRAC_BITS));
                end
            28'b0000_0000_01xx_xx_xx_xxxx_xxxx_xxxx:
                begin
                initialX = linearMSE[38:33];
                initialLogX = 11'd193;          //$rtoi($log10(2.0**5) * (2.0**LOG_FRAC_BITS));
                end
            28'b0000_0000_001x_xx_xx_xxxx_xxxx_xxxx:
                begin
                initialX = linearMSE[37:32];
                initialLogX = 11'd154;          //$rtoi($log10(2.0**4) * (2.0**LOG_FRAC_BITS));
                end
            28'b0000_0000_0001_xx_xx_xxxx_xxxx_xxxx:
                begin
                initialX = linearMSE[36:31];
                initialLogX = 11'd116;          //$rtoi($log10(2.0**3) * (2.0**LOG_FRAC_BITS));
                end
            28'b0000_0000_0000_1x_xx_xxxx_xxxx_xxxx:
                begin
                initialX = linearMSE[35:30];
                initialLogX = 11'd77;           //$rtoi($log10(2.0**2) * (2.0**LOG_FRAC_BITS));
                end
            28'b0000_0000_0000_01_xx_xxxx_xxxx_xxxx:
                begin
                initialX = linearMSE[34:29];
                initialLogX = 11'd39;           //$rtoi($log10(2.0**1) * (2.0**LOG_FRAC_BITS));
                end
            28'b0000_0000_0000_00_1x_xxxx_xxxx_xxxx:
                begin
                initialX = linearMSE[33:28];
                initialLogX = 11'd0;            //$rtoi($log10(2.0**0) * (2.0**LOG_FRAC_BITS));
                end
            28'b0000_0000_0000_00_01_xxxx_xxxx_xxxx:
                begin
                initialX = linearMSE[32:27];
                initialLogX = -11'sd39;         //$rtoi($log10(2.0**-1) * (2.0**LOG_FRAC_BITS));
                end
            28'b0000_0000_0000_00_00_1xxx_xxxx_xxxx:
                begin
                initialX = linearMSE[31:26];
                initialLogX = -11'sd77;         //$rtoi($log10(2.0**-2) * (2.0**LOG_FRAC_BITS));
                end
            28'b0000_0000_0000_00_00_01xx_xxxx_xxxx:
                begin
                initialX = linearMSE[30:25];
                initialLogX = -11'sd116;        //$rtoi($log10(2.0**-3) * (2.0**LOG_FRAC_BITS));
                end
            28'b0000_0000_0000_00_00_001x_xxxx_xxxx:
                begin
                initialX = linearMSE[29:24];
                initialLogX = -11'sd154;        //$rtoi($log10(2.0**-4) * (2.0**LOG_FRAC_BITS));
                end
            28'b0000_0000_0000_00_00_0001_xxxx_xxxx:
                begin
                initialX = linearMSE[28:23];
                initialLogX = -11'sd193;        //$rtoi($log10(2.0**-5) * (2.0**LOG_FRAC_BITS));
                end
            28'b0000_0000_0000_00_00_0000_1xxx_xxxx:
                begin
                initialX = linearMSE[27:22];
                initialLogX = -11'sd231;        //$rtoi($log10(2.0**-6) * (2.0**LOG_FRAC_BITS));
                end
            28'b0000_0000_0000_00_00_0000_01xx_xxxx:
                begin
                initialX = linearMSE[26:21];
                initialLogX = -11'sd270;        //$rtoi($log10(2.0**-7) * (2.0**LOG_FRAC_BITS));
                end
            28'b0000_0000_0000_00_00_0000_001x_xxxx:
                begin
                initialX = linearMSE[25:20];
                initialLogX = -11'sd308;        //$rtoi($log10(2.0**-8) * (2.0**LOG_FRAC_BITS));
                end
            28'b0000_0000_0000_00_00_0000_0001_xxxx:
                begin
                initialX = linearMSE[24:19];
                initialLogX = -11'sd347;        //$rtoi($log10(2.0**-9) * (2.0**LOG_FRAC_BITS));
                end
            28'b0000_0000_0000_00_00_0000_0000_1xxx:
                begin
                initialX = linearMSE[23:18];
                initialLogX = -11'sd385;        //$rtoi($log10(2.0**-10) * (2.0**LOG_FRAC_BITS));
                end
            28'b0000_0000_0000_00_00_0000_0000_01xx:
                begin
                initialX = linearMSE[22:17];
                initialLogX = -11'sd424;        //$rtoi($log10(2.0**-11) * (2.0**LOG_FRAC_BITS));
                end
            28'b0000_0000_0000_00_00_0000_0000_001x:
                begin
                initialX = linearMSE[21:16];
                initialLogX = -11'sd462;        //$rtoi($log10(2.0**-12) * (2.0**LOG_FRAC_BITS));
                end
            28'b0000_0000_0000_00_00_0000_0000_0001:
                begin
                initialX = linearMSE[20:15];
                initialLogX = -11'sd501;        //$rtoi($log10(2.0**-13) * (2.0**LOG_FRAC_BITS));
                end
            default:
                begin
                initialX = linearMSE[19:14];
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
            //assign possibleX[i] = currentX[i] * xScale[i];
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
    reg signed  [LOG_BITS-1:0]  finalLogX;        // Q4.7
    assign                      log10MSE = {{16-LOG_BITS{finalLogX[LOG_BITS-1]}},finalLogX};
    always @(posedge clk) begin
        if (avgComplete) begin
            //currentX[0] <= {1'b0,initialX,{NUM_ITERS{1'b0}}};
            //currentLogX[0] <= initialLogX;
            finalLogX <= currentLogX[NUM_ITERS-1] + log10MseOffset[LOG_BITS-1:0];
            finalX <= currentX[NUM_ITERS-1];
        end
    end

    `endif //USE_LOG10_MODULE

endmodule


