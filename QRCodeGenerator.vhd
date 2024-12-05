entity QRCodeGenerator is
    Port (
        input_data : in std_logic_vector(63 downto 0); -- Input 8 karakter
        bmp_output : out std_logic_vector(1023 downto 0) -- Output BMP
    );
end QRCodeGenerator;

architecture Structural of QRCodeGenerator is
    signal encoded_data, error_correction_code, qr_matrix, masked_matrix : std_logic_vector(...);
begin
    -- Hubungkan modul
end Structural;
