entity MatrixGenerator is
    Port (
        data : in std_logic_vector(119 downto 0); -- Data + Error Correction
        qr_matrix : out std_logic_vector(255 downto 0) -- Matriks QR 16x16
    );
end MatrixGenerator;

architecture Behavioral of MatrixGenerator is
    -- Definisikan matriks dan pola
    signal matrix : std_logic_vector(255 downto 0);
begin
    process(data)
    begin
        -- Tambahkan Finder, Alignment, dan Timing Pattern
        matrix <= "....";
    end process;
    qr_matrix <= matrix;
end Behavioral;
