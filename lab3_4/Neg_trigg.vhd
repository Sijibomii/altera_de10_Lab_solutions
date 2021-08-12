library ieee;
use ieee.std_logic_1164.all;

entity Neg_trigg is
	port
	(
		Clk	: in std_logic;
		D		: in std_logic;
		Q		: out std_logic
	);
end Neg_trigg;

architecture Behavioral of Neg_trigg is
begin
	process (Clk, D)
	begin
		if Clk'event and Clk = '0' then
			Q <= D;
		end if;
	end process;
end Behavioral;