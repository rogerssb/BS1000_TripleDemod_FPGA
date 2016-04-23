`timescale 1ns / 10 ps

module bert_correlator (
  poly,
  poly_length,
  poly_mode,
  reset,
  clock,
  enable,
  lfsr_enable,
  reload,
  data,
  data_bit,
  code_bit
);

input [23:0] poly;
input [4:0] poly_length;
input poly_mode;
input reset;
input clock;
input enable;
input lfsr_enable;
input reload;
input data;
output data_bit;
output code_bit;

`include "bert_functions.v"

wire [23:0] poly_in = poly_mode ? mirror_taps (poly, poly_length) : poly;

reg [23:0] data_buffer;
always @ (posedge clock) begin
  if (reset) begin
    data_buffer <= 24'h0;
  end
  else if (enable) begin
    data_buffer <= {data_buffer[22:0], data};
  end
end

wire [23:0] code;

bert_lfsr bert_lfsr (
  .poly(poly_in),
  .poly_length(poly_length),
  .reset(reset),
  .clock(clock),
  .enable(lfsr_enable),
  .reload(reload),
  .load_data(data_buffer),
  .data(code),
  .serial()
);

wire next_data_bit = data_buffer[poly_length - 5'd1];
wire next_code_bit = code[poly_length - 5'd2];

reg data_bit, code_bit;
always @ (posedge clock) begin
  if (enable) begin
    data_bit <= next_data_bit;
    code_bit <= next_code_bit;
  end
end

endmodule