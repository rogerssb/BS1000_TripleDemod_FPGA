/////////////////////////////////////////////////////
// codes_gen
// despreader codes generator
/////////////////////////////////////////////////////

`timescale 1ns / 10 ps
`include ".\addressMap.v"

module codes_gen (
    input clk,
    input clkEn,
    input reset,
    input [17:0] init,
    input [17:0] polyTaps,
    input [17:0] restartCount,
    input [17:0] iOutTaps,  
    input [17:0] qOutTaps,
    output iOut,
    output qOut
    );

// Extend the ld pulse

// Code Generator
reg     [17:0]  code;
reg     [17:0]  restartCounter;
wire            restart = (restartCounter == 0);
wire            sum;
always @ (posedge clk) begin
    if (reset) begin
        code <= init;
        restartCounter <= restartCount;
        end
    else if (clkEn) begin
        if (restart) begin
            restartCounter <= restartCount;
            code <= init;
            end
        else begin
            code <= {code[16:0],sum};
            restartCounter <= restartCounter - 1;
            end
        end
    end

wire [8:0] sums1 =
    {
    (code[17] & polyTaps[17]) ^ (code[16] & polyTaps[16]),
    (code[15] & polyTaps[15]) ^ (code[14] & polyTaps[14]),
    (code[13] & polyTaps[13]) ^ (code[12] & polyTaps[12]),
    (code[11] & polyTaps[11]) ^ (code[10] & polyTaps[10]),
    (code[9] & polyTaps[9]) ^ (code[8] & polyTaps[8]),
    (code[7] & polyTaps[7]) ^ (code[6] & polyTaps[6]),
    (code[5] & polyTaps[5]) ^ (code[4] & polyTaps[4]),
    (code[3] & polyTaps[3]) ^ (code[2] & polyTaps[2]),
    (code[1] & polyTaps[1]) ^ (code[0] & polyTaps[0])
    };

wire [3:0] sums2 =
    {
    sums1[8] ^ sums1[7] ^ sums1[6],
    sums1[5] ^ sums1[4],
    sums1[3] ^ sums1[2],
    sums1[1] ^ sums1[0]
    };

wire [1:0] sums3 =
    {
    sums2[3] ^ sums2[2],
    sums2[1] ^ sums2[0]
    };

assign sum = sums3[1] ^ sums3[0];



wire [8:0] iOutSum1 =
    {
    (code[17] & iOutTaps[17]) ^ (code[16] & iOutTaps[16]),
    (code[15] & iOutTaps[15]) ^ (code[14] & iOutTaps[14]),
    (code[13] & iOutTaps[13]) ^ (code[12] & iOutTaps[12]),
    (code[11] & iOutTaps[11]) ^ (code[10] & iOutTaps[10]),
    (code[9] & iOutTaps[9]) ^ (code[8] & iOutTaps[8]),
    (code[7] & iOutTaps[7]) ^ (code[6] & iOutTaps[6]),
    (code[5] & iOutTaps[5]) ^ (code[4] & iOutTaps[4]),
    (code[3] & iOutTaps[3]) ^ (code[2] & iOutTaps[2]),
    (code[1] & iOutTaps[1]) ^ (code[0] & iOutTaps[0])
    };

wire [3:0] iOutSum2 =
    {
    iOutSum1[8] ^ iOutSum1[7] ^ iOutSum1[6],
    iOutSum1[5] ^ iOutSum1[4],
    iOutSum1[3] ^ iOutSum1[2],
    iOutSum1[1] ^ iOutSum1[0]
    };

wire [1:0] iOutSum3 =
    {
    iOutSum2[3] ^ iOutSum2[2],
    iOutSum2[1] ^ iOutSum2[0]
    };

assign iOut = iOutSum3[1] ^ iOutSum3[0];



wire [8:0] qOutSum1 =
    {
    (code[17] & qOutTaps[17]) ^ (code[16] & qOutTaps[16]),
    (code[15] & qOutTaps[15]) ^ (code[14] & qOutTaps[14]),
    (code[13] & qOutTaps[13]) ^ (code[12] & qOutTaps[12]),
    (code[11] & qOutTaps[11]) ^ (code[10] & qOutTaps[10]),
    (code[9] & qOutTaps[9]) ^ (code[8] & qOutTaps[8]),
    (code[7] & qOutTaps[7]) ^ (code[6] & qOutTaps[6]),
    (code[5] & qOutTaps[5]) ^ (code[4] & qOutTaps[4]),
    (code[3] & qOutTaps[3]) ^ (code[2] & qOutTaps[2]),
    (code[1] & qOutTaps[1]) ^ (code[0] & qOutTaps[0])
    };

wire [3:0] qOutSum2 =
    {
    qOutSum1[8] ^ qOutSum1[7] ^ qOutSum1[6],
    qOutSum1[5] ^ qOutSum1[4],
    qOutSum1[3] ^ qOutSum1[2],
    qOutSum1[1] ^ qOutSum1[0]
    };

wire [1:0] qOutSum3 =
    {
    qOutSum2[3] ^ qOutSum2[2],
    qOutSum2[1] ^ qOutSum2[0]
    };

assign qOut = qOutSum3[1] ^ qOutSum3[0];



endmodule