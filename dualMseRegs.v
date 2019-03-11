
`timescale 1ns/10ps

`include "addressMap.v"

module dualMseRegs(
    `ifdef USE_BUS_CLOCK
    input                       busClk,
    `endif
    input                       cs,
    input                       wr0, wr1, wr2, wr3,
    input               [12:0]  addr,
    input               [31:0]  dataIn,
    output  reg         [31:0]  dataOut,
    input       signed  [15:0]  ch0MSE,
    output  reg signed  [15:0]  ch0MseOffset,
    output  reg         [15:0]  ch0MseMean,
    output  reg         [15:0]  ch0MseAvgLength,
    input       signed  [15:0]  ch1MSE,
    output  reg signed  [15:0]  ch1MseOffset,
    output  reg         [15:0]  ch1MseMean,
    output  reg         [15:0]  ch1MseAvgLength
);

    `ifdef USE_BUS_CLOCK
    always @(posedge busClk) begin
        if (cs & wr0) begin
            casex (addr)
                `DMSE_CH0_MEAN:         ch0MseMean[7:0] <= dataIn[7:0];
                `DMSE_CH1_MEAN:         ch1MseMean[7:0] <= dataIn[7:0];
                default: ;
            endcase
        end
    end

    always @(posedge busClk) begin
        if (cs & wr1) begin
            casex (addr)
                `DMSE_CH0_MEAN:         ch0MseMean[15:8] <= dataIn[15:8];
                `DMSE_CH1_MEAN:         ch1MseMean[15:8] <= dataIn[15:8];
                default:  ;
            endcase
        end
    end

    always @(posedge busClk) begin
        if (cs & wr2) begin
            casex (addr)
                `DMSE_CH0_AVG_LENGTH:   ch0MseAvgLength[7:0] <= dataIn[23:16];
                `DMSE_CH0_MSE_OFFSET:   ch0MseOffset[7:0]  <= dataIn[23:16];
                `DMSE_CH1_AVG_LENGTH:   ch1MseAvgLength[7:0] <= dataIn[23:16];
                `DMSE_CH1_MSE_OFFSET:   ch1MseOffset[7:0]  <= dataIn[23:16];
                default: ;
            endcase
        end
    end

    always @(posedge busClk) begin
        if (cs & wr3) begin
            casex (addr)
                `DMSE_CH0_AVG_LENGTH:   ch0MseAvgLength[15:8] <= dataIn[31:24];
                `DMSE_CH0_MSE_OFFSET:   ch0MseOffset[15:8]  <= dataIn[31:24];
                `DMSE_CH1_AVG_LENGTH:   ch1MseAvgLength[15:8] <= dataIn[31:24];
                `DMSE_CH1_MSE_OFFSET:   ch1MseOffset[15:8]  <= dataIn[31:24];
                default:  ;
            endcase
        end
    end


    always @* begin
        if (cs) begin
            casex (addr)
                `DMSE_CH0_MEAN:         dataOut = {ch0MseAvgLength,ch0MseMean};
                `DMSE_CH0_AVG_LENGTH:   dataOut = {ch0MseAvgLength,ch0MseMean};
                `DMSE_CH0_MSE:          dataOut = {ch0MseOffset,ch0MSE};
                `DMSE_CH0_MSE_OFFSET:   dataOut = {ch0MseOffset,ch0MSE};
                `DMSE_CH1_MEAN:         dataOut = {ch1MseAvgLength,ch1MseMean};
                `DMSE_CH1_AVG_LENGTH:   dataOut = {ch1MseAvgLength,ch1MseMean};
                `DMSE_CH1_MSE:          dataOut = {ch1MseOffset,ch1MSE};
                `DMSE_CH1_MSE_OFFSET:   dataOut = {ch1MseOffset,ch1MSE};
                default:            dataOut = 32'h0;
            endcase
        end
        else begin
            dataOut = 32'hx;
        end
    end

    `else //USE_BUS_CLOCK

    `endif //USE_BUS_CLOCK

endmodule

