`timescale 1ns / 10 ps

module dcLoopFilter (
    clk, clkEn, reset, 
    error,
    lagExp,
    clearAccum,
    lagAccum
    );

input           clk, clkEn, reset;
input   [33:0]  error;
input   [4:0]   lagExp;
input           clearAccum;

output  [39:0]  lagAccum;
reg     [39:0]  lagAccum;

/*************************** Lag Gain Section ********************************/

    reg     [39:0]  lagError;
    always @(posedge clk) begin
        if (reset) begin
            lagError <= 0;
        end
        else if (clkEn) begin
            case(lagExp)
                5'h00: lagError <= 40'h0;
                5'h01: lagError <= {{30{error[33]}},error[33:24]};  
                5'h02: lagError <= {{29{error[33]}},error[33:23]};  
                5'h03: lagError <= {{28{error[33]}},error[33:22]};  
                5'h04: lagError <= {{27{error[33]}},error[33:21]};  
                5'h05: lagError <= {{26{error[33]}},error[33:20]};  
                5'h06: lagError <= {{25{error[33]}},error[33:19]};  
                5'h07: lagError <= {{24{error[33]}},error[33:18]};  
                5'h08: lagError <= {{23{error[33]}},error[33:17]};  
                5'h09: lagError <= {{22{error[33]}},error[33:16]}; 
                5'h0A: lagError <= {{21{error[33]}},error[33:15]}; 
                5'h0B: lagError <= {{20{error[33]}},error[33:14]}; 
                5'h0C: lagError <= {{19{error[33]}},error[33:13]}; 
                5'h0D: lagError <= {{18{error[33]}},error[33:12]}; 
                5'h0E: lagError <= {{17{error[33]}},error[33:11]}; 
                5'h0F: lagError <= {{16{error[33]}},error[33:10]}; 
                5'h10: lagError <= {{15{error[33]}},error[33:9]}; 
                5'h11: lagError <= {{14{error[33]}},error[33:8]}; 
                5'h12: lagError <= {{13{error[33]}},error[33:7]}; 
                5'h13: lagError <= {{12{error[33]}},error[33:6]}; 
                5'h14: lagError <= {{11{error[33]}},error[33:5]}; 
                5'h15: lagError <= {{10{error[33]}},error[33:4]}; 
                5'h16: lagError <= {{09{error[33]}},error[33:3]}; 
                5'h17: lagError <= {{08{error[33]}},error[33:2]}; 
                5'h18: lagError <= {{07{error[33]}},error[33:1]}; 
                5'h19: lagError <= {{06{error[33]}},error}; 
                5'h1A: lagError <= {{05{error[33]}},error,{1'h0}}; 
                5'h1B: lagError <= {{04{error[33]}},error,{2'h0}}; 
                5'h1C: lagError <= {{03{error[33]}},error,{3'h0}}; 
                5'h1D: lagError <= {{02{error[33]}},error,{4'h0}}; 
                5'h1E: lagError <= {{01{error[33]}},error,{5'h0}}; 
                5'h1F: lagError <= {error,{6'h0}};                
            endcase
        end
    end

    wire    [40:0]  sum = {1'b0,lagAccum} + {lagError[39],lagError};
    always @ (posedge clk) begin
        if (reset) begin
            lagAccum <= 0;
        end
        else if (clkEn) begin
            if (clearAccum) begin
                lagAccum <= 0;
            end
            // Positive saturation?
            else if (~lagError[39] & sum[40]) begin
                lagAccum <= 40'hff_ffff_ffff;
            end
            // Negative saturation?
            else if (lagError[39] & sum[40]) begin
                lagAccum <= 0;
            end
            else begin
                lagAccum <= sum[39:0];
            end
        end
    end

endmodule
