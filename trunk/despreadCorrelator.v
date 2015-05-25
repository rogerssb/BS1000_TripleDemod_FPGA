module despreadCorrelator(
    clk,
    clkEn,
    reset,
    onTime,
    slip,
    codeBit,
    rx,
    corrLength,
    despread,
    syncCount
    );

parameter CorrLength = 64;
parameter CorrBits = 11;
parameter InputBits = 6;

input   clk;
input   clkEn;
input   reset;
input   onTime;
input   slip;
input   codeBit;
input   [InputBits-1:0] rx;
input   [3:0]           corrLength;
output  [17:0]          despread;
output  [5:0]           syncCount;
//inout   [35:0]  CHIPSCOPE_BUS;

`ifdef SIMULATE
real rxReal;
always @* rxReal = $itor($signed(rx))/(2**(InputBits-1));
`endif

// Convert the length to a mask
    reg     [15:0]  mask;
    always @* begin
        case (corrLength)
            0:  mask <= 16'h0001;
            1:  mask <= 16'h0003;
            2:  mask <= 16'h0007;
            3:  mask <= 16'h000f;
            4:  mask <= 16'h001f;
            5:  mask <= 16'h003f;
            6:  mask <= 16'h007f;
            7:  mask <= 16'h00ff;
            8:  mask <= 16'h01ff;
            9:  mask <= 16'h03ff;
           10:  mask <= 16'h07ff;
           11:  mask <= 16'h0fff;
           12:  mask <= 16'h1fff;
           13:  mask <= 16'h3fff;
           14:  mask <= 16'h7fff;
           15:  mask <= 16'hffff;
           default: mask <= 0;
        endcase
    end

// Create the onTime correlation shift register
    reg     [InputBits-1:0]     rxSR[CorrLength-1:0];
    reg     [CorrLength-1:0]    codeSR;
    integer         i;
    always @(posedge clk) begin
        if (reset) begin
            codeSR <= 1;
        end
        else if (clkEn) begin
            if (onTime) begin
                rxSR[0] <= rx;
                for (i = 0; i < CorrLength-1; i = i + 1) begin
                    rxSR[i+1] <= rxSR[i];
                end
                if (!slip) begin
                    codeSR <= {codeSR[CorrLength-2:0],codeBit};
                end
            end
        end
    end

`ifdef SIMULATE
real rxSRReal;
always @* rxSRReal = $itor($signed(rxSR[0]))/(2**(InputBits-1));
`endif


    reg     [CorrBits-1:0]  sum0,sum1,sum2,sum3,sum4,sum5,sum6,sum7;
    reg     [CorrBits-1:0]  sum8,sum9,sum10,sum11,sum12,sum13,sum14,sum15;
    reg     [CorrBits-1:0]  sum16,sum17,sum18,sum19,sum20,sum21,sum22,sum23;
    reg     [CorrBits-1:0]  sum24,sum25,sum26,sum27,sum28,sum29,sum30,sum31;
    reg     [CorrBits-1:0]  sum32,sum33,sum34,sum35,sum36,sum37,sum38,sum39;
    reg     [CorrBits-1:0]  sum40,sum41,sum42,sum43,sum44,sum45,sum46,sum47;
    reg     [CorrBits-1:0]  sum48,sum49,sum50,sum51,sum52,sum53,sum54,sum55;
    reg     [CorrBits-1:0]  sum56,sum57,sum58,sum59,sum60,sum61,sum62,sum63;
    always @(posedge clk) begin
        if (clkEn & !onTime) begin
            sum0 <= codeSR[0] ? (-{{(CorrBits-InputBits){rxSR[0][InputBits-1]}},rxSR[0]}) : {{(CorrBits-InputBits){rxSR[0][InputBits-1]}},rxSR[0]};
            sum1 <= codeSR[1] ? (-{{(CorrBits-InputBits){rxSR[1][InputBits-1]}},rxSR[1]}) : {{(CorrBits-InputBits){rxSR[1][InputBits-1]}},rxSR[1]};
            sum2 <= codeSR[2] ? (-{{(CorrBits-InputBits){rxSR[2][InputBits-1]}},rxSR[2]}) : {{(CorrBits-InputBits){rxSR[2][InputBits-1]}},rxSR[2]};
            sum3 <= codeSR[3] ? (-{{(CorrBits-InputBits){rxSR[3][InputBits-1]}},rxSR[3]}) : {{(CorrBits-InputBits){rxSR[3][InputBits-1]}},rxSR[3]};
            sum4 <= codeSR[4] ? (-{{(CorrBits-InputBits){rxSR[4][InputBits-1]}},rxSR[4]}) : {{(CorrBits-InputBits){rxSR[4][InputBits-1]}},rxSR[4]};
            sum5 <= codeSR[5] ? (-{{(CorrBits-InputBits){rxSR[5][InputBits-1]}},rxSR[5]}) : {{(CorrBits-InputBits){rxSR[5][InputBits-1]}},rxSR[5]};
            sum6 <= codeSR[6] ? (-{{(CorrBits-InputBits){rxSR[6][InputBits-1]}},rxSR[6]}) : {{(CorrBits-InputBits){rxSR[6][InputBits-1]}},rxSR[6]};
            sum7 <= codeSR[7] ? (-{{(CorrBits-InputBits){rxSR[7][InputBits-1]}},rxSR[7]}) : {{(CorrBits-InputBits){rxSR[7][InputBits-1]}},rxSR[7]};
            sum8 <= codeSR[8] ? (-{{(CorrBits-InputBits){rxSR[8][InputBits-1]}},rxSR[8]}) : {{(CorrBits-InputBits){rxSR[8][InputBits-1]}},rxSR[8]};
            sum9 <= codeSR[9] ? (-{{(CorrBits-InputBits){rxSR[9][InputBits-1]}},rxSR[9]}) : {{(CorrBits-InputBits){rxSR[9][InputBits-1]}},rxSR[9]};
            sum10 <= codeSR[10] ? (-{{(CorrBits-InputBits){rxSR[10][InputBits-1]}},rxSR[10]}) : {{(CorrBits-InputBits){rxSR[10][InputBits-1]}},rxSR[10]};
            sum11 <= codeSR[11] ? (-{{(CorrBits-InputBits){rxSR[11][InputBits-1]}},rxSR[11]}) : {{(CorrBits-InputBits){rxSR[11][InputBits-1]}},rxSR[11]};
            sum12 <= codeSR[12] ? (-{{(CorrBits-InputBits){rxSR[12][InputBits-1]}},rxSR[12]}) : {{(CorrBits-InputBits){rxSR[12][InputBits-1]}},rxSR[12]};
            sum13 <= codeSR[13] ? (-{{(CorrBits-InputBits){rxSR[13][InputBits-1]}},rxSR[13]}) : {{(CorrBits-InputBits){rxSR[13][InputBits-1]}},rxSR[13]};
            sum14 <= codeSR[14] ? (-{{(CorrBits-InputBits){rxSR[14][InputBits-1]}},rxSR[14]}) : {{(CorrBits-InputBits){rxSR[14][InputBits-1]}},rxSR[14]};
            sum15 <= codeSR[15] ? (-{{(CorrBits-InputBits){rxSR[15][InputBits-1]}},rxSR[15]}) : {{(CorrBits-InputBits){rxSR[15][InputBits-1]}},rxSR[15]};
            sum16 <= codeSR[16] ? (-{{(CorrBits-InputBits){rxSR[16][InputBits-1]}},rxSR[16]}) : {{(CorrBits-InputBits){rxSR[16][InputBits-1]}},rxSR[16]};
            sum17 <= codeSR[17] ? (-{{(CorrBits-InputBits){rxSR[17][InputBits-1]}},rxSR[17]}) : {{(CorrBits-InputBits){rxSR[17][InputBits-1]}},rxSR[17]};
            sum18 <= codeSR[18] ? (-{{(CorrBits-InputBits){rxSR[18][InputBits-1]}},rxSR[18]}) : {{(CorrBits-InputBits){rxSR[18][InputBits-1]}},rxSR[18]};
            sum19 <= codeSR[19] ? (-{{(CorrBits-InputBits){rxSR[19][InputBits-1]}},rxSR[19]}) : {{(CorrBits-InputBits){rxSR[19][InputBits-1]}},rxSR[19]};
            sum20 <= codeSR[20] ? (-{{(CorrBits-InputBits){rxSR[20][InputBits-1]}},rxSR[20]}) : {{(CorrBits-InputBits){rxSR[20][InputBits-1]}},rxSR[20]};
            sum21 <= codeSR[21] ? (-{{(CorrBits-InputBits){rxSR[21][InputBits-1]}},rxSR[21]}) : {{(CorrBits-InputBits){rxSR[21][InputBits-1]}},rxSR[21]};
            sum22 <= codeSR[22] ? (-{{(CorrBits-InputBits){rxSR[22][InputBits-1]}},rxSR[22]}) : {{(CorrBits-InputBits){rxSR[22][InputBits-1]}},rxSR[22]};
            sum23 <= codeSR[23] ? (-{{(CorrBits-InputBits){rxSR[23][InputBits-1]}},rxSR[23]}) : {{(CorrBits-InputBits){rxSR[23][InputBits-1]}},rxSR[23]};
            sum24 <= codeSR[24] ? (-{{(CorrBits-InputBits){rxSR[24][InputBits-1]}},rxSR[24]}) : {{(CorrBits-InputBits){rxSR[24][InputBits-1]}},rxSR[24]};
            sum25 <= codeSR[25] ? (-{{(CorrBits-InputBits){rxSR[25][InputBits-1]}},rxSR[25]}) : {{(CorrBits-InputBits){rxSR[25][InputBits-1]}},rxSR[25]};
            sum26 <= codeSR[26] ? (-{{(CorrBits-InputBits){rxSR[26][InputBits-1]}},rxSR[26]}) : {{(CorrBits-InputBits){rxSR[26][InputBits-1]}},rxSR[26]};
            sum27 <= codeSR[27] ? (-{{(CorrBits-InputBits){rxSR[27][InputBits-1]}},rxSR[27]}) : {{(CorrBits-InputBits){rxSR[27][InputBits-1]}},rxSR[27]};
            sum28 <= codeSR[28] ? (-{{(CorrBits-InputBits){rxSR[28][InputBits-1]}},rxSR[28]}) : {{(CorrBits-InputBits){rxSR[28][InputBits-1]}},rxSR[28]};
            sum29 <= codeSR[29] ? (-{{(CorrBits-InputBits){rxSR[29][InputBits-1]}},rxSR[29]}) : {{(CorrBits-InputBits){rxSR[29][InputBits-1]}},rxSR[29]};
            sum30 <= codeSR[30] ? (-{{(CorrBits-InputBits){rxSR[30][InputBits-1]}},rxSR[30]}) : {{(CorrBits-InputBits){rxSR[30][InputBits-1]}},rxSR[30]};
            sum31 <= codeSR[31] ? (-{{(CorrBits-InputBits){rxSR[31][InputBits-1]}},rxSR[31]}) : {{(CorrBits-InputBits){rxSR[31][InputBits-1]}},rxSR[31]};
            sum32 <= codeSR[32] ? (-{{(CorrBits-InputBits){rxSR[32][InputBits-1]}},rxSR[32]}) : {{(CorrBits-InputBits){rxSR[32][InputBits-1]}},rxSR[32]};
            sum33 <= codeSR[33] ? (-{{(CorrBits-InputBits){rxSR[33][InputBits-1]}},rxSR[33]}) : {{(CorrBits-InputBits){rxSR[33][InputBits-1]}},rxSR[33]};
            sum34 <= codeSR[34] ? (-{{(CorrBits-InputBits){rxSR[34][InputBits-1]}},rxSR[34]}) : {{(CorrBits-InputBits){rxSR[34][InputBits-1]}},rxSR[34]};
            sum35 <= codeSR[35] ? (-{{(CorrBits-InputBits){rxSR[35][InputBits-1]}},rxSR[35]}) : {{(CorrBits-InputBits){rxSR[35][InputBits-1]}},rxSR[35]};
            sum36 <= codeSR[36] ? (-{{(CorrBits-InputBits){rxSR[36][InputBits-1]}},rxSR[36]}) : {{(CorrBits-InputBits){rxSR[36][InputBits-1]}},rxSR[36]};
            sum37 <= codeSR[37] ? (-{{(CorrBits-InputBits){rxSR[37][InputBits-1]}},rxSR[37]}) : {{(CorrBits-InputBits){rxSR[37][InputBits-1]}},rxSR[37]};
            sum38 <= codeSR[38] ? (-{{(CorrBits-InputBits){rxSR[38][InputBits-1]}},rxSR[38]}) : {{(CorrBits-InputBits){rxSR[38][InputBits-1]}},rxSR[38]};
            sum39 <= codeSR[39] ? (-{{(CorrBits-InputBits){rxSR[39][InputBits-1]}},rxSR[39]}) : {{(CorrBits-InputBits){rxSR[39][InputBits-1]}},rxSR[39]};
            sum40 <= codeSR[40] ? (-{{(CorrBits-InputBits){rxSR[40][InputBits-1]}},rxSR[40]}) : {{(CorrBits-InputBits){rxSR[40][InputBits-1]}},rxSR[40]};
            sum41 <= codeSR[41] ? (-{{(CorrBits-InputBits){rxSR[41][InputBits-1]}},rxSR[41]}) : {{(CorrBits-InputBits){rxSR[41][InputBits-1]}},rxSR[41]};
            sum42 <= codeSR[42] ? (-{{(CorrBits-InputBits){rxSR[42][InputBits-1]}},rxSR[42]}) : {{(CorrBits-InputBits){rxSR[42][InputBits-1]}},rxSR[42]};
            sum43 <= codeSR[43] ? (-{{(CorrBits-InputBits){rxSR[43][InputBits-1]}},rxSR[43]}) : {{(CorrBits-InputBits){rxSR[43][InputBits-1]}},rxSR[43]};
            sum44 <= codeSR[44] ? (-{{(CorrBits-InputBits){rxSR[44][InputBits-1]}},rxSR[44]}) : {{(CorrBits-InputBits){rxSR[44][InputBits-1]}},rxSR[44]};
            sum45 <= codeSR[45] ? (-{{(CorrBits-InputBits){rxSR[45][InputBits-1]}},rxSR[45]}) : {{(CorrBits-InputBits){rxSR[45][InputBits-1]}},rxSR[45]};
            sum46 <= codeSR[46] ? (-{{(CorrBits-InputBits){rxSR[46][InputBits-1]}},rxSR[46]}) : {{(CorrBits-InputBits){rxSR[46][InputBits-1]}},rxSR[46]};
            sum47 <= codeSR[47] ? (-{{(CorrBits-InputBits){rxSR[47][InputBits-1]}},rxSR[47]}) : {{(CorrBits-InputBits){rxSR[47][InputBits-1]}},rxSR[47]};
            sum48 <= codeSR[48] ? (-{{(CorrBits-InputBits){rxSR[48][InputBits-1]}},rxSR[48]}) : {{(CorrBits-InputBits){rxSR[48][InputBits-1]}},rxSR[48]};
            sum49 <= codeSR[49] ? (-{{(CorrBits-InputBits){rxSR[49][InputBits-1]}},rxSR[49]}) : {{(CorrBits-InputBits){rxSR[49][InputBits-1]}},rxSR[49]};
            sum50 <= codeSR[50] ? (-{{(CorrBits-InputBits){rxSR[50][InputBits-1]}},rxSR[50]}) : {{(CorrBits-InputBits){rxSR[50][InputBits-1]}},rxSR[50]};
            sum51 <= codeSR[51] ? (-{{(CorrBits-InputBits){rxSR[51][InputBits-1]}},rxSR[51]}) : {{(CorrBits-InputBits){rxSR[51][InputBits-1]}},rxSR[51]};
            sum52 <= codeSR[52] ? (-{{(CorrBits-InputBits){rxSR[52][InputBits-1]}},rxSR[52]}) : {{(CorrBits-InputBits){rxSR[52][InputBits-1]}},rxSR[52]};
            sum53 <= codeSR[53] ? (-{{(CorrBits-InputBits){rxSR[53][InputBits-1]}},rxSR[53]}) : {{(CorrBits-InputBits){rxSR[53][InputBits-1]}},rxSR[53]};
            sum54 <= codeSR[54] ? (-{{(CorrBits-InputBits){rxSR[54][InputBits-1]}},rxSR[54]}) : {{(CorrBits-InputBits){rxSR[54][InputBits-1]}},rxSR[54]};
            sum55 <= codeSR[55] ? (-{{(CorrBits-InputBits){rxSR[55][InputBits-1]}},rxSR[55]}) : {{(CorrBits-InputBits){rxSR[55][InputBits-1]}},rxSR[55]};
            sum56 <= codeSR[56] ? (-{{(CorrBits-InputBits){rxSR[56][InputBits-1]}},rxSR[56]}) : {{(CorrBits-InputBits){rxSR[56][InputBits-1]}},rxSR[56]};
            sum57 <= codeSR[57] ? (-{{(CorrBits-InputBits){rxSR[57][InputBits-1]}},rxSR[57]}) : {{(CorrBits-InputBits){rxSR[57][InputBits-1]}},rxSR[57]};
            sum58 <= codeSR[58] ? (-{{(CorrBits-InputBits){rxSR[58][InputBits-1]}},rxSR[58]}) : {{(CorrBits-InputBits){rxSR[58][InputBits-1]}},rxSR[58]};
            sum59 <= codeSR[59] ? (-{{(CorrBits-InputBits){rxSR[59][InputBits-1]}},rxSR[59]}) : {{(CorrBits-InputBits){rxSR[59][InputBits-1]}},rxSR[59]};
            sum60 <= codeSR[60] ? (-{{(CorrBits-InputBits){rxSR[60][InputBits-1]}},rxSR[60]}) : {{(CorrBits-InputBits){rxSR[60][InputBits-1]}},rxSR[60]};
            sum61 <= codeSR[61] ? (-{{(CorrBits-InputBits){rxSR[61][InputBits-1]}},rxSR[61]}) : {{(CorrBits-InputBits){rxSR[61][InputBits-1]}},rxSR[61]};
            sum62 <= codeSR[62] ? (-{{(CorrBits-InputBits){rxSR[62][InputBits-1]}},rxSR[62]}) : {{(CorrBits-InputBits){rxSR[62][InputBits-1]}},rxSR[62]};
            sum63 <= codeSR[63] ? (-{{(CorrBits-InputBits){rxSR[63][InputBits-1]}},rxSR[63]}) : {{(CorrBits-InputBits){rxSR[63][InputBits-1]}},rxSR[63]};
       end
    end




wire [CorrBits-1:0] sum4_0 = mask[0] ? sum0 + sum1 + sum2 + sum3 : {CorrBits{1'b0}};
wire [CorrBits-1:0] sum4_1 = mask[1] ? sum4 + sum5 + sum6 + sum7 : {CorrBits{1'b0}};
wire [CorrBits-1:0] sum4_2 = mask[2] ? sum8 + sum9 + sum10 + sum11 : {CorrBits{1'b0}};
wire [CorrBits-1:0] sum4_3 = mask[3] ? sum12 + sum13 + sum14 + sum15 : {CorrBits{1'b0}};
wire [CorrBits-1:0] sum4_4 = mask[4] ? sum16 + sum17 + sum18 + sum19 : {CorrBits{1'b0}};
wire [CorrBits-1:0] sum4_5 = mask[5] ? sum20 + sum21 + sum22 + sum23 : {CorrBits{1'b0}};
wire [CorrBits-1:0] sum4_6 = mask[6] ? sum24 + sum25 + sum26 + sum27 : {CorrBits{1'b0}};
wire [CorrBits-1:0] sum4_7 = mask[7] ? sum28 + sum29 + sum30 + sum31 : {CorrBits{1'b0}};

wire [CorrBits-1:0] sum32_0 = sum4_0 + sum4_1 + sum4_2 + sum4_3 + sum4_4 + sum4_5 + sum4_6 + sum4_7;

wire [CorrBits-1:0] sum4_8 = mask[8] ? sum32 + sum33 + sum34 + sum35 : {CorrBits{1'b0}};
wire [CorrBits-1:0] sum4_9 = mask[9] ? sum36 + sum37 + sum38 + sum39 : {CorrBits{1'b0}};
wire [CorrBits-1:0] sum4_10 = mask[10] ? sum40 + sum41 + sum42 + sum43 : {CorrBits{1'b0}};
wire [CorrBits-1:0] sum4_11 = mask[11] ? sum44 + sum45 + sum46 + sum47 : {CorrBits{1'b0}};
wire [CorrBits-1:0] sum4_12 = mask[12] ? sum48 + sum49 + sum50 + sum51 : {CorrBits{1'b0}};
wire [CorrBits-1:0] sum4_13 = mask[13] ? sum52 + sum53 + sum54 + sum55 : {CorrBits{1'b0}};
wire [CorrBits-1:0] sum4_14 = mask[14] ? sum56 + sum57 + sum58 + sum59 : {CorrBits{1'b0}};
wire [CorrBits-1:0] sum4_15 = mask[15] ? sum60 + sum61 + sum62 + sum63 : {CorrBits{1'b0}};

wire [CorrBits-1:0] sum32_1 = sum4_8 + sum4_9 + sum4_10 + sum4_11 + sum4_12 + sum4_13 + sum4_14 + sum4_15;

wire [CorrBits-1:0] sum64 = sum32_0 + sum32_1;

//assign despread = {sum64,{(18-CorrBits){1'b0}}};
//assign despread = {sum64[InputBits+5-1:0],7'b0};

reg     [17:0] despread;
always @* begin
    case (corrLength)
        0:  despread = {sum64[InputBits+1:0], {(18-(InputBits+2)){1'b0}}};
        1:  despread = {sum64[InputBits+2:0], {(18-(InputBits+3)){1'b0}}};
        2:  despread = {sum64[InputBits+2:0], {(18-(InputBits+3)){1'b0}}};  
        3:  despread = {sum64[InputBits+3:0], {(18-(InputBits+4)){1'b0}}};   
        4:  despread = {sum64[InputBits+3:0], {(18-(InputBits+4)){1'b0}}}; 
        5:  despread = {sum64[InputBits+3:0], {(18-(InputBits+4)){1'b0}}};  
        6:  despread = {sum64[InputBits+3:0], {(18-(InputBits+4)){1'b0}}};  
        7:  despread = {sum64[InputBits+4:0], {(18-(InputBits+5)){1'b0}}};
        8:  despread = {sum64[InputBits+4:0], {(18-(InputBits+5)){1'b0}}};
        9:  despread = {sum64[InputBits+4:0], {(18-(InputBits+5)){1'b0}}};
       10:  despread = {sum64[InputBits+4:0], {(18-(InputBits+5)){1'b0}}};
       11:  despread = {sum64[InputBits+4:0], {(18-(InputBits+5)){1'b0}}};
       12:  despread = {sum64[InputBits+4:0], {(18-(InputBits+5)){1'b0}}};
       13:  despread = {sum64[InputBits+4:0], {(18-(InputBits+5)){1'b0}}};
       14:  despread = {sum64[InputBits+4:0], {(18-(InputBits+5)){1'b0}}};
       15:  despread = {sum64[InputBits+5:0], {(18-(InputBits+6)){1'b0}}};
    endcase
end


// This counts the number of despread chips that have the same polarity as the previous chip. 
// It is used for detecting sync
assign syncCount = (mask[ 0] ? {5'b0,(sum0[CorrBits-1]  ^ sum1[CorrBits-1])}  + {5'b0,(sum1[CorrBits-1]  ^ sum2[CorrBits-1])}  + {5'b0,(sum2[CorrBits-1]  ^ sum3[CorrBits-1])} : 0)
                 + (mask[ 1] ? {5'b0,(sum3[CorrBits-1]  ^ sum4[CorrBits-1])}  + {5'b0,(sum4[CorrBits-1]  ^ sum5[CorrBits-1])}  + {5'b0,(sum5[CorrBits-1]  ^ sum6[CorrBits-1])}  + {5'b0,(sum6[CorrBits-1]  ^ sum7[CorrBits-1])}: 0)
                 + (mask[ 2] ? {5'b0,(sum7[CorrBits-1]  ^ sum8[CorrBits-1])}  + {5'b0,(sum8[CorrBits-1]  ^ sum9[CorrBits-1])}  + {5'b0,(sum9[CorrBits-1]  ^ sum10[CorrBits-1])} + {5'b0,(sum10[CorrBits-1] ^ sum11[CorrBits-1])}: 0)
                 + (mask[ 3] ? {5'b0,(sum11[CorrBits-1] ^ sum12[CorrBits-1])} + {5'b0,(sum12[CorrBits-1] ^ sum13[CorrBits-1])} + {5'b0,(sum13[CorrBits-1] ^ sum14[CorrBits-1])} + {5'b0,(sum14[CorrBits-1] ^ sum15[CorrBits-1])}: 0)
                 + (mask[ 4] ? {5'b0,(sum15[CorrBits-1] ^ sum16[CorrBits-1])} + {5'b0,(sum16[CorrBits-1] ^ sum17[CorrBits-1])} + {5'b0,(sum17[CorrBits-1] ^ sum18[CorrBits-1])} + {5'b0,(sum18[CorrBits-1] ^ sum19[CorrBits-1])}: 0)
                 + (mask[ 5] ? {5'b0,(sum19[CorrBits-1] ^ sum20[CorrBits-1])} + {5'b0,(sum20[CorrBits-1] ^ sum21[CorrBits-1])} + {5'b0,(sum21[CorrBits-1] ^ sum22[CorrBits-1])} + {5'b0,(sum22[CorrBits-1] ^ sum23[CorrBits-1])}: 0)
                 + (mask[ 6] ? {5'b0,(sum23[CorrBits-1] ^ sum24[CorrBits-1])} + {5'b0,(sum24[CorrBits-1] ^ sum25[CorrBits-1])} + {5'b0,(sum25[CorrBits-1] ^ sum26[CorrBits-1])} + {5'b0,(sum26[CorrBits-1] ^ sum27[CorrBits-1])}: 0)
                 + (mask[ 7] ? {5'b0,(sum27[CorrBits-1] ^ sum28[CorrBits-1])} + {5'b0,(sum28[CorrBits-1] ^ sum29[CorrBits-1])} + {5'b0,(sum29[CorrBits-1] ^ sum30[CorrBits-1])} + {5'b0,(sum30[CorrBits-1] ^ sum31[CorrBits-1])}: 0)
                 + (mask[ 8] ? {5'b0,(sum31[CorrBits-1] ^ sum32[CorrBits-1])} + {5'b0,(sum32[CorrBits-1] ^ sum33[CorrBits-1])} + {5'b0,(sum33[CorrBits-1] ^ sum34[CorrBits-1])} + {5'b0,(sum34[CorrBits-1] ^ sum35[CorrBits-1])}: 0)
                 + (mask[ 9] ? {5'b0,(sum35[CorrBits-1] ^ sum36[CorrBits-1])} + {5'b0,(sum36[CorrBits-1] ^ sum37[CorrBits-1])} + {5'b0,(sum37[CorrBits-1] ^ sum38[CorrBits-1])} + {5'b0,(sum38[CorrBits-1] ^ sum39[CorrBits-1])}: 0)
                 + (mask[10] ? {5'b0,(sum39[CorrBits-1] ^ sum40[CorrBits-1])} + {5'b0,(sum40[CorrBits-1] ^ sum41[CorrBits-1])} + {5'b0,(sum41[CorrBits-1] ^ sum42[CorrBits-1])} + {5'b0,(sum42[CorrBits-1] ^ sum43[CorrBits-1])}: 0)
                 + (mask[11] ? {5'b0,(sum43[CorrBits-1] ^ sum44[CorrBits-1])} + {5'b0,(sum44[CorrBits-1] ^ sum45[CorrBits-1])} + {5'b0,(sum45[CorrBits-1] ^ sum46[CorrBits-1])} + {5'b0,(sum46[CorrBits-1] ^ sum47[CorrBits-1])}: 0)
                 + (mask[12] ? {5'b0,(sum47[CorrBits-1] ^ sum48[CorrBits-1])} + {5'b0,(sum48[CorrBits-1] ^ sum49[CorrBits-1])} + {5'b0,(sum49[CorrBits-1] ^ sum50[CorrBits-1])} + {5'b0,(sum50[CorrBits-1] ^ sum51[CorrBits-1])}: 0)
                 + (mask[13] ? {5'b0,(sum51[CorrBits-1] ^ sum52[CorrBits-1])} + {5'b0,(sum52[CorrBits-1] ^ sum53[CorrBits-1])} + {5'b0,(sum53[CorrBits-1] ^ sum54[CorrBits-1])} + {5'b0,(sum54[CorrBits-1] ^ sum55[CorrBits-1])}: 0)
                 + (mask[14] ? {5'b0,(sum55[CorrBits-1] ^ sum56[CorrBits-1])} + {5'b0,(sum56[CorrBits-1] ^ sum57[CorrBits-1])} + {5'b0,(sum57[CorrBits-1] ^ sum58[CorrBits-1])} + {5'b0,(sum58[CorrBits-1] ^ sum59[CorrBits-1])}: 0)
                 + (mask[15] ? {5'b0,(sum59[CorrBits-1] ^ sum60[CorrBits-1])} + {5'b0,(sum60[CorrBits-1] ^ sum61[CorrBits-1])} + {5'b0,(sum61[CorrBits-1] ^ sum62[CorrBits-1])} + {5'b0,(sum62[CorrBits-1] ^ sum63[CorrBits-1])}: 0)
                 ;                                                                                                                                                              
/*
chipscope_ila ila (
    .CONTROL(CHIPSCOPE_BUS), // INOUT BUS [35:0]
    .CLK(clk), // IN
    .DATA({19'b0,onTime,clkEn,sum64}), // IN BUS [31:0]
    .TRIG0(1'b1) // IN BUS [0:0]
);
*/

`ifdef SIMULATE
//real sumReal;
//always @* sumReal = $itor($signed(sum32_0))/(2**(CorrBits-1));
real despreadReal;
always @* despreadReal = $itor($signed(despread))/(2**17);
`endif

endmodule
