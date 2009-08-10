`timescale 1ns/1ps
module bitFifo(clk,reset,enIn,enOut,din,dout);
input   clk;
input   reset;
input   enIn,enOut;
input   din;
output  dout;

reg     [3:0]   fifo;
reg     [2:0]   depth;
reg     [1:0]   rdAddr,wrAddr;
reg             outputEn;
wire            rdEn = (enOut && outputEn);
always @(posedge clk) begin
    if (reset || (depth == 4)) begin
        rdAddr <= 0;
        wrAddr <= 0;
        depth <= 0;
        outputEn <= 0;
        end
    else begin
        // check startup condition
        if (depth > 1) begin
            outputEn <= 1;
            end
        // Fifo addresses
        if (enIn) begin
            wrAddr <= wrAddr + 1;
            end
        if (rdEn) begin
            rdAddr <= rdAddr + 1;
            end
        // Fifo Depth
        if (enIn && rdEn) begin
            depth <= depth;
            end
        else if (enIn && (depth < 4)) begin
            depth <= depth + 1;
            end
        else if (rdEn && (depth > 0)) begin
            depth <= depth - 1;
            end
        // Data write
        if (enIn) begin
            fifo[wrAddr] <= din;
            end
        end
    end

// Data read
reg     dout;
always @(fifo or rdAddr) begin
    dout = fifo[rdAddr];
    end

endmodule
