`timescale 1ns/100ps

module shift48to18(
    clk, clkEn,
    shift,
    dIn,
    dOut
    );

input           clk,clkEn;
input   [4:0]   shift;
input   [47:0]  dIn;
output  [17:0]  dOut;

reg     [17:0]  dataBits;
reg     [17:0]  dOut;
reg             satPos,satNeg;
wire            sign = dIn[47];
always @(posedge clk) begin
    if (clkEn) begin
        // Extract the bit field 
        case (shift)
             0: dataBits <= {dIn[15:0],2'b0};
             1: dataBits <= {dIn[16:0],1'b0};
             2: dataBits <= dIn[17:0];
             3: dataBits <= dIn[18:1];
             4: dataBits <= dIn[19:2];
             5: dataBits <= dIn[20:3];
             6: dataBits <= dIn[21:4];
             7: dataBits <= dIn[22:5];
             8: dataBits <= dIn[23:6];
             9: dataBits <= dIn[24:7];
            10: dataBits <= dIn[25:8];
            11: dataBits <= dIn[26:9];
            12: dataBits <= dIn[27:10];
            13: dataBits <= dIn[28:11];
            14: dataBits <= dIn[29:12];
            15: dataBits <= dIn[30:13];
            16: dataBits <= dIn[31:14];
            17: dataBits <= dIn[32:15];
            18: dataBits <= dIn[33:16];
            19: dataBits <= dIn[34:17];
            20: dataBits <= dIn[35:18];
            21: dataBits <= dIn[36:19];
            22: dataBits <= dIn[37:20];
            23: dataBits <= dIn[38:21];
            24: dataBits <= dIn[39:22];
            25: dataBits <= dIn[40:23];
            26: dataBits <= dIn[41:24];
            27: dataBits <= dIn[42:25];
            28: dataBits <= dIn[43:26];
            29: dataBits <= dIn[44:27];
            30: dataBits <= dIn[45:28];
            31: dataBits <= dIn[46:29];
            default:
                dataBits <= dIn[47:30];
            endcase
        // Check for overflow
        case (shift)
            0: begin
                satPos <= !sign && (dIn[47:16] != 32'h0000_0000);
                satNeg <=  sign && (dIn[47:16] != 32'hffff_ffff);
                end
            1: begin
                satPos <= !sign && (dIn[47:17] != 31'h0000_0000);
                satNeg <=  sign && (dIn[47:17] != 31'h7fff_ffff);
                end
            2: begin
                satPos <= !sign && (dIn[47:18] != 30'h0000_0000);
                satNeg <=  sign && (dIn[47:18] != 30'h3fff_ffff);
                end
            3: begin
                satPos <= !sign && (dIn[47:19] != 29'h0000_0000);
                satNeg <=  sign && (dIn[47:19] != 29'h1fff_ffff);
                end
            4: begin
                satPos <= !sign && (dIn[47:20] != 28'h0000_000);
                satNeg <=  sign && (dIn[47:20] != 28'hffff_fff);
                end
            5: begin
                satPos <= !sign && (dIn[47:21] != 27'h0000_000);
                satNeg <=  sign && (dIn[47:21] != 27'h7fff_fff);
                end
            6: begin
                satPos <= !sign && (dIn[47:22] != 26'h0000_000);
                satNeg <=  sign && (dIn[47:22] != 26'h3fff_fff);
                end
            7: begin
                satPos <= !sign && (dIn[47:23] != 25'h0000_000);
                satNeg <=  sign && (dIn[47:23] != 25'h1fff_fff);
                end
            8: begin
                satPos <= !sign && (dIn[47:24] != 24'h0000_00);
                satNeg <=  sign && (dIn[47:24] != 24'hffff_ff);
                end
            9: begin
                satPos <= !sign && (dIn[47:25] != 23'h0000_00);
                satNeg <=  sign && (dIn[47:25] != 23'h7fff_ff);
                end
           10: begin
                satPos <= !sign && (dIn[47:26] != 22'h0000_00);
                satNeg <=  sign && (dIn[47:26] != 22'h3fff_ff);
                end
           11: begin
                satPos <= !sign && (dIn[47:27] != 21'h0000_00);
                satNeg <=  sign && (dIn[47:27] != 21'h1fff_ff);
                end
           12: begin
                satPos <= !sign && (dIn[47:28] != 20'h0000_0);
                satNeg <=  sign && (dIn[47:28] != 20'hffff_f);
                end
           13: begin
                satPos <= !sign && (dIn[47:29] != 19'h0000_0);
                satNeg <=  sign && (dIn[47:29] != 19'h7fff_f);
                end
           14: begin
                satPos <= !sign && (dIn[47:30] != 18'h0000_0);
                satNeg <=  sign && (dIn[47:30] != 18'h3fff_f);
                end
           15: begin
                satPos <= !sign && (dIn[47:31] != 17'h0000_0);
                satNeg <=  sign && (dIn[47:31] != 17'h1fff_f);
                end
           16: begin
                satPos <= !sign && (dIn[47:32] != 16'h0000);
                satNeg <=  sign && (dIn[47:32] != 16'hffff);
                end
           17: begin
                satPos <= !sign && (dIn[47:33] != 15'h0000);
                satNeg <=  sign && (dIn[47:33] != 15'h7fff);
                end
           18: begin
                satPos <= !sign && (dIn[47:34] != 14'h0000);
                satNeg <=  sign && (dIn[47:34] != 14'h3fff);
                end
           19: begin
                satPos <= !sign && (dIn[47:35] != 13'h0000);
                satNeg <=  sign && (dIn[47:35] != 13'h1fff);
                end
           20: begin
                satPos <= !sign && (dIn[47:36] != 12'h000);
                satNeg <=  sign && (dIn[47:36] != 12'hfff);
                end
           21: begin
                satPos <= !sign && (dIn[47:37] != 11'h000);
                satNeg <=  sign && (dIn[47:37] != 11'h7ff);
                end
           22: begin
                satPos <= !sign && (dIn[47:38] != 10'h000);
                satNeg <=  sign && (dIn[47:38] != 10'h3ff);
                end
           23: begin
                satPos <= !sign && (dIn[47:39] !=  9'h000);
                satNeg <=  sign && (dIn[47:39] !=  9'h1ff);
                end
           24: begin
                satPos <= !sign && (dIn[47:40] !=  8'h00);
                satNeg <=  sign && (dIn[47:40] !=  8'hff);
                end
           25: begin
                satPos <= !sign && (dIn[47:41] !=  7'h00);
                satNeg <=  sign && (dIn[47:41] !=  7'h7f);
                end
           26: begin
                satPos <= !sign && (dIn[47:42] !=  6'h00);
                satNeg <=  sign && (dIn[47:42] !=  6'h3f);
                end
           27: begin
                satPos <= !sign && (dIn[47:43] !=  5'h00);
                satNeg <=  sign && (dIn[47:43] !=  5'h1f);
                end
           28: begin
                satPos <= !sign && (dIn[47:44] !=  4'h0);
                satNeg <=  sign && (dIn[47:44] !=  4'hf);
                end
           29: begin
                satPos <= !sign && (dIn[47:45] !=  3'h0);
                satNeg <=  sign && (dIn[47:45] !=  3'h7);
                end
           30: begin
                satPos <= !sign && (dIn[47:46] !=  2'h0);
                satNeg <=  sign && (dIn[47:46] !=  2'h3);
                end
            default: begin
                satPos <= 0;
                satNeg <= 0;
                end
            endcase
        // Final output
        if (satPos) begin
            dOut <= 18'h1ffff;
            end
        else if (satNeg) begin
            dOut <= 18'h20001;
            end
        else begin
            dOut <= dataBits;
            end
        end
    end

endmodule
