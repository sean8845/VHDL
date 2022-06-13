library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity SR is
port(    S,R,En:in std_logic;
         Q:out std_logic
    );
end SR ;

architecture SRFF of SR is
signal Qn ,Q_buf:std_logic;
begin
    Q_buf <=((not S) nand En) nand Qn;
    Qn<=((not R) nand En) nand Q_buf;
    Q<=Q_buf;
end SRFF;