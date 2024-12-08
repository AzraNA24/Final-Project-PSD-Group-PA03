library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity masking is
    Port (
        raw_matrix    : in  std_logic_vector(21*21-1 downto 0);
        masked_matrix : out std_logic_vector(21*21-1 downto 0)
    );
end masking;

architecture Behavioral of masking is
begin
    process(raw_matrix)
    begin
        -- Loop untuk seluruh elemen dalam matriks 21x21
        for i in 0 to 20 loop  -- Baris
            for j in 0 to 20 loop  -- Kolom
                -- Hitung indeks dalam vektor 1 dimensi
                -- Indeks = i * 21 + j
                if (i mod 2 = 0) then
                    -- Membalik nilai jika baris genap (i mod 2 = 0)
                    if raw_matrix(i * 21 + j) = '1' then
                        masked_matrix(i * 21 + j) <= '0';
                    else
                        masked_matrix(i * 21 + j) <= '1';
                    end if;
                else
                    -- Tidak ada perubahan untuk baris ganjil
                    masked_matrix(i * 21 + j) <= raw_matrix(i * 21 + j);
                end if;
            end loop;
        end loop;
    end process;
end Behavioral;

