-- d52cbaca0ef8cf4fd3d6354deb5066970fb6511d02d18d15835e6014ed847fb0
--**************************************************************
--  Copyright (c) 2016 Xilinx, Inc.  All rights reserved.
--  File Name    : xpm_VCOMP.vhd
--  Library      : xpm
--  Release      : 2016.1
--  Entity Count : 13
--**************************************************************

library IEEE;
use IEEE.STD_LOGIC_1164.all;
package VCOMPONENTS is


-- START COMPONENT
----- component xpm_memory_spram  -----
component xpm_memory_spram
  generic (

    -- Common module generics
    MEMORY_SIZE        : integer := 2048            ;
    MEMORY_PRIMITIVE   : string  := "auto"          ;
    ECC_MODE           : string  := "no_ecc"        ;
    MEMORY_INIT_FILE   : string  := "none"          ;
    MEMORY_INIT_PARAM  : string  := ""              ;
    USE_MEM_INIT       : integer := 1               ;
    WAKEUP_TIME        : string  := "disable_sleep" ;
    AUTO_SLEEP_TIME    : integer := 0               ;
    MESSAGE_CONTROL    : integer := 0               ;

    -- Port A module generics
    WRITE_DATA_WIDTH_A : integer := 32           ;
    READ_DATA_WIDTH_A  : integer := 32           ;
    BYTE_WRITE_WIDTH_A : integer := 32           ;
    ADDR_WIDTH_A       : integer := 6            ;
    READ_RESET_VALUE_A : string  := "0"          ;
    READ_LATENCY_A     : integer := 2            ;
    WRITE_MODE_A       : string  := "read_first"

  );
  port (

    -- Common module ports
    sleep          : in  std_logic;

    -- Port A module ports
    clka           : in  std_logic;
    rsta           : in  std_logic;
    ena            : in  std_logic;
    regcea         : in  std_logic;
    wea            : in  std_logic_vector((WRITE_DATA_WIDTH_A/BYTE_WRITE_WIDTH_A)-1 downto 0);
    addra          : in  std_logic_vector(ADDR_WIDTH_A-1 downto 0);
    dina           : in  std_logic_vector(WRITE_DATA_WIDTH_A-1 downto 0);
    injectsbiterra : in  std_logic;
    injectdbiterra : in  std_logic;
    douta          : out std_logic_vector(READ_DATA_WIDTH_A-1 downto 0);
    sbiterra       : out std_logic;
    dbiterra       : out std_logic
  );
end component;

----- component xpm_memory_sdpram -----
component xpm_memory_sdpram
  generic (

    -- Common module generics
    MEMORY_SIZE        : integer := 2048           ;
    MEMORY_PRIMITIVE   : string  := "auto"         ;
    CLOCKING_MODE      : string  := "common_clock" ;
    ECC_MODE           : string  := "no_ecc"       ;
    MEMORY_INIT_FILE   : string  := "none"         ;
    MEMORY_INIT_PARAM  : string  := ""             ;
    USE_MEM_INIT       : integer := 1              ;
    WAKEUP_TIME        : string  := "disable_sleep";
    AUTO_SLEEP_TIME    : integer := 0              ;
    MESSAGE_CONTROL    : integer := 0              ;

    -- Port A module generics
    WRITE_DATA_WIDTH_A : integer := 32 ;
    BYTE_WRITE_WIDTH_A : integer := 32 ;
    ADDR_WIDTH_A       : integer := 6  ;

    -- Port B module generics
    READ_DATA_WIDTH_B  : integer := 32          ;
    ADDR_WIDTH_B       : integer := 6           ;
    READ_RESET_VALUE_B : string  := "0"         ;
    READ_LATENCY_B     : integer := 2           ;
    WRITE_MODE_B       : string  := "no_change"

  );
  port (

    -- Common module ports
    sleep          : in  std_logic;

    -- Port A module ports
    clka           : in  std_logic;
    ena            : in  std_logic;
    wea            : in  std_logic_vector((WRITE_DATA_WIDTH_A/BYTE_WRITE_WIDTH_A)-1 downto 0);
    addra          : in  std_logic_vector(ADDR_WIDTH_A-1 downto 0);
    dina           : in  std_logic_vector(WRITE_DATA_WIDTH_A-1 downto 0);
    injectsbiterra : in  std_logic;
    injectdbiterra : in  std_logic;

    -- Port B module ports
    clkb           : in  std_logic;
    rstb           : in  std_logic;
    enb            : in  std_logic;
    regceb         : in  std_logic;
    addrb          : in  std_logic_vector(ADDR_WIDTH_B-1 downto 0);
    doutb          : out std_logic_vector(READ_DATA_WIDTH_B-1 downto 0);
    sbiterrb       : out std_logic;
    dbiterrb       : out std_logic
  );
end component;

----- component xpm_memory_tdpram -----
component xpm_memory_tdpram
  generic (

    -- Common module generics
    MEMORY_SIZE        : integer := 2048           ;
    MEMORY_PRIMITIVE   : string  := "auto"         ;
    CLOCKING_MODE      : string  := "common_clock" ;
    ECC_MODE           : string  := "no_ecc"       ;
    MEMORY_INIT_FILE   : string  := "none"         ;
    MEMORY_INIT_PARAM  : string  := ""             ;
    USE_MEM_INIT       : integer := 1              ;
    WAKEUP_TIME        : string  := "disable_sleep";
    AUTO_SLEEP_TIME    : integer := 0              ;
    MESSAGE_CONTROL    : integer := 0              ;

    -- Port A module generics
    WRITE_DATA_WIDTH_A : integer := 32          ;
    READ_DATA_WIDTH_A  : integer := 32          ;
    BYTE_WRITE_WIDTH_A : integer := 32          ;
    ADDR_WIDTH_A       : integer := 6           ;
    READ_RESET_VALUE_A : string  := "0"         ;
    READ_LATENCY_A     : integer := 2           ;
    WRITE_MODE_A       : string  := "no_change" ;

    -- Port B module generics
    WRITE_DATA_WIDTH_B : integer := 32         ;
    READ_DATA_WIDTH_B  : integer := 32         ;
    BYTE_WRITE_WIDTH_B : integer := 32         ;
    ADDR_WIDTH_B       : integer := 6          ;
    READ_RESET_VALUE_B : string  := "0"        ;
    READ_LATENCY_B     : integer := 2          ;
    WRITE_MODE_B       : string  := "no_change"

  );
  port (

    -- Common module ports
    sleep          : in  std_logic;

    -- Port A module ports
    clka           : in  std_logic;
    rsta           : in  std_logic;
    ena            : in  std_logic;
    regcea         : in  std_logic;
    wea            : in  std_logic_vector((WRITE_DATA_WIDTH_A/BYTE_WRITE_WIDTH_A)-1 downto 0);
    addra          : in  std_logic_vector(ADDR_WIDTH_A-1 downto 0);
    dina           : in  std_logic_vector(WRITE_DATA_WIDTH_A-1 downto 0);
    injectsbiterra : in  std_logic;
    injectdbiterra : in  std_logic;
    douta          : out std_logic_vector(READ_DATA_WIDTH_A-1 downto 0);
    sbiterra       : out std_logic;
    dbiterra       : out std_logic;

    -- Port B module ports
    clkb           : in  std_logic;
    rstb           : in  std_logic;
    enb            : in  std_logic;
    regceb         : in  std_logic;
    web            : in  std_logic_vector((WRITE_DATA_WIDTH_B/BYTE_WRITE_WIDTH_B)-1 downto 0);
    addrb          : in  std_logic_vector(ADDR_WIDTH_B-1 downto 0);
    dinb           : in  std_logic_vector(WRITE_DATA_WIDTH_B-1 downto 0);
    injectsbiterrb : in  std_logic;
    injectdbiterrb : in  std_logic;
    doutb          : out std_logic_vector(READ_DATA_WIDTH_B-1 downto 0);
    sbiterrb       : out std_logic;
    dbiterrb       : out std_logic
  );
end component;

----- component xpm_memory_sprom -----
component xpm_memory_sprom
  generic (

    -- Common module generics
    MEMORY_SIZE        : integer := 2048           ;
    MEMORY_PRIMITIVE   : string  := "auto"         ;
    ECC_MODE           : string  := "no_ecc"       ;
    MEMORY_INIT_FILE   : string  := "none"         ;
    MEMORY_INIT_PARAM  : string  := ""             ;
    USE_MEM_INIT       : integer := 1              ;
    WAKEUP_TIME        : string  := "disable_sleep";
    AUTO_SLEEP_TIME    : integer := 0              ;
    MESSAGE_CONTROL    : integer := 0              ;

    -- Port A module generics
    READ_DATA_WIDTH_A  : integer := 32  ;
    ADDR_WIDTH_A       : integer := 6   ;
    READ_RESET_VALUE_A : string  := "0" ;
    READ_LATENCY_A     : integer := 2   

  );
  port (

    -- Common module ports
    sleep          : in  std_logic;

    -- Port A module ports
    clka           : in  std_logic;
    rsta           : in  std_logic;
    ena            : in  std_logic;
    regcea         : in  std_logic;
    addra          : in  std_logic_vector(ADDR_WIDTH_A-1 downto 0);
    injectsbiterra : in  std_logic;
    injectdbiterra : in  std_logic;
    douta          : out std_logic_vector(READ_DATA_WIDTH_A-1 downto 0);
    sbiterra       : out std_logic;
    dbiterra       : out std_logic
  );
end component;

----- component xpm_memory_dprom -----
component xpm_memory_dprom
  generic (

    -- Common module generics
    MEMORY_SIZE        : integer := 2048           ;
    MEMORY_PRIMITIVE   : string  := "auto"         ;
    CLOCKING_MODE      : string  := "common_clock" ;
    ECC_MODE           : string  := "no_ecc"       ;
    MEMORY_INIT_FILE   : string  := "none"         ;
    MEMORY_INIT_PARAM  : string  := ""             ;
    USE_MEM_INIT       : integer := 1              ;
    WAKEUP_TIME        : string  := "disable_sleep";
    AUTO_SLEEP_TIME    : integer := 0              ;
    MESSAGE_CONTROL    : integer := 0              ;

    -- Port A module generics
    READ_DATA_WIDTH_A  : integer := 32  ;
    ADDR_WIDTH_A       : integer := 6   ;
    READ_RESET_VALUE_A : string  := "0" ;
    READ_LATENCY_A     : integer := 2   ;

    -- Port B module generics
    READ_DATA_WIDTH_B  : integer := 32  ;
    ADDR_WIDTH_B       : integer := 6   ;
    READ_RESET_VALUE_B : string  := "0" ;
    READ_LATENCY_B     : integer := 2   

  );
  port (

    -- Common module ports
    sleep          : in  std_logic;

    -- Port A module ports
    clka           : in  std_logic;
    rsta           : in  std_logic;
    ena            : in  std_logic;
    regcea         : in  std_logic;
    addra          : in  std_logic_vector(ADDR_WIDTH_A-1 downto 0);
    injectsbiterra : in  std_logic;
    injectdbiterra : in  std_logic;
    douta          : out std_logic_vector(READ_DATA_WIDTH_A-1 downto 0);
    sbiterra       : out std_logic;
    dbiterra       : out std_logic;

    -- Port B module ports
    clkb           : in  std_logic;
    rstb           : in  std_logic;
    enb            : in  std_logic;
    regceb         : in  std_logic;
    addrb          : in  std_logic_vector(ADDR_WIDTH_B-1 downto 0);
    injectsbiterrb : in  std_logic;
    injectdbiterrb : in  std_logic;
    doutb          : out std_logic_vector(READ_DATA_WIDTH_B-1 downto 0);
    sbiterrb       : out std_logic;
    dbiterrb       : out std_logic
  );
end component;

----- component xpm_memory_dpdistram -----
component xpm_memory_dpdistram
  generic (

    -- Common module generics
    MEMORY_SIZE        : integer := 2048          ;
    CLOCKING_MODE      : string  := "common_clock";
    MEMORY_INIT_FILE   : string  := "none"        ;
    MEMORY_INIT_PARAM  : string  := ""            ;
    USE_MEM_INIT       : integer := 1             ;
    MESSAGE_CONTROL    : integer := 0             ;

    -- Port A module generics
    WRITE_DATA_WIDTH_A : integer := 32  ;
    READ_DATA_WIDTH_A  : integer := 32  ;
    BYTE_WRITE_WIDTH_A : integer := 32  ;
    ADDR_WIDTH_A       : integer := 6   ;
    READ_RESET_VALUE_A : string  := "0" ;
    READ_LATENCY_A     : integer := 2   ;

    -- Port B module generics
    READ_DATA_WIDTH_B  : integer := 32  ;
    ADDR_WIDTH_B       : integer := 6   ;
    READ_RESET_VALUE_B : string  := "0" ;
    READ_LATENCY_B     : integer := 2   

  );
  port (

    -- Port A module ports
    clka   : in  std_logic;
    rsta   : in  std_logic;
    ena    : in  std_logic;
    regcea : in  std_logic;
    wea    : in  std_logic_vector((WRITE_DATA_WIDTH_A/BYTE_WRITE_WIDTH_A)-1 downto 0);
    addra  : in  std_logic_vector(ADDR_WIDTH_A-1 downto 0);
    dina   : in  std_logic_vector(WRITE_DATA_WIDTH_A-1 downto 0);
    douta  : out std_logic_vector(READ_DATA_WIDTH_A-1 downto 0);

    -- Port B module ports
    clkb   : in  std_logic;
    rstb   : in  std_logic;
    enb    : in  std_logic;
    regceb : in  std_logic;
    addrb  : in  std_logic_vector(ADDR_WIDTH_B-1 downto 0);
    doutb  : out std_logic_vector(READ_DATA_WIDTH_B-1 downto 0)
  );
end component;

----- component xpm_cdc_single -----
component xpm_cdc_single
  generic (

    -- Common module generics
    DEST_SYNC_FF   : integer := 4;
    SIM_ASSERT_CHK : integer := 0;
    SRC_INPUT_REG  : integer := 1
  );
  port (
    src_clk  : in std_logic;
    src_in   : in std_logic;
    dest_clk : in std_logic;
    dest_out : out std_logic
  );
end component;

----- component xpm_cdc_gray -----
component xpm_cdc_gray
  generic (

    -- Common module generics
    DEST_SYNC_FF          : integer := 4;
    REG_OUTPUT            : integer := 0;       
    SIM_ASSERT_CHK        : integer := 0;
    SIM_LOSSLESS_GRAY_CHK : integer := 0;
    WIDTH                 : integer := 2
  );
  port (

    src_clk      : in std_logic;
    src_in_bin   : in std_logic_vector(WIDTH-1 downto 0);
    dest_clk     : in std_logic;
    dest_out_bin : out std_logic_vector(WIDTH-1 downto 0)
  );
end component;

----- component xpm_cdc_handshake -----
component xpm_cdc_handshake
  generic (

    -- Common module generics
    DEST_EXT_HSK   : integer := 1;
    DEST_SYNC_FF   : integer := 4;
    SIM_ASSERT_CHK : integer := 0;
    SRC_SYNC_FF    : integer := 4;
    WIDTH          : integer := 1
  );
  port (

    src_clk  : in  std_logic;
    src_in   : in  std_logic_vector(WIDTH-1 downto 0);
    src_send : in  std_logic;
    src_rcv  : out std_logic;
    dest_clk : in  std_logic;
    dest_req : out std_logic;
    dest_ack : in  std_logic;
    dest_out : out std_logic_vector(WIDTH-1 downto 0)
  );
end component;

----- component xpm_cdc_pulse -----
component xpm_cdc_pulse
  generic (

    -- Common module generics
    DEST_SYNC_FF   : integer := 4;
    REG_OUTPUT     : integer := 0;    
    RST_USED       : integer := 1;
    SIM_ASSERT_CHK : integer := 0

  );
  port (

    src_clk    : in std_logic;
    src_rst    : in std_logic;
    src_pulse  : in std_logic;
    dest_clk   : in std_logic;
    dest_rst   : in std_logic;
    dest_pulse : out std_logic
  );
end component;

----- component xpm_cdc_array_single -----
component xpm_cdc_array_single
  generic (

    -- Common module generics
    DEST_SYNC_FF   : integer := 4;
    SIM_ASSERT_CHK : integer := 0;
    SRC_INPUT_REG  : integer := 1;
    WIDTH          : integer := 2
  );
  port (

    src_clk  : in std_logic;
    src_in   : in std_logic_vector(WIDTH-1 downto 0);
    dest_clk : in std_logic;
    dest_out : out std_logic_vector(WIDTH-1 downto 0)
  );
end component;

----- component xpm_cdc_sync_rst -----
component xpm_cdc_sync_rst
  generic (

    -- Common module generics
    DEST_SYNC_FF   : integer := 4;
    INIT           : integer := 1;
    SIM_ASSERT_CHK : integer := 0

);
  port (

    src_rst  : in std_logic;
    dest_clk : in std_logic;
    dest_rst : out std_logic
);
end component;

----- component  xpm_cdc_async_rst -----
component xpm_cdc_async_rst
  generic (

    -- Common module parameters
    DEST_SYNC_FF    : integer := 4;
    RST_ACTIVE_HIGH : integer := 0
  );
  port (

    src_arst  : in std_logic;
    dest_clk  : in std_logic;
    dest_arst : out std_logic
  );
end component;

----- component  xpm_fifo_async -----

component xpm_fifo_async
  generic (

    -- Common module generics
    FIFO_MEMORY_TYPE         : string   := "block"; 
    FIFO_WRITE_DEPTH         : integer  := 2048; 
    RELATED_CLOCKS           : integer  := 0; 
    WRITE_DATA_WIDTH         : integer  := 32; 
    READ_MODE                : string   :="std"; 
    FIFO_READ_LATENCY        : integer  := 1; 
    FULL_RESET_VALUE         : integer  := 0; 
    READ_DATA_WIDTH          : integer  := 32; 
    CDC_SYNC_STAGES          : integer  := 2; 
    WR_DATA_COUNT_WIDTH      : integer  := 12;
    PROG_FULL_THRESH         : integer  := 10; 
    RD_DATA_COUNT_WIDTH      : integer  := 12;
    PROG_EMPTY_THRESH        : integer  := 10; 
    DOUT_RESET_VALUE         : string   := "0"; 
    ECC_MODE                 : string   :="no_ecc"; 
    WAKEUP_TIME              : integer  := 0
  );
  port (

    sleep          : in std_logic;  
    rst            : in std_logic;  
    wr_clk         : in std_logic;  
    wr_en          : in std_logic;  
    din            : in std_logic_vector(WRITE_DATA_WIDTH-1 downto 0);  
    full           : out std_logic;  
    prog_full      : out std_logic;  
    wr_data_count  : out std_logic_vector(WR_DATA_COUNT_WIDTH-1 downto 0);  
    overflow       : out std_logic;  
    wr_rst_busy    : out std_logic;  
    rd_clk         : in std_logic;  
    rd_en          : in std_logic;  
    dout           : out std_logic_vector(READ_DATA_WIDTH-1 downto 0);  
    empty          : out std_logic;  
    prog_empty     : out std_logic;  
    rd_data_count  : out std_logic_vector(RD_DATA_COUNT_WIDTH-1 downto 0);  
    underflow      : out std_logic;  
    rd_rst_busy    : out std_logic;  
    injectsbiterr  : in std_logic;  
    injectdbiterr  : in std_logic;  
    sbiterr        : out std_logic;  
    dbiterr        : out std_logic  
  );
end component;

----- component  xpm_fifo_sync -----

component xpm_fifo_sync
  generic (

    -- Common module generics
    FIFO_MEMORY_TYPE         : string   := "block"; 
    FIFO_WRITE_DEPTH         : integer  := 2048; 
    WRITE_DATA_WIDTH         : integer  := 32; 
    READ_MODE                : string   :="std"; 
    FIFO_READ_LATENCY        : integer  := 1; 
    FULL_RESET_VALUE         : integer  := 0; 
    READ_DATA_WIDTH          : integer  := 32; 
    WR_DATA_COUNT_WIDTH      : integer  := 12;
    PROG_FULL_THRESH         : integer  := 10; 
    RD_DATA_COUNT_WIDTH      : integer  := 12;
    PROG_EMPTY_THRESH        : integer  := 10; 
    DOUT_RESET_VALUE         : string   := "0"; 
    ECC_MODE                 : string   :="no_ecc"; 
    WAKEUP_TIME              : integer  := 0 
  );
  port (

    sleep          : in std_logic;  
    rst            : in std_logic;  
    wr_clk         : in std_logic;  
    wr_en          : in std_logic;  
    din            : in std_logic_vector(WRITE_DATA_WIDTH-1 downto 0);  
    full           : out std_logic;  
    prog_full      : out std_logic;  
    wr_data_count  : out std_logic_vector(WR_DATA_COUNT_WIDTH-1 downto 0);  
    overflow       : out std_logic;  
    wr_rst_busy    : out std_logic;  
    rd_en          : in std_logic;  
    dout           : out std_logic_vector(READ_DATA_WIDTH-1 downto 0);  
    empty          : out std_logic;  
    prog_empty     : out std_logic;  
    rd_data_count  : out std_logic_vector(RD_DATA_COUNT_WIDTH-1 downto 0);  
    underflow      : out std_logic;  
    rd_rst_busy    : out std_logic;  
    injectsbiterr  : in std_logic;  
    injectdbiterr  : in std_logic;  
    sbiterr        : out std_logic;  
    dbiterr        : out std_logic  
  );
end component;

-- END COMPONENT

end VCOMPONENTS;


