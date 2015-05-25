`timescale 1ns / 10 ps

module multihEQ( 
    clk, reset, sync,
    din,
    dout
    );

input clk;
input reset;
input sync;
input  [11:0]din;
output [11:0]dout;

// Data shift register
reg     [11:0]sr0,sr1;
reg     [11:0]midTap0,midTap1;
reg     [12:0]sum;
always @(posedge clk) begin
    if (sync) begin
        sr0 <= din;
        sr1 <= sr0;
        // Add the symmetric taps
        sum <= {din[11],din} + {sr1[11],sr1};
        midTap0 <= sr0;
        midTap1 <= midTap0;
        end
    end

// Tap Mpy
wire    [21:0]  tap;
oneThird mpy0(
    .clk(clk),
    .ce(sync),
    .sclr(reset),
    .a(sum[12:1]),
    .p(tap)
    );

// Final sum. Scale by 3 and check for saturation.
wire    [12:0] finalSum = {midTap1[11],midTap1} + {midTap1,1'b0} 
                        - {tap[21],tap[21:10]} - tap[21:9];
reg     [11:0]  dout;
always @(posedge clk) begin
    if (reset) begin
        dout <= 0;
        end
    else if (sync) begin
        if (!finalSum[12] && finalSum[11]) begin
            dout <= 12'h7ff;
            end
        else if (finalSum[12] && !finalSum[11]) begin
            dout <= 12'h801;
            end
        else begin
            dout <= finalSum[11:0];
            end
        end
    end


`ifdef SIMULATE
real inReal;
real outReal;
always @(din) inReal = (din[11] ? (din - 4096.0) : din)/2048.0;
always @(dout) outReal = (dout[11] ? (dout - 4096.0) : dout)/2048.0;
`endif

endmodule



