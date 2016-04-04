//------------------------------------------------------------------------------
// Project      SEMCO Multi-mode Demodulator
// Design       Decoder
// Created      February 19, 2009
//------------------------------------------------------------------------------
// 1.0      Initial coding
//
//
//------------------------------------------------------------------------------

`timescale 1ns/100ps
`include "addressMap.v"

module decoder
  (
  rs,
  en,
  `ifdef USE_BUS_CLOCK
  busClk,
  `endif
  wr0,wr1,
  addr,
  din,
  dout,
  clk,
  symb_clk_en,
  symb_clk_2x_en,
  symb_i,
  symb_q,
  dout_i,
  dout_q,
  cout,
  fifo_rs,
  clk_inv,
  bypass_fifo,
  symb_clk
  );

input rs,en,wr0,wr1;
`ifdef USE_BUS_CLOCK
input   busClk;
`endif
input clk,symb_clk_en,symb_clk_2x_en;
input [12:0]addr;
input [15:0]din;
output [15:0]dout;
input  symb_i,symb_q;
output dout_i,dout_q,cout;
output fifo_rs;
output clk_inv;
output symb_clk;
output bypass_fifo;

//------------------------------------------------------------------------------
//                          Biphase to NRZ Conversion
//------------------------------------------------------------------------------

// All I data passes through the biphase to nrz module whether biphase encoding
// is enabled or not. This module introduces one symb_clk_en delay into the I
// path.

wire            biphase, biphase_en ;
wire            nrz_i ;

biphase_to_nrz biphase_to_nrz
  (
  .rs           (rs),
  .clk          (clk),
  .symb_clk_en  (symb_clk_en),
  .biphase_en   (biphase_en),
  .biphase      (biphase),
  .symb_i       (symb_i),
  .nrz_i        (nrz_i)
  ) ;

// nrz_i is delayed one biphase_en with respect to symb_q because of its path
// through biphase_to_nrz. Here, the I/Q paths are resynchronized by injecting
// one biphase_en delay into the q path. biphase_en is an output from module
// biphase_to_nrz. A delayed copy of each is also created for input to the
// mark/space decoder module.

reg             nrz_q, nrz_delay_i, nrz_delay_q ;

always @ ( posedge clk or posedge rs )
    begin
    if ( rs )
        begin
        nrz_delay_i <= 0;
        nrz_delay_q <= 0;
        nrz_q <= 0;
        end
    else if ( symb_clk_en )
        begin
        if ( biphase_en )
            begin
            nrz_q <= symb_q;
            nrz_delay_i <= nrz_i;
            nrz_delay_q <= nrz_q;
            end
        end
    end

//------------------------------------------------------------------------------
//                          Mark Space Inversion Decode
//------------------------------------------------------------------------------

wire            dec_i;
wire    [1:0]   mode;
mrk_spc_decode mrk_spc_decode_i
  (
  .rs           (rs),
  .din          (nrz_i),
  .last_din     (nrz_delay_i),
  .clk          (clk),
  .clk_en       (symb_clk_en),
  .biphaseMode  (biphase),
  .biphase_en   (biphase_en),
  .mode         (mode),
  .dout         (dec_i)
  );

wire            dec_q;
mrk_spc_decode mrk_spc_decode_q
  (
  .rs           (rs),
  .din          (nrz_q),
  .last_din     (nrz_delay_q),
  .clk          (clk),
  .clk_en       (symb_clk_en),
  .biphaseMode  (biphase),
  .biphase_en   (biphase_en),
  .mode         (mode),
  .dout         (dec_q)
  );

//------------------------------------------------------------------------------
//                          QPSK / OQPSK Demultiplexing
//------------------------------------------------------------------------------

reg             mux_ctrl ;
always @ ( posedge clk )
    begin
    if ( symb_clk_2x_en )
        begin
        if ( symb_clk_en )
            begin
            mux_ctrl <= 1 ;
            end
        else
            begin
            mux_ctrl <= 0 ;
            end
        end
    end

reg             demux_out;
wire            swap ;
always @ ( posedge clk )
    begin
    if ( symb_clk_2x_en )
        begin
        if ( swap ^ mux_ctrl )
            begin
            demux_out <= dec_i ;
            end
        else
            begin
            demux_out <= dec_q ;
            end
        end
    end

//------------------------------------------------------------------------------
//                             FQPSK Demultiplexing
//------------------------------------------------------------------------------

reg             dec_delay_i, dec_delay_q ;
reg             feher_demux_out;
always @ ( posedge clk )
    begin
    if ( symb_clk_2x_en )
        begin
        dec_delay_i <= dec_i ;
        dec_delay_q <= dec_q ;
        feher_demux_out <= ( swap ^ mux_ctrl ) ? ( dec_delay_i ^ dec_q ) :
                                               ( dec_delay_i ^ !dec_q ) ;
        end
    end

//------------------------------------------------------------------------------
//                             Output Selection
//------------------------------------------------------------------------------

reg             out_sel_i, out_sel_q ;
wire            feher, demux ;
always @ ( posedge clk )
    begin
    if ( symb_clk_2x_en )
        begin
        if ( feher )
            begin
            out_sel_i <= !feher_demux_out ;
            out_sel_q <= feher_demux_out ;
            end
        else if ( demux )
            begin
            out_sel_i <= !demux_out ;
            out_sel_q <= demux_out ;
            end
        else
            begin
            out_sel_i <= dec_i ;
            out_sel_q <= dec_q ;
            end
        end
    end

//------------------------------------------------------------------------------
//                        Randomized NRZ-L Decoder
//------------------------------------------------------------------------------

reg     [14:0]  rand_nrz_shft ;
wire            rand_nrz_shft_en = demux ? symb_clk_2x_en : symb_clk_en ;
reg             rand_nrz_dec_out ;

always @ ( posedge clk or posedge rs )
    begin
    if ( rs )
        begin
        rand_nrz_shft <= 15'h0 ;
        rand_nrz_dec_out <= 1'b0 ;
        end
    else if ( rand_nrz_shft_en )
        begin
        rand_nrz_shft <= {rand_nrz_shft[13:0], out_sel_i} ;
        rand_nrz_dec_out <= out_sel_i ^ (rand_nrz_shft[14]^rand_nrz_shft[13]) ;
        end
    end

wire    derandomize;
wire    derand_out_i = derandomize ? rand_nrz_dec_out : out_sel_i ;
wire    derand_out_q = derandomize ? rand_nrz_dec_out : out_sel_q ;

//------------------------------------------------------------------------------
//                     Output Formatting and Inversions
//------------------------------------------------------------------------------

wire    data_inv;
wire    data_inv_i = data_inv ? !derand_out_i : derand_out_i ;
wire    data_inv_q = data_inv ? !derand_out_q : derand_out_q ;

// formatted output is nonsensical now that the data is a single bit

//wire            sign_mag ;
//wire [2:0]formatted_out_i;
//format_output format_output_i
//  (
//  .din(sign_mag_i),
//  .clk(clk),
//  .clk_en(symb_clk_2x_en),
//  .mode(sign_mag),
//  .rs(rs),
//  .dout(formatted_out_i)
//  );
//
//wire [2:0]formatted_out_q;
//format_output format_output_q
//  (
//  .din(sign_mag_q),
//  .clk(clk),
//  .clk_en(symb_clk_2x_en),
//  .mode(sign_mag),
//  .rs(rs),
//  .dout(formatted_out_q)
//  );

wire        clk_sel;
assign      cout = biphase ? biphase_en : (
                    clk_sel ? symb_clk_en : symb_clk_2x_en);
reg         symb_clk;
always @(posedge clk) begin
    if (symb_clk_en) begin
        symb_clk <= 1;
        end
    else if (symb_clk_2x_en) begin
        symb_clk <= ~symb_clk;
        end
    end

assign dout_i = data_inv_i ;
assign dout_q = data_inv_q ;

//------------------------------------------------------------------------------
//                                 Registers
//------------------------------------------------------------------------------

wire [15:0]regs_q;
decoder_regs decoder_regs(
    `ifdef USE_BUS_CLOCK
    .busClk(busClk),
    `endif
  .wr0(wr0),
  .wr1(wr1),
  .a(addr),
  .di(din[15:0]),
  .do(dout[15:0]),
  .en(en),
  .d(regs_q),
  .q(regs_q)
  );

assign {
    bypass_fifo,
    mode,
    sign_mag,
    biphase,
    swap,
    feher,
    demux,
    derandomize,
    data_inv,
    clk_sel,
    clk_inv,
    fifo_rs} = regs_q[12:0];

endmodule

`ifdef TEST_MODULE

module decoder_test;

reg rs,en,wr0,wr1;
reg clk,symb_clk_en,symb_clk_2x_en;
reg [12:0]addr;
reg [15:0]din;
wire [15:0]dout;
reg [2:0]symb_i,symb_q;
wire dout_i,dout_q,cout;
wire fifo_rs;
wire clk_inv;

decoder uut
  (
  rs,
  en,
  wr0,wr1,
  addr,
  din,
  dout,
  clk,
  symb_clk_en,
  symb_clk_2x_en,
  symb_i,
  symb_q,
  dout_i,
  dout_q,
  cout,
  fifo_rs,
  clk_inv
  );

initial begin
  rs = 0;
  en = 0;
  wr0 = 0;
  wr1 = 0;
  clk = 0;
  symb_clk_en = 0;
  symb_clk_2x_en = 0;
  addr = 0;
  din = 0;
  symb_i = 0;
  symb_q = 0;

  uut.decoder_regs.q = 16'h0004;

  #100 rs = !rs;
  #100 rs = !rs;
end

always #5 clk = !clk;

//set symb_clk_en rate at 4 MHz

reg [4:0]symb_divider;
always @(posedge clk or posedge rs)begin
  if(rs)begin
    symb_divider <= 0;
    symb_clk_en <= 0;
    end
  else if(symb_divider==24)begin
    symb_divider <= 0;
    symb_clk_en <= 1;
    end
  else begin
    symb_divider <= symb_divider +1;
    symb_clk_en <= 0;
    end
end

endmodule

`endif
