module despreadCorrelator(
    input clk,
    input clkEn,
    input reset,
    input codeBit,
    input   [2:0]   rx,
    output  [17:0]  corrOut
    );

parameter CorrLength = 16;
parameter CorrBits = 8;

`ifdef SIMULATE
real rxReal;
always @* rxReal = $itor($signed(rx))/(2**2);
`endif


// Create a correlation shift register
    reg     [2:0]               rxSR[CorrLength-1:0];
    reg     [CorrLength-1:0]    codeSR;
    integer         i;
    always @(posedge clk) begin
        if (clkEn) begin
            rxSR[0] <= rx;
            for (i = 0; i < CorrLength-1; i = i + 1) begin
                rxSR[i+1] <= rxSR[i];
            end
            codeSR <= {codeSR[CorrLength-2:0],codeBit};
            /*
            sr[14] <= sr[15];
            sr[13] <= sr[14];
            sr[12] <= sr[13];
            sr[11] <= sr[12];
            sr[10] <= sr[11];
            sr[ 9] <= sr[10];
            sr[ 8] <= sr[ 9];
            sr[ 7] <= sr[ 8];
            sr[ 6] <= sr[ 7];
            sr[ 5] <= sr[ 6];
            sr[ 4] <= sr[ 5];
            sr[ 3] <= sr[ 4];
            sr[ 2] <= sr[ 3];
            sr[ 1] <= sr[ 2];
            sr[ 0] <= sr[ 1];
            */
        end
    end

`ifdef SIMULATE
real rxSRReal;
always @* rxSRReal = $itor($signed(rxSR[0]))/(2**2);
`endif


    reg     [CorrBits-1:0]  sum[CorrLength:0];
    integer                 j;
    always @(posedge clk) begin
        if (clkEn) begin
            for (j = 0; j < CorrLength; j = j + 1) begin
                if (codeSR[j]) begin
                    sum[j+1] <= sum[j] - {{(CorrBits-3){rxSR[j][2]}},rxSR[j]};
                end
                else begin
                    sum[j+1] <= sum[j] + {{(CorrBits-3){rxSR[j][2]}},rxSR[j]};
                end
            end
        end
        else begin
            sum[0] <= 0;
        end
    end    

endmodule
