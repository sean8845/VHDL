library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity SegWithDot is
port( 	BCD:in std_logic_vector(3 downto 0 );
		seg:out std_logic_vector(7 downto 0));
end SegWithDot;

architecture BCD_seg of SegWithDot is
    begin
       seg<="00000010" when bcd="0000" else
            "10011110" when bcd="0001" else
            "00100100" when bcd="0010" else
            "00001100" when bcd="0011" else
            "10011000" when bcd="0100" else
            "01001000" when bcd="0101" else
            "01000000" when bcd="0110" else
            "00011110" when bcd="0111" else
            "00000000" when bcd="1000" else
            "00001000" when bcd="1001" else
            null ;
    
end BCD_seg;