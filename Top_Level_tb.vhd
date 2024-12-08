library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use STD.TEXTIO.ALL;
use work.LUTPackage.ALL;

entity Top_Level_tb is
end Top_Level_tb;

architecture Behavioral of Top_Level_tb is
    component Top_Level is  -- Correct component name
        Port (
            clk        : in std_logic;
            reset      : in std_logic;
            start      : in std_logic;
            input_text : in std_logic_vector(63 downto 0);
            done       : out std_logic;
            qr_matrix  : out std_logic_vector(21*21-1 downto 0)
        );
    end component;

    -- Signals
    signal clk        : std_logic := '0';
    signal reset      : std_logic := '0';
    signal start      : std_logic := '0';
    signal input_text : std_logic_vector(63 downto 0);
    signal done       : std_logic;
    signal qr_matrix  : std_logic_vector(21*21-1 downto 0);

    -- File for output
    file output_file : text open write_mode is "qr_output.txt";

begin
    -- Clock generation
    clk_process : process
    begin
        clk <= '0';
        wait for 5 ns;
        clk <= '1';
        wait for 5 ns;
    end process;

    -- DUT instantiation
    dut : Top_Level port map(
        clk        => clk,
        reset      => reset,
        start      => start,
        input_text => input_text,
        done       => done,
        qr_matrix  => qr_matrix
    );

    -- Test stimulus
    process
        variable line_data : line;
    begin
        -- Reset and start signal
        reset <= '1';
        wait for 10 ns;
        reset <= '0';
        start <= '1';
        input_text <= "0100100001000001010011000100110000110001011010100011001000110011"; -- ASCII of HALLO123
        wait for 10 ns;
        start <= '0';

        -- Wait for completion
        wait until done = '1';

        -- Write output matrix to file
        for i in 0 to 20 loop
            write(line_data, qr_matrix(i*21 to i*21+20));
            writeline(output_file, line_data);
        end loop;

        -- End simulation
        wait;
    end process;

end Behavioral;
