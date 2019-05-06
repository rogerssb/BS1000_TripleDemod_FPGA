`timescale 1ns/1ps

// Uses a min/max approximation based on the following equation:
// 
//      Mag = Alpha*Max + Beta*Min,
//
// where Max = max(abs(I),abs(q), Min = min(abs(I),abs(Q)), and Alpha and Beta
// are two constants. The following table gives a list of possible values for
// Alpha and Beta.
// 
//     =====================================================================
//                  Alpha * Max + Beta * Min Magnitude Estimator
// 
//     Name                  Alpha           Beta       Avg Err   RMS   Peak
//                                                      (linear)  (dB)  (dB)
//     ---------------------------------------------------------------------
//     Min RMS Err      0.947543636291 0.392485425092   0.000547 -32.6 -25.6
//     Min Peak Err     0.960433870103 0.397824734759  -0.013049 -31.4 -28.1
//     Min RMS w/ Avg=0 0.948059448969 0.392699081699   0.000003 -32.6 -25.7
//     1, Min RMS Err   1.000000000000 0.323260990000  -0.020865 -28.7 -23.8
//     1, Min Peak Err  1.000000000000 0.335982538000  -0.025609 -28.3 -25.1
//     1, 1/2           1.000000000000 0.500000000000  -0.086775 -20.7 -18.6
//     1, 1/4           1.000000000000 0.250000000000   0.006456 -27.6 -18.7
//     Frerking         1.000000000000 0.400000000000  -0.049482 -25.1 -22.3
//     1, 11/32         1.000000000000 0.343750000000  -0.028505 -28.0 -24.8
//     1, 3/8           1.000000000000 0.375000000000  -0.040159 -26.4 -23.4
//     15/16, 15/32     0.937500000000 0.468750000000  -0.018851 -29.2 -24.1
//     15/16, 1/2       0.937500000000 0.500000000000  -0.030505 -26.9 -24.1
//     31/32, 11/32     0.968750000000 0.343750000000  -0.000371 -31.6 -22.9
//     31/32, 3/8       0.968750000000 0.375000000000  -0.012024 -31.4 -26.1
//     61/64, 3/8       0.953125000000 0.375000000000   0.002043 -32.5 -24.3
//     61/64, 13/32     0.953125000000 0.406250000000  -0.009611 -31.8 -26.6
//     =====================================================================
//
// We'll use the Min Peak Err values.

module cmag18(
    input                   clk,clkEn,
    input   signed  [17:0]  inReal, inImag,
    output  signed  [17:0]  magnitude
);

    // First, pick the min and max.
    wire    [17:0]   absReal = inReal[17] ? -inReal : inReal;
    wire    [17:0]   absImag = inImag[17] ? -inImag : inImag;
    reg     [16:0]   max,min;
    always @(posedge clk) begin
        if (clkEn) begin
            if (absReal > absImag) begin
                max <= absReal[16:0];
                min <= absImag[16:0];
            end
            else begin
                max <= absImag[16:0];
                min <= absReal[16:0];
            end
        end
    end    

    // Now, calculate the instantaneous level approximation
    wire    [33:0]  maxTerm;
    magMaxWeight maxWeight(
        .CLK(clk),
        .CE(clkEn),
        .A(max),
        .P(maxTerm)
    );
    wire    [32:0]  minTerm;
    magMinWeight minWeight(
        .CLK(clk),
        .CE(clkEn),
        .A(min),
        .P(minTerm)
    );
    wire    signed  [17:0] sum = {2'b0,maxTerm[33:18]} + {3'b0,minTerm[32:18]};
    reg     signed  [17:0] cmag;
    always @(posedge clk) begin
        if (clkEn) begin
            if (sum[17]) begin
                cmag <= 18'h1ffff;
            end
            else begin
                cmag <= sum;
            end
        end
    end
    assign magnitude = sum;

endmodule
