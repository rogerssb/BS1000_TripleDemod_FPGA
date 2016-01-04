`timescale 1ns/1ps

module dqm (
  fifo_wclk,
  fifo_rclk,
  fifo_wren,
  fifo_data,
  interrupt,
  serial_out,
  addr,
  data_in,
  data_out,
  wr0, wr1, wr2, wr3,
  `ifdef DQM_CHIPSCOPE
  rst,
  clk
  `else
  rst
  `endif
);

input fifo_wclk;
input fifo_rclk;
input fifo_wren;
input fifo_data;
output interrupt;
output serial_out;
input [12:0] addr;
input [31:0] data_in;
output [31:0] data_out;
input wr0, wr1, wr2, wr3;
input rst;
`ifdef DQM_CHIPSCOPE
input clk;
`endif
parameter header_size = 48;

wire frame_word_wren;
wire [15:0] block_size, frame_word_0, frame_word_1, frame_word_2;
dqm_regs dqm_regs (
  .addr(addr),
  .data_in(data_in),
  .data_out(data_out),
  .wr0(wr0), .wr1(wr1), .wr2(wr2), .wr3(wr3),
  .block_size(block_size),
  .frame_word_0(frame_word_0),
  .frame_word_1(frame_word_1),
  .frame_word_2(frame_word_2),
`ifdef DQM_CHIPSCOPE
  .frame_word_wren(frame_word_wren),
  .clk(clk)
`else
  .frame_word_wren(frame_word_wren)
`endif
);

// frame_word_wren is derived from the processor write enable
// data is latched on the falling edge in dqm_regs
reg [1:0] proc_wren_meta;
reg [15:0] frame_word_sync_2;
always @ (posedge fifo_rclk or posedge frame_word_wren) begin
  if (frame_word_wren) begin
    proc_wren_meta <= 2'b01;
  end
  else begin
    proc_wren_meta <= {proc_wren_meta, 1'b0};
  end
end

always @ (posedge fifo_rclk) begin
  if (proc_wren_meta == 2'b00) begin
    frame_word_sync_2 <= frame_word_2;
  end
end

wire empty, full;
reg [15:0] count;
wire clear_count = count == header_size + block_size - 1;
always @ (posedge fifo_rclk) begin
  if (empty || clear_count) begin
    count <= 16'd0;
  end
  else begin
    count <= count + 16'd1;
  end
end

wire load = count == 0;
wire fifo_rden = count > header_size - 1;
wire interrupt = count == header_size + 1;

reg select;
always @(posedge fifo_rclk) begin
  select <= fifo_rden;
end

wire fifo_dout;
decoder_output_fifo_64 decoder_output_fifo (
  .din(fifo_data),
  .rd_clk(fifo_rclk),
  .rd_en(fifo_rden),
  .rst(rst),
  .wr_clk(fifo_wclk),
  .wr_en(fifo_wren),
  .dout(fifo_dout),
  .empty(empty),
  .full(full),
  .wr_data_count()
);

// output shift register, MSB first
reg [(header_size-1):0] shift;
always @ (posedge fifo_rclk) begin
  if (load) begin
    shift <= {frame_word_0,frame_word_1,frame_word_sync_2};
  end
  else begin
    shift <= {shift[(header_size-2):0],1'b0};
  end
end

wire serial_out_wire = select ? fifo_dout : shift[header_size-1];
reg serial_out;
always @ (posedge fifo_rclk) begin
  serial_out <= serial_out_wire;
end

`ifdef DQM_CHIPSCOPE
wire [35:0] CONTROL0;
chipscope_icon chipscope_icon (
    .CONTROL0(CONTROL0) // INOUT BUS [35:0]
);

chipscope_ila_8K chipscope_ila_8K (
    .CONTROL(CONTROL0), // INOUT BUS [35:0]
    .CLK(fifo_rclk), // IN
    .DATA(
      {
      load,
      fifo_rden,
      select,
      interrupt,
      serial_out_wire,
      empty,
      full,
      fifo_wren
      }), // IN BUS [7:0]
    .TRIG0(interrupt) // IN BUS [0:0]
);
`endif
endmodule