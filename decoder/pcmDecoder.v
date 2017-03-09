`timescale 1ns/100ps
`include "addressMap.v"

module pcmDecoder (
    input                   rs,
    input                   en,
    `ifdef USE_BUS_CLOCK
    input                   busClk,
    `endif
    input                   wr0,wr1,wr2,wr3,
    input           [12:0]  addr,
    input           [31:0]  din,
    output          [31:0]  dout,
    input                   clk,
    input                   symb_clk_en,
    input                   symb_clk_2x_en,
    input                   symb,
    output                  data_out,
    output reg              clkEn_out,
    output                  fifo_rs,
    output          [1:0]   clkPhase,
    output                  bypass_fifo,
    output reg              symb_clk,
    output                  inputSelect
);

    wire            [1:0]   mode;
    wire            [2:0]   derandMode;
    decoderRegs decoderRegs(
        `ifdef USE_BUS_CLOCK
        .busClk(busClk),
        `endif
        .cs(en),
        .wr0(wr0), .wr1(wr1), .wr2(wr2), .wr3(wr3),
        .addr(addr),
        .dataIn(din),
        .dataOut(dout),
        .fifoReset(fifo_rs),
        .clkPhase(clkPhase),
        .clkSelect(clk_sel),
        .dataInvert(data_inv),
        .derandomize(derandMode),
        .demuxEnable(demux),
        .feherEnable(feher),
        .iqSwap(swap),
        .biphaseEnable(biphase),
        .millerEnable(miller),
        .mode(mode),
        .bypassFifo(bypass_fifo),
        .inputSelect(inputSelect)
    );

//------------------------------------------------------------------------------
//                          Biphase to NRZ Conversion
//------------------------------------------------------------------------------

// All data passes through the biphase to nrz module whether biphase encoding
// is enabled or not. This module introduces one symb_clk_en delay into the data
// path.

wire            biphase_en ;
wire            nrz ;

biphase_to_nrz biphase_to_nrz
  (
  .rs           (rs),
  .clk          (clk),
  .symb_clk_en  (symb_clk_en),
  .biphase_en   (biphase_en),
  .biphase      (biphase),
  .symb_i       (symb),
  .nrz_i        (nrz)
  ) ;

reg             nrz_delay;
always @ ( posedge clk or posedge rs )
    begin
    if ( rs )
        begin
        nrz_delay <= 0;
        end
    else if ( symb_clk_en )
        begin
        if ( biphase_en )
            begin
            nrz_delay <= nrz;
            end
        end
    end

//------------------------------------------------------------------------------
//                          Mark Space Inversion Decode
//------------------------------------------------------------------------------

wire            dec;
mrk_spc_decode mrk_spc_decode
  (
  .rs           (rs),
  .din          (nrz),
  .last_din     (nrz_delay),
  .clk          (clk),
  .clk_en       (symb_clk_en),
  .biphaseMode  (biphase),
  .biphase_en   (biphase_en),
  .mode         (mode),
  .dout         (dec)
  );


//------------------------------------------------------------------------------
//                             Miller Decoding
//------------------------------------------------------------------------------
    millerDecoder md(
        .clk(clk),
        .reset(rs),
        .clkEn(1'b1),
        .pcmEn(symb_clk_en),
        .pcmMode({miller,1'b0,mode}),
        .pcmBit(symb),
        .nrzEn(millerBitEn),
        .nrzBit(millerBit)
    );

//------------------------------------------------------------------------------
//                        Randomized NRZ-L Decoder
//------------------------------------------------------------------------------

    reg     [22:0]  rand_nrz_shft ;
    reg             rand_nrz_shft_en;
    always @* begin
        if (miller) begin
            rand_nrz_shft_en = (millerBitEn & symb_clk_en);
        end
        else if (biphase) begin
            rand_nrz_shft_en = (biphase_en & symb_clk_en);
        end
        else begin
            rand_nrz_shft_en = symb_clk_en;
        end
    end
    reg             rand_nrz_dec_out ;

    always @ ( posedge clk or posedge rs ) begin
        if ( rs ) begin
            rand_nrz_shft <= 23'h0 ;
            rand_nrz_dec_out <= 1'b0 ;
        end
        else if ( rand_nrz_shft_en ) begin
            rand_nrz_shft <= {rand_nrz_shft[21:0], dec} ;
            case (derandMode)
                `DEC_DERAND_MODE_RNRZ15:
                    rand_nrz_dec_out <= dec ^ (rand_nrz_shft[14]^rand_nrz_shft[13]) ;
                `DEC_DERAND_MODE_RNRZ9:
                    rand_nrz_dec_out <= dec ^ (rand_nrz_shft[8]^rand_nrz_shft[4]) ;
                `DEC_DERAND_MODE_RNRZ11:
                    rand_nrz_dec_out <= dec ^ (rand_nrz_shft[10]^rand_nrz_shft[8]) ;
                `DEC_DERAND_MODE_RNRZ17:
                    rand_nrz_dec_out <= dec ^ (rand_nrz_shft[16]^rand_nrz_shft[13]) ;
                `DEC_DERAND_MODE_RNRZ23:
                    rand_nrz_dec_out <= dec ^ (rand_nrz_shft[22]^rand_nrz_shft[17]) ;
                default:
                    rand_nrz_dec_out <= dec ^ (rand_nrz_shft[14]^rand_nrz_shft[13]) ;
            endcase
        end
    end

    wire    derandomize = (derandMode != `DEC_DERAND_MODE_OFF);
    wire    derand_out = derandomize ? rand_nrz_dec_out : dec ;

//------------------------------------------------------------------------------
//                     Output Formatting and Inversions
//------------------------------------------------------------------------------

    assign  data_out = data_inv ? !derand_out : derand_out ;

    always @* begin
        if (miller) begin
            clkEn_out = (millerBitEn & symb_clk_en);
        end
        else if (biphase) begin
            clkEn_out = (biphase_en & symb_clk_en);
        end
        else if (clk_sel) begin
            clkEn_out = symb_clk_en;
        end
        else begin
            clkEn_out = symb_clk_2x_en;
        end
    end

    always @(posedge clk) begin
        if (miller) begin
            if (millerBitEn & symb_clk_en) begin
                symb_clk <= 1;
            end
            else if (symb_clk_en) begin
                symb_clk <= ~symb_clk;
            end
        end
        else if (biphase) begin
            if (biphase_en & symb_clk_en) begin
                symb_clk <= 1;
            end
            else if (symb_clk_en) begin
                symb_clk <= ~symb_clk;
            end
        end
        else begin
            if (symb_clk_en) begin
                symb_clk <= 1;
            end
            else if (symb_clk_2x_en) begin
                symb_clk <= ~symb_clk;
            end
        end
    end


endmodule


`ifdef TEST_MODULE
module decoder_test;

reg rs,en,wr0,wr1;
reg clk,symb_clk_en,symb_clk_2x_en;
reg [11:0]addr;
reg [15:0]din;
wire [15:0]dout;
reg [2:0]symb_i,symb_q;
wire dout_i,dout_q,clk_out;
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
  clk_out,
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
