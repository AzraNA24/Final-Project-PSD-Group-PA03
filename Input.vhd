Library ieee;
use ieee.std_logic_1164.all;
use IEEE.numeric_std.ALL;
Library work;
use work.LUTPackage.all;

entity Input is
port (
	input_char : in string(1 to 8);
	output_integer: out int_array  
);
constant mode_array : std_logic_vector (13 downto 0 ) := "00010000000110";
constant pad_byte : std_logic_vector (37 downto 0 ) := "00000011101100000100011110110000010001";
end Input;

architecture behavorial of input_number is
    signal temp_array : integer_vector(1 to 8); -- Menyimpan hasil konversi karakter ke integer
    signal output_bin : std_logic_vector(71 downto 0); -- Output dalam bentuk biner
    
begin
    -- Proses untuk mengonversi setiap karakter dalam input_char
    process(input_char)
    begin
        for i in input_char'range loop
            temp_array(i) <= LUTPackage.Convert_to_integer(input_char(i));
        end loop;
    end process;

    -- Gabungkan array integer ke dalam output_bin sebagai representasi biner
    output_bin <= std_logic_vector(to_unsigned(temp_array(1), 9)) &
                    std_logic_vector(to_unsigned(temp_array(2), 9)) &
                    std_logic_vector(to_unsigned(temp_array(3), 9)) &
                    std_logic_vector(to_unsigned(temp_array(4), 9)) &
                    std_logic_vector(to_unsigned(temp_array(5), 9)) &
                    std_logic_vector(to_unsigned(temp_array(6), 9)) &
                    std_logic_vector(to_unsigned(temp_array(7), 9)) &
                    std_logic_vector(to_unsigned(temp_array(8), 9));

    -- Konversi output_bin menjadi array integer untuk output_integer
    output_integer(25 downto 18) <= 
        (to_integer(unsigned(output_bin(71 downto 64))),
            to_integer(unsigned(output_bin(63 downto 56))),
            to_integer(unsigned(output_bin(55 downto 48))),
            to_integer(unsigned(output_bin(47 downto 40))),
            to_integer(unsigned(output_bin(39 downto 32))),
            to_integer(unsigned(output_bin(31 downto 24))),
            to_integer(unsigned(output_bin(23 downto 16))),
            to_integer(unsigned(output_bin(15 downto 8))));

    output_integer(17 downto 0) <= (others => 0); -- Sisanya diisi nol
end behavorial;
