//-----------------------------------------------------------------
// System Generator version 2016.4 Verilog source file.
//
// Copyright(C) 2013 by Xilinx, Inc.  All rights reserved.  This
// text/file contains proprietary, confidential information of Xilinx,
// Inc., is distributed under license from Xilinx, Inc., and may be used,
// copied and/or disclosed only pursuant to the terms of a valid license
// agreement with Xilinx, Inc.  Xilinx hereby grants you a license to use
// this text/file solely for design, simulation, implementation and
// creation of design files limited to Xilinx devices or technologies.
// Use with non-Xilinx devices or technologies is expressly prohibited
// and immediately terminates your license unless covered by a separate
// agreement.
//
// Xilinx is providing this design, code, or information "as is" solely
// for use in developing programs and solutions for Xilinx devices.  By
// providing this design, code, or information as one possible
// implementation of this feature, application or standard, Xilinx is
// making no representation that this implementation is free from any
// claims of infringement.  You are responsible for obtaining any rights
// you may require for your implementation.  Xilinx expressly disclaims
// any warranty whatsoever with respect to the adequacy of the
// implementation, including but not limited to warranties of
// merchantability or fitness for a particular purpose.
//
// Xilinx products are not intended for use in life support appliances,
// devices, or systems.  Use in such applications is expressly prohibited.
//
// Any modifications that are made to the source code are done at the user's
// sole risk and will be unsupported.
//
// This copyright and support notice must be retained as part of this
// text at all times.  (c) Copyright 1995-2013 Xilinx, Inc.  All rights
// reserved.
//-----------------------------------------------------------------

`include "conv_pkg.v"
`timescale 1 ns / 10 ps
module sysgen_bitbasher_dc22de8076 (
  input [(18 - 1):0] b,
  output [(17 - 1):0] a,
  input clk,
  input ce,
  input clr);
  wire signed [(18 - 1):0] b_1_26;
  wire [(1 - 1):0] slice_5_38;
  wire [(1 - 1):0] concat_5_29;
  wire [(16 - 1):0] slice_5_57;
  wire [(17 - 1):0] fulla_5_1_concat;
  wire signed [(17 - 1):0] a_7_1_force;
  assign b_1_26 = b;
  assign slice_5_38 = b_1_26[15:15];
  assign concat_5_29 = {slice_5_38};
  assign slice_5_57 = b_1_26[15:0];
  assign fulla_5_1_concat = {concat_5_29, slice_5_57};
  assign a_7_1_force = fulla_5_1_concat;
  assign a = a_7_1_force;
endmodule
`timescale 1 ns / 10 ps
module  hbf_fft_xlceprobe  (d, ce, clk, q);
    //Parameter Definitions
    parameter d_width= 8;
    parameter q_width= 1;

    //Port Declartions
    input [d_width-1:0] d;
    input ce;
    input clk;
    output [q_width-1:0] q;
    wire [0:0] ce_vec;

    BUF buf_comp(.I(ce), .O(ce_vec[0]));
    assign q = ce_vec;
endmodule
`timescale 1 ns / 10 ps
module sysgen_constant_0e6301439b (
  output [(1 - 1):0] op,
  input clk,
  input ce,
  input clr);
  assign op = 1'b1;
endmodule
`timescale 1 ns / 10 ps
module sysgen_constant_d3b9b8ab34 (
  output [(1 - 1):0] op,
  input clk,
  input ce,
  input clr);
  assign op = 1'b0;
endmodule
`timescale 1 ns / 10 ps
module sysgen_inverter_98d9985633 (
  input [(1 - 1):0] ip,
  output [(1 - 1):0] op,
  input clk,
  input ce,
  input clr);
  wire ip_1_26;
  reg op_mem_22_20[0:(1 - 1)];
  initial
    begin
      op_mem_22_20[0] = 1'b0;
    end
  wire op_mem_22_20_front_din;
  wire op_mem_22_20_back;
  wire op_mem_22_20_push_front_pop_back_en;
  localparam [(1 - 1):0] const_value = 1'b1;
  wire internal_ip_12_1_bitnot;
  assign ip_1_26 = ip;
  assign op_mem_22_20_back = op_mem_22_20[0];
  always @(posedge clk)
    begin:proc_op_mem_22_20
      integer i;
      if (((ce == 1'b1) && (op_mem_22_20_push_front_pop_back_en == 1'b1)))
        begin
          op_mem_22_20[0] <= op_mem_22_20_front_din;
        end
    end
  assign internal_ip_12_1_bitnot = ~ip_1_26;
  assign op_mem_22_20_push_front_pop_back_en = 1'b0;
  assign op = internal_ip_12_1_bitnot;
endmodule
`timescale 1 ns / 10 ps
module sysgen_logical_22e0f235e6 (
  input [(1 - 1):0] d0,
  input [(1 - 1):0] d1,
  output [(1 - 1):0] y,
  input clk,
  input ce,
  input clr);
  wire d0_1_24;
  wire d1_1_27;
  reg latency_pipe_5_26[0:(1 - 1)];
  initial
    begin
      latency_pipe_5_26[0] = 1'b0;
    end
  wire latency_pipe_5_26_front_din;
  wire latency_pipe_5_26_back;
  wire latency_pipe_5_26_push_front_pop_back_en;
  wire fully_2_1_bit;
  assign d0_1_24 = d0;
  assign d1_1_27 = d1;
  assign latency_pipe_5_26_back = latency_pipe_5_26[0];
  always @(posedge clk)
    begin:proc_latency_pipe_5_26
      integer i;
      if (((ce == 1'b1) && (latency_pipe_5_26_push_front_pop_back_en == 1'b1)))
        begin
          latency_pipe_5_26[0] <= latency_pipe_5_26_front_din;
        end
    end
  assign fully_2_1_bit = d0_1_24 & d1_1_27;
  assign latency_pipe_5_26_front_din = fully_2_1_bit;
  assign latency_pipe_5_26_push_front_pop_back_en = 1'b1;
  assign y = latency_pipe_5_26_back;
endmodule
`timescale 1 ns / 10 ps
module hbf_fft_xlregister (d, rst, en, ce, clk, q);
   parameter d_width = 5;
   parameter init_value = 'b0;

   input [d_width-1:0] d;
   input rst, en, ce, clk;
   output [d_width-1:0] q;

   wire internal_clr, internal_ce;

   assign internal_clr = rst & ce;
   assign internal_ce  = ce & en;

   synth_reg_w_init #(.width(d_width),
                      .init_index(2),
                      .init_value(init_value),
                      .latency(1))
   synth_reg_inst(.i(d),
                  .ce(internal_ce),
                  .clr(internal_clr),
                  .clk(clk),
                  .o(q));
endmodule

`timescale 1 ns / 10 ps
module sysgen_delay_b0141befbf (
  input [(12 - 1):0] d,
  output [(12 - 1):0] q,
  input clk,
  input ce,
  input clr);
  wire [(12 - 1):0] d_1_22;
  localparam [(12 - 1):0] const_value = 12'b000000000000;
  reg [(12 - 1):0] op_mem_20_24[0:(20 - 1)];
  initial
    begin
      op_mem_20_24[0] = 12'b000000000000;
      op_mem_20_24[1] = 12'b000000000000;
      op_mem_20_24[2] = 12'b000000000000;
      op_mem_20_24[3] = 12'b000000000000;
      op_mem_20_24[4] = 12'b000000000000;
      op_mem_20_24[5] = 12'b000000000000;
      op_mem_20_24[6] = 12'b000000000000;
      op_mem_20_24[7] = 12'b000000000000;
      op_mem_20_24[8] = 12'b000000000000;
      op_mem_20_24[9] = 12'b000000000000;
      op_mem_20_24[10] = 12'b000000000000;
      op_mem_20_24[11] = 12'b000000000000;
      op_mem_20_24[12] = 12'b000000000000;
      op_mem_20_24[13] = 12'b000000000000;
      op_mem_20_24[14] = 12'b000000000000;
      op_mem_20_24[15] = 12'b000000000000;
      op_mem_20_24[16] = 12'b000000000000;
      op_mem_20_24[17] = 12'b000000000000;
      op_mem_20_24[18] = 12'b000000000000;
      op_mem_20_24[19] = 12'b000000000000;
    end
  wire [(12 - 1):0] op_mem_20_24_front_din;
  wire [(12 - 1):0] op_mem_20_24_back;
  wire op_mem_20_24_push_front_pop_back_en;
  localparam [(5 - 1):0] const_value_x_000000 = 5'b10100;
  assign d_1_22 = d;
  assign op_mem_20_24_back = op_mem_20_24[19];
  always @(posedge clk)
    begin:proc_op_mem_20_24
      integer i;
      if (((ce == 1'b1) && (op_mem_20_24_push_front_pop_back_en == 1'b1)))
        begin
          for (i=19; i>=1; i=i-1)
            begin
              op_mem_20_24[i] <= op_mem_20_24[i-1];
            end
          op_mem_20_24[0] <= op_mem_20_24_front_din;
        end
    end
  assign op_mem_20_24_front_din = d_1_22;
  assign op_mem_20_24_push_front_pop_back_en = 1'b1;
  assign q = op_mem_20_24_back;
endmodule
`timescale 1 ns / 10 ps
module sysgen_counter_cc4715fc3c (
  output [(1 - 1):0] op,
  input clk,
  input ce,
  input clr);
  reg [(1 - 1):0] count_reg_20_23 = 1'b0;
  wire count_reg_20_23_rst;
  localparam [(1 - 1):0] const_value = 1'b1;
  localparam [(2 - 1):0] const_value_x_000000 = 2'b10;
  localparam [(1 - 1):0] const_value_x_000001 = 1'b1;
  localparam [(1 - 1):0] const_value_x_000002 = 1'b0;
  localparam [(1 - 1):0] const_value_x_000003 = 1'b1;
  wire rel_34_8;
  reg rst_limit_join_34_5;
  localparam [(1 - 1):0] const_value_x_000004 = 1'b0;
  localparam [(1 - 1):0] const_value_x_000005 = 1'b1;
  wire bool_44_4;
  reg [(2 - 1):0] count_reg_join_44_1;
  reg count_reg_join_44_1_rst;
  reg rst_limit_join_44_1;
  always @(posedge clk)
    begin:proc_count_reg_20_23
      if (((ce == 1'b1) && (count_reg_20_23_rst == 1'b1)))
        begin
          count_reg_20_23 <= 1'b0;
        end
      else if ((ce == 1'b1))
        begin
          count_reg_20_23 <= count_reg_20_23 + const_value_x_000005;
        end
    end
  assign rel_34_8 = count_reg_20_23 == const_value_x_000003;
  always @(rel_34_8)
    begin:proc_if_34_5
      if (rel_34_8)
        begin
          rst_limit_join_34_5 = 1'b1;
        end
      else 
        begin
          rst_limit_join_34_5 = 1'b0;
        end
    end
  assign bool_44_4 = 1'b0 || rst_limit_join_34_5;
  always @(bool_44_4 or count_reg_20_23 or rst_limit_join_34_5)
    begin:proc_if_44_1
      if (bool_44_4)
        begin
          count_reg_join_44_1_rst = 1'b1;
        end
      else 
        begin
          count_reg_join_44_1_rst = 1'b0;
        end
      if (bool_44_4)
        begin
          rst_limit_join_44_1 = 1'b0;
        end
      else 
        begin
          rst_limit_join_44_1 = rst_limit_join_34_5;
        end
    end
  assign count_reg_20_23_rst = count_reg_join_44_1_rst;
  assign op = count_reg_20_23;
endmodule
`timescale 1 ns / 10 ps
module hbf_fft_xldelay #(parameter width = -1, latency = -1, reg_retiming = 0, reset = 0)
  (input [width-1:0] d,
   input ce, clk, en, rst,
   output [width-1:0] q);

generate
  if ((latency == 0) || ((reg_retiming == 0) && (reset == 0)))
  begin:srl_delay
    synth_reg # (width, latency)
      reg1 (
        .i(d),
        .ce(ce & en),
        .clr(1'b0),
        .clk(clk),
        .o(q));
  end

  if ((latency>=1) && ((reg_retiming) || (reset)))
  begin:reg_delay
    synth_reg_reg # (width, latency)
      reg2 (
        .i(d),
        .ce(ce & en),
        .clr(rst),
        .clk(clk),
        .o(q));
  end
endgenerate
endmodule
`timescale 1 ns / 10 ps


module  hbf_fft_xldsamp  (d, src_clk, src_ce, src_clr, dest_clk, dest_ce, dest_clr, en, rst, q);


//Parameter Definitions
parameter d_width= 12;
parameter d_bin_pt= 0;
parameter d_arith= `xlUnsigned;
parameter q_width= 12;
parameter q_bin_pt= 0;
parameter q_arith= `xlUnsigned;
parameter en_width= 1;
parameter en_bin_pt= 0;
parameter en_arith= `xlUnsigned;
parameter rst_width= 1;
parameter rst_bin_pt= 0;
parameter rst_arith= `xlUnsigned;
parameter ds_ratio= 2;
parameter phase= 0;
parameter latency= 1;


//Port Declartions
input [d_width-1:0] d;
input  src_clk;
input  src_ce;
input  src_clr;
input  dest_clk;
input  dest_ce;
input  dest_clr;
input [en_width-1:0] en;
input [rst_width-1:0] rst;
output [q_width-1:0] q;


//Wire Declartions
wire  adjusted_dest_ce;
wire  adjusted_dest_ce_w_en;
wire  dest_ce_w_en;
wire  sclr;
wire [d_width-1:0] smpld_d;
reg [q_width-1:0] q_reg;


assign dest_ce_w_en = dest_ce & en[0];
assign adjusted_dest_ce_w_en = adjusted_dest_ce & en[0];
assign sclr = (src_clr | rst[0]) & dest_ce;
generate
if((latency==0) | (phase!= (ds_ratio-1)))
   begin:adjusted_ce_needed
   FDSE dest_ce_reg(.Q(adjusted_dest_ce),
		            .D(dest_ce),
                    .C(src_clk),
                    .S(sclr),
                    .CE(src_ce)
	      	      );

   end

if(latency==0)
  begin:shutter_d_reg
  synth_reg # (d_width,1)
  reg1(.i(d),
       .ce(adjusted_dest_ce),
       .clr(sclr),
       .clk(src_clk),
       .o(smpld_d)
      );

   assign q = q_reg;

   always@(adjusted_dest_ce,d,smpld_d)
      begin
        if(adjusted_dest_ce == 'b0) begin
           q_reg = smpld_d;
        end
        else begin
           q_reg = d;
        end
      end

  end

 if(latency > 0)
 begin:double_reg_test
   if( phase!= (ds_ratio-1))
   begin:smpl_d_reg
   synth_reg_reg # (d_width, 1)
	  reg2 (
	       .i(d),
	       .ce(adjusted_dest_ce_w_en),
	       .clr(sclr),
	       .clk(src_clk),
	       .o(smpld_d));
   end

  if( phase == (ds_ratio-1))
  begin:sngl_reg_test
	assign smpld_d = d;
  end

  synth_reg_reg # (d_width, latency)
	  reg2 (
	       .i(smpld_d),
	       .ce(dest_ce_w_en),
	       .clr(sclr),
	       .clk(src_clk),
	       .o(q));
end

endgenerate

endmodule

`timescale 1 ns / 10 ps
module sysgen_expr_ef3479172e (
  input [(1 - 1):0] a,
  input [(1 - 1):0] b,
  output [(1 - 1):0] dout,
  input clk,
  input ce,
  input clr);
  wire [(1 - 1):0] a_1_24;
  wire [(1 - 1):0] b_1_27;
  wire [(1 - 1):0] fulldout_5_2_bit;
  assign a_1_24 = a;
  assign b_1_27 = b;
  assign fulldout_5_2_bit = b_1_27 ^ a_1_24;
  assign dout = fulldout_5_2_bit;
endmodule
`timescale 1 ns / 10 ps
module sysgen_mux_27fb71596f (
  input [(1 - 1):0] sel,
  input [(14 - 1):0] d0,
  input [(14 - 1):0] d1,
  output [(14 - 1):0] y,
  input clk,
  input ce,
  input clr);
  wire [(1 - 1):0] sel_1_20;
  wire [(14 - 1):0] d0_1_24;
  wire [(14 - 1):0] d1_1_27;
  localparam [(14 - 1):0] const_value = 14'b00000000000000;
  reg [(14 - 1):0] pipe_16_22[0:(1 - 1)];
  initial
    begin
      pipe_16_22[0] = 14'b00000000000000;
    end
  wire [(14 - 1):0] pipe_16_22_front_din;
  wire [(14 - 1):0] pipe_16_22_back;
  wire pipe_16_22_push_front_pop_back_en;
  reg [(14 - 1):0] unregy_join_6_1;
  assign sel_1_20 = sel;
  assign d0_1_24 = d0;
  assign d1_1_27 = d1;
  assign pipe_16_22_back = pipe_16_22[0];
  always @(posedge clk)
    begin:proc_pipe_16_22
      integer i;
      if (((ce == 1'b1) && (pipe_16_22_push_front_pop_back_en == 1'b1)))
        begin
          pipe_16_22[0] <= pipe_16_22_front_din;
        end
    end
  always @(d0_1_24 or d1_1_27 or sel_1_20)
    begin:proc_switch_6_1
      case (sel_1_20)
        1'b0 :
          begin
            unregy_join_6_1 = d0_1_24;
          end
        default:
          begin
            unregy_join_6_1 = d1_1_27;
          end
      endcase
    end
  assign pipe_16_22_front_din = unregy_join_6_1;
  assign pipe_16_22_push_front_pop_back_en = 1'b1;
  assign y = pipe_16_22_back;
endmodule
`timescale 1 ns / 10 ps
module sysgen_mcode_block_14a26cadd7 (
  input [(1 - 1):0] start,
  input [(13 - 1):0] limit,
  output [(13 - 1):0] kindexout,
  output [(1 - 1):0] enout,
  input clk,
  input ce,
  input clr);
  wire start_1_43;
  wire [(13 - 1):0] limit_1_49;
  wire [(2 - 1):0] state_7_23_next;
  reg [(2 - 1):0] state_7_23 = 2'b00;
  wire [(13 - 1):0] kindex_8_24_next;
  reg [(13 - 1):0] kindex_8_24 = 13'b0000000000000;
  wire en_9_20_next;
  reg en_9_20 = 1'b0;
  localparam [(1 - 1):0] const_value = 1'b0;
  localparam [(1 - 1):0] const_value_x_000000 = 1'b1;
  localparam [(2 - 1):0] const_value_x_000001 = 2'b10;
  localparam [(1 - 1):0] const_value_x_000002 = 1'b1;
  wire rel_15_16;
  reg [(2 - 1):0] state_join_15_13;
  localparam [(2 - 1):0] const_value_x_000003 = 2'b01;
  localparam [(1 - 1):0] const_value_x_000004 = 1'b0;
  localparam [(2 - 1):0] const_value_x_000005 = 2'b10;
  localparam [(1 - 1):0] const_value_x_000006 = 1'b1;
  wire [(14 - 1):0] cast_25_26;
  localparam [(14 - 1):0] const_value_x_000007 = 14'b00000000000001;
  wire [(14 - 1):0] kindex_25_17_addsub;
  localparam [(1 - 1):0] const_value_x_000008 = 1'b0;
  localparam [(1 - 1):0] const_value_x_000009 = 1'b1;
  wire [(14 - 1):0] cast_24_16;
  localparam [(14 - 1):0] const_value_x_000010 = 14'b00000000000001;
  wire [(14 - 1):0] addsub_24_16;
  wire [(14 - 1):0] cast_24_27;
  wire rel_24_16;
  reg [(14 - 1):0] kindex_join_24_13;
  reg en_join_24_13;
  reg [(2 - 1):0] state_join_24_13;
  localparam [(2 - 1):0] const_value_x_000011 = 2'b00;
  reg en_join_13_5;
  reg [(2 - 1):0] state_join_13_5;
  localparam [(2 - 1):0] const_value_x_000012 = 2'b10;
  reg [(14 - 1):0] kindex_join_13_5;
  localparam [(14 - 1):0] const_value_x_000013 = 14'b00000000000000;
  wire [(13 - 1):0] cast_kindex_8_24_next;
  assign start_1_43 = start;
  assign limit_1_49 = limit;
  always @(posedge clk)
    begin:proc_state_7_23
      if ((ce == 1'b1))
        begin
          state_7_23 <= state_7_23_next;
        end
    end
  always @(posedge clk)
    begin:proc_kindex_8_24
      if ((ce == 1'b1))
        begin
          kindex_8_24 <= kindex_8_24_next;
        end
    end
  always @(posedge clk)
    begin:proc_en_9_20
      if ((ce == 1'b1))
        begin
          en_9_20 <= en_9_20_next;
        end
    end
  assign rel_15_16 = start_1_43 == 1'b1;
  always @(rel_15_16 or state_7_23)
    begin:proc_if_15_13
      if (rel_15_16)
        begin
          state_join_15_13 = const_value_x_000003;
        end
      else 
        begin
          state_join_15_13 = state_7_23;
        end
    end
  assign cast_25_26 = {1'b0, kindex_8_24[12:0]};
  assign kindex_25_17_addsub = cast_25_26 + const_value_x_000007;
  assign cast_24_16 = {1'b0, kindex_8_24[12:0]};
  assign addsub_24_16 = cast_24_16 + const_value_x_000010;
  assign cast_24_27 = {1'b0, limit_1_49[12:0]};
  assign rel_24_16 = addsub_24_16 < cast_24_27;
  always @(en_9_20 or kindex_25_17_addsub or kindex_8_24 or rel_24_16 or state_7_23)
    begin:proc_if_24_13
      if (rel_24_16)
        begin
          kindex_join_24_13 = kindex_25_17_addsub;
          en_join_24_13 = en_9_20;
          state_join_24_13 = state_7_23;
        end
      else 
        begin
          kindex_join_24_13 = {1'b0, kindex_8_24[12:0]};
          en_join_24_13 = 1'b0;
          state_join_24_13 = const_value_x_000011;
        end
    end
  always @(en_9_20 or en_join_24_13 or kindex_8_24 or kindex_join_24_13 or state_7_23 or state_join_15_13 or state_join_24_13)
    begin:proc_switch_13_5
      case (state_7_23)
        2'b00 :
          begin
            en_join_13_5 = 1'b0;
            state_join_13_5 = state_join_15_13;
            kindex_join_13_5 = {1'b0, kindex_8_24[12:0]};
          end
        2'b01 :
          begin
            en_join_13_5 = 1'b1;
            state_join_13_5 = const_value_x_000012;
            kindex_join_13_5 = const_value_x_000013;
          end
        2'b10 :
          begin
            en_join_13_5 = en_join_24_13;
            state_join_13_5 = state_join_24_13;
            kindex_join_13_5 = kindex_join_24_13;
          end
        default:
          begin
            en_join_13_5 = en_9_20;
            state_join_13_5 = state_7_23;
            kindex_join_13_5 = {1'b0, kindex_8_24[12:0]};
          end
      endcase
    end
  assign state_7_23_next = state_join_13_5;
  assign cast_kindex_8_24_next = {kindex_join_13_5[12:0]};
  assign kindex_8_24_next = cast_kindex_8_24_next;
  assign en_9_20_next = en_join_13_5;
  assign kindexout = kindex_8_24;
  assign enout = en_9_20;
endmodule
`timescale 1 ns / 10 ps
module sysgen_constant_e34fae1d80 (
  output [(13 - 1):0] op,
  input clk,
  input ce,
  input clr);
  assign op = 13'b0000000000001;
endmodule
`timescale 1 ns / 10 ps
module sysgen_mux_facf6a2d8c (
  input [(1 - 1):0] sel,
  input [(13 - 1):0] d0,
  input [(13 - 1):0] d1,
  output [(13 - 1):0] y,
  input clk,
  input ce,
  input clr);
  wire [(1 - 1):0] sel_1_20;
  wire [(13 - 1):0] d0_1_24;
  wire [(13 - 1):0] d1_1_27;
  reg [(13 - 1):0] unregy_join_6_1;
  assign sel_1_20 = sel;
  assign d0_1_24 = d0;
  assign d1_1_27 = d1;
  always @(d0_1_24 or d1_1_27 or sel_1_20)
    begin:proc_switch_6_1
      case (sel_1_20)
        1'b0 :
          begin
            unregy_join_6_1 = d0_1_24;
          end
        default:
          begin
            unregy_join_6_1 = d1_1_27;
          end
      endcase
    end
  assign y = unregy_join_6_1;
endmodule
`timescale 1 ns / 10 ps
module sysgen_mux_37fb526337 (
  input [(1 - 1):0] sel,
  input [(13 - 1):0] d0,
  input [(13 - 1):0] d1,
  output [(13 - 1):0] y,
  input clk,
  input ce,
  input clr);
  wire [(1 - 1):0] sel_1_20;
  wire [(13 - 1):0] d0_1_24;
  wire [(13 - 1):0] d1_1_27;
  localparam [(13 - 1):0] const_value = 13'b0000000000000;
  reg [(13 - 1):0] pipe_16_22[0:(1 - 1)];
  initial
    begin
      pipe_16_22[0] = 13'b0000000000000;
    end
  wire [(13 - 1):0] pipe_16_22_front_din;
  wire [(13 - 1):0] pipe_16_22_back;
  wire pipe_16_22_push_front_pop_back_en;
  reg [(13 - 1):0] unregy_join_6_1;
  assign sel_1_20 = sel;
  assign d0_1_24 = d0;
  assign d1_1_27 = d1;
  assign pipe_16_22_back = pipe_16_22[0];
  always @(posedge clk)
    begin:proc_pipe_16_22
      integer i;
      if (((ce == 1'b1) && (pipe_16_22_push_front_pop_back_en == 1'b1)))
        begin
          pipe_16_22[0] <= pipe_16_22_front_din;
        end
    end
  always @(d0_1_24 or d1_1_27 or sel_1_20)
    begin:proc_switch_6_1
      case (sel_1_20)
        1'b0 :
          begin
            unregy_join_6_1 = d0_1_24;
          end
        default:
          begin
            unregy_join_6_1 = d1_1_27;
          end
      endcase
    end
  assign pipe_16_22_front_din = unregy_join_6_1;
  assign pipe_16_22_push_front_pop_back_en = 1'b1;
  assign y = pipe_16_22_back;
endmodule
`timescale 1 ns / 10 ps
module sysgen_shift_3c7dd62b9d (
  input [(13 - 1):0] ip,
  output [(13 - 1):0] op,
  input clk,
  input ce,
  input clr);
  wire [(13 - 1):0] ip_1_23;
  localparam [(13 - 1):0] const_value = 13'b0000000000000;
  reg [(13 - 1):0] op_mem_46_20[0:(1 - 1)];
  initial
    begin
      op_mem_46_20[0] = 13'b0000000000000;
    end
  wire [(13 - 1):0] op_mem_46_20_front_din;
  wire [(13 - 1):0] op_mem_46_20_back;
  wire op_mem_46_20_push_front_pop_back_en;
  localparam [(1 - 1):0] const_value_x_000000 = 1'b1;
  wire [(14 - 1):0] cast_internal_ip_25_3_lsh;
  wire [(13 - 1):0] cast_internal_ip_36_3_convert;
  assign ip_1_23 = ip;
  assign op_mem_46_20_back = op_mem_46_20[0];
  always @(posedge clk)
    begin:proc_op_mem_46_20
      integer i;
      if (((ce == 1'b1) && (op_mem_46_20_push_front_pop_back_en == 1'b1)))
        begin
          op_mem_46_20[0] <= op_mem_46_20_front_din;
        end
    end
  assign cast_internal_ip_25_3_lsh = {ip_1_23[12:0], 1'b0};
  assign cast_internal_ip_36_3_convert = {cast_internal_ip_25_3_lsh[12:0]};
  assign op_mem_46_20_push_front_pop_back_en = 1'b0;
  assign op = cast_internal_ip_36_3_convert;
endmodule
`timescale 1 ns / 10 ps
module sysgen_shift_9b76a59f0d (
  input [(13 - 1):0] ip,
  output [(13 - 1):0] op,
  input clk,
  input ce,
  input clr);
  wire [(13 - 1):0] ip_1_23;
  localparam [(13 - 1):0] const_value = 13'b0000000000000;
  reg [(13 - 1):0] op_mem_46_20[0:(1 - 1)];
  initial
    begin
      op_mem_46_20[0] = 13'b0000000000000;
    end
  wire [(13 - 1):0] op_mem_46_20_front_din;
  wire [(13 - 1):0] op_mem_46_20_back;
  wire op_mem_46_20_push_front_pop_back_en;
  localparam [(1 - 1):0] const_value_x_000000 = 1'b1;
  wire [(15 - 1):0] cast_internal_ip_25_3_lsh;
  wire [(13 - 1):0] cast_internal_ip_36_3_convert;
  assign ip_1_23 = ip;
  assign op_mem_46_20_back = op_mem_46_20[0];
  always @(posedge clk)
    begin:proc_op_mem_46_20
      integer i;
      if (((ce == 1'b1) && (op_mem_46_20_push_front_pop_back_en == 1'b1)))
        begin
          op_mem_46_20[0] <= op_mem_46_20_front_din;
        end
    end
  assign cast_internal_ip_25_3_lsh = {ip_1_23[12:0], 2'b00};
  assign cast_internal_ip_36_3_convert = {cast_internal_ip_25_3_lsh[12:0]};
  assign op_mem_46_20_push_front_pop_back_en = 1'b0;
  assign op = cast_internal_ip_36_3_convert;
endmodule
`timescale 1 ns / 10 ps
module sysgen_shift_a1ed70e27b (
  input [(13 - 1):0] ip,
  output [(13 - 1):0] op,
  input clk,
  input ce,
  input clr);
  wire [(13 - 1):0] ip_1_23;
  localparam [(13 - 1):0] const_value = 13'b0000000000000;
  reg [(13 - 1):0] op_mem_46_20[0:(1 - 1)];
  initial
    begin
      op_mem_46_20[0] = 13'b0000000000000;
    end
  wire [(13 - 1):0] op_mem_46_20_front_din;
  wire [(13 - 1):0] op_mem_46_20_back;
  wire op_mem_46_20_push_front_pop_back_en;
  localparam [(1 - 1):0] const_value_x_000000 = 1'b1;
  wire [(17 - 1):0] cast_internal_ip_25_3_lsh;
  wire [(13 - 1):0] cast_internal_ip_36_3_convert;
  assign ip_1_23 = ip;
  assign op_mem_46_20_back = op_mem_46_20[0];
  always @(posedge clk)
    begin:proc_op_mem_46_20
      integer i;
      if (((ce == 1'b1) && (op_mem_46_20_push_front_pop_back_en == 1'b1)))
        begin
          op_mem_46_20[0] <= op_mem_46_20_front_din;
        end
    end
  assign cast_internal_ip_25_3_lsh = {ip_1_23[12:0], 4'b0000};
  assign cast_internal_ip_36_3_convert = {cast_internal_ip_25_3_lsh[12:0]};
  assign op_mem_46_20_push_front_pop_back_en = 1'b0;
  assign op = cast_internal_ip_36_3_convert;
endmodule
`timescale 1 ns / 10 ps
module sysgen_shift_ce77793538 (
  input [(13 - 1):0] ip,
  output [(13 - 1):0] op,
  input clk,
  input ce,
  input clr);
  wire [(13 - 1):0] ip_1_23;
  localparam [(13 - 1):0] const_value = 13'b0000000000000;
  reg [(13 - 1):0] op_mem_46_20[0:(1 - 1)];
  initial
    begin
      op_mem_46_20[0] = 13'b0000000000000;
    end
  wire [(13 - 1):0] op_mem_46_20_front_din;
  wire [(13 - 1):0] op_mem_46_20_back;
  wire op_mem_46_20_push_front_pop_back_en;
  localparam [(1 - 1):0] const_value_x_000000 = 1'b1;
  wire [(21 - 1):0] cast_internal_ip_25_3_lsh;
  wire [(13 - 1):0] cast_internal_ip_36_3_convert;
  assign ip_1_23 = ip;
  assign op_mem_46_20_back = op_mem_46_20[0];
  always @(posedge clk)
    begin:proc_op_mem_46_20
      integer i;
      if (((ce == 1'b1) && (op_mem_46_20_push_front_pop_back_en == 1'b1)))
        begin
          op_mem_46_20[0] <= op_mem_46_20_front_din;
        end
    end
  assign cast_internal_ip_25_3_lsh = {ip_1_23[12:0], 8'b00000000};
  assign cast_internal_ip_36_3_convert = {cast_internal_ip_25_3_lsh[12:0]};
  assign op_mem_46_20_push_front_pop_back_en = 1'b0;
  assign op = cast_internal_ip_36_3_convert;
endmodule
`timescale 1 ns / 10 ps

module  hbf_fft_xlslice  (x, y);

//Parameter Definitions
parameter new_msb= 9;
parameter new_lsb= 1;
parameter x_width= 16;
parameter y_width= 8;

//Port Declartions
input [x_width-1:0] x;
output [y_width-1:0] y;

assign y = x[new_msb:new_lsb];

endmodule
`timescale 1 ns / 10 ps
module sysgen_logical_aa12fd5a97 (
  input [(1 - 1):0] d0,
  input [(1 - 1):0] d1,
  output [(1 - 1):0] y,
  input clk,
  input ce,
  input clr);
  wire d0_1_24;
  wire d1_1_27;
  wire fully_2_1_bit;
  assign d0_1_24 = d0;
  assign d1_1_27 = d1;
  assign fully_2_1_bit = d0_1_24 & d1_1_27;
  assign y = fully_2_1_bit;
endmodule
module hbf_fft_xlcmult (a, ce, clr, clk, core_ce, core_clr, core_clk, rst, en, p);
 
 parameter core_name0= "";
 parameter a_width= 4;
 parameter a_bin_pt= 2;
 parameter a_arith= `xlSigned;
 parameter b_width= 4;
 parameter b_bin_pt= 2;
 parameter b_arith= `xlSigned;
 parameter p_width= 8;
 parameter p_bin_pt= 2;
 parameter p_arith= `xlSigned;
 parameter rst_width= 1;
 parameter rst_bin_pt= 0;
 parameter rst_arith= `xlUnsigned;
 parameter en_width= 1;
 parameter en_bin_pt= 0;
 parameter en_arith= `xlUnsigned;
 parameter multsign= `xlSigned;
 parameter quantization= `xlTruncate;
 parameter overflow= `xlWrap;
 parameter extra_registers= 0;
 parameter c_a_width= 7;
 parameter c_b_width= 7;
 parameter c_a_type= 0;
 parameter c_b_type= 0;
 parameter c_type= 0;
 parameter const_bin_pt= 1;
 parameter c_output_width= 16;
 parameter zero_const = 0;
 
 input [a_width-1:0] a;
 input  ce;
 input  clr;
 input  clk;
 input  core_ce;
 input  core_clr;
 input  core_clk;
 input [rst_width-1:0] rst;
 input [en_width-1:0] en;
 output [p_width-1:0] p;
 
 wire [c_a_width-1:0] #0.1 tmp_a;
 wire [c_output_width-1:0] tmp_p;
 wire [p_width-1:0] conv_p;
 wire  real_a,real_p;
 wire  nd;
 wire  internal_ce;
 wire  internal_clr;
 wire  internal_core_ce;
 
 assign internal_ce = ce & en[0];
 assign internal_core_ce = core_ce & en[0];
 assign internal_clr = (clr | rst[0]) & ce;
 assign nd = internal_ce;
 
 zero_ext # (a_width,c_a_width) zero_ext_a(.inp(a),.res(tmp_a));
 
 convert_type # (c_output_width, a_bin_pt+b_bin_pt, multsign,
                            p_width, p_bin_pt, p_arith, quantization, overflow)
 convert_p(.inp(tmp_p),.res(conv_p));
 
 generate



if (core_name0 == "hbf_fft_mult_gen_v12_0_i0") 
     begin:comp0
hbf_fft_mult_gen_v12_0_i0 core_instance0 ( 
      .P(tmp_p),
      .A(tmp_a) 
       ); 
     end 

if (core_name0 == "hbf_fft_mult_gen_v12_0_i1") 
     begin:comp1
hbf_fft_mult_gen_v12_0_i1 core_instance1 ( 
      .P(tmp_p),
      .A(tmp_a) 
       ); 
     end 

 endgenerate
 
 generate
  if ((extra_registers > 0) && (zero_const == 0))
      begin:latency_gt_0
 	synth_reg # (p_width, extra_registers) 
 	  reg1 (
 	       .i(conv_p), 
 	       .ce(internal_ce),
 	       .clr(internal_clr),
 	       .clk(clk),
 	       .o(p)
                );
      end
     
    if ((extra_registers == 0) && (zero_const == 0))
      begin:latency_eq_0
 	assign p = conv_p;
      end
 
    if (zero_const == 1)
      begin:zero_constant
 	assign p = {p_width{1'b0}};
      end
 endgenerate
 
 endmodule

module hbf_fft_xlfifogen (din, we, we_ce, re, re_ce, rst, en, ce, clk,
   empty, full, percent_full, dcount, ae, af, dout);
 
   parameter core_name0 = "";
   parameter data_width = -1;
   parameter data_count_width = -1;
   parameter percent_full_width = -1;
   parameter has_ae = 0;
   parameter has_af = 0;
   parameter extra_registers= 2; 
 
   input [data_width-1:0] din;
   input ce, clk, en, re, re_ce, rst, we, we_ce;
   output empty, full;
   output reg [percent_full_width-1:0] percent_full;
   output [data_count_width-1:0] dcount;
   output ae, af;
   output [data_width-1:0] dout;
 
   wire rd_en, wr_en, srst, core_ae, core_af;
 
   assign rd_en = re & en & re_ce;
   assign wr_en = we & en & we_ce;
   assign ae = (has_ae) ? core_ae : 0;
   assign af = (has_af) ? core_af : 0;
 
   generate



if (core_name0 == "hbf_fft_fifo_generator_v13_1_i0") 
     begin:comp0
hbf_fft_fifo_generator_v13_1_i0 core_instance0 ( 
         .clk(clk),
         .srst(srst),
         .din(din),
         .wr_en(wr_en),
         .rd_en(rd_en),
         .dout(dout),
         .full(full),
         .empty(empty) 
       ); 
     end 

 endgenerate
   
   always @ (full or dcount)
   begin:modify_count
     percent_full = (full == 1) ? 
       {percent_full_width {1'b1}} : 
       dcount[(data_count_width-1):(data_count_width-percent_full_width)];
   end 

 generate 
   if (extra_registers > 0) 
   begin:latency_gt_0 
     synth_reg # (1, extra_registers) 
       extra_reg ( 
         .i(rst), 
         .ce(ce), 
         .clr(0), 
         .clk(clk), 
         .o(srst)); 
   end 
 endgenerate 
 
 generate 
   if (extra_registers == 0) 
   begin:latency_eq_0 
     assign srst = rst & ce;
   end 
 endgenerate 
 
 endmodule
 

`timescale 1 ns / 10 ps
module  xlcordic_0cfb8f5888c7b91b056046514e96cf30 (ce,clk,m_axis_dout_tdata_phase,m_axis_dout_tdata_real,m_axis_dout_tlast,m_axis_dout_tvalid,s_axis_cartesian_tdata_imag,s_axis_cartesian_tdata_real,s_axis_cartesian_tlast,s_axis_cartesian_tvalid);

input ce;
input clk;
output[15:0] m_axis_dout_tdata_phase;
output[15:0] m_axis_dout_tdata_real;
output m_axis_dout_tlast;
output m_axis_dout_tvalid;
input[16:0] s_axis_cartesian_tdata_imag;
input[16:0] s_axis_cartesian_tdata_real;
input s_axis_cartesian_tlast;
input s_axis_cartesian_tvalid;
wire[31:0] m_axis_dout_tdata_net;
wire[47:0] s_axis_cartesian_tdata_net;
  assign m_axis_dout_tdata_phase = m_axis_dout_tdata_net[31 : 16];
  assign m_axis_dout_tdata_real = m_axis_dout_tdata_net[15 : 0];
  assign s_axis_cartesian_tdata_net[47 : 41] = 7'b0;
  assign s_axis_cartesian_tdata_net[40 : 24] = s_axis_cartesian_tdata_imag;
  assign s_axis_cartesian_tdata_net[23 : 17] = 7'b0;
  assign s_axis_cartesian_tdata_net[16 : 0] = s_axis_cartesian_tdata_real;
  hbf_fft_cordic_v6_0_i0 hbf_fft_cordic_v6_0_i0_instance(
      .aclk(clk),
      .aclken(ce),
      .m_axis_dout_tdata(m_axis_dout_tdata_net),
      .m_axis_dout_tlast(m_axis_dout_tlast),
      .m_axis_dout_tvalid(m_axis_dout_tvalid),
      .s_axis_cartesian_tdata(s_axis_cartesian_tdata_net),
      .s_axis_cartesian_tlast(s_axis_cartesian_tlast),
      .s_axis_cartesian_tvalid(s_axis_cartesian_tvalid)
    );

 endmodule



`timescale 1 ns / 10 ps
module  xlfast_fourier_transform_f3b02437395edd789bc1dec94ace7f65 (ce,clk,event_data_in_channel_halt,event_frame_started,event_tlast_missing,event_tlast_unexpected,m_axis_data_tdata_xn_im,m_axis_data_tdata_xn_re,m_axis_data_tlast,m_axis_data_tuser_xk_index,m_axis_data_tvalid,s_axis_config_tdata_fwd_inv,s_axis_config_tdata_nfft,s_axis_config_tdata_scale_sch,s_axis_config_tready,s_axis_config_tvalid,s_axis_data_tdata_xn_im,s_axis_data_tdata_xn_re,s_axis_data_tlast,s_axis_data_tready,s_axis_data_tvalid);

input ce;
input clk;
output event_data_in_channel_halt;
output event_frame_started;
output event_tlast_missing;
output event_tlast_unexpected;
output[17:0] m_axis_data_tdata_xn_im;
output[17:0] m_axis_data_tdata_xn_re;
output m_axis_data_tlast;
output[11:0] m_axis_data_tuser_xk_index;
output m_axis_data_tvalid;
input[0:0] s_axis_config_tdata_fwd_inv;
input[4:0] s_axis_config_tdata_nfft;
input[11:0] s_axis_config_tdata_scale_sch;
output s_axis_config_tready;
input s_axis_config_tvalid;
input[17:0] s_axis_data_tdata_xn_im;
input[17:0] s_axis_data_tdata_xn_re;
input s_axis_data_tlast;
output s_axis_data_tready;
input s_axis_data_tvalid;
wire[47:0] m_axis_data_tdata_net;
wire[15:0] m_axis_data_tuser_net;
wire[23:0] s_axis_config_tdata_net;
wire[47:0] s_axis_data_tdata_net;
  assign m_axis_data_tdata_xn_im = m_axis_data_tdata_net[41 : 24];
  assign m_axis_data_tdata_xn_re = m_axis_data_tdata_net[17 : 0];
  assign m_axis_data_tuser_xk_index = m_axis_data_tuser_net[11 : 0];
  assign s_axis_config_tdata_net[23 : 21] = 3'b0;
  assign s_axis_config_tdata_net[20 : 9] = s_axis_config_tdata_scale_sch;
  assign s_axis_config_tdata_net[8 : 8] = s_axis_config_tdata_fwd_inv;
  assign s_axis_config_tdata_net[7 : 5] = 3'b0;
  assign s_axis_config_tdata_net[4 : 0] = s_axis_config_tdata_nfft;
  assign s_axis_data_tdata_net[47 : 42] = 6'b0;
  assign s_axis_data_tdata_net[41 : 24] = s_axis_data_tdata_xn_im;
  assign s_axis_data_tdata_net[23 : 18] = 6'b0;
  assign s_axis_data_tdata_net[17 : 0] = s_axis_data_tdata_xn_re;
  hbf_fft_xfft_v9_0_i0 hbf_fft_xfft_v9_0_i0_instance(
      .aclk(clk),
      .aclken(ce),
      .event_data_in_channel_halt(event_data_in_channel_halt),
      .event_frame_started(event_frame_started),
      .event_tlast_missing(event_tlast_missing),
      .event_tlast_unexpected(event_tlast_unexpected),
      .m_axis_data_tdata(m_axis_data_tdata_net),
      .m_axis_data_tlast(m_axis_data_tlast),
      .m_axis_data_tuser(m_axis_data_tuser_net),
      .m_axis_data_tvalid(m_axis_data_tvalid),
      .s_axis_config_tdata(s_axis_config_tdata_net),
      .s_axis_config_tready(s_axis_config_tready),
      .s_axis_config_tvalid(s_axis_config_tvalid),
      .s_axis_data_tdata(s_axis_data_tdata_net),
      .s_axis_data_tlast(s_axis_data_tlast),
      .s_axis_data_tready(s_axis_data_tready),
      .s_axis_data_tvalid(s_axis_data_tvalid)
    );

 endmodule



`timescale 1 ns / 10 ps
module  xlfir_compiler_3170ad7fab44481f67471b56a251a967 (ce,ce_2,ce_logic_2,clk,clk_2,clk_logic_2,m_axis_data_tdata_real,m_axis_data_tvalid,s_axis_data_tdata_real,s_axis_data_tready,src_ce,src_clk);

input ce;
input ce_2;
input ce_logic_2;
input clk;
input clk_2;
input clk_logic_2;
output[18:0] m_axis_data_tdata_real;
output m_axis_data_tvalid;
input[13:0] s_axis_data_tdata_real;
output s_axis_data_tready;
input src_ce;
input src_clk;
wire[23:0] m_axis_data_tdata_net;
wire[18:0] m_axis_data_tdata_real_ps_net;
wire m_axis_data_tvalid_ps_net;
wire m_axis_data_tvalid_ps_net_captured;
wire m_axis_data_tvalid_ps_net_or_captured_net;
wire[15:0] s_axis_data_tdata_net;
  assign m_axis_data_tdata_real_ps_net = m_axis_data_tdata_net[18 : 0];
  assign s_axis_data_tdata_net[15 : 14] = 2'b0;
  assign s_axis_data_tdata_net[13 : 0] = s_axis_data_tdata_real;
  synth_reg_w_init # (.width(19),
                  .init_index(0),
                  .init_value('b0),
                  .latency(1))
m_axis_data_tdata_real_ps_net_synchronizer (.i(m_axis_data_tdata_real_ps_net),
             .ce(ce_2),
             .clr(1'b0),
             .clk(clk_2),
             .o(m_axis_data_tdata_real));

  assign m_axis_data_tvalid_ps_net_or_captured_net = m_axis_data_tvalid_ps_net || m_axis_data_tvalid_ps_net_captured;
synth_reg_w_init # (
        .width (1),
        .init_index(0),
        .init_value(1'b0),
        .latency(1))
m_axis_data_tvalid_ps_net_synchronizer_1 (
        .i(m_axis_data_tvalid_ps_net_or_captured_net),
        .ce(ce_2),
        .clr(1'b0),
        .clk(clk_2), 
        .o(m_axis_data_tvalid)
    );
synth_reg_w_init # (
        .width(1),
        .init_index(0),
        .init_value(1'b0),
        .latency(1)
    )
m_axis_data_tvalid_ps_net_synchronizer_2 (
        .i(1'b1),
        .ce(m_axis_data_tvalid_ps_net),
        .clr(1'b0),
        .clk(clk_2), 
        .o(m_axis_data_tvalid_ps_net_captured)
    );

  hbf_fft_fir_compiler_v7_2_i0 hbf_fft_fir_compiler_v7_2_i0_instance(
      .aclk(clk),
      .aclken(ce),
      .m_axis_data_tdata(m_axis_data_tdata_net),
      .m_axis_data_tvalid(m_axis_data_tvalid_ps_net),
      .s_axis_data_tdata(s_axis_data_tdata_net),
      .s_axis_data_tready(s_axis_data_tready),
      .s_axis_data_tvalid(ce_logic_2)
    );

 endmodule



module hbf_fft_xlmult (a, b, ce, clr, clk, core_ce, core_clr,core_clk, rst, en,p);
     parameter core_name0 = "";
     parameter a_width = 4;
     parameter a_bin_pt = 2;
     parameter a_arith = `xlSigned;
     parameter b_width = 4;
     parameter b_bin_pt = 1;
     parameter b_arith = `xlSigned;
     parameter p_width = 8;
     parameter p_bin_pt = 2;
     parameter p_arith = `xlSigned;
     parameter rst_width = 1;
     parameter rst_bin_pt = 0;
     parameter rst_arith = `xlUnsigned;
     parameter en_width = 1;
     parameter en_bin_pt = 0;
     parameter en_arith = `xlUnsigned;
     parameter quantization = `xlTruncate;
     parameter overflow = `xlWrap;
     parameter extra_registers = 0;
     parameter c_a_width = 7;
     parameter c_b_width = 7;
     parameter c_type = 0;
     parameter c_a_type = 0;
     parameter c_b_type = 0;
     parameter c_baat = 4;
     parameter oversample = 1;
     parameter multsign = `xlSigned;
     parameter c_output_width = 16;
     input [a_width - 1 : 0] a;
     input [b_width - 1 : 0] b;
     input ce, clr, clk;
     input core_ce, core_clr, core_clk;
     input en, rst;
     output [p_width - 1 : 0] p;
     wire [c_a_width - 1 : 0]    tmp_a, conv_a;
     wire [c_b_width - 1 : 0]    tmp_b, conv_b;
    wire [c_output_width - 1 : 0] tmp_p;
    wire [p_width - 1 : 0] conv_p;
    wire internal_ce, internal_clr, internal_core_ce;
    wire rfd, rdy, nd;
    
 
    assign internal_ce = ce & en;
    assign internal_core_ce = core_ce & en;
    assign internal_clr = (clr | rst) & en;
    assign nd = ce & en;
 
    zero_ext # (a_width, c_a_width) zero_ext_a (.inp(a), .res(tmp_a));
    zero_ext # (b_width, c_b_width) zero_ext_b (.inp(b), .res(tmp_b));
 
    //Output Process
    convert_type # (c_output_width, a_bin_pt+b_bin_pt, multsign,
 		   p_width, p_bin_pt, p_arith, quantization, overflow)
      conv_udp (.inp(tmp_p), .res(conv_p));
    
 generate
 


if (core_name0 == "hbf_fft_mult_gen_v12_0_i2") 
     begin:comp0
hbf_fft_mult_gen_v12_0_i2 core_instance0 ( 
        .A(tmp_a),
        .B(tmp_b),
        .CLK(clk),
        .CE(internal_ce),
        .SCLR(internal_clr),
        .P(tmp_p) 
       ); 
     end 

if (core_name0 == "hbf_fft_mult_gen_v12_0_i3") 
     begin:comp1
hbf_fft_mult_gen_v12_0_i3 core_instance1 ( 
        .A(tmp_a),
        .B(tmp_b),
        .CLK(clk),
        .CE(internal_ce),
        .SCLR(internal_clr),
        .P(tmp_p) 
       ); 
     end 

if (extra_registers > 0)
 begin:latency_gt_0
 synth_reg # (p_width, extra_registers) 
 reg1 (
 .i(conv_p), 
 .ce(internal_ce),
 .clr(internal_clr),
 .clk(clk),
 .o(p));
 end
 
 if (extra_registers == 0)
 begin:latency_eq_0
 assign p = conv_p;
 end
 endgenerate
 
 endmodule

