entity Masking is
    Port (
        input_matrix : in std_logic_vector(255 downto 0);
        masked_matrix : out std_logic_vector(255 downto 0)
    );
end Masking;

architecture Behavioral of Masking is
begin
    process(input_matrix)
    begin
        -- Terapkan pola masking
        masked_matrix <= input_matrix xor "...."; -- Masking pattern
    end process;
end Behavioral;
