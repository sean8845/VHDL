library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity Clock is
port (	ck_50M				: in  std_logic;
		Hex1,Hex2,Hex3,Hex4	: out std_logic_vector(7 downto 0)
	 );
end Clock;

architecture a of Clock is
component seg7
port(	bcd : in  std_logic_vector(3 downto 0);
			dot : in  std_logic;
			RBI : in  std_logic;
			RBO : out std_logic;
			seg : out std_logic_vector(7 downto 0)
		);
end component;
type MMSS_array is array(3 downto 0) of std_logic_vector(3 downto 0);
signal MMSS :MMSS_array:=("0011","0100","0011","0110");
signal DF: std_logic_vector(25 downto 1):=(others =>'0');
signal SS : integer range 0 to 59:=34;
signal MM : integer range 0 to 59:=56;

begin
	process(ck_50M)
	begin
		if ck_50M'event and ck_50M ='1' then
			DF<=DF+1;
		end if;
	end process;
	
	process(DF(25))
	begin
		if DF(25)'event and DF(25) = '1' then
            if MM = 59 then
                MM<=0;
                if SS=59 then
                    SS<=0;
                else
                    SS<=SS+1;
                end if;
            else
                MM<=MM+1;

            end if;
		end if;
	end process;
	MMSS(0)<=conv_std_logic_vector((MM /10),4); 
	MMSS(1)<=conv_std_logic_vector((MM mod 10),4); 
	MMSS(2)<=conv_std_logic_vector((SS /10),4); 
	MMSS(3)<=conv_std_logic_vector((SS mod 10),4); 
	segA:seg7 port map( bcd=>MMSS(1),dot=>'1',RBI=>'1',seg=>Hex1 );
	segB:seg7 port map( bcd=>MMSS(0),dot=>'1',RBI=>'1',seg=>Hex2 );
	segC:seg7 port map( bcd=>MMSS(3),dot=>'0',RBI=>'1',seg=>Hex3 );
	segD:seg7 port map( bcd=>MMSS(2),dot=>'1',RBI=>'1',seg=>Hex4 );
end a;