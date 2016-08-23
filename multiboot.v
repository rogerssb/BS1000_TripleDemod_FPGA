// multiboot.v
// Verne Stauffer
// January 30, 2015

module multiboot(clk, pulse, addr, reset);

input clk, pulse, reset;
input [23:0] addr;
reg [8:0] mem [23:0];

always @ (posedge clk) begin
    if (pulse) begin
        mem[0] = 9'h0ff;
        mem[1] = 9'h0ff;
        mem[2] = 9'h1aa;
        mem[3] = 9'h199;
        mem[4] = 9'h132;
        mem[5] = 9'h161;
        mem[6] = {1'b1,addr[15:8]};
        mem[7] = {1'b1,addr[7:0]};
        mem[8] = 9'h132;
        mem[9] = 9'h181;
        mem[10] = 9'h10b;
        mem[11] = {1'b1,addr[23:16]};
        mem[12] = 9'h130;
        mem[13] = 9'h1a1;
        mem[14] = 9'h100;
        mem[15] = 9'h10e;
        mem[16] = 9'h120;
        mem[17] = 9'h100;
        mem[18] = 9'h120;
        mem[19] = 9'h100;
        mem[20] = 9'h000;
        mem[21] = 9'h000;
        mem[22] = 9'h000;
        mem[23] = 9'h000;
    end
end

// data writes
reg [7 : 0] cnt;
always @ (posedge clk)
    if (reset) cnt <= 8'd255;
    else if (pulse) cnt <= 8'd0;
    else if (cnt < 8'd24) cnt <= cnt + 8'd1;

reg [8:0] mem_bits;
reg [7:0] i;
reg ena;

always @ (posedge clk) begin
    if (reset) begin
        mem_bits <= 9'd0;
        i <= 8'd0;
        ena <= 1'd1;
    end
    else begin
        mem_bits <= mem[cnt];
        i <= mem_bits[7:0];
        ena <= !mem_bits[8];
    end
end

ICAP_SPARTAN3A icap
    (
    .BUSY(),
    .O(),
    .CE(ena),
    .CLK(clk),
    .I({i[0],i[1],i[2],i[3],i[4],i[5],i[6],i[7]}),
    .WRITE(ena)
    );

endmodule