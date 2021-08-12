library ieee;
use ieee.std_logic_1164.all;

entity Neg_Reset_key is
	port
	(		
		Clk	: in std_logic;
		D		: in std_logic;
		Q		: out std_logic;
		Clr	: in std_logic
	);
end Neg_Reset_key;

architecture Behavioral of Neg_Reset_key is
begin
	process (Clk, D, Clr)
	begin
		if Clk'event and Clk = '0' then
			Q <= D;
		end if;
		if Clr = '1' then
			Q <= '0';
		end if;
	end process;
end Behavioral;