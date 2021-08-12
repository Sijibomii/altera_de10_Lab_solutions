library ieee;
use ieee.std_logic_1164.all;

entity Pos_trigg is
	port
	(
		Clk	: in std_logic;
		D		: in std_logic;
		Q		: out std_logic
	);
end Pos_trigg;

architecture Behavioral of Pos_trigg is
begin
	process (Clk, D)
	begin
		if Clk'event and clk = '1' then
			Q <= D;
		end if;
	end process;
end Behavioral;