-- -------------------------------------------------------------
--
-- File Name: SLVs_pkg.vhd
--
-- -------------------------------------------------------------

LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;


PACKAGE SLVs_pkg IS
  TYPE vector_of_unsigned16 IS ARRAY (NATURAL RANGE <>) OF unsigned(15 DOWNTO 0);
  TYPE vector_of_signed16   IS ARRAY (NATURAL RANGE <>) OF signed(15 DOWNTO 0);
  TYPE vector_of_unsigned12 IS ARRAY (NATURAL RANGE <>) OF unsigned(11 DOWNTO 0);

   TYPE vector_of_slvs     IS ARRAY (NATURAL RANGE <>) OF std_logic_vector;
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
   type  INT_ARRAY         is array (natural range <>) of integer;
   type  NATURAL_ARRAY     is array (natural range <>) of natural;
   type  NAT_ARRAY0_31     is array (natural range <>) of natural range 0 to 31;
   type  UINT2_ARRAY       is array (NATURAL RANGE <>) OF UINT2;
   type  UINT3_ARRAY       is array (NATURAL RANGE <>) OF UINT3;
   type  UINT4_ARRAY       is array (NATURAL RANGE <>) OF UINT4;
   type  UINT5_ARRAY       is array (NATURAL RANGE <>) OF UINT5;
   type  UINT8_ARRAY       is array (NATURAL RANGE <>) OF UINT8;
   type  SLV8_ARRAY        is array (natural range <>) of SLV8;
   type  SLV12_ARRAY       is array (natural range <>) of SLV12;
   type  SLV16_ARRAY       is array (natural range <>) of SLV16;
   type  SLV18_ARRAY       is array (natural range <>) of SLV18;
   type  SLV32_ARRAY       is array (natural range <>) of SLV32;

   CONSTANT Zero8u      : UINT8     := (others=>'0');
   CONSTANT Zero8s      : INT8      := (others=>'0');
   CONSTANT Zero8slv    : SLV8      := (others=>'0');
   CONSTANT Zero16u     : UINT16    := (others=>'0');
   CONSTANT Zero16s     : INT16     := (others=>'0');
   CONSTANT Zero16slv   : SLV16     := (others=>'0');
   CONSTANT Zero32s     : INT32     := (others=>'0');
   CONSTANT One8slv     : SLV8      := x"01";
   CONSTANT One8u       : UINT8     := x"01";
   CONSTANT One8s       : INT8      := x"01";
   CONSTANT One16s      : INT16     := x"0001";
   CONSTANT One16u      : UINT16    := x"0001";
   CONSTANT Two8slv     : UINT8slv  := x"02";
   CONSTANT Eight8s     : INT8      := x"08";
   CONSTANT Eight8u     : UINT8     := x"08";
   CONSTANT LP_WIDTH       : positive := 25;
   CONSTANT HP_WIDTH       : positive := 25;

   function myMax(LEFT, RIGHT: INTEGER) return INTEGER;
   function ToStdLogic(L: BOOLEAN) return std_logic;
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
   function CharToSlv(CharIn : character; Width : integer) return std_logic_vector;
   function CharToInt(CharIn : character) return integer;
   function ToHexChar(HexIn : std_logic_vector) return character;

   constant Ascii9 : UINT8 := x"39";

END SLVs_pkg;

package body SLVs_pkg is

   function ToHexChar(HexIn : std_logic_vector) return character is
      variable int_v : integer;
   begin
      int_v := to_integer(unsigned(HexIn));
      if (int_v <= 9) then
         return character'val(int_v + 48);
      else
         return character'val(int_v - 10 + 65);
      end if;
   end function ToHexChar;

   function CharToSlv(CharIn : character; Width : integer) return std_logic_vector is
      variable uInt : UINT8;
   begin
      uInt := to_unsigned(character'pos(CharIn), 8);
      if (uInt > Ascii9) then
         uInt := uInt - 65 + 10; -- A to F
      else
         uInt := uInt - 48;
      end if;
      return std_logic_vector(uInt(Width-1 downto 0));
   end function CharToSlv;

   function CharToInt(CharIn : character) return integer is
      variable uInt : UINT8;
   begin
      uInt := to_unsigned(character'pos(CharIn), 8);
      if (uInt > Ascii9) then
         uInt := uInt - 65 + 10; -- A to F
      else
         uInt := uInt - 48;
      end if;
      return  to_integer(uInt);
   end function CharToInt;

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
            if(2**i >= A) then
               return(i);
            end if;
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

END SLVs_pkg;
