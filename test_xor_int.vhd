Library ieee;
use ieee.std_logic_1164.all;
use IEEE.numeric_std.ALL;
Library work;
use work.my_package.all;

entity test_xor_int is
port (
	inp1, inp2 : in std_logic_vector (7 DOWNTO 0); 
	outp : out integer
);
end test_xor_int;

architecture behavorial of test_xor_int is
signal temp : std_logic_vector (7 downto 0);
begin
temp <= inp1 xor inp2;
outp <= to_integer(unsigned(temp));
end behavorial;