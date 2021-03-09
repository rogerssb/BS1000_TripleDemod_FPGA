`include "./addressMap.v"
`timescale 1ns/100ps

//`define ADD_NOISE
//`define HARD_DECISIONS

`define SAMPLE_PERIOD   (C*1e-9)
`define TWO_POW_32      4294967296.0
`define TWO_POW_31      2147483648.0
`define TWO_POW_17      131072.0

module test;

    parameter SAMPLE_FREQ = 1e6;
    parameter HC = 1e9/SAMPLE_FREQ/2;
    parameter C = 2*HC;
    parameter clockDecimation = 2;
    `define BIT_PERIODS (clockDecimation*C)

    reg reset;
    reg clken;

    // Create the clocks
    reg clk;
    initial clk = 0;
    always #HC clk = clk^clken;

    integer clockDivider;
    reg     clkEn;
    always @(posedge clk) begin
        if (reset) begin
            clockDivider <= clockDecimation - 1;
            clkEn <= 1;
        end
        else begin
            if (clockDivider == 0) begin
                clockDivider <= clockDecimation - 1;
                clkEn <= 1;
            end
            else begin
                clockDivider <= clockDivider - 1;
                clkEn <= 0;
            end
        end
    end


/******************************************************************************
                            Create a bit stream
******************************************************************************/
    // PN8 Random data
    parameter PN17 = 16'h008e,
              MASK17 = 16'h00ff;
    reg [15:0]sr;
    reg [4:0]zeroCount;
    reg  randData;
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            zeroCount <= 5'b0;
            sr <= MASK17;
            end
        else if (clkEn) begin
            if (sr[0] | (zeroCount == 5'b11111)) begin
                zeroCount <= 5'h0;
                sr <= {1'b0, sr[15:1]} ^ PN17;
            end
            else begin
                zeroCount <= zeroCount + 5'h1;
                sr <= sr >> 1;
            end
            randData <= sr[0];
        end
    end

    // Non-systematic R1/2, K7 Convolutional Encoder
    // Uses generator polys G1 = 171 (octal) and G2 = 133
    //wire            vitData = incSR[0];
    wire            vitData = randData;
    //wire            vitData = altData;
    reg     [5:0]   gSR;
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            gSR <= 6'b000000;
        end
        else if (clkEn) begin
            gSR <= {gSR[4:0],vitData};
        end
    end

                         //   x6        x5       x4      x3        x2       x1       x0
    wire         g1BitInv = vitData ^ gSR[0] ^ gSR[1] ^ gSR[2]                   ^ gSR[5];
    wire         g2BitInv = vitData          ^ gSR[1] ^ gSR[2]          ^ gSR[4] ^ gSR[5];
    wire            g1Bit = ~g1BitInv;
    wire            g2Bit = ~g2BitInv;


/******************************************************************************
                     Create Samples with Noise
******************************************************************************/

    // Signal values with a Q17 value of 0.25.
    reg  signed [17:0]  g1Signal;
    reg  signed [17:0]  g2Signal;
    always @* begin
        if (g1Bit) begin
            g1Signal = 18'h38000;
        end
        else begin
            g1Signal = 18'h08000;
        end
        if (g2Bit) begin
            g2Signal = 18'h38000;
        end
        else begin
            g2Signal = 18'h08000;
        end
    end


    // Some test signals use to calibrate the noise level
    reg  measureSNR;
    initial measureSNR = 0;
    real g1SignalReal;
    real g2SignalReal;
    always @* begin
        g1SignalReal = $itor(g1Signal)/(2**17);
        g2SignalReal = $itor(g2Signal)/(2**17);
    end
    reg signed  [17:0]  g1Noise,g2Noise;
    real g1NoiseReal;
    real g2NoiseReal;
    always @* begin
        g1NoiseReal = $itor(g1Noise)/(2**17);
        g2NoiseReal = $itor(g2Noise)/(2**17);
    end


    real signalMagSquared;
    real noiseMagSquared;
    integer txSampleCount;
    always @(posedge clk) begin
        if (clkEn) begin
            `ifdef ADD_NOISE
            g1Noise <= $gaussPLI();
            g2Noise <= $gaussPLI();
            `else
            g1Noise <= 0;
            g2Noise <= 0;
            `endif
            if (measureSNR) begin
                signalMagSquared <= signalMagSquared + (g1SignalReal*g1SignalReal + g2SignalReal*g2SignalReal);
                noiseMagSquared <= noiseMagSquared + (g1NoiseReal*g1NoiseReal + g2NoiseReal*g2NoiseReal);
                txSampleCount <= txSampleCount + 1;
            end
            else begin
                signalMagSquared <= 0.0;
                noiseMagSquared <= 0.0;
                txSampleCount <= 0;
            end
        end
    end

    // Add the signal and noise
    `ifdef HARD_DECISIONS
    wire    signed  [18:0]  g1Sum = {g1Signal[17],g1Signal} + {g1Noise[17],g1Noise};
    reg     signed  [2:0]  g1;
    always @(posedge clk) begin
        if (clkEn) begin
            if (g1Sum[18]) begin
                g1 <= 3'h7;
            end
            else begin
                g1 <= 3'h0;
            end
        end
    end
    wire    signed  [18:0]  g2Sum = {g2Signal[17],g2Signal} + {g2Noise[17],g2Noise};
    reg     signed  [2:0]  g2;
    always @(posedge clk) begin
        if (clkEn) begin
            if (g2Sum[18]) begin
                g2 <= 3'h7;
            end
            else begin
                g2 <= 3'h0;
            end
        end
    end
    `else
    wire    signed  [18:0]  g1Sum = {g1Signal[17],g1Signal} + {g1Noise[17],g1Noise};
    reg     signed  [2:0]  g1;
    always @(posedge clk) begin
        if (clkEn) begin
            `define SOFT_TIMES_TWO
            `ifdef SOFT_TIMES_TWO
            casex (g1Sum[18:16])
                3'b001,
                3'b01x:     g1 <= 3'h0;
                3'b110,
                3'b10x:     g1 <= 3'h7;
                default:    g1 <= {g1Sum[16],~g1Sum[15:14]};
            endcase
            `else
            if (g1Sum[18] & !g1Sum[17]) begin
                g1 <= 3'h7;
            end
            else if (!g1Sum[18] & g1Sum[17]) begin
                g1 <= 3'h0;
            end
            else begin
                g1 <= {g1Sum[17],~g1Sum[16:15]};
            end
            `endif
        end
    end
    wire    signed  [18:0]  g2Sum = {g2Signal[17],g2Signal} + {g2Noise[17],g2Noise};
    reg     signed  [2:0]  g2;
    always @(posedge clk) begin
        if (clkEn) begin
            `ifdef SOFT_TIMES_TWO
            casex (g2Sum[18:16])
                3'b001,
                3'b01x:     g2 <= 3'h0;
                3'b110,
                3'b10x:     g2 <= 3'h7;
                default:    g2 <= {g2Sum[16],~g2Sum[15:14]};
            endcase
            `else
            if (g2Sum[18] & !g2Sum[17]) begin
                g2 <= 3'h7;
            end
            else if (!g2Sum[18] & g2Sum[17]) begin
                g2 <= 3'h0;
            end
            else begin
                g2 <= {g2Sum[17],~g2Sum[16:15]};
            end
            `endif
        end
    end
    `endif





/******************************************************************************
                    Instantiate the Viterbi Core
******************************************************************************/

    reg             vitReset;
    initial         vitReset = 0;
    wire    [15:0]  berCount;
    xilinxViterbiV7p0 xilViterbi(
        .clk(clk),
        .ce(clkEn),
        .sclr(reset | vitReset),
        .data_in0(g1),
        .data_in1(g2),
        .rdy(viterbiBitEn),
        .data_out(bitOut),
        .norm(norm),
        .ber_done(berDone),
        .ber(berCount)
    );


/******************************************************************************
                       Delay Line for BER Testing
******************************************************************************/

reg     [511:0] vitDataSR;
reg             vitDataDelay;
reg     [511:0] g1SR;
wire            g1Delay = g1SR[0];
always @(posedge clk) begin
    if (clkEn) begin
        vitDataDelay <= vitDataSR[447];
        vitDataSR <= {vitDataSR[510:0],vitData};
        g1SR <= {g1SR[510:0],g1Bit};
        end
    end

reg testBits;
initial testBits = 0;
reg     bitError;
integer vitErrors;
initial vitErrors = 0;
integer g1Errors;
initial g1Errors = 0;
integer testBitCount;
initial testBitCount = 0;
always @(posedge clk) begin
    if (clkEn) begin
        if (testBits) begin
            testBitCount <= testBitCount + 1;
            if (bitOut != vitDataDelay) begin
                bitError <= 1;
                vitErrors <= vitErrors + 1;
                end
            else begin
                bitError <= 0;
                end
            if (g1[2] != g1Delay) begin
                g1Errors <= g1Errors + 1;
                end
            if ((testBitCount % 100) == 0) begin
                $display("%d %d %d",testBitCount,g1Errors,vitErrors);
                end
            end

        end
    end



initial begin

    `ifdef ADD_NOISE
    // The 12.0 is to adjust for the signal amplitude.
    // The -3 is to translate from SNR to EBNO
    $initGaussPLI(1,4.0 + 12 - 3,131072.0);
    `endif
    reset = 0;
    clk = 0;

    // Turn on the clock
    clken=1;
    #(10*C) ;

    // Reset
    reset = 1;
    #(2*C) ;
    reset = 0;

    // Wait for some data to pass thru
    #(50*`BIT_PERIODS) ;

    // Reset the viterbi core
    vitReset = 1;
    #(2*C) ;
    vitReset = 0;

    // Wait for some data to pass thru
    #(500*`BIT_PERIODS) ;

    // Turn on the BERT
    testBits = 1;
    measureSNR = 1;
    // Run the BERT
    #(100000*`BIT_PERIODS) ;
    $stop;

    end

endmodule

