-- LUT Package for Data Encoding (Alphanumeric)
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

package LUTPackage is
    function encode_data(input_char : in std_logic_vector(7 downto 0)) return std_logic_vector;
end LUTPackage;

package body LUTPackage is
    function encode_data(input_char : in std_logic_vector(7 downto 0)) return std_logic_vector is
    begin
        case input_char is
            -- Numbers 0-9
            when "00110000" => return "00010000"; -- '0' -> 0x10
            when "00110001" => return "00010001"; -- '1' -> 0x11
            when "00110010" => return "00010010"; -- '2' -> 0x12
            when "00110011" => return "00010011"; -- '3' -> 0x13
            when "00110100" => return "00010100"; -- '4' -> 0x14
            when "00110101" => return "00010101"; -- '5' -> 0x15
            when "00110110" => return "00010110"; -- '6' -> 0x16
            when "00110111" => return "00010111"; -- '7' -> 0x17
            when "00111000" => return "00011000"; -- '8' -> 0x18
            when "00111001" => return "00011001"; -- '9' -> 0x19

            -- Uppercase Letters A-Z
            when "01000001" => return "00011010"; -- 'A' -> 0x1A
            when "01000010" => return "00011011"; -- 'B' -> 0x1B
            when "01000011" => return "00011100"; -- 'C' -> 0x1C
            when "01000100" => return "00011101"; -- 'D' -> 0x1D
            when "01000101" => return "00011110"; -- 'E' -> 0x1E
            when "01000110" => return "00011111"; -- 'F' -> 0x1F
            when "01000111" => return "00100000"; -- 'G' -> 0x20
            when "01001000" => return "00100001"; -- 'H' -> 0x21
            when "01001001" => return "00100010"; -- 'I' -> 0x22
            when "01001010" => return "00100011"; -- 'J' -> 0x23
            when "01001011" => return "00100100"; -- 'K' -> 0x24
            when "01001100" => return "00100101"; -- 'L' -> 0x25
            when "01001101" => return "00100110"; -- 'M' -> 0x26
            when "01001110" => return "00100111"; -- 'N' -> 0x27
            when "01001111" => return "00101000"; -- 'O' -> 0x28
            when "01010000" => return "00101001"; -- 'P' -> 0x29
            when "01010001" => return "00101010"; -- 'Q' -> 0x2A
            when "01010010" => return "00101011"; -- 'R' -> 0x2B
            when "01010011" => return "00101100"; -- 'S' -> 0x2C
            when "01010100" => return "00101101"; -- 'T' -> 0x2D
            when "01010101" => return "00101110"; -- 'U' -> 0x2E
            when "01010110" => return "00101111"; -- 'V' -> 0x2F
            when "01010111" => return "00110000"; -- 'W' -> 0x30
            when "01011000" => return "00110001"; -- 'X' -> 0x31
            when "01011001" => return "00110010"; -- 'Y' -> 0x32
            when "01011010" => return "00110011"; -- 'Z' -> 0x33

            -- Special Characters (Space, $, %, *, +, -, ., /, :)
            when "00100000" => return "00110100"; -- Space -> 0x34
            when "00100100" => return "00110101"; -- '$' -> 0x35
            when "00100101" => return "00110110"; -- '%' -> 0x36
            when "00101010" => return "00110111"; -- '*' -> 0x37
            when "00101011" => return "00111000"; -- '+' -> 0x38
            when "00101101" => return "00111001"; -- '-' -> 0x39
            when "00101110" => return "00111010"; -- '.' -> 0x3A
            when "00101111" => return "00111011"; -- '/' -> 0x3B
            when "00111010" => return "00111100"; -- ':' -> 0x3C

            -- Default: Unknown or unsupported character
            when others => return "00000000"; -- Default case for undefined characters
        end case;
    end function;
end LUTPackage;
