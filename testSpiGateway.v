`timescale 1ns/100ps
`include "addressMap.v"

module test;
    parameter CLOCK_FREQ = 93.333333e6;
    parameter HC = 1e9/CLOCK_FREQ/2;
    parameter C = 2*HC;
    parameter CLOCK_DECIMATION = 1;

    reg     reset;
    initial reset = 0;

    // Create the clocks
    reg     clk;
    initial clk = 1;
    reg     clken;
    always #HC clk = clk^clken;
    `define CLOCK_PERIOD    (C*1e-9)
    `define SAMPLE_FREQ     (CLOCK_FREQ/CLOCK_DECIMATION)
    `define SAMPLE_PERIOD   (`CLOCK_PERIOD*CLOCK_DECIMATION)


    reg     clkEnable;
    initial clkEnable = 0;
    integer clkCount;
    initial clkCount = 0;
    always @(posedge clk) begin
        if (clkCount == CLOCK_DECIMATION-1) begin
            clkCount <= 0;
            clkEnable <= 1;
        end
        else begin
            clkCount <= clkCount + 1;
            clkEnable <= 0;
        end
    end

    reg     enableInput;
    initial enableInput = 0;

    //************************** uP Interface *********************************
    `ifdef TRIPLE_DEMOD
        `include "upSpiTasks.v"
    `else
        `include "upBusTasks.v"
    `endif

    integer testState;
    initial begin

        // Wait for the startup to complete
        while (!enableInput) begin
            @ (posedge clk) ;
        end

        // 32-bit cycle
        testState = 0;
        write32(createAddress(`SPIGW_SPACE,`SPIGW_CONTROL),{30'b0,1'b1,1'b1});
        write32(createAddress(`SPIGW_SPACE,`SPIGW_CYCLE32),32'h0123_4567);
        testState = 1;
        while (!uut.spiCycleComplete) begin
            @ (posedge clk) ;
        end
        $display("Cycle 32 Complete");

        // 16-bit cycle
        testState = 0;
        write32(createAddress(`SPIGW_SPACE,`SPIGW_CONTROL),{30'b0,1'b1,1'b1});
        write16(createAddress(`SPIGW_SPACE,`SPIGW_CYCLE16),16'ha55a);
        testState = 1;
        while (!uut.spiCycleComplete) begin
            @ (posedge clk) ;
        end
        $display("Cycle 16 Complete");

        // 8-bit cycle
        testState = 0;
        write32(createAddress(`SPIGW_SPACE,`SPIGW_CONTROL),{30'b0,1'b1,1'b1});
        write16(createAddress(`SPIGW_SPACE,`SPIGW_CYCLE8),16'h69);
        testState = 1;
        while (!uut.spiCycleComplete) begin
            @ (posedge clk) ;
        end
        $display("Cycle 8 Complete");

        // Multiple 32-bit cycle
        testState = 0;
        write32(createAddress(`SPIGW_SPACE,`SPIGW_CONTROL),{30'b0,1'b0,1'b1});
        write32(createAddress(`SPIGW_SPACE,`SPIGW_CYCLE32),32'h0123_4567);
        write32(createAddress(`SPIGW_SPACE,`SPIGW_CYCLE32),32'h4567_89ab);
        write32(createAddress(`SPIGW_SPACE,`SPIGW_CONTROL),{30'b0,1'b1,1'b0});
        write32(createAddress(`SPIGW_SPACE,`SPIGW_CYCLE32),32'h89ab_cdef);
        testState = 1;
        while (!uut.spiCycleComplete) begin
            @ (posedge clk) ;
        end
        $display("Multi 32 Complete");

        $stop;

    end


    //******************************* UUT *************************************
    `ifdef TRIPLE_DEMOD
    spiBusInterface spi(
        .clk(clk),
        .reset(reset),
        .spiClk(busClk),
        .spiCS(spiCS),
        .spiDataIn(spiDataIn),
        .spiDataOut(),
        .spiDataOE(spiDataOE),
        .cs(cs),
        .wr0(wr0),.wr1(wr1),.wr2(wr2),.wr3(wr3),
        .addr(a),
        .dataIn(d),
        .dataOut()
    );

    `endif


    reg spiGatewaySpace;
    always @* begin
        casex(a)
            `SPIGW_SPACE:   spiGatewaySpace = cs;
            default:        spiGatewaySpace = 0;
        endcase
    end
    spiGateway uut(
        .clk(clk),
        .reset(reset),
        .busClk(busClk),
        .cs(spiGatewaySpace),
        .wr0(wr0),.wr1(wr1),.wr2(wr2),.wr3(wr3),
        .addr(a),
        .dataIn(d),
        .dataOut(),
        .spiClk(),
        .spiCS(),
        .spiDataIn(),
        .spiDataOut()
    );





    //**************************** Startup ************************************
    initial begin
        clken <= 1;

        // Wait 10 clks
        repeat (6) @ (posedge clk) ;

        reset <= 1;
        repeat (4) @ (posedge clk) ;
        reset <= 0;
        repeat (4) @ (posedge clk) ;
        reset <= 1;
        repeat (12) @ (posedge clk) ;
        reset <= 0;

        @ (negedge clk) ;
        enableInput <= 1;

        @ (posedge clk) ;
        while (enableInput) begin
            @ (posedge clk) ;
        end

        $stop;

    end

    integer         sampleCount;
    initial         sampleCount = 0;
    wire    [31:0]  sampleCountWire = sampleCount;
    always @(posedge clk) begin
        if (enableInput) begin
            if (clkEnable) begin
                sampleCount <= sampleCount + 1;
            end
        end
    end

endmodule

