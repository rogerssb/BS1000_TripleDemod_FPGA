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
    input [17:0] epoch,
    input [17:0] polyTaps,
    input [17:0] restartCount,
    input [17:0] iOutTaps,  
    input [17:0] qOutTaps,
    output iOut,
    output qOut,
    output goldOut,
    output codeEpoch
    );
/*
This code generator works in two basic modes: single LFSR and Gold Code. In single
LFSR mode, the one LFSR will generate two outputs with phases determined by the two
output tap values, iOutTaps and qOutTaps. In Gold Code mode, one polynomial is 
determined by polyTaps and the second by qOutTaps. The initial value of the second
LFSR is set by iOutTaps.
*/


// Figure out a mask from the taps
reg     [17:0]  mask;
always @* begin
    casex(polyTaps) 
        18'b1x_xxxx_xxxx_xxxx_xxxx: mask = 18'h3ffff;
        18'b01_xxxx_xxxx_xxxx_xxxx: mask = 18'h1ffff;
        18'b00_1xxx_xxxx_xxxx_xxxx: mask = 18'h0ffff;
        18'b00_01xx_xxxx_xxxx_xxxx: mask = 18'h07fff;
        18'b00_001x_xxxx_xxxx_xxxx: mask = 18'h03fff;
        18'b00_0001_xxxx_xxxx_xxxx: mask = 18'h01fff;
        18'b00_0000_1xxx_xxxx_xxxx: mask = 18'h00fff;
        18'b00_0000_01xx_xxxx_xxxx: mask = 18'h007ff;
        18'b00_0000_001x_xxxx_xxxx: mask = 18'h003ff;
        18'b00_0000_0001_xxxx_xxxx: mask = 18'h001ff;
        18'b00_0000_0000_1xxx_xxxx: mask = 18'h000ff;
        18'b00_0000_0000_01xx_xxxx: mask = 18'h0007f;
        18'b00_0000_0000_001x_xxxx: mask = 18'h0003f;
        18'b00_0000_0000_0001_xxxx: mask = 18'h0001f;
        18'b00_0000_0000_0000_1xxx: mask = 18'h0000f;
        18'b00_0000_0000_0000_01xx: mask = 18'h00007;
        18'b00_0000_0000_0000_001x: mask = 18'h00003;
        18'b00_0000_0000_0000_0001: mask = 18'h00001;
        default:                    mask = 18'h0;
    endcase
end

// Code Generator(s)
reg     [17:0]  code, secCode;
reg     [17:0]  restartCounter;
wire            restart = (restartCounter == 0);
wire            sum, secSum;
reg             codeEpoch_reg;
assign          codeEpoch = codeEpoch_reg;
always @ (posedge clk) begin
    if (reset) begin
        code <= init;
        secCode <= iOutTaps;
        restartCounter <= restartCount;
        end
    else if (clkEn) begin
        if (restart) begin
            restartCounter <= restartCount;
            code <= init;
            secCode <= iOutTaps;
            end
        else begin
            code <= {code[16:0],sum};
            secCode <= {secCode[16:0],secSum};
            restartCounter <= restartCounter - 1;
            end

        // Find the epoch
        codeEpoch_reg <= ((code & mask) == epoch);
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

reg iOut_reg;
always @(posedge clk) begin
    if (clkEn) begin
        iOut_reg <= iOutSum3[1] ^ iOutSum3[0]; 
    end
end
assign iOut = iOut_reg;



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



// Gold Code Sum
wire [8:0] secSum1 =
    {
    (secCode[17] & qOutTaps[17]) ^ (secCode[16] & qOutTaps[16]),
    (secCode[15] & qOutTaps[15]) ^ (secCode[14] & qOutTaps[14]),
    (secCode[13] & qOutTaps[13]) ^ (secCode[12] & qOutTaps[12]),
    (secCode[11] & qOutTaps[11]) ^ (secCode[10] & qOutTaps[10]),
    (secCode[9] & qOutTaps[9]) ^ (secCode[8] & qOutTaps[8]),
    (secCode[7] & qOutTaps[7]) ^ (secCode[6] & qOutTaps[6]),
    (secCode[5] & qOutTaps[5]) ^ (secCode[4] & qOutTaps[4]),
    (secCode[3] & qOutTaps[3]) ^ (secCode[2] & qOutTaps[2]),
    (secCode[1] & qOutTaps[1]) ^ (secCode[0] & qOutTaps[0])
    };

wire [3:0] secSum2 =
    {
    secSum1[8] ^ secSum1[7] ^ secSum1[6],
    secSum1[5] ^ secSum1[4],
    secSum1[3] ^ secSum1[2],
    secSum1[1] ^ secSum1[0]
    };

wire [1:0] secSum3 =
    {
    secSum2[3] ^ secSum2[2],
    secSum2[1] ^ secSum2[0]
    };

assign secSum = secSum3[1] ^ secSum3[0];


reg qOut_reg;
always @(posedge clk) begin
    if (clkEn) begin
        qOut_reg <= qOutSum3[1] ^ qOutSum3[0]; 
    end
end
assign qOut = qOut_reg;


reg goldOut_reg;
always @(posedge clk) begin
    if (clkEn) begin
        goldOut_reg <= code[17] ^ secCode[17]; 
    end
end
assign goldOut = goldOut_reg;




endmodule