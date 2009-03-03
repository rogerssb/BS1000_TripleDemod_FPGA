`timescale 1ns / 10 ps
`include ".\addressMap.v"

module loopFilter (
    clk, clkEn, reset, 
    cs,
    wr0,wr1,wr2,wr3,
    addr,
    din,
    dout,
    error,
    loopFreq,
    ctrl2,
    satPos,
    satNeg,
    lockCount,
    syncThreshold
    );

input           clk, clkEn, reset;
input           cs;
input           wr0,wr1,wr2,wr3;
input   [11:0]  addr;
input   [31:0]  din;
output  [31:0]  dout;
input   [7:0]   error;
output  [31:0]  loopFreq;
output          ctrl2;
output          satPos;
output          satNeg;
output  [15:0]  lockCount;
output  [7:0]   syncThreshold;


// Microprocessor interface
wire    [4:0]   lead, lag;
wire    [31:0]  limit;
wire    [31:0]  lowerLimit = -limit;
wire    [31:0]  upperLimit = limit;
loopRegs micro(
    .addr(addr),
    .dataIn(din),
    .dataOut(dout),
    .cs(cs),
    .wr0(wr0), .wr1(wr1), .wr2(wr2), .wr3(wr3),
    .invertError(invertError),
    .zeroError(zeroError),
    .ctrl2(ctrl2),
    .leadExp(lead),
    .lagExp(lag),
    .limit(limit),
    .lockCount(lockCount),
    .syncThreshold(syncThreshold)
    );

/**************************** Adjust Error ************************************/
reg [7:0]loopError;
always @(posedge clk) begin 
    if (zeroError) begin
        loopError <= 8'h0;
        end
    else if (invertError) begin
        loopError <= ~error + 1;
        end
    else begin
        loopError <= error;
        end
    end


reg [31:0] lagAccum;

/*************************** Lead Gain Section ********************************/

reg [31:0]leadError;
always @(posedge clk) begin
    if (reset) begin
        leadError <= 0;
        end
    else if (clkEn) begin
        leadError[31] <= loopError[7];
        case(lead)
              5'h00: leadError[30:0] <= {{31{loopError[7]}}};
              5'h01: leadError[30:0] <= {{30{loopError[7]}},loopError[6]};
              5'h02: leadError[30:0] <= {{29{loopError[7]}},loopError[6:5]};
              5'h03: leadError[30:0] <= {{28{loopError[7]}},loopError[6:4]};
              5'h04: leadError[30:0] <= {{27{loopError[7]}},loopError[6:3]};
              5'h05: leadError[30:0] <= {{26{loopError[7]}},loopError[6:2]};
              5'h06: leadError[30:0] <= {{25{loopError[7]}},loopError[6:1]};
              5'h07: leadError[30:0] <= {{24{loopError[7]}},loopError[6:0]};
              5'h08: leadError[30:0] <= {{23{loopError[7]}},loopError[6:0],{1{loopError[7]}}};
              5'h09: leadError[30:0] <= {{22{loopError[7]}},loopError[6:0],{2{loopError[7]}}};
              5'h0A: leadError[30:0] <= {{21{loopError[7]}},loopError[6:0],{3{loopError[7]}}};
              5'h0B: leadError[30:0] <= {{20{loopError[7]}},loopError[6:0],{4{loopError[7]}}};
              5'h0C: leadError[30:0] <= {{19{loopError[7]}},loopError[6:0],{5{loopError[7]}}};
              5'h0D: leadError[30:0] <= {{18{loopError[7]}},loopError[6:0],{6{loopError[7]}}};
              5'h0E: leadError[30:0] <= {{17{loopError[7]}},loopError[6:0],{7{loopError[7]}}};
              5'h0F: leadError[30:0] <= {{16{loopError[7]}},loopError[6:0],{8{loopError[7]}}};
              5'h10: leadError[30:0] <= {{15{loopError[7]}},loopError[6:0],{9{loopError[7]}}};
              5'h11: leadError[30:0] <= {{14{loopError[7]}},loopError[6:0],{10{loopError[7]}}};
              5'h12: leadError[30:0] <= {{13{loopError[7]}},loopError[6:0],{11{loopError[7]}}};
              5'h13: leadError[30:0] <= {{12{loopError[7]}},loopError[6:0],{12{loopError[7]}}};
              5'h14: leadError[30:0] <= {{11{loopError[7]}},loopError[6:0],{13{loopError[7]}}};
              5'h15: leadError[30:0] <= {{10{loopError[7]}},loopError[6:0],{14{loopError[7]}}};
              5'h16: leadError[30:0] <= {{09{loopError[7]}},loopError[6:0],{15{loopError[7]}}};
              5'h17: leadError[30:0] <= {{08{loopError[7]}},loopError[6:0],{16{loopError[7]}}};
              5'h18: leadError[30:0] <= {{07{loopError[7]}},loopError[6:0],{17{loopError[7]}}};
              5'h19: leadError[30:0] <= {{06{loopError[7]}},loopError[6:0],{18{loopError[7]}}};
              5'h1A: leadError[30:0] <= {{05{loopError[7]}},loopError[6:0],{19{loopError[7]}}};
              5'h1B: leadError[30:0] <= {{04{loopError[7]}},loopError[6:0],{20{loopError[7]}}};
              5'h1C: leadError[30:0] <= {{03{loopError[7]}},loopError[6:0],{21{loopError[7]}}};
              5'h1D: leadError[30:0] <= {{02{loopError[7]}},loopError[6:0],{22{loopError[7]}}};
              5'h1E: leadError[30:0] <= {{01{loopError[7]}},loopError[6:0],{23{loopError[7]}}};
              5'h1F: leadError[30:0] <= {loopError[6:0],{24{loopError[7]}}};
              endcase
        end
  end

/*************************** Lead Gain Section ********************************/

reg [31:0]lagError;
always @(posedge clk) begin
    if (reset) begin
        lagError <= 0;
        end
    else if (clkEn) begin
        lagError[31] <= loopError[7];
        case(lag)
              5'h00: lagError[30:0] <= {{31{loopError[7]}}};
              5'h01: lagError[30:0] <= {{30{loopError[7]}},loopError[6]};
              5'h02: lagError[30:0] <= {{29{loopError[7]}},loopError[6:5]};
              5'h03: lagError[30:0] <= {{28{loopError[7]}},loopError[6:4]};
              5'h04: lagError[30:0] <= {{27{loopError[7]}},loopError[6:3]};
              5'h05: lagError[30:0] <= {{26{loopError[7]}},loopError[6:2]};
              5'h06: lagError[30:0] <= {{25{loopError[7]}},loopError[6:1]};
              5'h07: lagError[30:0] <= {{24{loopError[7]}},loopError[6:0]};
              5'h08: lagError[30:0] <= {{23{loopError[7]}},loopError[6:0],{1{loopError[7]}}};
              5'h09: lagError[30:0] <= {{22{loopError[7]}},loopError[6:0],{2{loopError[7]}}};
              5'h0A: lagError[30:0] <= {{21{loopError[7]}},loopError[6:0],{3{loopError[7]}}};
              5'h0B: lagError[30:0] <= {{20{loopError[7]}},loopError[6:0],{4{loopError[7]}}};
              5'h0C: lagError[30:0] <= {{19{loopError[7]}},loopError[6:0],{5{loopError[7]}}};
              5'h0D: lagError[30:0] <= {{18{loopError[7]}},loopError[6:0],{6{loopError[7]}}};
              5'h0E: lagError[30:0] <= {{17{loopError[7]}},loopError[6:0],{7{loopError[7]}}};
              5'h0F: lagError[30:0] <= {{16{loopError[7]}},loopError[6:0],{8{loopError[7]}}};
              5'h10: lagError[30:0] <= {{15{loopError[7]}},loopError[6:0],{9{loopError[7]}}};
              5'h11: lagError[30:0] <= {{14{loopError[7]}},loopError[6:0],{10{loopError[7]}}};
              5'h12: lagError[30:0] <= {{13{loopError[7]}},loopError[6:0],{11{loopError[7]}}};
              5'h13: lagError[30:0] <= {{12{loopError[7]}},loopError[6:0],{12{loopError[7]}}};
              5'h14: lagError[30:0] <= {{11{loopError[7]}},loopError[6:0],{13{loopError[7]}}};
              5'h15: lagError[30:0] <= {{10{loopError[7]}},loopError[6:0],{14{loopError[7]}}};
              5'h16: lagError[30:0] <= {{09{loopError[7]}},loopError[6:0],{15{loopError[7]}}};
              5'h17: lagError[30:0] <= {{08{loopError[7]}},loopError[6:0],{16{loopError[7]}}};
              5'h18: lagError[30:0] <= {{07{loopError[7]}},loopError[6:0],{17{loopError[7]}}};
              5'h19: lagError[30:0] <= {{06{loopError[7]}},loopError[6:0],{18{loopError[7]}}};
              5'h1A: lagError[30:0] <= {{05{loopError[7]}},loopError[6:0],{19{loopError[7]}}};
              5'h1B: lagError[30:0] <= {{04{loopError[7]}},loopError[6:0],{20{loopError[7]}}};
              5'h1C: lagError[30:0] <= {{03{loopError[7]}},loopError[6:0],{21{loopError[7]}}};
              5'h1D: lagError[30:0] <= {{02{loopError[7]}},loopError[6:0],{22{loopError[7]}}};
              5'h1E: lagError[30:0] <= {{01{loopError[7]}},loopError[6:0],{23{loopError[7]}}};
              5'h1F: lagError[30:0] <= {loopError[6:0],{24{loopError[7]}}};
              endcase
        end
  end

// limit and accumulate the decimated accPhaseB
//            80<------|------------|------0--------|---------|--------->7f
// CASE1               LL                                     UL
// CASE2               LL          UL
// CASE3                                            LL        UL
//
wire [31:0] sum = lagAccum + lagError;
reg         satPos,satNeg;
always @ (posedge clk or posedge reset) begin
   if (reset)
      begin
      lagAccum <= 0;
    end
   else if (clkEn) begin
      if ( (sum[31] && upperLimit[31])          // both negative
         && (sum >= upperLimit) ) begin       // between upper limit and 0
            lagAccum <= upperLimit;
            satPos <= 1;
            satNeg <= 0;
            end
      else if ( (!sum[31] && !upperLimit[31])   // both positive
           && (sum >= upperLimit) ) begin       // between upper limit and +saturation
            lagAccum <= upperLimit;
            satPos <= 1;
            satNeg <= 0;
            end
      else if ( (!sum[31] && !lowerLimit[31])   // both positive
           && (sum < lowerLimit) ) begin      // between lower limit and 0
            lagAccum <= lowerLimit;
            satPos <= 0;
            satNeg <= 1;
            end
      else if ( (sum[31] && lowerLimit[31])     // both negative
           && (sum < lowerLimit) ) begin        // between lower limit and -saturation
            lagAccum <= lowerLimit;
            satPos <= 0;
            satNeg <= 1;
            end
      else begin
         lagAccum <= sum;
         satPos <= 0;
         satNeg <= 0;
         end
      end
   else
      lagAccum <= lagAccum;
   end

reg [31:0]filterSum;
always @(posedge clk) begin
    if (reset) begin
        filterSum <= 0;
        end
    else if (clkEn) begin
        filterSum <= lagAccum + leadError;
        end
    end


assign loopFreq = filterSum;

endmodule
