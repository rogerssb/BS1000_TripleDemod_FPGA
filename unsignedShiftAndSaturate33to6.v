`timescale 1ns/100ps

module unsignedShiftAndSaturate33to6(
    input              clk, 
    input              clkEn,
    input      [2:0]   shift,
    input      [33:0]  dIn,
    output reg [5:0]   dOut
    );

reg                 saturate;
reg         [5:0]   dataBits;
always @(posedge clk) begin
    if (clkEn) begin
        // Extract the bit field 
        case (shift)
             0: dataBits <= dIn[32:27];
             1: dataBits <= dIn[31:26];
             2: dataBits <= dIn[30:25];
             3: dataBits <= dIn[29:24];
             4: dataBits <= dIn[28:23];
             5: dataBits <= dIn[27:22];
             6: dataBits <= dIn[26:21];
             7: dataBits <= dIn[25:20];
            default:
                dataBits <= dIn[32:27];
            endcase
        // Check for overflow
        case (shift)
            0: begin
                saturate <= (dIn[33:33] != 1'h0);
                end
            1: begin
                saturate <= (dIn[33:32] != 2'h0);
                end
            2: begin
                saturate <= (dIn[33:31] != 3'h0);
                end
            3: begin
                saturate <= (dIn[33:30] != 4'h0);
                end
            4: begin
                saturate <= (dIn[33:29] != 5'h0);
                end
            5: begin
                saturate <= (dIn[33:28] != 6'h0);
                end
            6: begin
                saturate <= (dIn[33:27] != 7'h0);
                end
            7: begin
                saturate <= (dIn[33:26] != 8'h0);
                end
            default: begin
                saturate <= 0;
                end
            endcase
        // Final output
        if (saturate) begin
            dOut <= 5'h3f;
            end
        else begin
            dOut <= dataBits;
            end
        end
    end

endmodule
