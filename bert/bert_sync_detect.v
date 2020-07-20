`timescale 1ns / 10 ps

module bert_sync_detect (
  threshold,
  no_data,
  switch,
  reset,
  clock,
  enable,
  data,
  data_enable,
  reload,
  insync
);

input [7:0] threshold;
input no_data;
input switch;
input reset;
input clock;
input enable;
input data;
input data_enable;
output reload;
reg reload;
output insync;

// some number of bits must pass between a reload and
// having valid data to analyze and it is senseless to
// reload without testing data from a prior reload

reg [7:0] reload_recovery_count;
reg [7:0] reload_recovery_period = 8'd32;

always @ (posedge clock) begin
  if (reset) begin
    reload_recovery_count <= 8'd0;
  end
  else if (enable) begin
    if (reload) begin
      reload_recovery_count <= reload_recovery_period;
    end
    else if (reload_recovery_count > 8'd0) begin
      reload_recovery_count <= reload_recovery_count - 8'd1;
    end
  end
end

wire recovery_timeout = (reload_recovery_count == 8'd0);

wire error = data;

// decision counter is reset until recovery period timeout
// then counts up on error and down otherwise

reg [7:0] count;
reg count_clear;
reg insync;

always @ (posedge clock) begin
  if (reset) begin
    count <= 8'd0;
    insync <= 0;
  end
  else if (enable) begin
    if (count_clear) begin
      count <= {1'b0,threshold[7:1]};
      insync <= 0;
    end
    else if (data_enable) begin
      if (error) begin
        if (count < 8'hF8) begin
          count <= count + 8'h02;
        end
      end
      else begin
        if (count > 8'h08) begin
          count <= count - 8'h01;
        end
        else begin
          insync <= 1;
        end
      end
    end
  end
end

reg [1:0] state, next_state;

always @ (posedge clock) begin
  if (enable) begin
    state <= next_state;
  end
end

always @* begin
  if (reset) begin
    next_state <= 2'd0;
  end
  else begin
    case (state)
      2'd0: begin // reload
        next_state <= 2'd1;
      end
      2'd1: begin // wait on recovery timeout, clear count on timeout
        if (recovery_timeout) begin
          next_state <= 2'd2;
        end
        else begin
          next_state <= 2'd1;
        end
      end
      2'd2: begin // wait on a trigger to reload
        if (count > threshold) begin
          next_state <= 2'd3;
        end
        else begin
          next_state <= 2'd2;
        end
      end
      2'd3: begin
        next_state <= 2'd0;
      end
    endcase
  end
end

always @* count_clear = (state == 2'd1) && (next_state == 2'd2);
always @* reload = (state == 2'd0);

endmodule
