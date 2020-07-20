/*-------------------------------------------------------------------------------
                  PROPRIETARY NOTICE
----------------------------------------------------------------------------
(c) Copyright 2014 Semco Inc. All rights reserved.

This file contains Semco Inc. proprietary information. It is the
property of Semco Inc. and shall not be used, disclosed to others or
reproduced without the express written consent of Semco Inc.,
including, but without limitation, it is not to be used in the creation,
manufacture, development, or derivation of any designs, or configuration.

----------------------------------------------------------------------------

Company:     Semco Inc.

Module Name: ModuleName.vhd
Description:

ARGUMENTS :


Dependencies:

----------------------------------------------------------------------------
                               DETAILS
----------------------------------------------------------------------------

----------------------------------------------------------------------------
                               HISTORY
----------------------------------------------------------------------------
9-6-16 Initial release FZ
-------------------------------------------------------------
*/

LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
library std;
use std.textio.all;
use work.fixed_pkg.all;
USE IEEE.math_real.all;
USE work.Semco_pkg.ALL;

ENTITY FftTb IS
   PORT(
      Clk2x,
      reset2x,
      ce,
      FftTLastIn,
      ValidPack         : IN  std_logic;
      PackI,
      PackR             : OUT sfixed(0 downto -17);
      FftOutSlv         : OUT std_logic_vector(63 downto 0);
      ConfigTReady,
      ValidFft,
      FftReady,
      FftTLastOut,
      FftStarted,
      FftUnexpected,
      FftMissing,
      FftHalted         : OUT std_logic
   );
END FftTb;


ARCHITECTURE rtl OF FftTb IS

   COMPONENT fft_1k IS
     PORT (
       aclk,
       aclken,
       aresetn,
       s_axis_config_tvalid         : IN STD_LOGIC;
       s_axis_config_tdata          : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
       s_axis_config_tready         : OUT STD_LOGIC;
       s_axis_data_tvalid           : IN STD_LOGIC;
       s_axis_data_tready           : OUT STD_LOGIC;
       s_axis_data_tlast            : IN STD_LOGIC;
       s_axis_data_tdata            : IN STD_LOGIC_VECTOR(47 DOWNTO 0);
       m_axis_data_tdata            : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
       m_axis_data_tvalid,
       m_axis_data_tlast,
       event_frame_started,
       event_tlast_unexpected,
       event_tlast_missing,
       event_data_in_channel_halt   : OUT STD_LOGIC
     );
   END COMPONENT fft_1k;

BEGIN


   Fft_u : fft_1k
    port map (
      aclk                        => Clk2x,
      aresetn                     => not reset2x,
      aclken                      => ce,
      s_axis_config_tvalid        => '0', -- not needed and prone to error, was ConfigTValid,
      s_axis_config_tready        => ConfigTReady,
      s_axis_config_tdata         => x"01",
      s_axis_data_tvalid          => ValidPack,
      s_axis_data_tready          => FftReady,
      s_axis_data_tdata           => 6x"00" & to_slv(PackI) & 6x"00" & to_slv(PackR),
      s_axis_data_tlast           => FftTLastIn,
      m_axis_data_tvalid          => ValidFft,
      m_axis_data_tdata           => FftOutSlv,
      m_axis_data_tlast           => FftTLastOut,
      event_frame_started         => FftStarted,
      event_tlast_unexpected      => FftUnexpected,
      event_tlast_missing         => FftMissing,
      event_data_in_channel_halt  => FftHalted
      );


END rtl;

