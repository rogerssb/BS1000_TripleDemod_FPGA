`timescale 1ns / 10 ps
`include ".\addressMap.v"

module variableGain (
    clk, clkEn, reset, 
    exponent,mantissa,
    din,
    dout
    );

input           clk, clkEn, reset;
input   [4:0]   exponent;
input   [15:0]  mantissa;
input   [47:0]  din;
output  [17:0]  dout;

// Saturating shifter
wire sign = din[47];
reg satPos,satNeg;
reg [17:0]dataBits;
reg [17:0]shift;
always @(posedge clk) begin
    if (clkEn) begin
        case (exponent) 
             0: dataBits <= din[47:30];
             1: dataBits <= din[46:29];
             2: dataBits <= din[45:28];
             3: dataBits <= din[44:27];
             4: dataBits <= din[43:26];
             5: dataBits <= din[42:25];
             6: dataBits <= din[41:24];
             7: dataBits <= din[40:23];
             8: dataBits <= din[39:22];
             9: dataBits <= din[38:21];
            10: dataBits <= din[37:20];
            11: dataBits <= din[36:19];
            12: dataBits <= din[35:18];
            13: dataBits <= din[34:17];
            14: dataBits <= din[33:16];
            15: dataBits <= din[32:15];
            16: dataBits <= din[31:14];
            17: dataBits <= din[30:13];
            18: dataBits <= din[29:12];
            19: dataBits <= din[28:11];
            20: dataBits <= din[27:10];
            21: dataBits <= din[26: 9];
            22: dataBits <= din[25: 8];
            23: dataBits <= din[24: 7];
            24: dataBits <= din[23: 6];
            25: dataBits <= din[22: 5];
            26: dataBits <= din[21: 4];
            27: dataBits <= din[20: 3];
            28: dataBits <= din[19: 2];
            29: dataBits <= din[18: 1];
            30: dataBits <= din[17: 0];
            31: dataBits <= din[17: 0];
            endcase
        // Check for overflow
        case (exponent)
            0: begin
                satPos <= 0;
                satNeg <= 0;
                end
            1: begin
                satPos <= !sign && (din[46:46] != 1'h0);
                satNeg <=  sign && (din[46:46] != 1'h1);
                end
            2: begin
                satPos <= !sign && (din[46:45] != 2'h0);
                satNeg <=  sign && (din[46:45] != 2'h3);
                end
            3: begin
                satPos <= !sign && (din[46:44] != 3'h0);
                satNeg <=  sign && (din[46:44] != 3'h7);
                end
            4: begin
                satPos <= !sign && (din[46:43] != 4'h0);
                satNeg <=  sign && (din[46:43] != 4'hf);
                end
            5: begin
                satPos <= !sign && (din[46:42] != 5'h0);
                satNeg <=  sign && (din[46:42] != 5'h1f);
                end
            6: begin
                satPos <= !sign && (din[46:41] != 6'h0);
                satNeg <=  sign && (din[46:41] != 6'h3f);
                end
            7: begin
                satPos <= !sign && (din[46:40] != 7'h0);
                satNeg <=  sign && (din[46:40] != 7'h7f);
                end
            8: begin
                satPos <= !sign && (din[46:39] != 8'h0);
                satNeg <=  sign && (din[46:39] != 8'hff);
                end
            9: begin
                satPos <= !sign && (din[46:38] != 9'h0);
                satNeg <=  sign && (din[46:38] != 9'h1ff);
                end
           10: begin
                satPos <= !sign && (din[46:37] != 10'h0);
                satNeg <=  sign && (din[46:37] != 10'h3ff);
                end
           11: begin
                satPos <= !sign && (din[46:36] != 11'h0);
                satNeg <=  sign && (din[46:36] != 11'h7ff);
                end
           12: begin
                satPos <= !sign && (din[46:35] !=  12'h0);
                satNeg <=  sign && (din[46:35] !=  12'hfff);
                end
           13: begin
                satPos <= !sign && (din[46:34] !=  13'h0);
                satNeg <=  sign && (din[46:34] !=  13'h1fff);
                end
           14: begin
                satPos <= !sign && (din[46:33] !=  14'h0);
                satNeg <=  sign && (din[46:33] !=  14'h3fff);
                end
           15: begin
                satPos <= !sign && (din[46:32] !=  15'h0);
                satNeg <=  sign && (din[46:32] !=  15'h7fff);
                end
           16: begin
                satPos <= !sign && (din[46:31] !=  16'h0);
                satNeg <=  sign && (din[46:31] !=  16'hffff);
                end
           17: begin
                satPos <= !sign && (din[46:30] !=  17'h0);
                satNeg <=  sign && (din[46:30] !=  17'h1ffff);
                end
           18: begin
                satPos <= !sign && (din[46:29] !=  18'h0);
                satNeg <=  sign && (din[46:29] !=  18'h3ffff);
                end
           19: begin
                satPos <= !sign && (din[46:28] !=  19'h0);
                satNeg <=  sign && (din[46:28] !=  19'h7ffff);
                end
           20: begin
                satPos <= !sign && (din[46:27] !=  20'h0);
                satNeg <=  sign && (din[46:27] !=  20'hfffff);
                end
           21: begin                                   
                satPos <= !sign && (din[46:26] !=  21'h0);
                satNeg <=  sign && (din[46:26] !=  21'h1fffff);
                end
           22: begin
                satPos <= !sign && (din[46:25] !=  22'h0);
                satNeg <=  sign && (din[46:25] !=  22'h3fffff);
                end
           23: begin
                satPos <= !sign && (din[46:24] !=  23'h0);
                satNeg <=  sign && (din[46:24] !=  23'h7fffff);
                end
           24: begin
                satPos <= !sign && (din[46:23] !=  24'h0);
                satNeg <=  sign && (din[46:23] !=  24'hffffff);
                end
           25: begin
                satPos <= !sign && (din[46:22] !=  25'h0);
                satNeg <=  sign && (din[46:22] !=  25'h1ffffff);
                end
           26: begin
                satPos <= !sign && (din[46:21] !=  26'h0);
                satNeg <=  sign && (din[46:21] !=  26'h3ffffff);
                end
           27: begin
                satPos <= !sign && (din[46:20] !=  27'h0);
                satNeg <=  sign && (din[46:20] !=  27'h7ffffff);
                end
           28: begin
                satPos <= !sign && (din[46:19] !=  28'h0);
                satNeg <=  sign && (din[46:19] !=  28'hfffffff);
                end
           29: begin
                satPos <= !sign && (din[46:18] !=  29'h0);
                satNeg <=  sign && (din[46:18] !=  29'h1fffffff);
                end
           30: begin
                satPos <= !sign && (din[46:17] !=  30'h0);
                satNeg <=  sign && (din[46:17] !=  30'h3fffffff);
                end
           31: begin
                satPos <= !sign && (din[46:17] !=  30'h0);
                satNeg <=  sign && (din[46:17] !=  30'h3fffffff);
                end
            endcase
        // shifter output
        if (satPos) begin
            shift <= 18'h1ffff;
            end
        else if (satNeg) begin
            shift <= 18'h20001;
            end
        else begin
            shift <= dataBits;
            end
        end
    end

wire [35:0]scaledValue;
mpy18x18 gainScaler (
    .sclr(1'b0),
    .clk(clk),
    .a(shift),
    .b({2'b01,mantissa}),
    .p(scaledValue)
    );

reg     [17:0]  dout;
always @(posedge clk) begin
    if (clkEn) begin
        if (scaledValue[35] && (scaledValue[34:33] != 2'b11)) begin
            dout <= 18'h20001;
            end
        else if (!scaledValue[35] && (scaledValue[34:33] != 2'b00)) begin
            dout <= 18'h1ffff;
            end
        else begin
            dout <= scaledValue[33:16];
            end
        end
    end



endmodule
