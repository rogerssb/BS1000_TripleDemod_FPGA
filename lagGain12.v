`timescale 1ns / 10 ps

module lagGain12 (
    clk, clkEn, reset, 
    error,
    lagExp,
    upperLimit,
    lowerLimit,
    sweepEnable,
    sweepRateMag,
    carrierInSync,
    clearAccum,
    lagAccum
    );

input           clk, clkEn, reset;
input   [11:0]   error;
input   [4:0]   lagExp;
input   [31:0]  upperLimit;
input   [31:0]  lowerLimit;
input           sweepEnable;
input   [31:0]  sweepRateMag;
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
        case(lagExp)
            5'h00: lagError <= 40'h0;
            5'h01: lagError <= {{30{error[11]}},error[11:2]};  
            5'h02: lagError <= {{29{error[11]}},error[11:1]};  
            5'h03: lagError <= {{28{error[11]}},error};  
            5'h04: lagError <= {{27{error[11]}},error, 1'b0};  
            5'h05: lagError <= {{26{error[11]}},error, 2'b0};  
            5'h06: lagError <= {{25{error[11]}},error, 3'b0};  
            5'h07: lagError <= {{24{error[11]}},error, 4'b0};  
            5'h08: lagError <= {{23{error[11]}},error, 5'b0};  
            5'h09: lagError <= {{22{error[11]}},error, 6'b0}; 
            5'h0A: lagError <= {{21{error[11]}},error, 7'b0}; 
            5'h0B: lagError <= {{20{error[11]}},error, 8'b0}; 
            5'h0C: lagError <= {{19{error[11]}},error, 9'b0}; 
            5'h0D: lagError <= {{18{error[11]}},error,10'b0}; 
            5'h0E: lagError <= {{17{error[11]}},error,11'b0}; 
            5'h0F: lagError <= {{16{error[11]}},error,12'b0}; 
            5'h10: lagError <= {{15{error[11]}},error,13'b0}; 
            5'h11: lagError <= {{14{error[11]}},error,14'b0}; 
            5'h12: lagError <= {{13{error[11]}},error,15'b0}; 
            5'h13: lagError <= {{12{error[11]}},error,16'b0}; 
            5'h14: lagError <= {{11{error[11]}},error,17'b0}; 
            5'h15: lagError <= {{10{error[11]}},error,18'b0}; 
            5'h16: lagError <= {{09{error[11]}},error,19'b0}; 
            5'h17: lagError <= {{08{error[11]}},error,20'b0}; 
            5'h18: lagError <= {{07{error[11]}},error,21'b0}; 
            5'h19: lagError <= {{06{error[11]}},error,22'b0}; 
            5'h1A: lagError <= {{05{error[11]}},error,23'b0}; 
            5'h1B: lagError <= {{04{error[11]}},error,24'b0}; 
            5'h1C: lagError <= {{03{error[11]}},error,25'b0}; 
            5'h1D: lagError <= {{02{error[11]}},error,26'b0}; 
            5'h1E: lagError <= {{01{error[11]}},error,27'b0}; 
            5'h1F: lagError <= {error,28'b0};                
            endcase
        end
    end

parameter SWEEP_OFF     = 3'b001;
parameter SWEEP_UP      = 3'b010;
parameter SWEEP_DOWN    = 3'b100;
reg     [2:0]   sweepState;
reg             sweepingUp;
reg     [31:0]  sweepOffset;
wire    [31:0]  negSweepRateMag = -sweepRateMag;
reg             hitUpperLimit,hitLowerLimit;
always @ (posedge clk) begin
    if (clkEn) begin
        if (sweepEnable) begin
            case (sweepState) 
                SWEEP_OFF: begin
                    if (carrierInSync) begin
                        sweepState <= SWEEP_OFF;
                        sweepOffset <= 0;
                        end
                    else begin
                        if (sweepingUp) begin
                            sweepState <= SWEEP_UP;
                            sweepOffset <= sweepRateMag;
                            end
                        else begin
                            sweepState <= SWEEP_DOWN;
                            sweepOffset <= negSweepRateMag;
                            end
                        end
                    end
                SWEEP_UP: begin
                    if (carrierInSync) begin
                        sweepState <= SWEEP_OFF;
                        sweepOffset <= 0;
                        sweepingUp <= 1;
                        end
                    else if (hitUpperLimit) begin
                        sweepState <= SWEEP_DOWN;
                        sweepOffset <= negSweepRateMag;
                        end
                    else begin
                        sweepOffset <= sweepRateMag;
                        end
                    end
                SWEEP_DOWN: begin
                    if (carrierInSync) begin
                        sweepState <= SWEEP_OFF;
                        sweepOffset <= 0;
                        sweepingUp <= 0;
                        end
                    else if (hitLowerLimit) begin
                        sweepState <= SWEEP_UP;
                        sweepOffset <= sweepRateMag;
                        end
                    else begin
                        sweepOffset <= negSweepRateMag;
                        end
                    end
                default: begin
                    sweepState <= SWEEP_OFF;
                    sweepOffset <= 0;
                    sweepingUp <= 1;
                    end
                endcase
            end
        else begin
            sweepState <= SWEEP_OFF;
            sweepOffset <= 0;
            sweepingUp <= 1;
            end
        end
    end


wire    [39:0]  sum = lagAccum + lagError + {{8{sweepOffset[31]}},sweepOffset};
always @ (posedge clk or posedge reset) begin
    if (reset) begin
        lagAccum <= 0;
        end
    else if (clearAccum) begin
        lagAccum <= 0;
        end
    else if (clkEn) begin
        // Test the upper and lower limits on the accumulator.

        casex ({upperLimit[31],lowerLimit[31],sum[39]})
            // In this case, the upper limit is reached
            3'b110: begin
                lagAccum <= {upperLimit,8'h0};
                hitLowerLimit <= 0;
                hitUpperLimit <= 1;
                end
            // In this case, the lower limit is reached
            3'b001: begin
                lagAccum <= {lowerLimit,8'hff};
                hitLowerLimit <= 1;
                hitUpperLimit <= 0;
                end
            // In this case, we might reach the upper limit
            3'b010: begin
                if (sum[39:8] >= upperLimit) begin 
                    lagAccum <= {upperLimit,8'h0};
                    hitLowerLimit <= 0;
                    hitUpperLimit <= 1;
                    end
                else begin
                    lagAccum <= sum;
                    hitLowerLimit <= 0;
                    hitUpperLimit <= 0;
                    end
                end
            // In this case, we might reach the lower limit
            3'b011: begin
                if (sum[39:8]  <= lowerLimit) begin
                    lagAccum <= {lowerLimit,8'hff};
                    hitLowerLimit <= 1;
                    hitUpperLimit <= 0;
                    end
                else begin
                    lagAccum <= sum;
                    hitLowerLimit <= 0;
                    hitUpperLimit <= 0;
                    end
                end
            // In this case, we might reach either limit
            3'b000: begin
                if (sum[39:8] >= upperLimit) begin 
                    lagAccum <= {upperLimit,8'h0};
                    hitLowerLimit <= 0;
                    hitUpperLimit <= 1;
                    end
                else if (sum[39:8]  <= lowerLimit) begin
                    lagAccum <= {lowerLimit,8'hff};
                    hitLowerLimit <= 1;
                    hitUpperLimit <= 0;
                    end
                else begin
                    lagAccum <= sum;
                    hitLowerLimit <= 0;
                    hitUpperLimit <= 0;
                    end
                end
            // In this case, we might reach either limit
            3'b111: begin
                if (sum[39:8]  <= lowerLimit) begin
                    lagAccum <= {lowerLimit,8'hff};
                    hitLowerLimit <= 1;
                    hitUpperLimit <= 0;
                    end
                else if (sum[39:8] >= upperLimit) begin 
                    lagAccum <= {upperLimit,8'h0};
                    hitLowerLimit <= 0;
                    hitUpperLimit <= 1;
                    end
                else begin
                    lagAccum <= sum;
                    hitLowerLimit <= 0;
                    hitUpperLimit <= 0;
                    end
                end
            // Illegal state. Freeze the accumulator.
            3'b10x: begin
                lagAccum <= lagAccum;
                hitLowerLimit <= 0;
                hitUpperLimit <= 0;
                end
            endcase
        end
    end


endmodule
