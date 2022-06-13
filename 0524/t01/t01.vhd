library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity t01 is 
    port(button: in std_logic_vector(2 downto 0);
        led:out std_logic_vector(7 downto 0);
        sw:in std_logic_vector(7 downto 0));
end t01;

architecture mux of t01 is
   
begin 
    process(button,sw)
    begin
        case button is
            when "000"=>led<="0000000"&sw(0);
            when "001"=>led<="000000"&sw(1)&'0';    
            when "010"=>led<="00000"&sw(2)&"00";
            when "011"=>led<="0000"&sw(3)&"000";
            when "100"=>led<="000"&sw(4)&"0000";
            when "101"=>led<="00"&sw(5)&"00000";
            when "110"=>led<='0'&sw(6)&"000000";
            when "111"=>led<=sw(7)&"0000000";
        end case;
    end process;
    
end mux;  