-- Data Encoding Entity
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use work.LUTPackage.all;

entity DataEncoding is
    Port ( input_char : in std_logic_vector(7 downto 0);
           encoded_data : out std_logic_vector(7 downto 0)
         );
end DataEncoding;

architecture Behavioral of DataEncoding is
begin
    process(input_char)
    begin
        encoded_data <= encode_data(input_char); -- Memanggil LUT untuk encoding data
    end process;
end Behavioral;
