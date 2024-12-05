library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity LUT is
    Port (
        index : in integer range 0 to 35; -- Index input
        data : out std_logic_vector(5 downto 0) -- Output biner
    );
end LUT;

architecture Behavioral of LUT is
    type alphanumeric_table is array (0 to 35) of std_logic_vector(6 downto 0);
    constant Alphanumeric_LUT : alphanumeric_table := (
        "1000001", -- A
        "1000010", -- B
        "1000011", -- C
        "1000100", -- D
        "1000101", -- E
        "1000110", -- F
        "1000111", -- G
        "1001000", -- H
        "1001001", -- I
        "1001010", -- J
        "1001011", -- K
        "1001100", -- L
        "1001101", -- M
        "1001110", -- N
        "1001111", -- O
        "1010000", -- P
        "1010001", -- Q
        "1010010", -- R
        "1010011", -- S
        "1010100", -- T
        "1010101", -- U
        "1010110", -- V
        "1010111", -- W
        "1011000", -- X
        "1011001", -- Y
        "1011010", -- Z
        "0110000", -- 0
        "0110001", -- 1
        "0110010", -- 2
        "0110011", -- 3
        "0110100", -- 4
        "0110101", -- 5
        "0110110", -- 6
        "0110111", -- 7
        "0111000", -- 8,
        "0111001" -- 9
    );
begin
    process(index)
    begin
        if index >= 0 and index <= 35 then
            data <= Alphanumeric_LUT(index);
        else
            data <= "0000000"; -- Default untuk index invalid
        end if;
    end process;
end Behavioral;
