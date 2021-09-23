/******************************************************************************
Copyright 2008-2015 Koos Technical Services, Inc. All Rights Reserved

This source code is the Intellectual Property of Koos Technical Services,Inc.
(KTS) and is provided under a License Agreement which protects KTS' ownership and
derivative rights in exchange for negotiated compensation.
******************************************************************************/

`timescale 1ns/10ps

`include "addressMap.v"

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
output [31:0] dataOut;
input wr0, wr1, wr2, wr3;
input single_test_complete;
input insync;
input [31:0] single_test_errors;
input [31:0] single_test_count;
input [31:0] continuous_test_errors;
input [31:0] continuous_test_count;

output [23:0] poly;
reg [23:0] poly;

output [4:0] poly_length;
reg [4:0] poly_length;

output poly_mode;
reg poly_mode;

output [7:0] polarity_threshold;
reg [7:0] polarity_threshold;

output [7:0] slip_limit;
reg [7:0] slip_limit;

output [7:0] slip_threshold;
reg [7:0] slip_threshold;

reg [7:0] slip_recovery;

output [7:0] sync_threshold;
reg [7:0] sync_threshold;

output [31:0] single_test_length;
reg [31:0] single_test_length;

output single_test_start;
reg single_test_start;

output continuous_test_start;
reg continuous_test_start;

output continuous_test_reset;
reg continuous_test_reset;
output one_error_enable;
reg one_error_enable;

output e3_errors_enable;
reg e3_errors_enable;

output  [3:0]   inputSourceSelect;
reg     [3:0]   inputSourceSelect;

always @(posedge busClk) begin
  if (cs && wr0) begin
    casex (addr)
      `BERT_POLY: begin
        poly[7:0] <= dataIn[7:0];
      end
      `POLARITY_THRESHOLD: begin
        polarity_threshold[7:0] <= dataIn[7:0];
      end
      `SLIP_LIMIT: begin
        slip_limit[7:0] <= dataIn[7:0];
      end
      `SLIP_THRESHOLD: begin
        slip_threshold[7:0] <= dataIn[7:0];
      end
      `SLIP_RECOVERY: begin
        slip_recovery[7:0] <= dataIn[7:0];
      end
      `SYNC_THRESHOLD: begin
        sync_threshold[7:0] <= dataIn[7:0];
      end
      `SINGLE_TEST_LENGTH:  begin
        single_test_length[7:0] <= dataIn[7:0];
      end
      `TEST_CONTROL: begin
        e3_errors_enable <= dataIn[5];
        one_error_enable <= dataIn[4];
        continuous_test_reset <= dataIn[3];
        continuous_test_start <= dataIn[2];
        single_test_start <= dataIn[0];
      end
      `SOURCE_SELECT: begin
        inputSourceSelect <= dataIn[3:0];
      end
      default:  ;
    endcase
  end
  if (cs && wr1) begin
    casex (addr)
      `BERT_POLY: begin
        poly[15:8] <= dataIn[15:8];
      end
      `SINGLE_TEST_LENGTH: begin
        single_test_length[15:8] <= dataIn[15:8];
      end
      default:  ;
    endcase
  end
  if (cs && wr2) begin
    casex (addr)
      `BERT_POLY: begin
        poly[23:16] <= dataIn[23:16];
      end
      `SINGLE_TEST_LENGTH: begin
        single_test_length[23:16] <= dataIn[23:16];
      end
      default:  ;
    endcase
  end
  if (cs && wr3) begin
    casex (addr)
      `BERT_POLY: begin
        poly_length <= dataIn[28:24];
        poly_mode <= dataIn[31];
      end
      `SINGLE_TEST_LENGTH: begin
        single_test_length[31:24] <= dataIn[31:24];
      end
      default:  ;
    endcase
  end
end

// Latch a loss of sync which is cleared by continuous_test_reset
reg syncLoss;
always @(posedge busClk or negedge insync) begin
    if (!insync) begin
        syncLoss <= 1;
    end
    else if (continuous_test_reset) begin
        syncLoss <= 0;
    end
end


reg [31:0]dataOut;
always @* begin
  if (cs) begin
    casex (addr)
      `BERT_POLY: begin
        dataOut = {poly_mode, 2'bx, poly_length[4:0], poly[23:0]};
      end
      `POLARITY_THRESHOLD: begin
        dataOut = {24'bx, polarity_threshold[7:0]};
      end
      `SLIP_LIMIT: begin
        dataOut = {24'bx, slip_limit[7:0]};
      end
      `SLIP_THRESHOLD: begin
        dataOut = {24'bx, slip_threshold[7:0]};
      end
      `SLIP_RECOVERY: begin
        dataOut = {24'bx, slip_recovery[7:0]};
      end
      `SYNC_THRESHOLD: begin
        dataOut = {24'bx, sync_threshold[7:0]};
      end
      `SINGLE_TEST_LENGTH: begin
        dataOut = single_test_length;
      end
      `SINGLE_TEST_ERRORS: begin
        dataOut = single_test_errors;
      end
      `SINGLE_TEST_COUNT: begin
        dataOut = single_test_count;
      end
      `CONTINUOUS_TEST_ERRORS: begin
        dataOut = continuous_test_errors;
      end
      `CONTINUOUS_TEST_COUNT: begin
        dataOut = continuous_test_count;
      end
      `TEST_CONTROL: begin
        dataOut = {
            insync,syncLoss,2'bx,
            20'bx, 
            2'bx,e3_errors_enable, one_error_enable, 
            continuous_test_reset, continuous_test_start, single_test_complete, single_test_start
            };
      end
      `SOURCE_SELECT: begin
        dataOut = {16'b0,12'b0,inputSourceSelect};
      end
      default: begin
        dataOut = 32'hx;
      end
    endcase
  end
  else begin
    dataOut = 32'hx;
  end
end

endmodule