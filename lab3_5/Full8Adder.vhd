library ieee;
use ieee.std_logic_1164.all;

entity Full8Adder is
	port
	(
		Ai		:	in std_logic_vector(7 downto 0);
		Bi		:	in std_logic_vector(7 downto 0);
		Sum		:	out std_logic_vector(7 downto 0);
		Co : out std_logic
	);
end Full8Adder;

architecture Behavioral of Full8Adder is
	component Full_Adder 	port
	(
		a	: in std_logic;
		b	: in std_logic;
		ci	: in std_logic;
		co : out std_logic;
		s	: out std_logic
	);
	end component;
	
	signal a : std_logic_vector(7 downto 0);
	signal b : std_logic_vector(7 downto 0);
	signal cin : std_logic;
	signal cout : std_logic_vector(7 downto 0);
	signal s : std_logic_vector(7 downto 0);
begin
--	a <= SW(7 downto 4);
--	b <= SW(3 downto 0);
	cin <= '0';
	a <=Ai;
	b <= Bi;
	
	FA0 : Full_Adder port map
	( a(0), b(0), cin, cout(0), s(0) );
	
	FA1 : Full_Adder port map
	( a(1), b(1), cout(0), cout(1), s(1) );
	
	FA2 : Full_Adder port map
	( a(2), b(2), cout(1), cout(2), s(2) );
	
	FA3 : Full_Adder port map
	( a(3), b(3), cout(2), cout(3), s(3) );
	FA4 : Full_Adder port map
	( a(4), b(4), cout(3), cout(4), s(4) );
	FA5 : Full_Adder port map
	( a(5), b(5), cout(4), cout(5), s(5) );
	FA6 : Full_Adder port map
	( a(6), b(6), cout(5), cout(6), s(6) );
	FA7 : Full_Adder port map
	( a(7), b(7), cout(6), cout(7), s(7) );
	
	co<=cout(7);
	sum <= s;
end Behavioral;