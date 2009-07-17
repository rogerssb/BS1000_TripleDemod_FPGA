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

output  [39:0]  leadError;
reg     [39:0]  leadError;

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
            leadError[39] <= error[7];
            case(leadExp)
                `define USE_ZEROS
                `ifdef USE_ZEROS
                5'h00: leadError[38:0] <= 39'h0;
                5'h01: leadError[38:0] <= {{30{error[7]}},error[6:0],{2'b0}};
                5'h02: leadError[38:0] <= {{29{error[7]}},error[6:0],{3'b0}};
                5'h03: leadError[38:0] <= {{28{error[7]}},error[6:0],{4'b0}};
                5'h04: leadError[38:0] <= {{27{error[7]}},error[6:0],{5'b0}};
                5'h05: leadError[38:0] <= {{26{error[7]}},error[6:0],{6'b0}};
                5'h06: leadError[38:0] <= {{25{error[7]}},error[6:0],{7'b0}};
                5'h07: leadError[38:0] <= {{24{error[7]}},error[6:0],{8'b0}};
                5'h08: leadError[38:0] <= {{23{error[7]}},error[6:0],{9'b0}};
                5'h09: leadError[38:0] <= {{22{error[7]}},error[6:0],{10'b0}};
                5'h0A: leadError[38:0] <= {{21{error[7]}},error[6:0],{11'b0}};
                5'h0B: leadError[38:0] <= {{20{error[7]}},error[6:0],{12'b0}};
                5'h0C: leadError[38:0] <= {{19{error[7]}},error[6:0],{13'b0}};
                5'h0D: leadError[38:0] <= {{18{error[7]}},error[6:0],{14'b0}};
                5'h0E: leadError[38:0] <= {{17{error[7]}},error[6:0],{15'b0}};
                5'h0F: leadError[38:0] <= {{16{error[7]}},error[6:0],{16'b0}};
                5'h10: leadError[38:0] <= {{15{error[7]}},error[6:0],{17'b0}};
                5'h11: leadError[38:0] <= {{14{error[7]}},error[6:0],{18'b0}};
                5'h12: leadError[38:0] <= {{13{error[7]}},error[6:0],{19'b0}};
                5'h13: leadError[38:0] <= {{12{error[7]}},error[6:0],{20'b0}};
                5'h14: leadError[38:0] <= {{11{error[7]}},error[6:0],{21'b0}};
                5'h15: leadError[38:0] <= {{10{error[7]}},error[6:0],{22'b0}};
                5'h16: leadError[38:0] <= {{09{error[7]}},error[6:0],{23'b0}};
                5'h17: leadError[38:0] <= {{08{error[7]}},error[6:0],{24'b0}};
                5'h18: leadError[38:0] <= {{07{error[7]}},error[6:0],{25'b0}};
                5'h19: leadError[38:0] <= {{06{error[7]}},error[6:0],{26'b0}};
                5'h1A: leadError[38:0] <= {{05{error[7]}},error[6:0],{27'b0}};
                5'h1B: leadError[38:0] <= {{04{error[7]}},error[6:0],{28'b0}};
                5'h1C: leadError[38:0] <= {{03{error[7]}},error[6:0],{29'b0}};
                5'h1D: leadError[38:0] <= {{02{error[7]}},error[6:0],{30'b0}};
                5'h1E: leadError[38:0] <= {{01{error[7]}},error[6:0],{31'b0}};
                5'h1F: leadError[38:0] <= {error[6:0],{32'b0}};
                `else
                5'h00: leadError[38:0] <= 39'h0;
                5'h01: leadError[38:0] <= {{30{error[7]}},error[6:0],{2{error[7]}}};
                5'h02: leadError[38:0] <= {{29{error[7]}},error[6:0],{3{error[7]}}};
                5'h03: leadError[38:0] <= {{28{error[7]}},error[6:0],{4{error[7]}}};
                5'h04: leadError[38:0] <= {{27{error[7]}},error[6:0],{5{error[7]}}};
                5'h05: leadError[38:0] <= {{26{error[7]}},error[6:0],{6{error[7]}}};
                5'h06: leadError[38:0] <= {{25{error[7]}},error[6:0],{7{error[7]}}};
                5'h07: leadError[38:0] <= {{24{error[7]}},error[6:0],{8{error[7]}}};
                5'h08: leadError[38:0] <= {{23{error[7]}},error[6:0],{9{error[7]}}};
                5'h09: leadError[38:0] <= {{22{error[7]}},error[6:0],{10{error[7]}}};
                5'h0A: leadError[38:0] <= {{21{error[7]}},error[6:0],{11{error[7]}}};
                5'h0B: leadError[38:0] <= {{20{error[7]}},error[6:0],{12{error[7]}}};
                5'h0C: leadError[38:0] <= {{19{error[7]}},error[6:0],{13{error[7]}}};
                5'h0D: leadError[38:0] <= {{18{error[7]}},error[6:0],{14{error[7]}}};
                5'h0E: leadError[38:0] <= {{17{error[7]}},error[6:0],{15{error[7]}}};
                5'h0F: leadError[38:0] <= {{16{error[7]}},error[6:0],{16{error[7]}}};
                5'h10: leadError[38:0] <= {{15{error[7]}},error[6:0],{17{error[7]}}};
                5'h11: leadError[38:0] <= {{14{error[7]}},error[6:0],{18{error[7]}}};
                5'h12: leadError[38:0] <= {{13{error[7]}},error[6:0],{19{error[7]}}};
                5'h13: leadError[38:0] <= {{12{error[7]}},error[6:0],{20{error[7]}}};
                5'h14: leadError[38:0] <= {{11{error[7]}},error[6:0],{21{error[7]}}};
                5'h15: leadError[38:0] <= {{10{error[7]}},error[6:0],{22{error[7]}}};
                5'h16: leadError[38:0] <= {{09{error[7]}},error[6:0],{23{error[7]}}};
                5'h17: leadError[38:0] <= {{08{error[7]}},error[6:0],{24{error[7]}}};
                5'h18: leadError[38:0] <= {{07{error[7]}},error[6:0],{25{error[7]}}};
                5'h19: leadError[38:0] <= {{06{error[7]}},error[6:0],{26{error[7]}}};
                5'h1A: leadError[38:0] <= {{05{error[7]}},error[6:0],{27{error[7]}}};
                5'h1B: leadError[38:0] <= {{04{error[7]}},error[6:0],{28{error[7]}}};
                5'h1C: leadError[38:0] <= {{03{error[7]}},error[6:0],{29{error[7]}}};
                5'h1D: leadError[38:0] <= {{02{error[7]}},error[6:0],{30{error[7]}}};
                5'h1E: leadError[38:0] <= {{01{error[7]}},error[6:0],{31{error[7]}}};
                5'h1F: leadError[38:0] <= {error[6:0],{32{error[7]}}};
                `endif
                endcase
            end
        end
    end

endmodule
