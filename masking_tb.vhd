library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_TEXTIO.ALL;
use std.textio.ALL;

entity masking_tb is
end masking_tb;

architecture Behavioral of masking_tb is
    component masking
        Port (
            raw_matrix    : in  std_logic_vector(21*21-1 downto 0);
            masked_matrix : out std_logic_vector(21*21-1 downto 0)
        );
    end component;

    signal raw_matrix    : std_logic_vector(21*21-1 downto 0);
    signal masked_matrix : std_logic_vector(21*21-1 downto 0);
    constant MATRIX_SIZE : integer := 21;

begin
    uut: masking port map (
        raw_matrix    => raw_matrix,
        masked_matrix => masked_matrix
    );

    stim_proc: process
    begin
        -- Inisialisasi raw_matrix dengan pola sederhana untuk pengujian
        -- Misalnya: 0 dan 1 berselang-seling
        for i in 0 to MATRIX_SIZE-1 loop
            for j in 0 to MATRIX_SIZE-1 loop
                if (i * MATRIX_SIZE + j) mod 2 = 0 then
                    raw_matrix(i * MATRIX_SIZE + j) <= '1';
                else
                    raw_matrix(i * MATRIX_SIZE + j) <= '0';
                end if;
            end loop;
        end loop;

        wait for 10 ns;

        -- Tampilkan hasil di console
        report "Test selesai. Cek hasil masked_matrix.";

        -- Akhiri simulasi
        wait;
    end process;

end Behavioral;
