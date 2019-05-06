`timescale 1ns/100ps
//`include "addressMap.v"
`include "defines.v"

module frameAlignment
    #(parameter START_OFFSET = 0,
      parameter CLKS_PER_OUTPUT = 4) (
    input                   clk,
    input                   clkEn,
    input                   reset,
    input                   start,
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
    reg                     frameStart;
    always @(posedge clk) begin
        if (reset) begin
            frameStart <= 0;
        end
        else if (clkEn) begin
            if (start) begin
                frameStart <= 1;
                sampleCount <= START_OFFSET;
            end
            else if (valid & frameStart) begin
                if (sampleCount < `SAMPLES_PER_FRAME) begin
                    sampleCount <= sampleCount + 1;
                end
                else begin
                    frameStart <= 0;
                end
            end
        end
    end

    //------------------------- Sample FIFO -----------------------------------

    wire                    fifoWrEn = (clkEn && valid && (sampleCount >= (`PILOT_SAMPLES_PER_FRAME-4)));
    reg                     fifoRdEn;
    fifoBuiltin512x18 fifoReal(
        .clk(clk),
        .rst(reset),
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
        .rst(reset),
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
    always @(posedge clk) begin
        if (reset) begin
            outputState <= `WAIT_VALID;
            fifoRdEn <= 0;
        end
        else if (clkEn) begin
            if (start) begin
                decimationCount <= CLKS_PER_OUTPUT-1;
                outputCount <= 0;
                outputState <= `WAIT_VALID;
                fifoRdEn <= 0;
            end
            else begin
                case (outputState)
                    `WAIT_VALID:  begin
                        if (fifoOutputValid) begin
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
