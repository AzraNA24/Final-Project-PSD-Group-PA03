-- Testbench for DataEncoding
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_DataEncoding is
end tb_DataEncoding;

architecture behavior of tb_DataEncoding is
    signal input_char : std_logic_vector(7 downto 0);
    signal encoded_data : std_logic_vector(7 downto 0);
    
    -- Component Declaration for the Unit Under Test (UUT)
    component DataEncoding
        Port ( input_char : in std_logic_vector(7 downto 0);
            encoded_data : out std_logic_vector(7 downto 0)
            );
    end component;
begin
    -- Instantiate the Unit Under Test (UUT)
    uut: DataEncoding Port map (
        input_char => input_char,
        encoded_data => encoded_data
    );

    -- Stimulus process
    stim_proc: process
    begin		
        -- Test case 1: '1'
        input_char <= "00110001";  -- Input '1'
        wait for 10 ns;
        assert (encoded_data = "00010001") report "Test failed for input '1'" severity error;

        -- Test case 2: 'A'
        input_char <= "01000001";  -- Input 'A'
        wait for 10 ns;
        assert (encoded_data = "00011010") report "Test failed for input 'A'" severity error;

        -- Test case 3: '$'
        input_char <= "00100100";  -- Input '$'
        wait for 10 ns;
        assert (encoded_data = "00110101") report "Test failed for input '$'" severity error;

        -- Test case 4: Space
        input_char <= "00100000";  -- Input Space
        wait for 10 ns;
        assert (encoded_data = "00110100") report "Test failed for input Space" severity error;

        -- Test case 5: 'Z'
        input_char <= "01011010";  -- Input 'Z'
        wait for 10 ns;
        assert (encoded_data = "00110011") report "Test failed for input 'Z'" severity error;

        -- Finish simulation
        wait;
    end process;
end behavior;
