`timescale 1ns / 10 ps

module xilinxViterbi9p1 (
     input              aclk,
                        aresetn,
                        s_axis_data_tvalid,
                        s_axis_dstat_tvalid,
     input  [15:0]   	s_axis_dstat_tdata,
                        s_axis_data_tdata,
     output reg         s_axis_data_tready,
                        m_axis_data_tvalid,
                        m_axis_dstat_tvalid,
    output reg [7:0]    m_axis_data_tdata,
    output reg [15:0]   m_axis_dstat_tdata
    );

    always @(posedge aclk) begin
        s_axis_data_tready  <= aresetn;
        m_axis_data_tvalid  <= s_axis_data_tvalid;
        m_axis_dstat_tvalid <= s_axis_dstat_tvalid;
        m_axis_data_tdata   <= s_axis_dstat_tdata[7:0];
        m_axis_dstat_tdata  <= s_axis_dstat_tdata;
    end

endmodule