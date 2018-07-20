`timescale 1ns/10ps
`include "addressMap.v"

module spiGateway(
    input                       clk,
    input                       reset,
    `ifdef USE_BUS_CLOCK
    input                       busClk,
    `endif
    input                       cs,
    input                       wr0, wr1, wr2, wr3,
    input               [12:0]  addr,
    input               [31:0]  dataIn,
    output  reg         [31:0]  dataOut,
    output  reg                 spiClk,
    output  reg                 spiCS,
    input                       spiDataIn,
    output                      spiDataOut
);

    reg                 [31:0]  spiTxHR;
    reg                 [5:0]   spiBitcountHR;
    reg                         spiStart,spiStop;

    `ifdef USE_BUS_CLOCK

    reg                         spiCycleComplete;
    reg                         spiStartCycle;
    reg                         spiStopCycle;
    reg                         spiCycle;
    reg                 [31:0]  spiHR;      // spi input holding register
    always @(posedge busClk or posedge spiCycleComplete) begin

        // Load the control bits
        if (spiCycleComplete) begin
            spiStartCycle <= 0;
            spiStopCycle <= 0;
        end
        else if (cs & wr0) begin
            casex (addr)
                `SPIGW_CONTROL: begin
                    spiStartCycle <= dataIn[0];
                    spiStopCycle <= dataIn[1];
                end
                default: ;
            endcase
        end

        if (spiCycleComplete) begin
            spiCycle <= 0;
        end
        else if (cs) begin
            casex (addr)
                `SPIGW_CYCLE8: begin
                    spiCycle <= wr0;
                end
                `SPIGW_CYCLE16: begin
                    spiCycle <= wr1;
                end
                `SPIGW_CYCLE32: begin
                    spiCycle <= wr3;
                end
                default: ;
            endcase
        end
    end

    always @(posedge busClk) begin

        // Load the shift register
        if (cs & wr0) begin
            casex (addr)
                `SPIGW_CYCLE32,
                `SPIGW_CYCLE16,
                `SPIGW_CYCLE8: begin
                    spiTxHR[31:24] <= dataIn[7:0];
                end
                default: ;
            endcase
        end
        if (cs & wr1) begin
            casex (addr)
                `SPIGW_CYCLE32,
                `SPIGW_CYCLE16: begin
                    spiTxHR[23:16] <= dataIn[15:8];
                end
                default: ;
            endcase
        end
        if (cs & wr2) begin
            casex (addr)
                `SPIGW_CYCLE32: begin
                    spiTxHR[15:8] <= dataIn[23:16];
                end
                default: ;
            endcase
        end
        if (cs & wr3) begin
            casex (addr)
                `SPIGW_CYCLE32: begin
                    spiTxHR[7:0] <= dataIn[31:24];
                end
                default: ;
            endcase
        end
        // Load the size parameters
        if (cs & wr0) begin
            casex (addr)
                `SPIGW_CYCLE32: begin
                    spiBitcountHR <= 31;
                end
                `SPIGW_CYCLE16: begin
                    spiBitcountHR <= 15;
                end
                `SPIGW_CYCLE8: begin
                    spiBitcountHR <= 7;
                end
                default: ;
            endcase
        end

    end

    // Readback Mux
    always @* begin
        if (cs) begin
            casex (addr)
                `SPIGW_CYCLE32:     dataOut = {spiHR[7:0],spiHR[15:8],spiHR[23:16],spiHR[31:24]};
                `SPIGW_CYCLE16:     dataOut = {spiHR[7:0],spiHR[15:8],spiHR[7:0],spiHR[15:8]};
                `SPIGW_CYCLE8:      dataOut = {spiHR[7:0],spiHR[7:0],spiHR[7:0],spiHR[7:0]};
                `SPIGW_CONTROL:     dataOut = {spiCycle,29'b0,spiStopCycle,spiStartCycle};
                default:            dataOut = 32'h0;
            endcase
        end
        else begin
            dataOut = 32'hx;
        end
    end

    `endif //USE_BUS_CLOCK



    //--------------------------- SPI Interface -------------------------------
    /*
    */

    // Create a spi clock
    reg             [0:0]   spiClkCount;
    `define                 SPI_CLK_DIV     2
    wire                    spiClkEnable;
    reg                     spiClkLow;
    reg                     spiClkNegEdgeEn;
    reg                     spiClkPosEdgeEn;
    always @(posedge clk) begin
        if (reset) begin
            spiClkCount <= `SPI_CLK_DIV-1;
            spiClk <= 0;
            spiClkLow <= 1;
        end
        else if (spiClkCount == 0) begin
            spiClkCount <= `SPI_CLK_DIV-1;
            spiClk <= spiClkLow & spiClkEnable;
            spiClkLow <= ~spiClkLow;
        end
        else begin
            spiClkCount <= spiClkCount - 1;
        end
        spiClkNegEdgeEn <= (spiClkCount == 1) & !spiClkLow;
        spiClkPosEdgeEn <= (spiClkCount == 1) & spiClkLow;
    end

    // Sync up the control signals to the system clock
    reg             [1:0]   spiStartSR;
    wire                    spiStartEn = (spiStartSR == 2'b11);
    reg             [1:0]   spiStopSR;
    wire                    spiStopEn = (spiStopSR == 2'b11);
    reg             [1:0]   spiCycleSR;
    wire                    spiCycleEn = (spiCycleSR == 2'b11);
    always @(posedge clk) begin
        if (spiClkNegEdgeEn) begin
            spiStartSR <= {spiStartSR[0],spiStartCycle};
            spiStopSR <= {spiStopSR[0],spiStopCycle};
            spiCycleSR <= {spiCycleSR[0],spiCycle};
        end
    end

    reg             [1:0]   spiState;
        `define SPIGW_IDLE        2'b00
        `define SPIGW_SHIFT       2'b01
        `define SPIGW_COMPLETE    2'b11
    reg             [5:0]   spiBitcount;
    reg                 [31:0]  spiTxSR;
    assign                  spiClkEnable = (spiState == `SPIGW_SHIFT);
    always @(posedge clk) begin
        if (reset) begin
            spiCS <= 0;
            spiCycleComplete <= 1;
            spiState <= `SPIGW_IDLE;
        end
        // This clock enable makes it run on the negative edge of spiClk
        else if (spiClkNegEdgeEn) begin
            case (spiState)
                `SPIGW_IDLE: begin
                    spiCycleComplete <= 0;
                    spiBitcount <= spiBitcountHR;
                    spiTxSR <= spiTxHR;
                    if (spiCycleEn) begin
                        spiState <= `SPIGW_SHIFT;
                        if (spiStartEn) begin
                            spiCS <= 1;
                        end
                    end
                end
                `SPIGW_SHIFT: begin
                    spiTxSR <= {spiTxSR[30:0],1'b0};
                    if (spiBitcount == 0) begin
                        spiState <= `SPIGW_COMPLETE;
                        if (spiStopEn) begin
                            spiCS <= 0;
                        end
                    end
                    else begin
                        spiBitcount <= spiBitcount - 1;
                    end
                end
                `SPIGW_COMPLETE: begin
                    spiCycleComplete <= 1;
                    if (spiCycle == 0) begin
                        spiState <= `SPIGW_IDLE;
                    end
                end

                default: begin
                    spiCS <= 0;
                    spiCycleComplete <= 0;
                    spiState <= `SPIGW_IDLE;
                end
            endcase
        end
    end

    always @(posedge clk) begin
        if (reset) begin
        end
        // This clock enable makes it run on the positive edge of spiClk
        else if (spiClkPosEdgeEn) begin
            if (spiClkEnable) begin
                spiHR <= {spiHR[30:0],spiDataIn};
            end
        end
    end


    assign spiDataOut = spiTxSR[31];

endmodule

