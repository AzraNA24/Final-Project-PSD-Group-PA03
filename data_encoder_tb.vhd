library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.LUTPackage.ALL;

entity tb_data_encoder is
end tb_data_encoder;

architecture Behavioral of tb_data_encoder is

    -- Komponen yang diuji
    component data_encoder is
        Port (
            input_text   : in std_logic_vector(63 downto 0);
            encoded_data : out std_logic_vector(159 downto 0)
        );
    end component;
    signal input_text   : std_logic_vector(63 downto 0) := (others => '0');
    signal encoded_data : std_logic_vector(159 downto 0);

begin
    uut: data_encoder port map (
        input_text   => input_text,
        encoded_data => encoded_data
    );

    -- Proses test
    process
        variable expected_encoded_data : std_logic_vector(159 downto 0);
    begin
        -- Input: "HALLO123"
        -- ASCII Encoding:
        -- 'H' = 72  = "01001000"
        -- 'A' = 65  = "01000001"
        -- 'L' = 76  = "01001100"
        -- 'L' = 76  = "01001100"
        -- 'O' = 79  = "01001111"
        -- '1' = 49  = "00110001"
        -- '2' = 50  = "00110010"
        -- '3' = 51  = "00110011"
        input_text <= "0100100001000001010011000100110001001111001100010011001000110011"; -- "HALLO123"
        wait for 10 ns;
        wait;
    end process;

end Behavioral;
