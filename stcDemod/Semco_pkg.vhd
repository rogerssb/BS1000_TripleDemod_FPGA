-- -------------------------------------------------------------
--
-- File Name: Semco_pkg.vhd
--
-- -------------------------------------------------------------
-- radix define fx8 -fixed -fraction 8 -base decimal -- modelsim command for defining ufixed downto -8 radix. Add -signed if applicable

LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
use work.fixed_pkg.all;
USE IEEE.math_real.all;


PACKAGE Semco_pkg IS
  TYPE vector_of_unsigned16 IS ARRAY (NATURAL RANGE <>) OF unsigned(15 DOWNTO 0);
  TYPE vector_of_signed16   IS ARRAY (NATURAL RANGE <>) OF signed(15 DOWNTO 0);
  TYPE vector_of_unsigned12 IS ARRAY (NATURAL RANGE <>) OF unsigned(11 DOWNTO 0);

   TYPE vector_of_slvs     IS ARRAY (NATURAL RANGE <>) OF std_logic_vector;
   TYPE vector_of_ufixed   IS ARRAY (NATURAL RANGE <>) OF ufixed;
   TYPE vector_of_sfixed   IS ARRAY (NATURAL RANGE <>) OF sfixed;
   TYPE vector_of_unsigned IS ARRAY (NATURAL RANGE <>) OF unsigned;
   TYPE vector_of_signed   IS ARRAY (NATURAL RANGE <>) OF signed;

   subtype UINT8slv        is std_logic_vector(7 downto 0);
   subtype UINT16slv       is std_logic_vector(15 downto 0);
   subtype UINT32slv       is std_logic_vector(31 downto 0);

   subtype INT8slv         is std_logic_vector(7 downto 0);
   subtype INT16slv        is std_logic_vector(15 downto 0);
   subtype INT32slv        is std_logic_vector(31 downto 0);

   subtype SLV2            is std_logic_vector(1 downto 0);
   subtype SLV4            is std_logic_vector(3 downto 0);
   subtype SLV8            is std_logic_vector(7 downto 0);
   subtype SLV12           is std_logic_vector(11 downto 0);
   subtype SLV16           is std_logic_vector(15 downto 0);
   subtype SLV18           is std_logic_vector(17 downto 0);
   subtype SLV24           is std_logic_vector(23 downto 0);
   subtype SLV32           is std_logic_vector(31 downto 0);
   subtype SLV64           is std_logic_vector(63 downto 0);

   subtype UINT2           is unsigned(1 downto 0);
   subtype UINT3           is unsigned(2 downto 0);
   subtype UINT4           is unsigned(3 downto 0);
   subtype UINT5           is unsigned(4 downto 0);
   subtype UINT8           is unsigned(7 downto 0);
   subtype UINT16          is unsigned(15 downto 0);
   subtype UINT32          is unsigned(31 downto 0);

   subtype INT8            is signed(7 downto 0);
   subtype INT16           is signed(15 DOWNTO 0);
   subtype INT32           is signed(31 downto 0);

   subtype UINT8f          is ufixed(7 downto 0);
   subtype UINT16f         is ufixed(15 downto 0);
   subtype UINT32f         is ufixed(31 downto 0);
   subtype INT8f           is sfixed(7 downto 0);
   subtype INT16f          is sfixed(15 downto 0);
   subtype INT32f          is sfixed(31 downto 0);
   subtype uFix16_7        is ufixed(8 downto -7);
   subtype uFix16_15       is ufixed(0 downto -15);

   type  INT_ARRAY         is array (natural range <>) of integer;
   type  NATURAL_ARRAY     is array (natural range <>) of natural;
   type  INT8F_ARRAY       is array (natural range <>) of INT8f;
   type  UINT8F_ARRAY      is array (natural range <>) of UINT8f;
   type  UINT16F_ARRAY     is array (natural range <>) of UINT16f;
   type  INT16F_ARRAY      is array (natural range <>) of INT16f;
   type  UINT8_ARRAY       is array (NATURAL RANGE <>) OF UINT8;
   type  SLV8_ARRAY        is array (natural range <>) of SLV8;
   type  SFIX18_17_ARRAY   is array (natural range <>) of sfixed(0 downto -17);

   CONSTANT Zero8u      : UINT8     := (others=>'0');
   CONSTANT Zero8s      : INT8      := (others=>'0');
   CONSTANT Zero8uf     : UINT8f    := (others=>'0');
   CONSTANT Zero8sf     : INT8f     := (others=>'0');
   CONSTANT Zero8slv    : SLV8      := (others=>'0');
   CONSTANT Zero16u     : UINT16    := (others=>'0');
   CONSTANT Zero16s     : INT16     := (others=>'0');
   CONSTANT Zero16uf    : UINT16f   := (others=>'0');
   CONSTANT Zero16sf    : INT16f    := (others=>'0');
   CONSTANT Zero16slv   : SLV16     := (others=>'0');
   CONSTANT Zero32sf    : INT32f    := (others=>'0');
   CONSTANT Zero32s     : INT32     := (others=>'0');
   CONSTANT One8slv     : SLV8      := x"01";
   CONSTANT One8u       : UINT8     := x"01";
   CONSTANT One8s       : INT8      := x"01";
   CONSTANT One8uf      : UINT8f    := x"01";
   CONSTANT One16uf     : UINT16f   := x"0001";
   CONSTANT One16sf     : INT16f    := x"0001";
   CONSTANT One16s      : INT16     := x"0001";
   CONSTANT One16u      : UINT16    := x"0001";
   CONSTANT Two8slv     : UINT8slv  := x"02";
   CONSTANT Two8sf      : INT8f     := x"02";
   CONSTANT Eight8s     : INT8      := x"08";
   CONSTANT Eight8u     : UINT8     := x"08";
   CONSTANT Eight8sf    : INT8f     := x"08";
   CONSTANT Eight8uf    : UINT8f    := x"08";
   CONSTANT Eight16uf   : UINT16f   := x"0008";

   subtype  STC_Parm       is sfixed(0 downto -17); -- allows changing to 1, -16 easily
   CONSTANT PARM_ZERO      : STC_Parm := (others=>'0');
   CONSTANT LP_WIDTH       : positive := 25;
   CONSTANT HP_WIDTH       : positive := 25;

   -- define various "floating point" numbers by moving bin point as necessary for range of variable defined
   -- 'floats' are either High Precision 25 bit to max out multiplier capacity of 25*18 or 18 bit
   subtype  FLOAT_1_14     is sfixed(0 downto -13);
   subtype  FLOAT_1_18     is sfixed(0 downto -17);   -- provide sufficient resolution to cover the 8 decimal places of the original data values. Usually < ±1.0
   subtype  FLOAT_1_HP     is sfixed(0 downto 0-HP_WIDTH+1);   -- provide sufficient resolution to cover the 8 decimal places of the original data values. Usually < ±1.0
   subtype  Float_1_LP     is sfixed(0 downto 0-LP_WIDTH+1);--17);   -- provide sufficient resolution to cover the 8 decimal places of the original data values. Usually < ±1.0
   subtype  FLOAT_2_LP     is sfixed(1 downto -23);   -- Move point to provide ±2 max value
   subtype  FLOAT_16_18    is sfixed(4 downto -13);   -- Move point to provide ±16 max value
   subtype  FLOAT_16_HP    is sfixed(4 downto -20);   -- Move point to provide ±16 max value
   subtype  FLOAT_16_LP    is sfixed(4 downto -20);--13);   -- Move point to provide ±16 max value
   subtype  FLOAT_64_HP    is sfixed(6 downto -18);   -- Move point to provide ±64 max value
   subtype  FLOAT_64_LP    is sfixed(6 downto -18);--11);   -- Move point to provide ±64 max value
   subtype  FLOAT_256_LP   is sfixed(8 downto -9);   -- Move point to provide ±256 max value
   subtype  FLOAT_256_HP   is sfixed(8 downto -16);   -- Move point to provide ±256 max value
   subtype  FLOAT_1K       is sfixed(10 downto -14);  -- Move point to provide ±1024 max value
   subtype  FLOAT_4K       is sfixed(12 downto -12);  -- Move point to provide ±2048 max value
   subtype  FLOAT_16K      is sfixed(14 downto -10);  -- Move point to provide ±16k max value
   subtype  FLOAT_64K      is sfixed(16 downto -8);   -- Move point to provide ±64k max value
   subtype  FLOAT_128K     is sfixed(17 downto -7);   -- Move point to provide 128k max value
   subtype  FLOAT_1M       is sfixed(20 downto -4);   -- Move point to provide 512k max value
   subtype  FLOAT_1B       is sfixed(31 downto 7);    -- Move point to provide 512M max value
   subtype  FLOAT_SLV_LP   is std_logic_vector(24 downto 0); --17 downto 0);
   subtype  FLOAT_SLV_HP   is std_logic_vector(24 downto 0);
   subtype  FLOAT_COMP_SLV is std_logic_vector(49 downto 0);

   type  STC_Parm_Array    is array (natural range <>) of STC_Parm;
   type  FLOAT_ARRAY_1_18  is array (natural range <>) of FLOAT_1_18;
   type  FLOAT_ARRAY_1_LP  is array (natural range <>) of FLOAT_1_LP;
   type  FLOAT_ARRAY_1_HP  is array (natural range <>) of FLOAT_1_HP;
   type  FLOAT_ARRAY_16_18 is array (natural range <>) of FLOAT_16_18;
   type  FLOAT_ARRAY_16_LP is array (natural range <>) of FLOAT_16_LP;
   type  FLOAT_ARRAY_16_HP is array (natural range <>) of FLOAT_16_HP;
   type  FLOAT_ARRAY_64_LP is array (natural range <>) of FLOAT_64_LP;
   type  FLOAT_ARRAY_64_HP is array (natural range <>) of FLOAT_64_HP;
   type  FLOAT_ARRAY_256_HP is array (natural range <>) of FLOAT_256_HP;
   type  FLOAT_ARRAY_1K    is array (natural range <>) of FLOAT_1K;
   type  FLOAT_ARRAY_4K    is array (natural range <>) of FLOAT_4K;
   type  FLOAT_ARRAY_128K  is array (natural range <>) of FLOAT_128K;
   type  FLOAT_ARRAY_1B    is array (natural range <>) of FLOAT_1B;
   type  FLOAT_ARRAY_SLV_LP is array (natural range <>) of FLOAT_SLV_LP;
   type  FLOAT_ARRAY_SLV_HP is array (natural range <>) of FLOAT_SLV_HP;

   CONSTANT FLOAT_ZERO_1_18   : FLOAT_1_18   := (others=>'0');
   CONSTANT FLOAT_ZERO_1_HP   : FLOAT_1_HP   := (others=>'0');
   CONSTANT FLOAT_ZERO_1_LP   : Float_1_LP   := (others=>'0');
   CONSTANT FLOAT_ZERO_16_18  : FLOAT_16_18  := (others=>'0');
   CONSTANT FLOAT_ZERO_16_LP  : FLOAT_16_LP  := (others=>'0');
   CONSTANT FLOAT_ZERO_16_HP  : FLOAT_16_HP  := (others=>'0');
   CONSTANT FLOAT_ZERO_64_LP  : FLOAT_64_LP  := (others=>'0');
   CONSTANT FLOAT_ZERO_64_HP  : FLOAT_64_HP  := (others=>'0');
   CONSTANT FLOAT_ZERO_256_LP : FLOAT_256_LP := (others=>'0');
   CONSTANT FLOAT_ZERO_1K     : FLOAT_1K     := (others=>'0');
   CONSTANT FLOAT_ZERO_4K     : FLOAT_4K     := (others=>'0');
   CONSTANT FLOAT_ZERO_64K    : FLOAT_64K    := (others=>'0');
   CONSTANT FLOAT_ZERO_128K   : FLOAT_128K   := (others=>'0');
   CONSTANT FLOAT_ZERO_1M     : FLOAT_1M     := (others=>'0');
   CONSTANT FLOAT_ZERO_1B     : FLOAT_1B     := (others=>'0');

   CONSTANT PILOT_LENGTH_4    : natural   := 512; -- 4 sample/bit pilot length
   CONSTANT FRAME_LENGTH_4    : natural   := 13312;
   CONSTANT BUF_ADDR_WIDTH    : natural   := 9;
   CONSTANT A2D_SAMPLE_RATE   : real      := 280_000_000.0 / 3.0; -- 93.333MHz
   CONSTANT DDC_RATE          : real      := A2D_SAMPLE_RATE / 2.0; -- 46.666MHz
   CONSTANT NB_4              : natural   := 4;
   CONSTANT R                 : real      := 64.0;
   CONSTANT FREQ_SAMP         : real      := 41_600_000.0;     -- Bit Rate x 4
   CONSTANT TSAMPLE_4         : real      := 1.0 / FREQ_SAMP;
   CONSTANT TS                : real      := R / FREQ_SAMP;
   CONSTANT FFT_INPUT_LENGTH  : natural   := 4*FRAME_LENGTH_4/64;   -- 832
   CONSTANT FN                : real      := 262144.0/R;
   CONSTANT FREQ_AMBIGUITY    : real      := 3125.0;
   CONSTANT FREQ_RESOLUTION   : real      := FREQ_SAMP/(R*FN);
   CONSTANT SINV_LUT_SIZE     : positive  := 65*65*4;
   CONSTANT SEARCH_LENGTH     : positive  := 64;
   CONSTANT NUM_SEARCHES      : positive  := 65;
   CONSTANT NUM_ITER          : positive  := 64;
   CONSTANT SAMPS_BIT_OVER    : positive  := 32;
   CONSTANT SEARCH_MID_PT     : positive  := 32;
   CONSTANT SEARCH_SKIP       : positive  := 8;
   CONSTANT SEARCH_NB         : real      := 32.0;
   CONSTANT SEARCH_OFFSET     : real      := 31.5;
   CONSTANT EST_TEMPLATE_LENGTH  : positive := 2105;
   CONSTANT PILOT_SIZE        : positive := PILOT_LENGTH_4;
   CONSTANT TIME_DEPTH        : positive := PILOT_LENGTH_4 / 2;

   type  SIG_ARRAY      is array (0 to EST_TEMPLATE_LENGTH-1) of FLOAT_1_LP;

   --   type fixed_round_style_type is (fixed_round, fixed_truncate);
   --   type fixed_overflow_style_type is (fixed_saturate, fixed_wrap);

   type AcqTrack_t   is (Track, Acquire);
   type GoldDataType is (Bools, SFix, UFix); -- allows, std_logic, int, uint, sfixed or ufixed values

   type RecordType is
      record
         FreqResolution    : sfixed(10 downto -7);    --:= to_sfixed(FREQ_RESOLUTION, 10, -7);
         OneOverFreqRes    : sfixed(-6 downto -23);   --:= to_sfixed(1.0/FREQ_RESOLUTION, -9 , -26);
         OneOverFreqAmb    : sfixed(-10 downto -27);  --:= to_sfixed(1.0/FREQ_AMBIGUITY, -13, -30);
         IndexP125K        : sfixed(12 downto -5);    --:= to_sfixed(125000.0/FREQ_RESOLUTION - 1.0 + FN/2.0, 12, -5);
         IndexN125K        : sfixed(12 downto -5);    --:= to_sfixed(-125000.0/FREQ_RESOLUTION - 1.0 + FN/2.0, 12, -5);
         TSample           : sfixed(-24 downto -41);  --:= to_sfixed(TSAMPLE_4, -27, -44);
         PilotSyncOffset   : natural range 0 to 4095;
         ResampleRatio     : SLV32;                   --:=to_slv(to_ufixed(FREQ_SAMP / A2D_SAMPLE_RATE, 0, -31)); 0.44571428571428571428571428571429 for 10Mb
         MiscBits          : SLV8;
         Probe8            : SLV18;
   end record RecordType;

   -- MiscBits definitions
   CONSTANT CONJUGATE      : natural := 0;   -- flip sense of frequency offset
   CONSTANT START_TIME     : natural := 1;   -- set high for freq-time-chan
   CONSTANT MSB_FIRST      : natural := 2;   -- FireBerd output direction
   CONSTANT TIME_SEL       : natural := 4;
   CONSTANT RESAMP_DIS     : natural := 5;   -- don't use KTS resampler
   CONSTANT RESET_BIT      : natural := 6;   -- set high to reset system
   CONSTANT FORCE_ACQUIRE  : natural := 7;   -- set high to force acquire mode

   CONSTANT c_RecordType : RecordType := (
                              FreqResolution    => to_sfixed(FREQ_RESOLUTION, 10, -7),
                              OneOverFreqRes    => to_sfixed(1.0/FREQ_RESOLUTION, -6 , -23),
                              OneOverFreqAmb    => to_sfixed(1.0/FREQ_AMBIGUITY, -10, -27),
                              IndexP125K        => to_sfixed(125000.0/FREQ_RESOLUTION - 1.0 + FN/2.0, 12, -5),
                              IndexN125K        => to_sfixed(-125000.0/FREQ_RESOLUTION - 1.0 + FN/2.0, 12, -5),
                              TSample           => to_sfixed(TSAMPLE_4, -24, -41),
                              PilotSyncOffset   => 2560,
                              ResampleRatio     => to_slv(to_ufixed(FREQ_SAMP / DDC_RATE, -1, -32)),
                              MiscBits          => 8x"07",
                              Probe8            => 18x"00015");


   function myMax(LEFT, RIGHT: INTEGER) return INTEGER;
   function ToStdLogic(L: BOOLEAN) return std_logic;
   function DivBy3(Numer : integer) return integer;      -- only works upto 256
   function MyMinimum (LEFT, RIGHT: INTEGER) return INTEGER;
   function MyMin (LEFT, RIGHT: INTEGER) return INTEGER;
   function OR_REDUCE(Vector : std_logic_vector) return std_logic;
   function log2(A: positive) return integer;
   function MakeEven(A: positive) return integer;
   function priority_encoder(in_vector : std_logic_vector) return integer;
   function bitwise_and (in_vector : std_logic_vector) return std_logic;
   function bitwise_or(in_vector : std_logic_vector) return std_logic;
   function count_bits(in_vector : std_logic_vector) return natural;
   function char_xnor(char_a : std_logic_vector; char_b : std_logic_vector) return std_logic;
   function char_xor(char_a : std_logic_vector; char_b : std_logic_vector) return std_logic;
   function reverse_slv_bits (in_vector: in std_logic_vector) return std_logic_vector;
   function and_integer(int_in : integer; mask : integer) return integer;

END Semco_pkg;

package body Semco_pkg is

   function and_integer(int_in : integer; mask : integer) return integer is
      variable int_v,
               mask_v,
               result_v : INT32;
      variable result   : integer;
   begin
      int_v    := to_signed(int_in, 32);
      mask_v   := to_signed(mask, 32);
      result_v := int_v and mask_v;
      result   := to_integer(result_v);
      return result;
   end function and_integer;

   function myMax(LEFT, RIGHT: INTEGER) return INTEGER is
   begin
      if LEFT > RIGHT then
         return LEFT;
      else
         return RIGHT;
      end if;
   end function myMax;
/*
   function CmplxMult(Ar:FLOAT; Ai:FLOAT; Br:FLOAT_4K; Bi:FLOAT_4K) return COMPLEX_FLOAT_4K is
      variable ArBrBi,
               BiArAi,
               BrAiAr    : FLOAT_4K;
      variable ComplexRI : COMPLEX_FLOAT_4K;
   begin
   --      ArBrBi       := resize(Ar*(Br+Bi), ArBrBi);
   --      BiArAi       := resize(Bi*(Ar+Ai), BiArAi);
   --      BrAiAr       := resize(Br*(Ai-Ar), BrAiAr);
   --      ComplexRI.Re := resize(ArBrBi - BiArAi, Ar);
   --      ComplexRI.Im := resize(ArBrBi + BrAiAr, Ar);
         ComplexRI.Re := resize(Ar*Br - Ai*Bi, Ar);
         ComplexRI.Im := resize(Ai*Br + Ar*Bi, Ar);
      return ComplexRI;
   end function CmplxMult;
*/

   function ToStdLogic(L: BOOLEAN) return std_logic is
   begin
      if L then
         return('1');
      else
         return('0');
   end if;
   end function ToStdLogic;

   function MyMinimum (LEFT, RIGHT: INTEGER) return INTEGER is
   begin
      if LEFT < RIGHT then
         return LEFT;
      else
         return RIGHT;
      end if;
   end MyMinimum;

   function MyMin (LEFT, RIGHT: INTEGER) return INTEGER is
   begin
      if LEFT < RIGHT then
         return LEFT;
      else
         return RIGHT;
      end if;
   end MyMin;

   function DivBy3(Numer : integer) return integer is
      variable Float,
               Remain,
               TwoThirds   : sfixed(7 downto -8);
   begin
      Float := to_sfixed(Numer, Float);
      TwoThirds := to_sfixed(2.0/3.0, TwoThirds);
      Float := resize((Float srl 8) + (Float srl 6) + (Float srl 4) + (Float srl 2), Float);
      Remain := Float rem 1.0;
      if (Remain > TwoThirds) then
         return to_integer(Float) + 1;
      else
         return to_integer(Float);
      end if;
   end function;

   function OR_REDUCE(Vector : std_logic_vector) return std_logic is
   begin
      for i in Vector'range loop
         if (Vector(i) = '1') then
            return ('1');
         end if;
      end loop;
      return ('0');
   end OR_REDUCE;

   function log2(A: positive) return integer is
      begin
        for i in 0 to 32 loop  -- Works for up to 32 bit integers
          if(2**i >= A) then return(i);  end if;
        end loop;
        return(32);
   end function log2;

   function MakeEven(A: positive) return integer is   -- reduce A to highest even <= A
      begin
         if (A mod 2 = 0) then
            return (A);
         else
            return (A-1);
         end if;
   end function MakeEven;

   function bitwise_and (in_vector : std_logic_vector) return std_logic is
      variable result : std_logic;
   begin
      result                     := '1';
      for i in (in_vector'length-1) downto 0 loop
         result := in_vector(i) and result;
      end loop;
      return result;
   end function bitwise_and;

   function priority_encoder(in_vector : std_logic_vector) return integer is
      variable result : integer;
   begin
      result            := 0;
      for i in (in_vector'length-1) downto 0 loop
         if (in_vector(i) = '1') then
            result      := i;
         end if;
      end loop;
      return result;
   end function priority_encoder;

   function bitwise_or(in_vector : std_logic_vector) return std_logic is
      variable result : std_logic;
   begin
      result            := '0';
      for i in (in_vector'length-1) downto 0 loop
         if (in_vector(i) = '1') then
            result      := '1';
         end if;
      end loop;
      return result;
   end function bitwise_or;

   function count_bits(in_vector : std_logic_vector) return natural is
      variable result : natural;
   begin
      result            := 0;
      for i in (in_vector'length-1) downto 0 loop
         if (in_vector(i) = '1') then
            result      := result + 1;
         end if;
      end loop;
      return result;
   end function count_bits;

   function char_xnor(char_a : std_logic_vector; char_b : std_logic_vector) return std_logic is
      variable result : std_logic;
   begin
      result            := '0';
      if (char_a = char_b) then
         result      := '1';
      end if;
      return result;
   end function char_xnor;

   function char_xor(char_a : std_logic_vector; char_b : std_logic_vector) return std_logic is
      variable result : std_logic;
   begin
      result            := '1';
      if (char_a = char_b) then
         result      := '0';
      end if;
      return result;
   end function char_xor;

   function reverse_slv_bits (in_vector: in std_logic_vector) return std_logic_vector is
     variable result: std_logic_vector(in_vector'RANGE);
     alias aa: std_logic_vector(in_vector'REVERSE_RANGE) is in_vector;
   begin
     for i in aa'RANGE loop
       result(i) := aa(i);
     end loop;
     return result;
   end;

END Semco_pkg;
