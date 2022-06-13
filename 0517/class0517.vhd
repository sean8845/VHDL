library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity class0517 is 
    port(sw: in std_logic_vector(8 downto 0);
        led0,led1,led2:out std_logic_vector(7 downto 0));
end class0517;

architecture t01 of class0517 is
    type S is array(0 to 7) of std_logic_vector(7 downto 0);
    constant S_code : S :=("11000000","11111001","10100100","10110000",
                           "10011001","10010010","10000010","11111000");
begin 
    process(sw)
    begin
        case sw(8 downto 6) is
            when "000"=>led2<="11111111";                                            
            when "001"=>led2<=S_code(1);    
            when "010"=>led2<=S_code(2);
            when "011"=>led2<=S_code(3);
            when "100"=>led2<=S_code(4);
            when "101"=>led2<=S_code(5);
            when "110"=>led2<=S_code(6);
            when "111"=>led2<=S_code(7);    
        end case;
                
			case sw(5 downto 3) is
				when "000"=>
				if(sw(8 downto 6)="000") then
					led1<="11111111";                                            
				else 
					 led1<=S_code(0);
				end if;				 
				when "001"=>led1<=S_code(1);    
				when "010"=>led1<=S_code(2);
				when "011"=>led1<=S_code(3);
				when "100"=>led1<=S_code(4);
				when "101"=>led1<=S_code(5);
				when "110"=>led1<=S_code(6);
				when "111"=>led1<=S_code(7);    
			end case;
		        
        case sw(2 downto 0) is
            when "000"=>led0<=S_code(0);                                            
            when "001"=>led0<=S_code(1);    
            when "010"=>led0<=S_code(2);
            when "011"=>led0<=S_code(3);
            when "100"=>led0<=S_code(4);
            when "101"=>led0<=S_code(5);
            when "110"=>led0<=S_code(6);
            when "111"=>led0<=S_code(7);    
        end case;
    end process;
    
end t01;  