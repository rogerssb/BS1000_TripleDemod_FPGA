`timescale 1ns / 10 ps

module leadGain12 (
    clk, clkEn, reset, 
    error,
    acqTrackControl,
    track,
    leadExp,
    leadError
    );

input           clk, clkEn, reset;
input   [11:0]   error;
input   [1:0]   acqTrackControl;
input           track;
input   [4:0]   leadExp;

output  [39:0]  leadError;
reg     [39:0]  leadError;

/*************************** Lead Gain Section ********************************/

// NOTE: The acqTrackControl tells how much to divide the loopwidth by. The choices are
// zero, 1/2, 1/4, and 1/8. This is accomplished by subtracting the acqTrackControl
// value from the lead exponent. 
wire    [5:0]   leadSum = {1'b0,leadExp} - {4'b0,acqTrackControl};
reg     [4:0]   leadGain;
always @(posedge clk) begin
    // Set lead gain
    if (track) begin
        // Did the difference overflow?
        if (leadSum[5]) begin   
            // Yes. Limit to the minimum.
            leadGain <= 1;
            end
        else begin
            leadGain <= leadSum[4:0];
            end
        end
    else begin
        leadGain <= leadExp;
        end

    // Calculate the lead error.
    if (reset) begin
        leadError <= 0;
        end
    else if (clkEn) begin
        case(leadGain)
            5'h00: leadError <= 40'h0;
            5'h01: leadError <= {{30{error[11]}},error[11:2]};      
            5'h02: leadError <= {{29{error[11]}},error[11:1]};      
            5'h03: leadError <= {{28{error[11]}},error};      
            5'h04: leadError <= {{27{error[11]}},error, 1'b0};
            5'h05: leadError <= {{26{error[11]}},error, 2'b0};
            5'h06: leadError <= {{25{error[11]}},error, 3'b0};
            5'h07: leadError <= {{24{error[11]}},error, 4'b0};
            5'h08: leadError <= {{23{error[11]}},error, 5'b0};
            5'h09: leadError <= {{22{error[11]}},error, 6'b0};
            5'h0A: leadError <= {{21{error[11]}},error, 7'b0};
            5'h0B: leadError <= {{20{error[11]}},error, 8'b0};
            5'h0C: leadError <= {{19{error[11]}},error, 9'b0};
            5'h0D: leadError <= {{18{error[11]}},error,10'b0};
            5'h0E: leadError <= {{17{error[11]}},error,11'b0};
            5'h0F: leadError <= {{16{error[11]}},error,12'b0};
            5'h10: leadError <= {{15{error[11]}},error,13'b0};
            5'h11: leadError <= {{14{error[11]}},error,14'b0};
            5'h12: leadError <= {{13{error[11]}},error,15'b0};
            5'h13: leadError <= {{12{error[11]}},error,16'b0};
            5'h14: leadError <= {{11{error[11]}},error,17'b0};
            5'h15: leadError <= {{10{error[11]}},error,18'b0};
            5'h16: leadError <= {{09{error[11]}},error,19'b0};
            5'h17: leadError <= {{08{error[11]}},error,20'b0};
            5'h18: leadError <= {{07{error[11]}},error,21'b0};
            5'h19: leadError <= {{06{error[11]}},error,22'b0};
            5'h1A: leadError <= {{05{error[11]}},error,23'b0};
            5'h1B: leadError <= {{04{error[11]}},error,24'b0};
            5'h1C: leadError <= {{03{error[11]}},error,25'b0};
            5'h1D: leadError <= {{02{error[11]}},error,26'b0};
            5'h1E: leadError <= {{01{error[11]}},error,27'b0};
            5'h1F: leadError <= {error,{28'b0}};
            endcase
        end
    end

endmodule
