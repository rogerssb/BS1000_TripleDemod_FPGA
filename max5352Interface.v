`timescale 1ns/10ps
`include "addressMap.v"

module max5352Interface(
    input                       clk,
    input                       reset,
    input                       dacDataEn,
    input       signed  [11:0]  dacData,
    output                      spiDout,
    output                      spiClk,
    output  reg                 spiCSn
);


    // Create a slower clock
    reg             [3:0]   clkCount;
    always @(posedge clk) begin
        if (reset) begin
            clkCount <= 0;
        end
        else begin
            clkCount <= clkCount + 1;
        end
    end
    assign                  spiClk = clkCount[3];
    assign                  posEdgeSpiClk = (clkCount == 4'b0111);
    assign                  negEdgeSpiClk = (clkCount == 4'b1111);

    // State Machine
    reg             [1:0]   dacState;
        `define DAC_IDLE    2'b00
        `define DAC_START   2'b01
        `define DAC_SHIFT   2'b11
    reg             [3:0]   bitCount;
    reg             [15:0]  spiSR;
    assign                  spiDout = spiSR[15];
    always @(posedge clk) begin
        if (reset) begin
            dacState <= `DAC_IDLE;
            spiCSn <= 1;
        end
        else begin
            case (dacState)
                `DAC_IDLE: begin
                    if (dacDataEn) begin
                        spiSR <= {3'b000,~dacData[11],dacData[10:0],1'b0};
                        dacState <= `DAC_START;
                        bitCount <= 15;
                    end
                end
                `DAC_START: begin
                    if (negEdgeSpiClk) begin
                        dacState <= `DAC_SHIFT;
                        spiCSn <= 0;
                    end
                end
                `DAC_SHIFT: begin
                    if (posEdgeSpiClk) begin
                        spiSR <= {spiSR[14:0],1'b0};
                        if (bitCount == 0) begin
                            dacState <= `DAC_IDLE;
                            spiCSn <= 1;
                        end
                        else begin
                            bitCount <= bitCount - 1;
                        end
                    end
                end
                default: begin
                    dacState <= `DAC_IDLE;
                    spiCSn <= 1;
                end
            endcase
        end
    end

endmodule

