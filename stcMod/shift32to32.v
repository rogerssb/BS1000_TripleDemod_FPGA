`timescale 1ns/100ps

module shift32to32(
    input               clk,clkEn,
    input       [3:0]   shift,
    input       [31:0]  dIn,
    output  reg [31:0]  dOut
);

    always @(posedge clk) begin
        if (clkEn) begin
            // Extract the bit field
            case (shift)
                 0: dOut <= dIn;
                 1: dOut <= {{ 1{dIn[31]}},dIn[31: 1]};
                 2: dOut <= {{ 2{dIn[31]}},dIn[31: 2]};
                 3: dOut <= {{ 3{dIn[31]}},dIn[31: 3]};
                 4: dOut <= {{ 4{dIn[31]}},dIn[31: 4]};
                 5: dOut <= {{ 5{dIn[31]}},dIn[31: 5]};
                 6: dOut <= {{ 6{dIn[31]}},dIn[31: 6]};
                 7: dOut <= {{ 7{dIn[31]}},dIn[31: 7]};
                 8: dOut <= {{ 8{dIn[31]}},dIn[31: 8]};
                 9: dOut <= {{ 9{dIn[31]}},dIn[31: 9]};
                10: dOut <= {{10{dIn[31]}},dIn[31:10]};
                11: dOut <= {{11{dIn[31]}},dIn[31:11]};
                12: dOut <= {{12{dIn[31]}},dIn[31:12]};
                13: dOut <= {{13{dIn[31]}},dIn[31:13]};
                14: dOut <= {{14{dIn[31]}},dIn[31:14]};
                15: dOut <= {{15{dIn[31]}},dIn[31:15]};
            endcase
        end
    end

endmodule

