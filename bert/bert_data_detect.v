`timescale 1ns / 10 ps

module bert_data_detect (
  reset,
  clock,
  enable,
  data,
  no_data
);

// Since data loss is a big deal, a fixed threshold
// is okay rather than adjusting to the poly length.

parameter same_bit_threshold = 30;

input reset;
input clock;
input enable;
input data;
output no_data;

reg data_delay;
reg no_data;

always @ (posedge clock) begin
  if (enable) begin
    data_delay <= data;
  end
end

reg [4:0] same_bit_count;

always @ (posedge clock) begin
  if (reset) begin
    same_bit_count <= 5'b0;
  end
  else if (enable) begin
    if (data_delay == data) begin
      if (same_bit_count < same_bit_threshold) begin
        same_bit_count <= same_bit_count + 5'd1;
      end
    end
    else begin
      same_bit_count <= 5'b0;
    end
  end
end

wire same_bit = (same_bit_count == same_bit_threshold);

reg state, next_state;

always @ (posedge clock) begin
  if (enable) begin
    state <= next_state;
  end
end

always @* begin
  if (reset) begin
    next_state <= 1'd0;
  end
  else begin
    case (state)
      1'd0: begin
        if (same_bit) begin
          next_state <= 1'd1;
        end
        else begin
          next_state <= 1'd0;
        end
      end
      1'd1: begin
        if (!same_bit) begin
          next_state <= 1'd0;
        end
        else begin
          next_state <= 1'b1;
        end
      end
    endcase
  end
end

always @* no_data = (state == 1'd1);

endmodule
