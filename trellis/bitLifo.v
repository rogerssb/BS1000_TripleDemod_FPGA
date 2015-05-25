`timescale 1ns/1ps
module bitLifo(clk,reset,enIn,enOut,din,dout);
input   clk;
input   reset;
input   enIn;
input   enOut;
input   din;
output  dout;

reg     [3:0]   lifo;
reg     [2:0]   depth;
reg     [1:0]   rdAddr;
reg     [1:0]   wrAddr;
reg             outputAvailable;
reg             dout;
wire            rdEn = (enOut && outputAvailable);
always @(posedge clk) begin
    if (reset || (depth == 4)) begin
        rdAddr <= 3;
        wrAddr <= 0;
        depth <= 0;
        outputAvailable <= 0;
        end
    else begin
        // check startup condition
        if (depth > 1) begin
            outputAvailable <= 1;
            end
        // Fifo addresses
        if (enIn && !rdEn) begin
            rdAddr <= rdAddr + 1;
            wrAddr <= wrAddr + 1;
            end
        else if (!enIn && rdEn) begin
            rdAddr <= rdAddr - 1;
            wrAddr <= wrAddr - 1;
            end
        // Fifo Depth
        if (enIn && rdEn) begin
            depth <= depth;
            end
        else if ( enIn && !rdEn && (depth < 4)) begin
            depth <= depth + 1;
            end
        else if (!enIn &&  rdEn && (depth > 0)) begin
            depth <= depth - 1;
            end
        // Data write
        if (enIn && !rdEn) begin
            lifo[wrAddr] <= din;
            end
        end
        // Output
        if (enIn && rdEn) begin
            dout <= din;
            end
        else if (rdEn) begin
            dout <= lifo[rdAddr];
            end
    end

endmodule
