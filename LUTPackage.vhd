library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

package LUTPackage is
    -- Tabel pengubahan karakter alfanumerik
    type char_table is array (0 to 36) of std_logic_vector(5 downto 0);
    constant char_map : char_table := (
        "000000", -- 0
        "000001", -- 1
        "000010", -- 2
        "000011", -- 3
        "000100", -- 4
        "000101", -- 5
        "000110", -- 6
        "000111", -- 7
        "001000", -- 8
        "001001", -- 9
        "001010", -- A
        "001011", -- B
        "001100", -- C
        "001101", -- D
        "001110", -- E
        "001111", -- F
        "010000", -- G
        "010001", -- H
        "010010", -- I
        "010011", -- J
        "010100", -- K
        "010101", -- L
        "010110", -- M
        "010111", -- N
        "011000", -- O
        "011001", -- P
        "011010", -- Q
        "011011", -- R
        "011100", -- S
        "011101", -- T
        "011110", -- U
        "011111", -- V
        "100000", -- W
        "100001", -- X
        "100010", -- Y
        "100011", -- Z
        "100100" -- SPACE
    );

    -- Fungsi untuk memetakan karakter ASCII ke indeks alfanumerik
    function char_to_index(c : std_logic_vector(7 downto 0)) return integer;
end LUTPackage;

package body LUTPackage is
    function char_to_index(c : std_logic_vector(7 downto 0)) return integer is
    begin
        case c is
            when "00110000" => return 0;  -- '0'
            when "00110001" => return 1;  -- '1'
            when "00110010" => return 2;  -- '2'
            when "00110011" => return 3;  -- '3'
            when "00110100" => return 4;  -- '4'
            when "00110101" => return 5;  -- '5'
            when "00110110" => return 6;  -- '6'
            when "00110111" => return 7;  -- '7'
            when "00111000" => return 8;  -- '8'
            when "00111001" => return 9;  -- '9'
            when "01000001" => return 10; -- 'A'
            when "01000010" => return 11; -- 'B'
            when "01000011" => return 12; -- 'C'
            when "01000100" => return 13; -- 'D'
            when "01000101" => return 14; -- 'E'
            when "01000110" => return 15; -- 'F'
            when "01000111" => return 16; -- 'G'
            when "01001000" => return 17; -- 'H'
            when "01001001" => return 18; -- 'I'
            when "01001010" => return 19; -- 'J'
            when "01001011" => return 20; -- 'K'
            when "01001100" => return 21; -- 'L'
            when "01001101" => return 22; -- 'M'
            when "01001110" => return 23; -- 'N'
            when "01001111" => return 24; -- 'O'
            when "01010000" => return 25; -- 'P'
            when "01010001" => return 26; -- 'Q'
            when "01010010" => return 27; -- 'R'
            when "01010011" => return 28; -- 'S'
            when "01010100" => return 29; -- 'T'
            when "01010101" => return 30; -- 'U'
            when "01010110" => return 31; -- 'V'
            when "01010111" => return 32; -- 'W'
            when "01011000" => return 33; -- 'X'
            when "01011001" => return 34; -- 'Y'
            when "01011010" => return 35; -- 'Z'
            when "00100000" => return 36; -- ' '
            when others => return 0;      -- Default (space)
        end case;
    end function;
end LUTPackage;
