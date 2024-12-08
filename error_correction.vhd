library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity error_correction is
    Port (
        encoded_data : in  std_logic_vector(159 downto 0);
        ecc_data     : out std_logic_vector(15 downto 0) -- 2-byte ECC
    );
end error_correction;

architecture Behavioral of error_correction is

    -- Function untuk operasi Galois Field (GF) multiplication
    function gf_mult(a, b : integer) return integer is
        variable result : integer := 0;
        variable temp_a : integer := a;
    begin
        for i in 0 to 7 loop
            if (b mod 2) = 1 then
                result := result xor temp_a;
            end if;
            b := b / 2;
            temp_a := temp_a * 2;
            if temp_a >= 256 then
                temp_a := temp_a xor 285; -- Irreducible polynomial (x^8 + x^4 + x^3 + x^2 + 1)
            end if;
        end loop;
        return result;
    end function;

    -- Generator polynomial untuk redundansi 2 byte (GF(2^8))
    constant generator : array (0 to 2) of integer := (1, 2, 3); -- Contoh sederhana

    signal data_bytes : array (0 to 19) of integer;
    signal parity     : array (0 to 1) of integer := (0, 0);

begin
    process(encoded_data)
        variable temp_parity : array (0 to 1) of integer := (0, 0);
    begin
        -- Memecah encoded_data menjadi byte
        for i in 0 to 19 loop
            data_bytes(i) := to_integer(unsigned(encoded_data((i + 1) * 8 - 1 downto i * 8)));
        end loop;

        -- Menghitung parity menggunakan generator polynomial
        for i in 0 to 19 loop
            variable feedback : integer := data_bytes(i) xor temp_parity(0);
            temp_parity(0) := gf_mult(feedback, generator(1)) xor temp_parity(1);
            temp_parity(1) := gf_mult(feedback, generator(2));
        end loop;

        -- Menghasilkan output ECC
        ecc_data(15 downto 8) <= std_logic_vector(to_unsigned(temp_parity(0), 8));
        ecc_data(7 downto 0)  <= std_logic_vector(to_unsigned(temp_parity(1), 8));
    end process;
end Behavioral;
