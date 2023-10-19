`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/29/2023 10:44:49 AM
// Design Name: 
// Module Name: bert_registers_tmp
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
module bert_registers (
  busClk,
  cs,
  addr,
  dataIn,
  dataOut,
  wr0, wr1, wr2, wr3,
  single_test_complete,
  insync,
  poly,
  poly_length,
  poly_mode,
  polarity_threshold,
  slip_limit,
  slip_threshold,
  sync_threshold,
  single_test_length,
  single_test_start,
  single_test_errors,
  single_test_count,
  continuous_test_start,
  continuous_test_reset,
  continuous_test_errors,
  continuous_test_count,
  one_error_enable,
  e3_errors_enable,
  inputSourceSelect
);

input busClk;
input cs;
input [12:0] addr;
input [31:0] dataIn;
input wr0, wr1, wr2, wr3;
input single_test_complete;
input insync;
input [31:0] single_test_errors;
input [31:0] single_test_count;
input [31:0] continuous_test_errors;
input [31:0] continuous_test_count;

output [31:0]     dataOut;
wire [31:0]  dataOut = 31'hzzzzzzzz;

output [23:0] poly;
reg [23:0] poly = 24'h000500;

output [4:0] poly_length;
reg [4:0] poly_length = 5'd11 ;

output poly_mode;
reg poly_mode = 0;

output [7:0] polarity_threshold;
reg [7:0] polarity_threshold = 32'd64;

output [7:0] slip_limit;
reg [7:0] slip_limit = 32'd30;

output [7:0] slip_threshold;
reg [7:0] slip_threshold = 32'd20;

//reg [7:0] slip_recovery;

output [7:0] sync_threshold = 32'd120;
reg [7:0] sync_threshold;

output [31:0] single_test_length;
reg [31:0] single_test_length = 32'd1000000;

output single_test_start;
reg single_test_start = 0;

output continuous_test_start;
reg continuous_test_start = 0;

output continuous_test_reset;
reg continuous_test_reset = 0;
output one_error_enable = 0;
reg one_error_enable = 0;

output e3_errors_enable;
reg e3_errors_enable = 0;

output  [3:0]   inputSourceSelect;
reg     [3:0]   inputSourceSelect = 0;

endmodule
