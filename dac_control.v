//-----------------------------------------------------------------------------
// Project      SEMCO Multi-mode Demodulator
// Design       DAC setup and control interface
// Created      10/30/08
//-----------------------------------------------------------------------------
// 1.0      Initial coding
//
//
//-----------------------------------------------------------------------------
// This module provides read and write capabilities for configuring the AD9707
// through its spi interface.
//
// Every transfer begins with a word write to DAC_WDATA. The first byte,
// the instruction byte, informs the AD9861 of the transfer direction, how many
// data bytes will be transfered, and the destination address. In this
// application, the number of data bytes transfered is always one.
//
// A write to DAC_WDATA, initiates the transfer to the AD9707. While the
// transfer is in progress a busy signal is generated so that the processor may
// avoid over-running the device. This busy signal may be read at any time
// without interfering with the transfer. The busy is the LSB of the third
// memory location DAC_STATUS. Whenever the busy is cleared, the transfer
// engine is idle and a new transfer may be initiated.
//
// Data read from the AD9707 can be read from DAC_RDATA.
//
// Three DACs are controlled through this shared interface so that only one DAC
// may be accessed at a time.  The processor must use the status register to
// monitor DAC transfers.
//-----------------------------------------------------------------------------

`timescale 1 ns/100ps
`include ".\addressMap.v"
`include ".\defines.v"

module dac_control
  (
  wr,			// input,  processor bus write strobe
  a,      // input, processor bus address
  di,     // input, processor bus data
  do,     // output, processor bus data
  ck,     // input, clock
  en,     // input, processor bus address decode
  rs,     // input, processor chip reset
  sck,    // output, serial bus clock
  sel0,   // output, DAC0 chip select
  sel1,
  sel2,
  sdi,    // input, serial bus data
  sdo,    // output, serial bus data
  soe     // output, serial bus data output enable
  );

input [12:0]a;
input [15:0]di;
output [15:0]do;
input wr,ck,en,sdi,rs;
output sck,sel0,sel1,sel2,sdo,soe;

// reset featuring synchronous release

reg srs;
always @(posedge ck or posedge rs) begin
    if(rs) srs <= 1;
    else srs <= 0;
end

// a processor write to the WDATA register asserts the asynchronous wr_flag this
// flag is monitored by the state machine and its assertion initiates a data
// transfer. The direction of the transfer is determined from the msb and is
// held until the next cycle in register wr_cycle. wr_flag (which is the busy
// bit in the status register is cleared at the end of the transfer by w_rst.

reg [23:0] s;
reg [15:0]wr_buf;
reg wr_flag,wr_cycle;
reg [1:0]dac_sel;

wire w_rst = (s == `S20);

always @(negedge wr or posedge w_rst) begin
  if(w_rst) begin
     wr_buf <= wr_buf;
     wr_cycle <= wr_cycle;
     wr_flag <= 0;
     dac_sel <= dac_sel;
  end
  else if(en) begin
    casex(a)
      `DAC_WDATA: begin
        wr_buf <= di;
        wr_cycle <= !di[15];
        wr_flag <= 1;
      end
      `DAC_SELECT: dac_sel <=  di[1:0];
      default: ;
    endcase
  end
end

// A write flag, wr_flag is set whenever DACX_WDATA is written. Here it is
// synchronized and edge detected before being read by the transfer state
// machine.

// Data from the AD9707 is read from location DACX_RDATA. Transfer status is
// obtained by reading the lsb of DACX_STATUS. The bit is set when a transfer
// begins and cleared when a transfer completes. This allows the processor to
// pace transfers into the AD9707.

wire busy;
reg [15:0]do,rd_buf;
always @* begin
  if(en) begin
    casex(a)
      `DAC_RDATA:   do = rd_buf;
      `DAC_SELECT:  do = {14'bx,dac_sel};
      `DAC_STATUS:  do = {15'bx,busy};
      default:      do = 16'hxxxx;
    endcase
  end
	else do = 16'hxxxx;
end

// This transfer state machine is built from a 24-bit shift register with a
// condition at S1 that holds for the assertion of w_flag_sync. Once a write is
// detected, the s machine runs to completion and returns to the holding
// state.  A transfer requires 22 clocks to complete.  The maximum clock rate is
// 25 MHz.

reg s_en;
reg [2:0] w_flag_sync;
always @(posedge ck or posedge srs)begin
  if(srs)begin
		s_en <= 0;
		w_flag_sync <= 0;
		s <= `S1;
	end
	else begin
    s_en <= !s_en;
    if(s_en)begin
    	w_flag_sync <= {w_flag_sync[1:0],wr_flag};
    	if((s == `S1) & (w_flag_sync != 3'b011)) s <= `S1;
    	else if(s == `S22) s <= `S1;
    	else s <= s << 1;
    end
	end
end

// serial bus slave select
// this may be inverted at the top level if needed

reg sel;
always @(posedge ck)begin
	if(!s_en)begin
		if((s > `S2) & (s < `S20)) sel <= 1;
		else sel <= 0;
	end
end

assign
	sel2 = sel & dac_sel == 2,
	sel1 = sel & dac_sel == 1,
	sel0 = sel & dac_sel == 0;
	
assign busy = wr_flag | sel;	

// the serial bus clock is a gated version of the logic clock used in the
// module. It is gated on its own falling edge to keep the risin edge free of
// glitches.

// serial bus data from the AD9707 is sampled on the rising clock edge. 16 bits
// of data is always sampled. In the case of writes to the AD9707, the data
// shifted in here is the data written to the device. In this case the processor
// would ignore the read data.

reg sck;
always @(posedge ck)begin
  if((s > `S2) && (s <= `S18))begin
		sck <= s_en;
		if(s_en)rd_buf <= {rd_buf[14:0],sdi};
	end
  else begin
		sck <= 0;
		rd_buf <= rd_buf;
	end
end

// The serial bus is a three-wire interface. soe should be used at the top
// level to tristate sdo during read transfers

reg soe;
always @(posedge ck) begin
	if(!s_en)begin
		if((s > `S2) && ((s < `S11) || (wr_cycle && (s < `S20)))) soe <= 1;
		else soe <= 0;
	end
end

// ibuf_shft is loaded with a copy of wr_buf since wr_buf cannot be shifted; it
// being in the processor write always block. The shift is on the falling clock
// edge and msb first.

reg [15:0] ibuf_shft;
always @(posedge ck) begin
	if(!s_en)begin
		if(s == `S3) ibuf_shft <= wr_buf;
		else if((s > `S3) && (s < `S19)) ibuf_shft <= ibuf_shft << 1;
	end
end

assign sdo = ibuf_shft[15];

endmodule