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
            lagError <= 0;
            end
        else begin
            lagError[39] <= error[7];
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
wire    [39:0]  sum = lagAccum + lagError + {{8{sweepOffset[31]}},sweepOffset};

reg [3:0] here;

always @ (posedge clk or posedge reset) begin
    if (reset) begin
        lagAccum <= 0;
        sweepOffset <= 0;
        sweepMag <= 0;
        here <= 0;
        end
    else if (clearAccum) begin
        lagAccum <= 0;
        here <= 1;
        end
    else if (clkEn) begin
        if ( (sum[39] && upperLimit[31])          // both negative
            && (sum[39:8] >= upperLimit) ) begin          // between upper limit and 0
            lagAccum <= {upperLimit,8'hff};
            if (carrierInSync || !sweepEnable) begin
                sweepOffset <= 0;
                here <= 2;
                end
            else begin
                sweepOffset <= negSweepOffsetMag;
                sweepMag <= negSweepOffsetMag;
                here <= 3;
                end
            end
        else if ( (!sum[39] && !upperLimit[31])   // both positive
                && (sum[39:8] >= upperLimit) ) begin     // between upper limit and +saturation
            lagAccum <= {upperLimit,8'h0};
            if (carrierInSync || !sweepEnable) begin
                sweepOffset <= 0;
                here <= 4;
                end
            else begin
                sweepOffset <= negSweepOffsetMag;
                sweepMag <= negSweepOffsetMag;
                here <= 5;
                end
            end
        else if ( (!sum[39] && !lowerLimit[31])   // both positive
                && (sum[39:8] < lowerLimit) ) begin      // between lower limit and 0
            lagAccum <= {lowerLimit,8'h0};
            if (carrierInSync || !sweepEnable) begin
                sweepOffset <= 0;
                here <= 6;
                end
            else begin
                sweepOffset <= sweepOffsetMag;
                sweepMag <= sweepOffsetMag;
                here <= 7;
                end
            end
        else if ( (sum[39] && lowerLimit[31])     // both negative
                && (sum[39:8] < lowerLimit) ) begin      // between lower limit and -saturation
            lagAccum <= {lowerLimit,8'hff};
            if (carrierInSync || !sweepEnable) begin
                sweepOffset <= 0;
                here <= 8;
                end
            else begin
                sweepOffset <= sweepOffsetMag;
                sweepMag <= sweepOffsetMag;
                here <= 9;
                end
            end
        else begin
            lagAccum <= sum;
            if (carrierInSync) begin
                sweepOffset <= 0;
                here <= 10;
                end
            else if (!sweepEnable) begin
                sweepOffset <= 0;
                here <= 11;
                end
            else begin
                sweepOffset <= sweepMag;
                here <= 12;
                end
            if (sweepMag == 0) begin
                sweepMag <= sweepOffsetMag;
                here <= 13;
                end
            end
        end
    else begin
        lagAccum <= lagAccum;
        here <= 14;
        end
    end

endmodule

`ifdef TEST_LAG_GAIN
module test;
reg           clk;    initial clk = 0;
reg           clkEn;  initial clkEn = 1;
reg           reset;  initial reset = 0;
reg   [7:0]   error;  initial error = 0;
reg   [4:0]   lagExp; initial lagExp = 0;
reg   [31:0]  limit;  initial limit = 1;
reg           sweepEnable;    initial sweepEnable = 1;
reg   [31:0]  sweepOffsetMag; initial sweepOffsetMag = 1;
reg           carrierInSync;  initial carrierInSync = 0;
reg           clearAccum;     initial clearAccum = 0;

wire  [39:0]  lagAccum;

lagGain uut (
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

always #5 clk = !clk;

initial begin
	$monitor("%d", uut.here);
	#100 reset = !reset;
    #100 reset = !reset;
    end
endmodule	
`endif

