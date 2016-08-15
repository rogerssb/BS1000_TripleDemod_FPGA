`timescale 1ns/100ps

module unsignedShiftAndSaturate33to5(
    input              clk, 
    input              clkEn,
    input      [2:0]   shift,
    input      [33:0]  dIn,
    output reg [4:0]   dOut
    );

reg                 saturate;
reg         [4:0]   dataBits;
always @(posedge clk) begin
    if (clkEn) begin
        // Extract the bit field 
        case (shift)
             0: dataBits <= dIn[32:28];
             1: dataBits <= dIn[31:27];
             2: dataBits <= dIn[30:26];
             3: dataBits <= dIn[29:25];
             4: dataBits <= dIn[28:24];
             5: dataBits <= dIn[27:23];
             6: dataBits <= dIn[26:22];
             7: dataBits <= dIn[25:21];
            default:
                dataBits <= dIn[32:28];
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
            dOut <= 5'h1f;
            end
        else begin
            dOut <= dataBits;
            end
        end
    end

endmodule
