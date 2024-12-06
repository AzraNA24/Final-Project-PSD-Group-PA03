Library ieee;
use ieee.std_logic_1164.all;
use IEEE.numeric_std.ALL;
Library work;
use work.LUTPackage.all;

entity Top_Level is
port (
	clk : in std_logic;
	input_char : in string(1 to 8);
	output_bin : out std_logic_vector (207 downto 0)
);
end entity;

architecture behavorial of Top_Level is

component array_output 
port (
	clk : in std_logic;
	input_char : in string(1 to 8);
	full_array_int : out int_array
);
end component;

component output_bin
port (
	full_array_int : in int_array;
	output_bin : out std_logic_vector (207 downto 0)
);
end component;

signal temp : int_array;

BEGIN
x1 : array_output port map (clk, input_char, temp);
x2 : output_bin port map (temp, output_bin);

end behavorial;