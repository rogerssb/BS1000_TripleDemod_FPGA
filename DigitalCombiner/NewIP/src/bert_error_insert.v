`timescale 1ns / 10 ps

module bert_error_insert (
  reset,
  clock,
  enable,
  one_error_enable,
  e3_errors_enable,
  error_insert
);

input reset;
input clock;
input enable;
input one_error_enable;
input e3_errors_enable;
output error_insert;

reg error_insert;
reg [9:0] e3_errors_count;
reg [2:0] one_error;

always @ (posedge clock) begin
  if (reset) begin
    e3_errors_count <= 10'd1;
  end
  else if (enable) begin
    if (e3_errors_count == 10'd1000) begin
      e3_errors_count <= 10'd1;
    end
    else begin
      e3_errors_count <= e3_errors_count + 10'd1;
    end
  end
end

always @ (posedge clock) begin
  if (reset) begin
    one_error <= 2'b0;
  end
  else if (enable) begin
    one_error <= {one_error_enable, one_error[2:1]};
  end
end

always @* begin
  error_insert = (one_error == 3'b110) || (e3_errors_enable && (e3_errors_count == 10'd1000));
end

endmodule
