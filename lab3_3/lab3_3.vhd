library ieee;
use ieee.std_logic_1164.all;

entity lab3_3 is
	port
	(
		SW			: in std_logic_vector(1 downto 0);
		LEDR		: out std_logic_vector(1 downto 0)
	);
end lab3_3;

architecture Behavioral of lab3_3 is
	component Dlatch_f port
	(
		Clk	: in std_logic;
		D		: in std_logic;
		Q		: out std_logic
	);
	end component;
--	
	signal Clk : std_logic;
	signal D : std_logic;
	signal Q : std_logic;
	signal Qm : std_logic;
begin
	Clk <= SW(1);
	D <= SW(0);
	LEDR(0) <= Q;
	MASTER: Dlatch_f port map
	( NOT cLK, D, Qm);
	SLAVE: Dlatch_f port map
	( CLK, Qm, Q);
end Behavioral;



