Library ieee;
use ieee.std_logic_1164.all;
use IEEE.numeric_std.ALL;
Library work;
use work.LUTPackage.all;

entity array_output is
port (
	clk : in std_logic;
	input_char : in string(1 to 8);
	full_array_int : out int_array
);
end entity;
architecture behavorial of array_output is

signal array_out_number : int_array;
signal array_out_gener: int_array;

component Input
port (
	input_char : in string(1 to 8);
	output_integer: out int_array
);
end component;
component generer_ecc
port (
	clk: in std_logic;
	mes_poly_chr: in int_array;
	ecc_out : out int_array
);
end component;
component full_array_output is
port (
	input_array_number : in int_array;
	input_array_gener : in int_array;
	full_array_out : out int_array
);
end component;


BEGIN
u1 :	input_number port map (input_char, array_out_number);
u2 :	generer_ecc port map (clk, array_out_number, array_out_gener);
u3 :    full_array_outp port map (array_out_number, array_out_gener, full_array_int);

end behavorial;