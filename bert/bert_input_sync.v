`timescale 1ns / 10 ps

module bert_input_sync (
  wr_clk,
  din,
  reset,
  rd_clk,
  dout,
  enable
);

input wr_clk;
input din;
input reset;
input rd_clk;
output dout;
output enable;

// keep xilinx core names for easy copy/paste
reg wr_en, rd_en, rst;
wire full, empty;
wire [3:0] rd_data_count, wr_data_count;

fifo_1x16 fifo_1x16 (
  .rst(rst), // input rst
  .wr_clk(wr_clk), // input wr_clk
  .rd_clk(rd_clk), // input rd_clk
  .din(din), // input [0 : 0] din
  .wr_en(wr_en), // input wr_en
  .rd_en(rd_en), // input rd_en
  .dout(dout), // output [0 : 0] dout
  .full(full), // output full
  .empty(empty), // output empty
  .rd_data_count(rd_data_count), // output [3 : 0] rd_data_count
  .wr_data_count(wr_data_count) // output [3 : 0] wr_data_count
);

// sync full to the read clock

reg [1:0] full_shift;

always @ (posedge rd_clk) begin
  if (reset) begin
    full_shift <= 2'b00;
  end
  else begin
    full_shift <= {full, full_shift[1]};
  end
end

// generate a rd_en for each wr_clk

reg [2:0] wr_clk_shift;

always @ (posedge rd_clk) begin
  if (reset) begin
    wr_clk_shift <= 3'b000;
  end
  else begin
    wr_clk_shift <= {wr_clk, wr_clk_shift[2:1]};
  end
end

reg enable;
always @* begin
  enable = (wr_clk_shift[1:0] == 2'b10);
end

`define BERT_SM5_WAIT_NOT_EMPTY 3'd1
`define BERT_SM5_ENABLE_READS 3'd4

reg [2:0]state, next_state;
initial state = 3'd0;
always @ (posedge rd_clk) begin
  if (enable) begin
    state <= next_state;
  end
end

always @* begin
  if (reset) begin
    next_state <= 3'd0;
  end
  else begin
    case (state)
      3'd0: begin
        next_state <= `BERT_SM5_WAIT_NOT_EMPTY;
      end
      `BERT_SM5_WAIT_NOT_EMPTY: begin
        if (!empty) begin
          next_state <= state + 3'd1;
        end
        else begin
          next_state <= `BERT_SM5_WAIT_NOT_EMPTY;
        end
      end
      `BERT_SM5_ENABLE_READS: begin
        if (full_shift[0] || empty) begin
          next_state <= 3'd0;
        end
        else begin
          next_state <= `BERT_SM5_ENABLE_READS;
        end
      end
      default: begin
        next_state <= state + 3'd1;
      end
    endcase
  end
end

always @* begin
  rst <= reset | ((state == `BERT_SM5_ENABLE_READS) & (full_shift[0] | empty));
end

always @* begin
  wr_en <= !full;
end

always @* begin
  rd_en <= (state == `BERT_SM5_ENABLE_READS) & enable;
end

endmodule