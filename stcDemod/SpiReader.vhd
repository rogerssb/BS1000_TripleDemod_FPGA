/*
   STARTUPE3_inst : STARTUPE3
   generic map (
      PROG_USR => "FALSE",  -- Activate program event security feature. Requires encrypted bitstreams.
      SIM_CCLK_FREQ => 0.0  -- Set the Configuration Clock Frequency (ns) for simulation
   )
   port map (
      GSR         => '0',     -- 1-bit input: Global Set/Reset input (GSR cannot be used for the port)
      GTS         => '0',     -- 1-bit input: Global 3-state input (GTS cannot be used for the port name)
      KEYCLEARB   => '1',     -- 1-bit input: Clear AES Decrypter Key input from Battery-Backed RAM (BBRAM)
      PACK        => '1',     -- 1-bit input: PROGRAM acknowledge input
      USRCCLKTS   => '0',     -- 1-bit input: User CCLK 3-state enable input
      USRDONEO    => '1',     -- 1-bit input: User DONE pin output control
      USRDONETS   => '1',     -- 1-bit input: User DONE 3-state enable output
      USRCCLKO    => scko,    -- 1-bit input: User CCLK input
      DO          => io_o,    -- 4-bit input: Allows control of the D pin output
      DTS         => io_t,    -- 4-bit input: Allows tristate of the D pin
      FCSBO       => ss_o,    -- 1-bit input: Controls the FCS_B pin for flash access
      FCSBTS      => ss_t,    -- 1-bit input: Tristate the FCS_B pin
      DI          => io_i,    -- 4-bit output: Allow receiving on the D input pin
      EOS         => open,    -- 1-bit output: Active-High output signal indicating the End Of Startup
      PREQ        => open,    -- 1-bit output: PROGRAM request to fabric output
      CFGCLK      => open,    -- 1-bit output: Configuration main clock output
      CFGMCLK     => open     -- 1-bit output: Configuration internal oscillator clock output
   );

   QuadSpi : axi_quad_spi_0
     PORT MAP (
       ext_spi_clk => ext_spi_clk,
       s_axi_aclk => s_axi_aclk,
       s_axi_aresetn => s_axi_aresetn,
       s_axi_awaddr => s_axi_awaddr,
       s_axi_awvalid => s_axi_awvalid,
       s_axi_awready => s_axi_awready,
       s_axi_wdata => s_axi_wdata,
       s_axi_wstrb => s_axi_wstrb,
       s_axi_wvalid => s_axi_wvalid,
       s_axi_wready => s_axi_wready,
       s_axi_bresp => s_axi_bresp,
       s_axi_bvalid => s_axi_bvalid,
       s_axi_bready => s_axi_bready,
       s_axi_araddr => s_axi_araddr,
       s_axi_arvalid => s_axi_arvalid,
       s_axi_arready => s_axi_arready,
       s_axi_rdata => s_axi_rdata,
       s_axi_rresp => s_axi_rresp,
       s_axi_rvalid => s_axi_rvalid,
       s_axi_rready => s_axi_rready,
       io0_i => io_i(0),
       io0_o => io_o(0),
       io0_t => io_t(0),
       io1_i => io_i(1),
       io1_o => io_o(1),
       io1_t => io_t(1),
       io2_i => io_i(2),
       io2_o => io_o(2),
       io2_t => io_t(2),
       io3_i => io_i(3),
       io3_o => io_o(3),
       io3_t => io_t(3),
       sck_i => sck_i,
       sck_o => sck_o,
       sck_t => sck_t,
       ss_i => ss_i,
       ss_o => ss_o,
       ss_t => ss_t,
       ip2intc_irpt => ip2intc_irpt
     );
*/