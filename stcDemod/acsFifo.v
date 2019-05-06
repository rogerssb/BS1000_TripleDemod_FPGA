`timescale 1ns/1ps

module acsFifo(
    input                   clk,
    input                   srst,
    input                   wr_en,
    input           [17:0]  din,
    input                   rd_en,
    output          [17:0]  dout,
    output                  full,
    output                  empty
);
    parameter LOG2DEPTH = 3;

    reg             [17:0]          fifoMem[0:((2**LOG2DEPTH)-1)];
    reg             [LOG2DEPTH:0]   wrAddr;
    integer                         i;
    always @(posedge clk) begin
        if (srst) begin
            wrAddr <= 0;
            for (i = 0; i < (2**LOG2DEPTH); i = i + 1) begin
                fifoMem[i] <= 0;
            end
        end
        else if (wr_en) begin
            if (!full) begin
                wrAddr <= wrAddr + 1;
                fifoMem[wrAddr[(LOG2DEPTH-1):0]] <= din;
            end
        end
    end

    reg             [LOG2DEPTH:0]   rdAddr;
    always @(posedge clk) begin
        if (srst) begin
            rdAddr <= 0;
        end
        else if (rd_en) begin
            if (!empty) begin
                rdAddr <= rdAddr + 1;
            end
        end
    end
    
    assign empty = (wrAddr == rdAddr);
    assign full = ((wrAddr - rdAddr) == (2**LOG2DEPTH));
    assign dout = fifoMem[rdAddr[(LOG2DEPTH-1):0]];

endmodule

