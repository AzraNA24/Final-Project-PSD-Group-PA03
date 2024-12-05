entity BMPGenerator is
    Port (
        qr_matrix : in std_logic_vector(255 downto 0);
        bmp_data : out std_logic_vector(1023 downto 0) -- Output BMP
    );
end BMPGenerator;

architecture Behavioral of BMPGenerator is
begin
    process(qr_matrix)
    begin
        -- Tambahkan header BMP dan data matriks
        bmp_data <= "...."; -- Konversi
    end process;
end Behavioral;
