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
reg [1:0] state;
always @ (posedge fifo_rclk) begin
  if (empty) begin
    state <= 2'd0;
  end
  else begin
    case (state)
      1: begin
        if (count == 16'd46) begin
          state <= state + 2'd1;
        end
      end
      3: begin
        if (count == block_size - 2) begin
          state <= state + 2'd1;
        end
      end
      default: state <= state + 2'd1;
    endcase
  end
end

wire clear_count = (state == 4'd0) || (state == 4'd2);
wire load_shift = (state == 4'd0);
wire fifo_rden = (state == 4'd2) || (state == 4'd3);
wire out_select = (state == 4'd3);

wire fifo_dout;
decoder_output_fifo_64 decoder_output_fifo
  (
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

// output bit count
always @ (posedge fifo_rclk) begin
  if (clear_count) begin
    count <= 16'd0;
  end
  else begin
    count <= count + 16'd1;
  end
end

// output shift register, MSB first
reg [47:0] shift;
always @ (posedge fifo_rclk) begin
  if (load_shift) begin
    shift <= {frame_word_0,frame_word_1,frame_word_2};
  end
  else begin
    shift <= {shift[46:0],1'b0};
  end
end

wire serial_out_wire = out_select ? fifo_dout : shift[47];
reg serial_out;
always @ (posedge fifo_rclk) begin
  serial_out <= serial_out_wire;
end

reg fifo_rden_delay, interrupt;
always @ (posedge fifo_rclk) begin
  fifo_rden_delay <= fifo_rden;
  interrupt <= !fifo_rden_delay & fifo_rden;
end

reg sim_full;
always @* begin
  sim_full <= full;
end

`ifdef DQM_CHIPSCOPE
wire [35:0] CONTROL0;
chipscope_icon chipscope_icon (
    .CONTROL0(CONTROL0) // INOUT BUS [35:0]
);

chipscope_ila chipscope_ila (
    .CONTROL(CONTROL0), // INOUT BUS [35:0]
    .CLK(clk), // IN
    .DATA(
      {
      4'b0,
      count, //12+16=28
      state, //12
      interrupt,
      serial_out,
      fifo_rden,
      empty,
      full,
      rst,
      fifo_wclk,
      fifo_rclk
      }), // IN BUS [31:0]
    .TRIG0(rst) // IN BUS [0:0]
);
`endif


endmodule