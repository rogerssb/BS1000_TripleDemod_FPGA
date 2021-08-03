-- Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2016.4 (win64) Build 1756540 Mon Jan 23 19:11:23 MST 2017
-- Date        : Wed Sep 18 17:56:16 2019
-- Host        : scottAlien running 64-bit Service Pack 1  (build 7601)
-- Command     : write_vhdl -force -mode synth_stub
--               C:/modem/vivado/tripleDemod.srcs/sources_1/ip/hbf_fft_0/hbf_fft_0_stub.vhdl
-- Design      : hbf_fft_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7k160tfbg676-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity hbf_fft_0 is
  Port ( 
    datain : in STD_LOGIC_VECTOR ( 13 downto 0 );
    nfft : in STD_LOGIC_VECTOR ( 4 downto 0 );
    nfftwe : in STD_LOGIC_VECTOR ( 0 to 0 );
    rstfifo : in STD_LOGIC_VECTOR ( 0 to 0 );
    scalesch : in STD_LOGIC_VECTOR ( 11 downto 0 );
    spectinv : in STD_LOGIC_VECTOR ( 0 to 0 );
    startn : in STD_LOGIC_VECTOR ( 0 to 0 );
    window : in STD_LOGIC_VECTOR ( 15 downto 0 );
    clk : in STD_LOGIC;
    fifofull_i : out STD_LOGIC_VECTOR ( 0 to 0 );
    fifofull_q : out STD_LOGIC_VECTOR ( 0 to 0 );
    idata : out STD_LOGIC_VECTOR ( 18 downto 0 );
    n : out STD_LOGIC_VECTOR ( 12 downto 0 );
    qdata : out STD_LOGIC_VECTOR ( 15 downto 0 );
    fft_axis_tuser_xk_index_d : out STD_LOGIC_VECTOR ( 11 downto 0 );
    fft_mag_finished : out STD_LOGIC_VECTOR ( 0 to 0 );
    fft_mag_m_axis_data_tlast : out STD_LOGIC_VECTOR ( 0 to 0 );
    fft_mag_m_axis_dout_tvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    fft_mag_m_axis_tdata_real : out STD_LOGIC_VECTOR ( 15 downto 0 );
    index_k : out STD_LOGIC_VECTOR ( 12 downto 0 );
    ce2 : out STD_LOGIC_VECTOR ( 0 to 0 )
  );

end hbf_fft_0;

architecture stub of hbf_fft_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "datain[13:0],nfft[4:0],nfftwe[0:0],rstfifo[0:0],scalesch[11:0],spectinv[0:0],startn[0:0],window[15:0],clk,fifofull_i[0:0],fifofull_q[0:0],idata[18:0],n[12:0],qdata[15:0],fft_axis_tuser_xk_index_d[11:0],fft_mag_finished[0:0],fft_mag_m_axis_data_tlast[0:0],fft_mag_m_axis_dout_tvalid[0:0],fft_mag_m_axis_tdata_real[15:0],index_k[12:0],ce2[0:0]";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "hbf_fft,Vivado 2016.4";
begin
end;
