library ieee;
use ieee.std_logic_1164.all;
entity lab2_3 is
port(
		SW : in std_logic_vector(8 downto 0);
		LEDR : out std_logic_vector(4 downto 0)
	);
end entity lab2_3;
architecture bhv of lab2_3 is
component  full_adder is
port(
		a,b,c : in std_logic;
		s,c0 : out std_logic
	);
end component full_adder;
Signal S0,S1,S2,S3,C1,C2,C3,Cout : std_logic;
begin
	F0 : full_adder port map (SW(4) , SW(0) , SW(8) , S0 , C1);
	F1 : full_adder port map (SW(5) , SW(1) , C1 , S1 , C2);
	F2 : full_adder port map (SW(6) , SW(2) , C2 , S2 , C3);
	F3 : full_adder port map (SW(7) , SW(3) , C3 , S3 , Cout);
	LEDR(4) <= Cout;
	LEDR(3) <= S3;
	LEDR(2) <= S2;
	LEDR(1) <= S1;
	LEDR(0) <= S0;
end architecture;