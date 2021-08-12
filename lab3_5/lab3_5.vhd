library ieee;
use ieee.std_logic_1164.all;

entity lab3_5 is
	port(
		SW		: in std_logic_vector(7 downto 0);
		KEY	: in std_logic_vector(1 downto 0);
		LEDR	: out std_logic_vector(7 downto 0);
		HEX0	: out std_logic_vector(0 to 6);
		HEX1	: out std_logic_vector(0 to 6);
		HEX2	: out std_logic_vector(0 to 6);
		HEX3	: out std_logic_vector(0 to 6);
		HEX5	: out std_logic_vector(0 to 6);
		HEX4	: out std_logic_vector(0 to 6)
	);
end lab3_5;

architecture Behavioral of lab3_5 is
	component Hex7Segment port
	(
		c		: in std_logic_vector(3 downto 0);
		disp	: out std_logic_vector(0 to 6)
	);
	end component;
	
	component Neg_Reset_key port
	(
		Clk	: in std_logic;
		D		: in std_logic;
		Q		: out std_logic;
		Clr	: in std_logic
	);
	end component;
	component Full8Adder is
	port
	(
		Ai		:	in std_logic_vector(7 downto 0);
		Bi		:	in std_logic_vector(7 downto 0);
		Sum		:	out std_logic_vector(7 downto 0);
		Co : out std_logic
	);
end component;
	signal a ,su,b: std_logic_vector(7 downto 0);
	signal Clk,Clr : std_logic;
begin
	  Clk <= KEY(1);
	  Clr <= KEY(0) ;
	b <= SW;
	bit0 : Neg_Reset_key port map ( Clk, SW(0), a(0), not Clr );
	bit1 : Neg_Reset_key port map ( clk, SW(1), a(1), not Clr );
	bit2 : Neg_Reset_key port map ( Clk, SW(2), a(2), not Clr );
	bit3 : Neg_Reset_key port map ( Clk, SW(3), a(3), not Clr );
	bit4 : Neg_Reset_key port map ( Clk, SW(4), a(4), not Clr);
	bit5 : Neg_Reset_key port map ( Clk, SW(5), a(5), not Clr );
	bit6 : Neg_Reset_key port map ( Clk, SW(6), a(6), not Clr );
	bit7 : Neg_Reset_key port map ( Clk, SW(7), a(7), not Clr );
	
	disp4 : Hex7Segment port map ( a(7 downto 4), HEX3 );
	disp3 : Hex7Segment port map ( a(3 downto 0), HEX2 );
	disp2 : Hex7Segment port map ( SW(7 downto 4), HEX1 );
	disp1 : Hex7Segment port map ( SW(3 downto 0), HEX0 );
	
	F8A : Full8Adder port map	( a, b,su, LEDR(0));
	disp6 : Hex7Segment port map ( su(7 downto 4), HEX5 );
	disp5 : Hex7Segment port map ( su(3 downto 0), HEX4 );
	
end Behavioral;