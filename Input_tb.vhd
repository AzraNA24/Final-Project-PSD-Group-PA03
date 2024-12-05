Library ieee;
use ieee.std_logic_1164.all;
use IEEE.numeric_std.ALL;
use STD.TEXTIO.ALL;
Library work;
use.work.LUTPackage.all;

entity input_tb is
end input_tb;

architecture tb of input_tb is

    COMPONENT Input
    port (
        input_nbr : in string(1 to 8);
        output_integer: out int_array
    );
    END component;

    signal input_nbr : string(1 to 8) := "HELLO123";
    signal output_integer: int_array;
    FILE file_output : text open WRITE_MODE is "test_input_number.txt";
    signal clk : std_logic := '1';
    constant clk_period : time := 20 ns;

BEGIN

    -- Instansiasi Unit Under Test (UUT)
    UUT: entity work.Input 
        port map (
            input_char => input_char,
            output_integer => output_integer
        );

    -- Clock Generator
    clk_process : process
    begin
        clk <= '1';
        wait for clk_period / 2;
        clk <= '0';
        wait for clk_period / 2;
    end process clk_process;

    -- Proses untuk mengecek dan mencetak hasil
    check: process (clk)
        variable str: line;
    begin
        if (rising_edge(clk)) then
            -- Cetak output_integer ke file
            for i in output_integer'range loop
                write(str, integer'image(output_integer(i)));
                write(str, " "); -- Untuk memisahkan antar nilai. Memudahkan pengecekan
            end loop;
            writeline(file_output, str);
        end if;
    end process check;

END tb;
