`timescale 1ns / 10 ps

module leadGain (
    clk, clkEn, reset, 
    error,
    leadExp,
    leadError
    );

input           clk, clkEn, reset;
input   [7:0]   error;
input   [4:0]   leadExp;

output  [31:0]  leadError;
reg     [31:0]  leadError;

/*************************** Lead Gain Section ********************************/

always @(posedge clk) begin
    if (reset) begin
        leadError <= 0;
        end
    else if (clkEn) begin
        if (leadExp == 5'h00) begin
            leadError <= 0;
            end
        else begin
            leadError[31] <= error[7];
            case(leadExp)
                5'h00: leadError[30:0] <= {{31{error[7]}}};
                5'h01: leadError[30:0] <= {{30{error[7]}},error[6]};
                5'h02: leadError[30:0] <= {{29{error[7]}},error[6:5]};
                5'h03: leadError[30:0] <= {{28{error[7]}},error[6:4]};
                5'h04: leadError[30:0] <= {{27{error[7]}},error[6:3]};
                5'h05: leadError[30:0] <= {{26{error[7]}},error[6:2]};
                5'h06: leadError[30:0] <= {{25{error[7]}},error[6:1]};
                5'h07: leadError[30:0] <= {{24{error[7]}},error[6:0]};
                5'h08: leadError[30:0] <= {{23{error[7]}},error[6:0],{1{error[7]}}};
                5'h09: leadError[30:0] <= {{22{error[7]}},error[6:0],{2{error[7]}}};
                5'h0A: leadError[30:0] <= {{21{error[7]}},error[6:0],{3{error[7]}}};
                5'h0B: leadError[30:0] <= {{20{error[7]}},error[6:0],{4{error[7]}}};
                5'h0C: leadError[30:0] <= {{19{error[7]}},error[6:0],{5{error[7]}}};
                5'h0D: leadError[30:0] <= {{18{error[7]}},error[6:0],{6{error[7]}}};
                5'h0E: leadError[30:0] <= {{17{error[7]}},error[6:0],{7{error[7]}}};
                5'h0F: leadError[30:0] <= {{16{error[7]}},error[6:0],{8{error[7]}}};
                5'h10: leadError[30:0] <= {{15{error[7]}},error[6:0],{9{error[7]}}};
                5'h11: leadError[30:0] <= {{14{error[7]}},error[6:0],{10{error[7]}}};
                5'h12: leadError[30:0] <= {{13{error[7]}},error[6:0],{11{error[7]}}};
                5'h13: leadError[30:0] <= {{12{error[7]}},error[6:0],{12{error[7]}}};
                5'h14: leadError[30:0] <= {{11{error[7]}},error[6:0],{13{error[7]}}};
                5'h15: leadError[30:0] <= {{10{error[7]}},error[6:0],{14{error[7]}}};
                5'h16: leadError[30:0] <= {{09{error[7]}},error[6:0],{15{error[7]}}};
                5'h17: leadError[30:0] <= {{08{error[7]}},error[6:0],{16{error[7]}}};
                5'h18: leadError[30:0] <= {{07{error[7]}},error[6:0],{17{error[7]}}};
                5'h19: leadError[30:0] <= {{06{error[7]}},error[6:0],{18{error[7]}}};
                5'h1A: leadError[30:0] <= {{05{error[7]}},error[6:0],{19{error[7]}}};
                5'h1B: leadError[30:0] <= {{04{error[7]}},error[6:0],{20{error[7]}}};
                5'h1C: leadError[30:0] <= {{03{error[7]}},error[6:0],{21{error[7]}}};
                5'h1D: leadError[30:0] <= {{02{error[7]}},error[6:0],{22{error[7]}}};
                5'h1E: leadError[30:0] <= {{01{error[7]}},error[6:0],{23{error[7]}}};
                5'h1F: leadError[30:0] <= {error[6:0],{24{error[7]}}};
                endcase
            end
        end
    end

endmodule
