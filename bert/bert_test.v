`timescale 1ns / 10 ps

`include "addressMap.v"

module bert_test ();

`define BIT0 32'h00000001
`define BIT1 32'h00000002
`define BIT2 32'h00000004
`define BIT4 32'h00000010
`define BIT5 32'h00000020
`define BIT31 32'h80000000
`define POLY8 {8'd8, 24'b0000_0000_0000_0000_1011_1000}
`define POLY16 {8'd16, 24'b0000_0000_1011_0100_0000_0000}

reg clock;
initial clock = 1'b0;
always #5 clock = !clock;

reg reset;
initial reset = 1;

reg busClk;
initial busClk = 0;
always #50 busClk = ~busClk;

reg pngen_cs;
initial pngen_cs = 0;

reg bert_cs;
initial bert_cs = 0;

reg [12:0]addr;
initial addr = 0;

reg [31:0]dataIn;
initial dataIn = 0;

always @* begin
  casex(addr)
    `PNGEN_SPACE: pngen_cs <= 1;
    `BERT_SPACE: bert_cs <= 1;
    default: begin
      pngen_cs <= 0;
      bert_cs <= 0;
    end
  endcase
end

wire [31:0] bert_top_dataOut, pngen_top_dataOut;
tri [31:0] dataOut = pngen_cs ? pngen_top_dataOut : (bert_cs ? bert_top_dataOut : 32'bz );

reg wr0, wr1, wr2, wr3;
initial wr0 = 0;
initial wr1 = 0;
initial wr2 = 0;
initial wr3 = 0;

reg stop;
initial stop = 1'b0;

reg [15:0] bit_sel;
initial bit_sel = 16'd8;

reg polarity;
initial polarity = 0;

reg pngen_clock;
initial pngen_clock = 1;
reg [3:0] pngen_clock_divider;
initial pngen_clock_divider = 4'b0;

parameter CLOCKS_PER_BIT = 8;
parameter BIT_TIME = 10 * CLOCKS_PER_BIT;
parameter DIVIDE_BIT =  CLOCKS_PER_BIT == 2 ? 0 : (
                        CLOCKS_PER_BIT == 4 ? 1 : (
                        CLOCKS_PER_BIT == 8 ? 2 : 0 ));

always @ (posedge clock) begin
  pngen_clock <= #3 pngen_clock_divider[DIVIDE_BIT];
  pngen_clock_divider <= pngen_clock_divider + 4'b1;
end

wire pngen_data;

pngen_top pngen_top (
  .busClk(busClk),
  .cs(pngen_cs),
  .addr(addr),
  .dataIn(dataIn),
  .dataOut(pngen_top_dataOut),
  .wr0(wr0), .wr1(wr1), .wr2(wr2), .wr3(wr3),
  .reset(reset),
  .clock(pngen_clock),
  .enable(1'b1),
  .data(pngen_data)
);

// Random data
parameter PN = 16'h00b8,
          MASK = 16'h0099;
reg     [15:0]  sr;
reg             randData;
always @(posedge pngen_clock or posedge reset) begin
    if (reset) begin
        sr <= MASK;
        end
    else begin
        sr <= {sr[14:0], ^(PN & sr)};
        randData <= sr[0];
        end
    end

reg [15:0] pngen_data_shift;
initial pngen_data_shift = 16'd0;
always @ (posedge pngen_clock) begin
  //pngen_data_shift <= {pngen_data, pngen_data_shift[15:1]};
  pngen_data_shift <= {randData, pngen_data_shift[15:1]};
end

integer noise;
always @ (posedge pngen_clock) begin
  noise <= {$random} % 100; // 0 to +99
end

reg[4:0] noise_figure;
initial noise_figure = 0;
wire noise_bit = (noise < noise_figure) ? 1'b1 : 1'b0;

wire din = stop ? 1'b1 : polarity ^ pngen_data_shift[bit_sel] ^ noise_bit;

bert_top bert_top (
  .busClk(busClk),
  .cs(bert_cs),
  .addr(addr),
  .dataIn(dataIn),
  .dataOut(bert_top_dataOut),
  .wr0(wr0), .wr1(wr1), .wr2(wr2), .wr3(wr3),
  .reset(reset),
  .clk(clock),
  .dclk(pngen_clock),
  .din(din)
);

initial begin
  #100 reset = !reset;
  #100;
  write (createAddress (`PNGEN_SPACE, `PNGEN_POLY), `POLY8);
  write (createAddress (`BERT_SPACE, `BERT_POLY), `POLY8);
  write (createAddress (`BERT_SPACE, `POLARITY_THRESHOLD), 32'd64);
  write (createAddress (`BERT_SPACE, `SLIP_LIMIT), 32'd30);
  write (createAddress (`BERT_SPACE, `SLIP_THRESHOLD), 32'd20);
  write (createAddress (`BERT_SPACE, `SLIP_RECOVERY), 32'd4);
  write (createAddress (`BERT_SPACE, `SYNC_THRESHOLD), 32'd120);
  write (createAddress (`BERT_SPACE, `SINGLE_TEST_LENGTH), 32'd5000);
  write (createAddress (`BERT_SPACE, `TEST_CONTROL), 32'h0);
  #100 reset = !reset;
  #100 reset = !reset;

  #(2000*BIT_TIME) noise_figure = 0;
  #(2000*BIT_TIME) stop_data;
  #(2000*BIT_TIME) start_data;
//  #(2000*BIT_TIME) force_reload;
//  #(20000*BIT_TIME) polarity = !polarity;
//  #(20000*BIT_TIME) polarity = !polarity;
  #(20000*BIT_TIME) slip_late;
//  #(20000*BIT_TIME) slip_late;
//  #(20000*BIT_TIME) slip_early;
//  #(20000*BIT_TIME) slip_early;
  #(20000*BIT_TIME) start_single_test;
  #(20000*BIT_TIME) start_single_test;
  write (createAddress (`BERT_SPACE, `SINGLE_TEST_LENGTH), 32'd3500);
  #(20000*BIT_TIME) start_single_test;
  #(20000*BIT_TIME) start_single_test;
  #(20000*BIT_TIME) start_single_test;
  #(20000*BIT_TIME) start_continuous_test;
  #(30000*BIT_TIME) start_continuous_test;
  single_error;
  #(40000*BIT_TIME) start_continuous_test;
  #(50000*BIT_TIME) start_continuous_test;
  #(60000*BIT_TIME) start_continuous_test;
  $stop;

  end

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function [12:0] createAddress;
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  input [12:0] addrA;
  input [12:0] addrB;

  integer i;
  reg [12:0]finalAddress;

  begin
    for (i = 0; i < 13; i = i+1) begin
      if (addrA[i] === 1'bx) begin
        finalAddress[i] = addrB[i];
      end
      else if (addrB[i] === 1'bx) begin
        finalAddress[i] = addrA[i];
      end
      else begin
        finalAddress[i] = addrA[i] | addrB[i];
      end
    end
  createAddress = finalAddress;
  end
endfunction

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
task write;
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  input [12:0] a;
  input [31:0] d;

  begin
    addr = a;
    dataIn = d;
    wait(!busClk);
    wait(busClk);
    #1 wr0 = 1;
    wr1 = 1;
    wr2 = 1;
    wr3 = 1;
    wait(!busClk);
    wait(busClk);
    #1 wr0 = 0;
    wr1 = 0;
    wr2 = 0;
    wr3 = 0;
    wait(!busClk);
    addr = 0;
    dataIn = 32'hz;
    wait(busClk);
  end
endtask

reg [31:0] tb_dataOut;
initial tb_dataOut = 32'd0;

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
task read;
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  input [12:0] a;

  begin
    addr = a;
    wait(!busClk);
    wait(busClk);
    wait(!busClk);
    wait(busClk);
    tb_dataOut = dataOut;
    wait(!busClk);
    addr = 0;
    wait(busClk);
  end
endtask

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
task set_bit;
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  input [12:0] a;
  input [31:0] d;

  begin
  read (a);
  write(a, tb_dataOut | d);
  end
endtask

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
task clear_bit;
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  input [12:0] a;
  input [31:0] d;

  begin
  read (a);
  write(a, tb_dataOut & ~d);
  end
endtask

wire enable = bert_top.bert_input_sync.enable;

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
task force_reload;
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  begin
    wait(enable);
    wait(!enable);
    #1 bert_top.bert_sync_detect.reload = 0;
    wait(enable);
    wait(!enable);
    #1 bert_top.bert_sync_detect.reload = 1;
    wait(enable);
    wait(!enable);
    #1 bert_top.bert_sync_detect.reload = 0;
  end
endtask

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
task slip_early;
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  begin
    wait(enable);
    wait(!enable);
    #1 bit_sel <= bit_sel + 8'd1;
  end
endtask

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
task slip_late;
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  begin
    wait(enable);
    wait(!enable);
    #1 bit_sel <= bit_sel - 8'd1;
  end
endtask

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
task stop_data;
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  begin
    wait(enable);
    wait(!enable);
    #1 stop <= 1'b1;
  end
endtask

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
task start_data;
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  begin
    wait(enable);
    wait(!enable);
    #1 stop <= 1'b0;
  end
endtask

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
task single_error;
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  begin
    set_bit (createAddress (`BERT_SPACE, `TEST_CONTROL), `BIT4);
    #(5*BIT_TIME) clear_bit (createAddress (`BERT_SPACE, `TEST_CONTROL), `BIT4);
  end
endtask

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
task enable_1e3_errors;
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  begin
    set_bit (createAddress (`BERT_SPACE, `TEST_CONTROL), `BIT5);
  end
endtask

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
task disable_1e3_errors;
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  begin
    clear_bit (createAddress (`BERT_SPACE, `TEST_CONTROL), `BIT5);
  end
endtask

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
task start_single_test;
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  begin
    set_bit (createAddress (`BERT_SPACE, `TEST_CONTROL), `BIT0);
    #(5*BIT_TIME) clear_bit (createAddress (`BERT_SPACE, `TEST_CONTROL), `BIT0);
    #100 read_single_test;
  end
endtask

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
task read_single_test;
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  reg [31:0] A, B;
  begin
    read (createAddress (`BERT_SPACE, `TEST_CONTROL));
    while ((tb_dataOut & `BIT1) != `BIT1) begin
      read (createAddress (`BERT_SPACE, `TEST_CONTROL));
    end
    read (createAddress (`BERT_SPACE, `SINGLE_TEST_ERRORS));
    A = tb_dataOut;
    read (createAddress (`BERT_SPACE, `SINGLE_TEST_COUNT));
    B = tb_dataOut;
    $display ("SNGL %d %d", A, B);
  end
endtask

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
task start_continuous_test;
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  reg [31:0] A, B;
  begin
    set_bit (createAddress (`BERT_SPACE, `TEST_CONTROL), `BIT2);
    #(5*BIT_TIME) clear_bit (createAddress (`BERT_SPACE, `TEST_CONTROL), `BIT2);
    read (createAddress (`BERT_SPACE, `CONTINUOUS_TEST_ERRORS));
    A = tb_dataOut;
    read (createAddress (`BERT_SPACE, `CONTINUOUS_TEST_COUNT));
    B = tb_dataOut;
    $display ("CONT %d %d", A, B);
  end
endtask

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
task use_reverse_bert_poly;
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  begin
    set_bit (createAddress (`BERT_SPACE, `BERT_POLY), `BIT31);
  end
endtask

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
task use_forward_bert_poly;
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  begin
    clear_bit (createAddress (`BERT_SPACE, `BERT_POLY), `BIT31);
  end
endtask

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
task use_reverse_pngen_poly;
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  begin
    set_bit (createAddress (`PNGEN_SPACE, `PNGEN_POLY), `BIT31);
  end
endtask

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
task use_forward_pngen_poly;
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  begin
    clear_bit (createAddress (`PNGEN_SPACE, `PNGEN_POLY), `BIT31);
  end
endtask

endmodule