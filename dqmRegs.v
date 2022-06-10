`timescale 1ns/10ps

`include "addressMap.v"

module dqmRegs(
    `ifdef USE_BUS_CLOCK
    input                       busClk,
    `endif
    input               [12:0]  addr,
    input               [31:0]  dataIn,
    output  reg         [31:0]  dataOut,
    input                       cs,
    input                       wr0, wr1, wr2, wr3,
    input       signed  [15:0]  log10MSE,
    output  reg signed  [15:0]  log10MseOffset,
    output  reg         [15:0]  mseMean,
    output  reg         [15:0]  mseAvgLength,
    output  reg         [13:0]  payloadSize,
    `ifdef DQM_USE_DPLL
    output  reg         [31:0]  dllCenterFreq,
    `else
    output  reg         [15:0]  clksPerBit,
    `endif
    output  reg         [3:0]   sourceSelect
);

    `ifdef USE_BUS_CLOCK
    always @(posedge busClk) begin
        if (cs & wr0) begin
            casex (addr)
                `DQM_MSE_CONTROL:   mseMean[7:0] <= dataIn[7:0];
                `ifdef DQM_USE_DPLL
                `DQM_DLL_FREQUENCY: dllCenterFreq[7:0] <= dataIn[7:0];
                `else 
                `DQM_CLKS_PER_BIT:  clksPerBit[7:0] <= dataIn[7:0];
                `endif
                `DQM_SRC_SELECT:    sourceSelect <= dataIn[3:0];
                default: ;
            endcase
        end
    end

    always @(posedge busClk) begin
        if (cs & wr1) begin
            casex (addr)
                `DQM_MSE_CONTROL:   mseMean[15:8] <= dataIn[15:8];
                `ifdef DQM_USE_DPLL
                `DQM_DLL_FREQUENCY: dllCenterFreq[15:8] <= dataIn[15:8];
                `else 
                `DQM_CLKS_PER_BIT:  clksPerBit[15:8] <= dataIn[15:8];
                `endif
                default:  ;
            endcase
        end
    end

    always @(posedge busClk) begin
        if (cs & wr2) begin
            casex (addr)
                `DQM_LOG10MSE:      log10MseOffset[7:0]  <= dataIn[23:16];
                `DQM_MSE_CONTROL:   mseAvgLength[7:0] <= dataIn[23:16];
                `ifdef DQM_USE_DPLL
                `DQM_DLL_FREQUENCY: dllCenterFreq[23:16] <= dataIn[23:16];
                `endif 
                `DQM_PAYLOAD_SIZE:  payloadSize[7:0] <= dataIn[23:16];
                default: ;
            endcase
        end
    end

    always @(posedge busClk) begin
        if (cs & wr3) begin
            casex (addr)
                `DQM_LOG10MSE:      log10MseOffset[15:8]  <= dataIn[31:24];
                `DQM_MSE_CONTROL:   mseAvgLength[15:8] <= dataIn[31:24];
                `ifdef DQM_USE_DPLL
                `DQM_DLL_FREQUENCY: dllCenterFreq[31:24] <= dataIn[31:24];
                `endif 
                `DQM_PAYLOAD_SIZE:  payloadSize[13:8] <= dataIn[29:24];
                default:  ;
            endcase
        end
    end


    always @* begin
        if (cs) begin
            casex (addr)
                `ifdef DQM_USE_DPLL

                `DQM_MSE_CONTROL:   dataOut = {mseAvgLength,mseMean};
                `DQM_LOG10MSE:      dataOut = {log10MseOffset,log10MSE};
                `DQM_DLL_FREQUENCY: dataOut = {dllCenterFreq};
                `DQM_SRC_SELECT:    dataOut = {2'b0,payloadSize,12'b0,sourceSelect};
                `DQM_PAYLOAD_SIZE:  dataOut = {2'b0,payloadSize,12'b0,sourceSelect};

                `else //DQM_USE_DPLL

                `DQM_MSE_CONTROL:   dataOut = {mseAvgLength,mseMean};
                `DQM_LOG10MSE:      dataOut = {log10MseOffset,log10MSE};
                `DQM_CLKS_PER_BIT:  dataOut = {2'b0,payloadSize,clksPerBit};
                `DQM_PAYLOAD_SIZE:  dataOut = {2'b0,payloadSize,clksPerBit};
                `DQM_SRC_SELECT:    dataOut = {28'b0,sourceSelect};

                `endif //DQM_USE_DPLL
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
