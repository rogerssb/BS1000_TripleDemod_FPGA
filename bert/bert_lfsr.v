
`timescale 1ns / 10 ps

module bert_lfsr (
  poly,
  poly_length,
  reset,
  clock,
  enable,
  reload,
  load_data,
  data,
  serial,
  serialC
);

input [23:0] poly;
input [4:0] poly_length;
input reset;
input clock;
input enable;
input reload;
input [23:0] load_data;
output [23:0] data;
output serial;
output serialC;

reg [23:0] data;
wire [23:0] next_data = {data[22:0], ^(poly & data)};

always @ (posedge clock) begin
  if (reset) begin
    data <= 24'h000099;
  end
  else if (enable) begin
    if (reload) begin
      data <= load_data;
    end
    else begin
      data <= next_data;
    end
  end
end

wire serial = data[poly_length - 5'd1];



reg     [9:0] count;
reg     [1:0] i;
wire    [3:0] pnNibble;

    RAM_2Reads_1Write # (
         .FILENAME    ("../sourceData/Iseed12345678HexData.slv"),
         .DATA_WIDTH  (4),
         .BINPT       (0),
         .FILE_IS_SLV (1'b1),
         .ADDR_WIDTH  (10),
         .MAX_ADDR    (800),
         .LATENCY     (1)
      ) ReadData
      (
         .clk     (clock),
         .ce      (1'b1),
         .reset   (1'b0),
         .WrEn    (1'b0),
         .WrAddr  (0),
         .RdAddrA (0),
         .RdAddrB (count),
         .WrData  (4'b0),
         .RdOutA  (),
         .RdOutB  (pnNibble)
      );

always @ (posedge clock) begin
    if (reset) begin
        count <= 0;
        i <= 2;
    end
    else if (enable) begin
        i <= i - 1;
        if (i == 0) begin
            count <= (count < 799) ? count + 1 : 0;
        end
    end
end

assign serialC = pnNibble[i];

endmodule