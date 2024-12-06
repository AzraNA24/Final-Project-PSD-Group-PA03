Library ieee;
use ieee.std_logic_1164.all;
use IEEE.numeric_std.ALL;
Library work;
use work.LUTPackage.all;

entity full_array_output is
port (
	input_array_number : in int_array;
	input_array_gener : in int_array;
	full_array_out : out int_array
);
end entity;


architecture behavorial of full_array_output is
signal temp : int_array;

BEGIN
	temp(25 downto 17) <= input_array_number(25 downto 17);
	temp(16 downto 0) <= input_array_gener(16 downto 0);
	full_array_out <= temp;
end architecture;