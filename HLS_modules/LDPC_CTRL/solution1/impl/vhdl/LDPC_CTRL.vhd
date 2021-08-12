-- ==============================================================
-- RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
-- Version: 2016.3
-- Copyright (C) 1986-2016 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity LDPC_CTRL is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    block_V : IN STD_LOGIC_VECTOR (1 downto 0);
    code_V : IN STD_LOGIC_VECTOR (1 downto 0);
    run : IN STD_LOGIC;
    init_start : OUT STD_LOGIC;
    init_start_ap_vld : OUT STD_LOGIC;
    init_done : IN STD_LOGIC;
    init_ready : IN STD_LOGIC;
    buff_start : OUT STD_LOGIC;
    buff_start_ap_vld : OUT STD_LOGIC;
    status_V : OUT STD_LOGIC_VECTOR (1 downto 0);
    status_V_ap_vld : OUT STD_LOGIC;
    err_code : OUT STD_LOGIC_VECTOR (15 downto 0);
    err_code_ap_vld : OUT STD_LOGIC;
    size_V : OUT STD_LOGIC_VECTOR (1 downto 0);
    size_V_ap_vld : OUT STD_LOGIC;
    rate_V : OUT STD_LOGIC_VECTOR (1 downto 0);
    rate_V_ap_vld : OUT STD_LOGIC;
    buff_reset : OUT STD_LOGIC;
    buff_reset_ap_vld : OUT STD_LOGIC );
end;


architecture behav of LDPC_CTRL is 
    attribute CORE_GENERATION_INFO : STRING;
    attribute CORE_GENERATION_INFO of behav : architecture is
    "LDPC_CTRL,hls_ip_2016_3,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=1,HLS_INPUT_PART=xc7k160tffv676-2,HLS_INPUT_CLOCK=10.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=1.474000,HLS_SYN_LAT=0,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=0,HLS_SYN_FF=17,HLS_SYN_LUT=39}";
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_state1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv16_0 : STD_LOGIC_VECTOR (15 downto 0) := "0000000000000000";
    constant ap_const_lv16_1 : STD_LOGIC_VECTOR (15 downto 0) := "0000000000000001";
    constant ap_const_lv16_2 : STD_LOGIC_VECTOR (15 downto 0) := "0000000000000010";
    constant ap_const_lv16_3 : STD_LOGIC_VECTOR (15 downto 0) := "0000000000000011";
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv6_0 : STD_LOGIC_VECTOR (5 downto 0) := "000000";
    constant ap_const_lv6_A : STD_LOGIC_VECTOR (5 downto 0) := "001010";
    constant ap_const_lv6_1 : STD_LOGIC_VECTOR (5 downto 0) := "000001";
    constant ap_const_lv6_3 : STD_LOGIC_VECTOR (5 downto 0) := "000011";
    constant ap_const_lv6_2 : STD_LOGIC_VECTOR (5 downto 0) := "000010";
    constant ap_const_lv2_0 : STD_LOGIC_VECTOR (1 downto 0) := "00";
    constant ap_const_lv2_1 : STD_LOGIC_VECTOR (1 downto 0) := "01";
    constant ap_const_lv2_2 : STD_LOGIC_VECTOR (1 downto 0) := "10";
    constant ap_const_boolean_1 : BOOLEAN := true;

    signal ap_CS_fsm : STD_LOGIC_VECTOR (0 downto 0) := "1";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_state1 : STD_LOGIC_VECTOR (0 downto 0);
    attribute fsm_encoding of ap_CS_fsm_state1 : signal is "none";
    signal state : STD_LOGIC_VECTOR (15 downto 0) := "0000000000001010";
    signal run_read_read_fu_84_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal state_flag_6_phi_fu_168_p20 : STD_LOGIC_VECTOR (0 downto 0);
    signal state_load_load_fu_235_p1 : STD_LOGIC_VECTOR (15 downto 0);
    signal or_cond1_fu_263_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal init_ready_read_read_fu_72_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal init_done_read_read_fu_78_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal state_new_6_phi_fu_203_p20 : STD_LOGIC_VECTOR (5 downto 0);
    signal state_new_6_cast_fu_269_p1 : STD_LOGIC_VECTOR (15 downto 0);
    signal notrhs_fu_245_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal notlhs_fu_239_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal or_cond_not_fu_251_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_3_fu_257_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_NS_fsm : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_condition_65 : BOOLEAN;


begin




    ap_CS_fsm_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_CS_fsm <= ap_ST_fsm_state1;
            else
                ap_CS_fsm <= ap_NS_fsm;
            end if;
        end if;
    end process;

    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_CS_fsm_state1 = ap_const_lv1_1) and not((ap_start = ap_const_logic_0)) and not((state_flag_6_phi_fu_168_p20 = ap_const_lv1_0)))) then
                state <= state_new_6_cast_fu_269_p1;
            end if;
        end if;
    end process;

    ap_NS_fsm_assign_proc : process (ap_start, ap_CS_fsm)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_state1 => 
                ap_NS_fsm <= ap_ST_fsm_state1;
            when others =>  
                ap_NS_fsm <= "X";
        end case;
    end process;
    ap_CS_fsm_state1 <= ap_CS_fsm(0 downto 0);

    ap_condition_65_assign_proc : process(state_load_load_fu_235_p1)
    begin
                ap_condition_65 <= (not((state_load_load_fu_235_p1 = ap_const_lv16_0)) and not((state_load_load_fu_235_p1 = ap_const_lv16_1)) and not((state_load_load_fu_235_p1 = ap_const_lv16_2)) and not((state_load_load_fu_235_p1 = ap_const_lv16_3)));
    end process;


    ap_done_assign_proc : process(ap_start, ap_CS_fsm_state1)
    begin
        if (((ap_CS_fsm_state1 = ap_const_lv1_1) and not((ap_start = ap_const_logic_0)))) then 
            ap_done <= ap_const_logic_1;
        else 
            ap_done <= ap_const_logic_0;
        end if; 
    end process;


    ap_idle_assign_proc : process(ap_start, ap_CS_fsm_state1)
    begin
        if (((ap_const_logic_0 = ap_start) and (ap_CS_fsm_state1 = ap_const_lv1_1))) then 
            ap_idle <= ap_const_logic_1;
        else 
            ap_idle <= ap_const_logic_0;
        end if; 
    end process;


    ap_ready_assign_proc : process(ap_start, ap_CS_fsm_state1)
    begin
        if (((ap_CS_fsm_state1 = ap_const_lv1_1) and not((ap_start = ap_const_logic_0)))) then 
            ap_ready <= ap_const_logic_1;
        else 
            ap_ready <= ap_const_logic_0;
        end if; 
    end process;


    buff_reset_assign_proc : process(ap_start, ap_CS_fsm_state1, state_load_load_fu_235_p1, or_cond1_fu_263_p2, ap_condition_65)
    begin
        if (((ap_CS_fsm_state1 = ap_const_lv1_1) and not((ap_start = ap_const_logic_0)))) then
            if ((ap_condition_65 = ap_const_boolean_1)) then 
                buff_reset <= ap_const_logic_1;
            elsif (((state_load_load_fu_235_p1 = ap_const_lv16_0) and (or_cond1_fu_263_p2 = ap_const_lv1_0))) then 
                buff_reset <= ap_const_logic_0;
            else 
                buff_reset <= 'X';
            end if;
        else 
            buff_reset <= 'X';
        end if; 
    end process;


    buff_reset_ap_vld_assign_proc : process(ap_start, ap_CS_fsm_state1, state_load_load_fu_235_p1, or_cond1_fu_263_p2)
    begin
        if ((((ap_CS_fsm_state1 = ap_const_lv1_1) and not((ap_start = ap_const_logic_0)) and not((state_load_load_fu_235_p1 = ap_const_lv16_0)) and not((state_load_load_fu_235_p1 = ap_const_lv16_1)) and not((state_load_load_fu_235_p1 = ap_const_lv16_2)) and not((state_load_load_fu_235_p1 = ap_const_lv16_3))) or ((ap_CS_fsm_state1 = ap_const_lv1_1) and not((ap_start = ap_const_logic_0)) and (state_load_load_fu_235_p1 = ap_const_lv16_0) and (or_cond1_fu_263_p2 = ap_const_lv1_0)))) then 
            buff_reset_ap_vld <= ap_const_logic_1;
        else 
            buff_reset_ap_vld <= ap_const_logic_0;
        end if; 
    end process;


    buff_start_assign_proc : process(ap_start, ap_CS_fsm_state1, run_read_read_fu_84_p2, state_load_load_fu_235_p1, init_ready_read_read_fu_72_p2, init_done_read_read_fu_78_p2)
    begin
        if ((((ap_CS_fsm_state1 = ap_const_lv1_1) and not((ap_start = ap_const_logic_0)) and (state_load_load_fu_235_p1 = ap_const_lv16_1) and not((ap_const_lv1_0 = init_done_read_read_fu_78_p2)) and not((ap_const_lv1_0 = init_ready_read_read_fu_72_p2))) or ((ap_CS_fsm_state1 = ap_const_lv1_1) and not((ap_start = ap_const_logic_0)) and (state_load_load_fu_235_p1 = ap_const_lv16_2) and not((ap_const_lv1_0 = init_done_read_read_fu_78_p2))))) then 
            buff_start <= ap_const_logic_1;
        elsif ((((ap_CS_fsm_state1 = ap_const_lv1_1) and not((ap_start = ap_const_logic_0)) and not((state_load_load_fu_235_p1 = ap_const_lv16_0)) and not((state_load_load_fu_235_p1 = ap_const_lv16_1)) and not((state_load_load_fu_235_p1 = ap_const_lv16_2)) and not((state_load_load_fu_235_p1 = ap_const_lv16_3))) or ((ap_CS_fsm_state1 = ap_const_lv1_1) and not((ap_start = ap_const_logic_0)) and (state_load_load_fu_235_p1 = ap_const_lv16_3) and (run_read_read_fu_84_p2 = ap_const_lv1_0)))) then 
            buff_start <= ap_const_logic_0;
        else 
            buff_start <= 'X';
        end if; 
    end process;


    buff_start_ap_vld_assign_proc : process(ap_start, ap_CS_fsm_state1, run_read_read_fu_84_p2, state_load_load_fu_235_p1, init_ready_read_read_fu_72_p2, init_done_read_read_fu_78_p2)
    begin
        if ((((ap_CS_fsm_state1 = ap_const_lv1_1) and not((ap_start = ap_const_logic_0)) and not((state_load_load_fu_235_p1 = ap_const_lv16_0)) and not((state_load_load_fu_235_p1 = ap_const_lv16_1)) and not((state_load_load_fu_235_p1 = ap_const_lv16_2)) and not((state_load_load_fu_235_p1 = ap_const_lv16_3))) or ((ap_CS_fsm_state1 = ap_const_lv1_1) and not((ap_start = ap_const_logic_0)) and (state_load_load_fu_235_p1 = ap_const_lv16_1) and not((ap_const_lv1_0 = init_done_read_read_fu_78_p2)) and not((ap_const_lv1_0 = init_ready_read_read_fu_72_p2))) or ((ap_CS_fsm_state1 = ap_const_lv1_1) and not((ap_start = ap_const_logic_0)) and (state_load_load_fu_235_p1 = ap_const_lv16_2) and not((ap_const_lv1_0 = init_done_read_read_fu_78_p2))) or ((ap_CS_fsm_state1 = ap_const_lv1_1) and not((ap_start = ap_const_logic_0)) and (state_load_load_fu_235_p1 = ap_const_lv16_3) and (run_read_read_fu_84_p2 = ap_const_lv1_0)))) then 
            buff_start_ap_vld <= ap_const_logic_1;
        else 
            buff_start_ap_vld <= ap_const_logic_0;
        end if; 
    end process;


    err_code_assign_proc : process(ap_start, ap_CS_fsm_state1, state_load_load_fu_235_p1, or_cond1_fu_263_p2, ap_condition_65)
    begin
        if (((ap_CS_fsm_state1 = ap_const_lv1_1) and not((ap_start = ap_const_logic_0)))) then
            if ((ap_condition_65 = ap_const_boolean_1)) then 
                err_code <= ap_const_lv16_0;
            elsif (((state_load_load_fu_235_p1 = ap_const_lv16_0) and not((or_cond1_fu_263_p2 = ap_const_lv1_0)))) then 
                err_code <= ap_const_lv16_3;
            else 
                err_code <= "XXXXXXXXXXXXXXXX";
            end if;
        else 
            err_code <= "XXXXXXXXXXXXXXXX";
        end if; 
    end process;


    err_code_ap_vld_assign_proc : process(ap_start, ap_CS_fsm_state1, state_load_load_fu_235_p1, or_cond1_fu_263_p2)
    begin
        if ((((ap_CS_fsm_state1 = ap_const_lv1_1) and not((ap_start = ap_const_logic_0)) and not((state_load_load_fu_235_p1 = ap_const_lv16_0)) and not((state_load_load_fu_235_p1 = ap_const_lv16_1)) and not((state_load_load_fu_235_p1 = ap_const_lv16_2)) and not((state_load_load_fu_235_p1 = ap_const_lv16_3))) or ((ap_CS_fsm_state1 = ap_const_lv1_1) and not((ap_start = ap_const_logic_0)) and (state_load_load_fu_235_p1 = ap_const_lv16_0) and not((or_cond1_fu_263_p2 = ap_const_lv1_0))))) then 
            err_code_ap_vld <= ap_const_logic_1;
        else 
            err_code_ap_vld <= ap_const_logic_0;
        end if; 
    end process;

    init_done_read_read_fu_78_p2 <= (0=>init_done, others=>'-');
    init_ready_read_read_fu_72_p2 <= (0=>init_ready, others=>'-');

    init_start_assign_proc : process(ap_start, ap_CS_fsm_state1, state_load_load_fu_235_p1, or_cond1_fu_263_p2, init_ready_read_read_fu_72_p2)
    begin
        if (((ap_CS_fsm_state1 = ap_const_lv1_1) and not((ap_start = ap_const_logic_0)) and (state_load_load_fu_235_p1 = ap_const_lv16_0) and (or_cond1_fu_263_p2 = ap_const_lv1_0))) then 
            init_start <= ap_const_logic_1;
        elsif ((((ap_CS_fsm_state1 = ap_const_lv1_1) and not((ap_start = ap_const_logic_0)) and not((state_load_load_fu_235_p1 = ap_const_lv16_0)) and not((state_load_load_fu_235_p1 = ap_const_lv16_1)) and not((state_load_load_fu_235_p1 = ap_const_lv16_2)) and not((state_load_load_fu_235_p1 = ap_const_lv16_3))) or ((ap_CS_fsm_state1 = ap_const_lv1_1) and not((ap_start = ap_const_logic_0)) and (state_load_load_fu_235_p1 = ap_const_lv16_1) and not((ap_const_lv1_0 = init_ready_read_read_fu_72_p2))))) then 
            init_start <= ap_const_logic_0;
        else 
            init_start <= 'X';
        end if; 
    end process;


    init_start_ap_vld_assign_proc : process(ap_start, ap_CS_fsm_state1, state_load_load_fu_235_p1, or_cond1_fu_263_p2, init_ready_read_read_fu_72_p2)
    begin
        if ((((ap_CS_fsm_state1 = ap_const_lv1_1) and not((ap_start = ap_const_logic_0)) and not((state_load_load_fu_235_p1 = ap_const_lv16_0)) and not((state_load_load_fu_235_p1 = ap_const_lv16_1)) and not((state_load_load_fu_235_p1 = ap_const_lv16_2)) and not((state_load_load_fu_235_p1 = ap_const_lv16_3))) or ((ap_CS_fsm_state1 = ap_const_lv1_1) and not((ap_start = ap_const_logic_0)) and (state_load_load_fu_235_p1 = ap_const_lv16_0) and (or_cond1_fu_263_p2 = ap_const_lv1_0)) or ((ap_CS_fsm_state1 = ap_const_lv1_1) and not((ap_start = ap_const_logic_0)) and (state_load_load_fu_235_p1 = ap_const_lv16_1) and not((ap_const_lv1_0 = init_ready_read_read_fu_72_p2))))) then 
            init_start_ap_vld <= ap_const_logic_1;
        else 
            init_start_ap_vld <= ap_const_logic_0;
        end if; 
    end process;

    notlhs_fu_239_p2 <= "0" when (block_V = ap_const_lv2_1) else "1";
    notrhs_fu_245_p2 <= "0" when (block_V = ap_const_lv2_2) else "1";
    or_cond1_fu_263_p2 <= (or_cond_not_fu_251_p2 or tmp_3_fu_257_p2);
    or_cond_not_fu_251_p2 <= (notrhs_fu_245_p2 and notlhs_fu_239_p2);

    rate_V_assign_proc : process(ap_start, ap_CS_fsm_state1, code_V, state_load_load_fu_235_p1, or_cond1_fu_263_p2, ap_condition_65)
    begin
        if (((ap_CS_fsm_state1 = ap_const_lv1_1) and not((ap_start = ap_const_logic_0)))) then
            if ((ap_condition_65 = ap_const_boolean_1)) then 
                rate_V <= ap_const_lv2_0;
            elsif (((state_load_load_fu_235_p1 = ap_const_lv16_0) and (or_cond1_fu_263_p2 = ap_const_lv1_0))) then 
                rate_V <= code_V;
            else 
                rate_V <= "XX";
            end if;
        else 
            rate_V <= "XX";
        end if; 
    end process;


    rate_V_ap_vld_assign_proc : process(ap_start, ap_CS_fsm_state1, state_load_load_fu_235_p1, or_cond1_fu_263_p2)
    begin
        if ((((ap_CS_fsm_state1 = ap_const_lv1_1) and not((ap_start = ap_const_logic_0)) and not((state_load_load_fu_235_p1 = ap_const_lv16_0)) and not((state_load_load_fu_235_p1 = ap_const_lv16_1)) and not((state_load_load_fu_235_p1 = ap_const_lv16_2)) and not((state_load_load_fu_235_p1 = ap_const_lv16_3))) or ((ap_CS_fsm_state1 = ap_const_lv1_1) and not((ap_start = ap_const_logic_0)) and (state_load_load_fu_235_p1 = ap_const_lv16_0) and (or_cond1_fu_263_p2 = ap_const_lv1_0)))) then 
            rate_V_ap_vld <= ap_const_logic_1;
        else 
            rate_V_ap_vld <= ap_const_logic_0;
        end if; 
    end process;

    run_read_read_fu_84_p2 <= (0=>run, others=>'-');

    size_V_assign_proc : process(ap_start, ap_CS_fsm_state1, block_V, state_load_load_fu_235_p1, or_cond1_fu_263_p2, ap_condition_65)
    begin
        if (((ap_CS_fsm_state1 = ap_const_lv1_1) and not((ap_start = ap_const_logic_0)))) then
            if ((ap_condition_65 = ap_const_boolean_1)) then 
                size_V <= ap_const_lv2_0;
            elsif (((state_load_load_fu_235_p1 = ap_const_lv16_0) and (or_cond1_fu_263_p2 = ap_const_lv1_0))) then 
                size_V <= block_V;
            else 
                size_V <= "XX";
            end if;
        else 
            size_V <= "XX";
        end if; 
    end process;


    size_V_ap_vld_assign_proc : process(ap_start, ap_CS_fsm_state1, state_load_load_fu_235_p1, or_cond1_fu_263_p2)
    begin
        if ((((ap_CS_fsm_state1 = ap_const_lv1_1) and not((ap_start = ap_const_logic_0)) and not((state_load_load_fu_235_p1 = ap_const_lv16_0)) and not((state_load_load_fu_235_p1 = ap_const_lv16_1)) and not((state_load_load_fu_235_p1 = ap_const_lv16_2)) and not((state_load_load_fu_235_p1 = ap_const_lv16_3))) or ((ap_CS_fsm_state1 = ap_const_lv1_1) and not((ap_start = ap_const_logic_0)) and (state_load_load_fu_235_p1 = ap_const_lv16_0) and (or_cond1_fu_263_p2 = ap_const_lv1_0)))) then 
            size_V_ap_vld <= ap_const_logic_1;
        else 
            size_V_ap_vld <= ap_const_logic_0;
        end if; 
    end process;


    state_flag_6_phi_fu_168_p20_assign_proc : process(ap_CS_fsm_state1, run, run_read_read_fu_84_p2, state_load_load_fu_235_p1, or_cond1_fu_263_p2, init_ready_read_read_fu_72_p2, init_done_read_read_fu_78_p2)
    begin
        if ((((ap_CS_fsm_state1 = ap_const_lv1_1) and (state_load_load_fu_235_p1 = ap_const_lv16_1) and (ap_const_lv1_0 = init_ready_read_read_fu_72_p2)) or ((ap_CS_fsm_state1 = ap_const_lv1_1) and (state_load_load_fu_235_p1 = ap_const_lv16_2) and (ap_const_lv1_0 = init_done_read_read_fu_78_p2)) or ((ap_CS_fsm_state1 = ap_const_lv1_1) and (state_load_load_fu_235_p1 = ap_const_lv16_3) and not((run_read_read_fu_84_p2 = ap_const_lv1_0))))) then 
            state_flag_6_phi_fu_168_p20 <= ap_const_lv1_0;
        elsif ((((ap_CS_fsm_state1 = ap_const_lv1_1) and (state_load_load_fu_235_p1 = ap_const_lv16_0) and not((or_cond1_fu_263_p2 = ap_const_lv1_0))) or ((ap_CS_fsm_state1 = ap_const_lv1_1) and (state_load_load_fu_235_p1 = ap_const_lv16_0) and (or_cond1_fu_263_p2 = ap_const_lv1_0)) or ((ap_CS_fsm_state1 = ap_const_lv1_1) and (state_load_load_fu_235_p1 = ap_const_lv16_1) and not((ap_const_lv1_0 = init_done_read_read_fu_78_p2)) and not((ap_const_lv1_0 = init_ready_read_read_fu_72_p2))) or ((ap_CS_fsm_state1 = ap_const_lv1_1) and (state_load_load_fu_235_p1 = ap_const_lv16_1) and (ap_const_lv1_0 = init_done_read_read_fu_78_p2) and not((ap_const_lv1_0 = init_ready_read_read_fu_72_p2))) or ((ap_CS_fsm_state1 = ap_const_lv1_1) and (state_load_load_fu_235_p1 = ap_const_lv16_2) and not((ap_const_lv1_0 = init_done_read_read_fu_78_p2))) or ((ap_CS_fsm_state1 = ap_const_lv1_1) and (state_load_load_fu_235_p1 = ap_const_lv16_3) and (run_read_read_fu_84_p2 = ap_const_lv1_0)))) then 
            state_flag_6_phi_fu_168_p20 <= ap_const_lv1_1;
        elsif (((ap_CS_fsm_state1 = ap_const_lv1_1) and not((state_load_load_fu_235_p1 = ap_const_lv16_0)) and not((state_load_load_fu_235_p1 = ap_const_lv16_1)) and not((state_load_load_fu_235_p1 = ap_const_lv16_2)) and not((state_load_load_fu_235_p1 = ap_const_lv16_3)))) then 
            state_flag_6_phi_fu_168_p20 <= (0=>run, others=>'-');
        else 
            state_flag_6_phi_fu_168_p20 <= "X";
        end if; 
    end process;

    state_load_load_fu_235_p1 <= state;
        state_new_6_cast_fu_269_p1 <= std_logic_vector(resize(signed(state_new_6_phi_fu_203_p20),16));


    state_new_6_phi_fu_203_p20_assign_proc : process(ap_CS_fsm_state1, run_read_read_fu_84_p2, state_load_load_fu_235_p1, or_cond1_fu_263_p2, init_ready_read_read_fu_72_p2, init_done_read_read_fu_78_p2)
    begin
        if (((ap_CS_fsm_state1 = ap_const_lv1_1) and (state_load_load_fu_235_p1 = ap_const_lv16_1) and (ap_const_lv1_0 = init_done_read_read_fu_78_p2) and not((ap_const_lv1_0 = init_ready_read_read_fu_72_p2)))) then 
            state_new_6_phi_fu_203_p20 <= ap_const_lv6_2;
        elsif ((((ap_CS_fsm_state1 = ap_const_lv1_1) and (state_load_load_fu_235_p1 = ap_const_lv16_1) and not((ap_const_lv1_0 = init_done_read_read_fu_78_p2)) and not((ap_const_lv1_0 = init_ready_read_read_fu_72_p2))) or ((ap_CS_fsm_state1 = ap_const_lv1_1) and (state_load_load_fu_235_p1 = ap_const_lv16_2) and not((ap_const_lv1_0 = init_done_read_read_fu_78_p2))) or ((ap_CS_fsm_state1 = ap_const_lv1_1) and (state_load_load_fu_235_p1 = ap_const_lv16_2) and (ap_const_lv1_0 = init_done_read_read_fu_78_p2)))) then 
            state_new_6_phi_fu_203_p20 <= ap_const_lv6_3;
        elsif (((ap_CS_fsm_state1 = ap_const_lv1_1) and (state_load_load_fu_235_p1 = ap_const_lv16_0) and (or_cond1_fu_263_p2 = ap_const_lv1_0))) then 
            state_new_6_phi_fu_203_p20 <= ap_const_lv6_1;
        elsif ((((ap_CS_fsm_state1 = ap_const_lv1_1) and (state_load_load_fu_235_p1 = ap_const_lv16_0) and not((or_cond1_fu_263_p2 = ap_const_lv1_0))) or ((ap_CS_fsm_state1 = ap_const_lv1_1) and (state_load_load_fu_235_p1 = ap_const_lv16_3) and not((run_read_read_fu_84_p2 = ap_const_lv1_0))) or ((ap_CS_fsm_state1 = ap_const_lv1_1) and (state_load_load_fu_235_p1 = ap_const_lv16_3) and (run_read_read_fu_84_p2 = ap_const_lv1_0)))) then 
            state_new_6_phi_fu_203_p20 <= ap_const_lv6_A;
        elsif (((ap_CS_fsm_state1 = ap_const_lv1_1) and not((state_load_load_fu_235_p1 = ap_const_lv16_0)) and not((state_load_load_fu_235_p1 = ap_const_lv16_1)) and not((state_load_load_fu_235_p1 = ap_const_lv16_2)) and not((state_load_load_fu_235_p1 = ap_const_lv16_3)))) then 
            state_new_6_phi_fu_203_p20 <= ap_const_lv6_0;
        else 
            state_new_6_phi_fu_203_p20 <= "XXXXXX";
        end if; 
    end process;


    status_V_assign_proc : process(ap_start, ap_CS_fsm_state1, state_load_load_fu_235_p1, or_cond1_fu_263_p2, ap_condition_65)
    begin
        if (((ap_CS_fsm_state1 = ap_const_lv1_1) and not((ap_start = ap_const_logic_0)))) then
            if ((ap_condition_65 = ap_const_boolean_1)) then 
                status_V <= ap_const_lv2_0;
            elsif (((state_load_load_fu_235_p1 = ap_const_lv16_0) and (or_cond1_fu_263_p2 = ap_const_lv1_0))) then 
                status_V <= ap_const_lv2_1;
            else 
                status_V <= "XX";
            end if;
        else 
            status_V <= "XX";
        end if; 
    end process;


    status_V_ap_vld_assign_proc : process(ap_start, ap_CS_fsm_state1, state_load_load_fu_235_p1, or_cond1_fu_263_p2)
    begin
        if ((((ap_CS_fsm_state1 = ap_const_lv1_1) and not((ap_start = ap_const_logic_0)) and not((state_load_load_fu_235_p1 = ap_const_lv16_0)) and not((state_load_load_fu_235_p1 = ap_const_lv16_1)) and not((state_load_load_fu_235_p1 = ap_const_lv16_2)) and not((state_load_load_fu_235_p1 = ap_const_lv16_3))) or ((ap_CS_fsm_state1 = ap_const_lv1_1) and not((ap_start = ap_const_logic_0)) and (state_load_load_fu_235_p1 = ap_const_lv16_0) and (or_cond1_fu_263_p2 = ap_const_lv1_0)))) then 
            status_V_ap_vld <= ap_const_logic_1;
        else 
            status_V_ap_vld <= ap_const_logic_0;
        end if; 
    end process;

    tmp_3_fu_257_p2 <= "1" when (code_V = ap_const_lv2_0) else "0";
end behav;
