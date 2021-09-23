`timescale 1ns/10ps
`include "addressMap.v"

module ad7476Interface(
    input                       clk,
    input                       reset,
    input                       spiDin,
    output                      spiClk,
    output  reg                 spiCSn,
    output  reg signed  [11:0]  adcData,
    output  reg                 adcDataEn
);


    // Create a slower clock
    reg             [3:0]   clkCount;
    always @(posedge clk) begin
        if (reset) begin
            clkCount <= 4'b0000;
        end
        else begin
            clkCount <= clkCount + 1;
        end
    end
    
    wire                    negEdgeSpiClk;
    assign                  spiClk = clkCount[3];
    assign                  negEdgeSpiClk = (clkCount == 4'b1111);

    // State Machine
    reg             [1:0]   adcState;
        `define ADC_IDLE    2'b00
        `define ADC_START   2'b01
        `define ADC_CAPTURE 2'b11
    reg             [3:0]   bitCount;
    reg             [11:0]  spiSR;
    always @(posedge clk) begin
        if (reset) begin
            adcState <= `ADC_IDLE;
            bitCount <= 1;
            spiCSn <= 1;
            adcDataEn <= 0;
        end
        else if (negEdgeSpiClk) begin
            case (adcState)
                `ADC_IDLE: begin
                    adcDataEn <= 0;
                    if (bitCount == 0) begin
                        adcState <= `ADC_START;
                        bitCount <= 3;
                        spiCSn <= 0;
                    end
                    else begin
                        bitCount <= bitCount - 1;
                    end
                end
                `ADC_START: begin
                    if (bitCount == 0) begin
                        adcState <= `ADC_CAPTURE;
                        bitCount <= 11;
                    end
                    else begin
                        bitCount <= bitCount - 1;
                    end
                end
                `ADC_CAPTURE: begin
                    if (bitCount == 0) begin
                        adcData <= $signed({~spiSR[10],spiSR[9:0],spiDin});
                        adcDataEn <= 1;
                        adcState <= `ADC_IDLE;
                        bitCount <= 1;
                        spiCSn <= 1;
                    end
                    else begin
                        spiSR <= {spiSR[10:0],spiDin};
                        bitCount <= bitCount - 1;
                    end
                end
                default: begin
                    adcDataEn <= 0;
                    adcState <= `ADC_IDLE;
                    bitCount <= 1;
                    spiCSn <= 1;
                end
            endcase
        end
    end

endmodule

