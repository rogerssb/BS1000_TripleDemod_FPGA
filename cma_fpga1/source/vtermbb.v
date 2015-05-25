//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//	vterm.v														Verne Stauffer
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//	1.0		2011-03-05	Created
//	1.1		2011-03-19	Added ascii code DC1-4 outputs
//	1.2		2011-03-24	Added read next on CR
//	1.3		2011-04-01	Removed leading zeroes requirement
//	1.4		2012-06-04	Moved rxd sample point from 1/2 to 3/4 bit (although
//						not a big deal at these data rates)
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// Vterm provides a small asynchronous interface for directly writing and
// reading FPGA registers using the FTDI USB to TTL adapter cable. The design
// goal has been to keep this simple in order to minimize resources. This means
// the text string sent to the FPGA must be correct. For a write, the string is
// one to four address digits followed by one space character followed by one to
// four data digits immediately terminated by a carriage return. For a register
// read, the input string is one to four address digits immediately terminated
// by a carriage return. A carriage return only input string reads the next
// address. Set the terminal's receive and transmit new-line characters to CR
// only. Use 115200-8-N-1. A different baud rate can be set up in clks.v.
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

`timescale 1ns/10ps

module vterm
	(
	addr,		// address to registers
	ce,         // chip enable, high-true
	clk,        // synchronous logic clock
	ctrl_q,     // device control, DC1
	ctrl_r,     // DC2
	ctrl_s,     // DC3
	ctrl_t,     // DC4
	din,        // read data from registers
	dout,       // write data to registers
	oe,         // output enable for tri-stating registers, high-true
	rst,        // synchronous logic reset
	rxd,        // async receive data
	txd,        // async transmit data
	we			// write enable, high-true
	);

output	[15:0]	addr;
output			ce;
input			clk;
output			ctrl_q;
output			ctrl_r;
output			ctrl_s;
output			ctrl_t;
input	[15:0]	din;
output	[15:0]	dout;
output			oe;
input			rst;
input			rxd;
output			txd;
output			we;

endmodule