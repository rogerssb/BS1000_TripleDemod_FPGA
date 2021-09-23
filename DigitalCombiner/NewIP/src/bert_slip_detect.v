`timescale 1ns / 10 ps

module bert_slip_detect (
  limit,
  threshold,
  reset,
  clock,
  enable,
  reload,
  data,
  code,
  lfsr_enable,
  blackout
);

input [7:0] limit;
input [7:0] threshold;
input reset;
input clock;
input enable;
input reload;
input data;
input code;
output lfsr_enable;
output blackout;

reg [2:1] data_buffer;
reg [2:0] code_buffer;

always @ (posedge clock) begin
  if (reset) begin
    data_buffer <= 2'b0;
    code_buffer <= 3'b0;
  end
  else if (enable) begin
    data_buffer <= {data, data_buffer[2]};
    code_buffer <= {code, code_buffer[2:1]};
  end
end

wire early_error = data_buffer[1] ^ code_buffer[2];
wire late_error = data_buffer[1] ^ code_buffer[0];
wire sync_error = data_buffer[1] ^ code_buffer[1];

reg [7:0] early_decision_count;
reg clear_count;

always @ (posedge clock) begin
  if (reset) begin
    early_decision_count <= 8'd0;
  end
  else if (enable) begin
    if (clear_count || reload) begin
      early_decision_count <= 8'd0;
    end
    else if (early_error) begin
      early_decision_count <= 8'd0;
    end
    else if (early_decision_count < limit) begin
      early_decision_count <= early_decision_count + 8'd1;
    end
  end
end

reg [7:0] late_decision_count;

always @ (posedge clock) begin
  if (reset) begin
    late_decision_count <= 8'd0;
  end
  else if (enable) begin
    if (clear_count || reload) begin
      late_decision_count <= 8'd0;
    end
    else if (late_error) begin
      late_decision_count <= 8'd0;
    end
    else if (late_decision_count < limit) begin
      late_decision_count <= late_decision_count + 8'd1;
    end
  end
end

reg [7:0] sync_decision_count;

always @ (posedge clock) begin
  if (reset) begin
    sync_decision_count <= 8'd0;
  end
  else if (enable) begin
    if (clear_count || reload) begin
      sync_decision_count <= 8'd0;
    end
    else if (sync_error) begin
      sync_decision_count <= 8'd0;
    end
    else if (sync_decision_count < limit) begin
      sync_decision_count <= sync_decision_count + 8'd1;
    end
  end
end

`define BERT_SM1_SYNC 4'd0
`define BERT_SM1_EARLY 4'd1
`define BERT_SM1_LATE 4'd2
// allow 4 bit times from lfsr update to valid data
`define BERT_SM1_RECOVER (`BERT_SM1_SYNC - 4'd4)
// last thing to do before returning to idle
`define BERT_SM1_CLEAR_COUNT (`BERT_SM1_SYNC - 4'd1)

reg [3:0] state, next_state;
always @ (posedge clock) begin
  if (reset) begin
    state <= `BERT_SM1_SYNC;
  end
  else if (enable) begin
    state <= next_state;
  end
end

always @* begin
  if (reset) begin
    next_state <= `BERT_SM1_SYNC;
  end
  else begin
    case (state)
      `BERT_SM1_SYNC: begin
        if ((sync_decision_count < threshold) && (early_decision_count > threshold)) begin
          next_state <= `BERT_SM1_EARLY;
        end
        else if ((sync_decision_count < threshold) && (late_decision_count > threshold)) begin
          next_state <= `BERT_SM1_LATE;
        end
        else begin
          next_state <= `BERT_SM1_SYNC;
        end
      end
      `BERT_SM1_EARLY: begin
        next_state <= `BERT_SM1_RECOVER;
      end
      `BERT_SM1_LATE: begin
        next_state <= `BERT_SM1_RECOVER;
      end
      default: begin
        next_state <= state + 4'd1;
      end
    endcase
  end
end

reg enable_delay;
always @ (posedge clock) begin
  if (reset) begin
    enable_delay <= 1'b0;
  end
  else begin
    enable_delay <= enable;
  end
end

wire lfsr_increment = enable_delay && (next_state == `BERT_SM1_EARLY);
reg lfsr_enable, blackout;

always @* begin
  lfsr_enable <= (enable && next_state != `BERT_SM1_LATE) || lfsr_increment;
end

always @* begin
  blackout <= enable && (next_state == `BERT_SM1_CLEAR_COUNT);
end

always @* begin
  clear_count <= enable && (next_state == `BERT_SM1_CLEAR_COUNT);
end

endmodule