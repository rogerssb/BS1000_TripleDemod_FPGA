`timescale 1ns / 10 ps

module bert_top (
  busClk,
  cs,
  addr,
  dataIn,
  dataOut,
  wr0, wr1, wr2, wr3,
  reset,
  clk,
  enable,
  data,
  inputSourceSelect, 
  syncDetectData,
  inSync
);

input busClk;
input cs;
input [12:0] addr;
input [31:0] dataIn;
output [31:0] dataOut;
input wr0, wr1, wr2, wr3;
input reset;
input clk;
input enable;
input data;
output  [3:0]   inputSourceSelect;
output syncDetectData;
output inSync;

// i/o register wiring

wire [23:0] poly;
wire [4:0] poly_length;
wire poly_mode;
wire [7:0] polarity_threshold;
wire [7:0] slip_limit;
wire [7:0] slip_threshold;
wire one_error_enable;
wire e3_errors_enable;
wire [7:0] sync_threshold;
wire [31:0] single_test_length;
wire single_test_start;
wire single_test_complete;
wire [31:0] single_test_errors;
wire [31:0] single_test_count;
wire continuous_test_start;
wire [31:0] continuous_test_errors;
wire [31:0] continuous_test_count;
wire bert_insync;
bert_registers bert_registers (
  .busClk(busClk),
  .cs(cs),
  .addr(addr),
  .dataIn(dataIn),
  .dataOut(dataOut),
  .wr0(wr0), .wr1(wr1), .wr2(wr2), .wr3(wr3),
  .single_test_complete(single_test_complete),
  .insync(bert_insync),
  .poly(poly),
  .poly_length(poly_length),
  .poly_mode(poly_mode),
  .polarity_threshold(polarity_threshold),
  .slip_limit(slip_limit),
  .slip_threshold(slip_threshold),
  .sync_threshold(sync_threshold),
  .single_test_length(single_test_length),
  .single_test_start(single_test_start),
  .single_test_errors(single_test_errors),
  .single_test_count(single_test_count),
  .continuous_test_start(continuous_test_start),
  .continuous_test_reset(continuous_test_reset),
  .continuous_test_errors(continuous_test_errors),
  .continuous_test_count(continuous_test_count),
  .one_error_enable(one_error_enable),
  .e3_errors_enable(e3_errors_enable),
  .inputSourceSelect(inputSourceSelect)
);

// module wiring

wire clock = clk;
wire no_data;
wire error_insert;
wire reload, lfsr_enable;
wire corr1_data_bit, corr1_code_bit;
wire corr2_data_bit, corr2_code_bit;
wire polarity_switch;
wire slip_blackout;

bert_data_detect bert_data_detect (
  .reset(reset),                            //input
  .clock(clock),                            //input
  .enable(enable),                          //input
  .data(data),                              //input
  .no_data(no_data)                         //output
);

bert_error_insert bert_error_insert (
  .reset(reset),                            //input
  .clock(clock),                            //input
  .enable(enable),                          //input
  .one_error_enable(one_error_enable),      //input
  .e3_errors_enable(e3_errors_enable),      //input
  .error_insert(error_insert)               //output
);

wire corr_data_in = error_insert ^ data;

// non-inverted data input

bert_correlator bert_correlator_1 (
  .poly(poly),                              //input [23:0]
  .poly_length(poly_length),                //input [4:0]
  .poly_mode(poly_mode),                    //input
  .reset(reset),                            //input
  .clock(clock),                            //input
  .enable(enable),                          //input
  .lfsr_enable(lfsr_enable),                //input
  .reload(reload),                          //input
  .data(corr_data_in),                      //input
  .data_bit(corr1_data_bit),                //output
  .code_bit(corr1_code_bit)                 //output
);

wire corr1_error = corr1_data_bit ^ corr1_code_bit;

// inverted data input

bert_correlator bert_correlator_2 (
  .poly(poly),
  .poly_length(poly_length),
  .poly_mode(poly_mode),
  .reset(reset),
  .clock(clock),
  .enable(enable),
  .lfsr_enable(lfsr_enable),
  .reload(reload),
  .data(~corr_data_in),
  .data_bit(corr2_data_bit),
  .code_bit(corr2_code_bit)
);

wire corr2_error = corr2_data_bit ^ corr2_code_bit;

bert_polarity_detect bert_polarity_detect (
  .threshold(polarity_threshold),           //input [7:0]
  .reset(reset),                            //input
  .clock(clock),                            //input
  .enable(enable),                          //input
  .corr1_error(corr1_error),                //input
  .corr2_error(corr2_error),                //input
  .switch(polarity_switch)                  //output
);

wire polarity_correct_data = polarity_switch ? corr2_data_bit : corr1_data_bit;
wire polarity_correct_code = polarity_switch ? corr2_code_bit : corr1_code_bit;

bert_slip_detect bert_slip_detect (
  .limit(slip_limit),                       //input [7:0]
  .threshold(slip_threshold),               //input [7:0]
  .reset(reset),                            //input
  .clock(clock),                            //input
  .enable(enable),                          //input
  .reload(reload),                          //input
  .data(polarity_correct_data),             //input
  .code(polarity_correct_code),             //input
  .lfsr_enable(lfsr_enable),                //output
  .blackout(slip_blackout)                  //output
);

reg [31:0] slip_blackout_buffer;

always @ (posedge clock) begin
  if (reset) begin
    slip_blackout_buffer <= 32'b0;
  end
  else if (enable) begin
    slip_blackout_buffer <= {polarity_correct_data ^ polarity_correct_code, slip_blackout_buffer[31:1]};
  end
end

reg [4:0] slip_blackout_count;

always @ (posedge clock) begin
  if (reset) begin
    slip_blackout_count <= 5'b0;
  end
  else if (enable) begin
    if (slip_blackout) begin
      slip_blackout_count <= 5'b11111;
    end
    else if (slip_blackout_count > 5'b0) begin
      slip_blackout_count <= slip_blackout_count - 5'b1;
    end
  end
end

wire sync_detect_data = slip_blackout_buffer[0];
wire sync_detect_data_enable = (slip_blackout_count == 5'd0);

bert_sync_detect bert_sync_detect (
  .threshold(sync_threshold),               //input [7:0]
  .no_data(no_data),                        //input
  .switch(polarity_switch),                 //input
  .reset(reset),                            //input
  .clock(clock),                            //input
  .enable(enable),                          //input
  .data(sync_detect_data),                  //input
  .data_enable(sync_detect_data_enable),    //input
  .reload(reload),                          //output
  .insync(bert_insync)                      //output
);

bert_counters bert_counters (
  .single_test_length(single_test_length),                      //input [31:0]
  .single_test_start(single_test_start),                        //input
  .single_test_complete(single_test_complete),                  //output
  .single_test_count(single_test_count),                        //output [31:0]
  .single_test_errors(single_test_errors),                      //output [31:0]
  .continuous_test_start(continuous_test_start),                //input
  .continuous_test_reset(continuous_test_reset),                //input
  .continuous_test_errors_buffer(continuous_test_errors),       //output [31:0]
  .continuous_test_count_buffer(continuous_test_count),         //output [31:0]
  .reset(reset),                                                //input
  .clock(clock),                                                //input
  .enable(enable),                                              //input
  .data(sync_detect_data),                                      //input
  .data_enable(sync_detect_data_enable)                         //input
);

assign syncDetectData = sync_detect_data;
assign inSync = bert_insync; 
endmodule