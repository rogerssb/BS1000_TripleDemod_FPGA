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
    ctrl4,
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
input   [11:0]  error;
output  [31:0]  loopFreq;
output          ctrl2;
output          ctrl4;
output          satPos;
output          satNeg;
output  [15:0]  lockCount;
output  [11:0]  syncThreshold;


// Microprocessor interface
wire    [4:0]   lead, lag;
wire    [31:0]  limit;
wire    [31:0]  loopOffset;
wire    [31:0]  lowerLimit = -limit;
wire    [31:0]  upperLimit = limit;
reg     [31:0]  lagAccum;
loopRegs micro(
    .addr(addr),
    .dataIn(din),
    .dataOut(dout),
    .cs(cs),
    .wr0(wr0), .wr1(wr1), .wr2(wr2), .wr3(wr3),
    .lagAccum(lagAccum),
    .invertError(invertError),
    .zeroError(zeroError),
    .ctrl2(ctrl2),
    .clearAccum(clearAccum),
    .ctrl4(ctrl4),
    .leadExp(lead),
    .lagExp(lag),
    .limit(limit),
    .lockCount(lockCount),
    .syncThreshold(syncThreshold)
    );

/**************************** Adjust Error ************************************/
reg [11:0]loopError;
always @(posedge clk) begin 
    if (zeroError) begin
        loopError <= 12'h0;
        end
    else if (clkEn) begin
        if (invertError) begin
            loopError <= ~error + 1;
            end
        else begin
            loopError <= error;
            end
        end
    end



/*************************** Lead Gain Section ********************************/

reg [31:0]leadError;
always @(posedge clk) begin
    if (reset) begin
        leadError <= 0;
        end
    else if (clkEn) begin
        case(lead)
              5'h00: leadError <= 32'h0;
              5'h01: leadError <= {{30{loopError[11]}},loopError[11:10]};
              5'h02: leadError <= {{29{loopError[11]}},loopError[11:9]};
              5'h03: leadError <= {{28{loopError[11]}},loopError[11:8]};
              5'h04: leadError <= {{27{loopError[11]}},loopError[11:7]};
              5'h05: leadError <= {{26{loopError[11]}},loopError[11:6]};
              5'h06: leadError <= {{25{loopError[11]}},loopError[11:5]};
              5'h07: leadError <= {{24{loopError[11]}},loopError[11:4]};
              5'h08: leadError <= {{23{loopError[11]}},loopError[11:3]};
              5'h09: leadError <= {{22{loopError[11]}},loopError[11:2]};
              5'h0A: leadError <= {{21{loopError[11]}},loopError[11:1]};
              5'h0B: leadError <= {{20{loopError[11]}},loopError};      
              5'h0C: leadError <= {{19{loopError[11]}},loopError, 1'b0};
              5'h0D: leadError <= {{18{loopError[11]}},loopError, 2'b0};
              5'h0E: leadError <= {{17{loopError[11]}},loopError, 3'b0};
              5'h0F: leadError <= {{16{loopError[11]}},loopError, 4'b0};
              5'h10: leadError <= {{15{loopError[11]}},loopError, 5'b0};
              5'h11: leadError <= {{14{loopError[11]}},loopError, 6'b0};
              5'h12: leadError <= {{13{loopError[11]}},loopError, 7'b0};
              5'h13: leadError <= {{12{loopError[11]}},loopError, 8'b0};
              5'h14: leadError <= {{11{loopError[11]}},loopError, 9'b0};
              5'h15: leadError <= {{10{loopError[11]}},loopError,10'b0};
              5'h16: leadError <= {{09{loopError[11]}},loopError,11'b0};
              5'h17: leadError <= {{08{loopError[11]}},loopError,12'b0};
              5'h18: leadError <= {{07{loopError[11]}},loopError,13'b0};
              5'h19: leadError <= {{06{loopError[11]}},loopError,14'b0};
              5'h1A: leadError <= {{05{loopError[11]}},loopError,15'b0};
              5'h1B: leadError <= {{04{loopError[11]}},loopError,16'b0};
              5'h1C: leadError <= {{03{loopError[11]}},loopError,17'b0};
              5'h1D: leadError <= {{02{loopError[11]}},loopError,18'b0};
              5'h1E: leadError <= {{01{loopError[11]}},loopError,19'b0};
              5'h1F: leadError <= {loopError,20'b0};
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
        case(lag)
              5'h00: lagError <= 32'h0;
              5'h01: lagError <= {{30{loopError[11]}},loopError[11:10]};
              5'h02: lagError <= {{29{loopError[11]}},loopError[11:9]};
              5'h03: lagError <= {{28{loopError[11]}},loopError[11:8]};
              5'h04: lagError <= {{27{loopError[11]}},loopError[11:7]};
              5'h05: lagError <= {{26{loopError[11]}},loopError[11:6]};
              5'h06: lagError <= {{25{loopError[11]}},loopError[11:5]};
              5'h07: lagError <= {{24{loopError[11]}},loopError[11:4]};
              5'h08: lagError <= {{23{loopError[11]}},loopError[11:3]};
              5'h09: lagError <= {{22{loopError[11]}},loopError[11:2]};
              5'h0A: lagError <= {{21{loopError[11]}},loopError[11:1]};
              5'h0B: lagError <= {{20{loopError[11]}},loopError};      
              5'h0C: lagError <= {{19{loopError[11]}},loopError, 1'b0};
              5'h0D: lagError <= {{18{loopError[11]}},loopError, 2'b0};
              5'h0E: lagError <= {{17{loopError[11]}},loopError, 3'b0};
              5'h0F: lagError <= {{16{loopError[11]}},loopError, 4'b0};
              5'h10: lagError <= {{15{loopError[11]}},loopError, 5'b0};
              5'h11: lagError <= {{14{loopError[11]}},loopError, 6'b0};
              5'h12: lagError <= {{13{loopError[11]}},loopError, 7'b0};
              5'h13: lagError <= {{12{loopError[11]}},loopError, 8'b0};
              5'h14: lagError <= {{11{loopError[11]}},loopError, 9'b0};
              5'h15: lagError <= {{10{loopError[11]}},loopError,10'b0};
              5'h16: lagError <= {{09{loopError[11]}},loopError,11'b0};
              5'h17: lagError <= {{08{loopError[11]}},loopError,12'b0};
              5'h18: lagError <= {{07{loopError[11]}},loopError,13'b0};
              5'h19: lagError <= {{06{loopError[11]}},loopError,14'b0};
              5'h1A: lagError <= {{05{loopError[11]}},loopError,15'b0};
              5'h1B: lagError <= {{04{loopError[11]}},loopError,16'b0};
              5'h1C: lagError <= {{03{loopError[11]}},loopError,17'b0};
              5'h1D: lagError <= {{02{loopError[11]}},loopError,18'b0};
              5'h1E: lagError <= {{01{loopError[11]}},loopError,19'b0};
              5'h1F: lagError <= {loopError,20'b0};
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
   else if (clearAccum) begin
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
