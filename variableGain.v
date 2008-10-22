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
input   [17:0]  din;
output  [17:0]  dout;

// Saturating shifter
wire sign = din[17];
reg satPos,satNeg;
reg [17:0]dataBits;
reg [17:0]shift;
always @(posedge clk) begin
    if (clkEn) begin
        case (exponent) 
             0: dataBits <= din[17:0];
             1: dataBits <= {din[16:0], 1'h0};
             2: dataBits <= {din[15:0], 2'h0};
             3: dataBits <= {din[14:0], 3'h0};
             4: dataBits <= {din[13:0], 4'h0};
             5: dataBits <= {din[12:0], 5'h00};
             6: dataBits <= {din[11:0], 6'h00};
             7: dataBits <= {din[10:0], 7'h00};
             8: dataBits <= {din[09:0], 8'h00};
             9: dataBits <= {din[08:0], 9'h000};
            10: dataBits <= {din[07:0],10'h000};
            11: dataBits <= {din[06:0],11'h000};
            12: dataBits <= {din[05:0],12'h000};
            13: dataBits <= {din[04:0],13'h0000};
            14: dataBits <= {din[03:0],14'h0000};
            15: dataBits <= {din[02:0],15'h0000};
            endcase
        // Check for overflow
        case (exponent)
            0: begin
                satPos <= 0;
                satNeg <= 0;
                end
            1: begin
                satPos <= !sign && (din[16:16] != 1'h0);
                satNeg <=  sign && (din[16:16] != 1'h1);
                end
            2: begin
                satPos <= !sign && (din[16:15] != 2'h0);
                satNeg <=  sign && (din[16:15] != 2'h3);
                end
            3: begin
                satPos <= !sign && (din[16:14] != 3'h0);
                satNeg <=  sign && (din[16:14] != 3'h7);
                end
            4: begin
                satPos <= !sign && (din[16:13] != 4'h0);
                satNeg <=  sign && (din[16:13] != 4'hf);
                end
            5: begin
                satPos <= !sign && (din[16:12] != 5'h00);
                satNeg <=  sign && (din[16:12] != 5'h1f);
                end
            6: begin
                satPos <= !sign && (din[16:11] != 6'h00);
                satNeg <=  sign && (din[16:11] != 6'h3f);
                end
            7: begin
                satPos <= !sign && (din[16:10] != 7'h00);
                satNeg <=  sign && (din[16:10] != 7'h7f);
                end
            8: begin
                satPos <= !sign && (din[16:09] != 8'h00);
                satNeg <=  sign && (din[16:09] != 8'hff);
                end
            9: begin
                satPos <= !sign && (din[16:08] != 9'h000);
                satNeg <=  sign && (din[16:08] != 9'h1ff);
                end
           10: begin
                satPos <= !sign && (din[16:07] != 10'h000);
                satNeg <=  sign && (din[16:07] != 10'h3ff);
                end
           11: begin
                satPos <= !sign && (din[16:06] != 11'h000);
                satNeg <=  sign && (din[16:06] != 11'h7ff);
                end
           12: begin
                satPos <= !sign && (din[16:05] !=  12'h000);
                satNeg <=  sign && (din[16:05] !=  12'hfff);
                end
           13: begin
                satPos <= !sign && (din[16:04] !=  13'h0000);
                satNeg <=  sign && (din[16:04] !=  13'h1fff);
                end
           14: begin
                satPos <= !sign && (din[16:03] !=  14'h0000);
                satNeg <=  sign && (din[16:03] !=  14'h3fff);
                end
           15: begin
                satPos <= !sign && (din[16:02] !=  14'h0000);
                satNeg <=  sign && (din[16:02] !=  14'h7fff);
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


assign dout = scaledValue[34:17];

endmodule
