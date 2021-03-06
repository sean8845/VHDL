library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity t02 is 
    port(sw:in std_logic_vector(7 downto 0);
        led:out std_logic_vector(4 downto 0));--led(4)is carry of the MSB bit
end t02;

architecture FULL_ADD of t02 is
begin 
	led<=('0'&sw(7 downto 4))+sw(3 downto 0);
end FULL_ADD;  