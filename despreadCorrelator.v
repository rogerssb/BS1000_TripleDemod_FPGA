module despreadCorrelator(
    clk,
    clkEn,
    reset,
    onTime,
    slip,
    codeBit,
    rx,
    despread,
    bsError
    );

parameter CorrLength = 16;
parameter CorrBits = 10;
parameter InputBits = 6;

input   clk;
input   clkEn;
input   reset;
input   onTime;
input   slip;
input   codeBit;
input   [InputBits-1:0] rx;
output  [17:0]          despread;
output  [17:0]          bsError;

`ifdef SIMULATE
real rxReal;
always @* rxReal = $itor($signed(rx))/(2**(InputBits-1));
`endif


// Create the onTime correlation shift register
    reg     [InputBits-1:0]     rxSR[CorrLength-1:0];
    reg     [17:0]              bsError;
    reg     [CorrLength-1:0]    codeSR;
    integer         i;
    always @(posedge clk) begin
        if (reset) begin
            codeSR <= 1;
        end
        else if (clkEn & onTime) begin
            rxSR[0] <= rx;
            for (i = 0; i < CorrLength-1; i = i + 1) begin
                rxSR[i+1] <= rxSR[i];
            end
            if (!slip) begin
                codeSR <= {codeSR[CorrLength-2:0],codeBit};
            end
        end
        if (clkEn & !onTime) begin
            // Is there a transition on the code sequence?
            if (codeBit ^ codeSR[0]) begin
                // Yes. Encode the bitsync error in the shift register
                if (codeBit) begin
                    bsError <= {-rx,{(18-InputBits){1'b0}}};
                end
                else begin
                    bsError <= {rx,{(18-InputBits){1'b0}}};
                end
            end
            else begin
                bsError <= 0;
            end
        end
    end

`ifdef SIMULATE
real rxSRReal;
always @* rxSRReal = $itor($signed(rxSR[0]))/(2**(InputBits-1));
real bsErrorReal;
always @* bsErrorReal = $itor($signed(bsError))/(2**17);
`endif


    reg     [CorrBits-1:0]  sum0,sum1,sum2,sum3,sum4,sum5,sum6,sum7;
    reg     [CorrBits-1:0]  sum8,sum9,sum10,sum11,sum12,sum13,sum14,sum15;
    reg     [CorrBits-1:0]  sum16,sum17,sum18,sum19,sum20,sum21,sum22,sum23;
    reg     [CorrBits-1:0]  sum24,sum25,sum26,sum27,sum28,sum29,sum30,sum31;
    wire    [CorrBits-1:0]  sum = sum0  + sum1  + sum2  + sum3
                                + sum4  + sum5  + sum6  + sum7
                                + sum8  + sum9  + sum10 + sum11
                                + sum12 + sum13 + sum14 + sum15
                                + sum16 + sum17 + sum18 + sum19
                                + sum20 + sum21 + sum22 + sum23
                                + sum24 + sum25 + sum26 + sum27
                                + sum28 + sum29 + sum30 + sum31;
    integer                 j;
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
        end
    end    

assign despread = {sum,{(18-CorrBits){1'b0}}};


`ifdef SIMULATE
real sumReal;
always @* sumReal = $itor($signed(sum))/(2**(CorrBits-1));
real despreadReal;
always @* despreadReal = $itor($signed(despread))/(2**17);
`endif

endmodule
