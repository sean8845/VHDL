library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity t01 is
port(   clk:in std_logic;	
        b:in std_logic_vector(1 downto 0);	
        sw:in std_logic_vector(9 downto 0);
        led:out std_logic_vector(9 downto 0));
end t01;

architecture clock of t01 is
signal clk_out:std_logic_vector(20 downto 1);
signal temp:std_logic_vector(9 downto 0);
begin
   
   process(clk)
   begin
	if clk'event and clk='1' then
		clk_out<=clk_out+1;
	end if;
   end process;
   
   process(clk_out(20),temp,b)
   begin
	if rising_edge(clk_out(20)) then
		temp<=sw;
		case b is
			when "00"=>temp<=sw;
			when "01"=>temp<=temp(8 downto 0)&'0';
			when "10"=>temp<='0'&temp(9 downto 1);
			when "11"=>null;
		end case;											
	end if;
   end process;
   led<=temp;
end clock;
 