// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2016.3 (win64) Build 1682563 Mon Oct 10 19:07:27 MDT 2016
// Date        : Fri Dec 09 11:24:34 2016
// Host        : Sherlock running 64-bit Service Pack 1  (build 7601)
// Command     : write_verilog -force -mode funcsim
//               c:/modem/telemetry/stcDemod/pilotDetector.srcs/sources_1/ip/pilotSynch/pilotSynch_sim_netlist.v
// Design      : pilotSynch
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7k160tfbg676-3
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "pilotSynch,pilotsync,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "pilotsync,Vivado 2016.3" *) 
(* NotValidForBitStream *)
module pilotSynch
   (imagsyncin,
    pilotindexin,
    pilotpulsein,
    realsyncin,
    validsyncin,
    clk,
    imagout,
    offset,
    realout,
    startout,
    validout,
    pilot_index);
  (* x_interface_info = "xilinx.com:signal:data:1.0 imagsyncin DATA" *) input [17:0]imagsyncin;
  (* x_interface_info = "xilinx.com:signal:data:1.0 pilotindexin DATA" *) input [10:0]pilotindexin;
  (* x_interface_info = "xilinx.com:signal:data:1.0 pilotpulsein DATA" *) input [0:0]pilotpulsein;
  (* x_interface_info = "xilinx.com:signal:data:1.0 realsyncin DATA" *) input [17:0]realsyncin;
  (* x_interface_info = "xilinx.com:signal:data:1.0 validsyncin DATA" *) input [0:0]validsyncin;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk CLK" *) input clk;
  (* x_interface_info = "xilinx.com:signal:data:1.0 imagout DATA" *) output [17:0]imagout;
  (* x_interface_info = "xilinx.com:signal:data:1.0 offset DATA" *) output [10:0]offset;
  (* x_interface_info = "xilinx.com:signal:data:1.0 realout DATA" *) output [17:0]realout;
  (* x_interface_info = "xilinx.com:signal:data:1.0 startout DATA" *) output [0:0]startout;
  (* x_interface_info = "xilinx.com:signal:data:1.0 validout DATA" *) output [0:0]validout;
  (* x_interface_info = "xilinx.com:signal:data:1.0 pilot_index DATA" *) output [10:0]pilot_index;

  wire clk;
  wire [17:0]imagout;
  wire [17:0]imagsyncin;
  wire [10:0]offset;
  wire [10:0]pilot_index;
  wire [10:0]pilotindexin;
  wire [0:0]pilotpulsein;
  wire [17:0]realout;
  wire [17:0]realsyncin;
  wire [0:0]startout;
  wire [0:0]validout;
  wire [0:0]validsyncin;

  pilotSynch_pilotsync U0
       (.clk(clk),
        .imagout(imagout),
        .imagsyncin(imagsyncin),
        .offset(offset),
        .pilot_index(pilot_index),
        .pilotindexin(pilotindexin),
        .pilotpulsein(pilotpulsein),
        .realout(realout),
        .realsyncin(realsyncin),
        .startout(startout),
        .validout(validout),
        .validsyncin(validsyncin));
endmodule

(* ORIG_REF_NAME = "pilotsync" *) 
module pilotSynch_pilotsync
   (imagsyncin,
    pilotindexin,
    pilotpulsein,
    realsyncin,
    validsyncin,
    clk,
    imagout,
    offset,
    realout,
    startout,
    validout,
    pilot_index);
  input [17:0]imagsyncin;
  input [10:0]pilotindexin;
  input [0:0]pilotpulsein;
  input [17:0]realsyncin;
  input [0:0]validsyncin;
  input clk;
  output [17:0]imagout;
  output [10:0]offset;
  output [17:0]realout;
  output [0:0]startout;
  output [0:0]validout;
  output [10:0]pilot_index;

  wire clk;
  wire [17:0]imagout;
  wire [17:0]imagsyncin;
  wire [10:0]offset;
  wire [10:0]pilot_index;
  wire [10:0]pilotindexin;
  wire [0:0]pilotpulsein;
  wire [17:0]realout;
  wire [17:0]realsyncin;
  wire [0:0]startout;
  wire [0:0]validout;
  wire [0:0]validsyncin;

  pilotSynch_pilotsync_struct pilotsync_struct
       (.clk(clk),
        .imagout(imagout),
        .imagsyncin(imagsyncin),
        .offset(offset),
        .pilot_index(pilot_index),
        .pilotindexin(pilotindexin),
        .pilotpulsein(pilotpulsein),
        .realout(realout),
        .realsyncin(realsyncin),
        .startout(startout),
        .validout(validout),
        .validsyncin(validsyncin));
endmodule

(* CHECK_LICENSE_TYPE = "pilotsync_blk_mem_gen_v8_3_i0,blk_mem_gen_v8_3_4,{}" *) (* ORIG_REF_NAME = "pilotsync_blk_mem_gen_v8_3_i0" *) (* downgradeipidentifiedwarnings = "yes" *) 
(* x_core_info = "blk_mem_gen_v8_3_4,Vivado 2016.3" *) 
module pilotSynch_pilotsync_blk_mem_gen_v8_3_i0
   (clka,
    ena,
    wea,
    addra,
    dina,
    douta,
    clkb,
    enb,
    web,
    addrb,
    dinb,
    doutb);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA EN" *) input ena;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA WE" *) input [0:0]wea;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [10:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [17:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [17:0]douta;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB CLK" *) input clkb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB EN" *) input enb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB WE" *) input [0:0]web;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB ADDR" *) input [10:0]addrb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB DIN" *) input [17:0]dinb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB DOUT" *) output [17:0]doutb;

  wire [10:0]addra;
  wire [10:0]addrb;
  wire clka;
  wire clkb;
  wire [17:0]dina;
  wire [17:0]dinb;
  wire [17:0]douta;
  wire [17:0]doutb;
  wire ena;
  wire enb;
  wire [0:0]wea;
  wire [0:0]web;
  wire NLW_U0_dbiterr_UNCONNECTED;
  wire NLW_U0_rsta_busy_UNCONNECTED;
  wire NLW_U0_rstb_busy_UNCONNECTED;
  wire NLW_U0_s_axi_arready_UNCONNECTED;
  wire NLW_U0_s_axi_awready_UNCONNECTED;
  wire NLW_U0_s_axi_bvalid_UNCONNECTED;
  wire NLW_U0_s_axi_dbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_rlast_UNCONNECTED;
  wire NLW_U0_s_axi_rvalid_UNCONNECTED;
  wire NLW_U0_s_axi_sbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_wready_UNCONNECTED;
  wire NLW_U0_sbiterr_UNCONNECTED;
  wire [10:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [10:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [17:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "11" *) 
  (* C_ADDRB_WIDTH = "11" *) 
  (* C_ALGORITHM = "1" *) 
  (* C_AXI_ID_WIDTH = "4" *) 
  (* C_AXI_SLAVE_TYPE = "0" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_BYTE_SIZE = "9" *) 
  (* C_COMMON_CLK = "1" *) 
  (* C_COUNT_18K_BRAM = "0" *) 
  (* C_COUNT_36K_BRAM = "1" *) 
  (* C_CTRL_ECC_ALGO = "NONE" *) 
  (* C_DEFAULT_DATA = "0" *) 
  (* C_DISABLE_WARN_BHV_COLL = "0" *) 
  (* C_DISABLE_WARN_BHV_RANGE = "0" *) 
  (* C_ELABORATION_DIR = "./" *) 
  (* C_ENABLE_32BIT_ADDRESS = "0" *) 
  (* C_EN_DEEPSLEEP_PIN = "0" *) 
  (* C_EN_ECC_PIPE = "0" *) 
  (* C_EN_RDADDRA_CHG = "0" *) 
  (* C_EN_RDADDRB_CHG = "0" *) 
  (* C_EN_SAFETY_CKT = "0" *) 
  (* C_EN_SHUTDOWN_PIN = "0" *) 
  (* C_EN_SLEEP_PIN = "0" *) 
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     5.4321999999999999 mW" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_ENA = "1" *) 
  (* C_HAS_ENB = "1" *) 
  (* C_HAS_INJECTERR = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_REGCEA = "0" *) 
  (* C_HAS_REGCEB = "0" *) 
  (* C_HAS_RSTA = "0" *) 
  (* C_HAS_RSTB = "0" *) 
  (* C_HAS_SOFTECC_INPUT_REGS_A = "0" *) 
  (* C_HAS_SOFTECC_OUTPUT_REGS_B = "0" *) 
  (* C_INITA_VAL = "0" *) 
  (* C_INITB_VAL = "0" *) 
  (* C_INIT_FILE = "pilotsync_blk_mem_gen_v8_3_i0.mem" *) 
  (* C_INIT_FILE_NAME = "pilotsync_blk_mem_gen_v8_3_i0.mif" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "1" *) 
  (* C_MEM_TYPE = "2" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "2048" *) 
  (* C_READ_DEPTH_B = "2048" *) 
  (* C_READ_WIDTH_A = "18" *) 
  (* C_READ_WIDTH_B = "18" *) 
  (* C_RSTRAM_A = "0" *) 
  (* C_RSTRAM_B = "0" *) 
  (* C_RST_PRIORITY_A = "CE" *) 
  (* C_RST_PRIORITY_B = "CE" *) 
  (* C_SIM_COLLISION_CHECK = "ALL" *) 
  (* C_USE_BRAM_BLOCK = "0" *) 
  (* C_USE_BYTE_WEA = "0" *) 
  (* C_USE_BYTE_WEB = "0" *) 
  (* C_USE_DEFAULT_DATA = "0" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_SOFTECC = "0" *) 
  (* C_USE_URAM = "0" *) 
  (* C_WEA_WIDTH = "1" *) 
  (* C_WEB_WIDTH = "1" *) 
  (* C_WRITE_DEPTH_A = "2048" *) 
  (* C_WRITE_DEPTH_B = "2048" *) 
  (* C_WRITE_MODE_A = "WRITE_FIRST" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "18" *) 
  (* C_WRITE_WIDTH_B = "18" *) 
  (* C_XDEVICEFAMILY = "kintex7" *) 
  (* c_family = "kintex7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  pilotSynch_blk_mem_gen_v8_3_4 U0
       (.addra(addra),
        .addrb(addrb),
        .clka(clka),
        .clkb(clkb),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina(dina),
        .dinb(dinb),
        .douta(douta),
        .doutb(doutb),
        .eccpipece(1'b0),
        .ena(ena),
        .enb(enb),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[10:0]),
        .regcea(1'b0),
        .regceb(1'b0),
        .rsta(1'b0),
        .rsta_busy(NLW_U0_rsta_busy_UNCONNECTED),
        .rstb(1'b0),
        .rstb_busy(NLW_U0_rstb_busy_UNCONNECTED),
        .s_aclk(1'b0),
        .s_aresetn(1'b0),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arburst({1'b0,1'b0}),
        .s_axi_arid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(NLW_U0_s_axi_arready_UNCONNECTED),
        .s_axi_arsize({1'b0,1'b0,1'b0}),
        .s_axi_arvalid(1'b0),
        .s_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awburst({1'b0,1'b0}),
        .s_axi_awid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(NLW_U0_s_axi_awready_UNCONNECTED),
        .s_axi_awsize({1'b0,1'b0,1'b0}),
        .s_axi_awvalid(1'b0),
        .s_axi_bid(NLW_U0_s_axi_bid_UNCONNECTED[3:0]),
        .s_axi_bready(1'b0),
        .s_axi_bresp(NLW_U0_s_axi_bresp_UNCONNECTED[1:0]),
        .s_axi_bvalid(NLW_U0_s_axi_bvalid_UNCONNECTED),
        .s_axi_dbiterr(NLW_U0_s_axi_dbiterr_UNCONNECTED),
        .s_axi_injectdbiterr(1'b0),
        .s_axi_injectsbiterr(1'b0),
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[10:0]),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[17:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb(1'b0),
        .s_axi_wvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .shutdown(1'b0),
        .sleep(1'b0),
        .wea(wea),
        .web(web));
endmodule

(* CHECK_LICENSE_TYPE = "pilotsync_blk_mem_gen_v8_3_i0,blk_mem_gen_v8_3_4,{}" *) (* ORIG_REF_NAME = "pilotsync_blk_mem_gen_v8_3_i0" *) (* downgradeipidentifiedwarnings = "yes" *) 
(* x_core_info = "blk_mem_gen_v8_3_4,Vivado 2016.3" *) 
module pilotSynch_pilotsync_blk_mem_gen_v8_3_i0__xdcDup__1
   (clka,
    ena,
    wea,
    addra,
    dina,
    douta,
    clkb,
    enb,
    web,
    addrb,
    dinb,
    doutb);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA EN" *) input ena;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA WE" *) input [0:0]wea;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [10:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [17:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [17:0]douta;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB CLK" *) input clkb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB EN" *) input enb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB WE" *) input [0:0]web;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB ADDR" *) input [10:0]addrb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB DIN" *) input [17:0]dinb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB DOUT" *) output [17:0]doutb;

  wire [10:0]addra;
  wire [10:0]addrb;
  wire clka;
  wire clkb;
  wire [17:0]dina;
  wire [17:0]dinb;
  wire [17:0]douta;
  wire [17:0]doutb;
  wire ena;
  wire enb;
  wire [0:0]wea;
  wire [0:0]web;
  wire NLW_U0_dbiterr_UNCONNECTED;
  wire NLW_U0_rsta_busy_UNCONNECTED;
  wire NLW_U0_rstb_busy_UNCONNECTED;
  wire NLW_U0_s_axi_arready_UNCONNECTED;
  wire NLW_U0_s_axi_awready_UNCONNECTED;
  wire NLW_U0_s_axi_bvalid_UNCONNECTED;
  wire NLW_U0_s_axi_dbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_rlast_UNCONNECTED;
  wire NLW_U0_s_axi_rvalid_UNCONNECTED;
  wire NLW_U0_s_axi_sbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_wready_UNCONNECTED;
  wire NLW_U0_sbiterr_UNCONNECTED;
  wire [10:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [10:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [17:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "11" *) 
  (* C_ADDRB_WIDTH = "11" *) 
  (* C_ALGORITHM = "1" *) 
  (* C_AXI_ID_WIDTH = "4" *) 
  (* C_AXI_SLAVE_TYPE = "0" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_BYTE_SIZE = "9" *) 
  (* C_COMMON_CLK = "1" *) 
  (* C_COUNT_18K_BRAM = "0" *) 
  (* C_COUNT_36K_BRAM = "1" *) 
  (* C_CTRL_ECC_ALGO = "NONE" *) 
  (* C_DEFAULT_DATA = "0" *) 
  (* C_DISABLE_WARN_BHV_COLL = "0" *) 
  (* C_DISABLE_WARN_BHV_RANGE = "0" *) 
  (* C_ELABORATION_DIR = "./" *) 
  (* C_ENABLE_32BIT_ADDRESS = "0" *) 
  (* C_EN_DEEPSLEEP_PIN = "0" *) 
  (* C_EN_ECC_PIPE = "0" *) 
  (* C_EN_RDADDRA_CHG = "0" *) 
  (* C_EN_RDADDRB_CHG = "0" *) 
  (* C_EN_SAFETY_CKT = "0" *) 
  (* C_EN_SHUTDOWN_PIN = "0" *) 
  (* C_EN_SLEEP_PIN = "0" *) 
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     5.4321999999999999 mW" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_ENA = "1" *) 
  (* C_HAS_ENB = "1" *) 
  (* C_HAS_INJECTERR = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_REGCEA = "0" *) 
  (* C_HAS_REGCEB = "0" *) 
  (* C_HAS_RSTA = "0" *) 
  (* C_HAS_RSTB = "0" *) 
  (* C_HAS_SOFTECC_INPUT_REGS_A = "0" *) 
  (* C_HAS_SOFTECC_OUTPUT_REGS_B = "0" *) 
  (* C_INITA_VAL = "0" *) 
  (* C_INITB_VAL = "0" *) 
  (* C_INIT_FILE = "pilotsync_blk_mem_gen_v8_3_i0.mem" *) 
  (* C_INIT_FILE_NAME = "pilotsync_blk_mem_gen_v8_3_i0.mif" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "1" *) 
  (* C_MEM_TYPE = "2" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "2048" *) 
  (* C_READ_DEPTH_B = "2048" *) 
  (* C_READ_WIDTH_A = "18" *) 
  (* C_READ_WIDTH_B = "18" *) 
  (* C_RSTRAM_A = "0" *) 
  (* C_RSTRAM_B = "0" *) 
  (* C_RST_PRIORITY_A = "CE" *) 
  (* C_RST_PRIORITY_B = "CE" *) 
  (* C_SIM_COLLISION_CHECK = "ALL" *) 
  (* C_USE_BRAM_BLOCK = "0" *) 
  (* C_USE_BYTE_WEA = "0" *) 
  (* C_USE_BYTE_WEB = "0" *) 
  (* C_USE_DEFAULT_DATA = "0" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_SOFTECC = "0" *) 
  (* C_USE_URAM = "0" *) 
  (* C_WEA_WIDTH = "1" *) 
  (* C_WEB_WIDTH = "1" *) 
  (* C_WRITE_DEPTH_A = "2048" *) 
  (* C_WRITE_DEPTH_B = "2048" *) 
  (* C_WRITE_MODE_A = "WRITE_FIRST" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "18" *) 
  (* C_WRITE_WIDTH_B = "18" *) 
  (* C_XDEVICEFAMILY = "kintex7" *) 
  (* c_family = "kintex7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  pilotSynch_blk_mem_gen_v8_3_4__2 U0
       (.addra(addra),
        .addrb(addrb),
        .clka(clka),
        .clkb(clkb),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina(dina),
        .dinb(dinb),
        .douta(douta),
        .doutb(doutb),
        .eccpipece(1'b0),
        .ena(ena),
        .enb(enb),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[10:0]),
        .regcea(1'b0),
        .regceb(1'b0),
        .rsta(1'b0),
        .rsta_busy(NLW_U0_rsta_busy_UNCONNECTED),
        .rstb(1'b0),
        .rstb_busy(NLW_U0_rstb_busy_UNCONNECTED),
        .s_aclk(1'b0),
        .s_aresetn(1'b0),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arburst({1'b0,1'b0}),
        .s_axi_arid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(NLW_U0_s_axi_arready_UNCONNECTED),
        .s_axi_arsize({1'b0,1'b0,1'b0}),
        .s_axi_arvalid(1'b0),
        .s_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awburst({1'b0,1'b0}),
        .s_axi_awid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(NLW_U0_s_axi_awready_UNCONNECTED),
        .s_axi_awsize({1'b0,1'b0,1'b0}),
        .s_axi_awvalid(1'b0),
        .s_axi_bid(NLW_U0_s_axi_bid_UNCONNECTED[3:0]),
        .s_axi_bready(1'b0),
        .s_axi_bresp(NLW_U0_s_axi_bresp_UNCONNECTED[1:0]),
        .s_axi_bvalid(NLW_U0_s_axi_bvalid_UNCONNECTED),
        .s_axi_dbiterr(NLW_U0_s_axi_dbiterr_UNCONNECTED),
        .s_axi_injectdbiterr(1'b0),
        .s_axi_injectsbiterr(1'b0),
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[10:0]),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[17:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb(1'b0),
        .s_axi_wvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .shutdown(1'b0),
        .sleep(1'b0),
        .wea(wea),
        .web(web));
endmodule

(* CHECK_LICENSE_TYPE = "pilotsync_c_addsub_v12_0_i0,c_addsub_v12_0_10,{}" *) (* ORIG_REF_NAME = "pilotsync_c_addsub_v12_0_i0" *) (* downgradeipidentifiedwarnings = "yes" *) 
(* x_core_info = "c_addsub_v12_0_10,Vivado 2016.3" *) 
module pilotSynch_pilotsync_c_addsub_v12_0_i0
   (A,
    B,
    S);
  (* x_interface_info = "xilinx.com:signal:data:1.0 a_intf DATA" *) input [11:0]A;
  (* x_interface_info = "xilinx.com:signal:data:1.0 b_intf DATA" *) input [11:0]B;
  (* x_interface_info = "xilinx.com:signal:data:1.0 s_intf DATA" *) output [11:0]S;

  wire [11:0]A;
  wire [11:0]B;
  wire [11:0]S;
  wire NLW_U0_C_OUT_UNCONNECTED;

  (* C_BORROW_LOW = "1" *) 
  (* C_CE_OVERRIDES_BYPASS = "1" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_IMPLEMENTATION = "0" *) 
  (* C_SCLR_OVERRIDES_SSET = "1" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "kintex7" *) 
  (* c_a_type = "0" *) 
  (* c_a_width = "12" *) 
  (* c_add_mode = "1" *) 
  (* c_ainit_val = "0" *) 
  (* c_b_constant = "0" *) 
  (* c_b_type = "0" *) 
  (* c_b_value = "000000000000" *) 
  (* c_b_width = "12" *) 
  (* c_bypass_low = "0" *) 
  (* c_has_bypass = "0" *) 
  (* c_has_c_in = "0" *) 
  (* c_has_c_out = "0" *) 
  (* c_has_ce = "0" *) 
  (* c_has_sclr = "0" *) 
  (* c_has_sinit = "0" *) 
  (* c_has_sset = "0" *) 
  (* c_latency = "0" *) 
  (* c_out_width = "12" *) 
  (* c_sinit_val = "0" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  pilotSynch_c_addsub_v12_0_10 U0
       (.A(A),
        .ADD(1'b1),
        .B(B),
        .BYPASS(1'b0),
        .CE(1'b1),
        .CLK(1'b0),
        .C_IN(1'b0),
        .C_OUT(NLW_U0_C_OUT_UNCONNECTED),
        .S(S),
        .SCLR(1'b0),
        .SINIT(1'b0),
        .SSET(1'b0));
endmodule

(* CHECK_LICENSE_TYPE = "pilotsync_c_addsub_v12_0_i1,c_addsub_v12_0_10,{}" *) (* ORIG_REF_NAME = "pilotsync_c_addsub_v12_0_i1" *) (* downgradeipidentifiedwarnings = "yes" *) 
(* x_core_info = "c_addsub_v12_0_10,Vivado 2016.3" *) 
module pilotSynch_pilotsync_c_addsub_v12_0_i1
   (A,
    B,
    S);
  (* x_interface_info = "xilinx.com:signal:data:1.0 a_intf DATA" *) input [12:0]A;
  (* x_interface_info = "xilinx.com:signal:data:1.0 b_intf DATA" *) input [12:0]B;
  (* x_interface_info = "xilinx.com:signal:data:1.0 s_intf DATA" *) output [12:0]S;

  wire [12:0]A;
  wire [12:0]B;
  wire [12:0]S;
  wire NLW_U0_C_OUT_UNCONNECTED;

  (* C_BORROW_LOW = "1" *) 
  (* C_CE_OVERRIDES_BYPASS = "1" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_IMPLEMENTATION = "0" *) 
  (* C_SCLR_OVERRIDES_SSET = "1" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "kintex7" *) 
  (* c_a_type = "0" *) 
  (* c_a_width = "13" *) 
  (* c_add_mode = "1" *) 
  (* c_ainit_val = "0" *) 
  (* c_b_constant = "0" *) 
  (* c_b_type = "0" *) 
  (* c_b_value = "0000000000000" *) 
  (* c_b_width = "13" *) 
  (* c_bypass_low = "0" *) 
  (* c_has_bypass = "0" *) 
  (* c_has_c_in = "0" *) 
  (* c_has_c_out = "0" *) 
  (* c_has_ce = "0" *) 
  (* c_has_sclr = "0" *) 
  (* c_has_sinit = "0" *) 
  (* c_has_sset = "0" *) 
  (* c_latency = "0" *) 
  (* c_out_width = "13" *) 
  (* c_sinit_val = "0" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  pilotSynch_c_addsub_v12_0_10__parameterized1 U0
       (.A(A),
        .ADD(1'b1),
        .B(B),
        .BYPASS(1'b0),
        .CE(1'b1),
        .CLK(1'b0),
        .C_IN(1'b0),
        .C_OUT(NLW_U0_C_OUT_UNCONNECTED),
        .S(S),
        .SCLR(1'b0),
        .SINIT(1'b0),
        .SSET(1'b0));
endmodule

(* CHECK_LICENSE_TYPE = "pilotsync_c_counter_binary_v12_0_i0,c_counter_binary_v12_0_10,{}" *) (* ORIG_REF_NAME = "pilotsync_c_counter_binary_v12_0_i0" *) (* downgradeipidentifiedwarnings = "yes" *) 
(* x_core_info = "c_counter_binary_v12_0_10,Vivado 2016.3" *) 
module pilotSynch_pilotsync_c_counter_binary_v12_0_i0
   (CLK,
    CE,
    SINIT,
    Q);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) input CLK;
  (* x_interface_info = "xilinx.com:signal:clockenable:1.0 ce_intf CE" *) input CE;
  (* x_interface_info = "xilinx.com:signal:data:1.0 sinit_intf DATA" *) input SINIT;
  (* x_interface_info = "xilinx.com:signal:data:1.0 q_intf DATA" *) output [10:0]Q;

  wire CE;
  wire CLK;
  wire [10:0]Q;
  wire SINIT;
  wire NLW_U0_THRESH0_UNCONNECTED;

  (* C_CE_OVERRIDES_SYNC = "0" *) 
  (* C_FB_LATENCY = "0" *) 
  (* C_IMPLEMENTATION = "0" *) 
  (* C_SCLR_OVERRIDES_SSET = "1" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "kintex7" *) 
  (* c_ainit_val = "0" *) 
  (* c_count_by = "1" *) 
  (* c_count_mode = "0" *) 
  (* c_count_to = "1" *) 
  (* c_has_ce = "1" *) 
  (* c_has_load = "0" *) 
  (* c_has_sclr = "0" *) 
  (* c_has_sinit = "1" *) 
  (* c_has_sset = "0" *) 
  (* c_has_thresh0 = "0" *) 
  (* c_latency = "1" *) 
  (* c_load_low = "0" *) 
  (* c_restrict_count = "0" *) 
  (* c_sinit_val = "0" *) 
  (* c_thresh0_value = "1" *) 
  (* c_width = "11" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  pilotSynch_c_counter_binary_v12_0_10 U0
       (.CE(CE),
        .CLK(CLK),
        .L({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .LOAD(1'b0),
        .Q(Q),
        .SCLR(1'b0),
        .SINIT(SINIT),
        .SSET(1'b0),
        .THRESH0(NLW_U0_THRESH0_UNCONNECTED),
        .UP(1'b1));
endmodule

(* ORIG_REF_NAME = "pilotsync_struct" *) 
module pilotSynch_pilotsync_struct
   (offset,
    pilot_index,
    validout,
    startout,
    realout,
    imagout,
    clk,
    validsyncin,
    pilotpulsein,
    pilotindexin,
    realsyncin,
    imagsyncin);
  output [10:0]offset;
  output [10:0]pilot_index;
  output [0:0]validout;
  output [0:0]startout;
  output [17:0]realout;
  output [17:0]imagout;
  input clk;
  input [0:0]validsyncin;
  input [0:0]pilotpulsein;
  input [10:0]pilotindexin;
  input [17:0]realsyncin;
  input [17:0]imagsyncin;

  wire [10:0]addsub_s_net;
  wire clk;
  wire [10:0]counter1_op_net;
  wire [17:0]imagout;
  wire [17:0]imagsyncin;
  wire [10:0]offset;
  wire [10:0]pilot_index;
  wire [10:0]pilotindexin;
  wire [0:0]pilotpulsein;
  wire [17:0]realout;
  wire [17:0]realsyncin;
  wire [0:0]startout;
  wire [0:0]validout;
  wire [0:0]validsyncin;

  pilotSynch_pilotsync_xladdsub addsub
       (.Q(counter1_op_net),
        .S(addsub_s_net),
        .offset(offset));
  pilotSynch_pilotsync_xladdsub__parameterized0 addsub1
       (.offset(offset),
        .pilot_index(pilot_index));
  pilotSynch_pilotsync_xlcounter_limit counter1
       (.Q(counter1_op_net),
        .clk(clk),
        .validsyncin(validsyncin));
  pilotSynch_pilotsync_xldelay delay1
       (.clk(clk),
        .validout(validout),
        .validsyncin(validsyncin));
  pilotSynch_pilotsync_xldelay_0 delay2
       (.clk(clk),
        .pilotpulsein(pilotpulsein),
        .startout(startout));
  pilotSynch_pilotsync_xldelay__parameterized0 delay7
       (.clk(clk),
        .pilot_index(pilot_index),
        .pilotindexin(pilotindexin),
        .pilotpulsein(pilotpulsein));
  pilotSynch_pilotsync_xldpram__xdcDup__1 dual_port_ram1
       (.Q(counter1_op_net),
        .S(addsub_s_net),
        .clk(clk),
        .realout(realout),
        .realsyncin(realsyncin),
        .validsyncin(validsyncin));
  pilotSynch_pilotsync_xldpram dual_port_ram2
       (.Q(counter1_op_net),
        .S(addsub_s_net),
        .clk(clk),
        .imagout(imagout),
        .imagsyncin(imagsyncin),
        .validsyncin(validsyncin));
endmodule

(* ORIG_REF_NAME = "pilotsync_xladdsub" *) 
module pilotSynch_pilotsync_xladdsub
   (S,
    Q,
    offset);
  output [10:0]S;
  input [10:0]Q;
  input [10:0]offset;

  wire [10:0]Q;
  wire [10:0]S;
  wire [10:0]offset;
  wire [11:11]\NLW_comp0.core_instance0_S_UNCONNECTED ;

  (* CHECK_LICENSE_TYPE = "pilotsync_c_addsub_v12_0_i0,c_addsub_v12_0_10,{}" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* x_core_info = "c_addsub_v12_0_10,Vivado 2016.3" *) 
  pilotSynch_pilotsync_c_addsub_v12_0_i0 \comp0.core_instance0 
       (.A({1'b0,Q}),
        .B({1'b0,offset}),
        .S({\NLW_comp0.core_instance0_S_UNCONNECTED [11],S}));
endmodule

(* ORIG_REF_NAME = "pilotsync_xladdsub" *) 
module pilotSynch_pilotsync_xladdsub__parameterized0
   (offset,
    pilot_index);
  output [10:0]offset;
  input [10:0]pilot_index;

  wire [10:0]offset;
  wire [10:0]pilot_index;
  wire [12:11]\NLW_comp1.core_instance1_S_UNCONNECTED ;

  (* CHECK_LICENSE_TYPE = "pilotsync_c_addsub_v12_0_i1,c_addsub_v12_0_10,{}" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* x_core_info = "c_addsub_v12_0_10,Vivado 2016.3" *) 
  pilotSynch_pilotsync_c_addsub_v12_0_i1 \comp1.core_instance1 
       (.A({1'b0,1'b0,1'b1,1'b0,1'b1,1'b0,1'b0,1'b1,1'b1,1'b0,1'b0,1'b1,1'b0}),
        .B({pilot_index[10],pilot_index[10],pilot_index}),
        .S({\NLW_comp1.core_instance1_S_UNCONNECTED [12:11],offset}));
endmodule

(* ORIG_REF_NAME = "pilotsync_xlcounter_limit" *) 
module pilotSynch_pilotsync_xlcounter_limit
   (Q,
    clk,
    validsyncin);
  output [10:0]Q;
  input clk;
  input [0:0]validsyncin;

  wire [10:0]Q;
  wire clk;
  wire [0:0]validsyncin;

  (* CHECK_LICENSE_TYPE = "pilotsync_c_counter_binary_v12_0_i0,c_counter_binary_v12_0_10,{}" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* x_core_info = "c_counter_binary_v12_0_10,Vivado 2016.3" *) 
  pilotSynch_pilotsync_c_counter_binary_v12_0_i0 \comp0.core_instance0 
       (.CE(validsyncin),
        .CLK(clk),
        .Q(Q),
        .SINIT(1'b0));
endmodule

(* ORIG_REF_NAME = "pilotsync_xldelay" *) 
module pilotSynch_pilotsync_xldelay
   (validout,
    validsyncin,
    clk);
  output [0:0]validout;
  input [0:0]validsyncin;
  input clk;

  wire clk;
  wire [0:0]validout;
  wire [0:0]validsyncin;

  pilotSynch_synth_reg_6 \srl_delay.synth_reg_srl_inst 
       (.clk(clk),
        .validout(validout),
        .validsyncin(validsyncin));
endmodule

(* ORIG_REF_NAME = "pilotsync_xldelay" *) 
module pilotSynch_pilotsync_xldelay_0
   (startout,
    pilotpulsein,
    clk);
  output [0:0]startout;
  input [0:0]pilotpulsein;
  input clk;

  wire clk;
  wire [0:0]pilotpulsein;
  wire [0:0]startout;

  pilotSynch_synth_reg \srl_delay.synth_reg_srl_inst 
       (.clk(clk),
        .pilotpulsein(pilotpulsein),
        .startout(startout));
endmodule

(* ORIG_REF_NAME = "pilotsync_xldelay" *) 
module pilotSynch_pilotsync_xldelay__parameterized0
   (pilot_index,
    pilotpulsein,
    pilotindexin,
    clk);
  output [10:0]pilot_index;
  input [0:0]pilotpulsein;
  input [10:0]pilotindexin;
  input clk;

  wire clk;
  wire [10:0]pilot_index;
  wire [10:0]pilotindexin;
  wire [0:0]pilotpulsein;

  pilotSynch_synth_reg__parameterized1 \srl_delay.synth_reg_srl_inst 
       (.clk(clk),
        .pilot_index(pilot_index),
        .pilotindexin(pilotindexin),
        .pilotpulsein(pilotpulsein));
endmodule

(* ORIG_REF_NAME = "pilotsync_xldpram" *) 
module pilotSynch_pilotsync_xldpram
   (imagout,
    clk,
    validsyncin,
    Q,
    imagsyncin,
    S);
  output [17:0]imagout;
  input clk;
  input [0:0]validsyncin;
  input [10:0]Q;
  input [17:0]imagsyncin;
  input [10:0]S;

  wire [10:0]Q;
  wire [10:0]S;
  wire clk;
  wire \comp0.core_instance0_n_0 ;
  wire \comp0.core_instance0_n_1 ;
  wire \comp0.core_instance0_n_10 ;
  wire \comp0.core_instance0_n_11 ;
  wire \comp0.core_instance0_n_12 ;
  wire \comp0.core_instance0_n_13 ;
  wire \comp0.core_instance0_n_14 ;
  wire \comp0.core_instance0_n_15 ;
  wire \comp0.core_instance0_n_16 ;
  wire \comp0.core_instance0_n_17 ;
  wire \comp0.core_instance0_n_2 ;
  wire \comp0.core_instance0_n_3 ;
  wire \comp0.core_instance0_n_4 ;
  wire \comp0.core_instance0_n_5 ;
  wire \comp0.core_instance0_n_6 ;
  wire \comp0.core_instance0_n_7 ;
  wire \comp0.core_instance0_n_8 ;
  wire \comp0.core_instance0_n_9 ;
  wire [17:0]imagout;
  wire [17:0]imagsyncin;
  wire [0:0]validsyncin;

  (* CHECK_LICENSE_TYPE = "pilotsync_blk_mem_gen_v8_3_i0,blk_mem_gen_v8_3_4,{}" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* x_core_info = "blk_mem_gen_v8_3_4,Vivado 2016.3" *) 
  pilotSynch_pilotsync_blk_mem_gen_v8_3_i0 \comp0.core_instance0 
       (.addra(Q),
        .addrb(S),
        .clka(clk),
        .clkb(clk),
        .dina(imagsyncin),
        .dinb(imagsyncin),
        .douta({\comp0.core_instance0_n_0 ,\comp0.core_instance0_n_1 ,\comp0.core_instance0_n_2 ,\comp0.core_instance0_n_3 ,\comp0.core_instance0_n_4 ,\comp0.core_instance0_n_5 ,\comp0.core_instance0_n_6 ,\comp0.core_instance0_n_7 ,\comp0.core_instance0_n_8 ,\comp0.core_instance0_n_9 ,\comp0.core_instance0_n_10 ,\comp0.core_instance0_n_11 ,\comp0.core_instance0_n_12 ,\comp0.core_instance0_n_13 ,\comp0.core_instance0_n_14 ,\comp0.core_instance0_n_15 ,\comp0.core_instance0_n_16 ,\comp0.core_instance0_n_17 }),
        .doutb(imagout),
        .ena(1'b1),
        .enb(1'b1),
        .wea(validsyncin),
        .web(1'b0));
endmodule

(* ORIG_REF_NAME = "pilotsync_xldpram" *) 
module pilotSynch_pilotsync_xldpram__xdcDup__1
   (realout,
    clk,
    validsyncin,
    Q,
    realsyncin,
    S);
  output [17:0]realout;
  input clk;
  input [0:0]validsyncin;
  input [10:0]Q;
  input [17:0]realsyncin;
  input [10:0]S;

  wire [10:0]Q;
  wire [10:0]S;
  wire clk;
  wire \comp0.core_instance0_n_0 ;
  wire \comp0.core_instance0_n_1 ;
  wire \comp0.core_instance0_n_10 ;
  wire \comp0.core_instance0_n_11 ;
  wire \comp0.core_instance0_n_12 ;
  wire \comp0.core_instance0_n_13 ;
  wire \comp0.core_instance0_n_14 ;
  wire \comp0.core_instance0_n_15 ;
  wire \comp0.core_instance0_n_16 ;
  wire \comp0.core_instance0_n_17 ;
  wire \comp0.core_instance0_n_2 ;
  wire \comp0.core_instance0_n_3 ;
  wire \comp0.core_instance0_n_4 ;
  wire \comp0.core_instance0_n_5 ;
  wire \comp0.core_instance0_n_6 ;
  wire \comp0.core_instance0_n_7 ;
  wire \comp0.core_instance0_n_8 ;
  wire \comp0.core_instance0_n_9 ;
  wire [17:0]realout;
  wire [17:0]realsyncin;
  wire [0:0]validsyncin;

  (* CHECK_LICENSE_TYPE = "pilotsync_blk_mem_gen_v8_3_i0,blk_mem_gen_v8_3_4,{}" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* x_core_info = "blk_mem_gen_v8_3_4,Vivado 2016.3" *) 
  pilotSynch_pilotsync_blk_mem_gen_v8_3_i0__xdcDup__1 \comp0.core_instance0 
       (.addra(Q),
        .addrb(S),
        .clka(clk),
        .clkb(clk),
        .dina(realsyncin),
        .dinb(realsyncin),
        .douta({\comp0.core_instance0_n_0 ,\comp0.core_instance0_n_1 ,\comp0.core_instance0_n_2 ,\comp0.core_instance0_n_3 ,\comp0.core_instance0_n_4 ,\comp0.core_instance0_n_5 ,\comp0.core_instance0_n_6 ,\comp0.core_instance0_n_7 ,\comp0.core_instance0_n_8 ,\comp0.core_instance0_n_9 ,\comp0.core_instance0_n_10 ,\comp0.core_instance0_n_11 ,\comp0.core_instance0_n_12 ,\comp0.core_instance0_n_13 ,\comp0.core_instance0_n_14 ,\comp0.core_instance0_n_15 ,\comp0.core_instance0_n_16 ,\comp0.core_instance0_n_17 }),
        .doutb(realout),
        .ena(1'b1),
        .enb(1'b1),
        .wea(validsyncin),
        .web(1'b0));
endmodule

(* ORIG_REF_NAME = "srlc33e" *) 
module pilotSynch_srlc33e
   (startout,
    pilotpulsein,
    clk);
  output [0:0]startout;
  input [0:0]pilotpulsein;
  input clk;

  wire clk;
  wire [0:0]pilotpulsein;
  wire [0:0]startout;

  (* XILINX_LEGACY_PRIM = "FDE" *) 
  (* fpga_dont_touch = "true" *) 
  (* syn_black_box = "TRUE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \reg_array[0].fde_used.u2 
       (.C(clk),
        .CE(1'b1),
        .D(pilotpulsein),
        .Q(startout),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "srlc33e" *) 
module pilotSynch_srlc33e_7
   (validout,
    validsyncin,
    clk);
  output [0:0]validout;
  input [0:0]validsyncin;
  input clk;

  wire clk;
  wire [0:0]validout;
  wire [0:0]validsyncin;

  (* XILINX_LEGACY_PRIM = "FDE" *) 
  (* fpga_dont_touch = "true" *) 
  (* syn_black_box = "TRUE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \reg_array[0].fde_used.u2 
       (.C(clk),
        .CE(1'b1),
        .D(validsyncin),
        .Q(validout),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "srlc33e" *) 
module pilotSynch_srlc33e__parameterized1
   (pilot_index,
    pilotpulsein,
    pilotindexin,
    clk);
  output [10:0]pilot_index;
  input [0:0]pilotpulsein;
  input [10:0]pilotindexin;
  input clk;

  wire clk;
  wire [10:0]pilot_index;
  wire [10:0]pilotindexin;
  wire [0:0]pilotpulsein;

  (* XILINX_LEGACY_PRIM = "FDE" *) 
  (* fpga_dont_touch = "true" *) 
  (* syn_black_box = "TRUE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \reg_array[0].fde_used.u2 
       (.C(clk),
        .CE(pilotpulsein),
        .D(pilotindexin[0]),
        .Q(pilot_index[0]),
        .R(1'b0));
  (* XILINX_LEGACY_PRIM = "FDE" *) 
  (* fpga_dont_touch = "true" *) 
  (* syn_black_box = "TRUE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \reg_array[10].fde_used.u2 
       (.C(clk),
        .CE(pilotpulsein),
        .D(pilotindexin[10]),
        .Q(pilot_index[10]),
        .R(1'b0));
  (* XILINX_LEGACY_PRIM = "FDE" *) 
  (* fpga_dont_touch = "true" *) 
  (* syn_black_box = "TRUE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \reg_array[1].fde_used.u2 
       (.C(clk),
        .CE(pilotpulsein),
        .D(pilotindexin[1]),
        .Q(pilot_index[1]),
        .R(1'b0));
  (* XILINX_LEGACY_PRIM = "FDE" *) 
  (* fpga_dont_touch = "true" *) 
  (* syn_black_box = "TRUE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \reg_array[2].fde_used.u2 
       (.C(clk),
        .CE(pilotpulsein),
        .D(pilotindexin[2]),
        .Q(pilot_index[2]),
        .R(1'b0));
  (* XILINX_LEGACY_PRIM = "FDE" *) 
  (* fpga_dont_touch = "true" *) 
  (* syn_black_box = "TRUE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \reg_array[3].fde_used.u2 
       (.C(clk),
        .CE(pilotpulsein),
        .D(pilotindexin[3]),
        .Q(pilot_index[3]),
        .R(1'b0));
  (* XILINX_LEGACY_PRIM = "FDE" *) 
  (* fpga_dont_touch = "true" *) 
  (* syn_black_box = "TRUE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \reg_array[4].fde_used.u2 
       (.C(clk),
        .CE(pilotpulsein),
        .D(pilotindexin[4]),
        .Q(pilot_index[4]),
        .R(1'b0));
  (* XILINX_LEGACY_PRIM = "FDE" *) 
  (* fpga_dont_touch = "true" *) 
  (* syn_black_box = "TRUE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \reg_array[5].fde_used.u2 
       (.C(clk),
        .CE(pilotpulsein),
        .D(pilotindexin[5]),
        .Q(pilot_index[5]),
        .R(1'b0));
  (* XILINX_LEGACY_PRIM = "FDE" *) 
  (* fpga_dont_touch = "true" *) 
  (* syn_black_box = "TRUE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \reg_array[6].fde_used.u2 
       (.C(clk),
        .CE(pilotpulsein),
        .D(pilotindexin[6]),
        .Q(pilot_index[6]),
        .R(1'b0));
  (* XILINX_LEGACY_PRIM = "FDE" *) 
  (* fpga_dont_touch = "true" *) 
  (* syn_black_box = "TRUE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \reg_array[7].fde_used.u2 
       (.C(clk),
        .CE(pilotpulsein),
        .D(pilotindexin[7]),
        .Q(pilot_index[7]),
        .R(1'b0));
  (* XILINX_LEGACY_PRIM = "FDE" *) 
  (* fpga_dont_touch = "true" *) 
  (* syn_black_box = "TRUE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \reg_array[8].fde_used.u2 
       (.C(clk),
        .CE(pilotpulsein),
        .D(pilotindexin[8]),
        .Q(pilot_index[8]),
        .R(1'b0));
  (* XILINX_LEGACY_PRIM = "FDE" *) 
  (* fpga_dont_touch = "true" *) 
  (* syn_black_box = "TRUE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \reg_array[9].fde_used.u2 
       (.C(clk),
        .CE(pilotpulsein),
        .D(pilotindexin[9]),
        .Q(pilot_index[9]),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "synth_reg" *) 
module pilotSynch_synth_reg
   (startout,
    pilotpulsein,
    clk);
  output [0:0]startout;
  input [0:0]pilotpulsein;
  input clk;

  wire clk;
  wire [0:0]pilotpulsein;
  wire [0:0]startout;

  pilotSynch_srlc33e \partial_one.last_srlc33e 
       (.clk(clk),
        .pilotpulsein(pilotpulsein),
        .startout(startout));
endmodule

(* ORIG_REF_NAME = "synth_reg" *) 
module pilotSynch_synth_reg_6
   (validout,
    validsyncin,
    clk);
  output [0:0]validout;
  input [0:0]validsyncin;
  input clk;

  wire clk;
  wire [0:0]validout;
  wire [0:0]validsyncin;

  pilotSynch_srlc33e_7 \partial_one.last_srlc33e 
       (.clk(clk),
        .validout(validout),
        .validsyncin(validsyncin));
endmodule

(* ORIG_REF_NAME = "synth_reg" *) 
module pilotSynch_synth_reg__parameterized1
   (pilot_index,
    pilotpulsein,
    pilotindexin,
    clk);
  output [10:0]pilot_index;
  input [0:0]pilotpulsein;
  input [10:0]pilotindexin;
  input clk;

  wire clk;
  wire [10:0]pilot_index;
  wire [10:0]pilotindexin;
  wire [0:0]pilotpulsein;

  pilotSynch_srlc33e__parameterized1 \partial_one.last_srlc33e 
       (.clk(clk),
        .pilot_index(pilot_index),
        .pilotindexin(pilotindexin),
        .pilotpulsein(pilotpulsein));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_generic_cstr" *) 
module pilotSynch_blk_mem_gen_generic_cstr
   (douta,
    doutb,
    clka,
    clkb,
    ena,
    enb,
    addra,
    addrb,
    dina,
    dinb,
    wea,
    web);
  output [17:0]douta;
  output [17:0]doutb;
  input clka;
  input clkb;
  input ena;
  input enb;
  input [10:0]addra;
  input [10:0]addrb;
  input [17:0]dina;
  input [17:0]dinb;
  input [0:0]wea;
  input [0:0]web;

  wire [10:0]addra;
  wire [10:0]addrb;
  wire clka;
  wire clkb;
  wire [17:0]dina;
  wire [17:0]dinb;
  wire [17:0]douta;
  wire [17:0]doutb;
  wire ena;
  wire enb;
  wire [0:0]wea;
  wire [0:0]web;

  pilotSynch_blk_mem_gen_prim_width \ramloop[0].ram.r 
       (.addra(addra),
        .addrb(addrb),
        .clka(clka),
        .clkb(clkb),
        .dina(dina),
        .dinb(dinb),
        .douta(douta),
        .doutb(doutb),
        .ena(ena),
        .enb(enb),
        .wea(wea),
        .web(web));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_generic_cstr" *) 
module pilotSynch_blk_mem_gen_generic_cstr_3
   (douta,
    doutb,
    clka,
    clkb,
    ena,
    enb,
    addra,
    addrb,
    dina,
    dinb,
    wea,
    web);
  output [17:0]douta;
  output [17:0]doutb;
  input clka;
  input clkb;
  input ena;
  input enb;
  input [10:0]addra;
  input [10:0]addrb;
  input [17:0]dina;
  input [17:0]dinb;
  input [0:0]wea;
  input [0:0]web;

  wire [10:0]addra;
  wire [10:0]addrb;
  wire clka;
  wire clkb;
  wire [17:0]dina;
  wire [17:0]dinb;
  wire [17:0]douta;
  wire [17:0]doutb;
  wire ena;
  wire enb;
  wire [0:0]wea;
  wire [0:0]web;

  pilotSynch_blk_mem_gen_prim_width_4 \ramloop[0].ram.r 
       (.addra(addra),
        .addrb(addrb),
        .clka(clka),
        .clkb(clkb),
        .dina(dina),
        .dinb(dinb),
        .douta(douta),
        .doutb(doutb),
        .ena(ena),
        .enb(enb),
        .wea(wea),
        .web(web));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_width" *) 
module pilotSynch_blk_mem_gen_prim_width
   (douta,
    doutb,
    clka,
    clkb,
    ena,
    enb,
    addra,
    addrb,
    dina,
    dinb,
    wea,
    web);
  output [17:0]douta;
  output [17:0]doutb;
  input clka;
  input clkb;
  input ena;
  input enb;
  input [10:0]addra;
  input [10:0]addrb;
  input [17:0]dina;
  input [17:0]dinb;
  input [0:0]wea;
  input [0:0]web;

  wire [10:0]addra;
  wire [10:0]addrb;
  wire clka;
  wire clkb;
  wire [17:0]dina;
  wire [17:0]dinb;
  wire [17:0]douta;
  wire [17:0]doutb;
  wire ena;
  wire enb;
  wire [0:0]wea;
  wire [0:0]web;

  pilotSynch_blk_mem_gen_prim_wrapper_init \prim_init.ram 
       (.addra(addra),
        .addrb(addrb),
        .clka(clka),
        .clkb(clkb),
        .dina(dina),
        .dinb(dinb),
        .douta(douta),
        .doutb(doutb),
        .ena(ena),
        .enb(enb),
        .wea(wea),
        .web(web));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_width" *) 
module pilotSynch_blk_mem_gen_prim_width_4
   (douta,
    doutb,
    clka,
    clkb,
    ena,
    enb,
    addra,
    addrb,
    dina,
    dinb,
    wea,
    web);
  output [17:0]douta;
  output [17:0]doutb;
  input clka;
  input clkb;
  input ena;
  input enb;
  input [10:0]addra;
  input [10:0]addrb;
  input [17:0]dina;
  input [17:0]dinb;
  input [0:0]wea;
  input [0:0]web;

  wire [10:0]addra;
  wire [10:0]addrb;
  wire clka;
  wire clkb;
  wire [17:0]dina;
  wire [17:0]dinb;
  wire [17:0]douta;
  wire [17:0]doutb;
  wire ena;
  wire enb;
  wire [0:0]wea;
  wire [0:0]web;

  pilotSynch_blk_mem_gen_prim_wrapper_init_5 \prim_init.ram 
       (.addra(addra),
        .addrb(addrb),
        .clka(clka),
        .clkb(clkb),
        .dina(dina),
        .dinb(dinb),
        .douta(douta),
        .doutb(doutb),
        .ena(ena),
        .enb(enb),
        .wea(wea),
        .web(web));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_wrapper_init" *) 
module pilotSynch_blk_mem_gen_prim_wrapper_init
   (douta,
    doutb,
    clka,
    clkb,
    ena,
    enb,
    addra,
    addrb,
    dina,
    dinb,
    wea,
    web);
  output [17:0]douta;
  output [17:0]doutb;
  input clka;
  input clkb;
  input ena;
  input enb;
  input [10:0]addra;
  input [10:0]addrb;
  input [17:0]dina;
  input [17:0]dinb;
  input [0:0]wea;
  input [0:0]web;

  wire [10:0]addra;
  wire [10:0]addrb;
  wire clka;
  wire clkb;
  wire [17:0]dina;
  wire [17:0]dinb;
  wire [17:0]douta;
  wire [17:0]doutb;
  wire ena;
  wire enb;
  wire [0:0]wea;
  wire [0:0]web;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.TRUE_DP.SIMPLE_PRIM36.ram_CASCADEOUTA_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.TRUE_DP.SIMPLE_PRIM36.ram_CASCADEOUTB_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.TRUE_DP.SIMPLE_PRIM36.ram_DBITERR_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.TRUE_DP.SIMPLE_PRIM36.ram_SBITERR_UNCONNECTED ;
  wire [31:16]\NLW_DEVICE_7SERIES.NO_BMM_INFO.TRUE_DP.SIMPLE_PRIM36.ram_DOADO_UNCONNECTED ;
  wire [31:16]\NLW_DEVICE_7SERIES.NO_BMM_INFO.TRUE_DP.SIMPLE_PRIM36.ram_DOBDO_UNCONNECTED ;
  wire [3:2]\NLW_DEVICE_7SERIES.NO_BMM_INFO.TRUE_DP.SIMPLE_PRIM36.ram_DOPADOP_UNCONNECTED ;
  wire [3:2]\NLW_DEVICE_7SERIES.NO_BMM_INFO.TRUE_DP.SIMPLE_PRIM36.ram_DOPBDOP_UNCONNECTED ;
  wire [7:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.TRUE_DP.SIMPLE_PRIM36.ram_ECCPARITY_UNCONNECTED ;
  wire [8:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.TRUE_DP.SIMPLE_PRIM36.ram_RDADDRECC_UNCONNECTED ;

  (* CLOCK_DOMAINS = "COMMON" *) 
  (* box_type = "PRIMITIVE" *) 
  RAMB36E1 #(
    .DOA_REG(0),
    .DOB_REG(0),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_20(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_21(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_22(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_23(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_24(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_25(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_26(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_27(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_28(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_29(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_40(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_41(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_42(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_43(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_44(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_45(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_46(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_47(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_48(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_49(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_50(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_51(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_52(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_53(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_54(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_55(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_56(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_57(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_58(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_59(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_60(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_61(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_62(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_63(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_64(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_65(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_66(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_67(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_68(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_69(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_70(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_71(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_72(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_73(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_74(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_75(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_76(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_77(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_78(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_79(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(36'h000000000),
    .INIT_B(36'h000000000),
    .INIT_FILE("NONE"),
    .IS_CLKARDCLK_INVERTED(1'b0),
    .IS_CLKBWRCLK_INVERTED(1'b0),
    .IS_ENARDEN_INVERTED(1'b0),
    .IS_ENBWREN_INVERTED(1'b0),
    .IS_RSTRAMARSTRAM_INVERTED(1'b0),
    .IS_RSTRAMB_INVERTED(1'b0),
    .IS_RSTREGARSTREG_INVERTED(1'b0),
    .IS_RSTREGB_INVERTED(1'b0),
    .RAM_EXTENSION_A("NONE"),
    .RAM_EXTENSION_B("NONE"),
    .RAM_MODE("TDP"),
    .RDADDR_COLLISION_HWCONFIG("DELAYED_WRITE"),
    .READ_WIDTH_A(18),
    .READ_WIDTH_B(18),
    .RSTREG_PRIORITY_A("REGCE"),
    .RSTREG_PRIORITY_B("REGCE"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("WRITE_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(18),
    .WRITE_WIDTH_B(18)) 
    \DEVICE_7SERIES.NO_BMM_INFO.TRUE_DP.SIMPLE_PRIM36.ram 
       (.ADDRARDADDR({1'b1,addra,1'b1,1'b1,1'b1,1'b1}),
        .ADDRBWRADDR({1'b1,addrb,1'b1,1'b1,1'b1,1'b1}),
        .CASCADEINA(1'b0),
        .CASCADEINB(1'b0),
        .CASCADEOUTA(\NLW_DEVICE_7SERIES.NO_BMM_INFO.TRUE_DP.SIMPLE_PRIM36.ram_CASCADEOUTA_UNCONNECTED ),
        .CASCADEOUTB(\NLW_DEVICE_7SERIES.NO_BMM_INFO.TRUE_DP.SIMPLE_PRIM36.ram_CASCADEOUTB_UNCONNECTED ),
        .CLKARDCLK(clka),
        .CLKBWRCLK(clkb),
        .DBITERR(\NLW_DEVICE_7SERIES.NO_BMM_INFO.TRUE_DP.SIMPLE_PRIM36.ram_DBITERR_UNCONNECTED ),
        .DIADI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,dina[16:9],dina[7:0]}),
        .DIBDI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,dinb[16:9],dinb[7:0]}),
        .DIPADIP({1'b0,1'b0,dina[17],dina[8]}),
        .DIPBDIP({1'b0,1'b0,dinb[17],dinb[8]}),
        .DOADO({\NLW_DEVICE_7SERIES.NO_BMM_INFO.TRUE_DP.SIMPLE_PRIM36.ram_DOADO_UNCONNECTED [31:16],douta[16:9],douta[7:0]}),
        .DOBDO({\NLW_DEVICE_7SERIES.NO_BMM_INFO.TRUE_DP.SIMPLE_PRIM36.ram_DOBDO_UNCONNECTED [31:16],doutb[16:9],doutb[7:0]}),
        .DOPADOP({\NLW_DEVICE_7SERIES.NO_BMM_INFO.TRUE_DP.SIMPLE_PRIM36.ram_DOPADOP_UNCONNECTED [3:2],douta[17],douta[8]}),
        .DOPBDOP({\NLW_DEVICE_7SERIES.NO_BMM_INFO.TRUE_DP.SIMPLE_PRIM36.ram_DOPBDOP_UNCONNECTED [3:2],doutb[17],doutb[8]}),
        .ECCPARITY(\NLW_DEVICE_7SERIES.NO_BMM_INFO.TRUE_DP.SIMPLE_PRIM36.ram_ECCPARITY_UNCONNECTED [7:0]),
        .ENARDEN(ena),
        .ENBWREN(enb),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .RDADDRECC(\NLW_DEVICE_7SERIES.NO_BMM_INFO.TRUE_DP.SIMPLE_PRIM36.ram_RDADDRECC_UNCONNECTED [8:0]),
        .REGCEAREGCE(1'b0),
        .REGCEB(1'b0),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SBITERR(\NLW_DEVICE_7SERIES.NO_BMM_INFO.TRUE_DP.SIMPLE_PRIM36.ram_SBITERR_UNCONNECTED ),
        .WEA({wea,wea,wea,wea}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0,web,web,web,web}));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_wrapper_init" *) 
module pilotSynch_blk_mem_gen_prim_wrapper_init_5
   (douta,
    doutb,
    clka,
    clkb,
    ena,
    enb,
    addra,
    addrb,
    dina,
    dinb,
    wea,
    web);
  output [17:0]douta;
  output [17:0]doutb;
  input clka;
  input clkb;
  input ena;
  input enb;
  input [10:0]addra;
  input [10:0]addrb;
  input [17:0]dina;
  input [17:0]dinb;
  input [0:0]wea;
  input [0:0]web;

  wire [10:0]addra;
  wire [10:0]addrb;
  wire clka;
  wire clkb;
  wire [17:0]dina;
  wire [17:0]dinb;
  wire [17:0]douta;
  wire [17:0]doutb;
  wire ena;
  wire enb;
  wire [0:0]wea;
  wire [0:0]web;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.TRUE_DP.SIMPLE_PRIM36.ram_CASCADEOUTA_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.TRUE_DP.SIMPLE_PRIM36.ram_CASCADEOUTB_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.TRUE_DP.SIMPLE_PRIM36.ram_DBITERR_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.TRUE_DP.SIMPLE_PRIM36.ram_SBITERR_UNCONNECTED ;
  wire [31:16]\NLW_DEVICE_7SERIES.NO_BMM_INFO.TRUE_DP.SIMPLE_PRIM36.ram_DOADO_UNCONNECTED ;
  wire [31:16]\NLW_DEVICE_7SERIES.NO_BMM_INFO.TRUE_DP.SIMPLE_PRIM36.ram_DOBDO_UNCONNECTED ;
  wire [3:2]\NLW_DEVICE_7SERIES.NO_BMM_INFO.TRUE_DP.SIMPLE_PRIM36.ram_DOPADOP_UNCONNECTED ;
  wire [3:2]\NLW_DEVICE_7SERIES.NO_BMM_INFO.TRUE_DP.SIMPLE_PRIM36.ram_DOPBDOP_UNCONNECTED ;
  wire [7:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.TRUE_DP.SIMPLE_PRIM36.ram_ECCPARITY_UNCONNECTED ;
  wire [8:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.TRUE_DP.SIMPLE_PRIM36.ram_RDADDRECC_UNCONNECTED ;

  (* CLOCK_DOMAINS = "COMMON" *) 
  (* box_type = "PRIMITIVE" *) 
  RAMB36E1 #(
    .DOA_REG(0),
    .DOB_REG(0),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_20(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_21(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_22(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_23(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_24(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_25(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_26(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_27(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_28(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_29(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_40(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_41(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_42(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_43(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_44(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_45(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_46(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_47(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_48(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_49(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_50(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_51(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_52(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_53(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_54(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_55(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_56(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_57(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_58(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_59(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_60(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_61(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_62(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_63(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_64(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_65(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_66(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_67(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_68(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_69(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_70(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_71(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_72(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_73(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_74(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_75(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_76(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_77(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_78(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_79(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(36'h000000000),
    .INIT_B(36'h000000000),
    .INIT_FILE("NONE"),
    .IS_CLKARDCLK_INVERTED(1'b0),
    .IS_CLKBWRCLK_INVERTED(1'b0),
    .IS_ENARDEN_INVERTED(1'b0),
    .IS_ENBWREN_INVERTED(1'b0),
    .IS_RSTRAMARSTRAM_INVERTED(1'b0),
    .IS_RSTRAMB_INVERTED(1'b0),
    .IS_RSTREGARSTREG_INVERTED(1'b0),
    .IS_RSTREGB_INVERTED(1'b0),
    .RAM_EXTENSION_A("NONE"),
    .RAM_EXTENSION_B("NONE"),
    .RAM_MODE("TDP"),
    .RDADDR_COLLISION_HWCONFIG("DELAYED_WRITE"),
    .READ_WIDTH_A(18),
    .READ_WIDTH_B(18),
    .RSTREG_PRIORITY_A("REGCE"),
    .RSTREG_PRIORITY_B("REGCE"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("WRITE_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(18),
    .WRITE_WIDTH_B(18)) 
    \DEVICE_7SERIES.NO_BMM_INFO.TRUE_DP.SIMPLE_PRIM36.ram 
       (.ADDRARDADDR({1'b1,addra,1'b1,1'b1,1'b1,1'b1}),
        .ADDRBWRADDR({1'b1,addrb,1'b1,1'b1,1'b1,1'b1}),
        .CASCADEINA(1'b0),
        .CASCADEINB(1'b0),
        .CASCADEOUTA(\NLW_DEVICE_7SERIES.NO_BMM_INFO.TRUE_DP.SIMPLE_PRIM36.ram_CASCADEOUTA_UNCONNECTED ),
        .CASCADEOUTB(\NLW_DEVICE_7SERIES.NO_BMM_INFO.TRUE_DP.SIMPLE_PRIM36.ram_CASCADEOUTB_UNCONNECTED ),
        .CLKARDCLK(clka),
        .CLKBWRCLK(clkb),
        .DBITERR(\NLW_DEVICE_7SERIES.NO_BMM_INFO.TRUE_DP.SIMPLE_PRIM36.ram_DBITERR_UNCONNECTED ),
        .DIADI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,dina[16:9],dina[7:0]}),
        .DIBDI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,dinb[16:9],dinb[7:0]}),
        .DIPADIP({1'b0,1'b0,dina[17],dina[8]}),
        .DIPBDIP({1'b0,1'b0,dinb[17],dinb[8]}),
        .DOADO({\NLW_DEVICE_7SERIES.NO_BMM_INFO.TRUE_DP.SIMPLE_PRIM36.ram_DOADO_UNCONNECTED [31:16],douta[16:9],douta[7:0]}),
        .DOBDO({\NLW_DEVICE_7SERIES.NO_BMM_INFO.TRUE_DP.SIMPLE_PRIM36.ram_DOBDO_UNCONNECTED [31:16],doutb[16:9],doutb[7:0]}),
        .DOPADOP({\NLW_DEVICE_7SERIES.NO_BMM_INFO.TRUE_DP.SIMPLE_PRIM36.ram_DOPADOP_UNCONNECTED [3:2],douta[17],douta[8]}),
        .DOPBDOP({\NLW_DEVICE_7SERIES.NO_BMM_INFO.TRUE_DP.SIMPLE_PRIM36.ram_DOPBDOP_UNCONNECTED [3:2],doutb[17],doutb[8]}),
        .ECCPARITY(\NLW_DEVICE_7SERIES.NO_BMM_INFO.TRUE_DP.SIMPLE_PRIM36.ram_ECCPARITY_UNCONNECTED [7:0]),
        .ENARDEN(ena),
        .ENBWREN(enb),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .RDADDRECC(\NLW_DEVICE_7SERIES.NO_BMM_INFO.TRUE_DP.SIMPLE_PRIM36.ram_RDADDRECC_UNCONNECTED [8:0]),
        .REGCEAREGCE(1'b0),
        .REGCEB(1'b0),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SBITERR(\NLW_DEVICE_7SERIES.NO_BMM_INFO.TRUE_DP.SIMPLE_PRIM36.ram_SBITERR_UNCONNECTED ),
        .WEA({wea,wea,wea,wea}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0,web,web,web,web}));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_top" *) 
module pilotSynch_blk_mem_gen_top
   (douta,
    doutb,
    clka,
    clkb,
    ena,
    enb,
    addra,
    addrb,
    dina,
    dinb,
    wea,
    web);
  output [17:0]douta;
  output [17:0]doutb;
  input clka;
  input clkb;
  input ena;
  input enb;
  input [10:0]addra;
  input [10:0]addrb;
  input [17:0]dina;
  input [17:0]dinb;
  input [0:0]wea;
  input [0:0]web;

  wire [10:0]addra;
  wire [10:0]addrb;
  wire clka;
  wire clkb;
  wire [17:0]dina;
  wire [17:0]dinb;
  wire [17:0]douta;
  wire [17:0]doutb;
  wire ena;
  wire enb;
  wire [0:0]wea;
  wire [0:0]web;

  pilotSynch_blk_mem_gen_generic_cstr \valid.cstr 
       (.addra(addra),
        .addrb(addrb),
        .clka(clka),
        .clkb(clkb),
        .dina(dina),
        .dinb(dinb),
        .douta(douta),
        .doutb(doutb),
        .ena(ena),
        .enb(enb),
        .wea(wea),
        .web(web));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_top" *) 
module pilotSynch_blk_mem_gen_top_2
   (douta,
    doutb,
    clka,
    clkb,
    ena,
    enb,
    addra,
    addrb,
    dina,
    dinb,
    wea,
    web);
  output [17:0]douta;
  output [17:0]doutb;
  input clka;
  input clkb;
  input ena;
  input enb;
  input [10:0]addra;
  input [10:0]addrb;
  input [17:0]dina;
  input [17:0]dinb;
  input [0:0]wea;
  input [0:0]web;

  wire [10:0]addra;
  wire [10:0]addrb;
  wire clka;
  wire clkb;
  wire [17:0]dina;
  wire [17:0]dinb;
  wire [17:0]douta;
  wire [17:0]doutb;
  wire ena;
  wire enb;
  wire [0:0]wea;
  wire [0:0]web;

  pilotSynch_blk_mem_gen_generic_cstr_3 \valid.cstr 
       (.addra(addra),
        .addrb(addrb),
        .clka(clka),
        .clkb(clkb),
        .dina(dina),
        .dinb(dinb),
        .douta(douta),
        .doutb(doutb),
        .ena(ena),
        .enb(enb),
        .wea(wea),
        .web(web));
endmodule

(* C_ADDRA_WIDTH = "11" *) (* C_ADDRB_WIDTH = "11" *) (* C_ALGORITHM = "1" *) 
(* C_AXI_ID_WIDTH = "4" *) (* C_AXI_SLAVE_TYPE = "0" *) (* C_AXI_TYPE = "1" *) 
(* C_BYTE_SIZE = "9" *) (* C_COMMON_CLK = "1" *) (* C_COUNT_18K_BRAM = "0" *) 
(* C_COUNT_36K_BRAM = "1" *) (* C_CTRL_ECC_ALGO = "NONE" *) (* C_DEFAULT_DATA = "0" *) 
(* C_DISABLE_WARN_BHV_COLL = "0" *) (* C_DISABLE_WARN_BHV_RANGE = "0" *) (* C_ELABORATION_DIR = "./" *) 
(* C_ENABLE_32BIT_ADDRESS = "0" *) (* C_EN_DEEPSLEEP_PIN = "0" *) (* C_EN_ECC_PIPE = "0" *) 
(* C_EN_RDADDRA_CHG = "0" *) (* C_EN_RDADDRB_CHG = "0" *) (* C_EN_SAFETY_CKT = "0" *) 
(* C_EN_SHUTDOWN_PIN = "0" *) (* C_EN_SLEEP_PIN = "0" *) (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     5.4321999999999999 mW" *) 
(* C_HAS_AXI_ID = "0" *) (* C_HAS_ENA = "1" *) (* C_HAS_ENB = "1" *) 
(* C_HAS_INJECTERR = "0" *) (* C_HAS_MEM_OUTPUT_REGS_A = "0" *) (* C_HAS_MEM_OUTPUT_REGS_B = "0" *) 
(* C_HAS_MUX_OUTPUT_REGS_A = "0" *) (* C_HAS_MUX_OUTPUT_REGS_B = "0" *) (* C_HAS_REGCEA = "0" *) 
(* C_HAS_REGCEB = "0" *) (* C_HAS_RSTA = "0" *) (* C_HAS_RSTB = "0" *) 
(* C_HAS_SOFTECC_INPUT_REGS_A = "0" *) (* C_HAS_SOFTECC_OUTPUT_REGS_B = "0" *) (* C_INITA_VAL = "0" *) 
(* C_INITB_VAL = "0" *) (* C_INIT_FILE = "pilotsync_blk_mem_gen_v8_3_i0.mem" *) (* C_INIT_FILE_NAME = "pilotsync_blk_mem_gen_v8_3_i0.mif" *) 
(* C_INTERFACE_TYPE = "0" *) (* C_LOAD_INIT_FILE = "1" *) (* C_MEM_TYPE = "2" *) 
(* C_MUX_PIPELINE_STAGES = "0" *) (* C_PRIM_TYPE = "1" *) (* C_READ_DEPTH_A = "2048" *) 
(* C_READ_DEPTH_B = "2048" *) (* C_READ_WIDTH_A = "18" *) (* C_READ_WIDTH_B = "18" *) 
(* C_RSTRAM_A = "0" *) (* C_RSTRAM_B = "0" *) (* C_RST_PRIORITY_A = "CE" *) 
(* C_RST_PRIORITY_B = "CE" *) (* C_SIM_COLLISION_CHECK = "ALL" *) (* C_USE_BRAM_BLOCK = "0" *) 
(* C_USE_BYTE_WEA = "0" *) (* C_USE_BYTE_WEB = "0" *) (* C_USE_DEFAULT_DATA = "0" *) 
(* C_USE_ECC = "0" *) (* C_USE_SOFTECC = "0" *) (* C_USE_URAM = "0" *) 
(* C_WEA_WIDTH = "1" *) (* C_WEB_WIDTH = "1" *) (* C_WRITE_DEPTH_A = "2048" *) 
(* C_WRITE_DEPTH_B = "2048" *) (* C_WRITE_MODE_A = "WRITE_FIRST" *) (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
(* C_WRITE_WIDTH_A = "18" *) (* C_WRITE_WIDTH_B = "18" *) (* C_XDEVICEFAMILY = "kintex7" *) 
(* ORIG_REF_NAME = "blk_mem_gen_v8_3_4" *) (* c_family = "kintex7" *) (* downgradeipidentifiedwarnings = "yes" *) 
module pilotSynch_blk_mem_gen_v8_3_4
   (clka,
    rsta,
    ena,
    regcea,
    wea,
    addra,
    dina,
    douta,
    clkb,
    rstb,
    enb,
    regceb,
    web,
    addrb,
    dinb,
    doutb,
    injectsbiterr,
    injectdbiterr,
    eccpipece,
    sbiterr,
    dbiterr,
    rdaddrecc,
    sleep,
    deepsleep,
    shutdown,
    rsta_busy,
    rstb_busy,
    s_aclk,
    s_aresetn,
    s_axi_awid,
    s_axi_awaddr,
    s_axi_awlen,
    s_axi_awsize,
    s_axi_awburst,
    s_axi_awvalid,
    s_axi_awready,
    s_axi_wdata,
    s_axi_wstrb,
    s_axi_wlast,
    s_axi_wvalid,
    s_axi_wready,
    s_axi_bid,
    s_axi_bresp,
    s_axi_bvalid,
    s_axi_bready,
    s_axi_arid,
    s_axi_araddr,
    s_axi_arlen,
    s_axi_arsize,
    s_axi_arburst,
    s_axi_arvalid,
    s_axi_arready,
    s_axi_rid,
    s_axi_rdata,
    s_axi_rresp,
    s_axi_rlast,
    s_axi_rvalid,
    s_axi_rready,
    s_axi_injectsbiterr,
    s_axi_injectdbiterr,
    s_axi_sbiterr,
    s_axi_dbiterr,
    s_axi_rdaddrecc);
  input clka;
  input rsta;
  input ena;
  input regcea;
  input [0:0]wea;
  input [10:0]addra;
  input [17:0]dina;
  output [17:0]douta;
  input clkb;
  input rstb;
  input enb;
  input regceb;
  input [0:0]web;
  input [10:0]addrb;
  input [17:0]dinb;
  output [17:0]doutb;
  input injectsbiterr;
  input injectdbiterr;
  input eccpipece;
  output sbiterr;
  output dbiterr;
  output [10:0]rdaddrecc;
  input sleep;
  input deepsleep;
  input shutdown;
  output rsta_busy;
  output rstb_busy;
  input s_aclk;
  input s_aresetn;
  input [3:0]s_axi_awid;
  input [31:0]s_axi_awaddr;
  input [7:0]s_axi_awlen;
  input [2:0]s_axi_awsize;
  input [1:0]s_axi_awburst;
  input s_axi_awvalid;
  output s_axi_awready;
  input [17:0]s_axi_wdata;
  input [0:0]s_axi_wstrb;
  input s_axi_wlast;
  input s_axi_wvalid;
  output s_axi_wready;
  output [3:0]s_axi_bid;
  output [1:0]s_axi_bresp;
  output s_axi_bvalid;
  input s_axi_bready;
  input [3:0]s_axi_arid;
  input [31:0]s_axi_araddr;
  input [7:0]s_axi_arlen;
  input [2:0]s_axi_arsize;
  input [1:0]s_axi_arburst;
  input s_axi_arvalid;
  output s_axi_arready;
  output [3:0]s_axi_rid;
  output [17:0]s_axi_rdata;
  output [1:0]s_axi_rresp;
  output s_axi_rlast;
  output s_axi_rvalid;
  input s_axi_rready;
  input s_axi_injectsbiterr;
  input s_axi_injectdbiterr;
  output s_axi_sbiterr;
  output s_axi_dbiterr;
  output [10:0]s_axi_rdaddrecc;

  wire \<const0> ;
  wire [10:0]addra;
  wire [10:0]addrb;
  wire clka;
  wire clkb;
  wire [17:0]dina;
  wire [17:0]dinb;
  wire [17:0]douta;
  wire [17:0]doutb;
  wire ena;
  wire enb;
  wire [0:0]wea;
  wire [0:0]web;

  assign dbiterr = \<const0> ;
  assign rdaddrecc[10] = \<const0> ;
  assign rdaddrecc[9] = \<const0> ;
  assign rdaddrecc[8] = \<const0> ;
  assign rdaddrecc[7] = \<const0> ;
  assign rdaddrecc[6] = \<const0> ;
  assign rdaddrecc[5] = \<const0> ;
  assign rdaddrecc[4] = \<const0> ;
  assign rdaddrecc[3] = \<const0> ;
  assign rdaddrecc[2] = \<const0> ;
  assign rdaddrecc[1] = \<const0> ;
  assign rdaddrecc[0] = \<const0> ;
  assign rsta_busy = \<const0> ;
  assign rstb_busy = \<const0> ;
  assign s_axi_arready = \<const0> ;
  assign s_axi_awready = \<const0> ;
  assign s_axi_bid[3] = \<const0> ;
  assign s_axi_bid[2] = \<const0> ;
  assign s_axi_bid[1] = \<const0> ;
  assign s_axi_bid[0] = \<const0> ;
  assign s_axi_bresp[1] = \<const0> ;
  assign s_axi_bresp[0] = \<const0> ;
  assign s_axi_bvalid = \<const0> ;
  assign s_axi_dbiterr = \<const0> ;
  assign s_axi_rdaddrecc[10] = \<const0> ;
  assign s_axi_rdaddrecc[9] = \<const0> ;
  assign s_axi_rdaddrecc[8] = \<const0> ;
  assign s_axi_rdaddrecc[7] = \<const0> ;
  assign s_axi_rdaddrecc[6] = \<const0> ;
  assign s_axi_rdaddrecc[5] = \<const0> ;
  assign s_axi_rdaddrecc[4] = \<const0> ;
  assign s_axi_rdaddrecc[3] = \<const0> ;
  assign s_axi_rdaddrecc[2] = \<const0> ;
  assign s_axi_rdaddrecc[1] = \<const0> ;
  assign s_axi_rdaddrecc[0] = \<const0> ;
  assign s_axi_rdata[17] = \<const0> ;
  assign s_axi_rdata[16] = \<const0> ;
  assign s_axi_rdata[15] = \<const0> ;
  assign s_axi_rdata[14] = \<const0> ;
  assign s_axi_rdata[13] = \<const0> ;
  assign s_axi_rdata[12] = \<const0> ;
  assign s_axi_rdata[11] = \<const0> ;
  assign s_axi_rdata[10] = \<const0> ;
  assign s_axi_rdata[9] = \<const0> ;
  assign s_axi_rdata[8] = \<const0> ;
  assign s_axi_rdata[7] = \<const0> ;
  assign s_axi_rdata[6] = \<const0> ;
  assign s_axi_rdata[5] = \<const0> ;
  assign s_axi_rdata[4] = \<const0> ;
  assign s_axi_rdata[3] = \<const0> ;
  assign s_axi_rdata[2] = \<const0> ;
  assign s_axi_rdata[1] = \<const0> ;
  assign s_axi_rdata[0] = \<const0> ;
  assign s_axi_rid[3] = \<const0> ;
  assign s_axi_rid[2] = \<const0> ;
  assign s_axi_rid[1] = \<const0> ;
  assign s_axi_rid[0] = \<const0> ;
  assign s_axi_rlast = \<const0> ;
  assign s_axi_rresp[1] = \<const0> ;
  assign s_axi_rresp[0] = \<const0> ;
  assign s_axi_rvalid = \<const0> ;
  assign s_axi_sbiterr = \<const0> ;
  assign s_axi_wready = \<const0> ;
  assign sbiterr = \<const0> ;
  GND GND
       (.G(\<const0> ));
  pilotSynch_blk_mem_gen_v8_3_4_synth inst_blk_mem_gen
       (.addra(addra),
        .addrb(addrb),
        .clka(clka),
        .clkb(clkb),
        .dina(dina),
        .dinb(dinb),
        .douta(douta),
        .doutb(doutb),
        .ena(ena),
        .enb(enb),
        .wea(wea),
        .web(web));
endmodule

(* C_ADDRA_WIDTH = "11" *) (* C_ADDRB_WIDTH = "11" *) (* C_ALGORITHM = "1" *) 
(* C_AXI_ID_WIDTH = "4" *) (* C_AXI_SLAVE_TYPE = "0" *) (* C_AXI_TYPE = "1" *) 
(* C_BYTE_SIZE = "9" *) (* C_COMMON_CLK = "1" *) (* C_COUNT_18K_BRAM = "0" *) 
(* C_COUNT_36K_BRAM = "1" *) (* C_CTRL_ECC_ALGO = "NONE" *) (* C_DEFAULT_DATA = "0" *) 
(* C_DISABLE_WARN_BHV_COLL = "0" *) (* C_DISABLE_WARN_BHV_RANGE = "0" *) (* C_ELABORATION_DIR = "./" *) 
(* C_ENABLE_32BIT_ADDRESS = "0" *) (* C_EN_DEEPSLEEP_PIN = "0" *) (* C_EN_ECC_PIPE = "0" *) 
(* C_EN_RDADDRA_CHG = "0" *) (* C_EN_RDADDRB_CHG = "0" *) (* C_EN_SAFETY_CKT = "0" *) 
(* C_EN_SHUTDOWN_PIN = "0" *) (* C_EN_SLEEP_PIN = "0" *) (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     5.4321999999999999 mW" *) 
(* C_HAS_AXI_ID = "0" *) (* C_HAS_ENA = "1" *) (* C_HAS_ENB = "1" *) 
(* C_HAS_INJECTERR = "0" *) (* C_HAS_MEM_OUTPUT_REGS_A = "0" *) (* C_HAS_MEM_OUTPUT_REGS_B = "0" *) 
(* C_HAS_MUX_OUTPUT_REGS_A = "0" *) (* C_HAS_MUX_OUTPUT_REGS_B = "0" *) (* C_HAS_REGCEA = "0" *) 
(* C_HAS_REGCEB = "0" *) (* C_HAS_RSTA = "0" *) (* C_HAS_RSTB = "0" *) 
(* C_HAS_SOFTECC_INPUT_REGS_A = "0" *) (* C_HAS_SOFTECC_OUTPUT_REGS_B = "0" *) (* C_INITA_VAL = "0" *) 
(* C_INITB_VAL = "0" *) (* C_INIT_FILE = "pilotsync_blk_mem_gen_v8_3_i0.mem" *) (* C_INIT_FILE_NAME = "pilotsync_blk_mem_gen_v8_3_i0.mif" *) 
(* C_INTERFACE_TYPE = "0" *) (* C_LOAD_INIT_FILE = "1" *) (* C_MEM_TYPE = "2" *) 
(* C_MUX_PIPELINE_STAGES = "0" *) (* C_PRIM_TYPE = "1" *) (* C_READ_DEPTH_A = "2048" *) 
(* C_READ_DEPTH_B = "2048" *) (* C_READ_WIDTH_A = "18" *) (* C_READ_WIDTH_B = "18" *) 
(* C_RSTRAM_A = "0" *) (* C_RSTRAM_B = "0" *) (* C_RST_PRIORITY_A = "CE" *) 
(* C_RST_PRIORITY_B = "CE" *) (* C_SIM_COLLISION_CHECK = "ALL" *) (* C_USE_BRAM_BLOCK = "0" *) 
(* C_USE_BYTE_WEA = "0" *) (* C_USE_BYTE_WEB = "0" *) (* C_USE_DEFAULT_DATA = "0" *) 
(* C_USE_ECC = "0" *) (* C_USE_SOFTECC = "0" *) (* C_USE_URAM = "0" *) 
(* C_WEA_WIDTH = "1" *) (* C_WEB_WIDTH = "1" *) (* C_WRITE_DEPTH_A = "2048" *) 
(* C_WRITE_DEPTH_B = "2048" *) (* C_WRITE_MODE_A = "WRITE_FIRST" *) (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
(* C_WRITE_WIDTH_A = "18" *) (* C_WRITE_WIDTH_B = "18" *) (* C_XDEVICEFAMILY = "kintex7" *) 
(* ORIG_REF_NAME = "blk_mem_gen_v8_3_4" *) (* c_family = "kintex7" *) (* downgradeipidentifiedwarnings = "yes" *) 
module pilotSynch_blk_mem_gen_v8_3_4__2
   (clka,
    rsta,
    ena,
    regcea,
    wea,
    addra,
    dina,
    douta,
    clkb,
    rstb,
    enb,
    regceb,
    web,
    addrb,
    dinb,
    doutb,
    injectsbiterr,
    injectdbiterr,
    eccpipece,
    sbiterr,
    dbiterr,
    rdaddrecc,
    sleep,
    deepsleep,
    shutdown,
    rsta_busy,
    rstb_busy,
    s_aclk,
    s_aresetn,
    s_axi_awid,
    s_axi_awaddr,
    s_axi_awlen,
    s_axi_awsize,
    s_axi_awburst,
    s_axi_awvalid,
    s_axi_awready,
    s_axi_wdata,
    s_axi_wstrb,
    s_axi_wlast,
    s_axi_wvalid,
    s_axi_wready,
    s_axi_bid,
    s_axi_bresp,
    s_axi_bvalid,
    s_axi_bready,
    s_axi_arid,
    s_axi_araddr,
    s_axi_arlen,
    s_axi_arsize,
    s_axi_arburst,
    s_axi_arvalid,
    s_axi_arready,
    s_axi_rid,
    s_axi_rdata,
    s_axi_rresp,
    s_axi_rlast,
    s_axi_rvalid,
    s_axi_rready,
    s_axi_injectsbiterr,
    s_axi_injectdbiterr,
    s_axi_sbiterr,
    s_axi_dbiterr,
    s_axi_rdaddrecc);
  input clka;
  input rsta;
  input ena;
  input regcea;
  input [0:0]wea;
  input [10:0]addra;
  input [17:0]dina;
  output [17:0]douta;
  input clkb;
  input rstb;
  input enb;
  input regceb;
  input [0:0]web;
  input [10:0]addrb;
  input [17:0]dinb;
  output [17:0]doutb;
  input injectsbiterr;
  input injectdbiterr;
  input eccpipece;
  output sbiterr;
  output dbiterr;
  output [10:0]rdaddrecc;
  input sleep;
  input deepsleep;
  input shutdown;
  output rsta_busy;
  output rstb_busy;
  input s_aclk;
  input s_aresetn;
  input [3:0]s_axi_awid;
  input [31:0]s_axi_awaddr;
  input [7:0]s_axi_awlen;
  input [2:0]s_axi_awsize;
  input [1:0]s_axi_awburst;
  input s_axi_awvalid;
  output s_axi_awready;
  input [17:0]s_axi_wdata;
  input [0:0]s_axi_wstrb;
  input s_axi_wlast;
  input s_axi_wvalid;
  output s_axi_wready;
  output [3:0]s_axi_bid;
  output [1:0]s_axi_bresp;
  output s_axi_bvalid;
  input s_axi_bready;
  input [3:0]s_axi_arid;
  input [31:0]s_axi_araddr;
  input [7:0]s_axi_arlen;
  input [2:0]s_axi_arsize;
  input [1:0]s_axi_arburst;
  input s_axi_arvalid;
  output s_axi_arready;
  output [3:0]s_axi_rid;
  output [17:0]s_axi_rdata;
  output [1:0]s_axi_rresp;
  output s_axi_rlast;
  output s_axi_rvalid;
  input s_axi_rready;
  input s_axi_injectsbiterr;
  input s_axi_injectdbiterr;
  output s_axi_sbiterr;
  output s_axi_dbiterr;
  output [10:0]s_axi_rdaddrecc;

  wire \<const0> ;
  wire [10:0]addra;
  wire [10:0]addrb;
  wire clka;
  wire clkb;
  wire [17:0]dina;
  wire [17:0]dinb;
  wire [17:0]douta;
  wire [17:0]doutb;
  wire ena;
  wire enb;
  wire [0:0]wea;
  wire [0:0]web;

  assign dbiterr = \<const0> ;
  assign rdaddrecc[10] = \<const0> ;
  assign rdaddrecc[9] = \<const0> ;
  assign rdaddrecc[8] = \<const0> ;
  assign rdaddrecc[7] = \<const0> ;
  assign rdaddrecc[6] = \<const0> ;
  assign rdaddrecc[5] = \<const0> ;
  assign rdaddrecc[4] = \<const0> ;
  assign rdaddrecc[3] = \<const0> ;
  assign rdaddrecc[2] = \<const0> ;
  assign rdaddrecc[1] = \<const0> ;
  assign rdaddrecc[0] = \<const0> ;
  assign rsta_busy = \<const0> ;
  assign rstb_busy = \<const0> ;
  assign s_axi_arready = \<const0> ;
  assign s_axi_awready = \<const0> ;
  assign s_axi_bid[3] = \<const0> ;
  assign s_axi_bid[2] = \<const0> ;
  assign s_axi_bid[1] = \<const0> ;
  assign s_axi_bid[0] = \<const0> ;
  assign s_axi_bresp[1] = \<const0> ;
  assign s_axi_bresp[0] = \<const0> ;
  assign s_axi_bvalid = \<const0> ;
  assign s_axi_dbiterr = \<const0> ;
  assign s_axi_rdaddrecc[10] = \<const0> ;
  assign s_axi_rdaddrecc[9] = \<const0> ;
  assign s_axi_rdaddrecc[8] = \<const0> ;
  assign s_axi_rdaddrecc[7] = \<const0> ;
  assign s_axi_rdaddrecc[6] = \<const0> ;
  assign s_axi_rdaddrecc[5] = \<const0> ;
  assign s_axi_rdaddrecc[4] = \<const0> ;
  assign s_axi_rdaddrecc[3] = \<const0> ;
  assign s_axi_rdaddrecc[2] = \<const0> ;
  assign s_axi_rdaddrecc[1] = \<const0> ;
  assign s_axi_rdaddrecc[0] = \<const0> ;
  assign s_axi_rdata[17] = \<const0> ;
  assign s_axi_rdata[16] = \<const0> ;
  assign s_axi_rdata[15] = \<const0> ;
  assign s_axi_rdata[14] = \<const0> ;
  assign s_axi_rdata[13] = \<const0> ;
  assign s_axi_rdata[12] = \<const0> ;
  assign s_axi_rdata[11] = \<const0> ;
  assign s_axi_rdata[10] = \<const0> ;
  assign s_axi_rdata[9] = \<const0> ;
  assign s_axi_rdata[8] = \<const0> ;
  assign s_axi_rdata[7] = \<const0> ;
  assign s_axi_rdata[6] = \<const0> ;
  assign s_axi_rdata[5] = \<const0> ;
  assign s_axi_rdata[4] = \<const0> ;
  assign s_axi_rdata[3] = \<const0> ;
  assign s_axi_rdata[2] = \<const0> ;
  assign s_axi_rdata[1] = \<const0> ;
  assign s_axi_rdata[0] = \<const0> ;
  assign s_axi_rid[3] = \<const0> ;
  assign s_axi_rid[2] = \<const0> ;
  assign s_axi_rid[1] = \<const0> ;
  assign s_axi_rid[0] = \<const0> ;
  assign s_axi_rlast = \<const0> ;
  assign s_axi_rresp[1] = \<const0> ;
  assign s_axi_rresp[0] = \<const0> ;
  assign s_axi_rvalid = \<const0> ;
  assign s_axi_sbiterr = \<const0> ;
  assign s_axi_wready = \<const0> ;
  assign sbiterr = \<const0> ;
  GND GND
       (.G(\<const0> ));
  pilotSynch_blk_mem_gen_v8_3_4_synth_1 inst_blk_mem_gen
       (.addra(addra),
        .addrb(addrb),
        .clka(clka),
        .clkb(clkb),
        .dina(dina),
        .dinb(dinb),
        .douta(douta),
        .doutb(doutb),
        .ena(ena),
        .enb(enb),
        .wea(wea),
        .web(web));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_v8_3_4_synth" *) 
module pilotSynch_blk_mem_gen_v8_3_4_synth
   (douta,
    doutb,
    clka,
    clkb,
    ena,
    enb,
    addra,
    addrb,
    dina,
    dinb,
    wea,
    web);
  output [17:0]douta;
  output [17:0]doutb;
  input clka;
  input clkb;
  input ena;
  input enb;
  input [10:0]addra;
  input [10:0]addrb;
  input [17:0]dina;
  input [17:0]dinb;
  input [0:0]wea;
  input [0:0]web;

  wire [10:0]addra;
  wire [10:0]addrb;
  wire clka;
  wire clkb;
  wire [17:0]dina;
  wire [17:0]dinb;
  wire [17:0]douta;
  wire [17:0]doutb;
  wire ena;
  wire enb;
  wire [0:0]wea;
  wire [0:0]web;

  pilotSynch_blk_mem_gen_top \gnbram.gnativebmg.native_blk_mem_gen 
       (.addra(addra),
        .addrb(addrb),
        .clka(clka),
        .clkb(clkb),
        .dina(dina),
        .dinb(dinb),
        .douta(douta),
        .doutb(doutb),
        .ena(ena),
        .enb(enb),
        .wea(wea),
        .web(web));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_v8_3_4_synth" *) 
module pilotSynch_blk_mem_gen_v8_3_4_synth_1
   (douta,
    doutb,
    clka,
    clkb,
    ena,
    enb,
    addra,
    addrb,
    dina,
    dinb,
    wea,
    web);
  output [17:0]douta;
  output [17:0]doutb;
  input clka;
  input clkb;
  input ena;
  input enb;
  input [10:0]addra;
  input [10:0]addrb;
  input [17:0]dina;
  input [17:0]dinb;
  input [0:0]wea;
  input [0:0]web;

  wire [10:0]addra;
  wire [10:0]addrb;
  wire clka;
  wire clkb;
  wire [17:0]dina;
  wire [17:0]dinb;
  wire [17:0]douta;
  wire [17:0]doutb;
  wire ena;
  wire enb;
  wire [0:0]wea;
  wire [0:0]web;

  pilotSynch_blk_mem_gen_top_2 \gnbram.gnativebmg.native_blk_mem_gen 
       (.addra(addra),
        .addrb(addrb),
        .clka(clka),
        .clkb(clkb),
        .dina(dina),
        .dinb(dinb),
        .douta(douta),
        .doutb(doutb),
        .ena(ena),
        .enb(enb),
        .wea(wea),
        .web(web));
endmodule

(* C_ADD_MODE = "1" *) (* C_AINIT_VAL = "0" *) (* C_A_TYPE = "0" *) 
(* C_A_WIDTH = "12" *) (* C_BORROW_LOW = "1" *) (* C_BYPASS_LOW = "0" *) 
(* C_B_CONSTANT = "0" *) (* C_B_TYPE = "0" *) (* C_B_VALUE = "000000000000" *) 
(* C_B_WIDTH = "12" *) (* C_CE_OVERRIDES_BYPASS = "1" *) (* C_CE_OVERRIDES_SCLR = "0" *) 
(* C_HAS_BYPASS = "0" *) (* C_HAS_CE = "0" *) (* C_HAS_SCLR = "0" *) 
(* C_HAS_SINIT = "0" *) (* C_HAS_SSET = "0" *) (* C_IMPLEMENTATION = "0" *) 
(* C_SCLR_OVERRIDES_SSET = "1" *) (* C_SINIT_VAL = "0" *) (* C_VERBOSITY = "0" *) 
(* C_XDEVICEFAMILY = "kintex7" *) (* ORIG_REF_NAME = "c_addsub_v12_0_10" *) (* c_has_c_in = "0" *) 
(* c_has_c_out = "0" *) (* c_latency = "0" *) (* c_out_width = "12" *) 
(* downgradeipidentifiedwarnings = "yes" *) 
module pilotSynch_c_addsub_v12_0_10
   (A,
    B,
    CLK,
    ADD,
    C_IN,
    CE,
    BYPASS,
    SCLR,
    SSET,
    SINIT,
    C_OUT,
    S);
  input [11:0]A;
  input [11:0]B;
  input CLK;
  input ADD;
  input C_IN;
  input CE;
  input BYPASS;
  input SCLR;
  input SSET;
  input SINIT;
  output C_OUT;
  output [11:0]S;

  wire \<const0> ;
  wire [11:0]A;
  wire [11:0]B;
  wire [11:0]S;
  wire NLW_xst_addsub_C_OUT_UNCONNECTED;

  assign C_OUT = \<const0> ;
  GND GND
       (.G(\<const0> ));
  (* C_BORROW_LOW = "1" *) 
  (* C_CE_OVERRIDES_BYPASS = "1" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_IMPLEMENTATION = "0" *) 
  (* C_SCLR_OVERRIDES_SSET = "1" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "kintex7" *) 
  (* c_a_type = "0" *) 
  (* c_a_width = "12" *) 
  (* c_add_mode = "1" *) 
  (* c_ainit_val = "0" *) 
  (* c_b_constant = "0" *) 
  (* c_b_type = "0" *) 
  (* c_b_value = "000000000000" *) 
  (* c_b_width = "12" *) 
  (* c_bypass_low = "0" *) 
  (* c_has_bypass = "0" *) 
  (* c_has_c_in = "0" *) 
  (* c_has_c_out = "0" *) 
  (* c_has_ce = "0" *) 
  (* c_has_sclr = "0" *) 
  (* c_has_sinit = "0" *) 
  (* c_has_sset = "0" *) 
  (* c_latency = "0" *) 
  (* c_out_width = "12" *) 
  (* c_sinit_val = "0" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  pilotSynch_c_addsub_v12_0_10_viv xst_addsub
       (.A(A),
        .ADD(1'b0),
        .B(B),
        .BYPASS(1'b0),
        .CE(1'b0),
        .CLK(1'b0),
        .C_IN(1'b0),
        .C_OUT(NLW_xst_addsub_C_OUT_UNCONNECTED),
        .S(S),
        .SCLR(1'b0),
        .SINIT(1'b0),
        .SSET(1'b0));
endmodule

(* C_ADD_MODE = "1" *) (* C_AINIT_VAL = "0" *) (* C_A_TYPE = "0" *) 
(* C_A_WIDTH = "13" *) (* C_BORROW_LOW = "1" *) (* C_BYPASS_LOW = "0" *) 
(* C_B_CONSTANT = "0" *) (* C_B_TYPE = "0" *) (* C_B_VALUE = "0000000000000" *) 
(* C_B_WIDTH = "13" *) (* C_CE_OVERRIDES_BYPASS = "1" *) (* C_CE_OVERRIDES_SCLR = "0" *) 
(* C_HAS_BYPASS = "0" *) (* C_HAS_CE = "0" *) (* C_HAS_SCLR = "0" *) 
(* C_HAS_SINIT = "0" *) (* C_HAS_SSET = "0" *) (* C_IMPLEMENTATION = "0" *) 
(* C_SCLR_OVERRIDES_SSET = "1" *) (* C_SINIT_VAL = "0" *) (* C_VERBOSITY = "0" *) 
(* C_XDEVICEFAMILY = "kintex7" *) (* ORIG_REF_NAME = "c_addsub_v12_0_10" *) (* c_has_c_in = "0" *) 
(* c_has_c_out = "0" *) (* c_latency = "0" *) (* c_out_width = "13" *) 
(* downgradeipidentifiedwarnings = "yes" *) 
module pilotSynch_c_addsub_v12_0_10__parameterized1
   (A,
    B,
    CLK,
    ADD,
    C_IN,
    CE,
    BYPASS,
    SCLR,
    SSET,
    SINIT,
    C_OUT,
    S);
  input [12:0]A;
  input [12:0]B;
  input CLK;
  input ADD;
  input C_IN;
  input CE;
  input BYPASS;
  input SCLR;
  input SSET;
  input SINIT;
  output C_OUT;
  output [12:0]S;

  wire \<const0> ;
  wire [12:0]A;
  wire [12:0]B;
  wire [12:0]S;
  wire NLW_xst_addsub_C_OUT_UNCONNECTED;

  assign C_OUT = \<const0> ;
  GND GND
       (.G(\<const0> ));
  (* C_BORROW_LOW = "1" *) 
  (* C_CE_OVERRIDES_BYPASS = "1" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_IMPLEMENTATION = "0" *) 
  (* C_SCLR_OVERRIDES_SSET = "1" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "kintex7" *) 
  (* c_a_type = "0" *) 
  (* c_a_width = "13" *) 
  (* c_add_mode = "1" *) 
  (* c_ainit_val = "0" *) 
  (* c_b_constant = "0" *) 
  (* c_b_type = "0" *) 
  (* c_b_value = "0000000000000" *) 
  (* c_b_width = "13" *) 
  (* c_bypass_low = "0" *) 
  (* c_has_bypass = "0" *) 
  (* c_has_c_in = "0" *) 
  (* c_has_c_out = "0" *) 
  (* c_has_ce = "0" *) 
  (* c_has_sclr = "0" *) 
  (* c_has_sinit = "0" *) 
  (* c_has_sset = "0" *) 
  (* c_latency = "0" *) 
  (* c_out_width = "13" *) 
  (* c_sinit_val = "0" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  pilotSynch_c_addsub_v12_0_10_viv__parameterized1 xst_addsub
       (.A(A),
        .ADD(1'b0),
        .B(B),
        .BYPASS(1'b0),
        .CE(1'b0),
        .CLK(1'b0),
        .C_IN(1'b0),
        .C_OUT(NLW_xst_addsub_C_OUT_UNCONNECTED),
        .S(S),
        .SCLR(1'b0),
        .SINIT(1'b0),
        .SSET(1'b0));
endmodule

(* C_AINIT_VAL = "0" *) (* C_CE_OVERRIDES_SYNC = "0" *) (* C_COUNT_BY = "1" *) 
(* C_COUNT_MODE = "0" *) (* C_COUNT_TO = "1" *) (* C_FB_LATENCY = "0" *) 
(* C_HAS_CE = "1" *) (* C_HAS_LOAD = "0" *) (* C_HAS_SCLR = "0" *) 
(* C_HAS_SINIT = "1" *) (* C_HAS_SSET = "0" *) (* C_HAS_THRESH0 = "0" *) 
(* C_IMPLEMENTATION = "0" *) (* C_LOAD_LOW = "0" *) (* C_RESTRICT_COUNT = "0" *) 
(* C_SCLR_OVERRIDES_SSET = "1" *) (* C_SINIT_VAL = "0" *) (* C_THRESH0_VALUE = "1" *) 
(* C_VERBOSITY = "0" *) (* C_XDEVICEFAMILY = "kintex7" *) (* ORIG_REF_NAME = "c_counter_binary_v12_0_10" *) 
(* c_latency = "1" *) (* c_width = "11" *) (* downgradeipidentifiedwarnings = "yes" *) 
module pilotSynch_c_counter_binary_v12_0_10
   (CLK,
    CE,
    SCLR,
    SSET,
    SINIT,
    UP,
    LOAD,
    L,
    THRESH0,
    Q);
  input CLK;
  input CE;
  input SCLR;
  input SSET;
  input SINIT;
  input UP;
  input LOAD;
  input [10:0]L;
  output THRESH0;
  output [10:0]Q;

  wire \<const1> ;
  wire CE;
  wire CLK;
  wire [10:0]Q;
  wire SINIT;
  wire NLW_i_synth_THRESH0_UNCONNECTED;

  assign THRESH0 = \<const1> ;
  VCC VCC
       (.P(\<const1> ));
  (* C_CE_OVERRIDES_SYNC = "0" *) 
  (* C_FB_LATENCY = "0" *) 
  (* C_IMPLEMENTATION = "0" *) 
  (* C_SCLR_OVERRIDES_SSET = "1" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "kintex7" *) 
  (* c_ainit_val = "0" *) 
  (* c_count_by = "1" *) 
  (* c_count_mode = "0" *) 
  (* c_count_to = "1" *) 
  (* c_has_ce = "1" *) 
  (* c_has_load = "0" *) 
  (* c_has_sclr = "0" *) 
  (* c_has_sinit = "1" *) 
  (* c_has_sset = "0" *) 
  (* c_has_thresh0 = "0" *) 
  (* c_latency = "1" *) 
  (* c_load_low = "0" *) 
  (* c_restrict_count = "0" *) 
  (* c_sinit_val = "0" *) 
  (* c_thresh0_value = "1" *) 
  (* c_width = "11" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  pilotSynch_c_counter_binary_v12_0_10_viv i_synth
       (.CE(CE),
        .CLK(CLK),
        .L({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .LOAD(1'b0),
        .Q(Q),
        .SCLR(1'b0),
        .SINIT(SINIT),
        .SSET(1'b0),
        .THRESH0(NLW_i_synth_THRESH0_UNCONNECTED),
        .UP(1'b0));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2015"
`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="cds_rsa_key", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=64)
`pragma protect key_block
EgsHeoOxdUxsX5gIKiaj0rabVidhYZrAC1ccO7uW1WWUY+5F26NMKfuRo2RbzpHAhKg6YWmehafX
vTPGaJRKHw==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
Z34YzyhCkqWVBd+wfHLLkUW/H60lDZ7DBcaAzQK4qK/8LgoJdsH6DZ43BtKjfZhNz/T8CrFXpTq4
lXACmrJsvh8DNPmvB7LaQhnP9Q1UWB/2BUP3fAUHMA2d2pKOqEj3XF5pbikvIPiyQENN7Kn513bC
CvwAQIx2bzxkiYX1MZc=

`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
SSMUY5NrZw2M/7w7U4gsSjNRmWfRCxfALTKD8+8C1h91c8RWo9X4x7A5m9YG0Pa491k6Lxf7I0eD
goajxjfLKNI+buWpvfZlHEcU7678iPGqz4g94c5n80sa3TKcwpV6f+p7C93Rto4JgUHSigA3gLBN
DzpD+6xOS6P2mkrRsQs=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Tbb//X7l5IJljgHR/Q0swC7OpOr9LwQv6rxLgPXOMJNm5TebIkTTeQKZBlg96/x0gqqgFX19ZASr
qWxh3YL/aoYejZTUMHYF7ktggRgHydykFFfRo8xGrq33bJ1LOeuIQOZyZjZTB9zCoo8CMX8wCtcA
0ovBA4GCY5VFNLy/1whSrZs8R7CLSdrlxUJTTCXjF0f+Tf8OyjSS2VGyZfJbmSNnFJJuItoBbUO0
6qdcZfL3eQrA6y/AWPiFhGILWhBAvVGEahvuOHYDa8S1IUccHMOxQJtq0Y1UqRNB/qNmlHUKL/iH
IEr89vPUXnsfHTV4I+xFieSKz2LwzLXsAys4Yw==

`pragma protect key_keyowner="ATRENTA", key_keyname="ATR-SG-2015-RSA-3", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
kfJNFYIhzZvlPwb4KI2aCH6Fx40tZkxF1Q5EfJSPdq2JohdV53Dn2x9HbgUIqvISu5UuFwT8R+oV
/B66+AOKivg+iSCvhh+HSv/oQNtgHeIG5xMgV8d3jXD9G4abV/g3jySuWrjXT9Z0IqvTQjqmKOR2
9nVDANRSJiSyM0Y275L4ylvrdjL8Yim0M/e9k+N+kNYfcQAzQYd/lfTmcdkn74/0qt030HQ2LxSy
A+NwqYXBuB4VkkCPvigd/s63XQNHxeHfRZs7q0iWos8Jgu9uI1zA6ZN4O4Cts2V9BF+SRqJdzrLy
1t5mzK/i0gmdsb8ds3y4b3AMet8PeT7w9sZc/A==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinx_2016_05", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
MzDVqgEdc7DZdlm2cItrUQlry/9kVuVoApPpWX7zga11t+tLgAqain8Fhjl9Q1hFV6Rwv6WUUyOW
dL6uK1Pj4Tc0mqHyEMvAW2tHA/QcK0pphBofEd8Sd2oRBJ0l+XghTz/o5eIVzoxDF0h6fERIgAw6
PZK1iaI5d5osnKGqaJVhxQWf/M3XiOn9jCOGskyvtqNiiXNki/oAWPJNgm3Hb599C3ugMxNKGT5x
H76UXyZbcrmrFSkYz6XydewUEOb2eruDdZtf4QmJWyJ+WqAHgjSB7kcn3UfysW1iW59u7oxSpMgU
oLKWKFtXGSzN2+DVJ91qu7hIDmX5Q2X//JK4Cg==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="base64", line_length=76, bytes=256)
`pragma protect key_block
R8WUZ28YrSutNF1U27BQTPgAfpn+jhGHWaqn9bEDzOncyY2/cI2pll4kJdzT1eZt9xEIq1ItI6Qz
3KL6ND5rEcAPCCw+ykmZ9oLhCmHRysUBbeQCKAB4qMhcKkrtj0aqLj+CM4JlJuEj5GFExLSo44Us
ZyDw0AhhSRebsnIiCO71xRI+XP/VAoA2qpVH54H/ZB722FodwHIlzVkKNhEFexc5p+lkUeTvEg7i
Vm+U2lcXHLYYY/0hgcG0qb+/cmK7ahT3RNaMoyBRLTH38oaZswANhg9sRi1ZsEQr3r49OoQEC2Nh
1adWSnF7Qy6IXDoMzXbptLMP6fJPmPCnj9W84g==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP05_001", key_method="rsa"
`pragma protect encoding = (enctype="base64", line_length=76, bytes=256)
`pragma protect key_block
brM6M5miUz56xsUBJ00lDTFy0b3rDWMAXiCqlEk0RzfvVVti/1B6cJ3+Hfzifju51l7JFNMYi6V7
DJHRJwrihJq5BU56tXsI6RfN+iNkl5Bbfxd8rods1CXFfVAeePsmbRDPB12pr+73aBC25J0tMavP
BAWz+qVq2Dq29ZIkPYITAasBk3MTvLR3N5HoBjb2eO1mGI4IvgkW3QGneQ+z5qlXh0I6kNAVXbYA
8pAzaxSv+ZCg15E/rSKhQJZZy15aDel2SnxHR14A46xaRwroANvGonlsfCv7H1uV7SNedKXdviU8
ZTe1WfxWgMoSmUzw9j3RdECaH0FgJinirV1P4w==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 24912)
`pragma protect data_block
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
8hba
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (weak1, weak0) GSR = GSR_int;
    assign (weak1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
