library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.LUTPackage.ALL;

entity Top_Level is
    Port (
        clk        : in std_logic; 
        reset      : in std_logic; 
        start      : in std_logic; 
        input_text : in std_logic_vector(63 downto 0); 
        done       : out std_logic; 
        qr_matrix  : out std_logic_vector(21*21-1 downto 0) 
    );
end Top_Level;

architecture Behavioral of Top_Level is
    -- FSM States
    type state_type is (IDLE, ENCODING, ECC_GENERATION, MATRIX_GENERATION, MASKING, OUTPUT);
    signal state, next_state : state_type;

    -- Internal signals
    signal encoded_data  : std_logic_vector(159 downto 0);
    signal ecc_data      : std_logic_vector(39 downto 0);
    signal raw_matrix    : std_logic_vector(21*21-1 downto 0);
    signal masked_matrix : std_logic_vector(21*21-1 downto 0);
    signal write_ready   : std_logic;

begin
    -- State transition logic
    process(clk, reset)
    begin
        if reset = '1' then
            state <= IDLE;
        elsif rising_edge(clk) then
            state <= next_state;
        end if;
    end process;

    process(state, start, write_ready)
    begin
        case state is
            when IDLE =>
                if start = '1' then
                    next_state <= ENCODING;
                else
                    next_state <= IDLE;
                end if;

            when ENCODING =>
				encoder_inst : data_encoder port map(
            		input_text => input_text,
            		encoded_data => encoded_data
				);
                next_state <= ECC_GENERATION;

            when ECC_GENERATION =>
				ecc_inst : error_correction port map(
                	encoded_data => encoded_data,
                	ecc_data => ecc_data
            	);
                next_state <= MATRIX_GENERATION;

            when MATRIX_GENERATION =>
                -matrix_inst : matrix_generator port map(
					encoded_data => encoded_data,
					ecc_data => ecc_data,
					raw_matrix => raw_matrix
				);
                next_state <= MASKING;

            when MASKING =>
				masking_inst : masking port map(
                	raw_matrix => raw_matrix,
                	masked_matrix => qr_matrix
            	);
                next_state <= OUTPUT;

            when OUTPUT =>
                if write_ready = '1' then
                    next_state <= IDLE;
                else
					qr_matrix <= qr_matrix;
					next_state <= OUTPUT;
                end if;

            when others =>
                next_state <= IDLE;
        end case;
    end process;

    -- Output logic
    done <= '1' when state = OUTPUT else '0';
    qr_matrix <= masked_matrix;

end Behavioral;
