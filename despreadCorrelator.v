module despreadCorrelator(
    clk,
    clkEn,
    reset,
    codeBit,
    rx,
    corrOut
    );

parameter CorrLength = 16;
parameter CorrBits = 10;
parameter InputBits = 6;

input   clk;
input   clkEn;
input   reset;
input   codeBit;
input   [InputBits-1:0] rx;
output  [17:0]          corrOut;

`ifdef SIMULATE
real rxReal;
always @* rxReal = $itor($signed(rx))/(2**2);
`endif


// Create a correlation shift register
    reg     [InputBits-1:0]     rxSR[CorrLength-1:0];
    reg     [CorrLength-1:0]    codeSR;
    integer         i;
    always @(posedge clk) begin
        if (clkEn) begin
            rxSR[0] <= rx;
            for (i = 0; i < CorrLength-1; i = i + 1) begin
                rxSR[i+1] <= rxSR[i];
            end
            codeSR <= {codeSR[CorrLength-2:0],codeBit};
        end
    end

`ifdef SIMULATE
real rxSRReal;
always @* rxSRReal = $itor($signed(rxSR[0]))/(2**(InputBits-1));
`endif


    reg     [CorrBits-1:0]  sum0,sum1,sum2,sum3,sum4,sum5,sum6,sum7;
    reg     [CorrBits-1:0]  sum8,sum9,sum10,sum11,sum12,sum13,sum14,sum15;
    wire    [CorrBits-1:0]  sum = sum0  + sum1  + sum2  + sum3
                                + sum4  + sum5  + sum6  + sum7
                                + sum8  + sum9  + sum10 + sum11
                                + sum12 + sum13 + sum14 + sum15;
    integer                 j;
    always @(posedge clk) begin
        if (clkEn) begin
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
        end
    end    

`ifdef SIMULATE
real sumReal;
always @* sumReal = $itor($signed(sum))/(2**(CorrBits-1));
`endif

endmodule
