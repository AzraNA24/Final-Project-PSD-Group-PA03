library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.LUTPackage.ALL;

entity data_encoder is
    Port (
        input_text   : in std_logic_vector(63 downto 0); -- Input ASCII text (8 karakter x 8 bit)
        encoded_data : out std_logic_vector(159 downto 0) -- Encoded alphanumeric data
    );
end data_encoder;

architecture Behavioral of data_encoder is
    -- Mode indicator untuk alphanumeric encoding
    constant mode        : std_logic_vector(3 downto 0) := "0010";
    -- Message length (8 characters) dalam 8-bit binary
    constant length      : std_logic_vector(7 downto 0) := "00001000";
    -- Jumlah pasangan karakter
    constant num_pairs   : integer := 4; -- 8 karakter / 2

    -- Fungsi konversi
    function to_binary_vector(value : integer; width : integer) return std_logic_vector is
        variable temp : std_logic_vector(width-1 downto 0);
    begin
        temp := std_logic_vector(to_unsigned(value, width));
        return temp;
    end function;

begin
    process(input_text)
        variable i      : integer;
        variable idx1   : integer;
        variable idx2   : integer;
        variable pair_val : integer;
        variable pair_bin : std_logic_vector(10 downto 0);
        variable encoded_tmp : std_logic_vector(159 downto 0);
    begin
        -- Inisialisasi encoded_tmp dengan '0's
        encoded_tmp := (others => '0');

        -- Tambahkan mode dan length
        encoded_tmp(159 downto 156) := mode;               -- 4 bit mode
        encoded_tmp(155 downto 148) := length;             -- 8 bit length

        -- Encoding setiap pasangan karakter
        for i in 0 to num_pairs - 1 loop
            -- Ekstrak dua karakter per iterasi
            -- Setiap karakter adalah 8 bit, jadi posisi karakter pertama:
            -- (i*2)*8 + 15 downto (i*2)*8 + 8
            -- Karakter kedua:
            -- (i*2)*8 + 7 downto (i*2)*8
            idx1 := char_to_index(input_text((i*16)+15 downto (i*16)+8));
            idx2 := char_to_index(input_text((i*16)+7 downto (i*16)));

            -- Hitung nilai pasangan: idx1 * 45 + idx2
            pair_val := idx1 * 45 + idx2;

            -- Konversi pasangan ke 11-bit binary
            pair_bin := to_binary_vector(pair_val, 11);

            -- Tempatkan pasangan dalam encoded_tmp
            -- Mulai dari bit 147 downto 0, setiap 11 bit
            encoded_tmp(147 - (i*11) downto 137 - (i*11)) := pair_bin;
        end loop;

        -- Assign hasil encoding ke output
        encoded_data <= encoded_tmp;
    end process;
end Behavioral;
