library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity t01 is
port(   button:in std_logic_vector(2 downto 0);
		sw:in std_logic;
		led:out std_logic;
        seg0,seg1:out std_logic_vector(7 downto 0));
end t01;


architecture SRFF of t01 is
component SR
port(    S,R,En:in std_logic;
         Q:buffer std_logic);
end component;

component seg
port( 	BCD:in std_logic_vector(3 downto 0 );
		seg:out std_logic_vector(7 downto 0));
end component;

type S is array (0 to 9)of std_logic_vector(7 downto 0);
signal ck1,ck0:std_logic_vector(3 downto 0);
signal Q:std_logic;

begin
   SR1:SR port map(button(2),button(1),sw,Q);
   led<=Q;
   process(Q)
    begin
        if (sw and button(0))='0' then
            ck0<=(others=>'0');
            ck1<=(others=>'0');
        elsif Q'event and Q='1' then
            if ck0="1001" then
                ck0<=(others=>'0');
                if ck1 ="1001" then
                    ck1<=(others=>'0');
                else
                    ck1<=ck1+1;
                end if;
            else
                ck0<=ck0+1;
            end if;
        end if;
     end process;
      
    segA:seg port map( bcd=>ck0,seg=>seg0);
	segB:seg port map( bcd=>ck1,seg=>seg1);
         
end SRFF;
 