`timescale 1ns/100ps

module shift34to18(
    clk, clkEn,
    shift,
    dIn,
    dOut
    );

input           clk,clkEn;
input   [4:0]   shift;
input   [33:0]  dIn;
output  [17:0]  dOut;

reg     [17:0]  dataBits;
reg     [17:0]  dOut;
reg             satPos,satNeg;
wire            sign = dIn[33];
always @(posedge clk) begin
    if (clkEn) begin
        // Extract the bit field 
        case (shift)
             0: dataBits <= dIn[17:0];
             1: dataBits <= dIn[18:1];
             2: dataBits <= dIn[19:2];
             3: dataBits <= dIn[20:3];
             4: dataBits <= dIn[21:4];
             5: dataBits <= dIn[22:5];
             6: dataBits <= dIn[23:6];
             7: dataBits <= dIn[24:7];
             8: dataBits <= dIn[25:8];
             9: dataBits <= dIn[26:9];
            10: dataBits <= dIn[27:10];
            11: dataBits <= dIn[28:11];
            12: dataBits <= dIn[29:12];
            13: dataBits <= dIn[30:13];
            14: dataBits <= dIn[31:14];
            15: dataBits <= dIn[32:15];
            default:
                dataBits <= dIn[33:16];
            endcase
        // Check for overflow
        case (shift)
            0: begin
                satPos <= !sign && (dIn[33:18] != 16'h0000);
                satNeg <=  sign && (dIn[33:18] != 16'hffff);
                end
            1: begin
                satPos <= !sign && (dIn[33:19] != 15'h0000);
                satNeg <=  sign && (dIn[33:19] != 15'h7fff);
                end
            2: begin
                satPos <= !sign && (dIn[33:20] != 14'h0000);
                satNeg <=  sign && (dIn[33:20] != 14'h3fff);
                end
            3: begin
                satPos <= !sign && (dIn[33:21] != 13'h0000);
                satNeg <=  sign && (dIn[33:21] != 13'h1fff);
                end
            4: begin
                satPos <= !sign && (dIn[33:22] != 12'h000);
                satNeg <=  sign && (dIn[33:22] != 12'hfff);
                end
            5: begin
                satPos <= !sign && (dIn[33:23] != 11'h000);
                satNeg <=  sign && (dIn[33:23] != 11'h7ff);
                end
            6: begin
                satPos <= !sign && (dIn[33:24] != 10'h000);
                satNeg <=  sign && (dIn[33:24] != 10'h3ff);
                end
            7: begin
                satPos <= !sign && (dIn[33:25] !=  9'h000);
                satNeg <=  sign && (dIn[33:25] !=  9'h1ff);
                end
            8: begin
                satPos <= !sign && (dIn[33:26] !=  8'h00);
                satNeg <=  sign && (dIn[33:26] !=  8'hff);
                end
            9: begin
                satPos <= !sign && (dIn[33:27] !=  7'h00);
                satNeg <=  sign && (dIn[33:27] !=  7'h7f);
                end
           10: begin
                satPos <= !sign && (dIn[33:28] !=  6'h00);
                satNeg <=  sign && (dIn[33:28] !=  6'h3f);
                end
           11: begin
                satPos <= !sign && (dIn[33:29] !=  5'h00);
                satNeg <=  sign && (dIn[33:29] !=  5'h1f);
                end
           12: begin
                satPos <= !sign && (dIn[33:30] !=  4'h0);
                satNeg <=  sign && (dIn[33:30] !=  4'hf);
                end
           13: begin
                satPos <= !sign && (dIn[33:31] !=  3'h0);
                satNeg <=  sign && (dIn[33:31] !=  3'h7);
                end
           14: begin
                satPos <= !sign && (dIn[33:32] !=  2'h0);
                satNeg <=  sign && (dIn[33:32] !=  2'h3);
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
