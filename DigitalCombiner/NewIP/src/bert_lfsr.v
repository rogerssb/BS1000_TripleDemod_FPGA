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
  serial
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

endmodule