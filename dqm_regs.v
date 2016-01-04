`timescale 1ns/1ps
`include "addressMap.v"

module dqm_regs (
  addr,
  data_in,
  data_out,
  wr0, wr1, wr2, wr3,
  block_size,
  frame_word_0,
  frame_word_1,
  frame_word_2,
  frame_word_wren
  );

input [12:0] addr;
input [31:0] data_in;
output [31:0] data_out;
input wr0, wr1, wr2, wr3;
output [15:0] block_size;
output [15:0] frame_word_0;
output [15:0] frame_word_1;
output [15:0] frame_word_2;
output frame_word_wren;

reg [15:0] block_size, full_count, frame_word_0, frame_word_1, frame_word_2;

reg dqm_space;
always @* begin
  casex(addr)
    `DQM_SPACE: dqm_space = 1;
    default: dqm_space = 0;
  endcase
end
wire frame_word_wren = dqm_space & wr0;

always @(negedge wr0) begin
  if (dqm_space) begin
    casex (addr)
      `DQM_BLOCK_SIZE: begin
        block_size[7:0] <= data_in[7:0];
        end
      `DQM_FRAME_WORD_1: begin
        frame_word_1[7:0] <= data_in[7:0];
        end
      default: ;
      endcase
    end
  end

always @(negedge wr1) begin
    if (dqm_space) begin
      casex (addr)
        `DQM_BLOCK_SIZE: begin
          block_size[15:8] <= data_in[15:8];
          end
        `DQM_FRAME_WORD_1: begin
          frame_word_1[15:8] <= data_in[15:8];
          end
        default: ;
      endcase
    end
  end

always @(negedge wr2) begin
  if (dqm_space) begin
    casex (addr)
      `DQM_FRAME_WORD_0: begin
        frame_word_0[7:0] <= data_in[23:16];
        end
      `DQM_FRAME_WORD_2: begin
        frame_word_2[7:0] <= data_in[23:16];
        end
      default: ;
      endcase
    end
  end

always @(negedge wr3) begin
    if (dqm_space) begin
      casex (addr)
        `DQM_FRAME_WORD_0: begin
          frame_word_0[15:8] <= data_in[31:24];
          end
        `DQM_FRAME_WORD_2: begin
          frame_word_2[15:8] <= data_in[31:24];
          end
        default: ;
      endcase
    end
  end

reg [31:0] data_out;
always @* begin
  if(dqm_space) begin
    casex (addr)
      `DQM_BLOCK_SIZE: begin
        data_out = {frame_word_0,block_size};
        end
      `DQM_FRAME_WORD_0: begin
        data_out = {frame_word_0,block_size};
        end
      `DQM_FRAME_WORD_1: begin
        data_out = {frame_word_2,frame_word_1};
        end
      `DQM_FRAME_WORD_2: begin
        data_out = {frame_word_2,frame_word_1};
        end
      default: begin
        data_out = 32'b0;
        end
      endcase
    end
    else begin
        data_out = 32'b0;
    end
  end

endmodule