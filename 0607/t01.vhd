library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity t01 is
port(   clk,clr:in std_logic;		
        seg0,seg1,seg2,seg3:out std_logic_vector(0 to 7));
end t01;


architecture clock of t01 is

component SegWithDot
port( 	BCD:in std_logic_vector(3 downto 0 );
		seg:out std_logic_vector(7 downto 0));
end component;

component seg
port( 	BCD:in std_logic_vector(3 downto 0 );
		seg:out std_logic_vector(7 downto 0));
end component;

signal qn:std_logic_vector(15 downto 0):="0011010001010110";
signal clk_out:std_logic_vector(25 downto 0);
begin
   
   process(clk)
   begin
	if clk'event and clk='1' then
		clk_out<=clk_out+1;
	end if;
   end process;
   
   process(clk_out(25),clr)
   begin
	if clr='1' then qn<="0011010001010110";
	elsif rising_edge(clk_out(25)) then
		if  qn>="0101100101011001" then qn<=(others=>'0');
		qn(3 downto 0)<=qn(3 downto 0)+1;
		elsif qn(11 downto 8)="1001" then
			qn(11 downto 8)<="0000";
			qn(15 downto 12)<=qn(15 downto 12)+1;
		elsif qn(7 downto 0)="01011001" then
			qn(7 downto 0)<=(others=>'0');
			qn(11 downto 8)<=qn(11 downto 8)+1;
		elsif qn(3 downto 0)="1001" then
			qn(3 downto 0)<="0000";
			qn(7 downto 4)<=qn(7 downto 4)+1;	
		else qn(3 downto 0)<=qn(3 downto 0)+1;
		end if;
	end if;	
   end process;
      
    segA:SegWithDot port map( bcd=>qn(3 downto 0),seg=>seg0);
	segB:seg port map( bcd=>qn(7 downto 4),seg=>seg1);
    segC:SegWithDot port map( bcd=>qn(11 downto 8),seg=>seg2);
	segD:seg port map( bcd=>qn(15 downto 12),seg=>seg3);	
         
end clock;
 