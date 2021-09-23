module multibootK7(
    input           clk, 
    input           pulse, 
    input   [31:0]  addr, 
    input           reset
);

    reg [32:0] mem [7:0];

    always @ (posedge clk) begin
        if (pulse) begin
            // Dummy Word
            mem[0] = 33'h0_ff_ff_ff_ff;
            // Sync Word
            mem[1] = 33'h1_aa_99_55_66;
            // NOOP
            mem[2] = 33'h1_20_00_00_00;
            // Write 1 Word to WBSTAR
            mem[3] = 33'h1_30_02_00_01;
            // Load the address
            mem[4] = {1'b1,8'h00,addr[31:8]};
            // Write 1 Word to CMD
            mem[5] = 33'h1_30_00_80_01;
            // IPROG Command
            mem[6] = 33'h1_00_00_00_0f;
            // NOOP
            mem[7] = 33'h1_20_00_00_00;
        end
    end

// data writes
reg [7 : 0] cnt;
always @ (posedge clk)
    if (reset) cnt <= 8'd255;
    else if (pulse) cnt <= 8'd0;
    else if (cnt < 8'd8) cnt <= cnt + 8'd1;

reg [32:0] d;
reg [31:0] i;
reg ena;

always @ (posedge clk) begin
    if (reset) begin
        d <= 33'd0;
        i <= 32'd0;
        ena <= 1'd1;
    end
    else begin
        d <= mem[cnt];
        // Bit reverse the bytes
        i <= {
              d[24],d[25],d[26],d[27],d[28],d[29],d[30],d[31],
              d[16],d[17],d[18],d[19],d[20],d[21],d[22],d[23],
              d[ 8],d[ 9],d[10],d[11],d[12],d[13],d[14],d[15],
              d[ 0],d[ 1],d[ 2],d[ 3],d[ 4],d[ 5],d[ 6],d[ 7]
             };
        ena <= !d[32];
    end
end

ICAPE2 icape
    (
    .CLK(clk),
    .CSIB(ena),
    .I(i),
    .O(),
    .RDWRB(ena)
    );

endmodule