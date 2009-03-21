`timescale 1ns / 10 ps

module lagGain (
    clk, clkEn, reset, 
    error,
    lagExp,
    limit,
    sweepEnable,
    sweepOffsetMag,
    carrierInSync,
    clearAccum,
    lagAccum
    );

input           clk, clkEn, reset;
input   [7:0]   error;
input   [4:0]   lagExp;
input   [31:0]  limit;
input           sweepEnable;
input   [31:0]  sweepOffsetMag;
input           carrierInSync;
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
        if (lagExp == 5'h00) begin
            lagError[39] <= 1'b0;
            end
        else begin
            lagError[39] <= error[7];
            end
        case(lagExp)
            5'h00: lagError[38:0] <= 39'h0;
            5'h01: lagError[38:0] <= {{30{error[7]}},error[6:0],{2{error[7]}}};  
            5'h02: lagError[38:0] <= {{29{error[7]}},error[6:0],{3{error[7]}}};  
            5'h03: lagError[38:0] <= {{28{error[7]}},error[6:0],{4{error[7]}}};  
            5'h04: lagError[38:0] <= {{27{error[7]}},error[6:0],{5{error[7]}}};  
            5'h05: lagError[38:0] <= {{26{error[7]}},error[6:0],{6{error[7]}}};  
            5'h06: lagError[38:0] <= {{25{error[7]}},error[6:0],{7{error[7]}}};  
            5'h07: lagError[38:0] <= {{24{error[7]}},error[6:0],{8{error[7]}}};  
            5'h08: lagError[38:0] <= {{23{error[7]}},error[6:0],{9{error[7]}}};  
            5'h09: lagError[38:0] <= {{22{error[7]}},error[6:0],{10{error[7]}}}; 
            5'h0A: lagError[38:0] <= {{21{error[7]}},error[6:0],{11{error[7]}}}; 
            5'h0B: lagError[38:0] <= {{20{error[7]}},error[6:0],{12{error[7]}}}; 
            5'h0C: lagError[38:0] <= {{19{error[7]}},error[6:0],{13{error[7]}}}; 
            5'h0D: lagError[38:0] <= {{18{error[7]}},error[6:0],{14{error[7]}}}; 
            5'h0E: lagError[38:0] <= {{17{error[7]}},error[6:0],{15{error[7]}}}; 
            5'h0F: lagError[38:0] <= {{16{error[7]}},error[6:0],{16{error[7]}}}; 
            5'h10: lagError[38:0] <= {{15{error[7]}},error[6:0],{17{error[7]}}}; 
            5'h11: lagError[38:0] <= {{14{error[7]}},error[6:0],{18{error[7]}}}; 
            5'h12: lagError[38:0] <= {{13{error[7]}},error[6:0],{19{error[7]}}}; 
            5'h13: lagError[38:0] <= {{12{error[7]}},error[6:0],{20{error[7]}}}; 
            5'h14: lagError[38:0] <= {{11{error[7]}},error[6:0],{21{error[7]}}}; 
            5'h15: lagError[38:0] <= {{10{error[7]}},error[6:0],{22{error[7]}}}; 
            5'h16: lagError[38:0] <= {{09{error[7]}},error[6:0],{23{error[7]}}}; 
            5'h17: lagError[38:0] <= {{08{error[7]}},error[6:0],{24{error[7]}}}; 
            5'h18: lagError[38:0] <= {{07{error[7]}},error[6:0],{25{error[7]}}}; 
            5'h19: lagError[38:0] <= {{06{error[7]}},error[6:0],{26{error[7]}}}; 
            5'h1A: lagError[38:0] <= {{05{error[7]}},error[6:0],{27{error[7]}}}; 
            5'h1B: lagError[38:0] <= {{04{error[7]}},error[6:0],{28{error[7]}}}; 
            5'h1C: lagError[38:0] <= {{03{error[7]}},error[6:0],{29{error[7]}}}; 
            5'h1D: lagError[38:0] <= {{02{error[7]}},error[6:0],{30{error[7]}}}; 
            5'h1E: lagError[38:0] <= {{01{error[7]}},error[6:0],{31{error[7]}}}; 
            5'h1F: lagError[38:0] <= {error[6:0],{32{error[7]}}};                
            endcase
        end
    end

// limit and accumulate the decimated accPhaseB
//            80<------|------------|------0--------|---------|--------->7f
// CASE1               LL                                     UL
// CASE2               LL          UL
// CASE3                                            LL        UL
//
reg     [31:0]  sweepOffset;
wire    [31:0]  negSweepOffsetMag = -sweepOffsetMag;
reg     [31:0]  sweepMag;
wire    [31:0]  lowerLimit = -limit;
wire    [31:0]  upperLimit = limit;
wire    [39:0]  sum = lagAccum + lagError + {{8{sweepOffset[31]}},sweepOffset};

always @ (posedge clk or posedge reset) begin
    if (reset) begin
        lagAccum <= 0;
        sweepOffset <= 0;
        sweepMag <= 0;
        end
    else if (clearAccum) begin
        lagAccum <= 0;
        end
    else if (clkEn) begin
        if ( (!sum[39] && !upperLimit[31])              // both positive
                && (sum[39:8] >= upperLimit) ) begin    // between upper limit and +saturation
            lagAccum <= {upperLimit,8'h0};
            if (sweepEnable) begin
                sweepMag <= negSweepOffsetMag;
                if (carrierInSync) begin
                    sweepOffset <= 0;
                    end
                else begin
                    sweepOffset <= negSweepOffsetMag;
                    end
                end
            end
        else if ( (sum[39] && lowerLimit[31])           // both negative
                && (sum[39:8] < lowerLimit) ) begin     // between lower limit and -saturation
            lagAccum <= {lowerLimit,8'hff};
            if (sweepEnable) begin
                sweepMag <= sweepOffsetMag;
                if (carrierInSync) begin
                    sweepOffset <= 0;
                    end
                else begin
                    sweepOffset <= sweepOffsetMag;
                    end
                end
            end
        else begin
            lagAccum <= sum;
            if (!sweepEnable) begin
                sweepOffset <= 0;
                end
            else if (carrierInSync) begin
                sweepOffset <= 0;
                end
            else begin
                sweepOffset <= sweepMag;
                end
            if (sweepMag == 0) begin
                sweepMag <= sweepOffsetMag;
                end
            end
        end
    end

endmodule
