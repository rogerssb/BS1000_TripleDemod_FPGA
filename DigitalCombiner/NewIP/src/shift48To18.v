/******************************************************************************
Copyright 2008-2015 Koos Technical Services, Inc. All Rights Reserved

This source code is the Intellectual Property of Koos Technical Services,Inc. 
(KTS) and is provided under a License Agreement which protects KTS' ownership and
derivative rights in exchange for negotiated compensation.
******************************************************************************/

`timescale 1ns/100ps

module shift48to18(
    input                       clk, clkEn,
    input               [4:0]   shift,
    input       signed  [47:0]  dIn,
    output  reg signed  [17:0]  dOut
    );

    reg signed  [17:0]  dataBits;
    reg                 zero47to44,ones47to44;
    reg                 zero43to40,ones43to40;
    reg                 zero39to36,ones39to36;
    reg                 zero35to32,ones35to32;
    reg                 zero31to28,ones31to28;
    reg                 zero27to24,ones27to24;
    reg                 zero23to20,ones23to20;
    reg                 zero19to16,ones19to16;

    reg                 satPos,satNeg;
    reg                 sign;
    reg signed  [47:0]  dInDelayed;
    always @(posedge clk) begin
        if (clkEn) begin
            sign <= dIn[47];
            zero47to44 <= (dIn[47:44] == 4'h0);
            zero43to40 <= (dIn[43:40] == 4'h0);
            zero39to36 <= (dIn[39:36] == 4'h0);
            zero35to32 <= (dIn[35:32] == 4'h0);
            zero31to28 <= (dIn[31:28] == 4'h0);
            zero27to24 <= (dIn[27:24] == 4'h0);
            zero23to20 <= (dIn[23:20] == 4'h0);
            ones47to44 <= (dIn[47:44] == 4'hf);
            ones43to40 <= (dIn[43:40] == 4'hf);
            ones39to36 <= (dIn[39:36] == 4'hf);
            ones35to32 <= (dIn[35:32] == 4'hf);
            ones31to28 <= (dIn[31:28] == 4'hf);
            ones27to24 <= (dIn[27:24] == 4'hf);
            ones23to20 <= (dIn[23:20] == 4'hf);
            dInDelayed <= dIn;

            // Extract the bit field 
            case (shift)
                 0: dataBits <= $signed(dInDelayed[17:0]);
                 1: dataBits <= $signed(dInDelayed[18:1]);
                 2: dataBits <= $signed(dInDelayed[19:2]);
                 3: dataBits <= $signed(dInDelayed[20:3]);
                 4: dataBits <= $signed(dInDelayed[21:4]);
                 5: dataBits <= $signed(dInDelayed[22:5]);
                 6: dataBits <= $signed(dInDelayed[23:6]);
                 7: dataBits <= $signed(dInDelayed[24:7]);
                 8: dataBits <= $signed(dInDelayed[25:8]);
                 9: dataBits <= $signed(dInDelayed[26:9]);
                10: dataBits <= $signed(dInDelayed[27:10]);
                11: dataBits <= $signed(dInDelayed[28:11]);
                12: dataBits <= $signed(dInDelayed[29:12]);
                13: dataBits <= $signed(dInDelayed[30:13]);
                14: dataBits <= $signed(dInDelayed[31:14]);
                15: dataBits <= $signed(dInDelayed[32:15]);
                16: dataBits <= $signed(dInDelayed[33:16]);
                17: dataBits <= $signed(dInDelayed[34:17]);
                18: dataBits <= $signed(dInDelayed[35:18]);
                19: dataBits <= $signed(dInDelayed[36:19]);
                20: dataBits <= $signed(dInDelayed[37:20]);
                21: dataBits <= $signed(dInDelayed[38:21]);
                22: dataBits <= $signed(dInDelayed[39:22]);
                23: dataBits <= $signed(dInDelayed[40:23]);
                24: dataBits <= $signed(dInDelayed[41:24]);
                25: dataBits <= $signed(dInDelayed[42:25]);
                26: dataBits <= $signed(dInDelayed[43:26]);
                27: dataBits <= $signed(dInDelayed[44:27]);
                28: dataBits <= $signed(dInDelayed[45:28]);
                29: dataBits <= $signed(dInDelayed[46:29]);
                default: dataBits <= $signed(dInDelayed[47:30]);
            endcase

            // Check for overflow
            case (shift)
                0: begin
                    satPos <= !sign && !( zero47to44 && zero43to40 && zero39to36 && zero35to32
                                       && zero31to28 && zero27to24 && zero23to20
                                       && (dInDelayed[19:17] == 3'h0));
                    satNeg <=  sign && !( ones47to44 && ones43to40 && ones39to36 && ones35to32
                                       && ones31to28 && ones27to24 && ones23to20
                                       && (dInDelayed[19:17] == 3'h7));
                end
                1: begin
                    satPos <= !sign && !( zero47to44 && zero43to40 && zero39to36 && zero35to32
                                       && zero31to28 && zero27to24 && zero23to20
                                       && (dInDelayed[19:18] == 2'h0));
                    satNeg <=  sign && !( ones47to44 && ones43to40 && ones39to36 && ones35to32
                                       && ones31to28 && ones27to24 && ones23to20
                                       && (dInDelayed[19:18] == 2'h3));
                end
                2: begin
                    satPos <= !sign && !( zero47to44 && zero43to40 && zero39to36 && zero35to32
                                       && zero31to28 && zero27to24 && zero23to20
                                       && (dInDelayed[19] == 1'b0));
                    satNeg <=  sign && !( ones47to44 && ones43to40 && ones39to36 && ones35to32
                                       && ones31to28 && ones27to24 && ones23to20
                                       && (dInDelayed[19] == 1'b1));
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
                                       && (dInDelayed[23:21] == 3'h0));
                    satNeg <=  sign && !( ones47to44 && ones43to40 && ones39to36 && ones35to32
                                       && ones31to28 && ones27to24
                                       && (dInDelayed[23:21] == 3'h7));
                end
                5: begin
                    satPos <= !sign && !( zero47to44 && zero43to40 && zero39to36 && zero35to32
                                       && zero31to28 && zero27to24
                                       && (dInDelayed[23:22] == 2'h0));
                    satNeg <=  sign && !( ones47to44 && ones43to40 && ones39to36 && ones35to32
                                       && ones31to28 && ones27to24
                                       && (dInDelayed[23:22] == 2'h3));
                end
                6: begin
                    satPos <= !sign && !( zero47to44 && zero43to40 && zero39to36 && zero35to32
                                       && zero31to28 && zero27to24
                                       && (dInDelayed[23] == 1'b0));
                    satNeg <=  sign && !( ones47to44 && ones43to40 && ones39to36 && ones35to32
                                       && ones31to28 && ones27to24
                                       && (dInDelayed[23] == 1'b1));
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
                                       && (dInDelayed[27:25] == 3'h0));
                    satNeg <=  sign && !( ones47to44 && ones43to40 && ones39to36 && ones35to32
                                       && ones31to28
                                       && (dInDelayed[27:25] == 3'h7));
                end
                9: begin
                    satPos <= !sign && !( zero47to44 && zero43to40 && zero39to36 && zero35to32
                                       && zero31to28
                                       && (dInDelayed[27:26] == 2'h0));
                    satNeg <=  sign && !( ones47to44 && ones43to40 && ones39to36 && ones35to32
                                       && ones31to28
                                       && (dInDelayed[27:26] == 2'h3));
                end
               10: begin
                    satPos <= !sign && !( zero47to44 && zero43to40 && zero39to36 && zero35to32
                                       && zero31to28
                                       && (dInDelayed[27] == 1'b0));
                    satNeg <=  sign && !( ones47to44 && ones43to40 && ones39to36 && ones35to32
                                       && ones31to28
                                       && (dInDelayed[27] == 1'b1));
                end
               11: begin
                    satPos <= !sign && !( zero47to44 && zero43to40 && zero39to36 && zero35to32
                                       && zero31to28);
                    satNeg <=  sign && !( ones47to44 && ones43to40 && ones39to36 && ones35to32
                                       && ones31to28);
                end
               12: begin
                    satPos <= !sign && !( zero47to44 && zero43to40 && zero39to36 && zero35to32
                                       && (dInDelayed[31:29] == 3'h0));
                    satNeg <=  sign && !( ones47to44 && ones43to40 && ones39to36 && ones35to32
                                       && (dInDelayed[31:29] == 3'h7));
                end
               13: begin
                    satPos <= !sign && !( zero47to44 && zero43to40 && zero39to36 && zero35to32
                                       && (dInDelayed[31:30] == 2'h0));
                    satNeg <=  sign && !( ones47to44 && ones43to40 && ones39to36 && ones35to32
                                       && (dInDelayed[31:30] == 2'h3));
                end
               14: begin
                    satPos <= !sign && !( zero47to44 && zero43to40 && zero39to36 && zero35to32
                                       && (dInDelayed[31] == 1'b0));
                    satNeg <=  sign && !( ones47to44 && ones43to40 && ones39to36 && ones35to32
                                       && (dInDelayed[31] == 1'b1));
                end
               15: begin
                    satPos <= !sign && !( zero47to44 && zero43to40 && zero39to36 && zero35to32);
                    satNeg <=  sign && !( ones47to44 && ones43to40 && ones39to36 && ones35to32);
                end
               16: begin
                    satPos <= !sign && !( zero47to44 && zero43to40 && zero39to36
                                       && (dInDelayed[35:33] == 3'h0));
                    satNeg <=  sign && !( ones47to44 && ones43to40 && ones39to36
                                       && (dInDelayed[35:33] == 3'h7));
                end
               17: begin
                    satPos <= !sign && !( zero47to44 && zero43to40 && zero39to36
                                       && (dInDelayed[35:34] == 2'h0));
                    satNeg <=  sign && !( ones47to44 && ones43to40 && ones39to36
                                       && (dInDelayed[35:34] == 2'h3));
                end
               18: begin
                    satPos <= !sign && !( zero47to44 && zero43to40 && zero39to36
                                       && (dInDelayed[35] == 1'b0));
                    satNeg <=  sign && !( ones47to44 && ones43to40 && ones39to36
                                       && (dInDelayed[35] == 1'b1));
                end
               19: begin
                    satPos <= !sign && !( zero47to44 && zero43to40 && zero39to36);
                    satNeg <=  sign && !( ones47to44 && ones43to40 && ones39to36);
                end
               20: begin
                    satPos <= !sign && !( zero47to44 && zero43to40
                                       && (dInDelayed[39:37] == 3'h0));
                    satNeg <=  sign && !( ones47to44 && ones43to40
                                       && (dInDelayed[39:37] == 3'h7));
                end
               21: begin
                    satPos <= !sign && !( zero47to44 && zero43to40
                                       && (dInDelayed[39:38] == 2'h0));
                    satNeg <=  sign && !( ones47to44 && ones43to40
                                       && (dInDelayed[39:38] == 2'h3));
                end
               22: begin
                    satPos <= !sign && !( zero47to44 && zero43to40
                                       && (dInDelayed[39] == 1'b0));
                    satNeg <=  sign && !( ones47to44 && ones43to40
                                       && (dInDelayed[39] == 1'b1));
                end
               23: begin
                    satPos <= !sign && !( zero47to44 && zero43to40);
                    satNeg <=  sign && !( ones47to44 && ones43to40);
                end
               24: begin
                    satPos <= !sign && !( zero47to44
                                       && (dInDelayed[43:41] == 3'h0));
                    satNeg <=  sign && !( ones47to44 && ones43to40
                                       && (dInDelayed[43:41] == 3'h7));
                end
               25: begin
                    satPos <= !sign && !( zero47to44
                                       && (dInDelayed[43:42] == 2'h0));
                    satNeg <=  sign && !( ones47to44
                                       && (dInDelayed[43:42] == 2'h3));
                end
               26: begin
                    satPos <= !sign && !( zero47to44
                                       && (dInDelayed[43] == 1'b0));
                    satNeg <=  sign && !( ones47to44
                                       && (dInDelayed[43] == 1'b1));
                end
               27: begin
                    satPos <= !sign && !zero47to44;
                    satNeg <=  sign && !ones47to44;
                end
               28: begin
                    satPos <= !sign && (dInDelayed[47:45] !=  3'h0);
                    satNeg <=  sign && (dInDelayed[47:45] !=  3'h7);
                end
               29: begin
                    satPos <= !sign && (dInDelayed[47:46] !=  2'h0);
                    satNeg <=  sign && (dInDelayed[47:46] !=  2'h3);
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
