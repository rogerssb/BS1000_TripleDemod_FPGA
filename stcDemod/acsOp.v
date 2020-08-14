`timescale 1ns/1ps

module acsOp(
    input                   clk,reset,
    input   signed  [17:0]  y8Real,y8Imag,
    input   signed  [17:0]  sReal,sImag,
    input                   accMetricInEn,
    input           [17:0]  accMetricIn,
    output                  accMetricOutEn,
    output  reg     [17:0]  accMetricOut
);

    // Calculate y8 - s.                // caution, assumes no overflow
    wire    signed  [17:0]  diffReal = y8Real - sReal; //{y8Real[17],y8Real[17:1]} - {sReal[17],sReal[17:1]};
    wire    signed  [17:0]  diffImag = y8Imag - sImag; //{y8Imag[17],y8Imag[17:1]} - {sImag[17],sImag[17:1]};

    `ifdef ACS_USE_MAG
    // An ACS operation implements
    //                 accOut = accIn + |y8 - s|^2
    // where y8 and s are complex. The cmag18 module returns an approximation to the
    // sqrt(|x|^2) which simulation indicates works as well. We do this to save
    // dedicated multipliers

    wire            [17:0]  branchMetric;
    cmag18 cmag(
        .clk(clk),
        .clkEn(1'b1),
        .inReal(diffReal), .inImag(diffImag),
        .magnitude(branchMetric)
    );

    `else // ACS_USE_MAG

    wire            [18:0]  branchMetric;
    cmagSquared18 cmag(
        .clk(clk),
        .clkEn(1'b1),
        .inReal(diffReal), .inImag(diffImag),
        .magSquared(branchMetric)
    );

    // Delay the accumulated metric input to account for the pipeline delays through
    // the magnitude circuit
    reg             [17:0]  accMetric[2:0];
    integer                 i;
    always @(posedge clk) begin
        accMetric[0] <= accMetricIn;
        for (i = 0; i < 2; i = i + 1) begin
            accMetric[i+1] <= accMetric[i];
        end
    end

    `endif // ACS_USE_MAG

    // Final output is a saturated sum.
    //wire            [18:0]  accSum = {1'b0,accMetric[0]} + branchMetric;
    reg            [18:0]  accSum;
    always @(posedge clk) begin

        accSum <= {1'b0,accMetricIn} + branchMetric;
/*        if (accSum[18]) begin
            accMetricOut <= 18'h3ffff;
        end
        else begin
            accMetricOut <= accSum[17:0];
        end
*/  end

    always @* begin  // perform the saturation logic after the add for timimg
        if (accSum[18]) begin
            accMetricOut = 18'h3ffff;
        end
        else begin
            accMetricOut = accSum[17:0];
        end
    end

    // Create the output clk enable
    reg             [7:0] clkEnSR;
    always @(posedge clk) begin
        clkEnSR <= {clkEnSR[6:0],accMetricInEn};
    end
    assign accMetricOutEn = clkEnSR[0];

endmodule







