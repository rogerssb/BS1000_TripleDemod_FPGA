`timescale 1ns / 10 ps
`include ".\addressMap.v"

module variableGain (
    clk, clkEn, reset, 
    exponent,mantissa,
    din,
    dout
    );

input           clk, clkEn, reset;
input   [3:0]   exponent;
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
                satPos <= !sign && (din[46:42] != 5'h00);
                satNeg <=  sign && (din[46:42] != 5'h1f);
                end
            6: begin
                satPos <= !sign && (din[46:41] != 6'h00);
                satNeg <=  sign && (din[46:41] != 6'h3f);
                end
            7: begin
                satPos <= !sign && (din[46:40] != 7'h00);
                satNeg <=  sign && (din[46:40] != 7'h7f);
                end
            8: begin
                satPos <= !sign && (din[46:39] != 8'h00);
                satNeg <=  sign && (din[46:39] != 8'hff);
                end
            9: begin
                satPos <= !sign && (din[46:38] != 9'h000);
                satNeg <=  sign && (din[46:38] != 9'h1ff);
                end
           10: begin
                satPos <= !sign && (din[46:37] != 10'h000);
                satNeg <=  sign && (din[46:37] != 10'h3ff);
                end
           11: begin
                satPos <= !sign && (din[46:36] != 11'h000);
                satNeg <=  sign && (din[46:36] != 11'h7ff);
                end
           12: begin
                satPos <= !sign && (din[46:35] !=  12'h000);
                satNeg <=  sign && (din[46:35] !=  12'hfff);
                end
           13: begin
                satPos <= !sign && (din[46:34] !=  13'h0000);
                satNeg <=  sign && (din[46:34] !=  13'h1fff);
                end
           14: begin
                satPos <= !sign && (din[46:33] !=  14'h0000);
                satNeg <=  sign && (din[46:33] !=  14'h3fff);
                end
           15: begin
                satPos <= !sign && (din[46:32] !=  14'h0000);
                satNeg <=  sign && (din[46:32] !=  14'h7fff);
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



endmodule
