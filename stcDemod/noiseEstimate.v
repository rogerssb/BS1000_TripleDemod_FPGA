`timescale 1ns/1ps

module NoiseEstimate
    #(
    parameter SAMPLE_BITS   =   8,
    parameter EST_BITS      =   8,
    parameter PILOT_BITS    =   6,
    parameter LOG_BITS      =   11
    )
(
    input                   clk,
    input                   clk186,
    input                   ce,
    input                   reset,
    input                   startIn,
    input                   validIn,
    input   signed  [17:0]  iIn,
    input   signed  [17:0]  qIn,
    input                   channelEstimatesDone,
    input           [6:0]   tau0Estimate,
    input   signed  [17:0]  h0RealEstimate,
    input   signed  [17:0]  h0ImagEstimate,
    input           [6:0]   tau1Estimate,
    input   signed  [17:0]  h1RealEstimate,
    input   signed  [17:0]  h1ImagEstimate,
    output  reg             log10MseEnable,
    output  signed  [LOG_BITS-1:0]  log10MSE
);

    `define PILOT_LENGTH_IN_SAMPLES     512
    `define MPY_BITS (PILOT_BITS + EST_BITS)

    /*
    function signed [SAMPLE_BITS-1:0]   round
        #(
        parameter ROUND_BITS  =   8
        )
    (
        input   signed  [17:0]  data
    );

        if (data < 0) begin
            round = data[17-ROUND_BITS] ? $signed(data[17:(18-ROUND_BITS)])
                                        : $signed(data[17:(18-ROUND_BITS)]) - 1;
        end
        else begin
            round = data[17-ROUND_BITS] ? $signed(data[17:(18-ROUND_BITS)]) + 1
                                        : $signed(data[17:(18-ROUND_BITS)]);
        end
    endfunction
    */
    `define ROUND(d,n)                                         \
        (d < 0) ? d[17-n] ? $signed(d[17:(18-n)])              \
                          : ($signed(d[17:(18-n)]) - 1)        \
                : d[17-n] ? ($signed(d[17:(18-n)]) + 1)        \
                          : $signed(d[17:(18-n)])

    /*
    Each pilot template is 128 bits long with 4 samples per bit. We start with the
    pilot template include file from the C-language simulation and use that to create
    the four template ROMs. The floating point values are quantized to 5 bits. This
    gives us quantization noise of less than -(4 bits * 6 dB per bit) = -24 dB which
    is greater than the simulated dynamic range of our noise estimator. This minimizes
    the number of gates required to calculate the estimate.

    The template file has values exactly equal to +/1 1.0. While we can represent -1.0
    exactly in the two's complement encoding, we cannot do +1.0. Therefore, we modify
    the +/- 1.0 values to be +/- 15/16 so they encode correctly in the quantized table.
    */
    wire        [$clog2(`PILOT_LENGTH_IN_SAMPLES)-1 : 0]    pilot0Address;
    wire        [$clog2(`PILOT_LENGTH_IN_SAMPLES)-1 : 0]    pilot1Address;

    reg signed  [PILOT_BITS-1:0]   p0r;
    always @* begin
        case (pilot0Address)
           0  :  p0r = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           1  :  p0r = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           2  :  p0r = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           3  :  p0r = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           4  :  p0r = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           5  :  p0r = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           6  :  p0r = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           7  :  p0r = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           8  :  p0r = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           9  :  p0r = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           10 :  p0r = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           11 :  p0r = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           12 :  p0r = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           13 :  p0r = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           14 :  p0r = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           15 :  p0r = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           16 :  p0r = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           17 :  p0r = 21;      //    $rtoi( 0.65328148*(2.0**(PILOT_BITS-1)));
           18 :  p0r = 16;      //    $rtoi( 0.50000000*(2.0**(PILOT_BITS-1)));
           19 :  p0r = 9;       //     $rtoi( 0.27059805*(2.0**(PILOT_BITS-1)));
           20 :  p0r = 0;       //     $rtoi( 0.00000000*(2.0**(PILOT_BITS-1)));
           21 :  p0r = -9;      //    $rtoi(-0.27059805*(2.0**(PILOT_BITS-1)));
           22 :  p0r = -16;     //   $rtoi(-0.50000000*(2.0**(PILOT_BITS-1)));
           23 :  p0r = -21;     //   $rtoi(-0.65328148*(2.0**(PILOT_BITS-1)));
           24 :  p0r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           25 :  p0r = -21;     //   $rtoi(-0.65328148*(2.0**(PILOT_BITS-1)));
           26 :  p0r = -16;     //   $rtoi(-0.50000000*(2.0**(PILOT_BITS-1)));
           27 :  p0r = -9;      //    $rtoi(-0.27059805*(2.0**(PILOT_BITS-1)));
           28 :  p0r = 0;       //     $rtoi( 0.00000000*(2.0**(PILOT_BITS-1)));
           29 :  p0r = 9;       //     $rtoi( 0.27059805*(2.0**(PILOT_BITS-1)));
           30 :  p0r = 16;      //    $rtoi( 0.50000000*(2.0**(PILOT_BITS-1)));
           31 :  p0r = 21;      //    $rtoi( 0.65328148*(2.0**(PILOT_BITS-1)));
           32 :  p0r = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           33 :  p0r = 21;      //    $rtoi( 0.65328148*(2.0**(PILOT_BITS-1)));
           34 :  p0r = 16;      //    $rtoi( 0.50000000*(2.0**(PILOT_BITS-1)));
           35 :  p0r = 9;       //     $rtoi( 0.27059805*(2.0**(PILOT_BITS-1)));
           36 :  p0r = 0;       //     $rtoi( 0.00000000*(2.0**(PILOT_BITS-1)));
           37 :  p0r = -9;      //    $rtoi(-0.27059805*(2.0**(PILOT_BITS-1)));
           38 :  p0r = -16;     //   $rtoi(-0.50000000*(2.0**(PILOT_BITS-1)));
           39 :  p0r = -21;     //   $rtoi(-0.65328148*(2.0**(PILOT_BITS-1)));
           40 :  p0r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           41 :  p0r = -21;     //   $rtoi(-0.65328148*(2.0**(PILOT_BITS-1)));
           42 :  p0r = -16;     //   $rtoi(-0.50000000*(2.0**(PILOT_BITS-1)));
           43 :  p0r = -9;      //    $rtoi(-0.27059805*(2.0**(PILOT_BITS-1)));
           44 :  p0r = 0;       //     $rtoi( 0.00000000*(2.0**(PILOT_BITS-1)));
           45 :  p0r = 12;      //    $rtoi( 0.38268343*(2.0**(PILOT_BITS-1)));
           46 :  p0r = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           47 :  p0r = 30;      //    $rtoi( 0.92387953*(2.0**(PILOT_BITS-1)));
           48 :  p0r = 31;      //    $rtoi( 0.93750000*(2.0**(PILOT_BITS-1)));
           49 :  p0r = 30;      //    $rtoi( 0.92387953*(2.0**(PILOT_BITS-1)));
           50 :  p0r = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           51 :  p0r = 12;      //    $rtoi( 0.38268343*(2.0**(PILOT_BITS-1)));
           52 :  p0r = 0;       //     $rtoi( 0.00000000*(2.0**(PILOT_BITS-1)));
           53 :  p0r = -9;      //    $rtoi(-0.27059805*(2.0**(PILOT_BITS-1)));
           54 :  p0r = -16;     //   $rtoi(-0.50000000*(2.0**(PILOT_BITS-1)));
           55 :  p0r = -21;     //   $rtoi(-0.65328148*(2.0**(PILOT_BITS-1)));
           56 :  p0r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           57 :  p0r = -21;     //   $rtoi(-0.65328148*(2.0**(PILOT_BITS-1)));
           58 :  p0r = -16;     //   $rtoi(-0.50000000*(2.0**(PILOT_BITS-1)));
           59 :  p0r = -9;      //    $rtoi(-0.27059805*(2.0**(PILOT_BITS-1)));
           60 :  p0r = 0;       //     $rtoi( 0.00000000*(2.0**(PILOT_BITS-1)));
           61 :  p0r = 12;      //    $rtoi( 0.38268343*(2.0**(PILOT_BITS-1)));
           62 :  p0r = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           63 :  p0r = 30;      //    $rtoi( 0.92387953*(2.0**(PILOT_BITS-1)));
           64 :  p0r = 31;      //    $rtoi( 0.93750000*(2.0**(PILOT_BITS-1)));
           65 :  p0r = 30;      //    $rtoi( 0.92387953*(2.0**(PILOT_BITS-1)));
           66 :  p0r = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           67 :  p0r = 12;      //    $rtoi( 0.38268343*(2.0**(PILOT_BITS-1)));
           68 :  p0r = 0;       //     $rtoi( 0.00000000*(2.0**(PILOT_BITS-1)));
           69 :  p0r = -12;     //   $rtoi(-0.38268343*(2.0**(PILOT_BITS-1)));
           70 :  p0r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           71 :  p0r = -30;     //   $rtoi(-0.92387953*(2.0**(PILOT_BITS-1)));
           72 :  p0r = -31;     //   $rtoi(-0.93750000*(2.0**(PILOT_BITS-1)));
           73 :  p0r = -30;     //   $rtoi(-0.92387953*(2.0**(PILOT_BITS-1)));
           74 :  p0r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           75 :  p0r = -12;     //   $rtoi(-0.38268343*(2.0**(PILOT_BITS-1)));
           76 :  p0r = 0;       //     $rtoi( 0.00000000*(2.0**(PILOT_BITS-1)));
           77 :  p0r = 12;      //    $rtoi( 0.38268343*(2.0**(PILOT_BITS-1)));
           78 :  p0r = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           79 :  p0r = 30;      //    $rtoi( 0.92387953*(2.0**(PILOT_BITS-1)));
           80 :  p0r = 31;      //    $rtoi( 0.93750000*(2.0**(PILOT_BITS-1)));
           81 :  p0r = 31;      //    $rtoi( 0.96269242*(2.0**(PILOT_BITS-1)));
           82 :  p0r = 28;      //    $rtoi( 0.86602540*(2.0**(PILOT_BITS-1)));
           83 :  p0r = 24;      //    $rtoi( 0.75711512*(2.0**(PILOT_BITS-1)));
           84 :  p0r = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           85 :  p0r = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           86 :  p0r = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           87 :  p0r = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           88 :  p0r = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           89 :  p0r = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           90 :  p0r = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           91 :  p0r = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           92 :  p0r = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           93 :  p0r = 24;      //    $rtoi( 0.75711512*(2.0**(PILOT_BITS-1)));
           94 :  p0r = 28;      //    $rtoi( 0.86602540*(2.0**(PILOT_BITS-1)));
           95 :  p0r = 31;      //    $rtoi( 0.96269242*(2.0**(PILOT_BITS-1)));
           96 :  p0r = 31;      //    $rtoi( 0.93750000*(2.0**(PILOT_BITS-1)));
           97 :  p0r = 30;      //    $rtoi( 0.92387953*(2.0**(PILOT_BITS-1)));
           98 :  p0r = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           99 :  p0r = 12;      //    $rtoi( 0.38268343*(2.0**(PILOT_BITS-1)));
           100:  p0r = 0;       //     $rtoi( 0.00000000*(2.0**(PILOT_BITS-1)));
           101:  p0r = -9;      //    $rtoi(-0.27059805*(2.0**(PILOT_BITS-1)));
           102:  p0r = -16;     //   $rtoi(-0.50000000*(2.0**(PILOT_BITS-1)));
           103:  p0r = -21;     //   $rtoi(-0.65328148*(2.0**(PILOT_BITS-1)));
           104:  p0r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           105:  p0r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           106:  p0r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           107:  p0r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           108:  p0r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           109:  p0r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           110:  p0r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           111:  p0r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           112:  p0r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           113:  p0r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           114:  p0r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           115:  p0r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           116:  p0r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           117:  p0r = -24;     //   $rtoi(-0.75711512*(2.0**(PILOT_BITS-1)));
           118:  p0r = -28;     //   $rtoi(-0.86602540*(2.0**(PILOT_BITS-1)));
           119:  p0r = -31;     //   $rtoi(-0.96269242*(2.0**(PILOT_BITS-1)));
           120:  p0r = -31;     //   $rtoi(-0.93750000*(2.0**(PILOT_BITS-1)));
           121:  p0r = -30;     //   $rtoi(-0.92387953*(2.0**(PILOT_BITS-1)));
           122:  p0r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           123:  p0r = -12;     //   $rtoi(-0.38268343*(2.0**(PILOT_BITS-1)));
           124:  p0r = 0;       //     $rtoi( 0.00000000*(2.0**(PILOT_BITS-1)));
           125:  p0r = 12;      //    $rtoi( 0.38268343*(2.0**(PILOT_BITS-1)));
           126:  p0r = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           127:  p0r = 30;      //    $rtoi( 0.92387953*(2.0**(PILOT_BITS-1)));
           128:  p0r = 31;      //    $rtoi( 0.93750000*(2.0**(PILOT_BITS-1)));
           129:  p0r = 30;      //    $rtoi( 0.92387953*(2.0**(PILOT_BITS-1)));
           130:  p0r = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           131:  p0r = 12;      //    $rtoi( 0.38268343*(2.0**(PILOT_BITS-1)));
           132:  p0r = 0;       //     $rtoi( 0.00000000*(2.0**(PILOT_BITS-1)));
           133:  p0r = -9;      //    $rtoi(-0.27059805*(2.0**(PILOT_BITS-1)));
           134:  p0r = -16;     //   $rtoi(-0.50000000*(2.0**(PILOT_BITS-1)));
           135:  p0r = -21;     //   $rtoi(-0.65328148*(2.0**(PILOT_BITS-1)));
           136:  p0r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           137:  p0r = -21;     //   $rtoi(-0.65328148*(2.0**(PILOT_BITS-1)));
           138:  p0r = -16;     //   $rtoi(-0.50000000*(2.0**(PILOT_BITS-1)));
           139:  p0r = -9;      //    $rtoi(-0.27059805*(2.0**(PILOT_BITS-1)));
           140:  p0r = 0;       //     $rtoi( 0.00000000*(2.0**(PILOT_BITS-1)));
           141:  p0r = 9;       //     $rtoi( 0.27059805*(2.0**(PILOT_BITS-1)));
           142:  p0r = 16;      //    $rtoi( 0.50000000*(2.0**(PILOT_BITS-1)));
           143:  p0r = 21;      //    $rtoi( 0.65328148*(2.0**(PILOT_BITS-1)));
           144:  p0r = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           145:  p0r = 21;      //    $rtoi( 0.65328148*(2.0**(PILOT_BITS-1)));
           146:  p0r = 16;      //    $rtoi( 0.50000000*(2.0**(PILOT_BITS-1)));
           147:  p0r = 9;       //     $rtoi( 0.27059805*(2.0**(PILOT_BITS-1)));
           148:  p0r = 0;       //     $rtoi( 0.00000000*(2.0**(PILOT_BITS-1)));
           149:  p0r = -12;     //   $rtoi(-0.38268343*(2.0**(PILOT_BITS-1)));
           150:  p0r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           151:  p0r = -30;     //   $rtoi(-0.92387953*(2.0**(PILOT_BITS-1)));
           152:  p0r = -31;     //   $rtoi(-0.93750000*(2.0**(PILOT_BITS-1)));
           153:  p0r = -31;     //   $rtoi(-0.96269242*(2.0**(PILOT_BITS-1)));
           154:  p0r = -28;     //   $rtoi(-0.86602540*(2.0**(PILOT_BITS-1)));
           155:  p0r = -24;     //   $rtoi(-0.75711512*(2.0**(PILOT_BITS-1)));
           156:  p0r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           157:  p0r = -24;     //   $rtoi(-0.75711512*(2.0**(PILOT_BITS-1)));
           158:  p0r = -28;     //   $rtoi(-0.86602540*(2.0**(PILOT_BITS-1)));
           159:  p0r = -31;     //   $rtoi(-0.96269242*(2.0**(PILOT_BITS-1)));
           160:  p0r = -31;     //   $rtoi(-0.93750000*(2.0**(PILOT_BITS-1)));
           161:  p0r = -31;     //   $rtoi(-0.96269242*(2.0**(PILOT_BITS-1)));
           162:  p0r = -28;     //   $rtoi(-0.86602540*(2.0**(PILOT_BITS-1)));
           163:  p0r = -24;     //   $rtoi(-0.75711512*(2.0**(PILOT_BITS-1)));
           164:  p0r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           165:  p0r = -24;     //   $rtoi(-0.75711512*(2.0**(PILOT_BITS-1)));
           166:  p0r = -28;     //   $rtoi(-0.86602540*(2.0**(PILOT_BITS-1)));
           167:  p0r = -31;     //   $rtoi(-0.96269242*(2.0**(PILOT_BITS-1)));
           168:  p0r = -31;     //   $rtoi(-0.93750000*(2.0**(PILOT_BITS-1)));
           169:  p0r = -31;     //   $rtoi(-0.96269242*(2.0**(PILOT_BITS-1)));
           170:  p0r = -28;     //   $rtoi(-0.86602540*(2.0**(PILOT_BITS-1)));
           171:  p0r = -24;     //   $rtoi(-0.75711512*(2.0**(PILOT_BITS-1)));
           172:  p0r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           173:  p0r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           174:  p0r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           175:  p0r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           176:  p0r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           177:  p0r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           178:  p0r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           179:  p0r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           180:  p0r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           181:  p0r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           182:  p0r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           183:  p0r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           184:  p0r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           185:  p0r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           186:  p0r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           187:  p0r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           188:  p0r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           189:  p0r = -24;     //   $rtoi(-0.75711512*(2.0**(PILOT_BITS-1)));
           190:  p0r = -28;     //   $rtoi(-0.86602540*(2.0**(PILOT_BITS-1)));
           191:  p0r = -31;     //   $rtoi(-0.96269242*(2.0**(PILOT_BITS-1)));
           192:  p0r = -31;     //   $rtoi(-0.93750000*(2.0**(PILOT_BITS-1)));
           193:  p0r = -31;     //   $rtoi(-0.96269242*(2.0**(PILOT_BITS-1)));
           194:  p0r = -28;     //   $rtoi(-0.86602540*(2.0**(PILOT_BITS-1)));
           195:  p0r = -24;     //   $rtoi(-0.75711512*(2.0**(PILOT_BITS-1)));
           196:  p0r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           197:  p0r = -24;     //   $rtoi(-0.75711512*(2.0**(PILOT_BITS-1)));
           198:  p0r = -28;     //   $rtoi(-0.86602540*(2.0**(PILOT_BITS-1)));
           199:  p0r = -31;     //   $rtoi(-0.96269242*(2.0**(PILOT_BITS-1)));
           200:  p0r = -31;     //   $rtoi(-0.93750000*(2.0**(PILOT_BITS-1)));
           201:  p0r = -30;     //   $rtoi(-0.92387953*(2.0**(PILOT_BITS-1)));
           202:  p0r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           203:  p0r = -12;     //   $rtoi(-0.38268343*(2.0**(PILOT_BITS-1)));
           204:  p0r = 0;       //     $rtoi( 0.00000000*(2.0**(PILOT_BITS-1)));
           205:  p0r = 9;       //     $rtoi( 0.27059805*(2.0**(PILOT_BITS-1)));
           206:  p0r = 16;      //    $rtoi( 0.50000000*(2.0**(PILOT_BITS-1)));
           207:  p0r = 21;      //    $rtoi( 0.65328148*(2.0**(PILOT_BITS-1)));
           208:  p0r = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           209:  p0r = 21;      //    $rtoi( 0.65328148*(2.0**(PILOT_BITS-1)));
           210:  p0r = 16;      //    $rtoi( 0.50000000*(2.0**(PILOT_BITS-1)));
           211:  p0r = 9;       //     $rtoi( 0.27059805*(2.0**(PILOT_BITS-1)));
           212:  p0r = 0;       //     $rtoi( 0.00000000*(2.0**(PILOT_BITS-1)));
           213:  p0r = -12;     //   $rtoi(-0.38268343*(2.0**(PILOT_BITS-1)));
           214:  p0r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           215:  p0r = -30;     //   $rtoi(-0.92387953*(2.0**(PILOT_BITS-1)));
           216:  p0r = -31;     //   $rtoi(-0.93750000*(2.0**(PILOT_BITS-1)));
           217:  p0r = -31;     //   $rtoi(-0.96269242*(2.0**(PILOT_BITS-1)));
           218:  p0r = -28;     //   $rtoi(-0.86602540*(2.0**(PILOT_BITS-1)));
           219:  p0r = -24;     //   $rtoi(-0.75711512*(2.0**(PILOT_BITS-1)));
           220:  p0r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           221:  p0r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           222:  p0r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           223:  p0r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           224:  p0r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           225:  p0r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           226:  p0r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           227:  p0r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           228:  p0r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           229:  p0r = -24;     //   $rtoi(-0.75711512*(2.0**(PILOT_BITS-1)));
           230:  p0r = -28;     //   $rtoi(-0.86602540*(2.0**(PILOT_BITS-1)));
           231:  p0r = -31;     //   $rtoi(-0.96269242*(2.0**(PILOT_BITS-1)));
           232:  p0r = -31;     //   $rtoi(-0.93750000*(2.0**(PILOT_BITS-1)));
           233:  p0r = -31;     //   $rtoi(-0.96269242*(2.0**(PILOT_BITS-1)));
           234:  p0r = -28;     //   $rtoi(-0.86602540*(2.0**(PILOT_BITS-1)));
           235:  p0r = -24;     //   $rtoi(-0.75711512*(2.0**(PILOT_BITS-1)));
           236:  p0r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           237:  p0r = -24;     //   $rtoi(-0.75711512*(2.0**(PILOT_BITS-1)));
           238:  p0r = -28;     //   $rtoi(-0.86602540*(2.0**(PILOT_BITS-1)));
           239:  p0r = -31;     //   $rtoi(-0.96269242*(2.0**(PILOT_BITS-1)));
           240:  p0r = -31;     //   $rtoi(-0.93750000*(2.0**(PILOT_BITS-1)));
           241:  p0r = -30;     //   $rtoi(-0.92387953*(2.0**(PILOT_BITS-1)));
           242:  p0r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           243:  p0r = -12;     //   $rtoi(-0.38268343*(2.0**(PILOT_BITS-1)));
           244:  p0r = 0;       //     $rtoi( 0.00000000*(2.0**(PILOT_BITS-1)));
           245:  p0r = 9;       //     $rtoi( 0.27059805*(2.0**(PILOT_BITS-1)));
           246:  p0r = 16;      //    $rtoi( 0.50000000*(2.0**(PILOT_BITS-1)));
           247:  p0r = 21;      //    $rtoi( 0.65328148*(2.0**(PILOT_BITS-1)));
           248:  p0r = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           249:  p0r = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           250:  p0r = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           251:  p0r = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           252:  p0r = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           253:  p0r = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           254:  p0r = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           255:  p0r = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           256:  p0r = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           257:  p0r = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           258:  p0r = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           259:  p0r = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           260:  p0r = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           261:  p0r = 24;      //    $rtoi( 0.75711512*(2.0**(PILOT_BITS-1)));
           262:  p0r = 28;      //    $rtoi( 0.86602540*(2.0**(PILOT_BITS-1)));
           263:  p0r = 31;      //    $rtoi( 0.96269242*(2.0**(PILOT_BITS-1)));
           264:  p0r = 31;      //    $rtoi( 0.93750000*(2.0**(PILOT_BITS-1)));
           265:  p0r = 30;      //    $rtoi( 0.92387953*(2.0**(PILOT_BITS-1)));
           266:  p0r = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           267:  p0r = 12;      //    $rtoi( 0.38268343*(2.0**(PILOT_BITS-1)));
           268:  p0r = 0;       //     $rtoi( 0.00000000*(2.0**(PILOT_BITS-1)));
           269:  p0r = -9;      //    $rtoi(-0.27059805*(2.0**(PILOT_BITS-1)));
           270:  p0r = -16;     //   $rtoi(-0.50000000*(2.0**(PILOT_BITS-1)));
           271:  p0r = -21;     //   $rtoi(-0.65328148*(2.0**(PILOT_BITS-1)));
           272:  p0r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           273:  p0r = -21;     //   $rtoi(-0.65328148*(2.0**(PILOT_BITS-1)));
           274:  p0r = -16;     //   $rtoi(-0.50000000*(2.0**(PILOT_BITS-1)));
           275:  p0r = -9;      //    $rtoi(-0.27059805*(2.0**(PILOT_BITS-1)));
           276:  p0r = 0;       //     $rtoi( 0.00000000*(2.0**(PILOT_BITS-1)));
           277:  p0r = 9;       //     $rtoi( 0.27059805*(2.0**(PILOT_BITS-1)));
           278:  p0r = 16;      //    $rtoi( 0.50000000*(2.0**(PILOT_BITS-1)));
           279:  p0r = 21;      //    $rtoi( 0.65328148*(2.0**(PILOT_BITS-1)));
           280:  p0r = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           281:  p0r = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           282:  p0r = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           283:  p0r = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           284:  p0r = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           285:  p0r = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           286:  p0r = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           287:  p0r = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           288:  p0r = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           289:  p0r = 21;      //    $rtoi( 0.65328148*(2.0**(PILOT_BITS-1)));
           290:  p0r = 16;      //    $rtoi( 0.50000000*(2.0**(PILOT_BITS-1)));
           291:  p0r = 9;       //     $rtoi( 0.27059805*(2.0**(PILOT_BITS-1)));
           292:  p0r = 0;       //     $rtoi( 0.00000000*(2.0**(PILOT_BITS-1)));
           293:  p0r = -12;     //   $rtoi(-0.38268343*(2.0**(PILOT_BITS-1)));
           294:  p0r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           295:  p0r = -30;     //   $rtoi(-0.92387953*(2.0**(PILOT_BITS-1)));
           296:  p0r = -31;     //   $rtoi(-0.93750000*(2.0**(PILOT_BITS-1)));
           297:  p0r = -31;     //   $rtoi(-0.96269242*(2.0**(PILOT_BITS-1)));
           298:  p0r = -28;     //   $rtoi(-0.86602540*(2.0**(PILOT_BITS-1)));
           299:  p0r = -24;     //   $rtoi(-0.75711512*(2.0**(PILOT_BITS-1)));
           300:  p0r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           301:  p0r = -24;     //   $rtoi(-0.75711512*(2.0**(PILOT_BITS-1)));
           302:  p0r = -28;     //   $rtoi(-0.86602540*(2.0**(PILOT_BITS-1)));
           303:  p0r = -31;     //   $rtoi(-0.96269242*(2.0**(PILOT_BITS-1)));
           304:  p0r = -31;     //   $rtoi(-0.93750000*(2.0**(PILOT_BITS-1)));
           305:  p0r = -30;     //   $rtoi(-0.92387953*(2.0**(PILOT_BITS-1)));
           306:  p0r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           307:  p0r = -12;     //   $rtoi(-0.38268343*(2.0**(PILOT_BITS-1)));
           308:  p0r = 0;       //     $rtoi( 0.00000000*(2.0**(PILOT_BITS-1)));
           309:  p0r = 9;       //     $rtoi( 0.27059805*(2.0**(PILOT_BITS-1)));
           310:  p0r = 16;      //    $rtoi( 0.50000000*(2.0**(PILOT_BITS-1)));
           311:  p0r = 21;      //    $rtoi( 0.65328148*(2.0**(PILOT_BITS-1)));
           312:  p0r = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           313:  p0r = 21;      //    $rtoi( 0.65328148*(2.0**(PILOT_BITS-1)));
           314:  p0r = 16;      //    $rtoi( 0.50000000*(2.0**(PILOT_BITS-1)));
           315:  p0r = 9;       //     $rtoi( 0.27059805*(2.0**(PILOT_BITS-1)));
           316:  p0r = 0;       //     $rtoi( 0.00000000*(2.0**(PILOT_BITS-1)));
           317:  p0r = -9;      //    $rtoi(-0.27059805*(2.0**(PILOT_BITS-1)));
           318:  p0r = -16;     //   $rtoi(-0.50000000*(2.0**(PILOT_BITS-1)));
           319:  p0r = -21;     //   $rtoi(-0.65328148*(2.0**(PILOT_BITS-1)));
           320:  p0r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           321:  p0r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           322:  p0r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           323:  p0r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           324:  p0r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           325:  p0r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           326:  p0r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           327:  p0r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           328:  p0r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           329:  p0r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           330:  p0r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           331:  p0r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           332:  p0r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           333:  p0r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           334:  p0r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           335:  p0r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           336:  p0r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           337:  p0r = -21;     //   $rtoi(-0.65328148*(2.0**(PILOT_BITS-1)));
           338:  p0r = -16;     //   $rtoi(-0.50000000*(2.0**(PILOT_BITS-1)));
           339:  p0r = -9;      //    $rtoi(-0.27059805*(2.0**(PILOT_BITS-1)));
           340:  p0r = 0;       //     $rtoi( 0.00000000*(2.0**(PILOT_BITS-1)));
           341:  p0r = 9;       //     $rtoi( 0.27059805*(2.0**(PILOT_BITS-1)));
           342:  p0r = 16;      //    $rtoi( 0.50000000*(2.0**(PILOT_BITS-1)));
           343:  p0r = 21;      //    $rtoi( 0.65328148*(2.0**(PILOT_BITS-1)));
           344:  p0r = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           345:  p0r = 21;      //    $rtoi( 0.65328148*(2.0**(PILOT_BITS-1)));
           346:  p0r = 16;      //    $rtoi( 0.50000000*(2.0**(PILOT_BITS-1)));
           347:  p0r = 9;       //     $rtoi( 0.27059805*(2.0**(PILOT_BITS-1)));
           348:  p0r = 0;       //     $rtoi( 0.00000000*(2.0**(PILOT_BITS-1)));
           349:  p0r = -9;      //    $rtoi(-0.27059805*(2.0**(PILOT_BITS-1)));
           350:  p0r = -16;     //   $rtoi(-0.50000000*(2.0**(PILOT_BITS-1)));
           351:  p0r = -21;     //   $rtoi(-0.65328148*(2.0**(PILOT_BITS-1)));
           352:  p0r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           353:  p0r = -21;     //   $rtoi(-0.65328148*(2.0**(PILOT_BITS-1)));
           354:  p0r = -16;     //   $rtoi(-0.50000000*(2.0**(PILOT_BITS-1)));
           355:  p0r = -9;      //    $rtoi(-0.27059805*(2.0**(PILOT_BITS-1)));
           356:  p0r = 0;       //     $rtoi( 0.00000000*(2.0**(PILOT_BITS-1)));
           357:  p0r = 12;      //    $rtoi( 0.38268343*(2.0**(PILOT_BITS-1)));
           358:  p0r = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           359:  p0r = 30;      //    $rtoi( 0.92387953*(2.0**(PILOT_BITS-1)));
           360:  p0r = 31;      //    $rtoi( 0.93750000*(2.0**(PILOT_BITS-1)));
           361:  p0r = 31;      //    $rtoi( 0.96269242*(2.0**(PILOT_BITS-1)));
           362:  p0r = 28;      //    $rtoi( 0.86602540*(2.0**(PILOT_BITS-1)));
           363:  p0r = 24;      //    $rtoi( 0.75711512*(2.0**(PILOT_BITS-1)));
           364:  p0r = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           365:  p0r = 24;      //    $rtoi( 0.75711512*(2.0**(PILOT_BITS-1)));
           366:  p0r = 28;      //    $rtoi( 0.86602540*(2.0**(PILOT_BITS-1)));
           367:  p0r = 31;      //    $rtoi( 0.96269242*(2.0**(PILOT_BITS-1)));
           368:  p0r = 31;      //    $rtoi( 0.93750000*(2.0**(PILOT_BITS-1)));
           369:  p0r = 31;      //    $rtoi( 0.96269242*(2.0**(PILOT_BITS-1)));
           370:  p0r = 28;      //    $rtoi( 0.86602540*(2.0**(PILOT_BITS-1)));
           371:  p0r = 24;      //    $rtoi( 0.75711512*(2.0**(PILOT_BITS-1)));
           372:  p0r = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           373:  p0r = 24;      //    $rtoi( 0.75711512*(2.0**(PILOT_BITS-1)));
           374:  p0r = 28;      //    $rtoi( 0.86602540*(2.0**(PILOT_BITS-1)));
           375:  p0r = 31;      //    $rtoi( 0.96269242*(2.0**(PILOT_BITS-1)));
           376:  p0r = 31;      //    $rtoi( 0.93750000*(2.0**(PILOT_BITS-1)));
           377:  p0r = 30;      //    $rtoi( 0.92387953*(2.0**(PILOT_BITS-1)));
           378:  p0r = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           379:  p0r = 12;      //    $rtoi( 0.38268343*(2.0**(PILOT_BITS-1)));
           380:  p0r = 0;       //     $rtoi( 0.00000000*(2.0**(PILOT_BITS-1)));
           381:  p0r = -12;     //   $rtoi(-0.38268343*(2.0**(PILOT_BITS-1)));
           382:  p0r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           383:  p0r = -30;     //   $rtoi(-0.92387953*(2.0**(PILOT_BITS-1)));
           384:  p0r = -31;     //   $rtoi(-0.93750000*(2.0**(PILOT_BITS-1)));
           385:  p0r = -30;     //   $rtoi(-0.92387953*(2.0**(PILOT_BITS-1)));
           386:  p0r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           387:  p0r = -12;     //   $rtoi(-0.38268343*(2.0**(PILOT_BITS-1)));
           388:  p0r = 0;       //     $rtoi( 0.00000000*(2.0**(PILOT_BITS-1)));
           389:  p0r = 9;       //     $rtoi( 0.27059805*(2.0**(PILOT_BITS-1)));
           390:  p0r = 16;      //    $rtoi( 0.50000000*(2.0**(PILOT_BITS-1)));
           391:  p0r = 21;      //    $rtoi( 0.65328148*(2.0**(PILOT_BITS-1)));
           392:  p0r = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           393:  p0r = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           394:  p0r = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           395:  p0r = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           396:  p0r = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           397:  p0r = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           398:  p0r = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           399:  p0r = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           400:  p0r = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           401:  p0r = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           402:  p0r = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           403:  p0r = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           404:  p0r = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           405:  p0r = 24;      //    $rtoi( 0.75711512*(2.0**(PILOT_BITS-1)));
           406:  p0r = 28;      //    $rtoi( 0.86602540*(2.0**(PILOT_BITS-1)));
           407:  p0r = 31;      //    $rtoi( 0.96269242*(2.0**(PILOT_BITS-1)));
           408:  p0r = 31;      //    $rtoi( 0.93750000*(2.0**(PILOT_BITS-1)));
           409:  p0r = 30;      //    $rtoi( 0.92387953*(2.0**(PILOT_BITS-1)));
           410:  p0r = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           411:  p0r = 12;      //    $rtoi( 0.38268343*(2.0**(PILOT_BITS-1)));
           412:  p0r = 0;       //     $rtoi( 0.00000000*(2.0**(PILOT_BITS-1)));
           413:  p0r = -9;      //    $rtoi(-0.27059805*(2.0**(PILOT_BITS-1)));
           414:  p0r = -16;     //   $rtoi(-0.50000000*(2.0**(PILOT_BITS-1)));
           415:  p0r = -21;     //   $rtoi(-0.65328148*(2.0**(PILOT_BITS-1)));
           416:  p0r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           417:  p0r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           418:  p0r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           419:  p0r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           420:  p0r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           421:  p0r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           422:  p0r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           423:  p0r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           424:  p0r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           425:  p0r = -21;     //   $rtoi(-0.65328148*(2.0**(PILOT_BITS-1)));
           426:  p0r = -16;     //   $rtoi(-0.50000000*(2.0**(PILOT_BITS-1)));
           427:  p0r = -9;      //    $rtoi(-0.27059805*(2.0**(PILOT_BITS-1)));
           428:  p0r = 0;       //     $rtoi( 0.00000000*(2.0**(PILOT_BITS-1)));
           429:  p0r = 12;      //    $rtoi( 0.38268343*(2.0**(PILOT_BITS-1)));
           430:  p0r = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           431:  p0r = 30;      //    $rtoi( 0.92387953*(2.0**(PILOT_BITS-1)));
           432:  p0r = 31;      //    $rtoi( 0.93750000*(2.0**(PILOT_BITS-1)));
           433:  p0r = 30;      //    $rtoi( 0.92387953*(2.0**(PILOT_BITS-1)));
           434:  p0r = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           435:  p0r = 12;      //    $rtoi( 0.38268343*(2.0**(PILOT_BITS-1)));
           436:  p0r = 0;       //     $rtoi( 0.00000000*(2.0**(PILOT_BITS-1)));
           437:  p0r = -12;     //   $rtoi(-0.38268343*(2.0**(PILOT_BITS-1)));
           438:  p0r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           439:  p0r = -30;     //   $rtoi(-0.92387953*(2.0**(PILOT_BITS-1)));
           440:  p0r = -31;     //   $rtoi(-0.93750000*(2.0**(PILOT_BITS-1)));
           441:  p0r = -30;     //   $rtoi(-0.92387953*(2.0**(PILOT_BITS-1)));
           442:  p0r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           443:  p0r = -12;     //   $rtoi(-0.38268343*(2.0**(PILOT_BITS-1)));
           444:  p0r = 0;       //     $rtoi( 0.00000000*(2.0**(PILOT_BITS-1)));
           445:  p0r = 12;      //    $rtoi( 0.38268343*(2.0**(PILOT_BITS-1)));
           446:  p0r = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           447:  p0r = 30;      //    $rtoi( 0.92387953*(2.0**(PILOT_BITS-1)));
           448:  p0r = 31;      //    $rtoi( 0.93750000*(2.0**(PILOT_BITS-1)));
           449:  p0r = 31;      //    $rtoi( 0.96269242*(2.0**(PILOT_BITS-1)));
           450:  p0r = 28;      //    $rtoi( 0.86602540*(2.0**(PILOT_BITS-1)));
           451:  p0r = 24;      //    $rtoi( 0.75711512*(2.0**(PILOT_BITS-1)));
           452:  p0r = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           453:  p0r = 24;      //    $rtoi( 0.75711512*(2.0**(PILOT_BITS-1)));
           454:  p0r = 28;      //    $rtoi( 0.86602540*(2.0**(PILOT_BITS-1)));
           455:  p0r = 31;      //    $rtoi( 0.96269242*(2.0**(PILOT_BITS-1)));
           456:  p0r = 31;      //    $rtoi( 0.93750000*(2.0**(PILOT_BITS-1)));
           457:  p0r = 30;      //    $rtoi( 0.92387953*(2.0**(PILOT_BITS-1)));
           458:  p0r = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           459:  p0r = 12;      //    $rtoi( 0.38268343*(2.0**(PILOT_BITS-1)));
           460:  p0r = 0;       //     $rtoi( 0.00000000*(2.0**(PILOT_BITS-1)));
           461:  p0r = -12;     //   $rtoi(-0.38268343*(2.0**(PILOT_BITS-1)));
           462:  p0r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           463:  p0r = -30;     //   $rtoi(-0.92387953*(2.0**(PILOT_BITS-1)));
           464:  p0r = -31;     //   $rtoi(-0.93750000*(2.0**(PILOT_BITS-1)));
           465:  p0r = -31;     //   $rtoi(-0.96269242*(2.0**(PILOT_BITS-1)));
           466:  p0r = -28;     //   $rtoi(-0.86602540*(2.0**(PILOT_BITS-1)));
           467:  p0r = -24;     //   $rtoi(-0.75711512*(2.0**(PILOT_BITS-1)));
           468:  p0r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           469:  p0r = -24;     //   $rtoi(-0.75711512*(2.0**(PILOT_BITS-1)));
           470:  p0r = -28;     //   $rtoi(-0.86602540*(2.0**(PILOT_BITS-1)));
           471:  p0r = -31;     //   $rtoi(-0.96269242*(2.0**(PILOT_BITS-1)));
           472:  p0r = -31;     //   $rtoi(-0.93750000*(2.0**(PILOT_BITS-1)));
           473:  p0r = -31;     //   $rtoi(-0.96269242*(2.0**(PILOT_BITS-1)));
           474:  p0r = -28;     //   $rtoi(-0.86602540*(2.0**(PILOT_BITS-1)));
           475:  p0r = -24;     //   $rtoi(-0.75711512*(2.0**(PILOT_BITS-1)));
           476:  p0r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           477:  p0r = -24;     //   $rtoi(-0.75711512*(2.0**(PILOT_BITS-1)));
           478:  p0r = -28;     //   $rtoi(-0.86602540*(2.0**(PILOT_BITS-1)));
           479:  p0r = -31;     //   $rtoi(-0.96269242*(2.0**(PILOT_BITS-1)));
           480:  p0r = -31;     //   $rtoi(-0.93750000*(2.0**(PILOT_BITS-1)));
           481:  p0r = -31;     //   $rtoi(-0.96269242*(2.0**(PILOT_BITS-1)));
           482:  p0r = -28;     //   $rtoi(-0.86602540*(2.0**(PILOT_BITS-1)));
           483:  p0r = -24;     //   $rtoi(-0.75711512*(2.0**(PILOT_BITS-1)));
           484:  p0r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           485:  p0r = -24;     //   $rtoi(-0.75711512*(2.0**(PILOT_BITS-1)));
           486:  p0r = -28;     //   $rtoi(-0.86602540*(2.0**(PILOT_BITS-1)));
           487:  p0r = -31;     //   $rtoi(-0.96269242*(2.0**(PILOT_BITS-1)));
           488:  p0r = -31;     //   $rtoi(-0.93750000*(2.0**(PILOT_BITS-1)));
           489:  p0r = -31;     //   $rtoi(-0.96269242*(2.0**(PILOT_BITS-1)));
           490:  p0r = -28;     //   $rtoi(-0.86602540*(2.0**(PILOT_BITS-1)));
           491:  p0r = -24;     //   $rtoi(-0.75711512*(2.0**(PILOT_BITS-1)));
           492:  p0r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           493:  p0r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           494:  p0r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           495:  p0r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           496:  p0r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           497:  p0r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           498:  p0r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           499:  p0r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           500:  p0r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           501:  p0r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           502:  p0r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           503:  p0r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           504:  p0r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           505:  p0r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           506:  p0r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           507:  p0r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           508:  p0r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           509:  p0r = -24;     //   $rtoi(-0.75711512*(2.0**(PILOT_BITS-1)));
           510:  p0r = -28;     //   $rtoi(-0.86602540*(2.0**(PILOT_BITS-1)));
           511:  p0r = -31;     //   $rtoi(-0.96269242*(2.0**(PILOT_BITS-1)));
        endcase
    end

    reg signed  [PILOT_BITS-1:0]   p0i;
    always @* begin
        case (pilot0Address)
           0  :  p0i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           1  :  p0i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           2  :  p0i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           3  :  p0i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           4  :  p0i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           5  :  p0i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           6  :  p0i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           7  :  p0i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           8  :  p0i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           9  :  p0i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           10 :  p0i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           11 :  p0i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           12 :  p0i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           13 :  p0i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           14 :  p0i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           15 :  p0i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           16 :  p0i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           17 :  p0i = -24;     //   $rtoi(-0.75711512*(2.0**(PILOT_BITS-1)));
           18 :  p0i = -28;     //   $rtoi(-0.86602540*(2.0**(PILOT_BITS-1)));
           19 :  p0i = -31;     //   $rtoi(-0.96269242*(2.0**(PILOT_BITS-1)));
           20 :  p0i = -31;     //   $rtoi(-0.93750000*(2.0**(PILOT_BITS-1)));
           21 :  p0i = -31;     //   $rtoi(-0.96269242*(2.0**(PILOT_BITS-1)));
           22 :  p0i = -28;     //   $rtoi(-0.86602540*(2.0**(PILOT_BITS-1)));
           23 :  p0i = -24;     //   $rtoi(-0.75711512*(2.0**(PILOT_BITS-1)));
           24 :  p0i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           25 :  p0i = -24;     //   $rtoi(-0.75711512*(2.0**(PILOT_BITS-1)));
           26 :  p0i = -28;     //   $rtoi(-0.86602540*(2.0**(PILOT_BITS-1)));
           27 :  p0i = -31;     //   $rtoi(-0.96269242*(2.0**(PILOT_BITS-1)));
           28 :  p0i = -31;     //   $rtoi(-0.93750000*(2.0**(PILOT_BITS-1)));
           29 :  p0i = -31;     //   $rtoi(-0.96269242*(2.0**(PILOT_BITS-1)));
           30 :  p0i = -28;     //   $rtoi(-0.86602540*(2.0**(PILOT_BITS-1)));
           31 :  p0i = -24;     //   $rtoi(-0.75711512*(2.0**(PILOT_BITS-1)));
           32 :  p0i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           33 :  p0i = -24;     //   $rtoi(-0.75711512*(2.0**(PILOT_BITS-1)));
           34 :  p0i = -28;     //   $rtoi(-0.86602540*(2.0**(PILOT_BITS-1)));
           35 :  p0i = -31;     //   $rtoi(-0.96269242*(2.0**(PILOT_BITS-1)));
           36 :  p0i = -31;     //   $rtoi(-0.93750000*(2.0**(PILOT_BITS-1)));
           37 :  p0i = -31;     //   $rtoi(-0.96269242*(2.0**(PILOT_BITS-1)));
           38 :  p0i = -28;     //   $rtoi(-0.86602540*(2.0**(PILOT_BITS-1)));
           39 :  p0i = -24;     //   $rtoi(-0.75711512*(2.0**(PILOT_BITS-1)));
           40 :  p0i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           41 :  p0i = -24;     //   $rtoi(-0.75711512*(2.0**(PILOT_BITS-1)));
           42 :  p0i = -28;     //   $rtoi(-0.86602540*(2.0**(PILOT_BITS-1)));
           43 :  p0i = -31;     //   $rtoi(-0.96269242*(2.0**(PILOT_BITS-1)));
           44 :  p0i = -31;     //   $rtoi(-0.93750000*(2.0**(PILOT_BITS-1)));
           45 :  p0i = -30;     //   $rtoi(-0.92387953*(2.0**(PILOT_BITS-1)));
           46 :  p0i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           47 :  p0i = -12;     //   $rtoi(-0.38268343*(2.0**(PILOT_BITS-1)));
           48 :  p0i = 0;       //     $rtoi( 0.00000000*(2.0**(PILOT_BITS-1)));
           49 :  p0i = 12;      //    $rtoi( 0.38268343*(2.0**(PILOT_BITS-1)));
           50 :  p0i = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           51 :  p0i = 30;      //    $rtoi( 0.92387953*(2.0**(PILOT_BITS-1)));
           52 :  p0i = 31;      //    $rtoi( 0.93750000*(2.0**(PILOT_BITS-1)));
           53 :  p0i = 31;      //    $rtoi( 0.96269242*(2.0**(PILOT_BITS-1)));
           54 :  p0i = 28;      //    $rtoi( 0.86602540*(2.0**(PILOT_BITS-1)));
           55 :  p0i = 24;      //    $rtoi( 0.75711512*(2.0**(PILOT_BITS-1)));
           56 :  p0i = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           57 :  p0i = 24;      //    $rtoi( 0.75711512*(2.0**(PILOT_BITS-1)));
           58 :  p0i = 28;      //    $rtoi( 0.86602540*(2.0**(PILOT_BITS-1)));
           59 :  p0i = 31;      //    $rtoi( 0.96269242*(2.0**(PILOT_BITS-1)));
           60 :  p0i = 31;      //    $rtoi( 0.93750000*(2.0**(PILOT_BITS-1)));
           61 :  p0i = 30;      //    $rtoi( 0.92387953*(2.0**(PILOT_BITS-1)));
           62 :  p0i = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           63 :  p0i = 12;      //    $rtoi( 0.38268343*(2.0**(PILOT_BITS-1)));
           64 :  p0i = 0;       //     $rtoi( 0.00000000*(2.0**(PILOT_BITS-1)));
           65 :  p0i = -12;     //   $rtoi(-0.38268343*(2.0**(PILOT_BITS-1)));
           66 :  p0i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           67 :  p0i = -30;     //   $rtoi(-0.92387953*(2.0**(PILOT_BITS-1)));
           68 :  p0i = -31;     //   $rtoi(-0.93750000*(2.0**(PILOT_BITS-1)));
           69 :  p0i = -30;     //   $rtoi(-0.92387953*(2.0**(PILOT_BITS-1)));
           70 :  p0i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           71 :  p0i = -12;     //   $rtoi(-0.38268343*(2.0**(PILOT_BITS-1)));
           72 :  p0i = 0;       //     $rtoi( 0.00000000*(2.0**(PILOT_BITS-1)));
           73 :  p0i = 12;      //    $rtoi( 0.38268343*(2.0**(PILOT_BITS-1)));
           74 :  p0i = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           75 :  p0i = 30;      //    $rtoi( 0.92387953*(2.0**(PILOT_BITS-1)));
           76 :  p0i = 31;      //    $rtoi( 0.93750000*(2.0**(PILOT_BITS-1)));
           77 :  p0i = 30;      //    $rtoi( 0.92387953*(2.0**(PILOT_BITS-1)));
           78 :  p0i = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           79 :  p0i = 12;      //    $rtoi( 0.38268343*(2.0**(PILOT_BITS-1)));
           80 :  p0i = 0;       //     $rtoi( 0.00000000*(2.0**(PILOT_BITS-1)));
           81 :  p0i = -9;      //    $rtoi(-0.27059805*(2.0**(PILOT_BITS-1)));
           82 :  p0i = -16;     //   $rtoi(-0.50000000*(2.0**(PILOT_BITS-1)));
           83 :  p0i = -21;     //   $rtoi(-0.65328148*(2.0**(PILOT_BITS-1)));
           84 :  p0i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           85 :  p0i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           86 :  p0i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           87 :  p0i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           88 :  p0i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           89 :  p0i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           90 :  p0i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           91 :  p0i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           92 :  p0i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           93 :  p0i = -21;     //   $rtoi(-0.65328148*(2.0**(PILOT_BITS-1)));
           94 :  p0i = -16;     //   $rtoi(-0.50000000*(2.0**(PILOT_BITS-1)));
           95 :  p0i = -9;      //    $rtoi(-0.27059805*(2.0**(PILOT_BITS-1)));
           96 :  p0i = 0;       //     $rtoi( 0.00000000*(2.0**(PILOT_BITS-1)));
           97 :  p0i = 12;      //    $rtoi( 0.38268343*(2.0**(PILOT_BITS-1)));
           98 :  p0i = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           99 :  p0i = 30;      //    $rtoi( 0.92387953*(2.0**(PILOT_BITS-1)));
           100:  p0i = 31;      //    $rtoi( 0.93750000*(2.0**(PILOT_BITS-1)));
           101:  p0i = 31;      //    $rtoi( 0.96269242*(2.0**(PILOT_BITS-1)));
           102:  p0i = 28;      //    $rtoi( 0.86602540*(2.0**(PILOT_BITS-1)));
           103:  p0i = 24;      //    $rtoi( 0.75711512*(2.0**(PILOT_BITS-1)));
           104:  p0i = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           105:  p0i = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           106:  p0i = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           107:  p0i = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           108:  p0i = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           109:  p0i = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           110:  p0i = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           111:  p0i = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           112:  p0i = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           113:  p0i = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           114:  p0i = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           115:  p0i = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           116:  p0i = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           117:  p0i = 21;      //    $rtoi( 0.65328148*(2.0**(PILOT_BITS-1)));
           118:  p0i = 16;      //    $rtoi( 0.50000000*(2.0**(PILOT_BITS-1)));
           119:  p0i = 9;       //     $rtoi( 0.27059805*(2.0**(PILOT_BITS-1)));
           120:  p0i = 0;       //     $rtoi( 0.00000000*(2.0**(PILOT_BITS-1)));
           121:  p0i = -12;     //   $rtoi(-0.38268343*(2.0**(PILOT_BITS-1)));
           122:  p0i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           123:  p0i = -30;     //   $rtoi(-0.92387953*(2.0**(PILOT_BITS-1)));
           124:  p0i = -31;     //   $rtoi(-0.93750000*(2.0**(PILOT_BITS-1)));
           125:  p0i = -30;     //   $rtoi(-0.92387953*(2.0**(PILOT_BITS-1)));
           126:  p0i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           127:  p0i = -12;     //   $rtoi(-0.38268343*(2.0**(PILOT_BITS-1)));
           128:  p0i = 0;       //     $rtoi( 0.00000000*(2.0**(PILOT_BITS-1)));
           129:  p0i = 12;      //    $rtoi( 0.38268343*(2.0**(PILOT_BITS-1)));
           130:  p0i = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           131:  p0i = 30;      //    $rtoi( 0.92387953*(2.0**(PILOT_BITS-1)));
           132:  p0i = 31;      //    $rtoi( 0.93750000*(2.0**(PILOT_BITS-1)));
           133:  p0i = 31;      //    $rtoi( 0.96269242*(2.0**(PILOT_BITS-1)));
           134:  p0i = 28;      //    $rtoi( 0.86602540*(2.0**(PILOT_BITS-1)));
           135:  p0i = 24;      //    $rtoi( 0.75711512*(2.0**(PILOT_BITS-1)));
           136:  p0i = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           137:  p0i = 24;      //    $rtoi( 0.75711512*(2.0**(PILOT_BITS-1)));
           138:  p0i = 28;      //    $rtoi( 0.86602540*(2.0**(PILOT_BITS-1)));
           139:  p0i = 31;      //    $rtoi( 0.96269242*(2.0**(PILOT_BITS-1)));
           140:  p0i = 31;      //    $rtoi( 0.93750000*(2.0**(PILOT_BITS-1)));
           141:  p0i = 31;      //    $rtoi( 0.96269242*(2.0**(PILOT_BITS-1)));
           142:  p0i = 28;      //    $rtoi( 0.86602540*(2.0**(PILOT_BITS-1)));
           143:  p0i = 24;      //    $rtoi( 0.75711512*(2.0**(PILOT_BITS-1)));
           144:  p0i = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           145:  p0i = 24;      //    $rtoi( 0.75711512*(2.0**(PILOT_BITS-1)));
           146:  p0i = 28;      //    $rtoi( 0.86602540*(2.0**(PILOT_BITS-1)));
           147:  p0i = 31;      //    $rtoi( 0.96269242*(2.0**(PILOT_BITS-1)));
           148:  p0i = 31;      //    $rtoi( 0.93750000*(2.0**(PILOT_BITS-1)));
           149:  p0i = 30;      //    $rtoi( 0.92387953*(2.0**(PILOT_BITS-1)));
           150:  p0i = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           151:  p0i = 12;      //    $rtoi( 0.38268343*(2.0**(PILOT_BITS-1)));
           152:  p0i = 0;       //     $rtoi( 0.00000000*(2.0**(PILOT_BITS-1)));
           153:  p0i = -9;      //    $rtoi(-0.27059805*(2.0**(PILOT_BITS-1)));
           154:  p0i = -16;     //   $rtoi(-0.50000000*(2.0**(PILOT_BITS-1)));
           155:  p0i = -21;     //   $rtoi(-0.65328148*(2.0**(PILOT_BITS-1)));
           156:  p0i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           157:  p0i = -21;     //   $rtoi(-0.65328148*(2.0**(PILOT_BITS-1)));
           158:  p0i = -16;     //   $rtoi(-0.50000000*(2.0**(PILOT_BITS-1)));
           159:  p0i = -9;      //    $rtoi(-0.27059805*(2.0**(PILOT_BITS-1)));
           160:  p0i = 0;       //     $rtoi( 0.00000000*(2.0**(PILOT_BITS-1)));
           161:  p0i = 9;       //     $rtoi( 0.27059805*(2.0**(PILOT_BITS-1)));
           162:  p0i = 16;      //    $rtoi( 0.50000000*(2.0**(PILOT_BITS-1)));
           163:  p0i = 21;      //    $rtoi( 0.65328148*(2.0**(PILOT_BITS-1)));
           164:  p0i = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           165:  p0i = 21;      //    $rtoi( 0.65328148*(2.0**(PILOT_BITS-1)));
           166:  p0i = 16;      //    $rtoi( 0.50000000*(2.0**(PILOT_BITS-1)));
           167:  p0i = 9;       //     $rtoi( 0.27059805*(2.0**(PILOT_BITS-1)));
           168:  p0i = 0;       //     $rtoi( 0.00000000*(2.0**(PILOT_BITS-1)));
           169:  p0i = -9;      //    $rtoi(-0.27059805*(2.0**(PILOT_BITS-1)));
           170:  p0i = -16;     //   $rtoi(-0.50000000*(2.0**(PILOT_BITS-1)));
           171:  p0i = -21;     //   $rtoi(-0.65328148*(2.0**(PILOT_BITS-1)));
           172:  p0i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           173:  p0i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           174:  p0i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           175:  p0i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           176:  p0i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           177:  p0i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           178:  p0i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           179:  p0i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           180:  p0i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           181:  p0i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           182:  p0i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           183:  p0i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           184:  p0i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           185:  p0i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           186:  p0i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           187:  p0i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           188:  p0i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           189:  p0i = -21;     //   $rtoi(-0.65328148*(2.0**(PILOT_BITS-1)));
           190:  p0i = -16;     //   $rtoi(-0.50000000*(2.0**(PILOT_BITS-1)));
           191:  p0i = -9;      //    $rtoi(-0.27059805*(2.0**(PILOT_BITS-1)));
           192:  p0i = 0;       //     $rtoi( 0.00000000*(2.0**(PILOT_BITS-1)));
           193:  p0i = 9;       //     $rtoi( 0.27059805*(2.0**(PILOT_BITS-1)));
           194:  p0i = 16;      //    $rtoi( 0.50000000*(2.0**(PILOT_BITS-1)));
           195:  p0i = 21;      //    $rtoi( 0.65328148*(2.0**(PILOT_BITS-1)));
           196:  p0i = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           197:  p0i = 21;      //    $rtoi( 0.65328148*(2.0**(PILOT_BITS-1)));
           198:  p0i = 16;      //    $rtoi( 0.50000000*(2.0**(PILOT_BITS-1)));
           199:  p0i = 9;       //     $rtoi( 0.27059805*(2.0**(PILOT_BITS-1)));
           200:  p0i = 0;       //     $rtoi( 0.00000000*(2.0**(PILOT_BITS-1)));
           201:  p0i = -12;     //   $rtoi(-0.38268343*(2.0**(PILOT_BITS-1)));
           202:  p0i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           203:  p0i = -30;     //   $rtoi(-0.92387953*(2.0**(PILOT_BITS-1)));
           204:  p0i = -31;     //   $rtoi(-0.93750000*(2.0**(PILOT_BITS-1)));
           205:  p0i = -31;     //   $rtoi(-0.96269242*(2.0**(PILOT_BITS-1)));
           206:  p0i = -28;     //   $rtoi(-0.86602540*(2.0**(PILOT_BITS-1)));
           207:  p0i = -24;     //   $rtoi(-0.75711512*(2.0**(PILOT_BITS-1)));
           208:  p0i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           209:  p0i = -24;     //   $rtoi(-0.75711512*(2.0**(PILOT_BITS-1)));
           210:  p0i = -28;     //   $rtoi(-0.86602540*(2.0**(PILOT_BITS-1)));
           211:  p0i = -31;     //   $rtoi(-0.96269242*(2.0**(PILOT_BITS-1)));
           212:  p0i = -31;     //   $rtoi(-0.93750000*(2.0**(PILOT_BITS-1)));
           213:  p0i = -30;     //   $rtoi(-0.92387953*(2.0**(PILOT_BITS-1)));
           214:  p0i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           215:  p0i = -12;     //   $rtoi(-0.38268343*(2.0**(PILOT_BITS-1)));
           216:  p0i = 0;       //     $rtoi( 0.00000000*(2.0**(PILOT_BITS-1)));
           217:  p0i = 9;       //     $rtoi( 0.27059805*(2.0**(PILOT_BITS-1)));
           218:  p0i = 16;      //    $rtoi( 0.50000000*(2.0**(PILOT_BITS-1)));
           219:  p0i = 21;      //    $rtoi( 0.65328148*(2.0**(PILOT_BITS-1)));
           220:  p0i = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           221:  p0i = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           222:  p0i = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           223:  p0i = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           224:  p0i = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           225:  p0i = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           226:  p0i = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           227:  p0i = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           228:  p0i = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           229:  p0i = 21;      //    $rtoi( 0.65328148*(2.0**(PILOT_BITS-1)));
           230:  p0i = 16;      //    $rtoi( 0.50000000*(2.0**(PILOT_BITS-1)));
           231:  p0i = 9;       //     $rtoi( 0.27059805*(2.0**(PILOT_BITS-1)));
           232:  p0i = 0;       //     $rtoi( 0.00000000*(2.0**(PILOT_BITS-1)));
           233:  p0i = -9;      //    $rtoi(-0.27059805*(2.0**(PILOT_BITS-1)));
           234:  p0i = -16;     //   $rtoi(-0.50000000*(2.0**(PILOT_BITS-1)));
           235:  p0i = -21;     //   $rtoi(-0.65328148*(2.0**(PILOT_BITS-1)));
           236:  p0i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           237:  p0i = -21;     //   $rtoi(-0.65328148*(2.0**(PILOT_BITS-1)));
           238:  p0i = -16;     //   $rtoi(-0.50000000*(2.0**(PILOT_BITS-1)));
           239:  p0i = -9;      //    $rtoi(-0.27059805*(2.0**(PILOT_BITS-1)));
           240:  p0i = 0;       //     $rtoi( 0.00000000*(2.0**(PILOT_BITS-1)));
           241:  p0i = 12;      //    $rtoi( 0.38268343*(2.0**(PILOT_BITS-1)));
           242:  p0i = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           243:  p0i = 30;      //    $rtoi( 0.92387953*(2.0**(PILOT_BITS-1)));
           244:  p0i = 31;      //    $rtoi( 0.93750000*(2.0**(PILOT_BITS-1)));
           245:  p0i = 31;      //    $rtoi( 0.96269242*(2.0**(PILOT_BITS-1)));
           246:  p0i = 28;      //    $rtoi( 0.86602540*(2.0**(PILOT_BITS-1)));
           247:  p0i = 24;      //    $rtoi( 0.75711512*(2.0**(PILOT_BITS-1)));
           248:  p0i = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           249:  p0i = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           250:  p0i = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           251:  p0i = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           252:  p0i = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           253:  p0i = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           254:  p0i = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           255:  p0i = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           256:  p0i = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           257:  p0i = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           258:  p0i = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           259:  p0i = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           260:  p0i = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           261:  p0i = 21;      //    $rtoi( 0.65328148*(2.0**(PILOT_BITS-1)));
           262:  p0i = 16;      //    $rtoi( 0.50000000*(2.0**(PILOT_BITS-1)));
           263:  p0i = 9;       //     $rtoi( 0.27059805*(2.0**(PILOT_BITS-1)));
           264:  p0i = 0;       //     $rtoi( 0.00000000*(2.0**(PILOT_BITS-1)));
           265:  p0i = -12;     //   $rtoi(-0.38268343*(2.0**(PILOT_BITS-1)));
           266:  p0i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           267:  p0i = -30;     //   $rtoi(-0.92387953*(2.0**(PILOT_BITS-1)));
           268:  p0i = -31;     //   $rtoi(-0.93750000*(2.0**(PILOT_BITS-1)));
           269:  p0i = -31;     //   $rtoi(-0.96269242*(2.0**(PILOT_BITS-1)));
           270:  p0i = -28;     //   $rtoi(-0.86602540*(2.0**(PILOT_BITS-1)));
           271:  p0i = -24;     //   $rtoi(-0.75711512*(2.0**(PILOT_BITS-1)));
           272:  p0i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           273:  p0i = -24;     //   $rtoi(-0.75711512*(2.0**(PILOT_BITS-1)));
           274:  p0i = -28;     //   $rtoi(-0.86602540*(2.0**(PILOT_BITS-1)));
           275:  p0i = -31;     //   $rtoi(-0.96269242*(2.0**(PILOT_BITS-1)));
           276:  p0i = -31;     //   $rtoi(-0.93750000*(2.0**(PILOT_BITS-1)));
           277:  p0i = -31;     //   $rtoi(-0.96269242*(2.0**(PILOT_BITS-1)));
           278:  p0i = -28;     //   $rtoi(-0.86602540*(2.0**(PILOT_BITS-1)));
           279:  p0i = -24;     //   $rtoi(-0.75711512*(2.0**(PILOT_BITS-1)));
           280:  p0i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           281:  p0i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           282:  p0i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           283:  p0i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           284:  p0i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           285:  p0i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           286:  p0i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           287:  p0i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           288:  p0i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           289:  p0i = -24;     //   $rtoi(-0.75711512*(2.0**(PILOT_BITS-1)));
           290:  p0i = -28;     //   $rtoi(-0.86602540*(2.0**(PILOT_BITS-1)));
           291:  p0i = -31;     //   $rtoi(-0.96269242*(2.0**(PILOT_BITS-1)));
           292:  p0i = -31;     //   $rtoi(-0.93750000*(2.0**(PILOT_BITS-1)));
           293:  p0i = -30;     //   $rtoi(-0.92387953*(2.0**(PILOT_BITS-1)));
           294:  p0i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           295:  p0i = -12;     //   $rtoi(-0.38268343*(2.0**(PILOT_BITS-1)));
           296:  p0i = 0;       //     $rtoi( 0.00000000*(2.0**(PILOT_BITS-1)));
           297:  p0i = 9;       //     $rtoi( 0.27059805*(2.0**(PILOT_BITS-1)));
           298:  p0i = 16;      //    $rtoi( 0.50000000*(2.0**(PILOT_BITS-1)));
           299:  p0i = 21;      //    $rtoi( 0.65328148*(2.0**(PILOT_BITS-1)));
           300:  p0i = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           301:  p0i = 21;      //    $rtoi( 0.65328148*(2.0**(PILOT_BITS-1)));
           302:  p0i = 16;      //    $rtoi( 0.50000000*(2.0**(PILOT_BITS-1)));
           303:  p0i = 9;       //     $rtoi( 0.27059805*(2.0**(PILOT_BITS-1)));
           304:  p0i = 0;       //     $rtoi( 0.00000000*(2.0**(PILOT_BITS-1)));
           305:  p0i = -12;     //   $rtoi(-0.38268343*(2.0**(PILOT_BITS-1)));
           306:  p0i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           307:  p0i = -30;     //   $rtoi(-0.92387953*(2.0**(PILOT_BITS-1)));
           308:  p0i = -31;     //   $rtoi(-0.93750000*(2.0**(PILOT_BITS-1)));
           309:  p0i = -31;     //   $rtoi(-0.96269242*(2.0**(PILOT_BITS-1)));
           310:  p0i = -28;     //   $rtoi(-0.86602540*(2.0**(PILOT_BITS-1)));
           311:  p0i = -24;     //   $rtoi(-0.75711512*(2.0**(PILOT_BITS-1)));
           312:  p0i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           313:  p0i = -24;     //   $rtoi(-0.75711512*(2.0**(PILOT_BITS-1)));
           314:  p0i = -28;     //   $rtoi(-0.86602540*(2.0**(PILOT_BITS-1)));
           315:  p0i = -31;     //   $rtoi(-0.96269242*(2.0**(PILOT_BITS-1)));
           316:  p0i = -31;     //   $rtoi(-0.93750000*(2.0**(PILOT_BITS-1)));
           317:  p0i = -31;     //   $rtoi(-0.96269242*(2.0**(PILOT_BITS-1)));
           318:  p0i = -28;     //   $rtoi(-0.86602540*(2.0**(PILOT_BITS-1)));
           319:  p0i = -24;     //   $rtoi(-0.75711512*(2.0**(PILOT_BITS-1)));
           320:  p0i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           321:  p0i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           322:  p0i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           323:  p0i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           324:  p0i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           325:  p0i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           326:  p0i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           327:  p0i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           328:  p0i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           329:  p0i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           330:  p0i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           331:  p0i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           332:  p0i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           333:  p0i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           334:  p0i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           335:  p0i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           336:  p0i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           337:  p0i = -24;     //   $rtoi(-0.75711512*(2.0**(PILOT_BITS-1)));
           338:  p0i = -28;     //   $rtoi(-0.86602540*(2.0**(PILOT_BITS-1)));
           339:  p0i = -31;     //   $rtoi(-0.96269242*(2.0**(PILOT_BITS-1)));
           340:  p0i = -31;     //   $rtoi(-0.93750000*(2.0**(PILOT_BITS-1)));
           341:  p0i = -31;     //   $rtoi(-0.96269242*(2.0**(PILOT_BITS-1)));
           342:  p0i = -28;     //   $rtoi(-0.86602540*(2.0**(PILOT_BITS-1)));
           343:  p0i = -24;     //   $rtoi(-0.75711512*(2.0**(PILOT_BITS-1)));
           344:  p0i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           345:  p0i = -24;     //   $rtoi(-0.75711512*(2.0**(PILOT_BITS-1)));
           346:  p0i = -28;     //   $rtoi(-0.86602540*(2.0**(PILOT_BITS-1)));
           347:  p0i = -31;     //   $rtoi(-0.96269242*(2.0**(PILOT_BITS-1)));
           348:  p0i = -31;     //   $rtoi(-0.93750000*(2.0**(PILOT_BITS-1)));
           349:  p0i = -31;     //   $rtoi(-0.96269242*(2.0**(PILOT_BITS-1)));
           350:  p0i = -28;     //   $rtoi(-0.86602540*(2.0**(PILOT_BITS-1)));
           351:  p0i = -24;     //   $rtoi(-0.75711512*(2.0**(PILOT_BITS-1)));
           352:  p0i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           353:  p0i = -24;     //   $rtoi(-0.75711512*(2.0**(PILOT_BITS-1)));
           354:  p0i = -28;     //   $rtoi(-0.86602540*(2.0**(PILOT_BITS-1)));
           355:  p0i = -31;     //   $rtoi(-0.96269242*(2.0**(PILOT_BITS-1)));
           356:  p0i = -31;     //   $rtoi(-0.93750000*(2.0**(PILOT_BITS-1)));
           357:  p0i = -30;     //   $rtoi(-0.92387953*(2.0**(PILOT_BITS-1)));
           358:  p0i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           359:  p0i = -12;     //   $rtoi(-0.38268343*(2.0**(PILOT_BITS-1)));
           360:  p0i = 0;       //     $rtoi( 0.00000000*(2.0**(PILOT_BITS-1)));
           361:  p0i = 9;       //     $rtoi( 0.27059805*(2.0**(PILOT_BITS-1)));
           362:  p0i = 16;      //    $rtoi( 0.50000000*(2.0**(PILOT_BITS-1)));
           363:  p0i = 21;      //    $rtoi( 0.65328148*(2.0**(PILOT_BITS-1)));
           364:  p0i = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           365:  p0i = 21;      //    $rtoi( 0.65328148*(2.0**(PILOT_BITS-1)));
           366:  p0i = 16;      //    $rtoi( 0.50000000*(2.0**(PILOT_BITS-1)));
           367:  p0i = 9;       //     $rtoi( 0.27059805*(2.0**(PILOT_BITS-1)));
           368:  p0i = 0;       //     $rtoi( 0.00000000*(2.0**(PILOT_BITS-1)));
           369:  p0i = -9;      //    $rtoi(-0.27059805*(2.0**(PILOT_BITS-1)));
           370:  p0i = -16;     //   $rtoi(-0.50000000*(2.0**(PILOT_BITS-1)));
           371:  p0i = -21;     //   $rtoi(-0.65328148*(2.0**(PILOT_BITS-1)));
           372:  p0i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           373:  p0i = -21;     //   $rtoi(-0.65328148*(2.0**(PILOT_BITS-1)));
           374:  p0i = -16;     //   $rtoi(-0.50000000*(2.0**(PILOT_BITS-1)));
           375:  p0i = -9;      //    $rtoi(-0.27059805*(2.0**(PILOT_BITS-1)));
           376:  p0i = 0;       //     $rtoi( 0.00000000*(2.0**(PILOT_BITS-1)));
           377:  p0i = 12;      //    $rtoi( 0.38268343*(2.0**(PILOT_BITS-1)));
           378:  p0i = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           379:  p0i = 30;      //    $rtoi( 0.92387953*(2.0**(PILOT_BITS-1)));
           380:  p0i = 31;      //    $rtoi( 0.93750000*(2.0**(PILOT_BITS-1)));
           381:  p0i = 30;      //    $rtoi( 0.92387953*(2.0**(PILOT_BITS-1)));
           382:  p0i = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           383:  p0i = 12;      //    $rtoi( 0.38268343*(2.0**(PILOT_BITS-1)));
           384:  p0i = 0;       //     $rtoi( 0.00000000*(2.0**(PILOT_BITS-1)));
           385:  p0i = -12;     //   $rtoi(-0.38268343*(2.0**(PILOT_BITS-1)));
           386:  p0i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           387:  p0i = -30;     //   $rtoi(-0.92387953*(2.0**(PILOT_BITS-1)));
           388:  p0i = -31;     //   $rtoi(-0.93750000*(2.0**(PILOT_BITS-1)));
           389:  p0i = -31;     //   $rtoi(-0.96269242*(2.0**(PILOT_BITS-1)));
           390:  p0i = -28;     //   $rtoi(-0.86602540*(2.0**(PILOT_BITS-1)));
           391:  p0i = -24;     //   $rtoi(-0.75711512*(2.0**(PILOT_BITS-1)));
           392:  p0i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           393:  p0i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           394:  p0i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           395:  p0i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           396:  p0i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           397:  p0i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           398:  p0i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           399:  p0i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           400:  p0i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           401:  p0i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           402:  p0i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           403:  p0i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           404:  p0i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           405:  p0i = -21;     //   $rtoi(-0.65328148*(2.0**(PILOT_BITS-1)));
           406:  p0i = -16;     //   $rtoi(-0.50000000*(2.0**(PILOT_BITS-1)));
           407:  p0i = -9;      //    $rtoi(-0.27059805*(2.0**(PILOT_BITS-1)));
           408:  p0i = 0;       //     $rtoi( 0.00000000*(2.0**(PILOT_BITS-1)));
           409:  p0i = 12;      //    $rtoi( 0.38268343*(2.0**(PILOT_BITS-1)));
           410:  p0i = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           411:  p0i = 30;      //    $rtoi( 0.92387953*(2.0**(PILOT_BITS-1)));
           412:  p0i = 31;      //    $rtoi( 0.93750000*(2.0**(PILOT_BITS-1)));
           413:  p0i = 31;      //    $rtoi( 0.96269242*(2.0**(PILOT_BITS-1)));
           414:  p0i = 28;      //    $rtoi( 0.86602540*(2.0**(PILOT_BITS-1)));
           415:  p0i = 24;      //    $rtoi( 0.75711512*(2.0**(PILOT_BITS-1)));
           416:  p0i = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           417:  p0i = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           418:  p0i = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           419:  p0i = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           420:  p0i = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           421:  p0i = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           422:  p0i = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           423:  p0i = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           424:  p0i = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           425:  p0i = 24;      //    $rtoi( 0.75711512*(2.0**(PILOT_BITS-1)));
           426:  p0i = 28;      //    $rtoi( 0.86602540*(2.0**(PILOT_BITS-1)));
           427:  p0i = 31;      //    $rtoi( 0.96269242*(2.0**(PILOT_BITS-1)));
           428:  p0i = 31;      //    $rtoi( 0.93750000*(2.0**(PILOT_BITS-1)));
           429:  p0i = 30;      //    $rtoi( 0.92387953*(2.0**(PILOT_BITS-1)));
           430:  p0i = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           431:  p0i = 12;      //    $rtoi( 0.38268343*(2.0**(PILOT_BITS-1)));
           432:  p0i = 0;       //     $rtoi( 0.00000000*(2.0**(PILOT_BITS-1)));
           433:  p0i = -12;     //   $rtoi(-0.38268343*(2.0**(PILOT_BITS-1)));
           434:  p0i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           435:  p0i = -30;     //   $rtoi(-0.92387953*(2.0**(PILOT_BITS-1)));
           436:  p0i = -31;     //   $rtoi(-0.93750000*(2.0**(PILOT_BITS-1)));
           437:  p0i = -30;     //   $rtoi(-0.92387953*(2.0**(PILOT_BITS-1)));
           438:  p0i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           439:  p0i = -12;     //   $rtoi(-0.38268343*(2.0**(PILOT_BITS-1)));
           440:  p0i = 0;       //     $rtoi( 0.00000000*(2.0**(PILOT_BITS-1)));
           441:  p0i = 12;      //    $rtoi( 0.38268343*(2.0**(PILOT_BITS-1)));
           442:  p0i = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           443:  p0i = 30;      //    $rtoi( 0.92387953*(2.0**(PILOT_BITS-1)));
           444:  p0i = 31;      //    $rtoi( 0.93750000*(2.0**(PILOT_BITS-1)));
           445:  p0i = 30;      //    $rtoi( 0.92387953*(2.0**(PILOT_BITS-1)));
           446:  p0i = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           447:  p0i = 12;      //    $rtoi( 0.38268343*(2.0**(PILOT_BITS-1)));
           448:  p0i = 0;       //     $rtoi( 0.00000000*(2.0**(PILOT_BITS-1)));
           449:  p0i = -9;      //    $rtoi(-0.27059805*(2.0**(PILOT_BITS-1)));
           450:  p0i = -16;     //   $rtoi(-0.50000000*(2.0**(PILOT_BITS-1)));
           451:  p0i = -21;     //   $rtoi(-0.65328148*(2.0**(PILOT_BITS-1)));
           452:  p0i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           453:  p0i = -21;     //   $rtoi(-0.65328148*(2.0**(PILOT_BITS-1)));
           454:  p0i = -16;     //   $rtoi(-0.50000000*(2.0**(PILOT_BITS-1)));
           455:  p0i = -9;      //    $rtoi(-0.27059805*(2.0**(PILOT_BITS-1)));
           456:  p0i = 0;       //     $rtoi( 0.00000000*(2.0**(PILOT_BITS-1)));
           457:  p0i = 12;      //    $rtoi( 0.38268343*(2.0**(PILOT_BITS-1)));
           458:  p0i = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           459:  p0i = 30;      //    $rtoi( 0.92387953*(2.0**(PILOT_BITS-1)));
           460:  p0i = 31;      //    $rtoi( 0.93750000*(2.0**(PILOT_BITS-1)));
           461:  p0i = 30;      //    $rtoi( 0.92387953*(2.0**(PILOT_BITS-1)));
           462:  p0i = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           463:  p0i = 12;      //    $rtoi( 0.38268343*(2.0**(PILOT_BITS-1)));
           464:  p0i = 0;       //     $rtoi( 0.00000000*(2.0**(PILOT_BITS-1)));
           465:  p0i = -9;      //    $rtoi(-0.27059805*(2.0**(PILOT_BITS-1)));
           466:  p0i = -16;     //   $rtoi(-0.50000000*(2.0**(PILOT_BITS-1)));
           467:  p0i = -21;     //   $rtoi(-0.65328148*(2.0**(PILOT_BITS-1)));
           468:  p0i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           469:  p0i = -21;     //   $rtoi(-0.65328148*(2.0**(PILOT_BITS-1)));
           470:  p0i = -16;     //   $rtoi(-0.50000000*(2.0**(PILOT_BITS-1)));
           471:  p0i = -9;      //    $rtoi(-0.27059805*(2.0**(PILOT_BITS-1)));
           472:  p0i = 0;       //     $rtoi( 0.00000000*(2.0**(PILOT_BITS-1)));
           473:  p0i = 9;       //     $rtoi( 0.27059805*(2.0**(PILOT_BITS-1)));
           474:  p0i = 16;      //    $rtoi( 0.50000000*(2.0**(PILOT_BITS-1)));
           475:  p0i = 21;      //    $rtoi( 0.65328148*(2.0**(PILOT_BITS-1)));
           476:  p0i = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           477:  p0i = 21;      //    $rtoi( 0.65328148*(2.0**(PILOT_BITS-1)));
           478:  p0i = 16;      //    $rtoi( 0.50000000*(2.0**(PILOT_BITS-1)));
           479:  p0i = 9;       //     $rtoi( 0.27059805*(2.0**(PILOT_BITS-1)));
           480:  p0i = 0;       //     $rtoi( 0.00000000*(2.0**(PILOT_BITS-1)));
           481:  p0i = -9;      //    $rtoi(-0.27059805*(2.0**(PILOT_BITS-1)));
           482:  p0i = -16;     //   $rtoi(-0.50000000*(2.0**(PILOT_BITS-1)));
           483:  p0i = -21;     //   $rtoi(-0.65328148*(2.0**(PILOT_BITS-1)));
           484:  p0i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           485:  p0i = -21;     //   $rtoi(-0.65328148*(2.0**(PILOT_BITS-1)));
           486:  p0i = -16;     //   $rtoi(-0.50000000*(2.0**(PILOT_BITS-1)));
           487:  p0i = -9;      //    $rtoi(-0.27059805*(2.0**(PILOT_BITS-1)));
           488:  p0i = 0;       //     $rtoi( 0.00000000*(2.0**(PILOT_BITS-1)));
           489:  p0i = 9;       //     $rtoi( 0.27059805*(2.0**(PILOT_BITS-1)));
           490:  p0i = 16;      //    $rtoi( 0.50000000*(2.0**(PILOT_BITS-1)));
           491:  p0i = 21;      //    $rtoi( 0.65328148*(2.0**(PILOT_BITS-1)));
           492:  p0i = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           493:  p0i = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           494:  p0i = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           495:  p0i = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           496:  p0i = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           497:  p0i = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           498:  p0i = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           499:  p0i = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           500:  p0i = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           501:  p0i = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           502:  p0i = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           503:  p0i = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           504:  p0i = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           505:  p0i = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           506:  p0i = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           507:  p0i = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           508:  p0i = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           509:  p0i = 21;      //    $rtoi( 0.65328148*(2.0**(PILOT_BITS-1)));
           510:  p0i = 16;      //    $rtoi( 0.50000000*(2.0**(PILOT_BITS-1)));
           511:  p0i = 9;       //     $rtoi( 0.27059805*(2.0**(PILOT_BITS-1)));
        endcase
    end

    reg signed  [PILOT_BITS-1:0]   p1r;
    always @* begin
        case (pilot1Address)
           0  :  p1r = 31;      //    $rtoi( 0.93750000*(2.0**(PILOT_BITS-1)));
           1  :  p1r = 31;      //    $rtoi( 0.96269242*(2.0**(PILOT_BITS-1)));
           2  :  p1r = 28;      //    $rtoi( 0.86602540*(2.0**(PILOT_BITS-1)));
           3  :  p1r = 24;      //    $rtoi( 0.75711512*(2.0**(PILOT_BITS-1)));
           4  :  p1r = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           5  :  p1r = 24;      //    $rtoi( 0.75711512*(2.0**(PILOT_BITS-1)));
           6  :  p1r = 28;      //    $rtoi( 0.86602540*(2.0**(PILOT_BITS-1)));
           7  :  p1r = 31;      //    $rtoi( 0.96269242*(2.0**(PILOT_BITS-1)));
           8  :  p1r = 31;      //    $rtoi( 0.93750000*(2.0**(PILOT_BITS-1)));
           9  :  p1r = 30;      //    $rtoi( 0.92387953*(2.0**(PILOT_BITS-1)));
           10 :  p1r = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           11 :  p1r = 12;      //    $rtoi( 0.38268343*(2.0**(PILOT_BITS-1)));
           12 :  p1r = 0;       //     $rtoi( 0.00000000*(2.0**(PILOT_BITS-1)));
           13 :  p1r = -9;      //    $rtoi(-0.27059805*(2.0**(PILOT_BITS-1)));
           14 :  p1r = -16;     //   $rtoi(-0.50000000*(2.0**(PILOT_BITS-1)));
           15 :  p1r = -21;     //   $rtoi(-0.65328148*(2.0**(PILOT_BITS-1)));
           16 :  p1r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           17 :  p1r = -21;     //   $rtoi(-0.65328148*(2.0**(PILOT_BITS-1)));
           18 :  p1r = -16;     //   $rtoi(-0.50000000*(2.0**(PILOT_BITS-1)));
           19 :  p1r = -9;      //    $rtoi(-0.27059805*(2.0**(PILOT_BITS-1)));
           20 :  p1r = 0;       //     $rtoi( 0.00000000*(2.0**(PILOT_BITS-1)));
           21 :  p1r = 12;      //    $rtoi( 0.38268343*(2.0**(PILOT_BITS-1)));
           22 :  p1r = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           23 :  p1r = 30;      //    $rtoi( 0.92387953*(2.0**(PILOT_BITS-1)));
           24 :  p1r = 31;      //    $rtoi( 0.93750000*(2.0**(PILOT_BITS-1)));
           25 :  p1r = 31;      //    $rtoi( 0.96269242*(2.0**(PILOT_BITS-1)));
           26 :  p1r = 28;      //    $rtoi( 0.86602540*(2.0**(PILOT_BITS-1)));
           27 :  p1r = 24;      //    $rtoi( 0.75711512*(2.0**(PILOT_BITS-1)));
           28 :  p1r = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           29 :  p1r = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           30 :  p1r = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           31 :  p1r = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           32 :  p1r = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           33 :  p1r = 21;      //    $rtoi( 0.65328148*(2.0**(PILOT_BITS-1)));
           34 :  p1r = 16;      //    $rtoi( 0.50000000*(2.0**(PILOT_BITS-1)));
           35 :  p1r = 9;       //     $rtoi( 0.27059805*(2.0**(PILOT_BITS-1)));
           36 :  p1r = 0;       //     $rtoi( 0.00000000*(2.0**(PILOT_BITS-1)));
           37 :  p1r = -12;     //   $rtoi(-0.38268343*(2.0**(PILOT_BITS-1)));
           38 :  p1r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           39 :  p1r = -30;     //   $rtoi(-0.92387953*(2.0**(PILOT_BITS-1)));
           40 :  p1r = -31;     //   $rtoi(-0.93750000*(2.0**(PILOT_BITS-1)));
           41 :  p1r = -31;     //   $rtoi(-0.96269242*(2.0**(PILOT_BITS-1)));
           42 :  p1r = -28;     //   $rtoi(-0.86602540*(2.0**(PILOT_BITS-1)));
           43 :  p1r = -24;     //   $rtoi(-0.75711512*(2.0**(PILOT_BITS-1)));
           44 :  p1r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           45 :  p1r = -24;     //   $rtoi(-0.75711512*(2.0**(PILOT_BITS-1)));
           46 :  p1r = -28;     //   $rtoi(-0.86602540*(2.0**(PILOT_BITS-1)));
           47 :  p1r = -31;     //   $rtoi(-0.96269242*(2.0**(PILOT_BITS-1)));
           48 :  p1r = -31;     //   $rtoi(-0.93750000*(2.0**(PILOT_BITS-1)));
           49 :  p1r = -30;     //   $rtoi(-0.92387953*(2.0**(PILOT_BITS-1)));
           50 :  p1r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           51 :  p1r = -12;     //   $rtoi(-0.38268343*(2.0**(PILOT_BITS-1)));
           52 :  p1r = 0;       //     $rtoi( 0.00000000*(2.0**(PILOT_BITS-1)));
           53 :  p1r = 9;       //     $rtoi( 0.27059805*(2.0**(PILOT_BITS-1)));
           54 :  p1r = 16;      //    $rtoi( 0.50000000*(2.0**(PILOT_BITS-1)));
           55 :  p1r = 21;      //    $rtoi( 0.65328148*(2.0**(PILOT_BITS-1)));
           56 :  p1r = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           57 :  p1r = 21;      //    $rtoi( 0.65328148*(2.0**(PILOT_BITS-1)));
           58 :  p1r = 16;      //    $rtoi( 0.50000000*(2.0**(PILOT_BITS-1)));
           59 :  p1r = 9;       //     $rtoi( 0.27059805*(2.0**(PILOT_BITS-1)));
           60 :  p1r = 0;       //     $rtoi( 0.00000000*(2.0**(PILOT_BITS-1)));
           61 :  p1r = -9;      //    $rtoi(-0.27059805*(2.0**(PILOT_BITS-1)));
           62 :  p1r = -16;     //   $rtoi(-0.50000000*(2.0**(PILOT_BITS-1)));
           63 :  p1r = -21;     //   $rtoi(-0.65328148*(2.0**(PILOT_BITS-1)));
           64 :  p1r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           65 :  p1r = -21;     //   $rtoi(-0.65328148*(2.0**(PILOT_BITS-1)));
           66 :  p1r = -16;     //   $rtoi(-0.50000000*(2.0**(PILOT_BITS-1)));
           67 :  p1r = -9;      //    $rtoi(-0.27059805*(2.0**(PILOT_BITS-1)));
           68 :  p1r = 0;       //     $rtoi( 0.00000000*(2.0**(PILOT_BITS-1)));
           69 :  p1r = 9;       //     $rtoi( 0.27059805*(2.0**(PILOT_BITS-1)));
           70 :  p1r = 16;      //    $rtoi( 0.50000000*(2.0**(PILOT_BITS-1)));
           71 :  p1r = 21;      //    $rtoi( 0.65328148*(2.0**(PILOT_BITS-1)));
           72 :  p1r = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           73 :  p1r = 21;      //    $rtoi( 0.65328148*(2.0**(PILOT_BITS-1)));
           74 :  p1r = 16;      //    $rtoi( 0.50000000*(2.0**(PILOT_BITS-1)));
           75 :  p1r = 9;       //     $rtoi( 0.27059805*(2.0**(PILOT_BITS-1)));
           76 :  p1r = 0;       //     $rtoi( 0.00000000*(2.0**(PILOT_BITS-1)));
           77 :  p1r = -9;      //    $rtoi(-0.27059805*(2.0**(PILOT_BITS-1)));
           78 :  p1r = -16;     //   $rtoi(-0.50000000*(2.0**(PILOT_BITS-1)));
           79 :  p1r = -21;     //   $rtoi(-0.65328148*(2.0**(PILOT_BITS-1)));
           80 :  p1r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           81 :  p1r = -21;     //   $rtoi(-0.65328148*(2.0**(PILOT_BITS-1)));
           82 :  p1r = -16;     //   $rtoi(-0.50000000*(2.0**(PILOT_BITS-1)));
           83 :  p1r = -9;      //    $rtoi(-0.27059805*(2.0**(PILOT_BITS-1)));
           84 :  p1r = 0;       //     $rtoi( 0.00000000*(2.0**(PILOT_BITS-1)));
           85 :  p1r = 9;       //     $rtoi( 0.27059805*(2.0**(PILOT_BITS-1)));
           86 :  p1r = 16;      //    $rtoi( 0.50000000*(2.0**(PILOT_BITS-1)));
           87 :  p1r = 21;      //    $rtoi( 0.65328148*(2.0**(PILOT_BITS-1)));
           88 :  p1r = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           89 :  p1r = 21;      //    $rtoi( 0.65328148*(2.0**(PILOT_BITS-1)));
           90 :  p1r = 16;      //    $rtoi( 0.50000000*(2.0**(PILOT_BITS-1)));
           91 :  p1r = 9;       //     $rtoi( 0.27059805*(2.0**(PILOT_BITS-1)));
           92 :  p1r = 0;       //     $rtoi( 0.00000000*(2.0**(PILOT_BITS-1)));
           93 :  p1r = -9;      //    $rtoi(-0.27059805*(2.0**(PILOT_BITS-1)));
           94 :  p1r = -16;     //   $rtoi(-0.50000000*(2.0**(PILOT_BITS-1)));
           95 :  p1r = -21;     //   $rtoi(-0.65328148*(2.0**(PILOT_BITS-1)));
           96 :  p1r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           97 :  p1r = -21;     //   $rtoi(-0.65328148*(2.0**(PILOT_BITS-1)));
           98 :  p1r = -16;     //   $rtoi(-0.50000000*(2.0**(PILOT_BITS-1)));
           99 :  p1r = -9;      //    $rtoi(-0.27059805*(2.0**(PILOT_BITS-1)));
           100:  p1r = 0;       //     $rtoi( 0.00000000*(2.0**(PILOT_BITS-1)));
           101:  p1r = 12;      //    $rtoi( 0.38268343*(2.0**(PILOT_BITS-1)));
           102:  p1r = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           103:  p1r = 30;      //    $rtoi( 0.92387953*(2.0**(PILOT_BITS-1)));
           104:  p1r = 31;      //    $rtoi( 0.93750000*(2.0**(PILOT_BITS-1)));
           105:  p1r = 30;      //    $rtoi( 0.92387953*(2.0**(PILOT_BITS-1)));
           106:  p1r = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           107:  p1r = 12;      //    $rtoi( 0.38268343*(2.0**(PILOT_BITS-1)));
           108:  p1r = 0;       //     $rtoi( 0.00000000*(2.0**(PILOT_BITS-1)));
           109:  p1r = -9;      //    $rtoi(-0.27059805*(2.0**(PILOT_BITS-1)));
           110:  p1r = -16;     //   $rtoi(-0.50000000*(2.0**(PILOT_BITS-1)));
           111:  p1r = -21;     //   $rtoi(-0.65328148*(2.0**(PILOT_BITS-1)));
           112:  p1r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           113:  p1r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           114:  p1r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           115:  p1r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           116:  p1r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           117:  p1r = -24;     //   $rtoi(-0.75711512*(2.0**(PILOT_BITS-1)));
           118:  p1r = -28;     //   $rtoi(-0.86602540*(2.0**(PILOT_BITS-1)));
           119:  p1r = -31;     //   $rtoi(-0.96269242*(2.0**(PILOT_BITS-1)));
           120:  p1r = -31;     //   $rtoi(-0.93750000*(2.0**(PILOT_BITS-1)));
           121:  p1r = -30;     //   $rtoi(-0.92387953*(2.0**(PILOT_BITS-1)));
           122:  p1r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           123:  p1r = -12;     //   $rtoi(-0.38268343*(2.0**(PILOT_BITS-1)));
           124:  p1r = 0;       //     $rtoi( 0.00000000*(2.0**(PILOT_BITS-1)));
           125:  p1r = 9;       //     $rtoi( 0.27059805*(2.0**(PILOT_BITS-1)));
           126:  p1r = 16;      //    $rtoi( 0.50000000*(2.0**(PILOT_BITS-1)));
           127:  p1r = 21;      //    $rtoi( 0.65328148*(2.0**(PILOT_BITS-1)));
           128:  p1r = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           129:  p1r = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           130:  p1r = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           131:  p1r = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           132:  p1r = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           133:  p1r = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           134:  p1r = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           135:  p1r = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           136:  p1r = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           137:  p1r = 21;      //    $rtoi( 0.65328148*(2.0**(PILOT_BITS-1)));
           138:  p1r = 16;      //    $rtoi( 0.50000000*(2.0**(PILOT_BITS-1)));
           139:  p1r = 9;       //     $rtoi( 0.27059805*(2.0**(PILOT_BITS-1)));
           140:  p1r = 0;       //     $rtoi( 0.00000000*(2.0**(PILOT_BITS-1)));
           141:  p1r = -12;     //   $rtoi(-0.38268343*(2.0**(PILOT_BITS-1)));
           142:  p1r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           143:  p1r = -30;     //   $rtoi(-0.92387953*(2.0**(PILOT_BITS-1)));
           144:  p1r = -31;     //   $rtoi(-0.93750000*(2.0**(PILOT_BITS-1)));
           145:  p1r = -31;     //   $rtoi(-0.96269242*(2.0**(PILOT_BITS-1)));
           146:  p1r = -28;     //   $rtoi(-0.86602540*(2.0**(PILOT_BITS-1)));
           147:  p1r = -24;     //   $rtoi(-0.75711512*(2.0**(PILOT_BITS-1)));
           148:  p1r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           149:  p1r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           150:  p1r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           151:  p1r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           152:  p1r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           153:  p1r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           154:  p1r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           155:  p1r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           156:  p1r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           157:  p1r = -24;     //   $rtoi(-0.75711512*(2.0**(PILOT_BITS-1)));
           158:  p1r = -28;     //   $rtoi(-0.86602540*(2.0**(PILOT_BITS-1)));
           159:  p1r = -31;     //   $rtoi(-0.96269242*(2.0**(PILOT_BITS-1)));
           160:  p1r = -31;     //   $rtoi(-0.93750000*(2.0**(PILOT_BITS-1)));
           161:  p1r = -30;     //   $rtoi(-0.92387953*(2.0**(PILOT_BITS-1)));
           162:  p1r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           163:  p1r = -12;     //   $rtoi(-0.38268343*(2.0**(PILOT_BITS-1)));
           164:  p1r = 0;       //     $rtoi( 0.00000000*(2.0**(PILOT_BITS-1)));
           165:  p1r = 9;       //     $rtoi( 0.27059805*(2.0**(PILOT_BITS-1)));
           166:  p1r = 16;      //    $rtoi( 0.50000000*(2.0**(PILOT_BITS-1)));
           167:  p1r = 21;      //    $rtoi( 0.65328148*(2.0**(PILOT_BITS-1)));
           168:  p1r = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           169:  p1r = 21;      //    $rtoi( 0.65328148*(2.0**(PILOT_BITS-1)));
           170:  p1r = 16;      //    $rtoi( 0.50000000*(2.0**(PILOT_BITS-1)));
           171:  p1r = 9;       //     $rtoi( 0.27059805*(2.0**(PILOT_BITS-1)));
           172:  p1r = 0;       //     $rtoi( 0.00000000*(2.0**(PILOT_BITS-1)));
           173:  p1r = -12;     //   $rtoi(-0.38268343*(2.0**(PILOT_BITS-1)));
           174:  p1r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           175:  p1r = -30;     //   $rtoi(-0.92387953*(2.0**(PILOT_BITS-1)));
           176:  p1r = -31;     //   $rtoi(-0.93750000*(2.0**(PILOT_BITS-1)));
           177:  p1r = -31;     //   $rtoi(-0.96269242*(2.0**(PILOT_BITS-1)));
           178:  p1r = -28;     //   $rtoi(-0.86602540*(2.0**(PILOT_BITS-1)));
           179:  p1r = -24;     //   $rtoi(-0.75711512*(2.0**(PILOT_BITS-1)));
           180:  p1r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           181:  p1r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           182:  p1r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           183:  p1r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           184:  p1r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           185:  p1r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           186:  p1r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           187:  p1r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           188:  p1r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           189:  p1r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           190:  p1r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           191:  p1r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           192:  p1r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           193:  p1r = -21;     //   $rtoi(-0.65328148*(2.0**(PILOT_BITS-1)));
           194:  p1r = -16;     //   $rtoi(-0.50000000*(2.0**(PILOT_BITS-1)));
           195:  p1r = -9;      //    $rtoi(-0.27059805*(2.0**(PILOT_BITS-1)));
           196:  p1r = 0;       //     $rtoi( 0.00000000*(2.0**(PILOT_BITS-1)));
           197:  p1r = 12;      //    $rtoi( 0.38268343*(2.0**(PILOT_BITS-1)));
           198:  p1r = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           199:  p1r = 30;      //    $rtoi( 0.92387953*(2.0**(PILOT_BITS-1)));
           200:  p1r = 31;      //    $rtoi( 0.93750000*(2.0**(PILOT_BITS-1)));
           201:  p1r = 30;      //    $rtoi( 0.92387953*(2.0**(PILOT_BITS-1)));
           202:  p1r = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           203:  p1r = 12;      //    $rtoi( 0.38268343*(2.0**(PILOT_BITS-1)));
           204:  p1r = 0;       //     $rtoi( 0.00000000*(2.0**(PILOT_BITS-1)));
           205:  p1r = -9;      //    $rtoi(-0.27059805*(2.0**(PILOT_BITS-1)));
           206:  p1r = -16;     //   $rtoi(-0.50000000*(2.0**(PILOT_BITS-1)));
           207:  p1r = -21;     //   $rtoi(-0.65328148*(2.0**(PILOT_BITS-1)));
           208:  p1r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           209:  p1r = -21;     //   $rtoi(-0.65328148*(2.0**(PILOT_BITS-1)));
           210:  p1r = -16;     //   $rtoi(-0.50000000*(2.0**(PILOT_BITS-1)));
           211:  p1r = -9;      //    $rtoi(-0.27059805*(2.0**(PILOT_BITS-1)));
           212:  p1r = 0;       //     $rtoi( 0.00000000*(2.0**(PILOT_BITS-1)));
           213:  p1r = 12;      //    $rtoi( 0.38268343*(2.0**(PILOT_BITS-1)));
           214:  p1r = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           215:  p1r = 30;      //    $rtoi( 0.92387953*(2.0**(PILOT_BITS-1)));
           216:  p1r = 31;      //    $rtoi( 0.93750000*(2.0**(PILOT_BITS-1)));
           217:  p1r = 31;      //    $rtoi( 0.96269242*(2.0**(PILOT_BITS-1)));
           218:  p1r = 28;      //    $rtoi( 0.86602540*(2.0**(PILOT_BITS-1)));
           219:  p1r = 24;      //    $rtoi( 0.75711512*(2.0**(PILOT_BITS-1)));
           220:  p1r = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           221:  p1r = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           222:  p1r = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           223:  p1r = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           224:  p1r = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           225:  p1r = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           226:  p1r = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           227:  p1r = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           228:  p1r = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           229:  p1r = 24;      //    $rtoi( 0.75711512*(2.0**(PILOT_BITS-1)));
           230:  p1r = 28;      //    $rtoi( 0.86602540*(2.0**(PILOT_BITS-1)));
           231:  p1r = 31;      //    $rtoi( 0.96269242*(2.0**(PILOT_BITS-1)));
           232:  p1r = 31;      //    $rtoi( 0.93750000*(2.0**(PILOT_BITS-1)));
           233:  p1r = 31;      //    $rtoi( 0.96269242*(2.0**(PILOT_BITS-1)));
           234:  p1r = 28;      //    $rtoi( 0.86602540*(2.0**(PILOT_BITS-1)));
           235:  p1r = 24;      //    $rtoi( 0.75711512*(2.0**(PILOT_BITS-1)));
           236:  p1r = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           237:  p1r = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           238:  p1r = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           239:  p1r = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           240:  p1r = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           241:  p1r = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           242:  p1r = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           243:  p1r = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           244:  p1r = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           245:  p1r = 24;      //    $rtoi( 0.75711512*(2.0**(PILOT_BITS-1)));
           246:  p1r = 28;      //    $rtoi( 0.86602540*(2.0**(PILOT_BITS-1)));
           247:  p1r = 31;      //    $rtoi( 0.96269242*(2.0**(PILOT_BITS-1)));
           248:  p1r = 31;      //    $rtoi( 0.93750000*(2.0**(PILOT_BITS-1)));
           249:  p1r = 30;      //    $rtoi( 0.92387953*(2.0**(PILOT_BITS-1)));
           250:  p1r = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           251:  p1r = 12;      //    $rtoi( 0.38268343*(2.0**(PILOT_BITS-1)));
           252:  p1r = 0;       //     $rtoi( 0.00000000*(2.0**(PILOT_BITS-1)));
           253:  p1r = -12;     //   $rtoi(-0.38268343*(2.0**(PILOT_BITS-1)));
           254:  p1r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           255:  p1r = -30;     //   $rtoi(-0.92387953*(2.0**(PILOT_BITS-1)));
           256:  p1r = -31;     //   $rtoi(-0.93750000*(2.0**(PILOT_BITS-1)));
           257:  p1r = -30;     //   $rtoi(-0.92387953*(2.0**(PILOT_BITS-1)));
           258:  p1r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           259:  p1r = -12;     //   $rtoi(-0.38268343*(2.0**(PILOT_BITS-1)));
           260:  p1r = 0;       //     $rtoi( 0.00000000*(2.0**(PILOT_BITS-1)));
           261:  p1r = 9;       //     $rtoi( 0.27059805*(2.0**(PILOT_BITS-1)));
           262:  p1r = 16;      //    $rtoi( 0.50000000*(2.0**(PILOT_BITS-1)));
           263:  p1r = 21;      //    $rtoi( 0.65328148*(2.0**(PILOT_BITS-1)));
           264:  p1r = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           265:  p1r = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           266:  p1r = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           267:  p1r = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           268:  p1r = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           269:  p1r = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           270:  p1r = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           271:  p1r = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           272:  p1r = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           273:  p1r = 21;      //    $rtoi( 0.65328148*(2.0**(PILOT_BITS-1)));
           274:  p1r = 16;      //    $rtoi( 0.50000000*(2.0**(PILOT_BITS-1)));
           275:  p1r = 9;       //     $rtoi( 0.27059805*(2.0**(PILOT_BITS-1)));
           276:  p1r = 0;       //     $rtoi( 0.00000000*(2.0**(PILOT_BITS-1)));
           277:  p1r = -9;      //    $rtoi(-0.27059805*(2.0**(PILOT_BITS-1)));
           278:  p1r = -16;     //   $rtoi(-0.50000000*(2.0**(PILOT_BITS-1)));
           279:  p1r = -21;     //   $rtoi(-0.65328148*(2.0**(PILOT_BITS-1)));
           280:  p1r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           281:  p1r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           282:  p1r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           283:  p1r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           284:  p1r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           285:  p1r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           286:  p1r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           287:  p1r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           288:  p1r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           289:  p1r = -21;     //   $rtoi(-0.65328148*(2.0**(PILOT_BITS-1)));
           290:  p1r = -16;     //   $rtoi(-0.50000000*(2.0**(PILOT_BITS-1)));
           291:  p1r = -9;      //    $rtoi(-0.27059805*(2.0**(PILOT_BITS-1)));
           292:  p1r = 0;       //     $rtoi( 0.00000000*(2.0**(PILOT_BITS-1)));
           293:  p1r = 12;      //    $rtoi( 0.38268343*(2.0**(PILOT_BITS-1)));
           294:  p1r = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           295:  p1r = 30;      //    $rtoi( 0.92387953*(2.0**(PILOT_BITS-1)));
           296:  p1r = 31;      //    $rtoi( 0.93750000*(2.0**(PILOT_BITS-1)));
           297:  p1r = 31;      //    $rtoi( 0.96269242*(2.0**(PILOT_BITS-1)));
           298:  p1r = 28;      //    $rtoi( 0.86602540*(2.0**(PILOT_BITS-1)));
           299:  p1r = 24;      //    $rtoi( 0.75711512*(2.0**(PILOT_BITS-1)));
           300:  p1r = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           301:  p1r = 24;      //    $rtoi( 0.75711512*(2.0**(PILOT_BITS-1)));
           302:  p1r = 28;      //    $rtoi( 0.86602540*(2.0**(PILOT_BITS-1)));
           303:  p1r = 31;      //    $rtoi( 0.96269242*(2.0**(PILOT_BITS-1)));
           304:  p1r = 31;      //    $rtoi( 0.93750000*(2.0**(PILOT_BITS-1)));
           305:  p1r = 30;      //    $rtoi( 0.92387953*(2.0**(PILOT_BITS-1)));
           306:  p1r = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           307:  p1r = 12;      //    $rtoi( 0.38268343*(2.0**(PILOT_BITS-1)));
           308:  p1r = 0;       //     $rtoi( 0.00000000*(2.0**(PILOT_BITS-1)));
           309:  p1r = -12;     //   $rtoi(-0.38268343*(2.0**(PILOT_BITS-1)));
           310:  p1r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           311:  p1r = -30;     //   $rtoi(-0.92387953*(2.0**(PILOT_BITS-1)));
           312:  p1r = -31;     //   $rtoi(-0.93750000*(2.0**(PILOT_BITS-1)));
           313:  p1r = -31;     //   $rtoi(-0.96269242*(2.0**(PILOT_BITS-1)));
           314:  p1r = -28;     //   $rtoi(-0.86602540*(2.0**(PILOT_BITS-1)));
           315:  p1r = -24;     //   $rtoi(-0.75711512*(2.0**(PILOT_BITS-1)));
           316:  p1r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           317:  p1r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           318:  p1r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           319:  p1r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           320:  p1r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           321:  p1r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           322:  p1r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           323:  p1r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           324:  p1r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           325:  p1r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           326:  p1r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           327:  p1r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           328:  p1r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           329:  p1r = -21;     //   $rtoi(-0.65328148*(2.0**(PILOT_BITS-1)));
           330:  p1r = -16;     //   $rtoi(-0.50000000*(2.0**(PILOT_BITS-1)));
           331:  p1r = -9;      //    $rtoi(-0.27059805*(2.0**(PILOT_BITS-1)));
           332:  p1r = 0;       //     $rtoi( 0.00000000*(2.0**(PILOT_BITS-1)));
           333:  p1r = 12;      //    $rtoi( 0.38268343*(2.0**(PILOT_BITS-1)));
           334:  p1r = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           335:  p1r = 30;      //    $rtoi( 0.92387953*(2.0**(PILOT_BITS-1)));
           336:  p1r = 31;      //    $rtoi( 0.93750000*(2.0**(PILOT_BITS-1)));
           337:  p1r = 31;      //    $rtoi( 0.96269242*(2.0**(PILOT_BITS-1)));
           338:  p1r = 28;      //    $rtoi( 0.86602540*(2.0**(PILOT_BITS-1)));
           339:  p1r = 24;      //    $rtoi( 0.75711512*(2.0**(PILOT_BITS-1)));
           340:  p1r = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           341:  p1r = 24;      //    $rtoi( 0.75711512*(2.0**(PILOT_BITS-1)));
           342:  p1r = 28;      //    $rtoi( 0.86602540*(2.0**(PILOT_BITS-1)));
           343:  p1r = 31;      //    $rtoi( 0.96269242*(2.0**(PILOT_BITS-1)));
           344:  p1r = 31;      //    $rtoi( 0.93750000*(2.0**(PILOT_BITS-1)));
           345:  p1r = 30;      //    $rtoi( 0.92387953*(2.0**(PILOT_BITS-1)));
           346:  p1r = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           347:  p1r = 12;      //    $rtoi( 0.38268343*(2.0**(PILOT_BITS-1)));
           348:  p1r = 0;       //     $rtoi( 0.00000000*(2.0**(PILOT_BITS-1)));
           349:  p1r = -9;      //    $rtoi(-0.27059805*(2.0**(PILOT_BITS-1)));
           350:  p1r = -16;     //   $rtoi(-0.50000000*(2.0**(PILOT_BITS-1)));
           351:  p1r = -21;     //   $rtoi(-0.65328148*(2.0**(PILOT_BITS-1)));
           352:  p1r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           353:  p1r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           354:  p1r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           355:  p1r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           356:  p1r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           357:  p1r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           358:  p1r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           359:  p1r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           360:  p1r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           361:  p1r = -21;     //   $rtoi(-0.65328148*(2.0**(PILOT_BITS-1)));
           362:  p1r = -16;     //   $rtoi(-0.50000000*(2.0**(PILOT_BITS-1)));
           363:  p1r = -9;      //    $rtoi(-0.27059805*(2.0**(PILOT_BITS-1)));
           364:  p1r = 0;       //     $rtoi( 0.00000000*(2.0**(PILOT_BITS-1)));
           365:  p1r = 12;      //    $rtoi( 0.38268343*(2.0**(PILOT_BITS-1)));
           366:  p1r = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           367:  p1r = 30;      //    $rtoi( 0.92387953*(2.0**(PILOT_BITS-1)));
           368:  p1r = 31;      //    $rtoi( 0.93750000*(2.0**(PILOT_BITS-1)));
           369:  p1r = 31;      //    $rtoi( 0.96269242*(2.0**(PILOT_BITS-1)));
           370:  p1r = 28;      //    $rtoi( 0.86602540*(2.0**(PILOT_BITS-1)));
           371:  p1r = 24;      //    $rtoi( 0.75711512*(2.0**(PILOT_BITS-1)));
           372:  p1r = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           373:  p1r = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           374:  p1r = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           375:  p1r = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           376:  p1r = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           377:  p1r = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           378:  p1r = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           379:  p1r = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           380:  p1r = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           381:  p1r = 24;      //    $rtoi( 0.75711512*(2.0**(PILOT_BITS-1)));
           382:  p1r = 28;      //    $rtoi( 0.86602540*(2.0**(PILOT_BITS-1)));
           383:  p1r = 31;      //    $rtoi( 0.96269242*(2.0**(PILOT_BITS-1)));
           384:  p1r = 31;      //    $rtoi( 0.93750000*(2.0**(PILOT_BITS-1)));
           385:  p1r = 30;      //    $rtoi( 0.92387953*(2.0**(PILOT_BITS-1)));
           386:  p1r = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           387:  p1r = 12;      //    $rtoi( 0.38268343*(2.0**(PILOT_BITS-1)));
           388:  p1r = 0;       //     $rtoi( 0.00000000*(2.0**(PILOT_BITS-1)));
           389:  p1r = -9;      //    $rtoi(-0.27059805*(2.0**(PILOT_BITS-1)));
           390:  p1r = -16;     //   $rtoi(-0.50000000*(2.0**(PILOT_BITS-1)));
           391:  p1r = -21;     //   $rtoi(-0.65328148*(2.0**(PILOT_BITS-1)));
           392:  p1r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           393:  p1r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           394:  p1r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           395:  p1r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           396:  p1r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           397:  p1r = -24;     //   $rtoi(-0.75711512*(2.0**(PILOT_BITS-1)));
           398:  p1r = -28;     //   $rtoi(-0.86602540*(2.0**(PILOT_BITS-1)));
           399:  p1r = -31;     //   $rtoi(-0.96269242*(2.0**(PILOT_BITS-1)));
           400:  p1r = -31;     //   $rtoi(-0.93750000*(2.0**(PILOT_BITS-1)));
           401:  p1r = -30;     //   $rtoi(-0.92387953*(2.0**(PILOT_BITS-1)));
           402:  p1r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           403:  p1r = -12;     //   $rtoi(-0.38268343*(2.0**(PILOT_BITS-1)));
           404:  p1r = 0;       //     $rtoi( 0.00000000*(2.0**(PILOT_BITS-1)));
           405:  p1r = 12;      //    $rtoi( 0.38268343*(2.0**(PILOT_BITS-1)));
           406:  p1r = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           407:  p1r = 30;      //    $rtoi( 0.92387953*(2.0**(PILOT_BITS-1)));
           408:  p1r = 31;      //    $rtoi( 0.93750000*(2.0**(PILOT_BITS-1)));
           409:  p1r = 31;      //    $rtoi( 0.96269242*(2.0**(PILOT_BITS-1)));
           410:  p1r = 28;      //    $rtoi( 0.86602540*(2.0**(PILOT_BITS-1)));
           411:  p1r = 24;      //    $rtoi( 0.75711512*(2.0**(PILOT_BITS-1)));
           412:  p1r = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           413:  p1r = 24;      //    $rtoi( 0.75711512*(2.0**(PILOT_BITS-1)));
           414:  p1r = 28;      //    $rtoi( 0.86602540*(2.0**(PILOT_BITS-1)));
           415:  p1r = 31;      //    $rtoi( 0.96269242*(2.0**(PILOT_BITS-1)));
           416:  p1r = 31;      //    $rtoi( 0.93750000*(2.0**(PILOT_BITS-1)));
           417:  p1r = 31;      //    $rtoi( 0.96269242*(2.0**(PILOT_BITS-1)));
           418:  p1r = 28;      //    $rtoi( 0.86602540*(2.0**(PILOT_BITS-1)));
           419:  p1r = 24;      //    $rtoi( 0.75711512*(2.0**(PILOT_BITS-1)));
           420:  p1r = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           421:  p1r = 24;      //    $rtoi( 0.75711512*(2.0**(PILOT_BITS-1)));
           422:  p1r = 28;      //    $rtoi( 0.86602540*(2.0**(PILOT_BITS-1)));
           423:  p1r = 31;      //    $rtoi( 0.96269242*(2.0**(PILOT_BITS-1)));
           424:  p1r = 31;      //    $rtoi( 0.93750000*(2.0**(PILOT_BITS-1)));
           425:  p1r = 31;      //    $rtoi( 0.96269242*(2.0**(PILOT_BITS-1)));
           426:  p1r = 28;      //    $rtoi( 0.86602540*(2.0**(PILOT_BITS-1)));
           427:  p1r = 24;      //    $rtoi( 0.75711512*(2.0**(PILOT_BITS-1)));
           428:  p1r = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           429:  p1r = 24;      //    $rtoi( 0.75711512*(2.0**(PILOT_BITS-1)));
           430:  p1r = 28;      //    $rtoi( 0.86602540*(2.0**(PILOT_BITS-1)));
           431:  p1r = 31;      //    $rtoi( 0.96269242*(2.0**(PILOT_BITS-1)));
           432:  p1r = 31;      //    $rtoi( 0.93750000*(2.0**(PILOT_BITS-1)));
           433:  p1r = 31;      //    $rtoi( 0.96269242*(2.0**(PILOT_BITS-1)));
           434:  p1r = 28;      //    $rtoi( 0.86602540*(2.0**(PILOT_BITS-1)));
           435:  p1r = 24;      //    $rtoi( 0.75711512*(2.0**(PILOT_BITS-1)));
           436:  p1r = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           437:  p1r = 24;      //    $rtoi( 0.75711512*(2.0**(PILOT_BITS-1)));
           438:  p1r = 28;      //    $rtoi( 0.86602540*(2.0**(PILOT_BITS-1)));
           439:  p1r = 31;      //    $rtoi( 0.96269242*(2.0**(PILOT_BITS-1)));
           440:  p1r = 31;      //    $rtoi( 0.93750000*(2.0**(PILOT_BITS-1)));
           441:  p1r = 31;      //    $rtoi( 0.96269242*(2.0**(PILOT_BITS-1)));
           442:  p1r = 28;      //    $rtoi( 0.86602540*(2.0**(PILOT_BITS-1)));
           443:  p1r = 24;      //    $rtoi( 0.75711512*(2.0**(PILOT_BITS-1)));
           444:  p1r = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           445:  p1r = 24;      //    $rtoi( 0.75711512*(2.0**(PILOT_BITS-1)));
           446:  p1r = 28;      //    $rtoi( 0.86602540*(2.0**(PILOT_BITS-1)));
           447:  p1r = 31;      //    $rtoi( 0.96269242*(2.0**(PILOT_BITS-1)));
           448:  p1r = 31;      //    $rtoi( 0.93750000*(2.0**(PILOT_BITS-1)));
           449:  p1r = 31;      //    $rtoi( 0.96269242*(2.0**(PILOT_BITS-1)));
           450:  p1r = 28;      //    $rtoi( 0.86602540*(2.0**(PILOT_BITS-1)));
           451:  p1r = 24;      //    $rtoi( 0.75711512*(2.0**(PILOT_BITS-1)));
           452:  p1r = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           453:  p1r = 24;      //    $rtoi( 0.75711512*(2.0**(PILOT_BITS-1)));
           454:  p1r = 28;      //    $rtoi( 0.86602540*(2.0**(PILOT_BITS-1)));
           455:  p1r = 31;      //    $rtoi( 0.96269242*(2.0**(PILOT_BITS-1)));
           456:  p1r = 31;      //    $rtoi( 0.93750000*(2.0**(PILOT_BITS-1)));
           457:  p1r = 30;      //    $rtoi( 0.92387953*(2.0**(PILOT_BITS-1)));
           458:  p1r = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           459:  p1r = 12;      //    $rtoi( 0.38268343*(2.0**(PILOT_BITS-1)));
           460:  p1r = 0;       //     $rtoi( 0.00000000*(2.0**(PILOT_BITS-1)));
           461:  p1r = -9;      //    $rtoi(-0.27059805*(2.0**(PILOT_BITS-1)));
           462:  p1r = -16;     //   $rtoi(-0.50000000*(2.0**(PILOT_BITS-1)));
           463:  p1r = -21;     //   $rtoi(-0.65328148*(2.0**(PILOT_BITS-1)));
           464:  p1r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           465:  p1r = -21;     //   $rtoi(-0.65328148*(2.0**(PILOT_BITS-1)));
           466:  p1r = -16;     //   $rtoi(-0.50000000*(2.0**(PILOT_BITS-1)));
           467:  p1r = -9;      //    $rtoi(-0.27059805*(2.0**(PILOT_BITS-1)));
           468:  p1r = 0;       //     $rtoi( 0.00000000*(2.0**(PILOT_BITS-1)));
           469:  p1r = 12;      //    $rtoi( 0.38268343*(2.0**(PILOT_BITS-1)));
           470:  p1r = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           471:  p1r = 30;      //    $rtoi( 0.92387953*(2.0**(PILOT_BITS-1)));
           472:  p1r = 31;      //    $rtoi( 0.93750000*(2.0**(PILOT_BITS-1)));
           473:  p1r = 31;      //    $rtoi( 0.96269242*(2.0**(PILOT_BITS-1)));
           474:  p1r = 28;      //    $rtoi( 0.86602540*(2.0**(PILOT_BITS-1)));
           475:  p1r = 24;      //    $rtoi( 0.75711512*(2.0**(PILOT_BITS-1)));
           476:  p1r = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           477:  p1r = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           478:  p1r = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           479:  p1r = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           480:  p1r = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           481:  p1r = 21;      //    $rtoi( 0.65328148*(2.0**(PILOT_BITS-1)));
           482:  p1r = 16;      //    $rtoi( 0.50000000*(2.0**(PILOT_BITS-1)));
           483:  p1r = 9;       //     $rtoi( 0.27059805*(2.0**(PILOT_BITS-1)));
           484:  p1r = 0;       //     $rtoi( 0.00000000*(2.0**(PILOT_BITS-1)));
           485:  p1r = -12;     //   $rtoi(-0.38268343*(2.0**(PILOT_BITS-1)));
           486:  p1r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           487:  p1r = -30;     //   $rtoi(-0.92387953*(2.0**(PILOT_BITS-1)));
           488:  p1r = -31;     //   $rtoi(-0.93750000*(2.0**(PILOT_BITS-1)));
           489:  p1r = -31;     //   $rtoi(-0.96269242*(2.0**(PILOT_BITS-1)));
           490:  p1r = -28;     //   $rtoi(-0.86602540*(2.0**(PILOT_BITS-1)));
           491:  p1r = -24;     //   $rtoi(-0.75711512*(2.0**(PILOT_BITS-1)));
           492:  p1r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           493:  p1r = -24;     //   $rtoi(-0.75711512*(2.0**(PILOT_BITS-1)));
           494:  p1r = -28;     //   $rtoi(-0.86602540*(2.0**(PILOT_BITS-1)));
           495:  p1r = -31;     //   $rtoi(-0.96269242*(2.0**(PILOT_BITS-1)));
           496:  p1r = -31;     //   $rtoi(-0.93750000*(2.0**(PILOT_BITS-1)));
           497:  p1r = -30;     //   $rtoi(-0.92387953*(2.0**(PILOT_BITS-1)));
           498:  p1r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           499:  p1r = -12;     //   $rtoi(-0.38268343*(2.0**(PILOT_BITS-1)));
           500:  p1r = 0;       //     $rtoi( 0.00000000*(2.0**(PILOT_BITS-1)));
           501:  p1r = 9;       //     $rtoi( 0.27059805*(2.0**(PILOT_BITS-1)));
           502:  p1r = 16;      //    $rtoi( 0.50000000*(2.0**(PILOT_BITS-1)));
           503:  p1r = 21;      //    $rtoi( 0.65328148*(2.0**(PILOT_BITS-1)));
           504:  p1r = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           505:  p1r = 21;      //    $rtoi( 0.65328148*(2.0**(PILOT_BITS-1)));
           506:  p1r = 16;      //    $rtoi( 0.50000000*(2.0**(PILOT_BITS-1)));
           507:  p1r = 9;       //     $rtoi( 0.27059805*(2.0**(PILOT_BITS-1)));
           508:  p1r = 0;       //     $rtoi( 0.00000000*(2.0**(PILOT_BITS-1)));
           509:  p1r = -12;     //   $rtoi(-0.38268343*(2.0**(PILOT_BITS-1)));
           510:  p1r = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           511:  p1r = -30;     //   $rtoi(-0.92387953*(2.0**(PILOT_BITS-1)));
        endcase
    end

    reg signed  [PILOT_BITS-1:0]   p1i;
    always @* begin
        case (pilot1Address)
           0  :  p1i = 0;       //     $rtoi( 0.00000000*(2.0**(PILOT_BITS-1)));
           1  :  p1i = 9;       //     $rtoi( 0.27059805*(2.0**(PILOT_BITS-1)));
           2  :  p1i = 16;      //    $rtoi( 0.50000000*(2.0**(PILOT_BITS-1)));
           3  :  p1i = 21;      //    $rtoi( 0.65328148*(2.0**(PILOT_BITS-1)));
           4  :  p1i = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           5  :  p1i = 21;      //    $rtoi( 0.65328148*(2.0**(PILOT_BITS-1)));
           6  :  p1i = 16;      //    $rtoi( 0.50000000*(2.0**(PILOT_BITS-1)));
           7  :  p1i = 9;       //     $rtoi( 0.27059805*(2.0**(PILOT_BITS-1)));
           8  :  p1i = 0;       //     $rtoi( 0.00000000*(2.0**(PILOT_BITS-1)));
           9  :  p1i = -12;     //   $rtoi(-0.38268343*(2.0**(PILOT_BITS-1)));
           10 :  p1i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           11 :  p1i = -30;     //   $rtoi(-0.92387953*(2.0**(PILOT_BITS-1)));
           12 :  p1i = -31;     //   $rtoi(-0.93750000*(2.0**(PILOT_BITS-1)));
           13 :  p1i = -31;     //   $rtoi(-0.96269242*(2.0**(PILOT_BITS-1)));
           14 :  p1i = -28;     //   $rtoi(-0.86602540*(2.0**(PILOT_BITS-1)));
           15 :  p1i = -24;     //   $rtoi(-0.75711512*(2.0**(PILOT_BITS-1)));
           16 :  p1i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           17 :  p1i = -24;     //   $rtoi(-0.75711512*(2.0**(PILOT_BITS-1)));
           18 :  p1i = -28;     //   $rtoi(-0.86602540*(2.0**(PILOT_BITS-1)));
           19 :  p1i = -31;     //   $rtoi(-0.96269242*(2.0**(PILOT_BITS-1)));
           20 :  p1i = -31;     //   $rtoi(-0.93750000*(2.0**(PILOT_BITS-1)));
           21 :  p1i = -30;     //   $rtoi(-0.92387953*(2.0**(PILOT_BITS-1)));
           22 :  p1i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           23 :  p1i = -12;     //   $rtoi(-0.38268343*(2.0**(PILOT_BITS-1)));
           24 :  p1i = 0;       //     $rtoi( 0.00000000*(2.0**(PILOT_BITS-1)));
           25 :  p1i = 9;       //     $rtoi( 0.27059805*(2.0**(PILOT_BITS-1)));
           26 :  p1i = 16;      //    $rtoi( 0.50000000*(2.0**(PILOT_BITS-1)));
           27 :  p1i = 21;      //    $rtoi( 0.65328148*(2.0**(PILOT_BITS-1)));
           28 :  p1i = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           29 :  p1i = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           30 :  p1i = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           31 :  p1i = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           32 :  p1i = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           33 :  p1i = 24;      //    $rtoi( 0.75711512*(2.0**(PILOT_BITS-1)));
           34 :  p1i = 28;      //    $rtoi( 0.86602540*(2.0**(PILOT_BITS-1)));
           35 :  p1i = 31;      //    $rtoi( 0.96269242*(2.0**(PILOT_BITS-1)));
           36 :  p1i = 31;      //    $rtoi( 0.93750000*(2.0**(PILOT_BITS-1)));
           37 :  p1i = 30;      //    $rtoi( 0.92387953*(2.0**(PILOT_BITS-1)));
           38 :  p1i = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           39 :  p1i = 12;      //    $rtoi( 0.38268343*(2.0**(PILOT_BITS-1)));
           40 :  p1i = 0;       //     $rtoi( 0.00000000*(2.0**(PILOT_BITS-1)));
           41 :  p1i = -9;      //    $rtoi(-0.27059805*(2.0**(PILOT_BITS-1)));
           42 :  p1i = -16;     //   $rtoi(-0.50000000*(2.0**(PILOT_BITS-1)));
           43 :  p1i = -21;     //   $rtoi(-0.65328148*(2.0**(PILOT_BITS-1)));
           44 :  p1i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           45 :  p1i = -21;     //   $rtoi(-0.65328148*(2.0**(PILOT_BITS-1)));
           46 :  p1i = -16;     //   $rtoi(-0.50000000*(2.0**(PILOT_BITS-1)));
           47 :  p1i = -9;      //    $rtoi(-0.27059805*(2.0**(PILOT_BITS-1)));
           48 :  p1i = 0;       //     $rtoi( 0.00000000*(2.0**(PILOT_BITS-1)));
           49 :  p1i = 12;      //    $rtoi( 0.38268343*(2.0**(PILOT_BITS-1)));
           50 :  p1i = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           51 :  p1i = 30;      //    $rtoi( 0.92387953*(2.0**(PILOT_BITS-1)));
           52 :  p1i = 31;      //    $rtoi( 0.93750000*(2.0**(PILOT_BITS-1)));
           53 :  p1i = 31;      //    $rtoi( 0.96269242*(2.0**(PILOT_BITS-1)));
           54 :  p1i = 28;      //    $rtoi( 0.86602540*(2.0**(PILOT_BITS-1)));
           55 :  p1i = 24;      //    $rtoi( 0.75711512*(2.0**(PILOT_BITS-1)));
           56 :  p1i = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           57 :  p1i = 24;      //    $rtoi( 0.75711512*(2.0**(PILOT_BITS-1)));
           58 :  p1i = 28;      //    $rtoi( 0.86602540*(2.0**(PILOT_BITS-1)));
           59 :  p1i = 31;      //    $rtoi( 0.96269242*(2.0**(PILOT_BITS-1)));
           60 :  p1i = 31;      //    $rtoi( 0.93750000*(2.0**(PILOT_BITS-1)));
           61 :  p1i = 31;      //    $rtoi( 0.96269242*(2.0**(PILOT_BITS-1)));
           62 :  p1i = 28;      //    $rtoi( 0.86602540*(2.0**(PILOT_BITS-1)));
           63 :  p1i = 24;      //    $rtoi( 0.75711512*(2.0**(PILOT_BITS-1)));
           64 :  p1i = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           65 :  p1i = 24;      //    $rtoi( 0.75711512*(2.0**(PILOT_BITS-1)));
           66 :  p1i = 28;      //    $rtoi( 0.86602540*(2.0**(PILOT_BITS-1)));
           67 :  p1i = 31;      //    $rtoi( 0.96269242*(2.0**(PILOT_BITS-1)));
           68 :  p1i = 31;      //    $rtoi( 0.93750000*(2.0**(PILOT_BITS-1)));
           69 :  p1i = 31;      //    $rtoi( 0.96269242*(2.0**(PILOT_BITS-1)));
           70 :  p1i = 28;      //    $rtoi( 0.86602540*(2.0**(PILOT_BITS-1)));
           71 :  p1i = 24;      //    $rtoi( 0.75711512*(2.0**(PILOT_BITS-1)));
           72 :  p1i = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           73 :  p1i = 24;      //    $rtoi( 0.75711512*(2.0**(PILOT_BITS-1)));
           74 :  p1i = 28;      //    $rtoi( 0.86602540*(2.0**(PILOT_BITS-1)));
           75 :  p1i = 31;      //    $rtoi( 0.96269242*(2.0**(PILOT_BITS-1)));
           76 :  p1i = 31;      //    $rtoi( 0.93750000*(2.0**(PILOT_BITS-1)));
           77 :  p1i = 31;      //    $rtoi( 0.96269242*(2.0**(PILOT_BITS-1)));
           78 :  p1i = 28;      //    $rtoi( 0.86602540*(2.0**(PILOT_BITS-1)));
           79 :  p1i = 24;      //    $rtoi( 0.75711512*(2.0**(PILOT_BITS-1)));
           80 :  p1i = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           81 :  p1i = 24;      //    $rtoi( 0.75711512*(2.0**(PILOT_BITS-1)));
           82 :  p1i = 28;      //    $rtoi( 0.86602540*(2.0**(PILOT_BITS-1)));
           83 :  p1i = 31;      //    $rtoi( 0.96269242*(2.0**(PILOT_BITS-1)));
           84 :  p1i = 31;      //    $rtoi( 0.93750000*(2.0**(PILOT_BITS-1)));
           85 :  p1i = 31;      //    $rtoi( 0.96269242*(2.0**(PILOT_BITS-1)));
           86 :  p1i = 28;      //    $rtoi( 0.86602540*(2.0**(PILOT_BITS-1)));
           87 :  p1i = 24;      //    $rtoi( 0.75711512*(2.0**(PILOT_BITS-1)));
           88 :  p1i = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           89 :  p1i = 24;      //    $rtoi( 0.75711512*(2.0**(PILOT_BITS-1)));
           90 :  p1i = 28;      //    $rtoi( 0.86602540*(2.0**(PILOT_BITS-1)));
           91 :  p1i = 31;      //    $rtoi( 0.96269242*(2.0**(PILOT_BITS-1)));
           92 :  p1i = 31;      //    $rtoi( 0.93750000*(2.0**(PILOT_BITS-1)));
           93 :  p1i = 31;      //    $rtoi( 0.96269242*(2.0**(PILOT_BITS-1)));
           94 :  p1i = 28;      //    $rtoi( 0.86602540*(2.0**(PILOT_BITS-1)));
           95 :  p1i = 24;      //    $rtoi( 0.75711512*(2.0**(PILOT_BITS-1)));
           96 :  p1i = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           97 :  p1i = 24;      //    $rtoi( 0.75711512*(2.0**(PILOT_BITS-1)));
           98 :  p1i = 28;      //    $rtoi( 0.86602540*(2.0**(PILOT_BITS-1)));
           99 :  p1i = 31;      //    $rtoi( 0.96269242*(2.0**(PILOT_BITS-1)));
           100:  p1i = 31;      //    $rtoi( 0.93750000*(2.0**(PILOT_BITS-1)));
           101:  p1i = 30;      //    $rtoi( 0.92387953*(2.0**(PILOT_BITS-1)));
           102:  p1i = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           103:  p1i = 12;      //    $rtoi( 0.38268343*(2.0**(PILOT_BITS-1)));
           104:  p1i = 0;       //     $rtoi( 0.00000000*(2.0**(PILOT_BITS-1)));
           105:  p1i = -12;     //   $rtoi(-0.38268343*(2.0**(PILOT_BITS-1)));
           106:  p1i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           107:  p1i = -30;     //   $rtoi(-0.92387953*(2.0**(PILOT_BITS-1)));
           108:  p1i = -31;     //   $rtoi(-0.93750000*(2.0**(PILOT_BITS-1)));
           109:  p1i = -31;     //   $rtoi(-0.96269242*(2.0**(PILOT_BITS-1)));
           110:  p1i = -28;     //   $rtoi(-0.86602540*(2.0**(PILOT_BITS-1)));
           111:  p1i = -24;     //   $rtoi(-0.75711512*(2.0**(PILOT_BITS-1)));
           112:  p1i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           113:  p1i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           114:  p1i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           115:  p1i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           116:  p1i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           117:  p1i = -21;     //   $rtoi(-0.65328148*(2.0**(PILOT_BITS-1)));
           118:  p1i = -16;     //   $rtoi(-0.50000000*(2.0**(PILOT_BITS-1)));
           119:  p1i = -9;      //    $rtoi(-0.27059805*(2.0**(PILOT_BITS-1)));
           120:  p1i = 0;       //     $rtoi( 0.00000000*(2.0**(PILOT_BITS-1)));
           121:  p1i = 12;      //    $rtoi( 0.38268343*(2.0**(PILOT_BITS-1)));
           122:  p1i = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           123:  p1i = 30;      //    $rtoi( 0.92387953*(2.0**(PILOT_BITS-1)));
           124:  p1i = 31;      //    $rtoi( 0.93750000*(2.0**(PILOT_BITS-1)));
           125:  p1i = 31;      //    $rtoi( 0.96269242*(2.0**(PILOT_BITS-1)));
           126:  p1i = 28;      //    $rtoi( 0.86602540*(2.0**(PILOT_BITS-1)));
           127:  p1i = 24;      //    $rtoi( 0.75711512*(2.0**(PILOT_BITS-1)));
           128:  p1i = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           129:  p1i = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           130:  p1i = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           131:  p1i = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           132:  p1i = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           133:  p1i = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           134:  p1i = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           135:  p1i = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           136:  p1i = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           137:  p1i = 24;      //    $rtoi( 0.75711512*(2.0**(PILOT_BITS-1)));
           138:  p1i = 28;      //    $rtoi( 0.86602540*(2.0**(PILOT_BITS-1)));
           139:  p1i = 31;      //    $rtoi( 0.96269242*(2.0**(PILOT_BITS-1)));
           140:  p1i = 31;      //    $rtoi( 0.93750000*(2.0**(PILOT_BITS-1)));
           141:  p1i = 30;      //    $rtoi( 0.92387953*(2.0**(PILOT_BITS-1)));
           142:  p1i = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           143:  p1i = 12;      //    $rtoi( 0.38268343*(2.0**(PILOT_BITS-1)));
           144:  p1i = 0;       //     $rtoi( 0.00000000*(2.0**(PILOT_BITS-1)));
           145:  p1i = -9;      //    $rtoi(-0.27059805*(2.0**(PILOT_BITS-1)));
           146:  p1i = -16;     //   $rtoi(-0.50000000*(2.0**(PILOT_BITS-1)));
           147:  p1i = -21;     //   $rtoi(-0.65328148*(2.0**(PILOT_BITS-1)));
           148:  p1i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           149:  p1i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           150:  p1i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           151:  p1i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           152:  p1i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           153:  p1i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           154:  p1i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           155:  p1i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           156:  p1i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           157:  p1i = -21;     //   $rtoi(-0.65328148*(2.0**(PILOT_BITS-1)));
           158:  p1i = -16;     //   $rtoi(-0.50000000*(2.0**(PILOT_BITS-1)));
           159:  p1i = -9;      //    $rtoi(-0.27059805*(2.0**(PILOT_BITS-1)));
           160:  p1i = 0;       //     $rtoi( 0.00000000*(2.0**(PILOT_BITS-1)));
           161:  p1i = 12;      //    $rtoi( 0.38268343*(2.0**(PILOT_BITS-1)));
           162:  p1i = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           163:  p1i = 30;      //    $rtoi( 0.92387953*(2.0**(PILOT_BITS-1)));
           164:  p1i = 31;      //    $rtoi( 0.93750000*(2.0**(PILOT_BITS-1)));
           165:  p1i = 31;      //    $rtoi( 0.96269242*(2.0**(PILOT_BITS-1)));
           166:  p1i = 28;      //    $rtoi( 0.86602540*(2.0**(PILOT_BITS-1)));
           167:  p1i = 24;      //    $rtoi( 0.75711512*(2.0**(PILOT_BITS-1)));
           168:  p1i = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           169:  p1i = 24;      //    $rtoi( 0.75711512*(2.0**(PILOT_BITS-1)));
           170:  p1i = 28;      //    $rtoi( 0.86602540*(2.0**(PILOT_BITS-1)));
           171:  p1i = 31;      //    $rtoi( 0.96269242*(2.0**(PILOT_BITS-1)));
           172:  p1i = 31;      //    $rtoi( 0.93750000*(2.0**(PILOT_BITS-1)));
           173:  p1i = 30;      //    $rtoi( 0.92387953*(2.0**(PILOT_BITS-1)));
           174:  p1i = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           175:  p1i = 12;      //    $rtoi( 0.38268343*(2.0**(PILOT_BITS-1)));
           176:  p1i = 0;       //     $rtoi( 0.00000000*(2.0**(PILOT_BITS-1)));
           177:  p1i = -9;      //    $rtoi(-0.27059805*(2.0**(PILOT_BITS-1)));
           178:  p1i = -16;     //   $rtoi(-0.50000000*(2.0**(PILOT_BITS-1)));
           179:  p1i = -21;     //   $rtoi(-0.65328148*(2.0**(PILOT_BITS-1)));
           180:  p1i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           181:  p1i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           182:  p1i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           183:  p1i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           184:  p1i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           185:  p1i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           186:  p1i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           187:  p1i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           188:  p1i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           189:  p1i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           190:  p1i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           191:  p1i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           192:  p1i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           193:  p1i = -24;     //   $rtoi(-0.75711512*(2.0**(PILOT_BITS-1)));
           194:  p1i = -28;     //   $rtoi(-0.86602540*(2.0**(PILOT_BITS-1)));
           195:  p1i = -31;     //   $rtoi(-0.96269242*(2.0**(PILOT_BITS-1)));
           196:  p1i = -31;     //   $rtoi(-0.93750000*(2.0**(PILOT_BITS-1)));
           197:  p1i = -30;     //   $rtoi(-0.92387953*(2.0**(PILOT_BITS-1)));
           198:  p1i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           199:  p1i = -12;     //   $rtoi(-0.38268343*(2.0**(PILOT_BITS-1)));
           200:  p1i = 0;       //     $rtoi( 0.00000000*(2.0**(PILOT_BITS-1)));
           201:  p1i = 12;      //    $rtoi( 0.38268343*(2.0**(PILOT_BITS-1)));
           202:  p1i = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           203:  p1i = 30;      //    $rtoi( 0.92387953*(2.0**(PILOT_BITS-1)));
           204:  p1i = 31;      //    $rtoi( 0.93750000*(2.0**(PILOT_BITS-1)));
           205:  p1i = 31;      //    $rtoi( 0.96269242*(2.0**(PILOT_BITS-1)));
           206:  p1i = 28;      //    $rtoi( 0.86602540*(2.0**(PILOT_BITS-1)));
           207:  p1i = 24;      //    $rtoi( 0.75711512*(2.0**(PILOT_BITS-1)));
           208:  p1i = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           209:  p1i = 24;      //    $rtoi( 0.75711512*(2.0**(PILOT_BITS-1)));
           210:  p1i = 28;      //    $rtoi( 0.86602540*(2.0**(PILOT_BITS-1)));
           211:  p1i = 31;      //    $rtoi( 0.96269242*(2.0**(PILOT_BITS-1)));
           212:  p1i = 31;      //    $rtoi( 0.93750000*(2.0**(PILOT_BITS-1)));
           213:  p1i = 30;      //    $rtoi( 0.92387953*(2.0**(PILOT_BITS-1)));
           214:  p1i = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           215:  p1i = 12;      //    $rtoi( 0.38268343*(2.0**(PILOT_BITS-1)));
           216:  p1i = 0;       //     $rtoi( 0.00000000*(2.0**(PILOT_BITS-1)));
           217:  p1i = -9;      //    $rtoi(-0.27059805*(2.0**(PILOT_BITS-1)));
           218:  p1i = -16;     //   $rtoi(-0.50000000*(2.0**(PILOT_BITS-1)));
           219:  p1i = -21;     //   $rtoi(-0.65328148*(2.0**(PILOT_BITS-1)));
           220:  p1i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           221:  p1i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           222:  p1i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           223:  p1i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           224:  p1i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           225:  p1i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           226:  p1i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           227:  p1i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           228:  p1i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           229:  p1i = -21;     //   $rtoi(-0.65328148*(2.0**(PILOT_BITS-1)));
           230:  p1i = -16;     //   $rtoi(-0.50000000*(2.0**(PILOT_BITS-1)));
           231:  p1i = -9;      //    $rtoi(-0.27059805*(2.0**(PILOT_BITS-1)));
           232:  p1i = 0;       //     $rtoi( 0.00000000*(2.0**(PILOT_BITS-1)));
           233:  p1i = 9;       //     $rtoi( 0.27059805*(2.0**(PILOT_BITS-1)));
           234:  p1i = 16;      //    $rtoi( 0.50000000*(2.0**(PILOT_BITS-1)));
           235:  p1i = 21;      //    $rtoi( 0.65328148*(2.0**(PILOT_BITS-1)));
           236:  p1i = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           237:  p1i = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           238:  p1i = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           239:  p1i = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           240:  p1i = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           241:  p1i = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           242:  p1i = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           243:  p1i = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           244:  p1i = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           245:  p1i = 21;      //    $rtoi( 0.65328148*(2.0**(PILOT_BITS-1)));
           246:  p1i = 16;      //    $rtoi( 0.50000000*(2.0**(PILOT_BITS-1)));
           247:  p1i = 9;       //     $rtoi( 0.27059805*(2.0**(PILOT_BITS-1)));
           248:  p1i = 0;       //     $rtoi( 0.00000000*(2.0**(PILOT_BITS-1)));
           249:  p1i = -12;     //   $rtoi(-0.38268343*(2.0**(PILOT_BITS-1)));
           250:  p1i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           251:  p1i = -30;     //   $rtoi(-0.92387953*(2.0**(PILOT_BITS-1)));
           252:  p1i = -31;     //   $rtoi(-0.93750000*(2.0**(PILOT_BITS-1)));
           253:  p1i = -30;     //   $rtoi(-0.92387953*(2.0**(PILOT_BITS-1)));
           254:  p1i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           255:  p1i = -12;     //   $rtoi(-0.38268343*(2.0**(PILOT_BITS-1)));
           256:  p1i = 0;       //     $rtoi( 0.00000000*(2.0**(PILOT_BITS-1)));
           257:  p1i = 12;      //    $rtoi( 0.38268343*(2.0**(PILOT_BITS-1)));
           258:  p1i = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           259:  p1i = 30;      //    $rtoi( 0.92387953*(2.0**(PILOT_BITS-1)));
           260:  p1i = 31;      //    $rtoi( 0.93750000*(2.0**(PILOT_BITS-1)));
           261:  p1i = 31;      //    $rtoi( 0.96269242*(2.0**(PILOT_BITS-1)));
           262:  p1i = 28;      //    $rtoi( 0.86602540*(2.0**(PILOT_BITS-1)));
           263:  p1i = 24;      //    $rtoi( 0.75711512*(2.0**(PILOT_BITS-1)));
           264:  p1i = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           265:  p1i = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           266:  p1i = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           267:  p1i = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           268:  p1i = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           269:  p1i = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           270:  p1i = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           271:  p1i = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           272:  p1i = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           273:  p1i = 24;      //    $rtoi( 0.75711512*(2.0**(PILOT_BITS-1)));
           274:  p1i = 28;      //    $rtoi( 0.86602540*(2.0**(PILOT_BITS-1)));
           275:  p1i = 31;      //    $rtoi( 0.96269242*(2.0**(PILOT_BITS-1)));
           276:  p1i = 31;      //    $rtoi( 0.93750000*(2.0**(PILOT_BITS-1)));
           277:  p1i = 31;      //    $rtoi( 0.96269242*(2.0**(PILOT_BITS-1)));
           278:  p1i = 28;      //    $rtoi( 0.86602540*(2.0**(PILOT_BITS-1)));
           279:  p1i = 24;      //    $rtoi( 0.75711512*(2.0**(PILOT_BITS-1)));
           280:  p1i = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           281:  p1i = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           282:  p1i = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           283:  p1i = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           284:  p1i = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           285:  p1i = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           286:  p1i = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           287:  p1i = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           288:  p1i = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           289:  p1i = 24;      //    $rtoi( 0.75711512*(2.0**(PILOT_BITS-1)));
           290:  p1i = 28;      //    $rtoi( 0.86602540*(2.0**(PILOT_BITS-1)));
           291:  p1i = 31;      //    $rtoi( 0.96269242*(2.0**(PILOT_BITS-1)));
           292:  p1i = 31;      //    $rtoi( 0.93750000*(2.0**(PILOT_BITS-1)));
           293:  p1i = 30;      //    $rtoi( 0.92387953*(2.0**(PILOT_BITS-1)));
           294:  p1i = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           295:  p1i = 12;      //    $rtoi( 0.38268343*(2.0**(PILOT_BITS-1)));
           296:  p1i = 0;       //     $rtoi( 0.00000000*(2.0**(PILOT_BITS-1)));
           297:  p1i = -9;      //    $rtoi(-0.27059805*(2.0**(PILOT_BITS-1)));
           298:  p1i = -16;     //   $rtoi(-0.50000000*(2.0**(PILOT_BITS-1)));
           299:  p1i = -21;     //   $rtoi(-0.65328148*(2.0**(PILOT_BITS-1)));
           300:  p1i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           301:  p1i = -21;     //   $rtoi(-0.65328148*(2.0**(PILOT_BITS-1)));
           302:  p1i = -16;     //   $rtoi(-0.50000000*(2.0**(PILOT_BITS-1)));
           303:  p1i = -9;      //    $rtoi(-0.27059805*(2.0**(PILOT_BITS-1)));
           304:  p1i = 0;       //     $rtoi( 0.00000000*(2.0**(PILOT_BITS-1)));
           305:  p1i = 12;      //    $rtoi( 0.38268343*(2.0**(PILOT_BITS-1)));
           306:  p1i = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           307:  p1i = 30;      //    $rtoi( 0.92387953*(2.0**(PILOT_BITS-1)));
           308:  p1i = 31;      //    $rtoi( 0.93750000*(2.0**(PILOT_BITS-1)));
           309:  p1i = 30;      //    $rtoi( 0.92387953*(2.0**(PILOT_BITS-1)));
           310:  p1i = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           311:  p1i = 12;      //    $rtoi( 0.38268343*(2.0**(PILOT_BITS-1)));
           312:  p1i = 0;       //     $rtoi( 0.00000000*(2.0**(PILOT_BITS-1)));
           313:  p1i = -9;      //    $rtoi(-0.27059805*(2.0**(PILOT_BITS-1)));
           314:  p1i = -16;     //   $rtoi(-0.50000000*(2.0**(PILOT_BITS-1)));
           315:  p1i = -21;     //   $rtoi(-0.65328148*(2.0**(PILOT_BITS-1)));
           316:  p1i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           317:  p1i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           318:  p1i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           319:  p1i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           320:  p1i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           321:  p1i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           322:  p1i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           323:  p1i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           324:  p1i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           325:  p1i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           326:  p1i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           327:  p1i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           328:  p1i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           329:  p1i = -24;     //   $rtoi(-0.75711512*(2.0**(PILOT_BITS-1)));
           330:  p1i = -28;     //   $rtoi(-0.86602540*(2.0**(PILOT_BITS-1)));
           331:  p1i = -31;     //   $rtoi(-0.96269242*(2.0**(PILOT_BITS-1)));
           332:  p1i = -31;     //   $rtoi(-0.93750000*(2.0**(PILOT_BITS-1)));
           333:  p1i = -30;     //   $rtoi(-0.92387953*(2.0**(PILOT_BITS-1)));
           334:  p1i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           335:  p1i = -12;     //   $rtoi(-0.38268343*(2.0**(PILOT_BITS-1)));
           336:  p1i = 0;       //     $rtoi( 0.00000000*(2.0**(PILOT_BITS-1)));
           337:  p1i = 9;       //     $rtoi( 0.27059805*(2.0**(PILOT_BITS-1)));
           338:  p1i = 16;      //    $rtoi( 0.50000000*(2.0**(PILOT_BITS-1)));
           339:  p1i = 21;      //    $rtoi( 0.65328148*(2.0**(PILOT_BITS-1)));
           340:  p1i = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           341:  p1i = 21;      //    $rtoi( 0.65328148*(2.0**(PILOT_BITS-1)));
           342:  p1i = 16;      //    $rtoi( 0.50000000*(2.0**(PILOT_BITS-1)));
           343:  p1i = 9;       //     $rtoi( 0.27059805*(2.0**(PILOT_BITS-1)));
           344:  p1i = 0;       //     $rtoi( 0.00000000*(2.0**(PILOT_BITS-1)));
           345:  p1i = -12;     //   $rtoi(-0.38268343*(2.0**(PILOT_BITS-1)));
           346:  p1i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           347:  p1i = -30;     //   $rtoi(-0.92387953*(2.0**(PILOT_BITS-1)));
           348:  p1i = -31;     //   $rtoi(-0.93750000*(2.0**(PILOT_BITS-1)));
           349:  p1i = -31;     //   $rtoi(-0.96269242*(2.0**(PILOT_BITS-1)));
           350:  p1i = -28;     //   $rtoi(-0.86602540*(2.0**(PILOT_BITS-1)));
           351:  p1i = -24;     //   $rtoi(-0.75711512*(2.0**(PILOT_BITS-1)));
           352:  p1i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           353:  p1i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           354:  p1i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           355:  p1i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           356:  p1i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           357:  p1i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           358:  p1i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           359:  p1i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           360:  p1i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           361:  p1i = -24;     //   $rtoi(-0.75711512*(2.0**(PILOT_BITS-1)));
           362:  p1i = -28;     //   $rtoi(-0.86602540*(2.0**(PILOT_BITS-1)));
           363:  p1i = -31;     //   $rtoi(-0.96269242*(2.0**(PILOT_BITS-1)));
           364:  p1i = -31;     //   $rtoi(-0.93750000*(2.0**(PILOT_BITS-1)));
           365:  p1i = -30;     //   $rtoi(-0.92387953*(2.0**(PILOT_BITS-1)));
           366:  p1i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           367:  p1i = -12;     //   $rtoi(-0.38268343*(2.0**(PILOT_BITS-1)));
           368:  p1i = 0;       //     $rtoi( 0.00000000*(2.0**(PILOT_BITS-1)));
           369:  p1i = 9;       //     $rtoi( 0.27059805*(2.0**(PILOT_BITS-1)));
           370:  p1i = 16;      //    $rtoi( 0.50000000*(2.0**(PILOT_BITS-1)));
           371:  p1i = 21;      //    $rtoi( 0.65328148*(2.0**(PILOT_BITS-1)));
           372:  p1i = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           373:  p1i = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           374:  p1i = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           375:  p1i = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           376:  p1i = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           377:  p1i = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           378:  p1i = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           379:  p1i = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           380:  p1i = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           381:  p1i = 21;      //    $rtoi( 0.65328148*(2.0**(PILOT_BITS-1)));
           382:  p1i = 16;      //    $rtoi( 0.50000000*(2.0**(PILOT_BITS-1)));
           383:  p1i = 9;       //     $rtoi( 0.27059805*(2.0**(PILOT_BITS-1)));
           384:  p1i = 0;       //     $rtoi( 0.00000000*(2.0**(PILOT_BITS-1)));
           385:  p1i = -12;     //   $rtoi(-0.38268343*(2.0**(PILOT_BITS-1)));
           386:  p1i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           387:  p1i = -30;     //   $rtoi(-0.92387953*(2.0**(PILOT_BITS-1)));
           388:  p1i = -31;     //   $rtoi(-0.93750000*(2.0**(PILOT_BITS-1)));
           389:  p1i = -31;     //   $rtoi(-0.96269242*(2.0**(PILOT_BITS-1)));
           390:  p1i = -28;     //   $rtoi(-0.86602540*(2.0**(PILOT_BITS-1)));
           391:  p1i = -24;     //   $rtoi(-0.75711512*(2.0**(PILOT_BITS-1)));
           392:  p1i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           393:  p1i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           394:  p1i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           395:  p1i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           396:  p1i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           397:  p1i = -21;     //   $rtoi(-0.65328148*(2.0**(PILOT_BITS-1)));
           398:  p1i = -16;     //   $rtoi(-0.50000000*(2.0**(PILOT_BITS-1)));
           399:  p1i = -9;      //    $rtoi(-0.27059805*(2.0**(PILOT_BITS-1)));
           400:  p1i = 0;       //     $rtoi( 0.00000000*(2.0**(PILOT_BITS-1)));
           401:  p1i = 12;      //    $rtoi( 0.38268343*(2.0**(PILOT_BITS-1)));
           402:  p1i = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           403:  p1i = 30;      //    $rtoi( 0.92387953*(2.0**(PILOT_BITS-1)));
           404:  p1i = 31;      //    $rtoi( 0.93750000*(2.0**(PILOT_BITS-1)));
           405:  p1i = 30;      //    $rtoi( 0.92387953*(2.0**(PILOT_BITS-1)));
           406:  p1i = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           407:  p1i = 12;      //    $rtoi( 0.38268343*(2.0**(PILOT_BITS-1)));
           408:  p1i = 0;       //     $rtoi( 0.00000000*(2.0**(PILOT_BITS-1)));
           409:  p1i = -9;      //    $rtoi(-0.27059805*(2.0**(PILOT_BITS-1)));
           410:  p1i = -16;     //   $rtoi(-0.50000000*(2.0**(PILOT_BITS-1)));
           411:  p1i = -21;     //   $rtoi(-0.65328148*(2.0**(PILOT_BITS-1)));
           412:  p1i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           413:  p1i = -21;     //   $rtoi(-0.65328148*(2.0**(PILOT_BITS-1)));
           414:  p1i = -16;     //   $rtoi(-0.50000000*(2.0**(PILOT_BITS-1)));
           415:  p1i = -9;      //    $rtoi(-0.27059805*(2.0**(PILOT_BITS-1)));
           416:  p1i = 0;       //     $rtoi( 0.00000000*(2.0**(PILOT_BITS-1)));
           417:  p1i = 9;       //     $rtoi( 0.27059805*(2.0**(PILOT_BITS-1)));
           418:  p1i = 16;      //    $rtoi( 0.50000000*(2.0**(PILOT_BITS-1)));
           419:  p1i = 21;      //    $rtoi( 0.65328148*(2.0**(PILOT_BITS-1)));
           420:  p1i = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           421:  p1i = 21;      //    $rtoi( 0.65328148*(2.0**(PILOT_BITS-1)));
           422:  p1i = 16;      //    $rtoi( 0.50000000*(2.0**(PILOT_BITS-1)));
           423:  p1i = 9;       //     $rtoi( 0.27059805*(2.0**(PILOT_BITS-1)));
           424:  p1i = 0;       //     $rtoi( 0.00000000*(2.0**(PILOT_BITS-1)));
           425:  p1i = -9;      //    $rtoi(-0.27059805*(2.0**(PILOT_BITS-1)));
           426:  p1i = -16;     //   $rtoi(-0.50000000*(2.0**(PILOT_BITS-1)));
           427:  p1i = -21;     //   $rtoi(-0.65328148*(2.0**(PILOT_BITS-1)));
           428:  p1i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           429:  p1i = -21;     //   $rtoi(-0.65328148*(2.0**(PILOT_BITS-1)));
           430:  p1i = -16;     //   $rtoi(-0.50000000*(2.0**(PILOT_BITS-1)));
           431:  p1i = -9;      //    $rtoi(-0.27059805*(2.0**(PILOT_BITS-1)));
           432:  p1i = 0;       //     $rtoi( 0.00000000*(2.0**(PILOT_BITS-1)));
           433:  p1i = 9;       //     $rtoi( 0.27059805*(2.0**(PILOT_BITS-1)));
           434:  p1i = 16;      //    $rtoi( 0.50000000*(2.0**(PILOT_BITS-1)));
           435:  p1i = 21;      //    $rtoi( 0.65328148*(2.0**(PILOT_BITS-1)));
           436:  p1i = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           437:  p1i = 21;      //    $rtoi( 0.65328148*(2.0**(PILOT_BITS-1)));
           438:  p1i = 16;      //    $rtoi( 0.50000000*(2.0**(PILOT_BITS-1)));
           439:  p1i = 9;       //     $rtoi( 0.27059805*(2.0**(PILOT_BITS-1)));
           440:  p1i = 0;       //     $rtoi( 0.00000000*(2.0**(PILOT_BITS-1)));
           441:  p1i = -9;      //    $rtoi(-0.27059805*(2.0**(PILOT_BITS-1)));
           442:  p1i = -16;     //   $rtoi(-0.50000000*(2.0**(PILOT_BITS-1)));
           443:  p1i = -21;     //   $rtoi(-0.65328148*(2.0**(PILOT_BITS-1)));
           444:  p1i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           445:  p1i = -21;     //   $rtoi(-0.65328148*(2.0**(PILOT_BITS-1)));
           446:  p1i = -16;     //   $rtoi(-0.50000000*(2.0**(PILOT_BITS-1)));
           447:  p1i = -9;      //    $rtoi(-0.27059805*(2.0**(PILOT_BITS-1)));
           448:  p1i = 0;       //     $rtoi( 0.00000000*(2.0**(PILOT_BITS-1)));
           449:  p1i = 9;       //     $rtoi( 0.27059805*(2.0**(PILOT_BITS-1)));
           450:  p1i = 16;      //    $rtoi( 0.50000000*(2.0**(PILOT_BITS-1)));
           451:  p1i = 21;      //    $rtoi( 0.65328148*(2.0**(PILOT_BITS-1)));
           452:  p1i = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           453:  p1i = 21;      //    $rtoi( 0.65328148*(2.0**(PILOT_BITS-1)));
           454:  p1i = 16;      //    $rtoi( 0.50000000*(2.0**(PILOT_BITS-1)));
           455:  p1i = 9;       //     $rtoi( 0.27059805*(2.0**(PILOT_BITS-1)));
           456:  p1i = 0;       //     $rtoi( 0.00000000*(2.0**(PILOT_BITS-1)));
           457:  p1i = -12;     //   $rtoi(-0.38268343*(2.0**(PILOT_BITS-1)));
           458:  p1i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           459:  p1i = -30;     //   $rtoi(-0.92387953*(2.0**(PILOT_BITS-1)));
           460:  p1i = -31;     //   $rtoi(-0.93750000*(2.0**(PILOT_BITS-1)));
           461:  p1i = -31;     //   $rtoi(-0.96269242*(2.0**(PILOT_BITS-1)));
           462:  p1i = -28;     //   $rtoi(-0.86602540*(2.0**(PILOT_BITS-1)));
           463:  p1i = -24;     //   $rtoi(-0.75711512*(2.0**(PILOT_BITS-1)));
           464:  p1i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           465:  p1i = -24;     //   $rtoi(-0.75711512*(2.0**(PILOT_BITS-1)));
           466:  p1i = -28;     //   $rtoi(-0.86602540*(2.0**(PILOT_BITS-1)));
           467:  p1i = -31;     //   $rtoi(-0.96269242*(2.0**(PILOT_BITS-1)));
           468:  p1i = -31;     //   $rtoi(-0.93750000*(2.0**(PILOT_BITS-1)));
           469:  p1i = -30;     //   $rtoi(-0.92387953*(2.0**(PILOT_BITS-1)));
           470:  p1i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           471:  p1i = -12;     //   $rtoi(-0.38268343*(2.0**(PILOT_BITS-1)));
           472:  p1i = 0;       //     $rtoi( 0.00000000*(2.0**(PILOT_BITS-1)));
           473:  p1i = 9;       //     $rtoi( 0.27059805*(2.0**(PILOT_BITS-1)));
           474:  p1i = 16;      //    $rtoi( 0.50000000*(2.0**(PILOT_BITS-1)));
           475:  p1i = 21;      //    $rtoi( 0.65328148*(2.0**(PILOT_BITS-1)));
           476:  p1i = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           477:  p1i = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           478:  p1i = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           479:  p1i = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           480:  p1i = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           481:  p1i = 24;      //    $rtoi( 0.75711512*(2.0**(PILOT_BITS-1)));
           482:  p1i = 28;      //    $rtoi( 0.86602540*(2.0**(PILOT_BITS-1)));
           483:  p1i = 31;      //    $rtoi( 0.96269242*(2.0**(PILOT_BITS-1)));
           484:  p1i = 31;      //    $rtoi( 0.93750000*(2.0**(PILOT_BITS-1)));
           485:  p1i = 30;      //    $rtoi( 0.92387953*(2.0**(PILOT_BITS-1)));
           486:  p1i = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           487:  p1i = 12;      //    $rtoi( 0.38268343*(2.0**(PILOT_BITS-1)));
           488:  p1i = 0;       //     $rtoi( 0.00000000*(2.0**(PILOT_BITS-1)));
           489:  p1i = -9;      //    $rtoi(-0.27059805*(2.0**(PILOT_BITS-1)));
           490:  p1i = -16;     //   $rtoi(-0.50000000*(2.0**(PILOT_BITS-1)));
           491:  p1i = -21;     //   $rtoi(-0.65328148*(2.0**(PILOT_BITS-1)));
           492:  p1i = -23;     //   $rtoi(-0.70710678*(2.0**(PILOT_BITS-1)));
           493:  p1i = -21;     //   $rtoi(-0.65328148*(2.0**(PILOT_BITS-1)));
           494:  p1i = -16;     //   $rtoi(-0.50000000*(2.0**(PILOT_BITS-1)));
           495:  p1i = -9;      //    $rtoi(-0.27059805*(2.0**(PILOT_BITS-1)));
           496:  p1i = 0;       //     $rtoi( 0.00000000*(2.0**(PILOT_BITS-1)));
           497:  p1i = 12;      //    $rtoi( 0.38268343*(2.0**(PILOT_BITS-1)));
           498:  p1i = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           499:  p1i = 30;      //    $rtoi( 0.92387953*(2.0**(PILOT_BITS-1)));
           500:  p1i = 31;      //    $rtoi( 0.93750000*(2.0**(PILOT_BITS-1)));
           501:  p1i = 31;      //    $rtoi( 0.96269242*(2.0**(PILOT_BITS-1)));
           502:  p1i = 28;      //    $rtoi( 0.86602540*(2.0**(PILOT_BITS-1)));
           503:  p1i = 24;      //    $rtoi( 0.75711512*(2.0**(PILOT_BITS-1)));
           504:  p1i = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           505:  p1i = 24;      //    $rtoi( 0.75711512*(2.0**(PILOT_BITS-1)));
           506:  p1i = 28;      //    $rtoi( 0.86602540*(2.0**(PILOT_BITS-1)));
           507:  p1i = 31;      //    $rtoi( 0.96269242*(2.0**(PILOT_BITS-1)));
           508:  p1i = 31;      //    $rtoi( 0.93750000*(2.0**(PILOT_BITS-1)));
           509:  p1i = 30;      //    $rtoi( 0.92387953*(2.0**(PILOT_BITS-1)));
           510:  p1i = 23;      //    $rtoi( 0.70710678*(2.0**(PILOT_BITS-1)));
           511:  p1i = 12;      //    $rtoi( 0.38268343*(2.0**(PILOT_BITS-1)));
        endcase
    end


    reg         [2:0]               neState;
        `define NE_IDLE             3'b000
        `define NE_CAPTURE          3'b001
        `define NE_WAIT_ESTIMATES   3'b011
        `define NE_CALC_PILOT       3'b010
        `define NE_CALC_SNR         3'b110
        `define NE_PICK_BEST        3'b111
    reg         [2:0]               neRamState;
        `define NERAM_IDLE          3'b000
        `define NERAM_CAPTURE       3'b001
        `define NERAM_WAIT_DONE     3'b011


    // These are the stored values from the sample buffer
    reg signed  [SAMPLE_BITS-1:0]   iSampleBuf[0 : `PILOT_LENGTH_IN_SAMPLES-1];
    wire signed [SAMPLE_BITS-1:0]   iRounded = `ROUND(iIn,SAMPLE_BITS);
    reg signed  [SAMPLE_BITS-1:0]   qSampleBuf[0 : `PILOT_LENGTH_IN_SAMPLES-1];
    wire signed [SAMPLE_BITS-1:0]   qRounded = `ROUND(qIn,SAMPLE_BITS);
    reg         [$clog2(`PILOT_LENGTH_IN_SAMPLES)-1 : 0]   sampleCount;
    wire    signed  [SAMPLE_BITS-1:0]   iSamp,qSamp;
    assign  iSamp = iSampleBuf[sampleCount];
    assign  qSamp = qSampleBuf[sampleCount];


    reg         [6:0]               tau0,tau1;
    wire        [2:0]               tau0Offset = tau0[6:4] + {2'b0,tau0[3]};
    wire        [2:0]               tau1Offset = tau1[6:4] + {2'b0,tau1[3]};
    reg signed  [EST_BITS-1:0]      h0r,h0i,h1r,h1i;

    assign pilot0Address = sampleCount + tau0Offset - 1;
    assign pilot1Address = sampleCount + tau1Offset - 1;

    reg signed  [PILOT_BITS-1:0]   p0r0;
    reg signed  [PILOT_BITS-1:0]   p0r1;
    reg signed  [PILOT_BITS-1:0]   p0i0;
    reg signed  [PILOT_BITS-1:0]   p0i1;
    reg signed  [PILOT_BITS-1:0]   p1r0;
    reg signed  [PILOT_BITS-1:0]   p1r1;
    reg signed  [PILOT_BITS-1:0]   p1i0;
    reg signed  [PILOT_BITS-1:0]   p1i1;

    `ifdef SIMULATE
    real signalSumReal;
    real noiseSum0Real;
    real noiseSum1Real;
    real noiseSum2Real;
    `endif

    wire        [2*13-2:0] signalMagSquared;        // # of bits based on output of cordic
    reg  signed [33:0]     signalSquaredSum;        // # of bits based on log10Estimate module
    wire        [2*13-2:0] noise0MagSquared;        // # of bits based on output of cordic
    reg  signed [33:0]     noise0SquaredSum;        // # of bits based on log10Estimate module
    wire        [2*13-2:0] noise1MagSquared;        // # of bits based on output of cordic
    reg  signed [33:0]     noise1SquaredSum;        // # of bits based on log10Estimate module
    wire        [2*13-2:0] noise2MagSquared;        // # of bits based on output of cordic
    reg  signed [33:0]     noise2SquaredSum;        // # of bits based on log10Estimate module
    reg  signed [33:0]     noiseSquaredSum;         // # of bits based on log10Estimate module


    reg                             calcNoise;

    reg         [$clog2(`PILOT_LENGTH_IN_SAMPLES)-1 : 0]   sampleWriteCount;
    reg                                                    samplesCaptured;
    reg                                                    noiseEstimatesDone;
    always @(posedge clk186) begin
        if (reset) begin
            neRamState <= `NERAM_IDLE;
            samplesCaptured <= 0;
            sampleWriteCount <= 0;
        end
        else if (ce) begin
            case (neRamState)
                `NERAM_IDLE: begin
                    if (startIn) begin
                        neRamState <= `NERAM_CAPTURE;
                        sampleWriteCount <= 0;
                    end
                end
                `NERAM_CAPTURE: begin
                    if (validIn) begin
                        iSampleBuf[sampleWriteCount] <= iRounded;
                        qSampleBuf[sampleWriteCount] <= qRounded;
                        if (sampleWriteCount == `PILOT_LENGTH_IN_SAMPLES-1) begin
                            neRamState <= `NERAM_WAIT_DONE;
                            samplesCaptured <= 1;
                            sampleWriteCount <= 0;
                        end
                        else begin
                            sampleWriteCount <= sampleWriteCount + 1;
                        end
                    end
                end
                `NERAM_WAIT_DONE: begin
                    if (noiseEstimatesDone) begin
                        neRamState <= `NERAM_IDLE;
                        samplesCaptured <= 0;
                    end
                end
                default: begin
                    neRamState <= `NERAM_IDLE;
                    samplesCaptured <= 0;
                    sampleWriteCount <= 0;
                end
            endcase
        end
    end


    always @(posedge clk) begin
        if (reset) begin
            neState <= `NE_IDLE;
            sampleCount <= 0;
            calcNoise <= 0;
            noiseEstimatesDone <= 0;
        end
        else if (ce) begin
            case (neState)
                `NE_IDLE: begin
                    noiseEstimatesDone <= 0;
                    if (samplesCaptured) begin
                        neState <= `NE_WAIT_ESTIMATES;
                        sampleCount <= 0;
                    end
                end
                `NE_WAIT_ESTIMATES: begin
                    if (channelEstimatesDone) begin
                        neState <= `NE_CALC_PILOT;
                        tau0 <= tau0Estimate;
                        h0r <= `ROUND(h0RealEstimate,EST_BITS);
                        h0i <= `ROUND(h0ImagEstimate,EST_BITS);
                        tau1 <= tau1Estimate;
                        h1r <= `ROUND(h1RealEstimate,EST_BITS);
                        h1i <= `ROUND(h1ImagEstimate,EST_BITS);
                        `ifdef SIMULATE
                        signalSumReal <= 0.0;
                        noiseSum0Real <= 0.0;
                        noiseSum1Real <= 0.0;
                        noiseSum2Real <= 0.0;
                        `endif
                        signalSquaredSum <= 0;
                        noise0SquaredSum <= 0;
                        noise1SquaredSum <= 0;
                        noise2SquaredSum <= 0;
                        calcNoise <= 1;
                    end
                    else begin
                        // Preload the pilot sample fifos
                        if (sampleCount < 8) begin
                            p0r0 <= p0r;
                            p0i0 <= p0i;
                            p0r1 <= p0r0;
                            p0i1 <= p0i0;
                            p1r0 <= p1r;
                            p1i0 <= p1i;
                            p1r1 <= p1r0;
                            p1i1 <= p1i0;
                            sampleCount <= sampleCount + 1;
                        end
                    end
                end
                `NE_CALC_PILOT: begin
                    p0r0 <= p0r;
                    p0i0 <= p0i;
                    p0r1 <= p0r0;
                    p0i1 <= p0i0;
                    p1r0 <= p1r;
                    p1i0 <= p1i;
                    p1r1 <= p1r0;
                    p1i1 <= p1i0;
                    `ifdef SIMULATE
                    signalSumReal <= signalSumReal
                               + (1.44**2.0)*$itor(iSamp)/(2.0**(SAMPLE_BITS-1))*$itor(iSamp)/(2.0**(SAMPLE_BITS-1))
                               + (1.44**2.0)*$itor(qSamp)/(2.0**(SAMPLE_BITS-1))*$itor(qSamp)/(2.0**(SAMPLE_BITS-1));
                    //signalSumReal <= $itor(iSamp)/(2.0**SAMPLE_BITS-1);
                    //signalSumReal <= $itor(iSamp)/(2.0**(SAMPLE_BITS-1));
                    noiseSum0Real <= noiseSum0Real
                               + (1.44**2.0)*$itor(iNoise0)/(2.0**(SAMPLE_BITS-1))*$itor(iNoise0)/(2.0**(SAMPLE_BITS-1))
                               + (1.44**2.0)*$itor(qNoise0)/(2.0**(SAMPLE_BITS-1))*$itor(qNoise0)/(2.0**(SAMPLE_BITS-1));
                    noiseSum1Real <= noiseSum1Real
                               + (1.44**2.0)*$itor(iNoise1)/(2.0**(SAMPLE_BITS-1))*$itor(iNoise1)/(2.0**(SAMPLE_BITS-1))
                               + (1.44**2.0)*$itor(qNoise1)/(2.0**(SAMPLE_BITS-1))*$itor(qNoise1)/(2.0**(SAMPLE_BITS-1));
                    noiseSum2Real <= noiseSum2Real
                               + (1.44**2.0)*$itor(iNoise2)/(2.0**(SAMPLE_BITS-1))*$itor(iNoise2)/(2.0**(SAMPLE_BITS-1))
                               + (1.44**2.0)*$itor(qNoise2)/(2.0**(SAMPLE_BITS-1))*$itor(qNoise2)/(2.0**(SAMPLE_BITS-1));
                    `endif
                    if (magsValid) begin
                        signalSquaredSum <= signalSquaredSum + signalMagSquared;
                        noise0SquaredSum <= noise0SquaredSum + noise0MagSquared;
                        noise1SquaredSum <= noise1SquaredSum + noise1MagSquared;
                        noise2SquaredSum <= noise2SquaredSum + noise2MagSquared;
                    end
                    if (sampleCount < `PILOT_LENGTH_IN_SAMPLES-8-1) begin
                        sampleCount <= sampleCount + 1;
                    end
                    else begin
                        neState <= `NE_CALC_SNR;
                        calcNoise <= 0;
                        sampleCount <= 0;
                    end
                end
                `NE_CALC_SNR: begin
                    // Are all the magnitudes processed?
                    if (magsValid) begin
                        signalSquaredSum <= signalSquaredSum + signalMagSquared;
                        noise0SquaredSum <= noise0SquaredSum + noise0MagSquared;
                        noise1SquaredSum <= noise1SquaredSum + noise1MagSquared;
                        noise2SquaredSum <= noise2SquaredSum + noise2MagSquared;
                    end
                    else begin
                        neState <= `NE_PICK_BEST;
                    end
                end
                `NE_PICK_BEST: begin
                    neState <= `NE_IDLE;
                    noiseEstimatesDone <= 1;
                    if ( (noise0SquaredSum < noise1SquaredSum)
                      && (noise0SquaredSum < noise2SquaredSum)) begin
                        noiseSquaredSum <= noise0SquaredSum;
                    end
                    else if ( (noise1SquaredSum < noise0SquaredSum)
                           && (noise1SquaredSum < noise2SquaredSum)) begin
                        noiseSquaredSum <= noise1SquaredSum;
                    end
                    else begin
                        noiseSquaredSum <= noise2SquaredSum;
                    end
                end
                default: begin
                    neState <= `NE_IDLE;
                    sampleCount <= 0;
                    calcNoise <= 0;
                    noiseEstimatesDone <= 0;
                end
            endcase
        end
    end

    // Use the channel estimates to re-create a noise-free version of the received pilot
    reg     signed  [SAMPLE_BITS-1:0]   iSamp0,qSamp0;
    reg     signed  [`MPY_BITS-1:0] iPilot0,qPilot0;
    reg     signed  [`MPY_BITS-1:0] iPilot1,qPilot1;
    reg     signed  [`MPY_BITS-1:0] iPilot2,qPilot2;
    reg                             pilotsValid;
    always @(posedge clk) begin
        if (ce) begin
            pilotsValid <= calcNoise;
            iSamp0 <= iSamp;
            qSamp0 <= qSamp;
            iPilot0 <= p0r*h0r - p0i*h0i
                     + p1r*h1r - p1i*h1i;
            qPilot0 <= p0r*h0i + p0i*h0r
                     + p1r*h1i + p1i*h1r;
            iPilot1 <= p0r0*h0r - p0i0*h0i
                     + p1r0*h1r - p1i0*h1i;
            qPilot1 <= p0r0*h0i + p0i0*h0r
                     + p1r0*h1i + p1i0*h1r;
            iPilot2 <= p0r1*h0r - p0i1*h0i
                     + p1r1*h1r - p1i1*h1i;
            qPilot2 <= p0r1*h0i + p0i1*h0r
                     + p1r1*h1i + p1i1*h1r;
        end
    end

    reg  signed  [SAMPLE_BITS-1:0]   iSamp1,qSamp1;
    reg  signed [SAMPLE_BITS-1:0] iNoise0;
    reg  signed [SAMPLE_BITS-1:0] iNoise1;
    reg  signed [SAMPLE_BITS-1:0] iNoise2;
    reg  signed [SAMPLE_BITS-1:0] qNoise0;
    reg  signed [SAMPLE_BITS-1:0] qNoise1;
    reg  signed [SAMPLE_BITS-1:0] qNoise2;
    reg                           noiseValid;
    always @(posedge clk) begin
        if (ce) begin
            noiseValid <= pilotsValid;
            iSamp1 <= iSamp0;
            qSamp1 <= qSamp0;
            iNoise0 <= iSamp0 - $signed(iPilot0[`MPY_BITS-2:`MPY_BITS-2-(SAMPLE_BITS-1)]);
            iNoise1 <= iSamp0 - $signed(iPilot1[`MPY_BITS-2:`MPY_BITS-2-(SAMPLE_BITS-1)]);
            iNoise2 <= iSamp0 - $signed(iPilot2[`MPY_BITS-2:`MPY_BITS-2-(SAMPLE_BITS-1)]);
            qNoise0 <= qSamp0 - $signed(qPilot0[`MPY_BITS-2:`MPY_BITS-2-(SAMPLE_BITS-1)]);
            qNoise1 <= qSamp0 - $signed(qPilot1[`MPY_BITS-2:`MPY_BITS-2-(SAMPLE_BITS-1)]);
            qNoise2 <= qSamp0 - $signed(qPilot2[`MPY_BITS-2:`MPY_BITS-2-(SAMPLE_BITS-1)]);
        end
    end

    wire        [12:0]  signalMag;
    vm_cordic_fast magS(
        .clk(clk),
        .ena(ce & noiseValid),
        .x({iSamp1,{14 - SAMPLE_BITS{1'b0}}}),.y({qSamp1,{14 - SAMPLE_BITS{1'b0}}}),
        .m(signalMag),
        .p(),
        .enOut(magsValid)
    );
    assign  signalMagSquared = signalMag*signalMag;

    wire        [12:0]  noiseMag0;
    vm_cordic_fast magN0(
        .clk(clk),
        .ena(ce & noiseValid),
        .x({iNoise0,{14 - SAMPLE_BITS{1'b0}}}),.y({qNoise0,{14 - SAMPLE_BITS{1'b0}}}),
        .m(noiseMag0),
        .p(),
        .enOut()
    );
    assign  noise0MagSquared = noiseMag0*noiseMag0;

    wire        [12:0]  noiseMag1;
    vm_cordic_fast magN1(
        .clk(clk),
        .ena(ce & noiseValid),
        .x({iNoise1,{14 - SAMPLE_BITS{1'b0}}}),.y({qNoise1,{14 - SAMPLE_BITS{1'b0}}}),
        .m(noiseMag1),
        .p(),
        .enOut()
    );
    assign  noise1MagSquared = noiseMag1*noiseMag1;

    wire        [12:0]  noiseMag2;
    vm_cordic_fast magN2(
        .clk(clk),
        .ena(ce & noiseValid),
        .x({iNoise2,{14 - SAMPLE_BITS{1'b0}}}),.y({qNoise2,{14 - SAMPLE_BITS{1'b0}}}),
        .m(noiseMag2),
        .p(),
        .enOut()
    );
    assign  noise2MagSquared = noiseMag2*noiseMag2;



    // Take logarithm of  the signal power and noise power
    wire signed [LOG_BITS-1:0]  log10Noise;
    log10Estimate logNoise
    (
        .clk(clk),
        .outputClkEn(ce),
        .linearValue({4'b0,noiseSquaredSum[33:4]}),
        .log10Estimate(log10Noise)
    );
    wire signed [LOG_BITS-1:0]  log10Signal;
    log10Estimate logSignal
    (
        .clk(clk),
        .outputClkEn(ce),
        .linearValue({4'b0,signalSquaredSum[33:4]}),
        .log10Estimate(log10Signal)
    );

    assign log10MSE = (log10Noise - log10Signal);
    always @(posedge clk) begin
        log10MseEnable <= noiseEstimatesDone;
    end


endmodule
