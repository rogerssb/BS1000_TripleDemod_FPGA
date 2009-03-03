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
`define FAST_COMPARE
`ifdef FAST_COMPARE
//reg             zero47to44,ones47to44;
//reg             zero43to40,ones43to40;
//reg             zero39to36,ones39to36;
//reg             zero35to32,ones35to32;
//reg             zero31to28,ones31to28;
//reg             zero27to24,ones27to24;
//reg             zero23to20,ones23to20;
//reg             zero19to16,ones19to16;
wire    zero47to44 = (dIn[47:44] == 4'h0);
wire    zero43to40 = (dIn[43:40] == 4'h0);
wire    zero39to36 = (dIn[39:36] == 4'h0);
wire    zero35to32 = (dIn[35:32] == 4'h0);
wire    zero31to28 = (dIn[31:28] == 4'h0);
wire    zero27to24 = (dIn[27:24] == 4'h0);
wire    zero23to20 = (dIn[23:20] == 4'h0);
wire    ones47to44 = (dIn[47:44] == 4'hf);
wire    ones43to40 = (dIn[43:40] == 4'hf);
wire    ones39to36 = (dIn[39:36] == 4'hf);
wire    ones35to32 = (dIn[35:32] == 4'hf);
wire    ones31to28 = (dIn[31:28] == 4'hf);
wire    ones27to24 = (dIn[27:24] == 4'hf);
wire    ones23to20 = (dIn[23:20] == 4'hf);
`endif

reg             satPos,satNeg;
wire            sign = dIn[47];
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
            16: dataBits <= dIn[33:16];
            17: dataBits <= dIn[34:17];
            18: dataBits <= dIn[35:18];
            19: dataBits <= dIn[36:19];
            20: dataBits <= dIn[37:20];
            21: dataBits <= dIn[38:21];
            22: dataBits <= dIn[39:22];
            23: dataBits <= dIn[40:23];
            24: dataBits <= dIn[41:24];
            25: dataBits <= dIn[42:25];
            26: dataBits <= dIn[43:26];
            27: dataBits <= dIn[44:27];
            28: dataBits <= dIn[45:28];
            29: dataBits <= dIn[46:29];
            default: dataBits <= dIn[47:30];
            endcase
        // Check for overflow
        `ifdef FAST_COMPARE
        case (shift)
            0: begin
                satPos <= !sign && !( zero47to44 && zero43to40 && zero39to36 && zero35to32
                                   && zero31to28 && zero27to24 && zero23to20
                                   && (dIn[19:17] == 3'h0));
                satNeg <=  sign && !( ones47to44 && ones43to40 && ones39to36 && ones35to32
                                   && ones31to28 && ones27to24 && ones23to20
                                   && (dIn[19:17] == 3'h7));
                end
            1: begin
                satPos <= !sign && !( zero47to44 && zero43to40 && zero39to36 && zero35to32
                                   && zero31to28 && zero27to24 && zero23to20
                                   && (dIn[19:18] == 2'h0));
                satNeg <=  sign && !( ones47to44 && ones43to40 && ones39to36 && ones35to32
                                   && ones31to28 && ones27to24 && ones23to20
                                   && (dIn[19:18] == 2'h3));
                end
            2: begin
                satPos <= !sign && !( zero47to44 && zero43to40 && zero39to36 && zero35to32
                                   && zero31to28 && zero27to24 && zero23to20
                                   && (dIn[19] == 1'b0));
                satNeg <=  sign && !( ones47to44 && ones43to40 && ones39to36 && ones35to32
                                   && ones31to28 && ones27to24 && ones23to20
                                   && (dIn[19] == 1'b1));
                end
            3: begin
                satPos <= !sign && !( zero47to44 && zero43to40 && zero39to36 && zero35to32
                                   && zero31to28 && zero27to24 && zero23to20);
                satNeg <=  sign && !( ones47to44 && ones43to40 && ones39to36 && ones35to32
                                   && ones31to28 && ones27to24 && ones23to20);
                end
            4: begin
                satPos <= !sign && !( zero47to44 && zero43to40 && zero39to36 && zero35to32
                                   && zero31to28 && zero27to24
                                   && (dIn[23:21] == 3'h0));
                satNeg <=  sign && !( ones47to44 && ones43to40 && ones39to36 && ones35to32
                                   && ones31to28 && ones27to24
                                   && (dIn[23:21] == 3'h7));
                end
            5: begin
                satPos <= !sign && !( zero47to44 && zero43to40 && zero39to36 && zero35to32
                                   && zero31to28 && zero27to24
                                   && (dIn[23:22] == 2'h0));
                satNeg <=  sign && !( ones47to44 && ones43to40 && ones39to36 && ones35to32
                                   && ones31to28 && ones27to24
                                   && (dIn[23:22] == 2'h3));
                end
            6: begin
                satPos <= !sign && !( zero47to44 && zero43to40 && zero39to36 && zero35to32
                                   && zero31to28 && zero27to24
                                   && (dIn[23] == 1'b0));
                satNeg <=  sign && !( ones47to44 && ones43to40 && ones39to36 && ones35to32
                                   && ones31to28 && ones27to24
                                   && (dIn[23] == 1'b1));
                end
            7: begin
                satPos <= !sign && !( zero47to44 && zero43to40 && zero39to36 && zero35to32
                                   && zero31to28 && zero27to24);
                satNeg <=  sign && !( ones47to44 && ones43to40 && ones39to36 && ones35to32
                                   && ones31to28 && ones27to24);
                end
            8: begin
                satPos <= !sign && !( zero47to44 && zero43to40 && zero39to36 && zero35to32
                                   && zero31to28
                                   && (dIn[27:25] == 3'h0));
                satNeg <=  sign && !( ones47to44 && ones43to40 && ones39to36 && ones35to32
                                   && ones31to28
                                   && (dIn[27:25] == 3'h7));
                end
            9: begin
                satPos <= !sign && !( zero47to44 && zero43to40 && zero39to36 && zero35to32
                                   && zero31to28
                                   && (dIn[27:26] == 2'h0));
                satNeg <=  sign && !( ones47to44 && ones43to40 && ones39to36 && ones35to32
                                   && ones31to28
                                   && (dIn[27:26] == 2'h3));
                end
           10: begin
                satPos <= !sign && !( zero47to44 && zero43to40 && zero39to36 && zero35to32
                                   && zero31to28
                                   && (dIn[27] == 1'b0));
                satNeg <=  sign && !( ones47to44 && ones43to40 && ones39to36 && ones35to32
                                   && ones31to28
                                   && (dIn[27] == 1'b1));
                end
           11: begin
                satPos <= !sign && !( zero47to44 && zero43to40 && zero39to36 && zero35to32
                                   && zero31to28);
                satNeg <=  sign && !( ones47to44 && ones43to40 && ones39to36 && ones35to32
                                   && ones31to28);
                end
           12: begin
                satPos <= !sign && !( zero47to44 && zero43to40 && zero39to36 && zero35to32
                                   && (dIn[31:29] == 3'h0));
                satNeg <=  sign && !( ones47to44 && ones43to40 && ones39to36 && ones35to32
                                   && (dIn[31:29] == 3'h7));
                end
           13: begin
                satPos <= !sign && !( zero47to44 && zero43to40 && zero39to36 && zero35to32
                                   && (dIn[31:30] == 2'h0));
                satNeg <=  sign && !( ones47to44 && ones43to40 && ones39to36 && ones35to32
                                   && (dIn[31:30] == 2'h3));
                end
           14: begin
                satPos <= !sign && !( zero47to44 && zero43to40 && zero39to36 && zero35to32
                                   && (dIn[31] == 1'b0));
                satNeg <=  sign && !( ones47to44 && ones43to40 && ones39to36 && ones35to32
                                   && (dIn[31] == 1'b1));
                end
           15: begin
                satPos <= !sign && !( zero47to44 && zero43to40 && zero39to36 && zero35to32);
                satNeg <=  sign && !( ones47to44 && ones43to40 && ones39to36 && ones35to32);
                end
           16: begin
                satPos <= !sign && !( zero47to44 && zero43to40 && zero39to36
                                   && (dIn[35:33] == 3'h0));
                satNeg <=  sign && !( ones47to44 && ones43to40 && ones39to36
                                   && (dIn[35:33] == 3'h7));
                end
           17: begin
                satPos <= !sign && !( zero47to44 && zero43to40 && zero39to36
                                   && (dIn[35:34] == 2'h0));
                satNeg <=  sign && !( ones47to44 && ones43to40 && ones39to36
                                   && (dIn[35:34] == 2'h3));
                end
           18: begin
                satPos <= !sign && !( zero47to44 && zero43to40 && zero39to36
                                   && (dIn[35] == 1'b0));
                satNeg <=  sign && !( ones47to44 && ones43to40 && ones39to36
                                   && (dIn[35] == 1'b1));
                end
           19: begin
                satPos <= !sign && !( zero47to44 && zero43to40 && zero39to36);
                satNeg <=  sign && !( ones47to44 && ones43to40 && ones39to36);
                end
           20: begin
                satPos <= !sign && !( zero47to44 && zero43to40
                                   && (dIn[39:37] == 3'h0));
                satNeg <=  sign && !( ones47to44 && ones43to40
                                   && (dIn[39:37] == 3'h7));
                end
           21: begin
                satPos <= !sign && !( zero47to44 && zero43to40
                                   && (dIn[39:38] == 2'h0));
                satNeg <=  sign && !( ones47to44 && ones43to40
                                   && (dIn[39:38] == 2'h3));
                end
           22: begin
                satPos <= !sign && !( zero47to44 && zero43to40
                                   && (dIn[39] == 1'b0));
                satNeg <=  sign && !( ones47to44 && ones43to40
                                   && (dIn[39] == 1'b1));
                end
           23: begin
                satPos <= !sign && !( zero47to44 && zero43to40);
                satNeg <=  sign && !( ones47to44 && ones43to40);
                end
           24: begin
                satPos <= !sign && !( zero47to44
                                   && (dIn[43:41] == 3'h0));
                satNeg <=  sign && !( ones47to44 && ones43to40
                                   && (dIn[43:41] == 3'h7));
                end
           25: begin
                satPos <= !sign && !( zero47to44
                                   && (dIn[43:42] == 2'h0));
                satNeg <=  sign && !( ones47to44
                                   && (dIn[43:42] == 2'h3));
                end
           26: begin
                satPos <= !sign && !( zero47to44
                                   && (dIn[43] == 1'b0));
                satNeg <=  sign && !( ones47to44
                                   && (dIn[43] == 1'b1));
                end
           27: begin
                satPos <= !sign && !zero47to44;
                satNeg <=  sign && !ones47to44;
                end
           28: begin
                satPos <= !sign && (dIn[47:45] !=  3'h0);
                satNeg <=  sign && (dIn[47:45] !=  3'h7);
                end
           29: begin
                satPos <= !sign && (dIn[47:46] !=  2'h0);
                satNeg <=  sign && (dIn[47:46] !=  2'h3);
                end
           default: begin
                satPos <= 0;
                satNeg <= 0;
                end
            endcase
        `else
        case (shift)
            0: begin
                satPos <= !sign && (dIn[47:17] != 31'h0000_0000);
                satNeg <=  sign && (dIn[47:17] != 31'h7fff_ffff);
                end
            1: begin
                satPos <= !sign && (dIn[47:18] != 30'h0000_0000);
                satNeg <=  sign && (dIn[47:18] != 30'h3fff_ffff);
                end
            2: begin
                satPos <= !sign && (dIn[47:19] != 29'h0000_0000);
                satNeg <=  sign && (dIn[47:19] != 29'h1fff_ffff);
                end
            3: begin
                satPos <= !sign && (dIn[47:20] != 28'h000_0000);
                satNeg <=  sign && (dIn[47:20] != 28'hfff_ffff);
                end
            4: begin
                satPos <= !sign && (dIn[47:21] != 27'h000_0000);
                satNeg <=  sign && (dIn[47:21] != 27'h7ff_ffff);
                end
            5: begin
                satPos <= !sign && (dIn[47:22] != 26'h000_0000);
                satNeg <=  sign && (dIn[47:22] != 26'h3ff_ffff);
                end
            6: begin
                satPos <= !sign && (dIn[47:23] != 25'h00_0000);
                satNeg <=  sign && (dIn[47:23] != 25'h1ff_ffff);
                end
            7: begin
                satPos <= !sign && (dIn[47:24] != 24'h00_0000);
                satNeg <=  sign && (dIn[47:24] != 24'hff_ffff);
                end
            8: begin
                satPos <= !sign && (dIn[47:25] != 23'h00_0000);
                satNeg <=  sign && (dIn[47:25] != 23'h7f_ffff);
                end
            9: begin
                satPos <= !sign && (dIn[47:26] != 22'h00_0000);
                satNeg <=  sign && (dIn[47:26] != 22'h3f_ffff);
                end
           10: begin
                satPos <= !sign && (dIn[47:27] != 21'h00_0000);
                satNeg <=  sign && (dIn[47:27] != 21'h1f_ffff);
                end
           11: begin
                satPos <= !sign && (dIn[47:28] != 20'h0_0000);
                satNeg <=  sign && (dIn[47:28] != 20'hf_ffff);
                end
           12: begin
                satPos <= !sign && (dIn[47:29] != 19'h0_0000);
                satNeg <=  sign && (dIn[47:29] != 19'h7_ffff);
                end
           13: begin
                satPos <= !sign && (dIn[47:30] != 18'h0_0000);
                satNeg <=  sign && (dIn[47:30] != 18'h3_ffff);
                end
           14: begin
                satPos <= !sign && (dIn[47:31] != 17'h0_0000);
                satNeg <=  sign && (dIn[47:31] != 17'h1_ffff);
                end
           15: begin
                satPos <= !sign && (dIn[47:32] != 16'h0000);
                satNeg <=  sign && (dIn[47:32] != 16'hffff);
                end
           16: begin
                satPos <= !sign && (dIn[47:33] != 15'h0000);
                satNeg <=  sign && (dIn[47:33] != 15'h7fff);
                end
           17: begin
                satPos <= !sign && (dIn[47:34] != 14'h0000);
                satNeg <=  sign && (dIn[47:34] != 14'h3fff);
                end
           18: begin
                satPos <= !sign && (dIn[47:35] != 13'h000);
                satNeg <=  sign && (dIn[47:35] != 13'h1fff);
                end
           19: begin
                satPos <= !sign && (dIn[47:36] != 12'h000);
                satNeg <=  sign && (dIn[47:36] != 12'hfff);
                end
           20: begin
                satPos <= !sign && (dIn[47:37] != 11'h000);
                satNeg <=  sign && (dIn[47:37] != 11'h7ff);
                end
           21: begin
                satPos <= !sign && (dIn[47:38] != 10'h000);
                satNeg <=  sign && (dIn[47:38] != 10'h3ff);
                end
           22: begin
                satPos <= !sign && (dIn[47:39] !=  9'h00);
                satNeg <=  sign && (dIn[47:39] !=  9'h1ff);
                end
           23: begin
                satPos <= !sign && (dIn[47:40] !=  8'h00);
                satNeg <=  sign && (dIn[47:40] !=  8'hff);
                end
           24: begin
                satPos <= !sign && (dIn[47:41] !=  7'h00);
                satNeg <=  sign && (dIn[47:41] !=  7'h7f);
                end
           25: begin
                satPos <= !sign && (dIn[47:42] !=  6'h00);
                satNeg <=  sign && (dIn[47:42] !=  6'h3f);
                end
           26: begin
                satPos <= !sign && (dIn[47:43] !=  5'h0);
                satNeg <=  sign && (dIn[47:43] !=  5'h1f);
                end
           27: begin
                satPos <= !sign && (dIn[47:44] !=  4'h0);
                satNeg <=  sign && (dIn[47:44] !=  4'hf);
                end
           28: begin
                satPos <= !sign && (dIn[47:45] !=  3'h0);
                satNeg <=  sign && (dIn[47:45] !=  3'h7);
                end
           29: begin
                satPos <= !sign && (dIn[47:46] !=  2'h0);
                satNeg <=  sign && (dIn[47:46] !=  2'h3);
                end
            default: begin
                satPos <= 0;
                satNeg <= 0;
                end
            endcase
        `endif
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
