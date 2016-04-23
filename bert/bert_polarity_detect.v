`timescale 1ns / 10 ps

module bert_polarity_detect (
  threshold,
  reset,
  clock,
  enable,
  corr1_error,
  corr2_error,
  switch
);

input [7:0] threshold;
input reset;
input clock;
input enable;
input corr1_error;
input corr2_error;
output switch;

reg [7:0] count;

always @ (posedge clock) begin
  if (reset) begin
    count <= 8'd0;
  end
  else if (enable) begin
    if (corr1_error && !corr2_error) begin
      if (count != 8'h7F) begin
        count <= count + 8'h01;
      end
    end
    else if (!corr1_error && corr2_error) begin
      if (count != 8'h80) begin
        count <= count - 8'h01;
      end
    end
  end
end

reg state, next_state;

always @ (posedge clock) begin
  if (enable) begin
    state <= next_state;
    end
end

always @* begin
  if (reset) begin
    next_state <= 1'b0;
  end
  else begin
    case (state)
      1'b0: begin
        if (count[7] && (count < -threshold)) begin
          next_state <= 1'b1;
        end
        else begin
          next_state <= 1'b0;
        end
      end
      1'b1: begin
        if (!count[7] && (count > threshold)) begin
          next_state <= 1'b0;
        end
        else begin
          next_state <= 1'b1;
        end
      end
    endcase
  end
end

assign switch = !state;

endmodule
