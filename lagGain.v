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

output  [31:0]  lagAccum;
reg     [31:0]  lagAccum;

/*************************** Lead Gain Section ********************************/

reg     [31:0]  lagError;
always @(posedge clk) begin
    if (reset) begin
        lagError <= 0;
        end
    else if (clkEn) begin
        if (lagExp == 5'h00) begin
            lagError <= 0;
            end
        else begin
            lagError[31] <= error[7];
            case(lagExp)
                5'h00: lagError[30:0] <= 31'h0;
                5'h01: lagError[30:0] <= {{30{error[7]}},error[6]};
                5'h02: lagError[30:0] <= {{29{error[7]}},error[6:5]};
                5'h03: lagError[30:0] <= {{28{error[7]}},error[6:4]};
                5'h04: lagError[30:0] <= {{27{error[7]}},error[6:3]};
                5'h05: lagError[30:0] <= {{26{error[7]}},error[6:2]};
                5'h06: lagError[30:0] <= {{25{error[7]}},error[6:1]};
                5'h07: lagError[30:0] <= {{24{error[7]}},error[6:0]};
                5'h08: lagError[30:0] <= {{23{error[7]}},error[6:0],{1{error[7]}}};
                5'h09: lagError[30:0] <= {{22{error[7]}},error[6:0],{2{error[7]}}};
                5'h0A: lagError[30:0] <= {{21{error[7]}},error[6:0],{3{error[7]}}};
                5'h0B: lagError[30:0] <= {{20{error[7]}},error[6:0],{4{error[7]}}};
                5'h0C: lagError[30:0] <= {{19{error[7]}},error[6:0],{5{error[7]}}};
                5'h0D: lagError[30:0] <= {{18{error[7]}},error[6:0],{6{error[7]}}};
                5'h0E: lagError[30:0] <= {{17{error[7]}},error[6:0],{7{error[7]}}};
                5'h0F: lagError[30:0] <= {{16{error[7]}},error[6:0],{8{error[7]}}};
                5'h10: lagError[30:0] <= {{15{error[7]}},error[6:0],{9{error[7]}}};
                5'h11: lagError[30:0] <= {{14{error[7]}},error[6:0],{10{error[7]}}};
                5'h12: lagError[30:0] <= {{13{error[7]}},error[6:0],{11{error[7]}}};
                5'h13: lagError[30:0] <= {{12{error[7]}},error[6:0],{12{error[7]}}};
                5'h14: lagError[30:0] <= {{11{error[7]}},error[6:0],{13{error[7]}}};
                5'h15: lagError[30:0] <= {{10{error[7]}},error[6:0],{14{error[7]}}};
                5'h16: lagError[30:0] <= {{09{error[7]}},error[6:0],{15{error[7]}}};
                5'h17: lagError[30:0] <= {{08{error[7]}},error[6:0],{16{error[7]}}};
                5'h18: lagError[30:0] <= {{07{error[7]}},error[6:0],{17{error[7]}}};
                5'h19: lagError[30:0] <= {{06{error[7]}},error[6:0],{18{error[7]}}};
                5'h1A: lagError[30:0] <= {{05{error[7]}},error[6:0],{19{error[7]}}};
                5'h1B: lagError[30:0] <= {{04{error[7]}},error[6:0],{20{error[7]}}};
                5'h1C: lagError[30:0] <= {{03{error[7]}},error[6:0],{21{error[7]}}};
                5'h1D: lagError[30:0] <= {{02{error[7]}},error[6:0],{22{error[7]}}};
                5'h1E: lagError[30:0] <= {{01{error[7]}},error[6:0],{23{error[7]}}};
                5'h1F: lagError[30:0] <= {error[6:0],{24{error[7]}}};
                endcase
            end
        end
    end

// limit and accumulate the decimated accPhaseB
//            80<------|------------|------0--------|---------|--------->7f
// CASE1               LL                                     UL
// CASE2               LL          UL
// CASE3                                            LL        UL
//
reg     [31:0]  sweepOffset;
wire    [31:0]  negSweepOffsetMag = ~sweepOffsetMag + 1;
reg     [31:0]  sweepMag;
wire    [31:0]  lowerLimit = -limit;
wire    [31:0]  upperLimit = limit;
wire    [31:0]  sum = lagAccum + lagError + sweepOffset;

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
        if ( (sum[31] && upperLimit[31])          // both negative
            && (sum >= upperLimit) ) begin          // between upper limit and 0
            lagAccum <= upperLimit;
            if (carrierInSync || !sweepEnable) begin
                sweepOffset <= 0;
                end
            else begin
                sweepOffset <= negSweepOffsetMag;
                sweepMag <= negSweepOffsetMag;
                end
            end
        else if ( (!sum[31] && !upperLimit[31])   // both positive
                && (sum >= upperLimit) ) begin     // between upper limit and +saturation
            lagAccum <= upperLimit;
            if (carrierInSync || !sweepEnable) begin
                sweepOffset <= 0;
                end
            else begin
                sweepOffset <= negSweepOffsetMag;
                sweepMag <= negSweepOffsetMag;
                end
            end
        else if ( (!sum[31] && !lowerLimit[31])   // both positive
                && (sum < lowerLimit) ) begin      // between lower limit and 0
            lagAccum <= lowerLimit;
            if (carrierInSync || !sweepEnable) begin
                sweepOffset <= 0;
                end
            else begin
                sweepOffset <= sweepOffsetMag;
                sweepMag <= sweepOffsetMag;
                end
            end
        else if ( (sum[31] && lowerLimit[31])     // both negative
                && (sum < lowerLimit) ) begin      // between lower limit and -saturation
            lagAccum <= lowerLimit;
            if (carrierInSync || !sweepEnable) begin
                sweepOffset <= 0;
                end
            else begin
                sweepOffset <= sweepOffsetMag;
                sweepMag <= sweepOffsetMag;
                end
            end
        else begin
            lagAccum <= sum;
            if (carrierInSync) begin
                sweepOffset <= 0;
                end
            else if (!sweepEnable) begin
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
    else begin
        lagAccum <= lagAccum;
        end
    end

endmodule
