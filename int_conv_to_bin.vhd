Library ieee;
use ieee.std_logic_1164.all;
use IEEE.numeric_std.ALL;

entity int_conv_to_bin is
port (
	inp1: in integer; 
	outp : out std_logic_vector (9 DOWNTO 0)
);
end int_conv_to_bin;

architecture behavorial of int_conv_to_bin is
begin
	outp <= std_logic_vector(to_unsigned(inp1,10));
end behavorial;