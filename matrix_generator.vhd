library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity matrix_generator is
    Port (
        encoded_data : in std_logic_vector(159 downto 0); -- Encoded alphanumeric data
        ecc_data     : in std_logic_vector(15 downto 0);  -- ECC data (2 bytes)
        raw_matrix   : out std_logic_vector(21*21-1 downto 0) -- Output 21x21 QR matrix
    );
end matrix_generator;

architecture Behavioral of matrix_generator is
    constant MATRIX_SIZE : integer := 21; -- Ukuram QR code (21x21 for Version 1)
    signal temp_matrix   : std_logic_vector(21*21-1 downto 0);
begin
    process(encoded_data, ecc_data)
        variable position : integer := 0; -- Posisi Bit di Matrix
        variable bit_val  : std_logic;
    begin
        -- Inisialisasi semua bit ke 0
        temp_matrix <= (others => '0');

        -- Add Finder Patterns (top-left, top-right, bottom-left)
        for row in 0 to 6 loop
            for col in 0 to 6 loop
                if (row = 0 or row = 6 or col = 0 or col = 6 or (row >= 2 and row <= 4 and col >= 2 and col <= 4)) then
                    temp_matrix(row * MATRIX_SIZE + col) <= '1';
                    temp_matrix(row * MATRIX_SIZE + (MATRIX_SIZE - 1 - col)) <= '1';
                    temp_matrix((MATRIX_SIZE - 1 - row) * MATRIX_SIZE + col) <= '1';
                end if;
            end loop;
        end loop;

        -- Tambahkan Timing Patterns
        for i in 0 to MATRIX_SIZE - 1 loop
            if i mod 2 = 0 then
                temp_matrix(6 * MATRIX_SIZE + i) <= '1';
                temp_matrix(i * MATRIX_SIZE + 6) <= '1';
            end if;
        end loop;

        -- peletakan Data dan ECC 
        position := 0; -- Reset position
        for i in 0 to 159 loop
            -- Skip reserved areas for finder and timing patterns
            while ((position / MATRIX_SIZE = 0 or position / MATRIX_SIZE = 6 or position / MATRIX_SIZE = MATRIX_SIZE - 1) and
                (position mod MATRIX_SIZE = 0 or position mod MATRIX_SIZE = 6 or position mod MATRIX_SIZE = MATRIX_SIZE - 1)) loop
                position := position + 1;
            end loop;

            -- Add encoded data bit
            bit_val := encoded_data(159 - i); -- Start from MSB
            temp_matrix(position) <= bit_val;
            position := position + 1;
        end loop;

        -- ECC placement (continuing after data bits)
        for i in 0 to 15 loop
            while ((position / MATRIX_SIZE = 0 or position / MATRIX_SIZE = 6 or position / MATRIX_SIZE = MATRIX_SIZE - 1) and
                (position mod MATRIX_SIZE = 0 or position mod MATRIX_SIZE = 6 or position mod MATRIX_SIZE = MATRIX_SIZE - 1)) loop
                position := position + 1;
            end loop;

            -- Add ECC bit
            bit_val := ecc_data(15 - i); -- Start from MSB
            temp_matrix(position) <= bit_val;
            position := position + 1;
        end loop;

        -- Output the filled matrix
        raw_matrix <= temp_matrix;
    end process;
end Behavioral;
