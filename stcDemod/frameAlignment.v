`timescale 1ns/100ps
//`include "addressMap.v"
`include "defines.v"

module frameAlignment
    #(parameter START_OFFSET = 0,
      parameter CLKS_PER_OUTPUT = 4) (
    input                   clk,
    input                   clkEn,
    input                   reset,
    input                   startOfFrame,       // start of frame, not start of trellis activiy
    input                   startOfTrellis,     // Estimates are complete, start Trellis process
    input                   valid,
    input   signed  [17:0]  dinReal,
    input   signed  [17:0]  dinImag,
    output                  clkEnOut,
    output  reg             interpolate,
    output  signed  [17:0]  doutReal,
    output  signed  [17:0]  doutImag
);


    //------------------------------ Sample Counter ---------------------------

    reg             [14:0]  sampleCount;
    always @(posedge clk) begin
        if (reset) begin
            sampleCount <= 0;
        end
        else if (clkEn) begin
            if (startOfFrame) begin
                sampleCount <= START_OFFSET;
            end
            else if (valid) begin
                if (sampleCount < `SAMPLES_PER_FRAME) begin
                    sampleCount <= sampleCount + 1;
                end
            end
        end
    end

    //------------------------- Sample FIFO -----------------------------------

    wire                    fifoWrEn = (clkEn && valid && (sampleCount >= (`PILOT_SAMPLES_PER_FRAME-9)));
    reg                     fifoRdEn;
    fifoBuiltin512x18 fifoReal(
        .clk(clk),
        .rst(startOfFrame),
        .din(dinReal),
        .wr_en(fifoWrEn),
        .rd_en(fifoRdEn),
        .dout(doutReal),
        .full(),
        .empty(),
        .valid(fifoOutputValid)
    );
    fifoBuiltin512x18 fifoImag(
        .clk(clk),
        .rst(startOfFrame),
        .din(dinImag),
        .wr_en(fifoWrEn),
        .rd_en(fifoRdEn),
        .dout(doutImag),
        .full(),
        .empty(),
        .valid()
    );

    //-------------------------- Output State Machine -------------------------

    reg                     outputState;
        `define WAIT_VALID          1'b0
        `define WAIT_DECIMATION     1'b1
    reg             [2:0]   decimationCount;
    reg             [14:0]  outputCount;
    reg             [8:0]   trellisInitCnt;
    always @(posedge clk) begin
        if (reset) begin
            outputState <= `WAIT_VALID;
            fifoRdEn <= 0;
            outputCount <= 0;
            interpolate <= 0;
        end
        else if (clkEn) begin
            if (startOfFrame) begin
                decimationCount <= CLKS_PER_OUTPUT-1;
                outputCount <= 0;
                outputState <= `WAIT_VALID;
                fifoRdEn <= 0;
                trellisInitCnt <= 130;
            end
            else begin
                if (startOfTrellis) begin
                    trellisInitCnt <= 128;
                end
                else if ((trellisInitCnt < 130) && (trellisInitCnt > 0)) begin
                    trellisInitCnt <= trellisInitCnt - 1;
                end

                case (outputState)
                    `WAIT_VALID:  begin
                        if ((fifoOutputValid == 1'b1) && (trellisInitCnt == 0)) begin
                            fifoRdEn <= 1;
                            if (CLKS_PER_OUTPUT > 1) begin
                                decimationCount <= decimationCount - 1;
                                outputState <= `WAIT_DECIMATION;
                            end
                        end
                        else begin
                            fifoRdEn <= 0;
                        end
                    end
                    `WAIT_DECIMATION: begin
                        fifoRdEn <= 0;
                        if (decimationCount > 0) begin
                            decimationCount <= decimationCount - 1;
                        end
                        else begin
                            decimationCount <= CLKS_PER_OUTPUT-1;
                            outputState <= `WAIT_VALID;
                        end
                    end
                    default: begin
                        outputState <= `WAIT_VALID;
                        decimationCount <= CLKS_PER_OUTPUT-1;
                        fifoRdEn <= 0;
                    end
                endcase
            end
            if (clkEnOut) begin
                outputCount <= outputCount + 1;
                interpolate <= (outputCount[1:0] == 2'b10);
            end
        end
    end
    assign  clkEnOut = (fifoRdEn && fifoOutputValid);

endmodule
