library ieee;
use ieee.std_logic_1164.all;

entity lab3_4 is
	port(
		Clk	: in std_logic;
		D		: in std_logic;
		Qa		: out std_logic;
		Qb		: out std_logic;
		Qc		: out std_logic
	);
end lab3_4;

architecture Behavioral of lab3_4 is
	component Gated_Dlatch port(	Clk	: in std_logic;
		D		: in std_logic;
		Q		: out std_logic
	);
	end component;
	
	component Pos_trigg port
	(
		Clk	: in std_logic;
		D		: in std_logic;
		Q		: out std_logic
	);
	end component;
	
	component Neg_trigg port
	(
		Clk	: in std_logic;
		D		: in std_logic;
		Q		: out std_logic
	);
	end component;
begin
	g : Gated_Dlatch port map( Clk, D, Qa );
	p : Pos_trigg port map( Clk, D, Qb );
	n : Neg_trigg port map( Clk, D, Qc );
end Behavioral;