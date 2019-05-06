
`timescale 1ns/100ps

module fireberdDrive(
    input               clk,
    input               reset,
    input               ce,
    input               ValidIn,
    input       [3:0]   RecoveredData,
    input       [15:0]  ClocksPerBit,
    input               msbFirst,
    output              DataOut,
    output  reg         ClkOut
);
    // TODO warning, there is no buffer to spread the data across the pilot period

    reg         [15:0]  clkCounter;
    wire                negedgeClkOut = (clkCounter == 0);
    wire                posedgeClkOut = (clkCounter == ClocksPerBit/2);
    reg                 dataAvailable;
    always @(posedge clk) begin
        if (reset) begin
            clkCounter <= ClocksPerBit;
        end
        else if (ce) begin
            if (clkCounter > 0) begin
                clkCounter <= clkCounter - 1;
            end
            else if (ValidIn || dataAvailable) begin
                clkCounter <= ClocksPerBit;
            end
        end
    end

    reg         [3:0]   dataSR;
    assign              DataOut = msbFirst ? dataSR[3] : dataSR[0];
    reg         [1:0]   bitCount;
    always @(posedge clk) begin
        if (reset) begin
            bitCount <= 0;
        end
        else if (ce) begin
            if (ValidIn) begin
                dataSR <= RecoveredData;
                bitCount <= 3;
                dataAvailable <= 1;
            end
            else if (negedgeClkOut) begin
                ClkOut <= 0;
                if (bitCount > 0) begin
                    bitCount <= bitCount - 1;
                    if (msbFirst) begin
                        dataSR <= {dataSR[2:0],1'b0};
                    end
                    else begin
                        dataSR <= {1'b0,dataSR[3:1]};
                    end
                end
                else begin
                    dataAvailable <= 0;
                end
            end
            else if (posedgeClkOut) begin
                ClkOut <= dataAvailable;
            end
        end
    end

endmodule


`ifdef TEST_MODULE
module test();

    reg     reset;
    initial reset = 0;
    reg     clk;
    initial clk = 0;

    // Create the clocks
    parameter CLOCK_FREQ = 186.6666667e6;
    parameter HC = 1e9/CLOCK_FREQ/2;
    parameter C = 2*HC;
    reg clken;
    always #HC clk = clk^clken;
    `define CLOCK_PERIOD   (C*1e-9)


    //Test Pattern
    reg             validIn;
    reg     [7:0]   validCounter;
    parameter       ValidPeriod = 64;
    reg     [3:0]   dataIn;
    always @(posedge clk) begin
        // Valid signal
        if (reset) begin
            validCounter <= ValidPeriod - 1;
            validIn <= 0;
        end
        else if (validCounter > 0) begin
            validCounter <= validCounter - 1;
            validIn <= 0;
        end
        else begin
            validCounter <= ValidPeriod - 1;;
            validIn <= 1;
        end

        // Data pattern
        if (reset) begin
            dataIn <= 0;
        end
        else if (validIn) begin
            dataIn <= dataIn + 1;
        end
    end

    fireberdDrive fd(
        .clk(clk),
        .reset(reset),
        .ce(1'b1),
        .ValidIn(validIn),
        .RecoveredData(dataIn),
        .msbFirst(1'b0),
        .DataOut(),
        .ClkOut()
    );

    initial begin
        clken <= 1;

        // Wait 10 clks
        repeat (10) @ (posedge clk) ;

        reset <= 1;
        repeat (10) @ (posedge clk) ;
        reset <= 0;

        repeat (100) @ (posedge clk) ;

        $stop;

    end

endmodule

`endif
