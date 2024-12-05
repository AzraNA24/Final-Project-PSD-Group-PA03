library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;

package LUTPackage is
    -- Tipe data untuk input 8 bit
    TYPE integer IS RANGE 0 to 255;

    -- Deklarasi fungsi konversi
    function Convert_to_alphanum(inte : in integer) return character;
    function Convert_to_integer(alphanum : in character) return integer;
end package LUTPackage;

package body LUTPackage is
    -- Fungsi konversi dari integer ke alphanumeric (character)
    FUNCTION Convert_to_alphanum(inte : in integer) return character IS
        variable temp_char : character;
    BEGIN
        CASE inte IS
            -- Pemetaan angka [0-9]
            WHEN 0 => temp_char := '0';
            WHEN 1 => temp_char := '1';
            WHEN 2 => temp_char := '2';
            WHEN 3 => temp_char := '3';
            WHEN 4 => temp_char := '4';
            WHEN 5 => temp_char := '5';
            WHEN 6 => temp_char := '6';
            WHEN 7 => temp_char := '7';
            WHEN 8 => temp_char := '8';
            WHEN 9 => temp_char := '9';

            -- Pemetaan huruf [A-Z]
            WHEN 10 => temp_char := 'A';
            WHEN 11 => temp_char := 'B';
            WHEN 12 => temp_char := 'C';
            WHEN 13 => temp_char := 'D';
            WHEN 14 => temp_char := 'E';
            WHEN 15 => temp_char := 'F';
            WHEN 16 => temp_char := 'G';
            WHEN 17 => temp_char := 'H';
            WHEN 18 => temp_char := 'I';
            WHEN 19 => temp_char := 'J';
            WHEN 20 => temp_char := 'K';
            WHEN 21 => temp_char := 'L';
            WHEN 22 => temp_char := 'M';
            WHEN 23 => temp_char := 'N';
            WHEN 24 => temp_char := 'O';
            WHEN 25 => temp_char := 'P';
            WHEN 26 => temp_char := 'Q';
            WHEN 27 => temp_char := 'R';
            WHEN 28 => temp_char := 'S';
            WHEN 29 => temp_char := 'T';
            WHEN 30 => temp_char := 'U';
            WHEN 31 => temp_char := 'V';
            WHEN 32 => temp_char := 'W';
            WHEN 33 => temp_char := 'X';
            WHEN 34 => temp_char := 'Y';
            WHEN 35 => temp_char := 'Z';

            -- Pemetaan simbol
            WHEN 36 => temp_char := '-';
            WHEN 37 => temp_char := '_';

            -- Nilai default untuk input yang tidak valid
            WHEN OTHERS => temp_char := ' ';
        END CASE;
        return temp_char;
    END FUNCTION Convert_to_alphanum;

    -- Fungsi konversi dari alphanumeric ke integer
    FUNCTION Convert_to_integer(alphanum : in character) return integer IS
        variable temp_int : integer;
    BEGIN
        CASE anpha IS
            -- Pemetaan angka [0-9]
            WHEN '0' => temp_int := 0;
            WHEN '1' => temp_int := 1;
            WHEN '2' => temp_int := 2;
            WHEN '3' => temp_char := 3;
            WHEN '4' => temp_char := 4;
            WHEN '5' => temp_char := 5;
            WHEN '6' => temp_char := 6;
            WHEN '7' => temp_char := 7;
            WHEN '8' => temp_char := 8;
            WHEN '9' => temp_char := 9;

            -- Pemetaan huruf [A-Z]
            WHEN 'A' => temp_int := 10;
            WHEN 'B' => temp_int := 11;
            WHEN 'C' => temp_int := 12;
            WHEN 'D' => temp_int := 13;
            WHEN 'E' => temp_int := 14;
            WHEN 'F' => temp_int := 15;
            WHEN 'G' => temp_int := 16;
            WHEN 'H' => temp_int := 17;
            WHEN 'I' => temp_int := 18;
            WHEN 'J' => temp_int := 19;
            WHEN 'K' => temp_int := 20;
            WHEN 'Z' => temp_int := 35;

            -- Pemetaan simbol
            WHEN '-' => temp_int := 36;
            WHEN '_' => temp_int := 37;

            -- Nilai default untuk karakter yang tidak valid
            WHEN OTHERS => temp_int := 255;
        END CASE;
        return temp_int;
    END FUNCTION Convert_to_integer;
end package body LUTPackage;
