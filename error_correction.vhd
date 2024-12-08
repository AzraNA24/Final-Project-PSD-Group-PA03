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

    -- Define Galois Field (GF) multiplication function
    function gf_mult(a, b : integer) return integer is
        variable result : integer := 0;
        variable temp_a : integer := a;
        variable temp_b : integer := b;
    begin
        for i in 0 to 7 loop
            if (temp_b mod 2) = 1 then
                result := result xor temp_a; -- Integer XOR operation
            end if;
            temp_b := temp_b / 2;
            temp_a := temp_a * 2;
            if temp_a >= 256 then
                temp_a := temp_a xor 285; -- Polynomial reduction
            end if;
        end loop;
        return result;
    end function;

    -- Type declaration for arrays
    type byte_array is array (0 to 19) of integer;
    type parity_array is array (0 to 1) of integer;

    -- Generator polynomial
    constant generator : parity_array := (2, 3); -- Example coefficients

    -- Signals for data and parity
    signal data_bytes : byte_array := (others => 0);
    signal parity     : parity_array := (others => 0);

begin
    process(encoded_data)
        variable temp_parity : parity_array := (others => 0);
        variable feedback : integer;
    begin
        -- Break encoded_data into bytes
        for i in 0 to 19 loop
            data_bytes(i) := to_integer(unsigned(encoded_data((i + 1) * 8 - 1 downto i * 8)));
        end loop;

        -- Calculate parity using generator polynomial
        for i in 0 to 19 loop
            feedback := data_bytes(i) xor temp_parity(0);
            temp_parity(0) := gf_mult(feedback, generator(1)) xor temp_parity(1);
            temp_parity(1) := gf_mult(feedback, generator(2));
        end loop;

        -- Assign calculated ECC to output
        ecc_data(15 downto 8) <= std_logic_vector(to_unsigned(temp_parity(0), 8));
        ecc_data(7 downto 0)  <= std_logic_vector(to_unsigned(temp_parity(1), 8));
    end process;
end Behavioral;
